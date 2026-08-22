select trade.stock_code,
       trade.stock_name,
       sbi.industry_name,
       trade.trade_date,
       trade.close_price,
       tradeB3.zd,
       tradeB2.zd,
       tradeB1.zd,
       trade.zd
from stock_trade trade,
     stock_trade tradeB1,
     stock_trade tradeB2,
     stock_trade tradeB3,
     stock_base_info sbi
where 1 = 1
  -- 排除：创业板、科创板
  and (trade.stock_code not like '30%' and trade.stock_code not like '688%')
  and sbi.stock_code = trade.stock_code
  and trade.trade_date >= date'2024-08-01'
  and trade.trade_date < date'2024-09-01'

  -- before
  and tradeB1.stock_code = trade.stock_code
  and tradeB1.trade_date = get_trade_day(trade.trade_date, -1)
  and tradeB2.stock_code = trade.stock_code
  and tradeB2.trade_date = get_trade_day(trade.trade_date, -2)
  and tradeB3.stock_code = trade.stock_code
  and tradeB3.trade_date = get_trade_day(trade.trade_date, -3)

  -- 二进三看突破：非板 ->  板 -> 板 -> 预板 --> ?
  and tradeB3.zd < 9.7
  and tradeB2.zd > 9.7
  and tradeB1.zd > 9.7
order by trade.trade_date desc, sbi.industry_name
;




