
-- macd < -0.1  、 macd >= -0.1
select stock.stock_code,
       stock.stock_name,
       macd1.trade_date as 1Date,
       macd1.macd         as 1Macd,
       macd2.macd         as 2Macd,
       macd2.trade_date as 2Date,
       stock.industry_name
from stock_macd_dn macd1,
     stock_macd_dn macd2,
     stock_base_info stock,
     stock_trade_dn trade
where macd1.stock_code = macd2.stock_code
  and macd1.stock_code = stock.stock_code
  and stock.turnover_gt_8w = '是'

  and macd1.stock_code = trade.stock_code
  and trade.trade_date = '2023-06-14'
  and trade.close_price >= 10

  and macd1.trade_date = date'2023-06-13'
  and macd2.trade_date = date'2023-06-14'
  and macd1.macd < -0.1
  and macd2.macd >= -0.1
order by stock.industry_name
;

--

select count(1) from stock_macd_dn;
select count(1) from stock_base_info where turnover_gt_8w = '是';

select count(1)
from stock_base_info
where stock_code not in (select stock_code from stock_macd_dn)
and turnover_gt_8w = '是';