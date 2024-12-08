-- 涨停数_QB、炸板数_QB、跌停数
select stock.stock_code,
       stock.stock_name,
       (select count(0) from stock_trade_dn trade where stock.stock_code = trade.stock_code and trade.trade_date < date'2025-01-01' and trade.trade_date >= date'2021-01-01' and trade.zd_remark = '涨停')        as count_zt,
       (select count(0) from stock_trade_dn trade where stock.stock_code = trade.stock_code and trade.trade_date < date'2025-01-01' and trade.trade_date >= date'2021-01-01' and trade.zd_remark = '跌停')        as count_dt,
       (select count(0) from stock_trade_dn trade where stock.stock_code = trade.stock_code and trade.trade_date < date'2025-01-01' and trade.trade_date >= date'2021-01-01' and trade.zd_remark = '炸板')        as count_zb,
       (select avg(open_price) from stock_trade_dn trade where stock.stock_code = trade.stock_code and trade.trade_date < date'2025-01-01' and trade.trade_date >= date'2021-01-01' and trade.zd_remark = '涨停') as count_zt_next_open_avg,
       stock.industry_name,
       stock.notion_name
from stock_base_info stock
where (stock.stock_code not like '30%' and stock.stock_code not like '688%')

  -- 板块
  and stock.notion_name like '%低空%'
#   and stock.industry_name like '%电力%'
-- 个股
#   and stock.stock_name like '%吉电%'
;

with table_tmp_trade as (select tmp.stock_code,
                                tmp.zd_remark,
                                count(0)                       as count_sum,
                                round(avg(next_zd), 2)         as avg_next_zd,
                                round(avg(next_open_zd), 2)    as avg_next_open_zd,
                                round(avg(next_highest_zd), 2) as avg_next_highest_zd
                         from (select trade.stock_code,
                                      trade.stock_name,
                                      trade.zd_remark,
                                      trade.level_num,
                                      trade.trade_date,
                                      trade.zd,
                                      tradeA1.zd                                                                      as next_zd,
                                      round((tradeA1.open_price - trade.close_price) / trade.close_price * 100, 2)    as next_open_zd,
                                      round((tradeA1.highest_price - trade.close_price) / trade.close_price * 100, 2) as next_highest_zd
                               from stock_base_info stock,
                                    stock_trade_dn trade,
                                    stock_trade_dn tradeA1
                               where (stock.stock_code not like '30%' and stock.stock_code not like '688%')
                                 and trade.stock_code = stock.stock_code
                                 and tradeA1.stock_code = trade.stock_code
                                 and tradeA1.trade_date = get_trade_day(trade.trade_date, 1)
                                 and trade.trade_date >= date '2021-01-01'
                                 and trade.zd_remark in ('涨停', '跌停', '炸板')) tmp
                         group by tmp.stock_code, tmp.zd_remark)


select stock.stock_code,
       stock.stock_name,
       trade1.count_sum           as count_zt,
       trade1.avg_next_zd         as avg_next_zt_zd,
       trade1.avg_next_open_zd    as avg_next_zt_open_zd,
       trade1.avg_next_highest_zd as avg_next_zt_highest_zd,
       trade2.count_sum           as count_dt,
       trade2.avg_next_zd         as avg_next_dt_zd,
       trade2.avg_next_open_zd    as avg_next_dt_open_zd,
       trade2.avg_next_highest_zd as avg_next_dt_highest_zd,
       trade3.count_sum           as count_zb,
       trade3.avg_next_zd         as avg_next_zb_zd,
       trade3.avg_next_open_zd    as avg_next_zb_open_zd,
       trade3.avg_next_highest_zd as avg_next_zb_highest_zd,
       stock.industry_name,
       stock.notion_name
from stock_base_info stock,
     table_tmp_trade trade1,
     table_tmp_trade trade2,
     table_tmp_trade trade3
where (stock.stock_code not like '30%' and stock.stock_code not like '688%')
  and trade1.stock_code = stock.stock_code
  and trade1.zd_remark = '涨停'
  and trade2.stock_code = stock.stock_code
  and trade2.zd_remark = '跌停'
  and trade3.stock_code = stock.stock_code
  and trade3.zd_remark = '炸板'

-- 板块
#   and stock.notion_name like '%低空%'
#   and stock.industry_name like '%电力%'
-- 个股
#   and stock.stock_name like '%吉电%'
;

-- 涨停数_1B、炸板数_1B、跌停数
select stock.stock_code,
       stock.stock_name,
       (select count(0) from stock_trade_dn trade where stock.stock_code = trade.stock_code and trade.trade_date < date'2025-01-01' and trade.trade_date >= date'2021-01-01' and trade.zd_remark = '涨停' and trade.level_num = 1) as count_zt,
       (select count(0) from stock_trade_dn trade where stock.stock_code = trade.stock_code and trade.trade_date < date'2025-01-01' and trade.trade_date >= date'2021-01-01' and trade.zd_remark = '跌停')                         as count_dt,
       (select count(0) from stock_trade_dn trade where stock.stock_code = trade.stock_code and trade.trade_date < date'2025-01-01' and trade.trade_date >= date'2021-01-01' and trade.zd_remark = '炸板' and trade.level_num = 1) as count_zb,
       stock.industry_name,
       stock.notion_name
from stock_base_info stock
where (stock.stock_code not like '30%' and stock.stock_code not like '688%')

  -- 板块
  and stock.notion_name like '%低空%'
#   and stock.industry_name like '%电力%'
-- 个股
#   and stock.stock_name like '%吉电%'
;



with table_tmp_trade as (select tmp.stock_code,
                                tmp.zd_remark,
                                count(0)                       as count_sum,
                                round(avg(next_zd), 2)         as avg_next_zd,
                                round(avg(next_open_zd), 2)    as avg_next_open_zd,
                                round(avg(next_highest_zd), 2) as avg_next_highest_zd
                         from (select trade.stock_code,
                                      trade.stock_name,
                                      trade.zd_remark,
                                      trade.level_num,
                                      trade.trade_date,
                                      trade.zd,
                                      tradeA1.zd                                                                      as next_zd,
                                      round((tradeA1.open_price - trade.close_price) / trade.close_price * 100, 2)    as next_open_zd,
                                      round((tradeA1.highest_price - trade.close_price) / trade.close_price * 100, 2) as next_highest_zd
                               from stock_base_info stock,
                                    stock_trade_dn trade,
                                    stock_trade_dn tradeA1
                               where (stock.stock_code not like '30%' and stock.stock_code not like '688%')
                                 and trade.stock_code = stock.stock_code
                                 and tradeA1.stock_code = trade.stock_code
                                 and tradeA1.trade_date = get_trade_day(trade.trade_date, 1)
                                 and trade.trade_date >= date '2021-01-01'
                                 and ((trade.zd_remark in ('涨停', '炸板') and trade.level_num = 1) or trade.zd_remark = '跌停')) tmp
                         group by tmp.stock_code, tmp.zd_remark)


select stock.stock_code,
       stock.stock_name,
       trade1.count_sum           as count_zt,
       trade1.avg_next_zd         as avg_next_zt_zd,
       trade1.avg_next_open_zd    as avg_next_zt_open_zd,
       trade1.avg_next_highest_zd as avg_next_zt_highest_zd,
       trade2.count_sum           as count_dt,
       trade2.avg_next_zd         as avg_next_dt_zd,
       trade2.avg_next_open_zd    as avg_next_dt_open_zd,
       trade2.avg_next_highest_zd as avg_next_dt_highest_zd,
       trade3.count_sum           as count_zb,
       trade3.avg_next_zd         as avg_next_zb_zd,
       trade3.avg_next_open_zd    as avg_next_zb_open_zd,
       trade3.avg_next_highest_zd as avg_next_zb_highest_zd,
       stock.industry_name,
       stock.notion_name
from stock_base_info stock,
     table_tmp_trade trade1,
     table_tmp_trade trade2,
     table_tmp_trade trade3
where (stock.stock_code not like '30%' and stock.stock_code not like '688%')
  and trade1.stock_code = stock.stock_code
  and trade1.zd_remark = '涨停'
  and trade2.stock_code = stock.stock_code
  and trade2.zd_remark = '跌停'
  and trade3.stock_code = stock.stock_code
  and trade3.zd_remark = '炸板'

-- 板块
#   and stock.notion_name like '%低空%'
#   and stock.industry_name like '%电力%'
-- 个股
#   and stock.stock_name like '%吉电%'
;