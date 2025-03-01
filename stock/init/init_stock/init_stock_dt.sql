-- 跌停股票
create table stock_dt
(
    id                 bigint primary key auto_increment comment '主键id',
    stock_code         varchar(10) comment '股票代码',
    stock_name         varchar(20) comment '股票名称',
    trade_date         date comment '交易日期',
    price              decimal(16, 2) comment '价[元]',
    zd                 decimal(16, 2) comment '涨跌幅[%]',
    trade_money        decimal(16, 2) comment '成交额[元]',
    lt_market_value    decimal(16, 2) comment '流通市值 (亿元)',
    total_market_value decimal(16, 2) comment '总市值 (亿元)',
    pe                 decimal(16, 2) comment '动态市盈率',
    hs                 decimal(16, 2) comment '换手率[%]',
    dt_continue_num    int                                                               null comment '连板数',

    last_dt_time       varchar(10) comment '最后封板时间（HH:mm:ss）',
    dt_fb_money        decimal(16, 2) comment '跌停封板资金 (亿元)',
    dt_trans_money     decimal(16, 2) comment '跌停成交资金 (亿元)',
    kb_count           int                                                               null comment '开板次数',

    create_by          varchar(64) default 'sys'                                         null comment '创建者',
    create_time        datetime    default current_timestamp                             null comment '创建时间',
    update_by          varchar(64) default 'sys'                                         null comment '更新者',
    update_time        datetime    default current_timestamp on update current_timestamp null comment '更新时间'
) comment '跌停股票';
create unique index idx_stock_dt on stock_dt (stock_code, trade_date);

