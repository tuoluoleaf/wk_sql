-- 股票TRADE_DN
create table stock_trade
(
    id            bigint primary key auto_increment comment '主键id',
    stock_code    varchar(10) comment '股票代码',
    stock_name    varchar(20) comment '股票名称',
    trade_date    date comment '交易日期',
    open_price    decimal(16, 2) comment '开盘价[元]',
    close_price   decimal(16, 2) comment '收盘价[元]',
    highest_price decimal(16, 2) comment '最高价[元]',
    lowest_price  decimal(16, 2) comment '最低价[元]',
    trade_num     decimal(16, 2) comment '成交量[手]',
    trade_money   decimal(16, 2) comment '成交额[元]',
    zf            decimal(16, 2) comment '振幅[%]',
    hs            decimal(16, 2) comment '换手率[%]',
    zd            decimal(16, 2) comment '涨跌幅[%]',
    zde           decimal(16, 2) comment '涨跌额[元]',
    remark        varchar(500)                                                      null comment '备注',
    zd_remark     varchar(50)                                                       null comment '涨跌标识',
    level_num     int                                                               null comment '涨跌级别',

    create_by     varchar(64) default 'sys'                                         null comment '创建者',
    create_time   datetime    default current_timestamp                             null comment '创建时间',
    update_by     varchar(64) default 'sys'                                         null comment '更新者',
    update_time   datetime    default current_timestamp on update current_timestamp null comment '更新时间'
) comment '股票交易_日线';
create unique index idx_stock_trade on stock_trade (stock_code, trade_date);
create index idx_stock_trade_date on stock_trade (trade_date);
create index idx_stock_trade_stock_name on stock_trade (stock_name);
create index idx_stock_trade_1 on stock_trade (stock_code, zd_remark, level_num);
