-- 失败数据
-- T字、爆头
select zb.trade_date,
       zb.stock_code,
       zb.stock_name,
       zb.zd,
       zb.zb_for_zt_point,
       zb.zb_count,
       zb.x_day_y
from stock_zb zb
where 1 = 1
  and (zb.stock_code not like '30%' and zb.stock_code not like '688%')
  and zb.zb_for_zt_point in (1, 2, 3)
  and zb.first_zt_time <= '09:30:00'
  and zb.zb_count >= 2

  and zb.trade_date >= date'2025-01-01'
order by trade_date desc
;



-- 成功数据
-- T字
select *
from stock_zt zt,
     stock_trade_dn trade
where 1 = 1
  and (zt.stock_code not like '30%' and zt.stock_code not like '688%')
  and zt.zt_continue_num in (1, 2, 3)
  and zt.first_zt_time <= '09:30:00'
  and zt.last_zt_time > '09:30:00'

  and trade.stock_code = zt.stock_code
  and trade.trade_date = get_trade_day(zt.trade_date, 1)
  and trade.zd > 9.7

  and zt.trade_date >= date'2025-01-01'
order by zt.trade_date desc
;

-- T字
select zt.trade_date,
       zt.stock_code,
       zt.stock_name,
       zt.zt_continue_num,
       tradeA1.zd as next_zd
from stock_zt zt,
     stock_trade_dn tradeA1
where 1 = 1
  and (zt.stock_code not like '30%' and zt.stock_code not like '688%')
  and zt.zt_continue_num in (1, 2, 3)
  and zt.first_zt_time <= '09:30:00'
  and zt.last_zt_time > '09:30:00'

  and tradeA1.stock_code = zt.stock_code
  and tradeA1.trade_date = get_trade_day(zt.trade_date, 1)

  and zt.trade_date >= date'2025-01-01'
order by zt.trade_date desc
;