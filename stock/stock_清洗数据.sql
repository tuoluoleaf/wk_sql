-- ---------------   去除两边空格  ----------------------------
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
select * from stock_base_info where stock_code is null or stock_name is null;
select * from main_force_secret where stock_code is null or stock_name is null;
select * from magical_nine_turn where stock_code is null or stock_name is null;


select * from stock_industry_tmp where stock_code is null or stock_name is null;

-- --------------------------------- 去重 ---------------------
#股票信息
select *
from (select t.*,
             row_number() over (partition by stock_code) rn
      from stock_base_info t) tmp
where rn > 1
;
select *
from (select t.*,
             row_number() over (partition by stock_name) rn
      from stock_base_info t) tmp
where rn > 1
;

#神奇九转
select *
from (select t.*,
             row_number() over (partition by stock_code, signal_date, turn_type) rn
      from magical_nine_turn t) tmp
where rn > 1
;
select *
from (select t.*,
             row_number() over (partition by stock_name, signal_date, turn_type) rn
      from magical_nine_turn t) tmp
where rn > 1
;

#主力秘密
select *
from (select t.*,
             row_number() over (partition by stock_code, monitor_date, will) rn
      from main_force_secret t) tmp
where rn > 1
;
select *
from (select t.*,
             row_number() over (partition by stock_name, monitor_date, will) rn
      from main_force_secret t) tmp
where rn > 1
;

#股票行业中间表
select *
from (select t.*,
             row_number() over (partition by stock_code) rn
      from stock_industry_tmp t) tmp
where rn > 1
;
select *
from (select t.*,
             row_number() over (partition by stock_name) rn
      from stock_industry_tmp t) tmp
where rn > 1
;

-- -----------------------添加：股票行业---------------------------
-- 添加：股票行业
update stock_base_info t1
set industry_name = (select industry_name from stock_industry_tmp t2 where t1.stock_code = t2.stock_code)
where industry_name is null
;

-- ------------------ 增量股票信息 ------------------
#stock_base_info：缺失的股票 <-- stock_industry_tmp
select distinct stock_code, stock_name
from stock_industry_tmp
where stock_code not in (select stock_code from stock_base_info)
;