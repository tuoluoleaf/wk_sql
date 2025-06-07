--

select zt.trade_date,
       zt.stock_code,
       zt.stock_name,
       zt.first_zt_time,
       zt.last_zt_time,
       zt.zt_continue_num,
       zt.x_day_y
from stock_zt zt
where 1 = 1
  and (zt.stock_code not like '30%' and zt.stock_code not like '688%')
  and zt.x_day_y like '%/4'
  and zt.trade_date >= date'2025-01-01'
order by zt.trade_date desc
