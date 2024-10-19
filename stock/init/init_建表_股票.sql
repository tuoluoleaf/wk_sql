-- 股票基本信息
# drop table stock_base_info;
create table stock_base_info
(
    id              int primary key auto_increment comment '主键id',
    stock_code      varchar(10) comment '股票代码',
    stock_name      varchar(20) comment '股票名称',
    market          varchar(10) comment '市场',
    notion_name     varchar(2000) comment '所属概念',
    industry_name   varchar(500) comment '所属同花顺行业',
    lt_market_value decimal(16, 2) comment 'a股流通市值 (亿元)'
) comment '股票基本信息';
create unique index idx_stock_base_info on stock_base_info (stock_code);


-- 股票TRADE_DN
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


-- 股票MACD_DN
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


-- 股票MA_DN
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
) comment '股票MA_DN';
create unique index idx_stock_ma_dn on stock_ma_dn (stock_code, trade_date);
create index idx_stock_ma_dn_date on stock_ma_dn (trade_date);



-- ================================下面是额外非重要数据 ================================================================

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

-- 股票MA_WN
create table stock_ma_wn
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
) comment '股票MA_WN';
create unique index idx_stock_ma_wn on stock_ma_wn (stock_code, trade_date);
create index idx_stock_ma_wn_date on stock_ma_wn (trade_date);


-- 股票股东数据
create table stock_holder_data
(
    id            bigint primary key auto_increment comment '主键id',
    stock_code    varchar(10) comment '股票代码',
    stock_name    varchar(20) comment '股票名称',
    deadline_date date comment '截止日期',
    holder_num    int comment '股东数量',
    holder_change int comment '股东数量变化',

    create_by     varchar(64) default 'sys'                                         null comment '创建者',
    create_time   datetime    default current_timestamp                             null comment '创建时间',
    update_by     varchar(64) default 'sys'                                         null comment '更新者',
    update_time   datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark        varchar(500)                                                      null comment '备注'
) comment '股票股东数据' charset = utf8mb4;


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

