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


