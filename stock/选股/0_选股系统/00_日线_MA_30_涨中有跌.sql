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
  and smaCurrent.trade_date = get_trade_day(current_date, -0)
#   and smaCurrent.trade_date >= date'2023-01-01'
#   and smaCurrent.trade_date < date'2023-02-01'
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date

  -- ma && 价格
  and tradeCurrent.open_price > smaCurrent.ma30
  and tradeCurrent.close_price > smaCurrent.ma30
  and tradeCurrent.open_price < smaCurrent.ma5
  and tradeCurrent.close_price < smaCurrent.ma5

  -- 今天交易
  and tradeCurrent.trade_num >= 3 * 10000
  -- 市值 [50亿，300亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 50
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 100000000 * 300

-- 行业
  and sbi.stock_code = smaCurrent.stock_code
order by smaCurrent.trade_date desc, sbi.industry_name desc
;



