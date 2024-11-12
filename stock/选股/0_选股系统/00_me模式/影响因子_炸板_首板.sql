select trade.trade_date,
       trade.stock_code,
       trade.stock_name,
       trade.zd,
       trade.close_price                                                                                                                   as price,
       stock.lt_market_value,
       round(trade.trade_money / 100000000, 2)                                                                                             as trade_money,
       stock.industry_name,
       (select t1.zd from stock_trade_dn t1 where t1.stock_code = trade.stock_code and t1.trade_date = get_trade_day(trade.trade_date, 1)) as next_zd
from stock_base_info stock,
     stock_trade_dn trade,
     stock_trade_dn tradeB1,
     stock_ma_dn ma
where 1 = 1
  and (stock.stock_code not like '30%' and stock.stock_code not like '688%')
  and trade.stock_code = stock.stock_code
  and tradeB1.stock_code = trade.stock_code
  and tradeB1.trade_date = get_trade_day(trade.trade_date, -1)
  and ma.stock_code = trade.stock_code
  and ma.trade_date = trade.trade_date

  -- 日期
#   and trade.trade_date = date'2024-11-08'
  and trade.trade_date >= date'2024-01-01'
  and trade.trade_date < date'2025-01-01'


  -- 炸板
  and trade.close_price < trade.highest_price
  and (trade.highest_price - tradeB1.close_price) / tradeB1.close_price > 0.097

  -- 首板
  and tradeB1.zd < 9.7

  -- 不破MA10、MA5
  and trade.close_price >= ma.ma5
  and trade.close_price >= ma.ma10
  -- 不跳空
  and trade.open_price <= ma.ma5 * 1.01

  -- 市值[50亿, 5000亿)
  and (trade.trade_money / trade.hs * 100) >= 100000000 * 50
  and (trade.trade_money / trade.hs * 100) < 100000000 * 5000
order by trade_date desc, zd desc
;



