/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : easdb

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 15/12/2017 08:58:50
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '20170701', '2017-07-01', NULL, 3, 0, 0);
INSERT INTO `class` VALUES (2, '20161101', '2017-11-01', '2017-07-01', 2, 0, 1);
INSERT INTO `class` VALUES (3, '20160627', '2016-06-27', '2016-11-01', 1, 0, 1);
INSERT INTO `class` VALUES (4, '20141111', '2014-11-11', NULL, 1, 0, 0);
INSERT INTO `class` VALUES (5, '20170502', '2017-05-02', NULL, 2, 0, 0);
INSERT INTO `class` VALUES (6, '20170901', '2017-09-01', NULL, 1, 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classattendance
-- ----------------------------
INSERT INTO `classattendance` VALUES (30, 1, '20170701班第1次考勤记录', '82', '2017-11-02', 1);
INSERT INTO `classattendance` VALUES (31, 2, '20170701班第2次考勤记录', '73', '2017-12-01', 1);
INSERT INTO `classattendance` VALUES (32, 3, '20170701班第3次考勤记录', '64', '2017-12-01', 1);
INSERT INTO `classattendance` VALUES (33, 4, '20170701班第4次考勤记录', '100', '2017-12-01', 1);
INSERT INTO `classattendance` VALUES (34, 5, '20170701班第5次考勤记录', '91', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (35, 6, '20170701班第6次考勤记录', '100', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (36, 7, '20170701班第7次考勤记录', '100', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (37, 8, '20170701班第8次考勤记录', '91', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (38, 9, '20170701班第9次考勤记录', '91', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (39, 10, '20170701班第10次考勤记录', '91', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (40, 11, '20170701班第11次考勤记录', '91', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (41, 12, '20170701班第12次考勤记录', '91', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (42, 13, '20170701班第13次考勤记录', '91', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (43, 14, '20170701班第14次考勤记录', '91', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (44, 15, '20170701班第15次考勤记录', '91', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (45, 15, '20170701班第15次考勤记录', '91', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (46, 16, '20170701班第16次考勤记录', '91', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (47, 17, '20170701班第17次考勤记录', '100', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (48, 18, '20170701班第18次考勤记录', '91', '2017-12-03', 1);
INSERT INTO `classattendance` VALUES (49, 19, '20170701班第19次考勤记录', '100', '2017-12-04', 1);
INSERT INTO `classattendance` VALUES (50, 20, '20170701班第20次考勤记录', '100', '2017-12-04', 1);
INSERT INTO `classattendance` VALUES (51, 21, '20170701班第21次考勤记录', '91', '2017-12-04', 1);
INSERT INTO `classattendance` VALUES (52, 22, '20170701班第22次考勤记录', '91', '2017-12-04', 1);
INSERT INTO `classattendance` VALUES (53, 23, '20170701班第23次考勤记录', '64', '2017-12-05', 1);
INSERT INTO `classattendance` VALUES (54, 24, '20170701班第24次考勤记录', '91', '2017-12-05', 1);
INSERT INTO `classattendance` VALUES (55, 25, '20170701班第25次考勤记录', '91', '2017-12-05', 1);

-- ----------------------------
-- Table structure for classexam
-- ----------------------------
DROP TABLE IF EXISTS `classexam`;
CREATE TABLE `classexam`  (
  `ce_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ce_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级考试名',
  `class_id` int(11) NOT NULL COMMENT '考试班级id',
  `ce_examday` date NOT NULL COMMENT '开始时间',
  `ce_remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试说明（备注，考试范围之类的）',
  `se_id` int(11) NOT NULL COMMENT '1为自行安排的考试，其他为考试类型安排表的安排',
  `ce_createdate` datetime(0) NOT NULL COMMENT '创建时间',
  `ce_state` int(11) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`ce_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classexam
-- ----------------------------
INSERT INTO `classexam` VALUES (1, '20170701十二月份月考', 1, '2017-12-01', 'ssm框架内容1132312', 2, '2017-12-01 00:00:00', 0);
INSERT INTO `classexam` VALUES (2, '考试考试考试', 1, '2017-12-01', '江河湖海', 28, '2017-12-11 00:00:00', 0);
INSERT INTO `classexam` VALUES (3, '大饼', 1, '2017-12-05', '213213', 28, '2017-12-11 00:00:00', 0);
INSERT INTO `classexam` VALUES (4, '李金伟考试', 1, '2017-12-01', '不及格 挂科啊啊啊啊啊', 28, '2017-12-11 00:00:00', 0);
INSERT INTO `classexam` VALUES (5, 'ddd', 1, '2017-11-29', 'dasda ', 28, '2017-12-11 00:00:00', 0);
INSERT INTO `classexam` VALUES (6, 'ee', 1, '2017-12-03', 'eeee', 28, '2017-12-11 00:00:00', 0);
INSERT INTO `classexam` VALUES (7, 'asdasd', 1, '2017-12-06', 'hjkh ', 28, '2017-12-11 00:00:00', 0);

-- ----------------------------
-- Table structure for classscore
-- ----------------------------
DROP TABLE IF EXISTS `classscore`;
CREATE TABLE `classscore`  (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `ce_id` int(11) NOT NULL COMMENT '班级考试外键',
  `cs_wtavg` double NOT NULL COMMENT '笔试平均分',
  `cs_ctavg` double NOT NULL COMMENT '机试平均分',
  `cs_avg` double NOT NULL COMMENT '班级机试笔试平均分',
  `cs_createdate` datetime(0) NOT NULL COMMENT '创建时间',
  `cs_state` int(11) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`cs_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classscore
-- ----------------------------
INSERT INTO `classscore` VALUES (4, 1, 84.5, 86.25, 85.375, '2017-12-14 11:39:44', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classteacher
-- ----------------------------
INSERT INTO `classteacher` VALUES (1, 1, 1, 0, '班主任', '2017-08-27', NULL, 0);
INSERT INTO `classteacher` VALUES (2, 2, 4, 1, '主教员(java,离职)', '2017-07-01', '2017-07-01', 1);
INSERT INTO `classteacher` VALUES (3, 1, 2, 0, '主教员(java)', '2017-08-07', NULL, 1);
INSERT INTO `classteacher` VALUES (4, 1, 3, 0, '辅教员(过度)', '2017-07-01', '2017-08-07', 2);
INSERT INTO `classteacher` VALUES (5, 1, 3, 0, '辅教员(c#.net)', '2018-01-01', NULL, 2);
INSERT INTO `classteacher` VALUES (6, 1, 5, 1, '班主任', '2017-07-01', '2017-08-07', 1);
INSERT INTO `classteacher` VALUES (7, 3, 1, 1, '班主任', '2016-06-27', '2016-11-01', 0);
INSERT INTO `classteacher` VALUES (8, 2, 5, 0, '班主任', '2016-11-01', '2017-07-01', 0);
INSERT INTO `classteacher` VALUES (9, 5, 1, 0, '班主任', '2017-05-02', NULL, 0);
INSERT INTO `classteacher` VALUES (10, 6, 1, 0, '班主任', '2017-09-01', NULL, 0);

-- ----------------------------
-- Table structure for schoolexam
-- ----------------------------
DROP TABLE IF EXISTS `schoolexam`;
CREATE TABLE `schoolexam`  (
  `se_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id（1为固定的数 规定好为班内自行安排的考试）',
  `se_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '校级考试名',
  `se_startday` date NOT NULL COMMENT '开始参与考试日期',
  `se_stopday` date NOT NULL COMMENT '结束参与考试日期',
  `se_createby` int(11) NOT NULL COMMENT '创建人',
  `se_examtype` int(11) NOT NULL COMMENT '考试类型',
  `class_id` int(11) NOT NULL COMMENT '班级id(结业考试的班级 其他考试默认为0)',
  `se_createdate` datetime(0) NOT NULL COMMENT '创建时间',
  `se_state` int(11) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`se_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schoolexam
-- ----------------------------
INSERT INTO `schoolexam` VALUES (1, '班内考试', '2017-12-07', '2017-12-07', 1, 3, 0, '2017-12-07 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (2, '北大青鸟第1次月考', '2017-12-14', '2017-12-28', 1, 1, 0, '2017-12-07 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (3, '北大青鸟一月份月考', '2017-01-08', '2017-01-10', 1, 1, 0, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (4, 'bdqn20170615S1结业考试', '2017-12-06', '2017-12-07', 1, 2, 2, '2017-12-07 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (5, 'bdqn20160616S2模拟考试', '2017-07-07', '2017-07-07', 1, 1, 0, '2017-07-07 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (6, 'bdqn20170616S2结业考试', '2017-12-07', '2017-12-08', 0, 2, 1, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (7, 'bdqn20170616S2结业考试', '2017-02-25', '2017-02-26', 1, 2, 1, '2017-02-27 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (8, 'bdqn20170617S1结业考试', '2017-12-06', '2017-12-07', 0, 2, 1, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (9, 'bdqn20170618S1模拟考试', '2017-12-06', '2017-12-07', 1, 1, 1, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (10, 'bdqn20170618S1结业考试', '2017-12-07', '2017-12-08', 1, 1, 1, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (11, 'bdqn20170619S1小周考试', '2017-12-06', '2017-12-07', 1, 3, 1, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (12, 'bdqn20170619S1模拟考试', '2017-12-07', '2017-12-08', 1, 1, 1, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (13, 'bdqn20170620S1结业考试', '2017-12-06', '2017-12-07', 2, 2, 1, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (14, 'bdqn20170620S2模拟考试', '2017-12-06', '2017-12-08', 1, 2, 1, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (15, 'bdqn20170621S1模拟考试', '2017-12-05', '2017-12-06', 1, 2, 1, '2017-12-06 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (16, 'bdqn20170621S1结业考试', '2017-12-07', '2017-12-08', 1, 2, 1, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (17, 'bdqn20170622S1模拟考试', '2017-12-05', '2017-12-06', 1, 1, 1, '2017-12-07 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (18, 'bdqn20170622S1结业考试', '2017-12-07', '2017-12-08', 1, 2, 1, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (19, 'bdqn20170623S1其他考试', '2017-12-04', '2017-12-05', 1, 3, 1, '2017-12-06 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (20, 'bdqn20170623S1模拟考试', '2017-12-05', '2017-12-06', 1, 1, 1, '2017-12-07 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (21, 'bdqn20170621S1结业考试', '2017-12-07', '2017-12-08', 0, 2, 1, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (22, 'bdqn20170623S2模拟考试', '2017-12-04', '2017-12-05', 1, 1, 1, '2017-12-05 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (23, 'bdqn20170623S2结业考试', '2017-12-07', '2017-12-08', 1, 2, 1, '2017-12-08 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (24, 'bdqn20170625S1课堂小抽查', '2017-12-04', '2017-12-05', 1, 3, 1, '2017-12-05 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (25, 'bdqn20170625S1模拟考试', '2017-12-06', '2017-12-07', 1, 1, 1, '2017-12-07 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (26, '北大青鸟测试', '2017-12-07', '2017-12-07', 1, 1, 1, '2017-12-07 00:00:00', 0);
INSERT INTO `schoolexam` VALUES (27, '北大擒拿', '2017-11-29', '2017-12-01', 1, 1, 0, '2017-12-11 00:00:00', 1);
INSERT INTO `schoolexam` VALUES (28, '北大青鸟结业测试数据', '2017-12-01', '2017-12-12', 1, 2, 4, '2017-12-11 00:00:00', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`stu_id`) USING BTREE,
  UNIQUE INDEX `uq_stu_no`(`stu_no`) USING BTREE COMMENT '学生学号唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES (1, '李金伟', '070101', 1, '1998-01-27', '15751735395', '徐州贾汪', '2016-06-27', '15050014361(母亲)', '320305199801270814', '大专', '1311353736@qq.com', 0, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (2, '郑庆坤', '070102', 1, '1995-03-03', '15752152152', '徐州贾汪', '2016-06-27', '15712121221(穆', '320305199701270814', '大专', '13113537326@qq.com', 0, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (3, '华中好', '070103', 1, '1995-03-03', '15752152152', '徐州贾汪', '2016-06-27', '15712187888(母亲)', '320305199701270814', '大专', '13113537326@qq.com', 0, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (4, '傻逼', '070104', 1, '1996-01-05', '15752152152', '徐州沛县', '2016-06-27', '15712187888(母亲)', '320305199401270814', '高中', '121213537326@qq.com', 0, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (5, '智力', '070105', 1, '1999-05-09', '15752152152', '徐州大雾', '2016-06-27', '13812187888(母亲)', '320305199701270814', '大专', '15953537326@qq.com', 0, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (6, '真理', '070106', 1, '1998-08-02', '15752152152', '徐州孙宁', '2016-06-27', '15712145888(母亲)', '320305199701270814', '大学', '13112127326@qq.com', 0, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (7, '哈哈', '070107', 1, '1997-03-09', '15752152152', '徐州贾汪', '2016-06-27', '15712187888(母亲)', '320305199701270814', '大专', '98983537326@qq.com', 0, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (8, '老司机', '070108', 1, '1996-05-03', '15752152152', '徐州云龙', '2016-06-27', '18912187888(母亲)', '320305199701270814', '初中', '12023537326@qq.com', 0, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (9, '付雪眼', '070109', 0, '1995-12-03', '15752152152', '徐州实力', '2016-06-27', '13012187888(母亲)', '320305199701270814', '大专', '15693537326@qq.com', 0, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (10, '刘长乐', '070110', 1, '1995-11-08', '15752152152', '徐州贾汪', '2016-06-27', '15812187888(母亲)', '320305199701270814', '大学', '131135123326@qq.com', 0, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (11, '帝景涛', '070111', 1, '1995-03-12', '15752152152', '徐州贾汪', '2016-06-27', '15012187888(母亲)', '320305199701270814', '大专', '2323537326@qq.com', 0, 0, '2017-11-15', 1);
INSERT INTO `stu` VALUES (12, '张强', '070112', 1, '1992-05-10', '15107890545', '徐州泉山区', '2017-07-01', '15905201236 (父亲)', '320322199404069674', '大专', '4398577628@qq.com', 0, 0, '2017-11-27', 1);
INSERT INTO `stu` VALUES (13, '张媛媛', '0701002', 0, '1993-05-10', '13812656775', '徐州泉山区', '2017-07-01', '13976869214(父亲)', '320322199404069674', '高中', '529568417@qq.com', 0, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (14, '萧蔷', '0701003', 0, '1992-05-10', '15852414895', '徐州贾汪', '2017-07-01', '13755789254(母亲)', '320322199404069674', '大专', '586575755@qq.com', 0, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (15, '李晨', '0701004', 1, '1992-05-10', '15386857411', '徐州云龙区', '2017-07-01', '13512459675(父亲)', '320322199404069674', '高中', '4585473254@qq.com', 0, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (16, '李彬彬', '0701005', 1, '1992-05-10', '15366865811', '徐州云龙区', '2017-07-01', '13512459652(父亲)', '320322199404069674', '高中', '6934751454@qq.com', 0, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (17, '赵晨', '0701006', 1, '1992-05-10', '18613576789', '徐州鼓楼区', '2017-07-01', '13813655446(母亲)', '320322199404069674', '大专', '69355745@qq.com', 0, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (18, '赵丽媛', '0701007', 0, '1992-05-10', '13605603569', '徐州贾汪', '2017-07-01', '13713465889(父亲)', '320322199404069674', '大专', '1329115869@qq.com', 0, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (19, '林芝', '0701008', 0, '1992-05-10', '18712662233', '徐州泉山区', '2017-07-01', '15106990512(母亲)', '320322199404069674', '大专', '136952442@qq.com', 0, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (20, '王微微', '0701009', 0, '1992-05-10', '18226586965', '徐州鼓楼区', '2017-07-01', '152965626358(母亲)', '320322199404069674', '高中', '138569241@qq.com', 0, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (21, '黄安', '0701111', 1, '1992-05-10', '13956526258', '徐州鼓楼区', '2017-07-01', '15815641325(父亲)', '320322199404069674', '高中', '114569354@qq.com', 0, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (22, '赵杰', '0701011', 1, '1992-05-10', '13652414659', '徐州云龙区', '2017-07-01', '15693569682(父亲)', '320322199404069674', '高中', '15695721474@qq.com', 0, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (23, '王强', '0701012', 1, '1992-05-10', '15256336567', '徐州泉山区', '2017-07-01', '15702145569(父亲)', '320322199404069674', '大专', '223658941@qq.com', 0, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (24, '韩丹丹', '0701013', 1, '1992-05-10', '15627654321', '徐州泉山区', '2017-07-01', '15702110306(父亲)', '320322199404069674', '大专', '56586922@qq.com', 0, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (25, '韩光', '0701014', 1, '1992-05-10', '15692442528', '徐州贾汪', '2017-07-01', '1588050698(父亲', '320322199404069674', '大专', '529685294@qq.com', 1, 0, '2017-11-27', 4);
INSERT INTO `stu` VALUES (26, '李忠伟', '0701015', 1, '1992-05-10', '15625245452', '徐州云龙区', '2017-07-01', '15242145245(父亲)', '320322199404069674', '大专', '158624245@qq.com', 0, 0, '2017-11-27', 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 628 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stuattendance
-- ----------------------------
INSERT INTO `stuattendance` VALUES (342, 1, 2, '2017-11-02', 1, 30);
INSERT INTO `stuattendance` VALUES (343, 2, 2, '2017-11-02', 1, 30);
INSERT INTO `stuattendance` VALUES (344, 3, 1, '2017-11-02', 1, 30);
INSERT INTO `stuattendance` VALUES (345, 4, 1, '2017-11-02', 1, 30);
INSERT INTO `stuattendance` VALUES (346, 5, 1, '2017-11-02', 1, 30);
INSERT INTO `stuattendance` VALUES (347, 6, 1, '2017-11-02', 1, 30);
INSERT INTO `stuattendance` VALUES (348, 7, 1, '2017-11-02', 1, 30);
INSERT INTO `stuattendance` VALUES (349, 8, 1, '2017-11-02', 1, 30);
INSERT INTO `stuattendance` VALUES (350, 9, 1, '2017-11-02', 1, 30);
INSERT INTO `stuattendance` VALUES (351, 10, 1, '2017-11-02', 1, 30);
INSERT INTO `stuattendance` VALUES (352, 11, 1, '2017-11-02', 1, 30);
INSERT INTO `stuattendance` VALUES (353, 1, 2, '2017-12-01', 1, 31);
INSERT INTO `stuattendance` VALUES (354, 2, 2, '2017-12-01', 1, 31);
INSERT INTO `stuattendance` VALUES (355, 3, 2, '2017-12-01', 1, 31);
INSERT INTO `stuattendance` VALUES (356, 4, 1, '2017-12-01', 1, 31);
INSERT INTO `stuattendance` VALUES (357, 5, 1, '2017-12-01', 1, 31);
INSERT INTO `stuattendance` VALUES (358, 6, 1, '2017-12-01', 1, 31);
INSERT INTO `stuattendance` VALUES (359, 7, 1, '2017-12-01', 1, 31);
INSERT INTO `stuattendance` VALUES (360, 8, 1, '2017-12-01', 1, 31);
INSERT INTO `stuattendance` VALUES (361, 9, 1, '2017-12-01', 1, 31);
INSERT INTO `stuattendance` VALUES (362, 10, 1, '2017-12-01', 1, 31);
INSERT INTO `stuattendance` VALUES (363, 11, 1, '2017-12-01', 1, 31);
INSERT INTO `stuattendance` VALUES (364, 1, 2, '2017-12-01', 1, 32);
INSERT INTO `stuattendance` VALUES (365, 2, 2, '2017-12-01', 1, 32);
INSERT INTO `stuattendance` VALUES (366, 3, 2, '2017-12-01', 1, 32);
INSERT INTO `stuattendance` VALUES (367, 4, 2, '2017-12-01', 1, 32);
INSERT INTO `stuattendance` VALUES (368, 5, 1, '2017-12-01', 1, 32);
INSERT INTO `stuattendance` VALUES (369, 6, 1, '2017-12-01', 1, 32);
INSERT INTO `stuattendance` VALUES (370, 7, 1, '2017-12-01', 1, 32);
INSERT INTO `stuattendance` VALUES (371, 8, 1, '2017-12-01', 1, 32);
INSERT INTO `stuattendance` VALUES (372, 9, 1, '2017-12-01', 1, 32);
INSERT INTO `stuattendance` VALUES (373, 10, 1, '2017-12-01', 1, 32);
INSERT INTO `stuattendance` VALUES (374, 11, 1, '2017-12-01', 1, 32);
INSERT INTO `stuattendance` VALUES (375, 1, 1, '2017-12-01', 1, 33);
INSERT INTO `stuattendance` VALUES (376, 2, 1, '2017-12-01', 1, 33);
INSERT INTO `stuattendance` VALUES (377, 3, 1, '2017-12-01', 1, 33);
INSERT INTO `stuattendance` VALUES (378, 4, 1, '2017-12-01', 1, 33);
INSERT INTO `stuattendance` VALUES (379, 5, 1, '2017-12-01', 1, 33);
INSERT INTO `stuattendance` VALUES (380, 6, 1, '2017-12-01', 1, 33);
INSERT INTO `stuattendance` VALUES (381, 7, 1, '2017-12-01', 1, 33);
INSERT INTO `stuattendance` VALUES (382, 8, 1, '2017-12-01', 1, 33);
INSERT INTO `stuattendance` VALUES (383, 9, 1, '2017-12-01', 1, 33);
INSERT INTO `stuattendance` VALUES (384, 10, 1, '2017-12-01', 1, 33);
INSERT INTO `stuattendance` VALUES (385, 11, 1, '2017-12-01', 1, 33);
INSERT INTO `stuattendance` VALUES (386, 1, 2, '2017-12-03', 1, 34);
INSERT INTO `stuattendance` VALUES (387, 2, 1, '2017-12-03', 1, 34);
INSERT INTO `stuattendance` VALUES (388, 3, 1, '2017-12-03', 1, 34);
INSERT INTO `stuattendance` VALUES (389, 4, 1, '2017-12-03', 1, 34);
INSERT INTO `stuattendance` VALUES (390, 5, 1, '2017-12-03', 1, 34);
INSERT INTO `stuattendance` VALUES (391, 6, 1, '2017-12-03', 1, 34);
INSERT INTO `stuattendance` VALUES (392, 7, 1, '2017-12-03', 1, 34);
INSERT INTO `stuattendance` VALUES (393, 8, 1, '2017-12-03', 1, 34);
INSERT INTO `stuattendance` VALUES (394, 9, 1, '2017-12-03', 1, 34);
INSERT INTO `stuattendance` VALUES (395, 10, 1, '2017-12-03', 1, 34);
INSERT INTO `stuattendance` VALUES (396, 11, 1, '2017-12-03', 1, 34);
INSERT INTO `stuattendance` VALUES (397, 1, 1, '2017-12-03', 1, 35);
INSERT INTO `stuattendance` VALUES (398, 2, 1, '2017-12-03', 1, 35);
INSERT INTO `stuattendance` VALUES (399, 3, 1, '2017-12-03', 1, 35);
INSERT INTO `stuattendance` VALUES (400, 4, 1, '2017-12-03', 1, 35);
INSERT INTO `stuattendance` VALUES (401, 5, 1, '2017-12-03', 1, 35);
INSERT INTO `stuattendance` VALUES (402, 6, 1, '2017-12-03', 1, 35);
INSERT INTO `stuattendance` VALUES (403, 7, 1, '2017-12-03', 1, 35);
INSERT INTO `stuattendance` VALUES (404, 8, 1, '2017-12-03', 1, 35);
INSERT INTO `stuattendance` VALUES (405, 9, 1, '2017-12-03', 1, 35);
INSERT INTO `stuattendance` VALUES (406, 10, 1, '2017-12-03', 1, 35);
INSERT INTO `stuattendance` VALUES (407, 11, 1, '2017-12-03', 1, 35);
INSERT INTO `stuattendance` VALUES (408, 1, 1, '2017-12-03', 1, 36);
INSERT INTO `stuattendance` VALUES (409, 2, 1, '2017-12-03', 1, 36);
INSERT INTO `stuattendance` VALUES (410, 3, 1, '2017-12-03', 1, 36);
INSERT INTO `stuattendance` VALUES (411, 4, 1, '2017-12-03', 1, 36);
INSERT INTO `stuattendance` VALUES (412, 5, 1, '2017-12-03', 1, 36);
INSERT INTO `stuattendance` VALUES (413, 6, 1, '2017-12-03', 1, 36);
INSERT INTO `stuattendance` VALUES (414, 7, 1, '2017-12-03', 1, 36);
INSERT INTO `stuattendance` VALUES (415, 8, 1, '2017-12-03', 1, 36);
INSERT INTO `stuattendance` VALUES (416, 9, 1, '2017-12-03', 1, 36);
INSERT INTO `stuattendance` VALUES (417, 10, 1, '2017-12-03', 1, 36);
INSERT INTO `stuattendance` VALUES (418, 11, 1, '2017-12-03', 1, 36);
INSERT INTO `stuattendance` VALUES (419, 1, 1, '2017-12-03', 1, 37);
INSERT INTO `stuattendance` VALUES (420, 2, 2, '2017-12-03', 1, 37);
INSERT INTO `stuattendance` VALUES (421, 3, 1, '2017-12-03', 1, 37);
INSERT INTO `stuattendance` VALUES (422, 4, 1, '2017-12-03', 1, 37);
INSERT INTO `stuattendance` VALUES (423, 5, 1, '2017-12-03', 1, 37);
INSERT INTO `stuattendance` VALUES (424, 6, 1, '2017-12-03', 1, 37);
INSERT INTO `stuattendance` VALUES (425, 7, 1, '2017-12-03', 1, 37);
INSERT INTO `stuattendance` VALUES (426, 8, 1, '2017-12-03', 1, 37);
INSERT INTO `stuattendance` VALUES (427, 9, 1, '2017-12-03', 1, 37);
INSERT INTO `stuattendance` VALUES (428, 10, 1, '2017-12-03', 1, 37);
INSERT INTO `stuattendance` VALUES (429, 11, 1, '2017-12-03', 1, 37);
INSERT INTO `stuattendance` VALUES (430, 1, 1, '2017-12-03', 1, 38);
INSERT INTO `stuattendance` VALUES (431, 2, 2, '2017-12-03', 1, 38);
INSERT INTO `stuattendance` VALUES (432, 3, 1, '2017-12-03', 1, 38);
INSERT INTO `stuattendance` VALUES (433, 4, 1, '2017-12-03', 1, 38);
INSERT INTO `stuattendance` VALUES (434, 5, 1, '2017-12-03', 1, 38);
INSERT INTO `stuattendance` VALUES (435, 6, 1, '2017-12-03', 1, 38);
INSERT INTO `stuattendance` VALUES (436, 7, 1, '2017-12-03', 1, 38);
INSERT INTO `stuattendance` VALUES (437, 8, 1, '2017-12-03', 1, 38);
INSERT INTO `stuattendance` VALUES (438, 9, 1, '2017-12-03', 1, 38);
INSERT INTO `stuattendance` VALUES (439, 10, 1, '2017-12-03', 1, 38);
INSERT INTO `stuattendance` VALUES (440, 11, 1, '2017-12-03', 1, 38);
INSERT INTO `stuattendance` VALUES (441, 1, 1, '2017-12-03', 1, 39);
INSERT INTO `stuattendance` VALUES (442, 2, 1, '2017-12-03', 1, 39);
INSERT INTO `stuattendance` VALUES (443, 3, 2, '2017-12-03', 1, 39);
INSERT INTO `stuattendance` VALUES (444, 4, 1, '2017-12-03', 1, 39);
INSERT INTO `stuattendance` VALUES (445, 5, 1, '2017-12-03', 1, 39);
INSERT INTO `stuattendance` VALUES (446, 6, 1, '2017-12-03', 1, 39);
INSERT INTO `stuattendance` VALUES (447, 7, 1, '2017-12-03', 1, 39);
INSERT INTO `stuattendance` VALUES (448, 8, 1, '2017-12-03', 1, 39);
INSERT INTO `stuattendance` VALUES (449, 9, 1, '2017-12-03', 1, 39);
INSERT INTO `stuattendance` VALUES (450, 10, 1, '2017-12-03', 1, 39);
INSERT INTO `stuattendance` VALUES (451, 11, 1, '2017-12-03', 1, 39);
INSERT INTO `stuattendance` VALUES (452, 1, 1, '2017-12-03', 1, 40);
INSERT INTO `stuattendance` VALUES (453, 2, 1, '2017-12-03', 1, 40);
INSERT INTO `stuattendance` VALUES (454, 3, 1, '2017-12-03', 1, 40);
INSERT INTO `stuattendance` VALUES (455, 4, 1, '2017-12-03', 1, 40);
INSERT INTO `stuattendance` VALUES (456, 5, 2, '2017-12-03', 1, 40);
INSERT INTO `stuattendance` VALUES (457, 6, 1, '2017-12-03', 1, 40);
INSERT INTO `stuattendance` VALUES (458, 7, 1, '2017-12-03', 1, 40);
INSERT INTO `stuattendance` VALUES (459, 8, 1, '2017-12-03', 1, 40);
INSERT INTO `stuattendance` VALUES (460, 9, 1, '2017-12-03', 1, 40);
INSERT INTO `stuattendance` VALUES (461, 10, 1, '2017-12-03', 1, 40);
INSERT INTO `stuattendance` VALUES (462, 11, 1, '2017-12-03', 1, 40);
INSERT INTO `stuattendance` VALUES (463, 1, 1, '2017-12-03', 1, 41);
INSERT INTO `stuattendance` VALUES (464, 2, 1, '2017-12-03', 1, 41);
INSERT INTO `stuattendance` VALUES (465, 3, 1, '2017-12-03', 1, 41);
INSERT INTO `stuattendance` VALUES (466, 4, 1, '2017-12-03', 1, 41);
INSERT INTO `stuattendance` VALUES (467, 5, 1, '2017-12-03', 1, 41);
INSERT INTO `stuattendance` VALUES (468, 6, 2, '2017-12-03', 1, 41);
INSERT INTO `stuattendance` VALUES (469, 7, 1, '2017-12-03', 1, 41);
INSERT INTO `stuattendance` VALUES (470, 8, 1, '2017-12-03', 1, 41);
INSERT INTO `stuattendance` VALUES (471, 9, 1, '2017-12-03', 1, 41);
INSERT INTO `stuattendance` VALUES (472, 10, 1, '2017-12-03', 1, 41);
INSERT INTO `stuattendance` VALUES (473, 11, 1, '2017-12-03', 1, 41);
INSERT INTO `stuattendance` VALUES (474, 1, 1, '2017-12-03', 1, 42);
INSERT INTO `stuattendance` VALUES (475, 2, 1, '2017-12-03', 1, 42);
INSERT INTO `stuattendance` VALUES (476, 3, 1, '2017-12-03', 1, 42);
INSERT INTO `stuattendance` VALUES (477, 4, 2, '2017-12-03', 1, 42);
INSERT INTO `stuattendance` VALUES (478, 5, 1, '2017-12-03', 1, 42);
INSERT INTO `stuattendance` VALUES (479, 6, 1, '2017-12-03', 1, 42);
INSERT INTO `stuattendance` VALUES (480, 7, 1, '2017-12-03', 1, 42);
INSERT INTO `stuattendance` VALUES (481, 8, 1, '2017-12-03', 1, 42);
INSERT INTO `stuattendance` VALUES (482, 9, 1, '2017-12-03', 1, 42);
INSERT INTO `stuattendance` VALUES (483, 10, 1, '2017-12-03', 1, 42);
INSERT INTO `stuattendance` VALUES (484, 11, 1, '2017-12-03', 1, 42);
INSERT INTO `stuattendance` VALUES (485, 1, 1, '2017-12-03', 1, 43);
INSERT INTO `stuattendance` VALUES (486, 2, 1, '2017-12-03', 1, 43);
INSERT INTO `stuattendance` VALUES (487, 3, 1, '2017-12-03', 1, 43);
INSERT INTO `stuattendance` VALUES (488, 4, 1, '2017-12-03', 1, 43);
INSERT INTO `stuattendance` VALUES (489, 5, 1, '2017-12-03', 1, 43);
INSERT INTO `stuattendance` VALUES (490, 6, 1, '2017-12-03', 1, 43);
INSERT INTO `stuattendance` VALUES (491, 7, 1, '2017-12-03', 1, 43);
INSERT INTO `stuattendance` VALUES (492, 8, 2, '2017-12-03', 1, 43);
INSERT INTO `stuattendance` VALUES (493, 9, 1, '2017-12-03', 1, 43);
INSERT INTO `stuattendance` VALUES (494, 10, 1, '2017-12-03', 1, 43);
INSERT INTO `stuattendance` VALUES (495, 11, 1, '2017-12-03', 1, 43);
INSERT INTO `stuattendance` VALUES (496, 1, 1, '2017-12-03', 1, 44);
INSERT INTO `stuattendance` VALUES (497, 2, 1, '2017-12-03', 1, 44);
INSERT INTO `stuattendance` VALUES (498, 3, 1, '2017-12-03', 1, 44);
INSERT INTO `stuattendance` VALUES (499, 4, 1, '2017-12-03', 1, 44);
INSERT INTO `stuattendance` VALUES (500, 5, 1, '2017-12-03', 1, 44);
INSERT INTO `stuattendance` VALUES (501, 6, 1, '2017-12-03', 1, 44);
INSERT INTO `stuattendance` VALUES (502, 7, 2, '2017-12-03', 1, 44);
INSERT INTO `stuattendance` VALUES (503, 8, 1, '2017-12-03', 1, 44);
INSERT INTO `stuattendance` VALUES (504, 9, 1, '2017-12-03', 1, 44);
INSERT INTO `stuattendance` VALUES (505, 10, 1, '2017-12-03', 1, 44);
INSERT INTO `stuattendance` VALUES (506, 11, 1, '2017-12-03', 1, 44);
INSERT INTO `stuattendance` VALUES (507, 1, 1, '2017-12-03', 1, 45);
INSERT INTO `stuattendance` VALUES (508, 2, 1, '2017-12-03', 1, 45);
INSERT INTO `stuattendance` VALUES (509, 3, 1, '2017-12-03', 1, 45);
INSERT INTO `stuattendance` VALUES (510, 4, 1, '2017-12-03', 1, 45);
INSERT INTO `stuattendance` VALUES (511, 5, 1, '2017-12-03', 1, 45);
INSERT INTO `stuattendance` VALUES (512, 6, 1, '2017-12-03', 1, 45);
INSERT INTO `stuattendance` VALUES (513, 7, 2, '2017-12-03', 1, 45);
INSERT INTO `stuattendance` VALUES (514, 8, 1, '2017-12-03', 1, 45);
INSERT INTO `stuattendance` VALUES (515, 9, 1, '2017-12-03', 1, 45);
INSERT INTO `stuattendance` VALUES (516, 10, 1, '2017-12-03', 1, 45);
INSERT INTO `stuattendance` VALUES (517, 11, 1, '2017-12-03', 1, 45);
INSERT INTO `stuattendance` VALUES (518, 1, 1, '2017-12-03', 1, 46);
INSERT INTO `stuattendance` VALUES (519, 2, 1, '2017-12-03', 1, 46);
INSERT INTO `stuattendance` VALUES (520, 3, 1, '2017-12-03', 1, 46);
INSERT INTO `stuattendance` VALUES (521, 4, 1, '2017-12-03', 1, 46);
INSERT INTO `stuattendance` VALUES (522, 5, 1, '2017-12-03', 1, 46);
INSERT INTO `stuattendance` VALUES (523, 6, 1, '2017-12-03', 1, 46);
INSERT INTO `stuattendance` VALUES (524, 7, 2, '2017-12-03', 1, 46);
INSERT INTO `stuattendance` VALUES (525, 8, 1, '2017-12-03', 1, 46);
INSERT INTO `stuattendance` VALUES (526, 9, 1, '2017-12-03', 1, 46);
INSERT INTO `stuattendance` VALUES (527, 10, 1, '2017-12-03', 1, 46);
INSERT INTO `stuattendance` VALUES (528, 11, 1, '2017-12-03', 1, 46);
INSERT INTO `stuattendance` VALUES (529, 1, 1, '2017-12-03', 1, 47);
INSERT INTO `stuattendance` VALUES (530, 2, 1, '2017-12-03', 1, 47);
INSERT INTO `stuattendance` VALUES (531, 3, 1, '2017-12-03', 1, 47);
INSERT INTO `stuattendance` VALUES (532, 4, 1, '2017-12-03', 1, 47);
INSERT INTO `stuattendance` VALUES (533, 5, 1, '2017-12-03', 1, 47);
INSERT INTO `stuattendance` VALUES (534, 6, 1, '2017-12-03', 1, 47);
INSERT INTO `stuattendance` VALUES (535, 7, 1, '2017-12-03', 1, 47);
INSERT INTO `stuattendance` VALUES (536, 8, 1, '2017-12-03', 1, 47);
INSERT INTO `stuattendance` VALUES (537, 9, 1, '2017-12-03', 1, 47);
INSERT INTO `stuattendance` VALUES (538, 10, 1, '2017-12-03', 1, 47);
INSERT INTO `stuattendance` VALUES (539, 11, 1, '2017-12-03', 1, 47);
INSERT INTO `stuattendance` VALUES (540, 1, 1, '2017-12-03', 1, 48);
INSERT INTO `stuattendance` VALUES (541, 2, 1, '2017-12-03', 1, 48);
INSERT INTO `stuattendance` VALUES (542, 3, 1, '2017-12-03', 1, 48);
INSERT INTO `stuattendance` VALUES (543, 4, 1, '2017-12-03', 1, 48);
INSERT INTO `stuattendance` VALUES (544, 5, 1, '2017-12-03', 1, 48);
INSERT INTO `stuattendance` VALUES (545, 6, 1, '2017-12-03', 1, 48);
INSERT INTO `stuattendance` VALUES (546, 7, 1, '2017-12-03', 1, 48);
INSERT INTO `stuattendance` VALUES (547, 8, 1, '2017-12-03', 1, 48);
INSERT INTO `stuattendance` VALUES (548, 9, 2, '2017-12-03', 1, 48);
INSERT INTO `stuattendance` VALUES (549, 10, 1, '2017-12-03', 1, 48);
INSERT INTO `stuattendance` VALUES (550, 11, 1, '2017-12-03', 1, 48);
INSERT INTO `stuattendance` VALUES (551, 1, 1, '2017-12-04', 1, 49);
INSERT INTO `stuattendance` VALUES (552, 2, 1, '2017-12-04', 1, 49);
INSERT INTO `stuattendance` VALUES (553, 3, 1, '2017-12-04', 1, 49);
INSERT INTO `stuattendance` VALUES (554, 4, 1, '2017-12-04', 1, 49);
INSERT INTO `stuattendance` VALUES (555, 5, 1, '2017-12-04', 1, 49);
INSERT INTO `stuattendance` VALUES (556, 6, 1, '2017-12-04', 1, 49);
INSERT INTO `stuattendance` VALUES (557, 7, 1, '2017-12-04', 1, 49);
INSERT INTO `stuattendance` VALUES (558, 8, 1, '2017-12-04', 1, 49);
INSERT INTO `stuattendance` VALUES (559, 9, 1, '2017-12-04', 1, 49);
INSERT INTO `stuattendance` VALUES (560, 10, 1, '2017-12-04', 1, 49);
INSERT INTO `stuattendance` VALUES (561, 11, 1, '2017-12-04', 1, 49);
INSERT INTO `stuattendance` VALUES (562, 1, 1, '2017-12-04', 1, 50);
INSERT INTO `stuattendance` VALUES (563, 2, 1, '2017-12-04', 1, 50);
INSERT INTO `stuattendance` VALUES (564, 3, 1, '2017-12-04', 1, 50);
INSERT INTO `stuattendance` VALUES (565, 4, 1, '2017-12-04', 1, 50);
INSERT INTO `stuattendance` VALUES (566, 5, 1, '2017-12-04', 1, 50);
INSERT INTO `stuattendance` VALUES (567, 6, 1, '2017-12-04', 1, 50);
INSERT INTO `stuattendance` VALUES (568, 7, 1, '2017-12-04', 1, 50);
INSERT INTO `stuattendance` VALUES (569, 8, 1, '2017-12-04', 1, 50);
INSERT INTO `stuattendance` VALUES (570, 9, 1, '2017-12-04', 1, 50);
INSERT INTO `stuattendance` VALUES (571, 10, 1, '2017-12-04', 1, 50);
INSERT INTO `stuattendance` VALUES (572, 11, 1, '2017-12-04', 1, 50);
INSERT INTO `stuattendance` VALUES (573, 1, 1, '2017-12-04', 1, 51);
INSERT INTO `stuattendance` VALUES (574, 2, 5, '2017-12-04', 1, 51);
INSERT INTO `stuattendance` VALUES (575, 3, 1, '2017-12-04', 1, 51);
INSERT INTO `stuattendance` VALUES (576, 4, 1, '2017-12-04', 1, 51);
INSERT INTO `stuattendance` VALUES (577, 5, 1, '2017-12-04', 1, 51);
INSERT INTO `stuattendance` VALUES (578, 6, 1, '2017-12-04', 1, 51);
INSERT INTO `stuattendance` VALUES (579, 7, 1, '2017-12-04', 1, 51);
INSERT INTO `stuattendance` VALUES (580, 8, 1, '2017-12-04', 1, 51);
INSERT INTO `stuattendance` VALUES (581, 9, 1, '2017-12-04', 1, 51);
INSERT INTO `stuattendance` VALUES (582, 10, 1, '2017-12-04', 1, 51);
INSERT INTO `stuattendance` VALUES (583, 11, 1, '2017-12-04', 1, 51);
INSERT INTO `stuattendance` VALUES (584, 1, 1, '2017-12-04', 1, 52);
INSERT INTO `stuattendance` VALUES (585, 2, 1, '2017-12-04', 1, 52);
INSERT INTO `stuattendance` VALUES (586, 3, 1, '2017-12-04', 1, 52);
INSERT INTO `stuattendance` VALUES (587, 4, 1, '2017-12-04', 1, 52);
INSERT INTO `stuattendance` VALUES (588, 5, 1, '2017-12-04', 1, 52);
INSERT INTO `stuattendance` VALUES (589, 6, 1, '2017-12-04', 1, 52);
INSERT INTO `stuattendance` VALUES (590, 7, 1, '2017-12-04', 1, 52);
INSERT INTO `stuattendance` VALUES (591, 8, 1, '2017-12-04', 1, 52);
INSERT INTO `stuattendance` VALUES (592, 9, 1, '2017-12-04', 1, 52);
INSERT INTO `stuattendance` VALUES (593, 10, 2, '2017-12-04', 1, 52);
INSERT INTO `stuattendance` VALUES (594, 11, 1, '2017-12-04', 1, 52);
INSERT INTO `stuattendance` VALUES (595, 1, 2, '2017-12-05', 1, 53);
INSERT INTO `stuattendance` VALUES (596, 2, 1, '2017-12-05', 1, 53);
INSERT INTO `stuattendance` VALUES (597, 3, 2, '2017-12-05', 1, 53);
INSERT INTO `stuattendance` VALUES (598, 4, 1, '2017-12-05', 1, 53);
INSERT INTO `stuattendance` VALUES (599, 5, 2, '2017-12-05', 1, 53);
INSERT INTO `stuattendance` VALUES (600, 6, 1, '2017-12-05', 1, 53);
INSERT INTO `stuattendance` VALUES (601, 7, 2, '2017-12-05', 1, 53);
INSERT INTO `stuattendance` VALUES (602, 8, 1, '2017-12-05', 1, 53);
INSERT INTO `stuattendance` VALUES (603, 9, 1, '2017-12-05', 1, 53);
INSERT INTO `stuattendance` VALUES (604, 10, 1, '2017-12-05', 1, 53);
INSERT INTO `stuattendance` VALUES (605, 11, 1, '2017-12-05', 1, 53);
INSERT INTO `stuattendance` VALUES (606, 1, 1, '2017-12-05', 1, 54);
INSERT INTO `stuattendance` VALUES (607, 2, 1, '2017-12-05', 1, 54);
INSERT INTO `stuattendance` VALUES (608, 3, 2, '2017-12-05', 1, 54);
INSERT INTO `stuattendance` VALUES (609, 4, 1, '2017-12-05', 1, 54);
INSERT INTO `stuattendance` VALUES (610, 5, 1, '2017-12-05', 1, 54);
INSERT INTO `stuattendance` VALUES (611, 6, 1, '2017-12-05', 1, 54);
INSERT INTO `stuattendance` VALUES (612, 7, 1, '2017-12-05', 1, 54);
INSERT INTO `stuattendance` VALUES (613, 8, 1, '2017-12-05', 1, 54);
INSERT INTO `stuattendance` VALUES (614, 9, 1, '2017-12-05', 1, 54);
INSERT INTO `stuattendance` VALUES (615, 10, 1, '2017-12-05', 1, 54);
INSERT INTO `stuattendance` VALUES (616, 11, 1, '2017-12-05', 1, 54);
INSERT INTO `stuattendance` VALUES (617, 1, 2, '2017-12-05', 1, 55);
INSERT INTO `stuattendance` VALUES (618, 2, 1, '2017-12-05', 1, 55);
INSERT INTO `stuattendance` VALUES (619, 3, 1, '2017-12-05', 1, 55);
INSERT INTO `stuattendance` VALUES (620, 4, 1, '2017-12-05', 1, 55);
INSERT INTO `stuattendance` VALUES (621, 5, 1, '2017-12-05', 1, 55);
INSERT INTO `stuattendance` VALUES (622, 6, 1, '2017-12-05', 1, 55);
INSERT INTO `stuattendance` VALUES (623, 7, 1, '2017-12-05', 1, 55);
INSERT INTO `stuattendance` VALUES (624, 8, 1, '2017-12-05', 1, 55);
INSERT INTO `stuattendance` VALUES (625, 9, 1, '2017-12-05', 1, 55);
INSERT INTO `stuattendance` VALUES (626, 10, 1, '2017-12-05', 1, 55);
INSERT INTO `stuattendance` VALUES (627, 11, 1, '2017-12-05', 1, 55);

-- ----------------------------
-- Table structure for stuleave
-- ----------------------------
DROP TABLE IF EXISTS `stuleave`;
CREATE TABLE `stuleave`  (
  `stuleave_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `stuleave_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `stuleave_state` int(255) DEFAULT NULL,
  `stuleave_day` date DEFAULT NULL,
  PRIMARY KEY (`stuleave_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stuleave
-- ----------------------------
INSERT INTO `stuleave` VALUES (9, 1, 1, '倒萨倒萨嗡嗡嗡', 0, '2017-11-02');
INSERT INTO `stuleave` VALUES (10, 2, 1, '12121', 0, '2017-11-02');
INSERT INTO `stuleave` VALUES (11, 1, 1, '4545455', 0, '2017-12-01');
INSERT INTO `stuleave` VALUES (12, 2, 1, '请假', 1, '2017-12-01');
INSERT INTO `stuleave` VALUES (13, 3, 1, '请假', 1, '2017-12-01');
INSERT INTO `stuleave` VALUES (14, 4, 1, '请假', 1, '2017-12-01');
INSERT INTO `stuleave` VALUES (15, 1, 1, '请假', 0, '2017-12-03');
INSERT INTO `stuleave` VALUES (16, 2, 1, '请假', 0, '2017-12-03');
INSERT INTO `stuleave` VALUES (17, 3, 1, '请假', 0, '2017-12-03');
INSERT INTO `stuleave` VALUES (18, 5, 1, '请假', 1, '2017-12-03');
INSERT INTO `stuleave` VALUES (19, 6, 1, '请假', 0, '2017-12-03');
INSERT INTO `stuleave` VALUES (20, 4, 1, '请假', 0, '2017-12-03');
INSERT INTO `stuleave` VALUES (21, 8, 1, '请假', 1, '2017-12-03');
INSERT INTO `stuleave` VALUES (24, 7, 1, '请假', 1, '2017-12-03');
INSERT INTO `stuleave` VALUES (25, 9, 1, '请假', 1, '2017-12-03');
INSERT INTO `stuleave` VALUES (26, 1, 1, '长的帅就想请假', 0, '2017-12-04');
INSERT INTO `stuleave` VALUES (27, 1, 1, '就想请假', 0, '2017-12-04');
INSERT INTO `stuleave` VALUES (28, 1, 1, '1212', 1, '2017-12-05');
INSERT INTO `stuleave` VALUES (30, 1, 1, '的撒打算', 0, '2017-12-05');
INSERT INTO `stuleave` VALUES (31, 1, 1, '杀杀杀', 0, '2017-12-05');
INSERT INTO `stuleave` VALUES (32, 1, 1, '烦烦烦', 0, '2017-12-05');
INSERT INTO `stuleave` VALUES (33, 1, 1, '顶顶顶', 0, '2017-12-05');
INSERT INTO `stuleave` VALUES (34, 3, 1, '请假', 1, '2017-12-05');
INSERT INTO `stuleave` VALUES (35, 5, 1, '请假', 1, '2017-12-05');
INSERT INTO `stuleave` VALUES (36, 7, 1, '请假', 1, '2017-12-05');

-- ----------------------------
-- Table structure for stuscore
-- ----------------------------
DROP TABLE IF EXISTS `stuscore`;
CREATE TABLE `stuscore`  (
  `stuc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `ce_id` int(11) NOT NULL COMMENT '班级考试表外键（参加的哪场班级考试）',
  `stu_id` int(11) NOT NULL COMMENT '学生外键',
  `stuc_wtscores` double NOT NULL COMMENT '笔试外键',
  `stuc_ctscores` double NOT NULL COMMENT '机试外键',
  `stuc_avgscores` double NOT NULL COMMENT '个人平均分',
  `stuc_createdate` datetime(0) NOT NULL COMMENT '创建时间',
  `stuc_state` int(11) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`stuc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stuscore
-- ----------------------------
INSERT INTO `stuscore` VALUES (43, 1, 1, 80, 90, 85, '2017-12-14 11:39:44', 0);
INSERT INTO `stuscore` VALUES (44, 1, 2, 90, 87, 88.5, '2017-12-14 11:39:44', 0);
INSERT INTO `stuscore` VALUES (45, 1, 3, 87, 89, 88, '2017-12-14 11:39:44', 0);
INSERT INTO `stuscore` VALUES (46, 1, 4, 80, 82, 81, '2017-12-14 11:39:44', 0);
INSERT INTO `stuscore` VALUES (47, 1, 5, 84, 85, 84.5, '2017-12-14 11:39:44', 0);
INSERT INTO `stuscore` VALUES (48, 1, 6, 79, 80, 79.5, '2017-12-14 11:39:44', 0);
INSERT INTO `stuscore` VALUES (49, 1, 7, 85, 86, 85.5, '2017-12-14 11:39:44', 0);
INSERT INTO `stuscore` VALUES (50, 1, 8, 92, 91, 91.5, '2017-12-14 11:39:44', 0);
INSERT INTO `stuscore` VALUES (51, 1, 9, 89, 88, 88.5, '2017-12-14 11:39:44', 0);
INSERT INTO `stuscore` VALUES (52, 1, 10, 87, 90, 88.5, '2017-12-14 11:39:44', 0);
INSERT INTO `stuscore` VALUES (53, 1, 11, 85, 83, 84, '2017-12-14 11:39:44', 0);
INSERT INTO `stuscore` VALUES (54, 1, 12, 76, 84, 80, '2017-12-14 11:39:44', 0);

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
INSERT INTO `stutotalscore` VALUES (1, 1, 102, 1);
INSERT INTO `stutotalscore` VALUES (2, 2, 103, 1);
INSERT INTO `stutotalscore` VALUES (3, 3, 111, 1);
INSERT INTO `stutotalscore` VALUES (4, 4, 121, 1);
INSERT INTO `stutotalscore` VALUES (5, 5, 128, 1);
INSERT INTO `stutotalscore` VALUES (6, 6, 125, 1);
INSERT INTO `stutotalscore` VALUES (7, 7, 126, 1);
INSERT INTO `stutotalscore` VALUES (8, 8, 132, 1);
INSERT INTO `stutotalscore` VALUES (9, 9, 138, 1);
INSERT INTO `stutotalscore` VALUES (10, 10, 139, 1);
INSERT INTO `stutotalscore` VALUES (11, 11, 137, 1);

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
INSERT INTO `teacher` VALUES (1, 'aa', 0);
INSERT INTO `teacher` VALUES (2, '澄江', 1);
INSERT INTO `teacher` VALUES (3, '周生光', 1);
INSERT INTO `teacher` VALUES (4, 'green', 1);
INSERT INTO `teacher` VALUES (5, '朱清', 0);
INSERT INTO `teacher` VALUES (6, '张琦', 0);

SET FOREIGN_KEY_CHECKS = 1;
