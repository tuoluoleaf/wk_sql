-- stock_ma_5_up_60
with tmp as (
    select concat(year(t1.trade_date), '-', month(t1.trade_date)) as yearMonth,
           t1.*
    from stock_ma_5_up_60 t1,
         stock_ma_dn smaCurrent,
         stock_ma_dn smaBefore
    where t1.trade_date >= date'2023-01-01'
    and t1.trade_date < date'2023-10-01'
    and t1.sum_max_zd >= 3
    and smaCurrent.stock_code = t1.stock_code
    and smaCurrent.trade_date = t1.trade_date
    and smaBefore.stock_code = t1.stock_code
    and smaBefore.trade_date = get_trade_day(t1.trade_date, -1)
#     and smaBefore.ma60 < smaCurrent.ma60
    and smaBefore.ma30 < smaCurrent.ma30
)


select t1.yearMonth, t1.nums, t2.nums, t3.nums
from
(select yearMonth, count(0) as nums from tmp  where sum_max_zd >= 3 and sum_max_zd < 6 group by yearMonth) t1,
(select yearMonth, count(0) as nums from tmp  where sum_max_zd >= 6 and sum_max_zd < 9 group by yearMonth) t2,
(select yearMonth, count(0) as nums from tmp  where sum_max_zd >= 9 group by yearMonth) t3
where t1.yearMonth  = t2.yearMonth
and t2.yearMonth = t3.yearMonth
order by t1.yearMonth
;





