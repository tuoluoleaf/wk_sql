-- 查询
select trade.stock_code,
       trade.stock_name,
       sbi.industry_name,
       trade.trade_date,
       trade.close_price,
       trade.zd,
       tradeB1.zd as zd_b1,
       tradeB2.zd as zd_b2
from stock_trade trade,
     stock_trade tradeB1,
     stock_trade tradeB2
         left join stock_base_info sbi on sbi.stock_code = tradeB2.stock_code
where 1 = 1
  -- 排除：创业板、科创板
  and (trade.stock_code not like '30%' and trade.stock_code not like '688%')
#   and trade.trade_date = get_trade_day(current_date, -0)
  and trade.trade_date >= date'2024-07-01'
  and trade.trade_date < date'2025-01-01'

  -- before
  and tradeB1.stock_code = trade.stock_code
  and tradeB1.trade_date = get_trade_day(trade.trade_date, -1)
  and tradeB2.stock_code = trade.stock_code
  and tradeB2.trade_date = get_trade_day(trade.trade_date, -2)

  -- 进二退一
  and tradeB2.close_price = tradeB2.highest_price
  and tradeB2.zd >= 9.9
  and tradeB1.close_price = tradeB1.highest_price
  and tradeB1.zd >= 9.9
  and trade.zd <= 5

order by trade.trade_date desc, sbi.industry_name
;



