/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80037
Source Host           : localhost:3306
Source Database       : db_pss

Target Server Type    : MYSQL
Target Server Version : 80037
File Encoding         : 65001

Date: 2025-11-07 12:39:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gen_table`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'pill_factory', '生产厂家信息', null, null, 'PillFactory', 'crud', 'com.ruoyi.pill', 'pill', 'factory', '生产厂家信息', 'lsl', '0', '/', '{}', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49', null);
INSERT INTO `gen_table` VALUES ('2', 'pill_drug', '药品购买', null, null, 'PillDrugClient', 'crud', 'com.ruoyi.pill', 'pill', 'drugClient', '药品购买', 'lsl', '0', '/', '{\"parentMenuId\":\"2018\"}', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:54', null);
INSERT INTO `gen_table` VALUES ('3', 'pill_order', '我的订单', null, null, 'PillOrder', 'crud', 'com.ruoyi.pill', 'pill', 'order', '我的订单', 'lsl', '0', '/', '{\"parentMenuId\":\"2018\"}', 'admin', '2025-11-01 17:12:31', '', '2025-11-06 14:51:16', '我的订单功能');

-- ----------------------------
-- Table structure for `gen_table_column`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'factory_id', '厂家ID', 'bigint', 'Long', 'factoryId', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49');
INSERT INTO `gen_table_column` VALUES ('2', '1', 'factory_name', '厂家名称', 'varchar(50)', 'String', 'factoryName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49');
INSERT INTO `gen_table_column` VALUES ('3', '1', 'factory_code', '厂家编码', 'varchar(50)', 'String', 'factoryCode', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49');
INSERT INTO `gen_table_column` VALUES ('4', '1', 'contact', '联系人', 'varchar(30)', 'String', 'contact', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49');
INSERT INTO `gen_table_column` VALUES ('5', '1', 'phone', '电话', 'varchar(30)', 'String', 'phone', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49');
INSERT INTO `gen_table_column` VALUES ('6', '1', 'keyword', '关键字', 'varchar(20)', 'String', 'keyword', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49');
INSERT INTO `gen_table_column` VALUES ('7', '1', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', '', '7', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49');
INSERT INTO `gen_table_column` VALUES ('8', '1', 'create_by', '创建者', 'varchar(50)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '8', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49');
INSERT INTO `gen_table_column` VALUES ('9', '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '9', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49');
INSERT INTO `gen_table_column` VALUES ('10', '1', 'update_by', '更新者', 'varchar(50)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '10', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49');
INSERT INTO `gen_table_column` VALUES ('11', '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '11', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49');
INSERT INTO `gen_table_column` VALUES ('12', '1', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '12', 'admin', '2025-10-31 19:37:31', '', '2025-11-02 17:32:49');
INSERT INTO `gen_table_column` VALUES ('13', '2', 'drug_id', '药品ID', 'bigint', 'Long', 'drugId', '1', '1', null, '0', null, '1', null, 'EQ', 'input', '', '1', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:54');
INSERT INTO `gen_table_column` VALUES ('14', '2', 'drug_name', '药品名称', 'varchar(50)', 'String', 'drugName', '0', '0', '0', '0', '0', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:54');
INSERT INTO `gen_table_column` VALUES ('15', '2', 'drug_code', '药品编码', 'varchar(50)', 'String', 'drugCode', '0', '0', null, '0', '0', '0', '0', 'EQ', 'input', '', '3', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:54');
INSERT INTO `gen_table_column` VALUES ('16', '2', 'factory_id', '生产厂家', 'bigint', 'Long', 'factoryId', '0', '0', null, '0', '0', '1', '1', 'EQ', 'input', '', '4', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:54');
INSERT INTO `gen_table_column` VALUES ('17', '2', 'drug_type', '药品类型', 'char(1)', 'String', 'drugType', '0', '0', null, '0', '0', '0', '0', 'EQ', 'select', 'pill_drug_dt', '5', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:54');
INSERT INTO `gen_table_column` VALUES ('18', '2', 'prescription_type', '处方类型', 'char(1)', 'String', 'prescriptionType', '0', '0', null, '0', '0', '0', '0', 'EQ', 'select', 'pull_drug_pt', '6', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:54');
INSERT INTO `gen_table_column` VALUES ('19', '2', 'unit', '单位', 'varchar(10)', 'String', 'unit', '0', '0', null, '0', '0', '0', '0', 'EQ', 'input', '', '7', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:54');
INSERT INTO `gen_table_column` VALUES ('20', '2', 'price', '价格', 'int', 'Long', 'price', '0', '0', null, '0', '0', '1', '0', 'EQ', 'input', '', '8', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:54');
INSERT INTO `gen_table_column` VALUES ('21', '2', 'num', '库存量', 'int', 'Long', 'num', '0', '0', null, '0', '0', '1', '0', 'EQ', 'input', '', '9', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:54');
INSERT INTO `gen_table_column` VALUES ('22', '2', 'warn_value', '预警值', 'int', 'Long', 'warnValue', '0', '0', null, '0', '0', '0', '0', 'EQ', 'input', '', '10', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:54');
INSERT INTO `gen_table_column` VALUES ('23', '2', 'conversion', '换算量', 'int', 'Long', 'conversion', '0', '0', null, '0', '0', '0', '0', 'EQ', 'input', '', '11', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:54');
INSERT INTO `gen_table_column` VALUES ('24', '2', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', null, '0', '0', '0', '0', 'EQ', 'radio', 'sys_normal_disable', '12', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:55');
INSERT INTO `gen_table_column` VALUES ('25', '2', 'create_by', '创建者', 'varchar(50)', 'String', 'createBy', '0', '0', null, '0', null, null, null, 'EQ', 'input', '', '13', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:55');
INSERT INTO `gen_table_column` VALUES ('26', '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '0', null, null, null, 'EQ', 'datetime', '', '14', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:55');
INSERT INTO `gen_table_column` VALUES ('27', '2', 'update_by', '更新者', 'varchar(50)', 'String', 'updateBy', '0', '0', null, '0', '0', null, null, 'EQ', 'input', '', '15', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:55');
INSERT INTO `gen_table_column` VALUES ('28', '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '0', '0', null, null, 'EQ', 'datetime', '', '16', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:55');
INSERT INTO `gen_table_column` VALUES ('29', '2', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', null, '0', '0', '0', null, 'EQ', 'textarea', '', '17', 'admin', '2025-10-31 21:04:10', '', '2025-11-01 19:34:55');
INSERT INTO `gen_table_column` VALUES ('30', '3', 'order_id', '订单ID', 'bigint', 'Long', 'orderId', '1', '1', null, '0', null, '1', '0', 'EQ', 'input', '', '1', 'admin', '2025-11-01 17:12:31', '', '2025-11-06 14:51:16');
INSERT INTO `gen_table_column` VALUES ('31', '3', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '2', 'admin', '2025-11-01 17:12:31', '', '2025-11-06 14:51:16');
INSERT INTO `gen_table_column` VALUES ('32', '3', 'drug_id', '药品ID', 'bigint', 'Long', 'drugId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '3', 'admin', '2025-11-01 17:12:31', '', '2025-11-06 14:51:16');
INSERT INTO `gen_table_column` VALUES ('33', '3', 'quantity', '购买数量', 'int', 'Long', 'quantity', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', '4', 'admin', '2025-11-01 17:12:31', '', '2025-11-06 14:51:16');
INSERT INTO `gen_table_column` VALUES ('34', '3', 'total_price', '总金额', 'decimal(10,2)', 'BigDecimal', 'totalPrice', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', '5', 'admin', '2025-11-01 17:12:31', '', '2025-11-06 14:51:16');
INSERT INTO `gen_table_column` VALUES ('35', '3', 'create_time', '下单时间', 'datetime', 'Date', 'createTime', '0', '0', null, '0', null, '1', null, 'EQ', 'datetime', '', '6', 'admin', '2025-11-01 17:12:31', '', '2025-11-06 14:51:16');
INSERT INTO `gen_table_column` VALUES ('36', '3', 'status', '订单状态:', 'varchar(20)', 'String', 'status', '0', '0', '0', '0', '1', '1', '1', 'EQ', 'radio', 'pill_order_status', '7', '', '2025-11-06 14:10:58', '', '2025-11-06 14:51:16');
INSERT INTO `gen_table_column` VALUES ('37', '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '0', '0', null, null, 'EQ', 'datetime', '', '8', '', '2025-11-06 14:10:58', '', '2025-11-06 14:51:16');

-- ----------------------------
-- Table structure for `pill_drug`
-- ----------------------------
DROP TABLE IF EXISTS `pill_drug`;
CREATE TABLE `pill_drug` (
  `drug_id` bigint NOT NULL AUTO_INCREMENT COMMENT '药品ID',
  `drug_name` varchar(50) DEFAULT NULL COMMENT '药品名称',
  `drug_code` varchar(50) DEFAULT NULL COMMENT '药品编码',
  `factory_id` bigint DEFAULT NULL COMMENT '生产厂家',
  `drug_type` char(1) DEFAULT NULL COMMENT '药品类型',
  `prescription_type` char(1) DEFAULT NULL COMMENT '处方类型',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `price` int DEFAULT NULL COMMENT '价格',
  `num` int DEFAULT NULL COMMENT '库存量',
  `warn_value` int DEFAULT NULL COMMENT '预警值',
  `conversion` int DEFAULT NULL COMMENT '换算量',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3 COMMENT='药品信息';

-- ----------------------------
-- Records of pill_drug
-- ----------------------------
INSERT INTO `pill_drug` VALUES ('101', '十全大补丸', 'dbw0001', '101', '0', '0', '瓶', '201', '77', '50', '1', '0', 'admin', '2022-08-27 16:03:29', null, '2025-11-01 01:16:42', null);
INSERT INTO `pill_drug` VALUES ('102', '阿莫西林', 'zcy0002', '102', '1', '1', '盒', '15', '289', '50', '1', '0', 'admin', '2022-09-15 16:03:29', null, null, null);
INSERT INTO `pill_drug` VALUES ('103', '板蓝根', 'dbw0003', '104', '1', '1', '盒', '30', '5', '50', '1', '0', null, '2025-11-01 22:12:31', null, null, '治感冒');
INSERT INTO `pill_drug` VALUES ('104', '人中黄', 'dbw004', '101', '0', '0', '克', '20', '0', '50', '1', '0', null, '2025-11-02 01:16:49', null, '2025-11-02 15:56:48', '钟繇');

-- ----------------------------
-- Table structure for `pill_factory`
-- ----------------------------
DROP TABLE IF EXISTS `pill_factory`;
CREATE TABLE `pill_factory` (
  `factory_id` bigint NOT NULL AUTO_INCREMENT COMMENT '厂家ID',
  `factory_name` varchar(50) DEFAULT NULL COMMENT '厂家名称',
  `factory_code` varchar(50) DEFAULT NULL COMMENT '厂家编码',
  `contact` varchar(30) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(30) DEFAULT NULL COMMENT '电话',
  `keyword` varchar(20) DEFAULT NULL COMMENT '关键字',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`factory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COMMENT='生产厂家信息';

-- ----------------------------
-- Records of pill_factory
-- ----------------------------
INSERT INTO `pill_factory` VALUES ('101', '云南白药集团股份有限公司', '000011', 'admin', '023-88887777', 'ynby', '0', 'admin', '2025-09-26 16:15:29', null, null, null);
INSERT INTO `pill_factory` VALUES ('102', '哈药集团股份有限公司', '000022', 'admin', '023-88887777', 'hyjt', '0', 'admin', '2025-09-26 16:15:29', 'admin', '2025-09-26 20:34:01', null);
INSERT INTO `pill_factory` VALUES ('103', '太极集团有限公司', '000033', 'admin', '023-88887777', 'tjjt', '0', 'admin', '2025-09-26 16:15:29', null, null, null);
INSERT INTO `pill_factory` VALUES ('104', '上海医药集团有限公司', '000033', 'admin', '023-99998888', 'shyy', '1', 'admin', '2022-09-26 20:12:57', null, '2025-11-03 20:41:00', null);
INSERT INTO `pill_factory` VALUES ('105', '腾讯无敌药房', '546218', '马化腾', '110', 'txmht', '0', null, '2025-10-31 20:25:19', null, null, null);

-- ----------------------------
-- Table structure for `pill_order`
-- ----------------------------
DROP TABLE IF EXISTS `pill_order`;
CREATE TABLE `pill_order` (
  `order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `drug_id` bigint NOT NULL COMMENT '药品ID',
  `quantity` int NOT NULL DEFAULT '1' COMMENT '购买数量',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `status` varchar(20) NOT NULL DEFAULT 'PAID' COMMENT '订单状态: PAID-已支付, COMPLETED-已完成, CANCELLED-已取消',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '状态更新时间',
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `drug_id` (`drug_id`),
  CONSTRAINT `pill_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `pill_order_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `pill_drug` (`drug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='药品订单表';

-- ----------------------------
-- Records of pill_order
-- ----------------------------
INSERT INTO `pill_order` VALUES ('1', '1', '101', '2', '402.00', '2025-11-01 10:00:00', 'CANCELLED', '2025-11-06 15:51:49');
INSERT INTO `pill_order` VALUES ('2', '2', '102', '5', '75.00', '2025-11-01 10:30:00', 'COMPLETED', '2025-11-06 15:58:31');
INSERT INTO `pill_order` VALUES ('3', '1', '102', '3', '45.00', '2025-11-01 11:00:00', 'COMPLETED', '2025-11-06 15:59:18');
INSERT INTO `pill_order` VALUES ('4', '2', '101', '1', '201.00', '2025-11-01 11:30:00', 'COMPLETED', '2025-11-06 15:59:21');
INSERT INTO `pill_order` VALUES ('5', '1', '101', '1', '201.00', '2025-11-01 21:18:05', 'COMPLETED', '2025-11-06 15:59:23');
INSERT INTO `pill_order` VALUES ('6', '1', '102', '1', '15.00', '2025-11-01 21:32:25', 'COMPLETED', '2025-11-06 15:59:26');
INSERT INTO `pill_order` VALUES ('7', '1', '101', '1', '201.00', '2025-11-01 21:32:32', 'COMPLETED', '2025-11-06 15:59:27');
INSERT INTO `pill_order` VALUES ('8', '1', '101', '2', '402.00', '2025-11-01 21:33:05', 'COMPLETED', '2025-11-06 15:59:29');
INSERT INTO `pill_order` VALUES ('9', '2', '103', '1', '30.00', '2025-11-01 22:20:16', 'CANCELLED', '2025-11-06 15:59:00');
INSERT INTO `pill_order` VALUES ('10', '1', '103', '1', '30.00', '2025-11-01 22:22:43', 'COMPLETED', '2025-11-06 15:59:31');
INSERT INTO `pill_order` VALUES ('11', '1', '101', '1', '201.00', '2025-11-02 00:55:48', 'COMPLETED', '2025-11-06 15:59:35');
INSERT INTO `pill_order` VALUES ('12', '1', '104', '1', '20.00', '2025-11-02 01:17:27', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('13', '2', '102', '1', '15.00', '2025-11-02 16:09:29', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('14', '1', '104', '1', '20.00', '2025-11-02 20:17:23', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('15', '1', '102', '3', '45.00', '2025-11-02 20:20:53', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('16', '100', '101', '5', '1005.00', '2025-11-03 09:57:27', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('17', '100', '102', '1', '15.00', '2025-11-03 09:57:55', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('18', '1', '101', '1', '201.00', '2025-11-03 19:19:04', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('19', '2', '103', '192', '5760.00', '2025-11-04 20:54:58', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('20', '2', '101', '2', '402.00', '2025-11-04 22:57:13', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('21', '2', '101', '1', '201.00', '2025-11-04 23:05:24', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('22', '2', '101', '1', '201.00', '2025-11-05 14:18:21', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('23', '2', '103', '1', '30.00', '2025-11-05 14:18:39', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('24', '2', '101', '4', '804.00', '2025-11-05 23:11:03', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('25', '2', '102', '4', '60.00', '2025-11-05 23:20:04', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('26', '2', '102', '1', '15.00', '2025-11-06 00:57:08', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('27', '2', '101', '3', '603.00', '2025-11-06 08:19:09', 'PAID', '2025-11-06 12:54:16');
INSERT INTO `pill_order` VALUES ('28', '2', '101', '1', '201.00', '2025-11-06 15:05:31', 'PAID', '2025-11-06 15:05:30');

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-10-31 19:18:09', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-10-31 19:18:09', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-10-31 19:18:09', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-10-31 19:18:09', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2025-10-31 19:18:09', 'admin', '2025-11-03 19:48:02', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('6', '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-10-31 19:18:09', '', null, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-10-31 19:18:09', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-10-31 19:18:09', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-10-31 19:18:09', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-10-31 19:18:09', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-10-31 19:18:09', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-10-31 19:18:09', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-10-31 19:18:09', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-10-31 19:18:09', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-10-31 19:18:09', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-10-31 19:18:09', '', null);

-- ----------------------------
-- Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-10-31 19:18:09', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-10-31 19:18:09', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-10-31 19:18:09', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-10-31 19:18:09', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-10-31 19:18:09', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-10-31 19:18:09', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-10-31 19:18:09', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-10-31 19:18:09', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-10-31 19:18:09', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '1', '中草药', '0', 'pill_drug_dt', null, 'default', 'N', '0', 'admin', '2025-10-31 20:52:41', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('101', '2', '西药', '1', 'pill_drug_dt', null, 'default', 'N', '0', 'admin', '2025-10-31 20:53:08', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('102', '1', '中药处方', '0', 'pill_drug_pt', null, 'default', 'N', '0', 'admin', '2025-10-31 20:54:37', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('103', '2', '西药处方', '1', 'pill_drug_pt', null, 'default', 'N', '0', 'admin', '2025-10-31 20:54:53', 'admin', '2025-10-31 23:24:55', null);
INSERT INTO `sys_dict_data` VALUES ('107', '0', '已支付', 'PAID', 'pill_order_status', 'succes', 'primary', 'N', '0', 'admin', '2025-11-06 14:43:46', 'admin', '2025-11-06 14:48:36', '已支付');
INSERT INTO `sys_dict_data` VALUES ('108', '1', '已完成', 'COMPLETED', 'pill_order_status', 'cuccess', 'success', 'N', '0', 'admin', '2025-11-06 14:44:57', 'admin', '2025-11-06 14:49:13', '已完成');
INSERT INTO `sys_dict_data` VALUES ('109', '2', '已取消', 'CANCELLED', 'pill_order_status', 'info', 'info', 'N', '0', 'admin', '2025-11-06 14:47:58', 'admin', '2025-11-06 15:58:17', '已取消');

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2025-10-31 19:18:09', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2025-10-31 19:18:09', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2025-10-31 19:18:09', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2025-10-31 19:18:09', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2025-10-31 19:18:09', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2025-10-31 19:18:09', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2025-10-31 19:18:09', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2025-10-31 19:18:09', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2025-10-31 19:18:09', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2025-10-31 19:18:09', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '药品类型', 'pill_drug_dt', '0', 'admin', '2025-10-31 20:51:25', 'admin', '2025-10-31 23:38:56', '药品类型列表');
INSERT INTO `sys_dict_type` VALUES ('101', '处方类型', 'pull_drug_pt', '0', 'admin', '2025-10-31 20:53:43', 'admin', '2025-10-31 20:53:59', '处方类型列表');
INSERT INTO `sys_dict_type` VALUES ('102', '订单状态', 'pill_order_status', '0', 'admin', '2025-11-06 13:21:25', 'admin', '2025-11-06 14:56:13', '订单状态');

-- ----------------------------
-- Table structure for `sys_job`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-10-31 19:18:09', '', null, '');

-- ----------------------------
-- Table structure for `sys_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-31 20:06:35');
INSERT INTO `sys_logininfor` VALUES ('101', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-10-31 20:30:51');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-10-31 21:33:33');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-31 21:57:46');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-31 21:57:50');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-31 22:00:46');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-31 22:00:52');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-31 22:19:53');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-10-31 22:19:58');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-31 22:20:02');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-31 23:12:26');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-31 23:16:25');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-31 23:16:32');
INSERT INTO `sys_logininfor` VALUES ('113', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-10-31 23:22:13');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-01 01:04:50');
INSERT INTO `sys_logininfor` VALUES ('115', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-01 01:16:03');
INSERT INTO `sys_logininfor` VALUES ('116', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-01 11:00:41');
INSERT INTO `sys_logininfor` VALUES ('117', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-01 13:40:38');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-01 13:44:49');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-01 13:47:53');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-01 13:47:56');
INSERT INTO `sys_logininfor` VALUES ('121', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-01 14:09:36');
INSERT INTO `sys_logininfor` VALUES ('122', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-11-01 14:09:45');
INSERT INTO `sys_logininfor` VALUES ('123', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-01 14:09:49');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-01 14:57:07');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-01 14:59:35');
INSERT INTO `sys_logininfor` VALUES ('126', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-01 16:22:44');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-01 16:57:20');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-01 18:52:23');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-01 21:17:54');
INSERT INTO `sys_logininfor` VALUES ('130', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2025-11-01 22:05:59');
INSERT INTO `sys_logininfor` VALUES ('131', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-01 22:06:03');
INSERT INTO `sys_logininfor` VALUES ('132', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-01 22:10:46');
INSERT INTO `sys_logininfor` VALUES ('133', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-01 22:10:56');
INSERT INTO `sys_logininfor` VALUES ('134', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-01 22:27:56');
INSERT INTO `sys_logininfor` VALUES ('135', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-11-01 22:28:06');
INSERT INTO `sys_logininfor` VALUES ('136', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-01 22:28:10');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 00:46:40');
INSERT INTO `sys_logininfor` VALUES ('138', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2025-11-02 00:51:17');
INSERT INTO `sys_logininfor` VALUES ('139', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 00:51:21');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 14:20:32');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 14:20:40');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 14:20:45');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 14:20:49');
INSERT INTO `sys_logininfor` VALUES ('144', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 14:20:58');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-11-02 14:21:04');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 14:21:09');
INSERT INTO `sys_logininfor` VALUES ('147', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 14:40:51');
INSERT INTO `sys_logininfor` VALUES ('148', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 14:40:59');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:14:05');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:14:11');
INSERT INTO `sys_logininfor` VALUES ('151', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 15:14:32');
INSERT INTO `sys_logininfor` VALUES ('152', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 15:14:40');
INSERT INTO `sys_logininfor` VALUES ('153', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 15:14:57');
INSERT INTO `sys_logininfor` VALUES ('154', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 15:15:10');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:20:19');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:20:26');
INSERT INTO `sys_logininfor` VALUES ('157', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 15:20:45');
INSERT INTO `sys_logininfor` VALUES ('158', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 15:20:54');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:27:07');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:27:11');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:27:16');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:27:34');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:28:56');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-02 15:28:59');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:29:03');
INSERT INTO `sys_logininfor` VALUES ('166', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 15:29:37');
INSERT INTO `sys_logininfor` VALUES ('167', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 15:29:45');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:30:05');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:30:10');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:32:02');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:32:05');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:32:13');
INSERT INTO `sys_logininfor` VALUES ('173', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 15:32:18');
INSERT INTO `sys_logininfor` VALUES ('174', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 15:32:28');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-02 15:35:40');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:35:44');
INSERT INTO `sys_logininfor` VALUES ('177', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 15:35:59');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-11-02 15:36:02');
INSERT INTO `sys_logininfor` VALUES ('179', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 15:36:12');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:36:41');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:36:43');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:43:20');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:43:27');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:43:31');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:43:35');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:44:03');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:44:06');
INSERT INTO `sys_logininfor` VALUES ('188', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 15:44:15');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 15:44:20');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 15:44:24');
INSERT INTO `sys_logininfor` VALUES ('191', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 15:44:32');
INSERT INTO `sys_logininfor` VALUES ('192', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 15:44:50');
INSERT INTO `sys_logininfor` VALUES ('193', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 15:44:59');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:48:49');
INSERT INTO `sys_logininfor` VALUES ('195', 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:48:59');
INSERT INTO `sys_logininfor` VALUES ('196', 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:49:06');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:49:10');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:49:50');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:49:53');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:50:01');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:50:08');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:50:33');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:50:37');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:51:58');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:52:01');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:52:18');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:52:33');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:52:35');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:53:04');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:53:09');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 15:53:12');
INSERT INTO `sys_logininfor` VALUES ('212', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 15:53:18');
INSERT INTO `sys_logininfor` VALUES ('213', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 15:53:27');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 15:54:20');
INSERT INTO `sys_logininfor` VALUES ('215', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 15:54:25');
INSERT INTO `sys_logininfor` VALUES ('216', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 15:54:33');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 16:04:57');
INSERT INTO `sys_logininfor` VALUES ('218', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 16:05:00');
INSERT INTO `sys_logininfor` VALUES ('219', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 16:26:12');
INSERT INTO `sys_logininfor` VALUES ('220', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 16:26:15');
INSERT INTO `sys_logininfor` VALUES ('221', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 16:26:30');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 16:26:34');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 16:26:37');
INSERT INTO `sys_logininfor` VALUES ('224', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 16:26:44');
INSERT INTO `sys_logininfor` VALUES ('225', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 16:26:48');
INSERT INTO `sys_logininfor` VALUES ('226', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-11-02 16:27:01');
INSERT INTO `sys_logininfor` VALUES ('227', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2025-11-02 16:27:06');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2025-11-02 16:27:06');
INSERT INTO `sys_logininfor` VALUES ('229', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2025-11-02 16:27:19');
INSERT INTO `sys_logininfor` VALUES ('230', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误2次', '2025-11-02 16:27:19');
INSERT INTO `sys_logininfor` VALUES ('231', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 16:28:17');
INSERT INTO `sys_logininfor` VALUES ('232', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-02 16:28:26');
INSERT INTO `sys_logininfor` VALUES ('233', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2025-11-02 16:28:35');
INSERT INTO `sys_logininfor` VALUES ('234', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2025-11-02 16:28:35');
INSERT INTO `sys_logininfor` VALUES ('235', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2025-11-02 16:28:37');
INSERT INTO `sys_logininfor` VALUES ('236', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误2次', '2025-11-02 16:28:37');
INSERT INTO `sys_logininfor` VALUES ('237', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误3次', '2025-11-02 16:28:45');
INSERT INTO `sys_logininfor` VALUES ('238', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2025-11-02 16:28:45');
INSERT INTO `sys_logininfor` VALUES ('239', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 16:29:10');
INSERT INTO `sys_logininfor` VALUES ('240', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 16:46:57');
INSERT INTO `sys_logininfor` VALUES ('241', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 16:49:55');
INSERT INTO `sys_logininfor` VALUES ('242', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 17:04:54');
INSERT INTO `sys_logininfor` VALUES ('243', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 17:04:57');
INSERT INTO `sys_logininfor` VALUES ('244', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 17:12:47');
INSERT INTO `sys_logininfor` VALUES ('245', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 17:12:52');
INSERT INTO `sys_logininfor` VALUES ('246', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 17:14:37');
INSERT INTO `sys_logininfor` VALUES ('247', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 17:14:40');
INSERT INTO `sys_logininfor` VALUES ('248', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 17:41:32');
INSERT INTO `sys_logininfor` VALUES ('249', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 17:44:13');
INSERT INTO `sys_logininfor` VALUES ('250', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 18:26:56');
INSERT INTO `sys_logininfor` VALUES ('251', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 18:30:44');
INSERT INTO `sys_logininfor` VALUES ('252', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 18:30:48');
INSERT INTO `sys_logininfor` VALUES ('253', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 19:22:07');
INSERT INTO `sys_logininfor` VALUES ('254', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 20:17:13');
INSERT INTO `sys_logininfor` VALUES ('255', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-02 22:32:54');
INSERT INTO `sys_logininfor` VALUES ('256', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-11-02 22:33:01');
INSERT INTO `sys_logininfor` VALUES ('257', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 22:33:06');
INSERT INTO `sys_logininfor` VALUES ('258', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-02 22:41:53');
INSERT INTO `sys_logininfor` VALUES ('259', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-02 22:41:56');
INSERT INTO `sys_logininfor` VALUES ('260', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 00:08:20');
INSERT INTO `sys_logininfor` VALUES ('261', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-11-03 00:08:23');
INSERT INTO `sys_logininfor` VALUES ('262', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 00:08:28');
INSERT INTO `sys_logininfor` VALUES ('263', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 00:15:26');
INSERT INTO `sys_logininfor` VALUES ('264', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 00:15:36');
INSERT INTO `sys_logininfor` VALUES ('265', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 00:36:01');
INSERT INTO `sys_logininfor` VALUES ('266', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 00:36:11');
INSERT INTO `sys_logininfor` VALUES ('267', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 00:40:32');
INSERT INTO `sys_logininfor` VALUES ('268', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-03 01:05:11');
INSERT INTO `sys_logininfor` VALUES ('269', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 01:05:15');
INSERT INTO `sys_logininfor` VALUES ('270', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 01:06:04');
INSERT INTO `sys_logininfor` VALUES ('271', 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '注册成功', '2025-11-03 01:11:13');
INSERT INTO `sys_logininfor` VALUES ('272', 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 01:11:23');
INSERT INTO `sys_logininfor` VALUES ('273', 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 01:19:12');
INSERT INTO `sys_logininfor` VALUES ('274', 'user2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '注册成功', '2025-11-03 01:19:25');
INSERT INTO `sys_logininfor` VALUES ('275', 'user2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-11-03 01:19:34');
INSERT INTO `sys_logininfor` VALUES ('276', 'user2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 01:19:38');
INSERT INTO `sys_logininfor` VALUES ('277', 'user2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 01:43:04');
INSERT INTO `sys_logininfor` VALUES ('278', 'user3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '注册成功', '2025-11-03 01:43:22');
INSERT INTO `sys_logininfor` VALUES ('279', 'user3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 01:43:31');
INSERT INTO `sys_logininfor` VALUES ('280', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 08:58:23');
INSERT INTO `sys_logininfor` VALUES ('281', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 08:58:30');
INSERT INTO `sys_logininfor` VALUES ('282', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 09:13:59');
INSERT INTO `sys_logininfor` VALUES ('283', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2025-11-03 09:55:07');
INSERT INTO `sys_logininfor` VALUES ('284', 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 09:55:23');
INSERT INTO `sys_logininfor` VALUES ('285', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-03 09:55:39');
INSERT INTO `sys_logininfor` VALUES ('286', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 09:55:44');
INSERT INTO `sys_logininfor` VALUES ('287', 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 09:56:53');
INSERT INTO `sys_logininfor` VALUES ('288', 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 09:57:07');
INSERT INTO `sys_logininfor` VALUES ('289', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-03 10:48:39');
INSERT INTO `sys_logininfor` VALUES ('290', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 10:48:42');
INSERT INTO `sys_logininfor` VALUES ('291', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 12:29:11');
INSERT INTO `sys_logininfor` VALUES ('292', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 13:57:22');
INSERT INTO `sys_logininfor` VALUES ('293', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 13:57:53');
INSERT INTO `sys_logininfor` VALUES ('294', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 13:57:57');
INSERT INTO `sys_logininfor` VALUES ('295', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-11-03 13:58:06');
INSERT INTO `sys_logininfor` VALUES ('296', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 13:58:10');
INSERT INTO `sys_logininfor` VALUES ('297', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 13:58:49');
INSERT INTO `sys_logininfor` VALUES ('298', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 13:59:02');
INSERT INTO `sys_logininfor` VALUES ('299', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 13:59:06');
INSERT INTO `sys_logininfor` VALUES ('300', 'user1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：user1 不存在', '2025-11-03 13:59:11');
INSERT INTO `sys_logininfor` VALUES ('301', 'user1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-11-03 13:59:16');
INSERT INTO `sys_logininfor` VALUES ('302', 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 13:59:21');
INSERT INTO `sys_logininfor` VALUES ('303', 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 13:59:29');
INSERT INTO `sys_logininfor` VALUES ('304', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-11-03 13:59:44');
INSERT INTO `sys_logininfor` VALUES ('305', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 13:59:48');
INSERT INTO `sys_logininfor` VALUES ('306', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 14:00:01');
INSERT INTO `sys_logininfor` VALUES ('307', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 14:00:11');
INSERT INTO `sys_logininfor` VALUES ('308', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-03 14:00:15');
INSERT INTO `sys_logininfor` VALUES ('309', 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 14:00:23');
INSERT INTO `sys_logininfor` VALUES ('310', 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-03 14:00:36');
INSERT INTO `sys_logininfor` VALUES ('311', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 14:00:41');
INSERT INTO `sys_logininfor` VALUES ('312', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 14:01:00');
INSERT INTO `sys_logininfor` VALUES ('313', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 14:01:03');
INSERT INTO `sys_logininfor` VALUES ('314', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-03 14:01:29');
INSERT INTO `sys_logininfor` VALUES ('315', 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-03 14:01:38');
INSERT INTO `sys_logininfor` VALUES ('316', 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 14:01:42');
INSERT INTO `sys_logininfor` VALUES ('317', 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-03 14:02:00');
INSERT INTO `sys_logininfor` VALUES ('318', 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 14:02:07');
INSERT INTO `sys_logininfor` VALUES ('319', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 15:19:20');
INSERT INTO `sys_logininfor` VALUES ('320', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 15:36:24');
INSERT INTO `sys_logininfor` VALUES ('321', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 15:50:17');
INSERT INTO `sys_logininfor` VALUES ('322', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-11-03 15:50:28');
INSERT INTO `sys_logininfor` VALUES ('323', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 15:50:30');
INSERT INTO `sys_logininfor` VALUES ('324', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 17:27:03');
INSERT INTO `sys_logininfor` VALUES ('325', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 18:20:38');
INSERT INTO `sys_logininfor` VALUES ('326', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 18:22:52');
INSERT INTO `sys_logininfor` VALUES ('327', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 19:13:08');
INSERT INTO `sys_logininfor` VALUES ('328', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 20:24:41');
INSERT INTO `sys_logininfor` VALUES ('329', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 20:52:47');
INSERT INTO `sys_logininfor` VALUES ('330', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 20:58:38');
INSERT INTO `sys_logininfor` VALUES ('331', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-03 20:58:42');
INSERT INTO `sys_logininfor` VALUES ('332', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-03 21:07:11');
INSERT INTO `sys_logininfor` VALUES ('333', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-03 23:34:09');
INSERT INTO `sys_logininfor` VALUES ('334', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-04 09:14:15');
INSERT INTO `sys_logininfor` VALUES ('335', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-11-04 09:14:33');
INSERT INTO `sys_logininfor` VALUES ('336', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-04 09:14:36');
INSERT INTO `sys_logininfor` VALUES ('337', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-04 09:17:14');
INSERT INTO `sys_logininfor` VALUES ('338', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-04 09:17:19');
INSERT INTO `sys_logininfor` VALUES ('339', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-04 09:17:31');
INSERT INTO `sys_logininfor` VALUES ('340', 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-04 09:17:42');
INSERT INTO `sys_logininfor` VALUES ('341', 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-04 09:31:59');
INSERT INTO `sys_logininfor` VALUES ('342', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-04 09:32:06');
INSERT INTO `sys_logininfor` VALUES ('343', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-04 09:32:13');
INSERT INTO `sys_logininfor` VALUES ('344', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-04 09:32:16');
INSERT INTO `sys_logininfor` VALUES ('345', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-04 09:38:40');
INSERT INTO `sys_logininfor` VALUES ('346', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-04 09:38:41');
INSERT INTO `sys_logininfor` VALUES ('347', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-04 10:20:25');
INSERT INTO `sys_logininfor` VALUES ('348', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-04 10:20:25');
INSERT INTO `sys_logininfor` VALUES ('349', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-04 10:22:11');
INSERT INTO `sys_logininfor` VALUES ('350', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-04 10:22:12');
INSERT INTO `sys_logininfor` VALUES ('351', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-04 10:23:48');
INSERT INTO `sys_logininfor` VALUES ('352', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-04 10:23:48');
INSERT INTO `sys_logininfor` VALUES ('353', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-04 10:32:45');
INSERT INTO `sys_logininfor` VALUES ('354', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2025-11-04 10:33:55');
INSERT INTO `sys_logininfor` VALUES ('355', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-04 10:34:00');
INSERT INTO `sys_logininfor` VALUES ('356', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-04 10:34:07');
INSERT INTO `sys_logininfor` VALUES ('357', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-04 10:34:23');
INSERT INTO `sys_logininfor` VALUES ('358', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-04 10:34:30');
INSERT INTO `sys_logininfor` VALUES ('359', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-04 10:34:59');
INSERT INTO `sys_logininfor` VALUES ('360', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-04 10:45:20');
INSERT INTO `sys_logininfor` VALUES ('361', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-04 10:45:31');
INSERT INTO `sys_logininfor` VALUES ('362', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-04 12:39:52');
INSERT INTO `sys_logininfor` VALUES ('363', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-04 12:40:02');
INSERT INTO `sys_logininfor` VALUES ('364', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-04 12:40:15');
INSERT INTO `sys_logininfor` VALUES ('365', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-11-04 12:40:49');
INSERT INTO `sys_logininfor` VALUES ('366', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-04 12:40:52');
INSERT INTO `sys_logininfor` VALUES ('367', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-11-04 20:53:36');
INSERT INTO `sys_logininfor` VALUES ('368', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-04 20:53:41');
INSERT INTO `sys_logininfor` VALUES ('369', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-04 20:53:47');
INSERT INTO `sys_logininfor` VALUES ('370', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2025-11-04 20:54:12');
INSERT INTO `sys_logininfor` VALUES ('371', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-04 20:54:20');
INSERT INTO `sys_logininfor` VALUES ('372', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-11-04 22:49:24');
INSERT INTO `sys_logininfor` VALUES ('373', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-04 22:49:29');
INSERT INTO `sys_logininfor` VALUES ('374', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-04 22:49:47');
INSERT INTO `sys_logininfor` VALUES ('375', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2025-11-04 22:50:25');
INSERT INTO `sys_logininfor` VALUES ('376', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-04 22:50:31');
INSERT INTO `sys_logininfor` VALUES ('377', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 00:29:29');
INSERT INTO `sys_logininfor` VALUES ('378', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 00:29:48');
INSERT INTO `sys_logininfor` VALUES ('379', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 00:30:00');
INSERT INTO `sys_logininfor` VALUES ('380', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 01:13:33');
INSERT INTO `sys_logininfor` VALUES ('381', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 01:13:41');
INSERT INTO `sys_logininfor` VALUES ('382', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 12:43:05');
INSERT INTO `sys_logininfor` VALUES ('383', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-05 13:09:21');
INSERT INTO `sys_logininfor` VALUES ('384', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-05 14:11:24');
INSERT INTO `sys_logininfor` VALUES ('385', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 14:53:35');
INSERT INTO `sys_logininfor` VALUES ('386', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 14:53:41');
INSERT INTO `sys_logininfor` VALUES ('387', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 20:14:30');
INSERT INTO `sys_logininfor` VALUES ('388', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 20:15:04');
INSERT INTO `sys_logininfor` VALUES ('389', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 20:15:09');
INSERT INTO `sys_logininfor` VALUES ('390', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-05 20:15:22');
INSERT INTO `sys_logininfor` VALUES ('391', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-05 20:15:25');
INSERT INTO `sys_logininfor` VALUES ('392', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 20:22:54');
INSERT INTO `sys_logininfor` VALUES ('393', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 20:22:59');
INSERT INTO `sys_logininfor` VALUES ('394', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 20:23:54');
INSERT INTO `sys_logininfor` VALUES ('395', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-11-05 20:23:57');
INSERT INTO `sys_logininfor` VALUES ('396', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 20:24:01');
INSERT INTO `sys_logininfor` VALUES ('397', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 20:25:09');
INSERT INTO `sys_logininfor` VALUES ('398', 'user1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：user1 不存在', '2025-11-05 20:25:16');
INSERT INTO `sys_logininfor` VALUES ('399', 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 20:25:21');
INSERT INTO `sys_logininfor` VALUES ('400', 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 20:38:59');
INSERT INTO `sys_logininfor` VALUES ('401', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 20:39:07');
INSERT INTO `sys_logininfor` VALUES ('402', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 20:39:20');
INSERT INTO `sys_logininfor` VALUES ('403', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-05 20:39:58');
INSERT INTO `sys_logininfor` VALUES ('404', 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-05 20:40:05');
INSERT INTO `sys_logininfor` VALUES ('405', 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-05 20:40:13');
INSERT INTO `sys_logininfor` VALUES ('406', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-05 20:40:16');
INSERT INTO `sys_logininfor` VALUES ('407', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 20:41:17');
INSERT INTO `sys_logininfor` VALUES ('408', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 20:52:21');
INSERT INTO `sys_logininfor` VALUES ('409', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 20:52:24');
INSERT INTO `sys_logininfor` VALUES ('410', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 20:53:03');
INSERT INTO `sys_logininfor` VALUES ('411', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 20:53:08');
INSERT INTO `sys_logininfor` VALUES ('412', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 21:38:11');
INSERT INTO `sys_logininfor` VALUES ('413', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-05 21:38:59');
INSERT INTO `sys_logininfor` VALUES ('414', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 21:51:30');
INSERT INTO `sys_logininfor` VALUES ('415', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-11-05 21:51:33');
INSERT INTO `sys_logininfor` VALUES ('416', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 21:51:37');
INSERT INTO `sys_logininfor` VALUES ('417', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 21:59:22');
INSERT INTO `sys_logininfor` VALUES ('418', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 21:59:26');
INSERT INTO `sys_logininfor` VALUES ('419', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-05 22:14:42');
INSERT INTO `sys_logininfor` VALUES ('420', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-05 22:14:45');
INSERT INTO `sys_logininfor` VALUES ('421', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 22:40:47');
INSERT INTO `sys_logininfor` VALUES ('422', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-11-05 22:40:52');
INSERT INTO `sys_logininfor` VALUES ('423', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 22:40:57');
INSERT INTO `sys_logininfor` VALUES ('424', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 22:59:23');
INSERT INTO `sys_logininfor` VALUES ('425', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 22:59:28');
INSERT INTO `sys_logininfor` VALUES ('426', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 23:05:07');
INSERT INTO `sys_logininfor` VALUES ('427', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 23:05:15');
INSERT INTO `sys_logininfor` VALUES ('428', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 23:05:59');
INSERT INTO `sys_logininfor` VALUES ('429', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 23:06:05');
INSERT INTO `sys_logininfor` VALUES ('430', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-05 23:19:16');
INSERT INTO `sys_logininfor` VALUES ('431', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2025-11-05 23:19:27');
INSERT INTO `sys_logininfor` VALUES ('432', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 23:19:46');
INSERT INTO `sys_logininfor` VALUES ('433', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-05 23:53:43');
INSERT INTO `sys_logininfor` VALUES ('434', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-05 23:54:01');
INSERT INTO `sys_logininfor` VALUES ('435', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-06 00:56:08');
INSERT INTO `sys_logininfor` VALUES ('436', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-06 00:56:36');
INSERT INTO `sys_logininfor` VALUES ('437', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-06 01:37:33');
INSERT INTO `sys_logininfor` VALUES ('438', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-06 01:38:01');
INSERT INTO `sys_logininfor` VALUES ('439', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-11-06 01:56:11');
INSERT INTO `sys_logininfor` VALUES ('440', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-06 01:56:15');
INSERT INTO `sys_logininfor` VALUES ('441', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-11-06 08:18:23');
INSERT INTO `sys_logininfor` VALUES ('442', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-06 08:18:28');
INSERT INTO `sys_logininfor` VALUES ('443', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-06 08:18:41');
INSERT INTO `sys_logininfor` VALUES ('444', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-06 08:59:42');
INSERT INTO `sys_logininfor` VALUES ('445', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-06 13:19:46');
INSERT INTO `sys_logininfor` VALUES ('446', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-06 13:44:20');
INSERT INTO `sys_logininfor` VALUES ('447', 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-11-06 14:36:01');
INSERT INTO `sys_logininfor` VALUES ('448', 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-06 15:33:29');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2025-10-31 19:18:09', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2025-10-31 19:18:09', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '', '1', '0', 'M', '0', '1', '', 'tool', 'admin', '2025-10-31 19:18:09', 'admin', '2025-11-06 16:01:09', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-10-31 19:18:09', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-10-31 19:18:09', 'admin', '2025-11-05 21:53:49', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '1', 'system:menu:list', 'tree-table', 'admin', '2025-10-31 19:18:09', 'admin', '2025-11-06 16:01:58', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '1', 'system:dept:list', 'tree', 'admin', '2025-10-31 19:18:09', 'admin', '2025-11-05 21:53:10', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '0', '1', 'system:post:list', 'post', 'admin', '2025-10-31 19:18:09', 'admin', '2025-11-05 21:53:06', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '1', 'system:dict:list', 'dict', 'admin', '2025-10-31 19:18:09', 'admin', '2025-11-06 16:01:33', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-10-31 19:18:09', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '1', 'system:notice:list', 'message', 'admin', '2025-10-31 19:18:09', 'admin', '2025-11-05 21:52:35', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2025-10-31 19:18:09', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-10-31 19:18:09', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '1', 'monitor:job:list', 'job', 'admin', '2025-10-31 19:18:09', 'admin', '2025-11-05 21:53:59', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '1', 'monitor:druid:list', 'druid', 'admin', '2025-10-31 19:18:09', 'admin', '2025-11-05 21:54:38', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-10-31 19:18:09', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-10-31 19:18:09', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '缓存列表', '2', '6', 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-10-31 19:18:09', '', null, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES ('115', '表单构建', '3', '1', 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-10-31 19:18:09', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('116', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-10-31 19:18:09', 'admin', '2025-11-06 14:09:30', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('117', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-10-31 19:18:09', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-10-31 19:18:09', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-10-31 19:18:09', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '账户解锁', '501', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '6', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '116', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '116', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '116', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '116', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '116', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '116', '6', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-10-31 19:18:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', '药品进销存', '0', '4', 'pill', null, null, '1', '0', 'M', '0', '0', null, 'pill', 'admin', '2025-10-31 20:12:10', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '生产厂家信息', '2000', '1', 'factory', 'pill/factory/index', null, '1', '0', 'C', '0', '0', 'pill:factory:list', 'build', 'admin', '2025-10-31 20:41:41', 'admin', '2025-10-31 20:43:14', '生产厂家信息菜单');
INSERT INTO `sys_menu` VALUES ('2007', '生产厂家信息查询', '2006', '1', '#', '', null, '1', '0', 'F', '0', '0', 'pill:factory:query', '#', 'admin', '2025-10-31 20:41:41', '', null, '');
INSERT INTO `sys_menu` VALUES ('2008', '生产厂家信息新增', '2006', '2', '#', '', null, '1', '0', 'F', '0', '0', 'pill:factory:add', '#', 'admin', '2025-10-31 20:41:41', '', null, '');
INSERT INTO `sys_menu` VALUES ('2009', '生产厂家信息修改', '2006', '3', '#', '', null, '1', '0', 'F', '0', '0', 'pill:factory:edit', '#', 'admin', '2025-10-31 20:41:41', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '生产厂家信息删除', '2006', '4', '#', '', null, '1', '0', 'F', '0', '0', 'pill:factory:remove', '#', 'admin', '2025-10-31 20:41:41', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '生产厂家信息导出', '2006', '5', '#', '', null, '1', '0', 'F', '0', '0', 'pill:factory:export', '#', 'admin', '2025-10-31 20:41:41', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '药品信息', '2000', '1', 'drug', 'pill/drug/index', null, '1', '0', 'C', '0', '0', 'pill:drug:list', 'clipboard', 'admin', '2025-10-31 21:28:55', 'admin', '2025-10-31 21:30:06', '药品信息菜单');
INSERT INTO `sys_menu` VALUES ('2013', '药品信息查询', '2012', '1', '#', '', null, '1', '0', 'F', '0', '0', 'pill:drug:query', '#', 'admin', '2025-10-31 21:28:55', '', null, '');
INSERT INTO `sys_menu` VALUES ('2014', '药品信息新增', '2012', '2', '#', '', null, '1', '0', 'F', '0', '0', 'pill:drug:add', '#', 'admin', '2025-10-31 21:28:55', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '药品信息修改', '2012', '3', '#', '', null, '1', '0', 'F', '0', '0', 'pill:drug:edit', '#', 'admin', '2025-10-31 21:28:55', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '药品信息删除', '2012', '4', '#', '', null, '1', '0', 'F', '0', '0', 'pill:drug:remove', '#', 'admin', '2025-10-31 21:28:55', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '药品信息导出', '2012', '5', '#', '', null, '1', '0', 'F', '0', '0', 'pill:drug:export', '#', 'admin', '2025-10-31 21:28:55', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '药品商城', '0', '5', 'mall', null, null, '1', '0', 'M', '1', '1', '', 'shopping', 'admin', '2025-11-01 17:02:45', 'admin', '2025-11-06 01:38:57', '');
INSERT INTO `sys_menu` VALUES ('2021', '药品购买', '2018', '1', 'drugClient', 'pill/drugClient/index', null, '1', '0', 'C', '0', '0', 'pill:drugClient:list', 'search', 'admin', '2025-11-01 19:37:06', 'admin', '2025-11-05 16:00:52', '药品购买菜单');
INSERT INTO `sys_menu` VALUES ('2022', '药品购买查询', '2021', '1', '#', '', null, '1', '0', 'F', '0', '0', 'pill:drugClient:query', '#', 'admin', '2025-11-01 19:37:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '药品购买新增', '2021', '2', '#', '', null, '1', '0', 'F', '0', '0', 'pill:drugClient:add', '#', 'admin', '2025-11-01 19:37:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('2024', '药品购买修改', '2021', '3', '#', '', null, '1', '0', 'F', '0', '0', 'pill:drugClient:edit', '#', 'admin', '2025-11-01 19:37:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('2025', '药品购买删除', '2021', '4', '#', '', null, '1', '0', 'F', '0', '0', 'pill:drugClient:remove', '#', 'admin', '2025-11-01 19:37:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('2026', '药品购买导出', '2021', '5', '#', '', null, '1', '0', 'F', '0', '0', 'pill:drugClient:export', '#', 'admin', '2025-11-01 19:37:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('2027', '我的订单', '2018', '1', 'order', 'pill/order/index', null, '1', '0', 'C', '0', '0', 'pill:order:list', 'documentation', 'admin', '2025-11-01 19:37:11', 'admin', '2025-11-05 16:01:25', '我的订单菜单');
INSERT INTO `sys_menu` VALUES ('2028', '我的订单查询', '2027', '1', '#', '', null, '1', '0', 'F', '0', '0', 'pill:order:query', '#', 'admin', '2025-11-01 19:37:11', '', null, '');
INSERT INTO `sys_menu` VALUES ('2029', '我的订单新增', '2027', '2', '#', '', null, '1', '0', 'F', '0', '0', 'pill:order:add', '#', 'admin', '2025-11-01 19:37:11', '', null, '');
INSERT INTO `sys_menu` VALUES ('2030', '我的订单修改', '2027', '3', '#', '', null, '1', '0', 'F', '0', '0', 'pill:order:edit', '#', 'admin', '2025-11-01 19:37:11', '', null, '');
INSERT INTO `sys_menu` VALUES ('2031', '我的订单删除', '2027', '4', '#', '', null, '1', '0', 'F', '0', '0', 'pill:order:remove', '#', 'admin', '2025-11-01 19:37:11', '', null, '');
INSERT INTO `sys_menu` VALUES ('2032', '我的订单导出', '2027', '5', '#', '', null, '1', '0', 'F', '0', '0', 'pill:order:export', '#', 'admin', '2025-11-01 19:37:11', '', null, '');
INSERT INTO `sys_menu` VALUES ('2039', '全部订单', '2000', '1', 'allOrder', 'pill/allOrder/index', null, '1', '0', 'C', '0', '0', 'pill:allOrder:list', 'documentation', 'admin', '2025-11-02 17:33:46', 'admin', '2025-11-03 01:01:02', '全部订单菜单');
INSERT INTO `sys_menu` VALUES ('2040', '全部订单查询', '2039', '1', '#', '', null, '1', '0', 'F', '0', '0', 'pill:allOrder:query', '#', 'admin', '2025-11-02 17:33:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('2041', '全部订单新增', '2039', '2', '#', '', null, '1', '0', 'F', '0', '0', 'pill:allOrder:add', '#', 'admin', '2025-11-02 17:33:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('2042', '全部订单修改', '2039', '3', '#', '', null, '1', '0', 'F', '0', '0', 'pill:allOrder:edit', '#', 'admin', '2025-11-02 17:33:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('2043', '全部订单删除', '2039', '4', '#', '', null, '1', '0', 'F', '0', '0', 'pill:allOrder:remove', '#', 'admin', '2025-11-02 17:33:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('2044', '全部订单导出', '2039', '5', '#', '', null, '1', '0', 'F', '0', '0', 'pill:allOrder:export', '#', 'admin', '2025-11-02 17:33:46', '', null, '');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
