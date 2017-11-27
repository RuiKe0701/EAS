/*
 Navicat MySQL Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : aa

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 27/11/2017 19:16:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 主键,自增',
  `class_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  `class_startday` date NOT NULL COMMENT '开班日期',
  `class_stopday` date DEFAULT NULL COMMENT '结束日期',
  `grade_id` int(11) NOT NULL COMMENT '年级',
  `status` int(11) NOT NULL,
  `class_state` int(11) NOT NULL,
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '20170701', '2017-07-01', NULL, 3, 0, 0);
INSERT INTO `class` VALUES (2, '20161101', '2017-11-01', '2017-07-01', 2, 0, 1);
INSERT INTO `class` VALUES (3, '20160627', '2016-06-27', '2016-11-01', 1, 0, 1);
INSERT INTO `class` VALUES (4, '20141111', '2014-11-11', NULL, 1, 0, 0);

-- ----------------------------
-- Table structure for classattendance
-- ----------------------------
DROP TABLE IF EXISTS `classattendance`;
CREATE TABLE `classattendance`  (
  `cad_id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_number` int(11) NOT NULL,
  `cad_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cad_rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cad_date` date NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`cad_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classattendance
-- ----------------------------
INSERT INTO `classattendance` VALUES (1, 1, '20170701班级第1次点名', '80%', '2017-11-23', 1);
INSERT INTO `classattendance` VALUES (2, 2, '20170701班级第2次点名', '80%', '2017-11-23', 1);
INSERT INTO `classattendance` VALUES (3, 3, '哈哈哈哈', '82%', '2017-11-27', 1);
INSERT INTO `classattendance` VALUES (5, 4, '哈哈哈哈', '64%', '2017-11-27', 1);
INSERT INTO `classattendance` VALUES (8, 5, '哈哈哈哈', '91%', '2017-11-27', 1);

-- ----------------------------
-- Table structure for classstu
-- ----------------------------
DROP TABLE IF EXISTS `classstu`;
CREATE TABLE `classstu`  (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`sc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classstu
-- ----------------------------
INSERT INTO `classstu` VALUES (1, 1, 1);
INSERT INTO `classstu` VALUES (2, 2, 1);
INSERT INTO `classstu` VALUES (3, 3, 1);
INSERT INTO `classstu` VALUES (4, 4, 1);
INSERT INTO `classstu` VALUES (5, 5, 1);
INSERT INTO `classstu` VALUES (6, 6, 1);
INSERT INTO `classstu` VALUES (7, 7, 1);
INSERT INTO `classstu` VALUES (8, 8, 1);
INSERT INTO `classstu` VALUES (9, 9, 1);
INSERT INTO `classstu` VALUES (10, 10, 1);
INSERT INTO `classstu` VALUES (11, 11, 1);
INSERT INTO `classstu` VALUES (12, 1, 2);
INSERT INTO `classstu` VALUES (13, 2, 2);
INSERT INTO `classstu` VALUES (14, 3, 2);
INSERT INTO `classstu` VALUES (15, 4, 2);
INSERT INTO `classstu` VALUES (16, 5, 2);
INSERT INTO `classstu` VALUES (17, 6, 2);
INSERT INTO `classstu` VALUES (18, 7, 2);
INSERT INTO `classstu` VALUES (19, 8, 2);
INSERT INTO `classstu` VALUES (20, 9, 2);
INSERT INTO `classstu` VALUES (21, 10, 2);
INSERT INTO `classstu` VALUES (22, 11, 2);
INSERT INTO `classstu` VALUES (23, 1, 3);
INSERT INTO `classstu` VALUES (24, 2, 3);
INSERT INTO `classstu` VALUES (25, 4, 3);
INSERT INTO `classstu` VALUES (26, 5, 3);
INSERT INTO `classstu` VALUES (27, 3, 3);
INSERT INTO `classstu` VALUES (28, 6, 3);
INSERT INTO `classstu` VALUES (29, 7, 3);
INSERT INTO `classstu` VALUES (30, 8, 3);
INSERT INTO `classstu` VALUES (31, 9, 3);
INSERT INTO `classstu` VALUES (32, 10, 3);
INSERT INTO `classstu` VALUES (33, 11, 3);

-- ----------------------------
-- Table structure for classteacher
-- ----------------------------
DROP TABLE IF EXISTS `classteacher`;
CREATE TABLE `classteacher`  (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `class_id` int(255) NOT NULL COMMENT '外键，班级表',
  `teacher_id` int(11) NOT NULL COMMENT '外键，老师表',
  `status` int(255) NOT NULL COMMENT '信息状态 (0当前档案，其他为备份状态)',
  `remarks` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `ct_startday` date NOT NULL COMMENT '开始日期',
  `ct_stopday` date DEFAULT NULL COMMENT '结束日期',
  `ct_type` int(255) NOT NULL COMMENT '老师类型(1为主教,0为副教)',
  PRIMARY KEY (`ct_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classteacher
-- ----------------------------
INSERT INTO `classteacher` VALUES (1, 1, 1, 0, '班主任', '2017-08-27', NULL, 0);
INSERT INTO `classteacher` VALUES (2, 2, 4, 1, '主教员(java,离职)', '2017-07-01', '2017-07-01', 1);
INSERT INTO `classteacher` VALUES (3, 1, 2, 0, '主教员(java)', '2017-08-07', NULL, 1);
INSERT INTO `classteacher` VALUES (4, 1, 3, 0, '辅教员(过度)', '2017-07-01', '2017-08-07', 2);
INSERT INTO `classteacher` VALUES (5, 1, 3, 0, '辅教员(c#.net)', '2018-01-01', NULL, 2);
INSERT INTO `classteacher` VALUES (6, 1, 5, 1, '班主任', '2017-07-01', '2017-08-07', 1);
INSERT INTO `classteacher` VALUES (7, 3, 1, 0, '班主任', '2016-06-27', '2016-11-01', 0);
INSERT INTO `classteacher` VALUES (8, 2, 5, 0, '班主任', '2016-11-01', '2017-07-01', 0);

-- ----------------------------
-- Table structure for scoringstandard
-- ----------------------------
DROP TABLE IF EXISTS `scoringstandard`;
CREATE TABLE `scoringstandard`  (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ss_fraction` int(11) NOT NULL,
  `ss_way` int(11) NOT NULL,
  `ss_createby` int(11) NOT NULL,
  `ss_createdate` date NOT NULL,
  `ss_type` int(11) NOT NULL,
  PRIMARY KEY (`ss_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scoringstandard
-- ----------------------------
INSERT INTO `scoringstandard` VALUES (1, '正常', 1, 1, 1, '2017-11-22', 0);
INSERT INTO `scoringstandard` VALUES (2, '请假', 1, 0, 1, '2017-11-22', 0);
INSERT INTO `scoringstandard` VALUES (3, '迟到', 2, 0, 1, '2017-11-22', 0);
INSERT INTO `scoringstandard` VALUES (4, '旷课', 3, 0, 1, '2017-11-22', 0);
INSERT INTO `scoringstandard` VALUES (5, '早退', 1, 0, 1, '2017-11-22', 0);

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu`  (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `stu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `stu_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `stu_sex` int(11) NOT NULL COMMENT '性别(0女,1男)',
  `stu_birthday` date NOT NULL COMMENT '出生日期',
  `stu_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `stu_address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `stu_startday` date NOT NULL COMMENT '入学日期',
  `stu_parentphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '家长电话 如：15751735395(父亲：郑庆坤)',
  `stu_carde` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `stu_education` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学历',
  `stu_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '青鸟账号(邮箱)',
  `stu_state` int(255) NOT NULL COMMENT '在校状态  (在校为1，离校为0)',
  `status` int(255) NOT NULL COMMENT '信息状态 (0当前档案，其他为备份状态)',
  `crateday` date NOT NULL COMMENT '创建时间',
  `class_id` int(11) DEFAULT NULL COMMENT '班级主键，外键班级表主键',
  PRIMARY KEY (`stu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES (1, '李金伟', '070101', 1, '1998-01-27', '15751735395', '徐州贾汪', '2016-06-27', '15050014361(母亲)', '320305199801270814', '大专', '1311353736@qq.com', 0, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (2, '郑庆坤', '070102', 1, '1995-03-03', '15752152152', '徐州贾汪', '2016-06-27', '15712121221(穆', '320305199701270814', '大专', '13113537326@qq.com', 1, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (3, '华中好', '070103', 1, '1995-03-03', '15752152152', '徐州贾汪', '2016-06-27', '15712187888(母亲)', '320305199701270814', '大专', '13113537326@qq.com', 1, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (4, '傻逼', '070104', 1, '1996-01-05', '15752152152', '徐州沛县', '2016-06-27', '15712187888(母亲)', '320305199401270814', '高中', '121213537326@qq.com', 1, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (5, '智力', '070105', 1, '1999-05-09', '15752152152', '徐州大雾', '2016-06-27', '13812187888(母亲)', '320305199701270814', '大专', '15953537326@qq.com', 1, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (6, '真理', '070106', 1, '1998-08-02', '15752152152', '徐州孙宁', '2016-06-27', '15712145888(母亲)', '320305199701270814', '大学', '13112127326@qq.com', 1, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (7, '哈哈', '070107', 1, '1997-03-09', '15752152152', '徐州贾汪', '2016-06-27', '15712187888(母亲)', '320305199701270814', '大专', '98983537326@qq.com', 1, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (8, '老司机', '070108', 1, '1996-05-03', '15752152152', '徐州云龙', '2016-06-27', '18912187888(母亲)', '320305199701270814', '初中', '12023537326@qq.com', 1, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (9, '付雪眼', '070109', 0, '1995-12-03', '15752152152', '徐州实力', '2016-06-27', '13012187888(母亲)', '320305199701270814', '大专', '15693537326@qq.com', 1, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (10, '刘长乐', '0701010', 1, '1995-11-08', '15752152152', '徐州贾汪', '2016-06-27', '15812187888(母亲)', '320305199701270814', '大学', '131135123326@qq.com', 1, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (11, '帝景涛', '0701011', 1, '1995-03-12', '15752152152', '徐州贾汪', '2016-06-27', '15012187888(母亲)', '320305199701270814', '大专', '2323537326@qq.com', 1, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (12, '张强', '0701001', 1, '1992-05-10', '15107890545', '徐州泉山区', '2017-07-01', '15905201236 (父亲)', '320322199404069674', '大专', '4398577628@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (13, '张媛媛', '0701002', 0, '1993-05-10', '13812656775', '徐州泉山区', '2017-07-01', '13976869214(父亲)', '320322199404069674', '高中', '529568417@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (14, '萧蔷', '0701003', 0, '1992-05-10', '15852414895', '徐州贾汪', '2017-07-01', '13755789254(母亲)', '320322199404069674', '大专', '586575755@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (15, '李晨', '0701004', 1, '1992-05-10', '15386857411', '徐州云龙区', '2017-07-01', '13512459675(父亲)', '320322199404069674', '高中', '4585473254@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (16, '李彬彬', '0701005', 1, '1992-05-10', '15366865811', '徐州云龙区', '2017-07-01', '13512459652(父亲)', '320322199404069674', '高中', '6934751454@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (17, '赵晨', '0701006', 1, '1992-05-10', '18613576789', '徐州鼓楼区', '2017-07-01', '13813655446(母亲)', '320322199404069674', '大专', '69355745@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (18, '赵丽媛', '0701007', 0, '1992-05-10', '13605603569', '徐州贾汪', '2017-07-01', '13713465889(父亲)', '320322199404069674', '大专', '1329115869@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (19, '林芝', '0701008', 0, '1992-05-10', '18712662233', '徐州泉山区', '2017-07-01', '15106990512(母亲)', '320322199404069674', '大专', '136952442@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (20, '王微微', '0701009', 0, '1992-05-10', '18226586965', '徐州鼓楼区', '2017-07-01', '152965626358(母亲)', '320322199404069674', '高中', '138569241@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (21, '黄安', '0701010', 1, '1992-05-10', '13956526258', '徐州鼓楼区', '2017-07-01', '15815641325(父亲)', '320322199404069674', '高中', '114569354@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (22, '赵杰', '0701011', 1, '1992-05-10', '13652414659', '徐州云龙区', '2017-07-01', '15693569682(父亲)', '320322199404069674', '高中', '15695721474@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (23, '王强', '0701012', 1, '1992-05-10', '15256336567', '徐州泉山区', '2017-07-01', '15702145569(父亲)', '320322199404069674', '大专', '223658941@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (24, '韩丹丹', '0701013', 1, '1992-05-10', '15627654321', '徐州泉山区', '2017-07-01', '15702110306(父亲)', '320322199404069674', '大专', '56586922@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (25, '韩光', '0701014', 1, '1992-05-10', '15692442528', '徐州贾汪', '2017-07-01', '1588050698(父亲', '320322199404069674', '大专', '529685294@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (26, '李忠伟', '0701015', 1, '1992-05-10', '15625245452', '徐州云龙区', '2017-07-01', '15242145245(父亲)', '320322199404069674', '大专', '158624245@qq.com', 1, 0, '2017-11-27', 4);

-- ----------------------------
-- Table structure for stuattendance
-- ----------------------------
DROP TABLE IF EXISTS `stuattendance`;
CREATE TABLE `stuattendance`  (
  `sad_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL,
  `ss_id` int(11) NOT NULL,
  `sad_recorddate` date NOT NULL,
  `class_id` int(11) NOT NULL,
  `cad_id` int(11) NOT NULL,
  PRIMARY KEY (`sad_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stuattendance
-- ----------------------------
INSERT INTO `stuattendance` VALUES (1, 1, 3, '2017-11-27', 1, 3);
INSERT INTO `stuattendance` VALUES (2, 2, 1, '2017-11-27', 1, 3);
INSERT INTO `stuattendance` VALUES (3, 3, 1, '2017-11-27', 1, 3);
INSERT INTO `stuattendance` VALUES (4, 4, 1, '2017-11-27', 1, 3);
INSERT INTO `stuattendance` VALUES (5, 5, 1, '2017-11-27', 1, 3);
INSERT INTO `stuattendance` VALUES (6, 6, 1, '2017-11-27', 1, 3);
INSERT INTO `stuattendance` VALUES (7, 7, 4, '2017-11-27', 1, 3);
INSERT INTO `stuattendance` VALUES (8, 8, 1, '2017-11-27', 1, 3);
INSERT INTO `stuattendance` VALUES (9, 9, 1, '2017-11-27', 1, 3);
INSERT INTO `stuattendance` VALUES (10, 10, 1, '2017-11-27', 1, 3);
INSERT INTO `stuattendance` VALUES (11, 11, 1, '2017-11-27', 1, 3);
INSERT INTO `stuattendance` VALUES (100, 1, 1, '2017-11-27', 1, 1);
INSERT INTO `stuattendance` VALUES (101, 2, 1, '2017-11-27', 1, 1);
INSERT INTO `stuattendance` VALUES (102, 3, 1, '2017-11-27', 1, 1);
INSERT INTO `stuattendance` VALUES (103, 4, 1, '2017-11-27', 1, 1);
INSERT INTO `stuattendance` VALUES (104, 5, 1, '2017-11-27', 1, 1);
INSERT INTO `stuattendance` VALUES (105, 6, 1, '2017-11-27', 1, 1);
INSERT INTO `stuattendance` VALUES (106, 7, 1, '2017-11-27', 1, 1);
INSERT INTO `stuattendance` VALUES (107, 8, 1, '2017-11-27', 1, 1);
INSERT INTO `stuattendance` VALUES (108, 9, 1, '2017-11-27', 1, 1);
INSERT INTO `stuattendance` VALUES (109, 10, 1, '2017-11-27', 1, 1);
INSERT INTO `stuattendance` VALUES (110, 11, 1, '2017-11-27', 1, 1);

-- ----------------------------
-- Table structure for stutotalscore
-- ----------------------------
DROP TABLE IF EXISTS `stutotalscore`;
CREATE TABLE `stutotalscore`  (
  `sts_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL,
  `stu_totalscore` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`sts_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stutotalscore
-- ----------------------------
INSERT INTO `stutotalscore` VALUES (1, 1, 78, 1);
INSERT INTO `stutotalscore` VALUES (2, 2, 87, 1);
INSERT INTO `stutotalscore` VALUES (3, 3, 87, 1);
INSERT INTO `stutotalscore` VALUES (4, 4, 93, 1);
INSERT INTO `stutotalscore` VALUES (5, 5, 91, 1);
INSERT INTO `stutotalscore` VALUES (6, 6, 91, 1);
INSERT INTO `stutotalscore` VALUES (7, 7, 92, 1);
INSERT INTO `stutotalscore` VALUES (8, 8, 91, 1);
INSERT INTO `stutotalscore` VALUES (9, 9, 95, 1);
INSERT INTO `stutotalscore` VALUES (10, 10, 96, 1);
INSERT INTO `stutotalscore` VALUES (11, 11, 92, 1);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `th_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增',
  `th_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '老师姓名',
  `th_type` int(255) NOT NULL COMMENT '老师的类型(教员,班主任,教质部主任,学术部主任)',
  PRIMARY KEY (`th_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'aa', 1);
INSERT INTO `teacher` VALUES (2, '澄江', 2);
INSERT INTO `teacher` VALUES (3, '周生光', 2);
INSERT INTO `teacher` VALUES (4, 'green', 2);
INSERT INTO `teacher` VALUES (5, '朱清', 1);
INSERT INTO `teacher` VALUES (6, '张琦', 1);

SET FOREIGN_KEY_CHECKS = 1;
