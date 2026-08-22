-- 同花顺：股票基本信息清洗
update stock_base_info
set market = 'SZ'
where stock_code like '%SZ';
update stock_base_info
set market = 'SH'
where stock_code like '%SH';
update stock_base_info
set market = 'BJ'
where stock_code like '%BJ';
update stock_base_info
set stock_code = replace(stock_code, '.SZ', '')
where stock_code like '%SZ';
update stock_base_info
set stock_code = replace(stock_code, '.SH', '')
where stock_code like '%SH';
update stock_base_info
set stock_code = replace(stock_code, '.BJ', '')
where stock_code like '%BJ';
update stock_base_info
set lt_market_value = round(lt_market_value / 100000000, 2);


-- 更新最新流动市值
update stock_base_info base
set base.lt_market_value =
            (select round(trade.trade_money / trade.hs * 100 / 100000000, 2) from stock_trade trade where trade.stock_code = base.stock_code and trade.trade_date = get_trade_day(date'2025-05-30', 0))
where base.lt_market_value is null
;

-- 更新涨跌标识-涨停
update stock_trade trade
set trade.zd_remark = '涨停'
where trade.stock_code not like '30%'
  and trade.stock_code not like '688%'
  and trade.zd > 9.7
;

-- 更新涨跌标识-跌停
update stock_trade trade
set trade.zd_remark = '跌停'
where trade.stock_code not like '30%'
  and trade.stock_code not like '688%'
  and trade.zd < -9.7
;

-- 更新涨跌标识-炸板
update stock_trade trade
set trade.zd_remark = '炸板'
where trade.stock_code not like '30%'
  and trade.stock_code not like '688%'
  and trade.zd < 9.7
  and trade.zd > -9.7
  and trade.highest_price != trade.close_price
  and (1 + trade.zd / 100) != 0
  and (trade.close_price / (1 + trade.zd / 100)) != 0
  and (trade.highest_price - (trade.close_price / (1 + trade.zd / 100))) / (trade.close_price / (1 + trade.zd / 100)) > 0.097
;

-- 涨跌级别：首板、首炸板
with aa as (select trade.id
            from stock_trade trade,
                 stock_trade tradeB1
            where tradeB1.stock_code = trade.stock_code
              and tradeB1.trade_date = get_trade_day(trade.trade_date, -1)
              and trade.zd_remark = '涨停'
              and (tradeB1.zd_remark != '涨停' or tradeB1.zd_remark is null))

update stock_trade
set level_num = 1
where id in (select id from aa)
;

with aa as (select trade.id
            from stock_trade trade,
                 stock_trade tradeB1
            where tradeB1.stock_code = trade.stock_code
              and tradeB1.trade_date = get_trade_day(trade.trade_date, -1)
              and trade.zd_remark = '炸板'
              and (tradeB1.zd_remark != '涨停' or tradeB1.zd_remark is null))

update stock_trade
set level_num = 1
where id in (select id from aa)
;

