/*
 Navicat Premium Data Transfer

 Source Server         : 10.30.36.211(主中心-2)
 Source Server Type    : MySQL
 Source Server Version : 100328
 Source Host           : 10.30.36.211:3306
 Source Schema         : otter

 Target Server Type    : MySQL
 Target Server Version : 100328
 File Encoding         : 65001

 Date: 24/11/2022 13:29:15
*/
USE `otter`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for SYSTEM_PARAMETER
-- ----------------------------
DROP TABLE IF EXISTS `SYSTEM_PARAMETER`;
CREATE TABLE `SYSTEM_PARAMETER` (
  `ID` bigint(20) unsigned NOT NULL,
  `VALUE` text DEFAULT NULL,
  `GMT_CREATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `GMT_MODIFIED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYSTEM_PARAMETER
-- ----------------------------
BEGIN;
INSERT INTO `SYSTEM_PARAMETER` VALUES (1, '{\"alarmReceiver\":{},\"alarmReceiverFormat\":\"\",\"defaultAlarmReceiveKey\":\"otterteam\",\"defaultAlarmReceiver\":\"huyunzhi@uniontech.com\",\"defaultAlarmReceiverFormat\":\"otterteam=huyunzhi@uniontech.com\",\"hzArandaCluster\":\"\",\"hzStoreClusters\":[],\"hzZkClusters\":[],\"retriever\":\"ARIA2C\",\"systemBufferTable\":\"retl_buffer\",\"systemDualTable\":\"xdual\",\"systemMarkTable\":\"retl_mark\",\"systemMarkTableColumn\":\"channel_id\",\"systemMarkTableInfo\":\"channel_info\",\"systemSchema\":\"retl\",\"usArandaCluster\":\"\",\"usStoreClusters\":[],\"usZkClusters\":[]}', '2022-11-16 02:11:31', '2022-11-16 02:11:31');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
