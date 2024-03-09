-- MA_30
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       sbi.industry_name,
       smaCurrent.trade_date,
       (select round((max(t2.highest_price) - tradeCurrent.close_price) / tradeCurrent.close_price * 100, 2)
        from stock_trade_dn t2
        where t2.stock_code = smaCurrent.stock_code
          and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 20)) as sumMaxZd,

       (select round((min(t2.lowest_price) - tradeCurrent.close_price) / tradeCurrent.close_price * 100, 2)
        from stock_trade_dn t2
        where t2.stock_code = smaCurrent.stock_code
          and t2.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t2.trade_date <= get_trade_day(smaCurrent.trade_date, 20)) as sumMinZd,

       tradeCurrent.zd,
       smaCurrent.ma30
from stock_ma_dn smaCurrent,
     stock_ma_dn smaBefore,
     stock_trade_dn tradeCurrent,
     stock_trade_dn tradeBefore,
     stock_base_info sbi
where 1 = 1
  -- 排除：创业板、科创板
  and (smaCurrent.stock_code not like '30%' and smaCurrent.stock_code not like '688%')
  and smaCurrent.trade_date = get_trade_day(current_date, -0)
#   and smaCurrent.trade_date >= date'2023-01-01'
#   and smaCurrent.trade_date < date'2023-02-01'
  and smaBefore.stock_code = smaCurrent.stock_code
  and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date
  and tradeBefore.stock_code = tradeCurrent.stock_code
  and tradeBefore.trade_date = get_trade_day(tradeCurrent.trade_date, -1)

  -- ma
  and tradeCurrent.open_price > smaCurrent.ma30
  and tradeBefore.open_price < smaBefore.ma30

  -- 今天交易
  and tradeCurrent.zd > -1
  and tradeCurrent.zd < 11
  and tradeCurrent.close_price >= tradeCurrent.open_price
#   and tradeCurrent.close_price >= 10
  and tradeCurrent.trade_num >= 3 * 10000
  -- 市值 [50亿，300亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 50
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 100000000 * 300

-- 行业
  and sbi.stock_code = smaCurrent.stock_code
order by smaCurrent.trade_date desc, sbi.industry_name desc
;



