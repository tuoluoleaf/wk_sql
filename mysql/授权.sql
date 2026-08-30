
-- 查询授权
SHOW GRANTS FOR 'root'@'%';
SELECT user,host,plugin FROM mysql.user WHERE user='root';


-- 修改密码
ALTER USER 'root'@'localhost' IDENTIFIED BY 'leaf123';
FLUSH PRIVILEGES;


-- 授权
CREATE USER 'root'@'%' IDENTIFIED BY '你的密码';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;


-- mysql8需要使用local先给*的root用户授权，需要进入docker里面执行
-- 1：进入容器
docker ps
docker exec -it mysql bash

-- 2：登录mysql，'root'@'local'
mysql -uroot -p

-- 3：给'root'@'*'授权
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;

