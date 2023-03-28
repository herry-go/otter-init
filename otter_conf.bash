#! /bin/bash
#zk配置
zk_cluster_address="zk-svc:2181"
zk_cluster_name="zk1"

#主中心
##node节点配置
master_idc_node1="10.30.36.211"
master_idc_node2="10.30.36.212"
master_idc_node3="10.30.36.213"
master_idc_node1_external_ip="10.30.36.211"
master_idc_node2_external_ip="10.30.36.212"
master_idc_node3_external_ip="10.30.36.213"
master_idc_node1_id="212"
master_idc_node2_id="213"
master_idc_node3_id=""
##canal 配置
master_idc_mysql_master_ip="10.30.36.211"
master_idc_mysql_slave_ip1="10.30.36.212"
master_idc_mysql_slave_ip2="10.30.36.213"
master_idc_mysql_master_port="3306"
master_idc_mysql_slave_port1="3306"
master_idc_mysql_slave_port2="3306"
master_idc_mysql_dbUsername="uos"
master_idc_mysql_dbPassword="Udcp2022cs"

#从中心
##node节点配置
slave_idc_node1="10.20.15.211"
slave_idc_node2="10.20.15.212"
slave_idc_node3="10.20.15.213"
slave_idc_node1_external_ip="10.20.15.211"
slave_idc_node2_external_ip="10.20.15.212"
slave_idc_node3_external_ip="10.20.15.213"
slave_idc_node1_id="214"
slave_idc_node2_id="215"
slave_idc_node3_id=""
##canal 配置
slave_idc_mysql_master_ip="10.20.15.211"
slave_idc_mysql_slave_ip1="10.20.15.212"
slave_idc_mysql_slave_ip2="10.20.15.213"
slave_idc_mysql_master_port="3306"
slave_idc_mysql_slave_port1="3306"
slave_idc_mysql_slave_port2="3306"
slave_idc_mysql_dbUsername="uos"
slave_idc_mysql_dbPassword="Udcp2022cs"

