-- 竞价实时
select trade_date,
       count(0)
from trade_calendar
group by trade_date
order by trade_date desc
;


-- 日K
select trade_date,
       count(0)
from bar_daily
group by trade_date
order by trade_date desc
;

select trade_date,
       count(0) as nums
from bar_daily
group by trade_date
having nums < 5000
;


-- 涨停数据
select trade_date,
       count(0)
from limit_up_event
group by trade_date
order by trade_date desc
;

-- 涨停题材
select trade_date,  count(0)
from limit_up_event
where length(theme) = 0
group by trade_date
order by trade_date desc
;

SELECT
  trade_date,
  COUNT(*) AS lu_cnt,
  SUM(CASE WHEN theme IS NOT NULL AND theme <> '' THEN 1 ELSE 0 END) AS theme_filled,
  COUNT(*) - SUM(CASE WHEN theme IS NOT NULL AND theme <> '' THEN 1 ELSE 0 END) AS theme_empty,
  ROUND(
    100.0 * SUM(CASE WHEN theme IS NOT NULL AND theme <> '' THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS fill_rate_pct
FROM limit_up_event
WHERE trade_date BETWEEN date'2025-01-01' AND date'2026-12-31'
GROUP BY trade_date
ORDER BY trade_date DESC;

-- 竞价结果数据
select trade_date,
       count(0)
from auction_event
group by trade_date
order by trade_date desc
;

-- 竞价实时
select trade_date,
       count(0)
from auction_live
group by trade_date
order by trade_date desc
;

delete from auction_event where trade_date = date'20261008';


-- 人气池
select a.trade_date,
       count(b.id)
from  trade_calendar a
left join hot_candidate b on a.trade_date = b.trade_date
group by a.trade_date
order by a.trade_date desc
;

select *
from (select a.trade_date,
             count(b.id) as num
      from trade_calendar a
               left join hot_candidate b on a.trade_date = b.trade_date
      group by a.trade_date) tmp
where tmp.num = 0
order by trade_date desc
;

