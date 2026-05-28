--
--


select zt.trade_date,
       zt.stock_code,
       zt.stock_name,
       zt.x_day_y,
       zt.first_zt_time,
       zt.last_zt_time,
       zt.zt_time_level,
       tradeA1.zd as next_zd
from stock_zt zt,
     stock_trade_dn tradeA1,
     stock_trade_dn tradeB1
where 1 = 1
  and (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4' and zt.stock_code not like '8%')
  and zt.zt_continue_num = 1
  and zt.first_zt_time <= '09:40:00'
  and zt.first_zt_time > '09:35:00'

  and tradeA1.stock_code = zt.stock_code
  and tradeA1.trade_date = get_trade_day(zt.trade_date, 1)
#   and trade.zd > 9.7

  and tradeB1.stock_code = zt.stock_code
  and tradeB1.trade_date = get_trade_day(zt.trade_date, -1)
  and tradeB1.zd < 9.7

  and zt.trade_date >= date'2024-08-01'
  and zt.trade_date <= date'2024-09-01'
order by zt.trade_date desc, zt.last_zt_time
;




-- zb
select zb.trade_date,
       zb.stock_code,
       zb.stock_name,
       zb.zd,
       zb.x_day_y,
       zb.first_zt_time,
       tradeA1.zd as next_zd
from stock_zb zb,
     stock_trade_dn tradeA1,
     stock_trade_dn tradeB1
where 1 = 1
  and (zb.stock_code not like '30%' and zb.stock_code not like '688%' and zb.stock_code not like '4' and zb.stock_code not like '8%')
  and zb.first_zt_time <= '09:40:00'
  and zb.first_zt_time > '09:35:00'

  and tradeA1.stock_code = zb.stock_code
  and tradeA1.trade_date = get_trade_day(zb.trade_date, 1)
#   and trade.zd > 9.7

  and tradeB1.stock_code = zb.stock_code
  and tradeB1.trade_date = get_trade_day(zb.trade_date, -1)
  and tradeB1.zd < 9.7

  and zb.trade_date >= date'2024-08-01'
  and zb.trade_date <= date'2024-09-01'
order by zb.trade_date desc, zb.first_zt_time
;