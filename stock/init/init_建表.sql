# drop table if exists stock_base_info ;
drop table if exists industry_category;
drop table if exists main_force_secret;
drop table if exists magical_nine_turn;

-- 股票基本信息：stock_base_info
create table stock_base_info
(
    id             int primary key auto_increment comment '主键id',
    stock_code     varchar(10) comment '股票代码',
    stock_name     varchar(20) comment '股票名称',
    market         varchar(10) comment '市场',
    industry_name  varchar(20) comment '行业名称',
    turnover_gt_8w varchar(4) comment '成交量大于8W',

    create_by      varchar(64) default '' null comment '创建者',
    create_time    datetime               null comment '创建时间',
    update_by      varchar(64) default '' null comment '更新者',
    update_time    datetime               null comment '更新时间',
    remark         varchar(500)           null comment '备注'
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


-- 主力密码：main_force_secret
create table main_force_secret
(
    id                 int primary key auto_increment comment '主键id',
    stock_code         varchar(10) comment '股票代码',
    stock_name         varchar(20) comment '股票名称',
    monitor_date       date comment '监控日期',
    will               varchar(10) comment '主力意向',
    float_profit_ratio numeric(16, 4) comment '主力浮盈率',
    entrance_energy    numeric(16, 4) comment '主力入场动能（万）',
    control_degree     numeric(16, 4) comment '主力控盘度',

    create_time        timestamp default current_timestamp comment '创建时间',
    create_user        varchar(20) comment '创建人',
    update_time        timestamp comment '更新时间',
    update_user        varchar(20) comment '更新人'
) comment '主力密码';


-- 神奇九转：magical_nine_turn
create table magical_nine_turn
(
    id                   int primary key auto_increment comment '主键id',
    stock_code           varchar(10) comment '股票代码',
    stock_name           varchar(20) comment '股票名称',
    signal_date          date comment '信号日期',
    pre_nine_sum_change  numeric(16, 4) comment '前9日累计涨跌',
    post_four_sum_change numeric(16, 4) comment '后4日区间盈亏',
    hit_rate             numeric(16, 4) comment '后4日区间盈亏',
    turn_type            varchar(10) comment '九转类型：红九转、绿九转',

    create_time          timestamp default current_timestamp comment '创建时间',
    create_user          varchar(20) comment '创建人',
    update_time          timestamp comment '更新时间',
    update_user          varchar(20) comment '更新人'
) comment '神奇九转';


-- stock_industry_tmp：股票行业中间表
create table stock_industry_tmp
(
    id            int primary key auto_increment comment '主键id',
    stock_code    varchar(10) comment '股票代码',
    stock_name    varchar(20) comment '股票名称',
    industry_name varchar(20) comment '行业名称'
);

-- 股票每日成交量
create table stock_daily_turnover
(
    id            int primary key auto_increment comment '主键id',
    stock_code    varchar(10) comment '股票代码',
    stock_name    varchar(20) comment '股票名称',
    turnover      numeric(64) comment '成交量',
    business_date date comment '业务日期'
) comment '股票每日成交量';

-- 交易日
create table stock_trade_day
(
    id        int primary key auto_increment comment '主键id',
    trade_day date comment '交易日期'
);
create unique index idx_stock_trade_day on stock_trade_day (trade_day);


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


-- 股票分时交易:dn(日线未复权):2015之前分表
create table stock_trade_dn_2015
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
) comment '股票交易_日线未复权_2015之前';
create unique index idx_stock_trade_dn_2015 on stock_trade_dn_2015 (stock_code, trade_date);
create index idx_stock_trade_dn_2015_date on stock_trade_dn_2015 (trade_date);


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


-- 股票MACD分析
# drop table  if exists stock_macd_analyze;
create table stock_macd_analyze
(
    id               bigint primary key auto_increment comment '主键id',
    stock_code       varchar(10) comment '股票代码',
    stock_name       varchar(20) comment '股票名称',
    trade_date       date comment '交易日期',
    macd             decimal(16, 3) comment 'MACD值',
    zd               decimal(16, 2) comment '涨跌幅[%]',
    sum_zd           decimal(16, 2)                                                    null comment '波段总涨跌幅[%]',
    peek_sum_zd      decimal(16, 2)                                                    null comment '波段peek涨跌幅[%]',
    peek_sum_zd_seg  int                                                               null comment '波段peek涨跌幅值分段',


    range_order      int comment '波段号',
    find_point_date  date comment '发现点日期',
    start_point_date date comment '起点日期',
    end_point_date   date comment '止点日期',
    will             varchar(10) comment '趋势意向：上涨、下跌',

    create_by        varchar(64) default 'sys'                                         null comment '创建者',
    create_time      datetime    default current_timestamp                             null comment '创建时间',
    update_by        varchar(64) default 'sys'                                         null comment '更新者',
    update_time      datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark           varchar(500)                                                      null comment '备注'
) comment '股票MACD分析';
create unique index idx_stock_macd_analyze on stock_macd_analyze (stock_code, trade_date);
create index idx_stock_macd_analyze_date on stock_macd_analyze (trade_date);


-- 股票转红分析
# drop table  if exists stock_trans_red_analyze;
create table stock_trans_red_analyze
(
    id               bigint primary key auto_increment comment '主键id',
    stock_code       varchar(10) comment '股票代码',
    stock_name       varchar(20) comment '股票名称',
    trade_date       date comment '交易日期',
    macd             decimal(16, 3) comment 'MACD值',
    zd               decimal(16, 2) comment '涨跌幅[%]',
    sum_zd           decimal(16, 2)                                                    null comment '波段总涨跌幅[%]',
    peek_sum_zd      decimal(16, 2)                                                    null comment '波段peek涨跌幅[%]',
    start_point_date date comment '起点日期',
    end_point_date   date comment '止点日期',
    will             varchar(10) comment '趋势意向：上涨、下跌',

    create_by        varchar(64) default 'sys'                                         null comment '创建者',
    create_time      datetime    default current_timestamp                             null comment '创建时间',
    update_by        varchar(64) default 'sys'                                         null comment '更新者',
    update_time      datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark           varchar(500)                                                      null comment '备注'
) comment '股票转红分析';
create unique index idx_stock_trans_red_analyze on stock_trans_red_analyze (stock_code, trade_date);
create index idx_stock_trans_red_analyze_date on stock_trans_red_analyze (trade_date);


-- 选股数据
-- drop table if exists stock_choice;
create table stock_choice
(
    id                    bigint primary key auto_increment comment '主键id',
    stock_code            varchar(10) comment '股票代码',
    stock_name            varchar(20) comment '股票名称',
    trade_date            date comment '交易日期',
    analyze_source        varchar(10) comment '分析来源',
    macd                  decimal(16, 3) comment 'MACD值',
    zd                    decimal(16, 2) comment '涨跌幅[%]',
    find_point_date       date comment '发现点日期',
    start_point_date      date comment '起点日期',
    will                  varchar(10) comment '趋势意向：上涨、下跌',
    industry_name         varchar(10) comment '行业分类',
    trade_num             decimal(16, 2) null comment '成交量[手]',
    close_price           decimal(16, 2) null comment '收盘价[元]',
    gt_three_percent_rate decimal(16, 4) null comment '大于[3%]收益的占比',
    analyze_total_num     int null comment '当前股票分析区段数量',
    tags                  varchar(200) null comment '标签',
    level                 varchar(10) null comment '等级:可选、已买',

    create_by             varchar(64) default 'sys' null comment '创建者',
    create_time           datetime    default current_timestamp null comment '创建时间',
    update_by             varchar(64) default 'sys' null comment '更新者',
    update_time           datetime    default current_timestamp on update current_timestamp null comment '更新时间',
    remark                varchar(500) null comment '备注'
) comment '选股数据';
create index idx_stock_choice on stock_choice (stock_code, trade_date);
create index idx_stock_choice_date on stock_choice (trade_date);


create table stock_choice_filter
(
    id         bigint primary key auto_increment comment '主键id',
    stock_code varchar(10) comment '股票代码',
    stock_name varchar(20) comment '股票名称',
    trade_date date comment '交易日期'
) comment '选股池筛选';
create index idx_stock_choice_filter on stock_choice_filter (stock_code, trade_date);
create index idx_stock_choice_filter_date on stock_choice_filter (trade_date);
