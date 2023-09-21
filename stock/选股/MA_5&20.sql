-- MA
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       smaCurrent.trade_date,
       tradeCurrent.zd,
       tradeCurrent.hs,
       tradeCurrent.close_price,
       tradeCurrent.trade_num / 10000 as trade_num,
       smaCurrent.ma5,
       smaCurrent.ma20,
       smaCurrent.ma200
from stock_ma_dn smaCurrent,
     stock_ma_dn smaBefore,
     stock_trade_dn tradeCurrent
where 1 = 1
  and smaCurrent.trade_date = get_trade_day(current_date, -0)
#   and smaCurrent.trade_date = date'2023-08-04'
#   and smaCurrent.trade_date >= date'2023-09-01'
#   and smaCurrent.trade_date <= date'2023-10-01'
  and smaBefore.stock_code = smaCurrent.stock_code
  and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)

  -- ma
  and smaCurrent.ma5 > smaCurrent.ma20
  and smaCurrent.ma20 > smaCurrent.ma200
  and smaBefore.ma5 < smaBefore.ma20

  -- 今天交易
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date
#   and tradeCurrent.zd > -1
#   and tradeCurrent.zd < 8
#   and tradeCurrent.close_price >= tradeCurrent.open_price
  and tradeCurrent.close_price >= 6
  and tradeCurrent.trade_num >= 30000
  -- 市值 [50亿，300亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 30
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 100000000 * 300

order by smaCurrent.trade_date desc
;



