select tmp.*,
       case
           when tmp.zd_next1 < -3 then -3.1
           when tmp.next_ma5_sum < 5 then -3.1
           else tmp.next_ma5_sum
           end as zd_next1_new
from (select t1.stock_code,
             t1.stock_name,
             t1.trade_date,
             t1.industry_name,
             t1.zd,
             t1.zd_next1,
             get_ma5_add(get_trade_day(t1.trade_date, 1), t1.stock_code) as next_ma5_sum
      from stock_result_20 t1
      where t1.zd < 9
        and t1.zd_next1 is not null) tmp
where tmp.next_ma5_sum = 0;
;

-- 第二日早出
select t1.stock_code,
             t1.stock_name,
             t1.trade_date,
             t1.industry_name,
             t1.zd,
             t1.zd_next1,
             (select round((a.highest_price-t1.close_price)/t1.close_price*100, 2) from stock_trade_dn a where a.stock_code = t1.stock_code and a.trade_date = get_trade_day(t1.trade_date, 1)) as next_h
      from stock_result_20 t1
      where t1.zd < 9
        and t1.zd_next1 is not null