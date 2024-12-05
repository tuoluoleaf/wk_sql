select trade1.stock_code,
       trade1.stock_name,
       trade1.trade_date
from stock_trade_dn trade1,
     stock_trade_dn trade2,
     stock_trade_dn trade3,
     stock_trade_dn trade4
where 1 = 1
  and (trade1.stock_code not like '30%' and trade1.stock_code not like '688%')
  and trade2.stock_code = trade1.stock_code
  and trade3.stock_code = trade1.stock_code
  and trade4.stock_code = trade1.stock_code
  and trade2.trade_date = get_trade_day(trade1.trade_date, 1)
  and trade3.trade_date = get_trade_day(trade1.trade_date, 2)
  and trade4.trade_date = get_trade_day(trade1.trade_date, 3)

  and trade1.zd > 9.7
  and trade2.zd > 9.7
  and trade3.zd > 9.7
  and trade4.zd > 9.7
  and trade1.trade_date >= date'2020-01-01'
;

select trade1.stock_code,
       trade1.stock_name,
       trade1.trade_date
from stock_trade_dn trade1,
     stock_trade_dn trade2
where 1 = 1
  and trade1.stock_code like '30%'
  and trade2.stock_code = trade1.stock_code
  and trade2.trade_date = get_trade_day(trade1.trade_date, 1)

  and trade1.zd > 19.7
  and trade2.zd > 19.7
;