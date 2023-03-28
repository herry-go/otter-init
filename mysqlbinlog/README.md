# binlog全量同步，增量同步，区间同步工具

## 使用说明

1.先保证该程序与mysql的连通性

2.mysql配置开启主从同步，且binlog_format="ROW"

## 配置文件说明

查看config/conf.json
```json
{
  "auth": {
    "host": "127.0.0.1",
    "port": 3306,
    "user": "root",
    "password": "123456"
  },
  "sync_type": 1,
  "position": {
    "start": {
      "file_name": "mysql-bin.000001",
      "pos": 0
    },
    "end": {
      "file_name": "",
      "pos": 1
    }
  }
}

```

| 参数        |      说明       | 备注                   |
| :---------- | :-------------: | ---------------------- |
| host        |    mysql的ip    |                        |
| port        | mysql对应的端口 |                        |
| user        | mysql的root账号 |                        |
| password    | mysql的root密码 |                        |
| sync_type   |    同步方式     | 1 全量同步 2 区间同步  |
| position    |      点位       |                        |
| -start      |    开始区间     |                        |
| --file_name |  binlog文件名   | 例如：mysql-bin.000001 |
| --pos       |      点位       | 例如：123              |
| -end        |    结束区间     |                        |
| --file_name |  binlog文件名   | 例如：mysql-bin.000001 |
| --pos       |      点位       | 例如：123              |

### sync_type 说明

> 全量同步：全量同步mysql的binlog，直到同步到mysql最新的点位，开始监听mysql的binlog事件变化，程序不会自动退出；
>
> 区间同步：填写binlog的文件名，和起止节点，同步完后，程序退出
>
> 备注：
>
> 1.全量同步时，程序中的binlog目录存在，则进行根据上一次同步的点位进行增量同步；如果想重新全量同步，则删掉程序中的binlog目录，重新启动程序即可

## sql输出目录

可执行程序的同级目录下生成一个output.sql，sql不是实时更新的，需要将程序退出后，才可以查看导出的sql，如果存在output.sql,会在该文件中追加信息
