#! /bin/bash
################################################公用配置###########################################
# 资源路径位置
export BACKUP_TMP_DIR="/tmp"
export BACKUP_MYSQL_DIR="$BACKUP_TMP_DIR/otter"
export MYSQL_BINLOG_DIR="/data/mysql/data"
# 目标端配置
export TARGET_MYSQL_IP=10.20.15.211
export TARGET_MYSQL_PORT=3306
export TARGET_MYSQL_USERNAME=uos
export TARGET_MYSQL_PASSWORD=Udcp2022cs
# mysql需要同步的库
export BACKUP_MYSQL_DATABASES=(
    notification
    udcp_api_auth
    udcp_backup
    udcp_cascade
    udcp_job
    udcp_log
    udcp_policy
    udcp_rms
    udcp_uim
    udcp_webhook
)
################################################全量同步###########################################
# 源端配置
export SOURCE_MYSQL_IP=10.30.36.211
export SOURCE_MYSQL_PORT=3306
export SOURCE_MYSQL_USERNAME=uos
export SOURCE_MYSQL_PASSWORD=Udcp2022cs
################################################区间同步###########################################
# 源端binlog配置
export BINLOG_FILE_NAME="$MYSQL_BINLOG_DIR/mariadb-bin.000027"
export START_POSITION=4975421
export STOP_POSITION=4984429