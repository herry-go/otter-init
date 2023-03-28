#!/bin/bash

source otter_conf.bash

########################################################################################################################
USERNAME=${master_idc_mysql_dbUsername}
PASSWORD=${master_idc_mysql_dbPassword}
SLAVE_HOST=${master_idc_mysql_slave_ip1}
SLAVE_PORT=${master_idc_mysql_slave_port1}

MYSQL="mysql -u$USERNAME -p$PASSWORD"
SLAVE="$MYSQL -h $SLAVE_HOST -P $SLAVE_PORT"
datetime=`date +"%Y-%m-%d %H:%M:%S"`
MySQL_Status=`$SLAVE -e "SHOW SLAVE STATUS\G"  | grep -E "Running|Seconds_Behind_Master"|head -n3 `
Slave_IO_Running=`echo $MySQL_Status | grep Slave_IO_Running |awk '{print $2}'`
Slave_SQL_Running=`echo $MySQL_Status |grep Slave_SQL_Running |awk '{print $4}'`
Seconds_Behind_Master=`echo $MySQL_Status |grep Seconds_Behind_Master |awk '{print $6}'`
echo "==================================================${SLAVE_HOST}"
#echo $MySQL_Status
#echo $Slave_IO_Running
#echo $Slave_SQL_Running
#echo $Seconds_Behind_Master
if [ "$Slave_IO_Running" != "" -a "$Slave_SQL_Running" != "" ]
then
    echo "is slave"
else
    echo "is master"
fi
########################################################################################################################
USERNAME=${master_idc_mysql_dbUsername}
PASSWORD=${master_idc_mysql_dbPassword}
SLAVE_HOST=${master_idc_mysql_slave_ip2}
SLAVE_PORT=${master_idc_mysql_slave_port2}

MYSQL="mysql -u$USERNAME -p$PASSWORD"
SLAVE="$MYSQL -h $SLAVE_HOST -P $SLAVE_PORT"
datetime=`date +"%Y-%m-%d %H:%M:%S"`
MySQL_Status=`$SLAVE -e "SHOW SLAVE STATUS\G"  | grep -E "Running|Seconds_Behind_Master"|head -n3 `
Slave_IO_Running=`echo $MySQL_Status | grep Slave_IO_Running |awk '{print $2}'`
Slave_SQL_Running=`echo $MySQL_Status |grep Slave_SQL_Running |awk '{print $4}'`
Seconds_Behind_Master=`echo $MySQL_Status |grep Seconds_Behind_Master |awk '{print $6}'`
echo "==================================================${SLAVE_HOST}"
#echo $MySQL_Status
#echo $Slave_IO_Running
#echo $Slave_SQL_Running
#echo $Seconds_Behind_Master
if [ "$Slave_IO_Running" != "" -a "$Slave_SQL_Running" != "" ]
then
    echo "is slave"
else
    echo "is master"
fi
########################################################################################################################
USERNAME=${master_idc_mysql_dbUsername}
PASSWORD=${master_idc_mysql_dbPassword}
SLAVE_HOST=${master_idc_mysql_master_ip}
SLAVE_PORT=${master_idc_mysql_master_port}

MYSQL="mysql -u$USERNAME -p$PASSWORD"
SLAVE="$MYSQL -h $SLAVE_HOST -P $SLAVE_PORT"
datetime=`date +"%Y-%m-%d %H:%M:%S"`
MySQL_Status=`$SLAVE -e "SHOW SLAVE STATUS\G"  | grep -E "Running|Seconds_Behind_Master"|head -n3 `
Slave_IO_Running=`echo $MySQL_Status | grep Slave_IO_Running |awk '{print $2}'`
Slave_SQL_Running=`echo $MySQL_Status |grep Slave_SQL_Running |awk '{print $4}'`
Seconds_Behind_Master=`echo $MySQL_Status |grep Seconds_Behind_Master |awk '{print $6}'`
echo "==================================================${SLAVE_HOST}"
#echo $MySQL_Status
#echo $Slave_IO_Running
#echo $Slave_SQL_Running
#echo $Seconds_Behind_Master
if [ "$Slave_IO_Running" != "" -a "$Slave_SQL_Running" != "" ]
then
    echo "is slave"
else
    echo "is master"
fi