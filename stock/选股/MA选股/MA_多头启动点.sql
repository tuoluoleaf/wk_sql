-- MA 多头启动点
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       sbi.industry_name,
       smaCurrent.trade_date,
       (select round((t2.close_price - t1.open_price) / t1.open_price * 100, 2)
        from stock_trade_dn t1,
             stock_trade_dn t2
        where t1.stock_code = smaCurrent.stock_code
          and t1.trade_date = get_trade_day(smaCurrent.trade_date, 21)
          and t2.stock_code = smaCurrent.stock_code
          and t2.trade_date = (select max(t3.trade_date)
                               from stock_trade_dn t3
                               where t3.stock_code = smaCurrent.stock_code
                                 and t3.trade_date <= get_trade_day(smaCurrent.trade_date, 10))) as sumZd,
     (select round((min(t2.close_price) - t1.open_price) / t1.open_price * 100, 2)
        from stock_trade_dn t1,
             stock_trade_dn t2
        where t1.stock_code = smaCurrent.stock_code
          and t1.trade_date = get_trade_day(smaCurrent.trade_date, 1)
          and t2.stock_code = smaCurrent.stock_code
          and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 10)) as sumMinZd,
       tradeCurrent.zd,
       smaCurrent.ma5,
       smaCurrent.ma20,
       smaCurrent.ma200
from stock_ma_dn smaCurrent,
     stock_ma_dn smaBefore,
     stock_trade_dn tradeCurrent,
     stock_base_info sbi
where 1 = 1
#   and smaCurrent.trade_date = get_trade_day(current_date, -1)
#   and smaCurrent.trade_date = date'2023-06-09'
  and smaCurrent.trade_date >= date'2023-09-01'
  and smaCurrent.trade_date <= date'2023-10-01'
  and smaBefore.stock_code = smaCurrent.stock_code
  and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)

  -- ma
    and smaCurrent.ma5 >= smaCurrent.ma10
  and smaCurrent.ma10 >= smaCurrent.ma20
#   and smaCurrent.ma20 > smaCurrent.ma200
  and !(smaBefore.ma5 >= smaBefore.ma10 and smaBefore.ma10 >= smaBefore.ma20)

  -- 今天交易
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date
  and tradeCurrent.zd > -1
  and tradeCurrent.zd < 11
  and tradeCurrent.close_price >= tradeCurrent.open_price
  and tradeCurrent.close_price >= 6
  and tradeCurrent.trade_num >= 30000
  -- 市值 [50亿，300亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 50
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 100000000 * 300

-- 行业
  and sbi.stock_code = smaCurrent.stock_code
order by smaCurrent.trade_date desc, sbi.industry_name desc
;






