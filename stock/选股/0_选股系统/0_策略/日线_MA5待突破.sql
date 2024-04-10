-- MA
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       smaCurrent.trade_date,
       sbi.industry_name,
       tradeCurrent.close_price,
       tradeCurrent.zd,
       smaCurrent.ma5,
       smaCurrent.ma200
from stock_ma_dn smaCurrent,
     stock_trade_dn tradeCurrent,
     stock_base_info sbi
where 1 = 1
  and sbi.stock_code = tradeCurrent.stock_code
  -- 排除：创业板、科创板
  and (smaCurrent.stock_code not like '30%' and smaCurrent.stock_code not like '688%')
  and smaCurrent.trade_date = get_trade_day(current_date, -3)
#   and smaCurrent.trade_date >= date'2024-04-09'
#   and smaCurrent.trade_date < date'2025-01-01'
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date

  -- ma5趋势
  and tradeCurrent.open_price < smaCurrent.ma5
  and tradeCurrent.close_price < smaCurrent.ma5

  -- MA200附近 [-0.25, +0.35]
  and tradeCurrent.close_price >= smaCurrent.ma200 * 0.75
  and tradeCurrent.close_price <= smaCurrent.ma200 * 1.35

  -- 成交量3W以上
  and tradeCurrent.trade_num >= 3 * 10000
  -- 股价10以上
  and tradeCurrent.close_price >= 10
  -- 市值[50亿, 1000亿)
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 50
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) < 100000000 * 1000

order by smaCurrent.trade_date desc, sbi.industry_name
;



