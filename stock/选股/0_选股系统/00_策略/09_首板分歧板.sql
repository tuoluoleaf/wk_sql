--
--


select zt.trade_date,
       zt.stock_code,
       zt.stock_name,
       zt.x_day_y,
       zt.last_zt_time,
       zt.zt_time_level,
       trade.zd as next_zd
from stock_zt zt,
     stock_trade trade
where 1 = 1
  and (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4' and zt.stock_code not like '8%')
  and zt.zt_continue_num = 1
  and zt.first_zt_time <= '10:00:00'
  and zt.last_zt_time != zt.first_zt_time

  and trade.stock_code = zt.stock_code
  and trade.trade_date = get_trade_day(zt.trade_date, 1)
#   and trade.zd > 9.7

  and zt.trade_date >= date'2025-06-01'
  and zt.trade_date <= date'2025-07-01'
order by zt.trade_date desc, zt.last_zt_time
;

