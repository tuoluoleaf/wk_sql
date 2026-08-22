select trade.trade_date,
       trade.stock_code,
       trade.stock_name,
       sbi.industry_name,
       trade.zd,
       tradeA1.zd,
       tradeA2.zd
from stock_trade trade,
     stock_trade tradeB1,
     stock_trade tradeA1,
     stock_trade tradeA2,
     stock_base_info sbi
where 1 = 1
  -- 排除：创业板、科创板
  and (trade.stock_code not like '30%' and trade.stock_code not like '688%' and trade.stock_code not like '8%' and trade.stock_code not like '4%')
  and sbi.stock_code = trade.stock_code
  and trade.trade_date >= date'2025-05-01'
  and trade.trade_date < date'2025-06-01'

  and tradeB1.stock_code = trade.stock_code
  and tradeB1.trade_date = get_trade_day(trade.trade_date, -1)
  and tradeA1.stock_code = trade.stock_code
  and tradeA1.trade_date = get_trade_day(trade.trade_date, 1)
  and tradeA2.stock_code = trade.stock_code
  and tradeA2.trade_date = get_trade_day(trade.trade_date, 2)


  and tradeB1.zd < 9.7
  and trade.zd > 9.7
  and tradeA1.zd < -6
order by trade.trade_date desc, sbi.industry_name
;




