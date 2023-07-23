

-- 股票交易
select slu.stock_code,
       slu.stock_name,
       slu.industry_name,
       slu.nums,
       slu.pj,
       slu.order_num,
       std.trade_date,
       std.zd,
       std.close_price,
       std.trade_num,
       (select count(0)
        from stock_trade_dn std2
        where std2.stock_code = slu.stock_code
          and std2.trade_date = get_trade_day(current_date, 0)
          and std2.close_price >= 9
          and std2.trade_num >= 50000) as xuanzhe
from stock_trade_dn std,
     stock_lead_up slu
where slu.stock_code = std.stock_code
  and std.trade_date <= get_trade_day(current_date, 0)
  and std.trade_date >= get_trade_day(current_date, -365)
order by slu.industry_name, slu.order_num, trade_date desc
