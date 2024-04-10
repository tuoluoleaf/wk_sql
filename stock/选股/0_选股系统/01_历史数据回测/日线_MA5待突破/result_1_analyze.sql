select t.stock_code,
       t.stock_name,
       t.trade_date                                                       as t,
       t.industry_name,
       t.close_price                                                      as t_close_price,
       t1.highest_price                                                   as t1_h_price,
       t1.lowest_price                                                    as t1_l_price,
       t1.zd                                                              as t1_zd,
       round((t1.highest_price - t.close_price) / t.close_price * 100, 2) as t1_dpy,
       round((t1.lowest_price - t.close_price) / t.close_price * 100, 2)  as t1_xpy,
       t1.lowest_price >= t.close_price * 0.99                            as t1_toUp,
       t1.zd
from stock_result_1 t,
     stock_trade_dn t1,
     stock_trade_dn t2
where t.stock_code = t1.stock_code
  and t1.trade_date = get_trade_day(t.trade_date, 1)
  and t2.stock_code = t.stock_code
  and t2.trade_date = get_trade_day(t.trade_date, 2)
order by t.trade_date desc, t.industry_name