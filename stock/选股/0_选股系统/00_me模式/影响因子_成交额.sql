select trade.trade_date,
       trade.stock_code,
       trade.stock_name,
       round(trade.trade_money / 100000000, 0) as trade_money_亿
from stock_trade_dn trade
where 1 = 1
  and (trade.stock_code not like '30%' and trade.stock_code not like '688%')
#   and trade.trade_date = date'2024-08-19'
  and trade.trade_date >= date'2024-07-01'
  and trade.trade_date < date'2024-08-01'

  -- 10亿量
  and trade.trade_money >= 20 * 100000000
  -- 市值[50亿, 1000亿)
  and (trade.trade_money / trade.hs * 100) >= 100000000 * 50
  and (trade.trade_money / trade.hs * 100) < 100000000 * 1000
order by trade.trade_date desc, trade.trade_money desc
# limit 20
;


