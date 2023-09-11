-- MA 多头连续
select maCurrent.stock_code,
       maCurrent.stock_name,
       sbi.industry_name,
       maCurrent.trade_date,
       tradeCurrent.zd,
       tradeCurrent.hs,
       tradeAfter.zd,
       tradeAfter.hs,
       (select sum(t.zd)
        from stock_trade_dn t
        where maCurrent.stock_code = t.stock_code
          and t.trade_date >= get_trade_day(maCurrent.trade_date, 1)
          and t.trade_date <= get_trade_day(maCurrent.trade_date, 8)) as sumZd,
       tradeCurrent.close_price,
       tradeCurrent.trade_num / 10000                                 as trade_num,
       maCurrent.ma5,
       maCurrent.ma10,
       maCurrent.ma20
from stock_ma_dn maCurrent,
     stock_ma_dn maBefore,
     stock_base_info sbi,
     stock_trade_dn tradeBefore,
     stock_trade_dn tradeCurrent
         left join stock_ma_dn smaAfter on smaAfter.stock_code = tradeCurrent.stock_code and
                                           smaAfter.trade_date = get_trade_day(tradeCurrent.trade_date, 1)
         left join stock_trade_dn tradeAfter on tradeAfter.stock_code = tradeCurrent.stock_code and
                                                tradeAfter.trade_date = get_trade_day(tradeCurrent.trade_date, 1)
where 1 = 1
  and maCurrent.trade_date = get_trade_day(current_date, -1)
#   and maCurrent.trade_date >= date'2023-07-01'
#   and maCurrent.trade_date <= date'2023-09-01'
  and maBefore.stock_code = maCurrent.stock_code
  and maBefore.trade_date = get_trade_day(maCurrent.trade_date, -1)

  -- ma
  and maCurrent.ma5 >= maCurrent.ma10
  and maCurrent.ma10 >= maCurrent.ma20
  and maBefore.ma5 >= maBefore.ma10
  and maBefore.ma10 >= maBefore.ma20

  -- 行业
  and sbi.stock_code = maCurrent.stock_code

  -- 60天前交易
  and tradeCurrent.close_price > (select max(t.close_price)
                                  from stock_trade_dn t
                                  where t.stock_code = maCurrent.stock_code
                                    and t.trade_date >= get_trade_day(maCurrent.trade_date, -60)
                                    and t.trade_date <= get_trade_day(maCurrent.trade_date, -20))

  -- 昨天交易
  and tradeBefore.stock_code = maCurrent.stock_code
  and tradeBefore.trade_date = get_trade_day(maCurrent.trade_date, -1)
  and tradeBefore.trade_num <= tradeCurrent.trade_num

  -- 今天交易
  and tradeCurrent.stock_code = maCurrent.stock_code
  and tradeCurrent.trade_date = maCurrent.trade_date
  and tradeCurrent.zd > 1
  and tradeCurrent.zd < 8
  and tradeCurrent.close_price >= tradeCurrent.open_price
  and tradeCurrent.close_price >= 10
  and tradeCurrent.trade_num >= 50000
  -- 市值 [50亿，300亿]
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) >= 5000000000
  and (tradeCurrent.trade_money / tradeCurrent.hs * 100) <= 30000000000

order by sbi.industry_name
;












