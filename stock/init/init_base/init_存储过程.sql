

# drop PROCEDURE get_ma5_add_procedure;
-- ma5上累加
DELIMITER $$
create PROCEDURE get_ma5_add_procedure(start_date_input date, stock_code_input varchar(50), out end_date date, out add_sum decimal(16, 3))
    READS SQL DATA
    DETERMINISTIC
BEGIN
    declare query_date date;
    declare current_zd decimal(16, 3) default 0;
    declare current_close_price decimal(16, 3) default 0;
    declare current_ma5 decimal(16, 3) default 0;

    set add_sum = 0;
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

    set end_date = query_date;
end $$
DELIMITER ;
