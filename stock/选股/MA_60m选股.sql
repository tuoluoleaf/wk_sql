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
from stock_ma_60m smdCurrent,
     stock_ma_60m smdBefore,
     stock_base_info sbi,
     stock_trade_dn stdCurrent
         left join stock_ma_60m smdAfter on smdAfter.stock_code = stdCurrent.stock_code and
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







