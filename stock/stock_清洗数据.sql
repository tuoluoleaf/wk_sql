-- ---------------   去除两边空格  ----------------------------
select '去除两边空格' from dual;
update stock_industry_tmp
set stock_code = replace(trim(stock_code), '\r', ''),
    stock_name = replace(trim(stock_name), '\r', ''),
    industry_name = replace(trim(industry_name), '\r', '')
;

update stock_base_info
set  stock_code = replace(trim(stock_code), '\r', ''),
    stock_name = replace(trim(stock_name), '\r', ''),
    industry_name = replace(trim(industry_name), '\r', '')
;

update magical_nine_turn
set   stock_code = replace(trim(stock_code), '\r', ''),
    stock_name = replace(trim(stock_name), '\r', ''),
    turn_type = replace(trim(turn_type), '\r', '')
;

update main_force_secret
set   stock_code = replace(trim(stock_code), '\r', ''),
    stock_name = replace(trim(stock_name), '\r', ''),
    will = replace(trim(will), '\r', '')
;

update industry_category
set industry_code = replace(trim(industry_code), '\r', ''),
    industry_name = replace(trim(industry_name), '\r', '')
;


-- -------------- 空数据 ---------------
select '空数据' from dual;

select * from stock_base_info where stock_code is null or stock_name is null;
select * from main_force_secret where stock_code is null or stock_name is null;
select * from magical_nine_turn where stock_code is null or stock_name is null;

select * from stock_industry_tmp where stock_code is null or stock_name is null;



-- --------------------------------- 去重 ---------------------
select '去重_股票信息' from dual;
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

select '去重_神奇九转' from dual;
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


select '去重_主力秘密' from dual;
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


select '去重_股票行业中间表' from dual;
#股票行业中间表
select t1.*
from stock_industry_tmp t1,
    (select t.*,
         row_number() over (partition by stock_code) rn
    from stock_industry_tmp t) t2
where t1.stock_code = t2.stock_code and t2.rn > 1
order by t1.stock_code
;

select t1.*
from stock_industry_tmp t1,
    (select t.*,
         row_number() over (partition by stock_name) rn
    from stock_industry_tmp t) t2
where t1.stock_name = t2.stock_name and t2.rn > 1
order by t1.stock_name
;

-- -----------------------添加：股票行业---------------------------
select '添加：股票行业' from dual;
-- 添加：股票行业
update stock_base_info t1
set industry_name = (select industry_name from stock_industry_tmp t2 where t1.stock_code = t2.stock_code)
where industry_name is null
;


select '增量股票信息' from dual;
-- ------------------ 增量股票信息 ------------------
#stock_base_info：缺失的股票 <-- stock_industry_tmp
select distinct stock_code, stock_name
from stock_industry_tmp
where stock_code not in (select stock_code from stock_base_info)
;