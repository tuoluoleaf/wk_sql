-- MA 多头连续
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       sbi.industry_name,
       smaCurrent.trade_date                              as startDate,
       (select max(t2.trade_date)
        from stock_ma_dn t2
        where t2.stock_code = smaCurrent.stock_code
          and t2.trade_date >= smaCurrent.trade_date
          and t2.ma5 <= t2.ma200)                         as endDate,
       tradeCurrent.zd,
       (select sum(t.zd)
        from stock_trade_dn t
        where smaCurrent.stock_code = t.stock_code
          and t.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t.trade_date <= (select ifnull(min(t2.trade_date), get_trade_day(current_date, 0))
                               from stock_ma_dn t2
                               where t2.stock_code = smaCurrent.stock_code
                                 and t2.trade_date >= smaCurrent.trade_date
                                 and t2.ma5 <= t2.ma200)) as sumZd,
       tradeCurrent.hs,
       tradeCurrent.close_price,
       tradeCurrent.trade_num / 10000                     as trade_num,
       smaCurrent.ma5,
       smaCurrent.ma200
from stock_ma_dn smaCurrent,
     stock_ma_dn smaBefore,
     stock_base_info sbi,
     stock_trade_dn tradeBefore,
     stock_trade_dn tradeCurrent
where 1 = 1
#   and smaCurrent.trade_date = get_trade_day(current_date, -5)
#   and smaCurrent.trade_date = date'2023-08-04'
  and smaCurrent.trade_date >= date'2023-09-01'
  and smaCurrent.trade_date <= date'2023-10-01'
  and smaBefore.stock_code = smaCurrent.stock_code
  and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)
  -- 行业
  and sbi.stock_code = smaCurrent.stock_code

  -- ma
  and smaCurrent.ma5 >= smaCurrent.ma200
  and smaBefore.ma5 < smaBefore.ma200


  -- 昨天交易
  and tradeBefore.stock_code = smaCurrent.stock_code
  and tradeBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)
#   and tradeBefore.trade_num <= tradeCurrent.trade_num

  -- 今天交易
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date
  and tradeCurrent.zd > 1
  and tradeCurrent.zd < 8
  and tradeCurrent.close_price >= tradeCurrent.open_price
  and tradeCurrent.close_price >= 6
  and tradeCurrent.trade_num >= 30000
  -- 市值 [50亿，300亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 30 * 100000000
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 300 * 100000000

order by smaCurrent.trade_date desc
;



