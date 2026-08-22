# 9:30            1
# 9:30 - 10:00    2
# 10:00 - 10:30   3


-- 2板，时间段分布
select zt.zt_time_level,
       count(0)
from stock_zt zt
where (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4%' and zt.stock_code not like '8%' and zt.stock_code not like '9%')
  and zt.zd < 10.2
  and zt.zt_continue_num = 2
  -- 回封板
#   and zt.last_zt_time != zt.first_zt_time

group by zt.zt_time_level
order by zt.zt_time_level
;


-- 2进3晋级成功，首板涨停时间分布
select zt.zt_time_level,
       count(0)
from stock_zt zt,
     stock_trade trade_next
where (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4%' and zt.stock_code not like '8%' and zt.stock_code not like '9%')
  and zt.zd < 10.2
  and zt.zt_continue_num = 2
  -- 回封板
  and zt.last_zt_time != zt.first_zt_time

  -- 隔日
  and trade_next.stock_code = zt.stock_code
  and trade_next.trade_date = get_trade_day(zt.trade_date, 1)
  and trade_next.zd > 9.7
group by zt.zt_time_level
order by zt.zt_time_level
;


-- 2板，隔日溢价
select t.zt_time_level,
       count(0)                           as count_sum,
       round(avg(t.next_open_zd), 2)      as next_open_zd,
       round(avg(t.next_closse_zd), 2)    as next_closse_zd,
       round(avg(t.next_highest_zd), 2)   as next_highest_zd,
       round(avg(t.next_lowest_price), 2) as next_lowest_price
from (select zt.zt_time_level,
             round((trade_next.open_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2)    as next_open_zd,
             trade_next.zd                                                                                                                                            as next_closse_zd,
             round((trade_next.highest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2) as next_highest_zd,
             round((trade_next.lowest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2)  as next_lowest_price
      from stock_zt zt,
           stock_trade trade_next
      where (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4%' and zt.stock_code not like '8%' and zt.stock_code not like '9%')
        and zt.zd < 10.2
        and zt.zt_continue_num = 2
#         and zt.trade_date = date'2025-03-04'
        -- 回封板
        and zt.last_zt_time != zt.first_zt_time

        -- 隔日
        and trade_next.stock_code = zt.stock_code
        and trade_next.trade_date = get_trade_day(zt.trade_date, 1)) t
group by t.zt_time_level
order by t.zt_time_level
;





-- 炸板，时间段分布
select zb.zb_time_level,
       count(0)
from stock_zb zb
where (zb.stock_code not like '30%' and zb.stock_code not like '688%' and zb.stock_code not like '4%' and zb.stock_code not like '8%' and zb.stock_code not like '9%')
  and zb.zd < 10.2
  and zb.zb_for_zt_point = 2
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
           stock_trade trade_next
      where (zb.stock_code not like '30%' and zb.stock_code not like '688%' and zb.stock_code not like '4%' and zb.stock_code not like '8%' and zb.stock_code not like '9%')
        and zb.zd < 10.2
        and zb.zb_for_zt_point = 2
        and trade_next.stock_code = zb.stock_code
        and trade_next.trade_date = get_trade_day(zb.trade_date, 1)) t
group by t.zb_time_level
order by t.zb_time_level
;
