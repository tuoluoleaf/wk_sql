-- MA_5&20_下穿上
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       sbi.industry_name,
       smaCurrent.trade_date,
       (select sum(t.zd)
        from stock_trade_dn t
        where smaCurrent.stock_code = t.stock_code
          and t.trade_date >= get_trade_day(smaCurrent.trade_date, 1)
          and t.trade_date <= get_trade_day(smaCurrent.trade_date, 10)) as sumZd,
       tradeCurrent.zd,
       smaCurrent.ma5,
       smaCurrent.ma20,
       smaCurrent.ma200
from stock_ma_dn smaCurrent,
     stock_ma_dn smaBefore,
     stock_ma_dn smaBefore200d,
     stock_trade_dn tradeCurrent,
     stock_base_info sbi
where 1 = 1
#   and smaCurrent.trade_date = get_trade_day(current_date, -0)
#   and smaCurrent.trade_date = date'2023-06-09'
  and smaCurrent.trade_date >= date'2023-01-01'
  and smaCurrent.trade_date <= date'2024-01-01'
  and smaBefore.stock_code = smaCurrent.stock_code
  and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)

  -- ma
  and smaCurrent.ma5 >= smaCurrent.ma20
  and smaCurrent.ma20 >= smaCurrent.ma200
  and smaBefore.ma5 < smaBefore.ma20
  and smaCurrent.ma20 >= smaBefore.ma20

  -- 200天前
  and smaBefore200d.stock_code = smaCurrent.stock_code
  and smaBefore200d.trade_date = get_trade_day(smaCurrent.trade_date, -200)
  and smaCurrent.ma200 <= smaBefore200d.ma200

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
order by smaCurrent.trade_date, sbi.industry_name desc
;



