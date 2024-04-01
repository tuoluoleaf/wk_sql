-- MA_30
select smaCurrent.stock_code,
       smaCurrent.stock_name,
       smaCurrent.trade_date,
       sbi.industry_name,
       tradeCurrent.close_price,
       (select tmp.ma5 from stock_ma_dn tmp where tmp.stock_code = tradeCurrent.stock_code and tmp.trade_date = get_trade_day(tradeCurrent.trade_date, 1)) as next_1_ma5,
       tradeCurrent.zd,
       (select tmp.zd from stock_trade_dn tmp where tmp.stock_code = tradeCurrent.stock_code and tmp.trade_date = get_trade_day(tradeCurrent.trade_date, 1)) as next_1_zd,
       (select tmp.zd from stock_trade_dn tmp where tmp.stock_code = tradeCurrent.stock_code and tmp.trade_date = get_trade_day(tradeCurrent.trade_date, 2)) as next_2_zd,
       (select tmp.zd from stock_trade_dn tmp where tmp.stock_code = tradeCurrent.stock_code and tmp.trade_date = get_trade_day(tradeCurrent.trade_date, 3)) as next_3_zd,
       (select tmp.zd from stock_trade_dn tmp where tmp.stock_code = tradeCurrent.stock_code and tmp.trade_date = get_trade_day(tradeCurrent.trade_date, 4)) as next_4_zd,
       (select tmp.zd from stock_trade_dn tmp where tmp.stock_code = tradeCurrent.stock_code and tmp.trade_date = get_trade_day(tradeCurrent.trade_date, 5)) as next_5_zd,
       (select tmp.zd from stock_trade_dn tmp where tmp.stock_code = tradeCurrent.stock_code and tmp.trade_date = get_trade_day(tradeCurrent.trade_date, 6)) as next_6_zd,
       (select tmp.zd from stock_trade_dn tmp where tmp.stock_code = tradeCurrent.stock_code and tmp.trade_date = get_trade_day(tradeCurrent.trade_date, 7)) as next_7_zd,
       smaCurrent.ma5,
       smaCurrent.ma200
from stock_ma_dn smaCurrent,
     stock_trade_dn tradeCurrent
         left join stock_base_info sbi on sbi.stock_code = tradeCurrent.stock_code
where 1 = 1
  -- 排除：创业板、科创板
  and (smaCurrent.stock_code not like '30%' and smaCurrent.stock_code not like '688%')
#   and smaCurrent.trade_date = get_trade_day(current_date, -0)
  and smaCurrent.trade_date >= date'2024-03-01'
  and smaCurrent.trade_date < date'2025-01-01'
  and tradeCurrent.stock_code = smaCurrent.stock_code
  and tradeCurrent.trade_date = smaCurrent.trade_date

  -- ma200附近35点
  and tradeCurrent.close_price > smaCurrent.ma200
  and tradeCurrent.close_price <= smaCurrent.ma200 * 1.35

  -- 成交量3W以上
  and tradeCurrent.trade_num >= 3 * 10000
  -- 股价10以上
  and tradeCurrent.close_price >= 10
  -- 市值[80亿, 1000亿)
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 100000000 * 80
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) < 100000000 * 1000

order by smaCurrent.trade_date desc, sbi.industry_name
;



