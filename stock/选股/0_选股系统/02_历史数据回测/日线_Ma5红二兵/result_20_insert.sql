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
            trade1.zd as zd_next1,
            ma.ma5
     from stock_ma_dn ma,
          stock_trade trade
              left join stock_trade trade1 on trade1.stock_code = trade.stock_code and trade1.trade_date = get_trade_day(trade.trade_date, 1),
          stock_ma_dn maB1,
          stock_trade tradeB1,
          stock_ma_dn maB2,
          stock_trade tradeB2,
          stock_base_info sbi
     where 1 = 1
       -- 排除：创业板、科创板
       and (ma.stock_code not like '30%' and ma.stock_code not like '688%')
       and sbi.stock_code = trade.stock_code
#           and ma.trade_date = get_trade_day(current_date, -10)
       and ma.trade_date >= date'2024-04-01'
       and ma.trade_date < date'2025-01-01'
       and trade.stock_code = ma.stock_code
       and trade.trade_date = ma.trade_date
       -- before
       and maB1.stock_code = ma.stock_code
       and maB1.trade_date = get_trade_day(ma.trade_date, -1)
       and tradeB1.stock_code = ma.stock_code
       and tradeB1.trade_date = get_trade_day(ma.trade_date, -1)
       and maB2.stock_code = ma.stock_code
       and maB2.trade_date = get_trade_day(ma.trade_date, -2)
       and tradeB2.stock_code = ma.stock_code
       and tradeB2.trade_date = get_trade_day(ma.trade_date, -2)

       -- 红二兵
       and tradeB2.close_price <= maB2.ma5
       and tradeB1.close_price > maB1.ma5
       and trade.close_price > ma.ma5

       -- 红
       and trade.close_price >= trade.open_price
       and tradeB1.close_price >= tradeB1.open_price


       -- 成交量3W以上
       and trade.trade_num >= 3 * 10000
       -- 股价10以上
       and trade.close_price >= 10
       -- 市值[50亿, 1000亿)
       and (trade.trade_money / trade.hs * 100) >= 100000000 * 50
       and (trade.trade_money / trade.hs * 100) < 100000000 * 1000

     order by ma.trade_date desc, sbi.industry_name)
;



