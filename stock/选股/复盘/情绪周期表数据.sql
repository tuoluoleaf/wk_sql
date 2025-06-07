select tdate.trade_day,
       (select count(0) from stock_trade_dn trade where trade.trade_date = tdate.trade_day and trade.zd >= 0)                                                                                              as red_sum,
       (select count(0) from stock_trade_dn trade where trade.trade_date = tdate.trade_day and trade.zd < 0)                                                                                               as green_sum,
       (select count(0) from stock_zt zt where zt.trade_date = tdate.trade_day)                                                                                                                            as zt_sum,
       (select count(0) from stock_dt dt where dt.trade_date = tdate.trade_day)                                                                                                                            as dt_sum,
       (select count(0) from stock_zb zb where zb.trade_date = tdate.trade_day)                                                                                                                            as zb_sum,
       (select count(0) from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num = 1)                                                                                                 as 1b_sum,
       (select count(0) from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num >= 2)                                                                                                as lb_sum,

       -- 炸板
       (select count(0) from stock_zb zb where zb.trade_date = tdate.trade_day and zb.zb_for_zt_point = 2)                                                                                                 as 2zb_sum,
       (select GROUP_CONCAT(zb.stock_name order by zb.first_zt_time SEPARATOR ', ') from stock_zb zb where zb.trade_date = tdate.trade_day and zb.zb_for_zt_point = 2)                                     as 2zb_sum_stocks,

       -- 跌停
       (select count(0) from stock_dt dt where dt.trade_date = tdate.trade_day and dt.dt_continue_num = 2)                                                                                                 as 2dt_sum,
       (select GROUP_CONCAT(dt.stock_name SEPARATOR ', ') from stock_dt dt where dt.trade_date = tdate.trade_day and dt.dt_continue_num = 2)                                                               as 2dt_sum_stocks,
       (select count(0) from stock_dt dt where dt.trade_date = tdate.trade_day and dt.dt_continue_num >= 3)                                                                                                as 3dt_sum,
       (select GROUP_CONCAT(concat(dt.stock_name, dt.dt_continue_num) order by dt.dt_continue_num desc SEPARATOR ', ') from stock_dt dt where dt.trade_date = tdate.trade_day and dt.dt_continue_num >= 3) as 3dt_sum_stocks,

       -- 连板
       (select count(0) from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num = 2)                                                                                                 as 2lb_sum,
       (select GROUP_CONCAT(zt.stock_name order by zt.first_zt_time SEPARATOR ', ') from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num = 2)                                     as 2b_sum_stocks,
       (select count(0) from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num = 3)                                                                                                 as 3b_sum,
       (select GROUP_CONCAT(zt.stock_name order by zt.first_zt_time SEPARATOR ', ') from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num = 3)                                     as 3b_sum_stocks,
       (select count(0) from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num >= 4)                                                                                                as 4b_sum,
       (select GROUP_CONCAT(concat(zt.stock_name, zt.zt_continue_num) order by zt.zt_continue_num desc SEPARATOR ', ') from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num >= 4) as 4b_sum_stocks
from stock_trade_day tdate
where 1 = 1
#   and tdate.trade_day = date'2025-05-19'
  and tdate.trade_day >= date'2025-05-26'
  and tdate.trade_day < date'2025-07-01'
order by tdate.trade_day