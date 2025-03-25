select zt.trade_date,
       zt.stock_code,
       zt.stock_name,
       zt_continue_num,
       zt.first_zt_time,
       zt.last_zt_time
from stock_zt zt
         left join stock_base_info base on base.stock_code = zt.stock_code
order by trade_date desc, zt_continue_num desc
;


-- 今日：主板2板 or 非主板首板
select zt.trade_date,
       zt.stock_code,
       zt.stock_name,
       if(zt.zd > 11, '一板', '2板') as continue_num
from stock_zt zt
where zt.trade_date >= date'2025-03-21'
  and ((zt.zd < 11 and zt_continue_num = 2) or (zt.zd > 11 and zt_continue_num = 1))
order by zt.trade_date, zt.last_zt_time
;


-- 领涨梯队
select zt.trade_date,
       concat(zt.stock_name,
              zt.zt_continue_num)
from stock_zt zt
where zt.trade_date >= date'2025-03-24'
  and zt_continue_num >= 3
order by zt.trade_date desc, zt.zt_continue_num desc, zt.last_zt_time
;


-- -------------------------------------------- tmp ----------------
-- 最近涨幅
select zt.trade_date,
       zt.stock_code,
       zt.stock_name,
       '2板' as continue_num,
       a1.zd,
       a2.zd,
       a3.zd,
       a4.zd,
       a5.zd,
       a6.zd,
       a7.zd,
       zt.first_zt_time,
       zt.last_zt_time
from stock_zt zt
         left join stock_trade_dn a1 on a1.stock_code = zt.stock_code and a1.trade_date = get_trade_day(zt.trade_date, 1)
         left join stock_trade_dn a2 on a2.stock_code = zt.stock_code and a2.trade_date = get_trade_day(zt.trade_date, 2)
         left join stock_trade_dn a3 on a3.stock_code = zt.stock_code and a3.trade_date = get_trade_day(zt.trade_date, 3)
         left join stock_trade_dn a4 on a4.stock_code = zt.stock_code and a4.trade_date = get_trade_day(zt.trade_date, 4)
         left join stock_trade_dn a5 on a5.stock_code = zt.stock_code and a5.trade_date = get_trade_day(zt.trade_date, 5)
         left join stock_trade_dn a6 on a6.stock_code = zt.stock_code and a6.trade_date = get_trade_day(zt.trade_date, 6)
         left join stock_trade_dn a7 on a7.stock_code = zt.stock_code and a7.trade_date = get_trade_day(zt.trade_date, 7)
where zt.trade_date >= date'2025-03-21'
  and ((zt.zd < 11 and zt_continue_num = 2) or (zt.zd > 11 and zt_continue_num = 1))
order by zt.trade_date, zt.last_zt_time
;


-- 历史数据，今日涨幅
select a1.zd,
       zt.stock_name,
       zt.stock_code,
       zt.trade_date
from stock_zt zt
         left join stock_trade_dn a1 on a1.stock_code = zt.stock_code and a1.trade_date = date'2025-03-19'
where zt.trade_date >= date'2025-03-10'
  and ((zt.zd < 11 and zt_continue_num = 2) or (zt.zd > 11 and zt_continue_num = 1))
order by zt.trade_date, zt.last_zt_time
;



select distinct zt.stock_code, zt.stock_name
from stock_zt zt
where (zt.stock_code not like '30%' and zt.stock_code not like '688%' and zt.stock_code not like '4%' and zt.stock_code not like '8%' and zt.stock_code not like '9%')
  and zt.zt_continue_num >= 4
;
