

-- 选股池
select *
from stock_choice
where trade_date = get_trade_day(current_date, 0)
order by industry_name, stock_code
;








