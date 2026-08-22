# drop function get_trade_day;
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
    where num = (select num from stock_trade_day t1 where t1.trade_day = max_trade_day) + n;

    return t_n;
end $$
DELIMITER ;


# drop function get_ma5_add;
-- ma5上累加
DELIMITER $$
create function get_ma5_add(start_date_input date, stock_code_input varchar(50)) returns decimal(16, 3)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    declare query_date date;
    declare current_zd decimal(16, 3) default 0;
    declare current_close_price decimal(16, 3) default 0;
    declare current_ma5 decimal(16, 3) default 0;
    declare add_sum decimal(16, 3) default 0;

    set query_date = start_date_input;
    loop_a:
    loop
        select ifnull(b.zd, 0), ifnull(b.close_price, 0)
        into current_zd,current_close_price
        from stock_base_info a
                 left join stock_trade b on b.stock_code = stock_code_input and b.trade_date = query_date
        where a.stock_code = stock_code_input;

        select ifnull(b.ma5, 0)
        into current_ma5
        from stock_base_info a
                 left join stock_ma_dn b on b.stock_code = stock_code_input and b.trade_date = query_date
        where a.stock_code = stock_code_input;

        if (current_close_price < current_ma5) then leave loop_a; end if;

        set add_sum = add_sum + current_zd;
        set query_date = get_trade_day(query_date, 1);

        if (query_date > current_date) then leave loop_a; end if;
    end loop;
    return add_sum;
end $$
DELIMITER ;
