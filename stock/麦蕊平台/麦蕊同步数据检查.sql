-- 股票交易数据
select trade_date, count(0)
from stock_trade_dn
group by trade_date
order by trade_date desc
;


-- 股票MA数据
select trade_date, count(0)
from stock_ma_dn
group by trade_date
order by trade_date desc
;



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