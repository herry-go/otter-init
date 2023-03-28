USE `otter`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `PIPELINE`;
CREATE TABLE `PIPELINE` (
                            `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                            `NAME` varchar(200) NOT NULL,
                            `DESCRIPTION` varchar(200) DEFAULT NULL,
                            `PARAMETERS` text DEFAULT NULL,
                            `CHANNEL_ID` bigint(20) NOT NULL,
                            `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                            `GMT_MODIFIED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                            PRIMARY KEY (`ID`),
                            UNIQUE KEY `PIPELINEUNIQUE` (`NAME`,`CHANNEL_ID`),
                            KEY `idx_ChannelID` (`CHANNEL_ID`,`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of PIPELINE
-- ----------------------------
BEGIN;
INSERT INTO `otter`.`PIPELINE`(`ID`, `NAME`, `DESCRIPTION`, `PARAMETERS`, `CHANNEL_ID`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (3, '主中心=>从中心', NULL, '{\"arbitrateMode\":\"AUTOMATIC\",\"batchTimeout\":-1,\"ddlSync\":true,\"destinationName\":\"center-1-1\",\"dryRun\":false,\"dumpEvent\":true,\"dumpSelector\":true,\"dumpSelectorDetail\":true,\"enableCompatibleMissColumn\":true,\"extractPoolSize\":10,\"fileDetect\":false,\"fileLoadPoolSize\":15,\"home\":true,\"lbAlgorithm\":\"Stick\",\"loadPoolSize\":15,\"mainstemBatchsize\":6000,\"parallelism\":5,\"pipeChooseType\":\"AUTOMATIC\",\"selectorMode\":\"Canal\",\"skipDdlException\":true,\"skipFreedom\":false,\"skipLoadException\":true,\"skipNoRow\":true,\"skipSelectException\":true,\"useBatch\":true,\"useExternalIp\":false,\"useFileEncrypt\":false,\"useLocalFileMutliThread\":false,\"useTableTransform\":true}', 2, '2022-08-26 16:33:40', '2022-08-31 16:39:07');
INSERT INTO `otter`.`PIPELINE`(`ID`, `NAME`, `DESCRIPTION`, `PARAMETERS`, `CHANNEL_ID`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (4, '从中心=>主中心', NULL, '{\"arbitrateMode\":\"AUTOMATIC\",\"batchTimeout\":-1,\"ddlSync\":false,\"destinationName\":\"center-2-1\",\"dryRun\":false,\"dumpEvent\":true,\"dumpSelector\":true,\"dumpSelectorDetail\":true,\"enableCompatibleMissColumn\":true,\"extractPoolSize\":10,\"fileDetect\":false,\"fileLoadPoolSize\":15,\"home\":false,\"lbAlgorithm\":\"Stick\",\"loadPoolSize\":15,\"mainstemBatchsize\":6000,\"parallelism\":5,\"pipeChooseType\":\"AUTOMATIC\",\"selectorMode\":\"Canal\",\"skipDdlException\":true,\"skipFreedom\":false,\"skipLoadException\":true,\"skipNoRow\":true,\"skipSelectException\":true,\"useBatch\":true,\"useExternalIp\":false,\"useFileEncrypt\":false,\"useLocalFileMutliThread\":false,\"useTableTransform\":false}', 2, '2022-08-26 16:34:49', '2022-08-31 16:39:29');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;