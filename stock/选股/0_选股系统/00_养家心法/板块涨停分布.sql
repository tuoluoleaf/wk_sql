-- 历史涨停板
select stock.stock_code,
       stock.stock_name,
       count(0)                                                                                   as count_s,
       (select t1.notion_name from stock_base_info t1 where t1.stock_code = stock.stock_code)     as notion_name,
       (select t1.industry_name from stock_base_info t1 where t1.stock_code = stock.stock_code)   as industry_name,
       (select t1.lt_market_value from stock_base_info t1 where t1.stock_code = stock.stock_code) as lt_market_value
from stock_base_info stock,
     stock_trade_dn trade
where 1 = 1
  and (stock.stock_code not like '30%' and stock.stock_code not like '688%')
  and stock.stock_code = trade.stock_code
#   and trade.trade_date >= date'2024-01-01'
  and trade.trade_date < date'2024-01-01'
  and trade.zd > 9.7

  -- 板块
#   and stock.notion_name like '%华为概念%'
#   and stock.industry_name like '%电力%'

  -- 个股
#   and stock.stock_name like '%吉电%'
group by stock.stock_code, stock.stock_name
order by count_s desc
