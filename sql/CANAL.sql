USE `otter`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for CANAL
-- ----------------------------
DROP TABLE IF EXISTS `CANAL`;
CREATE TABLE `CANAL` (
                         `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                         `NAME` varchar(200) DEFAULT NULL,
                         `DESCRIPTION` varchar(200) DEFAULT NULL,
                         `PARAMETERS` text DEFAULT NULL,
                         `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                         `GMT_MODIFIED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                         PRIMARY KEY (`ID`),
                         UNIQUE KEY `CANALUNIQUE` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of CANAL
-- ----------------------------
BEGIN;

INSERT INTO `otter`.`CANAL`(`ID`, `NAME`, `DESCRIPTION`, `PARAMETERS`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (1, 'center-1-1', NULL, '{\"connectionCharset\":\"UTF-8\",\"connectionCharsetNumber\":33,\"dataDir\":\"../conf\",\"dbAddresses\":[],\"dbPassword\":\"Udcp2022cs\",\"dbUsername\":\"uos\",\"ddlIsolation\":false,\"defaultConnectionTimeoutInSeconds\":30,\"detectingEnable\":false,\"detectingIntervalInSeconds\":5,\"detectingRetryTimes\":3,\"detectingSQL\":\"insert into retl.xdual values(1,now()) on duplicate key update x=now()\",\"detectingTimeoutThresholdInSeconds\":30,\"fallbackIntervalInSeconds\":60,\"filterTableError\":false,\"groupDbAddresses\":[[{\"dbAddress\":{\"address\":\"10.30.36.211\",\"port\":3306},\"type\":\"MYSQL\"}]],\"gtidEnable\":true,\"haMode\":\"MEDIA\",\"heartbeatHaEnable\":false,\"indexMode\":\"MEMORY_META_FAILBACK\",\"mediaGroup\":\"master_idc\",\"memoryStorageBufferMemUnit\":1024,\"memoryStorageBufferSize\":32768,\"memoryStorageRawEntry\":true,\"metaFileFlushPeriod\":1000,\"metaMode\":\"MIXED\",\"parallel\":false,\"port\":11111,\"positions\":[\"{\\\"journalName\\\":\\\"mariadb-bin.000027\\\",\\\"position\\\":5895866,\\\"timestamp\\\":0}\"],\"receiveBufferSize\":16384,\"runMode\":\"EMBEDDED\",\"sendBufferSize\":16384,\"slaveId\":10001,\"sourcingType\":\"MYSQL\",\"storageBatchMode\":\"MEMSIZE\",\"storageMode\":\"MEMORY\",\"storageScavengeMode\":\"ON_ACK\",\"transactionSize\":1024,\"tsdbEnable\":true,\"tsdbSnapshotExpire\":360,\"tsdbSnapshotInterval\":24,\"zkClusterId\":1,\"zkClusters\":[]}', '2022-08-19 15:56:29', '2022-08-31 19:55:41');
INSERT INTO `otter`.`CANAL`(`ID`, `NAME`, `DESCRIPTION`, `PARAMETERS`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (2, 'center-2-1', NULL, '{\"connectionCharset\":\"UTF-8\",\"connectionCharsetNumber\":33,\"dataDir\":\"../conf\",\"dbAddresses\":[],\"dbPassword\":\"Udcp2022cs\",\"dbUsername\":\"uos\",\"ddlIsolation\":false,\"defaultConnectionTimeoutInSeconds\":30,\"detectingEnable\":false,\"detectingIntervalInSeconds\":5,\"detectingRetryTimes\":3,\"detectingSQL\":\"insert into retl.xdual values(1,now()) on duplicate key update x=now()\",\"detectingTimeoutThresholdInSeconds\":30,\"fallbackIntervalInSeconds\":60,\"filterTableError\":false,\"groupDbAddresses\":[[{\"dbAddress\":{\"address\":\"10.20.15.211\",\"port\":3306},\"type\":\"MYSQL\"}]],\"gtidEnable\":false,\"haMode\":\"MEDIA\",\"heartbeatHaEnable\":false,\"indexMode\":\"MEMORY_META_FAILBACK\",\"mediaGroup\":\"slave_idc\",\"memoryStorageBufferMemUnit\":1024,\"memoryStorageBufferSize\":32768,\"memoryStorageRawEntry\":true,\"metaFileFlushPeriod\":1000,\"metaMode\":\"MIXED\",\"parallel\":false,\"port\":11111,\"positions\":[\"{\\\"journalName\\\":\\\"mariadb-bin.000006\\\",\\\"position\\\":455880918,\\\"timestamp\\\":0}\"],\"receiveBufferSize\":16384,\"runMode\":\"EMBEDDED\",\"sendBufferSize\":16384,\"slaveId\":10002,\"sourcingType\":\"MYSQL\",\"storageBatchMode\":\"MEMSIZE\",\"storageMode\":\"MEMORY\",\"storageScavengeMode\":\"ON_ACK\",\"transactionSize\":1024,\"tsdbEnable\":false,\"tsdbSnapshotExpire\":360,\"tsdbSnapshotInterval\":24,\"zkClusterId\":1,\"zkClusters\":[]}', '2022-08-19 16:05:07', '2022-08-19 16:05:26');
-- "{\"journalName\":\"mariadb-bin.000008\",\"position\":8135206,\"timestamp\":1661412409}"
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;