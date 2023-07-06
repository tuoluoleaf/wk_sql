
-- 股票交易
select std.id,
       std.stock_code,
       std.stock_name,
       std.trade_date,
       std.open_price,
       std.close_price,
       std.highest_price,
       std.lowest_price,
       std.trade_num,
       std.trade_money,
       std.zf,
       std.hs,
       std.zd,
       std.zde,
       smd.macd
from stock_trade_dn std
         left join stock_macd_dn smd on smd.stock_code = std.stock_code and smd.trade_date = std.trade_date
where std.stock_code = ${stockCode} -- 002534
order by std.trade_date
;



-- MACD分析
with tmp as (select std1.zd + std2.zd as t_sum,
                    std1.zd           as t_1,
                    std2.zd           as t_2,
                    sbi.industry_name,
                    sma.*
             from stock_macd_analyze sma
                      left join  stock_base_info sbi on sbi.stock_code = sma.stock_code
                      left join stock_trade_dn std1 on std1.stock_code = sma.stock_code and
                                                       std1.trade_date = get_trade_day(sma.trade_date, 1)
                      left join stock_trade_dn std2 on std2.stock_code = sma.stock_code and
                                                       std2.trade_date = get_trade_day(sma.trade_date, 2)
             where sma.trade_date = get_trade_day(current_date, -2)
               and sma.find_point_date = sma.trade_date
#                and sma.macd <= 0.2
#                and sma.zd <= 5
               and start_point_date is not null)

select *
from tmp
;

