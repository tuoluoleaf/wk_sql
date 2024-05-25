-- MA5待突破
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       smaCurrent.trade_date,
       sbi.industry_name,
       tradeCurrent.close_price,
       tradeCurrent.zd,
       smaCurrent.ma10
from stock_ma_dn smaCurrent,
     stock_trade_dn tradeCurrent,
     stock_base_info sbi
where 1 = 1
  and sbi.stock_code = tradeCurrent.stock_code
  -- 排除：创业板、科创板
  and (smaCurrent.stock_code not like '30%' and smaCurrent.stock_code not like '688%')
  and smaCurrent.trade_date = get_trade_day(current_date, -0)
#   and smaCurrent.trade_date >= date'2024-05-20'
#   and smaCurrent.trade_date < date'2025-01-01'
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date


  -- ma30附近缠绕
  and tradeCurrent.close_price >= smaCurrent.ma10
  and tradeCurrent.close_price <= smaCurrent.ma10 * 1.1

  -- 成交量3W以上
  and tradeCurrent.trade_num >= 3 * 10000
  -- 股价10以上
  and tradeCurrent.close_price >= 8
  -- 市值[80亿, 1500亿)
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 80
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) < 100000000 * 1500

order by smaCurrent.trade_date desc, sbi.industry_name
;



