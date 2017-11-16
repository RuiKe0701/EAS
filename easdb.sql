/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : easdb

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-11-16 10:22:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 主键,自增',
  `class_name` varchar(20) NOT NULL COMMENT '班级名称',
  `class_startday` date NOT NULL COMMENT '开班日期',
  `class_stopday` date DEFAULT NULL COMMENT '结束日期',
  `grade_id` int(11) NOT NULL COMMENT '年级',
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '20170701', '2017-07-01', null, '3');

-- ----------------------------
-- Table structure for `classteacher`
-- ----------------------------
DROP TABLE IF EXISTS `classteacher`;
CREATE TABLE `classteacher` (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `class_id` int(255) NOT NULL COMMENT '外键，班级表',
  `teacher_id` int(11) NOT NULL COMMENT '外键，老师表',
  `status` int(255) NOT NULL COMMENT '信息状态 (0当前档案，其他为备份状态)',
  `remarks` varchar(20) DEFAULT NULL COMMENT '备注',
  `ct_startday` date NOT NULL COMMENT '开始日期',
  `ct_stopday` date NOT NULL COMMENT '结束日期',
  `ct_type` int(255) NOT NULL COMMENT '老师类型(1为主教,0为副教)',
  PRIMARY KEY (`ct_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of classteacher
-- ----------------------------

-- ----------------------------
-- Table structure for `stu`
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `stu_name` varchar(50) NOT NULL COMMENT '姓名',
  `stu_no` varchar(20) NOT NULL COMMENT '学号',
  `stu_sex` int(11) NOT NULL COMMENT '性别(0女,1男)',
  `stu_birthday` date NOT NULL COMMENT '出生日期',
  `stu_phone` varchar(20) NOT NULL COMMENT '手机号',
  `stu_address` varchar(250) NOT NULL COMMENT '地址',
  `stu_startday` date NOT NULL COMMENT '入学日期',
  `stu_parentphone` varchar(50) DEFAULT NULL COMMENT '家长电话 如：15751735395(父亲：郑庆坤)',
  `stu_carde` varchar(18) NOT NULL COMMENT '身份证',
  `stu_education` varchar(10) DEFAULT NULL COMMENT '学历',
  `stu_email` varchar(50) DEFAULT NULL COMMENT '青鸟账号(邮箱)',
  `stu_state` int(255) NOT NULL COMMENT '在校状态  (在校为1，离校为0)',
  `status` int(255) NOT NULL COMMENT '信息状态 (0当前档案，其他为备份状态)',
  `crateday` date NOT NULL COMMENT '创建时间',
  `class_id` int(11) NOT NULL COMMENT '班级主键，外键班级表主键',
  PRIMARY KEY (`stu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES ('1', '李金伟', '070101', '1', '1998-01-27', '15751735395', '徐州贾汪', '2016-06-27', '15050014361(母亲)', '320305199801270814', '大专', '1311353736@qq.com', '0', '0', '2017-11-15', '1');
INSERT INTO `stu` VALUES ('2', '郑庆坤', '070102', '1', '1995-03-03', '15752152152', '徐州贾汪', '2016-06-27', '15712121221(穆青)', '320305199701270814', '大专', '13113537326@qq.com', '0', '0', '2017-11-15', '1');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `th_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增',
  `th_name` varchar(20) NOT NULL COMMENT '老师姓名',
  `th_type` int(255) NOT NULL COMMENT '老师的类型(教员,班主任,教质部主任,学术部主任)',
  PRIMARY KEY (`th_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
