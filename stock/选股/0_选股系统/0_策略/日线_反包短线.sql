select ma.stock_code,
       ma.stock_name,
       sbi.industry_name,
       ma.trade_date,
       trade.close_price,
       trade.zd,
       tradeA1.zd as zd_A1
from
     stock_base_info sbi,
     stock_ma_dn ma,
     stock_trade_dn tradeB1,
     stock_trade_dn trade
     left join stock_trade_dn tradeA1 on tradeA1.stock_code = trade.stock_code and tradeA1.trade_date = get_trade_day(trade.trade_date, 1)
where 1 = 1
  -- 排除：创业板、科创板
  and (ma.stock_code not like '30%' and ma.stock_code not like '688%')
  and sbi.stock_code = trade.stock_code
#   and ma.trade_date = get_trade_day(current_date, -1)
  and ma.trade_date >= date'2024-08-01'
  and ma.trade_date < date'2024-09-01'
  and trade.stock_code = ma.stock_code
  and trade.trade_date = ma.trade_date
  -- before
  and tradeB1.stock_code = ma.stock_code
  and tradeB1.trade_date = get_trade_day(ma.trade_date, -1)

  -- 反包
  and tradeB1.open_price > tradeB1.close_price
  and trade.close_price >= tradeB1.open_price
  and trade.open_price <= tradeB1.close_price

  -- 限定
#   and trade.close_price > 5
  and trade.zd > 1
  and trade.zd < 9
  and tradeB1.zd <= -3

  -- 流通市值[50亿, 1000亿)
  and (trade.trade_money / trade.hs * 100) >= 100000000 * 20
#   and (trade.trade_money / trade.hs * 100) < 100000000 * 1000

order by ma.trade_date desc, sbi.industry_name
;




