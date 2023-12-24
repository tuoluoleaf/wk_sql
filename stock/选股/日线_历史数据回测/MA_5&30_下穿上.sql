
-- stock_ma_5_up_30
with tmp as (
    select concat(year(t1.trade_date), '-', month(t1.trade_date)) as yearMonth,
           t1.*
    from stock_ma_5_up_30 t1,
         stock_ma_dn smaCurrent,
         stock_ma_dn smaBefore
    where t1.trade_date >= date'2023-01-01'
    and t1.trade_date < date'2023-12-01'
    and t1.sum_max_zd >= 5
    and smaCurrent.stock_code = t1.stock_code
    and smaCurrent.trade_date = t1.trade_date
    and smaBefore.stock_code = t1.stock_code
    and smaBefore.trade_date = get_trade_day(t1.trade_date, -1)
    and smaBefore.ma30 < smaCurrent.ma30
)

select t1.yearMonth, t1.nums, t2.nums, t3.nums, round((t2.nums + t3.nums)/(t1.nums+t2.nums+t3.nums), 2) as zb
from
(select yearMonth, count(0) as nums from tmp  where sum_max_zd >= 10 and sum_max_zd < 15 group by yearMonth) t1,
(select yearMonth, count(0) as nums from tmp  where sum_max_zd >= 15 and sum_max_zd < 20 group by yearMonth) t2,
(select yearMonth, count(0) as nums from tmp  where sum_max_zd >= 20 group by yearMonth) t3
where t1.yearMonth  = t2.yearMonth
and t2.yearMonth  = t3.yearMonth
order by t1.yearMonth
;



# select t1.yearMonth, t1.nums, t2.nums, t3.nums, round((t2.nums + t3.nums)/(t1.nums+t2.nums+t3.nums), 2) as zb
# from
# (select yearMonth, count(0) as nums from tmp  where sum_max_zd >= 5 and sum_max_zd < 10 group by yearMonth) t1,
# (select yearMonth, count(0) as nums from tmp  where sum_max_zd >= 10 and sum_max_zd < 15 group by yearMonth) t2,
# (select yearMonth, count(0) as nums from tmp  where sum_max_zd >= 15 group by yearMonth) t3
# where t1.yearMonth  = t2.yearMonth
# and t2.yearMonth  = t3.yearMonth
# order by t1.yearMonth
;



-- 汇总问题
# sum(t1.sum_max_zd)	avg(t1.sum_max_zd)	count(0)
# 3898.950	12.2995268	317
select sum(t1.sum_max_zd), avg(t1.sum_max_zd),count(0)
from stock_ma_5_up_30 t1
where t1.trade_date >= date'2023-01-01'
  and t1.trade_date < date'2023-11-01'
  and t1.sum_max_zd >= 10
  and t1.sum_max_zd < 15;


# sum(t1.sum_max_zd)	avg(t1.sum_max_zd)	count(0)
# 13050.710	27.5331435	474
select sum(t1.sum_max_zd), avg(t1.sum_max_zd), count(0)
from stock_ma_5_up_30 t1
where t1.trade_date >= date'2023-01-01'
  and t1.trade_date < date'2023-11-01'
  and t1.sum_max_zd >= 15;


# sum(t1.sum_max_zd)	avg(t1.sum_max_zd)	count(0)
# 9726.030	34.3675972	283
select sum(t1.sum_max_zd), avg(t1.sum_max_zd), count(0)
from stock_ma_5_up_30 t1
where t1.trade_date >= date'2023-01-01'
  and t1.trade_date < date'2023-11-01'
  and t1.sum_max_zd >= 20;
