-- 同花顺：股票基本信息清洗
update stock_base_info
set market = 'SZ'
where stock_code like '%SZ';
update stock_base_info
set market = 'SH'
where stock_code like '%SH';
update stock_base_info
set market = 'BJ'
where stock_code like '%BJ';
update stock_base_info
set stock_code = replace(stock_code, '.SZ', '')
where stock_code like '%SZ';
update stock_base_info
set stock_code = replace(stock_code, '.SH', '')
where stock_code like '%SH';
update stock_base_info
set stock_code = replace(stock_code, '.BJ', '')
where stock_code like '%BJ';
update stock_base_info
set lt_market_value = round(lt_market_value / 100000000, 2);


-- 更新最新流动市值
update stock_base_info base
set base.lt_market_value =
            (select round(trade.trade_money / trade.hs * 100 / 100000000, 2) from stock_trade_dn trade where trade.stock_code = base.stock_code and trade.trade_date = get_trade_day(current_date, 0))
;

-- 今日max_zd
