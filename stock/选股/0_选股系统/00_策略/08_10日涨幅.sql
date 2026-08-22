--
--

select *
from (select tmp1.*,
             row_number() over (partition by trade_date order by tmp1.zd_10 desc) as rn
      from (select trade.trade_date,
                   trade.stock_code,
                   trade.stock_name,
                   round((select (trade.close_price - trade1.close_price) / trade1.close_price * 100
                          from stock_trade trade1
                          where trade1.stock_code = trade.stock_code
                            and trade1.trade_date = get_trade_day(trade.trade_date, -10)), 2) as zd_10,
                   trade.zd
            from stock_trade trade
            where 1 = 1
              and trade.trade_date = date'2025-06-06'
#               and trade.trade_date >= date'2025-05-15'
#               and trade.trade_date <= date'2025-05-15'
           ) tmp1
      where tmp1.zd_10 > 20) tmp2
where tmp2.rn < 30
order by trade_date desc, rn
;




