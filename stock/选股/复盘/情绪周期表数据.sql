select tdate.trade_day,
       (select count(0) from stock_trade_dn trade where trade.trade_date = tdate.trade_day and trade.zd >= 0)                                                              as red_sum,
       (select count(0) from stock_trade_dn trade where trade.trade_date = tdate.trade_day and trade.zd < 0)                                                               as green_sum,
       (select count(0) from stock_zt zt where zt.trade_date = tdate.trade_day)                                                                                            as zt_sum,
       (select count(0) from stock_dt dt where dt.trade_date = tdate.trade_day)                                                                                            as dt_sum,
       (select count(0) from stock_zb zb where zb.trade_date = tdate.trade_day)                                                                                            as zb_sum,
       (select count(0) from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num >= 2)                                                                as lb_sum,
       (select count(0) from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num = 2)                                                                 as 2lb_sum,
       (select count(0) from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num = 3)                                                                 as 3b_sum,
       (select GROUP_CONCAT(concat(zt.stock_name, zt.zt_continue_num) SEPARATOR ', ') from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num = 3)  as 3b_sum_stocks,
       (select count(0) from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num >= 4)                                                                as 4b_sum,
       (select GROUP_CONCAT(concat(zt.stock_name, zt.zt_continue_num) order by zt.zt_continue_num desc SEPARATOR ', ') from stock_zt zt where zt.trade_date = tdate.trade_day and zt.zt_continue_num >= 4) as 4b_sum_stocks
from stock_trade_day tdate
where tdate.trade_day >= date'2024-01-01'
and tdate.trade_day < date'2025-01-01'
order by tdate.trade_day