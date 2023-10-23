-- 55日突破
select tradeCurrent.stock_code,
       tradeCurrent.stock_name,
       sbi.industry_name,
       tradeCurrent.trade_date,
       (select round((max(t2.highest_price) - t1.open_price) / t1.open_price * 100, 2)
        from stock_trade_dn t1,
             stock_trade_dn t2
        where t1.stock_code = tradeCurrent.stock_code
          and t1.trade_date = get_trade_day(tradeCurrent.trade_date, 1)
          and t2.stock_code = tradeCurrent.stock_code
          and t2.trade_date >= get_trade_day(tradeCurrent.trade_date, 1)
          and t2.trade_date <= get_trade_day(tradeCurrent.trade_date, 20))                            as sumMaxZd,

       (select min(t1.trade_date)
        from stock_trade_dn t1
        where t1.stock_code = tradeCurrent.stock_code
          and t1.trade_date >= get_trade_day(tradeCurrent.trade_date, 1)
          and t1.trade_date <= get_trade_day(tradeCurrent.trade_date, 20)
          and t1.highest_price = (select max(t2.highest_price)
                                  from stock_trade_dn t2
                                  where t2.stock_code = tradeCurrent.stock_code
                                    and t2.trade_date >= get_trade_day(tradeCurrent.trade_date, 1)
                                    and t2.trade_date <= get_trade_day(tradeCurrent.trade_date, 20))) as highestPriceDate,

       (select round((min(t2.lowest_price) - t1.open_price) / t1.open_price * 100, 2)
        from stock_trade_dn t1,
             stock_trade_dn t2
        where t1.stock_code = tradeCurrent.stock_code
          and t1.trade_date = get_trade_day(tradeCurrent.trade_date, 1)
          and t2.stock_code = tradeCurrent.stock_code
          and t2.trade_date >= get_trade_day(tradeCurrent.trade_date, 2)
          and t2.trade_date <= get_trade_day(tradeCurrent.trade_date, 20))                            as sumMinZd,

       (select min(t1.trade_date)
        from stock_trade_dn t1
        where t1.stock_code = tradeCurrent.stock_code
          and t1.trade_date >= get_trade_day(tradeCurrent.trade_date, 2)
          and t1.trade_date <= get_trade_day(tradeCurrent.trade_date, 20)
          and t1.lowest_price = (select min(t2.lowest_price)
                                 from stock_trade_dn t2
                                 where t2.stock_code = tradeCurrent.stock_code
                                   and t2.trade_date >= get_trade_day(tradeCurrent.trade_date, 2)
                                   and t2.trade_date <= get_trade_day(tradeCurrent.trade_date, 20)))  as lowestPriceDate,
       tradeCurrent.zd
from stock_trade_dn tradeCurrent,
     stock_trade_dn tradeBefore,
     stock_base_info sbi,
     stock_tmp tmp
where 1 = 1
  and sbi.stock_code = tradeCurrent.stock_code
  and tradeCurrent.trade_date = get_trade_day(current_date, -30)
#   and tradeCurrent.stock_code = '688318'
#   and tradeCurrent.trade_date >= date'2023-09-01'
#   and tradeCurrent.trade_date < date'2023-11-01'
  and tradeBefore.stock_code = tradeCurrent.stock_code
  and tradeBefore.trade_date = get_trade_day(tradeCurrent.trade_date, -1)


  -- 55日突破
#    and tradeBefore.close_price < (select max(t1.close_price)
#                                  from stock_trade_dn t1
#                                  where t1.stock_code = tradeCurrent.stock_code
#                                    and t1.trade_date >= get_trade_day(tradeCurrent.trade_date, -55)
#                                    and t1.trade_date < tradeCurrent.trade_date)
#   and tradeCurrent.close_price >= (select max(t1.close_price)
#                                    from stock_trade_dn t1
#                                    where t1.stock_code = tradeCurrent.stock_code
#                                      and t1.trade_date >= get_trade_day(tradeCurrent.trade_date, -55)
#                                      and t1.trade_date < tradeCurrent.trade_date)
 and tmp.stock_code = tradeCurrent.stock_code
 and tmp.trade_date = tradeCurrent.trade_date
 and tradeCurrent.close_price >= tmp.max_price
 and tradeBefore.close_price < tmp.max_price

  -- 今天交易
  and tradeCurrent.zd > -1
  and tradeCurrent.zd < 11
  and tradeCurrent.close_price >= tradeCurrent.open_price
  and tradeCurrent.close_price >= 10
  and tradeCurrent.trade_num >= 30000
  -- 市值 [50亿，300亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 50
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 100000000 * 300

-- 行业
#   and sbi.stock_code = tradeCurrent.stock_code
order by tradeCurrent.trade_date desc, sbi.industry_name desc
;


select trade1.stock_code,
       trade1.trade_date,
       (select max(t1.close_price)
        from stock_trade_dn t1
        where t1.stock_code = trade1.stock_code
          and t1.trade_date >= get_trade_day(trade1.trade_date, -55)
          and t1.trade_date < trade1.trade_date)
from stock_trade_dn trade1
where  trade1.trade_date = get_trade_day(current_date, -30);

-- 股票分时交易:dn(日线未复权)
create table stock_tmp
(
    id            bigint primary key auto_increment comment '主键id',
    stock_code    varchar(10) comment '股票代码',
    trade_date    date comment '交易日期',
    max_price    decimal(16, 2) comment 'max[元]'

) comment 'tmp';
