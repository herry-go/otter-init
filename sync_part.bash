#! /bin/bash
source sync_conf.bash

# 读取binlog
function binlog_mysql() {
    echo "开始读取源端binlog..."
    mkdir -p "$BACKUP_MYSQL_DIR"
    for db in ${BACKUP_MYSQL_DATABASES[*]}; do
        sql_file="$BACKUP_MYSQL_DIR/$db.sql"
        echo "读取binlog：$db -> $sql_file"
        mysqlbinlog --no-defaults --database=$db --start-position=$START_POSITION --stop-position=$STOP_POSITION $BINLOG_FILE_NAME > $sql_file
    done
    echo "所有源端数据读取完成"
}
# 倒入mysql
function import_mysql() {
    # 在mysql主库写入数据
    echo "开始写入目标端数据..."
    mkdir -p "$BACKUP_MYSQL_DIR"
    for db in ${BACKUP_MYSQL_DATABASES[*]}; do
        sql_file="$BACKUP_MYSQL_DIR/$db.sql"
        echo "写入数据：$db -> $sql_file"
        mysql -P $TARGET_MYSQL_PORT -h $TARGET_MYSQL_IP -u$TARGET_MYSQL_USERNAME -p$TARGET_MYSQL_PASSWORD $db < $sql_file
        echo "写入目标端数据完成：${db}"
    done
    echo "所有目标端数据写入完成"
}
binlog_mysql
import_mysql