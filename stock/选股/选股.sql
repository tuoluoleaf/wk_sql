
select '选股：选股池';
-- 选股：选股池
select std1.zd + std2.zd as t_sum,
       std1.zd           as t_1,
       std2.zd           as t_2,
       sc.stock_code,
       sc.stock_name,
       sc.industry_name,
       sc.trade_date,
       sc.analyze_source,
       sc.zd,
       sc.macd,
       sc.find_point_date,
       sc.start_point_date,
       sc.gt_three_percent_rate
from stock_choice sc
         left join stock_trade_dn std1
                   on std1.stock_code = sc.stock_code and std1.trade_date = get_trade_day(sc.trade_date, 1)
         left join stock_trade_dn std2
                   on std2.stock_code = sc.stock_code and std2.trade_date = get_trade_day(sc.trade_date, 2)
where 1 = 1
and sc.trade_date = get_trade_day(current_date, -1)
#   and sc.trade_date = date'2023-06-29'
#   and sc.macd <= 0.2
#   and sc.zd <= 5
#   and (select count(sc1.id)
#        from stock_choice sc1
#        where sc1.stock_code = sc.stock_code and sc1.trade_date = sc.trade_date) > 1
order by sc.industry_name, sc.stock_code
;



select '选股：转红';
-- 选股：转红
select * from stock_trans_red_analyze
where trade_date = start_point_date
and trade_date = get_trade_day(current_date, 0)
;


select '选股：转红：[T日收盘价 >= T-3日收盘价]：选股';
-- 选股：转红：[T日收盘价 >= T-3日收盘价]：选股
select std3.zd + std4.zd as t_sum,
       std3.zd           as t1,
       std4.zd           as t2,
       stra.stock_code,
       stra.stock_name,
       sbi.industry_name,
       stra.trade_date,
       stra.macd,
       stra.zd
from stock_trans_red_analyze stra,
     stock_base_info sbi,
     stock_trade_dn std1,
     stock_trade_dn std2
     left join stock_trade_dn std3
                   on std3.stock_code = std2.stock_code and std3.trade_date = get_trade_day(std2.trade_date, 1)
         left join stock_trade_dn std4
                   on std4.stock_code = std2.stock_code and std4.trade_date = get_trade_day(std2.trade_date, 2)
where 1 = 1
  and stra.trade_date = date${date}
  and stra.start_point_date = stra.trade_date

  and sbi.stock_code = stra.stock_code

  and std1.stock_code = stra.stock_code
  and std1.trade_date = get_trade_day(stra.trade_date, -3)

  and std2.stock_code = stra.stock_code
  and std2.trade_date = stra.trade_date
  and std2.close_price >= std1.close_price
  and std2.close_price >= 10
  and std2.trade_num >= 50000
order by sbi.industry_name
;




select '选股：基线: zd >=5：盈亏比、成功率';
-- 选股：基线: zd >=5：盈亏比、成功率
select stra.stock_code,
       stra.stock_name,
       scbr.industry_name,
       stra.trade_date,
       stra.macd,
       stra.zd,
       scbr.base_macd,
       scbr.base_zd,
       scbr.up_sum,
       scbr.down_sum,
       scbr.all_sum,
       scbr.up_num,
       scbr.down_num,
       scb.avg_macd,
       scb.max_macd,
       scb.min_macd,
       scb.avg_zd,
       scb.max_zd,
       scb.min_zd
from stock_trans_red_analyze stra,
     stock_choice_baseline_rate scbr,
     stock_choice_baseline scb,
     stock_trade_dn std
where stra.trade_date = stra.start_point_date
  and stra.trade_date = get_trade_day(current_date, 0)

  and std.stock_code = stra.stock_code
  and std.trade_date = stra.trade_date
  and std.close_price >= 10
  and std.trade_num >= 80000

  and scb.stock_code = stra.stock_code
  and scbr.stock_code = stra.stock_code
  and stra.zd >= scbr.base_zd
  and stra.macd >= scbr.base_macd
