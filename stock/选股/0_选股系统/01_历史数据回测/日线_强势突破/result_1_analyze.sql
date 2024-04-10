select t1.stock_code,
       t1.stock_name,
       t1.trade_date as t,
       t1.industry_name,
       t1.close_price as t_close_price,
       t2.highest_price as t1_h_price,
       t2.lowest_price as t1_l_price,
       t2.lowest_price >= t1.close_price as toUp
from stock_result_1 t1,
     stock_trade_dn t2
where t1.stock_code = t2.stock_code
and t2.trade_date = get_trade_day(t1.trade_date, 1)
order by  t1.trade_date desc, t1.industry_name