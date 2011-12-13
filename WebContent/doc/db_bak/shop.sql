/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2011-12-29 22:38:51
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `shop_activity`
-- ----------------------------
DROP TABLE IF EXISTS `shop_activity`;
CREATE TABLE `shop_activity` (
  `activity_id` int(11) NOT NULL auto_increment COMMENT 'id',
  `activity_title` varchar(255) NOT NULL COMMENT '标题',
  `activity_type` enum('1','2') default NULL COMMENT '活动类型 1:商品 2:团购',
  `activity_banner` varchar(255) NOT NULL COMMENT '活动横幅大图片',
  `activity_style` varchar(255) NOT NULL COMMENT '活动页面模板样式标识码',
  `activity_desc` varchar(1000) NOT NULL COMMENT '描述',
  `activity_start_date` int(10) NOT NULL COMMENT '开始时间',
  `activity_end_date` int(10) default NULL COMMENT '结束时间',
  `activity_sort` tinyint(1) unsigned NOT NULL default '255' COMMENT '排序',
  `activity_state` tinyint(1) unsigned NOT NULL default '1' COMMENT '活动状态 0为关闭 1为开启',
  PRIMARY KEY  (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_activity
-- ----------------------------
INSERT INTO shop_activity VALUES ('1', '运动专场', '1', '', 'default_style', '运动专场', '1330099200', '1356883200', '255', '1');

-- ----------------------------
-- Table structure for `shop_activity_detail`
-- ----------------------------
DROP TABLE IF EXISTS `shop_activity_detail`;
CREATE TABLE `shop_activity_detail` (
  `activity_detail_id` int(11) NOT NULL auto_increment COMMENT 'id',
  `activity_id` int(11) NOT NULL COMMENT '活动编号',
  `item_id` int(11) NOT NULL COMMENT '商品或团购的编号',
  `item_name` varchar(255) NOT NULL COMMENT '商品或团购名称',
  `store_id` int(11) NOT NULL COMMENT '店铺编号',
  `store_name` varchar(255) NOT NULL COMMENT '店铺名称',
  `activity_detail_state` enum('0','1','2','3') NOT NULL default '0' COMMENT '审核状态 0:(默认)待审核 1:通过 2:未通过 3:再次申请',
  `activity_detail_sort` tinyint(1) unsigned NOT NULL default '255' COMMENT '排序',
  PRIMARY KEY  (`activity_detail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_activity_detail
-- ----------------------------
INSERT INTO shop_activity_detail VALUES ('1', '1', '52', 'LINING 李宁服装 男圆领短袖T恤【演示数据】', '2', '极限运动基地', '1', '255');
INSERT INTO shop_activity_detail VALUES ('2', '1', '55', 'Lining/李宁服装 男短袖翻领Polo衫【演示数据】', '2', '极限运动基地', '1', '255');
INSERT INTO shop_activity_detail VALUES ('3', '1', '58', '正品 LINING/李宁服装 女短袖翻领POLO衫【演示数据】', '2', '极限运动基地', '1', '255');
INSERT INTO shop_activity_detail VALUES ('4', '1', '60', '专柜正品/李宁服装 男短袖翻领POLO衫【演示数据】', '2', '极限运动基地', '1', '255');
INSERT INTO shop_activity_detail VALUES ('5', '1', '61', 'New BalaNew Balance/新百伦服装 女短袖圆领T恤【演示数据】', '2', '极限运动基地', '1', '255');
INSERT INTO shop_activity_detail VALUES ('6', '1', '62', 'New Balance/新百伦服装 男式短袖圆领T恤【演示数据】', '2', '极限运动基地', '1', '255');
INSERT INTO shop_activity_detail VALUES ('7', '1', '63', '正品 LINING 李宁服装 女无袖圆领背心【演示数据】', '2', '极限运动基地', '1', '255');
INSERT INTO shop_activity_detail VALUES ('8', '1', '64', '新百伦 new balance 专柜正品 跑步鞋 男式运动鞋【演示数据】', '2', '极限运动基地', '1', '255');
INSERT INTO shop_activity_detail VALUES ('9', '1', '66', '李宁 lining 专柜正品 足球鞋 女式运动鞋 【演示数据】', '2', '极限运动基地', '1', '255');
INSERT INTO shop_activity_detail VALUES ('10', '1', '70', '三叶草 adidas SUPERSTAR II CQ 正品男式运动鞋 【演示数据】', '2', '极限运动基地', '1', '255');

-- ----------------------------
-- Table structure for `shop_address`
-- ----------------------------
DROP TABLE IF EXISTS `shop_address`;
CREATE TABLE `shop_address` (
  `address_id` int(10) unsigned NOT NULL auto_increment COMMENT '地址ID',
  `member_id` int(10) unsigned NOT NULL default '0' COMMENT '会员ID',
  `true_name` varchar(50) NOT NULL COMMENT '会员姓名',
  `area_id` int(10) unsigned NOT NULL default '0' COMMENT '地区ID',
  `area_info` varchar(255) NOT NULL COMMENT '地区内容',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `zip_code` varchar(20) default NULL COMMENT '邮编',
  `tel_phone` varchar(50) default NULL COMMENT '座机电话',
  `mob_phone` varchar(50) default NULL COMMENT '手机电话',
  PRIMARY KEY  (`address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_address
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_admin`
-- ----------------------------
DROP TABLE IF EXISTS `shop_admin`;
CREATE TABLE `shop_admin` (
  `admin_id` int(11) unsigned NOT NULL auto_increment COMMENT '管理员ID',
  `admin_permission` varchar(3000) default NULL COMMENT '管理权限',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员名称',
  `admin_password` varchar(32) NOT NULL default '' COMMENT '管理员密码',
  `admin_login_time` int(10) NOT NULL default '0' COMMENT '登录时间',
  `admin_login_num` int(11) NOT NULL default '0' COMMENT '登录次数',
  `admin_is_super` tinyint(1) NOT NULL default '0' COMMENT '是否超级管理员',
  PRIMARY KEY  (`admin_id`),
  KEY `member_id` (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_admin
-- ----------------------------
INSERT INTO shop_admin VALUES ('1', 'login|setting|region|payment|mailtemplates|admin|goods_class|brand|goods|recommend|groupbuy|goods_stat|store_grade|store_class|store|store_cs|member|notice|trade|article_class|article|document|link|navigation|db|consulting|adv|share_link|activity|coupon|coupon_class|clear_cache', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1331132478', '1', '1');

-- ----------------------------
-- Table structure for `shop_adv`
-- ----------------------------
DROP TABLE IF EXISTS `shop_adv`;
CREATE TABLE `shop_adv` (
  `adv_id` int(10) unsigned NOT NULL auto_increment COMMENT '广告自增标识编号',
  `ap_id` int(10) unsigned NOT NULL COMMENT '广告位id',
  `adv_title` varchar(255) NOT NULL COMMENT '广告内容描述',
  `adv_content` varchar(1000) NOT NULL COMMENT '广告内容',
  `adv_start_date` int(10) default NULL COMMENT '广告开始时间',
  `adv_end_date` int(10) default NULL COMMENT '广告结束时间',
  `slide_sort` int(10) unsigned NOT NULL COMMENT '幻灯片排序',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员用户名',
  `click_num` int(10) unsigned NOT NULL COMMENT '广告点击率',
  `is_allow` smallint(1) unsigned NOT NULL COMMENT '会员购买的广告是否通过审核0未审核1审核已通过2审核未通过',
  `buy_style` varchar(10) NOT NULL COMMENT '购买方式',
  `goldpay` int(10) unsigned NOT NULL COMMENT '购买所支付的金币',
  PRIMARY KEY  (`adv_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_adv
-- ----------------------------
INSERT INTO shop_adv VALUES ('1', '13', '首页幻灯片测试广告1', 'a:2:{s:13:\"adv_slide_pic\";s:36:\"271b2785f67f6119332213367516a426.jpg\";s:13:\"adv_slide_url\";s:14:\"www.shopnc.net\";}', '1306857600', '1622476800', '1', '0', '', '0', '1', '', '0');
INSERT INTO shop_adv VALUES ('2', '13', '首页幻灯片测试广告2', 'a:2:{s:13:\"adv_slide_pic\";s:36:\"bd32bd9949a93f96eeb7bf7fdc619361.jpg\";s:13:\"adv_slide_url\";s:14:\"www.shopnc.net\";}', '1306857600', '1623772800', '2', '0', '', '0', '1', '', '0');
INSERT INTO shop_adv VALUES ('3', '13', '首页幻灯片测试广告3', 'a:2:{s:13:\"adv_slide_pic\";s:36:\"7dbaaa6f5324cd4b7a3531dfc5ca810b.jpg\";s:13:\"adv_slide_url\";s:14:\"www.shopnc.net\";}', '1306857600', '1622476800', '3', '0', '', '0', '1', '', '0');
INSERT INTO shop_adv VALUES ('4', '13', '首页幻灯片测试广告4', 'a:2:{s:13:\"adv_slide_pic\";s:36:\"1c8f6c1c8192d7fa5d3cc7f30d7db09c.jpg\";s:13:\"adv_slide_url\";s:14:\"www.shopnc.net\";}', '1306857600', '1622476800', '4', '0', '', '0', '1', '', '0');
INSERT INTO shop_adv VALUES ('5', '13', '首页幻灯片测试广告5', 'a:2:{s:13:\"adv_slide_pic\";s:36:\"33e9d8a94c644cd87ca97f7ced8024af.jpg\";s:13:\"adv_slide_url\";s:14:\"www.shopnc.net\";}', '1306857600', '1622476800', '5', '0', '', '0', '1', '', '0');
INSERT INTO shop_adv VALUES ('8', '26', '首页最新商品处横幅广告', 'a:2:{s:7:\"adv_pic\";s:36:\"faf06d944be7bf3393f2a7d871754d49.jpg\";s:11:\"adv_pic_url\";s:0:\"\";}', '1320076800', '1333555200', '0', '0', '', '0', '1', '', '0');
INSERT INTO shop_adv VALUES ('9', '25', '两格轮换广告02', 'a:2:{s:7:\"adv_pic\";s:36:\"5591c0054e33b3d86fbdadb536bb50a5.jpg\";s:11:\"adv_pic_url\";s:14:\"www.shopnc.net\";}', '1321977600', '1343404800', '0', '0', '', '0', '1', '', '0');
INSERT INTO shop_adv VALUES ('10', '24', '两格轮换广告01', 'a:2:{s:7:\"adv_pic\";s:36:\"97caa4b287891a56f9434af1a5b71c82.jpg\";s:11:\"adv_pic_url\";s:14:\"www.shopnc.net\";}', '1321977600', '1351353600', '0', '0', '', '0', '1', '', '0');
INSERT INTO shop_adv VALUES ('11', '23', '四格轮换广告01', 'a:2:{s:7:\"adv_pic\";s:36:\"edbbe33a9dd3ca37861f4045e34edd5c.jpg\";s:11:\"adv_pic_url\";s:14:\"www.shopnc.net\";}', '1321977600', '1356796800', '0', '0', '', '0', '1', '', '0');
INSERT INTO shop_adv VALUES ('12', '22', '四格轮换广告02', 'a:2:{s:7:\"adv_pic\";s:36:\"606a56dfbd9509033358ad8beb8ac631.jpg\";s:11:\"adv_pic_url\";s:14:\"www.shopnc.net\";}', '1321977600', '1353772800', '0', '0', '', '0', '1', '', '0');
INSERT INTO shop_adv VALUES ('13', '21', '四格轮换广告03', 'a:2:{s:7:\"adv_pic\";s:36:\"7f7c874c8f3a4f3835c8fe0348b96600.jpg\";s:11:\"adv_pic_url\";s:14:\"www.shopnc.net\";}', '1321977600', '1351353600', '0', '0', '', '0', '1', '', '0');
INSERT INTO shop_adv VALUES ('14', '20', '四格轮换广告04', 'a:2:{s:7:\"adv_pic\";s:36:\"c2d7e0d98aab6f4f4f3c8639fe4b4722.jpg\";s:11:\"adv_pic_url\";s:14:\"www.shopnc.net\";}', '1321977600', '1353772800', '0', '0', '', '0', '1', '', '0');

-- ----------------------------
-- Table structure for `shop_adv_click`
-- ----------------------------
DROP TABLE IF EXISTS `shop_adv_click`;
CREATE TABLE `shop_adv_click` (
  `adv_id` int(10) unsigned NOT NULL COMMENT '广告id',
  `ap_id` int(10) unsigned NOT NULL COMMENT '所属广告位id',
  `click_year` int(4) unsigned NOT NULL COMMENT '点击年份',
  `click_month` int(2) unsigned NOT NULL COMMENT '点击月份',
  `click_num` int(10) unsigned NOT NULL COMMENT '点击率',
  `adv_name` varchar(100) NOT NULL COMMENT '广告名称',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_adv_click
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_adv_position`
-- ----------------------------
DROP TABLE IF EXISTS `shop_adv_position`;
CREATE TABLE `shop_adv_position` (
  `ap_id` int(10) unsigned NOT NULL auto_increment COMMENT '广告位置id',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位置名',
  `ap_intro` varchar(1000) NOT NULL COMMENT '广告位简介',
  `ap_class` smallint(1) unsigned NOT NULL COMMENT '广告类别：0图片1文字2幻灯3Flash',
  `ap_display` smallint(1) unsigned NOT NULL COMMENT '广告展示方式：0幻灯片1多广告展示2单广告展示',
  `is_use` smallint(1) unsigned NOT NULL COMMENT '广告位是否启用：0不启用1启用',
  `ap_width` int(10) NOT NULL COMMENT '广告位宽度',
  `ap_height` int(10) NOT NULL COMMENT '广告位高度',
  `ap_price` int(10) unsigned NOT NULL COMMENT '广告位单价',
  `adv_num` int(10) unsigned NOT NULL COMMENT '拥有的广告数',
  `click_num` int(10) unsigned NOT NULL COMMENT '广告位点击率',
  `default_content` varchar(100) NOT NULL COMMENT '广告位默认内容',
  PRIMARY KEY  (`ap_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_adv_position
-- ----------------------------
INSERT INTO shop_adv_position VALUES ('9', '首页底部通栏图片广告', '位于首页底部的通栏型图片广告', '0', '2', '1', '1000', '90', '100', '0', '0', '84de815edad64024ae2e2c45979dc77e.jpg');
INSERT INTO shop_adv_position VALUES ('13', '首页幻灯片', '首页幻灯片', '2', '0', '1', '500', '210', '100', '3', '0', '8d2b873c7dd4ed47aa907b95d7852e6f.jpg');
INSERT INTO shop_adv_position VALUES ('14', '首页对联广告左', '首页对联广告左', '0', '2', '0', '150', '240', '100', '0', '0', '8d1531247fc8ce90b373360fd0b55fd4.jpg');
INSERT INTO shop_adv_position VALUES ('15', '首页对联广告右', '首页对联广告右', '0', '2', '0', '150', '240', '100', '0', '0', '9a708eade54a7070918643a652cd3d7e.jpg');
INSERT INTO shop_adv_position VALUES ('16', '购物车广告位1', '位于购物车信息页面下方图片广告', '0', '2', '1', '240', '135', '100', '0', '0', 'eb1ab09f6eb9fe7517c0612b3c45b503.jpg');
INSERT INTO shop_adv_position VALUES ('17', '购物车广告位2', '位于购物车信息页面下方图片广告', '0', '2', '1', '240', '135', '100', '0', '0', '989d9e7bdefaa9568388c7d155ebb066.jpg');
INSERT INTO shop_adv_position VALUES ('18', '购物车广告位3', '位于购物车信息页面下方图片广告', '0', '2', '1', '240', '135', '100', '0', '0', '8357db899b3ba02b5549702be7c4d17d.jpg');
INSERT INTO shop_adv_position VALUES ('19', '购物车广告位4', '位于购物车信息页面下方图片广告', '0', '2', '1', '240', '135', '100', '0', '0', '96d16971074cbf29cc8fc08d2dcda137.jpg');
INSERT INTO shop_adv_position VALUES ('20', '首页特别推荐-四格轮换广告位01', '商城特别推荐处轮动广告\r\n四格图片连为一组广告展示', '0', '1', '1', '110', '131', '100', '1', '1', 'f1414e558d853ebd8835f50bda72fdce.jpg');
INSERT INTO shop_adv_position VALUES ('21', '首页特别推荐-四格轮换广告位02', '商城特别推荐处轮动广告\r\n四格图片连为一组广告展示', '0', '2', '1', '110', '131', '100', '0', '0', 'dafee38e6539ffe625f7658033e64bb1.jpg');
INSERT INTO shop_adv_position VALUES ('22', '首页特别推荐-四格轮换广告位03', '商城特别推荐处轮动广告\r\n四格图片连为一组广告展示', '0', '2', '1', '110', '131', '100', '0', '0', '3b489eb71d6d7a760e61803cf191c1b7.jpg');
INSERT INTO shop_adv_position VALUES ('23', '首页特别推荐-四格轮换广告位04', '商城特别推荐处轮动广告\r\n四格图片连为一组广告展示', '0', '2', '1', '110', '131', '100', '0', '0', '290e4cd2096b2b3ab1ce633cf3441401.jpg');
INSERT INTO shop_adv_position VALUES ('24', '首页特别推荐-两格轮换广告位01', '商城特别推荐处轮动广告\r\n两格图片连为一组广告展示', '0', '2', '1', '215', '115', '150', '0', '0', '3067e3fbe549d28e183590463cf9c97d.jpg');
INSERT INTO shop_adv_position VALUES ('25', '首页特别推荐-两格轮换广告位02', '商城特别推荐处轮动广告\r\n两格图片连为一组广告展示', '0', '2', '1', '215', '115', '150', '0', '0', '28d1eff4411f81442c8d4eb3ac255672.jpg');
INSERT INTO shop_adv_position VALUES ('26', '首页商品展示板块下方横幅广告条', '首页商品展示板块下方横幅广告条', '0', '1', '1', '760', '100', '100', '4', '0', '');
INSERT INTO shop_adv_position VALUES ('27', '文字广告1-男女服饰下方', '文字广告1-男女服饰下方文字广告', '1', '2', '1', '30', '0', '30', '0', '0', '文字广告1-男女服饰下方文字广告');
INSERT INTO shop_adv_position VALUES ('28', '文字广告2-鞋包配饰下方', '文字广告2-鞋包配饰下方文字广告', '1', '2', '1', '30', '0', '30', '0', '0', '文字广告2-鞋包配饰下方文字广告');
INSERT INTO shop_adv_position VALUES ('29', '文字广告3-美容美妆下方', '文字广告3-美容美妆下方文字广告', '1', '2', '1', '30', '0', '30', '0', '0', '文字广告3-美容美妆下方文字广告');
INSERT INTO shop_adv_position VALUES ('30', '文字广告4-运动户外下方', '文字广告4-运动户外下方文字广告', '1', '2', '1', '30', '0', '30', '0', '0', '文字广告4-运动户外下方文字广告');
INSERT INTO shop_adv_position VALUES ('31', '文字广告5-数码家电下方', '文字广告5-数码家电下方文字广告', '1', '2', '1', '30', '0', '30', '0', '0', '文字广告5-数码家电下方文字广告');
INSERT INTO shop_adv_position VALUES ('32', '文字广告6-家居家装下方', '文字广告6-家居家装下方文字广告', '1', '2', '1', '30', '0', '30', '0', '0', '文字广告6-家居家装下方文字广告');
INSERT INTO shop_adv_position VALUES ('33', '文字广告7-食品保健下方', '文字广告7-食品保健下方文字广告', '1', '2', '1', '30', '0', '30', '0', '0', '文字广告7-食品保健下方文字广告');
INSERT INTO shop_adv_position VALUES ('34', '文字广告8-母婴用品下方', '文字广告8-母婴用品下方文字广告', '1', '2', '1', '30', '0', '30', '0', '0', '文字广告8-母婴用品下方文字广告');
INSERT INTO shop_adv_position VALUES ('35', '积分列表页中部广告位', '积分列表页中部广告位', '0', '1', '1', '780', '254', '30', '0', '0', 'f448e48ee0deb06707480d46a2a360ae.gif');
INSERT INTO shop_adv_position VALUES ('36', '积分列表页右侧底部广告位', '积分列表页右侧底部广告位', '0', '1', '1', '208', '341', '30', '0', '0', '38fd59a0e57dd03768315b5ad1223ad3.gif');
INSERT INTO shop_adv_position VALUES ('37', '商品列表页左侧广告位', '商品列表页左侧广告位', '0', '1', '1', '200', '350', '100', '0', '0', '7a4832d109ee46fe7677c1d3c30e067f.gif');

-- ----------------------------
-- Table structure for `shop_album_class`
-- ----------------------------
DROP TABLE IF EXISTS `shop_album_class`;
CREATE TABLE `shop_album_class` (
  `aclass_id` int(10) unsigned NOT NULL auto_increment COMMENT '相册id',
  `aclass_name` varchar(100) NOT NULL COMMENT '相册名称',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `aclass_des` varchar(255) NOT NULL COMMENT '相册描述',
  `aclass_sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `aclass_cover` varchar(255) NOT NULL COMMENT '相册封面',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `is_default` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否为默认相册,1代表默认',
  PRIMARY KEY  (`aclass_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_album_class
-- ----------------------------
INSERT INTO shop_album_class VALUES ('1', '默认相册', '2', '', '255', '', '1322038584', '1');

-- ----------------------------
-- Table structure for `shop_album_pic`
-- ----------------------------
DROP TABLE IF EXISTS `shop_album_pic`;
CREATE TABLE `shop_album_pic` (
  `apic_id` int(10) unsigned NOT NULL auto_increment COMMENT '相册图片表id',
  `apic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `apic_tag` varchar(255) NOT NULL COMMENT '图片标签',
  `aclass_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `apic_cover` varchar(255) NOT NULL COMMENT '图片路径',
  `apic_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `apic_spec` varchar(100) NOT NULL COMMENT '图片规格',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  PRIMARY KEY  (`apic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_album_pic
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_area`
-- ----------------------------
DROP TABLE IF EXISTS `shop_area`;
CREATE TABLE `shop_area` (
  `area_id` int(11) unsigned NOT NULL auto_increment COMMENT '索引ID',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `area_parent_id` int(11) unsigned NOT NULL default '0' COMMENT '地区父ID',
  `area_sort` tinyint(3) unsigned NOT NULL default '0' COMMENT '排序',
  `area_deep` tinyint(1) unsigned NOT NULL default '1' COMMENT '地区深度，从1开始',
  PRIMARY KEY  (`area_id`),
  KEY `area_parent_id` (`area_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45056 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_area
-- ----------------------------
INSERT INTO shop_area VALUES ('1', '北京', '0', '0', '1');
INSERT INTO shop_area VALUES ('2', '天津', '0', '0', '1');
INSERT INTO shop_area VALUES ('3', '河北省', '0', '0', '1');
INSERT INTO shop_area VALUES ('4', '山西省', '0', '0', '1');
INSERT INTO shop_area VALUES ('5', '内蒙古自治区', '0', '0', '1');
INSERT INTO shop_area VALUES ('6', '辽宁省', '0', '0', '1');
INSERT INTO shop_area VALUES ('7', '吉林省', '0', '0', '1');
INSERT INTO shop_area VALUES ('8', '黑龙江省', '0', '0', '1');
INSERT INTO shop_area VALUES ('9', '上海', '0', '0', '1');
INSERT INTO shop_area VALUES ('10', '江苏省', '0', '0', '1');
INSERT INTO shop_area VALUES ('11', '浙江省', '0', '0', '1');
INSERT INTO shop_area VALUES ('12', '安徽省', '0', '0', '1');
INSERT INTO shop_area VALUES ('13', '福建省', '0', '0', '1');
INSERT INTO shop_area VALUES ('14', '江西省', '0', '0', '1');
INSERT INTO shop_area VALUES ('15', '山东省', '0', '0', '1');
INSERT INTO shop_area VALUES ('16', '河南省', '0', '0', '1');
INSERT INTO shop_area VALUES ('17', '湖北省', '0', '0', '1');
INSERT INTO shop_area VALUES ('18', '湖南省', '0', '0', '1');
INSERT INTO shop_area VALUES ('19', '广东省', '0', '0', '1');
INSERT INTO shop_area VALUES ('20', '广西壮族自治区', '0', '0', '1');
INSERT INTO shop_area VALUES ('21', '海南省', '0', '0', '1');
INSERT INTO shop_area VALUES ('22', '重庆', '0', '0', '1');
INSERT INTO shop_area VALUES ('23', '四川省', '0', '0', '1');
INSERT INTO shop_area VALUES ('24', '贵州省', '0', '0', '1');
INSERT INTO shop_area VALUES ('25', '云南省', '0', '0', '1');
INSERT INTO shop_area VALUES ('26', '西藏自治区', '0', '0', '1');
INSERT INTO shop_area VALUES ('27', '陕西省', '0', '0', '1');
INSERT INTO shop_area VALUES ('28', '甘肃省', '0', '0', '1');
INSERT INTO shop_area VALUES ('29', '青海省', '0', '0', '1');
INSERT INTO shop_area VALUES ('30', '宁夏回族自治区', '0', '0', '1');
INSERT INTO shop_area VALUES ('31', '新疆维吾尔自治区', '0', '0', '1');
INSERT INTO shop_area VALUES ('32', '台湾省', '0', '0', '1');
INSERT INTO shop_area VALUES ('33', '香港特别行政区', '0', '0', '1');
INSERT INTO shop_area VALUES ('34', '澳门特别行政区', '0', '0', '1');
INSERT INTO shop_area VALUES ('35', '海外', '0', '0', '1');
INSERT INTO shop_area VALUES ('36', '北京市', '1', '0', '2');
INSERT INTO shop_area VALUES ('37', '东城区', '36', '0', '3');
INSERT INTO shop_area VALUES ('38', '西城区', '36', '0', '3');
INSERT INTO shop_area VALUES ('41', '朝阳区', '36', '0', '3');
INSERT INTO shop_area VALUES ('42', '丰台区', '36', '0', '3');
INSERT INTO shop_area VALUES ('43', '石景山区', '36', '0', '3');
INSERT INTO shop_area VALUES ('44', '海淀区', '36', '0', '3');
INSERT INTO shop_area VALUES ('45', '门头沟区', '36', '0', '3');
INSERT INTO shop_area VALUES ('46', '房山区', '36', '0', '3');
INSERT INTO shop_area VALUES ('47', '通州区', '36', '0', '3');
INSERT INTO shop_area VALUES ('48', '顺义区', '36', '0', '3');
INSERT INTO shop_area VALUES ('49', '昌平区', '36', '0', '3');
INSERT INTO shop_area VALUES ('50', '大兴区', '36', '0', '3');
INSERT INTO shop_area VALUES ('51', '怀柔区', '36', '0', '3');
INSERT INTO shop_area VALUES ('52', '平谷区', '36', '0', '3');
INSERT INTO shop_area VALUES ('53', '密云县', '36', '0', '3');
INSERT INTO shop_area VALUES ('54', '延庆县', '36', '0', '3');
INSERT INTO shop_area VALUES ('39', '上海市', '9', '0', '2');
INSERT INTO shop_area VALUES ('40', '天津市', '2', '0', '2');
INSERT INTO shop_area VALUES ('62', '重庆市', '22', '0', '2');
INSERT INTO shop_area VALUES ('55', '和平区', '40', '0', '3');
INSERT INTO shop_area VALUES ('56', '河东区', '40', '0', '3');
INSERT INTO shop_area VALUES ('57', '河西区', '40', '0', '3');
INSERT INTO shop_area VALUES ('58', '南开区', '40', '0', '3');
INSERT INTO shop_area VALUES ('59', '河北区', '40', '0', '3');
INSERT INTO shop_area VALUES ('60', '红桥区', '40', '0', '3');
INSERT INTO shop_area VALUES ('61', '塘沽区', '40', '0', '3');
INSERT INTO shop_area VALUES ('64', '东丽区', '40', '0', '3');
INSERT INTO shop_area VALUES ('65', '西青区', '40', '0', '3');
INSERT INTO shop_area VALUES ('66', '津南区', '40', '0', '3');
INSERT INTO shop_area VALUES ('67', '北辰区', '40', '0', '3');
INSERT INTO shop_area VALUES ('68', '武清区', '40', '0', '3');
INSERT INTO shop_area VALUES ('69', '宝坻区', '40', '0', '3');
INSERT INTO shop_area VALUES ('70', '宁河县', '40', '0', '3');
INSERT INTO shop_area VALUES ('71', '静海县', '40', '0', '3');
INSERT INTO shop_area VALUES ('72', '蓟县', '40', '0', '3');
INSERT INTO shop_area VALUES ('73', '石家庄市', '3', '0', '2');
INSERT INTO shop_area VALUES ('74', '唐山市', '3', '0', '2');
INSERT INTO shop_area VALUES ('75', '秦皇岛市', '3', '0', '2');
INSERT INTO shop_area VALUES ('76', '邯郸市', '3', '0', '2');
INSERT INTO shop_area VALUES ('77', '邢台市', '3', '0', '2');
INSERT INTO shop_area VALUES ('78', '保定市', '3', '0', '2');
INSERT INTO shop_area VALUES ('79', '张家口市', '3', '0', '2');
INSERT INTO shop_area VALUES ('80', '承德市', '3', '0', '2');
INSERT INTO shop_area VALUES ('81', '衡水市', '3', '0', '2');
INSERT INTO shop_area VALUES ('82', '廊坊市', '3', '0', '2');
INSERT INTO shop_area VALUES ('83', '沧州市', '3', '0', '2');
INSERT INTO shop_area VALUES ('84', '太原市', '4', '0', '2');
INSERT INTO shop_area VALUES ('85', '大同市', '4', '0', '2');
INSERT INTO shop_area VALUES ('86', '阳泉市', '4', '0', '2');
INSERT INTO shop_area VALUES ('87', '长治市', '4', '0', '2');
INSERT INTO shop_area VALUES ('88', '晋城市', '4', '0', '2');
INSERT INTO shop_area VALUES ('89', '朔州市', '4', '0', '2');
INSERT INTO shop_area VALUES ('90', '晋中市', '4', '0', '2');
INSERT INTO shop_area VALUES ('91', '运城市', '4', '0', '2');
INSERT INTO shop_area VALUES ('92', '忻州市', '4', '0', '2');
INSERT INTO shop_area VALUES ('93', '临汾市', '4', '0', '2');
INSERT INTO shop_area VALUES ('94', '吕梁市', '4', '0', '2');
INSERT INTO shop_area VALUES ('95', '呼和浩特市', '5', '0', '2');
INSERT INTO shop_area VALUES ('96', '包头市', '5', '0', '2');
INSERT INTO shop_area VALUES ('97', '乌海市', '5', '0', '2');
INSERT INTO shop_area VALUES ('98', '赤峰市', '5', '0', '2');
INSERT INTO shop_area VALUES ('99', '通辽市', '5', '0', '2');
INSERT INTO shop_area VALUES ('100', '鄂尔多斯市', '5', '0', '2');
INSERT INTO shop_area VALUES ('101', '呼伦贝尔市', '5', '0', '2');
INSERT INTO shop_area VALUES ('102', '巴彦淖尔市', '5', '0', '2');
INSERT INTO shop_area VALUES ('103', '乌兰察布市', '5', '0', '2');
INSERT INTO shop_area VALUES ('104', '兴安盟', '5', '0', '2');
INSERT INTO shop_area VALUES ('105', '锡林郭勒盟', '5', '0', '2');
INSERT INTO shop_area VALUES ('106', '阿拉善盟', '5', '0', '2');
INSERT INTO shop_area VALUES ('107', '沈阳市', '6', '0', '2');
INSERT INTO shop_area VALUES ('108', '大连市', '6', '0', '2');
INSERT INTO shop_area VALUES ('109', '鞍山市', '6', '0', '2');
INSERT INTO shop_area VALUES ('110', '抚顺市', '6', '0', '2');
INSERT INTO shop_area VALUES ('111', '本溪市', '6', '0', '2');
INSERT INTO shop_area VALUES ('112', '丹东市', '6', '0', '2');
INSERT INTO shop_area VALUES ('113', '锦州市', '6', '0', '2');
INSERT INTO shop_area VALUES ('114', '营口市', '6', '0', '2');
INSERT INTO shop_area VALUES ('115', '阜新市', '6', '0', '2');
INSERT INTO shop_area VALUES ('116', '辽阳市', '6', '0', '2');
INSERT INTO shop_area VALUES ('117', '盘锦市', '6', '0', '2');
INSERT INTO shop_area VALUES ('118', '铁岭市', '6', '0', '2');
INSERT INTO shop_area VALUES ('119', '朝阳市', '6', '0', '2');
INSERT INTO shop_area VALUES ('120', '葫芦岛市', '6', '0', '2');
INSERT INTO shop_area VALUES ('121', '长春市', '7', '0', '2');
INSERT INTO shop_area VALUES ('122', '吉林市', '7', '0', '2');
INSERT INTO shop_area VALUES ('123', '四平市', '7', '0', '2');
INSERT INTO shop_area VALUES ('124', '辽源市', '7', '0', '2');
INSERT INTO shop_area VALUES ('125', '通化市', '7', '0', '2');
INSERT INTO shop_area VALUES ('126', '白山市', '7', '0', '2');
INSERT INTO shop_area VALUES ('127', '松原市', '7', '0', '2');
INSERT INTO shop_area VALUES ('128', '白城市', '7', '0', '2');
INSERT INTO shop_area VALUES ('129', '延边朝鲜族自治州', '7', '0', '2');
INSERT INTO shop_area VALUES ('130', '哈尔滨市', '8', '0', '2');
INSERT INTO shop_area VALUES ('131', '齐齐哈尔市', '8', '0', '2');
INSERT INTO shop_area VALUES ('132', '鸡西市', '8', '0', '2');
INSERT INTO shop_area VALUES ('133', '鹤岗市', '8', '0', '2');
INSERT INTO shop_area VALUES ('134', '双鸭山市', '8', '0', '2');
INSERT INTO shop_area VALUES ('135', '大庆市', '8', '0', '2');
INSERT INTO shop_area VALUES ('136', '伊春市', '8', '0', '2');
INSERT INTO shop_area VALUES ('137', '佳木斯市', '8', '0', '2');
INSERT INTO shop_area VALUES ('138', '七台河市', '8', '0', '2');
INSERT INTO shop_area VALUES ('139', '牡丹江市', '8', '0', '2');
INSERT INTO shop_area VALUES ('140', '黑河市', '8', '0', '2');
INSERT INTO shop_area VALUES ('141', '绥化市', '8', '0', '2');
INSERT INTO shop_area VALUES ('142', '大兴安岭地区', '8', '0', '2');
INSERT INTO shop_area VALUES ('143', '黄浦区', '39', '0', '3');
INSERT INTO shop_area VALUES ('144', '卢湾区', '39', '0', '3');
INSERT INTO shop_area VALUES ('145', '徐汇区', '39', '0', '3');
INSERT INTO shop_area VALUES ('146', '长宁区', '39', '0', '3');
INSERT INTO shop_area VALUES ('147', '静安区', '39', '0', '3');
INSERT INTO shop_area VALUES ('148', '普陀区', '39', '0', '3');
INSERT INTO shop_area VALUES ('149', '闸北区', '39', '0', '3');
INSERT INTO shop_area VALUES ('150', '虹口区', '39', '0', '3');
INSERT INTO shop_area VALUES ('151', '杨浦区', '39', '0', '3');
INSERT INTO shop_area VALUES ('152', '闵行区', '39', '0', '3');
INSERT INTO shop_area VALUES ('153', '宝山区', '39', '0', '3');
INSERT INTO shop_area VALUES ('154', '嘉定区', '39', '0', '3');
INSERT INTO shop_area VALUES ('155', '浦东新区', '39', '0', '3');
INSERT INTO shop_area VALUES ('156', '金山区', '39', '0', '3');
INSERT INTO shop_area VALUES ('157', '松江区', '39', '0', '3');
INSERT INTO shop_area VALUES ('158', '青浦区', '39', '0', '3');
INSERT INTO shop_area VALUES ('159', '南汇区', '39', '0', '3');
INSERT INTO shop_area VALUES ('160', '奉贤区', '39', '0', '3');
INSERT INTO shop_area VALUES ('161', '崇明县', '39', '0', '3');
INSERT INTO shop_area VALUES ('162', '南京市', '10', '0', '2');
INSERT INTO shop_area VALUES ('163', '无锡市', '10', '0', '2');
INSERT INTO shop_area VALUES ('164', '徐州市', '10', '0', '2');
INSERT INTO shop_area VALUES ('165', '常州市', '10', '0', '2');
INSERT INTO shop_area VALUES ('166', '苏州市', '10', '0', '2');
INSERT INTO shop_area VALUES ('167', '南通市', '10', '0', '2');
INSERT INTO shop_area VALUES ('168', '连云港市', '10', '0', '2');
INSERT INTO shop_area VALUES ('169', '淮安市', '10', '0', '2');
INSERT INTO shop_area VALUES ('170', '盐城市', '10', '0', '2');
INSERT INTO shop_area VALUES ('171', '扬州市', '10', '0', '2');
INSERT INTO shop_area VALUES ('172', '镇江市', '10', '0', '2');
INSERT INTO shop_area VALUES ('173', '泰州市', '10', '0', '2');
INSERT INTO shop_area VALUES ('174', '宿迁市', '10', '0', '2');
INSERT INTO shop_area VALUES ('175', '杭州市', '11', '0', '2');
INSERT INTO shop_area VALUES ('176', '宁波市', '11', '0', '2');
INSERT INTO shop_area VALUES ('177', '温州市', '11', '0', '2');
INSERT INTO shop_area VALUES ('178', '嘉兴市', '11', '0', '2');
INSERT INTO shop_area VALUES ('179', '湖州市', '11', '0', '2');
INSERT INTO shop_area VALUES ('180', '绍兴市', '11', '0', '2');
INSERT INTO shop_area VALUES ('181', '舟山市', '11', '0', '2');
INSERT INTO shop_area VALUES ('182', '衢州市', '11', '0', '2');
INSERT INTO shop_area VALUES ('183', '金华市', '11', '0', '2');
INSERT INTO shop_area VALUES ('184', '台州市', '11', '0', '2');
INSERT INTO shop_area VALUES ('185', '丽水市', '11', '0', '2');
INSERT INTO shop_area VALUES ('186', '合肥市', '12', '0', '2');
INSERT INTO shop_area VALUES ('187', '芜湖市', '12', '0', '2');
INSERT INTO shop_area VALUES ('188', '蚌埠市', '12', '0', '2');
INSERT INTO shop_area VALUES ('189', '淮南市', '12', '0', '2');
INSERT INTO shop_area VALUES ('190', '马鞍山市', '12', '0', '2');
INSERT INTO shop_area VALUES ('191', '淮北市', '12', '0', '2');
INSERT INTO shop_area VALUES ('192', '铜陵市', '12', '0', '2');
INSERT INTO shop_area VALUES ('193', '安庆市', '12', '0', '2');
INSERT INTO shop_area VALUES ('194', '黄山市', '12', '0', '2');
INSERT INTO shop_area VALUES ('195', '滁州市', '12', '0', '2');
INSERT INTO shop_area VALUES ('196', '阜阳市', '12', '0', '2');
INSERT INTO shop_area VALUES ('197', '宿州市', '12', '0', '2');
INSERT INTO shop_area VALUES ('198', '巢湖市', '12', '0', '2');
INSERT INTO shop_area VALUES ('199', '六安市', '12', '0', '2');
INSERT INTO shop_area VALUES ('200', '亳州市', '12', '0', '2');
INSERT INTO shop_area VALUES ('201', '池州市', '12', '0', '2');
INSERT INTO shop_area VALUES ('202', '宣城市', '12', '0', '2');
INSERT INTO shop_area VALUES ('203', '福州市', '13', '0', '2');
INSERT INTO shop_area VALUES ('204', '厦门市', '13', '0', '2');
INSERT INTO shop_area VALUES ('205', '莆田市', '13', '0', '2');
INSERT INTO shop_area VALUES ('206', '三明市', '13', '0', '2');
INSERT INTO shop_area VALUES ('207', '泉州市', '13', '0', '2');
INSERT INTO shop_area VALUES ('208', '漳州市', '13', '0', '2');
INSERT INTO shop_area VALUES ('209', '南平市', '13', '0', '2');
INSERT INTO shop_area VALUES ('210', '龙岩市', '13', '0', '2');
INSERT INTO shop_area VALUES ('211', '宁德市', '13', '0', '2');
INSERT INTO shop_area VALUES ('212', '南昌市', '14', '0', '2');
INSERT INTO shop_area VALUES ('213', '景德镇市', '14', '0', '2');
INSERT INTO shop_area VALUES ('214', '萍乡市', '14', '0', '2');
INSERT INTO shop_area VALUES ('215', '九江市', '14', '0', '2');
INSERT INTO shop_area VALUES ('216', '新余市', '14', '0', '2');
INSERT INTO shop_area VALUES ('217', '鹰潭市', '14', '0', '2');
INSERT INTO shop_area VALUES ('218', '赣州市', '14', '0', '2');
INSERT INTO shop_area VALUES ('219', '吉安市', '14', '0', '2');
INSERT INTO shop_area VALUES ('220', '宜春市', '14', '0', '2');
INSERT INTO shop_area VALUES ('221', '抚州市', '14', '0', '2');
INSERT INTO shop_area VALUES ('222', '上饶市', '14', '0', '2');
INSERT INTO shop_area VALUES ('223', '济南市', '15', '0', '2');
INSERT INTO shop_area VALUES ('224', '青岛市', '15', '0', '2');
INSERT INTO shop_area VALUES ('225', '淄博市', '15', '0', '2');
INSERT INTO shop_area VALUES ('226', '枣庄市', '15', '0', '2');
INSERT INTO shop_area VALUES ('227', '东营市', '15', '0', '2');
INSERT INTO shop_area VALUES ('228', '烟台市', '15', '0', '2');
INSERT INTO shop_area VALUES ('229', '潍坊市', '15', '0', '2');
INSERT INTO shop_area VALUES ('230', '济宁市', '15', '0', '2');
INSERT INTO shop_area VALUES ('231', '泰安市', '15', '0', '2');
INSERT INTO shop_area VALUES ('232', '威海市', '15', '0', '2');
INSERT INTO shop_area VALUES ('233', '日照市', '15', '0', '2');
INSERT INTO shop_area VALUES ('234', '莱芜市', '15', '0', '2');
INSERT INTO shop_area VALUES ('235', '临沂市', '15', '0', '2');
INSERT INTO shop_area VALUES ('236', '德州市', '15', '0', '2');
INSERT INTO shop_area VALUES ('237', '聊城市', '15', '0', '2');
INSERT INTO shop_area VALUES ('238', '滨州市', '15', '0', '2');
INSERT INTO shop_area VALUES ('239', '菏泽市', '15', '0', '2');
INSERT INTO shop_area VALUES ('240', '郑州市', '16', '0', '2');
INSERT INTO shop_area VALUES ('241', '开封市', '16', '0', '2');
INSERT INTO shop_area VALUES ('242', '洛阳市', '16', '0', '2');
INSERT INTO shop_area VALUES ('243', '平顶山市', '16', '0', '2');
INSERT INTO shop_area VALUES ('244', '安阳市', '16', '0', '2');
INSERT INTO shop_area VALUES ('245', '鹤壁市', '16', '0', '2');
INSERT INTO shop_area VALUES ('246', '新乡市', '16', '0', '2');
INSERT INTO shop_area VALUES ('247', '焦作市', '16', '0', '2');
INSERT INTO shop_area VALUES ('248', '濮阳市', '16', '0', '2');
INSERT INTO shop_area VALUES ('249', '许昌市', '16', '0', '2');
INSERT INTO shop_area VALUES ('250', '漯河市', '16', '0', '2');
INSERT INTO shop_area VALUES ('251', '三门峡市', '16', '0', '2');
INSERT INTO shop_area VALUES ('252', '南阳市', '16', '0', '2');
INSERT INTO shop_area VALUES ('253', '商丘市', '16', '0', '2');
INSERT INTO shop_area VALUES ('254', '信阳市', '16', '0', '2');
INSERT INTO shop_area VALUES ('255', '周口市', '16', '0', '2');
INSERT INTO shop_area VALUES ('256', '驻马店市', '16', '0', '2');
INSERT INTO shop_area VALUES ('257', '济源市', '16', '0', '2');
INSERT INTO shop_area VALUES ('258', '武汉市', '17', '0', '2');
INSERT INTO shop_area VALUES ('259', '黄石市', '17', '0', '2');
INSERT INTO shop_area VALUES ('260', '十堰市', '17', '0', '2');
INSERT INTO shop_area VALUES ('261', '宜昌市', '17', '0', '2');
INSERT INTO shop_area VALUES ('262', '襄樊市', '17', '0', '2');
INSERT INTO shop_area VALUES ('263', '鄂州市', '17', '0', '2');
INSERT INTO shop_area VALUES ('264', '荆门市', '17', '0', '2');
INSERT INTO shop_area VALUES ('265', '孝感市', '17', '0', '2');
INSERT INTO shop_area VALUES ('266', '荆州市', '17', '0', '2');
INSERT INTO shop_area VALUES ('267', '黄冈市', '17', '0', '2');
INSERT INTO shop_area VALUES ('268', '咸宁市', '17', '0', '2');
INSERT INTO shop_area VALUES ('269', '随州市', '17', '0', '2');
INSERT INTO shop_area VALUES ('270', '恩施土家族苗族自治州', '17', '0', '2');
INSERT INTO shop_area VALUES ('271', '仙桃市', '17', '0', '2');
INSERT INTO shop_area VALUES ('272', '潜江市', '17', '0', '2');
INSERT INTO shop_area VALUES ('273', '天门市', '17', '0', '2');
INSERT INTO shop_area VALUES ('274', '神农架林区', '17', '0', '2');
INSERT INTO shop_area VALUES ('275', '长沙市', '18', '0', '2');
INSERT INTO shop_area VALUES ('276', '株洲市', '18', '0', '2');
INSERT INTO shop_area VALUES ('277', '湘潭市', '18', '0', '2');
INSERT INTO shop_area VALUES ('278', '衡阳市', '18', '0', '2');
INSERT INTO shop_area VALUES ('279', '邵阳市', '18', '0', '2');
INSERT INTO shop_area VALUES ('280', '岳阳市', '18', '0', '2');
INSERT INTO shop_area VALUES ('281', '常德市', '18', '0', '2');
INSERT INTO shop_area VALUES ('282', '张家界市', '18', '0', '2');
INSERT INTO shop_area VALUES ('283', '益阳市', '18', '0', '2');
INSERT INTO shop_area VALUES ('284', '郴州市', '18', '0', '2');
INSERT INTO shop_area VALUES ('285', '永州市', '18', '0', '2');
INSERT INTO shop_area VALUES ('286', '怀化市', '18', '0', '2');
INSERT INTO shop_area VALUES ('287', '娄底市', '18', '0', '2');
INSERT INTO shop_area VALUES ('288', '湘西土家族苗族自治州', '18', '0', '2');
INSERT INTO shop_area VALUES ('289', '广州市', '19', '0', '2');
INSERT INTO shop_area VALUES ('290', '韶关市', '19', '0', '2');
INSERT INTO shop_area VALUES ('291', '深圳市', '19', '0', '2');
INSERT INTO shop_area VALUES ('292', '珠海市', '19', '0', '2');
INSERT INTO shop_area VALUES ('293', '汕头市', '19', '0', '2');
INSERT INTO shop_area VALUES ('294', '佛山市', '19', '0', '2');
INSERT INTO shop_area VALUES ('295', '江门市', '19', '0', '2');
INSERT INTO shop_area VALUES ('296', '湛江市', '19', '0', '2');
INSERT INTO shop_area VALUES ('297', '茂名市', '19', '0', '2');
INSERT INTO shop_area VALUES ('298', '肇庆市', '19', '0', '2');
INSERT INTO shop_area VALUES ('299', '惠州市', '19', '0', '2');
INSERT INTO shop_area VALUES ('300', '梅州市', '19', '0', '2');
INSERT INTO shop_area VALUES ('301', '汕尾市', '19', '0', '2');
INSERT INTO shop_area VALUES ('302', '河源市', '19', '0', '2');
INSERT INTO shop_area VALUES ('303', '阳江市', '19', '0', '2');
INSERT INTO shop_area VALUES ('304', '清远市', '19', '0', '2');
INSERT INTO shop_area VALUES ('305', '东莞市', '19', '0', '2');
INSERT INTO shop_area VALUES ('306', '中山市', '19', '0', '2');
INSERT INTO shop_area VALUES ('307', '潮州市', '19', '0', '2');
INSERT INTO shop_area VALUES ('308', '揭阳市', '19', '0', '2');
INSERT INTO shop_area VALUES ('309', '云浮市', '19', '0', '2');
INSERT INTO shop_area VALUES ('310', '南宁市', '20', '0', '2');
INSERT INTO shop_area VALUES ('311', '柳州市', '20', '0', '2');
INSERT INTO shop_area VALUES ('312', '桂林市', '20', '0', '2');
INSERT INTO shop_area VALUES ('313', '梧州市', '20', '0', '2');
INSERT INTO shop_area VALUES ('314', '北海市', '20', '0', '2');
INSERT INTO shop_area VALUES ('315', '防城港市', '20', '0', '2');
INSERT INTO shop_area VALUES ('316', '钦州市', '20', '0', '2');
INSERT INTO shop_area VALUES ('317', '贵港市', '20', '0', '2');
INSERT INTO shop_area VALUES ('318', '玉林市', '20', '0', '2');
INSERT INTO shop_area VALUES ('319', '百色市', '20', '0', '2');
INSERT INTO shop_area VALUES ('320', '贺州市', '20', '0', '2');
INSERT INTO shop_area VALUES ('321', '河池市', '20', '0', '2');
INSERT INTO shop_area VALUES ('322', '来宾市', '20', '0', '2');
INSERT INTO shop_area VALUES ('323', '崇左市', '20', '0', '2');
INSERT INTO shop_area VALUES ('324', '海口市', '21', '0', '2');
INSERT INTO shop_area VALUES ('325', '三亚市', '21', '0', '2');
INSERT INTO shop_area VALUES ('326', '五指山市', '21', '0', '2');
INSERT INTO shop_area VALUES ('327', '琼海市', '21', '0', '2');
INSERT INTO shop_area VALUES ('328', '儋州市', '21', '0', '2');
INSERT INTO shop_area VALUES ('329', '文昌市', '21', '0', '2');
INSERT INTO shop_area VALUES ('330', '万宁市', '21', '0', '2');
INSERT INTO shop_area VALUES ('331', '东方市', '21', '0', '2');
INSERT INTO shop_area VALUES ('332', '定安县', '21', '0', '2');
INSERT INTO shop_area VALUES ('333', '屯昌县', '21', '0', '2');
INSERT INTO shop_area VALUES ('334', '澄迈县', '21', '0', '2');
INSERT INTO shop_area VALUES ('335', '临高县', '21', '0', '2');
INSERT INTO shop_area VALUES ('336', '白沙黎族自治县', '21', '0', '2');
INSERT INTO shop_area VALUES ('337', '昌江黎族自治县', '21', '0', '2');
INSERT INTO shop_area VALUES ('338', '乐东黎族自治县', '21', '0', '2');
INSERT INTO shop_area VALUES ('339', '陵水黎族自治县', '21', '0', '2');
INSERT INTO shop_area VALUES ('340', '保亭黎族苗族自治县', '21', '0', '2');
INSERT INTO shop_area VALUES ('341', '琼中黎族苗族自治县', '21', '0', '2');
INSERT INTO shop_area VALUES ('342', '西沙群岛', '21', '0', '2');
INSERT INTO shop_area VALUES ('343', '南沙群岛', '21', '0', '2');
INSERT INTO shop_area VALUES ('344', '中沙群岛的岛礁及其海域', '21', '0', '2');
INSERT INTO shop_area VALUES ('345', '万州区', '62', '0', '3');
INSERT INTO shop_area VALUES ('346', '涪陵区', '62', '0', '3');
INSERT INTO shop_area VALUES ('347', '渝中区', '62', '0', '3');
INSERT INTO shop_area VALUES ('348', '大渡口区', '62', '0', '3');
INSERT INTO shop_area VALUES ('349', '江北区', '62', '0', '3');
INSERT INTO shop_area VALUES ('350', '沙坪坝区', '62', '0', '3');
INSERT INTO shop_area VALUES ('351', '九龙坡区', '62', '0', '3');
INSERT INTO shop_area VALUES ('352', '南岸区', '62', '0', '3');
INSERT INTO shop_area VALUES ('353', '北碚区', '62', '0', '3');
INSERT INTO shop_area VALUES ('354', '双桥区', '62', '0', '3');
INSERT INTO shop_area VALUES ('355', '万盛区', '62', '0', '3');
INSERT INTO shop_area VALUES ('356', '渝北区', '62', '0', '3');
INSERT INTO shop_area VALUES ('357', '巴南区', '62', '0', '3');
INSERT INTO shop_area VALUES ('358', '黔江区', '62', '0', '3');
INSERT INTO shop_area VALUES ('359', '长寿区', '62', '0', '3');
INSERT INTO shop_area VALUES ('360', '綦江县', '62', '0', '3');
INSERT INTO shop_area VALUES ('361', '潼南县', '62', '0', '3');
INSERT INTO shop_area VALUES ('362', '铜梁县', '62', '0', '3');
INSERT INTO shop_area VALUES ('363', '大足县', '62', '0', '3');
INSERT INTO shop_area VALUES ('364', '荣昌县', '62', '0', '3');
INSERT INTO shop_area VALUES ('365', '璧山县', '62', '0', '3');
INSERT INTO shop_area VALUES ('366', '梁平县', '62', '0', '3');
INSERT INTO shop_area VALUES ('367', '城口县', '62', '0', '3');
INSERT INTO shop_area VALUES ('368', '丰都县', '62', '0', '3');
INSERT INTO shop_area VALUES ('369', '垫江县', '62', '0', '3');
INSERT INTO shop_area VALUES ('370', '武隆县', '62', '0', '3');
INSERT INTO shop_area VALUES ('371', '忠县', '62', '0', '3');
INSERT INTO shop_area VALUES ('372', '开县', '62', '0', '3');
INSERT INTO shop_area VALUES ('373', '云阳县', '62', '0', '3');
INSERT INTO shop_area VALUES ('374', '奉节县', '62', '0', '3');
INSERT INTO shop_area VALUES ('375', '巫山县', '62', '0', '3');
INSERT INTO shop_area VALUES ('376', '巫溪县', '62', '0', '3');
INSERT INTO shop_area VALUES ('377', '石柱土家族自治县', '62', '0', '3');
INSERT INTO shop_area VALUES ('378', '秀山土家族苗族自治县', '62', '0', '3');
INSERT INTO shop_area VALUES ('379', '酉阳土家族苗族自治县', '62', '0', '3');
INSERT INTO shop_area VALUES ('380', '彭水苗族土家族自治县', '62', '0', '3');
INSERT INTO shop_area VALUES ('381', '江津市', '62', '0', '3');
INSERT INTO shop_area VALUES ('382', '合川市', '62', '0', '3');
INSERT INTO shop_area VALUES ('383', '永川市', '62', '0', '3');
INSERT INTO shop_area VALUES ('384', '南川市', '62', '0', '3');
INSERT INTO shop_area VALUES ('385', '成都市', '23', '0', '2');
INSERT INTO shop_area VALUES ('386', '自贡市', '23', '0', '2');
INSERT INTO shop_area VALUES ('387', '攀枝花市', '23', '0', '2');
INSERT INTO shop_area VALUES ('388', '泸州市', '23', '0', '2');
INSERT INTO shop_area VALUES ('389', '德阳市', '23', '0', '2');
INSERT INTO shop_area VALUES ('390', '绵阳市', '23', '0', '2');
INSERT INTO shop_area VALUES ('391', '广元市', '23', '0', '2');
INSERT INTO shop_area VALUES ('392', '遂宁市', '23', '0', '2');
INSERT INTO shop_area VALUES ('393', '内江市', '23', '0', '2');
INSERT INTO shop_area VALUES ('394', '乐山市', '23', '0', '2');
INSERT INTO shop_area VALUES ('395', '南充市', '23', '0', '2');
INSERT INTO shop_area VALUES ('396', '眉山市', '23', '0', '2');
INSERT INTO shop_area VALUES ('397', '宜宾市', '23', '0', '2');
INSERT INTO shop_area VALUES ('398', '广安市', '23', '0', '2');
INSERT INTO shop_area VALUES ('399', '达州市', '23', '0', '2');
INSERT INTO shop_area VALUES ('400', '雅安市', '23', '0', '2');
INSERT INTO shop_area VALUES ('401', '巴中市', '23', '0', '2');
INSERT INTO shop_area VALUES ('402', '资阳市', '23', '0', '2');
INSERT INTO shop_area VALUES ('403', '阿坝藏族羌族自治州', '23', '0', '2');
INSERT INTO shop_area VALUES ('404', '甘孜藏族自治州', '23', '0', '2');
INSERT INTO shop_area VALUES ('405', '凉山彝族自治州', '23', '0', '2');
INSERT INTO shop_area VALUES ('406', '贵阳市', '24', '0', '2');
INSERT INTO shop_area VALUES ('407', '六盘水市', '24', '0', '2');
INSERT INTO shop_area VALUES ('408', '遵义市', '24', '0', '2');
INSERT INTO shop_area VALUES ('409', '安顺市', '24', '0', '2');
INSERT INTO shop_area VALUES ('410', '铜仁地区', '24', '0', '2');
INSERT INTO shop_area VALUES ('411', '黔西南布依族苗族自治州', '24', '0', '2');
INSERT INTO shop_area VALUES ('412', '毕节地区', '24', '0', '2');
INSERT INTO shop_area VALUES ('413', '黔东南苗族侗族自治州', '24', '0', '2');
INSERT INTO shop_area VALUES ('414', '黔南布依族苗族自治州', '24', '0', '2');
INSERT INTO shop_area VALUES ('415', '昆明市', '25', '0', '2');
INSERT INTO shop_area VALUES ('416', '曲靖市', '25', '0', '2');
INSERT INTO shop_area VALUES ('417', '玉溪市', '25', '0', '2');
INSERT INTO shop_area VALUES ('418', '保山市', '25', '0', '2');
INSERT INTO shop_area VALUES ('419', '昭通市', '25', '0', '2');
INSERT INTO shop_area VALUES ('420', '丽江市', '25', '0', '2');
INSERT INTO shop_area VALUES ('421', '思茅市', '25', '0', '2');
INSERT INTO shop_area VALUES ('422', '临沧市', '25', '0', '2');
INSERT INTO shop_area VALUES ('423', '楚雄彝族自治州', '25', '0', '2');
INSERT INTO shop_area VALUES ('424', '红河哈尼族彝族自治州', '25', '0', '2');
INSERT INTO shop_area VALUES ('425', '文山壮族苗族自治州', '25', '0', '2');
INSERT INTO shop_area VALUES ('426', '西双版纳傣族自治州', '25', '0', '2');
INSERT INTO shop_area VALUES ('427', '大理白族自治州', '25', '0', '2');
INSERT INTO shop_area VALUES ('428', '德宏傣族景颇族自治州', '25', '0', '2');
INSERT INTO shop_area VALUES ('429', '怒江傈僳族自治州', '25', '0', '2');
INSERT INTO shop_area VALUES ('430', '迪庆藏族自治州', '25', '0', '2');
INSERT INTO shop_area VALUES ('431', '拉萨市', '26', '0', '2');
INSERT INTO shop_area VALUES ('432', '昌都地区', '26', '0', '2');
INSERT INTO shop_area VALUES ('433', '山南地区', '26', '0', '2');
INSERT INTO shop_area VALUES ('434', '日喀则地区', '26', '0', '2');
INSERT INTO shop_area VALUES ('435', '那曲地区', '26', '0', '2');
INSERT INTO shop_area VALUES ('436', '阿里地区', '26', '0', '2');
INSERT INTO shop_area VALUES ('437', '林芝地区', '26', '0', '2');
INSERT INTO shop_area VALUES ('438', '西安市', '27', '0', '2');
INSERT INTO shop_area VALUES ('439', '铜川市', '27', '0', '2');
INSERT INTO shop_area VALUES ('440', '宝鸡市', '27', '0', '2');
INSERT INTO shop_area VALUES ('441', '咸阳市', '27', '0', '2');
INSERT INTO shop_area VALUES ('442', '渭南市', '27', '0', '2');
INSERT INTO shop_area VALUES ('443', '延安市', '27', '0', '2');
INSERT INTO shop_area VALUES ('444', '汉中市', '27', '0', '2');
INSERT INTO shop_area VALUES ('445', '榆林市', '27', '0', '2');
INSERT INTO shop_area VALUES ('446', '安康市', '27', '0', '2');
INSERT INTO shop_area VALUES ('447', '商洛市', '27', '0', '2');
INSERT INTO shop_area VALUES ('448', '兰州市', '28', '0', '2');
INSERT INTO shop_area VALUES ('449', '嘉峪关市', '28', '0', '2');
INSERT INTO shop_area VALUES ('450', '金昌市', '28', '0', '2');
INSERT INTO shop_area VALUES ('451', '白银市', '28', '0', '2');
INSERT INTO shop_area VALUES ('452', '天水市', '28', '0', '2');
INSERT INTO shop_area VALUES ('453', '武威市', '28', '0', '2');
INSERT INTO shop_area VALUES ('454', '张掖市', '28', '0', '2');
INSERT INTO shop_area VALUES ('455', '平凉市', '28', '0', '2');
INSERT INTO shop_area VALUES ('456', '酒泉市', '28', '0', '2');
INSERT INTO shop_area VALUES ('457', '庆阳市', '28', '0', '2');
INSERT INTO shop_area VALUES ('458', '定西市', '28', '0', '2');
INSERT INTO shop_area VALUES ('459', '陇南市', '28', '0', '2');
INSERT INTO shop_area VALUES ('460', '临夏回族自治州', '28', '0', '2');
INSERT INTO shop_area VALUES ('461', '甘南藏族自治州', '28', '0', '2');
INSERT INTO shop_area VALUES ('462', '西宁市', '29', '0', '2');
INSERT INTO shop_area VALUES ('463', '海东地区', '29', '0', '2');
INSERT INTO shop_area VALUES ('464', '海北藏族自治州', '29', '0', '2');
INSERT INTO shop_area VALUES ('465', '黄南藏族自治州', '29', '0', '2');
INSERT INTO shop_area VALUES ('466', '海南藏族自治州', '29', '0', '2');
INSERT INTO shop_area VALUES ('467', '果洛藏族自治州', '29', '0', '2');
INSERT INTO shop_area VALUES ('468', '玉树藏族自治州', '29', '0', '2');
INSERT INTO shop_area VALUES ('469', '海西蒙古族藏族自治州', '29', '0', '2');
INSERT INTO shop_area VALUES ('470', '银川市', '30', '0', '2');
INSERT INTO shop_area VALUES ('471', '石嘴山市', '30', '0', '2');
INSERT INTO shop_area VALUES ('472', '吴忠市', '30', '0', '2');
INSERT INTO shop_area VALUES ('473', '固原市', '30', '0', '2');
INSERT INTO shop_area VALUES ('474', '中卫市', '30', '0', '2');
INSERT INTO shop_area VALUES ('475', '乌鲁木齐市', '31', '0', '2');
INSERT INTO shop_area VALUES ('476', '克拉玛依市', '31', '0', '2');
INSERT INTO shop_area VALUES ('477', '吐鲁番地区', '31', '0', '2');
INSERT INTO shop_area VALUES ('478', '哈密地区', '31', '0', '2');
INSERT INTO shop_area VALUES ('479', '昌吉回族自治州', '31', '0', '2');
INSERT INTO shop_area VALUES ('480', '博尔塔拉蒙古自治州', '31', '0', '2');
INSERT INTO shop_area VALUES ('481', '巴音郭楞蒙古自治州', '31', '0', '2');
INSERT INTO shop_area VALUES ('482', '阿克苏地区', '31', '0', '2');
INSERT INTO shop_area VALUES ('483', '克孜勒苏柯尔克孜自治州', '31', '0', '2');
INSERT INTO shop_area VALUES ('484', '喀什地区', '31', '0', '2');
INSERT INTO shop_area VALUES ('485', '和田地区', '31', '0', '2');
INSERT INTO shop_area VALUES ('486', '伊犁哈萨克自治州', '31', '0', '2');
INSERT INTO shop_area VALUES ('487', '塔城地区', '31', '0', '2');
INSERT INTO shop_area VALUES ('488', '阿勒泰地区', '31', '0', '2');
INSERT INTO shop_area VALUES ('489', '石河子市', '31', '0', '2');
INSERT INTO shop_area VALUES ('490', '阿拉尔市', '31', '0', '2');
INSERT INTO shop_area VALUES ('491', '图木舒克市', '31', '0', '2');
INSERT INTO shop_area VALUES ('492', '五家渠市', '31', '0', '2');
INSERT INTO shop_area VALUES ('493', '台北市', '32', '0', '2');
INSERT INTO shop_area VALUES ('494', '高雄市', '32', '0', '2');
INSERT INTO shop_area VALUES ('495', '基隆市', '32', '0', '2');
INSERT INTO shop_area VALUES ('496', '台中市', '32', '0', '2');
INSERT INTO shop_area VALUES ('497', '台南市', '32', '0', '2');
INSERT INTO shop_area VALUES ('498', '新竹市', '32', '0', '2');
INSERT INTO shop_area VALUES ('499', '嘉义市', '32', '0', '2');
INSERT INTO shop_area VALUES ('500', '台北县', '32', '0', '2');
INSERT INTO shop_area VALUES ('501', '宜兰县', '32', '0', '2');
INSERT INTO shop_area VALUES ('502', '桃园县', '32', '0', '2');
INSERT INTO shop_area VALUES ('503', '新竹县', '32', '0', '2');
INSERT INTO shop_area VALUES ('504', '苗栗县', '32', '0', '2');
INSERT INTO shop_area VALUES ('505', '台中县', '32', '0', '2');
INSERT INTO shop_area VALUES ('506', '彰化县', '32', '0', '2');
INSERT INTO shop_area VALUES ('507', '南投县', '32', '0', '2');
INSERT INTO shop_area VALUES ('508', '云林县', '32', '0', '2');
INSERT INTO shop_area VALUES ('509', '嘉义县', '32', '0', '2');
INSERT INTO shop_area VALUES ('510', '台南县', '32', '0', '2');
INSERT INTO shop_area VALUES ('511', '高雄县', '32', '0', '2');
INSERT INTO shop_area VALUES ('512', '屏东县', '32', '0', '2');
INSERT INTO shop_area VALUES ('513', '澎湖县', '32', '0', '2');
INSERT INTO shop_area VALUES ('514', '台东县', '32', '0', '2');
INSERT INTO shop_area VALUES ('515', '花莲县', '32', '0', '2');
INSERT INTO shop_area VALUES ('516', '中西区', '33', '0', '2');
INSERT INTO shop_area VALUES ('517', '东区', '33', '0', '2');
INSERT INTO shop_area VALUES ('518', '九龙城区', '33', '0', '2');
INSERT INTO shop_area VALUES ('519', '观塘区', '33', '0', '2');
INSERT INTO shop_area VALUES ('520', '南区', '33', '0', '2');
INSERT INTO shop_area VALUES ('521', '深水埗区', '33', '0', '2');
INSERT INTO shop_area VALUES ('522', '黄大仙区', '33', '0', '2');
INSERT INTO shop_area VALUES ('523', '湾仔区', '33', '0', '2');
INSERT INTO shop_area VALUES ('524', '油尖旺区', '33', '0', '2');
INSERT INTO shop_area VALUES ('525', '离岛区', '33', '0', '2');
INSERT INTO shop_area VALUES ('526', '葵青区', '33', '0', '2');
INSERT INTO shop_area VALUES ('527', '北区', '33', '0', '2');
INSERT INTO shop_area VALUES ('528', '西贡区', '33', '0', '2');
INSERT INTO shop_area VALUES ('529', '沙田区', '33', '0', '2');
INSERT INTO shop_area VALUES ('530', '屯门区', '33', '0', '2');
INSERT INTO shop_area VALUES ('531', '大埔区', '33', '0', '2');
INSERT INTO shop_area VALUES ('532', '荃湾区', '33', '0', '2');
INSERT INTO shop_area VALUES ('533', '元朗区', '33', '0', '2');
INSERT INTO shop_area VALUES ('534', '澳门特别行政区', '34', '0', '2');
INSERT INTO shop_area VALUES ('535', '美国', '45055', '0', '3');
INSERT INTO shop_area VALUES ('536', '加拿大', '45055', '0', '3');
INSERT INTO shop_area VALUES ('537', '澳大利亚', '45055', '0', '3');
INSERT INTO shop_area VALUES ('538', '新西兰', '45055', '0', '3');
INSERT INTO shop_area VALUES ('539', '英国', '45055', '0', '3');
INSERT INTO shop_area VALUES ('540', '法国', '45055', '0', '3');
INSERT INTO shop_area VALUES ('541', '德国', '45055', '0', '3');
INSERT INTO shop_area VALUES ('542', '捷克', '45055', '0', '3');
INSERT INTO shop_area VALUES ('543', '荷兰', '45055', '0', '3');
INSERT INTO shop_area VALUES ('544', '瑞士', '45055', '0', '3');
INSERT INTO shop_area VALUES ('545', '希腊', '45055', '0', '3');
INSERT INTO shop_area VALUES ('546', '挪威', '45055', '0', '3');
INSERT INTO shop_area VALUES ('547', '瑞典', '45055', '0', '3');
INSERT INTO shop_area VALUES ('548', '丹麦', '45055', '0', '3');
INSERT INTO shop_area VALUES ('549', '芬兰', '45055', '0', '3');
INSERT INTO shop_area VALUES ('550', '爱尔兰', '45055', '0', '3');
INSERT INTO shop_area VALUES ('551', '奥地利', '45055', '0', '3');
INSERT INTO shop_area VALUES ('552', '意大利', '45055', '0', '3');
INSERT INTO shop_area VALUES ('553', '乌克兰', '45055', '0', '3');
INSERT INTO shop_area VALUES ('554', '俄罗斯', '45055', '0', '3');
INSERT INTO shop_area VALUES ('555', '西班牙', '45055', '0', '3');
INSERT INTO shop_area VALUES ('556', '韩国', '45055', '0', '3');
INSERT INTO shop_area VALUES ('557', '新加坡', '45055', '0', '3');
INSERT INTO shop_area VALUES ('558', '马来西亚', '45055', '0', '3');
INSERT INTO shop_area VALUES ('559', '印度', '45055', '0', '3');
INSERT INTO shop_area VALUES ('560', '泰国', '45055', '0', '3');
INSERT INTO shop_area VALUES ('561', '日本', '45055', '0', '3');
INSERT INTO shop_area VALUES ('562', '巴西', '45055', '0', '3');
INSERT INTO shop_area VALUES ('563', '阿根廷', '45055', '0', '3');
INSERT INTO shop_area VALUES ('564', '南非', '45055', '0', '3');
INSERT INTO shop_area VALUES ('565', '埃及', '45055', '0', '3');
INSERT INTO shop_area VALUES ('566', '其他', '36', '0', '3');
INSERT INTO shop_area VALUES ('45055', '海外', '35', '0', '2');
INSERT INTO shop_area VALUES ('1126', '井陉县', '73', '0', '3');
INSERT INTO shop_area VALUES ('1127', '井陉矿区', '73', '0', '3');
INSERT INTO shop_area VALUES ('1128', '元氏县', '73', '0', '3');
INSERT INTO shop_area VALUES ('1129', '平山县', '73', '0', '3');
INSERT INTO shop_area VALUES ('1130', '新乐市', '73', '0', '3');
INSERT INTO shop_area VALUES ('1131', '新华区', '73', '0', '3');
INSERT INTO shop_area VALUES ('1132', '无极县', '73', '0', '3');
INSERT INTO shop_area VALUES ('1133', '晋州市', '73', '0', '3');
INSERT INTO shop_area VALUES ('1134', '栾城县', '73', '0', '3');
INSERT INTO shop_area VALUES ('1135', '桥东区', '73', '0', '3');
INSERT INTO shop_area VALUES ('1136', '桥西区', '73', '0', '3');
INSERT INTO shop_area VALUES ('1137', '正定县', '73', '0', '3');
INSERT INTO shop_area VALUES ('1138', '深泽县', '73', '0', '3');
INSERT INTO shop_area VALUES ('1139', '灵寿县', '73', '0', '3');
INSERT INTO shop_area VALUES ('1140', '藁城市', '73', '0', '3');
INSERT INTO shop_area VALUES ('1141', '行唐县', '73', '0', '3');
INSERT INTO shop_area VALUES ('1142', '裕华区', '73', '0', '3');
INSERT INTO shop_area VALUES ('1143', '赞皇县', '73', '0', '3');
INSERT INTO shop_area VALUES ('1144', '赵县', '73', '0', '3');
INSERT INTO shop_area VALUES ('1145', '辛集市', '73', '0', '3');
INSERT INTO shop_area VALUES ('1146', '长安区', '73', '0', '3');
INSERT INTO shop_area VALUES ('1147', '高邑县', '73', '0', '3');
INSERT INTO shop_area VALUES ('1148', '鹿泉市', '73', '0', '3');
INSERT INTO shop_area VALUES ('1149', '丰南区', '74', '0', '3');
INSERT INTO shop_area VALUES ('1150', '丰润区', '74', '0', '3');
INSERT INTO shop_area VALUES ('1151', '乐亭县', '74', '0', '3');
INSERT INTO shop_area VALUES ('1152', '古冶区', '74', '0', '3');
INSERT INTO shop_area VALUES ('1153', '唐海县', '74', '0', '3');
INSERT INTO shop_area VALUES ('1154', '开平区', '74', '0', '3');
INSERT INTO shop_area VALUES ('1155', '滦南县', '74', '0', '3');
INSERT INTO shop_area VALUES ('1156', '滦县', '74', '0', '3');
INSERT INTO shop_area VALUES ('1157', '玉田县', '74', '0', '3');
INSERT INTO shop_area VALUES ('1158', '路北区', '74', '0', '3');
INSERT INTO shop_area VALUES ('1159', '路南区', '74', '0', '3');
INSERT INTO shop_area VALUES ('1160', '迁安市', '74', '0', '3');
INSERT INTO shop_area VALUES ('1161', '迁西县', '74', '0', '3');
INSERT INTO shop_area VALUES ('1162', '遵化市', '74', '0', '3');
INSERT INTO shop_area VALUES ('1163', '北戴河区', '75', '0', '3');
INSERT INTO shop_area VALUES ('1164', '卢龙县', '75', '0', '3');
INSERT INTO shop_area VALUES ('1165', '山海关区', '75', '0', '3');
INSERT INTO shop_area VALUES ('1166', '抚宁县', '75', '0', '3');
INSERT INTO shop_area VALUES ('1167', '昌黎县', '75', '0', '3');
INSERT INTO shop_area VALUES ('1168', '海港区', '75', '0', '3');
INSERT INTO shop_area VALUES ('1169', '青龙满族自治县', '75', '0', '3');
INSERT INTO shop_area VALUES ('1170', '丛台区', '76', '0', '3');
INSERT INTO shop_area VALUES ('1171', '临漳县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1172', '复兴区', '76', '0', '3');
INSERT INTO shop_area VALUES ('1173', '大名县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1174', '峰峰矿区', '76', '0', '3');
INSERT INTO shop_area VALUES ('1175', '广平县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1176', '成安县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1177', '曲周县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1178', '武安市', '76', '0', '3');
INSERT INTO shop_area VALUES ('1179', '永年县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1180', '涉县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1181', '磁县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1182', '肥乡县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1183', '邯山区', '76', '0', '3');
INSERT INTO shop_area VALUES ('1184', '邯郸县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1185', '邱县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1186', '馆陶县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1187', '魏县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1188', '鸡泽县', '76', '0', '3');
INSERT INTO shop_area VALUES ('1189', '临城县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1190', '临西县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1191', '任县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1192', '内丘县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1193', '南和县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1194', '南宫市', '77', '0', '3');
INSERT INTO shop_area VALUES ('1195', '威县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1196', '宁晋县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1197', '巨鹿县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1198', '平乡县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1199', '广宗县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1200', '新河县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1201', '柏乡县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1202', '桥东区', '77', '0', '3');
INSERT INTO shop_area VALUES ('1203', '桥西区', '77', '0', '3');
INSERT INTO shop_area VALUES ('1204', '沙河市', '77', '0', '3');
INSERT INTO shop_area VALUES ('1205', '清河县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1206', '邢台县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1207', '隆尧县', '77', '0', '3');
INSERT INTO shop_area VALUES ('1208', '北市区', '78', '0', '3');
INSERT INTO shop_area VALUES ('1209', '南市区', '78', '0', '3');
INSERT INTO shop_area VALUES ('1210', '博野县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1211', '唐县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1212', '安国市', '78', '0', '3');
INSERT INTO shop_area VALUES ('1213', '安新县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1214', '定兴县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1215', '定州市', '78', '0', '3');
INSERT INTO shop_area VALUES ('1216', '容城县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1217', '徐水县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1218', '新市区', '78', '0', '3');
INSERT INTO shop_area VALUES ('1219', '易县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1220', '曲阳县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1221', '望都县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1222', '涞水县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1223', '涞源县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1224', '涿州市', '78', '0', '3');
INSERT INTO shop_area VALUES ('1225', '清苑县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1226', '满城县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1227', '蠡县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1228', '阜平县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1229', '雄县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1230', '顺平县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1231', '高碑店市', '78', '0', '3');
INSERT INTO shop_area VALUES ('1232', '高阳县', '78', '0', '3');
INSERT INTO shop_area VALUES ('1233', '万全县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1234', '下花园区', '79', '0', '3');
INSERT INTO shop_area VALUES ('1235', '宣化区', '79', '0', '3');
INSERT INTO shop_area VALUES ('1236', '宣化县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1237', '尚义县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1238', '崇礼县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1239', '康保县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1240', '张北县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1241', '怀安县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1242', '怀来县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1243', '桥东区', '79', '0', '3');
INSERT INTO shop_area VALUES ('1244', '桥西区', '79', '0', '3');
INSERT INTO shop_area VALUES ('1245', '沽源县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1246', '涿鹿县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1247', '蔚县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1248', '赤城县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1249', '阳原县', '79', '0', '3');
INSERT INTO shop_area VALUES ('1250', '丰宁满族自治县', '80', '0', '3');
INSERT INTO shop_area VALUES ('1251', '兴隆县', '80', '0', '3');
INSERT INTO shop_area VALUES ('1252', '双桥区', '80', '0', '3');
INSERT INTO shop_area VALUES ('1253', '双滦区', '80', '0', '3');
INSERT INTO shop_area VALUES ('1254', '围场满族蒙古族自治县', '80', '0', '3');
INSERT INTO shop_area VALUES ('1255', '宽城满族自治县', '80', '0', '3');
INSERT INTO shop_area VALUES ('1256', '平泉县', '80', '0', '3');
INSERT INTO shop_area VALUES ('1257', '承德县', '80', '0', '3');
INSERT INTO shop_area VALUES ('1258', '滦平县', '80', '0', '3');
INSERT INTO shop_area VALUES ('1259', '隆化县', '80', '0', '3');
INSERT INTO shop_area VALUES ('1260', '鹰手营子矿区', '80', '0', '3');
INSERT INTO shop_area VALUES ('1261', '冀州市', '81', '0', '3');
INSERT INTO shop_area VALUES ('1262', '安平县', '81', '0', '3');
INSERT INTO shop_area VALUES ('1263', '故城县', '81', '0', '3');
INSERT INTO shop_area VALUES ('1264', '景县', '81', '0', '3');
INSERT INTO shop_area VALUES ('1265', '枣强县', '81', '0', '3');
INSERT INTO shop_area VALUES ('1266', '桃城区', '81', '0', '3');
INSERT INTO shop_area VALUES ('1267', '武强县', '81', '0', '3');
INSERT INTO shop_area VALUES ('1268', '武邑县', '81', '0', '3');
INSERT INTO shop_area VALUES ('1269', '深州市', '81', '0', '3');
INSERT INTO shop_area VALUES ('1270', '阜城县', '81', '0', '3');
INSERT INTO shop_area VALUES ('1271', '饶阳县', '81', '0', '3');
INSERT INTO shop_area VALUES ('1272', '三河市', '82', '0', '3');
INSERT INTO shop_area VALUES ('1273', '固安县', '82', '0', '3');
INSERT INTO shop_area VALUES ('1274', '大厂回族自治县', '82', '0', '3');
INSERT INTO shop_area VALUES ('1275', '大城县', '82', '0', '3');
INSERT INTO shop_area VALUES ('1276', '安次区', '82', '0', '3');
INSERT INTO shop_area VALUES ('1277', '广阳区', '82', '0', '3');
INSERT INTO shop_area VALUES ('1278', '文安县', '82', '0', '3');
INSERT INTO shop_area VALUES ('1279', '永清县', '82', '0', '3');
INSERT INTO shop_area VALUES ('1280', '霸州市', '82', '0', '3');
INSERT INTO shop_area VALUES ('1281', '香河县', '82', '0', '3');
INSERT INTO shop_area VALUES ('1282', '东光县', '83', '0', '3');
INSERT INTO shop_area VALUES ('1283', '任丘市', '83', '0', '3');
INSERT INTO shop_area VALUES ('1284', '南皮县', '83', '0', '3');
INSERT INTO shop_area VALUES ('1285', '吴桥县', '83', '0', '3');
INSERT INTO shop_area VALUES ('1286', '孟村回族自治县', '83', '0', '3');
INSERT INTO shop_area VALUES ('1287', '新华区', '83', '0', '3');
INSERT INTO shop_area VALUES ('1288', '沧县', '83', '0', '3');
INSERT INTO shop_area VALUES ('1289', '河间市', '83', '0', '3');
INSERT INTO shop_area VALUES ('1290', '泊头市', '83', '0', '3');
INSERT INTO shop_area VALUES ('1291', '海兴县', '83', '0', '3');
INSERT INTO shop_area VALUES ('1292', '献县', '83', '0', '3');
INSERT INTO shop_area VALUES ('1293', '盐山县', '83', '0', '3');
INSERT INTO shop_area VALUES ('1294', '肃宁县', '83', '0', '3');
INSERT INTO shop_area VALUES ('1295', '运河区', '83', '0', '3');
INSERT INTO shop_area VALUES ('1296', '青县', '83', '0', '3');
INSERT INTO shop_area VALUES ('1297', '黄骅市', '83', '0', '3');
INSERT INTO shop_area VALUES ('1298', '万柏林区', '84', '0', '3');
INSERT INTO shop_area VALUES ('1299', '古交市', '84', '0', '3');
INSERT INTO shop_area VALUES ('1300', '娄烦县', '84', '0', '3');
INSERT INTO shop_area VALUES ('1301', '小店区', '84', '0', '3');
INSERT INTO shop_area VALUES ('1302', '尖草坪区', '84', '0', '3');
INSERT INTO shop_area VALUES ('1303', '晋源区', '84', '0', '3');
INSERT INTO shop_area VALUES ('1304', '杏花岭区', '84', '0', '3');
INSERT INTO shop_area VALUES ('1305', '清徐县', '84', '0', '3');
INSERT INTO shop_area VALUES ('1306', '迎泽区', '84', '0', '3');
INSERT INTO shop_area VALUES ('1307', '阳曲县', '84', '0', '3');
INSERT INTO shop_area VALUES ('1308', '南郊区', '85', '0', '3');
INSERT INTO shop_area VALUES ('1309', '城区', '85', '0', '3');
INSERT INTO shop_area VALUES ('1310', '大同县', '85', '0', '3');
INSERT INTO shop_area VALUES ('1311', '天镇县', '85', '0', '3');
INSERT INTO shop_area VALUES ('1312', '左云县', '85', '0', '3');
INSERT INTO shop_area VALUES ('1313', '广灵县', '85', '0', '3');
INSERT INTO shop_area VALUES ('1314', '新荣区', '85', '0', '3');
INSERT INTO shop_area VALUES ('1315', '浑源县', '85', '0', '3');
INSERT INTO shop_area VALUES ('1316', '灵丘县', '85', '0', '3');
INSERT INTO shop_area VALUES ('1317', '矿区', '85', '0', '3');
INSERT INTO shop_area VALUES ('1318', '阳高县', '85', '0', '3');
INSERT INTO shop_area VALUES ('1319', '城区', '86', '0', '3');
INSERT INTO shop_area VALUES ('1320', '平定县', '86', '0', '3');
INSERT INTO shop_area VALUES ('1321', '盂县', '86', '0', '3');
INSERT INTO shop_area VALUES ('1322', '矿区', '86', '0', '3');
INSERT INTO shop_area VALUES ('1323', '郊区', '86', '0', '3');
INSERT INTO shop_area VALUES ('1324', '城区', '87', '0', '3');
INSERT INTO shop_area VALUES ('1325', '壶关县', '87', '0', '3');
INSERT INTO shop_area VALUES ('1326', '屯留县', '87', '0', '3');
INSERT INTO shop_area VALUES ('1327', '平顺县', '87', '0', '3');
INSERT INTO shop_area VALUES ('1328', '武乡县', '87', '0', '3');
INSERT INTO shop_area VALUES ('1329', '沁县', '87', '0', '3');
INSERT INTO shop_area VALUES ('1330', '沁源县', '87', '0', '3');
INSERT INTO shop_area VALUES ('1331', '潞城市', '87', '0', '3');
INSERT INTO shop_area VALUES ('1332', '襄垣县', '87', '0', '3');
INSERT INTO shop_area VALUES ('1333', '郊区', '87', '0', '3');
INSERT INTO shop_area VALUES ('1334', '长子县', '87', '0', '3');
INSERT INTO shop_area VALUES ('1335', '长治县', '87', '0', '3');
INSERT INTO shop_area VALUES ('1336', '黎城县', '87', '0', '3');
INSERT INTO shop_area VALUES ('1337', '城区', '88', '0', '3');
INSERT INTO shop_area VALUES ('1338', '沁水县', '88', '0', '3');
INSERT INTO shop_area VALUES ('1339', '泽州县', '88', '0', '3');
INSERT INTO shop_area VALUES ('1340', '阳城县', '88', '0', '3');
INSERT INTO shop_area VALUES ('1341', '陵川县', '88', '0', '3');
INSERT INTO shop_area VALUES ('1342', '高平市', '88', '0', '3');
INSERT INTO shop_area VALUES ('1343', '右玉县', '89', '0', '3');
INSERT INTO shop_area VALUES ('1344', '山阴县', '89', '0', '3');
INSERT INTO shop_area VALUES ('1345', '平鲁区', '89', '0', '3');
INSERT INTO shop_area VALUES ('1346', '应县', '89', '0', '3');
INSERT INTO shop_area VALUES ('1347', '怀仁县', '89', '0', '3');
INSERT INTO shop_area VALUES ('1348', '朔城区', '89', '0', '3');
INSERT INTO shop_area VALUES ('1349', '介休市', '90', '0', '3');
INSERT INTO shop_area VALUES ('1350', '和顺县', '90', '0', '3');
INSERT INTO shop_area VALUES ('1351', '太谷县', '90', '0', '3');
INSERT INTO shop_area VALUES ('1352', '寿阳县', '90', '0', '3');
INSERT INTO shop_area VALUES ('1353', '左权县', '90', '0', '3');
INSERT INTO shop_area VALUES ('1354', '平遥县', '90', '0', '3');
INSERT INTO shop_area VALUES ('1355', '昔阳县', '90', '0', '3');
INSERT INTO shop_area VALUES ('1356', '榆次区', '90', '0', '3');
INSERT INTO shop_area VALUES ('1357', '榆社县', '90', '0', '3');
INSERT INTO shop_area VALUES ('1358', '灵石县', '90', '0', '3');
INSERT INTO shop_area VALUES ('1359', '祁县', '90', '0', '3');
INSERT INTO shop_area VALUES ('1360', '万荣县', '91', '0', '3');
INSERT INTO shop_area VALUES ('1361', '临猗县', '91', '0', '3');
INSERT INTO shop_area VALUES ('1362', '垣曲县', '91', '0', '3');
INSERT INTO shop_area VALUES ('1363', '夏县', '91', '0', '3');
INSERT INTO shop_area VALUES ('1364', '平陆县', '91', '0', '3');
INSERT INTO shop_area VALUES ('1365', '新绛县', '91', '0', '3');
INSERT INTO shop_area VALUES ('1366', '永济市', '91', '0', '3');
INSERT INTO shop_area VALUES ('1367', '河津市', '91', '0', '3');
INSERT INTO shop_area VALUES ('1368', '盐湖区', '91', '0', '3');
INSERT INTO shop_area VALUES ('1369', '稷山县', '91', '0', '3');
INSERT INTO shop_area VALUES ('1370', '绛县', '91', '0', '3');
INSERT INTO shop_area VALUES ('1371', '芮城县', '91', '0', '3');
INSERT INTO shop_area VALUES ('1372', '闻喜县', '91', '0', '3');
INSERT INTO shop_area VALUES ('1373', '五台县', '92', '0', '3');
INSERT INTO shop_area VALUES ('1374', '五寨县', '92', '0', '3');
INSERT INTO shop_area VALUES ('1375', '代县', '92', '0', '3');
INSERT INTO shop_area VALUES ('1376', '保德县', '92', '0', '3');
INSERT INTO shop_area VALUES ('1377', '偏关县', '92', '0', '3');
INSERT INTO shop_area VALUES ('1378', '原平市', '92', '0', '3');
INSERT INTO shop_area VALUES ('1379', '宁武县', '92', '0', '3');
INSERT INTO shop_area VALUES ('1380', '定襄县', '92', '0', '3');
INSERT INTO shop_area VALUES ('1381', '岢岚县', '92', '0', '3');
INSERT INTO shop_area VALUES ('1382', '忻府区', '92', '0', '3');
INSERT INTO shop_area VALUES ('1383', '河曲县', '92', '0', '3');
INSERT INTO shop_area VALUES ('1384', '神池县', '92', '0', '3');
INSERT INTO shop_area VALUES ('1385', '繁峙县', '92', '0', '3');
INSERT INTO shop_area VALUES ('1386', '静乐县', '92', '0', '3');
INSERT INTO shop_area VALUES ('1387', '乡宁县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1388', '侯马市', '93', '0', '3');
INSERT INTO shop_area VALUES ('1389', '古县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1390', '吉县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1391', '大宁县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1392', '安泽县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1393', '尧都区', '93', '0', '3');
INSERT INTO shop_area VALUES ('1394', '曲沃县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1395', '永和县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1396', '汾西县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1397', '洪洞县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1398', '浮山县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1399', '翼城县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1400', '蒲县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1401', '襄汾县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1402', '隰县', '93', '0', '3');
INSERT INTO shop_area VALUES ('1403', '霍州市', '93', '0', '3');
INSERT INTO shop_area VALUES ('1404', '中阳县', '94', '0', '3');
INSERT INTO shop_area VALUES ('1405', '临县', '94', '0', '3');
INSERT INTO shop_area VALUES ('1406', '交口县', '94', '0', '3');
INSERT INTO shop_area VALUES ('1407', '交城县', '94', '0', '3');
INSERT INTO shop_area VALUES ('1408', '兴县', '94', '0', '3');
INSERT INTO shop_area VALUES ('1409', '孝义市', '94', '0', '3');
INSERT INTO shop_area VALUES ('1410', '岚县', '94', '0', '3');
INSERT INTO shop_area VALUES ('1411', '文水县', '94', '0', '3');
INSERT INTO shop_area VALUES ('1412', '方山县', '94', '0', '3');
INSERT INTO shop_area VALUES ('1413', '柳林县', '94', '0', '3');
INSERT INTO shop_area VALUES ('1414', '汾阳市', '94', '0', '3');
INSERT INTO shop_area VALUES ('1415', '石楼县', '94', '0', '3');
INSERT INTO shop_area VALUES ('1416', '离石区', '94', '0', '3');
INSERT INTO shop_area VALUES ('1417', '和林格尔县', '95', '0', '3');
INSERT INTO shop_area VALUES ('1418', '回民区', '95', '0', '3');
INSERT INTO shop_area VALUES ('1419', '土默特左旗', '95', '0', '3');
INSERT INTO shop_area VALUES ('1420', '托克托县', '95', '0', '3');
INSERT INTO shop_area VALUES ('1421', '新城区', '95', '0', '3');
INSERT INTO shop_area VALUES ('1422', '武川县', '95', '0', '3');
INSERT INTO shop_area VALUES ('1423', '清水河县', '95', '0', '3');
INSERT INTO shop_area VALUES ('1424', '玉泉区', '95', '0', '3');
INSERT INTO shop_area VALUES ('1425', '赛罕区', '95', '0', '3');
INSERT INTO shop_area VALUES ('1426', '东河区', '96', '0', '3');
INSERT INTO shop_area VALUES ('1427', '九原区', '96', '0', '3');
INSERT INTO shop_area VALUES ('1428', '固阳县', '96', '0', '3');
INSERT INTO shop_area VALUES ('1429', '土默特右旗', '96', '0', '3');
INSERT INTO shop_area VALUES ('1430', '昆都仑区', '96', '0', '3');
INSERT INTO shop_area VALUES ('1431', '白云矿区', '96', '0', '3');
INSERT INTO shop_area VALUES ('1432', '石拐区', '96', '0', '3');
INSERT INTO shop_area VALUES ('1433', '达尔罕茂明安联合旗', '96', '0', '3');
INSERT INTO shop_area VALUES ('1434', '青山区', '96', '0', '3');
INSERT INTO shop_area VALUES ('1435', '乌达区', '97', '0', '3');
INSERT INTO shop_area VALUES ('1436', '海勃湾区', '97', '0', '3');
INSERT INTO shop_area VALUES ('1437', '海南区', '97', '0', '3');
INSERT INTO shop_area VALUES ('1438', '元宝山区', '98', '0', '3');
INSERT INTO shop_area VALUES ('1439', '克什克腾旗', '98', '0', '3');
INSERT INTO shop_area VALUES ('1440', '喀喇沁旗', '98', '0', '3');
INSERT INTO shop_area VALUES ('1441', '宁城县', '98', '0', '3');
INSERT INTO shop_area VALUES ('1442', '巴林右旗', '98', '0', '3');
INSERT INTO shop_area VALUES ('1443', '巴林左旗', '98', '0', '3');
INSERT INTO shop_area VALUES ('1444', '敖汉旗', '98', '0', '3');
INSERT INTO shop_area VALUES ('1445', '松山区', '98', '0', '3');
INSERT INTO shop_area VALUES ('1446', '林西县', '98', '0', '3');
INSERT INTO shop_area VALUES ('1447', '红山区', '98', '0', '3');
INSERT INTO shop_area VALUES ('1448', '翁牛特旗', '98', '0', '3');
INSERT INTO shop_area VALUES ('1449', '阿鲁科尔沁旗', '98', '0', '3');
INSERT INTO shop_area VALUES ('1450', '奈曼旗', '99', '0', '3');
INSERT INTO shop_area VALUES ('1451', '库伦旗', '99', '0', '3');
INSERT INTO shop_area VALUES ('1452', '开鲁县', '99', '0', '3');
INSERT INTO shop_area VALUES ('1453', '扎鲁特旗', '99', '0', '3');
INSERT INTO shop_area VALUES ('1454', '科尔沁区', '99', '0', '3');
INSERT INTO shop_area VALUES ('1455', '科尔沁左翼中旗', '99', '0', '3');
INSERT INTO shop_area VALUES ('1456', '科尔沁左翼后旗', '99', '0', '3');
INSERT INTO shop_area VALUES ('1457', '霍林郭勒市', '99', '0', '3');
INSERT INTO shop_area VALUES ('1458', '东胜区', '100', '0', '3');
INSERT INTO shop_area VALUES ('1459', '乌审旗', '100', '0', '3');
INSERT INTO shop_area VALUES ('1460', '伊金霍洛旗', '100', '0', '3');
INSERT INTO shop_area VALUES ('1461', '准格尔旗', '100', '0', '3');
INSERT INTO shop_area VALUES ('1462', '杭锦旗', '100', '0', '3');
INSERT INTO shop_area VALUES ('1463', '达拉特旗', '100', '0', '3');
INSERT INTO shop_area VALUES ('1464', '鄂东胜区', '100', '0', '3');
INSERT INTO shop_area VALUES ('1465', '鄂托克前旗', '100', '0', '3');
INSERT INTO shop_area VALUES ('1466', '鄂托克旗', '100', '0', '3');
INSERT INTO shop_area VALUES ('1467', '扎兰屯市', '101', '0', '3');
INSERT INTO shop_area VALUES ('1468', '新巴尔虎右旗', '101', '0', '3');
INSERT INTO shop_area VALUES ('1469', '新巴尔虎左旗', '101', '0', '3');
INSERT INTO shop_area VALUES ('1470', '根河市', '101', '0', '3');
INSERT INTO shop_area VALUES ('1471', '海拉尔区', '101', '0', '3');
INSERT INTO shop_area VALUES ('1472', '满洲里市', '101', '0', '3');
INSERT INTO shop_area VALUES ('1473', '牙克石市', '101', '0', '3');
INSERT INTO shop_area VALUES ('1474', '莫力达瓦达斡尔族自治旗', '101', '0', '3');
INSERT INTO shop_area VALUES ('1475', '鄂伦春自治旗', '101', '0', '3');
INSERT INTO shop_area VALUES ('1476', '鄂温克族自治旗', '101', '0', '3');
INSERT INTO shop_area VALUES ('1477', '阿荣旗', '101', '0', '3');
INSERT INTO shop_area VALUES ('1478', '陈巴尔虎旗', '101', '0', '3');
INSERT INTO shop_area VALUES ('1479', '额尔古纳市', '101', '0', '3');
INSERT INTO shop_area VALUES ('1480', '临河区', '102', '0', '3');
INSERT INTO shop_area VALUES ('1481', '乌拉特中旗', '102', '0', '3');
INSERT INTO shop_area VALUES ('1482', '乌拉特前旗', '102', '0', '3');
INSERT INTO shop_area VALUES ('1483', '乌拉特后旗', '102', '0', '3');
INSERT INTO shop_area VALUES ('1484', '五原县', '102', '0', '3');
INSERT INTO shop_area VALUES ('1485', '杭锦后旗', '102', '0', '3');
INSERT INTO shop_area VALUES ('1486', '磴口县', '102', '0', '3');
INSERT INTO shop_area VALUES ('1487', '丰镇市', '103', '0', '3');
INSERT INTO shop_area VALUES ('1488', '兴和县', '103', '0', '3');
INSERT INTO shop_area VALUES ('1489', '凉城县', '103', '0', '3');
INSERT INTO shop_area VALUES ('1490', '化德县', '103', '0', '3');
INSERT INTO shop_area VALUES ('1491', '卓资县', '103', '0', '3');
INSERT INTO shop_area VALUES ('1492', '商都县', '103', '0', '3');
INSERT INTO shop_area VALUES ('1493', '四子王旗', '103', '0', '3');
INSERT INTO shop_area VALUES ('1494', '察哈尔右翼中旗', '103', '0', '3');
INSERT INTO shop_area VALUES ('1495', '察哈尔右翼前旗', '103', '0', '3');
INSERT INTO shop_area VALUES ('1496', '察哈尔右翼后旗', '103', '0', '3');
INSERT INTO shop_area VALUES ('1497', '集宁区', '103', '0', '3');
INSERT INTO shop_area VALUES ('1498', '乌兰浩特市', '104', '0', '3');
INSERT INTO shop_area VALUES ('1499', '扎赉特旗', '104', '0', '3');
INSERT INTO shop_area VALUES ('1500', '科尔沁右翼中旗', '104', '0', '3');
INSERT INTO shop_area VALUES ('1501', '科尔沁右翼前旗', '104', '0', '3');
INSERT INTO shop_area VALUES ('1502', '突泉县', '104', '0', '3');
INSERT INTO shop_area VALUES ('1503', '阿尔山市', '104', '0', '3');
INSERT INTO shop_area VALUES ('1504', '东乌珠穆沁旗', '105', '0', '3');
INSERT INTO shop_area VALUES ('1505', '二连浩特市', '105', '0', '3');
INSERT INTO shop_area VALUES ('1506', '多伦县', '105', '0', '3');
INSERT INTO shop_area VALUES ('1507', '太仆寺旗', '105', '0', '3');
INSERT INTO shop_area VALUES ('1508', '正蓝旗', '105', '0', '3');
INSERT INTO shop_area VALUES ('1509', '正镶白旗', '105', '0', '3');
INSERT INTO shop_area VALUES ('1510', '苏尼特右旗', '105', '0', '3');
INSERT INTO shop_area VALUES ('1511', '苏尼特左旗', '105', '0', '3');
INSERT INTO shop_area VALUES ('1512', '西乌珠穆沁旗', '105', '0', '3');
INSERT INTO shop_area VALUES ('1513', '锡林浩特市', '105', '0', '3');
INSERT INTO shop_area VALUES ('1514', '镶黄旗', '105', '0', '3');
INSERT INTO shop_area VALUES ('1515', '阿巴嘎旗', '105', '0', '3');
INSERT INTO shop_area VALUES ('1516', '阿拉善右旗', '106', '0', '3');
INSERT INTO shop_area VALUES ('1517', '阿拉善左旗', '106', '0', '3');
INSERT INTO shop_area VALUES ('1518', '额济纳旗', '106', '0', '3');
INSERT INTO shop_area VALUES ('1519', '东陵区', '107', '0', '3');
INSERT INTO shop_area VALUES ('1520', '于洪区', '107', '0', '3');
INSERT INTO shop_area VALUES ('1521', '和平区', '107', '0', '3');
INSERT INTO shop_area VALUES ('1522', '大东区', '107', '0', '3');
INSERT INTO shop_area VALUES ('1523', '康平县', '107', '0', '3');
INSERT INTO shop_area VALUES ('1524', '新民市', '107', '0', '3');
INSERT INTO shop_area VALUES ('1525', '沈北新区', '107', '0', '3');
INSERT INTO shop_area VALUES ('1526', '沈河区', '107', '0', '3');
INSERT INTO shop_area VALUES ('1527', '法库县', '107', '0', '3');
INSERT INTO shop_area VALUES ('1528', '皇姑区', '107', '0', '3');
INSERT INTO shop_area VALUES ('1529', '苏家屯区', '107', '0', '3');
INSERT INTO shop_area VALUES ('1530', '辽中县', '107', '0', '3');
INSERT INTO shop_area VALUES ('1531', '铁西区', '107', '0', '3');
INSERT INTO shop_area VALUES ('1532', '中山区', '108', '0', '3');
INSERT INTO shop_area VALUES ('1533', '庄河市', '108', '0', '3');
INSERT INTO shop_area VALUES ('1534', '旅顺口区', '108', '0', '3');
INSERT INTO shop_area VALUES ('1535', '普兰店市', '108', '0', '3');
INSERT INTO shop_area VALUES ('1536', '沙河口区', '108', '0', '3');
INSERT INTO shop_area VALUES ('1537', '瓦房店市', '108', '0', '3');
INSERT INTO shop_area VALUES ('1538', '甘井子区', '108', '0', '3');
INSERT INTO shop_area VALUES ('1539', '西岗区', '108', '0', '3');
INSERT INTO shop_area VALUES ('1540', '金州区', '108', '0', '3');
INSERT INTO shop_area VALUES ('1541', '长海县', '108', '0', '3');
INSERT INTO shop_area VALUES ('1542', '千山区', '109', '0', '3');
INSERT INTO shop_area VALUES ('1543', '台安县', '109', '0', '3');
INSERT INTO shop_area VALUES ('1544', '岫岩满族自治县', '109', '0', '3');
INSERT INTO shop_area VALUES ('1545', '海城市', '109', '0', '3');
INSERT INTO shop_area VALUES ('1546', '立山区', '109', '0', '3');
INSERT INTO shop_area VALUES ('1547', '铁东区', '109', '0', '3');
INSERT INTO shop_area VALUES ('1548', '铁西区', '109', '0', '3');
INSERT INTO shop_area VALUES ('1549', '东洲区', '110', '0', '3');
INSERT INTO shop_area VALUES ('1550', '抚顺县', '110', '0', '3');
INSERT INTO shop_area VALUES ('1551', '新宾满族自治县', '110', '0', '3');
INSERT INTO shop_area VALUES ('1552', '新抚区', '110', '0', '3');
INSERT INTO shop_area VALUES ('1553', '望花区', '110', '0', '3');
INSERT INTO shop_area VALUES ('1554', '清原满族自治县', '110', '0', '3');
INSERT INTO shop_area VALUES ('1555', '顺城区', '110', '0', '3');
INSERT INTO shop_area VALUES ('1556', '南芬区', '111', '0', '3');
INSERT INTO shop_area VALUES ('1557', '平山区', '111', '0', '3');
INSERT INTO shop_area VALUES ('1558', '明山区', '111', '0', '3');
INSERT INTO shop_area VALUES ('1559', '本溪满族自治县', '111', '0', '3');
INSERT INTO shop_area VALUES ('1560', '桓仁满族自治县', '111', '0', '3');
INSERT INTO shop_area VALUES ('1561', '溪湖区', '111', '0', '3');
INSERT INTO shop_area VALUES ('1562', '东港市', '112', '0', '3');
INSERT INTO shop_area VALUES ('1563', '元宝区', '112', '0', '3');
INSERT INTO shop_area VALUES ('1564', '凤城市', '112', '0', '3');
INSERT INTO shop_area VALUES ('1565', '宽甸满族自治县', '112', '0', '3');
INSERT INTO shop_area VALUES ('1566', '振兴区', '112', '0', '3');
INSERT INTO shop_area VALUES ('1567', '振安区', '112', '0', '3');
INSERT INTO shop_area VALUES ('1568', '义县', '113', '0', '3');
INSERT INTO shop_area VALUES ('1569', '凌河区', '113', '0', '3');
INSERT INTO shop_area VALUES ('1570', '凌海市', '113', '0', '3');
INSERT INTO shop_area VALUES ('1571', '北镇市', '113', '0', '3');
INSERT INTO shop_area VALUES ('1572', '古塔区', '113', '0', '3');
INSERT INTO shop_area VALUES ('1573', '太和区', '113', '0', '3');
INSERT INTO shop_area VALUES ('1574', '黑山县', '113', '0', '3');
INSERT INTO shop_area VALUES ('1575', '大石桥市', '114', '0', '3');
INSERT INTO shop_area VALUES ('1576', '盖州市', '114', '0', '3');
INSERT INTO shop_area VALUES ('1577', '站前区', '114', '0', '3');
INSERT INTO shop_area VALUES ('1578', '老边区', '114', '0', '3');
INSERT INTO shop_area VALUES ('1579', '西市区', '114', '0', '3');
INSERT INTO shop_area VALUES ('1580', '鲅鱼圈区', '114', '0', '3');
INSERT INTO shop_area VALUES ('1581', '太平区', '115', '0', '3');
INSERT INTO shop_area VALUES ('1582', '彰武县', '115', '0', '3');
INSERT INTO shop_area VALUES ('1583', '新邱区', '115', '0', '3');
INSERT INTO shop_area VALUES ('1584', '海州区', '115', '0', '3');
INSERT INTO shop_area VALUES ('1585', '清河门区', '115', '0', '3');
INSERT INTO shop_area VALUES ('1586', '细河区', '115', '0', '3');
INSERT INTO shop_area VALUES ('1587', '蒙古族自治县', '115', '0', '3');
INSERT INTO shop_area VALUES ('1588', '太子河区', '116', '0', '3');
INSERT INTO shop_area VALUES ('1589', '宏伟区', '116', '0', '3');
INSERT INTO shop_area VALUES ('1590', '弓长岭区', '116', '0', '3');
INSERT INTO shop_area VALUES ('1591', '文圣区', '116', '0', '3');
INSERT INTO shop_area VALUES ('1592', '灯塔市', '116', '0', '3');
INSERT INTO shop_area VALUES ('1593', '白塔区', '116', '0', '3');
INSERT INTO shop_area VALUES ('1594', '辽阳县', '116', '0', '3');
INSERT INTO shop_area VALUES ('1595', '兴隆台区', '117', '0', '3');
INSERT INTO shop_area VALUES ('1596', '双台子区', '117', '0', '3');
INSERT INTO shop_area VALUES ('1597', '大洼县', '117', '0', '3');
INSERT INTO shop_area VALUES ('1598', '盘山县', '117', '0', '3');
INSERT INTO shop_area VALUES ('1599', '开原市', '118', '0', '3');
INSERT INTO shop_area VALUES ('1600', '昌图县', '118', '0', '3');
INSERT INTO shop_area VALUES ('1601', '清河区', '118', '0', '3');
INSERT INTO shop_area VALUES ('1602', '西丰县', '118', '0', '3');
INSERT INTO shop_area VALUES ('1603', '调兵山市', '118', '0', '3');
INSERT INTO shop_area VALUES ('1604', '铁岭县', '118', '0', '3');
INSERT INTO shop_area VALUES ('1605', '银州区', '118', '0', '3');
INSERT INTO shop_area VALUES ('1606', '凌源市', '119', '0', '3');
INSERT INTO shop_area VALUES ('1607', '北票市', '119', '0', '3');
INSERT INTO shop_area VALUES ('1608', '双塔区', '119', '0', '3');
INSERT INTO shop_area VALUES ('1609', '喀喇沁左翼蒙古族自治县', '119', '0', '3');
INSERT INTO shop_area VALUES ('1610', '建平县', '119', '0', '3');
INSERT INTO shop_area VALUES ('1611', '朝阳县', '119', '0', '3');
INSERT INTO shop_area VALUES ('1612', '龙城区', '119', '0', '3');
INSERT INTO shop_area VALUES ('1613', '兴城市', '120', '0', '3');
INSERT INTO shop_area VALUES ('1614', '南票区', '120', '0', '3');
INSERT INTO shop_area VALUES ('1615', '建昌县', '120', '0', '3');
INSERT INTO shop_area VALUES ('1616', '绥中县', '120', '0', '3');
INSERT INTO shop_area VALUES ('1617', '连山区', '120', '0', '3');
INSERT INTO shop_area VALUES ('1618', '龙港区', '120', '0', '3');
INSERT INTO shop_area VALUES ('1619', '九台市', '121', '0', '3');
INSERT INTO shop_area VALUES ('1620', '二道区', '121', '0', '3');
INSERT INTO shop_area VALUES ('1621', '农安县', '121', '0', '3');
INSERT INTO shop_area VALUES ('1622', '南关区', '121', '0', '3');
INSERT INTO shop_area VALUES ('1623', '双阳区', '121', '0', '3');
INSERT INTO shop_area VALUES ('1624', '宽城区', '121', '0', '3');
INSERT INTO shop_area VALUES ('1625', '德惠市', '121', '0', '3');
INSERT INTO shop_area VALUES ('1626', '朝阳区', '121', '0', '3');
INSERT INTO shop_area VALUES ('1627', '榆树市', '121', '0', '3');
INSERT INTO shop_area VALUES ('1628', '绿园区', '121', '0', '3');
INSERT INTO shop_area VALUES ('1629', '丰满区', '122', '0', '3');
INSERT INTO shop_area VALUES ('1630', '昌邑区', '122', '0', '3');
INSERT INTO shop_area VALUES ('1631', '桦甸市', '122', '0', '3');
INSERT INTO shop_area VALUES ('1632', '永吉县', '122', '0', '3');
INSERT INTO shop_area VALUES ('1633', '磐石市', '122', '0', '3');
INSERT INTO shop_area VALUES ('1634', '舒兰市', '122', '0', '3');
INSERT INTO shop_area VALUES ('1635', '船营区', '122', '0', '3');
INSERT INTO shop_area VALUES ('1636', '蛟河市', '122', '0', '3');
INSERT INTO shop_area VALUES ('1637', '龙潭区', '122', '0', '3');
INSERT INTO shop_area VALUES ('1638', '伊通满族自治县', '123', '0', '3');
INSERT INTO shop_area VALUES ('1639', '公主岭市', '123', '0', '3');
INSERT INTO shop_area VALUES ('1640', '双辽市', '123', '0', '3');
INSERT INTO shop_area VALUES ('1641', '梨树县', '123', '0', '3');
INSERT INTO shop_area VALUES ('1642', '铁东区', '123', '0', '3');
INSERT INTO shop_area VALUES ('1643', '铁西区', '123', '0', '3');
INSERT INTO shop_area VALUES ('1644', '东丰县', '124', '0', '3');
INSERT INTO shop_area VALUES ('1645', '东辽县', '124', '0', '3');
INSERT INTO shop_area VALUES ('1646', '西安区', '124', '0', '3');
INSERT INTO shop_area VALUES ('1647', '龙山区', '124', '0', '3');
INSERT INTO shop_area VALUES ('1648', '东昌区', '125', '0', '3');
INSERT INTO shop_area VALUES ('1649', '二道江区', '125', '0', '3');
INSERT INTO shop_area VALUES ('1650', '柳河县', '125', '0', '3');
INSERT INTO shop_area VALUES ('1651', '梅河口市', '125', '0', '3');
INSERT INTO shop_area VALUES ('1652', '辉南县', '125', '0', '3');
INSERT INTO shop_area VALUES ('1653', '通化县', '125', '0', '3');
INSERT INTO shop_area VALUES ('1654', '集安市', '125', '0', '3');
INSERT INTO shop_area VALUES ('1655', '临江市', '126', '0', '3');
INSERT INTO shop_area VALUES ('1656', '八道江区', '126', '0', '3');
INSERT INTO shop_area VALUES ('1657', '抚松县', '126', '0', '3');
INSERT INTO shop_area VALUES ('1658', '江源区', '126', '0', '3');
INSERT INTO shop_area VALUES ('1659', '长白朝鲜族自治县', '126', '0', '3');
INSERT INTO shop_area VALUES ('1660', '靖宇县', '126', '0', '3');
INSERT INTO shop_area VALUES ('1661', '干安县', '127', '0', '3');
INSERT INTO shop_area VALUES ('1662', '前郭尔罗斯蒙古族自治县', '127', '0', '3');
INSERT INTO shop_area VALUES ('1663', '宁江区', '127', '0', '3');
INSERT INTO shop_area VALUES ('1664', '扶余县', '127', '0', '3');
INSERT INTO shop_area VALUES ('1665', '长岭县', '127', '0', '3');
INSERT INTO shop_area VALUES ('1666', '大安市', '128', '0', '3');
INSERT INTO shop_area VALUES ('1667', '洮北区', '128', '0', '3');
INSERT INTO shop_area VALUES ('1668', '洮南市', '128', '0', '3');
INSERT INTO shop_area VALUES ('1669', '通榆县', '128', '0', '3');
INSERT INTO shop_area VALUES ('1670', '镇赉县', '128', '0', '3');
INSERT INTO shop_area VALUES ('1671', '和龙市', '129', '0', '3');
INSERT INTO shop_area VALUES ('1672', '图们市', '129', '0', '3');
INSERT INTO shop_area VALUES ('1673', '安图县', '129', '0', '3');
INSERT INTO shop_area VALUES ('1674', '延吉市', '129', '0', '3');
INSERT INTO shop_area VALUES ('1675', '敦化市', '129', '0', '3');
INSERT INTO shop_area VALUES ('1676', '汪清县', '129', '0', '3');
INSERT INTO shop_area VALUES ('1677', '珲春市', '129', '0', '3');
INSERT INTO shop_area VALUES ('1678', '龙井市', '129', '0', '3');
INSERT INTO shop_area VALUES ('1679', '五常市', '130', '0', '3');
INSERT INTO shop_area VALUES ('1680', '依兰县', '130', '0', '3');
INSERT INTO shop_area VALUES ('1681', '南岗区', '130', '0', '3');
INSERT INTO shop_area VALUES ('1682', '双城市', '130', '0', '3');
INSERT INTO shop_area VALUES ('1683', '呼兰区', '130', '0', '3');
INSERT INTO shop_area VALUES ('1684', '哈尔滨市道里区', '130', '0', '3');
INSERT INTO shop_area VALUES ('1685', '宾县', '130', '0', '3');
INSERT INTO shop_area VALUES ('1686', '尚志市', '130', '0', '3');
INSERT INTO shop_area VALUES ('1687', '巴彦县', '130', '0', '3');
INSERT INTO shop_area VALUES ('1688', '平房区', '130', '0', '3');
INSERT INTO shop_area VALUES ('1689', '延寿县', '130', '0', '3');
INSERT INTO shop_area VALUES ('1690', '方正县', '130', '0', '3');
INSERT INTO shop_area VALUES ('1691', '木兰县', '130', '0', '3');
INSERT INTO shop_area VALUES ('1692', '松北区', '130', '0', '3');
INSERT INTO shop_area VALUES ('1693', '通河县', '130', '0', '3');
INSERT INTO shop_area VALUES ('1694', '道外区', '130', '0', '3');
INSERT INTO shop_area VALUES ('1695', '阿城区', '130', '0', '3');
INSERT INTO shop_area VALUES ('1696', '香坊区', '130', '0', '3');
INSERT INTO shop_area VALUES ('1697', '依安县', '131', '0', '3');
INSERT INTO shop_area VALUES ('1698', '克东县', '131', '0', '3');
INSERT INTO shop_area VALUES ('1699', '克山县', '131', '0', '3');
INSERT INTO shop_area VALUES ('1700', '富拉尔基区', '131', '0', '3');
INSERT INTO shop_area VALUES ('1701', '富裕县', '131', '0', '3');
INSERT INTO shop_area VALUES ('1702', '建华区', '131', '0', '3');
INSERT INTO shop_area VALUES ('1703', '拜泉县', '131', '0', '3');
INSERT INTO shop_area VALUES ('1704', '昂昂溪区', '131', '0', '3');
INSERT INTO shop_area VALUES ('1705', '梅里斯达斡尔族区', '131', '0', '3');
INSERT INTO shop_area VALUES ('1706', '泰来县', '131', '0', '3');
INSERT INTO shop_area VALUES ('1707', '甘南县', '131', '0', '3');
INSERT INTO shop_area VALUES ('1708', '碾子山区', '131', '0', '3');
INSERT INTO shop_area VALUES ('1709', '讷河市', '131', '0', '3');
INSERT INTO shop_area VALUES ('1710', '铁锋区', '131', '0', '3');
INSERT INTO shop_area VALUES ('1711', '龙江县', '131', '0', '3');
INSERT INTO shop_area VALUES ('1712', '龙沙区', '131', '0', '3');
INSERT INTO shop_area VALUES ('1713', '城子河区', '132', '0', '3');
INSERT INTO shop_area VALUES ('1714', '密山市', '132', '0', '3');
INSERT INTO shop_area VALUES ('1715', '恒山区', '132', '0', '3');
INSERT INTO shop_area VALUES ('1716', '梨树区', '132', '0', '3');
INSERT INTO shop_area VALUES ('1717', '滴道区', '132', '0', '3');
INSERT INTO shop_area VALUES ('1718', '虎林市', '132', '0', '3');
INSERT INTO shop_area VALUES ('1719', '鸡东县', '132', '0', '3');
INSERT INTO shop_area VALUES ('1720', '鸡冠区', '132', '0', '3');
INSERT INTO shop_area VALUES ('1721', '麻山区', '132', '0', '3');
INSERT INTO shop_area VALUES ('1722', '东山区', '133', '0', '3');
INSERT INTO shop_area VALUES ('1723', '兴安区', '133', '0', '3');
INSERT INTO shop_area VALUES ('1724', '兴山区', '133', '0', '3');
INSERT INTO shop_area VALUES ('1725', '南山区', '133', '0', '3');
INSERT INTO shop_area VALUES ('1726', '向阳区', '133', '0', '3');
INSERT INTO shop_area VALUES ('1727', '工农区', '133', '0', '3');
INSERT INTO shop_area VALUES ('1728', '绥滨县', '133', '0', '3');
INSERT INTO shop_area VALUES ('1729', '萝北县', '133', '0', '3');
INSERT INTO shop_area VALUES ('1730', '友谊县', '134', '0', '3');
INSERT INTO shop_area VALUES ('1731', '四方台区', '134', '0', '3');
INSERT INTO shop_area VALUES ('1732', '宝山区', '134', '0', '3');
INSERT INTO shop_area VALUES ('1733', '宝清县', '134', '0', '3');
INSERT INTO shop_area VALUES ('1734', '尖山区', '134', '0', '3');
INSERT INTO shop_area VALUES ('1735', '岭东区', '134', '0', '3');
INSERT INTO shop_area VALUES ('1736', '集贤县', '134', '0', '3');
INSERT INTO shop_area VALUES ('1737', '饶河县', '134', '0', '3');
INSERT INTO shop_area VALUES ('1738', '大同区', '135', '0', '3');
INSERT INTO shop_area VALUES ('1739', '杜尔伯特蒙古族自治县', '135', '0', '3');
INSERT INTO shop_area VALUES ('1740', '林甸县', '135', '0', '3');
INSERT INTO shop_area VALUES ('1741', '红岗区', '135', '0', '3');
INSERT INTO shop_area VALUES ('1742', '肇州县', '135', '0', '3');
INSERT INTO shop_area VALUES ('1743', '肇源县', '135', '0', '3');
INSERT INTO shop_area VALUES ('1744', '胡路区', '135', '0', '3');
INSERT INTO shop_area VALUES ('1745', '萨尔图区', '135', '0', '3');
INSERT INTO shop_area VALUES ('1746', '龙凤区', '135', '0', '3');
INSERT INTO shop_area VALUES ('1747', '上甘岭区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1748', '乌伊岭区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1749', '乌马河区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1750', '五营区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1751', '伊春区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1752', '南岔区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1753', '友好区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1754', '嘉荫县', '136', '0', '3');
INSERT INTO shop_area VALUES ('1755', '带岭区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1756', '新青区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1757', '汤旺河区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1758', '红星区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1759', '美溪区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1760', '翠峦区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1761', '西林区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1762', '金山屯区', '136', '0', '3');
INSERT INTO shop_area VALUES ('1763', '铁力市', '136', '0', '3');
INSERT INTO shop_area VALUES ('1764', '东风区', '137', '0', '3');
INSERT INTO shop_area VALUES ('1765', '前进区', '137', '0', '3');
INSERT INTO shop_area VALUES ('1766', '同江市', '137', '0', '3');
INSERT INTO shop_area VALUES ('1767', '向阳区', '137', '0', '3');
INSERT INTO shop_area VALUES ('1768', '富锦市', '137', '0', '3');
INSERT INTO shop_area VALUES ('1769', '抚远县', '137', '0', '3');
INSERT INTO shop_area VALUES ('1770', '桦南县', '137', '0', '3');
INSERT INTO shop_area VALUES ('1771', '桦川县', '137', '0', '3');
INSERT INTO shop_area VALUES ('1772', '汤原县', '137', '0', '3');
INSERT INTO shop_area VALUES ('1773', '郊区', '137', '0', '3');
INSERT INTO shop_area VALUES ('1774', '勃利县', '138', '0', '3');
INSERT INTO shop_area VALUES ('1775', '新兴区', '138', '0', '3');
INSERT INTO shop_area VALUES ('1776', '桃山区', '138', '0', '3');
INSERT INTO shop_area VALUES ('1777', '茄子河区', '138', '0', '3');
INSERT INTO shop_area VALUES ('1778', '东宁县', '139', '0', '3');
INSERT INTO shop_area VALUES ('1779', '东安区', '139', '0', '3');
INSERT INTO shop_area VALUES ('1780', '宁安市', '139', '0', '3');
INSERT INTO shop_area VALUES ('1781', '林口县', '139', '0', '3');
INSERT INTO shop_area VALUES ('1782', '海林市', '139', '0', '3');
INSERT INTO shop_area VALUES ('1783', '爱民区', '139', '0', '3');
INSERT INTO shop_area VALUES ('1784', '穆棱市', '139', '0', '3');
INSERT INTO shop_area VALUES ('1785', '绥芬河市', '139', '0', '3');
INSERT INTO shop_area VALUES ('1786', '西安区', '139', '0', '3');
INSERT INTO shop_area VALUES ('1787', '阳明区', '139', '0', '3');
INSERT INTO shop_area VALUES ('1788', '五大连池市', '140', '0', '3');
INSERT INTO shop_area VALUES ('1789', '北安市', '140', '0', '3');
INSERT INTO shop_area VALUES ('1790', '嫩江县', '140', '0', '3');
INSERT INTO shop_area VALUES ('1791', '孙吴县', '140', '0', '3');
INSERT INTO shop_area VALUES ('1792', '爱辉区', '140', '0', '3');
INSERT INTO shop_area VALUES ('1793', '车逊克县', '140', '0', '3');
INSERT INTO shop_area VALUES ('1794', '逊克县', '140', '0', '3');
INSERT INTO shop_area VALUES ('1795', '兰西县', '141', '0', '3');
INSERT INTO shop_area VALUES ('1796', '安达市', '141', '0', '3');
INSERT INTO shop_area VALUES ('1797', '庆安县', '141', '0', '3');
INSERT INTO shop_area VALUES ('1798', '明水县', '141', '0', '3');
INSERT INTO shop_area VALUES ('1799', '望奎县', '141', '0', '3');
INSERT INTO shop_area VALUES ('1800', '海伦市', '141', '0', '3');
INSERT INTO shop_area VALUES ('1801', '绥化市北林区', '141', '0', '3');
INSERT INTO shop_area VALUES ('1802', '绥棱县', '141', '0', '3');
INSERT INTO shop_area VALUES ('1803', '肇东市', '141', '0', '3');
INSERT INTO shop_area VALUES ('1804', '青冈县', '141', '0', '3');
INSERT INTO shop_area VALUES ('1805', '呼玛县', '142', '0', '3');
INSERT INTO shop_area VALUES ('1806', '塔河县', '142', '0', '3');
INSERT INTO shop_area VALUES ('1807', '大兴安岭地区加格达奇区', '142', '0', '3');
INSERT INTO shop_area VALUES ('1808', '大兴安岭地区呼中区', '142', '0', '3');
INSERT INTO shop_area VALUES ('1809', '大兴安岭地区新林区', '142', '0', '3');
INSERT INTO shop_area VALUES ('1810', '大兴安岭地区松岭区', '142', '0', '3');
INSERT INTO shop_area VALUES ('1811', '漠河县', '142', '0', '3');
INSERT INTO shop_area VALUES ('2027', '下关区', '162', '0', '3');
INSERT INTO shop_area VALUES ('2028', '六合区', '162', '0', '3');
INSERT INTO shop_area VALUES ('2029', '建邺区', '162', '0', '3');
INSERT INTO shop_area VALUES ('2030', '栖霞区', '162', '0', '3');
INSERT INTO shop_area VALUES ('2031', '江宁区', '162', '0', '3');
INSERT INTO shop_area VALUES ('2032', '浦口区', '162', '0', '3');
INSERT INTO shop_area VALUES ('2033', '溧水县', '162', '0', '3');
INSERT INTO shop_area VALUES ('2034', '玄武区', '162', '0', '3');
INSERT INTO shop_area VALUES ('2035', '白下区', '162', '0', '3');
INSERT INTO shop_area VALUES ('2036', '秦淮区', '162', '0', '3');
INSERT INTO shop_area VALUES ('2037', '雨花台区', '162', '0', '3');
INSERT INTO shop_area VALUES ('2038', '高淳县', '162', '0', '3');
INSERT INTO shop_area VALUES ('2039', '鼓楼区', '162', '0', '3');
INSERT INTO shop_area VALUES ('2040', '北塘区', '163', '0', '3');
INSERT INTO shop_area VALUES ('2041', '南长区', '163', '0', '3');
INSERT INTO shop_area VALUES ('2042', '宜兴市', '163', '0', '3');
INSERT INTO shop_area VALUES ('2043', '崇安区', '163', '0', '3');
INSERT INTO shop_area VALUES ('2044', '惠山区', '163', '0', '3');
INSERT INTO shop_area VALUES ('2045', '江阴市', '163', '0', '3');
INSERT INTO shop_area VALUES ('2046', '滨湖区', '163', '0', '3');
INSERT INTO shop_area VALUES ('2047', '锡山区', '163', '0', '3');
INSERT INTO shop_area VALUES ('2048', '丰县', '164', '0', '3');
INSERT INTO shop_area VALUES ('2049', '九里区', '164', '0', '3');
INSERT INTO shop_area VALUES ('2050', '云龙区', '164', '0', '3');
INSERT INTO shop_area VALUES ('2051', '新沂市', '164', '0', '3');
INSERT INTO shop_area VALUES ('2052', '沛县', '164', '0', '3');
INSERT INTO shop_area VALUES ('2053', '泉山区', '164', '0', '3');
INSERT INTO shop_area VALUES ('2054', '睢宁县', '164', '0', '3');
INSERT INTO shop_area VALUES ('2055', '贾汪区', '164', '0', '3');
INSERT INTO shop_area VALUES ('2056', '邳州市', '164', '0', '3');
INSERT INTO shop_area VALUES ('2057', '铜山县', '164', '0', '3');
INSERT INTO shop_area VALUES ('2058', '鼓楼区', '164', '0', '3');
INSERT INTO shop_area VALUES ('2059', '天宁区', '165', '0', '3');
INSERT INTO shop_area VALUES ('2060', '戚墅堰区', '165', '0', '3');
INSERT INTO shop_area VALUES ('2061', '新北区', '165', '0', '3');
INSERT INTO shop_area VALUES ('2062', '武进区', '165', '0', '3');
INSERT INTO shop_area VALUES ('2063', '溧阳市', '165', '0', '3');
INSERT INTO shop_area VALUES ('2064', '金坛市', '165', '0', '3');
INSERT INTO shop_area VALUES ('2065', '钟楼区', '165', '0', '3');
INSERT INTO shop_area VALUES ('2066', '吴中区', '166', '0', '3');
INSERT INTO shop_area VALUES ('2067', '吴江市', '166', '0', '3');
INSERT INTO shop_area VALUES ('2068', '太仓市', '166', '0', '3');
INSERT INTO shop_area VALUES ('2069', '常熟市', '166', '0', '3');
INSERT INTO shop_area VALUES ('2070', '平江区', '166', '0', '3');
INSERT INTO shop_area VALUES ('2071', '张家港市', '166', '0', '3');
INSERT INTO shop_area VALUES ('2072', '昆山市', '166', '0', '3');
INSERT INTO shop_area VALUES ('2073', '沧浪区', '166', '0', '3');
INSERT INTO shop_area VALUES ('2074', '相城区', '166', '0', '3');
INSERT INTO shop_area VALUES ('2075', '苏州工业园区', '166', '0', '3');
INSERT INTO shop_area VALUES ('2076', '虎丘区', '166', '0', '3');
INSERT INTO shop_area VALUES ('2077', '金阊区', '166', '0', '3');
INSERT INTO shop_area VALUES ('2078', '启东市', '167', '0', '3');
INSERT INTO shop_area VALUES ('2079', '如东县', '167', '0', '3');
INSERT INTO shop_area VALUES ('2080', '如皋市', '167', '0', '3');
INSERT INTO shop_area VALUES ('2081', '崇川区', '167', '0', '3');
INSERT INTO shop_area VALUES ('2082', '海安县', '167', '0', '3');
INSERT INTO shop_area VALUES ('2083', '海门市', '167', '0', '3');
INSERT INTO shop_area VALUES ('2084', '港闸区', '167', '0', '3');
INSERT INTO shop_area VALUES ('2085', '通州市', '167', '0', '3');
INSERT INTO shop_area VALUES ('2086', '东海县', '168', '0', '3');
INSERT INTO shop_area VALUES ('2087', '新浦区', '168', '0', '3');
INSERT INTO shop_area VALUES ('2088', '海州区', '168', '0', '3');
INSERT INTO shop_area VALUES ('2089', '灌云县', '168', '0', '3');
INSERT INTO shop_area VALUES ('2090', '灌南县', '168', '0', '3');
INSERT INTO shop_area VALUES ('2091', '赣榆县', '168', '0', '3');
INSERT INTO shop_area VALUES ('2092', '连云区', '168', '0', '3');
INSERT INTO shop_area VALUES ('2093', '楚州区', '169', '0', '3');
INSERT INTO shop_area VALUES ('2094', '洪泽县', '169', '0', '3');
INSERT INTO shop_area VALUES ('2095', '涟水县', '169', '0', '3');
INSERT INTO shop_area VALUES ('2096', '淮阴区', '169', '0', '3');
INSERT INTO shop_area VALUES ('2097', '清河区', '169', '0', '3');
INSERT INTO shop_area VALUES ('2098', '清浦区', '169', '0', '3');
INSERT INTO shop_area VALUES ('2099', '盱眙县', '169', '0', '3');
INSERT INTO shop_area VALUES ('2100', '金湖县', '169', '0', '3');
INSERT INTO shop_area VALUES ('2101', '东台市', '170', '0', '3');
INSERT INTO shop_area VALUES ('2102', '亭湖区', '170', '0', '3');
INSERT INTO shop_area VALUES ('2103', '响水县', '170', '0', '3');
INSERT INTO shop_area VALUES ('2104', '大丰市', '170', '0', '3');
INSERT INTO shop_area VALUES ('2105', '射阳县', '170', '0', '3');
INSERT INTO shop_area VALUES ('2106', '建湖县', '170', '0', '3');
INSERT INTO shop_area VALUES ('2107', '滨海县', '170', '0', '3');
INSERT INTO shop_area VALUES ('2108', '盐都区', '170', '0', '3');
INSERT INTO shop_area VALUES ('2109', '阜宁县', '170', '0', '3');
INSERT INTO shop_area VALUES ('2110', '仪征市', '171', '0', '3');
INSERT INTO shop_area VALUES ('2111', '宝应县', '171', '0', '3');
INSERT INTO shop_area VALUES ('2112', '广陵区', '171', '0', '3');
INSERT INTO shop_area VALUES ('2113', '江都市', '171', '0', '3');
INSERT INTO shop_area VALUES ('2114', '维扬区', '171', '0', '3');
INSERT INTO shop_area VALUES ('2115', '邗江区', '171', '0', '3');
INSERT INTO shop_area VALUES ('2116', '高邮市', '171', '0', '3');
INSERT INTO shop_area VALUES ('2117', '丹徒区', '172', '0', '3');
INSERT INTO shop_area VALUES ('2118', '丹阳市', '172', '0', '3');
INSERT INTO shop_area VALUES ('2119', '京口区', '172', '0', '3');
INSERT INTO shop_area VALUES ('2120', '句容市', '172', '0', '3');
INSERT INTO shop_area VALUES ('2121', '扬中市', '172', '0', '3');
INSERT INTO shop_area VALUES ('2122', '润州区', '172', '0', '3');
INSERT INTO shop_area VALUES ('2123', '兴化市', '173', '0', '3');
INSERT INTO shop_area VALUES ('2124', '姜堰市', '173', '0', '3');
INSERT INTO shop_area VALUES ('2125', '泰兴市', '173', '0', '3');
INSERT INTO shop_area VALUES ('2126', '海陵区', '173', '0', '3');
INSERT INTO shop_area VALUES ('2127', '靖江市', '173', '0', '3');
INSERT INTO shop_area VALUES ('2128', '高港区', '173', '0', '3');
INSERT INTO shop_area VALUES ('2129', '宿城区', '174', '0', '3');
INSERT INTO shop_area VALUES ('2130', '宿豫区', '174', '0', '3');
INSERT INTO shop_area VALUES ('2131', '沭阳县', '174', '0', '3');
INSERT INTO shop_area VALUES ('2132', '泗洪县', '174', '0', '3');
INSERT INTO shop_area VALUES ('2133', '泗阳县', '174', '0', '3');
INSERT INTO shop_area VALUES ('2134', '上城区', '175', '0', '3');
INSERT INTO shop_area VALUES ('2135', '下城区', '175', '0', '3');
INSERT INTO shop_area VALUES ('2136', '临安市', '175', '0', '3');
INSERT INTO shop_area VALUES ('2137', '余杭区', '175', '0', '3');
INSERT INTO shop_area VALUES ('2138', '富阳市', '175', '0', '3');
INSERT INTO shop_area VALUES ('2139', '建德市', '175', '0', '3');
INSERT INTO shop_area VALUES ('2140', '拱墅区', '175', '0', '3');
INSERT INTO shop_area VALUES ('2141', '桐庐县', '175', '0', '3');
INSERT INTO shop_area VALUES ('2142', '江干区', '175', '0', '3');
INSERT INTO shop_area VALUES ('2143', '淳安县', '175', '0', '3');
INSERT INTO shop_area VALUES ('2144', '滨江区', '175', '0', '3');
INSERT INTO shop_area VALUES ('2145', '萧山区', '175', '0', '3');
INSERT INTO shop_area VALUES ('2146', '西湖区', '175', '0', '3');
INSERT INTO shop_area VALUES ('2147', '余姚市', '176', '0', '3');
INSERT INTO shop_area VALUES ('2148', '北仑区', '176', '0', '3');
INSERT INTO shop_area VALUES ('2149', '奉化市', '176', '0', '3');
INSERT INTO shop_area VALUES ('2150', '宁海县', '176', '0', '3');
INSERT INTO shop_area VALUES ('2151', '慈溪市', '176', '0', '3');
INSERT INTO shop_area VALUES ('2152', '江东区', '176', '0', '3');
INSERT INTO shop_area VALUES ('2153', '江北区', '176', '0', '3');
INSERT INTO shop_area VALUES ('2154', '海曙区', '176', '0', '3');
INSERT INTO shop_area VALUES ('2155', '象山县', '176', '0', '3');
INSERT INTO shop_area VALUES ('2156', '鄞州区', '176', '0', '3');
INSERT INTO shop_area VALUES ('2157', '镇海区', '176', '0', '3');
INSERT INTO shop_area VALUES ('2158', '乐清市', '177', '0', '3');
INSERT INTO shop_area VALUES ('2159', '平阳县', '177', '0', '3');
INSERT INTO shop_area VALUES ('2160', '文成县', '177', '0', '3');
INSERT INTO shop_area VALUES ('2161', '永嘉县', '177', '0', '3');
INSERT INTO shop_area VALUES ('2162', '泰顺县', '177', '0', '3');
INSERT INTO shop_area VALUES ('2163', '洞头县', '177', '0', '3');
INSERT INTO shop_area VALUES ('2164', '瑞安市', '177', '0', '3');
INSERT INTO shop_area VALUES ('2165', '瓯海区', '177', '0', '3');
INSERT INTO shop_area VALUES ('2166', '苍南县', '177', '0', '3');
INSERT INTO shop_area VALUES ('2167', '鹿城区', '177', '0', '3');
INSERT INTO shop_area VALUES ('2168', '龙湾区', '177', '0', '3');
INSERT INTO shop_area VALUES ('2169', '南湖区', '178', '0', '3');
INSERT INTO shop_area VALUES ('2170', '嘉善县', '178', '0', '3');
INSERT INTO shop_area VALUES ('2171', '平湖市', '178', '0', '3');
INSERT INTO shop_area VALUES ('2172', '桐乡市', '178', '0', '3');
INSERT INTO shop_area VALUES ('2173', '海宁市', '178', '0', '3');
INSERT INTO shop_area VALUES ('2174', '海盐县', '178', '0', '3');
INSERT INTO shop_area VALUES ('2175', '秀洲区', '178', '0', '3');
INSERT INTO shop_area VALUES ('2176', '南浔区', '179', '0', '3');
INSERT INTO shop_area VALUES ('2177', '吴兴区', '179', '0', '3');
INSERT INTO shop_area VALUES ('2178', '安吉县', '179', '0', '3');
INSERT INTO shop_area VALUES ('2179', '德清县', '179', '0', '3');
INSERT INTO shop_area VALUES ('2180', '长兴县', '179', '0', '3');
INSERT INTO shop_area VALUES ('2181', '上虞市', '180', '0', '3');
INSERT INTO shop_area VALUES ('2182', '嵊州市', '180', '0', '3');
INSERT INTO shop_area VALUES ('2183', '新昌县', '180', '0', '3');
INSERT INTO shop_area VALUES ('2184', '绍兴县', '180', '0', '3');
INSERT INTO shop_area VALUES ('2185', '诸暨市', '180', '0', '3');
INSERT INTO shop_area VALUES ('2186', '越城区', '180', '0', '3');
INSERT INTO shop_area VALUES ('2187', '定海区', '181', '0', '3');
INSERT INTO shop_area VALUES ('2188', '岱山县', '181', '0', '3');
INSERT INTO shop_area VALUES ('2189', '嵊泗县', '181', '0', '3');
INSERT INTO shop_area VALUES ('2190', '普陀区', '181', '0', '3');
INSERT INTO shop_area VALUES ('2191', '常山县', '182', '0', '3');
INSERT INTO shop_area VALUES ('2192', '开化县', '182', '0', '3');
INSERT INTO shop_area VALUES ('2193', '柯城区', '182', '0', '3');
INSERT INTO shop_area VALUES ('2194', '江山市', '182', '0', '3');
INSERT INTO shop_area VALUES ('2195', '衢江区', '182', '0', '3');
INSERT INTO shop_area VALUES ('2196', '龙游县', '182', '0', '3');
INSERT INTO shop_area VALUES ('2197', '东阳市', '183', '0', '3');
INSERT INTO shop_area VALUES ('2198', '义乌市', '183', '0', '3');
INSERT INTO shop_area VALUES ('2199', '兰溪市', '183', '0', '3');
INSERT INTO shop_area VALUES ('2200', '婺城区', '183', '0', '3');
INSERT INTO shop_area VALUES ('2201', '武义县', '183', '0', '3');
INSERT INTO shop_area VALUES ('2202', '永康市', '183', '0', '3');
INSERT INTO shop_area VALUES ('2203', '浦江县', '183', '0', '3');
INSERT INTO shop_area VALUES ('2204', '磐安县', '183', '0', '3');
INSERT INTO shop_area VALUES ('2205', '金东区', '183', '0', '3');
INSERT INTO shop_area VALUES ('2206', '三门县', '184', '0', '3');
INSERT INTO shop_area VALUES ('2207', '临海市', '184', '0', '3');
INSERT INTO shop_area VALUES ('2208', '仙居县', '184', '0', '3');
INSERT INTO shop_area VALUES ('2209', '天台县', '184', '0', '3');
INSERT INTO shop_area VALUES ('2210', '椒江区', '184', '0', '3');
INSERT INTO shop_area VALUES ('2211', '温岭市', '184', '0', '3');
INSERT INTO shop_area VALUES ('2212', '玉环县', '184', '0', '3');
INSERT INTO shop_area VALUES ('2213', '路桥区', '184', '0', '3');
INSERT INTO shop_area VALUES ('2214', '黄岩区', '184', '0', '3');
INSERT INTO shop_area VALUES ('2215', '云和县', '185', '0', '3');
INSERT INTO shop_area VALUES ('2216', '庆元县', '185', '0', '3');
INSERT INTO shop_area VALUES ('2217', '景宁畲族自治县', '185', '0', '3');
INSERT INTO shop_area VALUES ('2218', '松阳县', '185', '0', '3');
INSERT INTO shop_area VALUES ('2219', '缙云县', '185', '0', '3');
INSERT INTO shop_area VALUES ('2220', '莲都区', '185', '0', '3');
INSERT INTO shop_area VALUES ('2221', '遂昌县', '185', '0', '3');
INSERT INTO shop_area VALUES ('2222', '青田县', '185', '0', '3');
INSERT INTO shop_area VALUES ('2223', '龙泉市', '185', '0', '3');
INSERT INTO shop_area VALUES ('2224', '包河区', '186', '0', '3');
INSERT INTO shop_area VALUES ('2225', '庐阳区', '186', '0', '3');
INSERT INTO shop_area VALUES ('2226', '瑶海区', '186', '0', '3');
INSERT INTO shop_area VALUES ('2227', '肥东县', '186', '0', '3');
INSERT INTO shop_area VALUES ('2228', '肥西县', '186', '0', '3');
INSERT INTO shop_area VALUES ('2229', '蜀山区', '186', '0', '3');
INSERT INTO shop_area VALUES ('2230', '长丰县', '186', '0', '3');
INSERT INTO shop_area VALUES ('2231', '三山区', '187', '0', '3');
INSERT INTO shop_area VALUES ('2232', '南陵县', '187', '0', '3');
INSERT INTO shop_area VALUES ('2233', '弋江区', '187', '0', '3');
INSERT INTO shop_area VALUES ('2234', '繁昌县', '187', '0', '3');
INSERT INTO shop_area VALUES ('2235', '芜湖县', '187', '0', '3');
INSERT INTO shop_area VALUES ('2236', '镜湖区', '187', '0', '3');
INSERT INTO shop_area VALUES ('2237', '鸠江区', '187', '0', '3');
INSERT INTO shop_area VALUES ('2238', '五河县', '188', '0', '3');
INSERT INTO shop_area VALUES ('2239', '固镇县', '188', '0', '3');
INSERT INTO shop_area VALUES ('2240', '怀远县', '188', '0', '3');
INSERT INTO shop_area VALUES ('2241', '淮上区', '188', '0', '3');
INSERT INTO shop_area VALUES ('2242', '禹会区', '188', '0', '3');
INSERT INTO shop_area VALUES ('2243', '蚌山区', '188', '0', '3');
INSERT INTO shop_area VALUES ('2244', '龙子湖区', '188', '0', '3');
INSERT INTO shop_area VALUES ('2245', '八公山区', '189', '0', '3');
INSERT INTO shop_area VALUES ('2246', '凤台县', '189', '0', '3');
INSERT INTO shop_area VALUES ('2247', '大通区', '189', '0', '3');
INSERT INTO shop_area VALUES ('2248', '潘集区', '189', '0', '3');
INSERT INTO shop_area VALUES ('2249', '田家庵区', '189', '0', '3');
INSERT INTO shop_area VALUES ('2250', '谢家集区', '189', '0', '3');
INSERT INTO shop_area VALUES ('2251', '当涂县', '190', '0', '3');
INSERT INTO shop_area VALUES ('2252', '花山区', '190', '0', '3');
INSERT INTO shop_area VALUES ('2253', '金家庄区', '190', '0', '3');
INSERT INTO shop_area VALUES ('2254', '雨山区', '190', '0', '3');
INSERT INTO shop_area VALUES ('2255', '杜集区', '191', '0', '3');
INSERT INTO shop_area VALUES ('2256', '濉溪县', '191', '0', '3');
INSERT INTO shop_area VALUES ('2257', '烈山区', '191', '0', '3');
INSERT INTO shop_area VALUES ('2258', '相山区', '191', '0', '3');
INSERT INTO shop_area VALUES ('2259', '狮子山区', '192', '0', '3');
INSERT INTO shop_area VALUES ('2260', '郊区', '192', '0', '3');
INSERT INTO shop_area VALUES ('2261', '铜官山区', '192', '0', '3');
INSERT INTO shop_area VALUES ('2262', '铜陵县', '192', '0', '3');
INSERT INTO shop_area VALUES ('2263', '大观区', '193', '0', '3');
INSERT INTO shop_area VALUES ('2264', '太湖县', '193', '0', '3');
INSERT INTO shop_area VALUES ('2265', '宜秀区', '193', '0', '3');
INSERT INTO shop_area VALUES ('2266', '宿松县', '193', '0', '3');
INSERT INTO shop_area VALUES ('2267', '岳西县', '193', '0', '3');
INSERT INTO shop_area VALUES ('2268', '怀宁县', '193', '0', '3');
INSERT INTO shop_area VALUES ('2269', '望江县', '193', '0', '3');
INSERT INTO shop_area VALUES ('2270', '枞阳县', '193', '0', '3');
INSERT INTO shop_area VALUES ('2271', '桐城市', '193', '0', '3');
INSERT INTO shop_area VALUES ('2272', '潜山县', '193', '0', '3');
INSERT INTO shop_area VALUES ('2273', '迎江区', '193', '0', '3');
INSERT INTO shop_area VALUES ('2274', '休宁县', '194', '0', '3');
INSERT INTO shop_area VALUES ('2275', '屯溪区', '194', '0', '3');
INSERT INTO shop_area VALUES ('2276', '徽州区', '194', '0', '3');
INSERT INTO shop_area VALUES ('2277', '歙县', '194', '0', '3');
INSERT INTO shop_area VALUES ('2278', '祁门县', '194', '0', '3');
INSERT INTO shop_area VALUES ('2279', '黄山区', '194', '0', '3');
INSERT INTO shop_area VALUES ('2280', '黟县', '194', '0', '3');
INSERT INTO shop_area VALUES ('2281', '全椒县', '195', '0', '3');
INSERT INTO shop_area VALUES ('2282', '凤阳县', '195', '0', '3');
INSERT INTO shop_area VALUES ('2283', '南谯区', '195', '0', '3');
INSERT INTO shop_area VALUES ('2284', '天长市', '195', '0', '3');
INSERT INTO shop_area VALUES ('2285', '定远县', '195', '0', '3');
INSERT INTO shop_area VALUES ('2286', '明光市', '195', '0', '3');
INSERT INTO shop_area VALUES ('2287', '来安县', '195', '0', '3');
INSERT INTO shop_area VALUES ('2288', '琅玡区', '195', '0', '3');
INSERT INTO shop_area VALUES ('2289', '临泉县', '196', '0', '3');
INSERT INTO shop_area VALUES ('2290', '太和县', '196', '0', '3');
INSERT INTO shop_area VALUES ('2291', '界首市', '196', '0', '3');
INSERT INTO shop_area VALUES ('2292', '阜南县', '196', '0', '3');
INSERT INTO shop_area VALUES ('2293', '颍东区', '196', '0', '3');
INSERT INTO shop_area VALUES ('2294', '颍州区', '196', '0', '3');
INSERT INTO shop_area VALUES ('2295', '颍泉区', '196', '0', '3');
INSERT INTO shop_area VALUES ('2296', '颖上县', '196', '0', '3');
INSERT INTO shop_area VALUES ('2297', '埇桥区', '197', '0', '3');
INSERT INTO shop_area VALUES ('2298', '泗县辖', '197', '0', '3');
INSERT INTO shop_area VALUES ('2299', '灵璧县', '197', '0', '3');
INSERT INTO shop_area VALUES ('2300', '砀山县', '197', '0', '3');
INSERT INTO shop_area VALUES ('2301', '萧县', '197', '0', '3');
INSERT INTO shop_area VALUES ('2302', '含山县', '198', '0', '3');
INSERT INTO shop_area VALUES ('2303', '和县', '198', '0', '3');
INSERT INTO shop_area VALUES ('2304', '居巢区', '198', '0', '3');
INSERT INTO shop_area VALUES ('2305', '庐江县', '198', '0', '3');
INSERT INTO shop_area VALUES ('2306', '无为县', '198', '0', '3');
INSERT INTO shop_area VALUES ('2307', '寿县', '199', '0', '3');
INSERT INTO shop_area VALUES ('2308', '舒城县', '199', '0', '3');
INSERT INTO shop_area VALUES ('2309', '裕安区', '199', '0', '3');
INSERT INTO shop_area VALUES ('2310', '金安区', '199', '0', '3');
INSERT INTO shop_area VALUES ('2311', '金寨县', '199', '0', '3');
INSERT INTO shop_area VALUES ('2312', '霍山县', '199', '0', '3');
INSERT INTO shop_area VALUES ('2313', '霍邱县', '199', '0', '3');
INSERT INTO shop_area VALUES ('2314', '利辛县', '200', '0', '3');
INSERT INTO shop_area VALUES ('2315', '涡阳县', '200', '0', '3');
INSERT INTO shop_area VALUES ('2316', '蒙城县', '200', '0', '3');
INSERT INTO shop_area VALUES ('2317', '谯城区', '200', '0', '3');
INSERT INTO shop_area VALUES ('2318', '东至县', '201', '0', '3');
INSERT INTO shop_area VALUES ('2319', '石台县', '201', '0', '3');
INSERT INTO shop_area VALUES ('2320', '贵池区', '201', '0', '3');
INSERT INTO shop_area VALUES ('2321', '青阳县', '201', '0', '3');
INSERT INTO shop_area VALUES ('2322', '宁国市', '202', '0', '3');
INSERT INTO shop_area VALUES ('2323', '宣州区', '202', '0', '3');
INSERT INTO shop_area VALUES ('2324', '广德县', '202', '0', '3');
INSERT INTO shop_area VALUES ('2325', '旌德县', '202', '0', '3');
INSERT INTO shop_area VALUES ('2326', '泾县', '202', '0', '3');
INSERT INTO shop_area VALUES ('2327', '绩溪县', '202', '0', '3');
INSERT INTO shop_area VALUES ('2328', '郎溪县', '202', '0', '3');
INSERT INTO shop_area VALUES ('2329', '仓山区', '203', '0', '3');
INSERT INTO shop_area VALUES ('2330', '台江区', '203', '0', '3');
INSERT INTO shop_area VALUES ('2331', '平潭县', '203', '0', '3');
INSERT INTO shop_area VALUES ('2332', '晋安区', '203', '0', '3');
INSERT INTO shop_area VALUES ('2333', '永泰县', '203', '0', '3');
INSERT INTO shop_area VALUES ('2334', '福清市', '203', '0', '3');
INSERT INTO shop_area VALUES ('2335', '罗源县', '203', '0', '3');
INSERT INTO shop_area VALUES ('2336', '连江县', '203', '0', '3');
INSERT INTO shop_area VALUES ('2337', '长乐市', '203', '0', '3');
INSERT INTO shop_area VALUES ('2338', '闽侯县', '203', '0', '3');
INSERT INTO shop_area VALUES ('2339', '闽清县', '203', '0', '3');
INSERT INTO shop_area VALUES ('2340', '马尾区', '203', '0', '3');
INSERT INTO shop_area VALUES ('2341', '鼓楼区', '203', '0', '3');
INSERT INTO shop_area VALUES ('2342', '同安区', '204', '0', '3');
INSERT INTO shop_area VALUES ('2343', '思明区', '204', '0', '3');
INSERT INTO shop_area VALUES ('2344', '海沧区', '204', '0', '3');
INSERT INTO shop_area VALUES ('2345', '湖里区', '204', '0', '3');
INSERT INTO shop_area VALUES ('2346', '翔安区', '204', '0', '3');
INSERT INTO shop_area VALUES ('2347', '集美区', '204', '0', '3');
INSERT INTO shop_area VALUES ('2348', '仙游县', '205', '0', '3');
INSERT INTO shop_area VALUES ('2349', '城厢区', '205', '0', '3');
INSERT INTO shop_area VALUES ('2350', '涵江区', '205', '0', '3');
INSERT INTO shop_area VALUES ('2351', '秀屿区', '205', '0', '3');
INSERT INTO shop_area VALUES ('2352', '荔城区', '205', '0', '3');
INSERT INTO shop_area VALUES ('2353', '三元区', '206', '0', '3');
INSERT INTO shop_area VALUES ('2354', '大田县', '206', '0', '3');
INSERT INTO shop_area VALUES ('2355', '宁化县', '206', '0', '3');
INSERT INTO shop_area VALUES ('2356', '将乐县', '206', '0', '3');
INSERT INTO shop_area VALUES ('2357', '尤溪县', '206', '0', '3');
INSERT INTO shop_area VALUES ('2358', '建宁县', '206', '0', '3');
INSERT INTO shop_area VALUES ('2359', '明溪县', '206', '0', '3');
INSERT INTO shop_area VALUES ('2360', '梅列区', '206', '0', '3');
INSERT INTO shop_area VALUES ('2361', '永安市', '206', '0', '3');
INSERT INTO shop_area VALUES ('2362', '沙县', '206', '0', '3');
INSERT INTO shop_area VALUES ('2363', '泰宁县', '206', '0', '3');
INSERT INTO shop_area VALUES ('2364', '清流县', '206', '0', '3');
INSERT INTO shop_area VALUES ('2365', '丰泽区', '207', '0', '3');
INSERT INTO shop_area VALUES ('2366', '南安市', '207', '0', '3');
INSERT INTO shop_area VALUES ('2367', '安溪县', '207', '0', '3');
INSERT INTO shop_area VALUES ('2368', '德化县', '207', '0', '3');
INSERT INTO shop_area VALUES ('2369', '惠安县', '207', '0', '3');
INSERT INTO shop_area VALUES ('2370', '晋江市', '207', '0', '3');
INSERT INTO shop_area VALUES ('2371', '永春县', '207', '0', '3');
INSERT INTO shop_area VALUES ('2372', '泉港区', '207', '0', '3');
INSERT INTO shop_area VALUES ('2373', '洛江区', '207', '0', '3');
INSERT INTO shop_area VALUES ('2374', '石狮市', '207', '0', '3');
INSERT INTO shop_area VALUES ('2375', '金门县', '207', '0', '3');
INSERT INTO shop_area VALUES ('2376', '鲤城区', '207', '0', '3');
INSERT INTO shop_area VALUES ('2377', '东山县', '208', '0', '3');
INSERT INTO shop_area VALUES ('2378', '云霄县', '208', '0', '3');
INSERT INTO shop_area VALUES ('2379', '华安县', '208', '0', '3');
INSERT INTO shop_area VALUES ('2380', '南靖县', '208', '0', '3');
INSERT INTO shop_area VALUES ('2381', '平和县', '208', '0', '3');
INSERT INTO shop_area VALUES ('2382', '漳浦县', '208', '0', '3');
INSERT INTO shop_area VALUES ('2383', '芗城区', '208', '0', '3');
INSERT INTO shop_area VALUES ('2384', '诏安县', '208', '0', '3');
INSERT INTO shop_area VALUES ('2385', '长泰县', '208', '0', '3');
INSERT INTO shop_area VALUES ('2386', '龙文区', '208', '0', '3');
INSERT INTO shop_area VALUES ('2387', '龙海市', '208', '0', '3');
INSERT INTO shop_area VALUES ('2388', '光泽县', '209', '0', '3');
INSERT INTO shop_area VALUES ('2389', '延平区', '209', '0', '3');
INSERT INTO shop_area VALUES ('2390', '建瓯市', '209', '0', '3');
INSERT INTO shop_area VALUES ('2391', '建阳市', '209', '0', '3');
INSERT INTO shop_area VALUES ('2392', '政和县', '209', '0', '3');
INSERT INTO shop_area VALUES ('2393', '松溪县', '209', '0', '3');
INSERT INTO shop_area VALUES ('2394', '武夷山市', '209', '0', '3');
INSERT INTO shop_area VALUES ('2395', '浦城县', '209', '0', '3');
INSERT INTO shop_area VALUES ('2396', '邵武市', '209', '0', '3');
INSERT INTO shop_area VALUES ('2397', '顺昌县', '209', '0', '3');
INSERT INTO shop_area VALUES ('2398', '上杭县', '210', '0', '3');
INSERT INTO shop_area VALUES ('2399', '新罗区', '210', '0', '3');
INSERT INTO shop_area VALUES ('2400', '武平县', '210', '0', '3');
INSERT INTO shop_area VALUES ('2401', '永定县', '210', '0', '3');
INSERT INTO shop_area VALUES ('2402', '漳平市', '210', '0', '3');
INSERT INTO shop_area VALUES ('2403', '连城县', '210', '0', '3');
INSERT INTO shop_area VALUES ('2404', '长汀县', '210', '0', '3');
INSERT INTO shop_area VALUES ('2405', '古田县', '211', '0', '3');
INSERT INTO shop_area VALUES ('2406', '周宁县', '211', '0', '3');
INSERT INTO shop_area VALUES ('2407', '寿宁县', '211', '0', '3');
INSERT INTO shop_area VALUES ('2408', '屏南县', '211', '0', '3');
INSERT INTO shop_area VALUES ('2409', '柘荣县', '211', '0', '3');
INSERT INTO shop_area VALUES ('2410', '福安市', '211', '0', '3');
INSERT INTO shop_area VALUES ('2411', '福鼎市', '211', '0', '3');
INSERT INTO shop_area VALUES ('2412', '蕉城区', '211', '0', '3');
INSERT INTO shop_area VALUES ('2413', '霞浦县', '211', '0', '3');
INSERT INTO shop_area VALUES ('2414', '东湖区', '212', '0', '3');
INSERT INTO shop_area VALUES ('2415', '南昌县', '212', '0', '3');
INSERT INTO shop_area VALUES ('2416', '安义县', '212', '0', '3');
INSERT INTO shop_area VALUES ('2417', '新建县', '212', '0', '3');
INSERT INTO shop_area VALUES ('2418', '湾里区', '212', '0', '3');
INSERT INTO shop_area VALUES ('2419', '西湖区', '212', '0', '3');
INSERT INTO shop_area VALUES ('2420', '进贤县', '212', '0', '3');
INSERT INTO shop_area VALUES ('2421', '青云谱区', '212', '0', '3');
INSERT INTO shop_area VALUES ('2422', '青山湖区', '212', '0', '3');
INSERT INTO shop_area VALUES ('2423', '乐平市', '213', '0', '3');
INSERT INTO shop_area VALUES ('2424', '昌江区', '213', '0', '3');
INSERT INTO shop_area VALUES ('2425', '浮梁县', '213', '0', '3');
INSERT INTO shop_area VALUES ('2426', '珠山区', '213', '0', '3');
INSERT INTO shop_area VALUES ('2427', '上栗县', '214', '0', '3');
INSERT INTO shop_area VALUES ('2428', '安源区', '214', '0', '3');
INSERT INTO shop_area VALUES ('2429', '湘东区', '214', '0', '3');
INSERT INTO shop_area VALUES ('2430', '芦溪县', '214', '0', '3');
INSERT INTO shop_area VALUES ('2431', '莲花县', '214', '0', '3');
INSERT INTO shop_area VALUES ('2432', '九江县', '215', '0', '3');
INSERT INTO shop_area VALUES ('2433', '修水县', '215', '0', '3');
INSERT INTO shop_area VALUES ('2434', '庐山区', '215', '0', '3');
INSERT INTO shop_area VALUES ('2435', '彭泽县', '215', '0', '3');
INSERT INTO shop_area VALUES ('2436', '德安县', '215', '0', '3');
INSERT INTO shop_area VALUES ('2437', '星子县', '215', '0', '3');
INSERT INTO shop_area VALUES ('2438', '武宁县', '215', '0', '3');
INSERT INTO shop_area VALUES ('2439', '永修县', '215', '0', '3');
INSERT INTO shop_area VALUES ('2440', '浔阳区', '215', '0', '3');
INSERT INTO shop_area VALUES ('2441', '湖口县', '215', '0', '3');
INSERT INTO shop_area VALUES ('2442', '瑞昌市', '215', '0', '3');
INSERT INTO shop_area VALUES ('2443', '都昌县', '215', '0', '3');
INSERT INTO shop_area VALUES ('2444', '分宜县', '216', '0', '3');
INSERT INTO shop_area VALUES ('2445', '渝水区', '216', '0', '3');
INSERT INTO shop_area VALUES ('2446', '余江县', '217', '0', '3');
INSERT INTO shop_area VALUES ('2447', '月湖区', '217', '0', '3');
INSERT INTO shop_area VALUES ('2448', '贵溪市', '217', '0', '3');
INSERT INTO shop_area VALUES ('2449', '上犹县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2450', '于都县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2451', '会昌县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2452', '信丰县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2453', '全南县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2454', '兴国县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2455', '南康市', '218', '0', '3');
INSERT INTO shop_area VALUES ('2456', '大余县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2457', '宁都县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2458', '安远县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2459', '定南县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2460', '寻乌县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2461', '崇义县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2462', '瑞金市', '218', '0', '3');
INSERT INTO shop_area VALUES ('2463', '石城县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2464', '章贡区', '218', '0', '3');
INSERT INTO shop_area VALUES ('2465', '赣县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2466', '龙南县', '218', '0', '3');
INSERT INTO shop_area VALUES ('2467', '万安县', '219', '0', '3');
INSERT INTO shop_area VALUES ('2468', '井冈山市', '219', '0', '3');
INSERT INTO shop_area VALUES ('2469', '吉安县', '219', '0', '3');
INSERT INTO shop_area VALUES ('2470', '吉州区', '219', '0', '3');
INSERT INTO shop_area VALUES ('2471', '吉水县', '219', '0', '3');
INSERT INTO shop_area VALUES ('2472', '安福县', '219', '0', '3');
INSERT INTO shop_area VALUES ('2473', '峡江县', '219', '0', '3');
INSERT INTO shop_area VALUES ('2474', '新干县', '219', '0', '3');
INSERT INTO shop_area VALUES ('2475', '永丰县', '219', '0', '3');
INSERT INTO shop_area VALUES ('2476', '永新县', '219', '0', '3');
INSERT INTO shop_area VALUES ('2477', '泰和县', '219', '0', '3');
INSERT INTO shop_area VALUES ('2478', '遂川县', '219', '0', '3');
INSERT INTO shop_area VALUES ('2479', '青原区', '219', '0', '3');
INSERT INTO shop_area VALUES ('2480', '万载县', '220', '0', '3');
INSERT INTO shop_area VALUES ('2481', '上高县', '220', '0', '3');
INSERT INTO shop_area VALUES ('2482', '丰城市', '220', '0', '3');
INSERT INTO shop_area VALUES ('2483', '奉新县', '220', '0', '3');
INSERT INTO shop_area VALUES ('2484', '宜丰县', '220', '0', '3');
INSERT INTO shop_area VALUES ('2485', '樟树市', '220', '0', '3');
INSERT INTO shop_area VALUES ('2486', '袁州区', '220', '0', '3');
INSERT INTO shop_area VALUES ('2487', '铜鼓县', '220', '0', '3');
INSERT INTO shop_area VALUES ('2488', '靖安县', '220', '0', '3');
INSERT INTO shop_area VALUES ('2489', '高安市', '220', '0', '3');
INSERT INTO shop_area VALUES ('2490', '东乡县', '221', '0', '3');
INSERT INTO shop_area VALUES ('2491', '临川区', '221', '0', '3');
INSERT INTO shop_area VALUES ('2492', '乐安县', '221', '0', '3');
INSERT INTO shop_area VALUES ('2493', '南丰县', '221', '0', '3');
INSERT INTO shop_area VALUES ('2494', '南城县', '221', '0', '3');
INSERT INTO shop_area VALUES ('2495', '宜黄县', '221', '0', '3');
INSERT INTO shop_area VALUES ('2496', '崇仁县', '221', '0', '3');
INSERT INTO shop_area VALUES ('2497', '广昌县', '221', '0', '3');
INSERT INTO shop_area VALUES ('2498', '资溪县', '221', '0', '3');
INSERT INTO shop_area VALUES ('2499', '金溪县', '221', '0', '3');
INSERT INTO shop_area VALUES ('2500', '黎川县', '221', '0', '3');
INSERT INTO shop_area VALUES ('2501', '万年县', '222', '0', '3');
INSERT INTO shop_area VALUES ('2502', '上饶县', '222', '0', '3');
INSERT INTO shop_area VALUES ('2503', '余干县', '222', '0', '3');
INSERT INTO shop_area VALUES ('2504', '信州区', '222', '0', '3');
INSERT INTO shop_area VALUES ('2505', '婺源县', '222', '0', '3');
INSERT INTO shop_area VALUES ('2506', '广丰县', '222', '0', '3');
INSERT INTO shop_area VALUES ('2507', '弋阳县', '222', '0', '3');
INSERT INTO shop_area VALUES ('2508', '德兴市', '222', '0', '3');
INSERT INTO shop_area VALUES ('2509', '横峰县', '222', '0', '3');
INSERT INTO shop_area VALUES ('2510', '玉山县', '222', '0', '3');
INSERT INTO shop_area VALUES ('2511', '鄱阳县', '222', '0', '3');
INSERT INTO shop_area VALUES ('2512', '铅山县', '222', '0', '3');
INSERT INTO shop_area VALUES ('2513', '历下区', '223', '0', '3');
INSERT INTO shop_area VALUES ('2514', '历城区', '223', '0', '3');
INSERT INTO shop_area VALUES ('2515', '商河县', '223', '0', '3');
INSERT INTO shop_area VALUES ('2516', '天桥区', '223', '0', '3');
INSERT INTO shop_area VALUES ('2517', '市中区', '223', '0', '3');
INSERT INTO shop_area VALUES ('2518', '平阴县', '223', '0', '3');
INSERT INTO shop_area VALUES ('2519', '槐荫区', '223', '0', '3');
INSERT INTO shop_area VALUES ('2520', '济阳县', '223', '0', '3');
INSERT INTO shop_area VALUES ('2521', '章丘市', '223', '0', '3');
INSERT INTO shop_area VALUES ('2522', '长清区', '223', '0', '3');
INSERT INTO shop_area VALUES ('2523', '即墨市', '224', '0', '3');
INSERT INTO shop_area VALUES ('2524', '四方区', '224', '0', '3');
INSERT INTO shop_area VALUES ('2525', '城阳区', '224', '0', '3');
INSERT INTO shop_area VALUES ('2526', '崂山区', '224', '0', '3');
INSERT INTO shop_area VALUES ('2527', '市北区', '224', '0', '3');
INSERT INTO shop_area VALUES ('2528', '市南区', '224', '0', '3');
INSERT INTO shop_area VALUES ('2529', '平度市', '224', '0', '3');
INSERT INTO shop_area VALUES ('2530', '李沧区', '224', '0', '3');
INSERT INTO shop_area VALUES ('2531', '胶南市', '224', '0', '3');
INSERT INTO shop_area VALUES ('2532', '胶州市', '224', '0', '3');
INSERT INTO shop_area VALUES ('2533', '莱西市', '224', '0', '3');
INSERT INTO shop_area VALUES ('2534', '黄岛区', '224', '0', '3');
INSERT INTO shop_area VALUES ('2535', '临淄区', '225', '0', '3');
INSERT INTO shop_area VALUES ('2536', '博山区', '225', '0', '3');
INSERT INTO shop_area VALUES ('2537', '周村区', '225', '0', '3');
INSERT INTO shop_area VALUES ('2538', '张店区', '225', '0', '3');
INSERT INTO shop_area VALUES ('2539', '桓台县', '225', '0', '3');
INSERT INTO shop_area VALUES ('2540', '沂源县', '225', '0', '3');
INSERT INTO shop_area VALUES ('2541', '淄川区', '225', '0', '3');
INSERT INTO shop_area VALUES ('2542', '高青县', '225', '0', '3');
INSERT INTO shop_area VALUES ('2543', '台儿庄区', '226', '0', '3');
INSERT INTO shop_area VALUES ('2544', '山亭区', '226', '0', '3');
INSERT INTO shop_area VALUES ('2545', '峄城区', '226', '0', '3');
INSERT INTO shop_area VALUES ('2546', '市中区', '226', '0', '3');
INSERT INTO shop_area VALUES ('2547', '滕州市', '226', '0', '3');
INSERT INTO shop_area VALUES ('2548', '薛城区', '226', '0', '3');
INSERT INTO shop_area VALUES ('2549', '东营区', '227', '0', '3');
INSERT INTO shop_area VALUES ('2550', '利津县', '227', '0', '3');
INSERT INTO shop_area VALUES ('2551', '垦利县', '227', '0', '3');
INSERT INTO shop_area VALUES ('2552', '广饶县', '227', '0', '3');
INSERT INTO shop_area VALUES ('2553', '河口区', '227', '0', '3');
INSERT INTO shop_area VALUES ('2554', '招远市', '228', '0', '3');
INSERT INTO shop_area VALUES ('2555', '栖霞市', '228', '0', '3');
INSERT INTO shop_area VALUES ('2556', '海阳市', '228', '0', '3');
INSERT INTO shop_area VALUES ('2557', '牟平区', '228', '0', '3');
INSERT INTO shop_area VALUES ('2558', '福山区', '228', '0', '3');
INSERT INTO shop_area VALUES ('2559', '芝罘区', '228', '0', '3');
INSERT INTO shop_area VALUES ('2560', '莱山区', '228', '0', '3');
INSERT INTO shop_area VALUES ('2561', '莱州市', '228', '0', '3');
INSERT INTO shop_area VALUES ('2562', '莱阳市', '228', '0', '3');
INSERT INTO shop_area VALUES ('2563', '蓬莱市', '228', '0', '3');
INSERT INTO shop_area VALUES ('2564', '长岛县', '228', '0', '3');
INSERT INTO shop_area VALUES ('2565', '龙口市', '228', '0', '3');
INSERT INTO shop_area VALUES ('2566', '临朐县', '229', '0', '3');
INSERT INTO shop_area VALUES ('2567', '坊子区', '229', '0', '3');
INSERT INTO shop_area VALUES ('2568', '奎文区', '229', '0', '3');
INSERT INTO shop_area VALUES ('2569', '安丘市', '229', '0', '3');
INSERT INTO shop_area VALUES ('2570', '寒亭区', '229', '0', '3');
INSERT INTO shop_area VALUES ('2571', '寿光市', '229', '0', '3');
INSERT INTO shop_area VALUES ('2572', '昌乐县', '229', '0', '3');
INSERT INTO shop_area VALUES ('2573', '昌邑市', '229', '0', '3');
INSERT INTO shop_area VALUES ('2574', '潍城区', '229', '0', '3');
INSERT INTO shop_area VALUES ('2575', '诸城市', '229', '0', '3');
INSERT INTO shop_area VALUES ('2576', '青州市', '229', '0', '3');
INSERT INTO shop_area VALUES ('2577', '高密市', '229', '0', '3');
INSERT INTO shop_area VALUES ('2578', '任城区', '230', '0', '3');
INSERT INTO shop_area VALUES ('2579', '兖州市', '230', '0', '3');
INSERT INTO shop_area VALUES ('2580', '嘉祥县', '230', '0', '3');
INSERT INTO shop_area VALUES ('2581', '市中区', '230', '0', '3');
INSERT INTO shop_area VALUES ('2582', '微山县', '230', '0', '3');
INSERT INTO shop_area VALUES ('2583', '曲阜市', '230', '0', '3');
INSERT INTO shop_area VALUES ('2584', '梁山县', '230', '0', '3');
INSERT INTO shop_area VALUES ('2585', '汶上县', '230', '0', '3');
INSERT INTO shop_area VALUES ('2586', '泗水县', '230', '0', '3');
INSERT INTO shop_area VALUES ('2587', '邹城市', '230', '0', '3');
INSERT INTO shop_area VALUES ('2588', '金乡县', '230', '0', '3');
INSERT INTO shop_area VALUES ('2589', '鱼台县', '230', '0', '3');
INSERT INTO shop_area VALUES ('2590', '东平县', '231', '0', '3');
INSERT INTO shop_area VALUES ('2591', '宁阳县', '231', '0', '3');
INSERT INTO shop_area VALUES ('2592', '岱岳区', '231', '0', '3');
INSERT INTO shop_area VALUES ('2593', '新泰市', '231', '0', '3');
INSERT INTO shop_area VALUES ('2594', '泰山区', '231', '0', '3');
INSERT INTO shop_area VALUES ('2595', '肥城市', '231', '0', '3');
INSERT INTO shop_area VALUES ('2596', '乳山市', '232', '0', '3');
INSERT INTO shop_area VALUES ('2597', '文登市', '232', '0', '3');
INSERT INTO shop_area VALUES ('2598', '环翠区', '232', '0', '3');
INSERT INTO shop_area VALUES ('2599', '荣成市', '232', '0', '3');
INSERT INTO shop_area VALUES ('2600', '东港区', '233', '0', '3');
INSERT INTO shop_area VALUES ('2601', '五莲县', '233', '0', '3');
INSERT INTO shop_area VALUES ('2602', '岚山区', '233', '0', '3');
INSERT INTO shop_area VALUES ('2603', '莒县', '233', '0', '3');
INSERT INTO shop_area VALUES ('2604', '莱城区', '234', '0', '3');
INSERT INTO shop_area VALUES ('2605', '钢城区', '234', '0', '3');
INSERT INTO shop_area VALUES ('2606', '临沭县', '235', '0', '3');
INSERT INTO shop_area VALUES ('2607', '兰山区', '235', '0', '3');
INSERT INTO shop_area VALUES ('2608', '平邑县', '235', '0', '3');
INSERT INTO shop_area VALUES ('2609', '沂南县', '235', '0', '3');
INSERT INTO shop_area VALUES ('2610', '沂水县', '235', '0', '3');
INSERT INTO shop_area VALUES ('2611', '河东区', '235', '0', '3');
INSERT INTO shop_area VALUES ('2612', '罗庄区', '235', '0', '3');
INSERT INTO shop_area VALUES ('2613', '苍山县', '235', '0', '3');
INSERT INTO shop_area VALUES ('2614', '莒南县', '235', '0', '3');
INSERT INTO shop_area VALUES ('2615', '蒙阴县', '235', '0', '3');
INSERT INTO shop_area VALUES ('2616', '费县', '235', '0', '3');
INSERT INTO shop_area VALUES ('2617', '郯城县', '235', '0', '3');
INSERT INTO shop_area VALUES ('2618', '临邑县', '236', '0', '3');
INSERT INTO shop_area VALUES ('2619', '乐陵市', '236', '0', '3');
INSERT INTO shop_area VALUES ('2620', '夏津县', '236', '0', '3');
INSERT INTO shop_area VALUES ('2621', '宁津县', '236', '0', '3');
INSERT INTO shop_area VALUES ('2622', '平原县', '236', '0', '3');
INSERT INTO shop_area VALUES ('2623', '庆云县', '236', '0', '3');
INSERT INTO shop_area VALUES ('2624', '德城区', '236', '0', '3');
INSERT INTO shop_area VALUES ('2625', '武城县', '236', '0', '3');
INSERT INTO shop_area VALUES ('2626', '禹城市', '236', '0', '3');
INSERT INTO shop_area VALUES ('2627', '陵县', '236', '0', '3');
INSERT INTO shop_area VALUES ('2628', '齐河县', '236', '0', '3');
INSERT INTO shop_area VALUES ('2629', '东昌府区', '237', '0', '3');
INSERT INTO shop_area VALUES ('2630', '东阿县', '237', '0', '3');
INSERT INTO shop_area VALUES ('2631', '临清市', '237', '0', '3');
INSERT INTO shop_area VALUES ('2632', '冠县', '237', '0', '3');
INSERT INTO shop_area VALUES ('2633', '茌平县', '237', '0', '3');
INSERT INTO shop_area VALUES ('2634', '莘县', '237', '0', '3');
INSERT INTO shop_area VALUES ('2635', '阳谷县', '237', '0', '3');
INSERT INTO shop_area VALUES ('2636', '高唐县', '237', '0', '3');
INSERT INTO shop_area VALUES ('2637', '博兴县', '238', '0', '3');
INSERT INTO shop_area VALUES ('2638', '惠民县', '238', '0', '3');
INSERT INTO shop_area VALUES ('2639', '无棣县', '238', '0', '3');
INSERT INTO shop_area VALUES ('2640', '沾化县', '238', '0', '3');
INSERT INTO shop_area VALUES ('2641', '滨城区', '238', '0', '3');
INSERT INTO shop_area VALUES ('2642', '邹平县', '238', '0', '3');
INSERT INTO shop_area VALUES ('2643', '阳信县', '238', '0', '3');
INSERT INTO shop_area VALUES ('2644', '东明县', '239', '0', '3');
INSERT INTO shop_area VALUES ('2645', '单县', '239', '0', '3');
INSERT INTO shop_area VALUES ('2646', '定陶县', '239', '0', '3');
INSERT INTO shop_area VALUES ('2647', '巨野县', '239', '0', '3');
INSERT INTO shop_area VALUES ('2648', '成武县', '239', '0', '3');
INSERT INTO shop_area VALUES ('2649', '曹县', '239', '0', '3');
INSERT INTO shop_area VALUES ('2650', '牡丹区', '239', '0', '3');
INSERT INTO shop_area VALUES ('2651', '郓城县', '239', '0', '3');
INSERT INTO shop_area VALUES ('2652', '鄄城县', '239', '0', '3');
INSERT INTO shop_area VALUES ('2653', '上街区', '240', '0', '3');
INSERT INTO shop_area VALUES ('2654', '中原区', '240', '0', '3');
INSERT INTO shop_area VALUES ('2655', '中牟县', '240', '0', '3');
INSERT INTO shop_area VALUES ('2656', '二七区', '240', '0', '3');
INSERT INTO shop_area VALUES ('2657', '巩义市', '240', '0', '3');
INSERT INTO shop_area VALUES ('2658', '惠济区', '240', '0', '3');
INSERT INTO shop_area VALUES ('2659', '新密市', '240', '0', '3');
INSERT INTO shop_area VALUES ('2660', '新郑市', '240', '0', '3');
INSERT INTO shop_area VALUES ('2661', '登封市', '240', '0', '3');
INSERT INTO shop_area VALUES ('2662', '管城回族区', '240', '0', '3');
INSERT INTO shop_area VALUES ('2663', '荥阳市', '240', '0', '3');
INSERT INTO shop_area VALUES ('2664', '金水区', '240', '0', '3');
INSERT INTO shop_area VALUES ('2665', '兰考县', '241', '0', '3');
INSERT INTO shop_area VALUES ('2666', '尉氏县', '241', '0', '3');
INSERT INTO shop_area VALUES ('2667', '开封县', '241', '0', '3');
INSERT INTO shop_area VALUES ('2668', '杞县', '241', '0', '3');
INSERT INTO shop_area VALUES ('2669', '禹王台区', '241', '0', '3');
INSERT INTO shop_area VALUES ('2670', '通许县', '241', '0', '3');
INSERT INTO shop_area VALUES ('2671', '金明区', '241', '0', '3');
INSERT INTO shop_area VALUES ('2672', '顺河回族区', '241', '0', '3');
INSERT INTO shop_area VALUES ('2673', '鼓楼区', '241', '0', '3');
INSERT INTO shop_area VALUES ('2674', '龙亭区', '241', '0', '3');
INSERT INTO shop_area VALUES ('2675', '伊川县', '242', '0', '3');
INSERT INTO shop_area VALUES ('2676', '偃师市', '242', '0', '3');
INSERT INTO shop_area VALUES ('2677', '吉利区', '242', '0', '3');
INSERT INTO shop_area VALUES ('2678', '孟津县', '242', '0', '3');
INSERT INTO shop_area VALUES ('2679', '宜阳县', '242', '0', '3');
INSERT INTO shop_area VALUES ('2680', '嵩县', '242', '0', '3');
INSERT INTO shop_area VALUES ('2681', '新安县', '242', '0', '3');
INSERT INTO shop_area VALUES ('2682', '栾川县', '242', '0', '3');
INSERT INTO shop_area VALUES ('2683', '汝阳县', '242', '0', '3');
INSERT INTO shop_area VALUES ('2684', '洛宁县', '242', '0', '3');
INSERT INTO shop_area VALUES ('2685', '洛龙区', '242', '0', '3');
INSERT INTO shop_area VALUES ('2686', '涧西区', '242', '0', '3');
INSERT INTO shop_area VALUES ('2687', '瀍河回族区', '242', '0', '3');
INSERT INTO shop_area VALUES ('2688', '老城区', '242', '0', '3');
INSERT INTO shop_area VALUES ('2689', '西工区', '242', '0', '3');
INSERT INTO shop_area VALUES ('2690', '卫东区', '243', '0', '3');
INSERT INTO shop_area VALUES ('2691', '叶县', '243', '0', '3');
INSERT INTO shop_area VALUES ('2692', '宝丰县', '243', '0', '3');
INSERT INTO shop_area VALUES ('2693', '新华区', '243', '0', '3');
INSERT INTO shop_area VALUES ('2694', '汝州市', '243', '0', '3');
INSERT INTO shop_area VALUES ('2695', '湛河区', '243', '0', '3');
INSERT INTO shop_area VALUES ('2696', '石龙区', '243', '0', '3');
INSERT INTO shop_area VALUES ('2697', '舞钢市', '243', '0', '3');
INSERT INTO shop_area VALUES ('2698', '郏县', '243', '0', '3');
INSERT INTO shop_area VALUES ('2699', '鲁山县', '243', '0', '3');
INSERT INTO shop_area VALUES ('2700', '内黄县', '244', '0', '3');
INSERT INTO shop_area VALUES ('2701', '北关区', '244', '0', '3');
INSERT INTO shop_area VALUES ('2702', '安阳县', '244', '0', '3');
INSERT INTO shop_area VALUES ('2703', '文峰区', '244', '0', '3');
INSERT INTO shop_area VALUES ('2704', '林州市', '244', '0', '3');
INSERT INTO shop_area VALUES ('2705', '殷都区', '244', '0', '3');
INSERT INTO shop_area VALUES ('2706', '汤阴县', '244', '0', '3');
INSERT INTO shop_area VALUES ('2707', '滑县', '244', '0', '3');
INSERT INTO shop_area VALUES ('2708', '龙安区', '244', '0', '3');
INSERT INTO shop_area VALUES ('2709', '山城区', '245', '0', '3');
INSERT INTO shop_area VALUES ('2710', '浚县', '245', '0', '3');
INSERT INTO shop_area VALUES ('2711', '淇县', '245', '0', '3');
INSERT INTO shop_area VALUES ('2712', '淇滨区', '245', '0', '3');
INSERT INTO shop_area VALUES ('2713', '鹤山区', '245', '0', '3');
INSERT INTO shop_area VALUES ('2714', '凤泉区', '246', '0', '3');
INSERT INTO shop_area VALUES ('2715', '卫滨区', '246', '0', '3');
INSERT INTO shop_area VALUES ('2716', '卫辉市', '246', '0', '3');
INSERT INTO shop_area VALUES ('2717', '原阳县', '246', '0', '3');
INSERT INTO shop_area VALUES ('2718', '封丘县', '246', '0', '3');
INSERT INTO shop_area VALUES ('2719', '延津县', '246', '0', '3');
INSERT INTO shop_area VALUES ('2720', '新乡县', '246', '0', '3');
INSERT INTO shop_area VALUES ('2721', '牧野区', '246', '0', '3');
INSERT INTO shop_area VALUES ('2722', '红旗区', '246', '0', '3');
INSERT INTO shop_area VALUES ('2723', '获嘉县', '246', '0', '3');
INSERT INTO shop_area VALUES ('2724', '辉县市', '246', '0', '3');
INSERT INTO shop_area VALUES ('2725', '长垣县', '246', '0', '3');
INSERT INTO shop_area VALUES ('2726', '中站区', '247', '0', '3');
INSERT INTO shop_area VALUES ('2727', '修武县', '247', '0', '3');
INSERT INTO shop_area VALUES ('2728', '博爱县', '247', '0', '3');
INSERT INTO shop_area VALUES ('2729', '孟州市', '247', '0', '3');
INSERT INTO shop_area VALUES ('2730', '山阳区', '247', '0', '3');
INSERT INTO shop_area VALUES ('2731', '武陟县', '247', '0', '3');
INSERT INTO shop_area VALUES ('2732', '沁阳市', '247', '0', '3');
INSERT INTO shop_area VALUES ('2733', '温县', '247', '0', '3');
INSERT INTO shop_area VALUES ('2734', '解放区', '247', '0', '3');
INSERT INTO shop_area VALUES ('2735', '马村区', '247', '0', '3');
INSERT INTO shop_area VALUES ('2736', '华龙区', '248', '0', '3');
INSERT INTO shop_area VALUES ('2737', '南乐县', '248', '0', '3');
INSERT INTO shop_area VALUES ('2738', '台前县', '248', '0', '3');
INSERT INTO shop_area VALUES ('2739', '清丰县', '248', '0', '3');
INSERT INTO shop_area VALUES ('2740', '濮阳县', '248', '0', '3');
INSERT INTO shop_area VALUES ('2741', '范县', '248', '0', '3');
INSERT INTO shop_area VALUES ('2742', '禹州市', '249', '0', '3');
INSERT INTO shop_area VALUES ('2743', '襄城县', '249', '0', '3');
INSERT INTO shop_area VALUES ('2744', '许昌县', '249', '0', '3');
INSERT INTO shop_area VALUES ('2745', '鄢陵县', '249', '0', '3');
INSERT INTO shop_area VALUES ('2746', '长葛市', '249', '0', '3');
INSERT INTO shop_area VALUES ('2747', '魏都区', '249', '0', '3');
INSERT INTO shop_area VALUES ('2748', '临颍县', '250', '0', '3');
INSERT INTO shop_area VALUES ('2749', '召陵区', '250', '0', '3');
INSERT INTO shop_area VALUES ('2750', '源汇区', '250', '0', '3');
INSERT INTO shop_area VALUES ('2751', '舞阳县', '250', '0', '3');
INSERT INTO shop_area VALUES ('2752', '郾城区', '250', '0', '3');
INSERT INTO shop_area VALUES ('2753', '义马市', '251', '0', '3');
INSERT INTO shop_area VALUES ('2754', '卢氏县', '251', '0', '3');
INSERT INTO shop_area VALUES ('2755', '渑池县', '251', '0', '3');
INSERT INTO shop_area VALUES ('2756', '湖滨区', '251', '0', '3');
INSERT INTO shop_area VALUES ('2757', '灵宝市', '251', '0', '3');
INSERT INTO shop_area VALUES ('2758', '陕县', '251', '0', '3');
INSERT INTO shop_area VALUES ('2759', '内乡县', '252', '0', '3');
INSERT INTO shop_area VALUES ('2760', '南召县', '252', '0', '3');
INSERT INTO shop_area VALUES ('2761', '卧龙区', '252', '0', '3');
INSERT INTO shop_area VALUES ('2762', '唐河县', '252', '0', '3');
INSERT INTO shop_area VALUES ('2763', '宛城区', '252', '0', '3');
INSERT INTO shop_area VALUES ('2764', '新野县', '252', '0', '3');
INSERT INTO shop_area VALUES ('2765', '方城县', '252', '0', '3');
INSERT INTO shop_area VALUES ('2766', '桐柏县', '252', '0', '3');
INSERT INTO shop_area VALUES ('2767', '淅川县', '252', '0', '3');
INSERT INTO shop_area VALUES ('2768', '社旗县', '252', '0', '3');
INSERT INTO shop_area VALUES ('2769', '西峡县', '252', '0', '3');
INSERT INTO shop_area VALUES ('2770', '邓州市', '252', '0', '3');
INSERT INTO shop_area VALUES ('2771', '镇平县', '252', '0', '3');
INSERT INTO shop_area VALUES ('2772', '夏邑县', '253', '0', '3');
INSERT INTO shop_area VALUES ('2773', '宁陵县', '253', '0', '3');
INSERT INTO shop_area VALUES ('2774', '柘城县', '253', '0', '3');
INSERT INTO shop_area VALUES ('2775', '民权县', '253', '0', '3');
INSERT INTO shop_area VALUES ('2776', '永城市', '253', '0', '3');
INSERT INTO shop_area VALUES ('2777', '睢县', '253', '0', '3');
INSERT INTO shop_area VALUES ('2778', '睢阳区', '253', '0', '3');
INSERT INTO shop_area VALUES ('2779', '粱园区', '253', '0', '3');
INSERT INTO shop_area VALUES ('2780', '虞城县', '253', '0', '3');
INSERT INTO shop_area VALUES ('2781', '光山县', '254', '0', '3');
INSERT INTO shop_area VALUES ('2782', '商城县', '254', '0', '3');
INSERT INTO shop_area VALUES ('2783', '固始县', '254', '0', '3');
INSERT INTO shop_area VALUES ('2784', '平桥区', '254', '0', '3');
INSERT INTO shop_area VALUES ('2785', '息县', '254', '0', '3');
INSERT INTO shop_area VALUES ('2786', '新县', '254', '0', '3');
INSERT INTO shop_area VALUES ('2787', '浉河区', '254', '0', '3');
INSERT INTO shop_area VALUES ('2788', '淮滨县', '254', '0', '3');
INSERT INTO shop_area VALUES ('2789', '潢川县', '254', '0', '3');
INSERT INTO shop_area VALUES ('2790', '罗山县', '254', '0', '3');
INSERT INTO shop_area VALUES ('2791', '商水县', '255', '0', '3');
INSERT INTO shop_area VALUES ('2792', '太康县', '255', '0', '3');
INSERT INTO shop_area VALUES ('2793', '川汇区', '255', '0', '3');
INSERT INTO shop_area VALUES ('2794', '扶沟县', '255', '0', '3');
INSERT INTO shop_area VALUES ('2795', '沈丘县', '255', '0', '3');
INSERT INTO shop_area VALUES ('2796', '淮阳县', '255', '0', '3');
INSERT INTO shop_area VALUES ('2797', '西华县', '255', '0', '3');
INSERT INTO shop_area VALUES ('2798', '郸城县', '255', '0', '3');
INSERT INTO shop_area VALUES ('2799', '项城市', '255', '0', '3');
INSERT INTO shop_area VALUES ('2800', '鹿邑县', '255', '0', '3');
INSERT INTO shop_area VALUES ('2801', '上蔡县', '256', '0', '3');
INSERT INTO shop_area VALUES ('2802', '平舆县', '256', '0', '3');
INSERT INTO shop_area VALUES ('2803', '新蔡县', '256', '0', '3');
INSERT INTO shop_area VALUES ('2804', '正阳县', '256', '0', '3');
INSERT INTO shop_area VALUES ('2805', '汝南县', '256', '0', '3');
INSERT INTO shop_area VALUES ('2806', '泌阳县', '256', '0', '3');
INSERT INTO shop_area VALUES ('2807', '确山县', '256', '0', '3');
INSERT INTO shop_area VALUES ('2808', '西平县', '256', '0', '3');
INSERT INTO shop_area VALUES ('2809', '遂平县', '256', '0', '3');
INSERT INTO shop_area VALUES ('2810', '驿城区', '256', '0', '3');
INSERT INTO shop_area VALUES ('2811', '济源市', '257', '0', '3');
INSERT INTO shop_area VALUES ('2812', '东西湖区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2813', '新洲区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2814', '武昌区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2815', '汉南区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2816', '汉阳区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2817', '江夏区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2818', '江岸区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2819', '江汉区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2820', '洪山区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2821', '硚口区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2822', '蔡甸区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2823', '青山区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2824', '黄陂区', '258', '0', '3');
INSERT INTO shop_area VALUES ('2825', '下陆区', '259', '0', '3');
INSERT INTO shop_area VALUES ('2826', '大冶市', '259', '0', '3');
INSERT INTO shop_area VALUES ('2827', '西塞山区', '259', '0', '3');
INSERT INTO shop_area VALUES ('2828', '铁山区', '259', '0', '3');
INSERT INTO shop_area VALUES ('2829', '阳新县', '259', '0', '3');
INSERT INTO shop_area VALUES ('2830', '黄石港区', '259', '0', '3');
INSERT INTO shop_area VALUES ('2831', '丹江口市', '260', '0', '3');
INSERT INTO shop_area VALUES ('2832', '张湾区', '260', '0', '3');
INSERT INTO shop_area VALUES ('2833', '房县', '260', '0', '3');
INSERT INTO shop_area VALUES ('2834', '竹山县', '260', '0', '3');
INSERT INTO shop_area VALUES ('2835', '竹溪县', '260', '0', '3');
INSERT INTO shop_area VALUES ('2836', '茅箭区', '260', '0', '3');
INSERT INTO shop_area VALUES ('2837', '郧县', '260', '0', '3');
INSERT INTO shop_area VALUES ('2838', '郧西县', '260', '0', '3');
INSERT INTO shop_area VALUES ('2839', '五峰土家族自治县', '261', '0', '3');
INSERT INTO shop_area VALUES ('2840', '伍家岗区', '261', '0', '3');
INSERT INTO shop_area VALUES ('2841', '兴山县', '261', '0', '3');
INSERT INTO shop_area VALUES ('2842', '夷陵区', '261', '0', '3');
INSERT INTO shop_area VALUES ('2843', '宜都市', '261', '0', '3');
INSERT INTO shop_area VALUES ('2844', '当阳市', '261', '0', '3');
INSERT INTO shop_area VALUES ('2845', '枝江市', '261', '0', '3');
INSERT INTO shop_area VALUES ('2846', '点军区', '261', '0', '3');
INSERT INTO shop_area VALUES ('2847', '秭归县', '261', '0', '3');
INSERT INTO shop_area VALUES ('2848', '虢亭区', '261', '0', '3');
INSERT INTO shop_area VALUES ('2849', '西陵区', '261', '0', '3');
INSERT INTO shop_area VALUES ('2850', '远安县', '261', '0', '3');
INSERT INTO shop_area VALUES ('2851', '长阳土家族自治县', '261', '0', '3');
INSERT INTO shop_area VALUES ('2852', '保康县', '262', '0', '3');
INSERT INTO shop_area VALUES ('2853', '南漳县', '262', '0', '3');
INSERT INTO shop_area VALUES ('2854', '宜城市', '262', '0', '3');
INSERT INTO shop_area VALUES ('2855', '枣阳市', '262', '0', '3');
INSERT INTO shop_area VALUES ('2856', '樊城区', '262', '0', '3');
INSERT INTO shop_area VALUES ('2857', '老河口市', '262', '0', '3');
INSERT INTO shop_area VALUES ('2858', '襄城区', '262', '0', '3');
INSERT INTO shop_area VALUES ('2859', '襄阳区', '262', '0', '3');
INSERT INTO shop_area VALUES ('2860', '谷城县', '262', '0', '3');
INSERT INTO shop_area VALUES ('2861', '华容区', '263', '0', '3');
INSERT INTO shop_area VALUES ('2862', '粱子湖', '263', '0', '3');
INSERT INTO shop_area VALUES ('2863', '鄂城区', '263', '0', '3');
INSERT INTO shop_area VALUES ('2864', '东宝区', '264', '0', '3');
INSERT INTO shop_area VALUES ('2865', '京山县', '264', '0', '3');
INSERT INTO shop_area VALUES ('2866', '掇刀区', '264', '0', '3');
INSERT INTO shop_area VALUES ('2867', '沙洋县', '264', '0', '3');
INSERT INTO shop_area VALUES ('2868', '钟祥市', '264', '0', '3');
INSERT INTO shop_area VALUES ('2869', '云梦县', '265', '0', '3');
INSERT INTO shop_area VALUES ('2870', '大悟县', '265', '0', '3');
INSERT INTO shop_area VALUES ('2871', '孝南区', '265', '0', '3');
INSERT INTO shop_area VALUES ('2872', '孝昌县', '265', '0', '3');
INSERT INTO shop_area VALUES ('2873', '安陆市', '265', '0', '3');
INSERT INTO shop_area VALUES ('2874', '应城市', '265', '0', '3');
INSERT INTO shop_area VALUES ('2875', '汉川市', '265', '0', '3');
INSERT INTO shop_area VALUES ('2876', '公安县', '266', '0', '3');
INSERT INTO shop_area VALUES ('2877', '松滋市', '266', '0', '3');
INSERT INTO shop_area VALUES ('2878', '江陵县', '266', '0', '3');
INSERT INTO shop_area VALUES ('2879', '沙市区', '266', '0', '3');
INSERT INTO shop_area VALUES ('2880', '洪湖市', '266', '0', '3');
INSERT INTO shop_area VALUES ('2881', '监利县', '266', '0', '3');
INSERT INTO shop_area VALUES ('2882', '石首市', '266', '0', '3');
INSERT INTO shop_area VALUES ('2883', '荆州区', '266', '0', '3');
INSERT INTO shop_area VALUES ('2884', '团风县', '267', '0', '3');
INSERT INTO shop_area VALUES ('2885', '武穴市', '267', '0', '3');
INSERT INTO shop_area VALUES ('2886', '浠水县', '267', '0', '3');
INSERT INTO shop_area VALUES ('2887', '红安县', '267', '0', '3');
INSERT INTO shop_area VALUES ('2888', '罗田县', '267', '0', '3');
INSERT INTO shop_area VALUES ('2889', '英山县', '267', '0', '3');
INSERT INTO shop_area VALUES ('2890', '蕲春县', '267', '0', '3');
INSERT INTO shop_area VALUES ('2891', '麻城市', '267', '0', '3');
INSERT INTO shop_area VALUES ('2892', '黄州区', '267', '0', '3');
INSERT INTO shop_area VALUES ('2893', '黄梅县', '267', '0', '3');
INSERT INTO shop_area VALUES ('2894', '咸安区', '268', '0', '3');
INSERT INTO shop_area VALUES ('2895', '嘉鱼县', '268', '0', '3');
INSERT INTO shop_area VALUES ('2896', '崇阳县', '268', '0', '3');
INSERT INTO shop_area VALUES ('2897', '赤壁市', '268', '0', '3');
INSERT INTO shop_area VALUES ('2898', '通城县', '268', '0', '3');
INSERT INTO shop_area VALUES ('2899', '通山县', '268', '0', '3');
INSERT INTO shop_area VALUES ('2900', '广水市', '269', '0', '3');
INSERT INTO shop_area VALUES ('2901', '曾都区', '269', '0', '3');
INSERT INTO shop_area VALUES ('2902', '利川市', '270', '0', '3');
INSERT INTO shop_area VALUES ('2903', '咸丰县', '270', '0', '3');
INSERT INTO shop_area VALUES ('2904', '宣恩县', '270', '0', '3');
INSERT INTO shop_area VALUES ('2905', '巴东县', '270', '0', '3');
INSERT INTO shop_area VALUES ('2906', '建始县', '270', '0', '3');
INSERT INTO shop_area VALUES ('2907', '恩施市', '270', '0', '3');
INSERT INTO shop_area VALUES ('2908', '来凤县', '270', '0', '3');
INSERT INTO shop_area VALUES ('2909', '鹤峰县', '270', '0', '3');
INSERT INTO shop_area VALUES ('2910', '仙桃市', '271', '0', '3');
INSERT INTO shop_area VALUES ('2911', '潜江市', '272', '0', '3');
INSERT INTO shop_area VALUES ('2912', '天门市', '273', '0', '3');
INSERT INTO shop_area VALUES ('2913', '神农架林区', '274', '0', '3');
INSERT INTO shop_area VALUES ('2914', '天心区', '275', '0', '3');
INSERT INTO shop_area VALUES ('2915', '宁乡县', '275', '0', '3');
INSERT INTO shop_area VALUES ('2916', '岳麓区', '275', '0', '3');
INSERT INTO shop_area VALUES ('2917', '开福区', '275', '0', '3');
INSERT INTO shop_area VALUES ('2918', '望城县', '275', '0', '3');
INSERT INTO shop_area VALUES ('2919', '浏阳市', '275', '0', '3');
INSERT INTO shop_area VALUES ('2920', '芙蓉区', '275', '0', '3');
INSERT INTO shop_area VALUES ('2921', '长沙县', '275', '0', '3');
INSERT INTO shop_area VALUES ('2922', '雨花区', '275', '0', '3');
INSERT INTO shop_area VALUES ('2923', '天元区', '276', '0', '3');
INSERT INTO shop_area VALUES ('2924', '攸县', '276', '0', '3');
INSERT INTO shop_area VALUES ('2925', '株洲县', '276', '0', '3');
INSERT INTO shop_area VALUES ('2926', '炎陵县', '276', '0', '3');
INSERT INTO shop_area VALUES ('2927', '石峰区', '276', '0', '3');
INSERT INTO shop_area VALUES ('2928', '芦淞区', '276', '0', '3');
INSERT INTO shop_area VALUES ('2929', '茶陵县', '276', '0', '3');
INSERT INTO shop_area VALUES ('2930', '荷塘区', '276', '0', '3');
INSERT INTO shop_area VALUES ('2931', '醴陵市', '276', '0', '3');
INSERT INTO shop_area VALUES ('2932', '岳塘区', '277', '0', '3');
INSERT INTO shop_area VALUES ('2933', '湘乡市', '277', '0', '3');
INSERT INTO shop_area VALUES ('2934', '湘潭县', '277', '0', '3');
INSERT INTO shop_area VALUES ('2935', '雨湖区', '277', '0', '3');
INSERT INTO shop_area VALUES ('2936', '韶山市', '277', '0', '3');
INSERT INTO shop_area VALUES ('2937', '南岳区', '278', '0', '3');
INSERT INTO shop_area VALUES ('2938', '常宁市', '278', '0', '3');
INSERT INTO shop_area VALUES ('2939', '珠晖区', '278', '0', '3');
INSERT INTO shop_area VALUES ('2940', '石鼓区', '278', '0', '3');
INSERT INTO shop_area VALUES ('2941', '祁东县', '278', '0', '3');
INSERT INTO shop_area VALUES ('2942', '耒阳市', '278', '0', '3');
INSERT INTO shop_area VALUES ('2943', '蒸湘区', '278', '0', '3');
INSERT INTO shop_area VALUES ('2944', '衡东县', '278', '0', '3');
INSERT INTO shop_area VALUES ('2945', '衡南县', '278', '0', '3');
INSERT INTO shop_area VALUES ('2946', '衡山县', '278', '0', '3');
INSERT INTO shop_area VALUES ('2947', '衡阳县', '278', '0', '3');
INSERT INTO shop_area VALUES ('2948', '雁峰区', '278', '0', '3');
INSERT INTO shop_area VALUES ('2949', '北塔区', '279', '0', '3');
INSERT INTO shop_area VALUES ('2950', '双清区', '279', '0', '3');
INSERT INTO shop_area VALUES ('2951', '城步苗族自治县', '279', '0', '3');
INSERT INTO shop_area VALUES ('2952', '大祥区', '279', '0', '3');
INSERT INTO shop_area VALUES ('2953', '新宁县', '279', '0', '3');
INSERT INTO shop_area VALUES ('2954', '新邵县', '279', '0', '3');
INSERT INTO shop_area VALUES ('2955', '武冈市', '279', '0', '3');
INSERT INTO shop_area VALUES ('2956', '洞口县', '279', '0', '3');
INSERT INTO shop_area VALUES ('2957', '绥宁县', '279', '0', '3');
INSERT INTO shop_area VALUES ('2958', '邵东县', '279', '0', '3');
INSERT INTO shop_area VALUES ('2959', '邵阳县', '279', '0', '3');
INSERT INTO shop_area VALUES ('2960', '隆回县', '279', '0', '3');
INSERT INTO shop_area VALUES ('2961', '临湘市', '280', '0', '3');
INSERT INTO shop_area VALUES ('2962', '云溪区', '280', '0', '3');
INSERT INTO shop_area VALUES ('2963', '华容县', '280', '0', '3');
INSERT INTO shop_area VALUES ('2964', '君山区', '280', '0', '3');
INSERT INTO shop_area VALUES ('2965', '岳阳县', '280', '0', '3');
INSERT INTO shop_area VALUES ('2966', '岳阳楼区', '280', '0', '3');
INSERT INTO shop_area VALUES ('2967', '平江县', '280', '0', '3');
INSERT INTO shop_area VALUES ('2968', '汨罗市', '280', '0', '3');
INSERT INTO shop_area VALUES ('2969', '湘阴县', '280', '0', '3');
INSERT INTO shop_area VALUES ('2970', '临澧县', '281', '0', '3');
INSERT INTO shop_area VALUES ('2971', '安乡县', '281', '0', '3');
INSERT INTO shop_area VALUES ('2972', '桃源县', '281', '0', '3');
INSERT INTO shop_area VALUES ('2973', '武陵区', '281', '0', '3');
INSERT INTO shop_area VALUES ('2974', '汉寿县', '281', '0', '3');
INSERT INTO shop_area VALUES ('2975', '津市市', '281', '0', '3');
INSERT INTO shop_area VALUES ('2976', '澧县', '281', '0', '3');
INSERT INTO shop_area VALUES ('2977', '石门县', '281', '0', '3');
INSERT INTO shop_area VALUES ('2978', '鼎城区', '281', '0', '3');
INSERT INTO shop_area VALUES ('2979', '慈利县', '282', '0', '3');
INSERT INTO shop_area VALUES ('2980', '桑植县', '282', '0', '3');
INSERT INTO shop_area VALUES ('2981', '武陵源区', '282', '0', '3');
INSERT INTO shop_area VALUES ('2982', '永定区', '282', '0', '3');
INSERT INTO shop_area VALUES ('2983', '南县', '283', '0', '3');
INSERT INTO shop_area VALUES ('2984', '安化县', '283', '0', '3');
INSERT INTO shop_area VALUES ('2985', '桃江县', '283', '0', '3');
INSERT INTO shop_area VALUES ('2986', '沅江市', '283', '0', '3');
INSERT INTO shop_area VALUES ('2987', '资阳区', '283', '0', '3');
INSERT INTO shop_area VALUES ('2988', '赫山区', '283', '0', '3');
INSERT INTO shop_area VALUES ('2989', '临武县', '284', '0', '3');
INSERT INTO shop_area VALUES ('2990', '北湖区', '284', '0', '3');
INSERT INTO shop_area VALUES ('2991', '嘉禾县', '284', '0', '3');
INSERT INTO shop_area VALUES ('2992', '安仁县', '284', '0', '3');
INSERT INTO shop_area VALUES ('2993', '宜章县', '284', '0', '3');
INSERT INTO shop_area VALUES ('2994', '桂东县', '284', '0', '3');
INSERT INTO shop_area VALUES ('2995', '桂阳县', '284', '0', '3');
INSERT INTO shop_area VALUES ('2996', '永兴县', '284', '0', '3');
INSERT INTO shop_area VALUES ('2997', '汝城县', '284', '0', '3');
INSERT INTO shop_area VALUES ('2998', '苏仙区', '284', '0', '3');
INSERT INTO shop_area VALUES ('2999', '资兴市', '284', '0', '3');
INSERT INTO shop_area VALUES ('3000', '东安县', '285', '0', '3');
INSERT INTO shop_area VALUES ('3001', '冷水滩区', '285', '0', '3');
INSERT INTO shop_area VALUES ('3002', '双牌县', '285', '0', '3');
INSERT INTO shop_area VALUES ('3003', '宁远县', '285', '0', '3');
INSERT INTO shop_area VALUES ('3004', '新田县', '285', '0', '3');
INSERT INTO shop_area VALUES ('3005', '江华瑶族自治县', '285', '0', '3');
INSERT INTO shop_area VALUES ('3006', '江永县', '285', '0', '3');
INSERT INTO shop_area VALUES ('3007', '祁阳县', '285', '0', '3');
INSERT INTO shop_area VALUES ('3008', '蓝山县', '285', '0', '3');
INSERT INTO shop_area VALUES ('3009', '道县', '285', '0', '3');
INSERT INTO shop_area VALUES ('3010', '零陵区', '285', '0', '3');
INSERT INTO shop_area VALUES ('3011', '中方县', '286', '0', '3');
INSERT INTO shop_area VALUES ('3012', '会同县', '286', '0', '3');
INSERT INTO shop_area VALUES ('3013', '新晃侗族自治县', '286', '0', '3');
INSERT INTO shop_area VALUES ('3014', '沅陵县', '286', '0', '3');
INSERT INTO shop_area VALUES ('3015', '洪江市/洪江区', '286', '0', '3');
INSERT INTO shop_area VALUES ('3016', '溆浦县', '286', '0', '3');
INSERT INTO shop_area VALUES ('3017', '芷江侗族自治县', '286', '0', '3');
INSERT INTO shop_area VALUES ('3018', '辰溪县', '286', '0', '3');
INSERT INTO shop_area VALUES ('3019', '通道侗族自治县', '286', '0', '3');
INSERT INTO shop_area VALUES ('3020', '靖州苗族侗族自治县', '286', '0', '3');
INSERT INTO shop_area VALUES ('3021', '鹤城区', '286', '0', '3');
INSERT INTO shop_area VALUES ('3022', '麻阳苗族自治县', '286', '0', '3');
INSERT INTO shop_area VALUES ('3023', '冷水江市', '287', '0', '3');
INSERT INTO shop_area VALUES ('3024', '双峰县', '287', '0', '3');
INSERT INTO shop_area VALUES ('3025', '娄星区', '287', '0', '3');
INSERT INTO shop_area VALUES ('3026', '新化县', '287', '0', '3');
INSERT INTO shop_area VALUES ('3027', '涟源市', '287', '0', '3');
INSERT INTO shop_area VALUES ('3028', '保靖县', '288', '0', '3');
INSERT INTO shop_area VALUES ('3029', '凤凰县', '288', '0', '3');
INSERT INTO shop_area VALUES ('3030', '古丈县', '288', '0', '3');
INSERT INTO shop_area VALUES ('3031', '吉首市', '288', '0', '3');
INSERT INTO shop_area VALUES ('3032', '永顺县', '288', '0', '3');
INSERT INTO shop_area VALUES ('3033', '泸溪县', '288', '0', '3');
INSERT INTO shop_area VALUES ('3034', '花垣县', '288', '0', '3');
INSERT INTO shop_area VALUES ('3035', '龙山县', '288', '0', '3');
INSERT INTO shop_area VALUES ('3036', '萝岗区', '289', '0', '3');
INSERT INTO shop_area VALUES ('3037', '南沙区', '289', '0', '3');
INSERT INTO shop_area VALUES ('3038', '从化市', '289', '0', '3');
INSERT INTO shop_area VALUES ('3039', '增城市', '289', '0', '3');
INSERT INTO shop_area VALUES ('3040', '天河区', '289', '0', '3');
INSERT INTO shop_area VALUES ('3041', '海珠区', '289', '0', '3');
INSERT INTO shop_area VALUES ('3042', '番禺区', '289', '0', '3');
INSERT INTO shop_area VALUES ('3043', '白云区', '289', '0', '3');
INSERT INTO shop_area VALUES ('3044', '花都区', '289', '0', '3');
INSERT INTO shop_area VALUES ('3045', '荔湾区', '289', '0', '3');
INSERT INTO shop_area VALUES ('3046', '越秀区', '289', '0', '3');
INSERT INTO shop_area VALUES ('3047', '黄埔区', '289', '0', '3');
INSERT INTO shop_area VALUES ('3048', '乐昌市', '290', '0', '3');
INSERT INTO shop_area VALUES ('3049', '乳源瑶族自治县', '290', '0', '3');
INSERT INTO shop_area VALUES ('3050', '仁化县', '290', '0', '3');
INSERT INTO shop_area VALUES ('3051', '南雄市', '290', '0', '3');
INSERT INTO shop_area VALUES ('3052', '始兴县', '290', '0', '3');
INSERT INTO shop_area VALUES ('3053', '新丰县', '290', '0', '3');
INSERT INTO shop_area VALUES ('3054', '曲江区', '290', '0', '3');
INSERT INTO shop_area VALUES ('3055', '武江区', '290', '0', '3');
INSERT INTO shop_area VALUES ('3056', '浈江区', '290', '0', '3');
INSERT INTO shop_area VALUES ('3057', '翁源县', '290', '0', '3');
INSERT INTO shop_area VALUES ('3058', '南山区', '291', '0', '3');
INSERT INTO shop_area VALUES ('3059', '宝安区', '291', '0', '3');
INSERT INTO shop_area VALUES ('3060', '盐田区', '291', '0', '3');
INSERT INTO shop_area VALUES ('3061', '福田区', '291', '0', '3');
INSERT INTO shop_area VALUES ('3062', '罗湖区', '291', '0', '3');
INSERT INTO shop_area VALUES ('3063', '龙岗区', '291', '0', '3');
INSERT INTO shop_area VALUES ('3064', '斗门区', '292', '0', '3');
INSERT INTO shop_area VALUES ('3065', '金湾区', '292', '0', '3');
INSERT INTO shop_area VALUES ('3066', '香洲区', '292', '0', '3');
INSERT INTO shop_area VALUES ('3067', '南澳县', '293', '0', '3');
INSERT INTO shop_area VALUES ('3068', '潮南区', '293', '0', '3');
INSERT INTO shop_area VALUES ('3069', '潮阳区', '293', '0', '3');
INSERT INTO shop_area VALUES ('3070', '澄海区', '293', '0', '3');
INSERT INTO shop_area VALUES ('3071', '濠江区', '293', '0', '3');
INSERT INTO shop_area VALUES ('3072', '金平区', '293', '0', '3');
INSERT INTO shop_area VALUES ('3073', '龙湖区', '293', '0', '3');
INSERT INTO shop_area VALUES ('3074', '三水区', '294', '0', '3');
INSERT INTO shop_area VALUES ('3075', '南海区', '294', '0', '3');
INSERT INTO shop_area VALUES ('3076', '禅城区', '294', '0', '3');
INSERT INTO shop_area VALUES ('3077', '顺德区', '294', '0', '3');
INSERT INTO shop_area VALUES ('3078', '高明区', '294', '0', '3');
INSERT INTO shop_area VALUES ('3079', '台山市', '295', '0', '3');
INSERT INTO shop_area VALUES ('3080', '开平市', '295', '0', '3');
INSERT INTO shop_area VALUES ('3081', '恩平市', '295', '0', '3');
INSERT INTO shop_area VALUES ('3082', '新会区', '295', '0', '3');
INSERT INTO shop_area VALUES ('3083', '江海区', '295', '0', '3');
INSERT INTO shop_area VALUES ('3084', '蓬江区', '295', '0', '3');
INSERT INTO shop_area VALUES ('3085', '鹤山市', '295', '0', '3');
INSERT INTO shop_area VALUES ('3086', '吴川市', '296', '0', '3');
INSERT INTO shop_area VALUES ('3087', '坡头区', '296', '0', '3');
INSERT INTO shop_area VALUES ('3088', '廉江市', '296', '0', '3');
INSERT INTO shop_area VALUES ('3089', '徐闻县', '296', '0', '3');
INSERT INTO shop_area VALUES ('3090', '赤坎区', '296', '0', '3');
INSERT INTO shop_area VALUES ('3091', '遂溪县', '296', '0', '3');
INSERT INTO shop_area VALUES ('3092', '雷州市', '296', '0', '3');
INSERT INTO shop_area VALUES ('3093', '霞山区', '296', '0', '3');
INSERT INTO shop_area VALUES ('3094', '麻章区', '296', '0', '3');
INSERT INTO shop_area VALUES ('3095', '信宜市', '297', '0', '3');
INSERT INTO shop_area VALUES ('3096', '化州市', '297', '0', '3');
INSERT INTO shop_area VALUES ('3097', '电白县', '297', '0', '3');
INSERT INTO shop_area VALUES ('3098', '茂南区', '297', '0', '3');
INSERT INTO shop_area VALUES ('3099', '茂港区', '297', '0', '3');
INSERT INTO shop_area VALUES ('3100', '高州市', '297', '0', '3');
INSERT INTO shop_area VALUES ('3101', '四会市', '298', '0', '3');
INSERT INTO shop_area VALUES ('3102', '封开县', '298', '0', '3');
INSERT INTO shop_area VALUES ('3103', '广宁县', '298', '0', '3');
INSERT INTO shop_area VALUES ('3104', '德庆县', '298', '0', '3');
INSERT INTO shop_area VALUES ('3105', '怀集县', '298', '0', '3');
INSERT INTO shop_area VALUES ('3106', '端州区', '298', '0', '3');
INSERT INTO shop_area VALUES ('3107', '高要市', '298', '0', '3');
INSERT INTO shop_area VALUES ('3108', '鼎湖区', '298', '0', '3');
INSERT INTO shop_area VALUES ('3109', '博罗县', '299', '0', '3');
INSERT INTO shop_area VALUES ('3110', '惠东县', '299', '0', '3');
INSERT INTO shop_area VALUES ('3111', '惠城区', '299', '0', '3');
INSERT INTO shop_area VALUES ('3112', '惠阳区', '299', '0', '3');
INSERT INTO shop_area VALUES ('3113', '龙门县', '299', '0', '3');
INSERT INTO shop_area VALUES ('3114', '丰顺县', '300', '0', '3');
INSERT INTO shop_area VALUES ('3115', '五华县', '300', '0', '3');
INSERT INTO shop_area VALUES ('3116', '兴宁市', '300', '0', '3');
INSERT INTO shop_area VALUES ('3117', '大埔县', '300', '0', '3');
INSERT INTO shop_area VALUES ('3118', '平远县', '300', '0', '3');
INSERT INTO shop_area VALUES ('3119', '梅县', '300', '0', '3');
INSERT INTO shop_area VALUES ('3120', '梅江区', '300', '0', '3');
INSERT INTO shop_area VALUES ('3121', '蕉岭县', '300', '0', '3');
INSERT INTO shop_area VALUES ('3122', '城区', '301', '0', '3');
INSERT INTO shop_area VALUES ('3123', '海丰县', '301', '0', '3');
INSERT INTO shop_area VALUES ('3124', '陆丰市', '301', '0', '3');
INSERT INTO shop_area VALUES ('3125', '陆河县', '301', '0', '3');
INSERT INTO shop_area VALUES ('3126', '东源县', '302', '0', '3');
INSERT INTO shop_area VALUES ('3127', '和平县', '302', '0', '3');
INSERT INTO shop_area VALUES ('3128', '源城区', '302', '0', '3');
INSERT INTO shop_area VALUES ('3129', '紫金县', '302', '0', '3');
INSERT INTO shop_area VALUES ('3130', '连平县', '302', '0', '3');
INSERT INTO shop_area VALUES ('3131', '龙川县', '302', '0', '3');
INSERT INTO shop_area VALUES ('3132', '江城区', '303', '0', '3');
INSERT INTO shop_area VALUES ('3133', '阳东县', '303', '0', '3');
INSERT INTO shop_area VALUES ('3134', '阳春市', '303', '0', '3');
INSERT INTO shop_area VALUES ('3135', '阳西县', '303', '0', '3');
INSERT INTO shop_area VALUES ('3136', '佛冈县', '304', '0', '3');
INSERT INTO shop_area VALUES ('3137', '清城区', '304', '0', '3');
INSERT INTO shop_area VALUES ('3138', '清新县', '304', '0', '3');
INSERT INTO shop_area VALUES ('3139', '英德市', '304', '0', '3');
INSERT INTO shop_area VALUES ('3140', '连南瑶族自治县', '304', '0', '3');
INSERT INTO shop_area VALUES ('3141', '连山壮族瑶族自治县', '304', '0', '3');
INSERT INTO shop_area VALUES ('3142', '连州市', '304', '0', '3');
INSERT INTO shop_area VALUES ('3143', '阳山县', '304', '0', '3');
INSERT INTO shop_area VALUES ('3144', '东莞市', '305', '0', '3');
INSERT INTO shop_area VALUES ('3145', '中山市', '306', '0', '3');
INSERT INTO shop_area VALUES ('3146', '湘桥区', '307', '0', '3');
INSERT INTO shop_area VALUES ('3147', '潮安县', '307', '0', '3');
INSERT INTO shop_area VALUES ('3148', '饶平县', '307', '0', '3');
INSERT INTO shop_area VALUES ('3149', '惠来县', '308', '0', '3');
INSERT INTO shop_area VALUES ('3150', '揭东县', '308', '0', '3');
INSERT INTO shop_area VALUES ('3151', '揭西县', '308', '0', '3');
INSERT INTO shop_area VALUES ('3152', '普宁市', '308', '0', '3');
INSERT INTO shop_area VALUES ('3153', '榕城区', '308', '0', '3');
INSERT INTO shop_area VALUES ('3154', '云城区', '309', '0', '3');
INSERT INTO shop_area VALUES ('3155', '云安县', '309', '0', '3');
INSERT INTO shop_area VALUES ('3156', '新兴县', '309', '0', '3');
INSERT INTO shop_area VALUES ('3157', '罗定市', '309', '0', '3');
INSERT INTO shop_area VALUES ('3158', '郁南县', '309', '0', '3');
INSERT INTO shop_area VALUES ('3159', '上林县', '310', '0', '3');
INSERT INTO shop_area VALUES ('3160', '兴宁区', '310', '0', '3');
INSERT INTO shop_area VALUES ('3161', '宾阳县', '310', '0', '3');
INSERT INTO shop_area VALUES ('3162', '横县', '310', '0', '3');
INSERT INTO shop_area VALUES ('3163', '武鸣县', '310', '0', '3');
INSERT INTO shop_area VALUES ('3164', '江南区', '310', '0', '3');
INSERT INTO shop_area VALUES ('3165', '良庆区', '310', '0', '3');
INSERT INTO shop_area VALUES ('3166', '西乡塘区', '310', '0', '3');
INSERT INTO shop_area VALUES ('3167', '邕宁区', '310', '0', '3');
INSERT INTO shop_area VALUES ('3168', '隆安县', '310', '0', '3');
INSERT INTO shop_area VALUES ('3169', '青秀区', '310', '0', '3');
INSERT INTO shop_area VALUES ('3170', '马山县', '310', '0', '3');
INSERT INTO shop_area VALUES ('3171', '三江侗族自治县', '311', '0', '3');
INSERT INTO shop_area VALUES ('3172', '城中区', '311', '0', '3');
INSERT INTO shop_area VALUES ('3173', '柳北区', '311', '0', '3');
INSERT INTO shop_area VALUES ('3174', '柳南区', '311', '0', '3');
INSERT INTO shop_area VALUES ('3175', '柳城县', '311', '0', '3');
INSERT INTO shop_area VALUES ('3176', '柳江县', '311', '0', '3');
INSERT INTO shop_area VALUES ('3177', '融安县', '311', '0', '3');
INSERT INTO shop_area VALUES ('3178', '融水苗族自治县', '311', '0', '3');
INSERT INTO shop_area VALUES ('3179', '鱼峰区', '311', '0', '3');
INSERT INTO shop_area VALUES ('3180', '鹿寨县', '311', '0', '3');
INSERT INTO shop_area VALUES ('3181', '七星区', '312', '0', '3');
INSERT INTO shop_area VALUES ('3182', '临桂县', '312', '0', '3');
INSERT INTO shop_area VALUES ('3183', '全州县', '312', '0', '3');
INSERT INTO shop_area VALUES ('3184', '兴安县', '312', '0', '3');
INSERT INTO shop_area VALUES ('3185', '叠彩区', '312', '0', '3');
INSERT INTO shop_area VALUES ('3186', '平乐县', '312', '0', '3');
INSERT INTO shop_area VALUES ('3187', '恭城瑶族自治县', '312', '0', '3');
INSERT INTO shop_area VALUES ('3188', '永福县', '312', '0', '3');
INSERT INTO shop_area VALUES ('3189', '灌阳县', '312', '0', '3');
INSERT INTO shop_area VALUES ('3190', '灵川县', '312', '0', '3');
INSERT INTO shop_area VALUES ('3191', '秀峰区', '312', '0', '3');
INSERT INTO shop_area VALUES ('3192', '荔浦县', '312', '0', '3');
INSERT INTO shop_area VALUES ('3193', '象山区', '312', '0', '3');
INSERT INTO shop_area VALUES ('3194', '资源县', '312', '0', '3');
INSERT INTO shop_area VALUES ('3195', '阳朔县', '312', '0', '3');
INSERT INTO shop_area VALUES ('3196', '雁山区', '312', '0', '3');
INSERT INTO shop_area VALUES ('3197', '龙胜各族自治县', '312', '0', '3');
INSERT INTO shop_area VALUES ('3198', '万秀区', '313', '0', '3');
INSERT INTO shop_area VALUES ('3199', '岑溪市', '313', '0', '3');
INSERT INTO shop_area VALUES ('3200', '苍梧县', '313', '0', '3');
INSERT INTO shop_area VALUES ('3201', '蒙山县', '313', '0', '3');
INSERT INTO shop_area VALUES ('3202', '藤县', '313', '0', '3');
INSERT INTO shop_area VALUES ('3203', '蝶山区', '313', '0', '3');
INSERT INTO shop_area VALUES ('3204', '长洲区', '313', '0', '3');
INSERT INTO shop_area VALUES ('3205', '合浦县', '314', '0', '3');
INSERT INTO shop_area VALUES ('3206', '海城区', '314', '0', '3');
INSERT INTO shop_area VALUES ('3207', '铁山港区', '314', '0', '3');
INSERT INTO shop_area VALUES ('3208', '银海区', '314', '0', '3');
INSERT INTO shop_area VALUES ('3209', '上思县', '315', '0', '3');
INSERT INTO shop_area VALUES ('3210', '东兴市', '315', '0', '3');
INSERT INTO shop_area VALUES ('3211', '港口区', '315', '0', '3');
INSERT INTO shop_area VALUES ('3212', '防城区', '315', '0', '3');
INSERT INTO shop_area VALUES ('3213', '浦北县', '316', '0', '3');
INSERT INTO shop_area VALUES ('3214', '灵山县', '316', '0', '3');
INSERT INTO shop_area VALUES ('3215', '钦北区', '316', '0', '3');
INSERT INTO shop_area VALUES ('3216', '钦南区', '316', '0', '3');
INSERT INTO shop_area VALUES ('3217', '平南县', '317', '0', '3');
INSERT INTO shop_area VALUES ('3218', '桂平市', '317', '0', '3');
INSERT INTO shop_area VALUES ('3219', '港北区', '317', '0', '3');
INSERT INTO shop_area VALUES ('3220', '港南区', '317', '0', '3');
INSERT INTO shop_area VALUES ('3221', '覃塘区', '317', '0', '3');
INSERT INTO shop_area VALUES ('3222', '兴业县', '318', '0', '3');
INSERT INTO shop_area VALUES ('3223', '北流市', '318', '0', '3');
INSERT INTO shop_area VALUES ('3224', '博白县', '318', '0', '3');
INSERT INTO shop_area VALUES ('3225', '容县', '318', '0', '3');
INSERT INTO shop_area VALUES ('3226', '玉州区', '318', '0', '3');
INSERT INTO shop_area VALUES ('3227', '陆川县', '318', '0', '3');
INSERT INTO shop_area VALUES ('3228', '乐业县', '319', '0', '3');
INSERT INTO shop_area VALUES ('3229', '凌云县', '319', '0', '3');
INSERT INTO shop_area VALUES ('3230', '右江区', '319', '0', '3');
INSERT INTO shop_area VALUES ('3231', '平果县', '319', '0', '3');
INSERT INTO shop_area VALUES ('3232', '德保县', '319', '0', '3');
INSERT INTO shop_area VALUES ('3233', '田东县', '319', '0', '3');
INSERT INTO shop_area VALUES ('3234', '田林县', '319', '0', '3');
INSERT INTO shop_area VALUES ('3235', '田阳县', '319', '0', '3');
INSERT INTO shop_area VALUES ('3236', '西林县', '319', '0', '3');
INSERT INTO shop_area VALUES ('3237', '那坡县', '319', '0', '3');
INSERT INTO shop_area VALUES ('3238', '隆林各族自治县', '319', '0', '3');
INSERT INTO shop_area VALUES ('3239', '靖西县', '319', '0', '3');
INSERT INTO shop_area VALUES ('3240', '八步区', '320', '0', '3');
INSERT INTO shop_area VALUES ('3241', '富川瑶族自治县', '320', '0', '3');
INSERT INTO shop_area VALUES ('3242', '昭平县', '320', '0', '3');
INSERT INTO shop_area VALUES ('3243', '钟山县', '320', '0', '3');
INSERT INTO shop_area VALUES ('3244', '东兰县', '321', '0', '3');
INSERT INTO shop_area VALUES ('3245', '凤山县', '321', '0', '3');
INSERT INTO shop_area VALUES ('3246', '南丹县', '321', '0', '3');
INSERT INTO shop_area VALUES ('3247', '大化瑶族自治县', '321', '0', '3');
INSERT INTO shop_area VALUES ('3248', '天峨县', '321', '0', '3');
INSERT INTO shop_area VALUES ('3249', '宜州市', '321', '0', '3');
INSERT INTO shop_area VALUES ('3250', '巴马瑶族自治县', '321', '0', '3');
INSERT INTO shop_area VALUES ('3251', '环江毛南族自治县', '321', '0', '3');
INSERT INTO shop_area VALUES ('3252', '罗城仫佬族自治县', '321', '0', '3');
INSERT INTO shop_area VALUES ('3253', '都安瑶族自治县', '321', '0', '3');
INSERT INTO shop_area VALUES ('3254', '金城江区', '321', '0', '3');
INSERT INTO shop_area VALUES ('3255', '兴宾区', '322', '0', '3');
INSERT INTO shop_area VALUES ('3256', '合山市', '322', '0', '3');
INSERT INTO shop_area VALUES ('3257', '忻城县', '322', '0', '3');
INSERT INTO shop_area VALUES ('3258', '武宣县', '322', '0', '3');
INSERT INTO shop_area VALUES ('3259', '象州县', '322', '0', '3');
INSERT INTO shop_area VALUES ('3260', '金秀瑶族自治县', '322', '0', '3');
INSERT INTO shop_area VALUES ('3261', '凭祥市', '323', '0', '3');
INSERT INTO shop_area VALUES ('3262', '大新县', '323', '0', '3');
INSERT INTO shop_area VALUES ('3263', '天等县', '323', '0', '3');
INSERT INTO shop_area VALUES ('3264', '宁明县', '323', '0', '3');
INSERT INTO shop_area VALUES ('3265', '扶绥县', '323', '0', '3');
INSERT INTO shop_area VALUES ('3266', '江州区', '323', '0', '3');
INSERT INTO shop_area VALUES ('3267', '龙州县', '323', '0', '3');
INSERT INTO shop_area VALUES ('3268', '琼山区', '324', '0', '3');
INSERT INTO shop_area VALUES ('3269', '秀英区', '324', '0', '3');
INSERT INTO shop_area VALUES ('3270', '美兰区', '324', '0', '3');
INSERT INTO shop_area VALUES ('3271', '龙华区', '324', '0', '3');
INSERT INTO shop_area VALUES ('3272', '三亚市', '325', '0', '3');
INSERT INTO shop_area VALUES ('3273', '五指山市', '326', '0', '3');
INSERT INTO shop_area VALUES ('3274', '琼海市', '327', '0', '3');
INSERT INTO shop_area VALUES ('3275', '儋州市', '328', '0', '3');
INSERT INTO shop_area VALUES ('3276', '文昌市', '329', '0', '3');
INSERT INTO shop_area VALUES ('3277', '万宁市', '330', '0', '3');
INSERT INTO shop_area VALUES ('3278', '东方市', '331', '0', '3');
INSERT INTO shop_area VALUES ('3279', '定安县', '332', '0', '3');
INSERT INTO shop_area VALUES ('3280', '屯昌县', '333', '0', '3');
INSERT INTO shop_area VALUES ('3281', '澄迈县', '334', '0', '3');
INSERT INTO shop_area VALUES ('3282', '临高县', '335', '0', '3');
INSERT INTO shop_area VALUES ('3283', '白沙黎族自治县', '336', '0', '3');
INSERT INTO shop_area VALUES ('3284', '昌江黎族自治县', '337', '0', '3');
INSERT INTO shop_area VALUES ('3285', '乐东黎族自治县', '338', '0', '3');
INSERT INTO shop_area VALUES ('3286', '陵水黎族自治县', '339', '0', '3');
INSERT INTO shop_area VALUES ('3287', '保亭黎族苗族自治县', '340', '0', '3');
INSERT INTO shop_area VALUES ('3288', '琼中黎族苗族自治县', '341', '0', '3');
INSERT INTO shop_area VALUES ('4209', '双流县', '385', '0', '3');
INSERT INTO shop_area VALUES ('4210', '大邑县', '385', '0', '3');
INSERT INTO shop_area VALUES ('4211', '崇州市', '385', '0', '3');
INSERT INTO shop_area VALUES ('4212', '彭州市', '385', '0', '3');
INSERT INTO shop_area VALUES ('4213', '成华区', '385', '0', '3');
INSERT INTO shop_area VALUES ('4214', '新津县', '385', '0', '3');
INSERT INTO shop_area VALUES ('4215', '新都区', '385', '0', '3');
INSERT INTO shop_area VALUES ('4216', '武侯区', '385', '0', '3');
INSERT INTO shop_area VALUES ('4217', '温江区', '385', '0', '3');
INSERT INTO shop_area VALUES ('4218', '蒲江县', '385', '0', '3');
INSERT INTO shop_area VALUES ('4219', '邛崃市', '385', '0', '3');
INSERT INTO shop_area VALUES ('4220', '郫县', '385', '0', '3');
INSERT INTO shop_area VALUES ('4221', '都江堰市', '385', '0', '3');
INSERT INTO shop_area VALUES ('4222', '金堂县', '385', '0', '3');
INSERT INTO shop_area VALUES ('4223', '金牛区', '385', '0', '3');
INSERT INTO shop_area VALUES ('4224', '锦江区', '385', '0', '3');
INSERT INTO shop_area VALUES ('4225', '青白江区', '385', '0', '3');
INSERT INTO shop_area VALUES ('4226', '青羊区', '385', '0', '3');
INSERT INTO shop_area VALUES ('4227', '龙泉驿区', '385', '0', '3');
INSERT INTO shop_area VALUES ('4228', '大安区', '386', '0', '3');
INSERT INTO shop_area VALUES ('4229', '富顺县', '386', '0', '3');
INSERT INTO shop_area VALUES ('4230', '沿滩区', '386', '0', '3');
INSERT INTO shop_area VALUES ('4231', '自流井区', '386', '0', '3');
INSERT INTO shop_area VALUES ('4232', '荣县', '386', '0', '3');
INSERT INTO shop_area VALUES ('4233', '贡井区', '386', '0', '3');
INSERT INTO shop_area VALUES ('4234', '东区', '387', '0', '3');
INSERT INTO shop_area VALUES ('4235', '仁和区', '387', '0', '3');
INSERT INTO shop_area VALUES ('4236', '盐边县', '387', '0', '3');
INSERT INTO shop_area VALUES ('4237', '米易县', '387', '0', '3');
INSERT INTO shop_area VALUES ('4238', '西区', '387', '0', '3');
INSERT INTO shop_area VALUES ('4239', '叙永县', '388', '0', '3');
INSERT INTO shop_area VALUES ('4240', '古蔺县', '388', '0', '3');
INSERT INTO shop_area VALUES ('4241', '合江县', '388', '0', '3');
INSERT INTO shop_area VALUES ('4242', '江阳区', '388', '0', '3');
INSERT INTO shop_area VALUES ('4243', '泸县', '388', '0', '3');
INSERT INTO shop_area VALUES ('4244', '纳溪区', '388', '0', '3');
INSERT INTO shop_area VALUES ('4245', '龙马潭区', '388', '0', '3');
INSERT INTO shop_area VALUES ('4246', '中江县', '389', '0', '3');
INSERT INTO shop_area VALUES ('4247', '什邡市', '389', '0', '3');
INSERT INTO shop_area VALUES ('4248', '广汉市', '389', '0', '3');
INSERT INTO shop_area VALUES ('4249', '旌阳区', '389', '0', '3');
INSERT INTO shop_area VALUES ('4250', '绵竹市', '389', '0', '3');
INSERT INTO shop_area VALUES ('4251', '罗江县', '389', '0', '3');
INSERT INTO shop_area VALUES ('4252', '三台县', '390', '0', '3');
INSERT INTO shop_area VALUES ('4253', '北川羌族自治县', '390', '0', '3');
INSERT INTO shop_area VALUES ('4254', '安县', '390', '0', '3');
INSERT INTO shop_area VALUES ('4255', '平武县', '390', '0', '3');
INSERT INTO shop_area VALUES ('4256', '梓潼县', '390', '0', '3');
INSERT INTO shop_area VALUES ('4257', '江油市', '390', '0', '3');
INSERT INTO shop_area VALUES ('4258', '涪城区', '390', '0', '3');
INSERT INTO shop_area VALUES ('4259', '游仙区', '390', '0', '3');
INSERT INTO shop_area VALUES ('4260', '盐亭县', '390', '0', '3');
INSERT INTO shop_area VALUES ('4261', '元坝区', '391', '0', '3');
INSERT INTO shop_area VALUES ('4262', '利州区', '391', '0', '3');
INSERT INTO shop_area VALUES ('4263', '剑阁县', '391', '0', '3');
INSERT INTO shop_area VALUES ('4264', '旺苍县', '391', '0', '3');
INSERT INTO shop_area VALUES ('4265', '朝天区', '391', '0', '3');
INSERT INTO shop_area VALUES ('4266', '苍溪县', '391', '0', '3');
INSERT INTO shop_area VALUES ('4267', '青川县', '391', '0', '3');
INSERT INTO shop_area VALUES ('4268', '大英县', '392', '0', '3');
INSERT INTO shop_area VALUES ('4269', '安居区', '392', '0', '3');
INSERT INTO shop_area VALUES ('4270', '射洪县', '392', '0', '3');
INSERT INTO shop_area VALUES ('4271', '船山区', '392', '0', '3');
INSERT INTO shop_area VALUES ('4272', '蓬溪县', '392', '0', '3');
INSERT INTO shop_area VALUES ('4273', '东兴区', '393', '0', '3');
INSERT INTO shop_area VALUES ('4274', '威远县', '393', '0', '3');
INSERT INTO shop_area VALUES ('4275', '市中区', '393', '0', '3');
INSERT INTO shop_area VALUES ('4276', '资中县', '393', '0', '3');
INSERT INTO shop_area VALUES ('4277', '隆昌县', '393', '0', '3');
INSERT INTO shop_area VALUES ('4278', '五通桥区', '394', '0', '3');
INSERT INTO shop_area VALUES ('4279', '井研县', '394', '0', '3');
INSERT INTO shop_area VALUES ('4280', '夹江县', '394', '0', '3');
INSERT INTO shop_area VALUES ('4281', '峨眉山市', '394', '0', '3');
INSERT INTO shop_area VALUES ('4282', '峨边彝族自治县', '394', '0', '3');
INSERT INTO shop_area VALUES ('4283', '市中区', '394', '0', '3');
INSERT INTO shop_area VALUES ('4284', '沐川县', '394', '0', '3');
INSERT INTO shop_area VALUES ('4285', '沙湾区', '394', '0', '3');
INSERT INTO shop_area VALUES ('4286', '犍为县', '394', '0', '3');
INSERT INTO shop_area VALUES ('4287', '金口河区', '394', '0', '3');
INSERT INTO shop_area VALUES ('4288', '马边彝族自治县', '394', '0', '3');
INSERT INTO shop_area VALUES ('4289', '仪陇县', '395', '0', '3');
INSERT INTO shop_area VALUES ('4290', '南充市嘉陵区', '395', '0', '3');
INSERT INTO shop_area VALUES ('4291', '南部县', '395', '0', '3');
INSERT INTO shop_area VALUES ('4292', '嘉陵区', '395', '0', '3');
INSERT INTO shop_area VALUES ('4293', '营山县', '395', '0', '3');
INSERT INTO shop_area VALUES ('4294', '蓬安县', '395', '0', '3');
INSERT INTO shop_area VALUES ('4295', '西充县', '395', '0', '3');
INSERT INTO shop_area VALUES ('4296', '阆中市', '395', '0', '3');
INSERT INTO shop_area VALUES ('4297', '顺庆区', '395', '0', '3');
INSERT INTO shop_area VALUES ('4298', '高坪区', '395', '0', '3');
INSERT INTO shop_area VALUES ('4299', '东坡区', '396', '0', '3');
INSERT INTO shop_area VALUES ('4300', '丹棱县', '396', '0', '3');
INSERT INTO shop_area VALUES ('4301', '仁寿县', '396', '0', '3');
INSERT INTO shop_area VALUES ('4302', '彭山县', '396', '0', '3');
INSERT INTO shop_area VALUES ('4303', '洪雅县', '396', '0', '3');
INSERT INTO shop_area VALUES ('4304', '青神县', '396', '0', '3');
INSERT INTO shop_area VALUES ('4305', '兴文县', '397', '0', '3');
INSERT INTO shop_area VALUES ('4306', '南溪县', '397', '0', '3');
INSERT INTO shop_area VALUES ('4307', '宜宾县', '397', '0', '3');
INSERT INTO shop_area VALUES ('4308', '屏山县', '397', '0', '3');
INSERT INTO shop_area VALUES ('4309', '江安县', '397', '0', '3');
INSERT INTO shop_area VALUES ('4310', '珙县', '397', '0', '3');
INSERT INTO shop_area VALUES ('4311', '筠连县', '397', '0', '3');
INSERT INTO shop_area VALUES ('4312', '翠屏区', '397', '0', '3');
INSERT INTO shop_area VALUES ('4313', '长宁县', '397', '0', '3');
INSERT INTO shop_area VALUES ('4314', '高县', '397', '0', '3');
INSERT INTO shop_area VALUES ('4315', '华蓥市', '398', '0', '3');
INSERT INTO shop_area VALUES ('4316', '岳池县', '398', '0', '3');
INSERT INTO shop_area VALUES ('4317', '广安区', '398', '0', '3');
INSERT INTO shop_area VALUES ('4318', '武胜县', '398', '0', '3');
INSERT INTO shop_area VALUES ('4319', '邻水县', '398', '0', '3');
INSERT INTO shop_area VALUES ('4320', '万源市', '399', '0', '3');
INSERT INTO shop_area VALUES ('4321', '大竹县', '399', '0', '3');
INSERT INTO shop_area VALUES ('4322', '宣汉县', '399', '0', '3');
INSERT INTO shop_area VALUES ('4323', '开江县', '399', '0', '3');
INSERT INTO shop_area VALUES ('4324', '渠县', '399', '0', '3');
INSERT INTO shop_area VALUES ('4325', '达县', '399', '0', '3');
INSERT INTO shop_area VALUES ('4326', '通川区', '399', '0', '3');
INSERT INTO shop_area VALUES ('4327', '名山县', '400', '0', '3');
INSERT INTO shop_area VALUES ('4328', '天全县', '400', '0', '3');
INSERT INTO shop_area VALUES ('4329', '宝兴县', '400', '0', '3');
INSERT INTO shop_area VALUES ('4330', '汉源县', '400', '0', '3');
INSERT INTO shop_area VALUES ('4331', '石棉县', '400', '0', '3');
INSERT INTO shop_area VALUES ('4332', '芦山县', '400', '0', '3');
INSERT INTO shop_area VALUES ('4333', '荥经县', '400', '0', '3');
INSERT INTO shop_area VALUES ('4334', '雨城区', '400', '0', '3');
INSERT INTO shop_area VALUES ('4335', '南江县', '401', '0', '3');
INSERT INTO shop_area VALUES ('4336', '巴州区', '401', '0', '3');
INSERT INTO shop_area VALUES ('4337', '平昌县', '401', '0', '3');
INSERT INTO shop_area VALUES ('4338', '通江县', '401', '0', '3');
INSERT INTO shop_area VALUES ('4339', '乐至县', '402', '0', '3');
INSERT INTO shop_area VALUES ('4340', '安岳县', '402', '0', '3');
INSERT INTO shop_area VALUES ('4341', '简阳市', '402', '0', '3');
INSERT INTO shop_area VALUES ('4342', '雁江区', '402', '0', '3');
INSERT INTO shop_area VALUES ('4343', '九寨沟县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4344', '壤塘县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4345', '小金县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4346', '松潘县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4347', '汶川县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4348', '理县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4349', '红原县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4350', '若尔盖县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4351', '茂县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4352', '金川县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4353', '阿坝县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4354', '马尔康县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4355', '黑水县', '403', '0', '3');
INSERT INTO shop_area VALUES ('4356', '丹巴县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4357', '乡城县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4358', '巴塘县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4359', '康定县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4360', '得荣县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4361', '德格县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4362', '新龙县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4363', '泸定县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4364', '炉霍县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4365', '理塘县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4366', '甘孜县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4367', '白玉县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4368', '石渠县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4369', '稻城县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4370', '色达县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4371', '道孚县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4372', '雅江县', '404', '0', '3');
INSERT INTO shop_area VALUES ('4373', '会东县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4374', '会理县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4375', '冕宁县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4376', '喜德县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4377', '宁南县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4378', '布拖县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4379', '德昌县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4380', '昭觉县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4381', '普格县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4382', '木里藏族自治县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4383', '甘洛县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4384', '盐源县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4385', '美姑县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4386', '西昌', '405', '0', '3');
INSERT INTO shop_area VALUES ('4387', '越西县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4388', '金阳县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4389', '雷波县', '405', '0', '3');
INSERT INTO shop_area VALUES ('4390', '乌当区', '406', '0', '3');
INSERT INTO shop_area VALUES ('4391', '云岩区', '406', '0', '3');
INSERT INTO shop_area VALUES ('4392', '修文县', '406', '0', '3');
INSERT INTO shop_area VALUES ('4393', '南明区', '406', '0', '3');
INSERT INTO shop_area VALUES ('4394', '小河区', '406', '0', '3');
INSERT INTO shop_area VALUES ('4395', '开阳县', '406', '0', '3');
INSERT INTO shop_area VALUES ('4396', '息烽县', '406', '0', '3');
INSERT INTO shop_area VALUES ('4397', '清镇市', '406', '0', '3');
INSERT INTO shop_area VALUES ('4398', '白云区', '406', '0', '3');
INSERT INTO shop_area VALUES ('4399', '花溪区', '406', '0', '3');
INSERT INTO shop_area VALUES ('4400', '六枝特区', '407', '0', '3');
INSERT INTO shop_area VALUES ('4401', '水城县', '407', '0', '3');
INSERT INTO shop_area VALUES ('4402', '盘县', '407', '0', '3');
INSERT INTO shop_area VALUES ('4403', '钟山区', '407', '0', '3');
INSERT INTO shop_area VALUES ('4404', '习水县', '408', '0', '3');
INSERT INTO shop_area VALUES ('4405', '仁怀市', '408', '0', '3');
INSERT INTO shop_area VALUES ('4406', '余庆县', '408', '0', '3');
INSERT INTO shop_area VALUES ('4407', '凤冈县', '408', '0', '3');
INSERT INTO shop_area VALUES ('4408', '务川仡佬族苗族自治县', '408', '0', '3');
INSERT INTO shop_area VALUES ('4409', '桐梓县', '408', '0', '3');
INSERT INTO shop_area VALUES ('4410', '正安县', '408', '0', '3');
INSERT INTO shop_area VALUES ('4411', '汇川区', '408', '0', '3');
INSERT INTO shop_area VALUES ('4412', '湄潭县', '408', '0', '3');
INSERT INTO shop_area VALUES ('4413', '红花岗区', '408', '0', '3');
INSERT INTO shop_area VALUES ('4414', '绥阳县', '408', '0', '3');
INSERT INTO shop_area VALUES ('4415', '赤水市', '408', '0', '3');
INSERT INTO shop_area VALUES ('4416', '道真仡佬族苗族自治县', '408', '0', '3');
INSERT INTO shop_area VALUES ('4417', '遵义县', '408', '0', '3');
INSERT INTO shop_area VALUES ('4418', '关岭布依族苗族自治县', '409', '0', '3');
INSERT INTO shop_area VALUES ('4419', '平坝县', '409', '0', '3');
INSERT INTO shop_area VALUES ('4420', '普定县', '409', '0', '3');
INSERT INTO shop_area VALUES ('4421', '紫云苗族布依族自治县', '409', '0', '3');
INSERT INTO shop_area VALUES ('4422', '西秀区', '409', '0', '3');
INSERT INTO shop_area VALUES ('4423', '镇宁布依族苗族自治县', '409', '0', '3');
INSERT INTO shop_area VALUES ('4424', '万山特区', '410', '0', '3');
INSERT INTO shop_area VALUES ('4425', '印江土家族苗族自治县', '410', '0', '3');
INSERT INTO shop_area VALUES ('4426', '德江县', '410', '0', '3');
INSERT INTO shop_area VALUES ('4427', '思南县', '410', '0', '3');
INSERT INTO shop_area VALUES ('4428', '松桃苗族自治县', '410', '0', '3');
INSERT INTO shop_area VALUES ('4429', '江口县', '410', '0', '3');
INSERT INTO shop_area VALUES ('4430', '沿河土家族自治县', '410', '0', '3');
INSERT INTO shop_area VALUES ('4431', '玉屏侗族自治县', '410', '0', '3');
INSERT INTO shop_area VALUES ('4432', '石阡县', '410', '0', '3');
INSERT INTO shop_area VALUES ('4433', '铜仁市', '410', '0', '3');
INSERT INTO shop_area VALUES ('4434', '兴义市', '411', '0', '3');
INSERT INTO shop_area VALUES ('4435', '兴仁县', '411', '0', '3');
INSERT INTO shop_area VALUES ('4436', '册亨县', '411', '0', '3');
INSERT INTO shop_area VALUES ('4437', '安龙县', '411', '0', '3');
INSERT INTO shop_area VALUES ('4438', '普安县', '411', '0', '3');
INSERT INTO shop_area VALUES ('4439', '晴隆县', '411', '0', '3');
INSERT INTO shop_area VALUES ('4440', '望谟县', '411', '0', '3');
INSERT INTO shop_area VALUES ('4441', '贞丰县', '411', '0', '3');
INSERT INTO shop_area VALUES ('4442', '大方县', '412', '0', '3');
INSERT INTO shop_area VALUES ('4443', '威宁彝族回族苗族自治县', '412', '0', '3');
INSERT INTO shop_area VALUES ('4444', '毕节市', '412', '0', '3');
INSERT INTO shop_area VALUES ('4445', '纳雍县', '412', '0', '3');
INSERT INTO shop_area VALUES ('4446', '织金县', '412', '0', '3');
INSERT INTO shop_area VALUES ('4447', '赫章县', '412', '0', '3');
INSERT INTO shop_area VALUES ('4448', '金沙县', '412', '0', '3');
INSERT INTO shop_area VALUES ('4449', '黔西县', '412', '0', '3');
INSERT INTO shop_area VALUES ('4450', '三穗县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4451', '丹寨县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4452', '从江县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4453', '凯里市', '413', '0', '3');
INSERT INTO shop_area VALUES ('4454', '剑河县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4455', '台江县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4456', '天柱县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4457', '岑巩县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4458', '施秉县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4459', '榕江县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4460', '锦屏县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4461', '镇远县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4462', '雷山县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4463', '麻江县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4464', '黄平县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4465', '黎平县', '413', '0', '3');
INSERT INTO shop_area VALUES ('4466', '三都水族自治县', '414', '0', '3');
INSERT INTO shop_area VALUES ('4467', '平塘县', '414', '0', '3');
INSERT INTO shop_area VALUES ('4468', '惠水县', '414', '0', '3');
INSERT INTO shop_area VALUES ('4469', '独山县', '414', '0', '3');
INSERT INTO shop_area VALUES ('4470', '瓮安县', '414', '0', '3');
INSERT INTO shop_area VALUES ('4471', '福泉市', '414', '0', '3');
INSERT INTO shop_area VALUES ('4472', '罗甸县', '414', '0', '3');
INSERT INTO shop_area VALUES ('4473', '荔波县', '414', '0', '3');
INSERT INTO shop_area VALUES ('4474', '贵定县', '414', '0', '3');
INSERT INTO shop_area VALUES ('4475', '都匀市', '414', '0', '3');
INSERT INTO shop_area VALUES ('4476', '长顺县', '414', '0', '3');
INSERT INTO shop_area VALUES ('4477', '龙里县', '414', '0', '3');
INSERT INTO shop_area VALUES ('4478', '东川区', '415', '0', '3');
INSERT INTO shop_area VALUES ('4479', '五华区', '415', '0', '3');
INSERT INTO shop_area VALUES ('4480', '呈贡县', '415', '0', '3');
INSERT INTO shop_area VALUES ('4481', '安宁市', '415', '0', '3');
INSERT INTO shop_area VALUES ('4482', '官渡区', '415', '0', '3');
INSERT INTO shop_area VALUES ('4483', '宜良县', '415', '0', '3');
INSERT INTO shop_area VALUES ('4484', '富民县', '415', '0', '3');
INSERT INTO shop_area VALUES ('4485', '寻甸回族彝族自治县', '415', '0', '3');
INSERT INTO shop_area VALUES ('4486', '嵩明县', '415', '0', '3');
INSERT INTO shop_area VALUES ('4487', '晋宁县', '415', '0', '3');
INSERT INTO shop_area VALUES ('4488', '盘龙区', '415', '0', '3');
INSERT INTO shop_area VALUES ('4489', '石林彝族自治县', '415', '0', '3');
INSERT INTO shop_area VALUES ('4490', '禄劝彝族苗族自治县', '415', '0', '3');
INSERT INTO shop_area VALUES ('4491', '西山区', '415', '0', '3');
INSERT INTO shop_area VALUES ('4492', '会泽县', '416', '0', '3');
INSERT INTO shop_area VALUES ('4493', '宣威市', '416', '0', '3');
INSERT INTO shop_area VALUES ('4494', '富源县', '416', '0', '3');
INSERT INTO shop_area VALUES ('4495', '师宗县', '416', '0', '3');
INSERT INTO shop_area VALUES ('4496', '沾益县', '416', '0', '3');
INSERT INTO shop_area VALUES ('4497', '罗平县', '416', '0', '3');
INSERT INTO shop_area VALUES ('4498', '陆良县', '416', '0', '3');
INSERT INTO shop_area VALUES ('4499', '马龙县', '416', '0', '3');
INSERT INTO shop_area VALUES ('4500', '麒麟区', '416', '0', '3');
INSERT INTO shop_area VALUES ('4501', '元江哈尼族彝族傣族自治县', '417', '0', '3');
INSERT INTO shop_area VALUES ('4502', '华宁县', '417', '0', '3');
INSERT INTO shop_area VALUES ('4503', '峨山彝族自治县', '417', '0', '3');
INSERT INTO shop_area VALUES ('4504', '新平彝族傣族自治县', '417', '0', '3');
INSERT INTO shop_area VALUES ('4505', '易门县', '417', '0', '3');
INSERT INTO shop_area VALUES ('4506', '江川县', '417', '0', '3');
INSERT INTO shop_area VALUES ('4507', '澄江县', '417', '0', '3');
INSERT INTO shop_area VALUES ('4508', '红塔区', '417', '0', '3');
INSERT INTO shop_area VALUES ('4509', '通海县', '417', '0', '3');
INSERT INTO shop_area VALUES ('4510', '施甸县', '418', '0', '3');
INSERT INTO shop_area VALUES ('4511', '昌宁县', '418', '0', '3');
INSERT INTO shop_area VALUES ('4512', '腾冲县', '418', '0', '3');
INSERT INTO shop_area VALUES ('4513', '隆阳区', '418', '0', '3');
INSERT INTO shop_area VALUES ('4514', '龙陵县', '418', '0', '3');
INSERT INTO shop_area VALUES ('4515', '大关县', '419', '0', '3');
INSERT INTO shop_area VALUES ('4516', '威信县', '419', '0', '3');
INSERT INTO shop_area VALUES ('4517', '巧家县', '419', '0', '3');
INSERT INTO shop_area VALUES ('4518', '彝良县', '419', '0', '3');
INSERT INTO shop_area VALUES ('4519', '昭阳区', '419', '0', '3');
INSERT INTO shop_area VALUES ('4520', '水富县', '419', '0', '3');
INSERT INTO shop_area VALUES ('4521', '永善县', '419', '0', '3');
INSERT INTO shop_area VALUES ('4522', '盐津县', '419', '0', '3');
INSERT INTO shop_area VALUES ('4523', '绥江县', '419', '0', '3');
INSERT INTO shop_area VALUES ('4524', '镇雄县', '419', '0', '3');
INSERT INTO shop_area VALUES ('4525', '鲁甸县', '419', '0', '3');
INSERT INTO shop_area VALUES ('4526', '华坪县', '420', '0', '3');
INSERT INTO shop_area VALUES ('4527', '古城区', '420', '0', '3');
INSERT INTO shop_area VALUES ('4528', '宁蒗彝族自治县', '420', '0', '3');
INSERT INTO shop_area VALUES ('4529', '永胜县', '420', '0', '3');
INSERT INTO shop_area VALUES ('4530', '玉龙纳西族自治县', '420', '0', '3');
INSERT INTO shop_area VALUES ('4531', '临翔区', '422', '0', '3');
INSERT INTO shop_area VALUES ('4532', '云县', '422', '0', '3');
INSERT INTO shop_area VALUES ('4533', '凤庆县', '422', '0', '3');
INSERT INTO shop_area VALUES ('4534', '双江拉祜族佤族布朗族傣族自治县', '422', '0', '3');
INSERT INTO shop_area VALUES ('4535', '永德县', '422', '0', '3');
INSERT INTO shop_area VALUES ('4536', '沧源佤族自治县', '422', '0', '3');
INSERT INTO shop_area VALUES ('4537', '耿马傣族佤族自治县', '422', '0', '3');
INSERT INTO shop_area VALUES ('4538', '镇康县', '422', '0', '3');
INSERT INTO shop_area VALUES ('4539', '元谋县', '423', '0', '3');
INSERT INTO shop_area VALUES ('4540', '南华县', '423', '0', '3');
INSERT INTO shop_area VALUES ('4541', '双柏县', '423', '0', '3');
INSERT INTO shop_area VALUES ('4542', '大姚县', '423', '0', '3');
INSERT INTO shop_area VALUES ('4543', '姚安县', '423', '0', '3');
INSERT INTO shop_area VALUES ('4544', '楚雄市', '423', '0', '3');
INSERT INTO shop_area VALUES ('4545', '武定县', '423', '0', '3');
INSERT INTO shop_area VALUES ('4546', '永仁县', '423', '0', '3');
INSERT INTO shop_area VALUES ('4547', '牟定县', '423', '0', '3');
INSERT INTO shop_area VALUES ('4548', '禄丰县', '423', '0', '3');
INSERT INTO shop_area VALUES ('4549', '个旧市', '424', '0', '3');
INSERT INTO shop_area VALUES ('4550', '元阳县', '424', '0', '3');
INSERT INTO shop_area VALUES ('4551', '屏边苗族自治县', '424', '0', '3');
INSERT INTO shop_area VALUES ('4552', '建水县', '424', '0', '3');
INSERT INTO shop_area VALUES ('4553', '开远市', '424', '0', '3');
INSERT INTO shop_area VALUES ('4554', '弥勒县', '424', '0', '3');
INSERT INTO shop_area VALUES ('4555', '河口瑶族自治县', '424', '0', '3');
INSERT INTO shop_area VALUES ('4556', '泸西县', '424', '0', '3');
INSERT INTO shop_area VALUES ('4557', '石屏县', '424', '0', '3');
INSERT INTO shop_area VALUES ('4558', '红河县', '424', '0', '3');
INSERT INTO shop_area VALUES ('4559', '绿春县', '424', '0', '3');
INSERT INTO shop_area VALUES ('4560', '蒙自县', '424', '0', '3');
INSERT INTO shop_area VALUES ('4561', '金平苗族瑶族傣族自治县', '424', '0', '3');
INSERT INTO shop_area VALUES ('4562', '丘北县', '425', '0', '3');
INSERT INTO shop_area VALUES ('4563', '富宁县', '425', '0', '3');
INSERT INTO shop_area VALUES ('4564', '广南县', '425', '0', '3');
INSERT INTO shop_area VALUES ('4565', '文山县', '425', '0', '3');
INSERT INTO shop_area VALUES ('4566', '砚山县', '425', '0', '3');
INSERT INTO shop_area VALUES ('4567', '西畴县', '425', '0', '3');
INSERT INTO shop_area VALUES ('4568', '马关县', '425', '0', '3');
INSERT INTO shop_area VALUES ('4569', '麻栗坡县', '425', '0', '3');
INSERT INTO shop_area VALUES ('4570', '勐海县', '426', '0', '3');
INSERT INTO shop_area VALUES ('4571', '勐腊县', '426', '0', '3');
INSERT INTO shop_area VALUES ('4572', '景洪市', '426', '0', '3');
INSERT INTO shop_area VALUES ('4573', '云龙县', '427', '0', '3');
INSERT INTO shop_area VALUES ('4574', '剑川县', '427', '0', '3');
INSERT INTO shop_area VALUES ('4575', '南涧彝族自治县', '427', '0', '3');
INSERT INTO shop_area VALUES ('4576', '大理市', '427', '0', '3');
INSERT INTO shop_area VALUES ('4577', '宾川县', '427', '0', '3');
INSERT INTO shop_area VALUES ('4578', '巍山彝族回族自治县', '427', '0', '3');
INSERT INTO shop_area VALUES ('4579', '弥渡县', '427', '0', '3');
INSERT INTO shop_area VALUES ('4580', '永平县', '427', '0', '3');
INSERT INTO shop_area VALUES ('4581', '洱源县', '427', '0', '3');
INSERT INTO shop_area VALUES ('4582', '漾濞彝族自治县', '427', '0', '3');
INSERT INTO shop_area VALUES ('4583', '祥云县', '427', '0', '3');
INSERT INTO shop_area VALUES ('4584', '鹤庆县', '427', '0', '3');
INSERT INTO shop_area VALUES ('4585', '梁河县', '428', '0', '3');
INSERT INTO shop_area VALUES ('4586', '潞西市', '428', '0', '3');
INSERT INTO shop_area VALUES ('4587', '瑞丽市', '428', '0', '3');
INSERT INTO shop_area VALUES ('4588', '盈江县', '428', '0', '3');
INSERT INTO shop_area VALUES ('4589', '陇川县', '428', '0', '3');
INSERT INTO shop_area VALUES ('4590', '德钦县', '430', '0', '3');
INSERT INTO shop_area VALUES ('4591', '维西傈僳族自治县', '430', '0', '3');
INSERT INTO shop_area VALUES ('4592', '香格里拉县', '430', '0', '3');
INSERT INTO shop_area VALUES ('4593', '城关区', '431', '0', '3');
INSERT INTO shop_area VALUES ('4594', '堆龙德庆县', '431', '0', '3');
INSERT INTO shop_area VALUES ('4595', '墨竹工卡县', '431', '0', '3');
INSERT INTO shop_area VALUES ('4596', '尼木县', '431', '0', '3');
INSERT INTO shop_area VALUES ('4597', '当雄县', '431', '0', '3');
INSERT INTO shop_area VALUES ('4598', '曲水县', '431', '0', '3');
INSERT INTO shop_area VALUES ('4599', '林周县', '431', '0', '3');
INSERT INTO shop_area VALUES ('4600', '达孜县', '431', '0', '3');
INSERT INTO shop_area VALUES ('4601', '丁青县', '432', '0', '3');
INSERT INTO shop_area VALUES ('4602', '八宿县', '432', '0', '3');
INSERT INTO shop_area VALUES ('4603', '察雅县', '432', '0', '3');
INSERT INTO shop_area VALUES ('4604', '左贡县', '432', '0', '3');
INSERT INTO shop_area VALUES ('4605', '昌都县', '432', '0', '3');
INSERT INTO shop_area VALUES ('4606', '江达县', '432', '0', '3');
INSERT INTO shop_area VALUES ('4607', '洛隆县', '432', '0', '3');
INSERT INTO shop_area VALUES ('4608', '类乌齐县', '432', '0', '3');
INSERT INTO shop_area VALUES ('4609', '芒康县', '432', '0', '3');
INSERT INTO shop_area VALUES ('4610', '贡觉县', '432', '0', '3');
INSERT INTO shop_area VALUES ('4611', '边坝县', '432', '0', '3');
INSERT INTO shop_area VALUES ('4612', '乃东县', '433', '0', '3');
INSERT INTO shop_area VALUES ('4613', '加查县', '433', '0', '3');
INSERT INTO shop_area VALUES ('4614', '扎囊县', '433', '0', '3');
INSERT INTO shop_area VALUES ('4615', '措美县', '433', '0', '3');
INSERT INTO shop_area VALUES ('4616', '曲松县', '433', '0', '3');
INSERT INTO shop_area VALUES ('4617', '桑日县', '433', '0', '3');
INSERT INTO shop_area VALUES ('4618', '洛扎县', '433', '0', '3');
INSERT INTO shop_area VALUES ('4619', '浪卡子县', '433', '0', '3');
INSERT INTO shop_area VALUES ('4620', '琼结县', '433', '0', '3');
INSERT INTO shop_area VALUES ('4621', '贡嘎县', '433', '0', '3');
INSERT INTO shop_area VALUES ('4622', '错那县', '433', '0', '3');
INSERT INTO shop_area VALUES ('4623', '隆子县', '433', '0', '3');
INSERT INTO shop_area VALUES ('4624', '亚东县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4625', '仁布县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4626', '仲巴县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4627', '南木林县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4628', '吉隆县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4629', '定日县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4630', '定结县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4631', '岗巴县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4632', '康马县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4633', '拉孜县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4634', '日喀则市', '434', '0', '3');
INSERT INTO shop_area VALUES ('4635', '昂仁县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4636', '江孜县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4637', '白朗县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4638', '聂拉木县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4639', '萨嘎县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4640', '萨迦县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4641', '谢通门县', '434', '0', '3');
INSERT INTO shop_area VALUES ('4642', '嘉黎县', '435', '0', '3');
INSERT INTO shop_area VALUES ('4643', '安多县', '435', '0', '3');
INSERT INTO shop_area VALUES ('4644', '尼玛县', '435', '0', '3');
INSERT INTO shop_area VALUES ('4645', '巴青县', '435', '0', '3');
INSERT INTO shop_area VALUES ('4646', '比如县', '435', '0', '3');
INSERT INTO shop_area VALUES ('4647', '班戈县', '435', '0', '3');
INSERT INTO shop_area VALUES ('4648', '申扎县', '435', '0', '3');
INSERT INTO shop_area VALUES ('4649', '索县', '435', '0', '3');
INSERT INTO shop_area VALUES ('4650', '聂荣县', '435', '0', '3');
INSERT INTO shop_area VALUES ('4651', '那曲县', '435', '0', '3');
INSERT INTO shop_area VALUES ('4652', '噶尔县', '436', '0', '3');
INSERT INTO shop_area VALUES ('4653', '措勤县', '436', '0', '3');
INSERT INTO shop_area VALUES ('4654', '改则县', '436', '0', '3');
INSERT INTO shop_area VALUES ('4655', '日土县', '436', '0', '3');
INSERT INTO shop_area VALUES ('4656', '普兰县', '436', '0', '3');
INSERT INTO shop_area VALUES ('4657', '札达县', '436', '0', '3');
INSERT INTO shop_area VALUES ('4658', '革吉县', '436', '0', '3');
INSERT INTO shop_area VALUES ('4659', '墨脱县', '437', '0', '3');
INSERT INTO shop_area VALUES ('4660', '察隅县', '437', '0', '3');
INSERT INTO shop_area VALUES ('4661', '工布江达县', '437', '0', '3');
INSERT INTO shop_area VALUES ('4662', '朗县', '437', '0', '3');
INSERT INTO shop_area VALUES ('4663', '林芝县', '437', '0', '3');
INSERT INTO shop_area VALUES ('4664', '波密县', '437', '0', '3');
INSERT INTO shop_area VALUES ('4665', '米林县', '437', '0', '3');
INSERT INTO shop_area VALUES ('4666', '临潼区', '438', '0', '3');
INSERT INTO shop_area VALUES ('4667', '周至县', '438', '0', '3');
INSERT INTO shop_area VALUES ('4668', '户县', '438', '0', '3');
INSERT INTO shop_area VALUES ('4669', '新城区', '438', '0', '3');
INSERT INTO shop_area VALUES ('4670', '未央区', '438', '0', '3');
INSERT INTO shop_area VALUES ('4671', '灞桥区', '438', '0', '3');
INSERT INTO shop_area VALUES ('4672', '碑林区', '438', '0', '3');
INSERT INTO shop_area VALUES ('4673', '莲湖区', '438', '0', '3');
INSERT INTO shop_area VALUES ('4674', '蓝田县', '438', '0', '3');
INSERT INTO shop_area VALUES ('4675', '长安区', '438', '0', '3');
INSERT INTO shop_area VALUES ('4676', '阎良区', '438', '0', '3');
INSERT INTO shop_area VALUES ('4677', '雁塔区', '438', '0', '3');
INSERT INTO shop_area VALUES ('4678', '高陵县', '438', '0', '3');
INSERT INTO shop_area VALUES ('4679', '印台区', '439', '0', '3');
INSERT INTO shop_area VALUES ('4680', '宜君县', '439', '0', '3');
INSERT INTO shop_area VALUES ('4681', '王益区', '439', '0', '3');
INSERT INTO shop_area VALUES ('4682', '耀州区', '439', '0', '3');
INSERT INTO shop_area VALUES ('4683', '凤县', '440', '0', '3');
INSERT INTO shop_area VALUES ('4684', '凤翔县', '440', '0', '3');
INSERT INTO shop_area VALUES ('4685', '千阳县', '440', '0', '3');
INSERT INTO shop_area VALUES ('4686', '太白县', '440', '0', '3');
INSERT INTO shop_area VALUES ('4687', '岐山县', '440', '0', '3');
INSERT INTO shop_area VALUES ('4688', '扶风县', '440', '0', '3');
INSERT INTO shop_area VALUES ('4689', '渭滨区', '440', '0', '3');
INSERT INTO shop_area VALUES ('4690', '眉县', '440', '0', '3');
INSERT INTO shop_area VALUES ('4691', '金台区', '440', '0', '3');
INSERT INTO shop_area VALUES ('4692', '陇县', '440', '0', '3');
INSERT INTO shop_area VALUES ('4693', '陈仓区', '440', '0', '3');
INSERT INTO shop_area VALUES ('4694', '麟游县', '440', '0', '3');
INSERT INTO shop_area VALUES ('4695', '三原县', '441', '0', '3');
INSERT INTO shop_area VALUES ('4696', '干县', '441', '0', '3');
INSERT INTO shop_area VALUES ('4697', '兴平市', '441', '0', '3');
INSERT INTO shop_area VALUES ('4698', '彬县', '441', '0', '3');
INSERT INTO shop_area VALUES ('4699', '旬邑县', '441', '0', '3');
INSERT INTO shop_area VALUES ('4700', '杨陵区', '441', '0', '3');
INSERT INTO shop_area VALUES ('4701', '武功县', '441', '0', '3');
INSERT INTO shop_area VALUES ('4702', '永寿县', '441', '0', '3');
INSERT INTO shop_area VALUES ('4703', '泾阳县', '441', '0', '3');
INSERT INTO shop_area VALUES ('4704', '淳化县', '441', '0', '3');
INSERT INTO shop_area VALUES ('4705', '渭城区', '441', '0', '3');
INSERT INTO shop_area VALUES ('4706', '礼泉县', '441', '0', '3');
INSERT INTO shop_area VALUES ('4707', '秦都区', '441', '0', '3');
INSERT INTO shop_area VALUES ('4708', '长武县', '441', '0', '3');
INSERT INTO shop_area VALUES ('4709', '临渭区', '442', '0', '3');
INSERT INTO shop_area VALUES ('4710', '华县', '442', '0', '3');
INSERT INTO shop_area VALUES ('4711', '华阴市', '442', '0', '3');
INSERT INTO shop_area VALUES ('4712', '合阳县', '442', '0', '3');
INSERT INTO shop_area VALUES ('4713', '大荔县', '442', '0', '3');
INSERT INTO shop_area VALUES ('4714', '富平县', '442', '0', '3');
INSERT INTO shop_area VALUES ('4715', '潼关县', '442', '0', '3');
INSERT INTO shop_area VALUES ('4716', '澄城县', '442', '0', '3');
INSERT INTO shop_area VALUES ('4717', '白水县', '442', '0', '3');
INSERT INTO shop_area VALUES ('4718', '蒲城县', '442', '0', '3');
INSERT INTO shop_area VALUES ('4719', '韩城市', '442', '0', '3');
INSERT INTO shop_area VALUES ('4720', '吴起县', '443', '0', '3');
INSERT INTO shop_area VALUES ('4721', '子长县', '443', '0', '3');
INSERT INTO shop_area VALUES ('4722', '安塞县', '443', '0', '3');
INSERT INTO shop_area VALUES ('4723', '宜川县', '443', '0', '3');
INSERT INTO shop_area VALUES ('4724', '宝塔区', '443', '0', '3');
INSERT INTO shop_area VALUES ('4725', '富县', '443', '0', '3');
INSERT INTO shop_area VALUES ('4726', '延川县', '443', '0', '3');
INSERT INTO shop_area VALUES ('4727', '延长县', '443', '0', '3');
INSERT INTO shop_area VALUES ('4728', '志丹县', '443', '0', '3');
INSERT INTO shop_area VALUES ('4729', '洛川县', '443', '0', '3');
INSERT INTO shop_area VALUES ('4730', '甘泉县', '443', '0', '3');
INSERT INTO shop_area VALUES ('4731', '黄陵县', '443', '0', '3');
INSERT INTO shop_area VALUES ('4732', '黄龙县', '443', '0', '3');
INSERT INTO shop_area VALUES ('4733', '佛坪县', '444', '0', '3');
INSERT INTO shop_area VALUES ('4734', '勉县', '444', '0', '3');
INSERT INTO shop_area VALUES ('4735', '南郑县', '444', '0', '3');
INSERT INTO shop_area VALUES ('4736', '城固县', '444', '0', '3');
INSERT INTO shop_area VALUES ('4737', '宁强县', '444', '0', '3');
INSERT INTO shop_area VALUES ('4738', '汉台区', '444', '0', '3');
INSERT INTO shop_area VALUES ('4739', '洋县', '444', '0', '3');
INSERT INTO shop_area VALUES ('4740', '留坝县', '444', '0', '3');
INSERT INTO shop_area VALUES ('4741', '略阳县', '444', '0', '3');
INSERT INTO shop_area VALUES ('4742', '西乡县', '444', '0', '3');
INSERT INTO shop_area VALUES ('4743', '镇巴县', '444', '0', '3');
INSERT INTO shop_area VALUES ('4744', '佳县', '445', '0', '3');
INSERT INTO shop_area VALUES ('4745', '吴堡县', '445', '0', '3');
INSERT INTO shop_area VALUES ('4746', '子洲县', '445', '0', '3');
INSERT INTO shop_area VALUES ('4747', '定边县', '445', '0', '3');
INSERT INTO shop_area VALUES ('4748', '府谷县', '445', '0', '3');
INSERT INTO shop_area VALUES ('4749', '榆林市榆阳区', '445', '0', '3');
INSERT INTO shop_area VALUES ('4750', '横山县', '445', '0', '3');
INSERT INTO shop_area VALUES ('4751', '清涧县', '445', '0', '3');
INSERT INTO shop_area VALUES ('4752', '神木县', '445', '0', '3');
INSERT INTO shop_area VALUES ('4753', '米脂县', '445', '0', '3');
INSERT INTO shop_area VALUES ('4754', '绥德县', '445', '0', '3');
INSERT INTO shop_area VALUES ('4755', '靖边县', '445', '0', '3');
INSERT INTO shop_area VALUES ('4756', '宁陕县', '446', '0', '3');
INSERT INTO shop_area VALUES ('4757', '岚皋县', '446', '0', '3');
INSERT INTO shop_area VALUES ('4758', '平利县', '446', '0', '3');
INSERT INTO shop_area VALUES ('4759', '旬阳县', '446', '0', '3');
INSERT INTO shop_area VALUES ('4760', '汉滨区', '446', '0', '3');
INSERT INTO shop_area VALUES ('4761', '汉阴县', '446', '0', '3');
INSERT INTO shop_area VALUES ('4762', '白河县', '446', '0', '3');
INSERT INTO shop_area VALUES ('4763', '石泉县', '446', '0', '3');
INSERT INTO shop_area VALUES ('4764', '紫阳县', '446', '0', '3');
INSERT INTO shop_area VALUES ('4765', '镇坪县', '446', '0', '3');
INSERT INTO shop_area VALUES ('4766', '丹凤县', '447', '0', '3');
INSERT INTO shop_area VALUES ('4767', '商南县', '447', '0', '3');
INSERT INTO shop_area VALUES ('4768', '商州区', '447', '0', '3');
INSERT INTO shop_area VALUES ('4769', '山阳县', '447', '0', '3');
INSERT INTO shop_area VALUES ('4770', '柞水县', '447', '0', '3');
INSERT INTO shop_area VALUES ('4771', '洛南县', '447', '0', '3');
INSERT INTO shop_area VALUES ('4772', '镇安县', '447', '0', '3');
INSERT INTO shop_area VALUES ('4773', '七里河区', '448', '0', '3');
INSERT INTO shop_area VALUES ('4774', '城关区', '448', '0', '3');
INSERT INTO shop_area VALUES ('4775', '安宁区', '448', '0', '3');
INSERT INTO shop_area VALUES ('4776', '榆中县', '448', '0', '3');
INSERT INTO shop_area VALUES ('4777', '永登县', '448', '0', '3');
INSERT INTO shop_area VALUES ('4778', '皋兰县', '448', '0', '3');
INSERT INTO shop_area VALUES ('4779', '红古区', '448', '0', '3');
INSERT INTO shop_area VALUES ('4780', '西固区', '448', '0', '3');
INSERT INTO shop_area VALUES ('4781', '嘉峪关市', '449', '0', '3');
INSERT INTO shop_area VALUES ('4782', '永昌县', '450', '0', '3');
INSERT INTO shop_area VALUES ('4783', '金川区', '450', '0', '3');
INSERT INTO shop_area VALUES ('4784', '会宁县', '451', '0', '3');
INSERT INTO shop_area VALUES ('4785', '平川区', '451', '0', '3');
INSERT INTO shop_area VALUES ('4786', '景泰县', '451', '0', '3');
INSERT INTO shop_area VALUES ('4787', '白银区', '451', '0', '3');
INSERT INTO shop_area VALUES ('4788', '靖远县', '451', '0', '3');
INSERT INTO shop_area VALUES ('4789', '张家川回族自治县', '452', '0', '3');
INSERT INTO shop_area VALUES ('4790', '武山县', '452', '0', '3');
INSERT INTO shop_area VALUES ('4791', '清水县', '452', '0', '3');
INSERT INTO shop_area VALUES ('4792', '甘谷县', '452', '0', '3');
INSERT INTO shop_area VALUES ('4793', '秦安县', '452', '0', '3');
INSERT INTO shop_area VALUES ('4794', '秦州区', '452', '0', '3');
INSERT INTO shop_area VALUES ('4795', '麦积区', '452', '0', '3');
INSERT INTO shop_area VALUES ('4796', '凉州区', '453', '0', '3');
INSERT INTO shop_area VALUES ('4797', '古浪县', '453', '0', '3');
INSERT INTO shop_area VALUES ('4798', '天祝藏族自治县', '453', '0', '3');
INSERT INTO shop_area VALUES ('4799', '民勤县', '453', '0', '3');
INSERT INTO shop_area VALUES ('4800', '临泽县', '454', '0', '3');
INSERT INTO shop_area VALUES ('4801', '山丹县', '454', '0', '3');
INSERT INTO shop_area VALUES ('4802', '民乐县', '454', '0', '3');
INSERT INTO shop_area VALUES ('4803', '甘州区', '454', '0', '3');
INSERT INTO shop_area VALUES ('4804', '肃南裕固族自治县', '454', '0', '3');
INSERT INTO shop_area VALUES ('4805', '高台县', '454', '0', '3');
INSERT INTO shop_area VALUES ('4806', '华亭县', '455', '0', '3');
INSERT INTO shop_area VALUES ('4807', '崆峒区', '455', '0', '3');
INSERT INTO shop_area VALUES ('4808', '崇信县', '455', '0', '3');
INSERT INTO shop_area VALUES ('4809', '庄浪县', '455', '0', '3');
INSERT INTO shop_area VALUES ('4810', '泾川县', '455', '0', '3');
INSERT INTO shop_area VALUES ('4811', '灵台县', '455', '0', '3');
INSERT INTO shop_area VALUES ('4812', '静宁县', '455', '0', '3');
INSERT INTO shop_area VALUES ('4813', '敦煌市', '456', '0', '3');
INSERT INTO shop_area VALUES ('4814', '玉门市', '456', '0', '3');
INSERT INTO shop_area VALUES ('4815', '瓜州县（原安西县）', '456', '0', '3');
INSERT INTO shop_area VALUES ('4816', '肃北蒙古族自治县', '456', '0', '3');
INSERT INTO shop_area VALUES ('4817', '肃州区', '456', '0', '3');
INSERT INTO shop_area VALUES ('4818', '金塔县', '456', '0', '3');
INSERT INTO shop_area VALUES ('4819', '阿克塞哈萨克族自治县', '456', '0', '3');
INSERT INTO shop_area VALUES ('4820', '华池县', '457', '0', '3');
INSERT INTO shop_area VALUES ('4821', '合水县', '457', '0', '3');
INSERT INTO shop_area VALUES ('4822', '宁县', '457', '0', '3');
INSERT INTO shop_area VALUES ('4823', '庆城县', '457', '0', '3');
INSERT INTO shop_area VALUES ('4824', '正宁县', '457', '0', '3');
INSERT INTO shop_area VALUES ('4825', '环县', '457', '0', '3');
INSERT INTO shop_area VALUES ('4826', '西峰区', '457', '0', '3');
INSERT INTO shop_area VALUES ('4827', '镇原县', '457', '0', '3');
INSERT INTO shop_area VALUES ('4828', '临洮县', '458', '0', '3');
INSERT INTO shop_area VALUES ('4829', '安定区', '458', '0', '3');
INSERT INTO shop_area VALUES ('4830', '岷县', '458', '0', '3');
INSERT INTO shop_area VALUES ('4831', '渭源县', '458', '0', '3');
INSERT INTO shop_area VALUES ('4832', '漳县', '458', '0', '3');
INSERT INTO shop_area VALUES ('4833', '通渭县', '458', '0', '3');
INSERT INTO shop_area VALUES ('4834', '陇西县', '458', '0', '3');
INSERT INTO shop_area VALUES ('4835', '两当县', '459', '0', '3');
INSERT INTO shop_area VALUES ('4836', '宕昌县', '459', '0', '3');
INSERT INTO shop_area VALUES ('4837', '康县', '459', '0', '3');
INSERT INTO shop_area VALUES ('4838', '徽县', '459', '0', '3');
INSERT INTO shop_area VALUES ('4839', '成县', '459', '0', '3');
INSERT INTO shop_area VALUES ('4840', '文县', '459', '0', '3');
INSERT INTO shop_area VALUES ('4841', '武都区', '459', '0', '3');
INSERT INTO shop_area VALUES ('4842', '礼县', '459', '0', '3');
INSERT INTO shop_area VALUES ('4843', '西和县', '459', '0', '3');
INSERT INTO shop_area VALUES ('4844', '东乡族自治县', '460', '0', '3');
INSERT INTO shop_area VALUES ('4845', '临夏县', '460', '0', '3');
INSERT INTO shop_area VALUES ('4846', '临夏市', '460', '0', '3');
INSERT INTO shop_area VALUES ('4847', '和政县', '460', '0', '3');
INSERT INTO shop_area VALUES ('4848', '广河县', '460', '0', '3');
INSERT INTO shop_area VALUES ('4849', '康乐县', '460', '0', '3');
INSERT INTO shop_area VALUES ('4850', '永靖县', '460', '0', '3');
INSERT INTO shop_area VALUES ('4851', '积石山保安族东乡族撒拉族自治县', '460', '0', '3');
INSERT INTO shop_area VALUES ('4852', '临潭县', '461', '0', '3');
INSERT INTO shop_area VALUES ('4853', '卓尼县', '461', '0', '3');
INSERT INTO shop_area VALUES ('4854', '合作市', '461', '0', '3');
INSERT INTO shop_area VALUES ('4855', '夏河县', '461', '0', '3');
INSERT INTO shop_area VALUES ('4856', '玛曲县', '461', '0', '3');
INSERT INTO shop_area VALUES ('4857', '碌曲县', '461', '0', '3');
INSERT INTO shop_area VALUES ('4858', '舟曲县', '461', '0', '3');
INSERT INTO shop_area VALUES ('4859', '迭部县', '461', '0', '3');
INSERT INTO shop_area VALUES ('4860', '城东区', '462', '0', '3');
INSERT INTO shop_area VALUES ('4861', '城中区', '462', '0', '3');
INSERT INTO shop_area VALUES ('4862', '城北区', '462', '0', '3');
INSERT INTO shop_area VALUES ('4863', '城西区', '462', '0', '3');
INSERT INTO shop_area VALUES ('4864', '大通回族土族自治县', '462', '0', '3');
INSERT INTO shop_area VALUES ('4865', '湟中县', '462', '0', '3');
INSERT INTO shop_area VALUES ('4866', '湟源县', '462', '0', '3');
INSERT INTO shop_area VALUES ('4867', '乐都县', '463', '0', '3');
INSERT INTO shop_area VALUES ('4868', '互助土族自治县', '463', '0', '3');
INSERT INTO shop_area VALUES ('4869', '化隆回族自治县', '463', '0', '3');
INSERT INTO shop_area VALUES ('4870', '平安县', '463', '0', '3');
INSERT INTO shop_area VALUES ('4871', '循化撒拉族自治县', '463', '0', '3');
INSERT INTO shop_area VALUES ('4872', '民和回族土族自治县', '463', '0', '3');
INSERT INTO shop_area VALUES ('4873', '刚察县', '464', '0', '3');
INSERT INTO shop_area VALUES ('4874', '海晏县', '464', '0', '3');
INSERT INTO shop_area VALUES ('4875', '祁连县', '464', '0', '3');
INSERT INTO shop_area VALUES ('4876', '门源回族自治县', '464', '0', '3');
INSERT INTO shop_area VALUES ('4877', '同仁县', '465', '0', '3');
INSERT INTO shop_area VALUES ('4878', '尖扎县', '465', '0', '3');
INSERT INTO shop_area VALUES ('4879', '河南蒙古族自治县', '465', '0', '3');
INSERT INTO shop_area VALUES ('4880', '泽库县', '465', '0', '3');
INSERT INTO shop_area VALUES ('4881', '共和县', '466', '0', '3');
INSERT INTO shop_area VALUES ('4882', '兴海县', '466', '0', '3');
INSERT INTO shop_area VALUES ('4883', '同德县', '466', '0', '3');
INSERT INTO shop_area VALUES ('4884', '贵南县', '466', '0', '3');
INSERT INTO shop_area VALUES ('4885', '贵德县', '466', '0', '3');
INSERT INTO shop_area VALUES ('4886', '久治县', '467', '0', '3');
INSERT INTO shop_area VALUES ('4887', '玛多县', '467', '0', '3');
INSERT INTO shop_area VALUES ('4888', '玛沁县', '467', '0', '3');
INSERT INTO shop_area VALUES ('4889', '班玛县', '467', '0', '3');
INSERT INTO shop_area VALUES ('4890', '甘德县', '467', '0', '3');
INSERT INTO shop_area VALUES ('4891', '达日县', '467', '0', '3');
INSERT INTO shop_area VALUES ('4892', '囊谦县', '468', '0', '3');
INSERT INTO shop_area VALUES ('4893', '曲麻莱县', '468', '0', '3');
INSERT INTO shop_area VALUES ('4894', '杂多县', '468', '0', '3');
INSERT INTO shop_area VALUES ('4895', '治多县', '468', '0', '3');
INSERT INTO shop_area VALUES ('4896', '玉树县', '468', '0', '3');
INSERT INTO shop_area VALUES ('4897', '称多县', '468', '0', '3');
INSERT INTO shop_area VALUES ('4898', '乌兰县', '469', '0', '3');
INSERT INTO shop_area VALUES ('4899', '冷湖行委', '469', '0', '3');
INSERT INTO shop_area VALUES ('4900', '大柴旦行委', '469', '0', '3');
INSERT INTO shop_area VALUES ('4901', '天峻县', '469', '0', '3');
INSERT INTO shop_area VALUES ('4902', '德令哈市', '469', '0', '3');
INSERT INTO shop_area VALUES ('4903', '格尔木市', '469', '0', '3');
INSERT INTO shop_area VALUES ('4904', '茫崖行委', '469', '0', '3');
INSERT INTO shop_area VALUES ('4905', '都兰县', '469', '0', '3');
INSERT INTO shop_area VALUES ('4906', '兴庆区', '470', '0', '3');
INSERT INTO shop_area VALUES ('4907', '永宁县', '470', '0', '3');
INSERT INTO shop_area VALUES ('4908', '灵武市', '470', '0', '3');
INSERT INTO shop_area VALUES ('4909', '西夏区', '470', '0', '3');
INSERT INTO shop_area VALUES ('4910', '贺兰县', '470', '0', '3');
INSERT INTO shop_area VALUES ('4911', '金凤区', '470', '0', '3');
INSERT INTO shop_area VALUES ('4912', '大武口区', '471', '0', '3');
INSERT INTO shop_area VALUES ('4913', '平罗县', '471', '0', '3');
INSERT INTO shop_area VALUES ('4914', '惠农区', '471', '0', '3');
INSERT INTO shop_area VALUES ('4915', '利通区', '472', '0', '3');
INSERT INTO shop_area VALUES ('4916', '同心县', '472', '0', '3');
INSERT INTO shop_area VALUES ('4917', '盐池县', '472', '0', '3');
INSERT INTO shop_area VALUES ('4918', '青铜峡市', '472', '0', '3');
INSERT INTO shop_area VALUES ('4919', '原州区', '473', '0', '3');
INSERT INTO shop_area VALUES ('4920', '彭阳县', '473', '0', '3');
INSERT INTO shop_area VALUES ('4921', '泾源县', '473', '0', '3');
INSERT INTO shop_area VALUES ('4922', '西吉县', '473', '0', '3');
INSERT INTO shop_area VALUES ('4923', '隆德县', '473', '0', '3');
INSERT INTO shop_area VALUES ('4924', '中宁县', '474', '0', '3');
INSERT INTO shop_area VALUES ('4925', '沙坡头区', '474', '0', '3');
INSERT INTO shop_area VALUES ('4926', '海原县', '474', '0', '3');
INSERT INTO shop_area VALUES ('4927', '东山区', '475', '0', '3');
INSERT INTO shop_area VALUES ('4928', '乌鲁木齐县', '475', '0', '3');
INSERT INTO shop_area VALUES ('4929', '天山区', '475', '0', '3');
INSERT INTO shop_area VALUES ('4930', '头屯河区', '475', '0', '3');
INSERT INTO shop_area VALUES ('4931', '新市区', '475', '0', '3');
INSERT INTO shop_area VALUES ('4932', '水磨沟区', '475', '0', '3');
INSERT INTO shop_area VALUES ('4933', '沙依巴克区', '475', '0', '3');
INSERT INTO shop_area VALUES ('4934', '达坂城区', '475', '0', '3');
INSERT INTO shop_area VALUES ('4935', '乌尔禾区', '476', '0', '3');
INSERT INTO shop_area VALUES ('4936', '克拉玛依区', '476', '0', '3');
INSERT INTO shop_area VALUES ('4937', '独山子区', '476', '0', '3');
INSERT INTO shop_area VALUES ('4938', '白碱滩区', '476', '0', '3');
INSERT INTO shop_area VALUES ('4939', '吐鲁番市', '477', '0', '3');
INSERT INTO shop_area VALUES ('4940', '托克逊县', '477', '0', '3');
INSERT INTO shop_area VALUES ('4941', '鄯善县', '477', '0', '3');
INSERT INTO shop_area VALUES ('4942', '伊吾县', '478', '0', '3');
INSERT INTO shop_area VALUES ('4943', '哈密市', '478', '0', '3');
INSERT INTO shop_area VALUES ('4944', '巴里坤哈萨克自治县', '478', '0', '3');
INSERT INTO shop_area VALUES ('4945', '吉木萨尔县', '479', '0', '3');
INSERT INTO shop_area VALUES ('4946', '呼图壁县', '479', '0', '3');
INSERT INTO shop_area VALUES ('4947', '奇台县', '479', '0', '3');
INSERT INTO shop_area VALUES ('4948', '昌吉市', '479', '0', '3');
INSERT INTO shop_area VALUES ('4949', '木垒哈萨克自治县', '479', '0', '3');
INSERT INTO shop_area VALUES ('4950', '玛纳斯县', '479', '0', '3');
INSERT INTO shop_area VALUES ('4951', '米泉市', '479', '0', '3');
INSERT INTO shop_area VALUES ('4952', '阜康市', '479', '0', '3');
INSERT INTO shop_area VALUES ('4953', '博乐市', '480', '0', '3');
INSERT INTO shop_area VALUES ('4954', '温泉县', '480', '0', '3');
INSERT INTO shop_area VALUES ('4955', '精河县', '480', '0', '3');
INSERT INTO shop_area VALUES ('4956', '博湖县', '481', '0', '3');
INSERT INTO shop_area VALUES ('4957', '和硕县', '481', '0', '3');
INSERT INTO shop_area VALUES ('4958', '和静县', '481', '0', '3');
INSERT INTO shop_area VALUES ('4959', '尉犁县', '481', '0', '3');
INSERT INTO shop_area VALUES ('4960', '库尔勒市', '481', '0', '3');
INSERT INTO shop_area VALUES ('4961', '焉耆回族自治县', '481', '0', '3');
INSERT INTO shop_area VALUES ('4962', '若羌县', '481', '0', '3');
INSERT INTO shop_area VALUES ('4963', '轮台县', '481', '0', '3');
INSERT INTO shop_area VALUES ('4964', '乌什县', '482', '0', '3');
INSERT INTO shop_area VALUES ('4965', '库车县', '482', '0', '3');
INSERT INTO shop_area VALUES ('4966', '拜城县', '482', '0', '3');
INSERT INTO shop_area VALUES ('4967', '新和县', '482', '0', '3');
INSERT INTO shop_area VALUES ('4968', '柯坪县', '482', '0', '3');
INSERT INTO shop_area VALUES ('4969', '沙雅县', '482', '0', '3');
INSERT INTO shop_area VALUES ('4970', '温宿县', '482', '0', '3');
INSERT INTO shop_area VALUES ('4971', '阿克苏市', '482', '0', '3');
INSERT INTO shop_area VALUES ('4972', '阿瓦提县', '482', '0', '3');
INSERT INTO shop_area VALUES ('4973', '乌恰县', '483', '0', '3');
INSERT INTO shop_area VALUES ('4974', '阿克陶县', '483', '0', '3');
INSERT INTO shop_area VALUES ('4975', '阿合奇县', '483', '0', '3');
INSERT INTO shop_area VALUES ('4976', '阿图什市', '483', '0', '3');
INSERT INTO shop_area VALUES ('4977', '伽师县', '484', '0', '3');
INSERT INTO shop_area VALUES ('4978', '叶城县', '484', '0', '3');
INSERT INTO shop_area VALUES ('4979', '喀什市', '484', '0', '3');
INSERT INTO shop_area VALUES ('4980', '塔什库尔干塔吉克自治县', '484', '0', '3');
INSERT INTO shop_area VALUES ('4981', '岳普湖县', '484', '0', '3');
INSERT INTO shop_area VALUES ('4982', '巴楚县', '484', '0', '3');
INSERT INTO shop_area VALUES ('4983', '泽普县', '484', '0', '3');
INSERT INTO shop_area VALUES ('4984', '疏勒县', '484', '0', '3');
INSERT INTO shop_area VALUES ('4985', '疏附县', '484', '0', '3');
INSERT INTO shop_area VALUES ('4986', '英吉沙县', '484', '0', '3');
INSERT INTO shop_area VALUES ('4987', '莎车县', '484', '0', '3');
INSERT INTO shop_area VALUES ('4988', '麦盖提县', '484', '0', '3');
INSERT INTO shop_area VALUES ('4989', '于田县', '485', '0', '3');
INSERT INTO shop_area VALUES ('4990', '和田县', '485', '0', '3');
INSERT INTO shop_area VALUES ('4991', '和田市', '485', '0', '3');
INSERT INTO shop_area VALUES ('4992', '墨玉县', '485', '0', '3');
INSERT INTO shop_area VALUES ('4993', '民丰县', '485', '0', '3');
INSERT INTO shop_area VALUES ('4994', '洛浦县', '485', '0', '3');
INSERT INTO shop_area VALUES ('4995', '皮山县', '485', '0', '3');
INSERT INTO shop_area VALUES ('4996', '策勒县', '485', '0', '3');
INSERT INTO shop_area VALUES ('4997', '伊宁县', '486', '0', '3');
INSERT INTO shop_area VALUES ('4998', '伊宁市', '486', '0', '3');
INSERT INTO shop_area VALUES ('4999', '奎屯市', '486', '0', '3');
INSERT INTO shop_area VALUES ('5000', '察布查尔锡伯自治县', '486', '0', '3');
INSERT INTO shop_area VALUES ('5001', '尼勒克县', '486', '0', '3');
INSERT INTO shop_area VALUES ('5002', '巩留县', '486', '0', '3');
INSERT INTO shop_area VALUES ('5003', '新源县', '486', '0', '3');
INSERT INTO shop_area VALUES ('5004', '昭苏县', '486', '0', '3');
INSERT INTO shop_area VALUES ('5005', '特克斯县', '486', '0', '3');
INSERT INTO shop_area VALUES ('5006', '霍城县', '486', '0', '3');
INSERT INTO shop_area VALUES ('5007', '乌苏市', '487', '0', '3');
INSERT INTO shop_area VALUES ('5008', '和布克赛尔蒙古自治县', '487', '0', '3');
INSERT INTO shop_area VALUES ('5009', '塔城市', '487', '0', '3');
INSERT INTO shop_area VALUES ('5010', '托里县', '487', '0', '3');
INSERT INTO shop_area VALUES ('5011', '沙湾县', '487', '0', '3');
INSERT INTO shop_area VALUES ('5012', '裕民县', '487', '0', '3');
INSERT INTO shop_area VALUES ('5013', '额敏县', '487', '0', '3');
INSERT INTO shop_area VALUES ('5014', '吉木乃县', '488', '0', '3');
INSERT INTO shop_area VALUES ('5015', '哈巴河县', '488', '0', '3');
INSERT INTO shop_area VALUES ('5016', '富蕴县', '488', '0', '3');
INSERT INTO shop_area VALUES ('5017', '布尔津县', '488', '0', '3');
INSERT INTO shop_area VALUES ('5018', '福海县', '488', '0', '3');
INSERT INTO shop_area VALUES ('5019', '阿勒泰市', '488', '0', '3');
INSERT INTO shop_area VALUES ('5020', '青河县', '488', '0', '3');
INSERT INTO shop_area VALUES ('5021', '石河子市', '489', '0', '3');
INSERT INTO shop_area VALUES ('5022', '阿拉尔市', '490', '0', '3');
INSERT INTO shop_area VALUES ('5023', '图木舒克市', '491', '0', '3');
INSERT INTO shop_area VALUES ('5024', '五家渠市', '492', '0', '3');

-- ----------------------------
-- Table structure for `shop_article`
-- ----------------------------
DROP TABLE IF EXISTS `shop_article`;
CREATE TABLE `shop_article` (
  `article_id` int(11) NOT NULL auto_increment COMMENT '索引id',
  `ac_id` int(11) default NULL COMMENT '分类id',
  `article_url` varchar(100) default NULL COMMENT '跳转链接',
  `article_show` tinyint(1) unsigned NOT NULL default '1' COMMENT '是否显示，0为否，1为是，默认为1',
  `article_sort` tinyint(3) unsigned NOT NULL default '255' COMMENT '排序',
  `article_title` varchar(100) default NULL COMMENT '标题',
  `article_content` text COMMENT '内容',
  `article_time` int(10) unsigned NOT NULL default '0' COMMENT '发布时间',
  PRIMARY KEY  (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_article
-- ----------------------------
INSERT INTO shop_article VALUES ('6', '2', '', '1', '255', '如何注册成为会员', '<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:24px;color:#003399;font-family:Microsoft YaHei;background-color:#ffffff;\"><span style=\"font-size:18px;\">登录商城首页，点击页面右上方“注册”</span></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span lang=\"EN-US\" style=\"font-size:9pt;color:red;line-height:115%;font-family:Calibri;mso-bidi-font-size:8.0pt;mso-fareast-font-family:宋体;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><?xml:namespace prefix = v ns = \"urn:schemas-microsoft-com:vml\" /><v:shapetype id=\"_x0000_t75\" coordsize=\"21600,21600\" o:spt=\"75\" o:preferrelative=\"t\" path=\"m@4@5l@4@11@9@11@9@5xe\" stroked=\"f\" filled=\"f\"><span style=\"font-size:24px;\">&nbsp;</span><img alt=\"\" src=\"./upload/editor/20110128134626_62236.jpg\" border=\"0\" /></v:shapetype></span></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span lang=\"EN-US\" style=\"font-size:9pt;color:red;line-height:115%;font-family:Calibri;mso-bidi-font-size:8.0pt;mso-fareast-font-family:宋体;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><v:shapetype coordsize=\"21600,21600\" o:spt=\"75\" o:preferrelative=\"t\" path=\"m@4@5l@4@11@9@11@9@5xe\" stroked=\"f\" filled=\"f\"><span style=\"font-size:24px;\">&nbsp;</span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;\"><span style=\"font-size:small;color:#003399;\"><span style=\"font-size:18px;\">进入注册页面，填写相关信息并阅读用户服务手册</span></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;\"><span style=\"font-size:small;color:#335a89;\"><img alt=\"\" src=\"./upload/editor/20110128135022_79350.jpg\" border=\"0\" /></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;\"><span style=\"font-size:small;color:#003399;\"><span style=\"font-size:18px;\">相关资料填写完成后点击“免费注册”提交</span></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;\"><span style=\"font-size:small;color:#003399;\"><img alt=\"\" src=\"./upload/editor/20110128135237_43758.jpg\" border=\"0\" /></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;\"><span style=\"font-size:small;color:#003399;\"><span style=\"font-size:18px;\">提示注册成功</span></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;\"><span style=\"font-size:small;color:#003399;\"><img alt=\"\" src=\"./upload/editor/20110128135406_55835.jpg\" border=\"0\" /></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3>&nbsp;</h3>\r\n</v:shapetype></span></span></span>', '1294709136');
INSERT INTO shop_article VALUES ('7', '2', '', '1', '255', '如何搜索', '<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:24px;color:#003399;font-family:Microsoft YaHei;background-color:#ffffff;\"><span style=\"font-size:18px;\">登录商城首页，在搜索商品的搜索框内填入要搜索的商品的关键字，点击“搜索”</span></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:24px;color:#003399;font-family:Microsoft YaHei;background-color:#ffffff;\"><span style=\"font-size:18px;\"><img alt=\"\" src=\"./upload/editor/20110208093142_97861.jpg\" border=\"0\" /></span></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:24px;color:#003399;font-family:Microsoft YaHei;background-color:#ffffff;\"><span style=\"font-size:18px;\">出现含有关键字的商品页面</span></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:24px;color:#003399;font-family:Microsoft YaHei;background-color:#ffffff;\"><span style=\"font-size:18px;\"><img alt=\"\" src=\"./upload/editor/20110208094130_68431.jpg\" border=\"0\" width=\"700px\" /></span></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>', '1294709301');
INSERT INTO shop_article VALUES ('8', '2', '', '1', '255', '忘记密码', '<span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\"> <h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\">进入会员登录页面，点击“忘记密码”</span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110208095308_38085.jpg\" border=\"0\" /></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"> <h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\">在忘记密码页面中填写用户名、电子邮箱等信息，点击“提交找回”</span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110208095715_55839.jpg\" border=\"0\" /></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:x-small;color:#ff0000;\">电子邮箱地址要填写注册用户名是的邮箱</span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"color:#003399;\">提示电子邮件已发送成功</span></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110208095945_10374.jpg\" border=\"0\" /></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:SimSun;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\">登录电子邮箱查看，找回密码</span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:SimSun;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><img alt=\"\" src=\"./upload/editor/20110208100610_22468.jpg\" border=\"0\" /></span></span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n</span></h3>\r\n</span></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n</span></span></span>', '1294709313');
INSERT INTO shop_article VALUES ('9', '2', '', '1', '255', '我要买', '<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\">会员登陆商城首页，打开商品信息页面</span></span></span></p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\"><img alt=\"\" src=\"./upload/editor/20110208170115_29919.jpg\" border=\"0\" width=\"700px\" /></span></span></span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\">填写购买数量，点击“加入购物车”</span></span></span></p>\r\n<p></p>\r\n<p><img alt=\"\" src=\"./upload/editor/20110209093017_89659.jpg\" border=\"0\" /></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\">点击“查看购物车”</span></span></span></p>\r\n<p><img alt=\"\" src=\"./upload/editor/20110209093309_99011.jpg\" border=\"0\" /></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\">点击“填写并确认订单”</span></span></span></p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\"><img alt=\"\" src=\"./upload/editor/20110209093721_30123.jpg\" border=\"0\" width=\"700px\" /></span></span></span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\">填写信息，点击“下单完成并支付”</span></span></span></p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\"><img alt=\"\" src=\"./upload/editor/20110209093819_87401.jpg\" border=\"0\" width=\"700px\" /></span></span></span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\"><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\">选择支付方式，点击“确认支付”</span></span></span></span></span></span></p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\"><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\"><img alt=\"\" src=\"./upload/editor/20110209094020_49119.jpg\" border=\"0\" width=\"700px\" /></span></span></span></span></span></span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\"><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\">购买商品成功</span></span></span></span></span></span></p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\"><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\"><img alt=\"\" src=\"./upload/editor/20110209094145_20766.jpg\" border=\"0\" width=\"700px\"/></span></span></span></span></span></span></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '1294709365');
INSERT INTO shop_article VALUES ('10', '2', '', '1', '255', '查看已购买商品', '<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\">会员登录商城，进入用户中心</span></span></span></p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\"><img alt=\"\" src=\"./upload/editor/20110209094358_99646.jpg\" border=\"0\" /></span></span></span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\">在我是买家板块点进“我的订单”进入，则可查看已购买宝贝</span></span></span></p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"color:#003399;\"><img alt=\"\" src=\"./upload/editor/20110209094502_62272.jpg\" border=\"0\" width=\"700px\"/></span></span></span></p>', '1294709380');
INSERT INTO shop_article VALUES ('11', '3', '', '1', '255', '如何管理店铺', '<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">会员登陆商城进入用户中心，在我是卖家板块找到“店铺设置”点击</span></span></span></span></span></span></p>\r\n<p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><img alt=\"\" src=\"./upload/editor/20110209101544_91746.jpg\" border=\"0\" /></span></span></span></span></span></span></p>\r\n<span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">填写店铺信息后点击“提交”</span></span></span></p>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"></h3>\r\n<h3 style=\"margin:15pt 0cm 0pt;\"><img alt=\"\" src=\"./upload/editor/20110209132805_31517.jpg\" border=\"0\" /></h3>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">点击我的店铺首页可查看设置后的首页</span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><img alt=\"\" src=\"./upload/editor/20110209133004_49592.jpg\" border=\"0\" /></span></span></span></p>\r\n</span></span></span></span></span></span> <p><span style=\"font-family:SimSun;\"><span style=\"font-size:18px;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin:10pt 0cm;\"><span style=\"font-size:x-small;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span lang=\"EN-US\" style=\"font-size:10pt;line-height:115%;font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:Times New Roman;mso-bidi-font-size:10.5pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><?xml:namespace prefix = v /><v:shapetype stroked=\"f\" filled=\"f\" path=\"m@4@5l@4@11@9@11@9@5xe\" o:preferrelative=\"t\" o:spt=\"75\" coordsize=\"21600,21600\"></v:shapetype></span></span></span></span>&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin:10pt 0cm;\"><span style=\"font-size:x-small;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span lang=\"EN-US\" style=\"font-size:10pt;line-height:115%;font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:Times New Roman;mso-bidi-font-size:10.5pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><v:shapetype stroked=\"f\" filled=\"f\" path=\"m@4@5l@4@11@9@11@9@5xe\" o:preferrelative=\"t\" o:spt=\"75\" coordsize=\"21600,21600\"><span style=\"color:#000000;\"><?xml:namespace prefix = v ns = \"urn:schemas-microsoft-com:vml\" /><v:stroke joinstyle=\"miter\"></v:stroke></span><v:formulas><v:f eqn=\"if lineDrawn pixelLineWidth 0\"></v:f><v:f eqn=\"sum @0 1 0\"></v:f><v:f eqn=\"sum 0 0 @1\"></v:f><v:f eqn=\"prod @2 1 2\"></v:f><v:f eqn=\"prod @3 21600 pixelWidth\"></v:f><v:f eqn=\"prod @3 21600 pixelHeight\"></v:f><v:f eqn=\"sum @0 0 1\"></v:f><v:f eqn=\"prod @6 1 2\"></v:f><v:f eqn=\"prod @7 21600 pixelWidth\"></v:f><v:f eqn=\"sum @8 21600 0\"></v:f><v:f eqn=\"prod @7 21600 pixelHeight\"></v:f><v:f eqn=\"sum @10 21600 0\"></v:f></v:formulas><v:path o:connecttype=\"rect\" gradientshapeok=\"t\" o:extrusionok=\"f\"></v:path><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /><o:lock aspectratio=\"t\" v:ext=\"edit\"></o:lock></v:shapetype></span></span></span></span>&nbsp;</p>\r\n</span></span></span>', '1294709442');
INSERT INTO shop_article VALUES ('12', '3', '', '1', '255', '查看售出商品', '<span style=\"font-size:18px;color:#003399;font-family:SimSun;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">会员登陆商城进入用户中心，在我是卖家板块找到“订单管理”点击</span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><img alt=\"\" src=\"./upload/editor/20110209141334_26280.jpg\" border=\"0\" /></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">点击“查看订单”</span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><img alt=\"\" src=\"./upload/editor/20110209143053_56888.jpg\" border=\"0\" /></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n</span>', '1294709506');
INSERT INTO shop_article VALUES ('13', '3', '', '1', '255', '如何发货', '<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">在所有订单列表页面，点击“收到货款”</span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><img alt=\"\" src=\"./upload/editor/20110209144219_67019.jpg\" border=\"0\" /></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:SimSun;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\">填写操作描述，点击“确定”</span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:SimSun;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110209144319_11772.jpg\" border=\"0\" /></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<span style=\"font-family:SimSun;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"color:#335a89;font-size:small;\">在所有订单列表页面，点击“发货”</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110209150146_55268.jpg\" border=\"0\" /></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"color:#335a89;font-size:small;\">填写物流编号以及操作描述，点击“确定”</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110209150256_60581.jpg\" border=\"0\" /></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n</span></span> <p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n</span></span></span>', '1294709579');
INSERT INTO shop_article VALUES ('14', '3', '', '1', '255', '商城商品推荐', '<p><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-bidi-font-size:8.0pt;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\">会员登陆商城进入用户中心，在我是卖家板块找到“商品管理”点击</span></p>\r\n<p><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-bidi-font-size:8.0pt;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><img alt=\"\" src=\"./upload/editor/20110209154027_17581.jpg\" border=\"0\" /></span></p>\r\n<p>&nbsp;</p>\r\n<span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-bidi-font-size:8.0pt;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\">在商品列表中点击该商品后的“编辑”</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><img alt=\"\" src=\"./upload/editor/20110209155654_54046.jpg\" border=\"0\" /></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\">选择推荐，点击“提交”</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><img alt=\"\" src=\"./upload/editor/20110209160008_38544.jpg\" border=\"0\" /></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><img alt=\"\" src=\"./upload/editor/20110209160122_33174.jpg\" border=\"0\" /></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n</span>', '1294709599');
INSERT INTO shop_article VALUES ('15', '3', '', '1', '255', '如何申请开店', '<p><span style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\">登录商城首页，点击右上角“用户中心</span><span lang=\"EN-US\" style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;mso-fareast-font-family:宋体;\">”</span></p>\r\n<p><span lang=\"EN-US\" style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;mso-fareast-font-family:宋体;\"><img alt=\"\" src=\"./upload/editor/20110209162925_19705.jpg\" border=\"0\" /></span></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><span lang=\"EN-US\" style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;mso-fareast-font-family:宋体;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\">会员进入用户中心页面，点击下方</span><span style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\">“申请开店”</span></span></span></p>\r\n<p><span lang=\"EN-US\" style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;mso-fareast-font-family:宋体;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><img alt=\"\" src=\"./upload/editor/20110209163229_20901.jpg\" border=\"0\" /></span></span></span></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><span lang=\"EN-US\" style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;mso-fareast-font-family:宋体;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:宋体;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\">选择店铺类型，收费标准等，点击“立即开店”</span></span></span></span></span></p>\r\n<p><span lang=\"EN-US\" style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;mso-fareast-font-family:宋体;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:宋体;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><img alt=\"\" src=\"./upload/editor/20110209163457_37558.jpg\" border=\"0\" width=\"700px\" /></span></span></span></span></span></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><span lang=\"EN-US\" style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;mso-fareast-font-family:宋体;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:宋体;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\">填写店主店铺信息，点击“立即开店”</span></span></span></span></span></p>\r\n<p><span lang=\"EN-US\" style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;mso-fareast-font-family:宋体;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:宋体;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><img alt=\"\" src=\"./upload/editor/20110209164206_43906.jpg\" border=\"0\" /></span></span></span></span></span></p>\r\n<p>&nbsp;</p>\r\n<p><span lang=\"EN-US\" style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;mso-fareast-font-family:宋体;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:宋体;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\">提示申请开店成功</span></span></span></span></span></p>\r\n<p><span lang=\"EN-US\" style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;mso-fareast-font-family:宋体;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><span style=\"color:#000000;\"><span style=\"font-size:18px;color:#003399;font-family:宋体;mso-bidi-font-size:12.0pt;mso-ascii-font-family:Times New Roman;mso-hansi-font-family:Times New Roman;mso-bidi-font-family:Times New Roman;mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><img alt=\"\" src=\"./upload/editor/20110209164344_55309.jpg\" border=\"0\" /></span></span></span></span></span></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '1294709809');
INSERT INTO shop_article VALUES ('16', '4', '', '1', '255', '如何注册支付宝', '<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">会员登陆商城进入用户中心，在我是卖家板块找到“支付方式管理”点击</span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><img alt=\"\" src=\"./upload/editor/20110210083402_90837.jpg\" border=\"0\" /></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\">点击需要的添加的支付方式后的“安装”</span></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><img alt=\"\" src=\"./upload/editor/20110210084935_79853.jpg\" border=\"0\" /></span></span></span></span></p>\r\n<span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"> <h3 style=\"margin:15pt 0cm 0pt;\">&nbsp;</h3>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\">填写相关信息，点击“提交”</span></span></p>\r\n</span></span></span></span> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><img alt=\"\" src=\"./upload/editor/20110210085515_46504.jpg\" border=\"0\" /></span></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>', '1294709827');
INSERT INTO shop_article VALUES ('17', '4', '', '1', '255', '在线支付', '在线支付', '1294713631');
INSERT INTO shop_article VALUES ('18', '6', '', '1', '255', '会员修改密码', '<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">会员登录商城，点击右上角“用户中心”进入</span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><img alt=\"\" src=\"./upload/editor/20110210100016_71548.jpg\" border=\"0\" width=\"700px\" /></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">在我的账户板块点击“个人资料”进入</span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><img alt=\"\" src=\"./upload/editor/20110210100143_75461.jpg\" border=\"0\" /></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">在个人资料页面点击“修改密码”</span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><img alt=\"\" src=\"./upload/editor/20110210100354_81369.jpg\" border=\"0\" /></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\">填写密码口令，点击“提交”</span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;font-family:SimSun;\"><img alt=\"\" src=\"./upload/editor/20110210100612_16845.jpg\" border=\"0\" /></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>', '1294713819');
INSERT INTO shop_article VALUES ('19', '6', '', '1', '255', '会员修改个人资料', '<p><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\">会员登录商城，点击右上角“用户中心”进入</span></p>\r\n<p><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><img alt=\"\" src=\"./upload/editor/20110210100846_23142.jpg\" border=\"0\" /></span></p>\r\n<p>&nbsp;</p>\r\n<span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\">在用户中心的我的账户板块点击“个人资料”</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110210101042_74191.jpg\" border=\"0\" /></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\">也可在用户中心默认界面（账户概况）点击“编辑个人资料”</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110210101209_36181.jpg\" border=\"0\" /></span></p>\r\n<span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"> <p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\">填写个人信息资料，点击“更改头像”</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><img alt=\"\" src=\"./upload/editor/20110210101333_62566.jpg\" border=\"0\" /></span></span></p>\r\n<span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;\">进行本地上传图片更改头像</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110210101528_80109.jpg\" border=\"0\" /></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\">修改头像、填写完成个人信息后点击“保存修改”</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><img alt=\"\" src=\"./upload/editor/20110210101632_31534.jpg\" border=\"0\" /></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"color:#003399;\">完成个人信息修改</span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"color:#003399;\"><img alt=\"\" src=\"./upload/editor/20110210101732_37374.jpg\" border=\"0\" /></span></span></span></p>\r\n</span></span> <p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n</span></span> <p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n</span></span></span>', '1294713836');
INSERT INTO shop_article VALUES ('20', '6', '', '1', '255', '商品发布', '<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\">会员登陆商城进入用户中心，在我是卖家板块找到“商品管理”点击</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110210102523_43795.jpg\" border=\"0\" /></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\">在商品列表中点击“新增商品”</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110210102626_41732.jpg\" border=\"0\" /></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\">填写商品的详细信息，点击“提交”发布</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110210102729_99892.jpg\" border=\"0\" /></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\">提示添加商品成功</span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110210102812_84565.jpg\" border=\"0\" /></span></p>\r\n</span></span></span>', '1294713852');
INSERT INTO shop_article VALUES ('21', '6', '', '1', '255', '修改收货地址', '<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;\">会员登录商城进入用户中心，在我是买家板块找到“我的地址”点击进入</span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;\"><img alt=\"\" src=\"./upload/editor/20110210103254_50780.jpg\" border=\"0\" /></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;\"><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:SimSun;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\">在地址列表页面点击该地址后的“编辑”</span></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;\"><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:SimSun;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"><img alt=\"\" src=\"./upload/editor/20110210103509_39444.jpg\" border=\"0\" /></span></span></span></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><span style=\"font-size:small;color:#335a89;\"><span style=\"font-size:18px;color:#003399;\"><span style=\"font-size:18px;color:#003399;line-height:115%;font-family:SimSun;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-size:8.0pt;mso-bidi-font-family:Times New Roman;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;\"> <p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\">可对该地址的相关信息进行修改后，点击“编辑地址”保存</span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\"><img alt=\"\" src=\"./upload/editor/20110210103710_47524.jpg\" border=\"0\" /></span></p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n</span></span></span></span> <p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>\r\n<p style=\"margin:15pt 0cm 0pt;\">&nbsp;</p>', '1294713910');
INSERT INTO shop_article VALUES ('22', '7', '', '1', '255', '关于ShopNC', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 天津市网城创想科技有限责任公司位于天津市南开区，是专业从事生产管理信息化领域技术咨询和软件开发的高新技术企业。公司拥有多名技术人才和资深的行业解决方案专家。</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 公司拥有一支勇于开拓、具有战略眼光和敏锐市场判断力的市场营销队伍，一批求实敬业，追求卓越的行政管理人才，一个能征善战，技术优秀，经验丰富的开发团队。公司坚持按现代企业制度和市场规律办事，在扩大经营规模的同时，注重企业经济运行质量，在自主产品研发及承接软件项目方面获得了很强的竞争力。 我公司也积极参与国内传统企业的信息化改造，引进国际化产品开发的标准，规范软件开发流程，通过提升各层面的软件开发人才的技术素质，打造国产软件精品，目前已经开发出具有自主知识产权的网络商城软件，还在积极开发基于电子商务平台高效能、高效益的管理系统。为今后进一步开拓国内市场打下坚实的基础。公司致力于构造一个开放、发展的人才平台，积极营造追求卓越、积极奉献的工作氛围，把“以人为本”的理念落实到每一项具体工作中，为那些锋芒内敛，激情无限的业界精英提供充分的发展空间，优雅自信、从容自得的工作环境，事业雄心与生活情趣两相兼顾的生活方式。并通过每个员工不断提升自我，以自己的独特价值观对工作与生活作最准确的判断，使我们每一个员工彰显出他们出色的自我品位，独有的工作个性和卓越的创新风格，让他们时刻保持振奋、不断鼓舞内心深处的梦想，永远走在时代潮流前端。公司发展趋势 励精图治，展望未来。公司把发展产业策略与发掘人才策略紧密结合，广纳社会精英，挖掘创新潜能，以人为本，凝聚人气，努力营造和谐宽松的工作氛围，为优秀人才的脱颖而出提供机遇。公司将在深入发展软件产业的同时，通过不懈的努力，来塑造大型软件公司的辉煌形象。 </p>', '1294714215');
INSERT INTO shop_article VALUES ('23', '7', '', '1', '255', '联系我们', '<p>欢迎您对我们的站点、工作、产品和服务提出自己宝贵的意见或建议。我们将给予您及时答复。同时也欢迎您到我们公司来洽商业务。</p>\r\n<p><br />\r\n<strong>公司名称</strong>： 天津市网城创想科技有限责任公司 <br />\r\n<strong>通信地址</strong>： 天津市南开区红旗路220号慧谷大厦716-719 <br />\r\n<strong>邮政编码</strong>： 300072 <br />\r\n<strong>电话</strong>： 400-611-5098 <br />\r\n<strong>商务洽谈</strong>： 86-022-87631069 <br />\r\n<strong>传真</strong>： 86-022-87631069 <br />\r\n<strong>软件企业编号</strong>： 120193000029441 <br />\r\n<strong>软件著作权登记号</strong>： 2008SR07843 <br />\r\n<strong>ICP备案号</strong>： 津ICP备08000171号 </p>', '1294714228');
INSERT INTO shop_article VALUES ('24', '7', '', '1', '255', '招聘英才', '<dl> <h3>PHP程序员</h3>\r\n<dt>职位要求： <dd>熟悉PHP5开发语言；<br />\r\n熟悉MySQL5数据库，同时熟悉sqlserver，oracle者优先；<br />\r\n熟悉面向对象思想，MVC三层体系，至少使用过目前已知PHP框架其中一种；<br />\r\n熟悉SERVER2003/Linux操作系统，熟悉常用Linux操作命令；<br />\r\n熟悉Mysql数据库应用开发，了解Mysql的数据库配置管理、性能优化等基本操作技能；<br />\r\n熟悉jquery，smarty等常用开源软件；<br />\r\n具备良好的代码编程习惯及较强的文档编写能力；<br />\r\n具备良好的团队合作能力；<br />\r\n熟悉设计模式者优先；<br />\r\n熟悉java，c++,c#,python其中一种者优先； </dd> <dt>学历要求： <dd>大本 </dd> <dt>工作经验： <dd>一年以上 </dd> <dt>工作地点： <dd>天津 </dd></dl> <dl> <h3>网页设计（2名）</h3>\r\n<dt>岗位职责： <dd>网站UI设计、 切片以及HTML制作。 </dd> <dt>职位要求： <dd>有大型网站设计经验；有网站改版、频道建设经验者优先考虑； <br />\r\n熟练掌握photoshop,fireworks,dreamwaver等设计软件； <br />\r\n熟练运用Div+Css制作网页，符合CSS2.0-W3C标准，并掌握不同浏览器下，不同版本下CSS元素的区别；<br />\r\n熟悉网站制作流程，能运用并修改简单JavaScript类程序； <br />\r\n积极向上，有良好的人际沟通能力，良好的工作协调能力，踏实肯干的工作精神；具有良好的沟通表达能力，<br />\r\n需求判断力，团队协作能力； <br />\r\n请应聘者在简历中提供个人近期作品连接。 </dd> <dt>学历要求： <dd>专科 </dd> <dt>工作经验： <dd>一年以上 </dd> <dt>工作地点： <dd>天津 </dd></dl> <dl> <h3>方案策划（1名）</h3>\r\n<dt>职位要求： <dd>2年以上的文案编辑类相关工作经验，具备一定的文字功底，有极强的语言表达和逻辑思维能力， 能独立完成项目方案的编写，拟草各种协议。熟悉使用办公软件。 </dd> <dt>学历要求： <dd>大专以上 </dd> <dt>工作经验： <dd>一年以上 </dd> <dt>工作地点： <dd>天津 </dd></dl>', '1294714240');
INSERT INTO shop_article VALUES ('25', '7', '', '1', '255', '合作及洽谈', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ShopNC希望与服务代理商、合作伙伴并肩合作，携手开拓日益广阔的网络购物软件市场。如果您拥有好的建议，拥有丰富渠道资源、拥有众多目标客户、拥有相应的市场资源，并希望与ShopNC进行深度业务合作， 欢迎成为ShopNC业务合作伙伴，请联系。</p>\r\n<p>&nbsp;</p>\r\n<p><strong>公司名称</strong>： 天津市网城创想科技有限责任公司 <br />\r\n<strong>通信地址</strong>： 天津市南开区红旗路220号慧谷大厦716-719 <br />\r\n<strong>邮政编码</strong>： 300072 <br />\r\n<strong>电话</strong>： 400-611-5098 <br />\r\n<strong>商务洽谈</strong>： 86-022-87631069 <br />\r\n<strong>传真</strong>： 86-022-87631069 <br />\r\n</p>', '1294714257');
INSERT INTO shop_article VALUES ('26', '5', '', '1', '255', '联系卖家', '联系卖家', '1294714858');
INSERT INTO shop_article VALUES ('28', '4', '', '1', '255', '分期付款', '分期付款<br />', '1309835564');
INSERT INTO shop_article VALUES ('29', '4', '', '1', '255', '邮局汇款', '邮局汇款<br />', '1309835582');
INSERT INTO shop_article VALUES ('30', '4', '', '1', '255', '公司转账', '公司转账<br />', '1309835600');
INSERT INTO shop_article VALUES ('31', '5', '', '1', '255', '退换货政策', '退换货政策', '1309835651');
INSERT INTO shop_article VALUES ('32', '5', '', '1', '255', '退换货流程', '退换货流程', '1309835666');
INSERT INTO shop_article VALUES ('33', '5', '', '1', '255', '返修/退换货', '返修/退换货', '1309835679');
INSERT INTO shop_article VALUES ('34', '5', '', '1', '255', '退款申请', '退款申请', '1309835699');
INSERT INTO shop_article VALUES ('35', '1', 'http://www.shopnc.net/', '1', '255', '2.0版火爆销售中', '1.3版火爆销售中<br />', '1330482000');
INSERT INTO shop_article VALUES ('38', '1', '', '1', '252', '如何利用直通车让站长盈利', '<h3 style=\"font-size:16px;text-align:center;\">ShopNC商城系统1.2版本之\"直通车\"功能说明</h3>\r\n<p style=\"text-indent:2em;\">直通车是我们经过对客户习惯的深入研究而制作的一种让站长轻松盈利的模式。商家（即平台卖家用户）使用直通车进行商品营销。商家通过支付金币使商品加入直通车后能够优先显示在商品列表中商品剩余金币越多排名越靠前，并在商品名称下方显示直通车标志。商品优先显示提高了用户点击和购买机会。站长通过直通车方便了平台的推广并且实现实实在在的盈利。站长更好的为商家服务，及商家之所需，使双方都得到相应的回报。并且直通车平台实现按时间自动扣除直通车金币功能，免除了站长繁杂的操作流程。</p>\r\n<p></p>\r\n<p style=\"color:red;\">注：详细使用方法请参阅安装包内document文件夹中的相关帮助文档</p>', '1310203091');
INSERT INTO shop_article VALUES ('36', '1', '', '1', '253', '新版“广告管理”功能说明', '<h3 style=\"font-size:16px;text-align:center;\">ShopNC商城系统1.2版本之\"广告管理\"功能说明</h3>\r\n<p style=\"text-indent:2em;\">网站广告是一个站点的主要收入来源，也是站长运营网站的主要目的之一。一个功能强大，灵活自由，方便管理的广告系统是每一个站长迫切需要的。</p>\r\n<p style=\"text-indent:2em;\">ShopNC商城系统1.2版本较之前版本在广告管理这个模块上有了重大的改进，彻底颠覆了之前非常不灵活的广告系统，使站长可以自由地增减广告位，对其定价并放到网站的任何一个地方，系统提供了\"幻灯片\"、\"图片\"、\"文字\"、\"Flash\"等多种广告形式供站长选择。同时全新的广告系统也具有商户直接在线购买广告的功能（和1.2版本新增\"金币\"系统配合使用），使网站广告的购买变的非常简单、直接、便利，能极大程度地提高站长的收入。在线生成的广告统计图功能也是ShopNC商城系统1.2版本的一大特色，通过在线即时生成Flash形式的统计图表，广告主及站长可以直观地掌握广告点击率情况（系统提供了\"折线图\"、\"饼形图\"、\"柱形图\"等展示形式），同时站长在后台可以通过广告位点击率排序功能，迅速得知哪些广告位最容易被用户点击，进而调整站点的广告位价格，进一步增加站长的收入。</p>\r\n<p></p>\r\n<p style=\"color:red;\">注：详细使用方法请参阅安装包内document文件夹中的相关帮助文档</p>', '1310198494');
INSERT INTO shop_article VALUES ('37', '1', '', '1', '251', '如何扩充水印字体库', '<h3 style=\"font-size:16px;text-align:center;\">扩充水印功能字体库支持详解</h3>\r\n<p style=\"text-indent:2em;\"><b>使用方法：</b>将您下载的字体库上传到网站目录\"网站根目录\\resource\\font\\\"这个文件夹内，同时需要修改此文件夹下的font.info.php文件。例如：您下载了一个\"宋体\"字库simsun.ttf，将其放置于前面所述文件夹内，使用代码编辑工具（如EditPlus）打开font.info.php文件在其中的$fontInfo = array(\'arial\'=&gt;\'Arial\')数组后面添加宋体字库信息，\"=&gt;\"符号左边是文件名，右边是您想在网站上显示的文字信息。</p>\r\n<p style=\"text-indent:2em;\">添加后的样子如：array(\'arial\'=&gt;\'Arial\',\'simsun\'=&gt;\'宋体\')，所示。</p>\r\n<p></p>\r\n<p style=\"text-indent:2em;\">您可以在ShopNC官方网站下载字体库文件，下载地址：<a href=\"http://www.shopnc.net/downloads/product/multishop/fonts.zip\">字体库文件[fonts.zip]</a>。</p>\r\n<p></p>\r\n<p style=\"color:red;\">注：详细使用方法也可参阅安装包内upload文件夹中的readme文档</p>', '1310200272');
INSERT INTO shop_article VALUES ('40', '1', '', '1', '254', 'ShopNC官方使用提示信息', '<p style=\"text-indent:2em;\"><b>官方提示：</b>ShopNC商城系统可供站长们免费下载使用，具体安装使用协议详见安装过程中的授权协议文档。如需获得更多帮助或更多使用权限，请联系官方购买授权。</p>\r\n<p style=\"text-indent:2em;\">ShopNC开发团队力争做最适合站长运营的社区化电子商城系统，欢迎各位站长与官方联系提出您的宝贵需求建议。您的需要就是我们的动力，您的回报正是我们所做的考虑。</p>\r\n<ul style=\"line-height:150%;\">\r\n<li>官方网址：<a href=\"http://www.shopnc.net\">http://www.shopnc.net</a></li>\r\n<li>官方论坛：<a href=\"http://www.shopnc.net/bbs/\">http://www.shopnc.net/bbs/</a></li>\r\n<li>在线咨询QQ：1045269763 、921362895</li>\r\n<li>免费咨询电话：<b>400-611-5098</b></li>\r\n</ul>', '1310268647');
INSERT INTO shop_article VALUES ('39', '1', '', '1', '254', 'UCenter整合说明', '<h3 style=\"font-size:16px;text-align:center;\">ShopNC商城系统1.2版本之\"Ucenter整合\"功能说明</h3>\r\n<p style=\"text-indent:2em;\">平台之间的会员互通是站长们的一大需求，会员的互通方便站长多种不同模式的平台共同进行运营，利用各种平台之间的微妙联系增强整体平台的用户粘度和商业价值。</p>\r\n<p style=\"text-indent:2em;\">ShopNC商城系统1.2版很好的与UCenter进行了整合，实现会员的互通，方便站长进行多种模式的系统进行协调运营。在进行UCenter整合的时候需要注意以下几点：</p>\r\n<ul>\r\n<li>如果Ucenter使用的是utf8，则商城的也要用utf8的，如果用gbk版的就会出问题。</li>\r\n<li>建议在使用前就整合，因为整合成功后，原系统中的会员将不能再登录，都以Ucenter的为主。</li>\r\n<li>在商城填完信息后就能在Ucenter中看到\"通信成功\"提示，说明整合完成。</li>\r\n<li>如果出现了不能同步登录问题，可以在论坛的后台更新缓存。</li>\r\n</ul>\r\n<p></p>\r\n<p style=\"color:red;\">注：详细使用方法请参阅安装包内document文件夹中的相关帮助文档</p>', '1310262555');
INSERT INTO shop_article VALUES ('41', '2', '', '1', '255', '积分细则', '积分细则积分细则', '1322621203');
INSERT INTO shop_article VALUES ('42', '2', '', '1', '255', '积分兑换说明', '积分兑换说明积分兑换说明<br />', '1322621243');
INSERT INTO shop_article VALUES ('43', '1', '', '1', '254', '新功能使用说明', '<p>&nbsp;&nbsp;&nbsp; 新浪账号登录需要申请开通后才能在后台设置开启。</p>\r\n<p>&nbsp;&nbsp;&nbsp; 积分兑换、预存款、代金劵的使用在网站设置中可以选择是否开通相应功能。</p>\r\n<p>&nbsp;&nbsp;&nbsp; 其它的详细说明请参考安装包内document文件夹中的相关帮助文档。</p>', '1322789334');

-- ----------------------------
-- Table structure for `shop_article_class`
-- ----------------------------
DROP TABLE IF EXISTS `shop_article_class`;
CREATE TABLE `shop_article_class` (
  `ac_id` int(10) unsigned NOT NULL auto_increment COMMENT '索引ID',
  `ac_code` varchar(255) default NULL COMMENT '分类标识码',
  `ac_name` varchar(100) NOT NULL COMMENT '分类名称',
  `ac_parent_id` int(10) unsigned NOT NULL default '0' COMMENT '父ID',
  `ac_sort` tinyint(1) unsigned NOT NULL default '255' COMMENT '排序',
  PRIMARY KEY  (`ac_id`),
  KEY `ac_parent_id` (`ac_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_article_class
-- ----------------------------
INSERT INTO shop_article_class VALUES ('1', 'notice', '商城公告', '0', '255');
INSERT INTO shop_article_class VALUES ('2', 'member', '帮助中心', '0', '255');
INSERT INTO shop_article_class VALUES ('3', 'store', '店主之家', '0', '255');
INSERT INTO shop_article_class VALUES ('4', 'payment', '支付方式', '0', '255');
INSERT INTO shop_article_class VALUES ('5', 'sold', '售后服务', '0', '255');
INSERT INTO shop_article_class VALUES ('6', 'service', '客服中心', '0', '255');
INSERT INTO shop_article_class VALUES ('7', 'about', '关于我们', '0', '255');

-- ----------------------------
-- Table structure for `shop_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `shop_attribute`;
CREATE TABLE `shop_attribute` (
  `attr_id` int(10) unsigned NOT NULL auto_increment COMMENT '属性id',
  `attr_name` varchar(100) NOT NULL COMMENT '属性名称',
  `type_id` int(10) unsigned NOT NULL COMMENT '所属类型id',
  `attr_value` text NOT NULL COMMENT '属性值列',
  `attr_show` tinyint(1) unsigned NOT NULL COMMENT '是否显示。0为不显示、1为显示',
  `attr_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY  (`attr_id`),
  KEY `attr_id` (`attr_id`,`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_attribute
-- ----------------------------
INSERT INTO shop_attribute VALUES ('1', '款式', '1', '长袖,短袖,七分/五分袖,无袖,两件套,宽松', '1', '1');
INSERT INTO shop_attribute VALUES ('2', '材质', '1', '纯棉,真丝,聚酯,棉+氨伦,氨伦（卡莱）,人造棉,其他', '1', '2');
INSERT INTO shop_attribute VALUES ('3', '衣长', '1', '短款（衣长35-50CM）,中长款（衣长50-70CM）,长款（衣长70-100CM）', '1', '3');
INSERT INTO shop_attribute VALUES ('4', '质地', '3', 'PU,牛皮,帆布,羊皮,尼龙,牛津布', '1', '0');
INSERT INTO shop_attribute VALUES ('5', '箱包外形', '3', '横款方形,竖款方形,水饺形,圆桶形,箱形,枕头形', '1', '1');
INSERT INTO shop_attribute VALUES ('6', '类型', '4', '整套功夫茶具,茶杯,茶壶', '1', '0');
INSERT INTO shop_attribute VALUES ('7', '材质', '4', '紫砂,瓷,陶 , 45%以上骨粉骨瓷 ,36%以上骨粉骨瓷', '1', '1');
INSERT INTO shop_attribute VALUES ('8', '像素', '5', '1400万,1600万,1800万', '1', '1');
INSERT INTO shop_attribute VALUES ('9', '售后服务', '5', '全国联保,店铺三包', '1', '2');
INSERT INTO shop_attribute VALUES ('10', '价格区间', '4', '49.9元以下,50元-99.9元,100元-149元,150元-199元,200元-299元,300元-499元,500元以上', '1', '2');
INSERT INTO shop_attribute VALUES ('11', '推荐使用人数', '4', '2人,3人,4人,5人,6人,7-9人', '1', '0');

-- ----------------------------
-- Table structure for `shop_attribute_value`
-- ----------------------------
DROP TABLE IF EXISTS `shop_attribute_value`;
CREATE TABLE `shop_attribute_value` (
  `attr_value_id` int(10) unsigned NOT NULL auto_increment COMMENT '属性值id',
  `attr_value_name` varchar(100) NOT NULL COMMENT '属性值名称',
  `attr_id` int(10) unsigned NOT NULL COMMENT '所属属性id',
  PRIMARY KEY  (`attr_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_attribute_value
-- ----------------------------
INSERT INTO shop_attribute_value VALUES ('1', '长袖', '1');
INSERT INTO shop_attribute_value VALUES ('2', '短袖', '1');
INSERT INTO shop_attribute_value VALUES ('3', '七分/五分袖', '1');
INSERT INTO shop_attribute_value VALUES ('4', '无袖', '1');
INSERT INTO shop_attribute_value VALUES ('5', '两件套', '1');
INSERT INTO shop_attribute_value VALUES ('6', '宽松', '1');
INSERT INTO shop_attribute_value VALUES ('7', '纯棉', '2');
INSERT INTO shop_attribute_value VALUES ('8', '真丝', '2');
INSERT INTO shop_attribute_value VALUES ('9', '聚酯', '2');
INSERT INTO shop_attribute_value VALUES ('10', '棉+氨伦', '2');
INSERT INTO shop_attribute_value VALUES ('11', '氨伦（卡莱）', '2');
INSERT INTO shop_attribute_value VALUES ('12', '人造棉', '2');
INSERT INTO shop_attribute_value VALUES ('13', ' 其他', '2');
INSERT INTO shop_attribute_value VALUES ('14', '短款（衣长35-50CM）', '3');
INSERT INTO shop_attribute_value VALUES ('15', '中长款（衣长50-70CM）', '3');
INSERT INTO shop_attribute_value VALUES ('16', '长款（衣长70-100CM）', '3');
INSERT INTO shop_attribute_value VALUES ('17', 'PU', '4');
INSERT INTO shop_attribute_value VALUES ('18', '牛皮', '4');
INSERT INTO shop_attribute_value VALUES ('19', '帆布', '4');
INSERT INTO shop_attribute_value VALUES ('20', '羊皮', '4');
INSERT INTO shop_attribute_value VALUES ('21', '尼龙', '4');
INSERT INTO shop_attribute_value VALUES ('22', '牛津布', '4');
INSERT INTO shop_attribute_value VALUES ('23', '横款方形', '5');
INSERT INTO shop_attribute_value VALUES ('24', '竖款方形', '5');
INSERT INTO shop_attribute_value VALUES ('25', '水饺形', '5');
INSERT INTO shop_attribute_value VALUES ('26', '圆桶形', '5');
INSERT INTO shop_attribute_value VALUES ('27', '箱形', '5');
INSERT INTO shop_attribute_value VALUES ('28', '枕头形', '5');
INSERT INTO shop_attribute_value VALUES ('29', '整套功夫茶具', '6');
INSERT INTO shop_attribute_value VALUES ('30', '茶杯', '6');
INSERT INTO shop_attribute_value VALUES ('31', '茶壶', '6');
INSERT INTO shop_attribute_value VALUES ('32', '紫砂', '7');
INSERT INTO shop_attribute_value VALUES ('33', '瓷', '7');
INSERT INTO shop_attribute_value VALUES ('34', '陶 ', '7');
INSERT INTO shop_attribute_value VALUES ('35', ' 45%以上骨粉骨瓷 ', '7');
INSERT INTO shop_attribute_value VALUES ('36', '36%以上骨粉骨瓷', '7');
INSERT INTO shop_attribute_value VALUES ('37', '1400万', '8');
INSERT INTO shop_attribute_value VALUES ('38', '1600万', '8');
INSERT INTO shop_attribute_value VALUES ('39', '1800万', '8');
INSERT INTO shop_attribute_value VALUES ('40', '全国联保', '9');
INSERT INTO shop_attribute_value VALUES ('41', '店铺三包', '9');
INSERT INTO shop_attribute_value VALUES ('42', '49.9元以下', '10');
INSERT INTO shop_attribute_value VALUES ('43', '50元-99.9元', '10');
INSERT INTO shop_attribute_value VALUES ('44', '100元-149元', '10');
INSERT INTO shop_attribute_value VALUES ('45', '150元-199元', '10');
INSERT INTO shop_attribute_value VALUES ('46', '200元-299元', '10');
INSERT INTO shop_attribute_value VALUES ('47', '300元-499元', '10');
INSERT INTO shop_attribute_value VALUES ('48', '500元以上', '10');
INSERT INTO shop_attribute_value VALUES ('49', '2人', '11');
INSERT INTO shop_attribute_value VALUES ('50', '3人', '11');
INSERT INTO shop_attribute_value VALUES ('51', '4人', '11');
INSERT INTO shop_attribute_value VALUES ('52', '5人', '11');
INSERT INTO shop_attribute_value VALUES ('53', '6人', '11');
INSERT INTO shop_attribute_value VALUES ('54', '7-9人', '11');

-- ----------------------------
-- Table structure for `shop_brand`
-- ----------------------------
DROP TABLE IF EXISTS `shop_brand`;
CREATE TABLE `shop_brand` (
  `brand_id` int(11) NOT NULL auto_increment COMMENT '索引ID',
  `brand_name` varchar(100) default NULL COMMENT '品牌名称',
  `brand_class` varchar(100) default NULL COMMENT '类别名称',
  `brand_pic` varchar(100) default NULL COMMENT '图片',
  `brand_sort` tinyint(3) unsigned default '0' COMMENT '排序',
  `brand_recommend` tinyint(1) default '0' COMMENT '推荐，0为否，1为是，默认为0',
  `store_id` int(11) unsigned NOT NULL default '0' COMMENT '店铺ID',
  `brand_apply` tinyint(1) NOT NULL default '1' COMMENT '品牌申请，0为申请中，1为通过，默认为1，申请功能是会员使用，系统后台默认为1',
  PRIMARY KEY  (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_brand
-- ----------------------------
INSERT INTO shop_brand VALUES ('1', '耐克/Nike', '运动', '1d2dfbead590510046a6522551db8139.gif', '1', '1', '0', '1');
INSERT INTO shop_brand VALUES ('2', '阿迪达斯/adidas', '运动', 'b175883eba95e793affb1b1ebbbf85a5.gif', '2', '1', '0', '1');
INSERT INTO shop_brand VALUES ('11', '卡帕', '运动', '354b80528d2fbeefbab33c563532517e.gif', '0', '1', '0', '1');
INSERT INTO shop_brand VALUES ('10', '匡威', '运动', 'a0ac8c6d2d3dc1470d5876923182a8e2.gif', '0', '1', '0', '1');
INSERT INTO shop_brand VALUES ('9', '安踏', '运动', '6e61a1c953e5bc8c5f1ffdac36862245.gif', '0', '1', '0', '1');
INSERT INTO shop_brand VALUES ('8', '李宁/LINING', '运动', '209abd835cd2ce2208f2dc42ba10efb4.gif', '3', '1', '0', '1');
INSERT INTO shop_brand VALUES ('12', '新百伦/new balance', '运动', '9c5dee77a6ecdafd9e152fed8c6a4e90.gif', '0', '1', '0', '1');
INSERT INTO shop_brand VALUES ('13', '彪马/PUMA', '运动', 'c820846e7f95b467a4c5f86140b26c28.gif', '0', '1', '0', '1');
INSERT INTO shop_brand VALUES ('14', '锐步', '运动', '912ee9c27439242a1410680b8e6593d0.gif', '0', '1', '0', '1');
INSERT INTO shop_brand VALUES ('15', '茵宝', '运动', '26247430b09daa1b441b46008bfb6e6e.gif', '0', '1', '0', '1');

-- ----------------------------
-- Table structure for `shop_cart`
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart` (
  `cart_id` int(11) NOT NULL auto_increment COMMENT '购物车id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `spec_id` int(11) NOT NULL COMMENT '规格id',
  `spec_info` text NOT NULL COMMENT '规格内容',
  `goods_store_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` int(11) NOT NULL COMMENT '购买商品数量',
  `goods_weight` decimal(10,3) unsigned NOT NULL default '0.000' COMMENT '单个商品重量',
  `goods_images` varchar(100) NOT NULL COMMENT '商品图片',
  PRIMARY KEY  (`cart_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_complain`
-- ----------------------------
DROP TABLE IF EXISTS `shop_complain`;
CREATE TABLE `shop_complain` (
  `complain_id` int(11) NOT NULL auto_increment COMMENT '投诉id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_goods_count` int(11) NOT NULL COMMENT '订单商品数量',
  `complain_goods_count` int(11) NOT NULL COMMENT '投诉商品数量',
  `accuser_id` int(11) NOT NULL COMMENT '原告id',
  `accuser_name` varchar(50) NOT NULL COMMENT '原告名称',
  `accused_id` int(11) NOT NULL COMMENT '被告id',
  `accused_name` varchar(50) NOT NULL COMMENT '被告名称',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_id` int(11) NOT NULL COMMENT '投诉主题id',
  `complain_content` varchar(255) NOT NULL COMMENT '投诉内容',
  `complain_pic1` varchar(100) NOT NULL COMMENT '投诉图片1',
  `complain_pic2` varchar(100) NOT NULL COMMENT '投诉图片2',
  `complain_pic3` varchar(100) NOT NULL COMMENT '投诉图片3',
  `complain_datetime` int(11) NOT NULL COMMENT '投诉时间',
  `complain_handle_datetime` int(11) NOT NULL COMMENT '投诉处理时间',
  `complain_handle_member_id` int(11) NOT NULL COMMENT '投诉处理人id',
  `appeal_message` varchar(255) NOT NULL COMMENT '申诉内容',
  `appeal_datetime` int(11) NOT NULL COMMENT '申诉时间',
  `appeal_pic1` varchar(100) NOT NULL COMMENT '申诉图片1',
  `appeal_pic2` varchar(100) NOT NULL COMMENT '申诉图片2',
  `appeal_pic3` varchar(100) NOT NULL COMMENT '申诉图片3',
  `final_handle_message` varchar(255) NOT NULL COMMENT '最终处理意见',
  `final_handle_datetime` int(11) NOT NULL COMMENT '最终处理时间',
  `final_handle_member_id` int(11) NOT NULL COMMENT '最终处理人id',
  `complain_type` tinyint(4) NOT NULL COMMENT '投诉类型(1-买家投诉/2-卖家投诉)',
  `complain_state` tinyint(4) NOT NULL COMMENT '投诉状态(10-新投诉/20-投诉通过转给被投诉人/30-被投诉人已申诉/40-提交仲裁/99-已关闭)',
  `complain_active` tinyint(4) NOT NULL default '1' COMMENT '投诉是否通过平台审批(1未通过/2通过)',
  PRIMARY KEY  (`complain_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_complain
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_complain_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_complain_goods`;
CREATE TABLE `shop_complain_goods` (
  `complain_goods_id` int(11) NOT NULL auto_increment COMMENT '投诉商品序列id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `spec_id` int(11) NOT NULL COMMENT '规格id',
  `spec_info` varchar(50) NOT NULL default '' COMMENT '规格描述',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `goods_image` varchar(100) NOT NULL default '' COMMENT '商品图片',
  `evaluation` tinyint(1) NOT NULL default '0' COMMENT '评价类型: 1好评 2中评 3差评',
  `comment` varchar(255) NOT NULL default '' COMMENT '评论',
  `complain_message` varchar(100) NOT NULL COMMENT '被投诉商品的问题描述',
  PRIMARY KEY  (`complain_goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_complain_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_complain_subject`
-- ----------------------------
DROP TABLE IF EXISTS `shop_complain_subject`;
CREATE TABLE `shop_complain_subject` (
  `complain_subject_id` int(11) NOT NULL auto_increment COMMENT '举报主题id',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '举报主题',
  `complain_subject_desc` varchar(100) NOT NULL COMMENT '举报主题描述',
  `complain_subject_type` tinyint(4) NOT NULL COMMENT '举报主题类型(1-买家/2-卖家)',
  `complain_subject_state` tinyint(4) NOT NULL COMMENT '举报主题状态(1-有效/2-失效)',
  PRIMARY KEY  (`complain_subject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_complain_subject
-- ----------------------------
INSERT INTO shop_complain_subject VALUES ('7', '未收到货', '交易成功，未收到货，钱已经付给卖家，可进行维权。', '1', '1');
INSERT INTO shop_complain_subject VALUES ('8', '售后保障服务', '交易完成后30天内，在使用商品过程中，发现商品有质量问题或无法正常使用，可进行维权。', '1', '1');
INSERT INTO shop_complain_subject VALUES ('9', '未收到货款', '货物已经发出，未收到货款，商品已经寄给买家，可进行维权。', '2', '1');

-- ----------------------------
-- Table structure for `shop_complain_talk`
-- ----------------------------
DROP TABLE IF EXISTS `shop_complain_talk`;
CREATE TABLE `shop_complain_talk` (
  `talk_id` int(11) NOT NULL auto_increment COMMENT '投诉对话id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `talk_member_id` int(11) NOT NULL COMMENT '发言人id',
  `talk_member_name` varchar(50) NOT NULL COMMENT '发言人名称',
  `talk_member_type` varchar(10) NOT NULL COMMENT '发言人类型(1-投诉人/2-被投诉人/3-平台)',
  `talk_content` varchar(255) NOT NULL COMMENT '发言内容',
  `talk_state` tinyint(4) NOT NULL COMMENT '发言状态(1-显示/2-不显示)',
  `talk_admin` int(11) NOT NULL default '0' COMMENT '对话管理员，屏蔽对话人的id',
  `talk_datetime` int(11) NOT NULL COMMENT '对话发表时间',
  PRIMARY KEY  (`talk_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_complain_talk
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_consult`
-- ----------------------------
DROP TABLE IF EXISTS `shop_consult`;
CREATE TABLE `shop_consult` (
  `consult_id` int(10) unsigned NOT NULL auto_increment COMMENT '咨询编号',
  `goods_id` int(11) default '0' COMMENT '商品编号',
  `member_id` int(11) NOT NULL default '0' COMMENT '咨询发布者会员编号(0：游客)',
  `seller_id` int(11) NOT NULL COMMENT '卖家编号',
  `email` varchar(255) default NULL COMMENT '咨询发布者邮箱',
  `consult_content` varchar(4000) default NULL COMMENT '咨询内容',
  `consult_addtime` int(10) default NULL COMMENT '咨询发布时间',
  `consult_reply` varchar(4000) default NULL COMMENT '咨询回复内容',
  `consult_reply_time` int(10) default NULL COMMENT '咨询回复时间',
  `type` varchar(20) NOT NULL default 'goods' COMMENT '咨询类型',
  PRIMARY KEY  (`consult_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_consult
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `shop_coupon`;
CREATE TABLE `shop_coupon` (
  `coupon_id` int(11) NOT NULL auto_increment COMMENT 'id',
  `coupon_title` varchar(255) NOT NULL COMMENT '优惠券名称',
  `coupon_type` enum('1','2') default NULL,
  `coupon_pic` varchar(255) NOT NULL,
  `coupon_desc` varchar(1000) NOT NULL COMMENT '优惠券描述',
  `coupon_start_date` int(10) NOT NULL COMMENT '优惠券开始日期',
  `coupon_end_date` int(10) NOT NULL COMMENT '优惠券截止日期',
  `coupon_price` decimal(10,2) NOT NULL default '0.00' COMMENT '优惠金额',
  `coupon_limit` decimal(10,2) NOT NULL default '0.00' COMMENT '金额限制',
  `store_id` int(11) default NULL COMMENT '店铺id',
  `coupon_state` enum('1','2') default '1' COMMENT '上架与下架状态',
  `coupon_storage` int(11) NOT NULL default '0' COMMENT '总共数量',
  `coupon_usage` int(11) NOT NULL default '0' COMMENT '使用数量',
  `coupon_lock` enum('1','2') NOT NULL default '1' COMMENT '是否锁定',
  `coupon_add_date` int(10) NOT NULL COMMENT '添加日期',
  `coupon_class_id` int(11) NOT NULL COMMENT '分类',
  `coupon_click` int(11) NOT NULL default '1' COMMENT '点击次数',
  `coupon_print_style` varchar(255) NOT NULL default '4STYLE' COMMENT '4STYLE STANDS FOR 4 COUPONS PER A4 PAGE, AND 8STYLE STANDS FOR 8 COUPONS PER A4 PAGE',
  `coupon_recommend` tinyint(1) unsigned NOT NULL default '0' COMMENT '0不推荐 1推荐到首页',
  `coupon_allowstate` tinyint(1) unsigned default '1' COMMENT '审核状态 0为待审核 1已通过 2未通过',
  `coupon_allowremark` varchar(255) default NULL COMMENT '审核备注',
  PRIMARY KEY  (`coupon_id`),
  KEY `store_id` (`store_id`),
  KEY `coupon_title` (`coupon_title`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_coupon
-- ----------------------------
INSERT INTO shop_coupon VALUES ('1', '测试优惠券', null, 'upload/store/goods/2/16b1d78cb31053de8a4c47d2b0390d63.jpg', '', '1317398400', '1349020800', '10.00', '0.00', '2', '2', '0', '1', '1', '1317030400', '1', '11', '', '1', '1', null);
INSERT INTO shop_coupon VALUES ('2', '测试优惠券', null, 'upload/store/goods/2/ec8fbf0921243cca1be11a227c9a768e.jpg', '', '1317398400', '1349020800', '11.00', '0.00', '2', '2', '0', '0', '1', '1320768000', '1', '4', '', '1', '1', null);

-- ----------------------------
-- Table structure for `shop_coupon_class`
-- ----------------------------
DROP TABLE IF EXISTS `shop_coupon_class`;
CREATE TABLE `shop_coupon_class` (
  `class_id` int(11) NOT NULL auto_increment COMMENT '优惠券分类id',
  `class_parent_id` int(11) NOT NULL default '0' COMMENT '父类id',
  `class_name` varchar(100) NOT NULL COMMENT '分类名称',
  `class_sort` tinyint(1) unsigned NOT NULL default '0' COMMENT '排序',
  `class_show` enum('0','1') NOT NULL default '0' COMMENT '是否显示',
  PRIMARY KEY  (`class_id`),
  KEY `class_parent_id` (`class_parent_id`),
  KEY `class_sort` (`class_sort`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_coupon_class
-- ----------------------------
INSERT INTO shop_coupon_class VALUES ('1', '0', '测试分类', '99', '1');

-- ----------------------------
-- Table structure for `shop_customer_service`
-- ----------------------------
DROP TABLE IF EXISTS `shop_customer_service`;
CREATE TABLE `shop_customer_service` (
  `cs_id` int(10) unsigned NOT NULL auto_increment COMMENT 'ID',
  `cs_name` varchar(100) NOT NULL COMMENT '用户名',
  `cs_password` varchar(100) NOT NULL COMMENT '密码',
  `cs_url` varchar(255) NOT NULL COMMENT '网址',
  `cs_phone` varchar(30) NOT NULL COMMENT '电话号码',
  `cs_email` varchar(50) NOT NULL COMMENT '邮箱',
  `cs_key` varchar(49) NOT NULL COMMENT 'key',
  PRIMARY KEY  (`cs_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_customer_service
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_document`
-- ----------------------------
DROP TABLE IF EXISTS `shop_document`;
CREATE TABLE `shop_document` (
  `doc_id` int(11) NOT NULL auto_increment COMMENT 'id',
  `doc_code` varchar(255) NOT NULL COMMENT '调用标识码',
  `doc_title` varchar(255) NOT NULL COMMENT '标题',
  `doc_content` text NOT NULL COMMENT '内容',
  `doc_time` int(10) unsigned NOT NULL COMMENT '添加时间/修改时间',
  PRIMARY KEY  (`doc_id`),
  UNIQUE KEY `doc_code` (`doc_code`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_document
-- ----------------------------
INSERT INTO shop_document VALUES ('1', 'agreement', '用户服务协议', '<p>特别提醒用户认真阅读本《用户服务协议》(下称《协议》) 中各条款。除非您接受本《协议》条款，否则您无权使用本网站提供的相关服务。您的使用行为将视为对本《协议》的接受，并同意接受本《协议》各项条款的约束。 <br /> <br /> <strong>一、定义</strong><br /></p>\r\n<ol>\r\n<li>\"用户\"指符合本协议所规定的条件，同意遵守本网站各种规则、条款（包括但不限于本协议），并使用本网站的个人或机构。</li>\r\n<li>\"卖家\"是指在本网站上出售物品的用户。\"买家\"是指在本网站购买物品的用户。</li>\r\n<li>\"成交\"指买家根据卖家所刊登的交易要求，在特定时间内提出最优的交易条件，因而取得依其提出的条件购买该交易物品的权利。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>二、用户资格</strong><br /> <br /> 只有符合下列条件之一的人员或实体才能申请成为本网站用户，可以使用本网站的服务。</p>\r\n<ol>\r\n<li>年满十八岁，并具有民事权利能力和民事行为能力的自然人；</li>\r\n<li>未满十八岁，但监护人（包括但不仅限于父母）予以书面同意的自然人；</li>\r\n<li>根据中国法律或设立地法律、法规和/或规章成立并合法存在的公司、企事业单位、社团组织和其他组织。</li>\r\n</ol>\r\n<p><br /> 无民事行为能力人、限制民事行为能力人以及无经营或特定经营资格的组织不当注册为本网站用户或超过其民事权利或行为能力范围从事交易的，其与本网站之间的协议自始无效，本网站一经发现，有权立即注销该用户，并追究其使用本网站\"服务\"的一切法律责任。<br /> <br /> <strong>三.用户的权利和义务</strong><br /></p>\r\n<ol>\r\n<li>用户有权根据本协议的规定及本网站发布的相关规则，利用本网站网上交易平台登录物品、发布交易信息、查询物品信息、购买物品、与其他用户订立物品买卖合同、在本网站社区发帖、参加本网站的有关活动及有权享受本网站提供的其他的有关资讯及信息服务。</li>\r\n<li>用户有权根据需要更改密码和交易密码。用户应对以该用户名进行的所有活动和事件负全部责任。</li>\r\n<li>用户有义务确保向本网站提供的任何资料、注册信息真实准确，包括但不限于真实姓名、身份证号、联系电话、地址、邮政编码等。保证本网站及其他用户可以通过上述联系方式与自己进行联系。同时，用户也有义务在相关资料实际变更时及时更新有关注册资料。</li>\r\n<li>用户不得以任何形式擅自转让或授权他人使用自己在本网站的用户帐号。</li>\r\n<li>用户有义务确保在本网站网上交易平台上登录物品、发布的交易信息真实、准确，无误导性。</li>\r\n<li>用户不得在本网站网上交易平台买卖国家禁止销售的或限制销售的物品、不得买卖侵犯他人知识产权或其他合法权益的物品，也不得买卖违背社会公共利益或公共道德的物品。</li>\r\n<li>用户不得在本网站发布各类违法或违规信息。包括但不限于物品信息、交易信息、社区帖子、物品留言，店铺留言，评价内容等。</li>\r\n<li>用户在本网站交易中应当遵守诚实信用原则，不得以干预或操纵物品价格等不正当竞争方式扰乱网上交易秩序，不得从事与网上交易无关的不当行为，不得在交易平台上发布任何违法信息。</li>\r\n<li>用户不应采取不正当手段（包括但不限于虚假交易、互换好评等方式）提高自身或他人信用度，或采用不正当手段恶意评价其他用户，降低其他用户信用度。</li>\r\n<li>用户承诺自己在使用本网站网上交易平台实施的所有行为遵守国家法律、法规和本网站的相关规定以及各种社会公共利益或公共道德。对于任何法律后果的发生，用户将以自己的名义独立承担所有相应的法律责任。</li>\r\n<li>用户在本网站网上交易过程中如与其他用户因交易产生纠纷，可以请求本网站从中予以协调。用户如发现其他用户有违法或违反本协议的行为，可以向本网站举报。如用户因网上交易与其他用户产生诉讼的，用户有权通过司法部门要求本网站提供相关资料。</li>\r\n<li>用户应自行承担因交易产生的相关费用，并依法纳税。</li>\r\n<li>未经本网站书面允许，用户不得将本网站资料以及在交易平台上所展示的任何信息以复制、修改、翻译等形式制作衍生作品、分发或公开展示。</li>\r\n<li>用户同意接收来自本网站的信息，包括但不限于活动信息、交易信息、促销信息等。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>四、 本网站的权利和义务</strong><br /></p>\r\n<ol>\r\n<li>本网站不是传统意义上的\"拍卖商\"，仅为用户提供一个信息交流、进行物品买卖的平台，充当买卖双方之间的交流媒介，而非买主或卖主的代理商、合伙  人、雇员或雇主等经营关系人。公布在本网站上的交易物品是用户自行上传进行交易的物品，并非本网站所有。对于用户刊登物品、提供的信息或参与竞标的过程，  本网站均不加以监视或控制，亦不介入物品的交易过程，包括运送、付款、退款、瑕疵担保及其它交易事项，且不承担因交易物品存在品质、权利上的瑕疵以及交易  方履行交易协议的能力而产生的任何责任，对于出现在拍卖上的物品品质、安全性或合法性，本网站均不予保证。</li>\r\n<li>本网站有义务在现有技术水平的基础上努力确保整个网上交易平台的正常运行，尽力避免服务中断或将中断时间限制在最短时间内，保证用户网上交易活动的顺利进行。</li>\r\n<li>本网站有义务对用户在注册使用本网站网上交易平台中所遇到的问题及反映的情况及时作出回复。 </li>\r\n<li>本网站有权对用户的注册资料进行查阅，对存在任何问题或怀疑的注册资料，本网站有权发出通知询问用户并要求用户做出解释、改正，或直接做出处罚、删除等处理。</li>\r\n<li>用  户因在本网站网上交易与其他用户产生纠纷的，用户通过司法部门或行政部门依照法定程序要求本网站提供相关资料，本网站将积极配合并提供有关资料；用户将纠  纷告知本网站，或本网站知悉纠纷情况的，经审核后，本网站有权通过电子邮件及电话联系向纠纷双方了解纠纷情况，并将所了解的情况通过电子邮件互相通知对  方。 </li>\r\n<li>因网上交易平台的特殊性，本网站没有义务对所有用户的注册资料、所有的交易行为以及与交易有关的其他事项进行事先审查，但如发生以下情形，本网站有权限制用户的活动、向用户核实有关资料、发出警告通知、暂时中止、无限期地中止及拒绝向该用户提供服务：         \r\n<ul>\r\n<li>用户违反本协议或因被提及而纳入本协议的文件；</li>\r\n<li>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据，而本网站无法联系到该用户核证或验证该用户向本网站提供的任何资料；</li>\r\n<li>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据。本网站以普通非专业交易者的知识水平标准对相关内容进行判别，可以明显认为这些内容或行为可能对本网站用户或本网站造成财务损失或法律责任。 </li>\r\n</ul>\r\n</li>\r\n<li>在反网络欺诈行动中，本着保护广大用户利益的原则，当用户举报自己交易可能存在欺诈而产生交易争议时，本网站有权通过表面判断暂时冻结相关用户账号，并有权核对当事人身份资料及要求提供交易相关证明材料。</li>\r\n<li>根据国家法律法规、本协议的内容和本网站所掌握的事实依据，可以认定用户存在违法或违反本协议行为以及在本网站交易平台上的其他不当行为，本网站有权在本网站交易平台及所在网站上以网络发布形式公布用户的违法行为，并有权随时作出删除相关信息，而无须征得用户的同意。</li>\r\n<li>本  网站有权在不通知用户的前提下删除或采取其他限制性措施处理下列信息：包括但不限于以规避费用为目的；以炒作信用为目的；存在欺诈等恶意或虚假内容；与网  上交易无关或不是以交易为目的；存在恶意竞价或其他试图扰乱正常交易秩序因素；该信息违反公共利益或可能严重损害本网站和其他用户合法利益的。</li>\r\n<li>用  户授予本网站独家的、全球通用的、永久的、免费的信息许可使用权利，本网站有权对该权利进行再授权，依此授权本网站有权(全部或部份地)  使用、复制、修订、改写、发布、翻译、分发、执行和展示用户公示于网站的各类信息或制作其派生作品，以现在已知或日后开发的任何形式、媒体或技术，将上述  信息纳入其他作品内。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>五、服务的中断和终止</strong><br /></p>\r\n<ol>\r\n<li>在  本网站未向用户收取相关服务费用的情况下，本网站可自行全权决定以任何理由  (包括但不限于本网站认为用户已违反本协议的字面意义和精神，或用户在超过180天内未登录本网站等)  终止对用户的服务，并不再保存用户在本网站的全部资料（包括但不限于用户信息、商品信息、交易信息等）。同时本网站可自行全权决定，在发出通知或不发出通  知的情况下，随时停止提供全部或部分服务。服务终止后，本网站没有义务为用户保留原用户资料或与之相关的任何信息，或转发任何未曾阅读或发送的信息给用户  或第三方。此外，本网站不就终止对用户的服务而对用户或任何第三方承担任何责任。 </li>\r\n<li>如用户向本网站提出注销本网站注册用户身份，需经本网站审核同意，由本网站注销该注册用户，用户即解除与本网站的协议关系，但本网站仍保留下列权利：         \r\n<ul>\r\n<li>用户注销后，本网站有权保留该用户的资料,包括但不限于以前的用户资料、店铺资料、商品资料和交易记录等。 </li>\r\n<li>用户注销后，如用户在注销前在本网站交易平台上存在违法行为或违反本协议的行为，本网站仍可行使本协议所规定的权利。 </li>\r\n</ul>\r\n</li>\r\n<li>如存在下列情况，本网站可以通过注销用户的方式终止服务：         \r\n<ul>\r\n<li>在用户违反本协议相关规定时，本网站有权终止向该用户提供服务。本网站将在中断服务时通知用户。但如该用户在被本网站终止提供服务后，再一次直接或间接或以他人名义注册为本网站用户的，本网站有权再次单方面终止为该用户提供服务；</li>\r\n<li>一旦本网站发现用户注册资料中主要内容是虚假的，本网站有权随时终止为该用户提供服务； </li>\r\n<li>本协议终止或更新时，用户未确认新的协议的。 </li>\r\n<li>其它本网站认为需终止服务的情况。 </li>\r\n</ul>\r\n</li>\r\n<li>因用户违反相关法律法规或者违反本协议规定等原因而致使本网站中断、终止对用户服务的，对于服务中断、终止之前用户交易行为依下列原则处理：         \r\n<ul>\r\n<li>本网站有权决定是否在中断、终止对用户服务前将用户被中断或终止服务的情况和原因通知用户交易关系方，包括但不限于对该交易有意向但尚未达成交易的用户,参与该交易竞价的用户，已达成交易要约用户。</li>\r\n<li>服务中断、终止之前，用户已经上传至本网站的物品尚未交易或交易尚未完成的，本网站有权在中断、终止服务的同时删除此项物品的相关信息。 </li>\r\n<li>服务中断、终止之前，用户已经就其他用户出售的具体物品作出要约，但交易尚未结束，本网站有权在中断或终止服务的同时删除该用户的相关要约和信息。</li>\r\n</ul>\r\n</li>\r\n<li>本网站若因用户的行为（包括但不限于刊登的商品、在本网站社区发帖等）侵害了第三方的权利或违反了相关规定，而受到第三方的追偿或受到主管机关的处分时，用户应赔偿本网站因此所产生的一切损失及费用。</li>\r\n<li>对违反相关法律法规或者违反本协议规定，且情节严重的用户，本网站有权终止该用户的其它服务。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>六、协议的修订</strong><br /> <br /> 本协议可由本网站随时修订，并将修订后的协议公告于本网站之上，修订后的条款内容自公告时起生效，并成为本协议的一部分。用户若在本协议修改之后，仍继续使用本网站，则视为用户接受和自愿遵守修订后的协议。本网站行使修改或中断服务时，不需对任何第三方负责。<br /> <br /> <strong>七、 本网站的责任范围 </strong><br /> <br /> 当用户接受该协议时，用户应明确了解并同意∶</p>\r\n<ol>\r\n<li>是否经由本网站下载或取得任何资料，由用户自行考虑、衡量并且自负风险，因下载任何资料而导致用户电脑系统的任何损坏或资料流失，用户应负完全责任。</li>\r\n<li>用户经由本网站取得的建议和资讯，无论其形式或表现，绝不构成本协议未明示规定的任何保证。</li>\r\n<li>基于以下原因而造成的利润、商誉、使用、资料损失或其它无形损失，本网站不承担任何直接、间接、附带、特别、衍生性或惩罚性赔偿（即使本网站已被告知前款赔偿的可能性）：         \r\n<ul>\r\n<li>本网站的使用或无法使用。</li>\r\n<li>经由或通过本网站购买或取得的任何物品，或接收之信息，或进行交易所随之产生的替代物品及服务的购买成本。</li>\r\n<li>用户的传输或资料遭到未获授权的存取或变更。</li>\r\n<li>本网站中任何第三方之声明或行为。</li>\r\n<li>本网站其它相关事宜。</li>\r\n</ul>\r\n</li>\r\n<li>本网站只是为用户提供一个交易的平台，对于用户所刊登的交易物品的合法性、真实性及其品质，以及用户履行交易的能力等，本网站一律不负任何担保责任。用户如果因使用本网站，或因购买刊登于本网站的任何物品，而受有损害时，本网站不负任何补偿或赔偿责任。</li>\r\n<li>本  网站提供与其它互联网上的网站或资源的链接，用户可能会因此连结至其它运营商经营的网站，但不表示本网站与这些运营商有任何关系。其它运营商经营的网站均  由各经营者自行负责，不属于本网站控制及负责范围之内。对于存在或来源于此类网站或资源的任何内容、广告、产品或其它资料，本网站亦不予保证或负责。因使  用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、物品或服务所产生的任何损害或损失，本网站不负任何直接或间接的责任。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>八.、不可抗力</strong><br /> <br /> 因不可抗力或者其他意外事件，使得本协议的履行不可能、不必要或者无意义的，双方均不承担责任。本合同所称之不可抗力意指不能预见、不能避免并不能克服的  客观情况，包括但不限于战争、台风、水灾、火灾、雷击或地震、罢工、暴动、法定疾病、黑客攻击、网络病毒、电信部门技术管制、政府行为或任何其它自然或人  为造成的灾难等客观情况。<br /> <br /> <strong>九、争议解决方式</strong><br /></p>\r\n<ol>\r\n<li>本协议及其修订本的有效性、履行和与本协议及其修订本效力有关的所有事宜，将受中华人民共和国法律管辖，任何争议仅适用中华人民共和国法律。</li>\r\n<li>因  使用本网站服务所引起与本网站的任何争议，均应提交深圳仲裁委员会按照该会届时有效的仲裁规则进行仲裁。相关争议应单独仲裁，不得与任何其它方的争议在任  何仲裁中合并处理，该仲裁裁决是终局，对各方均有约束力。如果所涉及的争议不适于仲裁解决，用户同意一切争议由人民法院管辖。</li>\r\n</ol>', '1293773586');
INSERT INTO shop_document VALUES ('2', 'real_name', '什么是实名认证', '<p><strong>什么是实名认证？</strong></p>\r\n<p>&ldquo;认证店铺&rdquo;服务是一项对店主身份真实性识别服务。店主可以通过站内PM、电话或管理员EMail的方式 联系并申请该项认证。经过管理员审核确认了店主的真实身份，就可以开通该项认证。</p>\r\n<p>通过该认证，可以说明店主身份的真实有效性，为买家在网络交易的过程中提供一定的信心和保证。</p>\r\n<p><strong>认证申请的方式：</strong></p>\r\n<p>Email：XXXX@XX.com</p>\r\n<p>管理员：XXXXXX</p>', '1293773817');
INSERT INTO shop_document VALUES ('3', 'real_store', '什么是实体店铺认证', '<p><strong>什么是实体店铺认证？</strong></p>\r\n<p>&ldquo;认证店铺&rdquo;服务是一项对店主身份真实性识别服务。店主可以通过站内PM、电话或管理员EMail的方式 联系并申请该项认证。经过管理员审核确认了店主的真实身份，就可以开通该项认证。</p>\r\n<p>通过该认证，可以说明店主身份的真实有效性，为买家在网络交易的过程中提供一定的信心和保证。</p>\r\n<p><strong>认证申请的方式：</strong></p>\r\n<p>Email：XXXX@XX.com</p>\r\n<p>管理员：XXXXXX</p>', '1293773875');
INSERT INTO shop_document VALUES ('4', 'open_store', '开店协议', '<p>使用本公司服务所须遵守的条款和条件。<br /><br />1.用户资格<br />本公司的服务仅向适用法律下能够签订具有法律约束力的合同的个人提供并仅由其使用。在不限制前述规定的前提下，本公司的服务不向18周岁以下或被临时或无限期中止的用户提供。如您不合资格，请勿使用本公司的服务。此外，您的帐户（包括信用评价）和用户名不得向其他方转让或出售。另外，本公司保留根据其意愿中止或终止您的帐户的权利。<br /><br />2.您的资料（包括但不限于所添加的任何商品）不得：<br />*具有欺诈性、虚假、不准确或具误导性；<br />*侵犯任何第三方著作权、专利权、商标权、商业秘密或其他专有权利或发表权或隐私权；<br />*违反任何适用的法律或法规（包括但不限于有关出口管制、消费者保护、不正当竞争、刑法、反歧视或贸易惯例/公平贸易法律的法律或法规）；<br />*有侮辱或者诽谤他人，侵害他人合法权益的内容；<br />*有淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的内容；<br />*包含可能破坏、改变、删除、不利影响、秘密截取、未经授权而接触或征用任何系统、数据或个人资料的任何病毒、特洛依木马、蠕虫、定时炸弹、删除蝇、复活节彩蛋、间谍软件或其他电脑程序；<br /><br />3.违约<br />如发生以下情形，本公司可能限制您的活动、立即删除您的商品、向本公司社区发出有关您的行为的警告、发出警告通知、暂时中止、无限期地中止或终止您的用户资格及拒绝向您提供服务：<br />(a)您违反本协议或纳入本协议的文件；<br />(b)本公司无法核证或验证您向本公司提供的任何资料；<br />(c)本公司相信您的行为可能对您、本公司用户或本公司造成损失或法律责任。<br /><br />4.责任限制<br />本公司、本公司的关联公司和相关实体或本公司的供应商在任何情况下均不就因本公司的网站、本公司的服务或本协议而产生或与之有关的利润损失或任何特别、间接或后果性的损害（无论以何种方式产生，包括疏忽）承担任何责任。您同意您就您自身行为之合法性单独承担责任。您同意，本公司和本公司的所有关联公司和相关实体对本公司用户的行为的合法性及产生的任何结果不承担责任。<br /><br />5.无代理关系<br />用户和本公司是独立的合同方，本协议无意建立也没有创立任何代理、合伙、合营、雇员与雇主或特许经营关系。本公司也不对任何用户及其网上交易行为做出明示或默许的推荐、承诺或担保。<br /><br />6.一般规定<br />本协议在所有方面均受中华人民共和国法律管辖。本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。</p>', '1293773901');
INSERT INTO shop_document VALUES ('5', 'groupbuy', '团购活动协议', '<p>\r\n	一、团购的所有权和运作权归本公司。\r\n</p>\r\n<p>\r\n	二、本公司有权在必要时修改本协议，本协议一旦发生变更，将会在相关页面上公布。如果您不同意所改动的内容，您应主动停止使用团购服务。如果您继续使用服务，则视为接受本协议的变更。\r\n</p>\r\n<p>\r\n	三、如发生下列任何一种情形，本公司有权中断或终止向您提供的服务而无需通知您：\r\n</p>\r\n1、 您提供的个人资料不真实；<br />\r\n2、您违反本协议的规定；<br />\r\n3、 按照政府主管部门的监管要求；<br />\r\n4、本公司认为您的行为违反团购服务性质或需求的特殊情形。\r\n<p>\r\n	四、尽管本协议可能另有其他规定，本公司仍然可以随时终止本协议。\r\n</p>\r\n<p>\r\n	五、本公司终止本协议的权利不会妨害本公司可能拥有的在本协议终止前因您违反本协议或本公司本应享有的任何其他权利。\r\n</p>\r\n<p>\r\n	六、您理解并完全接受，本公司有权自行对团购资源作下线处理。\r\n</p>', '1328580944');

-- ----------------------------
-- Table structure for `shop_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `shop_favorites`;
CREATE TABLE `shop_favorites` (
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `fav_id` int(10) unsigned NOT NULL COMMENT '收藏ID',
  `fav_type` varchar(20) NOT NULL COMMENT '收藏类型',
  `fav_time` varchar(10) NOT NULL COMMENT '收藏时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_friend`
-- ----------------------------
DROP TABLE IF EXISTS `shop_friend`;
CREATE TABLE `shop_friend` (
  `friend_id` int(11) NOT NULL auto_increment COMMENT 'id值',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `friend_member_id` int(11) NOT NULL COMMENT '朋友id',
  `friend_member_name` varchar(50) NOT NULL COMMENT '好友会员名称',
  `friend_add_time` varchar(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY  (`friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_friend
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_gold_buy`
-- ----------------------------
DROP TABLE IF EXISTS `shop_gold_buy`;
CREATE TABLE `shop_gold_buy` (
  `gbuy_id` int(11) NOT NULL auto_increment COMMENT '自增id',
  `gbuy_mid` int(11) NOT NULL COMMENT '购买会员编号',
  `gbuy_membername` varchar(50) NOT NULL COMMENT '会员名称',
  `gbuy_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `gbuy_storename` varchar(50) NOT NULL COMMENT '店铺名称',
  `gbuy_num` int(11) NOT NULL default '0' COMMENT '购买金币数额',
  `gbuy_price` decimal(10,2) NOT NULL COMMENT '购买金币所需金额',
  `gbuy_addtime` int(11) NOT NULL COMMENT '购买记录添加时间',
  `gbuy_ispay` tinyint(4) NOT NULL default '0' COMMENT '是否已经支付 0 未支付 1已支付',
  `gbuy_adminid` int(11) default NULL COMMENT '操作记录管理员编号',
  `gbuy_sys_remark` varchar(500) default NULL COMMENT '操作备注',
  `gbuy_user_remark` varchar(500) default NULL COMMENT '用户备注',
  `gbuy_check_type` varchar(100) default NULL COMMENT '购买金币的支付类型',
  PRIMARY KEY  (`gbuy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_gold_buy
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_gold_log`
-- ----------------------------
DROP TABLE IF EXISTS `shop_gold_log`;
CREATE TABLE `shop_gold_log` (
  `glog_id` int(11) NOT NULL auto_increment COMMENT '自增编号',
  `glog_memberid` int(11) NOT NULL COMMENT '会员编号',
  `glog_membername` varchar(50) NOT NULL COMMENT '会员名称',
  `glog_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `glog_storename` varchar(50) NOT NULL COMMENT '店铺名称',
  `glog_adminid` int(11) NOT NULL COMMENT '管理员编号，如果没有管理员则该项为0',
  `glog_adminname` varchar(20) NOT NULL COMMENT '管理员名称',
  `glog_goldnum` int(11) NOT NULL default '0' COMMENT '金币数',
  `glog_method` tinyint(4) NOT NULL default '1' COMMENT '金币增减方式 1增加 2减少',
  `glog_addtime` int(11) NOT NULL COMMENT '添加时间',
  `glog_desc` varchar(500) default NULL COMMENT '操作描述',
  `glog_stage` enum('system','ztc','adv_buy') NOT NULL COMMENT '操作阶段方式 system 表示系统操作 ztc 表示直通车阶段操作 adv_buy 表示广告阶段操作',
  PRIMARY KEY  (`glog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_gold_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_gold_payment`
-- ----------------------------
DROP TABLE IF EXISTS `shop_gold_payment`;
CREATE TABLE `shop_gold_payment` (
  `payment_id` tinyint(1) unsigned NOT NULL COMMENT '支付索引id',
  `payment_code` char(10) NOT NULL COMMENT '支付代码名称',
  `payment_name` varchar(20) NOT NULL COMMENT '支付名称',
  `payment_info` varchar(255) default NULL COMMENT '支付接口介绍',
  `payment_config` text COMMENT '支付接口配置信息',
  `payment_online` tinyint(1) unsigned default '0' COMMENT '是否为在线接口，1是，0否',
  `payment_state` tinyint(1) unsigned default '1' COMMENT '接口状态，1可用，2不可用',
  `payment_sort` tinyint(1) unsigned default '3' COMMENT '支付排序',
  PRIMARY KEY  (`payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_gold_payment
-- ----------------------------
INSERT INTO shop_gold_payment VALUES ('1', 'offline', '线下支付', '线下支付描述', 'a:1:{s:0:\"\";s:0:\"\";}', '0', '1', '3');
INSERT INTO shop_gold_payment VALUES ('2', 'alipay', '支付宝', '', 'a:1:{s:0:\"\";s:0:\"\";}', '1', '2', '3');
INSERT INTO shop_gold_payment VALUES ('3', 'tenpay', '财付通', '', 'a:2:{s:14:\"tenpay_account\";s:10:\"1900000109\";s:10:\"tenpay_key\";s:32:\"8934e7d15453e97507ef794cf7b0519d\";}', '1', '2', '3');
INSERT INTO shop_gold_payment VALUES ('4', 'chinabank', '网银在线', '', 'a:2:{s:17:\"chinabank_account\";s:4:\"1001\";s:13:\"chinabank_key\";s:4:\"test\";}', '1', '2', '3');
INSERT INTO shop_gold_payment VALUES ('5', 'predeposit', '预存款', null, null, '1', '1', '3');

-- ----------------------------
-- Table structure for `shop_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods`;
CREATE TABLE `shop_goods` (
  `goods_id` int(10) unsigned NOT NULL auto_increment COMMENT '商品索引id',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `gc_name` varchar(200) NOT NULL COMMENT '商品分类名称',
  `brand_id` int(10) unsigned NOT NULL default '0' COMMENT '商品品牌id',
  `type_id` int(10) unsigned NOT NULL default '0' COMMENT '类型id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `spec_open` tinyint(1) NOT NULL default '0' COMMENT '商品规格开启状态，1开启，0关闭',
  `spec_id` int(11) NOT NULL COMMENT '商品默认对应的规格id',
  `spec_name` varchar(255) NOT NULL default '' COMMENT '规格名称',
  `goods_image` varchar(100) NOT NULL COMMENT '商品默认封面图片',
  `goods_tag` varchar(100) NOT NULL default '' COMMENT '商品标签',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `goods_store_price` decimal(10,2) NOT NULL COMMENT '商品店铺价格',
  `goods_store_price_interval` varchar(30) NOT NULL default '' COMMENT '商品价格区间',
  `goods_weight` decimal(10,3) unsigned default '0.000' COMMENT '商品重量',
  `goods_serial` varchar(50) NOT NULL default '' COMMENT '商品货号',
  `goods_show` tinyint(1) NOT NULL COMMENT '商品上架',
  `goods_click` int(11) NOT NULL default '1' COMMENT '商品浏览数',
  `goods_state` tinyint(1) NOT NULL default '0' COMMENT '商品状态，0开启，1违规下架',
  `goods_commend` tinyint(1) NOT NULL COMMENT '商品推荐',
  `goods_add_time` varchar(10) NOT NULL COMMENT '商品添加时间',
  `goods_keywords` varchar(255) NOT NULL default '' COMMENT '商品关键字',
  `goods_description` varchar(255) NOT NULL default '' COMMENT '商品描述',
  `goods_body` text NOT NULL COMMENT '商品详细内容',
  `goods_attr` text COMMENT '商品属性',
  `goods_spec` text COMMENT '商品规格',
  `goods_close_reason` varchar(255) default NULL COMMENT '商品违规下架原因',
  `goods_store_state` tinyint(1) NOT NULL default '0' COMMENT '商品所在店铺状态 0开启 1关闭',
  `commentnum` int(10) unsigned NOT NULL default '0' COMMENT '评论次数',
  `salenum` int(10) unsigned NOT NULL default '0' COMMENT '售出数量',
  `goods_goldnum` int(10) unsigned NOT NULL default '0' COMMENT '直通车剩余金币额',
  `goods_isztc` tinyint(1) NOT NULL default '0' COMMENT '是否是直通车商品 0不是 1是直通车商品',
  `goods_ztcstate` tinyint(1) NOT NULL default '1' COMMENT '直通车状态  1表示开启 2表示中止',
  `goods_ztcstartdate` int(10) unsigned NOT NULL default '0' COMMENT '开始时间',
  `goods_ztclastdate` int(10) unsigned default NULL COMMENT '最后消费金币的时间 如果没有设置的话则按照没有减金币情况',
  `group_flag` tinyint(1) unsigned default '0' COMMENT '团购标识(团购1/非团购0)',
  `goods_transfee_charge` tinyint(1) unsigned NOT NULL default '0' COMMENT '商品运费承担方式 默认 0为买家承担 1为卖家承担',
  PRIMARY KEY  (`goods_id`),
  KEY `goods_name` (`goods_name`,`gc_id`,`store_id`),
  KEY `spec_id` (`spec_id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods
-- ----------------------------
INSERT INTO shop_goods VALUES ('1', '索尼高性价比入门单反 A580 单反相机【演示数据】', '174', '数码家电 &gt; 相机 &gt; 单反', '0', '5', '2', '0', '1', 'N;', 'f21d22bf35391db6723becfa7ccc5512.jpg_small.jpg', 'SONY', '5599.00', '4999.00', '', '3.000', 'YWUHJH', '1', '20', '0', '0', '1322112701', '', '', '<p>\r\n	<br />\r\n</p>\r\n<p class=\"clear\">\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong><br />\r\n</strong>\r\n</p>\r\n<p>\r\n	<strong>服务承诺：</strong> ShopNC商城向您保证所售商品均为正品行货，自带机打发票，与商品一起寄送。凭质保证书及ShopNC商城发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。\r\n</p>\r\n<p>\r\n	ShopNC商城还为您提供具有竞争力的商品价格，请您放心购买！\r\n</p>\r\n<p>\r\n	<img src=\"upload/store/goods/2/f21d22bf35391db6723becfa7ccc5512.jpg\" />\r\n</p>', 'a:2:{i:8;a:2:{s:4:\"name\";s:6:\"像素\";i:37;s:7:\"1400万\";}i:9;a:2:{s:4:\"name\";s:12:\"售后服务\";i:40;s:12:\"全国联保\";}}', 'N;', '', '0', '0', '10', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('2', '专柜正品女装时尚舒适风衣【演示数据】', '16', '男女服装 &gt; 女装 &gt; 棉衣', '1', '1', '2', '1', '173', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '05e04b481b27a5774fbe34ae4ba452e6.jpg_small.jpg', '耐克', '698.00', '600.00', '', '1.000', '', '1', '12', '0', '0', '1322113664', '', '', '<p>\r\n	<table class=\"ke-zeroborder\" bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"66\" width=\"100%\">\r\n		<tbody>\r\n			<tr bgcolor=\"#fdfdfd\" height=\"22\" align=\"center\">\r\n				<td style=\"font-size:12.0px;\" width=\"42%\" align=\"left\">\r\n					<strong>品牌名称：</strong>ESPRIT\r\n				</td>\r\n				<td width=\"58%\" align=\"left\">\r\n					<strong>适合季节：</strong>冬\r\n				</td>\r\n			</tr>\r\n			<tr bgcolor=\"#fdfdfd\" height=\"22\" align=\"center\">\r\n				<td style=\"font-size:12.0px;\" align=\"left\">\r\n					<strong>商品名称：</strong>时尚舒适风衣\r\n				</td>\r\n				<td align=\"left\">\r\n					<strong>商品货号：</strong>ESP-LC1883C-2010-L\r\n				</td>\r\n			</tr>\r\n			<tr bgcolor=\"#fdfdfd\" height=\"22\" align=\"center\">\r\n				<td style=\"font-size:12.0px;\" align=\"left\">\r\n					<strong>商品原价：</strong>1395\r\n				</td>\r\n				<td align=\"left\">\r\n					<strong>商品材质：</strong>聚酯纤维100%\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"upload/store/goods/2/ae172bd8804dfc1ff6f002fe39f01ac9.jpg\" /><img src=\"upload/store/goods/2/51528ce2b1e52c44126461b711efa78f.jpg\" />', 'a:3:{i:1;a:2:{s:4:\"name\";s:6:\"款式\";i:1;s:6:\"长袖\";}i:2;a:2:{s:4:\"name\";s:6:\"材质\";i:7;s:6:\"纯棉\";}i:3;a:2:{s:4:\"name\";s:6:\"衣长\";i:16;s:26:\"长款（衣长70-100CM）\";}}', 'a:2:{i:1;a:1:{i:1;s:6:\"白色\";}i:2;a:3:{i:15;s:1:\"S\";i:16;s:1:\"M\";i:17;s:1:\"L\";}}', '', '0', '0', '10', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('5', '单反相机EOS 550D/18-55套机【演示数据】', '174', '数码家电 &gt; 相机 &gt; 单反', '0', '5', '2', '0', '6', 'N;', 'd65799f6e43cb59841c62783caeef540.jpg_small.jpg', '', '5999.00', '4999.00', '', '1.000', 'HHHHS', '1', '4', '0', '0', '1322114351', '', '', '<img src=\"upload/store/goods/2/d65799f6e43cb59841c62783caeef540.jpg\" />', 'a:2:{i:8;a:2:{s:4:\"name\";s:6:\"像素\";i:38;s:7:\"1600万\";}i:9;a:2:{s:4:\"name\";s:12:\"售后服务\";i:41;s:12:\"店铺三包\";}}', 'N;', '', '0', '0', '10', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('3', '佳能单反相机EOS套机 佳能600D 【演示数据】', '174', '数码家电 &gt; 相机 &gt; 单反', '0', '5', '2', '0', '4', 'N;', '0993ac952e86691c2351d26d6223a386.jpg_small.jpg', '佳能', '6500.00', '5999.00', '', '1.000', 'HSJAAA', '1', '6', '0', '0', '1322113985', '', '', '<img src=\"upload/store/goods/2/0993ac952e86691c2351d26d6223a386.jpg\" />', 'a:2:{i:8;a:2:{s:4:\"name\";s:6:\"像素\";i:38;s:7:\"1600万\";}i:9;a:2:{s:4:\"name\";s:12:\"售后服务\";i:41;s:12:\"店铺三包\";}}', 'N;', '', '0', '0', '10', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('4', '尼康D3100套机大陆行货 全国联保【演示数据】', '174', '数码家电 &gt; 相机 &gt; 单反', '0', '5', '2', '0', '5', 'N;', '7270c24985184d87ee18c8f20ea46491.jpg_small.jpg', '', '4999.00', '3999.00', '', '1.000', 'HHSYA', '1', '3', '0', '0', '1322114130', '', '', '<img src=\"upload/store/goods/2/7270c24985184d87ee18c8f20ea46491.jpg\" />', 'a:2:{i:8;a:2:{s:4:\"name\";s:6:\"像素\";i:38;s:7:\"1600万\";}i:9;a:2:{s:4:\"name\";s:12:\"售后服务\";i:41;s:12:\"店铺三包\";}}', 'N;', '', '0', '0', '10', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('6', '单反数码相机EOS60D双镜头组合【演示数据】', '174', '数码家电 &gt; 相机 &gt; 单反', '0', '5', '2', '0', '7', 'N;', '50deee70b91ec2c286b468469c336e09.jpg_small.jpg', '', '5999.00', '5299.00', '', '1.000', 'HGDHG', '1', '4', '0', '0', '1322114525', '', '', '<img src=\"upload/store/goods/2/50deee70b91ec2c286b468469c336e09.jpg\" />', 'a:2:{i:8;a:2:{s:4:\"name\";s:6:\"像素\";i:38;s:7:\"1600万\";}i:9;a:2:{s:4:\"name\";s:12:\"售后服务\";i:40;s:12:\"全国联保\";}}', 'N;', '', '0', '0', '10', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('7', '单反数码相机EOS60D/18-200套机【演示数据】', '174', '数码家电 &gt; 相机 &gt; 单反', '0', '5', '2', '0', '8', 'N;', '3a27926d6a56f04f0943475354a4bac1.jpg_small.jpg', '', '7999.00', '6999.00', '', '1.000', 'JJHHJ', '1', '1', '0', '0', '1322114601', '', '', '<img src=\"upload/store/goods/2/3a27926d6a56f04f0943475354a4bac1.jpg\" />', 'a:2:{i:8;a:2:{s:4:\"name\";s:6:\"像素\";i:37;s:7:\"1400万\";}i:9;a:2:{s:4:\"name\";s:12:\"售后服务\";i:41;s:12:\"店铺三包\";}}', 'N;', '', '0', '0', '10', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('40', '玫瑰嫩白保湿面膜 美白保湿抗衰老 专柜正品【演示数据】', '136', '美容美妆 &gt; 护肤 &gt; 面膜', '0', '0', '2', '0', '45', 'N;', '4881e7d174693f1196e669b86643ddd8.jpg_small.jpg', '', '138.00', '138.00', '', '0.500', 'JKHJHJ', '1', '12', '0', '0', '1322122982', '', '', '<img src=\"upload/store/goods/2/4881e7d174693f1196e669b86643ddd8.jpg\" /><img src=\"upload/store/goods/2/0390369243d94cc16f9537515dcd384e.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('8', '尼康D7000套机 含18-105VR镜头 【演示数据】', '174', '数码家电 &gt; 相机 &gt; 单反', '0', '5', '2', '0', '9', 'N;', 'ba04cebcbe4397df5ca8b60b3ebcda08.jpg_small.jpg', '', '9999.00', '8999.00', '', '1.000', 'TYWGH', '1', '2', '0', '0', '1322114702', '', '', '<img src=\"upload/store/goods/2/ba04cebcbe4397df5ca8b60b3ebcda08.jpg\" />', 'a:2:{i:8;a:2:{s:4:\"name\";s:6:\"像素\";i:38;s:7:\"1600万\";}i:9;a:2:{s:4:\"name\";s:12:\"售后服务\";i:40;s:12:\"全国联保\";}}', 'N;', '', '0', '0', '10', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('9', '单反数码相机EOS5DMark 5DII【演示数据】', '174', '数码家电 &gt; 相机 &gt; 单反', '0', '5', '2', '0', '10', 'N;', 'cfd07fdd0288d2528abb93239a143ade.jpg_small.jpg', '', '14566.00', '12066.00', '', '0.113', 'GHUGDD', '1', '3', '0', '0', '1322114909', '', '', '<img src=\"upload/store/goods/2/cfd07fdd0288d2528abb93239a143ade.jpg\" />', 'a:2:{i:8;a:2:{s:4:\"name\";s:6:\"像素\";i:38;s:7:\"1600万\";}i:9;a:2:{s:4:\"name\";s:12:\"售后服务\";i:41;s:12:\"店铺三包\";}}', 'N;', '', '0', '0', '10', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('10', '尼康D3X单机 正品行货 电脑开票 【演示数据】', '174', '数码家电 &gt; 相机 &gt; 单反', '0', '5', '2', '0', '11', 'N;', 'aa9c12062f79204a23f395ed01b538f9.jpg_small.jpg', '', '9988.00', '8688.00', '', '0.113', 'JHJHJ', '1', '5', '0', '0', '1322115003', '', '', '<img src=\"upload/store/goods/2/aa9c12062f79204a23f395ed01b538f9.jpg\" />', 'a:2:{i:8;a:2:{s:4:\"name\";s:6:\"像素\";i:37;s:7:\"1400万\";}i:9;a:2:{s:4:\"name\";s:12:\"售后服务\";i:41;s:12:\"店铺三包\";}}', 'N;', '', '0', '0', '10', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('11', '单反数码相机单机 专业享【演示数据】', '174', '数码家电 &gt; 相机 &gt; 单反', '0', '5', '2', '0', '12', 'N;', 'b86adcbf285eccbb62e4bcccabd24836.jpg_small.jpg', '', '59888.00', '55728.00', '', '0.113', 'HJHJJ', '1', '3', '0', '0', '1322115100', '', '', '<img src=\"upload/store/goods/2/b86adcbf285eccbb62e4bcccabd24836.jpg\" />', 'a:2:{i:8;a:2:{s:4:\"name\";s:6:\"像素\";i:38;s:7:\"1600万\";}i:9;a:2:{s:4:\"name\";s:12:\"售后服务\";i:40;s:12:\"全国联保\";}}', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('42', '专柜正品 隐形面膜贴蚕丝面膜【演示数据】', '136', '美容美妆 &gt; 护肤 &gt; 面膜', '0', '0', '2', '0', '47', 'N;', '911ebbce6dcce91a5855f025eb9d8df7.jpg_small.jpg', '', '100.00', '47.00', '', '1.000', '', '1', '12', '0', '0', '1322123860', '', '', '<img src=\"upload/store/goods/2/911ebbce6dcce91a5855f025eb9d8df7.jpg\" /><img src=\"upload/store/goods/2/1a7aad65f2b3293b34f898d2bc5ff7e2.jpg\" /><img src=\"upload/store/goods/2/81680159995562293f555d74a7472151.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('12', '2011冬季收腰中长款时尚狐狸毛领羽绒衣服外套【演示数据】', '16', '男女服装 &gt; 女装 &gt; 棉衣', '1', '1', '2', '1', '167', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', 'e953812764730143d073f2a0d89a0226.jpg_small.jpg', '耐克', '699.00', '439.00', '', '2.000', '', '1', '19', '0', '0', '1322115244', '', '', '<p>\r\n	<img src=\"upload/store/goods/2/e953812764730143d073f2a0d89a0226.jpg\" /><img src=\"upload/store/goods/2/e5c20350c46a482f64c10c5f6c83486a.jpg\" /><img src=\"upload/store/goods/2/a3d219feb7224a822f7336651bdfa84b.jpg\" /><img src=\"upload/store/goods/2/c307d4ddbf659acb1000296588d24266.jpg\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"upload/store/goods/2/b0c9de555eb9ebaf7ea5b195ceec9478.jpg\" />', 'a:3:{i:1;a:2:{s:4:\"name\";s:6:\"款式\";i:1;s:6:\"长袖\";}i:2;a:2:{s:4:\"name\";s:6:\"材质\";i:13;s:6:\"其他\";}i:3;a:2:{s:4:\"name\";s:6:\"衣长\";i:16;s:26:\"长款（衣长70-100CM）\";}}', 'a:2:{i:1;a:2:{i:1;s:6:\"白色\";i:8;s:6:\"褐色\";}i:2;a:3:{i:15;s:1:\"S\";i:16;s:1:\"M\";i:17;s:1:\"L\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('39', '正品补水眼部护理2件套 补水保湿 去黑眼圈/眼袋【演示数据】', '144', '美容美妆 &gt; 护肤 &gt; 眼霜', '0', '0', '2', '0', '44', 'N;', '57ec6dae05bcb152e946401f1327c17a.jpg_small.jpg', '', '174.00', '84.00', '', '0.500', 'HHKKK1', '1', '37', '0', '0', '1322122676', '', '', '<img src=\"upload/store/goods/2/037b5d5ac64672fe0cdb35d4cc3b0caa.jpg\" /><img src=\"upload/store/goods/2/57ec6dae05bcb152e946401f1327c17a.jpg\" /><img src=\"upload/store/goods/2/85637d64635444a2c7c9c66b310c2803.jpg\" /><img src=\"upload/store/goods/2/0123b4b558661879d36aec9c7d12b107.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('13', '高级艺术雕塑茶盘/窑变釉花釉茶具套装【演示数据】', '199', '家居家装 &gt; 厨房餐饮 &gt; 茶具', '0', '4', '2', '0', '15', 'N;', '0036cc108fd9f490bb434c900bd12985.jpg_small.jpg', '', '355.00', '166.00', '', '1.000', '', '1', '34', '0', '0', '1322115581', '', '', '<img src=\"upload/store/goods/2/ec05940a880c273d27d5bc23c1e36b1c.jpeg\" />', 'a:4:{i:6;a:2:{s:4:\"name\";s:6:\"类型\";i:0;s:0:\"\";}i:11;a:2:{s:4:\"name\";s:18:\"推荐使用人数\";i:0;s:0:\"\";}i:7;a:2:{s:4:\"name\";s:6:\"材质\";i:0;s:0:\"\";}i:10;a:2:{s:4:\"name\";s:12:\"价格区间\";i:0;s:0:\"\";}}', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('14', '迪士尼米奇情侣杯 不锈钢内胆 双层隔热杯两只【演示数据】', '198', '家居家装 &gt; 厨房餐饮 &gt; 水杯水壶', '0', '0', '2', '0', '16', 'N;', '0c7258a85d7a43af39a57300169a740a.jpg_small.jpg', '', '80.00', '56.00', '', '0.200', '', '1', '31', '0', '0', '1322115843', '', '', '<img src=\"upload/store/goods/2/0c7258a85d7a43af39a57300169a740a.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('15', '正品迪士尼米奇中国红四入果盘 水果盘 糖果盘 【演示数据】', '197', '家居家装	厨房餐饮	餐具', '34', '0', '2', '0', '17', '', '47de9eb07984702d5f424d1a56286d68.jpg_small.jpg', '', '40.00', '23.00', '', '0.200', '', '1', '1', '0', '0', '1322115967', '', '', '<img src=\"upload/store/goods/2/47de9eb07984702d5f424d1a56286d68.jpg\" />', '', '', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('16', '2011秋冬新款韩版大码毛领毛呢外套呢子大衣【演示数据】', '17', '男女服装 &gt; 女装 &gt; 毛呢大衣', '8', '1', '2', '1', '161', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', 'b5c8b569d50fc45782f930cb5978f2ed.jpg_small.jpg', '李宁', '800.00', '299.00', '', '2.000', '', '1', '43', '0', '0', '1322116050', '', '', '<p>\r\n	面料说明\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	衣服主面料采用双面呢，该面料平整不易起皱，是众多品牌公司制作呢子大衣的首选面料。O.SA制作的布面无杂质且颜色纯正，饱满细腻，面料的所有品质指标都优于国家质量标准。\r\n</p>\r\n<p>\r\n	工艺说明\r\n</p>\r\n<p>\r\n	很\r\n帅气的一款大衣，经典双排扣设计，杏色，优雅深邃。细节繁多，做工超复杂，门襟有混花纹纽扣。腰的分割线设计位置比较低，更加的时尚，同时更能衬托体型。\r\n这里最要提到的是衣服的花瓣型的边缘，非常的美轮美奂，很别致，这弧线形的做法无论是在缝纫还是在裁剪的过程中对技术的要求都是非常高的，稍不留神就会做\r\n成次品。这个还是暗藏玄机的哦，在花瓣边下面有条拉链，可以吧下摆拆卸下来，做一件短款的大衣穿着，也是非常好看的，然后领子也是可以拆卸的，所以说一件\r\n衣服有三种穿法，这就是时下最流行的“变形金刚”。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"upload/store/goods/2/3f167760d8640f6c5c11f7f47efcd18d.jpg\" /><br />\r\n<br />\r\n<img src=\"upload/store/goods/2/9edbb02b5a21368228ec2a1451107ad8.jpg\" /><img src=\"upload/store/goods/2/bc7d905825c408d26339b82ffffc3c63.jpg\" /><img src=\"upload/store/goods/2/b5c8b569d50fc45782f930cb5978f2ed.jpg\" /><img src=\"upload/store/goods/2/c2c8e577956049de1c2be4fc6fca7745.jpg\" />', 'a:3:{i:1;a:2:{s:4:\"name\";s:6:\"款式\";i:1;s:6:\"长袖\";}i:2;a:2:{s:4:\"name\";s:6:\"材质\";i:7;s:6:\"纯棉\";}i:3;a:2:{s:4:\"name\";s:6:\"衣长\";i:16;s:26:\"长款（衣长70-100CM）\";}}', 'a:2:{i:1;a:2:{i:1;s:6:\"白色\";i:8;s:6:\"褐色\";}i:2;a:3:{i:15;s:1:\"S\";i:16;s:1:\"M\";i:17;s:1:\"L\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('17', '窑变釉/花釉功夫茶具海螺茶洗茶漏组合 【演示数据】', '199', '家居家装 &gt; 厨房餐饮 &gt; 茶具', '0', '4', '2', '0', '20', 'N;', '096bd6588a631f74a343f157d72ce368.jpg_small.jpg', '', '158.00', '78.00', '', '0.500', '', '1', '5', '0', '0', '1322116253', '', '', '<img src=\"upload/store/goods/2/b7adc5cb1ff9955503920165cc22167f.jpeg\" />', 'a:4:{i:6;a:2:{s:4:\"name\";s:6:\"类型\";i:0;s:0:\"\";}i:11;a:2:{s:4:\"name\";s:18:\"推荐使用人数\";i:0;s:0:\"\";}i:7;a:2:{s:4:\"name\";s:6:\"材质\";i:0;s:0:\"\";}i:10;a:2:{s:4:\"name\";s:12:\"价格区间\";i:0;s:0:\"\";}}', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('18', '雅致无磁不锈钢厨具七件套 锅铲勺子套装 【演示数据】', '193', '家居家装	厨房餐饮	烹饪勺铲', '35', '0', '2', '0', '21', '', '28b00f923fdaafbd9e36241873809d76.jpg_small.jpg', '', '70.00', '65.00', '', '0.500', '', '1', '8', '0', '0', '1322116774', '', '', '<img src=\"upload/store/goods/2/d7415149a84ec82191ad182b4321073f.jpg\" />', '', '', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('19', '2011秋冬装新款女装韩版大码呢子大衣【演示数据】', '17', '男女服装 &gt; 女装 &gt; 毛呢大衣', '14', '1', '2', '1', '152', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', 'e9c053b2f4273024dab81dce35bdedec.jpg_small.jpg', '大衣', '300.00', '300.00', '', '2.000', '', '1', '5', '0', '0', '1322116963', '', '', '<img src=\"upload/store/goods/2/e786981e63e24b6e3e8f617a54fea4c7.jpg\" /><img src=\"upload/store/goods/2/ce8c787d5e0b7e7a4e176d1be80939b9.jpg\" />', 'a:3:{i:1;a:2:{s:4:\"name\";s:6:\"款式\";i:1;s:6:\"长袖\";}i:2;a:2:{s:4:\"name\";s:6:\"材质\";i:9;s:6:\"聚酯\";}i:3;a:2:{s:4:\"name\";s:6:\"衣长\";i:16;s:26:\"长款（衣长70-100CM）\";}}', 'a:2:{i:1;a:3:{i:8;s:6:\"褐色\";i:9;s:6:\"黄色\";i:11;s:6:\"桔色\";}i:2;a:3:{i:15;s:1:\"S\";i:16;s:1:\"M\";i:17;s:1:\"L\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('21', '正品edc系列连帽休闲夹克【演示数据】', '17', '男女服装 &gt; 女装 &gt; 毛呢大衣', '2', '1', '2', '1', '149', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', 'ddfcab24bd812c466788eeba587f4057.jpg_small.jpg', '女装', '600.00', '300.00', '', '1.000', '', '1', '6', '0', '0', '1322117130', '', '', '<img src=\"upload/store/goods/2/ddfcab24bd812c466788eeba587f4057.jpg\" />', 'a:3:{i:1;a:2:{s:4:\"name\";s:6:\"款式\";i:1;s:6:\"长袖\";}i:2;a:2:{s:4:\"name\";s:6:\"材质\";i:7;s:6:\"纯棉\";}i:3;a:2:{s:4:\"name\";s:6:\"衣长\";i:15;s:28:\"中长款（衣长50-70CM）\";}}', 'a:2:{i:1;a:1:{i:2;s:6:\"黑色\";}i:2;a:3:{i:15;s:1:\"S\";i:16;s:1:\"M\";i:17;s:1:\"L\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('22', '正品菱格连帽针织外套【演示数据】', '19', '男女服装 &gt; 女装 &gt; 打底衫', '9', '1', '2', '1', '147', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '3f81874d594894d19150843c42fb1f8e.jpg_small.jpg', '女装', '500.00', '398.00', '', '1.000', '', '1', '31', '0', '0', '1322117416', '', '', '<img src=\"upload/store/goods/2/3f81874d594894d19150843c42fb1f8e.jpg\" />', 'a:3:{i:1;a:2:{s:4:\"name\";s:6:\"款式\";i:1;s:6:\"长袖\";}i:2;a:2:{s:4:\"name\";s:6:\"材质\";i:10;s:10:\"棉+氨伦\";}i:3;a:2:{s:4:\"name\";s:6:\"衣长\";i:16;s:26:\"长款（衣长70-100CM）\";}}', 'a:2:{i:1;a:2:{i:1;s:6:\"白色\";i:6;s:6:\"花色\";}i:2;a:1:{i:22;s:6:\"均码\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('23', '武陵泰味酱板系列酱板鸭脖礼盒装400g/内含40【演示数据】', '203', '食品保健 &gt; 休闲零食 &gt; 鸭脖', '0', '0', '2', '0', '27', 'N;', 'c9d06fe0d1bdbbef07b4a68fb6d826b8.jpeg_small.jpeg', '', '50.00', '40.00', '', '0.500', '', '1', '2', '0', '0', '1322117521', '', '', '<img src=\"upload/store/goods/2/c9d06fe0d1bdbbef07b4a68fb6d826b8.jpeg\" />', 'N;', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('24', '时尚都市舒适潮流长袖T恤edc-JE0722【演示数据】', '19', '男女服装 &gt; 女装 &gt; 打底衫', '13', '1', '2', '1', '144', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', 'ea36f7ea0aff6af0a50674b1619f7702.jpg_small.jpg', '女装', '200.00', '133.00', '', '1.000', '', '1', '2', '0', '0', '1322117543', '', '', '<img src=\"upload/store/goods/2/ea36f7ea0aff6af0a50674b1619f7702.jpg\" />', 'a:3:{i:1;a:2:{s:4:\"name\";s:6:\"款式\";i:1;s:6:\"长袖\";}i:2;a:2:{s:4:\"name\";s:6:\"材质\";i:7;s:6:\"纯棉\";}i:3;a:2:{s:4:\"name\";s:6:\"衣长\";i:15;s:28:\"中长款（衣长50-70CM）\";}}', 'a:2:{i:1;a:1:{i:11;s:6:\"桔色\";}i:2;a:3:{i:15;s:1:\"S\";i:16;s:1:\"M\";i:22;s:6:\"均码\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('25', '正品连帽硬朗帅气夹克【演示数据】', '15', '男女服装 &gt; 男装 &gt; 羽绒服', '8', '1', '2', '1', '129', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', 'ed3755ac3f250e8a7be3c14343c67832.jpg_small.jpg', '男装', '400.00', '348.00', '', '1.000', '', '1', '5', '0', '0', '1322117786', '', '', '<img src=\"upload/store/goods/2/ed3755ac3f250e8a7be3c14343c67832.jpg\" />', 'a:3:{i:1;a:2:{s:4:\"name\";s:6:\"款式\";i:1;s:6:\"长袖\";}i:2;a:2:{s:4:\"name\";s:6:\"材质\";i:7;s:6:\"纯棉\";}i:3;a:2:{s:4:\"name\";s:6:\"衣长\";i:15;s:28:\"中长款（衣长50-70CM）\";}}', 'a:2:{i:1;a:2:{i:2;s:6:\"黑色\";i:7;s:6:\"蓝色\";}i:2;a:3:{i:17;s:1:\"L\";i:18;s:2:\"XL\";i:19;s:3:\"XXL\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '1');
INSERT INTO shop_goods VALUES ('26', '法国进口德菲丝/德菲斯松露巧克力 浓情古典系列 【演示数据】', '209', '食品保健 &gt; 休闲零食 &gt; 糖果', '0', '0', '2', '0', '30', 'N;', '8a0cfade0b152c137a6855c580efeaa9.jpg_small.jpg', '', '129.00', '99.00', '', '1.000', '', '1', '29', '0', '0', '1322117865', '', '', '<img src=\"upload/store/goods/2/33b3f4eb42b918357ba686119b4cc703.jpg\" />', 'N;', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('27', '女装收腰长款羽绒服【演示数据】', '16', '男女服装 &gt; 女装 &gt; 棉衣', '13', '1', '2', '1', '110', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', 'ea64cc34f663159a68fde6872718541c.jpg_small.jpg', '女装', '900.00', '798.00', '', '1.000', '', '1', '86', '0', '0', '1322117901', '', '', '<p>\r\n	<img src=\"upload/store/goods/2/ea64cc34f663159a68fde6872718541c.jpg\" /> \r\n</p>', 'a:3:{i:1;a:2:{s:4:\"name\";s:6:\"款式\";i:1;s:6:\"长袖\";}i:2;a:2:{s:4:\"name\";s:6:\"材质\";i:11;s:18:\"氨伦（卡莱）\";}i:3;a:2:{s:4:\"name\";s:6:\"衣长\";i:16;s:26:\"长款（衣长70-100CM）\";}}', 'a:2:{i:1;a:3:{i:3;s:6:\"紫色\";i:4;s:6:\"红色\";i:8;s:6:\"褐色\";}i:2;a:2:{i:16;s:1:\"M\";i:17;s:1:\"L\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('28', '正品都市时尚女装假两件优雅针织衫【演示数据】', '19', '男女服装 &gt; 女装 &gt; 打底衫', '10', '1', '2', '1', '100', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '04fb225ea46bd1346f330400eedb7ef2.jpg_small.jpg', '女装', '200.00', '182.00', '', '1.000', '', '1', '36', '0', '0', '1322118024', '', '', '<img src=\"upload/store/goods/2/04fb225ea46bd1346f330400eedb7ef2.jpg\" />', 'a:3:{i:1;a:2:{s:4:\"name\";s:6:\"款式\";i:1;s:6:\"长袖\";}i:2;a:2:{s:4:\"name\";s:6:\"材质\";i:7;s:6:\"纯棉\";}i:3;a:2:{s:4:\"name\";s:6:\"衣长\";i:15;s:28:\"中长款（衣长50-70CM）\";}}', 'a:2:{i:1;a:3:{i:9;s:6:\"黄色\";i:10;s:6:\"粉色\";i:11;s:6:\"桔色\";}i:2;a:3:{i:15;s:1:\"S\";i:16;s:1:\"M\";i:17;s:1:\"L\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('29', 'Truffles德菲丝松露巧克力果仁味400g【演示数据】', '209', '食品保健 &gt; 休闲零食 &gt; 糖果', '0', '0', '2', '0', '33', 'N;', 'b3fa422271ee0e974af458a049ca7e77.jpg_small.jpg', '', '149.00', '99.00', '', '0.400', '', '1', '9', '0', '0', '1322118201', '', '', '<img src=\"upload/store/goods/2/33b3f4eb42b918357ba686119b4cc703.jpg\" />', 'N;', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('30', '燕之坊即冲粗粮豆米浆补气黑芝麻味单包28g【演示数据】', '211', '食品保健 &gt; 休闲零食 &gt; 饼干糕点', '0', '0', '2', '0', '34', 'N;', '984600f5e9d1a07163cbe01e7500ad11.jpg_small.jpg', '', '2.50', '1.00', '', '0.028', '', '1', '5', '0', '0', '1322118493', '', '', '<img src=\"upload/store/goods/2/984600f5e9d1a07163cbe01e7500ad11.jpg\" />', 'N;', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('31', '新百伦正品 综合训练鞋 男式运动鞋【演示数据】', '106', '鞋包配饰 &gt; 男鞋 &gt; 秋季新款', '12', '2', '2', '1', '140', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '6454bd0ebdc79d1a445242fd773ac00f.jpg_small.jpg', '', '550.00', '249.00', '', '1.000', '', '1', '4', '0', '0', '1322118588', '', '', '<p>\r\n	<img src=\"upload/store/goods/2/118aaa62c6378b8f5d4355b4c3d89636.jpg\" /><img src=\"upload/store/goods/2/8cc9076454b3d68475778e4c5b68813a.jpg\" /><img src=\"upload/store/goods/2/6454bd0ebdc79d1a445242fd773ac00f.jpg\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"upload/store/goods/2/ce68bd3780a968a105834d850cc211cb.jpg\" />', 'N;', 'a:2:{i:3;a:4:{i:23;s:2:\"35\";i:24;s:2:\"36\";i:25;s:2:\"37\";i:26;s:2:\"38\";}i:1;a:1:{i:7;s:6:\"蓝色\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('32', '专柜正品 LINING 李宁 双肩包【演示数据】', '100', '鞋包配饰 &gt; 皮具箱包 &gt; 双肩包', '8', '3', '2', '0', '37', 'a:1:{i:1;s:6:\"颜色\";}', '356ef8679ef2c96d6bfe5f1035904233.jpg_small.jpg', '', '299.00', '179.00', '', '1.000', '', '1', '7', '0', '0', '1322118871', '', '', '<img src=\"upload/store/goods/2/356ef8679ef2c96d6bfe5f1035904233.jpg\" /><img src=\"upload/store/goods/2/a1dcb4e35fe2706532dfe75e9ae1f07e.jpg\" /><img src=\"upload/store/goods/2/7117cae0707acea0dff351c727767416.jpg\" /><img src=\"upload/store/goods/2/d8a8e30ede885c06f9da26d8a75f311b.jpg\" /><img src=\"upload/store/goods/2/ae3906538ba6506934e9fa67fdbb7cb4.jpg\" />', 'a:2:{i:4;a:2:{s:4:\"name\";s:6:\"质地\";i:0;s:0:\"\";}i:5;a:2:{s:4:\"name\";s:12:\"箱包外形\";i:0;s:0:\"\";}}', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('33', '新疆特级哈密五堡大枣(500克)养颜滋补红枣 【演示数据】', '222', '食品保健 &gt; 蜜饯果脯 &gt; 梅类', '0', '0', '2', '0', '38', 'N;', '70cd400bc29f748ebde074e04f1ad081.jpeg_small.jpeg', '滋补', '55.00', '45.00', '', '0.500', '', '1', '3', '0', '0', '1322119041', '', '', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"upload/store/goods/2/18aecc7a09884fbf912914e3dddc9dc3.jpg\" /><img src=\"upload/store/goods/2/70cd400bc29f748ebde074e04f1ad081.jpeg\" />', 'N;', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('34', '专柜正品 LINING 李宁 背包【演示数据】', '100', '鞋包配饰 &gt; 皮具箱包 &gt; 双肩包', '8', '3', '2', '0', '39', 'a:1:{i:1;s:6:\"颜色\";}', 'c78affa09050a1862902173d57d96227.jpg_small.jpg', '', '269.00', '151.00', '', '2.000', '', '1', '1', '0', '0', '1322119073', '', '', '<img src=\"upload/store/goods/2/436947317661618cae6cc4067eb32046.jpg\" /><img src=\"upload/store/goods/2/1d71e5144f77c9cc6df27831262e2b12.jpg\" /><img src=\"upload/store/goods/2/496d409e03e72c047c207c7ec22394b6.jpg\" /><img src=\"upload/store/goods/2/9422982b8e62a7d5e0c48a79cd1828cb.jpg\" />', 'a:2:{i:4;a:2:{s:4:\"name\";s:6:\"质地\";i:0;s:0:\"\";}i:5;a:2:{s:4:\"name\";s:12:\"箱包外形\";i:0;s:0:\"\";}}', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('35', '2011新款秋冬季时尚韩版包包专柜正品帆布包【演示数据】', '96', '鞋包配饰 &gt; 皮具箱包 &gt; 单肩包', '0', '3', '2', '1', '109', 'a:1:{i:1;s:6:\"颜色\";}', 'c82b0fb1e16f066387a97f0fa5095fef.jpg_small.jpg', '', '55.00', '46.00', '', '1.000', '', '1', '3', '0', '0', '1322119349', '', '', '<img src=\"upload/store/goods/2/c82b0fb1e16f066387a97f0fa5095fef.jpg\" /><img src=\"upload/store/goods/2/4b42fbccd271020c5d430090fa93bdf3.jpg\" /><img src=\"upload/store/goods/2/53627d8fd87e695f1408f7ac12f29cac.jpg\" /><img src=\"upload/store/goods/2/99ec3e7d533a2e8341444de4bb7f20ff.jpg\" />', 'a:2:{i:4;a:2:{s:4:\"name\";s:6:\"质地\";i:0;s:0:\"\";}i:5;a:2:{s:4:\"name\";s:12:\"箱包外形\";i:0;s:0:\"\";}}', 'a:1:{i:1;a:1:{i:4;s:6:\"红色\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('36', '特价耐克 NIKE 正品 滑板鞋 女式运动鞋【演示数据】', '108', '鞋包配饰 &gt; 男鞋 &gt; 舒适男鞋', '1', '2', '2', '1', '135', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '949ae7c1258a2de4ea2886ad4cb37bd0.jpg_small.jpg', '', '568.00', '268.00', '', '1.000', '', '1', '2', '0', '0', '1322119630', '', '', '<img src=\"upload/store/goods/2/6565b39799e1b811813300a60f6eca13.jpg\" /><img src=\"upload/store/goods/2/949ae7c1258a2de4ea2886ad4cb37bd0.jpg\" /><img src=\"upload/store/goods/2/e391bfb2e3e07a8a0da9bcea3c6d495f.jpg\" /><img src=\"upload/store/goods/2/c6a8e1b002eb31b95a8a89b961660d25.jpg\" /><img src=\"upload/store/goods/2/569824668b45539cc9636f64a9ff0c72.jpg\" />', 'N;', 'a:2:{i:3;a:5:{i:24;s:2:\"36\";i:25;s:2:\"37\";i:26;s:2:\"38\";i:27;s:2:\"39\";i:28;s:2:\"40\";}i:1;a:1:{i:4;s:6:\"红色\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('38', '御白3件套/面部护肤套装 美白保湿去黄气/暗沉肌【演示数据】', '139', '美容美妆 &gt; 护肤 &gt; 面霜/乳液', '0', '0', '2', '0', '43', 'N;', '16ad561a77804f7c76b03462d852f5ef.jpg_small.jpg', '', '246.00', '119.00', '', '1.000', 'HJHJK', '1', '8', '0', '0', '1322121940', '', '', '<img src=\"upload/store/goods/2/16ad561a77804f7c76b03462d852f5ef.jpg\" /><img src=\"upload/store/goods/2/1a4bd0a2447d76b9494e4c5e22f184ea.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('41', '金致润白弹力精华胶囊 美白保湿补水抗氧化抗衰老【演示数据】', '140', '美容美妆 &gt; 护肤 &gt; 护肤套装', '0', '0', '2', '0', '46', 'N;', 'fdde88fceb45f66e35d9da05b23e3e40.jpg_small.jpg', '', '418.00', '358.00', '', '1.000', 'JKLKJ2', '1', '10', '0', '0', '1322123179', '', '', '<img src=\"upload/store/goods/2/fdde88fceb45f66e35d9da05b23e3e40.jpg\" /><img src=\"upload/store/goods/2/69f3110840b378769b0cf87b8fa38bea.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('37', '专柜正品套装 补水保湿三件套【演示数据】', '139', '美容美妆 &gt; 护肤 &gt; 面霜/乳液', '0', '0', '2', '0', '42', 'N;', '4acea7994dd3fe86d93ae19698831b92.jpg_small.jpg', '', '208.00', '99.00', '', '1.000', 'JHYUGG', '1', '3', '0', '0', '1322121424', '', '', '<img src=\"upload/store/goods/2/a0db986da7b7a2dc7e4cfb4b65692cbc.jpg\" /><img src=\"upload/store/goods/2/4acea7994dd3fe86d93ae19698831b92.jpg\" /><img src=\"upload/store/goods/2/b9ddc65e07934b70196f4e8deac7aa5e.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('43', '清爽型BB霜裸妆/倍润保湿爽肤水控油收缩毛孔【演示数据】', '138', '美容美妆 &gt; 护肤 &gt; 爽肤水', '0', '0', '2', '0', '48', 'N;', '34af6ee1bf0d5e8e51abb5c3f3022544.jpg_small.jpg', '', '164.00', '114.00', '', '1.000', 'JKUIHJH', '1', '29', '0', '0', '1322124166', '', '', '<img src=\"upload/store/goods/2/34af6ee1bf0d5e8e51abb5c3f3022544.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('44', '茶盐柔润护手霜50ml 防水 滋润保湿美白【演示数据】', '140', '美容美妆 &gt; 护肤 &gt; 护肤套装', '0', '0', '2', '0', '49', 'N;', '84fcb7c4a35bd01af150ca5c0e068374.jpg_small.jpg', '', '40.00', '32.00', '', '1.000', 'MJHGGJ', '1', '6', '0', '0', '1322124415', '', '', '<img src=\"upload/store/goods/2/84fcb7c4a35bd01af150ca5c0e068374.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('45', '好孩子仿真乳感宽口径厚实玻璃奶瓶250ml 【演示数据】', '236', '母婴用品 &gt; 婴幼用品 &gt; 奶瓶', '0', '0', '2', '0', '50', 'N;', 'c7965d058c459e663f567f7cadb827f9.jpg_small.jpg', '', '50.00', '45.00', '', '0.004', 'SJHJA', '1', '3', '0', '0', '1322124542', '', '', '<img src=\"upload/store/goods/2/c7965d058c459e663f567f7cadb827f9.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('46', '10安士/300ml PP宽口大容量奶瓶 【演示数据】', '236', '母婴用品 &gt; 婴幼用品 &gt; 奶瓶', '0', '0', '2', '0', '51', 'N;', 'f83455c1f08937dd1a8f57f8d1211dea.jpg_small.jpg', '', '88.00', '66.00', '', '0.004', 'DJDJKA', '1', '2', '0', '0', '1322124750', '', '', '<img src=\"upload/store/goods/2/f83455c1f08937dd1a8f57f8d1211dea.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('47', '补水修颜2件套 深层补水保湿 美白修颜【演示数据】', '140', '美容美妆 &gt; 护肤 &gt; 护肤套装', '0', '0', '2', '0', '52', 'N;', 'f047591bb2eb594d94849d08a652e184.jpg_small.jpg', '补水', '202.00', '74.00', '', '1.000', 'MJJHJJ', '1', '2', '0', '0', '1322124819', '', '', '<img src=\"upload/store/goods/2/f047591bb2eb594d94849d08a652e184.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('48', '布朗博士 奶瓶刷 【演示数据】', '243', '母婴用品 &gt; 婴幼用品 &gt; 衣物清洗', '0', '0', '2', '0', '53', 'N;', 'ac241afe1d3741879f113f8070798056.jpg_small.jpg', '', '40.00', '30.00', '', '0.004', 'SHJHJ', '1', '2', '0', '0', '1322124850', '', '', '<img src=\"upload/store/goods/2/ac241afe1d3741879f113f8070798056.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('49', '无暇矿物精华BB霜精华胶囊 尊贵包材享优惠价格【演示数据】', '136', '美容美妆 &gt; 护肤 &gt; 面膜', '0', '0', '2', '0', '54', 'N;', '4148eb0114cca80333da1f6924856bba.jpg_small.jpg', '', '10.00', '8.00', '', '0.100', 'NMMNA', '1', '11', '0', '0', '1322124938', '', '', '<img src=\"upload/store/goods/2/4148eb0114cca80333da1f6924856bba.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '1');
INSERT INTO shop_goods VALUES ('50', '初生婴儿玻璃标准套装奶瓶2只装 原装进口 【演示数据】', '236', '母婴用品 &gt; 婴幼用品 &gt; 奶瓶', '0', '0', '2', '0', '55', 'N;', 'e8c60f1c1094163a797ea34ebc3c023e.jpg_small.jpg', '', '160.00', '156.00', '', '0.004', 'FDHJS', '1', '6', '0', '0', '1322124956', '', '', '<img src=\"upload/store/goods/2/e8c60f1c1094163a797ea34ebc3c023e.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('51', '布朗博士流量2标准硅胶奶嘴（2个吸塑装） 【演示数据】', '236', '母婴用品 &gt; 婴幼用品 &gt; 奶瓶', '0', '0', '2', '0', '56', 'N;', 'daffe84d5bc5d920b2275f84e37c5d2b.jpg_small.jpg', '', '25.00', '20.00', '', '0.004', 'WGHJHJ', '1', '1', '0', '0', '1322125083', '', '', '<img src=\"upload/store/goods/2/daffe84d5bc5d920b2275f84e37c5d2b.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('52', 'LINING 李宁服装 男圆领短袖T恤【演示数据】', '305', '运动户外	运动服包	运动POLO', '8', '0', '2', '1', '57', '', 'b9acf401ab3ab0b888316279d7f28ebf.jpg_small.jpg', '', '169.00', '99.00', '', '1.000', '', '1', '0', '0', '0', '1322125389', '', '', '<img src=\"upload/store/goods/2/b9acf401ab3ab0b888316279d7f28ebf.jpg\" /><img src=\"upload/store/goods/2/deeda5e5e9ffeaca7c824d5c9087a84e.jpg\" /><img src=\"upload/store/goods/2/3ae7d54d7e6d29e54e38150c51acbc05.jpg\" />', '', '', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('53', '布朗博士 清洁毛刷/导气管刷  【演示数据】', '236', '母婴用品 &gt; 婴幼用品 &gt; 奶瓶', '0', '0', '2', '0', '58', 'N;', 'ee9489a41d83516edb7a83c58423bed3.jpg_small.jpg', '', '9.00', '9.00', '', '0.020', 'HJDHJ', '1', '2', '0', '0', '1322125420', '', '', '<img src=\"upload/store/goods/2/ee9489a41d83516edb7a83c58423bed3.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('54', '布朗博士 PreVent安抚奶嘴(0~6个月) 【演示数据】', '236', '母婴用品 &gt; 婴幼用品 &gt; 奶瓶', '0', '0', '2', '0', '59', 'N;', 'e654670072765b2772ca0f40b23ba7f8.jpg_small.jpg', '', '50.00', '46.00', '', '0.004', 'SGHJHS', '1', '2', '0', '0', '1322125520', '', '', '<img src=\"upload/store/goods/2/e654670072765b2772ca0f40b23ba7f8.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('55', '李宁服装 男短袖翻领Polo衫【演示数据】', '305', '运动户外 &gt; 运动服包 &gt; 运动POLO', '8', '0', '2', '0', '60', 'N;', '9cefcbe37e9c0d4f488e1b8bde91d2ba.jpg_small.jpg', '', '169.00', '99.00', '', '1.000', '', '1', '3', '0', '0', '1322125654', '', '', '<img src=\"upload/store/goods/2/9cefcbe37e9c0d4f488e1b8bde91d2ba.jpg\" /><img src=\"upload/store/goods/2/d415f4459e2c3ac6931ebb90800820fb.jpg\" /><img src=\"upload/store/goods/2/5f191a69ea4ee180a1c7d1d1a6def05e.jpg\" /><img src=\"upload/store/goods/2/9d2bcb0b593ba64e7cbf457e2eaa4ec2.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('56', '好孩子仿真乳感宽口玻璃奶瓶+防胀气250ML【演示数据】', '236', '母婴用品 &gt; 婴幼用品 &gt; 奶瓶', '0', '0', '2', '0', '61', 'N;', '1c738a10d1677e694b81e7aab18a5537.jpg_small.jpg', '', '88.00', '78.00', '', '0.004', 'QHJDGH', '1', '2', '0', '0', '1322125667', '', '', '<img src=\"upload/store/goods/2/1c738a10d1677e694b81e7aab18a5537.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('57', '好孩子仿真乳感宽口径奶嘴（慢流量） 【演示数据】', '236', '母婴用品 &gt; 婴幼用品 &gt; 奶瓶', '0', '0', '2', '0', '62', 'N;', 'bd2d4c5ea3df0ceb8d2737619096fc17.jpg_small.jpg', '', '21.00', '18.00', '', '0.004', 'YSHJSS', '1', '2', '0', '0', '1322125730', '', '', '<img src=\"upload/store/goods/2/bd2d4c5ea3df0ceb8d2737619096fc17.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('58', 'LINING/李宁服装 女短袖翻领POLO衫', '305', '运动户外 &gt; 运动服包 &gt; 运动POLO', '0', '0', '2', '0', '63', 'N;', 'a490e4e7242f80d4dcf4d7fa55f2b1d5.jpg_small.jpg', '', '169.00', '99.00', '', '1.000', 'HKJK', '1', '4', '0', '0', '1322125807', '', '', '<img src=\"upload/store/goods/2/a490e4e7242f80d4dcf4d7fa55f2b1d5.jpg\" /><img src=\"upload/store/goods/2/2770b0b7f7abf7c0299568212e356079.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('59', '布朗博士 消毒奶瓶奶嘴夹【演示数据】', '236', '母婴用品 &gt; 婴幼用品 &gt; 奶瓶', '0', '0', '2', '0', '64', 'N;', '35d356949bff630693eacd64cf09eaae.jpg_small.jpg', '', '22.00', '22.00', '', '0.004', 'HJSHJS', '1', '1', '0', '0', '1322125820', '', '', '<img src=\"upload/store/goods/2/35d356949bff630693eacd64cf09eaae.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('60', '专柜正品/李宁服装 男短袖翻领POLO衫【演示数据】', '305', '运动户外 &gt; 运动服包 &gt; 运动POLO', '8', '0', '2', '0', '65', 'N;', '2dd23ee4eab519f1ab3492306039d888.jpg_small.jpg', '', '169.00', '99.00', '', '1.000', '', '1', '3', '0', '0', '1322125957', '', '', '<img src=\"upload/store/goods/2/2dd23ee4eab519f1ab3492306039d888.jpg\" /><img src=\"upload/store/goods/2/dd10cd371bcb4c94e0a6ec64d2fbfe16.jpg\" /><img src=\"upload/store/goods/2/8ae0269eeb4201a422f9096bba2eae55.jpg\" /><img src=\"upload/store/goods/2/408e90099042b141260ee49a3b8571e7.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('61', 'New Balance/新百伦服装 女短袖圆领T恤', '305', '运动户外 &gt; 运动服包 &gt; 运动POLO', '12', '0', '2', '0', '66', 'N;', '822d3f8d9c9330f074a2eb993a92d5c5.jpg_small.jpg', '', '228.00', '169.00', '', '1.000', '', '1', '3', '0', '0', '1322126168', '', '', '<img src=\"upload/store/goods/2/822d3f8d9c9330f074a2eb993a92d5c5.jpg\" /><img src=\"upload/store/goods/2/372a55a56f00539ba07fb629d6687d87.jpg\" /><img src=\"upload/store/goods/2/59d028acc1967206676d47e7bf889813.jpg\" /><img src=\"upload/store/goods/2/71784ee000d1b1c51179e7799ccf6c24.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('62', 'New Balance/新百伦服装 男式短袖圆领T恤', '305', '运动户外 &gt; 运动服包 &gt; 运动POLO', '12', '0', '2', '0', '67', 'N;', 'b16a7e3f6731b29fbb6bd236d4c9d300.jpg_small.jpg', '', '198.00', '99.00', '', '1.000', '', '1', '1', '0', '0', '1322126351', '', '', '<img src=\"upload/store/goods/2/b16a7e3f6731b29fbb6bd236d4c9d300.jpg\" /><img src=\"upload/store/goods/2/d58b293dc74985848cc60b6e03becbdc.jpg\" /><img src=\"upload/store/goods/2/340932cc8e82fd7e62591f0b266ab9c5.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('63', '正品 LINING 李宁服装 女无袖圆领背心【演示数据】', '305', '运动户外 &gt; 运动服包 &gt; 运动POLO', '8', '0', '2', '0', '68', 'N;', '25ac30b73f939eb502d3a5523a41e493.jpg_small.jpg', '', '99.00', '80.00', '', '1.000', '', '1', '3', '0', '0', '1322126539', '', '', '<img src=\"upload/store/goods/2/25ac30b73f939eb502d3a5523a41e493.jpg\" /><img src=\"upload/store/goods/2/5c169228f0f4d8ad2cae5b132c2b269c.jpg\" /><img src=\"upload/store/goods/2/a4d3c77c3586028480f9a333fc987886.jpg\" />', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('64', '新百伦newbalance专柜正品男式运动鞋【演示数据】', '290', '运动户外 &gt; 运动鞋帽 &gt; 休闲鞋', '12', '2', '2', '1', '181', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '10edbe1528c2eef0feb5a956410f5b3b.jpg_small.jpg', '', '600.00', '580.00', '', '1.000', '', '1', '2', '0', '0', '1322126686', '', '', '<img src=\"upload/store/goods/2/10edbe1528c2eef0feb5a956410f5b3b.jpg\" />', 'N;', 'a:2:{i:3;a:3:{i:25;s:2:\"37\";i:26;s:2:\"38\";i:27;s:2:\"39\";}i:1;a:1:{i:8;s:6:\"褐色\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('65', '零食喜糖好利源软糖鲜乳球婚庆糖果250g混合口味【演示数据】', '209', '食品保健 &gt; 休闲零食 &gt; 糖果', '0', '0', '2', '0', '71', 'N;', 'c1cb7ee7bc9b9e4a13bb2d7cc488818b.jpg_small.jpg', '', '3.00', '3.00', '', '0.250', '', '1', '1', '0', '0', '1322126881', '', '', '<img src=\"upload/store/goods/2/c1cb7ee7bc9b9e4a13bb2d7cc488818b.jpg\" />', 'N;', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('66', '李宁 lining 专柜正品 足球鞋 女式运动鞋【演示数据】', '290', '运动户外 &gt; 运动鞋帽 &gt; 休闲鞋', '8', '2', '2', '1', '176', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '1dbc94fa0d60cba3990b89ccb01f82c2.jpg_small.jpg', '', '198.00', '98.00', '', '1.000', '', '1', '28', '0', '0', '1322126969', '', '', '<img src=\"upload/store/goods/2/a2258c47de1b91c6fa08de36823d6bae.jpg\" /><img src=\"upload/store/goods/2/b6ecbd61c97a508e138c8f04b8fba112.jpg\" /><img src=\"upload/store/goods/2/1dbc94fa0d60cba3990b89ccb01f82c2.jpg\" />', 'N;', 'a:2:{i:3;a:4:{i:23;s:2:\"35\";i:24;s:2:\"36\";i:25;s:2:\"37\";i:26;s:2:\"38\";}i:1;a:1:{i:2;s:6:\"黑色\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('67', '优之良品橡皮糖黄芒果橡皮糖软糖零食QQ糖250【演示数据】', '209', '食品保健 &gt; 休闲零食 &gt; 糖果', '0', '0', '2', '0', '74', 'N;', '6f8ff741b6c12a2d6f9cce86eb6cf1ad.jpg_small.jpg', '', '20.00', '18.00', '', '0.250', '', '1', '2', '0', '0', '1322126971', '', '', '<img src=\"upload/store/goods/2/6f8ff741b6c12a2d6f9cce86eb6cf1ad.jpg\" />', 'N;', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('68', '梅怡馆大畈屋梅饴馆熟梅老梅干礼盒1/1160克【演示数据】', '222', '食品保健 &gt; 蜜饯果脯 &gt; 梅类', '0', '0', '2', '0', '75', 'N;', 'ba1e3b3b70a0c7f96975833adfecacd3.jpeg_small.jpeg', '', '48.00', '36.00', '', '0.240', '', '1', '29', '0', '0', '1322127129', '', '', '<img src=\"upload/store/goods/2/ba1e3b3b70a0c7f96975833adfecacd3.jpeg\" />', 'N;', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('69', '福建特产蜜饯话梅旺梅酸甜可口肉质爽甜健脾开胃【演示数据】', '222', '食品保健 &gt; 蜜饯果脯 &gt; 梅类', '12', '0', '2', '0', '76', 'N;', '52f831e8e55240c3f9d529976b88f8f0.jpg_small.jpg', '', '25.00', '22.80', '', '0.240', '', '1', '1', '0', '0', '1322127196', '', '', '<img src=\"upload/store/goods/2/52f831e8e55240c3f9d529976b88f8f0.jpg\" />', 'N;', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('70', '三叶草adidasSUPERSTARIICQ正品男式运动鞋', '290', '运动户外 &gt; 运动鞋帽 &gt; 休闲鞋', '2', '2', '2', '1', '124', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '49612054bdba0511da6eeb3a474abdee.jpg_small.jpg', '', '820.00', '519.00', '519.00 - 519.00', '1.000', 'JKJK', '1', '5', '0', '0', '1322127232', '', '', '<img src=\"upload/store/goods/2/307bd37b7d0baebab00fb9fe9833b0a0.jpg\" /><img src=\"upload/store/goods/2/2824bb216ee85b8068ee00c0cde1d355.jpg\" /><img src=\"upload/store/goods/2/64f064ab87662337cb66615acba079de.jpg\" /><img src=\"upload/store/goods/2/82cbaa729a2fcd27725370101be387e2.jpg\" />', 'N;', 'a:2:{i:3;a:11:{i:23;s:2:\"35\";i:24;s:2:\"36\";i:25;s:2:\"37\";i:26;s:2:\"38\";i:27;s:2:\"39\";i:28;s:2:\"40\";i:30;s:2:\"42\";i:31;s:2:\"43\";i:32;s:2:\"44\";i:33;s:2:\"45\";i:34;s:2:\"46\";}i:1;a:1:{i:1;s:6:\"白色\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('71', '梅怡馆大畈屋梅饴馆生梅老梅干礼盒1/1 160克【演示数据】', '222', '食品保健 &gt; 蜜饯果脯 &gt; 梅类', '0', '0', '2', '0', '78', 'N;', '6d9d3912f417bb1cd5c77264e35a7431.jpeg_small.jpeg', '', '42.00', '39.00', '', '0.240', '', '1', '3', '0', '0', '1322127278', '', '', '<img src=\"upload/store/goods/2/6d9d3912f417bb1cd5c77264e35a7431.jpeg\" />', 'N;', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('84', '新款鳄鱼恤男式钱包 进口二层牛皮男皮夹钱包', '105', '鞋包配饰 &gt; 皮具箱包 &gt; 钱包/卡套', '0', '3', '2', '1', '184', 'a:1:{i:1;s:6:\"颜色\";}', '9a52993ed687970a1e012444d2061872.jpg_small.jpg', '', '298.00', '198.00', '', '0.000', '', '1', '5', '0', '1', '1329992741', '', '', '', 'a:2:{i:4;a:2:{s:4:\"name\";s:6:\"质地\";i:18;s:6:\"牛皮\";}i:5;a:2:{s:4:\"name\";s:12:\"箱包外形\";i:0;s:0:\"\";}}', 'a:1:{i:1;a:2:{i:2;s:6:\"黑色\";i:8;s:6:\"褐色\";}}', null, '0', '0', '0', '0', '0', '1', '0', null, '1', '0');
INSERT INTO shop_goods VALUES ('73', '正品一屋窑玻璃花茶杯400ml带盖玻璃杯子 【演示数据】', '199', '家居家装 &gt; 厨房餐饮 &gt; 茶具', '0', '4', '2', '0', '80', 'N;', '5ca2a9d6a2745f95d5ef1c481706eec4.jpg_small.jpg', '', '37.00', '29.00', '', '0.800', '', '1', '0', '0', '0', '1322129523', '', '', '<img src=\"upload/store/goods/2/5ca2a9d6a2745f95d5ef1c481706eec4.jpg\" />', 'N;', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('74', '送礼套装 一屋窑玻璃功夫茶具 花茶壶套组特价  【演示数据】', '199', '家居家装 &gt; 厨房餐饮 &gt; 茶具', '0', '4', '2', '0', '81', 'N;', '91331d65f7c0a0d4e107dcd0108e2f43.jpg_small.jpg', '', '98.00', '88.00', '', '1.000', '', '1', '27', '0', '0', '1322129595', '', '', '<img src=\"upload/store/goods/2/91331d65f7c0a0d4e107dcd0108e2f43.jpg\" />', 'a:4:{i:6;a:2:{s:4:\"name\";s:6:\"类型\";i:31;s:6:\"茶壶\";}i:11;a:2:{s:4:\"name\";s:18:\"推荐使用人数\";i:51;s:4:\"4人\";}i:7;a:2:{s:4:\"name\";s:6:\"材质\";i:34;s:3:\"陶\";}i:10;a:2:{s:4:\"name\";s:12:\"价格区间\";i:43;s:13:\"50元-99.9元\";}}', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('75', '辉跃经典 骨瓷茶具套装\\整套功夫陶瓷茶具\\雕刻实木茶盘', '199', '家居家装 &gt; 厨房餐饮 &gt; 茶具', '0', '4', '2', '0', '82', 'N;', 'f415ae8aff2f253ed0344c9aa7e4ea89.jpg_small.jpg', '', '150.00', '140.00', '', '2.000', '', '1', '53', '0', '0', '1322129792', '', '', '<img src=\"upload/store/goods/2/f415ae8aff2f253ed0344c9aa7e4ea89.jpg\" />', 'a:4:{i:6;a:2:{s:4:\"name\";s:6:\"类型\";i:29;s:18:\"整套功夫茶具\";}i:11;a:2:{s:4:\"name\";s:18:\"推荐使用人数\";i:53;s:4:\"6人\";}i:7;a:2:{s:4:\"name\";s:6:\"材质\";i:35;s:21:\"45%以上骨粉骨瓷\";}i:10;a:2:{s:4:\"name\";s:12:\"价格区间\";i:45;s:13:\"150元-199元\";}}', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('76', '特价茶具茶盘 实木茶盘 大小茶海 茶托 抽屉式茶台 木制茶盘', '199', '家居家装 &gt; 厨房餐饮 &gt; 茶具', '0', '4', '2', '0', '83', 'N;', 'eb26eccc4071b56e4abd1495682af490.jpg_small.jpg', '', '88.00', '68.00', '', '2.000', '', '1', '3', '0', '0', '1322129873', '', '', '<img src=\"upload/store/goods/2/eb26eccc4071b56e4abd1495682af490.jpg\" />', 'a:4:{i:6;a:2:{s:4:\"name\";s:6:\"类型\";i:30;s:6:\"茶杯\";}i:11;a:2:{s:4:\"name\";s:18:\"推荐使用人数\";i:49;s:4:\"2人\";}i:7;a:2:{s:4:\"name\";s:6:\"材质\";i:35;s:21:\"45%以上骨粉骨瓷\";}i:10;a:2:{s:4:\"name\";s:12:\"价格区间\";i:43;s:13:\"50元-99.9元\";}}', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('77', '鸿跃茶具 特价紫砂茶具茶盘套装 38件套整套功夫茶具', '199', '家居家装 &gt; 厨房餐饮 &gt; 茶具', '0', '4', '2', '0', '84', 'N;', '29278568dd67ead3855205e6793f0395.jpg_small.jpg', '', '160.00', '148.00', '', '2.000', '', '1', '3', '0', '0', '1322129976', '', '', '<img src=\"upload/store/goods/2/29278568dd67ead3855205e6793f0395.jpg\" />', 'a:4:{i:6;a:2:{s:4:\"name\";s:6:\"类型\";i:29;s:18:\"整套功夫茶具\";}i:11;a:2:{s:4:\"name\";s:18:\"推荐使用人数\";i:53;s:4:\"6人\";}i:7;a:2:{s:4:\"name\";s:6:\"材质\";i:33;s:3:\"瓷\";}i:10;a:2:{s:4:\"name\";s:12:\"价格区间\";i:45;s:13:\"150元-199元\";}}', 'N;', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('78', '花开有声系列编织立体花手提/斜挎包【演示数据】', '96', '鞋包配饰 &gt; 皮具箱包 &gt; 单肩包', '0', '3', '2', '1', '116', 'a:1:{i:1;s:6:\"颜色\";}', 'f32edceb5b68790d871014aee77c267e.jpg_small.jpg', '', '208.00', '100.00', '100.00 - 107.00', '1.000', '', '1', '1', '0', '0', '1322129992', '', '', '<img src=\"upload/store/goods/2/f32edceb5b68790d871014aee77c267e.jpg\" /><img src=\"upload/store/goods/2/789401aac6d5355542e32e123d1c247d.jpg\" /><img src=\"upload/store/goods/2/cab18b2cbd6bdc2f71bad484609b4be4.jpg\" />', 'a:2:{i:4;a:2:{s:4:\"name\";s:6:\"质地\";i:17;s:2:\"PU\";}i:5;a:2:{s:4:\"name\";s:12:\"箱包外形\";i:23;s:12:\"横款方形\";}}', 'a:1:{i:1;a:2:{i:4;s:6:\"红色\";i:10;s:6:\"粉色\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('79', '优雅怡然系列丝巾单肩包【演示数据】', '96', '鞋包配饰 &gt; 皮具箱包 &gt; 单肩包', '0', '3', '2', '1', '98', 'a:1:{i:1;s:6:\"颜色\";}', '56e80d30a3983258950612dbc0a280db.jpg_small.jpg', '', '200.00', '100.00', '', '1.000', '', '1', '4', '0', '0', '1322130283', '', '', '<img src=\"upload/store/goods/2/56e80d30a3983258950612dbc0a280db.jpg\" /><img src=\"upload/store/goods/2/fa743bbde1dc677b22043b6d4d5542fb.jpg\" /><img src=\"upload/store/goods/2/373a4f09bf5173cc6088ad2053734b2e.jpg\" />', 'a:2:{i:4;a:2:{s:4:\"name\";s:6:\"质地\";i:17;s:2:\"PU\";}i:5;a:2:{s:4:\"name\";s:12:\"箱包外形\";i:26;s:9:\"圆桶形\";}}', 'a:1:{i:1;a:2:{i:2;s:6:\"黑色\";i:10;s:6:\"粉色\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('80', '盛世华章系列单肩包【演示数据】', '96', '鞋包配饰 &gt; 皮具箱包 &gt; 单肩包', '0', '3', '2', '1', '96', 'a:1:{i:1;s:6:\"颜色\";}', '92a7a0913bf7ba41e9a3a5e46706c35d.jpg_small.jpg', '', '300.00', '298.00', '298.00 - 310.00', '1.000', 'HJKH', '1', '6', '0', '0', '1322130455', '', '', '<img src=\"upload/store/goods/2/92a7a0913bf7ba41e9a3a5e46706c35d.jpg\" /><img src=\"upload/store/goods/2/f49d92932c787fd90b2daf299d95615c.jpg\" /><img src=\"upload/store/goods/2/266dc555784293114c03fa10492cb490.jpg\" />', 'a:2:{i:4;a:2:{s:4:\"name\";s:6:\"质地\";i:18;s:6:\"牛皮\";}i:5;a:2:{s:4:\"name\";s:12:\"箱包外形\";i:24;s:12:\"竖款方形\";}}', 'a:1:{i:1;a:2:{i:4;s:6:\"红色\";i:8;s:6:\"褐色\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('81', '糖心风暴系列立体花曼谷包单肩包【演示数据】', '96', '鞋包配饰 &gt; 皮具箱包 &gt; 单肩包', '0', '3', '2', '1', '94', 'a:1:{i:1;s:6:\"颜色\";}', 'e5186d77fb2c636d2d4858c2755707db.jpg_small.jpg', '', '200.00', '178.00', '', '1.000', '', '1', '8', '0', '0', '1322130680', '', '', '<img src=\"upload/store/goods/2/e5186d77fb2c636d2d4858c2755707db.jpg\" /><img src=\"upload/store/goods/2/a5559a1bdd4f2cb01c790d2fdae806fb.jpg\" /><img src=\"upload/store/goods/2/02d26fc576d4a1e5aa04c10383b55dc5.jpg\" />', 'a:2:{i:4;a:2:{s:4:\"name\";s:6:\"质地\";i:17;s:2:\"PU\";}i:5;a:2:{s:4:\"name\";s:12:\"箱包外形\";i:26;s:9:\"圆桶形\";}}', 'a:1:{i:1;a:2:{i:2;s:6:\"黑色\";i:3;s:6:\"紫色\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('82', '都市OL系列牛皮两用包【演示数据】', '96', '鞋包配饰 &gt; 皮具箱包 &gt; 单肩包', '0', '3', '2', '1', '91', 'a:1:{i:1;s:6:\"颜色\";}', '2cd6bc3e70205057c54f2cd1ed7f7084.jpg_small.jpg', '', '300.00', '269.00', '', '1.000', '', '1', '145', '0', '0', '1322131095', '', '', '<img src=\"upload/store/goods/2/2cd6bc3e70205057c54f2cd1ed7f7084.jpg\" /><img src=\"upload/store/goods/2/904c83a95da5380b136bb295d53245b5.jpg\" /><img src=\"upload/store/goods/2/c3820ec42dde8802b85a8f2c8c190cf2.jpg\" />', 'a:2:{i:4;a:2:{s:4:\"name\";s:6:\"质地\";i:18;s:6:\"牛皮\";}i:5;a:2:{s:4:\"name\";s:12:\"箱包外形\";i:23;s:12:\"横款方形\";}}', 'a:1:{i:1;a:3:{i:1;s:6:\"白色\";i:4;s:6:\"红色\";i:7;s:6:\"蓝色\";}}', '', '0', '0', '0', '0', '0', '1', '0', null, '0', '0');
INSERT INTO shop_goods VALUES ('83', '金士顿TF 8G卡', '166', '数码家电 &gt; 手机 &gt; 手机配件', '0', '0', '2', '0', '180', 'N;', '951803703f9d12009f3a29b887aa5460.jpg_small.jpg', '', '119.00', '99.00', '', '0.000', '', '1', '3', '0', '1', '1329992292', '', '', '', 'N;', 'N;', null, '0', '0', '0', '0', '0', '1', '0', null, '1', '0');

-- ----------------------------
-- Table structure for `shop_goods_attr_index`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_attr_index`;
CREATE TABLE `shop_goods_attr_index` (
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `attr_id` int(10) unsigned NOT NULL COMMENT '属性id',
  `attr_value_id` int(10) unsigned NOT NULL COMMENT '属性值id',
  PRIMARY KEY  (`goods_id`,`gc_id`,`attr_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods_attr_index
-- ----------------------------
INSERT INTO shop_goods_attr_index VALUES ('28', '19', '1', '3', '15');
INSERT INTO shop_goods_attr_index VALUES ('28', '19', '1', '2', '7');
INSERT INTO shop_goods_attr_index VALUES ('28', '19', '1', '1', '1');
INSERT INTO shop_goods_attr_index VALUES ('27', '16', '1', '3', '16');
INSERT INTO shop_goods_attr_index VALUES ('27', '16', '1', '2', '11');
INSERT INTO shop_goods_attr_index VALUES ('27', '16', '1', '1', '1');
INSERT INTO shop_goods_attr_index VALUES ('79', '96', '3', '5', '26');
INSERT INTO shop_goods_attr_index VALUES ('79', '96', '3', '4', '17');
INSERT INTO shop_goods_attr_index VALUES ('81', '96', '3', '5', '26');
INSERT INTO shop_goods_attr_index VALUES ('81', '96', '3', '4', '17');
INSERT INTO shop_goods_attr_index VALUES ('80', '96', '3', '5', '24');
INSERT INTO shop_goods_attr_index VALUES ('80', '96', '3', '4', '18');
INSERT INTO shop_goods_attr_index VALUES ('82', '96', '3', '5', '23');
INSERT INTO shop_goods_attr_index VALUES ('82', '96', '3', '4', '18');
INSERT INTO shop_goods_attr_index VALUES ('78', '96', '3', '5', '23');
INSERT INTO shop_goods_attr_index VALUES ('78', '96', '3', '4', '17');
INSERT INTO shop_goods_attr_index VALUES ('25', '15', '1', '1', '1');
INSERT INTO shop_goods_attr_index VALUES ('25', '15', '1', '2', '7');
INSERT INTO shop_goods_attr_index VALUES ('25', '15', '1', '3', '15');
INSERT INTO shop_goods_attr_index VALUES ('24', '19', '1', '1', '1');
INSERT INTO shop_goods_attr_index VALUES ('24', '19', '1', '2', '7');
INSERT INTO shop_goods_attr_index VALUES ('24', '19', '1', '3', '15');
INSERT INTO shop_goods_attr_index VALUES ('22', '19', '1', '1', '1');
INSERT INTO shop_goods_attr_index VALUES ('22', '19', '1', '2', '10');
INSERT INTO shop_goods_attr_index VALUES ('22', '19', '1', '3', '16');
INSERT INTO shop_goods_attr_index VALUES ('21', '17', '1', '1', '1');
INSERT INTO shop_goods_attr_index VALUES ('21', '17', '1', '2', '7');
INSERT INTO shop_goods_attr_index VALUES ('21', '17', '1', '3', '15');
INSERT INTO shop_goods_attr_index VALUES ('19', '17', '1', '1', '1');
INSERT INTO shop_goods_attr_index VALUES ('19', '17', '1', '2', '9');
INSERT INTO shop_goods_attr_index VALUES ('19', '17', '1', '3', '16');
INSERT INTO shop_goods_attr_index VALUES ('16', '17', '1', '1', '1');
INSERT INTO shop_goods_attr_index VALUES ('16', '17', '1', '2', '7');
INSERT INTO shop_goods_attr_index VALUES ('16', '17', '1', '3', '16');
INSERT INTO shop_goods_attr_index VALUES ('2', '16', '1', '1', '1');
INSERT INTO shop_goods_attr_index VALUES ('2', '16', '1', '2', '7');
INSERT INTO shop_goods_attr_index VALUES ('2', '16', '1', '3', '16');
INSERT INTO shop_goods_attr_index VALUES ('11', '174', '5', '8', '38');
INSERT INTO shop_goods_attr_index VALUES ('11', '174', '5', '9', '40');
INSERT INTO shop_goods_attr_index VALUES ('10', '174', '5', '8', '37');
INSERT INTO shop_goods_attr_index VALUES ('10', '174', '5', '9', '41');
INSERT INTO shop_goods_attr_index VALUES ('12', '16', '1', '1', '1');
INSERT INTO shop_goods_attr_index VALUES ('12', '16', '1', '2', '13');
INSERT INTO shop_goods_attr_index VALUES ('12', '16', '1', '3', '16');
INSERT INTO shop_goods_attr_index VALUES ('9', '174', '5', '8', '38');
INSERT INTO shop_goods_attr_index VALUES ('9', '174', '5', '9', '41');
INSERT INTO shop_goods_attr_index VALUES ('8', '174', '5', '8', '38');
INSERT INTO shop_goods_attr_index VALUES ('8', '174', '5', '9', '40');
INSERT INTO shop_goods_attr_index VALUES ('7', '174', '5', '8', '37');
INSERT INTO shop_goods_attr_index VALUES ('7', '174', '5', '9', '41');
INSERT INTO shop_goods_attr_index VALUES ('6', '174', '5', '8', '38');
INSERT INTO shop_goods_attr_index VALUES ('6', '174', '5', '9', '40');
INSERT INTO shop_goods_attr_index VALUES ('5', '174', '5', '8', '38');
INSERT INTO shop_goods_attr_index VALUES ('5', '174', '5', '9', '41');
INSERT INTO shop_goods_attr_index VALUES ('4', '174', '5', '8', '38');
INSERT INTO shop_goods_attr_index VALUES ('4', '174', '5', '9', '41');
INSERT INTO shop_goods_attr_index VALUES ('3', '174', '5', '8', '38');
INSERT INTO shop_goods_attr_index VALUES ('3', '174', '5', '9', '41');
INSERT INTO shop_goods_attr_index VALUES ('77', '199', '4', '6', '29');
INSERT INTO shop_goods_attr_index VALUES ('77', '199', '4', '11', '53');
INSERT INTO shop_goods_attr_index VALUES ('77', '199', '4', '7', '33');
INSERT INTO shop_goods_attr_index VALUES ('77', '199', '4', '10', '45');
INSERT INTO shop_goods_attr_index VALUES ('1', '174', '5', '8', '37');
INSERT INTO shop_goods_attr_index VALUES ('1', '174', '5', '9', '40');
INSERT INTO shop_goods_attr_index VALUES ('76', '199', '4', '6', '30');
INSERT INTO shop_goods_attr_index VALUES ('76', '199', '4', '11', '49');
INSERT INTO shop_goods_attr_index VALUES ('76', '199', '4', '7', '35');
INSERT INTO shop_goods_attr_index VALUES ('76', '199', '4', '10', '43');
INSERT INTO shop_goods_attr_index VALUES ('75', '199', '4', '6', '29');
INSERT INTO shop_goods_attr_index VALUES ('75', '199', '4', '11', '53');
INSERT INTO shop_goods_attr_index VALUES ('75', '199', '4', '7', '35');
INSERT INTO shop_goods_attr_index VALUES ('75', '199', '4', '10', '45');
INSERT INTO shop_goods_attr_index VALUES ('74', '199', '4', '6', '31');
INSERT INTO shop_goods_attr_index VALUES ('74', '199', '4', '11', '51');
INSERT INTO shop_goods_attr_index VALUES ('74', '199', '4', '7', '34');
INSERT INTO shop_goods_attr_index VALUES ('74', '199', '4', '10', '43');
INSERT INTO shop_goods_attr_index VALUES ('84', '105', '3', '4', '18');

-- ----------------------------
-- Table structure for `shop_goods_class`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_class`;
CREATE TABLE `shop_goods_class` (
  `gc_id` int(10) unsigned NOT NULL auto_increment COMMENT '索引ID',
  `gc_name` varchar(100) NOT NULL COMMENT '分类名称',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `store_id` int(10) unsigned NOT NULL default '0' COMMENT '店铺ID，0为系统后台发布',
  `gc_parent_id` int(10) unsigned NOT NULL default '0' COMMENT '父ID',
  `gc_sort` tinyint(1) unsigned NOT NULL default '0' COMMENT '排序',
  `gc_show` tinyint(1) NOT NULL default '1' COMMENT '前台显示，0为否，1为是，默认为1\r\n首页顶部列表显示',
  `gc_index_show` tinyint(1) NOT NULL default '1' COMMENT '首页显示 1：默认 显示 0：不显示,首页底部推荐',
  PRIMARY KEY  (`gc_id`),
  KEY `store_id` (`store_id`,`gc_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=344 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods_class
-- ----------------------------
INSERT INTO shop_goods_class VALUES ('1', '男女服装', '1', '服装', '0', '0', '1', '1', '1');
INSERT INTO shop_goods_class VALUES ('2', '鞋包配饰', '0', '', '0', '0', '2', '1', '1');
INSERT INTO shop_goods_class VALUES ('3', '美容美妆', '0', '', '0', '0', '3', '1', '1');
INSERT INTO shop_goods_class VALUES ('4', '数码家电', '0', '', '0', '0', '5', '1', '1');
INSERT INTO shop_goods_class VALUES ('5', '家居家装', '0', '', '0', '0', '6', '1', '1');
INSERT INTO shop_goods_class VALUES ('6', '食品保健', '0', '', '0', '0', '7', '1', '1');
INSERT INTO shop_goods_class VALUES ('7', '母婴用品', '0', '', '0', '0', '8', '1', '1');
INSERT INTO shop_goods_class VALUES ('8', '运动户外', '0', '', '0', '0', '4', '1', '1');
INSERT INTO shop_goods_class VALUES ('9', '文化娱乐', '0', '', '0', '0', '9', '1', '0');
INSERT INTO shop_goods_class VALUES ('10', '话费网游', '0', '', '0', '0', '10', '1', '0');
INSERT INTO shop_goods_class VALUES ('11', '票务旅游', '0', '', '0', '0', '11', '1', '0');
INSERT INTO shop_goods_class VALUES ('12', '女装', '1', '服装', '0', '1', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('13', '男装', '1', '服装', '0', '1', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('14', '内衣/睡衣', '1', '服装', '0', '1', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('15', '羽绒服', '1', '服装', '0', '13', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('16', '棉衣', '1', '服装', '0', '12', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('17', '毛呢大衣', '1', '服装', '0', '12', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('18', '风衣', '1', '服装', '0', '12', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('19', '打底衫', '1', '服装', '0', '12', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('20', '情侣装', '1', '服装', '0', '12', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('21', '毛呢短裤', '1', '服装', '0', '12', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('22', '牛仔裤', '1', '服装', '0', '12', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('23', '加绒打底裤', '1', '服装', '0', '12', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('24', '小脚裤', '1', '服装', '0', '12', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('25', '半身裙', '1', '服装', '0', '12', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('26', '毛呢连衣裙', '1', '服装', '0', '12', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('27', '长袖连衣裙', '1', '服装', '0', '12', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('28', '卫衣', '1', '服装', '0', '13', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('29', '长袖T恤', '1', '服装', '0', '13', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('30', '长袖衬衫', '1', '服装', '0', '13', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('31', '品质秋冬外套', '1', '服装', '0', '13', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('32', '风衣', '1', '服装', '0', '13', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('33', '休闲西装', '1', '服装', '0', '13', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('34', '棉衣', '1', '服装', '0', '13', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('35', '休闲长裤', '1', '服装', '0', '13', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('36', '内衣内裤', '1', '服装', '0', '13', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('37', '保暖内衣', '1', '服装', '0', '14', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('38', '保暖打底裤', '1', '服装', '0', '14', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('39', '秋冬睡衣', '1', '服装', '0', '14', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('40', '珊瑚绒睡衣', '1', '服装', '0', '14', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('41', '塑身内衣', '1', '服装', '0', '14', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('42', '文胸套装', '1', '服装', '0', '14', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('43', '文胸', '1', '服装', '0', '14', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('44', '内裤', '1', '服装', '0', '14', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('45', '袜子', '1', '服装', '0', '14', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('46', '连裤袜', '1', '服装', '0', '14', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('47', '棉袜', '1', '服装', '0', '14', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('48', '话费', '0', '', '0', '10', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('49', '保险', '0', '', '0', '10', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('50', '腾讯业务', '0', '', '0', '10', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('51', '话费直充', '0', '', '0', '48', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('52', '移动充值卡', '0', '', '0', '48', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('53', '联通充值卡', '0', '', '0', '48', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('54', '电信充值卡', '0', '', '0', '48', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('55', '固话充值卡', '0', '', '0', '48', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('56', 'IP卡', '0', '', '0', '48', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('57', '网络电话', '0', '', '0', '48', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('58', '手机号码卡', '0', '', '0', '48', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('341', '家具', '0', '', '0', '5', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('343', '茶几', '0', '', '0', '341', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('342', '沙发', '0', '', '0', '341', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('75', '旅行意外险', '0', '', '0', '49', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('76', '自驾意外险', '0', '', '0', '49', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('77', '家庭财产险', '0', '', '0', '49', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('78', '老人骨折险', '0', '', '0', '49', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('79', '家财火宅险', '0', '', '0', '49', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('80', '车险', '0', '', '0', '49', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('81', 'Q币充值', '0', '', '0', '50', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('82', 'Q点充值', '0', '', '0', '50', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('83', 'QQ卡', '0', '', '0', '50', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('84', '超级QQ', '0', '', '0', '50', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('85', 'QQ会员', '0', '', '0', '50', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('86', '红钻', '0', '', '0', '50', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('87', '黄钻', '0', '', '0', '50', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('88', '绿钻', '0', '', '0', '50', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('89', '蓝钻', '0', '', '0', '50', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('90', 'DNF黑钻', '0', '', '0', '50', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('91', 'CF会员', '0', '', '0', '50', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('92', '音速紫钻', '0', '', '0', '50', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('93', '皮具箱包', '3', '箱包', '0', '2', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('94', '男鞋', '2', '鞋码', '0', '2', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('95', '女鞋', '2', '鞋码', '0', '2', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('96', '单肩包', '3', '箱包', '0', '93', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('97', '手提包', '3', '箱包', '0', '93', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('98', '斜挎包', '3', '箱包', '0', '93', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('99', '多功能包', '3', '箱包', '0', '93', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('100', '双肩包', '3', '箱包', '0', '93', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('101', '旅行箱', '3', '箱包', '0', '93', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('102', '男包', '3', '箱包', '0', '93', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('103', '电脑数码包', '3', '箱包', '0', '93', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('104', '真皮包', '3', '箱包', '0', '93', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('105', '钱包/卡套', '3', '箱包', '0', '93', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('106', '秋季新款', '2', '鞋码', '0', '94', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('107', '商城精品', '2', '鞋码', '0', '94', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('108', '舒适男鞋', '2', '鞋码', '0', '94', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('109', '保暖必备', '2', '鞋码', '0', '94', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('110', '冬靴来了', '2', '鞋码', '0', '95', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('111', '短靴踝靴', '2', '鞋码', '0', '95', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('112', '中筒靴', '2', '鞋码', '0', '95', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('113', '雪地靴', '2', '鞋码', '0', '95', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('114', '单鞋', '2', '鞋码', '0', '95', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('115', '经典中跟', '2', '鞋码', '0', '95', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('116', '显腿瘦高跟', '2', '鞋码', '0', '95', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('117', '舒适平跟', '2', '鞋码', '0', '95', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('118', '帆布鞋', '2', '鞋码', '0', '95', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('119', '爆潮厚底鞋', '2', '鞋码', '0', '95', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('120', '休闲鞋', '2', '鞋码', '0', '95', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('121', '凉鞋清仓', '2', '鞋码', '0', '95', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('122', '护肤', '0', '', '0', '3', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('123', '彩妆', '0', '', '0', '3', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('124', '男士', '0', '', '0', '3', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('125', '男士洁面', '0', '', '0', '124', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('126', '男士乳液', '0', '', '0', '124', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('127', '男士爽肤水', '0', '', '0', '124', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('128', '男士套装', '0', '', '0', '124', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('129', '睫毛膏', '0', '', '0', '123', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('130', '粉底液', '0', '', '0', '123', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('131', '粉饼', '0', '', '0', '123', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('132', '眼线', '0', '', '0', '123', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('133', '唇彩', '0', '', '0', '123', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('134', '眼影', '0', '', '0', '123', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('135', '指甲油', '0', '', '0', '123', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('136', '面膜', '0', '', '0', '122', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('137', '洁面', '0', '', '0', '122', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('138', '爽肤水', '0', '', '0', '122', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('139', '面霜/乳液', '0', '', '0', '122', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('140', '护肤套装', '0', '', '0', '122', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('141', '面部精华', '0', '', '0', '122', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('142', '喷雾', '0', '', '0', '122', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('143', '隔离/防晒', '0', '', '0', '122', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('144', '眼霜', '0', '', '0', '122', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('145', '润唇膏', '0', '', '0', '122', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('146', 'T区护理', '0', '', '0', '122', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('147', '卸妆', '0', '', '0', '122', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('148', '手机', '0', '', '0', '4', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('149', '相机', '5', '照相机', '0', '4', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('150', '笔记本', '0', '', '0', '4', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('151', '团I3独显本', '0', '', '0', '150', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('152', '联想', '0', '', '0', '150', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('153', '苹果', '0', '', '0', '150', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('154', '华硕', '0', '', '0', '150', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('155', '惠普', '0', '', '0', '150', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('156', '宏基', '0', '', '0', '150', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('157', '戴尔', '0', '', '0', '150', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('158', '索尼', '0', '', '0', '150', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('159', '东芝', '0', '', '0', '150', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('160', '三星', '0', '', '0', '150', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('161', '神舟', '0', '', '0', '150', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('162', 'iphone4', '0', '', '0', '148', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('163', 'iPhone4s', '0', '', '0', '148', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('164', 'ME525', '0', '', '0', '148', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('165', '导航手机', '0', '', '0', '148', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('166', '手机配件', '0', '', '0', '148', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('167', '三星/手机', '0', '', '0', '148', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('168', '3G/智能', '0', '', '0', '148', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('169', '摩托罗拉', '0', '', '0', '148', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('170', 'NOKIA', '0', '', '0', '148', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('171', 'HTC', '0', '', '0', '148', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('172', 'htc/G13', '0', '', '0', '148', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('173', '卡片机', '5', '照相机', '0', '149', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('174', '单反', '5', '照相机', '0', '149', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('175', '摄像机', '5', '照相机', '0', '149', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('176', '佳能', '5', '照相机', '0', '149', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('177', '家纺床品', '0', '', '0', '5', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('178', '居家日用', '0', '', '0', '5', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('179', '厨房餐饮', '0', '', '0', '5', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('180', '床品套件', '0', '', '0', '177', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('181', '春夏被', '0', '', '0', '177', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('182', '保健枕', '0', '', '0', '177', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('183', '蚊帐', '0', '', '0', '177', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('184', '收纳整理', '0', '', '0', '178', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('185', '家务清洁', '0', '', '0', '178', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('186', '洗晒用具', '0', '', '0', '178', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('187', '卫浴用具', '0', '', '0', '178', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('188', '个人护理', '0', '', '0', '178', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('189', '雨伞雨具', '0', '', '0', '178', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('190', '驱蚊驱虫', '0', '', '0', '178', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('191', '居家杂货', '0', '', '0', '178', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('192', '烹饪锅具', '0', '', '0', '179', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('193', '烹饪勺铲', '0', '', '0', '179', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('194', '调味瓶罐', '0', '', '0', '179', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('195', '厨房帮手', '0', '', '0', '179', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('196', '保鲜盒', '0', '', '0', '179', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('197', '餐具', '0', '', '0', '179', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('198', '水杯水壶', '0', '', '0', '179', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('199', '茶具', '4', '茶具', '0', '179', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('200', '休闲零食', '0', '', '0', '6', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('201', '茶叶茗品', '0', '', '0', '6', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('202', '蜜饯果脯', '0', '', '0', '6', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('203', '鸭脖', '0', '', '0', '200', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('204', '鸭舌', '0', '', '0', '200', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('205', '鸡翅', '0', '', '0', '200', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('206', '牛肉干', '0', '', '0', '200', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('207', '猪肉脯', '0', '', '0', '200', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('208', '猪肉松', '0', '', '0', '200', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('209', '糖果', '0', '', '0', '200', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('210', '鱿鱼丝', '0', '', '0', '200', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('211', '饼干糕点', '0', '', '0', '200', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('212', '龙井', '0', '', '0', '201', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('213', '碧螺春', '0', '', '0', '201', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('214', '铁观音', '0', '', '0', '201', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('215', '红茶', '0', '', '0', '201', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('216', '普洱', '0', '', '0', '201', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('217', '花草茶', '0', '', '0', '201', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('218', '水果茶', '0', '', '0', '201', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('219', '保健茶', '0', '', '0', '201', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('220', '芒果干', '0', '', '0', '202', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('221', '葡萄干', '0', '', '0', '202', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('222', '梅类', '0', '', '0', '202', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('223', '菠萝干', '0', '', '0', '202', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('224', '草莓干', '0', '', '0', '202', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('225', '香蕉干', '0', '', '0', '202', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('226', '玫瑰脯', '0', '', '0', '202', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('227', '蓝莓', '0', '', '0', '202', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('228', '婴幼食品', '0', '', '0', '7', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('229', '婴幼用品', '0', '', '0', '7', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('230', '童装童鞋', '0', '', '0', '7', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('231', '配方奶粉', '0', '', '0', '228', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('232', '羊奶粉', '0', '', '0', '228', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('233', '辅食', '0', '', '0', '228', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('234', '营养品', '0', '', '0', '228', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('235', '纸尿裤', '0', '', '0', '229', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('236', '奶瓶', '0', '', '0', '229', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('237', '布尿裤', '0', '', '0', '229', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('238', '湿巾/纸巾', '0', '', '0', '229', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('239', '睡袋/蚊帐', '0', '', '0', '229', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('240', '抱被/毛毯', '0', '', '0', '229', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('241', '洗浴护肤', '0', '', '0', '229', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('242', '水杯/水壶', '0', '', '0', '229', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('243', '衣物清洗', '0', '', '0', '229', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('244', '套装', '0', '', '0', '230', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('245', 'T恤', '0', '', '0', '230', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('246', '连衣裙', '0', '', '0', '230', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('247', '半截裙', '0', '', '0', '230', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('248', '休闲裤', '0', '', '0', '230', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('249', '凉鞋', '0', '', '0', '230', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('250', '运动鞋', '0', '', '0', '230', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('251', '帆布鞋', '0', '', '0', '230', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('252', '内衣裤', '0', '', '0', '230', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('253', '帽子/配件', '0', '', '0', '230', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('254', '亲子装', '0', '', '0', '230', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('255', '汽车用品', '0', '', '0', '9', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('256', '鲜花/乐器', '0', '', '0', '9', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('257', '图书/音像', '0', '', '0', '9', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('258', 'GPS导航', '0', '', '0', '255', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('259', '充电器', '0', '', '0', '255', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('260', '车载影音', '0', '', '0', '255', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('261', '加热保温', '0', '', '0', '255', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('262', '座垫/座套', '0', '', '0', '255', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('263', '脚垫', '0', '', '0', '255', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('264', '专车专用', '0', '', '0', '255', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('265', '摩托车相关', '0', '', '0', '255', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('266', '外部装饰', '0', '', '0', '255', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('267', '汽车香水', '0', '', '0', '255', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('268', '改装配件', '0', '', '0', '255', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('270', '汽车保险', '0', '', '0', '255', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('271', '鲜花速递', '0', '', '0', '256', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('272', '礼品定制', '0', '', '0', '256', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('273', '绿植园艺', '0', '', '0', '256', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('274', '乐器', '0', '', '0', '256', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('275', '书籍', '0', '', '0', '257', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('276', '考试', '0', '', '0', '257', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('277', '计算机图书', '0', '', '0', '257', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('278', '期刊杂志', '0', '', '0', '257', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('279', '小说', '0', '', '0', '257', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('280', '漫画', '0', '', '0', '257', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('281', 'CD/DVD', '0', '', '0', '257', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('282', '少儿图书', '0', '', '0', '257', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('283', '养生图书', '0', '', '0', '257', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('284', '艺术图书', '0', '', '0', '257', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('285', '励志图书', '0', '', '0', '257', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('286', '运动鞋帽', '2', '鞋码', '0', '8', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('287', '运动服包', '0', '', '0', '8', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('288', '户外装备', '0', '', '0', '8', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('289', '板鞋', '2', '鞋码', '0', '286', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('290', '休闲鞋', '2', '鞋码', '0', '286', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('291', '篮球鞋', '2', '鞋码', '0', '286', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('292', '帆布鞋', '2', '鞋码', '0', '286', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('293', '跑步鞋', '2', '鞋码', '0', '286', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('294', '足球鞋', '2', '鞋码', '0', '286', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('295', '网球鞋', '2', '鞋码', '0', '286', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('296', '训练鞋', '2', '鞋码', '0', '286', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('297', '套装', '0', '', '0', '287', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('298', '运动裤/裙', '0', '', '0', '287', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('299', '颈环/手环', '0', '', '0', '287', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('300', '夹克', '0', '', '0', '287', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('301', '运动包', '0', '', '0', '287', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('302', '运动风衣', '0', '', '0', '287', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('303', '休闲裤', '0', '', '0', '287', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('304', '运动配件', '0', '', '0', '287', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('305', '运动POLO', '0', '', '0', '287', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('306', '针织衫', '0', '', '0', '287', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('307', '户外鞋', '0', '', '0', '288', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('308', '户外服装', '0', '', '0', '288', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('309', '垂钓用品', '0', '', '0', '288', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('310', '服饰配件', '0', '', '0', '288', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('311', '户外军品', '0', '', '0', '288', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('312', '望远镜', '0', '', '0', '288', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('313', '工具/眼镜', '0', '', '0', '288', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('314', '户外手电筒', '0', '', '0', '288', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('315', '自行车', '0', '', '0', '288', '255', '1', '1');
INSERT INTO shop_goods_class VALUES ('316', '户外包袋', '0', '', '0', '288', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('317', '水上用品', '0', '', '0', '288', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('318', '生存用具', '0', '', '0', '288', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('319', '旅游', '0', '', '0', '11', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('320', '票务', '0', '', '0', '11', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('321', '保险', '0', '', '0', '11', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('322', '国内机票', '0', '', '0', '319', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('323', '国内酒店', '0', '', '0', '319', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('324', '酒店团购', '0', '', '0', '319', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('325', '旅行意外险', '0', '', '0', '321', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('326', '自驾意外险', '0', '', '0', '321', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('327', '家庭财产险', '0', '', '0', '321', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('328', '老人骨折险', '0', '', '0', '321', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('329', '家财火宅险', '0', '', '0', '321', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('330', '车险', '0', '', '0', '321', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('331', '演出门票', '0', '', '0', '320', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('332', '话剧歌剧', '0', '', '0', '320', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('333', '演唱会', '0', '', '0', '320', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('334', '音乐会', '0', '', '0', '320', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('335', '景区门票', '0', '', '0', '320', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('336', '温泉', '0', '', '0', '320', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('337', '主题乐园', '0', '', '0', '320', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('338', '四折电影票', '0', '', '0', '320', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('339', '折扣活动', '0', '', '0', '320', '255', '1', '0');
INSERT INTO shop_goods_class VALUES ('340', '免费抢票', '0', '', '0', '320', '255', '1', '0');

-- ----------------------------
-- Table structure for `shop_goods_class_staple`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_class_staple`;
CREATE TABLE `shop_goods_class_staple` (
  `staple_id` int(10) unsigned NOT NULL auto_increment COMMENT '常用分类id',
  `staple_name` varchar(255) NOT NULL COMMENT '常用分类名称',
  `gc_id` int(10) unsigned NOT NULL COMMENT '分类id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  PRIMARY KEY  (`staple_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods_class_staple
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_goods_class_tag`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_class_tag`;
CREATE TABLE `shop_goods_class_tag` (
  `gc_tag_id` int(10) unsigned NOT NULL auto_increment COMMENT 'TAGid',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级分类id',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级分类id',
  `gc_tag_name` varchar(255) NOT NULL COMMENT '分类TAG名称',
  `gc_tag_value` text NOT NULL COMMENT '分类TAG值',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  PRIMARY KEY  (`gc_tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=282 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods_class_tag
-- ----------------------------
INSERT INTO shop_goods_class_tag VALUES ('1', '1', '12', '16', '男女服装&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;棉衣', '男女服装,女装,棉衣', '16', '1');
INSERT INTO shop_goods_class_tag VALUES ('2', '1', '12', '17', '男女服装&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;毛呢大衣', '男女服装,女装,毛呢大衣', '17', '1');
INSERT INTO shop_goods_class_tag VALUES ('3', '1', '12', '18', '男女服装&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;风衣', '男女服装,女装,风衣', '18', '1');
INSERT INTO shop_goods_class_tag VALUES ('4', '1', '12', '19', '男女服装&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;打底衫', '男女服装,女装,打底衫', '19', '1');
INSERT INTO shop_goods_class_tag VALUES ('5', '1', '12', '20', '男女服装&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;情侣装', '男女服装,女装,情侣装', '20', '1');
INSERT INTO shop_goods_class_tag VALUES ('6', '1', '12', '21', '男女服装&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;毛呢短裤', '男女服装,女装,毛呢短裤', '21', '1');
INSERT INTO shop_goods_class_tag VALUES ('7', '1', '12', '22', '男女服装&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;牛仔裤', '男女服装,女装,牛仔裤', '22', '1');
INSERT INTO shop_goods_class_tag VALUES ('8', '1', '12', '23', '男女服装&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;加绒打底裤', '男女服装,女装,加绒打底裤', '23', '1');
INSERT INTO shop_goods_class_tag VALUES ('9', '1', '12', '24', '男女服装&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;小脚裤', '男女服装,女装,小脚裤', '24', '1');
INSERT INTO shop_goods_class_tag VALUES ('10', '1', '12', '25', '男女服装&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;半身裙', '男女服装,女装,半身裙', '25', '1');
INSERT INTO shop_goods_class_tag VALUES ('11', '1', '12', '26', '男女服装&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;毛呢连衣裙', '男女服装,女装,毛呢连衣裙', '26', '1');
INSERT INTO shop_goods_class_tag VALUES ('12', '1', '12', '27', '男女服装&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;长袖连衣裙', '男女服装,女装,长袖连衣裙', '27', '1');
INSERT INTO shop_goods_class_tag VALUES ('13', '1', '13', '15', '男女服装&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;羽绒服', '男女服装,男装,羽绒服', '15', '1');
INSERT INTO shop_goods_class_tag VALUES ('14', '1', '13', '28', '男女服装&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;卫衣', '男女服装,男装,卫衣', '28', '1');
INSERT INTO shop_goods_class_tag VALUES ('15', '1', '13', '29', '男女服装&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;长袖T恤', '男女服装,男装,长袖T恤', '29', '1');
INSERT INTO shop_goods_class_tag VALUES ('16', '1', '13', '30', '男女服装&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;长袖衬衫', '男女服装,男装,长袖衬衫', '30', '1');
INSERT INTO shop_goods_class_tag VALUES ('17', '1', '13', '31', '男女服装&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;品质秋冬外套', '男女服装,男装,品质秋冬外套', '31', '1');
INSERT INTO shop_goods_class_tag VALUES ('18', '1', '13', '32', '男女服装&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;风衣', '男女服装,男装,风衣', '32', '1');
INSERT INTO shop_goods_class_tag VALUES ('19', '1', '13', '33', '男女服装&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;休闲西装', '男女服装,男装,休闲西装', '33', '1');
INSERT INTO shop_goods_class_tag VALUES ('20', '1', '13', '34', '男女服装&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;棉衣', '男女服装,男装,棉衣', '34', '1');
INSERT INTO shop_goods_class_tag VALUES ('21', '1', '13', '35', '男女服装&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;休闲长裤', '男女服装,男装,休闲长裤', '35', '1');
INSERT INTO shop_goods_class_tag VALUES ('22', '1', '13', '36', '男女服装&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;内衣内裤', '男女服装,男装,内衣内裤', '36', '1');
INSERT INTO shop_goods_class_tag VALUES ('23', '1', '14', '37', '男女服装&nbsp;&gt;&nbsp;内衣/睡衣&nbsp;&gt;&nbsp;保暖内衣', '男女服装,内衣/睡衣,保暖内衣', '37', '1');
INSERT INTO shop_goods_class_tag VALUES ('24', '1', '14', '38', '男女服装&nbsp;&gt;&nbsp;内衣/睡衣&nbsp;&gt;&nbsp;保暖打底裤', '男女服装,内衣/睡衣,保暖打底裤', '38', '1');
INSERT INTO shop_goods_class_tag VALUES ('25', '1', '14', '39', '男女服装&nbsp;&gt;&nbsp;内衣/睡衣&nbsp;&gt;&nbsp;秋冬睡衣', '男女服装,内衣/睡衣,秋冬睡衣', '39', '1');
INSERT INTO shop_goods_class_tag VALUES ('26', '1', '14', '40', '男女服装&nbsp;&gt;&nbsp;内衣/睡衣&nbsp;&gt;&nbsp;珊瑚绒睡衣', '男女服装,内衣/睡衣,珊瑚绒睡衣', '40', '1');
INSERT INTO shop_goods_class_tag VALUES ('27', '1', '14', '41', '男女服装&nbsp;&gt;&nbsp;内衣/睡衣&nbsp;&gt;&nbsp;塑身内衣', '男女服装,内衣/睡衣,塑身内衣', '41', '1');
INSERT INTO shop_goods_class_tag VALUES ('28', '1', '14', '42', '男女服装&nbsp;&gt;&nbsp;内衣/睡衣&nbsp;&gt;&nbsp;文胸套装', '男女服装,内衣/睡衣,文胸套装', '42', '1');
INSERT INTO shop_goods_class_tag VALUES ('29', '1', '14', '43', '男女服装&nbsp;&gt;&nbsp;内衣/睡衣&nbsp;&gt;&nbsp;文胸', '男女服装,内衣/睡衣,文胸', '43', '1');
INSERT INTO shop_goods_class_tag VALUES ('30', '1', '14', '44', '男女服装&nbsp;&gt;&nbsp;内衣/睡衣&nbsp;&gt;&nbsp;内裤', '男女服装,内衣/睡衣,内裤', '44', '1');
INSERT INTO shop_goods_class_tag VALUES ('31', '1', '14', '45', '男女服装&nbsp;&gt;&nbsp;内衣/睡衣&nbsp;&gt;&nbsp;袜子', '男女服装,内衣/睡衣,袜子', '45', '1');
INSERT INTO shop_goods_class_tag VALUES ('32', '1', '14', '46', '男女服装&nbsp;&gt;&nbsp;内衣/睡衣&nbsp;&gt;&nbsp;连裤袜', '男女服装,内衣/睡衣,连裤袜', '46', '1');
INSERT INTO shop_goods_class_tag VALUES ('33', '1', '14', '47', '男女服装&nbsp;&gt;&nbsp;内衣/睡衣&nbsp;&gt;&nbsp;棉袜', '男女服装,内衣/睡衣,棉袜', '47', '1');
INSERT INTO shop_goods_class_tag VALUES ('34', '2', '93', '96', '鞋包配饰&nbsp;&gt;&nbsp;皮具箱包&nbsp;&gt;&nbsp;单肩包', '鞋包配饰,皮具箱包,单肩包', '96', '3');
INSERT INTO shop_goods_class_tag VALUES ('35', '2', '93', '97', '鞋包配饰&nbsp;&gt;&nbsp;皮具箱包&nbsp;&gt;&nbsp;手提包', '鞋包配饰,皮具箱包,手提包', '97', '3');
INSERT INTO shop_goods_class_tag VALUES ('36', '2', '93', '98', '鞋包配饰&nbsp;&gt;&nbsp;皮具箱包&nbsp;&gt;&nbsp;斜挎包', '鞋包配饰,皮具箱包,斜挎包', '98', '3');
INSERT INTO shop_goods_class_tag VALUES ('37', '2', '93', '99', '鞋包配饰&nbsp;&gt;&nbsp;皮具箱包&nbsp;&gt;&nbsp;多功能包', '鞋包配饰,皮具箱包,多功能包', '99', '3');
INSERT INTO shop_goods_class_tag VALUES ('38', '2', '93', '100', '鞋包配饰&nbsp;&gt;&nbsp;皮具箱包&nbsp;&gt;&nbsp;双肩包', '鞋包配饰,皮具箱包,双肩包', '100', '3');
INSERT INTO shop_goods_class_tag VALUES ('39', '2', '93', '101', '鞋包配饰&nbsp;&gt;&nbsp;皮具箱包&nbsp;&gt;&nbsp;旅行箱', '鞋包配饰,皮具箱包,旅行箱', '101', '3');
INSERT INTO shop_goods_class_tag VALUES ('40', '2', '93', '102', '鞋包配饰&nbsp;&gt;&nbsp;皮具箱包&nbsp;&gt;&nbsp;男包', '鞋包配饰,皮具箱包,男包', '102', '3');
INSERT INTO shop_goods_class_tag VALUES ('41', '2', '93', '103', '鞋包配饰&nbsp;&gt;&nbsp;皮具箱包&nbsp;&gt;&nbsp;电脑数码包', '鞋包配饰,皮具箱包,电脑数码包', '103', '3');
INSERT INTO shop_goods_class_tag VALUES ('42', '2', '93', '104', '鞋包配饰&nbsp;&gt;&nbsp;皮具箱包&nbsp;&gt;&nbsp;真皮包', '鞋包配饰,皮具箱包,真皮包', '104', '3');
INSERT INTO shop_goods_class_tag VALUES ('43', '2', '93', '105', '鞋包配饰&nbsp;&gt;&nbsp;皮具箱包&nbsp;&gt;&nbsp;钱包/卡套', '鞋包配饰,皮具箱包,钱包/卡套', '105', '3');
INSERT INTO shop_goods_class_tag VALUES ('44', '2', '94', '106', '鞋包配饰&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;秋季新款', '鞋包配饰,男鞋,秋季新款', '106', '2');
INSERT INTO shop_goods_class_tag VALUES ('45', '2', '94', '107', '鞋包配饰&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;商城精品', '鞋包配饰,男鞋,商城精品', '107', '2');
INSERT INTO shop_goods_class_tag VALUES ('46', '2', '94', '108', '鞋包配饰&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;舒适男鞋', '鞋包配饰,男鞋,舒适男鞋', '108', '2');
INSERT INTO shop_goods_class_tag VALUES ('47', '2', '94', '109', '鞋包配饰&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;保暖必备', '鞋包配饰,男鞋,保暖必备', '109', '2');
INSERT INTO shop_goods_class_tag VALUES ('48', '2', '95', '110', '鞋包配饰&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;冬靴来了', '鞋包配饰,女鞋,冬靴来了', '110', '2');
INSERT INTO shop_goods_class_tag VALUES ('49', '2', '95', '111', '鞋包配饰&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;短靴踝靴', '鞋包配饰,女鞋,短靴踝靴', '111', '2');
INSERT INTO shop_goods_class_tag VALUES ('50', '2', '95', '112', '鞋包配饰&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;中筒靴', '鞋包配饰,女鞋,中筒靴', '112', '2');
INSERT INTO shop_goods_class_tag VALUES ('51', '2', '95', '113', '鞋包配饰&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;雪地靴', '鞋包配饰,女鞋,雪地靴', '113', '2');
INSERT INTO shop_goods_class_tag VALUES ('52', '2', '95', '114', '鞋包配饰&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;单鞋', '鞋包配饰,女鞋,单鞋', '114', '2');
INSERT INTO shop_goods_class_tag VALUES ('53', '2', '95', '115', '鞋包配饰&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;经典中跟', '鞋包配饰,女鞋,经典中跟', '115', '2');
INSERT INTO shop_goods_class_tag VALUES ('54', '2', '95', '116', '鞋包配饰&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;显腿瘦高跟', '鞋包配饰,女鞋,显腿瘦高跟', '116', '2');
INSERT INTO shop_goods_class_tag VALUES ('55', '2', '95', '117', '鞋包配饰&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;舒适平跟', '鞋包配饰,女鞋,舒适平跟', '117', '2');
INSERT INTO shop_goods_class_tag VALUES ('56', '2', '95', '118', '鞋包配饰&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;帆布鞋', '鞋包配饰,女鞋,帆布鞋', '118', '2');
INSERT INTO shop_goods_class_tag VALUES ('57', '2', '95', '119', '鞋包配饰&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;爆潮厚底鞋', '鞋包配饰,女鞋,爆潮厚底鞋', '119', '2');
INSERT INTO shop_goods_class_tag VALUES ('58', '2', '95', '120', '鞋包配饰&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;休闲鞋', '鞋包配饰,女鞋,休闲鞋', '120', '2');
INSERT INTO shop_goods_class_tag VALUES ('59', '2', '95', '121', '鞋包配饰&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;凉鞋清仓', '鞋包配饰,女鞋,凉鞋清仓', '121', '2');
INSERT INTO shop_goods_class_tag VALUES ('60', '3', '122', '136', '美容美妆&nbsp;&gt;&nbsp;护肤&nbsp;&gt;&nbsp;面膜', '美容美妆,护肤,面膜', '136', '0');
INSERT INTO shop_goods_class_tag VALUES ('61', '3', '122', '137', '美容美妆&nbsp;&gt;&nbsp;护肤&nbsp;&gt;&nbsp;洁面', '美容美妆,护肤,洁面', '137', '0');
INSERT INTO shop_goods_class_tag VALUES ('62', '3', '122', '138', '美容美妆&nbsp;&gt;&nbsp;护肤&nbsp;&gt;&nbsp;爽肤水', '美容美妆,护肤,爽肤水', '138', '0');
INSERT INTO shop_goods_class_tag VALUES ('63', '3', '122', '139', '美容美妆&nbsp;&gt;&nbsp;护肤&nbsp;&gt;&nbsp;面霜/乳液', '美容美妆,护肤,面霜/乳液', '139', '0');
INSERT INTO shop_goods_class_tag VALUES ('64', '3', '122', '140', '美容美妆&nbsp;&gt;&nbsp;护肤&nbsp;&gt;&nbsp;护肤套装', '美容美妆,护肤,护肤套装', '140', '0');
INSERT INTO shop_goods_class_tag VALUES ('65', '3', '122', '141', '美容美妆&nbsp;&gt;&nbsp;护肤&nbsp;&gt;&nbsp;面部精华', '美容美妆,护肤,面部精华', '141', '0');
INSERT INTO shop_goods_class_tag VALUES ('66', '3', '122', '142', '美容美妆&nbsp;&gt;&nbsp;护肤&nbsp;&gt;&nbsp;喷雾', '美容美妆,护肤,喷雾', '142', '0');
INSERT INTO shop_goods_class_tag VALUES ('67', '3', '122', '143', '美容美妆&nbsp;&gt;&nbsp;护肤&nbsp;&gt;&nbsp;隔离/防晒', '美容美妆,护肤,隔离/防晒', '143', '0');
INSERT INTO shop_goods_class_tag VALUES ('68', '3', '122', '144', '美容美妆&nbsp;&gt;&nbsp;护肤&nbsp;&gt;&nbsp;眼霜', '美容美妆,护肤,眼霜', '144', '0');
INSERT INTO shop_goods_class_tag VALUES ('69', '3', '122', '145', '美容美妆&nbsp;&gt;&nbsp;护肤&nbsp;&gt;&nbsp;润唇膏', '美容美妆,护肤,润唇膏', '145', '0');
INSERT INTO shop_goods_class_tag VALUES ('70', '3', '122', '146', '美容美妆&nbsp;&gt;&nbsp;护肤&nbsp;&gt;&nbsp;T区护理', '美容美妆,护肤,T区护理', '146', '0');
INSERT INTO shop_goods_class_tag VALUES ('71', '3', '122', '147', '美容美妆&nbsp;&gt;&nbsp;护肤&nbsp;&gt;&nbsp;卸妆', '美容美妆,护肤,卸妆', '147', '0');
INSERT INTO shop_goods_class_tag VALUES ('72', '3', '123', '129', '美容美妆&nbsp;&gt;&nbsp;彩妆&nbsp;&gt;&nbsp;睫毛膏', '美容美妆,彩妆,睫毛膏', '129', '0');
INSERT INTO shop_goods_class_tag VALUES ('73', '3', '123', '130', '美容美妆&nbsp;&gt;&nbsp;彩妆&nbsp;&gt;&nbsp;粉底液', '美容美妆,彩妆,粉底液', '130', '0');
INSERT INTO shop_goods_class_tag VALUES ('74', '3', '123', '131', '美容美妆&nbsp;&gt;&nbsp;彩妆&nbsp;&gt;&nbsp;粉饼', '美容美妆,彩妆,粉饼', '131', '0');
INSERT INTO shop_goods_class_tag VALUES ('75', '3', '123', '132', '美容美妆&nbsp;&gt;&nbsp;彩妆&nbsp;&gt;&nbsp;眼线', '美容美妆,彩妆,眼线', '132', '0');
INSERT INTO shop_goods_class_tag VALUES ('76', '3', '123', '133', '美容美妆&nbsp;&gt;&nbsp;彩妆&nbsp;&gt;&nbsp;唇彩', '美容美妆,彩妆,唇彩', '133', '0');
INSERT INTO shop_goods_class_tag VALUES ('77', '3', '123', '134', '美容美妆&nbsp;&gt;&nbsp;彩妆&nbsp;&gt;&nbsp;眼影', '美容美妆,彩妆,眼影', '134', '0');
INSERT INTO shop_goods_class_tag VALUES ('78', '3', '123', '135', '美容美妆&nbsp;&gt;&nbsp;彩妆&nbsp;&gt;&nbsp;指甲油', '美容美妆,彩妆,指甲油', '135', '0');
INSERT INTO shop_goods_class_tag VALUES ('79', '3', '124', '125', '美容美妆&nbsp;&gt;&nbsp;男士&nbsp;&gt;&nbsp;男士洁面', '美容美妆,男士,男士洁面', '125', '0');
INSERT INTO shop_goods_class_tag VALUES ('80', '3', '124', '126', '美容美妆&nbsp;&gt;&nbsp;男士&nbsp;&gt;&nbsp;男士乳液', '美容美妆,男士,男士乳液', '126', '0');
INSERT INTO shop_goods_class_tag VALUES ('81', '3', '124', '127', '美容美妆&nbsp;&gt;&nbsp;男士&nbsp;&gt;&nbsp;男士爽肤水', '美容美妆,男士,男士爽肤水', '127', '0');
INSERT INTO shop_goods_class_tag VALUES ('82', '3', '124', '128', '美容美妆&nbsp;&gt;&nbsp;男士&nbsp;&gt;&nbsp;男士套装', '美容美妆,男士,男士套装', '128', '0');
INSERT INTO shop_goods_class_tag VALUES ('83', '8', '286', '289', '运动户外&nbsp;&gt;&nbsp;运动鞋帽&nbsp;&gt;&nbsp;板鞋', '运动户外,运动鞋帽,板鞋', '289', '2');
INSERT INTO shop_goods_class_tag VALUES ('84', '8', '286', '290', '运动户外&nbsp;&gt;&nbsp;运动鞋帽&nbsp;&gt;&nbsp;休闲鞋', '运动户外,运动鞋帽,休闲鞋', '290', '2');
INSERT INTO shop_goods_class_tag VALUES ('85', '8', '286', '291', '运动户外&nbsp;&gt;&nbsp;运动鞋帽&nbsp;&gt;&nbsp;篮球鞋', '运动户外,运动鞋帽,篮球鞋', '291', '2');
INSERT INTO shop_goods_class_tag VALUES ('86', '8', '286', '292', '运动户外&nbsp;&gt;&nbsp;运动鞋帽&nbsp;&gt;&nbsp;帆布鞋', '运动户外,运动鞋帽,帆布鞋', '292', '2');
INSERT INTO shop_goods_class_tag VALUES ('87', '8', '286', '293', '运动户外&nbsp;&gt;&nbsp;运动鞋帽&nbsp;&gt;&nbsp;跑步鞋', '运动户外,运动鞋帽,跑步鞋', '293', '2');
INSERT INTO shop_goods_class_tag VALUES ('88', '8', '286', '294', '运动户外&nbsp;&gt;&nbsp;运动鞋帽&nbsp;&gt;&nbsp;足球鞋', '运动户外,运动鞋帽,足球鞋', '294', '2');
INSERT INTO shop_goods_class_tag VALUES ('89', '8', '286', '295', '运动户外&nbsp;&gt;&nbsp;运动鞋帽&nbsp;&gt;&nbsp;网球鞋', '运动户外,运动鞋帽,网球鞋', '295', '2');
INSERT INTO shop_goods_class_tag VALUES ('90', '8', '286', '296', '运动户外&nbsp;&gt;&nbsp;运动鞋帽&nbsp;&gt;&nbsp;训练鞋', '运动户外,运动鞋帽,训练鞋', '296', '2');
INSERT INTO shop_goods_class_tag VALUES ('91', '8', '287', '297', '运动户外&nbsp;&gt;&nbsp;运动服包&nbsp;&gt;&nbsp;套装', '运动户外,运动服包,套装', '297', '0');
INSERT INTO shop_goods_class_tag VALUES ('92', '8', '287', '298', '运动户外&nbsp;&gt;&nbsp;运动服包&nbsp;&gt;&nbsp;运动裤/裙', '运动户外,运动服包,运动裤/裙', '298', '0');
INSERT INTO shop_goods_class_tag VALUES ('93', '8', '287', '299', '运动户外&nbsp;&gt;&nbsp;运动服包&nbsp;&gt;&nbsp;颈环/手环', '运动户外,运动服包,颈环/手环', '299', '0');
INSERT INTO shop_goods_class_tag VALUES ('94', '8', '287', '300', '运动户外&nbsp;&gt;&nbsp;运动服包&nbsp;&gt;&nbsp;夹克', '运动户外,运动服包,夹克', '300', '0');
INSERT INTO shop_goods_class_tag VALUES ('95', '8', '287', '301', '运动户外&nbsp;&gt;&nbsp;运动服包&nbsp;&gt;&nbsp;运动包', '运动户外,运动服包,运动包', '301', '0');
INSERT INTO shop_goods_class_tag VALUES ('96', '8', '287', '302', '运动户外&nbsp;&gt;&nbsp;运动服包&nbsp;&gt;&nbsp;运动风衣', '运动户外,运动服包,运动风衣', '302', '0');
INSERT INTO shop_goods_class_tag VALUES ('97', '8', '287', '303', '运动户外&nbsp;&gt;&nbsp;运动服包&nbsp;&gt;&nbsp;休闲裤', '运动户外,运动服包,休闲裤', '303', '0');
INSERT INTO shop_goods_class_tag VALUES ('98', '8', '287', '304', '运动户外&nbsp;&gt;&nbsp;运动服包&nbsp;&gt;&nbsp;运动配件', '运动户外,运动服包,运动配件', '304', '0');
INSERT INTO shop_goods_class_tag VALUES ('99', '8', '287', '305', '运动户外&nbsp;&gt;&nbsp;运动服包&nbsp;&gt;&nbsp;运动POLO', '运动户外,运动服包,运动POLO', '305', '0');
INSERT INTO shop_goods_class_tag VALUES ('100', '8', '287', '306', '运动户外&nbsp;&gt;&nbsp;运动服包&nbsp;&gt;&nbsp;针织衫', '运动户外,运动服包,针织衫', '306', '0');
INSERT INTO shop_goods_class_tag VALUES ('101', '8', '288', '307', '运动户外&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外鞋', '运动户外,户外装备,户外鞋', '307', '0');
INSERT INTO shop_goods_class_tag VALUES ('102', '8', '288', '308', '运动户外&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外服装', '运动户外,户外装备,户外服装', '308', '0');
INSERT INTO shop_goods_class_tag VALUES ('103', '8', '288', '309', '运动户外&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;垂钓用品', '运动户外,户外装备,垂钓用品', '309', '0');
INSERT INTO shop_goods_class_tag VALUES ('104', '8', '288', '310', '运动户外&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;服饰配件', '运动户外,户外装备,服饰配件', '310', '0');
INSERT INTO shop_goods_class_tag VALUES ('105', '8', '288', '311', '运动户外&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外军品', '运动户外,户外装备,户外军品', '311', '0');
INSERT INTO shop_goods_class_tag VALUES ('106', '8', '288', '312', '运动户外&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;望远镜', '运动户外,户外装备,望远镜', '312', '0');
INSERT INTO shop_goods_class_tag VALUES ('107', '8', '288', '313', '运动户外&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;工具/眼镜', '运动户外,户外装备,工具/眼镜', '313', '0');
INSERT INTO shop_goods_class_tag VALUES ('108', '8', '288', '314', '运动户外&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外手电筒', '运动户外,户外装备,户外手电筒', '314', '0');
INSERT INTO shop_goods_class_tag VALUES ('109', '8', '288', '315', '运动户外&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;自行车', '运动户外,户外装备,自行车', '315', '0');
INSERT INTO shop_goods_class_tag VALUES ('110', '8', '288', '316', '运动户外&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外包袋', '运动户外,户外装备,户外包袋', '316', '0');
INSERT INTO shop_goods_class_tag VALUES ('111', '8', '288', '317', '运动户外&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;水上用品', '运动户外,户外装备,水上用品', '317', '0');
INSERT INTO shop_goods_class_tag VALUES ('112', '8', '288', '318', '运动户外&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;生存用具', '运动户外,户外装备,生存用具', '318', '0');
INSERT INTO shop_goods_class_tag VALUES ('113', '4', '148', '162', '数码家电&nbsp;&gt;&nbsp;手机&nbsp;&gt;&nbsp;iphone4', '数码家电,手机,iphone4', '162', '0');
INSERT INTO shop_goods_class_tag VALUES ('114', '4', '148', '163', '数码家电&nbsp;&gt;&nbsp;手机&nbsp;&gt;&nbsp;iPhone4s', '数码家电,手机,iPhone4s', '163', '0');
INSERT INTO shop_goods_class_tag VALUES ('115', '4', '148', '164', '数码家电&nbsp;&gt;&nbsp;手机&nbsp;&gt;&nbsp;ME525', '数码家电,手机,ME525', '164', '0');
INSERT INTO shop_goods_class_tag VALUES ('116', '4', '148', '165', '数码家电&nbsp;&gt;&nbsp;手机&nbsp;&gt;&nbsp;导航手机', '数码家电,手机,导航手机', '165', '0');
INSERT INTO shop_goods_class_tag VALUES ('117', '4', '148', '166', '数码家电&nbsp;&gt;&nbsp;手机&nbsp;&gt;&nbsp;手机配件', '数码家电,手机,手机配件', '166', '0');
INSERT INTO shop_goods_class_tag VALUES ('118', '4', '148', '167', '数码家电&nbsp;&gt;&nbsp;手机&nbsp;&gt;&nbsp;三星/手机', '数码家电,手机,三星/手机', '167', '0');
INSERT INTO shop_goods_class_tag VALUES ('119', '4', '148', '168', '数码家电&nbsp;&gt;&nbsp;手机&nbsp;&gt;&nbsp;3G/智能', '数码家电,手机,3G/智能', '168', '0');
INSERT INTO shop_goods_class_tag VALUES ('120', '4', '148', '169', '数码家电&nbsp;&gt;&nbsp;手机&nbsp;&gt;&nbsp;摩托罗拉', '数码家电,手机,摩托罗拉', '169', '0');
INSERT INTO shop_goods_class_tag VALUES ('121', '4', '148', '170', '数码家电&nbsp;&gt;&nbsp;手机&nbsp;&gt;&nbsp;NOKIA', '数码家电,手机,NOKIA', '170', '0');
INSERT INTO shop_goods_class_tag VALUES ('122', '4', '148', '171', '数码家电&nbsp;&gt;&nbsp;手机&nbsp;&gt;&nbsp;HTC', '数码家电,手机,HTC', '171', '0');
INSERT INTO shop_goods_class_tag VALUES ('123', '4', '148', '172', '数码家电&nbsp;&gt;&nbsp;手机&nbsp;&gt;&nbsp;htc/G13', '数码家电,手机,htc/G13', '172', '0');
INSERT INTO shop_goods_class_tag VALUES ('124', '4', '149', '173', '数码家电&nbsp;&gt;&nbsp;相机&nbsp;&gt;&nbsp;卡片机', '数码家电,相机,卡片机', '173', '5');
INSERT INTO shop_goods_class_tag VALUES ('125', '4', '149', '174', '数码家电&nbsp;&gt;&nbsp;相机&nbsp;&gt;&nbsp;单反', '数码家电,相机,单反', '174', '5');
INSERT INTO shop_goods_class_tag VALUES ('126', '4', '149', '175', '数码家电&nbsp;&gt;&nbsp;相机&nbsp;&gt;&nbsp;摄像机', '数码家电,相机,摄像机', '175', '5');
INSERT INTO shop_goods_class_tag VALUES ('127', '4', '149', '176', '数码家电&nbsp;&gt;&nbsp;相机&nbsp;&gt;&nbsp;佳能', '数码家电,相机,佳能', '176', '5');
INSERT INTO shop_goods_class_tag VALUES ('128', '4', '150', '151', '数码家电&nbsp;&gt;&nbsp;笔记本&nbsp;&gt;&nbsp;团I3独显本', '数码家电,笔记本,团I3独显本', '151', '0');
INSERT INTO shop_goods_class_tag VALUES ('129', '4', '150', '152', '数码家电&nbsp;&gt;&nbsp;笔记本&nbsp;&gt;&nbsp;联想', '数码家电,笔记本,联想', '152', '0');
INSERT INTO shop_goods_class_tag VALUES ('130', '4', '150', '153', '数码家电&nbsp;&gt;&nbsp;笔记本&nbsp;&gt;&nbsp;苹果', '数码家电,笔记本,苹果', '153', '0');
INSERT INTO shop_goods_class_tag VALUES ('131', '4', '150', '154', '数码家电&nbsp;&gt;&nbsp;笔记本&nbsp;&gt;&nbsp;华硕', '数码家电,笔记本,华硕', '154', '0');
INSERT INTO shop_goods_class_tag VALUES ('132', '4', '150', '155', '数码家电&nbsp;&gt;&nbsp;笔记本&nbsp;&gt;&nbsp;惠普', '数码家电,笔记本,惠普', '155', '0');
INSERT INTO shop_goods_class_tag VALUES ('133', '4', '150', '156', '数码家电&nbsp;&gt;&nbsp;笔记本&nbsp;&gt;&nbsp;宏基', '数码家电,笔记本,宏基', '156', '0');
INSERT INTO shop_goods_class_tag VALUES ('134', '4', '150', '157', '数码家电&nbsp;&gt;&nbsp;笔记本&nbsp;&gt;&nbsp;戴尔', '数码家电,笔记本,戴尔', '157', '0');
INSERT INTO shop_goods_class_tag VALUES ('135', '4', '150', '158', '数码家电&nbsp;&gt;&nbsp;笔记本&nbsp;&gt;&nbsp;索尼', '数码家电,笔记本,索尼', '158', '0');
INSERT INTO shop_goods_class_tag VALUES ('136', '4', '150', '159', '数码家电&nbsp;&gt;&nbsp;笔记本&nbsp;&gt;&nbsp;东芝', '数码家电,笔记本,东芝', '159', '0');
INSERT INTO shop_goods_class_tag VALUES ('137', '4', '150', '160', '数码家电&nbsp;&gt;&nbsp;笔记本&nbsp;&gt;&nbsp;三星', '数码家电,笔记本,三星', '160', '0');
INSERT INTO shop_goods_class_tag VALUES ('138', '4', '150', '161', '数码家电&nbsp;&gt;&nbsp;笔记本&nbsp;&gt;&nbsp;神舟', '数码家电,笔记本,神舟', '161', '0');
INSERT INTO shop_goods_class_tag VALUES ('139', '5', '177', '180', '家居家装&nbsp;&gt;&nbsp;家纺床品&nbsp;&gt;&nbsp;床品套件', '家居家装,家纺床品,床品套件', '180', '0');
INSERT INTO shop_goods_class_tag VALUES ('140', '5', '177', '181', '家居家装&nbsp;&gt;&nbsp;家纺床品&nbsp;&gt;&nbsp;春夏被', '家居家装,家纺床品,春夏被', '181', '0');
INSERT INTO shop_goods_class_tag VALUES ('141', '5', '177', '182', '家居家装&nbsp;&gt;&nbsp;家纺床品&nbsp;&gt;&nbsp;保健枕', '家居家装,家纺床品,保健枕', '182', '0');
INSERT INTO shop_goods_class_tag VALUES ('142', '5', '177', '183', '家居家装&nbsp;&gt;&nbsp;家纺床品&nbsp;&gt;&nbsp;蚊帐', '家居家装,家纺床品,蚊帐', '183', '0');
INSERT INTO shop_goods_class_tag VALUES ('143', '5', '178', '184', '家居家装&nbsp;&gt;&nbsp;居家日用&nbsp;&gt;&nbsp;收纳整理', '家居家装,居家日用,收纳整理', '184', '0');
INSERT INTO shop_goods_class_tag VALUES ('144', '5', '178', '185', '家居家装&nbsp;&gt;&nbsp;居家日用&nbsp;&gt;&nbsp;家务清洁', '家居家装,居家日用,家务清洁', '185', '0');
INSERT INTO shop_goods_class_tag VALUES ('145', '5', '178', '186', '家居家装&nbsp;&gt;&nbsp;居家日用&nbsp;&gt;&nbsp;洗晒用具', '家居家装,居家日用,洗晒用具', '186', '0');
INSERT INTO shop_goods_class_tag VALUES ('146', '5', '178', '187', '家居家装&nbsp;&gt;&nbsp;居家日用&nbsp;&gt;&nbsp;卫浴用具', '家居家装,居家日用,卫浴用具', '187', '0');
INSERT INTO shop_goods_class_tag VALUES ('147', '5', '178', '188', '家居家装&nbsp;&gt;&nbsp;居家日用&nbsp;&gt;&nbsp;个人护理', '家居家装,居家日用,个人护理', '188', '0');
INSERT INTO shop_goods_class_tag VALUES ('148', '5', '178', '189', '家居家装&nbsp;&gt;&nbsp;居家日用&nbsp;&gt;&nbsp;雨伞雨具', '家居家装,居家日用,雨伞雨具', '189', '0');
INSERT INTO shop_goods_class_tag VALUES ('149', '5', '178', '190', '家居家装&nbsp;&gt;&nbsp;居家日用&nbsp;&gt;&nbsp;驱蚊驱虫', '家居家装,居家日用,驱蚊驱虫', '190', '0');
INSERT INTO shop_goods_class_tag VALUES ('150', '5', '178', '191', '家居家装&nbsp;&gt;&nbsp;居家日用&nbsp;&gt;&nbsp;居家杂货', '家居家装,居家日用,居家杂货', '191', '0');
INSERT INTO shop_goods_class_tag VALUES ('151', '5', '179', '192', '家居家装&nbsp;&gt;&nbsp;厨房餐饮&nbsp;&gt;&nbsp;烹饪锅具', '家居家装,厨房餐饮,烹饪锅具', '192', '0');
INSERT INTO shop_goods_class_tag VALUES ('152', '5', '179', '193', '家居家装&nbsp;&gt;&nbsp;厨房餐饮&nbsp;&gt;&nbsp;烹饪勺铲', '家居家装,厨房餐饮,烹饪勺铲', '193', '0');
INSERT INTO shop_goods_class_tag VALUES ('153', '5', '179', '194', '家居家装&nbsp;&gt;&nbsp;厨房餐饮&nbsp;&gt;&nbsp;调味瓶罐', '家居家装,厨房餐饮,调味瓶罐', '194', '0');
INSERT INTO shop_goods_class_tag VALUES ('154', '5', '179', '195', '家居家装&nbsp;&gt;&nbsp;厨房餐饮&nbsp;&gt;&nbsp;厨房帮手', '家居家装,厨房餐饮,厨房帮手', '195', '0');
INSERT INTO shop_goods_class_tag VALUES ('155', '5', '179', '196', '家居家装&nbsp;&gt;&nbsp;厨房餐饮&nbsp;&gt;&nbsp;保鲜盒', '家居家装,厨房餐饮,保鲜盒', '196', '0');
INSERT INTO shop_goods_class_tag VALUES ('156', '5', '179', '197', '家居家装&nbsp;&gt;&nbsp;厨房餐饮&nbsp;&gt;&nbsp;餐具', '家居家装,厨房餐饮,餐具', '197', '0');
INSERT INTO shop_goods_class_tag VALUES ('157', '5', '179', '198', '家居家装&nbsp;&gt;&nbsp;厨房餐饮&nbsp;&gt;&nbsp;水杯水壶', '家居家装,厨房餐饮,水杯水壶', '198', '0');
INSERT INTO shop_goods_class_tag VALUES ('158', '5', '179', '199', '家居家装&nbsp;&gt;&nbsp;厨房餐饮&nbsp;&gt;&nbsp;茶具', '家居家装,厨房餐饮,茶具', '199', '4');
INSERT INTO shop_goods_class_tag VALUES ('159', '5', '341', '342', '家居家装&nbsp;&gt;&nbsp;家具&nbsp;&gt;&nbsp;沙发', '家居家装,家具,沙发', '342', '0');
INSERT INTO shop_goods_class_tag VALUES ('160', '5', '341', '343', '家居家装&nbsp;&gt;&nbsp;家具&nbsp;&gt;&nbsp;茶几', '家居家装,家具,茶几', '343', '0');
INSERT INTO shop_goods_class_tag VALUES ('161', '6', '200', '203', '食品保健&nbsp;&gt;&nbsp;休闲零食&nbsp;&gt;&nbsp;鸭脖', '食品保健,休闲零食,鸭脖', '203', '0');
INSERT INTO shop_goods_class_tag VALUES ('162', '6', '200', '204', '食品保健&nbsp;&gt;&nbsp;休闲零食&nbsp;&gt;&nbsp;鸭舌', '食品保健,休闲零食,鸭舌', '204', '0');
INSERT INTO shop_goods_class_tag VALUES ('163', '6', '200', '205', '食品保健&nbsp;&gt;&nbsp;休闲零食&nbsp;&gt;&nbsp;鸡翅', '食品保健,休闲零食,鸡翅', '205', '0');
INSERT INTO shop_goods_class_tag VALUES ('164', '6', '200', '206', '食品保健&nbsp;&gt;&nbsp;休闲零食&nbsp;&gt;&nbsp;牛肉干', '食品保健,休闲零食,牛肉干', '206', '0');
INSERT INTO shop_goods_class_tag VALUES ('165', '6', '200', '207', '食品保健&nbsp;&gt;&nbsp;休闲零食&nbsp;&gt;&nbsp;猪肉脯', '食品保健,休闲零食,猪肉脯', '207', '0');
INSERT INTO shop_goods_class_tag VALUES ('166', '6', '200', '208', '食品保健&nbsp;&gt;&nbsp;休闲零食&nbsp;&gt;&nbsp;猪肉松', '食品保健,休闲零食,猪肉松', '208', '0');
INSERT INTO shop_goods_class_tag VALUES ('167', '6', '200', '209', '食品保健&nbsp;&gt;&nbsp;休闲零食&nbsp;&gt;&nbsp;糖果', '食品保健,休闲零食,糖果', '209', '0');
INSERT INTO shop_goods_class_tag VALUES ('168', '6', '200', '210', '食品保健&nbsp;&gt;&nbsp;休闲零食&nbsp;&gt;&nbsp;鱿鱼丝', '食品保健,休闲零食,鱿鱼丝', '210', '0');
INSERT INTO shop_goods_class_tag VALUES ('169', '6', '200', '211', '食品保健&nbsp;&gt;&nbsp;休闲零食&nbsp;&gt;&nbsp;饼干糕点', '食品保健,休闲零食,饼干糕点', '211', '0');
INSERT INTO shop_goods_class_tag VALUES ('170', '6', '201', '212', '食品保健&nbsp;&gt;&nbsp;茶叶茗品&nbsp;&gt;&nbsp;龙井', '食品保健,茶叶茗品,龙井', '212', '0');
INSERT INTO shop_goods_class_tag VALUES ('171', '6', '201', '213', '食品保健&nbsp;&gt;&nbsp;茶叶茗品&nbsp;&gt;&nbsp;碧螺春', '食品保健,茶叶茗品,碧螺春', '213', '0');
INSERT INTO shop_goods_class_tag VALUES ('172', '6', '201', '214', '食品保健&nbsp;&gt;&nbsp;茶叶茗品&nbsp;&gt;&nbsp;铁观音', '食品保健,茶叶茗品,铁观音', '214', '0');
INSERT INTO shop_goods_class_tag VALUES ('173', '6', '201', '215', '食品保健&nbsp;&gt;&nbsp;茶叶茗品&nbsp;&gt;&nbsp;红茶', '食品保健,茶叶茗品,红茶', '215', '0');
INSERT INTO shop_goods_class_tag VALUES ('174', '6', '201', '216', '食品保健&nbsp;&gt;&nbsp;茶叶茗品&nbsp;&gt;&nbsp;普洱', '食品保健,茶叶茗品,普洱', '216', '0');
INSERT INTO shop_goods_class_tag VALUES ('175', '6', '201', '217', '食品保健&nbsp;&gt;&nbsp;茶叶茗品&nbsp;&gt;&nbsp;花草茶', '食品保健,茶叶茗品,花草茶', '217', '0');
INSERT INTO shop_goods_class_tag VALUES ('176', '6', '201', '218', '食品保健&nbsp;&gt;&nbsp;茶叶茗品&nbsp;&gt;&nbsp;水果茶', '食品保健,茶叶茗品,水果茶', '218', '0');
INSERT INTO shop_goods_class_tag VALUES ('177', '6', '201', '219', '食品保健&nbsp;&gt;&nbsp;茶叶茗品&nbsp;&gt;&nbsp;保健茶', '食品保健,茶叶茗品,保健茶', '219', '0');
INSERT INTO shop_goods_class_tag VALUES ('178', '6', '202', '220', '食品保健&nbsp;&gt;&nbsp;蜜饯果脯&nbsp;&gt;&nbsp;芒果干', '食品保健,蜜饯果脯,芒果干', '220', '0');
INSERT INTO shop_goods_class_tag VALUES ('179', '6', '202', '221', '食品保健&nbsp;&gt;&nbsp;蜜饯果脯&nbsp;&gt;&nbsp;葡萄干', '食品保健,蜜饯果脯,葡萄干', '221', '0');
INSERT INTO shop_goods_class_tag VALUES ('180', '6', '202', '222', '食品保健&nbsp;&gt;&nbsp;蜜饯果脯&nbsp;&gt;&nbsp;梅类', '食品保健,蜜饯果脯,梅类', '222', '0');
INSERT INTO shop_goods_class_tag VALUES ('181', '6', '202', '223', '食品保健&nbsp;&gt;&nbsp;蜜饯果脯&nbsp;&gt;&nbsp;菠萝干', '食品保健,蜜饯果脯,菠萝干', '223', '0');
INSERT INTO shop_goods_class_tag VALUES ('182', '6', '202', '224', '食品保健&nbsp;&gt;&nbsp;蜜饯果脯&nbsp;&gt;&nbsp;草莓干', '食品保健,蜜饯果脯,草莓干', '224', '0');
INSERT INTO shop_goods_class_tag VALUES ('183', '6', '202', '225', '食品保健&nbsp;&gt;&nbsp;蜜饯果脯&nbsp;&gt;&nbsp;香蕉干', '食品保健,蜜饯果脯,香蕉干', '225', '0');
INSERT INTO shop_goods_class_tag VALUES ('184', '6', '202', '226', '食品保健&nbsp;&gt;&nbsp;蜜饯果脯&nbsp;&gt;&nbsp;玫瑰脯', '食品保健,蜜饯果脯,玫瑰脯', '226', '0');
INSERT INTO shop_goods_class_tag VALUES ('185', '6', '202', '227', '食品保健&nbsp;&gt;&nbsp;蜜饯果脯&nbsp;&gt;&nbsp;蓝莓', '食品保健,蜜饯果脯,蓝莓', '227', '0');
INSERT INTO shop_goods_class_tag VALUES ('186', '7', '228', '231', '母婴用品&nbsp;&gt;&nbsp;婴幼食品&nbsp;&gt;&nbsp;配方奶粉', '母婴用品,婴幼食品,配方奶粉', '231', '0');
INSERT INTO shop_goods_class_tag VALUES ('187', '7', '228', '232', '母婴用品&nbsp;&gt;&nbsp;婴幼食品&nbsp;&gt;&nbsp;羊奶粉', '母婴用品,婴幼食品,羊奶粉', '232', '0');
INSERT INTO shop_goods_class_tag VALUES ('188', '7', '228', '233', '母婴用品&nbsp;&gt;&nbsp;婴幼食品&nbsp;&gt;&nbsp;辅食', '母婴用品,婴幼食品,辅食', '233', '0');
INSERT INTO shop_goods_class_tag VALUES ('189', '7', '228', '234', '母婴用品&nbsp;&gt;&nbsp;婴幼食品&nbsp;&gt;&nbsp;营养品', '母婴用品,婴幼食品,营养品', '234', '0');
INSERT INTO shop_goods_class_tag VALUES ('190', '7', '229', '235', '母婴用品&nbsp;&gt;&nbsp;婴幼用品&nbsp;&gt;&nbsp;纸尿裤', '母婴用品,婴幼用品,纸尿裤', '235', '0');
INSERT INTO shop_goods_class_tag VALUES ('191', '7', '229', '236', '母婴用品&nbsp;&gt;&nbsp;婴幼用品&nbsp;&gt;&nbsp;奶瓶', '母婴用品,婴幼用品,奶瓶', '236', '0');
INSERT INTO shop_goods_class_tag VALUES ('192', '7', '229', '237', '母婴用品&nbsp;&gt;&nbsp;婴幼用品&nbsp;&gt;&nbsp;布尿裤', '母婴用品,婴幼用品,布尿裤', '237', '0');
INSERT INTO shop_goods_class_tag VALUES ('193', '7', '229', '238', '母婴用品&nbsp;&gt;&nbsp;婴幼用品&nbsp;&gt;&nbsp;湿巾/纸巾', '母婴用品,婴幼用品,湿巾/纸巾', '238', '0');
INSERT INTO shop_goods_class_tag VALUES ('194', '7', '229', '239', '母婴用品&nbsp;&gt;&nbsp;婴幼用品&nbsp;&gt;&nbsp;睡袋/蚊帐', '母婴用品,婴幼用品,睡袋/蚊帐', '239', '0');
INSERT INTO shop_goods_class_tag VALUES ('195', '7', '229', '240', '母婴用品&nbsp;&gt;&nbsp;婴幼用品&nbsp;&gt;&nbsp;抱被/毛毯', '母婴用品,婴幼用品,抱被/毛毯', '240', '0');
INSERT INTO shop_goods_class_tag VALUES ('196', '7', '229', '241', '母婴用品&nbsp;&gt;&nbsp;婴幼用品&nbsp;&gt;&nbsp;洗浴护肤', '母婴用品,婴幼用品,洗浴护肤', '241', '0');
INSERT INTO shop_goods_class_tag VALUES ('197', '7', '229', '242', '母婴用品&nbsp;&gt;&nbsp;婴幼用品&nbsp;&gt;&nbsp;水杯/水壶', '母婴用品,婴幼用品,水杯/水壶', '242', '0');
INSERT INTO shop_goods_class_tag VALUES ('198', '7', '229', '243', '母婴用品&nbsp;&gt;&nbsp;婴幼用品&nbsp;&gt;&nbsp;衣物清洗', '母婴用品,婴幼用品,衣物清洗', '243', '0');
INSERT INTO shop_goods_class_tag VALUES ('199', '7', '230', '244', '母婴用品&nbsp;&gt;&nbsp;童装童鞋&nbsp;&gt;&nbsp;套装', '母婴用品,童装童鞋,套装', '244', '0');
INSERT INTO shop_goods_class_tag VALUES ('200', '7', '230', '245', '母婴用品&nbsp;&gt;&nbsp;童装童鞋&nbsp;&gt;&nbsp;T恤', '母婴用品,童装童鞋,T恤', '245', '0');
INSERT INTO shop_goods_class_tag VALUES ('201', '7', '230', '246', '母婴用品&nbsp;&gt;&nbsp;童装童鞋&nbsp;&gt;&nbsp;连衣裙', '母婴用品,童装童鞋,连衣裙', '246', '0');
INSERT INTO shop_goods_class_tag VALUES ('202', '7', '230', '247', '母婴用品&nbsp;&gt;&nbsp;童装童鞋&nbsp;&gt;&nbsp;半截裙', '母婴用品,童装童鞋,半截裙', '247', '0');
INSERT INTO shop_goods_class_tag VALUES ('203', '7', '230', '248', '母婴用品&nbsp;&gt;&nbsp;童装童鞋&nbsp;&gt;&nbsp;休闲裤', '母婴用品,童装童鞋,休闲裤', '248', '0');
INSERT INTO shop_goods_class_tag VALUES ('204', '7', '230', '249', '母婴用品&nbsp;&gt;&nbsp;童装童鞋&nbsp;&gt;&nbsp;凉鞋', '母婴用品,童装童鞋,凉鞋', '249', '0');
INSERT INTO shop_goods_class_tag VALUES ('205', '7', '230', '250', '母婴用品&nbsp;&gt;&nbsp;童装童鞋&nbsp;&gt;&nbsp;运动鞋', '母婴用品,童装童鞋,运动鞋', '250', '0');
INSERT INTO shop_goods_class_tag VALUES ('206', '7', '230', '251', '母婴用品&nbsp;&gt;&nbsp;童装童鞋&nbsp;&gt;&nbsp;帆布鞋', '母婴用品,童装童鞋,帆布鞋', '251', '0');
INSERT INTO shop_goods_class_tag VALUES ('207', '7', '230', '252', '母婴用品&nbsp;&gt;&nbsp;童装童鞋&nbsp;&gt;&nbsp;内衣裤', '母婴用品,童装童鞋,内衣裤', '252', '0');
INSERT INTO shop_goods_class_tag VALUES ('208', '7', '230', '253', '母婴用品&nbsp;&gt;&nbsp;童装童鞋&nbsp;&gt;&nbsp;帽子/配件', '母婴用品,童装童鞋,帽子/配件', '253', '0');
INSERT INTO shop_goods_class_tag VALUES ('209', '7', '230', '254', '母婴用品&nbsp;&gt;&nbsp;童装童鞋&nbsp;&gt;&nbsp;亲子装', '母婴用品,童装童鞋,亲子装', '254', '0');
INSERT INTO shop_goods_class_tag VALUES ('210', '9', '255', '258', '文化娱乐&nbsp;&gt;&nbsp;汽车用品&nbsp;&gt;&nbsp;GPS导航', '文化娱乐,汽车用品,GPS导航', '258', '0');
INSERT INTO shop_goods_class_tag VALUES ('211', '9', '255', '259', '文化娱乐&nbsp;&gt;&nbsp;汽车用品&nbsp;&gt;&nbsp;充电器', '文化娱乐,汽车用品,充电器', '259', '0');
INSERT INTO shop_goods_class_tag VALUES ('212', '9', '255', '260', '文化娱乐&nbsp;&gt;&nbsp;汽车用品&nbsp;&gt;&nbsp;车载影音', '文化娱乐,汽车用品,车载影音', '260', '0');
INSERT INTO shop_goods_class_tag VALUES ('213', '9', '255', '261', '文化娱乐&nbsp;&gt;&nbsp;汽车用品&nbsp;&gt;&nbsp;加热保温', '文化娱乐,汽车用品,加热保温', '261', '0');
INSERT INTO shop_goods_class_tag VALUES ('214', '9', '255', '262', '文化娱乐&nbsp;&gt;&nbsp;汽车用品&nbsp;&gt;&nbsp;座垫/座套', '文化娱乐,汽车用品,座垫/座套', '262', '0');
INSERT INTO shop_goods_class_tag VALUES ('215', '9', '255', '263', '文化娱乐&nbsp;&gt;&nbsp;汽车用品&nbsp;&gt;&nbsp;脚垫', '文化娱乐,汽车用品,脚垫', '263', '0');
INSERT INTO shop_goods_class_tag VALUES ('216', '9', '255', '264', '文化娱乐&nbsp;&gt;&nbsp;汽车用品&nbsp;&gt;&nbsp;专车专用', '文化娱乐,汽车用品,专车专用', '264', '0');
INSERT INTO shop_goods_class_tag VALUES ('217', '9', '255', '265', '文化娱乐&nbsp;&gt;&nbsp;汽车用品&nbsp;&gt;&nbsp;摩托车相关', '文化娱乐,汽车用品,摩托车相关', '265', '0');
INSERT INTO shop_goods_class_tag VALUES ('218', '9', '255', '266', '文化娱乐&nbsp;&gt;&nbsp;汽车用品&nbsp;&gt;&nbsp;外部装饰', '文化娱乐,汽车用品,外部装饰', '266', '0');
INSERT INTO shop_goods_class_tag VALUES ('219', '9', '255', '267', '文化娱乐&nbsp;&gt;&nbsp;汽车用品&nbsp;&gt;&nbsp;汽车香水', '文化娱乐,汽车用品,汽车香水', '267', '0');
INSERT INTO shop_goods_class_tag VALUES ('220', '9', '255', '268', '文化娱乐&nbsp;&gt;&nbsp;汽车用品&nbsp;&gt;&nbsp;改装配件', '文化娱乐,汽车用品,改装配件', '268', '0');
INSERT INTO shop_goods_class_tag VALUES ('221', '9', '255', '270', '文化娱乐&nbsp;&gt;&nbsp;汽车用品&nbsp;&gt;&nbsp;汽车保险', '文化娱乐,汽车用品,汽车保险', '270', '0');
INSERT INTO shop_goods_class_tag VALUES ('222', '9', '256', '271', '文化娱乐&nbsp;&gt;&nbsp;鲜花/乐器&nbsp;&gt;&nbsp;鲜花速递', '文化娱乐,鲜花/乐器,鲜花速递', '271', '0');
INSERT INTO shop_goods_class_tag VALUES ('223', '9', '256', '272', '文化娱乐&nbsp;&gt;&nbsp;鲜花/乐器&nbsp;&gt;&nbsp;礼品定制', '文化娱乐,鲜花/乐器,礼品定制', '272', '0');
INSERT INTO shop_goods_class_tag VALUES ('224', '9', '256', '273', '文化娱乐&nbsp;&gt;&nbsp;鲜花/乐器&nbsp;&gt;&nbsp;绿植园艺', '文化娱乐,鲜花/乐器,绿植园艺', '273', '0');
INSERT INTO shop_goods_class_tag VALUES ('225', '9', '256', '274', '文化娱乐&nbsp;&gt;&nbsp;鲜花/乐器&nbsp;&gt;&nbsp;乐器', '文化娱乐,鲜花/乐器,乐器', '274', '0');
INSERT INTO shop_goods_class_tag VALUES ('226', '9', '257', '275', '文化娱乐&nbsp;&gt;&nbsp;图书/音像&nbsp;&gt;&nbsp;书籍', '文化娱乐,图书/音像,书籍', '275', '0');
INSERT INTO shop_goods_class_tag VALUES ('227', '9', '257', '276', '文化娱乐&nbsp;&gt;&nbsp;图书/音像&nbsp;&gt;&nbsp;考试', '文化娱乐,图书/音像,考试', '276', '0');
INSERT INTO shop_goods_class_tag VALUES ('228', '9', '257', '277', '文化娱乐&nbsp;&gt;&nbsp;图书/音像&nbsp;&gt;&nbsp;计算机图书', '文化娱乐,图书/音像,计算机图书', '277', '0');
INSERT INTO shop_goods_class_tag VALUES ('229', '9', '257', '278', '文化娱乐&nbsp;&gt;&nbsp;图书/音像&nbsp;&gt;&nbsp;期刊杂志', '文化娱乐,图书/音像,期刊杂志', '278', '0');
INSERT INTO shop_goods_class_tag VALUES ('230', '9', '257', '279', '文化娱乐&nbsp;&gt;&nbsp;图书/音像&nbsp;&gt;&nbsp;小说', '文化娱乐,图书/音像,小说', '279', '0');
INSERT INTO shop_goods_class_tag VALUES ('231', '9', '257', '280', '文化娱乐&nbsp;&gt;&nbsp;图书/音像&nbsp;&gt;&nbsp;漫画', '文化娱乐,图书/音像,漫画', '280', '0');
INSERT INTO shop_goods_class_tag VALUES ('232', '9', '257', '281', '文化娱乐&nbsp;&gt;&nbsp;图书/音像&nbsp;&gt;&nbsp;CD/DVD', '文化娱乐,图书/音像,CD/DVD', '281', '0');
INSERT INTO shop_goods_class_tag VALUES ('233', '9', '257', '282', '文化娱乐&nbsp;&gt;&nbsp;图书/音像&nbsp;&gt;&nbsp;少儿图书', '文化娱乐,图书/音像,少儿图书', '282', '0');
INSERT INTO shop_goods_class_tag VALUES ('234', '9', '257', '283', '文化娱乐&nbsp;&gt;&nbsp;图书/音像&nbsp;&gt;&nbsp;养生图书', '文化娱乐,图书/音像,养生图书', '283', '0');
INSERT INTO shop_goods_class_tag VALUES ('235', '9', '257', '284', '文化娱乐&nbsp;&gt;&nbsp;图书/音像&nbsp;&gt;&nbsp;艺术图书', '文化娱乐,图书/音像,艺术图书', '284', '0');
INSERT INTO shop_goods_class_tag VALUES ('236', '9', '257', '285', '文化娱乐&nbsp;&gt;&nbsp;图书/音像&nbsp;&gt;&nbsp;励志图书', '文化娱乐,图书/音像,励志图书', '285', '0');
INSERT INTO shop_goods_class_tag VALUES ('237', '10', '48', '51', '话费网游&nbsp;&gt;&nbsp;话费&nbsp;&gt;&nbsp;话费直充', '话费网游,话费,话费直充', '51', '0');
INSERT INTO shop_goods_class_tag VALUES ('238', '10', '48', '52', '话费网游&nbsp;&gt;&nbsp;话费&nbsp;&gt;&nbsp;移动充值卡', '话费网游,话费,移动充值卡', '52', '0');
INSERT INTO shop_goods_class_tag VALUES ('239', '10', '48', '53', '话费网游&nbsp;&gt;&nbsp;话费&nbsp;&gt;&nbsp;联通充值卡', '话费网游,话费,联通充值卡', '53', '0');
INSERT INTO shop_goods_class_tag VALUES ('240', '10', '48', '54', '话费网游&nbsp;&gt;&nbsp;话费&nbsp;&gt;&nbsp;电信充值卡', '话费网游,话费,电信充值卡', '54', '0');
INSERT INTO shop_goods_class_tag VALUES ('241', '10', '48', '55', '话费网游&nbsp;&gt;&nbsp;话费&nbsp;&gt;&nbsp;固话充值卡', '话费网游,话费,固话充值卡', '55', '0');
INSERT INTO shop_goods_class_tag VALUES ('242', '10', '48', '56', '话费网游&nbsp;&gt;&nbsp;话费&nbsp;&gt;&nbsp;IP卡', '话费网游,话费,IP卡', '56', '0');
INSERT INTO shop_goods_class_tag VALUES ('243', '10', '48', '57', '话费网游&nbsp;&gt;&nbsp;话费&nbsp;&gt;&nbsp;网络电话', '话费网游,话费,网络电话', '57', '0');
INSERT INTO shop_goods_class_tag VALUES ('244', '10', '48', '58', '话费网游&nbsp;&gt;&nbsp;话费&nbsp;&gt;&nbsp;手机号码卡', '话费网游,话费,手机号码卡', '58', '0');
INSERT INTO shop_goods_class_tag VALUES ('245', '10', '49', '75', '话费网游&nbsp;&gt;&nbsp;保险&nbsp;&gt;&nbsp;旅行意外险', '话费网游,保险,旅行意外险', '75', '0');
INSERT INTO shop_goods_class_tag VALUES ('246', '10', '49', '76', '话费网游&nbsp;&gt;&nbsp;保险&nbsp;&gt;&nbsp;自驾意外险', '话费网游,保险,自驾意外险', '76', '0');
INSERT INTO shop_goods_class_tag VALUES ('247', '10', '49', '77', '话费网游&nbsp;&gt;&nbsp;保险&nbsp;&gt;&nbsp;家庭财产险', '话费网游,保险,家庭财产险', '77', '0');
INSERT INTO shop_goods_class_tag VALUES ('248', '10', '49', '78', '话费网游&nbsp;&gt;&nbsp;保险&nbsp;&gt;&nbsp;老人骨折险', '话费网游,保险,老人骨折险', '78', '0');
INSERT INTO shop_goods_class_tag VALUES ('249', '10', '49', '79', '话费网游&nbsp;&gt;&nbsp;保险&nbsp;&gt;&nbsp;家财火宅险', '话费网游,保险,家财火宅险', '79', '0');
INSERT INTO shop_goods_class_tag VALUES ('250', '10', '49', '80', '话费网游&nbsp;&gt;&nbsp;保险&nbsp;&gt;&nbsp;车险', '话费网游,保险,车险', '80', '0');
INSERT INTO shop_goods_class_tag VALUES ('251', '10', '50', '81', '话费网游&nbsp;&gt;&nbsp;腾讯业务&nbsp;&gt;&nbsp;Q币充值', '话费网游,腾讯业务,Q币充值', '81', '0');
INSERT INTO shop_goods_class_tag VALUES ('252', '10', '50', '82', '话费网游&nbsp;&gt;&nbsp;腾讯业务&nbsp;&gt;&nbsp;Q点充值', '话费网游,腾讯业务,Q点充值', '82', '0');
INSERT INTO shop_goods_class_tag VALUES ('253', '10', '50', '83', '话费网游&nbsp;&gt;&nbsp;腾讯业务&nbsp;&gt;&nbsp;QQ卡', '话费网游,腾讯业务,QQ卡', '83', '0');
INSERT INTO shop_goods_class_tag VALUES ('254', '10', '50', '84', '话费网游&nbsp;&gt;&nbsp;腾讯业务&nbsp;&gt;&nbsp;超级QQ', '话费网游,腾讯业务,超级QQ', '84', '0');
INSERT INTO shop_goods_class_tag VALUES ('255', '10', '50', '85', '话费网游&nbsp;&gt;&nbsp;腾讯业务&nbsp;&gt;&nbsp;QQ会员', '话费网游,腾讯业务,QQ会员', '85', '0');
INSERT INTO shop_goods_class_tag VALUES ('256', '10', '50', '86', '话费网游&nbsp;&gt;&nbsp;腾讯业务&nbsp;&gt;&nbsp;红钻', '话费网游,腾讯业务,红钻', '86', '0');
INSERT INTO shop_goods_class_tag VALUES ('257', '10', '50', '87', '话费网游&nbsp;&gt;&nbsp;腾讯业务&nbsp;&gt;&nbsp;黄钻', '话费网游,腾讯业务,黄钻', '87', '0');
INSERT INTO shop_goods_class_tag VALUES ('258', '10', '50', '88', '话费网游&nbsp;&gt;&nbsp;腾讯业务&nbsp;&gt;&nbsp;绿钻', '话费网游,腾讯业务,绿钻', '88', '0');
INSERT INTO shop_goods_class_tag VALUES ('259', '10', '50', '89', '话费网游&nbsp;&gt;&nbsp;腾讯业务&nbsp;&gt;&nbsp;蓝钻', '话费网游,腾讯业务,蓝钻', '89', '0');
INSERT INTO shop_goods_class_tag VALUES ('260', '10', '50', '90', '话费网游&nbsp;&gt;&nbsp;腾讯业务&nbsp;&gt;&nbsp;DNF黑钻', '话费网游,腾讯业务,DNF黑钻', '90', '0');
INSERT INTO shop_goods_class_tag VALUES ('261', '10', '50', '91', '话费网游&nbsp;&gt;&nbsp;腾讯业务&nbsp;&gt;&nbsp;CF会员', '话费网游,腾讯业务,CF会员', '91', '0');
INSERT INTO shop_goods_class_tag VALUES ('262', '10', '50', '92', '话费网游&nbsp;&gt;&nbsp;腾讯业务&nbsp;&gt;&nbsp;音速紫钻', '话费网游,腾讯业务,音速紫钻', '92', '0');
INSERT INTO shop_goods_class_tag VALUES ('263', '11', '319', '322', '票务旅游&nbsp;&gt;&nbsp;旅游&nbsp;&gt;&nbsp;国内机票', '票务旅游,旅游,国内机票', '322', '0');
INSERT INTO shop_goods_class_tag VALUES ('264', '11', '319', '323', '票务旅游&nbsp;&gt;&nbsp;旅游&nbsp;&gt;&nbsp;国内酒店', '票务旅游,旅游,国内酒店', '323', '0');
INSERT INTO shop_goods_class_tag VALUES ('265', '11', '319', '324', '票务旅游&nbsp;&gt;&nbsp;旅游&nbsp;&gt;&nbsp;酒店团购', '票务旅游,旅游,酒店团购', '324', '0');
INSERT INTO shop_goods_class_tag VALUES ('266', '11', '320', '331', '票务旅游&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;演出门票', '票务旅游,票务,演出门票', '331', '0');
INSERT INTO shop_goods_class_tag VALUES ('267', '11', '320', '332', '票务旅游&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;话剧歌剧', '票务旅游,票务,话剧歌剧', '332', '0');
INSERT INTO shop_goods_class_tag VALUES ('268', '11', '320', '333', '票务旅游&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;演唱会', '票务旅游,票务,演唱会', '333', '0');
INSERT INTO shop_goods_class_tag VALUES ('269', '11', '320', '334', '票务旅游&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;音乐会', '票务旅游,票务,音乐会', '334', '0');
INSERT INTO shop_goods_class_tag VALUES ('270', '11', '320', '335', '票务旅游&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;景区门票', '票务旅游,票务,景区门票', '335', '0');
INSERT INTO shop_goods_class_tag VALUES ('271', '11', '320', '336', '票务旅游&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;温泉', '票务旅游,票务,温泉', '336', '0');
INSERT INTO shop_goods_class_tag VALUES ('272', '11', '320', '337', '票务旅游&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;主题乐园', '票务旅游,票务,主题乐园', '337', '0');
INSERT INTO shop_goods_class_tag VALUES ('273', '11', '320', '338', '票务旅游&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;四折电影票', '票务旅游,票务,四折电影票', '338', '0');
INSERT INTO shop_goods_class_tag VALUES ('274', '11', '320', '339', '票务旅游&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;折扣活动', '票务旅游,票务,折扣活动', '339', '0');
INSERT INTO shop_goods_class_tag VALUES ('275', '11', '320', '340', '票务旅游&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;免费抢票', '票务旅游,票务,免费抢票', '340', '0');
INSERT INTO shop_goods_class_tag VALUES ('276', '11', '321', '325', '票务旅游&nbsp;&gt;&nbsp;保险&nbsp;&gt;&nbsp;旅行意外险', '票务旅游,保险,旅行意外险', '325', '0');
INSERT INTO shop_goods_class_tag VALUES ('277', '11', '321', '326', '票务旅游&nbsp;&gt;&nbsp;保险&nbsp;&gt;&nbsp;自驾意外险', '票务旅游,保险,自驾意外险', '326', '0');
INSERT INTO shop_goods_class_tag VALUES ('278', '11', '321', '327', '票务旅游&nbsp;&gt;&nbsp;保险&nbsp;&gt;&nbsp;家庭财产险', '票务旅游,保险,家庭财产险', '327', '0');
INSERT INTO shop_goods_class_tag VALUES ('279', '11', '321', '328', '票务旅游&nbsp;&gt;&nbsp;保险&nbsp;&gt;&nbsp;老人骨折险', '票务旅游,保险,老人骨折险', '328', '0');
INSERT INTO shop_goods_class_tag VALUES ('280', '11', '321', '329', '票务旅游&nbsp;&gt;&nbsp;保险&nbsp;&gt;&nbsp;家财火宅险', '票务旅游,保险,家财火宅险', '329', '0');
INSERT INTO shop_goods_class_tag VALUES ('281', '11', '321', '330', '票务旅游&nbsp;&gt;&nbsp;保险&nbsp;&gt;&nbsp;车险', '票务旅游,保险,车险', '330', '0');

-- ----------------------------
-- Table structure for `shop_goods_group`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_group`;
CREATE TABLE `shop_goods_group` (
  `group_id` int(10) unsigned NOT NULL auto_increment COMMENT '团购ID',
  `group_name` varchar(255) NOT NULL COMMENT '活动名称',
  `template_id` int(10) unsigned NOT NULL COMMENT '团购活动编号',
  `template_name` varchar(50) NOT NULL COMMENT '团购活动名称',
  `group_help` varchar(255) default NULL COMMENT '活动说明',
  `start_time` int(10) unsigned NOT NULL default '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL default '0' COMMENT '结束时间',
  `goods_id` int(10) unsigned NOT NULL default '0' COMMENT '商品ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `store_id` int(10) unsigned NOT NULL default '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `spec_price` varchar(255) NOT NULL COMMENT '规格价格',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `groupbuy_price` decimal(10,2) NOT NULL COMMENT '团购价格',
  `limit_type` tinyint(1) NOT NULL default '0' COMMENT '限制类型 1.按照人数 2.按照件数',
  `virtual_quantity` int(10) unsigned NOT NULL COMMENT '虚拟购买数量',
  `buyer_count` int(10) unsigned NOT NULL COMMENT '已购买人数',
  `def_quantity` int(10) NOT NULL default '0' COMMENT '已订购数',
  `min_quantity` int(10) NOT NULL default '0' COMMENT '最小团购数量',
  `sale_quantity` int(10) NOT NULL default '0' COMMENT '每人限购数量',
  `max_num` int(10) NOT NULL default '0' COMMENT '最高件数',
  `group_intro` text COMMENT '本团介绍',
  `state` tinyint(1) unsigned NOT NULL default '0' COMMENT '团购状态 1.未发布 2.已取消 3.进行中 4.已完成 5.已结束',
  `recommended` tinyint(1) unsigned NOT NULL COMMENT '是否推荐 0.未推荐 1.已推荐',
  `published` tinyint(1) NOT NULL default '0' COMMENT '是否发布 1.未发布 2.已发布',
  `views` int(10) unsigned NOT NULL default '0' COMMENT '查看次数',
  `cancel_intro` varchar(255) default NULL COMMENT '取消说明',
  `class_id` int(10) unsigned NOT NULL COMMENT '团购类别编号',
  `area_id` int(10) unsigned NOT NULL COMMENT '团购地区编号',
  `group_pic` varchar(100) NOT NULL COMMENT '团购图片',
  `rebate` decimal(10,2) NOT NULL COMMENT '折扣率',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods_group
-- ----------------------------
INSERT INTO shop_goods_group VALUES ('1', '【爆款团购】A团金士顿TF 8G卡B团16G TF卡C团8G', '1', '2012-2', '', '1328025600', '1343664000', '83', '金士顿TF 8G卡', '2', 'shopnc', '', '119.00', '69.00', '0', '0', '0', '0', '1', '0', '100', '<img src=\"upload/store/goods/2/e99e2e310263c5a3190926bff38ad416.jpg_max.jpg\" />', '3', '1', '0', '1', null, '2', '1', 'b9b56b145b4a2a2c8b6ecaf382a30e9e.jpg_small.jpg', '5.80', '');
INSERT INTO shop_goods_group VALUES ('2', '新款鳄鱼恤男式钱包 进口二层牛皮男皮夹钱包', '1', '2012-2', '', '1328025600', '1343664000', '84', '新款鳄鱼恤男式钱包 进口二层牛皮男皮夹钱包', '2', 'shopnc', '', '298.00', '69.00', '0', '0', '0', '0', '1', '0', '200', '<img src=\"upload/store/goods/2/4b31a940c3acd55c40658565fb08c0ad.jpg_max.jpg\" />', '3', '0', '0', '0', null, '0', '0', '176ef2fe9f642f292cd1f03fa12ad814.jpg_small.jpg', '2.32', '');

-- ----------------------------
-- Table structure for `shop_goods_spec`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_spec`;
CREATE TABLE `shop_goods_spec` (
  `spec_id` int(11) NOT NULL auto_increment COMMENT '商品规格索引id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `spec_name` varchar(255) NOT NULL COMMENT '规格名称',
  `spec_goods_price` decimal(10,2) NOT NULL COMMENT '规格商品价格',
  `spec_goods_storage` int(11) NOT NULL COMMENT '规格商品库存',
  `spec_salenum` int(11) NOT NULL default '0' COMMENT '售出数量',
  `spec_goods_color` varchar(20) NOT NULL COMMENT '规格商品颜色',
  `spec_goods_serial` varchar(50) NOT NULL COMMENT '规格商品编号',
  `spec_goods_spec` text NOT NULL COMMENT '商品规格序列化',
  PRIMARY KEY  (`spec_id`)
) ENGINE=MyISAM AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods_spec
-- ----------------------------
INSERT INTO shop_goods_spec VALUES ('1', '1', '', '4999.00', '20', '0', '', 'YWUHJH', '');
INSERT INTO shop_goods_spec VALUES ('4', '3', '', '5999.00', '20', '0', '', 'HSJAAA', '');
INSERT INTO shop_goods_spec VALUES ('5', '4', '', '3999.00', '20', '0', '', 'HHSYA', '');
INSERT INTO shop_goods_spec VALUES ('6', '5', '', '4999.00', '20', '0', '', 'HHHHS', '');
INSERT INTO shop_goods_spec VALUES ('7', '6', '', '5299.00', '20', '0', '', 'HGDHG', '');
INSERT INTO shop_goods_spec VALUES ('8', '7', '', '6999.00', '20', '0', '', 'JJHHJ', '');
INSERT INTO shop_goods_spec VALUES ('9', '8', '', '8999.00', '20', '0', '', 'TYWGH', '');
INSERT INTO shop_goods_spec VALUES ('10', '9', '', '12066.00', '20', '0', '', 'GHUGDD', '');
INSERT INTO shop_goods_spec VALUES ('11', '10', '', '8688.00', '20', '0', '', 'JHJHJ', '');
INSERT INTO shop_goods_spec VALUES ('12', '11', '', '55728.00', '20', '0', '', 'HJHJJ', '');
INSERT INTO shop_goods_spec VALUES ('173', '2', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '600.00', '5', '0', '', 'shopnc0030001', 'a:2:{i:1;s:6:\"白色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('15', '13', '', '166.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('16', '14', '', '56.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('17', '15', '', '23.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('167', '12', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '439.00', '5', '0', '', 'shopnc0020001', 'a:2:{i:1;s:6:\"白色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('20', '17', '', '78.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('21', '18', '', '65.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('161', '16', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '299.00', '8', '0', '', 'shopnc0010001', 'a:2:{i:1;s:6:\"白色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('57', '52', '', '99.00', '100', '0', '', 'HJKJ1', '');
INSERT INTO shop_goods_spec VALUES ('152', '19', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '300.00', '5', '0', '', 'shopnc07001', 'a:2:{i:8;s:6:\"褐色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('149', '21', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '300.00', '7', '0', '', 'shopnc06001', 'a:2:{i:2;s:6:\"黑色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('27', '23', '', '40.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('147', '22', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '398.00', '9', '0', '', 'shopnc05001', 'a:2:{i:1;s:6:\"白色\";i:22;s:6:\"均码\";}');
INSERT INTO shop_goods_spec VALUES ('135', '36', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '268.00', '10', '0', '', 'shopnc0060001', 'a:2:{i:24;s:2:\"36\";i:4;s:6:\"红色\";}');
INSERT INTO shop_goods_spec VALUES ('30', '26', '', '99.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('116', '78', 'a:1:{i:1;s:6:\"颜色\";}', '107.00', '100', '0', '', '', 'a:1:{i:4;s:6:\"红色\";}');
INSERT INTO shop_goods_spec VALUES ('109', '35', 'a:1:{i:1;s:6:\"颜色\";}', '46.00', '100', '0', '', '', 'a:1:{i:4;s:6:\"红色\";}');
INSERT INTO shop_goods_spec VALUES ('33', '29', '', '99.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('34', '30', '', '1.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('144', '24', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '133.00', '6', '0', '', 'shopnc04001', 'a:2:{i:11;s:6:\"桔色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('37', '32', '', '179.00', '10', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('38', '33', '', '45.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('39', '34', '', '151.00', '100', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('110', '27', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '798.00', '1', '0', '', 'shopnc00211', 'a:2:{i:3;s:6:\"紫色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('140', '31', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '249.00', '10', '0', '', '', 'a:2:{i:23;s:2:\"35\";i:7;s:6:\"蓝色\";}');
INSERT INTO shop_goods_spec VALUES ('42', '37', '', '99.00', '100', '0', '', 'JHYUGG', '');
INSERT INTO shop_goods_spec VALUES ('43', '38', '', '119.00', '100', '0', '', 'HJHJK', '');
INSERT INTO shop_goods_spec VALUES ('44', '39', '', '84.00', '100', '0', '', 'HHKKK1', '');
INSERT INTO shop_goods_spec VALUES ('45', '40', '', '138.00', '100', '0', '', 'JKHJHJ', '');
INSERT INTO shop_goods_spec VALUES ('46', '41', '', '358.00', '100', '0', '', 'JKLKJ2', '');
INSERT INTO shop_goods_spec VALUES ('47', '42', '', '47.00', '100', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('48', '43', '', '114.00', '100', '0', '', 'JKUIHJH', '');
INSERT INTO shop_goods_spec VALUES ('49', '44', '', '32.00', '100', '0', '', 'MJHGGJ', '');
INSERT INTO shop_goods_spec VALUES ('50', '45', '', '45.00', '20', '0', '', 'SJHJA', '');
INSERT INTO shop_goods_spec VALUES ('51', '46', '', '66.00', '20', '0', '', 'DJDJKA', '');
INSERT INTO shop_goods_spec VALUES ('52', '47', '', '74.00', '100', '0', '', 'MJJHJJ', '');
INSERT INTO shop_goods_spec VALUES ('53', '48', '', '30.00', '20', '0', '', 'SHJHJ', '');
INSERT INTO shop_goods_spec VALUES ('54', '49', '', '8.00', '50', '0', '', 'NMMNA', '');
INSERT INTO shop_goods_spec VALUES ('55', '50', '', '156.00', '20', '0', '', 'FDHJS', '');
INSERT INTO shop_goods_spec VALUES ('56', '51', '', '20.00', '20', '0', '', 'WGHJHJ', '');
INSERT INTO shop_goods_spec VALUES ('58', '53', '', '9.00', '20', '0', '', 'HJDHJ', '');
INSERT INTO shop_goods_spec VALUES ('59', '54', '', '46.00', '20', '0', '', 'SGHJHS', '');
INSERT INTO shop_goods_spec VALUES ('60', '55', '', '99.00', '100', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('61', '56', '', '78.00', '20', '0', '', 'QHJDGH', '');
INSERT INTO shop_goods_spec VALUES ('62', '57', '', '18.00', '20', '0', '', 'YSHJSS', '');
INSERT INTO shop_goods_spec VALUES ('63', '58', '', '99.00', '100', '0', '', 'HKJK', '');
INSERT INTO shop_goods_spec VALUES ('64', '59', '', '22.00', '20', '0', '', 'HJSHJS', '');
INSERT INTO shop_goods_spec VALUES ('65', '60', '', '99.00', '100', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('66', '61', '', '169.00', '100', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('67', '62', '', '99.00', '100', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('68', '63', '', '80.00', '100', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('71', '65', '', '3.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('180', '83', 'N;', '99.00', '100', '0', '', '', 'N;');
INSERT INTO shop_goods_spec VALUES ('74', '67', '', '18.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('75', '68', '', '36.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('76', '69', '', '22.80', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('129', '25', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '348.00', '1', '0', '', 'shopnc03001', 'a:2:{i:2;s:6:\"黑色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('78', '71', '', '39.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('184', '84', 'a:1:{i:1;s:6:\"颜色\";}', '198.00', '100', '0', '', '', 'a:1:{i:2;s:6:\"黑色\";}');
INSERT INTO shop_goods_spec VALUES ('80', '73', '', '29.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('81', '74', '', '88.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('82', '75', '', '140.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('83', '76', '', '68.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('84', '77', '', '148.00', '20', '0', '', '', '');
INSERT INTO shop_goods_spec VALUES ('118', '70', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '519.00', '10', '0', '', '', 'a:2:{i:34;s:2:\"46\";i:1;s:6:\"白色\";}');
INSERT INTO shop_goods_spec VALUES ('98', '79', 'a:1:{i:1;s:6:\"颜色\";}', '100.00', '100', '0', '', '', 'a:1:{i:2;s:6:\"黑色\";}');
INSERT INTO shop_goods_spec VALUES ('96', '80', 'a:1:{i:1;s:6:\"颜色\";}', '298.00', '100', '0', '', '', 'a:1:{i:4;s:6:\"红色\";}');
INSERT INTO shop_goods_spec VALUES ('94', '81', 'a:1:{i:1;s:6:\"颜色\";}', '178.00', '100', '0', '', '', 'a:1:{i:2;s:6:\"黑色\";}');
INSERT INTO shop_goods_spec VALUES ('91', '82', 'a:1:{i:1;s:6:\"颜色\";}', '269.00', '100', '0', '', '', 'a:1:{i:1;s:6:\"白色\";}');
INSERT INTO shop_goods_spec VALUES ('92', '82', 'a:1:{i:1;s:6:\"颜色\";}', '269.00', '100', '0', '', '', 'a:1:{i:4;s:6:\"红色\";}');
INSERT INTO shop_goods_spec VALUES ('93', '82', 'a:1:{i:1;s:6:\"颜色\";}', '269.00', '100', '0', '', '', 'a:1:{i:7;s:6:\"蓝色\";}');
INSERT INTO shop_goods_spec VALUES ('95', '81', 'a:1:{i:1;s:6:\"颜色\";}', '178.00', '100', '0', '', '', 'a:1:{i:3;s:6:\"紫色\";}');
INSERT INTO shop_goods_spec VALUES ('97', '80', 'a:1:{i:1;s:6:\"颜色\";}', '310.00', '100', '0', '', '', 'a:1:{i:8;s:6:\"褐色\";}');
INSERT INTO shop_goods_spec VALUES ('99', '79', 'a:1:{i:1;s:6:\"颜色\";}', '100.00', '100', '0', '', '', 'a:1:{i:10;s:6:\"粉色\";}');
INSERT INTO shop_goods_spec VALUES ('100', '28', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '182.00', '1', '0', '', 'shopnc00112', 'a:2:{i:9;s:6:\"黄色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('101', '28', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '182.00', '2', '0', '', 'shopnc00113', 'a:2:{i:9;s:6:\"黄色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('102', '28', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '182.00', '3', '0', '', 'shopnc00114', 'a:2:{i:9;s:6:\"黄色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('103', '28', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '182.00', '4', '0', '', 'shopnc00115', 'a:2:{i:10;s:6:\"粉色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('104', '28', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '182.00', '5', '0', '', 'shopnc00116', 'a:2:{i:10;s:6:\"粉色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('105', '28', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '182.00', '6', '0', '', 'shopnc00117', 'a:2:{i:10;s:6:\"粉色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('106', '28', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '182.00', '7', '0', '', 'shopnc00118', 'a:2:{i:11;s:6:\"桔色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('107', '28', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '182.00', '8', '0', '', 'shopnc00119', 'a:2:{i:11;s:6:\"桔色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('108', '28', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '182.00', '9', '0', '', 'shopnc00110', 'a:2:{i:11;s:6:\"桔色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('111', '27', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '798.00', '2', '0', '', 'shopnc00212', 'a:2:{i:3;s:6:\"紫色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('112', '27', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '798.00', '3', '0', '', 'shopnc00213', 'a:2:{i:4;s:6:\"红色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('113', '27', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '798.00', '4', '0', '', 'shopnc00214', 'a:2:{i:4;s:6:\"红色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('114', '27', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '798.00', '5', '0', '', 'shopnc00215', 'a:2:{i:8;s:6:\"褐色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('115', '27', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '798.00', '6', '0', '', 'shopnc00216', 'a:2:{i:8;s:6:\"褐色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('117', '78', 'a:1:{i:1;s:6:\"颜色\";}', '100.00', '80', '0', '', '', 'a:1:{i:10;s:6:\"粉色\";}');
INSERT INTO shop_goods_spec VALUES ('119', '70', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '519.00', '5', '0', '', '', 'a:2:{i:24;s:2:\"36\";i:1;s:6:\"白色\";}');
INSERT INTO shop_goods_spec VALUES ('120', '70', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '519.00', '10', '0', '', '', 'a:2:{i:31;s:2:\"43\";i:1;s:6:\"白色\";}');
INSERT INTO shop_goods_spec VALUES ('121', '70', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '519.00', '20', '0', '', '', 'a:2:{i:26;s:2:\"38\";i:1;s:6:\"白色\";}');
INSERT INTO shop_goods_spec VALUES ('122', '70', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '519.00', '30', '0', '', '', 'a:2:{i:33;s:2:\"45\";i:1;s:6:\"白色\";}');
INSERT INTO shop_goods_spec VALUES ('123', '70', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '519.00', '40', '0', '', '', 'a:2:{i:28;s:2:\"40\";i:1;s:6:\"白色\";}');
INSERT INTO shop_goods_spec VALUES ('124', '70', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '519.00', '50', '0', '', '', 'a:2:{i:23;s:2:\"35\";i:1;s:6:\"白色\";}');
INSERT INTO shop_goods_spec VALUES ('125', '70', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '519.00', '60', '0', '', '', 'a:2:{i:30;s:2:\"42\";i:1;s:6:\"白色\";}');
INSERT INTO shop_goods_spec VALUES ('126', '70', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '519.00', '70', '0', '', '', 'a:2:{i:25;s:2:\"37\";i:1;s:6:\"白色\";}');
INSERT INTO shop_goods_spec VALUES ('127', '70', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '519.00', '80', '0', '', '', 'a:2:{i:32;s:2:\"44\";i:1;s:6:\"白色\";}');
INSERT INTO shop_goods_spec VALUES ('128', '70', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '519.00', '90', '0', '', '', 'a:2:{i:27;s:2:\"39\";i:1;s:6:\"白色\";}');
INSERT INTO shop_goods_spec VALUES ('130', '25', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '348.00', '2', '0', '', 'shopnc03002', 'a:2:{i:2;s:6:\"黑色\";i:18;s:2:\"XL\";}');
INSERT INTO shop_goods_spec VALUES ('131', '25', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '348.00', '3', '0', '', 'shopnc03003', 'a:2:{i:2;s:6:\"黑色\";i:19;s:3:\"XXL\";}');
INSERT INTO shop_goods_spec VALUES ('132', '25', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '348.00', '4', '0', '', 'shopnc03004', 'a:2:{i:7;s:6:\"蓝色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('133', '25', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '348.00', '5', '0', '', 'shopnc03005', 'a:2:{i:7;s:6:\"蓝色\";i:18;s:2:\"XL\";}');
INSERT INTO shop_goods_spec VALUES ('134', '25', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '348.00', '6', '0', '', 'shopnc03006', 'a:2:{i:7;s:6:\"蓝色\";i:19;s:3:\"XXL\";}');
INSERT INTO shop_goods_spec VALUES ('136', '36', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '268.00', '10', '0', '', 'shopnc0060003', 'a:2:{i:26;s:2:\"38\";i:4;s:6:\"红色\";}');
INSERT INTO shop_goods_spec VALUES ('137', '36', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '268.00', '10', '0', '', 'shopnc0060005', 'a:2:{i:28;s:2:\"40\";i:4;s:6:\"红色\";}');
INSERT INTO shop_goods_spec VALUES ('138', '36', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '268.00', '10', '0', '', 'shopnc0060002', 'a:2:{i:25;s:2:\"37\";i:4;s:6:\"红色\";}');
INSERT INTO shop_goods_spec VALUES ('139', '36', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '268.00', '10', '0', '', 'shopnc0060004', 'a:2:{i:27;s:2:\"39\";i:4;s:6:\"红色\";}');
INSERT INTO shop_goods_spec VALUES ('141', '31', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '249.00', '10', '0', '', '', 'a:2:{i:24;s:2:\"36\";i:7;s:6:\"蓝色\";}');
INSERT INTO shop_goods_spec VALUES ('142', '31', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '249.00', '10', '0', '', '', 'a:2:{i:25;s:2:\"37\";i:7;s:6:\"蓝色\";}');
INSERT INTO shop_goods_spec VALUES ('143', '31', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '249.00', '10', '0', '', '', 'a:2:{i:26;s:2:\"38\";i:7;s:6:\"蓝色\";}');
INSERT INTO shop_goods_spec VALUES ('145', '24', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '133.00', '7', '0', '', 'shopnc04002', 'a:2:{i:11;s:6:\"桔色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('146', '24', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '133.00', '8', '0', '', 'shopnc04003', 'a:2:{i:11;s:6:\"桔色\";i:22;s:6:\"均码\";}');
INSERT INTO shop_goods_spec VALUES ('148', '22', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '398.00', '10', '0', '', 'shopnc05002', 'a:2:{i:6;s:6:\"花色\";i:22;s:6:\"均码\";}');
INSERT INTO shop_goods_spec VALUES ('150', '21', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '300.00', '8', '0', '', 'shopnc06002', 'a:2:{i:2;s:6:\"黑色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('151', '21', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '300.00', '9', '0', '', 'shopnc06003', 'a:2:{i:2;s:6:\"黑色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('153', '19', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '300.00', '6', '0', '', 'shopnc07002', 'a:2:{i:8;s:6:\"褐色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('154', '19', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '300.00', '7', '0', '', 'shopnc07003', 'a:2:{i:8;s:6:\"褐色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('155', '19', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '300.00', '8', '0', '', 'shopnc07004', 'a:2:{i:9;s:6:\"黄色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('156', '19', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '300.00', '9', '0', '', 'shopnc07005', 'a:2:{i:9;s:6:\"黄色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('157', '19', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '300.00', '10', '0', '', 'shopnc07006', 'a:2:{i:9;s:6:\"黄色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('158', '19', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '300.00', '11', '0', '', 'shopnc07007', 'a:2:{i:11;s:6:\"桔色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('159', '19', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '300.00', '12', '0', '', 'shopnc07008', 'a:2:{i:11;s:6:\"桔色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('160', '19', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '300.00', '13', '0', '', 'shopnc07009', 'a:2:{i:11;s:6:\"桔色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('162', '16', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '299.00', '9', '0', '', 'shopnc0010002', 'a:2:{i:1;s:6:\"白色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('163', '16', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '299.00', '10', '0', '', 'shopnc0010003', 'a:2:{i:1;s:6:\"白色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('164', '16', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '299.00', '11', '0', '', 'shopnc0010004', 'a:2:{i:8;s:6:\"褐色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('165', '16', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '299.00', '12', '0', '', 'shopnc0010005', 'a:2:{i:8;s:6:\"褐色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('166', '16', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '299.00', '13', '0', '', 'shopnc0010006', 'a:2:{i:8;s:6:\"褐色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('168', '12', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '439.00', '6', '0', '', 'shopnc0020002', 'a:2:{i:1;s:6:\"白色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('169', '12', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '439.00', '7', '0', '', 'shopnc0020003', 'a:2:{i:1;s:6:\"白色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('170', '12', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '439.00', '8', '0', '', 'shopnc0020004', 'a:2:{i:8;s:6:\"褐色\";i:15;s:1:\"S\";}');
INSERT INTO shop_goods_spec VALUES ('171', '12', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '439.00', '9', '0', '', 'shopnc0020005', 'a:2:{i:8;s:6:\"褐色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('172', '12', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '439.00', '10', '0', '', 'shopnc0020006', 'a:2:{i:8;s:6:\"褐色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('174', '2', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '600.00', '6', '0', '', 'shopnc0030002', 'a:2:{i:1;s:6:\"白色\";i:16;s:1:\"M\";}');
INSERT INTO shop_goods_spec VALUES ('175', '2', 'a:2:{i:1;s:6:\"颜色\";i:2;s:6:\"尺码\";}', '600.00', '7', '0', '', 'shopnc0030003', 'a:2:{i:1;s:6:\"白色\";i:17;s:1:\"L\";}');
INSERT INTO shop_goods_spec VALUES ('176', '66', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '98.00', '5', '0', '', 'shopnc0040001', 'a:2:{i:23;s:2:\"35\";i:2;s:6:\"黑色\";}');
INSERT INTO shop_goods_spec VALUES ('177', '66', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '98.00', '6', '0', '', 'shopnc0040002', 'a:2:{i:24;s:2:\"36\";i:2;s:6:\"黑色\";}');
INSERT INTO shop_goods_spec VALUES ('178', '66', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '98.00', '7', '0', '', 'shopnc0040003', 'a:2:{i:25;s:2:\"37\";i:2;s:6:\"黑色\";}');
INSERT INTO shop_goods_spec VALUES ('179', '66', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '98.00', '8', '0', '', 'shopnc0040004', 'a:2:{i:26;s:2:\"38\";i:2;s:6:\"黑色\";}');
INSERT INTO shop_goods_spec VALUES ('181', '64', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '580.00', '5', '0', '', 'shopnc0050001', 'a:2:{i:25;s:2:\"37\";i:8;s:6:\"褐色\";}');
INSERT INTO shop_goods_spec VALUES ('182', '64', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '580.00', '6', '0', '', 'shopnc0050002', 'a:2:{i:26;s:2:\"38\";i:8;s:6:\"褐色\";}');
INSERT INTO shop_goods_spec VALUES ('183', '64', 'a:2:{i:3;s:6:\"鞋码\";i:1;s:6:\"颜色\";}', '580.00', '7', '0', '', 'shopnc0050003', 'a:2:{i:27;s:2:\"39\";i:8;s:6:\"褐色\";}');
INSERT INTO shop_goods_spec VALUES ('185', '84', 'a:1:{i:1;s:6:\"颜色\";}', '198.00', '100', '0', '', '', 'a:1:{i:8;s:6:\"褐色\";}');

-- ----------------------------
-- Table structure for `shop_goods_spec_index`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_spec_index`;
CREATE TABLE `shop_goods_spec_index` (
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `sp_id` int(10) unsigned NOT NULL COMMENT '规格id',
  `sp_value_id` int(10) unsigned NOT NULL COMMENT '规格值id',
  PRIMARY KEY  (`goods_id`,`gc_id`,`sp_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods_spec_index
-- ----------------------------
INSERT INTO shop_goods_spec_index VALUES ('82', '96', '3', '1', '1');
INSERT INTO shop_goods_spec_index VALUES ('82', '96', '3', '1', '4');
INSERT INTO shop_goods_spec_index VALUES ('82', '96', '3', '1', '7');
INSERT INTO shop_goods_spec_index VALUES ('28', '19', '1', '2', '17');
INSERT INTO shop_goods_spec_index VALUES ('28', '19', '1', '2', '16');
INSERT INTO shop_goods_spec_index VALUES ('28', '19', '1', '2', '15');
INSERT INTO shop_goods_spec_index VALUES ('28', '19', '1', '1', '11');
INSERT INTO shop_goods_spec_index VALUES ('28', '19', '1', '1', '10');
INSERT INTO shop_goods_spec_index VALUES ('28', '19', '1', '1', '9');
INSERT INTO shop_goods_spec_index VALUES ('81', '96', '3', '1', '2');
INSERT INTO shop_goods_spec_index VALUES ('81', '96', '3', '1', '3');
INSERT INTO shop_goods_spec_index VALUES ('80', '96', '3', '1', '4');
INSERT INTO shop_goods_spec_index VALUES ('80', '96', '3', '1', '8');
INSERT INTO shop_goods_spec_index VALUES ('27', '16', '1', '2', '17');
INSERT INTO shop_goods_spec_index VALUES ('27', '16', '1', '2', '16');
INSERT INTO shop_goods_spec_index VALUES ('27', '16', '1', '1', '8');
INSERT INTO shop_goods_spec_index VALUES ('27', '16', '1', '1', '4');
INSERT INTO shop_goods_spec_index VALUES ('27', '16', '1', '1', '3');
INSERT INTO shop_goods_spec_index VALUES ('79', '96', '3', '1', '10');
INSERT INTO shop_goods_spec_index VALUES ('79', '96', '3', '1', '2');
INSERT INTO shop_goods_spec_index VALUES ('78', '96', '3', '1', '10');
INSERT INTO shop_goods_spec_index VALUES ('78', '96', '3', '1', '4');
INSERT INTO shop_goods_spec_index VALUES ('70', '290', '2', '1', '1');
INSERT INTO shop_goods_spec_index VALUES ('70', '290', '2', '3', '34');
INSERT INTO shop_goods_spec_index VALUES ('70', '290', '2', '3', '33');
INSERT INTO shop_goods_spec_index VALUES ('70', '290', '2', '3', '32');
INSERT INTO shop_goods_spec_index VALUES ('70', '290', '2', '3', '31');
INSERT INTO shop_goods_spec_index VALUES ('70', '290', '2', '3', '30');
INSERT INTO shop_goods_spec_index VALUES ('70', '290', '2', '3', '28');
INSERT INTO shop_goods_spec_index VALUES ('70', '290', '2', '3', '27');
INSERT INTO shop_goods_spec_index VALUES ('70', '290', '2', '3', '26');
INSERT INTO shop_goods_spec_index VALUES ('70', '290', '2', '3', '25');
INSERT INTO shop_goods_spec_index VALUES ('70', '290', '2', '3', '24');
INSERT INTO shop_goods_spec_index VALUES ('70', '290', '2', '3', '23');
INSERT INTO shop_goods_spec_index VALUES ('35', '96', '3', '1', '4');
INSERT INTO shop_goods_spec_index VALUES ('25', '15', '1', '1', '2');
INSERT INTO shop_goods_spec_index VALUES ('25', '15', '1', '1', '7');
INSERT INTO shop_goods_spec_index VALUES ('25', '15', '1', '2', '17');
INSERT INTO shop_goods_spec_index VALUES ('25', '15', '1', '2', '18');
INSERT INTO shop_goods_spec_index VALUES ('25', '15', '1', '2', '19');
INSERT INTO shop_goods_spec_index VALUES ('36', '108', '2', '3', '28');
INSERT INTO shop_goods_spec_index VALUES ('36', '108', '2', '3', '26');
INSERT INTO shop_goods_spec_index VALUES ('36', '108', '2', '3', '24');
INSERT INTO shop_goods_spec_index VALUES ('36', '108', '2', '3', '27');
INSERT INTO shop_goods_spec_index VALUES ('36', '108', '2', '3', '25');
INSERT INTO shop_goods_spec_index VALUES ('36', '108', '2', '1', '4');
INSERT INTO shop_goods_spec_index VALUES ('31', '106', '2', '3', '23');
INSERT INTO shop_goods_spec_index VALUES ('31', '106', '2', '3', '24');
INSERT INTO shop_goods_spec_index VALUES ('31', '106', '2', '3', '25');
INSERT INTO shop_goods_spec_index VALUES ('31', '106', '2', '3', '26');
INSERT INTO shop_goods_spec_index VALUES ('31', '106', '2', '1', '7');
INSERT INTO shop_goods_spec_index VALUES ('24', '19', '1', '1', '11');
INSERT INTO shop_goods_spec_index VALUES ('24', '19', '1', '2', '15');
INSERT INTO shop_goods_spec_index VALUES ('24', '19', '1', '2', '16');
INSERT INTO shop_goods_spec_index VALUES ('24', '19', '1', '2', '22');
INSERT INTO shop_goods_spec_index VALUES ('22', '19', '1', '1', '1');
INSERT INTO shop_goods_spec_index VALUES ('22', '19', '1', '1', '6');
INSERT INTO shop_goods_spec_index VALUES ('22', '19', '1', '2', '22');
INSERT INTO shop_goods_spec_index VALUES ('21', '17', '1', '1', '2');
INSERT INTO shop_goods_spec_index VALUES ('21', '17', '1', '2', '15');
INSERT INTO shop_goods_spec_index VALUES ('21', '17', '1', '2', '16');
INSERT INTO shop_goods_spec_index VALUES ('21', '17', '1', '2', '17');
INSERT INTO shop_goods_spec_index VALUES ('19', '17', '1', '1', '8');
INSERT INTO shop_goods_spec_index VALUES ('19', '17', '1', '1', '9');
INSERT INTO shop_goods_spec_index VALUES ('19', '17', '1', '1', '11');
INSERT INTO shop_goods_spec_index VALUES ('19', '17', '1', '2', '15');
INSERT INTO shop_goods_spec_index VALUES ('19', '17', '1', '2', '16');
INSERT INTO shop_goods_spec_index VALUES ('19', '17', '1', '2', '17');
INSERT INTO shop_goods_spec_index VALUES ('16', '17', '1', '1', '1');
INSERT INTO shop_goods_spec_index VALUES ('16', '17', '1', '1', '8');
INSERT INTO shop_goods_spec_index VALUES ('16', '17', '1', '2', '15');
INSERT INTO shop_goods_spec_index VALUES ('16', '17', '1', '2', '16');
INSERT INTO shop_goods_spec_index VALUES ('16', '17', '1', '2', '17');
INSERT INTO shop_goods_spec_index VALUES ('12', '16', '1', '2', '17');
INSERT INTO shop_goods_spec_index VALUES ('12', '16', '1', '2', '16');
INSERT INTO shop_goods_spec_index VALUES ('12', '16', '1', '2', '15');
INSERT INTO shop_goods_spec_index VALUES ('12', '16', '1', '1', '8');
INSERT INTO shop_goods_spec_index VALUES ('12', '16', '1', '1', '1');
INSERT INTO shop_goods_spec_index VALUES ('2', '16', '1', '1', '1');
INSERT INTO shop_goods_spec_index VALUES ('2', '16', '1', '2', '15');
INSERT INTO shop_goods_spec_index VALUES ('2', '16', '1', '2', '16');
INSERT INTO shop_goods_spec_index VALUES ('2', '16', '1', '2', '17');
INSERT INTO shop_goods_spec_index VALUES ('66', '290', '2', '3', '23');
INSERT INTO shop_goods_spec_index VALUES ('66', '290', '2', '3', '24');
INSERT INTO shop_goods_spec_index VALUES ('66', '290', '2', '3', '25');
INSERT INTO shop_goods_spec_index VALUES ('66', '290', '2', '3', '26');
INSERT INTO shop_goods_spec_index VALUES ('66', '290', '2', '1', '2');
INSERT INTO shop_goods_spec_index VALUES ('64', '290', '2', '3', '25');
INSERT INTO shop_goods_spec_index VALUES ('64', '290', '2', '3', '26');
INSERT INTO shop_goods_spec_index VALUES ('64', '290', '2', '3', '27');
INSERT INTO shop_goods_spec_index VALUES ('64', '290', '2', '1', '8');
INSERT INTO shop_goods_spec_index VALUES ('84', '105', '3', '1', '2');
INSERT INTO shop_goods_spec_index VALUES ('84', '105', '3', '1', '8');

-- ----------------------------
-- Table structure for `shop_groupbuy_area`
-- ----------------------------
DROP TABLE IF EXISTS `shop_groupbuy_area`;
CREATE TABLE `shop_groupbuy_area` (
  `area_id` int(10) unsigned NOT NULL auto_increment COMMENT '地区编号',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `area_parent_id` int(10) unsigned NOT NULL COMMENT '父地区编号',
  `area_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `area_deep` tinyint(1) unsigned NOT NULL COMMENT '深度',
  PRIMARY KEY  (`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_groupbuy_area
-- ----------------------------
INSERT INTO shop_groupbuy_area VALUES ('1', '天津', '0', '255', '0');
INSERT INTO shop_groupbuy_area VALUES ('2', '北京', '0', '255', '0');
INSERT INTO shop_groupbuy_area VALUES ('3', '上海', '0', '255', '0');
INSERT INTO shop_groupbuy_area VALUES ('4', '重庆', '0', '255', '0');
INSERT INTO shop_groupbuy_area VALUES ('5', '武汉', '0', '255', '0');
INSERT INTO shop_groupbuy_area VALUES ('6', '成都', '0', '255', '0');
INSERT INTO shop_groupbuy_area VALUES ('7', '深圳', '0', '255', '0');
INSERT INTO shop_groupbuy_area VALUES ('8', '广州', '0', '255', '0');
INSERT INTO shop_groupbuy_area VALUES ('9', '厦门', '0', '255', '0');
INSERT INTO shop_groupbuy_area VALUES ('10', '杭州', '0', '255', '0');
INSERT INTO shop_groupbuy_area VALUES ('11', '南京', '0', '255', '0');
INSERT INTO shop_groupbuy_area VALUES ('12', '青岛', '0', '255', '0');

-- ----------------------------
-- Table structure for `shop_groupbuy_class`
-- ----------------------------
DROP TABLE IF EXISTS `shop_groupbuy_class`;
CREATE TABLE `shop_groupbuy_class` (
  `class_id` int(10) unsigned NOT NULL auto_increment COMMENT '类别编号',
  `class_name` varchar(20) NOT NULL COMMENT '类别名称',
  `class_parent_id` int(10) unsigned NOT NULL COMMENT '父类别编号',
  `sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `deep` tinyint(1) unsigned NOT NULL COMMENT '深度',
  PRIMARY KEY  (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_groupbuy_class
-- ----------------------------
INSERT INTO shop_groupbuy_class VALUES ('1', '运动户外', '0', '255', '0');
INSERT INTO shop_groupbuy_class VALUES ('2', '数码家电', '0', '255', '0');
INSERT INTO shop_groupbuy_class VALUES ('3', '家具家装', '0', '255', '0');
INSERT INTO shop_groupbuy_class VALUES ('4', '影音娱乐', '0', '255', '0');

-- ----------------------------
-- Table structure for `shop_groupbuy_join`
-- ----------------------------
DROP TABLE IF EXISTS `shop_groupbuy_join`;
CREATE TABLE `shop_groupbuy_join` (
  `group_id` int(10) unsigned NOT NULL default '0' COMMENT '团购ID',
  `member_id` int(10) unsigned NOT NULL default '0' COMMENT '会员ID',
  `member_name` varchar(50) default NULL COMMENT '会员姓名',
  `quantity` tinyint(1) NOT NULL default '0' COMMENT '团购数量',
  `spec_quantity` text COMMENT '团购规格',
  `owner` varchar(50) default NULL COMMENT '真实姓名',
  `tel` varchar(50) default NULL COMMENT '联系电话',
  `order_id` int(10) unsigned NOT NULL default '0' COMMENT '订单id',
  `add_time` int(10) NOT NULL default '0' COMMENT '参团时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_groupbuy_join
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_groupbuy_price_range`
-- ----------------------------
DROP TABLE IF EXISTS `shop_groupbuy_price_range`;
CREATE TABLE `shop_groupbuy_price_range` (
  `range_id` int(10) unsigned NOT NULL auto_increment COMMENT '价格区间编号',
  `range_name` varchar(20) NOT NULL COMMENT '区间名称',
  `range_start` int(10) unsigned NOT NULL COMMENT '区间下限',
  `range_end` int(10) unsigned NOT NULL COMMENT '区间上限',
  PRIMARY KEY  (`range_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_groupbuy_price_range
-- ----------------------------
INSERT INTO shop_groupbuy_price_range VALUES ('1', '500元以下', '1', '500');
INSERT INTO shop_groupbuy_price_range VALUES ('2', '501元-1000元', '501', '1000');
INSERT INTO shop_groupbuy_price_range VALUES ('3', '1001元-2000元', '1001', '2000');
INSERT INTO shop_groupbuy_price_range VALUES ('4', '2001元-3000元', '2001', '3000');
INSERT INTO shop_groupbuy_price_range VALUES ('5', '3001元-5000元', '3001', '5000');

-- ----------------------------
-- Table structure for `shop_groupbuy_template`
-- ----------------------------
DROP TABLE IF EXISTS `shop_groupbuy_template`;
CREATE TABLE `shop_groupbuy_template` (
  `template_id` int(10) unsigned NOT NULL auto_increment COMMENT '团购活动编号',
  `template_name` varchar(50) NOT NULL COMMENT '团购活动能够名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `join_end_time` int(10) unsigned NOT NULL COMMENT '活动报名截至时间',
  `state` tinyint(1) unsigned NOT NULL COMMENT '状态(1-可报名/2-已过期)',
  PRIMARY KEY  (`template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_groupbuy_template
-- ----------------------------
INSERT INTO shop_groupbuy_template VALUES ('1', '2012-2', '1328025600', '1343664000', '1333123200', '1');

-- ----------------------------
-- Table structure for `shop_inform`
-- ----------------------------
DROP TABLE IF EXISTS `shop_inform`;
CREATE TABLE `shop_inform` (
  `inform_id` int(11) NOT NULL auto_increment COMMENT '举报id',
  `inform_member_id` int(11) NOT NULL COMMENT '举报人id',
  `inform_member_name` varchar(50) NOT NULL COMMENT '举报人会员名',
  `inform_goods_id` int(11) NOT NULL COMMENT '被举报的商品id',
  `inform_goods_name` varchar(100) NOT NULL COMMENT '被举报的商品名称',
  `inform_subject_id` int(11) NOT NULL COMMENT '举报主题id',
  `inform_subject_content` varchar(50) NOT NULL COMMENT '举报主题',
  `inform_content` varchar(100) NOT NULL COMMENT '举报信息',
  `inform_pic1` varchar(100) NOT NULL COMMENT '图片1',
  `inform_pic2` varchar(100) NOT NULL COMMENT '图片2',
  `inform_pic3` varchar(100) NOT NULL COMMENT '图片3',
  `inform_datetime` int(11) NOT NULL COMMENT '举报时间',
  `inform_store_id` int(11) NOT NULL COMMENT '被举报商品的店铺id',
  `inform_state` tinyint(4) NOT NULL COMMENT '举报状态(1未处理/2已处理)',
  `inform_handle_type` tinyint(4) NOT NULL COMMENT '举报处理结果(1无效举报/2恶意举报/3有效举报)',
  `inform_handle_message` varchar(100) NOT NULL COMMENT '举报处理信息',
  `inform_handle_datetime` int(11) NOT NULL default '0' COMMENT '举报处理时间',
  `inform_handle_member_id` int(11) NOT NULL default '0' COMMENT '管理员id',
  PRIMARY KEY  (`inform_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_inform
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_inform_subject`
-- ----------------------------
DROP TABLE IF EXISTS `shop_inform_subject`;
CREATE TABLE `shop_inform_subject` (
  `inform_subject_id` int(11) NOT NULL auto_increment COMMENT '举报主题id',
  `inform_subject_content` varchar(100) NOT NULL COMMENT '举报主题内容',
  `inform_subject_type_id` int(11) NOT NULL COMMENT '举报类型id',
  `inform_subject_type_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `inform_subject_state` tinyint(11) NOT NULL COMMENT '举报主题状态(1可用/2失效)',
  PRIMARY KEY  (`inform_subject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_inform_subject
-- ----------------------------
INSERT INTO shop_inform_subject VALUES ('1', '管制刀具、弓弩类、其他武器等', '1', '出售禁售品', '1');
INSERT INTO shop_inform_subject VALUES ('2', '赌博用具类', '1', '出售禁售品', '1');
INSERT INTO shop_inform_subject VALUES ('3', '枪支弹药', '1', '出售禁售品', '1');
INSERT INTO shop_inform_subject VALUES ('4', '毒品及吸毒工具', '1', '出售禁售品', '1');

-- ----------------------------
-- Table structure for `shop_inform_subject_type`
-- ----------------------------
DROP TABLE IF EXISTS `shop_inform_subject_type`;
CREATE TABLE `shop_inform_subject_type` (
  `inform_type_id` int(11) NOT NULL auto_increment COMMENT '举报类型id',
  `inform_type_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `inform_type_desc` varchar(100) NOT NULL COMMENT '举报类型描述',
  `inform_type_state` tinyint(4) NOT NULL COMMENT '举报类型状态(1有效/2失效)',
  PRIMARY KEY  (`inform_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_inform_subject_type
-- ----------------------------
INSERT INTO shop_inform_subject_type VALUES ('1', '出售禁售品', '销售商城禁止和限制交易规则下所规定的所有商品。', '1');

-- ----------------------------
-- Table structure for `shop_link`
-- ----------------------------
DROP TABLE IF EXISTS `shop_link`;
CREATE TABLE `shop_link` (
  `link_id` int(10) unsigned NOT NULL auto_increment COMMENT '索引id',
  `link_title` varchar(100) default NULL COMMENT '标题',
  `link_url` varchar(100) default NULL COMMENT '链接',
  `link_pic` varchar(100) default NULL COMMENT '图片',
  `link_sort` tinyint(3) unsigned NOT NULL default '255' COMMENT '排序',
  PRIMARY KEY  (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_link
-- ----------------------------
INSERT INTO shop_link VALUES ('1', '网城创想', 'http://www.shopnc.net', 'ac1d6b368d9a8b048b974186c8d467a9.gif', '0');
INSERT INTO shop_link VALUES ('29', '腾讯网', 'http://www.qq.com', '75eb906e1b7a2f568f38517c3b338b76.png', '8');
INSERT INTO shop_link VALUES ('28', '天空下载', 'http://www.skycn.com', '7e6c4529c180781a4918728c59106a0d.jpg', '6');
INSERT INTO shop_link VALUES ('27', '站长之家', 'http://www.chinaz.com', 'd3f4b551af9621eca9dce6b742c66540.gif', '7');
INSERT INTO shop_link VALUES ('26', '华军下载', 'http://www.onlinedown.net', '675e3c273601596996c7d9f56340c7ff.gif', '5');
INSERT INTO shop_link VALUES ('22', 'PHPChina', 'http://www.phpchina.com', '71f3651a995ef7a8d8bcc00dfe1fa018.gif', '3');
INSERT INTO shop_link VALUES ('23', '康盛创想', 'http://www.comsenz.com', '2656c79dff5e988bc20d707d1a73a583.jpg', '2');
INSERT INTO shop_link VALUES ('24', 'A5下载', 'http://down.admin5.com', '1ce6ffadfcf5e45d7fbd86d46d0e90db.gif', '4');
INSERT INTO shop_link VALUES ('25', 'DZ动力', 'http://www.verydz.com', '29269def49a5d57a24490b69b3312260.gif', '1');
INSERT INTO shop_link VALUES ('38', '支付宝平台', 'https://www.alipay.com/', '', '5');
INSERT INTO shop_link VALUES ('37', '新浪微博开放平台', 'http://open.weibo.com/', '', '3');
INSERT INTO shop_link VALUES ('36', 'Discuz!云平台', 'http://discuz.qq.com/', '', '4');
INSERT INTO shop_link VALUES ('35', '搜搜开放平台', 'http://open.soso.com/', '', '6');
INSERT INTO shop_link VALUES ('34', 'QQ彩贝开放联盟', 'http://open.cb.qq.com/', '', '8');
INSERT INTO shop_link VALUES ('33', '财付通开放平台', 'http://open.tenpay.com/', '', '7');
INSERT INTO shop_link VALUES ('32', '腾讯微博开放平台', 'http://open.t.qq.com/', '', '2');
INSERT INTO shop_link VALUES ('31', '腾讯社区开放平台', 'http://opensns.qq.com/', '', '1');
INSERT INTO shop_link VALUES ('30', 'QQ互联登陆', 'http://connect.opensns.qq.com/', '', '0');

-- ----------------------------
-- Table structure for `shop_mail_msg_temlates`
-- ----------------------------
DROP TABLE IF EXISTS `shop_mail_msg_temlates`;
CREATE TABLE `shop_mail_msg_temlates` (
  `name` varchar(100) NOT NULL COMMENT '模板名称',
  `title` varchar(100) default NULL COMMENT '模板标题',
  `code` varchar(100) NOT NULL COMMENT '模板调用代码',
  `content` text NOT NULL COMMENT '模板内容',
  `type` tinyint(1) NOT NULL COMMENT '模板类别，0为邮件，1为短信息，默认为0',
  `mail_switch` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否开启',
  PRIMARY KEY  (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_mail_msg_temlates
-- ----------------------------
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给买家]</strong>店铺调整了订单费用的邮件通知', '{$site_name}提醒:店铺{$store_name}调整了您的订单费用', 'email_tobuyer_adjust_fee_notify', '<p>尊敬的{$buyer_name}:</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">与您交易的店铺{$store_name}调整了您订单号为{$order_sn}的订单的费用，请您及时付款。</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}</a><br />\r\n<a target=\"_blank\" href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" {$site_url}=\"\" index.php?app=\"buyer_order&amp;act=view&amp;order_id={$order.order_id}\"></a></p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给买家]</strong>订单被取消的邮件通知', '{$site_name}提醒:您的订单{$order_sn}已被取消', 'email_tobuyer_cancel_order_notify', '<p>尊敬的{$buyer_name}:</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">与您交易的店铺{$store_name}已经取消了您的订单{$order_sn}。</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">原因：{$reason}</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}</a></p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给买家]</strong>店铺确认收到即时到帐的货款并完成交易的邮件通知', '{$site_name}提醒:店铺{$store_name}确认收到了您的货款，交易完成！', 'email_tobuyer_cod_order_finish_notify', '<p>尊敬的{$buyer_name}:</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">与您交易的店铺{$store_name}已经确认收到了您的货到付款订单{$order_sn}的付款，交易完成！您可以到用户中心-&gt;我的订单中对该交易进行评价。</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}</a></p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看我的订单列表请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=member&amp;op=order\" target=\"_blank\">{$site_url}/index.php?act=member&amp;op=order</a></p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给买家]</strong>店铺已确认了订单的邮件通知', '{$site_name}提醒:店铺{$store_name}已确认了您的订单', 'email_tobuyer_confirm_cod_order_notify', '尊敬的{$buyer_name}:\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">与您交易的店铺{$store_name}已经确认了您的货到付款订单{$order_sn}，请耐心等待发货。</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}</a></p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给买家]</strong>订单已生成的邮件通知', '{$site_name}提醒:您的订单已生成', 'email_tobuyer_new_order_notify', '尊敬的{$buyer_name}:\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">您在{$site_name}上下的订单已生成，订单号{$order_sn}。</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}</a></p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给买家]</strong>店铺确认收到线下支付的货款的邮件通知', '{$site_name}提醒:店铺{$store_name}已确认收到了您线下支付的货款', 'email_tobuyer_offline_pay_success_notify', '尊敬的{$buyer_name}:\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">与您交易的店铺{$store_name}已经确认了收到了您的订单{$order_sn}的付款，请耐心等待卖家发货。</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}</a></p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给买家]</strong>商品咨询得到了回复的邮件通知', '{$site_name}提醒:{$user_name}您的商品咨询已得到回复', 'email_tobuyer_question_replied', '尊敬的用户:\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">您好, 您在 {$site_name} 中的{$goods_name}咨询已得到回复，请点击下面的链接查看：</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store_consult&amp;op=my_consult\" target=\"_blank\">{$site_url}/index.php?act=store_consult&amp;op=my_consult</a></p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"> 如果以上链接无法点击，请将它拷贝到浏览器(例如IE)的地址栏中。</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给买家]</strong>订单已发货的邮件通知', '{$site_name}提醒:您的订单{$order_sn}已发货', 'email_tobuyer_shipped_notify', '尊敬的{$buyer_name}:\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">与您交易的店铺{$store_name}已经给您的订单{$order_sn}发货了，请注意查收。</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">发货单号：{$invoice_no}</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}</a></p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<div style=\"text-align:right;\">\r\n</div>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>买家取消了订单的邮件通知', '{$site_name}提醒:买家{$buyer_name}取消了订单{$order_sn}', 'email_toseller_cancel_order_notify', '尊敬的{$seller_name}:\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">买家{$buyer_name}已经取消了与您交易的订单{$order_sn}。</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">原因：{$reason}</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}</a></p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看您的订单列表管理页请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=store_order\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=store_order</a></p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>买家确认了订单并完成交易的邮件通知', '{$site_name}提醒:买家确认了与您交易的订单{$order_sn}，交易完成', 'email_toseller_finish_notify', '尊敬的{$seller_name}:\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">买家{$buyer_name}已经确认了与您交易的订单{$order_sn}。交易完成</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}</a></p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看您的订单列表管理页请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=store_order\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=store_order</a></p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>有新订单需要处理的邮件通知', '{$site_name}提醒:您有一个新订单需要处理', 'email_toseller_new_order_notify', '尊敬的{$seller_name}:\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">您有一个新的订单需要处理，订单号{$order_sn}，请尽快处理。</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}</a></p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看您的订单列表管理页请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=store_order\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=store_order</a></p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>买家已经完成线下付款的邮件通知', '{$site_name}提醒:买家{$buyer_name}已通过线下支付支付了订单的费用', 'email_toseller_offline_pay_notify', '尊敬的{$seller_name}:\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">买家{$buyer_name}已通过线下支付支付了与您交易的订单{$order_sn}。请注意查收。</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">支付信息：{$pay_message}</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}</a></p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看您的订单列表管理页请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=store_order\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=store_order</a></p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>买家已付款的邮件通知', '{$site_name}提醒:买家{$buyer_name}已付款', 'email_toseller_online_pay_success_notify', '尊敬的{$seller_name}:\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">买家{$buyer_name}已通过线上支付完成了订单{$.order_sn}的付款，请核实并尽快安排发货。</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=show_order&amp;order_id={$order_id}</a></p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\">查看您的订单列表管理页请点击以下链接</p>\r\n<p style=\"\" padding-left:=\"\" 30px;=\"\"><a href=\"{$site_url}/index.php?act=store&amp;op=store_order\" target=\"_blank\">{$site_url}/index.php?act=store&amp;op=store_order</a></p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$site_name}</p>\r\n<p style=\"text-align: right;\" text-align:=\"\" right;=\"\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给用户]</strong>用户修改了密码的邮件通知', '{$site_name}提醒:{$user_name}修改密码设置', 'email_touser_find_password', '<p>尊敬的{$user_name}:</p>\r\n<p>您好, 您刚才在{$site_name}申请了重置密码，您的新密码为<span style=\"color:#ff9900;\">{$new_password}</span>。</p>\r\n<p>请点击<a href=\"{$site_url}\" target=\"_blank\">{$site_url}</a>登录，修改您的新密码。</p>\r\n<p style=\"text-align:right;\">{$site_name}</p>\r\n<p style=\"text-align:right;\">{$mail_send_time}</p>', '0', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>店铺被管理员关闭时的通知', null, 'msg_toseller_store_closed_notify', '您的店铺已被关闭，原因是：{$reason}', '1', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>店铺过期被自动关闭时的通知', null, 'msg_toseller_store_expired_closed_notify', '您的店铺已被关闭，原因是：店铺已到期', '1', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>团购活动已过结束时间时的通知', null, 'msg_toseller_groupbuy_end_notify', '请尽快到“已结束的团购”完成该团购活动，以便买家可以完成交易，如结束后{$cancel_days}天未确认完成，该活动将被自动取消,查看<a href=\"index.php?act=store_groupbuy&group_name=&state=5\">已结束的团购</a>', '1', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>商品被管理员删除时的通知', null, 'msg_toseller_goods_droped_notify', '管理员删除了您的商品：{$goods_name}\\r\\n原因是：{$reason}', '1', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>品牌申请通过审核时的通知', null, 'msg_toseller_brand_passed_notify', '恭喜！您申请的品牌 {$brand_name} 已通过审核。', '1', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>品牌申请被拒绝时的通知', null, 'msg_toseller_brand_refused_notify', '抱歉，您申请的品牌 {$brand_name} 已被拒绝，原因如下：\\r\\n{$reason}', '1', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>店铺被管理员删除时的通知', null, 'msg_toseller_store_droped_notify', '您的店铺已被删除', '1', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>开店申请被通过时的通知', null, 'msg_toseller_store_passed_notify', '恭喜，您的店铺已开通，赶快来用户中心发布商品吧。', '1', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给卖家]</strong>开店申请被拒绝时的通知', null, 'msg_toseller_store_refused_notify', '抱歉，您的开店申请已被拒绝，原因如下： {$reason}', '1', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给买家]</strong>团购活动被卖家取消时的通知', null, 'msg_tobuyer_groupbuy_cancel_notify', '团购活动被卖家取消,原因如下：\\r\\n{$reason}\\r\\n[url={$url}]查看详情[/url]', '1', '0');
INSERT INTO shop_mail_msg_temlates VALUES ('<strong>[给买家]</strong>团购活动完成发给买家的通知', null, 'msg_tobuyer_groupbuy_finished_notify', '“{$group_name}”活动成功完成，请尽快购买活动商品。<a href=\"index.php?act=member&op=groupbuy&state=4\">点此购买</a>', '1', '0');

-- ----------------------------
-- Table structure for `shop_map`
-- ----------------------------
DROP TABLE IF EXISTS `shop_map`;
CREATE TABLE `shop_map` (
  `map_id` int(11) NOT NULL auto_increment COMMENT '地图ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(20) NOT NULL COMMENT '会员名称',
  `area_id` int(11) NOT NULL COMMENT '地区ID',
  `area_info` varchar(50) NOT NULL COMMENT '地区内容',
  `address` varchar(50) default NULL COMMENT '地址',
  `point_lng` float NOT NULL default '0' COMMENT '地理经度',
  `point_lat` float NOT NULL default '0' COMMENT '地理纬度',
  `store_name` varchar(20) default NULL COMMENT '店铺名称',
  `store_id` int(11) default '0' COMMENT '店铺ID',
  `map_api` char(9) NOT NULL default 'baidu' COMMENT '地图API(暂时只有baidu)',
  PRIMARY KEY  (`map_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_map
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_member`
-- ----------------------------
DROP TABLE IF EXISTS `shop_member`;
CREATE TABLE `shop_member` (
  `member_id` int(11) NOT NULL auto_increment COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `member_truename` varchar(50) default NULL COMMENT '真实姓名',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `member_avatar` varchar(50) default NULL COMMENT '会员头像',
  `member_sex` tinyint(1) default NULL COMMENT '会员性别',
  `member_birthday` date default NULL COMMENT '生日',
  `member_passwd` varchar(32) NOT NULL COMMENT '会员密码',
  `member_email` varchar(100) NOT NULL COMMENT '会员邮箱',
  `member_qq` varchar(100) default NULL COMMENT 'qq',
  `member_msn` varchar(100) default NULL COMMENT 'msn',
  `member_ww` varchar(100) default NULL COMMENT '阿里旺旺',
  `member_login_num` int(11) NOT NULL default '1' COMMENT '登录次数',
  `member_time` varchar(10) NOT NULL COMMENT '会员注册时间',
  `member_login_time` varchar(10) NOT NULL COMMENT '当前登录时间',
  `member_old_login_time` varchar(10) NOT NULL COMMENT '上次登录时间',
  `member_login_ip` varchar(20) default NULL COMMENT '当前登录ip',
  `member_old_login_ip` varchar(20) default NULL COMMENT '上次登录ip',
  `member_goldnum` int(11) NOT NULL default '0' COMMENT '金币数',
  `member_goldnumcount` int(11) NOT NULL default '0' COMMENT '曾经拥有购买金币数',
  `member_goldnumminus` int(11) NOT NULL default '0' COMMENT '已经消费金币数',
  `member_qqopenid` varchar(100) default NULL COMMENT 'qq互联id',
  `member_qqinfo` text COMMENT 'qq账号相关信息',
  `member_sinaopenid` varchar(100) default NULL COMMENT '新浪微博登录id',
  `member_sinainfo` text COMMENT '新浪账号相关信息序列化值',
  `member_points` int(11) NOT NULL default '0' COMMENT '会员积分',
  `available_predeposit` decimal(10,2) NOT NULL default '0.00' COMMENT '预存款可用金额',
  `freeze_predeposit` decimal(10,2) NOT NULL default '0.00' COMMENT '预存款冻结金额',
  `inform_allow` tinyint(1) NOT NULL default '1' COMMENT '是否允许举报(1可以/2不可以)',
  `member_is_admin` tinyint(1) NOT NULL default '0' COMMENT '是否是管理员，0为否，1为是，默认为0',
  PRIMARY KEY  (`member_id`),
  KEY `member_name` (`member_name`,`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_member
-- ----------------------------
INSERT INTO shop_member VALUES ('5', 'shopnc', '网城创想', '2', 'e102c3d38990428473e4bc9961263ede_small.jpg', '1', '2008-01-02', '804451dc13014b1c785fb73b1617b760', '123456@qq.com', '1234567', '1234567@hotmail.com', null, '68', '1291605953', '1308123456', '1308123456', '127.0.0.1', '127.0.0.1', '0', '0', '0', null, null, null, null, '0', '0.00', '0.00', '1', '0');

-- ----------------------------
-- Table structure for `shop_message`
-- ----------------------------
DROP TABLE IF EXISTS `shop_message`;
CREATE TABLE `shop_message` (
  `message_id` int(11) NOT NULL auto_increment COMMENT '短消息索引id',
  `message_parent_id` int(11) NOT NULL COMMENT '回复短消息message_id',
  `from_member_id` int(11) NOT NULL COMMENT '短消息发送人',
  `to_member_id` varchar(1000) NOT NULL COMMENT '短消息接收人',
  `message_title` varchar(50) default NULL COMMENT '短消息标题',
  `message_body` varchar(255) NOT NULL COMMENT '短消息内容',
  `message_time` varchar(10) NOT NULL COMMENT '短消息发送时间',
  `message_update_time` varchar(10) default NULL COMMENT '短消息回复更新时间',
  `message_open` tinyint(1) NOT NULL default '0' COMMENT '短消息打开状态',
  `message_state` tinyint(1) NOT NULL default '0' COMMENT '短消息状态，0为正常状态，1为发送人删除状态，2为接收人删除状态',
  `message_type` tinyint(1) NOT NULL default '0' COMMENT '0为普通信、1为系统消息、2为CRM消息',
  `read_member_id` varchar(1000) default NULL COMMENT '已经读过该消息的会员id',
  `del_member_id` varchar(1000) default NULL COMMENT '已经删除该消息的会员id',
  `message_ismore` tinyint(1) NOT NULL default '0' COMMENT '站内信是否为一条发给多个用户 0为否 1为多条 ',
  `from_member_name` varchar(100) default NULL COMMENT '发信息人用户名',
  `to_member_name` varchar(100) default NULL COMMENT '接收人用户名',
  PRIMARY KEY  (`message_id`),
  KEY `from_member_id` (`from_member_id`),
  KEY `to_member_id` (`to_member_id`(333)),
  KEY `message_ismore` (`message_ismore`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_message
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `shop_navigation`;
CREATE TABLE `shop_navigation` (
  `nav_id` int(11) NOT NULL auto_increment COMMENT '索引ID',
  `nav_type` tinyint(1) NOT NULL default '0' COMMENT '类别，0自定义导航，1商品分类，2文章导航，3活动导航，默认为0',
  `nav_title` varchar(100) default NULL COMMENT '导航标题',
  `nav_url` varchar(255) default NULL COMMENT '导航链接',
  `nav_location` tinyint(1) NOT NULL default '0' COMMENT '导航位置，0头部，1中部，2底部，默认为0',
  `nav_new_open` tinyint(1) NOT NULL default '0' COMMENT '是否以新窗口打开，0为否，1为是，默认为0',
  `nav_sort` tinyint(3) unsigned NOT NULL default '255' COMMENT '排序',
  `item_id` int(10) unsigned NOT NULL default '0' COMMENT '类别ID，对应着nav_type中的内容，默认为0',
  PRIMARY KEY  (`nav_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_navigation
-- ----------------------------
INSERT INTO shop_navigation VALUES ('6', '0', '关于ShopNC', 'index.php?act=article&article_id=22', '2', '0', '255', '0');
INSERT INTO shop_navigation VALUES ('7', '0', '联系我们', 'index.php?act=article&article_id=23', '2', '0', '240', '0');
INSERT INTO shop_navigation VALUES ('8', '0', '广告合作', 'index.php?act=article&article_id=25', '2', '0', '220', '0');
INSERT INTO shop_navigation VALUES ('9', '0', '招聘英才', 'index.php?act=article&article_id=24', '2', '0', '210', '0');
INSERT INTO shop_navigation VALUES ('10', '3', '运动专场', null, '1', '0', '255', '1');

-- ----------------------------
-- Table structure for `shop_order`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `order_id` int(11) NOT NULL auto_increment COMMENT '订单索引id',
  `order_sn` varchar(100) NOT NULL COMMENT '订单编号，商城内部使用',
  `seller_id` int(11) NOT NULL COMMENT '卖家id',
  `store_id` int(11) NOT NULL COMMENT '卖家店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  `buyer_email` varchar(100) NOT NULL COMMENT '买家电子邮箱',
  `add_time` varchar(10) NOT NULL COMMENT '订单生成时间',
  `order_type` tinyint(1) NOT NULL default '0' COMMENT '订单类型 0.普通 1.团购',
  `payment_id` int(11) NOT NULL COMMENT '支付方式id',
  `payment_name` varchar(50) NOT NULL COMMENT '支付方式名称',
  `payment_code` varchar(50) NOT NULL COMMENT '支付方式名称代码',
  `payment_direct` char(1) default '1' COMMENT '支付类型:1是即时到帐,2是担保交易',
  `out_sn` varchar(100) NOT NULL COMMENT '订单编号，外部支付时使用，有些外部支付系统要求特定的订单编号',
  `payment_time` varchar(10) default NULL COMMENT '支付(付款)时间',
  `pay_message` varchar(300) default NULL COMMENT '支付留言',
  `shipping_time` varchar(10) default NULL COMMENT '配送时间',
  `shipping_code` varchar(50) default NULL COMMENT '物流单号',
  `out_payment_code` varchar(255) default NULL COMMENT '外部交易平台单独使用的标识字符串',
  `finnshed_time` varchar(10) default NULL COMMENT '订单完成时间',
  `invoice` varchar(100) default NULL COMMENT '发票信息',
  `goods_amount` decimal(10,2) NOT NULL COMMENT '商品总价格',
  `discount` decimal(10,2) default NULL COMMENT '折扣价格',
  `order_amount` decimal(10,2) NOT NULL COMMENT '订单总价格',
  `evaluation_status` tinyint(1) default NULL COMMENT '评价状态 0为评价，1已评价',
  `evaluation_time` varchar(10) default NULL COMMENT '评价时间',
  `order_message` varchar(300) default NULL COMMENT '订单留言',
  `order_state` int(11) NOT NULL default '10' COMMENT '订单状态：10(默认):未付款;20:已付款;30:已发货;40:已收货;50:已提交;60已确认;',
  `order_pointscount` int(11) NOT NULL default '0' COMMENT '订单赠送积分',
  `voucher_id` int(11) default NULL COMMENT '代金券id',
  `voucher_price` int(11) default NULL COMMENT '代金券面额',
  `voucher_code` varchar(32) default NULL COMMENT '代金券编码',
  `refund_state` tinyint(1) unsigned default '0' COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `return_state` tinyint(1) unsigned default '0' COMMENT '退货状态:0是无退货,1是部分退货,2是全部退货',
  `refund_amount` decimal(10,2) default '0.00' COMMENT '退款金额',
  `return_num` int(10) unsigned default '0' COMMENT '退货数量',
  `group_id` int(10) unsigned default '0' COMMENT '团购编号(非团购订单为0)',
  `group_count` int(10) unsigned NOT NULL default '0' COMMENT '团购数量',
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_order_address`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_address`;
CREATE TABLE `shop_order_address` (
  `order_id` int(11) NOT NULL auto_increment COMMENT '订单id',
  `true_name` varchar(50) NOT NULL COMMENT '收货人姓名',
  `area_id` int(11) NOT NULL COMMENT '地区id',
  `area_info` varchar(100) NOT NULL COMMENT '地区内容',
  `address` varchar(200) NOT NULL COMMENT '详细地址',
  `zip_code` varchar(20) NOT NULL COMMENT '邮政编码',
  `tel_phone` varchar(20) NOT NULL COMMENT '电话号码',
  `mob_phone` varchar(20) NOT NULL COMMENT '手机号码',
  `shipping_fee` decimal(10,2) NOT NULL COMMENT '配送费用',
  `shipping_id` int(11) NOT NULL COMMENT '配送方式id',
  `shipping_name` varchar(50) NOT NULL COMMENT '配送方式名称',
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order_address
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_goods`;
CREATE TABLE `shop_order_goods` (
  `rec_id` int(11) NOT NULL auto_increment COMMENT '订单商品表索引id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `spec_id` int(11) NOT NULL COMMENT '规格id',
  `spec_info` varchar(50) default NULL COMMENT '规格描述',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `goods_image` varchar(100) default NULL COMMENT '商品图片',
  `evaluation` tinyint(1) NOT NULL default '0' COMMENT '评价类型: 1好评 2中评 3差评',
  `comment` varchar(255) default NULL COMMENT '评论',
  `evaluation_state` tinyint(1) default '0' COMMENT '评价信息的状态 0为正常 1为禁止显示 2 为取消评价',
  `evaluation_remark` varchar(500) default NULL COMMENT '管理员对评价的处理备注',
  `goods_returnnum` int(10) unsigned default '0' COMMENT '退货数量',
  PRIMARY KEY  (`rec_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_log`;
CREATE TABLE `shop_order_log` (
  `log_id` int(11) NOT NULL auto_increment COMMENT '订单处理历史索引id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_state` varchar(20) NOT NULL COMMENT '订单状态信息',
  `change_state` varchar(20) NOT NULL COMMENT '下一步订单状态信息',
  `state_info` varchar(20) NOT NULL COMMENT '订单状态描述',
  `log_time` varchar(10) NOT NULL COMMENT '处理时间',
  `operator` varchar(50) NOT NULL COMMENT '操作人',
  PRIMARY KEY  (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_payment`
-- ----------------------------
DROP TABLE IF EXISTS `shop_payment`;
CREATE TABLE `shop_payment` (
  `payment_id` int(11) NOT NULL auto_increment COMMENT '店铺支付索引id',
  `payment_code` varchar(50) NOT NULL COMMENT '支付代码名称',
  `payment_name` varchar(50) NOT NULL COMMENT '支付名称',
  `payment_info` varchar(255) default NULL COMMENT '支付接口介绍',
  `payment_config` text NOT NULL COMMENT '支付接口配置信息',
  `store_id` int(11) NOT NULL COMMENT '对应的店铺id',
  `payment_online` tinyint(1) NOT NULL COMMENT '是否为在线接口，1是，0否',
  `payment_state` tinyint(1) NOT NULL COMMENT '接口状态，1可用，2不可用',
  `payment_sort` int(11) NOT NULL COMMENT '支付排序',
  PRIMARY KEY  (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_payment
-- ----------------------------
INSERT INTO shop_payment VALUES ('4', 'offline', '线下支付', '', '', '2', '0', '1', '0');

-- ----------------------------
-- Table structure for `shop_points_cart`
-- ----------------------------
DROP TABLE IF EXISTS `shop_points_cart`;
CREATE TABLE `shop_points_cart` (
  `pcart_id` int(11) NOT NULL auto_increment COMMENT '自增ID',
  `pmember_id` int(11) NOT NULL COMMENT '会员编号',
  `pgoods_id` int(11) NOT NULL COMMENT '积分礼品序号',
  `pgoods_name` varchar(100) NOT NULL COMMENT '积分礼品名称',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换积分',
  `pgoods_choosenum` int(11) NOT NULL COMMENT '选择积分礼品数量',
  `pgoods_image` varchar(100) default NULL COMMENT '积分礼品图片',
  PRIMARY KEY  (`pcart_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_points_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_points_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_points_goods`;
CREATE TABLE `shop_points_goods` (
  `pgoods_id` int(11) NOT NULL auto_increment COMMENT '积分礼品索引id',
  `pgoods_name` varchar(100) NOT NULL COMMENT '积分礼品名称',
  `pgoods_price` decimal(10,2) NOT NULL default '0.00' COMMENT '积分礼品原价',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换所需积分',
  `pgoods_image` varchar(100) NOT NULL COMMENT '积分礼品默认封面图片',
  `pgoods_tag` varchar(100) NOT NULL COMMENT '积分礼品标签',
  `pgoods_serial` varchar(50) NOT NULL COMMENT '积分礼品货号',
  `pgoods_storage` int(11) NOT NULL default '0' COMMENT '积分礼品库存数',
  `pgoods_show` tinyint(1) NOT NULL COMMENT '积分礼品上架 0表示下架 1表示上架',
  `pgoods_commend` tinyint(1) NOT NULL COMMENT '积分礼品推荐',
  `pgoods_add_time` int(11) NOT NULL COMMENT '积分礼品添加时间',
  `pgoods_keywords` varchar(100) default NULL COMMENT '积分礼品关键字',
  `pgoods_description` varchar(200) default NULL COMMENT '积分礼品描述',
  `pgoods_body` text NOT NULL COMMENT '积分礼品详细内容',
  `pgoods_state` tinyint(1) NOT NULL default '0' COMMENT '积分礼品状态，0开启，1禁售',
  `pgoods_close_reason` varchar(255) default NULL COMMENT '积分礼品禁售原因',
  `pgoods_salenum` int(11) NOT NULL default '0' COMMENT '积分礼品售出数量',
  `pgoods_view` int(11) NOT NULL default '0' COMMENT '积分商品浏览次数',
  `pgoods_islimit` tinyint(1) NOT NULL COMMENT '是否限制每会员兑换数量',
  `pgoods_limitnum` int(11) default NULL COMMENT '每会员限制兑换数量',
  `pgoods_freightcharge` tinyint(1) NOT NULL default '0' COMMENT '运费承担方式 0表示卖家承担 1表示买家承担',
  `pgoods_freightprice` decimal(10,2) default NULL COMMENT '运费价格',
  `pgoods_islimittime` tinyint(1) NOT NULL default '0' COMMENT '是否限制兑换时间 0为不限制 1为限制',
  `pgoods_starttime` int(11) default NULL COMMENT '兑换开始时间',
  `pgoods_endtime` int(11) default NULL COMMENT '兑换结束时间',
  `pgoods_sort` int(11) NOT NULL default '0' COMMENT '礼品排序',
  PRIMARY KEY  (`pgoods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_points_goods
-- ----------------------------
INSERT INTO shop_points_goods VALUES ('1', '奥利奥 双心脆威化饼干14.5g*16', '12.00', '300', '23d29b33704d79e94b83217dcca1308f.jpg', '奥利奥', '00000222221', '19', '1', '1', '1322032163', '奥利奥', '奥利奥', '<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\" width=\"800\"><tbody><tr><td style=\"font-weight:bold;\" width=\"100\"><p><span style=\"color:#000000;font-family:宋体;font-size:18px;\">商品名称：</span></p>\r\n<span style=\"font-size:18px;\">             </span></td>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">奥利奥 双心脆威化饼干14.5g*16</span></td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">品牌：</span></td>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">奥利奥</span></td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">规格：</span></td>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">14.5g*16</span></td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">包装：</span></td>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">盒</span></td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">原产地：</span></td>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">中国大陆</span></td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">保质期：</span></td>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">365天</span></td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">储藏方法：</span></td>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">存放于阴凉干爽处，避免阳光直射</span></td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">商品形态：</span></td>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">固态</span></td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">食用方法：</span></td>\r\n            <td style=\"font-weight:bold;\"><span style=\"color:#000000;font-family:宋体;font-size:18px;\">开启即食</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<img src=\"./upload/pointprod/3496d92e7c800e041393f1f94fb2e054.jpg\" alt=\"upload/pointprod/3496d92e7c800e041393f1f94fb2e054.jpg\" /><img src=\"./upload/pointprod/aac6ff227c0e83e9b6af2f090ae91547.jpg\" alt=\"upload/pointprod/aac6ff227c0e83e9b6af2f090ae91547.jpg\" />', '0', '', '1', '21', '0', '0', '1', '5.00', '0', '0', '0', '0');
INSERT INTO shop_points_goods VALUES ('2', '馨牌 提花格子毛巾【测试数据】', '13.00', '300', 'c98bc897edfa1036958cd17473f40819.jpg', '', '00000222212', '20', '1', '0', '1322034560', '', '', '<span style=\"font-family:宋体;\"><span style=\"font-size:x-small;\">规格：34*76CM<br />\r\n颜色：蓝色、粉色、米黄色，随机发送<br />\r\n安全标准：GB18401-2003&nbsp;&nbsp;&nbsp; B类（直接接触皮肤类）<br />\r\n执行标准：F2/T62006-2004<br />\r\n所有产品经过金属、验针检测。每款毛巾均配有外包装袋。</span></span>', '0', '', '0', '1', '0', '0', '0', '0.00', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `shop_points_log`
-- ----------------------------
DROP TABLE IF EXISTS `shop_points_log`;
CREATE TABLE `shop_points_log` (
  `pl_id` int(11) NOT NULL auto_increment COMMENT '积分日志编号',
  `pl_memberid` int(11) NOT NULL COMMENT '会员编号',
  `pl_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `pl_adminid` int(11) default NULL COMMENT '管理员编号',
  `pl_adminname` varchar(100) default NULL COMMENT '管理员名称',
  `pl_points` int(11) NOT NULL default '0' COMMENT '积分数负数表示扣除',
  `pl_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pl_desc` varchar(100) NOT NULL COMMENT '操作描述',
  `pl_stage` varchar(50) NOT NULL COMMENT '操作阶段',
  PRIMARY KEY  (`pl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_points_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_points_order`
-- ----------------------------
DROP TABLE IF EXISTS `shop_points_order`;
CREATE TABLE `shop_points_order` (
  `point_orderid` int(11) NOT NULL auto_increment COMMENT '兑换订单编号',
  `point_ordersn` varchar(100) NOT NULL COMMENT '兑换订单编号',
  `point_buyerid` int(11) NOT NULL COMMENT '兑换会员id',
  `point_buyername` varchar(50) NOT NULL COMMENT '兑换会员姓名',
  `point_buyeremail` varchar(100) NOT NULL COMMENT '兑换会员email',
  `point_addtime` int(11) NOT NULL COMMENT '兑换订单生成时间',
  `point_paymentid` int(11) NOT NULL COMMENT '支付方式id',
  `point_paymentname` varchar(50) NOT NULL COMMENT '支付方式名称',
  `point_paymentcode` varchar(50) NOT NULL COMMENT '支付方式名称代码',
  `point_paymentdirect` tinyint(1) default '1' COMMENT '支付类型:1是即时到帐,2是但保交易',
  `point_outsn` varchar(100) NOT NULL COMMENT '订单编号，外部支付时使用，有些外部支付系统要求特定的订单编号',
  `point_paymenttime` int(11) default NULL COMMENT '支付(付款)时间',
  `point_paymessage` varchar(300) default NULL COMMENT '支付留言',
  `point_shippingtime` int(11) default NULL COMMENT '配送时间',
  `point_shippingcode` varchar(50) default NULL COMMENT '物流单号',
  `point_shippingdesc` varchar(500) default NULL COMMENT '发货描述',
  `point_outpaymentcode` varchar(255) default NULL COMMENT '外部交易平台单独使用的标识字符串',
  `point_finnshedtime` int(11) default NULL COMMENT '订单完成时间',
  `point_allpoint` int(11) NOT NULL default '0' COMMENT '兑换总积分',
  `point_orderamount` decimal(10,2) NOT NULL COMMENT '兑换订单总金额',
  `point_shippingcharge` tinyint(1) NOT NULL default '0' COMMENT '运费承担方式 0表示卖家 1表示买家',
  `point_shippingfee` decimal(10,2) NOT NULL default '0.00' COMMENT '运费金额',
  `point_ordermessage` varchar(300) default NULL COMMENT '订单留言',
  `point_orderstate` int(11) NOT NULL default '10' COMMENT '订单状态：10(默认):未付款;11已付款;20:确认付款;30:已发货;40:已收货;50已完成;2已取消',
  PRIMARY KEY  (`point_orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_points_order
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_points_orderaddress`
-- ----------------------------
DROP TABLE IF EXISTS `shop_points_orderaddress`;
CREATE TABLE `shop_points_orderaddress` (
  `point_oaid` int(11) NOT NULL auto_increment COMMENT '自增id',
  `point_orderid` int(11) NOT NULL COMMENT '订单id',
  `point_truename` varchar(50) NOT NULL COMMENT '收货人姓名',
  `point_areaid` int(11) NOT NULL COMMENT '地区id',
  `point_areainfo` varchar(100) NOT NULL COMMENT '地区内容',
  `point_address` varchar(200) NOT NULL COMMENT '详细地址',
  `point_zipcode` varchar(20) NOT NULL COMMENT '邮政编码',
  `point_telphone` varchar(20) NOT NULL COMMENT '电话号码',
  `point_mobphone` varchar(20) NOT NULL COMMENT '手机号码',
  PRIMARY KEY  (`point_oaid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_points_orderaddress
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_points_ordergoods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_points_ordergoods`;
CREATE TABLE `shop_points_ordergoods` (
  `point_recid` int(11) NOT NULL auto_increment COMMENT '订单礼品表索引',
  `point_orderid` int(11) NOT NULL COMMENT '订单id',
  `point_goodsid` int(11) NOT NULL COMMENT '礼品id',
  `point_goodsname` varchar(100) NOT NULL COMMENT '礼品名称',
  `point_goodspoints` int(11) NOT NULL COMMENT '礼品兑换积分',
  `point_goodsnum` int(11) NOT NULL COMMENT '礼品数量',
  `point_goodsimage` varchar(100) default NULL COMMENT '礼品图片',
  PRIMARY KEY  (`point_recid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_points_ordergoods
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_predeposit_cash`
-- ----------------------------
DROP TABLE IF EXISTS `shop_predeposit_cash`;
CREATE TABLE `shop_predeposit_cash` (
  `pdcash_id` int(11) NOT NULL auto_increment COMMENT '自增编号',
  `pdcash_sn` varchar(100) NOT NULL COMMENT '记录唯一标示',
  `pdcash_memberid` int(11) NOT NULL COMMENT '会员编号',
  `pdcash_membername` varchar(50) NOT NULL COMMENT '会员名称',
  `pdcash_price` decimal(10,2) NOT NULL default '0.00' COMMENT '金额',
  `pdcash_payment` varchar(50) NOT NULL COMMENT '支付方式',
  `pdcash_paymentaccount` varchar(100) default NULL COMMENT '支付账号',
  `pdcash_toname` varchar(100) default NULL COMMENT '收款人姓名',
  `pdcash_tobank` varchar(100) default NULL COMMENT '收款银行',
  `pdcash_memberremark` varchar(1000) default NULL COMMENT '会员提现备注',
  `pdcash_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pdcash_state` tinyint(1) NOT NULL default '0' COMMENT '状态 0为申请 1为完成 2为关闭',
  `pdcash_paystate` tinyint(1) NOT NULL default '0' COMMENT '提现支付状态 0为未支付 1为支付',
  `pdcash_adminid` int(11) default NULL COMMENT '管理员编号',
  `pdcash_adminname` varchar(100) default NULL COMMENT '管理员姓名',
  `pdcash_adminremark` varchar(1000) default NULL COMMENT '管理员备注',
  `pdcash_remark` varchar(1000) default NULL COMMENT '管理员和会员都可查看的备注',
  PRIMARY KEY  (`pdcash_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_predeposit_cash
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_predeposit_log`
-- ----------------------------
DROP TABLE IF EXISTS `shop_predeposit_log`;
CREATE TABLE `shop_predeposit_log` (
  `pdlog_id` int(11) NOT NULL auto_increment COMMENT '自增编号',
  `pdlog_memberid` int(11) NOT NULL COMMENT '会员编号',
  `pdlog_membername` varchar(50) NOT NULL COMMENT '会员名称',
  `pdlog_adminid` int(11) default NULL COMMENT '管理员编号',
  `pdlog_adminname` varchar(50) default NULL COMMENT '管理员名称',
  `pdlog_stage` enum('system','recharge','cash','order','admin') NOT NULL COMMENT '日志类型 枚举 system 系统自动 recharge 充值 cash 提现 order 订单 admin 管理员手动修改',
  `pdlog_type` tinyint(1) NOT NULL default '0' COMMENT '日志类型 0表示可用金额 1表示冻结金额',
  `pdlog_price` decimal(10,2) NOT NULL default '0.00' COMMENT '金额',
  `pdlog_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pdlog_desc` varchar(1000) default NULL COMMENT '描述',
  PRIMARY KEY  (`pdlog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_predeposit_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_predeposit_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `shop_predeposit_recharge`;
CREATE TABLE `shop_predeposit_recharge` (
  `pdr_id` int(11) NOT NULL auto_increment COMMENT '自增编号',
  `pdr_sn` varchar(100) NOT NULL COMMENT '记录唯一标示',
  `pdr_memberid` int(11) NOT NULL COMMENT '会员编号',
  `pdr_membername` varchar(50) NOT NULL COMMENT '会员名称',
  `pdr_price` decimal(10,2) NOT NULL default '0.00' COMMENT '充值金额',
  `pdr_payment` varchar(50) default NULL COMMENT '支付方式',
  `pdr_onlinecode` varchar(100) default NULL COMMENT '线上支付的交易流水号',
  `pdr_remittancename` varchar(100) default NULL COMMENT '汇款人姓名',
  `pdr_remittancebank` varchar(100) default NULL COMMENT '汇款银行',
  `pdr_remittancedate` int(11) default NULL COMMENT '汇款日期',
  `pdr_memberremark` varchar(1000) default NULL COMMENT '会员备注',
  `pdr_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pdr_state` tinyint(1) NOT NULL default '0' COMMENT '充值状态 0 表示申请中 1表示完成 2表示关闭',
  `pdr_paystate` tinyint(1) NOT NULL default '0' COMMENT '支付状态 0表示未支付 1表示支付',
  `pdr_adminid` int(11) default NULL COMMENT '管理员编号',
  `pdr_adminname` varchar(100) default NULL COMMENT '管理员名称',
  `pdr_adminremark` varchar(1000) default NULL COMMENT '管理员备注',
  PRIMARY KEY  (`pdr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_predeposit_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_recommend`
-- ----------------------------
DROP TABLE IF EXISTS `shop_recommend`;
CREATE TABLE `shop_recommend` (
  `recommend_id` int(11) unsigned NOT NULL auto_increment COMMENT '索引ID',
  `recommend_name` varchar(50) default NULL COMMENT '名称',
  `recommend_code` varchar(255) NOT NULL COMMENT '推荐标识码',
  `recommend_desc` varchar(255) NOT NULL COMMENT '推荐描述',
  `recommend_config` varchar(255) default NULL COMMENT '配置信息',
  PRIMARY KEY  (`recommend_id`),
  UNIQUE KEY `recommend_code` (`recommend_code`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_recommend
-- ----------------------------
INSERT INTO shop_recommend VALUES ('1', '特别推荐', 'best_item', '这里面的商品将在首页的特别推荐区域显示', null);
INSERT INTO shop_recommend VALUES ('2', '男女服饰', 'clothing_item', '这里面的商品将在首页的男女服饰区域显示', null);
INSERT INTO shop_recommend VALUES ('3', '鞋包配饰', 'ornament_item', '这里面的商品将在首页的鞋包配饰区域显示', null);
INSERT INTO shop_recommend VALUES ('4', '美容美妆', 'cosmetic_item', '这里面的商品将在首页的美容美妆区域显示', null);
INSERT INTO shop_recommend VALUES ('5', '运动户外', 'sports_item', '这里面的商品将在首页的运动户外区域显示', null);
INSERT INTO shop_recommend VALUES ('6', '数码家电', 'electron_item', '这里面的商品将在首页的数码家电区域显示', null);
INSERT INTO shop_recommend VALUES ('7', '家居家装', 'furniture_item', '这里面的商品将在首页的家居家装区域显示', null);
INSERT INTO shop_recommend VALUES ('8', '食品保健', 'food_item', '这里面的商品将在首页的食品保健区域显示', null);
INSERT INTO shop_recommend VALUES ('9', '母婴用品', 'gravida_item', '这里面的商品将在首页的母婴用品区域显示', null);

-- ----------------------------
-- Table structure for `shop_recommend_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_recommend_goods`;
CREATE TABLE `shop_recommend_goods` (
  `recommend_id` int(11) unsigned NOT NULL default '0' COMMENT '推荐ID',
  `goods_id` int(11) unsigned NOT NULL default '0' COMMENT '商品ID',
  `sort` tinyint(1) unsigned NOT NULL default '255' COMMENT '排序',
  PRIMARY KEY  (`recommend_id`,`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_recommend_goods
-- ----------------------------
INSERT INTO shop_recommend_goods VALUES ('2', '2', '255');
INSERT INTO shop_recommend_goods VALUES ('6', '11', '10');
INSERT INTO shop_recommend_goods VALUES ('8', '23', '9');
INSERT INTO shop_recommend_goods VALUES ('4', '44', '3');
INSERT INTO shop_recommend_goods VALUES ('9', '45', '1');
INSERT INTO shop_recommend_goods VALUES ('9', '57', '7');
INSERT INTO shop_recommend_goods VALUES ('9', '56', '2');
INSERT INTO shop_recommend_goods VALUES ('9', '54', '9');
INSERT INTO shop_recommend_goods VALUES ('9', '53', '5');
INSERT INTO shop_recommend_goods VALUES ('5', '70', '255');
INSERT INTO shop_recommend_goods VALUES ('5', '66', '255');
INSERT INTO shop_recommend_goods VALUES ('5', '64', '255');
INSERT INTO shop_recommend_goods VALUES ('5', '63', '255');
INSERT INTO shop_recommend_goods VALUES ('5', '62', '255');
INSERT INTO shop_recommend_goods VALUES ('5', '61', '255');
INSERT INTO shop_recommend_goods VALUES ('5', '60', '255');
INSERT INTO shop_recommend_goods VALUES ('5', '58', '255');
INSERT INTO shop_recommend_goods VALUES ('5', '55', '255');
INSERT INTO shop_recommend_goods VALUES ('5', '52', '255');
INSERT INTO shop_recommend_goods VALUES ('8', '71', '8');
INSERT INTO shop_recommend_goods VALUES ('8', '69', '4');
INSERT INTO shop_recommend_goods VALUES ('8', '68', '7');
INSERT INTO shop_recommend_goods VALUES ('4', '43', '8');
INSERT INTO shop_recommend_goods VALUES ('4', '42', '4');
INSERT INTO shop_recommend_goods VALUES ('4', '49', '5');
INSERT INTO shop_recommend_goods VALUES ('4', '47', '7');
INSERT INTO shop_recommend_goods VALUES ('9', '51', '10');
INSERT INTO shop_recommend_goods VALUES ('9', '50', '3');
INSERT INTO shop_recommend_goods VALUES ('9', '48', '8');
INSERT INTO shop_recommend_goods VALUES ('9', '46', '4');
INSERT INTO shop_recommend_goods VALUES ('4', '39', '9');
INSERT INTO shop_recommend_goods VALUES ('4', '38', '6');
INSERT INTO shop_recommend_goods VALUES ('4', '37', '10');
INSERT INTO shop_recommend_goods VALUES ('4', '41', '1');
INSERT INTO shop_recommend_goods VALUES ('4', '40', '2');
INSERT INTO shop_recommend_goods VALUES ('8', '33', '5');
INSERT INTO shop_recommend_goods VALUES ('8', '30', '1');
INSERT INTO shop_recommend_goods VALUES ('8', '29', '6');
INSERT INTO shop_recommend_goods VALUES ('8', '26', '10');
INSERT INTO shop_recommend_goods VALUES ('3', '31', '255');
INSERT INTO shop_recommend_goods VALUES ('3', '32', '255');
INSERT INTO shop_recommend_goods VALUES ('3', '34', '255');
INSERT INTO shop_recommend_goods VALUES ('3', '35', '255');
INSERT INTO shop_recommend_goods VALUES ('3', '36', '255');
INSERT INTO shop_recommend_goods VALUES ('2', '25', '255');
INSERT INTO shop_recommend_goods VALUES ('2', '27', '255');
INSERT INTO shop_recommend_goods VALUES ('2', '28', '255');
INSERT INTO shop_recommend_goods VALUES ('2', '19', '255');
INSERT INTO shop_recommend_goods VALUES ('2', '21', '255');
INSERT INTO shop_recommend_goods VALUES ('2', '22', '255');
INSERT INTO shop_recommend_goods VALUES ('2', '24', '255');
INSERT INTO shop_recommend_goods VALUES ('7', '13', '2');
INSERT INTO shop_recommend_goods VALUES ('7', '14', '4');
INSERT INTO shop_recommend_goods VALUES ('7', '15', '8');
INSERT INTO shop_recommend_goods VALUES ('7', '17', '1');
INSERT INTO shop_recommend_goods VALUES ('7', '18', '5');
INSERT INTO shop_recommend_goods VALUES ('9', '59', '6');
INSERT INTO shop_recommend_goods VALUES ('2', '12', '255');
INSERT INTO shop_recommend_goods VALUES ('2', '16', '255');
INSERT INTO shop_recommend_goods VALUES ('6', '1', '1');
INSERT INTO shop_recommend_goods VALUES ('6', '3', '4');
INSERT INTO shop_recommend_goods VALUES ('6', '4', '2');
INSERT INTO shop_recommend_goods VALUES ('6', '5', '9');
INSERT INTO shop_recommend_goods VALUES ('6', '6', '6');
INSERT INTO shop_recommend_goods VALUES ('6', '7', '7');
INSERT INTO shop_recommend_goods VALUES ('6', '8', '3');
INSERT INTO shop_recommend_goods VALUES ('6', '10', '8');
INSERT INTO shop_recommend_goods VALUES ('6', '9', '5');
INSERT INTO shop_recommend_goods VALUES ('8', '67', '2');
INSERT INTO shop_recommend_goods VALUES ('8', '65', '3');
INSERT INTO shop_recommend_goods VALUES ('7', '77', '10');
INSERT INTO shop_recommend_goods VALUES ('7', '76', '3');
INSERT INTO shop_recommend_goods VALUES ('7', '75', '9');
INSERT INTO shop_recommend_goods VALUES ('7', '74', '6');
INSERT INTO shop_recommend_goods VALUES ('7', '73', '7');
INSERT INTO shop_recommend_goods VALUES ('1', '49', '255');
INSERT INTO shop_recommend_goods VALUES ('1', '47', '255');
INSERT INTO shop_recommend_goods VALUES ('1', '44', '255');
INSERT INTO shop_recommend_goods VALUES ('1', '43', '255');
INSERT INTO shop_recommend_goods VALUES ('3', '80', '255');
INSERT INTO shop_recommend_goods VALUES ('3', '79', '255');
INSERT INTO shop_recommend_goods VALUES ('3', '78', '255');
INSERT INTO shop_recommend_goods VALUES ('3', '82', '255');
INSERT INTO shop_recommend_goods VALUES ('3', '81', '255');

-- ----------------------------
-- Table structure for `shop_refund_log`
-- ----------------------------
DROP TABLE IF EXISTS `shop_refund_log`;
CREATE TABLE `shop_refund_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment COMMENT '退款记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `refund_sn` varchar(100) NOT NULL COMMENT '退款编号',
  `order_sn` varchar(100) NOT NULL COMMENT '订单编号',
  `seller_id` int(10) unsigned NOT NULL COMMENT '卖家ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `order_amount` decimal(10,2) NOT NULL COMMENT '订单金额',
  `order_refund` decimal(10,2) NOT NULL COMMENT '退款金额',
  `refund_paymentname` varchar(50) NOT NULL COMMENT '支付方式名称',
  `refund_paymentcode` varchar(50) NOT NULL COMMENT '支付方式代码',
  `refund_message` varchar(300) default NULL COMMENT '退款备注',
  PRIMARY KEY  (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_refund_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_return`
-- ----------------------------
DROP TABLE IF EXISTS `shop_return`;
CREATE TABLE `shop_return` (
  `return_id` int(10) unsigned NOT NULL auto_increment COMMENT '退货记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `return_sn` varchar(100) NOT NULL COMMENT '退货编号',
  `order_sn` varchar(100) NOT NULL COMMENT '订单编号',
  `seller_id` int(10) unsigned NOT NULL COMMENT '卖家ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `return_goodsnum` int(10) unsigned NOT NULL COMMENT '退货数量',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `return_message` varchar(300) default NULL COMMENT '退货备注',
  PRIMARY KEY  (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_return
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_return_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_return_goods`;
CREATE TABLE `shop_return_goods` (
  `log_id` int(10) unsigned NOT NULL auto_increment COMMENT '退货商品记录ID',
  `return_id` int(10) unsigned NOT NULL COMMENT '退货记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `spec_id` int(10) unsigned NOT NULL COMMENT '规格ID',
  `spec_info` varchar(50) default NULL COMMENT '规格描述',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` int(10) unsigned NOT NULL COMMENT '商品数量',
  `goods_returnnum` int(10) unsigned NOT NULL COMMENT '退货数量',
  `goods_image` varchar(100) default NULL COMMENT '商品图片',
  PRIMARY KEY  (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_return_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_session`
-- ----------------------------
DROP TABLE IF EXISTS `shop_session`;
CREATE TABLE `shop_session` (
  `session_id` varchar(50) NOT NULL COMMENT 'session_id',
  `update_time` int(10) unsigned default NULL COMMENT '更新时间',
  `last_time` int(10) unsigned default NULL COMMENT '结束时间',
  `ip1` tinyint(3) unsigned NOT NULL default '1' COMMENT 'IP段一',
  `ip2` tinyint(3) unsigned NOT NULL default '1' COMMENT 'IP段二',
  `ip3` tinyint(3) unsigned NOT NULL default '1' COMMENT 'IP段三',
  `ip4` tinyint(3) unsigned NOT NULL default '1' COMMENT 'IP段四',
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_session
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_setting`
-- ----------------------------
DROP TABLE IF EXISTS `shop_setting`;
CREATE TABLE `shop_setting` (
  `name` varchar(50) NOT NULL COMMENT '名称',
  `value` text COMMENT '值',
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_setting
-- ----------------------------
INSERT INTO shop_setting VALUES ('time_zone', '8');
INSERT INTO shop_setting VALUES ('time_format_simple', '');
INSERT INTO shop_setting VALUES ('time_format_complete', '');
INSERT INTO shop_setting VALUES ('default_goods_image', 'default_goods_image.gif');
INSERT INTO shop_setting VALUES ('default_store_logo', 'default_store_logo.gif');
INSERT INTO shop_setting VALUES ('default_user_portrait', 'default_user_portrait.gif');
INSERT INTO shop_setting VALUES ('statistics_code', '');
INSERT INTO shop_setting VALUES ('guest_comment', '1');
INSERT INTO shop_setting VALUES ('rewrite_enabled', '0');
INSERT INTO shop_setting VALUES ('site_keywords', 'ShopNC');
INSERT INTO shop_setting VALUES ('site_logo', 'logo.gif');
INSERT INTO shop_setting VALUES ('site_description', 'ShopNC商城系统');
INSERT INTO shop_setting VALUES ('site_name', '中国百分百购物商城');
INSERT INTO shop_setting VALUES ('site_title', '中国百分百购物商城');
INSERT INTO shop_setting VALUES ('icp_number', '');
INSERT INTO shop_setting VALUES ('image_dir_type', '1');
INSERT INTO shop_setting VALUES ('gold_isuse', '0');
INSERT INTO shop_setting VALUES ('gold_rmbratio', '10');
INSERT INTO shop_setting VALUES ('ztc_isuse', '0');
INSERT INTO shop_setting VALUES ('ztc_dayprod', '1');
INSERT INTO shop_setting VALUES ('qq_isuse', '0');
INSERT INTO shop_setting VALUES ('qq_appid', '');
INSERT INTO shop_setting VALUES ('qq_appkey', '');
INSERT INTO shop_setting VALUES ('qq_appcode', null);
INSERT INTO shop_setting VALUES ('sina_isuse', '0');
INSERT INTO shop_setting VALUES ('sina_wb_akey', '');
INSERT INTO shop_setting VALUES ('sina_wb_skey', '');
INSERT INTO shop_setting VALUES ('points_isuse', '0');
INSERT INTO shop_setting VALUES ('points_reg', '0');
INSERT INTO shop_setting VALUES ('points_login', '0');
INSERT INTO shop_setting VALUES ('points_comments', '0');
INSERT INTO shop_setting VALUES ('points_orderrate', '0');
INSERT INTO shop_setting VALUES ('points_ordermax', '0');
INSERT INTO shop_setting VALUES ('pointprod_isuse', '0');
INSERT INTO shop_setting VALUES ('voucher_allow', '0');
INSERT INTO shop_setting VALUES ('predeposit_isuse', '0');
INSERT INTO shop_setting VALUES ('complain_time_limit', '2592000');
INSERT INTO shop_setting VALUES ('creditrule', 'a:3:{s:5:\"heart\";a:5:{i:1;a:2:{i:0;s:1:\"1\";i:1;s:3:\"100\";}i:2;a:2:{i:0;s:3:\"101\";i:1;s:3:\"200\";}i:3;a:2:{i:0;s:3:\"201\";i:1;s:3:\"300\";}i:4;a:2:{i:0;s:3:\"301\";i:1;s:3:\"400\";}i:5;a:2:{i:0;s:3:\"401\";i:1;s:3:\"500\";}}s:7:\"diamond\";a:5:{i:1;a:2:{i:0;s:3:\"501\";i:1;s:3:\"600\";}i:2;a:2:{i:0;s:3:\"601\";i:1;s:3:\"700\";}i:3;a:2:{i:0;s:3:\"701\";i:1;s:3:\"800\";}i:4;a:2:{i:0;s:3:\"801\";i:1;s:3:\"900\";}i:5;a:2:{i:0;s:3:\"901\";i:1;s:4:\"1000\";}}s:5:\"crown\";a:5:{i:1;a:2:{i:0;s:4:\"1001\";i:1;s:4:\"1100\";}i:2;a:2:{i:0;s:4:\"1101\";i:1;s:4:\"1200\";}i:3;a:2:{i:0;s:4:\"1201\";i:1;s:4:\"1300\";}i:4;a:2:{i:0;s:4:\"1301\";i:1;s:4:\"1400\";}i:5;a:2:{i:0;s:4:\"1401\";i:1;s:4:\"1500\";}}}');
INSERT INTO shop_setting VALUES ('site_status', '1');
INSERT INTO shop_setting VALUES ('closed_reason', '升级中……');
INSERT INTO shop_setting VALUES ('hot_search', '李宁,耐克,Kappa,双肩包,手提包');
INSERT INTO shop_setting VALUES ('email_type', '1');
INSERT INTO shop_setting VALUES ('email_host', '');
INSERT INTO shop_setting VALUES ('email_port', '25');
INSERT INTO shop_setting VALUES ('email_addr', '');
INSERT INTO shop_setting VALUES ('email_id', '');
INSERT INTO shop_setting VALUES ('email_pass', '');
INSERT INTO shop_setting VALUES ('captcha_status_login', '1');
INSERT INTO shop_setting VALUES ('captcha_status_register', '1');
INSERT INTO shop_setting VALUES ('captcha_status_goodsqa', '1');
INSERT INTO shop_setting VALUES ('captcha_status_backend', '');
INSERT INTO shop_setting VALUES ('store_allow', '1');
INSERT INTO shop_setting VALUES ('enabled_subdomain', '0');
INSERT INTO shop_setting VALUES ('subdomain_suffix', null);
INSERT INTO shop_setting VALUES ('subdomain_reserved', 'www');
INSERT INTO shop_setting VALUES ('subdomain_length', '3-12');
INSERT INTO shop_setting VALUES ('subdomain_edit', '1');
INSERT INTO shop_setting VALUES ('subdomain_times', '3');
INSERT INTO shop_setting VALUES ('tpl_type', 'nc');
INSERT INTO shop_setting VALUES ('session_expire', '1440');
INSERT INTO shop_setting VALUES ('md5_key', '8468bdd8587ba6198404cae20ce544ae');
INSERT INTO shop_setting VALUES ('email_enabled', '0');
INSERT INTO shop_setting VALUES ('ucenter_status', '0');
INSERT INTO shop_setting VALUES ('ucenter_app_id', '');
INSERT INTO shop_setting VALUES ('ucenter_app_key', '');
INSERT INTO shop_setting VALUES ('ucenter_ip', '');
INSERT INTO shop_setting VALUES ('ucenter_connect_type', '0');
INSERT INTO shop_setting VALUES ('ucenter_mysql_server', '');
INSERT INTO shop_setting VALUES ('ucenter_mysql_username', '');
INSERT INTO shop_setting VALUES ('ucenter_mysql_passwd', '');
INSERT INTO shop_setting VALUES ('ucenter_mysql_name', '');
INSERT INTO shop_setting VALUES ('ucenter_mysql_pre', '');
INSERT INTO shop_setting VALUES ('ucenter_url', '');
INSERT INTO shop_setting VALUES ('ucenter_type', 'discuz');
INSERT INTO shop_setting VALUES ('debug_isuse', '0');
INSERT INTO shop_setting VALUES ('groupbuy_allow', '1');
INSERT INTO shop_setting VALUES ('image_max_filesize', '1024');
INSERT INTO shop_setting VALUES ('image_allow_ext', 'gif,jpg,jpeg,bmp,png,swf,tbi');
INSERT INTO shop_setting VALUES ('thumb_small_width', '160');
INSERT INTO shop_setting VALUES ('thumb_small_height', '160');
INSERT INTO shop_setting VALUES ('thumb_mid_width', '300');
INSERT INTO shop_setting VALUES ('thumb_mid_height', '300');
INSERT INTO shop_setting VALUES ('thumb_max_width', '1024');
INSERT INTO shop_setting VALUES ('thumb_max_height', '1024');
INSERT INTO shop_setting VALUES ('memcache_enable', '0');
INSERT INTO shop_setting VALUES ('memcache_server', '127.0.0.1');
INSERT INTO shop_setting VALUES ('memcache_port', '11211');
INSERT INTO shop_setting VALUES ('memcache_pconnect', '0');
INSERT INTO shop_setting VALUES ('memcache_prefix', null);

-- ----------------------------
-- Table structure for `shop_share_link`
-- ----------------------------
DROP TABLE IF EXISTS `shop_share_link`;
CREATE TABLE `shop_share_link` (
  `sl_id` int(11) unsigned NOT NULL auto_increment COMMENT '索引ID',
  `sl_name` varchar(50) default NULL COMMENT '分享名称',
  `sl_pic` varchar(100) default NULL COMMENT '图片标识',
  `sl_interface` varchar(100) default NULL COMMENT '接口地址',
  `sl_type` tinyint(1) NOT NULL default '0' COMMENT '类别，0为分享，1为收藏，默认为0',
  `sl_sort` tinyint(1) unsigned NOT NULL default '255' COMMENT '排序',
  PRIMARY KEY  (`sl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_share_link
-- ----------------------------
INSERT INTO shop_share_link VALUES ('1', '人人网', 'renren.gif', 'http://share.renren.com/share/buttonshare.do?link={$link}&title={$title}', '0', '255');
INSERT INTO shop_share_link VALUES ('2', '开心网', 'kaixin001.gif', 'http://www.kaixin001.com/repaste/share.php?rtitle={$title}&rurl={$link}', '0', '255');
INSERT INTO shop_share_link VALUES ('3', '百度收藏', 'baidushoucang.gif', 'http://cang.baidu.com/do/add?it={$title}&iu={$link}&fr=ien#nw=1', '1', '255');
INSERT INTO shop_share_link VALUES ('4', 'qq书签', 'qqshuqian.gif', 'http://shuqian.qq.com/post?from=3&title={$title}&uri={$link}&jumpback=2&noui=1', '1', '255');
INSERT INTO shop_share_link VALUES ('5', '腾讯微博', 'qqshare.png', 'http://v.t.qq.com/share/share.php?title={$title}&url={$link}', '0', '205');
INSERT INTO shop_share_link VALUES ('6', '新浪微博', 'sina.png', 'http://v.t.sina.com.cn/share/share.php?title={$title}&url={$link}', '0', '255');

-- ----------------------------
-- Table structure for `shop_shipping`
-- ----------------------------
DROP TABLE IF EXISTS `shop_shipping`;
CREATE TABLE `shop_shipping` (
  `shipping_id` int(11) NOT NULL auto_increment COMMENT '店铺配送索引id',
  `shipping_name` varchar(50) NOT NULL COMMENT '配送方式名称',
  `shipping_info` varchar(255) default NULL COMMENT '配送方式简介',
  `shipping_icf_weight` mediumint(8) NOT NULL COMMENT '同城首重',
  `shipping_icf_fee` decimal(10,2) NOT NULL COMMENT '同城首重运费',
  `shipping_icf_add_weight` mediumint(8) NOT NULL COMMENT '同城增重',
  `shipping_icf_add_fee` decimal(10,2) NOT NULL COMMENT '同城增重运费',
  `shipping_ocf_weight` mediumint(8) default '0' COMMENT '异地首重',
  `shipping_ocf_fee` decimal(10,2) default '0.00' COMMENT '异地首重运费',
  `shipping_ocf_add_weight` mediumint(8) default '0' COMMENT '异地增重',
  `shipping_ocf_add_fee` decimal(10,2) default '0.00' COMMENT '异地增重运费',
  `shipping_fee` decimal(10,2) NOT NULL default '0.00' COMMENT '首重运费',
  `shipping_fee1` int(11) default NULL COMMENT '附加邮费',
  `shipping_state` tinyint(1) NOT NULL COMMENT '配送方式状态 1启用，2关闭',
  `shipping_sort` int(11) default '0' COMMENT '配送方式排序',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `shipping_area` text COMMENT '货到付款地区',
  PRIMARY KEY  (`shipping_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_shipping
-- ----------------------------
INSERT INTO shop_shipping VALUES ('4', '快递配送', '', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '5.00', '1', '1', '0', '2', 'a:1:{i:1;s:6:\"中国\";}');

-- ----------------------------
-- Table structure for `shop_spec`
-- ----------------------------
DROP TABLE IF EXISTS `shop_spec`;
CREATE TABLE `shop_spec` (
  `sp_id` int(10) unsigned NOT NULL auto_increment COMMENT '规格id',
  `sp_name` varchar(100) NOT NULL COMMENT '规格名称',
  `sp_format` enum('text','image') NOT NULL COMMENT '显示类型',
  `sp_value` text NOT NULL COMMENT '规格值列',
  `sp_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY  (`sp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_spec
-- ----------------------------
INSERT INTO shop_spec VALUES ('1', '颜色', 'image', '白色,黑色,紫色,红色,绿色,花色,蓝色,褐色,黄色,粉色,桔色,透明', '1');
INSERT INTO shop_spec VALUES ('2', '尺码', 'text', 'XXS,XS,S,M,L,XL,XXL,XXXL,加大XXXL,均码', '2');
INSERT INTO shop_spec VALUES ('3', '鞋码', 'text', '35,45,44,43,42,41,40,39,38,37,36,46', '0');

-- ----------------------------
-- Table structure for `shop_spec_value`
-- ----------------------------
DROP TABLE IF EXISTS `shop_spec_value`;
CREATE TABLE `shop_spec_value` (
  `sp_value_id` int(10) unsigned NOT NULL auto_increment COMMENT '规格值id',
  `sp_value_name` varchar(100) NOT NULL COMMENT '规格值名称',
  `sp_id` int(10) unsigned NOT NULL COMMENT '所属规格id',
  `sp_value_image` varchar(100) default NULL COMMENT '规格图片',
  `sp_value_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY  (`sp_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_spec_value
-- ----------------------------
INSERT INTO shop_spec_value VALUES ('1', '白色', '1', 'c53bca14dc85bb3af17d8fe91b34e4b2.png_small.png', '0');
INSERT INTO shop_spec_value VALUES ('2', '黑色', '1', 'ec769a6ddb0704a805bfe5f4b917dbfc.png_small.png', '1');
INSERT INTO shop_spec_value VALUES ('3', '紫色', '1', '7e79c94b506b4f26064c5ad9cf415d6a.png_small.png', '2');
INSERT INTO shop_spec_value VALUES ('4', '红色', '1', '36dffaac297ed95204d5a5e7ffc9cfc0.png_small.png', '3');
INSERT INTO shop_spec_value VALUES ('5', '绿色', '1', 'cd0a502349ba45ff6e57a9c56faead64.png_small.png', '4');
INSERT INTO shop_spec_value VALUES ('6', '花色', '1', '51e66b9e43213cc8eddf6038477dc0ea.png_small.png', '5');
INSERT INTO shop_spec_value VALUES ('7', '蓝色', '1', '17cac2d3e7c5f7a3d258912287c86cf5.png_small.png', '6');
INSERT INTO shop_spec_value VALUES ('8', '褐色', '1', 'dd12d18ad6d68331149083265ee225f9.png_small.png', '7');
INSERT INTO shop_spec_value VALUES ('9', '黄色', '1', '9984776d635bd493b9b83a59712283e2.png_small.png', '8');
INSERT INTO shop_spec_value VALUES ('10', '粉色', '1', '27f09f244c0aea8157d81e9f59e3a2ed.png_small.png', '9');
INSERT INTO shop_spec_value VALUES ('11', '桔色', '1', 'b700b535d2995468263e92541e2f74c9.png_small.png', '10');
INSERT INTO shop_spec_value VALUES ('12', '透明', '1', '81416e9137b049dc494fbc21e18aac58.png_small.png', '11');
INSERT INTO shop_spec_value VALUES ('13', 'XXS', '2', '', '1');
INSERT INTO shop_spec_value VALUES ('14', 'XS', '2', '', '2');
INSERT INTO shop_spec_value VALUES ('15', 'S', '2', '', '3');
INSERT INTO shop_spec_value VALUES ('16', 'M', '2', '', '4');
INSERT INTO shop_spec_value VALUES ('17', 'L', '2', '', '5');
INSERT INTO shop_spec_value VALUES ('18', 'XL', '2', '', '6');
INSERT INTO shop_spec_value VALUES ('19', 'XXL', '2', '', '7');
INSERT INTO shop_spec_value VALUES ('20', 'XXXL', '2', '', '8');
INSERT INTO shop_spec_value VALUES ('21', '加大XXXL', '2', '', '9');
INSERT INTO shop_spec_value VALUES ('22', '均码', '2', '', '10');
INSERT INTO shop_spec_value VALUES ('23', '35', '3', '', '1');
INSERT INTO shop_spec_value VALUES ('24', '36', '3', '', '2');
INSERT INTO shop_spec_value VALUES ('25', '37', '3', '', '3');
INSERT INTO shop_spec_value VALUES ('26', '38', '3', '', '4');
INSERT INTO shop_spec_value VALUES ('27', '39', '3', '', '5');
INSERT INTO shop_spec_value VALUES ('28', '40', '3', '', '6');
INSERT INTO shop_spec_value VALUES ('29', '41', '3', '', '7');
INSERT INTO shop_spec_value VALUES ('30', '42', '3', '', '8');
INSERT INTO shop_spec_value VALUES ('31', '43', '3', '', '9');
INSERT INTO shop_spec_value VALUES ('32', '44', '3', '', '10');
INSERT INTO shop_spec_value VALUES ('33', '45', '3', '', '11');
INSERT INTO shop_spec_value VALUES ('34', '46', '3', '', '12');

-- ----------------------------
-- Table structure for `shop_store`
-- ----------------------------
DROP TABLE IF EXISTS `shop_store`;
CREATE TABLE `shop_store` (
  `store_id` int(11) NOT NULL auto_increment COMMENT '店铺索引id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `store_owner` varchar(50) NOT NULL COMMENT '店主真实姓名',
  `store_auth` tinyint(1) default '0' COMMENT '店铺认证',
  `name_auth` tinyint(1) default '0' COMMENT '店主认证',
  `grade_id` int(11) NOT NULL COMMENT '店铺等级',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `store_owner_card` varchar(50) NOT NULL COMMENT '身份证',
  `sc_id` int(11) NOT NULL COMMENT '店铺分类',
  `area_id` int(11) NOT NULL COMMENT '地区id',
  `area_info` varchar(100) NOT NULL COMMENT '地区内容，冗余数据',
  `store_address` varchar(100) NOT NULL COMMENT '详细地区',
  `store_zip` varchar(10) NOT NULL COMMENT '邮政编码',
  `store_tel` varchar(50) NOT NULL COMMENT '电话号码',
  `store_image` varchar(100) default NULL COMMENT '证件上传',
  `store_image1` varchar(100) default NULL COMMENT '执照上传',
  `store_state` tinyint(1) NOT NULL default '0' COMMENT '店铺状态',
  `store_close_info` varchar(255) default NULL COMMENT '店铺关闭原因',
  `store_sort` int(11) NOT NULL default '0' COMMENT '店铺排序',
  `store_time` varchar(10) NOT NULL COMMENT '店铺时间',
  `store_end_time` varchar(10) default NULL COMMENT '店铺关闭时间',
  `store_banner` varchar(255) default NULL COMMENT '店铺横幅',
  `store_logo` varchar(255) default NULL COMMENT '店标',
  `store_keywords` varchar(255) NOT NULL default '' COMMENT '店铺seo关键字',
  `store_description` varchar(255) NOT NULL default '' COMMENT '店铺seo描述',
  `store_qq` varchar(50) default NULL COMMENT 'QQ',
  `store_ww` varchar(50) default NULL COMMENT '阿里旺旺',
  `store_msn` varchar(50) default NULL COMMENT 'MSN',
  `description` text COMMENT '店铺简介',
  `store_domain` varchar(50) default NULL COMMENT '店铺二级域名',
  `store_domain_times` tinyint(1) unsigned default '0' COMMENT '二级域名修改次数',
  `store_recommend` tinyint(1) NOT NULL default '0' COMMENT '推荐，0为否，1为是，默认为0',
  `store_audit` tinyint(1) NOT NULL default '0' COMMENT '店铺审核，0为未通过，1为通过，默认为0',
  `store_theme` varchar(50) NOT NULL default 'default' COMMENT '店铺当前主题',
  `store_credit` int(10) NOT NULL default '0' COMMENT '店铺信用',
  `praise_rate` int(3) NOT NULL default '0' COMMENT '店铺好评率',
  `store_cs_name` varchar(100) default NULL COMMENT '客服用户名',
  `store_cs_password` varchar(100) default NULL COMMENT '客服密码',
  `store_cs_key` varchar(49) default NULL COMMENT '客服密钥',
  `store_cs_is_open` tinyint(1) NOT NULL default '0' COMMENT '客服开启状态:0未开启(默认)1开启2申请中',
  PRIMARY KEY  (`store_id`),
  KEY `store_name` (`store_name`),
  KEY `sc_id` (`sc_id`),
  KEY `area_id` (`area_id`),
  KEY `store_state` (`store_state`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_store
-- ----------------------------
INSERT INTO shop_store VALUES ('2', '极限运动基地', '网城创想', '0', '0', '1', '5', 'shopnc', '123456712345674567', '4', '58', '天津	天津市	南开区', '南开区红旗路220号 慧谷大厦 0719', '300000', '120110119', '0ef467587f86d20a0ebc3e7fb8c6842b.jpg', 'f840d85d8bbde9aeb36201cf6e10fbe5.jpg', '1', '', '0', '1291617125', '', '320c968c0c2e259e8cdb1803c0747dc0_small.jpg', 'ee80a695649011f2cab7264a834dec7f_small.jpg', '', '', '1234567', '', '', '', '', '0', '1', '1', 'default', '2', '0', null, null, null, '0');

-- ----------------------------
-- Table structure for `shop_store_class`
-- ----------------------------
DROP TABLE IF EXISTS `shop_store_class`;
CREATE TABLE `shop_store_class` (
  `sc_id` int(10) unsigned NOT NULL auto_increment COMMENT '索引ID',
  `sc_name` varchar(100) NOT NULL COMMENT '分类名称',
  `sc_parent_id` int(10) unsigned NOT NULL default '0' COMMENT '父ID',
  `sc_sort` tinyint(1) unsigned NOT NULL default '0' COMMENT '排序',
  PRIMARY KEY  (`sc_id`),
  KEY `sc_parent_id` (`sc_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_store_class
-- ----------------------------
INSERT INTO shop_store_class VALUES ('4', '服装鞋包', '0', '1');
INSERT INTO shop_store_class VALUES ('13', '女装', '4', '2');
INSERT INTO shop_store_class VALUES ('14', '男装', '4', '2');
INSERT INTO shop_store_class VALUES ('15', '女鞋', '4', '3');
INSERT INTO shop_store_class VALUES ('16', '运动鞋', '4', '4');
INSERT INTO shop_store_class VALUES ('17', '男鞋/皮鞋/休闲鞋', '4', '5');
INSERT INTO shop_store_class VALUES ('18', '运动服/运动包/颈环配件', '4', '6');
INSERT INTO shop_store_class VALUES ('1', '珠宝/首饰', '0', '8');
INSERT INTO shop_store_class VALUES ('5', '3C数码', '0', '2');
INSERT INTO shop_store_class VALUES ('6', '美容护理', '0', '3');
INSERT INTO shop_store_class VALUES ('7', '家居用品', '0', '4');
INSERT INTO shop_store_class VALUES ('8', '食品/保健', '0', '5');
INSERT INTO shop_store_class VALUES ('9', '母婴用品', '0', '6');
INSERT INTO shop_store_class VALUES ('10', '文体/汽车', '0', '7');
INSERT INTO shop_store_class VALUES ('11', '收藏/爱好', '0', '9');
INSERT INTO shop_store_class VALUES ('12', '生活/服务', '0', '10');
INSERT INTO shop_store_class VALUES ('19', '电脑硬件/显示器/电脑周边', '5', '1');
INSERT INTO shop_store_class VALUES ('20', '手机', '5', '2');
INSERT INTO shop_store_class VALUES ('21', '笔记本电脑', '5', '3');
INSERT INTO shop_store_class VALUES ('22', '网络设备/路由器/网络相关', '5', '4');
INSERT INTO shop_store_class VALUES ('23', '数码相机/摄像机/摄影器材', '5', '5');
INSERT INTO shop_store_class VALUES ('24', 'mp3/mp4/iPod/录音笔', '5', '6');
INSERT INTO shop_store_class VALUES ('25', '电玩/配件/游戏/攻略', '5', '7');
INSERT INTO shop_store_class VALUES ('26', '影音电器', '5', '8');
INSERT INTO shop_store_class VALUES ('27', '厨房电器', '5', '9');
INSERT INTO shop_store_class VALUES ('28', '生活电器', '5', '10');
INSERT INTO shop_store_class VALUES ('29', '男士内衣/女士内衣/家居服', '4', '7');
INSERT INTO shop_store_class VALUES ('30', '箱包皮具/热销女包/男包', '4', '8');
INSERT INTO shop_store_class VALUES ('31', '服饰配件/皮带/帽子/围巾', '4', '9');
INSERT INTO shop_store_class VALUES ('32', '美容护肤/美体/精油', '6', '255');
INSERT INTO shop_store_class VALUES ('33', '彩妆/香水/美发工具', '6', '255');
INSERT INTO shop_store_class VALUES ('34', '国货精品/开架化妆品', '6', '255');
INSERT INTO shop_store_class VALUES ('35', '家居日用/收纳/礼品', '7', '255');
INSERT INTO shop_store_class VALUES ('36', '厨房/餐饮用具', '7', '255');
INSERT INTO shop_store_class VALUES ('37', '日化/清洁/护理', '7', '255');
INSERT INTO shop_store_class VALUES ('38', '床上用品/靠垫/毛巾/布艺', '7', '255');
INSERT INTO shop_store_class VALUES ('39', '零食/坚果/茶叶/地毯', '8', '1');
INSERT INTO shop_store_class VALUES ('40', '滋补/生鲜/速食/订餐', '8', '2');
INSERT INTO shop_store_class VALUES ('41', '保健食品', '8', '3');
INSERT INTO shop_store_class VALUES ('42', '奶粉/辅食/营养品', '9', '255');
INSERT INTO shop_store_class VALUES ('43', '尿片/洗护/喂哺用品', '9', '255');
INSERT INTO shop_store_class VALUES ('44', '益智玩具/早教/童车床/出行', '9', '255');
INSERT INTO shop_store_class VALUES ('45', '童装/童鞋/孕妇装', '9', '255');
INSERT INTO shop_store_class VALUES ('46', '运动/瑜伽/健身/球迷用品', '10', '1');
INSERT INTO shop_store_class VALUES ('47', '户外/登山/野营/旅行', '10', '2');
INSERT INTO shop_store_class VALUES ('48', '汽车/配件/改装/摩托/自行车', '10', '3');
INSERT INTO shop_store_class VALUES ('49', '书籍/杂志/报纸', '10', '4');
INSERT INTO shop_store_class VALUES ('50', '宠物/宠物食品及用品', '10', '5');
INSERT INTO shop_store_class VALUES ('51', '音乐/影视/音像', '10', '6');
INSERT INTO shop_store_class VALUES ('52', '乐器/吉他/钢琴/配件', '10', '7');
INSERT INTO shop_store_class VALUES ('53', '办公设备/文具/耗材', '10', '8');
INSERT INTO shop_store_class VALUES ('54', '珠宝/钻石/翡翠/黄金', '1', '1');
INSERT INTO shop_store_class VALUES ('55', '饰品流行/首饰/时尚饰品', '1', '2');
INSERT INTO shop_store_class VALUES ('56', '品牌手表/流行手表', '1', '3');
INSERT INTO shop_store_class VALUES ('57', '玩具/模型/娃娃/人偶', '11', '1');
INSERT INTO shop_store_class VALUES ('58', '古董/邮币/字画/收藏', '11', '2');
INSERT INTO shop_store_class VALUES ('59', 'ZIPPO/瑞士军刀/眼镜', '11', '3');
INSERT INTO shop_store_class VALUES ('60', '鲜花速递/蛋糕配送/园艺花艺', '12', '1');
INSERT INTO shop_store_class VALUES ('61', '演出/吃喝玩乐折扣券', '12', '2');
INSERT INTO shop_store_class VALUES ('62', '酒店客栈/景点门票/度假旅游', '12', '3');
INSERT INTO shop_store_class VALUES ('63', '网店/网络服务/个性定制/软件', '12', '4');
INSERT INTO shop_store_class VALUES ('64', '成人用品/避孕/计生用品', '12', '5');

-- ----------------------------
-- Table structure for `shop_store_class_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_store_class_goods`;
CREATE TABLE `shop_store_class_goods` (
  `stc_id` int(11) NOT NULL COMMENT '店铺商品分类id',
  `goods_id` int(11) NOT NULL COMMENT '商品id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_store_class_goods
-- ----------------------------
INSERT INTO shop_store_class_goods VALUES ('64', '82');
INSERT INTO shop_store_class_goods VALUES ('64', '81');
INSERT INTO shop_store_class_goods VALUES ('64', '80');
INSERT INTO shop_store_class_goods VALUES ('64', '79');
INSERT INTO shop_store_class_goods VALUES ('64', '78');
INSERT INTO shop_store_class_goods VALUES ('65', '11');
INSERT INTO shop_store_class_goods VALUES ('65', '10');
INSERT INTO shop_store_class_goods VALUES ('65', '9');
INSERT INTO shop_store_class_goods VALUES ('65', '8');
INSERT INTO shop_store_class_goods VALUES ('65', '7');
INSERT INTO shop_store_class_goods VALUES ('65', '6');
INSERT INTO shop_store_class_goods VALUES ('65', '5');
INSERT INTO shop_store_class_goods VALUES ('65', '4');
INSERT INTO shop_store_class_goods VALUES ('65', '3');
INSERT INTO shop_store_class_goods VALUES ('65', '1');
INSERT INTO shop_store_class_goods VALUES ('62', '70');
INSERT INTO shop_store_class_goods VALUES ('62', '66');
INSERT INTO shop_store_class_goods VALUES ('62', '64');
INSERT INTO shop_store_class_goods VALUES ('61', '63');
INSERT INTO shop_store_class_goods VALUES ('66', '77');
INSERT INTO shop_store_class_goods VALUES ('66', '76');
INSERT INTO shop_store_class_goods VALUES ('66', '75');
INSERT INTO shop_store_class_goods VALUES ('66', '74');
INSERT INTO shop_store_class_goods VALUES ('66', '73');
INSERT INTO shop_store_class_goods VALUES ('61', '62');
INSERT INTO shop_store_class_goods VALUES ('61', '61');
INSERT INTO shop_store_class_goods VALUES ('61', '60');
INSERT INTO shop_store_class_goods VALUES ('61', '58');
INSERT INTO shop_store_class_goods VALUES ('61', '55');
INSERT INTO shop_store_class_goods VALUES ('61', '52');
INSERT INTO shop_store_class_goods VALUES ('67', '59');
INSERT INTO shop_store_class_goods VALUES ('67', '57');
INSERT INTO shop_store_class_goods VALUES ('67', '56');
INSERT INTO shop_store_class_goods VALUES ('67', '54');
INSERT INTO shop_store_class_goods VALUES ('67', '53');
INSERT INTO shop_store_class_goods VALUES ('67', '51');
INSERT INTO shop_store_class_goods VALUES ('67', '50');
INSERT INTO shop_store_class_goods VALUES ('67', '48');
INSERT INTO shop_store_class_goods VALUES ('67', '46');
INSERT INTO shop_store_class_goods VALUES ('67', '45');
INSERT INTO shop_store_class_goods VALUES ('63', '49');
INSERT INTO shop_store_class_goods VALUES ('63', '47');
INSERT INTO shop_store_class_goods VALUES ('63', '44');
INSERT INTO shop_store_class_goods VALUES ('63', '43');
INSERT INTO shop_store_class_goods VALUES ('63', '42');
INSERT INTO shop_store_class_goods VALUES ('63', '41');
INSERT INTO shop_store_class_goods VALUES ('63', '40');
INSERT INTO shop_store_class_goods VALUES ('63', '39');
INSERT INTO shop_store_class_goods VALUES ('63', '38');
INSERT INTO shop_store_class_goods VALUES ('63', '37');
INSERT INTO shop_store_class_goods VALUES ('62', '36');
INSERT INTO shop_store_class_goods VALUES ('64', '35');
INSERT INTO shop_store_class_goods VALUES ('64', '34');
INSERT INTO shop_store_class_goods VALUES ('64', '32');
INSERT INTO shop_store_class_goods VALUES ('62', '31');
INSERT INTO shop_store_class_goods VALUES ('60', '28');
INSERT INTO shop_store_class_goods VALUES ('60', '27');
INSERT INTO shop_store_class_goods VALUES ('60', '24');
INSERT INTO shop_store_class_goods VALUES ('61', '25');
INSERT INTO shop_store_class_goods VALUES ('60', '22');
INSERT INTO shop_store_class_goods VALUES ('60', '21');
INSERT INTO shop_store_class_goods VALUES ('60', '19');
INSERT INTO shop_store_class_goods VALUES ('60', '16');
INSERT INTO shop_store_class_goods VALUES ('60', '12');
INSERT INTO shop_store_class_goods VALUES ('60', '2');

-- ----------------------------
-- Table structure for `shop_store_goods_class`
-- ----------------------------
DROP TABLE IF EXISTS `shop_store_goods_class`;
CREATE TABLE `shop_store_goods_class` (
  `stc_id` int(11) NOT NULL auto_increment COMMENT '索引ID',
  `stc_name` varchar(50) NOT NULL COMMENT '店铺商品分类名称',
  `stc_parent_id` int(11) NOT NULL COMMENT '父级id',
  `stc_state` tinyint(1) NOT NULL default '0' COMMENT '店铺商品分类状态',
  `store_id` int(11) NOT NULL default '0' COMMENT '店铺id',
  `stc_sort` int(11) NOT NULL default '0' COMMENT '商品分类排序',
  PRIMARY KEY  (`stc_id`),
  KEY `stc_parent_id` (`stc_parent_id`,`stc_sort`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_store_goods_class
-- ----------------------------
INSERT INTO shop_store_goods_class VALUES ('66', '茶具', '0', '1', '2', '0');
INSERT INTO shop_store_goods_class VALUES ('67', '婴儿用品', '0', '1', '2', '0');
INSERT INTO shop_store_goods_class VALUES ('41', '眼膜', '38', '1', '2', '0');
INSERT INTO shop_store_goods_class VALUES ('40', '面膜', '38', '1', '2', '0');
INSERT INTO shop_store_goods_class VALUES ('39', '男士护肤', '38', '1', '2', '0');
INSERT INTO shop_store_goods_class VALUES ('65', '相机', '0', '1', '2', '0');
INSERT INTO shop_store_goods_class VALUES ('60', '女装', '0', '1', '2', '0');
INSERT INTO shop_store_goods_class VALUES ('61', '男装', '0', '1', '2', '0');
INSERT INTO shop_store_goods_class VALUES ('62', '男鞋', '0', '1', '2', '0');
INSERT INTO shop_store_goods_class VALUES ('63', '美容美妆', '0', '1', '2', '0');
INSERT INTO shop_store_goods_class VALUES ('64', '箱包', '0', '1', '2', '0');

-- ----------------------------
-- Table structure for `shop_store_grade`
-- ----------------------------
DROP TABLE IF EXISTS `shop_store_grade`;
CREATE TABLE `shop_store_grade` (
  `sg_id` int(10) unsigned NOT NULL auto_increment COMMENT '索引ID',
  `sg_name` varchar(100) default NULL COMMENT '等级名称',
  `sg_goods_limit` int(10) unsigned NOT NULL default '0' COMMENT '允许发布的商品数量',
  `sg_space_limit` int(10) unsigned NOT NULL default '0' COMMENT '上传空间大小，单位MB',
  `sg_template_number` tinyint(3) unsigned NOT NULL default '0' COMMENT '选择店铺模板套数',
  `sg_template` varchar(255) default NULL COMMENT '模板内容',
  `sg_price` varchar(100) default NULL COMMENT '费用',
  `sg_confirm` tinyint(1) NOT NULL default '1' COMMENT '审核，0为否，1为是，默认为1',
  `sg_description` text COMMENT '申请说明',
  `sg_function` varchar(255) default NULL COMMENT '附加功能',
  `sg_sort` tinyint(3) unsigned NOT NULL default '0' COMMENT '级别，数目越大级别越高',
  PRIMARY KEY  (`sg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_store_grade
-- ----------------------------
INSERT INTO shop_store_grade VALUES ('1', '系统默认', '100', '100', '6', 'default|style1|style2|style3|style4|style5', '100元/年', '0', '用户选择“默认等级”，可以立即开通。', 'groupbuy', '0');
INSERT INTO shop_store_grade VALUES ('2', '白金店铺', '200', '100', '6', 'default|style1|style2|style3|style4|style5', '100元/年', '1', '享受更多特权', 'groupbuy', '2');

-- ----------------------------
-- Table structure for `shop_store_gradelog`
-- ----------------------------
DROP TABLE IF EXISTS `shop_store_gradelog`;
CREATE TABLE `shop_store_gradelog` (
  `gl_id` int(11) NOT NULL auto_increment COMMENT '等级日志自增编号',
  `gl_shopid` int(11) NOT NULL COMMENT '店铺编号',
  `gl_shopname` varchar(50) NOT NULL COMMENT '店铺名称',
  `gl_memberid` int(11) NOT NULL COMMENT '会员编号',
  `gl_membername` varchar(50) NOT NULL COMMENT '会员名称',
  `gl_sgid` int(11) NOT NULL COMMENT '等级编号',
  `gl_sgname` varchar(100) NOT NULL COMMENT '等级名称',
  `gl_sgconfirm` tinyint(4) NOT NULL default '1' COMMENT '是否需要审核 0不需要 1需要',
  `gl_sgsort` tinyint(3) NOT NULL COMMENT '级别',
  `gl_addtime` int(11) NOT NULL COMMENT '添加时间',
  `gl_allowstate` tinyint(1) NOT NULL COMMENT '审核状态 0为审核 1审核通过 2 审核未通过',
  `gl_allowadminid` int(11) NOT NULL default '0' COMMENT '管理员编号 默认为0 ',
  `gl_allowadminname` varchar(100) NOT NULL default 'system' COMMENT '管理员名称 默认为system 表示系统自动审核',
  `gl_allowremark` varchar(500) NOT NULL COMMENT '审核备注',
  PRIMARY KEY  (`gl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_store_gradelog
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_store_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `shop_store_navigation`;
CREATE TABLE `shop_store_navigation` (
  `sn_id` int(10) unsigned NOT NULL auto_increment COMMENT '导航ID',
  `sn_title` varchar(50) NOT NULL COMMENT '导航名称',
  `sn_store_id` int(10) unsigned NOT NULL default '0' COMMENT '卖家店铺ID',
  `sn_content` text COMMENT '导航内容',
  `sn_sort` tinyint(3) unsigned NOT NULL default '0' COMMENT '导航排序',
  `sn_if_show` tinyint(1) NOT NULL default '0' COMMENT '导航是否显示',
  `sn_add_time` int(10) NOT NULL COMMENT '导航',
  `sn_url` varchar(255) default NULL COMMENT '店铺导航的外链URL',
  `sn_new_open` tinyint(1) unsigned NOT NULL default '0' COMMENT '店铺导航外链是否在新窗口打开：0不开新窗口1开新窗口，默认是0',
  PRIMARY KEY  (`sn_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_store_navigation
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_store_partner`
-- ----------------------------
DROP TABLE IF EXISTS `shop_store_partner`;
CREATE TABLE `shop_store_partner` (
  `sp_id` int(10) unsigned NOT NULL auto_increment COMMENT '店铺合作伙伴ID',
  `sp_store_id` int(10) unsigned NOT NULL default '0' COMMENT '店铺ID',
  `sp_title` varchar(100) NOT NULL COMMENT '店铺合作伙伴标题',
  `sp_link` varchar(255) NOT NULL COMMENT '店铺合作伙伴链接',
  `sp_logo` varchar(255) default NULL COMMENT '店铺合作伙伴LOGO',
  `sp_sort` tinyint(1) unsigned NOT NULL default '255' COMMENT '店铺合作伙伴排序',
  PRIMARY KEY  (`sp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_store_partner
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_store_watermark`
-- ----------------------------
DROP TABLE IF EXISTS `shop_store_watermark`;
CREATE TABLE `shop_store_watermark` (
  `wm_id` int(11) NOT NULL auto_increment COMMENT '水印id',
  `jpeg_quality` int(3) NOT NULL default '90' COMMENT 'jpeg图片质量',
  `wm_image_name` varchar(255) default NULL COMMENT '水印图片的路径以及文件名',
  `wm_image_pos` tinyint(1) NOT NULL default '1' COMMENT '水印图片放置的位置',
  `wm_image_transition` int(3) NOT NULL default '20' COMMENT '水印图片与原图片的融合度 ',
  `wm_text` text COMMENT '水印文字',
  `wm_text_size` int(3) NOT NULL default '20' COMMENT '水印文字大小',
  `wm_text_angle` tinyint(1) NOT NULL default '4' COMMENT '水印文字角度',
  `wm_text_pos` tinyint(1) NOT NULL default '3' COMMENT '水印文字放置位置',
  `wm_text_font` varchar(50) default NULL COMMENT '水印文字的字体',
  `wm_text_color` varchar(7) NOT NULL default '#CCCCCC' COMMENT '水印字体的颜色值',
  `wm_is_open` tinyint(1) NOT NULL default '0' COMMENT '水印是否开启 0关闭 1开启',
  `store_id` int(11) default NULL COMMENT '店铺id',
  PRIMARY KEY  (`wm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_store_watermark
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_type`
-- ----------------------------
DROP TABLE IF EXISTS `shop_type`;
CREATE TABLE `shop_type` (
  `type_id` int(10) unsigned NOT NULL auto_increment COMMENT '类型id',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `type_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY  (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_type
-- ----------------------------
INSERT INTO shop_type VALUES ('1', '服装', '1');
INSERT INTO shop_type VALUES ('2', '鞋码', '2');
INSERT INTO shop_type VALUES ('3', '箱包', '3');
INSERT INTO shop_type VALUES ('4', '茶具', '4');
INSERT INTO shop_type VALUES ('5', '照相机', '1');

-- ----------------------------
-- Table structure for `shop_type_brand`
-- ----------------------------
DROP TABLE IF EXISTS `shop_type_brand`;
CREATE TABLE `shop_type_brand` (
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_type_brand
-- ----------------------------
INSERT INTO shop_type_brand VALUES ('2', '11');
INSERT INTO shop_type_brand VALUES ('2', '10');
INSERT INTO shop_type_brand VALUES ('2', '9');
INSERT INTO shop_type_brand VALUES ('2', '12');
INSERT INTO shop_type_brand VALUES ('2', '13');
INSERT INTO shop_type_brand VALUES ('2', '14');
INSERT INTO shop_type_brand VALUES ('2', '15');
INSERT INTO shop_type_brand VALUES ('2', '1');
INSERT INTO shop_type_brand VALUES ('2', '2');
INSERT INTO shop_type_brand VALUES ('2', '8');
INSERT INTO shop_type_brand VALUES ('1', '11');
INSERT INTO shop_type_brand VALUES ('1', '10');
INSERT INTO shop_type_brand VALUES ('1', '9');
INSERT INTO shop_type_brand VALUES ('1', '12');
INSERT INTO shop_type_brand VALUES ('1', '13');
INSERT INTO shop_type_brand VALUES ('1', '14');
INSERT INTO shop_type_brand VALUES ('1', '15');
INSERT INTO shop_type_brand VALUES ('1', '1');
INSERT INTO shop_type_brand VALUES ('1', '2');
INSERT INTO shop_type_brand VALUES ('1', '8');

-- ----------------------------
-- Table structure for `shop_type_spec`
-- ----------------------------
DROP TABLE IF EXISTS `shop_type_spec`;
CREATE TABLE `shop_type_spec` (
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `sp_id` int(10) unsigned NOT NULL COMMENT '规格id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_type_spec
-- ----------------------------
INSERT INTO shop_type_spec VALUES ('1', '1');
INSERT INTO shop_type_spec VALUES ('1', '2');
INSERT INTO shop_type_spec VALUES ('2', '3');
INSERT INTO shop_type_spec VALUES ('2', '1');
INSERT INTO shop_type_spec VALUES ('3', '1');

-- ----------------------------
-- Table structure for `shop_upload`
-- ----------------------------
DROP TABLE IF EXISTS `shop_upload`;
CREATE TABLE `shop_upload` (
  `upload_id` int(10) unsigned NOT NULL auto_increment COMMENT '索引ID',
  `file_name` varchar(100) default NULL COMMENT '文件名',
  `file_thumb` varchar(100) default NULL COMMENT '缩微图片',
  `file_wm` varchar(100) default NULL COMMENT '水印图片',
  `file_size` int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  `store_id` int(10) unsigned NOT NULL default '0' COMMENT '店铺ID，0为管理员',
  `upload_type` tinyint(1) NOT NULL default '0' COMMENT '文件类别，0为无，1为文章图片，默认为0，2为商品切换图片，3为商品内容图片，4为系统文章图片，5为积分礼品切换图片，6为积分礼品内容图片',
  `upload_time` int(10) unsigned NOT NULL default '0' COMMENT '添加时间',
  `item_id` int(11) unsigned NOT NULL default '0' COMMENT '信息ID',
  PRIMARY KEY  (`upload_id`)
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_upload
-- ----------------------------
INSERT INTO shop_upload VALUES ('1', 'aac6ff227c0e83e9b6af2f090ae91547.jpg', null, null, '102857', '0', '6', '1322032117', '1');
INSERT INTO shop_upload VALUES ('2', '23d29b33704d79e94b83217dcca1308f.jpg', '23d29b33704d79e94b83217dcca1308f.jpg_small.jpg', null, '80214', '0', '5', '1322032491', '1');
INSERT INTO shop_upload VALUES ('3', 'c98bc897edfa1036958cd17473f40819.jpg', 'c98bc897edfa1036958cd17473f40819.jpg_small.jpg', null, '52390', '0', '5', '1322034560', '2');
INSERT INTO shop_upload VALUES ('4', '3496d92e7c800e041393f1f94fb2e054.jpg', null, null, '384559', '0', '6', '1322032203', '1');
INSERT INTO shop_upload VALUES ('5', 'f21d22bf35391db6723becfa7ccc5512.jpg', 'f21d22bf35391db6723becfa7ccc5512.jpg_small.jpg', null, '23904', '2', '2', '1322112651', '1');
INSERT INTO shop_upload VALUES ('6', '51528ce2b1e52c44126461b711efa78f.jpg', '51528ce2b1e52c44126461b711efa78f.jpg_small.jpg', null, '49867', '2', '2', '1322113549', '2');
INSERT INTO shop_upload VALUES ('7', '05e04b481b27a5774fbe34ae4ba452e6.jpg', '05e04b481b27a5774fbe34ae4ba452e6.jpg_small.jpg', null, '15931', '2', '2', '1322113550', '2');
INSERT INTO shop_upload VALUES ('8', 'ae172bd8804dfc1ff6f002fe39f01ac9.jpg', 'ae172bd8804dfc1ff6f002fe39f01ac9.jpg_small.jpg', null, '68690', '2', '2', '1322113551', '2');
INSERT INTO shop_upload VALUES ('9', '0993ac952e86691c2351d26d6223a386.jpg', '0993ac952e86691c2351d26d6223a386.jpg_small.jpg', null, '21273', '2', '2', '1322113914', '3');
INSERT INTO shop_upload VALUES ('10', '7270c24985184d87ee18c8f20ea46491.jpg', '7270c24985184d87ee18c8f20ea46491.jpg_small.jpg', null, '13184', '2', '2', '1322114087', '4');
INSERT INTO shop_upload VALUES ('11', 'd65799f6e43cb59841c62783caeef540.jpg', 'd65799f6e43cb59841c62783caeef540.jpg_small.jpg', null, '18512', '2', '2', '1322114301', '5');
INSERT INTO shop_upload VALUES ('12', '50deee70b91ec2c286b468469c336e09.jpg', '50deee70b91ec2c286b468469c336e09.jpg_small.jpg', null, '17649', '2', '2', '1322114505', '6');
INSERT INTO shop_upload VALUES ('13', '3a27926d6a56f04f0943475354a4bac1.jpg', '3a27926d6a56f04f0943475354a4bac1.jpg_small.jpg', null, '11431', '2', '2', '1322114580', '7');
INSERT INTO shop_upload VALUES ('14', 'e953812764730143d073f2a0d89a0226.jpg', 'e953812764730143d073f2a0d89a0226.jpg_small.jpg', null, '393049', '2', '2', '1322114626', '12');
INSERT INTO shop_upload VALUES ('15', 'e5c20350c46a482f64c10c5f6c83486a.jpg', 'e5c20350c46a482f64c10c5f6c83486a.jpg_small.jpg', null, '401607', '2', '2', '1322114627', '12');
INSERT INTO shop_upload VALUES ('16', 'a3d219feb7224a822f7336651bdfa84b.jpg', 'a3d219feb7224a822f7336651bdfa84b.jpg_small.jpg', null, '465845', '2', '2', '1322114629', '12');
INSERT INTO shop_upload VALUES ('17', 'c307d4ddbf659acb1000296588d24266.jpg', 'c307d4ddbf659acb1000296588d24266.jpg_small.jpg', null, '431217', '2', '2', '1322114630', '12');
INSERT INTO shop_upload VALUES ('18', 'ba04cebcbe4397df5ca8b60b3ebcda08.jpg', 'ba04cebcbe4397df5ca8b60b3ebcda08.jpg_small.jpg', null, '9269', '2', '2', '1322114656', '8');
INSERT INTO shop_upload VALUES ('19', 'cfd07fdd0288d2528abb93239a143ade.jpg', 'cfd07fdd0288d2528abb93239a143ade.jpg_small.jpg', null, '10296', '2', '2', '1322114759', '9');
INSERT INTO shop_upload VALUES ('20', 'aa9c12062f79204a23f395ed01b538f9.jpg', 'aa9c12062f79204a23f395ed01b538f9.jpg_small.jpg', null, '14489', '2', '2', '1322114979', '10');
INSERT INTO shop_upload VALUES ('21', 'b86adcbf285eccbb62e4bcccabd24836.jpg', 'b86adcbf285eccbb62e4bcccabd24836.jpg_small.jpg', null, '29145', '2', '2', '1322115071', '11');
INSERT INTO shop_upload VALUES ('23', '0036cc108fd9f490bb434c900bd12985.jpg', '0036cc108fd9f490bb434c900bd12985.jpg_small.jpg', null, '189753', '2', '2', '1322115556', '13');
INSERT INTO shop_upload VALUES ('24', '0c7258a85d7a43af39a57300169a740a.jpg', '0c7258a85d7a43af39a57300169a740a.jpg_small.jpg', null, '118594', '2', '2', '1322115798', '14');
INSERT INTO shop_upload VALUES ('25', '47de9eb07984702d5f424d1a56286d68.jpg', '47de9eb07984702d5f424d1a56286d68.jpg_small.jpg', null, '104037', '2', '2', '1322115909', '15');
INSERT INTO shop_upload VALUES ('26', '3f167760d8640f6c5c11f7f47efcd18d.jpg', '3f167760d8640f6c5c11f7f47efcd18d.jpg_small.jpg', null, '35193', '2', '2', '1322115954', '16');
INSERT INTO shop_upload VALUES ('27', '096bd6588a631f74a343f157d72ce368.jpg', '096bd6588a631f74a343f157d72ce368.jpg_small.jpg', null, '193940', '2', '2', '1322116203', '17');
INSERT INTO shop_upload VALUES ('28', 'bc7d905825c408d26339b82ffffc3c63.jpg', 'bc7d905825c408d26339b82ffffc3c63.jpg_small.jpg', null, '51628', '2', '2', '1322116213', '16');
INSERT INTO shop_upload VALUES ('29', 'b5c8b569d50fc45782f930cb5978f2ed.jpg', 'b5c8b569d50fc45782f930cb5978f2ed.jpg_small.jpg', null, '58840', '2', '2', '1322116213', '16');
INSERT INTO shop_upload VALUES ('30', 'c2c8e577956049de1c2be4fc6fca7745.jpg', 'c2c8e577956049de1c2be4fc6fca7745.jpg_small.jpg', null, '47228', '2', '2', '1322116214', '16');
INSERT INTO shop_upload VALUES ('31', '9edbb02b5a21368228ec2a1451107ad8.jpg', '9edbb02b5a21368228ec2a1451107ad8.jpg_small.jpg', null, '43791', '2', '2', '1322116216', '16');
INSERT INTO shop_upload VALUES ('32', '28b00f923fdaafbd9e36241873809d76.jpg', '28b00f923fdaafbd9e36241873809d76.jpg_small.jpg', null, '75649', '2', '2', '1322116748', '18');
INSERT INTO shop_upload VALUES ('33', 'e9c053b2f4273024dab81dce35bdedec.jpg', 'e9c053b2f4273024dab81dce35bdedec.jpg_small.jpg', null, '16497', '2', '2', '1322116875', '19');
INSERT INTO shop_upload VALUES ('97', '60ade3674d042f47b1bce40ae42df2c8.jpg', '60ade3674d042f47b1bce40ae42df2c8.jpg_small.jpg', null, '35080', '2', '2', '1322125347', '52');
INSERT INTO shop_upload VALUES ('35', 'ddfcab24bd812c466788eeba587f4057.jpg', 'ddfcab24bd812c466788eeba587f4057.jpg_small.jpg', null, '93844', '2', '2', '1322117084', '21');
INSERT INTO shop_upload VALUES ('36', '3f81874d594894d19150843c42fb1f8e.jpg', '3f81874d594894d19150843c42fb1f8e.jpg_small.jpg', null, '142079', '2', '2', '1322117376', '22');
INSERT INTO shop_upload VALUES ('37', 'c9d06fe0d1bdbbef07b4a68fb6d826b8.jpeg', 'c9d06fe0d1bdbbef07b4a68fb6d826b8.jpeg_small.jpeg', null, '259059', '2', '2', '1322117487', '23');
INSERT INTO shop_upload VALUES ('38', 'ea36f7ea0aff6af0a50674b1619f7702.jpg', 'ea36f7ea0aff6af0a50674b1619f7702.jpg_small.jpg', null, '101363', '2', '2', '1322117495', '24');
INSERT INTO shop_upload VALUES ('39', 'ed3755ac3f250e8a7be3c14343c67832.jpg', 'ed3755ac3f250e8a7be3c14343c67832.jpg_small.jpg', null, '96652', '2', '2', '1322117750', '25');
INSERT INTO shop_upload VALUES ('40', '8a0cfade0b152c137a6855c580efeaa9.jpg', '8a0cfade0b152c137a6855c580efeaa9.jpg_small.jpg', null, '175994', '2', '2', '1322117841', '26');
INSERT INTO shop_upload VALUES ('41', 'ea64cc34f663159a68fde6872718541c.jpg', 'ea64cc34f663159a68fde6872718541c.jpg_small.jpg', null, '15508', '2', '2', '1322117861', '27');
INSERT INTO shop_upload VALUES ('42', '04fb225ea46bd1346f330400eedb7ef2.jpg', '04fb225ea46bd1346f330400eedb7ef2.jpg_small.jpg', null, '19611', '2', '2', '1322117986', '28');
INSERT INTO shop_upload VALUES ('43', 'b3fa422271ee0e974af458a049ca7e77.jpg', 'b3fa422271ee0e974af458a049ca7e77.jpg_small.jpg', null, '96401', '2', '2', '1322118125', '29');
INSERT INTO shop_upload VALUES ('44', '984600f5e9d1a07163cbe01e7500ad11.jpg', '984600f5e9d1a07163cbe01e7500ad11.jpg_small.jpg', null, '49128', '2', '2', '1322118462', '30');
INSERT INTO shop_upload VALUES ('45', '6454bd0ebdc79d1a445242fd773ac00f.jpg', '6454bd0ebdc79d1a445242fd773ac00f.jpg_small.jpg', null, '72307', '2', '2', '1322118524', '31');
INSERT INTO shop_upload VALUES ('46', '8cc9076454b3d68475778e4c5b68813a.jpg', '8cc9076454b3d68475778e4c5b68813a.jpg_small.jpg', null, '65069', '2', '2', '1322118525', '31');
INSERT INTO shop_upload VALUES ('47', 'ce68bd3780a968a105834d850cc211cb.jpg', 'ce68bd3780a968a105834d850cc211cb.jpg_small.jpg', null, '156678', '2', '2', '1322118525', '31');
INSERT INTO shop_upload VALUES ('48', '963260ffdc530dd871f817a99d38119d.jpg', '963260ffdc530dd871f817a99d38119d.jpg_small.jpg', null, '70831', '2', '2', '1322118526', '31');
INSERT INTO shop_upload VALUES ('49', 'e4ae4512e5d2477bfa5fb89669a0df03.jpg', 'e4ae4512e5d2477bfa5fb89669a0df03.jpg_small.jpg', null, '64612', '2', '2', '1322118526', '31');
INSERT INTO shop_upload VALUES ('50', '356ef8679ef2c96d6bfe5f1035904233.jpg', '356ef8679ef2c96d6bfe5f1035904233.jpg_small.jpg', null, '91869', '2', '2', '1322118821', '32');
INSERT INTO shop_upload VALUES ('51', 'a1dcb4e35fe2706532dfe75e9ae1f07e.jpg', 'a1dcb4e35fe2706532dfe75e9ae1f07e.jpg_small.jpg', null, '157397', '2', '2', '1322118822', '32');
INSERT INTO shop_upload VALUES ('52', 'd8a8e30ede885c06f9da26d8a75f311b.jpg', 'd8a8e30ede885c06f9da26d8a75f311b.jpg_small.jpg', null, '68041', '2', '2', '1322118823', '32');
INSERT INTO shop_upload VALUES ('53', 'ae3906538ba6506934e9fa67fdbb7cb4.jpg', 'ae3906538ba6506934e9fa67fdbb7cb4.jpg_small.jpg', null, '333952', '2', '2', '1322118823', '32');
INSERT INTO shop_upload VALUES ('54', '7117cae0707acea0dff351c727767416.jpg', '7117cae0707acea0dff351c727767416.jpg_small.jpg', null, '88178', '2', '2', '1322118833', '32');
INSERT INTO shop_upload VALUES ('55', '9422982b8e62a7d5e0c48a79cd1828cb.jpg', '9422982b8e62a7d5e0c48a79cd1828cb.jpg_small.jpg', null, '254870', '2', '2', '1322118940', '34');
INSERT INTO shop_upload VALUES ('56', '6eef4e79cc1cdabbb067e88090b19554.jpg', '6eef4e79cc1cdabbb067e88090b19554.jpg_small.jpg', null, '127141', '2', '2', '1322118950', '34');
INSERT INTO shop_upload VALUES ('57', '70cd400bc29f748ebde074e04f1ad081.jpeg', '70cd400bc29f748ebde074e04f1ad081.jpeg_small.jpeg', null, '45127', '2', '2', '1322118955', '33');
INSERT INTO shop_upload VALUES ('58', '496d409e03e72c047c207c7ec22394b6.jpg', '496d409e03e72c047c207c7ec22394b6.jpg_small.jpg', null, '138303', '2', '2', '1322118974', '34');
INSERT INTO shop_upload VALUES ('59', '1d71e5144f77c9cc6df27831262e2b12.jpg', '1d71e5144f77c9cc6df27831262e2b12.jpg_small.jpg', null, '54945', '2', '2', '1322118983', '34');
INSERT INTO shop_upload VALUES ('61', 'c78affa09050a1862902173d57d96227.jpg', 'c78affa09050a1862902173d57d96227.jpg_small.jpg', null, '88350', '2', '2', '1322119001', '34');
INSERT INTO shop_upload VALUES ('62', '4b42fbccd271020c5d430090fa93bdf3.jpg', '4b42fbccd271020c5d430090fa93bdf3.jpg_small.jpg', null, '116570', '2', '2', '1322119284', '35');
INSERT INTO shop_upload VALUES ('63', '53627d8fd87e695f1408f7ac12f29cac.jpg', '53627d8fd87e695f1408f7ac12f29cac.jpg_small.jpg', null, '164785', '2', '2', '1322119284', '35');
INSERT INTO shop_upload VALUES ('64', '99ec3e7d533a2e8341444de4bb7f20ff.jpg', '99ec3e7d533a2e8341444de4bb7f20ff.jpg_small.jpg', null, '101247', '2', '2', '1322119285', '35');
INSERT INTO shop_upload VALUES ('65', 'c82b0fb1e16f066387a97f0fa5095fef.jpg', 'c82b0fb1e16f066387a97f0fa5095fef.jpg_small.jpg', null, '26895', '2', '2', '1322119308', '35');
INSERT INTO shop_upload VALUES ('66', '949ae7c1258a2de4ea2886ad4cb37bd0.jpg', '949ae7c1258a2de4ea2886ad4cb37bd0.jpg_small.jpg', null, '54954', '2', '2', '1322119580', '36');
INSERT INTO shop_upload VALUES ('67', 'e391bfb2e3e07a8a0da9bcea3c6d495f.jpg', 'e391bfb2e3e07a8a0da9bcea3c6d495f.jpg_small.jpg', null, '118843', '2', '2', '1322119580', '36');
INSERT INTO shop_upload VALUES ('68', 'c6a8e1b002eb31b95a8a89b961660d25.jpg', 'c6a8e1b002eb31b95a8a89b961660d25.jpg_small.jpg', null, '46913', '2', '2', '1322119581', '36');
INSERT INTO shop_upload VALUES ('69', '569824668b45539cc9636f64a9ff0c72.jpg', '569824668b45539cc9636f64a9ff0c72.jpg_small.jpg', null, '49936', '2', '2', '1322119581', '36');
INSERT INTO shop_upload VALUES ('70', '3a60eb598a08530ca7702b00cacdff2d.jpg', '3a60eb598a08530ca7702b00cacdff2d.jpg_small.jpg', null, '26655', '2', '2', '1322119582', '36');
INSERT INTO shop_upload VALUES ('71', '4acea7994dd3fe86d93ae19698831b92.jpg', '4acea7994dd3fe86d93ae19698831b92.jpg_small.jpg', null, '391279', '2', '2', '1322121372', '37');
INSERT INTO shop_upload VALUES ('72', 'a0db986da7b7a2dc7e4cfb4b65692cbc.jpg', 'a0db986da7b7a2dc7e4cfb4b65692cbc.jpg_small.jpg', null, '220468', '2', '2', '1322121373', '37');
INSERT INTO shop_upload VALUES ('73', 'b9ddc65e07934b70196f4e8deac7aa5e.jpg', 'b9ddc65e07934b70196f4e8deac7aa5e.jpg_small.jpg', null, '48329', '2', '2', '1322121374', '37');
INSERT INTO shop_upload VALUES ('74', '16ad561a77804f7c76b03462d852f5ef.jpg', '16ad561a77804f7c76b03462d852f5ef.jpg_small.jpg', null, '313194', '2', '2', '1322121885', '38');
INSERT INTO shop_upload VALUES ('75', '1a4bd0a2447d76b9494e4c5e22f184ea.jpg', '1a4bd0a2447d76b9494e4c5e22f184ea.jpg_small.jpg', null, '288991', '2', '2', '1322121886', '38');
INSERT INTO shop_upload VALUES ('76', '57ec6dae05bcb152e946401f1327c17a.jpg', '57ec6dae05bcb152e946401f1327c17a.jpg_small.jpg', null, '124978', '2', '2', '1322122635', '39');
INSERT INTO shop_upload VALUES ('77', '85637d64635444a2c7c9c66b310c2803.jpg', '85637d64635444a2c7c9c66b310c2803.jpg_small.jpg', null, '46906', '2', '2', '1322122635', '39');
INSERT INTO shop_upload VALUES ('78', '0123b4b558661879d36aec9c7d12b107.jpg', '0123b4b558661879d36aec9c7d12b107.jpg_small.jpg', null, '53084', '2', '2', '1322122636', '39');
INSERT INTO shop_upload VALUES ('79', '4881e7d174693f1196e669b86643ddd8.jpg', '4881e7d174693f1196e669b86643ddd8.jpg_small.jpg', null, '112302', '2', '2', '1322122940', '40');
INSERT INTO shop_upload VALUES ('80', '0390369243d94cc16f9537515dcd384e.jpg', '0390369243d94cc16f9537515dcd384e.jpg_small.jpg', null, '319490', '2', '2', '1322122946', '40');
INSERT INTO shop_upload VALUES ('81', 'fdde88fceb45f66e35d9da05b23e3e40.jpg', 'fdde88fceb45f66e35d9da05b23e3e40.jpg_small.jpg', null, '90147', '2', '2', '1322123149', '41');
INSERT INTO shop_upload VALUES ('82', '69f3110840b378769b0cf87b8fa38bea.jpg', '69f3110840b378769b0cf87b8fa38bea.jpg_small.jpg', null, '356747', '2', '2', '1322123155', '41');
INSERT INTO shop_upload VALUES ('83', '911ebbce6dcce91a5855f025eb9d8df7.jpg', '911ebbce6dcce91a5855f025eb9d8df7.jpg_small.jpg', null, '32106', '2', '2', '1322123806', '42');
INSERT INTO shop_upload VALUES ('84', '1a7aad65f2b3293b34f898d2bc5ff7e2.jpg', '1a7aad65f2b3293b34f898d2bc5ff7e2.jpg_small.jpg', null, '56594', '2', '2', '1322123806', '42');
INSERT INTO shop_upload VALUES ('85', '81680159995562293f555d74a7472151.jpg', '81680159995562293f555d74a7472151.jpg_small.jpg', null, '231499', '2', '2', '1322123807', '42');
INSERT INTO shop_upload VALUES ('86', '911ebbce6dcce91a5855f025eb9d8df7.jpg', '911ebbce6dcce91a5855f025eb9d8df7.jpg_small.jpg', null, '32106', '2', '2', '1322123812', '42');
INSERT INTO shop_upload VALUES ('87', '34af6ee1bf0d5e8e51abb5c3f3022544.jpg', '34af6ee1bf0d5e8e51abb5c3f3022544.jpg_small.jpg', null, '241944', '2', '2', '1322124101', '43');
INSERT INTO shop_upload VALUES ('89', '84fcb7c4a35bd01af150ca5c0e068374.jpg', '84fcb7c4a35bd01af150ca5c0e068374.jpg_small.jpg', null, '114548', '2', '2', '1322124366', '44');
INSERT INTO shop_upload VALUES ('90', 'c7965d058c459e663f567f7cadb827f9.jpg', 'c7965d058c459e663f567f7cadb827f9.jpg_small.jpg', null, '27915', '2', '2', '1322124516', '45');
INSERT INTO shop_upload VALUES ('91', 'f83455c1f08937dd1a8f57f8d1211dea.jpg', 'f83455c1f08937dd1a8f57f8d1211dea.jpg_small.jpg', null, '113391', '2', '2', '1322124732', '46');
INSERT INTO shop_upload VALUES ('92', 'f047591bb2eb594d94849d08a652e184.jpg', 'f047591bb2eb594d94849d08a652e184.jpg_small.jpg', null, '103502', '2', '2', '1322124786', '47');
INSERT INTO shop_upload VALUES ('93', 'ac241afe1d3741879f113f8070798056.jpg', 'ac241afe1d3741879f113f8070798056.jpg_small.jpg', null, '104949', '2', '2', '1322124822', '48');
INSERT INTO shop_upload VALUES ('94', '4148eb0114cca80333da1f6924856bba.jpg', '4148eb0114cca80333da1f6924856bba.jpg_small.jpg', null, '73948', '2', '2', '1322124891', '49');
INSERT INTO shop_upload VALUES ('95', 'e8c60f1c1094163a797ea34ebc3c023e.jpg', 'e8c60f1c1094163a797ea34ebc3c023e.jpg_small.jpg', null, '95861', '2', '2', '1322124939', '50');
INSERT INTO shop_upload VALUES ('96', 'daffe84d5bc5d920b2275f84e37c5d2b.jpg', 'daffe84d5bc5d920b2275f84e37c5d2b.jpg_small.jpg', null, '124801', '2', '2', '1322125035', '51');
INSERT INTO shop_upload VALUES ('98', 'b9acf401ab3ab0b888316279d7f28ebf.jpg', 'b9acf401ab3ab0b888316279d7f28ebf.jpg_small.jpg', null, '56466', '2', '2', '1322125348', '52');
INSERT INTO shop_upload VALUES ('99', 'deeda5e5e9ffeaca7c824d5c9087a84e.jpg', 'deeda5e5e9ffeaca7c824d5c9087a84e.jpg_small.jpg', null, '173795', '2', '2', '1322125350', '52');
INSERT INTO shop_upload VALUES ('100', '3ae7d54d7e6d29e54e38150c51acbc05.jpg', '3ae7d54d7e6d29e54e38150c51acbc05.jpg_small.jpg', null, '383962', '2', '2', '1322125350', '52');
INSERT INTO shop_upload VALUES ('101', 'ee9489a41d83516edb7a83c58423bed3.jpg', 'ee9489a41d83516edb7a83c58423bed3.jpg_small.jpg', null, '71883', '2', '2', '1322125362', '53');
INSERT INTO shop_upload VALUES ('102', 'e654670072765b2772ca0f40b23ba7f8.jpg', 'e654670072765b2772ca0f40b23ba7f8.jpg_small.jpg', null, '114229', '2', '2', '1322125500', '54');
INSERT INTO shop_upload VALUES ('103', '9cefcbe37e9c0d4f488e1b8bde91d2ba.jpg', '9cefcbe37e9c0d4f488e1b8bde91d2ba.jpg_small.jpg', null, '49724', '2', '2', '1322125612', '55');
INSERT INTO shop_upload VALUES ('104', '9d2bcb0b593ba64e7cbf457e2eaa4ec2.jpg', '9d2bcb0b593ba64e7cbf457e2eaa4ec2.jpg_small.jpg', null, '37746', '2', '2', '1322125613', '55');
INSERT INTO shop_upload VALUES ('105', '5f191a69ea4ee180a1c7d1d1a6def05e.jpg', '5f191a69ea4ee180a1c7d1d1a6def05e.jpg_small.jpg', null, '82149', '2', '2', '1322125613', '55');
INSERT INTO shop_upload VALUES ('106', 'd415f4459e2c3ac6931ebb90800820fb.jpg', 'd415f4459e2c3ac6931ebb90800820fb.jpg_small.jpg', null, '133052', '2', '2', '1322125613', '55');
INSERT INTO shop_upload VALUES ('107', '1c738a10d1677e694b81e7aab18a5537.jpg', '1c738a10d1677e694b81e7aab18a5537.jpg_small.jpg', null, '268004', '2', '2', '1322125642', '56');
INSERT INTO shop_upload VALUES ('132', '1dbc94fa0d60cba3990b89ccb01f82c2.jpg', '1dbc94fa0d60cba3990b89ccb01f82c2.jpg_small.jpg', null, '47877', '2', '2', '1322126920', '66');
INSERT INTO shop_upload VALUES ('110', 'a490e4e7242f80d4dcf4d7fa55f2b1d5.jpg', 'a490e4e7242f80d4dcf4d7fa55f2b1d5.jpg_small.jpg', null, '59090', '2', '2', '1322125792', '58');
INSERT INTO shop_upload VALUES ('111', '2770b0b7f7abf7c0299568212e356079.jpg', '2770b0b7f7abf7c0299568212e356079.jpg_small.jpg', null, '79666', '2', '2', '1322125792', '58');
INSERT INTO shop_upload VALUES ('112', '35d356949bff630693eacd64cf09eaae.jpg', '35d356949bff630693eacd64cf09eaae.jpg_small.jpg', null, '25744', '2', '2', '1322125800', '59');
INSERT INTO shop_upload VALUES ('113', '2dd23ee4eab519f1ab3492306039d888.jpg', '2dd23ee4eab519f1ab3492306039d888.jpg_small.jpg', null, '71377', '2', '2', '1322125922', '60');
INSERT INTO shop_upload VALUES ('114', 'dd10cd371bcb4c94e0a6ec64d2fbfe16.jpg', 'dd10cd371bcb4c94e0a6ec64d2fbfe16.jpg_small.jpg', null, '89025', '2', '2', '1322125923', '60');
INSERT INTO shop_upload VALUES ('115', '408e90099042b141260ee49a3b8571e7.jpg', '408e90099042b141260ee49a3b8571e7.jpg_small.jpg', null, '69198', '2', '2', '1322125923', '60');
INSERT INTO shop_upload VALUES ('116', '8ae0269eeb4201a422f9096bba2eae55.jpg', '8ae0269eeb4201a422f9096bba2eae55.jpg_small.jpg', null, '171600', '2', '2', '1322125923', '60');
INSERT INTO shop_upload VALUES ('117', '822d3f8d9c9330f074a2eb993a92d5c5.jpg', '822d3f8d9c9330f074a2eb993a92d5c5.jpg_small.jpg', null, '44188', '2', '2', '1322126122', '61');
INSERT INTO shop_upload VALUES ('118', '71784ee000d1b1c51179e7799ccf6c24.jpg', '71784ee000d1b1c51179e7799ccf6c24.jpg_small.jpg', null, '40096', '2', '2', '1322126123', '61');
INSERT INTO shop_upload VALUES ('119', '59d028acc1967206676d47e7bf889813.jpg', '59d028acc1967206676d47e7bf889813.jpg_small.jpg', null, '87515', '2', '2', '1322126124', '61');
INSERT INTO shop_upload VALUES ('120', '372a55a56f00539ba07fb629d6687d87.jpg', '372a55a56f00539ba07fb629d6687d87.jpg_small.jpg', null, '110838', '2', '2', '1322126124', '61');
INSERT INTO shop_upload VALUES ('121', 'b16a7e3f6731b29fbb6bd236d4c9d300.jpg', 'b16a7e3f6731b29fbb6bd236d4c9d300.jpg_small.jpg', null, '52288', '2', '2', '1322126322', '62');
INSERT INTO shop_upload VALUES ('122', 'd58b293dc74985848cc60b6e03becbdc.jpg', 'd58b293dc74985848cc60b6e03becbdc.jpg_small.jpg', null, '40246', '2', '2', '1322126323', '62');
INSERT INTO shop_upload VALUES ('123', '340932cc8e82fd7e62591f0b266ab9c5.jpg', '340932cc8e82fd7e62591f0b266ab9c5.jpg_small.jpg', null, '150041', '2', '2', '1322126323', '62');
INSERT INTO shop_upload VALUES ('124', '5c169228f0f4d8ad2cae5b132c2b269c.jpg', '5c169228f0f4d8ad2cae5b132c2b269c.jpg_small.jpg', null, '36323', '2', '2', '1322126500', '63');
INSERT INTO shop_upload VALUES ('125', 'a4d3c77c3586028480f9a333fc987886.jpg', 'a4d3c77c3586028480f9a333fc987886.jpg_small.jpg', null, '55312', '2', '2', '1322126501', '63');
INSERT INTO shop_upload VALUES ('126', '25ac30b73f939eb502d3a5523a41e493.jpg', '25ac30b73f939eb502d3a5523a41e493.jpg_small.jpg', null, '38832', '2', '2', '1322126501', '63');
INSERT INTO shop_upload VALUES ('127', '10edbe1528c2eef0feb5a956410f5b3b.jpg', '10edbe1528c2eef0feb5a956410f5b3b.jpg_small.jpg', null, '288534', '2', '2', '1322126638', '64');
INSERT INTO shop_upload VALUES ('131', 'bd2d4c5ea3df0ceb8d2737619096fc17.jpg', 'bd2d4c5ea3df0ceb8d2737619096fc17.jpg_small.jpg', null, '80415', '2', '2', '1322126891', '57');
INSERT INTO shop_upload VALUES ('130', 'c1cb7ee7bc9b9e4a13bb2d7cc488818b.jpg', 'c1cb7ee7bc9b9e4a13bb2d7cc488818b.jpg_small.jpg', null, '167768', '2', '2', '1322126878', '65');
INSERT INTO shop_upload VALUES ('133', 'ac60c57beac526c76b935c08333eb31a.jpg', 'ac60c57beac526c76b935c08333eb31a.jpg_small.jpg', null, '44004', '2', '2', '1322126921', '66');
INSERT INTO shop_upload VALUES ('134', 'a2258c47de1b91c6fa08de36823d6bae.jpg', 'a2258c47de1b91c6fa08de36823d6bae.jpg_small.jpg', null, '89719', '2', '2', '1322126921', '66');
INSERT INTO shop_upload VALUES ('135', 'b6ecbd61c97a508e138c8f04b8fba112.jpg', 'b6ecbd61c97a508e138c8f04b8fba112.jpg_small.jpg', null, '125123', '2', '2', '1322126922', '66');
INSERT INTO shop_upload VALUES ('136', '6f8ff741b6c12a2d6f9cce86eb6cf1ad.jpg', '6f8ff741b6c12a2d6f9cce86eb6cf1ad.jpg_small.jpg', null, '63780', '2', '2', '1322126939', '67');
INSERT INTO shop_upload VALUES ('137', 'ba1e3b3b70a0c7f96975833adfecacd3.jpeg', 'ba1e3b3b70a0c7f96975833adfecacd3.jpeg_small.jpeg', null, '74377', '2', '2', '1322127111', '68');
INSERT INTO shop_upload VALUES ('138', '52f831e8e55240c3f9d529976b88f8f0.jpg', '52f831e8e55240c3f9d529976b88f8f0.jpg_small.jpg', null, '318223', '2', '2', '1322127179', '69');
INSERT INTO shop_upload VALUES ('139', '49612054bdba0511da6eeb3a474abdee.jpg', '49612054bdba0511da6eeb3a474abdee.jpg_small.jpg', null, '51567', '2', '2', '1322127199', '70');
INSERT INTO shop_upload VALUES ('144', '64f064ab87662337cb66615acba079de.jpg', '64f064ab87662337cb66615acba079de.jpg_small.jpg', null, '47318', '2', '2', '1322127214', '70');
INSERT INTO shop_upload VALUES ('141', '2824bb216ee85b8068ee00c0cde1d355.jpg', '2824bb216ee85b8068ee00c0cde1d355.jpg_small.jpg', null, '94479', '2', '2', '1322127200', '70');
INSERT INTO shop_upload VALUES ('142', '64f064ab87662337cb66615acba079de.jpg', '64f064ab87662337cb66615acba079de.jpg_small.jpg', null, '47318', '2', '2', '1322127203', '70');
INSERT INTO shop_upload VALUES ('143', '82cbaa729a2fcd27725370101be387e2.jpg', '82cbaa729a2fcd27725370101be387e2.jpg_small.jpg', null, '104535', '2', '2', '1322127203', '70');
INSERT INTO shop_upload VALUES ('146', '6d9d3912f417bb1cd5c77264e35a7431.jpeg', '6d9d3912f417bb1cd5c77264e35a7431.jpeg_small.jpeg', null, '64355', '2', '2', '1322127260', '71');
INSERT INTO shop_upload VALUES ('170', '951803703f9d12009f3a29b887aa5460.jpg', '951803703f9d12009f3a29b887aa5460.jpg_small.jpg', null, '166008', '2', '2', '1329992266', '83');
INSERT INTO shop_upload VALUES ('149', '5ca2a9d6a2745f95d5ef1c481706eec4.jpg', '5ca2a9d6a2745f95d5ef1c481706eec4.jpg_small.jpg', null, '38175', '2', '2', '1322129497', '73');
INSERT INTO shop_upload VALUES ('150', '91331d65f7c0a0d4e107dcd0108e2f43.jpg', '91331d65f7c0a0d4e107dcd0108e2f43.jpg_small.jpg', null, '103495', '2', '2', '1322129575', '74');
INSERT INTO shop_upload VALUES ('151', 'f415ae8aff2f253ed0344c9aa7e4ea89.jpg', 'f415ae8aff2f253ed0344c9aa7e4ea89.jpg_small.jpg', null, '53678', '2', '2', '1322129767', '75');
INSERT INTO shop_upload VALUES ('152', 'eb26eccc4071b56e4abd1495682af490.jpg', 'eb26eccc4071b56e4abd1495682af490.jpg_small.jpg', null, '170333', '2', '2', '1322129827', '76');
INSERT INTO shop_upload VALUES ('153', 'f32edceb5b68790d871014aee77c267e.jpg', 'f32edceb5b68790d871014aee77c267e.jpg_small.jpg', null, '84134', '2', '2', '1322129944', '78');
INSERT INTO shop_upload VALUES ('154', 'cab18b2cbd6bdc2f71bad484609b4be4.jpg', 'cab18b2cbd6bdc2f71bad484609b4be4.jpg_small.jpg', null, '114637', '2', '2', '1322129945', '78');
INSERT INTO shop_upload VALUES ('155', '789401aac6d5355542e32e123d1c247d.jpg', '789401aac6d5355542e32e123d1c247d.jpg_small.jpg', null, '65756', '2', '2', '1322129946', '78');
INSERT INTO shop_upload VALUES ('156', '29278568dd67ead3855205e6793f0395.jpg', '29278568dd67ead3855205e6793f0395.jpg_small.jpg', null, '57878', '2', '2', '1322129961', '77');
INSERT INTO shop_upload VALUES ('157', '56e80d30a3983258950612dbc0a280db.jpg', '56e80d30a3983258950612dbc0a280db.jpg_small.jpg', null, '42963', '2', '2', '1322130226', '79');
INSERT INTO shop_upload VALUES ('158', 'fa743bbde1dc677b22043b6d4d5542fb.jpg', 'fa743bbde1dc677b22043b6d4d5542fb.jpg_small.jpg', null, '48624', '2', '2', '1322130226', '79');
INSERT INTO shop_upload VALUES ('159', '373a4f09bf5173cc6088ad2053734b2e.jpg', '373a4f09bf5173cc6088ad2053734b2e.jpg_small.jpg', null, '34355', '2', '2', '1322130226', '79');
INSERT INTO shop_upload VALUES ('160', 'fa743bbde1dc677b22043b6d4d5542fb.jpg', 'fa743bbde1dc677b22043b6d4d5542fb.jpg_small.jpg', null, '48624', '2', '2', '1322130230', '79');
INSERT INTO shop_upload VALUES ('161', '92a7a0913bf7ba41e9a3a5e46706c35d.jpg', '92a7a0913bf7ba41e9a3a5e46706c35d.jpg_small.jpg', null, '66983', '2', '2', '1322130428', '80');
INSERT INTO shop_upload VALUES ('162', 'f49d92932c787fd90b2daf299d95615c.jpg', 'f49d92932c787fd90b2daf299d95615c.jpg_small.jpg', null, '59373', '2', '2', '1322130435', '80');
INSERT INTO shop_upload VALUES ('163', '266dc555784293114c03fa10492cb490.jpg', '266dc555784293114c03fa10492cb490.jpg_small.jpg', null, '39338', '2', '2', '1322130441', '80');
INSERT INTO shop_upload VALUES ('164', 'e5186d77fb2c636d2d4858c2755707db.jpg', 'e5186d77fb2c636d2d4858c2755707db.jpg_small.jpg', null, '83101', '2', '2', '1322130613', '81');
INSERT INTO shop_upload VALUES ('165', 'a5559a1bdd4f2cb01c790d2fdae806fb.jpg', 'a5559a1bdd4f2cb01c790d2fdae806fb.jpg_small.jpg', null, '103903', '2', '2', '1322130620', '81');
INSERT INTO shop_upload VALUES ('166', '02d26fc576d4a1e5aa04c10383b55dc5.jpg', '02d26fc576d4a1e5aa04c10383b55dc5.jpg_small.jpg', null, '86433', '2', '2', '1322130625', '81');
INSERT INTO shop_upload VALUES ('167', '2cd6bc3e70205057c54f2cd1ed7f7084.jpg', '2cd6bc3e70205057c54f2cd1ed7f7084.jpg_small.jpg', null, '71208', '2', '2', '1322131033', '82');
INSERT INTO shop_upload VALUES ('168', '904c83a95da5380b136bb295d53245b5.jpg', '904c83a95da5380b136bb295d53245b5.jpg_small.jpg', null, '57646', '2', '2', '1322131035', '82');
INSERT INTO shop_upload VALUES ('169', 'c3820ec42dde8802b85a8f2c8c190cf2.jpg', 'c3820ec42dde8802b85a8f2c8c190cf2.jpg_small.jpg', null, '83586', '2', '2', '1322131038', '82');
INSERT INTO shop_upload VALUES ('171', '9a52993ed687970a1e012444d2061872.jpg', '9a52993ed687970a1e012444d2061872.jpg_small.jpg', null, '68343', '2', '2', '1329992724', '84');

-- ----------------------------
-- Table structure for `shop_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `shop_voucher`;
CREATE TABLE `shop_voucher` (
  `voucher_id` int(11) NOT NULL auto_increment COMMENT '代金券编号',
  `voucher_code` varchar(32) NOT NULL COMMENT '代金券编码',
  `voucher_t_id` int(11) NOT NULL COMMENT '代金券模版编号',
  `voucher_title` varchar(50) NOT NULL COMMENT '代金券标题',
  `voucher_desc` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucher_start_date` int(11) NOT NULL COMMENT '代金券有效期开始时间',
  `voucher_end_date` int(11) NOT NULL COMMENT '代金券有效期结束时间',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面额',
  `voucher_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_store_id` int(11) NOT NULL COMMENT '代金券的店铺id',
  `voucher_state` tinyint(4) NOT NULL COMMENT '代金券状态(1-未用,2-已用,3-过期,4-收回)',
  `voucher_active_date` int(11) NOT NULL COMMENT '代金券发放日期',
  `voucher_type` tinyint(4) NOT NULL COMMENT '代金券类别',
  `voucher_owner_id` int(11) NOT NULL COMMENT '代金券所有者id',
  `voucher_owner_name` varchar(50) NOT NULL COMMENT '代金券所有者名称',
  `voucher_order_id` int(11) default NULL COMMENT '使用该代金券的订单编号',
  PRIMARY KEY  (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_voucher_price`
-- ----------------------------
DROP TABLE IF EXISTS `shop_voucher_price`;
CREATE TABLE `shop_voucher_price` (
  `voucher_price_id` int(11) NOT NULL auto_increment COMMENT '代金券面值编号',
  `voucher_price_describe` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面值',
  PRIMARY KEY  (`voucher_price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_voucher_price
-- ----------------------------
INSERT INTO shop_voucher_price VALUES ('1', '10元面额', '10');
INSERT INTO shop_voucher_price VALUES ('2', '50元面额', '50');

-- ----------------------------
-- Table structure for `shop_voucher_template`
-- ----------------------------
DROP TABLE IF EXISTS `shop_voucher_template`;
CREATE TABLE `shop_voucher_template` (
  `voucher_t_id` int(11) NOT NULL auto_increment COMMENT '代金券模版编号',
  `voucher_t_title` varchar(50) NOT NULL COMMENT '代金券模版名称',
  `voucher_t_desc` varchar(255) NOT NULL COMMENT '代金券模版描述',
  `voucher_t_start_date` int(11) NOT NULL COMMENT '代金券模版有效期开始时间',
  `voucher_t_end_date` int(11) NOT NULL COMMENT '代金券模版有效期结束时间',
  `voucher_t_price` int(11) NOT NULL COMMENT '代金券模版面额',
  `voucher_t_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_t_store_id` int(11) NOT NULL COMMENT '代金券模版的店铺id',
  `voucher_t_creator_id` int(11) NOT NULL COMMENT '代金券模版的创建者id',
  `voucher_t_state` tinyint(4) NOT NULL COMMENT '代金券模版状态(1-有效,2-失效)',
  `voucher_t_total` int(11) NOT NULL COMMENT '模版可发放的代金券总数',
  `voucher_t_giveout` int(11) NOT NULL COMMENT '模版已发放的代金券数量',
  `voucher_t_used` int(11) NOT NULL COMMENT '模版已经使用过的代金券',
  `voucher_t_add_date` int(11) NOT NULL COMMENT '模版的创建时间',
  `voucher_t_type` tinyint(4) NOT NULL COMMENT '代金券模版类型',
  PRIMARY KEY  (`voucher_t_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_voucher_template
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_ztc_glodlog`
-- ----------------------------
DROP TABLE IF EXISTS `shop_ztc_glodlog`;
CREATE TABLE `shop_ztc_glodlog` (
  `glog_id` int(11) NOT NULL auto_increment COMMENT '自增编号',
  `glog_goodsid` int(11) NOT NULL COMMENT '商品编号',
  `glog_goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `glog_memberid` int(11) NOT NULL COMMENT '会员编号',
  `glog_membername` varchar(50) NOT NULL COMMENT '会员名称',
  `glog_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `glog_storename` varchar(50) NOT NULL COMMENT '店铺名称',
  `glog_type` tinyint(4) NOT NULL COMMENT '金币日志类型 1增加 2减少',
  `glog_goldnum` int(11) NOT NULL default '0' COMMENT '金币额',
  `glog_addtime` int(11) NOT NULL COMMENT '添加时间',
  `glog_desc` varchar(500) NOT NULL COMMENT '操作描述',
  PRIMARY KEY  (`glog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_ztc_glodlog
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_ztc_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_ztc_goods`;
CREATE TABLE `shop_ztc_goods` (
  `ztc_id` int(11) NOT NULL auto_increment COMMENT '自增编号',
  `ztc_goodsid` int(11) NOT NULL COMMENT '商品编号',
  `ztc_goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `ztc_goodsimage` varchar(100) NOT NULL COMMENT '商品图片',
  `ztc_memberid` int(11) NOT NULL COMMENT '会员编号',
  `ztc_membername` varchar(50) NOT NULL COMMENT '会员名称',
  `ztc_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `ztc_storename` varchar(50) NOT NULL COMMENT '店铺名称',
  `ztc_gold` int(11) NOT NULL COMMENT '加入直通车分配的金币额',
  `ztc_remark` varchar(200) NOT NULL COMMENT '备注信息',
  `ztc_addtime` int(11) NOT NULL COMMENT '添加时间',
  `ztc_startdate` int(11) default NULL COMMENT '直通车开始时间，没设置表明即刻开始',
  `ztc_state` tinyint(1) NOT NULL default '0' COMMENT '审核状态 0未审核 1审核通过 2 审核未通过',
  `ztc_paystate` tinyint(4) NOT NULL default '0' COMMENT '支付状态 0未支付 1已支付',
  `ztc_type` tinyint(4) NOT NULL default '0' COMMENT '充值类型 0表示新申请记录 1表示充值记录，不经过审核直接给直通车加金币',
  PRIMARY KEY  (`ztc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_ztc_goods
-- ----------------------------
