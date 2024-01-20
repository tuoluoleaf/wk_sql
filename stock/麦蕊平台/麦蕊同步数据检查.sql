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

-- 股票MA_WN数据
select trade_date, count(0)
from stock_ma_wn
group by trade_date
order by trade_date desc
;

delete from stock_ma_wn where trade_date = date'2024-01-15';
delete from stock_ma_wn where trade_date >= date'2024-01-15' and trade_date <= date'2024-01-18';


-- 基金交易数据
select trade_date, count(0)
from fund_trade_dn
group by trade_date
order by trade_date desc
;

-- 基金MA数据
select trade_date, count(0)
from fund_ma_dn
group by trade_date
order by trade_date desc
;
