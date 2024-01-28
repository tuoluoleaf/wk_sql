-- MA_5&60_下穿上
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       sbi.industry_name,
       smaCurrent.trade_date,
       smaCurrent.ma5,
       smaCurrent.ma200
from stock_ma_dn smaCurrent,
     stock_ma_dn smaBefore,
     stock_trade_dn tradeCurrent,
     stock_trade_dn tradeBefore,
     stock_base_info sbi
where 1 = 1
-- 排除：创业板、科创板
  and (smaCurrent.stock_code not like '30%' and smaCurrent.stock_code not like '688%')
#   and smaCurrent.trade_date = get_trade_day(current_date, -1)
  and smaCurrent.trade_date >= date '2024-01-01'
  and smaCurrent.trade_date  < date '2025-01-01'
  and smaBefore.stock_code = smaCurrent.stock_code
  and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)
-- ma
  and (tradeCurrent.open_price + tradeCurrent.close_price) / 2 > smaCurrent.ma200
  and (tradeBefore.open_price + tradeBefore.close_price) / 2 < smaBefore.ma200
  and smaCurrent.ma200 < smaBefore.ma200

-- 昨天交易
  and tradeBefore.stock_code = smaCurrent.stock_code
  and tradeBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)
  and tradeBefore.trade_num <= tradeCurrent.trade_num

-- 今日交易
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date
  and tradeCurrent.zd > -1
  and tradeCurrent.zd < 5
  and tradeCurrent.close_price >= tradeCurrent.open_price
  and tradeCurrent.close_price >= 6
  and tradeCurrent.trade_num >= 3 * 10000
-- 市值 [50亿，300亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 50
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 100000000 * 3000

-- 行业
  and sbi.stock_code = smaCurrent.stock_code
order by smaCurrent.trade_date desc, sbi.industry_name desc
;



