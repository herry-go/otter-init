#!/bin/bash
WORKDIR=$(pwd)
source otter_conf.bash
source otter_position.bash
cp -r ./template/* ./sql
sed -i \
  -e "s/{zk_cluster_address}/${zk_cluster_address}/g" \
  -e "s/{zk_cluster_name}/${zk_cluster_name}/g" \
  -e "s/{slave_idc_node1}/${slave_idc_node1}/g" \
  -e "s/{slave_idc_node2}/${slave_idc_node2}/g" \
  -e "s/{slave_idc_node3}/${slave_idc_node3}/g" \
  -e "s/{master_idc_node1}/${master_idc_node1}/g" \
  -e "s/{master_idc_node2}/${master_idc_node2}/g" \
  -e "s/{master_idc_node3}/${master_idc_node3}/g" \
  -e "s/{slave_idc_node1_external_ip}/${slave_idc_node1_external_ip}/g" \
  -e "s/{slave_idc_node2_external_ip}/${slave_idc_node2_external_ip}/g" \
  -e "s/{slave_idc_node3_external_ip}/${slave_idc_node3_external_ip}/g" \
  -e "s/{master_idc_node1_external_ip}/${master_idc_node1_external_ip}/g" \
  -e "s/{master_idc_node2_external_ip}/${master_idc_node2_external_ip}/g" \
  -e "s/{master_idc_node3_external_ip}/${master_idc_node3_external_ip}/g" \
  -e "s/{master_idc_mysql_master_ip}/${master_idc_mysql_master_ip}/g" \
  -e "s/{master_idc_mysql_slave_ip1}/${master_idc_mysql_slave_ip1}/g" \
  -e "s/{master_idc_mysql_slave_ip2}/${master_idc_mysql_slave_ip2}/g" \
  -e "s/{master_idc_mysql_master_port}/${master_idc_mysql_master_port}/g" \
  -e "s/{master_idc_mysql_slave_port1}/${master_idc_mysql_slave_port1}/g" \
  -e "s/{master_idc_mysql_slave_port2}/${master_idc_mysql_slave_port2}/g" \
  -e "s/{master_idc_mysql_dbUsername}/${master_idc_mysql_dbUsername}/g" \
  -e "s/{master_idc_mysql_dbPassword}/${master_idc_mysql_dbPassword}/g" \
  -e "s/{slave_idc_mysql_master_ip}/${slave_idc_mysql_master_ip}/g" \
  -e "s/{slave_idc_mysql_slave_ip1}/${slave_idc_mysql_slave_ip1}/g" \
  -e "s/{slave_idc_mysql_slave_ip2}/${slave_idc_mysql_slave_ip2}/g" \
  -e "s/{slave_idc_mysql_master_port}/${slave_idc_mysql_master_port}/g" \
  -e "s/{slave_idc_mysql_slave_port1}/${slave_idc_mysql_slave_port1}/g" \
  -e "s/{slave_idc_mysql_slave_port2}/${slave_idc_mysql_slave_port2}/g" \
  -e "s/{slave_idc_mysql_dbUsername}/${slave_idc_mysql_dbUsername}/g" \
  -e "s/{slave_idc_mysql_dbPassword}/${slave_idc_mysql_dbPassword}/g" \
  -e "s/{master_idc_node1_id}/${master_idc_node1_id}/g" \
  -e "s/{master_idc_node2_id}/${master_idc_node2_id}/g" \
  -e "s/{master_idc_node3_id}/${master_idc_node3_id}/g" \
  -e "s/{slave_idc_node1_id}/${slave_idc_node1_id}/g" \
  -e "s/{slave_idc_node2_id}/${slave_idc_node2_id}/g" \
  -e "s/{slave_idc_node3_id}/${slave_idc_node3_id}/g" \
  -e "s/{binlog_file}/${binlog_file}/g" \
  -e "s/{binlog_pos}/${binlog_pos}/g" \
  -e "s/{slave_binlog_file}/${slave_binlog_file}/g" \
  -e "s/{slave_binlog_pos}/${slave_binlog_pos}/g" \
  $WORKDIR/sql/*.sql \
  || exit 1


MYSQL_CMD="mysql -h ${master_idc_mysql_master_ip} -P ${master_idc_mysql_master_port} -u ${master_idc_mysql_dbUsername} --password=${master_idc_mysql_dbPassword}"
$MYSQL_CMD  -e "set global max_connections=5000;"
$MYSQL_CMD < $WORKDIR/sql/OTTER.sql
echo -e "\033[34m otter数据库创建成功\033[0m"
$MYSQL_CMD < $WORKDIR/sql/AUTOKEEPER_CLUSTER.sql
echo -e "\033[34m zk集群配置成功\033[0m"
$MYSQL_CMD < $WORKDIR/sql/NODE.sql
echo -e "\033[34m node节点配置成功\033[0m"
$MYSQL_CMD < $WORKDIR/sql/CANAL.sql
echo -e "\033[34m CANAL配置成功\033[0m"
$MYSQL_CMD < $WORKDIR/sql/DATA_MEDIA_SOURCE.sql
echo -e "\033[34m 数据源配置成功\033[0m"
$MYSQL_CMD < $WORKDIR/sql/DATA_MEDIA.sql
echo -e "\033[34m 数据库和表配置成功\033[0m"
$MYSQL_CMD < $WORKDIR/sql/DATA_MEDIA_PAIR.sql
echo -e "\033[34m 数据源和目标源对应配置成功\033[0m"
$MYSQL_CMD < $WORKDIR/sql/CHANNEL.sql
echo -e "\033[34m CHANNEL配置成功\033[0m"
$MYSQL_CMD < $WORKDIR/sql/PIPELINE.sql
echo -e "\033[34m PIPELINE配置成功\033[0m"
$MYSQL_CMD < $WORKDIR/sql/PIPELINE_NODE_RELATION.sql
echo -e "\033[34m 映射关系列表配置成功\033[0m"
$MYSQL_CMD < $WORKDIR/sql/SYSTEM_PARAMETER.sql
echo -e "\033[34m 系统表配置成功\033[0m"
$MYSQL_CMD < $WORKDIR/sql/DATA_MATRIX.sql
echo -e "\033[34m 主备配置成功\033[0m"