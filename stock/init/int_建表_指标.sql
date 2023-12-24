-- 指标MA_DN
create table stock_index_ma
(
    id         bigint primary key auto_increment comment '主键id',
    index_code varchar(10) comment '指标代码',
    index_name varchar(20) comment '指标名称',
    trade_date date comment '交易日期',
    ma3        decimal(16, 3) comment 'ma3',
    ma5        decimal(16, 3) comment 'ma5',
    ma10       decimal(16, 3) comment 'maa10',
    ma15       decimal(16, 3) comment 'ma15',
    ma20       decimal(16, 3) comment 'ma20',
    ma30       decimal(16, 3) comment 'ma30',
    ma60       decimal(16, 3) comment 'ma60',
    ma120      decimal(16, 3) comment 'ma120',
    ma200      decimal(16, 3) comment 'ma200',
    ma250      decimal(16, 3) comment 'ma250'
) comment '指标MA_DN';


