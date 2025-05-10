-- 股票逐笔交易
create table stock_trade_detail
(
    id              bigint primary key auto_increment comment '主键id',
    stock_code      varchar(10) comment '股票代码',
    stock_name      varchar(20) comment '股票名称',
    trade_date      date comment '交易日期',
    trade_time      varchar(10) comment '交易时间',
    trade_num       decimal(16, 2) comment '成交量[股]',
    trade_price     decimal(16, 2) comment '成交价[元]',
    trade_money     decimal(16, 2) comment '成交额[万元]',
    trade_direction int(2) comment '交易方向 0中性盘,1买入,2卖出',

    create_by       varchar(64) default 'sys'                                         null comment '创建者',
    create_time     datetime    default current_timestamp                             null comment '创建时间',
    update_by       varchar(64) default 'sys'                                         null comment '更新者',
    update_time     datetime    default current_timestamp on update current_timestamp null comment '更新时间'
) comment '股票逐笔交易';
create index idx_stock_trade_detail on stock_trade_detail (stock_code, trade_date);
create index idx_stock_trade_detail_date on stock_trade_detail (trade_date);

