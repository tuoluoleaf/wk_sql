select t1.stock_code,
       t1.stock_name,
       t1.trade_date                                                        as t,
       t1.industry_name,
       t1.close_price                                                       as t_close_price,
       t2.highest_price                                                     as t1_h_price,
       t2.lowest_price                                                      as t1_l_price,
       t2.zd                                                                as t1_zd,
       round((t2.highest_price - t1.close_price) / t1.close_price * 100, 2) as t1_dpy,
       round((t2.lowest_price - t1.close_price) / t1.close_price * 100, 2)  as t1_xpy,
       t2.lowest_price >= t1.close_price * 0.99                             as t1_toUp,
       t2.zd
from stock_result_1 t1,
     stock_trade_dn t2,
     stock_trade_dn t3
where t1.stock_code = t2.stock_code
  and t2.trade_date = get_trade_day(t1.trade_date, 1)
  and t3.stock_code = t1.stock_code
  and t3.trade_date = get_trade_day(t1.trade_date, 2)
order by t1.trade_date desc, t1.industry_name