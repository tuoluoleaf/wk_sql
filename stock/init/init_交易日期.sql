-- 交易日
create table stock_trade_day
(
    id        int primary key auto_increment comment '主键id',
    num       int comment '排序',
    trade_day date comment '交易日期'
);
create unique index idx_stock_trade_day on stock_trade_day (trade_day);

update stock_trade_day t
set num = (select RN
           from (select row_number() over (order by trade_day ) as RN,
                        trade_day
                 from stock_trade_day) tmp
           where tmp.trade_day = t.trade_day);


-- 交易60m
create table stock_trade_60m
(
    id        int primary key auto_increment comment '主键id',
    trade_60m datetime comment '交易小时'
);
