# -- MA_5&30_下穿上
# insert into fund_ma_5_up_30 (fund_code, fund_name, trade_date, zd, close_price, sum_max_zd, highest_price_date, sum_min_zd, lowest_price_date, ma5, ma30)

select replace(replace(smaCurrent.fund_code, 'sh', ''),'sz', '') as fund_code,
       smaCurrent.fund_name,
       smaCurrent.trade_date,
       tradeCurrent.zd,
       tradeCurrent.close_price,
       (select round((max(t1.highest_price) - tradeCurrent.close_price) / tradeCurrent.close_price * 100, 2)
        from fund_trade_dn t1
        where t1.fund_code = smaCurrent.fund_code
          and t1.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t1.trade_date <= get_trade_day(smaCurrent.trade_date, 25))                            as sumMaxZd,

       (select min(t1.trade_date)
        from fund_trade_dn t1
        where t1.fund_code = smaCurrent.fund_code
          and t1.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t1.trade_date <= get_trade_day(smaCurrent.trade_date, 25)
          and t1.highest_price = (select max(t2.highest_price)
                                  from fund_trade_dn t2
                                  where t2.fund_code = smaCurrent.fund_code
                                    and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
                                    and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 25))) as highestPriceDate,

       (select round((min(t1.lowest_price) - tradeCurrent.open_price) / tradeCurrent.open_price * 100, 2)
        from fund_trade_dn t1
        where t1.fund_code = smaCurrent.fund_code
          and t1.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t1.trade_date <= get_trade_day(smaCurrent.trade_date, 25))                            as sumMinZd,

       (select min(t1.trade_date)
        from fund_trade_dn t1
        where t1.fund_code = smaCurrent.fund_code
          and t1.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t1.trade_date <= get_trade_day(smaCurrent.trade_date, 25)
          and t1.lowest_price = (select min(t2.lowest_price)
                                 from fund_trade_dn t2
                                 where t2.fund_code = smaCurrent.fund_code
                                   and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
                                   and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 25)))  as lowestPriceDate,

       smaCurrent.ma5,
       smaCurrent.ma30
from fund_ma_dn smaCurrent,
     fund_ma_dn smaBefore,
     fund_trade_dn tradeCurrent
where 1 = 1
  and smaCurrent.trade_date = get_trade_day(current_date, -0)
#   and smaCurrent.trade_date >= get_trade_day(current_date, -6)
#   and smaCurrent.trade_date >= date'2023-01-01'
#   and smaCurrent.trade_date < date'2024-01-01'
  and smaBefore.fund_code = smaCurrent.fund_code
  and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)

  -- ma
  and smaCurrent.ma5 >= smaCurrent.ma30
  and smaBefore.ma5 <= smaBefore.ma30

  -- 今天交易
  and tradeCurrent.fund_code = smaCurrent.fund_code
  and tradeCurrent.trade_date = smaCurrent.trade_date
  and tradeCurrent.zd > -1
  and tradeCurrent.zd < 11
#   and tradeCurrent.close_price >= tradeCurrent.open_price
  and tradeCurrent.close_price < 50
  and tradeCurrent.trade_num >= 3*10000*100
-- 市值 [50亿，300亿]
order by smaCurrent.trade_date desc
;



