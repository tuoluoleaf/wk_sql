create table stock_ma
(
    id         int auto_increment
        primary key,
    dm         varchar(10)    not null comment '股票代码',
    trade_date date           not null comment '交易日期',
    ma3        decimal(10, 2) null comment 'MA3',
    ma5        decimal(10, 2) null comment 'MA5',
    ma10       decimal(10, 2) null comment 'MA10',
    ma20       decimal(10, 2) null comment 'MA20',
    ma30       decimal(10, 2) null comment 'MA30',
    ma60       decimal(10, 2) null comment 'MA60',
    ma120      decimal(10, 2) null comment 'MA120',
    ma200      decimal(10, 2) null comment 'MA200',
    ma250      decimal(10, 2) null comment 'MA250',
    created_at datetime       null comment '创建时间',
    constraint uix_ma_dm_trade_date
        unique (dm, trade_date)
)
    comment '股票MA技术指标';
