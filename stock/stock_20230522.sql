-- 添加：股票行业
create table stock_base_info_tmp
(
    stock_code    varchar(10) comment '股票代码',
    stock_name    varchar(20) comment '股票名称',
    industry_name varchar(20) comment '行业名称'
);

select t1.*
from stock_base_info_tmp t1
where t1.stock_code not in (select stock_code from stock_base_info)
;

update stock_base_info
set industry_name = '酒类'
where stock_code in (select stock_code from stock_base_info_tmp)
;

select (select count(1) from stock_base_info where industry_name = '酒类') as num1,
       (select count(1) from stock_base_info_tmp)                          as num2
from dual;

truncate table stock_base_info_tmp;