-- MA_30 止损点2%
select *
from (select t1.*,
             (select round((max(a1.close_price) - t1.close_price) / t1.close_price * 100, 2)
              from stock_trade_dn a1
              where a1.stock_code = t1.stock_code
                and a1.trade_date = t1.stop_trade_date) as stop_zd
      from (select smaCurrent.stock_code,
                   smaCurrent.stock_name,
                   sbi.industry_name,
                   tradeCurrent.trade_date,
                   tradeCurrent.zd,
                   tradeCurrent.open_price,
                   tradeCurrent.close_price,
                   smaCurrent.ma30,
                   (select min(smaCurrent2.trade_date)
                    from stock_ma_dn smaCurrent2,
                         stock_trade_dn tradeCurrent2
                    where smaCurrent2.stock_code = smaCurrent.stock_code
                      and tradeCurrent2.stock_code = smaCurrent.stock_code
                      and smaCurrent2.trade_date >= smaCurrent.trade_date
                      and tradeCurrent2.trade_date = smaCurrent2.trade_date
                      and (tradeCurrent2.open_price + tradeCurrent2.close_price) / 2 < smaCurrent2.ma5) as stop_trade_date,
                   round((tradeCurrent.close_price - smaCurrent.ma30) / smaCurrent.ma30 * 100, 2)       as pl_ma30
            from stock_ma_dn smaCurrent,
                 stock_ma_dn smaBefore,
                 stock_trade_dn tradeCurrent,
                 stock_trade_dn tradeBefore,
                 stock_base_info sbi
            where 1 = 1
              -- 排除：创业板、科创板
              and (smaCurrent.stock_code not like '30%'
                and smaCurrent.stock_code not like '688%')
#         and smaCurrent.trade_date = get_trade_day(current_date, -2)
              and smaCurrent.trade_date >= date'2024-01-01'
              and smaCurrent.trade_date < date'2025-01-01'
              and smaBefore.stock_code = smaCurrent.stock_code
              and tradeCurrent.stock_code = smaCurrent.stock_code
              and tradeBefore.stock_code = tradeCurrent.stock_code
              and smaBefore.trade_date = get_trade_day(smaCurrent.trade_date, -1)
              and tradeCurrent.trade_date = smaCurrent.trade_date
              and tradeBefore.trade_date = smaBefore.trade_date

              -- ma && 价格
              and (tradeBefore.open_price + tradeBefore.close_price) / 2 < smaBefore.ma5
              and tradeBefore.open_price > smaBefore.ma30
              and tradeBefore.close_price > smaBefore.ma30
              and (tradeCurrent.open_price + (tradeCurrent.close_price - tradeCurrent.open_price) * 0.4) > smaCurrent.ma5
              and tradeCurrent.close_price > tradeCurrent.open_price
              and tradeCurrent.close_price > smaCurrent.ma5
              and tradeCurrent.close_price < smaCurrent.ma30 * 1.05
              and tradeCurrent.close_price > smaCurrent.ma30

              -- 今天交易
              and tradeCurrent.trade_num >= 3 * 10000
#               and tradeCurrent.zd >= 0.91
#               and tradeCurrent.zd < 1.1
              -- 市值 [50亿，300亿]
              and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 50
              and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 100000000 * 300

              -- 行业
              and sbi.stock_code = smaCurrent.stock_code) t1) t2
where t2.stop_zd < 30
order by trade_date desc, industry_name desc
;



