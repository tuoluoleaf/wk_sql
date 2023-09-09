-- 股票交易数据
select trade_date, count(0)
from stock_trade_dn
group by trade_date
order by trade_date desc
;


-- MACD数据
select trade_date, count(0)
from stock_macd_dn
group by trade_date
order by trade_date desc
;


select t1.*
from stock_base_info t1
where t1.stock_code not in (select distinct stock_code from stock_trade_dn)
;

select stock_code, avg(trade_num) from stock_trade_dn group by stock_code having avg(trade_num) >= 50000;

