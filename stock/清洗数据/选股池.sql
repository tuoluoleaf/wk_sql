
-- 选股池数据
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
       gtThreePercentNum,
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
              from stock_trans_red_analyze stra1,
                   stock_macd_dn smd1
              where stra1.stock_code = stra.stock_code
                and stra1.end_point_date is not null
                and stra1.peek_sum_zd >= 3
                and smd1.stock_code = stra1.stock_code
                and smd1.trade_date = stra1.start_point_date
                and smd1.macd <= 0.2)           as gtThreePercentNum,
             (select count(0)
              from stock_trans_red_analyze stra2,
                   stock_macd_dn smd2
              where stra2.stock_code = stra.stock_code
                and stra2.end_point_date is not null
                and smd2.stock_code = stra2.stock_code
                and smd2.trade_date = stra2.start_point_date
                and smd2.macd <= 0.2) as analyzetotalNum
      from stock_trans_red_analyze stra,
           stock_trade_dn std
               left join stock_base_info sbi on sbi.stock_code = std.stock_code
      where stra.start_point_date = get_trade_day(current_date, -1)
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
              from stock_macd_analyze sma1,
                   stock_macd_dn smd1
              where sma1.stock_code = sma.stock_code
                and sma1.end_point_date is not null
                and sma1.peek_sum_zd >= 3
                and smd1.stock_code = sma1.stock_code
                and smd1.trade_date = sma1.start_point_date
                and smd1.macd <= 0.2)   as gtThreePercentNum,
             (select count(0)
              from stock_macd_analyze sma2,
                   stock_macd_dn smd2
              where sma2.stock_code = sma.stock_code
                and sma2.end_point_date is not null
                and smd2.stock_code = sma2.stock_code
                and smd2.trade_date = sma2.start_point_date
                and smd2.macd <= 0.2) as analyzetotalNum
      from stock_macd_analyze sma,
           stock_trade_dn std
               left join stock_base_info sbi on sbi.stock_code = std.stock_code
      where sma.start_point_date = get_trade_day(current_date, -1)
        and std.stock_code = sma.stock_code
        and std.trade_date = sma.trade_date
        and std.trade_num >= 80000
        and std.close_price >= 10

      order by industryName) tmp
order by industryName
;


-- 选股池：筛选数据
update stock_choice_filter
set stock_code    = replace(replace(trim(stock_code), '\r', ''), ' ', ''),
    stock_name    = replace(replace(replace(trim(stock_name), '\r', ''), ' ', ''), '-U', '')
;


-- 选股筛选数据：入选股池：选股等级
update stock_choice sc
set sc.level = '可选'
where sc.stock_code in (select stock_code from stock_choice_filter scf where scf.trade_date = get_trade_day(current_date, -1))
and sc.trade_date = get_trade_day(current_date, -1)
;