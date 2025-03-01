#!/bin/bash

#保存备份个数，备份31天数据
number=5
#备份保存路径
backup_dir=/dump
#日期
dd=`date +%Y-%m-%d-%H-%M-%S`
#用户名
username=root
#密码
password=leaf@admin123
#将要备份的数据库
db_name_array=(stock gogs)

#如果文件夹不存在则创建
if [ ! -d $backup_dir ];
then
    mkdir -p $backup_dir;
fi


#执行备份
for database_name in ${db_name_array[*]}
do
  #简单写法  mysqldump -u root -p123456 users > /root/mysqlbackup/init_stock_zt.sql
  mysqldump -u $username -p$password $database_name > $backup_dir/$database_name-$dd.sql

  #写创建备份日志
  echo "create $backup_dir/$database_name-$dd.dupm" >> $backup_dir/log.txt

  #找出需要删除的备份
  del_file=`ls -l -crt  $backup_dir/$database_name*.sql | awk '{print $9 }' | head -1`

  #判断现在的备份数量是否大于$number
  count=`ls -l -crt  $backup_dir/$database_name*.sql | awk '{print $9 }' | wc -l`

  if [ $count -gt $number ]
  then
    #删除最早生成的备份，只保留number数量的备份
    rm $del_file
    #写删除文件日志
    echo "delete $del_file" >> $backup_dir/log.txt
  fi
done
