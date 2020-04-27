/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50506
Source Host           : localhost:3306
Source Database       : warehouse

Target Server Type    : MYSQL
Target Server Version : 50506
File Encoding         : 65001

Date: 2020-04-11 22:54:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hibernate_sequence`
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for `messageinfo`
-- ----------------------------
DROP TABLE IF EXISTS `messageinfo`;
CREATE TABLE `messageinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `msg` varchar(255) DEFAULT NULL COMMENT '信息反馈',
  `createtime` datetime DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of messageinfo
-- ----------------------------
INSERT INTO `messageinfo` VALUES ('1', 'test', '2019-12-01 20:30:41');
INSERT INTO `messageinfo` VALUES ('2', '请添加哥布林，1号仓库员工如是说到！', '2020-02-02 21:59:07');

-- ----------------------------
-- Table structure for `productinfo`
-- ----------------------------
DROP TABLE IF EXISTS `productinfo`;
CREATE TABLE `productinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `productname` varchar(255) DEFAULT NULL COMMENT '名称',
  `warehousename` varchar(255) DEFAULT NULL,
  `suppliername` varchar(255) DEFAULT NULL,
  `price` double(255,0) DEFAULT NULL COMMENT '价格',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `intro` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` varchar(255) DEFAULT NULL COMMENT '出入/库状态',
  `createtime` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of productinfo
-- ----------------------------
INSERT INTO `productinfo` VALUES ('1', '电饭锅', '4号仓库', '拼多多', '199', '100', '家用物品', '-1', '2020-02-08 20:22:39');

-- ----------------------------
-- Table structure for `requestinfo`
-- ----------------------------
DROP TABLE IF EXISTS `requestinfo`;
CREATE TABLE `requestinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `productname` varchar(255) DEFAULT NULL COMMENT '名称',
  `warehousename` varchar(255) DEFAULT NULL COMMENT '仓库',
  `suppliername` varchar(255) DEFAULT NULL COMMENT '供应商',
  `price` double(11,0) DEFAULT NULL COMMENT '价格',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `operating` varchar(255) DEFAULT NULL COMMENT '出/入库操作',
  `intro` varchar(255) DEFAULT NULL COMMENT '类别',
  `msg` varchar(255) DEFAULT NULL COMMENT '备注',
  `createtime` datetime DEFAULT NULL COMMENT '提交时间',
  `status` int(11) DEFAULT NULL COMMENT '处理状态',
  `dealtime` datetime DEFAULT NULL COMMENT '操作时间',
  `statuscheck` int(11) DEFAULT NULL COMMENT '工单状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of requestinfo
-- ----------------------------
INSERT INTO `requestinfo` VALUES ('1', '货柜', '1号仓库', '京东', '200', '20', '出库', '大宗物品', '无', '2020-02-08 20:02:53', null, '2020-02-08 20:02:53', null);
INSERT INTO `requestinfo` VALUES ('2', '盐酸（氯化氢）', '2号仓库', '淘宝', '50', '20', '入库', '工业用品', '新进货物', '2020-02-08 20:03:47', '1', '2020-02-08 20:14:51', '1');
INSERT INTO `requestinfo` VALUES ('3', '钉锤', '3号仓库', '五金用品', '25', '20', '出库', '五金用品', '商户购买', '2020-02-08 20:04:46', '-1', '2020-02-08 20:15:07', '1');
INSERT INTO `requestinfo` VALUES ('4', '卷尺', '3号仓库', '五金用品', '15', '30', '入库', '五金用品', '库存充足，无需购入！', '2020-02-08 20:06:19', '2', '2020-02-08 20:15:33', '1');
INSERT INTO `requestinfo` VALUES ('5', '电饭锅', '4号仓库', '拼多多', '199', '100', '出库', '家用物品', '私人批量购买', '2020-02-08 20:06:51', '1', '2020-02-08 20:15:51', '1');
INSERT INTO `requestinfo` VALUES ('6', 'pvc管', '3号仓库', '五金用品', '40', '200', '出库', '五金', '无', '2020-02-08 20:12:27', '0', '2020-02-08 20:15:56', null);

-- ----------------------------
-- Table structure for `stockinfo`
-- ----------------------------
DROP TABLE IF EXISTS `stockinfo`;
CREATE TABLE `stockinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `warehouseid` int(11) DEFAULT NULL COMMENT '所属仓库',
  `supplierid` int(11) DEFAULT NULL COMMENT '所属供应商',
  `price` varchar(255) DEFAULT NULL COMMENT '价格',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `sort` varchar(255) DEFAULT NULL COMMENT '类别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of stockinfo
-- ----------------------------
INSERT INTO `stockinfo` VALUES ('1', '货柜', '1', '1', '200', '999', '大宗物品');
INSERT INTO `stockinfo` VALUES ('2', '服务器机架', '1', '1', '199', '999', '大宗物品');
INSERT INTO `stockinfo` VALUES ('3', '中号水箱', '1', '2', '238', '999', '大宗物品');
INSERT INTO `stockinfo` VALUES ('4', '甲醇', '2', '2', '100', '999', '工业甲醇');
INSERT INTO `stockinfo` VALUES ('5', '盐酸（氯化氢）', '2', '2', '50', '100', '工业用品');
INSERT INTO `stockinfo` VALUES ('6', '钉锤', '3', '3', '25', '999', '五金用品');
INSERT INTO `stockinfo` VALUES ('7', '卷尺', '3', '3', '15', '999', '五金用品');
INSERT INTO `stockinfo` VALUES ('8', '螺丝刀', '3', '3', '10', '999', '五金用品');
INSERT INTO `stockinfo` VALUES ('9', '电钻', '3', '3', '100', '200', '五金用品');
INSERT INTO `stockinfo` VALUES ('10', '水龙头', '3', '3', '20', '999', '五金用品');
INSERT INTO `stockinfo` VALUES ('11', 'pvc管', '3', '3', '40', '999', '五金用品');
INSERT INTO `stockinfo` VALUES ('12', '扫把', '4', '4', '10', '999', '家用物品');
INSERT INTO `stockinfo` VALUES ('13', '电饭锅', '4', '4', '199', '500', '家用物品');

-- ----------------------------
-- Table structure for `supplierinfo`
-- ----------------------------
DROP TABLE IF EXISTS `supplierinfo`;
CREATE TABLE `supplierinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `suppliername` varchar(255) DEFAULT NULL COMMENT '供应商',
  `supplier` varchar(255) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `intro` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of supplierinfo
-- ----------------------------
INSERT INTO `supplierinfo` VALUES ('1', '京东', '大强子', '13988888888', '自营');
INSERT INTO `supplierinfo` VALUES ('2', '淘宝', '马云', '15555555555', '天猫');
INSERT INTO `supplierinfo` VALUES ('3', '五金用品', '小强子', '13988888810', '五金电器');
INSERT INTO `supplierinfo` VALUES ('4', '拼多多', '联系人暂无', '15855555555', '百亿补贴');

-- ----------------------------
-- Table structure for `syslog`
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(255) DEFAULT NULL COMMENT '操作',
  `method` varchar(255) DEFAULT NULL COMMENT '方法名',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `createtime` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2341 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('104', null, 'com.sw.warehouse.controller.LoginController.login', '登陆', null, '127.0.0.1', '2020-01-20 00:00:00');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL COMMENT '姓名',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `idnumber` varchar(255) DEFAULT '' COMMENT '身份证',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `role` varchar(255) DEFAULT NULL COMMENT '角色',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `intro` varchar(255) DEFAULT NULL COMMENT '备注',
  `entrytime` date DEFAULT NULL COMMENT '入职时间',
  `createtime` datetime DEFAULT NULL COMMENT '记录添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'admin', 'banner/admin.jpg', '男', 'admin', '1838888888', '云南省,昆明市,西山区', '1', 'admin', '系统管理员', '2019-12-01', '2019-12-08 19:16:32');
INSERT INTO `userinfo` VALUES ('2', '张三', 'http://localhost:8088/upload/user/58b6fb6c-f719-4123-8348-e9c1263a7a08.jpg', '男', '533222199999999999', '13988855888', '北京,市辖区,东城区', '0', '123456', '高级技工', '2019-12-02', '2020-02-08 19:47:15');
INSERT INTO `userinfo` VALUES ('3', '李明', 'http://localhost:8088/upload/user/955f6460-d88c-45d1-870e-2a015a9b0ece.jpg', '男', '533222199999999999', '18988888788', '上海,市辖区,黄浦区', '0', '123456', '高级技工', '2019-12-02', '2020-02-08 19:48:37');
INSERT INTO `userinfo` VALUES ('4', '张兰', 'http://localhost:8088/upload/user/4d30b7aa-120a-4ed4-8e60-a90651bb06a0.jpeg', '女', '533222199999999999', '13678789568', '重庆,市辖区,九龙坡区', '0', '123456', '普通员工', '2019-12-04', '2020-02-08 19:49:48');
INSERT INTO `userinfo` VALUES ('5', '肖明', 'http://localhost:8088/upload/user/f405909d-c545-4a95-a10f-12446c866235.jpg', '男', '533222199999999999', '18188896557', '云南,昆明市,西山区', '0', '123456', '普通员工', '2019-12-03', '2020-02-08 19:50:54');
INSERT INTO `userinfo` VALUES ('6', '张晓晓', 'http://localhost:8088/upload/user/80f304c6-d6d7-4272-8129-a4112b16c44e.jpg', '女', '531225199758642516', '13312669876', '云南,昆明市,盘龙区', '0', '123456', '仓库管理员鼓励师', '2019-12-05', '2020-02-08 19:53:48');
INSERT INTO `userinfo` VALUES ('7', '1', 'http://localhost:8088/upload/user/5286aa3f-21de-4931-836f-67b2be561e79.jpg', '男', '533222199796356984', '18687978888', '云南,昆明市,西山区', '0', '1', 'Test', '2019-12-08', '2020-02-08 19:58:02');

-- ----------------------------
-- Table structure for `useruploadinfo`
-- ----------------------------
DROP TABLE IF EXISTS `useruploadinfo`;
CREATE TABLE `useruploadinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `result` int(11) DEFAULT NULL COMMENT '结果 1:成功0：失败',
  `msg` varchar(255) DEFAULT NULL COMMENT '信息',
  `picurl` varchar(255) DEFAULT NULL COMMENT '相对路径',
  `filepath` varchar(255) DEFAULT NULL COMMENT '绝对路径',
  `createtime` datetime DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of useruploadinfo
-- ----------------------------
INSERT INTO `useruploadinfo` VALUES ('1', '1', '上传成功！', 'http://localhost:8088/upload/user/58b6fb6c-f719-4123-8348-e9c1263a7a08.jpg', 'C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\user', '2020-02-08 19:47:15');
INSERT INTO `useruploadinfo` VALUES ('2', '1', '上传成功！', 'http://localhost:8088/upload/user/955f6460-d88c-45d1-870e-2a015a9b0ece.jpg', 'C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\user', '2020-02-08 19:48:37');
INSERT INTO `useruploadinfo` VALUES ('3', '1', '上传成功！', 'http://localhost:8088/upload/user/4d30b7aa-120a-4ed4-8e60-a90651bb06a0.jpeg', 'C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\user', '2020-02-08 19:49:48');
INSERT INTO `useruploadinfo` VALUES ('4', '1', '上传成功！', 'http://localhost:8088/upload/user/f405909d-c545-4a95-a10f-12446c866235.jpg', 'C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\user', '2020-02-08 19:50:54');
INSERT INTO `useruploadinfo` VALUES ('5', '1', '上传成功！', 'http://localhost:8088/upload/user/80f304c6-d6d7-4272-8129-a4112b16c44e.jpg', 'C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\user', '2020-02-08 19:53:48');
INSERT INTO `useruploadinfo` VALUES ('6', '1', '上传成功！', 'http://localhost:8088/upload/user/5286aa3f-21de-4931-836f-67b2be561e79.jpg', 'C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\user', '2020-02-08 19:58:02');

-- ----------------------------
-- Table structure for `warehouseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `warehouseinfo`;
CREATE TABLE `warehouseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `warehousename` varchar(255) DEFAULT NULL COMMENT '仓库名称',
  `photo` varchar(255) DEFAULT NULL COMMENT '仓库图片',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `intro` varchar(255) DEFAULT NULL COMMENT '备注',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of warehouseinfo
-- ----------------------------
INSERT INTO `warehouseinfo` VALUES ('1', '1号仓库', 'http://localhost:8088/upload/warehouse/47c85dbf-96ad-4177-b77d-cfc6db363971.jpg', '10', '大宗物品存储', '2020-02-08 19:17:30');
INSERT INTO `warehouseinfo` VALUES ('2', '2号仓库', 'http://localhost:8088/upload/warehouse/20f329c1-2ea9-4b62-bddf-b384208e1794.jpg', '10', '工业用品存储', '2020-02-08 19:21:56');
INSERT INTO `warehouseinfo` VALUES ('3', '3号仓库', 'http://localhost:8088/upload/warehouse/e80b4eaf-340a-4520-bb12-6300b61d0ef7.jpg', '10', '五金用品存储', '2020-02-08 19:29:14');
INSERT INTO `warehouseinfo` VALUES ('4', '4号仓库', 'http://localhost:8088/upload/warehouse/252cd609-25da-4532-8bfd-53dd1e25213b.jpg', '5', '家用物品存储', '2020-02-08 19:31:31');

-- ----------------------------
-- Table structure for `whuploadinfo`
-- ----------------------------
DROP TABLE IF EXISTS `whuploadinfo`;
CREATE TABLE `whuploadinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `result` int(11) DEFAULT NULL COMMENT '结果 1:成功0：失败',
  `msg` varchar(255) DEFAULT NULL COMMENT '信息',
  `picurl` varchar(255) DEFAULT NULL COMMENT '相对路径',
  `filepath` varchar(255) DEFAULT NULL COMMENT '绝对路径',
  `createtime` datetime DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of whuploadinfo
-- ----------------------------
INSERT INTO `whuploadinfo` VALUES ('1', '1', '上传成功！', 'http://localhost:8088/upload/warehouse/47c85dbf-96ad-4177-b77d-cfc6db363971.jpg', 'C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\warehouse', '2020-02-08 19:17:30');
INSERT INTO `whuploadinfo` VALUES ('2', '1', '上传成功！', 'http://localhost:8088/upload/warehouse/20f329c1-2ea9-4b62-bddf-b384208e1794.jpg', 'C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\warehouse', '2020-02-08 19:21:56');
INSERT INTO `whuploadinfo` VALUES ('3', '1', '上传成功！', 'http://localhost:8088/upload/warehouse/e80b4eaf-340a-4520-bb12-6300b61d0ef7.jpg', 'C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\warehouse', '2020-02-08 19:29:14');
INSERT INTO `whuploadinfo` VALUES ('4', '1', '上传成功！', 'http://localhost:8088/upload/warehouse/d15d571c-6e5a-4e00-8968-cdb19831e95b.jpg', 'C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\warehouse', '2020-02-08 19:30:07');
INSERT INTO `whuploadinfo` VALUES ('5', '1', '上传成功！', 'http://localhost:8088/upload/warehouse/252cd609-25da-4532-8bfd-53dd1e25213b.jpg', 'C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\warehouse', '2020-02-08 19:31:31');
