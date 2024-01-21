-- MA_5&20_下穿上

select smaCurrent.stock_code,
       smaCurrent.stock_name,
       sbi.industry_name,
       smaCurrent.trade_date,
       (select round((max(t2.highest_price) - tradeCurrent.close_price) / tradeCurrent.close_price * 100, 2)
        from stock_trade_dn t2
        where t2.stock_code = smaCurrent.stock_code
          and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 20))                            as sumMaxZd,

       (select round((min(t2.lowest_price) - tradeCurrent.close_price) / tradeCurrent.close_price * 100, 2)
        from stock_trade_dn t2
        where t2.stock_code = smaCurrent.stock_code
          and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 20))                            as sumMinZd,
       tradeCurrent.zd,
       smaCurrent.ma5,
       smaCurrent.ma20,
       smaCurrent.ma200
from stock_ma_dn smaCurrent,
     stock_ma_dn smaBefore,
     stock_trade_dn tradeCurrent,
     stock_base_info sbi
where 1 = 1
  and smaCurrent.trade_date = get_trade_day(current_date, -0)
#   and smaCurrent.trade_date <= get_trade_day(current_date, -0)
#   and smaCurrent.trade_date >= get_trade_day(current_date, -20)
#   and smaCurrent.trade_date >= date'2024-01-01'
#   and smaCurrent.trade_date < date'2024-02-01'
  and smaBefore.stock_code = smaCurrent.stock_code
  and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)

  -- ma
  and smaCurrent.ma5 >= smaCurrent.ma30
  and smaCurrent.ma30 < smaBefore.ma60
  and smaBefore.ma5 < smaBefore.ma30


  -- 今天交易
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date
  and tradeCurrent.zd > -2
  and tradeCurrent.zd < 11
#   and tradeCurrent.close_price >= 10
  and tradeCurrent.trade_num >= 3 * 10000
  -- 市值 [50亿，200亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 50
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 100000000 * 200

-- 行业
  and sbi.stock_code = smaCurrent.stock_code
order by smaCurrent.trade_date desc, sbi.industry_name desc
;

