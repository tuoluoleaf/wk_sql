select distinct trade.stock_code,
                trade.stock_name,
                sbi.industry_name
from stock_trade trade,
     stock_trade tradeB1,
     stock_base_info sbi
where 1 = 1
  -- 排除：创业板、科创板
  and (trade.stock_code not like '30%' and trade.stock_code not like '688%')
  and sbi.stock_code = trade.stock_code
#   and trade.trade_date = get_trade_day(current_date, -20)
  and trade.trade_date >= date'2024-05-01'
  and trade.trade_date < date'2024-06-01'

  -- before
  and tradeB1.stock_code = trade.stock_code
  and tradeB1.trade_date = get_trade_day(trade.trade_date, -1)

  -- 量价热度
  and trade.zd > 5
  and tradeB1.zd > 5
  -- 10亿量
  and trade.trade_money >= 10 * 100000000
  and tradeB1.trade_money >= 10 * 100000000
;




