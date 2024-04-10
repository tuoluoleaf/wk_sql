
-- 清空
truncate table stock_result_1;

-- 初始化数据
insert into stock_result_1 (stock_code, stock_name, trade_date, industry_name, close_price, zd, ma5)
    (select smaBefore.stock_code,
            smaBefore.stock_name,
            smaBefore.trade_date,
            sbi.industry_name,
            tradeBefore.close_price,
            tradeBefore.zd,
            smaBefore.ma5
     from stock_ma_dn smaCurrent,
          stock_trade_dn tradeCurrent,
          stock_ma_dn smaBefore,
          stock_trade_dn tradeBefore,
          stock_base_info sbi
     where 1 = 1
       -- 排除：创业板、科创板
       and (smaCurrent.stock_code not like '30%' and smaCurrent.stock_code not like '688%')
       and sbi.stock_code = tradeCurrent.stock_code
#        and smaCurrent.trade_date = get_trade_day(current_date, -2)
       and smaCurrent.trade_date >= date'2024-03-01'
       and smaCurrent.trade_date < date'2025-01-01'
       and tradeCurrent.stock_code = smaCurrent.stock_code
       and tradeCurrent.trade_date = smaCurrent.trade_date
       and smaBefore.stock_code = smaCurrent.stock_code
       and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)
       and tradeBefore.stock_code = smaCurrent.stock_code
       and tradeBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)

       -- MA5跳动
       and tradeBefore.close_price < smaBefore.ma5
       and tradeBefore.open_price < smaBefore.ma5
       and tradeCurrent.close_price > smaCurrent.ma5
       and tradeCurrent.open_price > smaCurrent.ma5

       -- MA200附近 [-0.25, +0.35]
       and tradeBefore.close_price >= smaBefore.ma200 * 0.75
       and tradeBefore.close_price <= smaBefore.ma200 * 1.35

       -- 成交量3W以上
       and tradeBefore.trade_num >= 3 * 10000
       -- 股价10以上
       and tradeBefore.close_price >= 10
       -- 市值[50亿, 1000亿)
       and (tradeBefore.trade_money / tradeBefore.hs * 100) >= 100000000 * 50
       and (tradeBefore.trade_money / tradeBefore.hs * 100) < 100000000 * 1000

     order by tradeBefore.trade_date desc, sbi.industry_name)
;



