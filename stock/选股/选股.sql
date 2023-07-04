

-- 选股池
select std1.zd + std2.zd as t_sum,
       std1.zd as t_1,
       std2.zd as t_2,
       sc.stock_code,
       sc.stock_name,
       sc.industry_name,
       sc.trade_date,
       sc.analyze_source,
       sc.macd,
       sc.zd,
       sc.find_point_date,
       sc.gt_three_percent_rate
from stock_choice sc
         left join stock_trade_dn std1 on std1.stock_code = sc.stock_code and std1.trade_date = get_trade_day(sc.trade_date, 1)
         left join stock_trade_dn std2 on std2.stock_code = sc.stock_code and std2.trade_date = get_trade_day(sc.trade_date, 2)
where sc.trade_date = get_trade_day(current_date, -3)
and sc.macd <= 0.2
and sc.zd <= 5
and (select count(sc1.id) from stock_choice sc1 where sc1.stock_code = sc.stock_code and sc1.trade_date = sc.trade_date) > 1
order by sc.industry_name, sc.stock_code
;








