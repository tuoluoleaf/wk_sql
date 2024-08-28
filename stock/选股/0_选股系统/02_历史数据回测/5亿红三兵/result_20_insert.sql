-- 清空
truncate table stock_result_20;

-- 初始化数据
insert into stock_result_20 (stock_code, stock_name, industry_name, trade_date, close_price, zd, zd_next1, ma5)
    (select ma.stock_code,
            ma.stock_name,
            sbi.industry_name,
            ma.trade_date,
            trade.close_price,
            trade.zd,
            (select sum(t1.zd)
             from stock_trade_dn t1
             where t1.stock_code = trade.stock_code
               and t1.trade_date >= get_trade_day(ma.trade_date, 1)
               and t1.trade_date <= get_trade_day(ma.trade_date, 5)) as zd_next1,
            ma.ma5
     from stock_ma_dn ma,
          stock_trade_dn trade,
          stock_ma_dn maB1,
          stock_ma_dn maB2,
          stock_trade_dn tradeB1,
          stock_trade_dn tradeB2,
          stock_trade_dn tradeB3,
          stock_base_info sbi
     where 1 = 1
       -- 排除：创业板、科创板
       and (ma.stock_code not like '30%' and ma.stock_code not like '688%')
       and sbi.stock_code = trade.stock_code
       -- current
       and ma.trade_date >= date'2024-06-01'
       and ma.trade_date < date'2025-07-01'
       and trade.stock_code = ma.stock_code
       and trade.trade_date = ma.trade_date
       -- before
       and maB1.stock_code = ma.stock_code
       and maB1.trade_date = get_trade_day(ma.trade_date, -1)
       and maB2.stock_code = ma.stock_code
       and maB2.trade_date = get_trade_day(ma.trade_date, -2)
       and tradeB1.stock_code = ma.stock_code
       and tradeB1.trade_date = get_trade_day(ma.trade_date, -1)
       and tradeB2.stock_code = ma.stock_code
       and tradeB2.trade_date = get_trade_day(ma.trade_date, -2)
       and tradeB3.stock_code = ma.stock_code
       and tradeB3.trade_date = get_trade_day(ma.trade_date, -3)

       -- 绿 -> 红 -> 红 -> 红
       and tradeB3.close_price < tradeB3.open_price
       and tradeB2.close_price > tradeB2.open_price
       and tradeB1.close_price > tradeB1.open_price
       and trade.close_price > trade.open_price
       and tradeB3.zd < 0
       and tradeB2.zd > 0
       and tradeB1.zd > 0
       and trade.zd > 0

       -- 5亿量
       and tradeB1.trade_money >= 5 * 100000000
       and trade.trade_money >= 5 * 100000000

       -- ma5
       and (tradeB1.open_price <= maB1.ma5 or trade.open_price <= ma.ma5)

       -- 市值[300亿, +)
       and (trade.trade_money / trade.hs * 100) >= 100000000 * 300
     order by ma.trade_date desc, sbi.industry_name)
;



select * from stock_trade_dn where trade_date = date'2024-08-27'