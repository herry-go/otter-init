USE `otter`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for CHANNEL
-- ----------------------------
DROP TABLE IF EXISTS `CHANNEL`;
CREATE TABLE `CHANNEL` (
                           `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                           `NAME` varchar(200) NOT NULL,
                           `DESCRIPTION` varchar(200) DEFAULT NULL,
                           `PARAMETERS` text DEFAULT NULL,
                           `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                           `GMT_MODIFIED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                           PRIMARY KEY (`ID`),
                           UNIQUE KEY `CHANNELUNIQUE` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of CHANNEL
-- ----------------------------
BEGIN;
INSERT INTO `otter`.`CHANNEL`(`ID`, `NAME`, `DESCRIPTION`, `PARAMETERS`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (2, '从中心<=>主中心', '从中心主中心双A同步', '{\"channelId\":2,\"enableRemedy\":true,\"remedyAlgorithm\":\"LOOPBACK\",\"remedyDelayThresoldForMedia\":60,\"syncConsistency\":\"BASE\",\"syncMode\":\"FIELD\"}', '2022-08-26 15:44:03', '2022-08-30 20:05:30');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;