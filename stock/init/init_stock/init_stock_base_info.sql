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