
select '选股池';
-- 选股池
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
# and sc.trade_date = get_trade_day(current_date, -2)
  and sc.trade_date = date'2023-06-29'
  and sc.macd <= 0.2
  and sc.zd <= 5
  and (select count(sc1.id)
       from stock_choice sc1
       where sc1.stock_code = sc.stock_code and sc1.trade_date = sc.trade_date) > 1
order by sc.industry_name, sc.stock_code
;


select 'macd分析';
-- macd分析
with tmp as (select std1.zd + std2.zd as t_sum,
                    std1.zd           as t_1,
                    std2.zd           as t_2,
                    sbi.industry_name,
                    sma.*
             from stock_macd_analyze sma
                      left join  stock_base_info sbi on sbi.stock_code = sma.stock_code
                      left join stock_trade_dn std1 on std1.stock_code = sma.stock_code and
                                                       std1.trade_date = get_trade_day(sma.trade_date, 1)
                      left join stock_trade_dn std2 on std2.stock_code = sma.stock_code and
                                                       std2.trade_date = get_trade_day(sma.trade_date, 2)
             where sma.trade_date = get_trade_day(current_date, -2)
               and sma.find_point_date = sma.trade_date
#                and sma.macd <= 0.2
#                and sma.zd <= 5
               and start_point_date is not null)

select industry_name,
       count(industry_name),
       avg(t_1),
       avg(t_2)
from tmp
group by industry_name
;


select '转红分析';
-- 转红分析
with tmp as (select stra1.zd + stra2.zd as t_sum,
                    stra1.zd           as t_1,
                    stra2.zd           as t_2,
                    sbi.industry_name,
                    stra.*
             from stock_trans_red_analyze stra
                      left join  stock_base_info sbi on sbi.stock_code = stra.stock_code
                      left join stock_trans_red_analyze stra1 on stra1.stock_code = stra.stock_code and
                                                       stra1.trade_date = get_trade_day(stra.trade_date, 1)
                      left join stock_trans_red_analyze stra2 on stra2.stock_code = stra.stock_code and
                                                       stra2.trade_date = get_trade_day(stra.trade_date, 2)
             where stra.trade_date = get_trade_day(current_date, -2)
               and stra.start_point_date = stra.trade_date
               and stra.macd <= 0.2
               and stra.zd <= 5
               )

# select industry_name,
#        count(industry_name),
#        avg(t_1),
#        avg(t_2)
# from tmp
# group by industry_name
# ;

# select macd,
#        count(macd),
#        avg(t_1),
#        avg(t_2)
# from tmp
# group by macd
# ;

select zd,
       count(zd),
       avg(t_1),
       avg(t_2)
from tmp
group by zd
;



select '红九转';
-- 红九转
select stra1.zd + stra2.zd + stra3.zd as t_sum,
       stra1.zd            as t_1,
       stra2.zd            as t_2,
       stra3.zd            as t_3,
       sbi.industry_name,
       mnt.*
from magical_nine_turn mnt
         left join stock_base_info sbi on sbi.stock_code = mnt.stock_code
         left join stock_trans_red_analyze stra1 on stra1.stock_code = mnt.stock_code and
                                                    stra1.trade_date = get_trade_day(mnt.signal_date, 1)
         left join stock_trans_red_analyze stra2 on stra2.stock_code = mnt.stock_code and
                                                    stra2.trade_date = get_trade_day(mnt.signal_date, 2)
         left join stock_trans_red_analyze stra3 on stra3.stock_code = mnt.stock_code and
                                                    stra3.trade_date = get_trade_day(mnt.signal_date, 3)
where mnt.turn_type = '红九转'
  and mnt.signal_date = date'2023-06-13'










