select *
from (select t.stock_code,
             t.stock_name,
             t.industry_name,
             t.trade_date,
             t.close_price,
             t.ma5,
             round(t2.trade_money / 100000000, 2)                                  as trade_money,
             t.next_1_ma5,
             t.zd,
             t.next_1_zd,
             (t.next_2_zd + t.next_3_zd)                                           as 2_day,
             (t.next_2_zd + t.next_3_zd + t.next_4_zd)                             as 3_day,
             (t.next_2_zd + t.next_3_zd + t.next_4_zd + t.next_5_zd + t.next_6_zd) as 5_day,
             round((t.close_price - t.ma200)/t.ma200,2) as zb,
             row_number() over (partition by t.stock_code order by t.trade_date)      rn
      from stock_result_1 t,
           stock_trade_dn t2
      where t.close_price > t.next_1_ma5
        and t.next_1_zd >= 3
#         and t.next_1_zd < 7
#         and t.trade_date = ådate'2024-03-05'

        and t2.stock_code = t.stock_code
        and t2.trade_date = get_trade_day(t.trade_date, 1)
      order by t.trade_date desc, t.industry_name) tmp
where rn = 1
;

# truncate table stock_result_1;