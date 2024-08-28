select trade.stock_code,
       trade.stock_name,
       sbi.industry_name,
       trade.trade_date,
       trade.close_price,
       tradeB3.zd,
       tradeB2.zd,
       tradeB1.zd,
       trade.zd,
       tradeA1.zd
from stock_trade_dn trade,
     stock_trade_dn tradeA1,
     stock_trade_dn tradeB1,
     stock_trade_dn tradeB2,
     stock_trade_dn tradeB3,
     stock_base_info sbi
where 1 = 1
  -- 排除：创业板、科创板
  and (trade.stock_code not like '30%' and trade.stock_code not like '688%')
  and sbi.stock_code = trade.stock_code
  and trade.trade_date >= date'2024-08-01'
  and trade.trade_date < date'2024-09-01'

  -- after
  and tradeA1.stock_code = trade.stock_code
  and tradeA1.trade_date = get_trade_day(trade.trade_date, 1)

  -- before
  and tradeB1.stock_code = trade.stock_code
  and tradeB1.trade_date = get_trade_day(trade.trade_date, -1)
  and tradeB2.stock_code = trade.stock_code
  and tradeB2.trade_date = get_trade_day(trade.trade_date, -2)
  and tradeB3.stock_code = trade.stock_code
  and tradeB3.trade_date = get_trade_day(trade.trade_date, -3)

  -- 一进二看预期：非板 ->  板 -> 板  -> 预期 --> ?
  and tradeB3.zd < 9.7
  and tradeB2.zd > 9.7
  and tradeB1.zd > 9.7
order by trade.trade_date desc, sbi.industry_name
;




