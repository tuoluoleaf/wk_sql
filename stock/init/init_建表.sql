-- 股票基本信息：stock_base_info
create table stock_base_info
(
    id            int primary key auto_increment comment '主键id',
    stock_code    varchar(10) comment '股票代码',
    stock_name    varchar(20) comment '股票名称',
    market        varchar(10) comment '市场',
    industry_name varchar(20) comment '行业名称',

    create_by     varchar(64) default 'sys'                                         null comment '创建者',
    create_time   datetime    default current_timestamp                             null comment '创建时间',
    update_by     varchar(64) default 'sys'                                         null comment '更新者',
    update_time   datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark        varchar(500)                                                      null comment '备注'
) comment '股票基本信息';
create unique index idx_stock_base_info on stock_base_info (stock_code);


-- 行业分类；industry_category
create table industry_category
(
    id            int primary key auto_increment comment '主键id',
    industry_code varchar(10) comment '行业代码',
    industry_name varchar(20) comment '行业名称',

    create_time   timestamp default current_timestamp comment '创建时间',
    create_user   varchar(20) comment '创建人',
    update_time   timestamp comment '更新时间',
    update_user   varchar(20) comment '更新人'
) comment '行业分类';


-- 股票分时交易:dn(日线未复权)
create table stock_trade_dn
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

    create_by     varchar(64) default 'sys'                                         null comment '创建者',
    create_time   datetime    default current_timestamp                             null comment '创建时间',
    update_by     varchar(64) default 'sys'                                         null comment '更新者',
    update_time   datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark        varchar(500)                                                      null comment '备注'
) comment '股票交易_日线未复权';
create unique index idx_stock_trade_dn on stock_trade_dn (stock_code, trade_date);
create index idx_stock_trade_dn_date on stock_trade_dn (trade_date);


-- 股票MACD:dn(日线未复权)
create table stock_macd_dn
(
    id          bigint primary key auto_increment comment '主键id',
    stock_code  varchar(10) comment '股票代码',
    stock_name  varchar(20) comment '股票名称',
    trade_date  date comment '交易日期',
    diff        decimal(16, 3) comment 'DIFF值',
    dea         decimal(16, 3) comment 'DEA值',
    macd        decimal(16, 3) comment 'MACD值',
    ema12       decimal(16, 4) comment 'EMA[12]值',
    ema26       decimal(16, 4) comment 'EMA[26]值',

    create_by   varchar(64) default 'sys'                                         null comment '创建者',
    create_time datetime    default current_timestamp                             null comment '创建时间',
    update_by   varchar(64) default 'sys'                                         null comment '更新者',
    update_time datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark      varchar(500)                                                      null comment '备注'
) comment '股票MACD_日线未复权';
create unique index idx_stock_macd_dn on stock_macd_dn (stock_code, trade_date);
create index idx_stock_macd_dn_date on stock_macd_dn (trade_date);


-- 股票MA_dn
create table stock_ma_dn
(
    id          bigint primary key auto_increment comment '主键id',
    stock_code  varchar(10) comment '股票代码',
    stock_name  varchar(20) comment '股票名称',
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
) comment '股票MA_dn';
create unique index idx_stock_ma_dn on stock_ma_dn (stock_code, trade_date);
create index idx_stock_ma_dn_date on stock_ma_dn (trade_date);

-- 股票MA_60m
create table stock_ma_60m
(
    id              bigint primary key auto_increment comment '主键id',
    stock_code      varchar(10) comment '股票代码',
    stock_name      varchar(20) comment '股票名称',
    trade_date_time datetime comment '交易日期',
    ma3             decimal(16, 3) comment 'ma3',
    ma5             decimal(16, 3) comment 'ma5',
    ma10            decimal(16, 3) comment 'maa10',
    ma15            decimal(16, 3) comment 'ma15',
    ma20            decimal(16, 3) comment 'ma20',
    ma30            decimal(16, 3) comment 'ma30',
    ma60            decimal(16, 3) comment 'ma60',
    ma120           decimal(16, 3) comment 'ma120',
    ma200           decimal(16, 3) comment 'ma200',
    ma250           decimal(16, 3) comment 'ma250',

    create_by       varchar(64) default 'sys'                                         null comment '创建者',
    create_time     datetime    default current_timestamp                             null comment '创建时间',
    update_by       varchar(64) default 'sys'                                         null comment '更新者',
    update_time     datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark          varchar(500)                                                      null comment '备注'
) comment '股票MA_60m';
create index idx_stock_ma_60 on stock_ma_60m (stock_code, trade_date_time);
create index idx_stock_ma_60_date on stock_ma_60m (trade_date_time);


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

    create_by          varchar(64) default 'sys'                                         null comment '创建者',
    create_time        datetime    default current_timestamp                             null comment '创建时间',
    update_by          varchar(64) default 'sys'                                         null comment '更新者',
    update_time        datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark             varchar(500)                                                      null comment '备注'
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

    create_by          varchar(64) default 'sys'                                         null comment '创建者',
    create_time        datetime    default current_timestamp                             null comment '创建时间',
    update_by          varchar(64) default 'sys'                                         null comment '更新者',
    update_time        datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark             varchar(500)                                                      null comment '备注'
) comment 'MA_10&20_下穿上';

-- 指标MA_DN
create table stock_ma_index
(
    id          bigint primary key auto_increment comment '主键id',
    index_code  varchar(10) comment '指标代码',
    index_name  varchar(20) comment '指标名称',
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
    ma250       decimal(16, 3) comment 'ma250'
) comment '指标MA_DN';