
-- 查询
show full processlist;

-- kill
select concat('kill ', id, ';') from information_schema.processlist ;

kill 28536;
kill 5;
kill 28510;
kill 28534;
kill 28535;
