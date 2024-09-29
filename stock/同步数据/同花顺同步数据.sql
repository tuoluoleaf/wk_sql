

-- 股票基本信息清洗
update stock_base_info set market = 'SZ' where stock_code like '%SZ';
update stock_base_info set market = 'SH' where stock_code like '%SH';
update stock_base_info set market = 'BJ' where stock_code like '%BJ';
update stock_base_info set stock_code = replace(stock_code, '.SZ', '') where stock_code like '%SZ';
update stock_base_info set stock_code = replace(stock_code, '.SH', '') where stock_code like '%SH';
update stock_base_info set stock_code = replace(stock_code, '.BJ', '') where stock_code like '%BJ';
