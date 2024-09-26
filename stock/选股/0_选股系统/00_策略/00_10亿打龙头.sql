



select distinct trade.stock_code,
       trade.stock_name
from   stock_trade_dn trade
where  (trade.stock_code not like '30%' and trade.stock_code not like '688%')
  and trade.trade_date >= date'2024-07-01'
  and trade.trade_date < date'2024-08-01'

  -- 涨停
  and trade.zd > 9.7
  -- 10亿量
  and trade.trade_money >= 10 * 100000000
  -- 市值[30亿, 1000亿)
  and (trade.trade_money / trade.hs * 100) >= 100000000 * 30
  and (trade.trade_money / trade.hs * 100) < 100000000 * 1000

;




