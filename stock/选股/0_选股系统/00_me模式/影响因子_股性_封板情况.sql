-- 涨停数、炸板数、跌停数
select stock.stock_code,
       stock.stock_name,
       (select count(0) from stock_trade_dn trade where stock.stock_code = trade.stock_code and trade.trade_date < date'2025-01-01' and trade.trade_date >= date'2021-01-01' and trade.zd_remark = '涨停') as count_zt,
       (select count(0) from stock_trade_dn trade where stock.stock_code = trade.stock_code and trade.trade_date < date'2025-01-01' and trade.trade_date >= date'2021-01-01' and trade.zd_remark = '跌停') as count_dt,
       (select count(0) from stock_trade_dn trade where stock.stock_code = trade.stock_code and trade.trade_date < date'2025-01-01' and trade.trade_date >= date'2021-01-01' and trade.zd_remark = '炸板') as count_zb,
       stock.industry_name,
       stock.notion_name
from stock_base_info stock
where (stock.stock_code not like '30%' and stock.stock_code not like '688%')

  -- 板块
  and stock.notion_name like '%低空%'
#   and stock.industry_name like '%电力%'
-- 个股
#   and stock.stock_name like '%吉电%'

