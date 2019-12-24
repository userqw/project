/*
 Navicat Premium Data Transfer

 Source Server         : yyp
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 127.0.0.1:3306
 Source Schema         : erp

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 13/02/2019 00:48:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dep
-- ----------------------------
DROP TABLE IF EXISTS `dep`;
CREATE TABLE `dep`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tele` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dep
-- ----------------------------
INSERT INTO `dep` VALUES (1, '管理员组', '000000');
INSERT INTO `dep` VALUES (2, '总裁办', '111111');
INSERT INTO `dep` VALUES (3, '采购部', '222222');
INSERT INTO `dep` VALUES (4, '销售部', '333333');
INSERT INTO `dep` VALUES (5, '公关部', '444444');
INSERT INTO `dep` VALUES (6, '行政部', '555555');
INSERT INTO `dep` VALUES (7, '人事部', '555555');
INSERT INTO `dep` VALUES (8, '运输部', '444444');
INSERT INTO `dep` VALUES (9, '党办', '555555');
INSERT INTO `dep` VALUES (10, '工会', '555555');
INSERT INTO `dep` VALUES (11, '仓储部', '555555');
INSERT INTO `dep` VALUES (12, '客服部', '555555');
INSERT INTO `dep` VALUES (13, '财务部', '555555');
INSERT INTO `dep` VALUES (14, '运营部', '555555');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` bigint(20) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tele` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `depuuid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE,
  INDEX `FK5w2bq1t9mbvuc7xgybbityym0`(`depuuid`) USING BTREE,
  CONSTRAINT `FK5w2bq1t9mbvuc7xgybbityym0` FOREIGN KEY (`depuuid`) REFERENCES `dep` (`uuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES (1, 'admin', '3ef7164d1f6167cb9f2658c07d3c2f0a', '超级管理员', 1, 'admin@itcast.cn', '12345678', '建材城西路中腾商务大厦', '1949-10-01 00:00:00', 1);
INSERT INTO `emp` VALUES (2, 'sunwukong', 'sunwukong', '孙悟空', 1, 'swk@itcast.cn', '12345678', '花果山水帘洞11-2', '1949-10-01 00:00:00', 2);
INSERT INTO `emp` VALUES (3, 'tangseng', 'tangseng', '唐僧', 1, 'ts@itcast.cn', '12345678', '东土大唐小区90-14', '1949-10-01 00:00:00', 2);
INSERT INTO `emp` VALUES (4, 'zhubajie', 'zhubajie', '猪八戒', 1, 'zbj@itcast.cn', '12345678', '高老庄生态园2-3', '1949-10-01 00:00:00', 3);
INSERT INTO `emp` VALUES (5, 'shaheshang', 'shaheshang', '沙和尚', 1, 'shs@itcast.cn', '12345678', '流沙河风景区4-4', '1949-10-01 00:00:00', 3);
INSERT INTO `emp` VALUES (6, 'bailongma', 'bailongma', '白龙马', 1, 'blm@itcast.cn', '12345678', '西海家园4-9-1', '1949-10-01 00:00:00', 3);

-- ----------------------------
-- Table structure for emp_role
-- ----------------------------
DROP TABLE IF EXISTS `emp_role`;
CREATE TABLE `emp_role`  (
  `empuuid` bigint(20) NULL DEFAULT NULL,
  `roleuuid` bigint(20) NOT NULL,
  INDEX `FKiow2o122qjvi0ihxblw4fqqy4`(`roleuuid`) USING BTREE,
  INDEX `FKb0k4i90drxcu6crrx23vavxsc`(`empuuid`) USING BTREE,
  CONSTRAINT `FKb0k4i90drxcu6crrx23vavxsc` FOREIGN KEY (`empuuid`) REFERENCES `emp` (`uuid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKiow2o122qjvi0ihxblw4fqqy4` FOREIGN KEY (`roleuuid`) REFERENCES `role` (`uuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emp_role
-- ----------------------------
INSERT INTO `emp_role` VALUES (1, 1);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `producer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inprice` double NULL DEFAULT NULL,
  `outprice` double NULL DEFAULT NULL,
  `goodstypeuuid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE,
  INDEX `FKirp2pcgaaiuxer5o7vgi10y8s`(`goodstypeuuid`) USING BTREE,
  CONSTRAINT `FKirp2pcgaaiuxer5o7vgi10y8s` FOREIGN KEY (`goodstypeuuid`) REFERENCES `goodstype` (`uuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '水蜜桃', '北京', '北京水果之乡', '斤', 2.34, 4.23, 1);
INSERT INTO `goods` VALUES (2, '大鸭梨', '北京', '北京水果之乡', '斤', 1.11, 3.55, 1);
INSERT INTO `goods` VALUES (3, '猕猴桃', '北京', '北京水果之乡', '斤', 6.33, 9.02, 1);
INSERT INTO `goods` VALUES (4, '甜面酱', '北京', '七必居', '袋', 4.11, 6.33, 2);
INSERT INTO `goods` VALUES (5, '可比克', '北京', '北京山寨食品有限公司', '袋', 3.88, 6.33, 3);
INSERT INTO `goods` VALUES (6, '好吃点', '河北', '河北好吃点食品公司', '袋', 4.22, 5.21, 3);

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES (1, '水果');
INSERT INTO `goodstype` VALUES (2, '调味品');
INSERT INTO `goodstype` VALUES (3, '儿童食品');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodsuuid` bigint(20) NULL DEFAULT NULL,
  `storeuuid` bigint(20) NULL DEFAULT NULL,
  `num` bigint(20) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `checktime` datetime(0) NULL DEFAULT NULL,
  `creater` bigint(20) NULL DEFAULT NULL,
  `checker` bigint(20) NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menuname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menuid`) USING BTREE,
  INDEX `FKqcf9gem97gqa5qjm4d3elcqt5`(`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('0', '系统菜单', 'icon-sys', '-', '-1');
INSERT INTO `menu` VALUES ('100', '基础数据', 'icon-sys', '-', '0');
INSERT INTO `menu` VALUES ('101', '商品类型', 'icon-sys', 'goodstype.html', '100');
INSERT INTO `menu` VALUES ('102', '商品', 'icon-sys', 'goods.html', '100');
INSERT INTO `menu` VALUES ('105', '仓库', 'icon-sys', 'store.html', '100');
INSERT INTO `menu` VALUES ('200', '人事管理', 'icon-sys', '-', '0');
INSERT INTO `menu` VALUES ('201', '部门', 'icon-sys', 'dep.html', '200');
INSERT INTO `menu` VALUES ('202', '员工', 'icon-sys', 'emp.html', '200');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodsuuid` bigint(20) NULL DEFAULT NULL,
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `num` bigint(20) NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL,
  `endtime` datetime(0) NULL DEFAULT NULL,
  `ender` bigint(20) NULL DEFAULT NULL,
  `storeuuid` bigint(20) NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordersuuid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE,
  INDEX `FKkumkfd9mf9bcoeagj75pqk0vi`(`ordersuuid`) USING BTREE,
  CONSTRAINT `FKkumkfd9mf9bcoeagj75pqk0vi` FOREIGN KEY (`ordersuuid`) REFERENCES `orders` (`uuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `checktime` datetime(0) NULL DEFAULT NULL,
  `starttime` datetime(0) NULL DEFAULT NULL,
  `endtime` datetime(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creater` bigint(20) NULL DEFAULT NULL,
  `checker` bigint(20) NULL DEFAULT NULL,
  `starter` bigint(20) NULL DEFAULT NULL,
  `ender` bigint(20) NULL DEFAULT NULL,
  `supplieruuid` bigint(20) NULL DEFAULT NULL,
  `totalmoney` double NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `waybillsn` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for returnorderdetail
-- ----------------------------
DROP TABLE IF EXISTS `returnorderdetail`;
CREATE TABLE `returnorderdetail`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodsuuid` bigint(20) NULL DEFAULT NULL,
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `num` bigint(20) NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL,
  `endtime` datetime(0) NULL DEFAULT NULL,
  `ender` bigint(20) NULL DEFAULT NULL,
  `storeuuid` bigint(20) NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordersuuid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for returnorders
-- ----------------------------
DROP TABLE IF EXISTS `returnorders`;
CREATE TABLE `returnorders`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `checktime` datetime(0) NULL DEFAULT NULL,
  `endtime` datetime(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creater` bigint(20) NULL DEFAULT NULL,
  `checker` bigint(20) NULL DEFAULT NULL,
  `ender` bigint(20) NULL DEFAULT NULL,
  `supplieruuid` bigint(20) NULL DEFAULT NULL,
  `totalmoney` double NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `waybillsn` bigint(20) NULL DEFAULT NULL,
  `ordersuuid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `roleuuid` bigint(20) NULL DEFAULT NULL,
  `menuuuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `FKhws3dqd47l2mii7is3j8x4sx7`(`menuuuid`) USING BTREE,
  INDEX `FK854i0kl5dceay1baimdeg54w4`(`roleuuid`) USING BTREE,
  CONSTRAINT `FK854i0kl5dceay1baimdeg54w4` FOREIGN KEY (`roleuuid`) REFERENCES `role` (`uuid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhws3dqd47l2mii7is3j8x4sx7` FOREIGN KEY (`menuuuid`) REFERENCES `menu` (`menuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, '0');
INSERT INTO `role_menu` VALUES (1, '100');
INSERT INTO `role_menu` VALUES (1, '101');
INSERT INTO `role_menu` VALUES (1, '102');
INSERT INTO `role_menu` VALUES (1, '105');
INSERT INTO `role_menu` VALUES (1, '200');
INSERT INTO `role_menu` VALUES (1, '201');
INSERT INTO `role_menu` VALUES (1, '202');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empuuid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for storedetail
-- ----------------------------
DROP TABLE IF EXISTS `storedetail`;
CREATE TABLE `storedetail`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `storeuuid` bigint(20) NULL DEFAULT NULL,
  `goodsuuid` bigint(20) NULL DEFAULT NULL,
  `num` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for storeoper
-- ----------------------------
DROP TABLE IF EXISTS `storeoper`;
CREATE TABLE `storeoper`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `empuuid` bigint(20) NULL DEFAULT NULL,
  `opertime` datetime(0) NULL DEFAULT NULL,
  `storeuuid` bigint(20) NULL DEFAULT NULL,
  `goodsuuid` bigint(20) NULL DEFAULT NULL,
  `num` bigint(20) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tele` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for view_storealert
-- ----------------------------
DROP TABLE IF EXISTS `view_storealert`;
CREATE TABLE `view_storealert`  (
  `uuid` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storenum` bigint(20) NULL DEFAULT NULL,
  `outnum` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
