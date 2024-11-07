select *
from (select trade.trade_date,
             trade.stock_code,
             trade.stock_name,
             round(trade.trade_money / 100000000, 2)                                                                                             as trade_money,
             trade.zd,
             (select t1.zd from stock_trade_dn t1 where t1.stock_code = trade.stock_code and t1.trade_date = get_trade_day(trade.trade_date, 1)) as next_zd,
             row_number() over (partition by trade_date order by trade_money desc)                                                                  rn
      from stock_trade_dn trade
      where 1 = 1
        and (trade.stock_code not like '30%' and trade.stock_code not like '688%')
        and trade.trade_date = date'2024-10-24'
#         and trade.trade_date >= date'2023-01-01'
#         and trade.trade_date < date'2024-01-01'

        -- 10亿量
        and trade.trade_money >= 10 * 100000000
        -- 市值[0亿, 1000亿)
        and (trade.trade_money / trade.hs * 100) >= 100000000 * 50
        and (trade.trade_money / trade.hs * 100) < 100000000 * 1000) tmp
where tmp.rn <= 20
order by trade_date desc, trade_money desc
;


select base.stock_code,
       base.stock_name,
       base.industry_name,
       base.lt_market_value,
       (select count(0) from stock_trade_dn t1 where t1.stock_code = base.stock_code and t1.trade_date >= date'2024-01-01' and t1.trade_date <= date'2024-12-01' and t1.trade_money >= 10 * 100000000)                                as count_sum,
       (select round((max(highest_price) - min(lowest_price)) / min(lowest_price) * 100, 2) from stock_trade_dn t1 where t1.stock_code = base.stock_code and t1.trade_date >= date'2024-01-01' and t1.trade_date <= date'2024-12-01') as max_zd
from stock_base_info base
where (base.stock_code not like '30%' and base.stock_code not like '688%')
  and base.lt_market_value >= 50
  and base.lt_market_value < 700
;
