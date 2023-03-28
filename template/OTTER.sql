DROP DATABASE IF EXISTS `otter`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `otter` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `otter`;

SET sql_mode='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

CREATE TABLE `ALARM_RULE` (
                              `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                              `MONITOR_NAME` varchar(1024) DEFAULT NULL,
                              `RECEIVER_KEY` varchar(1024) DEFAULT NULL,
                              `STATUS` varchar(32) DEFAULT NULL,
                              `PIPELINE_ID` bigint(20) NOT NULL,
                              `DESCRIPTION` varchar(256) DEFAULT NULL,
                              `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                              `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                              `MATCH_VALUE` varchar(1024) DEFAULT NULL,
                              `PARAMETERS` text DEFAULT NULL,
                              PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `AUTOKEEPER_CLUSTER` (
                                      `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                      `CLUSTER_NAME` varchar(200) NOT NULL,
                                      `SERVER_LIST` varchar(1024) NOT NULL,
                                      `DESCRIPTION` varchar(200) DEFAULT NULL,
                                      `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                      `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                      PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `CANAL` (
                         `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                         `NAME` varchar(200) DEFAULT NULL,
                         `DESCRIPTION` varchar(200) DEFAULT NULL,
                         `PARAMETERS` text DEFAULT NULL,
                         `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                         `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                         PRIMARY KEY (`ID`),
                         UNIQUE KEY `CANALUNIQUE` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `CHANNEL` (
                           `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                           `NAME` varchar(200) NOT NULL,
                           `DESCRIPTION` varchar(200) DEFAULT NULL,
                           `PARAMETERS` text DEFAULT NULL,
                           `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                           `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                           PRIMARY KEY (`ID`),
                           UNIQUE KEY `CHANNELUNIQUE` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `COLUMN_PAIR` (
                               `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                               `SOURCE_COLUMN` varchar(200) DEFAULT NULL,
                               `TARGET_COLUMN` varchar(200) DEFAULT NULL,
                               `DATA_MEDIA_PAIR_ID` bigint(20) NOT NULL,
                               `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                               `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                               PRIMARY KEY (`ID`),
                               KEY `idx_DATA_MEDIA_PAIR_ID` (`DATA_MEDIA_PAIR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `COLUMN_PAIR_GROUP` (
                                     `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                     `DATA_MEDIA_PAIR_ID` bigint(20) NOT NULL,
                                     `COLUMN_PAIR_CONTENT` text DEFAULT NULL,
                                     `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                     `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                     PRIMARY KEY (`ID`),
                                     KEY `idx_DATA_MEDIA_PAIR_ID` (`DATA_MEDIA_PAIR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `DATA_MEDIA` (
                              `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                              `NAME` varchar(200) NOT NULL,
                              `NAMESPACE` varchar(200) NOT NULL,
                              `PROPERTIES` varchar(1000) NOT NULL,
                              `DATA_MEDIA_SOURCE_ID` bigint(20) NOT NULL,
                              `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                              `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                              PRIMARY KEY (`ID`),
                              UNIQUE KEY `DATAMEDIAUNIQUE` (`NAME`,`NAMESPACE`,`DATA_MEDIA_SOURCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `DATA_MEDIA_PAIR` (
                                   `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                   `PULLWEIGHT` bigint(20) DEFAULT NULL,
                                   `PUSHWEIGHT` bigint(20) DEFAULT NULL,
                                   `RESOLVER` text DEFAULT NULL,
                                   `FILTER` text DEFAULT NULL,
                                   `SOURCE_DATA_MEDIA_ID` bigint(20) DEFAULT NULL,
                                   `TARGET_DATA_MEDIA_ID` bigint(20) DEFAULT NULL,
                                   `PIPELINE_ID` bigint(20) NOT NULL,
                                   `COLUMN_PAIR_MODE` varchar(20) DEFAULT NULL,
                                   `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                   `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                   PRIMARY KEY (`ID`),
                                   KEY `idx_PipelineID` (`PIPELINE_ID`,`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `DATA_MEDIA_SOURCE` (
                                     `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                     `NAME` varchar(200) NOT NULL,
                                     `TYPE` varchar(20) NOT NULL,
                                     `PROPERTIES` varchar(1000) NOT NULL,
                                     `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                     `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                     PRIMARY KEY (`ID`),
                                     UNIQUE KEY `DATAMEDIASOURCEUNIQUE` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `DELAY_STAT` (
                              `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                              `DELAY_TIME` bigint(20) NOT NULL,
                              `DELAY_NUMBER` bigint(20) NOT NULL,
                              `PIPELINE_ID` bigint(20) NOT NULL,
                              `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                              `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                              PRIMARY KEY (`ID`),
                              KEY `idx_PipelineID_GmtModified_ID` (`PIPELINE_ID`,`GMT_MODIFIED`,`ID`),
                              KEY `idx_Pipeline_GmtCreate` (`PIPELINE_ID`,`GMT_CREATE`),
                              KEY `idx_GmtCreate_id` (`GMT_CREATE`,`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `LOG_RECORD` (
                              `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                              `NID` varchar(200) DEFAULT NULL,
                              `CHANNEL_ID` varchar(200) NOT NULL,
                              `PIPELINE_ID` varchar(200) NOT NULL,
                              `TITLE` varchar(1000) DEFAULT NULL,
                              `MESSAGE` text DEFAULT NULL,
                              `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                              `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                              PRIMARY KEY (`ID`),
                              KEY `logRecord_pipelineId` (`PIPELINE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `NODE` (
                        `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                        `NAME` varchar(200) NOT NULL,
                        `IP` varchar(200) NOT NULL,
                        `PORT` bigint(20) NOT NULL,
                        `DESCRIPTION` varchar(200) DEFAULT NULL,
                        `PARAMETERS` text DEFAULT NULL,
                        `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                        `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                        PRIMARY KEY (`ID`),
                        UNIQUE KEY `NODEUNIQUE` (`NAME`,`IP`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `PIPELINE` (
                            `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                            `NAME` varchar(200) NOT NULL,
                            `DESCRIPTION` varchar(200) DEFAULT NULL,
                            `PARAMETERS` text DEFAULT NULL,
                            `CHANNEL_ID` bigint(20) NOT NULL,
                            `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                            `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                            PRIMARY KEY (`ID`),
                            UNIQUE KEY `PIPELINEUNIQUE` (`NAME`,`CHANNEL_ID`),
                            KEY `idx_ChannelID` (`CHANNEL_ID`,`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `PIPELINE_NODE_RELATION` (
                                          `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                          `NODE_ID` bigint(20) NOT NULL,
                                          `PIPELINE_ID` bigint(20) NOT NULL,
                                          `LOCATION` varchar(20) NOT NULL,
                                          `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                          `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                          PRIMARY KEY (`ID`),
                                          KEY `idx_PipelineID` (`PIPELINE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `SYSTEM_PARAMETER` (
                                    `ID` bigint(20) unsigned NOT NULL,
                                    `VALUE` text DEFAULT NULL,
                                    `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                    `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                    PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TABLE_HISTORY_STAT` (
                                      `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                                      `FILE_SIZE` bigint(20) DEFAULT NULL,
                                      `FILE_COUNT` bigint(20) DEFAULT NULL,
                                      `INSERT_COUNT` bigint(20) DEFAULT NULL,
                                      `UPDATE_COUNT` bigint(20) DEFAULT NULL,
                                      `DELETE_COUNT` bigint(20) DEFAULT NULL,
                                      `DATA_MEDIA_PAIR_ID` bigint(20) DEFAULT NULL,
                                      `PIPELINE_ID` bigint(20) DEFAULT NULL,
                                      `START_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                      `END_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                      `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                      `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                      PRIMARY KEY (`ID`),
                                      KEY `idx_DATA_MEDIA_PAIR_ID_END_TIME` (`DATA_MEDIA_PAIR_ID`,`END_TIME`),
                                      KEY `idx_GmtCreate_id` (`GMT_CREATE`,`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `TABLE_STAT` (
                              `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                              `FILE_SIZE` bigint(20) NOT NULL,
                              `FILE_COUNT` bigint(20) NOT NULL,
                              `INSERT_COUNT` bigint(20) NOT NULL,
                              `UPDATE_COUNT` bigint(20) NOT NULL,
                              `DELETE_COUNT` bigint(20) NOT NULL,
                              `DATA_MEDIA_PAIR_ID` bigint(20) NOT NULL,
                              `PIPELINE_ID` bigint(20) NOT NULL,
                              `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                              `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                              PRIMARY KEY (`ID`),
                              KEY `idx_PipelineID_DataMediaPairID` (`PIPELINE_ID`,`DATA_MEDIA_PAIR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `THROUGHPUT_STAT` (
                                   `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                   `TYPE` varchar(20) NOT NULL,
                                   `NUMBER` bigint(20) NOT NULL,
                                   `SIZE` bigint(20) NOT NULL,
                                   `PIPELINE_ID` bigint(20) NOT NULL,
                                   `START_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                   `END_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                   `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                   `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                   PRIMARY KEY (`ID`),
                                   KEY `idx_PipelineID_Type_GmtCreate_ID` (`PIPELINE_ID`,`TYPE`,`GMT_CREATE`,`ID`),
                                   KEY `idx_PipelineID_Type_EndTime_ID` (`PIPELINE_ID`,`TYPE`,`END_TIME`,`ID`),
                                   KEY `idx_GmtCreate_id` (`GMT_CREATE`,`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `USER` (
                        `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                        `USERNAME` varchar(20) NOT NULL,
                        `PASSWORD` varchar(20) NOT NULL,
                        `AUTHORIZETYPE` varchar(20) NOT NULL,
                        `DEPARTMENT` varchar(20) NOT NULL,
                        `REALNAME` varchar(20) NOT NULL,
                        `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                        `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                        PRIMARY KEY (`ID`),
                        UNIQUE KEY `USERUNIQUE` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE  `DATA_MATRIX` (
                                `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                `GROUP_KEY` varchar(200) DEFAULT NULL,
                                `MASTER` varchar(200) DEFAULT NULL,
                                `SLAVE` varchar(200) DEFAULT NULL,
                                `DESCRIPTION` varchar(200) DEFAULT NULL,
                                `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                `GMT_MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                PRIMARY KEY (`ID`),
                                KEY `GROUPKEY` (`GROUP_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `meta_history` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `gmt_create` datetime NOT NULL COMMENT '创建时间',
    `gmt_modified` datetime NOT NULL COMMENT '修改时间',
    `destination` varchar(128) DEFAULT NULL COMMENT '通道名称',
    `binlog_file` varchar(64) DEFAULT NULL COMMENT 'binlog文件名',
    `binlog_offest` bigint(20) DEFAULT NULL COMMENT 'binlog偏移量',
    `binlog_master_id` varchar(64) DEFAULT NULL COMMENT 'binlog节点id',
    `binlog_timestamp` bigint(20) DEFAULT NULL COMMENT 'binlog应用的时间戳',
    `use_schema` varchar(1024) DEFAULT NULL COMMENT '执行sql时对应的schema',
    `sql_schema` varchar(1024) DEFAULT NULL COMMENT '对应的schema',
    `sql_table` varchar(1024) DEFAULT NULL COMMENT '对应的table',
    `sql_text` longtext DEFAULT NULL COMMENT '执行的sql',
    `sql_type` varchar(256) DEFAULT NULL COMMENT 'sql类型',
    `extra` text DEFAULT NULL COMMENT '额外的扩展信息',
    PRIMARY KEY (`id`),
    UNIQUE KEY binlog_file_offest(`destination`,`binlog_master_id`,`binlog_file`,`binlog_offest`),
    KEY `destination` (`destination`),
    KEY `destination_timestamp` (`destination`,`binlog_timestamp`),
    KEY `gmt_modified` (`gmt_modified`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='表结构变化明细表';

CREATE TABLE IF NOT EXISTS `meta_snapshot` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `gmt_create` datetime NOT NULL COMMENT '创建时间',
    `gmt_modified` datetime NOT NULL COMMENT '修改时间',
    `destination` varchar(128) DEFAULT NULL COMMENT '通道名称',
    `binlog_file` varchar(64) DEFAULT NULL COMMENT 'binlog文件名',
    `binlog_offest` bigint(20) DEFAULT NULL COMMENT 'binlog偏移量',
    `binlog_master_id` varchar(64) DEFAULT NULL COMMENT 'binlog节点id',
    `binlog_timestamp` bigint(20) DEFAULT NULL COMMENT 'binlog应用的时间戳',
    `data` longtext DEFAULT NULL COMMENT '表结构数据',
    `extra` text DEFAULT NULL COMMENT '额外的扩展信息',
    PRIMARY KEY (`id`),
    UNIQUE KEY binlog_file_offest(`destination`,`binlog_master_id`,`binlog_file`,`binlog_offest`),
    KEY `destination` (`destination`),
    KEY `destination_timestamp` (`destination`,`binlog_timestamp`),
    KEY `gmt_modified` (`gmt_modified`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='表结构记录表快照表';


insert into USER(ID,USERNAME,PASSWORD,AUTHORIZETYPE,DEPARTMENT,REALNAME,GMT_CREATE,GMT_MODIFIED) values(null,'admin','801fc357a5a74743894a','ADMIN','admin','admin',now(),now());
insert into USER(ID,USERNAME,PASSWORD,AUTHORIZETYPE,DEPARTMENT,REALNAME,GMT_CREATE,GMT_MODIFIED) values(null,'guest','471e02a154a2121dc577','OPERATOR','guest','guest',now(),now());
