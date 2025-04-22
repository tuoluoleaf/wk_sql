-- 涨停股票
create table stock_zt
(
    id                 bigint primary key auto_increment comment '主键id',
    stock_code         varchar(10) comment '股票代码',
    stock_name         varchar(20) comment '股票名称',
    trade_date         date comment '交易日期',
    price              decimal(16, 2) comment '价[元]',
    zd                 decimal(16, 2) comment '涨跌幅[%]',
    trade_money        decimal(16, 2) comment '成交额[亿元]',
    lt_market_value    decimal(16, 2) comment '流通市值 (亿元)',
    total_market_value decimal(16, 2) comment '总市值 (亿元)',
    hs                 decimal(16, 2) comment '换手率[%]',
    zt_continue_num    int null comment '连板数',

    first_zt_time      varchar(10) comment '首次封板时间（HH:mm:ss）',
    last_zt_time       varchar(10) comment '最后封板时间（HH:mm:ss）',
    fb_money           decimal(16, 2) comment '封板资金 (亿元)',
    zb_count           int null comment '炸板数',
    x_day_y            varchar(20) comment '涨停统计（x天/y板）',

    zt_time_level      int null comment '涨停时间分类',

    create_by          varchar(64) default 'sys' null comment '创建者',
    create_time        datetime    default current_timestamp null comment '创建时间',
    update_by          varchar(64) default 'sys' null comment '更新者',
    update_time        datetime    default current_timestamp on update current_timestamp null comment '更新时间'
) comment '涨停股票';
create unique index idx_stock_zt on stock_zt (stock_code, trade_date);

