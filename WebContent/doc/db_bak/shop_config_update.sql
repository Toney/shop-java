/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : javashop

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2012-05-02 17:34:09
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `shop_config`
-- ----------------------------
DROP TABLE IF EXISTS `shop_config`;
CREATE TABLE `shop_config` (
  `id` int(11) NOT NULL auto_increment,
  `syskey` varchar(255) default NULL,
  `sysvalue` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='网店配置表';

-- ----------------------------
-- Records of shop_config
-- ----------------------------
INSERT INTO shop_config VALUES ('1', 'email_type', '1');
INSERT INTO shop_config VALUES ('2', 'mail_address', '458820281@qq.com');
INSERT INTO shop_config VALUES ('3', 'smtp', null);
INSERT INTO shop_config VALUES ('4', 'smtp_user', null);
INSERT INTO shop_config VALUES ('5', 'smtp_pwd', null);
INSERT INTO shop_config VALUES ('6', 'smtp_port', null);
INSERT INTO shop_config VALUES ('7', 'order_by', null);
INSERT INTO shop_config VALUES ('8', 'order_type', null);
INSERT INTO shop_config VALUES ('9', 'list_type', null);
INSERT INTO shop_config VALUES ('10', 'list_num', null);
INSERT INTO shop_config VALUES ('11', 'auto_finish', null);
INSERT INTO shop_config VALUES ('12', 'index_slide', null);
INSERT INTO shop_config VALUES ('13', 'list_thumb_width', null);
INSERT INTO shop_config VALUES ('14', 'list_thumb_height', null);
INSERT INTO shop_config VALUES ('15', 'show_thumb_width', null);
INSERT INTO shop_config VALUES ('16', 'show_thumb_height', null);
INSERT INTO shop_config VALUES ('17', 'watermark', null);
INSERT INTO shop_config VALUES ('18', 'watermark_text', null);
INSERT INTO shop_config VALUES ('19', 'watermark_size', null);
INSERT INTO shop_config VALUES ('20', 'watermark_color', null);
INSERT INTO shop_config VALUES ('21', 'watermark_tran', null);
INSERT INTO shop_config VALUES ('22', 'watermark_position', null);
INSERT INTO shop_config VALUES ('23', 'name', '商城系统测试');
INSERT INTO shop_config VALUES ('24', 'url', 'http://localhost:8080/');
INSERT INTO shop_config VALUES ('25', 'master', '32');
INSERT INTO shop_config VALUES ('26', 'qq', '232323232');
INSERT INTO shop_config VALUES ('27', 'email', '32@s.com');
INSERT INTO shop_config VALUES ('28', 'mobile', '32');
INSERT INTO shop_config VALUES ('29', 'phone', '32');
INSERT INTO shop_config VALUES ('30', 'address', '32323');
INSERT INTO shop_config VALUES ('31', 'site_footer_code', null);
INSERT INTO shop_config VALUES ('32', 'tax', null);
INSERT INTO shop_config VALUES ('33', 'stockup_time', null);
INSERT INTO shop_config VALUES ('34', 'regiment_time_limit', null);
INSERT INTO shop_config VALUES ('35', 'index_seo_title', '32');
INSERT INTO shop_config VALUES ('36', 'index_seo_keywords', '32');
INSERT INTO shop_config VALUES ('37', 'index_seo_description', '32');
INSERT INTO shop_config VALUES ('38', 'goods_no_pre', '32');
INSERT INTO shop_config VALUES ('39', 'theme', 'default');
INSERT INTO shop_config VALUES ('40', 'weburl', 'http://localhost:8080/');
