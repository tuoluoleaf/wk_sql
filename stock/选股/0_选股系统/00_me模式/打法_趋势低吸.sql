select *
from stock_trade_dn
where stock_code = '002456'
order by trade_date desc;

select *
from stock_ma_dn
where stock_code = '002456'
order by trade_date desc;


select trade.trade_date,
       trade.stock_code,
       trade.stock_name,
       trade.zd,
       ma.ma5,
       if(trade.close_price > trade.open_price, 1, 0)                                      as is_success,
       round((trade.close_price - trade.open_price) / trade.open_price * 100, 2)           as zd_me1,
       round((ifnull(tradeA1.open_price, 0) - trade.open_price) / trade.open_price * 100, 2)  as zd_me2,
       round((ifnull(tradeA1.close_price, 0) - trade.open_price) / trade.open_price * 100, 2) as zd_me3
from stock_trade_dn trade,
     stock_trade_dn tradeB1,
     stock_ma_dn ma,
     stock_ma_dn maB1
         left join stock_trade_dn tradeA1 on tradeA1.stock_code = maB1.stock_code and tradeA1.trade_date = get_trade_day(maB1.trade_date, 2)
where (trade.stock_code not like '30%' and trade.stock_code not like '688%')
  and ma.stock_code = trade.stock_code
  and ma.trade_date = trade.trade_date

  and tradeB1.stock_code = trade.stock_code
  and tradeB1.trade_date = get_trade_day(trade.trade_date, -1)
  and maB1.stock_code = ma.stock_code
  and maB1.trade_date = get_trade_day(ma.trade_date, -1)

#   and trade.trade_date = get_trade_day(current_date, -3)
  and trade.trade_date >= date'2024-05-01'
  and trade.trade_date < date'2024-06-01'


  and ma.ma5 > maB1.ma5
  and trade.open_price >= ma.ma5 * 0.99
  and trade.open_price <= ma.ma5 * 1.01

  -- 20亿量
  and tradeB1.trade_money >= 20 * 100000000
  -- 市值[100亿, 1000亿)
  and (tradeB1.trade_money / tradeB1.hs * 100) >= 100000000 * 100
  and (tradeB1.trade_money / tradeB1.hs * 100) < 100000000 * 1000
order by trade_date desc, zd desc
;