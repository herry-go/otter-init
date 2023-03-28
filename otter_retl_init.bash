#!/bin/bash
WORKDIR=$(pwd)
source otter_conf.bash

MYSQL_CMD="mysql -h ${master_idc_mysql_master_ip} -P ${master_idc_mysql_master_port} -u ${master_idc_mysql_dbUsername} --password=${master_idc_mysql_dbPassword}"
echo $MYSQL_CMD
$MYSQL_CMD  -e "set global max_connections=5000;"
$MYSQL_CMD < $WORKDIR/sql/RETL.sql
echo -e "\033[34m RETL配置成功\033[0m"

MYSQL_CMD="mysql -h ${slave_idc_mysql_master_ip} -P ${slave_idc_mysql_master_port} -u ${slave_idc_mysql_dbUsername} --password=${slave_idc_mysql_dbPassword}"
echo $MYSQL_CMD
$MYSQL_CMD  -e "set global max_connections=5000;"
$MYSQL_CMD < $WORKDIR/sql/RETL.sql
echo -e "\033[34m RETL配置成功\033[0m"