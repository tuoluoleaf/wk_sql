

--  mac分析：波段
select sma.stock_code,
       sma.stock_name,
       sma.trade_date,
       sma.macd,
       sma.zd,
       sma.sum_zd,
       sma.peek_sum_zd,
       sma.find_point_date,
       sma.start_point_date,
       sma.end_point_date,
       sma.will
from stock_macd_analyze sma
where 1=1
and sma.end_point_date is not null
# and sma.find_point_date = sma.start_point_date
and stock_code = '600862'
order by sma.trade_date desc
;




-- macd：选股
select sma.stock_code,
       sma.stock_name,
       sma.trade_date,
       sma.macd,
       sma.zd,
       sma.sum_zd,
       sma.peek_sum_zd,
       sma.find_point_date,
       sma.start_point_date,
       sma.end_point_date,
       sma.will,
       sbi.industry_name
from stock_macd_analyze sma,
     stock_trade_dn std
         left join stock_base_info sbi on sbi.stock_code = std.stock_code
where 1 = 1
  and sma.find_point_date = sma.start_point_date
  and sma.start_point_date = get_trade_day(current_date, 0)

  and std.stock_code = sma.stock_code
  and std.trade_date = sma.trade_date
  and std.trade_num >= 80000
  and std.close_price >= 10

order by sbi.industry_name
;
