-- 工作日函数
DELIMITER $$
create function get_trade_day(base_date date, n int) returns date
    READS SQL DATA
    DETERMINISTIC
BEGIN

    declare max_trade_day date default base_date;
    declare t_n date default base_date;

    select max(trade_day) into max_trade_day from stock_trade_day where trade_day <= base_date;
    select trade_day
    into t_n
    from stock_trade_day
    where id = (select id from stock_trade_day t1 where t1.trade_day = max_trade_day) + n;

    return t_n;
end $$
DELIMITER ;

drop function get_trade_60m;
-- 60m函数
DELIMITER $$
create function get_trade_60m(base_60m timestamp, n int) returns timestamp
    READS SQL DATA
    DETERMINISTIC
BEGIN
    declare t_n datetime default base_60m;

    select trade_60m
    into t_n
    from stock_trade_60m
    where id =
          (select id
           from stock_trade_60m t1
           where t1.trade_60m = (select max(trade_60m) from stock_trade_60m where trade_60m <= base_60m))
              + n;
    return t_n;
end $$
DELIMITER ;
