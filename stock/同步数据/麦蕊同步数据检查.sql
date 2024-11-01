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


-- 更新最新流动市值
update stock_base_info base
set base.lt_market_value = (select round(trade.trade_money / trade.hs * 100 / 100000000, 2) from stock_trade_dn trade where trade.stock_code = base.stock_code and trade.trade_date = current_date)

