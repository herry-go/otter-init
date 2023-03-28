USE `otter`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for PIPELINE_NODE_RELATION
-- ----------------------------
DROP TABLE IF EXISTS `PIPELINE_NODE_RELATION`;
CREATE TABLE `PIPELINE_NODE_RELATION` (
                                          `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                          `NODE_ID` bigint(20) NOT NULL,
                                          `PIPELINE_ID` bigint(20) NOT NULL,
                                          `LOCATION` varchar(20) NOT NULL,
                                          `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                          `GMT_MODIFIED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                                          PRIMARY KEY (`ID`),
                                          KEY `idx_PipelineID` (`PIPELINE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of PIPELINE_NODE_RELATION
-- ----------------------------
BEGIN;
INSERT INTO `otter`.`PIPELINE_NODE_RELATION`(`ID`, `NODE_ID`, `PIPELINE_ID`, `LOCATION`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (82, 216, 4, 'SELECT', '2022-09-15 19:22:17', '2022-09-15 19:22:17');
INSERT INTO `otter`.`PIPELINE_NODE_RELATION`(`ID`, `NODE_ID`, `PIPELINE_ID`, `LOCATION`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (83, 216, 4, 'EXTRACT', '2022-09-15 19:22:17', '2022-09-15 19:22:17');
INSERT INTO `otter`.`PIPELINE_NODE_RELATION`(`ID`, `NODE_ID`, `PIPELINE_ID`, `LOCATION`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (84, 213, 4, 'LOAD', '2022-09-15 19:22:17', '2022-09-15 19:22:17');
INSERT INTO `otter`.`PIPELINE_NODE_RELATION`(`ID`, `NODE_ID`, `PIPELINE_ID`, `LOCATION`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (85, 213, 3, 'SELECT', '2022-09-15 19:22:28', '2022-09-15 19:22:28');
INSERT INTO `otter`.`PIPELINE_NODE_RELATION`(`ID`, `NODE_ID`, `PIPELINE_ID`, `LOCATION`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (86, 213, 3, 'EXTRACT', '2022-09-15 19:22:28', '2022-09-15 19:22:28');
INSERT INTO `otter`.`PIPELINE_NODE_RELATION`(`ID`, `NODE_ID`, `PIPELINE_ID`, `LOCATION`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (87, 215, 3, 'LOAD', '2022-09-15 19:22:29', '2022-09-15 19:22:29');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;