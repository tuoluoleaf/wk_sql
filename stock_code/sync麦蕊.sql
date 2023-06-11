-- 同步历史交易数据：未复权
select *
from stock_base_info
where stock_code not in (select stock_code from stock_trade_dn)
;

select count(0) from stock_trade_dn where trade_date >= date'2015-01-01';
select count(0) from stock_trade_dn_2015;

-- 2015之前数据：分表
insert into stock_trade_dn_2015
(stock_code, stock_name, trade_date, open_price, close_price, highest_price, lowest_price, trade_num, trade_money, zf, hs, zd, zde)
select stock_code,
       stock_name,
       trade_date,
       open_price,
       close_price,
       highest_price,
       lowest_price,
       trade_num,
       trade_money,
       zf,
       hs,
       zd,
       zde
from stock_trade_dn
where trade_date < date'2015-01-01';

delete from stock_trade_dn where trade_date < date'2015-01-01';