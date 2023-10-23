-- 海龟交易：20日突破
select tradeCurrent.stock_code,
       tradeCurrent.stock_name,
       sbi.industry_name,
       tradeCurrent.trade_date,
       (select round((max(t2.highest_price) - t1.open_price) / t1.open_price * 100, 2)
        from stock_trade_dn t1,
             stock_trade_dn t2
        where t1.stock_code = tradeCurrent.stock_code
          and t1.trade_date = get_trade_day(tradeCurrent.trade_date, 1)
          and t2.stock_code = tradeCurrent.stock_code
          and t2.trade_date >= get_trade_day(tradeCurrent.trade_date, 1)
          and t2.trade_date <= get_trade_day(tradeCurrent.trade_date, 15))                            as sumMaxZd,

       (select min(t1.trade_date)
        from stock_trade_dn t1
        where t1.stock_code = tradeCurrent.stock_code
          and t1.trade_date >= get_trade_day(tradeCurrent.trade_date, 1)
          and t1.trade_date <= get_trade_day(tradeCurrent.trade_date, 15)
          and t1.highest_price = (select max(t2.highest_price)
                                  from stock_trade_dn t2
                                  where t2.stock_code = tradeCurrent.stock_code
                                    and t2.trade_date >= get_trade_day(tradeCurrent.trade_date, 1)
                                    and t2.trade_date <= get_trade_day(tradeCurrent.trade_date, 15))) as higestPriceDate,

       (select round((min(t2.lowest_price) - t1.open_price) / t1.open_price * 100, 2)
        from stock_trade_dn t1,
             stock_trade_dn t2
        where t1.stock_code = tradeCurrent.stock_code
          and t1.trade_date = get_trade_day(tradeCurrent.trade_date, 1)
          and t2.stock_code = tradeCurrent.stock_code
          and t2.trade_date >= get_trade_day(tradeCurrent.trade_date, 2)
          and t2.trade_date <= get_trade_day(tradeCurrent.trade_date, 15))                            as sumMinZd,

       (select min(t1.trade_date)
        from stock_trade_dn t1
        where t1.stock_code = tradeCurrent.stock_code
          and t1.trade_date >= get_trade_day(tradeCurrent.trade_date, 2)
          and t1.trade_date <= get_trade_day(tradeCurrent.trade_date, 15)
          and t1.lowest_price = (select min(t2.lowest_price)
                                 from stock_trade_dn t2
                                 where t2.stock_code = tradeCurrent.stock_code
                                   and t2.trade_date >= get_trade_day(tradeCurrent.trade_date, 2)
                                   and t2.trade_date <= get_trade_day(tradeCurrent.trade_date, 15)))  as lowestPriceDate,

       tradeCurrent.zd
from stock_trade_dn tradeCurrent,
     stock_base_info sbi
where 1 = 1
  and tradeCurrent.trade_date >= date'2023-10-01'
  and tradeCurrent.trade_date < date'2023-11-01'
  and tradeCurrent.close_price >= (select max(tradeBefore.close_price)
                                   from stock_trade_dn tradeBefore
                                   where tradeBefore.stock_code = tradeCurrent.stock_code
                                     and tradeBefore.trade_date >= get_trade_day(tradeCurrent.trade_date, -20)
                                     and tradeBefore.trade_date < tradeCurrent.trade_date)

  -- 今天交易
  and tradeCurrent.zd > -1
  and tradeCurrent.zd < 11
  and tradeCurrent.close_price >= tradeCurrent.open_price
  and tradeCurrent.close_price >= 10
  and tradeCurrent.trade_num >= 30000
  -- 市值 [50亿，300亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 50
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 100000000 * 300

-- 行业
  and sbi.stock_code = tradeCurrent.stock_code

order by tradeCurrent.trade_date desc, sbi.industry_name desc
;



