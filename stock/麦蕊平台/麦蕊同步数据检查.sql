-- 股票交易数据
select trade_date, count(0)
from stock_trade_dn
group by trade_date
order by trade_date desc
;


-- MA数据
select trade_date, count(0)
from stock_ma_dn
group by trade_date
order by trade_date desc
;



