-- 数据库文件存放路径
show variables like 'datadir';


-- 查询表-列详细信息
select *
from information_schema.columns
where table_schema = 'reggie'
  and table_name = 'employee'
order by ordinal_position ;