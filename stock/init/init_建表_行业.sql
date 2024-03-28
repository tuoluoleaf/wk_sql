
-- 行业分类；stock_industry_category
create table stock_industry_category
(
    id            int primary key auto_increment comment '主键id',
    industry_code varchar(10) comment '行业代码',
    industry_name varchar(20) comment '行业名称',

    create_time   timestamp default current_timestamp comment '创建时间',
    create_user   varchar(20) comment '创建人',
    update_time   timestamp comment '更新时间',
    update_user   varchar(20) comment '更新人'
) comment '行业分类';


-- 股票行业交易_日线未复权
create table stock_industry_trade_dn
(
    id            bigint primary key auto_increment comment '主键id',
    industry_code varchar(10) comment '行业代码',
    industry_name varchar(20) comment '行业名称',
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
) comment '股票行业交易_日线未复权';
create unique index idx_stock_industry_trade_dn on stock_industry_trade_dn (industry_code, trade_date);
create index idx_stock_industry_trade_dn_date on stock_industry_trade_dn (trade_date);


