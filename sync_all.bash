#! /bin/bash
source sync_conf.bash

# 备份mysql
function backup_mysql() {
    echo "开始备份源端数据..."
    mkdir -p "$BACKUP_MYSQL_DIR"
    for db in ${BACKUP_MYSQL_DATABASES[*]}; do
        sql_file="$BACKUP_MYSQL_DIR/$db.sql"
        echo "备份数据：$db -> $sql_file"
        mysqldump -P $SOURCE_MYSQL_PORT -h $SOURCE_MYSQL_IP -u$SOURCE_MYSQL_USERNAME -p$SOURCE_MYSQL_PASSWORD --databases $db > $sql_file
    done
    echo "所有源端数据备份完成"
}
# 恢复mysql
function restore_mysql() {
    # 在mysql主库写入数据
    echo "开始写入目标端数据..."
    mkdir -p "$BACKUP_MYSQL_DIR"
    for db in ${BACKUP_MYSQL_DATABASES[*]}; do
        ssql_file="$BACKUP_MYSQL_DIR/$db.sql"
        echo "写入数据：$db -> $sql_file"
        mysql -P $TARGET_MYSQL_PORT -h $TARGET_MYSQL_IP -u$TARGET_MYSQL_USERNAME -p$TARGET_MYSQL_PASSWORD $db < $sql_file
        echo "写入目标端数据完成：${db}"
    done
    echo "所有目标端数据写入完成"
}
backup_mysql
restore_mysql