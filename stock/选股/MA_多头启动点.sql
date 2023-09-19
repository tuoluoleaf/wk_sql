-- MA 多头启动点
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       sbi.industry_name,
       smaCurrent.trade_date,
       tradeCurrent.zd,
       tradeCurrent.hs,
       stdAfter.zd,
       stdAfter.hs,
       (select sum(t.zd)
        from stock_trade_dn t
        where smaCurrent.stock_code = t.stock_code
          and t.trade_date >= get_trade_day(smaCurrent.trade_date, 2)
          and t.trade_date <= get_trade_day(smaCurrent.trade_date, 22)) as sumZd,
       tradeCurrent.close_price,
       tradeCurrent.trade_num / 10000                                  as trade_num,
       smaCurrent.ma5,
       smaCurrent.ma10,
       smaCurrent.ma20
from stock_ma_dn smaCurrent,
     stock_ma_dn smaBefore,
     stock_base_info sbi,
     stock_trade_dn tradeBefore,
     stock_trade_dn tradeCurrent
         left join stock_ma_dn smdAfter on smdAfter.stock_code = tradeCurrent.stock_code and
                                           smdAfter.trade_date = get_trade_day(tradeCurrent.trade_date, 1)
         left join stock_trade_dn stdAfter on stdAfter.stock_code = tradeCurrent.stock_code and
                                              stdAfter.trade_date = get_trade_day(tradeCurrent.trade_date, 1)
where 1 = 1
  and smaCurrent.trade_date = get_trade_day(current_date, -10)
#     and tradeCurrent.trade_date = date'2023-08-21'
#   and smaCurrent.trade_date >= date'2023-08-01'
#   and smaCurrent.trade_date <= date'2023-09-01'
  and smaBefore.stock_code = smaCurrent.stock_code
  and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)

  -- 行业
  and sbi.stock_code = smaCurrent.stock_code

  -- ma
  and smaCurrent.ma5 >= smaCurrent.ma10
  and smaCurrent.ma10 >= smaCurrent.ma20
  and smaCurrent.ma20 > smaCurrent.ma200
  and !(smaBefore.ma5 >= smaBefore.ma10 and smaBefore.ma10 >= smaBefore.ma20)

  -- 昨天交易
  and tradeBefore.stock_code = smaCurrent.stock_code
  and tradeBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)
  and tradeBefore.trade_num <= tradeCurrent.trade_num


  -- 今天交易
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date
  and tradeCurrent.zd > 0
  and tradeCurrent.zd < 8
  and tradeCurrent.close_price >= tradeCurrent.open_price
  and tradeCurrent.close_price >= 8
  and tradeCurrent.trade_num >= 30000
  -- 市值 [50亿，300亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 30
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 100000000 * 300

order by sbi.industry_name
;








