/*
Navicat MySQL Data Transfer

Source Server         : sell
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : o2o

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-04-15 15:28:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_area`
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area` (
  `area_id` int(5) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(200) NOT NULL,
  `area_desc` varchar(1000) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `UK_AREA` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES ('7', '东苑', '1', '0', null, null);
INSERT INTO `tb_area` VALUES ('8', '西苑', '2', '2', null, null);
INSERT INTO `tb_area` VALUES ('9', '南苑', '3', '0', null, null);
INSERT INTO `tb_area` VALUES ('10', '北苑', '4', '0', null, null);

-- ----------------------------
-- Table structure for `tb_award`
-- ----------------------------
DROP TABLE IF EXISTS `tb_award`;
CREATE TABLE `tb_award` (
  `award_id` int(10) NOT NULL AUTO_INCREMENT,
  `award_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `award_desc` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `award_img` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `point` int(10) NOT NULL DEFAULT '0',
  `priority` int(2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `shop_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`award_id`),
  KEY `fk_award_shop_idx` (`shop_id`),
  CONSTRAINT `tb_award_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_award
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_head_line`
-- ----------------------------
DROP TABLE IF EXISTS `tb_head_line`;
CREATE TABLE `tb_head_line` (
  `line_id` int(100) NOT NULL AUTO_INCREMENT,
  `line_name` varchar(1000) DEFAULT NULL,
  `line_link` varchar(2000) NOT NULL,
  `line_img` varchar(2000) NOT NULL,
  `priority` int(2) DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_head_line
-- ----------------------------
INSERT INTO `tb_head_line` VALUES ('16', 'aaa', 'aaa', '\\upload\\item\\headtitle\\2017061320315746624.jpg', '2', '0', null, null);
INSERT INTO `tb_head_line` VALUES ('17', 'bbb', 'bbb', '\\upload\\item\\headtitle\\2017061320371786788.jpg', '1', '1', null, null);
INSERT INTO `tb_head_line` VALUES ('18', 'ccc', 'ccc', '\\upload\\item\\headtitle\\2017061320393452772.jpg', '3', '0', null, null);
INSERT INTO `tb_head_line` VALUES ('19', 'ddd', 'ddd', '\\upload\\item\\headtitle\\2017061320400198256.jpg', '4', '1', null, null);

-- ----------------------------
-- Table structure for `tb_local_auth`
-- ----------------------------
DROP TABLE IF EXISTS `tb_local_auth`;
CREATE TABLE `tb_local_auth` (
  `local_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `user_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`local_auth_id`),
  UNIQUE KEY `uk_local_profile` (`user_name`),
  KEY `fk_local_profile` (`user_id`),
  CONSTRAINT `tb_local_auth_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_local_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_person_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_person_info`;
CREATE TABLE `tb_person_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `gender` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_img` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_flag` int(2) NOT NULL DEFAULT '0',
  `shop_owner_flag` int(2) NOT NULL DEFAULT '0',
  `user_type` int(2) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_person_info
-- ----------------------------
INSERT INTO `tb_person_info` VALUES ('1', '测试', null, '1', '', 'test', 'test', '0', '0', '2', null, null, '1');

-- ----------------------------
-- Table structure for `tb_phone_auth`
-- ----------------------------
DROP TABLE IF EXISTS `tb_phone_auth`;
CREATE TABLE `tb_phone_auth` (
  `phone_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `phone` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `auth_number` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phone_auth_id`),
  KEY `fk_phoneauth_profile` (`user_id`),
  CONSTRAINT `tb_phone_auth_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_phone_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_product`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_desc` varchar(2000) DEFAULT NULL,
  `img_addr` varchar(2000) DEFAULT '',
  `normal_price` varchar(100) DEFAULT NULL,
  `promotion_price` varchar(100) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `point` int(10) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `fk_product_shop` (`shop_id`),
  KEY `fk_product_procate` (`product_category_id`),
  CONSTRAINT `tb_product_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category` (`product_category_id`),
  CONSTRAINT `tb_product_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES ('1', 'aa', 'aa', 'aa', '11', '12', '0', null, '2019-04-13 16:01:39', '0', null, null, '30');
INSERT INTO `tb_product` VALUES ('18', '测试商品2', '测试商品2描述', '\\upload\\item\\shop\\32\\19041222113491067.jpg', '10', null, '22', '2019-04-12 22:11:34', '2019-04-15 15:23:37', '0', null, '20', '32');
INSERT INTO `tb_product` VALUES ('19', '测试3', 'test1', '\\upload\\item\\shop\\30\\19041311140527648.jpg', '12', '11', '2', '2019-04-11 10:12:04', '2019-04-13 16:12:42', '1', null, '20', '30');
INSERT INTO `tb_product` VALUES ('20', '测试4', 'ceshi 4', '测试3', '10', null, '1', '2019-04-11 10:12:04', '2019-04-11 10:12:04', '0', null, '20', '32');
INSERT INTO `tb_product` VALUES ('21', '测试商品1', '测试商品1描述', '\\upload\\item\\shop\\32\\19041121540089362.jpg', null, null, '11', '2019-04-11 21:54:01', '2019-04-11 21:54:00', '1', null, '18', '35');
INSERT INTO `tb_product` VALUES ('22', 'TEST', 'AA', '\\upload\\item\\shop\\30\\19041216145581481.jpg', '11', '1', '12', '2019-04-12 16:14:56', '2019-04-13 15:53:34', '1', null, '20', '35');
INSERT INTO `tb_product` VALUES ('23', '烧仙草', '好吃不贵', '\\upload\\item\\shop\\30\\19041216304091653.jpg', '13', '11', '15', '2019-04-12 16:30:41', '2019-04-14 10:01:10', '1', null, '27', '35');

-- ----------------------------
-- Table structure for `tb_product_category`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_category`;
CREATE TABLE `tb_product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(100) NOT NULL,
  `product_category_desc` varchar(500) DEFAULT NULL,
  `priority` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_category_id`),
  KEY `fk_procate_shop` (`shop_id`),
  CONSTRAINT `tb_product_category_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_category
-- ----------------------------
INSERT INTO `tb_product_category` VALUES ('16', '主食', '这是主食', '10', null, null, '35');
INSERT INTO `tb_product_category` VALUES ('17', '副食', '这是副食', '5', null, null, '35');
INSERT INTO `tb_product_category` VALUES ('18', '冷饮', '这是个清爽的饮料', '1', '2019-04-10 13:53:57', null, '32');
INSERT INTO `tb_product_category` VALUES ('19', '热饮', '这是个解寒的饮料', '2', '2019-04-10 13:53:57', null, '33');
INSERT INTO `tb_product_category` VALUES ('20', 'test1', '测试', '11', '2019-04-10 15:39:54', null, '30');
INSERT INTO `tb_product_category` VALUES ('27', '小吃', null, '8', '2019-04-14 10:02:57', null, '35');

-- ----------------------------
-- Table structure for `tb_product_img`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_img`;
CREATE TABLE `tb_product_img` (
  `product_img_id` int(20) NOT NULL AUTO_INCREMENT,
  `img_addr` varchar(2000) NOT NULL,
  `img_desc` varchar(2000) DEFAULT NULL,
  `priority` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`product_img_id`),
  KEY `fk_proimg_product` (`product_id`),
  CONSTRAINT `tb_product_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_img
-- ----------------------------
INSERT INTO `tb_product_img` VALUES ('44', '\\upload\\item\\shop\\32\\19041121540095212.jpg', null, null, '2019-04-11 21:54:01', '21');
INSERT INTO `tb_product_img` VALUES ('45', '\\upload\\item\\shop\\32\\19041121540196937.jpg', null, null, '2019-04-11 21:54:01', '21');
INSERT INTO `tb_product_img` VALUES ('48', '\\upload\\item\\shop\\30\\19041216145583329.jpg', null, null, '2019-04-12 16:14:56', '22');
INSERT INTO `tb_product_img` VALUES ('49', '\\upload\\item\\shop\\30\\19041216145520595.jpg', null, null, '2019-04-12 16:14:56', '22');
INSERT INTO `tb_product_img` VALUES ('50', '\\upload\\item\\shop\\30\\19041216304052067.jpg', null, null, '2019-04-12 16:30:41', '23');
INSERT INTO `tb_product_img` VALUES ('51', '\\upload\\item\\shop\\30\\19041216304038587.jpg', null, null, '2019-04-12 16:30:41', '23');
INSERT INTO `tb_product_img` VALUES ('54', '\\upload\\item\\shop\\32\\19041222113470977.jpg', null, null, '2019-04-12 22:11:35', '18');
INSERT INTO `tb_product_img` VALUES ('55', '\\upload\\item\\shop\\32\\19041222113417182.jpg', null, null, '2019-04-12 22:11:35', '18');
INSERT INTO `tb_product_img` VALUES ('56', '\\upload\\item\\shop\\30\\19041311140543276.jpg', null, null, '2019-04-13 11:14:06', '19');
INSERT INTO `tb_product_img` VALUES ('57', '\\upload\\item\\shop\\30\\19041311140566294.jpg', null, null, '2019-04-13 11:14:06', '19');

-- ----------------------------
-- Table structure for `tb_shop`
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop` (
  `shop_id` int(10) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) NOT NULL COMMENT '店铺创建人',
  `area_id` int(5) DEFAULT NULL,
  `shop_category_id` int(11) DEFAULT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  `shop_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `shop_desc` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_addr` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_img` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` double(16,12) DEFAULT NULL,
  `latitude` double(16,12) DEFAULT NULL,
  `priority` int(3) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `advice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `fk_shop_profile` (`owner_id`),
  KEY `fk_shop_area` (`area_id`),
  KEY `fk_shop_shopcate` (`shop_category_id`),
  KEY `fk_shop_parentcate` (`parent_category_id`),
  CONSTRAINT `tb_shop_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`),
  CONSTRAINT `tb_shop_ibfk_2` FOREIGN KEY (`parent_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`),
  CONSTRAINT `tb_shop_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `tb_shop_ibfk_4` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES ('30', '1', '7', '33', null, '修改后的店铺名字是', '测试', '北京', 'texst', '\\upload\\item\\shop\\30\\19040817251451345.jpg', null, null, '0', null, '2019-04-08 17:25:15', '1', '审核通过');
INSERT INTO `tb_shop` VALUES ('32', '1', '7', '33', null, '修改后的店铺名字是', '测试1', '北京1', 'texst1', '\\upload\\item\\shop\\32\\19041121540095212.jpg', null, null, '0', '2019-04-07 16:12:54', '2019-04-08 16:51:49', '1', '审核中');
INSERT INTO `tb_shop` VALUES ('33', '1', '7', '33', null, '测试的店铺1', '测试1', '北京1', 'texst1', '\\upload\\item\\shop\\33\\19040716220444906.jpg', null, null, '0', '2019-04-07 16:22:05', '2019-04-07 16:22:05', '1', '审核中');
INSERT INTO `tb_shop` VALUES ('34', '1', '7', '33', null, '测试的店铺3', '测试3', '北京3', 'texst3', '\\upload\\item\\shop\\34\\19040723424550954.jpg', null, null, '0', '2019-04-07 23:42:45', '2019-04-07 23:42:45', '1', '审核中');
INSERT INTO `tb_shop` VALUES ('35', '1', '8', '32', null, '教育局', '公正廉洁', '中国北京', '666666', '\\upload\\item\\shopcategory\\2017060420322333745.png', null, null, '0', '2019-04-08 13:28:15', '2019-04-08 13:28:15', '1', null);
INSERT INTO `tb_shop` VALUES ('39', '1', '7', '32', null, '交通局', 'ces', '廉江交通局', '987654321', '\\upload\\item\\shopcategory\\2017060420322333745.png', null, null, '0', '2019-04-08 13:40:58', '2019-04-09 11:33:19', '1', null);
INSERT INTO `tb_shop` VALUES ('43', '1', '7', '24', null, '密室', '测试', '北京', '123456789', '\\upload\\item\\shop\\43\\19040814034756603.jpg', null, null, '0', '2019-04-08 14:03:47', '2019-04-08 14:03:47', '1', null);
INSERT INTO `tb_shop` VALUES ('44', '1', '7', '33', null, '测试的店铺4', '测试4', '北京4', 'texst4', '\\upload\\item\\shop\\44\\19041111222945680.jpg', null, null, '0', '2019-04-11 11:22:30', '2019-04-11 11:22:30', '1', '审核中');

-- ----------------------------
-- Table structure for `tb_shop_auth_map`
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_auth_map`;
CREATE TABLE `tb_shop_auth_map` (
  `shop_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) NOT NULL,
  `shop_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '冗余是为了让shop在查找员工的时候，不需要去连tb_shop表，直接连tb_shop_auth_map就okay',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_flag` int(2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shop_auth_id`),
  KEY `fk_shop_auth_map_shop` (`shop_id`),
  KEY `uk_shop_auth_map` (`employee_id`,`shop_id`),
  CONSTRAINT `tb_shop_auth_map_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `tb_shop_auth_map_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_shop_auth_map
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_shop_category`
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_category`;
CREATE TABLE `tb_shop_category` (
  `shop_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_category_name` varchar(100) NOT NULL DEFAULT '',
  `shop_category_desc` varchar(1000) DEFAULT '',
  `shop_category_img` varchar(2000) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shop_category_id`),
  KEY `fk_shop_category_self` (`parent_id`),
  CONSTRAINT `tb_shop_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop_category
-- ----------------------------
INSERT INTO `tb_shop_category` VALUES ('10', '二手市场', '二手商品交易', '\\upload\\item\\shopcategory\\2017060420322333745.png', '100', '2017-06-04 20:10:58', '2017-06-12 23:27:22', null);
INSERT INTO `tb_shop_category` VALUES ('11', '美容美发', '美容美发', '\\upload\\item\\shopcategory\\2017060420322333745.png', '99', '2017-06-04 20:12:57', '2017-06-12 23:27:33', null);
INSERT INTO `tb_shop_category` VALUES ('12', '美食饮品', '美食饮品', '\\upload\\item\\shopcategory\\2017060420322333745.png', '98', '2017-06-04 20:15:21', '2017-06-12 23:27:42', null);
INSERT INTO `tb_shop_category` VALUES ('13', '休闲娱乐', '休闲娱乐', '\\upload\\item\\shopcategory\\2017060420322333745.png', '97', '2017-06-04 20:19:29', '2017-06-12 23:27:51', null);
INSERT INTO `tb_shop_category` VALUES ('14', '旧车', '旧车', '\\upload\\item\\shopcategory\\2017060420322333745.png', '80', '2017-06-04 20:31:51', '2017-06-04 20:31:51', '10');
INSERT INTO `tb_shop_category` VALUES ('15', '二手书籍', '二手书籍', '\\upload\\item\\shopcategory\\2017060420322333745.png', '79', '2017-06-04 20:32:23', '2017-06-04 20:32:23', '10');
INSERT INTO `tb_shop_category` VALUES ('17', '护理', '护理', '\\upload\\item\\shopcategory\\2017060420372391702.png', '76', '2017-06-04 20:37:23', '2017-06-04 20:37:23', '11');
INSERT INTO `tb_shop_category` VALUES ('18', '理发', '理发', '\\upload\\item\\shopcategory\\2017060420374775350.png', '74', '2017-06-04 20:37:47', '2017-06-04 20:37:47', '11');
INSERT INTO `tb_shop_category` VALUES ('20', '大排档', '大排档', '\\upload\\item\\shopcategory\\2017060420460491494.png', '59', '2017-06-04 20:46:04', '2017-06-04 20:46:04', '12');
INSERT INTO `tb_shop_category` VALUES ('22', '奶茶店', '奶茶店', '\\upload\\item\\shopcategory\\2017060420464594520.png', '58', '2017-06-04 20:46:45', '2017-06-04 20:46:45', '12');
INSERT INTO `tb_shop_category` VALUES ('24', '密室逃生', '密室逃生', '/upload/images/item/shopcategory/2017060420500783376.png', '56', '2017-06-04 20:50:07', '2017-06-04 21:45:53', '13');
INSERT INTO `tb_shop_category` VALUES ('25', 'KTV', 'KTV', '/upload/images/item/shopcategory/2017060420505834244.png', '57', '2017-06-04 20:50:58', '2017-06-04 20:51:14', '13');
INSERT INTO `tb_shop_category` VALUES ('27', '培训教育', '培训教育', '\\upload\\item\\shopcategory\\2017060420322333745.png', '96', '2017-06-04 21:51:36', '2017-06-12 23:28:00', null);
INSERT INTO `tb_shop_category` VALUES ('28', '租赁市场', '租赁市场', '\\upload\\item\\shopcategory\\2017060420322333745.png', '95', '2017-06-04 21:53:52', '2017-06-12 23:28:13', null);
INSERT INTO `tb_shop_category` VALUES ('29', '程序设计', '程序设计', '/upload/images/item/shopcategory/2017060421593496807.png', '50', '2017-06-04 21:59:34', '2017-06-04 21:59:34', '27');
INSERT INTO `tb_shop_category` VALUES ('30', '声乐舞蹈', '声乐舞蹈', '/upload/images/item/shopcategory/2017060421595843693.png', '49', '2017-06-04 21:59:58', '2017-06-04 21:59:58', '27');
INSERT INTO `tb_shop_category` VALUES ('31', '演出道具', '演出道具', '/upload/images/item/shopcategory/2017060422114076152.png', '45', '2017-06-04 22:11:40', '2017-06-04 22:11:40', '28');
INSERT INTO `tb_shop_category` VALUES ('32', '交通工具', '交通工具', '/upload/images/item/shopcategory/2017060422121144586.png', '44', '2017-06-04 22:12:11', '2017-06-04 22:12:11', '28');
INSERT INTO `tb_shop_category` VALUES ('33', '咖啡纳差', '', '\\upload\\item\\shopcategory\\2017060420322333745.png', '0', null, null, '28');
INSERT INTO `tb_shop_category` VALUES ('34', '咖啡奶茶', '咖啡奶茶', '\\upload\\item\\shopcategory\\2017060420322333745.png', '1', null, null, '28');

-- ----------------------------
-- Table structure for `tb_user_award_map`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_award_map`;
CREATE TABLE `tb_user_award_map` (
  `user_award_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `award_id` int(10) NOT NULL,
  `shop_id` int(10) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `award_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `used_status` int(2) NOT NULL DEFAULT '0',
  `point` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_award_id`),
  KEY `fk_user_award_map_profile` (`user_id`),
  KEY `fk_user_award_map_award` (`award_id`),
  KEY `fk_user_award_map_shop` (`shop_id`),
  CONSTRAINT `tb_user_award_map_ibfk_1` FOREIGN KEY (`award_id`) REFERENCES `tb_award` (`award_id`),
  CONSTRAINT `tb_user_award_map_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `tb_user_award_map_ibfk_3` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_user_award_map
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_user_product_map`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_product_map`;
CREATE TABLE `tb_user_product_map` (
  `user_product_id` int(30) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `product_id` int(100) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `point` int(10) DEFAULT '0',
  PRIMARY KEY (`user_product_id`),
  KEY `fk_user_product_map_profile` (`user_id`),
  KEY `fk_user_product_map_product` (`product_id`),
  KEY `fk_user_product_map_shop` (`shop_id`),
  CONSTRAINT `tb_user_product_map_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`),
  CONSTRAINT `tb_user_product_map_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `tb_user_product_map_ibfk_3` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_product_map
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_user_shop_map`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_shop_map`;
CREATE TABLE `tb_user_shop_map` (
  `user_shop_id` int(30) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `shop_id` int(10) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `point` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_shop_id`),
  UNIQUE KEY `uq_user_shop` (`user_id`,`shop_id`),
  KEY `fk_user_shop_shop` (`shop_id`),
  CONSTRAINT `tb_user_shop_map_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`),
  CONSTRAINT `tb_user_shop_map_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_shop_map
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_wechat_auth`
-- ----------------------------
DROP TABLE IF EXISTS `tb_wechat_auth`;
CREATE TABLE `tb_wechat_auth` (
  `wechat_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `open_id` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`wechat_auth_id`),
  KEY `fk_oauth_profile` (`user_id`),
  KEY `uk_oauth` (`open_id`(255)),
  CONSTRAINT `tb_wechat_auth_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_wechat_auth
-- ----------------------------
