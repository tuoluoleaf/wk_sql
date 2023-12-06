
-- fund_ma_5_up_30
with tmp as (
    select concat(year(t1.trade_date), '-', month(t1.trade_date)) as yearMonth,
           t1.*
    from fund_ma_5_up_30 t1,
         fund_ma_dn smaCurrent,
         fund_ma_dn smaBefore
    where t1.trade_date >= date'2023-01-01'
    and t1.trade_date < date'2023-12-01'
    and t1.sum_max_zd >= 0
    and t1.close_price < 50
    and smaCurrent.fund_code = t1.fund_code
    and smaCurrent.trade_date = t1.trade_date
    and smaBefore.fund_code = t1.fund_code
    and smaBefore.trade_date = get_trade_day(t1.trade_date, -1)
#     and smaBefore.ma30 < smaCurrent.ma30
)

select t1.yearMonth, t1.nums, t2.nums, round(t2.nums /(t1.nums+t2.nums), 2) as zb
from
(select yearMonth, count(0) as nums from tmp  where sum_max_zd >= 0 and sum_max_zd < 5 group by yearMonth) t1,
(select yearMonth, count(0) as nums from tmp  where sum_max_zd >= 5 group by yearMonth) t2
where t1.yearMonth  = t2.yearMonth
order by t1.yearMonth
;

