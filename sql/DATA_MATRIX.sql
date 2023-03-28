USE `otter`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for DATA_MATRIX
-- ----------------------------
DROP TABLE IF EXISTS `DATA_MATRIX`;
CREATE TABLE `DATA_MATRIX`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `GROUP_KEY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MASTER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SLAVE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GMT_CREATE` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `GMT_MODIFIED` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `GROUPKEY`(`GROUP_KEY`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of DATA_MATRIX
-- ----------------------------
INSERT INTO `DATA_MATRIX` VALUES (1, 'master_idc', '10.30.36.211:3306', '10.30.36.212:3306', '主中心mysql配置', '2022-12-01 09:22:45', '2022-12-01 18:31:22');
INSERT INTO `DATA_MATRIX` VALUES (2, 'slave_idc', '10.20.15.211:3306', '10.20.15.212:3306', '从中心mysql配置', '2022-12-01 09:24:39', '2022-12-01 09:51:24');

SET FOREIGN_KEY_CHECKS = 1;
