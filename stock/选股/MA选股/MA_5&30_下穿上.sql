-- MA_5&30_下穿上
# insert into stock_ma_5_up_30 (stock_code, stock_name, industry_name, trade_date, zd, close_price, sum_max_zd, highest_price_date, sum_min_zd, lowest_price_date,  ma5, ma30)

select smaCurrent.stock_code,
       smaCurrent.stock_name,
       sbi.industry_name,
       smaCurrent.trade_date,
       tradeCurrent.zd,
       tradeCurrent.close_price,
       (select round((max(t1.highest_price) - tradeCurrent.close_price) / tradeCurrent.close_price * 100, 2)
        from stock_trade_dn t1
        where t1.stock_code = smaCurrent.stock_code
          and t1.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t1.trade_date <= get_trade_day(smaCurrent.trade_date, 25))                            as sumMaxZd,

       (select min(t1.trade_date)
        from stock_trade_dn t1
        where t1.stock_code = smaCurrent.stock_code
          and t1.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t1.trade_date <= get_trade_day(smaCurrent.trade_date, 25)
          and t1.highest_price = (select max(t2.highest_price)
                                  from stock_trade_dn t2
                                  where t2.stock_code = smaCurrent.stock_code
                                    and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
                                    and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 25))) as highestPriceDate,

       (select round((min(t1.lowest_price) - tradeCurrent.open_price) / tradeCurrent.open_price * 100, 2)
        from stock_trade_dn t1
        where t1.stock_code = smaCurrent.stock_code
          and t1.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t1.trade_date <= get_trade_day(smaCurrent.trade_date, 25))                            as sumMinZd,

       (select min(t1.trade_date)
        from stock_trade_dn t1
        where t1.stock_code = smaCurrent.stock_code
          and t1.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t1.trade_date <= get_trade_day(smaCurrent.trade_date, 25)
          and t1.lowest_price = (select min(t2.lowest_price)
                                 from stock_trade_dn t2
                                 where t2.stock_code = smaCurrent.stock_code
                                   and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
                                   and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 25)))  as lowestPriceDate,

       smaCurrent.ma5,
       smaCurrent.ma30
from stock_ma_dn smaCurrent,
     stock_ma_dn smaBefore,
     stock_trade_dn tradeCurrent,
     stock_base_info sbi
where 1 = 1
  -- 排除：创业板、科创板
  and (smaCurrent.stock_code not like '30%' and smaCurrent.stock_code not like '688%')
  and smaCurrent.trade_date = get_trade_day(current_date, -0)
#   and smaCurrent.trade_date <= get_trade_day(current_date, -0)
#   and smaCurrent.trade_date >= get_trade_day(current_date, -6)
#   and smaCurrent.trade_date >= date'2023-01-01'
#   and smaCurrent.trade_date < date'2023-10-01'
  and smaBefore.stock_code = smaCurrent.stock_code
  and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)

  -- ma
  and smaCurrent.ma5 >= smaCurrent.ma30
  and smaBefore.ma5 < smaBefore.ma30
#   and smaBefore.ma30 < smaCurrent.ma30

  -- 今天交易
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date
  and tradeCurrent.zd > -1
  and tradeCurrent.zd < 11
  and tradeCurrent.close_price >= tradeCurrent.open_price
  and tradeCurrent.close_price >= 10
  and tradeCurrent.trade_num >= 30000
  -- 市值 [50亿，300亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 50
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 100000000 * 300

-- 行业
  and sbi.stock_code = smaCurrent.stock_code
order by smaCurrent.trade_date desc, sbi.industry_name desc
;



