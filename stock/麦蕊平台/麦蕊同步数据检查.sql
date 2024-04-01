-- 股票交易数据
select trade_date, count(0)
from stock_trade_dn
group by trade_date
order by trade_date desc
;


-- 股票MA_DN数据
select trade_date, count(0)
from stock_ma_dn
group by trade_date
order by trade_date desc
;

