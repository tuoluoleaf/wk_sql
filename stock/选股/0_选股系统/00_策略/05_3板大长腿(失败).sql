-- 失败数据
-- 3板、T字、爆头
select *
from stock_zb zb
where zb.zb_for_zt_point = 3
  and zb.first_zt_time <= '09:30:00'
order by trade_date desc
;



-- 成功数据
-- 3板、T字
select *
from stock_zt zt,
     stock_trade trade
where 1 = 1
  and zt.zt_continue_num = 3
  and zt.first_zt_time <= '09:30:00'
  and zt.last_zt_time > '09:30:00'

  and trade.stock_code = zt.stock_code
  and trade.trade_date = get_trade_day(zt.trade_date, 1)
  and trade.zd > 9.7

  and zt.trade_date >= date'2025-01-01'
order by zt.trade_date desc
;