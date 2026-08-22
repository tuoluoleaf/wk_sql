select trade.stock_code,
       trade.stock_name,
       sbi.industry_name,
       trade.trade_date,
       trade.close_price,
       tradeB4.zd,
       tradeB3.zd,
       tradeB2.zd,
       tradeB1.zd,
       trade.zd,
       tradeA1.zd
from stock_trade trade,
     stock_trade tradeA1,
     stock_trade tradeB1,
     stock_trade tradeB2,
     stock_trade tradeB3,
     stock_trade tradeB4,
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
  and tradeB4.stock_code = trade.stock_code
  and tradeB4.trade_date = get_trade_day(trade.trade_date, -4)

  -- 三进四：非板 ->  板 -> 板 -> 板 -> 预板 --> ?
  and tradeB4.zd < 9.7
  and tradeB3.zd > 9.7
  and tradeB2.zd > 9.7
  and tradeB1.zd > 9.7
order by trade.trade_date desc, sbi.industry_name
;




