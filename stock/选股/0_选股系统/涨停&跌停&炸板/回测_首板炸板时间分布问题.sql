# 9:30            1
# 9:30 - 10:00    2
# 10:00 - 10:30   3


-- 炸板，时间段分布
select zb.zb_time_level,
       count(0)
from stock_zb zb
where (zb.stock_code not like '30%' and zb.stock_code not like '688%' and zb.stock_code not like '4%' and zb.stock_code not like '8%' and zb.stock_code not like '9%')
  and zb.zd < 10.2
  and zb.zb_for_zt_point = 1
group by zb.zb_time_level
order by zb.zb_time_level
;


-- 炸板，隔日溢价
select t.zb_time_level,
       avg(t.current_zd),
       avg(t.next_zd),
       avg(t.next_open_zd),
       avg(t.next_highest_zd),
       avg(t.next_lowest_price)
from (select zb.zb_time_level,
             (1 - zb.zd)                                                                                                                                              as current_zd,
             trade_next.zd                                                                                                                                            as next_zd,
             round((trade_next.open_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2)    as next_open_zd,
             round((trade_next.highest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2) as next_highest_zd,
             round((trade_next.lowest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2)  as next_lowest_price
      from stock_zb zb,
           stock_trade_dn trade_next
      where (zb.stock_code not like '30%' and zb.stock_code not like '688%' and zb.stock_code not like '4%' and zb.stock_code not like '8%' and zb.stock_code not like '9%')
        and zb.zd < 10.2
        and zb.zb_for_zt_point = 1
        and trade_next.stock_code = zb.stock_code
        and trade_next.trade_date = get_trade_day(zb.trade_date, 1)) t
group by t.zb_time_level
order by t.zb_time_level
;
