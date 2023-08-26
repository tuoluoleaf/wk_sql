-- MA 选股

select
       smd.stock_code,
       smd.stock_name,
       sbi.industry_name,
       smd.trade_date,
       std.zd,
       std.close_price,
       std.trade_num/10000 as trade_num,
       smd.ma5,
       smd.ma10,
       smd.ma20,
       smdBefore.ma5 as ma5B,
       smdBefore.ma10 as ma10B,
       smdBefore.ma20 as ma20B
from stock_ma_dn smd,
     stock_ma_dn smdBefore,
     stock_base_info sbi,
     stock_trade_dn std
where 1 = 1
  and smd.trade_date = get_trade_day(current_date, 0)
#   and smd.trade_date = date'2023-06-15'
#   and smd.trade_date = date'2023-08-24'
  and smdBefore.stock_code = smd.stock_code
  and smdBefore.trade_date = get_trade_day(smd.trade_date, -1)
  and abs((smd.ma20 - smd.ma5)/smd.ma5) < 0.005
  and smdBefore.ma20 > smdBefore.ma5
  and smdBefore.ma20 > smdBefore.ma10


  and sbi.stock_code = smd.stock_code
  and std.stock_code = smd.stock_code
  and std.trade_date = smd.trade_date
  and std.close_price >= 10
  and std.trade_num >= 50000

order by sbi.industry_name
;

