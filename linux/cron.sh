# 编辑cron
crontab -e

# 查询cron列表
crontab -l

# 读取cron文件内容，添加cron
# coron文件内容：0 2 * * * /root/mysql_backup_script.sh
crontab mysqlRollback.cron

