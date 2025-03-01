-- MA_5&20_下穿上
create table stock_ma_5_up_20
(
    id                 bigint primary key auto_increment comment '主键id',
    stock_code         varchar(10) comment '股票代码',
    stock_name         varchar(20) comment '股票名称',
    industry_name      varchar(20) comment '行业名称',
    trade_date         date comment '交易日期',
    sum_max_zd         decimal(16, 3) comment 'sum_max_zd',
    highest_price_date date comment 'highest_price_date',
    sum_min_zd         decimal(16, 3) comment 'ma5',
    lowest_price_date  date comment 'lowest_price_date',
    zd                 decimal(16, 3) comment 'zd',
    ma5                decimal(16, 3) comment 'ma5',
    ma20               decimal(16, 3) comment 'ma20',
    ma200              decimal(16, 3) comment 'ma200',

    create_by          varchar(64) default 'sys' null comment '创建者',
    create_time        datetime    default current_timestamp null comment '创建时间',
    update_by          varchar(64) default 'sys' null comment '更新者',
    update_time        datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark             varchar(500) null comment '备注'
) comment 'MA_5&20_下穿上';


-- MA_10&20_下穿上
create table stock_ma_10_up_20
(
    id                 bigint primary key auto_increment comment '主键id',
    stock_code         varchar(10) comment '股票代码',
    stock_name         varchar(20) comment '股票名称',
    industry_name      varchar(20) comment '行业名称',
    trade_date         date comment '交易日期',
    sum_max_zd         decimal(16, 3) comment 'sum_max_zd',
    highest_price_date date comment 'highest_price_date',
    sum_min_zd         decimal(16, 3) comment 'ma5',
    lowest_price_date  date comment 'lowest_price_date',
    zd                 decimal(16, 3) comment 'zd',
    ma10               decimal(16, 3) comment 'ma10',
    ma20               decimal(16, 3) comment 'ma20',

    create_by          varchar(64) default 'sys' null comment '创建者',
    create_time        datetime    default current_timestamp null comment '创建时间',
    update_by          varchar(64) default 'sys' null comment '更新者',
    update_time        datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark             varchar(500) null comment '备注'
) comment 'MA_10&20_下穿上';
