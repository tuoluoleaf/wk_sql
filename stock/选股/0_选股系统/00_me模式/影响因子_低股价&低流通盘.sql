select *
from (select trade.trade_date,
             trade.stock_code,
             trade.stock_name,
             round(trade.trade_money / 100000000, 2)                                                                                             as trade_money,
             trade.zd,
             (select t1.zd from stock_trade t1 where t1.stock_code = trade.stock_code and t1.trade_date = get_trade_day(trade.trade_date, 1)) as next_zd,
             row_number() over (partition by trade_date order by trade_money desc)                                                                  rn
      from stock_trade trade
      where 1 = 1
        and (trade.stock_code not like '30%' and trade.stock_code not like '688%')
        and trade.trade_date = date'2024-10-24'
#         and trade.trade_date >= date'2023-01-01'
#         and trade.trade_date < date'2024-01-01'

        -- 10亿量
        and trade.trade_money >= 10 * 100000000
        -- 市值[50亿, 1000亿)
        and (trade.trade_money / trade.hs * 100) >= 100000000 * 50
        and (trade.trade_money / trade.hs * 100) < 100000000 * 1000) tmp
where tmp.rn <= 20
order by trade_date desc, trade_money desc
;



