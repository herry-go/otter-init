#!/bin/sh
source otter_conf.bash
SQL="show master status;"
MYSQL=`mysql -h ${master_idc_mysql_master_ip} -P ${master_idc_mysql_master_port}  -u ${master_idc_mysql_dbUsername} --password=${master_idc_mysql_dbPassword} -e "${SQL}"`
binlog_file=`echo $MYSQL|awk -F ' ' '{print $5}'`
binlog_pos=`echo $MYSQL|awk -F ' ' '{print $6}'`
echo ${binlog_file}
echo ${binlog_pos}
MYSQL=`mysql -h ${slave_idc_mysql_master_ip} -P ${slave_idc_mysql_master_port}  -u ${slave_idc_mysql_dbUsername} --password=${slave_idc_mysql_dbPassword} -e "${SQL}"`
slave_binlog_file=`echo $MYSQL|awk -F ' ' '{print $5}'`
slave_binlog_pos=`echo $MYSQL|awk -F ' ' '{print $6}'`
echo ${slave_binlog_file}
echo ${slave_binlog_pos}