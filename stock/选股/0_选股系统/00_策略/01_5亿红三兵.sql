select ma.stock_code,
       ma.stock_name,
       sbi.industry_name,
       ma.trade_date,
       trade.close_price,
       trade.zd,
       ma.ma5
from stock_ma_dn ma,
     stock_trade_dn trade,
     stock_ma_dn maB1,
     stock_trade_dn tradeB1,
     stock_trade_dn tradeB2,
     stock_base_info sbi
where 1 = 1
  -- 排除：创业板、科创板
  and (ma.stock_code not like '30%' and ma.stock_code not like '688%')
  and sbi.stock_code = trade.stock_code
  and ma.trade_date = get_trade_day(current_date, -3)
#   and ma.trade_date >= date'2024-09-01'
#   and ma.trade_date < date'2024-10-01'
  and trade.stock_code = ma.stock_code
  and trade.trade_date = ma.trade_date
  -- before
  and maB1.stock_code = ma.stock_code
  and maB1.trade_date = get_trade_day(ma.trade_date, -1)
  and tradeB1.stock_code = ma.stock_code
  and tradeB1.trade_date = get_trade_day(ma.trade_date, -1)
  and tradeB2.stock_code = ma.stock_code
  and tradeB2.trade_date = get_trade_day(ma.trade_date, -2)

  -- 绿 -> 红 -> 红 -> 预计红
  and tradeB2.close_price < tradeB2.open_price
  and tradeB1.close_price > tradeB1.open_price
  and trade.close_price > trade.open_price
  and tradeB2.zd < 0
  and tradeB1.zd > 0
  and trade.zd > 0

  -- 5亿量
  and tradeB1.trade_money >= 5 * 100000000
  and trade.trade_money >= 5 * 100000000

  -- ma5
  and (tradeB1.open_price <= maB1.ma5 or trade.open_price <= ma.ma5)

  -- 市值[500亿, +)
  and (trade.trade_money / trade.hs * 100) >= 100000000 * 500
order by ma.trade_date desc, sbi.industry_name
;




