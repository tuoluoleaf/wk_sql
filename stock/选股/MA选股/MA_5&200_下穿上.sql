-- MA_5&60_下穿上
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       sbi.industry_name,
       smaCurrent.trade_date,
       (select round((max(t2.highest_price) - t1.open_price) / t1.open_price * 100, 2)
        from stock_trade_dn t1,
             stock_trade_dn t2
        where t1.stock_code = smaCurrent.stock_code
          and t1.trade_date = get_trade_day(smaCurrent.trade_date, 1)
          and t2.stock_code = smaCurrent.stock_code
          and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 15))                            as sumMaxZd,

       (select min(t1.trade_date)
        from stock_trade_dn t1
        where t1.stock_code = smaCurrent.stock_code
          and t1.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t1.trade_date <= get_trade_day(smaCurrent.trade_date, 15)
          and t1.highest_price = (select max(t2.highest_price)
                                  from stock_trade_dn t2
                                  where t2.stock_code = smaCurrent.stock_code
                                    and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
                                    and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 15))) as higestPriceDate,

       (select round((min(t2.lowest_price) - t1.open_price) / t1.open_price * 100, 2)
        from stock_trade_dn t1,
             stock_trade_dn t2
        where t1.stock_code = smaCurrent.stock_code
          and t1.trade_date = get_trade_day(smaCurrent.trade_date, 1)
          and t2.stock_code = smaCurrent.stock_code
          and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 2)
          and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 15))                            as sumMinZd,

       (select min(t1.trade_date)
        from stock_trade_dn t1
        where t1.stock_code = smaCurrent.stock_code
          and t1.trade_date >= get_trade_day(smaCurrent.trade_date, 2)
          and t1.trade_date <= get_trade_day(smaCurrent.trade_date, 15)
          and t1.lowest_price = (select min(t2.lowest_price)
                                 from stock_trade_dn t2
                                 where t2.stock_code = smaCurrent.stock_code
                                   and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 2)
                                   and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 15)))  as lowestPriceDate,
       tradeCurrent.zd,
       smaCurrent.ma5,
       smaCurrent.ma60
from stock_ma_dn smaCurrent,
     stock_ma_dn smaBefore,
     stock_trade_dn tradeCurrent,
     stock_trade_dn tradeBefore,
     stock_base_info sbi
where 1 = 1
#   and smaCurrent.trade_date = get_trade_day(current_date, -1)
#   and smaCurrent.trade_date = date'2023-06-09'
  and smaCurrent.trade_date >= date'2023-09-01'
  and smaCurrent.trade_date < date'2023-10-01'
  and smaBefore.stock_code = smaCurrent.stock_code
  and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)

  -- ma
  and smaCurrent.ma5 > smaCurrent.ma200
  and smaBefore.ma5 < smaBefore.ma200

  -- 昨天交易
  and tradeBefore.stock_code = smaCurrent.stock_code
  and tradeBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)
  and tradeBefore.trade_num <= tradeCurrent.trade_num

  -- 今日交易
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



