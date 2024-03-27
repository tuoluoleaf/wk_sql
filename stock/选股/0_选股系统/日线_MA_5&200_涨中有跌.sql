-- MA_30
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       sbi.industry_name,
       smaCurrent.trade_date,
       tradeCurrent.zd,
       smaCurrent.ma30
from stock_ma_dn smaCurrent,
     stock_trade_dn tradeCurrent,
     stock_base_info sbi
where 1 = 1
  -- 排除：创业板、科创板
  and (smaCurrent.stock_code not like '30%' and smaCurrent.stock_code not like '688%')
#   and smaCurrent.trade_date = get_trade_day(current_date, -0)
  and smaCurrent.trade_date >= date'2024-01-01'
  and smaCurrent.trade_date < date'2025-01-01'
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date

  -- ma5趋势
  and tradeCurrent.open_price < smaCurrent.ma5
  and tradeCurrent.close_price < smaCurrent.ma5
  and tradeCurrent.close_price > smaCurrent.ma200
  and smaCurrent.ma5 > smaCurrent.ma200

  -- 成交量3W以上
  and tradeCurrent.trade_num >= 3 * 10000
  -- 市值[100亿, 1000亿)
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 100
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) < 100000000 * 1000


order by smaCurrent.trade_date desc, sbi.industry_name desc
;



