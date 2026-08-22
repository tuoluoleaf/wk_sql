-- 清空
truncate table stock_result_1;

-- 初始化数据
insert into stock_result_1 (stock_code, stock_name, trade_date, industry_name, close_price, zd, ma5)
    (-- 查询
        select ma.stock_code,
               ma.stock_name,
               ma.trade_date,
               sbi.industry_name,
               trade.close_price,
               trade.zd,
               ma.ma5
        from stock_ma_dn ma,
             stock_trade trade
                 left join stock_base_info sbi on sbi.stock_code = trade.stock_code
        where 1 = 1
          -- 排除：创业板、科创板
          and (ma.stock_code not like '30%' and ma.stock_code not like '688%')
          and trade.trade_date >= date'2024-05-01'
          and trade.trade_date < date'2025-09-01'
          and trade.stock_code = ma.stock_code
          and trade.trade_date = ma.trade_date

          -- 涨幅[-0.5, 0]
          and trade.zd > -0.5
          and trade.zd < 0
          and trade.close_price >= trade.open_price

          -- ma
          and trade.close_price < ma.ma5

          -- 成交额1亿以上
          #   and trade.trade_money >= 1 * 100000000
          -- 股价8以上
          and trade.close_price >= 8
          -- 流通市值[50亿, 1000亿)
          and (trade.trade_money / trade.hs * 100) >= 100000000 * 50
        #   and (trade.trade_money / trade.hs * 100) < 100000000 * 1000
        order by ma.trade_date desc, sbi.industry_name)
;



