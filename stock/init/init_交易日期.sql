-- 交易日
create table stock_trade_day
(
    id        int primary key auto_increment comment '主键id',
    trade_day date comment '交易日期'
);
create unique index idx_stock_trade_day on stock_trade_day (trade_day);


-- 交易60m
create table stock_trade_60m
(
    id        int primary key auto_increment comment '主键id',
    trade_60m datetime comment '交易小时'
);
