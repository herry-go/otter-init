USE `otter`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for DATA_MEDIA_SOURCE
-- ----------------------------
DROP TABLE IF EXISTS `DATA_MEDIA_SOURCE`;
CREATE TABLE `DATA_MEDIA_SOURCE` (
                                     `ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                     `NAME` varchar(200) NOT NULL,
                                     `TYPE` varchar(20) NOT NULL,
                                     `PROPERTIES` varchar(1000) NOT NULL,
                                     `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
                                     `GMT_MODIFIED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                                     PRIMARY KEY (`ID`),
                                     UNIQUE KEY `DATAMEDIASOURCEUNIQUE` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of DATA_MEDIA_SOURCE
-- ----------------------------
BEGIN;
INSERT INTO `otter`.`DATA_MEDIA_SOURCE`(`ID`, `NAME`, `TYPE`, `PROPERTIES`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (1, 'center-1(主中心)', 'MYSQL', '{\"driver\":\"com.mysql.jdbc.Driver\",\"encode\":\"UTF8\",\"id\":1,\"name\":\"center-1(主中心)\",\"password\":\"{master_idc_mysql_dbPassword}\",\"type\":\"MYSQL\",\"url\":\"jdbc:mysql://groupKey=master_idc\",\"username\":\"{master_idc_mysql_dbUsername}\"}', '2022-08-19 15:22:30', '2022-08-26 13:54:40');
INSERT INTO `otter`.`DATA_MEDIA_SOURCE`(`ID`, `NAME`, `TYPE`, `PROPERTIES`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES (2, 'center-2(从中心)', 'MYSQL', '{\"driver\":\"com.mysql.jdbc.Driver\",\"encode\":\"UTF8\",\"name\":\"center-2(从中心)\",\"password\":\"{slave_idc_mysql_dbPassword}\",\"type\":\"MYSQL\",\"url\":\"jdbc:mysql://groupKey=slave_idc\",\"username\":\"{slave_idc_mysql_dbUsername}\"}', '2022-08-26 13:57:06', '2022-08-26 13:57:06');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;