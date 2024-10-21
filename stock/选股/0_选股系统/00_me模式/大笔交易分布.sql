select trade_date,
       stock_code,
       stock_name,
       count_sum,
       count_buy,
       count_sell,
       count_buy / count_sum  as buy_rate,
       count_sell / count_sum as sell_rate
from (select tmp.trade_date,
             tmp.stock_code,
             tmp.stock_name,
             tmp.count_sum,
             (select count(0)
              from stock_trade_detail t
              where t.stock_code = tmp.stock_code
                and t.trade_date = tmp.trade_date
                and t.trade_direction = 1
                and trade_time >= '09:30:00'
                and trade_time < '15:00:00') as count_buy,
             (select count(0)
              from stock_trade_detail t
              where t.stock_code = tmp.stock_code
                and t.trade_date = tmp.trade_date
                and t.trade_direction = 2
                and trade_time >= '09:30:00'
                and trade_time < '15:00:00') as count_sell
      from (select detail.stock_code,
                   detail.stock_name,
                   count(0) as count_sum,
                   detail.trade_date
            from stock_trade_detail detail,
                 stock_base_info stock
            where 1 = 1
              and (stock.stock_code not like '30%' and stock.stock_code not like '688%')
              and stock.stock_code = detail.stock_code
              and stock.lt_market_value <= 800
              and detail.trade_date >= get_trade_day(current_date, -3)
              and detail.trade_date <= get_trade_day(current_date, 0)

              -- 排除集合竞价
              and trade_time >= '09:30:00'
              and trade_time < '15:00:00'

            group by detail.stock_code, detail.stock_name, detail.trade_date
            having count_sum > 50) tmp) tmp2
order by trade_date desc, count_sum desc
;

select detail.*
from stock_trade_detail detail
where 1 = 1
  and detail.stock_name = '东方财富'
#   and detail.trade_direction in (1, 2)
-- 排除集合竞价
  and trade_time >= '09:30:00'
  and trade_time < '15:00:00'
;

