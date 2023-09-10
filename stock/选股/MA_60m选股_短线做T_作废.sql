-- MA_60M：底部反转，做T
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       sbi.industry_name,
       smaCurrent.trade_date_time,
#        stdCurrent.zd,
#        stdCurrent.hs,
#        stdAfter.zd,
#        stdAfter.hs,
       (select sum(t.zd)
        from stock_trade_dn t
        where smaCurrent.stock_code = t.stock_code
          and t.trade_date >= get_trade_day(smaCurrent.trade_date_time, 1)
          and t.trade_date <= get_trade_day(smaCurrent.trade_date_time, 2)) as sumZd,
#        stdCurrent.close_price,
#        stdCurrent.trade_num / 10000                                    as trade_num,
       smaCurrent.ma5,
       smaCurrent.ma10,
       smaCurrent.ma20
from stock_ma_60m smaCurrent,
     stock_ma_60m smaBefore,
     stock_base_info sbi
#      stock_trade_dn stdCurrent
#          left join stock_ma_60m smdAfter on smdAfter.stock_code = stdCurrent.stock_code and
#                                             smdAfter.trade_date = get_trade_day(stdCurrent.trade_date, 1)
#          left join stock_trade_dn stdAfter on stdAfter.stock_code = stdCurrent.stock_code and
#                                               stdAfter.trade_date = get_trade_day(stdCurrent.trade_date, 1)
where 1 = 1
#   and smdCurrent.trade_date_time = get_trade_60m(current_timestamp, -1)
  and smaCurrent.trade_date_time = timestamp '2023-09-05 11:30:00'
  and smaBefore.stock_code = smaCurrent.stock_code
  and smaBefore.trade_date_time = get_trade_60m(smaCurrent.trade_date_time, -1)
  and smaCurrent.ma5 >= smaCurrent.ma10
  and smaCurrent.ma10 >= smaCurrent.ma20
  and smaCurrent.ma60 > smaCurrent.ma5
  and !(smaBefore.ma5 >= smaBefore.ma10 and smaBefore.ma10 >= smaBefore.ma20)

  and sbi.stock_code = smaCurrent.stock_code
#   and stdCurrent.stock_code = smdCurrent.stock_code
#   and stdCurrent.trade_date = smdCurrent.trade_date
#   and stdCurrent.close_price >= 10
#   and stdCurrent.trade_num >= 50000

order by sbi.industry_name
;

select get_trade_day( timestamp '2023-09-06 11:30:00', 1);



