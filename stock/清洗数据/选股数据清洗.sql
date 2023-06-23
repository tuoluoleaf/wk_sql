insert into stock_choice
(stock_code, stock_name, trade_date, analyze_source, macd, zd, find_point_date, start_point_date, will, industry_name, trade_num,
 close_price, gt_three_percent_rate, analyze_total_num)
select stockCode,
       stockName,
       tradeDate,
       analyzeSource,
       macd,
       zd,
       findPointDate,
       startPointDate,
       will,
       industryName,
       tradeNum,
       closePrice,
       gtThreePercentNum/analyzetotalNum as gtThreePercentRate,
       analyzetotalNum
from (select stra.stock_code                          as stockCode,
             stra.stock_name                          as stockName,
             stra.trade_date                          as tradeDate,
             '转红分析'                               as analyzeSource,
             stra.macd                                as macd,
             stra.zd                                  as zd,
             null                                     as findPointDate,
             stra.start_point_date                    as startPointDate,
             stra.will                                as will,
             sbi.industry_name                        as industryName,
             std.trade_num                            as tradeNum,
             std.close_price                          as closePrice,
             (select count(0)
              from stock_trans_red_analyze stra1
              where stra1.stock_code = stra.stock_code
                and stra1.end_point_date is not null
                and stra1.peek_sum_zd >= 3)           as gtThreePercentNum,
             (select count(0)
              from stock_trans_red_analyze stra3
              where stra3.stock_code = stra.stock_code
                and stra3.end_point_date is not null) as analyzetotalNum
      from stock_trans_red_analyze stra,
           stock_trade_dn std
               left join stock_base_info sbi on sbi.stock_code = std.stock_code
      where stra.start_point_date = get_trade_day(current_date, 0)
        and std.stock_code = stra.stock_code
        and std.trade_date = stra.trade_date
        and std.trade_num >= 80000
        and std.close_price >= 10
      union all
      select sma.stock_code                                                                                                            as stockCode,
             sma.stock_name                                                                                                            as stockName,
             sma.trade_date                                                                                                            as tradeDate,
             'macd分析'                                                                                                                as analyzeSource,
             sma.macd                                                                                                                  as macd,
             sma.zd                                                                                                                    as zd,
             sma.find_point_date                                                                                                       as findPointDate,
             sma.start_point_date                                                                                                      as startPointDate,
             sma.will                                                                                                                  as will,
             sbi.industry_name                                                                                                         as industryName,
             std.trade_num                                                                                                             as tradeNum,
             std.close_price                                                                                                           as closePrice,
             (select count(0)
              from stock_macd_analyze sma1
              where sma1.stock_code = sma.stock_code
                and sma1.end_point_date is not null
                and sma1.peek_sum_zd >= 3)   as gtThreePercentNum,
             (select count(0) from stock_macd_analyze sma3 where sma3.stock_code = sma.stock_code and sma3.end_point_date is not null) as analyzetotalNum
      from stock_macd_analyze sma,
           stock_trade_dn std
               left join stock_base_info sbi on sbi.stock_code = std.stock_code
      where sma.start_point_date = get_trade_day(current_date, 0)
        and std.stock_code = sma.stock_code
        and std.trade_date = sma.trade_date
        and std.trade_num >= 80000
        and std.close_price >= 10
      order by industryName) tmp
order by industryName
