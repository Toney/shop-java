/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : javashop

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2012-04-19 11:08:26
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `shop_account_log`
-- ----------------------------
DROP TABLE IF EXISTS `shop_account_log`;
CREATE TABLE `shop_account_log` (
  `id` int(11) NOT NULL auto_increment,
  `admin_id` int(11) NOT NULL COMMENT '管理员ID',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `type` tinyint(1) NOT NULL default '0' COMMENT '0增加,1减少',
  `event` tinyint(4) NOT NULL COMMENT '操作类型，意义请看accountLog类',
  `time` datetime NOT NULL COMMENT '发生时间',
  `amount` float(10,2) NOT NULL COMMENT '金额',
  `amount_log` float(10,2) NOT NULL COMMENT '每次增减后面的金额记录',
  `note` text COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账户余额日志表';

-- ----------------------------
-- Records of shop_account_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_address`
-- ----------------------------
DROP TABLE IF EXISTS `shop_address`;
CREATE TABLE `shop_address` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `accept_name` varchar(20) NOT NULL COMMENT '收货人姓名',
  `zip` varchar(6) default NULL COMMENT '邮编',
  `telphone` varchar(20) default NULL COMMENT '联系电话',
  `country` int(11) default NULL COMMENT '国ID',
  `province` int(11) NOT NULL COMMENT '省ID',
  `city` int(11) NOT NULL COMMENT '市ID',
  `area` int(11) default NULL COMMENT '区ID',
  `address` varchar(250) default NULL COMMENT '收货地址',
  `mobile` varchar(20) default NULL COMMENT '手机',
  `default` tinyint(1) NOT NULL default '0' COMMENT '是否默认,0:为非默认,1:默认',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='收货信息表';

-- ----------------------------
-- Records of shop_address
-- ----------------------------
INSERT INTO shop_address VALUES ('1', '1', 'zhangsan', '323232', '23232332', null, '1573', '1591', '1594', 'diqu', '15358062815', '1');

-- ----------------------------
-- Table structure for `shop_admin`
-- ----------------------------
DROP TABLE IF EXISTS `shop_admin`;
CREATE TABLE `shop_admin` (
  `id` int(11) NOT NULL auto_increment COMMENT '管理员ID',
  `admin_name` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `create_time` datetime default NULL COMMENT '创建时间',
  `email` varchar(255) default NULL COMMENT 'Email',
  `last_ip` varchar(30) default NULL COMMENT '最后登录IP',
  `last_time` datetime default NULL COMMENT '最后登录时间',
  `is_del` tinyint(1) NOT NULL default '0' COMMENT '删除状态 1删除,0正常',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员用户表';

-- ----------------------------
-- Records of shop_admin
-- ----------------------------
INSERT INTO shop_admin VALUES ('1', 'admin', '0192023a7bbd73250516f069df18b500', '0', '2012-04-18 12:04:22', null, '127.0.0.1', '2012-04-18 20:06:19', '0');

-- ----------------------------
-- Table structure for `shop_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `shop_admin_role`;
CREATE TABLE `shop_admin_role` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `rights` text COMMENT '权限',
  `is_del` tinyint(1) NOT NULL default '0' COMMENT '删除状态 1删除,0正常',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台角色分组表';

-- ----------------------------
-- Records of shop_admin_role
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_ad_manage`
-- ----------------------------
DROP TABLE IF EXISTS `shop_ad_manage`;
CREATE TABLE `shop_ad_manage` (
  `id` int(11) NOT NULL auto_increment COMMENT '广告ID',
  `name` varchar(50) NOT NULL COMMENT '广告名称',
  `type` tinyint(1) NOT NULL COMMENT '广告类型 1:img 2:flash 3:code 4:文字',
  `position_id` int(11) NOT NULL COMMENT '广告位ID',
  `link` varchar(255) default NULL COMMENT '链接地址',
  `order` int(6) default NULL COMMENT '排列顺序',
  `width` int(11) default NULL COMMENT '广告宽度',
  `height` int(11) default NULL COMMENT '广告高度',
  `start_time` date default NULL COMMENT '开始时间',
  `end_time` date default NULL COMMENT '结束时间',
  `content` varchar(255) default NULL COMMENT '图片、flash路径，文字，code等',
  `description` varchar(255) default NULL COMMENT '描述',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='广告记录表';

-- ----------------------------
-- Records of shop_ad_manage
-- ----------------------------
INSERT INTO shop_ad_manage VALUES ('16', '首页左上方广告', '1', '5', 'http://www.baidu.com', '99', '0', '0', '2011-05-01', '2011-08-05', 'upload/2011/06/07/20110607105359556.png', '首页左上方广告');
INSERT INTO shop_ad_manage VALUES ('23', '首页中部通栏广告', '1', '6', 'http://www.google.com', '99', '0', '0', '2011-05-03', '2015-06-11', 'upload/2011/06/07/20110607105518688.png', '首页中部通栏广告');
INSERT INTO shop_ad_manage VALUES ('18', '首页右上方', '1', '7', 'http://www.facebook.com', '99', '0', '0', '2011-05-02', '2015-06-30', 'upload/2011/06/07/20110607105608864.png', '首页右上方');
INSERT INTO shop_ad_manage VALUES ('19', '商品搜索结果页198*120', '1', '8', 'http://www.163.com', '99', '198', '120', '2011-05-05', '2015-06-10', 'upload/2011/06/07/20110607105655941.png', '1');
INSERT INTO shop_ad_manage VALUES ('22', '文章公告内容页左侧', '1', '10', 'http://www.jooyea.net', '99', '0', '0', '2011-05-02', '2015-12-10', 'upload/2011/06/07/20110607105620728.png', '1');
INSERT INTO shop_ad_manage VALUES ('24', '首页中部通栏广告', '1', '6', 'http://www.google.com', '99', '0', '0', '2011-05-03', '2015-06-11', 'upload/2011/06/07/20110607105547573.png', '首页中部通栏广告');

-- ----------------------------
-- Table structure for `shop_ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `shop_ad_position`;
CREATE TABLE `shop_ad_position` (
  `id` int(11) NOT NULL auto_increment COMMENT '广告位ID',
  `name` varchar(50) NOT NULL COMMENT '广告位名称',
  `width` int(6) default NULL COMMENT '广告位宽度',
  `height` int(6) default NULL COMMENT '广告位高度',
  `type` tinyint(1) default NULL COMMENT '1:img; 2:flash; 3:文字; 4:code; 5:幻灯片',
  `fashion` tinyint(2) default NULL COMMENT '1:轮显;2:随即',
  `status` tinyint(1) default '0' COMMENT '1:开启; 0: 关闭',
  `ad_nums` int(11) default NULL COMMENT '广告显示数量',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='广告位记录表';

-- ----------------------------
-- Records of shop_ad_position
-- ----------------------------
INSERT INTO shop_ad_position VALUES ('1', '页面顶部通栏广告条', '0', '0', '0', '1', '0', '3');
INSERT INTO shop_ad_position VALUES ('5', '首页左上方748*299', '748', '299', '0', '1', '1', '1');
INSERT INTO shop_ad_position VALUES ('6', '首页中部通栏', '0', '0', '0', '1', '1', '1');
INSERT INTO shop_ad_position VALUES ('7', '首页又上方198*104', '198', '104', '0', '1', '1', '1');
INSERT INTO shop_ad_position VALUES ('8', '商品搜索结果页左侧', '198', '120', '0', '1', '1', '1');
INSERT INTO shop_ad_position VALUES ('10', '文章-公告内容页左册', '0', '0', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for `shop_after_sell`
-- ----------------------------
DROP TABLE IF EXISTS `shop_after_sell`;
CREATE TABLE `shop_after_sell` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL COMMENT '订单ID',
  `user_id` int(11) default NULL COMMENT '退货人',
  `time` datetime default NULL COMMENT '申请时间',
  `cause` varchar(255) default NULL COMMENT '原因',
  `done` tinyint(1) default '1' COMMENT '1退2换',
  `status` tinyint(1) default '0' COMMENT '0未处理 1处理中 2 处理结束',
  `name` varchar(255) default NULL COMMENT '开户名',
  `account_bank` varchar(255) default NULL COMMENT '开户行',
  `belong_bank` varchar(255) default NULL COMMENT '所属银行',
  `returns_type` int(11) default NULL COMMENT '1站内2支付宝3银行',
  `account` varchar(255) default NULL COMMENT '支付宝、快钱等账号',
  `content` text COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='退换申请表';

-- ----------------------------
-- Records of shop_after_sell
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_announcement`
-- ----------------------------
DROP TABLE IF EXISTS `shop_announcement`;
CREATE TABLE `shop_announcement` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(250) NOT NULL COMMENT '公告标题',
  `content` text COMMENT '公告内容',
  `time` datetime default NULL COMMENT '发布时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='公告消息表';

-- ----------------------------
-- Records of shop_announcement
-- ----------------------------
INSERT INTO shop_announcement VALUES ('1', 'IwebShop 新版发布', 'IwebShop 今天正式发布了，欢迎大家前来体验啊！<br />', '2011-06-02 16:11:58');

-- ----------------------------
-- Table structure for `shop_areas`
-- ----------------------------
DROP TABLE IF EXISTS `shop_areas`;
CREATE TABLE `shop_areas` (
  `area_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned default NULL,
  `area_name` varchar(50) NOT NULL default '',
  `sort` mediumint(8) unsigned default NULL,
  PRIMARY KEY  (`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3267 DEFAULT CHARSET=utf8 COMMENT='地区信息';

-- ----------------------------
-- Records of shop_areas
-- ----------------------------
INSERT INTO shop_areas VALUES ('1', '0', '﻿北京', '99');
INSERT INTO shop_areas VALUES ('2', '1', '北京市', '99');
INSERT INTO shop_areas VALUES ('3', '2', '东城区', '99');
INSERT INTO shop_areas VALUES ('4', '2', '西城区', '99');
INSERT INTO shop_areas VALUES ('5', '2', '崇文区', '99');
INSERT INTO shop_areas VALUES ('6', '2', '宣武区', '99');
INSERT INTO shop_areas VALUES ('7', '2', '朝阳区', '99');
INSERT INTO shop_areas VALUES ('8', '2', '丰台区', '99');
INSERT INTO shop_areas VALUES ('9', '2', '石景山区', '99');
INSERT INTO shop_areas VALUES ('10', '2', '海淀区', '99');
INSERT INTO shop_areas VALUES ('11', '2', '门头沟区', '99');
INSERT INTO shop_areas VALUES ('12', '2', '房山区', '99');
INSERT INTO shop_areas VALUES ('13', '2', '通州区', '99');
INSERT INTO shop_areas VALUES ('14', '2', '顺义区', '99');
INSERT INTO shop_areas VALUES ('15', '2', '昌平区', '99');
INSERT INTO shop_areas VALUES ('16', '2', '大兴区', '99');
INSERT INTO shop_areas VALUES ('17', '2', '怀柔区', '99');
INSERT INTO shop_areas VALUES ('18', '2', '平谷区', '99');
INSERT INTO shop_areas VALUES ('19', '2', '密云县', '99');
INSERT INTO shop_areas VALUES ('20', '2', '延庆县', '99');
INSERT INTO shop_areas VALUES ('21', '0', '上海', '99');
INSERT INTO shop_areas VALUES ('22', '21', '上海市', '99');
INSERT INTO shop_areas VALUES ('23', '22', '黄浦区', '99');
INSERT INTO shop_areas VALUES ('24', '22', '卢湾区', '99');
INSERT INTO shop_areas VALUES ('25', '22', '徐汇区', '99');
INSERT INTO shop_areas VALUES ('26', '22', '长宁区', '99');
INSERT INTO shop_areas VALUES ('27', '22', '静安区', '99');
INSERT INTO shop_areas VALUES ('28', '22', '普陀区', '99');
INSERT INTO shop_areas VALUES ('29', '22', '闸北区', '99');
INSERT INTO shop_areas VALUES ('30', '22', '虹口区', '99');
INSERT INTO shop_areas VALUES ('31', '22', '杨浦区', '99');
INSERT INTO shop_areas VALUES ('32', '22', '闵行区', '99');
INSERT INTO shop_areas VALUES ('33', '22', '宝山区', '99');
INSERT INTO shop_areas VALUES ('34', '22', '嘉定区', '99');
INSERT INTO shop_areas VALUES ('35', '22', '浦东新区', '99');
INSERT INTO shop_areas VALUES ('36', '22', '金山区', '99');
INSERT INTO shop_areas VALUES ('37', '22', '松江区', '99');
INSERT INTO shop_areas VALUES ('38', '22', '青浦区', '99');
INSERT INTO shop_areas VALUES ('39', '22', '南汇区', '99');
INSERT INTO shop_areas VALUES ('40', '22', '奉贤区', '99');
INSERT INTO shop_areas VALUES ('41', '22', '崇明县', '99');
INSERT INTO shop_areas VALUES ('42', '0', '天津', '99');
INSERT INTO shop_areas VALUES ('43', '42', '天津市', '99');
INSERT INTO shop_areas VALUES ('44', '43', '和平区', '99');
INSERT INTO shop_areas VALUES ('45', '43', '河东区', '99');
INSERT INTO shop_areas VALUES ('46', '43', '河西区', '99');
INSERT INTO shop_areas VALUES ('47', '43', '南开区', '99');
INSERT INTO shop_areas VALUES ('48', '43', '河北区', '99');
INSERT INTO shop_areas VALUES ('49', '43', '红桥区', '99');
INSERT INTO shop_areas VALUES ('50', '43', '塘沽区', '99');
INSERT INTO shop_areas VALUES ('51', '43', '汉沽区', '99');
INSERT INTO shop_areas VALUES ('52', '43', '大港区', '99');
INSERT INTO shop_areas VALUES ('53', '43', '东丽区', '99');
INSERT INTO shop_areas VALUES ('54', '43', '西青区', '99');
INSERT INTO shop_areas VALUES ('55', '43', '津南区', '99');
INSERT INTO shop_areas VALUES ('56', '43', '北辰区', '99');
INSERT INTO shop_areas VALUES ('57', '43', '武清区', '99');
INSERT INTO shop_areas VALUES ('58', '43', '宝坻区', '99');
INSERT INTO shop_areas VALUES ('59', '43', '宁河县', '99');
INSERT INTO shop_areas VALUES ('60', '43', '静海县', '99');
INSERT INTO shop_areas VALUES ('61', '43', '蓟县', '99');
INSERT INTO shop_areas VALUES ('62', '0', '重庆', '99');
INSERT INTO shop_areas VALUES ('63', '62', '重庆市', '99');
INSERT INTO shop_areas VALUES ('64', '63', '万州区', '99');
INSERT INTO shop_areas VALUES ('65', '63', '涪陵区', '99');
INSERT INTO shop_areas VALUES ('66', '63', '渝中区', '99');
INSERT INTO shop_areas VALUES ('67', '63', '大渡口区', '99');
INSERT INTO shop_areas VALUES ('68', '63', '江北区', '99');
INSERT INTO shop_areas VALUES ('69', '63', '沙坪坝区', '99');
INSERT INTO shop_areas VALUES ('70', '63', '九龙坡区', '99');
INSERT INTO shop_areas VALUES ('71', '63', '南岸区', '99');
INSERT INTO shop_areas VALUES ('72', '63', '北碚区', '99');
INSERT INTO shop_areas VALUES ('73', '63', '万盛区', '99');
INSERT INTO shop_areas VALUES ('74', '63', '双桥区', '99');
INSERT INTO shop_areas VALUES ('75', '63', '渝北区', '99');
INSERT INTO shop_areas VALUES ('76', '63', '巴南区', '99');
INSERT INTO shop_areas VALUES ('77', '63', '黔江区', '99');
INSERT INTO shop_areas VALUES ('78', '63', '长寿区', '99');
INSERT INTO shop_areas VALUES ('79', '63', '綦江县', '99');
INSERT INTO shop_areas VALUES ('80', '63', '潼南县', '99');
INSERT INTO shop_areas VALUES ('81', '63', '铜梁县', '99');
INSERT INTO shop_areas VALUES ('82', '63', '大足县', '99');
INSERT INTO shop_areas VALUES ('83', '63', '荣昌县', '99');
INSERT INTO shop_areas VALUES ('84', '63', '璧山县', '99');
INSERT INTO shop_areas VALUES ('85', '63', '梁平县', '99');
INSERT INTO shop_areas VALUES ('86', '63', '城口县', '99');
INSERT INTO shop_areas VALUES ('87', '63', '丰都县', '99');
INSERT INTO shop_areas VALUES ('88', '63', '垫江县', '99');
INSERT INTO shop_areas VALUES ('89', '63', '武隆县', '99');
INSERT INTO shop_areas VALUES ('90', '63', '忠县', '99');
INSERT INTO shop_areas VALUES ('91', '63', '开县', '99');
INSERT INTO shop_areas VALUES ('92', '63', '云阳县', '99');
INSERT INTO shop_areas VALUES ('93', '63', '奉节县', '99');
INSERT INTO shop_areas VALUES ('94', '63', '巫山县', '99');
INSERT INTO shop_areas VALUES ('95', '63', '巫溪县', '99');
INSERT INTO shop_areas VALUES ('96', '63', '石柱土家族自治县', '99');
INSERT INTO shop_areas VALUES ('97', '63', '秀山土家族苗族自治县', '99');
INSERT INTO shop_areas VALUES ('98', '63', '酉阳土家族苗族自治县', '99');
INSERT INTO shop_areas VALUES ('99', '63', '彭水苗族土家族自治县', '99');
INSERT INTO shop_areas VALUES ('100', '63', '江津市', '99');
INSERT INTO shop_areas VALUES ('101', '63', '合川市', '99');
INSERT INTO shop_areas VALUES ('102', '63', '永川市', '99');
INSERT INTO shop_areas VALUES ('103', '63', '南川市', '99');
INSERT INTO shop_areas VALUES ('104', '0', '安徽', '99');
INSERT INTO shop_areas VALUES ('105', '104', '合肥市', '99');
INSERT INTO shop_areas VALUES ('106', '105', '瑶海区', '99');
INSERT INTO shop_areas VALUES ('107', '105', '庐阳区', '99');
INSERT INTO shop_areas VALUES ('108', '105', '蜀山区', '99');
INSERT INTO shop_areas VALUES ('109', '105', '包河区', '99');
INSERT INTO shop_areas VALUES ('110', '105', '长丰县', '99');
INSERT INTO shop_areas VALUES ('111', '105', '肥东县', '99');
INSERT INTO shop_areas VALUES ('112', '105', '肥西县', '99');
INSERT INTO shop_areas VALUES ('113', '104', '安庆市', '99');
INSERT INTO shop_areas VALUES ('114', '113', '迎江区', '99');
INSERT INTO shop_areas VALUES ('115', '113', '大观区', '99');
INSERT INTO shop_areas VALUES ('116', '113', '郊区', '99');
INSERT INTO shop_areas VALUES ('117', '113', '怀宁县', '99');
INSERT INTO shop_areas VALUES ('118', '113', '枞阳县', '99');
INSERT INTO shop_areas VALUES ('119', '113', '潜山县', '99');
INSERT INTO shop_areas VALUES ('120', '113', '太湖县', '99');
INSERT INTO shop_areas VALUES ('121', '113', '宿松县', '99');
INSERT INTO shop_areas VALUES ('122', '113', '望江县', '99');
INSERT INTO shop_areas VALUES ('123', '113', '岳西县', '99');
INSERT INTO shop_areas VALUES ('124', '113', '桐城市', '99');
INSERT INTO shop_areas VALUES ('125', '104', '蚌埠市', '99');
INSERT INTO shop_areas VALUES ('126', '125', '龙子湖区', '99');
INSERT INTO shop_areas VALUES ('127', '125', '蚌山区', '99');
INSERT INTO shop_areas VALUES ('128', '125', '禹会区', '99');
INSERT INTO shop_areas VALUES ('129', '125', '淮上区', '99');
INSERT INTO shop_areas VALUES ('130', '125', '怀远县', '99');
INSERT INTO shop_areas VALUES ('131', '125', '五河县', '99');
INSERT INTO shop_areas VALUES ('132', '125', '固镇县', '99');
INSERT INTO shop_areas VALUES ('133', '104', '亳州市', '99');
INSERT INTO shop_areas VALUES ('134', '133', '谯城区', '99');
INSERT INTO shop_areas VALUES ('135', '133', '涡阳县', '99');
INSERT INTO shop_areas VALUES ('136', '133', '蒙城县', '99');
INSERT INTO shop_areas VALUES ('137', '133', '利辛县', '99');
INSERT INTO shop_areas VALUES ('138', '104', '巢湖市', '99');
INSERT INTO shop_areas VALUES ('139', '138', '居巢区', '99');
INSERT INTO shop_areas VALUES ('140', '138', '庐江县', '99');
INSERT INTO shop_areas VALUES ('141', '138', '无为县', '99');
INSERT INTO shop_areas VALUES ('142', '138', '含山县', '99');
INSERT INTO shop_areas VALUES ('143', '138', '和县', '99');
INSERT INTO shop_areas VALUES ('144', '104', '池州市', '99');
INSERT INTO shop_areas VALUES ('145', '144', '贵池区', '99');
INSERT INTO shop_areas VALUES ('146', '144', '东至县', '99');
INSERT INTO shop_areas VALUES ('147', '144', '石台县', '99');
INSERT INTO shop_areas VALUES ('148', '144', '青阳县', '99');
INSERT INTO shop_areas VALUES ('149', '104', '滁州市', '99');
INSERT INTO shop_areas VALUES ('150', '149', '琅琊区', '99');
INSERT INTO shop_areas VALUES ('151', '149', '南谯区', '99');
INSERT INTO shop_areas VALUES ('152', '149', '来安县', '99');
INSERT INTO shop_areas VALUES ('153', '149', '全椒县', '99');
INSERT INTO shop_areas VALUES ('154', '149', '定远县', '99');
INSERT INTO shop_areas VALUES ('155', '149', '凤阳县', '99');
INSERT INTO shop_areas VALUES ('156', '149', '天长市', '99');
INSERT INTO shop_areas VALUES ('157', '149', '明光市', '99');
INSERT INTO shop_areas VALUES ('158', '104', '阜阳市', '99');
INSERT INTO shop_areas VALUES ('159', '158', '颍州区', '99');
INSERT INTO shop_areas VALUES ('160', '158', '颍东区', '99');
INSERT INTO shop_areas VALUES ('161', '158', '颍泉区', '99');
INSERT INTO shop_areas VALUES ('162', '158', '临泉县', '99');
INSERT INTO shop_areas VALUES ('163', '158', '太和县', '99');
INSERT INTO shop_areas VALUES ('164', '158', '阜南县', '99');
INSERT INTO shop_areas VALUES ('165', '158', '颍上县', '99');
INSERT INTO shop_areas VALUES ('166', '158', '界首市', '99');
INSERT INTO shop_areas VALUES ('167', '104', '淮北市', '99');
INSERT INTO shop_areas VALUES ('168', '167', '杜集区', '99');
INSERT INTO shop_areas VALUES ('169', '167', '相山区', '99');
INSERT INTO shop_areas VALUES ('170', '167', '烈山区', '99');
INSERT INTO shop_areas VALUES ('171', '167', '濉溪县', '99');
INSERT INTO shop_areas VALUES ('172', '104', '淮南市', '99');
INSERT INTO shop_areas VALUES ('173', '172', '大通区', '99');
INSERT INTO shop_areas VALUES ('174', '172', '田家庵区', '99');
INSERT INTO shop_areas VALUES ('175', '172', '谢家集区', '99');
INSERT INTO shop_areas VALUES ('176', '172', '八公山区', '99');
INSERT INTO shop_areas VALUES ('177', '172', '潘集区', '99');
INSERT INTO shop_areas VALUES ('178', '172', '凤台县', '99');
INSERT INTO shop_areas VALUES ('179', '104', '黄山市', '99');
INSERT INTO shop_areas VALUES ('180', '179', '屯溪区', '99');
INSERT INTO shop_areas VALUES ('181', '179', '黄山区', '99');
INSERT INTO shop_areas VALUES ('182', '179', '徽州区', '99');
INSERT INTO shop_areas VALUES ('183', '179', '歙县', '99');
INSERT INTO shop_areas VALUES ('184', '179', '休宁县', '99');
INSERT INTO shop_areas VALUES ('185', '179', '黟县', '99');
INSERT INTO shop_areas VALUES ('186', '179', '祁门县', '99');
INSERT INTO shop_areas VALUES ('187', '104', '六安市', '99');
INSERT INTO shop_areas VALUES ('188', '187', '金安区', '99');
INSERT INTO shop_areas VALUES ('189', '187', '裕安区', '99');
INSERT INTO shop_areas VALUES ('190', '187', '寿县', '99');
INSERT INTO shop_areas VALUES ('191', '187', '霍邱县', '99');
INSERT INTO shop_areas VALUES ('192', '187', '舒城县', '99');
INSERT INTO shop_areas VALUES ('193', '187', '金寨县', '99');
INSERT INTO shop_areas VALUES ('194', '187', '霍山县', '99');
INSERT INTO shop_areas VALUES ('195', '104', '马鞍山市', '99');
INSERT INTO shop_areas VALUES ('196', '195', '金家庄区', '99');
INSERT INTO shop_areas VALUES ('197', '195', '花山区', '99');
INSERT INTO shop_areas VALUES ('198', '195', '雨山区', '99');
INSERT INTO shop_areas VALUES ('199', '195', '当涂县', '99');
INSERT INTO shop_areas VALUES ('200', '104', '宿州市', '99');
INSERT INTO shop_areas VALUES ('201', '200', '墉桥区', '99');
INSERT INTO shop_areas VALUES ('202', '200', '砀山县', '99');
INSERT INTO shop_areas VALUES ('203', '200', '萧县', '99');
INSERT INTO shop_areas VALUES ('204', '200', '灵璧县', '99');
INSERT INTO shop_areas VALUES ('205', '200', '泗县', '99');
INSERT INTO shop_areas VALUES ('206', '104', '铜陵市', '99');
INSERT INTO shop_areas VALUES ('207', '206', '铜官山区', '99');
INSERT INTO shop_areas VALUES ('208', '206', '狮子山区', '99');
INSERT INTO shop_areas VALUES ('209', '206', '郊区', '99');
INSERT INTO shop_areas VALUES ('210', '206', '铜陵县', '99');
INSERT INTO shop_areas VALUES ('211', '104', '芜湖市', '99');
INSERT INTO shop_areas VALUES ('212', '211', '镜湖区', '99');
INSERT INTO shop_areas VALUES ('213', '211', '马塘区', '99');
INSERT INTO shop_areas VALUES ('214', '211', '新芜区', '99');
INSERT INTO shop_areas VALUES ('215', '211', '鸠江区', '99');
INSERT INTO shop_areas VALUES ('216', '211', '芜湖县', '99');
INSERT INTO shop_areas VALUES ('217', '211', '繁昌县', '99');
INSERT INTO shop_areas VALUES ('218', '211', '南陵县', '99');
INSERT INTO shop_areas VALUES ('219', '104', '宣城市', '99');
INSERT INTO shop_areas VALUES ('220', '219', '宣州区', '99');
INSERT INTO shop_areas VALUES ('221', '219', '郎溪县', '99');
INSERT INTO shop_areas VALUES ('222', '219', '广德县', '99');
INSERT INTO shop_areas VALUES ('223', '219', '泾县', '99');
INSERT INTO shop_areas VALUES ('224', '219', '绩溪县', '99');
INSERT INTO shop_areas VALUES ('225', '219', '旌德县', '99');
INSERT INTO shop_areas VALUES ('226', '219', '宁国市', '99');
INSERT INTO shop_areas VALUES ('227', '0', '福建', '99');
INSERT INTO shop_areas VALUES ('228', '227', '福州市', '99');
INSERT INTO shop_areas VALUES ('229', '228', '鼓楼区', '99');
INSERT INTO shop_areas VALUES ('230', '228', '台江区', '99');
INSERT INTO shop_areas VALUES ('231', '228', '仓山区', '99');
INSERT INTO shop_areas VALUES ('232', '228', '马尾区', '99');
INSERT INTO shop_areas VALUES ('233', '228', '晋安区', '99');
INSERT INTO shop_areas VALUES ('234', '228', '闽侯县', '99');
INSERT INTO shop_areas VALUES ('235', '228', '连江县', '99');
INSERT INTO shop_areas VALUES ('236', '228', '罗源县', '99');
INSERT INTO shop_areas VALUES ('237', '228', '闽清县', '99');
INSERT INTO shop_areas VALUES ('238', '228', '永泰县', '99');
INSERT INTO shop_areas VALUES ('239', '228', '平潭县', '99');
INSERT INTO shop_areas VALUES ('240', '228', '福清市', '99');
INSERT INTO shop_areas VALUES ('241', '228', '长乐市', '99');
INSERT INTO shop_areas VALUES ('242', '227', '龙岩市', '99');
INSERT INTO shop_areas VALUES ('243', '242', '新罗区', '99');
INSERT INTO shop_areas VALUES ('244', '242', '长汀县', '99');
INSERT INTO shop_areas VALUES ('245', '242', '永定县', '99');
INSERT INTO shop_areas VALUES ('246', '242', '上杭县', '99');
INSERT INTO shop_areas VALUES ('247', '242', '武平县', '99');
INSERT INTO shop_areas VALUES ('248', '242', '连城县', '99');
INSERT INTO shop_areas VALUES ('249', '242', '漳平市', '99');
INSERT INTO shop_areas VALUES ('250', '227', '南平市', '99');
INSERT INTO shop_areas VALUES ('251', '250', '延平区', '99');
INSERT INTO shop_areas VALUES ('252', '250', '顺昌县', '99');
INSERT INTO shop_areas VALUES ('253', '250', '浦城县', '99');
INSERT INTO shop_areas VALUES ('254', '250', '光泽县', '99');
INSERT INTO shop_areas VALUES ('255', '250', '松溪县', '99');
INSERT INTO shop_areas VALUES ('256', '250', '政和县', '99');
INSERT INTO shop_areas VALUES ('257', '250', '邵武市', '99');
INSERT INTO shop_areas VALUES ('258', '250', '武夷山市', '99');
INSERT INTO shop_areas VALUES ('259', '250', '建瓯市', '99');
INSERT INTO shop_areas VALUES ('260', '250', '建阳市', '99');
INSERT INTO shop_areas VALUES ('261', '227', '宁德市', '99');
INSERT INTO shop_areas VALUES ('262', '261', '蕉城区', '99');
INSERT INTO shop_areas VALUES ('263', '261', '霞浦县', '99');
INSERT INTO shop_areas VALUES ('264', '261', '古田县', '99');
INSERT INTO shop_areas VALUES ('265', '261', '屏南县', '99');
INSERT INTO shop_areas VALUES ('266', '261', '寿宁县', '99');
INSERT INTO shop_areas VALUES ('267', '261', '周宁县', '99');
INSERT INTO shop_areas VALUES ('268', '261', '柘荣县', '99');
INSERT INTO shop_areas VALUES ('269', '261', '福安市', '99');
INSERT INTO shop_areas VALUES ('270', '261', '福鼎市', '99');
INSERT INTO shop_areas VALUES ('271', '227', '莆田市', '99');
INSERT INTO shop_areas VALUES ('272', '271', '城厢区', '99');
INSERT INTO shop_areas VALUES ('273', '271', '涵江区', '99');
INSERT INTO shop_areas VALUES ('274', '271', '荔城区', '99');
INSERT INTO shop_areas VALUES ('275', '271', '秀屿区', '99');
INSERT INTO shop_areas VALUES ('276', '271', '仙游县', '99');
INSERT INTO shop_areas VALUES ('277', '227', '泉州市', '99');
INSERT INTO shop_areas VALUES ('278', '277', '鲤城区', '99');
INSERT INTO shop_areas VALUES ('279', '277', '丰泽区', '99');
INSERT INTO shop_areas VALUES ('280', '277', '洛江区', '99');
INSERT INTO shop_areas VALUES ('281', '277', '泉港区', '99');
INSERT INTO shop_areas VALUES ('282', '277', '惠安县', '99');
INSERT INTO shop_areas VALUES ('283', '277', '安溪县', '99');
INSERT INTO shop_areas VALUES ('284', '277', '永春县', '99');
INSERT INTO shop_areas VALUES ('285', '277', '德化县', '99');
INSERT INTO shop_areas VALUES ('286', '277', '金门县', '99');
INSERT INTO shop_areas VALUES ('287', '277', '石狮市', '99');
INSERT INTO shop_areas VALUES ('288', '277', '晋江市', '99');
INSERT INTO shop_areas VALUES ('289', '277', '南安市', '99');
INSERT INTO shop_areas VALUES ('290', '227', '三明市', '99');
INSERT INTO shop_areas VALUES ('291', '290', '梅列区', '99');
INSERT INTO shop_areas VALUES ('292', '290', '三元区', '99');
INSERT INTO shop_areas VALUES ('293', '290', '明溪县', '99');
INSERT INTO shop_areas VALUES ('294', '290', '清流县', '99');
INSERT INTO shop_areas VALUES ('295', '290', '宁化县', '99');
INSERT INTO shop_areas VALUES ('296', '290', '大田县', '99');
INSERT INTO shop_areas VALUES ('297', '290', '尤溪县', '99');
INSERT INTO shop_areas VALUES ('298', '290', '沙县', '99');
INSERT INTO shop_areas VALUES ('299', '290', '将乐县', '99');
INSERT INTO shop_areas VALUES ('300', '290', '泰宁县', '99');
INSERT INTO shop_areas VALUES ('301', '290', '建宁县', '99');
INSERT INTO shop_areas VALUES ('302', '290', '永安市', '99');
INSERT INTO shop_areas VALUES ('303', '227', '厦门市', '99');
INSERT INTO shop_areas VALUES ('304', '303', '思明区', '99');
INSERT INTO shop_areas VALUES ('305', '303', '海沧区', '99');
INSERT INTO shop_areas VALUES ('306', '303', '湖里区', '99');
INSERT INTO shop_areas VALUES ('307', '303', '集美区', '99');
INSERT INTO shop_areas VALUES ('308', '303', '同安区', '99');
INSERT INTO shop_areas VALUES ('309', '303', '翔安区', '99');
INSERT INTO shop_areas VALUES ('310', '227', '漳州市', '99');
INSERT INTO shop_areas VALUES ('311', '310', '芗城区', '99');
INSERT INTO shop_areas VALUES ('312', '310', '龙文区', '99');
INSERT INTO shop_areas VALUES ('313', '310', '云霄县', '99');
INSERT INTO shop_areas VALUES ('314', '310', '漳浦县', '99');
INSERT INTO shop_areas VALUES ('315', '310', '诏安县', '99');
INSERT INTO shop_areas VALUES ('316', '310', '长泰县', '99');
INSERT INTO shop_areas VALUES ('317', '310', '东山县', '99');
INSERT INTO shop_areas VALUES ('318', '310', '南靖县', '99');
INSERT INTO shop_areas VALUES ('319', '310', '平和县', '99');
INSERT INTO shop_areas VALUES ('320', '310', '华安县', '99');
INSERT INTO shop_areas VALUES ('321', '310', '龙海市', '99');
INSERT INTO shop_areas VALUES ('322', '0', '甘肃', '99');
INSERT INTO shop_areas VALUES ('323', '322', '兰州市', '99');
INSERT INTO shop_areas VALUES ('324', '323', '城关区', '99');
INSERT INTO shop_areas VALUES ('325', '323', '七里河区', '99');
INSERT INTO shop_areas VALUES ('326', '323', '西固区', '99');
INSERT INTO shop_areas VALUES ('327', '323', '安宁区', '99');
INSERT INTO shop_areas VALUES ('328', '323', '红古区', '99');
INSERT INTO shop_areas VALUES ('329', '323', '永登县', '99');
INSERT INTO shop_areas VALUES ('330', '323', '皋兰县', '99');
INSERT INTO shop_areas VALUES ('331', '323', '榆中县', '99');
INSERT INTO shop_areas VALUES ('332', '322', '白银市', '99');
INSERT INTO shop_areas VALUES ('333', '332', '白银区', '99');
INSERT INTO shop_areas VALUES ('334', '332', '平川区', '99');
INSERT INTO shop_areas VALUES ('335', '332', '靖远县', '99');
INSERT INTO shop_areas VALUES ('336', '332', '会宁县', '99');
INSERT INTO shop_areas VALUES ('337', '332', '景泰县', '99');
INSERT INTO shop_areas VALUES ('338', '322', '定西市', '99');
INSERT INTO shop_areas VALUES ('339', '338', '安定区', '99');
INSERT INTO shop_areas VALUES ('340', '338', '通渭县', '99');
INSERT INTO shop_areas VALUES ('341', '338', '陇西县', '99');
INSERT INTO shop_areas VALUES ('342', '338', '渭源县', '99');
INSERT INTO shop_areas VALUES ('343', '338', '临洮县', '99');
INSERT INTO shop_areas VALUES ('344', '338', '漳县', '99');
INSERT INTO shop_areas VALUES ('345', '338', '岷县', '99');
INSERT INTO shop_areas VALUES ('346', '322', '甘南藏族自治州', '99');
INSERT INTO shop_areas VALUES ('347', '346', '合作市', '99');
INSERT INTO shop_areas VALUES ('348', '346', '临潭县', '99');
INSERT INTO shop_areas VALUES ('349', '346', '卓尼县', '99');
INSERT INTO shop_areas VALUES ('350', '346', '舟曲县', '99');
INSERT INTO shop_areas VALUES ('351', '346', '迭部县', '99');
INSERT INTO shop_areas VALUES ('352', '346', '玛曲县', '99');
INSERT INTO shop_areas VALUES ('353', '346', '碌曲县', '99');
INSERT INTO shop_areas VALUES ('354', '346', '夏河县', '99');
INSERT INTO shop_areas VALUES ('355', '322', '嘉峪关市', '99');
INSERT INTO shop_areas VALUES ('356', '322', '金昌市', '99');
INSERT INTO shop_areas VALUES ('357', '356', '金川区', '99');
INSERT INTO shop_areas VALUES ('358', '356', '永昌县', '99');
INSERT INTO shop_areas VALUES ('359', '322', '酒泉市', '99');
INSERT INTO shop_areas VALUES ('360', '359', '肃州区', '99');
INSERT INTO shop_areas VALUES ('361', '359', '金塔县', '99');
INSERT INTO shop_areas VALUES ('362', '359', '安西县', '99');
INSERT INTO shop_areas VALUES ('363', '359', '肃北蒙古族自治县', '99');
INSERT INTO shop_areas VALUES ('364', '359', '阿克塞哈萨克族自治县', '99');
INSERT INTO shop_areas VALUES ('365', '359', '玉门市', '99');
INSERT INTO shop_areas VALUES ('366', '359', '敦煌市', '99');
INSERT INTO shop_areas VALUES ('367', '322', '临夏回族自治州', '99');
INSERT INTO shop_areas VALUES ('368', '367', '临夏市', '99');
INSERT INTO shop_areas VALUES ('369', '367', '临夏县', '99');
INSERT INTO shop_areas VALUES ('370', '367', '康乐县', '99');
INSERT INTO shop_areas VALUES ('371', '367', '永靖县', '99');
INSERT INTO shop_areas VALUES ('372', '367', '广河县', '99');
INSERT INTO shop_areas VALUES ('373', '367', '和政县', '99');
INSERT INTO shop_areas VALUES ('374', '367', '东乡族自治县', '99');
INSERT INTO shop_areas VALUES ('375', '367', '积石山保安族东乡族撒拉族自治县', '99');
INSERT INTO shop_areas VALUES ('376', '322', '陇南市', '99');
INSERT INTO shop_areas VALUES ('377', '376', '武都区', '99');
INSERT INTO shop_areas VALUES ('378', '376', '成县', '99');
INSERT INTO shop_areas VALUES ('379', '376', '文县', '99');
INSERT INTO shop_areas VALUES ('380', '376', '宕昌县', '99');
INSERT INTO shop_areas VALUES ('381', '376', '康县', '99');
INSERT INTO shop_areas VALUES ('382', '376', '西和县', '99');
INSERT INTO shop_areas VALUES ('383', '376', '礼县', '99');
INSERT INTO shop_areas VALUES ('384', '376', '徽县', '99');
INSERT INTO shop_areas VALUES ('385', '376', '两当县', '99');
INSERT INTO shop_areas VALUES ('386', '322', '平凉市', '99');
INSERT INTO shop_areas VALUES ('387', '386', '崆峒区', '99');
INSERT INTO shop_areas VALUES ('388', '386', '泾川县', '99');
INSERT INTO shop_areas VALUES ('389', '386', '灵台县', '99');
INSERT INTO shop_areas VALUES ('390', '386', '崇信县', '99');
INSERT INTO shop_areas VALUES ('391', '386', '华亭县', '99');
INSERT INTO shop_areas VALUES ('392', '386', '庄浪县', '99');
INSERT INTO shop_areas VALUES ('393', '386', '静宁县', '99');
INSERT INTO shop_areas VALUES ('394', '322', '庆阳市', '99');
INSERT INTO shop_areas VALUES ('395', '394', '西峰区', '99');
INSERT INTO shop_areas VALUES ('396', '394', '庆城县', '99');
INSERT INTO shop_areas VALUES ('397', '394', '环县', '99');
INSERT INTO shop_areas VALUES ('398', '394', '华池县', '99');
INSERT INTO shop_areas VALUES ('399', '394', '合水县', '99');
INSERT INTO shop_areas VALUES ('400', '394', '正宁县', '99');
INSERT INTO shop_areas VALUES ('401', '394', '宁县', '99');
INSERT INTO shop_areas VALUES ('402', '394', '镇原县', '99');
INSERT INTO shop_areas VALUES ('403', '322', '天水市', '99');
INSERT INTO shop_areas VALUES ('404', '403', '秦城区', '99');
INSERT INTO shop_areas VALUES ('405', '403', '北道区', '99');
INSERT INTO shop_areas VALUES ('406', '403', '清水县', '99');
INSERT INTO shop_areas VALUES ('407', '403', '秦安县', '99');
INSERT INTO shop_areas VALUES ('408', '403', '甘谷县', '99');
INSERT INTO shop_areas VALUES ('409', '403', '武山县', '99');
INSERT INTO shop_areas VALUES ('410', '403', '张家川回族自治县', '99');
INSERT INTO shop_areas VALUES ('411', '322', '武威市', '99');
INSERT INTO shop_areas VALUES ('412', '411', '凉州区', '99');
INSERT INTO shop_areas VALUES ('413', '411', '民勤县', '99');
INSERT INTO shop_areas VALUES ('414', '411', '古浪县', '99');
INSERT INTO shop_areas VALUES ('415', '411', '天祝藏族自治县', '99');
INSERT INTO shop_areas VALUES ('416', '322', '张掖市', '99');
INSERT INTO shop_areas VALUES ('417', '416', '甘州区', '99');
INSERT INTO shop_areas VALUES ('418', '416', '肃南裕固族自治县', '99');
INSERT INTO shop_areas VALUES ('419', '416', '民乐县', '99');
INSERT INTO shop_areas VALUES ('420', '416', '临泽县', '99');
INSERT INTO shop_areas VALUES ('421', '416', '高台县', '99');
INSERT INTO shop_areas VALUES ('422', '416', '山丹县', '99');
INSERT INTO shop_areas VALUES ('423', '0', '广东', '99');
INSERT INTO shop_areas VALUES ('424', '423', '广州市', '99');
INSERT INTO shop_areas VALUES ('425', '424', '东山区', '99');
INSERT INTO shop_areas VALUES ('426', '424', '荔湾区', '99');
INSERT INTO shop_areas VALUES ('427', '424', '越秀区', '99');
INSERT INTO shop_areas VALUES ('428', '424', '海珠区', '99');
INSERT INTO shop_areas VALUES ('429', '424', '天河区', '99');
INSERT INTO shop_areas VALUES ('430', '424', '芳村区', '99');
INSERT INTO shop_areas VALUES ('431', '424', '白云区', '99');
INSERT INTO shop_areas VALUES ('432', '424', '黄埔区', '99');
INSERT INTO shop_areas VALUES ('433', '424', '番禺区', '99');
INSERT INTO shop_areas VALUES ('434', '424', '花都区', '99');
INSERT INTO shop_areas VALUES ('435', '424', '增城市', '99');
INSERT INTO shop_areas VALUES ('436', '424', '从化市', '99');
INSERT INTO shop_areas VALUES ('437', '423', '潮州市', '99');
INSERT INTO shop_areas VALUES ('438', '437', '湘桥区', '99');
INSERT INTO shop_areas VALUES ('439', '437', '潮安县', '99');
INSERT INTO shop_areas VALUES ('440', '437', '饶平县', '99');
INSERT INTO shop_areas VALUES ('441', '423', '东莞市', '99');
INSERT INTO shop_areas VALUES ('442', '423', '佛山市', '99');
INSERT INTO shop_areas VALUES ('443', '442', '禅城区', '99');
INSERT INTO shop_areas VALUES ('444', '442', '南海区', '99');
INSERT INTO shop_areas VALUES ('445', '442', '顺德区', '99');
INSERT INTO shop_areas VALUES ('446', '442', '三水区', '99');
INSERT INTO shop_areas VALUES ('447', '442', '高明区', '99');
INSERT INTO shop_areas VALUES ('448', '423', '河源市', '99');
INSERT INTO shop_areas VALUES ('449', '448', '源城区', '99');
INSERT INTO shop_areas VALUES ('450', '448', '紫金县', '99');
INSERT INTO shop_areas VALUES ('451', '448', '龙川县', '99');
INSERT INTO shop_areas VALUES ('452', '448', '连平县', '99');
INSERT INTO shop_areas VALUES ('453', '448', '和平县', '99');
INSERT INTO shop_areas VALUES ('454', '448', '东源县', '99');
INSERT INTO shop_areas VALUES ('455', '423', '惠州市', '99');
INSERT INTO shop_areas VALUES ('456', '455', '惠城区', '99');
INSERT INTO shop_areas VALUES ('457', '455', '惠阳区', '99');
INSERT INTO shop_areas VALUES ('458', '455', '博罗县', '99');
INSERT INTO shop_areas VALUES ('459', '455', '惠东县', '99');
INSERT INTO shop_areas VALUES ('460', '455', '龙门县', '99');
INSERT INTO shop_areas VALUES ('461', '423', '江门市', '99');
INSERT INTO shop_areas VALUES ('462', '461', '蓬江区', '99');
INSERT INTO shop_areas VALUES ('463', '461', '江海区', '99');
INSERT INTO shop_areas VALUES ('464', '461', '新会区', '99');
INSERT INTO shop_areas VALUES ('465', '461', '台山市', '99');
INSERT INTO shop_areas VALUES ('466', '461', '开平市', '99');
INSERT INTO shop_areas VALUES ('467', '461', '鹤山市', '99');
INSERT INTO shop_areas VALUES ('468', '461', '恩平市', '99');
INSERT INTO shop_areas VALUES ('469', '423', '揭阳市', '99');
INSERT INTO shop_areas VALUES ('470', '469', '榕城区', '99');
INSERT INTO shop_areas VALUES ('471', '469', '揭东县', '99');
INSERT INTO shop_areas VALUES ('472', '469', '揭西县', '99');
INSERT INTO shop_areas VALUES ('473', '469', '惠来县', '99');
INSERT INTO shop_areas VALUES ('474', '469', '普宁市', '99');
INSERT INTO shop_areas VALUES ('475', '423', '茂名市', '99');
INSERT INTO shop_areas VALUES ('476', '475', '茂南区', '99');
INSERT INTO shop_areas VALUES ('477', '475', '茂港区', '99');
INSERT INTO shop_areas VALUES ('478', '475', '电白县', '99');
INSERT INTO shop_areas VALUES ('479', '475', '高州市', '99');
INSERT INTO shop_areas VALUES ('480', '475', '化州市', '99');
INSERT INTO shop_areas VALUES ('481', '475', '信宜市', '99');
INSERT INTO shop_areas VALUES ('482', '423', '梅江区', '99');
INSERT INTO shop_areas VALUES ('483', '423', '梅州市', '99');
INSERT INTO shop_areas VALUES ('484', '483', '梅县', '99');
INSERT INTO shop_areas VALUES ('485', '483', '大埔县', '99');
INSERT INTO shop_areas VALUES ('486', '483', '丰顺县', '99');
INSERT INTO shop_areas VALUES ('487', '483', '五华县', '99');
INSERT INTO shop_areas VALUES ('488', '483', '平远县', '99');
INSERT INTO shop_areas VALUES ('489', '483', '蕉岭县', '99');
INSERT INTO shop_areas VALUES ('490', '483', '兴宁市', '99');
INSERT INTO shop_areas VALUES ('491', '423', '清远市', '99');
INSERT INTO shop_areas VALUES ('492', '491', '清城区', '99');
INSERT INTO shop_areas VALUES ('493', '491', '佛冈县', '99');
INSERT INTO shop_areas VALUES ('494', '491', '阳山县', '99');
INSERT INTO shop_areas VALUES ('495', '491', '连山壮族瑶族自治县', '99');
INSERT INTO shop_areas VALUES ('496', '491', '连南瑶族自治县', '99');
INSERT INTO shop_areas VALUES ('497', '491', '清新县', '99');
INSERT INTO shop_areas VALUES ('498', '491', '英德市', '99');
INSERT INTO shop_areas VALUES ('499', '491', '连州市', '99');
INSERT INTO shop_areas VALUES ('500', '423', '汕头市', '99');
INSERT INTO shop_areas VALUES ('501', '500', '龙湖区', '99');
INSERT INTO shop_areas VALUES ('502', '500', '金平区', '99');
INSERT INTO shop_areas VALUES ('503', '500', '濠江区', '99');
INSERT INTO shop_areas VALUES ('504', '500', '潮阳区', '99');
INSERT INTO shop_areas VALUES ('505', '500', '潮南区', '99');
INSERT INTO shop_areas VALUES ('506', '500', '澄海区', '99');
INSERT INTO shop_areas VALUES ('507', '500', '南澳县', '99');
INSERT INTO shop_areas VALUES ('508', '423', '汕尾市', '99');
INSERT INTO shop_areas VALUES ('509', '508', '城区', '99');
INSERT INTO shop_areas VALUES ('510', '508', '海丰县', '99');
INSERT INTO shop_areas VALUES ('511', '508', '陆河县', '99');
INSERT INTO shop_areas VALUES ('512', '508', '陆丰市', '99');
INSERT INTO shop_areas VALUES ('513', '423', '韶关市', '99');
INSERT INTO shop_areas VALUES ('514', '513', '武江区', '99');
INSERT INTO shop_areas VALUES ('515', '513', '浈江区', '99');
INSERT INTO shop_areas VALUES ('516', '513', '曲江区', '99');
INSERT INTO shop_areas VALUES ('517', '513', '始兴县', '99');
INSERT INTO shop_areas VALUES ('518', '513', '仁化县', '99');
INSERT INTO shop_areas VALUES ('519', '513', '翁源县', '99');
INSERT INTO shop_areas VALUES ('520', '513', '乳源瑶族自治县', '99');
INSERT INTO shop_areas VALUES ('521', '513', '新丰县', '99');
INSERT INTO shop_areas VALUES ('522', '513', '乐昌市', '99');
INSERT INTO shop_areas VALUES ('523', '513', '南雄市', '99');
INSERT INTO shop_areas VALUES ('524', '423', '深圳市', '99');
INSERT INTO shop_areas VALUES ('525', '524', '罗湖区', '99');
INSERT INTO shop_areas VALUES ('526', '524', '福田区', '99');
INSERT INTO shop_areas VALUES ('527', '524', '南山区', '99');
INSERT INTO shop_areas VALUES ('528', '524', '宝安区', '99');
INSERT INTO shop_areas VALUES ('529', '524', '龙岗区', '99');
INSERT INTO shop_areas VALUES ('530', '524', '盐田区', '99');
INSERT INTO shop_areas VALUES ('531', '423', '阳江市', '99');
INSERT INTO shop_areas VALUES ('532', '531', '江城区', '99');
INSERT INTO shop_areas VALUES ('533', '531', '阳西县', '99');
INSERT INTO shop_areas VALUES ('534', '531', '阳东县', '99');
INSERT INTO shop_areas VALUES ('535', '531', '阳春市', '99');
INSERT INTO shop_areas VALUES ('536', '423', '云浮市', '99');
INSERT INTO shop_areas VALUES ('537', '536', '云城区', '99');
INSERT INTO shop_areas VALUES ('538', '536', '新兴县', '99');
INSERT INTO shop_areas VALUES ('539', '536', '郁南县', '99');
INSERT INTO shop_areas VALUES ('540', '536', '云安县', '99');
INSERT INTO shop_areas VALUES ('541', '536', '罗定市', '99');
INSERT INTO shop_areas VALUES ('542', '423', '湛江市', '99');
INSERT INTO shop_areas VALUES ('543', '542', '赤坎区', '99');
INSERT INTO shop_areas VALUES ('544', '542', '霞山区', '99');
INSERT INTO shop_areas VALUES ('545', '542', '坡头区', '99');
INSERT INTO shop_areas VALUES ('546', '542', '麻章区', '99');
INSERT INTO shop_areas VALUES ('547', '542', '遂溪县', '99');
INSERT INTO shop_areas VALUES ('548', '542', '徐闻县', '99');
INSERT INTO shop_areas VALUES ('549', '542', '廉江市', '99');
INSERT INTO shop_areas VALUES ('550', '542', '雷州市', '99');
INSERT INTO shop_areas VALUES ('551', '542', '吴川市', '99');
INSERT INTO shop_areas VALUES ('552', '423', '肇庆市', '99');
INSERT INTO shop_areas VALUES ('553', '552', '端州区', '99');
INSERT INTO shop_areas VALUES ('554', '552', '鼎湖区', '99');
INSERT INTO shop_areas VALUES ('555', '552', '广宁县', '99');
INSERT INTO shop_areas VALUES ('556', '552', '怀集县', '99');
INSERT INTO shop_areas VALUES ('557', '552', '封开县', '99');
INSERT INTO shop_areas VALUES ('558', '552', '德庆县', '99');
INSERT INTO shop_areas VALUES ('559', '552', '高要市', '99');
INSERT INTO shop_areas VALUES ('560', '552', '四会市', '99');
INSERT INTO shop_areas VALUES ('561', '423', '中山市', '99');
INSERT INTO shop_areas VALUES ('562', '423', '珠海市', '99');
INSERT INTO shop_areas VALUES ('563', '562', '香洲区', '99');
INSERT INTO shop_areas VALUES ('564', '562', '斗门区', '99');
INSERT INTO shop_areas VALUES ('565', '562', '金湾区', '99');
INSERT INTO shop_areas VALUES ('566', '0', '广西', '99');
INSERT INTO shop_areas VALUES ('567', '566', '南宁市', '99');
INSERT INTO shop_areas VALUES ('568', '567', '兴宁区', '99');
INSERT INTO shop_areas VALUES ('569', '567', '青秀区', '99');
INSERT INTO shop_areas VALUES ('570', '567', '江南区', '99');
INSERT INTO shop_areas VALUES ('571', '567', '西乡塘区', '99');
INSERT INTO shop_areas VALUES ('572', '567', '良庆区', '99');
INSERT INTO shop_areas VALUES ('573', '567', '邕宁区', '99');
INSERT INTO shop_areas VALUES ('574', '567', '武鸣县', '99');
INSERT INTO shop_areas VALUES ('575', '567', '隆安县', '99');
INSERT INTO shop_areas VALUES ('576', '567', '马山县', '99');
INSERT INTO shop_areas VALUES ('577', '567', '上林县', '99');
INSERT INTO shop_areas VALUES ('578', '567', '宾阳县', '99');
INSERT INTO shop_areas VALUES ('579', '567', '横县', '99');
INSERT INTO shop_areas VALUES ('580', '566', '百色市', '99');
INSERT INTO shop_areas VALUES ('581', '580', '右江区', '99');
INSERT INTO shop_areas VALUES ('582', '580', '田阳县', '99');
INSERT INTO shop_areas VALUES ('583', '580', '田东县', '99');
INSERT INTO shop_areas VALUES ('584', '580', '平果县', '99');
INSERT INTO shop_areas VALUES ('585', '580', '德保县', '99');
INSERT INTO shop_areas VALUES ('586', '580', '靖西县', '99');
INSERT INTO shop_areas VALUES ('587', '580', '那坡县', '99');
INSERT INTO shop_areas VALUES ('588', '580', '凌云县', '99');
INSERT INTO shop_areas VALUES ('589', '580', '乐业县', '99');
INSERT INTO shop_areas VALUES ('590', '580', '田林县', '99');
INSERT INTO shop_areas VALUES ('591', '580', '西林县', '99');
INSERT INTO shop_areas VALUES ('592', '580', '隆林各族自治县', '99');
INSERT INTO shop_areas VALUES ('593', '566', '北海市', '99');
INSERT INTO shop_areas VALUES ('594', '593', '海城区', '99');
INSERT INTO shop_areas VALUES ('595', '593', '银海区', '99');
INSERT INTO shop_areas VALUES ('596', '593', '铁山港区', '99');
INSERT INTO shop_areas VALUES ('597', '593', '合浦县', '99');
INSERT INTO shop_areas VALUES ('598', '566', '崇左市', '99');
INSERT INTO shop_areas VALUES ('599', '598', '江洲区', '99');
INSERT INTO shop_areas VALUES ('600', '598', '扶绥县', '99');
INSERT INTO shop_areas VALUES ('601', '598', '宁明县', '99');
INSERT INTO shop_areas VALUES ('602', '598', '龙州县', '99');
INSERT INTO shop_areas VALUES ('603', '598', '大新县', '99');
INSERT INTO shop_areas VALUES ('604', '598', '天等县', '99');
INSERT INTO shop_areas VALUES ('605', '598', '凭祥市', '99');
INSERT INTO shop_areas VALUES ('606', '566', '防城港市', '99');
INSERT INTO shop_areas VALUES ('607', '606', '港口区', '99');
INSERT INTO shop_areas VALUES ('608', '606', '防城区', '99');
INSERT INTO shop_areas VALUES ('609', '606', '上思县', '99');
INSERT INTO shop_areas VALUES ('610', '606', '东兴市', '99');
INSERT INTO shop_areas VALUES ('611', '566', '贵港市', '99');
INSERT INTO shop_areas VALUES ('612', '611', '港北区', '99');
INSERT INTO shop_areas VALUES ('613', '611', '港南区', '99');
INSERT INTO shop_areas VALUES ('614', '611', '覃塘区', '99');
INSERT INTO shop_areas VALUES ('615', '611', '平南县', '99');
INSERT INTO shop_areas VALUES ('616', '611', '桂平市', '99');
INSERT INTO shop_areas VALUES ('617', '566', '桂林市', '99');
INSERT INTO shop_areas VALUES ('618', '617', '秀峰区', '99');
INSERT INTO shop_areas VALUES ('619', '617', '叠彩区', '99');
INSERT INTO shop_areas VALUES ('620', '617', '象山区', '99');
INSERT INTO shop_areas VALUES ('621', '617', '七星区', '99');
INSERT INTO shop_areas VALUES ('622', '617', '雁山区', '99');
INSERT INTO shop_areas VALUES ('623', '617', '阳朔县', '99');
INSERT INTO shop_areas VALUES ('624', '617', '临桂县', '99');
INSERT INTO shop_areas VALUES ('625', '617', '灵川县', '99');
INSERT INTO shop_areas VALUES ('626', '617', '全州县', '99');
INSERT INTO shop_areas VALUES ('627', '617', '兴安县', '99');
INSERT INTO shop_areas VALUES ('628', '617', '永福县', '99');
INSERT INTO shop_areas VALUES ('629', '617', '灌阳县', '99');
INSERT INTO shop_areas VALUES ('630', '617', '龙胜各族自治县', '99');
INSERT INTO shop_areas VALUES ('631', '617', '资源县', '99');
INSERT INTO shop_areas VALUES ('632', '617', '平乐县', '99');
INSERT INTO shop_areas VALUES ('633', '617', '荔蒲县', '99');
INSERT INTO shop_areas VALUES ('634', '617', '恭城瑶族自治县', '99');
INSERT INTO shop_areas VALUES ('635', '566', '河池市', '99');
INSERT INTO shop_areas VALUES ('636', '635', '金城江区', '99');
INSERT INTO shop_areas VALUES ('637', '635', '南丹县', '99');
INSERT INTO shop_areas VALUES ('638', '635', '天峨县', '99');
INSERT INTO shop_areas VALUES ('639', '635', '凤山县', '99');
INSERT INTO shop_areas VALUES ('640', '635', '东兰县', '99');
INSERT INTO shop_areas VALUES ('641', '635', '罗城仫佬族自治县', '99');
INSERT INTO shop_areas VALUES ('642', '635', '环江毛南族自治县', '99');
INSERT INTO shop_areas VALUES ('643', '635', '巴马瑶族自治县', '99');
INSERT INTO shop_areas VALUES ('644', '635', '都安瑶族自治县', '99');
INSERT INTO shop_areas VALUES ('645', '635', '大化瑶族自治县', '99');
INSERT INTO shop_areas VALUES ('646', '635', '宜州市', '99');
INSERT INTO shop_areas VALUES ('647', '566', '贺州市', '99');
INSERT INTO shop_areas VALUES ('648', '647', '八步区', '99');
INSERT INTO shop_areas VALUES ('649', '647', '昭平县', '99');
INSERT INTO shop_areas VALUES ('650', '647', '钟山县', '99');
INSERT INTO shop_areas VALUES ('651', '647', '富川瑶族自治县', '99');
INSERT INTO shop_areas VALUES ('652', '566', '来宾市', '99');
INSERT INTO shop_areas VALUES ('653', '652', '兴宾区', '99');
INSERT INTO shop_areas VALUES ('654', '652', '忻城县', '99');
INSERT INTO shop_areas VALUES ('655', '652', '象州县', '99');
INSERT INTO shop_areas VALUES ('656', '652', '武宣县', '99');
INSERT INTO shop_areas VALUES ('657', '652', '金秀瑶族自治县', '99');
INSERT INTO shop_areas VALUES ('658', '652', '合山市', '99');
INSERT INTO shop_areas VALUES ('659', '566', '柳州市', '99');
INSERT INTO shop_areas VALUES ('660', '659', '城中区', '99');
INSERT INTO shop_areas VALUES ('661', '659', '鱼峰区', '99');
INSERT INTO shop_areas VALUES ('662', '659', '柳南区', '99');
INSERT INTO shop_areas VALUES ('663', '659', '柳北区', '99');
INSERT INTO shop_areas VALUES ('664', '659', '柳江县', '99');
INSERT INTO shop_areas VALUES ('665', '659', '柳城县', '99');
INSERT INTO shop_areas VALUES ('666', '659', '鹿寨县', '99');
INSERT INTO shop_areas VALUES ('667', '659', '融安县', '99');
INSERT INTO shop_areas VALUES ('668', '659', '融水苗族自治县', '99');
INSERT INTO shop_areas VALUES ('669', '659', '三江侗族自治县', '99');
INSERT INTO shop_areas VALUES ('670', '566', '钦州市', '99');
INSERT INTO shop_areas VALUES ('671', '670', '钦南区', '99');
INSERT INTO shop_areas VALUES ('672', '670', '钦北区', '99');
INSERT INTO shop_areas VALUES ('673', '670', '灵山县', '99');
INSERT INTO shop_areas VALUES ('674', '670', '浦北县', '99');
INSERT INTO shop_areas VALUES ('675', '566', '梧州市', '99');
INSERT INTO shop_areas VALUES ('676', '675', '万秀区', '99');
INSERT INTO shop_areas VALUES ('677', '675', '蝶山区', '99');
INSERT INTO shop_areas VALUES ('678', '675', '长洲区', '99');
INSERT INTO shop_areas VALUES ('679', '675', '苍梧县', '99');
INSERT INTO shop_areas VALUES ('680', '675', '藤县', '99');
INSERT INTO shop_areas VALUES ('681', '675', '蒙山县', '99');
INSERT INTO shop_areas VALUES ('682', '675', '岑溪市', '99');
INSERT INTO shop_areas VALUES ('683', '566', '玉林市', '99');
INSERT INTO shop_areas VALUES ('684', '683', '玉州区', '99');
INSERT INTO shop_areas VALUES ('685', '683', '容县', '99');
INSERT INTO shop_areas VALUES ('686', '683', '陆川县', '99');
INSERT INTO shop_areas VALUES ('687', '683', '博白县', '99');
INSERT INTO shop_areas VALUES ('688', '683', '兴业县', '99');
INSERT INTO shop_areas VALUES ('689', '683', '北流市', '99');
INSERT INTO shop_areas VALUES ('690', '0', '贵州', '99');
INSERT INTO shop_areas VALUES ('691', '690', '贵阳市', '99');
INSERT INTO shop_areas VALUES ('692', '691', '南明区', '99');
INSERT INTO shop_areas VALUES ('693', '691', '云岩区', '99');
INSERT INTO shop_areas VALUES ('694', '691', '花溪区', '99');
INSERT INTO shop_areas VALUES ('695', '691', '乌当区', '99');
INSERT INTO shop_areas VALUES ('696', '691', '白云区', '99');
INSERT INTO shop_areas VALUES ('697', '691', '小河区', '99');
INSERT INTO shop_areas VALUES ('698', '691', '开阳县', '99');
INSERT INTO shop_areas VALUES ('699', '691', '息烽县', '99');
INSERT INTO shop_areas VALUES ('700', '691', '修文县', '99');
INSERT INTO shop_areas VALUES ('701', '691', '清镇市', '99');
INSERT INTO shop_areas VALUES ('702', '690', '安顺市', '99');
INSERT INTO shop_areas VALUES ('703', '702', '西秀区', '99');
INSERT INTO shop_areas VALUES ('704', '702', '平坝县', '99');
INSERT INTO shop_areas VALUES ('705', '702', '普定县', '99');
INSERT INTO shop_areas VALUES ('706', '702', '镇宁布依族苗族自治县', '99');
INSERT INTO shop_areas VALUES ('707', '702', '关岭布依族苗族自治县', '99');
INSERT INTO shop_areas VALUES ('708', '702', '紫云苗族布依族自治县', '99');
INSERT INTO shop_areas VALUES ('709', '690', '毕节地区', '99');
INSERT INTO shop_areas VALUES ('710', '709', '毕节市', '99');
INSERT INTO shop_areas VALUES ('711', '709', '大方县', '99');
INSERT INTO shop_areas VALUES ('712', '709', '黔西县', '99');
INSERT INTO shop_areas VALUES ('713', '709', '金沙县', '99');
INSERT INTO shop_areas VALUES ('714', '709', '织金县', '99');
INSERT INTO shop_areas VALUES ('715', '709', '纳雍县', '99');
INSERT INTO shop_areas VALUES ('716', '709', '威宁彝族回族苗族自治县', '99');
INSERT INTO shop_areas VALUES ('717', '709', '赫章县', '99');
INSERT INTO shop_areas VALUES ('718', '690', '六盘水市', '99');
INSERT INTO shop_areas VALUES ('719', '718', '钟山区', '99');
INSERT INTO shop_areas VALUES ('720', '718', '六枝特区', '99');
INSERT INTO shop_areas VALUES ('721', '718', '水城县', '99');
INSERT INTO shop_areas VALUES ('722', '718', '盘县', '99');
INSERT INTO shop_areas VALUES ('723', '690', '黔东南苗族侗族自治州', '99');
INSERT INTO shop_areas VALUES ('724', '723', '凯里市', '99');
INSERT INTO shop_areas VALUES ('725', '723', '黄平县', '99');
INSERT INTO shop_areas VALUES ('726', '723', '施秉县', '99');
INSERT INTO shop_areas VALUES ('727', '723', '三穗县', '99');
INSERT INTO shop_areas VALUES ('728', '723', '镇远县', '99');
INSERT INTO shop_areas VALUES ('729', '723', '岑巩县', '99');
INSERT INTO shop_areas VALUES ('730', '723', '天柱县', '99');
INSERT INTO shop_areas VALUES ('731', '723', '锦屏县', '99');
INSERT INTO shop_areas VALUES ('732', '723', '剑河县', '99');
INSERT INTO shop_areas VALUES ('733', '723', '台江县', '99');
INSERT INTO shop_areas VALUES ('734', '723', '黎平县', '99');
INSERT INTO shop_areas VALUES ('735', '723', '榕江县', '99');
INSERT INTO shop_areas VALUES ('736', '723', '从江县', '99');
INSERT INTO shop_areas VALUES ('737', '723', '雷山县', '99');
INSERT INTO shop_areas VALUES ('738', '723', '麻江县', '99');
INSERT INTO shop_areas VALUES ('739', '723', '丹寨县', '99');
INSERT INTO shop_areas VALUES ('740', '690', '黔南布依族苗族自治州', '99');
INSERT INTO shop_areas VALUES ('741', '740', '都匀市', '99');
INSERT INTO shop_areas VALUES ('742', '740', '福泉市', '99');
INSERT INTO shop_areas VALUES ('743', '740', '荔波县', '99');
INSERT INTO shop_areas VALUES ('744', '740', '贵定县', '99');
INSERT INTO shop_areas VALUES ('745', '740', '瓮安县', '99');
INSERT INTO shop_areas VALUES ('746', '740', '独山县', '99');
INSERT INTO shop_areas VALUES ('747', '740', '平塘县', '99');
INSERT INTO shop_areas VALUES ('748', '740', '罗甸县', '99');
INSERT INTO shop_areas VALUES ('749', '740', '长顺县', '99');
INSERT INTO shop_areas VALUES ('750', '740', '龙里县', '99');
INSERT INTO shop_areas VALUES ('751', '740', '惠水县', '99');
INSERT INTO shop_areas VALUES ('752', '740', '三都水族自治县', '99');
INSERT INTO shop_areas VALUES ('753', '690', '黔西南布依族苗族自治州', '99');
INSERT INTO shop_areas VALUES ('754', '753', '兴义市', '99');
INSERT INTO shop_areas VALUES ('755', '753', '兴仁县', '99');
INSERT INTO shop_areas VALUES ('756', '753', '普安县', '99');
INSERT INTO shop_areas VALUES ('757', '753', '晴隆县', '99');
INSERT INTO shop_areas VALUES ('758', '753', '贞丰县', '99');
INSERT INTO shop_areas VALUES ('759', '753', '望谟县', '99');
INSERT INTO shop_areas VALUES ('760', '753', '册亨县', '99');
INSERT INTO shop_areas VALUES ('761', '753', '安龙县', '99');
INSERT INTO shop_areas VALUES ('762', '690', '铜仁地区', '99');
INSERT INTO shop_areas VALUES ('763', '762', '铜仁市', '99');
INSERT INTO shop_areas VALUES ('764', '762', '江口县', '99');
INSERT INTO shop_areas VALUES ('765', '762', '玉屏侗族自治县', '99');
INSERT INTO shop_areas VALUES ('766', '762', '石阡县', '99');
INSERT INTO shop_areas VALUES ('767', '762', '思南县', '99');
INSERT INTO shop_areas VALUES ('768', '762', '印江土家族苗族自治县', '99');
INSERT INTO shop_areas VALUES ('769', '762', '德江县', '99');
INSERT INTO shop_areas VALUES ('770', '762', '沿河土家族自治县', '99');
INSERT INTO shop_areas VALUES ('771', '762', '松桃苗族自治县', '99');
INSERT INTO shop_areas VALUES ('772', '762', '万山特区', '99');
INSERT INTO shop_areas VALUES ('773', '690', '遵义市', '99');
INSERT INTO shop_areas VALUES ('774', '773', '红花岗区', '99');
INSERT INTO shop_areas VALUES ('775', '773', '汇川区', '99');
INSERT INTO shop_areas VALUES ('776', '773', '遵义县', '99');
INSERT INTO shop_areas VALUES ('777', '773', '桐梓县', '99');
INSERT INTO shop_areas VALUES ('778', '773', '绥阳县', '99');
INSERT INTO shop_areas VALUES ('779', '773', '正安县', '99');
INSERT INTO shop_areas VALUES ('780', '773', '道真仡佬族苗族自治县', '99');
INSERT INTO shop_areas VALUES ('781', '773', '务川仡佬族苗族自治县', '99');
INSERT INTO shop_areas VALUES ('782', '773', '凤冈县', '99');
INSERT INTO shop_areas VALUES ('783', '773', '湄潭县', '99');
INSERT INTO shop_areas VALUES ('784', '773', '余庆县', '99');
INSERT INTO shop_areas VALUES ('785', '773', '习水县', '99');
INSERT INTO shop_areas VALUES ('786', '773', '赤水市', '99');
INSERT INTO shop_areas VALUES ('787', '773', '仁怀市', '99');
INSERT INTO shop_areas VALUES ('788', '0', '海南', '99');
INSERT INTO shop_areas VALUES ('789', '788', '海口市', '99');
INSERT INTO shop_areas VALUES ('790', '789', '秀英区', '99');
INSERT INTO shop_areas VALUES ('791', '789', '龙华区', '99');
INSERT INTO shop_areas VALUES ('792', '789', '琼山区', '99');
INSERT INTO shop_areas VALUES ('793', '789', '美兰区', '99');
INSERT INTO shop_areas VALUES ('794', '788', '白沙黎族自治县', '99');
INSERT INTO shop_areas VALUES ('795', '788', '保亭黎族苗族自治县', '99');
INSERT INTO shop_areas VALUES ('796', '788', '昌江黎族自治县', '99');
INSERT INTO shop_areas VALUES ('797', '788', '澄迈县', '99');
INSERT INTO shop_areas VALUES ('798', '788', '儋州市', '99');
INSERT INTO shop_areas VALUES ('799', '788', '定安县', '99');
INSERT INTO shop_areas VALUES ('800', '788', '东方市', '99');
INSERT INTO shop_areas VALUES ('801', '788', '乐东黎族自治县', '99');
INSERT INTO shop_areas VALUES ('802', '788', '临高县', '99');
INSERT INTO shop_areas VALUES ('803', '788', '陵水黎族自治县', '99');
INSERT INTO shop_areas VALUES ('804', '788', '南沙群岛', '99');
INSERT INTO shop_areas VALUES ('805', '788', '琼海市', '99');
INSERT INTO shop_areas VALUES ('806', '788', '琼中黎族苗族自治县', '99');
INSERT INTO shop_areas VALUES ('807', '788', '三亚市', '99');
INSERT INTO shop_areas VALUES ('808', '788', '屯昌县', '99');
INSERT INTO shop_areas VALUES ('809', '788', '万宁市', '99');
INSERT INTO shop_areas VALUES ('810', '788', '文昌市', '99');
INSERT INTO shop_areas VALUES ('811', '788', '五指山市', '99');
INSERT INTO shop_areas VALUES ('812', '788', '西沙群岛', '99');
INSERT INTO shop_areas VALUES ('813', '788', '中沙群岛的岛礁及其海域', '99');
INSERT INTO shop_areas VALUES ('814', '0', '河北', '99');
INSERT INTO shop_areas VALUES ('815', '814', '石家庄市', '99');
INSERT INTO shop_areas VALUES ('816', '815', '长安区', '99');
INSERT INTO shop_areas VALUES ('817', '815', '桥东区', '99');
INSERT INTO shop_areas VALUES ('818', '815', '桥西区', '99');
INSERT INTO shop_areas VALUES ('819', '815', '新华区', '99');
INSERT INTO shop_areas VALUES ('820', '815', '井陉矿区', '99');
INSERT INTO shop_areas VALUES ('821', '815', '裕华区', '99');
INSERT INTO shop_areas VALUES ('822', '815', '井陉县', '99');
INSERT INTO shop_areas VALUES ('823', '815', '正定县', '99');
INSERT INTO shop_areas VALUES ('824', '815', '栾城县', '99');
INSERT INTO shop_areas VALUES ('825', '815', '行唐县', '99');
INSERT INTO shop_areas VALUES ('826', '815', '灵寿县', '99');
INSERT INTO shop_areas VALUES ('827', '815', '高邑县', '99');
INSERT INTO shop_areas VALUES ('828', '815', '深泽县', '99');
INSERT INTO shop_areas VALUES ('829', '815', '赞皇县', '99');
INSERT INTO shop_areas VALUES ('830', '815', '无极县', '99');
INSERT INTO shop_areas VALUES ('831', '815', '平山县', '99');
INSERT INTO shop_areas VALUES ('832', '815', '元氏县', '99');
INSERT INTO shop_areas VALUES ('833', '815', '赵县', '99');
INSERT INTO shop_areas VALUES ('834', '815', '辛集市', '99');
INSERT INTO shop_areas VALUES ('835', '815', '藁城市', '99');
INSERT INTO shop_areas VALUES ('836', '815', '晋州市', '99');
INSERT INTO shop_areas VALUES ('837', '815', '新乐市', '99');
INSERT INTO shop_areas VALUES ('838', '815', '鹿泉市', '99');
INSERT INTO shop_areas VALUES ('839', '814', '保定市', '99');
INSERT INTO shop_areas VALUES ('840', '839', '新市区', '99');
INSERT INTO shop_areas VALUES ('841', '839', '北市区', '99');
INSERT INTO shop_areas VALUES ('842', '839', '南市区', '99');
INSERT INTO shop_areas VALUES ('843', '839', '满城县', '99');
INSERT INTO shop_areas VALUES ('844', '839', '清苑县', '99');
INSERT INTO shop_areas VALUES ('845', '839', '涞水县', '99');
INSERT INTO shop_areas VALUES ('846', '839', '阜平县', '99');
INSERT INTO shop_areas VALUES ('847', '839', '徐水县', '99');
INSERT INTO shop_areas VALUES ('848', '839', '定兴县', '99');
INSERT INTO shop_areas VALUES ('849', '839', '唐县', '99');
INSERT INTO shop_areas VALUES ('850', '839', '高阳县', '99');
INSERT INTO shop_areas VALUES ('851', '839', '容城县', '99');
INSERT INTO shop_areas VALUES ('852', '839', '涞源县', '99');
INSERT INTO shop_areas VALUES ('853', '839', '望都县', '99');
INSERT INTO shop_areas VALUES ('854', '839', '安新县', '99');
INSERT INTO shop_areas VALUES ('855', '839', '易县', '99');
INSERT INTO shop_areas VALUES ('856', '839', '曲阳县', '99');
INSERT INTO shop_areas VALUES ('857', '839', '蠡县', '99');
INSERT INTO shop_areas VALUES ('858', '839', '顺平县', '99');
INSERT INTO shop_areas VALUES ('859', '839', '博野县', '99');
INSERT INTO shop_areas VALUES ('860', '839', '雄县', '99');
INSERT INTO shop_areas VALUES ('861', '839', '涿州市', '99');
INSERT INTO shop_areas VALUES ('862', '839', '定州市', '99');
INSERT INTO shop_areas VALUES ('863', '839', '安国市', '99');
INSERT INTO shop_areas VALUES ('864', '839', '高碑店市', '99');
INSERT INTO shop_areas VALUES ('865', '814', '沧州市', '99');
INSERT INTO shop_areas VALUES ('866', '865', '新华区', '99');
INSERT INTO shop_areas VALUES ('867', '865', '运河区', '99');
INSERT INTO shop_areas VALUES ('868', '865', '沧县', '99');
INSERT INTO shop_areas VALUES ('869', '865', '青县', '99');
INSERT INTO shop_areas VALUES ('870', '865', '东光县', '99');
INSERT INTO shop_areas VALUES ('871', '865', '海兴县', '99');
INSERT INTO shop_areas VALUES ('872', '865', '盐山县', '99');
INSERT INTO shop_areas VALUES ('873', '865', '肃宁县', '99');
INSERT INTO shop_areas VALUES ('874', '865', '南皮县', '99');
INSERT INTO shop_areas VALUES ('875', '865', '吴桥县', '99');
INSERT INTO shop_areas VALUES ('876', '865', '献县', '99');
INSERT INTO shop_areas VALUES ('877', '865', '孟村回族自治县', '99');
INSERT INTO shop_areas VALUES ('878', '865', '泊头市', '99');
INSERT INTO shop_areas VALUES ('879', '865', '任丘市', '99');
INSERT INTO shop_areas VALUES ('880', '865', '黄骅市', '99');
INSERT INTO shop_areas VALUES ('881', '865', '河间市', '99');
INSERT INTO shop_areas VALUES ('882', '814', '承德市', '99');
INSERT INTO shop_areas VALUES ('883', '882', '双桥区', '99');
INSERT INTO shop_areas VALUES ('884', '882', '双滦区', '99');
INSERT INTO shop_areas VALUES ('885', '882', '鹰手营子矿区', '99');
INSERT INTO shop_areas VALUES ('886', '882', '承德县', '99');
INSERT INTO shop_areas VALUES ('887', '882', '兴隆县', '99');
INSERT INTO shop_areas VALUES ('888', '882', '平泉县', '99');
INSERT INTO shop_areas VALUES ('889', '882', '滦平县', '99');
INSERT INTO shop_areas VALUES ('890', '882', '隆化县', '99');
INSERT INTO shop_areas VALUES ('891', '882', '丰宁满族自治县', '99');
INSERT INTO shop_areas VALUES ('892', '882', '宽城满族自治县', '99');
INSERT INTO shop_areas VALUES ('893', '882', '围场满族蒙古族自治县', '99');
INSERT INTO shop_areas VALUES ('894', '814', '邯郸市', '99');
INSERT INTO shop_areas VALUES ('895', '894', '邯山区', '99');
INSERT INTO shop_areas VALUES ('896', '894', '丛台区', '99');
INSERT INTO shop_areas VALUES ('897', '894', '复兴区', '99');
INSERT INTO shop_areas VALUES ('898', '894', '峰峰矿区', '99');
INSERT INTO shop_areas VALUES ('899', '894', '邯郸县', '99');
INSERT INTO shop_areas VALUES ('900', '894', '临漳县', '99');
INSERT INTO shop_areas VALUES ('901', '894', '成安县', '99');
INSERT INTO shop_areas VALUES ('902', '894', '大名县', '99');
INSERT INTO shop_areas VALUES ('903', '894', '涉县', '99');
INSERT INTO shop_areas VALUES ('904', '894', '磁县', '99');
INSERT INTO shop_areas VALUES ('905', '894', '肥乡县', '99');
INSERT INTO shop_areas VALUES ('906', '894', '永年县', '99');
INSERT INTO shop_areas VALUES ('907', '894', '邱县', '99');
INSERT INTO shop_areas VALUES ('908', '894', '鸡泽县', '99');
INSERT INTO shop_areas VALUES ('909', '894', '广平县', '99');
INSERT INTO shop_areas VALUES ('910', '894', '馆陶县', '99');
INSERT INTO shop_areas VALUES ('911', '894', '魏县', '99');
INSERT INTO shop_areas VALUES ('912', '894', '曲周县', '99');
INSERT INTO shop_areas VALUES ('913', '894', '武安市', '99');
INSERT INTO shop_areas VALUES ('914', '814', '衡水市', '99');
INSERT INTO shop_areas VALUES ('915', '914', '桃城区', '99');
INSERT INTO shop_areas VALUES ('916', '914', '枣强县', '99');
INSERT INTO shop_areas VALUES ('917', '914', '武邑县', '99');
INSERT INTO shop_areas VALUES ('918', '914', '武强县', '99');
INSERT INTO shop_areas VALUES ('919', '914', '饶阳县', '99');
INSERT INTO shop_areas VALUES ('920', '914', '安平县', '99');
INSERT INTO shop_areas VALUES ('921', '914', '故城县', '99');
INSERT INTO shop_areas VALUES ('922', '914', '景县', '99');
INSERT INTO shop_areas VALUES ('923', '914', '阜城县', '99');
INSERT INTO shop_areas VALUES ('924', '914', '冀州市', '99');
INSERT INTO shop_areas VALUES ('925', '914', '深州市', '99');
INSERT INTO shop_areas VALUES ('926', '814', '廊坊市', '99');
INSERT INTO shop_areas VALUES ('927', '926', '安次区', '99');
INSERT INTO shop_areas VALUES ('928', '926', '广阳区', '99');
INSERT INTO shop_areas VALUES ('929', '926', '固安县', '99');
INSERT INTO shop_areas VALUES ('930', '926', '永清县', '99');
INSERT INTO shop_areas VALUES ('931', '926', '香河县', '99');
INSERT INTO shop_areas VALUES ('932', '926', '大城县', '99');
INSERT INTO shop_areas VALUES ('933', '926', '文安县', '99');
INSERT INTO shop_areas VALUES ('934', '926', '大厂回族自治县', '99');
INSERT INTO shop_areas VALUES ('935', '926', '霸州市', '99');
INSERT INTO shop_areas VALUES ('936', '926', '三河市', '99');
INSERT INTO shop_areas VALUES ('937', '814', '秦皇岛市', '99');
INSERT INTO shop_areas VALUES ('938', '937', '海港区', '99');
INSERT INTO shop_areas VALUES ('939', '937', '山海关区', '99');
INSERT INTO shop_areas VALUES ('940', '937', '北戴河区', '99');
INSERT INTO shop_areas VALUES ('941', '937', '青龙满族自治县', '99');
INSERT INTO shop_areas VALUES ('942', '937', '昌黎县', '99');
INSERT INTO shop_areas VALUES ('943', '937', '抚宁县', '99');
INSERT INTO shop_areas VALUES ('944', '937', '卢龙县', '99');
INSERT INTO shop_areas VALUES ('945', '814', '唐山市', '99');
INSERT INTO shop_areas VALUES ('946', '945', '路南区', '99');
INSERT INTO shop_areas VALUES ('947', '945', '路北区', '99');
INSERT INTO shop_areas VALUES ('948', '945', '古冶区', '99');
INSERT INTO shop_areas VALUES ('949', '945', '开平区', '99');
INSERT INTO shop_areas VALUES ('950', '945', '丰南区', '99');
INSERT INTO shop_areas VALUES ('951', '945', '丰润区', '99');
INSERT INTO shop_areas VALUES ('952', '945', '滦县', '99');
INSERT INTO shop_areas VALUES ('953', '945', '滦南县', '99');
INSERT INTO shop_areas VALUES ('954', '945', '乐亭县', '99');
INSERT INTO shop_areas VALUES ('955', '945', '迁西县', '99');
INSERT INTO shop_areas VALUES ('956', '945', '玉田县', '99');
INSERT INTO shop_areas VALUES ('957', '945', '唐海县', '99');
INSERT INTO shop_areas VALUES ('958', '945', '遵化市', '99');
INSERT INTO shop_areas VALUES ('959', '945', '迁安市', '99');
INSERT INTO shop_areas VALUES ('960', '814', '邢台市', '99');
INSERT INTO shop_areas VALUES ('961', '960', '桥东区', '99');
INSERT INTO shop_areas VALUES ('962', '960', '桥西区', '99');
INSERT INTO shop_areas VALUES ('963', '960', '邢台县', '99');
INSERT INTO shop_areas VALUES ('964', '960', '临城县', '99');
INSERT INTO shop_areas VALUES ('965', '960', '内丘县', '99');
INSERT INTO shop_areas VALUES ('966', '960', '柏乡县', '99');
INSERT INTO shop_areas VALUES ('967', '960', '隆尧县', '99');
INSERT INTO shop_areas VALUES ('968', '960', '任县', '99');
INSERT INTO shop_areas VALUES ('969', '960', '南和县', '99');
INSERT INTO shop_areas VALUES ('970', '960', '宁晋县', '99');
INSERT INTO shop_areas VALUES ('971', '960', '巨鹿县', '99');
INSERT INTO shop_areas VALUES ('972', '960', '新河县', '99');
INSERT INTO shop_areas VALUES ('973', '960', '广宗县', '99');
INSERT INTO shop_areas VALUES ('974', '960', '平乡县', '99');
INSERT INTO shop_areas VALUES ('975', '960', '威县', '99');
INSERT INTO shop_areas VALUES ('976', '960', '清河县', '99');
INSERT INTO shop_areas VALUES ('977', '960', '临西县', '99');
INSERT INTO shop_areas VALUES ('978', '960', '南宫市', '99');
INSERT INTO shop_areas VALUES ('979', '960', '沙河市', '99');
INSERT INTO shop_areas VALUES ('980', '814', '张家口市', '99');
INSERT INTO shop_areas VALUES ('981', '980', '桥东区', '99');
INSERT INTO shop_areas VALUES ('982', '980', '桥西区', '99');
INSERT INTO shop_areas VALUES ('983', '980', '宣化区', '99');
INSERT INTO shop_areas VALUES ('984', '980', '下花园区', '99');
INSERT INTO shop_areas VALUES ('985', '980', '宣化县', '99');
INSERT INTO shop_areas VALUES ('986', '980', '张北县', '99');
INSERT INTO shop_areas VALUES ('987', '980', '康保县', '99');
INSERT INTO shop_areas VALUES ('988', '980', '沽源县', '99');
INSERT INTO shop_areas VALUES ('989', '980', '尚义县', '99');
INSERT INTO shop_areas VALUES ('990', '980', '蔚县', '99');
INSERT INTO shop_areas VALUES ('991', '980', '阳原县', '99');
INSERT INTO shop_areas VALUES ('992', '980', '怀安县', '99');
INSERT INTO shop_areas VALUES ('993', '980', '万全县', '99');
INSERT INTO shop_areas VALUES ('994', '980', '怀来县', '99');
INSERT INTO shop_areas VALUES ('995', '980', '涿鹿县', '99');
INSERT INTO shop_areas VALUES ('996', '980', '赤城县', '99');
INSERT INTO shop_areas VALUES ('997', '980', '崇礼县', '99');
INSERT INTO shop_areas VALUES ('998', '0', '河南', '99');
INSERT INTO shop_areas VALUES ('999', '998', '郑州市', '99');
INSERT INTO shop_areas VALUES ('1000', '999', '中原区', '99');
INSERT INTO shop_areas VALUES ('1001', '999', '二七区', '99');
INSERT INTO shop_areas VALUES ('1002', '999', '管城回族区', '99');
INSERT INTO shop_areas VALUES ('1003', '999', '金水区', '99');
INSERT INTO shop_areas VALUES ('1004', '999', '上街区', '99');
INSERT INTO shop_areas VALUES ('1005', '999', '邙山区', '99');
INSERT INTO shop_areas VALUES ('1006', '999', '中牟县', '99');
INSERT INTO shop_areas VALUES ('1007', '999', '巩义市', '99');
INSERT INTO shop_areas VALUES ('1008', '999', '荥阳市', '99');
INSERT INTO shop_areas VALUES ('1009', '999', '新密市', '99');
INSERT INTO shop_areas VALUES ('1010', '999', '新郑市', '99');
INSERT INTO shop_areas VALUES ('1011', '999', '登封市', '99');
INSERT INTO shop_areas VALUES ('1012', '998', '安阳市', '99');
INSERT INTO shop_areas VALUES ('1013', '1012', '文峰区', '99');
INSERT INTO shop_areas VALUES ('1014', '1012', '北关区', '99');
INSERT INTO shop_areas VALUES ('1015', '1012', '殷都区', '99');
INSERT INTO shop_areas VALUES ('1016', '1012', '龙安区', '99');
INSERT INTO shop_areas VALUES ('1017', '1012', '安阳县', '99');
INSERT INTO shop_areas VALUES ('1018', '1012', '汤阴县', '99');
INSERT INTO shop_areas VALUES ('1019', '1012', '滑县', '99');
INSERT INTO shop_areas VALUES ('1020', '1012', '内黄县', '99');
INSERT INTO shop_areas VALUES ('1021', '1012', '林州市', '99');
INSERT INTO shop_areas VALUES ('1022', '998', '鹤壁市', '99');
INSERT INTO shop_areas VALUES ('1023', '1022', '鹤山区', '99');
INSERT INTO shop_areas VALUES ('1024', '1022', '山城区', '99');
INSERT INTO shop_areas VALUES ('1025', '1022', '淇滨区', '99');
INSERT INTO shop_areas VALUES ('1026', '1022', '浚县', '99');
INSERT INTO shop_areas VALUES ('1027', '1022', '淇县', '99');
INSERT INTO shop_areas VALUES ('1028', '998', '济源市', '99');
INSERT INTO shop_areas VALUES ('1029', '998', '焦作市', '99');
INSERT INTO shop_areas VALUES ('1030', '1029', '解放区', '99');
INSERT INTO shop_areas VALUES ('1031', '1029', '中站区', '99');
INSERT INTO shop_areas VALUES ('1032', '1029', '马村区', '99');
INSERT INTO shop_areas VALUES ('1033', '1029', '山阳区', '99');
INSERT INTO shop_areas VALUES ('1034', '1029', '修武县', '99');
INSERT INTO shop_areas VALUES ('1035', '1029', '博爱县', '99');
INSERT INTO shop_areas VALUES ('1036', '1029', '武陟县', '99');
INSERT INTO shop_areas VALUES ('1037', '1029', '温县', '99');
INSERT INTO shop_areas VALUES ('1038', '1029', '济源市', '99');
INSERT INTO shop_areas VALUES ('1039', '1029', '沁阳市', '99');
INSERT INTO shop_areas VALUES ('1040', '1029', '孟州市', '99');
INSERT INTO shop_areas VALUES ('1041', '998', '开封市', '99');
INSERT INTO shop_areas VALUES ('1042', '1041', '龙亭区', '99');
INSERT INTO shop_areas VALUES ('1043', '1041', '顺河回族区', '99');
INSERT INTO shop_areas VALUES ('1044', '1041', '鼓楼区', '99');
INSERT INTO shop_areas VALUES ('1045', '1041', '南关区', '99');
INSERT INTO shop_areas VALUES ('1046', '1041', '郊区', '99');
INSERT INTO shop_areas VALUES ('1047', '1041', '杞县', '99');
INSERT INTO shop_areas VALUES ('1048', '1041', '通许县', '99');
INSERT INTO shop_areas VALUES ('1049', '1041', '尉氏县', '99');
INSERT INTO shop_areas VALUES ('1050', '1041', '开封县', '99');
INSERT INTO shop_areas VALUES ('1051', '1041', '兰考县', '99');
INSERT INTO shop_areas VALUES ('1052', '998', '洛阳市', '99');
INSERT INTO shop_areas VALUES ('1053', '1052', '老城区', '99');
INSERT INTO shop_areas VALUES ('1054', '1052', '西工区', '99');
INSERT INTO shop_areas VALUES ('1055', '1052', '廛河回族区', '99');
INSERT INTO shop_areas VALUES ('1056', '1052', '涧西区', '99');
INSERT INTO shop_areas VALUES ('1057', '1052', '吉利区', '99');
INSERT INTO shop_areas VALUES ('1058', '1052', '洛龙区', '99');
INSERT INTO shop_areas VALUES ('1059', '1052', '孟津县', '99');
INSERT INTO shop_areas VALUES ('1060', '1052', '新安县', '99');
INSERT INTO shop_areas VALUES ('1061', '1052', '栾川县', '99');
INSERT INTO shop_areas VALUES ('1062', '1052', '嵩县', '99');
INSERT INTO shop_areas VALUES ('1063', '1052', '汝阳县', '99');
INSERT INTO shop_areas VALUES ('1064', '1052', '宜阳县', '99');
INSERT INTO shop_areas VALUES ('1065', '1052', '洛宁县', '99');
INSERT INTO shop_areas VALUES ('1066', '1052', '伊川县', '99');
INSERT INTO shop_areas VALUES ('1067', '1052', '偃师市', '99');
INSERT INTO shop_areas VALUES ('1068', '998', '漯河市', '99');
INSERT INTO shop_areas VALUES ('1069', '1068', '源汇区', '99');
INSERT INTO shop_areas VALUES ('1070', '1068', '郾城区', '99');
INSERT INTO shop_areas VALUES ('1071', '1068', '召陵区', '99');
INSERT INTO shop_areas VALUES ('1072', '1068', '舞阳县', '99');
INSERT INTO shop_areas VALUES ('1073', '1068', '临颍县', '99');
INSERT INTO shop_areas VALUES ('1074', '998', '南阳市', '99');
INSERT INTO shop_areas VALUES ('1075', '1074', '宛城区', '99');
INSERT INTO shop_areas VALUES ('1076', '1074', '卧龙区', '99');
INSERT INTO shop_areas VALUES ('1077', '1074', '南召县', '99');
INSERT INTO shop_areas VALUES ('1078', '1074', '方城县', '99');
INSERT INTO shop_areas VALUES ('1079', '1074', '西峡县', '99');
INSERT INTO shop_areas VALUES ('1080', '1074', '镇平县', '99');
INSERT INTO shop_areas VALUES ('1081', '1074', '内乡县', '99');
INSERT INTO shop_areas VALUES ('1082', '1074', '淅川县', '99');
INSERT INTO shop_areas VALUES ('1083', '1074', '社旗县', '99');
INSERT INTO shop_areas VALUES ('1084', '1074', '唐河县', '99');
INSERT INTO shop_areas VALUES ('1085', '1074', '新野县', '99');
INSERT INTO shop_areas VALUES ('1086', '1074', '桐柏县', '99');
INSERT INTO shop_areas VALUES ('1087', '1074', '邓州市', '99');
INSERT INTO shop_areas VALUES ('1088', '998', '平顶山市', '99');
INSERT INTO shop_areas VALUES ('1089', '1088', '新华区', '99');
INSERT INTO shop_areas VALUES ('1090', '1088', '卫东区', '99');
INSERT INTO shop_areas VALUES ('1091', '1088', '石龙区', '99');
INSERT INTO shop_areas VALUES ('1092', '1088', '湛河区', '99');
INSERT INTO shop_areas VALUES ('1093', '1088', '宝丰县', '99');
INSERT INTO shop_areas VALUES ('1094', '1088', '叶县', '99');
INSERT INTO shop_areas VALUES ('1095', '1088', '鲁山县', '99');
INSERT INTO shop_areas VALUES ('1096', '1088', '郏县', '99');
INSERT INTO shop_areas VALUES ('1097', '1088', '舞钢市', '99');
INSERT INTO shop_areas VALUES ('1098', '1088', '汝州市', '99');
INSERT INTO shop_areas VALUES ('1099', '998', '濮阳市', '99');
INSERT INTO shop_areas VALUES ('1100', '1099', '华龙区', '99');
INSERT INTO shop_areas VALUES ('1101', '1099', '清丰县', '99');
INSERT INTO shop_areas VALUES ('1102', '1099', '南乐县', '99');
INSERT INTO shop_areas VALUES ('1103', '1099', '范县', '99');
INSERT INTO shop_areas VALUES ('1104', '1099', '台前县', '99');
INSERT INTO shop_areas VALUES ('1105', '1099', '濮阳县', '99');
INSERT INTO shop_areas VALUES ('1106', '998', '三门峡市', '99');
INSERT INTO shop_areas VALUES ('1107', '1106', '湖滨区', '99');
INSERT INTO shop_areas VALUES ('1108', '1106', '渑池县', '99');
INSERT INTO shop_areas VALUES ('1109', '1106', '陕县', '99');
INSERT INTO shop_areas VALUES ('1110', '1106', '卢氏县', '99');
INSERT INTO shop_areas VALUES ('1111', '1106', '义马市', '99');
INSERT INTO shop_areas VALUES ('1112', '1106', '灵宝市', '99');
INSERT INTO shop_areas VALUES ('1113', '998', '商丘市', '99');
INSERT INTO shop_areas VALUES ('1114', '1113', '梁园区', '99');
INSERT INTO shop_areas VALUES ('1115', '1113', '睢阳区', '99');
INSERT INTO shop_areas VALUES ('1116', '1113', '民权县', '99');
INSERT INTO shop_areas VALUES ('1117', '1113', '睢县', '99');
INSERT INTO shop_areas VALUES ('1118', '1113', '宁陵县', '99');
INSERT INTO shop_areas VALUES ('1119', '1113', '柘城县', '99');
INSERT INTO shop_areas VALUES ('1120', '1113', '虞城县', '99');
INSERT INTO shop_areas VALUES ('1121', '1113', '夏邑县', '99');
INSERT INTO shop_areas VALUES ('1122', '1113', '永城市', '99');
INSERT INTO shop_areas VALUES ('1123', '998', '新乡市', '99');
INSERT INTO shop_areas VALUES ('1124', '1123', '红旗区', '99');
INSERT INTO shop_areas VALUES ('1125', '1123', '卫滨区', '99');
INSERT INTO shop_areas VALUES ('1126', '1123', '凤泉区', '99');
INSERT INTO shop_areas VALUES ('1127', '1123', '牧野区', '99');
INSERT INTO shop_areas VALUES ('1128', '1123', '新乡县', '99');
INSERT INTO shop_areas VALUES ('1129', '1123', '获嘉县', '99');
INSERT INTO shop_areas VALUES ('1130', '1123', '原阳县', '99');
INSERT INTO shop_areas VALUES ('1131', '1123', '延津县', '99');
INSERT INTO shop_areas VALUES ('1132', '1123', '封丘县', '99');
INSERT INTO shop_areas VALUES ('1133', '1123', '长垣县', '99');
INSERT INTO shop_areas VALUES ('1134', '1123', '卫辉市', '99');
INSERT INTO shop_areas VALUES ('1135', '1123', '辉县市', '99');
INSERT INTO shop_areas VALUES ('1136', '998', '信阳市', '99');
INSERT INTO shop_areas VALUES ('1137', '1136', '师河区', '99');
INSERT INTO shop_areas VALUES ('1138', '1136', '平桥区', '99');
INSERT INTO shop_areas VALUES ('1139', '1136', '罗山县', '99');
INSERT INTO shop_areas VALUES ('1140', '1136', '光山县', '99');
INSERT INTO shop_areas VALUES ('1141', '1136', '新县', '99');
INSERT INTO shop_areas VALUES ('1142', '1136', '商城县', '99');
INSERT INTO shop_areas VALUES ('1143', '1136', '固始县', '99');
INSERT INTO shop_areas VALUES ('1144', '1136', '潢川县', '99');
INSERT INTO shop_areas VALUES ('1145', '1136', '淮滨县', '99');
INSERT INTO shop_areas VALUES ('1146', '1136', '息县', '99');
INSERT INTO shop_areas VALUES ('1147', '998', '许昌市', '99');
INSERT INTO shop_areas VALUES ('1148', '1147', '魏都区', '99');
INSERT INTO shop_areas VALUES ('1149', '1147', '许昌县', '99');
INSERT INTO shop_areas VALUES ('1150', '1147', '鄢陵县', '99');
INSERT INTO shop_areas VALUES ('1151', '1147', '襄城县', '99');
INSERT INTO shop_areas VALUES ('1152', '1147', '禹州市', '99');
INSERT INTO shop_areas VALUES ('1153', '1147', '长葛市', '99');
INSERT INTO shop_areas VALUES ('1154', '998', '周口市', '99');
INSERT INTO shop_areas VALUES ('1155', '1154', '川汇区', '99');
INSERT INTO shop_areas VALUES ('1156', '1154', '扶沟县', '99');
INSERT INTO shop_areas VALUES ('1157', '1154', '西华县', '99');
INSERT INTO shop_areas VALUES ('1158', '1154', '商水县', '99');
INSERT INTO shop_areas VALUES ('1159', '1154', '沈丘县', '99');
INSERT INTO shop_areas VALUES ('1160', '1154', '郸城县', '99');
INSERT INTO shop_areas VALUES ('1161', '1154', '淮阳县', '99');
INSERT INTO shop_areas VALUES ('1162', '1154', '太康县', '99');
INSERT INTO shop_areas VALUES ('1163', '1154', '鹿邑县', '99');
INSERT INTO shop_areas VALUES ('1164', '1154', '项城市', '99');
INSERT INTO shop_areas VALUES ('1165', '998', '驻马店市', '99');
INSERT INTO shop_areas VALUES ('1166', '1165', '驿城区', '99');
INSERT INTO shop_areas VALUES ('1167', '1165', '西平县', '99');
INSERT INTO shop_areas VALUES ('1168', '1165', '上蔡县', '99');
INSERT INTO shop_areas VALUES ('1169', '1165', '平舆县', '99');
INSERT INTO shop_areas VALUES ('1170', '1165', '正阳县', '99');
INSERT INTO shop_areas VALUES ('1171', '1165', '确山县', '99');
INSERT INTO shop_areas VALUES ('1172', '1165', '泌阳县', '99');
INSERT INTO shop_areas VALUES ('1173', '1165', '汝南县', '99');
INSERT INTO shop_areas VALUES ('1174', '1165', '遂平县', '99');
INSERT INTO shop_areas VALUES ('1175', '1165', '新蔡县', '99');
INSERT INTO shop_areas VALUES ('1176', '0', '黑龙江', '99');
INSERT INTO shop_areas VALUES ('1177', '1176', '哈尔滨市', '99');
INSERT INTO shop_areas VALUES ('1178', '1177', '道里区', '99');
INSERT INTO shop_areas VALUES ('1179', '1177', '南岗区', '99');
INSERT INTO shop_areas VALUES ('1180', '1177', '道外区', '99');
INSERT INTO shop_areas VALUES ('1181', '1177', '香坊区', '99');
INSERT INTO shop_areas VALUES ('1182', '1177', '动力区', '99');
INSERT INTO shop_areas VALUES ('1183', '1177', '平房区', '99');
INSERT INTO shop_areas VALUES ('1184', '1177', '松北区', '99');
INSERT INTO shop_areas VALUES ('1185', '1177', '呼兰区', '99');
INSERT INTO shop_areas VALUES ('1186', '1177', '依兰县', '99');
INSERT INTO shop_areas VALUES ('1187', '1177', '方正县', '99');
INSERT INTO shop_areas VALUES ('1188', '1177', '宾县', '99');
INSERT INTO shop_areas VALUES ('1189', '1177', '巴彦县', '99');
INSERT INTO shop_areas VALUES ('1190', '1177', '木兰县', '99');
INSERT INTO shop_areas VALUES ('1191', '1177', '通河县', '99');
INSERT INTO shop_areas VALUES ('1192', '1177', '延寿县', '99');
INSERT INTO shop_areas VALUES ('1193', '1177', '阿城市', '99');
INSERT INTO shop_areas VALUES ('1194', '1177', '双城市', '99');
INSERT INTO shop_areas VALUES ('1195', '1177', '尚志市', '99');
INSERT INTO shop_areas VALUES ('1196', '1177', '五常市', '99');
INSERT INTO shop_areas VALUES ('1197', '1176', '大庆市', '99');
INSERT INTO shop_areas VALUES ('1198', '1197', '萨尔图区', '99');
INSERT INTO shop_areas VALUES ('1199', '1197', '龙凤区', '99');
INSERT INTO shop_areas VALUES ('1200', '1197', '让胡路区', '99');
INSERT INTO shop_areas VALUES ('1201', '1197', '红岗区', '99');
INSERT INTO shop_areas VALUES ('1202', '1197', '大同区', '99');
INSERT INTO shop_areas VALUES ('1203', '1197', '肇州县', '99');
INSERT INTO shop_areas VALUES ('1204', '1197', '肇源县', '99');
INSERT INTO shop_areas VALUES ('1205', '1197', '林甸县', '99');
INSERT INTO shop_areas VALUES ('1206', '1197', '杜尔伯特蒙古族自治县', '99');
INSERT INTO shop_areas VALUES ('1207', '1176', '大兴安岭地区', '99');
INSERT INTO shop_areas VALUES ('1208', '1207', '呼玛县', '99');
INSERT INTO shop_areas VALUES ('1209', '1207', '塔河县', '99');
INSERT INTO shop_areas VALUES ('1210', '1207', '漠河县', '99');
INSERT INTO shop_areas VALUES ('1211', '1176', '鹤岗市', '99');
INSERT INTO shop_areas VALUES ('1212', '1211', '向阳区', '99');
INSERT INTO shop_areas VALUES ('1213', '1211', '工农区', '99');
INSERT INTO shop_areas VALUES ('1214', '1211', '南山区', '99');
INSERT INTO shop_areas VALUES ('1215', '1211', '兴安区', '99');
INSERT INTO shop_areas VALUES ('1216', '1211', '东山区', '99');
INSERT INTO shop_areas VALUES ('1217', '1211', '兴山区', '99');
INSERT INTO shop_areas VALUES ('1218', '1211', '萝北县', '99');
INSERT INTO shop_areas VALUES ('1219', '1211', '绥滨县', '99');
INSERT INTO shop_areas VALUES ('1220', '1176', '黑河市', '99');
INSERT INTO shop_areas VALUES ('1221', '1220', '爱辉区', '99');
INSERT INTO shop_areas VALUES ('1222', '1220', '嫩江县', '99');
INSERT INTO shop_areas VALUES ('1223', '1220', '逊克县', '99');
INSERT INTO shop_areas VALUES ('1224', '1220', '孙吴县', '99');
INSERT INTO shop_areas VALUES ('1225', '1220', '北安市', '99');
INSERT INTO shop_areas VALUES ('1226', '1220', '五大连池市', '99');
INSERT INTO shop_areas VALUES ('1227', '1176', '鸡西市', '99');
INSERT INTO shop_areas VALUES ('1228', '1227', '鸡冠区', '99');
INSERT INTO shop_areas VALUES ('1229', '1227', '恒山区', '99');
INSERT INTO shop_areas VALUES ('1230', '1227', '滴道区', '99');
INSERT INTO shop_areas VALUES ('1231', '1227', '梨树区', '99');
INSERT INTO shop_areas VALUES ('1232', '1227', '城子河区', '99');
INSERT INTO shop_areas VALUES ('1233', '1227', '麻山区', '99');
INSERT INTO shop_areas VALUES ('1234', '1227', '鸡东县', '99');
INSERT INTO shop_areas VALUES ('1235', '1227', '虎林市', '99');
INSERT INTO shop_areas VALUES ('1236', '1227', '密山市', '99');
INSERT INTO shop_areas VALUES ('1237', '1176', '佳木斯市', '99');
INSERT INTO shop_areas VALUES ('1238', '1237', '永红区', '99');
INSERT INTO shop_areas VALUES ('1239', '1237', '向阳区', '99');
INSERT INTO shop_areas VALUES ('1240', '1237', '前进区', '99');
INSERT INTO shop_areas VALUES ('1241', '1237', '东风区', '99');
INSERT INTO shop_areas VALUES ('1242', '1237', '郊区', '99');
INSERT INTO shop_areas VALUES ('1243', '1237', '桦南县', '99');
INSERT INTO shop_areas VALUES ('1244', '1237', '桦川县', '99');
INSERT INTO shop_areas VALUES ('1245', '1237', '汤原县', '99');
INSERT INTO shop_areas VALUES ('1246', '1237', '抚远县', '99');
INSERT INTO shop_areas VALUES ('1247', '1237', '同江市', '99');
INSERT INTO shop_areas VALUES ('1248', '1237', '富锦市', '99');
INSERT INTO shop_areas VALUES ('1249', '1176', '牡丹江市', '99');
INSERT INTO shop_areas VALUES ('1250', '1249', '东安区', '99');
INSERT INTO shop_areas VALUES ('1251', '1249', '阳明区', '99');
INSERT INTO shop_areas VALUES ('1252', '1249', '爱民区', '99');
INSERT INTO shop_areas VALUES ('1253', '1249', '西安区', '99');
INSERT INTO shop_areas VALUES ('1254', '1249', '东宁县', '99');
INSERT INTO shop_areas VALUES ('1255', '1249', '林口县', '99');
INSERT INTO shop_areas VALUES ('1256', '1249', '绥芬河市', '99');
INSERT INTO shop_areas VALUES ('1257', '1249', '海林市', '99');
INSERT INTO shop_areas VALUES ('1258', '1249', '宁安市', '99');
INSERT INTO shop_areas VALUES ('1259', '1249', '穆棱市', '99');
INSERT INTO shop_areas VALUES ('1260', '1176', '七台河市', '99');
INSERT INTO shop_areas VALUES ('1261', '1260', '新兴区', '99');
INSERT INTO shop_areas VALUES ('1262', '1260', '桃山区', '99');
INSERT INTO shop_areas VALUES ('1263', '1260', '茄子河区', '99');
INSERT INTO shop_areas VALUES ('1264', '1260', '勃利县', '99');
INSERT INTO shop_areas VALUES ('1265', '1176', '齐齐哈尔市', '99');
INSERT INTO shop_areas VALUES ('1266', '1265', '龙沙区', '99');
INSERT INTO shop_areas VALUES ('1267', '1265', '建华区', '99');
INSERT INTO shop_areas VALUES ('1268', '1265', '铁锋区', '99');
INSERT INTO shop_areas VALUES ('1269', '1265', '昂昂溪区', '99');
INSERT INTO shop_areas VALUES ('1270', '1265', '富拉尔基区', '99');
INSERT INTO shop_areas VALUES ('1271', '1265', '碾子山区', '99');
INSERT INTO shop_areas VALUES ('1272', '1265', '梅里斯达斡尔族区', '99');
INSERT INTO shop_areas VALUES ('1273', '1265', '龙江县', '99');
INSERT INTO shop_areas VALUES ('1274', '1265', '依安县', '99');
INSERT INTO shop_areas VALUES ('1275', '1265', '泰来县', '99');
INSERT INTO shop_areas VALUES ('1276', '1265', '甘南县', '99');
INSERT INTO shop_areas VALUES ('1277', '1265', '富裕县', '99');
INSERT INTO shop_areas VALUES ('1278', '1265', '克山县', '99');
INSERT INTO shop_areas VALUES ('1279', '1265', '克东县', '99');
INSERT INTO shop_areas VALUES ('1280', '1265', '拜泉县', '99');
INSERT INTO shop_areas VALUES ('1281', '1265', '讷河市', '99');
INSERT INTO shop_areas VALUES ('1282', '1176', '双鸭山市', '99');
INSERT INTO shop_areas VALUES ('1283', '1282', '尖山区', '99');
INSERT INTO shop_areas VALUES ('1284', '1282', '岭东区', '99');
INSERT INTO shop_areas VALUES ('1285', '1282', '四方台区', '99');
INSERT INTO shop_areas VALUES ('1286', '1282', '宝山区', '99');
INSERT INTO shop_areas VALUES ('1287', '1282', '集贤县', '99');
INSERT INTO shop_areas VALUES ('1288', '1282', '友谊县', '99');
INSERT INTO shop_areas VALUES ('1289', '1282', '宝清县', '99');
INSERT INTO shop_areas VALUES ('1290', '1282', '饶河县', '99');
INSERT INTO shop_areas VALUES ('1291', '1176', '绥化市', '99');
INSERT INTO shop_areas VALUES ('1292', '1291', '北林区', '99');
INSERT INTO shop_areas VALUES ('1293', '1291', '望奎县', '99');
INSERT INTO shop_areas VALUES ('1294', '1291', '兰西县', '99');
INSERT INTO shop_areas VALUES ('1295', '1291', '青冈县', '99');
INSERT INTO shop_areas VALUES ('1296', '1291', '庆安县', '99');
INSERT INTO shop_areas VALUES ('1297', '1291', '明水县', '99');
INSERT INTO shop_areas VALUES ('1298', '1291', '绥棱县', '99');
INSERT INTO shop_areas VALUES ('1299', '1291', '安达市', '99');
INSERT INTO shop_areas VALUES ('1300', '1291', '肇东市', '99');
INSERT INTO shop_areas VALUES ('1301', '1291', '海伦市', '99');
INSERT INTO shop_areas VALUES ('1302', '1176', '伊春市', '99');
INSERT INTO shop_areas VALUES ('1303', '1302', '伊春区', '99');
INSERT INTO shop_areas VALUES ('1304', '1302', '南岔区', '99');
INSERT INTO shop_areas VALUES ('1305', '1302', '友好区', '99');
INSERT INTO shop_areas VALUES ('1306', '1302', '西林区', '99');
INSERT INTO shop_areas VALUES ('1307', '1302', '翠峦区', '99');
INSERT INTO shop_areas VALUES ('1308', '1302', '新青区', '99');
INSERT INTO shop_areas VALUES ('1309', '1302', '美溪区', '99');
INSERT INTO shop_areas VALUES ('1310', '1302', '金山屯区', '99');
INSERT INTO shop_areas VALUES ('1311', '1302', '五营区', '99');
INSERT INTO shop_areas VALUES ('1312', '1302', '乌马河区', '99');
INSERT INTO shop_areas VALUES ('1313', '1302', '汤旺河区', '99');
INSERT INTO shop_areas VALUES ('1314', '1302', '带岭区', '99');
INSERT INTO shop_areas VALUES ('1315', '1302', '乌伊岭区', '99');
INSERT INTO shop_areas VALUES ('1316', '1302', '红星区', '99');
INSERT INTO shop_areas VALUES ('1317', '1302', '上甘岭区', '99');
INSERT INTO shop_areas VALUES ('1318', '1302', '嘉荫县', '99');
INSERT INTO shop_areas VALUES ('1319', '1302', '铁力市', '99');
INSERT INTO shop_areas VALUES ('1320', '0', '湖北', '99');
INSERT INTO shop_areas VALUES ('1321', '1320', '武汉市', '99');
INSERT INTO shop_areas VALUES ('1322', '1321', '江岸区', '99');
INSERT INTO shop_areas VALUES ('1323', '1321', '江汉区', '99');
INSERT INTO shop_areas VALUES ('1324', '1321', '乔口区', '99');
INSERT INTO shop_areas VALUES ('1325', '1321', '汉阳区', '99');
INSERT INTO shop_areas VALUES ('1326', '1321', '武昌区', '99');
INSERT INTO shop_areas VALUES ('1327', '1321', '青山区', '99');
INSERT INTO shop_areas VALUES ('1328', '1321', '洪山区', '99');
INSERT INTO shop_areas VALUES ('1329', '1321', '东西湖区', '99');
INSERT INTO shop_areas VALUES ('1330', '1321', '汉南区', '99');
INSERT INTO shop_areas VALUES ('1331', '1321', '蔡甸区', '99');
INSERT INTO shop_areas VALUES ('1332', '1321', '江夏区', '99');
INSERT INTO shop_areas VALUES ('1333', '1321', '黄陂区', '99');
INSERT INTO shop_areas VALUES ('1334', '1321', '新洲区', '99');
INSERT INTO shop_areas VALUES ('1335', '1320', '鄂州市', '99');
INSERT INTO shop_areas VALUES ('1336', '1335', '梁子湖区', '99');
INSERT INTO shop_areas VALUES ('1337', '1335', '华容区', '99');
INSERT INTO shop_areas VALUES ('1338', '1335', '鄂城区', '99');
INSERT INTO shop_areas VALUES ('1339', '1320', '恩施土家族苗族自治州', '99');
INSERT INTO shop_areas VALUES ('1340', '1339', '恩施市', '99');
INSERT INTO shop_areas VALUES ('1341', '1339', '利川市', '99');
INSERT INTO shop_areas VALUES ('1342', '1339', '建始县', '99');
INSERT INTO shop_areas VALUES ('1343', '1339', '巴东县', '99');
INSERT INTO shop_areas VALUES ('1344', '1339', '宣恩县', '99');
INSERT INTO shop_areas VALUES ('1345', '1339', '咸丰县', '99');
INSERT INTO shop_areas VALUES ('1346', '1339', '来凤县', '99');
INSERT INTO shop_areas VALUES ('1347', '1339', '鹤峰县', '99');
INSERT INTO shop_areas VALUES ('1348', '1320', '黄冈市', '99');
INSERT INTO shop_areas VALUES ('1349', '1348', '黄州区', '99');
INSERT INTO shop_areas VALUES ('1350', '1348', '团风县', '99');
INSERT INTO shop_areas VALUES ('1351', '1348', '红安县', '99');
INSERT INTO shop_areas VALUES ('1352', '1348', '罗田县', '99');
INSERT INTO shop_areas VALUES ('1353', '1348', '英山县', '99');
INSERT INTO shop_areas VALUES ('1354', '1348', '浠水县', '99');
INSERT INTO shop_areas VALUES ('1355', '1348', '蕲春县', '99');
INSERT INTO shop_areas VALUES ('1356', '1348', '黄梅县', '99');
INSERT INTO shop_areas VALUES ('1357', '1348', '麻城市', '99');
INSERT INTO shop_areas VALUES ('1358', '1348', '武穴市', '99');
INSERT INTO shop_areas VALUES ('1359', '1320', '黄石市', '99');
INSERT INTO shop_areas VALUES ('1360', '1359', '黄石港区', '99');
INSERT INTO shop_areas VALUES ('1361', '1359', '西塞山区', '99');
INSERT INTO shop_areas VALUES ('1362', '1359', '下陆区', '99');
INSERT INTO shop_areas VALUES ('1363', '1359', '铁山区', '99');
INSERT INTO shop_areas VALUES ('1364', '1359', '阳新县', '99');
INSERT INTO shop_areas VALUES ('1365', '1359', '大冶市', '99');
INSERT INTO shop_areas VALUES ('1366', '1320', '荆门市', '99');
INSERT INTO shop_areas VALUES ('1367', '1366', '东宝区', '99');
INSERT INTO shop_areas VALUES ('1368', '1366', '掇刀区', '99');
INSERT INTO shop_areas VALUES ('1369', '1366', '京山县', '99');
INSERT INTO shop_areas VALUES ('1370', '1366', '沙洋县', '99');
INSERT INTO shop_areas VALUES ('1371', '1366', '钟祥市', '99');
INSERT INTO shop_areas VALUES ('1372', '1320', '荆州市', '99');
INSERT INTO shop_areas VALUES ('1373', '1372', '沙市区', '99');
INSERT INTO shop_areas VALUES ('1374', '1372', '荆州区', '99');
INSERT INTO shop_areas VALUES ('1375', '1372', '公安县', '99');
INSERT INTO shop_areas VALUES ('1376', '1372', '监利县', '99');
INSERT INTO shop_areas VALUES ('1377', '1372', '江陵县', '99');
INSERT INTO shop_areas VALUES ('1378', '1372', '石首市', '99');
INSERT INTO shop_areas VALUES ('1379', '1372', '洪湖市', '99');
INSERT INTO shop_areas VALUES ('1380', '1372', '松滋市', '99');
INSERT INTO shop_areas VALUES ('1381', '1320', '潜江市', '99');
INSERT INTO shop_areas VALUES ('1382', '1320', '神农架林区', '99');
INSERT INTO shop_areas VALUES ('1383', '1320', '十堰市', '99');
INSERT INTO shop_areas VALUES ('1384', '1383', '茅箭区', '99');
INSERT INTO shop_areas VALUES ('1385', '1383', '张湾区', '99');
INSERT INTO shop_areas VALUES ('1386', '1383', '郧县', '99');
INSERT INTO shop_areas VALUES ('1387', '1383', '郧西县', '99');
INSERT INTO shop_areas VALUES ('1388', '1383', '竹山县', '99');
INSERT INTO shop_areas VALUES ('1389', '1383', '竹溪县', '99');
INSERT INTO shop_areas VALUES ('1390', '1383', '房县', '99');
INSERT INTO shop_areas VALUES ('1391', '1383', '丹江口市', '99');
INSERT INTO shop_areas VALUES ('1392', '1320', '随州市', '99');
INSERT INTO shop_areas VALUES ('1393', '1392', '曾都区', '99');
INSERT INTO shop_areas VALUES ('1394', '1392', '广水市', '99');
INSERT INTO shop_areas VALUES ('1395', '1320', '天门市', '99');
INSERT INTO shop_areas VALUES ('1396', '1320', '仙桃市', '99');
INSERT INTO shop_areas VALUES ('1397', '1320', '咸宁市', '99');
INSERT INTO shop_areas VALUES ('1398', '1397', '咸安区', '99');
INSERT INTO shop_areas VALUES ('1399', '1397', '嘉鱼县', '99');
INSERT INTO shop_areas VALUES ('1400', '1397', '通城县', '99');
INSERT INTO shop_areas VALUES ('1401', '1397', '崇阳县', '99');
INSERT INTO shop_areas VALUES ('1402', '1397', '通山县', '99');
INSERT INTO shop_areas VALUES ('1403', '1397', '赤壁市', '99');
INSERT INTO shop_areas VALUES ('1404', '1320', '襄樊市', '99');
INSERT INTO shop_areas VALUES ('1405', '1404', '襄城区', '99');
INSERT INTO shop_areas VALUES ('1406', '1404', '樊城区', '99');
INSERT INTO shop_areas VALUES ('1407', '1404', '襄阳区', '99');
INSERT INTO shop_areas VALUES ('1408', '1404', '南漳县', '99');
INSERT INTO shop_areas VALUES ('1409', '1404', '谷城县', '99');
INSERT INTO shop_areas VALUES ('1410', '1404', '保康县', '99');
INSERT INTO shop_areas VALUES ('1411', '1404', '老河口市', '99');
INSERT INTO shop_areas VALUES ('1412', '1404', '枣阳市', '99');
INSERT INTO shop_areas VALUES ('1413', '1404', '宜城市', '99');
INSERT INTO shop_areas VALUES ('1414', '1320', '孝感市', '99');
INSERT INTO shop_areas VALUES ('1415', '1414', '孝南区', '99');
INSERT INTO shop_areas VALUES ('1416', '1414', '孝昌县', '99');
INSERT INTO shop_areas VALUES ('1417', '1414', '大悟县', '99');
INSERT INTO shop_areas VALUES ('1418', '1414', '云梦县', '99');
INSERT INTO shop_areas VALUES ('1419', '1414', '应城市', '99');
INSERT INTO shop_areas VALUES ('1420', '1414', '安陆市', '99');
INSERT INTO shop_areas VALUES ('1421', '1414', '汉川市', '99');
INSERT INTO shop_areas VALUES ('1422', '1320', '宜昌市', '99');
INSERT INTO shop_areas VALUES ('1423', '1422', '西陵区', '99');
INSERT INTO shop_areas VALUES ('1424', '1422', '伍家岗区', '99');
INSERT INTO shop_areas VALUES ('1425', '1422', '点军区', '99');
INSERT INTO shop_areas VALUES ('1426', '1422', '猇亭区', '99');
INSERT INTO shop_areas VALUES ('1427', '1422', '夷陵区', '99');
INSERT INTO shop_areas VALUES ('1428', '1422', '远安县', '99');
INSERT INTO shop_areas VALUES ('1429', '1422', '兴山县', '99');
INSERT INTO shop_areas VALUES ('1430', '1422', '秭归县', '99');
INSERT INTO shop_areas VALUES ('1431', '1422', '长阳土家族自治县', '99');
INSERT INTO shop_areas VALUES ('1432', '1422', '五峰土家族自治县', '99');
INSERT INTO shop_areas VALUES ('1433', '1422', '宜都市', '99');
INSERT INTO shop_areas VALUES ('1434', '1422', '当阳市', '99');
INSERT INTO shop_areas VALUES ('1435', '1422', '枝江市', '99');
INSERT INTO shop_areas VALUES ('1436', '0', '湖南', '99');
INSERT INTO shop_areas VALUES ('1437', '1436', '长沙市', '99');
INSERT INTO shop_areas VALUES ('1438', '1437', '芙蓉区', '99');
INSERT INTO shop_areas VALUES ('1439', '1437', '天心区', '99');
INSERT INTO shop_areas VALUES ('1440', '1437', '岳麓区', '99');
INSERT INTO shop_areas VALUES ('1441', '1437', '开福区', '99');
INSERT INTO shop_areas VALUES ('1442', '1437', '雨花区', '99');
INSERT INTO shop_areas VALUES ('1443', '1437', '长沙县', '99');
INSERT INTO shop_areas VALUES ('1444', '1437', '望城县', '99');
INSERT INTO shop_areas VALUES ('1445', '1437', '宁乡县', '99');
INSERT INTO shop_areas VALUES ('1446', '1437', '浏阳市', '99');
INSERT INTO shop_areas VALUES ('1447', '1436', '常德市', '99');
INSERT INTO shop_areas VALUES ('1448', '1447', '武陵区', '99');
INSERT INTO shop_areas VALUES ('1449', '1447', '鼎城区', '99');
INSERT INTO shop_areas VALUES ('1450', '1447', '安乡县', '99');
INSERT INTO shop_areas VALUES ('1451', '1447', '汉寿县', '99');
INSERT INTO shop_areas VALUES ('1452', '1447', '澧县', '99');
INSERT INTO shop_areas VALUES ('1453', '1447', '临澧县', '99');
INSERT INTO shop_areas VALUES ('1454', '1447', '桃源县', '99');
INSERT INTO shop_areas VALUES ('1455', '1447', '石门县', '99');
INSERT INTO shop_areas VALUES ('1456', '1447', '津市市', '99');
INSERT INTO shop_areas VALUES ('1457', '1436', '郴州市', '99');
INSERT INTO shop_areas VALUES ('1458', '1457', '北湖区', '99');
INSERT INTO shop_areas VALUES ('1459', '1457', '苏仙区', '99');
INSERT INTO shop_areas VALUES ('1460', '1457', '桂阳县', '99');
INSERT INTO shop_areas VALUES ('1461', '1457', '宜章县', '99');
INSERT INTO shop_areas VALUES ('1462', '1457', '永兴县', '99');
INSERT INTO shop_areas VALUES ('1463', '1457', '嘉禾县', '99');
INSERT INTO shop_areas VALUES ('1464', '1457', '临武县', '99');
INSERT INTO shop_areas VALUES ('1465', '1457', '汝城县', '99');
INSERT INTO shop_areas VALUES ('1466', '1457', '桂东县', '99');
INSERT INTO shop_areas VALUES ('1467', '1457', '安仁县', '99');
INSERT INTO shop_areas VALUES ('1468', '1457', '资兴市', '99');
INSERT INTO shop_areas VALUES ('1469', '1436', '衡阳市', '99');
INSERT INTO shop_areas VALUES ('1470', '1469', '珠晖区', '99');
INSERT INTO shop_areas VALUES ('1471', '1469', '雁峰区', '99');
INSERT INTO shop_areas VALUES ('1472', '1469', '石鼓区', '99');
INSERT INTO shop_areas VALUES ('1473', '1469', '蒸湘区', '99');
INSERT INTO shop_areas VALUES ('1474', '1469', '南岳区', '99');
INSERT INTO shop_areas VALUES ('1475', '1469', '衡阳县', '99');
INSERT INTO shop_areas VALUES ('1476', '1469', '衡南县', '99');
INSERT INTO shop_areas VALUES ('1477', '1469', '衡山县', '99');
INSERT INTO shop_areas VALUES ('1478', '1469', '衡东县', '99');
INSERT INTO shop_areas VALUES ('1479', '1469', '祁东县', '99');
INSERT INTO shop_areas VALUES ('1480', '1469', '耒阳市', '99');
INSERT INTO shop_areas VALUES ('1481', '1469', '常宁市', '99');
INSERT INTO shop_areas VALUES ('1482', '1436', '怀化市', '99');
INSERT INTO shop_areas VALUES ('1483', '1482', '鹤城区', '99');
INSERT INTO shop_areas VALUES ('1484', '1482', '中方县', '99');
INSERT INTO shop_areas VALUES ('1485', '1482', '沅陵县', '99');
INSERT INTO shop_areas VALUES ('1486', '1482', '辰溪县', '99');
INSERT INTO shop_areas VALUES ('1487', '1482', '溆浦县', '99');
INSERT INTO shop_areas VALUES ('1488', '1482', '会同县', '99');
INSERT INTO shop_areas VALUES ('1489', '1482', '麻阳苗族自治县', '99');
INSERT INTO shop_areas VALUES ('1490', '1482', '新晃侗族自治县', '99');
INSERT INTO shop_areas VALUES ('1491', '1482', '芷江侗族自治县', '99');
INSERT INTO shop_areas VALUES ('1492', '1482', '靖州苗族侗族自治县', '99');
INSERT INTO shop_areas VALUES ('1493', '1482', '通道侗族自治县', '99');
INSERT INTO shop_areas VALUES ('1494', '1482', '洪江市', '99');
INSERT INTO shop_areas VALUES ('1495', '1436', '娄底市', '99');
INSERT INTO shop_areas VALUES ('1496', '1495', '娄星区', '99');
INSERT INTO shop_areas VALUES ('1497', '1495', '双峰县', '99');
INSERT INTO shop_areas VALUES ('1498', '1495', '新化县', '99');
INSERT INTO shop_areas VALUES ('1499', '1495', '冷水江市', '99');
INSERT INTO shop_areas VALUES ('1500', '1495', '涟源市', '99');
INSERT INTO shop_areas VALUES ('1501', '1436', '邵阳市', '99');
INSERT INTO shop_areas VALUES ('1502', '1501', '双清区', '99');
INSERT INTO shop_areas VALUES ('1503', '1501', '大祥区', '99');
INSERT INTO shop_areas VALUES ('1504', '1501', '北塔区', '99');
INSERT INTO shop_areas VALUES ('1505', '1501', '邵东县', '99');
INSERT INTO shop_areas VALUES ('1506', '1501', '新邵县', '99');
INSERT INTO shop_areas VALUES ('1507', '1501', '邵阳县', '99');
INSERT INTO shop_areas VALUES ('1508', '1501', '隆回县', '99');
INSERT INTO shop_areas VALUES ('1509', '1501', '洞口县', '99');
INSERT INTO shop_areas VALUES ('1510', '1501', '绥宁县', '99');
INSERT INTO shop_areas VALUES ('1511', '1501', '新宁县', '99');
INSERT INTO shop_areas VALUES ('1512', '1501', '城步苗族自治县', '99');
INSERT INTO shop_areas VALUES ('1513', '1501', '武冈市', '99');
INSERT INTO shop_areas VALUES ('1514', '1436', '湘潭市', '99');
INSERT INTO shop_areas VALUES ('1515', '1514', '雨湖区', '99');
INSERT INTO shop_areas VALUES ('1516', '1514', '岳塘区', '99');
INSERT INTO shop_areas VALUES ('1517', '1514', '湘潭县', '99');
INSERT INTO shop_areas VALUES ('1518', '1514', '湘乡市', '99');
INSERT INTO shop_areas VALUES ('1519', '1514', '韶山市', '99');
INSERT INTO shop_areas VALUES ('1520', '1436', '湘西土家族苗族自治州', '99');
INSERT INTO shop_areas VALUES ('1521', '1520', '吉首市', '99');
INSERT INTO shop_areas VALUES ('1522', '1520', '泸溪县', '99');
INSERT INTO shop_areas VALUES ('1523', '1520', '凤凰县', '99');
INSERT INTO shop_areas VALUES ('1524', '1520', '花垣县', '99');
INSERT INTO shop_areas VALUES ('1525', '1520', '保靖县', '99');
INSERT INTO shop_areas VALUES ('1526', '1520', '古丈县', '99');
INSERT INTO shop_areas VALUES ('1527', '1520', '永顺县', '99');
INSERT INTO shop_areas VALUES ('1528', '1520', '龙山县', '99');
INSERT INTO shop_areas VALUES ('1529', '1436', '益阳市', '99');
INSERT INTO shop_areas VALUES ('1530', '1529', '资阳区', '99');
INSERT INTO shop_areas VALUES ('1531', '1529', '赫山区', '99');
INSERT INTO shop_areas VALUES ('1532', '1529', '南县', '99');
INSERT INTO shop_areas VALUES ('1533', '1529', '桃江县', '99');
INSERT INTO shop_areas VALUES ('1534', '1529', '安化县', '99');
INSERT INTO shop_areas VALUES ('1535', '1529', '沅江市', '99');
INSERT INTO shop_areas VALUES ('1536', '1436', '永州市', '99');
INSERT INTO shop_areas VALUES ('1537', '1536', '芝山区', '99');
INSERT INTO shop_areas VALUES ('1538', '1536', '冷水滩区', '99');
INSERT INTO shop_areas VALUES ('1539', '1536', '祁阳县', '99');
INSERT INTO shop_areas VALUES ('1540', '1536', '东安县', '99');
INSERT INTO shop_areas VALUES ('1541', '1536', '双牌县', '99');
INSERT INTO shop_areas VALUES ('1542', '1536', '道县', '99');
INSERT INTO shop_areas VALUES ('1543', '1536', '江永县', '99');
INSERT INTO shop_areas VALUES ('1544', '1536', '宁远县', '99');
INSERT INTO shop_areas VALUES ('1545', '1536', '蓝山县', '99');
INSERT INTO shop_areas VALUES ('1546', '1536', '新田县', '99');
INSERT INTO shop_areas VALUES ('1547', '1536', '江华瑶族自治县', '99');
INSERT INTO shop_areas VALUES ('1548', '1436', '岳阳市', '99');
INSERT INTO shop_areas VALUES ('1549', '1548', '岳阳楼区', '99');
INSERT INTO shop_areas VALUES ('1550', '1548', '云溪区', '99');
INSERT INTO shop_areas VALUES ('1551', '1548', '君山区', '99');
INSERT INTO shop_areas VALUES ('1552', '1548', '岳阳县', '99');
INSERT INTO shop_areas VALUES ('1553', '1548', '华容县', '99');
INSERT INTO shop_areas VALUES ('1554', '1548', '湘阴县', '99');
INSERT INTO shop_areas VALUES ('1555', '1548', '平江县', '99');
INSERT INTO shop_areas VALUES ('1556', '1548', '汨罗市', '99');
INSERT INTO shop_areas VALUES ('1557', '1548', '临湘市', '99');
INSERT INTO shop_areas VALUES ('1558', '1436', '张家界市', '99');
INSERT INTO shop_areas VALUES ('1559', '1558', '永定区', '99');
INSERT INTO shop_areas VALUES ('1560', '1558', '武陵源区', '99');
INSERT INTO shop_areas VALUES ('1561', '1558', '慈利县', '99');
INSERT INTO shop_areas VALUES ('1562', '1558', '桑植县', '99');
INSERT INTO shop_areas VALUES ('1563', '1436', '株洲市', '99');
INSERT INTO shop_areas VALUES ('1564', '1563', '荷塘区', '99');
INSERT INTO shop_areas VALUES ('1565', '1563', '芦淞区', '99');
INSERT INTO shop_areas VALUES ('1566', '1563', '石峰区', '99');
INSERT INTO shop_areas VALUES ('1567', '1563', '天元区', '99');
INSERT INTO shop_areas VALUES ('1568', '1563', '株洲县', '99');
INSERT INTO shop_areas VALUES ('1569', '1563', '攸县', '99');
INSERT INTO shop_areas VALUES ('1570', '1563', '茶陵县', '99');
INSERT INTO shop_areas VALUES ('1571', '1563', '炎陵县', '99');
INSERT INTO shop_areas VALUES ('1572', '1563', '醴陵市', '99');
INSERT INTO shop_areas VALUES ('1573', '0', '吉林', '99');
INSERT INTO shop_areas VALUES ('1574', '1573', '长春市', '99');
INSERT INTO shop_areas VALUES ('1575', '1574', '南关区', '99');
INSERT INTO shop_areas VALUES ('1576', '1574', '宽城区', '99');
INSERT INTO shop_areas VALUES ('1577', '1574', '朝阳区', '99');
INSERT INTO shop_areas VALUES ('1578', '1574', '二道区', '99');
INSERT INTO shop_areas VALUES ('1579', '1574', '绿园区', '99');
INSERT INTO shop_areas VALUES ('1580', '1574', '双阳区', '99');
INSERT INTO shop_areas VALUES ('1581', '1574', '农安县', '99');
INSERT INTO shop_areas VALUES ('1582', '1574', '九台市', '99');
INSERT INTO shop_areas VALUES ('1583', '1574', '榆树市', '99');
INSERT INTO shop_areas VALUES ('1584', '1574', '德惠市', '99');
INSERT INTO shop_areas VALUES ('1585', '1573', '白城市', '99');
INSERT INTO shop_areas VALUES ('1586', '1585', '洮北区', '99');
INSERT INTO shop_areas VALUES ('1587', '1585', '镇赉县', '99');
INSERT INTO shop_areas VALUES ('1588', '1585', '通榆县', '99');
INSERT INTO shop_areas VALUES ('1589', '1585', '洮南市', '99');
INSERT INTO shop_areas VALUES ('1590', '1585', '大安市', '99');
INSERT INTO shop_areas VALUES ('1591', '1573', '白山市', '99');
INSERT INTO shop_areas VALUES ('1592', '1591', '八道江区', '99');
INSERT INTO shop_areas VALUES ('1593', '1591', '抚松县', '99');
INSERT INTO shop_areas VALUES ('1594', '1591', '靖宇县', '99');
INSERT INTO shop_areas VALUES ('1595', '1591', '长白朝鲜族自治县', '99');
INSERT INTO shop_areas VALUES ('1596', '1591', '江源县', '99');
INSERT INTO shop_areas VALUES ('1597', '1591', '临江市', '99');
INSERT INTO shop_areas VALUES ('1598', '1573', '吉林市', '99');
INSERT INTO shop_areas VALUES ('1599', '1598', '昌邑区', '99');
INSERT INTO shop_areas VALUES ('1600', '1598', '龙潭区', '99');
INSERT INTO shop_areas VALUES ('1601', '1598', '船营区', '99');
INSERT INTO shop_areas VALUES ('1602', '1598', '丰满区', '99');
INSERT INTO shop_areas VALUES ('1603', '1598', '永吉县', '99');
INSERT INTO shop_areas VALUES ('1604', '1598', '蛟河市', '99');
INSERT INTO shop_areas VALUES ('1605', '1598', '桦甸市', '99');
INSERT INTO shop_areas VALUES ('1606', '1598', '舒兰市', '99');
INSERT INTO shop_areas VALUES ('1607', '1598', '磐石市', '99');
INSERT INTO shop_areas VALUES ('1608', '1573', '辽源市', '99');
INSERT INTO shop_areas VALUES ('1609', '1608', '龙山区', '99');
INSERT INTO shop_areas VALUES ('1610', '1608', '西安区', '99');
INSERT INTO shop_areas VALUES ('1611', '1608', '东丰县', '99');
INSERT INTO shop_areas VALUES ('1612', '1608', '东辽县', '99');
INSERT INTO shop_areas VALUES ('1613', '1573', '四平市', '99');
INSERT INTO shop_areas VALUES ('1614', '1613', '铁西区', '99');
INSERT INTO shop_areas VALUES ('1615', '1613', '铁东区', '99');
INSERT INTO shop_areas VALUES ('1616', '1613', '梨树县', '99');
INSERT INTO shop_areas VALUES ('1617', '1613', '伊通满族自治县', '99');
INSERT INTO shop_areas VALUES ('1618', '1613', '公主岭市', '99');
INSERT INTO shop_areas VALUES ('1619', '1613', '双辽市', '99');
INSERT INTO shop_areas VALUES ('1620', '1573', '松原市', '99');
INSERT INTO shop_areas VALUES ('1621', '1620', '宁江区', '99');
INSERT INTO shop_areas VALUES ('1622', '1620', '前郭尔罗斯蒙古族自治县', '99');
INSERT INTO shop_areas VALUES ('1623', '1620', '长岭县', '99');
INSERT INTO shop_areas VALUES ('1624', '1620', '乾安县', '99');
INSERT INTO shop_areas VALUES ('1625', '1620', '扶余县', '99');
INSERT INTO shop_areas VALUES ('1626', '1573', '通化市', '99');
INSERT INTO shop_areas VALUES ('1627', '1626', '东昌区', '99');
INSERT INTO shop_areas VALUES ('1628', '1626', '二道江区', '99');
INSERT INTO shop_areas VALUES ('1629', '1626', '通化县', '99');
INSERT INTO shop_areas VALUES ('1630', '1626', '辉南县', '99');
INSERT INTO shop_areas VALUES ('1631', '1626', '柳河县', '99');
INSERT INTO shop_areas VALUES ('1632', '1626', '梅河口市', '99');
INSERT INTO shop_areas VALUES ('1633', '1626', '集安市', '99');
INSERT INTO shop_areas VALUES ('1634', '1573', '延边朝鲜族自治州', '99');
INSERT INTO shop_areas VALUES ('1635', '1634', '延吉市', '99');
INSERT INTO shop_areas VALUES ('1636', '1634', '图们市', '99');
INSERT INTO shop_areas VALUES ('1637', '1634', '敦化市', '99');
INSERT INTO shop_areas VALUES ('1638', '1634', '珲春市', '99');
INSERT INTO shop_areas VALUES ('1639', '1634', '龙井市', '99');
INSERT INTO shop_areas VALUES ('1640', '1634', '和龙市', '99');
INSERT INTO shop_areas VALUES ('1641', '1634', '汪清县', '99');
INSERT INTO shop_areas VALUES ('1642', '1634', '安图县', '99');
INSERT INTO shop_areas VALUES ('1643', '0', '江苏', '99');
INSERT INTO shop_areas VALUES ('1644', '1643', '南京市', '99');
INSERT INTO shop_areas VALUES ('1645', '1644', '玄武区', '99');
INSERT INTO shop_areas VALUES ('1646', '1644', '白下区', '99');
INSERT INTO shop_areas VALUES ('1647', '1644', '秦淮区', '99');
INSERT INTO shop_areas VALUES ('1648', '1644', '建邺区', '99');
INSERT INTO shop_areas VALUES ('1649', '1644', '鼓楼区', '99');
INSERT INTO shop_areas VALUES ('1650', '1644', '下关区', '99');
INSERT INTO shop_areas VALUES ('1651', '1644', '浦口区', '99');
INSERT INTO shop_areas VALUES ('1652', '1644', '栖霞区', '99');
INSERT INTO shop_areas VALUES ('1653', '1644', '雨花台区', '99');
INSERT INTO shop_areas VALUES ('1654', '1644', '江宁区', '99');
INSERT INTO shop_areas VALUES ('1655', '1644', '六合区', '99');
INSERT INTO shop_areas VALUES ('1656', '1644', '溧水县', '99');
INSERT INTO shop_areas VALUES ('1657', '1644', '高淳县', '99');
INSERT INTO shop_areas VALUES ('1658', '1643', '常州市', '99');
INSERT INTO shop_areas VALUES ('1659', '1658', '天宁区', '99');
INSERT INTO shop_areas VALUES ('1660', '1658', '钟楼区', '99');
INSERT INTO shop_areas VALUES ('1661', '1658', '戚墅堰区', '99');
INSERT INTO shop_areas VALUES ('1662', '1658', '新北区', '99');
INSERT INTO shop_areas VALUES ('1663', '1658', '武进区', '99');
INSERT INTO shop_areas VALUES ('1664', '1658', '溧阳市', '99');
INSERT INTO shop_areas VALUES ('1665', '1658', '金坛市', '99');
INSERT INTO shop_areas VALUES ('1666', '1643', '淮安市', '99');
INSERT INTO shop_areas VALUES ('1667', '1666', '清河区', '99');
INSERT INTO shop_areas VALUES ('1668', '1666', '楚州区', '99');
INSERT INTO shop_areas VALUES ('1669', '1666', '淮阴区', '99');
INSERT INTO shop_areas VALUES ('1670', '1666', '清浦区', '99');
INSERT INTO shop_areas VALUES ('1671', '1666', '涟水县', '99');
INSERT INTO shop_areas VALUES ('1672', '1666', '洪泽县', '99');
INSERT INTO shop_areas VALUES ('1673', '1666', '盱眙县', '99');
INSERT INTO shop_areas VALUES ('1674', '1666', '金湖县', '99');
INSERT INTO shop_areas VALUES ('1675', '1643', '连云港市', '99');
INSERT INTO shop_areas VALUES ('1676', '1675', '连云区', '99');
INSERT INTO shop_areas VALUES ('1677', '1675', '新浦区', '99');
INSERT INTO shop_areas VALUES ('1678', '1675', '海州区', '99');
INSERT INTO shop_areas VALUES ('1679', '1675', '赣榆县', '99');
INSERT INTO shop_areas VALUES ('1680', '1675', '东海县', '99');
INSERT INTO shop_areas VALUES ('1681', '1675', '灌云县', '99');
INSERT INTO shop_areas VALUES ('1682', '1675', '灌南县', '99');
INSERT INTO shop_areas VALUES ('1683', '1643', '南通市', '99');
INSERT INTO shop_areas VALUES ('1684', '1683', '崇川区', '99');
INSERT INTO shop_areas VALUES ('1685', '1683', '港闸区', '99');
INSERT INTO shop_areas VALUES ('1686', '1683', '海安县', '99');
INSERT INTO shop_areas VALUES ('1687', '1683', '如东县', '99');
INSERT INTO shop_areas VALUES ('1688', '1683', '启东市', '99');
INSERT INTO shop_areas VALUES ('1689', '1683', '如皋市', '99');
INSERT INTO shop_areas VALUES ('1690', '1683', '通州市', '99');
INSERT INTO shop_areas VALUES ('1691', '1683', '海门市', '99');
INSERT INTO shop_areas VALUES ('1692', '1643', '苏州市', '99');
INSERT INTO shop_areas VALUES ('1693', '1692', '沧浪区', '99');
INSERT INTO shop_areas VALUES ('1694', '1692', '平江区', '99');
INSERT INTO shop_areas VALUES ('1695', '1692', '金阊区', '99');
INSERT INTO shop_areas VALUES ('1696', '1692', '虎丘区', '99');
INSERT INTO shop_areas VALUES ('1697', '1692', '吴中区', '99');
INSERT INTO shop_areas VALUES ('1698', '1692', '相城区', '99');
INSERT INTO shop_areas VALUES ('1699', '1692', '常熟市', '99');
INSERT INTO shop_areas VALUES ('1700', '1692', '张家港市', '99');
INSERT INTO shop_areas VALUES ('1701', '1692', '昆山市', '99');
INSERT INTO shop_areas VALUES ('1702', '1692', '吴江市', '99');
INSERT INTO shop_areas VALUES ('1703', '1692', '太仓市', '99');
INSERT INTO shop_areas VALUES ('1704', '1643', '宿迁市', '99');
INSERT INTO shop_areas VALUES ('1705', '1704', '宿城区', '99');
INSERT INTO shop_areas VALUES ('1706', '1704', '宿豫区', '99');
INSERT INTO shop_areas VALUES ('1707', '1704', '沭阳县', '99');
INSERT INTO shop_areas VALUES ('1708', '1704', '泗阳县', '99');
INSERT INTO shop_areas VALUES ('1709', '1704', '泗洪县', '99');
INSERT INTO shop_areas VALUES ('1710', '1643', '泰州市', '99');
INSERT INTO shop_areas VALUES ('1711', '1710', '海陵区', '99');
INSERT INTO shop_areas VALUES ('1712', '1710', '高港区', '99');
INSERT INTO shop_areas VALUES ('1713', '1710', '兴化市', '99');
INSERT INTO shop_areas VALUES ('1714', '1710', '靖江市', '99');
INSERT INTO shop_areas VALUES ('1715', '1710', '泰兴市', '99');
INSERT INTO shop_areas VALUES ('1716', '1710', '姜堰市', '99');
INSERT INTO shop_areas VALUES ('1717', '1643', '无锡市', '99');
INSERT INTO shop_areas VALUES ('1718', '1717', '崇安区', '99');
INSERT INTO shop_areas VALUES ('1719', '1717', '南长区', '99');
INSERT INTO shop_areas VALUES ('1720', '1717', '北塘区', '99');
INSERT INTO shop_areas VALUES ('1721', '1717', '锡山区', '99');
INSERT INTO shop_areas VALUES ('1722', '1717', '惠山区', '99');
INSERT INTO shop_areas VALUES ('1723', '1717', '滨湖区', '99');
INSERT INTO shop_areas VALUES ('1724', '1717', '江阴市', '99');
INSERT INTO shop_areas VALUES ('1725', '1717', '宜兴市', '99');
INSERT INTO shop_areas VALUES ('1726', '1643', '徐州市', '99');
INSERT INTO shop_areas VALUES ('1727', '1726', '鼓楼区', '99');
INSERT INTO shop_areas VALUES ('1728', '1726', '云龙区', '99');
INSERT INTO shop_areas VALUES ('1729', '1726', '九里区', '99');
INSERT INTO shop_areas VALUES ('1730', '1726', '贾汪区', '99');
INSERT INTO shop_areas VALUES ('1731', '1726', '泉山区', '99');
INSERT INTO shop_areas VALUES ('1732', '1726', '丰县', '99');
INSERT INTO shop_areas VALUES ('1733', '1726', '沛县', '99');
INSERT INTO shop_areas VALUES ('1734', '1726', '铜山县', '99');
INSERT INTO shop_areas VALUES ('1735', '1726', '睢宁县', '99');
INSERT INTO shop_areas VALUES ('1736', '1726', '新沂市', '99');
INSERT INTO shop_areas VALUES ('1737', '1726', '邳州市', '99');
INSERT INTO shop_areas VALUES ('1738', '1643', '盐城市', '99');
INSERT INTO shop_areas VALUES ('1739', '1738', '亭湖区', '99');
INSERT INTO shop_areas VALUES ('1740', '1738', '盐都区', '99');
INSERT INTO shop_areas VALUES ('1741', '1738', '响水县', '99');
INSERT INTO shop_areas VALUES ('1742', '1738', '滨海县', '99');
INSERT INTO shop_areas VALUES ('1743', '1738', '阜宁县', '99');
INSERT INTO shop_areas VALUES ('1744', '1738', '射阳县', '99');
INSERT INTO shop_areas VALUES ('1745', '1738', '建湖县', '99');
INSERT INTO shop_areas VALUES ('1746', '1738', '东台市', '99');
INSERT INTO shop_areas VALUES ('1747', '1738', '大丰市', '99');
INSERT INTO shop_areas VALUES ('1748', '1643', '扬州市', '99');
INSERT INTO shop_areas VALUES ('1749', '1748', '广陵区', '99');
INSERT INTO shop_areas VALUES ('1750', '1748', '邗江区', '99');
INSERT INTO shop_areas VALUES ('1751', '1748', '郊区', '99');
INSERT INTO shop_areas VALUES ('1752', '1748', '宝应县', '99');
INSERT INTO shop_areas VALUES ('1753', '1748', '仪征市', '99');
INSERT INTO shop_areas VALUES ('1754', '1748', '高邮市', '99');
INSERT INTO shop_areas VALUES ('1755', '1748', '江都市', '99');
INSERT INTO shop_areas VALUES ('1756', '1643', '镇江市', '99');
INSERT INTO shop_areas VALUES ('1757', '1756', '京口区', '99');
INSERT INTO shop_areas VALUES ('1758', '1756', '润州区', '99');
INSERT INTO shop_areas VALUES ('1759', '1756', '丹徒区', '99');
INSERT INTO shop_areas VALUES ('1760', '1756', '丹阳市', '99');
INSERT INTO shop_areas VALUES ('1761', '1756', '扬中市', '99');
INSERT INTO shop_areas VALUES ('1762', '1756', '句容市', '99');
INSERT INTO shop_areas VALUES ('1763', '0', '江西', '99');
INSERT INTO shop_areas VALUES ('1764', '1763', '南昌市', '99');
INSERT INTO shop_areas VALUES ('1765', '1764', '东湖区', '99');
INSERT INTO shop_areas VALUES ('1766', '1764', '西湖区', '99');
INSERT INTO shop_areas VALUES ('1767', '1764', '青云谱区', '99');
INSERT INTO shop_areas VALUES ('1768', '1764', '湾里区', '99');
INSERT INTO shop_areas VALUES ('1769', '1764', '青山湖区', '99');
INSERT INTO shop_areas VALUES ('1770', '1764', '南昌县', '99');
INSERT INTO shop_areas VALUES ('1771', '1764', '新建县', '99');
INSERT INTO shop_areas VALUES ('1772', '1764', '安义县', '99');
INSERT INTO shop_areas VALUES ('1773', '1764', '进贤县', '99');
INSERT INTO shop_areas VALUES ('1774', '1763', '抚州市', '99');
INSERT INTO shop_areas VALUES ('1775', '1774', '临川区', '99');
INSERT INTO shop_areas VALUES ('1776', '1774', '南城县', '99');
INSERT INTO shop_areas VALUES ('1777', '1774', '黎川县', '99');
INSERT INTO shop_areas VALUES ('1778', '1774', '南丰县', '99');
INSERT INTO shop_areas VALUES ('1779', '1774', '崇仁县', '99');
INSERT INTO shop_areas VALUES ('1780', '1774', '乐安县', '99');
INSERT INTO shop_areas VALUES ('1781', '1774', '宜黄县', '99');
INSERT INTO shop_areas VALUES ('1782', '1774', '金溪县', '99');
INSERT INTO shop_areas VALUES ('1783', '1774', '资溪县', '99');
INSERT INTO shop_areas VALUES ('1784', '1774', '东乡县', '99');
INSERT INTO shop_areas VALUES ('1785', '1774', '广昌县', '99');
INSERT INTO shop_areas VALUES ('1786', '1763', '赣州市', '99');
INSERT INTO shop_areas VALUES ('1787', '1786', '章贡区', '99');
INSERT INTO shop_areas VALUES ('1788', '1786', '赣县', '99');
INSERT INTO shop_areas VALUES ('1789', '1786', '信丰县', '99');
INSERT INTO shop_areas VALUES ('1790', '1786', '大余县', '99');
INSERT INTO shop_areas VALUES ('1791', '1786', '上犹县', '99');
INSERT INTO shop_areas VALUES ('1792', '1786', '崇义县', '99');
INSERT INTO shop_areas VALUES ('1793', '1786', '安远县', '99');
INSERT INTO shop_areas VALUES ('1794', '1786', '龙南县', '99');
INSERT INTO shop_areas VALUES ('1795', '1786', '定南县', '99');
INSERT INTO shop_areas VALUES ('1796', '1786', '全南县', '99');
INSERT INTO shop_areas VALUES ('1797', '1786', '宁都县', '99');
INSERT INTO shop_areas VALUES ('1798', '1786', '于都县', '99');
INSERT INTO shop_areas VALUES ('1799', '1786', '兴国县', '99');
INSERT INTO shop_areas VALUES ('1800', '1786', '会昌县', '99');
INSERT INTO shop_areas VALUES ('1801', '1786', '寻乌县', '99');
INSERT INTO shop_areas VALUES ('1802', '1786', '石城县', '99');
INSERT INTO shop_areas VALUES ('1803', '1786', '瑞金市', '99');
INSERT INTO shop_areas VALUES ('1804', '1786', '南康市', '99');
INSERT INTO shop_areas VALUES ('1805', '1763', '吉安市', '99');
INSERT INTO shop_areas VALUES ('1806', '1805', '吉州区', '99');
INSERT INTO shop_areas VALUES ('1807', '1805', '青原区', '99');
INSERT INTO shop_areas VALUES ('1808', '1805', '吉安县', '99');
INSERT INTO shop_areas VALUES ('1809', '1805', '吉水县', '99');
INSERT INTO shop_areas VALUES ('1810', '1805', '峡江县', '99');
INSERT INTO shop_areas VALUES ('1811', '1805', '新干县', '99');
INSERT INTO shop_areas VALUES ('1812', '1805', '永丰县', '99');
INSERT INTO shop_areas VALUES ('1813', '1805', '泰和县', '99');
INSERT INTO shop_areas VALUES ('1814', '1805', '遂川县', '99');
INSERT INTO shop_areas VALUES ('1815', '1805', '万安县', '99');
INSERT INTO shop_areas VALUES ('1816', '1805', '安福县', '99');
INSERT INTO shop_areas VALUES ('1817', '1805', '永新县', '99');
INSERT INTO shop_areas VALUES ('1818', '1805', '井冈山市', '99');
INSERT INTO shop_areas VALUES ('1819', '1763', '景德镇市', '99');
INSERT INTO shop_areas VALUES ('1820', '1819', '昌江区', '99');
INSERT INTO shop_areas VALUES ('1821', '1819', '珠山区', '99');
INSERT INTO shop_areas VALUES ('1822', '1819', '浮梁县', '99');
INSERT INTO shop_areas VALUES ('1823', '1819', '乐平市', '99');
INSERT INTO shop_areas VALUES ('1824', '1763', '九江市', '99');
INSERT INTO shop_areas VALUES ('1825', '1824', '庐山区', '99');
INSERT INTO shop_areas VALUES ('1826', '1824', '浔阳区', '99');
INSERT INTO shop_areas VALUES ('1827', '1824', '九江县', '99');
INSERT INTO shop_areas VALUES ('1828', '1824', '武宁县', '99');
INSERT INTO shop_areas VALUES ('1829', '1824', '修水县', '99');
INSERT INTO shop_areas VALUES ('1830', '1824', '永修县', '99');
INSERT INTO shop_areas VALUES ('1831', '1824', '德安县', '99');
INSERT INTO shop_areas VALUES ('1832', '1824', '星子县', '99');
INSERT INTO shop_areas VALUES ('1833', '1824', '都昌县', '99');
INSERT INTO shop_areas VALUES ('1834', '1824', '湖口县', '99');
INSERT INTO shop_areas VALUES ('1835', '1824', '彭泽县', '99');
INSERT INTO shop_areas VALUES ('1836', '1824', '瑞昌市', '99');
INSERT INTO shop_areas VALUES ('1837', '1763', '萍乡市', '99');
INSERT INTO shop_areas VALUES ('1838', '1837', '安源区', '99');
INSERT INTO shop_areas VALUES ('1839', '1837', '湘东区', '99');
INSERT INTO shop_areas VALUES ('1840', '1837', '莲花县', '99');
INSERT INTO shop_areas VALUES ('1841', '1837', '上栗县', '99');
INSERT INTO shop_areas VALUES ('1842', '1837', '芦溪县', '99');
INSERT INTO shop_areas VALUES ('1843', '1763', '上饶市', '99');
INSERT INTO shop_areas VALUES ('1844', '1843', '信州区', '99');
INSERT INTO shop_areas VALUES ('1845', '1843', '上饶县', '99');
INSERT INTO shop_areas VALUES ('1846', '1843', '广丰县', '99');
INSERT INTO shop_areas VALUES ('1847', '1843', '玉山县', '99');
INSERT INTO shop_areas VALUES ('1848', '1843', '铅山县', '99');
INSERT INTO shop_areas VALUES ('1849', '1843', '横峰县', '99');
INSERT INTO shop_areas VALUES ('1850', '1843', '弋阳县', '99');
INSERT INTO shop_areas VALUES ('1851', '1843', '余干县', '99');
INSERT INTO shop_areas VALUES ('1852', '1843', '鄱阳县', '99');
INSERT INTO shop_areas VALUES ('1853', '1843', '万年县', '99');
INSERT INTO shop_areas VALUES ('1854', '1843', '婺源县', '99');
INSERT INTO shop_areas VALUES ('1855', '1843', '德兴市', '99');
INSERT INTO shop_areas VALUES ('1856', '1763', '新余市', '99');
INSERT INTO shop_areas VALUES ('1857', '1856', '渝水区', '99');
INSERT INTO shop_areas VALUES ('1858', '1856', '分宜县', '99');
INSERT INTO shop_areas VALUES ('1859', '1763', '宜春市', '99');
INSERT INTO shop_areas VALUES ('1860', '1859', '袁州区', '99');
INSERT INTO shop_areas VALUES ('1861', '1859', '奉新县', '99');
INSERT INTO shop_areas VALUES ('1862', '1859', '万载县', '99');
INSERT INTO shop_areas VALUES ('1863', '1859', '上高县', '99');
INSERT INTO shop_areas VALUES ('1864', '1859', '宜丰县', '99');
INSERT INTO shop_areas VALUES ('1865', '1859', '靖安县', '99');
INSERT INTO shop_areas VALUES ('1866', '1859', '铜鼓县', '99');
INSERT INTO shop_areas VALUES ('1867', '1859', '丰城市', '99');
INSERT INTO shop_areas VALUES ('1868', '1859', '樟树市', '99');
INSERT INTO shop_areas VALUES ('1869', '1859', '高安市', '99');
INSERT INTO shop_areas VALUES ('1870', '1763', '鹰潭市', '99');
INSERT INTO shop_areas VALUES ('1871', '1870', '月湖区', '99');
INSERT INTO shop_areas VALUES ('1872', '1870', '余江县', '99');
INSERT INTO shop_areas VALUES ('1873', '1870', '贵溪市', '99');
INSERT INTO shop_areas VALUES ('1874', '0', '辽宁', '99');
INSERT INTO shop_areas VALUES ('1875', '1874', '沈阳市', '99');
INSERT INTO shop_areas VALUES ('1876', '1875', '和平区', '99');
INSERT INTO shop_areas VALUES ('1877', '1875', '沈河区', '99');
INSERT INTO shop_areas VALUES ('1878', '1875', '大东区', '99');
INSERT INTO shop_areas VALUES ('1879', '1875', '皇姑区', '99');
INSERT INTO shop_areas VALUES ('1880', '1875', '铁西区', '99');
INSERT INTO shop_areas VALUES ('1881', '1875', '苏家屯区', '99');
INSERT INTO shop_areas VALUES ('1882', '1875', '东陵区', '99');
INSERT INTO shop_areas VALUES ('1883', '1875', '新城子区', '99');
INSERT INTO shop_areas VALUES ('1884', '1875', '于洪区', '99');
INSERT INTO shop_areas VALUES ('1885', '1875', '辽中县', '99');
INSERT INTO shop_areas VALUES ('1886', '1875', '康平县', '99');
INSERT INTO shop_areas VALUES ('1887', '1875', '法库县', '99');
INSERT INTO shop_areas VALUES ('1888', '1875', '新民市', '99');
INSERT INTO shop_areas VALUES ('1889', '1874', '鞍山市', '99');
INSERT INTO shop_areas VALUES ('1890', '1889', '铁东区', '99');
INSERT INTO shop_areas VALUES ('1891', '1889', '铁西区', '99');
INSERT INTO shop_areas VALUES ('1892', '1889', '立山区', '99');
INSERT INTO shop_areas VALUES ('1893', '1889', '千山区', '99');
INSERT INTO shop_areas VALUES ('1894', '1889', '台安县', '99');
INSERT INTO shop_areas VALUES ('1895', '1889', '岫岩满族自治县', '99');
INSERT INTO shop_areas VALUES ('1896', '1889', '海城市', '99');
INSERT INTO shop_areas VALUES ('1897', '1874', '本溪市', '99');
INSERT INTO shop_areas VALUES ('1898', '1897', '平山区', '99');
INSERT INTO shop_areas VALUES ('1899', '1897', '溪湖区', '99');
INSERT INTO shop_areas VALUES ('1900', '1897', '明山区', '99');
INSERT INTO shop_areas VALUES ('1901', '1897', '南芬区', '99');
INSERT INTO shop_areas VALUES ('1902', '1897', '本溪满族自治县', '99');
INSERT INTO shop_areas VALUES ('1903', '1897', '桓仁满族自治县', '99');
INSERT INTO shop_areas VALUES ('1904', '1874', '朝阳市', '99');
INSERT INTO shop_areas VALUES ('1905', '1904', '双塔区', '99');
INSERT INTO shop_areas VALUES ('1906', '1904', '龙城区', '99');
INSERT INTO shop_areas VALUES ('1907', '1904', '朝阳县', '99');
INSERT INTO shop_areas VALUES ('1908', '1904', '建平县', '99');
INSERT INTO shop_areas VALUES ('1909', '1904', '喀喇沁左翼蒙古族自治县', '99');
INSERT INTO shop_areas VALUES ('1910', '1904', '北票市', '99');
INSERT INTO shop_areas VALUES ('1911', '1904', '凌源市', '99');
INSERT INTO shop_areas VALUES ('1912', '1874', '大连市', '99');
INSERT INTO shop_areas VALUES ('1913', '1912', '中山区', '99');
INSERT INTO shop_areas VALUES ('1914', '1912', '西岗区', '99');
INSERT INTO shop_areas VALUES ('1915', '1912', '沙河口区', '99');
INSERT INTO shop_areas VALUES ('1916', '1912', '甘井子区', '99');
INSERT INTO shop_areas VALUES ('1917', '1912', '旅顺口区', '99');
INSERT INTO shop_areas VALUES ('1918', '1912', '金州区', '99');
INSERT INTO shop_areas VALUES ('1919', '1912', '长海县', '99');
INSERT INTO shop_areas VALUES ('1920', '1912', '瓦房店市', '99');
INSERT INTO shop_areas VALUES ('1921', '1912', '普兰店市', '99');
INSERT INTO shop_areas VALUES ('1922', '1912', '庄河市', '99');
INSERT INTO shop_areas VALUES ('1923', '1874', '丹东市', '99');
INSERT INTO shop_areas VALUES ('1924', '1923', '元宝区', '99');
INSERT INTO shop_areas VALUES ('1925', '1923', '振兴区', '99');
INSERT INTO shop_areas VALUES ('1926', '1923', '振安区', '99');
INSERT INTO shop_areas VALUES ('1927', '1923', '宽甸满族自治县', '99');
INSERT INTO shop_areas VALUES ('1928', '1923', '东港市', '99');
INSERT INTO shop_areas VALUES ('1929', '1923', '凤城市', '99');
INSERT INTO shop_areas VALUES ('1930', '1874', '抚顺市', '99');
INSERT INTO shop_areas VALUES ('1931', '1930', '新抚区', '99');
INSERT INTO shop_areas VALUES ('1932', '1930', '东洲区', '99');
INSERT INTO shop_areas VALUES ('1933', '1930', '望花区', '99');
INSERT INTO shop_areas VALUES ('1934', '1930', '顺城区', '99');
INSERT INTO shop_areas VALUES ('1935', '1930', '抚顺县', '99');
INSERT INTO shop_areas VALUES ('1936', '1930', '新宾满族自治县', '99');
INSERT INTO shop_areas VALUES ('1937', '1930', '清原满族自治县', '99');
INSERT INTO shop_areas VALUES ('1938', '1874', '阜新市', '99');
INSERT INTO shop_areas VALUES ('1939', '1938', '海州区', '99');
INSERT INTO shop_areas VALUES ('1940', '1938', '新邱区', '99');
INSERT INTO shop_areas VALUES ('1941', '1938', '太平区', '99');
INSERT INTO shop_areas VALUES ('1942', '1938', '清河门区', '99');
INSERT INTO shop_areas VALUES ('1943', '1938', '细河区', '99');
INSERT INTO shop_areas VALUES ('1944', '1938', '阜新蒙古族自治县', '99');
INSERT INTO shop_areas VALUES ('1945', '1938', '彰武县', '99');
INSERT INTO shop_areas VALUES ('1946', '1874', '葫芦岛市', '99');
INSERT INTO shop_areas VALUES ('1947', '1946', '连山区', '99');
INSERT INTO shop_areas VALUES ('1948', '1946', '龙港区', '99');
INSERT INTO shop_areas VALUES ('1949', '1946', '南票区', '99');
INSERT INTO shop_areas VALUES ('1950', '1946', '绥中县', '99');
INSERT INTO shop_areas VALUES ('1951', '1946', '建昌县', '99');
INSERT INTO shop_areas VALUES ('1952', '1946', '兴城市', '99');
INSERT INTO shop_areas VALUES ('1953', '1874', '锦州市', '99');
INSERT INTO shop_areas VALUES ('1954', '1953', '古塔区', '99');
INSERT INTO shop_areas VALUES ('1955', '1953', '凌河区', '99');
INSERT INTO shop_areas VALUES ('1956', '1953', '太和区', '99');
INSERT INTO shop_areas VALUES ('1957', '1953', '黑山县', '99');
INSERT INTO shop_areas VALUES ('1958', '1953', '义县', '99');
INSERT INTO shop_areas VALUES ('1959', '1953', '凌海市', '99');
INSERT INTO shop_areas VALUES ('1960', '1953', '北宁市', '99');
INSERT INTO shop_areas VALUES ('1961', '1874', '辽阳市', '99');
INSERT INTO shop_areas VALUES ('1962', '1961', '白塔区', '99');
INSERT INTO shop_areas VALUES ('1963', '1961', '文圣区', '99');
INSERT INTO shop_areas VALUES ('1964', '1961', '宏伟区', '99');
INSERT INTO shop_areas VALUES ('1965', '1961', '弓长岭区', '99');
INSERT INTO shop_areas VALUES ('1966', '1961', '太子河区', '99');
INSERT INTO shop_areas VALUES ('1967', '1961', '辽阳县', '99');
INSERT INTO shop_areas VALUES ('1968', '1961', '灯塔市', '99');
INSERT INTO shop_areas VALUES ('1969', '1874', '盘锦市', '99');
INSERT INTO shop_areas VALUES ('1970', '1969', '双台子区', '99');
INSERT INTO shop_areas VALUES ('1971', '1969', '兴隆台区', '99');
INSERT INTO shop_areas VALUES ('1972', '1969', '大洼县', '99');
INSERT INTO shop_areas VALUES ('1973', '1969', '盘山县', '99');
INSERT INTO shop_areas VALUES ('1974', '1874', '铁岭市', '99');
INSERT INTO shop_areas VALUES ('1975', '1974', '银州区', '99');
INSERT INTO shop_areas VALUES ('1976', '1974', '清河区', '99');
INSERT INTO shop_areas VALUES ('1977', '1974', '铁岭县', '99');
INSERT INTO shop_areas VALUES ('1978', '1974', '西丰县', '99');
INSERT INTO shop_areas VALUES ('1979', '1974', '昌图县', '99');
INSERT INTO shop_areas VALUES ('1980', '1974', '调兵山市', '99');
INSERT INTO shop_areas VALUES ('1981', '1974', '开原市', '99');
INSERT INTO shop_areas VALUES ('1982', '1874', '营口市', '99');
INSERT INTO shop_areas VALUES ('1983', '1982', '站前区', '99');
INSERT INTO shop_areas VALUES ('1984', '1982', '西市区', '99');
INSERT INTO shop_areas VALUES ('1985', '1982', '鲅鱼圈区', '99');
INSERT INTO shop_areas VALUES ('1986', '1982', '老边区', '99');
INSERT INTO shop_areas VALUES ('1987', '1982', '盖州市', '99');
INSERT INTO shop_areas VALUES ('1988', '1982', '大石桥市', '99');
INSERT INTO shop_areas VALUES ('1989', '0', '内蒙古', '99');
INSERT INTO shop_areas VALUES ('1990', '1989', '呼和浩特市', '99');
INSERT INTO shop_areas VALUES ('1991', '1990', '新城区', '99');
INSERT INTO shop_areas VALUES ('1992', '1990', '回民区', '99');
INSERT INTO shop_areas VALUES ('1993', '1990', '玉泉区', '99');
INSERT INTO shop_areas VALUES ('1994', '1990', '赛罕区', '99');
INSERT INTO shop_areas VALUES ('1995', '1990', '土默特左旗', '99');
INSERT INTO shop_areas VALUES ('1996', '1990', '托克托县', '99');
INSERT INTO shop_areas VALUES ('1997', '1990', '和林格尔县', '99');
INSERT INTO shop_areas VALUES ('1998', '1990', '清水河县', '99');
INSERT INTO shop_areas VALUES ('1999', '1990', '武川县', '99');
INSERT INTO shop_areas VALUES ('2000', '1989', '阿拉善盟', '99');
INSERT INTO shop_areas VALUES ('2001', '2000', '阿拉善左旗', '99');
INSERT INTO shop_areas VALUES ('2002', '2000', '阿拉善右旗', '99');
INSERT INTO shop_areas VALUES ('2003', '2000', '额济纳旗', '99');
INSERT INTO shop_areas VALUES ('2004', '1989', '巴彦淖尔市', '99');
INSERT INTO shop_areas VALUES ('2005', '2004', '临河区', '99');
INSERT INTO shop_areas VALUES ('2006', '2004', '五原县', '99');
INSERT INTO shop_areas VALUES ('2007', '2004', '磴口县', '99');
INSERT INTO shop_areas VALUES ('2008', '2004', '乌拉特前旗', '99');
INSERT INTO shop_areas VALUES ('2009', '2004', '乌拉特中旗', '99');
INSERT INTO shop_areas VALUES ('2010', '2004', '乌拉特后旗', '99');
INSERT INTO shop_areas VALUES ('2011', '2004', '杭锦后旗', '99');
INSERT INTO shop_areas VALUES ('2012', '1989', '包头市', '99');
INSERT INTO shop_areas VALUES ('2013', '2012', '东河区', '99');
INSERT INTO shop_areas VALUES ('2014', '2012', '昆都仑区', '99');
INSERT INTO shop_areas VALUES ('2015', '2012', '青山区', '99');
INSERT INTO shop_areas VALUES ('2016', '2012', '石拐区', '99');
INSERT INTO shop_areas VALUES ('2017', '2012', '白云矿区', '99');
INSERT INTO shop_areas VALUES ('2018', '2012', '九原区', '99');
INSERT INTO shop_areas VALUES ('2019', '2012', '土默特右旗', '99');
INSERT INTO shop_areas VALUES ('2020', '2012', '固阳县', '99');
INSERT INTO shop_areas VALUES ('2021', '2012', '达尔罕茂明安联合旗', '99');
INSERT INTO shop_areas VALUES ('2022', '1989', '赤峰市', '99');
INSERT INTO shop_areas VALUES ('2023', '2022', '红山区', '99');
INSERT INTO shop_areas VALUES ('2024', '2022', '元宝山区', '99');
INSERT INTO shop_areas VALUES ('2025', '2022', '松山区', '99');
INSERT INTO shop_areas VALUES ('2026', '2022', '阿鲁科尔沁旗', '99');
INSERT INTO shop_areas VALUES ('2027', '2022', '巴林左旗', '99');
INSERT INTO shop_areas VALUES ('2028', '2022', '巴林右旗', '99');
INSERT INTO shop_areas VALUES ('2029', '2022', '林西县', '99');
INSERT INTO shop_areas VALUES ('2030', '2022', '克什克腾旗', '99');
INSERT INTO shop_areas VALUES ('2031', '2022', '翁牛特旗', '99');
INSERT INTO shop_areas VALUES ('2032', '2022', '喀喇沁旗', '99');
INSERT INTO shop_areas VALUES ('2033', '2022', '宁城县', '99');
INSERT INTO shop_areas VALUES ('2034', '2022', '敖汉旗', '99');
INSERT INTO shop_areas VALUES ('2035', '1989', '鄂尔多斯市', '99');
INSERT INTO shop_areas VALUES ('2036', '2035', '东胜区', '99');
INSERT INTO shop_areas VALUES ('2037', '2035', '达拉特旗', '99');
INSERT INTO shop_areas VALUES ('2038', '2035', '准格尔旗', '99');
INSERT INTO shop_areas VALUES ('2039', '2035', '鄂托克前旗', '99');
INSERT INTO shop_areas VALUES ('2040', '2035', '鄂托克旗', '99');
INSERT INTO shop_areas VALUES ('2041', '2035', '杭锦旗', '99');
INSERT INTO shop_areas VALUES ('2042', '2035', '乌审旗', '99');
INSERT INTO shop_areas VALUES ('2043', '2035', '伊金霍洛旗', '99');
INSERT INTO shop_areas VALUES ('2044', '1989', '呼伦贝尔市', '99');
INSERT INTO shop_areas VALUES ('2045', '2044', '海拉尔区', '99');
INSERT INTO shop_areas VALUES ('2046', '2044', '阿荣旗', '99');
INSERT INTO shop_areas VALUES ('2047', '2044', '莫力达瓦达斡尔族自治旗', '99');
INSERT INTO shop_areas VALUES ('2048', '2044', '鄂伦春自治旗', '99');
INSERT INTO shop_areas VALUES ('2049', '2044', '鄂温克族自治旗', '99');
INSERT INTO shop_areas VALUES ('2050', '2044', '陈巴尔虎旗', '99');
INSERT INTO shop_areas VALUES ('2051', '2044', '新巴尔虎左旗', '99');
INSERT INTO shop_areas VALUES ('2052', '2044', '新巴尔虎右旗', '99');
INSERT INTO shop_areas VALUES ('2053', '2044', '满洲里市', '99');
INSERT INTO shop_areas VALUES ('2054', '2044', '牙克石市', '99');
INSERT INTO shop_areas VALUES ('2055', '2044', '扎兰屯市', '99');
INSERT INTO shop_areas VALUES ('2056', '2044', '额尔古纳市', '99');
INSERT INTO shop_areas VALUES ('2057', '2044', '根河市', '99');
INSERT INTO shop_areas VALUES ('2058', '1989', '通辽市', '99');
INSERT INTO shop_areas VALUES ('2059', '2058', '科尔沁区', '99');
INSERT INTO shop_areas VALUES ('2060', '2058', '科尔沁左翼中旗', '99');
INSERT INTO shop_areas VALUES ('2061', '2058', '科尔沁左翼后旗', '99');
INSERT INTO shop_areas VALUES ('2062', '2058', '开鲁县', '99');
INSERT INTO shop_areas VALUES ('2063', '2058', '库伦旗', '99');
INSERT INTO shop_areas VALUES ('2064', '2058', '奈曼旗', '99');
INSERT INTO shop_areas VALUES ('2065', '2058', '扎鲁特旗', '99');
INSERT INTO shop_areas VALUES ('2066', '2058', '霍林郭勒市', '99');
INSERT INTO shop_areas VALUES ('2067', '1989', '乌海市', '99');
INSERT INTO shop_areas VALUES ('2068', '2067', '海勃湾区', '99');
INSERT INTO shop_areas VALUES ('2069', '2067', '海南区', '99');
INSERT INTO shop_areas VALUES ('2070', '2067', '乌达区', '99');
INSERT INTO shop_areas VALUES ('2071', '1989', '乌兰察布市', '99');
INSERT INTO shop_areas VALUES ('2072', '2071', '集宁区', '99');
INSERT INTO shop_areas VALUES ('2073', '2071', '卓资县', '99');
INSERT INTO shop_areas VALUES ('2074', '2071', '化德县', '99');
INSERT INTO shop_areas VALUES ('2075', '2071', '商都县', '99');
INSERT INTO shop_areas VALUES ('2076', '2071', '兴和县', '99');
INSERT INTO shop_areas VALUES ('2077', '2071', '凉城县', '99');
INSERT INTO shop_areas VALUES ('2078', '2071', '察哈尔右翼前旗', '99');
INSERT INTO shop_areas VALUES ('2079', '2071', '察哈尔右翼中旗', '99');
INSERT INTO shop_areas VALUES ('2080', '2071', '察哈尔右翼后旗', '99');
INSERT INTO shop_areas VALUES ('2081', '2071', '四子王旗', '99');
INSERT INTO shop_areas VALUES ('2082', '2071', '丰镇市', '99');
INSERT INTO shop_areas VALUES ('2083', '1989', '锡林郭勒盟', '99');
INSERT INTO shop_areas VALUES ('2084', '2083', '二连浩特市', '99');
INSERT INTO shop_areas VALUES ('2085', '2083', '锡林浩特市', '99');
INSERT INTO shop_areas VALUES ('2086', '2083', '阿巴嘎旗', '99');
INSERT INTO shop_areas VALUES ('2087', '2083', '苏尼特左旗', '99');
INSERT INTO shop_areas VALUES ('2088', '2083', '苏尼特右旗', '99');
INSERT INTO shop_areas VALUES ('2089', '2083', '东乌珠穆沁旗', '99');
INSERT INTO shop_areas VALUES ('2090', '2083', '西乌珠穆沁旗', '99');
INSERT INTO shop_areas VALUES ('2091', '2083', '太仆寺旗', '99');
INSERT INTO shop_areas VALUES ('2092', '2083', '镶黄旗', '99');
INSERT INTO shop_areas VALUES ('2093', '2083', '正镶白旗', '99');
INSERT INTO shop_areas VALUES ('2094', '2083', '正蓝旗', '99');
INSERT INTO shop_areas VALUES ('2095', '2083', '多伦县', '99');
INSERT INTO shop_areas VALUES ('2096', '1989', '兴安盟', '99');
INSERT INTO shop_areas VALUES ('2097', '2096', '乌兰浩特市', '99');
INSERT INTO shop_areas VALUES ('2098', '2096', '阿尔山市', '99');
INSERT INTO shop_areas VALUES ('2099', '2096', '科尔沁右翼前旗', '99');
INSERT INTO shop_areas VALUES ('2100', '2096', '科尔沁右翼中旗', '99');
INSERT INTO shop_areas VALUES ('2101', '2096', '扎赉特旗', '99');
INSERT INTO shop_areas VALUES ('2102', '2096', '突泉县', '99');
INSERT INTO shop_areas VALUES ('2103', '0', '宁夏', '99');
INSERT INTO shop_areas VALUES ('2104', '2103', '银川市', '99');
INSERT INTO shop_areas VALUES ('2105', '2104', '兴庆区', '99');
INSERT INTO shop_areas VALUES ('2106', '2104', '西夏区', '99');
INSERT INTO shop_areas VALUES ('2107', '2104', '金凤区', '99');
INSERT INTO shop_areas VALUES ('2108', '2104', '永宁县', '99');
INSERT INTO shop_areas VALUES ('2109', '2104', '贺兰县', '99');
INSERT INTO shop_areas VALUES ('2110', '2104', '灵武市', '99');
INSERT INTO shop_areas VALUES ('2111', '2103', '固原市', '99');
INSERT INTO shop_areas VALUES ('2112', '2111', '原州区', '99');
INSERT INTO shop_areas VALUES ('2113', '2111', '西吉县', '99');
INSERT INTO shop_areas VALUES ('2114', '2111', '隆德县', '99');
INSERT INTO shop_areas VALUES ('2115', '2111', '泾源县', '99');
INSERT INTO shop_areas VALUES ('2116', '2111', '彭阳县', '99');
INSERT INTO shop_areas VALUES ('2117', '2103', '石嘴山市', '99');
INSERT INTO shop_areas VALUES ('2118', '2117', '大武口区', '99');
INSERT INTO shop_areas VALUES ('2119', '2117', '惠农区', '99');
INSERT INTO shop_areas VALUES ('2120', '2117', '平罗县', '99');
INSERT INTO shop_areas VALUES ('2121', '2103', '吴忠市', '99');
INSERT INTO shop_areas VALUES ('2122', '2121', '利通区', '99');
INSERT INTO shop_areas VALUES ('2123', '2121', '盐池县', '99');
INSERT INTO shop_areas VALUES ('2124', '2121', '同心县', '99');
INSERT INTO shop_areas VALUES ('2125', '2121', '青铜峡市', '99');
INSERT INTO shop_areas VALUES ('2126', '2103', '中卫市', '99');
INSERT INTO shop_areas VALUES ('2127', '2126', '沙坡头区', '99');
INSERT INTO shop_areas VALUES ('2128', '2126', '中宁县', '99');
INSERT INTO shop_areas VALUES ('2129', '2126', '海原县', '99');
INSERT INTO shop_areas VALUES ('2130', '0', '青海', '99');
INSERT INTO shop_areas VALUES ('2131', '2130', '西宁市', '99');
INSERT INTO shop_areas VALUES ('2132', '2131', '城东区', '99');
INSERT INTO shop_areas VALUES ('2133', '2131', '城中区', '99');
INSERT INTO shop_areas VALUES ('2134', '2131', '城西区', '99');
INSERT INTO shop_areas VALUES ('2135', '2131', '城北区', '99');
INSERT INTO shop_areas VALUES ('2136', '2131', '大通回族土族自治县', '99');
INSERT INTO shop_areas VALUES ('2137', '2131', '湟中县', '99');
INSERT INTO shop_areas VALUES ('2138', '2131', '湟源县', '99');
INSERT INTO shop_areas VALUES ('2139', '2130', '果洛藏族自治州', '99');
INSERT INTO shop_areas VALUES ('2140', '2139', '玛沁县', '99');
INSERT INTO shop_areas VALUES ('2141', '2139', '班玛县', '99');
INSERT INTO shop_areas VALUES ('2142', '2139', '甘德县', '99');
INSERT INTO shop_areas VALUES ('2143', '2139', '达日县', '99');
INSERT INTO shop_areas VALUES ('2144', '2139', '久治县', '99');
INSERT INTO shop_areas VALUES ('2145', '2139', '玛多县', '99');
INSERT INTO shop_areas VALUES ('2146', '2130', '海北藏族自治州', '99');
INSERT INTO shop_areas VALUES ('2147', '2146', '门源回族自治县', '99');
INSERT INTO shop_areas VALUES ('2148', '2146', '祁连县', '99');
INSERT INTO shop_areas VALUES ('2149', '2146', '海晏县', '99');
INSERT INTO shop_areas VALUES ('2150', '2146', '刚察县', '99');
INSERT INTO shop_areas VALUES ('2151', '2130', '海东地区', '99');
INSERT INTO shop_areas VALUES ('2152', '2151', '平安县', '99');
INSERT INTO shop_areas VALUES ('2153', '2151', '民和回族土族自治县', '99');
INSERT INTO shop_areas VALUES ('2154', '2151', '乐都县', '99');
INSERT INTO shop_areas VALUES ('2155', '2151', '互助土族自治县', '99');
INSERT INTO shop_areas VALUES ('2156', '2151', '化隆回族自治县', '99');
INSERT INTO shop_areas VALUES ('2157', '2151', '循化撒拉族自治县', '99');
INSERT INTO shop_areas VALUES ('2158', '2130', '海南藏族自治州', '99');
INSERT INTO shop_areas VALUES ('2159', '2158', '共和县', '99');
INSERT INTO shop_areas VALUES ('2160', '2158', '同德县', '99');
INSERT INTO shop_areas VALUES ('2161', '2158', '贵德县', '99');
INSERT INTO shop_areas VALUES ('2162', '2158', '兴海县', '99');
INSERT INTO shop_areas VALUES ('2163', '2158', '贵南县', '99');
INSERT INTO shop_areas VALUES ('2164', '2130', '海西蒙古族藏族自治州', '99');
INSERT INTO shop_areas VALUES ('2165', '2164', '格尔木市', '99');
INSERT INTO shop_areas VALUES ('2166', '2164', '德令哈市', '99');
INSERT INTO shop_areas VALUES ('2167', '2164', '乌兰县', '99');
INSERT INTO shop_areas VALUES ('2168', '2164', '都兰县', '99');
INSERT INTO shop_areas VALUES ('2169', '2164', '天峻县', '99');
INSERT INTO shop_areas VALUES ('2170', '2130', '黄南藏族自治州', '99');
INSERT INTO shop_areas VALUES ('2171', '2170', '同仁县', '99');
INSERT INTO shop_areas VALUES ('2172', '2170', '尖扎县', '99');
INSERT INTO shop_areas VALUES ('2173', '2170', '泽库县', '99');
INSERT INTO shop_areas VALUES ('2174', '2170', '河南蒙古族自治县', '99');
INSERT INTO shop_areas VALUES ('2175', '2130', '玉树藏族自治州', '99');
INSERT INTO shop_areas VALUES ('2176', '2175', '玉树县', '99');
INSERT INTO shop_areas VALUES ('2177', '2175', '杂多县', '99');
INSERT INTO shop_areas VALUES ('2178', '2175', '称多县', '99');
INSERT INTO shop_areas VALUES ('2179', '2175', '治多县', '99');
INSERT INTO shop_areas VALUES ('2180', '2175', '囊谦县', '99');
INSERT INTO shop_areas VALUES ('2181', '2175', '曲麻莱县', '99');
INSERT INTO shop_areas VALUES ('2182', '0', '山东', '99');
INSERT INTO shop_areas VALUES ('2183', '2182', '济南市', '99');
INSERT INTO shop_areas VALUES ('2184', '2183', '历下区', '99');
INSERT INTO shop_areas VALUES ('2185', '2183', '市中区', '99');
INSERT INTO shop_areas VALUES ('2186', '2183', '槐荫区', '99');
INSERT INTO shop_areas VALUES ('2187', '2183', '天桥区', '99');
INSERT INTO shop_areas VALUES ('2188', '2183', '历城区', '99');
INSERT INTO shop_areas VALUES ('2189', '2183', '长清区', '99');
INSERT INTO shop_areas VALUES ('2190', '2183', '平阴县', '99');
INSERT INTO shop_areas VALUES ('2191', '2183', '济阳县', '99');
INSERT INTO shop_areas VALUES ('2192', '2183', '商河县', '99');
INSERT INTO shop_areas VALUES ('2193', '2183', '章丘市', '99');
INSERT INTO shop_areas VALUES ('2194', '2182', '滨州市', '99');
INSERT INTO shop_areas VALUES ('2195', '2194', '滨城区', '99');
INSERT INTO shop_areas VALUES ('2196', '2194', '惠民县', '99');
INSERT INTO shop_areas VALUES ('2197', '2194', '阳信县', '99');
INSERT INTO shop_areas VALUES ('2198', '2194', '无棣县', '99');
INSERT INTO shop_areas VALUES ('2199', '2194', '沾化县', '99');
INSERT INTO shop_areas VALUES ('2200', '2194', '博兴县', '99');
INSERT INTO shop_areas VALUES ('2201', '2194', '邹平县', '99');
INSERT INTO shop_areas VALUES ('2202', '2182', '德州市', '99');
INSERT INTO shop_areas VALUES ('2203', '2202', '德城区', '99');
INSERT INTO shop_areas VALUES ('2204', '2202', '陵县', '99');
INSERT INTO shop_areas VALUES ('2205', '2202', '宁津县', '99');
INSERT INTO shop_areas VALUES ('2206', '2202', '庆云县', '99');
INSERT INTO shop_areas VALUES ('2207', '2202', '临邑县', '99');
INSERT INTO shop_areas VALUES ('2208', '2202', '齐河县', '99');
INSERT INTO shop_areas VALUES ('2209', '2202', '平原县', '99');
INSERT INTO shop_areas VALUES ('2210', '2202', '夏津县', '99');
INSERT INTO shop_areas VALUES ('2211', '2202', '武城县', '99');
INSERT INTO shop_areas VALUES ('2212', '2202', '乐陵市', '99');
INSERT INTO shop_areas VALUES ('2213', '2202', '禹城市', '99');
INSERT INTO shop_areas VALUES ('2214', '2182', '东营市', '99');
INSERT INTO shop_areas VALUES ('2215', '2214', '东营区', '99');
INSERT INTO shop_areas VALUES ('2216', '2214', '河口区', '99');
INSERT INTO shop_areas VALUES ('2217', '2214', '垦利县', '99');
INSERT INTO shop_areas VALUES ('2218', '2214', '利津县', '99');
INSERT INTO shop_areas VALUES ('2219', '2214', '广饶县', '99');
INSERT INTO shop_areas VALUES ('2220', '2182', '菏泽市', '99');
INSERT INTO shop_areas VALUES ('2221', '2220', '牡丹区', '99');
INSERT INTO shop_areas VALUES ('2222', '2220', '曹县', '99');
INSERT INTO shop_areas VALUES ('2223', '2220', '单县', '99');
INSERT INTO shop_areas VALUES ('2224', '2220', '成武县', '99');
INSERT INTO shop_areas VALUES ('2225', '2220', '巨野县', '99');
INSERT INTO shop_areas VALUES ('2226', '2220', '郓城县', '99');
INSERT INTO shop_areas VALUES ('2227', '2220', '鄄城县', '99');
INSERT INTO shop_areas VALUES ('2228', '2220', '定陶县', '99');
INSERT INTO shop_areas VALUES ('2229', '2220', '东明县', '99');
INSERT INTO shop_areas VALUES ('2230', '2182', '济宁市', '99');
INSERT INTO shop_areas VALUES ('2231', '2230', '市中区', '99');
INSERT INTO shop_areas VALUES ('2232', '2230', '任城区', '99');
INSERT INTO shop_areas VALUES ('2233', '2230', '微山县', '99');
INSERT INTO shop_areas VALUES ('2234', '2230', '鱼台县', '99');
INSERT INTO shop_areas VALUES ('2235', '2230', '金乡县', '99');
INSERT INTO shop_areas VALUES ('2236', '2230', '嘉祥县', '99');
INSERT INTO shop_areas VALUES ('2237', '2230', '汶上县', '99');
INSERT INTO shop_areas VALUES ('2238', '2230', '泗水县', '99');
INSERT INTO shop_areas VALUES ('2239', '2230', '梁山县', '99');
INSERT INTO shop_areas VALUES ('2240', '2230', '曲阜市', '99');
INSERT INTO shop_areas VALUES ('2241', '2230', '兖州市', '99');
INSERT INTO shop_areas VALUES ('2242', '2230', '邹城市', '99');
INSERT INTO shop_areas VALUES ('2243', '2182', '莱芜市', '99');
INSERT INTO shop_areas VALUES ('2244', '2243', '莱城区', '99');
INSERT INTO shop_areas VALUES ('2245', '2243', '钢城区', '99');
INSERT INTO shop_areas VALUES ('2246', '2182', '聊城市', '99');
INSERT INTO shop_areas VALUES ('2247', '2246', '东昌府区', '99');
INSERT INTO shop_areas VALUES ('2248', '2246', '阳谷县', '99');
INSERT INTO shop_areas VALUES ('2249', '2246', '莘县', '99');
INSERT INTO shop_areas VALUES ('2250', '2246', '茌平县', '99');
INSERT INTO shop_areas VALUES ('2251', '2246', '东阿县', '99');
INSERT INTO shop_areas VALUES ('2252', '2246', '冠县', '99');
INSERT INTO shop_areas VALUES ('2253', '2246', '高唐县', '99');
INSERT INTO shop_areas VALUES ('2254', '2246', '临清市', '99');
INSERT INTO shop_areas VALUES ('2255', '2182', '临沂市', '99');
INSERT INTO shop_areas VALUES ('2256', '2255', '兰山区', '99');
INSERT INTO shop_areas VALUES ('2257', '2255', '罗庄区', '99');
INSERT INTO shop_areas VALUES ('2258', '2255', '河东区', '99');
INSERT INTO shop_areas VALUES ('2259', '2255', '沂南县', '99');
INSERT INTO shop_areas VALUES ('2260', '2255', '郯城县', '99');
INSERT INTO shop_areas VALUES ('2261', '2255', '沂水县', '99');
INSERT INTO shop_areas VALUES ('2262', '2255', '苍山县', '99');
INSERT INTO shop_areas VALUES ('2263', '2255', '费县', '99');
INSERT INTO shop_areas VALUES ('2264', '2255', '平邑县', '99');
INSERT INTO shop_areas VALUES ('2265', '2255', '莒南县', '99');
INSERT INTO shop_areas VALUES ('2266', '2255', '蒙阴县', '99');
INSERT INTO shop_areas VALUES ('2267', '2255', '临沭县', '99');
INSERT INTO shop_areas VALUES ('2268', '2182', '青岛市', '99');
INSERT INTO shop_areas VALUES ('2269', '2268', '市南区', '99');
INSERT INTO shop_areas VALUES ('2270', '2268', '市北区', '99');
INSERT INTO shop_areas VALUES ('2271', '2268', '四方区', '99');
INSERT INTO shop_areas VALUES ('2272', '2268', '黄岛区', '99');
INSERT INTO shop_areas VALUES ('2273', '2268', '崂山区', '99');
INSERT INTO shop_areas VALUES ('2274', '2268', '李沧区', '99');
INSERT INTO shop_areas VALUES ('2275', '2268', '城阳区', '99');
INSERT INTO shop_areas VALUES ('2276', '2268', '胶州市', '99');
INSERT INTO shop_areas VALUES ('2277', '2268', '即墨市', '99');
INSERT INTO shop_areas VALUES ('2278', '2268', '平度市', '99');
INSERT INTO shop_areas VALUES ('2279', '2268', '胶南市', '99');
INSERT INTO shop_areas VALUES ('2280', '2268', '莱西市', '99');
INSERT INTO shop_areas VALUES ('2281', '2182', '日照市', '99');
INSERT INTO shop_areas VALUES ('2282', '2281', '东港区', '99');
INSERT INTO shop_areas VALUES ('2283', '2281', '岚山区', '99');
INSERT INTO shop_areas VALUES ('2284', '2281', '五莲县', '99');
INSERT INTO shop_areas VALUES ('2285', '2281', '莒县', '99');
INSERT INTO shop_areas VALUES ('2286', '2182', '泰安市', '99');
INSERT INTO shop_areas VALUES ('2287', '2286', '泰山区', '99');
INSERT INTO shop_areas VALUES ('2288', '2286', '岱岳区', '99');
INSERT INTO shop_areas VALUES ('2289', '2286', '宁阳县', '99');
INSERT INTO shop_areas VALUES ('2290', '2286', '东平县', '99');
INSERT INTO shop_areas VALUES ('2291', '2286', '新泰市', '99');
INSERT INTO shop_areas VALUES ('2292', '2286', '肥城市', '99');
INSERT INTO shop_areas VALUES ('2293', '2182', '威海市', '99');
INSERT INTO shop_areas VALUES ('2294', '2293', '环翠区', '99');
INSERT INTO shop_areas VALUES ('2295', '2293', '文登市', '99');
INSERT INTO shop_areas VALUES ('2296', '2293', '荣成市', '99');
INSERT INTO shop_areas VALUES ('2297', '2293', '乳山市', '99');
INSERT INTO shop_areas VALUES ('2298', '2182', '潍坊市', '99');
INSERT INTO shop_areas VALUES ('2299', '2298', '潍城区', '99');
INSERT INTO shop_areas VALUES ('2300', '2298', '寒亭区', '99');
INSERT INTO shop_areas VALUES ('2301', '2298', '坊子区', '99');
INSERT INTO shop_areas VALUES ('2302', '2298', '奎文区', '99');
INSERT INTO shop_areas VALUES ('2303', '2298', '临朐县', '99');
INSERT INTO shop_areas VALUES ('2304', '2298', '昌乐县', '99');
INSERT INTO shop_areas VALUES ('2305', '2298', '青州市', '99');
INSERT INTO shop_areas VALUES ('2306', '2298', '诸城市', '99');
INSERT INTO shop_areas VALUES ('2307', '2298', '寿光市', '99');
INSERT INTO shop_areas VALUES ('2308', '2298', '安丘市', '99');
INSERT INTO shop_areas VALUES ('2309', '2298', '高密市', '99');
INSERT INTO shop_areas VALUES ('2310', '2298', '昌邑市', '99');
INSERT INTO shop_areas VALUES ('2311', '2182', '烟台市', '99');
INSERT INTO shop_areas VALUES ('2312', '2311', '芝罘区', '99');
INSERT INTO shop_areas VALUES ('2313', '2311', '福山区', '99');
INSERT INTO shop_areas VALUES ('2314', '2311', '牟平区', '99');
INSERT INTO shop_areas VALUES ('2315', '2311', '莱山区', '99');
INSERT INTO shop_areas VALUES ('2316', '2311', '长岛县', '99');
INSERT INTO shop_areas VALUES ('2317', '2311', '龙口市', '99');
INSERT INTO shop_areas VALUES ('2318', '2311', '莱阳市', '99');
INSERT INTO shop_areas VALUES ('2319', '2311', '莱州市', '99');
INSERT INTO shop_areas VALUES ('2320', '2311', '蓬莱市', '99');
INSERT INTO shop_areas VALUES ('2321', '2311', '招远市', '99');
INSERT INTO shop_areas VALUES ('2322', '2311', '栖霞市', '99');
INSERT INTO shop_areas VALUES ('2323', '2311', '海阳市', '99');
INSERT INTO shop_areas VALUES ('2324', '2182', '枣庄市', '99');
INSERT INTO shop_areas VALUES ('2325', '2324', '市中区', '99');
INSERT INTO shop_areas VALUES ('2326', '2324', '薛城区', '99');
INSERT INTO shop_areas VALUES ('2327', '2324', '峄城区', '99');
INSERT INTO shop_areas VALUES ('2328', '2324', '台儿庄区', '99');
INSERT INTO shop_areas VALUES ('2329', '2324', '山亭区', '99');
INSERT INTO shop_areas VALUES ('2330', '2324', '滕州市', '99');
INSERT INTO shop_areas VALUES ('2331', '2182', '淄博市', '99');
INSERT INTO shop_areas VALUES ('2332', '2331', '淄川区', '99');
INSERT INTO shop_areas VALUES ('2333', '2331', '张店区', '99');
INSERT INTO shop_areas VALUES ('2334', '2331', '博山区', '99');
INSERT INTO shop_areas VALUES ('2335', '2331', '临淄区', '99');
INSERT INTO shop_areas VALUES ('2336', '2331', '周村区', '99');
INSERT INTO shop_areas VALUES ('2337', '2331', '桓台县', '99');
INSERT INTO shop_areas VALUES ('2338', '2331', '高青县', '99');
INSERT INTO shop_areas VALUES ('2339', '2331', '沂源县', '99');
INSERT INTO shop_areas VALUES ('2340', '0', '山西', '99');
INSERT INTO shop_areas VALUES ('2341', '2340', '太原市', '99');
INSERT INTO shop_areas VALUES ('2342', '2341', '小店区', '99');
INSERT INTO shop_areas VALUES ('2343', '2341', '迎泽区', '99');
INSERT INTO shop_areas VALUES ('2344', '2341', '杏花岭区', '99');
INSERT INTO shop_areas VALUES ('2345', '2341', '尖草坪区', '99');
INSERT INTO shop_areas VALUES ('2346', '2341', '万柏林区', '99');
INSERT INTO shop_areas VALUES ('2347', '2341', '晋源区', '99');
INSERT INTO shop_areas VALUES ('2348', '2341', '清徐县', '99');
INSERT INTO shop_areas VALUES ('2349', '2341', '阳曲县', '99');
INSERT INTO shop_areas VALUES ('2350', '2341', '娄烦县', '99');
INSERT INTO shop_areas VALUES ('2351', '2341', '古交市', '99');
INSERT INTO shop_areas VALUES ('2352', '2340', '长治市', '99');
INSERT INTO shop_areas VALUES ('2353', '2352', '城区', '99');
INSERT INTO shop_areas VALUES ('2354', '2352', '郊区', '99');
INSERT INTO shop_areas VALUES ('2355', '2352', '长治县', '99');
INSERT INTO shop_areas VALUES ('2356', '2352', '襄垣县', '99');
INSERT INTO shop_areas VALUES ('2357', '2352', '屯留县', '99');
INSERT INTO shop_areas VALUES ('2358', '2352', '平顺县', '99');
INSERT INTO shop_areas VALUES ('2359', '2352', '黎城县', '99');
INSERT INTO shop_areas VALUES ('2360', '2352', '壶关县', '99');
INSERT INTO shop_areas VALUES ('2361', '2352', '长子县', '99');
INSERT INTO shop_areas VALUES ('2362', '2352', '武乡县', '99');
INSERT INTO shop_areas VALUES ('2363', '2352', '沁县', '99');
INSERT INTO shop_areas VALUES ('2364', '2352', '沁源县', '99');
INSERT INTO shop_areas VALUES ('2365', '2352', '潞城市', '99');
INSERT INTO shop_areas VALUES ('2366', '2340', '大同市', '99');
INSERT INTO shop_areas VALUES ('2367', '2366', '城区', '99');
INSERT INTO shop_areas VALUES ('2368', '2366', '矿区', '99');
INSERT INTO shop_areas VALUES ('2369', '2366', '南郊区', '99');
INSERT INTO shop_areas VALUES ('2370', '2366', '新荣区', '99');
INSERT INTO shop_areas VALUES ('2371', '2366', '阳高县', '99');
INSERT INTO shop_areas VALUES ('2372', '2366', '天镇县', '99');
INSERT INTO shop_areas VALUES ('2373', '2366', '广灵县', '99');
INSERT INTO shop_areas VALUES ('2374', '2366', '灵丘县', '99');
INSERT INTO shop_areas VALUES ('2375', '2366', '浑源县', '99');
INSERT INTO shop_areas VALUES ('2376', '2366', '左云县', '99');
INSERT INTO shop_areas VALUES ('2377', '2366', '大同县', '99');
INSERT INTO shop_areas VALUES ('2378', '2340', '晋城市', '99');
INSERT INTO shop_areas VALUES ('2379', '2378', '城区', '99');
INSERT INTO shop_areas VALUES ('2380', '2378', '沁水县', '99');
INSERT INTO shop_areas VALUES ('2381', '2378', '阳城县', '99');
INSERT INTO shop_areas VALUES ('2382', '2378', '陵川县', '99');
INSERT INTO shop_areas VALUES ('2383', '2378', '泽州县', '99');
INSERT INTO shop_areas VALUES ('2384', '2378', '高平市', '99');
INSERT INTO shop_areas VALUES ('2385', '2340', '晋中市', '99');
INSERT INTO shop_areas VALUES ('2386', '2385', '榆次区', '99');
INSERT INTO shop_areas VALUES ('2387', '2385', '榆社县', '99');
INSERT INTO shop_areas VALUES ('2388', '2385', '左权县', '99');
INSERT INTO shop_areas VALUES ('2389', '2385', '和顺县', '99');
INSERT INTO shop_areas VALUES ('2390', '2385', '昔阳县', '99');
INSERT INTO shop_areas VALUES ('2391', '2385', '寿阳县', '99');
INSERT INTO shop_areas VALUES ('2392', '2385', '太谷县', '99');
INSERT INTO shop_areas VALUES ('2393', '2385', '祁县', '99');
INSERT INTO shop_areas VALUES ('2394', '2385', '平遥县', '99');
INSERT INTO shop_areas VALUES ('2395', '2385', '灵石县', '99');
INSERT INTO shop_areas VALUES ('2396', '2385', '介休市', '99');
INSERT INTO shop_areas VALUES ('2397', '2340', '临汾市', '99');
INSERT INTO shop_areas VALUES ('2398', '2397', '尧都区', '99');
INSERT INTO shop_areas VALUES ('2399', '2397', '曲沃县', '99');
INSERT INTO shop_areas VALUES ('2400', '2397', '翼城县', '99');
INSERT INTO shop_areas VALUES ('2401', '2397', '襄汾县', '99');
INSERT INTO shop_areas VALUES ('2402', '2397', '洪洞县', '99');
INSERT INTO shop_areas VALUES ('2403', '2397', '古县', '99');
INSERT INTO shop_areas VALUES ('2404', '2397', '安泽县', '99');
INSERT INTO shop_areas VALUES ('2405', '2397', '浮山县', '99');
INSERT INTO shop_areas VALUES ('2406', '2397', '吉县', '99');
INSERT INTO shop_areas VALUES ('2407', '2397', '乡宁县', '99');
INSERT INTO shop_areas VALUES ('2408', '2397', '大宁县', '99');
INSERT INTO shop_areas VALUES ('2409', '2397', '隰县', '99');
INSERT INTO shop_areas VALUES ('2410', '2397', '永和县', '99');
INSERT INTO shop_areas VALUES ('2411', '2397', '蒲县', '99');
INSERT INTO shop_areas VALUES ('2412', '2397', '汾西县', '99');
INSERT INTO shop_areas VALUES ('2413', '2397', '侯马市', '99');
INSERT INTO shop_areas VALUES ('2414', '2397', '霍州市', '99');
INSERT INTO shop_areas VALUES ('2415', '2340', '吕梁市', '99');
INSERT INTO shop_areas VALUES ('2416', '2415', '离石区', '99');
INSERT INTO shop_areas VALUES ('2417', '2415', '文水县', '99');
INSERT INTO shop_areas VALUES ('2418', '2415', '交城县', '99');
INSERT INTO shop_areas VALUES ('2419', '2415', '兴县', '99');
INSERT INTO shop_areas VALUES ('2420', '2415', '临县', '99');
INSERT INTO shop_areas VALUES ('2421', '2415', '柳林县', '99');
INSERT INTO shop_areas VALUES ('2422', '2415', '石楼县', '99');
INSERT INTO shop_areas VALUES ('2423', '2415', '岚县', '99');
INSERT INTO shop_areas VALUES ('2424', '2415', '方山县', '99');
INSERT INTO shop_areas VALUES ('2425', '2415', '中阳县', '99');
INSERT INTO shop_areas VALUES ('2426', '2415', '交口县', '99');
INSERT INTO shop_areas VALUES ('2427', '2415', '孝义市', '99');
INSERT INTO shop_areas VALUES ('2428', '2415', '汾阳市', '99');
INSERT INTO shop_areas VALUES ('2429', '2340', '朔州市', '99');
INSERT INTO shop_areas VALUES ('2430', '2429', '朔城区', '99');
INSERT INTO shop_areas VALUES ('2431', '2429', '平鲁区', '99');
INSERT INTO shop_areas VALUES ('2432', '2429', '山阴县', '99');
INSERT INTO shop_areas VALUES ('2433', '2429', '应县', '99');
INSERT INTO shop_areas VALUES ('2434', '2429', '右玉县', '99');
INSERT INTO shop_areas VALUES ('2435', '2429', '怀仁县', '99');
INSERT INTO shop_areas VALUES ('2436', '2340', '忻州市', '99');
INSERT INTO shop_areas VALUES ('2437', '2436', '忻府区', '99');
INSERT INTO shop_areas VALUES ('2438', '2436', '定襄县', '99');
INSERT INTO shop_areas VALUES ('2439', '2436', '五台县', '99');
INSERT INTO shop_areas VALUES ('2440', '2436', '代县', '99');
INSERT INTO shop_areas VALUES ('2441', '2436', '繁峙县', '99');
INSERT INTO shop_areas VALUES ('2442', '2436', '宁武县', '99');
INSERT INTO shop_areas VALUES ('2443', '2436', '静乐县', '99');
INSERT INTO shop_areas VALUES ('2444', '2436', '神池县', '99');
INSERT INTO shop_areas VALUES ('2445', '2436', '五寨县', '99');
INSERT INTO shop_areas VALUES ('2446', '2436', '岢岚县', '99');
INSERT INTO shop_areas VALUES ('2447', '2436', '河曲县', '99');
INSERT INTO shop_areas VALUES ('2448', '2436', '保德县', '99');
INSERT INTO shop_areas VALUES ('2449', '2436', '偏关县', '99');
INSERT INTO shop_areas VALUES ('2450', '2436', '原平市', '99');
INSERT INTO shop_areas VALUES ('2451', '2340', '阳泉市', '99');
INSERT INTO shop_areas VALUES ('2452', '2451', '城区', '99');
INSERT INTO shop_areas VALUES ('2453', '2451', '矿区', '99');
INSERT INTO shop_areas VALUES ('2454', '2451', '郊区', '99');
INSERT INTO shop_areas VALUES ('2455', '2451', '平定县', '99');
INSERT INTO shop_areas VALUES ('2456', '2451', '盂县', '99');
INSERT INTO shop_areas VALUES ('2457', '2340', '运城市', '99');
INSERT INTO shop_areas VALUES ('2458', '2457', '盐湖区', '99');
INSERT INTO shop_areas VALUES ('2459', '2457', '临猗县', '99');
INSERT INTO shop_areas VALUES ('2460', '2457', '万荣县', '99');
INSERT INTO shop_areas VALUES ('2461', '2457', '闻喜县', '99');
INSERT INTO shop_areas VALUES ('2462', '2457', '稷山县', '99');
INSERT INTO shop_areas VALUES ('2463', '2457', '新绛县', '99');
INSERT INTO shop_areas VALUES ('2464', '2457', '绛县', '99');
INSERT INTO shop_areas VALUES ('2465', '2457', '垣曲县', '99');
INSERT INTO shop_areas VALUES ('2466', '2457', '夏县', '99');
INSERT INTO shop_areas VALUES ('2467', '2457', '平陆县', '99');
INSERT INTO shop_areas VALUES ('2468', '2457', '芮城县', '99');
INSERT INTO shop_areas VALUES ('2469', '2457', '永济市', '99');
INSERT INTO shop_areas VALUES ('2470', '2457', '河津市', '99');
INSERT INTO shop_areas VALUES ('2471', '0', '陕西', '99');
INSERT INTO shop_areas VALUES ('2472', '2471', '西安市', '99');
INSERT INTO shop_areas VALUES ('2473', '2472', '新城区', '99');
INSERT INTO shop_areas VALUES ('2474', '2472', '碑林区', '99');
INSERT INTO shop_areas VALUES ('2475', '2472', '莲湖区', '99');
INSERT INTO shop_areas VALUES ('2476', '2472', '灞桥区', '99');
INSERT INTO shop_areas VALUES ('2477', '2472', '未央区', '99');
INSERT INTO shop_areas VALUES ('2478', '2472', '雁塔区', '99');
INSERT INTO shop_areas VALUES ('2479', '2472', '阎良区', '99');
INSERT INTO shop_areas VALUES ('2480', '2472', '临潼区', '99');
INSERT INTO shop_areas VALUES ('2481', '2472', '长安区', '99');
INSERT INTO shop_areas VALUES ('2482', '2472', '蓝田县', '99');
INSERT INTO shop_areas VALUES ('2483', '2472', '周至县', '99');
INSERT INTO shop_areas VALUES ('2484', '2472', '户县', '99');
INSERT INTO shop_areas VALUES ('2485', '2472', '高陵县', '99');
INSERT INTO shop_areas VALUES ('2486', '2471', '安康市', '99');
INSERT INTO shop_areas VALUES ('2487', '2486', '汉滨区', '99');
INSERT INTO shop_areas VALUES ('2488', '2486', '汉阴县', '99');
INSERT INTO shop_areas VALUES ('2489', '2486', '石泉县', '99');
INSERT INTO shop_areas VALUES ('2490', '2486', '宁陕县', '99');
INSERT INTO shop_areas VALUES ('2491', '2486', '紫阳县', '99');
INSERT INTO shop_areas VALUES ('2492', '2486', '岚皋县', '99');
INSERT INTO shop_areas VALUES ('2493', '2486', '平利县', '99');
INSERT INTO shop_areas VALUES ('2494', '2486', '镇坪县', '99');
INSERT INTO shop_areas VALUES ('2495', '2486', '旬阳县', '99');
INSERT INTO shop_areas VALUES ('2496', '2486', '白河县', '99');
INSERT INTO shop_areas VALUES ('2497', '2471', '宝鸡市', '99');
INSERT INTO shop_areas VALUES ('2498', '2497', '渭滨区', '99');
INSERT INTO shop_areas VALUES ('2499', '2497', '金台区', '99');
INSERT INTO shop_areas VALUES ('2500', '2497', '陈仓区', '99');
INSERT INTO shop_areas VALUES ('2501', '2497', '凤翔县', '99');
INSERT INTO shop_areas VALUES ('2502', '2497', '岐山县', '99');
INSERT INTO shop_areas VALUES ('2503', '2497', '扶风县', '99');
INSERT INTO shop_areas VALUES ('2504', '2497', '眉县', '99');
INSERT INTO shop_areas VALUES ('2505', '2497', '陇县', '99');
INSERT INTO shop_areas VALUES ('2506', '2497', '千阳县', '99');
INSERT INTO shop_areas VALUES ('2507', '2497', '麟游县', '99');
INSERT INTO shop_areas VALUES ('2508', '2497', '凤县', '99');
INSERT INTO shop_areas VALUES ('2509', '2497', '太白县', '99');
INSERT INTO shop_areas VALUES ('2510', '2471', '汉中市', '99');
INSERT INTO shop_areas VALUES ('2511', '2510', '汉台区', '99');
INSERT INTO shop_areas VALUES ('2512', '2510', '南郑县', '99');
INSERT INTO shop_areas VALUES ('2513', '2510', '城固县', '99');
INSERT INTO shop_areas VALUES ('2514', '2510', '洋县', '99');
INSERT INTO shop_areas VALUES ('2515', '2510', '西乡县', '99');
INSERT INTO shop_areas VALUES ('2516', '2510', '勉县', '99');
INSERT INTO shop_areas VALUES ('2517', '2510', '宁强县', '99');
INSERT INTO shop_areas VALUES ('2518', '2510', '略阳县', '99');
INSERT INTO shop_areas VALUES ('2519', '2510', '镇巴县', '99');
INSERT INTO shop_areas VALUES ('2520', '2510', '留坝县', '99');
INSERT INTO shop_areas VALUES ('2521', '2510', '佛坪县', '99');
INSERT INTO shop_areas VALUES ('2522', '2471', '商洛市', '99');
INSERT INTO shop_areas VALUES ('2523', '2522', '商州区', '99');
INSERT INTO shop_areas VALUES ('2524', '2522', '洛南县', '99');
INSERT INTO shop_areas VALUES ('2525', '2522', '丹凤县', '99');
INSERT INTO shop_areas VALUES ('2526', '2522', '商南县', '99');
INSERT INTO shop_areas VALUES ('2527', '2522', '山阳县', '99');
INSERT INTO shop_areas VALUES ('2528', '2522', '镇安县', '99');
INSERT INTO shop_areas VALUES ('2529', '2522', '柞水县', '99');
INSERT INTO shop_areas VALUES ('2530', '2471', '铜川市', '99');
INSERT INTO shop_areas VALUES ('2531', '2530', '王益区', '99');
INSERT INTO shop_areas VALUES ('2532', '2530', '印台区', '99');
INSERT INTO shop_areas VALUES ('2533', '2530', '耀州区', '99');
INSERT INTO shop_areas VALUES ('2534', '2530', '宜君县', '99');
INSERT INTO shop_areas VALUES ('2535', '2471', '渭南市', '99');
INSERT INTO shop_areas VALUES ('2536', '2535', '临渭区', '99');
INSERT INTO shop_areas VALUES ('2537', '2535', '华县', '99');
INSERT INTO shop_areas VALUES ('2538', '2535', '潼关县', '99');
INSERT INTO shop_areas VALUES ('2539', '2535', '大荔县', '99');
INSERT INTO shop_areas VALUES ('2540', '2535', '合阳县', '99');
INSERT INTO shop_areas VALUES ('2541', '2535', '澄城县', '99');
INSERT INTO shop_areas VALUES ('2542', '2535', '蒲城县', '99');
INSERT INTO shop_areas VALUES ('2543', '2535', '白水县', '99');
INSERT INTO shop_areas VALUES ('2544', '2535', '富平县', '99');
INSERT INTO shop_areas VALUES ('2545', '2535', '韩城市', '99');
INSERT INTO shop_areas VALUES ('2546', '2535', '华阴市', '99');
INSERT INTO shop_areas VALUES ('2547', '2471', '咸阳市', '99');
INSERT INTO shop_areas VALUES ('2548', '2547', '秦都区', '99');
INSERT INTO shop_areas VALUES ('2549', '2547', '杨凌区', '99');
INSERT INTO shop_areas VALUES ('2550', '2547', '渭城区', '99');
INSERT INTO shop_areas VALUES ('2551', '2547', '三原县', '99');
INSERT INTO shop_areas VALUES ('2552', '2547', '泾阳县', '99');
INSERT INTO shop_areas VALUES ('2553', '2547', '乾县', '99');
INSERT INTO shop_areas VALUES ('2554', '2547', '礼泉县', '99');
INSERT INTO shop_areas VALUES ('2555', '2547', '永寿县', '99');
INSERT INTO shop_areas VALUES ('2556', '2547', '彬县', '99');
INSERT INTO shop_areas VALUES ('2557', '2547', '长武县', '99');
INSERT INTO shop_areas VALUES ('2558', '2547', '旬邑县', '99');
INSERT INTO shop_areas VALUES ('2559', '2547', '淳化县', '99');
INSERT INTO shop_areas VALUES ('2560', '2547', '武功县', '99');
INSERT INTO shop_areas VALUES ('2561', '2547', '兴平市', '99');
INSERT INTO shop_areas VALUES ('2562', '2471', '延安市', '99');
INSERT INTO shop_areas VALUES ('2563', '2562', '宝塔区', '99');
INSERT INTO shop_areas VALUES ('2564', '2562', '延长县', '99');
INSERT INTO shop_areas VALUES ('2565', '2562', '延川县', '99');
INSERT INTO shop_areas VALUES ('2566', '2562', '子长县', '99');
INSERT INTO shop_areas VALUES ('2567', '2562', '安塞县', '99');
INSERT INTO shop_areas VALUES ('2568', '2562', '志丹县', '99');
INSERT INTO shop_areas VALUES ('2569', '2562', '吴旗县', '99');
INSERT INTO shop_areas VALUES ('2570', '2562', '甘泉县', '99');
INSERT INTO shop_areas VALUES ('2571', '2562', '富县', '99');
INSERT INTO shop_areas VALUES ('2572', '2562', '洛川县', '99');
INSERT INTO shop_areas VALUES ('2573', '2562', '宜川县', '99');
INSERT INTO shop_areas VALUES ('2574', '2562', '黄龙县', '99');
INSERT INTO shop_areas VALUES ('2575', '2562', '黄陵县', '99');
INSERT INTO shop_areas VALUES ('2576', '2471', '榆林市', '99');
INSERT INTO shop_areas VALUES ('2577', '2576', '榆阳区', '99');
INSERT INTO shop_areas VALUES ('2578', '2576', '神木县', '99');
INSERT INTO shop_areas VALUES ('2579', '2576', '府谷县', '99');
INSERT INTO shop_areas VALUES ('2580', '2576', '横山县', '99');
INSERT INTO shop_areas VALUES ('2581', '2576', '靖边县', '99');
INSERT INTO shop_areas VALUES ('2582', '2576', '定边县', '99');
INSERT INTO shop_areas VALUES ('2583', '2576', '绥德县', '99');
INSERT INTO shop_areas VALUES ('2584', '2576', '米脂县', '99');
INSERT INTO shop_areas VALUES ('2585', '2576', '佳县', '99');
INSERT INTO shop_areas VALUES ('2586', '2576', '吴堡县', '99');
INSERT INTO shop_areas VALUES ('2587', '2576', '清涧县', '99');
INSERT INTO shop_areas VALUES ('2588', '2576', '子洲县', '99');
INSERT INTO shop_areas VALUES ('2589', '0', '四川', '99');
INSERT INTO shop_areas VALUES ('2590', '2589', '成都市', '99');
INSERT INTO shop_areas VALUES ('2591', '2590', '锦江区', '99');
INSERT INTO shop_areas VALUES ('2592', '2590', '青羊区', '99');
INSERT INTO shop_areas VALUES ('2593', '2590', '金牛区', '99');
INSERT INTO shop_areas VALUES ('2594', '2590', '武侯区', '99');
INSERT INTO shop_areas VALUES ('2595', '2590', '成华区', '99');
INSERT INTO shop_areas VALUES ('2596', '2590', '龙泉驿区', '99');
INSERT INTO shop_areas VALUES ('2597', '2590', '青白江区', '99');
INSERT INTO shop_areas VALUES ('2598', '2590', '新都区', '99');
INSERT INTO shop_areas VALUES ('2599', '2590', '温江区', '99');
INSERT INTO shop_areas VALUES ('2600', '2590', '金堂县', '99');
INSERT INTO shop_areas VALUES ('2601', '2590', '双流县', '99');
INSERT INTO shop_areas VALUES ('2602', '2590', '郫县', '99');
INSERT INTO shop_areas VALUES ('2603', '2590', '大邑县', '99');
INSERT INTO shop_areas VALUES ('2604', '2590', '蒲江县', '99');
INSERT INTO shop_areas VALUES ('2605', '2590', '新津县', '99');
INSERT INTO shop_areas VALUES ('2606', '2590', '都江堰市', '99');
INSERT INTO shop_areas VALUES ('2607', '2590', '彭州市', '99');
INSERT INTO shop_areas VALUES ('2608', '2590', '邛崃市', '99');
INSERT INTO shop_areas VALUES ('2609', '2590', '崇州市', '99');
INSERT INTO shop_areas VALUES ('2610', '2589', '阿坝藏族羌族自治州', '99');
INSERT INTO shop_areas VALUES ('2611', '2610', '汶川县', '99');
INSERT INTO shop_areas VALUES ('2612', '2610', '理县', '99');
INSERT INTO shop_areas VALUES ('2613', '2610', '茂县', '99');
INSERT INTO shop_areas VALUES ('2614', '2610', '松潘县', '99');
INSERT INTO shop_areas VALUES ('2615', '2610', '九寨沟县', '99');
INSERT INTO shop_areas VALUES ('2616', '2610', '金川县', '99');
INSERT INTO shop_areas VALUES ('2617', '2610', '小金县', '99');
INSERT INTO shop_areas VALUES ('2618', '2610', '黑水县', '99');
INSERT INTO shop_areas VALUES ('2619', '2610', '马尔康县', '99');
INSERT INTO shop_areas VALUES ('2620', '2610', '壤塘县', '99');
INSERT INTO shop_areas VALUES ('2621', '2610', '阿坝县', '99');
INSERT INTO shop_areas VALUES ('2622', '2610', '若尔盖县', '99');
INSERT INTO shop_areas VALUES ('2623', '2610', '红原县', '99');
INSERT INTO shop_areas VALUES ('2624', '2589', '巴中市', '99');
INSERT INTO shop_areas VALUES ('2625', '2624', '巴州区', '99');
INSERT INTO shop_areas VALUES ('2626', '2624', '通江县', '99');
INSERT INTO shop_areas VALUES ('2627', '2624', '南江县', '99');
INSERT INTO shop_areas VALUES ('2628', '2624', '平昌县', '99');
INSERT INTO shop_areas VALUES ('2629', '2589', '达州市', '99');
INSERT INTO shop_areas VALUES ('2630', '2629', '通川区', '99');
INSERT INTO shop_areas VALUES ('2631', '2629', '达县', '99');
INSERT INTO shop_areas VALUES ('2632', '2629', '宣汉县', '99');
INSERT INTO shop_areas VALUES ('2633', '2629', '开江县', '99');
INSERT INTO shop_areas VALUES ('2634', '2629', '大竹县', '99');
INSERT INTO shop_areas VALUES ('2635', '2629', '渠县', '99');
INSERT INTO shop_areas VALUES ('2636', '2629', '万源市', '99');
INSERT INTO shop_areas VALUES ('2637', '2589', '德阳市', '99');
INSERT INTO shop_areas VALUES ('2638', '2637', '旌阳区', '99');
INSERT INTO shop_areas VALUES ('2639', '2637', '中江县', '99');
INSERT INTO shop_areas VALUES ('2640', '2637', '罗江县', '99');
INSERT INTO shop_areas VALUES ('2641', '2637', '广汉市', '99');
INSERT INTO shop_areas VALUES ('2642', '2637', '什邡市', '99');
INSERT INTO shop_areas VALUES ('2643', '2637', '绵竹市', '99');
INSERT INTO shop_areas VALUES ('2644', '2589', '甘孜藏族自治州', '99');
INSERT INTO shop_areas VALUES ('2645', '2644', '康定县', '99');
INSERT INTO shop_areas VALUES ('2646', '2644', '泸定县', '99');
INSERT INTO shop_areas VALUES ('2647', '2644', '丹巴县', '99');
INSERT INTO shop_areas VALUES ('2648', '2644', '九龙县', '99');
INSERT INTO shop_areas VALUES ('2649', '2644', '雅江县', '99');
INSERT INTO shop_areas VALUES ('2650', '2644', '道孚县', '99');
INSERT INTO shop_areas VALUES ('2651', '2644', '炉霍县', '99');
INSERT INTO shop_areas VALUES ('2652', '2644', '甘孜县', '99');
INSERT INTO shop_areas VALUES ('2653', '2644', '新龙县', '99');
INSERT INTO shop_areas VALUES ('2654', '2644', '德格县', '99');
INSERT INTO shop_areas VALUES ('2655', '2644', '白玉县', '99');
INSERT INTO shop_areas VALUES ('2656', '2644', '石渠县', '99');
INSERT INTO shop_areas VALUES ('2657', '2644', '色达县', '99');
INSERT INTO shop_areas VALUES ('2658', '2644', '理塘县', '99');
INSERT INTO shop_areas VALUES ('2659', '2644', '巴塘县', '99');
INSERT INTO shop_areas VALUES ('2660', '2644', '乡城县', '99');
INSERT INTO shop_areas VALUES ('2661', '2644', '稻城县', '99');
INSERT INTO shop_areas VALUES ('2662', '2644', '得荣县', '99');
INSERT INTO shop_areas VALUES ('2663', '2589', '广安市', '99');
INSERT INTO shop_areas VALUES ('2664', '2663', '广安区', '99');
INSERT INTO shop_areas VALUES ('2665', '2663', '岳池县', '99');
INSERT INTO shop_areas VALUES ('2666', '2663', '武胜县', '99');
INSERT INTO shop_areas VALUES ('2667', '2663', '邻水县', '99');
INSERT INTO shop_areas VALUES ('2668', '2663', '华莹市', '99');
INSERT INTO shop_areas VALUES ('2669', '2589', '广元市', '99');
INSERT INTO shop_areas VALUES ('2670', '2669', '市中区', '99');
INSERT INTO shop_areas VALUES ('2671', '2669', '元坝区', '99');
INSERT INTO shop_areas VALUES ('2672', '2669', '朝天区', '99');
INSERT INTO shop_areas VALUES ('2673', '2669', '旺苍县', '99');
INSERT INTO shop_areas VALUES ('2674', '2669', '青川县', '99');
INSERT INTO shop_areas VALUES ('2675', '2669', '剑阁县', '99');
INSERT INTO shop_areas VALUES ('2676', '2669', '苍溪县', '99');
INSERT INTO shop_areas VALUES ('2677', '2589', '乐山市', '99');
INSERT INTO shop_areas VALUES ('2678', '2677', '市中区', '99');
INSERT INTO shop_areas VALUES ('2679', '2677', '沙湾区', '99');
INSERT INTO shop_areas VALUES ('2680', '2677', '五通桥区', '99');
INSERT INTO shop_areas VALUES ('2681', '2677', '金口河区', '99');
INSERT INTO shop_areas VALUES ('2682', '2677', '犍为县', '99');
INSERT INTO shop_areas VALUES ('2683', '2677', '井研县', '99');
INSERT INTO shop_areas VALUES ('2684', '2677', '夹江县', '99');
INSERT INTO shop_areas VALUES ('2685', '2677', '沐川县', '99');
INSERT INTO shop_areas VALUES ('2686', '2677', '峨边彝族自治县', '99');
INSERT INTO shop_areas VALUES ('2687', '2677', '马边彝族自治县', '99');
INSERT INTO shop_areas VALUES ('2688', '2677', '峨眉山市', '99');
INSERT INTO shop_areas VALUES ('2689', '2589', '凉山彝族自治州', '99');
INSERT INTO shop_areas VALUES ('2690', '2689', '西昌市', '99');
INSERT INTO shop_areas VALUES ('2691', '2689', '木里藏族自治县', '99');
INSERT INTO shop_areas VALUES ('2692', '2689', '盐源县', '99');
INSERT INTO shop_areas VALUES ('2693', '2689', '德昌县', '99');
INSERT INTO shop_areas VALUES ('2694', '2689', '会理县', '99');
INSERT INTO shop_areas VALUES ('2695', '2689', '会东县', '99');
INSERT INTO shop_areas VALUES ('2696', '2689', '宁南县', '99');
INSERT INTO shop_areas VALUES ('2697', '2689', '普格县', '99');
INSERT INTO shop_areas VALUES ('2698', '2689', '布拖县', '99');
INSERT INTO shop_areas VALUES ('2699', '2689', '金阳县', '99');
INSERT INTO shop_areas VALUES ('2700', '2689', '昭觉县', '99');
INSERT INTO shop_areas VALUES ('2701', '2689', '喜德县', '99');
INSERT INTO shop_areas VALUES ('2702', '2689', '冕宁县', '99');
INSERT INTO shop_areas VALUES ('2703', '2689', '越西县', '99');
INSERT INTO shop_areas VALUES ('2704', '2689', '甘洛县', '99');
INSERT INTO shop_areas VALUES ('2705', '2689', '美姑县', '99');
INSERT INTO shop_areas VALUES ('2706', '2689', '雷波县', '99');
INSERT INTO shop_areas VALUES ('2707', '2589', '泸州市', '99');
INSERT INTO shop_areas VALUES ('2708', '2707', '江阳区', '99');
INSERT INTO shop_areas VALUES ('2709', '2707', '纳溪区', '99');
INSERT INTO shop_areas VALUES ('2710', '2707', '龙马潭区', '99');
INSERT INTO shop_areas VALUES ('2711', '2707', '泸县', '99');
INSERT INTO shop_areas VALUES ('2712', '2707', '合江县', '99');
INSERT INTO shop_areas VALUES ('2713', '2707', '叙永县', '99');
INSERT INTO shop_areas VALUES ('2714', '2707', '古蔺县', '99');
INSERT INTO shop_areas VALUES ('2715', '2589', '眉山市', '99');
INSERT INTO shop_areas VALUES ('2716', '2715', '东坡区', '99');
INSERT INTO shop_areas VALUES ('2717', '2715', '仁寿县', '99');
INSERT INTO shop_areas VALUES ('2718', '2715', '彭山县', '99');
INSERT INTO shop_areas VALUES ('2719', '2715', '洪雅县', '99');
INSERT INTO shop_areas VALUES ('2720', '2715', '丹棱县', '99');
INSERT INTO shop_areas VALUES ('2721', '2715', '青神县', '99');
INSERT INTO shop_areas VALUES ('2722', '2589', '绵阳市', '99');
INSERT INTO shop_areas VALUES ('2723', '2722', '涪城区', '99');
INSERT INTO shop_areas VALUES ('2724', '2722', '游仙区', '99');
INSERT INTO shop_areas VALUES ('2725', '2722', '三台县', '99');
INSERT INTO shop_areas VALUES ('2726', '2722', '盐亭县', '99');
INSERT INTO shop_areas VALUES ('2727', '2722', '安县', '99');
INSERT INTO shop_areas VALUES ('2728', '2722', '梓潼县', '99');
INSERT INTO shop_areas VALUES ('2729', '2722', '北川羌族自治县', '99');
INSERT INTO shop_areas VALUES ('2730', '2722', '平武县', '99');
INSERT INTO shop_areas VALUES ('2731', '2722', '江油市', '99');
INSERT INTO shop_areas VALUES ('2732', '2589', '内江市', '99');
INSERT INTO shop_areas VALUES ('2733', '2732', '市中区', '99');
INSERT INTO shop_areas VALUES ('2734', '2732', '东兴区', '99');
INSERT INTO shop_areas VALUES ('2735', '2732', '威远县', '99');
INSERT INTO shop_areas VALUES ('2736', '2732', '资中县', '99');
INSERT INTO shop_areas VALUES ('2737', '2732', '隆昌县', '99');
INSERT INTO shop_areas VALUES ('2738', '2589', '南充市', '99');
INSERT INTO shop_areas VALUES ('2739', '2738', '顺庆区', '99');
INSERT INTO shop_areas VALUES ('2740', '2738', '高坪区', '99');
INSERT INTO shop_areas VALUES ('2741', '2738', '嘉陵区', '99');
INSERT INTO shop_areas VALUES ('2742', '2738', '南部县', '99');
INSERT INTO shop_areas VALUES ('2743', '2738', '营山县', '99');
INSERT INTO shop_areas VALUES ('2744', '2738', '蓬安县', '99');
INSERT INTO shop_areas VALUES ('2745', '2738', '仪陇县', '99');
INSERT INTO shop_areas VALUES ('2746', '2738', '西充县', '99');
INSERT INTO shop_areas VALUES ('2747', '2738', '阆中市', '99');
INSERT INTO shop_areas VALUES ('2748', '2589', '攀枝花市', '99');
INSERT INTO shop_areas VALUES ('2749', '2748', '东区', '99');
INSERT INTO shop_areas VALUES ('2750', '2748', '西区', '99');
INSERT INTO shop_areas VALUES ('2751', '2748', '仁和区', '99');
INSERT INTO shop_areas VALUES ('2752', '2748', '米易县', '99');
INSERT INTO shop_areas VALUES ('2753', '2748', '盐边县', '99');
INSERT INTO shop_areas VALUES ('2754', '2589', '遂宁市', '99');
INSERT INTO shop_areas VALUES ('2755', '2754', '船山区', '99');
INSERT INTO shop_areas VALUES ('2756', '2754', '安居区', '99');
INSERT INTO shop_areas VALUES ('2757', '2754', '蓬溪县', '99');
INSERT INTO shop_areas VALUES ('2758', '2754', '射洪县', '99');
INSERT INTO shop_areas VALUES ('2759', '2754', '大英县', '99');
INSERT INTO shop_areas VALUES ('2760', '2589', '雅安市', '99');
INSERT INTO shop_areas VALUES ('2761', '2760', '雨城区', '99');
INSERT INTO shop_areas VALUES ('2762', '2760', '名山县', '99');
INSERT INTO shop_areas VALUES ('2763', '2760', '荥经县', '99');
INSERT INTO shop_areas VALUES ('2764', '2760', '汉源县', '99');
INSERT INTO shop_areas VALUES ('2765', '2760', '石棉县', '99');
INSERT INTO shop_areas VALUES ('2766', '2760', '天全县', '99');
INSERT INTO shop_areas VALUES ('2767', '2760', '芦山县', '99');
INSERT INTO shop_areas VALUES ('2768', '2760', '宝兴县', '99');
INSERT INTO shop_areas VALUES ('2769', '2589', '宜宾市', '99');
INSERT INTO shop_areas VALUES ('2770', '2769', '翠屏区', '99');
INSERT INTO shop_areas VALUES ('2771', '2769', '宜宾县', '99');
INSERT INTO shop_areas VALUES ('2772', '2769', '南溪县', '99');
INSERT INTO shop_areas VALUES ('2773', '2769', '江安县', '99');
INSERT INTO shop_areas VALUES ('2774', '2769', '长宁县', '99');
INSERT INTO shop_areas VALUES ('2775', '2769', '高县', '99');
INSERT INTO shop_areas VALUES ('2776', '2769', '珙县', '99');
INSERT INTO shop_areas VALUES ('2777', '2769', '筠连县', '99');
INSERT INTO shop_areas VALUES ('2778', '2769', '兴文县', '99');
INSERT INTO shop_areas VALUES ('2779', '2769', '屏山县', '99');
INSERT INTO shop_areas VALUES ('2780', '2589', '资阳市', '99');
INSERT INTO shop_areas VALUES ('2781', '2780', '雁江区', '99');
INSERT INTO shop_areas VALUES ('2782', '2780', '安岳县', '99');
INSERT INTO shop_areas VALUES ('2783', '2780', '乐至县', '99');
INSERT INTO shop_areas VALUES ('2784', '2780', '简阳市', '99');
INSERT INTO shop_areas VALUES ('2785', '2589', '自贡市', '99');
INSERT INTO shop_areas VALUES ('2786', '2785', '自流井区', '99');
INSERT INTO shop_areas VALUES ('2787', '2785', '贡井区', '99');
INSERT INTO shop_areas VALUES ('2788', '2785', '大安区', '99');
INSERT INTO shop_areas VALUES ('2789', '2785', '沿滩区', '99');
INSERT INTO shop_areas VALUES ('2790', '2785', '荣县', '99');
INSERT INTO shop_areas VALUES ('2791', '2785', '富顺县', '99');
INSERT INTO shop_areas VALUES ('2792', '0', '西藏', '99');
INSERT INTO shop_areas VALUES ('2793', '2792', '拉萨市', '99');
INSERT INTO shop_areas VALUES ('2794', '2793', '城关区', '99');
INSERT INTO shop_areas VALUES ('2795', '2793', '林周县', '99');
INSERT INTO shop_areas VALUES ('2796', '2793', '当雄县', '99');
INSERT INTO shop_areas VALUES ('2797', '2793', '尼木县', '99');
INSERT INTO shop_areas VALUES ('2798', '2793', '曲水县', '99');
INSERT INTO shop_areas VALUES ('2799', '2793', '堆龙德庆县', '99');
INSERT INTO shop_areas VALUES ('2800', '2793', '达孜县', '99');
INSERT INTO shop_areas VALUES ('2801', '2793', '墨竹工卡县', '99');
INSERT INTO shop_areas VALUES ('2802', '2792', '阿里地区', '99');
INSERT INTO shop_areas VALUES ('2803', '2802', '普兰县', '99');
INSERT INTO shop_areas VALUES ('2804', '2802', '札达县', '99');
INSERT INTO shop_areas VALUES ('2805', '2802', '噶尔县', '99');
INSERT INTO shop_areas VALUES ('2806', '2802', '日土县', '99');
INSERT INTO shop_areas VALUES ('2807', '2802', '革吉县', '99');
INSERT INTO shop_areas VALUES ('2808', '2802', '改则县', '99');
INSERT INTO shop_areas VALUES ('2809', '2802', '措勤县', '99');
INSERT INTO shop_areas VALUES ('2810', '2792', '昌都地区', '99');
INSERT INTO shop_areas VALUES ('2811', '2810', '昌都县', '99');
INSERT INTO shop_areas VALUES ('2812', '2810', '江达县', '99');
INSERT INTO shop_areas VALUES ('2813', '2810', '贡觉县', '99');
INSERT INTO shop_areas VALUES ('2814', '2810', '类乌齐县', '99');
INSERT INTO shop_areas VALUES ('2815', '2810', '丁青县', '99');
INSERT INTO shop_areas VALUES ('2816', '2810', '察雅县', '99');
INSERT INTO shop_areas VALUES ('2817', '2810', '八宿县', '99');
INSERT INTO shop_areas VALUES ('2818', '2810', '左贡县', '99');
INSERT INTO shop_areas VALUES ('2819', '2810', '芒康县', '99');
INSERT INTO shop_areas VALUES ('2820', '2810', '洛隆县', '99');
INSERT INTO shop_areas VALUES ('2821', '2810', '边坝县', '99');
INSERT INTO shop_areas VALUES ('2822', '2792', '林芝地区', '99');
INSERT INTO shop_areas VALUES ('2823', '2822', '林芝县', '99');
INSERT INTO shop_areas VALUES ('2824', '2822', '工布江达县', '99');
INSERT INTO shop_areas VALUES ('2825', '2822', '米林县', '99');
INSERT INTO shop_areas VALUES ('2826', '2822', '墨脱县', '99');
INSERT INTO shop_areas VALUES ('2827', '2822', '波密县', '99');
INSERT INTO shop_areas VALUES ('2828', '2822', '察隅县', '99');
INSERT INTO shop_areas VALUES ('2829', '2822', '朗县', '99');
INSERT INTO shop_areas VALUES ('2830', '2792', '那曲地区', '99');
INSERT INTO shop_areas VALUES ('2831', '2830', '那曲县', '99');
INSERT INTO shop_areas VALUES ('2832', '2830', '嘉黎县', '99');
INSERT INTO shop_areas VALUES ('2833', '2830', '比如县', '99');
INSERT INTO shop_areas VALUES ('2834', '2830', '聂荣县', '99');
INSERT INTO shop_areas VALUES ('2835', '2830', '安多县', '99');
INSERT INTO shop_areas VALUES ('2836', '2830', '申扎县', '99');
INSERT INTO shop_areas VALUES ('2837', '2830', '索县', '99');
INSERT INTO shop_areas VALUES ('2838', '2830', '班戈县', '99');
INSERT INTO shop_areas VALUES ('2839', '2830', '巴青县', '99');
INSERT INTO shop_areas VALUES ('2840', '2830', '尼玛县', '99');
INSERT INTO shop_areas VALUES ('2841', '2792', '日喀则地区', '99');
INSERT INTO shop_areas VALUES ('2842', '2841', '日喀则市', '99');
INSERT INTO shop_areas VALUES ('2843', '2841', '南木林县', '99');
INSERT INTO shop_areas VALUES ('2844', '2841', '江孜县', '99');
INSERT INTO shop_areas VALUES ('2845', '2841', '定日县', '99');
INSERT INTO shop_areas VALUES ('2846', '2841', '萨迦县', '99');
INSERT INTO shop_areas VALUES ('2847', '2841', '拉孜县', '99');
INSERT INTO shop_areas VALUES ('2848', '2841', '昂仁县', '99');
INSERT INTO shop_areas VALUES ('2849', '2841', '谢通门县', '99');
INSERT INTO shop_areas VALUES ('2850', '2841', '白朗县', '99');
INSERT INTO shop_areas VALUES ('2851', '2841', '仁布县', '99');
INSERT INTO shop_areas VALUES ('2852', '2841', '康马县', '99');
INSERT INTO shop_areas VALUES ('2853', '2841', '定结县', '99');
INSERT INTO shop_areas VALUES ('2854', '2841', '仲巴县', '99');
INSERT INTO shop_areas VALUES ('2855', '2841', '亚东县', '99');
INSERT INTO shop_areas VALUES ('2856', '2841', '吉隆县', '99');
INSERT INTO shop_areas VALUES ('2857', '2841', '聂拉木县', '99');
INSERT INTO shop_areas VALUES ('2858', '2841', '萨嘎县', '99');
INSERT INTO shop_areas VALUES ('2859', '2841', '岗巴县', '99');
INSERT INTO shop_areas VALUES ('2860', '2792', '山南地区', '99');
INSERT INTO shop_areas VALUES ('2861', '2860', '乃东县', '99');
INSERT INTO shop_areas VALUES ('2862', '2860', '扎囊县', '99');
INSERT INTO shop_areas VALUES ('2863', '2860', '贡嘎县', '99');
INSERT INTO shop_areas VALUES ('2864', '2860', '桑日县', '99');
INSERT INTO shop_areas VALUES ('2865', '2860', '琼结县', '99');
INSERT INTO shop_areas VALUES ('2866', '2860', '曲松县', '99');
INSERT INTO shop_areas VALUES ('2867', '2860', '措美县', '99');
INSERT INTO shop_areas VALUES ('2868', '2860', '洛扎县', '99');
INSERT INTO shop_areas VALUES ('2869', '2860', '加查县', '99');
INSERT INTO shop_areas VALUES ('2870', '2860', '隆子县', '99');
INSERT INTO shop_areas VALUES ('2871', '2860', '错那县', '99');
INSERT INTO shop_areas VALUES ('2872', '2860', '浪卡子县', '99');
INSERT INTO shop_areas VALUES ('2873', '0', '新疆', '99');
INSERT INTO shop_areas VALUES ('2874', '2873', '乌鲁木齐市', '99');
INSERT INTO shop_areas VALUES ('2875', '2874', '天山区', '99');
INSERT INTO shop_areas VALUES ('2876', '2874', '沙依巴克区', '99');
INSERT INTO shop_areas VALUES ('2877', '2874', '新市区', '99');
INSERT INTO shop_areas VALUES ('2878', '2874', '水磨沟区', '99');
INSERT INTO shop_areas VALUES ('2879', '2874', '头屯河区', '99');
INSERT INTO shop_areas VALUES ('2880', '2874', '达坂城区', '99');
INSERT INTO shop_areas VALUES ('2881', '2874', '东山区', '99');
INSERT INTO shop_areas VALUES ('2882', '2874', '乌鲁木齐县', '99');
INSERT INTO shop_areas VALUES ('2883', '2873', '阿克苏地区', '99');
INSERT INTO shop_areas VALUES ('2884', '2883', '阿克苏市', '99');
INSERT INTO shop_areas VALUES ('2885', '2883', '温宿县', '99');
INSERT INTO shop_areas VALUES ('2886', '2883', '库车县', '99');
INSERT INTO shop_areas VALUES ('2887', '2883', '沙雅县', '99');
INSERT INTO shop_areas VALUES ('2888', '2883', '新和县', '99');
INSERT INTO shop_areas VALUES ('2889', '2883', '拜城县', '99');
INSERT INTO shop_areas VALUES ('2890', '2883', '乌什县', '99');
INSERT INTO shop_areas VALUES ('2891', '2883', '阿瓦提县', '99');
INSERT INTO shop_areas VALUES ('2892', '2883', '柯坪县', '99');
INSERT INTO shop_areas VALUES ('2893', '2873', '阿拉尔市', '99');
INSERT INTO shop_areas VALUES ('2894', '2873', '阿勒泰地区', '99');
INSERT INTO shop_areas VALUES ('2895', '2894', '阿勒泰市', '99');
INSERT INTO shop_areas VALUES ('2896', '2894', '布尔津县', '99');
INSERT INTO shop_areas VALUES ('2897', '2894', '富蕴县', '99');
INSERT INTO shop_areas VALUES ('2898', '2894', '福海县', '99');
INSERT INTO shop_areas VALUES ('2899', '2894', '哈巴河县', '99');
INSERT INTO shop_areas VALUES ('2900', '2894', '青河县', '99');
INSERT INTO shop_areas VALUES ('2901', '2894', '吉木乃县', '99');
INSERT INTO shop_areas VALUES ('2902', '2873', '巴音郭楞蒙古自治州', '99');
INSERT INTO shop_areas VALUES ('2903', '2902', '库尔勒市', '99');
INSERT INTO shop_areas VALUES ('2904', '2902', '轮台县', '99');
INSERT INTO shop_areas VALUES ('2905', '2902', '尉犁县', '99');
INSERT INTO shop_areas VALUES ('2906', '2902', '若羌县', '99');
INSERT INTO shop_areas VALUES ('2907', '2902', '且末县', '99');
INSERT INTO shop_areas VALUES ('2908', '2902', '焉耆回族自治县', '99');
INSERT INTO shop_areas VALUES ('2909', '2902', '和静县', '99');
INSERT INTO shop_areas VALUES ('2910', '2902', '和硕县', '99');
INSERT INTO shop_areas VALUES ('2911', '2902', '博湖县', '99');
INSERT INTO shop_areas VALUES ('2912', '2873', '博尔塔拉蒙古自治州', '99');
INSERT INTO shop_areas VALUES ('2913', '2912', '博乐市', '99');
INSERT INTO shop_areas VALUES ('2914', '2912', '精河县', '99');
INSERT INTO shop_areas VALUES ('2915', '2912', '温泉县', '99');
INSERT INTO shop_areas VALUES ('2916', '2873', '昌吉回族自治州', '99');
INSERT INTO shop_areas VALUES ('2917', '2916', '昌吉市', '99');
INSERT INTO shop_areas VALUES ('2918', '2916', '阜康市', '99');
INSERT INTO shop_areas VALUES ('2919', '2916', '米泉市', '99');
INSERT INTO shop_areas VALUES ('2920', '2916', '呼图壁县', '99');
INSERT INTO shop_areas VALUES ('2921', '2916', '玛纳斯县', '99');
INSERT INTO shop_areas VALUES ('2922', '2916', '奇台县', '99');
INSERT INTO shop_areas VALUES ('2923', '2916', '吉木萨尔县', '99');
INSERT INTO shop_areas VALUES ('2924', '2916', '木垒哈萨克自治县', '99');
INSERT INTO shop_areas VALUES ('2925', '2873', '哈密地区', '99');
INSERT INTO shop_areas VALUES ('2926', '2925', '哈密市', '99');
INSERT INTO shop_areas VALUES ('2927', '2925', '巴里坤哈萨克自治县', '99');
INSERT INTO shop_areas VALUES ('2928', '2925', '伊吾县', '99');
INSERT INTO shop_areas VALUES ('2929', '2873', '和田地区', '99');
INSERT INTO shop_areas VALUES ('2930', '2929', '和田市', '99');
INSERT INTO shop_areas VALUES ('2931', '2929', '和田县', '99');
INSERT INTO shop_areas VALUES ('2932', '2929', '墨玉县', '99');
INSERT INTO shop_areas VALUES ('2933', '2929', '皮山县', '99');
INSERT INTO shop_areas VALUES ('2934', '2929', '洛浦县', '99');
INSERT INTO shop_areas VALUES ('2935', '2929', '策勒县', '99');
INSERT INTO shop_areas VALUES ('2936', '2929', '于田县', '99');
INSERT INTO shop_areas VALUES ('2937', '2929', '民丰县', '99');
INSERT INTO shop_areas VALUES ('2938', '2873', '喀什地区', '99');
INSERT INTO shop_areas VALUES ('2939', '2938', '喀什市', '99');
INSERT INTO shop_areas VALUES ('2940', '2938', '疏附县', '99');
INSERT INTO shop_areas VALUES ('2941', '2938', '疏勒县', '99');
INSERT INTO shop_areas VALUES ('2942', '2938', '英吉沙县', '99');
INSERT INTO shop_areas VALUES ('2943', '2938', '泽普县', '99');
INSERT INTO shop_areas VALUES ('2944', '2938', '莎车县', '99');
INSERT INTO shop_areas VALUES ('2945', '2938', '叶城县', '99');
INSERT INTO shop_areas VALUES ('2946', '2938', '麦盖提县', '99');
INSERT INTO shop_areas VALUES ('2947', '2938', '岳普湖县', '99');
INSERT INTO shop_areas VALUES ('2948', '2938', '伽师县', '99');
INSERT INTO shop_areas VALUES ('2949', '2938', '巴楚县', '99');
INSERT INTO shop_areas VALUES ('2950', '2938', '塔什库尔干塔吉克自治县', '99');
INSERT INTO shop_areas VALUES ('2951', '2873', '克拉玛依市', '99');
INSERT INTO shop_areas VALUES ('2952', '2951', '独山子区', '99');
INSERT INTO shop_areas VALUES ('2953', '2951', '克拉玛依区', '99');
INSERT INTO shop_areas VALUES ('2954', '2951', '白碱滩区', '99');
INSERT INTO shop_areas VALUES ('2955', '2951', '乌尔禾区', '99');
INSERT INTO shop_areas VALUES ('2956', '2873', '克孜勒苏柯尔克孜自治州', '99');
INSERT INTO shop_areas VALUES ('2957', '2956', '阿图什市', '99');
INSERT INTO shop_areas VALUES ('2958', '2956', '阿克陶县', '99');
INSERT INTO shop_areas VALUES ('2959', '2956', '阿合奇县', '99');
INSERT INTO shop_areas VALUES ('2960', '2956', '乌恰县', '99');
INSERT INTO shop_areas VALUES ('2961', '2873', '石河子市', '99');
INSERT INTO shop_areas VALUES ('2962', '2873', '塔城地区', '99');
INSERT INTO shop_areas VALUES ('2963', '2962', '塔城市', '99');
INSERT INTO shop_areas VALUES ('2964', '2962', '乌苏市', '99');
INSERT INTO shop_areas VALUES ('2965', '2962', '额敏县', '99');
INSERT INTO shop_areas VALUES ('2966', '2962', '沙湾县', '99');
INSERT INTO shop_areas VALUES ('2967', '2962', '托里县', '99');
INSERT INTO shop_areas VALUES ('2968', '2962', '裕民县', '99');
INSERT INTO shop_areas VALUES ('2969', '2962', '和布克赛尔蒙古自治县', '99');
INSERT INTO shop_areas VALUES ('2970', '2873', '图木舒克市', '99');
INSERT INTO shop_areas VALUES ('2971', '2873', '吐鲁番地区', '99');
INSERT INTO shop_areas VALUES ('2972', '2971', '吐鲁番市', '99');
INSERT INTO shop_areas VALUES ('2973', '2971', '鄯善县', '99');
INSERT INTO shop_areas VALUES ('2974', '2971', '托克逊县', '99');
INSERT INTO shop_areas VALUES ('2975', '2873', '五家渠市', '99');
INSERT INTO shop_areas VALUES ('2976', '2873', '伊犁哈萨克自治州', '99');
INSERT INTO shop_areas VALUES ('2977', '2976', '伊宁市', '99');
INSERT INTO shop_areas VALUES ('2978', '2976', '奎屯市', '99');
INSERT INTO shop_areas VALUES ('2979', '2976', '伊宁县', '99');
INSERT INTO shop_areas VALUES ('2980', '2976', '察布查尔锡伯自治县', '99');
INSERT INTO shop_areas VALUES ('2981', '2976', '霍城县', '99');
INSERT INTO shop_areas VALUES ('2982', '2976', '巩留县', '99');
INSERT INTO shop_areas VALUES ('2983', '2976', '新源县', '99');
INSERT INTO shop_areas VALUES ('2984', '2976', '昭苏县', '99');
INSERT INTO shop_areas VALUES ('2985', '2976', '特克斯县', '99');
INSERT INTO shop_areas VALUES ('2986', '2976', '尼勒克县', '99');
INSERT INTO shop_areas VALUES ('2987', '0', '云南', '99');
INSERT INTO shop_areas VALUES ('2988', '2987', '昆明市', '99');
INSERT INTO shop_areas VALUES ('2989', '2988', '五华区', '99');
INSERT INTO shop_areas VALUES ('2990', '2988', '盘龙区', '99');
INSERT INTO shop_areas VALUES ('2991', '2988', '官渡区', '99');
INSERT INTO shop_areas VALUES ('2992', '2988', '西山区', '99');
INSERT INTO shop_areas VALUES ('2993', '2988', '东川区', '99');
INSERT INTO shop_areas VALUES ('2994', '2988', '呈贡县', '99');
INSERT INTO shop_areas VALUES ('2995', '2988', '晋宁县', '99');
INSERT INTO shop_areas VALUES ('2996', '2988', '富民县', '99');
INSERT INTO shop_areas VALUES ('2997', '2988', '宜良县', '99');
INSERT INTO shop_areas VALUES ('2998', '2988', '石林彝族自治县', '99');
INSERT INTO shop_areas VALUES ('2999', '2988', '嵩明县', '99');
INSERT INTO shop_areas VALUES ('3000', '2988', '禄劝彝族苗族自治县', '99');
INSERT INTO shop_areas VALUES ('3001', '2988', '寻甸回族彝族自治县', '99');
INSERT INTO shop_areas VALUES ('3002', '2988', '安宁市', '99');
INSERT INTO shop_areas VALUES ('3003', '2987', '保山市', '99');
INSERT INTO shop_areas VALUES ('3004', '3003', '隆阳区', '99');
INSERT INTO shop_areas VALUES ('3005', '3003', '施甸县', '99');
INSERT INTO shop_areas VALUES ('3006', '3003', '腾冲县', '99');
INSERT INTO shop_areas VALUES ('3007', '3003', '龙陵县', '99');
INSERT INTO shop_areas VALUES ('3008', '3003', '昌宁县', '99');
INSERT INTO shop_areas VALUES ('3009', '2987', '楚雄彝族自治州', '99');
INSERT INTO shop_areas VALUES ('3010', '3009', '楚雄市', '99');
INSERT INTO shop_areas VALUES ('3011', '3009', '双柏县', '99');
INSERT INTO shop_areas VALUES ('3012', '3009', '牟定县', '99');
INSERT INTO shop_areas VALUES ('3013', '3009', '南华县', '99');
INSERT INTO shop_areas VALUES ('3014', '3009', '姚安县', '99');
INSERT INTO shop_areas VALUES ('3015', '3009', '大姚县', '99');
INSERT INTO shop_areas VALUES ('3016', '3009', '永仁县', '99');
INSERT INTO shop_areas VALUES ('3017', '3009', '元谋县', '99');
INSERT INTO shop_areas VALUES ('3018', '3009', '武定县', '99');
INSERT INTO shop_areas VALUES ('3019', '3009', '禄丰县', '99');
INSERT INTO shop_areas VALUES ('3020', '2987', '大理白族自治州', '99');
INSERT INTO shop_areas VALUES ('3021', '3020', '大理市', '99');
INSERT INTO shop_areas VALUES ('3022', '3020', '漾濞彝族自治县', '99');
INSERT INTO shop_areas VALUES ('3023', '3020', '祥云县', '99');
INSERT INTO shop_areas VALUES ('3024', '3020', '宾川县', '99');
INSERT INTO shop_areas VALUES ('3025', '3020', '弥渡县', '99');
INSERT INTO shop_areas VALUES ('3026', '3020', '南涧彝族自治县', '99');
INSERT INTO shop_areas VALUES ('3027', '3020', '巍山彝族回族自治县', '99');
INSERT INTO shop_areas VALUES ('3028', '3020', '永平县', '99');
INSERT INTO shop_areas VALUES ('3029', '3020', '云龙县', '99');
INSERT INTO shop_areas VALUES ('3030', '3020', '洱源县', '99');
INSERT INTO shop_areas VALUES ('3031', '3020', '剑川县', '99');
INSERT INTO shop_areas VALUES ('3032', '3020', '鹤庆县', '99');
INSERT INTO shop_areas VALUES ('3033', '2987', '德宏傣族景颇族自治州', '99');
INSERT INTO shop_areas VALUES ('3034', '3033', '瑞丽市', '99');
INSERT INTO shop_areas VALUES ('3035', '3033', '潞西市', '99');
INSERT INTO shop_areas VALUES ('3036', '3033', '梁河县', '99');
INSERT INTO shop_areas VALUES ('3037', '3033', '盈江县', '99');
INSERT INTO shop_areas VALUES ('3038', '3033', '陇川县', '99');
INSERT INTO shop_areas VALUES ('3039', '2987', '迪庆藏族自治州', '99');
INSERT INTO shop_areas VALUES ('3040', '3039', '香格里拉县', '99');
INSERT INTO shop_areas VALUES ('3041', '3039', '德钦县', '99');
INSERT INTO shop_areas VALUES ('3042', '3039', '维西傈僳族自治县', '99');
INSERT INTO shop_areas VALUES ('3043', '2987', '红河哈尼族彝族自治州', '99');
INSERT INTO shop_areas VALUES ('3044', '3043', '个旧市', '99');
INSERT INTO shop_areas VALUES ('3045', '3043', '开远市', '99');
INSERT INTO shop_areas VALUES ('3046', '3043', '蒙自县', '99');
INSERT INTO shop_areas VALUES ('3047', '3043', '屏边苗族自治县', '99');
INSERT INTO shop_areas VALUES ('3048', '3043', '建水县', '99');
INSERT INTO shop_areas VALUES ('3049', '3043', '石屏县', '99');
INSERT INTO shop_areas VALUES ('3050', '3043', '弥勒县', '99');
INSERT INTO shop_areas VALUES ('3051', '3043', '泸西县', '99');
INSERT INTO shop_areas VALUES ('3052', '3043', '元阳县', '99');
INSERT INTO shop_areas VALUES ('3053', '3043', '红河县', '99');
INSERT INTO shop_areas VALUES ('3054', '3043', '金平苗族瑶族傣族自治县', '99');
INSERT INTO shop_areas VALUES ('3055', '3043', '绿春县', '99');
INSERT INTO shop_areas VALUES ('3056', '3043', '河口瑶族自治县', '99');
INSERT INTO shop_areas VALUES ('3057', '2987', '丽江市', '99');
INSERT INTO shop_areas VALUES ('3058', '3057', '古城区', '99');
INSERT INTO shop_areas VALUES ('3059', '3057', '玉龙纳西族自治县', '99');
INSERT INTO shop_areas VALUES ('3060', '3057', '永胜县', '99');
INSERT INTO shop_areas VALUES ('3061', '3057', '华坪县', '99');
INSERT INTO shop_areas VALUES ('3062', '3057', '宁蒗彝族自治县', '99');
INSERT INTO shop_areas VALUES ('3063', '2987', '临沧市', '99');
INSERT INTO shop_areas VALUES ('3064', '3063', '临翔区', '99');
INSERT INTO shop_areas VALUES ('3065', '3063', '凤庆县', '99');
INSERT INTO shop_areas VALUES ('3066', '3063', '云县', '99');
INSERT INTO shop_areas VALUES ('3067', '3063', '永德县', '99');
INSERT INTO shop_areas VALUES ('3068', '3063', '镇康县', '99');
INSERT INTO shop_areas VALUES ('3069', '3063', '双江拉祜族佤族布朗族傣族自治县', '99');
INSERT INTO shop_areas VALUES ('3070', '3063', '耿马傣族佤族自治县', '99');
INSERT INTO shop_areas VALUES ('3071', '3063', '沧源佤族自治县', '99');
INSERT INTO shop_areas VALUES ('3072', '2987', '怒江傈僳族自治州', '99');
INSERT INTO shop_areas VALUES ('3073', '3072', '泸水县', '99');
INSERT INTO shop_areas VALUES ('3074', '3072', '福贡县', '99');
INSERT INTO shop_areas VALUES ('3075', '3072', '贡山独龙族怒族自治县', '99');
INSERT INTO shop_areas VALUES ('3076', '3072', '兰坪白族普米族自治县', '99');
INSERT INTO shop_areas VALUES ('3077', '2987', '曲靖市', '99');
INSERT INTO shop_areas VALUES ('3078', '3077', '麒麟区', '99');
INSERT INTO shop_areas VALUES ('3079', '3077', '马龙县', '99');
INSERT INTO shop_areas VALUES ('3080', '3077', '陆良县', '99');
INSERT INTO shop_areas VALUES ('3081', '3077', '师宗县', '99');
INSERT INTO shop_areas VALUES ('3082', '3077', '罗平县', '99');
INSERT INTO shop_areas VALUES ('3083', '3077', '富源县', '99');
INSERT INTO shop_areas VALUES ('3084', '3077', '会泽县', '99');
INSERT INTO shop_areas VALUES ('3085', '3077', '沾益县', '99');
INSERT INTO shop_areas VALUES ('3086', '3077', '宣威市', '99');
INSERT INTO shop_areas VALUES ('3087', '2987', '思茅市', '99');
INSERT INTO shop_areas VALUES ('3088', '3087', '翠云区', '99');
INSERT INTO shop_areas VALUES ('3089', '3087', '普洱哈尼族彝族自治县', '99');
INSERT INTO shop_areas VALUES ('3090', '3087', '墨江哈尼族自治县', '99');
INSERT INTO shop_areas VALUES ('3091', '3087', '景东彝族自治县', '99');
INSERT INTO shop_areas VALUES ('3092', '3087', '景谷傣族彝族自治县', '99');
INSERT INTO shop_areas VALUES ('3093', '3087', '镇沅彝族哈尼族拉祜族自治县', '99');
INSERT INTO shop_areas VALUES ('3094', '3087', '江城哈尼族彝族自治县', '99');
INSERT INTO shop_areas VALUES ('3095', '3087', '孟连傣族拉祜族佤族自治县', '99');
INSERT INTO shop_areas VALUES ('3096', '3087', '澜沧拉祜族自治县', '99');
INSERT INTO shop_areas VALUES ('3097', '3087', '西盟佤族自治县', '99');
INSERT INTO shop_areas VALUES ('3098', '2987', '文山壮族苗族自治州', '99');
INSERT INTO shop_areas VALUES ('3099', '3098', '文山县', '99');
INSERT INTO shop_areas VALUES ('3100', '3098', '砚山县', '99');
INSERT INTO shop_areas VALUES ('3101', '3098', '西畴县', '99');
INSERT INTO shop_areas VALUES ('3102', '3098', '麻栗坡县', '99');
INSERT INTO shop_areas VALUES ('3103', '3098', '马关县', '99');
INSERT INTO shop_areas VALUES ('3104', '3098', '丘北县', '99');
INSERT INTO shop_areas VALUES ('3105', '3098', '广南县', '99');
INSERT INTO shop_areas VALUES ('3106', '3098', '富宁县', '99');
INSERT INTO shop_areas VALUES ('3107', '2987', '西双版纳傣族自治州', '99');
INSERT INTO shop_areas VALUES ('3108', '3107', '景洪市', '99');
INSERT INTO shop_areas VALUES ('3109', '3107', '勐海县', '99');
INSERT INTO shop_areas VALUES ('3110', '3107', '勐腊县', '99');
INSERT INTO shop_areas VALUES ('3111', '2987', '玉溪市', '99');
INSERT INTO shop_areas VALUES ('3112', '3111', '红塔区', '99');
INSERT INTO shop_areas VALUES ('3113', '3111', '江川县', '99');
INSERT INTO shop_areas VALUES ('3114', '3111', '澄江县', '99');
INSERT INTO shop_areas VALUES ('3115', '3111', '通海县', '99');
INSERT INTO shop_areas VALUES ('3116', '3111', '华宁县', '99');
INSERT INTO shop_areas VALUES ('3117', '3111', '易门县', '99');
INSERT INTO shop_areas VALUES ('3118', '3111', '峨山彝族自治县', '99');
INSERT INTO shop_areas VALUES ('3119', '3111', '新平彝族傣族自治县', '99');
INSERT INTO shop_areas VALUES ('3120', '3111', '元江哈尼族彝族傣族自治县', '99');
INSERT INTO shop_areas VALUES ('3121', '2987', '昭通市', '99');
INSERT INTO shop_areas VALUES ('3122', '3121', '昭阳区', '99');
INSERT INTO shop_areas VALUES ('3123', '3121', '鲁甸县', '99');
INSERT INTO shop_areas VALUES ('3124', '3121', '巧家县', '99');
INSERT INTO shop_areas VALUES ('3125', '3121', '盐津县', '99');
INSERT INTO shop_areas VALUES ('3126', '3121', '大关县', '99');
INSERT INTO shop_areas VALUES ('3127', '3121', '永善县', '99');
INSERT INTO shop_areas VALUES ('3128', '3121', '绥江县', '99');
INSERT INTO shop_areas VALUES ('3129', '3121', '镇雄县', '99');
INSERT INTO shop_areas VALUES ('3130', '3121', '彝良县', '99');
INSERT INTO shop_areas VALUES ('3131', '3121', '威信县', '99');
INSERT INTO shop_areas VALUES ('3132', '3121', '水富县', '99');
INSERT INTO shop_areas VALUES ('3133', '0', '浙江', '99');
INSERT INTO shop_areas VALUES ('3134', '3133', '杭州市', '99');
INSERT INTO shop_areas VALUES ('3135', '3134', '上城区', '99');
INSERT INTO shop_areas VALUES ('3136', '3134', '下城区', '99');
INSERT INTO shop_areas VALUES ('3137', '3134', '江干区', '99');
INSERT INTO shop_areas VALUES ('3138', '3134', '拱墅区', '99');
INSERT INTO shop_areas VALUES ('3139', '3134', '西湖区', '99');
INSERT INTO shop_areas VALUES ('3140', '3134', '滨江区', '99');
INSERT INTO shop_areas VALUES ('3141', '3134', '萧山区', '99');
INSERT INTO shop_areas VALUES ('3142', '3134', '余杭区', '99');
INSERT INTO shop_areas VALUES ('3143', '3134', '桐庐县', '99');
INSERT INTO shop_areas VALUES ('3144', '3134', '淳安县', '99');
INSERT INTO shop_areas VALUES ('3145', '3134', '建德市', '99');
INSERT INTO shop_areas VALUES ('3146', '3134', '富阳市', '99');
INSERT INTO shop_areas VALUES ('3147', '3134', '临安市', '99');
INSERT INTO shop_areas VALUES ('3148', '3133', '湖州市', '99');
INSERT INTO shop_areas VALUES ('3149', '3148', '吴兴区', '99');
INSERT INTO shop_areas VALUES ('3150', '3148', '南浔区', '99');
INSERT INTO shop_areas VALUES ('3151', '3148', '德清县', '99');
INSERT INTO shop_areas VALUES ('3152', '3148', '长兴县', '99');
INSERT INTO shop_areas VALUES ('3153', '3148', '安吉县', '99');
INSERT INTO shop_areas VALUES ('3154', '3133', '嘉兴市', '99');
INSERT INTO shop_areas VALUES ('3155', '3154', '秀城区', '99');
INSERT INTO shop_areas VALUES ('3156', '3154', '秀洲区', '99');
INSERT INTO shop_areas VALUES ('3157', '3154', '嘉善县', '99');
INSERT INTO shop_areas VALUES ('3158', '3154', '海盐县', '99');
INSERT INTO shop_areas VALUES ('3159', '3154', '海宁市', '99');
INSERT INTO shop_areas VALUES ('3160', '3154', '平湖市', '99');
INSERT INTO shop_areas VALUES ('3161', '3154', '桐乡市', '99');
INSERT INTO shop_areas VALUES ('3162', '3133', '金华市', '99');
INSERT INTO shop_areas VALUES ('3163', '3162', '婺城区', '99');
INSERT INTO shop_areas VALUES ('3164', '3162', '金东区', '99');
INSERT INTO shop_areas VALUES ('3165', '3162', '武义县', '99');
INSERT INTO shop_areas VALUES ('3166', '3162', '浦江县', '99');
INSERT INTO shop_areas VALUES ('3167', '3162', '磐安县', '99');
INSERT INTO shop_areas VALUES ('3168', '3162', '兰溪市', '99');
INSERT INTO shop_areas VALUES ('3169', '3162', '义乌市', '99');
INSERT INTO shop_areas VALUES ('3170', '3162', '东阳市', '99');
INSERT INTO shop_areas VALUES ('3171', '3162', '永康市', '99');
INSERT INTO shop_areas VALUES ('3172', '3133', '丽水市', '99');
INSERT INTO shop_areas VALUES ('3173', '3172', '莲都区', '99');
INSERT INTO shop_areas VALUES ('3174', '3172', '青田县', '99');
INSERT INTO shop_areas VALUES ('3175', '3172', '缙云县', '99');
INSERT INTO shop_areas VALUES ('3176', '3172', '遂昌县', '99');
INSERT INTO shop_areas VALUES ('3177', '3172', '松阳县', '99');
INSERT INTO shop_areas VALUES ('3178', '3172', '云和县', '99');
INSERT INTO shop_areas VALUES ('3179', '3172', '庆元县', '99');
INSERT INTO shop_areas VALUES ('3180', '3172', '景宁畲族自治县', '99');
INSERT INTO shop_areas VALUES ('3181', '3172', '龙泉市', '99');
INSERT INTO shop_areas VALUES ('3182', '3133', '宁波市', '99');
INSERT INTO shop_areas VALUES ('3183', '3182', '海曙区', '99');
INSERT INTO shop_areas VALUES ('3184', '3182', '江东区', '99');
INSERT INTO shop_areas VALUES ('3185', '3182', '江北区', '99');
INSERT INTO shop_areas VALUES ('3186', '3182', '北仑区', '99');
INSERT INTO shop_areas VALUES ('3187', '3182', '镇海区', '99');
INSERT INTO shop_areas VALUES ('3188', '3182', '鄞州区', '99');
INSERT INTO shop_areas VALUES ('3189', '3182', '象山县', '99');
INSERT INTO shop_areas VALUES ('3190', '3182', '宁海县', '99');
INSERT INTO shop_areas VALUES ('3191', '3182', '余姚市', '99');
INSERT INTO shop_areas VALUES ('3192', '3182', '慈溪市', '99');
INSERT INTO shop_areas VALUES ('3193', '3182', '奉化市', '99');
INSERT INTO shop_areas VALUES ('3194', '3133', '衢州市', '99');
INSERT INTO shop_areas VALUES ('3195', '3194', '柯城区', '99');
INSERT INTO shop_areas VALUES ('3196', '3194', '衢江区', '99');
INSERT INTO shop_areas VALUES ('3197', '3194', '常山县', '99');
INSERT INTO shop_areas VALUES ('3198', '3194', '开化县', '99');
INSERT INTO shop_areas VALUES ('3199', '3194', '龙游县', '99');
INSERT INTO shop_areas VALUES ('3200', '3194', '江山市', '99');
INSERT INTO shop_areas VALUES ('3201', '3133', '绍兴市', '99');
INSERT INTO shop_areas VALUES ('3202', '3201', '越城区', '99');
INSERT INTO shop_areas VALUES ('3203', '3201', '绍兴县', '99');
INSERT INTO shop_areas VALUES ('3204', '3201', '新昌县', '99');
INSERT INTO shop_areas VALUES ('3205', '3201', '诸暨市', '99');
INSERT INTO shop_areas VALUES ('3206', '3201', '上虞市', '99');
INSERT INTO shop_areas VALUES ('3207', '3201', '嵊州市', '99');
INSERT INTO shop_areas VALUES ('3208', '3133', '台州市', '99');
INSERT INTO shop_areas VALUES ('3209', '3208', '椒江区', '99');
INSERT INTO shop_areas VALUES ('3210', '3208', '黄岩区', '99');
INSERT INTO shop_areas VALUES ('3211', '3208', '路桥区', '99');
INSERT INTO shop_areas VALUES ('3212', '3208', '玉环县', '99');
INSERT INTO shop_areas VALUES ('3213', '3208', '三门县', '99');
INSERT INTO shop_areas VALUES ('3214', '3208', '天台县', '99');
INSERT INTO shop_areas VALUES ('3215', '3208', '仙居县', '99');
INSERT INTO shop_areas VALUES ('3216', '3208', '温岭市', '99');
INSERT INTO shop_areas VALUES ('3217', '3208', '临海市', '99');
INSERT INTO shop_areas VALUES ('3218', '3133', '温州市', '99');
INSERT INTO shop_areas VALUES ('3219', '3218', '鹿城区', '99');
INSERT INTO shop_areas VALUES ('3220', '3218', '龙湾区', '99');
INSERT INTO shop_areas VALUES ('3221', '3218', '瓯海区', '99');
INSERT INTO shop_areas VALUES ('3222', '3218', '洞头县', '99');
INSERT INTO shop_areas VALUES ('3223', '3218', '永嘉县', '99');
INSERT INTO shop_areas VALUES ('3224', '3218', '平阳县', '99');
INSERT INTO shop_areas VALUES ('3225', '3218', '苍南县', '99');
INSERT INTO shop_areas VALUES ('3226', '3218', '文成县', '99');
INSERT INTO shop_areas VALUES ('3227', '3218', '泰顺县', '99');
INSERT INTO shop_areas VALUES ('3228', '3218', '瑞安市', '99');
INSERT INTO shop_areas VALUES ('3229', '3218', '乐清市', '99');
INSERT INTO shop_areas VALUES ('3230', '3133', '舟山市', '99');
INSERT INTO shop_areas VALUES ('3231', '3230', '定海区', '99');
INSERT INTO shop_areas VALUES ('3232', '3230', '普陀区', '99');
INSERT INTO shop_areas VALUES ('3233', '3230', '岱山县', '99');
INSERT INTO shop_areas VALUES ('3234', '3230', '嵊泗县', '99');
INSERT INTO shop_areas VALUES ('3235', '0', '香港', '99');
INSERT INTO shop_areas VALUES ('3236', '3235', '九龙', '99');
INSERT INTO shop_areas VALUES ('3237', '3235', '香港岛', '99');
INSERT INTO shop_areas VALUES ('3238', '3235', '新界', '99');
INSERT INTO shop_areas VALUES ('3239', '0', '澳门', '99');
INSERT INTO shop_areas VALUES ('3240', '3239', '澳门半岛', '99');
INSERT INTO shop_areas VALUES ('3241', '3239', '离岛', '99');
INSERT INTO shop_areas VALUES ('3242', '0', '台湾', '99');
INSERT INTO shop_areas VALUES ('3243', '3242', '台北市', '99');
INSERT INTO shop_areas VALUES ('3244', '3242', '高雄市', '99');
INSERT INTO shop_areas VALUES ('3245', '3242', '高雄县', '99');
INSERT INTO shop_areas VALUES ('3246', '3242', '花莲县', '99');
INSERT INTO shop_areas VALUES ('3247', '3242', '基隆市', '99');
INSERT INTO shop_areas VALUES ('3248', '3242', '嘉义市', '99');
INSERT INTO shop_areas VALUES ('3249', '3242', '嘉义县', '99');
INSERT INTO shop_areas VALUES ('3250', '3242', '金门县', '99');
INSERT INTO shop_areas VALUES ('3251', '3242', '苗栗县', '99');
INSERT INTO shop_areas VALUES ('3252', '3242', '南投县', '99');
INSERT INTO shop_areas VALUES ('3253', '3242', '澎湖县', '99');
INSERT INTO shop_areas VALUES ('3254', '3242', '屏东县', '99');
INSERT INTO shop_areas VALUES ('3255', '3242', '台北县', '99');
INSERT INTO shop_areas VALUES ('3256', '3242', '台东县', '99');
INSERT INTO shop_areas VALUES ('3257', '3242', '台南市', '99');
INSERT INTO shop_areas VALUES ('3258', '3242', '台南县', '99');
INSERT INTO shop_areas VALUES ('3259', '3242', '台中市', '99');
INSERT INTO shop_areas VALUES ('3260', '3242', '台中县', '99');
INSERT INTO shop_areas VALUES ('3261', '3242', '桃园县', '99');
INSERT INTO shop_areas VALUES ('3262', '3242', '新竹市', '99');
INSERT INTO shop_areas VALUES ('3263', '3242', '新竹县', '99');
INSERT INTO shop_areas VALUES ('3264', '3242', '宜兰县', '99');
INSERT INTO shop_areas VALUES ('3265', '3242', '云林县', '99');
INSERT INTO shop_areas VALUES ('3266', '3242', '彰化县', '99');

-- ----------------------------
-- Table structure for `shop_article`
-- ----------------------------
DROP TABLE IF EXISTS `shop_article`;
CREATE TABLE `shop_article` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(250) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `category_id` int(11) NOT NULL COMMENT '分类ID',
  `create_time` datetime default NULL COMMENT '发布时间',
  `keywords` varchar(255) default NULL COMMENT '关键词',
  `description` varchar(255) default NULL COMMENT '描述',
  `visiblity` tinyint(1) default NULL COMMENT '是否显示 0:不显示,1:显示',
  `top` tinyint(1) default NULL COMMENT '置顶',
  `sort` int(11) default '0' COMMENT '排序',
  `style` tinyint(1) default '0' COMMENT '标题字体 0正常 1粗体,2斜体',
  `color` varchar(7) default NULL COMMENT '标题颜色',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of shop_article
-- ----------------------------
INSERT INTO shop_article VALUES ('23', 'IwebShop 新版发布', '<div class=\"mc\"><p>尊敬的网友：<br />\r\n    IwebShop 新版在大家的期盼中终于发布了！</p>\r\n<p>    新版与旧版可是大相径庭哦！</p>\r\n<p>    欢迎大家到体验站体验啊。</p>\r\n<p>    </p>\r\n<br /><p>    </p>\r\n</div>', '1', '2011-05-27 14:11:06', '', '', '1', '1', '99', '0', '#000000');
INSERT INTO shop_article VALUES ('24', 'Q币热卖', '<div class=\"notice-content mt30 mb30 fs14\">\r\n                <p>亲爱的用户，您好</p>\r\n <p>应大家的热烈要求，聚义商店新开Q点、Q币销售。</p>\r\n            </div>', '1', '2011-05-27 14:14:43', '', '', '1', '1', '99', '0', '#000000');
INSERT INTO shop_article VALUES ('25', '新车促销', '2011款奔腾B70于5月18日正式上市，2011款奔腾B70实现外观、内饰、配置全面升级，在上海车展中发布的D-Partner车载智能系统也在2011款奔腾B70上首次呈现，此款车售价区间在13.18-18.88万。', '1', '2011-05-27 14:18:14', '', '', '1', '1', '99', '0', '#000000');
INSERT INTO shop_article VALUES ('26', '支付宝快钱等27家公司获首批支付牌照', '5月26日下午消息，中国人民银行刚刚在官方网站上公布，支付宝、快钱等27家公司获得了央行5月18日签发的首批第三方支付牌照。<p>央行之前公示的32家企业中，上海银联电子支付服务有限公司、上海畅购企业服务有限公司、上海富友网络金融有限公司、上海得仕企业服务有限公司、联动优势电子商务有限公司等5家企业没有获得这批的支付牌照，原因不详。</p>\r\n在这27家第三方支付企业中，既有国家队的银联商务等公司，也有民营队的支付宝、快钱、财付通等公司。', '1', '2011-05-27 14:20:17', '', '', '1', '1', '99', '0', '#000000');
INSERT INTO shop_article VALUES ('27', '第三方支付牌照首发 13家获批经营预付卡', '<p>今年9月1日大限之前，国内约300家无照第三方支付机构面临整合。</p>\r\n<p>延宕近半年的第三方支付首批牌照昨日（5月26日）终于揭晓。</p>\r\n<p>昨日下午17点左右，《每日经济新闻》记者在央行官方网站发现，在“非金融机构支付业务许可”一栏下面，出现了一份“已获许可机构（支付机构）”名单。随即，支付宝、银联商务、财付通、易宝支付、快钱、拉卡拉等第三方支付机构纷纷向记者确认：“我们拿到牌照了。”</p>\r\n<p>截至2010年年底，国内从事第三方支付业务的机构已达到300多家。业内人士指出，在今年9月1日“大限”前，多数“无证驾驶”机构面临兼并整合。</p>', '1', '2011-06-02 16:14:22', '', '', '1', '1', '99', '0', '#000000');

-- ----------------------------
-- Table structure for `shop_article_category`
-- ----------------------------
DROP TABLE IF EXISTS `shop_article_category`;
CREATE TABLE `shop_article_category` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `parent_id` int(11) NOT NULL default '0' COMMENT '父分类',
  `issys` tinyint(1) default NULL COMMENT '系统分类',
  `sort` int(11) default NULL COMMENT '排序',
  `path` varchar(255) default NULL COMMENT '路径',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章分类';

-- ----------------------------
-- Records of shop_article_category
-- ----------------------------
INSERT INTO shop_article_category VALUES ('1', '促销活动', '0', '0', '99', ',1,');

-- ----------------------------
-- Table structure for `shop_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `shop_attribute`;
CREATE TABLE `shop_attribute` (
  `id` int(11) NOT NULL auto_increment COMMENT '属性ID',
  `model_id` int(4) default NULL COMMENT '模型ID',
  `type` tinyint(1) default NULL COMMENT '输入控件的类型,单选,复选等',
  `name` varchar(50) default NULL COMMENT '名称',
  `value` text COMMENT '属性值',
  `search` tinyint(1) default '0' COMMENT '是否支持搜索0不支持1支持',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COMMENT='属性表';

-- ----------------------------
-- Records of shop_attribute
-- ----------------------------
INSERT INTO shop_attribute VALUES ('10', '47', '0', '尺寸', '14寸,15寸,16寸,', '1');
INSERT INTO shop_attribute VALUES ('11', '47', '0', '颜色', '红色,蓝色,黑色', '1');
INSERT INTO shop_attribute VALUES ('211', '183', '1', '照明面积', '1-3平米,3-8平米,8-15平米,15-25平米,25-40平米,40平米以上', '0');
INSERT INTO shop_attribute VALUES ('78', '119', '2', 'v4100', '555', '1');
INSERT INTO shop_attribute VALUES ('77', '119', '2', 'v3000', '321', '1');
INSERT INTO shop_attribute VALUES ('59', '93', '2', '外壳', '金属,塑料', '1');
INSERT INTO shop_attribute VALUES ('60', '93', '3', '操作系统', 'IPone,andriod,无操作系统', '1');
INSERT INTO shop_attribute VALUES ('61', '93', '4', '屏幕', '大,中,小', '1');
INSERT INTO shop_attribute VALUES ('152', '156', '1', '摄像头', '有,无', '1');
INSERT INTO shop_attribute VALUES ('151', '156', '1', '操作系统', 'WindowsXP,Windows7,MacOS,Linux', '1');
INSERT INTO shop_attribute VALUES ('210', '183', '1', '高度', '40cm以下,40-60cm,60-90cm,90-120cm,120cm以上', '0');
INSERT INTO shop_attribute VALUES ('95', '99', '3', '显示器', '大型,小型,', '1');
INSERT INTO shop_attribute VALUES ('97', '147', '1', '袖长', '长袖,短袖,无袖', '1');
INSERT INTO shop_attribute VALUES ('98', '147', '2', '季节', '春,夏,秋,冬', '0');
INSERT INTO shop_attribute VALUES ('99', '147', '1', '材质', '纯棉,涤纶,混合', '1');
INSERT INTO shop_attribute VALUES ('212', '184', '1', '歌手类型', '华语男歌手,华语女歌手,外语男歌手,外语女歌手,童星', '1');
INSERT INTO shop_attribute VALUES ('101', '148', '1', '款式', '修身,直筒,宽松', '1');
INSERT INTO shop_attribute VALUES ('102', '148', '1', '裤腰', '高,中,低', '0');
INSERT INTO shop_attribute VALUES ('103', '148', '1', '裤长', '五分,七分,普通', '1');
INSERT INTO shop_attribute VALUES ('105', '148', '1', '面料', '纯棉,涤纶,混合', '1');
INSERT INTO shop_attribute VALUES ('153', '156', '1', '硬盘', '160G以下,250G,320G,400G以上', '1');
INSERT INTO shop_attribute VALUES ('110', '151', '1', '材质', '真丝,纯棉,雪纺,亚麻,其它', '1');
INSERT INTO shop_attribute VALUES ('111', '151', '1', '细节', '蕾丝花边,印花,荷叶边,绣花', '1');
INSERT INTO shop_attribute VALUES ('112', '151', '1', '腰型', '高腰,中腰,', '1');
INSERT INTO shop_attribute VALUES ('113', '151', '1', '袖长', '短袖,吊带裙,无袖/背心裙,中袖/七分袖,长袖', '1');
INSERT INTO shop_attribute VALUES ('114', '151', '1', '裙长', '常规,中长（及膝）,长裙,短裙', '1');
INSERT INTO shop_attribute VALUES ('115', '151', '1', '图案', '格子,纯色,花色,圆点,形状,其他图案,碎花,条纹', '1');
INSERT INTO shop_attribute VALUES ('116', '151', '1', '季节', '春季,夏季,秋季', '1');
INSERT INTO shop_attribute VALUES ('117', '151', '1', '风格', '韩版,淑女,欧美,瑞丽,休闲,OL通勤', '1');
INSERT INTO shop_attribute VALUES ('118', '151', '1', '领型', '翻领,圆领,V领,一字领,方领', '1');
INSERT INTO shop_attribute VALUES ('119', '152', '1', '风格', '牛仔,休闲,商务', '1');
INSERT INTO shop_attribute VALUES ('120', '152', '1', '裤型', '直筒,修身,宽松,锥形,紧身,低档跨,喇叭裤,工装裤,背带裤,连体裤', '1');
INSERT INTO shop_attribute VALUES ('121', '152', '1', '腰型', '低腰,中腰,高腰', '1');
INSERT INTO shop_attribute VALUES ('122', '152', '1', '面料', '纯棉,腈纶,混合', '1');
INSERT INTO shop_attribute VALUES ('123', '152', '1', '工艺设计', '水洗,免烫处理,做旧,破洞,绣花,印花', '1');
INSERT INTO shop_attribute VALUES ('124', '152', '1', '设计元素', '多口袋,微章,卡通画,撞色,金属装饰', '1');
INSERT INTO shop_attribute VALUES ('125', '152', '1', '裤长', '正常,七分,五分,超短', '1');
INSERT INTO shop_attribute VALUES ('126', '154', '2', '网络', 'GSM,CDMA,WCDMA,CDMA2000,TD-SCDMA,双模', '1');
INSERT INTO shop_attribute VALUES ('127', '154', '1', '外观', '直板,滑盖,翻盖,旋盖', '1');
INSERT INTO shop_attribute VALUES ('128', '154', '1', '操作', '标准键盘,全键盘,触屏', '1');
INSERT INTO shop_attribute VALUES ('129', '154', '1', '系统', 'Android,IOS,Symbian,其他智能系统,非智能手机', '0');
INSERT INTO shop_attribute VALUES ('130', '154', '4', '上市时间', '2010', '0');
INSERT INTO shop_attribute VALUES ('131', '154', '1', '视频通话', '支持,不支持', '0');
INSERT INTO shop_attribute VALUES ('132', '154', '1', '屏幕尺寸', '2.0英寸以下,2.1-2.5英寸,2.6-3.0英寸,3.1-3.5英寸,3.6-4.0英寸,4.0英寸以上', '1');
INSERT INTO shop_attribute VALUES ('133', '154', '1', '屏幕色彩', '65536色,26万色,1670万色', '1');
INSERT INTO shop_attribute VALUES ('134', '154', '1', '触摸屏', '电容屏,电阻屏,不支持', '0');
INSERT INTO shop_attribute VALUES ('135', '154', '1', '音乐播放', '支持,不支持', '0');
INSERT INTO shop_attribute VALUES ('136', '154', '1', '视频播放', '支持,不支持', '0');
INSERT INTO shop_attribute VALUES ('137', '154', '1', '摄像头', '130万以下,130-200万,200-300万,300-500万,500万以上,不支持', '1');
INSERT INTO shop_attribute VALUES ('138', '154', '1', '变焦模式', '光学变焦,数码变焦', '0');
INSERT INTO shop_attribute VALUES ('139', '154', '1', 'GPS', '支持,不支持', '0');
INSERT INTO shop_attribute VALUES ('140', '154', '1', 'Wi-Fi', '支持,不支持', '0');
INSERT INTO shop_attribute VALUES ('141', '155', '1', '像素', '1000万以下,1000-1199万,1200-1399万,1400-1599万,1600万以上', '1');
INSERT INTO shop_attribute VALUES ('142', '155', '1', '变焦', '0-4倍,4-5倍,5-10倍,10-18倍,18倍以上,单反镜头', '1');
INSERT INTO shop_attribute VALUES ('143', '155', '1', '屏幕', '2.5英寸,2.7英寸,2.8英寸,3.0英寸,3.5英寸', '1');
INSERT INTO shop_attribute VALUES ('144', '155', '1', '防抖功能', '光学防抖,电子防抖,无防抖', '1');
INSERT INTO shop_attribute VALUES ('145', '155', '1', '电池类型', '锂电池,AA电池', '1');
INSERT INTO shop_attribute VALUES ('146', '156', '1', 'CPU', 'Intel,AMD,其他', '1');
INSERT INTO shop_attribute VALUES ('147', '156', '1', '内存', '1G,2G,4G', '1');
INSERT INTO shop_attribute VALUES ('150', '156', '1', '屏幕尺寸', '10英寸以下,11英寸,12英寸,13英寸,14英寸,15英寸,16英寸,17英寸以上', '1');
INSERT INTO shop_attribute VALUES ('176', '168', '1', '产地', '法国,日本,英国,中国', '1');
INSERT INTO shop_attribute VALUES ('193', '180', '1', '领型', '圆领,V领,高领,方领,一字领', '1');
INSERT INTO shop_attribute VALUES ('192', '180', '1', '袖长', '长袖,七分袖,中袖,短袖', '1');
INSERT INTO shop_attribute VALUES ('182', '169', '1', '领型', '圆领,V领,连帽,翻领', '1');
INSERT INTO shop_attribute VALUES ('189', '169', '1', '袖长', '长袖,短袖,无袖', '1');
INSERT INTO shop_attribute VALUES ('184', '175', '1', '产地', '法国,美国', '0');
INSERT INTO shop_attribute VALUES ('190', '169', '1', '面料', '纯棉,涤棉,混纺,涤纶,莫代尔,其他', '1');
INSERT INTO shop_attribute VALUES ('177', '168', '1', '肤质', '干性,中性,油性,混合性,敏感性,所以类型', '1');
INSERT INTO shop_attribute VALUES ('178', '168', '1', '适合年龄', '18岁以下,18岁以上,25岁以上,40岁以上', '1');
INSERT INTO shop_attribute VALUES ('179', '168', '1', '质地', '霜状,乳液状', '1');
INSERT INTO shop_attribute VALUES ('191', '169', '1', '图案', '纯色,横条,竖条, 撞色,图形,其他', '1');
INSERT INTO shop_attribute VALUES ('180', '168', '1', '功效', '补水,美白,抗皱,防晒', '1');
INSERT INTO shop_attribute VALUES ('181', '168', '1', '使用', '日霜,夜间', '0');
INSERT INTO shop_attribute VALUES ('194', '180', '1', '面料', '雪纺,真丝,纯棉,亚麻,其它', '1');
INSERT INTO shop_attribute VALUES ('195', '180', '1', '图案', '格子,条纹,碎花,纯色', '1');
INSERT INTO shop_attribute VALUES ('196', '180', '1', '细节', '荷叶边,绣花,蕾丝花边', '1');
INSERT INTO shop_attribute VALUES ('197', '180', '1', '风格', '职业,休闲,淑女,韩版,欧美', '1');
INSERT INTO shop_attribute VALUES ('198', '180', '1', '衣长', '短款,常规,中长款,长款', '1');
INSERT INTO shop_attribute VALUES ('199', '181', '1', '袖长', '长袖,短袖', '1');
INSERT INTO shop_attribute VALUES ('200', '181', '1', '领型', '大尖领,小尖领,八字领,口领尖领,方领,燕子岭', '1');
INSERT INTO shop_attribute VALUES ('201', '181', '1', '面料', '纯棉,涤棉,混纺,涤纶,亚麻,真丝,莫代尔', '1');
INSERT INTO shop_attribute VALUES ('202', '181', '1', '板型', '直筒型,收腰型,宽松型,修身型', '1');
INSERT INTO shop_attribute VALUES ('203', '181', '1', '图案', '纯色,方格,条纹,其他', '1');
INSERT INTO shop_attribute VALUES ('204', '182', '1', '装帧', '平装,精装,限量,', '1');
INSERT INTO shop_attribute VALUES ('205', '183', '1', '风格', '欧式,中式,现代,简约,田园', '0');
INSERT INTO shop_attribute VALUES ('206', '183', '1', '材质', '树脂,铁艺,水晶,电镀', '0');
INSERT INTO shop_attribute VALUES ('207', '183', '1', '用途', '壁灯,廊灯,卧房灯,客厅灯', '0');
INSERT INTO shop_attribute VALUES ('209', '183', '1', '颜色', '金黄,纯白,古铜,透明,淡黄,雅黑,其它', '0');
INSERT INTO shop_attribute VALUES ('213', '184', '1', '音乐类型', '流行乐,古典乐,民族乐,童谣', '1');
INSERT INTO shop_attribute VALUES ('214', '184', '1', '音乐介质', 'CD,黑胶,卡带,MP3', '1');
INSERT INTO shop_attribute VALUES ('215', '185', '1', '地区', '大陆,香港,美国,欧洲,日韩', '1');
INSERT INTO shop_attribute VALUES ('216', '185', '1', '字幕', '中文,英文,中英双语,其他', '1');
INSERT INTO shop_attribute VALUES ('217', '185', '4', '碟片数', '1,2,3,4,5张以上', '1');
INSERT INTO shop_attribute VALUES ('218', '185', '1', '配音类型', '中文,外文', '1');
INSERT INTO shop_attribute VALUES ('219', '185', '1', '介质', 'DVD,VCD', '1');
INSERT INTO shop_attribute VALUES ('220', '186', '1', '功率', '22,32,40,55,110', '1');
INSERT INTO shop_attribute VALUES ('221', '186', '1', '材质', '丙烯树脂,亚克力', '1');
INSERT INTO shop_attribute VALUES ('222', '186', '1', '形状', '圆形,方形,长方形', '1');
INSERT INTO shop_attribute VALUES ('223', '186', '1', '颜色', '白边,黑边', '1');
INSERT INTO shop_attribute VALUES ('224', '187', '1', '风格', '现代简约,地中海浪漫,华丽欧式,温馨田园', '1');
INSERT INTO shop_attribute VALUES ('225', '187', '1', '功能', '装饰+全遮光,装饰+半遮光,遮光,透光', '1');
INSERT INTO shop_attribute VALUES ('226', '187', '1', '样式', '卷帘,垂帘,折帘', '1');
INSERT INTO shop_attribute VALUES ('227', '187', '1', '花色', '纯色,碎花,风景图案,其他', '1');
INSERT INTO shop_attribute VALUES ('228', '187', '1', '面料', '真丝,纱,麻', '1');
INSERT INTO shop_attribute VALUES ('229', '187', '1', '高度', '1.5米,1.8米,2.3米,2.5米,2.7米,3米', '1');

-- ----------------------------
-- Table structure for `shop_brand`
-- ----------------------------
DROP TABLE IF EXISTS `shop_brand`;
CREATE TABLE `shop_brand` (
  `id` int(11) NOT NULL auto_increment COMMENT '品牌ID',
  `name` varchar(255) NOT NULL COMMENT '品牌名称',
  `logo` varchar(255) default NULL COMMENT 'logo地址',
  `url` varchar(255) default NULL COMMENT '网址',
  `description` varchar(255) default NULL COMMENT '描述',
  `sort` int(4) default NULL COMMENT '排序',
  `category_ids` varchar(255) default NULL COMMENT '品牌分类分类,逗号分割id ',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- ----------------------------
-- Records of shop_brand
-- ----------------------------
INSERT INTO shop_brand VALUES ('58', 'nike/耐克', 'upload/2011/05/27/20110527060805417.jpg', 'http://www.nike.com', null, '0', '10');
INSERT INTO shop_brand VALUES ('59', 'kappa/背靠背', 'upload/2011/05/27/20110527052144997.gif', '', null, '0', '10');
INSERT INTO shop_brand VALUES ('18', 'Lee', 'upload/2011/05/27/20110527061014658.png', '', '', '0', '10');
INSERT INTO shop_brand VALUES ('19', 'ONLY', 'upload/2011/05/27/20110527061026509.png', '', '', '0', '10');
INSERT INTO shop_brand VALUES ('20', 'JackJones', 'upload/2011/05/27/20110527061035437.jpg', '', '', '0', '10');
INSERT INTO shop_brand VALUES ('21', '李维斯', 'upload/2011/05/27/20110527061045466.png', '', '', '0', '10');
INSERT INTO shop_brand VALUES ('57', 'adidas阿迪达斯', 'upload/2011/05/27/20110527061100113.jpg', '', null, '0', '10');
INSERT INTO shop_brand VALUES ('24', '苹果', 'upload/2011/05/27/20110527061132221.jpg', '', '', '0', '13');
INSERT INTO shop_brand VALUES ('26', '摩托罗拉', 'upload/2011/05/27/20110527061142668.jpg', '', '', '0', '13');
INSERT INTO shop_brand VALUES ('27', '诺基亚', 'upload/2011/05/27/20110527052222754.jpg', '', '', '0', '13');
INSERT INTO shop_brand VALUES ('28', 'Kingston', 'upload/2011/05/27/20110527061151515.jpg', '', '', '0', '13');
INSERT INTO shop_brand VALUES ('29', '佳能', 'upload/2011/05/27/20110527052233833.gif', '', '', '0', '14');
INSERT INTO shop_brand VALUES ('30', '尼康', 'upload/2011/05/27/20110527052241674.jpg', '', '', '0', '14');
INSERT INTO shop_brand VALUES ('31', '索尼', 'upload/2011/05/27/20110527052251586.jpg', '', '', '0', '14,12');
INSERT INTO shop_brand VALUES ('32', '联想', 'upload/2011/05/27/20110527052300550.gif', '', '', '0', '12');
INSERT INTO shop_brand VALUES ('34', 'Biotherm碧欧泉', 'upload/2011/05/27/20110527061204787.jpg', '', '', '0', '16');
INSERT INTO shop_brand VALUES ('35', 'clinique倩碧', 'upload/2011/05/27/20110527061219873.png', '', '', '0', '16');
INSERT INTO shop_brand VALUES ('37', 'Lancome兰蔻', 'upload/2011/05/27/20110527061239551.png', '', '', '0', '16');
INSERT INTO shop_brand VALUES ('38', '梦特娇', 'upload/2011/05/27/20110527061254646.jpg', '', '', '0', '10');
INSERT INTO shop_brand VALUES ('39', 'channel夏奈尔', 'upload/2011/05/27/20110527062301496.png', '', '', '0', '16');
INSERT INTO shop_brand VALUES ('40', 'HR赫莲娜', 'upload/2011/05/27/20110527061920462.jpg', '', '', '0', '3');
INSERT INTO shop_brand VALUES ('41', 'Loccitane欧舒丹', 'upload/2011/05/27/20110527062115705.jpg', '', '', '0', '16');
INSERT INTO shop_brand VALUES ('42', 'The body shop美体小铺', 'upload/2011/05/27/20110527062133245.jpg', '', '', '0', '16');
INSERT INTO shop_brand VALUES ('43', 'Clarins娇韵诗', 'upload/2011/05/27/20110527062155651.png', '', '', '0', '16');
INSERT INTO shop_brand VALUES ('44', 'Dior迪奥', 'upload/2011/05/27/20110527062216715.png', '', '', '0', '16');
INSERT INTO shop_brand VALUES ('45', 'Chanel/香奈儿', 'upload/2011/05/27/20110527062451305.png', '', '', '0', '16');
INSERT INTO shop_brand VALUES ('46', '七匹狼', 'upload/2011/05/27/20110527061318374.png', '', '', '0', '10');
INSERT INTO shop_brand VALUES ('49', '百得诗特', 'upload/2011/05/27/20110527061400697.png', '', '', '0', '3');
INSERT INTO shop_brand VALUES ('50', 'Panasonic', 'upload/2011/05/27/20110527062411809.jpg', '', '', '0', '3');

-- ----------------------------
-- Table structure for `shop_brand_category`
-- ----------------------------
DROP TABLE IF EXISTS `shop_brand_category`;
CREATE TABLE `shop_brand_category` (
  `id` int(11) NOT NULL auto_increment COMMENT '分类ID',
  `name` varchar(255) default NULL COMMENT '分类名称',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='品牌分类表';

-- ----------------------------
-- Records of shop_brand_category
-- ----------------------------
INSERT INTO shop_brand_category VALUES ('3', '家具、厨具、家装');
INSERT INTO shop_brand_category VALUES ('10', '服饰');
INSERT INTO shop_brand_category VALUES ('14', '相机');
INSERT INTO shop_brand_category VALUES ('12', '电脑');
INSERT INTO shop_brand_category VALUES ('13', '手机');
INSERT INTO shop_brand_category VALUES ('16', '化妆品');

-- ----------------------------
-- Table structure for `shop_category`
-- ----------------------------
DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE `shop_category` (
  `id` int(11) NOT NULL auto_increment COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `parent_id` int(11) default NULL COMMENT '父分类ID',
  `sort` int(11) default '50' COMMENT '排序',
  `visibility` tinyint(1) default '1' COMMENT '首页是否显示 1显示 0 不显示',
  `model_id` int(11) default NULL COMMENT '默认模型ID',
  `keywords` varchar(255) default NULL COMMENT 'SEO 关键词',
  `descript` varchar(255) default NULL COMMENT 'SEO 描述',
  `title` varchar(255) default NULL COMMENT 'SEO 标题 title',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='产品分类表';

-- ----------------------------
-- Records of shop_category
-- ----------------------------
INSERT INTO shop_category VALUES ('2', '电脑整机', '1', '100', '1', '99', '', '', '');
INSERT INTO shop_category VALUES ('3', '笔记本', '2', '3', '1', '115', '', '', '');
INSERT INTO shop_category VALUES ('4', '台式机', '2', '1', '1', '99', '', '', '');
INSERT INTO shop_category VALUES ('88', '平板电脑', '70', '0', '1', '156', '', '', '');
INSERT INTO shop_category VALUES ('6', 'CPU', '10', '8', '1', '131', '', '', '');
INSERT INTO shop_category VALUES ('7', '主板', '6', '2', '1', '99', '', '', '');
INSERT INTO shop_category VALUES ('8', '服务器', '3', '4', '1', '99', '', '', '');
INSERT INTO shop_category VALUES ('9', '内存123', '3', '1', '1', '93', '内存', '', '');
INSERT INTO shop_category VALUES ('93', '沐浴', '77', '0', '1', '168', '', '', '');
INSERT INTO shop_category VALUES ('22', '专用测试分类', '9', '0', '1', '120', '', '', '');
INSERT INTO shop_category VALUES ('89', '洁肤类', '76', '0', '1', '160', '', '', '');
INSERT INTO shop_category VALUES ('58', '男装', '57', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('101', '吊灯、花灯', '75', '0', '1', '183', '', '', '');
INSERT INTO shop_category VALUES ('94', '纤体', '77', '0', '1', '168', '', '', '');
INSERT INTO shop_category VALUES ('100', '音乐', '79', '0', '1', '184', '', '', '');
INSERT INTO shop_category VALUES ('91', '面膜', '76', '0', '1', '168', '', '', '');
INSERT INTO shop_category VALUES ('92', '润肤霜（身体）', '77', '0', '1', '168', '', '', '');
INSERT INTO shop_category VALUES ('57', '服饰鞋帽', '0', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('87', '笔记本', '70', '0', '1', '156', '', '', '');
INSERT INTO shop_category VALUES ('48', '童装', '36', '100', '1', '146', '', '', '');
INSERT INTO shop_category VALUES ('38', 'T恤', '45', '0', '1', '147', '', '', '');
INSERT INTO shop_category VALUES ('39', '卫衣', '45', '0', '1', '147', '', '', '');
INSERT INTO shop_category VALUES ('40', '衬衣', '45', '0', '1', '147', '', '', '');
INSERT INTO shop_category VALUES ('46', '女装', '36', '1', '1', '146', '', '', '');
INSERT INTO shop_category VALUES ('47', '运动装', '36', '2', '1', '146', '', '', '');
INSERT INTO shop_category VALUES ('43', '牛仔裤', '45', '0', '1', '148', '', '', '');
INSERT INTO shop_category VALUES ('44', '休闲裤', '45', '0', '1', '148', '', '', '');
INSERT INTO shop_category VALUES ('45', '男装', '36', '0', '1', '146', '', '', '');
INSERT INTO shop_category VALUES ('49', 'T恤', '46', '0', '1', '147', '', '', '');
INSERT INTO shop_category VALUES ('50', '连衣裙', '46', '0', '1', '151', '', '', '');
INSERT INTO shop_category VALUES ('51', '衬衣', '46', '0', '1', '147', '', '', '');
INSERT INTO shop_category VALUES ('52', '牛仔裤', '46', '0', '1', '148', '', '', '');
INSERT INTO shop_category VALUES ('53', '休闲裤', '46', '0', '1', '148', '', '', '');
INSERT INTO shop_category VALUES ('54', '运动服', '47', '0', '1', '147', '', '', '');
INSERT INTO shop_category VALUES ('55', '运动裤', '47', '0', '1', '148', '', '', '');
INSERT INTO shop_category VALUES ('90', '护肤', '76', '0', '1', '168', '', '', '');
INSERT INTO shop_category VALUES ('59', '女装', '57', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('60', '衬衫', '58', '0', '1', '181', '', '', '');
INSERT INTO shop_category VALUES ('61', 'T恤', '58', '0', '1', '169', '', '', '');
INSERT INTO shop_category VALUES ('97', '衬衫', '59', '0', '1', '180', '', '', '');
INSERT INTO shop_category VALUES ('63', '裤子', '58', '0', '1', '152', '', '', '');
INSERT INTO shop_category VALUES ('64', '运动装', '57', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('81', '连衣裙', '59', '0', '1', '151', '', '', '');
INSERT INTO shop_category VALUES ('66', '电脑、手机、数码', '0', '2', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('67', '化妆品', '0', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('68', '家居、家装', '0', '1', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('69', '图书、音像', '0', '12', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('70', '电脑', '66', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('71', '手机', '66', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('72', '相机', '66', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('73', '厨房用具', '68', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('74', '家纺', '68', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('75', '灯具', '68', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('76', '面部护理', '67', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('77', '身体护理', '67', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('78', '香水SPA', '67', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('79', '音像', '69', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('98', '图书', '69', '0', '1', '182', '', '', '');
INSERT INTO shop_category VALUES ('82', '手机', '71', '0', '1', '154', '', '', '');
INSERT INTO shop_category VALUES ('83', '手机配件', '71', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('84', '手机卡', '71', '0', '1', '153', '', '', '');
INSERT INTO shop_category VALUES ('85', '卡片相机', '72', '0', '1', '155', '', '', '');
INSERT INTO shop_category VALUES ('86', '单反相机', '72', '0', '1', '155', '', '', '');
INSERT INTO shop_category VALUES ('99', '吸顶灯', '75', '0', '1', '183', '', '', '');
INSERT INTO shop_category VALUES ('102', '电影', '79', '0', '1', '185', '', '', '');
INSERT INTO shop_category VALUES ('103', '电视剧', '79', '0', '1', '185', '', '', '');
INSERT INTO shop_category VALUES ('104', '窗帘', '74', '0', '1', '187', '', '', '');

-- ----------------------------
-- Table structure for `shop_category_extend`
-- ----------------------------
DROP TABLE IF EXISTS `shop_category_extend`;
CREATE TABLE `shop_category_extend` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `category_id` int(11) NOT NULL COMMENT '商品分类ID',
  PRIMARY KEY  (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='商品扩展分类表';

-- ----------------------------
-- Records of shop_category_extend
-- ----------------------------
INSERT INTO shop_category_extend VALUES ('1', '94', '88');
INSERT INTO shop_category_extend VALUES ('2', '95', '87');
INSERT INTO shop_category_extend VALUES ('3', '133', '103');
INSERT INTO shop_category_extend VALUES ('4', '93', '87');
INSERT INTO shop_category_extend VALUES ('5', '126', '100');
INSERT INTO shop_category_extend VALUES ('6', '127', '101');
INSERT INTO shop_category_extend VALUES ('7', '128', '102');
INSERT INTO shop_category_extend VALUES ('8', '129', '102');
INSERT INTO shop_category_extend VALUES ('9', '130', '102');
INSERT INTO shop_category_extend VALUES ('10', '131', '99');
INSERT INTO shop_category_extend VALUES ('11', '132', '102');
INSERT INTO shop_category_extend VALUES ('12', '99', '81');
INSERT INTO shop_category_extend VALUES ('13', '77', '82');
INSERT INTO shop_category_extend VALUES ('14', '79', '82');
INSERT INTO shop_category_extend VALUES ('15', '100', '90');
INSERT INTO shop_category_extend VALUES ('16', '82', '82');
INSERT INTO shop_category_extend VALUES ('17', '101', '90');
INSERT INTO shop_category_extend VALUES ('18', '134', '103');
INSERT INTO shop_category_extend VALUES ('19', '97', '89');
INSERT INTO shop_category_extend VALUES ('20', '98', '89');
INSERT INTO shop_category_extend VALUES ('21', '87', '83');
INSERT INTO shop_category_extend VALUES ('22', '125', '100');
INSERT INTO shop_category_extend VALUES ('23', '88', '85');
INSERT INTO shop_category_extend VALUES ('24', '89', '85');
INSERT INTO shop_category_extend VALUES ('25', '90', '86');
INSERT INTO shop_category_extend VALUES ('26', '91', '86');
INSERT INTO shop_category_extend VALUES ('27', '102', '91');
INSERT INTO shop_category_extend VALUES ('28', '103', '81');
INSERT INTO shop_category_extend VALUES ('29', '104', '92');
INSERT INTO shop_category_extend VALUES ('30', '105', '93');
INSERT INTO shop_category_extend VALUES ('31', '106', '63');
INSERT INTO shop_category_extend VALUES ('32', '107', '94');
INSERT INTO shop_category_extend VALUES ('33', '108', '63');
INSERT INTO shop_category_extend VALUES ('34', '109', '81');
INSERT INTO shop_category_extend VALUES ('35', '110', '78');
INSERT INTO shop_category_extend VALUES ('36', '111', '81');
INSERT INTO shop_category_extend VALUES ('37', '112', '78');
INSERT INTO shop_category_extend VALUES ('38', '113', '61');
INSERT INTO shop_category_extend VALUES ('39', '114', '78');
INSERT INTO shop_category_extend VALUES ('40', '115', '61');
INSERT INTO shop_category_extend VALUES ('41', '116', '97');
INSERT INTO shop_category_extend VALUES ('42', '117', '98');
INSERT INTO shop_category_extend VALUES ('43', '118', '97');
INSERT INTO shop_category_extend VALUES ('44', '119', '60');
INSERT INTO shop_category_extend VALUES ('45', '120', '98');
INSERT INTO shop_category_extend VALUES ('46', '121', '60');
INSERT INTO shop_category_extend VALUES ('47', '122', '98');
INSERT INTO shop_category_extend VALUES ('48', '123', '101');
INSERT INTO shop_category_extend VALUES ('49', '124', '100');
INSERT INTO shop_category_extend VALUES ('50', '135', '104');
INSERT INTO shop_category_extend VALUES ('51', '136', '64');
INSERT INTO shop_category_extend VALUES ('52', '137', '104');
INSERT INTO shop_category_extend VALUES ('53', '138', '64');
INSERT INTO shop_category_extend VALUES ('54', '139', '73');
INSERT INTO shop_category_extend VALUES ('55', '140', '104');
INSERT INTO shop_category_extend VALUES ('56', '141', '64');
INSERT INTO shop_category_extend VALUES ('57', '142', '73');
INSERT INTO shop_category_extend VALUES ('58', '143', '73');
INSERT INTO shop_category_extend VALUES ('59', '144', '73');
INSERT INTO shop_category_extend VALUES ('60', '85', '82');

-- ----------------------------
-- Table structure for `shop_collection_doc`
-- ----------------------------
DROP TABLE IF EXISTS `shop_collection_doc`;
CREATE TABLE `shop_collection_doc` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL COMMENT '订单号',
  `user_id` int(11) default NULL COMMENT '付款人',
  `amount` float(10,2) NOT NULL default '0.00' COMMENT '金额',
  `time` datetime default NULL COMMENT '时间',
  `payment_id` int(11) default NULL COMMENT '银行、支付宝等',
  `admin_id` int(11) default NULL COMMENT '管理员id',
  `collection_account` varchar(255) default NULL COMMENT '收款账户',
  `recharge_id` int(11) default '0' COMMENT '充值ID',
  `pay_status` tinyint(1) default NULL COMMENT '支付状态，0为准备，1为支付成功',
  `note` text COMMENT '收款备注',
  `if_del` tinyint(3) default NULL COMMENT '1为删除',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收款单';

-- ----------------------------
-- Records of shop_collection_doc
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_commend_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_commend_goods`;
CREATE TABLE `shop_commend_goods` (
  `id` int(11) NOT NULL auto_increment,
  `commend_id` int(11) NOT NULL COMMENT '推荐类型ID 1:最新商品 2:特价商品 3:热卖排行 4:推荐商品',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  PRIMARY KEY  (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=940 DEFAULT CHARSET=utf8 COMMENT='推荐类商品';

-- ----------------------------
-- Records of shop_commend_goods
-- ----------------------------
INSERT INTO shop_commend_goods VALUES ('886', '3', '95');
INSERT INTO shop_commend_goods VALUES ('878', '1', '102');
INSERT INTO shop_commend_goods VALUES ('885', '4', '95');
INSERT INTO shop_commend_goods VALUES ('884', '1', '95');
INSERT INTO shop_commend_goods VALUES ('936', '1', '97');
INSERT INTO shop_commend_goods VALUES ('877', '3', '103');
INSERT INTO shop_commend_goods VALUES ('881', '3', '99');
INSERT INTO shop_commend_goods VALUES ('882', '1', '98');
INSERT INTO shop_commend_goods VALUES ('847', '4', '121');
INSERT INTO shop_commend_goods VALUES ('851', '4', '120');
INSERT INTO shop_commend_goods VALUES ('934', '1', '101');
INSERT INTO shop_commend_goods VALUES ('935', '1', '100');
INSERT INTO shop_commend_goods VALUES ('837', '1', '135');
INSERT INTO shop_commend_goods VALUES ('846', '4', '122');
INSERT INTO shop_commend_goods VALUES ('845', '4', '124');
INSERT INTO shop_commend_goods VALUES ('662', '3', '93');
INSERT INTO shop_commend_goods VALUES ('661', '4', '93');
INSERT INTO shop_commend_goods VALUES ('833', '3', '147');
INSERT INTO shop_commend_goods VALUES ('875', '2', '105');
INSERT INTO shop_commend_goods VALUES ('876', '1', '104');
INSERT INTO shop_commend_goods VALUES ('874', '1', '105');
INSERT INTO shop_commend_goods VALUES ('939', '3', '106');
INSERT INTO shop_commend_goods VALUES ('938', '4', '106');
INSERT INTO shop_commend_goods VALUES ('937', '1', '106');
INSERT INTO shop_commend_goods VALUES ('929', '3', '94');
INSERT INTO shop_commend_goods VALUES ('928', '4', '94');
INSERT INTO shop_commend_goods VALUES ('927', '1', '94');
INSERT INTO shop_commend_goods VALUES ('660', '1', '93');
INSERT INTO shop_commend_goods VALUES ('869', '3', '108');
INSERT INTO shop_commend_goods VALUES ('870', '2', '107');
INSERT INTO shop_commend_goods VALUES ('868', '4', '108');
INSERT INTO shop_commend_goods VALUES ('867', '2', '108');
INSERT INTO shop_commend_goods VALUES ('865', '1', '110');
INSERT INTO shop_commend_goods VALUES ('866', '1', '109');
INSERT INTO shop_commend_goods VALUES ('862', '4', '113');
INSERT INTO shop_commend_goods VALUES ('863', '1', '112');
INSERT INTO shop_commend_goods VALUES ('864', '1', '111');
INSERT INTO shop_commend_goods VALUES ('861', '2', '113');
INSERT INTO shop_commend_goods VALUES ('860', '1', '113');
INSERT INTO shop_commend_goods VALUES ('859', '1', '114');
INSERT INTO shop_commend_goods VALUES ('858', '3', '115');
INSERT INTO shop_commend_goods VALUES ('857', '4', '115');
INSERT INTO shop_commend_goods VALUES ('856', '1', '115');
INSERT INTO shop_commend_goods VALUES ('855', '1', '117');
INSERT INTO shop_commend_goods VALUES ('853', '4', '119');
INSERT INTO shop_commend_goods VALUES ('854', '1', '118');
INSERT INTO shop_commend_goods VALUES ('844', '4', '125');
INSERT INTO shop_commend_goods VALUES ('843', '4', '126');
INSERT INTO shop_commend_goods VALUES ('842', '3', '128');
INSERT INTO shop_commend_goods VALUES ('841', '3', '129');
INSERT INTO shop_commend_goods VALUES ('840', '1', '130');
INSERT INTO shop_commend_goods VALUES ('839', '4', '132');
INSERT INTO shop_commend_goods VALUES ('932', '2', '136');
INSERT INTO shop_commend_goods VALUES ('933', '1', '133');
INSERT INTO shop_commend_goods VALUES ('835', '1', '138');
INSERT INTO shop_commend_goods VALUES ('834', '1', '141');
INSERT INTO shop_commend_goods VALUES ('830', '2', '145');
INSERT INTO shop_commend_goods VALUES ('829', '3', '146');
INSERT INTO shop_commend_goods VALUES ('850', '2', '120');
INSERT INTO shop_commend_goods VALUES ('852', '1', '119');
INSERT INTO shop_commend_goods VALUES ('832', '2', '147');
INSERT INTO shop_commend_goods VALUES ('831', '4', '145');
INSERT INTO shop_commend_goods VALUES ('909', '3', '77');
INSERT INTO shop_commend_goods VALUES ('908', '4', '77');
INSERT INTO shop_commend_goods VALUES ('911', '3', '79');
INSERT INTO shop_commend_goods VALUES ('910', '4', '79');
INSERT INTO shop_commend_goods VALUES ('905', '3', '82');
INSERT INTO shop_commend_goods VALUES ('904', '2', '82');
INSERT INTO shop_commend_goods VALUES ('903', '3', '85');
INSERT INTO shop_commend_goods VALUES ('902', '4', '85');
INSERT INTO shop_commend_goods VALUES ('901', '2', '85');
INSERT INTO shop_commend_goods VALUES ('900', '1', '87');
INSERT INTO shop_commend_goods VALUES ('899', '4', '88');
INSERT INTO shop_commend_goods VALUES ('898', '2', '88');
INSERT INTO shop_commend_goods VALUES ('897', '1', '88');
INSERT INTO shop_commend_goods VALUES ('631', '2', '89');
INSERT INTO shop_commend_goods VALUES ('630', '1', '89');
INSERT INTO shop_commend_goods VALUES ('894', '3', '90');
INSERT INTO shop_commend_goods VALUES ('893', '4', '90');
INSERT INTO shop_commend_goods VALUES ('892', '2', '90');
INSERT INTO shop_commend_goods VALUES ('896', '2', '91');
INSERT INTO shop_commend_goods VALUES ('895', '1', '91');

-- ----------------------------
-- Table structure for `shop_comment`
-- ----------------------------
DROP TABLE IF EXISTS `shop_comment`;
CREATE TABLE `shop_comment` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `order_no` varchar(20) default NULL COMMENT '订单编号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` datetime NOT NULL COMMENT '购买时间',
  `comment_time` date default NULL COMMENT '评论时间',
  `contents` text COMMENT '评论内容',
  `point` tinyint(1) NOT NULL default '0' COMMENT '评论的分数',
  `status` tinyint(1) default '0' COMMENT '评论状态：0：未评论 1:已评论',
  PRIMARY KEY  (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='商品评论表';

-- ----------------------------
-- Records of shop_comment
-- ----------------------------
INSERT INTO shop_comment VALUES ('75', '90', '20110527173750141528', '28', '2011-05-27 17:38:06', '2011-05-27', '这个单反，性价比还不错，再便宜点就好了！', '5', '1');
INSERT INTO shop_comment VALUES ('76', '101', '20110527174219262268', '28', '2011-05-27 17:42:37', '2011-05-27', '有点贵了！', '4', '1');
INSERT INTO shop_comment VALUES ('77', '134', '20110527174421614297', '28', '2011-05-27 17:44:34', '2011-05-27', '你就看吧，真的不错，有点贵。', '4', '1');
INSERT INTO shop_comment VALUES ('74', '130', '20110527172204279379', '28', '2011-05-27 17:36:34', '2011-05-27', '这电影很好看，没看过的一定不要错！', '5', '1');

-- ----------------------------
-- Table structure for `shop_consume_log`
-- ----------------------------
DROP TABLE IF EXISTS `shop_consume_log`;
CREATE TABLE `shop_consume_log` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `amount` float(10,2) NOT NULL default '0.00' COMMENT '金额',
  `time` datetime default NULL COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消费记录表';

-- ----------------------------
-- Records of shop_consume_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_delivery`
-- ----------------------------
DROP TABLE IF EXISTS `shop_delivery`;
CREATE TABLE `shop_delivery` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL COMMENT '快递名称',
  `description` varchar(50) default NULL COMMENT '快递描述',
  `area` text COMMENT '配送区域',
  `area_groupid` text COMMENT '配送区域id',
  `firstprice` text COMMENT '配送地址对应的首重价格',
  `secondprice` text COMMENT '配送地区对应的续重价格',
  `type` tinyint(1) default NULL COMMENT '配送类型 0先付款后发货 1先发货后付款',
  `first_weight` int(11) default NULL COMMENT '单位 克',
  `second_weight` int(11) default NULL COMMENT '单位 克',
  `first_price` float(10,2) NOT NULL default '0.00' COMMENT '首重价格',
  `second_price` float(10,2) NOT NULL default '0.00' COMMENT '续重价格',
  `status` tinyint(1) default '0' COMMENT '开启状态',
  `sort` int(11) default '99' COMMENT '排序',
  `is_save_price` tinyint(1) default '0' COMMENT '是否支持物流保价 1支持保价 0  不支持保价',
  `save_rate` int(11) default NULL COMMENT '保价费率',
  `low_price` float(10,2) NOT NULL default '0.00' COMMENT '最低保价',
  `price_type` tinyint(1) default '0' COMMENT '费用类型 0统一设置 1指定地区费用',
  `open_default` tinyint(1) default '1' COMMENT '启用默认费用 1启用 0 不启用',
  `is_delete` tinyint(1) unsigned default '0' COMMENT '是否删除 0:未删除 1:删除',
  `freight_id` int(11) unsigned default NULL COMMENT '货运公司ID',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='配送方式表';

-- ----------------------------
-- Records of shop_delivery
-- ----------------------------
INSERT INTO shop_delivery VALUES ('1', '邮政', '', 'a:1:{i:0;s:0:\"\";}', 'a:1:{i:0;s:0:\"\";}', 'a:1:{i:0;s:0:\"\";}', 'a:1:{i:0;s:0:\"\";}', '0', '1000', '1000', '10.00', '1.00', '1', '1', '0', '0', '0.00', '0', '0', '0', '1');
INSERT INTO shop_delivery VALUES ('2', '申通', '', 'a:1:{i:0;s:0:\"\";}', 'a:1:{i:0;s:0:\"\";}', 'a:1:{i:0;s:0:\"\";}', 'a:1:{i:0;s:0:\"\";}', '0', '1000', '1000', '10.00', '1.00', '1', '2', '0', '0', '0.00', '0', '0', '0', '2');

-- ----------------------------
-- Table structure for `shop_delivery_doc`
-- ----------------------------
DROP TABLE IF EXISTS `shop_delivery_doc`;
CREATE TABLE `shop_delivery_doc` (
  `id` int(11) NOT NULL auto_increment COMMENT '发货单ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `user_id` int(11) default NULL COMMENT '用户ID',
  `admin_id` int(11) default NULL COMMENT '管理员ID',
  `name` varchar(255) default NULL COMMENT '收货人',
  `postcode` int(6) default NULL COMMENT '邮编',
  `telphone` varchar(20) default NULL COMMENT '联系电话',
  `country` int(11) default NULL COMMENT '国ID',
  `province` int(11) default NULL COMMENT '省ID',
  `city` int(11) default NULL COMMENT '市ID',
  `area` int(11) default NULL COMMENT '区ID',
  `address` varchar(250) default NULL COMMENT '收货地址',
  `mobile` varchar(20) default NULL COMMENT '手机',
  `time` datetime default NULL COMMENT '创建时间',
  `freight` float(10,2) NOT NULL default '0.00' COMMENT '运费',
  `delivery_code` varchar(255) default NULL COMMENT '物流单号',
  `delivery_type` varchar(255) default NULL COMMENT '物流方式',
  `note` text COMMENT '管理员添加的备注信息',
  `if_del` tinyint(3) default NULL COMMENT '1为删除',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发货单';

-- ----------------------------
-- Records of shop_delivery_doc
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_delivery_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_delivery_goods`;
CREATE TABLE `shop_delivery_goods` (
  `id` int(11) NOT NULL auto_increment,
  `delivery_id` int(11) NOT NULL COMMENT '发货单ID',
  `goods_id` int(11) default NULL COMMENT '商品ID',
  `product_id` int(11) default NULL COMMENT '货品id',
  `goods_code` varchar(255) default NULL COMMENT '货号',
  `goods_nums` int(11) default NULL COMMENT '货品数量',
  `time` datetime default NULL COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发货清单';

-- ----------------------------
-- Records of shop_delivery_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_discussion`
-- ----------------------------
DROP TABLE IF EXISTS `shop_discussion`;
CREATE TABLE `shop_discussion` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` datetime NOT NULL COMMENT '评论时间',
  `contents` text COMMENT '评论内容',
  `is_check` tinyint(1) default '0' COMMENT '审核状态,0未审核 1已审核',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品讨论表';

-- ----------------------------
-- Records of shop_discussion
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_email_registry`
-- ----------------------------
DROP TABLE IF EXISTS `shop_email_registry`;
CREATE TABLE `shop_email_registry` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(80) NOT NULL COMMENT 'Email',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Email订阅表';

-- ----------------------------
-- Records of shop_email_registry
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `shop_favorite`;
CREATE TABLE `shop_favorite` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `rid` int(11) NOT NULL COMMENT '商品或货品ID',
  `time` datetime NOT NULL COMMENT '收藏时间',
  `summary` varchar(255) default NULL COMMENT '备注',
  `cat_id` int(11) NOT NULL COMMENT '商品分类',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表';

-- ----------------------------
-- Records of shop_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_find_password`
-- ----------------------------
DROP TABLE IF EXISTS `shop_find_password`;
CREATE TABLE `shop_find_password` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `hash` char(32) NOT NULL COMMENT 'hash值',
  `addtime` int(11) NOT NULL COMMENT '申请找回的时间',
  PRIMARY KEY  (`id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='找回密码';

-- ----------------------------
-- Records of shop_find_password
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_fitting_relation`
-- ----------------------------
DROP TABLE IF EXISTS `shop_fitting_relation`;
CREATE TABLE `shop_fitting_relation` (
  `id` int(11) NOT NULL auto_increment,
  `fitting_id` int(11) NOT NULL COMMENT '配件商品ID',
  `goods_id` int(11) NOT NULL COMMENT '附属商品ID',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='配件关系表';

-- ----------------------------
-- Records of shop_fitting_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_freight_company`
-- ----------------------------
DROP TABLE IF EXISTS `shop_freight_company`;
CREATE TABLE `shop_freight_company` (
  `id` int(11) NOT NULL auto_increment,
  `freight_type` varchar(255) default NULL COMMENT '货运类型',
  `freight_name` varchar(255) NOT NULL COMMENT '货运公司名称',
  `url` varchar(255) default NULL COMMENT '网址',
  `sort` tinyint(3) default '99' COMMENT '排序',
  `is_del` tinyint(3) default '0' COMMENT '0未删除1删除',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='货运公司';

-- ----------------------------
-- Records of shop_freight_company
-- ----------------------------
INSERT INTO shop_freight_company VALUES ('1', 'CNEMS', '中国邮政', 'http://www.ems.com.cn', '0', '0');
INSERT INTO shop_freight_company VALUES ('2', 'CNST', '申通快递', 'http://www.sto.cn', '0', '0');
INSERT INTO shop_freight_company VALUES ('3', 'CNTT', '天天快递', 'http://www.ttkd.cn', '0', '0');
INSERT INTO shop_freight_company VALUES ('4', 'CNYT', '圆通速递', 'http://www.yto.net.cn', '0', '0');
INSERT INTO shop_freight_company VALUES ('5', 'CNSF', '顺丰速运', 'http://www.sf-express.com', '0', '0');
INSERT INTO shop_freight_company VALUES ('6', 'CNYD', '韵达快递', 'http://www.yundaex.com', '0', '0');
INSERT INTO shop_freight_company VALUES ('7', 'CNZT', '中通速递', 'http://www.zto.cn', '0', '0');
INSERT INTO shop_freight_company VALUES ('8', 'CNLB', '龙邦物流', 'http://www.lbex.com.cn', '0', '0');
INSERT INTO shop_freight_company VALUES ('9', 'CNZJS', '宅急送', 'http://www.zjs.com.cn', '0', '0');
INSERT INTO shop_freight_company VALUES ('10', 'CNQY', '全一快递', 'http://www.apex100.com', '0', '0');
INSERT INTO shop_freight_company VALUES ('11', 'CNHT', '汇通速递', 'http://www.htky365.com', '0', '0');
INSERT INTO shop_freight_company VALUES ('12', 'CNMH', '民航快递', 'http://www.cae.com.cn', '0', '0');
INSERT INTO shop_freight_company VALUES ('13', 'CNYF', '亚风速递', 'http://www.airfex.cn', '0', '0');
INSERT INTO shop_freight_company VALUES ('14', 'CNKJ', '快捷速递', 'http://www.fastexpress.com.cn', '0', '0');
INSERT INTO shop_freight_company VALUES ('15', 'DDS', 'DDS快递', 'http://www.qc-dds.net', '0', '0');
INSERT INTO shop_freight_company VALUES ('16', 'CNHY', '华宇物流', 'http://www.hoau.net', '0', '0');
INSERT INTO shop_freight_company VALUES ('17', 'CNZY', '中铁快运', 'http://www.cre.cn', '0', '0');
INSERT INTO shop_freight_company VALUES ('18', 'FEDEX', 'FedEx', 'http://www.fedex.com/cn', '0', '0');
INSERT INTO shop_freight_company VALUES ('19', 'UPS', 'UPS', 'http://www.ups.com', '0', '0');
INSERT INTO shop_freight_company VALUES ('20', 'DHL', 'DHL', 'http://www.cn.dhl.com', '0', '0');

-- ----------------------------
-- Table structure for `shop_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods`;
CREATE TABLE `shop_goods` (
  `id` int(11) NOT NULL auto_increment COMMENT '商品ID',
  `name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_no` varchar(20) default NULL COMMENT '商品的货号',
  `model_id` int(11) default NULL COMMENT '模型ID',
  `sell_price` float(10,2) default NULL COMMENT '销售价格',
  `market_price` float(10,2) default NULL COMMENT '市场价格',
  `up_time` datetime default NULL COMMENT '上架时间',
  `down_time` datetime default NULL COMMENT '下架时间',
  `create_time` datetime default NULL COMMENT '创建时间',
  `store_nums` int(11) NOT NULL default '0' COMMENT '库存',
  `img` varchar(255) default NULL COMMENT '原图',
  `is_del` tinyint(1) NOT NULL default '0' COMMENT '删除 0未删除 1已删除',
  `content` text COMMENT '商品描述',
  `keywords` varchar(255) default NULL COMMENT 'SEO关键词',
  `description` varchar(255) default NULL COMMENT 'SEO描述',
  `tag_ids` varchar(255) default NULL COMMENT '标签id',
  `weight` float(10,2) default NULL COMMENT '重量',
  `point` int(11) default '0' COMMENT '积分',
  `unit` varchar(10) default NULL COMMENT '计量单位',
  `brand_id` int(11) default NULL COMMENT '品牌ID',
  `visit` int(11) default NULL COMMENT '浏览次数',
  `favorite` int(11) default NULL COMMENT '收藏次数',
  `sort` int(11) default '99' COMMENT '排序',
  `list_img` varchar(255) default '' COMMENT '列表页缩略图 大图',
  `small_img` varchar(255) default NULL COMMENT '详细页缩略图 小图',
  `spec_array` text COMMENT '序列化存储规格,key值为规则ID，value为此商品具有的规格值',
  `exp` int(11) default '0' COMMENT '经验值',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of shop_goods
-- ----------------------------
INSERT INTO shop_goods VALUES ('94', '苹果（Apple）iPad 2 MC916CH/A 9.7英寸平板电脑 （16G WIFI版）', 'SD00000000000094', '156', '3999.00', '4099.00', '2011-05-27 10:19:06', '2011-06-11 10:19:08', '2011-05-27 10:20:13', '100', 'upload/2011/05/27/20110527101931485.jpg', '0', '', '', '', null, '0.00', '390', '', '24', '0', '0', '99', 'upload/2011/05/27/20110527101931485_175_175.jpg', 'upload/2011/05/27/20110527101931485_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:80:\"upload/2011/05/26/20110526105352343.gif,upload/2011/05/26/20110526105558440.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"S,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('95', '索尼（SONY）VPCSD18EC/P 13.3英寸宽屏笔记本电脑（i5-2410M 2G 320G', 'SD00000000000095', '156', '7699.00', '7999.00', '2011-05-27 10:21:19', '2011-06-11 10:21:21', '2011-05-27 10:22:28', '800', 'upload/2011/05/27/20110527095041824.jpg', '0', '<p><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527100801_18975.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527100808_71647.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527100815_87184.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527100823_56073.jpg\" alt=\"\" border=\"0\" /></p>\r\n<p></p>\r\n<div align=\"center\"><table class=\"ke-zeroborder\" style=\"width:564.75pt;\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"753\"><tbody><tr><td width=\"291\"><p style=\"text-align:left;text-indent:24pt;\" align=\"left\"><span>SD19</span><span style=\"font-family:\'宋体\';\">采用第二代英特尔酷睿</span><span style=\"font-family:Arial, sans-serif;\">i5-2520M</span><span style=\"font-family:\'宋体\';\">处理器（</span><span style=\"font-family:Arial, sans-serif;\">2.50 GHz</span><span style=\"font-family:\'宋体\';\">）。英特尔酷睿加速技术根据高端工作负载的要求，智能地把运行频率提升至</span><span style=\"font-family:Arial, sans-serif;\">3.20 GHz</span><span style=\"font-family:\'宋体\';\">，满足苛刻应用的速度要求，大幅提升工作效率。</span></p>\r\n<p style=\"text-align:left;text-indent:24pt;\" align=\"left\"><span>* </span><span style=\"font-family:\'宋体\';\">资料出自英特尔</span><span style=\"font-family:Arial, sans-serif;\"><br />\r\n* SD18</span><span style=\"font-family:\'宋体\';\">采用英特尔酷睿</span><span>TMi5-2410M</span><span style=\"font-family:\'宋体\';\">（</span><span>2.30 GHz</span><span style=\"font-family:\'宋体\';\">：</span><span> </span><span style=\"font-family:\'宋体\';\">使用睿频加速技术时最高可达</span><span style=\"font-family:Arial, sans-serif;\">2.90 GHz</span></p>\r\n</td>\r\n<td width=\"101\"><p style=\"text-align:left;\" align=\"left\"><span class=\"Apple-style-span\" style=\"font-family:\'宋体\';\"><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527100940_25891.jpg\" alt=\"\" border=\"0\" /><br /></span></p>\r\n</td>\r\n<td width=\"285\"><p style=\"text-align:left;text-indent:24pt;\" align=\"left\"><span>VAIO S</span><span style=\"font-family:\'宋体\';\">系列搭载的</span><span style=\"font-family:Arial, sans-serif;\">AMD Radeon TM HD 6470M</span><span style=\"font-family:\'宋体\';\">图形处理器（</span><span style=\"font-family:Arial, sans-serif;\">512MB</span><span style=\"font-family:\'宋体\';\">独立显存）拥有强大的游戏性能与出色的视频图形表现能力。更高的精确度，更出色的光影效果，带给你更强的视觉震撼。</span></p>\r\n<p style=\"text-align:left;text-indent:24pt;\" align=\"left\"><span>*</span><span style=\"font-family:\'宋体\';\">资料出自显示卡制造商</span></p>\r\n<p style=\"text-align:left;text-indent:24pt;\" align=\"left\"><span>VAIO S</span><span style=\"font-family:\'宋体\';\">系列拥有显卡切换功能，帮你自如应对不同使用场合的需求。</span></p>\r\n<p style=\"text-align:left;text-indent:24pt;\" align=\"left\"><span style=\"font-family:\'宋体\';\">使用集成显卡，可以有效延长待机时间，适合外出携带或者差旅使用。</span></p>\r\n<p style=\"text-align:left;text-indent:24pt;\" align=\"left\"><span style=\"font-family:\'宋体\';\">使用独立显卡，能提供强大的图形表现能力。</span></p>\r\n</td>\r\n<td width=\"105\"><p style=\"text-align:left;\" align=\"left\"><span class=\"Apple-style-span\" style=\"font-family:\'宋体\';\"><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527100952_52041.jpg\" alt=\"\" border=\"0\" /><br /></span></p>\r\n</td>\r\n</tr></tbody></table></div>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\"> </span></p>\r\n<div align=\"center\"><table class=\"ke-zeroborder\" style=\"width:586.5pt;\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"782\"><tbody><tr><td><p style=\"text-align:left;text-indent:24pt;\" align=\"left\"><span>SD19</span><span style=\"font-family:\'宋体\';\">采用第二代英特尔酷睿</span><span style=\"font-family:Arial, sans-serif;\">i5-2520M</span><span style=\"font-family:\'宋体\';\">处理器（</span><span style=\"font-family:Arial, sans-serif;\">2.50 GHz</span><span style=\"font-family:\'宋体\';\">）。英特尔酷睿加速技术根据高端工作负载的要求，智能地把运行频率提升至</span><span style=\"font-family:Arial, sans-serif;\">3.20 GHz</span><span style=\"font-family:\'宋体\';\">，满足苛刻应用的速度要求，大幅提升工作效率。</span></p>\r\n<p style=\"text-align:left;text-indent:24pt;\" align=\"left\"><span>* </span><span style=\"font-family:\'宋体\';\">资料出自英特尔</span><span style=\"font-family:Arial, sans-serif;\"><br />\r\n* SD18</span><span style=\"font-family:\'宋体\';\">采用英特尔酷睿</span><span>TMi5-2410M</span><span style=\"font-family:\'宋体\';\">（</span><span>2.30 GHz</span><span style=\"font-family:\'宋体\';\">：</span><span> </span><span style=\"font-family:\'宋体\';\">使用睿频加速技术时最高可达</span><span style=\"font-family:Arial, sans-serif;\">2.90 GHz</span></p>\r\n</td>\r\n<td><p style=\"text-align:left;\" align=\"left\"><span class=\"Apple-style-span\" style=\"font-family:\'宋体\';\"><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527101002_99758.jpg\" alt=\"\" border=\"0\" /><br /></span></p>\r\n</td>\r\n</tr></tbody></table></div>', '', '', null, '0.00', '760', '', '31', '0', '0', '99', 'upload/2011/05/27/20110527095041824_175_175.jpg', 'upload/2011/05/27/20110527095041824_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:160:\"upload/2011/05/26/20110526105538833.gif,upload/2011/05/26/20110526105558440.gif,upload/2011/05/26/20110526105509389.gif,upload/2011/05/26/20110526105401935.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"S,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('133', '大型清装穿越电视剧 《宫》宫锁心玉', 'SD00000000000133', '185', '120.00', '150.00', '2011-05-27 15:38:21', '2012-05-27 15:38:23', '2011-05-27 15:39:33', '74', 'upload/2011/05/27/20110527033924511.png', '0', '<p align=\"left\"><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527154122_44164.png\" alt=\"\" border=\"0\" height=\"431\" width=\"745\" /></p>\r\n<p align=\"left\">碟片数量：13张</p>\r\n<p align=\"left\">剧　名： <span style=\"color:#ff0000;\">《宫》</span><br />\r\n总策划：吕焕斌<br />\r\n出品人：欧阳常林<br />\r\n总监制：姜欣/蒋新建/盛伯骥<br />\r\n监制：王泽勇/陈援<br />\r\n策划：钟君艳/肖宁/谭稀/江新光<br />\r\n制片人：何瑾/于正<br />\r\n艺术总监/编剧：于正<br />\r\n导演：李惠珠</p>\r\n<p align=\"left\">故事概况：<br />\r\n　　考古系少女洛晴川幼年时亲眼目睹父亲洛一凡的师妹苏锦良凭空消失在花园里，长大后一直耿耿于怀，想破解谜团。在一次清理清朝王爷公墓时，她意外地看到了苏锦良当年握在手里的宝盒，准备偷偷藏起来研究，不料被人发现，危急中晴川将宝盒打开，忽然穿越时空到了清朝，成为太子的宫女。晴川巧舌入簧欲脱离魔爪，却被太子识穿，纠缠之际，八阿哥出面相救，晴川得以脱险。八阿哥踌躇满志，英姿勃勃，对晴川一见钟情，而晴川却一心只想回到现代。在一系列的失败之后，她终于认命留在清朝。但八阿哥不是她的选择，丰富的历史知识告诉她，只有跟了将来的皇帝——四阿哥，才是出路。于是她费尽心机走进了皇宫，几度九死一生，却又因为丰富的现代知识而被皇上赏识。同时她也见到了她仰慕已久的四阿哥，并为了接近他而闹出不少笑话。然而宫廷并非她想象的那么美好，为了皇位，为了争宠，整天上演着勾心斗角的戏码。在一片杀机里，能让晴川信任的只有同住一室的宫女素言。素言本是一名乞丐，得四阿哥相救，被派到深宫里做太子的内应，素言一片真心对四阿哥，却一次次地沦为四阿哥的工具。晴川目睹一切，对四阿哥的行为深感痛心。这时她发现八阿哥的母亲良妃居然就是当年穿越的苏锦良。锦良一心想回现代，整天忙于研究，被皇上视为妖孽，独住冷宫，晴川常去看她。跟八阿哥接触多了的晴川终于被八阿哥的一片痴情所动，嫁他为妻。这时，锦良研究回到现代的实验成功，锦良决定将晴川带回现代，晴川不愿意走，把机会让给了生不如死的素言。锦良和素言消失了。历史照着正轨慢慢往前走去。几番斗争之后，四阿哥登基了，八阿哥被贬了。当晴川面对变成皇帝的四阿哥时，才知道自己依然深爱着他，而他也依然深爱着自己。但她依然选择了陪八阿哥囚禁。这让四阿哥很气愤，加强了对八阿哥的管制，晴川为了让八阿哥有好日子过，决定穿越回现代。这时，因为素言的离开而痛苦万分的十三阿哥来见她，她告诉了他穿越的秘密。十三阿哥陪着晴川演了一出好戏，让皇帝误以为她已经死了，心里仍对她万般爱恋的皇帝寻遍能人异士企图回到过去，希望能有机会重来一次。<br /><br />\r\n　　回到现代之后的晴川更加懂得去珍惜拥有的一切，并学会宽容别人，看淡得失。她一边研究历史，一边照顾生病的父亲，在偶然的街头，她遇见了一个跟八阿哥长得一模一样的现代男子，爱情故事再次完美上演。<br /><br />\r\n　　素言来到现代已渐渐适应，可是现代人的物欲横流令她很不习惯，她忽然怀念起十三阿哥的温柔和爱，很后悔来到现代，某天的一个下午，她在民俗园里做刺绣，一个熟悉的脚步声响起，她抬起头，看到了十三阿哥的脸，爱情，生命再一次开始轮回</p>', '', '', null, '0.00', '50', '张', '0', '0', '0', '99', 'upload/2011/05/27/20110527033924511_175_175.png', 'upload/2011/05/27/20110527033924511_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('93', '联想（Lenovo）Y470N-IFI 14.0英寸笔记本电脑（i5-2410M 4G 640G 2', null, '156', '5999.00', '5999.00', '2011-05-27 10:12:53', '2011-06-11 10:12:55', '2011-05-27 10:15:36', '999', 'upload/2011/05/27/20110527101512867.jpg', '0', '<p><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527101605_50783.jpg\" alt=\"\" border=\"0\" /></p>\r\n<p> </p><div align=\"center\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"95%\" style=\"width:95%;\"><tbody><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">处理器</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\"><a href=\"http://spu.tmall.com/spu-128212002---0---9707978982---.htm?prc=1&amp;q=Y470N+IFI\"><span style=\"color:#3366CC;\"><span>英特尔? </span></span><span style=\"color:#3366CC;\"><span>酷睿? i5 </span></span><span style=\"color:#3366CC;\"><span>处理器</span></span></a><span style=\"color:#FF0000;\">i5-2410M</span>(2.3GHz,</span><span style=\"font-size:12pt;font-family:\'宋体\';\">可睿频加速至<span> 2.9GHz)</span></span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">操作系统</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\"><a href=\"http://spu.tmall.com/spu-128212002---0---9707978982---.htm?prc=1&amp;q=Y470N+IFI\"><span style=\"color:#3366CC;\"><span>正版</span></span></a>  Windows?  7 </span><span style=\"font-size:12pt;font-family:\'宋体\';\">家庭普通版<span> 64</span>位</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">芯片组</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">英特尔<span>? HM65</span>高速芯片组</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">内存</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';color:#FF0000;\">4GB DDR3</span><span style=\"font-size:12pt;font-family:\'宋体\';\">(</span><span style=\"font-size:12pt;font-family:\'宋体\';\">支持扩展至<span>8GB)</span></span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">硬盘</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';color:#FF0000;\">750G SATA </span><span style=\"font-size:12pt;font-family:\'宋体\';color:#FF0000;\">硬盘</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">无线局域网卡<span>                 </span></span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">802.11bgn</span><span style=\"font-size:12pt;font-family:\'宋体\';\">无线局域网卡</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">光驱</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">超级<span>DVD</span>刻录光驱</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">显示屏</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">14.0\" </span><span style=\"font-size:12pt;font-family:\'宋体\';\">超薄炫彩屏，<span>16</span>：<span>9</span>黄金比例，<span>LED</span>背光</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">显卡</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';color:#FF0000;\">NVIDIA GeForce GT 550M</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">显示内存</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';color:#FF0000;\">2GB DDR3</span><span style=\"font-size:12pt;font-family:\'宋体\';color:#FF0000;\">高速独立显存</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">键盘</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">联想高触感巧克力键盘</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">视频输出</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';color:#FF0000;\">HDMI</span><span style=\"font-size:12pt;font-family:\'宋体\';color:#FF0000;\">高清影音端口，标准<span>VGA</span></span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">摄像头</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';color:#FF0000;\">200</span><span style=\"font-size:12pt;font-family:\'宋体\';color:#FF0000;\">万像素高感光摄像头</span><span style=\"font-size:12pt;font-family:\'宋体\';\">支持安全易用的人脸识别功能</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">声音系统</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';color:#FF0000;\">JBL</span><span style=\"font-size:12pt;font-family:\'宋体\';color:#FF0000;\">专业品牌音响</span><span style=\"font-size:12pt;font-family:\'宋体\';\">，<span>SRS? Premium Sound?</span>认证音效</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">网卡</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">100M/1000M</span><span style=\"font-size:12pt;font-family:\'宋体\';\">以太自适应网卡</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">标准接口</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">4</span><span style=\"font-size:12pt;font-family:\'宋体\';\">个<span>USB2.0</span>接口<span>(</span>其中一个和<span>Esata</span>共用<span>)</span>，<span>Esata Combo</span>，<span>VGA</span>接口，<span>RJ45</span>，全阵列式抗噪麦克风，支持立体音的耳机插孔<span>/</span>音频输出，六合一读卡器<span>(SD/SD-pro/MMC/MS/MS-pro/XD)</span>，<span>HDMI</span>高清输出接口</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">电源</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">100~240V</span><span style=\"font-size:12pt;font-family:\'宋体\';\">宽电压电源适配器</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">电池类型</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">高性能<span>6</span>芯锂离子电池</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">尺寸</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">345mm x 239mm x 20~32.8mm</span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">重量</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">2.2Kg(</span><span style=\"font-size:12pt;font-family:\'宋体\';\">含有<span>6</span>芯电池，具体重量依据产品出货配置为准<span>)</span></span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">可选件</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">笔记本礼包<span>(</span>需另行购买<span>)</span></span></p>\r\n  </td>\r\n </tr><tr><td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">特色功能</span></p>\r\n  </td>\r\n  <td>  <p align=\"left\" style=\"text-align:left;\"><span style=\"font-size:12pt;font-family:\'宋体\';\">一键影音<span> II</span>一键拯救系统<span>DirectShareVeriFace?  </span>智能人脸识别</span></p>\r\n  </td>\r\n </tr></tbody></table></div>', '', '', null, '0.00', '590', '', '32', '0', '0', '99', 'upload/2011/05/27/20110527101512867_175_175.jpg', 'upload/2011/05/27/20110527101512867_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('126', '嘎嘎小姐：超人气冠军特典（CD）', null, '184', '23.50', '50.60', '2011-05-27 14:52:40', '2012-05-27 14:52:42', '2011-05-27 14:55:02', '100', 'upload/2011/05/27/20110527025357602.png', '0', '<p align=\"left\">演唱者/演奏者： 嘎嘎小姐（Lady GaGa） </p>\r\n<div align=\"left\">出 版 社：北京东方影音公司 </div>\r\n<div align=\"left\">发行公司：广东星外星唱片 </div>\r\n<div align=\"left\">地    区：欧美 碟 片 数：1 </div>\r\n<div align=\"left\">介    质：CD </div>\r\n<h2 class=\"mt\" align=\"left\">内容简介</h2>\r\n<div class=\"mc\" align=\"left\">\r\n<div style=\"width:460px;height:504px;\" class=\"con\">    《嘎嘎小姐Lady GaGa：The Fame 超人气（冠军特典）》流行缪思LADY GAGA，一个拥有格温·史蒂芬妮+凯莉米洛+麦丹娜+克里斯廷魅力精髓的全新女神，结合流行、舞曲、节奏蓝调…等风格的首张大碟《The Fame》，首波英美冠军主打“Just Dance”，满载着高压Electro-Pop电子气流，请到阿肯新签的19岁型男Colby O`Donis跨刀献声，一举打破全美女艺人史上单周最高数字下载纪录；接着散发玩乐主义的“Lovegame”，绝对High翻各大夜店舞池；第二首单曲“Poker Face”，包融Synth-Pop之能量，打造一出闪亮亮的复古派对；“Beautiful，Dirty，Rich”，混搭鼓动不已的Funky线条，配上90年代正兴起的House律动，势必引起舞棍们的疯狂着迷；轻盈摇摆的“Eh，Eh （Nothing Else I Can Say）”有着夏日舒缓雷鬼节拍；“Boys，Boys，Boys”灵感则是来自Motley Crue的名曲“Girls，Girls，Girls”；专辑同名曲“The Fame“，用电吉他拉出摇滚感应，游移在嘻哈/节奏蓝调边缘，精采程度丝毫不输关史蒂芬妮；还有“Summerboy”等佳作，都是Lady GaGa收放自若、大玩Pop Rock的见证。<br />\r\n    美国十年来首位处女专辑缔造两支冠军单曲之女艺人，西洋乐坊的未来新势力。全球乐评一致推荐 权威媒体BBC认定为Sound of 2009。首批内附限量酷炫闪电贴。全球重点推荐。阿肯发现流行缪思，一个拥有格温·史蒂芬妮+凯莉米洛+麦丹娜+克里斯廷魅力精髓的全新女神。2009全球舞池当红一姐，格莱美入围肯定。<br />\r\n    首支单曲Just Dance全球七国冠军+十九国Top 10+美国销量突破三百五十万+打破女艺人单周数位下载纪录+流行电台双周冠军。次波单曲Poker Face全球十七国冠军+美国销量突破两百万+流行电台冠军。专辑The Fame已写下全球五国No.1 +十七国Top 10。<br />\r\n    国际版特别收录全新混音版本之LoveGame，Paparazzi，Money Money及独家附赠曲Disco Heaven。<br /><br /></div>\r\n</div>\r\n<h2 class=\"mt\" align=\"left\">曲目</h2>\r\n<div class=\"con\" align=\"left\">01 Just Dance 舞力全开 - 首波冠军主打 阿肯旗下秘密武器colby O`Donis跨刀 美国/英国单曲榜双料三周冠军<br />\r\n02 Lovegame 爱情游戏 美国第三支单曲 国际市场第四波单曲 挺进加拿大Top 5<br />\r\n03 Paparazzi 狗仔队 英国限量新单曲<br />\r\n04 Poker Face 无动于衷- 第二波全球舞池主打劲歌 全球17国冠军 美/英/澳/德/法/爱/荷/瑞全球齐奏凯歌<br />\r\n05 Eh, Eh (Nothing Else I Can Say) 嗯 嗯（无话可说） 国际第三支单曲 率先杀进新西兰及瑞士Top 10<br />\r\n06 Beautiful, Dirty, Rich 拜金女郎<br />\r\n07 The Fame 成名在望<br />\r\n08 Money Honey 奢侈生活<br />\r\n09 Starstruck – Feat Space Cowboy And Flo Rida 惧星症 - 嘻哈猛将佛罗里达及法国名DJ Space Cowboy跨刀助阵<br />\r\n10 Boys Boys Boys 坏小孩<br />\r\n11 Paper Gangsta 粉饰太平<br />\r\n12 Brown Eyes 褐色眼眸<br />\r\n13 I Like It Rough 我心狂野<br />\r\n14 Summerboy 阳光男孩<br />\r\n15 Disco Heaven (Bonus Track) 舞曲天堂-超值加赠全新单曲 </div>', '', '', null, '0.00', '20', '张', '0', '0', '0', '99', 'upload/2011/05/27/20110527025357602_175_175.png', 'upload/2011/05/27/20110527025357602_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('127', '百照王可颂系列 SAA10521吊灯', null, '183', '8600.00', '9200.00', '2011-05-27 14:59:17', '2012-05-27 14:59:19', '2011-05-27 15:00:59', '100', 'upload/2011/05/27/20110527040842799.jpg', '0', '<img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527150607_75143.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527150613_48603.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527150620_90562.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527150626_22120.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527150632_30527.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527150638_73641.jpg\" border=\"0\" />', '', '', null, '15000.00', '20', '', '49', '0', '0', '99', 'upload/2011/05/27/20110527040842799_175_175.jpg', 'upload/2011/05/27/20110527040842799_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('128', '好猫咪咪', null, '185', '7.30', '17.30', '2011-05-27 15:09:21', '2012-05-27 15:09:23', '2011-05-27 15:10:41', '100', 'upload/2011/05/27/20110527031028876.png', '0', '<h2 class=\"mt\" align=\"left\">编辑推荐</h2>\r\n<div class=\"con\" align=\"left\">\r\n<p>　　“老鼠怕猫，那是谣传；壮起鼠胆，把猫打翻；千古偏见，一定推翻。”三只小老鼠唱着歌去拔猫的胡子。谁叫咪咪是只懒猫呢？</p>\r\n</div>\r\n<div class=\"more\" align=\"left\"><a>·查看全部&gt;&gt;</a></div>\r\n<div class=\"mt\" align=\"left\">\r\n<h2>内容简介</h2>\r\n</div>\r\n<div class=\"con\" align=\"left\">    《好猫咪咪》讲述了小猫咪咪好吃懒做，整日沉睡。一天，主人有事外出，桌上摆着一盆肉馅，咪咪负责看守却呼呼大睡。这时，三只小老鼠窜上桌，想偷吃肉馅，忽见一只猫睡在那里，吓得跑回家中。老鼠妈妈出来一看，原来是一只懒猫，它跳上前抓住猫须，咪咪痛得乱叫，要反抗又没本领，老鼠胆子越来越大，把猫拴在电灯线上，一群老鼠大吃肉馅。咪咪眼泪汪汪，后悔自己懒惰而没有学好本领。自此以后，咪咪决心改错，它向松鼠学爬树，向白兔学速度，向老虎学扑跳，各种本领都学到了手。一天，老鼠妈妈带着三只小鼠又来逞凶，咪咪眼疾手快，甩出一掌，三只小鼠被抓住。老鼠妈妈爬上吊灯，咪咪急忙拉了灯绳，灯泡亮得滚烫，狡猾的老鼠妈妈也被抓住了。咪咪脸上露出了胜利的微笑，朋友们都为咪咪的进步而高兴。 </div>', '', '', null, '0.00', '1', '张', '0', '0', '0', '99', 'upload/2011/05/27/20110527031028876_175_175.png', 'upload/2011/05/27/20110527031028876_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('129', '法国电影 情人', null, '185', '58.00', '70.00', '2011-05-27 15:15:31', '2012-05-27 15:15:33', '2011-05-27 15:17:35', '100', 'upload/2011/05/27/20110527031713429.png', '0', '<p class=\"content\" align=\"left\"><strong><span style=\"font-size:medium;font-family:\'黑体\';\">音轨：法</span></strong></p>\r\n<p class=\"content\" align=\"left\"><strong><span style=\"font-size:medium;font-family:\'黑体\';\">字幕：中法</span></strong></p>\r\n<p class=\"content\" align=\"left\">　在1929年的越南是法国殖民地，因此在越南的土地上有很多法国人。简(珍·玛琪)就《情人》剧照(20张)是一个15岁的法国少女，在西贡女子寄宿学校读书。每逢假期简便回家，母亲办了一所很小的学校，收入甚少。简有两个哥哥，大哥比尔吸毒成瘾且横行霸道，二哥保罗生性懦弱，常受大哥的欺负。一天简一如往常一样告别母亲乘上渡船回学校，在船上遇到一个坐黑色大轿车的阔少爷东尼(梁家辉)。东尼是华侨富翁的独生子，东尼喜欢这名白人少女便去搭讪，俩人便搭上了。简在寄宿学校里知道有的女生在外卖淫，她也想找个有钱人试试，因此很主动与东尼交谈，上岸后两人逛了西贡，还一起上馆子吃中国饭菜，东尼并用汽车送她回学校。第二天刚放学，黑色汽车就等在校门口了。 　　简和东尼很快就坠入爱河。东尼把简带到他的公馆，这是中国富人们常用来《情人》剧照(4张)金屋藏娇的地方。他俩在这里幽会、做爱、洗澡、玩耍。有时晚上也不回学校，校方只好通知她的母亲，简向东尼要钱给母亲，母亲太需要钱了，维持生活需要钱，还清比尔欠鸦片馆的债也要钱。母亲告诉校方给简自由，比尔知道了妹妹的事扬言要打死她俩，东尼请简的一家人到豪华的饭店吃饭，吃完饭后又去舞厅跳舞，可是比尔见到东尼与简跳舞马上凶相毕露，威胁东尼要打架，被母亲劝住。后来比尔被送回法国去了。 　　东尼很爱简，虽然简经常说她不爱中国人。东尼向父亲提出和简结婚的要求，父亲不同意，让他娶门当户对的中国妻子，否则就把东尼赶出家门。 　　东尼终于和他不爱的女人结婚了，他心如死灰。简和母亲也要回法国去了，临行前再去公馆，人去楼空，凄凉之感涌上心头。她不再自信地认为自己不爱中国情人，恐怕是她的人生途中的一段刻骨铭心的真情。</p>', '', '', null, '0.00', '10', '张', '0', '0', '0', '99', 'upload/2011/05/27/20110527031713429_175_175.png', 'upload/2011/05/27/20110527031713429_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('130', '电影 关云长', null, '185', '77.00', '128.00', '2011-05-27 15:19:25', '2012-05-27 15:19:27', '2011-05-27 15:20:47', '98', 'upload/2011/05/27/20110527032034738.png', '0', '<p align=\"left\"><span>故事概况</span></p>\r\n<p align=\"left\">　　刘备家眷被困曹营，关云长为存忠义甘作俘虏，被迫为曹军上阵。一场大战，关云长单人匹马斩杀敌方大将，技惊四座，而深受曹操赏识。 </p>\r\n<div align=\"left\"></div>\r\n<p align=\"left\">　　可是关云长却“<a><span style=\"color:#3366cc;\">身在曹营心在汉</span></a>”。对曹操所有礼遇均做出婉辞！后曹操查知关云长心仪刘备未过门的新妾“绮兰”，只因一个“义”字而未敢表白。曹操暗施狡计，送上催情毒酒，欲陷关羽于不义！ </p>\r\n<div align=\"left\"></div>\r\n<p align=\"left\">　　关羽悬崖勒马，从而带着对此充满恨意的绮兰杀出曹营！一路上，关羽连毙曹操大将，但是，威武的背后，饱受感情折磨！与此同时﹐曹营里的众将因曹操对关羽一再容让，军心动摇！曹操为稳定军心﹐而亲自出征，誓要将关羽擒拿！ </p>\r\n<div align=\"left\"></div>\r\n<p align=\"left\">　　几经艰苦，终于来到黄河渡口，平静河边已布下曹军亲兵的十面埋伏！生死关头，死敌曹操竟一再以礼相待，忠义如关羽亦不禁动摇！身旁的绮兰苦苦相谏，关云长必须在“情”、“义”之间作出抉择！ </p>', '', '', null, '0.00', '12', '张', '0', '0', '0', '99', 'upload/2011/05/27/20110527032034738_175_175.png', 'upload/2011/05/27/20110527032034738_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('131', '松下灯具 松下吸顶灯32W系列 HAC9055E 新品', null, '186', '270.00', '330.00', '2011-05-27 15:22:07', '2012-05-27 15:22:09', '2011-05-27 15:23:13', '100', 'upload/2011/05/27/20110527035716508.jpg', '0', '<img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527152252_19742.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527152259_35633.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527152305_13177.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527152312_27460.jpg\" border=\"0\" />', '', '', null, '0.00', '5', '', '50', '0', '0', '99', 'upload/2011/05/27/20110527035716508_175_175.jpg', 'upload/2011/05/27/20110527035716508_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('132', '福尔摩斯侦探电影集', null, '185', '48.80', '122.40', '2011-05-27 15:29:40', '2012-05-27 15:29:42', '2011-05-27 15:30:49', '99', 'upload/2011/05/27/20110527033023491.png', '0', '<h2 class=\"mt\" align=\"left\">编辑推荐</h2>\r\n<div class=\"con\" align=\"left\">    在这个地球上，有三个人因歇洛克·福尔摩斯而遐尔闻名：华生、柯南·道尔和杰锐莱·布莱特。三个人，贡献出三个福尔摩斯：华生嘴里的福尔摩斯、柯南·道尔笔下的福尔摩斯和杰锐莱·布莱特扮演的福尔摩斯。 <br />\r\n    《福尔摩斯侦探电影集》通过华生的嘴与柯南·道尔的笔，我们想像福尔摩斯，而杰锐莱·布莱特堪称完美的精彩演绎，让我们丰富的想象变成丰富的真实。作为一部深入人心，精彩绝伦的福尔摩斯探案剧集，欣赏它，无须太多理由。四个字，就刚刚好：不睹不快。 </div>\r\n<div class=\"more\" align=\"left\"><a>·查看全部&gt;&gt;</a></div>\r\n<div class=\"mt\" align=\"left\">\r\n<h2>内容简介</h2>\r\n</div>\r\n<div class=\"mc\" align=\"left\">\r\n<div style=\"width:492px;height:582px;\" class=\"con\">    《福尔摩斯侦探电影集》BR首部福尔摩斯电影是福克斯公司拍摄的《巴斯克维尔猎犬》，开始了与他的”华生”长达7年的合作生涯。在Basil完成《历险记》之后。环球电影公司也邀请Basil主演了12部福尔摩斯电影。柯南道尔爵士创造了夏洛克·福尔摩斯Basil以鲜明硬朗的外形和冷峻孤傲的举止。重塑了福尔摩斯在人们心目中神秘而自负的形象。保持着逻辑推理方面极其权威的地位。并使得后来者在演绎福尔摩斯时不得不被拿来和Basil做比较。<br />\r\n    <br />\r\n    01 巴斯克维尔猎犬：<br />\r\n    片长：79分钟；色彩：黑白；配音：英语（DD2.0）；字幕：中文/英文/无字幕；银幕比例：1.33：1<br />\r\n    讲述了传说中被喻为魔鬼化身的雨果巴斯克维尔爵士生性凶残，就连他遗留下来的猎犬也被相信是来自地狱，他甚至对巴斯克维尔家爵位继承人埋下诅咒，受害者包括在庄园湿地上心脏病发作而逝世的查尔斯爵士。命案发生后，大侦探福尔摩斯的助手华生奉命前来调查及保护新爵位继承人亨利。当众人以为发生在亨利身上的一连串不幸是凶兆时，头脑精明的福尔摩斯早已洞悉一切……<br />\r\n    <br />\r\n    02 恐怖之声：<br />\r\n    片长：65分钟；色彩：黑白；配音：英语（DD2.0）；字幕：中文/英文/无字幕；银幕比例：1.33：1<br />\r\n    <br />\r\n    03 秘密武器：<br />\r\n    片长：68分钟；色彩：黑白；配音：英语（DD2.0）；字幕：中文/英文/无字幕；银幕比例：1.33：1<br /></div>\r\n</div>', '', '', null, '0.00', '50', '张', '0', '0', '0', '99', 'upload/2011/05/27/20110527033023491_175_175.png', 'upload/2011/05/27/20110527033023491_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('99', '莉兰秀人 限时折扣 促销 夏季 新款真丝连衣裙', 'SD00000000000099', '151', '298.00', '368.00', '2011-05-27 11:02:27', '2012-05-27 11:02:29', '2011-05-27 11:08:36', '460', 'upload/2011/05/27/20110527110445620.jpg', '0', '<img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527110850_13444.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527110858_53385.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527111202_67431.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527111210_96701.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527111216_57010.jpg\" border=\"0\" />', '', '', null, '0.00', '5', '', '0', '0', '0', '99', 'upload/2011/05/27/20110527110445620_175_175.jpg', 'upload/2011/05/27/20110527110445620_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:27:\"浅灰色,白色,粉红色,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:13:\"S,M,L,XL,XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('77', 'iphone 4代 (32G) 苹果iphone 4大陆行货带发票全国联保', 'SD00000000000077', '154', '4799.00', '4999.00', '2011-05-26 14:01:13', '2011-06-11 14:01:15', '2011-05-26 14:03:36', '700', 'upload/2011/05/26/20110526020153653.jpg', '0', '', '苹果 iphone4', 'iphone 4代 (32G) 苹果iphone 4大陆行货带发票全国联保', null, '0.00', '470', '', '24', '0', '0', '99', 'upload/2011/05/26/20110526020153653_175_175.jpg', 'upload/2011/05/26/20110526020153653_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:80:\"upload/2011/05/26/20110526105558440.gif,upload/2011/05/26/20110526105352343.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('79', '摩托罗拉 Defy me525 正品行货 机打发票 送硅胶套', 'SD00000000000079', '154', '2359.00', '2599.00', '2011-05-26 14:42:08', '2011-06-11 14:42:10', '2011-05-26 14:43:36', '799', 'upload/2011/05/26/20110526022525607.jpg', '0', '<p style=\"text-align:left;text-indent:21pt;\"><span style=\"font-family:\'宋体\';color:#e53333;\">凡在本店购买</span><span style=\"color:#e53333;\">ME525</span><span style=\"font-family:\'宋体\';color:#e53333;\">手机的均送运动水壶一个，数量有限，亲们抓紧时间抢购，非常感谢亲们的支持！</span></p>\r\n<p style=\"text-align:left;text-indent:21pt;\"><span style=\"font-family:\'宋体\';\">摩托罗拉</span><span>Defy</span><span style=\"font-family:\'宋体\';\">（行货型号</span><span>ME525</span><span style=\"font-family:\'宋体\';\">）目前受到了很多用户的关注，与以往三防手机不同的是，关注它的用户不再局限于野外工作者或者登山爱好者，更多的是一些普通的手机消费者，当然这与摩托罗拉</span><span>Defy</span><span style=\"font-family:\'宋体\';\">时尚的外形设计和</span><span>Android</span><span style=\"font-family:\'宋体\';\">系统是有很大关系的。</span></p>\r\n<p> <img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526155605_48512.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526155613_70839.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526155618_39322.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526155624_61935.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526155630_49149.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526155637_84045.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526155644_27479.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526155650_64769.jpg\" alt=\"\" border=\"0\" /></p>', '摩托罗拉 defy me525', '摩托罗拉 Defy me525 正品行货 机打发票 送硅胶套', null, '0.00', '230', '', '26', '0', '0', '99', 'upload/2011/05/26/20110526022525607_175_175.jpg', 'upload/2011/05/26/20110526022525607_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:80:\"upload/2011/05/26/20110526105352343.gif,upload/2011/05/26/20110526105558440.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('100', '兰蔻智能愉悦臻白晚霜', 'SD00000000000100', '168', '850.00', '900.00', '2011-05-27 11:20:33', '2011-09-30 11:20:35', '2011-05-27 11:21:56', '100', 'upload/2011/05/27/20110527112145724.png', '0', '<p><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527112234_76961.png\" alt=\"\" border=\"0\" height=\"492\" width=\"424\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527112244_40053.png\" border=\"0\" /></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">【名称规格】智能愉悦臻白晚霜</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\">/50ML<br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【包　　装】塑封</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【产　　地】法国</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【适用年龄】</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\">18</span><span style=\"font-family:\'宋体\';font-size:16pt;\">岁以上</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【适用肌肤】<span>所有肤质</span></span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【质</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\">    <span> </span></span><span style=\"font-family:\'宋体\';font-size:16pt;\">地】霜状</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【特点功效】夜间深度美白，更轻柔修护肌肤，增强肌肤修复能力并有效淡斑。</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">睡眠新生焕白：在睡眠中为肌肤源源递送臻白能量。每天清晨，肤质仿若白瓷般细腻光滑，第一眼可见肌肤新生的愉悦。</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【使用方法】每晚临睡前，于精华之后，取适量晚霜涂抹于脸部与颈部，并轻轻按摩</span></p>', '', '', null, '50.00', '5', '', '37', '0', '0', '99', 'upload/2011/05/27/20110527112145724_175_175.png', 'upload/2011/05/27/20110527112145724_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('82', '诺基亚5230XM 5230 3G手机 全国联保 送礼包', 'SD00000000000082', '154', '1088.00', '1199.00', '2011-05-26 14:57:41', '2011-06-11 14:57:43', '2011-05-26 15:05:13', '999', 'upload/2011/05/26/20110526030250202.jpg', '0', '<p><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526155934_27344.jpg\" alt=\"\" border=\"0\" /></p>\r\n<p></p>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">产品参数</span></strong></div>\r\n<div style=\"text-align:left;\"><strong><span class=\"Apple-style-span\" style=\"font-weight:normal;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">尺寸</span></strong></span></strong></div>\r\n<strong> </strong> <div style=\"text-align:left;\">机型：直板触控设备</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">尺寸：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">111 x51.7 x 14.5/15.5 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">毫米</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">重量：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">113 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">克</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">不含触控笔</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">重量：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">115 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">克</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">含触控笔</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">体积：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">78 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">立方厘米</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">不含触控笔</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)/83 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">立方厘米</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">含触控笔</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span></div>\r\n<div style=\"text-align:left;\">具有触觉反馈的响应触摸屏</div>\r\n<div style=\"text-align:left;\">加速计，用于自动旋转</div>\r\n<div style=\"text-align:left;\">距离传感器，用于省电和防止意外碰触</div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">显示屏和</span></strong><strong><span style=\"font-size:13.5pt;\"> 3D</span></strong></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">尺寸：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">3.2 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">英寸</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">分辨率：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">640 x360 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">像素</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (nHD)</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">，图片比例</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> 16:9</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">最高支持</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> 1,670</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">万色</span></span></div>\r\n<div style=\"text-align:left;\">全触控显示屏</div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">按键和输入法</span></strong></div>\r\n<div style=\"text-align:left;\">触摸屏</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">专门用于照相</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">/</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">摄像机、音量、电源、发送</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">/</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">结束和应用程序启动</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">菜单</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">) </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">的按键，还有可访问音乐、多媒体资料、视频中心以及网络浏览器的多媒体栏触控按键</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">实现暂停</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">/</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">播放、前进及后退的主屏幕音乐插件</span></span></div>\r\n<div style=\"text-align:left;\">声控命令</div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">颜色和外壳</span></strong></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">标准销售包装内</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">?</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">目裳</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">⊙</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">丈</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">?</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">- </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">白色</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">/</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">粉红色</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">- </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">白色</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">/</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">蓝色</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">- </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">白色</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">/</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">白色</span></span></div>\r\n<p style=\"text-align:left;margin-left:0cm;\"><span style=\"font-size:10.5pt;color:#404040;\">可更换的彩色电池外壳</span></p>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">插孔</span></strong></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:10.5pt;\">Micro-USB </span><span style=\"font-size:10.5pt;color:#404040;\">插孔、高速</span><span style=\"font-size:10.5pt;\"> USB 2.0 </span><span style=\"font-size:10.5pt;color:#404040;\">接口</span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">3.5 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">毫米诺基亚</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> AV </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">插孔</span></span></div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">存储器</span></strong></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:10.5pt;\">microSD </span><span style=\"font-size:10.5pt;color:#404040;\">存储卡插槽，支持热插拔</span><span style=\"font-size:10.5pt;\"> (</span><span style=\"font-size:10.5pt;color:#404040;\">最高支持</span><span style=\"font-size:10.5pt;\"> 16 GB)</span><span style=\"font-size:10.5pt;color:#404040;\">，</span><span style=\"font-size:10.5pt;\"> </span><span style=\"font-size:10.5pt;color:#404040;\">附赠</span><span style=\"font-size:10.5pt;\"> 2 GB </span><span style=\"font-size:10.5pt;color:#404040;\">存储卡</span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">70 MB </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">内部动态存储空间</span></span></div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">电源</span></strong></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:10.5pt;\">1320 </span><span style=\"font-size:10.5pt;color:#404040;\">毫安时标准锂电池</span><span style=\"font-size:10.5pt;\"> BL-5J</span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">通话时间</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">最长</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">：</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">- 7 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">小时</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> (GSM)</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">- 4 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">小时</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> 18 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">分钟</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> (WCDMA)</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">待机时间</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">最长</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">：</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">- 438 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">小时</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> (GSM)</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">- 458 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">小时</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> (WCDMA)</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">视频播放时间</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">最长</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">4.6 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">小时</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (Mpeg-4)</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">，</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">3 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">小时</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (nHD)</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">音乐播放时间</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">最长</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">33 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">小时</span></span></div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">通信和导航</span></strong></div>\r\n<div style=\"text-align:left;\">工作频率</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">WCDMA 900/2100</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#000000;\">、</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">GSM/EDGE 850/900/1800/1900</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">可在各</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> GSM </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">频段间自动切换</span></span></div>\r\n<div style=\"text-align:left;\">航班模式</div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">数据网络</span></strong></div>\r\n<div style=\"text-align:left;\">CSD</div>\r\n<div style=\"text-align:left;\">HSCSD</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:10.5pt;\">GPRS/EGPRS </span><span style=\"font-size:10.5pt;color:#404040;\">等级</span><span style=\"font-size:10.5pt;\"> Class B</span><span style=\"font-size:10.5pt;color:#404040;\">，多时隙等级</span><span style=\"font-size:10.5pt;\"> class 32</span><span style=\"font-size:10.5pt;color:#404040;\">，最高速率</span><span style=\"font-size:10.5pt;\"> 177/296 kbps (</span><span style=\"font-size:10.5pt;color:#404040;\">下行</span><span style=\"font-size:10.5pt;\">/</span><span style=\"font-size:10.5pt;color:#404040;\">上行</span><span style=\"font-size:10.5pt;\">)</span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">EDGE </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">等级</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> class B</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">，多时隙等级</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> class 32</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">，最高速率</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> 177/296 kbps (</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">下行</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">/</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">上行</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">WCDMA 2100</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">，分组交换域最高速率为</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> 384/384 kbps (</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">上行</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">/</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">下行</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">电路交换域最高速率为</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> 64 kbps</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">HSDPA </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">第</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> 6 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">类，最高速率</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> 3.6 Mbps (</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">下行</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">支持</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">TCP/IP</span></span></div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">本地连接和同步</span></strong></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">蓝牙</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> 2.0 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">版</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">- </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">蓝牙模式：</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">A2DP </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">和</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> AVRCP</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">支持</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> MTP (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">移动传输协议</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span></div>\r\n<div style=\"text-align:left;\">可直接在兼容图片打印机上进行打印</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">支持使用诺基亚</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> PC </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">套件进行</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> OVI </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">同步</span></span></div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">通话功能</span></strong></div>\r\n<div style=\"text-align:left;\">内置免提扬声器</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">自动应答</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">与耳机或车载套件配合使用</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span></div>\r\n<div style=\"text-align:left;\">任意键接听</div>\r\n<div style=\"text-align:left;\">呼叫等待、通话保留、呼叫转接</div>\r\n<div style=\"text-align:left;\">通话计时</div>\r\n<div style=\"text-align:left;\">记录已拨电话、已接来电和未接来电</div>\r\n<div style=\"text-align:left;\">自动重拨</div>\r\n<div style=\"text-align:left;\">单键拨号</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">声控拨号：非特定语者拨号和声控命令</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (SIND)</span></span></div>\r\n<div style=\"text-align:left;\">支持固定拨号功能</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">振动提示</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">内部</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">，同时伴有触觉反馈</span></span></div>\r\n<div style=\"text-align:left;\">侧面音量键</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">静音</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">/</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">取消静音</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">名片夹栏，最多包含</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> 20 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">位联系人，其中包括联系人的图像和通讯记录</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">短信息、电子邮件和网络订阅源</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span></div>\r\n<div style=\"text-align:left;\">通话铃声</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">支持电话会议</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">最多</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> 6 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">名与会者</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span></div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">信息功能</span></strong></div>\r\n<div style=\"text-align:left;\">短信息</div>\r\n<div style=\"text-align:left;\">同时删除多条短信息</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">MMS 1.3 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">版，支持最大</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> 100 kb </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">的信息</span></span></div>\r\n<div style=\"text-align:left;\">自动调整彩信图像大小</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">诺基亚</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">Xpress </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">声音信息</span></span></div>\r\n<div style=\"text-align:left;\">短信息和彩信共用收件箱</div>\r\n<div style=\"text-align:left;\">信息收件人列表</div>\r\n<div style=\"text-align:left;\">广播信息</div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">电子邮件</span></strong></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">支持的协议：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">IMAP</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">、</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">POP </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">和</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> SMTP</span></span></div>\r\n<div style=\"text-align:left;\">支持电子邮件附件</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">支持</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> OMA </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">电子邮件通知功能</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">预装</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> Mailfor Exchange 2008</span></span></div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">网络浏览</span></strong></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">支持的标记语言：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">HTML</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">、</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">XHTML</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">、</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">WML</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">支持的协议：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">HTTP</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">、</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">WAP</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">、</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">JavaScript</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">支持</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">TCP/IP</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">OSS </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">浏览器</span></span></div>\r\n<div style=\"text-align:left;\">诺基亚移动搜索</div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;\">A-GPS </span></strong><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">和定位</span></strong></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">内置</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> A-GPS</span></span></div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">图像和声音</span></strong></div>\r\n<div style=\"text-align:left;\">摄影</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">200 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">万像素照相</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">/</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">摄像机</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">图像格式：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">JPEG</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">CMOS </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">传感器</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">3 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">倍数码变焦</span></span></div>\r\n<div style=\"text-align:left;\">白平衡模式：自动、晴天、阴天、白炽灯、荧光灯</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">中央重点测光自动曝光；曝光补偿：</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">+2 ~ -2EV</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">，</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">0.5 </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">间隔</span></span></div>\r\n<div style=\"text-align:left;\">色调模式：普通、怀旧（棕褐色）、黑白、逼真、负片</div>\r\n<div style=\"text-align:left;\">专用拍摄键</div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">横向</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">水平方向</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">) </span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">模</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">??</span></span></div>\r\n<div style=\"text-align:left;\">设备内置照片编辑器</div>\r\n<p style=\"margin-left:0cm;\"></p>\r\n<div style=\"text-align:left;\"><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">视频</span></strong></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">主照相</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;\">/</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">摄像机</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">- </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">视频录制支持：最高</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> 640 x 480 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">像素、最高每秒</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> 30 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">帧</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">高品质电视效果</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">；最高</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> 640 x 352 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">像素、最高每秒</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> 30 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">帧</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">宽屏效果</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">)</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">；最高</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> 320 x 240 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">像素、最高每秒</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> 30 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">帧</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">/15 </span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">帧</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\"> (</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">高品质</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;\">/</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:10.5pt;color:#404040;\">普通品质电子邮件效果</span>&lt;</span></div>', '', '', null, '0.00', '100', '', '27', '0', '0', '99', 'upload/2011/05/26/20110526030250202_175_175.jpg', 'upload/2011/05/26/20110526030250202_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:200:\"upload/2011/05/26/20110526105401935.gif,upload/2011/05/26/20110526105558440.gif,upload/2011/05/26/20110526105538833.gif,upload/2011/05/26/20110526105552192.gif,upload/2011/05/26/20110526105352343.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('101', 'channel夏奈尔奢华精粹活肤乳霜', 'SD00000000000101', '168', '3000.00', '3800.00', '2011-05-27 11:26:42', '2011-09-30 11:26:44', '2011-05-27 11:27:56', '99', 'upload/2011/05/27/20110527112724158.png', '0', '<p><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527112814_13353.png\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527112912_41865.png\" alt=\"\" border=\"0\" height=\"293\" width=\"394\" /></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">【名称规格】奢华精粹活肤乳霜</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\">/50g<br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【包　　装】塑封</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【产　　地】法国</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【适用年龄】</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\">18</span><span style=\"font-family:\'宋体\';font-size:16pt;\">岁以上</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【适用肌肤】<span>所有肤质</span></span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【质</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\">    <span> </span></span><span style=\"font-family:\'宋体\';font-size:16pt;\">地】霜状</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【特点功效】</span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">前所未有的抗老化功效，肌肤紧实度提升，促进胶原蛋白和糖蛋白的合成，令肌肤饱满，充满弹性。减少皱纹和细纹、减少法令纹，持久密集的润泽功效增加肌肤防御屏障功能，肌肤持久舒适水润。改善肌肤光泽度，从根源处令肌肤由内而外散发健康光泽。改善肌肤均匀度，能抑制过的黑色素的形成，使肤色白皙明亮。</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【使用方法】每日早晚肌肤清洁后均匀涂抹于面部</span></p>', '', '', null, '50.00', '50', '', '39', '0', '0', '99', 'upload/2011/05/27/20110527112724158_175_175.png', 'upload/2011/05/27/20110527112724158_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('134', '高清美剧 反恐24小时', null, '185', '220.00', '340.00', '2011-05-27 15:46:40', '2012-05-27 15:46:42', '2011-05-27 15:47:25', '99', 'upload/2011/05/27/20110527035428466.jpg', '0', '<p align=\"left\"><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527154831_11686.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527154840_61786.png\" border=\"0\" /></p>\r\n<p align=\"left\">碟片数目：13张 （1-8季）</p>\r\n<p align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">地区：美国　　　<span><br /></span>类型：剧情<span>/</span>惊险类连续剧<span><br /></span>出品：<span>FOX<br /></span>格式：高清<span>R M V B</span></span></p>\r\n<p align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">发音：英语原声发音</span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">字幕：中英双语字幕</span></p>\r\n<span style=\"font-family:\'宋体\';font-size:12pt;\"><span> </span></span><p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">剧情介绍</span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">第一季：</span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">《反恐<span>24</span>小时》第一季故事开始于凌晨十二时，主角美国政府反恐怖组织成员包杰克（<span>Jack Bauer</span>）正于妻子包达丽（<span>Teri Bauer</span>）和女儿包金帕（<span>Kimberly Bauer</span>）在家中，一切如常。未料金帕偷偷离开，当杰克和妻子发现金帕又跑在外时，杰克突然接到组织急召，原來组织收到消息，有一恐怖组织正进行暗杀总统候选人柏大卫（<span>Da vid Palmer</span>）的行动。反恐怖组织上下顿时气氛紧张，杰克上司更叮嘱杰克要秘密进行调查，更不可随便泄露行踪；因为他怀疑组织內部可能暗藏著奸细，而且，数目可能不只一个<span>……<br /><br /></span></span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">第二季：<span><br /></span>《反恐<span>24</span>小时》第二季于prefix = st1 ns = \"urn:schemas-microsoft-com:office:smarttags\"<span>2002</span>年<span>10</span>月<span>29</span>日开始播映，<span>2003</span>年<span>5</span>月<span>20</span>日放最后一集。在第二季中，失去妻子的杰克鲍尔与女儿生活刚刚恢复平静，已经入主白宫的大卫帕尔默却要请他出山，解决另外一桩恐怖危机<span>……<br /><br /></span></span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">第三季：</span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">《反恐<span>24</span>小时》第三季跟第二季时空相隔三年，反恐小组的托尼跟米歇尔结婚了，杰克的女儿金加入了反恐小组当电脑分析员，跟父亲下属切斯发生了感情；令人意外的是杰克为调查毒贩当卧底不幸染上毒瘾；总统帕尔玛康复后身边多了个私人医生女友，而总统的弟弟韦恩则成为他的得力助手，面对连任的压力，又要化解生化危机<span>……</span></span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"> </p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">第四季：</span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">《反恐<span>24</span>小时》第四季中鲍尔戒掉了第三季中染上的毒瘾，离开了反恐小分队（<span>CTU</span>），开始为美国国防部长詹姆斯<span>·</span>海勒（威廉<span>·</span>德万扮演）工作。鲍尔的敌人主要是一对来自中东的夫妇，他们酝酿着全新的邪恶计划<span>……</span></span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"> </p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">第五季：</span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">《反恐<span>24</span>小时》第五季剧情大致是这样：美国总统洛根准备与俄罗斯总统签署一份关于反恐怖主义的条约，而俄罗斯的恐怖分子试图阻止条约的签订，他们在洛杉矶附近一个机场劫持了人质。此时杰克<span>·</span>鲍尔已隐姓埋名成为一个石油工人，本可以在一个小城镇里安静地生活下去，却又不由自主地卷入了这起恐怖事件<span>……</span></span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"> </p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">第六季：</span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">《反恐<span>24</span>小时》第六季中新闻报道，美国十座城市同时遭到恐怖分子的炸弹袭击，证据显示可能是中东恐怖组织所为。韦恩总统和中方进行交涉，换回了正关押在中国的杰克<span>·</span>鲍尔，打算利用他来作诱饵钓出来自中东的恐怖分子阿萨德。但出人意料的是阿萨德只是一只替罪羊，陷害他的法耶德已经掌握了五枚苏制核弹头，企图摧毁美国的重要城市，杰克临危受命，展开了对核弹头的搜寻，然而就在此时，一刻核弹头被引爆，蘑菇云升起在杰克的视野里<span>……</span></span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"> </p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">第七季：</span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">《反恐<span>24</span>小时》第七季的故事发生在华盛顿特区，时间设定在第六季反恐局解散、<span>Bauer</span>受审的四年后。由于前同事<span>TONY ALMEIDA</span>的回归，<span>Bauer</span>的生活再次突如其来地被打破。同时，新当选总统<span>ALLISON TAYLOR</span>与白宫总参谋长<span>ETHAN KANIN</span>和第一先生<span>HENRY TAYLOR</span>共同并肩，为祖国而战。虽然反恐局已经不复存在，但另一场惊天大事件让<span>CHLOE O\'BRIAN</span>和<span>BILL BUCHANAN</span>重返战场<span>……</span></span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"> </p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">第八季：</span></p>\r\n<p style=\"text-align:left;margin:0cm 0cm 0pt;\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:12pt;\">《<a><span style=\"color:#000000;\">反恐<span>24</span>小时</span></a>》第八季的故事在第七季数月后，地点转到纽约，剧情紧承前季。第七季之后，反恐小组<span>CTU</span>恢复，纽约分部由<span>Brain Hastings</span>主管。<span>Chloe O\'Brain</span>来到这里担任技术员。其他员工还有技术员<span>Dana Walsh</span>和<span>Arlo Glass</span>，以及外勤主管<span>Cole Ortiz</span>。<span>Jack Bauer</span>也已康复，在纽约与女儿与孙女共度了一段幸福时光，但好景不长，雇佣兵<span>Victor</span>找到<span>Jack</span>，告知了一项恐怖分子的阴谋<span>……</span></span></p>', '', '', null, '0.00', '50', '张', '0', '0', '0', '99', 'upload/2011/05/27/20110527035428466_175_175.jpg', 'upload/2011/05/27/20110527035428466_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('97', 'Biotherm碧欧泉矿泉活泉爽肤洁面乳|洗面奶', 'SD00000000000097', '0', '380.00', '420.00', '2011-05-27 10:51:54', '2011-09-30 10:51:58', '2011-05-27 10:53:50', '96', 'upload/2011/05/27/20110527105307406.png', '0', '<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\"><span style=\"font-family:\'宋体\';font-size:16pt;\"><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527105529_56799.png\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527105543_51311.png\" alt=\"\" border=\"0\" height=\"608\" width=\"448\" /></span></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\"> </p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">【名称规格】碧欧泉锌元素矿泉爽肤洁面霜</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\">150ML (</span><span style=\"font-family:\'宋体\';font-size:16pt;\">中混合</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\">)<br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【包　　装】全新无外盒</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\">,</span><span style=\"font-family:\'宋体\';font-size:16pt;\">瓶口有塑封</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【产　　地】摩纳哥</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【适用年龄】</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\">18</span><span style=\"font-family:\'宋体\';font-size:16pt;\">岁以上</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【适用肌肤】适合中性，混合性肌肤使用！</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【质</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\">    </span><span style=\"font-family:\'宋体\';font-size:16pt;\">地】霜状</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【特点功效】</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">浅绿色的霜状质地，能迅速产生幼滑轻盈的泡沫，洁肤过程清爽舒适，能轻易冲洗干净。用后使肌肤恢复晶莹洁净，并为更好地吸收其他护肤品作好最佳准备。</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【使用方法】</span><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">每天早上及晚上，以清水沾湿脸部肌肤，把适量产品放于手心内，混上清水起泡后，轻轻推匀到面部和颈部，避开眼睛，最后以清水彻底洗凈。</span></p>', '', '', null, '150.00', '5', 'ml', '34', '0', '0', '99', 'upload/2011/05/27/20110527105307406_175_175.png', 'upload/2011/05/27/20110527105307406_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('98', '倩碧洁面皂', null, '0', '120.00', '150.00', '2011-05-27 11:00:45', '2011-09-01 11:00:47', '2011-05-27 11:02:11', '99', 'upload/2011/05/27/20110527110140751.png', '0', '<p><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527110237_40075.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527110244_51152.png\" border=\"0\" /></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">【名称规格】倩碧洁面皂</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">/<span>50g</span><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【包　　装】带皂盒</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【产　　地】<span>美国</span></span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【适用年龄】</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">18</span><span style=\"font-family:\'宋体\';font-size:16pt;\">岁以上</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【适用肌肤】<span>适合干至中性皮肤</span></span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【质</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">    <span> </span></span><span style=\"font-family:\'宋体\';font-size:16pt;\">地】皂类</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【特点功效】</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">CLINIQUE</span><span style=\"font-family:\'宋体\';font-size:16pt;\">旗下的皮肤学家们一致认为，洗面皂具备最佳清洁功效。他们所创制的洗面皂及全新液质配方，能保存肌肤的天然脂质保护层，绝不使肌肤干燥；同时帮助表面的枯萎皮屑松脱，为</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">Clarifying Lotion</span><span style=\"font-family:\'宋体\';font-size:16pt;\">洁肤水的清理皮层步骤作出最佳准备。</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【使用方法】<span>用温水把洗面皂在双掌揉出泡沫，涂于面部和颈部，轻轻按摩，冲水三至五下，即可印干肌肤。每天使用两次。</span></span></p>', '', '', null, '50.00', '2', '', '35', '0', '0', '99', 'upload/2011/05/27/20110527110140751_175_175.png', 'upload/2011/05/27/20110527110140751_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('87', '金士顿TF卡 Micro SD 8G内存卡 存储卡 Class4 行货 带卡套', null, '153', '69.00', '69.00', '2011-05-26 15:44:01', '2011-06-11 15:44:03', '2011-05-26 15:44:32', '100', 'upload/2011/05/26/20110526035236248.jpg', '0', '<p></p>\r\n<div style=\"text-align:left;\"><span><span style=\"font-size:9pt;color:#333333;\">microSDHC</span></span><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">卡拥有高达</span></span><span><span style=\"font-size:9pt;color:#333333;\">4GB</span></span><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">的大量存储空间，可以存储更多音乐、视频、图片、游戏以及其它信息，从而满足您在当今无限移动世界中的娱乐需求。</span></span><span><span style=\"font-size:9pt;color:#333333;\"> </span></span><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">让您尽享创新移动设备带来的极致体验。</span></span><span><span style=\"font-size:9pt;color:#333333;\"> </span></span><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">金士顿的</span></span><span><span style=\"font-size:9pt;color:#333333;\">microSDHC</span></span><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">卡使用最新的</span></span><span><span style=\"font-size:9pt;color:#333333;\">Class 4</span></span><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">速度标准，确保最低数据传输率为</span></span><span><span style=\"font-size:9pt;color:#333333;\">4MB/</span></span><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">秒，为支持</span></span><span><span style=\"font-size:9pt;color:#333333;\">microSDHC</span></span><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">的设备带来了最出色的性能。</span></span></div>\r\n<div style=\"text-align:left;\"><br /></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span style=\"color:#333333;font-size:9pt;\">microSDHC</span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">卡与当前标准的</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;color:#333333;\">microSD</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">卡在实际尺寸上完全一样，其设计符合</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;color:#333333;\">2. 00</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">版</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;color:#333333;\"> SD</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">规范标准，只有使用</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;color:#333333;\">microSDHC</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">的机器设备才能识别。</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;color:#333333;\"> </span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">如果配合内置的适配器，该卡还可以作为全尺寸</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;color:#333333;\">SDHC</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">卡使用。</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;color:#333333;\"> </span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">为确保设备的兼容性，请认准主机设备（如电话、</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;color:#333333;\">PDA</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">和相机）上的</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;color:#333333;\">microSDHC </span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">或</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;color:#333333;\">SDHC</span></span></span><span class=\"Apple-style-span\" style=\"color:#000000;font-size:medium;\"><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">商标。</span></span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"color:#333333;\"><span class=\"Apple-style-span\" style=\"font-size:12px;\"><br /></span></span></div>\r\n<p style=\"text-align:left;\"><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">在移动世界的任何角落，您都可以完全信赖和使用金士顿的</span></span><span><span style=\"font-size:9pt;color:#333333;\">microSDHC</span></span><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">卡。</span></span><span><span style=\"font-size:9pt;color:#333333;\"> </span></span><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">所有产品都百分之百通过了测试，并且终身保固，提供免费技术支持。</span></span></p>\r\n<p><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\"><br /></span></span></p>\r\n<p><span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\"><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526154535_35367.jpg\" alt=\"\" border=\"0\" /><br /></span></span></p>\r\n<br />', 'kingston 金士顿', '', null, '0.00', '6', '', '28', '0', '0', '99', 'upload/2011/05/26/20110526035236248_175_175.jpg', 'upload/2011/05/26/20110526035236248_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('125', '艾薇儿：酷到骨子里（CD）', null, '184', '13.50', '31.00', '2011-05-27 14:46:40', '2012-05-27 14:46:42', '2011-05-27 14:48:11', '100', 'upload/2011/05/27/20110527024759294.png', '0', '<p align=\"left\">演唱者/演奏者： 艾薇儿（Avril Lavigne） </p>\r\n<div align=\"left\">出 版 社：上海音像出版社 </div>\r\n<p align=\"left\">地    区：欧美 </p>\r\n<p align=\"left\">语    言：英语 碟 片 数：1 介    质：CD </p>\r\n<h2 class=\"mt\" align=\"left\">编辑推荐</h2>\r\n<div class=\"con\" align=\"left\">    你以为她已经够酷了吗？她的酷现在才开始！空降日本公信榜史上最年轻西洋冠军女歌手，继97年玛丽亚凯莉[美丽花蝴蝶]后，日本公信榜七年来最畅销女歌手。 </div>\r\n<div class=\"more\" align=\"left\"><a>·查看全部&gt;&gt;</a></div>\r\n<div class=\"mt\" align=\"left\">\r\n<h2>内容简介</h2>\r\n</div>\r\n<div class=\"con\" align=\"left\">\r\n<div>　　《艾薇儿：酷到骨子里》你以为她已经够酷了吗？她的酷现在才开始！空降日本公信榜史上最年轻西洋冠军女歌手，继97年玛丽亚凯莉《美丽花蝴蝶》后，日本公信榜七年来最畅销女歌手！美与酷势不两立，强悍与冷调矛盾冲突，但在她的身上全部成立，经过两年的洗礼，在她身上积聚的新能量就要一触即发，你以为她已经够酷了吗？你错了，她的酷现在才开始！</div>\r\n<div>　　艾薇儿于2002年发行的首张专辑《展翅高飞》， 创下全球近一千五百万张惊人的专辑销售佳绩，并且荣获八项格莱美奖提名在全球乐迷心目中，建立了一个不随波逐流、特立独行的清晰印象，一举将艾薇儿推举为新生代最具代表性的女性新声音以及新样貌。　　　　</div>\r\n<div>　　经过两年的磨练洗礼，在她身上积聚的新能量，在其全新力作“Under My Skin”中一触即发。这张专辑以非常戏剧性的歌曲“Take Me Away”以及“Together”这两首歌曲作为开场，之后的“He Wasn\'t”其中的吉他主奏极为精彩。“Who Knows”这一首歌曲，更叫人忍不住的跟着摇头，融入节奏之中。而“Freak Out”这一首单曲，更是带领着听众天旋地转，猛暴性的摇滚动力保证让大家大呼过瘾！而一些较为慢板，表达情感、略带忧虑的单曲，像是 “Forgotten”以及“Nobody\'s Home”，也将艾薇儿内心深层黑暗的那一面，用音符以及其寓意，均呈现在大家面前</div>\r\n</div>\r\n<div class=\"more\" align=\"left\"><a>·查看全部&gt;&gt;</a></div>\r\n<div class=\"mt\" align=\"left\">\r\n<h2>曲目</h2>\r\n</div>\r\n<div class=\"con\" align=\"left\">01 TAKE ME AWAY 带我走<br />\r\n02 TOGETHER 在一起<br />\r\n03 HE WASN\'T 他才不是<br />\r\n04 HOW DOES IT FEEL 什么样的感觉<br />\r\n05 MY HAPPY ENDING 快乐的结局<br />\r\n06 NOBODY\'S HOME 谁来守候<br />\r\n07 FORGOTTEN 被遗忘<br />\r\n08 WHO KNOWS 谁知道<br />\r\n09 FALL TO PIECES 破碎的心<br />\r\n10 FREAK OUT 崩溃<br />\r\n11 SLIPPED AWAY 爱已不在 </div>', '', '', null, '0.00', '20', '张', '0', '0', '0', '99', 'upload/2011/05/27/20110527024759294_175_175.png', 'upload/2011/05/27/20110527024759294_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('88', '佳能 Canon/佳能ixus105is 数码相机 全国联保 正品行货', 'SD00000000000088', '155', '1199.00', '1299.00', '2011-05-26 17:00:02', '2011-06-11 17:00:04', '2011-05-26 17:01:55', '800', 'upload/2011/05/26/20110526050034797.jpg', '0', '<p></p>\r\n<div style=\"text-align:left;\"><span><span style=\"font-size:13.5pt;\">   </span></span><strong><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">伊克萨斯</span></strong><strong><span style=\"font-size:13.5pt;\">IXUS 105</span></strong><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">是一款能融入您日常生活的休闲风格机型。相比其上一代产品</span></span><span><span style=\"font-size:13.5pt;\">IXUS 95 IS</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">，无论是相机分辨率、液晶屏尺寸，还是镜头最大拍摄视角、变焦比都有了极大地改进。</span></span><span><span style=\"font-size:13.5pt;\">IXUS 105</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">采用约</span></span><span><span style=\"font-size:13.5pt;\">1210</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">万有效像素的</span></span><span><span style=\"font-size:13.5pt;\">CCD</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">感应器和</span></span><span><span style=\"font-size:13.5pt;\">DIGIC4</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">影像处理器，最高可输出</span></span><span><span style=\"font-size:13.5pt;\">4000×3000</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">分辨率的照片。</span></span><span><span style=\"font-size:13.5pt;\">23</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">万点</span></span><span><span style=\"font-size:13.5pt;\">“</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">晶炫</span></span><span><span style=\"font-size:13.5pt;\">II”</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">液晶屏的尺寸由</span></span><span><span style=\"font-size:13.5pt;\">IXUS 95 IS</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">的</span></span><span><span style=\"font-size:13.5pt;\">2.5</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">英寸增大到</span></span><span><span style=\"font-size:13.5pt;\">2.7</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">英寸，可视性得到了改善。镜头方面，支持令人期待的</span></span><span><span style=\"font-size:13.5pt;\">28mm</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">广角，镜头焦距相当于</span></span><span><span style=\"font-size:13.5pt;\">35</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">毫米照相机的</span></span><span><span style=\"font-size:13.5pt;\">28-112mm</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">，光学变焦从之前的</span></span><span><span style=\"font-size:13.5pt;\">3</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">倍提升为现在的</span></span><span><span style=\"font-size:13.5pt;\">4</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">倍，最大光圈</span></span><span><span style=\"font-size:13.5pt;\">F2.8</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">（广角）</span></span><span><span style=\"font-size:13.5pt;\">—5.9</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">（长焦），光学影像稳定器</span></span><span><span style=\"font-size:13.5pt;\">IS</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">可达到相当于提高约</span></span><span><span style=\"font-size:13.5pt;\">3</span></span><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">档快门速度的效果，能够应对用户在日常生活的拍摄需要。</span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:13.5pt;\">    IXUS 105</span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">支持</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">“</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">智慧</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">AUTO”</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">拍摄模式，其综合了面部优先、降噪、运动检测与场景检测四项技术，使相机可随时对所要拍摄的影像进行智能判断与分析，自动识别</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">18</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">种拍摄场景，并采用相对适合的方式进行拍摄，同时对所拍摄后的图像做出优化处理。晴天的户外、逆光拍摄、昏暗的室内以及微距拍摄，在这些情况下拍摄常常会因为曝光难以准确判断而导致拍出来的照片面部有阴影、主体昏暗、背景昏暗、或者高光溢出，难遂人愿。全新的</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">“</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">智慧闪光曝光</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">”</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">技术，在</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">“</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">智慧</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">AUTO”</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">拍摄模式下，相机可根据场景情况自动调控闪光曝光量等拍摄参数，有效提升闪光曝光的精准度，把每一分美丽都精致展现。新增的</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">“</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">低光照</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">”</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">模式，根据场景的不同，自动设置比</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">“</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">智慧</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">AUTO”</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">模式更高的</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">ISO</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">感光度，感光度最高可达</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">ISO 6400</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">，减弱相机抖动和被摄体模糊。该模式下图像将固定为</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">1600 x 1200</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">像素。连拍速度约</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">2.6</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">张</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">/</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">秒。</span></span></span></div>\r\n<div style=\"text-align:left;\"><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span style=\"font-size:13.5pt;\"><span>    IXUS 105</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">在外观上强调将造型处理与舒适的操作性有机结合。柔和的流线型机身设计，连续曲线表面让拍摄者拥有舒适的握持感受，兼顾美感与良好的握持性。富有光泽的铝涂层前后盖之间采用的纯色线条设计，增强了相机整体精致的小巧感。为了用户在使用时不感到疲劳，刻意将操作按键尺寸放大并在模式开关键进行了防滑处理。</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">IXUS 105</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">作为具有休闲感风格的相机，共有五种休闲颜色：新叶绿、玫瑰粉、深栗褐、晨露银、水晶蓝。相比</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;\">IXUS 130</span></span></span><span class=\"Apple-style-span\" style=\"font-size:medium;\"><span><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#404040;\">颜色的明丽，其机身色彩更显淡雅、清新，让人如沐春风，愉悦的心情便从看到相机的那一刻开始。</span></span></span></div>\r\n<img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526170257_87503.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526170306_62676.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526170313_43947.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526170318_66417.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526170324_88887.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526170329_44812.png\" alt=\"\" border=\"0\" /><br />', '', '', null, '0.00', '100', '', '29', '0', '0', '99', 'upload/2011/05/26/20110526050034797_175_175.jpg', 'upload/2011/05/26/20110526050034797_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:160:\"upload/2011/05/26/20110526105515484.gif,upload/2011/05/26/20110526105401935.gif,upload/2011/05/26/20110526105544210.gif,upload/2011/05/26/20110526105415915.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('89', '索尼 DSC-TX10 索尼数码相机TX10 2年联保 送高清线+原装座充', 'SD00000000000089', '155', '2078.00', '2199.00', '2011-05-26 17:05:29', '2011-06-11 17:05:30', '2011-05-26 17:06:25', '1600', 'upload/2011/05/26/20110526050546652.jpg', '0', '<p><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526170651_81691.jpg\" alt=\"\" border=\"0\" /></p>\r\n<p></p>\r\n<table style=\"width:100%;border:medium none;\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td colspan=\"2\" style=\"background:#ffffff none repeat scroll 0% 0%;\">  <table style=\"width:100%;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td>    <p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';\">索尼<span>TX10</span></span></b></p>\r\n    <p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-size:13.5pt;font-family:\'宋体\';color:#999999;\">参数规格</span></b></p>\r\n    </td>\r\n    <td valign=\"bottom\">    <p style=\"text-align:right;\" align=\"right\"><span style=\"font-size:9pt;font-family:\'宋体\';\">查看：更多信息或更多图片</span></p>\r\n    </td>\r\n   </tr></tbody></table></td>\r\n </tr><tr><td colspan=\"2\" style=\"background:#fff6ed none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">主要性能</span></b></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">发布日期</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">2011</span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">年<span>01</span>月</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">机身特性</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">消费，卡片，广角，<span>3D</span></span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">操作方式</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">全自动操作</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">传感器类型</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">Exmor R CMOS</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">传感器尺寸</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">（<span>1/2.3</span>）英寸</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">有效像素数</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">1620</span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">万</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">光学变焦</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">4</span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">倍</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">高清摄像</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">高清（<span>1080i</span>）</span></p>\r\n  </td>\r\n </tr><tr><td colspan=\"2\" style=\"background:#fff6ed none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">镜头特点</span></b></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">等效<span>35mm</span>焦距</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">25-100mm</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">镜头说明</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">卡尔<span>·</span>蔡司（<span>Vario-Tessar</span>）镜头，实际焦距：<span>f=4.4-17.7mm</span></span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">广角镜头</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">是</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">长焦镜头</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">否</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">镜头类型</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">潜望式</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">对焦点数</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">9</span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">点</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">最大光圈</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">F3.5-F4.6</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">变焦方式</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">电子</span></p>\r\n  </td>\r\n </tr><tr><td colspan=\"2\" style=\"background:#fff6ed none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">显示功能</span></b></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">显示屏尺寸</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">3</span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">英寸</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">像素及类型</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">92.16</span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">万像素液晶屏</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">屏幕功能</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">触摸屏</span></p>\r\n  </td>\r\n </tr><tr><td colspan=\"2\" style=\"background:#fff6ed none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">快门性能</span></b></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">快门类型</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">机械电子快门</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">快门速度</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">2-1/1600</span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">秒<span><br /></span>程序模式：<span>1-1/1600</span>秒</span></p>\r\n  </td>\r\n </tr><tr><td colspan=\"2\" style=\"background:#fff6ed none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">闪光灯</span></b></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">闪光灯类型</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">内置</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">外接闪光灯<span>(</span>热靴<span>)</span></span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">否</span></p>\r\n  </td>\r\n </tr><tr><td colspan=\"2\" style=\"background:#fff6ed none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">曝光控制</span></b></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">曝光模式</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">程序自动曝光<span>(P)</span></span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">曝光补偿</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">±2EV</span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">（<span>1/3EV</span>步长）</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">感光度</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">自动，<span>ISO 125</span>，<span>200</span>，<span>400</span>，<span>800</span>，<span>1600</span>，<span>3200</span></span></p>\r\n  </td>\r\n </tr><tr><td colspan=\"2\" style=\"background:#fff6ed none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">拍摄性能</span></b></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">防抖性能</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">光学防抖</span></p>\r\n  </td>\r\n </tr><tr><td colspan=\"2\" style=\"background:#fff6ed none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">接口性能</span></b></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">数据接口</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">USB2.0</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">视频接口</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">AV</span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">接口</span></p>\r\n  </td>\r\n </tr><tr><td colspan=\"2\" style=\"background:#fff6ed none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">电池性能</span></b></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">电池类型</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">锂电池<span>NP-BN1</span></span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">续航能力</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">250</span><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">张或<span>125</span>分钟视频（根据<span>CIPA</span>标准）</span></p>\r\n  </td>\r\n </tr><tr><td colspan=\"2\" style=\"background:#fff6ed none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">外观设计</span></b></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">外形特点</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">超薄型<span>DC</span>，大屏幕<span>DC</span>，轻巧型<span>DC</span></span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#ffffff none repeat scroll 0% 0%;\" width=\"80\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">机身颜色</span></p>\r\n  </td>\r\n  <td style=\"background:#ffffff none repeat scroll 0% 0%;\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:9pt;font-family:\'宋体\';color:#333333;\">黑色，银色，粉色，黄色，蓝色</span></p>\r\n  </td>\r\n </tr></tbody></table>', '', '', null, '0.00', '200', '', '31', '0', '0', '99', 'upload/2011/05/26/20110526050546652_175_175.jpg', 'upload/2011/05/26/20110526050546652_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:120:\"upload/2011/05/26/20110526105515484.gif,upload/2011/05/26/20110526105606611.gif,upload/2011/05/26/20110526105538833.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('90', '佳能单反数码相机EOS 550D/18-55套机 佳能550D 正品', 'SD00000000000090', '155', '4899.00', '4999.00', '2011-05-26 17:09:52', '2011-06-11 17:09:54', '2011-05-26 17:11:04', '997', 'upload/2011/05/26/20110526051016735.jpg', '0', '<img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171135_43046.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171142_46015.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171148_75736.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171154_79518.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171200_51605.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171206_29734.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171212_67277.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171218_68686.png\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171224_97110.png\" alt=\"\" border=\"0\" /><br />', '', '', null, '0.00', '480', '', '29', '0', '0', '99', 'upload/2011/05/26/20110526051016735_175_175.jpg', 'upload/2011/05/26/20110526051016735_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"82\";s:5:\"value\";s:10:\"套餐一,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"套餐\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('91', 'Nikon/尼康 D3100套机(含18-55镜头) 专业数码单反数码相机', 'SD00000000000091', '155', '4199.00', '4399.00', '2011-05-26 17:14:17', '2011-06-11 17:14:19', '2011-05-26 17:15:20', '1900', 'upload/2011/05/26/20110526051436586.jpg', '0', '<p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-size:13pt;font-family:\'宋体\';\">数码单镜反光相机</span></b><b><span style=\"font-size:13pt;\">D3100</span></b></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-family:\'宋体\';color:#000000;\">发布</span><span> : 19-08-2010</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-family:\'宋体\';color:#000000;\">入门级数码单镜反光相机，配备新型</span><span>CMOS</span><span style=\"font-family:\'宋体\';color:#000000;\">图像传感器、新型图像处理器和引导模式，方便拍摄美丽照片</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span> </span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-family:\'宋体\';color:#000000;\">主要特点：</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span> </span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#000000;\">新型</span><span>DX</span><span style=\"font-family:\'宋体\';color:#000000;\">格式</span><span>1420</span><span style=\"font-family:\'宋体\';color:#000000;\">万有效像素</span><span>CMOS</span><span style=\"font-family:\'宋体\';color:#000000;\">图像传感器和全新</span><span>EXPEED 2</span><span style=\"font-family:\'宋体\';color:#000000;\">图像处理器，可拍摄优质高清晰的图片</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>ISO 100-3200</span><span style=\"font-family:\'宋体\';color:#000000;\">，可扩展至</span><span>ISO 12800</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#000000;\">每秒约</span><span>3</span><span style=\"font-family:\'宋体\';color:#000000;\">幅连拍</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>3</span><span style=\"font-family:\'宋体\';color:#000000;\">英寸，约</span><span>23</span><span style=\"font-family:\'宋体\';color:#000000;\">万画点</span><span>LCD</span><span style=\"font-family:\'宋体\';color:#000000;\">显示屏</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#000000;\">改良的引导模式，更便于使用</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#000000;\">即时取景模式，方便用户利用显示屏为图片或短片取景和构图</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#000000;\">数码短片功能可拍摄和编辑全高清短片（</span><span>1920×1080</span><span style=\"font-family:\'宋体\';color:#000000;\">）；拍摄时，可使用</span><span>AF-F</span><span style=\"font-family:\'宋体\';color:#000000;\">（全时伺服自动对焦）模式</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#000000;\">内置场景自动选择器</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#000000;\">脸部侦测功能，最多可识别</span><span>35</span><span style=\"font-family:\'宋体\';color:#000000;\">张人脸</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#000000;\">新增独立的短片拍摄按钮和释放模式选择器，使操作更简便</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#000000;\">新的曝光补偿算法使机内</span><span>NEF</span><span style=\"font-family:\'宋体\';color:#000000;\">（</span><span>RAW</span><span style=\"font-family:\'宋体\';color:#000000;\">）处理更灵活、性能更强</span></p>\r\n<img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171556_74190.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171604_70886.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171612_76755.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526171619_17619.jpg\" alt=\"\" border=\"0\" /><br />', '', '', null, '0.00', '410', '', '30', '0', '0', '99', 'upload/2011/05/26/20110526051436586_175_175.jpg', 'upload/2011/05/26/20110526051436586_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"82\";s:5:\"value\";s:10:\"套餐一,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"套餐\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('102', 'HR赫莲娜/极致之美升华精准焕肤抗皱面膜', null, '168', '350.00', '450.00', '2011-05-27 11:33:34', '2012-05-27 11:33:36', '2011-05-27 11:34:56', '100', 'upload/2011/05/27/20110527113413959.png', '0', '<p><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527113517_75321.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527113524_32906.png\" border=\"0\" /></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">【名称规格】极致之美升华精准焕肤抗皱面膜</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">/75ML<br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【包　　装】塑封</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【产　　地】法国</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【适用年龄】</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">18</span><span style=\"font-family:\'宋体\';font-size:16pt;\">岁以上</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【适用肌肤】<span>所有肤质</span></span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【质</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">    <span> </span></span><span style=\"font-family:\'宋体\';font-size:16pt;\">地】霜状</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【特点功效】全球首款</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">“</span><span style=\"font-family:\'宋体\';font-size:16pt;\">自体细胞焕肤术</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">”</span><span style=\"font-family:\'宋体\';font-size:16pt;\">保养品，唤醒细胞内在的生长渴望。密集精护，焕亮新生。水晶啫喱，除三重剥脱因子外，更盛载几近完美的修复成分</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">——HEPES</span><span style=\"font-family:\'宋体\';font-size:16pt;\">高能蛋白酶激活因子，配合皮肤医药级活性成分高浓度</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">Urea Duo</span><span style=\"font-family:\'宋体\';font-size:16pt;\">尿素，带给肌肤婴儿般的新生柔嫩，一并加强天然防护力。</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">【使用方法】每周使用两次</span></p>', '', '', null, '75.00', '10', '', '40', '0', '0', '99', 'upload/2011/05/27/20110527113413959_175_175.png', 'upload/2011/05/27/20110527113413959_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('103', '2011年新款夏装梦特娇连衣裙 梦特娇短袖真丝连衣裙 时尚连衣裙', 'SD00000000000103', '151', '278.00', '320.00', '2011-05-27 11:24:19', '2012-05-27 11:24:22', '2011-05-27 11:40:12', '640', 'upload/2011/05/27/20110527113535353.jpg', '0', '<img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527114110_95155.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527114117_24699.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527114123_72671.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527114129_37589.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527114135_19346.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527114143_11436.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527114149_71737.jpg\" border=\"0\" />', '', '', null, '0.00', '10', '', '0', '0', '0', '99', 'upload/2011/05/27/20110527113535353_175_175.jpg', 'upload/2011/05/27/20110527113535353_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:14:\"紫色,桔色,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:9:\"S,M,L,XL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('104', '欧舒丹樱花闪亮润肤露', null, '168', '200.00', '240.00', '2011-05-27 11:43:54', '2012-05-27 11:43:57', '2011-05-27 11:44:57', '100', 'upload/2011/05/27/20110527114433106.png', '0', '<p><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527114519_99788.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527114528_27885.png\" border=\"0\" /></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">产品功效：蕴含乳木果油的乳液，迅速渗透肌肤，在表面形成折射出虹彩光泽的保湿薄膜，散发轻柔樱花香气。</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">使用方法：浴后涂于湿润肌肤上，或肌肤感觉干燥、炙热、绷紧时使用。磨砂或沐浴霜</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">- </span><span style=\"font-family:\'宋体\';font-size:16pt;\">在润肤前先行磨砂，可帮助皮肤有效吸收润肤露，并节省用量。</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><span style=\"font-family:\'宋体\';font-size:16pt;\">产地：法国</span></p>', '', '', null, '250.00', '10', '', '41', '0', '0', '99', 'upload/2011/05/27/20110527114433106_175_175.png', 'upload/2011/05/27/20110527114433106_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('105', 'The body shop美体小铺 杏仁美白滋润沐浴露', null, '168', '30.00', '58.00', '2011-05-27 11:48:26', '2012-05-27 11:48:28', '2011-05-27 11:49:03', '100', 'upload/2011/05/27/20110527115021906.png', '0', '<p><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527115131_95621.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527115138_75761.png\" border=\"0\" /></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">【规　　格】：</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">250ML</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"></span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">【产　　地】：英国</span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">【使用说明】：沐浴時，倒少许在海綿、肌肤抹布或丝瓜络尚搓揉起泡</span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">【适用肤质】：任何肤质</span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">【产品介绍】：</span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">*</span><span style=\"font-family:\'宋体\';font-size:16pt;\">不含皂基的沐浴胶，能温和且彻底的清洁肌肤，并可柔软及舒缓的感觉</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">.<br />\r\n*</span><span style=\"font-family:\'宋体\';font-size:16pt;\">质地温和，适合天天使用。</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br />\r\n*</span><span style=\"font-family:\'宋体\';font-size:16pt;\">用后使全身散发清新香味。</span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">【使用说明】：</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">*</span><span style=\"font-family:\'宋体\';font-size:16pt;\">泡澡</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">---</span><span style=\"font-family:\'宋体\';font-size:16pt;\">倒适量沐浴胶于浴缸中的水流冲积处，直接浸泡后稍加冲</span><span style=\"font-size:16pt;\"> </span><span style=\"font-family:\'宋体\';font-size:16pt;\">洗即可。</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br />\r\n*</span><span style=\"font-family:\'宋体\';font-size:16pt;\">淋浴</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\">---</span><span style=\"font-family:\'宋体\';font-size:16pt;\">取适量于沐浴海绵或洗澡毛巾上，搓揉起泡后，清洗全身</span><span style=\"font-size:16pt;\"> </span><span style=\"font-family:\'宋体\';font-size:16pt;\">即可。</span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">注意事项：不慎接触眼睛，请以大量清水冲洗。</span></p>', '', '', null, '250.00', '10', '', '42', '0', '0', '99', 'upload/2011/05/27/20110527115021906_175_175.png', 'upload/2011/05/27/20110527115021906_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('106', 'JackJones杰克琼斯略宽松腿部合体直筒牛仔裤(蓝)', 'SD00000000000106', '152', '245.00', '269.00', '2011-05-27 11:51:31', '2011-07-07 11:51:33', '2011-05-27 11:53:17', '600', 'upload/2011/05/27/20110527115206152.jpg', '0', '<table style=\"width:540pt;border:1pt outset #000000;\" border=\"1\" cellpadding=\"0\" cellspacing=\"1\" width=\"720\"><tbody><tr><td width=\"191\">  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\">Stanza Zinko Jeans BB168</span></p>\r\n  </td>\r\n </tr><tr><td>  <p style=\"text-align:center;\" align=\"center\"><b><span style=\"font-size:12pt;font-family:\'宋体\';\">产品原价</span></b></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> 349</span></p>\r\n  </td>\r\n </tr><tr><td>  <p style=\"text-align:center;\" align=\"center\"><b><span style=\"font-size:12pt;font-family:\'宋体\';\">产品颜色</span></b></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span><span style=\"font-size:12pt;font-family:\'宋体\';\">光感牛仔蓝</span></p>\r\n  </td>\r\n </tr><tr><td>  <p style=\"text-align:center;\" align=\"center\"><b><span style=\"font-size:12pt;font-family:\'宋体\';\">产品面料</span></b></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span><span style=\"font-size:12pt;font-family:\'宋体\';\">面料：<span>100%</span>棉（含微量涤纶），水洗产品</span></p>\r\n  </td>\r\n </tr><tr><td>  <p style=\"text-align:center;\" align=\"center\"><b><span style=\"font-size:12pt;font-family:\'宋体\';\">洗涤标准</span></b></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span><span style=\"font-size:12pt;font-family:\'宋体\';\">最高洗涤温度<span>30℃ </span>，缓和程序<span>;</span>不可漂白<span>;</span>悬挂晾干<span>;</span>熨斗底板最高温度<span>110℃;</span>不可干洗<span>;</span></span></p>\r\n  </td>\r\n </tr><tr><td>  <p style=\"text-align:center;\" align=\"center\"><b><span style=\"font-size:12pt;font-family:\'宋体\';\">产品特点</span></b></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span><span style=\"font-size:12pt;font-family:\'宋体\';\">略宽松，略低腰，直筒裤，腿部合体剪裁，面料偏薄，大腿根部大量猫须褶设计与后膝盖处相呼应，裤门襟是扣子设计，磨白效果十分清爽。</span></p>\r\n  </td>\r\n </tr><tr><td>  <p style=\"text-align:center;\" align=\"center\"><b><span style=\"font-size:12pt;font-family:\'宋体\';\">流行特点</span></b></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span><span style=\"font-size:12pt;font-family:\'宋体\';\">牛仔裤，一个永远流行的时尚主流单品，永远用最魅力四射的姿态出现在我们的视野里，充斥我们生活里最伟大的时尚时刻。牛仔裤百搭的性格，对一切的服饰都表现得非常随和，无论你怎么穿着都能帮助我们塑造鲜明的个性。所以，与其说生活像一条牛仔裤，不如说我们更应该像牛仔裤一样去生活在，好交又谦逊！</span></p>\r\n  </td>\r\n </tr><tr><td>  <p style=\"text-align:center;\" align=\"center\"><b><span style=\"font-size:12pt;font-family:\'宋体\';\">温馨提示</span></b></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span><span style=\"font-size:12pt;font-family:\'宋体\';\">裤门襟是扣子。</span></p>\r\n  </td>\r\n </tr></tbody></table><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527115416_96621.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527115513_73388.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527115520_92144.jpg\" alt=\"\" border=\"0\" /><br />', '', '', null, '0.00', '24', '', '20', '0', '0', '99', 'upload/2011/05/27/20110527115206152_175_175.jpg', 'upload/2011/05/27/20110527115206152_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:59:\"27(2尺),28(2尺1),29(2尺2),30(2尺3),31(2尺4),32(2尺5),\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}i:1;a:4:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:3:\"XL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('107', 'Clarins/娇韵诗 纤体精华霜第五代', null, '168', '300.00', '420.00', '2011-05-27 11:54:02', '2012-05-27 11:54:04', '2011-05-27 11:55:14', '100', 'upload/2011/05/27/20110527115452709.png', '0', '<p><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527115534_35125.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527115541_43236.png\" border=\"0\" /></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><b><span style=\"font-family:\'宋体\';font-size:14pt;\">【商品特点】：</span></b></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\">1</span><span style=\"font-family:\'宋体\';font-size:14pt;\">、肌肤触感清新、舒爽，更有弹性</span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\">2</span><span style=\"font-family:\'宋体\';font-size:14pt;\">、感受下半身肌肤紧致</span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\">3</span><span style=\"font-family:\'宋体\';font-size:14pt;\">、质地可快速吸收，不黏不腻，按摩完后不需等待立即穿衣</span><span style=\"font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><b><span style=\"font-family:\'宋体\';font-size:14pt;\">【适用群体】：</span></b></p>\r\n<p></p>\r\n <p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\">1</span><span style=\"font-family:\'宋体\';font-size:14pt;\">、想要去除顽固或成型的脂肪团、体型苗条或比较匀称的女性</span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\">2</span><span style=\"font-family:\'宋体\';font-size:14pt;\">、望完美、重塑体型和收紧身体曲线的女性</span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\">3</span><span style=\"font-family:\'宋体\';font-size:14pt;\">、寻求高效塑身产品解决新生或长期存在的脂肪团的女性</span></p>\r\n<p></p>\r\n<p style=\"margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\">4</span><span style=\"font-family:\'宋体\';font-size:14pt;\">、四季均可适用</span><span style=\"font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br /></span><b><span style=\"font-family:\'宋体\';font-size:14pt;\">【规格参数】</span></b><span style=\"font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\"><br />\r\n1</span><span style=\"font-family:\'宋体\';font-size:14pt;\">、商品容量规格：</span><span style=\"font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\">200ml<br />\r\n2</span><span style=\"font-family:\'宋体\';font-size:14pt;\">、产</span><span style=\"font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\">            </span><span style=\"font-family:\'宋体\';font-size:14pt;\">地：法国</span></p>', '', '', null, '200.00', '20', '', '43', '0', '0', '99', 'upload/2011/05/27/20110527115452709_175_175.png', 'upload/2011/05/27/20110527115452709_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('108', '专柜正品Lee2011 夏季新款 砂洗男款直筒牛仔裤五分短裤', 'SD00000000000108', '152', '239.00', '299.00', '2011-05-27 11:57:17', '2012-05-31 11:57:19', '2011-05-27 11:58:51', '1000', 'upload/2011/05/27/20110527115754255.jpg', '0', '<span class=\"Apple-style-span\"><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527133205_50556.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527133309_60306.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527133330_65428.jpg\" alt=\"\" border=\"0\" /><br /></span>', '', '', null, '0.00', '23', '', '18', '0', '0', '99', 'upload/2011/05/27/20110527115754255_175_175.jpg', 'upload/2011/05/27/20110527115754255_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:49:\"27(2尺),28(2尺1),29(2尺2),30(2尺3),31(2尺4),\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}i:1;a:4:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:3:\"XL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('109', '缀爱依 2011 夏装新款欧美风潮修身连衣裙', 'SD00000000000109', '151', '265.00', '300.00', '2011-05-27 11:57:27', '2012-05-27 11:57:30', '2011-05-27 11:59:34', '100', 'upload/2011/05/27/20110527115745462.jpg', '0', '<img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527115950_92457.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527115958_69131.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527120005_99088.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527120012_71125.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527120018_41544.jpg\" border=\"0\" />', '', '', null, '0.00', '10', '', '0', '0', '0', '99', 'upload/2011/05/27/20110527115745462_175_175.jpg', 'upload/2011/05/27/20110527115745462_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:7:\"紫色,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:9:\"M,L,XL,S,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('110', 'Dior迪奥真我（J’adore）香水30ml 香水 永恒经典', null, '175', '580.00', '760.00', '2011-05-27 11:59:10', '2012-05-27 11:59:13', '2011-05-27 11:59:59', '100', 'upload/2011/05/27/20110527115954190.png', '0', '<p><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527120012_94471.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527120019_10791.png\" border=\"0\" /></p>\r\n<p style=\"text-indent:21pt;margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-family:\'宋体\';font-size:16pt;\">商品描述：</span><span style=\"font-size:16pt;\" xml:lang=\"en-us\" lang=\"en-us\"></span></p>\r\n<p></p>\r\n<p style=\"text-indent:21.2pt;\" align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff;font-size:14pt;\">容量<span xml:lang=\"en-us\" lang=\"en-us\">/</span>市场价：</span></strong><span style=\"font-family:\'宋体\';\"><span style=\"background:#ffffff;font-size:14pt;\" xml:lang=\"en-us\" lang=\"en-us\">50ml/580</span><span style=\"background:#ffffff;font-size:14pt;\">元<span xml:lang=\"en-us\" lang=\"en-us\"> </span></span></span></p>\r\n<p></p>\r\n<p style=\"text-indent:21.2pt;\" align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff;font-size:14pt;\">香调<span xml:lang=\"en-us\" lang=\"en-us\">/</span>香型：</span></strong><span style=\"font-family:\'宋体\';\"><span style=\"background:#ffffff;font-size:13.5pt;\">花香<span xml:lang=\"en-us\" lang=\"en-us\">/</span>淡香</span></span></p>\r\n<p></p>\r\n<p style=\"text-indent:.15pt;margin-left:20.15pt;\" align=\"left\"><span style=\"color:#000000;font-size:13.5pt;\"><span style=\"font-family:\'宋体\';\">前调<span xml:lang=\"en-us\" lang=\"en-us\">-</span>黄缅桂花，长春藤叶，柑橘</span><span style=\"font-family:\'宋体\';\"><span xml:lang=\"en-us\" lang=\"en-us\">;<br /></span>中调<span xml:lang=\"en-us\" lang=\"en-us\">-</span>兰花，紫罗兰，玫瑰</span><span style=\"font-family:\'宋体\';\"><span xml:lang=\"en-us\" lang=\"en-us\">;<br /></span>基调<span xml:lang=\"en-us\" lang=\"en-us\">-</span>大马士革梅，黑莓麝香，圭亚那紫木</span></span></p>\r\n<p></p>\r\n<p style=\"text-indent:.15pt;margin-left:20.15pt;\" align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff;font-size:14pt;\">产地<span xml:lang=\"en-us\" lang=\"en-us\">/</span>有效期：</span></strong><span style=\"background:#ffffff;font-size:14pt;\"><span style=\"font-family:\'宋体\';\">法国<span xml:lang=\"en-us\" lang=\"en-us\">/</span>五年</span></span></p>\r\n<p></p>\r\n<p style=\"text-indent:21.1pt;background:#ffffff;\" align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff;font-size:14pt;\">香水评价：</span></strong><span style=\"color:#000000;font-size:13.5pt;\"><span style=\"font-family:\'宋体\';\"> </span></span></p>\r\n<p></p>\r\n<p style=\"text-indent:20.25pt;background:#ffffff;\" align=\"left\"><span style=\"font-family:\'宋体\';\"><span style=\"color:#000000;font-size:13.5pt;\" xml:lang=\"en-us\" lang=\"en-us\">J\'adore</span><span style=\"color:#000000;font-size:13.5pt;\">真我香水以玫瑰和大马士革梅的花果香调，极其女性气质的表达，以及金色，绝对女性气质的象征。</span></span></p>\r\n<p></p>\r\n<p style=\"text-indent:20.25pt;background:#ffffff;\" align=\"left\"><span style=\"color:#000000;font-size:13.5pt;\"><span style=\"font-family:\'宋体\';\">金黄色典雅的造型<span xml:lang=\"en-us\" lang=\"en-us\">.</span>会深深的吸引你<span xml:lang=\"en-us\" lang=\"en-us\">,J\'adore</span>纯净、永恒的造型，为<span xml:lang=\"en-us\" lang=\"en-us\">CD</span>的经典代表作，高雅而迷人。细长的瓶颈，用金色的领巾围了一周，更加显得高贵不凡。</span></span></p>\r\n<p></p>\r\n<p style=\"text-indent:20.25pt;background:#ffffff;\" align=\"left\"><span style=\"color:#000000;font-size:13.5pt;\"><span style=\"font-family:\'宋体\';\">金碧辉煌的独特瓶身设计，他会让你爱不释手<span xml:lang=\"en-us\" lang=\"en-us\">.</span>光滑透明没有一点修饰，<span xml:lang=\"en-us\" lang=\"en-us\">J\'adore</span>这几个字母很美地隐藏在水晶瓶盖上古典又高雅。柑橘、温柏、黑醋栗、菠萝、蜜露、莲花、水中百合、玫瑰、茉莉、檀香、桃子、桑葚与琥珀。</span></span></p>', '', '', null, '0.00', '20', '', '44', '0', '0', '99', 'upload/2011/05/27/20110527115954190_175_175.png', 'upload/2011/05/27/20110527115954190_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('111', '韩国代购进口女装 优雅淑女蕾丝抹胸收腰百褶无袖背心裙', 'SD00000000000111', '151', '285.00', '365.00', '2011-05-27 13:18:37', '2012-05-27 13:18:40', '2011-05-27 13:25:07', '200', 'upload/2011/05/27/20110527011904747.jpg', '0', '<img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527132523_65489.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527132536_78848.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527132542_34018.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527132549_96682.jpg\" border=\"0\" />', '', '', null, '0.00', '10', '', '0', '0', '0', '99', 'upload/2011/05/27/20110527011904747_175_175.jpg', 'upload/2011/05/27/20110527011904747_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:10:\"浅黄色,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:11:\"M,L,XL,XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('112', 'Chanel/香奈儿五号香水', 'SD00000000000112', '168', '1000.00', '1200.00', '2011-05-27 13:41:33', '2012-05-27 13:41:35', '2011-05-27 13:43:07', '1000', 'upload/2011/05/27/20110527014456194.png', '0', '<p><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527134324_76107.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527134402_14207.png\" border=\"0\" /></p>\r\n<p align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">容量<span lang=\"en-us\" xml:lang=\"en-us\">/</span>市场价：</span></strong><span style=\"font-family:\'宋体\';\"><span style=\"background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\" lang=\"en-us\" xml:lang=\"en-us\">50ml/975</span><span style=\"background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">元<span lang=\"en-us\" xml:lang=\"en-us\"> </span></span></span></p>\r\n<p></p>\r\n<p align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">香调<span lang=\"en-us\" xml:lang=\"en-us\">/</span>香型：</span></strong><span style=\"font-family:\'宋体\';\"><span style=\"background:#ffffff none repeat scroll 0% 0%;font-size:13.5pt;\">醛花香调</span><span style=\"background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\" lang=\"en-us\" xml:lang=\"en-us\">/</span><span style=\"background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">淡香水（<span lang=\"en-us\" xml:lang=\"en-us\">EDT</span>）</span></span></p>\r\n<p></p>\r\n<p align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">前味：</span></strong><span style=\"background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\"><span style=\"font-family:\'宋体\';\">格拉斯橙花、乙醛、香水树花</span><span lang=\"en-us\" xml:lang=\"en-us\"><br /></span><strong><span style=\"font-family:\'宋体\';\">中味：</span></strong><span style=\"font-family:\'宋体\';\">格拉斯茉莉、五月玫瑰</span><span lang=\"en-us\" xml:lang=\"en-us\"><br /></span><strong><span style=\"font-family:\'宋体\';\">后味：</span></strong><span style=\"font-family:\'宋体\';\">麦索尔檀木香、波旁香根草</span></span></p>\r\n<p></p>\r\n<p align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">产地<span lang=\"en-us\" xml:lang=\"en-us\">/</span>有效期：</span></strong><span style=\"background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\"><span style=\"font-family:\'宋体\';\">法国<span lang=\"en-us\" xml:lang=\"en-us\">/</span>五年</span></span></p>\r\n<p></p>\r\n<p align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">香水故事：</span></strong><span style=\"background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\" lang=\"en-us\" xml:lang=\"en-us\"><span style=\"font-family:\'宋体\';\">     </span></span></p>\r\n<p></p>\r\n<p align=\"left\"><span style=\"background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\"><span style=\"font-family:\'宋体\';\">香奈儿五号<span lang=\"en-us\" xml:lang=\"en-us\">(CHANEL NO.5)</span>由法国香奈儿<span lang=\"en-us\" xml:lang=\"en-us\">(CHANEL)</span>公司于<span lang=\"en-us\" xml:lang=\"en-us\">1921</span>年推出。其香调主要由乙醛配合茉莉、五月玫瑰、印度薄荷、琥珀等多种名贵香料组成，清爽淡雅。它是世界上第一款加入乙醛的香水，属于醛香型香水的代表品牌。自<span lang=\"en-us\" xml:lang=\"en-us\">20</span>年代问世以来，一直声名卓著，历久不衰。而且，其瓶体造型简洁大方，成为香水包装的经典之一。</span><span lang=\"en-us\" xml:lang=\"en-us\"><br /><span style=\"font-family:\'宋体\';\">    </span></span><span style=\"font-family:\'宋体\';\">毋庸置疑，夏奈尔<span lang=\"en-us\" xml:lang=\"en-us\">5</span>号是世界上最著名的香水，夏奈尔<span lang=\"en-us\" xml:lang=\"en-us\">5</span>号的创始者恩尼斯<span lang=\"en-us\" xml:lang=\"en-us\">·</span>鲍与夏奈尔一起创造出了香水历史上的奇迹。</span><span lang=\"en-us\" xml:lang=\"en-us\"><br /><span style=\"font-family:\'宋体\';\">    </span></span><span style=\"font-family:\'宋体\';\">用香奈儿自己的话来说：<span lang=\"en-us\" xml:lang=\"en-us\">“</span>这就是我要的，一种截然不同于以往的香水，一种女人的香水。一种气味香浓，令人难忘的女人。<span lang=\"en-us\" xml:lang=\"en-us\">”</span></span></span></p>', '', '', null, '0.00', '20', '', '45', '0', '0', '99', 'upload/2011/05/27/20110527014456194_175_175.png', 'upload/2011/05/27/20110527014456194_100_100.png', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"83\";s:5:\"value\";s:5:\"50ml,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"容量\";}i:1;a:4:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:4:\"XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('113', '专柜正品 JackJones/杰克琼斯 时尚条纹短袖男士T恤', 'SD00000000000113', '169', '119.00', '119.00', '2011-05-27 13:41:46', '2011-09-30 13:41:52', '2011-05-27 13:44:07', '1600', 'upload/2011/05/27/20110527014331610.jpg', '0', '<table style=\"width:555pt;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" width=\"740\"><tbody><tr><td>  <p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\">身高尺码只作为参考。不作为退换货依据<span>!</span></span></p>\r\n</td>\r\n</tr></tbody></table><table style=\"width:555pt;border:1pt outset #000000;\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"740\"><tbody><tr><td style=\"background:#bdd7f2 none repeat scroll 0% 0%;\" width=\"105\">  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">尺码</span></p>\r\n  </td>\r\n  <td style=\"background:#bdd7f2 none repeat scroll 0% 0%;\" width=\"105\">  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">XS</span></p>\r\n  </td>\r\n  <td style=\"background:#bdd7f2 none repeat scroll 0% 0%;\" width=\"105\">  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">S</span></p>\r\n  </td>\r\n  <td style=\"background:#bdd7f2 none repeat scroll 0% 0%;\" width=\"105\">  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">M</span></p>\r\n  </td>\r\n  <td style=\"background:#bdd7f2 none repeat scroll 0% 0%;\" width=\"105\">  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">L</span></p>\r\n  </td>\r\n  <td style=\"background:#bdd7f2 none repeat scroll 0% 0%;\" width=\"105\">  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">XL</span></p>\r\n  </td>\r\n  <td style=\"background:#bdd7f2 none repeat scroll 0% 0%;\" width=\"94\">  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">XXL</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#fad7dd none repeat scroll 0% 0%;\">  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">号型</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">165/88A</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">170/92A</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">175/96A</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">180/100A</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">185/104A</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">190/108A</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#fad7dd none repeat scroll 0% 0%;\">  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">适合身高</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">163CM-169CM</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">168CM-172CM</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">170CM-176CM</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">175CM-182CM</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">180CM-187CM</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">185CM-190CM</span></p>\r\n  </td>\r\n </tr><tr><td style=\"background:#fad7dd none repeat scroll 0% 0%;\">  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">适合体重</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">50KG-55KG</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">55KG-65KG</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">65KG-72KG</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">70KG-80KG</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">75KG-85KG</span></p>\r\n  </td>\r\n  <td>  <p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12pt;font-family:\'宋体\';\">75KG-90KG</span></p>\r\n  </td>\r\n </tr></tbody></table><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527134519_58922.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527134528_83292.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527134537_63580.jpg\" alt=\"\" border=\"0\" /><br />', '', '', null, '0.00', '11', '', '20', '0', '0', '99', 'upload/2011/05/27/20110527014331610_175_175.jpg', 'upload/2011/05/27/20110527014331610_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:80:\"upload/2011/05/26/20110526105401935.gif,upload/2011/05/26/20110526105352343.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:11:\"XXL,XL,L,M,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('114', 'Calvin Klein 凯文克莱 ck one 中性香水', 'SD00000000000114', '175', '380.00', '450.00', '2011-05-27 13:47:09', '2012-05-27 13:47:11', '2011-05-27 13:48:49', '500', 'upload/2011/05/27/20110527014836763.png', '0', '<p><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527134903_37361.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527134913_14150.png\" border=\"0\" /></p>\r\n<p style=\"background:#ffffff none repeat scroll 0% 0%;\" align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">容量市场价：</span></strong><span style=\"font-size:16pt;\" lang=\"en-us\" xml:lang=\"en-us\"><span style=\"font-family:\'宋体\';\">100ml/380</span></span></p>\r\n<p style=\"background:#ffffff none repeat scroll 0% 0%;\" align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">外盒包装</span></strong><span style=\"font-size:13.5pt;\"><span style=\"font-family:\'宋体\';\">：全新有外盒</span></span></p>\r\n<p style=\"background:#ffffff none repeat scroll 0% 0%;\" align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">香调</span></strong><span style=\"font-size:13.5pt;\"><span style=\"font-family:\'宋体\';\">：柑苔果香调</span></span></p>\r\n<p></p>\r\n<p style=\"background:#ffffff none repeat scroll 0% 0%;\" align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">产地<span lang=\"en-us\" xml:lang=\"en-us\">/</span>有效期</span></strong><span style=\"font-family:\'宋体\';\"><span style=\"font-size:13.5pt;\">：美国</span><span lang=\"en-us\" xml:lang=\"en-us\"> /</span>五年</span><span style=\"font-size:13.5pt;\" lang=\"en-us\" xml:lang=\"en-us\"><br /></span><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">前味</span></strong><span style=\"font-size:13.5pt;\"><span style=\"font-family:\'宋体\';\">：佛手柑、荳蔻、新鲜菠萝、木瓜、柠檬</span><span lang=\"en-us\" xml:lang=\"en-us\"><br /></span></span><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">中味</span></strong><span style=\"font-size:13.5pt;\"><span style=\"font-family:\'宋体\';\">：茉莉花、铃兰、玫瑰、肉荳蔻、百合、鸢尾草</span><span lang=\"en-us\" xml:lang=\"en-us\"><br /></span></span><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">后味</span></strong><span style=\"font-size:13.5pt;\"><span style=\"font-family:\'宋体\';\">：麝香、琥珀、檀香、雪松、橡木苔　</span></span></p>\r\n<p style=\"background:#ffffff none repeat scroll 0% 0%;\" align=\"left\"><strong><span style=\"font-family:\'宋体\';background:#ffffff none repeat scroll 0% 0%;font-size:14pt;\">香水评价：</span></strong><span style=\"font-size:13.5pt;\"><span style=\"font-family:\'宋体\';\">这款男女共享香水， 刚问世不久就创造了<span lang=\"en-us\" xml:lang=\"en-us\">5800</span>万美元的销售纪录，在全美乃至世界的香水界里掀起一阵漩风。代表着个性、统一的<span lang=\"en-us\" xml:lang=\"en-us\">90</span>年代新理念的<span lang=\"en-us\" xml:lang=\"en-us\">cK one</span>更是吸引了那些从不用香水的年轻人。它是一款让人感到亲切的香水，只需要你靠近它，全身上下洒满它，你也会像一杯绿茶一般清新溢人。 　　</span></span></p>\r\n<p style=\"background:#ffffff none repeat scroll 0% 0%;\" align=\"left\"><span style=\"font-size:13.5pt;\"><span style=\"font-family:\'宋体\';\">　　清新明快的<span lang=\"en-us\" xml:lang=\"en-us\">CK one</span>初调由豆蔻、香柠檬、新鲜菠萝番木瓜构成； 中调你会发现一股特定的香味从茉莉、紫罗兰、玫瑰、肉豆蔻中飘来；基调则由两种混合着琥珀的新型麝香组成，使人感到温暖与热情，成熟而丰富。</span><span style=\"font-family:\'宋体\';\"><span lang=\"en-us\" xml:lang=\"en-us\"> <br />\r\n <br /></span>　　<span lang=\"en-us\" xml:lang=\"en-us\">CK one</span>是由<span lang=\"en-us\" xml:lang=\"en-us\">CK</span>公司<span lang=\"en-us\" xml:lang=\"en-us\">1994</span>年推出。<span lang=\"en-us\" xml:lang=\"en-us\">CK one</span>的瓶身设计如同牙买加朗姆酒瓶，白色透明的磨砂玻璃瓶，外包装则用再生纸做成的普通纸盒。<span lang=\"en-us\" xml:lang=\"en-us\"> CK one</span>是一款有绿茶香味的无性别香水，在仿如牙买加朗姆酒瓶的<span lang=\"en-us\" xml:lang=\"en-us\">CK one</span>之中，我们不分种族、性别、年龄，共同分享这同一个世界。打破性别藩篱，以<span lang=\"en-us\" xml:lang=\"en-us\">90</span>年的两性亲密共享、摆脱社会礼孝的束缚及简单的玻璃可回收包装为市场诉求，颠覆传统香水之华丽形象而成热卖。</span></span></p>', '', '', null, '0.00', '50', '', '0', '0', '0', '99', 'upload/2011/05/27/20110527014836763_175_175.png', 'upload/2011/05/27/20110527014836763_100_100.png', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"83\";s:5:\"value\";s:5:\"50ml,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"容量\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('115', 'lee 专柜正品 时尚字母图案 男士直筒短袖T恤8609-5L4K', 'SD00000000000115', '169', '198.00', '198.00', '2011-05-27 13:48:37', '2013-06-27 13:48:38', '2011-05-27 13:50:24', '3000', 'upload/2011/05/27/20110527014900904.jpg', '0', '<img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527135045_85127.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527135052_63871.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527135100_55505.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527135107_52346.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527135117_65242.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527135125_67628.jpg\" alt=\"\" border=\"0\" /><br />', '', '', null, '0.00', '19', '', '18', '0', '0', '99', 'upload/2011/05/27/20110527014900904_175_175.jpg', 'upload/2011/05/27/20110527014900904_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:120:\"upload/2011/05/26/20110526105606611.gif,upload/2011/05/26/20110526105352343.gif,upload/2011/05/26/20110526105558440.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:13:\"S,M,L,XL,XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('116', '2011 新款春装 韩版 t恤 圆领直筒 女士衬衫', 'SD00000000000116', '180', '58.00', '75.00', '2011-05-27 14:02:42', '2012-05-27 14:02:45', '2011-05-27 14:04:24', '300', 'upload/2011/05/27/20110527015924460.jpg', '0', '<img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527140440_57326.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527140448_51017.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527140454_88519.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527140500_43994.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527140505_85135.jpg\" border=\"0\" />', '', '', null, '0.00', '10', '', '0', '0', '0', '99', 'upload/2011/05/27/20110527015924460_175_175.jpg', 'upload/2011/05/27/20110527015924460_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:14:\"紫色,桔色,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:7:\"M,L,XL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('117', 'FBI心理分析术：我在FBI的20年', null, '182', '21.00', '30.00', '2011-05-27 14:10:40', '2012-05-31 14:10:43', '2011-05-27 14:12:48', '99', 'upload/2011/05/27/20110527021231551.png', '0', '<span><a></a><span> </span></span><p align=\"left\">作　　者：【美】<a href=\"http://search.dangdang.com/book/search_pub.php?category=01&amp;key2=%C2%DE%B2%AE%CC%D8%A1%A4K%A1%A4%C0%D7%CB%B9%C0%D5&amp;order=sort_xtime_desc\">罗伯特·K·雷斯勒</a>，<a href=\"http://search.dangdang.com/book/search_pub.php?category=01&amp;key2=%CC%C0%C4%B7%A1%A4%CF%C4%CF%A3%CC%D8%C2%FC&amp;order=sort_xtime_desc\">汤姆·夏希特曼</a>　著</p>\r\n<p align=\"left\">出 版 社：<a href=\"http://search.dangdang.com/book/search_pub.php?category=01&amp;key3=%BD%AD%CB%D5%CE%C4%D2%D5%B3%F6%B0%E6%C9%E7&amp;order=sort_xtime_desc\">江苏文艺出版社</a></p>\r\n<p align=\"left\">出版时间：2011-4-1</p>\r\n<ul class=\"clearfix\"><li>\r\n<div align=\"left\"><span>版　　次：1</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>页　　数：236</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>字　　数：153000</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>印刷时间：2011-4-1</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>开　　本：16开</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>纸　　张：胶版纸</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>印　　次：1</span><span>I S B N：9787539943336</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>包　　装：平装</span></div>\r\n</li>\r\n</ul><h4 align=\"left\">编辑推荐</h4>\r\n<p class=\"customize\" align=\"left\">　　揭示人的心理成长历程  破解异常行为的社会诱因。<br />\r\n　　FBI心理分析第一人《沉默的羔羊》创作原型提供者。<br />\r\n　　连环杀手（Serial Killer）一词首创者。<br />\r\n　　教你理解和掌握人的内心世界。</p>\r\n<a></a> <h4 align=\"left\">内容简介</h4>\r\n<p class=\"customize\" align=\"left\">　　FBI行为科学调查组创始人罗伯特·K·雷斯勒，真实记录了他采访“山姆之子”、“曼森家族”等连环命案凶手的过程，以及侦破“里根遇刺案”、“吸血鬼杀手”等案件的过程。<br />\r\n　　雷斯勒将他一生积累的犯罪心理学研究成果首度公诸于世，深刻分析了连环杀手的社会成因和心理演变过程，把那些官方讳莫如深的犯罪心理侧写程序首次呈现在世人面前。<br />\r\n　　这不仅是神奇的探案之旅，更对人性深层阴暗面和社会问题引发的畸形行为做了深入的剖解。因而本书在美国出版后畅销多年，数次再版，全球8?语言发行，在日本更是创下了百万册的销售纪录。</p>\r\n<a></a> <h4 align=\"left\">作者简介</h4>\r\n<p class=\"customize\" align=\"left\">罗伯特·K·雷斯勒（Robert K.Ressler），FBI行为科学调查组创始人，曾就职于FBI特别监察机构，以及美国军队的犯罪调查中心(CID)，现居住在弗吉尼亚州，为法律行为服务机构（Forensic Behavioral Services）的负责人，该机构主要致力于提供培训、辅导、咨询，以及专业取证等服务。<br />\r\n <br />\r\n 汤姆·夏希特曼（Tom Shachtman），全职作家，曾与罗伯特·K·雷斯勒合作撰写《伸张正义》一书，现居纽约。</p>\r\n<a></a> <h4 align=\"left\">目录</h4>\r\n<p class=\"customize\" align=\"left\">第1章　吸血鬼杀手<br />\r\n第2章　与魔鬼作战<br />\r\n第3章　凶手访谈录<br />\r\n第4章　暴力的童年<br />\r\n第5章　报童的死亡<br />\r\n第6章　有组织与无组织罪犯<br />\r\n第7章　动机+过程=凶手<br />\r\n第8章　骗局<br />\r\n第9章　再次杀人<br />\r\n第10章　天网恢恢<br />\r\n第11章　摄影机下的凶手<br />\r\n第12章 沉默的羔羊</p>\r\n<h4 align=\"left\">媒体评论</h4>\r\n<p class=\"customize\" align=\"left\">一场不容错过的人性探险之旅。——《柯克斯评论》（Kirkus）</p>\r\n<a></a> <h4 align=\"left\">在线试读部分章节</h4>\r\n<p align=\"left\"><a class=\"layer detail_img\" href=\"#\"></a></p>\r\n<div class=\"customize\" align=\"left\">　　鲁斯·沃帕吉尔（Russ Vorpagel）在联邦调查局里是一个传奇性的人物，他身高6英尺4英寸，体重260磅①，拥有法学学位，曾经是密尔瓦基市警局负责凶杀案的侦探，在性犯罪和炸弹爆炸案件方面也是专家。他后来被联邦调查局的行为科学调查组征调，担任加州萨克拉门托市的协调员，主要在西海岸各地工作，负责指导当地警察侦破性犯罪类案件。警察和警长们都知道他在这方面是权威，因而都非常尊重和敬佩他。<br />\r\n　　1978年1月23日是星期一，午夜时分，当地警察接到一个从萨克拉门托北部的一个小警局打来的报警电话，把它转给了鲁斯，因为那里发生了一件恐怖的凶杀案。受害者明显承受了令人发指的暴行，这明显不是一桩普通的谋杀。洗衣店的货车司机、现年24岁的大卫·沃林（David Wallin）当天下班后，回到了位于郊区的简陋出租屋，发现22岁的妻子倒在卧室内，早已断气，她怀有3个月身孕的下腹还被人残忍地剖开了，他大叫着跑到邻居家求救，邻居立刻报了警。沃林受到了太大的刺激，警方赶来时他已经说不出话。副警长率先进入卧室的案发现场，他也惊呆了，后来他说自从目睹现场后一连?了几个月的噩梦。<br />\r\n　　当地警方马上给鲁斯打电话求援，鲁斯从匡提克的训练中心给我打了电话。尽管我对这桩谋杀案感到不解，但也激发了我的兴趣，因为此案为我提供了一次运用心理学技巧尽快抓到凶手的机会。通常，移交到行为科学调查组的案子大都是冷酷无情的，但此时的萨克拉门托却是炎热难当。<br />\r\n　　第二天的报纸上说，沃林太太应该是在准备外出倒垃圾的时候，在客厅里被暴徒袭击了，因为从前门到卧室到处都是挣扎的痕迹，现场还发现了两颗弹壳。沃林太太本来穿着一件类似汗衫的宽松上衣和内裤，但案发后上衣、胸罩及内裤都被?了下来，腹部上多处都有很深的伤口。现场的警察对记者说目前还不知道凶手的动机，因为歹徒没有取走钱财，所以本案不可能是劫财杀人。<br />\r\n　　实际情况比报纸上的报道更糟糕。鲁斯对我说，当地警方为了避免公众恐慌，隐瞒了很多细节。很多人因此认为警察太冷酷，丝毫不把民众当回事，但警察每天都要处理很多类似的案子，他们只能冷漠以对。<br />\r\n　　有些细节没有公布，是因为这些线索对侦破工作非常有用，不能让凶手预先有所觉察。这个案子没有提供给新闻界的细节有：受害者身上致命刀伤从胸口划到肚脐，肠子都露了出来，许多内脏也被?出来乱砍，身体已经残缺，有些器官不见了。另外受害者的左胸上有多处极为可怕的戮伤，嘴里甚至还被塞入动物的排泄物，还有证据显示歹徒把受害者的血掺入乳酪瓶中，然后一饮而尽。</div>', '', '', null, '0.00', '2', '本', '0', '0', '0', '99', 'upload/2011/05/27/20110527021231551_175_175.png', 'upload/2011/05/27/20110527021231551_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('118', '2011夏装新款韩版正品修身亚麻荷叶边泡泡袖短袖衬衫衬衣', 'SD00000000000118', '180', '45.00', '60.00', '2011-05-27 14:10:47', '2012-05-27 14:10:53', '2011-05-27 14:13:14', '99', 'upload/2011/05/27/20110527021112258.jpg', '0', '<img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527141327_80394.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527141334_27295.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527141342_92262.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527141349_51371.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527141357_17006.jpg\" border=\"0\" />', '', '', null, '0.00', '10', '', '0', '0', '0', '99', 'upload/2011/05/27/20110527021112258_175_175.jpg', 'upload/2011/05/27/20110527021112258_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:24:\"天蓝色,红色,绿色,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:7:\"均码,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('119', 'Jack Jones/杰克琼斯条纹撞色军官风短袖衬衫(黑)', 'SD00000000000119', '181', '175.00', '179.00', '2011-05-27 14:17:29', '2015-05-27 14:17:30', '2011-05-27 14:19:13', '799', 'upload/2011/05/27/20110527021759985.jpg', '0', '<p><span><span style=\"font-size:10.5pt;font-family:\'宋体\';color:#000000;\">    今年最热的衬衫之一即是军官风了，肩标的设计顿时就可以让男士看上去赋有魅力，这款设计深色的用料和浅色的扣子搭配具有画龙点睛的效果，门襟处撞色的设计，让整体色采更加融洽，细小的条纹更是精致一词的代表作</span></span></p>\r\n<p><span><span style=\"font-size:10.5pt;font-family:\'宋体\';color:#000000;\"><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527141948_30297.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527141957_31618.jpg\" alt=\"\" border=\"0\" /><br /></span></span></p>', '', '', null, '0.00', '17', '', '20', '0', '0', '99', 'upload/2011/05/27/20110527021759985_175_175.jpg', 'upload/2011/05/27/20110527021759985_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:40:\"upload/2011/05/26/20110526105352343.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:9:\"S,M,L,XL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('120', '杜拉拉升职记', null, '182', '16.00', '26.00', '2011-05-27 14:19:34', '2012-05-27 14:19:36', '2011-05-27 14:20:25', '100', 'upload/2011/05/27/20110527022018897.png', '0', '<p align=\"left\">作　　者：<a href=\"http://search.dangdang.com/book/search_pub.php?category=01&amp;key2=%C0%EE%BF%C9&amp;order=sort_xtime_desc\">李可</a>　著</p>\r\n<p align=\"left\">出 版 社：<a href=\"http://search.dangdang.com/book/search_pub.php?category=01&amp;key3=%C9%C2%CE%F7%CA%A6%B7%B6%B4%F3%D1%A7%B3%F6%B0%E6%C9%E7&amp;order=sort_xtime_desc\">陕西师范大学出版社</a></p>\r\n<p align=\"left\">出版时间：2007-9-1</p>\r\n<ul class=\"clearfix\"><li>\r\n<div align=\"left\"><span>版　　次：1</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>页　　数：262</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>字　　数：</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>印刷时间：2007-9-1</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>开　　本：</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>纸　　张：胶版纸</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>印　　次：1</span><span>I S B N：9787561339121</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>包　　装：平装</span></div>\r\n</li>\r\n</ul><span> </span><div class=\"customize\" align=\"left\"><strong>《&lt;杜拉拉2华年似水&gt;作者李可 应北大就业指导中心之约 写给大学生的一封信》</strong><br /><br />\r\n北大的同学们，大家好：<br />\r\n又到了临近毕业的日子，年复一年，在这个梦想周期性遭遇现实的季节，对一代又一代的莘莘学子而言，在精神上和身体上准备好奔赴新生活, 是一个不容易的过程。<br />\r\n由于即将自负盈亏，很重要的一个思考是对经济收益的权衡：房子的首付款在哪里？如何分享中国经济高速增长的盛宴？<br />\r\n说得直白点，就是什么样的前程是好前程，怎样才能获得一个好工作。<br /><br /><strong>现实与定位</strong><br /><br /><strong>定位</strong>是个很没有趣味而不讨巧的词，但这是一切的终点和起点。比如这牵扯到为什么要考研，为什么要出国？<br />\r\n虽然借鉴历史很重要，但考研和出国, 不该仅仅是因为历史上北大人这样做，也不是因为别的同学这样做--更重要的原因应该是你本人的下一个人生目标需要你这样做. 我们应该明确出国或者考研能带来什么益处，并且这个益处是优于本科毕业后直接就业的。就好像跳槽不该仅仅因为现在的工作不够好，而更应该因为新工作是你更满意的。<br />\r\n对于求职而言，首先是需要清楚自己为什么选择某家单位, 然后要同样清楚为什么这家单位要选择你(它能给你什么, 你能给它什么)。<br />\r\n在采取行动之前，我们不妨问自己四个问题:<br />\r\n--我想要什么样的生活?<br />\r\n--我选择的工作, 能赖以谋得我要的生活吗?<br />\r\n--我喜欢做这份工作吗?<br />\r\n--我的能力足够做好这份工作吗?</div>\r\n<a></a><span> </span><h4 align=\"left\">内容简介 </h4>\r\n<div class=\"customize\" align=\"left\">中国白领必读的职场修炼小说。 <br />\r\n　　她的故事比比尔·盖茨“白领丽人500强职场心得，揭示外企生存智慧”的更值得参考！ <br />\r\n　　大部分人是要谋生的，不单要谋生，而且希望谋得好。 <br />\r\n　　说到谋生，有人适合自己做老板，更多的人则靠打工。其实，自己做老板，也就是给自己打工。您可以消遣的来看看这本纯属虚构的小说，也可以把它当经验分享之类的职场实用手册来使用。 <br />\r\n　　小说的主人公杜拉拉是典型的中产阶级的代表，她没有背景，受过较好的教育，走正规路子，靠个人奋斗获取成功。对于大部分人来说，她的故事比比尔盖茨的更值得参考。 <br />\r\n　　可能你干了很多活上司却不待见你，没准你有个本事不大脾气不小的下属，也许你的平级争风吃醋不怀好意，或者你的客户拽得像二五八万——你要很好地完成任务，就要设法摆平他们。 <br /></div>\r\n<a></a><span> </span><h4 align=\"left\">作者简介</h4>\r\n<div class=\"customize\" align=\"left\">李可，著有长篇小说《杜拉拉》系列，杂文《致北大学子的一封信》等。《杜拉拉》系列发表后引起广泛关注，《杜拉拉升职记》被改编成电影、电视剧和话剧，分别由徐静蕾、王珞丹和姚晨饰演杜拉拉。《杜拉拉2华年似水》亦已被买下电影和电视版权。</div>\r\n<a></a><span> </span><h4 align=\"left\">目录 </h4>\r\n<div class=\"customize\" align=\"left\">引子：三个月的民企生涯 <br />\r\nDB人物表 <br />\r\n01. 忠诚源于满足 <br />\r\n02. 单相思与性骚扰的区别 <br />\r\n03. 老板心中谁更重要 <br />\r\n04. 和上司要保持一致 <br />\r\n06.“预算与排期” <br />\r\n07. 管理层关心细节吗？ <br />\r\n08. 专业质疑与先兆流产 <br />\r\n09. 5％就够了 <br />\r\n10. 别搞不清楚谁是老大 <br />\r\n11. 老板们的不同特点 <br />\r\n12. 话不投机 <br />\r\n13. 受累又受气该怎么办 <br />\r\n14. 猜猜为啥请晚餐 </div>', '', '', null, '0.00', '5', '本', '0', '0', '0', '99', 'upload/2011/05/27/20110527022018897_175_175.png', 'upload/2011/05/27/20110527022018897_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('121', '七匹狼短袖衬衫 舒适夏款 翻领衬衫 正品男装', 'SD00000000000121', '181', '149.00', '149.00', '2011-05-27 14:21:27', '2013-05-21 14:21:29', '2011-05-27 14:24:09', '4999', 'upload/2011/05/27/20110527022212221.jpg', '0', '<img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527142428_25172.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527142435_94542.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527142442_72525.jpg\" alt=\"\" border=\"0\" /><br />', '', '', null, '0.00', '14', '', '46', '0', '0', '99', 'upload/2011/05/27/20110527022212221_175_175.jpg', 'upload/2011/05/27/20110527022212221_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:200:\"upload/2011/05/26/20110526105509389.gif,upload/2011/05/26/20110526105538833.gif,upload/2011/05/26/20110526105415915.gif,upload/2011/05/26/20110526105352343.gif,upload/2011/05/26/20110526105558440.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:16:\"M,L,XL,XXL,XXXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('122', '走遍法国：学生用书1.上（附MP3光盘一张）', null, '182', '28.00', '39.90', '2011-05-27 14:24:47', '2012-05-27 14:24:49', '2011-05-27 14:26:21', '100', 'upload/2011/05/27/20110527022616545.png', '0', '<p align=\"left\">作　　者：（法）<a href=\"http://search.dangdang.com/book/search_pub.php?category=01&amp;key2=%BF%A8%C5%E5%C0%D5&amp;order=sort_xtime_desc\">卡佩勒</a>，（法）<a href=\"http://search.dangdang.com/book/search_pub.php?category=01&amp;key2=%BC%AA%B6%AB&amp;order=sort_xtime_desc\">吉东</a> 著，<a href=\"http://search.dangdang.com/book/search_pub.php?category=01&amp;key2=%BA%FA%E8%A4&amp;order=sort_xtime_desc\">胡瑜</a>，<a href=\"http://search.dangdang.com/book/search_pub.php?category=01&amp;key2=%CE%E2%D4%C6%B7%EF&amp;order=sort_xtime_desc\">吴云凤</a> 编译</p>\r\n<p align=\"left\">出 版 社：<a href=\"http://search.dangdang.com/book/search_pub.php?category=01&amp;key3=%CD%E2%D3%EF%BD%CC%D1%A7%D3%EB%D1%D0%BE%BF%B3%F6%B0%E6%C9%E7&amp;order=sort_xtime_desc\">外语教学与研究出版社</a></p>\r\n<p align=\"left\">出版时间：2006-1-1</p>\r\n<ul class=\"clearfix\"><li>\r\n<div align=\"left\"><span>版　　次：1</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>页　　数：174</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>字　　数：</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>印刷时间：2006-9-1</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>开　　本：</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>纸　　张：胶版纸</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>印　　次：</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>I S B N：9787560053196</span></div>\r\n</li>\r\n<li>\r\n<div align=\"left\"><span>包　　装：平装</span></div>\r\n</li>\r\n</ul><p style=\"text-align:left;text-indent:15.75pt;margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-size:small;\"><span style=\"color:#000000;\"><span style=\"font-size:x-small;\"><span>《走遍法国》是外语教学与研究出版社从法国阿歇特图书出版集团引进的一套法语教材。法国阿歇特图书出版集团是</span><span style=\"color:#000000;\">法国最大的出版集团，在法国杂志和图书出版业拥有举足轻重的地位。该公司<span xml:lang=\"en-us\" lang=\"en-us\">1826</span>年由<span xml:lang=\"en-us\" lang=\"en-us\">L·</span>阿歇特在巴黎创立，主要出版教科书、青少年读物、工具书及各科图书。</span></span></span></span></p>\r\n<p style=\"text-align:left;text-indent:21pt;margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span style=\"font-size:small;\"><span style=\"color:#000000;\"><span style=\"font-size:x-small;\"><span>在法语界，法国教材<span xml:lang=\"en-us\" lang=\"en-us\">REFLETS</span>系列一向备受关注。作为法国原版的视听教材，它具备了许多其它国内教材所没有的优点，同时，作为留法面签前法语培训的指定教材，它的重要性更是显而易见。但由于原版教材价格昂贵，国内多是字迹模糊的影印版，读者们对引进这套教材的需求就更为迫切。<span xml:lang=\"en-us\" lang=\"en-us\">2005</span>年，外语教学与研究出版社想读者之所想，急读者之所急，积极联系法国阿歇特图书出版集团的相关人员，洽谈引进版权以及改编后再出版的事宜，在各方的共同努力下，这套《走遍法国》终于出版了！</span><span>该套教材的每个水平等级分册都由学生用书、教师用书和练习册组成。</span></span></span></span></p>\r\n<p style=\"text-align:left;text-indent:21pt;margin:0cm 0cm 0pt;\" class=\"MsoNormal\" align=\"left\"><span><span style=\"font-size:small;\"><span style=\"color:#000000;\"><span style=\"font-size:x-small;\">为了适应不同类型的法语学习者的需求，《走遍法国》在出版前特请北京第二外国语大学的胡瑜和吴云凤老师对这套法国原版教材进行了改编。对学生用书的改编主要有：翻译题目，增加语音讲解、课文注释和词汇表，编译语法和交际讲解等。改编后的版本更加适合中国人学习法语，让读者身临其境般地体会法国文化和法语学习的魅力！</span></span></span></span></p>\r\n<p class=\"customize\" align=\"left\"><strong><a href=\"http://product.dangdang.com/product.aspx?product_id=9164496\">《走遍法国：教师用书1.上（附DVD一张）》,点击进入：</a></strong><br /><strong><a href=\"http://product.dangdang.com/product.aspx?product_id=9204313\">《走遍法国：教师用书1.下（附DVD一张）》,点击进入：</a></strong><br /><strong><a href=\"http://product.dangdang.com/product.aspx?product_id=9323722\">《走遍法国：教师用书2（附DVD一张）》,点击进入：</a></strong><br /><strong><a href=\"http://product.dangdang.com/product.aspx?product_id=8916658\">《走遍法国：练习册1.上》,点击进入：</a></strong><br /><strong><a href=\"http://product.dangdang.com/product.aspx?product_id=9204314\">《走遍法国：练习册(1下)》,点击进入：</a></strong><br /><strong><a href=\"http://product.dangdang.com/product.aspx?product_id=9227393\">《走遍法国：学生用书1.上（附MP3光盘一张）》,点击进入：</a></strong><br /><strong><a href=\"http://product.dangdang.com/product.aspx?product_id=9204312\">《走遍法国：学生用书.1.下（附MP3光盘一张）》,点击进入：</a></strong><br /><strong><a href=\"http://product.dangdang.com/product.aspx?product_id=9298538\">《走遍法国：学生用书2（附MP3光盘一张）》,点击进入：</a></strong></p>\r\n<a></a> <h4 align=\"left\">内容简介 </h4>\r\n<div class=\"customize\" align=\"left\"><span style=\"font-size:x-small;\"><span><span style=\"font-size:small;\"><span style=\"color:#000000;\">《走遍法国》系列是外语教学与研究出版社从法国阿歇特图书出版集团引进的一套法语教材。该套教材以视听内容为基础，语法结构安排合理，融语言和文化于一体，以积极互动的教学法有效培养学生的听说能力。原书共有三个水平等级分册。根据中国人学习外语的特点，我们把原书的第一册分成两部分，并对第一部分进行了改编，使之更适合于法语初学者。</span></span></span><br /><span><span style=\"color:#000000;font-size:small;\">《走遍法国 <span xml:lang=\"en-us\" lang=\"en-us\">(1</span>上<span xml:lang=\"en-us\" lang=\"en-us\">)(</span>学生用书<span xml:lang=\"en-us\" lang=\"en-us\">)</span>》</span></span><span><span style=\"font-size:small;\"><span style=\"color:#000000;\">包括语音（新增）、课文（第<span xml:lang=\"en-us\" lang=\"en-us\">0-12</span></span></span><span style=\"font-size:small;\"><span style=\"color:#000000;\">课）和附录三大部分。</span></span></span><br /><span style=\"font-size:small;\"><span xml:lang=\"en-us\" lang=\"en-us\"><span style=\"color:#000000;\">1.</span></span> <span><span style=\"color:#000000;\">《走遍法国 <span xml:lang=\"en-us\" lang=\"en-us\">(1</span>上<span xml:lang=\"en-us\" lang=\"en-us\">)(</span>学生用书<span xml:lang=\"en-us\" lang=\"en-us\">)</span></span><span style=\"color:#000000;\">》</span></span></span></span> <span style=\"font-size:x-small;\"><span><span style=\"font-size:small;\"><span style=\"color:#000000;\">从中国学生的角度出发，在原书的基础上增添了语音部分，主要介绍一些基本的语音概念，分组介绍了<span xml:lang=\"en-us\" lang=\"en-us\">35</span></span></span><span style=\"font-size:small;\"><span style=\"color:#000000;\">个元音音素和辅音音素的发音特点，并结合常用词汇和句型讲解主要读音规则。</span></span></span><br /><span xml:lang=\"en-us\" lang=\"en-us\"><span style=\"color:#000000;font-size:small;\">2.</span></span></span> <span><span style=\"font-size:small;\"><span style=\"font-size:x-small;\"><span style=\"color:#000000;\">课文部分除第<span xml:lang=\"en-us\" lang=\"en-us\">0</span>课为入门课外，第<span xml:lang=\"en-us\" lang=\"en-us\">1-12</span>课以三个主人公工作和生活中的故事为主线展示当代法国人的日常生活。每课主?分为情景学习、剧情理解、语法学习和语言交际四大板块。一个单元内的前一课配有阅读及词汇扩展练习，后一课配有文化点滴板块，介绍法国或法语国家的文化。每课的词汇表（新增）包括两部分单词：不带星号（<span xml:lang=\"en-us\" lang=\"en-us\">*</span>）的为对话中必须掌握的单词，带星号（<span xml:lang=\"en-us\" lang=\"en-us\">*</span></span><span style=\"color:#000000;\">）的为旁白中的一部分单词。此外，前几课的词汇表都给出了动词的原形及课文里出现的人称变位，系统的动词变位规则将在后面课程中讲解。</span></span></span> </span></div>\r\n<a></a><a></a> <h4 align=\"left\">目录 </h4>\r\n<div class=\"customize\" align=\"left\">语音<br />\r\n法语字母表<br />\r\n发音与拼音<br />\r\n联诵、连音<br />\r\n音素的概念<br />\r\n音节<br />\r\n哑音h、嘘音h<br />\r\nDOSSIER 0 您是法国人吗？<br />\r\nCOMMUNICATION GRAMMAIRE<br />\r\n拼读 国籍形容词<br />\r\n使用数字 Etre、sappeler单数人称的直陈式现在时 Cest<br />\r\nDOSSIER 1<br />\r\nEpisode 1 新房客<br />\r\nEpisode 2 参观公寓<br />\r\nCOMMUNICATION GRAMMAIRE SONS ET LETTRES</div>', '', '', null, '0.00', '50', '本', '0', '0', '0', '99', 'upload/2011/05/27/20110527022616545_175_175.png', 'upload/2011/05/27/20110527022616545_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('123', '欧式吊灯 玻璃罩 客厅吊灯 12头吊灯 铁艺吊灯 树脂灯', null, '183', '5200.00', '5500.00', '2011-05-27 14:40:21', '2012-05-27 14:40:24', '2011-05-27 14:42:30', '100', 'upload/2011/05/27/20110527024112405.jpg', '0', '<img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527144158_64055.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527144204_53840.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527144210_57202.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527144216_95462.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527144223_49300.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527144229_10645.jpg\" border=\"0\" />', '', '', null, '0.00', '50', '', '0', '0', '0', '99', 'upload/2011/05/27/20110527024112405_175_175.jpg', 'upload/2011/05/27/20110527024112405_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('124', '王菲：阿菲正传（3CD）', null, '184', '50.40', '92.00', '2011-05-27 14:42:44', '2012-05-27 14:42:46', '2011-05-27 14:43:46', '100', 'upload/2011/05/27/20110527024335743.png', '0', '<h2 class=\"mt\" align=\"left\">内容简介</h2>\r\n<div class=\"con\" align=\"left\">    《王菲：2010年精选专辑 阿菲正传》收录48首包括获奖无数流行经典，收录多首绝版特别混音作品；阿菲正传，2010年至瞩目的精选集；王菲演唱会4月启动，全年火热巡演；黑胶唱片式碟片，绝对珍藏！<br />\r\n    <br />\r\n    演员简介：<br />\r\n    <br />\r\n    王菲：以前在内地就相当有知名度，等到唱完《相约98》，她就不费吹灰之力将大陆市场彻底沦陷。北京，深圳，东莞，珠海，佛山，沈阳，宁波，温州，南京，武汉，长沙，济南，广州，上海，重庆都留下她的足迹，所到之处无不反响空前，观众爆棚，所到之处无不引起滚滚惊涛骇浪。她是身价最高的歌手，她是演唱会上座率最高的歌手，她是演唱会票房累计最高的歌手。今年，她将借着大热全亚洲的《将爱》，以最高的身价在内地举行10场大型演唱会，据说她的势力更将延展到西安，乌鲁木齐等等以前未曾到过的城市。已经唱完了22场，加上剩下的9场，王菲在内地的演唱会将达到31场，这样的成绩无人能及。她是日本首位也是唯一能在东京武道馆开演唱会的华人。 十年前，第一次在香港红馆开演唱会的她创下了连开18场的惊人记录，至今无人能破，由此她就在华语歌坛的巅峰开始了高处不胜寒的寂寞。</div>\r\n<div class=\"con\" align=\"left\">\r\n<div class=\"mt\">\r\n<div class=\"mt\">\r\n<h2>曲目</h2>\r\n</div>\r\n<div class=\"mc\">\r\n<div style=\"width:490px;height:347px;\" class=\"con\">CD 1<br />\r\n01 容易受伤的女人<br />\r\n02 执迷不悔<br />\r\n03 冷战<br />\r\n04 我愿意 （弦乐版）<br />\r\n05 梦中人<br />\r\n06 知己知彼（Europe Mix）<br />\r\n07 天空（Unplugged）<br />\r\n08 棋子<br />\r\n09 暖昧<br />\r\n10 Di-Dar（Historical Mix）<br />\r\n11 浮躁<br />\r\n12 你快乐（所以我快乐）<br />\r\n13 半途而废<br />\r\n14 当时的月亮<br />\r\n15 百年孤寂<br /></div>\r\n</div>\r\n</div>\r\n</div>', '', '', null, '0.00', '20', '张', '0', '0', '0', '99', 'upload/2011/05/27/20110527024335743_175_175.png', 'upload/2011/05/27/20110527024335743_100_100.png', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('135', '美客美家 客厅/田园/卧室/阳台/成品/特价/窗帘/布艺（两色）', null, '187', '25.00', '30.00', '2011-05-27 16:01:27', '2012-05-27 16:01:29', '2011-05-27 16:03:16', '93', 'upload/2011/05/27/20110527040129930.jpg', '0', '<img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527160235_15440.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527160241_23666.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527160247_62709.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527160252_94512.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527160259_50064.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527160306_22442.jpg\" border=\"0\" />', '', '', null, '0.00', '5', '', '0', '0', '0', '99', 'upload/2011/05/27/20110527040129930_175_175.jpg', 'upload/2011/05/27/20110527040129930_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('136', '三叶草Adidas 男装 印花圆领短袖t恤', 'SD00000000000136', '169', '120.00', '320.00', '2011-05-27 16:02:53', '2012-05-27 16:02:58', '2011-05-27 16:04:34', '200', 'upload/2011/05/27/20110527040328406.png', '0', '<img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527160945_96182.png\" alt=\"\" border=\"0\" height=\"771\" width=\"740\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527160626_16899.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527160633_53442.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527160641_52753.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527160648_71828.png\" border=\"0\" />', '', '', null, '0.00', '20', '20', '57', '0', '0', '99', 'upload/2011/05/27/20110527040328406_175_175.png', 'upload/2011/05/27/20110527040328406_100_100.png', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:160:\"upload/2011/05/26/20110526105401935.gif,upload/2011/05/26/20110526105352343.gif,upload/2011/05/26/20110526105552192.gif,upload/2011/05/26/20110526105558440.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:13:\"XXL,XL,L,M,S,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('137', '欧式田园 定做窗帘帘头窗幔 孔雀蓝色绿色咖啡紫', null, '187', '28.00', '32.00', '2011-05-27 16:10:18', '2012-05-27 16:10:21', '2011-05-27 16:10:54', '100', 'upload/2011/05/27/20110527041023263.jpg', '0', '<img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527161106_75665.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527161112_34505.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527161119_85797.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527161124_37619.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527161131_18794.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527161136_92273.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527161141_70666.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527161149_90889.jpg\" border=\"0\" />', '', '', null, '0.00', '5', '', '0', '0', '0', '99', 'upload/2011/05/27/20110527041023263_175_175.jpg', 'upload/2011/05/27/20110527041023263_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('138', '耐克圆领短袖T恤', 'SD00000000000138', '169', '220.00', '360.00', '2011-05-27 16:13:54', '2012-05-27 16:13:56', '2011-05-27 16:15:29', '77', 'upload/2011/05/27/20110527041432222.png', '0', '<p align=\"left\"><span style=\"color:#ff9900;font-size:24px;\">产品细节</span></p>\r\n<p><span style=\"color:#ff9900;font-size:24px;\"><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162010_74714.png\" border=\"0\" /></span></p>\r\n<p><span style=\"color:#ff9900;font-size:24px;\"><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162027_86289.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162036_86275.png\" border=\"0\" /></span></p>', '', '', null, '0.00', '10', '件', '58', '0', '0', '99', 'upload/2011/05/27/20110527041432222_175_175.png', 'upload/2011/05/27/20110527041432222_100_100.png', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:80:\"upload/2011/05/26/20110526105558440.gif,upload/2011/05/26/20110526105352343.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:9:\"XL,L,M,S,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('139', '09新品上市 爱仕达ASD 明锐七件套刀 903707', null, '153', '199.00', '199.00', '2011-05-27 16:18:32', '2014-05-28 16:18:35', '2011-05-27 16:18:58', '100', 'upload/2011/05/27/20110527041853620.jpg', '0', '<img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162040_37792.jpg\" alt=\"\" border=\"0\" /><br />', '', '', null, '0.00', '19', '', '0', '0', '0', '99', 'upload/2011/05/27/20110527041853620_175_175.jpg', 'upload/2011/05/27/20110527041853620_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('140', '恋织家:&quot; 梦幻蒲公英橙&quot; 欧式典雅风格 成品窗帘 窗帘定做', null, '187', '152.00', '160.00', '2011-05-27 16:23:42', '2012-05-27 16:23:45', '2011-05-27 16:25:28', '100', 'upload/2011/05/27/20110527042353845.jpg', '0', '<img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162441_47317.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162447_31156.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162454_79414.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162459_86706.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162505_23579.jpg\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162511_91169.jpg\" border=\"0\" />', '', '', null, '0.00', '5', '米', '0', '0', '0', '99', 'upload/2011/05/27/20110527042353845_175_175.jpg', 'upload/2011/05/27/20110527042353845_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('141', '背靠背男士短袖', 'SD00000000000141', '169', '130.00', '260.00', '2011-05-27 16:26:43', '2012-05-27 16:26:45', '2011-05-27 16:27:44', '48', 'upload/2011/05/27/20110527042716290.png', '0', '<p align=\"left\"><span style=\"color:#ff9900;font-size:24px;\">细节描述</span></p>\r\n<p align=\"left\"><span style=\"color:#ff9900;font-size:24px;\"><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162836_11417.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162845_57760.png\" border=\"0\" /><img alt=\"\" src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527162852_67749.png\" border=\"0\" /></span></p>', '', '', null, '0.00', '10', '件', '59', '0', '0', '99', 'upload/2011/05/27/20110527042716290_175_175.png', 'upload/2011/05/27/20110527042716290_100_100.png', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:40:\"upload/2011/05/26/20110526105558440.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:13:\"XXL,XL,L,M,S,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');
INSERT INTO shop_goods VALUES ('142', '韩国乐扣乐扣保鲜盒HPL735冷水壶 2L LOCKLOCK', null, '153', '55.00', '59.00', '2011-05-27 16:27:46', '2015-05-27 16:27:48', '2011-05-27 16:29:49', '94', 'upload/2011/05/27/20110527042805530.jpg', '0', '<div>颜 色 : 蓝色 </div>\r\n<div>材 料 : 聚丙烯(P.P) </div>\r\n<div>产 地 : 韩国 </div>\r\n<div>制造商 : (株)乐扣乐扣 </div>\r\n<div><br /></div>\r\n<div>1.可用于微波炉低温加热，冰箱。</div>\r\n<div>2.使用ISO9002认证，美国FDA，德国SGS认证通过的安定(全)，卫生检查的原料。</div>\r\n<div>3.盒子的锁定装置，通过了100万次的弯曲试验无任何异常。</div>\r\n<div>4.通过韩国生活用品实验研究院耐热，耐寒性试验 并获得卫生，安定性的品质。</div>\r\n<div>5.品质保证协会指定书（Q-Mark），卫生安全品质认证书（HS-Mark）。 </div>\r\n<div><br /></div>\r\n<div>超优良品质厨房用品专家--(株)乐扣乐扣成立于1985年，以世界超一流品牌为目的而开发的功能性保鲜盒‘LOCK &amp; LOCK’系列,通过在世界排行第一位的电视购物公司美国QVC中全美播放,每次播放都突破最高的销售纪录而具有超凡人气，在韩国国内的电视购物销售也被评为“BEST OF BEST”（最优秀的产品），是出口世界70多个国家的厨房用具专门品牌。</div>', '', '', null, '0.00', '5', '', '0', '0', '0', '1', 'upload/2011/05/27/20110527042805530_175_175.jpg', 'upload/2011/05/27/20110527042805530_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('143', '正品/韩国乐扣乐扣/LOCKLOCK 圆形保鲜盒HPL932D 饭盒 700ml', null, '153', '17.70', '19.00', '2011-05-27 16:31:57', '2012-05-31 16:32:00', '2011-05-27 16:32:23', '100', 'upload/2011/05/27/20110527043219501.jpg', '0', '<div>颜 色 : 半透明 </div>\r\n<div>材 料 : 聚丙烯(P.P) </div>\r\n<div>产 地 : 中国净  重：195g </div>\r\n<div>制造商 : (株)乐扣乐扣 </div>\r\n<div><br /></div>\r\n<div>1.可用于微波炉低温加热，冰箱。</div>\r\n<div>2.使用ISO9002认证，美国FDA，德国SGS认证通过的安定(全)，卫生检查的原料。</div>\r\n<div>3.盒子的锁定装置，通过了100万次的弯曲试验无任何异常。</div>\r\n<div>4.通过韩国生活用品实验研究院耐热，耐寒性试验 并获得卫生，安定性的品质。</div>\r\n<div>5.品质保证协会指定书（Q-Mark），卫生安全品质认证书（HS-Mark）。 </div>\r\n<div><br /></div>\r\n<div>超优良品质厨房用品专家--(株)乐扣乐扣成立于1985年，以世界超一流品牌为目的而开发的功能性保鲜盒‘LOCK &amp; LOCK’系列,通过在世界排行第一位的电视购物公司美国QVC中全美播放,每次播放都突破最高的销售纪录而具有超凡人气，在韩国国内的电视购物销售也被评为“BEST OF BEST”（最优秀的产品），是出口世界70多个国家的厨房用具专门品牌。</div>', '', '', null, '0.00', '1', '', '0', '0', '0', '99', 'upload/2011/05/27/20110527043219501_175_175.jpg', 'upload/2011/05/27/20110527043219501_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('144', '正品/韩国乐扣乐扣/LOCKLOCK 拉斯方形 玻璃保鲜盒LLG224 750ml', 'SD00000000000144', '153', '58.00', '58.00', '2011-05-27 16:36:33', '2014-05-08 16:36:35', '2011-05-27 16:37:54', '100', 'upload/2011/05/27/20110527043650523.jpg', '0', '<div style=\"text-align:left;\">颜 色 : 透明 </div>\r\n<div style=\"text-align:left;\">材 料 : 盒盖-PP ,硅树脂垫,盒身-耐热玻璃【二氧化硅、三氧化二硼、氧化钠、氧化钾、三氧化二铝等】 </div>\r\n<div style=\"text-align:left;\">              （热冲击度：120℃以上）耐冷/耐热温度：（PP） -20℃~120℃ , （硅树脂） -40℃~200℃ </div>\r\n<div style=\"text-align:left;\">产 地 : 中国 </div>\r\n<div style=\"text-align:left;\">制造商 : (株)乐扣乐扣中国工厂 </div>\r\n<div style=\"text-align:left;\">进口,销售商: (株)乐扣乐扣 </div>\r\n<div style=\"text-align:left;\"><br /></div>\r\n<div style=\"text-align:left;\">1.可用于微波炉低温加热，冰箱。</div>\r\n<div style=\"text-align:left;\">2.使用ISO9002认证，美国FDA，德国SGS认证通过的安定(全)，卫生检查的原料。</div>\r\n<div style=\"text-align:left;\">3.盒子的锁定装置，通过了100万次的弯曲试验无任何异常。</div>\r\n<div style=\"text-align:left;\">4.通过韩国生活用品实验研究院耐热，耐寒性试验 并获得卫生，安定性的品质。</div>\r\n<div style=\"text-align:left;\">5.品质保证协会指定书（Q-Mark），卫生安全品质认证书（HS-Mark）。 </div>\r\n<div style=\"text-align:left;\"><br /></div>\r\n<div style=\"text-align:left;\">超优良品质厨房用品专家--(株)乐扣乐扣成立于1985年，以世界超一流品牌为目的而开发的功能性保鲜盒‘LOCK &amp; LOCK’系列,通过在世界排行第一位的电视购物公司美国QVC中全美播放,每次播放都突破最高的销售纪录而具有超凡人气，在韩国国内的电视购物销售也被评为“BEST OF BEST”（最优秀的产品），是出口世界70多个国家的厨房用具专门品牌。</div>\r\n<div><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527163746_38262.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110527163752_16687.jpg\" alt=\"\" border=\"0\" /><br /></div>', '', '', null, '0.00', '5', '', '0', '0', '0', '1', 'upload/2011/05/27/20110527043650523_175_175.jpg', 'upload/2011/05/27/20110527043650523_100_100.jpg', 'a:0:{}', '0');
INSERT INTO shop_goods VALUES ('85', '商城正品/大陆行货/Nokia/诺基亚E71/全国联保', 'SD00000000000085', '154', '1490.00', '1599.00', '2011-05-26 15:18:39', '2011-06-11 15:18:41', '2011-05-26 15:20:20', '888', 'upload/2011/05/26/20110526031918879.jpg', '0', '<p><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526160522_61050.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526160528_69216.jpg\" alt=\"\" border=\"0\" /><img src=\"http://shop.jooyea.net/runtime/systemjs/editor/php/../attached/20110526160533_63028.jpg\" alt=\"\" border=\"0\" /></p>\r\n<p></p>\r\n<p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';color:#404040;\">尺寸</span></b></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">机型：带完整键盘的直板机</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">尺寸：</span><span>114 x 57 x 10 </span><span style=\"font-family:\'宋体\';color:#404040;\">毫米</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">重量：</span><span>127 </span><span style=\"font-family:\'宋体\';color:#404040;\">克</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">体积：</span><span>66 </span><span style=\"font-family:\'宋体\';color:#404040;\">立方厘米</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">完整键盘</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">高品质</span><span> QVGA </span><span style=\"font-family:\'宋体\';color:#404040;\">屏幕</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span></p>\r\n<p style=\"margin-left:0cm;text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';color:#404040;\">屏幕和</span></b><b><span> 3D</span></b></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">尺寸：</span><span>2.36 </span><span style=\"font-family:\'宋体\';color:#404040;\">英寸</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">分辨率：</span><span>320 x 240 </span><span style=\"font-family:\'宋体\';color:#404040;\">像素（</span><span>QVGA</span><span style=\"font-family:\'宋体\';color:#404040;\">）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">最高支持</span><span> 1600 </span><span style=\"font-family:\'宋体\';color:#404040;\">万色</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>TFT </span><span style=\"font-family:\'宋体\';color:#404040;\">有源矩阵（</span><span>QVGA</span><span style=\"font-family:\'宋体\';color:#404040;\">）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">两种可自定义的主屏模式</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span></p>\r\n<p style=\"margin-left:0cm;text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';color:#404040;\">安全功能</span></b></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">设备锁</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">远程锁定</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">对手机存储器和</span><span> microSD </span><span style=\"font-family:\'宋体\';color:#404040;\">内容进行数据加密</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">移动</span><span> VPN</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span></p>\r\n<p style=\"margin-left:0cm;text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';color:#404040;\">按键和输入法</span></b></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">完整键盘</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">专用的一键式按键：主屏、日历、名片夹和电子邮件</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">特定语者和非特定语者声控拨号</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">智能输入，含自动完成、自动纠正和学习功能</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">利用</span><span> Navi<sup>TM</sup></span><span style=\"font-family:\'宋体\';color:#404040;\">键加速滚动</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>Navi<sup>TM</sup></span><span style=\"font-family:\'宋体\';color:#404040;\">键指示灯</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span></p>\r\n<p style=\"margin-left:0cm;text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';color:#404040;\">颜色和外壳</span></b></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">标准销售包装内可选的颜色：</span><span><br />\r\n- </span><span style=\"font-family:\'宋体\';color:#404040;\">青灰色</span><span><br />\r\n- </span><span style=\"font-family:\'宋体\';color:#404040;\">银色</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span></p>\r\n<p style=\"margin-left:0cm;text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';color:#404040;\">插孔</span></b></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>Micro-USB </span><span style=\"font-family:\'宋体\';color:#404040;\">全速插孔</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚</span><span> 2.5 </span><span style=\"font-family:\'宋体\';color:#404040;\">毫米</span><span> AV </span><span style=\"font-family:\'宋体\';color:#404040;\">插孔</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span></p>\r\n<p style=\"margin-left:0cm;text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';color:#404040;\">电源</span></b></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>BP-4L 1500 </span><span style=\"font-family:\'宋体\';color:#404040;\">毫安时锂聚合物标配电池</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">通话时间：</span><span><br />\r\n- GSM </span><span style=\"font-family:\'宋体\';color:#404040;\">上限约为</span><span> 10 </span><span style=\"font-family:\'宋体\';color:#404040;\">小时</span><span> 30 </span><span style=\"font-family:\'宋体\';color:#404040;\">分钟</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">待机时间</span><span>:<br />\r\n- GSM </span><span style=\"font-family:\'宋体\';color:#404040;\">上限约为</span><span> 17 </span><span style=\"font-family:\'宋体\';color:#404040;\">天</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">最长音乐播放时间：</span><span>18 </span><span style=\"font-family:\'宋体\';color:#404040;\">小时</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-size:12pt;font-family:\'宋体\';\"> </span></p>\r\n<p style=\"margin-left:0cm;text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';color:#404040;\">存储器</span></b></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">热插拔的</span><span> microSD </span><span style=\"font-family:\'宋体\';color:#404040;\">存储卡插槽（最高支持</span><span> 8 GB</span><span style=\"font-family:\'宋体\';color:#404040;\">）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>110 MB </span><span style=\"font-family:\'宋体\';color:#404040;\">内部动态存储空间</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-family:\'宋体\';color:#404040;\">通信和导航</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span> </span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';color:#404040;\">工作频率</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>E71 </span><span style=\"font-family:\'宋体\';color:#404040;\">四频</span><span> EGSM850/900/1800/1900</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">离线模式</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">数据网络</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>CSD</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>HSCSD</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>GPRS </span><span style=\"font-family:\'宋体\';color:#404040;\">等级</span><span> class A</span><span style=\"font-family:\'宋体\';color:#404040;\">，多时隙等级</span><span> class 32</span><span style=\"font-family:\'宋体\';color:#404040;\">，最高速率</span><span> 100/60 kbps</span><span style=\"font-family:\'宋体\';color:#404040;\">（下行</span><span>/</span><span style=\"font-family:\'宋体\';color:#404040;\">上行）。</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>EDGE </span><span style=\"font-family:\'宋体\';color:#404040;\">等级</span><span> class A</span><span style=\"font-family:\'宋体\';color:#404040;\">，多时隙等级</span><span> class 32</span><span style=\"font-family:\'宋体\';color:#404040;\">，最高速率</span><span> 296/177.6 kbps</span><span style=\"font-family:\'宋体\';color:#404040;\">（下行</span><span>/</span><span style=\"font-family:\'宋体\';color:#404040;\">上行）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持</span><span> TCP/IP</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚</span><span> PC </span><span style=\"font-family:\'宋体\';color:#404040;\">互联网接入（可用作数据调制解调器）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>IETF SIP and 3GPP</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">本地连接和同步</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">红外，最高速率</span><span> 115 kbps</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">蓝牙</span><span> 2.0</span><span style=\"font-family:\'宋体\';color:#404040;\">（增强型数据速率）</span><span><br />\r\n- </span><span style=\"font-family:\'宋体\';color:#404040;\">蓝牙模式：</span><span>DUN</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>OPP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>FTP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>HFP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>GOEP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>HSP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>BIP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>RSAP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>GAVDP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>AVRCP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>A2DP</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持</span><span> MTP</span><span style=\"font-family:\'宋体\';color:#404040;\">（多媒体传输协议）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">蓝牙（蓝牙串口模式。）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">红外</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">文件</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">网络（</span><span>Raw</span><span style=\"font-family:\'宋体\';color:#404040;\">）。通过</span><span> TCP/IP </span><span style=\"font-family:\'宋体\';color:#404040;\">套接字直接连接到任何指定端口（又称为</span><span> HP JetDirectTM</span><span style=\"font-family:\'宋体\';color:#404040;\">）。</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">网络（</span><span>LPR</span><span style=\"font-family:\'宋体\';color:#404040;\">）。行式打印机程序协议（</span><span>RFC1179</span><span style=\"font-family:\'宋体\';color:#404040;\">）。</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持本地和远程</span><span> SyncML </span><span style=\"font-family:\'宋体\';color:#404040;\">同步、</span><span>iSync</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>Intellisync</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>ActiveSync</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">通话功能</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">内置免提扬声器</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">自动接听（与耳机或车载套件配合使用）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">任意键接听</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">呼叫等待、通话保留、呼叫转接</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">通话计时</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">记录已拨电话、已接来电和未接来电</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">自动重拨和回叫</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">单键拨号</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">特定语者和非特定语者声控拨号（</span><span>SDND</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>SIND</span><span style=\"font-family:\'宋体\';color:#404040;\">）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持固定拨号</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">振动提示（内部）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">侧面的音量键</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">静音键</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">带图像的名片夹</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">会议通话</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">按键通话</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">互联网通话（</span><span>VoIP</span><span style=\"font-family:\'宋体\';color:#404040;\">）</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">信息功能</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">短信息</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">同时删除多条短信息</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">语音合成信息阅读器</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">彩信</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">信息收信人列表</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">即时信息（包括支持显示状态信息的增强型动态名片夹）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">广播信息</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">电子邮件</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持的协议：</span><span>IMAP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>POP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>SMTP</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持电子邮件附件</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持</span><span> IMAP IDLE</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持诺基亚</span><span> Intellisync </span><span style=\"font-family:\'宋体\';color:#404040;\">无线电子邮件</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">内置诺基亚移动</span><span> VPN</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">电子邮件设置轻松简单</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">网络浏览</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持的标记语言：</span><span>HTML</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>XHTML</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>MP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>WML</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>CSS</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持的协议：</span><span>HTTP</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>WAP 2.0</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持</span><span> TCP/IP</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚浏览器</span><span><br />\r\n- </span><span style=\"font-family:\'宋体\';color:#404040;\">第</span><span> 1.3 </span><span style=\"font-family:\'宋体\';color:#404040;\">版和</span><span> 1.5 </span><span style=\"font-family:\'宋体\';color:#404040;\">版</span><span> JavaScript<br />\r\n- </span><span style=\"font-family:\'宋体\';color:#404040;\">支持网页领航</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚移动搜索</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚</span><span> PC </span><span style=\"font-family:\'宋体\';color:#404040;\">互联网接入（可用作数据调制解调器）</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">全球定位系统（</span></b><b><span>GPS</span></b><b><span style=\"font-family:\'宋体\';color:#404040;\">）</span></b><b><span> </span></b><b><span style=\"font-family:\'宋体\';color:#404040;\">和导航</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">集成</span><span> A-GPS</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚地图应用程序</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;\" align=\"left\"><span style=\"font-family:\'宋体\';color:#404040;\">图像和声音</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';color:#404040;\">摄影</span></b></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>320 </span><span style=\"font-family:\'宋体\';color:#404040;\">万像素（</span><span>2048 x 1536 </span><span style=\"font-family:\'宋体\';color:#404040;\">像素）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">图像格式：</span><span>JPEG/EXIF</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>CMOS </span><span style=\"font-family:\'宋体\';color:#404040;\">传感器</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">数码变焦</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">自动对焦</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">焦距：</span><span>3.8 </span><span style=\"font-family:\'宋体\';color:#404040;\">毫米</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">焦距范围：</span><span>10 </span><span style=\"font-family:\'宋体\';color:#404040;\">厘米至无限远</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">近距模式焦距：</span><span>10-60 </span><span style=\"font-family:\'宋体\';color:#404040;\">厘米</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>LED </span><span style=\"font-family:\'宋体\';color:#404040;\">闪光灯</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">闪光灯模式：自动、开、防红眼、关</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">闪光灯有效范围：</span><span>1 </span><span style=\"font-family:\'宋体\';color:#404040;\">米</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">白平衡模式：自动、阳光、白炽、荧光</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">中央重点测光自动曝光；曝光补偿：</span><span>+2 ~ -2EV</span><span style=\"font-family:\'宋体\';color:#404040;\">（</span><span>0.7EV </span><span style=\"font-family:\'宋体\';color:#404040;\">间隔）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">拍摄模式：静止、连拍、自动定时器、摄像</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">场景模式：自动、用户定义、近距、纵向、横向、夜间、夜间纵向</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">色调模式：正常、怀旧、黑白、负片</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">带网格的全屏取景器</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">活动工具栏</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">视频</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>640 x 480 </span><span style=\"font-family:\'宋体\';color:#404040;\">像素，每秒</span><span> 22 </span><span style=\"font-family:\'宋体\';color:#404040;\">帧</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>320 x 240</span><span style=\"font-family:\'宋体\';color:#404040;\">（</span><span>QVGA</span><span style=\"font-family:\'宋体\';color:#404040;\">），每秒</span><span> 30/15 </span><span style=\"font-family:\'宋体\';color:#404040;\">帧</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>176 x 144 </span><span style=\"font-family:\'宋体\';color:#404040;\">像素，每秒</span><span> 15 </span><span style=\"font-family:\'宋体\';color:#404040;\">帧（</span><span>QCIF</span><span style=\"font-family:\'宋体\';color:#404040;\">）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">视频数码变焦</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">视频录制文件格式：</span><span>.mp4</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>.3gp</span><span style=\"font-family:\'宋体\';color:#404040;\">；编解码器：</span><span>H.263</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>MPEG-4 VSP</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">音频录制格式：</span><span>AMR</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">视频白平衡模式：自动、阳光、白炽、荧光</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">场景模式：自动、夜间</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">色调模式：正常、怀旧、黑白、负片</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">片段长度（最长）：</span><span>1 </span><span style=\"font-family:\'宋体\';color:#404040;\">小时</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>RealPlayer</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">视频播放文件格式：</span><span>.Flash Lite 3</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>mp4</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>.3gp</span><span style=\"font-family:\'宋体\';color:#404040;\">；编解码器：</span><span>H.263</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>MPEG-4 VSP</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">视频流式播放：</span><span>.3gp</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>mp4</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>.rm</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">可自定义的视频铃声</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">音乐和音频播放</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">音乐播放器</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">媒体播放器</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">音乐播放文件格式：</span><span>.mp3</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>.wma</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>.aac</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>AAC+</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>eAAC+</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">流式音频格式：</span><span>.rm</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>.eAAC+</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">调频收音机</span><span> 87.5-108 </span><span style=\"font-family:\'宋体\';color:#404040;\">兆赫，支持</span><span> RDS</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚</span><span> 2.5 </span><span style=\"font-family:\'宋体\';color:#404040;\">毫米</span><span> AV </span><span style=\"font-family:\'宋体\';color:#404040;\">插孔</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚音乐管理器</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持诺基亚音乐商店</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持诺基亚播客</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">可自定义的铃声</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">与</span><span> Windows MediaPlayer </span><span style=\"font-family:\'宋体\';color:#404040;\">同步音乐</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持</span><span> Navi<sup>TM</sup></span><span style=\"font-family:\'宋体\';color:#404040;\">多媒体导航键</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">语音辅助功能</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">语音和音频录制</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">声控命令</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">特定语者和非特定语者声控拨号（</span><span>SDND</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>SIND</span><span style=\"font-family:\'宋体\';color:#404040;\">）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">录音</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">音频录制格式：</span><span>AMR-WB</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>AMR-NB</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">语音编解码器：</span><span>FR</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>EFR</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>HRO/1</span><span style=\"font-family:\'宋体\';color:#404040;\">、</span><span>AMR-HR </span><span style=\"font-family:\'宋体\';color:#404040;\">和</span><span> AMR-FR</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">语音合成</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">个性化设置：情景模式、主题模式、铃声</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">可自定义的情景模式</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">可自定义的铃声</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">可自定义的视频铃声</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持通话铃声</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">可自定义的主题模式</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">可将主屏内容自定义为商务模式和个人模式</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-family:\'宋体\';color:#404040;\">软件</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span> </span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';color:#404040;\">软件平台和用户界面</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>S60 3.1 </span><span style=\"font-family:\'宋体\';color:#404040;\">版、</span><span>E </span><span style=\"font-family:\'宋体\';color:#404040;\">系列</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>Symbian Os 9.2</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">两种主屏模式，含可自定义的当前待机模式视图</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">语音</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">个人信息管理（</span></b><b><span>PIM</span></b><b><span style=\"font-family:\'宋体\';color:#404040;\">）：名片夹、时钟、日历等</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">高级名片夹数据库：每个联系人可有多个号码和电子邮件详情，联系人可带有图像</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持为联系人指定图像</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持名片组</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持封闭用户组</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">支持固定拨号功能</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">时钟：模拟和数字</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">带铃声的闹钟</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">备忘</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">含各种高级功能的计算器</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">具备周视图和月视图功能的日历</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">单位换算</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">当前笔记</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">待办事项列表</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">通话过程中可查看的</span><span> PIM </span><span style=\"font-family:\'宋体\';color:#404040;\">信息</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span><br /></span><b><span style=\"font-family:\'宋体\';color:#404040;\">应用程序</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>Java<sup>TM</sup>MIDP 2.0</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>Flash Lite 3.0</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">聊天室和即时信息</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚浏览器</span><span><br />\r\n- </span><span style=\"font-family:\'宋体\';color:#404040;\">第</span><span> 1.3 </span><span style=\"font-family:\'宋体\';color:#404040;\">版和</span><span> 1.5 </span><span style=\"font-family:\'宋体\';color:#404040;\">版</span><span> JavaScript<br />\r\n- </span><span style=\"font-family:\'宋体\';color:#404040;\">支持网页领航</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">词典</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>Quickoffice (Quickword, Quickpoint, Quicksheet)</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>PDF </span><span style=\"font-family:\'宋体\';color:#404040;\">查看器</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span>ZIP Manager</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">下载</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">文件管理</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚搜索</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚地图</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">添加更多应用程序：</span><span><br />\r\n- </span><span style=\"font-family:\'宋体\';color:#404040;\">使用</span><span>“</span><span style=\"font-family:\'宋体\';color:#404040;\">下载</span><span>”</span><span style=\"font-family:\'宋体\';color:#404040;\">客户端</span><span><br />\r\n- </span><span style=\"font-family:\'宋体\';color:#404040;\">空中传送（</span><span>OTA</span><span style=\"font-family:\'宋体\';color:#404040;\">）下载</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><span style=\"font-family:\'宋体\';color:#404040;\">配件</span></p>\r\n<p style=\"text-align:left;\" align=\"left\"><b><span style=\"font-family:\'宋体\';color:#404040;\">销售包装内容</span></b><span><br /><br /></span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚</span><span> E71</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚电池</span><span> (BP-4L)</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚充电器（</span><span>AC-8C + CA100C</span><span style=\"font-family:\'宋体\';color:#404040;\">）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span><span style=\"font-family:\'宋体\';color:#404040;\">诺基亚数据线（</span><span>CA-101</span><span style=\"font-family:\'宋体\';color:#404040;\">）</span></p>\r\n<p style=\"margin-left:0cm;text-align:left;text-indent:-18pt;\" align=\"left\"><span style=\"font-size:10pt;font-family:Symbol;color:#404040;\"><span>·<span>        </span></span></span></p>', '', '', null, '0.00', '140', '', '27', '0', '0', '99', 'upload/2011/05/26/20110526031918879_175_175.jpg', 'upload/2011/05/26/20110526031918879_100_100.jpg', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:120:\"upload/2011/05/26/20110526105352343.gif,upload/2011/05/26/20110526105558440.gif,upload/2011/05/26/20110526105552192.gif,\";s:4:\"type\";s:1:\"2\";s:4:\"name\";s:6:\"颜色\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXL,\";s:4:\"type\";s:1:\"1\";s:4:\"name\";s:6:\"尺码\";}}', '0');

-- ----------------------------
-- Table structure for `shop_goods_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_attribute`;
CREATE TABLE `shop_goods_attribute` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) default NULL COMMENT '商品ID',
  `attribute_id` int(11) default NULL COMMENT '属性ID',
  `attribute_value` varchar(500) default NULL COMMENT '属性值',
  `spec_id` int(11) default NULL COMMENT '规格ID',
  `spec_value` varchar(500) default NULL COMMENT '规格值',
  `model_id` int(11) default NULL COMMENT '模型ID',
  `order` int(11) default NULL COMMENT '排序',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3973 DEFAULT CHARSET=utf8 COMMENT='属性值表';

-- ----------------------------
-- Records of shop_goods_attribute
-- ----------------------------
INSERT INTO shop_goods_attribute VALUES ('3248', '104', '179', '乳液状', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3268', '102', '176', '法国', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3267', '102', '177', '所以类型', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3266', '102', '178', '18岁以上', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3265', '102', '180', '抗皱', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3614', '100', '179', '霜状', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3756', '85', '130', '2010', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3807', '103', '115', '碎花', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3608', '101', '180', '抗皱', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3607', '101', '176', '法国', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3264', '102', '179', '霜状', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3606', '101', '178', '18岁以上', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3605', '101', '177', '所以类型', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3806', '103', '116', '夏季', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3805', '103', '117', '淑女', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3613', '100', '178', '18岁以上', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3612', '100', '177', '所以类型', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3611', '100', '176', '法国', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3665', '99', '112', '中腰', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3664', '99', '118', '圆领', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3663', '99', '117', '淑女', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3662', '99', '116', '夏季', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3661', '99', '110', '真丝', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3660', '99', '111', '蕾丝花边', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3659', '99', '115', '纯色', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3804', '103', '118', '圆领', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3803', '103', '112', '高腰', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3658', '99', '114', '常规', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3657', '99', null, null, '74', '1|粉红色', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3636', '94', '153', '160G以下', null, null, '156', null);
INSERT INTO shop_goods_attribute VALUES ('3635', '94', '151', 'MacOS', null, null, '156', null);
INSERT INTO shop_goods_attribute VALUES ('3656', '99', null, null, '74', '1|白色', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3655', '99', null, null, '75', '1|XXL', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3654', '99', null, null, '75', '1|XL', '151', null);
INSERT INTO shop_goods_attribute VALUES ('2110', '93', '152', '有', null, '', '156', null);
INSERT INTO shop_goods_attribute VALUES ('2111', '93', '151', 'Windows7', null, '', '156', null);
INSERT INTO shop_goods_attribute VALUES ('2112', '93', '153', '320G', null, '', '156', null);
INSERT INTO shop_goods_attribute VALUES ('2113', '93', '146', 'Intel', null, '', '156', null);
INSERT INTO shop_goods_attribute VALUES ('2114', '93', '147', '2G', null, '', '156', null);
INSERT INTO shop_goods_attribute VALUES ('2115', '93', '150', '14英寸', null, '', '156', null);
INSERT INTO shop_goods_attribute VALUES ('3634', '94', '147', '1G', null, null, '156', null);
INSERT INTO shop_goods_attribute VALUES ('3633', '94', '146', '其他', null, null, '156', null);
INSERT INTO shop_goods_attribute VALUES ('3632', '94', null, null, '76', '2|upload/2011/05/26/20110526105558440.gif', '156', null);
INSERT INTO shop_goods_attribute VALUES ('3631', '94', null, null, '75', '1|S', '156', null);
INSERT INTO shop_goods_attribute VALUES ('3648', '95', '152', '有', null, null, '156', null);
INSERT INTO shop_goods_attribute VALUES ('3647', '95', '153', '320G', null, null, '156', null);
INSERT INTO shop_goods_attribute VALUES ('3646', '95', '151', 'Windows7', null, null, '156', null);
INSERT INTO shop_goods_attribute VALUES ('3645', '95', '147', '2G', null, null, '156', null);
INSERT INTO shop_goods_attribute VALUES ('3644', '95', '146', 'Intel', null, null, '156', null);
INSERT INTO shop_goods_attribute VALUES ('3643', '95', null, null, '76', '2|upload/2011/05/26/20110526105401935.gif', '156', null);
INSERT INTO shop_goods_attribute VALUES ('3642', '95', null, null, '76', '2|upload/2011/05/26/20110526105509389.gif', '156', null);
INSERT INTO shop_goods_attribute VALUES ('3641', '95', null, null, '76', '2|upload/2011/05/26/20110526105558440.gif', '156', null);
INSERT INTO shop_goods_attribute VALUES ('3640', '95', null, null, '75', '1|S', '156', null);
INSERT INTO shop_goods_attribute VALUES ('3653', '99', null, null, '75', '1|L', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3652', '99', null, null, '75', '1|M', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3651', '99', null, null, '75', '1|S', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3650', '99', null, null, '74', '1|浅灰色', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3755', '85', '129', 'Symbian', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3754', '85', '128', '全键盘', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3767', '88', '144', '光学防抖', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3786', '90', '143', '3.0英寸', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3785', '90', '142', '单反镜头', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3793', '91', '145', '锂电池', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3639', '95', null, null, '76', '2|upload/2011/05/26/20110526105538833.gif', '156', null);
INSERT INTO shop_goods_attribute VALUES ('3630', '94', null, null, '76', '2|upload/2011/05/26/20110526105352343.gif', '156', null);
INSERT INTO shop_goods_attribute VALUES ('3792', '91', '144', '光学防抖', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3700', '77', '132', '3.6-4.0英寸', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3699', '77', '134', '电容屏', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3968', '141', '189', '短袖', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3967', '141', '182', '圆领', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3966', '141', '191', '图形', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3965', '141', '190', '纯棉', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3964', '141', null, null, '78', '1|S', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3077', '130', '219', 'DVD', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3076', '130', '218', '中文', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3075', '130', '217', '2', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3074', '130', '216', '中文', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3073', '130', '215', '大陆', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3873', '113', '191', '横条', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3081', '129', '219', 'DVD', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3104', '125', '213', '流行乐', null, null, '184', null);
INSERT INTO shop_goods_attribute VALUES ('3103', '125', '212', '外语女歌手', null, null, '184', null);
INSERT INTO shop_goods_attribute VALUES ('3102', '125', '214', 'CD', null, null, '184', null);
INSERT INTO shop_goods_attribute VALUES ('3080', '129', '218', '外文', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3079', '129', '217', '2', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3098', '127', '210', '120cm以上', null, null, '183', null);
INSERT INTO shop_goods_attribute VALUES ('3097', '127', '211', '40平米以上', null, null, '183', null);
INSERT INTO shop_goods_attribute VALUES ('3096', '127', '205', '欧式', null, null, '183', null);
INSERT INTO shop_goods_attribute VALUES ('3095', '127', '206', '铁艺', null, null, '183', null);
INSERT INTO shop_goods_attribute VALUES ('3101', '126', '214', 'CD', null, null, '184', null);
INSERT INTO shop_goods_attribute VALUES ('3100', '126', '213', '流行乐', null, null, '184', null);
INSERT INTO shop_goods_attribute VALUES ('3099', '126', '212', '外语女歌手', null, null, '184', null);
INSERT INTO shop_goods_attribute VALUES ('3094', '127', '207', '客厅灯', null, null, '183', null);
INSERT INTO shop_goods_attribute VALUES ('3093', '127', '209', '雅黑', null, null, '183', null);
INSERT INTO shop_goods_attribute VALUES ('3244', '104', '178', '18岁以上', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3802', '103', '113', '短袖', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3801', '103', '110', '真丝', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3800', '103', '111', '蕾丝花边', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3799', '103', null, null, '74', '1|桔色', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3798', '103', null, null, '75', '1|XL', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3797', '103', null, null, '75', '1|L', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3247', '104', '177', '所以类型', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3246', '104', '180', '补水', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3908', '118', '192', '短袖', null, null, '180', null);
INSERT INTO shop_goods_attribute VALUES ('3920', '119', '200', '小尖领', null, null, '181', null);
INSERT INTO shop_goods_attribute VALUES ('3958', '138', '189', '短袖', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3957', '138', '190', '纯棉', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3956', '138', '191', '图形', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3955', '138', '182', '圆领', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3954', '138', null, null, '76', '2|upload/2011/05/26/20110526105352343.gif', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3953', '138', null, null, '78', '1|S', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3952', '138', null, null, '78', '1|M', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3951', '138', null, null, '78', '1|L', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3950', '138', null, null, '78', '1|XL', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3949', '138', null, null, '76', '2|upload/2011/05/26/20110526105558440.gif', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3037', '137', '229', '3米', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3036', '137', '228', '麻', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3035', '137', '227', '碎花', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3034', '137', '226', '垂帘', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3033', '137', '225', '装饰+全遮光', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3032', '137', '224', '温馨田园', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3948', '136', '182', '圆领', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3947', '136', '189', '短袖', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3946', '136', '191', '图形', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3945', '136', '190', '纯棉', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3056', '135', '226', '垂帘', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3055', '135', '225', '装饰+半遮光', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3054', '135', '224', '现代简约', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3072', '131', '223', '黑边', null, null, '186', null);
INSERT INTO shop_goods_attribute VALUES ('3071', '131', '222', '圆形', null, null, '186', null);
INSERT INTO shop_goods_attribute VALUES ('3070', '131', '221', '丙烯树脂', null, null, '186', null);
INSERT INTO shop_goods_attribute VALUES ('3069', '131', '220', '32', null, null, '186', null);
INSERT INTO shop_goods_attribute VALUES ('3053', '135', '227', '碎花', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3052', '135', '228', '纱', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3051', '135', '229', '2.7米', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3068', '132', '219', 'VCD', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3067', '132', '218', '外文', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3066', '132', '216', '中英双语', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3065', '132', '215', '欧洲', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3944', '136', null, null, '76', '2|upload/2011/05/26/20110526105558440.gif', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3943', '136', null, null, '76', '2|upload/2011/05/26/20110526105552192.gif', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3942', '136', null, null, '76', '2|upload/2011/05/26/20110526105352343.gif', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3919', '119', '201', '混纺', null, null, '181', null);
INSERT INTO shop_goods_attribute VALUES ('3603', '133', '215', '大陆', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3602', '133', '217', '5张以上', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3941', '136', null, null, '78', '1|S', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3940', '136', null, null, '78', '1|M', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3939', '136', null, null, '78', '1|L', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3938', '136', null, null, '78', '1|XL', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3937', '136', null, null, '78', '1|XXL', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3936', '136', null, null, '76', '2|upload/2011/05/26/20110526105401935.gif', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3061', '134', '215', '美国', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3060', '134', '216', '中英双语', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3059', '134', '217', '5张以上', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3058', '134', '218', '外文', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3057', '134', '219', 'DVD', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3796', '103', null, null, '75', '1|M', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3795', '103', null, null, '75', '1|S', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3794', '103', null, null, '74', '1|紫色', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3963', '141', null, null, '78', '1|M', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3962', '141', null, null, '78', '1|L', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3961', '141', null, null, '78', '1|XL', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3960', '141', null, null, '78', '1|XXL', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3959', '141', null, null, '76', '2|upload/2011/05/26/20110526105558440.gif', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3020', '140', '225', '装饰+全遮光', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3019', '140', '226', '垂帘', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3018', '140', '227', '碎花', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3017', '140', '228', '纱', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3698', '77', '139', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3697', '77', '138', '数码变焦', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3696', '77', '137', '300-500万', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3695', '77', '136', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3694', '77', '126', 'GSM', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3693', '77', '135', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3692', '77', '127', '直板', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3822', '106', '125', '正常', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3691', '77', '128', '触屏', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3690', '77', '129', 'IOS', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3689', '77', '130', '2010', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3687', '77', null, null, '76', '2|upload/2011/05/26/20110526105352343.gif', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3717', '79', '134', '电容屏', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3716', '79', '139', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3715', '79', '132', '3.6-4.0英寸', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3714', '79', '130', '2010', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3713', '79', '129', 'Android', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3712', '79', '128', '触屏', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3711', '79', '136', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3710', '79', '127', '直板', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3709', '79', '126', 'GSM', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3708', '79', '138', '数码变焦', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3707', '79', '137', '300-500万', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3706', '79', '135', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3705', '79', null, null, '76', '2|upload/2011/05/26/20110526105558440.gif', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3704', '79', null, null, '78', '1|XXL', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3737', '82', '134', '电阻屏', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3736', '82', '132', '3.1-3.5英寸', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3735', '82', '133', '1670万色', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3734', '82', '126', 'GSM', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3733', '82', '129', 'Symbian', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3732', '82', '128', '触屏', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3731', '82', '127', '直板', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3730', '82', '130', '2010', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3729', '82', '131', '不支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3821', '106', '124', '多口袋', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3728', '82', '139', '不支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3727', '82', '140', '不支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3726', '82', null, null, '76', '2|upload/2011/05/26/20110526105352343.gif', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3725', '82', null, null, '76', '2|upload/2011/05/26/20110526105552192.gif', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3724', '82', null, null, '76', '2|upload/2011/05/26/20110526105538833.gif', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3753', '85', '126', 'GSM', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3752', '85', '127', '直板', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3751', '85', '134', '不支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3750', '85', '135', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3749', '85', '137', '200-300万', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3833', '108', '122', '纯棉', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3748', '85', '138', '数码变焦', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3747', '85', '139', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3746', '85', '140', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3848', '109', '114', '中长（及膝）', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3016', '140', '229', '3米', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3703', '79', null, null, '76', '2|upload/2011/05/26/20110526105352343.gif', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3862', '111', '114', '常规', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3723', '82', null, null, '76', '2|upload/2011/05/26/20110526105558440.gif', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3722', '82', null, null, '78', '1|XXL', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3721', '82', null, null, '76', '2|upload/2011/05/26/20110526105401935.gif', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3745', '85', null, null, '76', '2|upload/2011/05/26/20110526105552192.gif', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3744', '85', null, null, '76', '2|upload/2011/05/26/20110526105558440.gif', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3743', '85', null, null, '78', '1|XXL', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3742', '85', null, null, '76', '2|upload/2011/05/26/20110526105352343.gif', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3766', '88', '145', '锂电池', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3765', '88', null, null, '76', '2|upload/2011/05/26/20110526105415915.gif', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3764', '88', null, null, '76', '2|upload/2011/05/26/20110526105544210.gif', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3970', '112', null, null, '75', '1|XXL', '168', null);
INSERT INTO shop_goods_attribute VALUES ('3763', '88', null, null, '76', '2|upload/2011/05/26/20110526105401935.gif', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3762', '88', null, null, '78', '1|XXL', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3761', '88', null, null, '76', '2|upload/2011/05/26/20110526105515484.gif', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3775', '89', '141', '1200-1399万', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3774', '89', null, null, '76', '2|upload/2011/05/26/20110526105538833.gif', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3773', '89', null, null, '76', '2|upload/2011/05/26/20110526105606611.gif', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3972', '114', null, null, '78', '1|XXL', '175', null);
INSERT INTO shop_goods_attribute VALUES ('3772', '89', null, null, '78', '1|XXL', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3771', '89', null, null, '76', '2|upload/2011/05/26/20110526105515484.gif', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3784', '90', '141', '1400-1599万', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3783', '90', '144', '光学防抖', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3782', '90', '145', '锂电池', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3781', '90', null, null, '78', '1|XXL', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3780', '90', null, null, '82', '1|套餐一', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3791', '91', '141', '1400-1599万', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3790', '91', '142', '单反镜头', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3789', '91', '143', '3.5英寸', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3788', '91', null, null, '78', '1|XXL', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3787', '91', null, null, '82', '1|套餐一', '155', null);
INSERT INTO shop_goods_attribute VALUES ('3245', '104', '176', '法国', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3820', '106', '123', '水洗', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3819', '106', '122', '纯棉', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3818', '106', '119', '牛仔', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3817', '106', '120', '直筒', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3816', '106', '121', '中腰', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3815', '106', null, null, '77', '1|32(2尺5)', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3814', '106', null, null, '77', '1|31(2尺4)', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3813', '106', null, null, '77', '1|30(2尺3)', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3812', '106', null, null, '77', '1|29(2尺2)', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3229', '107', '179', '乳液状', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3228', '107', '178', '18岁以上', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3227', '107', '177', '所以类型', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3226', '107', '176', '法国', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3811', '106', null, null, '77', '1|28(2尺1)', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3810', '106', null, null, '75', '1|XL', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3809', '106', null, null, '77', '1|27(2尺)', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3832', '108', '119', '牛仔', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3831', '108', '120', '直筒', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3830', '108', '121', '中腰', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3829', '108', '124', '多口袋', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3828', '108', null, null, '77', '1|31(2尺4)', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3827', '108', null, null, '77', '1|30(2尺3)', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3826', '108', null, null, '77', '1|29(2尺2)', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3847', '109', '113', '短袖', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3846', '109', '112', '高腰', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3845', '109', '111', '蕾丝花边', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3844', '109', '110', '真丝', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3843', '109', '116', '夏季', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3842', '109', '117', '休闲', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3841', '109', '118', 'V领', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3840', '109', null, null, '75', '1|S', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3839', '109', null, null, '75', '1|XL', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3838', '109', null, null, '75', '1|L', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3198', '110', '184', '法国', null, null, '175', null);
INSERT INTO shop_goods_attribute VALUES ('3837', '109', null, null, '75', '1|M', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3836', '109', null, null, '74', '1|紫色', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3825', '108', null, null, '77', '1|28(2尺1)', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3824', '108', null, null, '75', '1|XL', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3823', '108', null, null, '77', '1|27(2尺)', '152', null);
INSERT INTO shop_goods_attribute VALUES ('3861', '111', '113', '无袖/背心裙', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3860', '111', '112', '中腰', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3859', '111', '111', '荷叶边', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3858', '111', '110', '真丝', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3857', '111', '116', '夏季', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3856', '111', '117', '韩版', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3855', '111', '118', '圆领', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3854', '111', null, null, '75', '1|XXL', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3853', '111', null, null, '75', '1|XL', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3852', '111', null, null, '75', '1|L', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3851', '111', null, null, '75', '1|M', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3850', '111', null, null, '74', '1|浅黄色', '151', null);
INSERT INTO shop_goods_attribute VALUES ('3969', '112', null, null, '83', '1|50ml', '168', null);
INSERT INTO shop_goods_attribute VALUES ('3872', '113', '190', '纯棉', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3871', '113', null, null, '76', '2|upload/2011/05/26/20110526105352343.gif', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3870', '113', null, null, '78', '1|M', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3869', '113', null, null, '78', '1|L', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3868', '113', null, null, '78', '1|XL', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3867', '113', null, null, '78', '1|XXL', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3866', '113', null, null, '76', '2|upload/2011/05/26/20110526105401935.gif', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3971', '114', null, null, '83', '1|50ml', '175', null);
INSERT INTO shop_goods_attribute VALUES ('3886', '115', '191', '纯色', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3885', '115', null, null, '76', '2|upload/2011/05/26/20110526105558440.gif', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3884', '115', null, null, '76', '2|upload/2011/05/26/20110526105352343.gif', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3883', '115', null, null, '78', '1|XXL', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3882', '115', null, null, '78', '1|XL', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3881', '115', null, null, '78', '1|L', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3880', '115', null, null, '78', '1|M', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3879', '115', null, null, '78', '1|S', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3878', '115', null, null, '76', '2|upload/2011/05/26/20110526105606611.gif', '169', null);
INSERT INTO shop_goods_attribute VALUES ('3900', '116', '195', '纯色', null, null, '180', null);
INSERT INTO shop_goods_attribute VALUES ('3899', '116', '194', '纯棉', null, null, '180', null);
INSERT INTO shop_goods_attribute VALUES ('3898', '116', '192', '中袖', null, null, '180', null);
INSERT INTO shop_goods_attribute VALUES ('3897', '116', '193', '圆领', null, null, '180', null);
INSERT INTO shop_goods_attribute VALUES ('3896', '116', '197', '韩版', null, null, '180', null);
INSERT INTO shop_goods_attribute VALUES ('3895', '116', '198', '中长款', null, null, '180', null);
INSERT INTO shop_goods_attribute VALUES ('3894', '116', null, null, '74', '1|桔色', '180', null);
INSERT INTO shop_goods_attribute VALUES ('3893', '116', null, null, '75', '1|XL', '180', null);
INSERT INTO shop_goods_attribute VALUES ('3892', '116', null, null, '75', '1|L', '180', null);
INSERT INTO shop_goods_attribute VALUES ('3891', '116', null, null, '75', '1|M', '180', null);
INSERT INTO shop_goods_attribute VALUES ('3890', '116', null, null, '74', '1|紫色', '180', null);
INSERT INTO shop_goods_attribute VALUES ('3146', '117', '204', '平装', null, null, '182', null);
INSERT INTO shop_goods_attribute VALUES ('3907', '118', '194', '纯棉', null, null, '180', null);
INSERT INTO shop_goods_attribute VALUES ('3906', '118', '195', '纯色', null, null, '180', null);
INSERT INTO shop_goods_attribute VALUES ('3905', '118', '196', '荷叶边', null, null, '180', null);
INSERT INTO shop_goods_attribute VALUES ('3904', '118', null, null, '74', '1|绿色', '180', null);
INSERT INTO shop_goods_attribute VALUES ('3903', '118', null, null, '74', '1|红色', '180', null);
INSERT INTO shop_goods_attribute VALUES ('3902', '118', null, null, '78', '1|均码', '180', null);
INSERT INTO shop_goods_attribute VALUES ('3901', '118', null, null, '74', '1|天蓝色', '180', null);
INSERT INTO shop_goods_attribute VALUES ('3918', '119', '199', '短袖', null, null, '181', null);
INSERT INTO shop_goods_attribute VALUES ('3917', '119', '202', '直筒型', null, null, '181', null);
INSERT INTO shop_goods_attribute VALUES ('3916', '119', '203', '纯色', null, null, '181', null);
INSERT INTO shop_goods_attribute VALUES ('3915', '119', null, null, '78', '1|XL', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3914', '119', null, null, '78', '1|L', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3913', '119', null, null, '78', '1|M', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3912', '119', null, null, '78', '1|S', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3911', '119', null, null, '76', '2|upload/2011/05/26/20110526105352343.gif', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3125', '120', '204', '平装', null, null, '182', null);
INSERT INTO shop_goods_attribute VALUES ('3935', '121', '200', '方领', null, null, '181', null);
INSERT INTO shop_goods_attribute VALUES ('3934', '121', '199', '短袖', null, null, '181', null);
INSERT INTO shop_goods_attribute VALUES ('3933', '121', '203', '纯色', null, null, '181', null);
INSERT INTO shop_goods_attribute VALUES ('3932', '121', '202', '直筒型', null, null, '181', null);
INSERT INTO shop_goods_attribute VALUES ('3931', '121', '201', '纯棉', null, null, '181', null);
INSERT INTO shop_goods_attribute VALUES ('3930', '121', null, null, '76', '2|upload/2011/05/26/20110526105558440.gif', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3929', '121', null, null, '76', '2|upload/2011/05/26/20110526105352343.gif', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3928', '121', null, null, '76', '2|upload/2011/05/26/20110526105415915.gif', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3927', '121', null, null, '76', '2|upload/2011/05/26/20110526105538833.gif', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3926', '121', null, null, '78', '1|XXXL', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3925', '121', null, null, '78', '1|XXL', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3924', '121', null, null, '78', '1|XL', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3923', '121', null, null, '78', '1|L', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3922', '121', null, null, '78', '1|M', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3921', '121', null, null, '76', '2|upload/2011/05/26/20110526105509389.gif', '181', null);
INSERT INTO shop_goods_attribute VALUES ('3108', '122', '204', '平装', null, null, '182', null);
INSERT INTO shop_goods_attribute VALUES ('3078', '129', '215', '欧洲', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3086', '128', '219', 'VCD', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3085', '128', '218', '中文', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3084', '128', '217', '1', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3083', '128', '216', '中文', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3082', '128', '215', '大陆', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3107', '124', '212', '华语女歌手', null, null, '184', null);
INSERT INTO shop_goods_attribute VALUES ('3021', '140', '224', '现代简约', null, null, '187', null);
INSERT INTO shop_goods_attribute VALUES ('3106', '124', '213', '流行乐', null, null, '184', null);
INSERT INTO shop_goods_attribute VALUES ('3105', '124', '214', 'CD', null, null, '184', null);
INSERT INTO shop_goods_attribute VALUES ('3688', '77', '131', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3604', '133', '216', '中文', null, null, '185', null);
INSERT INTO shop_goods_attribute VALUES ('3609', '101', '181', '日霜', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3610', '101', '179', '霜状', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3615', '100', '180', '美白', null, null, '168', null);
INSERT INTO shop_goods_attribute VALUES ('3637', '94', '152', '有', null, null, '156', null);
INSERT INTO shop_goods_attribute VALUES ('3638', '94', '150', '10英寸以下', null, null, '156', null);
INSERT INTO shop_goods_attribute VALUES ('3649', '95', '150', '13英寸', null, null, '156', null);
INSERT INTO shop_goods_attribute VALUES ('3666', '99', '113', '短袖', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3686', '77', null, null, '78', '1|XXL', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3685', '77', null, null, '76', '2|upload/2011/05/26/20110526105558440.gif', '154', null);
INSERT INTO shop_goods_attribute VALUES ('3701', '77', '133', '1670万色', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3702', '77', '140', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3718', '79', '133', '26万色', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3719', '79', '131', '不支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3720', '79', '140', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3738', '82', '135', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3739', '82', '136', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3740', '82', '137', '130-200万', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3741', '82', '138', '数码变焦', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3757', '85', '131', '不支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3758', '85', '132', '2.6-3.0英寸', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3759', '85', '133', '1670万色', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3760', '85', '136', '支持', null, null, '154', null);
INSERT INTO shop_goods_attribute VALUES ('3768', '88', '143', '2.7英寸', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3769', '88', '141', '1200-1399万', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3770', '88', '142', '4-5倍', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3776', '89', '142', '4-5倍', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3777', '89', '143', '3.0英寸', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3778', '89', '144', '光学防抖', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3779', '89', '145', '锂电池', null, null, '155', null);
INSERT INTO shop_goods_attribute VALUES ('3808', '103', '114', '常规', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3834', '108', '123', '水洗', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3835', '108', '125', '五分', null, null, '152', null);
INSERT INTO shop_goods_attribute VALUES ('3849', '109', '115', '纯色', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3863', '111', '115', '纯色', null, null, '151', null);
INSERT INTO shop_goods_attribute VALUES ('3874', '113', '189', '短袖', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3875', '113', '182', '翻领', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3887', '115', '190', '纯棉', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3888', '115', '182', '圆领', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3889', '115', '189', '短袖', null, null, '169', null);
INSERT INTO shop_goods_attribute VALUES ('3909', '118', '193', 'V领', null, null, '180', null);
INSERT INTO shop_goods_attribute VALUES ('3910', '118', '198', '常规', null, null, '180', null);

-- ----------------------------
-- Table structure for `shop_goods_car`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_car`;
CREATE TABLE `shop_goods_car` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL COMMENT '用户ID',
  `content` text COMMENT '购物内容',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of shop_goods_car
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_goods_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_keywords`;
CREATE TABLE `shop_goods_keywords` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `keywords` text NOT NULL COMMENT '商品对应的关键词',
  PRIMARY KEY  (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品与关键词关系表';

-- ----------------------------
-- Records of shop_goods_keywords
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_goods_photo`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_photo`;
CREATE TABLE `shop_goods_photo` (
  `id` char(32) NOT NULL COMMENT '图片的md5值',
  `img` varchar(255) default NULL COMMENT '原始图片路径',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片表';

-- ----------------------------
-- Records of shop_goods_photo
-- ----------------------------
INSERT INTO shop_goods_photo VALUES ('5d65dc20fe422b539e0c74ae5d3d3975', 'upload/2011/05/23/20110523115707758.jpg');
INSERT INTO shop_goods_photo VALUES ('711c05af882f30a5a3567ffceae68105', 'upload/2011/05/23/20110523100725937.jpg');
INSERT INTO shop_goods_photo VALUES ('fcc4b9e8354c4a038e38181a0f7ad78f', 'upload/2011/05/23/20110523101758858.jpg');
INSERT INTO shop_goods_photo VALUES ('c300d8de2a7a2f27a56e78c3446f601f', 'upload/2011/05/23/20110523102017279.jpg');
INSERT INTO shop_goods_photo VALUES ('96d39cd40f250cb7faabd65d0077e0ea', 'upload/2011/05/23/20110523103006240.jpg');
INSERT INTO shop_goods_photo VALUES ('e8dced78d56039f1af0488a9e14003b3', 'upload/2011/05/23/20110523104249878.jpg');
INSERT INTO shop_goods_photo VALUES ('fe2932fbaf5bdfd9561d10d6e03b62cc', 'upload/2011/05/23/20110523104259919.png');
INSERT INTO shop_goods_photo VALUES ('2b5da2b3d6b883dd25dbb019aa1c11b2', 'upload/2011/05/23/20110523104308548.png');
INSERT INTO shop_goods_photo VALUES ('bc6555d0041ed1df1bb7991637a0921b', 'upload/2011/05/23/20110523104316292.png');
INSERT INTO shop_goods_photo VALUES ('3935f16319a5f8dd2a3696f689deac68', 'upload/2011/05/23/20110523104326728.png');
INSERT INTO shop_goods_photo VALUES ('d4a5ddfc5ce8caff7336025fabdde36f', 'upload/2011/05/23/20110523112006500.jpg');
INSERT INTO shop_goods_photo VALUES ('e77e6479ab5733f0a68de4b3960d6d50', 'upload/2011/05/23/20110523112018456.jpg');
INSERT INTO shop_goods_photo VALUES ('f64a32a3e4a67ddc528740f02645fb9a', 'upload/2011/05/23/20110523112533743.jpg');
INSERT INTO shop_goods_photo VALUES ('ff11a78c2d4ead1d08a10d70cdaa5918', 'upload/2011/05/23/20110523112829843.jpg');
INSERT INTO shop_goods_photo VALUES ('55c8d54f450c1551a66f4f5610f64708', 'upload/2011/05/23/20110523113531790.jpg');
INSERT INTO shop_goods_photo VALUES ('ffea3ed1fb5cb92aaaba1d658e856a4b', 'upload/2011/05/23/20110523114106710.jpg');
INSERT INTO shop_goods_photo VALUES ('f32c8fbbdfcacef7522d54a247c9a5b3', 'upload/2011/05/23/20110523114157258.jpg');
INSERT INTO shop_goods_photo VALUES ('94e8cacf5d086d12aa376a8c6f9c1c38', 'upload/2011/05/23/20110523114747662.jpg');
INSERT INTO shop_goods_photo VALUES ('fbac000d15a45ade177b6db104feafae', 'upload/2011/05/23/20110523114844813.jpg');
INSERT INTO shop_goods_photo VALUES ('fdb2fd1cb2c239456f9e03c9854d9e7e', 'upload/2011/05/23/20110523114945650.jpg');
INSERT INTO shop_goods_photo VALUES ('fe255cf42f9c703f4798bbe727d5ef97', 'upload/2011/05/23/20110523115055840.jpg');
INSERT INTO shop_goods_photo VALUES ('8cf5669f3cf049db19a3300e1b89dcbf', 'upload/2011/05/23/20110523115406409.jpg');
INSERT INTO shop_goods_photo VALUES ('5e3bca3e5855799e5f83bba30f1f9ffc', 'upload/2011/05/23/20110523115724532.jpg');
INSERT INTO shop_goods_photo VALUES ('1679d71bef844f11cf2e5200d27a94d9', 'upload/2011/05/23/20110523011827449.jpg');
INSERT INTO shop_goods_photo VALUES ('fdd77eccdda8b045eb74198d3fa87540', 'upload/2011/05/23/20110523012112741.jpg');
INSERT INTO shop_goods_photo VALUES ('e028de13d652c38cf412299f96d8b02a', 'upload/2011/05/23/20110523020546168.jpg');
INSERT INTO shop_goods_photo VALUES ('9867cf13b4b98fc87b3ad8471f2709a6', 'upload/2011/05/23/20110523033110241.jpg');
INSERT INTO shop_goods_photo VALUES ('688b2bd3b1a6f415be87f8a54c5705c9', 'upload/2011/05/23/20110523042909741.jpg');
INSERT INTO shop_goods_photo VALUES ('a104cbf2068c99a14e3c5d3d9515a304', 'upload/2011/05/23/20110523042914849.jpg');
INSERT INTO shop_goods_photo VALUES ('06548d8a1ac7e9624e273c25acae7b20', 'upload/2011/05/23/20110523042920222.jpg');
INSERT INTO shop_goods_photo VALUES ('08a58dcf78a5712b947315b0926d6801', 'upload/2011/05/23/20110523042935251.jpg');
INSERT INTO shop_goods_photo VALUES ('a7d054a4d6fca494432647127a35e919', 'upload/2011/05/23/20110523053946163.jpg');
INSERT INTO shop_goods_photo VALUES ('e2fc5ae3e60a536a9035ea03b7e16dad', 'upload/2011/05/26/20110526013447376.jpg');
INSERT INTO shop_goods_photo VALUES ('0eec89f69f1a26036aa088413ff62daa', 'upload/2011/05/26/20110526013447950.jpg');
INSERT INTO shop_goods_photo VALUES ('e3fea369604a6ebdcac01e38f117bf9d', 'upload/2011/05/26/20110526020153653.jpg');
INSERT INTO shop_goods_photo VALUES ('597e4ca5f95e29f841751adceca8325e', 'upload/2011/05/26/20110526020158254.jpg');
INSERT INTO shop_goods_photo VALUES ('b1323b1530744b089ccd7f85a171167f', 'upload/2011/05/26/20110526020158712.jpg');
INSERT INTO shop_goods_photo VALUES ('7f7ee17d7404c87776b422474f2c7154', 'upload/2011/05/26/20110526020158972.jpg');
INSERT INTO shop_goods_photo VALUES ('8522299dd1fd344c8382f4c0ce22c454', 'upload/2011/05/26/20110526022525607.jpg');
INSERT INTO shop_goods_photo VALUES ('214a0a881332e0e0debce6d921a18d88', 'upload/2011/05/26/20110526022528639.jpg');
INSERT INTO shop_goods_photo VALUES ('0df9eae1e86cd34d230ab72c3a6bbb90', 'upload/2011/05/26/20110526022531984.jpg');
INSERT INTO shop_goods_photo VALUES ('add4412acaec0bebf6f857f202afb5cb', 'upload/2011/05/26/20110526030250202.jpg');
INSERT INTO shop_goods_photo VALUES ('2537f7d211ba69254947348fa282d1cc', 'upload/2011/05/26/20110526030257967.jpg');
INSERT INTO shop_goods_photo VALUES ('8ee51febe4c81e582e56b92e70b8eaad', 'upload/2011/05/26/20110526030258404.jpg');
INSERT INTO shop_goods_photo VALUES ('25a2590cba268ac2d06a38181aa0f636', 'upload/2011/05/26/20110526031918879.jpg');
INSERT INTO shop_goods_photo VALUES ('0ac247738052cf0b784bdfef5875106b', 'upload/2011/05/26/20110526034422792.jpg');
INSERT INTO shop_goods_photo VALUES ('5b7a3f6672c26afcc947211e8b993ca2', 'upload/2011/05/26/20110526035236248.jpg');
INSERT INTO shop_goods_photo VALUES ('f79100c3186169f7e12576ee1e3a54ad', 'upload/2011/05/26/20110526050034797.jpg');
INSERT INTO shop_goods_photo VALUES ('b6abaa96a93b7f7e85465c07edcc453e', 'upload/2011/05/26/20110526050039171.jpg');
INSERT INTO shop_goods_photo VALUES ('f9459ae72796474d90badd3efa77f0aa', 'upload/2011/05/26/20110526050040177.jpg');
INSERT INTO shop_goods_photo VALUES ('35304222a1df029c4bf79e1fb5cb7da4', 'upload/2011/05/26/20110526050041328.jpg');
INSERT INTO shop_goods_photo VALUES ('962d0c800305a3be5f5514db8a2ce8f9', 'upload/2011/05/26/20110526050546652.jpg');
INSERT INTO shop_goods_photo VALUES ('ce58c96bcf60503172fe86e3d9660b16', 'upload/2011/05/26/20110526050549108.jpg');
INSERT INTO shop_goods_photo VALUES ('1641705eb368f2b18ae7e62052dbf52c', 'upload/2011/05/26/20110526050549865.jpg');
INSERT INTO shop_goods_photo VALUES ('6dedb36d2549022eed8ada7cf2ae08af', 'upload/2011/05/26/20110526051016735.jpg');
INSERT INTO shop_goods_photo VALUES ('c10b32940d6ce461965aea2df398fa79', 'upload/2011/05/26/20110526051023963.jpg');
INSERT INTO shop_goods_photo VALUES ('4fc0fd54c9c608deee52e77b2796cc6e', 'upload/2011/05/26/20110526051024228.jpg');
INSERT INTO shop_goods_photo VALUES ('698c45b98800d76d2d757a3f12889593', 'upload/2011/05/26/20110526051436586.jpg');
INSERT INTO shop_goods_photo VALUES ('13b8e3171a1cab0c4b4a2704066c54f0', 'upload/2011/05/26/20110526051445520.jpg');
INSERT INTO shop_goods_photo VALUES ('73193d0f2700b4b74fb1763b514c60d4', 'upload/2011/05/26/20110526051445321.jpg');
INSERT INTO shop_goods_photo VALUES ('3bc4f634a8a3ac326a5a6674b70f3872', 'upload/2011/05/26/20110526051446363.jpg');
INSERT INTO shop_goods_photo VALUES ('a050416e8f1051d209eaf0f016448b1d', 'upload/2011/05/27/20110527095041824.jpg');
INSERT INTO shop_goods_photo VALUES ('5a63084581fc8b44b6f28b9385db1da3', 'upload/2011/05/27/20110527095048453.jpg');
INSERT INTO shop_goods_photo VALUES ('63b77231328118480480f807e94cc64c', 'upload/2011/05/27/20110527095052725.jpg');
INSERT INTO shop_goods_photo VALUES ('71c07376cfb9cf25e9f1de76ed3b94e7', 'upload/2011/05/27/20110527095056998.jpg');
INSERT INTO shop_goods_photo VALUES ('f2caef88b33ee5fb63d4a3ef484a6561', 'upload/2011/05/27/20110527095056136.jpg');
INSERT INTO shop_goods_photo VALUES ('57a355bd1b78b254b7f0a90dd07d0ab5', 'upload/2011/05/27/20110527101508439.jpg');
INSERT INTO shop_goods_photo VALUES ('3dccf66f018b53fa4ab4c57ab41beaad', 'upload/2011/05/27/20110527101512867.jpg');
INSERT INTO shop_goods_photo VALUES ('48fa5a6363b664d2894c97c239a3a568', 'upload/2011/05/27/20110527101512945.jpg');
INSERT INTO shop_goods_photo VALUES ('aefdf47fc3a2032c1b7c731a77b322e6', 'upload/2011/05/27/20110527101513365.jpg');
INSERT INTO shop_goods_photo VALUES ('446dbbceba778be13068762c718faacb', 'upload/2011/05/27/20110527101513914.jpg');
INSERT INTO shop_goods_photo VALUES ('5deaf6b18372bbaffadf93fa7f1a7f75', 'upload/2011/05/27/20110527101514605.jpg');
INSERT INTO shop_goods_photo VALUES ('447ca463b3bd9c9b2e6671698f07b878', 'upload/2011/05/27/20110527101931485.jpg');
INSERT INTO shop_goods_photo VALUES ('0952528040eb39f958fb4a55195d8012', 'upload/2011/05/27/20110527101938716.jpg');
INSERT INTO shop_goods_photo VALUES ('a229ecb3a203f98baa5a445c16e41cd9', 'upload/2011/05/27/20110527101938652.jpg');
INSERT INTO shop_goods_photo VALUES ('b2ed2a4290757def0f3b66b59ee7ac63', 'upload/2011/05/27/20110527104600579.png');
INSERT INTO shop_goods_photo VALUES ('0d91730f121cc755ea71bfbecec72a55', 'upload/2011/05/27/20110527104606101.png');
INSERT INTO shop_goods_photo VALUES ('105f5db9b17af31429ad06d2a7dfa18b', 'upload/2011/05/27/20110527104609831.png');
INSERT INTO shop_goods_photo VALUES ('6699221ecf89d5bf40f19948001b54f4', 'upload/2011/05/27/20110527105307406.png');
INSERT INTO shop_goods_photo VALUES ('bfa745a86aceacf09355b614672668fe', 'upload/2011/05/27/20110527105323721.png');
INSERT INTO shop_goods_photo VALUES ('87de4f05ec4857449007ece1519b6e50', 'upload/2011/05/27/20110527110140751.png');
INSERT INTO shop_goods_photo VALUES ('686217397bf954ee0281752124a5f031', 'upload/2011/05/27/20110527110445620.jpg');
INSERT INTO shop_goods_photo VALUES ('8fbb1d6e0e6a4fdd999aff5ffdbd81e3', 'upload/2011/05/27/20110527110448863.jpg');
INSERT INTO shop_goods_photo VALUES ('bbc83d34052d0835a54279decf55f762', 'upload/2011/05/27/20110527110450765.jpg');
INSERT INTO shop_goods_photo VALUES ('eb1db3ded82800c7400e113a712233ef', 'upload/2011/05/27/20110527110453351.jpg');
INSERT INTO shop_goods_photo VALUES ('c81a61c8e48bd20a32cda15b38a89105', 'upload/2011/05/27/20110527110459544.jpg');
INSERT INTO shop_goods_photo VALUES ('463860be929bd353cbe9cc5b8c40d574', 'upload/2011/05/27/20110527112145724.png');
INSERT INTO shop_goods_photo VALUES ('f3af4694261f0f3e7b6a70ce1dcf6acb', 'upload/2011/05/27/20110527112724158.png');
INSERT INTO shop_goods_photo VALUES ('8ad41d593c2b70970871c68af95ee72c', 'upload/2011/05/27/20110527112851582.jpg');
INSERT INTO shop_goods_photo VALUES ('3dc5ae6767f2e75234ed100ef7b3fb8e', 'upload/2011/05/27/20110527113413959.png');
INSERT INTO shop_goods_photo VALUES ('835c717e824106a794aafd0e3fa1c57d', 'upload/2011/05/27/20110527113535353.jpg');
INSERT INTO shop_goods_photo VALUES ('df3aa0b859328900daa87b4be636563b', 'upload/2011/05/27/20110527113538410.jpg');
INSERT INTO shop_goods_photo VALUES ('8cf82baa085b33f40a43ed232df3b257', 'upload/2011/05/27/20110527113541567.jpg');
INSERT INTO shop_goods_photo VALUES ('a71d4efaaede7e119dc84e05ed3de0c0', 'upload/2011/05/27/20110527113544205.jpg');
INSERT INTO shop_goods_photo VALUES ('bc48b1635689c7f80557b9b791fb73dd', 'upload/2011/05/27/20110527114433106.png');
INSERT INTO shop_goods_photo VALUES ('0610b1cc9b4a56e5f1cb5ccbbf96bc62', 'upload/2011/05/27/20110527115021906.png');
INSERT INTO shop_goods_photo VALUES ('6bd216a6f6f3a8e140b1dc308c6419fe', 'upload/2011/05/27/20110527115206152.jpg');
INSERT INTO shop_goods_photo VALUES ('f7fdab923afded1cdc00f5407284ac71', 'upload/2011/05/27/20110527115227416.jpg');
INSERT INTO shop_goods_photo VALUES ('4b51702f65f886a250baae67168d3663', 'upload/2011/05/27/20110527115227797.jpg');
INSERT INTO shop_goods_photo VALUES ('01607549ed4b2408766f59f8ecbab3fc', 'upload/2011/05/27/20110527115452709.png');
INSERT INTO shop_goods_photo VALUES ('6c18ccc24a39f048b9acd66b6b05366a', 'upload/2011/05/27/20110527115745462.jpg');
INSERT INTO shop_goods_photo VALUES ('583658259a9d458c03fa6c9a534c2a75', 'upload/2011/05/27/20110527115749930.jpg');
INSERT INTO shop_goods_photo VALUES ('4fe0b6d1750e72f7560e06589ed79669', 'upload/2011/05/27/20110527115751317.jpg');
INSERT INTO shop_goods_photo VALUES ('3f64b87aebe0a4f75e3612f85c55e7d1', 'upload/2011/05/27/20110527115753448.jpg');
INSERT INTO shop_goods_photo VALUES ('c88e6064d9b3f230854dc8f970a16c10', 'upload/2011/05/27/20110527115754255.jpg');
INSERT INTO shop_goods_photo VALUES ('04e6f5d437661019e97625a8ac07cb6f', 'upload/2011/05/27/20110527115759185.jpg');
INSERT INTO shop_goods_photo VALUES ('85b3c9ac4751eb582879088cad6ce0ce', 'upload/2011/05/27/20110527115954190.png');
INSERT INTO shop_goods_photo VALUES ('20fc383d7462b8c03e27b5ce0833d268', 'upload/2011/05/27/20110527011904747.jpg');
INSERT INTO shop_goods_photo VALUES ('c3a287e7acf0ef1534c8498bd7878c42', 'upload/2011/05/27/20110527011907525.jpg');
INSERT INTO shop_goods_photo VALUES ('5702f40472d112fedbb979d12f371b74', 'upload/2011/05/27/20110527011921347.jpg');
INSERT INTO shop_goods_photo VALUES ('319e99cd87ba05cd839683d6a39d416d', 'upload/2011/05/27/20110527012242961.jpg');
INSERT INTO shop_goods_photo VALUES ('5a6afd72204cb810d74a054775d1696e', 'upload/2011/05/27/20110527012245873.jpg');
INSERT INTO shop_goods_photo VALUES ('8a81f50f4169e5160dff2b125f001f7c', 'upload/2011/05/27/20110527014229231.png');
INSERT INTO shop_goods_photo VALUES ('9b88a1e10b8200fc590ece112f07dfbc', 'upload/2011/05/27/20110527014331610.jpg');
INSERT INTO shop_goods_photo VALUES ('7cdac5f01cccf39984dcb793de601b14', 'upload/2011/05/27/20110527014340857.jpg');
INSERT INTO shop_goods_photo VALUES ('4183bec0fb1fed6e15500c45efef29d4', 'upload/2011/05/27/20110527014347585.jpg');
INSERT INTO shop_goods_photo VALUES ('7fb2a5c292862bb5ddd5ed6c97faa9c2', 'upload/2011/05/27/20110527014352761.jpg');
INSERT INTO shop_goods_photo VALUES ('04999d0838ea6a1c1d774a2a31729fce', 'upload/2011/05/27/20110527014456194.png');
INSERT INTO shop_goods_photo VALUES ('55b96e96c4fe67406b252545328a8407', 'upload/2011/05/27/20110527014836763.png');
INSERT INTO shop_goods_photo VALUES ('37320c2928ae7dc23454c1198df55d13', 'upload/2011/05/27/20110527014900904.jpg');
INSERT INTO shop_goods_photo VALUES ('d989170c68d97817a1c982083aa02d17', 'upload/2011/05/27/20110527014913459.jpg');
INSERT INTO shop_goods_photo VALUES ('84d6abbe26d4600ad84d53bc742068c0', 'upload/2011/05/27/20110527014913786.jpg');
INSERT INTO shop_goods_photo VALUES ('d2b525c4f2c1d4eb064d60ea57129dc6', 'upload/2011/05/27/20110527014914998.jpg');
INSERT INTO shop_goods_photo VALUES ('8fbddcc2f157858d875d81f1b1c8dba3', 'upload/2011/05/27/20110527015924460.jpg');
INSERT INTO shop_goods_photo VALUES ('0a2d6ccd4431f6f7cf7715637423c52a', 'upload/2011/05/27/20110527015928951.jpg');
INSERT INTO shop_goods_photo VALUES ('aea94fa18c63f30c8ca58de703afb393', 'upload/2011/05/27/20110527015931727.jpg');
INSERT INTO shop_goods_photo VALUES ('fe4547c4c4226d39dff079737fb21852', 'upload/2011/05/27/20110527015934227.jpg');
INSERT INTO shop_goods_photo VALUES ('fcccdb74bf916d62225ba3edd5a071b3', 'upload/2011/05/27/20110527021103649.jpg');
INSERT INTO shop_goods_photo VALUES ('096dadc336027e02f0efc7df47a8b616', 'upload/2011/05/27/20110527021110545.jpg');
INSERT INTO shop_goods_photo VALUES ('0d9d4d06e8978d73d9d265c8461ca69a', 'upload/2011/05/27/20110527021112258.jpg');
INSERT INTO shop_goods_photo VALUES ('0492d315da43b63520d6bb7cedec72d4', 'upload/2011/05/27/20110527021231551.png');
INSERT INTO shop_goods_photo VALUES ('907a8a29b0a612954e7f9d35bcdc21e0', 'upload/2011/05/27/20110527021759985.jpg');
INSERT INTO shop_goods_photo VALUES ('560008860e14e51950d5181881996435', 'upload/2011/05/27/20110527022018897.png');
INSERT INTO shop_goods_photo VALUES ('88add46d090510090786d9c6a8350299', 'upload/2011/05/27/20110527022212221.jpg');
INSERT INTO shop_goods_photo VALUES ('d7dfc2547df16a72c2d9da6568cc57f2', 'upload/2011/05/27/20110527022218135.jpg');
INSERT INTO shop_goods_photo VALUES ('4433701592d604f7d8cac78190062e15', 'upload/2011/05/27/20110527022616545.png');
INSERT INTO shop_goods_photo VALUES ('35de49a7477ca4a5e850e07b04430f95', 'upload/2011/05/27/20110527024112405.jpg');
INSERT INTO shop_goods_photo VALUES ('8522dae0a93a98539b08b3c2d3a725b6', 'upload/2011/05/27/20110527024335743.png');
INSERT INTO shop_goods_photo VALUES ('5d9e0bb8909b56975cff4a23bb4cd0cb', 'upload/2011/05/27/20110527024759294.png');
INSERT INTO shop_goods_photo VALUES ('a4292c3421c93679b9f5a3eee2e26b00', 'upload/2011/05/27/20110527025357602.png');
INSERT INTO shop_goods_photo VALUES ('f89eb7b092f81b40d6c6283ed0249cca', 'upload/2011/05/27/20110527025944297.jpg');
INSERT INTO shop_goods_photo VALUES ('094a803540e7e76e44fd4ddd8573cd2b', 'upload/2011/05/27/20110527030542855.jpg');
INSERT INTO shop_goods_photo VALUES ('32d9ef6ef2001c79f2e3244fc5e0bf90', 'upload/2011/05/27/20110527031028876.png');
INSERT INTO shop_goods_photo VALUES ('d2fee7fd024b528dee82b1a29fdbe273', 'upload/2011/05/27/20110527031713429.png');
INSERT INTO shop_goods_photo VALUES ('0cf79b951ced0d81355bb26b91c7adfb', 'upload/2011/05/27/20110527032034738.png');
INSERT INTO shop_goods_photo VALUES ('2b0dcd21f083b711e53087f65be1fe1b', 'upload/2011/05/27/20110527032216261.jpg');
INSERT INTO shop_goods_photo VALUES ('221e816d99aef4984031ce2b34825a25', 'upload/2011/05/27/20110527032224289.jpg');
INSERT INTO shop_goods_photo VALUES ('01fdad943c74ccb16acee96ccf06d703', 'upload/2011/05/27/20110527033023491.png');
INSERT INTO shop_goods_photo VALUES ('454413d65852146d07bb3284b8fc7dd2', 'upload/2011/05/27/20110527033924511.png');
INSERT INTO shop_goods_photo VALUES ('4ae5f23e86b202d455d57d3b8b3077d5', 'upload/2011/05/27/20110527034712608.png');
INSERT INTO shop_goods_photo VALUES ('494973885d5084062c084d13b983150c', 'upload/2011/05/27/20110527035428466.jpg');
INSERT INTO shop_goods_photo VALUES ('b616361e9f07c6fa4d2ad17c9c48e34e', 'upload/2011/05/27/20110527035716508.jpg');
INSERT INTO shop_goods_photo VALUES ('0b5c36bf46be94380190e9f2e0d8ef53', 'upload/2011/05/27/20110527040129930.jpg');
INSERT INTO shop_goods_photo VALUES ('b000bcb5cf77f91a6a1c45971c0b447d', 'upload/2011/05/27/20110527040132576.jpg');
INSERT INTO shop_goods_photo VALUES ('0555aa0ab157c08c57dff9b46381b096', 'upload/2011/05/27/20110527040138676.jpg');
INSERT INTO shop_goods_photo VALUES ('82f3351ad91de43faaf85dd8250ee703', 'upload/2011/05/27/20110527040328406.png');
INSERT INTO shop_goods_photo VALUES ('913618ca8d08d8b114609a1de6f93e5c', 'upload/2011/05/27/20110527040332844.png');
INSERT INTO shop_goods_photo VALUES ('db9ac5f8df2717df094e3e84a9ec5ba3', 'upload/2011/05/27/20110527040337518.png');
INSERT INTO shop_goods_photo VALUES ('666796480ece25b766929b0280c38d62', 'upload/2011/05/27/20110527040341949.png');
INSERT INTO shop_goods_photo VALUES ('4c5406e914deafacc4f476515fc16378', 'upload/2011/05/27/20110527040842799.jpg');
INSERT INTO shop_goods_photo VALUES ('640f122248026200294ff4f8acaabcac', 'upload/2011/05/27/20110527041023263.jpg');
INSERT INTO shop_goods_photo VALUES ('f58f3a55982fe4a9324de727be5c0e77', 'upload/2011/05/27/20110527041027831.jpg');
INSERT INTO shop_goods_photo VALUES ('1ee67082ed7f34b031f194607ea937de', 'upload/2011/05/27/20110527041030728.jpg');
INSERT INTO shop_goods_photo VALUES ('2ed3485751b8e6955f235c785b0d40b9', 'upload/2011/05/27/20110527041432222.png');
INSERT INTO shop_goods_photo VALUES ('fb54107ec3785c90d667e70d2b19e6a1', 'upload/2011/05/27/20110527041829602.png');
INSERT INTO shop_goods_photo VALUES ('f70472a0b76f6aefd880e562bf592dc7', 'upload/2011/05/27/20110527041853620.jpg');
INSERT INTO shop_goods_photo VALUES ('c1a1ead592abf765afa22d13e8701f0d', 'upload/2011/05/27/20110527042353845.jpg');
INSERT INTO shop_goods_photo VALUES ('bf4e0b667ad92e31248c5c3080c63866', 'upload/2011/05/27/20110527042357294.jpg');
INSERT INTO shop_goods_photo VALUES ('5c2a2e2b726d03662eafe87f61ea31c2', 'upload/2011/05/27/20110527042402868.jpg');
INSERT INTO shop_goods_photo VALUES ('eaf6479318219e009457b2176595a628', 'upload/2011/05/27/20110527042716290.png');
INSERT INTO shop_goods_photo VALUES ('0c7900436bd56891bd5fdbdfb2551292', 'upload/2011/05/27/20110527042805530.jpg');
INSERT INTO shop_goods_photo VALUES ('d23d9cede975b7ec50fba414566e5c4e', 'upload/2011/05/27/20110527043219501.jpg');
INSERT INTO shop_goods_photo VALUES ('756357ed7a55ddb863a879853804e61e', 'upload/2011/05/27/20110527043650523.jpg');

-- ----------------------------
-- Table structure for `shop_goods_photo_relation`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_photo_relation`;
CREATE TABLE `shop_goods_photo_relation` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `photo_id` char(32) NOT NULL default '' COMMENT '图片ID,图片的md5值',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1145 DEFAULT CHARSET=utf8 COMMENT='相册商品关系表';

-- ----------------------------
-- Records of shop_goods_photo_relation
-- ----------------------------
INSERT INTO shop_goods_photo_relation VALUES ('1068', '99', 'c81a61c8e48bd20a32cda15b38a89105');
INSERT INTO shop_goods_photo_relation VALUES ('1067', '99', 'bbc83d34052d0835a54279decf55f762');
INSERT INTO shop_goods_photo_relation VALUES ('17', '4', '934fc2f1d2e2915070bee5dd494970e2');
INSERT INTO shop_goods_photo_relation VALUES ('6', '5', 'e2d31e223d8fde9b69729f479894e85a');
INSERT INTO shop_goods_photo_relation VALUES ('989', '143', 'd23d9cede975b7ec50fba414566e5c4e');
INSERT INTO shop_goods_photo_relation VALUES ('1127', '94', 'a229ecb3a203f98baa5a445c16e41cd9');
INSERT INTO shop_goods_photo_relation VALUES ('727', '93', '446dbbceba778be13068762c718faacb');
INSERT INTO shop_goods_photo_relation VALUES ('726', '93', 'aefdf47fc3a2032c1b7c731a77b322e6');
INSERT INTO shop_goods_photo_relation VALUES ('18', '4', 'f4ab4156e6e9b7cf3790d6eb00ac7950');
INSERT INTO shop_goods_photo_relation VALUES ('1022', '120', '560008860e14e51950d5181881996435');
INSERT INTO shop_goods_photo_relation VALUES ('1069', '98', '87de4f05ec4857449007ece1519b6e50');
INSERT INTO shop_goods_photo_relation VALUES ('1076', '95', 'f2caef88b33ee5fb63d4a3ef484a6561');
INSERT INTO shop_goods_photo_relation VALUES ('1020', '121', 'd7dfc2547df16a72c2d9da6568cc57f2');
INSERT INTO shop_goods_photo_relation VALUES ('1017', '123', '35de49a7477ca4a5e850e07b04430f95');
INSERT INTO shop_goods_photo_relation VALUES ('1018', '122', '4433701592d604f7d8cac78190062e15');
INSERT INTO shop_goods_photo_relation VALUES ('1019', '121', '88add46d090510090786d9c6a8350299');
INSERT INTO shop_goods_photo_relation VALUES ('1136', '136', '666796480ece25b766929b0280c38d62');
INSERT INTO shop_goods_photo_relation VALUES ('1135', '136', 'db9ac5f8df2717df094e3e84a9ec5ba3');
INSERT INTO shop_goods_photo_relation VALUES ('1041', '112', '04999d0838ea6a1c1d774a2a31729fce');
INSERT INTO shop_goods_photo_relation VALUES ('1141', '97', 'bfa745a86aceacf09355b614672668fe');
INSERT INTO shop_goods_photo_relation VALUES ('1140', '97', '6699221ecf89d5bf40f19948001b54f4');
INSERT INTO shop_goods_photo_relation VALUES ('1106', '77', '7f7ee17d7404c87776b422474f2c7154');
INSERT INTO shop_goods_photo_relation VALUES ('725', '93', '48fa5a6363b664d2894c97c239a3a568');
INSERT INTO shop_goods_photo_relation VALUES ('724', '93', '3dccf66f018b53fa4ab4c57ab41beaad');
INSERT INTO shop_goods_photo_relation VALUES ('1016', '124', '8522dae0a93a98539b08b3c2d3a725b6');
INSERT INTO shop_goods_photo_relation VALUES ('1061', '103', 'a71d4efaaede7e119dc84e05ed3de0c0');
INSERT INTO shop_goods_photo_relation VALUES ('1066', '99', '8fbb1d6e0e6a4fdd999aff5ffdbd81e3');
INSERT INTO shop_goods_photo_relation VALUES ('1105', '77', 'b1323b1530744b089ccd7f85a171167f');
INSERT INTO shop_goods_photo_relation VALUES ('1134', '136', '913618ca8d08d8b114609a1de6f93e5c');
INSERT INTO shop_goods_photo_relation VALUES ('1044', '111', '5a6afd72204cb810d74a054775d1696e');
INSERT INTO shop_goods_photo_relation VALUES ('1043', '111', '319e99cd87ba05cd839683d6a39d416d');
INSERT INTO shop_goods_photo_relation VALUES ('1051', '108', '04e6f5d437661019e97625a8ac07cb6f');
INSERT INTO shop_goods_photo_relation VALUES ('1144', '106', '4b51702f65f886a250baae67168d3663');
INSERT INTO shop_goods_photo_relation VALUES ('1143', '106', 'f7fdab923afded1cdc00f5407284ac71');
INSERT INTO shop_goods_photo_relation VALUES ('1142', '106', '6bd216a6f6f3a8e140b1dc308c6419fe');
INSERT INTO shop_goods_photo_relation VALUES ('1056', '105', '0610b1cc9b4a56e5f1cb5ccbbf96bc62');
INSERT INTO shop_goods_photo_relation VALUES ('1057', '104', 'bc48b1635689c7f80557b9b791fb73dd');
INSERT INTO shop_goods_photo_relation VALUES ('1060', '103', '8cf82baa085b33f40a43ed232df3b257');
INSERT INTO shop_goods_photo_relation VALUES ('1062', '102', '3dc5ae6767f2e75234ed100ef7b3fb8e');
INSERT INTO shop_goods_photo_relation VALUES ('1138', '101', 'f3af4694261f0f3e7b6a70ce1dcf6acb');
INSERT INTO shop_goods_photo_relation VALUES ('1139', '100', '463860be929bd353cbe9cc5b8c40d574');
INSERT INTO shop_goods_photo_relation VALUES ('1042', '111', '20fc383d7462b8c03e27b5ce0833d268');
INSERT INTO shop_goods_photo_relation VALUES ('1045', '110', '85b3c9ac4751eb582879088cad6ce0ce');
INSERT INTO shop_goods_photo_relation VALUES ('1049', '109', '3f64b87aebe0a4f75e3612f85c55e7d1');
INSERT INTO shop_goods_photo_relation VALUES ('1048', '109', '4fe0b6d1750e72f7560e06589ed79669');
INSERT INTO shop_goods_photo_relation VALUES ('1052', '107', '01607549ed4b2408766f59f8ecbab3fc');
INSERT INTO shop_goods_photo_relation VALUES ('1059', '103', 'df3aa0b859328900daa87b4be636563b');
INSERT INTO shop_goods_photo_relation VALUES ('1058', '103', '835c717e824106a794aafd0e3fa1c57d');
INSERT INTO shop_goods_photo_relation VALUES ('1065', '99', '686217397bf954ee0281752124a5f031');
INSERT INTO shop_goods_photo_relation VALUES ('1128', '144', '756357ed7a55ddb863a879853804e61e');
INSERT INTO shop_goods_photo_relation VALUES ('1047', '109', '583658259a9d458c03fa6c9a534c2a75');
INSERT INTO shop_goods_photo_relation VALUES ('1046', '109', '6c18ccc24a39f048b9acd66b6b05366a');
INSERT INTO shop_goods_photo_relation VALUES ('998', '137', '1ee67082ed7f34b031f194607ea937de');
INSERT INTO shop_goods_photo_relation VALUES ('997', '137', 'f58f3a55982fe4a9324de727be5c0e77');
INSERT INTO shop_goods_photo_relation VALUES ('1031', '116', 'fe4547c4c4226d39dff079737fb21852');
INSERT INTO shop_goods_photo_relation VALUES ('1035', '115', 'd2b525c4f2c1d4eb064d60ea57129dc6');
INSERT INTO shop_goods_photo_relation VALUES ('1034', '115', '84d6abbe26d4600ad84d53bc742068c0');
INSERT INTO shop_goods_photo_relation VALUES ('1040', '113', '7fb2a5c292862bb5ddd5ed6c97faa9c2');
INSERT INTO shop_goods_photo_relation VALUES ('1039', '113', '4183bec0fb1fed6e15500c45efef29d4');
INSERT INTO shop_goods_photo_relation VALUES ('1038', '113', '7cdac5f01cccf39984dcb793de601b14');
INSERT INTO shop_goods_photo_relation VALUES ('1050', '108', 'c88e6064d9b3f230854dc8f970a16c10');
INSERT INTO shop_goods_photo_relation VALUES ('1075', '95', '63b77231328118480480f807e94cc64c');
INSERT INTO shop_goods_photo_relation VALUES ('1074', '95', '5a63084581fc8b44b6f28b9385db1da3');
INSERT INTO shop_goods_photo_relation VALUES ('1073', '95', '71c07376cfb9cf25e9f1de76ed3b94e7');
INSERT INTO shop_goods_photo_relation VALUES ('1072', '95', 'a050416e8f1051d209eaf0f016448b1d');
INSERT INTO shop_goods_photo_relation VALUES ('1126', '94', '0952528040eb39f958fb4a55195d8012');
INSERT INTO shop_goods_photo_relation VALUES ('1125', '94', '447ca463b3bd9c9b2e6671698f07b878');
INSERT INTO shop_goods_photo_relation VALUES ('723', '93', '57a355bd1b78b254b7f0a90dd07d0ab5');
INSERT INTO shop_goods_photo_relation VALUES ('1133', '136', '82f3351ad91de43faaf85dd8250ee703');
INSERT INTO shop_goods_photo_relation VALUES ('1023', '119', '907a8a29b0a612954e7f9d35bcdc21e0');
INSERT INTO shop_goods_photo_relation VALUES ('1026', '118', '0d9d4d06e8978d73d9d265c8461ca69a');
INSERT INTO shop_goods_photo_relation VALUES ('1025', '118', '096dadc336027e02f0efc7df47a8b616');
INSERT INTO shop_goods_photo_relation VALUES ('1004', '135', 'b000bcb5cf77f91a6a1c45971c0b447d');
INSERT INTO shop_goods_photo_relation VALUES ('992', '140', '5c2a2e2b726d03662eafe87f61ea31c2');
INSERT INTO shop_goods_photo_relation VALUES ('995', '138', 'fb54107ec3785c90d667e70d2b19e6a1');
INSERT INTO shop_goods_photo_relation VALUES ('993', '139', 'f70472a0b76f6aefd880e562bf592dc7');
INSERT INTO shop_goods_photo_relation VALUES ('994', '138', '2ed3485751b8e6955f235c785b0d40b9');
INSERT INTO shop_goods_photo_relation VALUES ('996', '137', '640f122248026200294ff4f8acaabcac');
INSERT INTO shop_goods_photo_relation VALUES ('1104', '77', '597e4ca5f95e29f841751adceca8325e');
INSERT INTO shop_goods_photo_relation VALUES ('1036', '114', '55b96e96c4fe67406b252545328a8407');
INSERT INTO shop_goods_photo_relation VALUES ('1037', '113', '9b88a1e10b8200fc590ece112f07dfbc');
INSERT INTO shop_goods_photo_relation VALUES ('1014', '126', 'a4292c3421c93679b9f5a3eee2e26b00');
INSERT INTO shop_goods_photo_relation VALUES ('1015', '125', '5d9e0bb8909b56975cff4a23bb4cd0cb');
INSERT INTO shop_goods_photo_relation VALUES ('1013', '127', '4c5406e914deafacc4f476515fc16378');
INSERT INTO shop_goods_photo_relation VALUES ('1011', '128', '32d9ef6ef2001c79f2e3244fc5e0bf90');
INSERT INTO shop_goods_photo_relation VALUES ('1010', '129', 'd2fee7fd024b528dee82b1a29fdbe273');
INSERT INTO shop_goods_photo_relation VALUES ('1009', '130', '0cf79b951ced0d81355bb26b91c7adfb');
INSERT INTO shop_goods_photo_relation VALUES ('1008', '131', 'b616361e9f07c6fa4d2ad17c9c48e34e');
INSERT INTO shop_goods_photo_relation VALUES ('990', '142', '0c7900436bd56891bd5fdbdfb2551292');
INSERT INTO shop_goods_photo_relation VALUES ('987', '141', 'eaf6479318219e009457b2176595a628');
INSERT INTO shop_goods_photo_relation VALUES ('991', '140', 'c1a1ead592abf765afa22d13e8701f0d');
INSERT INTO shop_goods_photo_relation VALUES ('1033', '115', 'd989170c68d97817a1c982083aa02d17');
INSERT INTO shop_goods_photo_relation VALUES ('1032', '115', '37320c2928ae7dc23454c1198df55d13');
INSERT INTO shop_goods_photo_relation VALUES ('1007', '132', '01fdad943c74ccb16acee96ccf06d703');
INSERT INTO shop_goods_photo_relation VALUES ('1137', '133', '454413d65852146d07bb3284b8fc7dd2');
INSERT INTO shop_goods_photo_relation VALUES ('1005', '134', '494973885d5084062c084d13b983150c');
INSERT INTO shop_goods_photo_relation VALUES ('1030', '116', 'aea94fa18c63f30c8ca58de703afb393');
INSERT INTO shop_goods_photo_relation VALUES ('1029', '116', '0a2d6ccd4431f6f7cf7715637423c52a');
INSERT INTO shop_goods_photo_relation VALUES ('1028', '116', '8fbddcc2f157858d875d81f1b1c8dba3');
INSERT INTO shop_goods_photo_relation VALUES ('1024', '118', 'fcccdb74bf916d62225ba3edd5a071b3');
INSERT INTO shop_goods_photo_relation VALUES ('1027', '117', '0492d315da43b63520d6bb7cedec72d4');
INSERT INTO shop_goods_photo_relation VALUES ('1003', '135', '0b5c36bf46be94380190e9f2e0d8ef53');
INSERT INTO shop_goods_photo_relation VALUES ('1103', '77', 'e3fea369604a6ebdcac01e38f117bf9d');
INSERT INTO shop_goods_photo_relation VALUES ('1109', '79', '0df9eae1e86cd34d230ab72c3a6bbb90');
INSERT INTO shop_goods_photo_relation VALUES ('1108', '79', '214a0a881332e0e0debce6d921a18d88');
INSERT INTO shop_goods_photo_relation VALUES ('1107', '79', '8522299dd1fd344c8382f4c0ce22c454');
INSERT INTO shop_goods_photo_relation VALUES ('1099', '82', '8ee51febe4c81e582e56b92e70b8eaad');
INSERT INTO shop_goods_photo_relation VALUES ('1098', '82', '2537f7d211ba69254947348fa282d1cc');
INSERT INTO shop_goods_photo_relation VALUES ('1097', '82', 'add4412acaec0bebf6f857f202afb5cb');
INSERT INTO shop_goods_photo_relation VALUES ('1096', '85', '25a2590cba268ac2d06a38181aa0f636');
INSERT INTO shop_goods_photo_relation VALUES ('1095', '87', '5b7a3f6672c26afcc947211e8b993ca2');
INSERT INTO shop_goods_photo_relation VALUES ('1094', '88', '35304222a1df029c4bf79e1fb5cb7da4');
INSERT INTO shop_goods_photo_relation VALUES ('1093', '88', 'f9459ae72796474d90badd3efa77f0aa');
INSERT INTO shop_goods_photo_relation VALUES ('1092', '88', 'b6abaa96a93b7f7e85465c07edcc453e');
INSERT INTO shop_goods_photo_relation VALUES ('1091', '88', 'f79100c3186169f7e12576ee1e3a54ad');
INSERT INTO shop_goods_photo_relation VALUES ('678', '89', '1641705eb368f2b18ae7e62052dbf52c');
INSERT INTO shop_goods_photo_relation VALUES ('677', '89', 'ce58c96bcf60503172fe86e3d9660b16');
INSERT INTO shop_goods_photo_relation VALUES ('676', '89', '962d0c800305a3be5f5514db8a2ce8f9');
INSERT INTO shop_goods_photo_relation VALUES ('1086', '90', '4fc0fd54c9c608deee52e77b2796cc6e');
INSERT INTO shop_goods_photo_relation VALUES ('1085', '90', 'c10b32940d6ce461965aea2df398fa79');
INSERT INTO shop_goods_photo_relation VALUES ('1084', '90', '6dedb36d2549022eed8ada7cf2ae08af');
INSERT INTO shop_goods_photo_relation VALUES ('1090', '91', '3bc4f634a8a3ac326a5a6674b70f3872');
INSERT INTO shop_goods_photo_relation VALUES ('1089', '91', '73193d0f2700b4b74fb1763b514c60d4');
INSERT INTO shop_goods_photo_relation VALUES ('1088', '91', '13b8e3171a1cab0c4b4a2704066c54f0');
INSERT INTO shop_goods_photo_relation VALUES ('1087', '91', '698c45b98800d76d2d757a3f12889593');

-- ----------------------------
-- Table structure for `shop_group_price`
-- ----------------------------
DROP TABLE IF EXISTS `shop_group_price`;
CREATE TABLE `shop_group_price` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) NOT NULL default '0' COMMENT '产品ID',
  `products_id` int(11) NOT NULL default '0' COMMENT '规格id',
  `group_id` int(11) NOT NULL COMMENT '用户组ID',
  `price` float(10,2) NOT NULL default '0.00' COMMENT '价格',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='记录某件商品对于某组会员的价格关系表，优先权大于组设定的折扣率。';

-- ----------------------------
-- Records of shop_group_price
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_guide`
-- ----------------------------
DROP TABLE IF EXISTS `shop_guide`;
CREATE TABLE `shop_guide` (
  `order` smallint(5) NOT NULL COMMENT '排序',
  `name` varchar(255) NOT NULL COMMENT '导航名字',
  `link` varchar(255) NOT NULL COMMENT '链接地址',
  PRIMARY KEY  (`order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='首页导航栏';

-- ----------------------------
-- Records of shop_guide
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_help`
-- ----------------------------
DROP TABLE IF EXISTS `shop_help`;
CREATE TABLE `shop_help` (
  `id` int(11) NOT NULL auto_increment,
  `cat_id` smallint(6) NOT NULL COMMENT '帮助分类，如果为0则代表着是下面的帮助单页',
  `sort` int(11) NOT NULL COMMENT '顺序',
  `name` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `dateline` int(11) NOT NULL COMMENT '发布时间',
  PRIMARY KEY  (`id`),
  KEY `cat_id` (`cat_id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='帮助';

-- ----------------------------
-- Records of shop_help
-- ----------------------------
INSERT INTO shop_help VALUES ('4', '3', '0', '购物流程', '<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、搜索商品</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">为您提供了方便快捷的商品搜索功能：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）您可以通过在首页输入关键字的方法来搜索您想要购买的商品</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）您还可以通过</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">的分类导航栏来找到您想要购买的商品分类，根据分类找到您的商品</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）观看搜索商品演示</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、放入购物车在您想要购买的商品的详情页点击“购买”，商品会添加到您的购物车中；您还可以继续挑选商品放入购物车，一起结算。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）在购物车中，系统默认每件商品的订购数量为一件，如果您想购买多件商品，可修改购买数量</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）在购物车中，您可以将商品移至收藏，或是选择删除</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）在购物车中，您可以直接查看到商品的优惠折和参加促销活动的商品名称、促销主题</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）购物车页面下方的商品是</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">根据您挑选的商品为您作出的推荐，若有您喜爱的商品，点击“放入购物车”即可</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">温馨提示：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）商品价格会不定期调整，最终价格以您提交订单后订单中的价格为准</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）优惠政策、配送时间、运费收取标准等都有可能进行调整，最终成交信息以您提交订单时网站公布的最新信息为准</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、选择订单</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">和商家的商品需要分别提交订单订购</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）不同商家的商品需要分别提交订单订购</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、注册登陆</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）老顾客：请在“登陆”页面输入</span><span lang=\\\"EN-US\\\">Email</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">地址或昵称、注册密码进行登陆</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）新顾客：请在“新用户注册”页面按照提示完成注册</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、填写收货人信息</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）请填写正确完整的收货人姓名、收货人联系方式、详细的收货地址和邮编，否则将会影响您订单的处理或配送</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）您可以进入“我的</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">—帐户管理—收货地址簿”编辑常用收货地址，保存成功后，再订购时，可以直接选择使用</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">6</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、选择收货方式</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">提供多种收货方式：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）普通快递送货上门</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）加急快递送货上门</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）普通邮递</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）邮政特快专递</span><span lang=\\\"EN-US\\\">(EMS)</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">详情请点击查看配送范围、时间及运费</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">7</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、选择支付方式</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">提供多种支付方式，订购过程中您可以选择：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）货到付款</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）网上支付</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）银行转帐</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）邮局汇款</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">点击查看各种支付方式订单的支付期限</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">8</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、索取发票</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">请点击“索取发票”，填写正确的发票抬头、选择正确的发票内容，发票选择成功后，将于订单货物一起送达</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">点击查看发票制度</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">9</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、提交订单</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）以上信息核实无误后，请点击“提交订单”，系统生成一个订单号，就说明您已经成功提交订单</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）订单提交成功后，您可以登陆“我的</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">”查看订单信息或为订单进行网上支付</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">特别提示</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、若您帐户中有礼品卡，可以在“支付方式”处选择使用礼品卡支付，详情请点击查看</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">礼品卡</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、若您帐户中有符合支付该订单的礼券，在结算页面会有“使用礼券”按钮，您点击选择礼券即可，点击查看礼券使用规则</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">当您选择了礼券并点击“确定使用”后，便无法再取消使用该礼券</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、在订单提交高峰时段，新订单可能一段时间之后才会在“我的</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">”中显示。如果您在“我的</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;\\\">”中暂未找到这张订单，请您耐心等待</span></p>\r\n<p class=\\\"MsoNormal\\\"><br />\r\n</p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;\\\"><br />\r\n</span></p>', '0');
INSERT INTO shop_help VALUES ('27', '3', '0', '积分说明', '<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">所有会员在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">购物均可获得积分，积分可以用来参与兑换活动。</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">会不定期推出各类积分兑换活动，请随时关注关于积分的活动告知。详情请点击查看以下各项说明。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">积分获得</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、每一张成功交易的订单，所付现金部分（含</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">礼品卡）都可获得积分，不同商品积分标准不同，获得积分以订单提交时所注明的积分为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、贵宾会员购物时，将额外获得相应级别的级别赠分。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、阶段性的积分促销活动，也会给您带来额外的促销赠分，详见积分活动。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、促销商品不能获得积分。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">…………………………………………………………………………………………</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">积分有效期</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">积分有效期：获得之日起到次年年底。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">…………………………………………………………………………………………</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">查询积分</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">积分有效期：获得之日起到次年年底。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">您可以在</span><span lang=\\\"EN-US\\\">\\\"</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">我的</span><span lang=\\\"EN-US\\\">iWebShop-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">我的积分</span><span lang=\\\"EN-US\\\">\\\"</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">中，查看您的累计积分。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">…………………………………………………………………………………………</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">积分活动</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">会不定期地推出各种积分活动，请随时关注关于积分促销的告知。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、会员可以用积分参与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">指定的各种活动，参与后会扣减相应的积分。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、积分不可用于兑换现金，仅限参加</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">指定兑换物品、参与抽奖等各种活动。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">…………………………………………………………………………………………</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">会员积分计划细则</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">不同帐户积分不可合并使用；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">·本计划只适用于个人用途而进行的购物，不适用于团体购物、以营利或销售为目的的购买行为、其它非个人用途购买行为。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">·会员积分计划及原</span><span lang=\\\"EN-US\\\">VIP</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">制度的最终解释权归</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">所有。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">…………………………………………………………………………………………</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">免责条款</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">感谢您访问</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">的会员积分计划，本计划由</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">或其关联企业提供。以上计划条款和条件，连同计划有关的任何促销内容的相应条款和条件，构成本计划会员与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">之间关于制度的完整协议。如果您使用</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">，您就参加了本计划并接受了这些条款、条件、限制和要求。请注意，您对</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">站的使用以及您的会员资格还受制于</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">站上时常更新的所有条款、条件、限制和要求，请仔细阅读这些条款和条件。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">协议的变更</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">可以在没有特殊通知的情况下自行变更本条款、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">的任何其它条款和条件、或您的计划会员资格的任何方面。对这些条款的任何修改将被包含在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">的更新的条款中。如果任何变更被认定为无效、废止或因任何原因不可执行，则该变更是可分割的，且不影响其它变更或条件的有效性或可执行性。在我们变更这些条款后，您对</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">的继续使用，构成您对变更的接受。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">终止</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">可以不经通知而自行决定终止全部或部分计划，或终止您的计划会员资格。即使</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">没有要求或强制您严格遵守这些条款，也并不构成对属于</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">的任何权利的放弃。如果您在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">的客户帐户被关闭，那么您也将丧失您的会员资格。对于该会员资格的丧失，您对</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">不能主张任何权利或为此索赔。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">责任限制</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">除了</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">的使用条件中规定的其它限制和除外情况之外，在中国法律法规所允许的限度内，对于因会员积分计划而引起的或与之有关的任何直接的、间接的、特殊的、附带的、后果性的或惩罚性的损害，或任何其它性质的损害，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">的董事、管理人员、雇员、代理或其它代表在任何情况下都不承担责任。</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">的全部责任，不论是合同、保证、侵权（包括过失）项下的还是其它的责任，均不超过您所购买的与该索赔有关的商品价值额。这些责任排除和限制条款将在法律所允许的最大限度内适用，并在您的计划会员资格被撤销或终止后仍继续有效。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\"><br />\r\n</span></p>', '1303975443');
INSERT INTO shop_help VALUES ('26', '3', '0', '会员制度', '<div>会员级别共分七级，具体为：注册会员、铁牌会员、铜牌会员、银牌会员、金牌会员、钻石会员、双钻石会员，级别升降均由系统自动实现，无需申请。</div>\r\n<div><br />\r\n</div>\r\n<div>注册会员：</div>\r\n<div>申请条件：任何愿意到iWebShop购物的用户都可以免费注册。</div>\r\n<div>待　　遇：可以享受注册会员所能购买的产品及服务。</div>\r\n<div>铁牌会员：</div>\r\n<div>申请条件：一年内有过成功消费的会员，金额不限。</div>\r\n<div>待　　遇：可以享受铁牌会员级别所能购买的产品及服务。</div>\r\n<div>铜牌会员：</div>\r\n<div>申请条件：一年内消费金额超过2000元（含）的会员。</div>\r\n<div>待　　遇：可以享受铜牌会员级别所能购买的产品及服务。</div>\r\n<div>其它要求：</div>\r\n<div>身份有效期为一年，一年有效期满后，如在该年度内累计消费金额不满1000元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为铁牌会员。</div>\r\n<div>银牌会员：</div>\r\n<div>申请条件：一年内消费金额超过5000元（含），需填写本人真实的身份证号码进行升级</div>\r\n<div>待　　遇：可以享受银牌会员级别所能购买的产品及服务。</div>\r\n<div>其它要求：</div>\r\n<div>身份有效期为一年，一年有效期满后，如在该年度内累计消费金额在1000元（含）——2500元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为铜牌会员；如消费金额不满1000元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为铁牌会员。</div>\r\n<div>金牌会员：</div>\r\n<div>申请条件： 一年内累计消费金额超过10000 元（含）。</div>\r\n<div>待　　遇：</div>\r\n<div>享有优先购物权 —— 对国内少见的优秀产品或者其它比较紧俏的产品具有优先购买权。</div>\r\n<div>享受运费优惠政策（详见这里）</div>\r\n<div>享有一年两次的特别针对金牌会员抽奖的权利</div>\r\n<div>不定期举办个别产品针对金牌会员的优惠活动。</div>\r\n<div>享有支付66元DIY装机服务费的权利。</div>\r\n<div>其它相关要求：</div>\r\n<div>身份有效期为一年，一年有效期满后，如在该年度内累计消费金额在2500元（含）——5000元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为银牌会员；如消费金额在1000元（含）——2500元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为铜牌会员；如消费金额不满1000元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为铁牌会员。　</div>\r\n<div>钻石会员：</div>\r\n<div>申请条件：一年内累计消费金额达到 30000 元（含）</div>\r\n<div>享受金牌会员全部待遇。</div>\r\n<div>享受运费优惠政策（详见这里）</div>\r\n<div>享有支付30元DIY装机服务费的权利。</div>\r\n<div>享受一定范围内免返修品快递运费的服务。（详情请查看售后返修品运费规定）</div>\r\n<div>其它要求：</div>\r\n<div>身份有效期为一年，一年有效期满后，如在该年度内累计消费金额在5000元（含）——15000元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为金牌会员；如消费金额在2500元（含）——5000元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为银牌会员；如消费金额在1000元（含）——2500元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为铜牌会员；如消费金额不满1000元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为铁牌会员。&nbsp;</div>\r\n<div>双钻石会员：</div>\r\n<div>申请条件：个人用户，年消费金额在10万元（含）以上。</div>\r\n<div>待　　遇：</div>\r\n<div>钻石会员的全部待遇都可以享受。</div>\r\n<div>享有iWebShop网站高管定期提供的沟通服务。</div>\r\n<div>享有不需审核，只需报名，即可参加iWebShop网站举办的网友见面会等网友活动。</div>\r\n<div>享有客服专员定期回访征询意见服务。</div>\r\n<div>其它要求：</div>\r\n<div>身份有效期为一年，一年有效期满后，如在该年度内累计消费金额在15000元（含）——50000元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为钻石会员；如消费金额在5000元（含）——15000元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为金牌会员；如消费金额在2500元（含）——5000元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为银牌会员；如消费金额在1000元（含）——2500元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为铜牌会员；如消费金额不满1000元或一年内未完成10个（含）以上不同日期的订单，则系统自动将身份降为铁牌会员。&nbsp;</div>\r\n<div><br />\r\n</div>\r\n<div>注：针对各个级别会员特别声明：</div>\r\n<div>会员账号禁止转借或转让他人使用，如因转借或转让他人使用所带来的一切后果，iWebShop网站概不负责，如被iWebShop网站发现有转借或转让使用情况，iWebShop网站则有权立即取消此会员账号的相应级别资格。</div>\r\n<div>如iWebShop网站发现相应的级别中有经销商，则iWebShop网站有权立即取消此会员帐号的相应级别资格。</div>\r\n<div><br />\r\n</div>', '1303972391');
INSERT INTO shop_help VALUES ('28', '3', '0', '交易条款', '<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站交易条款</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站和您之间的契约</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1.iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站将尽最大努力保证您所购商品与网站上公布的价格一致，但价目表和声明并不构成要约。</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站有权在发现了其网站上显现的产品及订单的明显错误或缺货的情况下，单方面撤回。</span><span lang=\\\"EN-US\\\">(</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">参见下面相关条款</span><span lang=\\\"EN-US\\\">)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站保留对产品订购的数量的限制权。</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family: Calibri\\\">在下订单的同时，您也同时承认了您拥有购买这些产品的权利能力和行为能力，并且您对您在订单中提供的所有信息的真实性负责。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2. </span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">价格变化和缺货</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">产品的价格和可获性都在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站上指明。这类信息将随时更改且不发任何通知。商品的价格都包含了增值税。送货费将另外结算，费用根据您选择的送货方式的不同而异。如果发生了意外情况，在确认了您的订单后，由于供应商提价，税额变化引起的价格变化，或是由于网站的错误等造成商品价格变化，您有权取消您的订单，并希望您能及时通过电子邮件或电话通知</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">客户服务部。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">您所订购的商品，如果发生缺货，您有权取消订单。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3. </span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮件</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">短信服务</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站保留通过邮件和短信的形式，对本网站注册、购物用户发送订单信息、促销活动等告知服务的权利。如果您在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站注册、购物，表明您已默示同意接受此项服务。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">若您不希望接收</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站的邮件，请在邮件下方输入您的</span><span lang=\\\"EN-US\\\">E-mail</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">地址自助完成退阅；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">若您不希望接收</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站的短信，请提供您的手机号码</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family: Calibri\\\">联系客服</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">处理。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4. </span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">送货</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站将会把产品送到您所指定的送货地址。所有在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站上列出的送货时间为参考时间，参考时间的计算是根据库存状况、正常的处理过程和送货时间、送货地点的基础上估计得出的。参考时间不代表等同于到货时间。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">退款政策</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">退货或换货商品缺货时产生的现金款项，退回方式视支付方式的不同而不同：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网上支付的订单，退款退回至原支付卡；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">银行转帐或邮局汇款支付的订单，退款退回至下订单账户的账户余额中。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">6. </span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">条款的修正</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">这些交易条件的条款适用于</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站为您提供的产品销售服务。这些条款将有可能不时的被修正。任何修正条款的发生，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站都将会及时公布。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">7. </span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">条款的可执行性</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果出于任何原因，这些条款及其条件的部分不能得以执行，其他条款及其条件的有效性将不受影响。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">8. </span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">适用的法律和管辖权</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">您和</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站之间的契约将适用中华人民共和国的法律，所有的争端将诉诸于</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站所在地的人民法院。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">9</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站会员制计划（</span><span lang=\\\"EN-US\\\">VIP</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">计划）协议的变更</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">终止</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">责任限制</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站的会员制计划（</span><span lang=\\\"EN-US\\\">VIP</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">计划），本计划由</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">或其关联企业提供。以上计划条款和条件，连同计划有关的任何促销内容的相应条款和条件，构成本计划会员与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">之间关于制度的完整协议。如果您参加计划，您就接受了这些条款、条件、限制和要求。请注意，您对</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站的使用以及您的会员资格还受制于</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站上时常更新的所有条款、条件、限制和要求，请仔细阅读这些条款和条件。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">协议的变更</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站可以在没有特殊通知的情况下自行变更本条款、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站的任何其它条款和条件、或您的计划会员资格的任何方面。</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">对这些条款的任何修改将被包含在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站的更新的条款中。如果任何变更被认定为无效、废止或因任何原因不可执行，则该变更是可分割的，且不影响其它变更或条件的有效性或可执行性。在我们变更这些条款后，您对</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站的继续使用，构成您对变更的接受。如果您不同意本使用交易条款中的任何一条，您可以不使用</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">10</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站的帐户余额自助提现功能</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站为您提供了帐户余额自助提现功能，在提交提现申请单时，您也同时承认了您拥有提现账户余额的权利能力和行为能力，并且将对您在申请单中提供的所有信息的真实性负责。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">用户在申请使用</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站网络服务时，必须准确提供必要的资料，如资料有任何变动</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family: Calibri\\\">，请在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站产品网站上及时更新。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">用户注册成功后，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站将为其开通一个账户，为用户在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站交易及使用</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站服务时的唯一身份标识，该账户的登录名和密码由用户负责保管；用户应当对以其账户进行的所有活动和事件负法律责任。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">终止</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站可以不经通知而自行决定终止全部或部分计划，或终止您的计划会员资格。即使</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站没有要求或强制您严格遵守这些条款，也并不构成对属于</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站的任何权利的放弃。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果您在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站的客户账户被关闭，那么您也将丧失您的会员资格。对于该会员资格的丧失，您对</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站不能主张任何权利或为此索赔。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">责任限制</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">除了</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站的使用条件中规定的其它限制和除外情况之外，在中国法律法规所允许的限度内，对于因</span><span lang=\\\"EN-US\\\">VIP</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">计划而引起的或与之有关的任何直接的、间接的、特殊的、附带的、后果性的或惩罚性的损害，或任何其它性质的损害，</span><span lang=\\\"EN-US\\\"> iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站的董事、管理人员、雇员、代理或其它代表在任何情况下都不承担责任。</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站的全部责任</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">，不论是合同、保证、侵权（包括过失）项下的还是其它的责任，均不超过您所购买的与该索赔有关的商品价值额。这些责任排除和限制条款将在法律所允许的最大限度内适用，并在您的计划会员资格被撤销或终止后仍继续有效。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">隐私声明</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">电子通讯</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">当您访问</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站或给我们发送电子邮件时，您与我们用电子方式进行联系。您同意以电子方式接受我们的信息。我们将用电子邮件或通过在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站上发布通知的方式与您进行联系。您同意我们用电子方式提供给您的所有协议、通知、披露和其他信息是符合此类通讯必须是书面形式的法定要求的。如果</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站能够证明以电子形式的信息已经发送给您或者</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站立即在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站上张贴这样的通知，将被视为您已收到所有协议、声明、披露和其他信息</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">版权声明</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站上的所有内容诸如文字、图表、标识、按钮图标、图像、声音文件片段、数字下载、数据编辑和软件、商标都是</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站或其关联公司或其内容提供者的财产，受中国和国际版权法的保护。未经</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站书面授权或许可</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">，不得以任何目的对</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站或其任何部分进行复制、复印、仿造、出售、转售、访问、或以其他方式加以利用。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">您的账户</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果您使用</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站，您有责任对您的账户和密码保守秘密并对进入您的计算机作出限制，并且您同意对在您的账户和密码下发生的所有活动承担责任。</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站的确销售供儿童使用的产品，但只将它们销售给成年人。如果您在</span><span lang=\\\"EN-US\\\">18</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">岁以下，您只能在父母或监护人的参与下才能使用</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站。</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站及其关联公司保留在中华人民共和国法律允许的范围内独自决定拒绝服务、关闭账户、清除或编辑内容或取消订单的权利。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">评论、意见、消息和其他内容</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">访问者可以张贴评论、意见及其他内容，以及提出建议、主意、意见、问题或其他信息，只要内容不是非法、淫秽、威胁、诽谤、侵犯隐私、侵犯知识产权或以其他形式对第三者构成伤害或侵犯或令公众讨厌，也不包含软件病毒、政治宣传、商业招揽、连锁信、大宗邮件或任何形式的</span><span lang=\\\"EN-US\\\">\\\"</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">垃圾邮件</span><span lang=\\\"EN-US\\\">\\\"</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">。您不可以使用虚假的电子邮件地址、冒充任何他人或实体或以其它方式对卡片或其他内容的来源进行误导。</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站保留清除或编辑这些内容的权利（但非义务），但不对所张贴的内容进行经常性的审查。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果您确实张贴了内容或提交了材料，除非我们有相反指示，您授予</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站及其关联公司非排他的、免费的、永久的、不可撤销的和完全的再许可权而在全世界范围内任何媒体上使用、复制、修改、改写、出版、翻译、创作衍生作品、分发和展示这样的内容。您授予</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站及其关联公司和被转许可人使用您所提交的与这些内容有关的名字的权利，如果他们选择这样做的话。您声明并担保您拥有或以其它方式控制您所张贴内容的权利，内容是准确的，对您所提供内容的使用不违反本政策并不会对任何人和实体造成伤害。您声明并保证对于因您所提供的内容引起的对</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站或其关联公司的损害进行赔偿。</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站有权（但非义务）监控和编辑或清除任何活动或内容。</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站对您或任何第三方所张贴的内容不承担责任。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">合同缔结</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果您通过我们网站订购产品，您的订单就成为一种购买产品的申请或要约。我们将发送给您一封确认收到订单的电子邮件，其中载明订单的细节。但是只有当我们向您发出送货确认的电子邮件通知您我们已将产品发出时，我们对您合同申请的批准与接受才成立。如果您在一份订单里订购了多种产品并且我们只给您发出了关于其中一部分的发货确认电子邮件，那么直到我们发出关于其他产品的发货确认电子邮件，关于那部分产品的合同才成立。当您所购买的商品离开了</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站或其关联公司的库房时，该物品的所有权和灭失风险即转移到您这一方。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">产品说明</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站及其关联公司努力使产品说明尽可能准确。不过，我们并不保证产品说明或</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站上的其他内容是准确的、完整的、可靠的、最新的或无错误的。如果</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站提供的产品本身并非如说明所说，您唯一的救济是将该未经使用过的产品退还我们。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">价格</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">直到您发出订单，我们才能确认商品的价格。尽管我们做出最大的努力，我们的商品目录里的一小部分商品可能会有定价错误。如果我们发现错误定价，我们将采取下列之一措施：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">i</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family: Calibri\\\">如果某一商品的正确定价低于我们的错误定价，我们将按照较低的定价向您销售交付该商品。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">ii</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family: Calibri\\\">如果某一商品的正确定价高于我们的错误定价，我们会根据我们的情况决定</span><span lang=\\\"EN-US\\\">,</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">是否在交付前联系您寻求您的指示</span><span lang=\\\"EN-US\\\">, </span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">或者取消订单并通知您。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">其他企业</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站及其关联企业之外的其他人可能在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站上经营商店、提供服务或者销售产品。另外，我们提供与关联公司和其他企业的链接。我们不负责审查和评估也不担保任何这些企业或个人的待售商品及它们网站的内容。我们对所有这些企业或任何其他第三人或其网站的行为、产品和内容不承担责任。您应仔细阅读它们自己的隐私政策及使用条件。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303975478');
INSERT INTO shop_help VALUES ('29', '3', '0', '订单状态', '<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">一个</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站的新订单从下单到订单完成，会经历各种状态，我们会将各种状态显示在订单详情页面，希望以此种方式让您更好的了解订单情况，及时跟踪订单状态，打消疑虑并顺利完成购物。以下是订单状态的简单说明：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">等待付款：如果您选择“在线支付”“银行卡转账”“邮局汇款”“公司转账”“分期付款”“高校</span><span lang=\\\"EN-US\\\">-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">自己支付”“高校</span><span lang=\\\"EN-US\\\">-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">代理垫付”这几种支付方式，在成功支付且得到财务确认之前，订单状态会显示为等待付款；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">正在配货：该状态说明</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站正在为您的订单进行配货，包括</span><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个子状态</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）打印：将您订购的商品打印成单，便于出库员取货</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）出库：出库员找到您订购的商品并出库</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）扫描：扫描员扫描您订购的商品并确认商品成功出库</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）打包：打包员将您订购的商品放入包裹以便运输</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）发货：发货员将您的包裹发货运输</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站送货：您订购的商品已经发货，正在运送途中</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">收货并确认：货物已发出一段时间，如果您已收到货物可以点击确认按钮进行确认</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">上门自提：该状态说明您订购的商品已经送至相应自提点，请您尽快到自提点提货</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">已完成：此次交易已经完成，希望能得到您的满意</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">已锁定：如果您修改了订单但没有修改成功，则系统会自动锁定您的订单，您可以在订单列表页面点击操作栏中的“解锁订单”使订单恢复正常</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">订单待审核：该状态说明您订购的某类商品缺货，需要</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站将货物备齐后订单才会恢复正常状态，此状态下请您不要进行付款操作，以免货物无法备齐而占用您的货款</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">修改订单常见问题：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、什么时候允许修改订单？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">您在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站下单后，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站后台程序会通过一系列算法来判断您的订单是否可以修改，如果可以修改，您在订单操作一列可以看到“修改订单”链接，此时说明订单可以修改。如果没有此链接，说明该订单不可修改。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">一般来说，在您选购的商品没有打印完毕之前，都是可以修改订单的。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、我能修改订单的哪些内容？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">修改购物车内的商品数量，增加或删除商品；（暂不支持添加套装）</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">修改收货人信息、配送方式、发票信息、订单备注；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">添加优惠券或删除已使用的优惠券；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：由于目前暂不支持修改支付方式，所以一些与支付方式相关联的收货地址可能也无法修改。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、修改订单时，订单为什么会被锁定？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">为了避免您在修改订单的同时，您的订单继续被程序处理和执行，我们会在您修改订单过程中锁定您的订单，直到您完成修改并点击了“提交订单”按钮。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果您在修改过程当中放弃了修改，建议您返回订单列表页面点击操作栏中的“解锁订单”，否则您的订单将在</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个小时后解锁，将影响您订单的生产时间和收货时间。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、如果购物车里某一款商品下单时的价格和修改订单当时的价格不一致，按哪个来算商品价格呢？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果您不修改该商品的购买数量，那么价格和赠品都会维持您下单时的状态不变；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果您修改了该商品购买数量或者添加了新商品，那么价格和赠品都会与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站最新显示的价格和赠品一致。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果您添加了新商品，那么新商品的价格与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站最新显示的价格和赠品一致。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、可以先申请价保后再修改订单吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">不可以，如果你对某商品申请了价保，那么该商品将不能进行修改和删除，除非您删除整个订单。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303975502');
INSERT INTO shop_help VALUES ('30', '4', '0', '货到付款', '<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">货到付款：货物送到订单指定的收货地址后，由收货人支付货款给送货人员</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">货到付款适用于加急快递、普通快递送货上门的订单。请您在订购过程的“付款方式”处，选择货到付款</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">温馨提示：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、货到付款仅限支付现金</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、签收时，请您仔细核兑款项、务必作到货款两清，若事后发现款项错误，我们将无法再核实确认点击查看当当网签收验货政策</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、部分商店街的商家不支持货到付款，请您通过网上支付、邮局汇款、银行转帐方式支付</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303975553');
INSERT INTO shop_help VALUES ('31', '4', '0', '在线支付', '<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站提供的在线支付方式</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站目前有以下支付平台可供选择：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）工商银行网上银行支付平台，支持工商银行银行卡网上在线支付</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）招商银行网上银行支付平台，支持招商银行银行卡网上在线支付</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）建设银行网上银行支付平台，支持建设银行银行卡网上在线支付</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）农业银行网上银行支付平台，支持</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family: Calibri\\\">农业银行银行卡网上在线支付</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）支付宝支付平台，关于支付宝的支付帮助请查看</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">6</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）财付通支付平台，关于财付通的支付帮助请查看</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">7</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）快钱</span><span lang=\\\"EN-US\\\">99Bill</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">支付平台，关于快钱支付平台的支付帮助请查看</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">8</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）环迅</span><span lang=\\\"EN-US\\\">IPS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">，关于环迅支付平台的支付帮助请查看</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">9</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站虚拟账户支付</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、如您是第一次进行网上在线支付，建议事先拨打银行卡所属发卡银行的热线电话，详细咨询可在其网上进行在线支付的银行卡种类及相关开通手续。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303975582');
INSERT INTO shop_help VALUES ('32', '4', '0', '银行电汇', '<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">请在电汇单“汇款用途”一栏处注明您的订单号，银行汇款到账通常需要</span><span lang=\\\"EN-US\\\">2~3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个工作日的时间，我们将在款到后当日为您发货。否则我们无法及时核对审核，这将延误您的发货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">使用银行电汇支付，请务必在</span><span lang=\\\"EN-US\\\">3*24</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">小时之内支付，逾时订单将会自动作废。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果有些银行网点不能提供填写订单号，请汇款后联系我们。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">银行电汇账户信息：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">银行</span><span lang=\\\"EN-US\\\"> <span style=\\\"mso-tab-count:1;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">账户信息</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">工商银行</span><span lang=\\\"EN-US\\\"> <span style=\\\"mso-tab-count:1;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">户</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">名：</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">有限公司</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">开户行：工商银行</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">支行</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">账</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">号：</span><span lang=\\\"EN-US\\\">1001*****</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">建设银行</span><span lang=\\\"EN-US\\\"> <span style=\\\"mso-tab-count:1;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">户</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">名：</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">有限公司</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">开户行：建设银行</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">支行</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">账</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">号：</span><span lang=\\\"EN-US\\\">3100*****</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">招商银行</span><span lang=\\\"EN-US\\\"> <span style=\\\"mso-tab-count:1;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">户</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">名：</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">有限公司</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">开户行：招商银行</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">支行</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">账</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">号：</span><span lang=\\\"EN-US\\\">1219*****</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">交通银行</span><span lang=\\\"EN-US\\\"> <span style=\\\"mso-tab-count:1;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">户</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">名：</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">有限公司</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">开户行：交通银行</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">支行</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">账</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">号：</span><span lang=\\\"EN-US\\\">3100*****</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">汇单范例</span></p>', '1303975610');
INSERT INTO shop_help VALUES ('33', '4', '0', '余额支付', '<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">用户还可以通过使用账户中心中的余额来对订单进行支付</span></p>', '1303975628');
INSERT INTO shop_help VALUES ('34', '6', '0', '配送范围及运费', '<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站购物满</span><span lang=\\\"EN-US\\\">29</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元免运费，查看详情</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">普通快递送货上门</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">覆盖全国</span><span lang=\\\"EN-US\\\">800</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">多个城市，运费</span><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">包裹，购物满</span><span lang=\\\"EN-US\\\">29</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元免运费</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">加急快递送货上门</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">支持北京、天津、上海、广州、深圳、廊坊，限当地发货订单，运费</span><span lang=\\\"EN-US\\\">10</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">包裹</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">圆通快递</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">北京地区：运费</span><span lang=\\\"EN-US\\\">10</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">单</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">普通邮递</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">大陆地区：运费</span><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">包裹，购物满</span><span lang=\\\"EN-US\\\">29</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元免运费</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">港澳地区：运费为商品原价总金额的</span><span lang=\\\"EN-US\\\">30%</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">，最低</span><span lang=\\\"EN-US\\\">20</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">海外地区：运费为商品原价总金额的</span><span lang=\\\"EN-US\\\">50%</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">，最低</span><span lang=\\\"EN-US\\\">50</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮政特快专递</span><span lang=\\\"EN-US\\\">(EMS)</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">北京地区：运费为订单总金额的</span><span lang=\\\"EN-US\\\">50%</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">，最低</span><span lang=\\\"EN-US\\\">20</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">大陆其它地区：运费为订单总金额的</span><span lang=\\\"EN-US\\\">100%</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">，最低</span><span lang=\\\"EN-US\\\">20</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">港澳台地区：运费为商品原价总金额的</span><span lang=\\\"EN-US\\\">70%</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">，最低</span><span lang=\\\"EN-US\\\">60</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303975661');
INSERT INTO shop_help VALUES ('35', '6', '0', '上门自提', '<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注意事项：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">自提时间：周一至周日，</span><span lang=\\\"EN-US\\\">09:00</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">－</span><span lang=\\\"EN-US\\\">19:00</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（如遇国家法定节假日，则以</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站新闻发布放假时间为准，请大家届时关注）</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品到达自提点后，我们将为您保留三天，超过三天不上门提货，则视为默认取消订单；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">钱、货需客户当面点清，离开提货前台后</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站将不再对钱、货数量负责；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">货物价保需客户在自提当场提出，离开提货前台后</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站不再对自提货物提供价保服务；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">普通发票：每张订单需在自提当日开具发票，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站不提供累计开具发票的服务；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">增值税发票：选择</span><span lang=\\\"EN-US\\\">POS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">机刷卡，不能开具增票；增票当日无法开具，需订单完成后三个工作日左右</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站按订单地址将增票快递给客户，如订单中地址有误请及时通知</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服人员。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">特殊说明：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">上门自提的订单，请在规定的时间内到自提点提取货物。上门自提订单原则上免收配送费用，但如果一个</span><span lang=\\\"EN-US\\\">ID</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">帐号在一个月内有过</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">次以上或一年内有过</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">次以上，在规定的时间内无理由不履约提货，我司将在相应的</span><span lang=\\\"EN-US\\\">ID</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">帐户里每单扣除</span><span lang=\\\"EN-US\\\">50</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个积分做为运费；时间计算方法为：成功提交订单后向前推算</span><span lang=\\\"EN-US\\\">30</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">天为一个月，成功提交订单后向前推算</span><span lang=\\\"EN-US\\\">365</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">天为一年，不以自然月和自然年计算；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">对于上门自提的客户，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站可以接受现金、支票（北京和上海的自提点支持，其他城市的自提点不支持）和</span><span lang=\\\"EN-US\\\">POS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">机刷卡三种付款方式。选择支票支付方式，需要客户自行将支票内容填写完整（货款在</span><span lang=\\\"EN-US\\\">5000</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元或</span><span lang=\\\"EN-US\\\">5000</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元以上，需要款到帐后方可提货）；</span><span lang=\\\"EN-US\\\">POS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">机刷卡只支持带有银联标识的银行卡。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">信用卡</span><span lang=\\\"EN-US\\\">POS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">机刷卡消费超过</span><span lang=\\\"EN-US\\\">4500</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元时，发卡银行按照相关规定有可能不向您赠送积分，具体信息请致电发卡行确认。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">自提点</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">自提点适用范围：以下地区用户均可到相应自提点付款提货，无需支付运费（大家电产品限物流中心自提点）。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">以下各自提点均不接收由于各种原因被客户邮寄退回的商品，否则出现的一切后果</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站概不负责。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">友好提示</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">下单之后可以更换自提点或更换配送方式吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">可以更换自提点但无法更换配送方式。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">方法：我的</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站</span><span lang=\\\"EN-US\\\">-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">订单中心</span><span lang=\\\"EN-US\\\">-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">点“查看”</span><span lang=\\\"EN-US\\\">-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">进入订单详细页面</span><span lang=\\\"EN-US\\\">-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">订单操作</span><span lang=\\\"EN-US\\\">-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">修改订单</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">一般来说，在您选购的商品没有打印完毕之前，都是可以修改订单的。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">自提时验货发现问题，可以当场换货吗？如何处理？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">不可以。自提时如果发现货品有问题请当场反映给</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站工作人员，由工作人员帮您处理。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">自提价格和其它配送方式价格是否一样？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">不管您选用哪种配送方式，商品的价格是一样的。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">可以到自提点付款，贵公司工作人员送货到家吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">不可以，自提点采用的是上门付款提货方式。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">为何结算时找不到某某自提点？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）可能是您所下订单的收货地址与该自提点不在一个省市；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）或者该自提点已经更换名称、地址；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）或者是您所购买的商品是大家电，该分类下部分商品只支持部分地区物流总部自提。详情以下单时所支持配送方式为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">6.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">自提点可以先验货后付款吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">不可以，我司不管哪种配送方式都是采取先付款后验货的方式。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">7.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">任何商品都可以自提吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">除了虚拟商品和服务类商品（如网络版杀毒软件）及部分大家电无法自提外，其它都可以自提。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">8.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">上门自提能用支付宝支付吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">不可以。对于上门自提的客户，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站可以接受现金、支票和</span><span lang=\\\"EN-US\\\">POS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">机刷卡三种付款方式。选择支票支付方式，需要客户自行将支票内容填写完整（货款在</span><span lang=\\\"EN-US\\\">5000</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元或</span><span lang=\\\"EN-US\\\">5000</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元以上，需要款到帐后方可提货）；</span><span lang=\\\"EN-US\\\">POS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">机刷卡只支持带有银联标识的银行卡。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">9.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">自提点装机需要自带什么，比如：系统盘等等</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">自提点装机服务负责仅配置单里的散件组装，如您希望安装系统请自带系统盘，我们会指导您安装。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">10.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">购买配件，上门自提时可以提供安装服务吗？（比如内存条）</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">购买配件，自提时不提供安装服务，希望您能理解。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303975686');
INSERT INTO shop_help VALUES ('36', '6', '0', '加急快递', '<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如何正确选择加急配送服务</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">北京、天津、上海、广州、深圳、廊坊</span><span lang=\\\"EN-US\\\">6</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个城市地区的用户，并且为当地发货订单，用户可在结算中心“送货方式”部分选择加急快递送货上门服务。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">常见问题解答：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">我的订单什么时候可以送到？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">具体配送时间根据不同城市略有不同，请查看配送范围及运费</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2.\\\"</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">加急快递送货上门</span><span lang=\\\"EN-US\\\">\\\"</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">的费收取标准？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">北京、天津、上海、广州、深圳、廊坊</span><span lang=\\\"EN-US\\\">6</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个城市的“加急快递送货上门”配送费为</span><span lang=\\\"EN-US\\\">10</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">单。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303975706');
INSERT INTO shop_help VALUES ('37', '6', '0', '商品验货与签收', '<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">快递送货上门、圆通快递的订单</span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">1</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">、签收时仔细核对：商品及配件、商品数量、</span><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">iWebShop</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">网站的发货清单、发票（如有）、三包凭证（如有）等</span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">2</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">、若存在包装破损、商品错误、商品少发、商品有表面质量问题等影响签收的因素，请您一定要当面向送货员说明情况并当场整单退货</span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">邮局邮寄的订单</span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">1</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">、请您一定要小心开包，以免尖锐物件损伤到包裹内的商品</span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">2</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">、签收时仔细核对：商品及配件、商品数量、</span><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">iWebShop</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">网站的发货清单、发票（如有）、三包凭证（如有）等</span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">3</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">、若包装破损、商品错误、商品少发、商品存在表面质量问题等，您可以选择整单退货；或是求邮局开具相关证明后签收，然后登陆</span><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">iWebShop</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">网站申请退货或申请换货</span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">温馨提示</span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">1</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">、货到付款的订单送达时，请您当面与送货员核兑商品与款项，确保货款两清；若事后发现款项有误，</span><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">iWebShop</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">网站将无法为您处理</span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">2</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">、请收货时务必认真核对，若您或您的委托人已签收，则说明订单商品正确无误且不存在影响使用的因素，</span><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">iWebShop</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">网站有权不受理因包装或商品破损、商品错漏发、商品表面质量问题、商品附带品及赠品少发为由的退换货申请</span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">3</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">、部分商品由商店街的商家提供</span><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">,</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">这部分商品的验货验收不在</span><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\">iWebShop</span><span style=\\\"\\\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\\&quot;\\\">网站承诺的范围内</span></p>\r\n<p class=\\\"\\\\&quot;MsoNormal\\\\&quot;\\\"><span lang=\\\"\\\\&quot;EN-US\\\\&quot;\\\"><o:p>&nbsp;</o:p></span></p>', '1303975725');
INSERT INTO shop_help VALUES ('38', '6', '0', 'EMS/邮政普包', '<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站目前除提供</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站快递以及上门自提服务以外，还提供了更多样的配送方式，支持更多地区的配送服务。目前开通的快递有圆通快递、宅急送、邮政普包和邮政</span><span lang=\\\"EN-US\\\">EMS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（邮政特快专递）等。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">　</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮政普包运费标准</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">区域</span><span lang=\\\"EN-US\\\"><span style=\\\"mso-tab-count:1;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">省</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">市</span><span lang=\\\"EN-US\\\"><span style=\\\"mso-tab-count: 1\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">运费</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">一区</span><span lang=\\\"EN-US\\\"><span style=\\\"mso-tab-count:1;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">北京、上海、广东、江苏、浙江、山东、湖北、陕西、四川</span><span lang=\\\"EN-US\\\"><span style=\\\"mso-tab-count:1;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">单</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">二区</span><span lang=\\\"EN-US\\\"><span style=\\\"mso-tab-count:1;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">天津、重庆、黑龙江、吉林、辽宁、河北、河南、山西、安徽、江西、湖南、福建、广西、海南</span><span lang=\\\"EN-US\\\"><span style=\\\"mso-tab-count:1;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>10</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">公斤以下：</span><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">单</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">10</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（含）公斤以上：</span><span lang=\\\"EN-US\\\">6</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">单</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">三区</span><span lang=\\\"EN-US\\\"><span style=\\\"mso-tab-count:1;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">内蒙古、甘肃、宁夏、云南、贵州、青海、新疆、西藏</span><span lang=\\\"EN-US\\\"><span style=\\\"mso-tab-count:1;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>10</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">公斤以下：</span><span lang=\\\"EN-US\\\">10</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">单</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">10</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（含）公斤以上：</span><span lang=\\\"EN-US\\\">15</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">单</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮政普包到货时间</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">根据邮政系统服务时限，邮政普包的货物到货（到客户所在地邮政局）时间为</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">～</span><span lang=\\\"EN-US\\\">15</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个工作日，在到货后需要凭包裹单据去包裹所在邮政局领取。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮政普包跟踪查询</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮政普包跟踪查询请点击此处</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">http://yjcx.chinapost.com.cn/queryMail.do?action=batchQueryMail</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮政</span><span lang=\\\"EN-US\\\">EMS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">运费标准</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">按优惠资费起重</span><span lang=\\\"EN-US\\\">500</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">克以内</span><span lang=\\\"EN-US\\\">16</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元，续重不同省市资费会有所不同。以</span><span lang=\\\"EN-US\\\">500</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">克为计算资费单位，即每件包裹重量尾数不满</span><span lang=\\\"EN-US\\\">500</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">克的，应进整按</span><span lang=\\\"EN-US\\\">500</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">克计算资费。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">　</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮政</span><span lang=\\\"EN-US\\\">EMS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">到货时间</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">根据邮政系统服务时限，邮政</span><span lang=\\\"EN-US\\\">EMS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">的货物到货时间为</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">～</span><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个工作日（节假日除外）。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">　</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮政</span><span lang=\\\"EN-US\\\">EMS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">跟踪查询</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮政</span><span lang=\\\"EN-US\\\">EMS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">跟踪查询请点击此处</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">http://www.ems.com.cn/qcgzOutQueryNewAction.do?reqCode=gotoSearch</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">　</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">温馨提示</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">由于第三方物流公司配送区域变动频繁，请您采用以上配送方式时先行查阅配送公司的配送范围，以保证您的订单可以及时到达。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">在您成功提交订单后，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站在确认到款的情况下会尽快安排商品的出库，您的货物运单号也会在货物出库后的第二至三个工作日添加到您的帐户中心</span><span lang=\\\"EN-US\\\">,</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">您可以登陆帐户中心的订单查询页面进行查询跟踪您的货物情况。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">音响设备江浙沪地区以外的地方需要空运，请选择</span><span lang=\\\"EN-US\\\">EMS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">，选择圆通可能会造成不必要的延误和退件。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">关于送货时间</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">货物如未在您选定送货方式规定的最长送货时间内送达，您可以选择以下方式处理；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">您可以进入</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站网帐户中心，选择“订单管理”，根据您的订单号码查询到自己的运单号，然后直接进入圆通快递公司网站</span><span lang=\\\"EN-US\\\">http://www.yto.net.cn/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">，输入运单号，在线查询配送状况；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">您可以进入相应快递公司网站，查询您所在地的快递公司分部联系电话，拨打查询；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">您可以点击网站首页右侧的在线客服给我们留言，告知订单号，我们将为您及时处理；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">您可以拨打服务电话</span><span lang=\\\"EN-US\\\">400-820-4400</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">通知我们，我们将为您及时处理。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">选择邮政配送方式的客户在收到产品后可在邮局工作人员的面前拆包，如产品损坏，可直接在签收单上注明：内件损坏，本人拒收字样，由邮局再返回</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站和邮局协商赔偿事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如签收后未当面开封，产品出现问题，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站很难和邮局协商赔偿，为了客户的利益，希望客户能够执行并理解。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">选择其他方式的客户在收到货物时，请您认真检查外包装。如有明显损坏迹象，您可以拒收该货品，并及时通知我们。我们会处理并承担由此而产生的运输费用，请客户不必担心。如您签收有明显损坏迹象的外包装后再投诉货物有误或有损坏，恕我们不能受理。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303975760');
INSERT INTO shop_help VALUES ('39', '5', '0', '换货说明', '<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站承诺自顾客收到商品之日起</span><span lang=\\\"EN-US\\\">15</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">日内（以发票日期为准，如无发票以</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站发货清单的日期为准），如符合以下条件，我们提供换货服务：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、商品及商品本身的外包装没有损坏，保持</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站出售时的原质原样；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、注明换货原因，如果商品存在质量问题，请务必说明；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、确保商品及配件、附带品或者赠品、保修卡、三包凭证、发票、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站发货清单齐全；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、如果成套商品中有部分商品存在质量问题，在办理换货时，必须提供成套商品；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站中的部分商品是由与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站签订合同的商家提供的，这些商品的换货请与商家联系</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">以下情况不予办理换货：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、任何非由</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站出售的商品；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、任何已使用过的商品，但有质量问题除外；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、任何因非正常使用及保管导致出现质量问题的商品。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、所有未经客服确认擅自退回的商品，换货申请无法受理。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">特殊说明：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、食品、保健食品类：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">食品类商品不予换货，但有质量问题除外；如商品过期或距离保质期结束不到</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个月。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、美妆个护类：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">化妆品及个人护理用品属于特殊商品不予换货，但有质量问题除外，如商品包装破损，商品过期或离过期不到</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个月。我们保证商品的进货渠道和质量，如果您在使用时对商品质量表示置疑，请出具书面鉴定，我们会按照国家法律规定予以处理。因个人喜好（气味，色泽、型号，外观）和个人肤质不同要求的换货将无法受理。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、母婴用品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品签收后不予换货，但有质量问题除外，洗涤方法参考说明，正常缩水</span><span lang=\\\"EN-US\\\">10%</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">以内正常，不属于质量问题。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">因个人原因造成的商品损坏（如自行修改尺寸，洗涤，长时间穿着等），不予换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品吊牌，包装破损，发货单、商品附件（如纽扣等）、说明书、保修单、标签等丢失，不予换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：图片及信息仅供参考，不属质量问题。因拍摄灯光、显示器分辨率等原因可能会造成轻微色差，在网购中属于正常现象，一切以实物为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：品牌商品按其三包约定执行。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、服装类商品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">内衣类商品，如内衣裤，袜子，文胸类商品，除质量问题除外，不予换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">因个人原因造成的商品损坏（如自行修改尺寸，洗涤，长时间穿着等），不予换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品吊牌，包装破损，发货单、商品附件（如纽扣等）、说明书、保修单、标签等丢失，不予换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：图片及信息仅供参考，不属质量问题。因拍摄灯光、显示器分辨率等原因可能会造成轻微色差，在网购中属于正常现象，一切以实物为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：品牌商品按其三包约定执行。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、鞋帽箱包类：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品吊牌，包装破损，发货单、商品配件（如配饰挂坠等）、说明书、保修单、标签等丢失，不予换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：图片及信息仅供参考，不属质量问题。因拍摄灯光、显示器分辨率等原因可能会造成轻微色差，在网购中属于正常现象，一切以实物为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：品牌商品按其三包约定执行。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">6</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、玩具类：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品签收后不予换货，但有质量问题除外。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：图片及信息仅供参考，不属质量问题。因拍摄灯光、显示器分辨率等原因可能会造成轻微色差，在网购中属于正常现象，一切以实物为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：品牌商品按其三包约定执行。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">7</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、家居类商品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">因个人原因造成的商品损坏（如自行修改尺寸，洗涤），不予换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品吊牌，包装破损，发货单、商品配件、说明书、保修单、标签等丢失，不予换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：图片及信息仅供参考，不属质量问题。因拍摄灯光、显示器分辨率等原因可能会造成轻微色差，在网购中属于正常现象，一切以实物为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：品牌商品按其三包约定执行。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">8</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、手表类商品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">手表类商品换货说明请您以商品的单品页面说明为准；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">以下情况不予办理换货：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果商品自身携带的产品序列号与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站售出的不符；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">缺少随商品附带的保修卡、发票、配件等；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品已打开塑封包装或撕开开箱即损贴纸者，但有质量问题除外；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">将商品存储、暴露在超出商品适宜的环境中；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">未经授权的修理、误用、疏忽、滥用、事故、改动、不正确的安装；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">6)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">食物或液体溅落造成损坏；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">7)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品使用中出现的磨损，非质量问题。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">8)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">手表表带经过调整，但有质量问题除外。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">9)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">非质量问题。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">9</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、珠宝首饰类及礼品类商品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">对于附带国家级宝玉石鉴定中心出具的鉴定证书的，非质量问题不予换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">顾客在收到商品之日起（以发票日期为准）</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个月内，如果出现质量问题，请到当地的质量监督部门</span><span lang=\\\"EN-US\\\">-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">珠宝玉石质量检验中心进行检测，如检测报告确认属于质量问题，请与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服中心联系办理换货事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换货时，请您务必将商品的外包装、内带附件、鉴定证书、说明书等随同商品一起退回。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">对于高档首饰都附带国家级宝玉石鉴定中心出具的鉴定证书，如果您对此有任何质疑，请到出具该证书的鉴定机构进行复检。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">瑞士军刀、</span><span lang=\\\"EN-US\\\">zippo</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">打火机、钻石、</span><span lang=\\\"EN-US\\\">18K</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">金，如无质量问题不换货，有质量问题请出示检测报告，方可换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">为了保证您的利益，请您在收到商品时，仔细检查，如果您发现有任何问题，请您当时指出，并办理换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">10</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、软件类商品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">软件类商品换货说明请您以商品的单品页面说明为准；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如出现质量问题请您直接按照说明书上的联系方式与厂家的售后部门联系解决；已打开塑封包装，不予退换货，但有质量问题除外。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">11</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、手机、数码相机、数码摄像机、笔记本电脑等商品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">顾客收到商品之日起（以发票日期为准）七日内，有非人为质量问题凭有效检测报告可选择退换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">顾客收到商品之日起（以发票日期为准）八至十五日内，有非人为质量问题凭有效检测报告可选择更换同型号商品。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">顾客收到商品之日起（以发票日期为准）十六日至一年内，有非人为质量问题可在当地保修点免费保修。配件保修请参阅保修卡。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">为了您的自身权益请妥善保存发票和保修卡，如有发生质量问题请携带发票和保修卡及时到当地检测点检测，以免给您造成不必要的损失。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">退换货要求：保修卡、发票、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站发货清单、有效检测报告一律齐全，并且配件完整，包装盒完好，否则将不予受理。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">6)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">全国各地检测、保修点请在保修卡中查找。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">7)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">不接受无检测报告</span><span lang=\\\"EN-US\\\">,</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">并且不在规定时间内的退换货要求。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">8)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换机产生的邮费由买卖双方各自承担。换货商品一律以邮寄的方式发出。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">9)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换货地址及联系电话详见各商品页面“售后服务”。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">10)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如需换货请您先联系</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服，在客服人员指导下，一律以邮寄方式完成换货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：平邮客户以包裹单上的签收日期为主</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">12</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、数码类（手机、数码相机、数码摄像机、笔记本电脑除外）</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品换货说明请您以商品的单品页面说明为准；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品如出现质量问题，请先行按照说明书上的联系方式与厂家的售后部门联系。如果确认属于质量问题，请与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服中心联系办理换货事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换货时，请您务必将商品的外包装、内带附件、保修卡、说明书、发票等随同商品一起退回。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：平邮客户以包裹单上的签收日期为主。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">13</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、电脑办公类</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品换货说明请您以商品的单品页面说明为准；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品如出现质量问题，请先行按照说明书上的联系方式与厂家的售后部门联系。如果确认属于质量问题，请与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服中心联系办理换货事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换货时，请您务必将商品的外包装、内带附件、保修卡、说明书、发票等随同商品一起退回。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：平邮客户以包裹单上的签收日期为主。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">14</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、家电类</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品如出现质量问题，请先行按照说明书上的联系方式与厂家的售后部门联系，如果确认属于质量问题，持厂家出具质量问题检测报告与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服中心联系办理换货事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换货时，请您务必将商品的外包装、内带附件、保修卡、说明书、发票等随同商品一起退回。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：平邮客户以包裹单上的签收日期为主。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">15</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、康体保健器材类商品</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品换货说明请您以商品的单品页面说明为准；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品如出现质量问题，请先行按照说明书上的联系方式与厂家的售后部门联系。如果确认属于质量问题，请与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服中心联系办理换货事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换货时，请您务必将商品的外包装、内带附件、保修卡、说明书、发票等随同商品一起退回。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：平邮客户以包裹单上的签收日期为主。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">16</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、汽车用品类</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">汽车养护用品、汽车耗材开封后不换货。（例如车蜡、防护贴膜、清洗剂、车内空气净化、车用油品等）</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品换货说明请您以商品的单品页面说明为准；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品如出现质量问题，请先行按照说明书上的联系方式与厂家的售后部门联系。如果确认属于质量问题，请与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服中心联系办理换货事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换货时，请您务必将商品的外包装、内带附件、保修卡、说明书、发票等随同商品一起退回。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：平邮客户以包裹单上的签收日期为主。</span></p>', '1303975802');
INSERT INTO shop_help VALUES ('40', '5', '0', '退货说明', '<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站承诺自顾客收到商品之日起</span><span lang=\\\"EN-US\\\">7</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">日内（以发票日期为准，如无发票以</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站发货清单的日期为准），如符合以下条件，我们将提供全款退货的服务：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、商品及商品本身的外包装没有损坏，保持</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站出售时的原质原样；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、注明退货原因，如果商品存在质量问题，请务必说明；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、确保商品及配件、附带品或者赠品、保修卡、三包凭证、发票、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站发货清单齐全；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、如果成套商品中有部分商品存在质量问题，在办理退货时，必须提供成套商品；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站中的部分商品是由与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站签订合同的商家提供的，这些商品的退货请与商家联系</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">以下情况不予办理退货：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、任何非由</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站出售的商品；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、任何已使用过的商品，但有质量问题除外；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、任何因非正常使用及保管导致出现质量问题的商品。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">特殊说明：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、食品、保健食品类：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">食品类商品不予退货，但有质量问题除外；如商品过期或距离保质期结束不到</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个月。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、美妆个护类：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">化妆品及个人护理用品属于特殊商品不予退货，但有质量问题除外，如商品包装破损，商品过期或离过期不到</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个月。我们保证商品的进货渠道和质量，如果您在使用时对商品质量表示置疑，请出具书面鉴定，我们会按照国家法律规定予以处理。因个人喜好（气味，色泽、型号，外观）和个人肤质不同要求的退货将无法受理。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、母婴用品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品签收后不予退货，但有质量问题除外，洗涤方法参考说明，正常缩水</span><span lang=\\\"EN-US\\\">10%</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">以内正常，不属于质量问题。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">因个人原因造成的商品损坏（如自行修改尺寸，洗涤，长时间穿着等），不予退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品吊牌，包装破损，发货单、商品附件（如纽扣等）、说明书、保修单、标签等丢失，不予退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：图片及信息仅供参考，不属质量问题。因拍摄灯光、显示器分辨率等原因可能会造成轻微色差，在网购中属于正常现象，一切以实物为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：品牌商品按其三包约定执行。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、服装类商品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">内衣类商品，如内衣裤，袜子，文胸类商品，除质量问题除外，不予退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">因个人原因造成的商品损坏（如自行修改尺寸，洗涤，长时间穿着等），不予退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品吊牌，包装破损，发货单、商品附件（如纽扣等）、说明书、保修单、标签等丢失，不予退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：图片及信息仅供参考，不属质量问题。因拍摄灯光、显示器分辨率等原因可能会造成轻微色差，在网购中属于正常现象，一切以实物为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：品牌商品按其三包约定执行。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、鞋帽箱包类：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品吊牌，包装破损，发货单、商品配件（如配饰挂坠等）、说明书、保修单、标签等丢失，不予退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：图片及信息仅供参考，不属质量问题。因拍摄灯光、显示器分辨率等原因可能会造成轻微色差，在网购中属于正常现象，一切以实物为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：品牌商品按其三包约定执行。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">6</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、玩具类：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品签收后不予退货，但有质量问题除外。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：图片及信息仅供参考，不属质量问题。因拍摄灯光、显示器分辨率等原因可能会造成轻微色差，在网购中属于正常现象，一切以实物为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：品牌商品按其三包约定执行。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">7</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、家居类商品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">因个人原因造成的商品损坏（如自行修改尺寸，洗涤），不予退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品吊牌，包装破损，发货单、商品配件、说明书、保修单、标签等丢失，不予退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：图片及信息仅供参考，不属质量问题。因拍摄灯光、显示器分辨率等原因可能会造成轻微色差，在网购中属于正常现象，一切以实物为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：品牌商品按其三包约定执行。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">8</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、手表类商品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">手表类商品退货说明请您以商品的单品页面说明为准；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">以下情况不予办理退货：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果商品自身携带的产品序列号与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站售出的不符；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">缺少随商品附带的保修卡、发票、配件等；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品已打开塑封包装或撕开开箱即损贴纸者，但有质量问题除外；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">将商品存储、暴露在超出商品适宜的环境中；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">未经授权的修理、误用、疏忽、滥用、事故、改动、不正确的安装；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">6)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">食物或液体溅落造成损坏；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">7)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品使用中出现的磨损，非质量问题。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">8)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">手表表带经过调整，但有质量问题除外。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">9)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">非质量问题。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">9</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、珠宝首饰类及礼品类商品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">对于附带国家级宝玉石鉴定中心出具的鉴定证书的，非质量问题不予退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">顾客在收到商品之日起（以发票日期为准）</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个月内，如果出现质量问题，请到当地的质量监督部门</span><span lang=\\\"EN-US\\\">-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">珠宝玉石质量检验中心进行检测，如检测报告确认属于质量问题，请与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服中心联系办理退货事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">退货时，请您务必将商品的外包装、内带附件、鉴定证书、说明书等随同商品一起退回。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">对于高档首饰都附带国家级宝玉石鉴定中心出具的鉴定证书，如果您对此有任何质疑，请到出具该证书的鉴定机构进行复检。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">瑞士军刀、</span><span lang=\\\"EN-US\\\">zippo</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">打火机、钻石、</span><span lang=\\\"EN-US\\\">18K</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">金，如无质量问题不退货，有质量问题请出示检测报告，方可退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">为了保证您的利益，请您在收到商品时，仔细检查，如果您发现有任何问题，请您当时指出，并办理退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">10</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、软件类商品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">软件类商品退货说明请您以商品的单品页面说明为准；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如出现质量问题请您直接按照说明书上的联系方式与厂家的售后部门联系解决；已打开塑封包装，不予退换货，但有质量问题除外。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">11</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、手机、数码相机、数码摄像机、笔记本电脑等商品：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">顾客收到商品之日起（以发票日期为准）七日内，有非人为质量问题凭有效检测报告可选择退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">顾客收到商品之日起（以发票日期为准）八至十五日内，有非人为质量问题凭有效检测报告可选择更换同型号商品。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">顾客收到商品之日起（以发票日期为准）十六日至一年内，有非人为质量问题可在当地保修点免费保修。配件保修请参阅保修卡。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">为了您的自身权益请妥善保存发票和保修卡，如有发生质量问题请携带发票和保修卡及时到当地检测点检测，以免给您造成不必要的损失。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">退换货要求：保修卡、发票、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站发货清单、有效检测报告一律齐全，并且配件完整，包装盒完好，否则将不予受理。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">6)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">全国各地检测、保修点请在保修卡中查找。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">7)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">不接受无检测报告</span><span lang=\\\"EN-US\\\">,</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">并且不在规定时间内的退换货要求。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">8)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换机产生的邮费由买卖双方各自承担。换货商品一律以邮寄的方式发出。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">9)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换货地址及联系电话详见各商品页面“售后服务”。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">10)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如需退货请您先联系</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服，在客服人员指导下，一律以邮寄方式完成退货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：平邮客户以包裹单上的签收日期为主</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">12</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、数码类（手机、数码相机、数码摄像机、笔记本电脑除外）</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品退货说明请您以商品的单品页面说明为准；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品如出现质量问题，请先行按照说明书上的联系方式与厂家的售后部门联系。如果确认属于质量问题，请与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服中心联系办理退货事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">退货时，请您务必将商品的外包装、内带附件、保修卡、说明书、发票等随同商品一起退回。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：平邮客户以包裹单上的签收日期为主。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">13</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、电脑办公类</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品退货说明请您以商品的单品页面说明为准；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品如出现质量问题，请先行按照说明书上的联系方式与厂家的售后部门联系。如果确认属于质量问题，请与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服中心联系办理退货事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">退货时，请您务必将商品的外包装、内带附件、保修卡、说明书、发票等随同商品一起退回。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：平邮客户以包裹单上的签收日期为主。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">14</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、家电类</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品如出现质量问题，请先行按照说明书上的联系方式与厂家的售后部门联系，如果确认属于质量问题，持厂家出具质量问题检测报告与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服中心联系办理退货事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">退货时，请您务必将商品的外包装、内带附件、保修卡、说明书、发票等随同商品一起退回。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：平邮客户以包裹单上的签收日期为主。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">15</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、康体保健器材类商品</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品退货说明请您以商品的单品页面说明为准；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品如出现质量问题，请先行按照说明书上的联系方式与厂家的售后部门联系。如果确认属于质量问题，请与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服中心联系办理退货事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">退货时，请您务必将商品的外包装、内带附件、保修卡、说明书、发票等随同商品一起退回。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：平邮客户以包裹单上的签收日期为主。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">16</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、汽车用品类</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">汽车养护用品、汽车耗材开封后不予退货。（例如车蜡、防护贴膜、清洗剂、车内空气净化、车用油品等）</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品退货说明请您以商品的单品页面说明为准；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">商品如出现质量问题，请先行按照说明书上的联系方式与厂家的售后部门联系。如果确认属于质量问题，请与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站客服中心联系办理退货事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">退货时，请您务必将商品的外包装、内带附件、保修卡、说明书、发票等随同商品一起退回。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：平邮客户以包裹单上的签收日期为主。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\"><br />\r\n</span></p>', '1303975837');
INSERT INTO shop_help VALUES ('41', '5', '0', '退/换货注意事项', '<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、邮寄时请认真填写以下信息，否则将影响您的退</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换货办理：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">　·您的姓名</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">　·收货地址、</span><span lang=\\\"EN-US\\\">Email</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">　·订单号、商品名称和型号</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">　·退</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换货原因</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、如需检验报告的商品</span><span lang=\\\"EN-US\\\">,</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">您还需要提供检验报告，查看退货说明、换货说明；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、请您在收到商品后尽快进行“确认收货”操作，否则将会影响您的退</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换货的办理；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站的部分商品是由与</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站合作的商家提供的，此商品的退</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换货流程请直接与商家联系。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303975866');
INSERT INTO shop_help VALUES ('42', '5', '0', '余额的使用与提现', '<p class=\"\\&quot;MsoNormal\\&quot;\"><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">一、账户余额支付：</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">1</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、“我的</span><span lang=\"\\&quot;EN-US\\&quot;\">iWebShop</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\&quot;\">网站</span><span lang=\"\\&quot;EN-US\\&quot;\">-</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">账户管理”是您在</span><span lang=\"\\&quot;EN-US\\&quot;\">iWebShop</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\&quot;\">网站上的专用帐户。</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">2</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、账户内的金额是顾客在</span><span lang=\"\\&quot;EN-US\\&quot;\">iWebShop</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\&quot;\">网站购物后余下的现金或通过邮局、银行多余汇款的总和，如下图：</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">3</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、您可登录“我的</span><span lang=\"\\&quot;EN-US\\&quot;\">iWebShop</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\&quot;\">网站”查询余额。</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">4</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、在订单结算时，系统将自动使用您的账户余额，您只需支付其余货款：</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">5</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、如果您的账户余额足以支付订单，您仍需选择一种支付方式，否则将无法提交订单。</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">二、账户余额提现</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">iWebShop</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">网站为您提供了账户余额提现功能，您可以将您在</span><span lang=\"\\&quot;EN-US\\&quot;\">iWebShop</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\&quot;\">网站账户余额中的可用余额提取为现金，我们会已邮局汇款的方式退给您。</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">账户余额提现的流程：</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">温馨提示：</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">1</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、账户余额内的现金只能以邮局汇款方式提现；</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">2</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、每日提现次数不超过</span><span lang=\"\\&quot;EN-US\\&quot;\">1</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">次；</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">3</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、提现账户余额，需向邮局支付一定比例的手续费：</span><span lang=\"\\&quot;EN-US\\&quot;\">200</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">元以下</span><span lang=\"\\&quot;EN-US\\&quot;\">2</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">元，</span><span lang=\"\\&quot;EN-US\\&quot;\">200</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">元以上</span><span lang=\"\\&quot;EN-US\\&quot;\">1%</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">，最高不超过</span><span lang=\"\\&quot;EN-US\\&quot;\">50</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">元；</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">4</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、账户余额提现服务暂不支持国外和港澳台地区；</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">5</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、若您提现失败，邮局不退回相应的手续费；</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">6</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、提现金额不可大于可用余额；</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">7</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、申请提现后，</span><span lang=\"\\&quot;EN-US\\&quot;\">iWebShop</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\&quot;\">网站处理时限是</span><span lang=\"\\&quot;EN-US\\&quot;\">3</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">个工作日，邮局处理时限是</span><span lang=\"\\&quot;EN-US\\&quot;\">14</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">个工作日；</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\">8</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">、常见提现失败原因：</span><span lang=\"\\&quot;EN-US\\&quot;\">1</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">）逾期退汇；</span><span lang=\"\\&quot;EN-US\\&quot;\">2</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">）地址不详；</span><span lang=\"\\&quot;EN-US\\&quot;\">3</span><span style=\"\\&quot;font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\&quot;\">）原地址查无此人</span></p>\r\n<p class=\"\\&quot;MsoNormal\\&quot;\"><span lang=\"\\&quot;EN-US\\&quot;\"><o:p>&nbsp;</o:p></span></p>', '1303975894');
INSERT INTO shop_help VALUES ('43', '5', '0', '发票制度', '<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">发票政策</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、发票性质</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站提供的是“</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">公司销售商品专用发票”或“</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">有限公司销售商品专用发票”</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、发票信息</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">发票抬头：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）发票抬头不能为空；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）您可填写：“个人”、您的姓名、或您的单位名称</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">发票内容：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站可开具的发票内容：图书、音像、游戏、软件、资料、办公用品、</span><span lang=\\\"EN-US\\\">IT</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">数码、通讯器材、体育休闲、礼品、饰品、汽车用品、化妆品、家用电器、玩具、箱包皮具，请您根据需要选择</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）数码、手机、家电类商品的发票内容只能开具商品名称和型号，无法开具其它内容</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">发票金额：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站仅开具现金购物金额的发票，不含运费、礼券、礼品卡金额</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">温馨提示：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）请您在收货时向送货员索取运费发票</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）此政策仅适用于</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站自营，若您订购商店街的商品，请与商家联系确认</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">索取发票</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">请在提交订单时的结算页面，选择“索取发票”，按照提示填写发票抬头、选择发票内容，发票将会随您的订单商品一起送达：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">温馨提示：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">若您订购了数码、手机、家电类商品，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站只能将发票内容开具商品的名称和型号</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）补开</span><span lang=\\\"EN-US\\\">/</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">换开发票期限：订单发货后一年以内</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）若您提交订单时未选择发票，请接收到商品后在补开发票期限内</span><span lang=\\\"EN-US\\\">,</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">发邮件至客服邮箱</span><span lang=\\\"EN-US\\\">service@cs.dangdang.com</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">，并注明您的订单号、发票抬头、发票内容、邮寄地址、邮编及收件人，我们会在五个工作日内为您开具发票并以平信方式为您寄出</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）若您接收到的发票信息有误，请在换开发票期限内，将原发票寄至以下地址，同时请务必注明您的订单号、正确的发票抬头、内容、新发票的邮寄地址、邮编、收件人，我们收到后，会在五个工作日内为您重新开具发票以平信方式寄出</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮寄地址：</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">信箱</span><span lang=\\\"EN-US\\\">,</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮编：</span><span lang=\\\"EN-US\\\">000000</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">温馨提示：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）若您订购的是数码、手机、家电类商品，发票内容只能开具商品名称和型号，无法开具其他内容</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（</span><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）若您订购商店街的商品，请与商家联系索取发票</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303975926');
INSERT INTO shop_help VALUES ('44', '7', '0', '关于我们', '<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">Jooyea</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">技术团队</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">济南聚易信息技术有限公司（</span><span lang=\\\"EN-US\\\">Jooyea Tech</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">）专注于基于开源协作的云计算及云服务技术，其高负载高扩展能力的分布式计算与服务技术体系，已成为开源社区软件领域领先的云计算技术平台，该平台通用产品化的名称为</span><span lang=\\\"EN-US\\\">iWeb SuperInteraction</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">，简称</span><span lang=\\\"EN-US\\\">iWebSI</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">。</span><span lang=\\\"EN-US\\\">Jooyea Tech</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">的云计算技术框架可涵盖</span><span lang=\\\"EN-US\\\">Internet</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">和移动互联网。依托具有自主知识产权的云技术平台，</span><span lang=\\\"EN-US\\\">Jooyea Tech</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">发起了一系列高负载高度交互类的开源软件产品，其产品线由社会化网络服务</span><span lang=\\\"EN-US\\\">(iWebSNS)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">、社区电子商务</span><span lang=\\\"EN-US\\\">(iWebShop&amp;Mall)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、即时通讯服务</span><span lang=\\\"EN-US\\\">(iWebIM)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">等产品构成。由于领先的高负载技术体系和先进的产品理念，</span><span lang=\\\"EN-US\\\">Jooyea Tech</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">从一开始运作就得到天使投资人的注资。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">Jooyea Tech</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">的产品愿景和团队理念是“开放、分享、共赢、丰富互联网”。</span><span lang=\\\"EN-US\\\">Jooyea Tech</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">提倡互联网的开放、创新和共创机遇，而不单单像盈利或者商业组织那样只强调商业利益。并且，</span><span lang=\\\"EN-US\\\">Jooyea Tech</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">把成功定义为丰富、繁荣的互联网市场面貌。在这种环境下，互联网上的众多站点应该呈现出不同的形态、风貌，体现出个性化，真正塑造每一个站点的“性格”，让每一个站点“</span><span lang=\\\"EN-US\\\">Live</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">起来”，避免同质化。从而真正做到用技术实现创意，用创意丰富生活，使人们的网络生活变得更加丰富多彩。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">JooyeaTech</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">遵循开源社区互动提升产品的原则，不闭门造车。这也是开源软件的精髓所在。所以和</span><span lang=\\\"EN-US\\\">Jooyea Tech</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">在一起，即便是个人站长，也可以自信的说：“我不是一个人！”做永远的</span><span lang=\\\"EN-US\\\">Beta</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">版，</span><span lang=\\\"EN-US\\\">Jooyea Tech</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">正在、也会一直这样：通过与用户构建良好互动，倾听用户的意见和批评，吸取大众的智慧，来改善产品，形成产品发布</span><span lang=\\\"EN-US\\\">-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">用户使用</span><span lang=\\\"EN-US\\\">-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">用户反馈</span><span lang=\\\"EN-US\\\">-</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">产品改进的良性循环。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">Jooyea</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">的团队宗旨</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">致力于帮助在线企业平滑实现规模化。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">Jooyea</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">的服务口号</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">用我们领先的技术，服务于您的全球客户。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303975962');
INSERT INTO shop_help VALUES ('45', '7', '0', '常见问题', '<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站所售商品都是正品行货吗？有售后保修吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站所售商品都是正品行货，均自带机打发票。凭</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站发票，所有商品都可以享受生产厂家的全国联保服务。</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站将严格按照国家三包政策，针对所售商品履行保修、换货和退货的义务。您也可以到</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站任一分公司售后部享受售后服务。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：购买的商品能开发票？如果是公司购买，可以开增值税发票吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站所售商品都是正品行货，每张订单均自带中文机打的“商品专用发票”，此发票可用作单位报销凭证。发票会随包裹一同发出，发票金额含配送费金额。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">企业客户在提供《一般纳税人证书》、《营业执照》、《税务登记证》、《开户许可证》四类证件复印件后，可向</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站开取增值税发票，开好后，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站会以快递方式为您寄出。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：各种库存状态是什么意思？下单多久后可以发货？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：现货：库存有货，下单后会尽快发货，您可以立即下单；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">在途：商品正在内部配货，一般</span><span lang=\\\"EN-US\\\">1-2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">天有货，您可立即下单；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">预订：商品正在备货，一般下单后</span><span lang=\\\"EN-US\\\">2-20</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">天可发货，您可立即下单；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">无货：商品已售完，相应物流中心覆盖地区内的用户不能下单购买。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：无货商品什么时候能到货？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：无货商品的到货时间根据配货情况而不同，无法准确估计，但您可以使用“到货通知”功能，一旦商品有货，我们会通过电子邮件等方式通知您。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：下单后何时可以收到货？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：在商品有现货的情况下，下单后一般</span><span lang=\\\"EN-US\\\">24</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">小时内可收到货（郊区县配送时间可能会更长一些）；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">其它地区用户，将根据您的收货地址及所选择的配送方式而不同，一般到货时间在</span><span lang=\\\"EN-US\\\">1-7</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">天（极偏远地区配送时间可能会更长一些）；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果商品处于预订或在途状态，那么还应加上调配货时间。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：快递费是多少？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：凡选用“</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站快递”或“快递运输”的会员即可享受免运费优惠。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：在线支付支持哪些银行卡？支持大额支付吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：我们为您提供几乎全部银行的银行卡及信用卡在线支付，只要您开通了“网上支付”功能，即可进行在线支付，无需手续费，实时到帐，方便快捷。（如客户原因取消订单退款，则需要客户承担</span><span lang=\\\"EN-US\\\">1%</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">平台手续费）如您订单金额较大，可以使用快钱支付中的招行、工行、建行、农行、广发进行一次性大额支付（一万元以下）。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站购物支持信用卡分期付款吗？如何申请？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站目前支持中国银行、招商银行两家银行的信用卡分期付款，只要商品单价在</span><span lang=\\\"EN-US\\\">500</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">元以上，您即可点击“信用卡分期付款”按钮申请分期付款</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：上门提货、货到付款支持刷卡吗？周末可以自提吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站全部自提点均支持现金及刷卡支付，绝大部分货到付款地区支持现金及刷卡支付</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站自提点营业时间一律为：周一至周日，</span><span lang=\\\"EN-US\\\">09:00</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">－</span><span lang=\\\"EN-US\\\">19:00</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">（如遇法定假日，以商城新闻公告为准）。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：下单时可以指定送货时间吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：可以，您下单时可以选择“只工作日送货</span><span lang=\\\"EN-US\\\">(</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">双休日、假日不用送</span><span lang=\\\"EN-US\\\">)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">”、“工作日、双休日与假日均可送货”、“只双休日、假日送货</span><span lang=\\\"EN-US\\\">(</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">工作日不用送</span><span lang=\\\"EN-US\\\">)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">”等时间类型，并选择是否提前电话确认。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">另外，您还可以在订单备注里填写更具体的需求，我们会尽量满足您的要求。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：哪些地区支持货到付款？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站已在多个省市开通了货到付款</span><span lang=\\\"EN-US\\\">(</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">其它城市正陆续开通</span><span lang=\\\"EN-US\\\">)</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">，您可使用现金、移动</span><span lang=\\\"EN-US\\\">POS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">机当面付款收货</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：收货时发现问题可以拒收吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：在签收货物时如发现货物有损坏，请直接拒收退回我公司，相关人员将为您重新安排发货。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：如果我刚刚下单商品就降价了，能给我补偿吗？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站的商品价格随市场价格的波动每日都会有涨价、降价或者优惠等变化。如果下完订单后价格发生了变化，可到“我的</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站”自主申请价格保护</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：下单后，我能做什么？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：如果是在线支付方式，请您尽快完成付款，待付款被确认后我们会立即为您发货，</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如果选择自提或货到付款，您可以进入“我的</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站”，在“订单列表”中找到您的订单，然后可随时查看订单处理状态，做好收货或者上门自提的准备。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">在您成功购物后，您还可以发表商品评价，向其他用户分享商品使用心得。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：为什么我无法登陆商城？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：首先要检查您的用户名、密码是否正确，确认您的浏览器是否支持</span><span lang=\\\"EN-US\\\">COOKIE</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：产品如何保修？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站销售的商品都以商品说明中的保修承诺为准。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：订单得到确认后我该做什么？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：按照订单所提示的实际应汇款金额，汇款至该订单所在的公司账号内，汇款交易成功后，登陆“我的</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站”查看您的订单，在订单中的“汇款备注”中输入您的相关汇款信息</span><span lang=\\\"EN-US\\\">(</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">例如：汇入行、汇入我司银行账号的实际金额、汇款日期和汇入账号、订单号等），等待我司财务人员确认汇款。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：汇款确认后多久能够将货物发出？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：正常情况下会在工作时间</span><span lang=\\\"EN-US\\\">24-48</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">小时内可以将您的货物发出。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：非商品自身质量问题是否可以退货？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：部分商品在不影响二次销售的情况下，加收一定的退货手续费，是可以办理退货的，详情请查看“退换货政策”</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：在哪能填写汇款信息？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：首先要在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站首页的“会员登录”中输入用户名和密码进行登陆，登陆后点击“我的</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站”，点击左侧的“订单中心”，即可查看到您所有的订单，点击汇款订单后面的“查看”，打开后下拉页面，有“付款信息未完成</span><span lang=\\\"EN-US\\\">,</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">请您尽快填写</span><span lang=\\\"EN-US\\\">.</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">”一项，直接在里面填写汇款信息，然后提交即可，相关人员在查收到您的汇款信息后会进行核实，无异议的汇款会在三个工作小时内确认完毕，如有问题，相关人员会电话与您联系。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：怎样咨询商品的详细信息？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：请您在该商品页面下方“购买咨询”处进行提问，相关商品管理员会为您回复。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：在哪进行在线支付？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站首页的“会员登录”中输入用户名和密码进行登陆，登陆后点击“我的</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站”，进入后点击左侧的“在线支付”，点击进入后就可以进行在线支付了。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：工作时间？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：客服中心受理热线电话及订单处理时间为</span><span lang=\\\"EN-US\\\">7x24</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">小时全天候服务；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">自提接待时间为周一至周日</span><span lang=\\\"EN-US\\\">9</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：</span><span lang=\\\"EN-US\\\">00-19</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">：</span><span lang=\\\"EN-US\\\">00</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注：如遇国家法定节假日，则以</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站新闻发布放假时间为准，请大家届时关注。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：如何将退款打回银行卡？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：在投诉中心留言相关信息，如银行卡的开户行</span><span lang=\\\"EN-US\\\">(</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">详细到支行）、开户姓名、卡号，相关人员会为您处理，退款周期视您的货物是否发出而定，如果货物未出库发出，退款会在三个工作日内完成；如果货物已发出，则需货物返回我司物流中心后为您办理退款。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：商品包装问题？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：我司所发送商品均由专人进行打包，商品在未签收前都由我司负责，如在收到商品时发现包装有破损或是其它方面问题，请直接致电我司客服</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">，客服人员会帮您解决。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：怎样申请高校代理送货？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站首页的“会员登录”中输入用户名和密码进行登陆，登陆后点击“我的</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站”，进入后点击左侧的“个人资料”，在“所在学校”一栏中选择您所在的院校，</span><span lang=\\\"EN-US\\\">(</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">如没有您所在的院校，则说明您的学校暂未开通高校代理，您将无法选择高校代理送货），然后点击底部的“修改”，我司相关人员在收到申请后的</span><span lang=\\\"EN-US\\\">24</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">个工作小时内进行审核，审核通过后，您下单时就可以选择高校代理送货了，高校代理订单的运费按照钻石（双钻）会员普通快递运费标准收取，具体请您参照帮助中心中快递运输页面的“普通快递收取标准一览表”，货物由代理直接送达，货款由高校代理收取。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：拍卖成功后如何转成订单？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站首页的“会员登录”中输入用户名和密码进行登陆，登陆后点击“我的</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站”，进入后点击左侧的“我的拍卖”，在“操作”处有一个“转成订单”按钮，点击该按钮就可以转成订单了，在左侧“订单中心”处可查询到该订单，和商品订单一样，您可以直接进行支付。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：订单付款后，如果长时间未收到货，我是否可以申请办理退款？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：非</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站快递覆盖区域内，由第三方快递公司负责直接送达的订单，如圆通快递，自发货时间算起超过</span><span lang=\\\"EN-US\\\">10</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">天仍未收到货或收货地址超出第三方快递覆盖的区域，由第三方快递转邮政，如圆通转</span><span lang=\\\"EN-US\\\">EMS</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">等，自发货时间算起超过</span><span lang=\\\"EN-US\\\">20</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">天仍未收到货，可致电客服中心，由客服人员为您申请办理退款事宜。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">问：如果我有问题或建议是否可以通过邮件向你们反馈？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">答：可以。</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站受理建议或投诉的邮箱是：</span><span lang=\\\"EN-US\\\">service@iwebshop.com</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303975993');
INSERT INTO shop_help VALUES ('46', '7', '0', '找回密码', '<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">忘记了帐户密码？</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">不用担心，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站提供找回密码服务，您点击</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family: Calibri\\\">忘记密码</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">按照系统提示操作即可。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">操作步骤详解如下：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站登陆页面，点击</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">忘记密码</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、按照提示，填写您在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站的注册邮箱及验证码</span><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、系统提示成功发送“密码重置”邮件，若您长时间未收到，可以点击“重新发送”</span><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、登陆您的个人邮箱，找到“</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站新密码重置确认信</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站新密码重置确认信”点击“设置新密码”</span><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、按照系统提示，设置新密码即可</span><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">温馨提示：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">为了确保顾客注册信息的安全，</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站只提供网上找回密码服务，若您忘记</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站注册邮箱或是忘记注册邮箱的登陆密码，请</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">注册新用户</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303976019');
INSERT INTO shop_help VALUES ('47', '7', '0', '退订邮件/短信', '<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站保留通过邮件和短信的形式，对本网站注册、购物用户发送订单信息、促销活动等告知服务的权利。如果您在</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:calibri;mso-hansi-font-family:Calibri;\\\">网站注册、购物，表明您已默示接受此项服务。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">若您不希望接收</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站的邮件，请在邮件下方输入您的</span><span lang=\\\"EN-US\\\">E-mail</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">地址自助完成退阅；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">若您不希望接收</span><span lang=\\\"EN-US\\\">iWebShop</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">网站的短信，请提供您的手机号码</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family: Calibri\\\">联系客服</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">处理。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303976040');
INSERT INTO shop_help VALUES ('48', '7', '0', '联系客服', '<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮件联系</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">Kefu@jooyea.net</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">电话联系</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">客服中心电话热线工作时间：</span><span lang=\\\"EN-US\\\">24</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">小时全天候</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">客服热线：</span><span lang=\\\"EN-US\\\">*****</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">客服传真：</span><span lang=\\\"EN-US\\\">*****</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮局汇款地址：</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">信箱</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family: Calibri\\\">邮编：</span><span lang=\\\"EN-US\\\">*****</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">邮政信箱地址：</span><span lang=\\\"EN-US\\\">*****</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">分箱</span> <span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family: Calibri\\\">邮编：</span><span lang=\\\"EN-US\\\">*****</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">在线问答</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\">iWebIM</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">在线客服</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303976070');
INSERT INTO shop_help VALUES ('49', '7', '0', '诚聘英才', '<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">测试工程师</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">岗位职责：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp; </span>1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、负责公司互联网产品和项目的测试工作，搭建测试环境，确保产品和项目质量；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp; </span>2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、编写测试计划，测试大纲和测试用例；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp; </span>3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、对测试过程中发现的问题进行跟踪分析和报告并推动问题及时合理地解决；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp; </span>4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、按照测试计划编写测试脚本和测试程序对产品进行功能、强度、性能测试；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp; </span>5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、通过对产品的测试，保证产品质量达到指定质量目标，并能够提出进一步改进的要求并依照执行。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">岗位要求：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp; </span>1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、相关专业专科以上学历，至少</span><span lang=\\\"EN-US\\\">1</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">年以上测试经验；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp; </span>2</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、熟悉测试流程，测试用例与测试计划的编写；熟悉各种</span><span lang=\\\"EN-US\\\">Bug</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">管理和测试管理工具；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp; </span>3</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、较强的发现问题，分析问题的能力；较强的语言表达和文档撰写能力，能根据产品需求编写测试用例；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp; </span>4</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、工作责任心强，细致，耐心；</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><span style=\\\"mso-spacerun:yes;\\\">&nbsp;&nbsp;&nbsp; </span>5</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">、能承受较大的工作压力。</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">联系人：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">联系方式：</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303976088');
INSERT INTO shop_help VALUES ('50', '7', '0', '友情链接', '<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">申请友链</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">链接显示的顺序以提交的先后顺序为准</span><span lang=\\\"EN-US\\\">.</span></p>\r\n<p class=\\\"MsoNormal\\\"><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">申请链接请将你的网站名称</span><span lang=\\\"EN-US\\\">\\\\logo\\\\</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">链接地址</span><span lang=\\\"EN-US\\\">\\\\</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">联系人等信息发至信箱：</span><span lang=\\\"EN-US\\\">admin@iwebshop.com,</span><span style=\\\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;\\\">经我们网站管理员审核后再更新上线</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"EN-US\\\"><o:p>&nbsp;</o:p></span></p>', '1303976108');
INSERT INTO shop_help VALUES ('52', '5', '0', '售后服务', '<div style=\"display:block;\" class=\"mc tabcon hide\">\r\n                    本产品全国联保，享受三包服务，质保期为：十五天质保<br />\r\n				</div>\r\n				\r\n				\r\n				<div id=\"promises\">\r\n					<strong>Iweb商城服务承诺：</strong><br />\r\n<strong>Iweb</strong>商城向您保证所售商品均为正品行货，自带机打发票，与商品一起寄送。凭质保证书及<strong>Iweb</strong>商城发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。<br />\r\n<strong>Iweb</strong>商城还为您提供具有竞争力的商品价格和免运费政策，请您放心购买！ \r\n				</div>\r\n				<div id=\"state\"><strong>声明:</strong>因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！</div>', '1305696881');
INSERT INTO shop_help VALUES ('53', '4', '0', '支付帮助', 'Iweb商城为您提供以下7种支付方式<br />\r\n货到付款： &nbsp;&nbsp;&nbsp; <br />\r\n<br />\r\n我们在以下省市开通了货到付款(其他城市正陆续开通)，您可使用现金、移动POS机（部分地区支持刷卡）当面付款收货，点击城市名可查看详细配送范围及运费：<br />\r\n北京&nbsp;&nbsp; 上海&nbsp;&nbsp; 广州&nbsp;&nbsp; 广东（不含广州）&nbsp;&nbsp; 天津&nbsp;&nbsp; 杭州&nbsp;&nbsp; 山东&nbsp;&nbsp; 厦门&nbsp;&nbsp; 武汉&nbsp;&nbsp; 成都&nbsp;&nbsp; 深圳&nbsp;&nbsp; 西安&nbsp;&nbsp; 宁波&nbsp;&nbsp; 东莞&nbsp;&nbsp; 沈阳&nbsp;&nbsp; 福州&nbsp;&nbsp; 重庆&nbsp;&nbsp; 温州&nbsp;&nbsp; 长沙&nbsp;&nbsp; 哈尔滨&nbsp;&nbsp; 佛山&nbsp;&nbsp; 郑州&nbsp;&nbsp; 嘉兴&nbsp;&nbsp; 廊坊&nbsp;&nbsp; 绍兴&nbsp;&nbsp; 金华&nbsp;&nbsp; 珠海&nbsp;&nbsp; 太原&nbsp;&nbsp; 大连&nbsp;&nbsp; 长春&nbsp;&nbsp; 南昌&nbsp;&nbsp; 合肥&nbsp;&nbsp; 昆明&nbsp;&nbsp; 石家庄&nbsp;&nbsp; 浙江&nbsp;&nbsp; 贵州&nbsp;&nbsp; 兰州&nbsp;&nbsp; 南宁&nbsp;&nbsp; 呼和浩特&nbsp;&nbsp; 江苏&nbsp;&nbsp; 四川&nbsp;&nbsp; 惠州&nbsp;&nbsp; 烟台<br />\r\n在线支付： &nbsp;&nbsp;&nbsp; <br />\r\n<br />\r\n我们为您提供几乎全部银行的银行卡及信用卡在线支付，只要您开通了\"网上支付\"功能，即可进行在线支付，无需手续费，实时到帐，方便快捷，支付限额说明&gt;&gt;<br />\r\n<br />\r\n您还可以使用以下支付平台进行在线支付及帐户余额付款：<br />\r\n来Iweb自提： &nbsp;&nbsp;&nbsp; <br />\r\n<br />\r\n我们在以下城市开通了自提点(其他城市正陆续开通)，您可就近选择自提点当面付款提货，无需支付运费，点击城市名可查看详细地点及公交线路：<br />\r\n北京&nbsp;&nbsp; 上海&nbsp;&nbsp; 广州&nbsp;&nbsp; 深圳&nbsp;&nbsp; 东莞&nbsp;&nbsp; 佛山&nbsp;&nbsp; 珠海&nbsp;&nbsp; 惠州&nbsp;&nbsp; 天津&nbsp;&nbsp; 苏州&nbsp;&nbsp; 无锡&nbsp;&nbsp; 南京&nbsp;&nbsp; 宿迁&nbsp;&nbsp; 昆山&nbsp;&nbsp; 南通&nbsp;&nbsp; 常州&nbsp;&nbsp; 常熟&nbsp;&nbsp; 杭州&nbsp;&nbsp; 宁波&nbsp;&nbsp; 温州&nbsp;&nbsp; 嘉兴&nbsp;&nbsp; 绍兴&nbsp;&nbsp; 金华&nbsp;&nbsp; 济南&nbsp;&nbsp; 青岛&nbsp;&nbsp; 烟台&nbsp;&nbsp; 厦门&nbsp;&nbsp; 福州&nbsp;&nbsp; 武汉&nbsp;&nbsp; 成都&nbsp;&nbsp; 绵阳&nbsp;&nbsp; 西安&nbsp;&nbsp; 沈阳&nbsp;&nbsp; 大连&nbsp;&nbsp; 重庆&nbsp;&nbsp; 长沙&nbsp;&nbsp; 哈尔滨&nbsp;&nbsp; 郑州&nbsp;&nbsp; 廊坊&nbsp;&nbsp; 太原&nbsp;&nbsp; 长春&nbsp;&nbsp; 南昌&nbsp;&nbsp; 合肥&nbsp;&nbsp; 昆明&nbsp;&nbsp; 石家庄&nbsp;&nbsp; 贵阳&nbsp;&nbsp; 兰州&nbsp;&nbsp; 南宁&nbsp;&nbsp; 呼和浩特<br />\r\n分期付款： &nbsp;&nbsp;&nbsp; <br />\r\n<br />\r\n单个商品价格在500元以上，可使用中国银行、招商银行发行的信用卡申请分期付款，支持3期、6期、12期付款，查看详细说明&gt;&gt;<br />\r\n公司转帐： &nbsp;&nbsp;&nbsp; <br />\r\n<br />\r\n您可以向Iweb公司的三个公司帐户汇款，到帐时间一般为款汇出后的1-5个工作日，查看公司帐户&gt;&gt;<br />\r\n邮局汇款： &nbsp;&nbsp;&nbsp; 您可通过邮局向Iweb商城付款，到帐时间一般为款汇出后的1-5个工作日，查看汇款地址&gt;&gt;<br />', '1305697182');

-- ----------------------------
-- Table structure for `shop_help_category`
-- ----------------------------
DROP TABLE IF EXISTS `shop_help_category`;
CREATE TABLE `shop_help_category` (
  `id` smallint(6) NOT NULL auto_increment,
  `name` varchar(10) NOT NULL COMMENT '标题',
  `sort` smallint(6) NOT NULL COMMENT '顺序',
  `position_left` tinyint(4) NOT NULL COMMENT '是否在帮助内容、列表页面的左侧显示',
  `position_foot` tinyint(4) NOT NULL COMMENT '是否在整站页面下方显示',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='帮助分类';

-- ----------------------------
-- Records of shop_help_category
-- ----------------------------
INSERT INTO shop_help_category VALUES ('4', '支付帮助', '2', '0', '1');
INSERT INTO shop_help_category VALUES ('3', '购物指南', '1', '0', '1');
INSERT INTO shop_help_category VALUES ('5', '售后服务', '4', '1', '1');
INSERT INTO shop_help_category VALUES ('6', '配送帮助', '3', '0', '1');
INSERT INTO shop_help_category VALUES ('7', '帮助信息', '5', '0', '1');

-- ----------------------------
-- Table structure for `shop_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `shop_invoice`;
CREATE TABLE `shop_invoice` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(11) NOT NULL COMMENT '抬头 单位名称/个人',
  `order_id` int(11) NOT NULL COMMENT '订单号',
  `time` datetime default NULL COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发票记录表';

-- ----------------------------
-- Records of shop_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `shop_keyword`;
CREATE TABLE `shop_keyword` (
  `word` varchar(15) NOT NULL COMMENT '关键词',
  `goods_nums` int(11) NOT NULL default '1' COMMENT '产品数量',
  `hot` tinyint(1) NOT NULL default '0' COMMENT '是否为热门',
  `order` int(5) NOT NULL default '99' COMMENT '关键词排序',
  PRIMARY KEY  (`word`),
  KEY `hot` (`hot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关键词';

-- ----------------------------
-- Records of shop_keyword
-- ----------------------------
INSERT INTO shop_keyword VALUES ('ipad', '1', '1', '99');
INSERT INTO shop_keyword VALUES ('佳能', '2', '1', '99');
INSERT INTO shop_keyword VALUES ('iphone', '1', '1', '99');
INSERT INTO shop_keyword VALUES ('手机', '1', '1', '99');
INSERT INTO shop_keyword VALUES ('索尼', '2', '1', '99');
INSERT INTO shop_keyword VALUES ('相机', '4', '1', '99');
INSERT INTO shop_keyword VALUES ('Lee', '2', '1', '99');
INSERT INTO shop_keyword VALUES ('灯', '2', '1', '99');
INSERT INTO shop_keyword VALUES ('牛仔裤', '2', '1', '99');
INSERT INTO shop_keyword VALUES ('香水', '3', '1', '99');
INSERT INTO shop_keyword VALUES ('T恤', '3', '1', '99');
INSERT INTO shop_keyword VALUES ('杰克琼斯', '3', '1', '99');
INSERT INTO shop_keyword VALUES ('衬衫', '4', '1', '99');
INSERT INTO shop_keyword VALUES ('苹果', '2', '1', '99');
INSERT INTO shop_keyword VALUES ('单反', '2', '1', '99');
INSERT INTO shop_keyword VALUES ('笔记本', '2', '1', '99');
INSERT INTO shop_keyword VALUES ('连衣裙', '3', '1', '99');
INSERT INTO shop_keyword VALUES ('七匹狼', '1', '1', '99');

-- ----------------------------
-- Table structure for `shop_log_error`
-- ----------------------------
DROP TABLE IF EXISTS `shop_log_error`;
CREATE TABLE `shop_log_error` (
  `id` int(11) NOT NULL auto_increment,
  `file` varchar(200) default NULL COMMENT '文件',
  `line` smallint(5) unsigned NOT NULL COMMENT '出错文件行数',
  `content` varchar(500) default NULL COMMENT '内容',
  `datetime` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='错误日志表';

-- ----------------------------
-- Records of shop_log_error
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_log_operation`
-- ----------------------------
DROP TABLE IF EXISTS `shop_log_operation`;
CREATE TABLE `shop_log_operation` (
  `id` int(11) NOT NULL auto_increment,
  `author` varchar(80) default NULL COMMENT '操作人员',
  `action` varchar(200) default NULL COMMENT '动作',
  `content` text COMMENT '内容',
  `datetime` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='日志操作记录';

-- ----------------------------
-- Records of shop_log_operation
-- ----------------------------
INSERT INTO shop_log_operation VALUES ('1', '管理员:admin', '添加了配送方式', '添加的配送方式为：邮政', '2012-04-18 20:07:31');
INSERT INTO shop_log_operation VALUES ('2', '管理员:admin', '添加了配送方式', '添加的配送方式为：申通', '2012-04-18 20:07:51');

-- ----------------------------
-- Table structure for `shop_log_sql`
-- ----------------------------
DROP TABLE IF EXISTS `shop_log_sql`;
CREATE TABLE `shop_log_sql` (
  `id` int(11) NOT NULL auto_increment,
  `content` varchar(500) NOT NULL COMMENT '执行的SQL语句',
  `runtime` float unsigned NOT NULL COMMENT '语句执行时间(秒)',
  `datetime` datetime NOT NULL COMMENT '发生的时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SQL日志记录';

-- ----------------------------
-- Records of shop_log_sql
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_member`
-- ----------------------------
DROP TABLE IF EXISTS `shop_member`;
CREATE TABLE `shop_member` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `true_name` varchar(50) default NULL COMMENT '真实姓名',
  `telephone` varchar(50) default NULL COMMENT '联系电话',
  `mobile` varchar(20) default NULL COMMENT '手机',
  `area` varchar(255) default NULL COMMENT '地区',
  `contact_addr` varchar(250) default NULL COMMENT '联系地址',
  `qq` varchar(15) default NULL COMMENT 'QQ',
  `msn` varchar(250) default NULL COMMENT 'MSN',
  `sex` tinyint(1) default '1' COMMENT '性别1男2女',
  `birthday` date default NULL COMMENT '生日',
  `group_id` int(6) NOT NULL default '0' COMMENT '分组',
  `exp` int(11) NOT NULL default '0' COMMENT '经验值',
  `point` int(11) NOT NULL default '0' COMMENT '积分',
  `message_ids` text COMMENT '消息ID',
  `time` datetime default NULL COMMENT '注册日期时间',
  `zip` varchar(10) default NULL COMMENT '邮政编码',
  `status` tinyint(1) default '1' COMMENT '用户状态 1正常状态 2 删除至回收站 3锁定',
  `prop` text COMMENT '用户拥有的工具',
  `balance` float(10,2) NOT NULL default '0.00' COMMENT '用户余额',
  `last_login` datetime default NULL COMMENT '最后一次登录时间',
  `custom` varchar(255) default NULL COMMENT '用户习惯方式,配送和支付方式等信息',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of shop_member
-- ----------------------------
INSERT INTO shop_member VALUES ('1', null, null, null, null, null, null, null, '1', null, '0', '0', '0', null, '2012-04-18 20:05:05', null, '1', null, '0.00', null, 'a:2:{s:7:\"payment\";i:1;s:8:\"delivery\";i:2;}');

-- ----------------------------
-- Table structure for `shop_merch_ship_info`
-- ----------------------------
DROP TABLE IF EXISTS `shop_merch_ship_info`;
CREATE TABLE `shop_merch_ship_info` (
  `id` int(11) NOT NULL auto_increment,
  `ship_name` varchar(255) default NULL COMMENT '发货点名称',
  `ship_user_name` varchar(255) default NULL COMMENT '发货人姓名',
  `sex` tinyint(1) default NULL COMMENT '性别',
  `country` int(11) default NULL COMMENT '国id',
  `province` int(11) default NULL COMMENT '省id',
  `city` int(11) default NULL COMMENT '市id',
  `area` int(11) default NULL COMMENT '地区id',
  `postcode` int(6) default NULL COMMENT '邮编',
  `address` varchar(255) default NULL COMMENT '具体地址',
  `mobile` varchar(20) default NULL COMMENT '手机',
  `telphone` varchar(20) default NULL COMMENT '电话',
  `is_default` tinyint(1) default NULL COMMENT '1为默认地址，0则不是',
  `note` text COMMENT '备注',
  `addtime` datetime default NULL COMMENT '保存时间',
  `is_del` tinyint(1) default NULL COMMENT '0为删除，1为显示',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家发货点信息';

-- ----------------------------
-- Records of shop_merch_ship_info
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_message`
-- ----------------------------
DROP TABLE IF EXISTS `shop_message`;
CREATE TABLE `shop_message` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `time` datetime default NULL COMMENT '发送时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='站内消息';

-- ----------------------------
-- Records of shop_message
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_model`
-- ----------------------------
DROP TABLE IF EXISTS `shop_model`;
CREATE TABLE `shop_model` (
  `id` int(11) NOT NULL auto_increment COMMENT '模型ID',
  `name` varchar(50) NOT NULL COMMENT '模型名称',
  `spec_ids` text COMMENT '序列化方式存储规格ID及展现方式',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='模型表';

-- ----------------------------
-- Records of shop_model
-- ----------------------------
INSERT INTO shop_model VALUES ('185', '电影/电视剧', 'a:0:{}');
INSERT INTO shop_model VALUES ('182', '图书', 'a:0:{}');
INSERT INTO shop_model VALUES ('183', '吊灯、花灯', 'a:0:{}');
INSERT INTO shop_model VALUES ('99', '电脑模型', 'a:0:{}');
INSERT INTO shop_model VALUES ('93', '手机模型', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"60\";s:4:\"name\";s:6:\"颜色\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:2:\"11\";}i:1;a:4:{s:2:\"id\";s:2:\"61\";s:4:\"name\";s:12:\"iphone版本\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:0:\"\";}}');
INSERT INTO shop_model VALUES ('119', '惠普笔记本', 'a:3:{i:0;a:4:{s:2:\"id\";s:2:\"53\";s:4:\"name\";s:7:\"规格1\";s:9:\"show_type\";s:1:\"2\";s:4:\"note\";s:16:\"规格1的备注\";}i:1;a:4:{s:2:\"id\";s:2:\"55\";s:4:\"name\";s:3:\"asd\";s:9:\"show_type\";s:1:\"2\";s:4:\"note\";s:3:\"asd\";}i:2;a:4:{s:2:\"id\";s:2:\"55\";s:4:\"name\";s:3:\"asd\";s:9:\"show_type\";s:1:\"2\";s:4:\"note\";s:3:\"asd\";}}');
INSERT INTO shop_model VALUES ('180', '衬衫', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"74\";s:4:\"name\";s:6:\"颜色\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:6:\"女装\";}i:1;a:4:{s:2:\"id\";s:2:\"75\";s:4:\"name\";s:6:\"尺码\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:6:\"女装\";}}');
INSERT INTO shop_model VALUES ('175', '香水', 'a:0:{}');
INSERT INTO shop_model VALUES ('181', '衬衫（男）', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:4:\"name\";s:6:\"颜色\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:6:\"通用\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:4:\"name\";s:6:\"尺码\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:6:\"上衣\";}}');
INSERT INTO shop_model VALUES ('168', '护肤/护理', 'a:0:{}');
INSERT INTO shop_model VALUES ('146', '服饰', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"60\";s:4:\"name\";s:6:\"颜色\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:2:\"11\";}i:1;a:4:{s:2:\"id\";s:2:\"73\";s:4:\"name\";s:6:\"尺寸\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:0:\"\";}}');
INSERT INTO shop_model VALUES ('147', '上装', 'a:0:{}');
INSERT INTO shop_model VALUES ('148', '下装', 'a:0:{}');
INSERT INTO shop_model VALUES ('169', 'T恤', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:4:\"name\";s:6:\"颜色\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:6:\"通用\";}i:1;a:4:{s:2:\"id\";s:2:\"78\";s:4:\"name\";s:6:\"尺码\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:6:\"上衣\";}}');
INSERT INTO shop_model VALUES ('184', '音乐', 'a:0:{}');
INSERT INTO shop_model VALUES ('128', '笔记本', 'a:1:{i:0;a:4:{s:2:\"id\";s:2:\"59\";s:4:\"name\";s:3:\"CPU\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:3:\"CPU\";}}');
INSERT INTO shop_model VALUES ('151', '连衣裙', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"74\";s:4:\"name\";s:13:\"女装_颜色\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:0:\"\";}i:1;a:4:{s:2:\"id\";s:2:\"75\";s:4:\"name\";s:13:\"女装_尺码\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:0:\"\";}}');
INSERT INTO shop_model VALUES ('152', '裤子', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"79\";s:4:\"name\";s:6:\"颜色\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:6:\"裤子\";}i:1;a:4:{s:2:\"id\";s:2:\"77\";s:4:\"name\";s:6:\"尺码\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:6:\"裤子\";}}');
INSERT INTO shop_model VALUES ('153', '通用', 'a:0:{}');
INSERT INTO shop_model VALUES ('186', '吸顶灯', 'a:0:{}');
INSERT INTO shop_model VALUES ('187', '窗帘', 'a:0:{}');
INSERT INTO shop_model VALUES ('154', '手机', 'a:1:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:4:\"name\";s:6:\"颜色\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:6:\"通用\";}}');
INSERT INTO shop_model VALUES ('155', '相机', 'a:2:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:4:\"name\";s:6:\"颜色\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:6:\"通用\";}i:1;a:4:{s:2:\"id\";s:2:\"82\";s:4:\"name\";s:6:\"套餐\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:6:\"相机\";}}');
INSERT INTO shop_model VALUES ('156', '电脑', 'a:1:{i:0;a:4:{s:2:\"id\";s:2:\"76\";s:4:\"name\";s:6:\"颜色\";s:9:\"show_type\";s:1:\"1\";s:4:\"note\";s:6:\"通用\";}}');

-- ----------------------------
-- Table structure for `shop_msg_template`
-- ----------------------------
DROP TABLE IF EXISTS `shop_msg_template`;
CREATE TABLE `shop_msg_template` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL COMMENT '模板名称',
  `title` varchar(255) default NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '模板内容',
  `variable` varchar(255) default NULL COMMENT '模板中的变量标签',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='消息模板表';

-- ----------------------------
-- Records of shop_msg_template
-- ----------------------------
INSERT INTO shop_msg_template VALUES ('1', '到货通知', '最近到货通知', '<p>dear：{$user_name}你关注的商品：{$goods_name}已到货，由于此商品近期销售火爆，请及时购买！</p>\n<p>-------IWeb商场</p>', '用户名 {$user_name} 商品名 {$goods_name}');
INSERT INTO shop_msg_template VALUES ('2', '网站订阅', '2011年1月最新上架商品', '2011年1月最新上架商品', null);
INSERT INTO shop_msg_template VALUES ('3', '找回密码', 'IWeb密码找回', '<p>dear：{$user_name}：</p><br /><p>您的新密码为{$password},请您尽快登陆用户中心，修改为您常用的密码！</p><br /><p>-------IWeb商场</p><br />', '用户名 {$user_name} 新密码 {$password}');

-- ----------------------------
-- Table structure for `shop_navigate`
-- ----------------------------
DROP TABLE IF EXISTS `shop_navigate`;
CREATE TABLE `shop_navigate` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `floor` int(11) default NULL COMMENT '层次',
  `order` int(11) default NULL COMMENT '顺序',
  `url` varchar(255) default NULL COMMENT '链接',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航栏表';

-- ----------------------------
-- Records of shop_navigate
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_notify_registry`
-- ----------------------------
DROP TABLE IF EXISTS `shop_notify_registry`;
CREATE TABLE `shop_notify_registry` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) default NULL COMMENT '商品ID',
  `user_id` int(11) default NULL COMMENT '用户ID',
  `email` varchar(255) default NULL COMMENT 'emaill',
  `mobile` varchar(20) default NULL COMMENT '手机',
  `register_time` datetime default NULL COMMENT '登记时间',
  `notify_time` datetime default NULL COMMENT '通知时间',
  `notify_status` tinyint(1) default '0' COMMENT '0未通知1已通知',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='到货通知表';

-- ----------------------------
-- Records of shop_notify_registry
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_oauth`
-- ----------------------------
DROP TABLE IF EXISTS `shop_oauth`;
CREATE TABLE `shop_oauth` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL COMMENT '名称',
  `config` text COMMENT '配置信息',
  `file` varchar(80) NOT NULL COMMENT '接口文件名称',
  `description` varchar(80) default NULL COMMENT '描述',
  `is_close` tinyint(1) NOT NULL default '0' COMMENT '是否关闭;0开启,1关闭',
  `logo` varchar(80) default NULL COMMENT 'logo',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='认证方案';

-- ----------------------------
-- Records of shop_oauth
-- ----------------------------
INSERT INTO shop_oauth VALUES ('1', '人人网', '', 'renren', '人人网开放平台', '1', 'plugins/oauth/images/renren.gif');
INSERT INTO shop_oauth VALUES ('2', 'QQ', '', 'qq', '腾讯开发平台', '1', 'plugins/oauth/images/qq.gif');
INSERT INTO shop_oauth VALUES ('3', '新浪', '', 'sina', '新浪微博的开发平台', '1', 'plugins/oauth/images/sina.gif');
INSERT INTO shop_oauth VALUES ('4', '淘宝', '', 'taobao', '淘宝的开放平台', '1', 'plugins/oauth/images/taobao.gif');

-- ----------------------------
-- Table structure for `shop_oauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `shop_oauth_user`;
CREATE TABLE `shop_oauth_user` (
  `id` int(11) NOT NULL auto_increment,
  `oauth_user_id` varchar(80) NOT NULL COMMENT '第三方平台的用户唯一标识',
  `oauth_id` smallint(5) NOT NULL COMMENT '第三方平台id',
  `user_id` int(11) NOT NULL COMMENT '系统内部的用户id',
  `datetime` datetime NOT NULL COMMENT '绑定时间',
  PRIMARY KEY  (`id`),
  KEY `index1` (`oauth_user_id`,`oauth_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='oauth开发平台绑定用户表';

-- ----------------------------
-- Records of shop_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_online_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `shop_online_recharge`;
CREATE TABLE `shop_online_recharge` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `recharge_no` varchar(20) NOT NULL COMMENT '充值单号',
  `account` float(10,2) NOT NULL default '0.00' COMMENT '充值金额',
  `time` datetime NOT NULL COMMENT '时间',
  `payment_name` varchar(80) NOT NULL COMMENT '充值方式名称',
  `status` tinyint(1) NOT NULL default '0' COMMENT '充值状态 0:未成功 1:充值成功',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线充值表';

-- ----------------------------
-- Records of shop_online_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_order`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `id` int(11) NOT NULL auto_increment,
  `order_no` varchar(20) default NULL COMMENT '订单号',
  `user_id` int(11) default NULL COMMENT '用户ID',
  `accept_name` varchar(20) default NULL COMMENT '收货人姓名',
  `pay_code` varchar(255) default NULL COMMENT '支付账号',
  `pay_type` int(11) default NULL COMMENT '支付类型,0表示货到付款',
  `distribution` int(11) default NULL COMMENT '配送类型',
  `status` tinyint(1) default NULL COMMENT '订单状态1:生成订单,2：确认订单,3取消订单,4作废订单,5完成订单',
  `pay_status` tinyint(1) default NULL COMMENT '支付状态0：未支付，1：已支付，2：退款，3：申请退款',
  `distribution_status` tinyint(1) default NULL COMMENT '配送状态0：未发送，1：已发送，2：换货，3：申请换货',
  `postcode` varchar(6) default NULL COMMENT '邮编',
  `telphone` varchar(20) default NULL COMMENT '联系电话',
  `country` int(11) default NULL COMMENT '国ID',
  `province` int(11) default NULL COMMENT '省ID',
  `city` int(11) default NULL COMMENT '市ID',
  `area` int(11) default NULL COMMENT '区ID',
  `address` varchar(250) default NULL COMMENT '收货地址',
  `mobile` varchar(20) default NULL COMMENT '手机',
  `payable_amount` float(10,2) default NULL COMMENT '应付商品总金额',
  `real_amount` float(10,2) NOT NULL default '0.00' COMMENT '实付商品总金额',
  `payable_freight` float(10,2) NOT NULL default '0.00' COMMENT '总运费金额',
  `real_freight` float(10,2) NOT NULL default '0.00' COMMENT '实付运费',
  `pay_time` datetime default NULL COMMENT '付款时间',
  `send_time` datetime default NULL COMMENT '发货时间',
  `create_time` datetime default NULL COMMENT '下单时间',
  `completion_time` datetime default NULL COMMENT '订单完成时间',
  `invoice` tinyint(1) NOT NULL default '0' COMMENT '发票：0不索要1索要',
  `postscript` varchar(255) default NULL COMMENT '用户附言',
  `note` text COMMENT '管理员备注',
  `if_del` tinyint(1) default '0' COMMENT '是否删除1为删除',
  `insured` float(10,2) NOT NULL default '0.00' COMMENT '保价',
  `if_insured` tinyint(1) default '0' COMMENT '是否保价0:不保价，1保价',
  `pay_fee` float(10,2) NOT NULL default '0.00' COMMENT '支付手续费',
  `invoice_title` varchar(100) default NULL COMMENT '发票抬头',
  `taxes` float(10,2) NOT NULL default '0.00' COMMENT '税金',
  `promotions` float(10,2) NOT NULL default '0.00' COMMENT '促销优惠金额',
  `discount` float(10,2) NOT NULL default '0.00' COMMENT '订单折扣或涨价',
  `order_amount` float(10,2) NOT NULL default '0.00' COMMENT '订单总金额',
  `if_print` varchar(255) NOT NULL default '0' COMMENT '是否打印',
  `prop` varchar(255) default NULL COMMENT '使用的道具id',
  `accept_time` varchar(80) default NULL COMMENT '用户收货时间',
  `exp` int(5) unsigned NOT NULL default '0' COMMENT '增加的经验',
  `point` int(5) unsigned NOT NULL default '0' COMMENT '增加的积分',
  `type` tinyint(1) unsigned NOT NULL default '0' COMMENT '0普通订单,1团购订单,2限时抢购',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of shop_order
-- ----------------------------
INSERT INTO shop_order VALUES ('1', '20120418200813364633', '1', 'zhangsan', null, '1', '2', '1', '0', '0', '323232', '23232332', null, '1573', '1591', '1594', 'diqu', '15358062815', '220.00', '220.00', '10.00', '10.00', null, null, '2012-04-18 20:08:13', null, '0', '', null, '0', '0.00', '0', '0.00', '', '0.00', '0.00', '0.00', '230.00', '0', '', '任意', '0', '10', '0');

-- ----------------------------
-- Table structure for `shop_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_goods`;
CREATE TABLE `shop_order_goods` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL COMMENT '订单ID',
  `goods_id` int(11) default NULL COMMENT '商品ID',
  `product_id` int(11) default NULL COMMENT '货品ID',
  `goods_price` float(10,2) NOT NULL default '0.00' COMMENT '商品价格',
  `real_price` float(10,2) NOT NULL default '0.00' COMMENT '实付金额',
  `goods_nums` int(11) NOT NULL default '1' COMMENT '商品数量',
  `goods_weight` float NOT NULL default '0' COMMENT '重量',
  `shipments` int(11) NOT NULL default '0' COMMENT '发货数量',
  `goods_array` text COMMENT '商品和货品名称name和序规格value列化',
  PRIMARY KEY  (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- ----------------------------
-- Records of shop_order_goods
-- ----------------------------
INSERT INTO shop_order_goods VALUES ('1', '1', '138', '325', '220.00', '220.00', '1', '0', '0', 'a:2:{s:4:\"name\";s:22:\"耐克圆领短袖T恤\";s:5:\"value\";s:135:\"颜色:<img src=\"/iwebshop/upload/2011/05/26/20110526105352343.gif\" class=\"img_border\" style=\"width:15px;height:15px;\" /> , 尺码:L , \";}');

-- ----------------------------
-- Table structure for `shop_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_log`;
CREATE TABLE `shop_order_log` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL COMMENT '订单id',
  `user` varchar(20) default NULL COMMENT '操作人：顾客或admin',
  `action` varchar(20) default NULL COMMENT '动作',
  `addtime` datetime default NULL COMMENT '添加时间',
  `result` varchar(10) default NULL,
  `note` varchar(100) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单日志表';

-- ----------------------------
-- Records of shop_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_order_prop_relation`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_prop_relation`;
CREATE TABLE `shop_order_prop_relation` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL COMMENT '订单ID',
  `prop_id` int(11) default NULL COMMENT '道具ID',
  `user_id` int(11) default NULL COMMENT '用户ID',
  `create_time` datetime default NULL COMMENT '生成时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单与道具表';

-- ----------------------------
-- Records of shop_order_prop_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_payment`
-- ----------------------------
DROP TABLE IF EXISTS `shop_payment`;
CREATE TABLE `shop_payment` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL COMMENT '支付名称',
  `type` tinyint(1) default NULL COMMENT '1:线上、2:线下',
  `description` text COMMENT '描述',
  `poundage` float(10,2) NOT NULL default '0.00' COMMENT '手续费',
  `status` tinyint(1) default '0' COMMENT '安装状态 0启用 1禁用',
  `plugin_id` varchar(32) default NULL COMMENT '支付插件ID',
  `config` text COMMENT '序列号存储插件配置信息',
  `order` int(11) default NULL COMMENT '排序',
  `poundage_type` tinyint(1) default NULL COMMENT '手续费方式，1百分比2固定值',
  `note` text COMMENT '支付说明',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='支付方式表';

-- ----------------------------
-- Records of shop_payment
-- ----------------------------
INSERT INTO shop_payment VALUES ('1', '预存款支付', '1', '预存款是客户在您网站上的虚拟资金帐户', '0.00', '0', '12', 'a:2:{s:10:\"PrivateKey\";s:8:\"iwebshop\";s:11:\"real_method\";s:1:\"1\";}', '1', '1', '');

-- ----------------------------
-- Table structure for `shop_pay_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `shop_pay_plugin`;
CREATE TABLE `shop_pay_plugin` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `description` text COMMENT '描述',
  `logo` varchar(255) default NULL COMMENT 'logo',
  `file_path` varchar(255) default NULL COMMENT '接口文件路径',
  `version` varchar(255) default NULL COMMENT '版本号',
  `visibility` tinyint(1) NOT NULL default '0' COMMENT '是否显示:0为隐藏,1为显示',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='支付插件表';

-- ----------------------------
-- Records of shop_pay_plugin
-- ----------------------------
INSERT INTO shop_pay_plugin VALUES ('3', '八佰付在线支付', '支持币种：人民币，美元，韩元', '/payments/logos/pay_enets.gif', 'enets', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('9', '天天付在线支付（汇付天下）', '汇付天下（ www.chinapnr.com）是中国最具创新支付公司，注册资本过亿。', '/payments/logos/pay_chinapnr.gif', 'chinapnr', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('10', '招商银行', '中国第一家由企业创办的商业银行。', '/payments/logos/pay_cmbc.gif', 'cmbc', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('15', 'eNETS Payment esb_payments', '支持币种：美元, 新加坡元', '/payments/logos/pay_enets.gif', 'enets', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('16', 'EPAY网上支付', '支持币种：新台币', '/payments/logos/pay_epay.gif', 'epay', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('20', '和讯在线支付', '支持币种：人民币', '/payments/logos/pay_homeway.gif', 'homeway', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('21', '广州银联网付通', '广州银联网络支付有限公司是银联体系内专业从事银行卡跨行网上支付、公共支付技术服务的高新技术企业。', '/payments/logos/pay_hyl.gif', 'hyl', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('22', '中国工商银行[1.0.0.3版]', '中国工商银行网上银行B2C支付网关可以使用在windows主机和linux主机，请在申请工行网关接口时申请1.0.0.3版。', '/payments/logos/pay_icbc.gif', 'icbc', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('23', 'IEPAY', '支持币种：新台币', '/payments/logos/pay_iepay.gif', 'iepay', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('24', 'IPAY在线支付', '支持币种：人民币', '/payments/logos/pay_ipay.gif', 'ipay', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('26', 'MOBILE88', '支持币种：马元', '/payments/logos/pay_mobile88.gif', 'mobile88', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('28', 'NOCHEX在线支付', '支持币种：英镑', '/payments/logos/pay_nochek.gif', 'nochek', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('30', 'NPS网上支付－内卡', '支持币种：人民币', '/payments/logos/pay_nps.gif', 'nps', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('31', 'NPS网上支付－外卡', '支持币种：人民币, 港币, 美元, 欧元', '/payments/logos/pay_nps_out.gif', 'nps_out', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('36', 'PayPal贝宝', '全球最大的在线支付平台，同时也是目前全球贸易网上支付标准.', '/payments/logos/pay_paypal.gif', 'paypal_cn', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('37', '首信易在线支付', '支持币种：人民币, 美元，是中国首家实现跨银行跨地域提供多种银行卡在线交易的网上支付服务平台', '/payments/logos/pay_shouxin.gif', 'shouxin', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('38', '我付了储值卡支付(OK卡等)', '我付了储值卡支付网关支持了如百联OK卡等在内的国内主流预付费卡（消费储值卡）的支付。', '/payments/logos/pay_skypay.gif', 'skypay', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('40', 'SMSe在线支付', '支持币种：人民币，新台币', '/payments/logos/pay_smilepay.gif', 'smilepay', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('42', '台湾里网上支付', '支持币种：新台币', '/payments/logos/pay_twv.gif', 'twv', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('43', '网汇通在线支付', '中国率先提供互联网现金汇款、支付的服务提供商， 提供“网汇通”业务的数据处理和经营。', '/payments/logos/pay_udpay.gif', 'udpay', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('44', '银生支付', '支持币种：人民币', '/payments/logos/pay_unspay.gif', 'unspay', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('47', '易宝支付 (在线支付接口)', '首批通过国家信息安全系统认证、获得企业信用等级AAA级证书、注册资本1亿元。', '/payments/logos/pay_yeepay.gif', 'yeepay', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('50', '康辉商融彩虹平台', '康辉商融彩虹平台', '/payments/logos/pay_iris.gif', 'iris', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('17', 'Google Checkout', '支持币种：美元、欧元、英磅、马元', '/payments/logos/pay_epay.gif', 'epay', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('32', '线下支付', '您可以通过现金付款或银行转帐的方式进行收款，如：中国银行  开户人：李白 帐号：4200 3234 2234 1234', '/payments/logos/pay_offline.gif', 'offline', '0.6', '1');
INSERT INTO shop_pay_plugin VALUES ('46', '网银在线支付（内卡）', '网银在线是中国领先的电子支付解决方案提供商之一。', '/payments/logos/pay_wangjin.gif', 'wangjin', '0.6', '1');
INSERT INTO shop_pay_plugin VALUES ('2', '2CHECKOUT', '支持币种：澳元, 加拿大元, 欧元, 英磅, 港币, 日元, 韩元, 新加坡元, 美元', '/payments/logos/pay_2checkout.gif', '2checkout', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('11', '云网在线支付', '北京云网无限网络技术有限公司成立于1999年12月，是国内首家实现在线实时交易的电子商务公司。', '/payments/logos/pay_cncard.gif', 'cncard', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('12', '预存款支付', '预存款是客户在您网站上的虚拟资金帐户。', '/payments/logos/pay_deposit.gif', 'balance', '0.6', '1');
INSERT INTO shop_pay_plugin VALUES ('45', '网银在线支付（外卡）', '网银在线支付（外卡），网银网上支付是独立的安全支付平台。', '/payments/logos/pay_wangjin_out.gif', 'wangjin_out', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('8', '上海银联电子支付ChinaPay', '银联电子支付服务有限公司（ChinaPay）主要从事以互联网等新兴渠道为基础的网上支付。', '/payments/logos/pay_chinapay.gif', 'chinapay', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('34', 'PayDollar', '领先的世界级电子付款及解决方案和技术供应商；支持币种：人民币、港币、美元、新加坡元、日元、新台币、澳元、欧元、英磅、加拿大元', '/payments/logos/pay_paydollar.gif', 'paydollar', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('41', '腾讯财付通[担保交易]', '财付通担保交易，由财付通做担保，买家确认才付款。 <a style=\"color:blue\" href=\"http://union.tenpay.com/mch/mch_register_1.shtml?sp_suggestuser=2289480\r\n\" target=\"_blank\" >申请财付通担保账户</a>', '/payments/logos/pay_tenpaytrad.gif', 'tenpaytrad', '0.6', '1');
INSERT INTO shop_pay_plugin VALUES ('19', '运筹宝', '上海运筹宝电子商务有限公司（运筹宝Haipay ）是亚洲领先的在线支付服务提供商。', '/payments/logos/pay_google.gif', 'google', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('27', 'MONEYBOOKERS', '支持币种：澳元、加拿大元、欧元、英磅、港币、日元、韩元、新台币、新加坡元、美元', '/payments/logos/pay_moneybookers.gif', 'moneybookers', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('39', '腾讯财付通[即时到账]', '费率最低至<span style=\"color: #FF0000;font-weight: bold;\">0.61%</span>，并赠送价值千元企业QQ', '/payments/logos/pay_tenpay.gif', 'tenpay', '0.6', '1');
INSERT INTO shop_pay_plugin VALUES ('4', '快钱网上支付', '快钱是国内领先的独立第三方支付企业，旨在为各类企业及个人提供安全、便捷和保密的支付清算与账务服务。', '/payments/logos/pay_99bill.gif', '99bill', '0.6', '1');
INSERT INTO shop_pay_plugin VALUES ('6', '支付宝[担保交易]', ' <a style=\"color:blue\" href=\"https://www.alipay.com/himalayas/practicality_customer.htm?customer_external_id=C433530444855584111X&market_type=from_agent_contract&pro_codes=61F99645EC0DC4380ADE569DD132AD7A\" target=\"_blank\">立即申请</a>', '/payments/logos/pay_alipaytrad.gif', 'alipaytrad', '0.6', '1');
INSERT INTO shop_pay_plugin VALUES ('49', '中国移动手机支付', '仅对企业用户开放，年末超低费率<span style=\"color: #FF0000;font-weight: bold;\">0.3%</span>签约，精准营销覆盖6.7亿用户', '/payments/logos/pay_cmpay.gif', 'cmpay', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('7', '支付宝[即时到帐]', '支付宝即时到帐，付款后立即到账，无预付/年费，单笔费率阶梯最低<span style=\"color: #FF0000;font-weight: bold;\">0.7%</span>，无流量限制。  <a style=\"color:blue\" href=\"https://www.alipay.com/himalayas/practicality_customer.htm?customer_external_id=C433530444855584111X&market_type=from_agent_contract&pro_codes=61F99645EC0DC4380ADE569DD132AD7A\" target=\"_blank\">立即申请</a>', '/payments/logos/pay_alipay.gif', 'alipay', '0.6', '1');
INSERT INTO shop_pay_plugin VALUES ('25', '环讯IPS网上支付3.0', '上海环迅电子商务有限公司（以下简称：环迅支付 ）成立于2000年，是国内最早的支付公司之一。', '/payments/logos/pay_ips3.gif', 'ips3', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('35', 'PayPal（外卡）', 'PayPal 是全球最大的在线支付平台，同时也是目前全球贸易网上支付标准。', '/payments/logos/pay_paypal.gif', 'paypal', '0.6', '0');
INSERT INTO shop_pay_plugin VALUES ('48', '拉卡拉支付', '不用网银也能支付！支持所有银行卡，刷卡付款', '/payments/logos/pay_lakala.gif', 'lakala', '0.6', '0');

-- ----------------------------
-- Table structure for `shop_point_log`
-- ----------------------------
DROP TABLE IF EXISTS `shop_point_log`;
CREATE TABLE `shop_point_log` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `datetime` datetime NOT NULL COMMENT '发生时间',
  `value` int(11) NOT NULL COMMENT '积分增减 增加正数 减少负数',
  `intro` varchar(50) NOT NULL COMMENT '积分改动说明',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分增减记录表';

-- ----------------------------
-- Records of shop_point_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_products`
-- ----------------------------
DROP TABLE IF EXISTS `shop_products`;
CREATE TABLE `shop_products` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) NOT NULL COMMENT '货品ID',
  `products_no` varchar(20) default NULL COMMENT '货品的货号(以商品的货号加横线加数字组成)',
  `spec_array` text COMMENT '序列化的规则值,key规则ID,value此货品所具有的规则值',
  `store_nums` int(11) NOT NULL default '0' COMMENT '库存',
  `market_price` float(10,2) NOT NULL default '0.00' COMMENT '市场价格',
  `sell_price` float(10,2) NOT NULL default '0.00' COMMENT '销售价格',
  `cost_price` float(10,2) NOT NULL default '0.00' COMMENT '成本价格',
  `weight` float(10,2) NOT NULL default '0.00' COMMENT '重量',
  `goods_code` varchar(255) default NULL COMMENT '货号',
  `spec_md5` char(32) default NULL COMMENT '规格的md5值',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=336 DEFAULT CHARSET=utf8 COMMENT='货品表';

-- ----------------------------
-- Records of shop_products
-- ----------------------------
INSERT INTO shop_products VALUES ('248', '113', 'SD00000000000113-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105401935.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '119.00', '119.00', '0.00', '0.00', null, 'e5ee5a5269c8683153d7f9a1f981fbc2');
INSERT INTO shop_products VALUES ('247', '113', 'SD00000000000113-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105401935.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '200', '119.00', '119.00', '0.00', '0.00', null, 'a4918033e5a6114e089ad77bbadb0836');
INSERT INTO shop_products VALUES ('246', '113', 'SD00000000000113-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105401935.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '200', '119.00', '119.00', '0.00', '0.00', null, '27c7564f7388d1f9bc1df42619e603c4');
INSERT INTO shop_products VALUES ('245', '113', 'SD00000000000113-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105401935.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '200', '119.00', '119.00', '0.00', '0.00', null, '5f28f047247572f731dea3e15a38bb65');
INSERT INTO shop_products VALUES ('244', '113', 'SD00000000000113-5', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '119.00', '119.00', '0.00', '0.00', null, '3f7be2f2a55780082a1aa69ac7fd9f9d');
INSERT INTO shop_products VALUES ('243', '113', 'SD00000000000113-6', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '200', '119.00', '119.00', '0.00', '0.00', null, '7421100388d175eaf43c211a13d168e1');
INSERT INTO shop_products VALUES ('242', '113', 'SD00000000000113-7', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '200', '119.00', '119.00', '0.00', '0.00', null, '9d7dbc5fd5b372e6b2182e623e1f8b1a');
INSERT INTO shop_products VALUES ('233', '109', 'SD00000000000109-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"紫色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"M\";}}', '25', '300.00', '265.00', '195.00', '0.00', null, '95de0ad22b921bf7d616d802acfef322');
INSERT INTO shop_products VALUES ('234', '109', 'SD00000000000109-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"紫色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"L\";}}', '25', '300.00', '265.00', '195.00', '0.00', null, 'ef2e29feee3ccc206eeb7040167669c0');
INSERT INTO shop_products VALUES ('235', '109', 'SD00000000000109-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"紫色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '25', '300.00', '265.00', '195.00', '0.00', null, '878eff81c0f8ab28c8e77640dac5062c');
INSERT INTO shop_products VALUES ('236', '111', 'SD00000000000111-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:9:\"浅黄色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"M\";}}', '50', '365.00', '285.00', '200.00', '0.00', null, '14a597e819783248a62fb03e91821c76');
INSERT INTO shop_products VALUES ('237', '111', 'SD00000000000111-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:9:\"浅黄色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"L\";}}', '50', '365.00', '285.00', '200.00', '0.00', null, '52604a348828b97ce0a99cb41e8ab260');
INSERT INTO shop_products VALUES ('238', '111', 'SD00000000000111-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:9:\"浅黄色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '50', '365.00', '285.00', '200.00', '0.00', null, '8d7925e124340e4d1e2741b609d6f68d');
INSERT INTO shop_products VALUES ('239', '111', 'SD00000000000111-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:9:\"浅黄色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:3:\"XXL\";}}', '50', '365.00', '285.00', '200.00', '0.00', null, 'ca9e00312b4dc10090c9b4f48477f596');
INSERT INTO shop_products VALUES ('240', '112', 'SD00000000000112-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"83\";s:5:\"value\";s:4:\"50ml\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:3:\"XXL\";}}', '1000', '1200.00', '1000.00', '0.00', '0.00', null, 'af6ad563e771c20cd8426d95ae9f88e6');
INSERT INTO shop_products VALUES ('241', '113', 'SD00000000000113-8', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '200', '119.00', '119.00', '0.00', '0.00', null, 'edda220e5e6ca9269eb7c7877bc86c49');
INSERT INTO shop_products VALUES ('232', '109', 'SD00000000000109-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"紫色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"S\";}}', '25', '300.00', '265.00', '195.00', '0.00', null, '45958d61bcfa2ff58cb485ba1de3c223');
INSERT INTO shop_products VALUES ('191', '94', 'SD00000000000094-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"S\";}}', '50', '4099.00', '3999.00', '1.00', '0.00', null, '2ad130f6ea1270c9c8a70e4498526641');
INSERT INTO shop_products VALUES ('192', '94', 'SD00000000000094-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"S\";}}', '50', '4099.00', '3999.00', '1.00', '0.00', null, '16af638ffffd6873325f1803d5b84751');
INSERT INTO shop_products VALUES ('193', '95', 'SD00000000000095-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105538833.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"S\";}}', '200', '7999.00', '7699.00', '0.00', '0.00', null, 'b225d347cfcb347eb6d38a7720aa244d');
INSERT INTO shop_products VALUES ('194', '95', 'SD00000000000095-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"S\";}}', '200', '7999.00', '7699.00', '0.00', '0.00', null, '16af638ffffd6873325f1803d5b84751');
INSERT INTO shop_products VALUES ('195', '95', 'SD00000000000095-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105509389.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"S\";}}', '200', '7999.00', '7699.00', '0.00', '0.00', null, '84c4505ddf6c4e4de1d0145841583f80');
INSERT INTO shop_products VALUES ('196', '95', 'SD00000000000095-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105401935.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"S\";}}', '200', '7999.00', '7699.00', '0.00', '0.00', null, 'b14ba72a871cc5745d9f49ae812b41ef');
INSERT INTO shop_products VALUES ('202', '99', 'SD00000000000099-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:9:\"浅灰色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"S\";}}', '50', '368.00', '298.00', '202.00', '0.00', null, '6eaf852db22ab1807cf5e926505eb4e8');
INSERT INTO shop_products VALUES ('203', '99', 'SD00000000000099-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:9:\"浅灰色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"M\";}}', '50', '368.00', '298.00', '202.00', '0.00', null, '86b5357cf66356387feae1e11c16d210');
INSERT INTO shop_products VALUES ('204', '99', 'SD00000000000099-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:9:\"浅灰色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"L\";}}', '50', '368.00', '298.00', '202.00', '0.00', null, 'f499138319ddb175661294ed45b93552');
INSERT INTO shop_products VALUES ('205', '99', 'SD00000000000099-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:9:\"浅灰色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '50', '368.00', '298.00', '202.00', '0.00', null, '41f40030e08c65803184667a7df79a1b');
INSERT INTO shop_products VALUES ('206', '99', 'SD00000000000099-5', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:9:\"浅灰色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:3:\"XXL\";}}', '50', '368.00', '298.00', '202.00', '0.00', null, '1c8496055fd9d72924502e9abff8af7d');
INSERT INTO shop_products VALUES ('207', '99', 'SD00000000000099-6', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"白色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"S\";}}', '50', '368.00', '298.00', '202.00', '0.00', null, '03dfdd8d822a3d016fce39d7572f05fd');
INSERT INTO shop_products VALUES ('208', '99', 'SD00000000000099-7', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"白色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"M\";}}', '50', '368.00', '298.00', '202.00', '0.00', null, '2226e11f5273ec8a40965d21746fd154');
INSERT INTO shop_products VALUES ('209', '99', 'SD00000000000099-8', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"白色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"L\";}}', '50', '368.00', '298.00', '202.00', '0.00', null, '23f846eeb38d910dfab581b4094012e5');
INSERT INTO shop_products VALUES ('210', '99', 'SD00000000000099-9', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"白色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '30', '368.00', '298.00', '202.00', '0.00', null, 'bd2c76e9ccc6ace6cb1e6f39e82937af');
INSERT INTO shop_products VALUES ('211', '99', 'SD00000000000099-10', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"白色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:3:\"XXL\";}}', '30', '368.00', '298.00', '202.00', '0.00', null, '1a37daf92a8a965a277ff6c459988a06');
INSERT INTO shop_products VALUES ('212', '99', 'SD00000000000099-11', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:9:\"粉红色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:3:\"XXL\";}}', '0', '368.00', '298.00', '0.00', '0.00', null, 'fb561d52c95d54fa290bac87e9da0a45');
INSERT INTO shop_products VALUES ('213', '103', 'SD00000000000103-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"紫色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"S\";}}', '80', '300.00', '266.00', '195.00', '0.00', null, '45958d61bcfa2ff58cb485ba1de3c223');
INSERT INTO shop_products VALUES ('214', '103', 'SD00000000000103-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"紫色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"M\";}}', '80', '300.00', '266.00', '195.00', '0.00', null, '95de0ad22b921bf7d616d802acfef322');
INSERT INTO shop_products VALUES ('215', '103', 'SD00000000000103-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"紫色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"L\";}}', '80', '300.00', '266.00', '195.00', '0.00', null, 'ef2e29feee3ccc206eeb7040167669c0');
INSERT INTO shop_products VALUES ('216', '103', 'SD00000000000103-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"紫色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '80', '300.00', '266.00', '195.00', '0.00', null, '878eff81c0f8ab28c8e77640dac5062c');
INSERT INTO shop_products VALUES ('217', '103', 'SD00000000000103-5', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"桔色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"S\";}}', '80', '300.00', '266.00', '195.00', '0.00', null, '1ab64ceca4e93ac4b59a59a38d65f33f');
INSERT INTO shop_products VALUES ('218', '103', 'SD00000000000103-6', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"桔色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"M\";}}', '80', '300.00', '266.00', '195.00', '0.00', null, '10bef077e64b23f1ff658f44196aa702');
INSERT INTO shop_products VALUES ('219', '103', 'SD00000000000103-7', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"桔色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"L\";}}', '80', '300.00', '266.00', '195.00', '0.00', null, 'b05cbed6173a7745a8c6027ac9678ab0');
INSERT INTO shop_products VALUES ('220', '103', 'SD00000000000103-8', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"桔色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '80', '300.00', '266.00', '195.00', '0.00', null, 'e41878b79fe54b797d88f9e5acd73e27');
INSERT INTO shop_products VALUES ('221', '106', 'SD00000000000106-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:8:\"27(2尺)\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '100', '269.00', '249.00', '0.00', '0.00', null, 'bcc1818232d7a4ab3731d34f910eb012');
INSERT INTO shop_products VALUES ('222', '106', 'SD00000000000106-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:9:\"28(2尺1)\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '100', '269.00', '249.00', '0.00', '0.00', null, 'f28b71dde23984f1079d7f3df832d512');
INSERT INTO shop_products VALUES ('223', '106', 'SD00000000000106-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:9:\"29(2尺2)\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '100', '269.00', '249.00', '0.00', '0.00', null, '09a9fd3f4753eb204106f1c4568566b7');
INSERT INTO shop_products VALUES ('224', '106', 'SD00000000000106-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:9:\"30(2尺3)\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '100', '269.00', '249.00', '0.00', '0.00', null, '4ca59a2893216a538b7017671ef43efe');
INSERT INTO shop_products VALUES ('225', '106', 'SD00000000000106-5', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:9:\"31(2尺4)\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '100', '269.00', '249.00', '0.00', '0.00', null, '5316eebf9798771b3585d56392f44974');
INSERT INTO shop_products VALUES ('226', '106', 'SD00000000000106-6', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:9:\"32(2尺5)\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '100', '269.00', '249.00', '0.00', '0.00', null, 'd92ef430732cb7743190355951e6d23f');
INSERT INTO shop_products VALUES ('227', '108', 'SD00000000000108-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:8:\"27(2尺)\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '200', '299.00', '239.00', '0.00', '0.00', null, 'bcc1818232d7a4ab3731d34f910eb012');
INSERT INTO shop_products VALUES ('228', '108', 'SD00000000000108-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:9:\"28(2尺1)\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '200', '299.00', '239.00', '0.00', '0.00', null, 'f28b71dde23984f1079d7f3df832d512');
INSERT INTO shop_products VALUES ('229', '108', 'SD00000000000108-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:9:\"29(2尺2)\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '200', '299.00', '239.00', '0.00', '0.00', null, '09a9fd3f4753eb204106f1c4568566b7');
INSERT INTO shop_products VALUES ('230', '108', 'SD00000000000108-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:9:\"30(2尺3)\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '200', '299.00', '239.00', '0.00', '0.00', null, '4ca59a2893216a538b7017671ef43efe');
INSERT INTO shop_products VALUES ('231', '108', 'SD00000000000108-5', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"77\";s:5:\"value\";s:9:\"31(2尺4)\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '200', '299.00', '239.00', '0.00', '0.00', null, '5316eebf9798771b3585d56392f44974');
INSERT INTO shop_products VALUES ('335', '141', 'SD00000000000141-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '10', '260.00', '130.00', '0.00', '0.00', null, 'fa993f4a34df590b9ed87035b6bf2489');
INSERT INTO shop_products VALUES ('334', '141', 'SD00000000000141-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '10', '260.00', '130.00', '0.00', '0.00', null, 'a6699b291bbe7832986018df52fa44df');
INSERT INTO shop_products VALUES ('333', '141', 'SD00000000000141-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '10', '260.00', '130.00', '0.00', '0.00', null, '04a5d05e126cc469397f12f24bb98630');
INSERT INTO shop_products VALUES ('332', '141', 'SD00000000000141-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '10', '260.00', '130.00', '0.00', '0.00', null, '78024253b117e4c22919f2dc7dc0696c');
INSERT INTO shop_products VALUES ('331', '141', 'SD00000000000141-5', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"S\";}}', '8', '260.00', '130.00', '0.00', '0.00', null, '16af638ffffd6873325f1803d5b84751');
INSERT INTO shop_products VALUES ('330', '138', 'SD00000000000138-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '10', '360.00', '220.00', '0.00', '0.00', null, 'a6699b291bbe7832986018df52fa44df');
INSERT INTO shop_products VALUES ('329', '138', 'SD00000000000138-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '10', '360.00', '220.00', '0.00', '0.00', null, '04a5d05e126cc469397f12f24bb98630');
INSERT INTO shop_products VALUES ('328', '138', 'SD00000000000138-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '10', '360.00', '220.00', '0.00', '0.00', null, '78024253b117e4c22919f2dc7dc0696c');
INSERT INTO shop_products VALUES ('327', '138', 'SD00000000000138-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"S\";}}', '10', '360.00', '220.00', '0.00', '0.00', null, '16af638ffffd6873325f1803d5b84751');
INSERT INTO shop_products VALUES ('326', '138', 'SD00000000000138-5', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '10', '360.00', '220.00', '0.00', '0.00', null, '7421100388d175eaf43c211a13d168e1');
INSERT INTO shop_products VALUES ('325', '138', 'SD00000000000138-6', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '9', '360.00', '220.00', '0.00', '0.00', null, '9d7dbc5fd5b372e6b2182e623e1f8b1a');
INSERT INTO shop_products VALUES ('324', '138', 'SD00000000000138-7', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '10', '360.00', '220.00', '0.00', '0.00', null, 'edda220e5e6ca9269eb7c7877bc86c49');
INSERT INTO shop_products VALUES ('323', '138', 'SD00000000000138-8', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"S\";}}', '8', '360.00', '220.00', '0.00', '0.00', null, '2ad130f6ea1270c9c8a70e4498526641');
INSERT INTO shop_products VALUES ('322', '136', 'SD00000000000136-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105401935.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, 'e5ee5a5269c8683153d7f9a1f981fbc2');
INSERT INTO shop_products VALUES ('321', '136', 'SD00000000000136-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105401935.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, 'a4918033e5a6114e089ad77bbadb0836');
INSERT INTO shop_products VALUES ('320', '136', 'SD00000000000136-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105401935.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '27c7564f7388d1f9bc1df42619e603c4');
INSERT INTO shop_products VALUES ('319', '136', 'SD00000000000136-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105401935.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '5f28f047247572f731dea3e15a38bb65');
INSERT INTO shop_products VALUES ('318', '136', 'SD00000000000136-5', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105401935.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"S\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, 'b14ba72a871cc5745d9f49ae812b41ef');
INSERT INTO shop_products VALUES ('317', '136', 'SD00000000000136-6', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '3f7be2f2a55780082a1aa69ac7fd9f9d');
INSERT INTO shop_products VALUES ('316', '136', 'SD00000000000136-7', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '7421100388d175eaf43c211a13d168e1');
INSERT INTO shop_products VALUES ('315', '136', 'SD00000000000136-8', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '9d7dbc5fd5b372e6b2182e623e1f8b1a');
INSERT INTO shop_products VALUES ('314', '136', 'SD00000000000136-9', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, 'edda220e5e6ca9269eb7c7877bc86c49');
INSERT INTO shop_products VALUES ('313', '136', 'SD00000000000136-10', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"S\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '2ad130f6ea1270c9c8a70e4498526641');
INSERT INTO shop_products VALUES ('303', '136', 'SD00000000000136-11', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105552192.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"S\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '20be59b5dd829a09f90220f176eb7ffa');
INSERT INTO shop_products VALUES ('304', '136', 'SD00000000000136-12', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105552192.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '7d585578ee5212a2c8b9e89dedd73a65');
INSERT INTO shop_products VALUES ('305', '136', 'SD00000000000136-13', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105552192.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, 'f40dbb0299f6881a69064de2c34fd207');
INSERT INTO shop_products VALUES ('306', '136', 'SD00000000000136-14', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105552192.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '017607009460787c842693493f4b0a32');
INSERT INTO shop_products VALUES ('307', '136', 'SD00000000000136-15', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105552192.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '33ad750c21ca9b029890b9a94552bbe1');
INSERT INTO shop_products VALUES ('308', '136', 'SD00000000000136-16', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"S\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '16af638ffffd6873325f1803d5b84751');
INSERT INTO shop_products VALUES ('309', '136', 'SD00000000000136-17', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '78024253b117e4c22919f2dc7dc0696c');
INSERT INTO shop_products VALUES ('310', '136', 'SD00000000000136-18', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, '04a5d05e126cc469397f12f24bb98630');
INSERT INTO shop_products VALUES ('311', '136', 'SD00000000000136-19', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, 'a6699b291bbe7832986018df52fa44df');
INSERT INTO shop_products VALUES ('312', '136', 'SD00000000000136-20', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '10', '320.00', '120.00', '0.00', '0.00', null, 'fa993f4a34df590b9ed87035b6bf2489');
INSERT INTO shop_products VALUES ('166', '77', 'SD00000000000077-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '4999.00', '4799.00', '0.00', '0.00', null, 'fa993f4a34df590b9ed87035b6bf2489');
INSERT INTO shop_products VALUES ('167', '77', 'SD00000000000077-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '500', '4999.00', '4899.00', '0.00', '0.00', null, '3f7be2f2a55780082a1aa69ac7fd9f9d');
INSERT INTO shop_products VALUES ('168', '79', 'SD00000000000079-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '499', '2599.00', '2359.00', '0.00', '0.00', null, '3f7be2f2a55780082a1aa69ac7fd9f9d');
INSERT INTO shop_products VALUES ('169', '79', 'SD00000000000079-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '300', '2599.00', '2329.00', '0.00', '0.00', null, 'fa993f4a34df590b9ed87035b6bf2489');
INSERT INTO shop_products VALUES ('170', '82', 'SD00000000000082-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105401935.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '199', '1199.00', '1088.00', '0.00', '0.00', null, 'e5ee5a5269c8683153d7f9a1f981fbc2');
INSERT INTO shop_products VALUES ('171', '82', 'SD00000000000082-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '1199.00', '1098.00', '0.00', '0.00', null, 'fa993f4a34df590b9ed87035b6bf2489');
INSERT INTO shop_products VALUES ('172', '82', 'SD00000000000082-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105538833.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '1199.00', '1098.00', '0.00', '0.00', null, '9b27671c0fc60c4e4de3bddfd869db5c');
INSERT INTO shop_products VALUES ('173', '82', 'SD00000000000082-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105552192.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '1199.00', '1088.00', '0.00', '0.00', null, '33ad750c21ca9b029890b9a94552bbe1');
INSERT INTO shop_products VALUES ('174', '82', 'SD00000000000082-5', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '1199.00', '1088.00', '0.00', '0.00', null, '3f7be2f2a55780082a1aa69ac7fd9f9d');
INSERT INTO shop_products VALUES ('175', '85', 'SD00000000000085-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '300', '1599.00', '1490.00', '0.00', '0.00', null, '3f7be2f2a55780082a1aa69ac7fd9f9d');
INSERT INTO shop_products VALUES ('176', '85', 'SD00000000000085-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '288', '1599.00', '1490.00', '0.00', '0.00', null, 'fa993f4a34df590b9ed87035b6bf2489');
INSERT INTO shop_products VALUES ('177', '85', 'SD00000000000085-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105552192.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '300', '1599.00', '1490.00', '0.00', '0.00', null, '33ad750c21ca9b029890b9a94552bbe1');
INSERT INTO shop_products VALUES ('178', '88', 'SD00000000000088-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105515484.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '1299.00', '1199.00', '0.00', '0.00', null, '9658a2cb9e4f513cb301c034268ff309');
INSERT INTO shop_products VALUES ('179', '88', 'SD00000000000088-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105401935.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '1299.00', '1199.00', '0.00', '0.00', null, 'e5ee5a5269c8683153d7f9a1f981fbc2');
INSERT INTO shop_products VALUES ('180', '88', 'SD00000000000088-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105544210.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '1299.00', '1199.00', '0.00', '0.00', null, '5b4892e832ff792f37babe839e83be0f');
INSERT INTO shop_products VALUES ('181', '88', 'SD00000000000088-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105415915.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '1299.00', '1199.00', '0.00', '0.00', null, 'd7cfe426482ceb65af55326036ebcc39');
INSERT INTO shop_products VALUES ('182', '89', 'SD00000000000089-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105515484.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '500', '2199.00', '2078.00', '0.00', '0.00', null, '9658a2cb9e4f513cb301c034268ff309');
INSERT INTO shop_products VALUES ('183', '89', 'SD00000000000089-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105606611.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '500', '2199.00', '2078.00', '0.00', '0.00', null, 'a39256d741b17f1611acebe22585c8ea');
INSERT INTO shop_products VALUES ('184', '89', 'SD00000000000089-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105538833.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '600', '2199.00', '2078.00', '0.00', '0.00', null, '9b27671c0fc60c4e4de3bddfd869db5c');
INSERT INTO shop_products VALUES ('185', '90', 'SD00000000000090-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"82\";s:5:\"value\";s:9:\"套餐一\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '997', '4999.00', '4899.00', '0.00', '0.00', null, 'f779215572468f923e5ee7344429a7af');
INSERT INTO shop_products VALUES ('186', '91', 'SD00000000000091-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"82\";s:5:\"value\";s:9:\"套餐一\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '1900', '4399.00', '4199.00', '0.00', '0.00', null, 'f779215572468f923e5ee7344429a7af');
INSERT INTO shop_products VALUES ('249', '114', 'SD00000000000114-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"83\";s:5:\"value\";s:4:\"50ml\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '500', '450.00', '380.00', '0.00', '0.00', null, 'af6ad563e771c20cd8426d95ae9f88e6');
INSERT INTO shop_products VALUES ('250', '115', 'SD00000000000115-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105606611.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"S\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, '385c701c9f8519762268c6116515d97c');
INSERT INTO shop_products VALUES ('251', '115', 'SD00000000000115-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105606611.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, 'bf090729d2c73c447df36671477754a9');
INSERT INTO shop_products VALUES ('252', '115', 'SD00000000000115-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105606611.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, 'fc2a9f8a21f183b65ea36c1361ca7b65');
INSERT INTO shop_products VALUES ('253', '115', 'SD00000000000115-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105606611.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, '29bbd37ce3476c8543c49d3c5bf854e3');
INSERT INTO shop_products VALUES ('254', '115', 'SD00000000000115-5', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105606611.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, 'a39256d741b17f1611acebe22585c8ea');
INSERT INTO shop_products VALUES ('255', '115', 'SD00000000000115-6', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"S\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, '2ad130f6ea1270c9c8a70e4498526641');
INSERT INTO shop_products VALUES ('256', '115', 'SD00000000000115-7', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, 'edda220e5e6ca9269eb7c7877bc86c49');
INSERT INTO shop_products VALUES ('257', '115', 'SD00000000000115-8', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, '9d7dbc5fd5b372e6b2182e623e1f8b1a');
INSERT INTO shop_products VALUES ('258', '115', 'SD00000000000115-9', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, '7421100388d175eaf43c211a13d168e1');
INSERT INTO shop_products VALUES ('259', '115', 'SD00000000000115-10', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, '3f7be2f2a55780082a1aa69ac7fd9f9d');
INSERT INTO shop_products VALUES ('260', '115', 'SD00000000000115-11', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"S\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, '16af638ffffd6873325f1803d5b84751');
INSERT INTO shop_products VALUES ('261', '115', 'SD00000000000115-12', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, '78024253b117e4c22919f2dc7dc0696c');
INSERT INTO shop_products VALUES ('262', '115', 'SD00000000000115-13', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, '04a5d05e126cc469397f12f24bb98630');
INSERT INTO shop_products VALUES ('263', '115', 'SD00000000000115-14', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, 'a6699b291bbe7832986018df52fa44df');
INSERT INTO shop_products VALUES ('264', '115', 'SD00000000000115-15', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '198.00', '198.00', '0.00', '0.00', null, 'fa993f4a34df590b9ed87035b6bf2489');
INSERT INTO shop_products VALUES ('265', '116', 'SD00000000000116-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"紫色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"M\";}}', '50', '75.00', '58.00', '40.00', '0.00', null, '95de0ad22b921bf7d616d802acfef322');
INSERT INTO shop_products VALUES ('266', '116', 'SD00000000000116-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"紫色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"L\";}}', '50', '75.00', '58.00', '40.00', '0.00', null, 'ef2e29feee3ccc206eeb7040167669c0');
INSERT INTO shop_products VALUES ('267', '116', 'SD00000000000116-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"紫色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '50', '75.00', '58.00', '40.00', '0.00', null, '878eff81c0f8ab28c8e77640dac5062c');
INSERT INTO shop_products VALUES ('268', '116', 'SD00000000000116-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"桔色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"M\";}}', '50', '75.00', '58.00', '40.00', '0.00', null, '10bef077e64b23f1ff658f44196aa702');
INSERT INTO shop_products VALUES ('269', '116', 'SD00000000000116-5', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"桔色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:1:\"L\";}}', '50', '75.00', '58.00', '40.00', '0.00', null, 'b05cbed6173a7745a8c6027ac9678ab0');
INSERT INTO shop_products VALUES ('270', '116', 'SD00000000000116-6', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"桔色\";}i:1;a:2:{s:2:\"id\";s:2:\"75\";s:5:\"value\";s:2:\"XL\";}}', '50', '75.00', '58.00', '40.00', '0.00', null, 'e41878b79fe54b797d88f9e5acd73e27');
INSERT INTO shop_products VALUES ('271', '118', 'SD00000000000118-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:9:\"天蓝色\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:6:\"均码\";}}', '50', '60.00', '45.00', '30.00', '0.00', null, 'f79926e56d07321a22718db198f781d1');
INSERT INTO shop_products VALUES ('272', '118', 'SD00000000000118-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"红色\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:6:\"均码\";}}', '30', '60.00', '45.00', '30.00', '0.00', null, 'ab61cf53a46bfaab01793d64b4589195');
INSERT INTO shop_products VALUES ('273', '118', 'SD00000000000118-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"74\";s:5:\"value\";s:6:\"绿色\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:6:\"均码\";}}', '19', '60.00', '45.00', '30.00', '0.00', null, 'b7e0a6cd7da119526d840e89765edd33');
INSERT INTO shop_products VALUES ('274', '119', 'SD00000000000119-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"S\";}}', '200', '179.00', '175.00', '0.00', '0.00', null, '2ad130f6ea1270c9c8a70e4498526641');
INSERT INTO shop_products VALUES ('275', '119', 'SD00000000000119-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '200', '179.00', '175.00', '0.00', '0.00', null, 'edda220e5e6ca9269eb7c7877bc86c49');
INSERT INTO shop_products VALUES ('276', '119', 'SD00000000000119-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '199', '179.00', '175.00', '0.00', '0.00', null, '9d7dbc5fd5b372e6b2182e623e1f8b1a');
INSERT INTO shop_products VALUES ('277', '119', 'SD00000000000119-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '200', '179.00', '175.00', '0.00', '0.00', null, '7421100388d175eaf43c211a13d168e1');
INSERT INTO shop_products VALUES ('278', '121', 'SD00000000000121-1', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105509389.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '5282bcff756de6f78967787595d8f8cb');
INSERT INTO shop_products VALUES ('279', '121', 'SD00000000000121-2', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105509389.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, 'ebb6150f5310b168550805310df61f32');
INSERT INTO shop_products VALUES ('280', '121', 'SD00000000000121-3', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105509389.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '4571a86e645051277ec3b9556ea36fc6');
INSERT INTO shop_products VALUES ('281', '121', 'SD00000000000121-4', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105509389.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '1f8c7c6ef6ed77172a864a625d3ba929');
INSERT INTO shop_products VALUES ('282', '121', 'SD00000000000121-5', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105509389.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXXL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '66a97280a0c920900dee3ed07c11b10d');
INSERT INTO shop_products VALUES ('283', '121', 'SD00000000000121-6', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105538833.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '994fbbfaf48469ecb15008eb7819f9de');
INSERT INTO shop_products VALUES ('284', '121', 'SD00000000000121-7', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105538833.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '28983572aea7cd45feea00dcb925759d');
INSERT INTO shop_products VALUES ('285', '121', 'SD00000000000121-8', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105538833.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, 'ceddd4ea317499bbecf98294279975b4');
INSERT INTO shop_products VALUES ('286', '121', 'SD00000000000121-9', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105538833.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '9b27671c0fc60c4e4de3bddfd869db5c');
INSERT INTO shop_products VALUES ('287', '121', 'SD00000000000121-10', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105538833.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXXL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, 'c90a184b0f2a48a0163341b54d8ca449');
INSERT INTO shop_products VALUES ('288', '121', 'SD00000000000121-11', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105415915.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, 'e65cb90de6d7d2ffe7decb166f00ba34');
INSERT INTO shop_products VALUES ('289', '121', 'SD00000000000121-12', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105415915.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, 'd7748c61537629cf2b690bb5beae0e19');
INSERT INTO shop_products VALUES ('290', '121', 'SD00000000000121-13', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105415915.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '8189dd1878b6e2d0391afe85623df6b9');
INSERT INTO shop_products VALUES ('291', '121', 'SD00000000000121-14', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105415915.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, 'd7cfe426482ceb65af55326036ebcc39');
INSERT INTO shop_products VALUES ('292', '121', 'SD00000000000121-15', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105415915.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXXL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '812f0b9478f7384de1552f0485ebbd8d');
INSERT INTO shop_products VALUES ('293', '121', 'SD00000000000121-16', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, 'edda220e5e6ca9269eb7c7877bc86c49');
INSERT INTO shop_products VALUES ('294', '121', 'SD00000000000121-17', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '9d7dbc5fd5b372e6b2182e623e1f8b1a');
INSERT INTO shop_products VALUES ('295', '121', 'SD00000000000121-18', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '199', '149.00', '149.00', '0.00', '0.00', null, '7421100388d175eaf43c211a13d168e1');
INSERT INTO shop_products VALUES ('296', '121', 'SD00000000000121-19', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '3f7be2f2a55780082a1aa69ac7fd9f9d');
INSERT INTO shop_products VALUES ('297', '121', 'SD00000000000121-20', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105352343.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXXL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, 'afe4ead96364dad9a612bbc7cbfaa95f');
INSERT INTO shop_products VALUES ('298', '121', 'SD00000000000121-21', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"M\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '78024253b117e4c22919f2dc7dc0696c');
INSERT INTO shop_products VALUES ('299', '121', 'SD00000000000121-22', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:1:\"L\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '04a5d05e126cc469397f12f24bb98630');
INSERT INTO shop_products VALUES ('300', '121', 'SD00000000000121-23', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:2:\"XL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, 'a6699b291bbe7832986018df52fa44df');
INSERT INTO shop_products VALUES ('301', '121', 'SD00000000000121-24', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:3:\"XXL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, 'fa993f4a34df590b9ed87035b6bf2489');
INSERT INTO shop_products VALUES ('302', '121', 'SD00000000000121-25', 'a:2:{i:0;a:2:{s:2:\"id\";s:2:\"76\";s:5:\"value\";s:39:\"upload/2011/05/26/20110526105558440.gif\";}i:1;a:2:{s:2:\"id\";s:2:\"78\";s:5:\"value\";s:4:\"XXXL\";}}', '200', '149.00', '149.00', '0.00', '0.00', null, '4ad8fd42cfc2c6c2e618cab612aba17c');

-- ----------------------------
-- Table structure for `shop_promotion`
-- ----------------------------
DROP TABLE IF EXISTS `shop_promotion`;
CREATE TABLE `shop_promotion` (
  `id` int(11) NOT NULL auto_increment,
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `condition` int(11) NOT NULL COMMENT '生效条件 type=0时为消费额度 type=1时为goods_id',
  `type` tinyint(1) NOT NULL default '0' COMMENT '活动类型 0:购物车促销规则 1:商品限时抢购',
  `award_value` varchar(255) default NULL COMMENT '奖励值 type=0时奖励值 type=1时为抢购价格',
  `name` varchar(20) NOT NULL COMMENT '活动名称',
  `intro` text COMMENT '活动介绍',
  `award_type` tinyint(1) NOT NULL default '0' COMMENT '奖励方式:0限时抢购 1减金额 2奖励折扣 3赠送积分 4赠送代金券 5赠送赠品 6免运费',
  `is_close` tinyint(1) NOT NULL default '0' COMMENT '是否关闭 0:否 1:是',
  `user_group` text COMMENT '允许参与活动的用户组,all表示所有用户组',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='记录促销活动的表';

-- ----------------------------
-- Records of shop_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_promotion_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_promotion_goods`;
CREATE TABLE `shop_promotion_goods` (
  `id` int(11) NOT NULL auto_increment,
  `promotion_id` int(11) NOT NULL COMMENT '活动ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `product_id` int(11) default NULL COMMENT '货品ID',
  `goods_nums` int(11) default NULL COMMENT '商品数量',
  `goods_price` float(10,2) NOT NULL default '0.00' COMMENT '商品价格',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动商品表';

-- ----------------------------
-- Records of shop_promotion_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_promotion_log`
-- ----------------------------
DROP TABLE IF EXISTS `shop_promotion_log`;
CREATE TABLE `shop_promotion_log` (
  `id` int(11) NOT NULL auto_increment,
  `promotion_id` int(11) default NULL COMMENT '活动ID',
  `user_id` int(11) default NULL COMMENT '参与用户',
  `buy_nums` int(11) default NULL COMMENT '购买件数',
  `goods_id` int(11) default NULL COMMENT '商品ID',
  `product_id` int(11) default NULL COMMENT '货品ID',
  `join_time` datetime default NULL COMMENT '参与时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动记录表';

-- ----------------------------
-- Records of shop_promotion_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_prop`
-- ----------------------------
DROP TABLE IF EXISTS `shop_prop`;
CREATE TABLE `shop_prop` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL COMMENT '道具名称',
  `card_name` varchar(32) default NULL COMMENT '道具的卡号',
  `card_pwd` varchar(32) default NULL COMMENT '道具的密码',
  `start_time` datetime default NULL COMMENT '开始时间',
  `end_time` datetime default NULL COMMENT '结束时间',
  `value` float(10,2) NOT NULL default '0.00' COMMENT '面值',
  `type` tinyint(1) NOT NULL default '0' COMMENT '道具类型 0:代金券',
  `condition` varchar(255) default NULL COMMENT '条件数据 type=0时,表示ticket的表id,模型id',
  `is_close` tinyint(1) NOT NULL default '0' COMMENT '是否关闭 0:正常,1:关闭,2:下订单未支付时临时锁定',
  `img` varchar(255) default NULL COMMENT '道具图片',
  `is_userd` tinyint(1) NOT NULL default '0' COMMENT '是否被使用过 0:未使用,1:已使用',
  `is_send` tinyint(1) NOT NULL default '0' COMMENT '是否被发送过 0:否 1:是',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='道具表';

-- ----------------------------
-- Records of shop_prop
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_quick_naviga`
-- ----------------------------
DROP TABLE IF EXISTS `shop_quick_naviga`;
CREATE TABLE `shop_quick_naviga` (
  `id` int(11) NOT NULL auto_increment,
  `adminid` int(11) default NULL COMMENT '管理员id',
  `naviga_name` varchar(255) default NULL COMMENT '导航名称',
  `url` varchar(255) default NULL COMMENT '导航链接',
  `is_del` tinyint(1) NOT NULL default '0' COMMENT '是否删除1为删除',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员快速导航';

-- ----------------------------
-- Records of shop_quick_naviga
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_refer`
-- ----------------------------
DROP TABLE IF EXISTS `shop_refer`;
CREATE TABLE `shop_refer` (
  `id` int(11) NOT NULL auto_increment,
  `question` text NOT NULL COMMENT '咨询内容',
  `user_id` int(11) default NULL COMMENT '咨询人会员ID，非会员为空',
  `goods_id` int(11) default NULL COMMENT '产品ID',
  `order_id` int(11) default NULL COMMENT '订单ID',
  `answer` text COMMENT '回复内容',
  `admin_id` int(11) default NULL COMMENT '管理员ID',
  `status` tinyint(1) default '0' COMMENT '0：待回复 1已回复 9关闭 ',
  `time` datetime default NULL COMMENT '咨询时间',
  `reply_time` datetime default NULL COMMENT '回复时间',
  `type` tinyint(1) default '0' COMMENT '咨询的类别',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='咨询表';

-- ----------------------------
-- Records of shop_refer
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_refundment_doc`
-- ----------------------------
DROP TABLE IF EXISTS `shop_refundment_doc`;
CREATE TABLE `shop_refundment_doc` (
  `id` int(11) NOT NULL auto_increment,
  `order_no` varchar(20) NOT NULL default '' COMMENT '订单号',
  `order_id` int(11) default NULL COMMENT '订单id',
  `user_id` int(11) default NULL COMMENT '收款人',
  `amount` float(10,2) NOT NULL default '0.00' COMMENT '退款金额',
  `time` datetime default NULL COMMENT '时间',
  `refundment_type` tinyint(1) default '0' COMMENT '退款类型：0：退款至账户余额 1：退款至银行卡 2：其它方式',
  `refundment_username` varchar(30) default NULL COMMENT '开户名',
  `refundment_name` varchar(100) default NULL COMMENT '名称或者开户行',
  `refundment_account` varchar(255) default NULL COMMENT '退款账户',
  `refundment_bank` int(11) default '0' COMMENT '充值ID',
  `admin_id` int(11) default NULL COMMENT '管理员id',
  `pay_status` tinyint(3) default '0' COMMENT '退款状态，0：申请退款 1：退款失败 2:退款成功',
  `content` text COMMENT '申请退款原因',
  `dispose_time` datetime default NULL COMMENT '处理时间',
  `dispose_idea` text COMMENT '处理意见',
  `if_del` tinyint(3) default '0' COMMENT '1删除',
  `bank_name` varchar(30) default NULL COMMENT '管理员实际退款银行名称',
  `bank_account` varchar(255) default NULL COMMENT '管理员实际退款到账号',
  `bank_time` datetime default NULL COMMENT '管理员实际退款的退款时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='退款单';

-- ----------------------------
-- Records of shop_refundment_doc
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_regiment`
-- ----------------------------
DROP TABLE IF EXISTS `shop_regiment`;
CREATE TABLE `shop_regiment` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL COMMENT '团购标题',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `store_nums` int(11) NOT NULL default '0' COMMENT '库存量',
  `sum_count` int(11) NOT NULL default '0' COMMENT '已销售量',
  `least_count` int(11) NOT NULL default '0' COMMENT '最少购买数量',
  `intro` varchar(255) default NULL COMMENT '介绍',
  `is_close` tinyint(1) NOT NULL default '0' COMMENT '是否关闭',
  `regiment_price` float(10,2) NOT NULL default '0.00' COMMENT '团购价格',
  `sell_price` int(11) NOT NULL default '0' COMMENT '原来价格',
  `goods_id` int(11) NOT NULL COMMENT '关联商品id',
  `img` varchar(255) default NULL COMMENT '商品图片',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='团购';

-- ----------------------------
-- Records of shop_regiment
-- ----------------------------
INSERT INTO shop_regiment VALUES ('17', '兰蔻智能愉悦臻白晚霜', '2011-07-27 18:29:06', '2011-12-09 18:29:08', '200', '0', '10', '', '0', '750.00', '850', '100', 'upload/2011/05/27/20110527112145724.png');
INSERT INTO shop_regiment VALUES ('18', '正品/韩国乐扣乐扣/LOCKLOCK 拉斯方形 玻璃保鲜盒LLG224 750ml ', '2011-07-27 18:32:08', '2011-12-09 18:32:09', '88', '0', '10', '', '0', '35.00', '58', '144', 'upload/2011/05/27/20110527043650523.jpg');
INSERT INTO shop_regiment VALUES ('16', 'Jack Jones/杰克琼斯条纹撞色军官风短袖衬衫(黑)', '2011-07-27 18:27:52', '2011-12-02 18:28:16', '50', '0', '5', '', '0', '99.00', '175', '119', 'upload/2011/05/27/20110527021759985.jpg');
INSERT INTO shop_regiment VALUES ('15', '大型清装穿越电视剧 《宫》宫锁心玉（DVD） ', '2011-07-27 17:27:20', '2011-12-11 17:27:22', '50', '0', '2', '', '0', '99.00', '120', '133', 'upload/2011/05/27/20110527033924511.png');
INSERT INTO shop_regiment VALUES ('14', '这个夏天很美丽 梦特娇短袖真丝连衣裙5折开团', '2011-07-27 14:40:59', '2011-12-02 14:41:01', '100', '0', '5', '', '0', '139.00', '278', '103', 'upload/2011/05/27/20110527113535353.jpg');

-- ----------------------------
-- Table structure for `shop_regiment_user_relation`
-- ----------------------------
DROP TABLE IF EXISTS `shop_regiment_user_relation`;
CREATE TABLE `shop_regiment_user_relation` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `regiment_id` int(11) NOT NULL COMMENT '团购id',
  `join_time` datetime NOT NULL COMMENT '用户参加团购的时间，过了一定时间此名额失效',
  `is_over` tinyint(4) NOT NULL COMMENT '1:已经完成购买,0：未完成',
  `hash` varchar(32) NOT NULL COMMENT '未登录用户的唯一性hash',
  `order_no` varchar(20) NOT NULL default ' 0' COMMENT '与这次团购行为的关联的订单号',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团购与用户关系表';

-- ----------------------------
-- Records of shop_regiment_user_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_relation`
-- ----------------------------
DROP TABLE IF EXISTS `shop_relation`;
CREATE TABLE `shop_relation` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章商品关系表';

-- ----------------------------
-- Records of shop_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_returns_doc`
-- ----------------------------
DROP TABLE IF EXISTS `shop_returns_doc`;
CREATE TABLE `shop_returns_doc` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL COMMENT '订单ID',
  `user_id` int(11) default NULL COMMENT '退货用户ID',
  `admin_id` int(11) default NULL COMMENT '管理员ID',
  `reason` varchar(50) default NULL COMMENT '退货原因',
  `postcode` int(6) default NULL COMMENT '邮编',
  `telphone` varchar(20) default NULL COMMENT '联系电话',
  `country` int(11) default NULL COMMENT '国ID',
  `province` int(11) default NULL COMMENT '省ID',
  `city` int(11) default NULL COMMENT '市ID',
  `area` int(11) default NULL COMMENT '区ID',
  `address` varchar(250) default NULL COMMENT '退货地址',
  `mobile` varchar(20) default NULL COMMENT '手机',
  `time` datetime default NULL COMMENT '创建时间',
  `freight` float(10,2) NOT NULL default '0.00' COMMENT '运费',
  `delivery_code` varchar(255) default NULL COMMENT '物流单号',
  `delivery_type` varchar(255) default NULL COMMENT '物流方式',
  `note` text COMMENT '备注',
  `name` varchar(50) default NULL COMMENT '退货人姓名',
  `if_del` tinyint(3) default NULL COMMENT '1为删除',
  `state` tinyint(3) default NULL COMMENT '0申请退货1退货成功2退货失败',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='退货单';

-- ----------------------------
-- Records of shop_returns_doc
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_right`
-- ----------------------------
DROP TABLE IF EXISTS `shop_right`;
CREATE TABLE `shop_right` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL COMMENT '权限名字',
  `right` varchar(255) NOT NULL COMMENT '权限码(控制器+动作)',
  `is_del` tinyint(1) NOT NULL default '0' COMMENT '删除状态 1删除,0正常',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='权限资源码';

-- ----------------------------
-- Records of shop_right
-- ----------------------------
INSERT INTO shop_right VALUES ('1', '数据库备份[展示]', 'tools@db_bak', '0');
INSERT INTO shop_right VALUES ('2', '数据库备份[动作]', 'tools@db_act_bak', '0');
INSERT INTO shop_right VALUES ('3', '数据库还原[展示]', 'tools@db_res', '0');
INSERT INTO shop_right VALUES ('4', '数据库还原[动作]', 'tools@res_act', '0');
INSERT INTO shop_right VALUES ('5', '数据库备份删除', 'tools@backup_del', '0');
INSERT INTO shop_right VALUES ('6', '数据库备份下载', 'tools@download', '0');
INSERT INTO shop_right VALUES ('7', '数据库备份打包下载', 'tools@download_pack', '0');
INSERT INTO shop_right VALUES ('8', '友情链接添加和修改[展示]', 'tools@link_edit', '0');
INSERT INTO shop_right VALUES ('9', '友情链接添加和修改[动作]', 'tools@link_edit_act', '0');
INSERT INTO shop_right VALUES ('10', '友情链接删除', 'tools@link_del', '0');
INSERT INTO shop_right VALUES ('11', '文章删除', 'tools@article_del', '0');
INSERT INTO shop_right VALUES ('12', '文章添加和修改[展示]', 'tools@article_edit', '0');
INSERT INTO shop_right VALUES ('13', '文章添加和修改[动作]', 'tools@article_edit_act', '0');
INSERT INTO shop_right VALUES ('14', '文章分类添加和修改[展示]', 'tools@cat_edit', '0');
INSERT INTO shop_right VALUES ('15', '文章分类添加和修改[动作]', 'tools@cat_edit_act', '0');
INSERT INTO shop_right VALUES ('16', '文章分类删除', 'tools@cat_del', '0');
INSERT INTO shop_right VALUES ('17', '广告位添加和修改[展示]', 'tools@ad_position_edit', '0');
INSERT INTO shop_right VALUES ('18', '广告位添加和修改[动作]', 'tools@ad_position_edit_act', '0');
INSERT INTO shop_right VALUES ('19', '广告位删除', 'tools@ad_position_del', '0');
INSERT INTO shop_right VALUES ('20', '广告添加和修改[展示]', 'tools@ad_edit', '0');
INSERT INTO shop_right VALUES ('21', '广告添加和修改[动作]', 'tools@ad_edit_act', '0');
INSERT INTO shop_right VALUES ('22', '广告删除', 'tools@ad_del', '0');
INSERT INTO shop_right VALUES ('23', '帮助列表', 'tools@help_list', '0');
INSERT INTO shop_right VALUES ('24', '帮助添加和修改[展示]', 'tools@help_edit', '0');
INSERT INTO shop_right VALUES ('25', '帮助添加和修改[动作]', 'tools@help_edit_act', '0');
INSERT INTO shop_right VALUES ('26', '帮助删除', 'tools@help_del', '0');
INSERT INTO shop_right VALUES ('27', '帮助分类添加和修改[展示]', 'tools@help_cat_edit', '0');
INSERT INTO shop_right VALUES ('28', '帮助分类添加和修改[动作]', 'tools@help_cat_edit_act', '0');
INSERT INTO shop_right VALUES ('29', '帮助分类列表', 'tools@help_cat_list', '0');
INSERT INTO shop_right VALUES ('30', '帮助分类位置设置', 'tools@help_cat_position', '0');
INSERT INTO shop_right VALUES ('31', '关键词添加[动作]', 'tools@keyword_add', '0');
INSERT INTO shop_right VALUES ('32', '关键词添加[展示]', 'tools@keyword_edit', '0');
INSERT INTO shop_right VALUES ('33', '关键词删除', 'tools@keyword_del', '0');
INSERT INTO shop_right VALUES ('34', '关键词设置热门', 'tools@keyword_hot', '0');
INSERT INTO shop_right VALUES ('35', '关键词排序', 'tools@keyword_order', '0');
INSERT INTO shop_right VALUES ('36', '关键词统计商品数量', 'tools@keyword_account', '0');
INSERT INTO shop_right VALUES ('37', '订单列表', 'order@order_list', '0');
INSERT INTO shop_right VALUES ('38', '订单详情', 'order@order_show', '0');
INSERT INTO shop_right VALUES ('39', '订单添加', 'order@order_add', '0');
INSERT INTO shop_right VALUES ('40', '收款单列表', 'order@order_collection_list', '0');
INSERT INTO shop_right VALUES ('41', '退款单列表', 'order@order_refundment_list', '0');
INSERT INTO shop_right VALUES ('42', '发货单列表', 'order@order_delivery_list', '0');
INSERT INTO shop_right VALUES ('43', '退货单列表', 'order@order_returns_list', '0');
INSERT INTO shop_right VALUES ('44', '退货申请列表', 'order@refundment_list', '0');
INSERT INTO shop_right VALUES ('45', '发货信息列表', 'order@ship_info_list', '0');
INSERT INTO shop_right VALUES ('46', '订单删除', 'order@order_del', '0');
INSERT INTO shop_right VALUES ('47', '收款单删除', 'order@collection_del', '0');
INSERT INTO shop_right VALUES ('48', '退款单删除', 'order@refundment_del', '0');
INSERT INTO shop_right VALUES ('49', '发货单删除', 'order@delivery_del', '0');
INSERT INTO shop_right VALUES ('50', '退货单删除', 'order@returns_del', '0');
INSERT INTO shop_right VALUES ('51', '退款申请删除', 'order@refundment_doc_del', '0');
INSERT INTO shop_right VALUES ('52', '发货信息删除', 'order@ship_info_del', '0');
INSERT INTO shop_right VALUES ('53', '商品模型列表', 'goods@model_list', '0');
INSERT INTO shop_right VALUES ('54', '商品模型修改[展示]', 'goods@model_edit', '0');
INSERT INTO shop_right VALUES ('55', '规格列表', 'goods@spec_list', '0');
INSERT INTO shop_right VALUES ('56', '商品规格添加和修改', 'goods@spec_edit', '0');
INSERT INTO shop_right VALUES ('57', '商品规格图库', 'goods@spec_photo', '0');
INSERT INTO shop_right VALUES ('58', '商品添加[展示]', 'goods@goods_add', '0');
INSERT INTO shop_right VALUES ('59', '商品修改[展示]', 'goods@goods_edit', '0');
INSERT INTO shop_right VALUES ('60', '商品添加[动作]', 'goods@goods_save', '0');
INSERT INTO shop_right VALUES ('61', '商品修改[动作]', 'goods@goods_update', '0');
INSERT INTO shop_right VALUES ('62', '商品列表', 'goods@goods_list', '0');
INSERT INTO shop_right VALUES ('63', '商品分类修改[展示]', 'goods@category_edit', '0');
INSERT INTO shop_right VALUES ('64', '商品分类列表', 'goods@category_list', '0');
INSERT INTO shop_right VALUES ('65', '商品模型删除', 'goods@model_del', '0');
INSERT INTO shop_right VALUES ('66', '商品规格删除', 'goods@spec_del', '0');
INSERT INTO shop_right VALUES ('67', '商品删除', 'goods@goods_del', '0');
INSERT INTO shop_right VALUES ('68', '商品分类删除', 'goods@category_del', '0');
INSERT INTO shop_right VALUES ('69', '商品规格图片删除', 'goods@spec_photo_del', '0');
INSERT INTO shop_right VALUES ('70', '会员信息添加和修改', 'member@member_edit', '0');
INSERT INTO shop_right VALUES ('71', '会员列表', 'member@member_list', '0');
INSERT INTO shop_right VALUES ('72', '用户组添加和修改[展示]', 'member@group_edit', '0');
INSERT INTO shop_right VALUES ('73', '用户组列表', 'mebmer@group_list', '0');
INSERT INTO shop_right VALUES ('74', '会员提现申请', 'member@withdraw_list', '0');
INSERT INTO shop_right VALUES ('75', '会员信息模板列表', 'member@tpl_list', '0');
INSERT INTO shop_right VALUES ('76', '会员到货通知', 'member@notify_list', '0');
INSERT INTO shop_right VALUES ('77', '评论列表', 'comment@comment_list', '0');
INSERT INTO shop_right VALUES ('78', '讨论列表', 'comment@discussion_list', '0');
INSERT INTO shop_right VALUES ('79', '站内消息列表', 'comment@message_list', '0');
INSERT INTO shop_right VALUES ('80', '建议列表', 'comment@suggestion_list', '0');
INSERT INTO shop_right VALUES ('81', '咨询列表', 'comment@refer_list', '0');
INSERT INTO shop_right VALUES ('82', '代金券列表', 'market@ticket_list', '0');
INSERT INTO shop_right VALUES ('83', '代金券文件列表', 'market@ticket_excel_list', '0');
INSERT INTO shop_right VALUES ('84', '促销规则列表', 'market@pro_rule_list', '0');
INSERT INTO shop_right VALUES ('85', '促销规则添加和修改[展示]', 'market@pro_rule_edit', '0');
INSERT INTO shop_right VALUES ('86', '显示抢购列表', 'market@pro_speed_list', '0');
INSERT INTO shop_right VALUES ('87', '团购列表', 'market@regiment_list', '0');
INSERT INTO shop_right VALUES ('88', '促销规则删除', 'market@pro_rule_del', '0');
INSERT INTO shop_right VALUES ('89', '团购删除', 'market@regiment_del', '0');
INSERT INTO shop_right VALUES ('90', '限时抢购删除', 'market@pro_speed_del', '0');
INSERT INTO shop_right VALUES ('91', '代金券删除', 'market@ticket_del', '0');
INSERT INTO shop_right VALUES ('92', '代金券实体删除', 'market@ticket_more_del', '0');
INSERT INTO shop_right VALUES ('93', '代金券实体文件删除', 'market@ticket_excel_del', '0');
INSERT INTO shop_right VALUES ('94', '资金操作记录', 'market@account_list', '0');
INSERT INTO shop_right VALUES ('95', '文章列表', 'tools@article_list', '0');
INSERT INTO shop_right VALUES ('96', '商品模型修改[动作]', 'goods@model_update', '0');
INSERT INTO shop_right VALUES ('97', '商品排序[动作]', 'goods@goods_sort', '0');
INSERT INTO shop_right VALUES ('98', '商品回收站删除[动作]', 'goods@goods_recycle_del', '0');
INSERT INTO shop_right VALUES ('99', '商品规格回收站删除[动作]', 'goods@spec_recycle_del', '0');
INSERT INTO shop_right VALUES ('100', '生成缩略图[动作]', 'block@create_thumb', '1');
INSERT INTO shop_right VALUES ('101', '建议详细页面', 'comment@suggestion_edit', '0');
INSERT INTO shop_right VALUES ('102', '建议恢复[动作]', 'comment@suggestion_edit_act', '0');
INSERT INTO shop_right VALUES ('103', '建议删除[动作]', 'comment@suggestion_del', '0');
INSERT INTO shop_right VALUES ('104', '评价详情页面', 'comment@comment_edit', '0');
INSERT INTO shop_right VALUES ('105', '评价删除[动作]', 'comment@comment_del', '0');
INSERT INTO shop_right VALUES ('106', '讨论详情页面', 'comment@discussion_edit', '0');
INSERT INTO shop_right VALUES ('107', '讨论删除[动作]', 'comment@discussion_del', '0');
INSERT INTO shop_right VALUES ('108', '咨询删除[动作]', 'comment@refer_del', '0');
INSERT INTO shop_right VALUES ('109', '咨询详情页面', 'comment@refer_edit', '0');
INSERT INTO shop_right VALUES ('110', '咨询回复[动作]', 'comment@refer_reply', '0');
INSERT INTO shop_right VALUES ('111', '站内信删除', 'comment@message_del', '0');
INSERT INTO shop_right VALUES ('112', '站内信发送', 'comment@message_send', '0');

-- ----------------------------
-- Table structure for `shop_search`
-- ----------------------------
DROP TABLE IF EXISTS `shop_search`;
CREATE TABLE `shop_search` (
  `id` int(11) NOT NULL auto_increment,
  `keyword` varchar(255) NOT NULL COMMENT '搜索关键字',
  `num` int(5) default '0' COMMENT '搜索次数',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索关键字';

-- ----------------------------
-- Records of shop_search
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_series`
-- ----------------------------
DROP TABLE IF EXISTS `shop_series`;
CREATE TABLE `shop_series` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `price` float(10,2) NOT NULL default '0.00' COMMENT '销售价格',
  `nums` int(11) default NULL COMMENT '数量',
  `weight` float default NULL COMMENT '重量',
  `status` tinyint(1) default '1' COMMENT '1上架，0下架',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='捆绑销售表';

-- ----------------------------
-- Records of shop_series
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_series_relation`
-- ----------------------------
DROP TABLE IF EXISTS `shop_series_relation`;
CREATE TABLE `shop_series_relation` (
  `id` int(11) NOT NULL auto_increment,
  `series_id` int(11) default NULL COMMENT '捆绑ID',
  `goods_id` int(11) default NULL COMMENT '商品ID',
  `nums` int(11) default NULL COMMENT '数量',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='捆绑产品关系表';

-- ----------------------------
-- Records of shop_series_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_spec`
-- ----------------------------
DROP TABLE IF EXISTS `shop_spec`;
CREATE TABLE `shop_spec` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL COMMENT '规格名称',
  `value` text COMMENT '规格值',
  `type` tinyint(1) NOT NULL default '1' COMMENT '显示类型 1文字 2图片',
  `note` varchar(255) default NULL COMMENT '备注说明',
  `is_del` tinyint(1) default '0' COMMENT '是否删除1删除',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='规格表';

-- ----------------------------
-- Records of shop_spec
-- ----------------------------
INSERT INTO shop_spec VALUES ('74', '颜色', 'a:21:{i:0;s:9:\"军绿色\";i:1;s:9:\"天蓝色\";i:2;s:12:\"巧克力色\";i:3;s:6:\"桔色\";i:4;s:9:\"浅灰色\";i:5;s:9:\"浅黄色\";i:6;s:15:\"深卡其布色\";i:7;s:9:\"深灰色\";i:8;s:9:\"深紫色\";i:9;s:9:\"深蓝色\";i:10;s:6:\"白色\";i:11;s:9:\"粉红色\";i:12;s:9:\"紫罗兰\";i:13;s:6:\"紫色\";i:14;s:6:\"红色\";i:15;s:6:\"绿色\";i:16;s:6:\"花色\";i:17;s:6:\"蓝色\";i:18;s:9:\"酒红色\";i:19;s:6:\"黄色\";i:20;s:6:\"黑色\";}', '1', '女装', '0');
INSERT INTO shop_spec VALUES ('75', '尺码', 'a:6:{i:0;s:1:\"S\";i:1;s:1:\"M\";i:2;s:1:\"L\";i:3;s:2:\"XL\";i:4;s:3:\"XXL\";i:5;s:4:\"XXXL\";}', '1', '女装', '0');
INSERT INTO shop_spec VALUES ('76', '颜色', 'a:14:{i:0;s:39:\"upload/2011/05/26/20110526105352343.gif\";i:1;s:39:\"upload/2011/05/26/20110526105558440.gif\";i:2;s:39:\"upload/2011/05/26/20110526105401935.gif\";i:3;s:39:\"upload/2011/05/26/20110526105459733.gif\";i:4;s:39:\"upload/2011/05/26/20110526105515484.gif\";i:5;s:39:\"upload/2011/05/26/20110526105552192.gif\";i:6;s:39:\"upload/2011/05/26/20110526105340498.gif\";i:7;s:39:\"upload/2011/05/26/20110526105415915.gif\";i:8;s:39:\"upload/2011/05/26/20110526105509389.gif\";i:9;s:39:\"upload/2011/05/26/20110526105531851.gif\";i:10;s:39:\"upload/2011/05/26/20110526105538833.gif\";i:11;s:39:\"upload/2011/05/26/20110526105544210.gif\";i:12;s:39:\"upload/2011/05/26/20110526105606611.gif\";i:13;s:39:\"upload/2011/05/26/20110526105524752.gif\";}', '2', '通用', '0');
INSERT INTO shop_spec VALUES ('77', '尺码', 'a:6:{i:0;s:8:\"27(2尺)\";i:1;s:9:\"28(2尺1)\";i:2;s:9:\"29(2尺2)\";i:3;s:9:\"30(2尺3)\";i:4;s:9:\"31(2尺4)\";i:5;s:9:\"32(2尺5)\";}', '1', '裤子', '0');
INSERT INTO shop_spec VALUES ('78', '尺码', 'a:7:{i:0;s:1:\"S\";i:1;s:1:\"M\";i:2;s:1:\"L\";i:3;s:2:\"XL\";i:4;s:3:\"XXL\";i:5;s:4:\"XXXL\";i:6;s:6:\"均码\";}', '1', '上衣', '0');
INSERT INTO shop_spec VALUES ('79', '颜色', 'a:8:{i:0;s:9:\"军绿色\";i:1;s:9:\"靛蓝色\";i:2;s:12:\"巧克力色\";i:3;s:9:\"浅灰色\";i:4;s:6:\"黑色\";i:5;s:6:\"白色\";i:6;s:9:\"深蓝色\";i:7;s:6:\"红色\";}', '1', '裤子', '0');
INSERT INTO shop_spec VALUES ('80', '尺码', 'a:7:{i:0;s:2:\"39\";i:1;s:2:\"40\";i:2;s:2:\"41\";i:3;s:2:\"42\";i:4;s:2:\"43\";i:5;s:2:\"44\";i:6;s:2:\"45\";}', '1', '男鞋', '0');
INSERT INTO shop_spec VALUES ('81', '尺码', 'a:8:{i:0;s:2:\"34\";i:1;s:2:\"35\";i:2;s:2:\"36\";i:3;s:2:\"37\";i:4;s:2:\"38\";i:5;s:2:\"39\";i:6;s:2:\"40\";i:7;s:2:\"41\";}', '1', '女鞋', '0');
INSERT INTO shop_spec VALUES ('82', '套餐', 'a:3:{i:0;s:9:\"套餐一\";i:1;s:9:\"套餐二\";i:2;s:9:\"套餐三\";}', '1', '相机', '0');
INSERT INTO shop_spec VALUES ('83', '容量', 'a:1:{i:0;s:4:\"50ml\";}', '1', '', '0');

-- ----------------------------
-- Table structure for `shop_spec_photo`
-- ----------------------------
DROP TABLE IF EXISTS `shop_spec_photo`;
CREATE TABLE `shop_spec_photo` (
  `id` int(11) NOT NULL auto_increment,
  `address` varchar(255) default NULL COMMENT '图片地址',
  `name` varchar(100) default NULL COMMENT '图片名称',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='规格图片表';

-- ----------------------------
-- Records of shop_spec_photo
-- ----------------------------
INSERT INTO shop_spec_photo VALUES ('17', 'upload/2011/05/26/20110526105340498.gif', 'argental.gif', '2011-05-26 10:53:40');
INSERT INTO shop_spec_photo VALUES ('18', 'upload/2011/05/26/20110526105352343.gif', 'black.gif', '2011-05-26 10:53:52');
INSERT INTO shop_spec_photo VALUES ('19', 'upload/2011/05/26/20110526105401935.gif', 'blue.gif', '2011-05-26 10:54:01');
INSERT INTO shop_spec_photo VALUES ('20', 'upload/2011/05/26/20110526105415915.gif', 'brown.gif', '2011-05-26 10:54:15');
INSERT INTO shop_spec_photo VALUES ('21', 'upload/2011/05/26/20110526105459733.gif', 'gold.gif', '2011-05-26 10:54:59');
INSERT INTO shop_spec_photo VALUES ('22', 'upload/2011/05/26/20110526105509389.gif', 'gray.gif', '2011-05-26 10:55:09');
INSERT INTO shop_spec_photo VALUES ('23', 'upload/2011/05/26/20110526105515484.gif', 'green.gif', '2011-05-26 10:55:15');
INSERT INTO shop_spec_photo VALUES ('24', 'upload/2011/05/26/20110526105524752.gif', 'mixcolor.gif', '2011-05-26 10:55:24');
INSERT INTO shop_spec_photo VALUES ('25', 'upload/2011/05/26/20110526105531851.gif', 'orange.gif', '2011-05-26 10:55:31');
INSERT INTO shop_spec_photo VALUES ('26', 'upload/2011/05/26/20110526105538833.gif', 'pink.gif', '2011-05-26 10:55:38');
INSERT INTO shop_spec_photo VALUES ('27', 'upload/2011/05/26/20110526105544210.gif', 'purple.gif', '2011-05-26 10:55:44');
INSERT INTO shop_spec_photo VALUES ('28', 'upload/2011/05/26/20110526105552192.gif', 'red.gif', '2011-05-26 10:55:52');
INSERT INTO shop_spec_photo VALUES ('29', 'upload/2011/05/26/20110526105558440.gif', 'white.gif', '2011-05-26 10:55:58');
INSERT INTO shop_spec_photo VALUES ('30', 'upload/2011/05/26/20110526105606611.gif', 'yellow.gif', '2011-05-26 10:56:06');

-- ----------------------------
-- Table structure for `shop_suggestion`
-- ----------------------------
DROP TABLE IF EXISTS `shop_suggestion`;
CREATE TABLE `shop_suggestion` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `time` datetime default NULL COMMENT '提问时间',
  `admin_id` int(11) default NULL COMMENT '管理员ID',
  `re_content` text COMMENT '回复内容',
  `re_time` datetime default NULL COMMENT '回复时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='意见箱表';

-- ----------------------------
-- Records of shop_suggestion
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `shop_ticket`;
CREATE TABLE `shop_ticket` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL COMMENT '代金券名称',
  `value` float(10,2) NOT NULL default '0.00' COMMENT '代金券面额值',
  `start_time` datetime default NULL COMMENT '开始时间',
  `end_time` datetime default NULL COMMENT '结束时间',
  `point` int(11) NOT NULL default '0' COMMENT '兑换优惠券所需积分,如果是0表示禁止兑换',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券类型表';

-- ----------------------------
-- Records of shop_ticket
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_user`
-- ----------------------------
DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` varchar(250) default NULL COMMENT 'Email',
  `head_ico` varchar(250) default NULL COMMENT '头像',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of shop_user
-- ----------------------------
INSERT INTO shop_user VALUES ('1', 'zhangsan', '01d7f40760960e7bd9443513f22ab9af', '458820281@qq.com', null);

-- ----------------------------
-- Table structure for `shop_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `shop_user_group`;
CREATE TABLE `shop_user_group` (
  `id` int(11) NOT NULL auto_increment COMMENT '用户组ID',
  `group_name` varchar(20) NOT NULL COMMENT '组名',
  `discount` float NOT NULL default '0' COMMENT '折扣率',
  `minexp` int(11) default NULL COMMENT '最小经验',
  `maxexp` int(11) default NULL COMMENT '最大经验',
  `message_ids` varchar(255) default NULL COMMENT '消息ID',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组';

-- ----------------------------
-- Records of shop_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_withdraw`
-- ----------------------------
DROP TABLE IF EXISTS `shop_withdraw`;
CREATE TABLE `shop_withdraw` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` datetime NOT NULL COMMENT '时间',
  `amount` float(10,2) NOT NULL default '0.00' COMMENT '金额',
  `account` varchar(255) default NULL COMMENT '收款账号',
  `type` tinyint(1) default NULL COMMENT '1银行2支付宝等',
  `name` varchar(255) default NULL COMMENT '开户名',
  `account_bank` varchar(255) default NULL COMMENT '开户行',
  `belong_bank` varchar(255) default NULL COMMENT '所属银行',
  `status` tinyint(1) NOT NULL default '0' COMMENT '-1失败,0未处理,1处理中,2成功',
  `note` varchar(255) default NULL COMMENT '用户备注',
  `re_note` varchar(255) default NULL COMMENT '回复备注信息',
  `is_del` tinyint(1) NOT NULL default '0' COMMENT '0未删除,1已删除',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='提现记录';

-- ----------------------------
-- Records of shop_withdraw
-- ----------------------------
