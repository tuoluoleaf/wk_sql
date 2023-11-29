-- 股票交易
select base.stock_code,
       base.stock_name,
       base.industry_name,
       trade.trade_date,
       trade.close_price,
       trade.zd
from stock_trade_dn trade,
     stock_base_info base
where trade.trade_date >= date'2023-10-01'
and trade.trade_date <= date'2023-12-01'
and trade.stock_code = base.stock_code
and base.industry_name = '燃气'
order by trade.stock_code, trade.trade_date desc
;