-- MA_5&30_下穿上
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       sbi.industry_name,
       smaCurrent.trade_date,
       tradeCurrent.zd,
       round(((select max(t2.highest_price)
               from stock_trade_dn t2
               where t2.stock_code = smaCurrent.stock_code
                 and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
                 and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 365))
           - tradeCurrent.close_price) / tradeCurrent.close_price * 100, 2) as highestZd,
       round(((select min(t2.lowest_price)
               from stock_trade_dn t2
               where t2.stock_code = smaCurrent.stock_code
                 and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
                 and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 365))
           - tradeCurrent.close_price) / tradeCurrent.close_price * 100, 2) as lowestZd,
       tradeCurrent.close_price,
       smaCurrent.ma5,
       smaCurrent.ma10,
       smaCurrent.ma30,
       smaCurrent.ma60
from stock_ma_wn smaCurrent,
     stock_ma_wn smaBefore,
     stock_trade_dn tradeCurrent,
     stock_base_info sbi
where 1 = 1
  -- 排除：创业板、科创板
  and (smaCurrent.stock_code not like '30%' and smaCurrent.stock_code not like '688%')
  and smaCurrent.trade_date >= date'2024-01-01'
  and smaCurrent.trade_date < date'2025-01-01'
  and smaBefore.stock_code = smaCurrent.stock_code
  and smaBefore.trade_date = (select max(t1.trade_date)
                              from stock_ma_wn t1
                              where t1.stock_code = smaCurrent.stock_code
                                and t1.trade_date < smaCurrent.trade_date)

  -- ma
  and smaCurrent.ma5 >= smaCurrent.ma30
  and smaCurrent.ma5 <= smaCurrent.ma60
  and smaBefore.ma5 < smaBefore.ma30

  -- 今天交易
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date
  and tradeCurrent.zd > -1
  and tradeCurrent.zd < 11
  and tradeCurrent.close_price >= tradeCurrent.open_price
#   and tradeCurrent.close_price >= 10
  and tradeCurrent.trade_num >= 3 * 10000
  -- 市值 [100亿，500亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 100
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 100000000 * 500

-- 行业
  and sbi.stock_code = smaCurrent.stock_code
order by smaCurrent.trade_date desc, sbi.industry_name desc
;


