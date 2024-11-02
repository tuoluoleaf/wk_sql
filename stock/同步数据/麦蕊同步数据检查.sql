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


-- 股票最新成交明细
select trade_date,
       count(0) as count_
from stock_trade_detail
group by trade_date
order by trade_date desc;



