
select '选股基线：数据';
-- 选股基线：数据
insert into stock_choice_baseline (stock_code, avg_macd, max_macd, min_macd, avg_zd, max_zd, min_zd, arise_num)

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
         left join stock_macd_dn smd on smd.stock_code = stra.stock_code and smd.trade_date = stra.start_point_date
         left join stock_trade_dn std1 on std1.stock_code = stra.stock_code and std1.trade_date = stra.start_point_date
where stra.end_point_date is not null
  and stra.peek_sum_zd >= 5
  and stra.peek_sum_zd > std1.zd
)

select stock_code,
     avg(startMacd),
       max(startMacd),
       min(startMacd),
       avg(startZd),
       max(startZd),
       min(startZd),
       count(stock_code)
from temp
group by stock_code
;


select '转红监控、选股基线：计算盈亏比、成功率';
-- 转红监控、选股基线：计算盈亏比、成功率
insert into stock_choice_baseline_rate (stock_code, stock_name, industry_name, base_macd, base_zd, up_sum, down_sum, all_sum, up_num, down_num)

with start_trans_red as (select end.*
              from stock_trans_red_analyze start,
                   stock_trans_red_analyze end,
                   stock_choice_baseline scb
              where start.stock_code = scb.stock_code
                and start.stock_code = end.stock_code
                and start.start_point_date = end.start_point_date
                and start.trade_date = start.start_point_date
                and end.end_point_date is not null
                and start.macd >= scb.avg_macd
                and start.zd >= scb.avg_zd
              ),

     up_trans as (select stock_code,
                   sum(peek_sum_zd) as upSum,
                   count(0) as upNum
            from start_trans_red
            where peek_sum_zd >= 5
            group by stock_code),


     down_trans as (select stock_code,
                   sum(sum_zd) as downSum,
                   count(0) as downNum
            from start_trans_red
            where peek_sum_zd < 5
            group by stock_code)


select up_trans.stock_code,
       sbi.stock_name,
       sbi.industry_name,
       snb.avg_zd as baseZd,
       snb.avg_macd as baseMacd,
       up_trans.upSum,
       down_trans.downSum,
       up_trans.upSum + down_trans.downSum,
       up_trans.upNum,
       down_trans.downNum
from up_trans,
     down_trans
    left join stock_base_info sbi on sbi.stock_code = down_trans.stock_code
    left join stock_choice_baseline snb on sbi.stock_code = snb.stock_code
where up_trans.stock_code = down_trans.stock_code
;

truncate