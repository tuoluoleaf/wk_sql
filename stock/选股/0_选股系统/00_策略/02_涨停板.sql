select trade.stock_code,
       trade.stock_name,
       sbi.industry_name,
       trade.trade_date,
       trade.close_price,
       trade.zd
from stock_trade_dn trade,
     stock_base_info sbi
where 1 = 1
  -- 排除：创业板、科创板
  and (trade.stock_code not like '30%' and trade.stock_code not like '688%')
  and sbi.stock_code = trade.stock_code
  and trade.trade_date >= get_trade_day(current_date, -3)
  and trade.trade_date <= get_trade_day(current_date, 0)

  -- 涨停
  and trade.zd > 9.7
  -- 1亿量
#   and trade.trade_money >= 1 * 100000000
  -- 市值[20亿, +)
  and (trade.trade_money / trade.hs * 100) >= 100000000 * 20
order by trade.trade_date desc, sbi.industry_name
;




