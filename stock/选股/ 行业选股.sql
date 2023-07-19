

-- 行业选股
with t1 as (select stock_code,
                   count(0) as nums
            from stock_trade_dn std
            where std.zd >= 5
            group by std.stock_code)

select t1.stock_code,
       sbi.stock_name,
       sbi.industry_name,
       t1.nums
from t1,
     stock_base_info sbi
where sbi.stock_code = t1.stock_code
order by sbi.industry_name
