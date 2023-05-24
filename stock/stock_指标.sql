--
select t1.stock_code,
       t1.stock_name,
       t1.monitor_date,
       t1.will,
       t2.signal_date,
       t2.turn_type
from main_force_secret t1,
     magical_nine_turn t2
where t1.stock_code = t2.stock_code
  and t1.will in ('主力进场', '主力加仓')
  and t1.monitor_date <= date'2023-05-23'
  and t1.monitor_date >= date'2023-05-22'
  #
  and t2.turn_type = '红九转'
  and t2.signal_date <= date'2023-05-23'
  and t2.signal_date >= date'2023-05-22'
order by t1.monitor_date desc
;