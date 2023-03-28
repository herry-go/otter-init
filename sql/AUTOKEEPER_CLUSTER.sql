USE `otter`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for AUTOKEEPER_CLUSTER
-- ----------------------------
DROP TABLE IF EXISTS `AUTOKEEPER_CLUSTER`;
CREATE TABLE `AUTOKEEPER_CLUSTER` (
                                      `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                      `CLUSTER_NAME` varchar(200) NOT NULL,
                                      `SERVER_LIST` varchar(1024) NOT NULL,
                                      `DESCRIPTION` varchar(200) DEFAULT NULL,
                                      `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                      `GMT_MODIFIED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                                      PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of AUTOKEEPER_CLUSTER
-- ----------------------------
BEGIN;
INSERT INTO `otter`.`AUTOKEEPER_CLUSTER`(`ID`, `CLUSTER_NAME`, `SERVER_LIST`, `DESCRIPTION`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (1, 'zk1', '[\"zk-svc:2181\"]', NULL, '2022-08-19 15:08:50', '2022-08-19 15:08:50');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;