select trade_date,
       stock_code,
       stock_name,
       count_sum,
       count_buy,
       count_sell,
       count_buy / count_sum  as buy_rate,
       count_sell / count_sum as sell_rate,
       zr_zd,
       jr_zd
from (select tmp.trade_date,
             tmp.stock_code,
             tmp.stock_name,
             tmp.count_sum,
             (select count(0) from stock_trade_detail t where t.stock_code = tmp.stock_code and t.trade_date = tmp.trade_date and t.trade_direction = 1) as count_buy,
             (select count(0) from stock_trade_detail t where t.stock_code = tmp.stock_code and t.trade_date = tmp.trade_date and t.trade_direction = 2) as count_sell,
             (select t1.zd from stock_trade_dn t1 where t1.stock_code = tmp.stock_code and t1.trade_date = get_trade_day(tmp.trade_date, -1))            as zr_zd,
             (select t1.zd from stock_trade_dn t1 where t1.stock_code = tmp.stock_code and t1.trade_date = tmp.trade_date)                               as jr_zd
      from (select detail.stock_code,
                   detail.stock_name,
                   count(0) as count_sum,
                   detail.trade_date
            from stock_trade_detail detail,
                 stock_base_info stock
            where 1 = 1
              and (stock.stock_code not like '30%' and stock.stock_code not like '688%')
              and stock.stock_code = detail.stock_code
              and stock.lt_market_value <= 700
              and detail.trade_date >= get_trade_day(current_date, -10)
              and detail.trade_date <= get_trade_day(current_date, 0)
#               and trade_date = date'2024-10-30'

            group by detail.stock_code, detail.stock_name, detail.trade_date) tmp) tmp2
where (count_sum > 40)
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
#        concat(if(detail.trade_direction = 1, '买', '卖'), detail.trade_money, '亿元') as aa
from stock_trade_detail detail
where detail.stock_name = '永辉超市'
  and detail.trade_date = date'2024-10-30'
  and detail.trade_direction in (1, 2)
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