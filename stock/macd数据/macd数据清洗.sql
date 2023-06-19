-- 更新peek_sum_zd
update stock_macd_analyze
set peek_sum_zd = sum_zd - zd
where end_point_date is not null
;


-- 更新sum_zd
update stock_macd_analyze sma
set sma.sum_zd = (select round((trade2.close_price - trade1.close_price) * 100 / trade1.close_price, 2) as sumZd
                  from stock_trade_dn trade1,
                       stock_trade_dn trade2
                  where trade1.stock_code = sma.stock_code
                    and trade1.trade_date = sma.start_point_date

                    and trade2.stock_code = sma.stock_code
                    and trade2.trade_date = sma.end_point_date)
where sma.end_point_date is not null
;


select sma.stock_code,
       sma.stock_name,
       sma.trade_date,
       sma.start_point_date,
       sma.end_point_date,
       round((trade2.close_price - trade1.close_price)*100/trade1.close_price, 2) as sumZd
from stock_macd_analyze sma,
     stock_trade_dn trade1,
     stock_trade_dn trade2
where sma.end_point_date is not null
and trade1.stock_code = sma.stock_code
and trade1.trade_date = sma.start_point_date

and trade2.stock_code = sma.stock_code
and trade2.trade_date = sma.end_point_date
;