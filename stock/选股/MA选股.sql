-- MA 选股1：
# smdCurrent.ma5 = smdCurrent.ma20
# and smdBefore.ma20 > smdBefore.ma5
# and smdBefore.ma20 > smdBefore.ma10

select smdCurrent.stock_code,
       smdCurrent.stock_name,
       sbi.industry_name,
       smdCurrent.trade_date,
       std.zd,
       (select sum(t.zd)
        from stock_trade_dn t
        where smdCurrent.stock_code = t.stock_code
          and t.trade_date >= get_trade_day(smdCurrent.trade_date, 1)
          and t.trade_date <= get_trade_day(smdCurrent.trade_date, 5)) as sumZd,
       std.close_price,
       std.trade_num / 10000                                           as trade_num,
       smdCurrent.ma5,
       smdCurrent.ma10,
       smdCurrent.ma20,
       smdBefore.ma5                                                   as ma5B,
       smdBefore.ma10                                                  as ma10B,
       smdBefore.ma20                                                  as ma20B
from stock_ma_dn smdCurrent,
     stock_ma_dn smdBefore,
     stock_base_info sbi,
     stock_trade_dn std
where 1 = 1
  and smdCurrent.trade_date = get_trade_day(current_date, -5)
#   and smd.trade_date = date'2023-06-15'
#   and smd.trade_date = date'2023-08-28'
  and smdBefore.stock_code = smdCurrent.stock_code
  and smdBefore.trade_date = get_trade_day(smdCurrent.trade_date, -1)
  and abs((smdCurrent.ma20 - smdCurrent.ma5) / smdCurrent.ma5) < 0.005
  and smdBefore.ma20 > smdBefore.ma5
  and smdBefore.ma20 > smdBefore.ma10


  and sbi.stock_code = smdCurrent.stock_code
  and std.stock_code = smdCurrent.stock_code
  and std.trade_date = smdCurrent.trade_date
  and std.close_price >= 10
  and std.trade_num >= 50000

order by sbi.industry_name
;


-- MA 选股2：
# smdCurrent.ma5 >= smdCurrent.ma10
# and smdCurrent.ma20 > smdCurrent.ma10
# and smdCurrent.ma20 > smdCurrent.ma5
# and smdBefore.ma20 > smdBefore.ma10
# and smdBefore.ma10 > smdBefore.ma5

select smdCurrent.stock_code,
       smdCurrent.stock_name,
       sbi.industry_name,
       smdCurrent.trade_date,
       std.zd,
       (select sum(t.zd)
        from stock_trade_dn t
        where smdCurrent.stock_code = t.stock_code
          and t.trade_date >= get_trade_day(smdCurrent.trade_date, 1)
          and t.trade_date <= get_trade_day(smdCurrent.trade_date, 5)) as sumZd,
       std.close_price,
       std.trade_num / 10000                                           as trade_num,
       smdCurrent.ma5,
       smdCurrent.ma10,
       smdCurrent.ma20,
       smdBefore.ma5                                                   as ma5B,
       smdBefore.ma10                                                  as ma10B,
       smdBefore.ma20                                                  as ma20B
from stock_ma_dn smdCurrent,
     stock_ma_dn smdBefore,
     stock_base_info sbi,
     stock_trade_dn std
where 1 = 1
  and smdCurrent.trade_date = get_trade_day(current_date, -9)
#   and smd.trade_date = date'2023-06-15'
  and smdBefore.stock_code = smdCurrent.stock_code
  and smdBefore.trade_date = get_trade_day(smdCurrent.trade_date, -1)
  and abs((smdCurrent.ma10 - smdCurrent.ma5) / smdCurrent.ma5) < 0.005
  and smdCurrent.ma20 > smdCurrent.ma10
  and smdCurrent.ma20 > smdCurrent.ma5
  and smdBefore.ma20 > smdBefore.ma10
  and smdBefore.ma10 > smdBefore.ma5

  and sbi.stock_code = smdCurrent.stock_code
  and std.stock_code = smdCurrent.stock_code
  and std.trade_date = smdCurrent.trade_date
  and std.close_price >= 10
  and std.trade_num >= 50000

order by sbi.industry_name
;



-- MA 选股3：
# and smdCurrent.ma5 >= smdCurrent.ma10
# and smdCurrent.ma20 >= smdCurrent.ma10

select smdCurrent.stock_code,
       smdCurrent.stock_name,
       sbi.industry_name,
       smdCurrent.trade_date,
       stdCurrent.zd,
       stdCurrent.hs,
       stdAfter.zd,
       stdAfter.hs,
       (select sum(t.zd)
        from stock_trade_dn t
        where smdCurrent.stock_code = t.stock_code
          and t.trade_date >= get_trade_day(smdCurrent.trade_date, 2)
          and t.trade_date <= get_trade_day(smdCurrent.trade_date, 6)) as sumZd,
       stdCurrent.close_price,
       stdCurrent.trade_num / 10000                                    as trade_num,
       smdCurrent.ma5,
       smdCurrent.ma10,
       smdCurrent.ma20
from stock_ma_dn smdCurrent,
     stock_ma_dn smdBefore,
     stock_base_info sbi,
     stock_trade_dn stdCurrent
         left join stock_ma_dn smdAfter on smdAfter.stock_code = stdCurrent.stock_code and
                                           smdAfter.trade_date = get_trade_day(stdCurrent.trade_date, 1)
         left join stock_trade_dn stdAfter on stdAfter.stock_code = stdCurrent.stock_code and
                                              stdAfter.trade_date = get_trade_day(stdCurrent.trade_date, 1)
where 1 = 1
  and smdCurrent.trade_date = get_trade_day(current_date, -50)
#   and smd.trade_date = date'2023-06-15'
  and smdBefore.stock_code = smdCurrent.stock_code
  and smdBefore.trade_date = get_trade_day(smdCurrent.trade_date, -1)
  and smdCurrent.ma5 >= smdCurrent.ma20
  and smdCurrent.ma20 >= smdCurrent.ma10
  and smdBefore.ma20 >= smdBefore.ma5
  and smdBefore.ma5 >= smdBefore.ma10

  and sbi.stock_code = smdCurrent.stock_code
  and stdCurrent.stock_code = smdCurrent.stock_code
  and stdCurrent.trade_date = smdCurrent.trade_date
  and stdCurrent.close_price >= 10
  and stdCurrent.trade_num >= 50000

order by sbi.industry_name
;


-- MA 选股3：
# 多头趋势

select smdCurrent.stock_code,
       smdCurrent.stock_name,
       sbi.industry_name,
       smdCurrent.trade_date,
       stdCurrent.zd,
       stdCurrent.hs,
       stdAfter.zd,
       stdAfter.hs,
       (select sum(t.zd)
        from stock_trade_dn t
        where smdCurrent.stock_code = t.stock_code
          and t.trade_date >= get_trade_day(smdCurrent.trade_date, 2)
          and t.trade_date <= get_trade_day(smdCurrent.trade_date, 8)) as sumZd,
       stdCurrent.close_price,
       stdCurrent.trade_num / 10000                                    as trade_num,
       smdCurrent.ma5,
       smdCurrent.ma10,
       smdCurrent.ma20
from stock_ma_dn smdCurrent,
     stock_ma_dn smdBefore,
     stock_base_info sbi,
     stock_trade_dn stdCurrent
         left join stock_ma_dn smdAfter on smdAfter.stock_code = stdCurrent.stock_code and
                                           smdAfter.trade_date = get_trade_day(stdCurrent.trade_date, 1)
         left join stock_trade_dn stdAfter on stdAfter.stock_code = stdCurrent.stock_code and
                                              stdAfter.trade_date = get_trade_day(stdCurrent.trade_date, 1)
where 1 = 1
  and smdCurrent.trade_date = get_trade_day(current_date, -0)
#   and smd.trade_date = date'2023-06-15'
  and smdBefore.stock_code = smdCurrent.stock_code
  and smdBefore.trade_date = get_trade_day(smdCurrent.trade_date, -1)
  and smdCurrent.ma5 >= smdCurrent.ma10
  and smdCurrent.ma10 >= smdCurrent.ma20
  and !(smdBefore.ma5 >= smdBefore.ma10 and smdBefore.ma10 >= smdBefore.ma20)

  and sbi.stock_code = smdCurrent.stock_code
  and stdCurrent.stock_code = smdCurrent.stock_code
  and stdCurrent.trade_date = smdCurrent.trade_date
  and stdCurrent.close_price >= 10
  and stdCurrent.trade_num >= 50000

order by sbi.industry_name
;







