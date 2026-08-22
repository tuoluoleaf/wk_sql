-- 股票交易数据
select trade_date, count(0)
from stock_trade
group by trade_date
order by trade_date desc
;


select trade_date, count(0)
from stock_zb
group by trade_date
order by trade_date desc
;

select trade_date, count(0)
from stock_zt
group by trade_date
order by trade_date desc
;

select trade_date, count(0)
from stock_dt
group by trade_date
order by trade_date desc
;
