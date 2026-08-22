--


-- 2地板，翘板成功
select dt.trade_date,
       dt.stock_code,
       dt.stock_name,
       tradeA1.zd                     as d2_qb,
       tradeA2.zd                     as d2_next,
       (10 + tradeA1.zd + tradeA2.zd) as qb_sy
from stock_dt dt,
     stock_trade tradeA1,
     stock_trade tradeA2
where 1 = 1
  and (dt.stock_code not like '30%' and dt.stock_code not like '688%')
  and tradeA1.stock_code = dt.stock_code
  and tradeA1.trade_date = get_trade_day(dt.trade_date, 1)

  and tradeA2.stock_code = dt.stock_code
  and tradeA2.trade_date = get_trade_day(dt.trade_date, 2)
  -- d1
  and dt.dt_continue_num = 1
  and tradeA1.lowest_price < dt.price * 0.903
  and tradeA1.close_price > tradeA1.lowest_price


  and dt.trade_date >= date'2025-01-01'
  and dt.trade_date < date'2026-01-01'
order by trade_date desc
;


-- 2地板，翘板失败
select dt.trade_date,
       dt.stock_code,
       dt.stock_name,
       tradeA1.zd                     as d2_qb,
       tradeA2.zd                     as d2_next,
       (10 + tradeA1.zd + tradeA2.zd) as qb_sy
from stock_dt dt,
     stock_trade tradeA1,
     stock_trade tradeA2
where 1 = 1
  and (dt.stock_code not like '30%' and dt.stock_code not like '688%')
  and tradeA1.stock_code = dt.stock_code
  and tradeA1.trade_date = get_trade_day(dt.trade_date, 1)

  and tradeA2.stock_code = dt.stock_code
  and tradeA2.trade_date = get_trade_day(dt.trade_date, 2)
  -- d1
  and dt.dt_continue_num = 1
  and tradeA1.lowest_price < dt.price * 0.903
  and tradeA1.close_price <= tradeA1.lowest_price


  and dt.trade_date >= date'2025-01-01'
  and dt.trade_date < date'2026-01-01'
order by trade_date desc