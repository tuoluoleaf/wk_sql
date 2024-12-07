select trade_date,
       stock_code,
       stock_name,
       jr_zd,
       mr_zd,
       price,
       lt_market_value,
       industry_name,
       count_sum,
       count_buy,
       count_sell,
       count_buy / count_sum  as buy_rate,
       count_sell / count_sum as sell_rate,
       zr_zd
from (select tmp.trade_date,
             tmp.stock_code,
             tmp.stock_name,
             tmp.industry_name,
             tmp.count_sum,
             (select count(0) from stock_trade_detail t where t.stock_code = tmp.stock_code and t.trade_date = tmp.trade_date and t.trade_direction = 1 and t.trade_money >= 800) as count_buy,
             (select count(0) from stock_trade_detail t where t.stock_code = tmp.stock_code and t.trade_date = tmp.trade_date and t.trade_direction = 2 and t.trade_money >= 800) as count_sell,
             (select t1.zd from stock_trade_dn t1 where t1.stock_code = tmp.stock_code and t1.trade_date = get_trade_day(tmp.trade_date, -1))                                     as zr_zd,
             zd                                                                                                                                                                   as jr_zd,
             (select t1.zd from stock_trade_dn t1 where t1.stock_code = tmp.stock_code and t1.trade_date = get_trade_day(tmp.trade_date, 1))                                      as mr_zd,
             price,
             lt_market_value
      from (select detail.stock_code,
                   detail.stock_name,
                   stock.industry_name,
                   count(0)          as count_sum,
                   detail.trade_date,
                   trade.zd,
                   trade.close_price as price,
                   stock.lt_market_value
            from stock_base_info stock,
                 stock_trade_detail detail,
                 stock_ma_dn ma,
                 stock_trade_dn trade
            where 1 = 1
              and (stock.stock_code not like '30%' and stock.stock_code not like '688%')
              and stock.stock_code = detail.stock_code
              and ma.stock_code = detail.stock_code
              and ma.trade_date = detail.trade_date
              and trade.stock_code = detail.stock_code
              and trade.trade_date = detail.trade_date
              -- 交易日期
#               and detail.trade_date >= get_trade_day(current_date, -10)
#               and detail.trade_date <= get_trade_day(current_date, 0)
              and detail.trade_date = date'2024-12-05'

              -- 5日线上趋势
              and trade.close_price >= ma.ma5
              and trade.close_price >= ma.ma10
              -- 不跳空
#               and trade.open_price <= ma.ma5 * 1.01

              -- 流通盘[25,5000]亿
              and stock.lt_market_value > 25
              and stock.lt_market_value < 5000
              -- 万手成交 or 500亿
              and (detail.trade_num >= 9900 * 10000 or detail.trade_money >= 500)

            group by detail.stock_code, detail.stock_name, detail.trade_date) tmp) tmp2
where 1 = 1
#   and count_sum > 40
  and tmp2.zr_zd < 9
  and tmp2.jr_zd > 9
order by trade_date desc, count_sum desc
;

select detail.trade_date,
       detail.stock_code,
       detail.stock_name,
       detail.trade_time,
       detail.trade_direction,
       detail.trade_money,
       detail.trade_price
from stock_trade_detail detail
where 1 = 1
#   and detail.stock_code = '002510'
  and detail.stock_name = '供销大集'
  and detail.trade_date = date'2024-12-05'
  and detail.trade_direction in (1, 2)
  and (detail.trade_num >= 9900 * 10000 or detail.trade_money >= 800)
order by detail.trade_time
;


-- 股票最新成交明细
select trade_date,
       count(0) as count_
from stock_trade_detail
group by trade_date
order by trade_date desc;

select *
from stock_trade_detail
where trade_date = date'2024-10-18'
;



select t.zd, t.*
from stock_trade_dn t
where stock_name = '中信证券'
  and (zd < -4 or zd > 4)
order by trade_date desc;
select t.zd, t.*
from stock_trade_dn t
where stock_name = '中信证券'
  and zd > 4
order by trade_date desc;