select date_format(t1.deadline_date, '%Y-%m-%d') as tdate,
       t1.stock_code,
       t1.stock_name,
       t1.holder_num / 1000                     as num,
       t2.close_price
from stock_holder_data t1,
     stock_trade_dn t2
where t1.stock_code = '603313'
  and t1.stock_code = t2.stock_code
  and t1.deadline_date = t2.trade_date
order by t1.deadline_date;
