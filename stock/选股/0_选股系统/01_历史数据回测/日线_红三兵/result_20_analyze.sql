select t1.stock_code,
       t1.stock_name,
       t1.trade_date,
       t1.industry_name,
       t1.zd,
       t1.zd_next1,
       std.zd as zd_next2,
       case
           when t1.zd_next1 < -3 then -3.1
           else t1.zd_next1 - 0.1
           end as zd_next1_new
from stock_result_20 t1
    left join stock_trade_dn std on t1.stock_code = std.stock_code and std.trade_date = get_trade_day(t1.trade_date, 2)
where t1.zd < 9
and t1.zd_next1 is not null
;