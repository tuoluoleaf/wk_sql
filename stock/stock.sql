-- ---------------去除两边空格----------------------------
update stock_industry
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


-- -----------------------添加：股票行业---------------------------
create table stock_industry
(
    stock_code    varchar(10) comment '股票代码',
    stock_name    varchar(20) comment '股票名称',
    industry_name varchar(20) comment '行业名称'
);

-- stock_base_inf：缺失的股票
select *
from stock_industry
where stock_code not in (select stock_code from stock_base_info)
;

select (select count(1) from stock_base_info where industry_name = '酒类') as num1,
       (select count(1) from stock_industry)                               as num2
from dual;

# truncate table stock_industry;
