select *
from (select detail.stock_code,
             detail.stock_name,
             count(0) as count
      from stock_trade_detail detail,
           stock_base_info stock
      where 1 = 1
#         and (stock.stock_code not like '30%' and stock.stock_code not like '688%')
        and stock.stock_code = detail.stock_code
        and stock.lt_market_value <= 800

        -- 排除集合竞价
        and trade_time >= '09:30:00'
        and trade_time < '15:00:00'

      group by detail.stock_code, detail.stock_name
      having count > 20) a
order by count desc
;

select detail.*
from stock_trade_detail detail
where 1 = 1
  and detail.stock_name = '四川金顶'
#   and detail.trade_direction in (1, 2)
-- 排除集合竞价
  and trade_time >= '09:30:00'
  and trade_time < '15:00:00'
;

