

--  mac分析：波段
select sma.stock_code,
       sma.stock_name,
       sma.trade_date,
       sma.macd,
       sma.zd,
       sma.sum_zd,
       sma.peek_sum_zd,
       sma.find_point_date,
       sma.start_point_date,
       sma.end_point_date,
       sma.will
from stock_macd_analyze sma
where sma.end_point_date is not null
;
