-- 流动性考量
select zt.trade_date,
       zt.stock_code,
       zt.stock_name,
       zt.trade_money,
       zt.lt_market_value,
       zt.zt_continue_num,
       (select round((trade_next.highest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2)
        from stock_trade_dn trade_next
        where trade_next.stock_code = zt.stock_code
          and trade_next.trade_date = get_trade_day(zt.trade_date, 1)) as next_highest_price,
       zt.x_day_y,
       zt.first_zt_time,
       zt.last_zt_time,
       zt.zt_time_level
from stock_zt zt
where 1 = 1
  and (zt.stock_code not like '30%' and zt.stock_code not like '688%')
  and zt.trade_money > 5
  and zt.first_zt_time <= '11:30:00'
  and zt.last_zt_time > '09:30:00'
  and zt.zt_continue_num = 1

  and zt.trade_date >= date'2025-01-01'
  and zt.trade_date < date'2026-01-01'
order by zt.trade_date desc, zt.trade_money desc
;


-- 流动性的炸板
select zb.trade_date,
       zb.stock_code,
       zb.stock_name,
       zb.trade_money,
       zb.lt_market_value,
       zb.zb_for_zt_point,
       (select round((trade_next.highest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2)
        from stock_trade_dn trade_next
        where trade_next.stock_code = zb.stock_code
          and trade_next.trade_date = get_trade_day(zb.trade_date, 1)) as next_highest_price,
       zb.x_day_y,
       zb.first_zt_time,
       zb.zb_count
from stock_zb zb
where 1 = 1
  and (zb.stock_code not like '30%' and zb.stock_code not like '688%')
  and zb.trade_money >= 5
  and zb.first_zt_time > '09:30:00'
  and zb.first_zt_time <= '11:30:00'
  and zb.zb_for_zt_point <= 1
  and zb.zb_count >= 2

  and zb.trade_date >= date'2025-01-01'
  and zb.trade_date < date'2026-01-01'
order by zb.trade_date desc, zb.trade_money desc
;
