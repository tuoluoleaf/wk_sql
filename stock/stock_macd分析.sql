
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
  and trade.trade_date = get_trade_day(current_date, -1)
  and trade.close_price >= 10

  and macd1.trade_date = get_trade_day(current_date, -1)
  and macd2.trade_date = get_trade_day(current_date, 0)
  and macd1.macd < -0.1
  and macd2.macd >= -0.1
order by stock.industry_name
;


select smd.id,
       smd.stock_code,
       smd.stock_name,
       smd.trade_date,
       smd.diff,
       smd.dea,
       smd.macd,
       std.zd
from stock_macd_dn smd
         left join stock_trade_dn std on smd.stock_code = std.stock_code and smd.trade_date = std.trade_date
where 1=1
and smd.stock_code = '001324'
order by smd.stock_code, smd.trade_date
;