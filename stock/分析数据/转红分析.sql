

--  转红分析：波段
select stra.stock_code,
       stra.stock_name,
       stra.trade_date,
       stra.macd,
       stra.zd,
       stra.sum_zd,
       stra.peek_sum_zd,
       stra.start_point_date,
       stra.end_point_date,
       stra.will
from stock_trans_red_analyze stra 
where 1=1
and stra.end_point_date is not null
# and stra.find_point_date = stra.start_point_date
and stock_code = '001282'
order by stra.trade_date desc
;




-- 转红：选股
select stra.stock_code,
       stra.stock_name,
       stra.trade_date,
       stra.macd,
       stra.zd,
#        stra.sum_zd,
#        stra.peek_sum_zd,
       stra.start_point_date,
       stra.end_point_date,
       stra.will,
       sbi.industry_name,
       ((select count(0) from stock_trans_red_analyze stra1 where stra1.stock_code = stra.stock_code and stra1.end_point_date is not null and stra1.peek_sum_zd >= 3)
        /(select count(0) from stock_trans_red_analyze stra2 where stra2.stock_code = stra.stock_code and stra2.end_point_date is not null) ) as rate,
    (select count(0) from stock_trans_red_analyze stra3 where stra3.stock_code = stra.stock_code and stra3.end_point_date is not null) as nums
from stock_trans_red_analyze stra,
     stock_trade_dn std
         left join stock_base_info sbi on sbi.stock_code = std.stock_code
where 1 = 1
  and stra.start_point_date = get_trade_day(current_date, 0)

  and std.stock_code = stra.stock_code
  and std.trade_date = stra.trade_date
  and std.trade_num >= 80000
  and std.close_price >= 10

order by sbi.industry_name
;

