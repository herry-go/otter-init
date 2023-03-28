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
INSERT INTO `otter`.`NODE`(`ID`, `NAME`, `IP`, `PORT`, `DESCRIPTION`, `PARAMETERS`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES ({master_idc_node1_id}, '{master_idc_node1}', '{master_idc_node1}', 2088, NULL, '{\"downloadPort\":2089,\"externalIp\":\"{master_idc_node1_external_ip}\",\"mbeanPort\":2090,\"useExternalIp\":true,\"zkCluster\":{\"clusterName\":\"{zk_cluster_name}\",\"gmtCreate\":1660921730000,\"gmtModified\":1660921730000,\"id\":1,\"serverList\":[\"{zk_cluster_address}\"]}}', '2022-08-19 15:08:50', '2022-08-26 17:33:57');
INSERT INTO `otter`.`NODE`(`ID`, `NAME`, `IP`, `PORT`, `DESCRIPTION`, `PARAMETERS`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES ({master_idc_node2_id}, '{master_idc_node2}', '{master_idc_node2}', 2088, NULL, '{\"downloadPort\":2089,\"externalIp\":\"{master_idc_node2_external_ip}\",\"mbeanPort\":2090,\"useExternalIp\":true,\"zkCluster\":{\"clusterName\":\"{zk_cluster_name}\",\"gmtCreate\":1660921730000,\"gmtModified\":1660921730000,\"id\":1,\"serverList\":[\"{zk_cluster_address}\"]}}', '2022-08-19 15:08:50', '2022-08-26 17:34:05');
INSERT INTO `otter`.`NODE`(`ID`, `NAME`, `IP`, `PORT`, `DESCRIPTION`, `PARAMETERS`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES ({slave_idc_node1_id}, '{slave_idc_node1}', '{slave_idc_node1}', 2088, NULL, '{\"downloadPort\":2089,\"externalIp\":\"{slave_idc_node1_external_ip}\",\"mbeanPort\":2090,\"useExternalIp\":true,\"zkCluster\":{\"clusterName\":\"{zk_cluster_name}\",\"gmtCreate\":1660921730000,\"gmtModified\":1660921730000,\"id\":1,\"serverList\":[\"{zk_cluster_address}\"]}}', '2022-08-19 15:08:50', '2022-08-26 17:41:25');
INSERT INTO `otter`.`NODE`(`ID`, `NAME`, `IP`, `PORT`, `DESCRIPTION`, `PARAMETERS`, `GMT_CREATE`, `GMT_MODIFIED`) VALUES ({slave_idc_node2_id}, '{slave_idc_node2}', '{slave_idc_node2}', 2088, NULL, '{\"downloadPort\":2089,\"externalIp\":\"{slave_idc_node2_external_ip}\",\"mbeanPort\":2090,\"useExternalIp\":true,\"zkCluster\":{\"clusterName\":\"{zk_cluster_name}\",\"gmtCreate\":1660921730000,\"gmtModified\":1660921730000,\"id\":1,\"serverList\":[\"{zk_cluster_address}\"]}}', '2022-08-19 15:08:50', '2022-08-26 17:33:38');


COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
