

-- 行业选股
with t1 as (select stock_code,
                   count(0) as nums,
                   avg(zd) as pj
            from stock_trade_dn std
            where std.zd >= 8
            group by std.stock_code)

select t1.stock_code,
       sbi.stock_name,
       sbi.industry_name,
       t1.nums,
       t1.pj,
       std.trade_date,
       std.zd
from t1,
     stock_base_info sbi,
     stock_trade_dn std
where sbi.stock_code = t1.stock_code
and std.stock_code = t1.stock_code
and std.trade_date = get_trade_day(current_date, 0)
and std.close_price >= 9
and std.trade_num >= 50000
order by sbi.industry_name, t1.nums desc
