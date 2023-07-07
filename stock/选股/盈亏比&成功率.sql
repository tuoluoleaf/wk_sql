with temp as (
    select sbi.industry_name,
       smd.macd as startMacd,
       std1.zd as startZd,
       stra.stock_code,
       stra.stock_name,
       stra.trade_date,
       stra.macd,
       stra.zd,
       stra.sum_zd,
       stra.peek_sum_zd,
       stra.start_point_date,
       stra.end_point_date
from stock_trans_red_analyze stra
         left join stock_base_info sbi on sbi.stock_code = stra.stock_code
         left join stock_trade_dn std on std.stock_code = stra.stock_code and std.trade_date = stra.trade_date
         left join stock_macd_dn smd on smd.stock_code = stra.stock_code and smd.trade_date = stra.start_point_date
         left join stock_trade_dn std1 on std1.stock_code = stra.stock_code and std1.trade_date = stra.start_point_date
where stra.end_point_date is not null
  and std.trade_num >= 80000
  and std.close_price >= 10
  and stra.peek_sum_zd >= 5
  and stra.trade_date >= date'2020-01-01'
  and stra.peek_sum_zd > std1.zd
)

select stock_code,
       avg(startMacd),
       avg(startZd),
       count(stock_code)
from temp
group by stock_code
having count(stock_code) > 10
;


-- 转红监控、选股基线：计算盈亏比、成功率
select *
from stock_choice_baseline
;

with tmp1 as (select stra2.*
              from stock_trans_red_analyze stra1,
                   stock_trans_red_analyze stra2,
                   stock_choice_baseline scb
              where 1 = 1
                and stra1.stock_code = scb.stock_code
                and stra1.stock_code = stra2.stock_code
                and stra1.start_point_date = stra2.start_point_date
                and stra1.trade_date = stra1.start_point_date
                and stra2.end_point_date is not null
                and stra1.macd >= scb.macd
                and stra1.zd >= scb.zd
                and stra1.trade_date >= date'2020-01-01'),

     a1 as (select stock_code,
                   sum(peek_sum_zd) as upSum,
                   count(0) as upNum
            from tmp1
            where peek_sum_zd >= 5
            group by stock_code),


     a2 as (select stock_code,
                   sum(sum_zd) as downSum,
                   count(0) as downNum
            from tmp1
            where peek_sum_zd < 5
            group by stock_code)


select a1.stock_code,
       sbi.stock_name,
       sbi.industry_name,
       snb.zd as baseZd,
       snb.macd as baseMacd,
       a1.upSum,
       a2.downSum,
       a1.upSum + a2.downSum,
       a1.upNum,
       a2.downNum
from a1,
     a2
    left join stock_base_info sbi on sbi.stock_code = a2.stock_code
    left join stock_choice_baseline snb on sbi.stock_code = snb.stock_code
where a1.stock_code = a2.stock_code
