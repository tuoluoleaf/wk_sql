



-- MACD数据
select trade_date, count(0)
from stock_macd_dn
group by trade_date
order by trade_date desc
;


-- 股票交易数据
select trade_date, count(0)
from stock_trade_dn
group by trade_date
order by trade_date desc
;


-- MACD分析数据
select trade_date, count(0)
from stock_macd_analyze
group by trade_date
order by trade_date desc
;
