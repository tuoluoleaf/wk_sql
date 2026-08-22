-- 流动性考量
select zt.trade_date,
       zt.stock_code,
       zt.stock_name,
       zt.trade_money,
       zt.lt_market_value,
       zt.zt_continue_num,
       (select round((trade_next.highest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2)
        from stock_trade trade_next
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
#   and zt.first_zt_time <= '11:30:00'
#   and zt.last_zt_time > '09:30:00'
  and zt.zt_continue_num = 1
  and (x_day_y like '%/4' or x_day_y like '%/5' or x_day_y like '%/6' or x_day_y like '%/7' or x_day_y like '%/8' or x_day_y like '%/9' or x_day_y like '%/10' or x_day_y like '%/11')

  and zt.trade_date >= date'2024-01-01'
  and zt.trade_date < date'2025-01-01'
order by zt.trade_date desc, zt.trade_money desc
;