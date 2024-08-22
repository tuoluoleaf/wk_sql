select t1.stock_code,
       t1.stock_name,
       t1.trade_date                                                      as t1_trade_date,
       t2.trade_date                                                      as t2_trade_date,
       t1.industry_name,
       t1.close_price                                                     as t1_close_price,
       t2.close_price                                                     as t2_close_price,
       round((t2.close_price - t1.close_price) / t1.close_price * 100, 2) as sum_zd
from stock_result_1 t1,
     stock_trade_dn t2
where t1.stock_code = t2.stock_code
  and t2.trade_date = get_trade_day(t1.trade_date, 5)
order by t1.trade_date desc, t1.industry_name