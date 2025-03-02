# 9:30            1
# 9:30 - 10:00    2
# 10:00 - 10:30   3


-- 首板，时间段分布
select zt.zt_time_level,
       count(0)
from stock_zt zt
where (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4%' and zt.stock_code not like '8%' and zt.stock_code not like '9%')
  and zt.zd < 10.2
  and zt.zt_continue_num = 1
group by zt.zt_time_level
order by zt.zt_time_level
;


-- 1进2晋级成功，首板涨停时间分布
select zt.zt_time_level,
       count(0)
from stock_zt zt,
     stock_trade_dn trade_next
where (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4%' and zt.stock_code not like '8%' and zt.stock_code not like '9%')
  and zt.zd < 10.2
  and zt.zt_continue_num = 1

  -- 隔日
  and trade_next.stock_code = zt.stock_code
  and trade_next.trade_date = get_trade_day(zt.trade_date, 1)
  and trade_next.zd > 9.7
group by zt.zt_time_level
order by zt.zt_time_level
;


select zt.stock_code,
       zt.stock_name,
       zt.trade_date,
       zt.trade_money,
       zt.lt_market_value,
       zt.first_zt_time,
       zt.last_zt_time,
       zt.fb_money,
       zt.zt_time_level,
       trade_next.zd as next_zd
from stock_zt zt,
     stock_trade_dn trade_next
where (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4%' and zt.stock_code not like '8%' and zt.stock_code not like '9%')
  and zt.zd < 10.2
#   and zt.zt_time_level in (2)

  -- 隔日
  and zt.zt_continue_num = 1
  and trade_next.stock_code = zt.stock_code
  and trade_next.trade_date = get_trade_day(zt.trade_date, 1)
  and trade_next.zd > 9.7
order by zt.trade_date desc, zt.last_zt_time;


-- 首板，隔日溢价
select t.zt_time_level,
       avg(t.next_open_zd),
       avg(t.next_closse_zd),
       avg(t.next_highest_zd),
       avg(t.next_lowest_price)
from (select zt.zt_time_level,
             round((trade_next.open_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2)    as next_open_zd,
             trade_next.zd                                                                                                                                            as next_closse_zd,
             round((trade_next.highest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2) as next_highest_zd,
             round((trade_next.lowest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2)  as next_lowest_price
      from stock_zt zt,
           stock_trade_dn trade_next
      where (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4%' and zt.stock_code not like '8%' and zt.stock_code not like '9%')
        and zt.zd < 10.2
        and zt.zt_continue_num = 1

        -- 隔日
        and trade_next.stock_code = zt.stock_code
        and trade_next.trade_date = get_trade_day(zt.trade_date, 1)) t
group by t.zt_time_level
order by t.zt_time_level
;


-- 重点时间段2
select zt.stock_code,
       zt.stock_name,
       zt.trade_date,
       zt.trade_money,
       zt.lt_market_value,
       zt.first_zt_time,
       zt.last_zt_time,
       zt.fb_money,
       zt.zt_time_level,
       trade_next.zd                                                                                                                                            as next_zd,
       round((trade_next.highest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2) as next_highest_zd,
       round((trade_next.lowest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2)  as next_lowest_price
from stock_zt zt
         left join stock_trade_dn trade_next on trade_next.stock_code = zt.stock_code and trade_next.trade_date = get_trade_day(zt.trade_date, 1)
where (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4%' and zt.stock_code not like '8%' and zt.stock_code not like '9%')
  and zt.zd < 10.2
  and zt.zt_time_level in (2)
  and zt.zt_continue_num = 1
order by zt.trade_date desc, zt.last_zt_time
;

-- 一字板 炸板 回封
select zt.zt_time_level,
       zt.*
from stock_zt zt
where (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4%' and zt.stock_code not like '8%' and zt.stock_code not like '9%')
  and zt.zd < 10.2
  and zt.zt_continue_num = 1
  and zt.first_zt_time <= '09:30:00'
  and zb_count >= 1
;

select zt.stock_code,
       zt.stock_name,
       zt.trade_date,
       zt.trade_money,
       zt.lt_market_value,
       zt.first_zt_time,
       zt.last_zt_time,
       zt.fb_money,
       zt.zt_time_level,
       trade_next.zd                                                                                                                                            as next_zd,
       round((trade_next.highest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2) as next_highest_zd,
       round((trade_next.lowest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2)  as next_lowest_price
from stock_zt zt
         left join stock_trade_dn trade_next on trade_next.stock_code = zt.stock_code and trade_next.trade_date = get_trade_day(zt.trade_date, 1)
where (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4%' and zt.stock_code not like '8%' and zt.stock_code not like '9%')
  and zt.zd < 10.2
  and zt.zt_continue_num = 1
  -- 一字板 炸板 回封
  and zt.first_zt_time <= '09:30:00'
  and zb_count >= 1
  -- 回封时间2
  and zt.zt_time_level in (2)
order by zt.trade_date desc, zt.last_zt_time
;

select zt.stock_code,
       zt.stock_name,
       zt.trade_date,
       zt.trade_money,
       zt.lt_market_value,
       zt.first_zt_time,
       zt.last_zt_time,
       zt.fb_money,
       zt.zt_time_level,
       trade_next.zd                                                                                                                                            as next_zd,
       round((trade_next.highest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2) as next_highest_zd,
       round((trade_next.lowest_price - (trade_next.close_price / (1 + trade_next.zd / 100))) / (trade_next.close_price / (1 + trade_next.zd / 100)) * 100, 2)  as next_lowest_price
from stock_zt zt
         left join stock_trade_dn trade_next on trade_next.stock_code = zt.stock_code and trade_next.trade_date = get_trade_day(zt.trade_date, 1)
where zt.stock_code not like '30%'
  and zt.stock_code not like '688%'
  and zt.zt_continue_num = 1
  -- 非开盘一字
  and zt.first_zt_time > '09:30:00'
  -- 回封时间2
  and zt.zt_time_level in (2)
order by zt.trade_date desc, zt.last_zt_time
;