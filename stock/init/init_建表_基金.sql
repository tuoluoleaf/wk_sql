-- 基金基本信息：fund_base_info
create table fund_base_info
(
    id          int primary key auto_increment comment '主键id',
    fund_code   varchar(10) comment '基金代码',
    fund_name   varchar(20) comment '基金名称',
    fund_type   varchar(20) comment '基金类型',

    create_by   varchar(64) default 'sys'                                         null comment '创建者',
    create_time datetime    default current_timestamp                             null comment '创建时间',
    update_by   varchar(64) default 'sys'                                         null comment '更新者',
    update_time datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark      varchar(500)                                                      null comment '备注'
) comment '基金基本信息';
create unique index idx_fund_base_info on fund_base_info (fund_code);


-- 基金分时交易:dn(日线未复权)
create table fund_trade_dn
(
    id            bigint primary key auto_increment comment '主键id',
    fund_code    varchar(10) comment '基金代码',
    fund_name    varchar(20) comment '基金名称',
    trade_date    date comment '交易日期',
    open_price    decimal(16, 2) comment '开盘价[元]',
    close_price   decimal(16, 2) comment '收盘价[元]',
    highest_price decimal(16, 2) comment '最高价[元]',
    lowest_price  decimal(16, 2) comment '最低价[元]',
    trade_num     decimal(16, 2) comment '成交量[股]',
    trade_money   decimal(16, 2) comment '成交额[元]',
    zf            decimal(16, 2) comment '振幅[%]',
    zd            decimal(16, 2) comment '涨跌幅[%]',
    zde           decimal(16, 2) comment '涨跌额[元]',

    create_by     varchar(64) default 'sys'                                         null comment '创建者',
    create_time   datetime    default current_timestamp                             null comment '创建时间',
    update_by     varchar(64) default 'sys'                                         null comment '更新者',
    update_time   datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark        varchar(500)                                                      null comment '备注'
) comment '基金交易_日线';
create unique index idx_fund_trade_dn on fund_trade_dn (fund_code, trade_date);
create index idx_fund_trade_dn_date on fund_trade_dn (trade_date);


-- 基金MA_dn
create table fund_ma_dn
(
    id          bigint primary key auto_increment comment '主键id',
    fund_code  varchar(10) comment '基金代码',
    fund_name  varchar(20) comment '基金名称',
    trade_date  date comment '交易日期',
    ma3         decimal(16, 3) comment 'ma3',
    ma5         decimal(16, 3) comment 'ma5',
    ma10        decimal(16, 3) comment 'maa10',
    ma15        decimal(16, 3) comment 'ma15',
    ma20        decimal(16, 3) comment 'ma20',
    ma30        decimal(16, 3) comment 'ma30',
    ma60        decimal(16, 3) comment 'ma60',
    ma120       decimal(16, 3) comment 'ma120',
    ma200       decimal(16, 3) comment 'ma200',
    ma250       decimal(16, 3) comment 'ma250',

    create_by   varchar(64) default 'sys'                                         null comment '创建者',
    create_time datetime    default current_timestamp                             null comment '创建时间',
    update_by   varchar(64) default 'sys'                                         null comment '更新者',
    update_time datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark      varchar(500)                                                      null comment '备注'
) comment '基金MA_dn';
create unique index idx_fund_ma_dn on fund_ma_dn (fund_code, trade_date);
create index idx_fund_ma_dn_date on fund_ma_dn (trade_date);