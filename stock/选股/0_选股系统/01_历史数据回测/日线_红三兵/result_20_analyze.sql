select t1.stock_code,
       t1.stock_name,
       t1.trade_date,
       t1.industry_name,
       t1.zd,
       t1.zd_next1,
       get_ma5_add(get_trade_day(t1.trade_date, 1), t1.stock_code) as next_ma5_sum
#        case
#            when t1.zd_next1 < -3 then -3.1
#            else t1.zd_next1 - 0.1
#            end as zd_next1_new
from stock_result_20 t1
where t1.zd < 9
and t1.zd_next1 is not null
;