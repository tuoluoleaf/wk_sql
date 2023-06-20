
-- 上涨数据
select sma.stock_code,
       sma.stock_name,
       sma.trade_date,
       sma.macd,
       sma.zd,
       sma.range_order,
       sma.find_point_date,
       sma.start_point_date,
       sma.end_point_date,
       sma.will,
       sbi.industry_name
from stock_macd_analyze sma,
     stock_trade_dn std
    left join stock_base_info sbi on std.stock_code = sbi.stock_code
where 1 = 1
  and std.stock_code = sma.stock_code
  and std.trade_date = sma.trade_date
  and std.trade_num >= 80000
  and std.close_price >= 10

  and sma.will = '上涨'
#   and sma.start_point_date >= date'2023-06-09'
  and sma.find_point_date >= get_trade_day(current_date, -1)
  and sma.trade_date = get_trade_day(current_date, 0)
order by industry_name
;


-- 各个阶段总收益
select sma.stock_code,
       sma.stock_name,
       sma.trade_date,
       sma.macd,
       sma.zd,
       sma.range_order,
       sma.find_point_date,
       sma.start_point_date,
       sma.end_point_date,
       sma.will
from stock_macd_analyze sma
where 1=1
and end_point_date is not null
;

select sma.stock_code,
       sma.stock_name,
       sma.trade_date,
       sma.macd,
       sma.zd,
       sma.range_order,
       sma.find_point_date,
       sma.start_point_date,
       sma.end_point_date,
       sma.will,
       (trade2.close_price - trade1.close_price)/trade1.close_price as sumZd,
       sbi.industry_name
from stock_macd_analyze sma,
     stock_trade_dn trade1,
     stock_trade_dn trade2
left join stock_base_info sbi on trade2.stock_code = sbi.stock_code
where 1=1
and sma.end_point_date is not null

and trade1.stock_code = sma.stock_code
and trade1.trade_date = sma.start_point_date
and trade2.stock_code = sma.stock_code
and trade2.trade_date = sma.end_point_date
order by sumZd desc
;