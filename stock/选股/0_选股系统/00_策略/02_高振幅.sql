select trade.stock_code,
       trade.stock_name,
       round((max(trade.highest_price) - min(trade.lowest_price)) / min(trade.lowest_price) * 100, 2) as max_zd

from stock_trade trade
where 1 = 1
  -- 排除：创业板、科创板
  and (trade.stock_code not like '30%' and trade.stock_code not like '688%')
  and trade.trade_date >= date'2024-08-01'
  and trade.trade_date < date'2024-09-01'
group by trade.stock_code,trade.stock_name
;




