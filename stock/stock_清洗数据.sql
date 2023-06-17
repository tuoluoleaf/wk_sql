-- ---------------   去除两边空格、中间空格  ----------------------------

update stock_base_info
set stock_code    = replace(replace(trim(stock_code), '\r', ''), ' ', ''),
    stock_name    = replace(replace(replace(trim(stock_name), '\r', ''), ' ', ''), '-U', ''),
    industry_name = replace(replace(trim(industry_name), '\r', ''), ' ', ''),
    market = replace(replace(replace(trim(market), '\r', ''), ' ', ''), '\n', '')
;

update magical_nine_turn
set stock_code = replace(replace(trim(stock_code), '\r', ''), ' ', ''),
    stock_name = replace(replace(trim(stock_name), '\r', ''), ' ', ''),
    turn_type  = replace(replace(trim(turn_type), '\r', ''), ' ', '')
;

update main_force_secret
set stock_code = replace(replace(trim(stock_code), '\r', ''), ' ', ''),
    stock_name = replace(replace(trim(stock_name), '\r', ''), ' ', ''),
    will       = replace(replace(trim(will), '\r', ''), ' ', '')
;

update industry_category
set industry_code = replace(replace(trim(industry_code), '\r', ''), ' ', ''),
    industry_name = replace(replace(trim(industry_name), '\r', ''), ' ', '')
;

-- --------------- 删除退市股票 ---------------
delete from stock_base_info where stock_name like '%退市%' and stock_name like '%退%';



-- -------------- 空数据 ---------------
select * from stock_base_info where stock_code is null or stock_name is null;
select * from main_force_secret where stock_code is null or stock_name is null;
select * from magical_nine_turn where stock_code is null or stock_name is null;




-- --------------------------------- 去重 ---------------------
#股票信息
select t1.*
from stock_base_info t1,
    (select t.*,
         row_number() over (partition by stock_code) rn
    from stock_base_info t) t2
where t1.stock_code = t2.stock_code and t2.rn > 1
order by t1.stock_code
;

select t1.*
from stock_base_info t1,
    (select t.*,
         row_number() over (partition by stock_name) rn
    from stock_base_info t) t2
where t1.stock_name = t2.stock_name and rn > 1
order by t1.stock_name
;

#神奇九转
select t1.*
from magical_nine_turn t1,
    (select t.*,
            row_number() over (partition by stock_code, signal_date, turn_type) rn
    from magical_nine_turn t) t2
where t1.stock_code = t2.stock_code and t1.signal_date = t2.signal_date and t1.turn_type = t2.turn_type and t2.rn > 1
order by t1.stock_code
;

select t1.*
from magical_nine_turn t1,
    (select t.*,
         row_number() over (partition by stock_name, signal_date, turn_type) rn
    from magical_nine_turn t) t2
where t1.stock_name = t2.stock_name and t1.signal_date = t2.signal_date and t1.turn_type = t2.turn_type and t2.rn > 1
order by t1.stock_name
;


#主力秘密
select t1.*
from main_force_secret t1,
    (select t.*,
         row_number() over (partition by stock_code, monitor_date, will) rn
    from main_force_secret t) t2
where t1.stock_code = t2.stock_code and t1.monitor_date = t2.monitor_date and t1.will = t2.will and t2.rn > 1
order by t1.stock_code
;

select t1.*
from main_force_secret t1,
    (select t.*,
         row_number() over (partition by stock_name, monitor_date, will) rn
    from main_force_secret t) t2
where t1.stock_name = t2.stock_name and t1.monitor_date = t2.monitor_date and t1.will = t2.will and t2.rn > 1
order by t1.stock_name
;

-- macd
select t1.*
from stock_macd_dn t1,
    (select t.*,
         row_number() over (partition by stock_code, trade_date order by trade_date desc) rn
    from stock_macd_dn t) t2
where t1.stock_code = t2.stock_code and t1.trade_date = t2.trade_date and t2.rn > 1
order by t1.stock_code
;

-- trade
select t1.*
from stock_trade_dn t1,
    (select t.*,
         row_number() over (partition by stock_code, trade_date order by trade_date desc) rn
    from stock_trade_dn t) t2
where t1.stock_code = t2.stock_code and t1.trade_date = t2.trade_date and t2.rn > 1
order by t1.stock_code
;



-- ------------------ 增量股票信息 ------------------
#stock_base_info：缺失的股票 <-- main_force_secret
select *
from main_force_secret
where stock_code not in (select stock_code from stock_base_info)
and stock_name not like '%退%'
order by stock_code
;

#stock_base_info：缺失的股票 <-- magical_nine_turn
select *
from magical_nine_turn
where stock_code not in (select stock_code from stock_base_info)
and stock_name not like '%退%'
order by stock_code
;


-- ----------------- 股票成交量 --------------------------
# update stock_base_info
# set turnover_gt_8w = '是'
# where stock_code in (select distinct stock_code from stock_daily_turnover where turnover >= 80000);

# update stock_base_info
# set turnover_gt_8w = '否'
# where stock_code in (select distinct stock_code from stock_daily_turnover where turnover < 80000);

select * from stock_base_info where turnover_gt_8w is null;



-- ----------------数据清洗 成交信息 && MACD ----------
select trade_date, count(0)
from stock_macd_dn
group by trade_date
order by trade_date desc;


select trade_date, count(0)
from stock_trade_dn
group by trade_date
order by trade_date desc;


select t1.*
from stock_macd_dn t1,
    (select t.*,
         row_number() over (partition by stock_code, trade_date) rn
    from stock_macd_dn t) t2
where t1.stock_code = t2.stock_code and t1.trade_date = t2.trade_date and t2.rn > 1
;


# delete
# from stock_macd_dn
# where id in (select t2.id
#              from (select t.*,
#                           row_number() over (partition by stock_code, trade_date) rn
#                    from stock_macd_dn t) t2
#              where t2.rn > 1)
# ;



select t1.*
from stock_trade_dn t1,
    (select t.*,
         row_number() over (partition by stock_code, trade_date) rn
    from stock_trade_dn t) t2
where t1.stock_code = t2.stock_code and t1.trade_date = t2.trade_date and t2.rn > 1
order by t1.stock_code
;
