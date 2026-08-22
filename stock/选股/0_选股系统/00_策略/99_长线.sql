--
--
--


select base.stock_code,
       base.stock_name,
       tmp.num,
       base.lt_market_value
from (select trade.stock_code,
             count(0) as num
      from stock_trade trade,
             stock_base_info base1
      where (trade.stock_code not like '30%' and trade.stock_code not like '688%')
        and base1.stock_code = trade.stock_code
        and base1.lt_market_value > 10
        and base1.lt_market_value < 500
        and trade.trade_date >= date'2022-01-01'
        and trade.trade_date < date'2023-01-01'

        -- 10亿量
        and trade.trade_money >= 10 * 100000000
      group by trade.stock_code) tmp,
    stock_base_info base
where base.stock_code = tmp.stock_code
and tmp.num >= 50
order by tmp.num desc
;

