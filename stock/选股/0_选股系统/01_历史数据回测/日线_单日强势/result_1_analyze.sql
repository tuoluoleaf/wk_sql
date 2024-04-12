select t.stock_code,
       t.stock_name,
       t.industry_name,
       t.trade_date                                                      as t,
       t.zd                                                              as t_zd,
       t.close_price                                                     as t_close_price,
       t1.lowest_price                                                   as t1_l_price,
       t1.zd                                                             as t1_zd,
       round((t1.lowest_price - t.close_price) / t.close_price * 100, 2) as py,
       t1.lowest_price >= t.close_price * 1                              as toUp
from stock_result_1 t,
     stock_trade_dn t1
where t.stock_code = t1.stock_code
  and t1.trade_date = get_trade_day(t.trade_date, 1)
order by t.trade_date desc, t.industry_name
