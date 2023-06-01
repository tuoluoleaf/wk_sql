-- --------------- 1、备份 ---------------------------------
-- 1、备份全部数据库的数据和结构
mysqldump -uroot -p123456 -A > /data/mysqlDump/mydb.sql

-- 2、备份全部数据库的结构（加 -d 参数）
mysqldump -uroot -p123456 -A -d > /data/mysqlDump/mydb.sql

-- 3、备份全部数据库的数据(加 -t 参数)
mysqldump -uroot -p123456 -A -t > /data/mysqlDump/mydb.sql

-- 4、备份单个数据库的数据和结构(,数据库名mydb)
mysqldump -uroot-p123456 mydb > /data/mysqlDump/mydb.sql

-- 5、备份单个数据库的结构
mysqldump -uroot -p123456 stock -d > /data/mysqlDump/mydb.sql

-- 6、备份单个数据库的数据
mysqldump -uroot -p123456 stock -t > /data/mysqlDump/mydb.sql

-- 7、备份多个表的数据和结构（数据，结构的单独备份方法与上同）
mysqldump -uroot -p123456 stock t1 t2 > /data/mysqlDump/mydb.sql

-- 8、一次备份多个数据库
mysqldump -uroot -p123456 --databases db1 db2 > /data/mysqlDump/mydb.sql



-- ------------------- 2、数据还原 ---------------------------------
mysql -uroot -p123456 stock < /root/mysql_backup/stock-2023-06-01-13-49-48.sql
