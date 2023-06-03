# drop table if exists stock_base_info ;
drop table if exists industry_category;
drop table if exists main_force_secret;
drop table if exists magical_nine_turn;

-- 股票基本信息：stock_base_info
create table stock_base_info
(
    id            int primary key auto_increment comment '主键id',
    stock_code    varchar(10) comment '股票代码',
    stock_name    varchar(20) comment '股票名称',
    market        varchar(10) comment '市场',
    industry_name varchar(20) comment '行业名称',
    turnover_gt_8w varchar(4) comment '成交量大于8W',

    create_time   timestamp default current_timestamp comment '创建时间',
    create_user   varchar(20) comment '创建人',
    update_time   timestamp comment '更新时间',
    update_user   varchar(20) comment '更新人'
) comment '股票基本信息';

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
    turnover        numeric(64) comment '成交量',
    business_date date comment '业务日期'
) comment '股票每日成交量';

-- stock_trade_day：交易日
create table stock_trade_day
(
    id            int primary key auto_increment comment '主键id',
    trade_day     date comment '交易日期'
);

-- 工作日函数
DELIMITER $$
create function get_trade_day(base_date date, n int) returns date
    READS SQL DATA
    DETERMINISTIC
BEGIN

    declare max_trade_day date default base_date;
    declare t_n date default base_date;

    select max(trade_day) into max_trade_day from stock_trade_day where trade_day <= base_date;
    select trade_day into t_n from stock_trade_day where id = (select id from stock_trade_day t1 where t1.trade_day = max_trade_day) + n;

    return t_n;
end $$
DELIMITER ;
