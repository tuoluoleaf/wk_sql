select current_date, get_trade_day(current_date, -1) from dual;

-- ------------------- 反向指标 -----------------------
# [主力密码]#[主力进场|主力加仓]
select t1.stock_code,
       t1.stock_name,
       t1.monitor_date,
       t1.will,
       base.turnover_gt_8w
from main_force_secret t1,
     stock_base_info base
where 1=1
  and t1.will in ('主力出场', '主力减仓')
  and t1.monitor_date <= current_date
  and t1.monitor_date >= get_trade_day(current_date, -1)
  #
  and base.stock_code = t1.stock_code
  and turnover_gt_8w = '是'
;

# [神奇九转].[红九转]
select t2.stock_code,
       t2.stock_name,
       t2.signal_date,
       t2.turn_type,
       base.industry_name,
       base.turnover_gt_8w
from magical_nine_turn t2,
     stock_base_info base
where 1=1
  and t2.turn_type = '绿九转'
  and t2.signal_date <= current_date
  and t2.signal_date >= get_trade_day(current_date, -1)

  #
  and base.stock_code = t2.stock_code
  and turnover_gt_8w = '是'
;

# [主力密码]#[主力进场|主力加仓]  and [神奇九转].[红九转]
select t1.stock_code,
       t1.stock_name,
       t1.monitor_date,
       t1.will,
       t2.signal_date,
       t2.turn_type,
       base.industry_name,
       base.turnover_gt_8w
from main_force_secret t1,
     magical_nine_turn t2,
     stock_base_info base
where t1.stock_code = t2.stock_code
  and t1.will in ('主力出场', '主力减仓')
  and t1.monitor_date <= current_date
  and t1.monitor_date >= get_trade_day(current_date, -1)
  #
  and t2.turn_type = '绿九转'
  and t2.signal_date <= current_date
  and t2.signal_date >= get_trade_day(current_date, -1)

  #
  and base.stock_code = t1.stock_code
  and turnover_gt_8w = '是'
order by t1.monitor_date desc
;

--  行业分布
# [主力密码]#[主力进场|主力加仓] # 行业分布
select t1.stock_code,
       t1.stock_name,
       t1.monitor_date,
       t1.will,
       base.industry_name
from main_force_secret t1 left join stock_base_info base on t1.stock_code = base.stock_code
where 1=1
  and t1.will in ('主力出场', '主力减仓')
  and t1.monitor_date <= current_date
  and t1.monitor_date >= get_trade_day(current_date, -1)
;

# [神奇九转].[红九转]  # 行业分布
select t2.stock_code,
       t2.stock_name,
       t2.signal_date,
       t2.turn_type,
       base.industry_name
from magical_nine_turn t2 left join stock_base_info base on t2.stock_code = base.stock_code
where 1=1
  and t2.turn_type = '绿九转'
  and t2.signal_date <= current_date
  and t2.signal_date >= get_trade_day(current_date, -1)
;

# [主力密码]#[主力进场|主力加仓] or [神奇九转].[红九转]  # 行业分布
select t1.stock_code,
       t1.stock_name,
       t1.monitor_date as date,
       t1.will as tag,
       base.industry_name,
       base.turnover_gt_8w
from main_force_secret t1,
     stock_base_info base
where 1=1
  and t1.will in ('主力出场', '主力减仓')
  and t1.monitor_date <= current_date
  and t1.monitor_date >= get_trade_day(current_date, -1)
  and t1.stock_code = base.stock_code
#   and base.turnover_gt_8w = '是'

union all

select t2.stock_code,
       t2.stock_name,
       t2.signal_date as date,
       t2.turn_type as tag,
       base.industry_name,
       base.turnover_gt_8w
from magical_nine_turn t2,
     stock_base_info base
where 1=1
  and t2.turn_type = '绿九转'
  and t2.signal_date <= current_date
  and t2.signal_date >= get_trade_day(current_date, -1)
  and t2.stock_code = base.stock_code
#   and base.turnover_gt_8w = '是'
order by industry_name, turnover_gt_8w, stock_name
;