-- 领涨股票 入库
truncate table stock_lead_up;

insert into stock_lead_up (stock_code, stock_name, industry_name, nums, pj, order_num)
select stock_code,
       stock_name,
       industry_name,
       nums,
       pj,
       rn
from (select sbi.stock_code,
             sbi.stock_name,
             sbi.industry_name,
             t1.nums,
             t1.pj,
             row_number() over (partition by industry_name order by nums desc) as rn
      from stock_base_info sbi,
           (select stock_code,
                   count(0) as nums,
                   avg(zd)  as pj
            from stock_trade_dn std
            where std.zd >= 6
              and std.trade_date >= get_trade_day(current_date, -365)
            group by std.stock_code) t1
      where sbi.stock_code = t1.stock_code) t2
# where rn >= 8
;

-- 行业选股
select slu.stock_code,
       slu.stock_name,
       slu.industry_name,
       slu.nums,
       slu.pj,
       slu.order_num,
       std.trade_date,
       std.zd
from stock_lead_up slu,
     stock_trade_dn std
where std.stock_code = slu.stock_code
and std.trade_date = get_trade_day(current_date, 0)
and std.close_price >= 9
and std.trade_num >= 50000
order by slu.industry_name, slu.nums desc
;


-- 三天内的领涨股票
select slu.stock_code,
       slu.stock_name,
       slu.industry_name,
       std.trade_date,
       std.zd,
       slu.nums,
       slu.pj,
       slu.order_num
from stock_trade_dn std,
     stock_lead_up slu
where slu.stock_code = std.stock_code
  and std.zd >= 6
  and std.trade_date >= get_trade_day(current_date, -2)
  and std.close_price >= 9
  and std.trade_num >= 50000
order by industry_name, nums desc
;
