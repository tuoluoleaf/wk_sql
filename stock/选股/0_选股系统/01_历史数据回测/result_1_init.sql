-- 日线_MA5上35点附近
create table stock_result_1
(
    id            bigint primary key auto_increment comment '主键id',
    stock_code    varchar(10) comment '股票代码',
    stock_name    varchar(20) comment '股票名称',
    industry_name varchar(20) comment '行业名称',
    trade_date    date comment '交易日期',
    close_price   decimal(16, 3) comment 'close_price',
    next_1_ma5    decimal(16, 3) comment 'next_1_ma5',
    zd            decimal(16, 3) comment 'zd',
    next_1_zd            decimal(16, 3) comment 'next_1_zd',
    next_2_zd            decimal(16, 3) comment 'next_2_zd',
    next_3_zd            decimal(16, 3) comment 'next_3_zd',
    next_4_zd            decimal(16, 3) comment 'next_4_zd',
    next_5_zd            decimal(16, 3) comment 'next_5_zd',
    next_6_zd            decimal(16, 3) comment 'next_6_zd',
    next_7_zd            decimal(16, 3) comment 'next_7_zd',

    ma5           decimal(16, 3) comment 'ma5',
    ma200         decimal(16, 3) comment 'ma200'

) comment '日线_MA5上35点附近';








