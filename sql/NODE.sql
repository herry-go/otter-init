USE `otter`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for NODE
-- ----------------------------
DROP TABLE IF EXISTS `NODE`;
CREATE TABLE `NODE` (
                        `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                        `NAME` varchar(200) NOT NULL,
                        `IP` varchar(200) NOT NULL,
                        `PORT` bigint(20) NOT NULL,
                        `DESCRIPTION` varchar(200) DEFAULT NULL,
                        `PARAMETERS` text DEFAULT NULL,
                        `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                        `GMT_MODIFIED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                        PRIMARY KEY (`ID`),
                        UNIQUE KEY `NODEUNIQUE` (`NAME`,`IP`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NODE
-- ----------------------------
BEGIN;
INSERT INTO `otter`.`NODE`(`ID`, `NAME`, `IP`, `PORT`, `DESCRIPTION`, `PARAMETERS`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (213, '10.30.36.212', '10.30.36.212', 2088, NULL, '{\"downloadPort\":2089,\"externalIp\":\"10.30.36.212\",\"mbeanPort\":2090,\"useExternalIp\":true,\"zkCluster\":{\"clusterName\":\"zk1\",\"gmtCreate\":1660921730000,\"gmtModified\":1660921730000,\"id\":1,\"serverList\":[\"zk-svc:2181\"]}}', '2022-08-19 15:08:50', '2022-08-26 17:33:57');
INSERT INTO `otter`.`NODE`(`ID`, `NAME`, `IP`, `PORT`, `DESCRIPTION`, `PARAMETERS`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (214, '10.30.36.213', '10.30.36.213', 2088, NULL, '{\"downloadPort\":2089,\"externalIp\":\"10.30.36.213\",\"mbeanPort\":2090,\"useExternalIp\":true,\"zkCluster\":{\"clusterName\":\"zk1\",\"gmtCreate\":1660921730000,\"gmtModified\":1660921730000,\"id\":1,\"serverList\":[\"zk-svc:2181\"]}}', '2022-08-19 15:08:50', '2022-08-26 17:34:05');
INSERT INTO `otter`.`NODE`(`ID`, `NAME`, `IP`, `PORT`, `DESCRIPTION`, `PARAMETERS`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (215, '10.20.15.212', '10.20.15.212', 2088, NULL, '{\"downloadPort\":2089,\"externalIp\":\"10.20.15.212\",\"mbeanPort\":2090,\"useExternalIp\":true,\"zkCluster\":{\"clusterName\":\"zk1\",\"gmtCreate\":1660921730000,\"gmtModified\":1660921730000,\"id\":1,\"serverList\":[\"zk-svc:2181\"]}}', '2022-08-19 15:08:50', '2022-08-26 17:41:25');
INSERT INTO `otter`.`NODE`(`ID`, `NAME`, `IP`, `PORT`, `DESCRIPTION`, `PARAMETERS`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (216, '10.20.15.213', '10.20.15.213', 2088, NULL, '{\"downloadPort\":2089,\"externalIp\":\"10.20.15.213\",\"mbeanPort\":2090,\"useExternalIp\":true,\"zkCluster\":{\"clusterName\":\"zk1\",\"gmtCreate\":1660921730000,\"gmtModified\":1660921730000,\"id\":1,\"serverList\":[\"zk-svc:2181\"]}}', '2022-08-19 15:08:50', '2022-08-26 17:33:38');


COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
