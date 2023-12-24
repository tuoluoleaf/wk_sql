-- MA_5&30_下穿上
create table fund_ma_5_up_30
(
    id                 bigint auto_increment comment '主键id'
        primary key,
    fund_code          varchar(10)                           null comment '基金代码',
    fund_name          varchar(20)                           null comment '基金名称',
    trade_date         date                                  null comment '交易日期',
    zd                 decimal(16, 3)                        null comment 'zd',
    close_price        decimal(16, 3)                        null comment '收盘价',
    sum_max_zd         decimal(16, 3)                        null comment 'sum_max_zd',
    highest_price_date date                                  null comment 'highest_price_date',
    sum_min_zd         decimal(16, 3)                        null comment 'sum_min_zd',
    lowest_price_date  date                                  null comment 'lowest_price_date',
    ma5                decimal(16, 3)                        null comment 'ma5',
    ma30               decimal(16, 3)                        null comment 'ma30',

    create_by          varchar(64) default 'sys'             null comment '创建者',
    create_time        datetime    default CURRENT_TIMESTAMP null comment '创建时间',
    update_by          varchar(64) default 'sys'             null comment '更新者',
    update_time        datetime    default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    remark             varchar(500)                          null comment '备注'
)
    comment 'MA_5&30_下穿上';

drop table fund_ma_5_up_30;
