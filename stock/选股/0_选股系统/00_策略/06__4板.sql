-- 失败数据
select zb.trade_date,
       zb.stock_code,
       zb.stock_name,
       zb.first_zt_time,
       zb.zb_for_zt_point,
       zb.zd,
       trade.zd as next_zd,
       (-10 + zb.zd + trade.zd) as total_zd
from stock_zb zb
         left join stock_trade_dn trade on trade.stock_code = zb.stock_code and trade.trade_date = get_trade_day(zb.trade_date, 1)
where 1 = 1
  and (zb.stock_code not like '30%' and zb.stock_code not like '688%')
  and zb.zb_for_zt_point = 4
  and zb.trade_date >= date'2025-01-01'
  and zb.zb_count > 1

order by zb.trade_date desc
;


-- 成功数据
select zt.trade_date,
       zt.stock_code,
       zt.stock_name,
       zt.first_zt_time,
       zt.last_zt_time,
       zt.zt_continue_num,
       trade.zd as next_zd
from stock_zt zt
         left join stock_trade_dn trade on trade.stock_code = zt.stock_code and trade.trade_date = get_trade_day(zt.trade_date, 1)
where 1 = 1
  and (zt.stock_code not like '30%' and zt.stock_code not like '688%')
  and zt.zt_continue_num = 4
  and zt.last_zt_time > '09:30:00'
  and zt.trade_date >= date'2025-01-01'
order by zt.trade_date desc
;