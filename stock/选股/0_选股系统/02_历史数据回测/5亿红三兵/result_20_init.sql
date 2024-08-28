-- 日线_MA5上35点附近
create table stock_result_20
(
    id            bigint primary key auto_increment comment '主键id',
    stock_code    varchar(10) comment '股票代码',
    stock_name    varchar(20) comment '股票名称',
    industry_name varchar(20) comment '行业名称',
    trade_date    date comment '交易日期',
    close_price   decimal(16, 3) comment 'close_price',
    zd            decimal(16, 3) comment 'zd',
    zd_next1      decimal(16, 3) comment 'zd_next1',
    ma5           decimal(16, 3) comment 'ma5'

) comment 'result1';








