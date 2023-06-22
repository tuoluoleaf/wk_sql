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
