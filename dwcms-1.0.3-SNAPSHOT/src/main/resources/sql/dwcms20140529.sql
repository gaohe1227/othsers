/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : dwcms

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2014-05-29 23:15:47
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dc_acquisition`
-- ----------------------------
DROP TABLE IF EXISTS `dc_acquisition`;
CREATE TABLE `dc_acquisition` (
  `acquisition_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `acq_name` varchar(50) NOT NULL COMMENT '采集名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '停止时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '当前状态(0:静止;1:采集;2:暂停)',
  `curr_num` int(11) NOT NULL DEFAULT '0' COMMENT '当前号码',
  `curr_item` int(11) NOT NULL DEFAULT '0' COMMENT '当前条数',
  `total_item` int(11) NOT NULL DEFAULT '0' COMMENT '每页总条数',
  `pause_time` int(11) NOT NULL DEFAULT '0' COMMENT '暂停时间(毫秒)',
  `page_encoding` varchar(20) NOT NULL DEFAULT 'GBK' COMMENT '页面编码',
  `plan_list` longtext COMMENT '采集列表',
  `dynamic_addr` varchar(255) DEFAULT NULL COMMENT '动态地址',
  `dynamic_start` int(11) DEFAULT NULL COMMENT '页码开始',
  `dynamic_end` int(11) DEFAULT NULL COMMENT '页码结束',
  `linkset_start` varchar(255) DEFAULT NULL COMMENT '内容链接区开始',
  `linkset_end` varchar(255) DEFAULT NULL COMMENT '内容链接区结束',
  `link_start` varchar(255) DEFAULT NULL COMMENT '内容链接开始',
  `link_end` varchar(255) DEFAULT NULL COMMENT '内容链接结束',
  `title_start` varchar(255) DEFAULT NULL COMMENT '标题开始',
  `title_end` varchar(255) DEFAULT NULL COMMENT '标题结束',
  `keywords_start` varchar(255) DEFAULT NULL COMMENT '关键字开始',
  `keywords_end` varchar(255) DEFAULT NULL COMMENT '关键字结束',
  `description_start` varchar(255) DEFAULT NULL COMMENT '描述开始',
  `description_end` varchar(255) DEFAULT NULL COMMENT '描述结束',
  `content_start` varchar(255) DEFAULT NULL COMMENT '内容开始',
  `content_end` varchar(255) DEFAULT NULL COMMENT '内容结束',
  `pagination_start` varchar(255) DEFAULT NULL COMMENT '内容分页开始',
  `pagination_end` varchar(255) DEFAULT NULL COMMENT '内容分页结束',
  PRIMARY KEY (`acquisition_id`),
  KEY `fk_jc_acquisition_channel` (`channel_id`),
  KEY `fk_jc_acquisition_contenttype` (`type_id`),
  KEY `fk_jc_acquisition_site` (`site_id`),
  KEY `fk_jc_acquisition_user` (`user_id`),
  CONSTRAINT `fk_jc_acquisition_channel` FOREIGN KEY (`channel_id`) REFERENCES `dc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_acquisition_contenttype` FOREIGN KEY (`type_id`) REFERENCES `dc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_acquisition_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`),
  CONSTRAINT `fk_jc_acquisition_user` FOREIGN KEY (`user_id`) REFERENCES `dc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS采集表';

-- ----------------------------
-- Records of dc_acquisition
-- ----------------------------
INSERT INTO `dc_acquisition` VALUES ('1', '1', '11', '1', '1', '新浪国内新闻', '2011-01-03 21:37:38', '2011-01-03 21:38:59', '0', '0', '0', '0', '500', 'GBK', 'http://roll.news.sina.com.cn/news/gnxw/gdxw1/index.shtml', 'http://roll.news.sina.com.cn/news/gnxw/gdxw1/index_[page].shtml', '2', '5', '<ul class=\"list_009\">', '</ul>', '<li><a href=\"', '\" target=\"_blank\"', '<title>', '_新闻中心_新浪网</title>', null, null, null, null, ' f_id=\'3\' -->', '<!-- publish_helper_end -->', null, null);
INSERT INTO `dc_acquisition` VALUES ('2', '1', '16', '1', '1', '影视娱乐', null, null, '0', '0', '0', '0', '500', 'GBK', 'http://news.ewang.com/tvprogram/programnews/', 'http://news.ewang.com/tvprogram/programnews/index_[page].html', '2', '3', '<ul>', '<div class=\"mainNesting\">', 'href=\"', '\" target=_blank>', '<title>', ' - 新媒体娱乐中心 - 光线易视</title>', null, null, null, null, 'align=\"center\" border=\"0\" /></p>', '</div>', null, null);

-- ----------------------------
-- Table structure for `dc_advertising`
-- ----------------------------
DROP TABLE IF EXISTS `dc_advertising`;
CREATE TABLE `dc_advertising` (
  `advertising_id` int(11) NOT NULL AUTO_INCREMENT,
  `adspace_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '广告名称',
  `category` varchar(50) NOT NULL COMMENT '广告类型',
  `ad_code` longtext COMMENT '广告代码',
  `ad_weight` int(11) NOT NULL DEFAULT '1' COMMENT '广告权重',
  `display_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现次数',
  `click_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`advertising_id`),
  KEY `fk_jc_advertising_site` (`site_id`),
  KEY `fk_jc_space_advertising` (`adspace_id`),
  CONSTRAINT `fk_jc_advertising_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`),
  CONSTRAINT `fk_jc_space_advertising` FOREIGN KEY (`adspace_id`) REFERENCES `dc_advertising_space` (`adspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS广告表';

-- ----------------------------
-- Records of dc_advertising
-- ----------------------------
INSERT INTO `dc_advertising` VALUES ('1', '1', '2', 'banner', 'image', null, '1', '122', '131', '2014-04-27', '2014-04-27', '1');
INSERT INTO `dc_advertising` VALUES ('2', '1', '2', '通栏广告', 'image', null, '2', '3', '2', '2014-04-27', '2014-04-27', '1');
INSERT INTO `dc_advertising` VALUES ('3', '2', '2', 'TESTTT', 'text', null, '12', '122', '12', '2014-04-27', '2014-04-27', '0');
INSERT INTO `dc_advertising` VALUES ('4', '2', '2', 'Flash广告', 'flash', null, '2', '121', '12', '2014-04-27', '2014-04-27', '1');

-- ----------------------------
-- Table structure for `dc_advertising_attr`
-- ----------------------------
DROP TABLE IF EXISTS `dc_advertising_attr`;
CREATE TABLE `dc_advertising_attr` (
  `advertising_id` int(11) NOT NULL,
  `attr_name` varchar(50) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_params_advertising` (`advertising_id`),
  CONSTRAINT `fk_jc_params_advertising` FOREIGN KEY (`advertising_id`) REFERENCES `dc_advertising` (`advertising_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS广告属性表';

-- ----------------------------
-- Records of dc_advertising_attr
-- ----------------------------
INSERT INTO `dc_advertising_attr` VALUES ('1', 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `dc_advertising_attr` VALUES ('1', 'image_width', '735');
INSERT INTO `dc_advertising_attr` VALUES ('1', 'image_height', '70');
INSERT INTO `dc_advertising_attr` VALUES ('1', 'image_link', 'http://www.jeecms.com');
INSERT INTO `dc_advertising_attr` VALUES ('1', 'image_title', '查看DWCMS官方网站');
INSERT INTO `dc_advertising_attr` VALUES ('1', 'image_target', '_blank');
INSERT INTO `dc_advertising_attr` VALUES ('2', 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `dc_advertising_attr` VALUES ('2', 'image_width', '960');
INSERT INTO `dc_advertising_attr` VALUES ('2', 'image_height', '60');
INSERT INTO `dc_advertising_attr` VALUES ('2', 'image_link', 'http://www.doadway.com');
INSERT INTO `dc_advertising_attr` VALUES ('2', 'image_title', 'DWCMS官方网站');
INSERT INTO `dc_advertising_attr` VALUES ('2', 'image_target', '_blank');
INSERT INTO `dc_advertising_attr` VALUES ('4', 'flash_url', '/u/cms/www/201404/27102135j3m6.jpg');
INSERT INTO `dc_advertising_attr` VALUES ('4', 'flash_width', '12');
INSERT INTO `dc_advertising_attr` VALUES ('4', 'flash_height', '12');
INSERT INTO `dc_advertising_attr` VALUES ('3', 'text_title', 'TESTTT');
INSERT INTO `dc_advertising_attr` VALUES ('3', 'text_link', 'dfs');
INSERT INTO `dc_advertising_attr` VALUES ('3', 'text_color', '#0033CC');
INSERT INTO `dc_advertising_attr` VALUES ('3', 'text_font', '12px');
INSERT INTO `dc_advertising_attr` VALUES ('3', 'text_target', '_blank');

-- ----------------------------
-- Table structure for `dc_advertising_space`
-- ----------------------------
DROP TABLE IF EXISTS `dc_advertising_space`;
CREATE TABLE `dc_advertising_space` (
  `adspace_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_enabled` char(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`adspace_id`),
  KEY `fk_jc_adspace_site` (`site_id`),
  CONSTRAINT `fk_jc_adspace_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS广告版位表';

-- ----------------------------
-- Records of dc_advertising_space
-- ----------------------------
INSERT INTO `dc_advertising_space` VALUES ('1', '2', '页头banner2', '页头banner2', '1');
INSERT INTO `dc_advertising_space` VALUES ('2', '2', '通栏广告11', '通栏广告11', '1');

-- ----------------------------
-- Table structure for `dc_channel`
-- ----------------------------
DROP TABLE IF EXISTS `dc_channel`;
CREATE TABLE `dc_channel` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '父栏目ID',
  `channel_path` varchar(30) DEFAULT NULL COMMENT '访问路径',
  `lft` int(11) NOT NULL DEFAULT '1' COMMENT '树左边',
  `rgt` int(11) NOT NULL DEFAULT '2' COMMENT '树右边',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`channel_id`),
  KEY `fk_jc_channel_model` (`model_id`),
  KEY `fk_jc_channel_parent` (`parent_id`),
  KEY `fk_jc_channel_site` (`site_id`),
  CONSTRAINT `fk_jc_channel_model` FOREIGN KEY (`model_id`) REFERENCES `dc_model` (`model_id`),
  CONSTRAINT `fk_jc_channel_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='CMS栏目表';

-- ----------------------------
-- Records of dc_channel
-- ----------------------------
INSERT INTO `dc_channel` VALUES ('1', '1', '1', '0', 'news', '1', '12', '1', '1', '0');
INSERT INTO `dc_channel` VALUES ('2', '1', '1', '0', 'ent', '13', '20', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('3', '1', '1', '0', 'finance', '21', '30', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('4', '1', '1', '0', 'house', '31', '40', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('5', '1', '1', '0', 'sports', '41', '48', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('6', '1', '1', '0', 'tech', '49', '56', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('7', '1', '1', '0', 'car', '57', '64', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('9', '4', '1', '0', 'download', '65', '72', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('10', '2', '2', '0', 'about', '0', '0', '10', '0', '1');
INSERT INTO `dc_channel` VALUES ('11', '1', '1', '1', 'gnxw', '2', '3', '12', '1', '1');
INSERT INTO `dc_channel` VALUES ('12', '1', '1', '1', 'world', '4', '5', '1', '1', '1');
INSERT INTO `dc_channel` VALUES ('13', '1', '1', '1', 'shehui', '6', '7', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('14', '1', '1', '1', 'review', '8', '9', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('15', '3', '1', '1', 'photo', '10', '11', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('16', '1', '1', '2', 'tv', '14', '15', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('17', '1', '1', '2', 'film', '16', '17', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('18', '1', '1', '2', 'star', '18', '19', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('19', '1', '1', '3', 'stock', '22', '23', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('20', '1', '1', '3', 'money', '24', '25', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('21', '1', '1', '3', 'fund', '26', '27', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('22', '1', '1', '3', 'chinext', '28', '29', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('23', '1', '1', '4', 'fczc', '32', '33', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('24', '1', '1', '4', 'lsck', '34', '35', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('25', '1', '1', '4', 'home', '36', '37', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('26', '1', '1', '4', 'esf', '38', '39', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('27', '1', '1', '5', 'basketball', '42', '43', '3', '1', '1');
INSERT INTO `dc_channel` VALUES ('28', '1', '1', '5', 'football', '44', '45', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('29', '1', '1', '5', 'lottery', '46', '47', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('30', '1', '1', '6', 'internet', '50', '51', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('31', '1', '1', '6', 'discovery', '52', '53', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('32', '1', '1', '6', 'digi', '54', '55', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('33', '1', '2', '7', 'newcar', '0', '0', '10', '0', '1');
INSERT INTO `dc_channel` VALUES ('34', '1', '1', '7', 'acby', '60', '61', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('35', '1', '1', '7', 'zjy', '62', '63', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('37', '4', '1', '9', 'system', '66', '67', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('38', '4', '1', '9', 'network', '68', '69', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('39', '4', '1', '9', 'media', '70', '71', '10', '1', '1');
INSERT INTO `dc_channel` VALUES ('40', '1', '1', '0', 'AA', '0', '0', '12', '0', '1');

-- ----------------------------
-- Table structure for `dc_channel_attr`
-- ----------------------------
DROP TABLE IF EXISTS `dc_channel_attr`;
CREATE TABLE `dc_channel_attr` (
  `channel_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_channel` (`channel_id`),
  CONSTRAINT `fk_jc_attr_channel` FOREIGN KEY (`channel_id`) REFERENCES `dc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目扩展属性表';

-- ----------------------------
-- Records of dc_channel_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_channel_ext`
-- ----------------------------
DROP TABLE IF EXISTS `dc_channel_ext`;
CREATE TABLE `dc_channel_ext` (
  `channel_id` int(11) NOT NULL,
  `channel_name` varchar(100) NOT NULL COMMENT '名称',
  `final_step` tinyint(4) DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) DEFAULT NULL COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_static_channel` char(1) NOT NULL DEFAULT '0' COMMENT '是否栏目静态化',
  `is_static_content` char(1) NOT NULL DEFAULT '0' COMMENT '是否内容静态化',
  `is_access_by_dir` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用目录访问',
  `is_list_child` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用子栏目列表',
  `page_size` int(11) NOT NULL DEFAULT '20' COMMENT '每页多少条记录',
  `channel_rule` varchar(150) DEFAULT NULL COMMENT '栏目页生成规则',
  `content_rule` varchar(150) DEFAULT NULL COMMENT '内容页生成规则',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_channel` varchar(100) DEFAULT NULL COMMENT '栏目页模板',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '内容页模板',
  `title_img` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有缩略图',
  `has_content_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有内容图',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图高度',
  `comment_control` int(11) NOT NULL DEFAULT '0' COMMENT '评论(0:匿名;1:会员;2:关闭)',
  `allow_updown` tinyint(1) NOT NULL DEFAULT '1' COMMENT '顶踩(true:开放;false:关闭)',
  `is_blank` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否新窗口打开',
  `title` varchar(255) DEFAULT NULL COMMENT 'TITLE',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'KEYWORDS',
  `description` varchar(255) DEFAULT NULL COMMENT 'DESCRIPTION',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_ext_channel` FOREIGN KEY (`channel_id`) REFERENCES `dc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目内容表';

-- ----------------------------
-- Records of dc_channel_ext
-- ----------------------------
INSERT INTO `dc_channel_ext` VALUES ('1', '新闻资讯', '0', '0', '1', '1', '1', '1', '20', null, null, 'news.baidu.com', '/WEB-INF/t/cms/www/red/channel/新闻栏目_父级.html', null, null, null, '0', '0', '139', '139', '310', '310', '1', '0', '0', '新闻资讯', '新闻资讯', '新闻资讯');
INSERT INTO `dc_channel_ext` VALUES ('2', '影视娱乐', '0', '0', '0', '0', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/red/channel/新闻栏目_父级.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '影视娱乐', '影视娱乐', '影视娱乐');
INSERT INTO `dc_channel_ext` VALUES ('3', '财经报道', '0', '0', '0', '0', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/red/channel/新闻栏目_父级.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '财经报道', '财经报道', '财经报道');
INSERT INTO `dc_channel_ext` VALUES ('4', '房产资讯', '0', '0', '0', '0', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/red/channel/新闻栏目_父级.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '房产资讯', '房产资讯', '房产资讯');
INSERT INTO `dc_channel_ext` VALUES ('5', '体育世界', '0', '0', '0', '0', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/red/channel/新闻栏目_父级.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '体育世界', '体育世界', '体育世界');
INSERT INTO `dc_channel_ext` VALUES ('6', '科技创新', '0', '0', '0', '0', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/red/channel/新闻栏目_父级.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '科技创新', '科技创新', '科技创新');
INSERT INTO `dc_channel_ext` VALUES ('7', '时尚汽车', '0', '0', '0', '0', '0', '0', '20', null, null, null, '/WEB-INF/t/cms/www/red/channel/新闻栏目_父级.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '时尚汽车', '时尚汽车', '时尚汽车');
INSERT INTO `dc_channel_ext` VALUES ('9', '下载中心', '0', '0', '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '下载中心', '下载中心', '下载中心');
INSERT INTO `dc_channel_ext` VALUES ('10', '关于我们', '0', '0', '0', '0', '0', '0', '0', null, null, '', '/red/channel/新闻栏目_父级.html', null, null, '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '关于我们', '关于我们', '关于我们');
INSERT INTO `dc_channel_ext` VALUES ('11', '国内新闻', '0', '0', '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '国内新闻', '国内新闻', '国内新闻');
INSERT INTO `dc_channel_ext` VALUES ('12', '国际新闻', '0', '0', '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '国际新闻', '国际新闻', '国际新闻');
INSERT INTO `dc_channel_ext` VALUES ('13', '社会热点', '0', '0', '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '社会热点', '社会热点', '社会热点');
INSERT INTO `dc_channel_ext` VALUES ('14', '时事评论', '0', '0', '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '时事评论', '时事评论', '时事评论');
INSERT INTO `dc_channel_ext` VALUES ('15', '图片新闻', '0', '0', '0', '0', '1', '0', '20', null, null, null, null, null, null, null, '1', '0', '139', '139', '310', '310', '0', '1', '0', '图片新闻', '图片新闻', '图片新闻');
INSERT INTO `dc_channel_ext` VALUES ('16', '电视前沿', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '电视前沿', '电视前沿', '电视前沿');
INSERT INTO `dc_channel_ext` VALUES ('17', '电影快报', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '电影快报', '电影快报', '电影快报');
INSERT INTO `dc_channel_ext` VALUES ('18', '影视明星', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '影视明星', '影视明星', '影视明星');
INSERT INTO `dc_channel_ext` VALUES ('19', '股市行情', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '股市行情', '股市行情', '股市行情');
INSERT INTO `dc_channel_ext` VALUES ('20', '理财之道', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '理财之道', '理财之道', '理财之道');
INSERT INTO `dc_channel_ext` VALUES ('21', '基金视点', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '基金视点', '基金视点', '基金视点');
INSERT INTO `dc_channel_ext` VALUES ('22', '创业板', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '创业板', '创业板', '创业板');
INSERT INTO `dc_channel_ext` VALUES ('23', '房产政策', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '房产政策', '房产政策', '房产政策');
INSERT INTO `dc_channel_ext` VALUES ('24', '楼市参考', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '楼市参考', '楼市参考', '楼市参考');
INSERT INTO `dc_channel_ext` VALUES ('25', '生活家居', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '生活家居', '生活家居', '生活家居');
INSERT INTO `dc_channel_ext` VALUES ('26', '二手房', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '二手房', '二手房', '二手房');
INSERT INTO `dc_channel_ext` VALUES ('27', '篮球世界', '0', '0', '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '篮球世界', '篮球世界', '篮球世界');
INSERT INTO `dc_channel_ext` VALUES ('28', '足球世界', '0', '0', '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '足球世界', '足球世界', '足球世界');
INSERT INTO `dc_channel_ext` VALUES ('29', '体育彩票', '0', '0', '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '体育彩票', '体育彩票', '体育彩票');
INSERT INTO `dc_channel_ext` VALUES ('30', '互联网', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '互联网', '互联网', '互联网');
INSERT INTO `dc_channel_ext` VALUES ('31', '科学探索', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '科学探索', '科学探索', '科学探索');
INSERT INTO `dc_channel_ext` VALUES ('32', '数码世界', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '数码世界', '数码世界', '数码世界');
INSERT INTO `dc_channel_ext` VALUES ('33', '新车上市', '0', '0', '0', '0', '0', '0', '20', '', '', '', '/red/channel/新闻栏目_父级.html', '/red/content/新闻内容.html', '', null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '新车上市', '新车上市', '新车上市');
INSERT INTO `dc_channel_ext` VALUES ('34', '爱车保养', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '爱车保养', '爱车保养', '爱车保养');
INSERT INTO `dc_channel_ext` VALUES ('35', '自驾游', null, null, '0', '0', '0', '0', '20', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', '自驾游', '自驾游', '自驾游');
INSERT INTO `dc_channel_ext` VALUES ('37', '系统软件', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/www/red/channel/下载栏目_二级.html', null, null, null, '0', '1', '139', '139', '139', '98', '0', '1', '0', '系统软件', '系统软件', '系统软件');
INSERT INTO `dc_channel_ext` VALUES ('38', '网络工具', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/www/red/channel/下载栏目_二级.html', null, null, null, '0', '1', '139', '139', '139', '98', '0', '1', '0', '网络工具', '网络工具', '网络工具');
INSERT INTO `dc_channel_ext` VALUES ('39', '媒体工具', null, null, '0', '0', '1', '0', '20', null, null, null, '/WEB-INF/t/cms/www/red/channel/下载栏目_二级.html', null, null, null, '0', '1', '139', '139', '139', '98', '0', '1', '0', '媒体工具', '媒体工具', '媒体工具');
INSERT INTO `dc_channel_ext` VALUES ('40', 'AA1', '12', '0', '0', '0', '0', '0', '0', 'AA', '', '12', '/red/channel/新闻栏目_父级.html', '/red/content/新闻内容.html', '', null, '1', '1', '12', '12', '12', '12', '0', '1', '0', 'AA', 'AA', 'AA');

-- ----------------------------
-- Table structure for `dc_channel_txt`
-- ----------------------------
DROP TABLE IF EXISTS `dc_channel_txt`;
CREATE TABLE `dc_channel_txt` (
  `channel_id` int(11) NOT NULL,
  `txt` longtext COMMENT '栏目内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_txt_channel` FOREIGN KEY (`channel_id`) REFERENCES `dc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目文本表';

-- ----------------------------
-- Records of dc_channel_txt
-- ----------------------------
INSERT INTO `dc_channel_txt` VALUES ('10', '<p><span style=\"font-size:x-small;\">&nbsp;&nbsp;&nbsp; DWCMS是JavaEE版网站管理系统（Java Enterprise Edition Content Manage System）的简称。</span></p>\r\n<p><span style=\"font-size:x-small;\">&nbsp;&nbsp;&nbsp;&nbsp;Java凭借其强大、稳定、安全、高效等多方面的优势，一直是企业级应用的首选。在国外基于JavaEE技术的CMS已经发展的相当成熟，但授权费昂贵，一般需几十万一套；而国内在这方面一直比较薄弱，至今没有一款基于JavaEE技术的开源免费CMS产品。这次我们本着\"大气开源，诚信图强\"的原则将我们开发的这套DWCMS系统源码完全公布，希望能为国内JavaEE技术的发展尽自己的一份力量。</span></p>\r\n<p><span style=\"font-size:x-small;\">&nbsp; &nbsp;&nbsp;</span><span style=\"font-size:small;\">DWCMS</span><span style=\"font-size:x-small;\">使用目前java主流技术架构：Mybatis3+spring3+velocity。AJAX使用jquery和json实现。视图层并没有使用传统的 JSP技术，而是使用更为专业、灵活、高效freemarker。 数据库使用MYSQL，并可支持orcale、DB2、SQLServer等主流数据库。应用服务器使用tomcat，并支持其他weblogic、 websphere等应用服务器。</span></p>\r\n<p><span style=\"font-size:x-small;\">&nbsp; &nbsp;&nbsp;</span><span style=\"font-size:small;\">DWCMS</span><span style=\"font-size:x-small;\">并不是一个只追求技术之先进，而不考虑用户实际使用的象牙塔CMS。系统的设计宗旨就是从用户的需求出发，提供最便利、合理的使用方式，懂html就能建站，从设计上满足搜索引擎优化，最小性能消耗满足小网站要求、可扩展群集满足大网站需要。</span></p>\r\n<p><span style=\"font-size:x-small;\">&nbsp;&nbsp;&nbsp;&nbsp;很多人觉得java、jsp难掌握，技术门槛高。dwcms具有强大的模板机制。所有前台页面均由模板生成，通过在线编辑模板轻松调整页面显示。模板内容不涉及任何java和jsp技术，只需掌握html语法和dwcms标签即可完成动态网页制作。</span></p>\r\n<p><span style=\"font-size:x-small;\">&nbsp;&nbsp;&nbsp;&nbsp;强大、灵活的标签。提供两种风格的标签，一种风格的标签封装了大量互联网上常见的显示样式，通过调整参数就可实现文章列表、图文混排、图文滚动、跑马灯、焦点图等效果。这种标签的优势在于页面制作简单、效率高，对js、css、html不够精通和希望快速建站的用户非常适用。并且各种效果的内容不使用js生成，对搜索引擎非常友好。另一种风格的标签只负责读取数据，由用户自己控制显示内容和显示方式，想到什么就能做到什么，对于技术能力高和追求个性化的用户，可谓如鱼得水。</span></p>\r\n<p><span style=\"font-size:x-small;\">&nbsp;&nbsp;&nbsp;&nbsp;采用完全生成静态页面技术，加快页面访问速度，提升搜索引擎友好性；采用扁平的、可自定义的路径结构。对于有特别需求者，可自定义页面后缀，如.php,.asp,.aspx等。</span></p>\r\n<p><span style=\"font-size:x-small;\">&nbsp;&nbsp;&nbsp;&nbsp;站群设计，对于大型的网站，往往需要通过次级域名建立子站群，各个子站后台管理权限可以分离，程序和附件分离，前台用户实现单点登录，大规模网站轻松建设。</span></p>', null, null, null);

-- ----------------------------
-- Table structure for `dc_channel_user`
-- ----------------------------
DROP TABLE IF EXISTS `dc_channel_user`;
CREATE TABLE `dc_channel_user` (
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`user_id`),
  KEY `fk_jc_channel_user` (`user_id`),
  CONSTRAINT `fk_jc_channel_user` FOREIGN KEY (`user_id`) REFERENCES `dc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_channel` FOREIGN KEY (`channel_id`) REFERENCES `dc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目用户关联表';

-- ----------------------------
-- Records of dc_channel_user
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_chnl_group_contri`
-- ----------------------------
DROP TABLE IF EXISTS `dc_chnl_group_contri`;
CREATE TABLE `dc_chnl_group_contri` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_c` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_c` FOREIGN KEY (`group_id`) REFERENCES `dc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_c` FOREIGN KEY (`channel_id`) REFERENCES `dc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目投稿会员组关联表';

-- ----------------------------
-- Records of dc_chnl_group_contri
-- ----------------------------
INSERT INTO `dc_chnl_group_contri` VALUES ('1', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('2', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('3', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('4', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('5', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('6', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('7', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('11', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('12', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('13', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('14', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('15', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('16', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('17', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('18', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('19', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('20', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('21', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('22', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('23', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('24', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('25', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('26', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('27', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('28', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('29', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('30', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('31', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('32', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('33', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('34', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('35', '1');
INSERT INTO `dc_chnl_group_contri` VALUES ('40', '1');

-- ----------------------------
-- Table structure for `dc_chnl_group_view`
-- ----------------------------
DROP TABLE IF EXISTS `dc_chnl_group_view`;
CREATE TABLE `dc_chnl_group_view` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_v` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_v` FOREIGN KEY (`group_id`) REFERENCES `dc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_v` FOREIGN KEY (`channel_id`) REFERENCES `dc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目浏览会员组关联表';

-- ----------------------------
-- Records of dc_chnl_group_view
-- ----------------------------
INSERT INTO `dc_chnl_group_view` VALUES ('40', '1');
INSERT INTO `dc_chnl_group_view` VALUES ('1', '2');
INSERT INTO `dc_chnl_group_view` VALUES ('40', '2');
INSERT INTO `dc_chnl_group_view` VALUES ('1', '3');

-- ----------------------------
-- Table structure for `dc_comment`
-- ----------------------------
DROP TABLE IF EXISTS `dc_comment`;
CREATE TABLE `dc_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user_id` int(11) DEFAULT NULL COMMENT '评论用户ID',
  `reply_user_id` int(11) DEFAULT NULL COMMENT '回复用户ID',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `ups` smallint(6) NOT NULL DEFAULT '0' COMMENT '支持数',
  `downs` smallint(6) NOT NULL DEFAULT '0' COMMENT '反对数',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  PRIMARY KEY (`comment_id`),
  KEY `fk_jc_comment_content` (`content_id`),
  KEY `fk_jc_comment_reply` (`reply_user_id`),
  KEY `fk_jc_comment_site` (`site_id`),
  KEY `fk_jc_comment_user` (`comment_user_id`),
  CONSTRAINT `fk_jc_comment_content` FOREIGN KEY (`content_id`) REFERENCES `dc_content` (`content_id`),
  CONSTRAINT `fk_jc_comment_reply` FOREIGN KEY (`reply_user_id`) REFERENCES `dc_user` (`user_id`),
  CONSTRAINT `fk_jc_comment_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`),
  CONSTRAINT `fk_jc_comment_user` FOREIGN KEY (`comment_user_id`) REFERENCES `dc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='CMS评论表';

-- ----------------------------
-- Records of dc_comment
-- ----------------------------
INSERT INTO `dc_comment` VALUES ('1', '1', null, '52', '1', '2011-01-04 10:11:01', null, '0', '0', '0', '0');
INSERT INTO `dc_comment` VALUES ('2', '1', null, '52', '1', '2011-01-04 10:11:42', null, '0', '0', '0', '1');
INSERT INTO `dc_comment` VALUES ('4', null, null, '52', '1', '2011-01-04 10:12:55', null, '0', '0', '1', '1');
INSERT INTO `dc_comment` VALUES ('5', '1', null, '171', '1', '2011-01-04 14:38:40', null, '0', '0', '1', '1');
INSERT INTO `dc_comment` VALUES ('6', '1', null, '170', '1', '2011-01-04 14:39:11', null, '0', '0', '1', '1');
INSERT INTO `dc_comment` VALUES ('7', '1', null, '167', '1', '2011-01-04 14:42:17', null, '0', '0', '1', '1');
INSERT INTO `dc_comment` VALUES ('8', '1', null, '167', '1', '2011-01-04 14:54:00', null, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `dc_comment_ext`
-- ----------------------------
DROP TABLE IF EXISTS `dc_comment_ext`;
CREATE TABLE `dc_comment_ext` (
  `comment_id` int(11) NOT NULL,
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `text` longtext COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  KEY `fk_jc_ext_comment` (`comment_id`),
  CONSTRAINT `fk_jc_ext_comment` FOREIGN KEY (`comment_id`) REFERENCES `dc_comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论扩展表';

-- ----------------------------
-- Records of dc_comment_ext
-- ----------------------------
INSERT INTO `dc_comment_ext` VALUES ('1', '127.0.0.1', 'eewewew', '');
INSERT INTO `dc_comment_ext` VALUES ('2', '127.0.0.1', 'frtrtrtr', 'ewq');
INSERT INTO `dc_comment_ext` VALUES ('4', '127.0.0.1', 'AASDSA', 'SS');
INSERT INTO `dc_comment_ext` VALUES ('5', '192.168.0.1', '很好，不错', '');
INSERT INTO `dc_comment_ext` VALUES ('6', '192.168.0.1', '是该抽了', '');
INSERT INTO `dc_comment_ext` VALUES ('7', '192.168.0.1', '拍电影累了，是该好好歇歇了，冰冰，我支持你息影', '');
INSERT INTO `dc_comment_ext` VALUES ('8', '192.168.0.1', '可惜了，资源浪费啊88521', '1123');

-- ----------------------------
-- Table structure for `dc_config`
-- ----------------------------
DROP TABLE IF EXISTS `dc_config`;
CREATE TABLE `dc_config` (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) DEFAULT '/JeeCms' COMMENT '部署路径',
  `servlet_point` varchar(20) DEFAULT NULL COMMENT 'Servlet挂载点',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `db_file_uri` varchar(50) NOT NULL DEFAULT '/dbfile.svl?n=' COMMENT '数据库附件访问地址',
  `is_upload_to_db` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传附件至数据库',
  `def_img` varchar(255) NOT NULL DEFAULT '/JeeCms/r/cms/www/default/no_picture.gif' COMMENT '图片不存在时默认图片',
  `login_url` varchar(255) NOT NULL DEFAULT '/login.jspx' COMMENT '登录地址',
  `process_url` varchar(255) DEFAULT NULL COMMENT '登录后处理地址',
  `mark_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启图片水印',
  `mark_width` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小宽度',
  `mark_height` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小高度',
  `mark_image` varchar(100) DEFAULT '/r/cms/www/watermark.png' COMMENT '图片水印',
  `mark_content` varchar(100) NOT NULL DEFAULT 'www.jeecms.com' COMMENT '文字水印内容',
  `mark_size` int(11) NOT NULL DEFAULT '20' COMMENT '文字水印大小',
  `mark_color` varchar(10) NOT NULL DEFAULT '#FF0000' COMMENT '文字水印颜色',
  `mark_alpha` int(11) NOT NULL DEFAULT '50' COMMENT '水印透明度（0-100）',
  `mark_position` int(11) NOT NULL DEFAULT '1' COMMENT '水印位置(0-5)',
  `mark_offset_x` int(11) NOT NULL DEFAULT '0' COMMENT 'x坐标偏移量',
  `mark_offset_y` int(11) NOT NULL DEFAULT '0' COMMENT 'y坐标偏移量',
  `count_clear_time` date NOT NULL COMMENT '计数器清除时间',
  `count_copy_time` datetime NOT NULL COMMENT '计数器拷贝时间',
  `download_code` varchar(32) NOT NULL DEFAULT 'jeecms' COMMENT '下载防盗链md5混淆码',
  `download_time` int(11) NOT NULL DEFAULT '12' COMMENT '下载有效时间（小时）',
  `email_host` varchar(50) DEFAULT NULL COMMENT '邮件发送服务器',
  `email_encoding` varchar(20) DEFAULT NULL COMMENT '邮件发送编码',
  `email_username` varchar(100) DEFAULT NULL COMMENT '邮箱用户名',
  `email_password` varchar(100) DEFAULT NULL COMMENT '邮箱密码',
  `email_personal` varchar(100) DEFAULT NULL COMMENT '邮箱发件人',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置表';

-- ----------------------------
-- Records of dc_config
-- ----------------------------
INSERT INTO `dc_config` VALUES ('1', '/dwcms', null, '8082', '/dbfile.svl?n=', '0', '/r/cms/www/no_picture.gif', '/login.jspx', null, '1', '120', '120', '/r/cms/www/watermark.png', 'www.jeecms.com', '20', '#FF0000', '50', '1', '0', '0', '2011-06-06', '2011-06-06 17:21:39', 'jeecms', '12', null, null, null, null, null);

-- ----------------------------
-- Table structure for `dc_config_attr`
-- ----------------------------
DROP TABLE IF EXISTS `dc_config_attr`;
CREATE TABLE `dc_config_attr` (
  `config_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_config` (`config_id`),
  CONSTRAINT `fk_jc_attr_config` FOREIGN KEY (`config_id`) REFERENCES `dc_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置属性表';

-- ----------------------------
-- Records of dc_config_attr
-- ----------------------------
INSERT INTO `dc_config_attr` VALUES ('1', 'password_min_len', '4');
INSERT INTO `dc_config_attr` VALUES ('1', 'username_reserved', '*admin*');
INSERT INTO `dc_config_attr` VALUES ('1', 'register_on', 'true');
INSERT INTO `dc_config_attr` VALUES ('1', 'member_on', 'true');
INSERT INTO `dc_config_attr` VALUES ('1', 'username_min_len', '5');
INSERT INTO `dc_config_attr` VALUES ('1', 'version', 'jeecms-3.1.1-final');

-- ----------------------------
-- Table structure for `dc_content`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content`;
CREATE TABLE `dc_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL COMMENT '栏目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type_id` int(11) NOT NULL COMMENT '属性ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `sort_date` datetime NOT NULL COMMENT '排序日期',
  `top_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '固顶级别',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有标题图',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站)',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  PRIMARY KEY (`content_id`),
  KEY `fk_jc_content_site` (`site_id`),
  KEY `fk_jc_content_type` (`type_id`),
  KEY `fk_jc_content_user` (`user_id`),
  KEY `fk_jc_contentchannel` (`channel_id`),
  CONSTRAINT `fk_jc_contentchannel` FOREIGN KEY (`channel_id`) REFERENCES `dc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_content_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`),
  CONSTRAINT `fk_jc_content_type` FOREIGN KEY (`type_id`) REFERENCES `dc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_content_user` FOREIGN KEY (`user_id`) REFERENCES `dc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COMMENT='CMS内容表';

-- ----------------------------
-- Records of dc_content
-- ----------------------------
INSERT INTO `dc_content` VALUES ('34', '11', '1', '4', '1', '2011-01-03 21:38:30', '0', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('35', '11', '1', '1', '1', '2011-01-03 21:38:31', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('36', '11', '1', '1', '1', '2011-01-03 21:38:32', '0', '0', '0', '3', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('37', '11', '1', '1', '1', '2011-01-03 21:38:33', '0', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('38', '11', '1', '1', '1', '2011-01-03 21:38:35', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('39', '11', '1', '4', '1', '2011-01-03 21:38:36', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('40', '11', '1', '1', '1', '2011-01-03 21:38:38', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('41', '11', '1', '1', '1', '2011-01-03 21:38:39', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('42', '11', '1', '1', '1', '2011-01-03 21:38:40', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('43', '11', '1', '1', '1', '2011-01-03 21:38:42', '0', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('44', '11', '1', '1', '1', '2011-01-03 21:38:45', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('45', '11', '1', '1', '1', '2011-01-03 21:38:48', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('46', '11', '1', '1', '1', '2011-01-03 21:38:49', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('47', '11', '1', '1', '1', '2011-01-03 21:38:51', '0', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('48', '11', '1', '1', '1', '2011-01-03 21:38:53', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('49', '11', '1', '1', '1', '2011-01-03 21:38:54', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('50', '11', '1', '1', '1', '2011-01-03 21:38:56', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('51', '11', '1', '1', '1', '2011-01-03 21:38:57', '0', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('52', '11', '1', '1', '1', '2011-01-03 21:38:58', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('53', '12', '1', '1', '1', '2011-01-04 09:49:22', '0', '0', '0', '4', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('54', '12', '1', '1', '1', '2011-01-04 11:02:52', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('55', '12', '1', '1', '1', '2011-01-04 11:04:16', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('56', '12', '1', '1', '1', '2011-01-04 11:06:23', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('57', '11', '1', '1', '2', '2014-05-05 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('58', '13', '1', '1', '1', '2011-01-04 11:10:12', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('59', '13', '1', '1', '1', '2011-01-04 11:12:15', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('60', '13', '1', '1', '1', '2011-01-04 11:13:25', '0', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('61', '13', '1', '1', '1', '2011-01-04 11:14:40', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('62', '13', '1', '1', '1', '2011-01-04 11:16:01', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('63', '14', '1', '1', '1', '2011-01-04 11:17:04', '0', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('64', '14', '1', '1', '1', '2011-01-04 11:18:39', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('65', '14', '1', '1', '1', '2011-01-04 11:19:33', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('66', '14', '1', '1', '1', '2011-01-04 11:20:15', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('67', '19', '1', '1', '1', '2011-01-04 11:27:26', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('68', '35', '1', '1', '1', '2011-01-04 11:28:53', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('69', '35', '1', '1', '1', '2011-01-04 11:29:43', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('70', '35', '1', '1', '1', '2011-01-04 11:30:35', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('71', '19', '1', '1', '1', '2011-01-04 11:32:52', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('72', '19', '1', '1', '1', '2011-01-04 11:34:16', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('73', '35', '1', '1', '1', '2011-01-04 11:34:35', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('74', '19', '1', '1', '1', '2011-01-04 11:35:15', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('75', '19', '1', '1', '1', '2011-01-04 11:37:04', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('76', '35', '1', '1', '1', '2011-01-04 11:37:07', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('77', '19', '1', '1', '1', '2011-01-04 11:37:53', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('78', '33', '1', '1', '1', '2011-01-04 11:39:20', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('79', '21', '1', '1', '1', '2011-01-04 11:40:13', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('80', '33', '1', '1', '1', '2011-01-04 11:43:56', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('81', '33', '1', '1', '1', '2011-01-04 11:46:06', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('82', '33', '1', '1', '1', '2011-01-04 11:47:17', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('83', '33', '1', '1', '1', '2011-01-04 11:48:37', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('84', '21', '1', '1', '1', '2011-01-04 11:49:57', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('85', '34', '1', '1', '1', '2011-01-04 11:50:17', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('86', '21', '1', '1', '1', '2011-01-04 11:50:58', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('87', '21', '1', '1', '1', '2011-01-04 11:52:00', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('88', '34', '1', '1', '1', '2011-01-04 11:52:07', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('89', '21', '1', '1', '1', '2011-01-04 11:52:53', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('90', '34', '1', '1', '1', '2011-01-04 11:53:30', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('91', '34', '1', '1', '1', '2011-01-04 11:55:19', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('92', '34', '1', '1', '1', '2011-01-04 11:56:52', '0', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('93', '20', '1', '1', '1', '2011-01-04 11:58:11', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('94', '30', '1', '1', '1', '2011-01-04 11:59:41', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('95', '30', '1', '1', '1', '2011-01-04 12:00:30', '0', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('96', '20', '1', '1', '1', '2011-01-04 12:01:20', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('97', '30', '1', '1', '1', '2011-01-04 12:01:43', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('98', '30', '1', '1', '1', '2011-01-04 12:02:43', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('99', '30', '1', '1', '1', '2011-01-04 12:03:32', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('100', '20', '1', '1', '1', '2011-01-04 13:22:45', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('101', '20', '1', '1', '1', '2011-01-04 13:26:35', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('102', '32', '1', '1', '1', '2011-01-04 13:29:13', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('103', '32', '1', '1', '1', '2011-01-04 13:31:05', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('104', '20', '1', '1', '1', '2011-01-04 13:31:54', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('105', '32', '1', '1', '1', '2011-01-04 13:32:07', '0', '0', '1', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('106', '32', '1', '1', '1', '2011-01-04 13:33:41', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('107', '32', '1', '1', '1', '2011-01-04 13:35:11', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('108', '31', '1', '1', '1', '2011-01-04 13:39:59', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('109', '31', '1', '1', '1', '2011-01-04 13:41:13', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('110', '22', '1', '1', '1', '2011-01-04 13:41:56', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('111', '31', '1', '1', '1', '2011-01-04 13:42:06', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('112', '22', '1', '1', '1', '2011-01-04 13:43:07', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('113', '31', '1', '1', '1', '2011-01-04 13:44:04', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('114', '31', '1', '1', '1', '2011-01-04 13:44:42', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('115', '22', '1', '1', '1', '2011-01-04 13:44:49', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('116', '22', '1', '1', '1', '2011-01-04 13:46:10', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('117', '22', '1', '1', '1', '2011-01-04 13:48:04', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('118', '27', '1', '1', '1', '2011-01-04 13:50:07', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('119', '27', '1', '1', '1', '2011-01-04 13:51:17', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('120', '27', '1', '1', '1', '2011-01-04 13:52:15', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('121', '27', '1', '1', '1', '2011-01-04 13:52:59', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('122', '27', '1', '1', '1', '2011-01-04 13:54:02', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('124', '28', '1', '1', '1', '2011-01-04 13:55:24', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('125', '23', '1', '1', '1', '2011-01-04 13:55:35', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('126', '23', '1', '1', '1', '2011-01-04 13:56:21', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('127', '28', '1', '1', '1', '2011-01-04 13:56:24', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('128', '28', '1', '1', '1', '2011-01-04 13:56:52', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('129', '23', '1', '1', '1', '2011-01-04 13:57:09', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('130', '28', '1', '1', '1', '2011-01-04 13:57:18', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('131', '16', '1', '1', '1', '2011-01-04 13:57:35', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('132', '28', '1', '1', '1', '2011-01-04 13:57:42', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('133', '23', '1', '1', '1', '2011-01-04 13:57:50', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('134', '16', '1', '1', '1', '2011-01-04 13:59:24', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('135', '29', '1', '1', '1', '2011-01-04 13:59:56', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('136', '16', '1', '1', '1', '2011-01-04 14:00:14', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('137', '24', '1', '1', '1', '2011-01-04 14:00:40', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('138', '29', '1', '1', '1', '2011-01-04 14:00:55', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('139', '24', '1', '1', '1', '2011-01-04 14:01:24', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('140', '29', '1', '1', '1', '2011-01-04 14:01:37', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('141', '24', '1', '1', '1', '2011-01-04 14:02:08', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('142', '29', '1', '1', '1', '2011-01-04 14:02:15', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('143', '16', '1', '1', '1', '2011-01-04 14:02:23', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('144', '29', '1', '1', '1', '2011-01-04 14:02:47', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('145', '24', '1', '1', '1', '2011-01-04 14:02:48', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('146', '16', '1', '1', '1', '2011-01-04 14:04:02', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('147', '24', '1', '1', '1', '2011-01-04 14:04:12', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('148', '16', '1', '1', '1', '2011-01-04 14:04:51', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('149', '16', '1', '1', '1', '2011-01-04 14:06:07', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('150', '26', '1', '1', '1', '2011-01-04 14:10:14', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('151', '26', '1', '1', '1', '2011-01-04 14:10:46', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('152', '26', '1', '1', '1', '2011-01-04 14:11:15', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('153', '26', '1', '1', '1', '2011-01-04 14:11:48', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('154', '26', '1', '1', '1', '2011-01-04 14:12:23', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('155', '25', '1', '1', '1', '2011-01-04 14:14:31', '0', '0', '0', '4', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('156', '25', '1', '1', '1', '2011-01-04 14:14:35', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('157', '25', '1', '1', '1', '2011-01-04 14:15:22', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('158', '25', '1', '1', '1', '2011-01-04 14:16:24', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('159', '25', '1', '1', '1', '2011-01-04 14:16:43', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('160', '25', '1', '1', '1', '2011-01-04 14:17:54', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('161', '25', '1', '1', '1', '2011-01-04 14:18:34', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('162', '17', '1', '1', '1', '2011-01-04 14:21:10', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('163', '17', '1', '1', '1', '2011-01-04 14:22:53', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('164', '17', '1', '1', '1', '2011-01-04 14:24:26', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('165', '17', '1', '1', '1', '2011-01-04 14:26:05', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('166', '17', '1', '1', '1', '2011-01-04 14:27:29', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('167', '18', '1', '1', '1', '2011-01-04 14:29:46', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('168', '18', '1', '1', '1', '2011-01-04 14:30:34', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('169', '18', '1', '1', '1', '2011-01-04 14:31:24', '0', '0', '0', '3', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('170', '18', '1', '1', '1', '2011-01-04 14:32:11', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('171', '18', '1', '1', '1', '2011-01-04 14:34:06', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('172', '39', '1', '1', '1', '2011-01-04 14:34:23', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('173', '39', '1', '1', '1', '2011-01-04 14:44:02', '0', '0', '0', '2', '0', '0', '1', '0');
INSERT INTO `dc_content` VALUES ('174', '37', '1', '1', '1', '2011-01-04 14:44:59', '0', '0', '0', '3', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('175', '37', '1', '1', '1', '2011-01-04 14:46:00', '0', '0', '0', '3', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('176', '15', '1', '2', '1', '2011-01-04 14:55:11', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('177', '15', '1', '2', '1', '2011-01-04 14:56:38', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('178', '15', '1', '2', '2', '2014-04-06 00:00:00', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('179', '15', '1', '2', '1', '2011-01-04 14:58:20', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('180', '15', '1', '2', '1', '2011-01-04 14:59:06', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('181', '15', '1', '2', '1', '2011-01-04 14:59:48', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('182', '15', '1', '2', '1', '2011-01-04 15:00:32', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('183', '15', '1', '2', '1', '2011-01-04 15:01:43', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('184', '15', '1', '2', '1', '2011-01-04 15:03:31', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('185', '15', '1', '2', '1', '2011-01-04 15:04:31', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('186', '15', '1', '2', '1', '2011-01-04 15:05:34', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('187', '15', '1', '2', '1', '2011-01-04 15:06:52', '0', '1', '0', '3', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('188', '13', '1', '3', '1', '2011-01-04 15:13:44', '0', '0', '0', '3', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('189', '11', '1', '3', '1', '2011-01-04 15:14:56', '0', '0', '0', '3', '1', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('190', '1', '1', '2', '2', '2014-04-02 00:00:22', '0', '0', '0', '4', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('192', '1', '1', '2', '2', '2014-04-06 00:00:00', '0', '0', '0', '4', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('195', '23', '1', '2', '2', '2014-04-06 00:00:00', '2', '0', '1', '3', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('197', '1', '1', '1', '2', '2014-04-12 00:58:27', '0', '0', '0', '3', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('198', '1', '1', '1', '2', '2014-05-03 00:00:00', '0', '0', '0', '4', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('199', '1', '1', '1', '2', '2014-04-12 00:00:00', '0', '0', '1', '4', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('200', '37', '1', '1', '2', '2014-04-12 00:00:00', '0', '0', '1', '4', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('201', '37', '1', '1', '2', '2014-04-12 00:00:00', '0', '0', '1', '4', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('202', '37', '1', '1', '2', '2014-04-12 00:00:00', '0', '0', '1', '4', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('203', '37', '1', '2', '2', '2014-04-12 00:00:00', '0', '0', '1', '4', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('204', '37', '1', '2', '2', '2014-04-12 00:00:00', '0', '0', '1', '4', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('206', '1', '1', '1', '2', '2014-04-24 23:34:14', '0', '0', '1', '4', '0', '0', '0', '0');
INSERT INTO `dc_content` VALUES ('207', '38', '1', '1', '2', '2014-04-09 23:58:46', '0', '0', '1', '4', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `dc_content_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_attachment`;
CREATE TABLE `dc_content_attachment` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `attachment_path` varchar(255) NOT NULL COMMENT '附件路径',
  `attachment_name` varchar(100) NOT NULL COMMENT '附件名称',
  `filename` varchar(100) DEFAULT NULL COMMENT '文件名',
  `download_count` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  KEY `fk_jc_attachment_content` (`content_id`),
  CONSTRAINT `fk_jc_attachment_content` FOREIGN KEY (`content_id`) REFERENCES `dc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容附件表';

-- ----------------------------
-- Records of dc_content_attachment
-- ----------------------------
INSERT INTO `dc_content_attachment` VALUES ('172', '0', '/u/cms/www/201101/04143406ni8r.rar', 'JEECMS.rar', 'JEECMS.rar', '0');
INSERT INTO `dc_content_attachment` VALUES ('173', '0', '/u/cms/www/201101/04143406ni8r.rar', '04143406ni8r.rar', null, '0');
INSERT INTO `dc_content_attachment` VALUES ('175', '0', '/u/cms/www/201101/04143406ni8r.rar', '04143406ni8r.rar', null, '0');
INSERT INTO `dc_content_attachment` VALUES ('174', '0', '/u/cms/www/201101/04143406ni8r.rar', '04143406ni8r.rar', null, '0');
INSERT INTO `dc_content_attachment` VALUES ('192', '0', 'http://localhost:8080/dwcms/u/cms/www/201404/0613362215d6.jpg', 'Water lilies.jpg', 'Water lilies.jpg', '0');
INSERT INTO `dc_content_attachment` VALUES ('192', '0', 'http://localhost:8080/dwcms/u/cms/www/201404/06133105yl08.jpg', 'Blue hills.jpg', 'Blue hills.jpg', '0');
INSERT INTO `dc_content_attachment` VALUES ('195', '0', 'http://localhost:8080/dwcms/u/cms/www/201404/061654092nux.jpg', 'Winter.jpg', 'Winter.jpg', '0');
INSERT INTO `dc_content_attachment` VALUES ('195', '0', 'http://localhost:8080/dwcms/u/cms/www/201404/061702567aiu.jpg', 'Blue hills.jpg', 'Blue hills.jpg', '0');
INSERT INTO `dc_content_attachment` VALUES ('200', '0', '/u/cms/www/201101/04143406ni8r.rar', '04143406ni8r.rar', '04143406ni8r.rar', '0');
INSERT INTO `dc_content_attachment` VALUES ('201', '0', '/u/cms/www/201101/04143406ni8r.rar', '04143406ni8r.rar', '04143406ni8r.rar', '0');
INSERT INTO `dc_content_attachment` VALUES ('202', '0', '/u/cms/www/201101/04143406ni8r.rar', '04143406ni8r.rar', '04143406ni8r.rar', '0');
INSERT INTO `dc_content_attachment` VALUES ('203', '0', '/u/cms/www/201101/04143406ni8r.rar', '04143406ni8r.rar', '04143406ni8r.rar', '0');
INSERT INTO `dc_content_attachment` VALUES ('204', '0', '/u/cms/www/201101/04143406ni8r.rar', '04143406ni8r.rar', '04143406ni8r.rar', '0');
INSERT INTO `dc_content_attachment` VALUES ('204', '0', 'http://localhost:8080/dwcms/u/cms/www/201404/12232849lucd.jpg', 'T1uVlXXgxeXXXXXXXX.jpg', 'T1uVlXXgxeXXXXXXXX.jpg', '0');
INSERT INTO `dc_content_attachment` VALUES ('207', '0', 'http://localhost:8080/dwcms/u/cms/www/201404/12235858ku8g.jpg', 'T1uVlXXgxeXXXXXXXX.jpg', 'T1uVlXXgxeXXXXXXXX.jpg', '0');

-- ----------------------------
-- Table structure for `dc_content_attr`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_attr`;
CREATE TABLE `dc_content_attr` (
  `content_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_content` (`content_id`),
  CONSTRAINT `fk_jc_attr_content` FOREIGN KEY (`content_id`) REFERENCES `dc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展属性表';

-- ----------------------------
-- Records of dc_content_attr
-- ----------------------------
INSERT INTO `dc_content_attr` VALUES ('172', 'warrant', '免费版');
INSERT INTO `dc_content_attr` VALUES ('172', 'demoUrl', 'http://');
INSERT INTO `dc_content_attr` VALUES ('172', 'relatedLink', 'http://');
INSERT INTO `dc_content_attr` VALUES ('172', 'softType', '国产软件');
INSERT INTO `dc_content_attr` VALUES ('173', 'warrant', '免费版');
INSERT INTO `dc_content_attr` VALUES ('173', 'demoUrl', 'http://');
INSERT INTO `dc_content_attr` VALUES ('173', 'relatedLink', 'http://');
INSERT INTO `dc_content_attr` VALUES ('173', 'softType', '国产软件');
INSERT INTO `dc_content_attr` VALUES ('174', 'warrant', '免费版');
INSERT INTO `dc_content_attr` VALUES ('174', 'demoUrl', 'http://');
INSERT INTO `dc_content_attr` VALUES ('174', 'relatedLink', 'http://');
INSERT INTO `dc_content_attr` VALUES ('174', 'softType', '国产软件');
INSERT INTO `dc_content_attr` VALUES ('175', 'warrant', '免费版');
INSERT INTO `dc_content_attr` VALUES ('175', 'demoUrl', '#');
INSERT INTO `dc_content_attr` VALUES ('175', 'relatedLink', '#');
INSERT INTO `dc_content_attr` VALUES ('175', 'softType', '国产软件');

-- ----------------------------
-- Table structure for `dc_content_channel`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_channel`;
CREATE TABLE `dc_content_channel` (
  `channel_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`content_id`),
  KEY `fk_jc_channel_content` (`content_id`),
  CONSTRAINT `fk_jc_channel_content` FOREIGN KEY (`content_id`) REFERENCES `dc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_channel` FOREIGN KEY (`channel_id`) REFERENCES `dc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容栏目关联表';

-- ----------------------------
-- Records of dc_content_channel
-- ----------------------------
INSERT INTO `dc_content_channel` VALUES ('11', '34');
INSERT INTO `dc_content_channel` VALUES ('11', '35');
INSERT INTO `dc_content_channel` VALUES ('11', '36');
INSERT INTO `dc_content_channel` VALUES ('11', '37');
INSERT INTO `dc_content_channel` VALUES ('11', '38');
INSERT INTO `dc_content_channel` VALUES ('11', '39');
INSERT INTO `dc_content_channel` VALUES ('11', '40');
INSERT INTO `dc_content_channel` VALUES ('11', '41');
INSERT INTO `dc_content_channel` VALUES ('11', '42');
INSERT INTO `dc_content_channel` VALUES ('11', '43');
INSERT INTO `dc_content_channel` VALUES ('11', '44');
INSERT INTO `dc_content_channel` VALUES ('11', '45');
INSERT INTO `dc_content_channel` VALUES ('11', '46');
INSERT INTO `dc_content_channel` VALUES ('11', '47');
INSERT INTO `dc_content_channel` VALUES ('11', '48');
INSERT INTO `dc_content_channel` VALUES ('11', '49');
INSERT INTO `dc_content_channel` VALUES ('11', '50');
INSERT INTO `dc_content_channel` VALUES ('11', '51');
INSERT INTO `dc_content_channel` VALUES ('11', '52');
INSERT INTO `dc_content_channel` VALUES ('12', '53');
INSERT INTO `dc_content_channel` VALUES ('12', '54');
INSERT INTO `dc_content_channel` VALUES ('12', '55');
INSERT INTO `dc_content_channel` VALUES ('12', '56');
INSERT INTO `dc_content_channel` VALUES ('12', '57');
INSERT INTO `dc_content_channel` VALUES ('13', '58');
INSERT INTO `dc_content_channel` VALUES ('13', '59');
INSERT INTO `dc_content_channel` VALUES ('13', '60');
INSERT INTO `dc_content_channel` VALUES ('13', '61');
INSERT INTO `dc_content_channel` VALUES ('13', '62');
INSERT INTO `dc_content_channel` VALUES ('14', '63');
INSERT INTO `dc_content_channel` VALUES ('14', '64');
INSERT INTO `dc_content_channel` VALUES ('14', '65');
INSERT INTO `dc_content_channel` VALUES ('14', '66');
INSERT INTO `dc_content_channel` VALUES ('19', '67');
INSERT INTO `dc_content_channel` VALUES ('35', '68');
INSERT INTO `dc_content_channel` VALUES ('35', '69');
INSERT INTO `dc_content_channel` VALUES ('35', '70');
INSERT INTO `dc_content_channel` VALUES ('19', '71');
INSERT INTO `dc_content_channel` VALUES ('19', '72');
INSERT INTO `dc_content_channel` VALUES ('35', '73');
INSERT INTO `dc_content_channel` VALUES ('19', '74');
INSERT INTO `dc_content_channel` VALUES ('19', '75');
INSERT INTO `dc_content_channel` VALUES ('35', '76');
INSERT INTO `dc_content_channel` VALUES ('19', '77');
INSERT INTO `dc_content_channel` VALUES ('33', '78');
INSERT INTO `dc_content_channel` VALUES ('21', '79');
INSERT INTO `dc_content_channel` VALUES ('33', '80');
INSERT INTO `dc_content_channel` VALUES ('33', '81');
INSERT INTO `dc_content_channel` VALUES ('33', '82');
INSERT INTO `dc_content_channel` VALUES ('33', '83');
INSERT INTO `dc_content_channel` VALUES ('21', '84');
INSERT INTO `dc_content_channel` VALUES ('34', '85');
INSERT INTO `dc_content_channel` VALUES ('21', '86');
INSERT INTO `dc_content_channel` VALUES ('21', '87');
INSERT INTO `dc_content_channel` VALUES ('34', '88');
INSERT INTO `dc_content_channel` VALUES ('21', '89');
INSERT INTO `dc_content_channel` VALUES ('34', '90');
INSERT INTO `dc_content_channel` VALUES ('34', '91');
INSERT INTO `dc_content_channel` VALUES ('34', '92');
INSERT INTO `dc_content_channel` VALUES ('20', '93');
INSERT INTO `dc_content_channel` VALUES ('30', '94');
INSERT INTO `dc_content_channel` VALUES ('30', '95');
INSERT INTO `dc_content_channel` VALUES ('20', '96');
INSERT INTO `dc_content_channel` VALUES ('30', '97');
INSERT INTO `dc_content_channel` VALUES ('30', '98');
INSERT INTO `dc_content_channel` VALUES ('30', '99');
INSERT INTO `dc_content_channel` VALUES ('20', '100');
INSERT INTO `dc_content_channel` VALUES ('20', '101');
INSERT INTO `dc_content_channel` VALUES ('32', '102');
INSERT INTO `dc_content_channel` VALUES ('32', '103');
INSERT INTO `dc_content_channel` VALUES ('20', '104');
INSERT INTO `dc_content_channel` VALUES ('32', '105');
INSERT INTO `dc_content_channel` VALUES ('32', '106');
INSERT INTO `dc_content_channel` VALUES ('32', '107');
INSERT INTO `dc_content_channel` VALUES ('31', '108');
INSERT INTO `dc_content_channel` VALUES ('31', '109');
INSERT INTO `dc_content_channel` VALUES ('22', '110');
INSERT INTO `dc_content_channel` VALUES ('31', '111');
INSERT INTO `dc_content_channel` VALUES ('22', '112');
INSERT INTO `dc_content_channel` VALUES ('31', '113');
INSERT INTO `dc_content_channel` VALUES ('31', '114');
INSERT INTO `dc_content_channel` VALUES ('22', '115');
INSERT INTO `dc_content_channel` VALUES ('22', '116');
INSERT INTO `dc_content_channel` VALUES ('22', '117');
INSERT INTO `dc_content_channel` VALUES ('27', '118');
INSERT INTO `dc_content_channel` VALUES ('27', '119');
INSERT INTO `dc_content_channel` VALUES ('27', '120');
INSERT INTO `dc_content_channel` VALUES ('27', '121');
INSERT INTO `dc_content_channel` VALUES ('27', '122');
INSERT INTO `dc_content_channel` VALUES ('28', '124');
INSERT INTO `dc_content_channel` VALUES ('23', '125');
INSERT INTO `dc_content_channel` VALUES ('23', '126');
INSERT INTO `dc_content_channel` VALUES ('28', '127');
INSERT INTO `dc_content_channel` VALUES ('28', '128');
INSERT INTO `dc_content_channel` VALUES ('23', '129');
INSERT INTO `dc_content_channel` VALUES ('28', '130');
INSERT INTO `dc_content_channel` VALUES ('16', '131');
INSERT INTO `dc_content_channel` VALUES ('28', '132');
INSERT INTO `dc_content_channel` VALUES ('23', '133');
INSERT INTO `dc_content_channel` VALUES ('16', '134');
INSERT INTO `dc_content_channel` VALUES ('29', '135');
INSERT INTO `dc_content_channel` VALUES ('16', '136');
INSERT INTO `dc_content_channel` VALUES ('24', '137');
INSERT INTO `dc_content_channel` VALUES ('29', '138');
INSERT INTO `dc_content_channel` VALUES ('24', '139');
INSERT INTO `dc_content_channel` VALUES ('29', '140');
INSERT INTO `dc_content_channel` VALUES ('24', '141');
INSERT INTO `dc_content_channel` VALUES ('29', '142');
INSERT INTO `dc_content_channel` VALUES ('16', '143');
INSERT INTO `dc_content_channel` VALUES ('29', '144');
INSERT INTO `dc_content_channel` VALUES ('24', '145');
INSERT INTO `dc_content_channel` VALUES ('16', '146');
INSERT INTO `dc_content_channel` VALUES ('24', '147');
INSERT INTO `dc_content_channel` VALUES ('16', '148');
INSERT INTO `dc_content_channel` VALUES ('16', '149');
INSERT INTO `dc_content_channel` VALUES ('26', '150');
INSERT INTO `dc_content_channel` VALUES ('26', '151');
INSERT INTO `dc_content_channel` VALUES ('26', '152');
INSERT INTO `dc_content_channel` VALUES ('26', '153');
INSERT INTO `dc_content_channel` VALUES ('26', '154');
INSERT INTO `dc_content_channel` VALUES ('25', '155');
INSERT INTO `dc_content_channel` VALUES ('25', '156');
INSERT INTO `dc_content_channel` VALUES ('25', '157');
INSERT INTO `dc_content_channel` VALUES ('25', '158');
INSERT INTO `dc_content_channel` VALUES ('25', '159');
INSERT INTO `dc_content_channel` VALUES ('25', '160');
INSERT INTO `dc_content_channel` VALUES ('25', '161');
INSERT INTO `dc_content_channel` VALUES ('17', '162');
INSERT INTO `dc_content_channel` VALUES ('17', '163');
INSERT INTO `dc_content_channel` VALUES ('17', '164');
INSERT INTO `dc_content_channel` VALUES ('17', '165');
INSERT INTO `dc_content_channel` VALUES ('17', '166');
INSERT INTO `dc_content_channel` VALUES ('18', '167');
INSERT INTO `dc_content_channel` VALUES ('18', '168');
INSERT INTO `dc_content_channel` VALUES ('18', '169');
INSERT INTO `dc_content_channel` VALUES ('18', '170');
INSERT INTO `dc_content_channel` VALUES ('18', '171');
INSERT INTO `dc_content_channel` VALUES ('39', '172');
INSERT INTO `dc_content_channel` VALUES ('39', '173');
INSERT INTO `dc_content_channel` VALUES ('37', '174');
INSERT INTO `dc_content_channel` VALUES ('37', '175');
INSERT INTO `dc_content_channel` VALUES ('15', '176');
INSERT INTO `dc_content_channel` VALUES ('15', '177');
INSERT INTO `dc_content_channel` VALUES ('15', '178');
INSERT INTO `dc_content_channel` VALUES ('15', '179');
INSERT INTO `dc_content_channel` VALUES ('15', '180');
INSERT INTO `dc_content_channel` VALUES ('15', '181');
INSERT INTO `dc_content_channel` VALUES ('15', '182');
INSERT INTO `dc_content_channel` VALUES ('15', '183');
INSERT INTO `dc_content_channel` VALUES ('15', '184');
INSERT INTO `dc_content_channel` VALUES ('15', '185');
INSERT INTO `dc_content_channel` VALUES ('15', '186');
INSERT INTO `dc_content_channel` VALUES ('15', '187');
INSERT INTO `dc_content_channel` VALUES ('13', '188');
INSERT INTO `dc_content_channel` VALUES ('11', '189');

-- ----------------------------
-- Table structure for `dc_content_check`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_check`;
CREATE TABLE `dc_content_check` (
  `content_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核步数',
  `check_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `is_rejected` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退回',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_check_content` FOREIGN KEY (`content_id`) REFERENCES `dc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容审核信息表';

-- ----------------------------
-- Records of dc_content_check
-- ----------------------------
INSERT INTO `dc_content_check` VALUES ('34', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('35', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('36', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('37', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('38', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('39', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('40', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('41', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('42', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('43', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('44', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('45', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('46', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('47', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('48', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('49', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('50', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('51', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('52', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('54', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('55', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('56', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('57', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('58', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('59', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('60', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('61', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('62', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('63', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('64', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('65', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('66', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('67', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('68', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('69', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('70', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('71', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('72', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('73', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('74', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('75', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('76', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('77', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('78', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('79', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('80', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('81', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('82', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('83', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('84', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('85', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('86', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('87', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('88', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('89', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('90', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('91', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('92', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('93', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('94', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('95', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('96', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('97', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('98', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('99', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('100', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('101', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('102', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('103', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('104', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('105', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('106', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('107', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('108', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('109', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('110', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('111', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('112', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('113', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('114', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('115', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('116', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('117', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('118', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('119', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('120', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('121', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('122', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('124', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('125', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('126', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('127', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('128', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('129', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('130', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('131', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('132', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('133', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('134', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('135', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('136', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('137', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('138', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('139', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('140', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('141', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('142', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('143', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('144', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('145', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('146', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('147', '2', null, '1');
INSERT INTO `dc_content_check` VALUES ('148', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('149', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('150', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('151', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('152', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('153', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('154', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('156', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('157', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('158', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('159', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('160', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('161', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('162', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('163', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('164', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('165', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('166', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('167', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('168', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('169', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('170', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('171', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('172', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('173', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('174', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('175', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('176', '2', null, '1');
INSERT INTO `dc_content_check` VALUES ('177', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('178', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('179', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('180', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('181', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('182', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('183', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('184', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('185', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('186', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('187', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('188', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('189', '2', null, '0');
INSERT INTO `dc_content_check` VALUES ('190', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('192', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('195', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('197', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('198', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('199', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('200', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('201', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('202', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('203', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('204', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('206', '0', null, '0');
INSERT INTO `dc_content_check` VALUES ('207', '0', null, '0');

-- ----------------------------
-- Table structure for `dc_content_count`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_count`;
CREATE TABLE `dc_content_count` (
  `content_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '总评论数',
  `comments_month` int(11) NOT NULL DEFAULT '0' COMMENT '月评论数',
  `comments_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周评论数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads` int(11) NOT NULL DEFAULT '0' COMMENT '总下载数',
  `downloads_month` int(11) NOT NULL DEFAULT '0' COMMENT '月下载数',
  `downloads_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周下载数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups` int(11) NOT NULL DEFAULT '0' COMMENT '总顶数',
  `ups_month` int(11) NOT NULL DEFAULT '0' COMMENT '月顶数',
  `ups_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周顶数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  `downs` int(11) NOT NULL DEFAULT '0' COMMENT '总踩数',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_count_content` FOREIGN KEY (`content_id`) REFERENCES `dc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容计数表';

-- ----------------------------
-- Records of dc_content_count
-- ----------------------------
INSERT INTO `dc_content_count` VALUES ('34', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('35', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('36', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('37', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('38', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('39', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('41', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('42', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('43', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('44', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('45', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('46', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('47', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('48', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('49', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('50', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('51', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('52', '122', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('54', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('55', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('56', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('57', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('58', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('59', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('60', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('61', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('62', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('63', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('64', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('65', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('66', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('67', '17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('68', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('69', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('70', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('71', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('72', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('73', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('74', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('75', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('76', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('77', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('78', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('79', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('80', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('81', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('82', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('83', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('84', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('85', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('86', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('87', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('88', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('89', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('90', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('91', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('92', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('93', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('94', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('95', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('96', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('97', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('98', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('99', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('100', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('101', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('102', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('103', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('104', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('105', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('106', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('107', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('108', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('109', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('110', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('111', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('112', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('113', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('114', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('115', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('116', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('117', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('118', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('119', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('120', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('121', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('122', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('124', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('125', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('126', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('127', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('128', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('129', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('130', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('131', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('132', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('133', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('134', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('135', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('136', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('137', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('138', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('139', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('140', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('141', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('142', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('143', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('144', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('145', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('146', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('147', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('148', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('149', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('150', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('151', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('152', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('153', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('154', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('156', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('157', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('158', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('159', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('160', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('161', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('162', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('163', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('164', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('165', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('166', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('167', '2', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('168', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('169', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('170', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('171', '3', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('172', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('173', '3', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('174', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('175', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('176', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('177', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('178', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('179', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('180', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('181', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('182', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('183', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('184', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('185', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('186', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('187', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('188', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('189', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('190', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('192', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('195', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('197', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('198', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('199', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('200', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('201', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('202', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('203', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('204', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('206', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_content_count` VALUES ('207', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `dc_content_ext`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_ext`;
CREATE TABLE `dc_content_ext` (
  `content_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL COMMENT '标题',
  `short_title` varchar(150) DEFAULT NULL COMMENT '简短标题',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `origin` varchar(100) DEFAULT NULL COMMENT '来源',
  `origin_url` varchar(255) DEFAULT NULL COMMENT '来源链接',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `release_date` datetime NOT NULL COMMENT '发布日期',
  `media_path` varchar(255) DEFAULT NULL COMMENT '媒体路径',
  `media_type` varchar(20) DEFAULT NULL COMMENT '媒体类型',
  `title_color` varchar(10) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加粗',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图片',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图片',
  `type_img` varchar(100) DEFAULT NULL COMMENT '类型图片',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '指定模板',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_ext_content` FOREIGN KEY (`content_id`) REFERENCES `dc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展表';

-- ----------------------------
-- Records of dc_content_ext
-- ----------------------------
INSERT INTO `dc_content_ext` VALUES ('34', '我国有望后年发射火星探测器', null, null, null, null, '据中国空间技术研究院有关专家介绍，2013年，我国有望利用长征三号乙运载火箭发射自主火星探测器。我国航天工业部门已先期启动了基于探月一二期技术的自主火星探测器研究和方案设计工作，目前正在积极开展技术攻关。据悉，我国自主火星探测器的科学载荷重量达100公斤以上，科学探测能力将大大提高。', '2011-01-03 21:38:30', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('35', '首都机场30个赴欧美航班因欧美暴雪延误', null, null, null, null, null, '2011-01-03 21:38:31', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('36', '江苏建湖县3天发生31起小地震', null, null, null, null, null, '2011-01-03 21:38:32', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('37', '贵州湖南公路路面大面积结冰', null, null, null, null, null, '2011-01-03 21:38:33', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('38', '北京长安街西延长线今年开建', null, null, null, null, null, '2011-01-03 21:38:35', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('39', '婚姻登记信息5年内全国联网 北京等3地今年试点', null, null, null, null, '民政部日前召开婚姻登记规范化视频会议。会上透露，截至目前，全国多个省市婚登机关已实现婚姻登记网上预约、在线查询、婚姻档案信息检索等功能。婚姻登记信息实现省级联网的省份已由2005年的2个增加到现在的23个，省级联网率达到了74%。“十二五”期间，婚姻登记信息将实现全国联网。', '2011-01-03 21:38:36', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('40', '贵州全省仅一条高速部分开放', null, null, null, null, null, '2011-01-03 21:38:38', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('41', '福州厦门等多个城市决定继续执行楼市限购令', null, null, null, null, null, '2011-01-03 21:38:39', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('42', '重庆40余人自驾游因道路结冰受困山间 ', null, null, null, null, null, '2011-01-03 21:38:40', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('43', '重庆2010年挖出涉黑保护伞47人', null, null, null, null, null, '2011-01-03 21:38:42', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('44', '北京城管在官网接受市民评价', null, null, null, null, null, '2011-01-03 21:38:45', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('45', '北京低保人员将须审核财产情况', null, null, null, null, null, '2011-01-03 21:38:48', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('46', '重庆荣昌将在押期间表现纳入量刑情节', null, null, null, null, null, '2011-01-03 21:38:49', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('47', '1月份将上演日偏食等四大天象', null, null, null, null, null, '2011-01-03 21:38:51', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('48', '湖南未来一周仍维持低温雨雪天气', null, null, null, null, null, '2011-01-03 21:38:53', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('49', '江苏建湖连续发生31起地震 部分居民夜里跑出门', null, null, null, null, null, '2011-01-03 21:38:54', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('50', '广东郁南县沉船事故涉事人员被控制', null, null, null, null, null, '2011-01-03 21:38:56', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('51', '湖北部分学校推删节版经典引争议 孟母择邻被删', null, null, null, null, null, '2011-01-03 21:38:57', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('52', '苏州迁户口取消购房年限工作地域等限制', null, null, null, null, null, '2011-01-03 21:38:58', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('54', '外媒称欧盟明年或取消对华武器禁运', '外媒称欧盟明年或取消对华武器禁运', null, null, null, '法国主流媒体援引接近欧盟外交高层的话说，欧盟对华武器禁运有望于2011年取消。据悉，欧洲国家对此问题的分歧正在缩小，但是一些东欧国家对此不认同，还有国家要求为解禁提出附加条件。', '2011-01-04 11:02:52', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('55', '日本否认欲建立“日韩同盟”令韩媒体更正(图)', '日本否认欲建立“日韩同盟”', null, null, null, '3日，东北亚地区因为韩朝交火和美韩日密集军事演习引发的紧张气氛尚未消散之际，韩国媒体又爆出“大新闻”，称日本提议建立日韩军事同盟。消息一出来，日本政府赶紧辟谣，称日方并无此意，仅是希望日韩加强在安全保障领域的合作。', '2011-01-04 11:04:16', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('56', '俄罗斯开始大规模裁减公务员 3年将削减两成', '俄罗斯开始大规模裁减公务员', null, null, null, '国际在线报道（驻俄罗斯记者盛晶晶）：3号，俄罗斯总统梅德韦杰夫正式签署一项关于优化联邦国家机关工作人员数量的命令，称联邦政府将在今后3年内削减20%的公务员，并严格控制政府机构的人员增长。这是自苏联解体以来，俄罗斯联邦政府第一次大规模裁减公务员。\r\n', '2011-01-04 11:06:23', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('57', '美国朝鲜问题特使今将抵达韩国开始东亚三国之行', '美国朝鲜问题特使今将抵达韩国开始东亚三国之行', '', '', '', '新年伊始，朝韩半岛局势继续牵动国际社会的目光。今天（4号）下午，美国朝鲜问题特使斯蒂芬·博斯沃思将抵达韩国，就朝鲜半岛局势下一步如何行动展开磋商，这也是他此次中日韩三国访问的第一站。据报道，博斯沃思此次访问的议题可能会涉及六方会谈。那么，对于博思沃斯的访问，韩国国内是怎样一个态度？相关的举动能否在新的一年打开朝鲜半岛局势的新局面？', '2014-05-05 00:00:00', '', null, '', '0', '', '', '', '', '');
INSERT INTO `dc_content_ext` VALUES ('58', '著名作家史铁生昨日凌晨突发脑溢血逝世', '著名作家史铁生昨日凌晨突发脑溢血逝世', '新华网', '网易', 'http://www.163.com/', '12月31日凌晨3时，59岁的作家史铁生因脑溢血在北京去世。根据史铁生生前遗愿，他的脊椎、大脑将捐给医学研究；他的肝脏将捐给有需要的患者。史铁生年轻时双腿瘫痪，后来患肾病并发展到尿毒症，一直靠透析维持生命。其著名散文《我与地坛》影响最大，感动无数读者。', '2011-01-04 11:10:12', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('59', '政府网站政风满意率调查公示被曝藏猫腻', '政府网站政风满意率调查公示被曝藏猫腻', null, null, null, '一个政府网站政风行风投票评议公示被网友指出暗藏玄机，依此公示计算即使全票不满意，群众满意率调查也会不低于50%。对此，该地纪委回应称是网络公司搞错了，并迅速将网上公式做了更改。工作人员称，该公式不会影响评选结果，因只统计评分，不会关注满意率。\r\n', '2011-01-04 11:12:15', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('60', '黄山徽州区\"因人设岗\"招聘续:招聘方案全部终止', '黄山徽州区\"因人设岗\"招聘续:招聘方案全部终止', null, null, null, '12月24日，一名网友发帖称黄山市徽州区事业单位招聘为领导子女专设，引起网民热议。1月3日，徽州招聘工作负责人表示，除原定于1月3日进行的面试已经在2日公告取消外，此次事业单位招聘方案目前也已全部终止。当地将完善招聘工作，重新组织实施。', '2011-01-04 11:13:25', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('61', '屠宰场视频曝生猪注水 被拍方称遭诬陷', '屠宰场视频曝生猪注水', null, null, null, '日前，记者收到淄博一市民送来的屠宰场“注水肉”视频。而被拍摄厂家说是被人“诬陷”了，当地主管部门称拍摄者是“自导自演”，警方表示视频拍摄者属“团伙犯罪”，目前已有两人被刑拘。', '2011-01-04 11:14:40', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('62', '深圳保障房跨年丑闻，谁该脸红', '深圳保障房跨年丑闻', null, null, null, '深圳市第二次保障性住房从名单初审到终审，形式上遮遮掩掩，内容中问题成堆，有关部门未能真正按照制度和规则办事，未能反映出“公生明、廉生威”式的磊落坦荡。\r\n', '2011-01-04 11:16:01', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('63', '“被走过场”的民调如何硬气起来', '“被走过场”的民调如何硬气起来', null, null, null, '要让“被走过场”的民调硬气起来，关键还得在程序的公正与透明上下功夫。', '2011-01-04 11:17:04', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('64', '校车，如何让家长放心？', '校车，如何让家长放心？', null, null, null, '尊重孩子的生命，呵护孩子的安全，起码得建造坚固的校舍，起码让孩子坐上安全的校车，如果没有这些基本的硬件，一切皆是虚妄之谈。', '2011-01-04 11:18:39', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('65', '郭松民 ：勤奋工作赶不上物价涨幅 ', '郭松民 ：勤奋工作赶不上物价涨幅 ', null, null, null, '通胀问题根本上是一个宏观经济政策问题，因此也应该通过政府的宏观调控来解决，各国皆然，从来没有哪个国家是靠号召民众通过“勤奋工作”来应对通胀的。', '2011-01-04 11:19:33', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('66', '叶檀：警惕以城市化名义剥夺农民土地红利 ', '叶檀：警惕以城市化名义剥夺农民土地红利 ', null, null, null, '中国目前紧锣密鼓的城市化进程，事实上是1949年之后的另一次土改。当年的土改是将土地分到农民手中，公社时期前后则是将土地集中国有化，现在的土改主要是将集体土地重新流入市场进行财富再分配。', '2011-01-04 11:20:15', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('67', '2011年货币信贷增长目标或下调', '2011年货币信贷增长目标或下调', null, null, null, '一系列市场高度关注的调控动向即将浮出水面，例如：2011年货币信贷增长目标或将下调、积极促进市场化并购重组、结合巴塞尔协议 适度提高对大型银行的资本监管要求、加强保险业偿付能力监管并强化资本约束等等。', '2011-01-04 11:27:26', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('68', '标准总量都降 \"史上最严\"公车改革将启动', null, null, null, null, '北京晨报2011年1月4日报道 中央办公厅和国务院办公厅最近要出台有关公车配备使用的新规定，这个规定比过去更加严格，比如对省部级干部公车配备的标准排气量和购置税都比过去严格了，对党政机关和直属事业单位的公务用车的编制也比过去严格了。也就是说，公车配备的标准和公车的总数量是要下降的。\r\n\r\n', '2011-01-04 11:28:53', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('69', '中石化叫停加油优惠 民营93号油最高降0.68元', null, null, null, null, '国际油价维持在每桶91美元以上的高位，这似乎让中石化坚定了拒绝价格战的决心。昨天，记者从中石化北京石油分公司获悉，中石化旗下600多座加油站近期已全面叫停优惠促销活动，惟一保留的是自助加油站每升5分钱的优惠。\r\n', '2011-01-04 11:29:43', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('70', '维修专家总结:车辆全面检测的十个大项目', null, null, null, null, '做“体检”的车辆中，私家车占了绝大多数。这些车主多半都是长假期间自驾游刚刚归来，回来后给爱车做一个全面养护，则是非常有必要的。\r\n', '2011-01-04 11:30:35', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('71', '多城市楼市限购令延续执行', '多城市楼市限购令延续执行', null, null, null, '北京、上海、广州、深圳四大一线城市已明确表态，今年将继续执行包括“限购令”在内的楼市调控政策。', '2011-01-04 11:32:52', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('72', '2011年人民币将继续保持升值趋势', '2011年人民币将继续保持升值趋势', null, null, null, '当前人民币升值的最大推动力之一，来自于海外的政治压力，比如美国国会的汇率法案、美国财政部的汇率操纵国的报告、G20国际峰会等，都令人民币备受压力', '2011-01-04 11:34:16', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('73', '是否值得关注? 看轮胎对刹车性能的影响', null, null, null, null, '对于汽车，我们的注意力往往都集中在一些主要问题上，像发动机、变速箱、内饰做工、性能、油耗等等，但有多少人关注过汽车的轮胎呢？其实无论是汽车性能的发挥还是安全性，作为汽车与地面唯一接触的部分，轮胎的重要性比我们想象中要大的多', '2011-01-04 11:34:35', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('74', '多家机构料上月CPI回落5%以内', '多家机构料上月CPI回落5%以内', null, null, null, '申银万国于上周发布的宏观经济预测中指出：去年12月CPI将回落至4.5%，但这仅是暂时现象，今年上半年尤其是一季度，物价涨幅将再次超过5%。', '2011-01-04 11:35:15', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('75', '上周主力资金净流出184亿元', '上周主力资金净流出184亿元', null, null, null, '2010年最后一周市场跌宕起伏、股指探底反弹。同样，市场资金亦呈现先抑后扬态势。大智慧超赢数据显示，上周大盘资金整体净流出184亿元，行业资金全线净墨，无一流入。', '2011-01-04 11:37:04', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('76', '德系军团领衔 2011年上市中型车大盘点', null, null, null, null, '转眼间新的一年已经到来，笔者我首先在这里代表汽车点评网祝大家新年快乐。回顾刚刚过去的一年，国内汽车市场呈现出爆发式的增长，并再度蝉联了全球第一大市场桂冠。并且在这一年成功的举办了北京以及广州两届重要的国际性车展，与之伴随的是更多品牌的更多新车进入了消费者的日常生活中', '2011-01-04 11:37:07', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('77', '桑德环境利好连连 机构投“靶”早有默契', '桑德环境利好连连 机构投“靶”早有默契', null, null, null, '如果要选出一只被券商集体看好的个股，桑德环境（000826，收盘价33.37元）当仁不让！据《每日经济新闻》记者不完全统计，桑德环境同时出现在了中信、中金等六大券商推荐的2011年金股名单中，成了名副其实的“金股王”。而就在2010年即将结束之际，公司又接连公布了两份与地方政府合作的利好消息，隐隐透露出机构投“靶”或许早已胸有成竹。', '2011-01-04 11:37:53', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('78', '路虎发现4限量版领衔 8款2011年1月将上市新车', null, null, null, null, '伴随着2010年中国车市野蛮生长，2011年虽然在汽车产业政策上，许多利好政策已经结束，取而代之的使更多的限购措施，然而这些都改变不了目前汽车从奢侈品转变为正常消费品而带来的刚性需求。', '2011-01-04 11:39:20', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('79', '26基金公司资管规模提升 股基年均回报5.01%', '26基金公司资管规模提升', null, null, null, '截至2011年1月1日，所有60家基金公司2010年末资产净值数据公布完毕。数据显示，孙建波领衔，25只偏股基金年回报逾20%；华商、银华等26家基金公司资产管理规模同比提升；', '2011-01-04 11:40:13', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('80', '大众新Passat巴黎首发 国产加长版车型明年推出', null, null, null, null, '大众汽车全新Passat在巴黎车展（10月2日—17日）上全球首次亮相，同时发布的车型有轿车和旅行轿车两个版本。这款车型的第七代产品将于11月中旬在欧洲市场率先上市。预计新车将于明年国内正式上市，国产版本将是基于海外版Passat的加长版车型。', '2011-01-04 11:43:56', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('81', '2010款马自达5明年1月11日上市 定位家用市场', null, null, null, null, '已经在北京车展、广州车展亮相的2010款马自达5将于明年1月11日上市，这款车主要定位于家用车市场，竞争对手锁定途安等车型。', '2011-01-04 11:46:06', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('82', '确定国产 2012款雪佛兰科帕奇改款车正式亮相', null, null, null, null, '2012款雪佛兰科帕奇改款车正式在巴黎车展上亮相，本次亮相的改款车很有可能就是未来国产的科帕奇。预计国产的科帕奇在2011年底可以实现批量生产，上市时间则会在2012年初。', '2011-01-04 11:47:17', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('83', '明年一季度上市 上海通用将引进大黄蜂', null, null, null, null, ' 近日有媒体从上海通用消息人士处获悉，雪佛兰Camaro即大家熟悉的大黄蜂已经开始国内进口的准备工作。该人士称，大黄蜂将由上海通用汽车负责进口，前期准备工作将于近期完成，预计明年第一季度即可正式登陆中国市场。', '2011-01-04 11:48:37', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('84', '状元孙建波：2011A股好过2010 消费估值已偏高', '2011A股好过2010 消费估值已偏高', null, null, null, '对于他而言，可能比外界关注的孙王年末大战更重要的，已经是如何布局2011。在中国基金行业的历史上，除王亚伟外，还没有一位基金经理，曾经创下连续两年挺入前三的记录。', '2011-01-04 11:49:57', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('85', '和宝马3系花费相当 宝马1系用车成本调查', null, null, null, null, '在宝马家族当中，宝马1系是尺寸最小、售价最低的一款（MINI不算在内），它的外形风格硬朗，充满运动感，显然是专为年轻人准备的，不过它的售价说低也是仅仅相对于宝马品牌来说的，实际上最低配的08款120i手动挡车型的售价也要27.30万元，相当于一款B级车的顶配车型了，这样一款车可不是普通年轻白领消费得起的，这是不折不扣的“金领”阶层的玩物。下面我们就来看看它的用车成本如何吧', '2011-01-04 11:50:17', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('86', '债基总冠军长盛积极配置：绩效越做越好的基金', '绩效越做越好的基金', null, null, null, '作为国内首批社保基金管理人之一，长盛基金管理公司是一家债券投资管理能力较为突出的公司，并获得过一些奖，包括2009年度曾在这个方面获得过中国基金行业的最高奖项“金牛奖”。该公司在发行和管理债券型基金方面有一个较为显著的特点，即到目前为止只发行二级债基，没有发行一级债基或纯债基金。在二级债基方面，成立于2008年10月8日的长盛积极配置，是一只值得广大投资者多多关注的、在绩效方面越做越好的基金。', '2011-01-04 11:50:58', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('87', '今日6只新基金上市抢滩 本周在售新基达22只', '今日6只新基金上市抢滩 本周在售新基达22只', null, null, null, '2010年终总结还在基金公司内展开，新基金的布局和战斗就早已拉开序幕。\r\n翻阅节后即将上架的基金新品，也许你会惊讶地发现，在节后的首个交易日，就有6只新品将同步抢滩新基金市场，而在节后的一周内，新基金在售的数量也将高达22只。', '2011-01-04 11:52:00', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('88', '一年至少5万元 奥迪Q7用车成本调查', null, null, null, null, ' 用一辆家用车的价钱去买一辆二手的豪华轿车看上去是一个不错的选择，虽然不是新车，开着依然是十分有面子，有很多经济情况并没有那么优越的人会做出这样的选择，可是当你这么做时，你想到它的售后维修保养费用了么？虽然那些豪华二手车的车价你能接受，但所知而来的高昂用车成本你却未必吃得消。对于购买新车的人同样应该有这方面的顾虑，因为它们的养车费用着实不低！', '2011-01-04 11:52:07', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('89', '逾五成基金年前逢低加仓 增持力度大于减持', '逾五成基金年前逢低加仓 增持力度大于减持', null, null, null, '来自研究机构的数据显示，2011年前最后一周，有超过五成的公募基金在低迷行情中开始逐步布局，逢低加仓。上周华夏旗下多只基金显示出增仓迹象，大方向把握较好的兴业全球基金旗下仓位也有所提升。', '2011-01-04 11:52:53', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('90', '1.4T车型最划算 迈腾每月用车成本调查', null, null, null, null, '一汽-大众迈腾外观大气，整车做工精致细腻，大众车在安全性、做工、操控方面还是比较有优势的，迈腾搭载的是TSI+DSG动力组合，不仅动力表现突出，动力输出与同级车相比有一定优势。在安全方面，全车10个安全气囊给予车内人员全方位的保护；无钥匙启动装置和智能无钥匙进入系统，不仅给行车安全提供了更好的保障，而且还非常得方便；10声道环绕立体声的高保真等音响系统等设备配置又提供了很好的舒适度', '2011-01-04 11:53:30', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('91', '一年花费1.6万元 比亚迪G3用车成本调查', null, null, null, null, '低廉的价格和高级的配置是自主品牌轿车赢得市场的一大法宝，在售价8万元左右的比亚迪G3身上居然非常“给力”的全系标配了20万元以上级别车型才会较多装备的无钥匙启动系统，看上去性价比很高，不过形成鲜明对比的是关系到乘客安全的前排气囊却没有做到没有做到全系标配，有点抓住芝麻丢了西瓜的感觉。当然，自主品牌在目前阶段要想成功靠的还是经济性，除了车价要低，售后的使用、养护成本也要低，下面我们就来看看比亚迪G3一年的用车成本如何', '2011-01-04 11:55:19', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('92', '到底谁更省 宝来1.4T与1.6保养费用调查', null, null, null, null, '在一汽大众推出新宝来1.4T时曾经表示，1.4T引擎不会给车友在售后保养增加上面太多压力，到底会不会给车友带来售后维护上面的经济压力呢？', '2011-01-04 11:56:52', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('93', '寻找2010年的生财之道', '寻找2010年的生财之道', null, null, null, '回眸2010年投资理财市场，最给力的一个词，当仁不让地应属“涨价”。\r\n\r\n　　农产品以“蒜你狠”为急先锋拉开价格狂飚的前奏，金价一年内涨幅超过了40%，铜创出历史新高，翡翠价格翻了3番，艺术品连续拍出天价，就连潜伏13年一直波澜不兴的邮票市场也在2010年大发虎威……\r\n', '2011-01-04 11:58:11', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('94', '周鸿祎：未来一定会离开360 转向天使投资', null, null, null, null, '“乔布斯是我的榜样，他一生中干了很多事，每一件事都改变了时代。”', '2011-01-04 11:59:41', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('95', '消息称高盛和DST向Facebook注资5亿美元', null, null, null, null, '1月3日消息，据国外媒体报道，高盛和DST已经联合向美国著名社交网站Facebook注资4.5亿美元，由此Facebook的市场估值已经突破500亿美元，高于时代华纳、eBay以及雅虎等媒体巨头', '2011-01-04 12:00:30', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('96', '2011年理财：炒啥能赚钱', '2011年理财：炒啥能赚钱', null, null, null, '2011年理财：炒啥能赚钱', '2011-01-04 12:01:20', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('97', '网易涉足在线机票销售业务', null, null, null, null, '网易宣布推出网易机票业务(http://jipiao.163.com)，目前该业务已在网易通行证、网易商城、网易博客中上线，即日起，用户便可通过这一渠道在线预订国内各大航空公司的航班。据悉，网易是国内首家进军机票在线销售领域的门户网站，这也是继开通彩票、团购等站点后，网易再次涉足电子商务领域', '2011-01-04 12:01:43', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('98', '“京东艳照门”进展：当事双方恐将对簿公堂', null, null, null, null, '此前闹得沸沸扬扬的“京东艳照门”事件又有新进展，当事人余先生向《IT时报》记者表示，他目前正等待京东方面的最后表态，如果对方拒不承担应尽责任，那么他将选择对问题笔记本电脑进行司法鉴定，并随后起诉京东。', '2011-01-04 12:02:43', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('99', '互联网广告商盘石信息技术公司融资2000万美元', null, null, null, null, '本报讯　昨天上午，从事互联网广告行业的盘石信息技术有限公司在省人民大会堂举办“盘石战略融资”新闻发布会，宣布获得上海联创投资管理有限公司的2000万美金战略投资。在会上，盘石董事长兼首席执行官田宁却高调地表示：盘石根本不差钱，也不急着上市，他甚至幽默地说，要让这笔钱“躺在保险柜里”。', '2011-01-04 12:03:32', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('100', '个税改革调级次 2011年有多少政策值得期待', '个税改革调级次 2011年有多少政策值得期待', null, null, null, '2011年，“十二五”开局之年，中央经济工作会议指出，“做好经济社会发展工作具有十分重要的意义”。会议同时指出，我国经济社会发展中的短期问题和长期问题交织，结构性问题和体制性问题并存，必须采取有力措施，积极妥善加以解决。', '2011-01-04 13:22:45', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('101', '2010年：美元最犀利欧元最悲情', '2010年：美元最犀利欧元最悲情', null, null, null, '　　2010年的外汇市场依然延续了金融危机爆发以来的震荡，经历了欧洲债务危机、美国二次量化宽松政策、朝鲜半岛问题等一系列风险事件轮番上演，美元、欧元、日元、澳元这些货币各自为政，汇价走势特点也各有千秋。', '2011-01-04 13:26:35', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('102', '大腕云集 2010年度重量级数码相机回顾', null, null, null, null, '已经正式踏入了2011年，今年每个数码相机生产商会有什么样的技术或者什么样的产品能够呈现给各位，依旧是十分令人期待的。虽说坊间流传甚多，目前却依然没有进一步确实的消息。所谓温故知新，我们今天就和大家回顾一下2010年上市的重量级数码相机，能够从中或多或少地窥探出今年的一个发展趋势，同时也在没有新品发布的淡季里，为大家先来解解渴。好吧，下面我们一同来回顾一下2010年数码相机界里的“大腕儿”们吧。', '2011-01-04 13:29:13', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('103', '双摇杆设计 索爱PSPhone最终版英国现身', null, null, null, null, '上周才报导过索尼爱立信将于2月中举行的MWC展上正式公布Playstation Phone，但短短一星期后，Playstation Phone的宣传照已经等不急要露面了。在英国留学的网友爆料，英国某杂志已经刊登了 Playstation Phone的设计图片及宣传照，并附上一些硬件配置。', '2011-01-04 13:31:05', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('104', '多家险企家财险保费为零 业内称有三大原因', '多家险企家财险保费为零 业内称有三大原因', null, null, null, null, '2011-01-04 13:31:54', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('105', '联想将在CES推出Android平板电脑', null, null, null, null, '联想日前宣布，将在本月6日开始的CES展上发布乐Pad平板电脑产品，这也意味着联想将加入目前的平板电脑大战。', '2011-01-04 13:32:07', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('106', '苹果新年开市第一天市值首次突破3000亿美元', null, null, null, null, '1月4日消息，据国外媒体报道，在2011年美股第一个交易日，苹果公司市值即突破3000亿美元大关，成为美国第二家市值超过3000亿美元的公司', '2011-01-04 13:33:41', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('107', '移动娱乐两不误 市售双显卡笔记本推荐', null, null, null, null, '众所周知笔记本的出现就是为了满足移动办公的各种需求，随着技术的日益更新，硬件配置也随之提高，人们也不满足于笔记本移动办公的单一需求了，而是要求笔记本兼顾娱乐影音性能，玩玩各种3D游戏，或是播放高清视频，处理图像设计工作。并且还希望能保持较长的续航时间。所以各大厂商边不断寻求一个制衡点，所以，双显卡出现在视线里', '2011-01-04 13:35:11', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('108', '勇气号登陆火星7年后失去联系生死不明', null, null, null, null, '北京时间1月4日消息，美宇航局火星探测器“勇气”号在1月3日迎来了登陆火星7周年的特殊日子，不过，由于受困于沙地，它在一年半的时间内仅仅行进了4.8英里(约合7.7公里)，从2010年3月便与科学家失去了联系。', '2011-01-04 13:39:59', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('109', '人类大脑2万年中不断缩小 科学家称是进化表现', null, null, null, null, '最近一项新的研究指出了一个我们都不愿接受的事实——人类的大脑在过去的2万年间逐渐缩小，体积由1500立方厘米，下跌至1350立方厘米，减少的大脑足有网球大小。这意味着我们变得越来越笨吗？', '2011-01-04 13:41:13', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('110', '360帝国周鸿祎：我想做英雄而不只是成功的商人', '360帝国周鸿祎', null, null, null, '“乔布斯是我的榜样，他一生中干了很多事，每一件事都改变了时代。”', '2011-01-04 13:41:56', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('111', '美国培育出人工基因改良牛颜色分布似熊猫', null, null, null, null, '美国科罗拉多州农民培育出一头“身体颜色分布类似大熊猫”的小牛犊(见上图)。这种所谓的“熊猫牛”现在全世界只有24头。它们成年后身材依旧娇小，看上去十分可爱。这个名叫“本”的小家伙去年12月31日清晨出生在拉米拉县的一家农场内。', '2011-01-04 13:42:06', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('112', '宇通客车总裁汤玉祥：不会拓展轿车业务', '宇通客车总裁汤玉祥', null, null, null, '2010年12月27日，几位来自东北的宇通客户因为及时提到了车，在宇通大厦楼上的餐厅推杯换盏，喜形于色，还有一些来自天南海北的客户不得不选择在专门针对客户营业的宇通大厦客房里入住，等待提车的消息。', '2011-01-04 13:43:07', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('113', 'SOHO卫星15年发现2000颗彗星', null, null, null, null, '北京时间1月4日消息，据国外媒体报道，去年的12月26日，正当地球上的人们忙着迎接新年的到来时，太空中有一艘飞船却默默地迎来了属于它的里程碑：发现自己的第2000颗彗星。', '2011-01-04 13:44:04', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('114', '我国首个火星探测器10月发射', null, null, null, null, '火星作为太阳系中最近似地球的天体之一，对人类有一种天然的吸引力。火星探测是21世纪人类深空探测的重点之一，我国正在积极开展火星自主探测的相关研究。', '2011-01-04 13:44:42', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('115', '传Facebook获高盛5亿美元投资 估值达500亿美元', '传Facebook获高盛5亿美元投资 估值达500亿美元', null, null, null, '据知情人士周一表示，美国著名社交网站Facebook已经从高盛集团和德国的一家投资公司Digital Sky Technologies手中获得了5亿美元的投资。', '2011-01-04 13:44:49', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('116', '大佬们的新年：李开复等回老家 李瑜三亚奇遇', '大佬们的新年', null, null, null, '热闹的2010年过去了，伴随着各式各样的盘点，给力的，V5的，淡定……', '2011-01-04 13:46:10', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('117', '百姓网王建硕：分类网站关键在于规模化服务', '百姓网王建硕', null, null, null, '“分类广告是人类的基本需求，只是现在把原本放在平面媒体上的分类信息搬到互联网上而已，‘在线分类＋社区互动’给了分类广告新的生存平台。”', '2011-01-04 13:48:04', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('118', '灵符没能第九次护佑火箭 三分10+定律在丹佛成空', null, null, null, null, '没有内线，只能靠三分，可是当三分武器也失效时，火箭还能拿出什么招数呢？', '2011-01-04 13:50:07', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('119', '连败不掩亮点4场球命中率超6成 火箭匪徒霸气外露', null, null, null, null, '火箭在客场以106-113不敌掘金。蔡斯-巴丁格替补出场20分钟7投5中拿下13分，他似乎再次成为火箭失利后不多的亮点。', '2011-01-04 13:51:17', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('120', '15投12铁连演技都荒废了 马丁距生涯最差只差一步', null, null, null, null, '火箭负于丹佛掘金，凯文-马丁还是没能找到状态，在25分钟时间里15投3中，只博取1次罚球，只得到区区8分。这是马丁本赛季第一次得分少于10分。', '2011-01-04 13:52:15', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('121', '送40次罚球火箭4季仅5次 输掘金比输开拓者强在哪', null, null, null, null, '火箭客场连战开拓者和掘金，战果不出人意料。面对内线实力明显占优的对手，火箭很难防守住对手在内线轰炸篮圈，稍值得欣慰的是两场比赛火箭在防守态度上的改变', '2011-01-04 13:52:59', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('122', '火箭已然被扣“客场虫”帽子 居安不思危连败伺候', null, null, null, null, '火箭在客场以106-113不敌掘金。遭遇连败的火箭确实该总结得失，但实际上他们并不用将一切的错都怪在自己的头上，碰上两支主场强势的球队，火箭输的也无太大问题。', '2011-01-04 13:54:02', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('124', 'AC米兰宣布与切尔西竞逐帝星 巨头卖掉小罗就将签一人', null, null, null, null, '安切洛蒂已经明确向阿布拉莫维奇提出，切尔西目前缺少一名前锋，一名中后卫，而关于中后卫，安切洛蒂点了大卫-路易斯的名字，与此同时，AC米兰的组织经理甘迪也明确表示：AC米兰正在追逐本菲卡的两名后卫，科恩特劳和大卫-路易斯，这也是俱乐部第一次明确证实了之前媒体所猜测的AC米兰对这两人的兴趣', '2011-01-04 13:55:24', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('125', '多地楼市调控细则“和风细雨” 严厉政策遭化解？ ', '多地楼市调控细则“和风细雨” 严厉政策遭化解？ ', null, null, null, '\r\n一些地方楼市调控政策近期陆续出台。与北京调控政策的严厉程度相比，其他地方楼市新政则显得“和风细雨”，力度“温和”。 ', '2011-01-04 13:55:35', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('126', '房产税改革中央地方现分歧　评估机构成关键', '房产税改革中央地方现分歧　评估机构成关键', null, null, null, '　现有地方试点方案，均是修改现行房产税，将已有房产税的征税范围扩展到居民自住房屋，这与部委意见不一；而地方与中央立法精神不一，未来会出现很大麻烦', '2011-01-04 13:56:21', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('127', '3打1单刀本泽马竟不敢射门！ 皇马呼唤冬季购阿德巴约', null, null, null, null, '伊瓜因是否该手术的事情闹得沸沸扬扬，他回到马德里之后在机场受到记者们的围堵，但他只说了句“我要说话的时候会说的”。伊瓜因的伤势，让皇马前锋线上缺兵少将的困境被放大，几个小时之后皇马与赫塔菲的比赛的焦点，就是谁将成为皇马攻击线上的救星', '2011-01-04 13:56:24', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('128', 'AC米兰伪金童半年0球被意乙退货 1年前他还被当新梅西', null, null, null, null, '蒙特隆戈在迪拜对阿尔-阿赫利的热身赛上表现得到了一致的好评，这证明AC米兰这一次在低成本的收购上没有看走眼，不过，另一笔低成本的收购却是彻头彻尾的失败了，在1月1日，AC米兰的阵营中又多了一位球员--1年前的这个时候引进的加纳前锋阿迪亚，当时，阿迪亚顶着世青赛金球加金靴的名头来到AC米兰，加利亚尼当时还说“之前得到世青赛双料先生的是梅西和阿奎罗，希望阿迪亚也能像他们一样”。但事实证明这成了个笑话', '2011-01-04 13:56:52', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('129', '房产调控政策陆续出台 南通楼市成交大幅萎缩', '房产调控政策陆续出台 南通楼市成交大幅萎缩', null, null, null, '　随着住房公积金贷款新政以及央行加息等多重影响，市区住房成交量开始大幅萎缩。记者了解到：2010年12月的第四周也就是12月20日至12月26日，市区共成交住宅163套，较前一周减少335套，环比下降了67.27%。', '2011-01-04 13:57:09', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('130', '国米现场密探5000万帝王星 莱帅引援全抢AC米兰猎物', null, null, null, null, '果不其然，卡卡在皇马2011年的首场比赛中伤愈复出，在万千球迷的注视下完成了15分钟的表演。而额外关注卡卡表现的，或许还有众多国际米兰的球迷。自莱昂纳多上任以后，有关国际米兰引进卡卡的传闻就从未间断，不少国米球迷都想看看，卡卡是不是还是当初敌对阵营中的那个追风少年。而据意大利媒体报道，昨日在佩雷斯球场的看台上，也的确出现了国际米兰球探们的身影', '2011-01-04 13:57:18', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('131', '央视主持微博建议 春晚不要使用网络热语', '央视主持微博建议 春晚不要使用网络热语', null, null, null, '日前，有央视的主持人在微博上建议，春晚节目不要使用网络语言了。', '2011-01-04 13:57:35', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('132', '巴萨3年功勋申请转会已获批准 新星不要续约铁定离队', null, null, null, null, '据加泰罗尼亚一家叫做Ona.FM的电台报道，巴萨的阿根廷后卫加布里埃尔-米利托希望在冬季离开巴萨，去其他球队争取更多的出场机会', '2011-01-04 13:57:42', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('133', '房地产2011年投资策略：区域分化 “稳”见未来', '房地产2011年投资策略：区域分化 “稳”见未来', null, null, null, '未来政策展望:我们认为明年房地产调控将更多使用货币手段，通过调整利率、信贷窗口指导、准备金等工具统筹应对房价上涨和通货膨胀。同时增加保障房供应，继续打击囤房、囤地，加大土地供应力度，缓解供给矛盾将是明年的另一条主线。另外，房产税试点政策明年出台的可能性也较大，如果实际政策力度符合预期，则可能引发阶段性行情；但房产税征收范围扩大或税率较高，则对于房地产市场以及股票市场均是较大打击。 ', '2011-01-04 13:57:50', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('134', '陈思成自导自演《北爱》 逼李晨跳楼戏不用替身', '陈思成自导自演《北爱》 逼李晨跳楼戏不用替身', null, null, null, '2011年1月2日正值元旦假期，北京CBD街头显得有些冷清，演员李晨从一栋六层的高楼上一跃而下，引起了楼下围观人群的一阵阵惊呼。原来由新经典娱乐传媒投资拍摄，滕华弢监制、陈思成自编自导自演的情感剧《北京爱情故事》正在拍摄开场戏。', '2011-01-04 13:59:24', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('135', '胜负彩11002期任选9场开奖：一等奖7479注1500元', null, null, null, null, '胜负彩11002期任选9场开奖揭晓：一等奖7476注，每注奖金1500元。任选九场总销量：17533548元。上百位网友命中任九头奖，其中[战神时代]一人独中78注任九头奖为平台最多，[北单高手]命中32注任九头奖，而网友[有耐心必成功]凭借576注方案也擒得12注任九头奖', '2011-01-04 13:59:56', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('136', '《宫》抢眼芒果粉丝节 笑对乌龙相约春节首播', '《宫》抢眼芒果粉丝节 笑对乌龙相约春节首播', null, null, null, '由于清穿剧《宫》最终被湖南卫视购入并且作为开春大戏从正月初五开始全国首播，三名主演杨幂、冯绍峰、何晟铭也以嘉宾身份参加芒果粉丝节多项活动，晚上又现身直播现场，化身爱情代言组合在节目压轴阶段亮相，人气大爆。', '2011-01-04 14:00:14', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('137', '人盛巴厘天地N+1百变户型5500元/㎡起', '人盛巴厘天地N+1百变户型5500元/㎡起', null, null, null, '位于从化市太平神岗广从北路263号的人盛巴厘天地（资料、团购、论坛、二手）目前在售100-132平方米的三房单位，户型设计采用“N+1”百变户型，赠送空间高达15%，毛坯售价5500元/平方米起，最低首付只需12万元。', '2011-01-04 14:00:40', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('138', '足彩开奖：一等奖60注43万 二等4千1网友揽110万', null, null, null, null, '北京时间1月2日，胜负彩第11001期开奖，头奖开出60注434015元，二等奖出1555注4194元，上期1082万滚存本期。投注平台[北单高手]中2注头奖56注二等揽110余万，[战神时代]中1注头奖25注二等，另外他还获得了303注任九获得95万多元', '2011-01-04 14:00:55', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('139', '花都雅居乐花园\"花间集\"二期6800元/㎡起', '花都雅居乐花园\"花间集\"二期6800元/㎡起', null, null, null, '位于花都区新华三东大道与茶碑路交汇处的花都雅居乐花园（资料、团购、论坛、二手）目前主要推售“花间集”二期单位，主要户型为100-131㎡的三至四房，毛坯均价6800元/平方米，带装修8000-9000元元/平方米，其中 100㎡的单位带装修交楼，127-131㎡的单位毛坯发售。 花间集所有户型均带7米观景阳台、空中花园、大面积入户花园。', '2011-01-04 14:01:24', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('140', '胜负彩11001期任9头奖1397元 1网友合买斩获42万', null, null, null, null, '2011年1月2日，胜负彩11001期任选9场开奖揭晓：一等奖出9078注 ，每注奖金1397元。任选九场总销量：19828386元。平台任选九场方面是遍地开花，共计有170多位会员中得头奖，其中[战神时代]的4万元合买单揽下303注，共计斩获奖金423291元', '2011-01-04 14:01:37', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('141', '投资型公寓卡布奇诺1月底开盘', '投资型公寓卡布奇诺1月底开盘', null, null, null, '位于白云广州大道北同和华远厂路段的卡布奇诺（资料、团购、论坛、二手）将于1月底开盘，首期主推22-42㎡单身公寓和55㎡一房单位，预计均价13000-16000万元/平方米，带装修和家私家电，之前进行诚意登记的买家开盘可享受98折优惠，2011年8月可交楼。项目周边有吉之岛、乐购、广百、金逸国际电影城。', '2011-01-04 14:02:08', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('142', '胜负彩11003期部分专业媒体复式推荐总汇', null, null, null, null, '媒体推荐的“历史命中率统计”表示媒体历史平均命中场次，即：历史命中总场数/(胜负彩期数*14)，该数据从胜负彩第08070期开始统计；如上期该媒体无推荐，则“上期命中”用“-”代替', '2011-01-04 14:02:15', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('143', '《钢铁年代》热播 陈宝国：这次演工人踏实多了', '《钢铁年代》热播 陈宝国：这次演工人踏实多了', null, null, null, '今年元旦，由陈宝国领衔主演的工人题材电视剧《钢铁年代》，作为开年大戏，登陆北京、山东等四大卫视黄金档。昨日，陈宝国接受了华西都市报记者的电话专访。', '2011-01-04 14:02:23', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('144', '佬牛解盘：阿森纳主胜过热防冷负 罗马主胜是稳胆', null, null, null, null, '11003期胜负彩回归久违的英意联赛组合，本轮英超为连赛四轮圣诞战的最后一轮，因延期耽误和主客场因素使得球队消耗颇有不同。而意甲则是下半程的开铺之战，短暂冬休令球队备战充满变数。本期足彩欧赔支持亚盘在半/一以上让球只有四场，胆材不丰，竞猜似有难度', '2011-01-04 14:02:47', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('145', '君华香柏广场C栋19000元/㎡带装修', '君华香柏广场C栋19000元/㎡带装修', null, null, null, '位于白云区广州大道北与京溪路交汇处的君华香柏广场（资料、团购、论坛、二手）目前在售全新的C栋91-135平方米三房、四房“珍爱大宅”，均价19000元/平方米，带3500元/平方米装修。', '2011-01-04 14:02:48', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('146', '《水浒》武松爱上潘金莲 导演:为荡妇形象翻案', '《水浒》武松爱上潘金莲 导演:为荡妇形象翻案', null, null, null, '新年伊始，新《水浒》火速占据荧屏，但也惹来口水不断。其中，争议最大的就是武松与潘金莲扑朔迷离的“叔嫂情愫”，名著迷们纷纷诟病：“名著改编要有度，武松怎能对潘金莲有情？”', '2011-01-04 14:04:02', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('147', '东方夏湾拿\"巴亚莫\"联排别墅10000元/㎡起', '东方夏湾拿\"巴亚莫\"联排别墅10000元/㎡起', null, null, null, '位于从化神岗镇广从公路莲塘桥的东方夏湾拿（资料、团购、论坛、二手）推出最新一期联排别墅“巴亚莫”组团，带首层老人房、中空客厅、独立天井设计，面积271-277平方米，五房三厅六卫设计，售价10000元/平米起。', '2011-01-04 14:04:12', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('148', '《包青天》今日上星首播 \"展昭\"与\"婉君\"恋爱', '《包青天》今日上星首播 \"展昭\"与\"婉君\"恋爱', null, null, null, '包青天》原班人马拍摄的《包青天之七侠五义》今天（4日）将于安徽卫视上星首播，据悉这是《包青天》系列剧首度涉及包公的家庭，而夺人眼球的是“展昭”何家劲将和比他小20岁的“婉君”金铭谈情说爱。', '2011-01-04 14:04:51', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('149', '跨年晚会25城市收视率出炉 央视不敌湖南卫视', '跨年晚会25城市收视率出炉 央视不敌湖南卫视', null, null, null, '索福瑞快速监测数据显示，各卫视跨年夜25城市的收视率排名出炉，湖南卫视暂夺全国同时段第一，而首办跨年晚会的老大哥央视目前仅排第三。', '2011-01-04 14:06:07', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('150', '转让二手房 土地增值税猛涨十倍', null, null, null, null, '顺德区低调出台了一份《关于调整土地增值税预征率和核定征收率的公告（2010年第2号）》（以下简称《公告》），给楼市投出了一份“重磅炸弹”，本报在第一时间独家获知了该政策的内容。新政策规定，从2011年元旦起，顺德的纳税人转让普通二手住宅的，其土地增值税的核定征收率从原来的0.5%提高到5%，涨了整整十倍，二手房的置业门槛将再次被抬高', '2011-01-04 14:10:14', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('151', '二手房成交量退房率均创新高', null, null, null, null, '日前，北京房地产交易管理网和北京市房地产中介行业协会网站公布了11月份二手房市场的交易数据。通过对比了解，笔者发现了一个有趣的现象，11月份二手房成交套数达到了16805套，创下了新政之后二手房成交量的新高，而退房套数却也高达2790套，退房比例达到16.6％。这不禁令人心生疑惑，火爆的成交状况反映了买房人购房热情的高涨，却为何又会出现大量的退房呢？《广厦时代》带着疑问采访了多家二手房门店和二手房市场研究人士', '2011-01-04 14:10:46', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('152', '二手房过户赠与比例上升 专家称并不划算', null, null, null, null, '中介经纪小王最近遇到一位客户，看中了一套2009年的次新房，但由于是二次购房，3%的契税、5%的营业税和1%的个人所得税，让购房人觉得不堪重负，就想通过“假赠与”的方式，办理过户手续', '2011-01-04 14:11:15', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('153', '二手房成交总体回落 五大城市再陷观望', null, null, null, null, '11月10日，中原集团发布二手住宅市场月报称，10月份，国内5大城市二手住宅市场再度陷入观望，成交量在持续4个月回升之后开始回落。总体来看，价格虽未出现下跌，但涨幅明显收窄', '2011-01-04 14:11:48', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('154', '对“房价泡沫”网友很激动 二手房买卖方很淡定', null, null, null, null, '“福州原均价3000元，现均价10000元，正好泡沫70%！”在社科院公布绿皮书之后，福州本地不少网友通过回帖的方式，对福州的“房价泡沫”进行激烈的评论，观点基本上“一边倒”地谴责目前房价虚高。而另一方面，记者在走访业界的时候却发现，不少业界人士表示虽然网上波涛汹涌，网下的交易双方却没有太大反应', '2011-01-04 14:12:23', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('156', '低碳环保旧物巧改收纳箱', '低碳环保旧物巧改收纳箱', null, null, null, null, '2011-01-04 14:14:35', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('157', '懒人必备的盘子餐桌', '懒人必备的盘子餐桌', null, null, null, 'Elad Kashi所设计的盘子餐桌，多了份自由、洒脱，吃饭时无需额外的盘子来承装食物，餐桌上凸凹有致的形状即可用来承装美味，吃完时将桌子擦拭干净即可，对于懒人来说很是实用。', '2011-01-04 14:15:22', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('158', '实木地板调价订单下滑 不调利润压缩', '实木地板调价订单下滑 不调利润压缩', null, null, null, '正值元旦佳节，但实木地板厂老板李伟俊却颇为烦恼，不断上涨的生产成本，让他左右为难。昨日，记者从部分实木地板生产企业处了解到，由于生产成本不断上涨，厂家纷纷上调地板出厂价，这直接导致订单下滑。', '2011-01-04 14:16:24', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('159', '12款简约时尚的客厅电视柜设计', null, null, null, null, '无论你每天面对电视的时间长短，一台电视机总还是家里的必备。平板电视的普及使得电视柜的样子也发生了很大变化，电视机与家具的融合度更高，因此在选择的时候需要考虑的细节也更多。', '2011-01-04 14:16:43', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('160', '“漂浮”在树梢的住家', null, null, null, null, '整座房屋可以说是完全颠倒过来建造，以天花板为水平，由上往下延伸一直到山坡面。建筑材料运用了水泥、钢筋以及木材，屋顶露台可以远眺大海以及山景，被树木以及自然生态包围，而且又符合环保。', '2011-01-04 14:17:54', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('161', '外部多重压力将影响未来整体衣柜发展', '外部多重压力将影响未来整体衣柜发展', null, null, null, '据悉，2010年下半年以来，衣柜企业整体销售形势不容乐观。不少企业下滑幅度高达60%，在一些主流卖场里，即使排名前十名的企业也未必能盈利。在这种情况下，企业纷纷打出了涨价牌，实属无奈之举。', '2011-01-04 14:18:34', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('162', '一月影市前瞻：《新少林寺》挑战《创：战纪》', null, null, null, null, '1月称得上华语大片的唯有陈木胜导演的《新少林寺》一部，不过两部引进电影《创：战纪》和《纳尼亚传奇：黎明踏浪号》也都是重量级的作品。另外，1月还有不少合家欢喜剧扎堆上映，为即将到来的春节营造喜庆的氛围，适合全家一同走进影院观赏。', '2011-01-04 14:21:10', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('163', '2011新年无新片 《拜见岳父大人3》票房过亿', null, null, null, null, '2011年第一个周末，美国影市没有任何大范围公映的新片，所以前十榜的排名基本和2010年最后一个周末一样。环球影业的《拜见岳父大人3》以2630万美元连庄冠军。本周末总票房比起去年同期《阿凡达》在位时少了27%。', '2011-01-04 14:22:53', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('164', '《魔术师》导演曝新片计划 尝鲜3D片或真人电影', null, null, null, null, '2003年，西维亚·乔迈凭借一部《疯狂约会美丽都》扬名动画片界，今年这位导演更是推出了年度最佳动画片之一《魔术师》，算是在3D动画电影横行于世的今天，树起了一面特立独行2D动画大旗。', '2011-01-04 14:24:26', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('165', '专访姜文：换个导演攒不齐《让子弹飞》这帮人', null, null, null, null, '12月3日，《大笑江湖》的公映揭开了今年贺岁档的序幕。当晚，由姜文、葛优、周润发领衔主演的华语大片《让子弹飞》也在京举行了媒体试映会。翌日下午，导演兼主演的姜文接受了网易娱乐的专访。', '2011-01-04 14:26:05', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('166', '《大笑》做客 小沈阳：春晚压力大堪比五部电影', null, null, null, null, '《大笑江湖》导演朱延平携主演小沈阳、毕畅、翟星月做客“网易会客室”，为网友解密影片台前幕后故事。已经连续“征战”三年的朱延平导演，感慨内地贺岁档太“凶残”打得太激烈，小沈阳则坦言春晚的压力其实更大，堪比五部贺岁电影。', '2011-01-04 14:27:29', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('167', '范冰冰称会放弃一切去爱 暗示婚后会退出娱乐圈', null, null, null, null, '据香港媒体报道，范冰冰接受杂志问大谈爱情，她表示无论有多成功、名气多大，当爱情来临的一天，她同样会放弃一切去爱，笑言：“我希望的爱情是平和、温暖的，一个可以给我家的感觉的人，我会放弃现在的生活和事业，去享受平凡人的快乐。”', '2011-01-04 14:29:46', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('168', '周杰伦英文讲错当众出糗 卡梅隆出言相救', null, null, null, null, '英国媒体用英文访问周杰伦时，他频用手摸耳朵掩饰尴尬，不知是否太紧张，竟将“挑战”讲成“Talenge”，卡梅隆赶紧边笑边点头，低声相救喊：“Challenge。”', '2011-01-04 14:30:34', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('169', '钟楚红约女友逛街吃饭 喜欢悠闲暂无意复出', null, null, null, null, '据香港媒体报道，息影多时的钟楚红(红姑)，近年经常被问何时复出拍戏，她表示喜欢过悠闲生活，暂无意复出。', '2011-01-04 14:31:24', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('170', '冯小刚做客新版《小崔说事》:闺女都觉得我欠抽', null, null, null, null, '日前，崔永元带着他的新版《小崔说事》在央视录制了2011年开年的四期节目。节目最后，冯小刚和崔永元聊起了家庭生活和如何教女，冯小刚透露女儿有一次给我打电话说“爸，我觉得你特欠，看了你的微博我特想抽你，可是我觉得你说的道理都对。”', '2011-01-04 14:32:11', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('171', '王思懿：我已成为北京人 内心一直感谢张纪中', null, null, null, null, '台湾演员王思懿当年因扮演张纪中的电视剧《水浒传》中的“潘金莲”一炮走红内地。日前她接受专访时表示，演完潘金莲后，就没回台湾去，一直在北京发展。“所以，我已成为北京人了”。同时，她也表示从内心一直很感谢张纪中。', '2011-01-04 14:34:06', null, null, null, '0', null, null, null, null, null);
INSERT INTO `dc_content_ext` VALUES ('172', '酷乐影音2010 1.0.3.6', '酷乐影音', null, null, null, '无需付费购买，到官方指定下载地址下载安装后即可以使用具有灵活点播的功能，随点随看，时间自由掌握操作简单，界面简洁明了掌握最先进的P2SP传输技术，传输速度更快，更节省带宽占用CPU、内存、带宽等系统资源占用少，不影响其它操作。 ', '2011-01-04 14:34:23', null, null, null, '0', null, 'http://img.duote.com/softImg/soft/25902_s.jpg', null, null, null);
INSERT INTO `dc_content_ext` VALUES ('173', '千千静听(TTPlayer) V5.7 BETA1', '千千静听', null, null, null, '千千静听是一款完全免费的音乐播放软件，拥有自主研发的全新音频引擎，集播放、音效、转换、歌词等众多功能于一身。其小巧精致、操作简捷、功能强大的特点，深得用户喜爱，被网友评为中国十大优秀软件之一，并且成为目前国内最受欢迎的音乐播放软件。', '2011-01-04 14:44:02', null, null, null, '0', null, 'http://ttplayer.qianqian.com/upload/100902/100902162707s.jpg', null, null, null);
INSERT INTO `dc_content_ext` VALUES ('174', '谷歌浏览器(Google Chrome) V6.0.447.0 Beta', '谷歌浏览器', null, null, null, 'Google Chrome(谷歌浏览器)是由Google开发的一款可让您更快速、轻松且安全地使用网络的浏览器，它的设计超级简洁，使用起来更加方便。', '2011-01-04 14:44:59', null, null, null, '0', null, 'http://img.duote.com/softImg/soft/5897_s.jpg', null, null, null);
INSERT INTO `dc_content_ext` VALUES ('175', '超级硬盘数据恢复软件 V2.3.1.1 ', '硬盘数据恢复软件', null, null, null, '超级硬盘数据恢复软件是一款简单易用且功能强大的数据恢复软件，可以恢复被删除、被格式化、分区丢失、重新分区或者分区提示格式化的数据。采用了最新的数据扫描引擎，以只读的方式从磁盘底层读出原始的扇区数据，经过高级的数据分析算法，扫描后把丢失的目录和文件在内存中重新建立出原先的分区和原先的目录结构，数据恢复的效果非常好。', '2011-01-04 14:46:00', null, null, null, '0', null, 'http://img.duote.com/softImg/soft/6732_s.jpg', null, null, null);
INSERT INTO `dc_content_ext` VALUES ('176', '美国国家地理评2010年最佳太空图片', '国家地理最佳太空图片', null, null, null, '包括曼谷上空日环食、哈勃太空望远镜拍摄的神秘山等壮观景象。', '2011-01-04 14:55:11', null, null, null, '0', null, null, 'http://img2.cache.netease.com/cnews/2010/12/6/201012061800268136c.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('177', '外太空鸟瞰地球河流', '外太空鸟瞰地球河流', null, null, null, '这些旖旎的风景，从一个侧面反映出了气候对地球环境的影响。', '2011-01-04 14:56:38', null, null, null, '0', null, null, 'http://img1.cache.netease.com/cnews/2010/11/11/20101111142555e4f00.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('178', '抓拍彗星划过洛城夜空', '抓拍彗星划过洛城夜空', '', '', '', '11月9日，美国洛杉矶，池谷—村上彗星划过夜空。', '2014-04-06 00:00:00', '', null, '', '0', '/u/cms/www/201404/06225823dpxy.jpg', '', 'http://img2.cache.netease.com/cnews/2010/11/19/20101119150339508b6.jpg', '', '');
INSERT INTO `dc_content_ext` VALUES ('179', '微观摄影赛获奖作品选', '微观摄影赛获奖作品选', null, null, null, '微观世界摄影大赛公布2010年获奖者名单,展示了一场视觉盛宴。', '2011-01-04 14:58:20', null, null, null, '0', null, null, 'http://img1.cache.netease.com/cnews/2010/10/23/2010102315250086ae8.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('180', '镜头下的梦幻冰川洞穴', '镜头下的梦幻冰川洞穴', null, null, null, '这些怪异的冰川洞穴中环境温度有时会低至-20度以下', '2011-01-04 14:59:06', null, null, null, '0', null, null, 'http://img1.cache.netease.com/cnews/2010/10/20/2010102010384818a9e.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('181', '微距下的昆虫之美', '微距下的昆虫之美', null, null, null, '在微距摄影师约翰·霍尔门看来，昆虫隐藏着数不清的魅力。', '2011-01-04 14:59:48', null, null, null, '0', null, null, 'http://img2.cache.netease.com/cnews/2010/10/20/20101020101550c3f85.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('182', '美国迎来秋天狩猎季', '美国迎来秋天狩猎季', null, null, null, '对于数百万美国人来说，秋天是狩猎季节的开始。', '2011-01-04 15:00:32', null, null, null, '0', null, null, 'http://img2.cache.netease.com/cnews/2010/9/28/201009281459528f697.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('183', '艺术家创石头平衡术', '艺术家创石头平衡术', null, null, null, '据英国《每日邮报》报道，英国艺术家阿德里安·格雷在海滩上利用石头创造出令人惊奇的艺术作品。', '2011-01-04 15:01:43', null, null, null, '0', null, null, 'http://img2.cache.netease.com/cnews/2010/9/16/201009161706524bdbc.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('184', '印尼海底发现新物种', '印尼海底发现新物种', null, null, null, '当地时间8月26日，由印度尼西亚和美国科学家组成的探险小组宣布，他们利用无人遥控潜水器在对印尼苏拉威西岛附近的卡维奥巴拉特海底火山勘测时，意外发现一批新的海洋生物。', '2011-01-04 15:03:31', null, null, null, '0', null, null, 'http://img2.cache.netease.com/cnews/2010/8/30/2010083015190967339.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('185', '首位机器宇航员将服役', '首位机器宇航员将服役', null, null, null, '2010年9月，“机器宇航员2号”将有可能前往国际空间站。该机器人成员的主要工作任务在于执行国际空间站中危险及重复的太空作业，以节省人手和时间使得空间站的其他宇航员可以从事其他太空研究工作.', '2011-01-04 15:04:31', null, null, null, '0', null, null, 'http://img1.cache.netease.com/cnews/2010/8/13/2010081315365844b74.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('186', '谎言：日本科研捕鲸', '谎言：日本科研捕鲸', null, null, null, '2010年6月25日世界捕鲸委员会（IWC）年度大会在摩洛哥阿迪加尔闭幕，这次原本旨在达成新的捕鲸管理法规的国际努力最终无果而终。这意味着，日本依然可以“科研捕鲸”的借口每年捕杀1500头鲸，其中包括在南大洋鲸类禁猎区捕鲸。', '2011-01-04 15:05:34', null, null, null, '0', null, null, 'http://img1.cache.netease.com/cnews/2010/6/30/201006301150090b875.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('187', '农场上的狂欢：欧洲最大的音乐节', '欧洲最大的音乐节', null, null, null, '6月23日第四十届格拉斯顿伯里音乐节在英国格拉斯顿伯里的沃西农场开幕。由奶农迈克尔·伊维斯于1970年创办的音乐节，如今已成为欧洲最大的音乐节。', '2011-01-04 15:06:52', null, null, null, '0', 'http://img1.cache.netease.com/cnews/2010/7/1/20100701105023f6a14.jpg', null, 'http://img1.cache.netease.com/cnews/2010/7/1/20100701105023f6a14.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('188', '世界各地迎接2011新年', '世界各地迎接2011新年', null, null, null, '2011年在全球各地逐渐揭开面纱，庆贺新年伊始是世界各国各地区的普遍习俗，各地民众纷纷以各种庆祝活动迎接新年的到来。', '2011-01-04 15:13:44', null, null, null, '0', null, null, 'http://img1.cache.netease.com/cnews/2011/1/1/201101011535122ec4b.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('189', '大连遭遇强降雪和寒潮天气', '大连遭遇强降雪和寒潮天气', null, null, null, '12月29日，大连遇遇降雪和寒潮天气。据当地气象部门预报，29日至30日大连市将有中到大雪，同时伴有大风降温，此次降雪过程将是大连市今年入冬以来最强的一次降雪', '2011-01-04 15:14:56', null, null, null, '0', null, null, 'http://img2.cache.netease.com/cnews/2011/1/1/201101011533141e85c.jpg', null, null);
INSERT INTO `dc_content_ext` VALUES ('190', 'TWSDS', 'TWSDS', 'TWSDS', 'TWSDS', 'TWSDS', 'TWSDS', '2014-04-01 00:00:26', '', null, 'TWSDS', '0', '', '', '', '', '');
INSERT INTO `dc_content_ext` VALUES ('192', 'TWSDS', 'TWSDS', 'TWSDS', 'TWSDS', 'TWSDS', 'TWSDS', '2014-04-06 00:00:00', '', null, 'TWSDS', '0', '', '', '', '', '');
INSERT INTO `dc_content_ext` VALUES ('195', '房地产2011年投资策略：区域分化 “稳”见未来', '房地产2011年投资策略：区域分化 “稳”见未来', 'admin', 'baidu.com', 'http://www.baidu.com', '未来政策展望:我们认为明年房地产调控将更多使用货币手段，通过调整利率、信贷窗口指导、准备金等工具统筹应对房价上涨和通货膨胀。同时增加保障房供应，继续打击囤房、囤地，加大土地供应力度，缓解供给矛盾将是明年的另一条主线。另外，房产税试点政策明年出台的可能性也较大，如果实际政策力度符合预期，则可能引发阶段性行情；但房产税征收范围扩大或税率较高，则对于房地产市场以及股票市场均是较大打击。', '2014-04-06 00:00:00', 'http://localhost:8080/dwcms/u/cms/www/201404/06141405kf51.jpg', 'WM', '#0066CC', '0', '', '', '/u/cms/www/201404/0620553334ml.jpg', 'www.baidu.com', '');
INSERT INTO `dc_content_ext` VALUES ('197', 'fdsa', 'fdsa', 'fdsa', 'fdsa', 'fdas', 'fds', '2014-04-12 00:58:30', '', null, '#000099', '0', '', '', '', '', '');
INSERT INTO `dc_content_ext` VALUES ('198', 'AA', 'fdsa', 'fds', 'fdsa', 'dsa', 'dfas', '2014-05-03 00:00:00', 'fdsadfs', 'WM', '#0099CC', '0', '', '', '', '', '');
INSERT INTO `dc_content_ext` VALUES ('199', 'fdas', 'fdsa', 'fds', 'fdsa', 'fdsa', 'fdsa', '2014-04-12 00:00:00', '', null, '#0033CC', '0', '', '', '', '', '');
INSERT INTO `dc_content_ext` VALUES ('200', '超级硬盘数据恢复软件 V2.3.1.1', '硬盘数据恢复软件', 'admin', null, null, '超级硬盘数据恢复软件是一款简单易用且功能强大的数据恢复软件，可以恢复被删除、被格式化、分区丢失、重新分区或者分区提示格式化的数据。采用了最新的数据扫描引擎，以只读的方式从磁盘底层读出原始的扇区数据，经过高级的数据分析算法，扫描后把丢失的目录和文件在内存中重新建立出原先的分区和原先的目录结构，数据恢复的效果非常好。', '2014-04-12 00:00:00', null, null, '#993300', '0', null, 'http://img.duote.com/softImg/soft/6732_s.jpg', null, '', '/red/content/新闻内容.html');
INSERT INTO `dc_content_ext` VALUES ('201', '超级硬盘数据恢复软件 V2.3.1.1', '硬盘数据恢复软件', 'admin', null, null, '超级硬盘数据恢复软件是一款简单易用且功能强大的数据恢复软件，可以恢复被删除、被格式化、分区丢失、重新分区或者分区提示格式化的数据。采用了最新的数据扫描引擎，以只读的方式从磁盘底层读出原始的扇区数据，经过高级的数据分析算法，扫描后把丢失的目录和文件在内存中重新建立出原先的分区和原先的目录结构，数据恢复的效果非常好。', '2014-04-12 00:00:00', null, null, '#0066CC', '0', null, 'http://img.duote.com/softImg/soft/6732_s.jpg', null, '', '');
INSERT INTO `dc_content_ext` VALUES ('202', '超级硬盘数据恢复软件 V2.3.1.1', '硬盘数据恢复软件', 'admin', null, null, '超级硬盘数据恢复软件是一款简单易用且功能强大的数据恢复软件，可以恢复被删除、被格式化、分区丢失、重新分区或者分区提示格式化的数据。采用了最新的数据扫描引擎，以只读的方式从磁盘底层读出原始的扇区数据，经过高级的数据分析算法，扫描后把丢失的目录和文件在内存中重新建立出原先的分区和原先的目录结构，数据恢复的效果非常好。', '2014-04-12 00:00:00', null, null, '#0066CC', '0', null, 'http://img.duote.com/softImg/soft/6732_s.jpg', null, '', '/red/content/新闻内容.html');
INSERT INTO `dc_content_ext` VALUES ('203', '超级硬盘数据恢复软件 V2.3.1.1', '硬盘数据恢复软件', 'admin', null, null, '超级硬盘数据恢复软件是一款简单易用且功能强大的数据恢复软件，可以恢复被删除、被格式化、分区丢失、重新分区或者分区提示格式化的数据。采用了最新的数据扫描引擎，以只读的方式从磁盘底层读出原始的扇区数据，经过高级的数据分析算法，扫描后把丢失的目录和文件在内存中重新建立出原先的分区和原先的目录结构，数据恢复的效果非常好。', '2014-04-12 00:00:00', null, null, '#0066CC', '0', null, 'http://img.duote.com/softImg/soft/6732_s.jpg', null, '', '/red/content/新闻内容.html');
INSERT INTO `dc_content_ext` VALUES ('204', '超级硬盘数据恢复软件 V2.3.1.1', '硬盘数据恢复软件', 'admin', null, null, '超级硬盘数据恢复软件是一款简单易用且功能强大的数据恢复软件，可以恢复被删除、被格式化、分区丢失、重新分区或者分区提示格式化的数据。采用了最新的数据扫描引擎，以只读的方式从磁盘底层读出原始的扇区数据，经过高级的数据分析算法，扫描后把丢失的目录和文件在内存中重新建立出原先的分区和原先的目录结构，数据恢复的效果非常好。', '2014-04-12 00:00:00', null, null, '#0066CC', '0', null, 'http://img.duote.com/softImg/soft/6732_s.jpg', null, '', '/red/content/新闻内容.html');
INSERT INTO `dc_content_ext` VALUES ('206', 'fdfdfd', 'ffd', 'fds', 'fds', 'fds', 'sdf', '2014-04-23 23:34:11', 'fdsfds', 'WM', '#003366', '0', '', '', '', '', '');
INSERT INTO `dc_content_ext` VALUES ('207', 'fsdad', 'dfsa', 'sadf', null, null, 'dasf', '2014-04-23 23:58:51', null, null, '#000099', '0', null, '', null, '', '');

-- ----------------------------
-- Table structure for `dc_content_group_view`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_group_view`;
CREATE TABLE `dc_content_group_view` (
  `content_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`group_id`),
  KEY `fk_jc_content_group_v` (`group_id`),
  CONSTRAINT `fk_jc_content_group_v` FOREIGN KEY (`group_id`) REFERENCES `dc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_content_v` FOREIGN KEY (`content_id`) REFERENCES `dc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容浏览会员组关联表';

-- ----------------------------
-- Records of dc_content_group_view
-- ----------------------------
INSERT INTO `dc_content_group_view` VALUES ('195', '1');
INSERT INTO `dc_content_group_view` VALUES ('197', '1');
INSERT INTO `dc_content_group_view` VALUES ('200', '1');
INSERT INTO `dc_content_group_view` VALUES ('201', '1');
INSERT INTO `dc_content_group_view` VALUES ('202', '1');
INSERT INTO `dc_content_group_view` VALUES ('203', '1');
INSERT INTO `dc_content_group_view` VALUES ('204', '1');
INSERT INTO `dc_content_group_view` VALUES ('207', '1');
INSERT INTO `dc_content_group_view` VALUES ('195', '2');
INSERT INTO `dc_content_group_view` VALUES ('197', '2');
INSERT INTO `dc_content_group_view` VALUES ('200', '2');
INSERT INTO `dc_content_group_view` VALUES ('201', '2');
INSERT INTO `dc_content_group_view` VALUES ('202', '2');
INSERT INTO `dc_content_group_view` VALUES ('203', '2');
INSERT INTO `dc_content_group_view` VALUES ('204', '2');
INSERT INTO `dc_content_group_view` VALUES ('207', '2');
INSERT INTO `dc_content_group_view` VALUES ('199', '3');

-- ----------------------------
-- Table structure for `dc_content_picture`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_picture`;
CREATE TABLE `dc_content_picture` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `img_path` varchar(100) NOT NULL COMMENT '图片地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`content_id`,`priority`),
  CONSTRAINT `fk_jc_picture_content` FOREIGN KEY (`content_id`) REFERENCES `dc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容图片表';

-- ----------------------------
-- Records of dc_content_picture
-- ----------------------------
INSERT INTO `dc_content_picture` VALUES ('133', '0', '/u/cms/www/201404/040008321oub.jpg', 'pic1111');
INSERT INTO `dc_content_picture` VALUES ('195', '1', '/u/cms/www/201404/06205540ivhc.jpg', 'water');
INSERT INTO `dc_content_picture` VALUES ('195', '2', '/u/cms/www/201404/06141030ptxd.jpg', 'AAS');

-- ----------------------------
-- Table structure for `dc_content_tag`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_tag`;
CREATE TABLE `dc_content_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL COMMENT 'tag名称',
  `ref_counter` int(11) NOT NULL DEFAULT '1' COMMENT '被引用的次数',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `ak_tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='CMS内容TAG表';

-- ----------------------------
-- Records of dc_content_tag
-- ----------------------------
INSERT INTO `dc_content_tag` VALUES ('2', '中国', '1');
INSERT INTO `dc_content_tag` VALUES ('3', '货币', '1');
INSERT INTO `dc_content_tag` VALUES ('4', '信贷', '1');
INSERT INTO `dc_content_tag` VALUES ('5', '楼市', '2');
INSERT INTO `dc_content_tag` VALUES ('6', '限购令', '1');
INSERT INTO `dc_content_tag` VALUES ('7', '人民币', '1');
INSERT INTO `dc_content_tag` VALUES ('8', '升值', '1');
INSERT INTO `dc_content_tag` VALUES ('9', '机构', '2');
INSERT INTO `dc_content_tag` VALUES ('11', '回落', '1');
INSERT INTO `dc_content_tag` VALUES ('12', '资金', '1');
INSERT INTO `dc_content_tag` VALUES ('13', '净流出', '1');
INSERT INTO `dc_content_tag` VALUES ('14', '桑德', '1');
INSERT INTO `dc_content_tag` VALUES ('15', '投“靶”', '1');
INSERT INTO `dc_content_tag` VALUES ('16', '基金', '4');
INSERT INTO `dc_content_tag` VALUES ('17', '资管', '1');
INSERT INTO `dc_content_tag` VALUES ('18', '回报', '1');
INSERT INTO `dc_content_tag` VALUES ('19', 'A股', '1');
INSERT INTO `dc_content_tag` VALUES ('20', '债基', '1');
INSERT INTO `dc_content_tag` VALUES ('21', '绩效', '1');
INSERT INTO `dc_content_tag` VALUES ('22', '上市', '1');
INSERT INTO `dc_content_tag` VALUES ('23', '年前', '1');
INSERT INTO `dc_content_tag` VALUES ('24', '加仓', '1');
INSERT INTO `dc_content_tag` VALUES ('25', '寻找', '1');
INSERT INTO `dc_content_tag` VALUES ('26', '生财之道', '1');
INSERT INTO `dc_content_tag` VALUES ('27', '理财', '1');
INSERT INTO `dc_content_tag` VALUES ('28', '赚钱', '1');
INSERT INTO `dc_content_tag` VALUES ('29', '个税', '1');
INSERT INTO `dc_content_tag` VALUES ('30', '改革', '2');
INSERT INTO `dc_content_tag` VALUES ('31', '政策', '3');
INSERT INTO `dc_content_tag` VALUES ('33', '美元', '1');
INSERT INTO `dc_content_tag` VALUES ('34', '欧元', '1');
INSERT INTO `dc_content_tag` VALUES ('35', '财险', '1');
INSERT INTO `dc_content_tag` VALUES ('36', '保费', '1');
INSERT INTO `dc_content_tag` VALUES ('37', '周鸿祎', '1');
INSERT INTO `dc_content_tag` VALUES ('38', '英雄', '1');
INSERT INTO `dc_content_tag` VALUES ('39', '商人', '1');
INSERT INTO `dc_content_tag` VALUES ('40', '汤玉祥', '1');
INSERT INTO `dc_content_tag` VALUES ('41', '轿车', '1');
INSERT INTO `dc_content_tag` VALUES ('42', 'Facebook', '1');
INSERT INTO `dc_content_tag` VALUES ('43', '投资', '1');
INSERT INTO `dc_content_tag` VALUES ('44', '新年', '1');
INSERT INTO `dc_content_tag` VALUES ('45', '李开复', '1');
INSERT INTO `dc_content_tag` VALUES ('46', '李瑜', '1');
INSERT INTO `dc_content_tag` VALUES ('47', '王建硕', '1');
INSERT INTO `dc_content_tag` VALUES ('48', '网站', '1');
INSERT INTO `dc_content_tag` VALUES ('49', '规模化', '1');
INSERT INTO `dc_content_tag` VALUES ('50', '沈阳', '0');
INSERT INTO `dc_content_tag` VALUES ('51', '房价', '0');
INSERT INTO `dc_content_tag` VALUES ('52', '调控', '2');
INSERT INTO `dc_content_tag` VALUES ('53', '房产税', '1');
INSERT INTO `dc_content_tag` VALUES ('54', '分歧', '1');
INSERT INTO `dc_content_tag` VALUES ('55', '评估', '1');
INSERT INTO `dc_content_tag` VALUES ('56', '房产', '1');
INSERT INTO `dc_content_tag` VALUES ('57', '成交', '1');
INSERT INTO `dc_content_tag` VALUES ('58', '房地产', '15');
INSERT INTO `dc_content_tag` VALUES ('59', '策略', '14');
INSERT INTO `dc_content_tag` VALUES ('60', '户型', '1');
INSERT INTO `dc_content_tag` VALUES ('61', '花都雅居乐花园', '1');
INSERT INTO `dc_content_tag` VALUES ('62', '卡布奇诺', '1');
INSERT INTO `dc_content_tag` VALUES ('63', '公寓', '1');
INSERT INTO `dc_content_tag` VALUES ('64', '君华香柏广场', '1');
INSERT INTO `dc_content_tag` VALUES ('65', '巴亚莫', '1');
INSERT INTO `dc_content_tag` VALUES ('66', '别墅', '1');
INSERT INTO `dc_content_tag` VALUES ('67', '低碳', '1');
INSERT INTO `dc_content_tag` VALUES ('68', '收纳箱', '1');
INSERT INTO `dc_content_tag` VALUES ('69', '餐桌', '1');
INSERT INTO `dc_content_tag` VALUES ('70', '地板', '1');
INSERT INTO `dc_content_tag` VALUES ('71', '订单', '1');
INSERT INTO `dc_content_tag` VALUES ('72', '利润', '1');
INSERT INTO `dc_content_tag` VALUES ('73', '衣柜', '1');
INSERT INTO `dc_content_tag` VALUES ('74', '重压力', '1');
INSERT INTO `dc_content_tag` VALUES ('75', 'TWSDS', '1');
INSERT INTO `dc_content_tag` VALUES ('76', 'ASD', '0');
INSERT INTO `dc_content_tag` VALUES ('81', '多维', '1');
INSERT INTO `dc_content_tag` VALUES ('82', '举证', '1');
INSERT INTO `dc_content_tag` VALUES ('83', '小心', '1');
INSERT INTO `dc_content_tag` VALUES ('84', '恩人', '1');
INSERT INTO `dc_content_tag` VALUES ('85', 'fda', '1');
INSERT INTO `dc_content_tag` VALUES ('86', 'fdsa', '2');
INSERT INTO `dc_content_tag` VALUES ('87', 'ff', '1');
INSERT INTO `dc_content_tag` VALUES ('88', '', '1');

-- ----------------------------
-- Table structure for `dc_content_tag_relate`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_tag_relate`;
CREATE TABLE `dc_content_tag_relate` (
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  KEY `fk_jc_content_tag` (`tag_id`),
  KEY `fk_jc_tag_content` (`content_id`),
  CONSTRAINT `fk_jc_content_tag` FOREIGN KEY (`tag_id`) REFERENCES `dc_content_tag` (`tag_id`),
  CONSTRAINT `fk_jc_tag_content` FOREIGN KEY (`content_id`) REFERENCES `dc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容标签关联表';

-- ----------------------------
-- Records of dc_content_tag_relate
-- ----------------------------
INSERT INTO `dc_content_tag_relate` VALUES ('67', '3', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('67', '4', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('71', '5', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('71', '6', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('72', '7', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('72', '8', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('74', '9', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('74', '11', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('75', '12', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('75', '13', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('77', '14', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('77', '9', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('77', '15', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('79', '16', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('79', '17', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('79', '18', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('84', '19', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('86', '20', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('86', '21', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('86', '16', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('87', '16', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('87', '22', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('89', '16', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('89', '23', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('89', '24', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('93', '25', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('93', '26', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('96', '27', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('96', '28', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('100', '29', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('100', '30', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('100', '31', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('101', '33', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('101', '34', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('104', '35', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('104', '36', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('110', '37', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('110', '38', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('110', '39', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('112', '40', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('112', '41', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('115', '42', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('115', '43', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('116', '44', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('116', '45', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('116', '46', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('117', '47', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('117', '48', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('117', '49', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('125', '5', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('125', '52', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('125', '31', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('126', '53', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('126', '30', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('126', '54', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('126', '55', '3');
INSERT INTO `dc_content_tag_relate` VALUES ('129', '56', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('129', '52', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('129', '31', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('129', '57', '3');
INSERT INTO `dc_content_tag_relate` VALUES ('137', '60', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('139', '61', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('141', '62', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('141', '63', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('145', '64', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('147', '65', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('147', '66', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('156', '67', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('156', '68', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('157', '69', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('158', '70', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('158', '71', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('158', '72', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('161', '73', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('161', '74', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('190', '75', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('192', '75', '1');
INSERT INTO `dc_content_tag_relate` VALUES ('195', '58', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('195', '81', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('197', '85', '0');
INSERT INTO `dc_content_tag_relate` VALUES ('199', '86', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('206', '87', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('198', '86', '2');
INSERT INTO `dc_content_tag_relate` VALUES ('57', '88', '0');

-- ----------------------------
-- Table structure for `dc_content_topic`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_topic`;
CREATE TABLE `dc_content_topic` (
  `content_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`topic_id`),
  KEY `fk_jc_content_topic` (`topic_id`),
  CONSTRAINT `fk_jc_content_topic` FOREIGN KEY (`topic_id`) REFERENCES `dc_topic` (`topic_id`),
  CONSTRAINT `fk_jc_topic_content` FOREIGN KEY (`content_id`) REFERENCES `dc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS专题内容关联表';

-- ----------------------------
-- Records of dc_content_topic
-- ----------------------------
INSERT INTO `dc_content_topic` VALUES ('197', '1');
INSERT INTO `dc_content_topic` VALUES ('202', '1');
INSERT INTO `dc_content_topic` VALUES ('203', '1');
INSERT INTO `dc_content_topic` VALUES ('204', '1');

-- ----------------------------
-- Table structure for `dc_content_txt`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_txt`;
CREATE TABLE `dc_content_txt` (
  `content_id` int(11) NOT NULL,
  `txt` longtext COMMENT '文章内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_txt_content` FOREIGN KEY (`content_id`) REFERENCES `dc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容文本表';

-- ----------------------------
-- Records of dc_content_txt
-- ----------------------------
INSERT INTO `dc_content_txt` VALUES ('34', '<p>　　据新华社电 据中国空间技术研究院有关专家介绍，2013年，我国有望利用长征三号乙运载火箭发射自主火星探测器。我国航天工业部门已先期启动了基于探月一二期技术的自主火星探测器研究和方案设计工作，目前正在积极开展技术攻关。据悉，我国自主火星探测器的科学载荷重量达100公斤以上，科学探测能力将大大提高。</p>\r\n<p>　　火星作为太阳系中最近似地球的天体之一，对人类有一种天然的吸引力。火星探测是21世纪人类深空探测的重点之一，我国正在积极开展火星自主探测的相关研究。</p>\r\n<p>　　据介绍，2011年，我国将与俄罗斯合作共同探测火星。我国首个火星探测器&ldquo;萤火一号&rdquo;原计划于2009年10月和俄罗斯的&ldquo;福布斯－土壤&rdquo;卫星一起，搭乘&ldquo;天顶&rdquo;号运载火箭从拜科努尔航天中心发射升空，后因故推迟到2011年10月。</p>\r\n<p>　　目前，世界各主要航天国家都将深空探测视为重要战略性领域，各国未来深空探测规划涵盖整个太阳系。在世界各国未来探测规划中，较为关注的探测目标是月球、火星、金星和小行星。我国的深空探测活动起步于月球，到目前为止，我国共实施了两次月球探测。</p>\r\n<div style=\"height: 0px; clear: both; overflow: hidden\">&nbsp;</div>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('35', '\n<p>　　本报讯 (记者易靖)昨天，首都机场运送旅客14万人次。受暴雪天气影响，约30个飞赴欧美的航班延误。</p>\n\n<p>　　据了解，新年首日，首都机场运送旅客17万人次，与平时相比变化不大。多数旅客是从北京出发赴厦门、海南等地旅游。北京至海南航班机票早在一周前就已经全部售完。昨天，首都机场运送旅客14万人次。今天，预计运送旅客数量较多，为19万人次左右。</p>\n\n<p>　　虽然国内多个地区有雨雪天气，但首都机场国内航班未受影响。但受欧美部分地区暴雪影响，首都机场飞赴欧美部分航班受到影响。前天，25个飞往欧美航班被取消。昨天，飞往莫斯科、巴黎等地约30个航班延误。</p>\n\n<p>　　首都机场提醒旅客，去往欧美的旅客及时与航空公司联系，随时咨询最新消息，以免影响行程。</p> <div style=\"clear:both;height:0;visibility:hiddden;overflow:hidden;\"></div>\n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('36', '\n<p>　　据中央人民广播电台《金陵晚报》报道 从2010年12月30日到2011年1月2日凌晨，江苏省盐城市建湖县3天发生31起小地震，部分居民产生恐慌情绪。江苏省地震局2日就此表示，该地区近期没有发生大地震迹象，但不排除继续发生有感地震。</p>\n\n<p><strong>　　&gt;&gt;居民</strong></p>\n\n<p><strong>　　小腿随地面抖动</strong></p>\n\n<p>　　1月1日17时08分，建湖县高作镇的王金厚全家人正在吃晚饭，他突然感到地面在晃动，小腿也跟着抖起来。同时，他听到二楼邻居厨房间碗盆的撞击声，时间持续大约5秒钟。紧接着，楼上很多人往楼下冲，大家都有些慌张。发生地震后，很多居民不敢回家睡觉，一直在外面徘徊。</p>\n\n<p>　　据盐城地震台报告，这次地震为3.5级，造成当地部分群众有震感，震中在建湖县钟庄，盐城地震台电话接连不断。</p>\n\n<p><strong>　　&gt;&gt;地震局</strong></p>\n\n<p><strong>　　三天内地震31次</strong></p>\n\n<p>　　据江苏省地震局介绍，2010年12月30日23时57分，建湖钟庄发生ML2.1级地震。该局随即展开会商讨论，专家们认为，这次地震是正常的能量释放。到2011年1月1日，地震开始高频率出现，有感地震就发生了3次。截至2日下午，江苏省地震局没接到地震造成破坏的报告。</p>\n\n<p>　　江苏建湖位于江淮里下河平原地区。据盐城市地震局有关人士介绍，从2010年12月30日6时56分45秒至2011年1月2日6时32分24.2秒，建湖县境内钟庄连续发生31次地震，最大一次震级为里氏3.5级的有感地震，周边的草堰口、冈西、建湖县城有震感，这次连续小震属于钟庄小地震群，震级较小，没有造成人员伤亡及财产损失。尽管震级不大，但是当地居民还是产生了一些恐慌情绪。</p>\n\n<p><strong>　　系正常能量释放</strong></p>\n\n<p>　　地震为何震感如此明显？小地震为何高频率发生？江苏近期还会不会发生地震？江苏省地震局办公室主任龚寿荣2日就此做了解答。据龚寿荣介绍，“这次地震属于构造性地震，震中有可能位于洪泽沟敦断裂带上，这条断裂带在上世纪90年代多次发生过地震，其中最大的是4.8级。”小地震是正常能量释放，不具备破坏性，破坏性地震要达到5级以上。</p>\n\n<p>　　这次地震发生后，江苏省地震局经综合会商认为：这一地区虽有小地震发生，但地震活动强度弱，目前全省地震观测数据资料分析正常，近期该地区及全省不会发生破坏性地震。但专家也认为，该地区不排除会有有感地震的发生，他们会密切留意这次地震后的后续情况，“地震部门已经增加了流动地震监测点，也会在第一时间将有关监测情况向公众发布。”</p> \n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('37', '<p>　　近两日，贵州、湖南出现凝冻天气，公路路面大面积结冰，并对电网运行造成影响，贵州省绝大多数高速公路被迫关闭。万余人滞留贵州各客运站场。湖南境内往贵州方向车辆滞留约10公里，数千名驾乘人员被困。滞留广西南丹的车辆已达1500辆，受困群众增至近8000人。</p>\r\n<!-- 播放器 begin --><!-- flash player begin -->\r\n<p><style type=\"text/css\">\r\n				p .contentPlayer{margin-top:10px;}\r\n				.contentPlayer{float:left;width:336px;height:322px;background:url(http://i0.sinaimg.cn/cj/video_bg.png) no-repeat 0 0;margin:0 10px 10px -10px;*margin-right:7px;padding:1px 10px;_display:inline}\r\n				.contentPlayer a{text-decoration:underline;font-size:12px!important;}\r\n				.cp_player{padding:14px 0 0;text-align:center;height:249px;display:block;}\r\n				.cp_tit{padding:10px 0 0 18px;font-size:12px!important;line-height:20px!important;display:block;}\r\n				.cp_from{padding:0 0 0 18px;font-size:12px!important;line-height:20px!important;display:block;}\r\n				</style><span class=\"contentPlayer\"><span class=\"cp_tit\"><a target=\"_blank\" style=\"font-weight: normal\" href=\"http://video.sina.com.cn/p/news/c/v/2011-01-02/185561225743.html\">视频：贵州瓮安路面结冰致交通陷入瘫痪</a></span> <span class=\"cp_from\" style=\"font-weight: normal\">来源：CCTV新闻频道</span> </span><script type=\"text/javascript\">\r\nvar sinaBokePlayerConfig_o = {\r\n	container: \"p_player\",  //Div容器的id\r\n	playerWidth:298,     //宽\r\n	playerHeight:250,    //高\r\n	autoLoad: 0,        //自动加载\r\n	autoPlay: 0,        //自动播放\r\n	as: 0,              //广告\r\n	tj:0             //推荐\r\n};\r\n</script><script src=\"http://v.sina.com.cn/js/pg/play/playflash.js\" type=\"text/javascript\"></script><!-- flash player end --><script language=\"javascript\" type=\"text/javascript\">\r\n\r\nsinaBokePlayerConfig_o.autoLoad = 0;\r\nsinaBokePlayerConfig_o.autoPlay = 0;\r\nSinaBokePlayer_o.addVars(\"vid\", 44490466);\r\nSinaBokePlayer_o.addVars(\"as\", 0);\r\nSinaBokePlayer_o.addVars(\"logo\", 0);\r\nSinaBokePlayer_o.addVars(\"pid\", 1);\r\nSinaBokePlayer_o.addVars(\"head\", 0);\r\nSinaBokePlayer_o.addVars(\"tjAD\", 0);\r\nSinaBokePlayer_o.addVars(\"tj\", 0);\r\n\r\n	SinaBokePlayer_o.addVars(\"vblog\", 2);\r\n	SinaBokePlayer_o.addVars(\"singleRss\", \"http://video.sina.com.cn/iframe/fourlists/p/news/c/v/2011-01-02/185561225743.xml\");\r\nSinaBokePlayer_o.showFlashPlayer();\r\n</script><!-- 播放器 end --></p>\r\n<p>　　启动凝冻灾害Ⅲ级响应</p>\r\n<p>　　2010年12月31日夜间至2011年1月2日8时，贵州中北部地区累计有62个县(市、区)出现冻雨，出现道路结冰和电线积冰。全省气温普遍在0℃以下。同时，湖南也有35县市出现冰冻，目前，灾情仍在持续加重。</p>\r\n<p>　　2日，贵州电网有45条110KV及以上线路覆冰厚度已达13毫米。目前，贵州500KV福青线和220KV习鸭线融冰装置已启动。</p>\r\n<p>　　贵州省2日启动凝冻灾害Ⅲ级应急响应。贵州省民政部门紧急向黔南州调拨救灾棉被1000床、棉衣1000件。</p>\r\n<p>　　贵州近2万人困在路途</p>\r\n<p>　　从1日开始，贵州省内的多条公路相继关闭。目前除镇胜高速仅部分路段封闭外，其他高速公路均已全部封闭。经交通部门初步排查，高速公路滞留车辆数千台、人员6200余人，此外国省干线还滞留至少600人，全省各客运站场滞留旅客万余人。</p>\r\n<p>　　贵州多个部门相继启动应急预案，已将数百名被困人员护送到附近的乡镇政府和服务区休息，并对凝冻路段和桥面进行防滑防冻处理。民政部门已在车辆滞留较多的贵新高速贵定段、马场坪段等设立了多个救助点，发放棉被、棉衣、矿泉水及食物等物资。</p>\r\n<p><strong>　　广西南丹车辆绵延15公里</strong></p>\r\n<p>　　截至2日17时，因贵新高速公路封路而滞留南丹的车辆已达1500辆，受困群众增至近8000人，被困车辆绵延15公里。</p>\r\n<p>　　目前南丹境内气温只有0℃-3℃，保障受困群众基本生活成为头等大事。南丹县委宣传部表示，对生活必需品，当地政府部门将&ldquo;能供应多少供应多少&rdquo;，然而，由于堵车路段较长，受困群众较多，&ldquo;供应难度非常大&rdquo;。</p>\r\n<p>　<strong>　沪昆高速湖南段严重堵车</strong></p>\r\n<p>　　因贵州境内高速公路封闭，导致贯穿中国东西部的公路交通主动脉沪昆(上海至昆明)高速湖南怀新(怀化至新晃)路段、新晃至贵州大龙段严重堵车，湖南境内往贵州方向车辆滞留约10公里，新晃至大龙段滞留车辆700余台。目前虽经两省路政部门积极疏导，但由于大雪和冻雨持续，交通状况依然严峻。</p>\r\n<p>　　截至2日20时，滞留的133台客运车辆、6000多名旅客已疏导至新晃县城。除部分车主因不愿意下行国道而仍然滞留高速公路以外，近600台货车已疏导疏散200多台。</p>\r\n<p>　　据新华社电</p>\r\n<!-- 2009-08-04 zhaokai begin -->\r\n<p><style type=\"text/css\">\r\n.blk-video{float:left;background:url(http://i0.sinaimg.cn/ent/deco/2009/0804/cv_m_02.png) no-repeat 0 0;height:89px;clear:left;}\r\n.blk-video-l{float:left;width:125px;overflow:hidden; text-align:center;padding:5px 2px 0 0;}\r\n.blk-video-l img{border:1px solid #d0ddee;padding:3px;background:#f7f7f9;}\r\n.blk-video-l a:hover img{border-color:#e55c5c;}\r\n.blk-video-r{float:left;padding:10px 15px 0 13px;background:url(http://i0.sinaimg.cn/ent/deco/2009/0804/cv_m_02.png) no-repeat 100% 0;height:79px;}\r\n.blk-v-tit{padding:5px 0 3px 2px ;line-height:20px;font-size:12px!important;float:left;clear:both;}\r\n.blk-v-tit a{text-decoration:underline;font-size:12px!important;}\r\n.blk-v-from{color:#000;line-height:18px;height:20px;font-size:12px!important;float:left;clear:both;}\r\na.blk-v-play,a.blk-v-play:visited{display:block; width:56px;height:18px;line-height:20px;padding:0 0 0 20px; background:url(http://i0.sinaimg.cn/dy/deco/2009/0629/picpic/vblue02.png) 0 0;color:#003a7f;text-decoration:none; white-space:nowrap;font-size:12px!important;float:left;clear:both;}\r\na.blk-v-play:hover{background-position:0 -100px; }\r\n.clearcl{clear:both;height:0;visibility:hiddden;overflow:hidden;}</style><br />\r\n&nbsp;</p>\r\n<div class=\"blk-video\">\r\n<div class=\"blk-video-l\"><a href=\"http://video.sina.com.cn/p/news/c/v/2011-01-02/185561225743.html\"><img alt=\"贵州湖南公路路面大面积结冰\" width=\"94\" height=\"71\" src=\"http://p.v.iask.com/526/4/44490466_0.jpg\" /></a></div>\r\n<div class=\"blk-video-r\">\r\n<div class=\"blk-v-tit\"><a href=\"http://video.sina.com.cn/p/news/c/v/2011-01-02/185561225743.html\">贵州瓮安路面结冰致交通陷入瘫痪 </a></div>\r\n<div class=\"blk-v-from\">来源：CCTV新闻频道</div>\r\n<a class=\"blk-v-play\" href=\"http://video.sina.com.cn/p/news/c/v/2011-01-02/185561225743.html\">播放视频</a></div>\r\n</div>\r\n<div class=\"clearcl\">&nbsp;</div>\r\n<!-- 2009-08-04 zhaokai end -->', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('38', '\n<p>　　晨报讯 (记者 王歧丰)随着首钢完成最后的搬迁工作，投资近20亿元的长安街西延长线建设将在今年正式启动，道路全长约6.4公里，沿线拟设9座公交站。</p>\n\n<p>　　根据规划，长安街西延项目东起古城南路，向西经现在的首钢东大门、首钢厂区后，跨永定河经西六环路继续向西，终点至门头沟的三石路。石景山区区长周茂非近日在接受央视采访时，将这一路段称为“新十里长街”，要按照现在东、西长安街的标准，建成五上五下的城市快速路。</p>\n\n<p>　　周茂非说，跨越永定河的一段道路，将会成为长安街西延长线上最美丽的景观之一，届时在长安街与永定河相交的莲石湖段，将修建一座大桥，目前初步选定“龙凤呈祥”的方案，分为上下两层，上面是机动车通行，下面是人行通行。周茂非同时表示，未来的长安街西延线，不仅会成为北京旅游的新亮点，而且会成为一条财富大道，“新十里长街”两侧的土地资源，将释放出巨大的发展空间。</p>\n\n<p>　　记者还了解到，按照规划，长安街西延线拟定9座公交站。横跨永定河大桥的两个站点之间距离最长，达到1880米；而两站间距离最小的只有420米。在门头沟滨河路南，还将设置一座公交车站，接驳S1线。此外，根据道路宽度和车道数量，有望划定公交专线。</p> <div style=\"clear:both;height:0;visibility:hiddden;overflow:hidden;\"></div>\n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('39', '<p>　　晨报讯(记者 孙韬) 北京小伙娶上海或陕西姑娘，双方婚姻状况信息将上网可查。记者昨天从民政部获悉，&ldquo;十二五&rdquo;期间，<a target=\"_blank\" href=\"http://news.sina.com.cn/c/2011-01-03/011021749667.shtml\">婚姻登记信息将实现全国联网</a>，目前相关软硬件设施等正在逐步完备。北京、上海、陕西三地将从今年起先行试点。</p>\r\n<p>　　民政部日前召开婚姻登记规范化视频会议。会上透露，截至目前，全国多个省市婚登机关已实现婚姻登记网上预约、在线查询、婚姻档案信息检索等功能。婚姻登记信息实现省级联网的省份已由2005年的2个增加到现在的23个，省级联网率达到了74%。&ldquo;十二五&rdquo;期间，婚姻登记信息将实现全国联网。</p>\r\n<p>　　从今年起，京沪陕三地的婚姻登记信息将率先实现共享。也就是说，如果北京人与上海人或陕西人两地联姻，可以首先在网上查到对方婚姻的真实状况。同时，未来5年，本市户籍人口的婚姻状况信息都将被输入北京市婚姻登记信息数据库内。</p>\r\n<p>　　据民政部相关负责人介绍，目前已开发完成了&ldquo;全国婚姻登记管理信息系统&rdquo;和&ldquo;部、省两级婚姻登记数据交换系统&rdquo;，初步建成民政部婚姻登记数据中心，启动了部省两级婚姻信息实时交换与共享的试运行工作，为&ldquo;十二五&rdquo;实现全国联网打下基础。</p>\r\n<p>　　另据媒体报道，我国很多省市婚姻登记机关目前仍沿用旧的统计模式，部分省市的婚姻登记电脑软件仅局限于一般的办公自动化，各级婚姻登记机关独立操作、自成体系，未形成省级婚姻登记网络系统。</p>\r\n<div style=\"height: 0px; clear: both; overflow: hidden\">&nbsp;</div>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('40', '\n<p>　　近两日来，贵州出现凝冻天气，公路路面大面积结冰，并对电网运行造成影响，贵州省绝大多数高速公路被迫关闭，导致高速公路及全省各客运站场滞留旅客4万余人。为此，贵州省2日启动凝冻灾害Ⅲ级应急响应。</p><!-- 播放器 begin -->\n<!-- flash player begin -->\n\n				<style type=\"text/css\">\n				p .contentPlayer{margin-top:10px;}\n				.contentPlayer{float:left;width:336px;height:322px;background:url(http://i0.sinaimg.cn/cj/video_bg.png) no-repeat 0 0;margin:0 10px 10px -10px;*margin-right:7px;padding:1px 10px;_display:inline}\n				.contentPlayer a{text-decoration:underline;font-size:12px!important;}\n				.cp_player{padding:14px 0 0;text-align:center;height:249px;display:block;}\n				.cp_tit{padding:10px 0 0 18px;font-size:12px!important;line-height:20px!important;display:block;}\n				.cp_from{padding:0 0 0 18px;font-size:12px!important;line-height:20px!important;display:block;}\n				</style>\n				<span class=\"contentPlayer\">\n					<span class=\"cp_player\" id=\"p_player\"></span>\n										<span class=\"cp_tit\"><a target=\"_blank\" href=\"http://video.sina.com.cn/p/news/c/v/2011-01-02/175661225713.html\" style=\"font-weight:normal;\">视频：贵州出现冻雨全省高速公路封闭</a></span>\n					<span class=\"cp_from\" style=\"font-weight:normal;\">来源：CCTV新闻频道</span>\n\n				</span>\n\n<script type=\"text/javascript\">\nvar sinaBokePlayerConfig_o = {\n	container: \"p_player\",  //Div容器的id\n	playerWidth:298,     //宽\n	playerHeight:250,    //高\n	autoLoad: 0,        //自动加载\n	autoPlay: 0,        //自动播放\n	as: 0,              //广告\n	tj:0             //推荐\n};\n</script>\n\n<script src=\"http://v.sina.com.cn/js/pg/play/playflash.js\" type=\"text/javascript\"></script>\n\n<!-- flash player end -->\n\n<script language=\"javascript\" type=\"text/javascript\">\n\nsinaBokePlayerConfig_o.autoLoad = 0;\nsinaBokePlayerConfig_o.autoPlay = 0;\nSinaBokePlayer_o.addVars(\"vid\", 44415891);\nSinaBokePlayer_o.addVars(\"as\", 0);\nSinaBokePlayer_o.addVars(\"logo\", 0);\nSinaBokePlayer_o.addVars(\"pid\", 1);\nSinaBokePlayer_o.addVars(\"head\", 0);\nSinaBokePlayer_o.addVars(\"tjAD\", 0);\nSinaBokePlayer_o.addVars(\"tj\", 0);\n\n	SinaBokePlayer_o.addVars(\"vblog\", 2);\n	SinaBokePlayer_o.addVars(\"singleRss\", \"http://video.sina.com.cn/iframe/fourlists/p/news/c/v/2011-01-02/175661225713.xml\");\nSinaBokePlayer_o.showFlashPlayer();\n</script>\n\n<!-- 播放器 end -->\n\n<p>　　此外，贵州高速关闭还导致沪昆高速湖南怀新路段严重堵车，湖南境内往贵州方向车辆滞留约6公里，目前当地政府部门正全力救援被困高速公路的数千名驾乘人员。因贵新高速公路封路而滞留广西南丹的车辆已达1500辆，受困民众增至七八千人，被困车辆绵延15公里。</p>\n\n<p>　　预计1月2日白天到3日夜间，贵州省中北部地区阴天有冻雨或雨夹雪，其余地区阴天有小雨，凝冻仍将维持。</p>\n\n<p><strong>　　【贵州】</strong></p>\n\n<p><strong>　　全省仅一条高速部分开放</strong></p>\n\n<p><strong>　　部分地区有冻雨，大部分地区普遍道路结冰</strong></p>\n\n<p>　　受北方强冷空气持续影响，1月1日8时至2日8时，贵州省中北部地区有62个(市、区)出现冻雨，全省大部分地区气温在零摄氏度以下，普遍出现道路结冰和导线积冰现象。</p>\n\n<p>　　从1日傍晚开始，贵州境内高速公路开始陆续关闭，目前除镇胜高速仅部分路段封闭外，其他高速公路均已全部封闭。经交通部门初步排查，高速公路滞留车辆数千台、人员6200余人，此外国省干线还滞留至少600人，全省各客运站场滞留旅客万余人。</p>\n\n<p>　　近两日来，贵州多个部门相继启动应急预案，同时采取紧急措施，全力疏散和救援高速公路被困人员。贵州各级路政部门利用路政巡逻车，已将数百名被困人员护送到附近的乡镇政府和服务区休息，并对凝冻路段和桥面进行防滑防冻处理。民政部门已在车辆滞留较多的贵新高速贵定段、马场坪段等设立了多个救助点，发放棉被、棉衣、矿泉水及食物等物资。</p>\n\n<p>　　记者从南方电网贵州电网公司了解到，全省电网运行及电力供应基本稳定。据新华社电</p>\n\n<p><strong>　　【湖南】</strong></p>\n\n<p><strong>　　700多辆车半路被困高速</strong></p>\n\n<p><strong>　　6000多名旅客被疏导，数百货车仍停高速</strong></p>\n\n<p>　　1日夜间至2日凌晨，因贵州境内高速公路结冰严重，临时交通管制，封闭了与湖南交界的贵州一侧收费站，导致贯穿中国东西部的公路交通主动脉沪昆(上海至昆明)高速湖南怀新(怀化至新晃)路段严重堵车，湖南境内往贵州方向车辆滞留约6公里，目前虽经两省路政部门积极疏导，但由于大雪和冻雨持续，交通状况依然严峻。</p>\n\n<p>　　截至2日20时，滞留的133台客运车辆6000多名旅客已疏导至新晃县城。除部分车辆车主因不愿意下行国道而仍然滞留高速公路以外，近600台货车已疏导疏散200多台，预计至3日凌晨可疏导300多台。对滞留的司乘人员，该县组织了慰问组为他们送去矿泉水2000瓶、鸡蛋3000个、面包3000份、方便面1500盒等食品。</p>\n\n<p>　　1月2日8时，新晃县迅速启动应对冰冻雨雪应急预案。针对沪昆高速公路上滞留车辆问题，新晃专门成立应急处置小组，从2日早晨开始，该县协调沪昆高速公路新晃交警大队和县内交警、交通、公路等相关部门人员40余人，出动疏导车辆8台，对滞留新晃境内的司乘人员和旅客开展动员，疏导车辆从高速公路下行至320国道或城郊。据新华社电</p>\n\n<p><strong>　　【广西】</strong></p>\n\n<p><strong>　　南丹被困车辆绵延15公里</strong></p>\n\n<p><strong>　　受困者约八千人，当地免费发放食品</strong></p>\n\n<p>　　记者从广西壮族自治区河池市南丹县委宣传部获悉，截至2日17时，因贵新高速公路封路而滞留南丹的车辆已达1500辆，受困群众增至七八千人，被困车辆绵延15公里。当地政府正采取多项措施保障受困群众基本生活需要。</p>\n\n<p>　　受北方强冷空气影响，目前南丹境内气温只有0—3摄氏度，保障受困群众基本生活成为头等大事。为此，南丹县交通、公安、民政、医卫等各有关部门紧急联动，组织党员赶赴现场，维护车辆秩序，提供医疗服务，免费为受困群众发放食品和御寒衣物。</p>\n\n<p>　　南丹县委宣传部表示，对生活必需品，当地政府部门将“能供应多少供应多少”，然而，由于堵车路段较长，受困群众较多，“供应难度非常大”。据新华社电</p> <!-- 2009-08-04 zhaokai begin -->\n\n<style type=\"text/css\">\n.blk-video{float:left;background:url(http://i0.sinaimg.cn/ent/deco/2009/0804/cv_m_02.png) no-repeat 0 0;height:89px;clear:left;}\n.blk-video-l{float:left;width:125px;overflow:hidden; text-align:center;padding:5px 2px 0 0;}\n.blk-video-l img{border:1px solid #d0ddee;padding:3px;background:#f7f7f9;}\n.blk-video-l a:hover img{border-color:#e55c5c;}\n.blk-video-r{float:left;padding:10px 15px 0 13px;background:url(http://i0.sinaimg.cn/ent/deco/2009/0804/cv_m_02.png) no-repeat 100% 0;height:79px;}\n.blk-v-tit{padding:5px 0 3px 2px ;line-height:20px;font-size:12px!important;float:left;clear:both;}\n.blk-v-tit a{text-decoration:underline;font-size:12px!important;}\n.blk-v-from{color:#000;line-height:18px;height:20px;font-size:12px!important;float:left;clear:both;}\na.blk-v-play,a.blk-v-play:visited{display:block; width:56px;height:18px;line-height:20px;padding:0 0 0 20px; background:url(http://i0.sinaimg.cn/dy/deco/2009/0629/picpic/vblue02.png) 0 0;color:#003a7f;text-decoration:none; white-space:nowrap;font-size:12px!important;float:left;clear:both;}\na.blk-v-play:hover{background-position:0 -100px; }\n.clearcl{clear:both;height:0;visibility:hiddden;overflow:hidden;}\n</style>\n<br>\n<div class=\"blk-video\">\n	<div class=\"blk-video-l\">\n		<a href=\"http://video.sina.com.cn/p/news/c/v/2011-01-02/175661225713.html\"><img alt=贵州全省仅一条高速部分开放 src=\"http://p.v.iask.com/775/854/44415891_0.jpg\" width=\"94\" height=\"71\" alt=\"贵州出现冻雨全省高速公路封闭\n\" /></a>\n	</div>\n	<div class=\"blk-video-r\">\n		<div class=\"blk-v-tit\"><a href=\"http://video.sina.com.cn/p/news/c/v/2011-01-02/175661225713.html\">贵州出现冻雨全省高速公路封闭\n</a></div>\n\n		<div class=\"blk-v-from\">来源：CCTV新闻频道</div>\n		<a href=\"http://video.sina.com.cn/p/news/c/v/2011-01-02/175661225713.html\" class=\"blk-v-play\">播放视频</a>\n	</div>\n</div>\n<div class=\"clearcl\"></div>\n\n<!-- 2009-08-04 zhaokai end -->\n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('41', '\n<p>　　据新华社电 曾注明商品房限购政策“有效期限”至2010年12月31日的福州、厦门等部分城市日前决定，将顺延执行此项政策。业内人士及专家表示，政府继续“给力”限购在意料之中，而要切实缓解楼市反弹压力，则亟待扩大楼市供应。</p>\n\n<p><strong>　　多地“限购令”已到期</strong></p>\n\n<p>　　“限购令”首次登上房地产调控舞台是在2010年4月底北京出台的“国十条实施细则”中，随后有多个城市跟进出台了限购政策。其中，福州、厦门、海口、温州等部分城市在这项政策中都注明了“有效期限”至2010年12月31日。</p>\n\n<p>　　在过去一年里，“限购”加上“限贷”等调控组合拳很大程度上抑制了部分城市房地产的成交量。“但应引起注意的是，福州的房价并没有稳住，不少楼盘售价一涨再涨。部分原因是，大家都在等着政策到期后成交量的反弹。”福州大学房地产研究所所长王阿忠说。</p>\n\n<p>　　2010年10月10日，福州楼市正式出台了限制政策，对一手商品房执行“一户限购一套”等措施，受此影响，福州市一手房的实际签约量整体急速下滑，从10月份的3000多套，到11月大跌至1300多套，12月再跌至1200多套，而房价却一直稳居于每平方米1.2万元到1.4万元的高位。</p>\n\n<p><strong>　　房价存上涨冲动</strong></p>\n\n<p>　　“限购令”的顺延执行给开发商泼了一盆冷水。去年底，市场形势似乎逐渐“暖”了起来，福州、厦门等地不少开发商借着限购即将解禁之机，纷纷推出大批新房源，同时打出岁末优惠牌，打算提前“捂热”春节楼市。</p>\n\n<p>　　业内人士指出，如果“限购令”真的被解禁了，楼市大幅反弹的可能性就会很大。目前，限购城市不仅面临着量的反弹压力，房价也存在上涨的冲动。为此，地方政府除继续“给力”限购政策外，还须切实扩大楼市供应以及调整供应结构，继续加大保障房的建设和供应。</p> <div style=\"margin-right: 0px; margin-left: 0pt; padding-right: 0px;\" class=\"blkComment otherContent_01\"></div><div style=\"overflow:hidden;zoom:1;\" class=\"otherContent_01\">\n<p>　> <strong>相关报道：</strong></p><p>　　<a href=http://news.sina.com.cn/c/2010-12-31/112321741325.shtml target=_blank>住建部：热点城市房屋限购令将加强</a></p>\n<p>　　<a href=http://news.sina.com.cn/c/2010-12-31/073221739676.shtml target=_blank>多城市房地产限购令将到期 调控效果遭质疑</a></p>\n<p>　　<a href=http://news.sina.com.cn/c/2010-12-28/101821719712.shtml target=_blank>深圳规划国土委否认将取消住房限购令</a></p></div>\n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('42', '\n<p>　　“我们现在被困在秀山县雅江镇至贵州省松桃县路途当中，快来救救我们吧。”1日晚11时50分许，秀山消防接到了这样的报警。8名消防官兵接报后紧急赶往现场，在昨日凌晨1时许与报警者会合。</p>\n\n<p>　　据现场李女士介绍，他们是从重庆到湖南省凤凰古镇的自驾旅行团，车队有15辆小车，团员有40余名，都是重庆市民。本来出行倒还顺利，可谁都没有想到晚上天气寒冷，道路竟然开始结冰了。1日晚上8点多，车队行驶到秀山县雅江镇至贵州松桃县芽驾路段时，行驶在最前面的几辆车突然打滑，车辆掉到路边的排水沟内，无法动弹。</p>\n\n<p>　　被困游客告诉消防官兵，当时夜间气温突降至零下3℃左右，车队停在公路上进退两难，无奈之下，他们只好拨打了求救电话。</p>\n\n<p>　　目前，受困的40余市民已全部安全获救。</p>\n\n<p>　　昨日，记者从秀山当地交通部门获悉，重庆秀山至湖南凤凰路段已经结冰，提醒自驾游市民前往时务必谨慎。</p>\n\n<p>　　另外，1月1日，第一场冰雪突袭武陵山区，黔江区319线国道黔江至彭水路段的香山隧道路段、沙坝路段、黔洲桥平台路段积雪特别严重，路面全面霜冻。黔江交巡警支队紧急安排疏导，并用沙子、干稻草、工业盐、铲车铲除阻路的冰雪，确保了道路畅通。</p>\n\n<p>　　记者 夏祥洲 通讯员 任燕 摄影报道</p>\n\n<p>　　道路结冰第二次黄色预警</p>\n\n<p>　　气象局每三小时有滚动气象消息</p>\n\n<p>　　本报讯 记者从相关部门了解到，昨天有多条高速公路因为冰雪受到了管制。G65(包茂渝湘段)主线站———南川、彭水东———洪安已双向管制。G42(沪蓉)云阳———巫山管制。G75(兰海渝黔段)因协助贵州管制，出城车辆在东溪下道，出城货车在G75主线站分流，东溪、安稳出城方向入口管制。此外，G42(沪蓉)万州———开县也因冰雪双向管制。</p>\n\n<p>　　昨日，气象部门继续发布今年第二个道路结冰黄色预警，预计从昨天20时到3日14时，我市黔江、酉阳、秀山、石柱、武隆、彭水、南川、城口、巫溪、巫山、奉节、云阳、开县、梁平、垫江等地以及其余区县海拔600米以上的山区将出现道路结冰。</p>\n\n<p>　　市气象局从昨天上午11点起启动了3小时一次滚动预报，时间为11点、14点、17点、20点。市民出行前，可以拨打相关服务电话(12121和96121声讯)咨询路况和天气。记者 朱隽</p>\n\n<p>　　贵州湖南继续大范围冻雨</p>\n\n<p>　　贵州境内所有高速均封闭，由湘入黔车辆滞留约10公里，由桂入黔数千人滞留南丹</p>\n\n<p>　　1月1日至2日早晨，贵州、湖南等地持续出现雨雪天气，贵州大部、湖南西部等地出现大范围冻雨。截止到1月2日8时，贵州省中北部地区电线积冰直径普遍有25～40毫米，湘西冻雨厚度在3～12毫米。</p>\n\n<p>　　贵州所有高速公路因道路结冰实行临时交通管制，目前滞留在贵州高速公路上的车辆有数千台，乘客有6200余人。此外，由于贵州方面封闭210国道线毗邻广西路段，近千车辆滞留南丹境内，四五千人被困。湖南省湘西、湘北部分地区公路结冰严重，主要集中在怀化、湘西自治州、张家界和岳阳的部分路段，由湘入黔车辆滞留约10公里。</p>\n\n<p>　　预计未来两天贵州、湖南等地仍将出现冻雨天气。其中，2日，贵州大部、湖南西部和南部地区将有冻雨；3日，贵州中部、湖南西部偏南地区和南部仍然有冻雨；4日，本次冻雨天气基本结束。中国天气网</p>\n\n<p>　　长江中下游将现大范围雨雪</p>\n\n<p>　　随着冷空气东移南下，长江中下游地区将迎来大范围雨雪天气，降温加剧。</p>\n\n<p>　　在新一轮冷空气的影响下，新年伊始，全国大部地区的气温呈直线下降。截至1日下午2时，新疆北部、西藏西部、内蒙古东北部、黑龙江西部、吉林西部、辽宁中西部、四川盆地、贵州、重庆、湖北及江南大部普遍降温3摄氏度至8摄氏度。</p>\n\n<p>　　中央气象台预计，未来两天，青藏高原东部、西南地区东部等地有小到中雪(雨)或雨夹雪，其中，贵州东北部、湖南中部偏西的局部地区有大雪。新华社</p> \n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('43', '<p>　　本报讯(记者沈义)记者日前从重庆市检察院获悉，2010年，该市检察机关积极投入平安重庆建设，始终保持对黑恶犯罪的高压态势，在严厉打击黑恶势力犯罪的同时，深挖彻查黑恶势力背后的职务犯罪。该市三级检察机关依法批捕涉黑涉恶犯罪嫌疑人920人、起诉1219人，打掉43个涉黑团伙，深挖彻查黑恶势力背后的职务犯罪143件172人，其中&ldquo;保护伞&rdquo;47人。</p>\r\n<div style=\"height: 0px; clear: both; overflow: hidden\">&nbsp;</div>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('44', '\n<p>　　本报讯&nbsp;(记者杜丁)北京市城管执法局官方网站(www.bjcg.gov.cn)改版升级，“市民评城管”栏目被放在了网站的显著位置。市民不仅可以提意见，而且可以随时看到其他网友参与评说的结果。</p>\n\n<p>　　在“您最希望城管队员解决哪些问题”中，栏目根据城管的职责和人们关心的话题给出了10个选项，违法建设、无照经营、夜间烧烤、乱发小广告、加强执法风纪方面的监督……市民可以根据自己的意见进行选择；“您对城管工作的评价”分成了满意、基本满意、不满意3档；栏目还设置了给城管工作提建议和意见的对话框，市民可以直接通过网络提出自己对城管的看法和改进建议。</p>\n\n<p>　　市民不仅可以参与对城管的评价，还能查看别人参与的情况。记者注意到，随着小广告治理力度的加大，乱贴小广告已降到了城管最该解决问题的第6位，无照经营、违法建设和夜间烧烤位列前3，黑车经营、施工扰民的名次都“跑”到了小广告的前面，它们都是市民眼中最需要解决的问题。</p> <div style=\"clear:both;height:0;visibility:hiddden;overflow:hidden;\"></div>\n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('45', '\n<p>　　晨报讯 (记者 孙韬)今后，本市低保政策将引入财产审核制度。记者日前从市民政局获悉，民政部门将考虑通过与金融、公安、建设等部门建立联动机制，对低保人员的房产、汽车、存款等财产情况进行调查，并纳入低保审核指标。</p>\n\n<p>　　据市民政局有关负责人介绍，目前本市低保资格的审查主要通过收入来衡量，低保人员拥有的汽车、房屋等财产情况，由于缺乏相应的政策和法律依据，民政部门尚无途径掌握。</p>\n\n<p>　　此外，针对一些低保人员存在弹性就业、反复就业等情况，虽然民政部门对低保家庭的收入会定期进行动态审核，但对隐性收入无从核查。</p>\n\n<p>　　据悉，民政部门已开始对低保户家庭存在拥有房、车和隐性收入等情况进行关注。</p> <div style=\"clear:both;height:0;visibility:hiddden;overflow:hidden;\"></div>\n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('46', '\n<p>　　■《在押未决人员羁押表现评鉴制度实施办法》提出，法院依据鉴定表中反映的被告人在未判决前在押期间的表现，判定其是否具有从轻或从重情节，而增、减刑的幅度控制在三个月内。</p>\n\n<p>　　■在押未决人员的考评程序非常严格，首先是看守所开考评会议，驻所检察人员依法监督全过程；具体填写向法院递交的《在押未决人员月考评情况汇总表》时，必须有五个方面的意见，即管教民警、县看守所、县公安局、县检察院驻所检察室、县检察院，缺一不可。</p>\n\n<p>　　因涉嫌重大责任事故罪而被刑事拘留的黄某，日前领到了重庆市荣昌县法院的判决书。由于他在判决前的羁押期内表现良好，黄某在原判决的基础上，获得了三个月的减刑。&nbsp;</p>\n\n<p>　　对于在押未决人员的奖惩，我国目前没有明确的法律规定，而这恰恰成为在押未决人员难管的重要原因之一。&nbsp;</p>\n\n<p>　　为解决这一难题，荣昌县检察院在当地政法委主持下，与该县法院、公安局、司法局联合制定了在押未决人员羁押表现评鉴制度。黄某正是受益于此项制度的人员之一。&nbsp;</p>\n\n<p>　　截至目前，荣昌县看守所已有包括黄某在内的5名在押人员，由于在羁押期间表现良好，获得依法轻判。</p>\n\n<p>　　法律“留白”致在押未决人员“难管”</p>\n\n<p>　　在押未决人员羁押表现评鉴制度的出台，并非一时心血来潮的草率决定，而是荣昌县检察院驻所检察室主任张长久在日常工作中的细心观察与分析的结果。&nbsp;</p>\n\n<p>　　在驻所检察室工作期间，张长久发现，从被关进看守所到判决确定的这段时间，是在押人员等待判决结果的“过渡期”，也是情绪最不稳定期。冲动、易怒、抗拒……在这些负面情绪的驱使下，在押人员在看守所内不服监管、欺压打骂同监人员，充当“牢头狱霸”、打架斗殴的现象时有发生。&nbsp;</p>\n\n<p>　　张长久说，对于违反监规的在押人员，看守所依法能给予的处罚措施就是戴上戒具，最严厉的也不过是关短期禁闭。而这些处罚措施，对于关乎在押人员切身利益的判决来说，并无实质性影响。因此，部分在押人员对于自己在看守所是否受过处罚感到“无所谓”，而且即便处罚完毕后，他们中的多数人仍不吸取教训，继续打斗闹事，为监管场所的安全埋下了隐患。</p>\n\n<p>　　一支牙膏难以激发在押人员改过兴趣</p>\n\n<p>　　采访时，张长久对记者坦言，表现好的在押人员，看守所给予的奖励就是一支牙膏。“这怎么能激起这些‘问题人员’认真改过的兴趣？”张长久说。&nbsp;</p>\n\n<p>　　“我们看在眼里急在心上，总想着如何充分发挥检察职能，从根本上解决这一问题，进一步敦促在押未决人员遵守监规、积极改造。”荣昌县检察院检察长梁经顺向记者透露了出台羁押表现评鉴制度的初衷。&nbsp;</p>\n\n<p>　　他说，我国刑法中破坏监管秩序罪的主体限于已决犯，而对看守所中破坏监管秩序的在押人员，因其属于未决犯，难以追究其刑事责任，这样导致的后果是，在看守所中聚众闹事的在押人员，被关进监狱之后就变得“老实”多了。&nbsp;</p>\n\n<p>　　“同样一个人前后表现变化为何如此之大？原因就在于他们被判刑后，害怕在监狱中表现不好而失去减刑、假释的机会，甚至因触犯法律而被加刑。”梁经顺说，“于是，我们就考虑，只有将在押未决人员在羁押期间的表现纳入量刑情节，使他们在看守所里的一举一动都与日后的量刑息息相关，才能真正促使在押未决人员规范自己的言行，遵守监管秩序。”</p>\n\n<p>　　羁押表现纳入量刑情节符合立法精神</p>\n\n<p>　　通过反复分析论证和广泛征求意见，荣昌县检察院认为，将在押未决人员羁押表现纳入量刑情节，不仅在法理上可以找到依据，而且在实践中具有较强的操作性。&nbsp;</p>\n\n<p>　　梁经顺告诉记者，根据我国刑事立法精神，反映行为人人身危险性程度的事实，一般也可作为量刑情节予以考虑。&nbsp;</p>\n\n<p>　　梁经顺分析道，在押未决人员在看守所内的羁押表现，能有效反映在押未决人员在审判前的人身危险性，将其纳入酌定量刑情节，是根据在押未决人员人身危险性的消长变化而作出相适应刑罚的有效举措，符合刑罚的价值取向。&nbsp;</p>\n\n<p>　　“而且，在我国，犯罪嫌疑人审前羁押的期限一般较长，在这段期间内如不及时对在押未决人员进行教育改造，就有可能‘交叉感染’，相互传染恶习，增大其再次犯罪的可能性。如羁押表现可纳入量刑情节，可有效激励在押未决人员自觉遵守监规，认真改造。”梁经顺说。</p>\n\n<p>　　增、减刑幅度控制在三个月内</p>\n\n<p>　　2009年初，荣昌县检察院在当地政法委的主持下，与该县法院、公安局、司法局召开会议，提出了对在押未决人员羁押表现进行评鉴的构想，并对评鉴结果的使用时机和使用规定等做了大致的谋划。&nbsp;</p>\n\n<p>　　经过进一步的调研、论证，当年8月15日，荣昌县法院、检察院、公安局、司法局联合制定了《在押未决人员羁押表现评鉴制度实施办法》(下称《办法》)。该《办法》规定，羁押在荣昌县看守所的在押未决人员均要接受羁押表现评鉴，该县公安局负责具体的评鉴工作，并出具评鉴表，该县检察院驻所检察室则对评鉴过程进行同步监督。&nbsp;</p>\n\n<p>　　该《办法》提出，法院依据鉴定表中反映的被告人在未判决前在押期间的表现，判定其是否具有从轻或从重情节。若法院酌定被告人存在从轻情节，其将获得最多三个月的轻判奖励；反之，若被酌定具有从重情节，则被增加最多三个月的处罚。</p>\n\n<p>　　实施规则详细，考评程序严格</p>\n\n<p>　　荣昌县检察院副检察长魏东告诉记者，在押未决人员羁押表现评鉴制度规定得非常细致，细化和明确了加、减分标准，在实际操作中，监管人员只需依照规定填写报表即可。例如，在押未决人员个人考评基础分为100分，实行加分和扣分制，100分以上的为表现好，80分以上为一般，80分以下的为差。其中，加分标准有主动制止同监室在押人员打架斗殴、主动制止同监室在押人员自伤、自残、自杀、越狱、冲监、暴狱等8条；扣分标准则包括称王称霸、拉帮结伙、私立规矩，勒索、抢夺、强吃、强占他人财物，阻碍他人检举、举报，诬陷、报复检举人等24条。&nbsp;</p>\n\n<p>　　魏东说，尽管已规定了很详细的实施细则，对在押未决人员的考评程序依然非常严格。首先是看守所开考评会议，驻所检察人员依法监督全过程；具体填写向法院递交的《在押未决人员月考评情况汇总表》时，必须有五个方面的意见，即管教民警、县看守所、县公安局、县检察院驻所检察室、县检察院，缺一不可。&nbsp;</p>\n\n<p>　　为了更好地施行《办法》，当年8月试行时，荣昌县检察院还制定了《在押未决人员羁押表现考评细则》，明确了相关部门的评鉴职责和方法步骤及评鉴标准。</p>\n\n<p>　　违反监规的现象明显减少</p>\n\n<p>　　采访中，记者发现，黄某的刑事判决书上有这样几行字：“荣昌县公安局、荣昌县检察院评鉴，被告人黄某在羁押期间被评定为表现好……鉴于其在押期间表现好，有一定悔罪表现，依法酌定从轻处罚。”&nbsp;</p>\n\n<p>　　2009年9月，黄某因涉嫌重大责任事故罪被刑事拘留。据管教民警介绍，进入看守所后，他们就向黄某告知了羁押表现评鉴制度。在随后的羁押中，黄某感到非常后悔和自责，觉得对不起家庭，尤其是年迈的父母；主动与管教民警谈心，决心彻底痛改前非，重新做人。羁押期间，黄某严格遵守各项监规。荣昌县看守所对其进行考核时，确定其为“表现好”。&nbsp;</p>\n\n<p>　　荣昌县检察院将证明材料移送该县法院后，黄某因此获得酌定从轻的判决。黄某拿到判决书时，激动不已。&nbsp;</p>\n\n<p>　　“现在，几乎所有未决在押人员都明白，他们在押期间的表现不再无关紧要，尤其是对涉嫌轻微刑事犯罪的在押未决人员特别有吸引力，他们渴望能获得从轻量刑的机会。”张长久告诉记者，如今，看守所内监管秩序井然，在押未决人员对自己的日常表现很上心，连被子都叠得整整齐齐。&nbsp;</p>\n\n<p>　　记者了解到，自在押未决人员羁押表现评鉴制度推行以来，荣昌县看守所在押未决人员违反监规的现象明显减少。</p>\n\n<p>　　经验成熟后将适时推广</p>\n\n<p>　　记者了解到，由检察院、法院、公安局、司法局联合出台统一文件，规范在押未决人员羁押表现的制度在重庆市尚属首例，在全国也鲜见。&nbsp;</p>\n\n<p>　　全程参与该制度制定的重庆大学法学院副教授肖洪博士称，此制度对于感化教育犯罪嫌疑人、敦促其认罪服法，加强监管秩序，都有非常积极的意义。&nbsp;</p>\n\n<p>　　刑法学家、山东科技大学教授牛忠志认为，监所监督是检察权的有机组成部分，然而由于法制的不建全，监管工作出现了诸如“躲猫猫”、“喝水死”等事件，在全国造成恶劣的影响。该制度正是有效“治疗”这些“疾病”的良方，是对监所监管工作的积极探索。在重庆市范围内乃至在全国范围内都具有创新性，待经验成熟后，建议全国推广。&nbsp;</p>\n\n<p>　　据悉，重庆市检察院监所检察处近日专门到荣昌县检察院对在押未决人员羁押表现评鉴制度进行调研后表示，将在完善《办法》的基础上，适时将该制度在全市推广。</p> \n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('47', '<p>　　据新华社电 新年首月天宇精彩纷呈。中科院紫金山天文台研究员王思潮向记者通报，2011年1月天宇将上演象限仪流星雨、日偏食、金星和水星西大距等四大天象。</p>\r\n<p>　　王思潮介绍，今年象限仪流星雨的极大很可能出现在北京时间1月4日9时，届时每小时的天顶流量(ZHR)将达到120，从中亚到整个欧洲，观测条件都十分理想。</p>\r\n<p>　　1月4日发生的日偏食于北京时间14时40分从非洲和欧洲西部开始，19时01分结束于我国西部的新疆、西藏、青海和甘肃的部分地区。我国只有极西部地区可以看到从初亏到复圆的全过程，而其他西部地区就只能看到带食日落了。</p>\r\n<p>　　今年1月8日，金星将到达西大距的位置。对于北纬40度附近地区来说，日出时金星的地平高度可达30度左右，观测条件非常好。</p>\r\n<p>　　今年水星将有7次大距，1月9日将要发生的西大距，日出时的地平高度约15度，观测条件不错。</p>\r\n<div style=\"height: 0px; clear: both; overflow: hidden\">&nbsp;</div>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('48', '\n<p>　　本报长沙讯 受北方冷空气影响，1月1日，雨雪主要出现在湘西北湘西这一带，自治州、张家界等17县市首先降下了新年的第一场雪。昨日上午8点，全省35县市出现雨雪冰冻天气，省气象局再次发布道路结冰橙色预警。鉴于防冰防冻形势趋于严峻，湘西州气象局已于昨日中午12点紧急启动了突发性气象灾害三级应急预案。</p>\n\n<p>　　受地面强冷空气的影响，湘西自治州从1月1日起就出现明显的低温雨雪冰冻天气，部分县市出现冻雨，极端最低气温达-2.6℃(保靖、花垣、凤凰)，最大积冰厚度12mm(凤凰县)，最大积雪深度3cm(保靖县)。</p>\n\n<p>　　据省气象台专家姚蓉分析：受分裂的南支低槽和分股南下的地面冷空气共同影响，未来几天我省将出现持续的雨雪天气，昨天和今天两天降雪较明显。今明两日省内气温明显偏低，日平均气温都在2℃以下，湘中以南地区有冰冻，这三天省内大部分路段将有道路结冰现象出现。</p>\n\n<p>　　另据最新资料分析，中低纬高空环流平直，多小波动，地面不断有冷空气渗透南下。预计：短中期冷空气继续渗透南下，省内阴雨雪天气维持，4日中低层转南风温度略微升高，湘中以南会出现雪转雨或雨夹雪，5日开始又一股冷空气渗透南下，5日晚开始又转纯雪或雨夹雪天气，6日-8日阴雨雪天气维持。</p>\n\n<p>　　具体天气预报：</p>\n\n<p>　　4日：湘中以南小到中雪转雨夹雪，局部地区有冰冻，其他地区阴天有小雪，最高气温0-2℃，最低气温-2-0℃；</p>\n\n<p>　　5日：湘北小到中雨夹雪转中雪，局部地区有大雪，其他地区阴天有小雨或小雨夹雪，湘中局部地区有冰冻；</p>\n\n<p>　　6-8日：受强冷空气影响，省内仍维持低温雨雪天气，冰冻又有发展。</p>\n\n<p>　　记者储文静 实习生张园　通讯员谭萍 李好</p>\n\n<p>　　[帮你问]</p>\n\n<p>　　这次雨雪会发展成类似2008年的冰灾？</p>\n\n<p>　　省气象局专家解释，目前冰冻主要在怀化、邵阳等湖南西部地区，湘东基本无冰冻，像长沙等地就直接下着雪或雨夹雪，形成冰冻所需的逆温层不够稳定，且逆温层不够厚，范围不够广，气温不能长时间维持在0℃以下，就无法达到冰冻形成的条件。而且虽然这次雨雪过程持续时间较长，但降水不强，属于过程性雨雪天气，中间有短暂升温，预计4日前后省内气温有所回升，届时冰冻将减弱或部分融掉，所以不会出现类似2008年的冰灾。</p> \n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('49', '\n<p>　　对于盐城建湖地区的一些居民来说，这个新年过得并不平静。从2010年12月30日6时56分开始，该地区地震不断，最近的一次是昨天清晨6时32分，前前后后一共发生了31次地震。据省地震台网发布的消息，其中6次为有感地震，最高为里氏2.9级。昨天傍晚记者赶到震中——建湖经济开发区钟庄社区办事处，发现总体上居民情绪比较平稳，只有几户居民已在昨晚搭起了防震棚，不过，这次属于小的地震群，即发生频率比较高，但该地区历史上最高地震级别仅为里氏5级。</p>\n\n<p>　　据了解，截至记者发稿，地震部门尚未接到地震造成的破坏损失报告。</p>\n\n<p>　　<strong>现场</strong></p>\n\n<p>　　<strong>县城居民夜里吓得跑出门</strong></p>\n\n<p>　　观察了一会，见没什么动静才回家，但直到零点以后才睡着，“总是担心床会摇晃！”</p>\n\n<p>　　昨天在网上出现这样一条消息，盐城市建湖县钟庄从12月30日晨到1月2日晨，先后发生了31次小地震。消息的来源据称是盐城市地震局。</p>\n\n<p>　　昨天下午，记者联系了盐城市地震局值班室，工作人员确认从12月30日6点56分45秒开始，钟庄境内发生第一次地震，一直到1月2日早晨6时32分24秒，一共发生31次地震。从震级来看，最高为ML3.5级(即江苏省地震局发布的M2.9级)，其中，ML2.7级以上地震为6次。</p>\n\n<p>　　昨天下午，记者电话采访了几位震中钟庄的居民，陈女士家住钟庄社区办事处马南组。她说，1月1日下午5点左右，她正在家里面，突然感觉到地面抖了一下，屋顶发出吱吱的声响，水泥地面也在晃动，她赶紧跑出去，发现邻居都已经冲出家门。</p>\n\n<p>　　“怎么回事？”大家互问，最后一致认定是遭遇地震。陈女士平时一般住在县城，此前并未感觉过震动，但是大家都反映，房子摇晃，而且在地震前听到一阵轰隆隆的巨响。</p>\n\n<p>　　在钟庄南边一处加油站，记者询问这几天的情况，工作人员称，震感最明显的还是1月1日下午5点左右那一次，而据地震台网消息，准确时间是下午5点07分，ML3.5级。“当时震感挺强烈的，地面明显晃了一下。”</p>\n\n<p>　　“这些天到底震了多少次，我也说不清楚。”一位女工作人员说，反正在夜里多次感觉到了，都不明显，一般在凌晨四五点，就好像是大货车经过时的震动一样，包括1月1日那次最强的地震，感觉就是震动了一秒左右就停止了。</p>\n\n<p>　　县城距离钟庄大约9公里，住在县城某小区的朱先生是个有心人，他说，从1月1日下午5点左右那一次地震开始，建湖县连续震了多次，晚上9点32分震了一次，1月2日清晨6点32分又震了一次。他说，在晚上9点多那次震过后，他吓得从四楼跑了下去，结果发现不少住户都出门了。</p>\n\n<p>　　当时夜间很冷，朱先生说，很多人都带了两件羽绒服，穿在身上御寒。观察了一会，没有再发生什么动静，他们才回家，但他直到零点以后才睡着，“总是担心床会摇晃！”</p>\n\n<p>　　昨晚6点多，记者途经县城时，发现城里秩序井然，已看不出任何地震的明显影响。路上的行人很少，绝大多数人已经因为寒冷的天气早早回到了家里。</p>\n\n<p>　　<strong>居民用木棍稻草搭起地震棚</strong></p>\n\n<p>　　在县电视台的有线节目上看到字幕，说是发生地震，大家一商量就搞了地震棚</p>\n\n<p>　　不过就在加油站附近的钟南生产队，记者看到有人家已经搭起了地震棚。居民孙景树家住在钟庄最南头，是两层的漂亮楼房，不过现在他和老伴带着四岁的孙女一起住进了昨天下午刚刚搭好的地震棚。</p>\n\n<p>　　记者看到，地震棚在屋子南头的麦地里，是用木棍、油毛毡等做架子，北面的风口堆放了大量的稻草，东西也是如此，南面是敞开的，孙景树说还来不及在南面挂个帘子。</p>\n\n<p>　　和他们一家一起准备凑合过一夜的还有两户邻居，一户是李大妈，带着小孙女，一户是住户郑琴。为了尽量取暖，地上铺了厚厚的稻草，记者坐上去感觉虽然毛糙一点，但是还比较暖和，盖上厚被子，不至于受冻。</p>\n\n<p>　　为什么要搭地震棚？郑琴说，其实此前他们还不知道有地震呢，直到昨天中午，在县电视台的有线节目上看到了字幕，说是发生地震，大家一商量就搞了地震棚。</p>\n\n<p>　　“当然，也不是一点感觉没有。”郑琴说，前天下午震了一次强烈的，孙景树的大孙女在服装厂上班，当时员工都跑出来了。到了夜里9点多，她正在看安徽卫视的跨年晚会，突然又震了，电视机都晃了一下。早晨出来和大家一说，就决定搭个棚子。</p>\n\n<p>　　李大妈的儿子在无锡打工，她说，儿子前天就从网上看到了地震的消息，当即打电话回来问，此后电话不断，他们住进棚子，也是让家人放心，“大人倒无所谓，关键是孩子！”</p>\n\n<p>　　孙景树说，这个棚子要住八九个人呢，大孙女自从1月1日下午那次强震之后，夜里就睡不着了。此外，郑琴有个13岁的儿子，夜里也要回来住，“大家就这样挤着睡吧。”</p>\n\n<p>　　<strong>村干部通知“尽量不住楼房”</strong></p>\n\n<p>　　“村干部昨天上门通知，要求大家做一定的预防，搬到平房里去，这样更安全一些。”</p>\n\n<p>　　孙景树说，这个地震棚确实好多年没搭过了，还是1991年左右搭过。住棚子无所谓，关键是不要大震，“好好的家可不能震坏了。”他说，好像听说这次要防震时间长一些，他们准备住半个月。</p>\n\n<p>　　附近的红旗西南生产队，据孙景树称，村干部昨天已经上门通知了，要求大家做一定的预防，主要是尽量不住楼房，搬到平房里去，这样更安全一些。</p>\n\n<p>　　记者随后来到孙景树家对面一家金惠源超市，开超市的姜大亮说，他们家也搭起了地震棚，暂时能住四五个人，“不过如果真是有什么强震，可以避难啊，大家白天可以坐在里面，夜里也一样，至少可以遮风避雨。”</p>\n\n<p>　　姜大亮说，自己特别关注这次地震，目前他也从网上得知发生31次小震，不过他说，昨天白天11点左右，又发生一次地震，大家都感觉到了，所以现在已经不止31次了。</p>\n\n<p>　　“小地震不可怕，可是这么频繁，就有点让人担心了。”姜大亮说。而其他居民也提到，都有点纳闷，为什么总是震，“不是说地震前有地震云吗，我们没看到啊！”</p>\n\n<p>　　<strong>发布</strong></p>\n\n<p>　　地震发生后，江苏省地震局的专家们紧急进行了地震会商，得出的结果是：近期该地区没有发生破坏性地震的前兆异常，但不排除该地区在近期发生有感地震。</p>\n\n<p>　　据江苏省地震局副巡视员龚寿荣介绍，地震一般在5级或5级以上才叫破坏性地震，而一般3级左右，称为有感地震。有感地震在全国大中城市行政区域内发生并不鲜见，市民大可不必多虑。“这次是正常的能量释放，不具备破坏性。”</p>\n\n<p>　　<strong>建湖县政府：</strong></p>\n\n<p>　　<strong>没造成任何伤害和损失</strong></p>\n\n<p>　　2011年1月1日10时57分，在江苏省盐城市建湖县(33.56°，119.88°)发生M2.7级地震。</p>\n\n<p>　　2011年1月1日17时07分，在江苏省盐城市建湖县(33.56°，119.84°)发生M2.9级地震。</p>\n\n<p>　　2011年1月2日1时11分，在江苏省盐城市建湖县(33.55°，119.85°)发生M2.5级地震。</p>\n\n<p>　　……</p>\n\n<p>　　很多人都沉浸在新年的美好中，但不期而遇的地震，却让盐城建湖一带的居民不安。尽管都是小地震，但大家还是难免恐慌。据了解，从2010年12月30日清晨一直到昨日清晨，建湖地区已经发生31次地震，其中6次为有感地震。而6次有感地震中，里氏(M)2.3级地震2次，里氏(M)2.5级地震2次，里氏(M)2.7级地震一次，里氏(M)2.9级地震一次。1月1日，是有感地震次数最多的一天，一共发生了3次，最大一次就是前天17：07发生的里氏(M)2.9级地震，震中都在建湖县境内的钟庄(原钟庄镇)，周边的草堰口、冈西、建湖县城有震感。</p>\n\n<p>　　昨天记者从建湖县政府宣传部了解到，目前县里面高度重视此事，相关的措施都已采取。</p>\n\n<p>　　“地震级别都不大，没有造成任何伤害和损失。”宣传部的陈主任说，他自己也感觉到了几次，但都是很快就过去了。县城里也没有出现抢购食品等现象。</p>\n\n<p>　　“目前政府也在关注下一步会怎么样，有没有更强的地震。”陈主任说，昨晚县科委等部门从上级部门得到消息，目前来看，不排除继续发生有感地震，但是综合判断，目前没有发生破坏性地震的可能性。</p>\n\n<p>　　记者了解到，昨天省地震局和盐城市地震局的相关负责人已经带着监测设备赶到钟庄。昨晚记者在钟庄社区办事处内看到，一台监测仪器已经被布置在了办事处的围墙上，连着的数据线通到室内的一套设备上面，监测仪器看起来就像一个水杯，引得不少人进来观看。</p>\n\n<p>　　“应该问题不大吧。”不少住户表示，不相信建湖会发生大地震，所以基本上都没有搭地震棚的打算。</p>\n\n<p>　　<strong>江苏省地震局：</strong></p>\n\n<p>　　<strong>近期不会有破坏性地震</strong></p>\n\n<p>　　建湖发生地震后，江苏省地震局的专家立刻进行了紧急地震会商，虽然都是小地震，但专家们都特别关注，会议从1日下午一直持续到2日凌晨两点多。昨天下午，江苏省地震局又进行了第三次地震会商，结果是：目前没有监测到发生破坏性地震的前兆异常，“近期不会发生破坏性地震，但不排除发生有感地震的可能。”</p>\n\n<p>　　江苏省地震局副巡视员龚寿荣告诉记者，地震发生后，当地已经启动了地震预防预案。江苏省地震局的专家带着观测仪器赶到现场，在现场增加了流动观测仪器，同时，盐城地震局加强了24小时值班。今天一大早，江苏省地震局的监测、预报、通讯专家也将赶到一线，为当地带来更精确细密的监测。</p>\n\n<p>　　同时，地震局的专家还配合当地政府，向受到震慌的居民进行解释工作，也会在第一时间将有关监测情况向公众发布。</p>\n\n<p>　　<strong>史上曾发生“几天几十次地震”</strong></p>\n\n<p>　　盐城市位于华北地台和下扬子准地台的过渡地带，除周边的郯城－庐江深大断裂、海安－拼茶断裂和南黄海大断裂外，影响盐城市的主要断裂有盱眙－响水断裂、盐城－南洋岸断裂、洪泽－沟墩断裂、陈家堡－小海断裂、盐城－阜宁断裂、苏北滨岸断裂等。</p>\n\n<p>　　造成这次连发地震的是洪泽—沟墩断裂带，这条断裂带周边曾经多次发生地震，最密的时候，曾经在几天内连续发生几十次地震。</p>\n\n<p>　　龚寿荣介绍说，洪泽—沟墩断裂带上最大的一次地震是里氏5级左右，1991年和1992年曾经发生过里氏4.7级、4.8级地震。</p>\n\n<p>　　“这次是正常的能量释放，不具备破坏性。”龚寿荣告诉记者，目前建湖还没有发生房子遭破坏等任何由于地震带来的损失。“虽然这一地区有小地震发生，但地震活动强度弱，目前全省地震观测数据资料分析正常，近期该地区及全省不会发生破坏性地震。”</p>\n\n<p>　　<strong>■谣言顿起</strong></p>\n\n<p>　　<strong>“地震”</strong></p>\n\n<p>　　<strong>是钻探引发的？</strong></p>\n\n<p>　　在政府发布消息之前，网上早就有消息了。建湖居民姜大亮说，他一直在关注贴吧的建湖吧，从12月31日左右就有网友发布地震消息，到1月1日，一天之内震了10来次，网上开始沸腾。</p>\n\n<p>　　“上面全是网友的留言，都是讲述地震感受的。”姜大亮说，不少人都在交流感受，他也不断地用手机上网，并且参与讨论。</p>\n\n<p>　　1日晚上，姜大亮发现，贴吧网速已经很慢，说明上网的人非常多，他夜里睡不着，半夜里也挂在网上关注消息。</p>\n\n<p>　　在网友的交流中，有人还认为政府发布消息不够快，门户网站都转载网友的消息了，政府的地震台网还是没有任何消息，直到前天晚上才发布。</p>\n\n<p>　　据了解，在当地也出现了一些不靠谱的谣言，有人就称，昨天中午县有线电视台发布了预警消息，称下午5点05分会发生一次3级地震。不过对此，姜大亮表示根本不可能，而且当时电视上根本没有提到。“怎么可能如此精确呢，地震预报还做不到啊！”</p>\n\n<p>　　此前，在建湖曾流传，这不是地震，而是相邻的射阳等县最近勘探油田，是钻机钻探引发的，不过现在已经排除了这个说法。</p>\n\n<p>　　<strong>■网言网语</strong></p>\n\n<p>　　<strong>家中的老母</strong></p>\n\n<p>　　<strong>还好吗？</strong></p>\n\n<p>　　建湖贴吧这两天因一次小地震人气上升不少。</p>\n\n<p>　　人在遥远的南方，心在建湖。刚刚听说晚上可能有地震，很是担心家中的老母，希望知情人说说。</p>\n\n<p>　　地震了，绝对地震了，就在刚才二十秒之前。</p>\n\n<p>　　我们建湖是个风水宝地，无旱无涝又没得龙卷风，只是小地震而已。</p>\n\n<p>　　这几天吓死了！房子晃来晃去的！</p>\n\n<p>　　电脑晃了一下，整个楼都晃动了一下，吓死了，我在想不会是地震了吧，后来到网上一看，天啊，都震好几次了。</p>\n\n<p>　　建湖又地震了！!!好担心~~~ 希望家里人没事。</p>\n\n<p>　　我元旦没回去，对此一无所知，家里也没电话告诉我。</p>\n\n<p>　　是有人在钟庄那采石油？在外地的建湖人，心系家乡，求真相。摘自贴吧</p>\n\n<p>　　<strong>释疑</strong></p>\n\n<p>　　<strong>为啥震感较强？</strong></p>\n\n<p>　　<strong>盐城市地震局：震源较浅！</strong></p>\n\n<p>　　昨天下午，盐城市地震局值班人员表示，这次小的地震群发生，和地质构造有关系，因为建湖一带位于洪泽-沟墩断层上，历史上建湖发生的地震也与此有关，近期断层活动引起了地面的震动。而且这一次地震震源较浅，所以即使是ML2.7级以下的地震，也可能会有感受。</p>\n\n<p>　　另据了解，其实在江苏省地震台网发布消息的同时，相邻的山东省地震台网也在前天中午11点多发布过1日一次地震的测定数据。</p>\n\n<p>　　据了解，建湖县历史上地震并不多，这次地震的级别在当地地震局看来并不算高，此前1991年到1992年之间，曾发生过ML4.7级地震，当时也是地震群，即连续发生几十次小震，而历史上最高为5级。</p>\n\n<p>　　而2010年7月9日和7月19日，在江苏省南通市如东县附近海域(北纬32.5°，东经121.6°)10天内也连续发生两次3.8级地震。</p>\n\n<p>　　<strong>为啥晚上地震多？</strong></p>\n\n<p>　　<strong>省地震局：安静，容易感觉到！</strong></p>\n\n<p>　　江苏省地震局副局长张振亚介绍说，一般来说5级或5级以上的地震才称之为破坏性地震；而有感地震，与白天还是晚上，以及震中距离和震源深浅都有关系。“白天大家都在工作，相对喧闹，不会那么敏感，但到了晚上，大家都睡觉了，很安静，对周边环境也特敏感；另外距离震中越近，越会有感觉，而震源越深，震级会越大，震级越浅，感觉也会更强烈一些。一般情况下3级左右的地震，称为有感地震；但如果距震中近，又是晚上，2级左右就会有感。”</p>\n\n<p>　　<strong>最高是3.5级还是2.9级？</strong></p>\n\n<p>　　<strong>省地震局：同一震级的两种标度</strong></p>\n\n<p>　　据盐城地震局官网显示，2010年12月30日23：57，钟庄发生ML2.1级地震，12月31日5：02，钟庄发生ML2.4级地震，12月31日10：34，钟庄发生ML2.6级地震；2011年1月1日17：07，钟庄发生ML3.5级地震；1月1日18：26，冈西发生ML2.2级地震；1月1日21：33草堰口发生ML3.0级地震……</p>\n\n<p>　　记者发现，同一个时间点内，也就是1月1日17：07，江苏省地震局台网对外公布的是里氏(M)2.9级地震，而盐城地震局对外公布的却是ML3.5级地震。“当地居民每个人都知道是3.5级地震，怎么会是2.9级？究竟哪个更准确？”对此，专家说，其实是一回事，是同一震级的两种标度。江苏省地震局用的是现在最常用的里氏测算发，也就是MS，是“面波震级”，而ML则是“近震震级”测算方法。</p>\n\n<p>　　据了解，这两种标准的差别在于，里氏是按照面源测定，即测定综合的地区比较广，而ML则是近源测定，即以靠近震中的烈度和强度等来测定震级，所以里氏震级一般要低于ML标准的，不过对于超过6级以上的地震，ML标准就不再能准确测定，有其局限性。</p> \n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('50', '\n<p>　　本报云浮讯 (记者于敢勇摄影报道)昨日凌晨1时，西江水域郁南县南江口讴塘角段发生一宗沉船事故，据初步了解船上<a href=\"http://news.sina.com.cn/c/2011-01-02/132221748962.shtml\" target=\"_blank\">11人全部落水</a>，其中4人获救，7人失踪，目前当地有关部门已全力做好失踪人员的搜索救援和善后工作。</p>\n\n<p>　　<strong>已申请出动蛙人帮助救援</strong></p>\n\n<p>　　昨日9时36分，云浮市府应急办接云浮海事局报告：肇庆海事局德庆海事处报知，1月2日凌晨1时许，一艘惠州籍的抽沙船在当地雇请了一艘渔排工作小艇和当地人员共11人，到郁南县南江口讴塘角对开河段并上工作小艇，当小艇行至西江水域南江口讴塘角对开河段时翻沉，据初步了解，船艇上11人全部落水，其中4人获救，7人失踪。目前失踪人员具体名单正在核实当中。</p>\n\n<p>　　记者闻讯后上午12时赶赴现场，只见江堤上停放着警车、救护车等救援车辆，一艘海巡船和两艘冲锋舟正在江面搜寻，但宽阔的西江深水静流，没有一丝落水人员的音讯，失踪者生还的希望渺茫。</p>\n\n<p>　　接报后，肇庆、云浮海事局立即启动应急预案，马上派出海巡1564船和巡车2733号，联同郁南都城海事处、云安六都海事处工作人员与当地公安、安监、交通等部门工作人员，从水路、陆路赶赴出事水域实施救援工作。由于水下情况复杂，当地海事部门已经申请广州救捞局派出蛙人帮助搜救。</p>\n\n<p>　　沉船事故发生后，云浮市、县两级党委、政府高度重视，云浮市委书记、市人大常委会主任王蒙徽，市委副书记、市长黄强等领导分别迅速作出批示，要求郁南县、云安县和有关部门全力做好失踪人员的搜索救援和善后工作，千方百计将人员伤亡降到最低。</p>\n\n<p>　　同时立即成立事故调查处理工作组，迅速深入到事故现场认真做好事故调查工作，尽快查清事故原因，并举一反三，严格落实专项整治和安全监管措施，加强陆路、水道交通安全巡查，坚决防止类似事故的发生。郁南县、云安县委、县政府有关领导也立即赶赴现场处理。</p>\n\n<p>　　<strong>涉事人员已被依法控制</strong></p>\n\n<p>　　目前，涉事的有关人员已被依法控制，搜索救援、事故调查等工作正在紧张有序进行中。云浮市县应急、公安、综治、安监、交通、卫生、渔政、海事等部门火速组织人力赶到现场组织救援及开展事故处理工作。</p> \n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('51', '<p>　　因为担心&ldquo;带有糟粕性的内容&rdquo;会&ldquo;扭曲了学生的价值观念，腐蚀了中小学生的心灵&rdquo;，<a target=\"_blank\" href=\"http://news.sina.com.cn/c/2010-12-30/051721731331.shtml\">山东省教育厅日前下发通知</a>，严禁该省各级教育行政部门和中小学校向学生&ldquo;不加选择地&rdquo;全文推荐《弟子规》《三字经》《神童诗》等。这一消息引起社会各界关注和热议。记者近日探访发现，此前湖北省已有部分学校专门对《三字经》等经典文本进行了删节，然后重新编排后再发给学生学习。</p>\r\n<p><strong>　　部分学校推荐删节版《三字经》</strong></p>\r\n<p>　　据了解，湖北省很多中小学都开展了《三字经》《弟子规》等诵读活动。一些学校给学生推荐的是删节版的国学内容。武昌区九龙井小学语文教研组主任魏贤佐介绍，该校在教学生读经典时，重新选择文章，对《三字经》《弟子规》《增广贤文》等经典文本进行了打印编排，&ldquo;中国国学经典中大多数内容都是好的，但也有一些不科学或与时代发展相悖的东西，如封建思想严重，轻视女性、轻视劳动等&rdquo;。</p>\r\n<p>　　记者翻看该校重新编印的经典读本时发现，&ldquo;昔孟母，择邻处&rdquo;、&ldquo;书中自有黄金屋，书中自有颜如玉&rdquo;等句子被删掉。魏贤佐解释，他们认为&ldquo;昔孟母，择邻处&rdquo;暗藏了&ldquo;环境决定一切的意思&rdquo;，而在现代社会，人要学会适应环境、学会与人和睦相处；《劝学诗》中的&ldquo;书中自有黄金屋，书中自有颜如玉&rdquo;，启示的是读书考取功名是古代人生的一条绝佳出路，但在现在，读书就是接受教育，教育是社会的一个功能，让学生掌握知识技能，以投身社会，服务社会&hellip;&hellip;</p>\r\n<p>　　湖北省实验小学副校长、&ldquo;湖北名师&rdquo;蒋卉介绍，该校在新编辑的校本教材中，也对国学经典中有争议的句子，如体现&ldquo;惟师&rdquo;思想的，进行了舍弃，&ldquo;现在要求学生要敢于质疑，挑战权威，而不是盲目服从老师。&rdquo;</p>\r\n<p><strong>　　专家：&ldquo;道德利令&rdquo;，删得有理？</strong></p>\r\n<p>　　湖北大学教授、评论家刘川鄂认为，《三字经》、《论语》等国学作品，是在农耕时代留下来的，其中有些内容是&ldquo;道德利令&rdquo;，是在一种不平等的身份和心态中进行的，它与现代意义上的人道关怀不可同日而语，也不利于现代个体人格的培养。&ldquo;学生应该辩证性地读中外经典。&rdquo;刘川鄂说，&ldquo;应先做具体分析，分清糟粕与精华，而且对精华还要结合实际，才能&lsquo;古为今用&rsquo;。&rdquo;</p>\r\n<p>　　曾在央视《百家讲坛》解读过《弟子规》的复旦大学历史学系教授钱文忠，去年11月在第三届新东方家庭教育高峰论坛上表示，有人问他这几年讲国学、讲《三字经》《弟子规》，你觉得最大的难处在哪里？他认为，最大的困难是如果按照《弟子规》《三字经》的标准培养孩子，到社会上90%是会吃亏的。</p>\r\n<p><strong>　　质疑：不能因噎废食</strong></p>\r\n<p>　　经典是否一定要&ldquo;去其糟粕&rdquo;，才能让学生阅读？一些校长、老师却对其表示质疑。武昌积玉桥学校要求小学毕业生，必须能够背诵《三字经》《弟子规》《大学》等经典。校长祝正州认为，这些经典就应该通篇诵读，学习不能因噎废食，&ldquo;阅读经典，是为了学习进而传承传统文化的精华，并了解文化发展的轨迹。如果担心学生把部分不适宜的内容误作好东西吸收，老师完全可以引导。&rdquo;&ldquo;湖北名师&rdquo;、武汉中学特级教师萧兴国说，&ldquo;若人为地把作为一个整体的经典割裂开，学生将无法吸收其精髓，也不知道什么是糟粕。对传统经典作品的切割容易给学生造成误解和误导，使学生失去自己探究和分析鉴别的能力。&lsquo;去其糟粕&rsquo;同样是学习的过程。&rdquo;(楚天都市报)</p>\r\n<p><strong>　　网友呼吁善待经典</strong></p>\r\n<p>　　对于山东、湖北学校的一些删除经典的做法，有网友评论《三字经》《弟子规》等之所以成为启蒙经典，是被历史所证明了的精华。</p>\r\n<p>　　部分网友更指不少经典被断章取义，造成对全社会的误导。&ldquo;一句&lsquo;以德报怨&rsquo;，我们误解了那么多年！直到进了大学，我才知道孔子说的其实是&lsquo;以直报怨，以德报德&rsquo;。不管古人观点是对是错，我们至少应该有了解原话和原著的权利吧？&rdquo;一位网友说，正是因为被人故意省略了一句话，孔老夫子被扭曲成了温婉的受气包形象。</p>\r\n<p>　　还有网友无奈感叹，近年来孩子们的&ldquo;阅读禁区&rdquo;似乎越来越多，&ldquo;鲁迅无奈地走了，朱自清的《背影》也越来越远，最终消失在地平线。现在轮到王应麟抱着他的《三字经》简，一脸忧郁&hellip;&hellip;&rdquo;</p>\r\n<p><strong>　　删除理由</strong></p>\r\n<p>　　昔孟母，择邻处</p>\r\n<p>　　书中自有黄金屋，书中自有颜如玉</p>\r\n<p>　　暗藏了&ldquo;环境决定一切的意思&rdquo;，而在现代社会，人要学会适应环境、学会与人和睦相处</p>\r\n<p>　　书中自有黄金屋，书中自有颜如玉</p>\r\n<p>　　启示的是读书考取功名是古代人生的一条绝佳出路，但在现在，应让学生掌握知识技能，以投身社会，服务社会&hellip;&hellip;</p>\r\n<p>　　(综合中央人民广播电台)</p>\r\n<p><strong>　　名词解释</strong></p>\r\n<p><strong>　　经典诵读活动</strong></p>\r\n<p>　　中华经典诵读活动是教育部、国家语委于2007年9月正式启动的， 在相关文件中显示，这一活动的目的要使广大人民群众，特别是广大青少年，进一步加深对民族精神和优秀传统文化的理解，在背诵中亲近中华经典，在亲近中热爱中国文化，在热爱中弘扬中华文明，在弘扬中整合创新。</p>\r\n<div class=\"blkComment otherContent_01\" style=\"padding-right: 0px; margin-left: 0pt; margin-right: 0px\">&nbsp;</div>\r\n<div class=\"otherContent_01\" style=\"zoom: 1; overflow: hidden\">\r\n<p>　&gt; <strong>相关报道：</strong></p>\r\n<p>　　<a target=\"_blank\" href=\"http://news.sina.com.cn/c/2010-12-30/051721731331.shtml\">山东禁止中小学推荐学生全文阅读三字经</a></p>\r\n<p>　　<a target=\"_blank\" href=\"http://news.sina.com.cn/c/sd/2011-01-03/081921750933.shtml\">专家评析学校删减经典做法:不应代替学生做选择</a></p>\r\n</div>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('52', '\n<p>　　昨天，记者从苏州市公安局获悉，从2011年1月1日起，《苏州市户籍居民城乡一体化户口迁移管理规定》正式实施，新规定对苏州市城乡户籍居民户口迁移政策进行了调整和放宽。其中，有苏州户口、有住房，就可在大市范围自由迁移；落户苏州，不再受购房年限、工作地域、参保关系等限制。该规定适用地域范围为苏州市区、张家港市、常熟市、太仓市、昆山市、吴江市，主要针对苏州市大市范围内即苏州市区和五县市的户籍居民的户口迁移，也就是现已具有苏州户口的城乡居民。</p>\n\n<p>　　据苏州公安户政部门有关负责人介绍，从2011年1月1日起实施的调整和放宽苏州市城乡户籍居民迁移政策，主要体现在三个方面：一是全市范围内实行城乡统一的以拥有合法固定住所为基本条件，办理户口迁移的户籍登记管理制度。统一了苏州市区和五县市城乡居民户口迁移准入政策，取消了以往户籍居民户口迁移所需要的房屋产权证年限、工作地域、参保关系等限制。</p>\n\n<p>　　其次，对农村居民户口迁移进行放宽，明确只要在城镇就业并在城镇拥有合法固定住所的农户、动迁安置在城镇和开发区的农户、实行“三置换”进城进镇的农户，以及城中村和失地的农户、符合城乡一体化规范要求的新型新农村建设的农户、其他具有进城进镇愿望的农户等六种情形的农村居民都可迁移户口。</p>\n\n<p>　　另外，新规定开始实施后，在苏州全市范围内，实施网上户口迁移一地办理制，实行一站式服务，户籍居民迁移户口不再需要往返奔波于两地行政服务中心和派出所之间，只需在户口迁入地公安机关办理，户口审批办理时间将从以前的20个工作日缩减为3个工作日；今后全市范围内跨市户口迁移，不再使用《户口迁移证》、《准予迁入证明》，进一步简化手续，方便市民。</p>\n\n<p>　　需要特别说明的是，新《规定》还明确本市居民在城乡间的户口迁移，其户籍登记内容依法只作公民身份信息登记，不作为享受有关政策待遇的唯一依据。户口迁移后，其涉及社会保障、土地承包、宅基地、计划生育等事宜，由苏州市相关部门按规定办理。薛马义</p>\n\n<p>　　延伸——【“合法固定住所”可以是公租房】</p>\n\n<p>　　何为“合法固定住所”呢？苏州市公安局户政处表示，合法固定住所既可以是申请迁移人在苏州市居住房屋属于自己的产权房屋，也可以是租住属公有产权并领取使用权证的房屋。再进一步说，新规定实施后，苏州市户籍居民在大市范围内拥有上述性质的合法固定住所，就可以自由迁移落户，包括在苏州大市范围内拥有多套房屋的，只要本人愿意，均可自由选择一地落户。</p> \n', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('54', '<p>接近欧盟外交高层的消息源12月30日对法国主流媒体透露，欧盟对华持续20多年的武器禁运，有望在2011年初取消。</p>\r\n<p>法国主流媒体《费加罗报》30日引述与欧盟外交政策负责人阿什顿女士关系密切的外交人士的话说，欧盟对华武器禁运令可能会&ldquo;很快到来&rdquo;。</p>\r\n<p>《费加罗报》分析认为，这意味着最早在2011年初武器禁运令可能就会取消。</p>\r\n<p>1989年美国和欧洲等西方国家开始对中国实施严格的武器禁运。</p>\r\n<p>该报援引这个消息源的话说，由于中国和美国以及欧洲国家很少有武器往来，并且中国在建设自身国防体系方面取得了很大成就，因此这项实施了20多年的禁运令实际上对中国并没有产生太大影响。</p>\r\n<p>媒体援引一份12月17日欧盟峰会后曝光的报告称，武器禁运已经成为欧洲和中国发展安全与外交关系中的一个&ldquo;主要障碍&rdquo;。</p>\r\n<p>报告还称，在此情况下，&ldquo;欧盟应该做出现实的判断，并且采取行动。&rdquo;</p>\r\n<p>今年9月，一度传出欧盟将解除对华武器禁运，但针对此问题，欧盟各成员国产生分歧，西班牙、法国表示支持，但是一些东欧国家对此不认同，还有国家要求为解禁提出附加条件。</p>\r\n<p>但欧洲媒体指出，20多年来，欧洲国家对此问题的分歧正在缩小。此前支持对华禁运的英国、荷兰以及德国等国，目前都降低了反对的调门。</p>\r\n<p>分析</p>\r\n<p>&ldquo;中国对欧武器需求不大&rdquo;</p>\r\n<p>中国军事问题专家张博称，欧盟至今维持的对华武器禁运是冷战思维的体现。即使未来解除禁运，中国对欧盟军事采购也不会明显增加。中国呼吁取消禁运的主要目的是希望欧盟消除对华歧视政策。</p>\r\n<p><br />\r\n张博表示，欧盟对华武器禁运是当时整个西方对华进行制裁的一部分，但是20多年来，中国、欧洲和全世界的形势都发生了巨大变化，固守对华武器禁运明显带有冷战思维，对中国来说不公平，是歧视。这是中国呼吁欧盟解除武器禁运的主要原因。</p>\r\n<p>如果欧盟能在短期内解除对华武器禁运，当然是好事;但中国对欧盟的军事采购不会有明显增加。因为总体上看，我们现在的军事装备、军事技术体系可以做到自给自足，对于欧洲的军事技术的需求并不迫切，但对于我们引进先进技术、装备、理念和人才都是有利的。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('55', '<p class=\"f_center\" style=\"text-align: center\"><img alt=\"日否认欲建&ldquo;日韩同盟&rdquo;(组图)\" src=\"http://img1.cache.netease.com/catchpic/8/81/8138BD0C61A6BA1B05FB93C878E94BAC.jpg\" /></p>\r\n<p>2010年10月，东京，日本首相菅直人检阅自卫队。日本政府3日否认欲与韩国军事结盟。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"日否认欲建&ldquo;日韩同盟&rdquo;(组图)\" src=\"http://img1.cache.netease.com/catchpic/D/D0/D02114CE13A2A691AA68D12D576A48BD.jpg\" /></p>\r\n<p>去年12月，韩国总统李明博视察位于江原道的韩军部队。</p>\r\n<p>3日，东北亚地区因为韩朝交火和美韩日密集军事演习引发的紧张气氛尚未消散之际，韩国媒体又爆出&ldquo;大新闻&rdquo;，称日本提议建立日韩军事同盟。消息一出来，日本政府赶紧辟谣，称日方并无此意，仅是希望日韩加强在安全保障领域的合作。</p>\r\n<p>针对朝鲜提议结盟？</p>\r\n<p>目前，东北亚地区已经有两大军事同盟，日美同盟和日韩同盟，如果日韩再结为盟友，整个东北亚无异于彻底回到了冷战时代。爆出这一消息的是韩国《每日经济新闻》，该媒体3日刊出了对日本外相前原诚司的一次新年书面采访。这篇报道援引前原的&ldquo;话&rdquo;称，&ldquo;朝鲜（去年）的武力挑衅行为，对朝鲜半岛乃至整个东亚的安定与和平均构成了威胁，因此，（日本）希望与韩国在安全保障领域结成同盟关系。&rdquo;</p>\r\n<p>报道称，前原在接受采访时说，进入新的一年，日本外交最大的课题之一就是与近邻各国构筑牢固的安全保障机制。而为了与韩国就安保合作问题展开讨论，他希望在不久后访问韩国，与韩国外交通商部长官会晤。</p>\r\n<p>日要求韩媒体更正</p>\r\n<p>就前原&ldquo;提议&rdquo;的建立日韩同盟问题，《每日经济新闻》分析称，一旦两国结盟，韩国军队不仅将与日本自卫队展开联合军事演习，在朝鲜半岛爆发冲突之际，日本自卫队还可能向韩国派兵进行支援，以及开展其他涉及安保和军事领域的全方位合作。</p>\r\n<p>而在谈到韩国国内可能因为日本政府对其侵略史的态度，反对日韩结盟时，报道援引前原的&ldquo;话&rdquo;说，日本政府会彻底反省应该反省的历史，而日韩两国不仅应该在政治、经济和文化领域加强合作，还应为扩大安保领域的同盟关系，不断进行努力和展开对话。</p>\r\n<p>《每日经济新闻》的上述专访内容3日刊出后，日本外务省立即表态，否认前原说过&ldquo;希望建立日韩同盟&rdquo;。外务省方面称，&ldquo;前原外相表达的意思是&lsquo;日韩强化在安保领域的合作很重要&rsquo;，并主张建立有利于日韩在安保领域展开良好对话的环境，所谓&lsquo;希望建立日韩同盟&rsquo;并不属实。&rdquo;外务省发言人还要求《每日经济新闻》立即对3日的报道进行更正。</p>\r\n<p>截至3日晚，作为被采访者的前原并没有对韩国媒体的报道作出任何表态。前原诚司在日本执政的民主党内是著名的鹰派人物、少壮派中坚。（百千）</p>\r\n<p>动态</p>\r\n<p>日防相外相接踵访韩</p>\r\n<p>日方可能提议日韩签署重要军事协议</p>\r\n<p>在日本外务省否认提议日韩结盟的当天，日本媒体传出消息。外相前原诚司正准备本月14日访问韩国，推动日韩在安保领域的合作。</p>\r\n<p>据称，目前这一访问日程已进入最后协商阶段。如果成行，将是前原去年9月就任外相以来首次访问韩国。前原准备会见韩国外长金星焕，就目前紧张的朝鲜半岛局势交换意见。</p>\r\n<p>除了前原，日防卫大臣北泽俊美也将于10日开始访问韩国，日本媒体称，北泽在访问期间可能会提议日韩签署一项重要的军事合作协定两国军队互相提供物资和服务。目前日本已与盟友美国及&ldquo;准盟友&rdquo;澳大利亚达成上述协定，根据该协定，日本自卫队与美军或澳军可互相提供食品、水、燃料等物资以及运输和修理等服务。日媒体称，日本防相与外相相继访韩，旨在强化日韩在安保领域的合作。</p>\r\n<p>另有日本媒体报道称，前原除了准备访韩外，还计划3月访问中国，以求改善自去年9月以来停滞的日中关系。（百千）</p>\r\n<p>周边</p>\r\n<p>朝韩互放&ldquo;对话&rdquo;信号</p>\r\n<p>朝媒体多篇文章呼吁对话，李明博称和平道路并未被阻断</p>\r\n<p>综合新华社电 朝鲜《劳动新闻》3日发表多篇文章，呼吁进行朝韩对话，改善朝韩关系。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('56', '<p>国际在线报道（驻俄罗斯记者盛晶晶）：3号，俄罗斯总统梅德韦杰夫正式签署一项关于优化联邦国家机关工作人员数量的命令，称联邦政府将在今后3年内削减20%的公务员，并严格控制政府机构的人员增长。这是自苏联解体以来，俄罗斯联邦政府第一次大规模裁减公务员。</p>\r\n<p>3号俄罗斯总统梅德韦杰夫正式签署了关于优化联邦国家机关工作人员数量的命令。俄罗斯媒体援引克里姆林宫新闻局当天的消息说，该总统令规定未来3年内将有不少于20%的俄国家公务人员被裁掉。总统令同时责成联邦政府提交相应的具体裁员建议。此外，这份总统令还将转交俄联邦会议（议会）、联邦审计署和中央选举委员会审议。这些部门在审议之后将就裁员问题向联邦政府提出合理化的建议。根据总统令的规定，即将开始的裁员行动将分阶段进行：即2011年和2012年每年减少5%的公务员数量，而2013年将削减10%，裁员总数将不少于12万人。另外，50%因裁减公务员而节省出的预算将被转而用于提高在岗公务人员的物质福利。</p>\r\n<p>去年6月初俄罗斯财政部长库德林以帮助国家主动减少财政赤字为由向俄总统提出拟裁减公务员的计划。库德林表示，裁员20%意味着每年将节省近430亿卢布（约十几亿美元）的财政开支，而这笔数目可观的开支可以帮助解决许多其他经济问题。对于财政部拟定的政府&ldquo;瘦身&rdquo;计划，俄总统梅德韦杰夫一直表示支持。去年9月的时候梅德韦杰夫就责成联邦政府和克里姆林宫办公厅研究和制定必要的削减规模。他同时也指出，这个计划不能机械地进行，应该按照实际情况循序渐进，财政支持的医生、教师等行业人员不应在裁员行列。</p>\r\n<p>俄罗斯自苏联时期以来形成了官僚腐败、低效的风气；政府机关公务人员数量庞大，且人际关联极其复杂。从苏联时期的勃列日涅夫到现代俄罗斯的普京都曾一度尝试裁员，但公务员却越裁越多，政府机关仍旧&ldquo;臃肿&rdquo;。根据俄罗斯国家统计局的数据，截至2010年中期包括立法、执行和司法机关在内的俄国家公务员数量超过了60万人。</p>\r\n<p><br />\r\n面对仍旧庞大的公务员队伍，梅德韦杰夫在去年6月向国家杜马提交了一份法律草案，规定了国家公务人员的退休年龄由原来的65岁改为60岁。这个草案的实施将直接为裁减公务员除去很多障碍，使得一些&ldquo;超龄服役&rdquo;的国家公务员自觉的下岗。梅德韦杰夫曾强调：&ldquo;削减官员数量，对于国家的发展非常有益。为实现这一目标，必须采取刚性措施。指望官员们自己走人是不可能的。这无疑是一项很残酷的举措，但有助于解决一系列问题。&rdquo;分析人士指出，除了金融危机背景下的财政问题，这次裁员计划实际上是俄罗斯政府又一次尝试改变现有的机构臃肿状态，打击官僚之风，从而进一步提高联邦政府各机构工作的效率。事实上，去年的这个大规模政府裁员计划被宣布之后，虽然俄罗斯社会各界仍有怀疑的声音出现，但是大部分人对政府此举表示了欢迎和信心。</p>\r\n<p>&nbsp;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('57', '<p><strong>美国朝鲜问题特使博斯沃思今天将抵达韩国开始东亚三国之行</strong></p>\r\n<p>国际在线报道（编辑 游佳）：新年伊始，朝韩半岛局势继续牵动国际社会的目光。今天（4号）下午，美国朝鲜问题特使斯蒂芬·博斯沃思将抵达韩国，就朝鲜半岛局势下一步如何行动展开磋商，这也是他此次中日韩三国访问的第一站。据报道，博斯沃思此次访问的议题可能会涉及六方会谈。那么，对于博思沃斯的访问，韩国国内是怎样一个态度？相关的举动能否在新的一年打开朝鲜半岛局势的新局面？</p>\r\n<p>根据韩国媒体的报道，博斯沃思将从3号至7号先后访问韩国、中国、日本，他3号从华盛顿出发，4号抵达韩国，并于5号访问中国，6号访问日本，与各国政府官员举行会谈，就朝核问题等交换意见。今天下午他将抵达首尔。从目前披露的情况来看，韩国外交通商部长官金星焕，还有六方会谈韩国代表团的团长魏圣洛将分别与博思沃斯进行会晤，议题包括重启六方会谈的先决条件，议题的先后顺序等等。</p>\r\n<p>在博斯沃思访问前夕，韩国外交通商部发言人金英善3号下午在例行新闻发布会上就重启六方会谈的问题表明了韩国方面的态度。他说，解决问题的钥匙握在朝鲜的手中。他指出，当天李明博总统在发表新年国政演说时并没有直接提及六方会谈，只是从大局出发，概括了韩朝关系的重要性。金英善说，根据至今六方会谈相关的讨论来判断，朝鲜是否会对无核化表现出诚意至关重要。在朝鲜对无核化表现出诚意的条件下，六方会谈才能得以重启。他还表示，六方会谈是能够商讨朝鲜无核化问题的唯一机制，有关国家一致认为六方会谈还继续有效。</p>\r\n<p>由于目前是各国为重启六方会谈进行频繁外交活动的敏感时期，韩国舆论普遍认为，博思沃斯此次东亚之行将会对重启六方会谈有重要影响，韩国政府对博思沃斯的访问比较重视，也进行了精心的安排。</p>\r\n<p>韩国总统李明博在青瓦台通过广播、电视、因特网等媒体，发表了“新年特别演说”。这个演说主要是表明韩国在新一年的政策方向。在演说中，李明博强调，2011年韩国各项政策的核心集中在安全领域和经济领域。因此，在新一年，韩国将加大国防改革力度，继续增强遏制力，并争取实现5%以上的经济增长速度。</p>\r\n<p>当然，李明博的这次新年特别演说最受关注的还是对于朝鲜政策的阐述。在演说中，李明博首次公开指出延坪岛炮击事件对韩国而言就相当于美国的9·11事件，而美国在9·11事件后重新制定了安全战略和国家战略，暗示韩国将调整国防安全政策和加强军事部署。李明博同时指出，新的一年韩国政府将更加严厉应对朝鲜可能的挑衅，韩国政府不会容忍朝鲜武力威胁韩国国民的人身和财产安全。</p>\r\n<p>另外，李明博还在演讲中表示，朝鲜应该清醒地认识到，军事冒险主义不会得到任何好处。朝鲜开发核武器是对朝鲜半岛和世界和平的严重威胁。国际社会应为促使朝鲜弃核并走向共同繁荣之路而共同努力。</p>\r\n<p>尽管如此，李明博仍然在演讲中表示，韩朝对话的大门并未关闭，只要朝鲜表现出诚意，并兑现自己之前在解除核设施方面的承诺，韩国愿意与国际社会一起扩大与朝鲜的经济合作。李明博在谈话中还督促国际社会共同为朝鲜弃核和繁荣共同努力。</p>\r\n<p>朝鲜的《劳动新闻》、《朝鲜人民军》和《青年前卫》三家报纸报纸，近年来每年都会联合发表元旦社论，外界一般将这一社论看作是朝鲜全年工作的指导方针。而今年这篇社论可以说是释放了不少积极信号，比如社论提到朝鲜和韩国的“对抗应尽早解除”，应把民族共同利益放在首位，为营造朝韩对话、合作氛围积极努力。同时，社论也强调，朝鲜致力于实现东北亚和平以及朝鲜半岛无核化的“决心和立场没有改变”等等。 因此，韩联社发表评论称，这篇社论内容与韩国总统李明博强调韩朝对话重要性的发言相呼应，可以视为朝方愿意推进韩朝政府间会谈的一个表态。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('58', '<p class=\"f_center\" style=\"text-align: center\"><object id=\"flash_97671\" codebase=\"http://fpdownload2.macromedia.com/get/shockwave/cabs/flash/swflash.cab\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" width=\"490\" height=\"394\">\r\n<param name=\"_cx\" value=\"12964\" />\r\n<param name=\"_cy\" value=\"10424\" />\r\n<param name=\"FlashVars\" value=\"\" />\r\n<param name=\"Movie\" value=\"http://img1.cache.netease.com/flvplayer081128/~false~0001_V6OB90R30~vimg2.ws.126.net/image/snapshot/2010/12/3/1/V6OB90R31~.swf\" />\r\n<param name=\"Src\" value=\"http://img1.cache.netease.com/flvplayer081128/~false~0001_V6OB90R30~vimg2.ws.126.net/image/snapshot/2010/12/3/1/V6OB90R31~.swf\" />\r\n<param name=\"WMode\" value=\"Window\" />\r\n<param name=\"Play\" value=\"0\" />\r\n<param name=\"Loop\" value=\"-1\" />\r\n<param name=\"Quality\" value=\"High\" />\r\n<param name=\"SAlign\" value=\"LT\" />\r\n<param name=\"Menu\" value=\"-1\" />\r\n<param name=\"Base\" value=\"\" />\r\n<param name=\"AllowScriptAccess\" value=\"always\" />\r\n<param name=\"Scale\" value=\"NoScale\" />\r\n<param name=\"DeviceFont\" value=\"0\" />\r\n<param name=\"EmbedMovie\" value=\"0\" />\r\n<param name=\"BGColor\" value=\"FFFFFF\" />\r\n<param name=\"SWRemote\" value=\"\" />\r\n<param name=\"MovieData\" value=\"\" />\r\n<param name=\"SeamlessTabbing\" value=\"1\" />\r\n<param name=\"Profile\" value=\"0\" />\r\n<param name=\"ProfileAddress\" value=\"\" />\r\n<param name=\"ProfilePort\" value=\"0\" />\r\n<param name=\"AllowNetworking\" value=\"all\" />\r\n<param name=\"AllowFullScreen\" value=\"true\" /></object></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"著名作家史铁生今日凌晨突发脑溢血逝世\" src=\"http://img1.cache.netease.com/cnews/2010/12/31/20101231084643005ab.jpg\" /><br />\r\n史铁生 资料图</p>\r\n<p>新华网北京12月31日电（记者廖翊）著名作家史铁生未能走过2010年的最后一天。12月31日凌晨3时，59岁的史铁生因脑溢血在北京宣武医院去世。</p>\r\n<p>&ldquo;铁生昨天下午6点多从医院做完透析回家后，感到头疼、恶心，并呕吐，后一直昏迷，被急救车送往医院。他再也没有醒过来。&rdquo;北京市作家协会秘书长王升山向新华社记者叙述。</p>\r\n<p>王升山介绍，根据史铁生生前遗愿，他的脊椎、大脑将捐给医学研究；他的肝脏将捐给有需要的患者。</p>\r\n<p>史铁生1951年生于北京，年轻时双腿瘫痪，后来患肾病并发展到尿毒症，一直靠透析维持生命，自称&ldquo;职业是生病，业余在写作&rdquo;。&ldquo;文革&rdquo;期间，史铁生下放陕北，1979年发表第一篇小说《法学教授及其夫人》。成名作是《我的遥远的清平湾》，获1983年全国优秀短篇小说奖。小说《老屋小记》获首届鲁迅文学奖。2002年，他获得华语文学传媒大奖年度杰出成就奖。其著名散文《我与地坛》影响最大，感动了无数读者。史铁生在电影创作上成绩丰硕，所创作的电影剧本《多梦时节》《死神与少女》等充满诗意，为电影类型的发展作出了贡献，并在国内外获奖。</p>\r\n<p>&ldquo;先生的影响太深了，从来没想过先生会走。地坛里玩耍的那个孩子，回去了！&rdquo;&ldquo;史先生走了，但他对生命意义的思考已经成为一笔非常重要的社会财富永远留了下来。&rdquo; 读者第一时间在网上留言表达纪念。</p>\r\n<p><strong>史铁生简介</strong></p>\r\n<p>史铁生，男，汉族，1951年生于北京。1969年赴延安插队，1972年双腿瘫痪回到北京。1974年始在某街道工厂做工，七年后因病情加重回家疗养。</p>\r\n<p>1979年开始发表文学作品。著有中短篇小说集《我的遥远的清平湾》、《礼拜日》、《命若琴弦》、《往事等；散文随笔集《自言自语》、《我与地坛》、《病隙碎笔》等；长篇小说《务虚笔记》以及《史铁生作品集》。曾先后获全国优秀短篇小说奖、鲁迅文学奖，以及多种全国文学刊物奖。一些作品被译成英、法、日等文字，单篇或结集在海外出版。</p>\r\n<p><!--[4,175,19] published at 2010-12-27 08:48:43 from #202 by 261--></p>\r\n<p>2002年，史铁生荣获华语文学传播大奖年度杰出成就奖，同年，《病隙碎笔》(之六)获首届&ldquo;老舍散文奖&rdquo;一等奖。</p>\r\n<p><strong>名家评价</strong></p>\r\n<p>我们从史铁生的文字里看得到一个人内心无一日止息的起伏， 时也在这个人内心的起伏中解读了宁静。――蒋子丹</p>\r\n<p>在红卫兵一代中，史铁生也许是极少数能够超越自身，具有现代意识的作家。――许纪霖</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('59', '<p class=\"f_center\" style=\"text-align: center\"><img alt=\"政府网站政风满意率调查公示被曝藏猫腻\" src=\"http://img1.cache.netease.com/catchpic/0/06/06A6306C43003CD50A01C4F1F8F2F04D.jpg\" /></p>\r\n<p class=\"f_center\">这个公式（圈内），受到网友质疑。 网页截图</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"政府网站政风满意率调查公示被曝藏猫腻\" src=\"http://img1.cache.netease.com/catchpic/E/EF/EFD1D25C0FDA8B54774300D3E991E529.jpg\" /></p>\r\n<p class=\"f_center\">垫江政府网被指更新太慢 网页截图</p>\r\n<p><founder></founder></p>\r\n<p>一个挂在开县政风行风投票评议网的公式：满意率=(非常满意&times;100%+满意&times;90%+基本满意&times;70%+不满意&times;50%)&divide;得票总数&times;100%。</p>\r\n<p>网友认为这个公式暗藏玄机：如100名群众给受评的部门、公用企业单位投票时，如非常满意、满意、基本满意都是0票，不满意得票100票，那按公式计算为：满意率=(0&times;100%+0&times;90%+0&times;70%+100&times;50%)&divide;100&times;100%，即群众满意率为50%。</p>\r\n<p>这个公式在网上已挂了14天。昨天，本报记者就此采访开县纪委，得到的回应是：网络公司搞错了。随后，该县对该公式作了更改。</p>\r\n<p><strong>网曝年终考核有猫腻</strong></p>\r\n<p>1月1日，网友&ldquo;虎猫&rdquo;在大渝网上发帖称，开县纪委对该县各部门的年终考核有猫腻。</p>\r\n<p>&ldquo;虎猫&rdquo;所说的&ldquo;猫腻&rdquo;，藏于一个计算公式中。他称，开县纪委请广大群众对各部门、公用企业单位的服务投票，选项有非常满意、满意、基本满意、不满意四项。计算群众满意率的公式为：满意率=(非常满意&times;100%+满意&times;90%+基本满意&times;70%+不满意&times;50%)&divide;得票总数&times;100%。</p>\r\n<p>&ldquo;虎猫&rdquo;说，如果一个部门有100票不满意，非常满意、满意、基本满意都是0票，按该公式计算，该单位群众的满意率为50%，不满意率为50%。</p>\r\n<p>明明是100%的不满意，咋变成50%的不满意？&ldquo;虎猫&rdquo;质疑：这样的计算，如何能反映社情民意？</p>\r\n<p><strong>调查</strong></p>\r\n<p><strong>满意率被公式提升</strong></p>\r\n<p>昨天中午11点过，记者登录开县政风行风投票评议网，发现该网确有&ldquo;虎猫&rdquo;所说的公式。</p>\r\n<p>该网请广大群众对197个部门、17个公用企业单位投票，评它们的服务质量。投票时间从2010年12月20日起，到2011年1月15日止。</p>\r\n<p>记者随机查看网上的投票情况，发现受评部门和企业的满意率经公式计算后，纷纷提升。该县环保局环境监测站的&ldquo;工作作风&rdquo;，非常满意、满意、基本满意均为0票，不满意9票，按公式计算，其满意率竟为50%；县发改委&ldquo;信息公开&rdquo;一项，非常满意76票，满意2票，基本满意2票，这三个选项相加共80票，而不满意85票。但按该公式计算，群众满意率超过70%。</p>\r\n<p><strong>回应</strong></p>\r\n<p><strong>网络公司搞错了</strong></p>\r\n<p>昨天中午约12点，记者联系上负责这次网上政风、行风投票评比的开县纪委常委、监察局副局长刘丰。刘丰称，该行评页面，是委托一家网络公司制作的，可能是网络公司出了错。</p>\r\n<p>刘丰随后让具体负责此事的县纪委监察局纠风室主任杨人萍与记者联系。杨人萍称，网络公司在制作时，将公式搞错了；制作出的页面，网络公司未交给他们审核，便挂在网上。</p>\r\n<p>广大群众已投了14天的票，这个公式也被悬挂于网上14天。有网友质疑，难道相关部门在14天里，都没能看出这个公式有错？杨人萍表示：&ldquo;确实存在工作上的疏忽。&rdquo;</p>\r\n<p><strong>出错不影响评比</strong></p>\r\n<p>有网友担心，这个公式恐让民意遭到&ldquo;暗算&rdquo;。对此，杨人萍表示，该公式不会影响评比结果。&ldquo;我县规定，我们是评分，而不是评满意率。&rdquo;杨人萍说：&ldquo;受评的部门和公用企业，如果评分达不到85分，将会受到处理。&rdquo;</p>\r\n<p>他还称，群众网评并不是此次行评的全部内容。行评总分值为100分，分为四项：群众网评得分，占总分值的20%；党代表、人大代表、政协委员评分，占总分值的20%；基层代表评分，占总分值的20%；部门和公用企业单位直接的服务对象评分，占总分值的40%。</p>\r\n<p>昨天下午，开县迅速将网上的计算公式作了更改。其为：测评得分=(非常满意&times;1+满意&times;0.9+基本满意&times;0.7+不满意&times;0.5)&divide;得票总数&times;100。</p>\r\n<p>记者&nbsp;聂超</p>\r\n<p><strong>相关新闻</strong></p>\r\n<p><strong>垫江政府网一栏目&nbsp;为何两年半没更新？</strong></p>\r\n<p>在元旦节前，有网友在天涯重庆论坛发帖，称垫江县人民政府网上的&ldquo;政府会议&rdquo;栏目，有近两年半没更新。</p>\r\n<p>发帖者在网上发了网页截图。截图显示，最后更新时间为2008年8月14日，内容为《十五届县政府第24次常务会议纪要》；该栏目的其余内容，上网时间均为2005年、2006年。</p>\r\n<p>&ldquo;垫江政府几年都没有开过会啦？&rdquo;有网友质疑。</p>\r\n<p>昨天，垫江县政府对此回应称，2008年之后，按上级要求，县政府常务会议纪要不再以这种方式公开。目前，该县政府网正准备取消该栏目。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('60', '<p class=\"f_center\" style=\"text-align: center\"><img id=\"{19784176-6C2D-4CF2-9341-7DC7A4D3317D}\" border=\"0\" hspace=\"0\" alt=\"黄山徽州区\" align=\"center\" src=\"http://img1.cache.netease.com/catchpic/7/79/7931444CE63DB1A06E34AEC5DC1AFCF5.jpg\" /><br />\r\n这是网络上对此次招聘事件的转载（1月1日摄）</p>\r\n<p>新华网合肥1月3日电&nbsp; 在网络上引起热议的安徽黄山徽州区招聘事件有了最新进展。徽州区招聘工作领导组负责人3日对新华社&ldquo;中国网事&rdquo;记者表示，除了原定于1月3日进行的面试已经在2日公告取消外，此次事业单位招聘方案目前也已经全部终止。徽州区将积极主动按照最新公布的《安徽省事业单位公开招聘人员暂行办法》要求，完善招聘工作，重新组织实施。</p>\r\n<p>12月24日，安徽省黄山市当地一论坛上，网名为&ldquo;徽州人&rdquo;的一名网友发帖称，黄山市徽州区事业单位招聘为领导子女专设，引起了网民热议。</p>\r\n<p>针对网民的批评和质疑，徽州区人社局局长胡志成在接受&ldquo;中国网事&rdquo;记者采访时否认了&ldquo;因人设岗&rdquo;的说法。他说，此次招聘户籍限定是因为山区乡镇工作条件差，工资待遇低，过去就出现过外地人应聘后很短时间就辞职的现象，而招收本区户籍的人员更具有稳定性，能更安心地开展工作。同时，大专以上学历就可以满足工作需要。</p>\r\n<p>全程参与此次招聘监督的徽州区监察局副局长洪光武3日也告诉记者，制卷、监考、阅卷等各个环节都严格按照国家事业单位人员招聘有关政策执行，并在纪检监察部门的监督下进行。由于试题较难，考生分数普遍偏低，但这并不能说明招聘的考生知识少、素质低、能力差。</p>\r\n<p>2011年1月2日，黄山市徽州区人力资源和社会保障局发布《公告》，取消了原定于1月3日进行的此次事业单位招聘工作人员的面试工作，表示尽快按照《暂行办法》要求进一步完善招聘工作。</p>\r\n<p>记者了解到，徽州区发布、实施《关于公开招聘事业单位工作人员的通知》是在2010年12月20日。在实施过程中，安徽省委组织部、省人力资源和社会保障厅出台《安徽省事业单位公开招聘人员暂行办法》（简称《暂行办法》），并于2010年12月29日在安徽省人力资源和社会保障厅网站全文公布。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('61', '<p class=\"f_center\" style=\"text-align: center\"><img alt=\"屠宰场视频曝生猪注水 被拍方称遭诬陷\" src=\"http://img1.cache.netease.com/catchpic/E/E5/E5D5CF6AF9508A768B5F6C91D7DCF534.jpg\" /></p>\r\n<p class=\"f_center\">被打伤的看门人马福贵 记者 冀强 摄</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"屠宰场视频曝生猪注水 被拍方称遭诬陷\" src=\"http://img1.cache.netease.com/catchpic/8/8C/8C12FB783ED8DE962CDFD1EDF585D47D.jpg\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"屠宰场视频曝生猪注水 被拍方称遭诬陷\" src=\"http://img1.cache.netease.com/catchpic/7/76/768D8619887D62F856C62FC0653ED953.jpg\" /></p>\r\n<p>\r\n<script language=\"javascript\" type=\"text/javascript\">\r\n								if(picResCount>0){\r\n									document.getElementById(\"picres\").style.display=\"block\";\r\n									document.write(\"</p><p>\");\r\n								}\r\n 			 				</script>\r\n</p>\r\n<p><founder></founder></p>\r\n<p>日前，记者收到了淄博一市民送来的屠宰场&ldquo;注水肉&rdquo;视频。据视频提供者杨先生介绍，这是在淄博市高青县一家生猪定点屠宰场强行拍摄的，内容是该屠宰场涉嫌制作注水猪肉。在两段时长总计达9分钟的<a href=\"http://v.163.com/\"><font color=\"#1e50a2\">视频</font></a>中，一根塑料水管被人粗暴的插入生猪嘴中，水不停地从猪嘴里溢出&hellip;山东商报&nbsp;记者&nbsp;冀强&nbsp;山东新闻网&nbsp;记者&nbsp;高太明&nbsp;联动报道</p>\r\n<p><strong>神秘视频曝光</strong></p>\r\n<p><strong>活猪注水场面</strong></p>\r\n<p>根据视频内容，记者日前来到了淄博高青县实地调查采访，却听到了多种不同的声音：被拍视频的厂家说是被人&ldquo;诬陷&rdquo;了，当地主管部门称拍摄者是&ldquo;自导自演&rdquo;，警方则表示视频拍摄者属&ldquo;团伙犯罪&rdquo;，目前已有两人被刑拘。</p>\r\n<p><strong>神秘视频曝光</strong></p>\r\n<p><strong>活猪注水场面</strong></p>\r\n<p>&ldquo;这可能是最震撼的注水肉视频了，他们注水的过程，被我们抓了个现形。&rdquo;把视频交给记者时，淄博市民杨先生神秘地对记者说。</p>\r\n<p>在第一段长达3分多钟的视频中，先是有几名工人在猪圈里忙碌，几头猪被吊在绳子上。也许是发现有人拍摄，工人们迅速将被吊起的猪放下，纷纷离开。随后，镜头转向地面，一根根散落在地上的塑料水管正在冒水。在猪圈的一角，两个塑料瓶被拍入镜头，视频中传出一个声音：&ldquo;这是药&rdquo;。</p>\r\n<p>另一段长达6分钟的视频画面比较凌乱，嘈杂的声音中，一头猪被铁钩勾住嘴，往上呈45度角吊着。随着镜头的推进，另几头被吊着的活猪出现在画面中，有人往其中一头猪嘴里插进一根塑料水管，水不停地从猪嘴里流出。视频的最后显示，屠宰场几名工作人员被手持长棍的人控制在室外，他们蹲在地上，被人用手电照着逐个辨认，其中一人被称为&ldquo;老板&rdquo;。</p>\r\n<p>视频提供者杨先生介绍说，自己也是在高青县做生猪屠宰生意的，这两段视频是在当地另一家企业&mdash;&mdash;腾达定点屠宰场拍摄的。&ldquo;他们好几年来一直做这种黑心生意，低价往外批发猪肉，把我们挤兑的没有办法。无奈之下，我们才出此下策，2010年12月17日凌晨强行翻墙进入腾达场内拍摄的，希望能够惩治他们。&rdquo;</p>\r\n<p><strong>B</strong></p>\r\n<p><strong>被拍摄方称</strong></p>\r\n<p><strong>&ldquo;遭人诬陷&rdquo;</strong></p>\r\n<p>&ldquo;三年来，我们就没做过一次这种缺德事！我们纯属被人诬陷。&rdquo;在淄博高青县腾达定点屠宰场，负责人孙增双手抱在胸前，气呼呼地说。</p>\r\n<p>据孙增介绍，他就是事发当晚出现在视频中的那名&ldquo;老板&rdquo;。&ldquo;当时我正在被窝里睡觉呢，有人破门而入，把我从被窝里拎出来了。&rdquo;孙增介绍说，被几个人架到屠宰车间时，他才发现自己的工人都被控制了。&ldquo;来的人气势汹汹，带着棍棒砍刀，大约有二三十口人吧。&rdquo;等那些人全部撤出厂区后，才打电话报了警。</p>\r\n<p>在高青县医院，记者见到了最早听到狗叫外出查看的看门人马福贵，他指着被缝了八针、诊断为颧骨粉碎性骨折的面部告诉记者：&ldquo;在北墙外我遇到两名年轻人，他们自称是&lsquo;逮兔子的&rsquo;，话刚说完，我就被他们用棍子重重的打倒在地上了。&rdquo;</p>\r\n<p>&ldquo;我们清楚是谁闯入厂区来拍摄视频。&rdquo;孙增介绍说，当晚翻墙、砸开门锁后强闯厂区的是另一家名为湾头的生猪屠宰场的老板和工人。&ldquo;因为同行，我们存在竞争关系。几年来他们一直竞争不过我们，提出和我们合并工厂也被拒绝，所以才想出这个损招来诬陷我们。&rdquo;</p>\r\n<p><strong>主管部门称视频是&ldquo;自导自演&rdquo;</strong></p>\r\n<p>&ldquo;任何一个对屠宰行业有了解的人看了视频后，都会觉得这是拍摄者自导自演。&rdquo;对于注水肉视频一事，当地生猪定点屠宰领导小组的牵头单位&mdash;&mdash;高青县财委负责人这样表示。</p>\r\n<p>记者从高青县畜牧兽医局获悉，目前高青县只有两家定点屠宰场，一家是腾达屠宰场，另一家是湾头屠宰场。按照高青县财委的说法，在这段视频曝光当天上午，他们就紧急约见了腾达和湾头两家屠宰企业的相关负责人。</p>\r\n<p>&ldquo;我们对这件事也很重视，毕竟关乎全县的猪肉食品安全。&rdquo;高青县财委表示，根据对视频的分析和双方负责人的交代以及相关证据，他们认为这段视频不是现场的真实拍摄，而是一段自导自演的视频。</p>\r\n<p>&ldquo;腾达现在占据了高青县90%以上的生猪屠宰市场，三年来共屠宰生猪14万头，从未出现过任何食品安全事故，也从未有过消费者或猪肉经营户针对该场的投诉现象，在业界有着不错的口碑。如果有问题的话，早就被发现了。&rdquo;高青县财委介绍说：&ldquo;反观湾头，因为诸多原因，他们的生意一直一般。再加上我们通过视频掌握的一些证据，我们认为这段视频是因为湾头正面竞争不过腾达，而采取的一种极端手段。&rdquo;</p>\r\n<p>高青县生猪定点屠宰指挥小组有关负责人告诉记者，视频曝光后，他们在全县展开了检查，并未发现有注水肉流入市场，视频中出现的几头&ldquo;灌水猪&rdquo;已经被无公害处理。</p>\r\n<p><strong>警方称部分拍摄者已被刑拘</strong></p>\r\n<p>记者了解到，目前高青县公安局已经对此案立案侦查。一名姓冯的副局长在接受本报记者采访时表示，视频拍摄者强行闯入腾达场内，并打伤员工的行为属于&ldquo;团伙犯罪&rdquo;，目前已经刑拘了两名当晚在外&ldquo;把风&rdquo;的犯罪嫌疑人，因此案正在侦破，具体情节并不方便透露。</p>\r\n<p>而对于视频的中&ldquo;注水&rdquo;的真伪，警方表示犯罪嫌疑人还未全部归案，视频的真伪还不能最终确定。</p>\r\n<p><strong>当地派人入场督查</strong></p>\r\n<p><strong>确保猪肉安全供应</strong></p>\r\n<p><strong>E</strong></p>\r\n<p>在视频曝光后，高清县委县政府在2010年12月17日晚连夜召开了会议，专题研究注水肉问题。由于暂时无法排除嫌疑，腾达屠宰场已经被责令&ldquo;一边生产，一边整改&rdquo;。</p>\r\n<p>记者了解到，当晚会议决定在未查清事实之前，当地主管部门加强对生猪市场的监督检查力度，在腾达、湾头两家屠宰企业各安排两名监督检疫人员，从晚八点至次日凌晨五点进行全程督查。同时，还要求两家企业晚上不允许关闭大门，以便随时接受检查。既保证当地的猪肉不断档供应，又保障大家吃上放心肉。</p>\r\n<p><strong>两厂家互指对方</strong></p>\r\n<p><strong>不正当竞争</strong></p>\r\n<p>采访中记者了解到，腾达和湾头两家生猪定点屠宰场除了在生意上互不相让以外，也在嘴皮子上打起了官司，互相指责对方不正当竞争。</p>\r\n<p>此前在将视频提供给记者时，杨先生曾对记者表示，之所以采取&ldquo;不场面&rdquo;的办法拍摄这段视频，主要是因为&ldquo;被逼的&rdquo;。杨先生对记者说，自己的几个亲戚2007年10月份开始经营湾头定点屠宰场。刚起步时效益还可以，但是因为腾达长年来生产了大量的注水猪肉，并且通过社会上的一些势力控制当地肉市，所以给当地的猪肉市场造成了严重冲击。杨先生说，很多人都去当地的相关部门反映过，但是都没有足够的证据来证明&ldquo;腾达所生产的就是注水肉&rdquo;。杨先生介绍说：&ldquo;目前来说，正常的毛猪价格一般在6.7元/斤-6.8元/斤左右，要是除去猪下货、猪皮等杂物，猪肉批发价格一般要在每斤8.8元左右才能看到利润。但现在腾达的肉批发价格却是7.5元/斤，照这个价格别说是保本了，他们厂每斤要赔1.5元左右，铁定是注水了。&rdquo;</p>\r\n<p>在采访中，腾达的负责人孙增则告诉记者，湾头方面杨先生的说法根本就是颠倒黑白。&ldquo;真正用社会闲杂人员扰乱市场的是他们，正面竞争不过我们，湾头两年前就开始出损招。&rdquo;孙增表示，目前腾达方面的猪肉出场价一般在每斤8.8元左右，走的是薄利多销的路子。&ldquo;虽然单头猪的利润不高，但每天我们能宰杀近百头猪，总利润还是比较可观的。&rdquo;</p>\r\n<p>为了验证腾达方面的说法，记者随后多次拨打湾头定点屠宰场相关人员的电话，但均无人接听。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('62', '<p><strong>作者：</strong><span style=\"font-weight: bold\">郑渝川</span></p>\r\n<p>历时一年程序，深圳市第二次保障性住房终审结果在2010年12月31日开始公示，相应名单悄然出现在深圳市住建局官网，有5293户过关、1092户被剔除。</p>\r\n<p>此次公示时间为2010年12月31日至今年1月14日，将节假日算在公示&ldquo;15个工作日&rdquo;的范畴，受到普遍怀疑和批评。记者调查发现，此次最终公示的内容里，并没有通过者的财产和收入信息；许多街道办因为元旦放假，也未挂出辖区终审结果。深圳市住宅售房管理服务中心主要官员，拒绝对采访记者解释相关问题。</p>\r\n<p>深圳市民、网民还提出了其他质疑：涉嫌违反计划生育政策的申请户获批，家住豪宅跨区、跨街道申请保障房的申请户大量存在，已住保障房的二次申请，等等。（1月2日《深圳晚报》）</p>\r\n<p>2010年3月下旬、10月下旬，深圳市第二次保障性住房初审、复审名单的公示，均引发强烈质疑。由于网民不懈穷追、媒体给力调查，&ldquo;豪宅门&rdquo;、&ldquo;豪车门&rdquo;、&ldquo;零资产&rdquo;、&ldquo;公务员&lsquo;假冒&rsquo;临时工&rdquo;等真相现世，已经严重削弱了深圳保障性住房分配的公信力，相关主管部门和一些街道、社区机构对疑难问题的解答，更是沦为坊间笑谈。</p>\r\n<p>从2010年最后一天晚上&ldquo;秘密&rdquo;挂上官网、以凑满15个公示日的终审结果来看，初审、复审过程中暴露出的许多程序性问题，并未能得到对应的完善解决&mdash;&mdash;市民质疑的违反计划生育政策申请户、豪宅申请户、已享受保障房的申请户二次申请等情况，是在该名单复审时就已经被媒体曝光过的问题。时隔两月，深圳市住建局、深圳市住宅售房管理服务中心对这些问题不作有效性释疑，也不予更正，显然是对民意和媒体监督的蔑视。</p>\r\n<p>更离谱的是，初审、复审名单中，由于申请户财产和收入信息受到普遍怀疑，不少&ldquo;零资产&rdquo;家庭事后被证明所言不实，此番终审名单中居然就不再公开这方面信息。深圳市住宅售房管理服务中心主要官员拒绝对此问题作出回答，或不接记者采访电话的做法，都在一步步坐实外界的忧虑和猜测。这难道不是心虚的表现？</p>\r\n<p>2010年7月开始实施的《深圳市保障性住房条例》，第九章&ldquo;法律责任&rdquo;中有多个条款对骗购、骗租保障性住房行为进行了界定，并明确要求将其纳入不良行为记载，向社会公开。此番终审名单公布，相关公告却不披露被剔除的1092户违反保障性住房政策的具体做法，以及主管部门依照《条例》给予的处罚，这岂不是自己立法、并且自己带头违法？</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('63', '<p>&nbsp;&nbsp;&nbsp; 2010年，不少政府部门在公共决策之前开始征集民意。上周，中国青年报社会调查中心对1655人进行的一项调查显示：84.5%的人首选&ldquo;存在走过场现象&rdquo;，其次是&ldquo;有的征集缺乏对公众的及时反馈&rdquo;(70.3%)，&ldquo;民意征集与政策制定脱节&rdquo;排在第三位(69.8%)。63.7%的人认为部分民意征集&ldquo;随意性大，缺乏统计和分析&rdquo;。（12月29日《中国青年报》）<br />\r\n<br />\r\n　　公共政策与公众利益休戚相关，征集民意、倾听民生是公共决策的必备环节。今年以来，车船税立法、拆迁条例修改、北京治理交通拥堵等民意征集活动，引起了公众的广泛关注和参与。无论是保障决策的科学性与民主性，还是回应高涨的公民意识，民调都当越来越给力、其权重也当越来越加量。<br />\r\n<br />\r\n　　遗憾的是，尽管民调的舞台是搭起来了，但&ldquo;演出流程&rdquo;远远未曾到位，有的是扯两嗓子虚与委蛇，有的是架起喇叭大搞&ldquo;假唱&rdquo;&hellip;&hellip;不仅让民调沦为形式主义的&ldquo;新代言&rdquo;，反而消弭了政府公信力。有几个核心问题越来越成为困扰民调质地的关键：一是逻辑上的正当性，现在的民调，往往是职能部门自己设置议题，然后自己再去调研，再然后自己公布结果，最后还是自己拿出决策&mdash;&mdash;&ldquo;一人操刀&rdquo;的民调、尤其是很可能出现&ldquo;不同声音&rdquo;的民调，如何保证其客观性与真实性？譬如吉林省永吉县人民政府网所做的一项关于&ldquo;满意度&rdquo;的民意调查中，就只有两个选项&mdash;&mdash;&ldquo;满意&rdquo;或者&ldquo;非常满意&rdquo;；二是操作上的科学性，民调越来越多，但是专业性堪忧，样卷设计、抽样方式、数理分析、意见权重分配等，对结果都起着至关重要的作用，粗放型的民调操作不仅不能有效汲取民间智慧，很可能在议题上横生出很多枝节、折损民调的效率，没有严谨而专业的民调设计，就不会有精确而有效的民调结果；三是民调要有宽泛的适用度，不能在制度设计基本完成之后，更不能成为试探民意的幌子，而应该贯穿公共决策的每个环节和整个过程，因为政策的稳定性是相对的，成熟的民意可以随时为失衡的政策校准。<br />\r\n<br />\r\n　　谁也不能臆断公共政策的民调就是&ldquo;走过场&rdquo;而已，但类似&ldquo;逢听必涨&rdquo;听证会般的民调，在现实生活中也是屡见不鲜。要让&ldquo;被走过场&rdquo;的民调硬气起来，关键还得在程序的公正与透明上下功夫：一方面，我们可以借鉴美国《纽约时报》社会调查中心、芝加哥大学全国民意研究中心、非营利组织皮尤(PEW)研究中心和商业性的盖洛普公司等，由政府委托独立第三方机构征集民意、解读民意；另一方面，决策需要对征集过来的民意有更透明、更细致的回应，呵护公民参与民调的热情与信心，即便是反对的声音，也当分清比重，予以说明。<br />\r\n<br />\r\n　　民调是现代公共治理的一个&ldquo;小锦囊&rdquo;，只有让有理有利有节的民调硬气起来，公民的民主参与才会与公共政策良性互动，公共利益才能在看得见的博弈中走向最大化。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('64', '<p><strong>作者：</strong><span style=\"font-weight: bold\">王石川</span></p>\r\n<p>12月27日，湖南省衡阳市衡南县松江镇一辆送小学生上学的三轮车坠河。据该县党政门户网站发布的事故通告，截至当晚6时30分许，事故共造成14名小学生死亡，6人受伤。事故车辆司机已被公安机关控制。（12月28日《羊城晚报》）</p>\r\n<p>每个公民的非正常死亡都让人黯然，而小学生的殒亡则尤其让人叹惜，短暂的人生画卷尚未铺开，便已戛然而止，留给家人的又将是多么撕心裂肺的挣扎与痛切。12&middot;27校车事故的真相有待调查，但不能不关注我们的校车安全。</p>\r\n<p>此起校车坠河事件早已埋下了伏笔。其实，所谓的校车，就是一辆农用三轮车而已，只能乘坐七八个人，却被塞进了20名学生；而且，车子改装后车厢外加了门栓，车辆行驶时一般是从外面拴着的，所以坠河后孩子无法逃生自救。还有一处细节不能不提，发生事故的车是由家长自己联系的，学校并没有配备校车。学校为何不配备校车而由家长凑钱雇车？这也许牵扯到很多层面的问题，但显然与教育投入不足有关。</p>\r\n<p>今年7月1日起，我国首部专门规范小学生校车安全的强制性国家标准《专用小学生校车安全技术条件》就已实施。该国标可圈可点，比如规定，学生座位必装安全带，还要装有类似飞机&ldquo;黑匣子&rdquo;的汽车行驶记录仪等等。在这种语境中，为何仍有大量不合格校车？</p>\r\n<p>央视主持人白岩松说他很羡慕美国到处都有黄色的校车：其一，政府出钱养校车；其二，校车要求是最安全的。很多年前美国也发生过桥梁垮塌事件，在交通高峰期塌的，60多辆车掉下去，死伤无数，其中有一辆黄色的校车，只轻伤了几个孩子，没有一人死亡，因为校车太结实了；其三，校车令行禁止，校车停下来时，会弹出一个STOP的牌子，两个方向马路上的汽车必须在25米外全部停下，什么时候孩子全下完了，司机把STOP的牌子收起来了，两边的车才可以通行，谁如果违反了规则，或者敢去超车，将被法律严惩。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('65', '<p>&ldquo;2010年度汉字盘点&rdquo;评选正在进行中，目前&ldquo;涨&rdquo;遥遥领先，超过半数。这不是偶然的，因为&ldquo;面粉涨价了，汽油涨价了，羽绒服涨价了&hellip;&hellip;除了工资，身边的一切几乎都涨价了&rdquo;，面对这样的形势，靠工薪或做点小买卖为生的普通老百姓该如何应对？有人开出了药方&mdash;&mdash;&ldquo;以勤奋工作赶超物价涨幅&rdquo;（12月 27日《工人日报》）。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 这个药方让人感到哭笑不得，因为这简直是等于在对溺水者说，你要靠自己的努力挣扎来确保自己免于被淹死，虽然笔者并不愿意揣测别人的动机，但还是从这张药方当中，嗅出了一点站着说话不腰疼的味道。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 普通老百姓靠勤奋工作，无论如何是追不上物价涨幅的。原因很简单，目前的通货膨胀，主要是由两个原因造成的：一是货币投放量过多，对普通老百姓来说，其面临的问题就如同面对漫过堤坝的洪水一样，除非能够抓到一块木板或者救生圈什么的，否则的话再&ldquo;勤奋&rdquo;的扑腾都无济于事；二是贫富差距太大，既得利益阶层手里掌握着大量剩余资金，也就是热钱。这些热钱由于规模特别巨大，所以完全可以操控任何一种商品的价格，用来炒房，则把全民都变成了房奴；用来炒&ldquo;蒜&rdquo;，则&ldquo;蒜你狠&rdquo;，用来炒姜，则&ldquo;姜你军&rdquo;&hellip;&hellip;价格动辄几倍地往上涨。面对这样的滔天巨浪，普通老百姓毫无博弈能力。&ldquo;勤奋工作&rdquo;有什么用呢？什么用也没有。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; &ldquo;以勤奋工作赶超物价涨幅&rdquo;的论调，其实还暗含了对大部分普通民众的蔑视和讽刺：似乎他们是一群不愿意勤奋工作，只知道抱怨的人。但事实上，那些无力应对物价上涨的人&mdash;&mdash;无论是起早贪黑的小商小贩，还是拖着&ldquo;亚健康&rdquo;的身体，生活在&ldquo;过劳死&rdquo;阴影下的一般白领&mdash;&mdash;都是我们这个社会最勤奋的阶层，游手好闲的恰恰是无须担心通胀的既得利益阶层。&ldquo;以勤奋工作赶超物价涨幅&rdquo;的论调，在客观上还把通胀所带来的民生问题，推到了通胀的受害者头上，似乎他们的一切苦难，都是他们不愿意&ldquo;勤奋工作&rdquo;造成的，强词夺理，莫此为甚！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 通胀问题根本上是一个宏观经济政策问题，因此也应该通过政府的宏观调控来解决，各国皆然，从来没有哪个国家是靠号召民众通过&ldquo;勤奋工作&rdquo;来应对通胀的。就中国目前的具体情况而言，我认为应该尽快推出保值储蓄以稳定人心，打消民众的通胀预期，同时收紧货币，防堵热钱，严厉打击哄抬物价的投机行为，对低收入民众给予物价补贴，如此才能够有效遏制通胀，同时把通胀对一般民众生活的不利影响，降至最低。而只要人民能够安居乐业，免除了后顾之忧，则 &ldquo;勤奋工作&rdquo;也就是自然而然的事了。<br />\r\n&nbsp;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('66', '<p>12月15日中国社科院公布的《2011年中国社会形势分析与预测》蓝皮书，警示伪城市化牺牲农民利益。<br />\r\n<br />\r\n　　城市化的标志是缩小城乡剪刀差、提高全体国民尤其是低收入阶层的生活质量，而不是以拥有农村或者城市户籍为标志，不是以是否住上楼房为标志。<br />\r\n<br />\r\n　　目前新一轮城市化中，农民上楼运动方兴未艾，对此我们应该保持足够的警惕。土地作为目前中国增值最快的资产品，地方政府有足够的动力将农民土地转为国有，在商品化开发之后谋求暴利。<br />\r\n<br />\r\n　　第一轮对农民的土地剥夺催肥了地方财政。据中共中央党校研究室副主任周天勇先生的估算，改革开放以来，通过低价征用制度，从农民手中转移的利益大约有15万亿人民币，而卖地补偿给农民的不到其中的5%。<br />\r\n<br />\r\n　　许多农民因征地而致贫，形成4000万失地、失保和失业农民。鉴于第一轮征地潮对农民的大规模剥夺，我们必须警惕正在紧锣密鼓推进的第二轮征地潮，以城市化为名再行剥夺农民之实。<br />\r\n<br />\r\n　　目前一些地方推进的农民上楼运动，保障农民利益主要体现在让农民拥有农业公司股权、获得城市最低保障等。农民成为市民，在城乡区别大的地区是天大的恩赐，但所有这些保障背后的实质是，农民肯定无法享受到土地作为资产品溢价的权利，转而拥有从土地转换来的公司股权、分红权，鉴于土地溢价远远高于入股公司的分红，公司前景莫测，农民对于公司的管理权与建言权存疑，农民土地折股效果很难说一定能成功。<br />\r\n<br />\r\n　　也有成功的例子，今年玛纳斯县乐土驿镇周家庄村&ldquo;乐源&rdquo;农业专业合作社给农民按股权比例分红，各利益群体相安无事，因为在当地不存在城市化过程中土地溢价的前提，农民乐意入股合作社换取分红权。但在城市郊区、矿产与林业等资源较为丰富的地区，连公务员都将自己的户口迁回农村寻求厚利，农民不能获得土地与资源溢价，尖锐的利益冲突此起彼伏。<br />\r\n<br />\r\n　　如江苏省宜兴市官林镇政府征用2800亩农地空置五年，对失地农民又不做合理补偿，当地部分农民生计所迫，2008年2月22日开始在被地方政府强行征用的土地上复耕，这些被征用的土地主要建度假村、高尔夫球场、豪华别墅，本身是国务院明令禁止的。而江苏常州北港街道邹家村委江墅村农民，不满政府&ldquo;先用后征&rdquo;的违规征用土地，也没有按照法律法规给予失地农民补偿，于2008年2月29日发生冲突。一连串的事件，说明在圈地过程中存在着&ldquo;土地吃人&rdquo;的现实。<br />\r\n<br />\r\n　　据中央农村工作领导小组副组长、办公室主任陈锡文的估计，2006年以来，中国新增的数千万城镇人口中，真正转为城市居民的农民工可谓凤毛麟角。一些地方政府以统筹城乡发展或新农村建设的名义，在农民的承包地和宅基地上打主意，意图通过村庄撤并、擅自扩大城乡建设用地增减挂钩的范围等，侵害农民的土地权利。<br />\r\n<br />\r\n　　城市化过程如果不幸沦落为新圈地运动，有可能造成城市赤贫阶层，向城市输送源源不断的无消费能力与专门技术的低端产业工人。健康的城市化过程，会在土地流转与工业化的过程中，通过土地财富的再分配，造就一批拥有基本消费能力的中产收入阶层。当农民得到土地权证，并且这份权证足以让他们以中产阶层的身份进入工业化时代，当有领导人敦促农民不要轻易出售土地证以获得最丰厚的土地溢价时，这样的城市化进程才能培养中国最急需的中产阶层与中高端技术工人。<br />\r\n<br />\r\n　　中国目前紧锣密鼓的城市化进程，事实上是1949年之后的另一次土改。当年的土改是将土地分到农民手中，公社时期前后则是将土地集中国有化，现在的土改主要是将集体土地重新流入市场进行财富再分配。<br />\r\n<br />\r\n　　无论用何种方式，剥夺土地制造贫困阶层的办法都无助于中国的经济，无助于中国中产收入社会的壮大。无论怎么样的土改，必须有利于农民的利益，有利于工业化与城市化的进程，有利于财富为民所用。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('67', '<p><img alt=\"\" src=\"file:///C:/DOCUME~1/ADMINI~1/LOCALS~1/Temp/moz-screenshot.png\" /></p>\r\n<p>央行、证监会、银监会、保监会的2011年工作会议预计将在本月陆续召开，这些重磅会议将为2011年的金融监管工作定调，一系列市场高度关注的调 控动向即将浮出水面，例如：2011年货币信贷增长目标或将下调、积极促进市场化并购重组、结合巴塞尔协议  适度提高对大型银行的资本监管要求、加强保险业偿付能力监管并强化资本约束等等。未来两周左右有望出台一系列金融监管部署，为&ldquo;十二五&rdquo;开局之年保驾护 航。</p>\r\n<p><b>央行：或下调货币信贷目标</b></p>\r\n<p>按照往年惯例，央行工作会议可能将在元旦后率先举行。业内人士预计，央行工作会议将确定全年的货币、信贷增速目标。预计全年M2增速目标降至 16%，全年新增信贷目标可能较去年7.5万亿元左右的规模有所下降。此外，推动建立新的信贷管理体制、在&ldquo;十二五&rdquo;期间推动利率市场化改革也有可能成为 今年的工作内容。</p>\r\n<p>业内人士认为，今年央行的工作重点可能包括：落实好稳健的货币政策，综合运用多种货币政策工具，更多运用差别存款准备金率进行动态调整，配合利率、 存款准备金率、公开市场业务等常规性货币政策工具发挥作用；继续深化金融企业改革；加快金融市场产品创新，加快债券市场发展，丰富金融衍生产品；深化外汇 管理体制改革，促进贸易投资便利化，继续推动跨境贸易人民币结算工作，稳步推进资本项目开放和人民币国际化；防范信贷风险和系统性金融风险等。在人民币汇 率方面，业内人士预计，今年人民币升值幅度可能达到5%左右。</p>\r\n<p><b>证监会：积极促进市场化并购重组</b></p>\r\n<p>根据往年惯例，2011年全国证券期货监管工作会议预计将在本月召开。在2010年资本市场密集推进了<a target=\"_blank\" title=\"融资融券\" href=\"http://quotes.money.163.com/data/margintrade.html\">融资融券</a>、<a target=\"_blank\" title=\"股指期货\" href=\"http://money.163.com/special/002542K5/guzhiqihuo2010.html\">股指期货</a>、新股发行体制后续改革、严打内幕交易等一系列重大改革后，业内人士表示，监管部门将在2011年会议上部署新的工作重点，预计将从以下方面继续推进市场化进程。</p>\r\n<p>全面发挥市场功能。结合十二五规划，运用资本纽带引导和推动生产要素和社会资源向具有竞争力的新兴行业、高成长性企业集聚，积极培育战略性新兴产业 发展，促进创新型国家建设；积极促进市场化并购重组，加快存量资源的整合，通过资本市场平台促进产业结构优化和升级；进一步发挥资本市场在促进资本形成、 流转、集聚等方面的作用，不断提高资本市场服务经济社会发展全局的能力。</p>\r\n<p>大力完善市场体系和结构，增加市场的广度和深度。进一步完善多层次股票市场体系，逐步形成包括主板、中小企业板、<a href=\"http://money.163.com/chinext\">创业板</a>和场外市场在内、结构合理、功能健全、运行高效的市场体系；加快完善市场融资结构，大力发展<a href=\"http://quotes.money.163.com/0000923.html\">公司债</a>券市场，推进债券市场的互联互通，稳步提升债券融资在扩大直接融资中的功能和作用。其中也有可能包括市场高度关注的退市制度和新三板扩容等问题。</p>\r\n<p>深化改革创新，为推动市场稳定健康发展提供新动力。融资融券业务或在前三批试点的基础上，全面推开，转融通业务也可能适时推出；证监会此前表态将加强与有关部门沟通协商，探索境外企业在境内发行上市的制度安排，业内人士据此推测国际板的有关规则制度也有可能陆续亮相。</p>\r\n<p><b>银监会：或提高大银行资本监管要求</b></p>\r\n<p>按照往年惯例，中国银监会2011年工作会议将在未来两周左右召开。业内人士预计，今年的工作会议将会就坚决守住银行系统风险底线、巴塞尔协议 带来的<a href=\"http://hkquotes.money.163.com/html/001062.html\">新资本</a>监管要求的影响、严格执行房地产信贷政策等相关议题展开。</p>\r\n<p>日前银监会主席刘明康接受媒体采访时表示，未来考虑到逆周期资本管理需要以及大型银行的系统重要性特征，有必要适度提高对大型银行的资本监管要求。 在构建具有中国特色的全面风险监管框架过程中，银监会始终坚持&ldquo;统筹兼顾、因地制宜，有序实施&rdquo;的基本原则，对新增的动态资本、动态拨备、杠杆率、流动性 等四大监管工具，既要与国际金融监管改革的方向保持一致，又要坚持银监会成立以来所积累的有中国特色的实践经验，结合国情和中国银行业现状，对巴塞尔委员 会提出的各项标准进行认真测算和实证研究，为制定国内具体的资本监管制度做好准备工作。在此基础上，结合一些行之有效的简单、灵活的监管工具和结构性措 施，并充分听取国内银行对银行监管改革的意见。年底巴塞尔委员会公布资本监管改革最终方案后，银监会将适时出台我国商业银行资本监管的总体框架和路线图。</p>\r\n<p>此外，业内人士预计，今年银监会仍会高度关注房地产市场变化，要求商业银行严格执行有关信贷政策，加强对房地产贷款业务的监督管理和窗口指导；进一 步加强对地方融资平台贷款的清理工作；着力加强对重点领域和薄弱环节的支持，农业、小企业信贷投放增速高于全部贷款增速、信贷投放增量高于上年。</p>\r\n<p><b>保监会：强化资本约束仍是重点</b></p>\r\n<p>根据往年惯例，预计保险监管工作会议将于未来两周左右召开。分析人士指出，强化监管将成为今年保险监管的主基调，包括市场秩序、资本约束力以及高管 问责，监管利器将遍及保险公司每个经营管理细节。另据了解，保监会此前已向业内征求过意见的《保险公司次级定期债务管理办法》也有望届时出炉。</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>保监会主席吴定富在2010年12月28日召开的保险业情况通报会上指出，&ldquo;十二五&rdquo;期间，要使市场秩序从根本上得到治理和规范。这意 味着，今年保险业市场秩序的治理将成为重中之重。在财产险领域，打击虚假经营行为将作为规范市场秩序的重点；在寿险领域，将突出整治账外暗中支付手续费和 销售误导问题；在中介领域，将突出整治利用中介业务和中介渠道弄虚作假、非法套取资金等问题。</p>\r\n<p>在2010年为改善偿付能力状况，保险业共有46家公司增资331.7亿元，8家公司发行次级债225.5亿元。继续加强偿付能力监管，强化资本约束仍是2011年保监会的监管重点。</p>\r\n<p>&nbsp;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('68', '<p sizset=\"67\" sizcache=\"3\">北京晨报2011年1月4日报道 中央办公厅和国务院办公厅最近要出台有关公车配备使用的新规定，这个规定比过去更加严格，比如对省部级干部公车配备的标准排气量和购置税都比过去严格了，对党政机关和直属事业单位的公务用车的编制也比过去严格了。也就是说，公车配备的标准和公车的总数量是要下降的。</p>\r\n<p>记者认为，这意味着&ldquo;史上最严格&rdquo;的一轮公务车改革即将启动。</p>\r\n<p><strong>约束维修环节</strong></p>\r\n<p sizset=\"68\" sizcache=\"3\">在当前车改进行的过程中，一个值得关注的问题是公务车在维修环节出现的维修材料投标报价缺乏执行约束力、部分维修材料利润空间偏大等新漏洞。这反映出公车改革和监督应当贯穿公车使用全流程，避免公车维修成为唐僧肉。</p>\r\n<p><strong>环保车优先考虑</strong></p>\r\n<p>按照有关部门1999年出台的文件，高档公务车采购的上限是3.0升排量和45万元车价。但十几年过去，国内车价与文件出台时相比下降了很多，因此，高档公务车的采购上限价实际上有很大的下调空间。</p>\r\n<p sizset=\"69\" sizcache=\"3\">而结合当前节能减排的背景，降低排量、价格上限，增设油耗和排放标准的新门槛，对自主品牌小排量环保车型和新能源汽车在采购上予以优先考虑，这应当是新的公车采购标准调整的核心方向。</p>\r\n<p><strong>遏制特权车</strong></p>\r\n<p>公车改革的另外一大难点是如何遏制公务车成为特权车。新华社记者此前调查发现，近年来全国已有十多个省区市政府取消了拥有特权的&ldquo;O&rdquo;牌照，这无疑也是公车改革的应有之意。但是相关部门更要意识到，民用号段中的某些&ldquo;特权号段&rdquo;，更容易因为官商混用导致特权泛滥、失控和&ldquo;李鬼&rdquo;横行，下一阶段亟待有关部门严加监管。</p>\r\n<p><strong>-北京落点</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>公车指标不再增加</strong></p>\r\n<p sizset=\"70\" sizcache=\"3\">北京市治理交通拥堵综合措施明确提出，&ldquo;十二五&rdquo;期间，北京市各级党政机关、全额拨款事业单位不再增加公务用车指标。但是以网民和群众的呼声及本轮公务车改革的方向衡量，这应当只是北京市公车改革的&ldquo;最低标准&rdquo;。下一步，应当明确北京目前的公务车保有数量，并顺应全国公务车改革的大方向，继续降低北京市公车配备的标准和公车的总数量。目前，北京也在倡导百姓公交出行、低碳出行、绿色出行，并把公交出行率作为衡量城市交通状况健康与否的重要指标之一。作为北京的公务员，更有责任在公交出行上率先垂范。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('69', '<p><strong>千龙网1月4日报道</strong>&nbsp;国际油价维持在每桶91美元以上的高位，这似乎让中石化坚定了拒绝价格战的决心。昨天，记者从中石化北京石油分公司获悉，中石化旗下600多座加油站近期已全面叫停优惠促销活动，惟一保留的是自助加油站每升5分钱的优惠。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"中石化叫停加油优惠 民营93号油最高降0.68元\" src=\"http://img3.cache.netease.com/auto/2011/1/4/201101041013528db83.jpg\" /><br />\r\n&nbsp;</p>\r\n<p>去年，面对合资、民营和中石油加油站优惠促销此起彼伏的攻势，中石化中心城区加油站一度推出过限时优惠活动，但此后优惠范围逐步收缩，目前连远郊区县加油站长期实行的优惠促销也被叫停。</p>\r\n<p sizset=\"68\" sizcache=\"3\">中石化北京石油相关人员透露，自去年年初推出会员卡制后，公司的<a title=\"市场\" href=\"http://auto.163.com/news/\" target=\"_blank\"><font color=\"#1e50a2\">市场</font></a>战略就开始弱化价格竞争。目前，中石化所有加油站都可以免费办理会员卡，每加油1元钱积1分，累计1万分可换300元加油卡，相当于每升油便宜0.2元。中石化会员卡希望以积分换礼品的形式提高用户忠诚度，跳出一轮一轮的价格大战。截至目前，中石化北京会员卡发行量已接近60万张。</p>\r\n<p>市场人士分析，中石化在京城加油站格局中的强势地位是能够低调应对价格战的根本原因。目前，中石油在北京的加油站不足300座，其中很多都不是直营店，而地处城区黄金地段的加油站更少。中海油、合资、民营加油站的总量也只有200多座，都无法对中石化市场地位发起挑战。</p>\r\n<p>&nbsp;</p>\r\n<p>在去年12月22日国内成品油官方调价后，加油站利润空间明显回升，这使得众多加油站争相推出优惠促销活动。记者了解到，目前中石油北京加油站普遍都有优惠，安定门、宣武门等黄金地段的加油站93号汽油每升直降0.15元；壳牌、道达尔合资加油站，93号汽油的优惠幅度在每升0.2元至0.3元；而民营加油站的优惠幅度普遍在每升0.5元左右，其中丰台西路附近的丰盾加油站优惠幅度最大，93号汽油每升6.49元，比官方零售价7.17元便宜0.68元。</p>\r\n<p>长期执行优惠促销政策的珊瑚路加油站王站长透露，每次汽柴油官方涨价后，都是加油站优惠促销空间最大的时机，因为各社会加油站都在涨价前从长期合作的批发商那里提前预订了几千吨油&ldquo;囤积&rdquo;。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('70', '<p><strong>新华网1月4日报道</strong>&nbsp;做&ldquo;体检&rdquo;的车辆中，私家车占了绝大多数。这些车主多半都是长假期间自驾游刚刚归来，回来后给爱车做一个全面养护，则是非常有必要的。</p>\r\n<p sizset=\"68\" sizcache=\"3\">对此，某汽车销售服务中心高级维修工李工建议，一般做以下十大项目的检测，就可应对自如。</p>\r\n<p><strong>1、车身除刮痕</strong></p>\r\n<p>自驾游途中，由于车主对路面的不熟悉或者一些路面状况较差，可能会导致车辆的外部产生明显刮伤、撞凹的痕迹，特别是在前保险杠位置。所以，对车辆外部进行喷漆处理的车主特别多。但是，据汽修公司的专业人员介绍，有些撞击所导致的油漆层裂缝不是很大，因而一般人认为没有影响到车辆的美观，对它熟视无睹。其实，油漆底下的金属已经开始生锈，等到车主能够从外部观察到时，内部的金属层已锈蚀得很厉害，再进行处理时，恐怕要伤筋动骨了。</p>\r\n<p><strong>2、底盘疗伤情</strong></p>\r\n<p>有的车在自驾游中刮过底盘，但在检修时往往忽略了。据专业人士介绍，如果发现底盘有异响、方向盘抖动、车辆的停放位置出现油渍等等的现象，就说明底盘已经受损。这是因为路面障碍物刮伤底盘后，可能导致底盘的一些零件变形，特别是上下摆臂、左右方向拉杆等容易发生变形。另外，即使是一些轻微碰刮也会引起机油底壳或波箱油底壳等发生轻微渗漏，而这些都是车主自行检测无法及时发现的问题。因此，车主最好做专业的底盘防锈护理或者喷上涂料做一次底盘装甲。</p>\r\n<p><strong>3、制动要灵敏</strong></p>\r\n<p>自驾游时间长的车，刹车系统很容易出现问题。在一些汽车维修店，前来检查制动系统的车排起了长队。一是要观察刹车碟片表面是否光滑，如果有明显凹槽，这是由于车辆行驶在砂石路面时，一些细小的砂石卡在刹车碟与挡泥板之间，不断摩擦刹车碟的表面所致，如果情况严重会明显影响刹车性能，这时要开到指定服务站检查，看看是否有必要更换刹车片。如果发现刹车油油面下降，要立即检查刹车油路是否有泄漏的地方。检查刹车之前，小心地擦净主油缸上的泥垢，以免脏东西掉入储油罐。对于没有刻度的油缸，应保持液面距油缸顶6毫米，如果有刻度，只要保持液面比刻度高就可以了。专业人士提醒车主朋友，了解一些养护常识，如果在一些街头小店做养护，要随时提醒维修人员保养项目。</p>\r\n<p><strong>4、胎压保正常</strong></p>\r\n<p>自驾游途中，由于轮胎跟地面接触的时间最长，磨损也最厉害，所以是需要重点检查的地方。如果轮胎是子午线轮胎，胎壁是其最薄弱的部位，因为整条子午线轮胎，只有胎壁上没有钢丝，所以在使用中也必须十分小心。出游时如果在路况不好的地段高速行驶，轮胎可能撞击深坑或其他异物，会导致轮胎在冲击物与轮辋凸缘之间产生严重的挤压变形，造成胎壁帘子布断纱，这时轮胎内部的空气就会从断纱处顶起形成鼓包。如发现轮胎鼓包要及时更换，不然高速行车时很容易造成爆胎。测测胎压，看看是否保持在正常范围之内，如果不正常应及时充气调整。</p>\r\n<p><strong>5、机油要充足</strong></p>\r\n<p>机油是否足够关系到发动机能否正常工作。所以，自驾游归来，一定要检查一下机油是否充足。步骤是在关闭发动机的前提下，首先拉出量油尺，用布擦干净；然后重新插入量油尺&mdash;&mdash;尽量把它插到底，否则读数就会不准确；最后再拉出量油尺，检查油尺端的油位。</p>\r\n<p>如果油位低于或稍高于低油位线时，则需取下机油加油盖加注机油。需要加注的机油量以机油液面达到量油尺上的低油位线和高油位线之间为准，加完后注意拧紧机油盖。</p>\r\n<p><strong>6、冷却液液面需达标</strong></p>\r\n<p>在发动机冷却的状态下，查看透明的冷却剂箱。液位如果保持在贮液箱的&ldquo;F&rdquo;和&ldquo;L&rdquo;标记线之间，则符合要求，如果液位在&ldquo;L&rdquo;线或以下，则需加注冷却剂，使液面达到&ldquo;F&rdquo;线。在加注冷却剂之后，如果冷却剂液位在短时间内下降，则说明可能有泄漏。需目视检查散热器、软管、发动机冷却剂加注盖、散热器和放泄旋塞以及水泵看看有没有水流出来。如果没有发现泄漏，则需把爱车开到指定服务站做进一步检测。需要注意的是为防止灼伤，当发动机还发热时，不要取下散热器盖。</p>\r\n<p><strong>7、蓄电池疗伤口</strong></p>\r\n<p>经过长途驾驶，爱车的蓄电池可能受强烈震动而松脱或有电池液溅出。这时要检查蓄电池外部有无腐蚀或接头松弛、裂纹或压具松弛。如果蓄电池被溅出来的电池液腐蚀，需用温水和小苏打水的混合溶液进行清洗，在接头外部涂润滑脂以防止进一步的腐蚀。如果接头连接松弛，须拧紧夹子的螺母，但不要太紧，拧紧至能够保持蓄电池固定在其位置上即可，过紧会损坏蓄电池箱。</p>\r\n<p><strong>8、车厢除灰尘</strong></p>\r\n<p sizset=\"70\" sizcache=\"3\">自驾游途中，因为行进在一个完全陌生的环境，所以车主们喜欢摇下车窗观察着车外的风景，但由于车窗打开的时间过长，车厢内累积了不少尘土，尤其是地毯、车顶和门饰板等绒面包裹部位，积了尘很难处理。这就需要以专业的蒸汽清洗机对这些部位进行干洗处理。车厢其他的部位如仪表台等虽不易沾染尘土，但拐弯抹角之处也应该用抹布或棉签进行清洁以免积尘。</p>\r\n<p><strong>9、空调冷媒查泄漏</strong></p>\r\n<p>&nbsp;</p>\r\n<p>空调养护分为两方面，一是在旅行归来后仔细检查位于车头的空调冷媒储罐有否因为颠簸或者撞击而泄漏，如果泄漏必须尽快补漏并加注冷媒。第二种情况是因为旅途中环境的恶劣而造成的空调散热器和管道内大量积尘。至于空调管路中的积尘，虽然无法直接接触得到，但可以使用向空调进气口直接注入专用清洗剂再打开空调内循环的方法去除管道内的积尘，这种清洗剂没有腐蚀性，不必担心损害管道塑料构件。</p>\r\n<p><strong>10、玻璃除油渍</strong></p>\r\n<p>玻璃除了用水清洗之外还能有什么保养吗？是的，玻璃保养是很有学问的，不是所有的问题用清水冲洗就可以解决得了。比如玻璃上在沾了油之后肉眼未必能够观察得到，但刮水器刮水的效能便会因此而大大下降，此时您就必须使用去脂类清洗剂去除这些油脂。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('71', '<p>各地楼市限购政策难抑楼市反弹趋势，住建部强调热点地市限购令将加强，限购政策到期的海口、福州、厦门、温州等四个城市明确将继续执行，而部分无明确政策时效的城市则表示暂无取消限购政策的时间表。</p>\r\n<p>2010年4月30日，北京出台的&ldquo;国十条实施细则&rdquo;中率先明确提出，5月1日起北京家庭只能新购一套商品房。此项调控重拳一出，惊起楼市一片哗 然。而9月29日国务院出台&ldquo;国五条&rdquo;掀起二次调控后，上海、广州、深圳、天津、大连、南京、杭州、宁波、温州、苏州、厦门、三亚、海口、福州、兰州等 15个城市也纷纷推出限购政策。其中，福州、厦门、海口、温州等四个城市&ldquo;限购令&rdquo;有效期限至2010年12月31日。</p>\r\n<p><strong>多城市继续限购</strong></p>\r\n<p>海口市政府网站资料显示，海口市日前出台《关于进一步贯彻实施促进房地产市场平稳健康发展政策的意见》明确，从2011年1月1日起，海口市及外省 市居民家庭可在海口市新购买1套商品住房。这意味着于2010年12月31日到期的楼市限购政策将延续执行，而且新的限购政策并无到期时限。</p>\r\n<p>根据新华社报道，曾注明商品房限购政策&ldquo;有效期限&rdquo;至2010年12月31日的福州、厦门等部分城市日前决定，将顺延执行此项政策。有媒体引用官方表态称，温州市在2011年仍延续楼市限购政策。</p>\r\n<p>而部分未明确政策时效的城市也表示，限购政策何时退出仍无时间表。北京、上海、广州、深圳四大一线城市已明确表态，今年将继续执行包括&ldquo;限购令&rdquo;在内的楼市调控政策。</p>\r\n<p>深圳市规划和国土资源委2010年12月27日向媒体表态称，&ldquo;限购令&rdquo;不仅继续执行，而且要严格执行，目前没有取消的时间表。广州市国土房管局在回复媒体采访时表示，广州&ldquo;限购令&rdquo;没有设置结束时间，2011年会继续实施限购措施。至于什么时候取消，则要视乎市场运<a href=\"http://quotes.money.163.com/\">行情</a>况再作决定。</p>\r\n<p>北京市住建委、上海市房管局人士日前均表示，两市去年执行的楼市调控细则无截止时间表，当地政府也暂无取消&ldquo;限购令&rdquo;的计划。</p>\r\n<p>继续执行楼市限购政策同时被列入2011年调控范畴。在此前2010年12月29日召开的全国住房城乡建设工作会议上，住建部部长姜伟新表示：&ldquo;在一些热点地区和热点城市，房屋的限购令将进一步加强。&rdquo;</p>\r\n<p><strong>限购令效果落空</strong></p>\r\n<p><a href=\"http://quotes.money.163.com/1002285.html\">世联地产</a>首席分析师王海斌在接受《第一财经日报》采访时表示，从周成交量来看，限购令出台的效果非常明显，但从月度走势来看，少数限购城市成交量在10月暂时回落后于11月再次反弹。而房价的上涨冲动更让业内人士担忧。</p>\r\n<p>根据国家统计局公布11月《七十个大中城市房屋销售价格指数》来看，15个限购城市中仅广州新房价格环比下降0.1%，另有5个城市新房价格持平， 其他10个限购城市的新房价格均环比上涨，而这些城市新房价格的同比变化除广州外，其他15个城市均大幅上涨，其中海口和三亚分别同比上涨49%和 55.1%。</p>\r\n<p>王海斌说，总体上楼市&ldquo;限购令&rdquo;并没有达成其预期中的抑需求效果，相反带来部分城市交易的反弹和地王的诞生。</p>\r\n<p>不仅如此，开发商10、11月份的销售业绩亦增长异常迅速，也显示出限购政策效果不佳。公开资料显示，1~9月各大上市地产公司的销售业绩中，绝大多数公司的完成率不到75%。但截至11月，国内一线的13家标杆房企中已有近七成提前完成了2010年初销售目标。</p>\r\n<p>世联地产研究报告认为，楼市现反弹迹象将是调控前奏。根据量价规律，成交量的持续上升必然带来成交价格的上扬，目前楼市又呈现反弹的迹象，按政策的惯性，若反弹持续并向其他未反弹区域扩大，则政府再次调控的可能性很大。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('72', '<p>当前人民币升值的最大推动力之一，来自于海外的政治压力，比如美国国会的汇率法案、美国财政部的汇率操纵国的报告、G20国际峰会等，都令人民币备受压力。</p>\r\n<p>同时，中国对外贸易仍保持较快增速，月度贸易顺差保持高位，这种国际收支局面也支持人民币升值。预计在2011年，只要美元在国际市场不出现超出预期的升值幅度，那么人民币对美元将会继续保持升值趋势，全年升值幅度可能达到4%~5%，不排除突破5%。</p>\r\n<p>这一幅度可能会对中国低附加值和劳动密集型企业带来负面冲击，在一定程度上带来失业压力，引发市场对中国出口前景的忧虑。但我们相信随着企业技术升级及劳动生产率的提高，多数企业能够克服升值带来的影响。</p>\r\n<p>由于中国在2010年下半年出现了较为明显的通货膨胀，有关加速人民币升值来抑制输入型通胀的呼声日高，不过我们认为依靠加速升值来抑制通胀是一种 弊大于利的措施，因海外大宗商品价格波动十分剧烈，年度涨跌幅甚至可以达到50%甚至100%，依靠升值来对冲进口价格压力，显然事倍功半。</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>另外，加速升值可能会吸引更多海外热钱涌入中国，加剧中国的流动性，结果对通胀火上浇油。目前中国的通胀更主要的是由食品价格所引发， 尚未全面传导到各个领域，当前治理通胀的有效手段是迅速增加供给，只要通胀尚未从食品领域全面蔓延开来，那么加息和升值对于当前通胀的作用可能都十分有 限。而且，国内农业劳动生产率整体偏低，加速升值会进一步增强海外农产品在中国的竞争力，排挤本土<a href=\"http://quotes.money.163.com/1000061.html\">农产品</a>，不利于增加食品供给和国家的食品安全。</p>\r\n<p>人民币在2010年的波动中，清晰地体现出双向波动的特点，即兑美元有涨有跌。我们预计在2011年，国际外汇市场将呈现剧烈波动的特征，这很可能也会导致人民币波幅较2010年更剧烈。</p>\r\n<p>对于外贸企业而言，这无疑会加大汇率风险，因此，妥善利用人民币跨境贸易结算，以及拟推出中的人民币期权，将有助于企业更好地规避汇率风险。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('73', '<p sizset=\"68\" sizcache=\"3\"><strong sizset=\"68\" sizcache=\"3\">汽车之家1月4日报道</strong>&nbsp;对于汽车，我们的注意力往往都集中在一些主要问题上，像发动机、变速箱、内饰做工、性能、油耗等等，但有多少人关注过汽车的轮胎呢？其实无论是汽车性能的发挥还是安全性，作为汽车与地面唯一接触的部分，轮胎的重要性比我们想象中要大的多。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/A/A0/A04C803D4C7290E99ACD44222ED211F4.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p>那么对于汽车轮胎来说，其重要性最直接的体现就是对刹车性能的影响，不同的轮胎宽度、材质，不同的纹路设计等等都会让最终的刹车距离有所不同。这里可能大家都会关心不同轮胎之间的差别到底会有多大？会不会有本质的区别？我们为了论证这一点，就特别进行了一次轮胎的刹车性能对比测试。</p>\r\n<p>我们这次的测试当中是以两个品牌的轮胎进行对比，一个是车辆本身装配的原厂轮胎，另外是相同尺寸其他品牌轮胎，对它们分别进行刹车性能测试，然后对比最终成绩的差别。</p>\r\n<p sizset=\"69\" sizcache=\"3\">下面我们下来看看这次的测试&ldquo;道具&rdquo;，车辆我们选用的是2011款速腾1.4TSI+7DSG，这款车型其实大家已经非常熟悉了，虽然是2011款的新车型，但只是在外观以及内饰方面进行了一些小幅度的调整，包括同色前进气格栅，雾灯造型，方向盘及仪表盘样式，中控面板布局等等，其他像动力总成和底盘都没有任何改动。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/6/6F/6FCCF3FE9DD3C916A5537EB9D5689F2F.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p>2011款速腾1.4TSI原厂配备的是固特异Eagle NCT5系列轮胎，尺寸205/55 R16，这款产品其实在市面上很常见，属于在操控性、舒适性、节能方面都比较均衡的轮胎产品。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/D/DF/DFCE4856962203DFD6999DDE4D01BBBD.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p sizset=\"70\" sizcache=\"3\">我们选用的测试轮胎是全新的韩泰OPTIMO K415系列轮胎，尺寸同样是205/55 R16，其实这个系列轮胎同样在很多车型上都能看到，同样是一款强调均衡性的产品。这里可能大家会提出一个问题，就是测试车原厂轮胎是已经使用过一段时间的，而测试轮胎是全新的，会对测试结果产生影响。这个大家不必担心，我们的测试车总行驶里程其实只有100公里左右，轮胎并没有过度磨损，基本和新轮胎一样，二者的差别可以忽略不计。</p>\r\n<p>一切准备就绪，下面就开始进行轮胎测试，而这次除了之前我们常用的单人测试之外，还加入了满载情况下的性能测试，从而能看出车辆在不同载重情况下的刹车性能表现如何。其实整个测试过程并不复杂，我们对每种轮胎的空载和满载情况分别进行5次性能测试，取出一个平均成绩作为最终的刹车成绩。由于天气寒冷，在测试之前我们都对轮胎进行了充分的磨合，让刹车系统以及轮胎表面温度提升，达到更好的工作状态。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/8/83/83250B46554FA71CB6AA1AE3334025B7.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/4/40/40986E1122094AE6DA2198DD08327A1E.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p><strong>测试一：原厂轮胎（固特异）空载性能测试</strong></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/6/6C/6C88EAC1951707F300459A73F68549BA.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/D/D3/D38FD7907CFFDDA0DC11B477ECA97A31.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p>&nbsp;</p>\r\n<p>首先我们对原厂的2011款速腾进行了空载情况下的性能测试，最终我们得到其加速成绩为9.7秒，刹车成绩为40.1米。这个成绩对比之前我们测试过的2010款速腾1.4T+DSG还是有着一定的区别，不过由于测试的温度、天气以及场地条件都有所不同，因此这个成绩我们姑且当做一个参考值，并不是我们今天要讨论的重点。</p>\r\n<p>[NextPage][/NextPage]</p>\r\n<p>测试二：原厂轮胎（固特异）满载性能测试</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/E/E2/E2ABF12FEEFE54A4F20A23CA517ABC61.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/D/D4/D4F281FA4E10638B7160838A6A75E272.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p>满载情况是在原有基础上增加了3名成年男性，总重量增加了220～250公斤左右，从最终的成绩来看，加速减慢是预料之中的事情，相比空载时慢了1.2秒；而刹车成绩却是在我们意料之外，最终成绩为40.3米，基本上和刚才空载成绩没有太大差别。如果按照我们通常的思维来看重量增加必然会造成刹车距离增长，但事实证明满载情况下刹车距离并不会大幅度增加，可见刹车系统以及轮胎的表现都是让人值得信赖，而这对于安全性是最大的保障。</p>\r\n<p sizset=\"68\" sizcache=\"3\">前面我们对2011款速腾1.4TSI搭配原厂轮胎时的性能进行了测试，那么下面我们就更换之前准备好的韩泰轮胎进行下一轮测试。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/A/AF/AF2A94646CFF9E2D7CC8CE832C0915A9.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p>这里说一句题外话，虽然更换轮胎并不是我们个人能够完成的工作，需要到专业的修理厂通过机器来完成，但是拆装车轮却是我们可以自己动手完成的，譬如轮胎漏气或是爆胎等情况发生时，我们就要自己更换备胎，而可能很多朋友还不太了解更换轮胎的过程，那么大家可以点击上面图片来了解一下到底如何自己动手拆装轮胎。</p>\r\n<p><strong>测试三：测试轮胎（韩泰K415）空载性能</strong></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/D/DF/DFF6E24D8168D46DEA1E23A45B62FC3B.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/4/4B/4BEDC822002D4F5CECA34894B4AC8935.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p>在更换了全新的韩泰K415之后，为了尽量保证测试的准确性，我们也进行了更加充分的磨合。同样是经过了几组测试之后，加速成绩仍然保持在9.7秒左右，而平均刹车成绩也在40.2米，这个成绩和之前原厂固特异轮胎的成绩几乎完全相同。</p>\r\n<p><strong>测试四：测试轮胎（韩泰K415）满载性能</strong></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/F/F5/F59C03C3735DE12ADC0D80521E095B64.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/5/54/5415F2896ADADA9B20D15CA244EB1C9F.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p>这次的满载性能测试加速成绩为11.1秒，比之前原厂成绩慢了0.2秒，而刹车成绩最终为40.5米，这个比之前原厂成绩增加了0.2米，差别可以说是非常小，通过这几次的测试也能够证明韩泰轮胎的性能表现和原唱固特异轮胎的性能表现几乎相同。</p>\r\n<p><strong>测试总结：</strong></p>\r\n<p>通过前面两个品牌的轮胎在不同状况下的刹车性能表现来看，成绩几乎可以说都是非常相近，这一方面说明了空载以及满载状况下，刹车性能并不会像我们通常所想的那样大幅衰减，因此大家完全可以放心，当然我们只是针对速腾这一款车型进行评判，而其他车型在没经过测试之前还不能下定论。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"是否值得关注? 看轮胎对刹车性能的影响\" src=\"http://img1.cache.netease.com/catchpic/B/B5/B5A67117C443B897719384231DBBBBE6.jpg\" style=\"border-right: #000 1px solid; border-top: #000 1px solid; margin: 4px; border-left: #000 1px solid; border-bottom: #000 1px solid\" /></p>\r\n<p>&nbsp;</p>\r\n<p sizset=\"69\" sizcache=\"3\">另外一方面就是我们这次选择的韩泰以及固特异两个品牌轮胎在性能上都有着不错的表现，而从品牌的角度来看固特异似乎是更能得到用户的青睐，但是从性价比的角度来看就是另外的结果了，以我们测试的205/55 R16尺寸轮胎为例，固特异的市场售价一般都在700～800元/条，而韩泰的售价是在300～400元/条，价格相差将近一倍，而在刹车性能的表现上二者的区别微乎其微。当然固特异轮胎在操控性等方面的表现会更加突出，不过对于讲究实惠的用户来说，韩泰更符合需求。</p>\r\n<p>(本文来源：汽车之家 )</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('74', '<p>刚刚过去的2010年12月CPI以及全年的居民价格指数目前仍存悬念。</p>\r\n<p>《每日经济新闻》记者获得的<a href=\"http://hkquotes.money.163.com/html/000218.html\">申银万国</a>于上周发布的宏观经济预测中指出：去年12月CPI将回落至4.5%，但这仅是暂时现象，今年上半年尤其是一季度，物价涨幅将再次超过5%，监管层必须同时动用利率、存款准备金率和汇率来控制通胀形势。</p>\r\n<p><strong>上月CPI或迎来回落</strong></p>\r\n<p>根据商务部监测数据，2010年12月份，国内食用<a href=\"http://quotes.money.163.com/1000061.html\">农产品</a>价格总体运行平稳。四个星期中，前两周小幅回落，第三周持平，第四周小幅上涨。</p>\r\n<p>去年12月6日~12日，全国36个大中城市重点监测的18种蔬菜平均批发价格，比前一周下降3.6%，同比下降4.5%，随后两周蔬菜平均批发价格基本与该周持平。</p>\r\n<p>但粮食价格仍在环比上升。国家统计局数据显示，去年12月前两旬，全国50个城市大米和面粉价格分别累计环比上升0.8%、1%。</p>\r\n<p>交行报告预计，去年12月食品价格环比上升-0.2~0.4个百分点之间，据此测算，CPI同比增幅为4.1%~4.7%，取其中位数，去年12月CPI同比增幅为4.4%左右。照此测算，2010年全年CPI涨幅约为3.3%，小幅超出年初制定的3%的目标。</p>\r\n<p>国家发改委价格司副司长周望军曾表示，去年11月底以来，居民生活必需品等价格趋稳或有所下降，通胀率可能已见顶，预计去年12月可能回落到5%以下。</p>\r\n<p>但非食品类CPI在国际能源价格上涨和国内油价上调的推动下继续上行，这也是机构预测CPI仍然站在4%以上的重要原因。</p>\r\n<p><strong>年初头两月通胀压力大</strong></p>\r\n<p><a href=\"http://quotes.money.163.com/0601328.html\">交通银行</a>分析师唐建伟认为，去年12月CPI同比增速小幅回落，并不意味着通货膨胀压力减轻。</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>今年2月初将遇到春节，节日需求会带动部分产品价格上涨；加上进入冬季以来低温雪灾等灾害性天气出现的可能性增加，将给蔬菜瓜果等农产 品的产运带来困难。同时，去年11月开始，CPI中非食品价格的涨幅有所扩大，如果这种趋势延续，将与食品价格一起助推CPI涨幅进一步扩大。</p>\r\n<p>据第一创业估算，今年的翘尾因素将呈现&ldquo;前高后低&rdquo;逐渐减弱的趋势。1月和6月的翘尾因素最高，达到3.3%，CPI最高点可能出现在1月。</p>\r\n<p>唐建伟也称，今年一季度物价上涨的压力较大，个别月份可能突破6%。</p>\r\n<p>国信证券宏观分析师吴土金告诉《每日经济新闻》记者，根据以往经验，CPI同比抬升的持续时间多在23~28个月，本轮CPI抬高自2009年7月开始，已进行了16个月，未来约需7~12个月达到高点，目前还看不到能让物价环比趋势大幅扭转的力量。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('75', '<p>2010年最后一周市场跌宕起伏、股指探底反弹。同样，市场资金亦呈现先抑后扬态势。大智慧超赢数据显示，上周大盘资金整体净流出184亿元，行业资金全线净墨，无一流入。</p>\r\n<p>上周初始市场受央行突然加息影响，出现资金大幅净流出，前两日流出资金规模高达70亿元左右。不过央行的此次加息时间较市场预期有所提前，国内通胀 压力减轻，同时经过前两日的杀跌，利空消息得以充分消化。市场情绪开始稳定，资金流出规模开始逐日回落，并于上周五资金转向净流入，金额为17亿元。</p>\r\n<p>板块上，由于两市整体出现资金先出后进的态势，上周热点板块也出现类似格局，未出现持续受资金流入的板块。</p>\r\n<p>上周一机械、医药处在板块资金净流出排行前三，流出规模在50亿元左右。大量资金流出下，这两个板块的做空资金率先开始衰竭，同时通过近几日的回 落，估值风险得到释放，引起场外资金再度关注。因而当周三两市资金流出出现减速下，这两个板块成为资金流入先驱，占据资金净流入前两名。之后两天板块也维 持了资金流入态势，一直保持在板块资金净流入的前五名。</p>\r\n<p>另外，随着中国煤炭进口量逐渐增大，国内煤价受国际价格影响越发明显。上周，三大国际煤价齐破120美元/吨大关，刺激资金看多煤炭石油板块，带头 反抗加息政策的利空影响，最终虽受市场普跌拖累，但仍逆市流入资金5.8亿元。此后两天，市场信心虽一度减弱，出现大量资金流出，但随着市场整体的回暖， 资金开始加速流入，至上周五资金流入量又回到6亿元规模。</p>\r\n<p>有色金属板块的上周表现与煤炭石油大致相似，考虑到同期美元指数的持续走低，有色金属和煤炭石油板块于周末出现的资金加速流入迹象，反映市场对国内经济持续走好持积极态度，市场需求将继续扩大。</p>\r\n<p>同步加息虽对地产和银行板块形成一定利空。不过有消息显示四季度全国各大城市成交量虽被压低，但楼价继续上涨。另外，央行上调对金融机构再贷款和再 贴现利率，且幅度高过上周末加息幅度。这些都对板块的基本面形成利好刺激，但除了上周一房地产板块资金有微幅净流入外，这两个板块持续位于每日板块资金净 流出的前列。</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>由于年底，银行放贷指标不足，市场持续处在资金紧缺的环境下，成交也保持低位，大盘难有所表现。不过随着进入新年一月份，银行将释放强 烈的放贷需求，市场流动性有望恢复。业内人士预计，在资金介入下，市场有望出现水涨船高。另外，上月央行货币政策操作频繁，也降低了一月份再度实行货币收 紧的可能性。市场格局较为宽松下，大盘向上阻力也明显降低。此外，去年11、12月份发行的大量指数型基金将于1月份逐渐开始建仓，市场将面对估值修复需 求。因而，投资者可开始逢低布局，建议关注在去年12月底市场资金普遍撤离背景下，有资金介入的个股。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('76', '<p sizset=\"73\" sizcache=\"3\"><strong sizset=\"73\" sizcache=\"3\">汽车点评网1月1日报道</strong>&nbsp;转眼间新的一年已经到来，笔者我首先在这里代表汽车点评网祝大家新年快乐。回顾刚刚过去的一年，国内汽车市场呈现出爆发式的增长，并再度蝉联了全球第一大市场桂冠。并且在这一年成功的举办了北京以及广州两届重要的国际性车展，与之伴随的是更多品牌的更多新车进入了消费者的日常生活中。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"德系军团领衔 2011年上市中型车大盘点\" src=\"http://img1.cache.netease.com/catchpic/F/F0/F0B400801F5CAC6C9B0AC69EA738875A.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; cursor: hand; border-bottom: black 1px solid\" /></p>\r\n<p>展望新的一年，还会有什么样的新车型呈现在广大车迷眼前呢？我们汽车点评网新闻频道将通过多期报道来展望新的一年各类车型，而今天我将要呈现的是2011年中型车市场最新动态。希望广大车迷持续关注我们接下来的报道。</p>\r\n<hr />\r\n<p>● <strong>帕萨特 B7L</strong></p>\r\n<p><strong>预计上市时间：今年下半年</strong></p>\r\n<p sizset=\"74\" sizcache=\"3\">在早前举行的2010年度巴黎国际车展上，大众汽车时隔5年为世人带来了其经典中坚车型全新帕萨特B7。据悉，特意为中国市场研发的加长版车型B7L目前已进入生产调试阶段，并有望于今年下半年正式上市。预计售价维持不变。而目前在售的第六代车型迈腾将会在B7L上市之后逐渐退市。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"有望明年底上市 大众帕萨特B7L详细解析\" src=\"http://img1.cache.netease.com/catchpic/3/3D/3DA7DD429E486AE498FE8BC7382A4727.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"有望明年底上市 大众帕萨特B7L详细解析\" src=\"http://img1.cache.netease.com/catchpic/E/E8/E8D56B6CBD15A5DAF5266C5168773B58.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" />&nbsp; <img alt=\"有望明年底上市 大众帕萨特B7L详细解析\" src=\"http://img1.cache.netease.com/catchpic/1/1C/1CED50286DFC8FB111666A603FDAF6F1.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" /></p>\r\n<p>全新帕萨特B7</p>\r\n<p sizset=\"75\" sizcache=\"3\">帕萨特 B7是德国大众汽车公司设计第七代帕萨特品牌轿车。并引入了大众全新的简约风格，外形设计借鉴了新款Phaeton辉腾的灵感，前脸整合了大众全系家族特征，使其带来更为强烈的冲击感。同时大面积的镀铬装饰和横向线条的运用也凸显了其年轻时尚。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"有望明年底上市 大众帕萨特B7L详细解析\" src=\"http://img1.cache.netease.com/catchpic/4/45/4560A0A70299B2077473883524B9679D.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"加长就完美吗 国产Passat B7L优势解析\" src=\"http://img1.cache.netease.com/catchpic/F/F0/F0F7BA47A41A05FBDD59B31631CED38C.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" /></p>\r\n<p>帕萨特 B7的外观尺寸长为4769mm，宽度为1820mm，而轴距则同现款迈腾相比仅增加了3mm,达到2712mm。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"之后会国产 大众帕萨特 B7亮相巴黎车展\" src=\"http://img1.cache.netease.com/catchpic/8/8B/8B5C38504562286A083FE3F60BC7E0EA.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" /></p>\r\n<p>大众帕萨特 B7亮相巴黎车展</p>\r\n<p>内饰方面，全新的帕萨特 B7秉承了大众一贯的精致风格，整个造型和迈腾相比变化不大，但在仪表板和中控台的等细节处都经过多方面重新设计，拥有直观显示和控制系统，通风孔周围使用镀铬镶嵌件装饰。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"有望明年底上市 大众帕萨特B7L详细解析\" src=\"http://img1.cache.netease.com/catchpic/5/56/56C1C732B98B4163F279F7DED46BEAB2.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" /></p>\r\n<p>在车后发出特殊的脚步动作即可开启行李厢盖</p>\r\n<p>配置方面，全新帕萨特 b7可谓是较上一代有了长足的进步，不仅全系车型标配iPod接口、6安全气囊、ESP以及多功能真皮方向盘等，而高端车型更是融入了8扬声器数字广播、驾驶员疲劳监测以及蓝牙接口等以及触摸屏卫星导航系统。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"有望明年底上市 大众帕萨特B7L详细解析\" src=\"http://img1.cache.netease.com/catchpic/1/15/1509A7D95D5722FEED0C5373C9F0BD37.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" /></p>\r\n<p>引入第二代驻车系统，泊车入位更为轻松</p>\r\n<p>动力方面，全新帕萨特提供了多达10款发动机，提高燃油经济性最高达18%。并都具有更高的燃油经济性，对于发动机的细微调整也降低了碳排放量。不过可以预计明年国产后帕萨特 B7肯定会以我们熟悉的1.4 TSI、1.8 TSI、2.0 TSI发动机作为其主力车型。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"有望明年底上市 大众帕萨特B7L详细解析\" src=\"http://img1.cache.netease.com/catchpic/2/2C/2C8742538AE737AACD7D5A7EA3DC4B0D.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" /></p>\r\n<p>涡轮增压柴油发动机</p>\r\n<p>其中四款发动机是经典的汽油发动机，输出功率分别为90千瓦 / 122马力（1.4 TSI）、118千瓦 / 160马力（1.8 TSI）、155千瓦 / 211马力（2.0 TSI）和 220千瓦 / 300马力 （V6）。性能最高的为六缸发动机，而其他汽油发动机为涡轮增压四缸发动机。为使用天然气而设计的 110千瓦 / 150马力发动机（1.4 EcoFuel）也具有增压功能。1.4 TSI的另一个变体是MultiFuel 发动机，功率为 118千瓦 / 160马力，专为使用最高 85%的乙醇燃料而设计。</p>\r\n<hr />\r\n<p>● <strong>上海大众 NMS</strong></p>\r\n<p><strong>预计上市时间：上海车展</strong></p>\r\n<p>除了即将引进的帕萨特 B7以外。采用与全新Passat相似平台的针对北美和中国市场开发的新中级车NMS也将在年内发布，届时一汽大众B7L与上海大众NMS将有望分割中级车市场。预计，大众NMS将有望于今年春季的上海车展上迎来自己的首发。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"将正式命名为Passat 上海大众NMS登公告\" src=\"http://img1.cache.netease.com/catchpic/1/14/14A923FC46076EAF4924A5F11B1FA241.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" /></p>\r\n<p>大众NMS谍照</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"大众NMS无伪装谍照曝光\" src=\"http://img1.cache.netease.com/catchpic/0/0E/0E9A63B76A72F6AE17C2F177B330560C.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" /></p>\r\n<p>大众NMS谍照</p>\r\n<p>大众NMS与新帕萨特B7一样都是基于PQ46升级平台，两者在尺寸上更为接近，不过两者在后排车窗处区别极为明显。在设计上，大众NMS明显采用大众新家族面孔，前脸更加整洁，整体轮廓酷似新辉腾。</p>\r\n<p sizset=\"76\" sizcache=\"3\">与现在正在销售的PASSAT领驭相比,新款车型的长度达到了4870mm，相比现款领驭增加了81mm，同时新车宽度为1834mm，增加了69mm。虽然长度增加了，但是轴距并没有变化，不过随着宽度的增加，应该会呈现更加完美的空间表现。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"将正式命名为Passat 上海大众NMS登公告\" src=\"http://img1.cache.netease.com/catchpic/E/E4/E47789B7068E463C7ADFFD8D036FD256.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" /></p>\r\n<p>作为不同配置车款的区分，可以看到在高配车型中使用了带有氙气灯头的大灯。远近光一体式的灯头质感要比低配车型的普通卤素灯头更显档次。仔细观察还会发现低配车型前保险杠是没有泊车雷达的，而高配车型则有此配置。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"将正式命名为Passat 上海大众NMS登公告\" src=\"http://img1.cache.netease.com/catchpic/4/42/42B0997411238B74337C3F9A0F949F3F.jpg\" style=\"border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid\" /></p>\r\n<p>&nbsp;</p>\r\n<p>在动力方面，大众NMS在北美市场应该会保留2.5L和3.6L等自然吸气式发动机，这从之前美版第六代捷达车型上就可以看出。不过在国内应该会普及TSI+DSG动力系列，入门级车型可能会采用一款1.4TSI发动机，顶配车型使用2.0TSI，此外大众官方已经确认在2012年夏季还将引入混合动力车型，是否会引入国内还不太清楚。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('77', '<p>如果要选出一只被券商集体看好的个股，桑德环境（000826，收盘价33.37元）当仁不让！据《每日经济新闻》记者不完全统计，<a href=\"http://quotes.money.163.com/1000826.html\">桑德环境</a>同时出现在了中信、中金等六大券商推荐的2011年金股名单中，成了名副其实的&ldquo;金股王&rdquo;。而就在2010年即将结束之际，公司又接连公布了两份与地方政府合作的利好消息，隐隐透露出机构投&ldquo;靶&rdquo;或许早已胸有成竹。</p>\r\n<p><strong>年末最后一周连抛重大公告</strong></p>\r\n<p>2010年12月31日，桑德环境公布了一则《重大合同》，公司于2010年12月28日与重庆市南川区人民政府签订《重庆市南川区生活垃圾处理特 许经营协议》。该协议确定公司为南川区生活垃圾处理项目的投资、建设及经营主体，授予公司在南川区成立的项目公司具体从事生活垃圾处理相关特许经营许可。</p>\r\n<p>根据公告，南川区生活垃圾处理项目预计于2011年下半年正式开工建设，预计该项目公司内部投资收益率不低于8%。桑德环境称，项目将树立公司固废项目区域性示范效应，将对公司在西南地区的项目开展产生积极影响。</p>\r\n<p><a href=\"http://quotes.money.163.com/1000776.html\">广发证券</a>分析师谢军表示，这份合同的签订具有标志性意义。市场普遍认为桑德环境主推综合处理方式，在垃圾焚烧方面并不具备优势。此重大合同的签订意味着公司未来有希望借助两焚烧项目的示范效应和自身品牌优势在焚烧市场中进一步争夺话语权。</p>\r\n<p>而细心的投资者不难发现，在2010年12月25日桑德环境曾公布了一则类似的，与地方政府签订合作协议的公告。公司称，控股股东桑德集团与湖南省 湘潭市人民政府签订《湖南静脉园项目投资合作协议书》，项目投资约50亿元，而桑德集团拟邀请公司共同参与项目的投资、建设、开发与运营。</p>\r\n<p><strong>机构早已提前强推</strong></p>\r\n<p>&ldquo;这种接连和地方政府携手合作的情况，让我想起了东方园林（002310，收盘价137.99元）&rdquo;，一位资深业内人士表示，在2009年末才上市的<a href=\"http://quotes.money.163.com/1002310.html\">东方园林</a>，起初并没有表现出太大的爆发力。但是随着与大同市城市园林绿化建设管理服务中心、河北省张北县人民政府、衡水市人民政府等，以地方政府机构为主要对象，连续签订重大合同的推动下，公司股价与业绩不断创出新高。</p>\r\n<p>与之相比，同样致力于市政工程领域的桑德环境，似乎也走上了东方园林曾经的发展道路。正如广发证券研究报告中所点评的，&ldquo;十二五&rdquo;期间国家将制定更 为严厉的环保政策，对各地垃圾无害化处理率提出更高要求，并将此列入政绩考核指标，桑德环境以投资方的身份与地方政府谈判时将掌握更多主动权，未来项目签 订阻力将大大减小。</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>实际上，早在上述两份公告披露之前，桑德环境就已经成为各家券商共同推荐的投资标的之一。据《每日经济新闻》记者粗略统计，自2010 年12月以来至少有13份关于公司的研究报告，均为买入、推荐、强烈推荐等看多的评级，涉及大部分一线券商。更值得关注的是，券商2011年金股中，桑德 环境同时受到在了中信、中金、招商等六家券商推荐，成为了各家券商2011年金股名单当中，重合度最高的&ldquo;2011金股王&rdquo;。</p>\r\n<p>一位市场人士指出，公司作为国内固体废弃物处理龙头公司，在未来将迎来巨大的发展空间，成为了各家券商眼中最大的投资<a href=\"http://quotes.money.163.com/usstock/hq/CELL.html\">亮点</a>。而从公司近期接连公布的消息来看，上述曾经强烈看好公司前景的机构，或许早已是胸有成竹。但是，由于市场环境不同、公司特点不同等原因，公司能否再现东方园林式的股价业绩双重增长，还有待时间的检验。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('78', '<p sizset=\"75\" sizcache=\"3\"><strong sizset=\"75\" sizcache=\"3\">网易汽车1月3日报道 </strong>伴随着2010年中国车市野蛮生长，2011年虽然在汽车产业政策上，许多利好政策已经结束，取而代之的使更多的限购措施，然而这些都改变不了目前汽车从奢侈品转变为正常消费品而带来的刚性需求。2011年的汽车市场依旧会是火爆而野蛮生长的。新年伊始，就有许多新车等待着上市发布，这8款新车没有特别的亮点，还是以改款车型为主。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"路虎发现4限量版领衔 8款2011年1月上市新车\" src=\"http://img3.cache.netease.com/auto/2011/1/3/20110103134539019b2.jpg\" /></p>\r\n<p><strong>2011款MINI Countryman</strong></p>\r\n<p>虽然还冠着MINI家族的名头，但Countryman车型在外形尺寸上已经不再那么&ldquo;迷你&rdquo;，相比Cooper和Clubman的轴距分别为2467mm和2547mm，Countryman车型的轴距已经达到了2595mm，已经完全达到了标准的A级轿车尺寸。与之对应的是，Countryman的车身尺寸为长4097mm（Cooper S Countryman为4110mm），远远超出了以往mini车型介于3699-3937mm之间的车身长度；车身宽度也从1683mm大幅提升到近1800mm。当然也只有这样的设计，才能保证Countryman更好实现四门四座的设计。</p>\r\n<p class=\"f_center\" sizset=\"77\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"MINI Countryman\" src=\"http://img3.cache.netease.com/photo/0008/2010-12-20/550x412_6OC4HE7G4C3O0008.jpg\" /></p>\r\n<p class=\"f_center\" sizset=\"77\" sizcache=\"3\" style=\"text-align: left\"><br />\r\n首先两款车型搭载了不同版本的1.6L发动机，MINI Cooper Countryman的1.6L直列四缸自然吸气发动机，最大功率88kw/600rpm和最大扭矩155Nm/4250rpm，0-100km的加速控制在11.6秒，最高车速可达180公里/小时。而MINI Cooper S Countryman车型则使用1.6T涡轮增压发动机，最大功率为135kw/550rpm，最大扭矩240N.m/1600rpm（超增压模式下能达到260N.m），百公里加速为8.3秒，最高时速为205公里/小时。同时还配置了All4恒时4四驱系统，该系统基于电控中央差速器进行动力传递。一般情况下，车辆会处于前轮驱动状态，动力可在前后桥之间任意分配；一旦前轮出现打滑后，电子液压中央差速器会瞬间开始作用并将动力传向后轮。</p>\r\n<p class=\"f_center\" sizset=\"83\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"MINI Countryman\" src=\"http://img4.cache.netease.com/photo/0008/2010-12-20/550x412_6OC4H2SV4C3O0008.jpg\" /></p>\r\n<p>保持MINI家族的小资气息，首款四门车型仍然体现出了不一样的个性，仪表台保持了MINI车型惯有的家族风格，高配车型中控台上的液晶屏也被独具匠心的设计成了圆弧型。而后排空间虽然可以满足三名乘客，但MINI车型从来都不会把实用放在第一位，个性是最为重要的，因此一条贯通式的滑轨将后排座椅隔开为两个独立位置，在这条滑轨上，放置了两组杯架，太阳镜盒，你还可以摆放ipod、手机等其他物件，通过轨道上面的电源为一些电子设备充电非常方便。</p>\r\n<p class=\"f_center\" sizset=\"84\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"MINI Countryman\" src=\"http://img4.cache.netease.com/photo/0008/2010-12-20/550x412_6OC4HKQ74C3O0008.jpg\" /></p>\r\n<p class=\"f_center\" sizset=\"85\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"MINI Countryman\" src=\"http://img3.cache.netease.com/photo/0008/2010-12-20/550x412_6OC4HRCI4C3O0008.jpg\" /></p>\r\n<p>Countryman成为了史上最男人的MINI，但由于车身尺寸的放大，四驱系统的配置，导航系统的增加，同样也会令其成为史上最贵的MINI车型。不过这款有着宝马X1平台的SUV车型，正好赶上了中国近年的SUV车型热潮。应该会再度成为一款人们的小资车型。</p>\r\n<hr />\r\n<p sizset=\"86\" sizcache=\"3\"><strong sizset=\"86\" sizcache=\"3\">2011款东风日产逍客</strong></p>\r\n<p sizset=\"87\" sizcache=\"3\">虽然海外有逍客的中期改款车型发布，不过从公布的新车图片来看，国内版改款逍客改动幅度要小许多，就改动幅度而言，仅能算是年度款型。与其它日产改款车型一致，改款逍客很可能在广州车展露面。外观方面，新逍客变化较小，除前进气格栅、尾灯、轮毂的细微改动外，更多只是在配置上有所变化。</p>\r\n<p class=\"f_center\" sizset=\"88\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"路虎发现4限量版领衔 8款2011年1月上市新车\" src=\"http://img3.cache.netease.com/auto/2011/1/3/2011010312463557399.jpg\" /><br />\r\n&nbsp;</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"路虎发现4限量版领衔 8款2011年1月上市新车\" src=\"http://img4.cache.netease.com/auto/2011/1/3/20110103124639a1595.jpg\" /></p>\r\n<p>值得一提的是，新逍客为部分车型增加了全景天窗。从曝光的图片来看，一款面积巨大玻璃由前风挡开始，一直延伸至尾部，覆盖面积超过1平方米。不过，该天窗并无开启功能，仅能实现透光。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"路虎发现4限量版领衔 8款2011年1月上市新车\" src=\"http://img4.cache.netease.com/auto/2011/1/3/20110103124645a77d0.jpg\" /></p>\r\n<p>从曝光的资料来看，新款逍客将搭载型号为MR20及HR16的两款发动机，其中MR20将与CVT无级变速器和6速手动变速器搭配，而与HR16 1.6L发动机搭配的，仅有一款5速手动变速器。从参数来看，这款MR20发动机在调教上有所变化，最大功率由原来的102kW提升至现在的106kW，另一款HR16 1.6L发动机的最大功率则有81kW提升至现在的89kW。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('79', '<p>截至2011年1月1日，所有60家基金公司2010年末资产净值数据公布完毕。数据显示，孙建波领衔，25只偏股基金年回报逾20%；华商、银华等26家基金公司资产管理规模同比提升；</p>\r\n<p><strong>银河行业等13只基金份额倍增</strong></p>\r\n<p>经过一年的&ldquo;厮杀&rdquo;，2010年业绩以及基金公司资产管理规模榜单终于在2011年的第一天出炉。据《证券日报》基金周刊及财汇信息最新统计，截至 2010年12月31日，288只主动管理型偏股基金（剔除2010年下半年成立的基金）全年平均回报率5.01%，业绩首尾相差61.81个百分点。孙 建波执掌的华商盛世成长以37.77%的收益率战胜所有对手，夺得2010年基金收益冠军。60家基金公司中有26家资产净值同比有所提升，占比 43.33%，富国基金公司成功跻身前10大。</p>\r\n<p>面对基金业绩的分化，投资者快速申购、果断赎回。银河行业等13只偏股基金份额实现倍增，也有中欧中小盘等19只基金份额同期缩减5成。</p>\r\n<p><strong>25只偏股基金年回报逾20%</strong></p>\r\n<p><strong>前10强有8只是新人</strong></p>\r\n<p>2010年的震荡市决定了主动管理的股票方向基金业绩空前分化。统计数据显示，288只偏股基金单位净值全年平均回报率5.01%，190只基金取 得正收益，占比66%；其中净值回报率超过20%的基金共有25只，62只回报率介于10%-20%之间；另有98只基金未能盈利，占比34%。业绩前5 强分别是华商盛世成长、银河行业、华夏策略、光大<a href=\"http://quotes.money.163.com/usstock/hq/PUK.html\">保德信</a>中小盘、诺安中小盘精选，全年回报率分别为37.77%、29.94%、29.50%、27.63%、26.93%；而业绩垫底的基金是益民红利成长，净值全年亏损率为14.28%。显然，偏股基金业绩首尾相差61.81个百分点。</p>\r\n<p>值得注意的是，2010年的新科状元孙建波执掌的华商盛世成长可谓生逢其时，成立时<a href=\"http://quotes.money.163.com/0000001.html\">上证指数</a>从 云端下跌至即将触底，2009年也以近乎翻倍的收益站在了开基收益前列；2010年对于孙建波来说是大踏步前进的一年，成绩稳步攀升。被誉为&ldquo;最牛基金经 理&rdquo;的王亚伟2007年凭借华夏大盘以200%多的收益率夺得冠军；在随后的2008年华夏大盘也成为跌幅最少的基金之一；在2009年王亚伟惜败于银华 核心价值优选的陆文俊而屈居第二，2010年王亚伟依然与状元无缘。</p>\r\n<p>其实，基金业绩分化还表现在前10强、前10弱名次的巨大变化。</p>\r\n<p>据《证券日报》基金周刊记者观察，2009年单位净值实现倍增的有10只，而在2010年，这10强有7只已跌出百名之外。除华商盛世成长、华夏大 盘精选仍旧留在前10强外，华夏复兴则以16.81%的回报率位居偏股基金排行榜第45名；其余7只基金名次则均下滑出百名之外，东方精选等基金更是以亏 损的业绩落后至后1/3排名。而在2009年业绩垫底的10只基金中，有7只在2010年实现了正收益，其中国泰区位优势（净值回报率13.7%）、广发 聚瑞（净值回报率12.66%）、长城景气行业龙头（净值回报率11.53），成功晋升至前1/3排名，成为2010年业绩提升最快的基金。</p>\r\n<p>基金经理的频繁变更，被业界认为是基金表现不稳定的最重要因素之一，2009年前10名的基金中，有6家在近两年更换过基金经理，且大部分发生在2009年下半年和2010年上半年，也正是<a href=\"http://quotes.money.163.com/\">行情</a>由强势转为震荡之时。</p>\r\n<p><strong>基金公司资产净值回落5.61%</strong></p>\r\n<p><strong>富国基金跻身前10大</strong></p>\r\n<p>据《证券日报》基金周刊及财汇信息最新统计，截至2010年12月31日，60家基金公司资产净值合计25266.19亿元，与2009年底的26767.35亿元相比，基金资产净值缩减了1501.16&nbsp;亿元，降幅5.61%。</p>\r\n<p>具体来看，60家基金公司中有26家资产净值同比有所提升，占比43.33%。其中，华商、银华、中银三家基金公司资产净值额度增加最多，与 2009年相比，2010年资产净值分别增加283.45亿元、108.57亿元、101.31亿元；另有摩根士丹利华鑫、国联安、天弘等7家基金公司资 产规模增加了50亿元以上。从资产净值增幅来看，<a href=\"http://quotes.money.163.com/usstock/hq/MS.html\">摩根士丹利</a>华鑫、华商、天弘三家基金公司资产净值均实现了倍增，资产净值增幅分别为281.59%、211.78%、133.84%；另有民生加银、东吴、华富、国联安、金鹰等5家基金公司资产净值增幅均超过50%。</p>\r\n<p>对比近两年前10大基金公司规模数据发现，2010年富国基金公司新进前10大名单，其资产净值规模由2009年的第11名提升至2010年的第10名；与之相反，交银施罗德基金公司资产净值规模由去年的第9名滑落至2010年的第15名。</p>\r\n<p>《证券日报》基金周刊注意到，博时基金公司与南方基金公司尽管资产净值相差不大，但其排名也有着细微变化。2009年南方基金公司资产净值 1222.71亿元，紧随博时基金公司之后，排名第五，2010年，南方基金公司资产净值1184.08亿元，超过博时基金公司7.72亿元，两家的排名 也发生互换。这种差异和南方基金公司QDII稳定的资产规模有关，截至2010年年末，旗下的南方全球精选配置资产净值154.66亿元，<a href=\"http://quotes.money.163.com/usstock/hq/SO.html\">南方</a>金砖四国指数资产净值6.37亿元。</p>\r\n<p><strong>基金总份额同比略减</strong></p>\r\n<p><strong>基民最爱摩根士丹利华鑫</strong></p>\r\n<p>据《证券日报》基金周刊及财汇信息最新统计，截至2010年12月31日，60家基金公司旗下的705只基金总份额24411.1亿份；与2009 年底相比，增加了148只基金，但基金总份额下降了0.51%。可对比的偏股基金总份额缩减8.94%。业内人士对此表示，基金业绩的空前分化，令不少投 资者选择了&ldquo;落袋为安&rdquo;的策略，这成为基金只增数量不增规模的根本原因。</p>\r\n<p>记者注意到，在60家基金公司中，摩根士丹利华鑫规模扩张最快。该基金公司旗下基金数量由2009年底的5只，增至2010年底的7只；基金总份额 由2009年底的23.09亿份增至2010年底的96.65亿份，增幅318.65%；基金净值也由2009年底的32.59亿元增长281.59%至 124.36亿元。旗下两只偏股基金大摩领先优势、大摩资源优选全年净值回报率分别为21.97%、18.51%，两基金全年分别净申购12.59亿份、 7.4亿份，总份额同比增长215.74%、76.75%。</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>华商基金公司规模增速紧随其后，旗下基金总份额2010年大增165.54%至317.21亿份，基金净值由2009年底的 133.84亿元增长211.78%至417.28亿元。孙建波执掌的华商盛世成长全年净申购41.03亿份，2010年总份额达53.44亿份，增幅 330.39%。</p>\r\n<p>与之相反，业绩较差的基金呈现净赎回。净赎回比例前10只基金中（赎回率超过60%），有两只基金净值亏损，另有5只基金回报率不足9%。如金元比联价值增长全年净值回报率-3.43%，净赎回1.73亿份，赎回比例60.11%。</p>\r\n<p>通过对比公司数据显示，在2009年的前10大基金公司中，仅有交银施罗德基金公司在2010年掉队，基金总份额排名由2009年的第9名，落后至2010年的第15名。易方达基金公司旗下基金总份额排名由2009年的第4名，提升至2010年的第三名。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('80', '<p><strong>网易汽车9月30日巴黎车展现场报道</strong>&nbsp;巴黎车展前夜，大众汽车品牌的全新Passat bule motion和电动版旅行版亮相，大众passat是汽车历史上最成功的车型之一，自1973年首次发布至今，在全球100多个国家的累计销量已经突破了1,500万辆。如今，大众汽车全新Passat将在巴黎车展（10月2日&mdash;17日）上全球首次亮相，同时发布的车型有轿车和旅行轿车两个版本。这款车型的第七代产品将于11月中旬在欧洲市场率先上市。预计新车将于明年国内正式上市，国产版本将是基于海外版Passat的加长版车型。</p>\r\n<p class=\"f_center\" sizset=\"67\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"大众新Passat巴黎首发 国产加长版车型明年推出\" src=\"http://img4.cache.netease.com/auto/2010/9/30/20100930144209e8287.jpg\" /><br />\r\n全新Passat巴黎实拍图片</p>\r\n<p><strong>外观：</strong></p>\r\n<p>笔直的线条、雕塑般明晰的曲面和充满动感的比例分配勾勒出第七代Passat的造型特征。全新Passat车头部分由带着四条横梁的格栅强调；格栅的高度几乎与头灯平齐，这是继2010年夏天推出新辉腾之后，大众汽车推出的第二款采用同样设计的车型。全新Passat和新辉腾之外的车型，包括厢式货车在内，则使用了较窄的散热器格栅，且仅带有两条横梁。大众汽车集团总设计师瓦尔特&bull;德&bull;西尔瓦和大众汽车品牌总设计师Klaus Bischoff特意将散热器格栅做成这种特征鲜明的造型，只为突出其高端定位。</p>\r\n<p class=\"f_center\" sizset=\"68\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"大众全新PASSAT首发现场实拍\" src=\"http://img3.cache.netease.com/photo/0008/2010-09-30/550x412_6HR1BPLI46TE0008.jpg\" />&nbsp;<br />\r\nPassat bluemotion巴黎车展现场图片</p>\r\n<p>全新的前端设计给全新Passat带来了更为凌人的气势&mdash;&mdash;现宽1,820毫米，长4,769毫米（旅行车长4,771毫米）。虽然车型宽度没有增加，但却有更强的质感，视觉上也更具动感。两个车身版本的高度保持不变（轿车1,474毫米，旅行车1,519毫米）。</p>\r\n<p class=\"f_center\" sizset=\"69\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"大众全新PASSAT首发现场实拍\" src=\"http://img3.cache.netease.com/photo/0008/2010-09-30/550x412_6HR1BU9946TE0008.jpg\" />&nbsp;<br />\r\nPassat旅行版巴黎车展现场图片</p>\r\n<p>全新Passat采用双反射镜头灯，可选装双氙气大灯和LED日间行车灯，进一步突出了它的凌人气势。每一个日间行车灯都包含15个LED灯。在头灯和格栅形成的线条下方，是与车身同色的保险杠。再往下则是另一个环绕着镀铬鳍片的进风口&mdash;&mdash;鳍片造型类似于商用飞机的翼梢，低调的雾灯融入其间。在Highline中，进风口中央的镀铬条与鳍片连成一线。而最低处的前扰流器如同赛车一样，设计成分流器的造型。Comfortline也运用了镀铬条配饰。</p>\r\n<p>&nbsp;</p>\r\n<p>其他新添辅助系统主要用于提升驾驶的便利性，大大简化了日常操作。这些新添系统包括了&ldquo;轻松开启&rdquo;功能：如全新Passat轿车配备了无钥匙进入功能（自动锁止和发动机启动系统），在车后发出特殊的脚步动作即可开启行李厢盖。当您双手不便又必须开启后备箱的时候，就会知道&ldquo;轻松开启&rdquo;这个功能是多么有用了。当然，只有随身携带正确的Passat RF身份识别卡，行李厢盖才会为您开启。此处的人机交互界面是位于保险杠区域的一个感应器。</p>\r\n<p>全新Passat还新添了以下功能：后排座椅系统可以从储物空间拉开；牵引架只须按一个按钮即可旋出；侧窗安装隔音复合安全玻璃。新夏朗所采用的第二代驻车辅助系统也将在全新Passat上出现；该系统不仅可以帮助将车停到与车行道平行的驻车空间内，还可以找到与车行道相互垂直的停车位。最后，Passat RNS 510导航系统可以通过摄像头检测限速标志，并将之发送到中控台的触摸屏上。</p>\r\n<p>[NextPage][/NextPage]</p>\r\n<p>侧面：车头部分通过V形发动机罩的侧轮廓线和鲜明的翼子板线条，与侧面衔接到一起。新添加的上特征线和原有的下特征线一起，把车身衬托得更为干脆利落，这两条线共同构成了全新Passat更低调、更强大的外形。门槛区域通过黑色（Trendline）或镀铬（Comfortline和Highline）饰带提升加宽轮罩之间的侧表面，饰带一直延伸到车头和车尾部分。全新Passat的车门后视镜经过全新设计，车身侧面从车顶到车尾线条流畅，更具个性。</p>\r\n<p class=\"f_center\" sizset=\"67\" sizcache=\"3\" style=\"text-align: center\"><img alt=\" 大众全新PASSAT首发现场实拍\" src=\"http://img4.cache.netease.com/photo/0008/2010-09-30/550x412_6HRNAJUR46TE0008.jpg\" />&nbsp;<br />\r\n全新Passat图片</p>\r\n<p>车尾：与以前的车型相比，全新Passat的车尾设计大大弱化了楔形造型，线条造型经过全新设计，给车身尾部带来更轻盈、更优雅的外观。</p>\r\n<p class=\"f_center\" sizset=\"68\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"大众全新PASSAT首发现场实拍\" src=\"http://img4.cache.netease.com/photo/0008/2010-09-30/550x412_6HRKKSRQ46TE0008.jpg\" />&nbsp;<br />\r\n全新Passat图片</p>\r\n<p>这使轿车尾部显得更低，两个车身版本的端面都显得更宽。后车灯包围在翼子板之中，独具一格。这款车提供两种车灯版本。最高版本采用LED技术，夜间可呈现出与辉腾造型相似的M型设计。</p>\r\n<p class=\"f_center\" sizset=\"69\" sizcache=\"3\" style=\"text-align: center\"><img alt=\" 大众全新PASSAT首发现场实拍\" src=\"http://img4.cache.netease.com/photo/0008/2010-09-30/550x412_6HRNCFGS46TE0008.jpg\" />&nbsp;<br />\r\n全新Passat图片</p>\r\n<p>而如果选择较低版本，从Comfortline开始，车身后部也用镀铬条框出。在旅行轿车保险杠中，尾灯横贯整个车尾；而在轿车上，则被位置较低的车牌框所隔断。</p>\r\n<p>[NextPage][/NextPage]</p>\r\n<p><strong>内饰：</strong></p>\r\n<p>全新Passat的内饰也进行了升级,大众汽车制定了全新座椅概念，现在的头枕就像途锐一样拥有横向调整功能，同时还有全新的车门饰板。车门饰板可以配备美观大方的氛围灯光。根据装备配置的不同，车门面板上使用不同的饰件配置。另一个选项是全新温控座椅，可为驾驶者和前排乘客提供主动通风和按摩功能。</p>\r\n<p class=\"f_center\" sizset=\"67\" sizcache=\"3\" style=\"text-align: center\"><img alt=\" 大众全新PASSAT首发现场实拍\" src=\"http://img3.cache.netease.com/photo/0008/2010-09-30/550x412_6HRNDQV946TE0008.jpg\" />&nbsp;<br />\r\n全新Passat图片</p>\r\n<p>仪表板和中控台的表现和细节都经过多方面重新设计，拥有直观显示和控制系统，通风孔周围使用镀铬镶嵌件装饰,另外，内饰设计师在仪表板中央放置了一个模拟时钟。中控台下半部分的开关布局也经过全面重组，以6速或7速变速箱排挡杆周围区域为例，现在这里是电子驻车制动的开关，以及带有无钥匙进入选件的发动机起动按钮。</p>\r\n<p class=\"f_center\" sizset=\"68\" sizcache=\"3\" style=\"text-align: center\"><img alt=\" 大众全新PASSAT首发现场实拍\" src=\"http://img4.cache.netease.com/photo/0008/2010-09-30/550x412_6HRNDDP346TE0008.jpg\" />&nbsp;<br />\r\n全新Passat图片</p>\r\n<p>如果订购全景天窗，就可以创造出特别明亮的内部空间氛围；这个全新选件是为旅行轿车开发的。全新Passat提供不同的内饰色彩组合。经典&ldquo;黑&rdquo;强调大众汽车的运动观感。&ldquo;自然棕&rdquo;营造出优雅宜人的内部空间。第三种颜色&ldquo;沙漠米黄&rdquo;，源自天然，使全新Passat内部空间更宽敞。双色座椅图案可以选择&ldquo;自然棕/沙漠米黄&rdquo;（Highline）色彩组合，还可以在运动套装中选择&ldquo;松露色/黑&rdquo;（Comfortline和Trendline）。全新Passat特别版的皮革颜色设计为奢华的&ldquo;巧克力棕&rdquo;，接缝和包线渐变色采用&ldquo;胡椒米&rdquo;色。</p>\r\n<p>[NextPage][/NextPage]</p>\r\n<p><strong>动力配置：</strong></p>\r\n<p>大众汽车为全新Passat提供10款直喷发动机，每个气缸中有四个阀门。其中四款汽油发动机输出功率分别为90千瓦 / 122马力（1.4 TSI）、118千瓦 / 160马力（1.8 TSI）、155千瓦 / 211马力（2.0 TSI）和 220千瓦 / 300马力&nbsp; （V6）。性能最高的为六缸发动机，而其他汽油发动机为涡轮增压四缸发动机。</p>\r\n<p class=\"f_center\" sizset=\"67\" sizcache=\"3\" style=\"text-align: center\"><img alt=\" 大众全新PASSAT首发现场实拍\" src=\"http://img3.cache.netease.com/photo/0008/2010-09-30/550x412_6HRNDUTF46TE0008.jpg\" />&nbsp;<br />\r\n全新Passat图片</p>\r\n<p>发动机之外，全新Passat的任意一款发动机都可以搭配双离合自动变速器（DSG），而在3.6 V6发动机中，这款双离合自动变速器作为标准配置配备。</p>\r\n<p>与前代车型相比，全新Passat发动机更为强劲，但燃油经济却依然保持。以118马力的全新Passat 1.8 TSI发动机为例：开发团队将发动机的百公里综合油耗从7.4升降到了6.9*升；而二氧化碳排放值降低到每公里160克。</p>\r\n<p class=\"f_center\" sizset=\"68\" sizcache=\"3\" style=\"text-align: center\"><img alt=\" 大众全新PASSAT首发现场实拍\" src=\"http://img4.cache.netease.com/photo/0008/2010-09-30/550x412_6HRND9H846TE0008.jpg\" />&nbsp;<br />\r\n全新Passat图片</p>\r\n<p><strong>安全特性：</strong></p>\r\n<p>大众汽车在车辆安全领域再度取得了实质性进步。前代Passat车型已经在Euro-NCAP的碰撞测试中取得五星的优异成绩，而新一代车型通过一系列新设施的配备，安全系数又上新台阶：新添了自动城市紧急制动功能；Comfortline及以上车型均将疲劳检测功能作为标配。选装的ACC自适应巡航控制系统带有紧急制动功能，在极端情况下，该功能可以在时速低于30公里时独立启动，协助阻止车辆发生正面碰撞。而疲劳检测系统是大众汽车首次在本级别车型配备的功能，处于持续激活状态，可以检测到驾驶者的注意力是否分散，并通过声音信号发出警示；仪表板上也会显示视觉信息，建议驾驶员暂停驾驶，稍事休息。</p>\r\n<p class=\"f_center\" sizset=\"69\" sizcache=\"3\" style=\"text-align: center\"><img alt=\" 大众全新PASSAT首发现场实拍\" src=\"http://img4.cache.netease.com/photo/0008/2010-09-30/550x412_6HRNB3FI46TE0008.jpg\" />&nbsp;<br />\r\n全新Passat图片</p>\r\n<p>全新Passat的另一个新特性是动态车灯辅助系统。这套系统最初在新途锐上采用，现搭配双氙气大灯一起作为选件提供；采用这套系统，就可以在驾驶过程中持续使用远光灯。该系统能够通过摄像头检测前方车辆和交通状况，自动遮盖可能产生干扰眩光的照明区域，最大限度地改善了所有情况下的车行道照明问题。全新Passat是同级别中配备该系统的首款车型。而对于配备常规卤素头灯的汽车，大众汽车提供简化版自动远光控制系统&mdash;&mdash;灯光辅助系统。这套系统同样使用摄像头检测来向交通情况，根据实际情况在远光和近光之间切换，一旦对面没有来车，则会重新激活远光照明。</p>\r\n<p>最初在高尔夫GTI上采用的XDS电子横向差速锁改善了全新Passat的转向牵引能力。除了在先前车型中提供的变道辅助（车道保持辅助）系统以外，现在侧向辅助系统也被配置在全新Passat上，该系统安装在后视镜上，以闪光LED灯提请驾驶者注意车身后方或侧面的车辆情况。全新胎压监测系统会针对每一个车轮的潜在胎压损失情况发出信号，所有轮胎的压力数据还可以在仪表盘上显示。</p>\r\n<p class=\"f_center\" sizset=\"70\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"迈腾加长版无伪谍照静态评测 详细参数对比\" src=\"http://img3.cache.netease.com/auto/2010/6/9/20100609153029f5313.jpg\" /><br />\r\n点击查看国产迈腾加长版谍照</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"全新Passat官图发布 明年将国产加长版车型\" src=\"http://img4.cache.netease.com/auto/2010/9/30/20100930080406142ee.jpg\" /></p>\r\n<p>从此前曝光的一张生产线车门注释说明上，我们可以看到全新Passat的加长版车型（B7L）已经在一汽大众长春二工厂进行试生产，预计新车将于明年国内正式上市，最终版本将是基于海外版Passat的加长版车型。</p>\r\n<p>(本文来源：网易汽车 )</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('81', '<p sizset=\"96\" sizcache=\"3\"><strong>网易汽车12月28日报道</strong>&nbsp;近日，有消息称，2010款马自达5将于明年1月11日在华上市，这款车上市之后仍将在一汽马自达销售渠道销售，暂无国产计划。和之前上市的马自达8相比，这款车尺寸小了不少，主要定位于家用车市场，竞争对手锁定途安等车型。</p>\r\n<p class=\"f_center\" sizset=\"100\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"[探馆]MPV家族全面来袭 马自达5/马自达8亮相\" src=\"http://img3.cache.netease.com/photo/0008/2010-12-17/550x412_6O4DT00D4FME0008.jpg\" />&nbsp;</p>\r\n<p class=\"f_center\" sizset=\"100\" sizcache=\"3\" style=\"text-align: left\"><br />\r\n与上一代马自达5相比，2011款车型外观进行了全新的设计，整体和细节造型都与新一代的马自达系列产品相符。新前脸设计体现出马自达家族特征，&ldquo;微笑型&rdquo;的大嘴、大灯的造型以及雾灯附近的设计都与进口马自达3车型十分相似。</p>\r\n<p class=\"f_center\" sizset=\"106\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"[探馆]MPV家族全面来袭 马自达5/马自达8亮相\" src=\"http://img3.cache.netease.com/photo/0008/2010-12-17/550x412_6O4DSSA74FME0008.jpg\" />&nbsp;</p>\r\n<p>最有特点当属车身侧面线条的流动性。三条曲线构成腰线以及车门靠下的一条折线很好地展示了曾在多款马自达概念车上出现的&ldquo;流&rdquo;理念，同时也是Zoom-Zoom精神新的诠释。新一代马自达5仍然采用滑动式的后门，B、C、D全部采用黑色的隐式处理效果。</p>\r\n<p class=\"f_center\" sizset=\"107\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"[探馆]MPV家族全面来袭 马自达5/马自达8亮相\" src=\"http://img3.cache.netease.com/photo/0008/2010-12-17/550x412_6O4DSUPF4FME0008.jpg\" />&nbsp;</p>\r\n<p class=\"f_center\" sizset=\"108\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"[探馆]MPV家族全面来袭 马自达5/马自达8亮相\" src=\"http://img4.cache.netease.com/photo/0008/2010-12-17/550x412_6O4DSLH24FME0008.jpg\" />&nbsp;</p>\r\n<p>内饰方面，官图展示的新一代马自达5采用了全黑内饰，在中控台、换挡杆、方向盘和车门等部位上还配有大量银色装饰条。新增加的配置还包括了更先进的多功能方向盘和位于空调出风口上的液晶显示屏等。新一代马自达5同样拥有7个座椅，包括前两排5个固定座椅和第三排的两个可拆卸的座椅。</p>\r\n<p class=\"f_center\" sizset=\"86\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"2010款马自达5\" src=\"http://img4.cache.netease.com/photo/0008/2010-12-23/550x412_6OJ5SQLK2DH00008.jpg\" />&nbsp;</p>\r\n<p><br />\r\n&nbsp;动力方面，新车将会配备一款全新的2.0L直喷汽油发动机，这款发动将会配备发动机启动停止系统，另外还将会推出搭载1.8L汽油发动机的车型，这款发动机最大功率为115马力，最大扭矩为165Nm。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('82', '<p><strong>网易汽车10月1日巴黎车展现场报道&nbsp; </strong>&nbsp;2012款雪佛兰科帕奇改款车正式在巴黎车展上亮相，新车将拥有经过升级改动的外观和新的发动机阵容。<strong>本次亮相的2012款雪佛兰科帕奇改款车很有可能就是未来国产的科帕奇。预计国产的科帕奇在2011年底可以实现批量生产，上市时间则会在2012年初。</strong>据可靠消息称，这一产品将在上海通用北盛汽车厂（位于沈阳）生产，内部代号C140。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"确定国产 2012款雪佛兰科帕奇改款车正式亮相\" src=\"http://img3.cache.netease.com/auto/2010/10/1/20101001030443b4e4f.jpg\" /></p>\r\n<p>新款雪佛兰科帕奇的外观和内饰都将有所改动，同时还将提供三款新的发动机。新车前脸最显著的改动是一个造型极富棱角感的引擎罩和看上去大了很多的前格栅（这是由于前保险杠的尺寸缩小了）。侧面气孔如今呈现出更加富有棱角的形状，同时尾灯束也更狭窄。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"雪佛兰科帕奇\" src=\"http://img3.cache.netease.com/photo/0008/2010-10-01/550x412_6HSD9SG146TE0008.jpg\" /></p>\r\n<p>雪佛兰称，新的外观设计展现出了科帕奇的动感特性，并为该车赋予了更加运动的姿态。新车的内饰也得到了升级改动，如今采用了新的座椅布料，内饰的装饰则为该车赋予了更加高档的感觉和气质。改款科帕奇也具备了雪佛兰的其他特征，包括冰蓝色的背光和前保险杠面板的环绕式设计，该环绕式的设计一直延伸至驾驶者一侧与副驾驶一侧的车门处，从而营造出了双驾驶座舱的样式。此外，雪佛兰声称已经改进了该车的声学设计，从而将减少道路、风和发动机的噪音。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"雪佛兰科帕奇\" src=\"http://img3.cache.netease.com/photo/0008/2010-10-01/550x412_6HSD932G46TE0008.jpg\" /></p>\r\n<p>三款新的发动机是一款最大动力输出为169 bhp的2.4升汽油发动机和两款最大动力输出分别为161 bhp和181 bhp的2.2升共轨涡轮柴油机。所有的发动机都将配备一款新的6速手动或自动变速箱。</p>\r\n<p>改款科帕奇的底盘也得到了重新调整，从而改进了过弯性能、滚动特性和驾驶感受。其标准配备包括电子稳定控制系统、牵引控制系统、刹车辅助系统以及能够在坡道起步时防止车子倒退的坡道起步辅助系统。</p>\r\n<p>新车的内饰标配了Aux-in系统、USB端口和蓝牙连通性，另外该车还提供了一个配备辅助停车后视摄像头的触摸屏导航系统供消费者选配。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('83', '<p sizset=\"74\" sizcache=\"3\"><strong>网易汽车9月11日报道</strong>&nbsp;近日有媒体从上海通用消息人士处获悉，雪佛兰Camaro即大家熟悉的大黄蜂已经开始国内进口的准备工作。该人士称，大黄蜂将由上海通用汽车负责进口，前期准备工作将于近期完成，预计明年第一季度即可正式登陆中国市场。</p>\r\n<p class=\"f_center\" sizset=\"75\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"汽车之家 雪佛兰(进口) 雪佛兰camaro 2010款 变形金刚版\" src=\"http://img1.cache.netease.com/catchpic/C/C5/C54DA054A0FE6AAFE11320C73D52B142.jpg\" border=\"1\" style=\"border-left-color: black; border-bottom-color: black; border-top-color: black; border-right-color: black\" /><br />\r\n<b>&nbsp;</b></p>\r\n<p>该消息人士向网易汽车表示，大黄蜂的引进项目正在由上海通用质量部牵头，按照通用的PDI（Problems Direct Inspection）等相关指标进行国内油品路况适应性等试验。以上海通用凯迪拉克等车型的进口经验来看，一般来说，进口的大黄蜂应该需要经过适当调校才可以正式上市。目前来看，各项实验进展比较顺利，大黄蜂预计可以在明年一季度引进上市。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"汽车之家 雪佛兰(进口) 雪佛兰camaro 2010款 变形金刚版\" src=\"http://img1.cache.netease.com/catchpic/8/8D/8D8905BA0CACC389F899DDC92CE24F97.jpg\" border=\"1\" style=\"border-left-color: black; border-bottom-color: black; border-top-color: black; border-right-color: black\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"汽车之家 雪佛兰(进口) 雪佛兰camaro 2010款 变形金刚版\" src=\"http://img1.cache.netease.com/catchpic/A/A9/A96F7ED2A466AD29E79E8E5EEEFFDE41.jpg\" border=\"1\" style=\"border-left-color: black; border-bottom-color: black; border-top-color: black; border-right-color: black\" /></p>\r\n<p>该人士表示，虽然一直以来国内都有少量的进口Camaro车型在售，但因为没有官方的规范体系，这些车一直没有准确的销售价格。由上海通用正式进口以后的大黄蜂无疑在质量和价格方面进入上海通用的规范管理体系，让消费者利益得到更好的保证。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('84', '<p>对于他而言，可能比外界关注的孙王年末大战更重要的，已经是如何布局2011。在<a href=\"http://quotes.money.163.com/usstock/hq/CHN.html\">中国基金</a>行业的历史上，除王亚伟外，还没有一位基金经理，曾经创下连续两年挺入前三的记录。</p>\r\n<p>而他现在管理的基金，除了外，还多了一只华商策略精选，两只基金规模总和超过200亿元。</p>\r\n<p>&ldquo;2011年的市场肯定应该比2010年好，尽管我现在预测可能到了2010年年底时，指数未必会有太好表现，但是其间市场应该会有很多机会。&rdquo;去年12月31日下午，孙建波对理财周报记者表示。</p>\r\n<p>这也是他加冕冠军之后，接受的第一个采访。</p>\r\n<p><strong>当前市场对于通胀过于悲观，牛市2012有希望</strong></p>\r\n<p>&ldquo;现在市场对于通胀预期，有种黑云压城城欲摧的感觉，太悲观了。&rdquo;孙建波说。</p>\r\n<p>他表示，自己认为，尽管目前政府已经明确了货币政策转向，将通过多种方式控制通胀，但是政策的出台应该是前期较多较密，此后会有一个政策的观察期，在这期间，应该形成2011年的一个重要机会。</p>\r\n<p>三季度末，孙建波就明确表达过对于通胀的忧虑。他当时在季报中表示：&ldquo;由于人口、土地、环保等要素价格的再平衡，通货膨胀整体可能要上一个台阶；同时，考虑到2009年的9.6万亿的信贷余额增长，我们仍不能对通货膨胀轻言见顶回落。&rdquo;</p>\r\n<p>通货膨胀所带来的机会和压力，确实最终成为了四季度市场的一条主线。在多家基金公司的2011年策略报告中，通胀也成为新的一年可能影响市场最重要的因素。</p>\r\n<p>尽管认为通胀在压力中蕴含着新一轮的机会，但是孙建波表示，并不认可2011年可能出现牛市甚或小牛市的乐观论调。&ldquo;现在的中国经济还在一个转型期，并不具备形成牛市的基本条件。起码要等到经济转型发展方向更加明确、通货膨胀得到控制时，才有可能出现真正的牛市。&rdquo;</p>\r\n<p>因此，他表示，尽管预计2011年的市场整体好于2010年，但是年尾和年初的指数比较，可能会比较平淡。市场的机会将有节奏地、阶段性地出现。</p>\r\n<p>而他更看好的是2012年，他认为，随着中国经济发展模式改变并逐步向好，2012年的市场可能将比2011年更好，牛市更可能从2012年下半年开始。</p>\r\n<p><strong>消费估值整体偏高，战略<a target=\"_blank\" href=\"http://jingzhi.funds.hexun.com/240017.shtml\">新兴产业</a>和农业资源有机会</strong></p>\r\n<p>2010年三季度末，孙建波主要配置的主线是大消费、产业升级和通货膨胀，从行业来看，持股集中于生物医药、信息技术和机械设备。</p>\r\n<p>&ldquo;2011年，我可能会最重点关注的两块，一块是战略新兴产业中的部分行业，一块是农业、资源板块。&rdquo;孙建波说。</p>\r\n<p>和三季度相比，消费显然已经不在他重点考察的范围内。</p>\r\n<p>&ldquo;现在消费类股票整体估值已经比较高了，所以可能机会就要弱一点。&rdquo;孙建波说。</p>\r\n<p>对于他此前关注较多的机械和医药板块，孙建波则表示，仍然整体看好，但是这两个行业都需要精选个股。</p>\r\n<p>&ldquo;比如现在市场热捧的高端设备制造概念，其中确实可能会有很好的投资机会。但是首先要搞清楚，哪些行业才属于高端设备。&rdquo;孙建波说：&ldquo;我认为应该是指对中国经济真正有影响的、稀缺性的、有较高技术壁垒的产业，并不是只要是机械制造就能算高端设备制造。&rdquo;</p>\r\n<p>他表示，医药股也是一样，在整体板块长期看好的前提下，投资者需要深入研究其中的细分行业和公司，并不能盲目追随概念。</p>\r\n<p>而在同样受到热捧的战略新兴产业概念中，孙建波表示，自己依然看好智能电网、节能环保、生物育种、新材料等行业。</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>从华商盛世成长每季的投资组合来看，智能电网、节能环保、生物育种，此前都已经有所体现。尤其是生物育种和智能电网，几乎已经成为华商盛世长期重仓的品种。</p>\r\n<p>与此类似的，是农业板块，孙建波从2010年上半年就开始介入。而资源板块，则到四季度，孙建波才明确提出，要注意其中的投资机会。</p>\r\n<p>整个2010年，孙建波在一季度就大幅减持了银行为代表的周期性股票，此后一直未做过多涉入。即便在2010年10月初银行地产股反弹中，他依然没有涉入。</p>\r\n<p>&ldquo;2011年，我觉得低估值的银行板块可能会有阶段性机会，表现可能会好于地产板块。&rdquo;孙建波说。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('85', '<p sizset=\"95\" sizcache=\"3\"><strong sizset=\"95\" sizcache=\"3\">卓众汽车网12月27日报道</strong>&nbsp;在宝马家族当中，宝马1系是尺寸最小、售价最低的一款（MINI不算在内），它的外形风格硬朗，充满运动感，显然是专为年轻人准备的，不过它的售价说低也是仅仅相对于宝马品牌来说的，实际上最低配的08款120i手动挡车型的售价也要27.30万元，相当于一款B级车的顶配车型了，这样一款车可不是普通年轻白领消费得起的，这是不折不扣的&ldquo;金领&rdquo;阶层的玩物。下面我们就来看看它的用车成本如何吧。</p>\r\n<p class=\"f_center\" sizset=\"97\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"和宝马3系花费相当 宝马1系用车成本调查\" src=\"http://img3.cache.netease.com/auto/2010/12/27/2010122709563929f56.jpg\" /><br />\r\n&nbsp;</p>\r\n<p>我们计算的使用成本包括燃油费、保险、车船使用税、验车费、维修保养费、停车费、美容装饰费、交通罚款等。以上的费用中，车船使用税、验车费都是固定的，差异在于燃油费、车险（选择险种因人而异，另外不同保险公司费率也不尽相同）和保养费用，如果车主一直在4S店定期保养，保养费基本上也是固定的，另外还包括美容装饰费和其他不可预见费用（如停车费、意外维修费和交通罚款等）。我们可以得到下面的计算公式：</p>\r\n<p>用车费用=燃油费+车船使用税+车险+维修保养费+停车费+意外支出费用</p>\r\n<p><strong>1.燃油费：</strong>我们从工信部网站上公布的&ldquo;轻型汽车燃料消耗量通告&rdquo;中查到，宝马1系120i手动挡车型的综合路况油耗为8.7L/100km。当然，由于油耗与驾驶环境和驾驶者的操作习惯有很大关系，您在实际使用中的油耗可能会与此有所出入。目前，北京地区97号汽油的价格为7.37元/升，按照一年行驶2万公里计算，可以得到燃油费为：</p>\r\n<p sizset=\"102\" sizcache=\"3\">年平均行驶里程&divide;100&times;百公里油耗&times;燃油价格=20000&divide;100&times;8.7&times;7.37=<strong>12824元</strong></p>\r\n<p sizset=\"103\" sizcache=\"3\">实际上宝马120i自动挡车型的油耗还要比手动挡低一些，它与宝马3系2.0L的油耗基本一致。</p>\r\n<p sizset=\"104\" sizcache=\"3\"><strong>2.车船使用税:</strong>此项税费目前为<strong>480元,</strong>如果车船税改革方案通过的话，这一费用也将大幅度提高。</p>\r\n<p><strong>3.车险：</strong>在汽车保险方面由于投保的项目和公司不同，价格的浮动余地比较大，以新车八项全险计（以中国平安保险为例），包括交强险、第三者责任险（10万）、车辆损失险、全车盗抢险、玻璃单独破碎险、自燃损失险、车上人员责任险、不计免赔损失险，车辆的保费为<strong>8171元</strong>。</p>\r\n<p>说明：保险费用都会有相应的优惠，车主在上保险时需要&ldquo;货比三家&rdquo;，选择价格优惠，服务到位（比如上门服务、提供代步车服务等）的保险公司。</p>\r\n<p><strong>4.保养费:</strong>宝马1系的规定保养周期为1万公里，我们看到它每一次固定的常规保养项目并不多，不过保养费用确实要比不同车型高不少，换一次机油机滤的价格是820元。从下表可以得知，6万公里的总保养费用为<strong>7154元</strong>，平均每年<strong>2384元。</strong>看上去平均到每年的价格不算多，但这是以规定的1万公里的保养周期来计算的，实际使用由于环境、道路、油品情况的不同，这个周期很可能会缩短，另外，一些不定期更换的配件价格（比如火花塞等）并没有计入常规保养之内，因此这只是一个最基本的保养价格。</p>\r\n<p class=\"f_center\">\r\n<table class=\"f_table\" cellspacing=\"1\" cellpadding=\"0\" width=\"550\" align=\"center\" bgcolor=\"#000000\" border=\"0\">\r\n    <tbody>\r\n        <tr bgcolor=\"#ffcc66\">\r\n            <td align=\"center\" colspan=\"6\" height=\"40\"><b>宝马1系120i 保养明细费用清单</b></td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">公里数（km）</td>\r\n            <td align=\"center\">机油/机滤</td>\r\n            <td align=\"center\">空滤</td>\r\n            <td align=\"center\">空调滤芯</td>\r\n            <td align=\"center\">汽油滤芯</td>\r\n            <td align=\"center\" height=\"30\">费用（元）</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">10000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">820</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">20000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">820</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">30000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\" height=\"30\">1973</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">40000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">820</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">50000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">820</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">60000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\" height=\"30\">1973</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" colspan=\"6\" height=\"30\">注：表中价格包含工时费</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#ffcc66\">\r\n            <td align=\"center\" colspan=\"6\" height=\"30\">制表：卓众汽车网 www.uncars.com</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>说明：由于各地工时费标准不一，同时备件价格也会有所差异，因此不同地区的保养费会有所差异。</p>\r\n<p>除此之外，还有一些保养项目是根据情况还进行的，比如火花塞、前后制动片和刹车油等，没有特别规定多少万公里需要更换，车主可以根据行车电脑系统提示或者根据实际检测情况确定，这部分费用我们不计入常规保养费用当中。</p>\r\n<p class=\"f_center\">\r\n<table class=\"f_table\" cellspacing=\"1\" cellpadding=\"0\" width=\"550\" align=\"center\" bgcolor=\"#000000\" border=\"0\">\r\n    <tbody>\r\n        <tr bgcolor=\"#ffcc66\">\r\n            <td valign=\"middle\" align=\"center\" colspan=\"2\" height=\"40\"><b>宝马1系120i 其他配件保养费用</b></td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td valign=\"middle\" align=\"center\" bgcolor=\"#ffffff\" height=\"30\">项目</td>\r\n            <td valign=\"middle\" align=\"center\" height=\"30\">价格（元）</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td valign=\"middle\" align=\"center\" bgcolor=\"#ffffff\" height=\"30\">更换刹车油</td>\r\n            <td valign=\"middle\" align=\"center\" height=\"30\">248</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td valign=\"middle\" align=\"center\" bgcolor=\"#ffffff\" height=\"30\">更换后制动片</td>\r\n            <td valign=\"middle\" align=\"center\" height=\"30\">1637</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td valign=\"middle\" align=\"center\" bgcolor=\"#ffffff\" height=\"30\">更换前制动片</td>\r\n            <td valign=\"middle\" align=\"center\" height=\"30\">1825</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td valign=\"middle\" align=\"center\" bgcolor=\"#ffffff\" height=\"30\">更换火花塞</td>\r\n            <td valign=\"middle\" align=\"center\" height=\"30\">920</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td valign=\"middle\" align=\"center\" bgcolor=\"#ffffff\" height=\"30\">车辆检查</td>\r\n            <td valign=\"middle\" align=\"center\" height=\"30\">280</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td valign=\"middle\" align=\"center\" bgcolor=\"#ffffff\" height=\"30\">更换雨刮片</td>\r\n            <td valign=\"middle\" align=\"center\" height=\"30\">434</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#ffcc66\">\r\n            <td valign=\"middle\" align=\"center\" colspan=\"2\" height=\"30\">制表：卓众汽车网 www.uncars.com</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p>我们看到实际上宝马1系120i的保养费用与3系2.0L车型几乎没有差别，从这个角度来说，1系除了尺寸略小之外，在技术、性能方面并不低于三系，运动性方面还会更好一些。</p>\r\n<p><strong>5.停车费：</strong>停车费按照每个月100元计，一年12月就是<strong>1200元</strong>(考虑到驾驶此类轿车的人群出入的场所级别，这项费用实际只会更多）</p>\r\n<p><strong>6.意外支出费用：</strong>这一部分通常是不可预测的，比如因违反交通规则所缴纳的罚款，高速公路通过费、保险没有涉及到的索赔范围等一些不了预知性的支出，这部分因人而异，暂且就算<strong>500元</strong>吧。</p>\r\n<p><strong>综合以上费用，宝马1系08款120i手动挡车型的一年用车成本为：</strong></p>\r\n<p>燃油费+车险+车船使用税+保养费+停车费+意外支出=12824+8171+480+2384+1200+500=<strong>25559元。</strong></p>\r\n<p sizset=\"105\" sizcache=\"3\"><strong>总结：</strong>宝马1系的用车成本与3系在同一水平，但是它的尺寸仅仅相当于一款A级车，甚至在空间上还不如一般的A级车，这么看来宝马1系的目标客户定位其实要比3系更高一些，在买车、养车花费一样的情况下，买3系的人多数是想拿来用，而买1系的人多数是想拿来玩。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('86', '<p>作为国内首批社保基金管理人之一，长盛基金管理公司是一家债券投资管理能力较为突出的公司，并获得过一些奖，包括2009年度曾在这个方面获得过<a href=\"http://quotes.money.163.com/usstock/hq/CHN.html\">中国基金</a>行业的最高奖项&ldquo;金牛奖&rdquo;。该公司在发行和管理债券型基金方面有一个较为显著的特点，即到目前为止只发行二级债基，没有发行一级债基或纯债基金。在二级债基方面，成立于2008年10月8日的长盛积极配置，是一只值得广大投资者多多关注的、在绩效方面越做越好的基金。</p>\r\n<p>2009年，该基金运作的第一个完整年度，它以7.65％的净值增长率，在53只同类型基金里排名第11位。2010年，该基金的净值增长率为 15.54％，在53只二级债基里排名第1位。这个绩效，比一级债基里的2010年度绩效冠军高出了将近一个百分点。由此来看，在全部148只（含 2010年成立的）债券型基金里，该基金是2010年度的总冠军。</p>\r\n<p><a href=\"http://quotes.fund.163.com/html/080003.html\">长盛积极配置债券</a>型基金自成立以来的绩效表现能够呈现出越做越好局面，并且最终获得了子行业里的最高殊荣，从公开披露的信息情况来看，原因可能在于以下几个方面：</p>\r\n<p><strong>第一，强大的专业管理团队是良好业绩的有效保证</strong></p>\r\n<p>长盛基金管理公司固定收益团队共有七个人，实力较为雄厚，债券投资管理能力一直比较突出，旗下固定收益类产品长期以来的绩效表现始终得到业界较好的认可。</p>\r\n<p>基金经理蔡宾先生毕业于中央财经大学，获硕士学位，CFA，2004年进入基金行业，开始从事固定收益类产品的研究和管理工作。2006年2月，他正式加入长盛基金管理公司，曾任研究员、社保组合助理，投资经理等，具有较为丰富的从业经验。</p>\r\n<p><strong>第二，规模较小提供了该基金投资运作的灵活性</strong></p>\r\n<p>2010年该基金的各时点资产总值规模，不及二级债基的平均规模。该基金的规模较小，使得它在投资运作方面具有了其它很多基金难以比拟的特殊优势，即基于对基础市场<a href=\"http://quotes.money.163.com/\">行情</a>正确判断和决策基础之上高度的投资运作灵活性。</p>\r\n<p>同时，观察该基金在过去一年中的规模情况，还可以发现这样两个问题：（1）前期该基金的规模较小，很多投资者没有关注到它。从机构投资者的角度来 看，这也许有一些属于他们自己的特殊原因。（2）从第三季度起，该基金的规模开始有了显著增加的趋势，并且增加的速度越来越快，到了年底的时候已经较最低 时扩大了近10倍。这种情况清晰地表明，该基金的良好业绩正在得到投资者较为广泛的认可，包括机构投资者。</p>\r\n<p><strong>第三，债券投资严谨、积极</strong></p>\r\n<p>之所以说&ldquo;严谨&rdquo;，是从该基金控制的及其苛刻、精准的债券投资仓位情况来看的。从2009年末到2010年度的第三季度末，该基金在上述期间四个时点上的债券投资仓位分别为80.29％、80.11％、80.76％和80.09％，即四次都是&quot;80％&quot;略过一点点。</p>\r\n<p>这样长时间严密、精确的仓位控制，在基金市场上，作为研究基金时间最长的人，根据笔者的观察，可能也就仅有这只基金这么做。为什么要这么做？为了最大限度地做好股票投资。</p>\r\n<p>当然，在债券投资方面，该基金也有可圈可点之处，即&quot;积极&quot;，具体表现为：（1）在对于债券资产的总体管理方面，该基金基于对宏观形势的正确判断， 以中短期利率产品为债券投资的主要配置对象，较好地回避了过去一年里加息预期、加息过程对于债券投资收益的负面影响。（2）通过对于可转债的较为成功的投 资，为该基金获利了更多的债券投资收益。</p>\r\n<p><strong>第四，在一级市场上积极保护原持有人的利益</strong></p>\r\n<p>2010年度的11月22日和12月8日，长盛基金管理公司曾经两次发布过对于该基金在短时期内限制大额申购的公告，将日申购的上限分别确定在 200万元以内和500万元以内。当时，该公司是市场上在这个方面做的较早的公司之一，体现出了较好的社会责任意识，较为有效地保护好了原持有人的利益， 受到了媒体较多的关注。</p>\r\n<p>该基金之所以这样做，是因为在2010年下半年新股发行方式调整之后，作为积极认购新股、且运气较好的基金之一，该基金按照新的IPO制度，中签到 了很多新股。鉴于那些新股在上市之时的预期高开幅度比较大，对于该基金的净值可能会有较大幅度的提升，为了防止套利资金来摊薄收益，该基金作为率先在特定 的时点上临时限制大额申购基金之一，既积极主动地保护好了原持有人的IPO收益，也提高了自身的绩效排名，更为业内做出了较好的表率。</p>\r\n<p><strong>第五，二级市场股票投资给该基金的业绩增彩</strong></p>\r\n<p>2010年，纯债基金全年的平均净值增长率为3.38％，而长盛积极配置债券型基金全年的净值增长率为15.54％，这个超出部分的收益，应该可以被看成为该基金基于行业平均债券投资收益水平之上、在股票投资方面等所创造出的&quot;超额收益&quot;。</p>\r\n<p>该基金为二级债基，即可以投资股票一级市场和二级市场的非纯债型债券基金。该种类型基金能够在市场上得以存在的理由，就是希望通过灵活的、各类型的 股票投资，来为投资者创造出良好的股票投资收益，进而提高整个非纯债型债券基金的投资收益水平。从现在的绩效情况来看，该基金基本做到了。</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>从2009年末到2010年度第三季度末，该基金在过去四个时点上的股票投资仓位分别为16.03％、17.16％、10.38％和 9.97％。由此我们可以很清晰地看到，该基金对于大类资产配置有着较好的把握，在2010年第二季度较大幅度地降低了股票投资仓位，较为有效地规避开了 股票市场的系统性风险。从2010年第三季度开始，该基金表面上看是在季度报告披露的各个时点上配置了较低的股票投资仓位，而反映在实际的投资运作方面， 就是该基金所坚持的&quot;绝对收益&quot;理念，通过以价值投资为基础的、灵活的、相对的长期投资，来为基金持有人创造出良好的当期股票投资收益。</p>\r\n<p>也正是因为如此，使得该基金在2010年下半年的业绩排名有了显著的提升，其中在8月、9月、10月和11月这连续的四个月份里，该基金的月度业绩排名都能够在同类基金里位列前五名左右。正是这后半程的给力，最初促成了该基金2010年度的绩效显著领先表现。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('87', '<p>2010年终总结还在基金公司内展开，新基金的布局和战斗就早已拉开序幕。</p>\r\n<p>翻阅节后即将上架的基金新品，也许你会惊讶地发现，在节后的首个交易日，就有6只新品将同步抢滩新基金市场，而在节后的一周内，新基金在售的数量也将高达22只。</p>\r\n<p>新基金脚步的急切，昭示出基金公司2011年的战斗已经打响，在2011年开年，基金公司不松弦。</p>\r\n<p><strong>6只新基金节后首日登陆</strong></p>\r\n<p>通常，考虑到双节的影响，每年的1月份往往是新基金发行的淡季，基金公司的新品也会另觅良机发行。</p>\r\n<p>不过，2011年的新基金市场有些不同。就在12月，有多家基金公司发布了基金新品的公告，而选择在节后首个交易日发行的新基金数量就有5只。如果再算上先前计划于1月4日发行的易方达医疗保健基金，元旦过后的首个交易日，就有6家基金公司将同时亮出2011年新品。</p>\r\n<p>统计显示，加上选择跨年度发行的新基金，节后第一周在售的新基金数量将达到22只。</p>\r\n<p>纵观新基金名单，有招商标普金砖四国、富国上证综指ETF及联接基金、汇添富保本基金、交银信用添利基金、泰达宏利中小盘基金、易方达医疗保健和国联安货币等众多品种。就其类型来看，节后一周上架的新基金阵营，几乎涵盖了公募基金现有的全部品种。</p>\r\n<p>在气温不断下降的冬日，节后首周超过20只新基金发售让2011开年迎来了一波新基金热浪。</p>\r\n<p><strong>春节后更火</strong></p>\r\n<p>新基金发行向来就是基金公司相互较量的主阵地。2011年伊始，多家基金公司已率先打响头炮，对于投资者春节后年终红包的&ldquo;觊觎&rdquo;也是毫不掩饰。</p>\r\n<p>无论是出于尽快完善产品线布局的目的，还是来自内在创新需求等众多因素，临近春节前夕，基金公司依然是不敢松弦。</p>\r\n<p>&ldquo;新的审批制度后，各家基金报批品种的速度都很快，基金扎堆发行，渠道也很堵，档期宽松的时间还真是不好找。没有办法，硬着头皮也要上。&rdquo;某大型基金公司的工作人士向《每日经济新闻》记者表示。</p>\r\n<p>与此同时，从2010年各家基金公司交出的答卷看，剔除因种种原因未有新品入账的基金公司外，发行数只新基金成为常事，最多的发行了6只新基金。</p>\r\n<p>&ldquo;我们公司计划2011年发行4只新基金，压力还是比较大的。节后有一只新基金要发，上半年要完成3只新基金的任务。&rdquo;沪上某基金公司的销售人员坦言。</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>&ldquo;以前基金公司都要挑档期，现在大家都在使劲发，渠道根本就没有闲的时候，各家基本上就是新基金获批后，马上就进入发行。一般春节过 后，新基金市场都比较火，投资者往往会为年终红包寻找个好的出路。而在此时，选择发产品的基金公司也会增多。&rdquo;某中等规模基金公司的销售人员告诉记者。</p>\r\n<p>有分析人士则表示，新基金审批制度改革后，基金公司自身的&ldquo;贫富差距&rdquo;很难缩窄，反而会进一步扩大。就目前行业现状来看，小基金公司要扭亏，大中型基金公司也要稳步增收，而新基金发行数量及规模也都直接影响到基金公司每年的收成，和公司制订的发展目标。</p>\r\n<p>&ldquo;在新基金市场上，各家肯定不会放松。2010年的经验得失，都会促使基金公司在今年进行调整和优化。可以肯定的是，继2010年新基金数量井喷之后，2011年这样的局面仍会再次呈现，竞争程度也会更加激烈。&rdquo;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('88', '<p><strong>卓众汽车网12月8日报道</strong>&nbsp;用一辆家用车的价钱去买一辆二手的豪华轿车看上去是一个不错的选择，虽然不是新车，开着依然是十分有面子，有很多经济情况并没有那么优越的人会做出这样的选择，可是当你这么做时，你想到它的售后维修保养费用了么？虽然那些豪华二手车的车价你能接受，但所知而来的高昂用车成本你却未必吃得消。对于购买新车的人同样应该有这方面的顾虑，因为它们的养车费用着实不低！</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"一年至少5万！ 奥迪Q7用车成本调查\" src=\"http://img4.cache.netease.com/auto/2010/12/8/201012080726179028c.jpg\" /><b>&nbsp;</b></p>\r\n<p>我们就以大家喜闻乐见的奥迪Q7为例来看吧，3.6 FSI quattro 技术型新车售价87.50万，我们计算的使用成本包括燃油费、保险、车船使用税、验车费、维修保养费、停车费、美容装饰费、交通罚款等。以上的费用中，车船使用税、验车费都是固定的，差异在于燃油费、车险（选择险种因人而异，另外不同保险公司费率也不尽相同）和保养费用，如果车主一直在4S店定期保养，保养费基本上也是固定的，另外还包括美容装饰费和其他不可预见费用（如停车费、意外维修费和交通罚款等）。我们可以得到下面的计算公式：</p>\r\n<p>用车费用=燃油费+车船使用税+车险+维修保养费+停车费+意外支出费用</p>\r\n<p><strong>1.燃油费：</strong>我们从工信部网站上公布的&ldquo;轻型汽车燃料消耗量通告&rdquo;中查到，奥迪Q73.6L车型的综合路况油耗为12.9L/100km。当然，由于油耗与驾驶环境和驾驶者的操作习惯有很大关系，您在实际使用中的油耗可能会与此有所出入。目前，北京地区97号汽油的价格为7.37元/升，按照一年行驶2万公里计算，可以得到燃油费为：</p>\r\n<p>年平均行驶里程&divide;100&times;百公里油耗&times;燃油价格=20000&divide;100&times;12.9&times;7.37=<strong>19014元</strong></p>\r\n<p>我们看到，仅仅油费一项就接近了2万元，差不多相当于一款A级车一年的全部养车费用了。</p>\r\n<p><strong>2.车船使用税:</strong>此项税费目前为<strong>480元,</strong>如果车船税改革方案通过的话，这一费用也将大幅度提高。</p>\r\n<p><strong>3.车险：</strong>在汽车保险方面由于投保的项目和公司不同，价格的浮动余地比较大，以新车八项全险计（以中国平安保险为例），包括交强险、第三者责任险（10万）、车辆损失险、全车盗抢险、玻璃单独破碎险、自燃损失险、车上人员责任险、不计免赔损失险，车辆的保费为<strong>20484元</strong>。（保险费比油费还高！）</p>\r\n<p>说明：保险费用都会有相应的优惠，车主在上保险时需要&ldquo;货比三家&rdquo;，选择价格优惠，服务到位（比如上门服务、提供代步车服务等）的保险公司。</p>\r\n<p><strong>4.保养费:</strong>结合国内的实际路况和环境、油品等因素，奥迪Q7的保养周期多为7500km，无论是配件价格还是工时费，都要比普通家用车高得多，光换一次机油机滤就得2600多元。从下表可以得知，6万公里的总保养费用为<strong>28642元</strong>，平均每年<strong>9547元。</strong></p>\r\n<p class=\"f_center\">\r\n<table class=\"f_table\" cellspacing=\"1\" cellpadding=\"0\" width=\"550\" align=\"center\" bgcolor=\"#000000\" border=\"0\">\r\n    <tbody>\r\n        <tr bgcolor=\"#ffcc66\">\r\n            <td align=\"center\" colspan=\"9\" height=\"40\"><b>奥迪Q7 保养明细费用清单</b></td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">公里数（km）</td>\r\n            <td align=\"center\">机油/机滤</td>\r\n            <td align=\"center\">空滤</td>\r\n            <td align=\"center\">空调滤芯</td>\r\n            <td align=\"center\">清洗喷油嘴</td>\r\n            <td align=\"center\">清洗节气门</td>\r\n            <td align=\"center\">火花塞</td>\r\n            <td align=\"center\">汽油滤芯</td>\r\n            <td align=\"center\" height=\"30\">费用（元）</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">7500</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">2680</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">15000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">2879</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">22500</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">3640</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">30000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">4763</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">37500</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">2680</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">45000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">4060</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">52500</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">2680</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">60000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\" height=\"30\">5260</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" colspan=\"9\" height=\"30\">注：表中价格包含工时费</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#ffcc66\">\r\n            <td align=\"center\" colspan=\"9\" height=\"30\">制表：卓众汽车网 www.uncars.com</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>说明：由于各地工时费标准不一，同时备件价格也会有所差异，因此不同地区的保养费会有所差异。</p>\r\n<p><strong>5.停车费：</strong>停车费按照每个月100元计，一年12月就是<strong>1200元</strong>(考虑到驾驶此类轿车的人群出入的场所级别，这项费用实际只会更多）</p>\r\n<p><strong>6.意外支出费用：</strong>这一部分通常是不可预测的，比如因违反交通规则所缴纳的罚款，高速公路通过费、保险没有涉及到的索赔范围等一些不了预知性的支出，这部分因人而异，暂且就算<strong>500元</strong>吧。</p>\r\n<p><strong>综合以上费用，奥迪Q7 2010款3.6 FSI quattro 技术型的一年用车成本为：</strong></p>\r\n<p>燃油费+车险+车船使用税+保养费+停车费+意外支出=19014+20484+480+9547+1200+500=<strong>51225元。</strong></p>\r\n<p>超过5万元每年的养车费用实在是吾等贫民无法消受的，而这样的费用还仅仅是保守计算，停车费、意外支出费用以及考虑到车上载人之后油耗的上升潜力等诸多因素，养一辆Q7的费用还会进一步增加，而这还没有包括维修方面，进口车的维修成本不是国产车素能比拟的，再加上轮胎、刹车盘等损耗件的更换成本，这么一算一年的花销得逼近10万！这是你买车之前不得不考虑的。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('89', '<p>来自研究机构的数据显示，2011年前最后一周，有超过五成的公募基金在低迷<a href=\"http://quotes.money.163.com/\">行情</a>中开始逐步布局，逢低加仓。上周华夏旗下多只基金显示出增仓迹象，大方向把握较好的兴业全球基金旗下仓位也有所提升。</p>\r\n<p><strong>基金看市</strong></p>\r\n<p><strong>仓位变动：增持力度略大于减持</strong></p>\r\n<p>A股市场在2010年最后一个交易日强劲反弹，<a href=\"http://quotes.money.163.com/0000001.html\">上证指数</a>重新收复2800点整数关。对于2011年股市的乐观预期提振逢低买盘进场，基金年末粉饰性买盘也为市场注入向上动力。</p>\r\n<p>综合研究机构的测算数据，在上周先抑后扬的行情中，基金总体仓位平稳，不过，有超过五成基金逆势增仓。</p>\r\n<p>德圣基金研究中心仓位测算数据显示，各类以股票为主要投资方向的主动型基金仓位变化不一，总体仓位平稳，扣除期间指数变动带来的被动仓位变化后，偏股混合型基金和配置混合型基金有主动增持。</p>\r\n<p>上周基金操作分化加大，而增持力度略大于减持。德圣基金研究中心测算数据显示，扣除被动仓位变化后，上周，主动增仓的基金数量上升，117只基金主动增仓超2%，主动减仓幅度超过2%的基金为96只。</p>\r\n<p>好买基金研究中心仓位测算数据也显示，上周有五成以上的基金逆势增仓，不过增仓幅度较小，多在5个百分点以内。</p>\r\n<p>从基金公司来看，华夏系基金在仓位操作上一贯显示出先人一步的策略性眼光，德圣基金研究中心数据显示，上周华夏旗下多只基金显示出增仓迹象。而大方 向把握较好的兴业全球基金旗下仓位也有所提升。在减仓基金方面，景顺长城旗下基金减持迹象最为明显，大成、汇添富旗下部分重仓基金仓位有所下调。</p>\r\n<p><strong>策略选择：均衡布局PK主题投资</strong></p>\r\n<p>年末行情低迷，基金未在仓位上进行大的动作,而着眼于2011年布局，选择成长还是周期的方向也尚不明朗，在后市布局的策略上，不同基金公司分歧明显。</p>\r\n<p>&ldquo;如果外围环境不出现大的恶化的话，2011年一定比2010年好，下半年比上半年好。&rdquo;<a href=\"http://quotes.fund.163.com/html/270002.html\">广发稳健增长混合</a>基金经理许雪梅认为，2011年的投资机会将全面和均衡。长期经济转型所涉及的医药、消费、新兴产业，以及经济周期回归的周期性相关领域都会有较好的表现。从估值的角度、成长的角度看，中小板、<a href=\"http://money.163.com/chinext\">创业板</a>值得期待，&ldquo;黑马&rdquo;将在那些刚上市完成融资，业务扩张较快的领先企业中诞生。相对来讲，大蓝筹和周期性行业都会有所表现，而消费股很难出现像2010年这样波澜壮阔的行情。</p>\r\n<p><strong>选股：关注三大主题</strong></p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>国投瑞银基金发布的2011年投资策略报告指出，2011年A股市场的投资机会主要在于挖掘主题，依照主题的延展联接相关的行业和企业，在各类重要主题线索中，建议重点关注三大投资主题：大消费主题；新兴产业群主题；传统企业整合主题。</p>\r\n<p>国投瑞银分析指出，&ldquo;十二五&rdquo;规划的重点在于提升大众消费能力，有利于各层面消费水平的总体提升，并形成大消费概念群的投资机会；而经济结构转型的一个重点始终会围绕新兴产业群主题展开，投资者宜继续关注6大战略性新产业：<a href=\"http://quotes.money.163.com/1399941.html\">新能源</a>、新材料、生物科技、生命科学、信息网络、资源开采勘探行业。</p>\r\n<p>此外，在顺应调结构情况下，央企进入大规模国资整合阶段，2011年整合重点有望围绕机械、电子、冶金、化工等支柱产业及医药等高新技术产业中的骨干企业，投资者可以关注符合相关特征的可投资央企进行重点投资。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('90', '<p class=\"f_left\" sizset=\"74\" sizcache=\"3\"><strong>XGO汽车网11月26日报道</strong>&nbsp;一汽-大众迈腾外观大气，整车做工精致细腻，大众车在安全性、做工、操控方面还是比较有优势的，迈腾搭载的是TSI+DSG动力组合，不仅动力表现突出，动力输出与同级车相比有一定优势。在安全方面，全车10个安全气囊给予车内人员全方位的保护；无钥匙启动装置和智能无钥匙进入系统，不仅给行车安全提供了更好的保障，而且还非常得方便；10声道环绕立体声的高保真等音响系统等设备配置又提供了很好的舒适度。以下是一汽-大众迈腾的官方报价表：&nbsp;</p>\r\n<p class=\"f_left\">\r\n<table class=\"f_table\" bordercolor=\"#000000\" cellspacing=\"0\" width=\"500\" align=\"center\" border=\"1\" style=\"border-collapse: collapse\">\r\n    <tbody>\r\n        <tr>\r\n            <td align=\"center\" bgcolor=\"#e1e9ff\" colspan=\"2\" height=\"31\"><strong>一汽-大众迈腾官方价格表</strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"252\" height=\"29\">车型</td>\r\n            <td align=\"center\" width=\"252\" height=\"29\">售价（万元）</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"252\" height=\"29\">1.4TSI 标准型</td>\r\n            <td align=\"center\" width=\"252\" height=\"29\">19.38</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"252\" height=\"29\">1.4TSI 精英型</td>\r\n            <td align=\"center\" width=\"252\" height=\"29\">20.38</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"252\" height=\"29\">1.8TSI 手动舒适型</td>\r\n            <td align=\"center\" width=\"252\" height=\"29\">21.28</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"252\" height=\"29\">1.8TSI DSG舒适型</td>\r\n            <td align=\"center\" width=\"252\" height=\"29\">22.68</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"252\" height=\"29\">1.8TSI DSG豪华型</td>\r\n            <td align=\"center\" width=\"252\" height=\"29\">23.68</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"252\" height=\"29\">2.0TSI DSG舒适型</td>\r\n            <td align=\"center\" width=\"252\" height=\"29\">25.18</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"252\" height=\"29\">2.0TSI DSG豪华型</td>\r\n            <td align=\"center\" width=\"252\" height=\"29\">26.38</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" colspan=\"2\" height=\"29\">汽车点评网制表 www.xgo.com.cn</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p><strong>附言：主要以北京地区用车标准计算</strong></p>\r\n<p><strong>购车全款：我们以目前在售的一汽-大众迈腾1.4TSI精英型为参考计算</strong></p>\r\n<p>全款=车款（20.38万元）+购置税（13064元）+领取车牌照（174元）+车船税（480元）+移动证（30元）+环保卡（3元）+拓号费（40元）+三角牌（50元）+灭火器（90元）+托盘费（130元）+交强险（950元）</p>\r\n<p>今年购置税政策发生变化，现在的购置税计算公式为：购置附加税＝购车款／（1＋17％）&times; 购置税率(1.6L及以下为7.5%，其它为10%)</p>\r\n<p class=\"f_center\">\r\n<table class=\"f_table\" bordercolor=\"#000000\" cellspacing=\"0\" width=\"500\" align=\"center\" border=\"1\" style=\"border-collapse: collapse\">\r\n    <tbody>\r\n        <tr>\r\n            <td width=\"500\" bgcolor=\"#e1e9ff\" colspan=\"5\" height=\"32\">\r\n            <p><strong>一汽-大众迈腾购车全款（除商业险）</strong></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">单位（元）</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\">1.4T标准</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\">1.4T精英</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\">2.0T舒适</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\">2.0T豪华</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">指导价</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\">19.38万</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\">20.38万</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\">25.18万</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\">26.38万</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">购置税</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\">12423</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\">13064</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\">21521</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\">22547</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">领取车牌照</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"4\" height=\"29\">174</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">车船使用税</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"4\" height=\"29\">480（全年）</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">移动证</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"4\" height=\"29\">30</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">环保卡</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"4\" height=\"29\">3</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">拓号费</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"4\" height=\"29\">40</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">三角牌</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"4\" height=\"29\">50</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">灭火器</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"4\" height=\"29\">90</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">托盘费</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"4\" height=\"29\">130</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">交强险</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"4\" height=\"29\">950</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">购车全款</td>\r\n            <td align=\"center\" width=\"97\" height=\"29\"><strong>20.817万</strong></td>\r\n            <td align=\"center\" width=\"97\" height=\"29\"><strong>21.8811万</strong></td>\r\n            <td align=\"center\" width=\"97\" height=\"29\"><strong>27.5268万</strong></td>\r\n            <td align=\"center\" width=\"97\" height=\"29\"><strong>28.8294万</strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" colspan=\"5\" height=\"29\" style=\"text-align: center\">（此价格来仅供参考）</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table class=\"f_table\" bordercolor=\"#000000\" cellspacing=\"0\" width=\"500\" align=\"center\" border=\"1\" style=\"border-collapse: collapse\">\r\n    <tbody>\r\n        <tr>\r\n            <td width=\"500\" bgcolor=\"#e1e9ff\" colspan=\"4\" height=\"32\">\r\n            <p><strong>一汽-大众迈腾购车全款（除商业险）</strong></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">单位（元）</td>\r\n            <td align=\"center\" width=\"130\" height=\"29\">1.8T手动舒适</td>\r\n            <td align=\"center\" width=\"129\" height=\"29\">1.8T舒适</td>\r\n            <td align=\"center\" width=\"129\" height=\"29\">1.8T豪华</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">指导价</td>\r\n            <td align=\"center\" width=\"130\" height=\"29\">21.28</td>\r\n            <td align=\"center\" width=\"129\" height=\"29\">22.68</td>\r\n            <td align=\"center\" width=\"129\" height=\"29\">23.68</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">购置税</td>\r\n            <td align=\"center\" width=\"130\" height=\"29\">18188</td>\r\n            <td align=\"center\" width=\"129\" height=\"29\">19385</td>\r\n            <td align=\"center\" width=\"129\" height=\"29\">20239</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">领取车牌照</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"3\" height=\"29\">174</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">车船使用税</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"3\" height=\"29\">480（全年）</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">移动证</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"3\" height=\"29\">30</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">环保卡</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"3\" height=\"29\">3</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">拓号费</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"3\" height=\"29\">40</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">三角牌</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"3\" height=\"29\">50</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">灭火器</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"3\" height=\"29\">90</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">托盘费</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"3\" height=\"29\">130</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">交强险</td>\r\n            <td align=\"center\" width=\"348\" colspan=\"3\" height=\"29\">950</td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" width=\"102\" height=\"29\">购车全款</td>\r\n            <td align=\"center\" width=\"130\" height=\"29\"><strong>23.2935万</strong></td>\r\n            <td align=\"center\" width=\"129\" height=\"29\"><strong>24.8132万</strong></td>\r\n            <td align=\"center\" width=\"129\" height=\"29\"><strong>25.8986万</strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td align=\"center\" colspan=\"4\" height=\"29\" style=\"text-align: center\">（此价格来仅供参考）</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"1.4T车型最划算 迈腾每月用车成本调查\" src=\"http://img1.cache.netease.com/catchpic/6/68/68140871BB60C967B396CC49D8BB1EBE.jpg\" /></p>\r\n<p><strong>一汽-大众迈腾1.4TSI精英型需要支付的费用为：21.8811万元</strong></p>\r\n<p>&nbsp;</p>\r\n<p>用上面的公式算下来，我们入手购买一汽-大众迈腾1.4TSI精英型时需要支付的费用为21.8811万元。因此，我们在购买一汽-大众迈腾1.4TSI精英型时除了要交纳20.38万元的厂商指导价外，还要再支付15011元的费用。当然，这15011元的费用中购置税是占主导地位的。而有些经销商利用赠送部分购置税的方式来卖车，其实也是一种优惠方式。下面我们为大家带来一汽-大众迈腾用车成本细算。</p>\r\n<p><strong>一年用车成本细算：</strong>用车成本=燃油费+车船使用税（固定）+验车费（固定）+车险+维修保养费+意外支出费用</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('91', '<p sizset=\"74\" sizcache=\"3\"><strong>卓众汽车网11月22日报道</strong>&nbsp;低廉的价格和高级的配置是自主品牌轿车赢得市场的一大法宝，在售价8万元左右的比亚迪G3身上居然非常&ldquo;给力&rdquo;的全系标配了20万元以上级别车型才会较多装备的无钥匙启动系统，看上去性价比很高，不过形成鲜明对比的是关系到乘客安全的前排气囊却没有做到没有做到全系标配，有点抓住芝麻丢了西瓜的感觉。当然，自主品牌在目前阶段要想成功靠的还是经济性，除了车价要低，售后的使用、养护成本也要低，下面我们就来看看比亚迪G3一年的用车成本如何。</p>\r\n<p class=\"f_center\" sizset=\"75\" sizcache=\"3\" style=\"text-align: center\"><img alt=\"一年花费1.6万元 比亚迪G3用车成本调查\" src=\"http://img4.cache.netease.com/auto/2010/11/22/20101122094815b7a93.jpg\" /><b>&nbsp;</b><br />\r\n&nbsp;</p>\r\n<p>我们以售价8.09万元的2011款比亚迪G3 1.5MT数智版豪雅型为例，计算的使用成本包括燃油费、保险、车船使用税、验车费、维修保养费、停车费、美容装饰费、交通罚款等。以上的费用中，车船使用税、验车费都是固定的，差异在于燃油费、车险（选择险种因人而异，另外不同保险公司费率也不尽相同）和保养费用，如果车主一直在4S店定期保养，保养费基本上也是固定的，另外还包括美容装饰费和其他不可预见费用（如停车费、意外维修费和交通罚款等）。我们可以的带下面的计算公式：</p>\r\n<p>用车费用=燃油费+车船使用税+车险+维修保养费+停车费+意外支出费用</p>\r\n<p><strong>1.燃油费：</strong>我们从工信部网站上公布的&ldquo;轻型汽车燃料消耗量通告&rdquo;中查到，比亚迪G31.5L手动挡车型的综合路况油耗为6.5L/100km，还算是相当省油的。当然，由于油耗与驾驶环境和驾驶者的操作习惯有很大关系，您在实际使用中的油耗可能会与此有所出入。目前，北京地区93号汽油的价格为6.92元/升，按照一年行驶2万公里计算，可以得到燃油费为：</p>\r\n<p sizset=\"80\" sizcache=\"3\">年平均行驶里程&divide;100&times;百公里油耗&times;燃油价格=20000&divide;100&times;6.5&times;6.92=<strong>8996元</strong></p>\r\n<p><strong>2.车船使用税:</strong>此项税费目前为<strong>480元</strong>。</p>\r\n<p><strong>3.车险：</strong>在汽车保险方面由于投保的项目和公司不同，价格的浮动余地比较大，以新车八项全险计（以中国平安保险为例），包括交强险、第三者责任险（10万）、车辆损失险、全车盗抢险、玻璃单独破碎险、自燃损失险、车上人员责任险、不计免赔损失险，车辆的保费为<strong>4335元</strong>。</p>\r\n<p>说明：保险费用都会有相应的优惠，车主在上保险时需要&ldquo;货比三家&rdquo;，选择价格优惠，服务到位（比如上门服务、提供代步车服务等）的保险公司。</p>\r\n<p><strong>4.保养费:</strong>与大多数国产车型一样，比亚迪G3的保养周期为5000km，首保免费，从下表中我们可以看到，与合资车型相比，G3每次保养要做的项目很多，像汽滤、变速箱油、助力转向油等项目在许多车型上的保养周期是非常长的，而G3则要更换的更加频繁，不过G3配件的价格却相对低廉，所以总费用并不高，6万公里的总保养费用为3477元，平均每年<strong>1159元。</strong></p>\r\n<p class=\"f_center\">\r\n<table class=\"f_table\" cellspacing=\"1\" cellpadding=\"0\" width=\"550\" align=\"center\" bgcolor=\"#000000\" border=\"0\">\r\n    <tbody>\r\n        <tr bgcolor=\"#ffcc66\">\r\n            <td align=\"center\" colspan=\"10\" height=\"40\"><b>比亚迪G3 保养明细费用清单</b></td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">公里数（km）</td>\r\n            <td align=\"center\">机油/机滤</td>\r\n            <td align=\"center\">空滤</td>\r\n            <td align=\"center\">空调滤芯</td>\r\n            <td align=\"center\">汽油滤芯</td>\r\n            <td align=\"center\">刹车油</td>\r\n            <td align=\"center\">变速箱油</td>\r\n            <td align=\"center\">转向助力油</td>\r\n            <td align=\"center\">火花塞</td>\r\n            <td align=\"center\" height=\"30\">费用（元）</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">5000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">首保免费</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">10000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">279</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">15000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">150</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">20000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">603</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">25000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">150</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">30000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\" height=\"30\">320</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">35000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">150</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">40000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">603</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">45000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">150</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">50000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">279</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">55000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\">-</td>\r\n            <td align=\"center\" height=\"30\">150</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">60000</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\">●</td>\r\n            <td align=\"center\" height=\"30\">643</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#edf5ff\">\r\n            <td align=\"center\" bgcolor=\"#ffffff\" colspan=\"10\" height=\"30\">注：表中价格包含工时费</td>\r\n        </tr>\r\n        <tr align=\"center\" bgcolor=\"#ffcc66\">\r\n            <td align=\"center\" colspan=\"10\" height=\"30\">制表：卓众汽车网 www.uncars.com</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>说明：由于各地工时费标准不一，同时备件价格也会有所差异，因此不同地区的保养费会有所差异。</p>\r\n<p><strong>5.停车费：</strong>停车费按照每个月100元计，一年12月就是<strong>1200元</strong>。这笔开销也不算小啊！</p>\r\n<p><strong>6.意外支出费用：</strong>这一部分通常是不可预测的，比如因违反交通规则所缴纳的罚款，高速公路通过费、保险没有涉及到的索赔范围等一些不了预知性的支出，这部分因人而异，暂且就算<strong>500元</strong>吧。</p>\r\n<p><strong>综合以上费用，2011款比亚迪G3 1.5MT数智版豪雅型的一年用车成本为：</strong></p>\r\n<p>燃油费+车险+车船使用税+保养费+停车费+意外支出=8996+4335+480+1159+1200+500=<strong>16670元。</strong></p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('92', '<p sizcache=\"3\" sizset=\"73\"><strong>网上车市11月4日报道 </strong>在今年十月末旬，<font size=\"+0\" sizcache=\"3\" sizset=\"73\">宝来</font>推出了最新的运动款1.4Tsport line。同时除了最新的sport line其余全系都有现金达6000元的优惠。有很多朋友已经开上了心仪的宝来轿车，但也有很多朋友正在考虑是否选择宝来，对于购买一部宝来的前期投入虽然可观，但是日后的<font size=\"+0\">保养</font>成本同样需要我们精打细算，那么下面我们就为您算一下养一部宝来轿车需要多少钱。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"到底谁更省 宝来1.4T与1.6保养费用调查\" src=\"http://img1.cache.netease.com/catchpic/1/13/1363E3C0CBB7964B3CB1252A9F385179.jpg\" /></p>\r\n<p sizcache=\"3\" sizset=\"74\">在<font size=\"+0\">一汽</font>大众推出新宝来1.4T时曾经表示，1.4T引擎不会给车友在售后保养增加上面太多压力，到底会不会给车友带来售后维护上面的经济压力呢，编辑近期采访了大众4S店有关技术人员，详情请见下表：</p>\r\n<p><strong>两款<font size=\"+0\">车型</font>在保养方面有何不同</strong></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"到底谁更省 宝来1.4T与1.6保养费用调查\" src=\"http://img1.cache.netease.com/catchpic/2/2B/2B8A02C68566A26DB9788921AFAE1FB2.jpg\" /></p>\r\n<p><strong>宝来1.4T也可加半合成机油，但4S店方面建议添加全合成机油</strong></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"到底谁更省 宝来1.4T与1.6保养费用调查\" src=\"http://img1.cache.netease.com/catchpic/A/A8/A863B03386886DFE8EA02812B0D1A984.jpg\" /></p>\r\n<p>宝来1.4T与宝来1.6在保养方面的不同主要在于保养周期不一样，根据4S店有关技术人员表示宝来1.4T首保为5000公里一保养，往后是1万公里一保养，宝来1.6为均匀的7500公里一保养。这样算下来的话，两辆车共以跑6万公里计算，1.4T车型和1.6自然进气车型分别进4S店的次数为5次与8次，每次保养都有机油滤清器与机油不同而产生的差价。</p>\r\n<p><strong>两款车型6万公里普通保养花费</strong></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"到底谁更省 宝来1.4T与1.6保养费用调查\" src=\"http://img1.cache.netease.com/catchpic/2/2B/2B111F905DF577659005224EBBC6CEED.jpg\" /></p>\r\n<p sizcache=\"3\" sizset=\"75\">我们以一辆私家车正常行驶一年平均行驶里程2万公里计算，三年的时间大致会行驶至6万公里。宝来1.4T在跑完6万公里时一共会进4S店保养5次总共花的费用为2635元，平均到每个月的花费为73元。宝来1.6行驶6万公里时共进4S店保养8次，总共费用为2272元，平均每个月保养费用63元，可以看出宝来1.4T并没有比宝来1.6在售后保养方面贵很多。</p>\r\n<p><strong>宝来售后保养配件<font size=\"+0\">价格</font>一览</strong></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"到底谁更省 宝来1.4T与1.6保养费用调查\" src=\"http://img1.cache.netease.com/catchpic/1/10/10F1CA64A06F972AF7BABB665FEA3C29.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>购买宝来1.4T的用户需要在5000公里时返回4S店进行首次保养。首次保养时您无需自掏腰包，因为这次保养是厂家赠送的。在随后的每10000公里保养过程中，最常见的花费为机油与三滤，再加上宝来1.4T所加的机油为全合成机油，这些费用总和在527元左右。宝来1.6需要7500公里时返回4S店做第一次保养，随后也是每7500返回一次，常见费用总和为358元。</p>\r\n<p>宝来1.4T保养费虽比宝来1.6的费用要<font size=\"+0\">高</font>，但是在保养次数方面却比宝来1.6好的多，给车友在日常保养中减少了很多麻烦。此外宝来1.4T是一款小<font size=\"+0\">排量</font>涡轮增压发动机在燃油经济性方面比宝来1.6要更好，但是宝来1.4T的售价比宝来1.6要高出1万左右，所以到底买哪款车您不妨在自己的心里盘算盘算。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('93', '<p>回眸2010年投资理财市场，最给力的一个词，当仁不让地应属&ldquo;涨价&rdquo;。</p>\r\n<p>　　农产品以&ldquo;蒜你狠&rdquo;为急先锋拉开价格狂飚的前奏，金价一年内涨幅超过了40%，铜创出历史新高，翡翠价格翻了3番，艺术品连续拍出天价，就连潜伏13年一直波澜不兴的邮票市场也在2010年大发虎威&hellip;&hellip;</p>\r\n<p>　　不过，对于大多数人来说，在这个遍地涨价的时代里，要想赚钱真的很难。股市上上下下没有涨起来不说，摆在普通人面前更现实的问题是，CPI高企，&ldquo;负利率时代&rdquo;我们把钱存在银行完全在赔钱。</p>\r\n<p>　　2011年的投资春天正大踏步地向我们走来。让我们一起寻找生财之路，</p>\r\n<p>　　发出投资理财的最强音：就是要幸福，就是要赚钱。</p>\r\n<p>　 　眨眨眼睛的功夫，&ldquo;涨声响起来&rdquo;的2010年就要和我们说再见。在这逝去的一年里，你们也就是我们最亲爱、最忠诚的读者朋友，和我们一起亲身见证了这一 年里国内外投资理财市场发生的诸多震撼心灵的大事，分享了我们一路走来的诸多投资理财心得。先哲们说过这样一句话：忘记历史就意味着背叛。在我们跨入 2011 年之时，让我们还是先回顾一下2010年投资理财市场发生的一些大事，以便我们能够吸取2010年的投资得失，为2011年的投资理财开好局。</p>\r\n<p>　 　回眸2010年投资理财市场，最给力的一个词，当仁不让地应属&ldquo;涨价&rdquo;。2010年，我们被四面八方风起云涌的涨价风暴所惊骇。农产品以&ldquo;蒜你狠&rdquo;为急 先锋，拉开了价格狂飚的前奏，从此以后，&ldquo;豆你玩&rdquo;、&ldquo;姜你军&rdquo;&ldquo;糖高宗&rdquo;、&ldquo;棉花疯&rdquo;继往开来，似乎价格不翻个筋斗，就对不起国人似的。农产品价格的上 涨打开了&ldquo;潘朵拉盒子&rdquo;，在它的示范效应下，黄金一年之内的涨幅超过了40%，中药材的涨幅翻了一番，铜创出了历史最高价，翡翠价格翻了3番，就连以往艺 术品拍卖会上少人问津的名家书法作品也连续拍出了天价，更有甚者，潜伏13年一直波澜不兴的邮票市场也在2010年大发虎威，让饱经投资理财市场风雨历练 的投资者不得不发出别样的感慨：这是一个涨价的年代，这是一个疯狂的年代。</p>\r\n<p>　　此起彼伏的涨价风暴，把2010年11月的CPI推到了 5.1%这个28个月以来的新高水平，而银行一年期存款利率水平年内仅两次各微调了0.25%至2.75%，银行理财产品的年化收益率也仅仅是在3%附近 徘徊。负利率时代，让我们把财富增长的希望不得不寄托在投资理财上，因为只有理财，财才会理你。</p>\r\n<p>　　在选择新年特刊的给力词上，本刊编辑部的同仁们也是各抒己见，辩论十分激烈。最后灵机一动的，则是近期热播的电视节目《就是要幸福》给了我们灵感。</p>\r\n<p>　 　幸福，离开了物质的支撑，在如今这个遍地涨价的时代里，要想获得它，真的很难。《就是要幸福》的前提基础之一，就是要赚钱。这个主题词虽然看上去有点下 里巴人的味道，不怎么阳春白雪，不那么含蓄，但是很实在，很实用。为此，我们在回顾2010年投资理财市场风风雨雨的基础之上，对2011年可能存在的投 资机会和投资领域，进行了一番颇有力度的专业化梳理，期望我们的读者能够根据自己的投资理财偏好进行针对性投资理财，和国家制定的&ldquo;十二五&rdquo;规划一样，打 好 2011年的开局之年。</p>\r\n<p>　　2010年，你在投资理财方面也许小有斩获，也许大捞一把，也许有点亏空。不过，俱往矣，2010年已经成为过去时，2011年的投资春天正大踏步地向我们走来。让我们面对21世纪的第二个十年，发出投资理财的最强音：就是要幸福，就是要赚钱。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('94', '<p class=\"f_center\" style=\"text-align: center\"><img alt=\"周鸿祎：未来一定会离开360 转向天使投资\" src=\"http://img3.cache.netease.com/tech/2011/1/4/20110104095622bc8b9.jpg\" /><br />\r\n&nbsp;</p>\r\n<p>理财周报见习记者 冀欣/文</p>\r\n<p><b>3721留下的惨痛教训</b></p>\r\n<p>理财周报：在你做了这么长时间安全软件之后，仍然有很多人在质疑你当初&ldquo;3721&rdquo;的创业史，有什么感想？</p>\r\n<p>周鸿祎：其实我已经摆脱了3721的影响，现在中国几亿用户选择360就是对我最大的肯定。马化腾和李彦宏都做过流氓软件，中国屁股不干净的互联网公司多了，但不能因为一个人犯过一次错误就永远把他看成一个坏蛋。这些年我积极的向用户致歉并努力弥补，也许我不做360，大家都会淡忘这段过去。但我后来选择做安全软件，与流氓软件作斗争，这就触及了很多人的既得利益，所以他们才会无休止的翻旧账。我要真是一个坏人，这么多年应该有很多事可以说，但是翻过来倒过去就是3721那点事，因为我没有什么别的污点。</p>\r\n<p>理财周报：3721这段经历给你最大的教训是什么？</p>\r\n<p>周鸿祎：无论你有多好的技术，有多聪明的头脑，也必须要重视用户体验，不能得罪用户，一旦有了一个污点，确实需要很长时间来洗刷和纠正。也正是因为在3721上吸取了教训，我现在有些矫枉过正，我做360会极端重视用户利益，这才让360得到了众多网民的肯定，某种程度上来说，没有3721其实也就没有今天的360。</p>\r\n<p><b>自认为是悲情英雄</b></p>\r\n<p>理财周报：创办360的初衷更多是基于商业考虑还是理想主义？</p>\r\n<p>周鸿祎：做360最需要的不是技术而是勇气，我们做的是断人财路的事，如果没有理想主义情怀那确实不敢做。我们应该把自己做的事情看成一半是现实商业，一半是理想公益。虽然在现实商业中我们可能并没有取得伟大的成功，但是我们保护了广大网民，到哪都有我的用户，这样的成就感是单纯的商业利益无法满足的。</p>\r\n<p>理财周报：你总提到&ldquo;英雄&rdquo;这个词，觉得自己现在是英雄吗？</p>\r\n<p>周鸿祎：照世俗的标准我确实不是英雄，但我敢做对社会有益的事，敢说别人不敢说的话，追求自己的理想，我是一个有英雄情结并努力想成为一个英雄的人，但我们这种理想主义出发的人往往缺乏手腕和城府、不太懂人情世故，最后都会成为悲情英雄。</p>\r\n<p>现在为什么缺少创新，就是因为大家都以成败论英雄，我特别不赞同这种观点。创新意味着你失败的几率也很大，但是失败的英雄也是英雄。太多创业者不敢创新，经不起失败，所以等别人去做，他们再出手收拾残局。他们的观念是，管他什么手段，只要挣钱，就是英雄。我认为这叫&ldquo;成功的商人&rdquo;，不叫英雄。</p>\r\n<p>理财周报：英雄主义情结为你的企业管理会带来哪些正面或者负面的影响？</p>\r\n<p>周鸿祎：我确实是个有英雄主义情结的人，这让我和我的企业不屑于简单的模仿，敢于创新，敢做别人不敢做的事。负面的影响当然也有，那就是我可能不太在乎公司的收入，甚至会为了理想放弃一部分收入，这让我难以做到商业意义上的巨大成功。另外这样的英雄主义情结会让自己在现实中碰壁，被围殴，甚至被打击得遍体鳞伤。</p>\r\n<p><b>&ldquo;今后说话会注意一点&rdquo;</b></p>\r\n<p>理财周报：在行业内有如此多&ldquo;对头&rdquo;，不怕360被置于死地吗？</p>\r\n<p>周鸿祎：在我们被骂得最凶的时候，我确实感觉我们快要被骂死了，可能做不起来了。但后来我们发现，平时沉默的用户，其实很清楚谁做的是对他们有益的事情，他们用脚投票，360的用户量迅速成长。所以只要你不是为了</p>\r\n<p>一己私利，而是为了用户利益得罪了同行，就算一时被骂得狗血喷头，但最后还是能够走出来。在中国的互联网业，一旦你赢得了用户的支持，就能顶住一切。</p>\r\n<p>理财周报：有报道说，历次争端你其实都预先进行了细致的沙盘推演，是这样吗？</p>\r\n<p>周鸿祎：很多人都把我想得城府很深，其实我根本没做什么谋划，也不愿意想那么多，况且计划也永远赶不上变化。我其实一直都是从用户角度出发，做用户需要的东西，没想到引爆了一个火药桶，得罪了那么多人，大家都来围攻我，而我都是被迫应战的，只能硬着头皮上，没有别的选择。</p>\r\n<p>理财周报：在经历了这么多纷纷扰扰之后，你有没有进行过反思？</p>\r\n<p>周鸿祎：人都是要走向成熟的，过去的我可能太心直口快了，说话又喜欢举例子，说哪家公司做得不太好，不小心就得罪了很多公司，以后在这方面可能会注意一点。更重要的是，无论和同行怎么拉扯，都不能把用户的利益搭进去，用户永远是最重要的。对于3Q大战，我不想说太多，360目前能做的事只有两件，第一，不管别人怎么说,先自己反思；第二；继续奉行为用户做好产品,做免费的好产品策略,余下的都是浮云。</p>\r\n<p>理财周报：如果要给马化腾带句话，你想对他说什么？</p>\r\n<p>周鸿祎：马化腾一直在商业上做得很好，但是出了这件事后，我想跟他说，我们互相抱怨和推卸责任已经没有用了，用户的利益已经受到了损伤。如果腾讯能从这件事中吸取一定教训，做出一些改变，那对它未来的发展也是很有利的，坏事也就变成好事了。</p>\r\n<p><b>最好的朋友是丁磊</b></p>\r\n<p>理财周报：你心目中的英雄是谁？</p>\r\n<p>周鸿祎：乔布斯是我的榜样，他一生中干了很多事，每一件事都改变了时代。当年苹果机改变了个人电脑，OS改变了图形环境，成为windows前身。iPod、iTouch改变了唱片业，投资皮克斯改变了动画工业，iPhone改变了手机移动领域，做iPad又颠覆了平板传统的笔记本。如果能达到类似这样的一种成就，我觉得自己就能获得心灵的安宁了。</p>\r\n<p>理财周报：你的&ldquo;仇人&rdquo;很多，那在互联网业界，你的朋友是谁？</p>\r\n<p>周鸿祎：我和丁磊（网易公司创始人）关系不错，他也是做技术出身，对技术的细节比较关注，没有太大的野心，不想搭建帝国，不做作不虚伪，也不管别人怎么看，他只想做自己喜欢做的事，比如养猪。我和王雷雷（TOM.COM中国区运营总经理）也是好朋友，他虽然是高干子弟出身，但工作非常拼命，对产品细节非常用心。</p>\r\n<p>理财周报：你指责的对象很多，在业内你最敬佩的企业家是谁？</p>\r\n<p>周鸿祎：任正非，我觉得华为一直在脚踏实地的投入研发，他的对手都不是小公司，而他敢于跟他们竞争，而且也是国内少数能与国外大公司竞争的公司之一，这种胸怀和气魄是我很欣赏的。</p>\r\n<p>理财周报：在你的创业生涯中影响最大的是谁？</p>\r\n<p>周鸿祎：我的投资人王功权，他是爱憎非常分明的人，有意见一定要表达，而且非常尖锐，入木三分，也鼓励我鲜明的表达立场。他曾是万通六君子之一，有一套方法论，对人很有洞察力，对做企业也很了解，经验非常丰富。奇虎在早期没做360之前，做了很多不专注的东西，他就跟我说，你现在做了搜索，越做越像百度，你又做了一个门户，越做越像新浪，这从一个旁观者的角度一下把我给点醒了，让我反思到底错在哪里，并最终找到了正确的方向。</p>\r\n<p><b>&ldquo;未来一定会离开360&rdquo;</b></p>\r\n<p>理财周报：未来360的发展方向是什么？</p>\r\n<p>周鸿祎：很多市值很高的互联网公司，我却看不起他们，他们没有价值观，疯狂遏制创新企业，什么广告都敢接，顶多是一个会赚钱的公司，但他们没法赢得用户的尊重。我希望360能成为像google一样受人尊敬的伟大公司。企业发展到一定阶段，就应该考虑如何在自己的行业领域内，做对社会有益的事情。先去不择手段的赚钱再去做慈善买个好名声是很虚伪的。</p>\r\n<p>理财周报：听说您还有一重身份是天使投资人？</p>\r\n<p>周鸿祎：比起做企业，风险投资是一个真正能长久干下去、产生价值的工作。所以我坚持利用360的资源和资金，扶持一些早期的公司。支持年轻人的小公司起来颠覆大公司的游戏规则，这是我最喜欢做的。我创业十几年，有很多成功或失败的经验和教训，都可以提供给他们，帮助他们少走弯路，更好的发展。</p>\r\n<p>理财周报：投资的回报情况怎么样？</p>\r\n<p>&nbsp;</p>\r\n<p>周鸿祎：如果你做天使投资是期望获得很高的回报，那你恐怕会失望。我投资的好多项目都血本无归，全当做公益了。在我做的投资中，有三分之一的项目是失败的，但也有迅雷、酷狗、discuz等一批成功企业。从概率上来讲，投10个公司总会有一个成功，那成本也就收回来了。</p>\r\n<p>理财周报：未来有没有可能离开360，只专心的做天使投资？</p>\r\n<p>周鸿祎：我觉得一定会是这样，我一直相信，互联网的未来是属于年轻人的，随着我们年纪慢慢变大，对互联网的感觉会越来越不敏锐，对新生代用户会越来越把握不了。我们已经在提拔年轻的80后管理人才，要承认自己不能永远立在潮头浪尖，要去扶持年轻一代，我的性格让我很难变成那种传统意义上所谓伟大的企业家，那也不是我的梦想，我更愿意将来去做天使投资人。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('95', '<p>网易科技讯 1月3日消息，据国外媒体报道，高盛和DST已经联合向美国著名社交网站Facebook注资4.5亿美元，由此Facebook的市场估值已经突破500亿美元，高于时代华纳、eBay以及雅虎等媒体巨头。</p>\r\n<p>Facebook首席执行官马克&middot;扎克伯格此前一直表示Facebook将不会募股上市，但是近日一系列媒体报道都显示网站将于2012年内实施IPO。</p>\r\n<p>&nbsp;</p>\r\n<p>根据Facebook与高盛方面签订的协议，高盛公司向前者注资4.5亿美元，来自俄罗斯的投资公司Digital Sky Technologies 将向Facebook投资5000万美元的资金，而此前Digital Sky Technologies对于Facebook的投资额已经超过4亿美元。此外，高盛公司或将向Digital Sky Technologies 出售其所持有的Facebook价值约7500万美元的股份。</p>\r\n<p>Digital Sky Technologies 目前在Facebook其所持有的股份大约估价在100亿美元左右，而这比当初其所投入的资金已经超出四倍之多。（霍珊）</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('96', '<p>　2011年理财：炒啥能赚钱</p>\r\n<p>　　记者李彦 包慧 李泽玲 通讯员刘诚</p>\r\n<p>　　2010年的最后一周央行再次加息，似乎给2011年的宏观经济政策定下了基调：收紧资金、抵御通胀。</p>\r\n<p>　　&ldquo;2011年市民理财仍应以短期为主。&rdquo;银行理财人士纷纷表示，在加息背景下，不宜进行长期投资，以免收益因加息而打折。同时，国家为控制通胀，资金面会进一步收紧，贷款买房、买商铺的难度和成本可能还会加大，不动产投资需谨慎。</p>\r\n<p>　　<span style=\"font-weight: bold;\">短期投资首选理财产品</span></p>\r\n<p>　　上周，记者在本地多家银行网点看到，银行新发的理财产品预期收益率普遍高于加息前产品，特别是一些信托产品和债券、货币市场类产品，上调明显。</p>\r\n<p>　 　招商银行武汉分行财富管理中心负责人雷静称，很多银行理财产品的收益都会随着利率的调整而变化，在加息预期下，投资者应尽量选择投资期比较短的理财产 品，一旦加息，便于转而购买收益更高的新发产品。相比之下，长期投资意味着锁定了之前相对较低的收益，而无法分享到加息带来的利益，绝非明智之举。</p>\r\n<p>　　为加大投资者资金灵活性，银行也不约而同增加了短期理财产品的发售。金融界网站金融产品研究中心提供的数据显示，去年最后一周，各家商业银行新发的理财产品中，投资期一个月以内的占到一半左右，半年以内的产品占比更是高达86%以上。</p>\r\n<p>　　<span style=\"font-weight: bold;\">炒股、炒房小心政策风险</span></p>\r\n<p>　 　&ldquo;今年，炒股、炒房需要注意政策风险。&rdquo;民生银行硚口支行国际金融理财师詹丹英称，虽然有专业人士预计，在经历了两三年不温不火的行情后，股市今年可能 再现牛市，但加息、上调存款准备金率、资金面收紧等政策，对股市都是利空，A股市场今年走势如何很难预料；同时，限贷、利率上浮、信贷紧缩等政策，也会对 住房、商铺等不动产投资产生影响。</p>\r\n<p>　　工商银行三八支行行长、国际金融理财师杨柳认为，今年投资不动产仍是首选地段。一些地段好、品质优的 住房，虽然目前价位较高，但上升空间更大，投资收益更高；投资商铺同样需要选择地段好且比较成熟的商圈，可以租出好价钱，资金回笼较快。她同时表示，投资 不动产对资金量要求很高，普通市民切忌砸锅卖铁买房、买商铺。</p>\r\n<p>　<span style=\"font-weight: bold;\">金价银价：会继续飞</span></p>\r\n<p>　　黄金白银走过了辉煌的2010年，2011年金价银价有望继续飞．</p>\r\n<p>　　兴业银行武汉分行黄金外汇交易中心分析师邹晖预测，金价在整个2011年将震荡走强，预计金价将向1500美元／盎司、1600美元/盎司、1750美元/盎司发起冲击。按照惯例，预计在今年的8月左右，伴随市场再度渐入消费旺季，金价将会再次进行快速上涨。</p>\r\n<p>　 　国家注册高级黄金分析师刘赚军认为，2010年黄金价格高调上行，改变了前几年价格年均上涨25~30%后回落、等待来年价格再次上行的规律，一直以强 势表现吸引眼球。然而，一些新的因素在发生变化。在全球黄金储存量日益减少，更多的投资投机资金涌入市场的情况下，2011年黄金和白银市场有机会走出超 过以往规律的涨跌幅。</p>\r\n<p>　　他预计年初在东亚局势的短期影响下，黄金白银价格会维持高位强势，但在上涨过后会出现较大幅度回落，警惕一月中旬的价格波动。而下半年世界经济如果再次走弱，黄金白银价格还会涨声响起。</p>\r\n<p>　　<span style=\"font-weight: bold;\">分红险：投资保障两不误</span></p>\r\n<p>　 　单论收益，分红险可能比不上其他投资渠道，但其&ldquo;保障+投资&rdquo;的特性却是其他产品无法比拟的。自从2009年新《保险法》实施以后，保险公司的投资渠道 拓宽，不动产、债券、股票等均可涉足。岁末年初，保险公司纷纷推出很多全新产品，在提供保障的同时，也通过各种投资渠道帮客户抵御通胀。</p>\r\n<p>　 　以太平人寿&ldquo;财富定投两全保险&rdquo;为例，不仅保留了以往分红保险的年年分红、累积生息、定期返还等功能，还开创了返本还增额分红的先河，保证了资金运作的 灵活性、财富增值的稳健性，同时帮助客户规划养老生活，实现资产保值增值，使投资资金能最大限度抵御通胀。特别对于企业经营者，能有效将企业风险和个人家 庭财务风险进行隔离，达到良好的个人财富传承效果。</p>\r\n<p>　　<span style=\"font-weight: bold;\">做好家庭资产配置很重要</span></p>\r\n<p>　　投资理财不是千篇一律的算术公式，对不同层次的投资者，不同的家庭，需要采取不同的投资策略，做好资产配置。</p>\r\n<p>　　詹丹英称，连续两次加息后，老年人可选择将闲钱存三年以上定期，长期来看，利息比较可观；对于普通年轻家庭来说，则可适当购买保险，并配置黄金、理财产品、基金和基金定投；300万元以上的大客户还可购买银行刚刚推出的定向增发产品，年收益在20%左右。</p>\r\n<p><span id=\"Content\" style=\"line-height: 23px; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style=\"font-size: larger;\"><span id=\"Content\" style=\"line-height: 23px;\">杨柳则认为，不同的投资环境下，家庭资产配比也应有所调整。就像巴菲特的那句投资名言所说，在市场行情持续火热，投资者趋之若鹜时，应减少股票、基金等投资，规避潜在的风险；而在市场持续低迷，投资者反应冷淡时，反而应加大风险投资，果断抄底博取高收益。</span></span></p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('97', '<p>本报讯(记者李斌)昨天，网易宣布推出网易机票业务(http://jipiao.163.com)，目前该业务已在网易通行证、网易商城、网易博客中上线，即日起，用户便可通过这一渠道在线预订国内各大航空公司的航班。据悉，网易是国内首家进军机票在线销售领域的门户网站，这也是继开通彩票、团购等站点后，网易再次涉足电子商务领域。</p>\r\n<p>&nbsp;</p>\r\n<p>网易机票产品经理朱静波表示，低价和高品质服务是网易机票业务的两张王牌。网易机票业务将以网易品牌为担保，将机票代理的利润全部回馈给广大用户，并确保每天更新几万条&ldquo;特价航线&rdquo;信息。春运期间，网易机票还将在特价航线的基础上，推出一系列&ldquo;超低价机票&rdquo;促销订购活动。朱静波还称，预计春节过后，网易有望为用户提供国际机票订购服务。</p>\r\n<p>在支付层面，用户可通过&ldquo;网易宝&rdquo;提供的&ldquo;网易宝&rdquo;余额支付、各大网银、支付宝、手机支付等各种常见的支付方式完成付款。此外，网易机票业务正计划推出移动iPhone等应用版，届时，网易机票业务将支持手机客户终端随时随地查询订购机票。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('98', '<p>IT时报记者&nbsp;&nbsp; 王昕&nbsp; 尤歆飞</p>\r\n<p>此前闹得沸沸扬扬的&ldquo;京东艳照门&rdquo;事件又有新进展，当事人余先生向《IT时报》记者表示，他目前正等待京东方面的最后表态，如果对方拒不承担应尽责任，那么他将选择对问题笔记本电脑进行司法鉴定，并随后起诉京东。</p>\r\n<p><strong>&ldquo;京东艳照门&rdquo;始末</strong></p>\r\n<p>家住上海市的余先生今年8月12日在京东网上商城购买了一台宏碁笔记本电脑，除了键盘有明显被使用过痕迹外，他还发现此硬盘中有180多GB的已用数据，并从中恢复出大量含色情暴力内容的照片和视频。</p>\r\n<p>此事经上海《劳动报》报道后，引起轩然大波，网友将其称为&ldquo;京东艳照门&rdquo;事件。京东和宏碁均强硬表态不存在销售翻新笔记本电脑的情况，并指责新闻报道&ldquo;与事实严重不符&rdquo;。</p>\r\n<p>而后，京东、余先生与《劳动报》之间大打网络口水仗，并进行过数次谈判，至今仍处于僵持状态。</p>\r\n<p><strong>随时准备进行司法鉴定</strong></p>\r\n<p>余先生近日向记者表示，目前他的笔记本电脑已经送交权威机构&mdash;&mdash;上海市计算机行业协会司法鉴定所，近日司法鉴定所已出面与京东又进行过一次谈判，不过京东至今仍未给出最终答复。</p>\r\n<p>记者随即致电司法鉴定所，相关负责人表示事件太过敏感，不便发表评论，该负责人称，一般来说，整个鉴定过程较长，需耗时至少一个月以上时间，并耗资万元以上费用，对消费者来说并不是一个小数目。而后记者又通过其他渠道获悉，司法鉴定所之所以找京东谈，是希望此事最终能和解处理，如果进入司法鉴定流程，就不能再回头了，对簿公堂恐在所难免，局面难以挽回。</p>\r\n<p>余先生目前对京东的态度非常不满，他透露，其实在之前自己与京东的两次谈判中，对方曾许诺为他更换更高配置的新电脑，但却被拒绝，他坚持一定要分出个对错，&ldquo;如果换台更贵的电脑就算了，那我岂不是变成在敲诈京东了。&rdquo;</p>\r\n<p>余先生气愤地表示，如果京东还是坚持不认错，那么在司法鉴定完成后，他会把结果公诸于众，甚至开设微博，希望让广大网友为他评评理。同时他向记者透露，自己与京东的一次谈判过程是被全程录像的，录像拷贝他和京东都有一份，必要的时候他可以向本报公布这段录像的全部内容。余先生称，已经咨询过律师，做好了起诉京东的心理准备。</p>\r\n<p>上海天闻律师事务所戎朝律师对此分析，余先生进行的是&ldquo;B2C&rdquo;消费维权，根据《消费者权益保护法》，一般来说仅适用&ldquo;退一赔一&rdquo;的原则，虽然余先生的维权行为值得鼓励，但期间耗费精力巨大，却很难获得更多经济上的补偿。</p>\r\n<p><strong>记者手记</strong></p>\r\n<p><strong>京东为&ldquo;艳照门&rdquo;背了黑锅？</strong></p>\r\n<p>正如上海律师协会电子商务专业委员会主任商建刚此前的分析，&ldquo;京东艳照门&rdquo;事件是完全可以通过司法鉴定找出真相的，究竟艳照是购机前拷贝进去的，还是购机后所为，相关权威机构完全有能力调查清楚。</p>\r\n<p>&nbsp;</p>\r\n<p>回看该笔记本电脑的整个销售流程：宏&nbsp;&nbsp; 工厂&mdash;&mdash;神州数码（分销商）&mdash;&mdash;京东商城&mdash;&mdash;余先生，通过笔记本电脑上的条形码等标识，上游厂家完全可以查出该电脑究竟出自何处。如果鉴定结果验证电脑确实是&ldquo;翻新货&rdquo;，那么是宏碁工厂出了问题，或是神州数码串货，还是京东从其他经销商调货了&hellip;&hellip;究竟是谁的问题，上游厂家们应该心知肚明。</p>\r\n<p>余先生向记者表示，京东方面反复一口咬定，除非宏碁出具证明，否则京东将不会承认出售翻新电脑。可见，京东方面意在暗示自己非生产厂商，而是销售方，如果余先生真买到的是&ldquo;翻新货&rdquo;，恐怕还得向上游追根溯源，才能找到真相。</p>\r\n<p>如果京东真的仅作为销售渠道角色，事先并不知情，那么京东可算是为此次&ldquo;艳照门&rdquo;事件背了半个黑锅。虽然其作为最终销售方，在处理消费者关系问题上的不作为态度让人无法接受，但确实也没有扮演&ldquo;罪魁祸首&rdquo;的角色，希望官方司法鉴定结果能尽早还原事件真相，一个在意料之中的真相。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('99', '<p><strong>田宁：我们不差钱，也不急着上市</strong></p>\r\n<p>本报讯　昨天上午，从事互联网广告行业的盘石信息技术有限公司在省人民大会堂举办&ldquo;盘石战略融资&rdquo;新闻发布会，宣布获得上海联创投资管理有限公司的2000万美金战略投资。在会上，盘石董事长兼首席执行官田宁却高调地表示：盘石根本不差钱，也不急着上市，他甚至幽默地说，要让这笔钱&ldquo;躺在保险柜里&rdquo;。</p>\r\n<p>跟踪盘石企业发展多年，记者明显地感觉到，从几年前田宁亲口对记者表示正在寻求上市，到现在完全不介意投资和上市，盘石熬过了中小企业的&ldquo;成长的烦恼&rdquo;。</p>\r\n<p><strong>融不到风投 曾怀疑自己没魅力</strong></p>\r\n<p>&ldquo;资本是不会把钱投给弱者的，只会投给强者。&rdquo;田宁说。</p>\r\n<p>昨天，田宁对本报记者回忆了企业发展的三个阶段：一开始刚刚创业，是最渴望钱的阶段，在这个阶段，银行很难贷钱给你，也几乎没有人会给你风险投资。&ldquo;盘石是2004年创办的企业，最穷的时候，我负债三四千万，当时压力大到经常想：只要有谁能帮我还掉这笔钱，我就帮他打工，5万元年薪就肯干。&rdquo;</p>\r\n<p>第二个阶段，企业开始发展得比较好了，这是一个彷徨期。田宁说他的感觉开始好起来，&ldquo;当时特别渴望上市，因为身边的朋友有很多拿到了VC的成功例子，媒体也在报道一个个融资神话，我就想，为什么我拿不到VC？难道是魅力不够吗？&rdquo;</p>\r\n<p>现在，田宁知道了，神话里面不乏水份。&ldquo;融资哪有传说的那么容易！比如某著名的IT大佬，后来我们成了朋友。关于他在洗手间一个电话搞定三千万投资的传说，他自己也很恼火。真实情况是，他在香港住了30多天，见了上百个VC，才融到了300万美元的资金。&rdquo;</p>\r\n<p><strong>融资后 </strong><strong>盘石不急着上市</strong></p>\r\n<p>从2007年、2008年开始，企业开始赢利，盘石的发展进入第三个阶段，&ldquo;2010年盘石的销售额有几个亿，利润很高，银行零负债，没有应收款，现在是银行争着要把钱贷给盘石。&rdquo;</p>\r\n<p>田宁解释，互联网企业的特点是人员和设备等基础成本是框死的，随着企业盈利模式的确定，收入不断增长，边际成本摊薄，越往后，赚钱越多。</p>\r\n<p>这个时候，不差钱的田宁已经不急着上市，也不需要风投了。他说他和上海联创投资管理有限公司合伙人徐汉杰之间是朋友关系，联创&ldquo;苦追&rdquo;盘石，并用&ldquo;有情人终成眷属&rdquo;来形容这次合作。因此，&ldquo;这次是战略投资，不是风险投资，获得国内一流投资管理公司的青睐，本身是对盘石近年来发展的肯定。&rdquo;</p>\r\n<p>徐汉杰的条件也很宽容：钱怎么用完全尊重企业的想法，并答应不提IPO的要求。</p>\r\n<p>现在田宁甚至开始庆幸当初困难时没能融到大笔投资的&ldquo;悲惨遭遇&rdquo;，&ldquo;很重要的一点：融资后我依然是大股东，这意味着盘石不会重蹈国美的覆辙。&rdquo;他同时也表示：盘石并不排斥上市，会在适当的时机进行考虑。&ldquo;盘石要成为中国互联网广告行业的领跑者，这个行业目前正在高速增长，但还远远看不到天花板。比如在浙江，有250万家中小企业，盘石开发了1万家，只占了0.4%的市场。&rdquo;</p>\r\n<p><strong>一套西装 穿了四五年</strong></p>\r\n<p>&nbsp;</p>\r\n<p>2000万美金会怎么用？锁到保险柜里只是一个比喻，田宁表示，会把钱用于子公司的建设，到明年底浙江每个地市包括舟山都要设立子公司；会用于研发体系的建立，对互联网企业来说科研的力量很重要；还要用于改善员工的生活和福利&hellip;&hellip;</p>\r\n<p>至于他自己，创业已经不再是为了生存，为了买几套房子，&ldquo;我老婆每个月给我一千元，我真花不掉。&rdquo;他向我扯了扯身上为了开会特意穿上的深色西装，记者一看，这西装好眼熟。他说：&ldquo;这套西装我已经穿了五六年了，什么牌子早忘记了。现在每天中饭晚饭都是在公司吃的盒饭。&rdquo;他现在工作的乐趣就是为了事业，为了带好手下这帮兄弟。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('100', '<p>2011年，&ldquo;十二五&rdquo;开局之年，中央经济工作会议指出，&ldquo;做好经济社会发展工作具有十分重要的意义&rdquo;。会议同时指出，我国经济社会发展中的短期问题和长期问题交织，结构性问题和体制性问题并存，必须采取有力措施，积极妥善加以解决。</p>\r\n<p>　 　应对上述短期问题、长期问题，结构性问题、体制性问题，推出相关政策、加大改革力度势在必行。通过收紧流动性、加大农业基础设施建设力度等措施稳定物 价、加快以个税改革为代表的财税体制改革，建立更透明、更公平的成品油定价机制，全面推广基本药物制度破解&ldquo;药价虚高&rdquo;，通过房产税政策落地、提速保障房 建设给力楼市调控&hellip;&hellip;2011年，这些经济政策备受期待。</p>\r\n<p>　　<span style=\"font-weight: bold;\">稳定物价　收紧流动性最有效</span></p>\r\n<p>　　中央经济工作会议强调，&ldquo;把稳定价格总水平放在更加突出的位置&rdquo;。新年第一天，国务院总理温家宝在锡林郭勒盟牧区看望干部群众时再度强调物价调控，&ldquo;中央已经采取一系列措施稳定物价，我们还将把稳定物价摆在更为重要的位置&rdquo;。</p>\r\n<p>　 　2010年下半年，全国物价连创新高，尽管相关部门自三季度起就在农产品供应、打击囤积炒作等方面加大力度，但至年末，物价水平仍然高于预期调控目标。 2011年，CPI(居民消费价格指数)仍然是一个备受关注的话题，相关部门对此也是出言谨慎，国家发改委副主任彭森去年年底曾表示，&ldquo;引发价格上涨的根 本原因仍未消除，今后一段时间，稳定消费价格总水平、保障群众基本生活的任务十分艰巨&rdquo;。</p>\r\n<p>　　从2010年的调控政策看，农业部和发改委的多次抛储均被抢购一空，多部门联手打击&ldquo;非法游资&rdquo;也没能打住CPI数据。专家普遍认为，连年货币增发造成的流动性过剩是社会资本参与投机的根本原因，如果流动性不减，各种调控手段都是隔靴搔痒。</p>\r\n<p>　　北京大学中国经济研究中心教授霍德明表示：&ldquo;流动性过剩是2010年通胀水平走高的源头。&rdquo;他认为，未来一年，国家可通过上调存款准备金率、加息等方式稳定物价，以使CPI远离警戒线，&ldquo;紧缩流动性将是2011年最有效的稳物价调控措施&rdquo;。</p>\r\n<p>　 　作为影响CPI的重要因素，农产品价格水平是各界关注的焦点。此前召开的中央农村工作会议指出，稳定发展粮食生产是2011年&ldquo;三农&rdquo;工作的首要任务， 今年农业农村工作的总体要求是：大兴水利强基础、狠抓生产保供给、力促增收惠民生、着眼统筹添活力。相关专家预计，在即将出台的2011年一号文件中，水 利建设将成为重中之重。</p>\r\n<p>　　农业部农村研究中心主任宋洪远表示，农产品价格上涨、农业抗风险能力薄弱，保障农产品供给尤为重要，&ldquo;加强农业基础设施建设有利于发展农业生产，保障农产品供给，从而有助于应对通胀&rdquo;。</p>\r\n<p>　　<span style=\"font-weight: bold;\">财税改革　个税改革减级距、调级次</span></p>\r\n<p>　　《中共中央关于制定国民经济和社会发展第十二个五年规划的建议》指出，&ldquo;十二五&rdquo;期间&ldquo;加快财税体制改革&rdquo;，并提出逐步建立健全综合和分类相结合的个人所得税制度，全面改革资源税，开征环境保护税。</p>\r\n<p>作为调节收入的重要税种，个人所得税最受公众关注，全国财政工作会议定调2011年个税改革方向为&ldquo;降低中低收入者相对税负，强化对高收入者的调节&rdquo;。</p>\r\n<p>　　&ldquo;减级距、调级次这种操作方式短期内比较可行，能让更多低收入者享受到税改实惠，操作方式也比较简单。在现行操作模式下，这是最现实和最受期待的个税改革模式。&rdquo;中国社科院财贸所研究员杨志勇表示。</p>\r\n<p>　 　除了强化个税调节作用，降低税负、实现结构性减税也是公众期待的重点。对此，财政部的表态是，&ldquo;继续实行结构性减税是2011年积极财政政策的重要内容 之一&rdquo;。财政部财政科学研究所副所长刘尚希认为，&ldquo;降低税负是未来税制改革大方向，应可期待更多减税&rdquo;。财政部财政科学研究所副所长苏明则表示，&ldquo;预计  2011年的结构性减税将在战略性新兴产业方面有所突破&rdquo;。</p>\r\n<p>　　<span style=\"font-weight: bold;\">能源保障　价格机制须全面调整</span></p>\r\n<p>　　2010年底，一批大城市天然气价格调整听证完毕，居民阶梯电价调整方案完成意见征集，成品油定价机制改革风声四起&hellip;&hellip;能源保障既关系经济发展，也关系到每一个人的生活，可以预见的是，2011年将是能源价格体制调整的关键一年。</p>\r\n<p>　　&ldquo;可以说，现在国内能源基础已没有大问题，油荒、气荒、限电等问题其实都可以归结在价格上。&rdquo;昨日接受本报记者采访时，厦门大学中国能源经济研究中心主任林伯强教授如是说。</p>\r\n<p>　 　成品油价格一向是关注焦点。2009年5月，发改委公布《石油价格管理办法(试行)》，但在实施过程中，国内成品油价格调整与国际原油价格变化相比明显 滞后。林伯强说，&ldquo;适当缩短调价周期，使调价机制更为灵活，让市场更灵敏地反映国际油价和国内油价变动趋势，期望新机制可以在2011年上半年推出&rdquo;。</p>\r\n<p>　 　与油价相比，电价离公众更近。2010年10月9日，发改委出台《关于居民生活用电实行阶梯电价的指导意见(征求意见稿)》，拟推行居民&ldquo;阶梯式累进电 价&rdquo;。林伯强认为，阶梯电价方案可能不完美，但在居民电价必须反映成本的前提下，它的确是一项比较好的价格机制，不但有利于电力市场化，改善公平和效率， 还将促进资源节约和环境保护。&ldquo;希望具体方案能在2011年上半年开始施行，也希望最终可以让百姓明白和接受阶梯电价的实质以及它如何改善公平与效率。&rdquo;</p>\r\n<p>　　显然，百姓的接受度不只对阶梯电价是问题，对成品油、天然气等价格调整也一样。对此，林伯强表示，政府可以辅以完善的补贴和税收机制，对普通百姓而言，价格上涨并不必然意味着生活成本增加。</p>\r\n<p>　 　&ldquo;一些措施是政府可以控制的，既能保障供应企业正常收益，又能保障居民生活基本不受影响，比如对居民必要的生活能源消耗进行更大力度的补贴，而让大量消 耗能源的人支付更多无补贴成本，也可以降低能源税金。&rdquo;林伯强说，&ldquo;以成品油价格为例，现在的补贴机制是在油企层面进行的，对消费者来说是无区分的补贴， 消费成品油更多的人占了更多的便宜，而百姓直接增加了必要的生活成本，这一补贴方式亟待改变&rdquo;。</p>\r\n<p>　　<span style=\"font-weight: bold;\">医改攻坚　基本药物制度全面推广</span></p>\r\n<p>自2009年4月公布医改三年实施方案，国家已为医改拿出8500亿元，推行基本药物制度、改革药品采购制度，百姓已经开始受益。2011年，医改开始进入&ldquo;深水区&rdquo;，如何更好地推进公立医院改革、合理分配医疗资源、降低药价，成为落实医改政策收官之年的最大期待。</p>\r\n<p>　 　《中共中央关于制定国民经济和社会发展第十二个五年规划的建议》提出，未来将健全覆盖城乡居民的基本医疗保障体系，逐步提高保障标准，建立和完善以国家 基本药物制度为基础的药品供应保障体系。按照医改方案要求，到2011年底初步建立国家基本药物制度，基本覆盖政府办基层医疗卫生机构，同时启动  2011版国家基本药物目录调整制定工作，建立基层医疗卫生机构合理长效的补偿机制。相关专家指出，公立医院&ldquo;药价虚高&rdquo;顽症久治不愈，全面实施基本药物 制度有助于这一问题的解决。</p>\r\n<p>　　2011年，基本药物制度将向剩余的50%地区奋力推进。相关专家指出，如果政策能足额落实，到2011年底，政府举办的所有基层医疗机构全部配备和使用基本药物，并按购进价格实行零差率销售，虚高的药价有望回落。</p>\r\n<p>　　曾参与医改政策制定的北京大学法学院教授孙东东告诉记者，在政策推进过程中，会有很多不确定因素出现，例如低价药消失、高价药中标等情况，如何将这些顽疾逐一剔除，还需要强有力的监管、行业自律以及配套法规给予支撑。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('101', '<p>&nbsp;</p>\r\n<p>　　2010年的外汇市场依然延续了金融危机爆发以来的震荡，经历了欧洲债务危机、美国二次量化宽松政策、朝鲜半岛问题等一系列风险事件轮番上演，美元、欧元、日元、澳元这些货币各自为政，汇价走势特点也各有千秋。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>　　【人民币】　全年升值3%有效汇率基本稳定</p>\r\n<p>&nbsp;</p>\r\n<p>　　2010年12月31日人民币对美元中间价6.6227；较前一个交易日变化-2个基点，人民币升值0.00%；较去年同期人民币升值3.01%。</p>\r\n<p>　 　2010 年人民币对美元劲升超3%，但有效汇率基本稳定。回顾2010年全年人民币汇率波动，人民币对美元中间价全年变化-2055个基点，同比升幅3.01%。 尽管人民币对美元劲升，但12月份兴业银行(24.46,0.41,1.70%)人民币综合汇率指数(CIB-CCI)均值为117.7，仅比前年12月 份均值117.6上升0.1，较去年1 月份均值117.3上升0.4；12月份兴业银行人民币金砖汇率指数(CIB-CBI)均值为111.8，较前年12月份均值112.1下降0.3，较去 年1月份均值110.0上升1.8。一句话，在人民币对美元汇率剧烈波动的同时，有效汇率保持了高度稳定。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>　　【美元】　涨得干脆跌得纯粹</p>\r\n<p>&nbsp;</p>\r\n<p>　　美元指数从年初1月4日的77.50到12月28日的80.40，总体走势小幅上扬，涨幅约为3.7%，但是其间经历了两个转折点，将美元指数走势分为先扬、后抑、再反弹三个阶段。</p>\r\n<p>&nbsp;</p>\r\n<p>　　2010年伊始，美元指数就开始不断向上攀升，1至4月份，站稳81水平。从4月初的81水平附近扶摇直上，短短两个月，就突破了88的高位，收盘价于6月7日到达年内最高点88.43，涨幅逾10%。</p>\r\n<p>&nbsp;</p>\r\n<p>　 　6 月开始，美国经济数据表现疲弱，8月份公布的第二季度美国GDP年率恰逢其时地印证了市场的担忧，该数据增长1.6%，低于初步估计的2.4%。同时，下 半年，市场则开始担心美国是否将推出二次量化宽松政策，在QE2的预期中，市场交易逻辑开始发生变化，从之前重视美元的避险功能而做多美元，到看到美国经 济复苏的无力而开始倾向于做空美元，于是，美元犀利俯冲，悉数回吐上半年涨幅。</p>\r\n<p>&nbsp;</p>\r\n<p>　　6月到11月间，美元从年内高点滑落，11月4日，美元指数触及年内最低点。非常时刻，欧洲债务危机重回视野、朝鲜半岛冲突乍起，美元非但没有继续下跌，反而掉头向上，不到一个月便蹿上了80附近。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>　　【欧元】　没有最低只有更低</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>　 　2010 年，欧元的春天格外短暂。欧元兑美元收盘价从1月4日的1.4411到年内最高点1.4513，102个点的涨幅，止于1月11日。此后，欧元开始了旷日 持久的下跌，并且没有最低，只有更低。随着5月19日，希腊还款日的临近，市场不理性因素横行，虽然希腊的经济总量在欧元区所占比重不大，但是，市场担心 的始终是谁会成为下一个希腊，并且尤其关注葡萄牙、爱尔兰、意大利和西班牙。</p>\r\n<p>&nbsp;</p>\r\n<p>自6月7日创出2006年3月以来的新低1.1923之后，欧元开始反弹。然而，就在欧元即将收复年内失地之际，爱尔兰债务危机接踵而至，欧元再度承压下行。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>　　【日元】　涨得矛盾涨得纠结</p>\r\n<p>&nbsp;</p>\r\n<p>　　&ldquo;涨&rdquo;，贯穿了日元2010年的始终。8月过后，日元更是屡屡刷新15年高点，但在2010年里，支持日元与打压日元的各种因素胶着，日元虽涨，却涨得矛盾、涨得纠结。</p>\r\n<p>&nbsp;</p>\r\n<p>　 　2010 年，美元对日元的收盘价从1月4日的92.51，走到12月28日的82.37，上涨了12.3%。9月15日，日本政府时隔6年再次介入汇市，动用两万 亿日元&ldquo;偷袭&rdquo;外汇市场，抛售日元阻其升值。两万亿日元约合233亿美元，创下了日本政府汇价干预史上单日干预的最大规模。日元空方只欢腾了短短3天就败 下阵来，而日元则继续刷新15年高点。10月5日，日本政府第二次对抗日元汇率的努力，换来了当日日元汇率0.01%的跌幅，以及之后两周的高位震荡，但 纠结之后，也触到了年内最高点80.24。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>　　■展望2011 美元温和走高 欧元依旧偏软</p>\r\n<p>&nbsp;</p>\r\n<p>　　展望2011年，美国银行美林证券首席G10外汇分析师帕雷什认为，近期得以通过的减税计划令美联储再度实施定量宽松政策的可能性减少，美元下行的预期得到缓和，不排除美元继续上升的可能。</p>\r\n<p>&nbsp;</p>\r\n<p>　　布朗兄弟哈里曼全球货币策略主管MarcChandler表示，各国政府正在实施一场大规模的经济试验，美国持续通过财政及货币政策寻求经济增长，而欧洲政府则逐渐紧缩政策，支持经济增长的策略将帮助提振美元。</p>\r\n<p>&nbsp;</p>\r\n<p>　　瑞银集团策略师BrianKim表示，明年市场的波动幅度可能将&ldquo;难以置信得大&rdquo;，并预计2011年美元将温和走高。</p>\r\n<p>&nbsp;</p>\r\n<p>　　而对于欧元，市场人士指出，由于欧元区整体经济能否持续向好复苏仍面临严峻考验，欧债危机前景依旧不明朗，相对于美联储欧央行在制定货币政策时处在较为被动位置等，欧元仍有可能在&ldquo;腹背受压&rdquo;的背景下延续2010年中的大幅波动走势，但整体可能会依旧较为偏软。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><br />\r\n&nbsp;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('102', '<p style=\"text-indent: 2em\">已经正式踏入了2011年，今年每个数码相机生产商会有什么样的技术或者什么样的产品能够呈现给各位，依旧是十分令人期待的。虽说坊间流传甚多，目前却依然没有进一步确实的消息。所谓温故知新，我们今天就和大家回顾一下2010年上市的重量级数码相机，能够从中或多或少地窥探出今年的一个发展趋势，同时也在没有新品发布的淡季里，为大家先来解解渴。好吧，下面我们一同来回顾一下2010年数码相机界里的&ldquo;大腕儿&rdquo;们吧。</p>\r\n<p style=\"text-indent: 2em\"><b>推荐产品：佳能60D套机(18-135mm)</b></p>\r\n<p style=\"text-indent: 2em\">参考价格：8300元</p>\r\n<p style=\"text-indent: 2em\">每年新品发布，最受瞩目的肯定会是单反类的数码相机，而佳能去年发布的两款单反同样颇受关注。上半年发布的入门单反佳能550D，首次将中端技术应用于入门级别单反中，令入门级单反的性能级别得到一个飞跃般的提升。因此佳能550D从业界还是市场都收到很好的评价。而下半年佳能将力量放在了进一步细分中端单反产品线，发布新一代的中端单反佳能60D。佳能60D可谓是佳能一次大胆的创新，3.0寸可旋转宽屏液晶监视器、创意滤镜以及相机内RAW图像处理等功能，均为EOS数码单反系列中首次采用。</p>\r\n<p>&nbsp;</p>\r\n<center><img alt=\"大腕云集 2010年度重量级数码相机回顾\" src=\"http://img1.cache.netease.com/catchpic/0/05/05539EFA10817B84F316243065873C7E.jpg\" border=\"0\" /></center>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<center>佳能 EOS 60D(配18-135mm IS 镜头)<u>图片</u><u>360展示</u><u>系列</u><u>评测</u><u>论坛</u><u>报价</u><u>网购实价</u></center>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\">佳能 60D(网购最低价 4680元)的机身设计采用&ldquo;骏朗造型&rdquo;设计，体现出其专业感与气质感。而佳能60D整体体制和重量比起前作50D(网购最低价 5788元)来说，要轻巧得多，还是比较适合女孩子使用的。机身外观最大的亮点莫过于首次采用能够实现多角度拍摄的约104万点，3.0寸可旋转液晶监视器。该液晶监视器的显示精度已经超过了佳能7D，屏幕可多角度旋转，方便用户在不同角度轻易捕捉他们所需要的精彩瞬间。</p>\r\n<p>&nbsp;</p>\r\n<center><img alt=\"大腕云集 2010年度重量级数码相机回顾\" src=\"http://img1.cache.netease.com/catchpic/7/70/70F2A2F804E7F0277BAC94D4E83CD30E.jpg\" border=\"0\" /></center>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<center>佳能60D的RAW图像处理功能界面</center>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\">除了创意艺术滤镜这种好玩的特色功能之外，佳能60D还搭载了使用的相机内RAW图像处理功能，利用相机即可将RAW图像转换为JPEG图像。无需使用计算机，就能对亮度调节、白平衡、照片风格等进行调整。因此，在进行拍摄时，拍摄者可以专注于确认对焦和构图，而在拍摄完成后便可不依赖计算机当场对图像进行各种调整。\r\n<table cellspacing=\"1\" cellpadding=\"0\" width=\"98%\" align=\"center\" bgcolor=\"#cccccc\" border=\"0\" style=\"font-size: 12px\">\r\n    <tbody>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td colspan=\"2\">\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center><b>规格参数</b></center></td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>品牌：</center></td>\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>佳能</center></td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>系列：</center></td>\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>佳能 EOS 60D(网购最低价 5999元)</center></td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>型号：</center></td>\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>EOS 60D(配18-135mm IS(网购最低价 6558元) 镜头)</center></td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>有效像素：</center></td>\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>1800万像素</center></td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>传感器尺寸：</center></td>\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>22.3&times;14.9mm</center></td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>防抖功能：</center></td>\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>支持镜头防抖</center></td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>ISO感光度：</center></td>\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>自动,100,200,400,800,1600,3200,6400,可扩展至12800</center></td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>液晶屏尺寸：</center></td>\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>3.0英寸</center></td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>附加功能：</center></td>\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>防尘功能,实时取景,电子水准仪</center></td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>IT商城：</center></td>\r\n            <td>\r\n            <p>&nbsp;</p>\r\n            <p>&nbsp;</p>\r\n            <center>网购实价</center></td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td colspan=\"2\">\r\n            <p>&nbsp;</p>\r\n            <p style=\"text-indent: 2em\"><b>&gt;&gt;更多详细资料</b>（图片报价参数比较网友点评评测&middot;行情）</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\"><b>编辑点评</b>：从去年佳能发布的两款单反可以看得出，佳能把关注点更多地放在了普通的用户，在入门级单反领域将高一级别的单反技术引入，进一步提升用户体验，而中端单反则进一步降低其门槛，让更多普通用户亦能感受中端单反的魅力。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('103', '<p style=\"text-indent: 2em\">上周才报导过索尼爱立信将于2月中举行的MWC展上正式公布Playstation Phone，但短短一星期后，Playstation Phone的宣传照已经等不急要露面了。在英国留学的网友爆料，<b>英国某杂志已经刊登了 Playstation Phone的设计图片及宣传照，并附上一些硬件配置。</b></p>\r\n<p>&nbsp;</p>\r\n<center><img alt=\"双摇杆设计 索爱PSPhone最终版英国现身\" src=\"http://img1.cache.netease.com/catchpic/3/3A/3A0594555C8F2BF9444BAE685830CE60.jpg\" border=\"0\" /></center>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<center>▲Playstation Phone的宣传照在英国某杂志曝光</center>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\">从 照片我们可以看到，Playstation Phone 整体设计和之前爆出的工程机略有不同，键盘中间位置会加入两个游戏操控摇杆，而按钮的字样更清晰鲜明，并印上PSP标志，看来应该是最终完成版本。但是这 组杂志图片很明显只是个宣传技俩，Playstation Phone真机模样只有上市才知道了。</p>\r\n<p>&nbsp;</p>\r\n<center><img alt=\"双摇杆设计 索爱PSPhone最终版英国现身\" src=\"http://img1.cache.netease.com/catchpic/2/20/20DEA5DC010B4906BE3A61141E7761B2.jpg\" border=\"0\" /></center>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<center>▲杂志中曝光了更多的Playstation Phone的硬件信息</center>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\">硬件规格方面，Playstation Phone将采用4寸触控屏、1GHz Qualcomm MSM8655处理器，并运行最新Android 2.3系统。可能大家没听过MSM8655型号的处理器，经笔者翻查有关文件，发现原来跟HTC Desire HD的 MSM8255处理器属同一MSM8x55 晶片架构，同样为1GHz ，以及Adreno 205图像处理器，两者最大分别在于MSM8655支持HSPA+ 高速无线网络，数据传输速度可高达14.4Mb/s。换言之，Playstation Phone的性能表现、图像处理能力跟HTC Desire HD接近一样，究竟这样规格能否顺畅运行PSP游戏吗？小估计有点吃力吧。</p>\r\n<p>&nbsp;</p>\r\n<center><img alt=\"双摇杆设计 索爱PSPhone最终版英国现身\" src=\"http://img1.cache.netease.com/catchpic/3/3E/3E066E32EECC988EDE37E28F6C0C8915.jpg\" border=\"0\" /></center>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<center>▲Playstation Phone的宣传照中两个游戏操纵杆</center>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<center><img alt=\"双摇杆设计 索爱PSPhone最终版英国现身\" src=\"http://img1.cache.netease.com/catchpic/9/98/98C0CC5279ABAE25A9C70BD7DB49F49A.jpg\" border=\"0\" /></center>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<center>▲Playstation Phone将采用4寸触控屏</center>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\">Playstation Phone要推出的传闻不经不觉都传了差不多一年，全球机迷一直引颈以待。但时至今日，索尼官方依然未有任何正式消息发布，究竟在英国杂志上得到的消息又距离真相有多远？似乎要等到 MWC2011，才有会真正答案！</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('104', '<p>进入冬季以来，我国进入防火高峰期。11月15日的上海大火直接经济损失达5亿元，随后，武汉、成都等地又频发火灾。房屋作为家里财产最重要的组成部分，却很少有人为房屋等家庭财产办理保险。相对于车险、人身保险等市场的火爆，我省的家财险显得尤为冷落。据省内保险行业专业人士测算，&ldquo;家财险在整个陕西保险行业的比例，连1%都不到。&rdquo;专家呼吁，重视家庭财产保险，将为我省居民维护和保障家庭财产起到关键性作用。</p>\r\n<p>　　陕西家财险保险份额下滑</p>\r\n<p>　　一份来自中国人民财产保险公司的数据显示，截至今年10月，我省各保险公司的家财险业务在整个保险行业的各个险种中排名最后，成为备受冷落的一个险种。以中国人民财产保险公司的数据，截至今年10月份，家财险业务累计保费832万元，企财险2亿元，机动车辆保险26亿元。中国人保以832万元的累积保费，成为今年陕西保险业家财险板块的第一大户，占有陕西市场份额61.10%。</p>\r\n<p>　　纵观陕西省内各保险公司的成交数额，家财险仍是各保险公司的薄弱环节。截至今年10月份，各保险公司共完成了机动车辆保险61.9亿元，企财险4.3亿元，全省的家财险累计保费仅为1362万元。</p>\r\n<p>　　&ldquo;相对于其他险种动辄数亿元、几十亿的保费总量，陕西的家财险业务可以说不进反退，在整个保险市场份额内不足百分之一，几乎到了可以忽略不计的地步。&rdquo; 中国人保陕西分公司财产保险部的一位负责人告诉记者。他同时说，随着社会经济的发展，人们的保险意识都在增强，其他险种的成交数额都在持续增加，但唯有家财险这个种类业绩环比下滑。这位负责人表示，&ldquo;这是一个极其不正常的现象，陕西省内居民对家财险的漠视程度，的确令人堪忧。&rdquo;</p>\r\n<p>　　我国的家财险业务开展由来已久，它和企业财产保险、机动车辆保险被保险业人士称为&ldquo;老三险&rdquo;之一。自1980年我国恢复国内保险业务以来就一直开办，曾经是财产保险中发展较快、覆盖面较宽的骨干险种之一。但进入本世纪以来，包括我省在内的全国保险业，家财险的份额都有下滑趋势。</p>\r\n<p>　　与之形成鲜明对比的是，在世界发达国家中，家财险的普及率约在80%左右。在北京、上海等一线城市，家财险的普及率约为7%-8%。有数据表明，最近 4年国内家财险最高的年保费占全国总保费收入的比例还不到0.7%；从全国财险市场来看，家财险所占的比重仅在1%左右。在国外情况恰恰相反，家财险极受人们的欢迎，投保率都在70%以上，是仅次于机动车第三者责任险的第二大普及险种。</p>\r\n<p>　　　购买家财险筑起家庭财产防火墙</p>\r\n<p>　　今年商洛地区&ldquo;7&middot;23&rdquo;暴雨洪水灾害中，商洛地区大部分县市受到了洪水、泥石流等自然灾害。在丹凤、商南两县，有170多户村民受政府引导，由财政补贴10元、个人出资10元购买了家财险。洪灾过后，很多受灾群众面对着被洪水、泥石流冲袭过的房屋一筹莫展，购买过家财险的当地群众，则及时得到了中国人保陕西分公司的赔付款5000元。当地村民表示：&ldquo;没想到花10块钱买了份保险，能起到这么大效果。&rdquo;近日，记者从商洛市金融办获悉，商洛市自今年10 月份起，开始在全市范围内实施政策性农村房屋保险工作。力争在2010年底，全市农民房屋的参保率达到70%以上。</p>\r\n<p>　　&ldquo;当地村民从家财险中得到了实惠，他们的参保积极性就很高，加上当地政府的政策扶持，商洛地区的农村住宅保险已经走在省内的前列。&rdquo;中国人保陕西分公司财产保险部工作人员说，相对于农村地区的积极投保，省内的城市居民对家财险的认识仍十分淡薄，积极性不高。</p>\r\n<p>　　什么是家财险？家庭财产保险会对个人家庭财产起到哪些保护作用？记者近日在西安街头做了随机采访。接受采访的大部分市民表示不清楚家财险的概念，听说花百十元、几百元为家里的房子做全年的保险，可以保障火灾等突发事件的损失，大部分人表示&ldquo;可以接受&rdquo;，但同时也表示&ldquo;火灾之类的离生活太远，几乎可以忽略不计。&rdquo;　实际上，家财险的保障范围除自然灾害、盗抢、火灾、爆炸、雷击、暴雨等外，常见的管道破裂及水浸损失、家用电器用电安全等情况，也在家财险承保范围之内，甚至包括家中水管爆裂造成装修和家具损失。一旦出事，被保险人可以向保险公司提出理赔申请，提供损失清单，由保险公司派专人现场核保定损，确认在灾害中的损失。</p>\r\n<p>　　中国人保陕西分公司的一位主管告诉记者，根据人们生活的实际需要，现在保险业对家财险的业务范围也做了调整，比如以前家庭财产保险并不包括金银首饰等贵重物品，但最新的家财险已经修订为可以附加一定的金银首饰和现金。在附加险中也有了第三者责任险，例如高层住宅的家庭如果花盆等物品坠落，砸到车辆和行人而造成的损失，也可作为家财险的保险范围。</p>\r\n<p>　　据媒体消息，11月份上海大火发生后，北京、上海、深圳、南昌等诸多城市家财险业务有了明显的上升，而天津市的家财险投保率在近期上升了200%。陕西家财险面对&ldquo;外热内冷&rdquo;的尴尬局面，我省社会公众对家庭财产保险的认识亟待提升。</p>\r\n<p>　　三大原因制约家财险发展</p>\r\n<p>　　在今年1到10月，陕西保险业的家财险业务整体都不容乐观。家财险业务排名前五位的公司分别是：中国人保，累计保费832万元；中华联合，累积保费 93万元；大地保险，累积保费76万元；阳光保险，累计保费75万元；太平洋保险，累积保费68万元。据权威数据显示，我省现有的18家财产保险公司中，还有几家的家财险业务保费为0，也就是说肯本没有启动起来。</p>\r\n<p>　　相对于其他车险、寿险等险种的快速增长，家庭财产保险的变化是不升反降，现状不容乐观。是什么原因制约了陕西家财险业务的发展？一位西安财产保险行业的资深高管向记者分析了三方面的原因：</p>\r\n<p>　　首先是市民对家庭财产保险的概念淡薄，对突发事故抱有侥幸心理。不少市民认为现在的住宅社区监控严密、消防设备齐全，以房屋为主的家庭固定财产受到意外损失的可能性很小。</p>\r\n<p>　　其次是家产险的产品设计与客户需求部分脱节。家财险属于简易险种，不需要在投保前提供房屋价值证明、电器购买发票等依据，是由投保人根据投保价值总额，自主考虑选择合适的保额。一般来说只承保房屋及其附属物，包括服装、家具、家用电器、文化娱乐用品等。不保财产有如下几类：一是金银、首饰、珠宝、货币、有价证券、票证、邮票、古玩、文件、账册、技术资料、宠物等以及其他无法鉴定价值的财产；二是处于紧急危险状态下的财产；三是用于生产经营的财产。而购买家庭财产保险的客户，一般都会将兴趣重点放在家中的贵重物品上，根据客户的这些需求，目前一些保险公司已经修订了参保范围，增加了对金银首饰和货币现金的投保。</p>\r\n<p>　　三是家财险单笔保费较低，一般不超过300元，并且客户非常分散，在缺少有效销售渠道的情况下，单纯依靠工作人员上门营销开展业务成本过高。对于低利润、高成本的家财险来说，保险业务员肯定更愿意选择其他收入较高的险种做推销。</p>\r\n<p>　　&ldquo;现在陕西的家财险份额虽然很小，但事实上这其中还有很大一部分，是由购房者在选择按揭时购买的房屋保险，其受益人是贷款银行。不少人在提前还完房款之后，会选择退保。&rdquo;中国人保西安分公司一位负责人表示，如果将退保费转成家财险，将是一种更划算的选择。</p>\r\n<p>　　据中国人保陕西分公司财产保险部介绍，现在包括中国人保、太平洋保险、安邦保险等不少保险公司都在网上开展了家财险网上办理业务，但反馈甚微。这位工作人员很无奈地说：&ldquo;一份家财险年保费不过一二百元，贵一点也不过300多块钱。平均到每天都不到一块钱，就可以保障房屋和家庭财产的安全，但就是开展不起来。我们只能说，咱们省内居民对财产保险非常不重视。&rdquo;<br />\r\n投保家财险回归保障功能</p>\r\n<p>　　家财险保费从100多元到几千元不等，保障期限多为一年。专家提醒，在投保相关产品时，客户要根据自身实际需求选择产品，切不可贪多，或在多家保险公司就同一事项同时投保。根据我国保险法的相关规定，若同一保险标的向两家以上保险公司投保，且保险金额总和超过保险价值的则属于重复投保，一旦发生保险事故，各保险公司赔偿保险金的总和不得超过保险价值，各保险公司将按照投保人在各家保险公司的投保比例进行赔付。</p>\r\n<p>　　同时，房屋和家居财物的保额并非越高越好，保险公司将在保险标的的保险价值或实际价值的范围内依据实际损失金额进行赔偿，超过部分的保额是无效的。另外，当事故不幸发生时，被保险人一定要第一时间通知保险公司，并注意保护现场和留存事故发生时的照片，完整的证明材料可以大大节约日后理赔的处理时间。</p>\r\n<p>　　&ldquo;让保险回归保障功能&rdquo;，才是投保家财险品种的最重要的意义。毕竟居家过日子需要保障的是安稳，是长远的规划，而不能只从投资收益的角度去看待。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('105', '<p style=\"text-indent: 2em\"><b>联想日前宣布，将在本月6日开始的CES展上发布乐Pad平板电脑产品，这也意味着联想将加入目前的平板电脑大战。</b></p>\r\n<p style=\"text-indent: 2em\">从2010年下半年开始联想就确定了乐Pad的发布计划，在最近一次的财报分析师会议上，联想集团CEO杨元庆确认将首先在国内上市，上市时间为2011 年第一季度。2011年CES的一大亮点就是各类的平板电脑产品。iPad(网购最低价 3799元)的成功让多家PC公司开始正式销售自己的平板产品。联想就是在2010年CES 上推出U1平板电脑后观望了一年的时间推出乐Pad。</p>\r\n<p>&nbsp;</p>\r\n<center><img border=\"0\" alt=\"联想将在CES推出Android平板电脑\" src=\"http://img1.cache.netease.com/catchpic/B/B3/B35A0ED9E78EF28AADD9AE53F71AE8E7.jpg\" /></center>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\">据之前公布的消息，乐Pad仍将和乐Phone一样采用Android系统，而界面和平台将和乐Phone类似。不过联想仍未公布其价格和上市的具体时间。</p>\r\n<p style=\"text-indent: 2em\">联想高级副总裁、产品集团总裁刘军将出席今年在拉斯维加斯的CES展会，并将参与乐Pad的发布。</p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\">虽然多家厂商在2010年宣布了平板电脑的上市计划，但各类产品均在苹果的iPad上市后才确定推出时间，其中三星、戴尔、宏碁等厂商已经在下半年开始销售，而惠普、联想、东芝等都将在2011年推出。</p>\r\n<p style=\"text-indent: 2em\">一个国外的IT博客称2011年为平板电脑年，CES展也将是众多产品的展示集中地。除了iPad和少数使用windows系统平板产品外，多数使用的操作系统均为谷歌的Android系统。</p>\r\n<p style=\"text-indent: 2em\">据Gartner发布的数据，iPad带领的平板电脑在2010年出货量庞大，2011年该市场将为5480万台。众多厂商的加入将加剧该领域的竞争。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('106', '<p class=\"f_center\" style=\"text-align: center\"><img alt=\"苹果新年开市第一天市值首次突破3000亿美元\" src=\"http://img3.cache.netease.com/tech/2011/1/4/2011010401380052f36.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p class=\"f_center\">苹果新年开市第一天市值首次突破3000亿美元</p>\r\n<p>网易科技讯 1月4日消息，据国外媒体报道，在2011年美股第一个交易日，苹果公司市值即突破3000亿美元大关，成为美国第二家市值超过3000亿美元的公司。</p>\r\n<p>苹果股票当日开盘后一路攀升至历史新高330.05美元/股，市值超过3020亿美元。2010年，苹果市值在3月超过2000亿美元，5月底再超微软成为仅次于埃克森美孚的美国市值第二高公司。</p>\r\n<p>截止发稿时，苹果股价上涨7.25美元或2.15%至329.81美元/股，市值3025亿美元。（路北）</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('107', '<p style=\"text-indent: 2em\">众所周知笔记本的出现就是为了满足移动办公的各种需求，随着技术的日益更新，硬件配置也随之提高，人们也不满足于笔记本移动办公的单一需求了，而是要求笔记本兼顾娱乐影音性能，玩玩各种3D游戏，或是播放高清视频，处理图像设计工作。并且还希望能保持较长的续航时间。所以各大厂商边不断寻求一个制衡点，所以，双显卡出现在视线里...</p>\r\n<p>&nbsp;</p>\r\n<center><img alt=\"移动娱乐两不误 市售双显卡笔记本推荐\" src=\"http://img1.cache.netease.com/catchpic/5/55/554CC1A516030448E0A4BE261B6C3D05.jpg\" border=\"0\" /></center>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\">独立显卡性能强劲，适合玩家使用对显卡要求高的程序，比如运行3D游戏，设计制图又或者高清视频的流畅播放，但是其弊端就是能耗高，耗电快，而且散热量也大。集成显卡反而能耗低，耗电小而且散热量也小，对笔记本的膝上办公电池续航时间提供了有效的保障，又能满足基本的办公需求，比如文档，演示，网页的浏览，网上的基本娱乐都不再话下。今天小编选取几款市面常见的支持双显卡切换的机型，元旦准备购机的朋友不妨可以参考下！</p>\r\n<p style=\"text-indent: 2em\">\r\n<table cellspacing=\"1\" cellpadding=\"0\" width=\"98%\" align=\"center\" bgcolor=\"#cccccc\" border=\"0\" style=\"font-size: 12px\">\r\n    <tbody>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td colspan=\"6\">移动娱乐两不误 市售双显卡笔记本</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>联想</td>\r\n            <td><u>G460AL-ITH(A)(网购最低价 3899元)</u></td>\r\n            <td>i3 380M</td>\r\n            <td>310M\r\n            <p>&nbsp;</p>\r\n            <p style=\"text-indent: 2em\">集成Intel HD Graphics</p>\r\n            </td>\r\n            <td>14</td>\r\n            <td>3950</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>惠普</td>\r\n            <td>ProBook 4321s(WP413PA)</td>\r\n            <td>i3 330M</td>\r\n            <td>HD4350\r\n            <p>&nbsp;</p>\r\n            <p style=\"text-indent: 2em\">集成Intel HD Graphics</p>\r\n            </td>\r\n            <td>13.3</td>\r\n            <td>4300</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>DELL</td>\r\n            <td>灵越14R(Ins14RD-458)</td>\r\n            <td>i5 480M</td>\r\n            <td>HD5650\r\n            <p>&nbsp;</p>\r\n            <p style=\"text-indent: 2em\">集成Intel HD Graphics</p>\r\n            </td>\r\n            <td>14</td>\r\n            <td>5999</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>索尼</td>\r\n            <td>S136EC/P</td>\r\n            <td>i3380M</td>\r\n            <td>310M\r\n            <p>&nbsp;</p>\r\n            <p style=\"text-indent: 2em\">集成Intel HD Graphics</p>\r\n            </td>\r\n            <td>13.3</td>\r\n            <td>6499</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>华硕</td>\r\n            <td>N43EI46JM-SL</td>\r\n            <td>i5 460M</td>\r\n            <td>GT 435M\r\n            <p>&nbsp;</p>\r\n            <p style=\"text-indent: 2em\">集成Intel HD Graphics</p>\r\n            </td>\r\n            <td>14</td>\r\n            <td>6600</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p style=\"text-indent: 2em\">联想G460AL-ITH(A)算是现在正热销的主流14寸入门级产品，目前这款笔记本的媒体价为3950元，主流的i3 380M+NVIDIA GeForce 310M及集成Intel HD Graphics配置，值得让你关注！</p>\r\n<p style=\"text-indent: 2em\"><b>优点：新外观新工艺，更时尚，优秀的电池寿命延长技术。</b></p>\r\n<p style=\"text-indent: 2em\"><b>不足：随机软件比较多导致开机比较慢。</b></p>\r\n<p style=\"text-indent: 2em\"><b>适用人群：适用于背电脑上下班族，偶尔星巴克开开游戏，看看高清。</b></p>\r\n<p>&nbsp;</p>\r\n<center><img alt=\"移动娱乐两不误 市售双显卡笔记本推荐\" src=\"http://img1.cache.netease.com/catchpic/6/6E/6EF349463DE5D4837A493DFDA4C6F3AC.jpg\" border=\"0\" /></center>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\">▲新外观，更时尚。源自咆哮和设计的动感线条，时尚流畅。</p>\r\n<p style=\"text-indent: 2em\">采用精密蚀纹工艺，魔幻黑塑材经高温处理后，在表面形成微小坚硬的颗粒，整机不仅具有冷酷简洁的感觉，而且魔幻黑外表更耐磨，永不褪色</p>\r\n<p>&nbsp;</p>\r\n<center><img alt=\"移动娱乐两不误 市售双显卡笔记本推荐\" src=\"http://img1.cache.netease.com/catchpic/A/AE/AE513E345C8C77C64AD2CC8D1E846E5B.jpg\" border=\"0\" /></center>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\">▲纹理掌托和高触感键盘</p>\r\n<p style=\"text-indent: 2em\">增厚的菱形组合纹理掌托，提供适中的摩擦触感，让使用者更加舒适，更加轻薄，更显品味，全新设计的联想高触感键盘，改进功能键标识布局和方向键的分区设计，不仅使输入速度快、输入正确率高，更满足输入舒适的需求。</p>\r\n<p>&nbsp;</p>\r\n<center><img alt=\"移动娱乐两不误 市售双显卡笔记本推荐\" src=\"http://img1.cache.netease.com/catchpic/3/35/35BBBDEC447CFF30BFE7C03977BE374D.jpg\" border=\"0\" />　<img alt=\"移动娱乐两不误 市售双显卡笔记本推荐\" src=\"http://img1.cache.netease.com/catchpic/3/39/39ACD4460A6B4F111A2C9A339E8D39DD.jpg\" border=\"0\" /></center>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<center><img alt=\"移动娱乐两不误 市售双显卡笔记本推荐\" src=\"http://img1.cache.netease.com/catchpic/9/9B/9BCEE7DCBD6BC5775DC5C9CB46C43E54.jpg\" border=\"0\" />　<img alt=\"移动娱乐两不误 市售双显卡笔记本推荐\" src=\"http://img1.cache.netease.com/catchpic/A/A6/A6A1EC83CD1A6EE96A2B02924AC7C636.jpg\" border=\"0\" /></center>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\">▲机身两侧几口以及电池插口</p>\r\n<p style=\"text-indent: 2em\">接口方面，配备2个USB2.0, 1个USB/eSATA两用接口、1个VGA、RJ45网线接口、1个ExpressCard/34 以及五合一读卡器。</p>\r\n<p style=\"text-indent: 2em\">配置方面，联想搭载英特尔酷睿i3-380M处理器(主频为2.53GHz(网购最低价 8998元)、三级缓存为3MB)，英特尔HM55主板芯片;标配2GB DDR3内存、500GB硬盘、DVD刻录光驱;采用NVIDIA GeForce G310M独立显卡以及集成Intel HD Graphics显卡，拥有1GB显存，性能相当不错，足以满足日常工作和娱乐的应用。</p>\r\n<p style=\"text-indent: 2em\">\r\n<table cellspacing=\"1\" cellpadding=\"0\" width=\"98%\" align=\"center\" bgcolor=\"#cccccc\" border=\"0\" style=\"font-size: 12px\">\r\n    <tbody>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td colspan=\"2\">G460AL-ITH(A）</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>处理器</td>\r\n            <td>Intel 酷睿i3 380M（主频2.53GHz，三级缓存3MB）</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>芯片组</td>\r\n            <td>Intel HM55</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>标配内存</td>\r\n            <td>2GB DDR3</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>硬盘容量</td>\r\n            <td>500GB 5400转</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>光驱</td>\r\n            <td>DVD刻录机</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>显示芯片</td>\r\n            <td>NVIDIA GeForce 310M+Intel HD Graphics，显存1GB</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>屏幕</td>\r\n            <td>14英寸，比例16:9，分辨率1366&times;768</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>网络/无线</td>\r\n            <td>百兆以太网卡，无线上网 802.11b/g/n(300Mbps)</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>外部接口</td>\r\n            <td>3个USB2.0，，VGA，音频输出, 麦克风输入，RJ45网线接口，1个ExpressCard/34，5合1读卡器</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>电池</td>\r\n            <td>6芯锂电池</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>重量</td>\r\n            <td>2.2千克</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>操作系统</td>\r\n            <td>DOS</td>\r\n        </tr>\r\n        <tr bgcolor=\"#ffffff\">\r\n            <td>价格</td>\r\n            <td>3950元</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-indent: 2em\"><b>编辑点评：</b>G460AL-ITH(A）作为使用新i3 380M的主流低价位产品，拥有超炫的外观，键盘手感也非常的好，使用的变速控温风扇使的噪音也比同类产品要小，配置上搭载的NVIDIA G 310M独立显卡，处理日常的事务以及游戏娱乐都能轻松应对，它继承了联想G系列本的稳定耐用的优点，这个价位绝对值得拥有。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('108', '<div style=\"text-align: center\"><img title=\" 勇气号跋涉路线\" alt=\" 勇气号跋涉路线\" src=\"http://i1.sinaimg.cn/IT/2010/0223/201022394745.jpg\" /></div>\r\n<div style=\"margin: 5px 0px; text-align: center\">勇气号跋涉路线</div>\r\n<div style=\"text-align: center\"><img title=\"2004年1月4日登陆火星\" alt=\"2004年1月4日登陆火星\" src=\"http://i1.sinaimg.cn/IT/2010/0223/201022394813.jpg\" /></div>\r\n<div style=\"margin: 5px 0px; text-align: center\">2004年1月4日登陆火星</div>\r\n<div style=\"text-align: center\"><img title=\" 勘测火星岩石\" alt=\" 勘测火星岩石\" src=\"http://i1.sinaimg.cn/IT/2010/0223/201022394826.jpg\" /></div>\r\n<div style=\"margin: 5px 0px; text-align: center\">勘测火星岩石</div>\r\n<p>　　新浪科技讯 北京时间1月4日消息，美宇航局火星探测器&ldquo;勇气&rdquo;号在1月3日迎来了登陆火星7周年的特殊日子，不过，由于受困于沙地，它在一年半的时间内仅仅行进了4.8英里(约合7.7公里)，从2010年3月便与科学家失去了联系。</p>\r\n<p>　　虽然1月3日是一个颇具纪念意义的日子，不过，由于失去联系，给&ldquo;勇气&rdquo;号的未来蒙上了一层阴影。美宇航局目前也不清楚&ldquo;勇气&rdquo;号是死是活，但仍在孜孜不倦地寻找受困于沙地的&ldquo;勇气&rdquo;号可能发出的信号。美宇航局火星探测项目主管戴夫&middot;拉维利(Dave Lavery)说：&ldquo;&lsquo;勇气&rsquo;号或许永远不再苏醒过来，的确存在着这种可能性。&rdquo;</p>\r\n<p>　　2009年4月，&ldquo;勇气&rdquo;号在向后行进时被困于沙地。实际上，在与科学家失去联系以后，两艘火星轨道探测器每天从火星上空经过时，都在搜寻&ldquo;勇气&rdquo;号可能发出的信号。在帮助&ldquo;勇气&rdquo;号脱困的几次努力失败后，美宇航局科学家向它发送了新的指令，令其在被困期间继续实施科学观测任务。</p>\r\n<p>　　2010年3月，&ldquo;勇气&rdquo;号突然失去与地面的联系，科学家原以为它进入休眠状态以节省能量。在这次&ldquo;深睡眠&rdquo;期间，通讯和其他活动全部中止，以便能量用于加热电池和充电。根据设计，&ldquo;勇气&rdquo;号会在电池充满电以后尝试结束休眠状态。科学家对与&ldquo;勇气&rdquo;号失去联系深感失望，但仍抱着它会重新醒来的希望。</p>\r\n<p>　　美国康奈尔大学教授、火星探测任务首席科学家史蒂夫&middot;斯奎尔斯(Steve Squyres)说：&ldquo;我不准备与&lsquo;勇气&rsquo;号说再见。这一时刻终会到来，但不是现在。&rdquo;随着火星上一天天过去，太阳在天空中的高度越来越高，到达&ldquo;勇气&rdquo;号太阳能电池板的阳光就会越来越多。太阳将在3月中旬到达最高点，随后，从&ldquo;勇气&rdquo;号那里收到信号的几率会越来越小。</p>\r\n<p>　　拉维利说，如果&ldquo;勇气&rdquo;号在3月仍未向地面发回信号，&ldquo;可能以后也不会了。&rdquo;据拉维利介绍，任务小组在3月过后仍不放弃寻找&ldquo;勇气&rdquo;号的努力，只不过每日穿越火星的规模会缩小。&ldquo;勇气&rdquo;号及其孪生探测器&ldquo;机遇&rdquo;号的设计寿命只有三个月，所以，即便永远不会醒来，它仍创造了辉煌。&ldquo;勇气&rdquo;号2004年1月3日在火星登陆，&ldquo;机遇&rdquo;号也在三个月后接踵而至。这两个探测器都发现了火星曾经有水的地质证据。</p>\r\n<p>　　&ldquo;机遇&rdquo;号迄今已在火星上漫游了16.4英里(约合26.4公里)，而且没有表现出停止漫游的任何迹象。最近，&ldquo;机遇&rdquo;号驶往一个直径300英尺(约合91米)的陨石坑，在那里停留几个月后，将向最终的目的地&mdash;&mdash;&ldquo;奋进&rdquo;陨石坑进发。如今，科学家只能沉湎于对&ldquo;勇气&rdquo;号过去辉煌的回忆。美国亚利桑那州立大学天文学家吉姆&middot;贝尔说：&ldquo;如果&lsquo;勇气&rsquo;号的火星之旅真的结束，将留下许多遗憾，但它带给我们的记忆是美好的。&rdquo;(孝文)</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('109', '<div class=\"img_wrapper\" style=\"text-align: center\"><img title=\"研究指人类大脑在过去2万年缩小150立方厘米，足有网球大小。 资料图片\" alt=\"研究指人类大脑在过去2万年缩小150立方厘米，足有网球大小。 资料图片\" src=\"http://i1.sinaimg.cn/IT/2011/0103/U2727P2DT20110103174925.jpg\" /></div>\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><span class=\"img_descr\">研究指人类大脑在过去2万年缩小150立方厘米，足有网球大小。 资料图片</span></div>\r\n<p>　　最近一项新的研究指出了一个我们都不愿接受的事实&mdash;&mdash;人类的大脑在过去的2万年间逐渐缩小，体积由1500立方厘米，下跌至1350立方厘米，减少的大脑足有网球大小。这意味着我们变得越来越笨吗？</p>\r\n<p><strong>　　2万年中不断缩小 减少1枚网球大小</strong></p>\r\n<p>　　据英国《每日邮报》今晨报道，研究者凯瑟琳&middot;麦考里夫在《发现》杂志上撰文指出，人类在进化的过程中可能越来越笨。因为最新的报告显示，人类大脑在过去的2万年中不断地缩小。</p>\r\n<p>　　&ldquo;过去2万年来&rdquo;，凯瑟琳说，&ldquo;男性脑容量从1500立方厘米缩小到1350立方厘米，这个差距相当于1枚网球大小；女性的脑容量缩小比例与此相同。&rdquo;</p>\r\n<p>　　一些理论指出，现代人类户外活动较少、食物较易消化，所以大脑的某些功能退化，加上婴儿死亡率下降，令脑部体积较小的婴儿得以生存，人类脑部的平均体积下降。</p>\r\n<p><strong>　　大脑减少能量消耗 利用率在不断提高</strong></p>\r\n<p>　　对此持反对意见的科学家们立刻作出反驳。美国康斯威辛大学人类学家约翰&middot;霍克斯说，&ldquo;从社会现象来看，人脑不断缩小并不必然代表人类的智慧也在衰退中。&rdquo;</p>\r\n<p>　　人类的用脑量终其一生也不会超过大脑总容量的20%，然而大脑无时无刻不在消耗着大量的能量。较小的脑部会消耗较少能量，更快完成发育。</p>\r\n<p>　　人类不断缩小的大脑，不但不会影响我们的智力，还能够为我们省下不必要的能量消耗，这是典型的进化体现。此外，人类人口在2万年至1万年前快速增长，引发突变，脑部变小，但神经化学物质提高了脑部的能力。虽然容量在缩小，可是大脑的利用率却不断地提高。</p>\r\n<p><strong>　　人们专注发展所长 脑部一些功能退化</strong></p>\r\n<p>　　美国密苏里大学认知科学家大卫&middot;吉里做了一项研究，结果显示，当人口密度低时，人类头骨会扩大；但当某个地区的人口由稀少转为稠密时，头骨尺寸就会缩小。他们推论，当日趋复杂的社会出现后，人脑就会缩小，因为这时人类无须像以往一般机敏就能生存。</p>\r\n<p>　　吉里指出，人类社会越趋复杂，人们可以专注发展所长，不用兼顾多样技能，所以脑部一些功能退化，令脑部缩小。编译/赵展</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('110', '<p>&ldquo;乔布斯是我的榜样，他一生中干了很多事，每一件事都改变了时代。&rdquo;</p>\r\n<p><strong>3721留下的惨痛教训</strong></p>\r\n<p>理财周报：在你做了这么长时间安全软件之后，仍然有很多人在质疑你当初&ldquo;3721&rdquo;的创业史，有什么感想？</p>\r\n<p>周鸿祎：其实我已经摆脱了3721的影响，现在中国几亿用户选择360就是对我最大的肯定。马化腾和李彦宏都做过流氓软件，中国屁股不干净的互联网 公司多了，但不能因为一个人犯过一次错误就永远把他看成一个坏蛋。这些年我积极的向用户致歉并努力弥补，也许我不做360，大家都会淡忘这段过去。但我后 来选择做安全软件，与流氓软件作斗争，这就触及了很多人的既得利益，所以他们才会无休止的翻旧账。我要真是一个坏人，这么多年应该有很多事可以说，但是翻 过来倒过去就是3721那点事，因为我没有什么别的污点。</p>\r\n<p>理财周报：3721这段经历给你最大的教训是什么？</p>\r\n<p>周鸿祎：无论你有多好的技术，有多聪明的头脑，也必须要重视用户体验，不能得罪用户，一旦有了一个污点，确实需要很长时间来洗刷和纠正。也正是因为 在3721上吸取了教训，我现在有些矫枉过正，我做360会极端重视用户利益，这才让360得到了众多网民的肯定，某种程度上来说，没有3721其实也就 没有今天的360。</p>\r\n<p><strong>自认为是悲情英雄</strong></p>\r\n<p>理财周报：创办360的初衷更多是基于商业考虑还是理想主义？</p>\r\n<p>周鸿祎：做360最需要的不是技术而是勇气，我们做的是断人财路的事，如果没有理想主义情怀那确实不敢做。我们应该把自己做的事情看成一半是现实商 业，一半是理想公益。虽然在现实商业中我们可能并没有取得伟大的成功，但是我们保护了广大网民，到哪都有我的用户，这样的成就感是单纯的商业利益无法满足 的。</p>\r\n<p>理财周报：你总提到&ldquo;英雄&rdquo;这个词，觉得自己现在是英雄吗？</p>\r\n<p>周鸿祎：照世俗的标准我确实不是英雄，但我敢做对社会有益的事，敢说别人不敢说的话，追求自己的理想，我是一个有英雄情结并努力想成为一个英雄的人，但我们这种理想主义出发的人往往缺乏手腕和城府、不太懂人情世故，最后都会成为悲情英雄。</p>\r\n<p>现在为什么缺少创新，就是因为大家都以成败论英雄，我特别不赞同这种观点。创新意味着你失败的几率也很大，但是失败的英雄也是英雄。太多创业者不敢 创新，经不起失败，所以等别人去做，他们再出手收拾残局。他们的观念是，管他什么手段，只要挣钱，就是英雄。我认为这叫&ldquo;成功的商人&rdquo;，不叫英雄。</p>\r\n<p>理财周报：英雄主义情结为你的企业管理会带来哪些正面或者负面的影响？</p>\r\n<p>周鸿祎：我确实是个有英雄主义情结的人，这让我和我的企业不屑于简单的模仿，敢于创新，敢做别人不敢做的事。负面的影响当然也有，那就是我可能不太 在乎公司的收入，甚至会为了理想放弃一部分收入，这让我难以做到商业意义上的巨大成功。另外这样的英雄主义情结会让自己在现实中碰壁，被围殴，甚至被打击 得遍体鳞伤。</p>\r\n<p><strong>&ldquo;今后说话会注意一点&rdquo;</strong></p>\r\n<p>理财周报：在行业内有如此多&ldquo;对头&rdquo;，不怕360被置于死地吗？</p>\r\n<p>周鸿祎：在我们被骂得最凶的时候，我确实感觉我们快要被骂死了，可能做不起来了。但后来我们发现，平时沉默的用户，其实很清楚谁做的是对他们有益的事情，他们用脚投票，360的用户量迅速成长。所以只要你不是为了</p>\r\n<p>一己私利，而是为了用户利益得罪了同行，就算一时被骂得狗血喷头，但最后还是能够走出来。在中国的互联网业，一旦你赢得了用户的支持，就能顶住一切。</p>\r\n<p>理财周报：有报道说，历次争端你其实都预先进行了细致的沙盘推演，是这样吗？</p>\r\n<p>周鸿祎：很多人都把我想得城府很深，其实我根本没做什么谋划，也不愿意想那么多，况且计划也永远赶不上变化。我其实一直都是从用户角度出发，做用户需要的东西，没想到引爆了一个火药桶，得罪了那么多人，大家都来围攻我，而我都是被迫应战的，只能硬着头皮上，没有别的选择。</p>\r\n<p>理财周报：在经历了这么多纷纷扰扰之后，你有没有进行过反思？</p>\r\n<p>周鸿祎：人都是要走向成熟的，过去的我可能太心直口快了，说话又喜欢举例子，说哪家公司做得不太好，不小心就得罪了很多公司，以后在这方面可能会注 意一点。更重要的是，无论和同行怎么拉扯，都不能把用户的利益搭进去，用户永远是最重要的。对于3Q大战，我不想说太多，360目前能做的事只有两件，第 一，不管别人怎么说,先自己反思；第二；继续奉行为用户做好产品,做免费的好产品策略,余下的都是浮云。</p>\r\n<p>理财周报：如果要给马化腾带句话，你想对他说什么？</p>\r\n<p>周鸿祎：马化腾一直在商业上做得很好，但是出了这件事后，我想跟他说，我们互相抱怨和推卸责任已经没有用了，用户的利益已经受到了损伤。如果腾讯能从这件事中吸取一定教训，做出一些改变，那对它未来的发展也是很有利的，坏事也就变成好事了。</p>\r\n<p><strong>最好的朋友是丁磊</strong></p>\r\n<p>理财周报：你心目中的英雄是谁？</p>\r\n<p>周鸿祎：乔布斯是我的榜样，他一生中干了很多事，每一件事都改变了时代。当年<a href=\"http://quotes.money.163.com/usstock/hq/AAPL.html\">苹果</a>机改变了个人电脑，OS改变了图形环境，成为windows前身。iPod、iTouch改变了唱片业，投资皮克斯改变了动画工业，iPhone改变了手机移动领域，做iPad又颠覆了平板传统的笔记本。如果能达到类似这样的一种成就，我觉得自己就能获得心灵的安宁了。</p>\r\n<p>理财周报：你的&ldquo;仇人&rdquo;很多，那在互联网业界，你的朋友是谁？</p>\r\n<p>周鸿祎：我和丁磊（网易公司创始人）关系不错，他也是做技术出身，对技术的细节比较关注，没有太大的野心，不想搭建帝国，不做作不虚伪，也不管别人 怎么看，他只想做自己喜欢做的事，比如养猪。我和王雷雷（TOM.COM中国区运营总经理）也是好朋友，他虽然是高干子弟出身，但工作非常拼命，对产品细 节非常用心。</p>\r\n<p>理财周报：你指责的对象很多，在业内你最敬佩的企业家是谁？</p>\r\n<p>周鸿祎：任正非，我觉得华为一直在脚踏实地的投入研发，他的对手都不是小公司，而他敢于跟他们竞争，而且也是国内少数能与国外大公司竞争的公司之一，这种胸怀和气魄是我很欣赏的。</p>\r\n<p>理财周报：在你的创业生涯中影响最大的是谁？</p>\r\n<p>周鸿祎：我的投资人王功权，他是爱憎非常分明的人，有意见一定要表达，而且非常尖锐，入木三分，也鼓励我鲜明的表达立场。他曾是万通六君子之一，有 一套方法论，对人很有洞察力，对做企业也很了解，经验非常丰富。奇虎在早期没做360之前，做了很多不专注的东西，他就跟我说，你现在做了搜索，越做越像<a href=\"http://quotes.money.163.com/usstock/hq/BIDU.html\">百度</a>，你又做了一个门户，越做越像<a href=\"http://quotes.money.163.com/usstock/hq/SINA.html\">新浪</a>，这从一个旁观者的角度一下把我给点醒了，让我反思到底错在哪里，并最终找到了正确的方向。</p>\r\n<p><strong>&ldquo;未来一定会离开360&rdquo;</strong></p>\r\n<p>理财周报：未来360的发展方向是什么？</p>\r\n<p>周鸿祎：很多市值很高的互联网公司，我却看不起他们，他们没有价值观，疯狂遏制创新企业，什么广告都敢接，顶多是一个会赚钱的公司，但他们没法赢得 用户的尊重。我希望360能成为像google一样受人尊敬的伟大公司。企业发展到一定阶段，就应该考虑如何在自己的行业领域内，做对社会有益的事情。先 去不择手段的赚钱再去做慈善买个好名声是很虚伪的。</p>\r\n<p>理财周报：听说您还有一重身份是天使投资人？</p>\r\n<p>周鸿祎：比起做企业，风险投资是一个真正能长久干下去、产生价值的工作。所以我坚持利用360的资源和资金，扶持一些早期的公司。支持年轻人的小公 司起来颠覆大公司的游戏规则，这是我最喜欢做的。我创业十几年，有很多成功或失败的经验和教训，都可以提供给他们，帮助他们少走弯路，更好的发展。</p>\r\n<p>理财周报：投资的回报情况怎么样？</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>周鸿祎：如果你做天使投资是期望获得很高的回报，那你恐怕会失望。我投资的好多项目都血本无归，全当做公益了。在我做的投资中，有三分之一的项目是失败的，但也有迅雷、酷狗、discuz等一批成功企业。从概率上来讲，投10个公司总会有一个成功，那成本也就收回来了。</p>\r\n<p>理财周报：未来有没有可能离开360，只专心的做天使投资？</p>\r\n<p>周鸿祎：我觉得一定会是这样，我一直相信，互联网的未来是属于年轻人的，随着我们年纪慢慢变大，对互联网的感觉会越来越不敏锐，对新生代用户会越来 越把握不了。我们已经在提拔年轻的80后管理人才，要承认自己不能永远立在潮头浪尖，要去扶持年轻一代，我的性格让我很难变成那种传统意义上所谓伟大的企 业家，那也不是我的梦想，我更愿意将来去做天使投资人。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('111', '<div class=\"img_wrapper\" style=\"text-align: center\"><img title=\"&ldquo;熊猫牛&rdquo;\" alt=\"&ldquo;熊猫牛&rdquo;\" src=\"http://i0.sinaimg.cn/IT/2011/0103/U5606P2DT20110103101154.jpg\" /></div>\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><span class=\"img_descr\">&ldquo;熊猫牛&rdquo;</span></div>\r\n<p>　　本报讯 美国科罗拉多州农民培育出一头&ldquo;身体颜色分布类似大熊猫&rdquo;的小牛犊(见上图)。这种所谓的&ldquo;熊猫牛&rdquo;现在全世界只有24头。它们成年后身材依旧娇小，看上去十分可爱。这个名叫&ldquo;本&rdquo;的小家伙去年12月31日清晨出生在拉米拉县的一家农场内。</p>\r\n<p>　　据报道，&ldquo;熊猫牛&rdquo;是一种通过人工基因改良培育的宠物。这种小牛最可爱的地方就是它们的脸是白色的，而且长着同熊猫类似的黑眼圈。据悉，&ldquo;熊猫牛&rdquo;每头售价3万美元。除了&ldquo;熊猫牛&rdquo;外，上述农场还培育出来迷你驴和迷你袋鼠供宠物爱好者挑选。</p>\r\n<p>　　资料显示，&ldquo;熊猫牛&rdquo;是美国农民历时44年研制出的&ldquo;杰作&rdquo;，并以其独特造型广受顾客欢迎。由于&ldquo;熊猫牛&rdquo;身材太小，只能在羊圈里生活。此前，一个来自中国的代表团对&ldquo;熊猫牛&rdquo;非常感兴趣，并表示要从美国进口一些用于展览之用。(仁民)</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('112', '<p>2010年12月27日，几位来自东北的宇通客户因为及时提到了车，在宇通大厦楼上的餐厅推杯换盏，喜形于色，还有一些来自天南海北的客户不得不选择在专门针对客户营业的宇通大厦客房里入住，等待提车的消息。</p>\r\n<p>过去的一年，这样的热闹场景一直在宇通大厦内上演。年产销4万辆的成绩相对于乘用车企业来说微不足道，但足以保证<a href=\"http://quotes.money.163.com/0600066.html\">宇通客车</a>稳住客车行业的第一把交椅。</p>\r\n<p>在宇通客车总裁汤玉祥看来，客车市场对于中国汽车行业来说是小众市场，仅凭客车产品并不足以保证宇通客车未来的发展和壮大，宇通也在考虑在适当的时候扩展业务的范围。</p>\r\n<p>&ldquo;宇通对于未来3~5年有着清晰的规划，可以肯定的是，宇通绝不会开展轿车业务。&rdquo;汤玉祥在接受《每日经济新闻》记者（以下简称NBD）采访时表示。</p>\r\n<p><strong>考虑拓展轻型客车</strong></p>\r\n<p><strong>NBD</strong>：宇通实现了年产销4万辆，您觉得这一成绩对于客车行业的意义是什么？</p>\r\n<p><strong>汤玉祥</strong>：今年整个客车行业大概产销14万~15万辆，基础是中国经济发展的需要。宇通产销4万台，行业实现了一定的集中度，同时科学合理性提高，原来我们的集中度太低，导致行业发展不健康。</p>\r\n<p><strong>NBD</strong>：宇通2010年销量同比增长1万多辆，导致现在产能出现不足，是不是年初做计划时对2010年市场的预判有点保守？</p>\r\n<p><strong>汤玉祥</strong>：预判保守是一方面，我们没想到行业会有这么高的增长，但是我们的产能不是一天两天能建立起来的。2007年我们已经计划要把产能扩展至5万辆，但由于各种原因没有实现这一目标。</p>\r\n<p><strong>NBD</strong>：乘用车企业纷纷公布&ldquo;十二五&rdquo;规划，宇通有类似的规划么？</p>\r\n<p><strong>汤玉祥</strong>：宇通没有&ldquo;十二五&rdquo;规划，但对未来3年有一个短期的规划。客车这部分我们准备做到5万辆，加一部分<a href=\"http://quotes.money.163.com/1399941.html\">新能源</a>或者专用车可能会到6万台。为了配合这一目标的实现，我们准备再建5条生产线。</p>\r\n<p><strong>NBD</strong>：有消息说金龙正在筹划做轿车，宇通会拓展轿车业务吗？</p>\r\n<p><strong>汤玉祥</strong>：我们绝不会做轿车，但的确考虑过业务的拓展，比如轻型客车等等。</p>\r\n<p><strong>NBD</strong>：客车行业通常都是B2B的营销模式，这导致客车企业不太重视品牌建设，宇通在品牌打造方面是否有计划？</p>\r\n<p><strong>汤玉祥</strong>：品牌溢价是由市场决定的，不是我们自己来决定的。品牌建设有一个过程，虽然我们在行业内用户的知名度很高，但我感觉现在宇通还没到&ldquo;吹牛&rdquo;的时间。不过我们会陆续加大品牌推广方面的投入，比如央视的广告投放。</p>\r\n<p><strong>今年客车市场不乐观</strong></p>\r\n<p><strong>NBD</strong>：宇通的产品生命周期是怎样规划的？</p>\r\n<p><strong>汤玉祥</strong>：宇通车型更新的速度要快过乘用车，我们的产品生命周期大概在3~5年。</p>\r\n<p><strong>NBD</strong>：您对客车行业未来的发展是否作过预测?</p>\r\n<p><strong>汤玉祥</strong>：我认为客车行业会随着中国运输和全球运输的需要而发展，比如针对国内下一步公交优先、交通拥堵的问题，我们肯定会做好配合。还有一个趋势是，下一步行业集中度会逐渐提高，管理水平和工艺能力会逐步提高，宇通要起到引领行业的作用，并逐渐与国外企业接轨。</p>\r\n<p><strong>NBD</strong>：您怎么看待2011年的汽车市场？</p>\r\n<p><strong>汤玉祥：</strong>今年客车市场，以及卡车市场都不乐观。目前我们面临的最大困难就是产能不足，产能限制了我们的增长速度。有需求和订单，但是无法生产那么多车，这是很痛苦的。我认为今年的客车市场格局还会延续去年的状态。</p>\r\n<p><strong>新能源技术远未成熟</strong></p>\r\n<p><strong>NBD</strong>：包括宇通在内的国内客车企业都很重视出口，且这一块竞争非常激烈，宇通有什么样的策略？</p>\r\n<p><strong>汤玉祥</strong>：目前客车出口的确存在不规范竞争，出现了海外竞争国内化的现象，使得我们的整体出口降低了10%~20%。不规范竞争会损害中国产品的形象，因此客车出口需要严格的管理。宇通的出口采取经销和直销相结合的模式，而且以经销居多，即寻找海外销售合作伙伴。</p>\r\n<p><strong>NBD</strong>：海外业务占宇通销量的比重是多少？</p>\r\n<p><strong>汤玉祥</strong>：目前最多30%，我不会让这个比例增长到40%，因为海外市场稳定性很差，不稳定性会直接影响我们的出口业务，进而影响宇通整体的经营业绩。</p>\r\n<p><strong>NBD</strong>：目前宇通在海外有几家工厂，未来会扩大规模么？</p>\r\n<p><strong>汤玉祥</strong>：我们目前在伊朗和古巴有工厂，未来不会再增加海外工厂，主要是我们现在做海外市场的时间还很短，只有五六年。而且稳定的海外市场太少，还不具备进一步扩张的基础。</p>\r\n<p><strong>NBD：</strong>现在新能源汽车很热，宇通有什么新能源规划？</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p><strong>汤玉祥</strong>：其实我们在10年前就已经开始新能源方面的规划，但目前中国新能源技术远远没有达到成熟的程度。因此我们虽然一直在开展新能源产品方面的研究，但并没有过多地对外宣传。</p>\r\n<p><strong>NBD</strong>：宇通已经在新乡开始了新能源客车的示范运行？</p>\r\n<p><strong>汤玉祥</strong>：是的，我认为新能源汽车的应用应该从公共交通开始，而且会率先得到快速发展。我们的示范运行严格按照国家标准，在相对较大的城市进行尝试，希望通过实际运行提高我们的技术水平。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('113', '<div class=\"img_wrapper\" style=\"text-align: center\"><img title=\"SOHO探测器的第2000颗彗星，由波兰天文爱好者于12月26日发现 版权：SOHO/Karl Battams\" alt=\"SOHO探测器的第2000颗彗星，由波兰天文爱好者于12月26日发现 版权：SOHO/Karl Battams\" src=\"http://i2.sinaimg.cn/IT/2011/0104/U5385P2DT20110104081227.jpg\" /></div>\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><span class=\"img_descr\">SOHO探测器的第2000颗彗星，由波兰天文爱好者于12月26日发现 版权：SOHO/Karl Battams</span></div>\r\n<div class=\"img_wrapper\">\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><img title=\"SOHO卫星在太空运行的示意图。这艘专事太阳研究的飞船也承担起了彗星猎手的任务。 版权：NASA/ESA\" alt=\"SOHO卫星在太空运行的示意图。这艘专事太阳研究的飞船也承担起了彗星猎手的任务。 版权：NASA/ESA\" src=\"http://i1.sinaimg.cn/IT/2011/0104/U5385P2DT20110104081248.jpg\" /></div>\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><span class=\"img_descr\">SOHO卫星在太空运行的示意图。这艘专事太阳研究的飞船也承担起了彗星猎手的任务。 版权：NASA/ESA</span></div>\r\n<div class=\"img_wrapper\">\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><img title=\"96P Machholz彗星。它每6年回归一次，到目前为止SOHO探测器已经三次见到它接近太阳。在这张照片中，CME指代&ldquo;日冕物质抛射&rdquo;，又称&ldquo;日冕瞬变&rdquo;。这是一种太阳外层大气局部出现的大规模快速物质抛射现象。 版权：NASA/ESA/SOHO\" alt=\"96P Machholz彗星。它每6年回归一次，到目前为止SOHO探测器已经三次见到它接近太阳。在这张照片中，CME指代&ldquo;日冕物质抛射&rdquo;，又称&ldquo;日冕瞬变&rdquo;。这是一种太阳外层大气局部出现的大规模快速物质抛射现象。 版权：NASA/ESA/SOHO\" src=\"http://i3.sinaimg.cn/IT/2011/0104/U5385P2DT20110104081318.jpg\" /></div>\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><span class=\"img_descr\">96P Machholz彗星。它每6年回归一次，到目前为止SOHO探测器已经三次见到它接近太阳。在这张照片中，CME指代&ldquo;日冕物质抛射&rdquo;，又称&ldquo;日冕瞬变&rdquo;。这是一种太阳外层大气局部出现的大规模快速物质抛射现象。 版权：NASA/ESA/SOHO</span></div>\r\n</div>\r\n</div>\r\n<p>　　新浪科技讯 北京时间1月4日消息，据国外媒体报道，去年的12月26日，正当地球上的人们忙着迎接新年的到来时，太空中有一艘飞船却默默地迎来了属于它的里程碑：发现自己的第2000颗彗星。</p>\r\n<p>　　2010年12月26日，由美国宇航局和欧洲空间局合作运营的太阳与太阳风层探测器(SOHO)发现了它&ldquo;职业生涯&rdquo;中的第2000颗彗星。研究人员称，SOHO卫星的探测数据分析得到了全世界各地民间天文爱好者们的广泛参与，这也使它成为有史以来最伟大的彗星猎手。</p>\r\n<p>　　这一切是对&ldquo;多用途&rdquo;这一理念的最好诠释，因为SOHO的原设计目标是监视太阳，而非搜寻彗星。</p>\r\n<p>　　在一份声明中，来自美国马里兰州宇航局戈达德空间飞行中心的SOHO项目科学家琼&middot;古曼(Joe Gurman)说：&ldquo;自从1995年12月2日升空以来，SOHO卫星发现并确定轨道的彗星数量已经超过了过去300年的总和。&rdquo;</p>\r\n<p>　　<strong>民间爱好者的功绩</strong></p>\r\n<p>　　但SOHO卫星其实并不能自己发现彗星。实现这一伟大的成就靠的是全世界各地热心的民间爱好者们。借助互联网，他们在SOHO网站下载传回的照片并第一时间找到其中隐藏的彗星目标。</p>\r\n<p>　　美国宇航局官员称，在过去的15年间，有来自18个不同国家的70名爱好者成功地从可自由下载的SOHO图片中找到新彗星。</p>\r\n<p>　　根据美国宇航局的通告，SOHO的第1999和2000颗彗星都是在去年12月26日，由麦克&middot;库兹亚克(Michal Kusiak)发现的。他来自波兰克拉科夫的雅盖隆大学(Jagiellonian University)，是一名天文系学生。他在2007年发现了自己的第一颗SOHO彗星，在那之后他已经发现了100颗。</p>\r\n<p>　　&ldquo;很多人参与进来了，&rdquo;卡尔&middot;巴腾斯(Karl Battams)说。他任职于华盛顿的海军研究实验室，负责SOHO卫星的彗星搜寻网站的运行，以及飞船相机的计算机处理。&ldquo;这些人完全出于自愿，并且认真投入。如果没有这些人的努力，或许这么多彗星都将永远不会为人所知。&rdquo;</p>\r\n<p>　　在实际操作中，巴腾斯会接到全世界各地爱好者们的报告称某张SOHO图像中有某个模糊的目标可能是彗星。之后他会确认这些&ldquo;疑似&rdquo;目标并授予一个临时编号。随后他将这些信息发送至位于美国马萨诸塞州剑桥的小行星中心，这个中心负责全世界所有小天体的汇总编号以及轨道测定。</p>\r\n<p>　　研究人员称，SOHO探测器花了10年才取得1000颗彗星的发现成绩，但从1000颗到2000颗的目标，它只用了5年。这主要归功于更广泛的全球参与，以及不断改进的卫星图像处理技术。</p>\r\n<p>　　但这种发现数量的加速部分也可能是由于某种尚不能解释的原因，围绕太阳的彗星数量确实出现了系统性的增长。美国宇航局的官员称，光是今年12月份就新发现了37颗彗星，创下历史之最，几乎可以说是一场&ldquo;彗星风暴&rdquo;了。</p>\r\n<p>　　<strong>太阳研究飞船的&ldquo;副业&rdquo;</strong></p>\r\n<p>　　SOHO飞船最初的设计目标并非彗星，而是太阳。它搭载的设备可以遮住太阳日面，挡住强烈的阳光，从而使飞船能更好的看清相对暗弱的太阳外层大气，或称日冕。</p>\r\n<p>　　研究人员称，SOHO的彗星搜寻功能其实是一个自然产生的副产品。由于卫星设备遮掩日面，相当于形成&ldquo;人造日全食&rdquo;，平时被太阳强烈的光芒淹没的周围天体目标也就显露无疑。这样当然就更容易找到那些接近太阳的暗弱彗星目标。</p>\r\n<p>　　&ldquo;但是这样的研究确实意义重大，&rdquo;巴腾斯说，&ldquo;首先，我们现在知道，在内太阳系有着比我们之前意识到的多得多的彗星体，这将告诉我们很多有关这些彗星体从何而来，如何形成，以及如何分裂成碎块等诸多信息。我们现在已经可以确定，这些彗星体的很大一部分拥有共同的来源。&rdquo;</p>\r\n<p>　　巴腾斯同时补充说，目前已发现的SOHO彗星中约有85%属于同一族，称为&ldquo;克鲁兹彗星族&rdquo;(Kreutz family)。克鲁兹族彗星据信是大约数百年前一颗较大彗星分裂后的产物。</p>\r\n<p>　　克鲁兹族彗星属于&ldquo;掠日彗星&rdquo;，它们的轨道近日点太靠近太阳，因此在最接近太阳的几小时内它们就会被蒸发摧毁。但是也有很多SOHO彗星安全绕过太阳，并周期性的回归。其中一颗是96P Machholz彗星，它每6年回归一次，到目前为止SOHO探测器已经三次见到它接近太阳。(晨风)</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('114', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 据新华社电 火星作为太阳系中最近似地球的天体之一，对人类有一种天然的吸引力。火星探测是21世纪人类深空探测的重点之一，我国正在积极开展火星自主探测的相关研究。</p>\r\n<p>　　据中国空间技术研究院有关专家介绍，2011年，我国将与俄罗斯合作共同探测火星。与此同时，我国航天工业部门还先期启动了基于探月一二期技术的自主火星探测器研究和方案设计工作，目前正在积极开展技术攻关，目标是瞄准2013年的发射&ldquo;窗口&rdquo;，利用我国长征三号乙运载火箭发射。</p>\r\n<p>　　据悉，我国自主火星探测器的科学载荷重量达100公斤以上，科学探测能力将大大提高。</p>\r\n<p>　　我国首个火星探测器&ldquo;萤火一号&rdquo;原计划于2009年10月和俄罗斯的&ldquo;福布斯-土壤&rdquo;卫星一起，搭乘&ldquo;天顶&rdquo;号运载火箭从拜科努尔航天中心发射升空，后因故推迟到2011年10月。</p>\r\n<p><strong>　　■背景</strong></p>\r\n<p><strong>　　各国未来深空探测将涵盖整个太阳系</strong></p>\r\n<p>　　进入21世纪以来，大规模深空探测已成为人类重要航天活动之一。与以往相比，目标更明确、规模更宏大、参与国家更多。</p>\r\n<p>　　目前，世界各主要航天国家都将深空探测视为显示国家综合国力和国际地位的重要战略性领域，各国未来深空探测规划涵盖整个太阳系，既有以增强科学认知为主的科学探测活动，又有以扩大人类活动空间为最终目标的探索活动。</p>\r\n<p>　　在世界各国未来探测规划中，较为关注的探测目标是月球、火星、金星和小行星。</p>\r\n<p>　　我国的深空探测活动起步于月球，到目前为止，我国共实施了两次月球探测。嫦娥一号和嫦娥二号任务的圆满完成，使我国突破了地球外天体环绕探测关键技术， 研制了探测器、深空测控网、运载火箭等一系列功能单元，同时建立了基本配套的深空探测工程体系，为后续任务和深空探测奠定了坚实的物质和技术基础。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('115', '<p>据知情人士周一表示，美国著名社交网站Facebook已经从<a href=\"http://quotes.money.163.com/usstock/hq/GS.html\">高盛</a>集团和德国的一家投资公司Digital Sky Technologies手中获得了5亿美元的投资。</p>\r\n<p>在该交易中，高盛和DST对Facebook的估值达到了500亿美元，超过了eBay、<a href=\"http://quotes.money.163.com/usstock/hq/YHOO.html\">雅虎</a>、<a href=\"http://quotes.money.163.com/usstock/hq/TWX.html\">时代华纳</a>等公司的市值。</p>\r\n<p>此次与高盛达成的交易预示着Facebook的不断壮大。这些新的资金将使Facebook在争取优秀员工、开发新产品和进行潜在的收购上具备更多的弹药。此次投资还将允许老股东，包括Facebook的员工，套现至少部分股份。</p>\r\n<p>在此项交易进行的同时，美国证券交易委员会已经开始对日益受欢迎的私募股权市场中互联网公司的股份交易展开了调查，其中包括Facebook和Twttter等。一些专家表示，该调查的重点是查明某些公司是否不正当地使用私营市场以回避公开信息披露。</p>\r\n<p>尽管Facebook的高管拒绝让公司上市，但是此次投资将会增加Facebook在此方面的压力。<a href=\"http://quotes.money.163.com/usstock/hq/MSFT.html\">微软</a>公司和<a href=\"http://quotes.money.163.com/usstock/hq/GOOG.html\">谷歌</a>的股票就曾在私营市场大受欢迎，这最终迫使它们公开上市。</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>至今，Facebook的首席执行官马克&middot;扎克伯格仍排出了公司公开上市或出售的可能。但熟悉此次筹资活动的消息人士称，Facebook的董事会已经有意在2012年考虑出售该公司。</p>\r\n<p>此次交易可能会激起人们对Facebook在公开市场的市值的讨论。尽管该公司未公布具体财务信息，但分析师预计该公司是盈利的，并且每年的营收预计可达20亿美元。</p>\r\n<p>参与该交易谈判的人士表示，根据协议条款，高盛已经向Facebook投资了4.5亿美元，而俄罗斯投资公司DST已经投资了5000万美元。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('116', '<p>热闹的2010年过去了，伴随着各式各样的盘点，给力的，V5的，淡定&hellip;&hellip;</p>\r\n<p>在2010年，很多人经历了一次标志性的选择在腾讯和360之间，这是一个艰难的选择；2010，很多人也经历了一次标志性的选择写微博。</p>\r\n<p>辞旧迎新，因为有了微博，而多了一种形式和角度。中国银行业协会首席经济学家巴曙松说了，微博不错，省去了给许多朋友发新年短信的成本。而原新浪网 CEO、现点击科技总裁王志东则在微博上表述自己的新年：&ldquo;新年第一天，晚上就想干一件最无聊的事情。结果呆想了一整晚都不知道该干吗，然后想困了，然后 睡了。&rdquo;</p>\r\n<p>封存2010，走好2011，有人梳理自己的生命意识，有人静定生慧，一起看微博上的财经大佬的新年经历，热闹之外也有冷思考</p>\r\n<p><strong>李东生黄酒会晓波</strong></p>\r\n<p>2011年1月1日，微博上来了个李东生，也就是TCL集团股份有限公司董事长，他自称&ldquo;致力于中国电子产业发展的老兵&rdquo;。一时间粉丝窜至万余人， 其中一位是TCL集团品牌管理中心总经理梁启春，他说&ldquo;有失远迎&rdquo;，李东生自己说明：&ldquo;受曹国伟（新浪CEO）邀请。&rdquo;有人说&ldquo;起步太晚&rdquo;，李东生说&ldquo;今 天开博，今后努力&rdquo;。他的夫人、普乐普公关公司总裁魏雪在微博上为他宣传，&ldquo;东生也学着戴上围脖了。&rdquo;</p>\r\n<p>果然，1月2日，李东生写微博一直发到1月3日的凌晨。他和<a href=\"http://hkquotes.money.163.com/html/000268.html\">金蝶国际</a>软件集团董事局主席徐少春沟通了高尔夫球技，他和华工的师弟师妹叙旧话新，他也遭遇了微博失灵之惑。</p>\r\n<p>他思去念新：&ldquo;我们确实和三星、索尼这些国际企业有差距，但这种差距过去十年在不断缩小；我相信再有十年，中国企业就有能力和跨国企业全面抗衡。&rdquo;</p>\r\n<p>他还感叹了2010年的最后一天，&ldquo;在北京家里，和吴晓波（财经作家）温上黄酒聊了大半天，回顾了企业这30年的沟沟坎坎。国家要强大一定要有强大 的经济支撑，而强大的经济需要强大的企业。晓波说&lsquo;这些年各种诱惑很多，能坚守做实业的不多了。这是我最佩服你的。&rsquo;　30年，我抱定实业报国的理想，今 后也义无反顾。&rdquo;</p>\r\n<p>魏雪在微博上是这样描述的：&ldquo;北京很冷，零下10度，吴晓波老师一早冒着寒风来到家里，我温了黄酒，晓波老师和我先生聊创业历程，产业未来，相谈甚欢。&rdquo;</p>\r\n<p><strong>王巍的酒茶咖啡牌</strong></p>\r\n<p>元旦之夜，中华全国工商业联合会并购公会会长王巍在微博上感叹：&ldquo;三里屯北街的商店群已经开业，几乎全球最时尚的高端品牌都入驻了。十年前还是低档酒吧，现在变化真大。忽然想起二十年前在纽约过元旦的晚上，无法想象中国会有这样的地方。&rdquo;</p>\r\n<p>对于三天假期，王巍在1月2日的深夜用微博记录，&ldquo;下午被约出去打牌，双扣。当年在哈巴雪山上向山友学会的，每年爬山时都用打牌来应对高山反应和闲 暇时光。先定的一家佛家茶馆，佛乐扰人，茶也极贵。后到上岛咖啡，主人甚至提供纸牌。打了两圈，均大胜，兆头不错。在沈计靓汤吃晚饭。回来换电脑，从索尼 到<a href=\"http://quotes.money.163.com/usstock/hq/AAPL.html\">苹果</a>机，新年礼物。明日还有一天逍遥，乐也。&rdquo;</p>\r\n<p><strong>李瑜三亚奇遇记</strong></p>\r\n<p>1月又至，去年1月，禹容网络创始人CEO、前<a href=\"http://quotes.money.163.com/usstock/hq/GAME.html\">盛大游戏</a>CEO兼董事李瑜辞职与丈夫一起创办禹容网络，元旦假日，全家在三亚度假，李瑜还在微博上写下三亚的奇遇很多圈里圈外的朋友，江苏五星投资控股集团董事长汪建国是其中之一，汪建国也在微博上发布了一起晚餐的图片。</p>\r\n<p>对此巧遇，零点研究咨询集团董事长袁岳(<a href=\"http://yuanyueblog.blog.163.com/\">博客</a>)也在微博上提议：&ldquo;如果我们与一群企业家或者一群白领相约出行，是一种社交也是一种学习，旅行是比读书更棒的学习方法呢。&rdquo;</p>\r\n<p><strong>潘海东继续&ldquo;爱问</strong>&rdquo;</p>\r\n<p>2010年12月31日，互动百科CEO潘海东在微博上以自嘲的方式来总结和畅想：&ldquo;爱互动百科，爱wiki；爱说不靠谱，爱问李彦宏，也爱&lsquo;知识奴隶&rsquo;的玻璃贴；我学系统工程，也拍时尚杂志；我不是潘总，我是海东。&rdquo;</p>\r\n<p>海东就是海东，经典总要继续。2011年1月2日，他在微博上开始揭露<a href=\"http://quotes.money.163.com/usstock/hq/BIDU.html\">百度</a>上公开的代孕广告。</p>\r\n<p><strong>地产大佬在国外</strong></p>\r\n<p>元旦假期，SOHO中国董事长潘石屹和夫人张欣在英国，北京时间2011年1月1日零时，&ldquo;我们在伦敦的守基阿芬第灵墓前，为中国祈祷、为朋友们祈 祷，为家人祈祷。&rdquo;接着，去朋友家做客，发美食微博，不亦乐乎，只是，小潘的手机出了点儿问题，&ldquo;不知是不是新年短信太多的缘故，我的手机今天彻底&lsquo;死 机&rsquo;了。只能等到回国再修了。&rdquo;</p>\r\n<p>&ldquo;2011年第一缕阳光，风急浪高&hellip;&hellip;&rdquo;深圳万科股份有限公司董事长王石在日本，他是去考察日本的建筑，谈的最多的是设计师安藤忠雄，经常在微博上 发美景美图的王石，常常是在旅途中，时值新年，他自己澄清：&ldquo;万科的董事长并不是天天旅游，还要上网看资料，回信息；召开董事会、股东大会、必要的应酬等 等。&rdquo;</p>\r\n<p><strong>三个男人回家</strong></p>\r\n<p>元旦当日，前Google全球副总裁兼中国区总裁、现创新工场CEO李开复在微博上贴出&ldquo;三个孙女陪奶奶（我妈妈）打麻将&rdquo;的照片，&ldquo;孙女每次见到奶奶，都要送奶奶一件玩具。&rdquo;</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>1月2日，4399游戏董事长、著名天使投资人蔡文胜在微博上记下&ldquo;父亲的生日&rdquo;，&ldquo;今天是父亲的生日，回老家探望父母。我们一家有兄 弟姐妹四个加孩子们共十几个人，平时大家都居住在不同城市，很难得全部到齐了。我知道父母亲最开心的并不是给他们多少财物，而是一家人能经常聚会，聊聊 天，谈谈家常。照片（蔡文胜微博上有贴图）是父母亲和我哥哥两个孩子，妹妹两个孩子，左右二边是我的两个孩子。&rdquo;</p>\r\n<p>因为母亲生病，华远集团总裁任志强的新年有点儿累，&ldquo;新年第一天，最让全家人都高兴的事是母亲可以开口说话了。看来术后的情况良好。&rdquo;</p>\r\n<p>2010年的最后一天，任志强这样记录，&ldquo;今天是姐姐和嫂子的生日。一大家人晚上在一起聚餐。尽管昨晚一直忙到今早，哥哥，嫂子，老婆，妹妹，妹夫 们都睡眼蒙眬，但母亲的手术成功还是让大家暂时缓解了紧张的心情。姐姐为了母亲的病，刚从德国飞回北京，还在倒时差。加上下一代十多人排班，轮流去医院。 希望能岁岁平安。&rdquo;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('117', '<p>刚刚从美国读书回来的许丽准备重新装修房子，她整理出一大批闲置的二手物品，衣服、饰品、包包，甚至还有一个装猫咪用的篮子。</p>\r\n<p>如何处置它们成了一件让人头痛的事。按照美国的惯例，她登录了分类信息网站，在网上填写买卖信息，并留下联系方式，希望能够很快将杂物处理掉。</p>\r\n<p>不到两天许丽就将猫篮卖给了一个打电话来的男生，20元钱的售价，让对方兴奋不已，毕竟，一个质量过得去的猫篮，最起码也要上百元。</p>\r\n<p>除了二手物品的交换，许丽发现，她要&ldquo;过渡&rdquo;租房、买辆二手车以及找个钟点工的愿望都能通过这个网站实现。它就像一个海量信息发布的聚合平台一样。</p>\r\n<p>只找所有人需求中的最大公约数，挑出最普遍的那部分需求，这在许丽登录的百姓网的CEO王建硕看来，是分类信息网站安身立命的基础。</p>\r\n<p>&ldquo;分类广告是人类的基本需求，只是现在把原本放在平面媒体上的分类信息搬到互联网上而已，&lsquo;在线分类＋社区互动&rsquo;给了分类广告新的生存平台。&rdquo;</p>\r\n<p>提供网民生活领域的分类信息，定位本地化的生活应用服务，这就需要分类信息网站能有大而全的信息量。然而，承载这个庞大信息量的平台却简单得出乎想 象。王建硕将百姓网的模式，解读为&ldquo;只有四个网页&rdquo;，即首页、目录、信息填写、发布，但就是在这样一个简单的组合背后却是已达到年千万元级的收入规模。</p>\r\n<p><strong>分类网站大浪淘沙</strong></p>\r\n<p>10多年前，美国人克瑞格发明了一种网络表格，将各种信息在网上进行分类，给用户提供交易买卖、房屋租赁、求职招聘、求助救济等服务，　10年后， 克瑞格的公司craigslist网站年创利润已超过1000万美元，而craigslist就是分类信息网站。显然，中国的人多地广给分类信息市场的拓 展带去了更大的想象力。但在国内分类信息网站方兴未艾之时，美国的<a href=\"http://quotes.money.163.com/usstock/hq/EBAY.html\">eBay</a> ECG已成为了全球最大的分类网站集团，年收入超10亿美元。</p>\r\n<p>2005年，觊觎中国分类市场的eBay把其在该领域的第一枚中国棋子放在了客齐集身上（百姓网前身），王建硕至今仍记得5年前客齐集刚成立时，每天发布的信息只有个位数，网站浏览量更是少得可怜，对市场的培育远未开始。</p>\r\n<p>但是这一波浪潮来得很快，由于进入门槛低，在2005￣2006年之间国内分类信息网站已迅速膨胀到几千家，就连门户大哥们<a href=\"http://quotes.money.163.com/usstock/hq/SINA.html\">新浪</a>、<a href=\"http://quotes.money.163.com/usstock/hq/SOHU.html\">搜狐</a>、网易、腾讯都陆续推出了自己的分类频道。用户使用习惯及市场规模正在逐渐确立。</p>\r\n<p>然而，这并非是一个能赚快钱的行当。在经历2008年￣2009年金融危机寒冬后，散伙者、转行者比比皆是，剩下的客齐集、58同城网与赶集网仍然 固守阵地。尔后，从eBay阵营中分拆出来的客齐集正式改名为百姓网，王建硕也就此结束了其外资在华职业经理人的身份，开始自主操盘百姓网。</p>\r\n<p>谈及经历的这波浪潮，王建硕坦言这其中最大的门槛在于时间。谁能清晰地固守自有的模式，即抓住互联网的本源把分散的信息集合起来并让其流动。</p>\r\n<p>然而，要想在大浪淘沙中生存下来，分类信息网站背后的资本实力其实也不容小觑。自2008年以来，百姓网已经历两轮融资，首轮来自金沙江创投，第二轮则吸引了曾投资Twitter、Second Life等互联网新兴模式的美国VC标杆资本。</p>\r\n<p><strong>百姓网的&ldquo;固执&rdquo;</strong></p>\r\n<p>一位投资人告诉记者，规模是分类信息类网站拉开与竞争对手差距的首要前提，核心价值在于引导用户形成一定的使用黏性。</p>\r\n<p>王建硕显然也明白个中道理，大浪淘沙之后，他开始总结分类信息网站立足的基本前提，他将下一个竞争点归结于是建立在规模化基础上的一种服务比拼。</p>\r\n<p>目前房产、工作、二手车买卖、物品交易为百姓网浏览量最大的类目，虽然早有专业的房地产交易网站、招聘网站，甚至是淘宝在前，王建硕却认为百姓网与它们没有任何的竞争冲突。</p>\r\n<p>他向记者举例，比如招聘，只找需求量大的工种，厨师、服务员、工人、快递等等。&ldquo;招聘工人的数量永远比招聘程序员要多得多，企业在专业招聘网站上能招到CFO／CTO，但很少有企业会想去那里招一个普通的工人。&rdquo;他说。</p>\r\n<p>王建硕一再强调，百姓网的作用只是提供一个在本地能方便发布和查找信息的途径，最后要求能见面交易。&ldquo;一旦不是同城，不是面对面交易，不是最基本的核心需求，就是其他那些B2C网站该干的事了。&rdquo;</p>\r\n<p>但是，一个成立已有5年的互联网企业迄今为止却只有29名员工，其中绝大部分负责产品、运营和质量控制。这29人的产出却并不少。资料显示，目前百 姓网覆盖347个城市，每月浏览量近10亿次，每月新增信息量超过300万条。但与竞争对手每月砸上百万美元用于营销，建立遍布全国的销售团队相比，王建 硕却并不认同这种商业推广方式，坚持口碑效应。</p>\r\n<p>他给记者算了一笔账，维持一个销售团队运作的单人成本在2000￣3000元／月，一百通销售电话中可能就只能成交一单，这也就意味着单个付费用户的支出必须在2000元／月以上，才能维系销售团队的运作。</p>\r\n<p>&ldquo;目前百姓网每一个类目信息都按发布时间的新鲜度排序，但用户可通过支付一定费用使自己信息置顶，付费用户最便宜的是10元／30天，最贵则为300元／7天。&rdquo;他说，&ldquo;低价是因为没有销售团队，就无需将这部分的开支转嫁到用户身上。&rdquo;</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>但一位接触过分类信息网站的业内人士告诉记者，口口相传的这种营销模式只适合于创业初期，一旦企业步入成长阶段，就有可能拖垮其试图快速前进的步伐。分类信息网站真正的价值其实与其他互联网同行并无区别，即网站的有效点击率与成交量。</p>\r\n<p>然而，王建硕却并不在乎。&ldquo;现在是分类广告网站最初期阶段，这行不是靠钱砸出的游戏，相反现阶段用户是否喜欢，能促成多少量的成交是关键。&rdquo;</p>\r\n<p>易观国际分析师任洋辉认为，现阶段分类信息网站信息同质性高，用户对网站的黏性较低。</p>\r\n<p>&ldquo;在信息严重同质的环境下，分类信息网站用户互动性不强、用户的应用体验不足都是目前制约着分类信息网站发展的问题。&rdquo;任洋辉说。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('118', '<p>新浪体育讯　没有内线，只能靠三分，可是当三分武器也失效时，火箭还能拿出什么招数呢？</p>\r\n<p>　　新赛季打到现在，三分球一直是火箭克敌制胜的法宝。如果三分线外表现出色，火箭的胜率通常会比较高。对阵掘金前的那些比赛中，火箭有23场比赛比对手命中更多三分球 <!-- flash player begin --><style type=\"text/css\">\r\n				p .contentPlayer{margin-top:10px;}\r\n				.contentPlayer{float:left;width:336px;height:322px;background:url(http://i0.sinaimg.cn/cj/video_bg.png) no-repeat 0 0;margin:0 10px 10px -10px;*margin-right:7px;padding:1px 10px;_display:inline}\r\n				.contentPlayer a{text-decoration:underline;font-size:12px!important;}\r\n				.cp_player{padding:14px 0 0;text-align:center;height:249px;display:block;}\r\n				.cp_tit{padding:10px 0 0 18px;font-size:12px!important;line-height:20px!important;display:block;}\r\n				.cp_from{padding:0 0 0 18px;font-size:12px!important;line-height:20px!important;display:block;}\r\n				</style>\r\n<script type=\"text/javascript\">\r\n				var sinaBokePlayerConfig_o = {\r\n					container: \"p_player\",  //Div容器的id\r\n					playerWidth:298,     //宽\r\n					playerHeight:250,    //高\r\n					autoLoad: 1,        //自动加载\r\n					autoPlay: 0,        //自动播放\r\n					as:0,              //广告\r\n					tj:0             //推荐\r\n				};\r\n				</script>\r\n<script src=\"http://v.sina.com.cn/js/pg/play/playflash.js\" type=\"text/javascript\"></script>\r\n<!-- flash player end -->\r\n<script language=\"javascript\" type=\"text/javascript\">\r\n\r\n				sinaBokePlayerConfig_o.autoLoad = 0;\r\n				sinaBokePlayerConfig_o.autoPlay = 0;\r\n				SinaBokePlayer_o.addVars(\"vid\", 44557098);\r\n				SinaBokePlayer_o.addVars(\"as\", 0);\r\n				SinaBokePlayer_o.addVars(\"logo\", 0);\r\n				SinaBokePlayer_o.addVars(\"pid\", 6);\r\n				SinaBokePlayer_o.addVars(\"head\", 0);\r\n				SinaBokePlayer_o.addVars(\"tjAD\", 0);\r\n				SinaBokePlayer_o.addVars(\"tj\", 0);\r\n					SinaBokePlayer_o.addVars(\"vblog\", 2);\r\n					SinaBokePlayer_o.addVars(\"singleRss\", \"http://video.sina.com.cn/iframe/fourlists/p/sports/k/v/2011-01-04/104861226511.xml\");\r\n				SinaBokePlayer_o.showFlashPlayer();\r\n\r\n				</script>\r\n，这23场球的战绩是15胜8负，而其余7场三分球命中个数少于对手的，他们只有1胜6负。</p>\r\n<p>　　其中，火箭有9场比赛三分球命中数打到10个或10个以上，而这9场比赛他们的胜率是百分之百。不过，这10+三分必胜定律也在丹佛的夜晚里被冷风吹散，火箭全场投中了13个三分球，是赛季单场命中三分个数第二多的场次，但是仍然不足以帮助他们锁定一场胜利。106-113，客场告负已经让火箭的战绩变成16胜18负，和50%的胜率之间又有了一定的距离。</p>\r\n<p>　　回顾这场比赛，在三分命中数上，洛瑞命中4个，巴丁格投中3个，米勒进了两个，李、布鲁克斯&lsquo;马丁和巴蒂尔各进了1个，火箭的外线还是具备一定的火力威胁，可是无奈他们的内线过于孱弱，光靠外线得分也没法确保一场胜利。</p>\r\n<p>　　魔鬼的1月，已经让火箭和阿德尔曼尝到了一些苦头，他们也开始明白没有内线的篮球战术是很难获得成功的。三分球可以变成一刻的及时雨，却不能化作永远的救命稻草，真正要带领球队获胜不是靠猛投三分，而是由内而外的攻守平衡。现在，火箭的内线形同虚设，外线投得再好，也难以弥补内线缺漏带来的丢分。特别是海耶斯受伤后，火箭一直找不到内线的强点，防守不行，进攻也不行，老米勒本来就是在外面飘着打，希尔的状态陷入低谷，帕特森又太嫩了。</p>\r\n<p>　　再这么眼睁睁看着球队输下去，进而丢掉季后赛的门票，还是穷则思变，开始考虑通过交易引进一两个有战斗力的内线，莫雷的内心肯定开始激烈的斗争了。他渴望为未来赢得一个巨星，又不得不考虑到眼前的利益，如果翻天巨变很难实现，也许他还得从小打小闹开始，至少，先弄来个有用的中锋帮球队度过眼前的难关再说了。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('119', '<p>新浪体育讯　火箭在客场以106-113不敌掘金。蔡斯-巴丁格替补出场20分钟7投5中拿下13分，他似乎再次成为火箭失利后不多的亮点。</p>\r\n<p>　　昨日的比赛，已经就其超高的命中率展开了讨论，加上今天的7中5，巴丁格近四场 <!-- flash player begin --><style type=\"text/css\">\r\n				p .contentPlayer{margin-top:10px;}\r\n				.contentPlayer{float:left;width:336px;height:322px;background:url(http://i0.sinaimg.cn/cj/video_bg.png) no-repeat 0 0;margin:0 10px 10px -10px;*margin-right:7px;padding:1px 10px;_display:inline}\r\n				.contentPlayer a{text-decoration:underline;font-size:12px!important;}\r\n				.cp_player{padding:14px 0 0;text-align:center;height:249px;display:block;}\r\n				.cp_tit{padding:10px 0 0 18px;font-size:12px!important;line-height:20px!important;display:block;}\r\n				.cp_from{padding:0 0 0 18px;font-size:12px!important;line-height:20px!important;display:block;}\r\n				</style>\r\n<script type=\"text/javascript\">\r\n				var sinaBokePlayerConfig_o = {\r\n					container: \"p_player\",  //Div容器的id\r\n					playerWidth:298,     //宽\r\n					playerHeight:250,    //高\r\n					autoLoad: 1,        //自动加载\r\n					autoPlay: 0,        //自动播放\r\n					as:0,              //广告\r\n					tj:0             //推荐\r\n				};\r\n				</script>\r\n<script src=\"http://v.sina.com.cn/js/pg/play/playflash.js\" type=\"text/javascript\"></script>\r\n<!-- flash player end -->\r\n<script language=\"javascript\" type=\"text/javascript\">\r\n\r\n				sinaBokePlayerConfig_o.autoLoad = 0;\r\n				sinaBokePlayerConfig_o.autoPlay = 0;\r\n				SinaBokePlayer_o.addVars(\"vid\", 44559082);\r\n				SinaBokePlayer_o.addVars(\"as\", 0);\r\n				SinaBokePlayer_o.addVars(\"logo\", 0);\r\n				SinaBokePlayer_o.addVars(\"pid\", 6);\r\n				SinaBokePlayer_o.addVars(\"head\", 0);\r\n				SinaBokePlayer_o.addVars(\"tjAD\", 0);\r\n				SinaBokePlayer_o.addVars(\"tj\", 0);\r\n					SinaBokePlayer_o.addVars(\"vblog\", 2);\r\n					SinaBokePlayer_o.addVars(\"singleRss\", \"http://video.sina.com.cn/iframe/fourlists/p/sports/k/v/2011-01-04/112561226599.xml\");\r\n				SinaBokePlayer_o.showFlashPlayer();\r\n\r\n				</script>\r\n31投21中，命中率高达67.7%，作为一个替补球员这样的效率可谓惊人。从12月31日面对猛龙，10投8中拿下22分，创造赛季个人得分新高、职业生涯命中率新高至今，巴丁格均维持着较高的水准，可以说他已经跨过那堵&ldquo;新人墙&rdquo;，开始成为主帅里克-阿德尔曼所期盼的板凳匪徒之一。</p>\r\n<p>　　火箭在开局五连败后，阿帅就曾多次表达了要重用年轻球员的意思。当巴丁格受困于脚踝伤势，导致发挥不稳时，阿帅也是以鼓励和信任为主。作为一个用人死板，很难相信新人的教练来说，能够对二年级生巴丁格做到如此耐心，可见其对这位白人得分手的重视。如今这种重视确实换来了回报，阿帅正在打造一套杀伤力十足的第二阵容，而巴丁格似乎就是这套阵容中的先锋。</p>\r\n<p>　　此前巴丁格发挥不稳的问题，除去脚步受制于伤病外，最主要是在高对抗情况下，出手不够稳定。但这4场比赛，巴丁格能够保持住如此高的命中率，不仅是在出手手型上日趋稳定，且出手时信心倍增，更因为他与布拉德-米勒、库特尼-李、阿隆-布鲁克斯等替补搭档间默契的增加。</p>\r\n<p>　　更多的穿插、空切，让巴丁格能够获得更多轻松得分的机会，一旦巴丁格开始得分，他就可以为其他队友拉开空间，实际上也是为自己提供了更多的机会。巴丁格在大学时代，曾被看做是下一代布伦特-巴里，有着白人中顶尖的身体素质，教科书般的投篮技术以及水准之上的控球能力。但巴丁格的一大问题就在于不愿意对抗，持球突破没有侵略性。</p>\r\n<p>　　幸而在阿帅的普林斯顿体系下，他可以顺利的避开这些弱点，发挥其能投善扣的特点。现在的巴丁格已经可以作为替补获得稳定的出场时间，这有助于他培养更多的信心。对于火箭来说，有一个场均能够保持高效拿下10+以上分数的替补，将是为比赛的胜利添加很重的筹码，何况这个人还能持球还能连接其他队友？</p>\r\n<p>　　只是这远未是巴丁格潜力的极限。当初选秀夜的失意，就在于这位昔日的麦当劳全明星球员不喜欢对抗，没有侵略性，不能发挥自己的运动力优势。这将是巴丁格未来的发展方向，他不仅是要成为一个能够拿球的射手，而是要成为一个能够突破的得分手。这对于目前缺乏突破手的火箭，才能是更大的补充，也能为自己争取到更多的出场时间和球队地位。</p>\r\n<p>　　巴丁格就好似一把有待调试的弓箭，力道十足但准度欠佳，为了是用来涉猎还是仅仅是作为暖身训练用，还得看巴丁格能否提高自己的侵略性了。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('120', '<p>新浪体育讯　火箭负于丹佛掘金，凯文-马丁还是没能找到状态，在25分钟时间里15投3中，只博取1次罚球，只得到区区8分。这是马丁本赛季第一次得分少于10分。</p>\r\n<p>　　比赛还剩30秒，马丁命中一记中投，但此时已经是于事无补，他投中这一球之前， <!-- flash player begin --><style type=\"text/css\">\r\n				p .contentPlayer{margin-top:10px;}\r\n				.contentPlayer{float:left;width:336px;height:322px;background:url(http://i0.sinaimg.cn/cj/video_bg.png) no-repeat 0 0;margin:0 10px 10px -10px;*margin-right:7px;padding:1px 10px;_display:inline}\r\n				.contentPlayer a{text-decoration:underline;font-size:12px!important;}\r\n				.cp_player{padding:14px 0 0;text-align:center;height:249px;display:block;}\r\n				.cp_tit{padding:10px 0 0 18px;font-size:12px!important;line-height:20px!important;display:block;}\r\n				.cp_from{padding:0 0 0 18px;font-size:12px!important;line-height:20px!important;display:block;}\r\n				</style>\r\n<script type=\"text/javascript\">\r\n				var sinaBokePlayerConfig_o = {\r\n					container: \"p_player\",  //Div容器的id\r\n					playerWidth:298,     //宽\r\n					playerHeight:250,    //高\r\n					autoLoad: 1,        //自动加载\r\n					autoPlay: 0,        //自动播放\r\n					as:0,              //广告\r\n					tj:0             //推荐\r\n				};\r\n				</script>\r\n<script src=\"http://v.sina.com.cn/js/pg/play/playflash.js\" type=\"text/javascript\"></script>\r\n<!-- flash player end -->\r\n<script language=\"javascript\" type=\"text/javascript\">\r\n\r\n				sinaBokePlayerConfig_o.autoLoad = 0;\r\n				sinaBokePlayerConfig_o.autoPlay = 0;\r\n				SinaBokePlayer_o.addVars(\"vid\", 44461075);\r\n				SinaBokePlayer_o.addVars(\"as\", 0);\r\n				SinaBokePlayer_o.addVars(\"logo\", 0);\r\n				SinaBokePlayer_o.addVars(\"pid\", 6);\r\n				SinaBokePlayer_o.addVars(\"head\", 0);\r\n				SinaBokePlayer_o.addVars(\"tjAD\", 0);\r\n				SinaBokePlayer_o.addVars(\"tj\", 0);\r\n					SinaBokePlayer_o.addVars(\"vblog\", 2);\r\n					SinaBokePlayer_o.addVars(\"singleRss\", \"http://video.sina.com.cn/iframe/fourlists/p/sports/k/v/2011-01-04/115961226673.xml\");\r\n				SinaBokePlayer_o.showFlashPlayer();\r\n\r\n				</script>\r\n火箭已是104-112落后8分，败局已定。</p>\r\n<p>　　投中这一球之前，马丁在这场比赛中出手14次，只命中区区两球。在马丁的职业生涯中，出手超过14次却只命中两球以下的情况从未出现过。用调侃的口吻说，马丁在还剩30秒时的第15次出手第3个运动战进球还是很有意义，这避免了让他吞下一个耻辱纪录。</p>\r\n<p>　　尽管如此，15投3中在马丁的职业生涯中，也是罕见的滑铁卢战役。此前，马丁出手超过15次，命中少于3球的情况只发生过3次，其中有两次发生在效力萨克拉门托国王期间(分 别是2006年12月7日国王VS热火和2008年2月9日国王VS勇士)，最近的一次则是2010年2月20日火箭VS步行者。</p>\r\n<p>　　谁都知道，马丁存在的最大意义就是得分。而且，马丁不善于持球攻击，最擅长无球跑位后的接球便投。换句话说，马丁通常都是进攻终端。所以，效率于马丁而言，就显得特别 重要。马丁一旦丧失了进攻端的高效，以他平均水准之下的组织串联能力尤其是孱弱的防守能力，就会成为球队的黑洞。换言之，马丁不是凯尔-洛瑞和肖恩-巴蒂尔那样的球员， 即便手感欠佳，进攻端贡献不多，也可以在其他环节做出贡献，加以弥补。</p>\r\n<p>　　尤其是在当下的火箭，阿隆-布鲁克斯尚未归位，巴蒂尔防守压力太大，马丁是首发中最值得依赖的攻击点。毫不夸张地说，单就首发阵容而论，火箭的生死系于马丁的火力。一 旦马丁哑火，火箭将会很是被动，除非其他先发或者第二梯队有超常发挥，否则很难占据主动。所以，如果不是蔡斯-巴丁格和康特尼-李打得很出色，以马丁15投3中的状态，火 箭还会输得更惨。一句话，马丁如此萎靡，火箭输球很正常。</p>\r\n<p>　　另外一点，作为联盟中超一流罚球高手，即便马丁手感冰凉，若能用演技和侵略性博取数目不菲的罚球，他照样能给对手带来杀伤。很遗憾，马丁在这场比赛中只收获了1次罚球 ，也就是说，他的问题不仅仅是手感，更重要的是没有找到熟悉的节奏，打得不够兴奋，侵略性不够。</p>\r\n<p>　　上一场比赛，火箭惨败给开拓者，马丁在24分钟时间里17投6中3罚3中得到15分。前后两场比赛，马丁暴露出同样的问题：准星惨淡，罚球太少。结果也是一样的：火箭都输了球 。这并不是偶然现象，其间存有某种必然联系&mdash;&mdash;火箭赢球的一个基本前提，是马丁必须淋漓尽致地发挥出自己的特质，投篮高效的同时，还要用罚球给对手带来杀伤。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('121', '<p>新浪体育讯　火箭客场连战开拓者和掘金，战果不出人意料。面对内线实力明显占优的对手，火箭很难防守住对手在内线轰炸篮圈，稍值得欣慰的是两场比赛火箭在防守态度上的改变。</p>\r\n<p>　　同开拓者一战，对手19次站上罚球线；打掘金，对手40次站上罚球线。虽然数据滋味苦涩，但不能不说火箭已经用尽了办法减少对手的轻易得分，想昨天那样慢悠悠、懒洋洋的防守，今天的火箭才是我们熟悉的模样。</p>\r\n<p>　　乔治-卡尔教练的战术一针见血，无论是内内、肯扬-马丁这样内线，还是阿弗拉罗、JR-史密斯、泰-劳森这样的外线球员，他们的首要任务也是冲击篮下。火箭全场犯规数高达28次，由于身高和防守能力的限制，火箭只有一次次用犯规把对手拉下马。</p>\r\n<p>　　送给对手40次罚球，这样的情况在火箭身上并不经常出现。本赛季只有同黄蜂一战送给对手40+次罚球，再往前数的3个赛季，也总共只有3次。</p>\r\n<p>　　里克-阿德尔曼接手球队以后，火箭在进攻端的改善显而易见，但不可回避的防守端的问题也比杰夫-范甘迪时代大不少。也许是昨天阿帅赛后骂醒了球员，今天火箭在防守端寸土不让，只是对手内线的优势实在明显，火箭才赔上如此多的犯规。</p>\r\n<p>　　掘金也没有辜负火箭，全场40罚34中，命中率高达85%，借用台球斯诺克的一句经典评论：一准天下无难事啊。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('122', '<p>新浪体育讯　火箭在客场以106-113不敌掘金。遭遇连败的火箭确实该总结得失，但实际上他们并不用将一切的错都怪在自己的头上，碰上两支主场强势的球队，火箭输的也无太大问题。</p>\r\n<p>　　开拓者主场战绩12胜3负，近期主场8连胜显得是霸气十足，且连续4场比赛将对手的得分控制在场均89.6分，这全是来自于连续主场而保持的牛市井喷状态。在对上火箭前，开拓者面对爵士更是制造对手20次失误，并利用这些失误拿下27分。面对火箭，开拓者全队12次抢断5次盖帽，造了火箭15次失误，换来了整整22分。可以说火箭被打懵，也在情理之中。</p>\r\n<p>　　而这一场，面对阵容齐整已经三连胜且主场15胜3负的掘金，火箭本就没有多少胜机。加之对方主将卡梅罗-安东尼对位的小前锋位置，几乎是现在火箭除中锋外第二薄弱的环节，这样几乎注定了火箭的失败。安东尼全场拿下33分11板，掘金全场50个篮板比火箭多了整8个，这两记朝着火箭要害去的重拳几乎是技术性击倒。</p>\r\n<p>　　如今的火箭依靠的胜利筹码其实就是：进攻，外线传导球、三分以及快攻，简单说就是&ldquo;小、快、灵&rdquo;。而掘金则恰恰不惧这类球队，他们拥有速度不慢的内线搭档内内和肯扬-马丁，这也是让火箭主攻手凯文-马丁本场吃瘪的一大原因，后者很难利用自己的轻巧讨到便宜。</p>\r\n<p>　　而掘金几大主攻手，从安东尼、昌西-比卢普斯或者J.R.-史密斯都是那种速度不比火箭球员慢，但身材要大上一块的球员，这几乎是让火箭本就不好的防守更是漏洞百出。当场均能够拿下105.3分，攻击力位列联盟第五依靠进攻赢球的火箭，碰上攻击力位列联盟第二的掘金时，再无优势项目的火箭，能不输球吗？</p>\r\n<p>　　在未来的5场比赛中，火箭还将在客场碰上魔术和凯尔特人，笔者认为火箭又将重复今天客场两连败的悲剧。因为目前客场战绩仅6胜14负，这证明火箭本赛季并不擅长客场作战。分析原因，无非是攻守两端太过失衡。一直一心扑在进攻的球队，很可能在在客场遭遇非常大的问题。这是因为一般球队在主场球队都会增加防守强度，教练也会放松对主队的吹罚，这样就无形中加重了客队的进攻难度。</p>\r\n<p>　　所以说，火箭最好做好这段成绩连续滑落的准备，并从中总结出真正的败因。而非作为肖恩-巴蒂尔和里克-阿德尔曼口中&ldquo;态度问题&rdquo;那么简单。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('124', '<p>新浪体育讯　安切洛蒂已经明确向阿布拉莫维奇提出，切尔西目前缺少一名前锋，一名中后卫，而关于中后卫，安切洛蒂点了大卫-路易斯的名字，与此同时，AC米兰的组织经理甘迪也明确表示：AC米兰正在追逐本菲卡的两名后卫，科恩特劳和大卫-路易斯，这也是俱乐部第一次明确证实了之前媒体所猜测的AC米兰对这两人的兴趣。</p>\r\n<p>　　甘迪尼并非加利亚尼那样经常与媒体打交道的人，而相对于加利亚尼，在擅长对付媒体的AC米兰俱乐部中，甘迪尼就算是实话比较多的高层，之前AC米兰买帕托的事情，就是最先从甘迪尼的口中透露出去的，这一次，甘迪尼依然不像加利亚尼、布拉伊达这样的人有那么多的避讳，他说：&ldquo;大卫-路易斯和科恩特劳？AC米兰总是在追逐最好的球员，当然，大卫-路易斯和科恩特劳是我们非常感兴趣的球员，不幸的是，我们并不是唯一一支追逐这两名球员的球队，我们将看看今年夏天会发生什么。&rdquo;</p>\r\n<p>　　甘迪尼提到了夏季的转会市场，的确，AC米兰无意在冬季引进这两名球员，目前来看，本菲卡也不太可能放人，但就像成长于AC米兰青训营的前佛罗伦萨中场布雷桑所说：&ldquo;AC米兰还缺少一个和内斯塔、蒂亚戈-席尔瓦同等级的中后卫。&rdquo;此外，左后卫几年以来都是AC米兰的&ldquo;问题位置&rdquo;，在对阿尔-阿赫利的比赛中，阿莱格里甚至在这个位置上先后试验了安东尼尼、奥多、蒙特隆戈三人。如果两名球员加盟，肯定会让AC米兰的后防线更加完整，但两名球员的代价也是惊人的，大约在4500万欧元左右(大卫-路易斯2500万，科恩特劳2000万)。从目前来看，由于曼城、切尔西的竞价，AC米兰似乎倾向于放弃大卫-路易斯，主攻科恩特劳，在中后卫位置上选择相对廉价的梅克斯(合同在2011年夏天到期，目前在和罗马谈续约)。</p>\r\n<p>　　在中场，来自《米兰体育报》的劳迪萨分析了AC米兰的冬季转会市场，并透露了一些不为人知的东西，劳迪萨说：&ldquo;康斯坦特不可能在冬季加盟AC米兰，因为国际足联不允许一个球员在同一个赛季效力第三支球队，AC米兰真的是很喜欢他，但是我相信最终热那亚会得到法国人，当然，本赛季他会留在切沃，到赛季后才转会。&rdquo;</p>\r\n<p>　　那么AC米兰将引进的是谁呢？劳迪萨肯定的说：&ldquo;是拉扎里。加利亚尼已经向切利诺出了一笔报价：阿斯托里的第二部分共有权交换拉扎里的第一部分共有权，目前，卡利亚里的主席拒绝了，但是加利亚尼处理完罗纳尔迪尼奥的转会就将从巴西回国，届时将和切利诺继续谈判。&rdquo;此前，《罗马体育报》也的确曝光了加利亚尼和切利诺约定好了从巴西归来后谈判关于拉扎里转会的事情，而等待着加利亚尼的另一个人是托尼的经纪人，不过在小将贝雷塔显山露水，罗比尼奥的伤势不算严重之后，AC米兰对于托尼的需求没有那么大了。</p>\r\n<p>　　说起罗比尼奥，对阿尔-阿赫利的比赛他为了控球撞在了场边摄像机上而受伤，不过不幸中的万幸是伤势并不严重，只是被摄像机割伤，是皮外伤，在缝了9针之后，确定可以参加后天对卡利亚里的比赛，本场比赛的另一个伤者是内斯塔，他的受伤同样离奇，是被队友耶佩斯争顶头球顶伤了耳朵，被缝了三针，同样不影响后天的比赛。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('125', '<p>一些地方楼市调控政策近期陆续出台。与北京调控政策的严厉程度相比，其他地方楼市新政则显得&ldquo;和风细雨&rdquo;，力度&ldquo;温和&rdquo;。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;4月末，北京市率先推出细则，除强调坚决遏制住房价格过快上涨、加强住房保障工作、增加住房用地有效供应、实行更加严格的差别化住房信 贷政策、抑制投机性购房之外，明确提出商业银行根据风险状况暂停发放第三套及以上住房和不能提供1年以上北京市纳税证明或社会保险缴纳证明的非本市居民购 房贷款。</p>\r\n<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n    <tbody>\r\n        <tr>\r\n            <td valign=\"top\">&nbsp;</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p>北京细则中最为严厉的要数&ldquo;限购令&rdquo;，即同一购房家庭只能新购买一套商品住房。这使得北京细则成为各地楼市调控细则中力度最大的。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;青岛和深圳等地出台的细则虽然没有明确限制家庭购房套数，但对三套房贷款问题都作出了规定，基本按照国家政策上限执行。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;深圳版楼市调控细则要求对购买不同套数住房家庭（包括借款人、配偶及未成年子女）实行差别化信贷政策，限制各种名目的炒房和投机性购 房；商业银行根据风险状况，暂停发放购买第三套房以上住房贷款；对不能提供1年以上深圳市纳税证明或社会保险缴纳证明的非本地居民暂停发放购买住房贷款。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;青岛版细则也要求实行更为严格的差别化住房信贷政策，商业银行可停发第三套房贷款，对不能提供1年以上当地纳税证明或社会保险缴纳证明的非本地居民暂停发放购买住房贷款。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;相比之下，随后出台的广州、重庆等地细则更加&ldquo;缓和&rdquo;，不仅没有明确限制家庭购房套数，对于三套房贷款也没有明确规定。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;广州版细则从8个方面提出24条措施，重点放在增加有效供给、加强住房保障等供应端的调控上。重庆版细则也未对二套房认定和三套房贷款作出明确规定，仅提出对贷款购买第三套及以上住房的，贷款首付比例和贷款利率大幅度提高，政策执行力度较为宽松。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;总体来看，各地出台的细则都遵照了新&ldquo;国十条&rdquo;定下的基调，提出增加供给、加强保障房建设、实行差别化住房信贷政策、抑制投机性购房等，但政策力度不一。目前，尚未公布的上海和杭州楼市调控细则成为市场关注的热点。（记者 于萍）</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; <b> 楼市严厉调控难以穿越地方&ldquo;温柔怀抱&rdquo;？</b></p>\r\n<p>　&nbsp;一个多月前开始的狂风骤雨般的房地产调控似乎正逐渐向和风细雨转变。继北京出台&ldquo;严厉&rdquo;的房产新政细则之后，上周五广州、重庆同日出台细则，加上此前的深圳，三地的细则都被冠上了&ldquo;温和&rdquo;的定语。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; <b>北京 供需方均观望</b></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;作为房地产调控政策最为严厉的城市，北京近一个月来商品房销售持续&ldquo;冰封&rdquo;，供需双方均陷入深度观望。&ldquo;由于市场原因，原定于5月下旬开盘的公寓项目将延期，价格待定。&rdquo;位于北京东三环边的&ldquo;首城国际&rdquo;项目销售人员告诉中国证券报记者。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;目前，受蓄客量不足等因素影响，北京不少新盘项目推迟开盘日期。开发商的观望直接导致楼市新增供应量锐减。&ldquo;北京对各项调控政策的执行很严格，加之成交量大幅萎缩，预计房价将维持下行趋势。&rdquo;21世纪不动产一位分析师表示。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;<b>6月入市项目锐减</b></p>\r\n<p>&nbsp;&nbsp;亚豪机构监测数据显示，6月份，北京将有32个项目入市销售。其中，首次开盘的纯新盘项目9个，包括中建&middot;府前观邸、丽都壹号、蓝光&middot;云鼎、紫御国际、保利茉莉公馆等，其余23个项目是老项目后期开盘。这与四五月份北京新盘入市量的均值相比下滑近40%。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;业内人士指出，4月份以来出台的一系列调控政策不仅导致楼市成交量大幅下跌，也改变了房价上涨的预期，不但购房者出现了明显的观望，开 发商也放缓推盘步伐。在6月即将开盘的32个项目中，能明确开盘价格的项目仅11个。不过，有七成以上的项目，开发商表示新盘定价不会高于周边市场价。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;亚豪机构副总经理高姗分析，北京调控政策出台后，取得预售许可或者办理现房销售备案的房地产开发项目，要在3日内一次性公开全部销售房 源，并严格按照申报价格明码标价对外销售。6月份拟开盘的项目多数为老盘后期，而不少项目前期定价过高，导致项目后期的开盘价缺乏回旋余地。另外，当前市 场变化较快，给开发商销售策略增加很大的难度。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;<b>房价结构性回落</b></p>\r\n<p>&nbsp;&nbsp;北京市房地产交易管理网的数据显示，5月1日-18日，北京共有13个项目开盘，新增房源3129套，新增面积31.25万平方米，比4月同期分别减少47.6%和29.8%。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;5月1日-18日，扣除保障性住房，北京商品住宅期房和现房累计成交2673套，成交面积30.47万平方米，分别比4月同期减少55.9%、65.6%；成交均价为17244元/平方米，比4月同期明显下跌。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;高姗指出，5月份，北京商品住宅成交均价结构性回落趋势更为明显。具体来看，五环外房源的成交均价下降更为显著。通州、望京等地商品房的成交均价较前期高点已下降近15%。四环内新盘也已停涨。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;5月以来，五环内开盘项目占总量的30.8%，4月同期则为20.8%。业内人士指出，5月份北京城区新盘供应占比明显增加，而整体均价未出现上调。这表明开发商的房价预期开始松动。（记者 林喆）</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; 房产税悬疑</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&ldquo;快点出来吧，别再折磨我了！&rdquo;80后的邵灵豪一直在等待上海楼市新政出台。他想买房，想知道房产税会不会出现在上海新政中，但每天各种消息搞得他很疲惫。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;市场曾传言5月底上海出台细则，现在又传推迟到6月。而在5月24日，上海房产税悬疑剧迎来一个小高潮。24日中午，上海易居房地产研 究院综合研究部部长杨红旭在微博上写道：&ldquo;上海楼市细则近两日将出，据称比较严厉，可能对市场产生较大负面影响。不过我个人认为，在其它城市细则越出越温 和的情况下，上海细则严厉程度不一定会超过北京。&rdquo;杨红旭的爆料随即引来众多网友和业内人士的关注。大约两小时之后，一则更为重磅的信息出现在了杨红旭的 微博上&mdash;&mdash;&ldquo;最新消息，将要出台的细则包括房产税，天呀，地产股又要跌了，大家快逃命。&rdquo;这一&ldquo;猛料&rdquo;立即引来诸多回应，其中不少人表示&ldquo;难以置信&rdquo;。仅 仅数分钟后，这条微博被推荐至新浪房产微博首页。最吸引眼球的是15时11分的微博：&ldquo;据悉，上海楼市细则明天发布。&rdquo;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;如果24日的剧情是杨红旭个人微博的发布，那么25日的剧情就是毫无出处的传言：&ldquo;今天下午上海将宣布开收房产税。新购房以0.6%征收。不出意外，3点左右将发布。&rdquo;受此影响，A股房地产板块午后加速下跌，盘中最大跌幅达3.47%。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;房产税传言像病毒发作一样，通过QQ、MSN、论坛、手机、微博等多种媒介传播。中国证券报记者25日下午在绿地集团采访，采访对象突然打断采访说：&ldquo;等一下，已经3点了，我看一下细则出来没有。&rdquo;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;其实，25日下午2时许，上海相关主管部门已经辟谣：仍未明确上海版楼市细则的发布时间表。杨红旭对中国证券报记者说，现在看来，细则出台的消息确实不属实，他也是听媒体朋友说的。他说，房地产业没有百分百准确的消息，至于准确程度的高低，大家等细则出来就知。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;不光是想买房的邵灵豪们在纠结中等待，媒体记者们的神经也处于高度紧张状态。房地产记者见到采访对象就问&ldquo;上海细则什么时候出&rdquo;、&ldquo;有 房产税吗&rdquo;。一名上海本地记者自嘲自己像祥林嫂一样，快得强迫症了。中国证券报记者25日一直等到深夜12点，但上海并没有公布任何有关楼市新政的消息。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;开发商也在四处打听消息。中国证券报记者25日遇到上海金叠房地产开发有限公司副总经理乐雨明，他向中国证券报记者打听地产政策走向以及行业前景。他们在等上海细则出台，以决定开盘策略。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;上海弘基企业集团副总裁高栋在微博上爆料称：前个星期，一开发商突然叫停旗下所有正在打桩的项目，静待新政细则出台，等半天等来了&ldquo;房产税三年免谈&rdquo;，非常高兴，通知全面恢复打桩，继续深挖洞。后来得知这消息不属实，晚上开会准备再次叫停。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;不仅地产商，山东一地级市官员告诉中国证券报记者，他们也在等待上海细则，或许会传递某种信号。一些人士分析，重庆之前称将开征&ldquo;特别房产税&rdquo;，但细则实际上比较温和，这已引起业内关注。作为高房价的代表城市，上海在调控尺度上将如何把握有着标杆意义。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;上海区县一级官员也在等待细则。上海松江区分管土地、住房的副区长陈猛表示，不知道细则什么时候出，曾经说是5月底，但政策内容没有征求过区县的意见。(记者 周文天)</p>\r\n<p>&nbsp;</p>\r\n<p>　　<b>上海 成交低位徘徊</b></p>\r\n<p>&nbsp;&nbsp;持续4周大幅下滑的上海商品住宅成交量上周止跌回升，但仍在历史低位徘徊。南京、杭州楼市成交则继续低迷。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;<b>上海 成交低迷</b></p>\r\n<p>&nbsp;&nbsp;佑威房地产研究中心及楼市专评网联合提供的数据显示，在5月17日-5月23日这一周，上海市商品住宅成交面积为7.6万平方米，相比 前周6.0万平方米的低谷，回升27%，但依然只相当于年均水平的1/4；商品住宅成交均价为19204元/平方米，比前周下跌了16%，这是新政出台以 来，上海周均价首次低于2万元。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;佑威房地产研究中心副主任陆骑麟分析，上周均价低于2万元的楼盘成交量为5.6万平方米，包揽成交面积榜前十名，占总成交量近3/4；每平方米5万元以上的高端楼盘，成交量出现腰斩，最终导致成交均价走低。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;在最近6周时间里，开发商共推出159万平方米的商品住宅房源，同期成交量只有84.7万平方米，这意味着过去一个半月里有74.3万 平方米的房源滞销。对此，中国房产信息集团分析师薛建雄认为，前几周因为高端项目赶在行情还没降温前上市成交，推高了价格，但随着高端项目成交比重下滑和 新上市房源价格回调，楼市成交均价大幅下滑。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;<b>宁杭 价滞量缩</b></p>\r\n<p>&nbsp;&nbsp;谨慎、再谨慎，成为南京和杭州楼市的关键词。买房人下手谨慎，开发商卖房也谨慎。据365地产家居网统计，截至5月23日，南京仅有21个楼盘将在6月份推出新房源。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;浙江杭州主城区在5月前23天共成交835套房源。而在去年5月份，杭州主城区成交量历史性地突破万套大关，达10058套，日均342.5套。相比去年5月同期，主城区成交量下跌近九成。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;杭州开发商纷纷延迟开盘以&ldquo;静观其变&rdquo;，5月杭州主城区住宅可售房源大部分时间徘徊在5000套之下。截至目前，5月杭州仅有6个楼盘开盘。而在4月中旬房地产新政出台前一周，杭州有12个楼盘集中开盘。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;尽管南京、杭州楼市成交低迷，但价格仍然高企。新政之后，市场对价格的预期普遍降低，而开发商仍将价格定在新政之前的水平。买卖双方的预期出现差异，造成楼市深陷僵局。（记者 周文天）</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;<b>深圳 看空仍是主流</b></p>\r\n<p>&nbsp;&nbsp;在观望气氛中，深圳一些价格明显下调的楼盘取得了不错的销售业绩。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;<b>低价楼盘受青睐</b></p>\r\n<p>&nbsp;&nbsp;根据深圳房地产信息网监测，5月17日-23日这一周新房成交量继续萎缩，仅成交225套住宅，环比下跌34.4%；成交面积 17464平方米，环比下跌四成。不过，成交均价高位运行，为21504元/平方米。二手房成交量同样继续回落，当周深圳市二手房共成交3230套，环比 下跌一成；成交面积31.25万平方米，环比微跌2.8%。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;但5月份以来，不时有新盘传出销售佳绩，尤其是那些开盘价大幅低于市场预期的小户型楼盘。5月16日，华侨城旗下公寓侨城馨苑开盘，起 价逾1.8万元/平方米，均价2.5-2.6万元/平方米，由于低于均价可能超过3万元的市场预期，当天成交积极，一天售出170多套。位于前海的丽湾商 务公寓，因为开盘价格大大低于同区域楼盘，在淡市中表现出色，5月17日-23日这一周以4026.98平方米、90套的周成交量取得了深圳楼盘成交冠 军，远远高于第二名的11套周销量。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&ldquo;刚性需求正在支撑市场。&rdquo;世华地产总监肖小平表示，这部分刚需包括了首次置业和改善型需求，这类需求比较坚挺。中国证券报记者注意到，侨城馨苑单价在3万以上的房屋几乎无人问津，表明首次置业者仍占据主流。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&ldquo;最近一次性付款的客户比例大幅增加。&rdquo;新近开盘的大户型楼盘第五大道代理商表示，付全款客户的比例之高甚至让他们感到吃惊。而丽湾商务公寓的销售人员称，该楼盘小户型总价低，相对较低的门槛为付全款客户接受，一次性付款的客户接近四成。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;中原地产市场总监王世界表示，一方面通胀预期强化，国内的投资渠道太少，另一方面楼市长期利好依然存在，而深圳细则又偏&ldquo;软&rdquo;，从而为投资型购房者对楼市未来增强了信心。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;<b>新盘优惠进行中</b></p>\r\n<p>&nbsp;&nbsp;在现在的市场大环境下，深圳不少新盘定价非常谨慎，并且推出了不少优惠措施。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;莱蒙&middot;水榭春天2期5月22日开盘，推出中心园景大户型房屋，开盘当天成交的客户，可享受9.7&times;9.8折的优惠折扣。折算其他优惠措 施后，总体打折幅度在9.4折至9折之间，折后售价约为1.8万-2.3万元/平方米。这比之前开盘的同区域新盘曼海宁有所下调。开盘当天所有成交业主可 获赠拥有20年使用权的车位一个。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;推出优惠措施的盐田区金山碧海楼盘在售均价17000元/平方米，170平方米山海楼王总价280万元/套起，目前购买部分特定单位可 以赠送20万至38万元装修款。龙岗区的君悦龙庭三期在售户型为160平方米以上5至6房大户单位，在售价格为11000-15000元/平方米，附赠送 面积共可达200平方米以上。目前购房可再享96折优惠。（记者 万晶）</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>　　<b>重庆 继续缩量盘整</b></p>\r\n<p>&nbsp;&nbsp;目前，重庆楼市观望氛围依然浓郁，但&ldquo;特别房产消费税&rdquo;等严厉调控政策最终未在重庆房地产调控政策中出现，且重庆的细则依然鼓励普通商品房需求。分析人士认为，这可能会增强开发商的定价信心，市场成交量也有望上升。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;房地产交易管理系统数据显示，5月17日至23日，重庆主城九区楼市成交总套数为2459套，总成交金额为12.03亿元，成交总面积22.85万平方米，这三项数据均创下近八周以来的新低。但成交均价在前一周4523元/平方米的基础上，回升至5265元/平方米。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;总体而言，重庆新盘的销售状况仍不理想，开盘第一周的销售率普遍很低。据不完全统计，5月17日至23日，重庆市主城区共有6个项目推 出新盘，共计1637套房源，总面积约11.32万平方米，但开盘当天的认购率勉强达到10%。而&ldquo;春语江山&rdquo;项目开盘当天推出271套，当天认购率为 5.17%。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;业内人士介绍，目前重庆市区的房价为4000-5000元/平方米，且从去年以来，房价上涨缓慢。国家统计局数据显示，今年4月，重庆 市房价环比涨幅为0.5%，远低于全国平均水平，更低于同期京沪等一线城市。今年以来，重庆商品房日均成交量维持在450套至600套之间，略低于去年底 的成交水平。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;重庆土地市场维持着较高的热度。不久前，重庆举行了楼市新政后第一次大规模的供地拍卖会，7块土地全被开发商收入囊中。其中，北京的金融街和重庆本土房企晋愉集团，分别斥资38.8亿元、10亿元，竞得423亩和301亩土地。（记者 林喆）</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; <b>房产税悬疑</b></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&ldquo;快点出来吧，别再折磨我了！&rdquo;80后的邵灵豪一直在等待上海楼市新政出台。他想买房，想知道房产税会不会出现在上海新政中，但每天各种消息搞得他很疲惫。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;市场曾传言5月底上海出台细则，现在又传推迟到6月。而在5月24日，上海房产税悬疑剧迎来一个小高潮。24日中午，上海易居房地产研 究院综合研究部部长杨红旭在微博上写道：&ldquo;上海楼市细则近两日将出，据称比较严厉，可能对市场产生较大负面影响。不过我个人认为，在其它城市细则越出越温 和的情况下，上海细则严厉程度不一定会超过北京。&rdquo;杨红旭的爆料随即引来众多网友和业内人士的关注。大约两小时之后，一则更为重磅的信息出现在了杨红旭的 微博上&mdash;&mdash;&ldquo;最新消息，将要出台的细则包括房产税，天呀，地产股又要跌了，大家快逃命。&rdquo;这一&ldquo;猛料&rdquo;立即引来诸多回应，其中不少人表示&ldquo;难以置信&rdquo;。仅 仅数分钟后，这条微博被推荐至新浪房产微博首页。最吸引眼球的是15时11分的微博：&ldquo;据悉，上海楼市细则明天发布。&rdquo;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;如果24日的剧情是杨红旭个人微博的发布，那么25日的剧情就是毫无出处的传言：&ldquo;今天下午上海将宣布开收房产税。新购房以0.6%征收。不出意外，3点左右将发布。&rdquo;受此影响，A股房地产板块午后加速下跌，盘中最大跌幅达3.47%。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;房产税传言像病毒发作一样，通过QQ、MSN、论坛、手机、微博等多种媒介传播。中国证券报记者25日下午在绿地集团采访，采访对象突然打断采访说：&ldquo;等一下，已经3点了，我看一下细则出来没有。&rdquo;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;其实，25日下午2时许，上海相关主管部门已经辟谣：仍未明确上海版楼市细则的发布时间表。杨红旭对中国证券报记者说，现在看来，细则出台的消息确实不属实，他也是听媒体朋友说的。他说，房地产业没有百分百准确的消息，至于准确程度的高低，大家等细则出来就知。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;不光是想买房的邵灵豪们在纠结中等待，媒体记者们的神经也处于高度紧张状态。房地产记者见到采访对象就问&ldquo;上海细则什么时候出&rdquo;、&ldquo;有 房产税吗&rdquo;。一名上海本地记者自嘲自己像祥林嫂一样，快得强迫症了。中国证券报记者25日一直等到深夜12点，但上海并没有公布任何有关楼市新政的消息。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;开发商也在四处打听消息。中国证券报记者25日遇到上海金叠房地产开发有限公司副总经理乐雨明，他向中国证券报记者打听地产政策走向以及行业前景。他们在等上海细则出台，以决定开盘策略。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;上海弘基企业集团副总裁高栋在微博上爆料称：前个星期，一开发商突然叫停旗下所有正在打桩的项目，静待新政细则出台，等半天等来了&ldquo;房产税三年免谈&rdquo;，非常高兴，通知全面恢复打桩，继续深挖洞。后来得知这消息不属实，晚上开会准备再次叫停。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;不仅地产商，山东一地级市官员告诉中国证券报记者，他们也在等待上海细则，或许会传递某种信号。一些人士分析，重庆之前称将开征&ldquo;特别房产税&rdquo;，但细则实际上比较温和，这已引起业内关注。作为高房价的代表城市，上海在调控尺度上将如何把握有着标杆意义。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;上海区县一级官员也在等待细则。上海松江区分管土地、住房的副区长陈猛表示，不知道细则什么时候出，曾经说是5月底，但政策内容没有征求过区县的意见。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('126', '<p><strong>修旧还是立新？ 房地税中央地方同床异梦</strong></p>\r\n<p>　　现有地方试点方案，均是修改现行房产税，将已有房产税的征税范围扩展到居民自住房屋，这与部委意见不一；而地方与中央立法精神不一，未来会出现很大麻烦</p>\r\n<p>　　对居民自住房屋征收房产税，这一贯穿2010年全年的政策悬念仍未现形。</p>\r\n<p>　　房产税目标主要是调控房价还是筹集收入？&ldquo;借道&rdquo;现有税种还是开征新税？土地、住房、财税等部门权责如何协调？当重庆和上海将房产税试点的申请提交国务院，现实的矛盾和冲突便浮出水面。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('127', '<div class=\"img_wrapper\" style=\"text-align: center\"><img alt=\"在前皇马三号门将科迪纳面前，本泽马一点便宜都占不到\" src=\"http://i1.sinaimg.cn/ty/g/2011-01-04/U5244P6T12D5393602F44DT20110104121654.jpg\" /></div>\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><span class=\"img_descr\">在前皇马三号门将科迪纳面前，本泽马一点便宜都占不到</span></div>\r\n<!-- 显示图片 end --><!-- 显示附图 begin --><!-- 显示附图 end --><!-- 输出内容-新分页 begin --><!-- publish_helper name=\'原始正文\' p_id=\'6\' t_id=\'12\' d_id=\'5393602\' f_id=\'41\' -->\r\n<p>　　新浪体育讯　伊瓜因是否该手术的事情闹得沸沸扬扬，他回到马德里之后在机场受到记者们的围堵，但他只说了句&ldquo;我要说话的时候会说的&rdquo;。伊瓜因的伤势，让皇马前锋线上缺兵少将的困境被放大，几个小时之后皇马与赫塔菲的比赛的焦点，就是谁将成为皇马攻击线上的救星。</p>\r\n<p>　　卡卡自然是板凳上的焦点，而本泽马则是球场上的焦点。两人在第74分钟的时候完成的交换，卡卡上场，本泽马撤回到板凳上，迷茫地看着队友比赛。</p>\r\n<p>　　本泽马没有进球，与之前5场比赛总共打进6球的数据很不符，但却又是非常符合的，因为之前的6粒进球分别来自两场大胜利的帽子戏法。遇到了稍微强硬的赫塔菲，本泽马机会很多，但都无法将机会转会为进球，甚至自己越踢越没有信心。</p>\r\n<p>　　对于本泽马的评价褒贬不一，有说他很活跃，参与球队进攻很多；也有说法是他浪费更多的机会。这是球员表现层面上的评价，而本泽马更像是存在心理上的问题。他有机会，但缺乏在机会出现时毅然决然进球的信心。</p>\r\n<p>　　从比赛开始，本泽马的节奏里就似乎少了一拍。比赛第21分钟，迪马利亚的妙传被他直接停给了对手；第30分钟，C罗左路传中，本泽马中路抢点稍慢半拍；第38分钟，迪马利亚传球，本泽马本可获得单刀的，但他稍微处理慢一点，只能下底传中，C罗也错过空门；第54分钟，迪马利亚又传出好球，本泽马禁区右侧射门放了高射炮&hellip;&hellip;</p>\r\n<p>　　更令人扼腕的，是第65分钟时，迪马利亚获得单刀球，但他减速后传球给了本泽马，这本是一个三打一的必进球机会，谁知本泽马又将球传回来，迪马利亚一个措手不及停球停大；第68分钟，C罗与本泽马打出直传斜插的配合，但本泽马的射门又无奈击中横梁。最终，穆里尼奥用卡卡换下了本泽马，而不是更加对位的厄齐尔。</p>\r\n<p>　　皇马最终还是取得了胜利，因为C罗、迪马利亚、厄齐尔仍能保证出色的发挥。但当伊瓜因无法提供帮助的情况下，本泽马这个天然的替补却成了空有名头，没有数据的大摆设。本泽马需要捅破这一层窗户纸，只有进球才是提升信心的法宝。不然，&ldquo;本泽猫&rdquo;永远变不成&ldquo;本泽狗&rdquo;。</p>\r\n<p>　　正因为本泽马的不给力，皇马已经开始想办法找新的前锋了。在比赛日开始前，媒体纷纷用转会新闻来充版面，而阿德巴约就是皇马的版面人物。《马卡报》日前曝出阿德巴约自荐加盟皇马的消息，之后又跟进做了一项球迷调查，根据调查结果，有2/3的皇马球迷希望能够在冬季引进阿德巴约，来填补球队缺少前锋的漏洞。（紫羲）</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('128', '<p>新浪体育讯　蒙特隆戈在迪拜对阿尔-阿赫利的热身赛上表现得到了一致的好评，这证明AC米兰这一次在低成本的收购上没有看走眼，不过，另一笔低成本的收购却是彻头彻尾的失败了，在1月1日，AC米兰的阵营中又多了一位球员--1年前的这个时候引进的加纳前锋阿迪亚，当时，阿迪亚顶着世青赛金球加金靴的名头来到AC米兰，加利亚尼当时还说&ldquo;之前得到世青赛双料先生的是梅西和阿奎罗，希望阿迪亚也能像他们一样&rdquo;。但事实证明这成了个笑话。</p>\r\n<p>　　当加纳的&ldquo;黄金一代&rdquo;们纷纷在南非世界杯打上主力，阿迪亚只在那支国家队获得了几分钟的出场，而回到了联赛之后，AC米兰眉头也不皱一下的将加纳人租借给了意乙的雷吉纳，当年博列洛也是被租借到这家俱乐部，AC米兰希望更多的出场机会能帮助阿迪亚成长，结果却令人大失所望--阿迪亚半个赛季打进0球，没有打上主力，最终被在意乙排名第6的雷吉纳退货。</p>\r\n<p>　　回到AC米兰的阿迪亚也在自己寻找出路，日前流传在中国媒体一则消息居然被意大利的《全市场》证实，《全市场》称，阿迪亚的经纪人确实去了中国，并联系了广州恒大，但遭到了这支中超升班马的拒绝，《全市场》称这是&ldquo;一件鲜为人知的事情&rdquo;。</p>\r\n<p>　　事实上，就算是当年的马特里、博列洛也有在职业生涯初期不顺的时候，但问题是，1989年出生的阿迪亚已经22岁了，就算不和帕托相比，比起皮埃尔-奥巴梅扬(摩纳哥主力)，甚至是比他更小的帕罗斯基，都要差了很多，AC米兰青年队中不乏贝雷塔这样出色的年轻球员，尤其是AC米兰目前锋线人员过剩，储备充足，对于阿迪亚，俱乐部恐怕已经没有耐心了。</p>\r\n<p>　　尽管阿迪亚的引进失败，但AC米兰在冬季转会还打算继续引进引进年轻球员，3个月前通过试训的匈牙利左后卫塔马斯不日就将前来报到，此外，根据斯特罗帕提出的&ldquo;青年队主力门将迪-法比奥不够出色，需要一位多纳鲁马(上赛季青年队主力门将)这样的强力门将&rdquo;的要求，加利-佩德佐利的&ldquo;黄金组合&rdquo;已经准备向布雷西亚的莱亚利动手，后者有可能在冬季就加盟AC米兰，补充青年队的实力。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('129', '<p>　随着住房公积金贷款新政以及央行加息等多重影响，市区住房成交量开始大幅萎缩。记者了解到：2010年12月的第四周也就是12月20日至12月26日，市区共成交住宅163套，较前一周减少335套，环比下降了67.27%。<br />\r\n<br />\r\n近日，国家多部<a target=\"_blank\" href=\"http://search.bmlink.com/?action=seach&amp;from=default&amp;seachtype=newsearch&amp;keywords=%c3%c5&amp;Submit=%D6%D0%BD%A8%CB%D1%CB%F7\">门</a>表示，还将出台更严厉的调控政策，来抑制房价的过快增长。<br />\r\n<br />\r\n消息传来，不少市民暂停了买房计划。不少楼盘销售人员说：进入12月以来，来看房选房的客户开始逐渐变少，买房的市民也变得更加谨慎起来。据统 计：2010年12月的第四周，市区共成交住宅163套，非住宅成交66套，较前一周减少65套，环比下降了49.62%。其中，位于崇川区金鼎湾花园成 交备案20套；四季绿苑成交备案15套；东景国际尚层成交备案14套。位于港闸区的尚海城成交备案25套，高迪晶城销售备案14套。另外，市开发区也成交 了27套，相对前一周，成交量均有所下滑。<br />\r\n<br />\r\n业内人士分析市区出现成交量下降的趋势，主要源于住房&ldquo;南通版细则&rdquo;出台和市场的疲软。随着今年各项楼市调控政策继续出台，市区房地产市翅进入调整期，调整将围绕着抑制投资、鼓励自住这条主线展开。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('130', '<p>新浪体育讯　果不其然，卡卡在皇马2011年的首场比赛中伤愈复出，在万千球迷的注视下完成了15分钟的表演。而额外关注卡卡表现的，或许还有众多国际米兰的球迷。自莱昂纳多上任以后，有关国际米兰引进卡卡的传闻就从未间断，不少国米球迷都想看看，卡卡是不是还是当初敌对阵营中的那个追风少年。而据意大利媒体报道，昨日在佩雷斯球场的看台上，也的确出现了国际米兰球探们的身影。</p>\r\n<p>　　卡卡15分钟的复出表现算是合格的，短短的一刻钟时间虽然未能让这位巴西巨星为球队带来进球，但所有人都能从卡卡身上看到完全康复的结果。对于皇马而言，这无疑是个好事，就像穆里尼奥在赛后夸赞道的那样，卡卡从这一天开始真正踢西甲。国际米兰的球探们带回的反馈报告理应是积极的，但对于想要得到卡卡的国米而言，或许这个梦想将变得越发遥远。</p>\r\n<p>　　天空体育的资深记者迪马奇奥就指出，卡卡转会国际米兰其实存在一个极大的障碍，那就是卡卡的高身价。&ldquo;最近有太多关于卡卡可能回归意大利的报道，而且都在说他可能会加盟国米。据我所知，国际米兰方面对卡卡这个伟大的球员、同时也是莱昂纳多的好朋友持有极高的敬意，但是如果国米想要遵循几个月前奉行的那种收支平衡的策略的话，就没办法供得起卡卡。卡卡会每年为国际米兰多增加1000万欧元的年薪支出，至少现在看来，经济问题是阻碍这桩转会的最主要原因。&rdquo;</p>\r\n<p>　　莫拉蒂1250万买断拉诺齐亚的另一半所有权，已是近些年来国际米兰少有的冬季大手笔。如果再豪赌卡卡，显然蓝黑军团为应对欧足联新政而苦心削减的赤字数额就将再攀新高。《罗马体育报》提出一种可能，那就是拿麦孔交换卡卡。但这一可能性随即被麦孔的经纪人卡利恩多驳斥，因为要知道阿布的切尔西已经为卡卡准备好了5000万欧元。</p>\r\n<p>　　麦孔的经纪人卡利恩多对这一猜测嗤之以鼻：&ldquo;大牌球员是很难在一月份完成转会的，国际米兰和皇家马德里谈麦孔交换卡卡？这只是谣传，像这种规模的球星交换必须要经过长时间的准备和筹划，是绝不可能在赛季中段完成的，就我目前所知来看，这纯属空穴来风。&rdquo;值得一提的是，3日球队训练的时候，麦孔进场时球迷们特意对着这位巴西边后卫高唱：&ldquo;别去皇家马德里！&rdquo;显然，蓝黑拥趸们也不赞同这笔交易。</p>\r\n<p>　　国际米兰试图引进卡卡被视为是莫拉蒂对AC米兰复仇的一种延续，但现在看来，不光是莫拉蒂有意报复红黑军团，莱昂纳多也有兴趣在这其中扮演一个关键角色。自从莱帅上任之后，蓝黑军团在球市上的不少动作都是针对着同城死敌而为。这一点，也得到了意大利媒体的注意。</p>\r\n<p>　　《数码体育》的专栏作家佩杜利亚证实，国际米兰似乎有意识地在转会市场上为目前排名积分榜榜首的红黑军团制造障碍。&ldquo;凯文-康斯坦特是这赛季冒出来的新星，他迅速成为了球市上的抢手货。这名切沃中场受到了许多意甲球队的追逐，这名几内亚国脚展现出了惊人的技术才华和极高的提升空间，现在来看，国际米兰准备充当搅局者，和AC米兰一起参与竞争康斯坦特。不过国米的意图更像是打击竞争对手，要知道加利亚尼在争夺中已经取得了相当明显的优势了。&rdquo;</p>\r\n<p>　　国际米兰并不像AC米兰那样缺少康斯坦特这个类型的球员，突然介入康斯坦特的交易，蓝黑军团显然别有深意。而此前，布兰卡更是试图截杀AC米兰关注许久的阿根廷神童拉梅拉。最近AC米兰试图租借老牌中锋托尼，这其中也有国米掺和的身影。《fcinter1908.it》更是披露，莱昂纳多已经向莫拉蒂建议，今夏引进巴西中场甘索，而身价达到2000万欧元的甘索也是红黑军团的长线目标。</p>\r\n<p>　　不过，国米管理层在忙着破坏AC米兰的交易的同时，似乎也忘了为一桩几成定局的交易板上钉钉。荷兰新星卡斯泰格诺斯的经纪人日前就通过媒体督促国米展开实质行动。&ldquo;未来几天布兰卡应该会向费耶诺德官方开出报价，或许是贝尼特斯的事情耽误国米不少时间，但是很快就应该有最新的进展了。我认为一两周内所有事情将会得到解决。&rdquo;</p>\r\n<p>　　由于国际米兰始终没有发出正式报价，这也让此前争夺卡斯泰格诺斯的英超诸强看到希望。有英格兰媒体称，阿森纳准备再次尝试收购。不过卡斯泰格诺斯的经纪人表示，球员方面已经做出选择，不会变心，&ldquo;我们是信守承诺的人，我们对布兰卡做出了承诺，除非有一天我们说&lsquo;很不幸，这交易没法进行下去了&rsquo;，不然我们不会和其他球队谈判。很荣幸，世界最佳俱乐部决定引进这名球员，我们会安静的等待。我们希望两家俱乐部能够坐下来好好谈谈，这样他6月份就能前往米兰了。费耶诺德要500-600万欧元？我不知道，这是两家俱乐部的问题了。&rdquo;</p>\r\n<p>　　此外，在官方宣布完成拉诺齐亚的交易之后，国际米兰还在官方网站上宣布了两名年轻小将的加盟：&ldquo;国际米兰俱乐部宣布成功在这个转会窗签下了2名新球员，这2名球员将加入皮亚教练率领的U19青年队。第1名球员是以租借身份加盟的弗朗切斯科-巴尔迪，这名出生于1992年1月18日的门将由利沃诺转会而来；第2名加盟的是从锡耶纳转会而来的、1992年4月18日出生的左后卫费德里克-曼尼尼。这2名蓝黑军团的新人今天下午已经完成了在安杰罗-莫拉蒂训练中心的首训。&rdquo;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('131', '<p><strong>&nbsp;&nbsp;&nbsp; 重庆商报1月4日报道</strong> 日前，有央视的主持人在微博上建议，<font color=\"#1e50a2\">春晚</font>节目不要使用网络语言了。比如阿丘认为&ldquo;网络语言当作戏剧语言说的时候是很苍白的&rdquo;。<font color=\"#1e50a2\">鲁健</font>也在微博上写道：&ldquo;希望今年的春晚语言类节目幽默得高级点，千万别像黔驴技穷的某些演员鹦鹉学舌地攒一堆网络语言当作幽默。&rdquo;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('132', '<p>新浪体育讯　据加泰罗尼亚一家叫做Ona.FM的电台报道，巴萨的阿根廷后卫加布里埃尔-米利托希望在冬季离开巴萨，去其他球队争取更多的出场机会。</p>\r\n<p>　　米利托在新年之后重新回到球场，并在上一场对莱万特的比赛中复出，替补上阵了约二十来分钟。米利托的复出是件喜事，但从另一方面看，当皮克和普约尔都无法出场的情况下，瓜迪奥拉依然不让米利托出任首发中后卫，也是对他状态的不信任。而当皮克和普约尔复出之后，米利托哪怕是随着伤病完全恢复而状态越来越好，也难以获得更多的机会。</p>\r\n<p>　　Ona.FM电台披露，米利托为了能入选阿根廷国家队，参加2011年的美洲杯，他希望在冬季转会的时候就离开巴萨，加入到一家能给他提供更多出场机会的球队当中。</p>\r\n<p>　　在圣诞节假期的时候，加比-米利托曾和哥哥迭戈，以及萨内蒂、坎比亚索等人一起去阿根廷国家队基地训练。这是自发的训练，从这点上足以看出他们对于为国效力的渴望。但如果在巴萨迟迟得不到上场机会，那米利托要想参加美洲杯，将是一件非常难的事情。</p>\r\n<p>　　据Ona.FM报道，米利托并不想回到阿根廷效力，有不少来自意大利和英格兰的俱乐部的邀请。而巴萨已经得知米利托的意愿，并愿意在得到合适转会费的情况下，让米利托冬季转会离开。</p>\r\n<p>　　与此同时，另外一名巴萨球员也将离开球队。据报道，巴萨B队的头号攻击手诺利托与本菲卡的签约已经接近完成。而他的经纪人表示，诺利托已经确定离开巴萨，如果冬季没有合适的邀请，那么夏季他也将免费离开。现在哪怕是巴萨提供一份一队合同给诺利托，他也不会回头，因为巴萨难以保证不会在夏季的时候将他租借出去。(伊雷克森)</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('133', '<p>　未来政策展望:我们认为明年房地产调控将更多使用货币手段，通过调整利率、<a href=\"http://bank.jrj.com.cn/list/grxd.shtml\" class=\"ot1\">信贷</a>窗口指导、准备金等工具统筹应对房价上涨和通货膨胀。同时增加保障房供应，继续打击囤房、囤地，加大土地供应力度，缓解供给矛盾将是明年的另一条主线。另外，<a href=\"http://house.jrj.com.cn/\" class=\"ot1\">房产</a>税试点政策明年出台的可能性也较大，如果实际政策力度符合预期，则可能引发阶段性<a href=\"http://summary.jrj.com.cn/\" class=\"ot1\">行情</a>；但房产税征收范围扩大或税率较高，则对于房地产市场以及<a href=\"http://stock.jrj.com.cn/\" class=\"ot1\">股票</a>市场均是较大打击。</p>\r\n<p>　　外部环境良好:我们认为，明年全年经济仍然能够保持快速增长，而<a href=\"http://forex.jrj.com.cn/list/rmbdt.shtml\" class=\"ot1\">人民币</a>升 值、通货膨胀等因素对房地产均构成一定的助推作用，因此外部环境依然有利于房地产市场。l房地产市场:我们预计，房地产投资增速明年仍然可以达到 25~30%；新开工面积增速在20%~25%之间；环境较差的情况下房屋销售同比增速5%~8%；环境较好的情况下可达12%；房屋销售价格与2010 年基本持平。</p>\r\n<p>　　区域市场分化:从区域市场来看，2010年东部地区受政策影响较大，投资、新开工、销售等下滑较快，价格波动较大；但中西部地区受影响较小。我们认为由于中西部地区城镇化的加速，在明年房地产市场的大环境下，中西部地区的房地产市场较东部相对更有潜力。</p>\r\n<p>　　警惕财务风险:目前开发企业的财务状况依然可以维持。资产负债率、速动比率等硬性指标短期内比较健康。但由于2010年开发企业经营性现金流出较大，如果融资环境继续恶化或者销售回款不顺畅，则开发企业的财务状况容易迅速恶化。</p>\r\n<p>　　投资建议:2011年投资以&ldquo;稳健&rdquo;为主。我们推荐三类开发企业。一是实力雄厚、财务稳健的龙头型企业。第二是布局中、西部城市的开发企业。第三是布局大城市周边小城市的开发企业。<a href=\"http://share.jrj.com.cn/\" class=\"ot1\">个股</a>推荐:<span><a href=\"http://stock.jrj.com.cn/cominfo/default_000002.htm\" class=\"stbu\">万科A（000002）</a></span>（000002）、<span><a href=\"http://stock.jrj.com.cn/cominfo/default_600048.htm\" class=\"stbu\">保利地产（600048）</a></span>（600383）、<span><a href=\"http://stock.jrj.com.cn/cominfo/default_002146.htm\" class=\"stbu\">荣盛发展（002146）</a></span>（002146）l风险提示:开发企业资金回笼不畅，导致财务风险加大。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('134', '<p><strong class=\"cRed\"><font color=\"#ff0000\">网易娱乐1月4日报道</font></strong>&nbsp;(文/小轩 图/黄胜春)2011年1月2日正值元旦假期，北京CBD街头显得有些冷清，演员李晨从一栋六层的高楼上一跃而下，引起了楼下围观人群的一阵阵惊呼。原来由新经典娱乐传媒投资拍摄，滕华弢监制、陈思成自编自导自演的情感剧《北京爱情故事》正在拍摄开场戏，既是导演又是演员的陈思成手持对讲调度着现场，显得游刃有余。对于为何<font color=\"#1e50a2\">李晨</font>不用替身跳楼的疑问，陈思成很痛快的&ldquo;招供&rdquo;：&ldquo;是我逼他跳楼的！&rdquo;</p>\r\n<p><strong>陈思成逼李晨亲自跳楼</strong></p>\r\n<p>当天《北爱》正在这里拍摄全剧的开场戏&mdash;&mdash;演员张歆艺在该剧中出演夏女郎林夏，是一位热情如火开朗乐观的女孩。林夏为了逼出许久没有露面的程峰，而佯装跳楼自杀，李晨、石小猛（<font color=\"#1e50a2\">张译</font>饰）、肥四（张羽饰）上前阻拦，好言相劝，谁料也正遭遇背叛的李晨竟被张歆艺说中心事，一冲动便跳了下去。</p>\r\n<p>按常规来说，这种比较危险的戏都会请替身来演，但李晨却是亲自上阵，这让记者有些奇怪。对于这个问题，陈思成很痛快的就&ldquo;自首&rdquo;了，他笑着告诉记者是自己&ldquo;逼&rdquo;李晨跳楼的，&ldquo;当初晨儿看完剧本没提出任何异议，以为这场跳楼戏会安排替身来跳。但这个画面呈现在电视里，其实会有不少面部表情的特写，为了突出真实，我威逼利诱他说，你非得自己跳不可。晨儿想了想，点头答应了，这才有了今天这一幕。&rdquo;</p>\r\n<p><strong>安全措施相当完备</strong></p>\r\n<p>为了保证李晨的安全，现场停着消防车、救护车、警车、在楼前的空地上安放了一个巨大的充气垫，以防止意外。同时剧组还调来一辆吊车，用以固定威亚，同时防止李晨在跳楼时受风的影响碰撞到楼的外立面。虽然准备充足，但剧组人员还是非常紧张，准备工作重复了多次，知道确定万无一失时，导演陈思成才决定开拍。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('135', '<p>胜负彩11002期任选9场开奖揭晓：一等奖7476注，每注奖金1500元。任选九场总销量：17533548元。上百位网友命中任九头奖，其中[战神时代]一人独中78注任九头奖为平台最多，[北单高手]命中32注任九头奖，而网友[有耐心必成功]凭借576注方案也擒得12注任九头奖。</p>\r\n<center>\r\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"400\" align=\"center\" bgcolor=\"#0091c7\" border=\"0\">\r\n    <tbody>\r\n        <tr>\r\n            <td>\r\n            <table cellspacing=\"1\" cellpadding=\"1\" width=\"100%\" border=\"0\">\r\n                <tbody>\r\n                    <tr bgcolor=\"#d1eaf2\">\r\n                        <td height=\"58\" rowspan=\"2\" style=\"width: 28px\">胜<br />\r\n                        负<br />\r\n                        彩</td>\r\n                        <td height=\"58\" style=\"width: 28px\">维<br />\r\n                        　<br />\r\n                        冈</td>\r\n                        <td height=\"58\" style=\"width: 28px\">水<br />\r\n                        晶<br />\r\n                        宫</td>\r\n                        <td height=\"58\" style=\"width: 28px\">德<br />\r\n                        比<br />\r\n                        郡</td>\r\n                        <td height=\"58\" style=\"width: 28px\">伊<br />\r\n                        普<br />\r\n                        斯</td>\r\n                        <td height=\"58\" style=\"width: 28px\">米<br />\r\n                        德<br />\r\n                        尔</td>\r\n                        <td height=\"58\" style=\"width: 28px\">朴<br />\r\n                        茨<br />\r\n                        茅</td>\r\n                        <td height=\"58\" style=\"width: 28px\">巡<br />\r\n                        游<br />\r\n                        者</td>\r\n                        <td height=\"58\" style=\"width: 28px\">马<br />\r\n                        竞<br />\r\n                        技</td>\r\n                        <td height=\"58\" style=\"width: 28px\">赫<br />\r\n                        塔<br />\r\n                        菲</td>\r\n                        <td height=\"58\" style=\"width: 28px\">瓦<br />\r\n                        伦<br />\r\n                        西</td>\r\n                        <td height=\"58\" style=\"width: 28px\">维<br />\r\n                        拉<br />\r\n                        利</td>\r\n                        <td height=\"58\" style=\"width: 28px\">巴<br />\r\n                        　<br />\r\n                        萨</td>\r\n                        <td height=\"58\" style=\"width: 28px\">塞<br />\r\n                        维<br />\r\n                        利</td>\r\n                        <td height=\"58\" style=\"width: 28px\">马<br />\r\n                        洛<br />\r\n                        卡</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</center>\r\n<p>　　温馨提醒：兑奖有效期60天，本期兑奖截止日期为：2011-3-3，逾期将按弃奖处理。</p>\r\n<p style=\"text-align: center\"><strong>任选9场第11002期冷门排行榜</strong></p>\r\n<p>\r\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"600\" align=\"center\" bgcolor=\"#0091c7\" border=\"0\">\r\n    <tbody>\r\n        <tr>\r\n            <td>\r\n            <table cellspacing=\"1\" cellpadding=\"1\" width=\"100%\" border=\"0\">\r\n                <tbody>\r\n                    <tr bgcolor=\"#d1eaf2\">\r\n                        <td width=\"72\" height=\"18\">冷门排序</td>\r\n                        <td width=\"72\">场号</td>\r\n                        <td width=\"123\">主客队名</td>\r\n                        <td width=\"104\">实际比赛结果</td>\r\n                        <td width=\"72\">猜胜比例</td>\r\n                        <td width=\"72\">猜平比例</td>\r\n                        <td width=\"72\">猜负比例</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\" height=\"18\">\r\n                        <td height=\"18\">1</td>\r\n                        <td>7</td>\r\n                        <td>巡游者VS布里斯</td>\r\n                        <td>1</td>\r\n                        <td>76.84</td>\r\n                        <td>16.66</td>\r\n                        <td>6.5</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\" height=\"18\">\r\n                        <td height=\"18\">2</td>\r\n                        <td>6</td>\r\n                        <td>朴茨茅VS赫尔城</td>\r\n                        <td>0</td>\r\n                        <td>49.53</td>\r\n                        <td>32.92</td>\r\n                        <td>17.55</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\" height=\"18\">\r\n                        <td height=\"18\">3</td>\r\n                        <td>8</td>\r\n                        <td>马竞技VS桑坦德</td>\r\n                        <td>1</td>\r\n                        <td>67.97</td>\r\n                        <td>21.87</td>\r\n                        <td>10.17</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\" height=\"18\">\r\n                        <td height=\"18\">4</td>\r\n                        <td>3</td>\r\n                        <td>德比郡VS米尔沃</td>\r\n                        <td>1</td>\r\n                        <td>45.34</td>\r\n                        <td>26.93</td>\r\n                        <td>27.72</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\" height=\"18\">\r\n                        <td height=\"18\">5</td>\r\n                        <td>5</td>\r\n                        <td>米德尔VS诺维奇</td>\r\n                        <td>1</td>\r\n                        <td>39.16</td>\r\n                        <td>28.1</td>\r\n                        <td>32.74</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\" height=\"18\">\r\n                        <td height=\"18\">6</td>\r\n                        <td>1</td>\r\n                        <td>维&nbsp; 冈VS纽卡斯</td>\r\n                        <td>0</td>\r\n                        <td>40.64</td>\r\n                        <td>28.26</td>\r\n                        <td>31.1</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\" height=\"18\">\r\n                        <td height=\"18\">7</td>\r\n                        <td>4</td>\r\n                        <td>伊普斯VS诺丁汉</td>\r\n                        <td>0</td>\r\n                        <td>36.77</td>\r\n                        <td>27.75</td>\r\n                        <td>35.48</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\" height=\"18\">\r\n                        <td height=\"18\">11</td>\r\n                        <td>11</td>\r\n                        <td>比利亚VS阿尔梅</td>\r\n                        <td>3</td>\r\n                        <td>66.57</td>\r\n                        <td>23.07</td>\r\n                        <td>10.36</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\" height=\"18\">\r\n                        <td height=\"18\">12</td>\r\n                        <td>13</td>\r\n                        <td>塞维利VS奥萨苏</td>\r\n                        <td>3</td>\r\n                        <td>67.58</td>\r\n                        <td>20.89</td>\r\n                        <td>11.53</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\" height=\"18\">\r\n                        <td height=\"18\">13</td>\r\n                        <td>9</td>\r\n                        <td>赫塔费VS皇&nbsp; 马</td>\r\n                        <td>0</td>\r\n                        <td>7.28</td>\r\n                        <td>16.05</td>\r\n                        <td>76.67</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\" height=\"18\">\r\n                        <td height=\"18\">14</td>\r\n                        <td>12</td>\r\n                        <td>巴&nbsp; 萨VS莱万特</td>\r\n                        <td>3</td>\r\n                        <td>95.17</td>\r\n                        <td>4.06</td>\r\n                        <td>0.78</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><img title=\"详细开奖\" alt=\"详细开奖\" src=\"http://i0.sinaimg.cn/ty/2011/0104/U2367P6DT20110104110344.jpg\" /></div>\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><span class=\"img_descr\">详细开奖</span></div>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('136', '<p class=\"f_center\" style=\"text-align: center\"><strong><img alt=\"《宫》主演冯绍峰、杨幂、何晟铭在粉丝节现场。\" src=\"http://img4.cache.netease.com/ent/2011/1/4/20110104112732a22b7.jpg\" /><br />\r\n</strong><a title=\"《宫》\" href=\"http://ent.163.com/special/00034J16/gong.html\" target=\"_blank\"><font color=\"#1e50a2\">《宫》</font></a>主演冯绍峰、<a href=\"http://data.ent.163.com/star/product/00000RBU.html\"><font color=\"#1e50a2\">杨幂</font></a>、何晟铭在粉丝节现场。</p>\r\n<p><strong>网易娱乐1月4日报道</strong>&nbsp;仿佛是给2011年芒果粉丝节爱情主题助兴，喧嚣的长沙被突如其来的大雪包裹成洁白无瑕浪漫之城，正如应邀出席的《宫》女一号杨幂所言：我们演绎了一场不一样的爱情。由于清穿剧《宫》最终被湖南卫视购入并且作为开春大戏从正月初五开始全国首播，三名主演杨幂、冯绍峰、何晟铭也以嘉宾身份参加芒果粉丝节多项活动，晚上又现身直播现场，化身爱情代言组合在节目压轴阶段亮相，人气大爆。</p>\r\n<p><strong>爱情三人行杨幂卖关子&nbsp; 导播摆乌龙委屈何晟铭</strong></p>\r\n<p>2011年芒果粉丝节的主打情感线就是赞美和感怀纯美爱情，所以《宫》的三位主演被安排在当晚直播的最后阶段出场，晚会导演还处心积虑地设计情侣共看老电影的舞台效果，伴随人气歌手<a href=\"http://data.ent.163.com/star/product/00000OJQ.html\"><font color=\"#1e50a2\">张杰</font></a>的《这就是爱》，几个不同感觉的爱情组合进行真情告白。</p>\r\n<p>话筒转到杨幂手中时，现场粉丝发出高声尖叫，显示出&ldquo;晴川&rdquo;的不俗人气。杨幂坦诚在《宫》剧中她和两位阿哥演绎了一场不一样的爱情，会让每个观众都看到自己的影子。&ldquo;八阿哥&rdquo;冯绍峰则调侃自己在爱情路上充满霸气，最终抱得美人归。轮到&ldquo;四阿哥&rdquo;何晟铭告白时，舞台衔接出现状况，导播被迫将&ldquo;雍正&rdquo;的声音拉掉，何晟铭大度地无奈耸肩。不过等主持人上场时大家都向&ldquo;雍正爷&rdquo;致歉。晚会结束后现场&ldquo;晟铭王朝&rdquo;粉丝团颇有微词，倒是何晟铭表示，他参加过很多的大型综艺节目的直播，衔接出现一些状况难以避免，他不会对此多作计较。而且自己没来得及在直播现场讲出来的内容，观众还可以在欣赏电视剧《宫》的时候找到答案。</p>\r\n<p><strong>录制宣传片&nbsp; 杨幂最忙 绍峰搞怪 晟铭记忆强</strong></p>\r\n<p>由于离《宫》在湖南卫视播出的时间越来越近，卫视总编室的宣传组也利用三位主演来参加粉丝节的机会，见缝插针将三人抢到录影棚拍摄宣传片。</p>\r\n<p>性格外向的冯绍峰自告奋勇第一个出场，录制过程还不断发挥表演天赋搞怪，令摄像大哥也创作欲望强烈，比导演要求的脚本还多拍了好几条&ldquo;备份&rdquo;。</p>\r\n<p>而&ldquo;雍正爷&rdquo;何晟铭则显示出超强记忆力，大段大段的台词一根烟的功夫就背了下来。最忙的当属杨幂，录制宣传片的空隙还要不断被采访的记者打断，甚至录到一半还被《娱乐急先锋》的导演从四楼演播厅&ldquo;劫持&rdquo;到二楼演播厅。</p>\r\n<p>等到三人合录的时候，更是发挥了表演才华，将电视导演的要求超额完成任务。尽管奔波不断的晴川和两位阿哥到录制尾声已经困乏不已，还是架不住现场工作人员的热情，一一合影以后才&ldquo;转战&rdquo;T2区，进入2011年芒果粉丝节的正面战场。</p>\r\n<p><strong>金鹰网看剧照说剧情&nbsp; 杨幂坦言吻戏没&ldquo;享受&rdquo;</strong></p>\r\n<p>其实三人到长沙的第一站是进入湖南卫视官方网站金鹰网与网友现场互动。有大群粉丝追踪守候。三人体贴地招呼粉丝注意避风防冻。</p>\r\n<p>在直播室内，金鹰网站主持人拿出剧照，要求三人&ldquo;看图说话&rdquo;，企图挖出背后猛料。面对娇美女主持，八阿哥冯绍峰与四阿哥何晟铭几乎要&ldquo;说出不该说的故事&rdquo;，都是晴川杨幂在关键时刻&ldquo;警告&rdquo;两位忘乎所以的阿哥，这个不能说，那个不能说，让现场粉丝们的情绪也忽上忽下，内心奇痒。面对现场</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('137', '<p>位于从化市太平神岗广从北路263号的人盛巴厘天地（资料、团购、论坛、二手）目前在售100-132平方米的三房单位，户型设计采用&ldquo;N+1&rdquo;百变户型，赠送空间高达15%，毛坯售价5500元/平方米起，最低首付只需12万元。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('138', '<p>新浪体育讯　北京时间1月2日，胜负彩第11001期开奖，头奖开出60注434015元，二等奖出1555注4194元，上期1082万滚存本期。投注平台[北单高手]中2注头奖56注二等揽110余万，[战神时代]中1注头奖25注二等，另外他还获得了303注任九获得95万多元！</p>\r\n<p>　　本期胜负彩冷门不多，英超强队纷纷取胜，只有埃弗顿在客场输球这个小冷门进入到冷门排行榜前五名。英冠方面，诺丁汉森林主场未能如愿赢球杀伤了不少彩民，仅16%的彩民猜中。由于上期1082万滚存本期，致头奖奖金较高。</p>\r\n<p>\r\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"400\" align=\"center\" bgcolor=\"#0091c7\" border=\"0\">\r\n    <tbody>\r\n        <tr>\r\n            <td>\r\n            <table cellspacing=\"1\" cellpadding=\"1\" width=\"100%\" border=\"0\">\r\n                <tbody>\r\n                    <tr bgcolor=\"#d1eaf2\">\r\n                        <td height=\"58\" rowspan=\"2\" style=\"width: 28px\">胜<br />\r\n                        负<br />\r\n                        彩</td>\r\n                        <td height=\"58\" style=\"width: 28px\">利<br />\r\n                        物<br />\r\n                        浦</td>\r\n                        <td height=\"58\" style=\"width: 28px\">曼<br />\r\n                        <br />\r\n                        城</td>\r\n                        <td height=\"58\" style=\"width: 28px\">斯<br />\r\n                        托<br />\r\n                        克</td>\r\n                        <td height=\"58\" style=\"width: 28px\">桑<br />\r\n                        德<br />\r\n                        兰</td>\r\n                        <td height=\"58\" style=\"width: 28px\">热<br />\r\n                        <br />\r\n                        刺</td>\r\n                        <td height=\"58\" style=\"width: 28px\">西<br />\r\n                        汉<br />\r\n                        姆</td>\r\n                        <td height=\"58\" style=\"width: 28px\">伯<br />\r\n                        明<br />\r\n                        翰</td>\r\n                        <td height=\"58\" style=\"width: 28px\">布<br />\r\n                        里<br />\r\n                        斯</td>\r\n                        <td height=\"58\" style=\"width: 28px\">考<br />\r\n                        文<br />\r\n                        垂</td>\r\n                        <td height=\"58\" style=\"width: 28px\">赫<br />\r\n                        尔<br />\r\n                        城</td>\r\n                        <td height=\"58\" style=\"width: 28px\">诺<br />\r\n                        维<br />\r\n                        奇</td>\r\n                        <td height=\"58\" style=\"width: 28px\">诺<br />\r\n                        丁<br />\r\n                        汉</td>\r\n                        <td height=\"58\" style=\"width: 28px\">斯<br />\r\n                        旺<br />\r\n                        西</td>\r\n                        <td height=\"58\" style=\"width: 28px\">沃<br />\r\n                        特<br />\r\n                        福</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p>　　胜负彩全国投注总额：33971174元，10128期10821820元滚存本期头奖奖池；任选九场销量：19828386元。</p>\r\n<p>　　投注平台中成功的方案中共计中出3注一等奖，其中[北单高手]1人拿下两注，同时他还斩获56注二等奖，约有600多人跟单合买，他们将分享110余万元奖金；红人[战神时代]也中得1注头奖25注二等。任选九场方面更是遍地开花，共计有170多位会员中得头奖，其中[战神时代]的4万元合买单揽下303注。</p>\r\n<p>\r\n<table cellspacing=\"0\" cellpadding=\"0\" align=\"center\" bgcolor=\"#000000\" border=\"0\">\r\n    <tbody>\r\n        <tr>\r\n            <td>\r\n            <table cellspacing=\"1\" cellpadding=\"1\" width=\"500\" border=\"0\">\r\n                <tbody>\r\n                    <tr bgcolor=\"#dcdcdc\">\r\n                        <td align=\"center\" colspan=\"7\">胜负彩11001期冷门排行榜</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">冷门排序</td>\r\n                        <td align=\"center\">场号</td>\r\n                        <td align=\"center\">主客队名</td>\r\n                        <td align=\"center\">猜胜比例</td>\r\n                        <td align=\"center\">猜平比例</td>\r\n                        <td align=\"center\">猜负比例</td>\r\n                        <td align=\"center\">赛果</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">12</td>\r\n                        <td align=\"center\">诺丁汉VS巴恩斯</td>\r\n                        <td align=\"center\">72.99</td>\r\n                        <td align=\"center\">16.81</td>\r\n                        <td align=\"center\">10.21</td>\r\n                        <td align=\"center\">1</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">2</td>\r\n                        <td align=\"center\">9</td>\r\n                        <td align=\"center\">考文垂VS伊普斯</td>\r\n                        <td align=\"center\">49.67</td>\r\n                        <td align=\"center\">26.47</td>\r\n                        <td align=\"center\">23.86</td>\r\n                        <td align=\"center\">1</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">8</td>\r\n                        <td align=\"center\">布里斯VS卡迪夫</td>\r\n                        <td align=\"center\">26.57</td>\r\n                        <td align=\"center\">26.62</td>\r\n                        <td align=\"center\">46.81</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">4</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">斯托克VS埃弗顿</td>\r\n                        <td align=\"center\">28.08</td>\r\n                        <td align=\"center\">33.28</td>\r\n                        <td align=\"center\">38.64</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">5</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">赫尔城VS莱切城</td>\r\n                        <td align=\"center\">42.94</td>\r\n                        <td align=\"center\">27.5</td>\r\n                        <td align=\"center\">29.57</td>\r\n                        <td align=\"center\">0</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">6</td>\r\n                        <td align=\"center\">11</td>\r\n                        <td align=\"center\">诺维奇VS巡游者</td>\r\n                        <td align=\"center\">32.64</td>\r\n                        <td align=\"center\">30.17</td>\r\n                        <td align=\"center\">37.19</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">7</td>\r\n                        <td align=\"center\">13</td>\r\n                        <td align=\"center\">斯旺西VS雷 丁</td>\r\n                        <td align=\"center\">44.93</td>\r\n                        <td align=\"center\">33.26</td>\r\n                        <td align=\"center\">21.81</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">11</td>\r\n                        <td align=\"center\">7</td>\r\n                        <td align=\"center\">伯明翰VS阿森纳</td>\r\n                        <td align=\"center\">12.74</td>\r\n                        <td align=\"center\">22.67</td>\r\n                        <td align=\"center\">64.59</td>\r\n                        <td align=\"center\">0</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">12</td>\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">利物浦VS博尔顿</td>\r\n                        <td align=\"center\">66.45</td>\r\n                        <td align=\"center\">22.03</td>\r\n                        <td align=\"center\">11.53</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">13</td>\r\n                        <td align=\"center\">5</td>\r\n                        <td align=\"center\">热 刺VS富勒姆</td>\r\n                        <td align=\"center\">70.39</td>\r\n                        <td align=\"center\">21.42</td>\r\n                        <td align=\"center\">8.19</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">14</td>\r\n                        <td align=\"center\">2</td>\r\n                        <td align=\"center\">曼 城VS布莱浦</td>\r\n                        <td align=\"center\">84.97</td>\r\n                        <td align=\"center\">11.33</td>\r\n                        <td align=\"center\">3.7</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<div class=\"img_wrapper\">\r\n<p style=\"text-align: center\"><img title=\"2\" alt=\"2\" src=\"http://i2.sinaimg.cn/ty/2011/0102/U1161P6DT20110102115621.jpg\" />&nbsp;</p>\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><img title=\"详细开奖\" alt=\"详细开奖\" src=\"http://i3.sinaimg.cn/ty/2011/0102/U1161P6DT20110102115648.jpg\" /></div>\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><span class=\"img_descr\">详细开奖</span></div>\r\n</div>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('139', '<p>位于花都区新华三东大道与茶碑路交汇处的花都雅居乐花园（资料、团购、论坛、二手）目前主要推售&ldquo;花间集&rdquo;二期单位，主要户型为100-131㎡的三至四房，毛坯均价6800元/平方米，带装修8000-9000元元/平方米，其中 100㎡的单位带装修交楼，127-131㎡的单位毛坯发售。 花间集所有户型均带7米观景阳台、空中花园、大面积入户花园。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('140', '<p>新浪体育讯　2011年1月2日，胜负彩11001期任选9场开奖揭晓：一等奖出9078注 ，每注奖金1397元。任选九场总销量：19828386元。平台任选九场方面是遍地开花，共计有170多位会员中得头奖，其中[战神时代]的4万元合买单揽下303注，共计斩获奖金423291元。\r\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"400\" align=\"center\" bgcolor=\"#0091c7\" border=\"0\">\r\n    <tbody>\r\n        <tr>\r\n            <td>\r\n            <table cellspacing=\"1\" cellpadding=\"1\" width=\"100%\" border=\"0\">\r\n                <tbody>\r\n                    <tr bgcolor=\"#d1eaf2\">\r\n                        <td height=\"58\" rowspan=\"2\" style=\"width: 28px\">胜<br />\r\n                        负<br />\r\n                        彩</td>\r\n                        <td height=\"58\" style=\"width: 28px\">利<br />\r\n                        物<br />\r\n                        浦</td>\r\n                        <td height=\"58\" style=\"width: 28px\">曼<br />\r\n                        <br />\r\n                        城</td>\r\n                        <td height=\"58\" style=\"width: 28px\">斯<br />\r\n                        托<br />\r\n                        克</td>\r\n                        <td height=\"58\" style=\"width: 28px\">桑<br />\r\n                        德<br />\r\n                        兰</td>\r\n                        <td height=\"58\" style=\"width: 28px\">热<br />\r\n                        <br />\r\n                        刺</td>\r\n                        <td height=\"58\" style=\"width: 28px\">西<br />\r\n                        汉<br />\r\n                        姆</td>\r\n                        <td height=\"58\" style=\"width: 28px\">伯<br />\r\n                        明<br />\r\n                        翰</td>\r\n                        <td height=\"58\" style=\"width: 28px\">布<br />\r\n                        里<br />\r\n                        斯</td>\r\n                        <td height=\"58\" style=\"width: 28px\">考<br />\r\n                        文<br />\r\n                        垂</td>\r\n                        <td height=\"58\" style=\"width: 28px\">赫<br />\r\n                        尔<br />\r\n                        城</td>\r\n                        <td height=\"58\" style=\"width: 28px\">诺<br />\r\n                        维<br />\r\n                        奇</td>\r\n                        <td height=\"58\" style=\"width: 28px\">诺<br />\r\n                        丁<br />\r\n                        汉</td>\r\n                        <td height=\"58\" style=\"width: 28px\">斯<br />\r\n                        旺<br />\r\n                        西</td>\r\n                        <td height=\"58\" style=\"width: 28px\">沃<br />\r\n                        特<br />\r\n                        福</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p>　　温馨提醒：兑奖有效期60天，本期兑奖截止日期为：2011-3-2，逾期将按弃奖处理。</p>\r\n<p>\r\n<table cellspacing=\"0\" cellpadding=\"0\" align=\"center\" bgcolor=\"#000000\" border=\"0\">\r\n    <tbody>\r\n        <tr>\r\n            <td>\r\n            <table cellspacing=\"1\" cellpadding=\"1\" width=\"500\" border=\"0\">\r\n                <tbody>\r\n                    <tr bgcolor=\"#dcdcdc\">\r\n                        <td align=\"center\">冷门排序</td>\r\n                        <td align=\"center\">场号</td>\r\n                        <td align=\"center\">主客队名</td>\r\n                        <td align=\"center\">猜胜比例</td>\r\n                        <td align=\"center\">猜平比例</td>\r\n                        <td align=\"center\">猜负比例</td>\r\n                        <td align=\"center\">赛果</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">12</td>\r\n                        <td align=\"center\">诺丁汉VS巴恩斯</td>\r\n                        <td align=\"center\">73.8</td>\r\n                        <td align=\"center\">17.07</td>\r\n                        <td align=\"center\">9.13</td>\r\n                        <td align=\"center\">1</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">2</td>\r\n                        <td align=\"center\">8</td>\r\n                        <td align=\"center\">布里斯VS卡迪夫</td>\r\n                        <td align=\"center\">25.76</td>\r\n                        <td align=\"center\">26.54</td>\r\n                        <td align=\"center\">47.7</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">9</td>\r\n                        <td align=\"center\">考文垂VS伊普斯</td>\r\n                        <td align=\"center\">50.79</td>\r\n                        <td align=\"center\">26.34</td>\r\n                        <td align=\"center\">22.87</td>\r\n                        <td align=\"center\">1</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">4</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">斯托克VS埃弗顿</td>\r\n                        <td align=\"center\">27.51</td>\r\n                        <td align=\"center\">33.52</td>\r\n                        <td align=\"center\">38.97</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">5</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">赫尔城VS莱切城</td>\r\n                        <td align=\"center\">44.12</td>\r\n                        <td align=\"center\">27.56</td>\r\n                        <td align=\"center\">28.33</td>\r\n                        <td align=\"center\">0</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">6</td>\r\n                        <td align=\"center\">11</td>\r\n                        <td align=\"center\">诺维奇VS巡游者</td>\r\n                        <td align=\"center\">32.24</td>\r\n                        <td align=\"center\">29.91</td>\r\n                        <td align=\"center\">37.85</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">7</td>\r\n                        <td align=\"center\">13</td>\r\n                        <td align=\"center\">斯旺西VS雷 丁</td>\r\n                        <td align=\"center\">45.71</td>\r\n                        <td align=\"center\">33.69</td>\r\n                        <td align=\"center\">20.59</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">11</td>\r\n                        <td align=\"center\">7</td>\r\n                        <td align=\"center\">伯明翰VS阿森纳</td>\r\n                        <td align=\"center\">11.87</td>\r\n                        <td align=\"center\">23.67</td>\r\n                        <td align=\"center\">64.46</td>\r\n                        <td align=\"center\">0</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">12</td>\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">利物浦VS博尔顿</td>\r\n                        <td align=\"center\">66.61</td>\r\n                        <td align=\"center\">22.56</td>\r\n                        <td align=\"center\">10.82</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">13</td>\r\n                        <td align=\"center\">5</td>\r\n                        <td align=\"center\">热 刺VS富勒姆</td>\r\n                        <td align=\"center\">70.62</td>\r\n                        <td align=\"center\">21.77</td>\r\n                        <td align=\"center\">7.61</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td align=\"center\">14</td>\r\n                        <td align=\"center\">2</td>\r\n                        <td align=\"center\">曼 城VS布莱浦</td>\r\n                        <td align=\"center\">84.22</td>\r\n                        <td align=\"center\">11.89</td>\r\n                        <td align=\"center\">3.89</td>\r\n                        <td align=\"center\">3</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<div class=\"img_wrapper\">\r\n<p style=\"text-align: center\"><img title=\"1\" alt=\"1\" src=\"http://i0.sinaimg.cn/ty/2011/0102/U1161P6DT20110102120331.jpg\" /></p>\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><img title=\"详细开奖\" alt=\"详细开奖\" src=\"http://i2.sinaimg.cn/ty/2011/0102/U1161P6DT20110102120355.jpg\" /></div>\r\n<div class=\"img_wrapper\" style=\"text-align: center\"><span class=\"img_descr\">详细开奖</span></div>\r\n</div>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('141', '<p>位于白云广州大道北同和华远厂路段的卡布奇诺（资料、团购、论坛、二手）将于1月底开盘，首期主推22-42㎡单身公寓和55㎡一房单位，预计均价13000-16000万元/平方米，带装修和家私家电，之前进行诚意登记的买家开盘可享受98折优惠，2011年8月可交楼。项目周边有吉之岛、乐购、广百、金逸国际电影城。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('142', '<p>\r\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"580\" align=\"center\" bgcolor=\"#0091c7\" border=\"0\">\r\n    <tbody>\r\n        <tr>\r\n            <td>\r\n            <table cellspacing=\"1\" cellpadding=\"1\" width=\"100%\" border=\"0\">\r\n                <tbody>\r\n                    <tr bgcolor=\"#d1eaf2\">\r\n                        <td colspan=\"18\" height=\"20\">&lt;&lt; 足彩310 &gt;&gt;</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#d1eaf2\">\r\n                        <td align=\"center\" width=\"63\">注名</td>\r\n                        <td height=\"58\" style=\"width: 28px\">阿<br />\r\n                        森<br />\r\n                        纳</td>\r\n                        <td height=\"58\" style=\"width: 28px\">维<br />\r\n                        　<br />\r\n                        拉</td>\r\n                        <td height=\"58\" style=\"width: 28px\">纽<br />\r\n                        卡<br />\r\n                        斯</td>\r\n                        <td height=\"58\" style=\"width: 28px\">狼<br />\r\n                        　<br />\r\n                        队</td>\r\n                        <td height=\"58\" style=\"width: 28px\">布<br />\r\n                        莱<br />\r\n                        克</td>\r\n                        <td height=\"58\" style=\"width: 28px\">博<br />\r\n                        尔<br />\r\n                        顿</td>\r\n                        <td height=\"58\" style=\"width: 28px\">埃<br />\r\n                        弗<br />\r\n                        顿</td>\r\n                        <td height=\"58\" style=\"width: 28px\">尤<br />\r\n                        　<br />\r\n                        文</td>\r\n                        <td height=\"58\" style=\"width: 28px\">罗<br />\r\n                        　<br />\r\n                        马</td>\r\n                        <td height=\"58\" style=\"width: 28px\">博<br />\r\n                        洛<br />\r\n                        尼</td>\r\n                        <td height=\"58\" style=\"width: 28px\">卡<br />\r\n                        利<br />\r\n                        亚</td>\r\n                        <td height=\"58\" style=\"width: 28px\">热<br />\r\n                        那<br />\r\n                        亚</td>\r\n                        <td height=\"58\" style=\"width: 28px\">巴<br />\r\n                        勒<br />\r\n                        莫</td>\r\n                        <td height=\"58\" style=\"width: 28px\">国<br />\r\n                        　<br />\r\n                        米</td>\r\n                        <td align=\"center\" height=\"58\">金<br />\r\n                        额</td>\r\n                        <td align=\"center\" height=\"58\">上<br />\r\n                        期<br />\r\n                        命<br />\r\n                        中</td>\r\n                        <td align=\"center\" height=\"58\">历<br />\r\n                        史<br />\r\n                        命<br />\r\n                        中</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td width=\"63\" height=\"20\">第一档</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">1</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">2</td>\r\n                        <td align=\"center\">-</td>\r\n                        <td align=\"center\">51%</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td width=\"63\" height=\"20\">第二档</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">256</td>\r\n                        <td align=\"center\">-</td>\r\n                        <td align=\"center\">62.8%</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td width=\"63\" height=\"20\">第三档</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">310</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">768</td>\r\n                        <td align=\"center\">-</td>\r\n                        <td align=\"center\">68.6%</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td width=\"63\" height=\"20\">第四档</td>\r\n                        <td align=\"center\">30</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">30</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">310</td>\r\n                        <td align=\"center\">30</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">3072</td>\r\n                        <td align=\"center\">-</td>\r\n                        <td align=\"center\">75.1%</td>\r\n                    </tr>\r\n                    <tr bgcolor=\"#ffffff\">\r\n                        <td width=\"63\" height=\"20\">第五档</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">310</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">0</td>\r\n                        <td align=\"center\">310</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">10</td>\r\n                        <td align=\"center\">310</td>\r\n                        <td align=\"center\">31</td>\r\n                        <td align=\"center\">3</td>\r\n                        <td align=\"center\">13824</td>\r\n                        <td align=\"center\">-</td>\r\n                        <td align=\"center\">79.5%</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"color: red\">说明：媒体推荐的&ldquo;历史命中率统计&rdquo;表示媒体历史平均命中场次，即：历史命中总场数/(胜负彩期数*14)，该数据从胜负彩第08070期开始统计；如上期该媒体无推荐，则&ldquo;上期命中&rdquo;用&ldquo;-&rdquo;代替。</span></p>\r\n<!-- publish_helper_end --><!-- 高清图推荐 开始 -->', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('143', '<p class=\"f_center\" style=\"text-align: center\"><strong><img alt=\"《钢铁年代》陈宝国画册。\" src=\"http://img4.cache.netease.com/ent/2011/1/4/2011010407185082154.jpg\" /><br />\r\n</strong><a title=\"钢铁年代\" target=\"_blank\" href=\"http://ent.163.com/special/gtnd/\"><font color=\"#1e50a2\">《钢铁年代》</font></a><a href=\"http://data.ent.163.com/star/product/00000PCc.html\"><font color=\"#1e50a2\">陈宝国</font></a>画册。</p>\r\n<p><strong>华西都市报1月4日报道</strong> 今年元旦，由陈宝国领衔主演的工人题材电视剧《钢铁年代》，作为开年大戏，登陆北京、山东等四大卫视黄金档。该剧讲述共和国成立初期，钢铁工人鏖战关东的故事。陈宝国和<a href=\"http://data.ent.163.com/star/product/00000PDS.html\"><font color=\"#1e50a2\">冯远征</font></a>在剧中是一对&ldquo;冤家&rdquo;，既争斗一辈子，也相惜一辈子。昨日，陈宝国接受了华西都市报记者的电话专访。</p>\r\n<p><strong>聊新戏角色：与冯远征&ldquo;互掐&rdquo;</strong></p>\r\n<p>在《钢铁年代》中，陈宝国扮演钢铁工人尚铁龙，成天与钢铁、锅炉打交道，还跟冯远征扮演的杨寿山抢媳妇。</p>\r\n<p>&ldquo;我跟冯远征是 冤家 ，斗了一辈子，但谁也离不开谁，谁要迈过人生中的坎儿，都必须让对方帮一把，最后还成了战友、兄弟。&rdquo;此前，陈宝国曾公开向冯远征道歉，表示在演</p>\r\n<p>一出争执戏时，失手将冯远征打倒在地，&ldquo;挺对不起他的，主要是情绪来了收不住。&rdquo;陈宝国说。</p>\r\n<p>&ldquo;我的第一个角色就是演工人，这些年来演多了 帝王将相 ，总觉得差了点什么，演过尚铁龙，觉得踏实多了。&rdquo;时隔28年再演工人，陈宝国感慨万千。&ldquo;工人题材是这部戏的一大亮点，虽然题材有点硬，但有很多真情流露的场面，用 情 打动观众，年龄跨度大，我也演得过瘾。&rdquo;2011年下半年，《大宅门3》又将开拍，陈宝国说：&ldquo;希望能延续《大宅门》和白景琦的经典。&rdquo;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('144', '<p><strong>佬牛11003期胜负彩分析(英22意18)</strong></p>\r\n<p>　　11003期胜负彩回归久违的英意联赛组合，本轮英超为连赛四轮圣诞战的最后一轮，因延期耽误和主客场因素使得球队消耗颇有不同。而意甲则是下半程的开铺之战，短暂冬休令球队备战充满变数。本期足彩欧赔支持亚盘在半/一以上让球只有四场，胆材不丰，竞猜似有难度。</p>\r\n<p>　　<strong>01 阿森纳vs 曼彻斯特城&nbsp;&nbsp; 3/0</strong></p>\r\n<p>　　近三轮圣诞战，阿森纳2胜1平不败、曼城三战全胜都成了抢分大户。阿森纳20轮积39分排第三名，主场6胜3负颇有起伏。曼城21轮积41分排第二名，客场6胜2平2负战绩则为英超客场龙之一。往绩阿森纳主场9胜3平占据绝对优势堪是对手克星，本季首回合竟然3-0扫荡曼城。欧赔99家平均 1.94 &rarr;&nbsp; 3.39 &uarr;&nbsp; 3.69 &rarr;折合亚盘主让半球0.94中高水盘面热门度不高。威廉。希尔 1.95&nbsp; 3.50&nbsp; 3.80与立博 1.91 &uarr;&nbsp; 3.40 &rarr;&nbsp; 4.00 &rarr;平负两项差值颇大极易造热主队。足彩复选3/0。</p>\r\n<p>　　<strong>02 阿斯顿维拉vs 桑德兰&nbsp;&nbsp; 3</strong></p>\r\n<p>　　阿斯顿维拉客场3-3战平切尔西，三轮圣诞战方取1分，20轮积21分排名掉至第15名，只比降级圈多2分。主场4胜4平2负战绩不俗，只负于热刺和阿森纳；桑德兰3-0主胜布莱克才赢得一场圣诞战，21轮积30分排第六名，客场1胜5平4负战绩糟糕。往绩维拉主场4胜4平1负占优，本季首回合客场0-1 失利。欧赔99家平均 2.14 &rarr;&nbsp; 3.22 &rarr;&nbsp; 3.29 &uarr;折合亚盘主让平/半0.86低水盘势利好。威廉。希尔 2.25 &uarr;&nbsp; 3.30 &rarr;&nbsp; 3.20 &darr;与立博 2.00&nbsp; 3.50&nbsp; 3.00平赔高耸又胜负两项各有侧重，似有诱两头之嫌，与两队战绩特征不符。足彩单选3，复选3/1。</p>\r\n<p>　　<strong>03 纽卡斯尔联vs 西汉姆联&nbsp;&nbsp; 3/0</strong></p>\r\n<p>　　纽卡斯尔1-0客场击败维冈才赢得圣诞战首胜。20轮积25分排第十，主场3胜3平4负战绩尤显平庸；西汉姆联三轮圣诞战2胜1平不败士气高涨，21轮积 20分排名提升至第16名，但只比降级圈多1分。客场1胜4平5负又是其软肋。往绩纽卡主场7胜5平2负占优，本季首回合客场亦2-1击败对手。欧赔99 家平均 1.88 &rarr;&nbsp; 3.37 &rarr;&nbsp; 3.93 &darr;折合亚盘主让半球0.88低水盘势利好。威廉。希尔 1.91 &rarr;&nbsp; 3.40 &darr;&nbsp; 4.00 &rarr;与立博 1.73 &uarr;&nbsp; 3.40 &rarr;&nbsp; 4.00 &rarr;主胜赔离奇差值又平负两项尤显谨慎(也不排除纽卡放水之嫌)。足彩复选3/0。</p>\r\n<p>　　<strong>04 狼&nbsp; 队vs 切尔西&nbsp; 0/3</strong></p>\r\n<p>　　狼队三轮圣诞战除了客场爆冷1-0击败利物浦，其余两战全败。20轮积18分垫底(往历圣诞过后榜尾球队基本就是降级的命，只有西布朗04/05赛季例外)，主场4胜2平4负亦是起伏不定；切尔西三轮1胜1平1负抢分不多，20轮积35分排第五名，客场3胜3平4负的战绩亦差强人意。往绩五次交手狼队全败，进2球丢18球之多，俨然又遭地头苦主。欧赔99家平均 7.48 &uarr;&nbsp; 4.10 &rarr;&nbsp; 1.42 &rarr;折合亚盘客让一球0.83低水盘势利好。威廉。希尔 8.00&nbsp; 4.50&nbsp; 1.40 与立博 5.50&nbsp; 3.60&nbsp; 1.50 三项数值分歧颇大似乎暗藏冷意，毕竟老气横秋的切尔西已是强弩之末不可置信，而垫底饿狼困兽犹斗保级大业重于泰山。虎落平川被犬欺，何况切尔西遭遇的是狼。足彩复选3/0走两头。</p>\r\n<p>　　<strong>05 布莱克本vs 利物浦&nbsp;&nbsp; 0/1</strong></p>\r\n<p>　　布莱克本近五轮1胜1平3负，根本不予理睬印度老板声色俱厉要求打进前六名的旨意。21轮积25分排第12名，主场4胜3平3负亦无鲜明强势可言。利物浦主场2-1逆转击败博尔顿，终结此前两连败。19轮积25分排第九名(若算计补赛两轮能取6分亦能排进前六名)，只是客场1胜2平6负进6球丢16球战绩过于糟糕。往绩布莱克本5胜11平15负以及主场4胜6平5负处于下风，且97/98赛季以来近24次交手1胜11平12负处于绝对劣势，实属遭遇克星。欧赔99家平均 3.24 &rarr;&nbsp; 3.23 &rarr;&nbsp; 2.16 &uarr;折合亚盘客让平/半0.86低水盘势利好。威廉。希尔 3.40&nbsp; 3.30&nbsp; 2.15与立博 2.75&nbsp; 3.25&nbsp; 2.20主胜赔分歧颇大予以剔除。足彩复选0/1。</p>\r\n<p>　　<strong>06 博尔顿vs 维冈竞技&nbsp;&nbsp; 3/1</strong></p>\r\n<p>　　博尔顿近遭客场四连败，本季主场5胜4平1负战绩不俗，21轮积29分排名高达第七。维冈竞技近三轮相继1胜1平1负士气下滑，20轮积20分排倒数第四名，只比降级圈多1分。客场2胜3平4负则有一定得分能力。往绩博尔顿主场2胜1平2负与对手平分秋色，本季首回合客场1-1战平。欧赔99家平均 1.67 &rarr;&nbsp; 3.50 &rarr;&nbsp; 5.04 &darr;折合亚盘主让半/一0.85低水盘势不利。威廉。希尔 1.70 &darr;&nbsp; 3.60 &rarr;&nbsp; 5.00 &uarr;与立博 1.61 &darr;&nbsp; 3.50 &rarr;&nbsp; 4.50 &rarr;平负两项稍显谨慎值得关注。足彩复选3/1而策。</p>\r\n<p>　　<strong>07 埃弗顿vs 托特纳姆热刺&nbsp;&nbsp; 1/0</strong></p>\r\n<p>　　埃弗顿近十轮1胜6平3负，对谁亦难言争胜。20轮积22分排第13名，实际上只比降级圈多3分。主场2胜4平3负又不善主战；热刺不仅圣诞战三场全胜，且近九轮6胜3平状态颇佳。20轮积36分排第四名，客场4胜2平3负的战绩亦不算太差。往绩埃弗顿主场2胜9平6负处于劣势，且近六次相继3负3平不胜(事实上热刺亦是太妃糖克星)。欧赔99家平均 2.63 &rarr;&nbsp; 3.20 &rarr;&nbsp; 2.55 &darr;折合亚盘客让平手0.78超低水盘势趋热。威廉。希尔 2.60 &darr;&nbsp; 3.25 &rarr;&nbsp; 2.70 &rarr;与立博 2.70&nbsp; 3.25&nbsp; 2.62平赔高不离谱胜负两项各有侧重。足彩复选1/0。</p>\r\n<p>　　<strong>08 尤文图斯vs 帕尔马&nbsp;&nbsp; 3/1</strong></p>\r\n<p>　　17轮意甲战罢，尤文图斯8胜7平2负积31分排第四名，帕尔玛4胜7平6负积19分排第16名，前者目标争冠，后者将为保级而战。但两队的共同点皆以7 场平局之多荣膺意甲平局大师称号。尤文主场4胜3平1负胜率不足，帕尔玛客场1胜2平5负赢球颇难。往绩尤文主场9胜4平2负占优，上赛季末倒数第三轮则 2-3落败。欧赔99家平均 1.42 &rarr;&nbsp; 4.01 &uarr;&nbsp; 7.50 &uarr;折合亚盘主让一球0.83低水盘势利好。威廉。希尔 1.44 &rarr;&nbsp; 4.33 &uarr;&nbsp; 7.50 &rarr; 与SNAI 1.40&nbsp; 4.25&nbsp; 8.00平负两项高企客队爆冷机会不多，帕尔玛本季客战豪门列强无一不败，不至于找尤文开涮，不过平局大师之战不宜轻易弃平。足彩单选3，复选3/1 。</p>\r\n<p>　　<strong>09 罗&nbsp; 马vs 卡塔尼亚&nbsp;&nbsp; 3</strong></p>\r\n<p>　　罗马冬休前客胜AC米兰颇涨士气，积29分排名提升至第五，主场6胜2平胜率很高。来自西西里岛的卡塔尼亚本季主强客弱特征鲜明，客场3平5负不胜实为客场虫。往绩罗马主场六战全胜无疑就是对手克星。欧赔99家平均 1.44 &rarr;&nbsp; 3.95 &rarr;&nbsp; 7.16 &darr;折合亚盘主让一球0.88低水盘势利好。威廉。希尔 1.50 &rarr;&nbsp; 4.20 &uarr;&nbsp; 6.50 &darr;与SNAI 1.37&nbsp; 4.25&nbsp; 9.00平赔高耸又客胜赔离散，客队凶多吉少。足彩单选3 。</p>\r\n<p>　<strong>　10 博洛尼亚vs 佛罗伦萨&nbsp; 3/0</strong></p>\r\n<p>　　两队都排名后半区，博洛尼亚17轮积21分，主场4胜3平1负输球不易。佛罗伦萨16轮积19分，客场3平5负实如客场虫。往绩博洛尼主场2胜5平2负与对手平分秋色。欧赔99家平均 2.67 &rarr;&nbsp; 2.99 &darr;&nbsp; 2.65 &rarr;折合亚盘客让平手0.83低水盘势利好。威廉。希尔 2.70 &darr;&nbsp; 3.10 &uarr;&nbsp; 2.70 &rarr;与SNAI 2.65&nbsp; 3.15&nbsp; 2.65平赔稍高不易战平，足彩复选3/0 。</p>\r\n<p>　　<strong>11 卡利亚里vs AC米兰&nbsp;&nbsp; 0/1</strong></p>\r\n<p>　　卡利亚里积20分排名第14，撒丁岛主场4胜1平3负亦无往历稳健。AC米兰主场0-1不敌罗马，前七轮6胜1平不败战绩作古。积36分占据榜首。客场5胜2平1负亦为客场龙之一。往绩卡利亚主场1胜6平5负处于明显下风。欧赔99家平均 4.03 &darr;&nbsp; 3.22 &rarr;&nbsp; 1.89 &rarr;折合亚盘客让半球0.89低水盘势利好。威廉。希尔 3.80 &darr;&nbsp; 3.50 &uarr;&nbsp; 1.95 &uarr;与SNAI 4.25&nbsp; 3.30&nbsp; 1.85 三项数值颇有分歧，足彩至少需要0/1协防。</p>\r\n<p>　　<strong>12 热那亚vs 拉齐奥&nbsp;&nbsp; 0/3</strong></p>\r\n<p>　　热那亚16轮积21分排第11名，主场3胜1平4负发挥不稳，且面对榜前球队输球颇多。拉齐奥积33分排第三名，客场4胜1平3负亦是能赢善输，且近三轮1平2负不胜。往绩热那亚主场1平4负堪遭克星。欧赔99家平均 2.35 &rarr;&nbsp; 3.04 &darr;&nbsp; 3.01 &rarr;折合亚盘主让平/半1.02高水盘势凶险。威廉。希尔 2.37 &darr;&nbsp; 3.00 &rarr;&nbsp; 3.25 &rarr;与SNAI 2.45&nbsp; 3.20&nbsp; 2.85三项数值分歧颇大，对主队颇有置疑。足彩复选0/3 。</p>\r\n<p>　<strong>　13 巴勒莫vs 桑普多利亚&nbsp;&nbsp; 3/1</strong></p>\r\n<p>　　两队已从欧罗巴出局，但本季受欧战影响颇大。巴勒莫排名第六，主场5胜2平2负亦无往历凶悍；桑普多利亚排名第八，客场2胜4平2负战绩平庸。往绩巴勒莫主场3胜3平3负与对手平分秋色，但近四次2平2负不胜。欧赔99家平均 1.90 &rarr;&nbsp; 3.26 &rarr;&nbsp; 3.95 &uarr;折合亚盘主让半球0.90中水盘面热门度不高。威廉。希尔 1.91 &darr;&nbsp; 3.50 &uarr;&nbsp; 4.00 &rarr;与SNAI 1.90&nbsp; 3.30&nbsp; 4.00平赔谨慎之下，足彩务须3/1协防。</p>\r\n<p>　　<strong>14 国际米兰vs 那不勒斯&nbsp;&nbsp; 3/0</strong></p>\r\n<p>　　国际米兰离开意甲赛事已经超过一个月之久，期间获得世俱杯，则成了贝尼的杯具。新上位莱昂纳多曾在AC米兰短暂执教却同样战绩不佳而被炒鱿鱼。蓝黑军15 轮积23分排第七名(即使算上补赛两轮6分，亦仅能排在五名开外)，主场3胜3平1负的战绩绝无意甲大佬之态。那不勒积33分排第二名，只比榜首AC米兰少3分，俨然成了争冠新势力。客场5胜2平2负则已是客场龙。往绩国米主场三战全胜占据绝对优势。欧赔99家平均 1.78 &rarr;&nbsp; 3.33 &rarr;&nbsp; 4.47 &darr;折合亚盘主让半球0.78超低水似有未战先热之嫌。威廉。希尔 1.83 &rarr;&nbsp; 3.50 &uarr;&nbsp; 4.33 &darr;与SNAI 1.75&nbsp; 3.60&nbsp; 4.50平赔高企不易战平。足彩复选3/0 。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('145', '<p>位于白云区广州大道北与京溪路交汇处的<a target=\"_blank&quot;\" title=\"君华香柏广场\" href=\"http://xf.house.163.com/gz/00CX.html\">君华香柏广场</a>（<a target=\"_blank&quot;\" title=\"君华香柏广场 楼盘详情\" href=\"http://xf.house.163.com/gz/00CX.html\">资料</a>、<a target=\"_blank&quot;\" title=\"君华香柏广场 团购\" href=\"http://xf.house.163.com/gz/groupbuy/00CX.html\">团购</a>、<a target=\"_blank\" title=\"君华香柏广场 业主论坛\" href=\"http://bbs.gz.house.163.com/list/youyicheng.html\">论坛</a>、<a target=\"_blank\" title=\"君华香柏广场 二手房源\" href=\"http://esf.house.163.com/gz/secondSearch%21esf.action?saletype=s&amp;keywords=%E5%90%9B%E5%8D%8E%E9%A6%99%E6%9F%8F%E5%B9%BF%E5%9C%BA\">二手</a>）目前在售全新的C栋91-135平方米三房、四房&ldquo;珍爱大宅&rdquo;，均价19000元/平方米，带3500元/平方米装修。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('146', '<p class=\"f_center\" style=\"text-align: center\"><strong><img alt=\"《水浒》武松爱上潘金莲 导演:为荡妇形象翻案\" src=\"http://img3.cache.netease.com/ent/2011/1/4/201101040618212907b.jpg\" /><br />\r\n</strong>新版《水浒》武松造型。</p>\r\n<p><strong>大洋网-广州日报1月4日报道</strong>&nbsp;新年伊始，新《水浒》火速占据荧屏，但也惹来口水不断。其中，争议最大的就是武松与潘金莲扑朔迷离的&ldquo;叔嫂情愫&rdquo;，名著迷们纷纷诟病：&ldquo;名著改编要有度，武松怎能对潘金莲有情？&rdquo;</p>\r\n<p><strong>骚客多豪气弱？</strong></p>\r\n<p><strong>新生观众：好汉也时尚</strong></p>\r\n<p>继网友戏称新《<font color=\"#1e50a2\">红楼梦</font>》(旧版 新版)为&ldquo;红雷梦&rdquo;，<font color=\"#1e50a2\">《三国演义》</font>(新版 旧版)为&ldquo;穿越三国&rdquo;后，新《水浒》也难逃被调侃的命运，一经开播即被冠以&ldquo;水腐传&rdquo;。&ldquo;新《水浒》骚客多，好汉豪气弱，男男暧昧随处可见。&rdquo;其中，硬气十足的武松则被调侃&ldquo;与带花西门庆很是般配&rdquo;，可谓恶搞至极。</p>\r\n<p>&ldquo;雷早已远去，腐才是王道&rdquo;，热衷原著或看惯了老版《水浒》的70后网友，纷纷斥责新《水浒》无原味，缺豪气。但&ldquo;80后&rdquo;、&ldquo;90后&rdquo;的新生观众却热力追捧：&ldquo;&lsquo;围脖控&rsquo;、&lsquo;红花控&rsquo;让好汉也时尚，视听效果慑人，人物更丰满和人性。&rdquo;&ldquo;像70后吃惯了大白菜就不喜欢生菜一样，我们一开始吃的，就爱生菜那味儿。&rdquo;</p>\r\n<p>面对网友的质疑，<font color=\"#1e50a2\">陈龙</font>则辩称：&ldquo;老版武松凛凛身躯、表情冷酷，我的体态相对瘦削，在装扮上也刻意带点时尚的味道。&rdquo;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('147', '<p>位于从化神岗镇广从公路莲塘桥的<a target=\"_blank&quot;\" title=\"东方夏湾拿\" href=\"http://xf.house.163.com/gz/00Da.html\">东方夏湾拿</a>（<a target=\"_blank&quot;\" title=\"东方夏湾拿 楼盘详情\" href=\"http://xf.house.163.com/gz/00Da.html\">资料</a>、<a target=\"_blank&quot;\" title=\"东方夏湾拿 团购\" href=\"http://xf.house.163.com/gz/groupbuy/00Da.html\">团购</a>、<a target=\"_blank\" title=\"东方夏湾拿 业主论坛\" href=\"http://bbs.gz.house.163.com/list/xianawan.html\">论坛</a>、<a target=\"_blank\" title=\"东方夏湾拿 二手房源\" href=\"http://esf.house.163.com/gz/secondSearch%21esf.action?saletype=s&amp;keywords=%E4%B8%9C%E6%96%B9%E5%A4%8F%E6%B9%BE%E6%8B%BF\">二手</a>）推出最新一期联排别墅&ldquo;巴亚莫&rdquo;组团，带首层老人房、中空客厅、独立天井设计，面积271-277平方米，五房三厅六卫设计，售价10000元/平米起。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('148', '<p class=\"f_center\" style=\"text-align: center\"><img border=\"1\" alt=\"&ldquo;展昭&rdquo;何家劲与&ldquo;婉君&rdquo;金铭恋爱\" src=\"http://img1.cache.netease.com/catchpic/7/77/77F43F1B5D5BF92EFEA1EC55E7E4C51D.jpg\" /><br />\r\n&ldquo;展昭&rdquo;何家劲在新剧中将有大量感情戏。</p>\r\n<p><strong>新快报1月4日报道</strong> 《包青天》原班人马拍摄的《包青天之七侠五义》今天（4日）将于安徽卫视上星首播，据悉这是《包青天》系列剧首度涉及包公的家庭，而夺人眼球的是&ldquo;展昭&rdquo;何家劲将和比他小20岁的&ldquo;婉君&rdquo;<font color=\"#1e50a2\">金铭</font>谈情说爱。</p>\r\n<p><strong>金超群再现&ldquo;包公前传&rdquo;</strong></p>\r\n<p>台湾老戏骨金超群一生执着于拍摄《包青天》，只拍一戏只演一角。他说，当年他主演的连续剧《包青天》，一播200多集红透半边天，10多年没在台湾演艺圈露脸，但一直在大陆专心拍摄《包青天》系列剧，为此建了影城，推掉其他戏约，只专注能将该剧拍到1000集。</p>\r\n<p>而此番的《包青天之七侠五义》改编自清代经典武侠章回小说《七侠五义》，分为&ldquo;包公前传&rdquo;、&ldquo;北侠欧阳春&rdquo;、&ldquo;小侠艾虎&rdquo;、&ldquo;铡包勉&rdquo;和&ldquo;乌盆记&rdquo;几个单元。首次把&ldquo;七侠五义&rdquo;这十二个人集中在同一部剧中。从仁宗皇帝在位期间包拯升任开封府府尹执掌京畿被百姓<font color=\"#1e50a2\">爱戴</font>敬仰之余尊称为&ldquo;包青天&rdquo;开始讲起，又分别讲述了北侠欧阳春、小侠艾虎、丁氏三侠、黑妖狐智化与陷空岛五鼠在展昭号召之下纷纷前来效力包拯的故事。</p>\r\n<p>另外，在这部《包青天之七侠五义》中，还融入了更多的推理侦探的元素，更注重断案的合理性，更注重案子发生的时间、人证、物证等，让包青天的故事更悬疑、更紧张。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('149', '<p class=\"f_center\" style=\"text-align: center\"><strong><img alt=\"跨年晚会25城市收视率出炉 央视不敌湖南卫视\" src=\"http://img4.cache.netease.com/ent/2011/1/4/2011010401220705033.jpg\" /><br />\r\n</strong>央视跨年晚会现场。</p>\r\n<p><strong>法制晚报1月4日报道</strong> 索福瑞快速监测数据显示，各卫视跨年夜25城市的收视率排名出炉，湖南卫视暂夺全国同时段第一，而首办跨年晚会的老大哥央视目前仅排第三。</p>\r\n<p>据了解，16家电视台同时来举办&ldquo;跨年晚会&rdquo;实在是&ldquo;烧钱&rdquo;，成本可不小，这场视听大餐总计在这24小时内烧钱烧掉近2亿元。</p>\r\n<p><strong>战绩一览 &ldquo;芒果&rdquo;夺冠 央视未能称雄</strong></p>\r\n<p>索福瑞25城市快速监测数据显示，在举办跨年晚会的16家电视台中，湖南卫视跨年演唱会以3.58%的收视率夺得了全国同时段的第一名，紧随其后的是江苏卫视，而首次举办跨年晚会的央视并未拔得头筹，播出跨年晚会的央视综合频道仅排第三。</p>\r\n<p>2005年，湖南卫视首次提出跨年演唱会的概念，随后，江苏、浙江、安徽等其他卫视也纷纷加入，到了2011年，参加跨年晚会的电视台更是猛增至12家。</p>\r\n<p>不过，从31日当晚的现场看，在节目编排、表现形式、观众参与度、环节衔接等方面最成熟的依然是湖南卫视，而索福瑞25城市快速监测数据中，湖南卫视也顶住了压力，位居第一，捍卫了其&ldquo;跨年晚会&rdquo;创始鼻祖的地位。</p>\r\n<p><strong>央视败北原因 </strong><strong>播出时间晚 缺少固定观众</strong></p>\r\n<p>此次是央视首次加入跨年晚会大战，但收视率却排在了湖南和江苏之后。</p>\r\n<p>究其原因，业内人士大多认为，这并不是央视实力减弱，从明星资源上看，没有任何一家卫视能比拼过央视，但因为央视跨年晚会的播出时间较晚，21时35分才开始播出，比在19时35分播出的卫视跨年演唱会晚了两个小时，在时间上并不占据优势。</p>\r\n<p>此外，部分年轻观众早已经形成了在固定频道观看了跨年演唱会的习惯，央视的观众自然被分走了不少。</p>\r\n<p>可以说，央视首次参战并没有过多影响到其他几家卫视跨年晚会收视率的排序，湖南、江苏、安徽、上海、浙江五大卫视的收视率仍旧靠前。江苏卫视以0.33%的差距位于第二，安徽卫视排名第四，随后是上海东方卫视和浙江卫视。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('150', '<div align=\"center\"><center><img height=\"320\" alt=\"转让二手房 土地增值税猛涨十倍\" src=\"http://img1.cache.netease.com/catchpic/8/87/8741D8FB4E83027189EB962E84CFA4A6.jpg\" width=\"446\" /></center></div>\r\n<p style=\"text-align: center\">　　<font face=\"楷体_GB2312\">征收对象为转让二手房的单位 暂不影响个人购房者</font></p>\r\n<p>本报讯 （记者肖颖摄影报道）近日，顺德区低调出台了一份《关于调整土地增值税预征率和核定征收率的公告（2010年第2号）》（以下简称《公告》），给楼市投出了一份&ldquo;重磅炸弹&rdquo;，本报在第一时间独家获知了该政策的内容。新政策规定，从2011年元旦起，顺德的纳税人转让普通二手住宅的，其土地增值税的核定征收率从原来的0.5%提高到5%，涨了整整十倍，二手房的置业门槛将再次被抬高。</p>\r\n<p><strong>新政暂不影响个人购房者</strong></p>\r\n<p>今年8月，顺德区调整了土地增值税预征率和核定预征率，对于旧房转让（包括二手房转让）实行核定征收土地增值税，非普通住宅、商铺等商业房产土地增值税的核定征收率为1%；其他房地产的土地增值税核定征收率为0.5%。</p>\r\n<p>时隔4个月后，原土地增值税税预征率和核定预征率被废除，新政策规定：转让普通住宅、库房、写字楼等办公房产、厂房等工业房产的，土地增值税的核定征收率为5%；转让其他房地产的，核定征收率为5.5%。</p>\r\n<p>顺德区财税局表示，现阶段该政策对大多数普通购房者的影响并不大。按照2008年财政部和国税局的相关文件规定，对个人销售住房暂免征收土地增值税。所以，《办法》中规定的征税对象，是转让二手房地产的单位。判断二手房交易中是否要收土地增值税的最简单的办法，就是查看房产证上，到底是个人的名字还是单位的名字。</p>\r\n<p>但是，一旦国家出台相关文件中止土地增值税优惠政策，普通个人购房者也将按《公告》中的规定征收税费。</p>\r\n<p><strong>市民多不知何为土地增值税</strong></p>\r\n<p>近日，记者来到顺德大良东乐路和碧溪路等多家二手房中介走访时，发现大多数购房者并不知道土地增值税为何物。</p>\r\n<p>大良东乐路一家中介公司的工作人员江翠玉表示，今年以来，不少购房优惠被取消，就连首次置业者也不例外。不管是业主来中介放盘，还是购房者来中介看房，她总是事先将土地增值税的政策解释给他们听。&ldquo;万一土地增值税优惠取消，也好让他们有个思想准备。&rdquo;</p>\r\n<p>一名中介工作人员告诉记者，二手房土地增值税优惠到底何时取消至今还不明朗，导致卖家的观望情绪加重。不少业主到中介放盘，其实并不是真心实意想卖楼，而是为了&ldquo;沽价&rdquo;，考验市场的承受能力。如果需求者众多，卖家就会逐渐提高价格。万一卖家发现市场形势不对头，也可以马上将房子甩手。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('151', '<p><font face=\"楷体_GB2312\">降价心理预期 &ldquo;签约&rdquo;和&ldquo;办贷款&rdquo;脱节</font></p>\r\n<p><font face=\"楷体_GB2312\">　　&ldquo;阴阳合同&rdquo;是二手房退房主因</font></p>\r\n<p>日前，北京房地产交易管理网和北京市房地产中介行业协会网站公布了11月份二手房市场的交易数据。通过对比了解，笔者发现了一个有趣的现象，11月份二手房成交套数达到了16805套，创下了新政之后二手房成交量的新高，而退房套数却也高达2790套，退房比例达到16.6％。这不禁令人心生疑惑，火爆的成交状况反映了买房人购房热情的高涨，却为何又会出现大量的退房呢？《广厦时代》带着疑问采访了多家二手房门店和二手房市场研究人士。</p>\r\n<p><strong>　●大型二手房店：成交量高 退房数量少</strong></p>\r\n<p><strong>　　降价心理预期是主动退房原因</strong></p>\r\n<p>笔者走访了几家大型二手房中介公司的多家门店，得到的结论均为&ldquo;11月份成交量很高，主动退房的数量并不多&rdquo;的答复。其中，赛洛城某二手房店的一位业务员称，11月份该区域的二手房卖的非常好，因为这个区域相对来说交通比较方便，总价不高，社区也很新，买房人基本上是以房换房，属改善型需求。</p>\r\n<p>谈到退房率，这位业务员说：&ldquo;11月份我们店二手房的退房率并不高，来退房的客户基本上是受政策影响。因为最近政策出台比较频繁，所以一些客户认为可能会影响到二手房的销售状况，导致近期这个片区的二手房存在价格下降的预期，所以才买完又回来退，想等待价格有所下降再来选择房源，但是这种情况很少，基本对我们店的销售情况影响不大。&rdquo;而在<a title=\"富力城\" href=\"http://xf.house.163.com/bj/0EZM.html\" target=\"_blank&quot;\"><font color=\"#1e50a2\">富力城</font></a>（<a title=\"富力城 楼盘详情\" href=\"http://xf.house.163.com/bj/0EZM.html\" target=\"_blank&quot;\"><font color=\"#1e50a2\">资料</font></a>、<a title=\"富力城 业主论坛\" href=\"http://bbs.gz.house.163.com/list/house_0ezm.html\" target=\"_blank\"><font color=\"#1e50a2\">论坛</font></a>)和官园的二手房店，笔者也得到了同样的答复。那么，高成交量背后的高退房率，又作何解释呢？</p>\r\n<p><strong>●小型二手房公司：成交量平稳 退房数量不多</strong></p>\r\n<p><strong>　　&ldquo;签约&rdquo;和&ldquo;办贷款&rdquo;脱节是退房重要原因</strong></p>\r\n<p>笔者就二手房高成交量与高退房量的矛盾现象，采访了一位小型私营二手房经纪公司负责人。这位负责人表示，11月份二手房成交量火爆的主要原因可能有以下几点：首先是通货膨胀的影响，导致很多消费者选择了既有居住功能又有保值增值功能的房产进行投资，充分利用资金；其次，目前城区内新房数量不多，价格相对低的新房都在偏远郊区，价格和品质选择范围小，对于不少刚需和改善型客户来说，二手房的选择要灵活得多；此外，一些购房人对未来房价下降的信心不足，认为目前属于&ldquo;抄底&rdquo;阶段。</p>\r\n<p>从目前公司的二手房签约情况来看，成交量相对平稳，而退房量并不多。这位负责人在分析11月北京市二手房退房率数据时说：&ldquo;出现大量退房的主要原因与人们的购买热情关系不大，可能是因为一些中介公司办理购房合同签约和协助客户办理贷款存在脱节的缘故。由于政策的影响，很多客户实际上并不具备购房的能力和资质，其中，首付比例的提高、社保证明的提供是最重要的两个因素，但由于很多买房人并不了解政策内容，业务员为了促成签单也没有说明，但当购房人办理贷款的时候，却不具备相关能力和资质，无奈之下只能选择退房。也就是说，很多中介公司&quot;签约&quot;和&quot;办贷款&quot;是两条线，如果客户自己不了解政策，可能就会存在白忙活一场的情况。&rdquo;</p>\r\n<p><strong>　●高端客户中介公司：成交量和退房情况基本稳定</strong></p>\r\n<p><strong>　　&ldquo;阴阳合同&rdquo;是退房主要原因</strong></p>\r\n<p>笔者就相同问题采访了麦田房产市场研究部经理陈冠宇。陈冠宇表示，由于麦田房产针对的客群是中高端客户，房产交易均价基本在400万/套以上，所以政策对成交量和退房量所造成的影响不大。&ldquo;中高端客户很少会选择公积金贷款等方式买房，即使贷款也不太在意月供的数额，一次性付款的客户比例也是很高的。所以，对于较大标的的客户来说，政策所造成的影响要远远小于中小标的客户。&rdquo;</p>\r\n<p>当笔者问及关于11月份高退房量的看法时，陈冠宇说：&ldquo;造成大量退房的最主要原因恐怕是二手房公司人为操作的因素，也就是所谓&quot;阴阳合同&quot;。我们公司有特定的部门专门做二手房网签，这个部门的权利没有下放到业务线，因此交易比较透明。但有一些大型的二手房中介公司，由于业务量较大，很多业务员就会自己做网签，这就可能造成很多问题。例如，卖房人在某二手房中介公司曾咨询过卖价，或者该房源有了较强购买意向的买房人，该中介公司可能会为了防止好房源被抢走，先行进行网签，抢占紧俏房源。而当该房源找到合适的购买人时，却发现无法进行网签操作，因此不得不先行办理退房手续，再进行新的交易，这实际上是中介公司恶意抢占的结果。在目前二手房交易热情高涨的时候，好房源不愁卖，很多业务员这样做是为了保证销售业绩。此外，政策对此也有一定的影响，但不是主要因素。&rdquo;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('152', '<p>中介经纪小王最近遇到一位客户，看中了一套2009年的次新房，但由于是二次购房，3%的契税、5%的营业税和1%的个人所得税，让购房人觉得不堪重负，就想通过&ldquo;假赠与&rdquo;的方式，办理过户手续。</p>\r\n<p>房地产二次调控后，购房成本大大加大，一些购房人开始在税费上大动脑筋。据悉，近期二手房过户方式中，赠与及继承过户的比例明显上升。那么，以赠与、继承的方式过户真的比买卖交易省钱吗？房贷机构伟嘉安捷有关置业专家表示未必。</p>\r\n<p>&ldquo;伟嘉安捷&rdquo;专家在算完账之后发现，由于个人所得税过高，目前还没有人真正通过&ldquo;假赠与&rdquo;办理过户。&ldquo;只有赠与人是三代以内直系亲属、对赠与人承担直接抚养或者赡养义务的抚养人，或者赡养人或房屋产权所有人死亡依法取得房屋产权的法定继承人、遗嘱继承人或者受遗赠人受赠房产时，才不需要缴纳20%的个人所得税。&rdquo;</p>\r\n<p><strong>给您算账</strong></p>\r\n<p>以一套总价为200万元首次购房的普通住宅为例(注：此案例中住宅为普通住宅，应按差额征收营业税，假定业主不能提供原始购房发票，故按全额计算)，其买卖、赠与及继承过户费用列表计算对比如下：</p>\r\n<p><strong>风险提示</strong></p>\r\n<p><strong>买卖交易</strong></p>\r\n<p>在房产过户中，买卖是操作较为便捷和安全的方式。不过，如果购房人想通过黑白合同来避税的话，一是对业主风险较大，因为一旦购房人抵赖，要求以做低的过户合同价交付房款时，将产生产权纠纷；二是目前买入价较低的话，日后出售时卖出价与买入价的差额会增大，再出售时还是要多缴纳税费。</p>\r\n<p><strong>赠与方式</strong></p>\r\n<p>不少购房人避税的目标主要是营业税和个税，所以想通过&ldquo;假赠与真买卖&rdquo;方式过户。伟嘉安捷指出，首先如果不是可以减征个税的三种情况，受赠人需要缴纳的个税税率非常高，购房人反而得不偿失；其次对于赠与的房产，银行一般会认定受赠方免费接受赠与的行为，没有实际交易产生，因此不能办理按揭贷款；最后对业主来说，买方可能会在公证后以无偿赠与为由拒付房款。</p>\r\n<p><strong>继承方式</strong></p>\r\n<p>伟嘉安捷表示，在实际操作中，因为继承是遗产人死后才可以进行产权过户，所以这种过户方式的人比较少。同时，继承房产需要满足以下三个条件：第一，通过法定继承和遗嘱继承，前者需为法律规定的法律继承人，后者必须是遗产人死前曾做过公证的遗嘱才有法律效力；第二，遗产应当是被继承人生前属于个人所有的财产，如个别房产是共有产权的，则需权属分割后再进行继承；第三，因遗产是所有继承人的共同财产，如所有继承人同意房产由一个人继承，需要其他继承人签订放弃继承协议才有效。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('153', '<p>11月10日，中原集团发布二手住宅市场月报称，10月份，国内5大城市二手住宅市场再度陷入观望，成交量在持续4个月回升之后开始回落。总体来看，价格虽未出现下跌，但涨幅明显收窄。</p>\r\n<p>报告称，受国家调控政策升级加码、特别是限购政策的影响，5大城市二手住宅成交量未能持续前4个月回升态势，10月起大幅回落。各地城市成交价格依旧缓慢上涨，但是涨幅趋缓。</p>\r\n<p>据中原地产10月二手住宅市场成交量调查数据显示，5大城市成交量为389万平方米，环比下跌28%，各城市环比跌幅在1~5成。其中，深圳和上海两城市由于&ldquo;限购令&rdquo;出台时间最早，而且深圳限购政策特别严厉，故成交量跌幅最大，分别为56%和28%；而广州和天津由于投资需求较少，加之两城市&ldquo;限购令&rdquo;出台较晚，且天津&ldquo;限购令&rdquo;仅限于局部区域，故成交量跌幅较小，分别为10%和7%；北京早在今年4月底就出台&ldquo;限购令&rdquo;，市场依然大受影响，成交量环比回落27%。</p>\r\n<p>中原地产指出，尽管总体成交量有所回落，但仍高于今年5月最低点，相当于7、8两月平均水平。不过，伴随着二手市场成交量大幅回落，业主对后市信心出现逆转，各地下调房源报价的比重开始增加。</p>\r\n<p>而据中原领先指数系统数据显示，10月份五大城市二手住宅成交价格依旧上涨，除广州外，其他四城市环比涨幅均不超过2.0%，其中深圳和北京的涨幅甚至低于1.0%。中原地产认为，虽然&ldquo;二次调控&rdquo;力度较前一次有所升级，但同4月底出台的新&ldquo;国十条&rdquo;相比影响力度明显减弱。根据中原统计，五大城市10月二手住宅成交量是5月低谷时的1.5~3倍；而且10月成交量环比跌幅均小于5月的环比跌幅。</p>\r\n<p>&nbsp;</p>\r\n<div class=\"gg200x300\">另外，据中原监测数据显示，10月除北京二手住宅租金略有回落外，其他四城市租金均保持平稳小幅上涨，环比涨幅在0.3%~0.8%。租金回报率则继续走低，五大城市租金回报率均低于3.2%，远低于当前的商业贷款基准利率，甚至低于5年期以下的公积金贷款基准利率（3.5%）。</div>\r\n<p>中原集团研究中心经理瞿安新认为，&ldquo;二次调控&rdquo;政策影响力度之所以减弱，一是由于目前市场上以刚性需求为主，受限购政策的影响较小；二是部分城市限购令颁布较晚，效应可能滞后；三是前次调控对市场的影响低于预期，市场对政策产生了一定的&ldquo;抗药性&rdquo;。</p>\r\n<p>瞿安新还表示，在政策持续高压的背景下，预计未来两个月，二手住宅成交量仍将低位徘徊，部分城市恐继续回落。而随着成交量的持续低迷，成交价格或将出现下跌。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('154', '<p>&ldquo;福州原均价3000元，现均价10000元，正好泡沫70%！&rdquo;在社科院公布绿皮书之后，福州本地不少网友通过回帖的方式，对福州的&ldquo;房价泡沫&rdquo;进行激烈的评论，观点基本上&ldquo;一边倒&rdquo;地谴责目前房价虚高。而另一方面，记者在走访业界的时候却发现，不少业界人士表示虽然网上波涛汹涌，网下的交易双方却没有太大反应。</p>\r\n<p><strong>　现状：社科院称福州房价虚高？</strong></p>\r\n<p><strong>　　业界：承认房价偏高，但不知道&ldquo;泡沫&rdquo;有多少</strong></p>\r\n<p>&ldquo;刨去最便宜和最贵的楼盘，福州商品房的真实基价其实也就是每平方米4000元左右，里面还包括了房地产商的利润。&rdquo;家住福州的王先生告诉记者，不少人在网上激烈回应，其实是有原因的。毕竟福州人的生活一直都比较安逸，但近几年房价突然涨得太快，超出很多人的接受范围。</p>\r\n<p>&ldquo;现在的房价确实太贵了。&rdquo;福州家天下房产副总经理郑心科表示。他一直认为福州的房价太高，但由于房价一直在上涨，作为中介，只能帮客户尽量筛选在目前情况下性价比相对较高的房源。</p>\r\n<p>&ldquo;泡沫是一定存在的。&rdquo;21世纪不动产福州区域总经理助理肖少锋告诉记者，21世纪不动产的经纪人，第一年平均月收入在2000元左右。也就是说，要5个月不吃不喝，才能买得起大约一平方米的房子。肖少锋认为，目前福州一般的工薪阶层，月收入都在2000-2500元之间，每平方米动辄上万元的房价，对他们来说确实太高了。</p>\r\n<p>但福州的&ldquo;真实基价&rdquo;应该是多少，&ldquo;泡沫&rdquo;又有多少呢？肖少锋表示：&ldquo;研究&lsquo;泡沫&rsquo;不应该是中介的工作，也不是中介机构所能论断的。&rdquo;他认为，中介能做的，只是在眼下的市场环境中，帮助买卖双方找到卖家和买家，尽量让性价比高的房子卖出去。</p>\r\n<p><strong>　反应：交易双方依然&ldquo;淡定&rdquo;</strong></p>\r\n<p><strong>　　中介：网上看似激烈，但买卖房客户&ldquo;相对理性&rdquo;</strong></p>\r\n<p>&ldquo;客户相对理性，暂时没有受到这种消息影响。&rdquo;朝阳房产江南水都店一位姓王的店长告诉记者，近年来类似的消息比较多，福州不仅是&ldquo;泡沫第一&rdquo;，还有过几次&ldquo;房价前十&rdquo;的公告，&ldquo;上涨过快&rdquo;的消息更是多次出现。</p>\r\n<p>这位店长还表示，调控的声音、具体的政策，也颁布过几回，能够进入交易的买卖双方，现在基本上不会受类似消息的影响。特别是沿江稀缺地段或者市中心繁华地段，不少房东仍然在加价。</p>\r\n<p>肖少锋也表示，中介行业近年已经遭遇过多次&ldquo;数据游戏&rdquo;，曾经有一年，数据还显示&ldquo;85%的中国人买不起房&rdquo;。他表示，福州确实有不少收入较高的人员，包括他自己在内，目前也是买不起房。但买不起的原因，是因为已经沦为&ldquo;房奴&rdquo;，腾不出手再买了。</p>\r\n<p><strong>　分析：福州房价为什么虚高？</strong></p>\r\n<p><strong>　　调查：比较厦门杭州，房价上升或因&ldquo;城市化&rdquo; </strong></p>\r\n<p>&ldquo;国外的统计方法，说明不了中国的问题，因为中国正在一个城市化的进程当中。&rdquo;面对福州房价&ldquo;虚高&rdquo;的说法，福州地产专家刘福泉表示了不同意见。</p>\r\n<p>&ldquo;在国外，城市化进程已经基本完成或相对缓慢，那么一旦房价虚高，很可能这个房价体系就会面临崩溃。而在中国，由于城市化还远没有完成，上涨过快的房价，仍然可以在这个进程中被市场接受。&rdquo;刘福泉举了个例子：如果说福州人平均月收入是3000元，那么很多人自然是买不起每平方米13000元的房子的。但在福州，有很多来自八县以及其他地市的人在买房，他们能够买得起福州的房子，并融入福州，工作生活，这就让每平方米13000元的房子有了市场。</p>\r\n<p>&ldquo;大规模的基础设施建设，往往伴随着房价上涨。&rdquo;福州麦田房产总经理黄少华告诉记者，从他从业的经历来看，福州的房价在近几年确实涨得比较快，但福州的城市建设也同样是在这几年大大上了几个台阶。</p>\r\n<p>而比起&ldquo;泡沫&rdquo;较大的杭州，以及&ldquo;泡沫&rdquo;较小的厦门，记者发现，杭州同样也处于密集的基础设施建设阶段，地铁建设近几年也成为杭州楼市的一大信号，而杭州周围的富裕乡镇和小城市，同样让杭州的高档楼盘不愁卖家。而在同省的厦门，由于城市化已经基本成熟，则比较少有大规模的基础设施建设。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('156', '<p><strong>雨伞立架</strong></p>\r\n<p class=\"f_center\"><img width=\"425\" src=\"http://img1.cache.netease.com/catchpic/F/F0/F0635F8DE094BD062BD4C57E7054C48F.jpg\" alt=\"低碳环保旧物巧改收纳箱\" /></p>\r\n<p>拆改方法：雨伞也有固定的收纳器皿了，它不是现成品，而是由盆栽立架和陶瓷托盘两样东西组成。分别用金属专用涂料和瓷器专用涂料统一它们的颜色，直 接立在门口，你就再也不用担心滴水趟得到处都是。推荐：一般家里的雨伞都会撑开晾干，很占用空间，这个伞架非常巧妙地利用了花盆和盆栽立架，建议放在玄关 处，也有简洁的装饰作用。</p>\r\n<p><strong>布袋挂帘</strong></p>\r\n<p class=\"f_center\"><img width=\"421\" src=\"http://img1.cache.netease.com/catchpic/4/40/4049EBD5218E720760EF07A4FB2C6597.jpg\" alt=\"低碳环保旧物巧改收纳箱\" /></p>\r\n<p>拆改方法：现成的较长的布帘剪成合适的长度，挂在书架前挡灰尘。别忘记在帘子正面缝些彩色布口袋，充满乐趣。推荐：小小的布帘，看似普通，却解决了家里的许多难题。敞开的鬼子都可以迅速被封闭起来，似乎着你微笑。</p>\r\n<p><strong>木制隔断</strong></p>\r\n<p class=\"f_center\"><img width=\"520\" src=\"http://img1.cache.netease.com/catchpic/2/22/22F4424F6199B861BD4029B633DA2391.jpg\" alt=\"低碳环保旧物巧改收纳箱\" /></p>\r\n<p>拆改方法：壁橱或储藏室等带有搁架的地方都用到这些架子托架。你可以选择旧家具上的附件，并固定到架子上。推荐：这种废料做的小隔断做了二次处理，物品摆放会更有序。</p>\r\n<p><strong>首饰挂钩</strong></p>\r\n<p class=\"f_center\"><img width=\"368\" src=\"http://img1.cache.netease.com/catchpic/9/94/9421127BD9021E105AEA7B4345378A95.jpg\" alt=\"低碳环保旧物巧改收纳箱\" /></p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>拆改方法：将窗帘的系带挂钩固定到梳妆台侧面或衣帽间的墙上，首饰、领带的收纳难题迎刃而解。推荐：手制挂钩可固定在梳妆台或床头柜上，换衣服时可搭配喜欢的首饰。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('157', '<p class=\"f_center\"><img width=\"550\" height=\"453\" border=\"1\" src=\"http://img1.cache.netease.com/catchpic/A/AA/AA9ABBF6B5A01B99A80696F6D4C88E9B.jpg\" alt=\"　　Elad Kashi 所设计的盘子餐桌，多了份自由、洒脱，吃饭时无需额外的盘子来承装食物，餐桌上凸凹有致的形状即可用来承装美味，吃完时将桌子擦拭干净即可，对于懒人来说很是实用。\" /></p>\r\n<p>Elad Kashi所设计的盘子餐桌，多了份自由、洒脱，吃饭时无需额外的盘子来承装食物，餐桌上凸凹有致的形状即可用来承装美味，吃完时将桌子擦拭干净即可，对于懒人来说很是实用。</p>\r\n<p class=\"f_center\"><img width=\"550\" height=\"382\" border=\"1\" src=\"http://img1.cache.netease.com/catchpic/4/4A/4A605FE528D781EFF2B701877C617923.jpg\" alt=\"　　Elad Kashi 所设计的盘子餐桌，多了份自由、洒脱，吃饭时无需额外的盘子来承装食物，餐桌上凸凹有致的形状即可用来承装美味，吃完时将桌子擦拭干净即可，对于懒人来说很是实用。\" /></p>\r\n<p class=\"f_center\"><img width=\"550\" height=\"381\" border=\"1\" src=\"http://img1.cache.netease.com/catchpic/7/70/704D32B0959E03014F4397150D1F123A.jpg\" alt=\"　　Elad Kashi 所设计的盘子餐桌，多了份自由、洒脱，吃饭时无需额外的盘子来承装食物，餐桌上凸凹有致的形状即可用来承装美味，吃完时将桌子擦拭干净即可，对于懒人来说很是实用。\" /></p>\r\n<p class=\"f_center\"><img width=\"550\" height=\"384\" border=\"1\" src=\"http://img1.cache.netease.com/catchpic/6/63/6369005E95B3548ACFB3C9053726C07C.jpg\" alt=\"　　Elad Kashi 所设计的盘子餐桌，多了份自由、洒脱，吃饭时无需额外的盘子来承装食物，餐桌上凸凹有致的形状即可用来承装美味，吃完时将桌子擦拭干净即可，对于懒人来说很是实用。\" /></p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('158', '<p class=\"summary\">正值元旦佳节，但实木地板厂老板李伟俊却颇为烦恼，不断上涨的生产成本，让他左右为难。昨日，记者从部分实木地板生产企业处了解到，由于生产成本不断上涨，厂家纷纷上调地板出厂价，这直接导致订单下滑。</p>\r\n<p>&ldquo;调价，订单可能持续下滑;不调，利润受影响。&rdquo;正值元旦佳节，但实木地板厂老板李伟俊却颇为烦恼，不断上涨的生产成本，让他左右 为难。昨日，记者从部分实木地板生产企业处了解到，由于生产成本不断上涨，厂家纷纷上调地板出厂价，这直接导致订单下滑。我市有实木地板厂老板甚至一个月 净亏2万元。</p>\r\n<p><strong>实木地板纷纷上调出厂价</strong></p>\r\n<p>目前在我市销售的大部分实木地板，产地主要集中在浙江、江苏一带。&ldquo;我的厂就在浙江南浔，当地上规模的企业大概有300~400家。&rdquo;从事实木地板生产多年的李伟俊说，南浔已成为中国重要的地板之乡，东南亚、非洲、北美各地的木材，纷纷进入南浔，然后被逐层加工变成地板。</p>\r\n<p>李伟俊介绍，平均一平米实木地板上调幅度在2%左右，零售价每平方米至少上调了5元左右。&ldquo;以前100多元一平方米的实木地板，现在几乎找不到了。&rdquo;李伟俊表示。</p>\r\n<p>&ldquo;由于生产成本不断上涨，这次调价企业也处于无奈，因此幅度不大。&rdquo;在南浔有生产厂的重庆老板姚厚权表示，木材主要来自东南亚、非洲，但最近几年，这些地区的政府相继限制木材出口。木材出口量不断下降，导致价格不断提高。</p>\r\n<p>&ldquo;像龙凤檀去年每平方米涨了15元，现在价格在330元/平方米左右。&rdquo;姚厚权称，一吨实木原料，仅运费目前已涨至290元左右。加上去年以来人工费和厂家销售门面租金上涨，因此，企业不得不上调产品价格。</p>\r\n<p><strong>订单下滑企业月亏2万元</strong></p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>&ldquo;现在实木地板生意越来越难做了。&rdquo;姚厚权透露，去年以来，仅人工费就涨至3000元/人，成本高企直接压缩了企业的利润。&ldquo;以前利润至少可达30%~40%，而去年以来，利润顶多只有20%左右。&rdquo;姚厚权说。</p>\r\n<p>&ldquo;利润被挤压，企业只能上调产品出厂价，但价格一调，却导致订单量不断减少。&rdquo;浙江南浔某厂家负责人刘文涛一直叹气。他说，去年上半年，他就两次上调了价格，自去年10月份以来，其订单量逐月递减。</p>\r\n<p>&ldquo;价格高了，许多客户就转向复合地板之类的产品。&rdquo;刘文涛介绍，他专门作过统计，从去年10月份至今，实木地板订单量就缩减了近六成。&ldquo;订单一少，几乎每个月企业都要亏2万元左右。&rdquo;刘文涛无奈地说。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('159', '<p><strong>组合式</strong></p>\r\n<p>组合式电视柜让电视的摆放方式更加多样，满足了在家中随时随地看电视的需求。注意家具和电视之间的匹配及安装方式。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img height=\"279\" alt=\"无论你每天面对电视的时间长短，一台电视机总还是家里的必备。平板电视的普及使得电视柜的样子也发生了很大变化，电视机与家具的融合度更高，因此在选择的时候需要考虑的细节也更多。这里推荐12款电视柜，诠释电视柜在实用的功能之外，兼具收纳多功能。\" width=\"500\" border=\"1\" src=\"http://img1.cache.netease.com/catchpic/C/C3/C3227939D9D06BAE62A3EAA1D91EC0D5.jpg\" /></p>\r\n<p><strong>客厅柜多合一方便好整理</strong></p>\r\n<p>将电视直接安装在客厅组合柜附带的板子上，整体效果非常好。电视、装饰物、书、摆件全部能融合在一起，还可根据实际摆放物品的需求自由安排各种搁板、柜门和抽屉的位置。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img height=\"324\" alt=\"无论你每天面对电视的时间长短，一台电视机总还是家里的必备。平板电视的普及使得电视柜的样子也发生了很大变化，电视机与家具的融合度更高，因此在选择的时候需要考虑的细节也更多。这里推荐12款电视柜，诠释电视柜在实用的功能之外，兼具收纳多功能。\" width=\"388\" border=\"1\" src=\"http://img1.cache.netease.com/catchpic/C/CC/CCA8435B2EDADE4FE99C9E6A187C86C9.jpg\" /></p>\r\n<p><strong>可旋转台面看电视更舒适</strong></p>\r\n<p>摆放客厅组合柜的墙面恰好有窗子，白天看电视，光照会影响画面效果，这种可旋转台面能轻松解决这一问题。大家一起看电视的时候，能让每个人都拥有舒适的观看角度。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img height=\"462\" alt=\"无论你每天面对电视的时间长短，一台电视机总还是家里的必备。平板电视的普及使得电视柜的样子也发生了很大变化，电视机与家具的融合度更高，因此在选择的时候需要考虑的细节也更多。这里推荐12款电视柜，诠释电视柜在实用的功能之外，兼具收纳多功能。\" width=\"360\" border=\"1\" src=\"http://img1.cache.netease.com/catchpic/0/02/026B1B614C28F4EC31B5CF76EEB842BC.jpg\" /></p>\r\n<p><strong>电视放进卧室收纳柜</strong></p>\r\n<p>虽然睡前看电视不是一个好的习惯，但在卧室摆放电视的家庭还是非常多。在卧室中，20寸的电视就很合适，打开柜门后，上部空间收纳各种碟片，下面可以用来放枕头和被子，非常实用。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img height=\"437\" alt=\"无论你每天面对电视的时间长短，一台电视机总还是家里的必备。平板电视的普及使得电视柜的样子也发生了很大变化，电视机与家具的融合度更高，因此在选择的时候需要考虑的细节也更多。这里推荐12款电视柜，诠释电视柜在实用的功能之外，兼具收纳多功能。\" width=\"387\" border=\"1\" src=\"http://img1.cache.netease.com/catchpic/1/1D/1DFDF2D4589A7AA4488DA5DF0950130C.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<div class=\"gg200x300\"><strong>展示搁架电视巧安装</strong></div>\r\n<p>分隔客厅和餐厅空间的隔断，预留了安装平板电视的位置，解决了就餐时观看电视的需求。电视的尺寸不宜太大，37寸之内比较合适。可以选择安装层板，放置dvd和一些视听配件。</p>\r\n<p>(本文来源：居无忧网 )</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('160', '<div id=\"endText\">\r\n<p>这栋位于巴西&nbsp;Ubatuba的海边建筑是由&nbsp;SPBR&nbsp;Arquitetos&nbsp;所设计，整个房子看起來彷彿是漂浮在树梢一般。Ubatuba&nbsp;是圣保罗重要的海岸城市之一，这栋建筑平面佔地&nbsp;55&nbsp;米&nbsp;X&nbsp;16&nbsp;米，沿著几乎50%&nbsp;坡度的山坡建造，房屋距离地面足足有28米。整个建筑完全符合当地的环保法规，完全沒有破坏到自然的植物生态。</p>\r\n<p>整座房屋可以说是完全颠倒过来建造，以天花板为水平，由上往下延伸一直到山坡面。建筑材料运用了水泥、钢筋以及木材，屋顶露台可以远眺大海以及山景，被树木以及自然生态包围，而且又符合环保，看來我又有一个梦想房屋！</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img title=\"点击查看大图\" height=\"800\" alt=\"&ldquo;漂浮&rdquo;在树梢的住家\" src=\"http://img1.cache.netease.com/catchpic/1/1D/1D77CD911C0377D4AA8BFBA16CDE2C46.jpg\" width=\"533\" border=\"0\" jquery1293983709703=\"2\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img title=\"点击查看大图\" height=\"375\" alt=\"&ldquo;漂浮&rdquo;在树梢的住家\" src=\"http://img1.cache.netease.com/catchpic/6/61/61BFA55DE9F371D41087F00AA34C7325.jpg\" width=\"560\" border=\"0\" jquery1293983709703=\"3\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img title=\"点击查看大图\" height=\"800\" alt=\"&ldquo;漂浮&rdquo;在树梢的住家\" src=\"http://img1.cache.netease.com/catchpic/4/40/40F16897D92B27B78B16CFEE051E7D7E.jpg\" width=\"533\" border=\"0\" jquery1293983709703=\"4\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img title=\"点击查看大图\" height=\"375\" alt=\"&ldquo;漂浮&rdquo;在树梢的住家\" src=\"http://img1.cache.netease.com/catchpic/8/85/85403E98784D436B66C610C19BD61F52.jpg\" width=\"560\" border=\"0\" jquery1293983709703=\"5\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img title=\"点击查看大图\" height=\"376\" alt=\"&ldquo;漂浮&rdquo;在树梢的住家\" src=\"http://img1.cache.netease.com/catchpic/5/52/52D2C96DA227E27C7F01B25BC4537A41.jpg\" width=\"560\" border=\"0\" jquery1293983709703=\"6\" /></p>\r\n<p>&nbsp;</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n(本文来源：居无忧网 ) <img class=\"icon\" height=\"11\" alt=\"张雪茵\" src=\"http://img1.cache.netease.com/house/css09/end_i.gif\" width=\"12\" border=\"0\" /></div>\r\n<!-- 分页 -->', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('161', '<p class=\"summary\">据悉，2010年下半年以来，衣柜企业整体销售形势不容乐观。不少企业下滑幅度高达60%，在一些主流卖场里，即使排名前十名的企业也未必能盈利。在这种情况下，企业纷纷打出了涨价牌，实属无奈之举。</p>\r\n<p>&ldquo;房产新政&rdquo;到2010年下半年终于在衣柜行业体现出来，市场需求不旺，和去年同期相比，衣柜企业在北京的销售额下降了40%。与 此同时，各项成本在不断增加，逐年提高的人工成本也不容忽视。近几年来，随着居民收入和物价全面提高，工人对薪资的要求也越来越高，凡是手艺娴熟点儿的技 工，工资一般都在4000元左右，有时一些特别工种的工人工资更高。&ldquo;不能委屈了工人，但也不能让意风全部消化人工成本，迫于无奈我们的产品只有涨的份 儿。&rdquo;</p>\r\n<p>衣柜代理商陈小姐最近为涨价问题发愁。涨吧，消费者觉得价高;不涨，厂家变成真正亏本销售。&ldquo;经过我们内部调研和商讨后决定，为了保证基本利润和可持续发展，我所代理的衣柜产品很快要上调20%，实木类产品较过去提高10%的售价。&rdquo;陈小姐说这话时脸色有些沉重。</p>\r\n<p>现象：衣柜产品普遍上涨10%以上2010年下半年以来，&ldquo;房产新政&rdquo;的影响终于在家居行业显现出来，企业销售额普遍下滑，最多的下滑 40%-60%。在一片&ldquo;买卖不好做&rdquo;的叫苦声中，一个奇怪的现象随之而至：产品价格不但没有下降，反而不断往上涨。其中最有代表性的是衣柜行业，上涨幅 度都在10%以上，似乎不涨价就不时髦。不过，这种&ldquo;涨价&rdquo;风潮对于消费者来说并没有明显的感觉，因为上涨的是成本，人们看到的是虚高的市场价，而这个标 在价签上的价格，全凭厂商一张嘴说了算。</p>\r\n<p class=\"f_center\"><img alt=\"外部多重压力将影响未来整体衣柜发展\" hspace=\"0\" align=\"baseline\" border=\"0\" src=\"http://img1.cache.netease.com/catchpic/9/99/99FE033BE1B1A96E3F975A054FDDF564.JPG\" /></p>\r\n<p>关于涨价，同样的艰难决定近期还发生在其它衣柜品牌身上，上涨幅度约10%。成本增加销售下滑按照市场基本规律，涨价往往是缘于产品供不应求。供需 平衡被打破，物以稀为贵，涨价自在情理之中。然而，这一轮衣柜涨价潮却是一种&ldquo;怪象&rdquo;：衣柜厂商都在喊&ldquo;生意不好做&rdquo;，不但不降价反而涨价！</p>\r\n<p>由于原材料上涨过大，物流成本增加，销售价格太低不足以抵销成本的增量，只能靠提升出厂价来弥补。对于原材料上涨，业界普遍证实所言非虚。陈小姐这 样形容木材交易的火爆：&ldquo;现在有一批人每天都驻守在中国与俄罗斯边境附近，但凡有一辆运送木材的货车进来，会立刻将其拦下，不论价格高地不由分说地买下全 部木材，原料紧缺程度可想而知。&rdquo;陈小姐说，原材料少了，价格自然一路飙升，比如水曲柳木，现在已由过去的每立方米几百元飙升至1500多元，用水曲柳木 做的衣柜，价格自然是水涨船高。</p>\r\n<p>正在上涨的原材料不单单只有木材，还有制造衣柜必须用到的油漆、五金配件等。另外，工厂采购及运输成本加大也是衣柜涨价的直接原因。&ldquo;大家都知道汽油涨价了，那么随之而来的肯定就是运费提高，从而导致成本提高，涨价也就是理所当然。&rdquo;</p>\r\n<p>据悉，2010年下半年以来，衣柜企业整体销售形势不容乐观。不少企业下滑幅度高达60%，在一些主流卖场里，即使排名前十名的企业也未必能盈利。在这种情况下，企业纷纷打出了涨价牌，实属无奈之举。</p>\r\n<p>消费者对&ldquo;涨价&rdquo;不敏感尽管衣柜产品上浮价格在情理之中，但也有业内人士提出质疑：衣柜不属于快消品或日用品之列，很多时候人们都是几年才逛一次家居卖场，价格上涨与否消费者其实并不敏感。</p>\r\n<p>实际上，衣柜的标价很有学问。在居然之家、红星美凯龙等档次较高的卖场里，聚集着一批品牌衣柜企业，它们的价格相对来说比较坚挺，打个9折、8.5 折已经很不容易了，只有在重大促销活动的时候，才会打7折。但在一些不太知名的卖场里，3折、2折甚至1折的招牌随处可见，很多消费者养成了习惯，不打折 就不买，这直接导致了衣柜标价的虚高。一般来说，衣柜零售价比出厂价要高出一倍，才有打折的本钱。如果衣柜实际售价与出厂价相比，没有30%以上的毛利， 根本就没法维持高昂的场租、营业员的提成及物流、服务等成本支出。</p>\r\n<p>正因为人们在市场上看到的衣柜标价是虚的，成交价到底是多少才算合算，全凭顾客自己的感觉。而衣柜标多少价，最后又打多少折，也是全凭厂家一张嘴，消费者根本不可能了解到内情。这就导致了所谓涨价与降价不过是厂家与经销商之间的结算价格，消费者很难感觉得到。</p>\r\n<div class=\"gg200x300\">&nbsp;</div>\r\n<p>衣柜行业鱼龙混杂，一些非品牌的衣柜企业借助&ldquo;涨价风&rdquo;随手抬高价格的情况有可能发生，但肯定不会出现在品牌衣柜企业身上，尤其是北京衣柜品牌。&ldquo;一旦成为了品牌，企业的关注点都是如何让消费者获得更多实惠，而不是如何从消费者那里牟取暴利。&rdquo;</p>\r\n<p>面对成本增大而形成的涨价风，首选品牌衣柜的产品;对衣柜企业的建议则是，深入挖掘商品价值，避开北京、上海、天津等开店成本较高的一二线城市，将 市场拓展目标放在二三线城市。&ldquo;同样面积的店面，在一线城市刨除租金等成本后毛利可能只有10%，但在二三线城市肯定要高得多。&rdquo;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('162', '<p><strong>网易娱乐独家专稿（文/Solo lau）&nbsp;</strong>在经历了华语三大导演激烈的厮杀之后，国内影市在1月进入了一个缓冲期。本月称得上华语大片的唯有陈木胜导演的《新少林寺》一部，不过两部引进电影《创：战纪》和《纳尼亚传奇：黎明踏浪号》也都是重量级的作品。另外，1月还有不少合家欢喜剧扎堆上映，为即将到来的春节营造喜庆的氛围，适合全家一同走进影院观赏。</p>\r\n<p><strong>大片系：《创：战纪》再续经典 《新少林寺》阵容强悍</strong></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><object id=\"flash_25455\" codebase=\"http://fpdownload2.macromedia.com/get/shockwave/cabs/flash/swflash.cab\" height=\"394\" width=\"490\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\">\r\n<param value=\"12965\" name=\"_cx\" />\r\n<param value=\"10425\" name=\"_cy\" />\r\n<param value=\"\" name=\"FlashVars\" />\r\n<param value=\"http://img1.cache.netease.com/flvplayer081128/~false~0003_V6KLVOAU7~vimg2.ws.126.net/image/snapshot/2010/11/U/8/V6KLVOAU8~.swf\" name=\"Movie\" />\r\n<param value=\"http://img1.cache.netease.com/flvplayer081128/~false~0003_V6KLVOAU7~vimg2.ws.126.net/image/snapshot/2010/11/U/8/V6KLVOAU8~.swf\" name=\"Src\" />\r\n<param value=\"Window\" name=\"WMode\" />\r\n<param value=\"0\" name=\"Play\" />\r\n<param value=\"-1\" name=\"Loop\" />\r\n<param value=\"High\" name=\"Quality\" />\r\n<param value=\"LT\" name=\"SAlign\" />\r\n<param value=\"-1\" name=\"Menu\" />\r\n<param value=\"\" name=\"Base\" />\r\n<param value=\"always\" name=\"AllowScriptAccess\" />\r\n<param value=\"NoScale\" name=\"Scale\" />\r\n<param value=\"0\" name=\"DeviceFont\" />\r\n<param value=\"0\" name=\"EmbedMovie\" />\r\n<param value=\"FFFFFF\" name=\"BGColor\" />\r\n<param value=\"\" name=\"SWRemote\" />\r\n<param value=\"\" name=\"MovieData\" />\r\n<param value=\"1\" name=\"SeamlessTabbing\" />\r\n<param value=\"0\" name=\"Profile\" />\r\n<param value=\"\" name=\"ProfileAddress\" />\r\n<param value=\"0\" name=\"ProfilePort\" />\r\n<param value=\"all\" name=\"AllowNetworking\" />\r\n<param value=\"true\" name=\"AllowFullScreen\" /></object></p>\r\n<p class=\"f_center\" style=\"text-align: center\">视频：《创：战纪》中文预告片</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"一月影市前瞻：《新少林寺》挑战《创：战纪》\" src=\"http://img3.cache.netease.com/ent/2010/12/31/20101231143525473f9.jpg\" />&nbsp;</p>\r\n<p class=\"f_center\">《创：战纪》海报。</p>\r\n<p>《创：战纪》：《阿凡达》之后3D效果最赞的电影</p>\r\n<p>上映日期：1月11日</p>\r\n<p>本片是1982年经典科幻片《电子争霸战》的续集，讲述了第一部中男主角凯文的儿子萨姆长大后，冒险进入电子世界拯救父亲的故事。电影继承了老版中的科幻概念和视觉元素，3亿美元的惊人投资也为电影在技术方面的苛刻要求提供了坚实的后盾。《创：战纪》不但结合了最顶尖的CG和3D技术，还请来了《龙骑士》和《终结者3》的特效总监萨米尔&middot;荷昂来把关，最终出色的视觉效果使本片被誉为《阿凡达》之后3D效果最赞的好莱坞科幻电影。《创：战纪》在全球各地上映之后，无论口碑票房均获得了不俗的成绩。</p>\r\n<hr />\r\n<p class=\"f_center\" style=\"text-align: center\"><object id=\"flash_87607\" codebase=\"http://fpdownload2.macromedia.com/get/shockwave/cabs/flash/swflash.cab\" height=\"394\" width=\"490\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\">\r\n<param value=\"12965\" name=\"_cx\" />\r\n<param value=\"10425\" name=\"_cy\" />\r\n<param value=\"\" name=\"FlashVars\" />\r\n<param value=\"http://img1.cache.netease.com/flvplayer081128/~false~0003_V6O3DCCIU~vimg2.ws.126.net/image/snapshot/2010/12/I/V/V6O3DCCIV~.swf\" name=\"Movie\" />\r\n<param value=\"http://img1.cache.netease.com/flvplayer081128/~false~0003_V6O3DCCIU~vimg2.ws.126.net/image/snapshot/2010/12/I/V/V6O3DCCIV~.swf\" name=\"Src\" />\r\n<param value=\"Window\" name=\"WMode\" />\r\n<param value=\"0\" name=\"Play\" />\r\n<param value=\"-1\" name=\"Loop\" />\r\n<param value=\"High\" name=\"Quality\" />\r\n<param value=\"LT\" name=\"SAlign\" />\r\n<param value=\"-1\" name=\"Menu\" />\r\n<param value=\"\" name=\"Base\" />\r\n<param value=\"always\" name=\"AllowScriptAccess\" />\r\n<param value=\"NoScale\" name=\"Scale\" />\r\n<param value=\"0\" name=\"DeviceFont\" />\r\n<param value=\"0\" name=\"EmbedMovie\" />\r\n<param value=\"FFFFFF\" name=\"BGColor\" />\r\n<param value=\"\" name=\"SWRemote\" />\r\n<param value=\"\" name=\"MovieData\" />\r\n<param value=\"1\" name=\"SeamlessTabbing\" />\r\n<param value=\"0\" name=\"Profile\" />\r\n<param value=\"\" name=\"ProfileAddress\" />\r\n<param value=\"0\" name=\"ProfilePort\" />\r\n<param value=\"all\" name=\"AllowNetworking\" />\r\n<param value=\"true\" name=\"AllowFullScreen\" /></object></p>\r\n<p class=\"f_center\" style=\"text-align: center\">视频：《新少林寺》预告片</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"一月影市前瞻：《新少林寺》挑战《创：战纪》\" src=\"http://img3.cache.netease.com/ent/2010/12/31/20101231144204dfb34.jpg\" />&nbsp;</p>\r\n<p class=\"f_center\">陈木胜&ldquo;火烧少林寺&rdquo;。&nbsp;</p>\r\n<p>《新少林寺》：刘天王打正宗少林拳</p>\r\n<p>上映日期：1月19日</p>\r\n<p>陈木胜导演这部阵容华丽的新作虽然打出了《新少林寺》的旗号，但无论故事还是动作都是全新的创作理念。不仅电影的背景放置在了1920年代战火纷乱的中国，而且陈木胜也声明要挖掘的是&ldquo;禅武合一&rdquo;的少林文化精髓。电影中主创们表演的也都是最正宗的少林功夫，特别是刘天王为了拍好动作戏苦练了3个月的少林拳法。《新少林寺》的武戏有成龙、熊欣欣、吴京、余少群保驾护航，文戏又有刘德华、范冰冰、谢霆锋的实力演出，像这种内外兼修的功夫巨制令人期待。</p>\r\n<hr />\r\n<p class=\"f_center\" style=\"text-align: center\"><object id=\"flash_78532\" codebase=\"http://fpdownload2.macromedia.com/get/shockwave/cabs/flash/swflash.cab\" height=\"394\" width=\"490\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\">\r\n<param value=\"12965\" name=\"_cx\" />\r\n<param value=\"10425\" name=\"_cy\" />\r\n<param value=\"\" name=\"FlashVars\" />\r\n<param value=\"http://img1.cache.netease.com/flvplayer081128/~false~0003_V6K6M3IS7~vimg2.ws.126.net/image/snapshot/2010/11/S/8/V6K6M3IS8~.swf\" name=\"Movie\" />\r\n<param value=\"http://img1.cache.netease.com/flvplayer081128/~false~0003_V6K6M3IS7~vimg2.ws.126.net/image/snapshot/2010/11/S/8/V6K6M3IS8~.swf\" name=\"Src\" />\r\n<param value=\"Window\" name=\"WMode\" />\r\n<param value=\"0\" name=\"Play\" />\r\n<param value=\"-1\" name=\"Loop\" />\r\n<param value=\"High\" name=\"Quality\" />\r\n<param value=\"LT\" name=\"SAlign\" />\r\n<param value=\"-1\" name=\"Menu\" />\r\n<param value=\"\" name=\"Base\" />\r\n<param value=\"always\" name=\"AllowScriptAccess\" />\r\n<param value=\"NoScale\" name=\"Scale\" />\r\n<param value=\"0\" name=\"DeviceFont\" />\r\n<param value=\"0\" name=\"EmbedMovie\" />\r\n<param value=\"FFFFFF\" name=\"BGColor\" />\r\n<param value=\"\" name=\"SWRemote\" />\r\n<param value=\"\" name=\"MovieData\" />\r\n<param value=\"1\" name=\"SeamlessTabbing\" />\r\n<param value=\"0\" name=\"Profile\" />\r\n<param value=\"\" name=\"ProfileAddress\" />\r\n<param value=\"0\" name=\"ProfilePort\" />\r\n<param value=\"all\" name=\"AllowNetworking\" />\r\n<param value=\"true\" name=\"AllowFullScreen\" /></object></p>\r\n<p class=\"f_center\" style=\"text-align: center\">视频：《纳尼亚传奇3》预告片</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><img alt=\"一月影市前瞻：《新少林寺》挑战《创：战纪》\" src=\"http://img4.cache.netease.com/ent/2010/12/31/201012311443165574f.jpg\" />&nbsp;</p>\r\n<p class=\"f_center\">《纳尼亚3》剧照。</p>\r\n<p>《纳尼亚传奇：黎明踏浪号》：咸鱼一定要翻身</p>\r\n<p>上映日期：1月7日</p>\r\n<p>《纳尼亚传奇2》的全球票房异常惨淡，只有寥寥4亿美元，这点儿可怜的成绩彻底惹怒了迪士尼。《黎明踏浪号》是《纳尼亚》系列中最受大众欢迎的作品，因此迪士尼非常重视。为此他们炒掉了前导演安德鲁&middot;亚当森，请来了迈克尔&middot;艾普特接管导筒，并且从剧本到美术设计都做了重新设定。为了保障视觉效果，还雇佣来了著名的维塔特效为影片制作美工和特效。可见为了能让这部续集电影大有前途，为了让《纳尼亚》系列咸鱼翻身，主创当真是下足了功夫。当然到底影片效果如何，还需观众亲自评判。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('163', '<p class=\"f_center\" style=\"text-align: center\"><strong><img alt=\"《拜见岳父大人3》海报。\" src=\"http://img3.cache.netease.com/ent/2011/1/4/201101041006257030f.jpg\" /><br />\r\n《拜见岳父大人3》海报。</strong></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><strong><img height=\"640\" alt=\"《蓝色情人节》剧照。\" src=\"http://img4.cache.netease.com/ent/2011/1/4/2011010410073549444.jpg\" width=\"400\" /><br />\r\n《蓝色情人节》剧照。</strong></p>\r\n<p class=\"f_center\" style=\"text-align: center\"><strong><img alt=\"《大地惊雷》海报。\" src=\"http://img4.cache.netease.com/ent/2011/1/4/201101041009006e8a0.jpg\" /><br />\r\n《大地惊雷》海报。</strong></p>\r\n<p>\r\n<p><strong>网易娱乐1月4日报道</strong></p>\r\n</p>\r\n<p><font color=\"#2b2b2b\"><strong> </strong>（文/长十郎）2011年第一个周末，美国影市没有任何大范围公映的新片，所以前十榜的排名基本和2010年最后一个周末一样。环球影业的《拜见岳父大人3》以2630万美元连庄冠军。本周末总票房比起去年同期</font><font color=\"#1e50a2\">《阿凡达》</font><span style=\"font-weight: bold; color: #ff0000; text-decoration: none\">(影评)</span><font color=\"#2b2b2b\">在位时少了27%。另外，小范围反应的争奖片中，韦恩斯坦影业的《蓝色情人节》在4家影院上映，单馆票房有4.5万美元，成绩很好。而SPC的《又一年》在6家影院上映，单馆票房也有2万美元。这两部电影都有希望在</font><font color=\"#1e50a2\">奥斯卡</font><font color=\"#2b2b2b\">奖中争夺影后奖项，两部电影登场声势不错，也为争奖增加筹码。</font></p>\r\n<p>《拜见岳父大人3》增加18个放映场馆，票房跌幅为14.7%，收入2630万美元，排名第1.该片制作费为1亿美元，上映12天，总票房为1.03亿美元。这一成绩不错，但比起6年前《拜见岳父大人2》12天1.62亿美元的票房，还是要差很远。</p>\r\n<p>派拉蒙影业的争奖片《大地惊雷》增加36个放映场馆，票房跌幅为1.4%，收入2450万美元，排名第2。该片制作费为3800万美元，上映12天，总票房为8676万美元,。科恩兄弟的作品中，票房最高的是《老无所依》。这部在2008年奥斯卡奖中为科恩兄弟赢得最佳影片、最佳导演等4项大奖的电影美国总票房为7430万美元，如今《大地惊雷》12天的票房都已经超过这一纪录，《大地惊雷》可以更理直气壮地征战奥斯卡了。</p>\r\n<p>迪士尼影业的《创：战纪》减少86个放映场馆，票房跌幅为4.4%，收入1830万美元，排名第3。该片制作费为1.7亿美元，上映17天，美国总票房为1.3亿美元。就观影人数来看，《创：战纪》成绩已经比1982年的前作《电子世界争霸战》要好，不过《电子世界争霸战》当年也不是什么卖座电影，所以也没什么值得高兴的。</p>\r\n<p>由于放假的关系，华纳兄弟影业的真人+3D动画片《瑜伽熊》多了不少小朋友观众。该片本周末票房增幅为65.9%，收入1300万美元，排名第5。该片制作费为8000万美元，如今上映17天票房为6613万美元。</p>\r\n<p>20世纪福克斯影业的3D儿童大片《纳尼亚传奇3》也得到不少小朋友观众的捧场。该片减少402个影院，票房增幅为10.8%，收入1050万美元，排名第5。该片制作费为1.55亿美元，上映24天，总票房为8714万美元。</p>\r\n<p>迪士尼影业的3D动画片《长发公主》票房涨了55.7%，收入1000万美元，排名第6。该片制作费为2.6亿美元，如今美国总票房为1.68亿美元。</p>\r\n<p>派拉蒙影业的争奖片《斗士》增加23个放映场馆，票房涨了31.5%，收入1000万美元，排名第7。该片制作费为2500万美元，如今美国总票房为4638万美元。</p>\r\n<p>&nbsp;</p>\r\n<div class=\"gg200x300\">20世纪福克斯的《格列弗游记》增加543个放映场馆，票房涨幅为44.3%，收入910万美元，排名第8。该片上映9天，总票房为2722万美元，成绩不好啊。</div>\r\n<p>福克斯探照灯的争奖片《黑天鹅》增加87个放映场馆，票房涨幅为35.1%，收入845万美元，排名第9。该片制作费为1300万美元，如今美国总票房为4737万美元。</p>\r\n<p>韦恩斯坦影业的争奖片《王的演讲》票房涨幅为70.1%，收入764万美元，排名第10。该片制作费为1500万美元，如今美国总票房为2280万美元。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('164', '<p class=\"f_center\" style=\"text-align: center\"><img alt=\"魔术师\" src=\"http://img1.cache.netease.com/catchpic/B/B7/B7C78814A9A89EBF75C3BF9CE3BE8E10.jpg\" /></p>\r\n<p class=\"f_center\" style=\"text-align: center\">《魔术师》供你参考版海报。</p>\r\n<p>&nbsp;</p>\r\n<div class=\"gg200x300\"><strong>Mtime时光网1月4日报道</strong>&nbsp;2003年，西维亚&middot;乔迈凭借一部《疯狂约会美丽都》扬名动画片界，今年这位导演更是推出了年度最佳动画片之一《魔术师》，算是在3D动画电影横行于世的今天，树起了一面特立独行2D动画大旗。</div>\r\n<p>然而，最近西维亚&middot;乔迈在一次采访中透露，他接下来可能不会继续制作2D动画片了。因为2D动画&ldquo;太耗时了，真的真的需要很长时间&rdquo;，乔迈还说：&ldquo;有些人认为制作3D动画对我来说是件麻烦事，其实并非如此，3D只是一种不同的动画形式，比起手绘动画，3D反倒更接近木偶或停格动画，因此3D动画只是另一种我能控制并也可以做成电影的形式&hellip;&hellip;我也不知道，我认为我接下来不会再做2D，看情况吧，我可能会在3D或者真人电影中二选一。&rdquo;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('165', '<p class=\"f_center\" style=\"text-align: center\"><strong><img alt=\"专访姜文：换个导演攒不齐《让子弹飞》这帮人\" src=\"http://img3.cache.netease.com/ent/2010/12/7/20101207173703eba17.jpg\" />&nbsp;</strong></p>\r\n<p class=\"f_center\">姜文把《让子弹飞》比成自己待嫁的闺女，并且他对这个&ldquo;闺女&rdquo;是十分的满意。</p>\r\n<p><strong>网易娱乐独家专稿（文/宇文翮）&nbsp;</strong>12月3日，《大笑江湖》的公映揭开了今年贺岁档的序幕。当晚，由姜文、葛优、周润发领衔主演的华语大片《让子弹飞》也在京举行了媒体试映会。翌日下午，导演兼主演的姜文接受了网易娱乐的专访。因为电影的后期制作仍在紧张的进行当中，姜文每天在棚里都只能睡三个小时都不到。虽然十分疲惫，但对于自己的第四部作品，姜文不仅显得信心十足，甚至言谈举止间还很有点电影里麻匪的&ldquo;霸气&rdquo;。</p>\r\n<p><strong>姜文&ldquo;豪言&rdquo;摘录：</strong></p>\r\n<p>1.&nbsp;我已经交了一张超满意的答卷。</p>\r\n<p>2.&nbsp;就像《太阳照常升起》弄剧本的时候，就有人看不懂，这个就得让人看不懂，这个看懂了有什么意思？</p>\r\n<p>3.&nbsp;我觉得拍一个爽的、舒服的、看着High的片子不特别费劲，就是得搭功夫。</p>\r\n<p>4.&nbsp;你说莫扎特跟我又不认得，好几百年了吧，他居然写了一段在我片里这么合适的音乐，你说是我该谢谢他，还是他谢谢我啊？(玩笑话)</p>\r\n<p>5.&nbsp;周润发、葛优，他们也演过很多戏，但是他们为什么想演这个戏呢？是因为这个故事能够使他们的才华有一个充分的展示，而这个才华是观众期待的，《让子弹飞》把这些东西变成一个现实。</p>\r\n<p>6.&nbsp;换一个导演这帮人攒得齐吗，那绝对是空前绝后的。就算把他们俩（周润发和葛优）攒得齐，也不一定能把我攒齐了。</p>\r\n<p>7.&nbsp;导演哪有现场瞎要求的，那叫什么导演？你不是给人扫兴嘛。现场你得欣赏，一个人准备了半天到这镜头前面一亮相，确实是值得欣赏的。</p>\r\n<p>8.&nbsp;所以搭钱搭功夫，我觉得要对得起观众拿钱来看电影，咱不能蒙人家。</p>\r\n<p>9.&nbsp;我是导演，就够了，作战意图，作战目的作战结果是我制定的，作战计划可能他们拿来的，我觉得做原计划达不到这个目的。我觉得大家伙儿都有贡献，但是方向是我在把握。</p>\r\n<p>10.&nbsp;有感而发，拍的东西会比较好，我一直不觉得什么事干职业好。你说体育本来是一个玩的事儿，玩的很开心，非得让他（刘翔）跨栏，把脚都跨折了，你们看着开心了，刘翔他妈看着多糟心啊！</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('166', '<p><strong class=\"cRed\">网易娱乐12月5日报道</strong>&nbsp;2010年贺岁档大战已经拉开帷幕，作为今年贺岁档&ldquo;头炮&rdquo;的《大笑江湖》已于<st1 st=\"on\" year=\"2010\" month=\"12\" day=\"3\" islunardate=\"False\" isrocdate=\"False\"></st1>12月3日在全国各大院线上映。近日，本片导演朱延平携主演小沈阳、毕畅、翟星月做客&ldquo;网易会客室&rdquo;，为网友解密影片台前幕后故事。现场小沈阳大谈与程野片中吻戏拍摄花絮，一旁的朱延平频频爆料，称小沈阳<span style=\"font-weight: bold; text-decoration: none\">（博客）</span>最早要吻的本是师傅赵本山，拍打戏被吊到十几米的高空却直呼过瘾。对于在影片中表现，小沈阳也毫不客气的给自己打出了四星半的高分（五星制），并坦言春晚的压力其实更大，堪比五部贺岁电影。而谈到今年贺岁档，已经连续&ldquo;征战&rdquo;三年的朱延平导演，感慨太&ldquo;凶残&rdquo;打得太激励，自己好像还没习惯。不过，对于电影票房，小沈阳和朱延平导演却都是信心满满，并表示和三个&ldquo;葛优&rdquo;比起来，《大笑》很干净，是唯一适合全家去观看的贺岁档电影，一笑可以解千愁。</p>\r\n<p class=\"f_center\" style=\"text-align: center\"><strong><img alt=\"《大笑》做客 小沈阳：春晚压力大堪比五部电影\" src=\"http://img3.cache.netease.com/ent/2010/12/5/20101205165648bcfcd.jpg\" /><br />\r\n</strong>导演朱延平（右1）携主演小沈阳（右2）、毕畅（左2）、翟星月（左1）做客网易娱乐。</p>\r\n<p><strong>精彩语录：</strong></p>\r\n<p>1.小沈阳：春晚压力是最大的，堪比五部电影。</p>\r\n<p>2.小沈阳：我也特别想知道自己有没有演电影的天分，看看自己塑造的人物成功不成功。</p>\r\n<p>3.朱延平：他（小沈阳）的搞笑不是靠肢体，而是靠情节，处处都是搞笑。我个人觉得他一直在蜕变，我跟人家说他这次的表演让人家刮目相看，惊喜连连，千生易得，一丑难求。</p>\r\n<p>4.朱延平：吻戏这事儿，一开始是沈阳跟师父吻的（不是程野）。</p>\r\n<p>5.小沈阳：（心里）不对劲，两个男人在一起那么整（吻戏），挺闹心的。</p>\r\n<p>6.朱延平：（赵家班）常常有即兴表演，所谓神来之笔，常常有。</p>\r\n<p>7.朱延平：（小沈阳吊威亚）媳妇儿在下面喊&ldquo;沈阳！加油！像个男子汉！&rdquo;吊完就下来了，数钞票哩（笑）。</p>\r\n<p>8.小沈阳：毕竟是演戏嘛，不能只演一个，演春晚小品可以是一个状态，因为他是一个符号。演电影就要按照剧情那么走，不符合的就不能演。</p>\r\n<p>9.小沈阳：对，毕竟都认识你，（当初刚成名时）有点儿那种很牛的感觉（内心膨胀），会有。后来就是师父帮我（拉回到平常心态）。</p>\r\n<p>10.朱延平：<st1 st=\"on\" productid=\"赵\"></st1>赵老师好讲（不怕三个葛优），因为他们都是好朋友，好朋友之间是开玩笑的，小沈阳这个辈分不适合说谁打谁。</p>\r\n<p>11.朱延平：而且是这四部戏里（《大笑江湖》）最大的优势就是唯一可以带小孩去看的电影。</p>\r\n<p>12.朱延平：没习惯，太凶残了（笑），（内地贺岁档）打得太激烈了。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('167', '<p class=\"f_center\" style=\"text-align: center\"><strong><img alt=\"范冰冰称会放弃一切去爱 暗示婚后会退出娱乐圈\" src=\"http://img3.cache.netease.com/ent/2011/1/4/201101040243331e5c5.jpg\" /><br />\r\n</strong>范冰冰 (资料图)</p>\r\n<p><strong>网易娱乐1月4日报道</strong>&nbsp;(文/小易) 据香港媒体报道，范冰冰接受杂志问大谈爱情，她表示无论有多成功、名气多大，当爱情来临的一天，她同样会放弃一切去爱。作为演员，她体验了很多戏剧角色中的爱情故事，笑言更加了解自己所需要的是哪份爱情：&ldquo;我希望的爱情是平和、温暖的，一个可以给我家的感觉的人，我会放弃现在的生活和事业，去享受平凡人的快乐。&rdquo;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('168', '<p class=\"f_center\" style=\"text-align: center\"><strong><img alt=\"周杰伦&ldquo;青蜂侠&rdquo;剧照。(资料图)\" src=\"http://img4.cache.netease.com/ent/2011/1/4/2011010409055921c9c.jpg\" /><br />\r\n</strong>周杰伦《青蜂侠》剧照。(资料图)</p>\r\n<p>&nbsp;</p>\r\n<div class=\"gg200x300\"><strong>网易娱乐1月4日报道</strong>(文/小易) 电影《青蜂侠》28日上映，周杰伦(周董)去年与女主角卡梅隆迪亚兹到欧洲宣传，接受多家国际媒体专访，当时他的菜英文已是焦点，近日再被网友抓包，英国媒体用英文访问他，他频用手摸耳朵掩饰尴尬，不知是否太紧张，竟将&ldquo;挑战&rdquo;讲成&ldquo;Talenge&rdquo;，卡梅隆赶紧边笑边点头，低声相救喊：&ldquo;Challenge。&rdquo;</div>\r\n<p>周董坦言电影中的英文是事后配音，听起来仍算流畅，但英国媒体专访时，他似乎太紧张，想表达他饰演的加藤对他是一大挑战，他也喜欢挑战，孰料，太多的挑战让他出槌，他疑似知道自己出糗，向一旁的卡梅隆求救，她技巧的点头，表示赞同周董所言，再低声纠正为Challenge(挑战)。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('169', '<p class=\"f_center\" style=\"text-align: center\"><strong><img alt=\"钟楚红约女友吃饭 。\" src=\"http://img4.cache.netease.com/ent/2011/1/4/201101040917436ced3.jpg\" /><br />\r\n</strong>钟楚红约女友吃饭 。</p>\r\n<p><strong>太阳报1月4日报道</strong>&nbsp;据香港媒体报道，息影多时的钟楚红(红姑)，近年经常被问何时复出拍戏，她表示喜欢过悠闲生活，暂无意复出。</p>\r\n<p>日前下午约5时，钟楚红相约两名女友人到中环镛记开餐。吃完饭后，戴上墨镜的钟楚红先走出来，与友人到附近时装店看衣服，期间她不时拿上手研究，但最终都没有购买，其后她步行到街头由司机接载离开。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('170', '<p class=\"f_center\" style=\"text-align: center\"><strong><img alt=\"冯小刚做客新版《小崔说事》:闺女都觉得我欠抽\" src=\"http://img4.cache.netease.com/ent/2011/1/4/201101040238507a09d.jpg\" /><br />\r\n</strong>冯小刚做客新版《小崔说事》。</p>\r\n<p><strong>新京报1月4日报道</strong>&nbsp;日前，崔永元带着他的新版《小崔说事》在央视录制了2011年开年的四期节目。新《小崔说事》即将于1月6日晚18：00在CCTV-1播出，首播的第一期节目是《黎明前的暗战》，随后陆续推出《冯小刚团队》《范伟和他的朋友们》《亚丁湾护航舰队的官兵》。在这四期节目中，关注度最高的是《冯小刚团队》，节目现场，导演冯小刚讲述自己十年贺岁片的&ldquo;坎坷&rdquo;路，而在节目之后，小崔接受本报记者采访时也谈了很多感悟，也首次提及他和冯小刚多年前因为《手机》引发的&ldquo;冲突&rdquo;。</p>\r\n<p><strong>小崔&ldquo;说事&rdquo;</strong></p>\r\n<p>新京报：你觉得新版《小崔说事》怎么样？</p>\r\n<p>崔永元：我一点感觉都找不着，因为我喜欢的节目就是坐下来好好谈，但今天录冯小刚这期节目，坐在那儿好好聊的时候，我马上就有压力，有领导说你不要坐下来认真谈一个事，没完没了，你们就要耍起来闹起来玩起来，只有那样节目节奏才能快，收视率才高，但我真的不会。现在电视全是闹的，我这快50（岁）的心脏根本受不了。</p>\r\n<p>新京报：这是妥协吗？</p>\r\n<p>崔永元：肯定是妥协，但如果说妥协完了，观众认，领导说好，专家也觉得好，那只能证明过去我们判断错了。如果妥协完了，还没人认，这才是天大的悲剧。现在很多节目抄来抄去，三个月就死了，大家也见怪不怪，没人琢磨生命力、影响力和深度厚度的事。</p>\r\n<p>新京报：录冯小刚这期感觉很过瘾，大家印象中，你俩的渊源从《手机》开始？</p>\r\n<p>崔永元：我俩之前非常熟，以前他写剧本还会把我叫去，听听我的意见。后来有了些冲突，当时我们俩都没解决，而是选择了一种淡化它的方式，你看直到今天我们坐在一起做节目，从来没说起过这个事。我觉得是我们活到这个年龄后，学会了一种为人处世的方式。有些问题不是那么容易解决的时候，可以把它放在一边，时间长了，年龄大了，每个人都理智了，那时候慢慢再解决也来得及。</p>\r\n<p>上个月我给朱军道歉，就是因为我想起我受伤害时的情景，那时候都说冯小刚伤害崔永元，连篇累牍，却没人在意这些给我的家人带来的伤害，现在回过头来，我想当时我是不是也（被误读）伤害了朱军。大家（传播）处在一个狂欢状态，包括我也没在意。那么现在知道了，我觉得应该第一时间去把它解决。这才像一个成熟的人做的事。</p>\r\n<p><strong>小刚&ldquo;说事&rdquo;</strong></p>\r\n<p>说电影 &ldquo;葛优曾劝我别拍了&rdquo;</p>\r\n<p>&nbsp;</p>\r\n<div class=\"gg200x300\">冯小刚的贺岁片年年创票房新高，但这些片子在他眼里却&ldquo;不尽完美&rdquo;，比如说《没完没了》，当年电影局意见是贺岁片得拍三部曲，有《甲方乙方》《不见不散》，还得再拍。&ldquo;我硬着头皮写了《没完没了》，故事出自饭桌笑话，我们总说葛优抠门。比如你把他媳妇绑架了，拿电话威胁他，答复肯定是&lsquo;你撕票吧，我绝对不和犯罪分子妥协&rsquo;，你要绑了葛优，跟他媳妇要钱，他宁可自杀。&rdquo;这片子让冯小刚拍得很痛苦，&ldquo;拍到一半，葛优跟我说，你花了多少钱，我去拉个赞助把钱堵上，咱就别拍了&rdquo;。</div>\r\n<p><strong>聊生活 &ldquo;闺女都觉得我欠抽&rdquo;</strong></p>\r\n<p>节目最后，冯小刚和崔永元聊起了家庭生活和如何教女，冯小刚透露&ldquo;女儿有一次给我打电话说，&lsquo;爸，我觉得你特欠，看了你的微博我特想抽你，可是我觉得你说的道理都对。&rsquo;她对我的评价就是，&lsquo;我觉得你也没比别人更坏。&rsquo;我觉得这个评价非常的高。&rdquo;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('171', '<p class=\"f_center\" style=\"text-align: center\"><img alt=\"王思懿（资料图）\" src=\"http://img4.cache.netease.com/ent/2011/1/4/201101040734322c8b4.jpg\" /><br />\r\n王思懿<span style=\"font-weight: bold; text-decoration: none\">（博客）</span>（资料图）</p>\r\n<p><strong>四川在线-华西都市报1月4日报道</strong>&nbsp;台湾演员王思懿，当年因扮演张纪中的电视剧《水浒传》中的&ldquo;潘金莲&rdquo;一炮走红内地。</p>\r\n<p>昨天，王思懿头戴帽子，&ldquo;乔装打扮&rdquo;坐在四位名人书画联展开幕式台下。经魏明伦介绍，华西都市报记者面对面采访了王思懿。</p>\r\n<p>&nbsp;</p>\r\n<div class=\"gg200x300\">王思懿笑说：演完潘金莲后，就没回台湾去，一直在北京发展。&ldquo;最近几年，一直生活在北京，所以，我已成为北京人了。北京拍戏机会多，朋友也多。我在北京发展得很好。演完潘金莲后，我演过《紫荆勋章》、《徐悲鸿传》、《刘伯温传奇》、《红尘无泪》等。我还与巩汉林、潘长江合作，在春晚表演过小品《同桌的她》。我从内心一直感谢张纪中！当年如果没有他让我演《水浒传》中&lsquo;潘金莲&rsquo;，我还不知道自己的事业是什么样子。&rdquo;</div>\r\n<p>问如何评价新版《水浒传》中甘婷婷扮演的潘金莲，王思懿笑着说：&ldquo;我还没看过新版《水浒传》，无法作评价，但我希望新版《水浒传》，有新的创意！&rdquo;谈及是否找到另一半，王思懿笑着摇摇头幽默地说：&ldquo;在婚姻与事业选择中，当然要首选事业。我不大依靠男人过日子，我是赚了钱自己养活自己，多自在啊。一个人过得开心、高兴就行。&rdquo;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('172', '<p>【基本介绍】<br />\r\n无需付费购买，到官方指定下载地址下载安装后即可以使用 <br />\r\n具有灵活点播的功能，随点随看，时间自由掌握<br />\r\n操作简单，界面简洁明了<br />\r\n掌握最先进的P2SP传输技术，传输速度更快，更节省带宽 <br />\r\n占用CPU、内存、带宽等系统资源占用少，不影响其它操作。 <br />\r\n支持多种视频文件格式 <br />\r\n播放流畅，首次连接速度快 <br />\r\n采用最新解码技术，使网络观看拖动无延时，达到播放本地文件的效果<br />\r\n最高清画面，支持网络高清点播，最高码率达到1300。 <br />\r\n采用脉冲式连接和自动重连策略，保证用户稳定、流畅的观看。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('173', '<p>【基本介绍】<br />\r\n千千静听是一款完全免费的音乐播放软件，拥有自主研发的全新音频引擎，集播放、音效、转换、歌词等众多功能于一身。其小巧精致、操作简捷、功能强大的特点，深得用户喜爱，被网友评为中国十大优秀软件之一，并且成为目前国内最受欢迎的音乐播放软件。<br />\r\n<br />\r\n【软件特色】<br />\r\n拥有自主研发的全新音频引擎，支持DirectSound、Kernel Streaming和ASIO等高级音频流输出方式、64比特混音、AddIn插件扩展技术，具有资源占用低、运行效率高，扩展能力强等特点。<br />\r\n<br />\r\n千千静听支持几乎所有常见的音频格式，包括MP/mp3PRO、AAC/AAC+、M4A/MP4、WMA、APE、MPC、OGG、WAVE、CD、 FLAC、RM、TTA、AIFF、AU等音频格式以及多种MOD和MIDI音乐，以及AVI、VCD、DVD等多种视频文件中的音频流，还支持CUE音轨索引文件。<br />\r\n<br />\r\n通过简单便捷的操作，可以在多种音频格式之间进行轻松转换，包括上述所有格式（以及CD或DVD中的音频流）到WAVE、MP3、APE、WMA等格式的转换；通过基于COM接口的AddIn插件或第三方提供的命令行编码器还能支持更多格式的播放</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('174', '<p>【基本介绍】<br />\r\n&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Google Chrome(谷歌浏览器)是由Google开发的一款可让您更快速、轻松且安全地使用网络的浏览器，它的设计超级简洁，使用起来更加方便。<br />\r\n<br />\r\n【软件特点】<br />\r\n1、更好的插件稳定性和性能，特别是视频方面。<br />\r\n2、速度更快。相比于第一个测试版，JavaScript V8引擎的SunSpider测试成绩已经加快了40％，V8测试成绩也提高了50％，今后还会继续改进。<br />\r\n3、书签管理器和隐私控制。通过书签导入、导出，可以在Chrome和其它浏览器之间轻松切换，另外管理大量书签也更简单了。<br />\r\n&nbsp;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('175', '<p>超级硬盘数据恢复软件是一款简单易用且功能强大的数据恢复软件，可以恢复被删除、被格式化、分区丢失、重新分区或者分区提示格式化的数据。采用了最新的数据扫描引擎，以只读的方式从磁盘底层读出原始的扇区数据，经过高级的数据分析算法，扫描后把丢失的目录和文件在内存中重新建立出原先的分区和原先的目录结构，数据恢复的效果非常好。<br />\r\n&nbsp;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('176', '<p>今年1月份，泰国曼谷上空出现了十年以来的首次日食，这是一架飞机在日食背景下映衬出来的情景。宋卡太子大学（PrinceofSongklaUniversity）的萨克什恩&middot;布恩瑟温介绍称，在泰国上空，此次日环食遮住了太阳57%至80%的区域，因地理位置不同，泰国各省份所看到的遮盖区域也不尽相同。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('177', '<p><span class=\"cDGray\"><font color=\"#727171\">这些旖旎的风景，从一个侧面反映出了气候对地球环境的影响。</font></span><a class=\"cDRed\" href=\"http://news.163.com/photoview/05RQ0001/11765.html\"><font color=\"#ba2636\">[</font></a></p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('178', '<p>11月9日，美国洛杉矶，池谷—村上彗星划过夜空。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('179', '<p><span class=\"cDGray\"><font color=\"#727171\">微观世界摄影大赛公布2010年获奖者名单,展示了一场视觉盛宴。</font></span><a class=\"cDRed\" href=\"http://news.163.com/photoview/05RQ0001/11433.html\"><font color=\"#ba2636\">[</font></a></p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('180', '<p><span class=\"cDGray\"><font color=\"#727171\">这些怪异的冰川洞穴中环境温度有时会低至-20度以下</font></span></p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('181', '<p><span class=\"cDGray\"><font color=\"#727171\">在微距摄影师约翰&middot;霍尔门看来，昆虫隐藏着数不清的魅力。</font></span></p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('182', '<p><span class=\"cDGray\"><font color=\"#727171\">对于数百万美国人来说，秋天是狩猎季节的开始。</font></span></p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('183', '<p>据英国《每日邮报》报道，英国艺术家阿德里安&middot;格雷在海滩上利用石头创造出令人惊奇的艺术作品。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('184', '<p>当地时间8月26日，由印度尼西亚和美国科学家组成的探险小组宣布，他们利用无人遥控潜水器在对印尼苏拉威西岛附近的卡维奥巴拉特海底火山勘测时，意外发现一批新的海洋生物。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('185', '<p>2010年9月，&ldquo;机器宇航员2号&rdquo;将有可能前往国际空间站。该机器人成员的主要工作任务在于执行国际空间站中危险及重复的太空作业，以节省人手和时间使得空间站的其他宇航员可以从事其他太空研究工作</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('186', '<p>2010年6月25日世界捕鲸委员会（IWC）年度大会在摩洛哥阿迪加尔闭幕，这次原本旨在达成新的捕鲸管理法规的国际努力最终无果而终。这意味着，日本依然可以&ldquo;科研捕鲸&rdquo;的借口每年捕杀1500头鲸，其中包括在南大洋鲸类禁猎区捕鲸。日本打着&ldquo;科研捕鲸&rdquo;的幌子行&ldquo;商业捕鲸&rdquo;之实，为达到自己的商业目的、政治目的，日本面对国际反对舆论仍有自己强硬的理由，从另一个角度来看，这些&ldquo;理由&rdquo;是如此不堪一击，甚至充满了欺骗和谎言。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('187', '<p>6月23日第四十届格拉斯顿伯里音乐节在英国格拉斯顿伯里的沃西农场开幕。由奶农迈克尔&middot;伊维斯于1970年创办的音乐节，如今已成为欧洲最大的音乐节。(</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('188', '<p>2011年在全球各地逐渐揭开面纱，庆贺新年伊始是世界各国各地区的普遍习俗，各地民众纷纷以各种庆祝活动迎接新年的到来。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('189', '<p>12月29日，大连遇遇降雪和寒潮天气。据当地气象部门预报，29日至30日大连市将有中到大雪，同时伴有大风降温，此次降雪过程将是大连市今年入冬以来最强的一次降雪</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('190', 'TWSDSTWSDSTWSDSTWSDSTWSDS', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('192', 'TWSDSTWSDSTWSDSTWSDSTWSDS', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('195', '<p>　未来政策展望:我们认为明年房地产调控将更多使用货币手段，通过调整利率、<a href=\"http://bank.jrj.com.cn/list/grxd.shtml\">信贷</a>窗口指导、准备金等工具统筹应对房价上涨和通货膨胀。同时增加保障房供应，继续打击囤房、囤地，加大土地供应力度，缓解供给矛盾将是明年的另一条主线。另外，<a href=\"http://house.jrj.com.cn/\">房产</a>税试点政策明年出台的可能性也较大，如果实际政策力度符合预期，则可能引发阶段性<a href=\"http://summary.jrj.com.cn/\">行情</a>；但房产税征收范围扩大或税率较高，则对于房地产市场以及<a href=\"http://stock.jrj.com.cn/\">股票</a>市场均是较大打击。</p>\r\n<p>　　外部环境良好:我们认为，明年全年经济仍然能够保持快速增长，而<a href=\"http://forex.jrj.com.cn/list/rmbdt.shtml\">人民币</a>升 值、通货膨胀等因素对房地产均构成一定的助推作用，因此外部环境依然有利于房地产市场。l房地产市场:我们预计，房地产投资增速明年仍然可以达到 25~30%；新开工面积增速在20%~25%之间；环境较差的情况下房屋销售同比增速5%~8%；环境较好的情况下可达12%；房屋销售价格与2010 年基本持平。</p>\r\n<p>　　区域市场分化:从区域市场来看，2010年东部地区受政策影响较大，投资、新开工、销售等下滑较快，价格波动较大；但中西部地区受影响较小。我们认为由于中西部地区城镇化的加速，在明年房地产市场的大环境下，中西部地区的房地产市场较东部相对更有潜力。</p>\r\n<p>　　警惕财务风险:目前开发企业的财务状况依然可以维持。资产负债率、速动比率等硬性指标短期内比较健康。但由于2010年开发企业经营性现金流出较大，如果融资环境继续恶化或者销售回款不顺畅，则开发企业的财务状况容易迅速恶化。</p>\r\n<p>　　投资建议:2011年投资以“稳健”为主。我们推荐三类开发企业。一是实力雄厚、财务稳健的龙头型企业。第二是布局中、西部城市的开发企业。第三是布局大城市周边小城市的开发企业。<a href=\"http://share.jrj.com.cn/\">个股</a>推荐:<span><a href=\"http://stock.jrj.com.cn/cominfo/default_000002.htm\">万科A（000002）</a></span>（000002）、<span><a href=\"http://stock.jrj.com.cn/cominfo/default_600048.htm\">保利地产（600048）</a></span>（600383）、<span><a href=\"http://stock.jrj.com.cn/cominfo/default_002146.htm\">荣盛发展（002146）</a></span>（002146）l风险提示:开发企业资金回笼不畅，导致财务风险加大。</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('197', 'fdsa', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('198', 'AA', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('199', 'fdsafdsasdf', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('200', '<p>超级硬盘数据恢复软件是一款简单易用且功能强大的数据恢复软件，可以恢复被删除、被格式化、分区丢失、重新分区或者分区提示格式化的数据。采用了最新的数据扫描引擎，以只读的方式从磁盘底层读出原始的扇区数据，经过高级的数据分析算法，扫描后把丢失的目录和文件在内存中重新建立出原先的分区和原先的目录结构，数据恢复的效果非常好。<br />\r\n&nbsp;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('201', '<p>11超级硬盘数据恢复软件是一款简单易用且功能强大的数据恢复软件，可以恢复被删除、被格式化、分区丢失、重新分区或者分区提示格式化的数据。采用了最新的数据扫描引擎，以只读的方式从磁盘底层读出原始的扇区数据，经过高级的数据分析算法，扫描后把丢失的目录和文件在内存中重新建立出原先的分区和原先的目录结构，数据恢复的效果非常好。<br />\r\n&nbsp;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('202', '<p>11超级硬盘数据恢复软件是一款简单易用且功能强大的数据恢复软件，可以恢复被删除、被格式化、分区丢失、重新分区或者分区提示格式化的数据。采用了最新的数据扫描引擎，以只读的方式从磁盘底层读出原始的扇区数据，经过高级的数据分析算法，扫描后把丢失的目录和文件在内存中重新建立出原先的分区和原先的目录结构，数据恢复的效果非常好。<br />\r\n&nbsp;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('203', '<p>11超级硬盘数据恢复软件是一款简单易用且功能强大的数据恢复软件，可以恢复被删除、被格式化、分区丢失、重新分区或者分区提示格式化的数据。采用了最新的数据扫描引擎，以只读的方式从磁盘底层读出原始的扇区数据，经过高级的数据分析算法，扫描后把丢失的目录和文件在内存中重新建立出原先的分区和原先的目录结构，数据恢复的效果非常好。<br />\r\n&nbsp;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('204', '<p>11超级硬盘数据恢复软件是一款简单易用且功能强大的数据恢复软件，可以恢复被删除、被格式化、分区丢失、重新分区或者分区提示格式化的数据。采用了最新的数据扫描引擎，以只读的方式从磁盘底层读出原始的扇区数据，经过高级的数据分析算法，扫描后把丢失的目录和文件在内存中重新建立出原先的分区和原先的目录结构，数据恢复的效果非常好。<br />\r\n&nbsp;</p>', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('206', 'fdsadfs', null, null, null);
INSERT INTO `dc_content_txt` VALUES ('207', 'fdsafdaf', null, null, null);

-- ----------------------------
-- Table structure for `dc_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `dc_content_type`;
CREATE TABLE `dc_content_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL COMMENT '名称',
  `img_width` int(11) DEFAULT NULL COMMENT '图片宽',
  `img_height` int(11) DEFAULT NULL COMMENT '图片高',
  `has_image` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有图片',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容类型表';

-- ----------------------------
-- Records of dc_content_type
-- ----------------------------
INSERT INTO `dc_content_type` VALUES ('1', '普通', '100', '100', '0', '0');
INSERT INTO `dc_content_type` VALUES ('2', '图文', '143', '98', '1', '0');
INSERT INTO `dc_content_type` VALUES ('3', '焦点', '280', '200', '1', '0');
INSERT INTO `dc_content_type` VALUES ('4', '头条', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `dc_friendlink`
-- ----------------------------
DROP TABLE IF EXISTS `dc_friendlink`;
CREATE TABLE `dc_friendlink` (
  `friendlink_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_id` int(11) NOT NULL,
  `site_name` varchar(150) NOT NULL COMMENT '网站名称',
  `domain` varchar(255) NOT NULL COMMENT '网站地址',
  `logo` varchar(150) DEFAULT NULL COMMENT '图标',
  `email` varchar(100) DEFAULT NULL COMMENT '站长邮箱',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlink_id`),
  KEY `fk_jc_ctg_friendlink` (`friendlinkctg_id`),
  KEY `fk_jc_friendlink_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_friendlink` FOREIGN KEY (`friendlinkctg_id`) REFERENCES `dc_friendlink_ctg` (`friendlinkctg_id`),
  CONSTRAINT `fk_jc_friendlink_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接';

-- ----------------------------
-- Records of dc_friendlink
-- ----------------------------
INSERT INTO `dc_friendlink` VALUES ('1', '2', '1', 'DWCMS官网', 'http://www.doadway.com', '/u/cms/www/201404/260105003bl2.jpg', 'doadway@163.com', 'DWCMS是JavaEE版网站管理系统（Java Enterprise Edition Content Manage System）的简称。Java凭借其强大、稳定、安全、高效等多方面的优势，一直是企业级应用的首选。', '3', '1', '1');
INSERT INTO `dc_friendlink` VALUES ('2', '2', '1', 'DW论坛', 'http://bbs.doadway.com', '/u/cms/www/201404/260106128hdj.jpg', 'jeecms@163.com', '多维论坛', '11', '1', '10');

-- ----------------------------
-- Table structure for `dc_friendlink_ctg`
-- ----------------------------
DROP TABLE IF EXISTS `dc_friendlink_ctg`;
CREATE TABLE `dc_friendlink_ctg` (
  `friendlinkctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_name` varchar(50) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlinkctg_id`),
  KEY `fk_jc_friendlinkctg_site` (`site_id`),
  CONSTRAINT `fk_jc_friendlinkctg_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接类别';

-- ----------------------------
-- Records of dc_friendlink_ctg
-- ----------------------------
INSERT INTO `dc_friendlink_ctg` VALUES ('1', '1', '文字链接', '1');
INSERT INTO `dc_friendlink_ctg` VALUES ('7', '2', 'SDF', '2');
INSERT INTO `dc_friendlink_ctg` VALUES ('8', '2', 'QQ', '3');

-- ----------------------------
-- Table structure for `dc_function_tree`
-- ----------------------------
DROP TABLE IF EXISTS `dc_function_tree`;
CREATE TABLE `dc_function_tree` (
  `ID` varchar(36) NOT NULL DEFAULT '',
  `CODE` varchar(32) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `VIEW_TYPE` int(1) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `DESCRIPT` varchar(100) DEFAULT NULL,
  `USE_TYPE` varchar(100) DEFAULT NULL,
  `CONTENT` varchar(300) DEFAULT NULL,
  `ICON` varchar(100) DEFAULT NULL,
  `LEVEL` int(1) DEFAULT NULL,
  `CURRENT_INDEX` int(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_function_tree
-- ----------------------------
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_ad', 'dwcms_sys_ad', 'ftree_dwcms_sys_assistant_level', '2', '广告管理', '广告管理', 'URL', 'admin/assistant/advertising/v_list.do', null, '2', '5');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_ad_position', 'dwcms_sys_ad_position', 'ftree_dwcms_sys_assistant_level', '2', '广告版位', '广告版位', 'URL', 'admin/assistant/advertising_space/v_list.do', null, '2', '6');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_assistant', 'dwcms_sys_assistant', '-1', '0', '辅助', '辅助菜单', 'JS', 'loadAssistant', null, null, '12');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_assistant_level', 'ftree_dwcms_sys_assistant_level', 'ftree_dwcms_sys_assistant', '2', '辅助管理', '辅助管理', null, null, null, '1', '1');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_channel', 'dwcms_sys_channel', '-1', '0', '栏目', '后台栏目菜单', 'JSP', 'dwcms_sys/channel/channel_tree.jsp', null, null, '9');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_comment', 'dwcms_sys_comment', 'ftree_dwcms_sys_assistant_level', '2', '评论管理', '后台评论管理', 'URL', 'admin/assistant/comment/v_list.do', null, '2', '1');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_config', 'dwcms_sys_config', '-1', '0', '配置', '配置', 'JS', 'loadConfig', null, '2', '15');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_config_glob', 'dwcms_sys_config_glob', 'ftree_dwcms_sys_config_menu', '2', '系统设置', '系统设置', 'URL', 'admin/core/config/config/v_edit.do', null, '2', '1');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_config_menu', 'dwcms_sys_config_menu', 'ftree_dwcms_sys_config', '2', '配置管理', '配置管理', 'URL', null, null, '1', '1');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_content', 'dwcms_sys_content', '-1', '0', '内容', '后台内容菜单', 'JSP', 'dwcms_sys/content/content_tree.jsp', null, null, '10');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_content_replace', 'dwcms_sys_content_replace', 'ftree_dwcms_sys_maintain_menu', '2', '内容回收', '内容回收', 'URL', 'admin/core/content/v_list.do?queryStatus=recycle', null, '2', '5');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_content_type_config', 'dwcms_sys_content_type_config', 'ftree_dwcms_sys_config_menu', '2', '内容类型', '内容类型', 'URL', 'admin/core/content/contentType/v_list.do', null, '2', '4');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_friendly_link', 'dwcms_sys_friendly_link', 'ftree_dwcms_sys_assistant_level', '2', '友情链接管理', '友情链接', 'URL', '/admin/assistant/friendlink/v_list.do', null, '2', '7');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_friendly_link_type', 'dwcms_sys_friendly_link_type', 'ftree_dwcms_sys_assistant_level', '2', '友情链接类别', '友情链接类别', 'URL', '/admin/assistant/friendlink_ctg/v_list.do', null, '2', '8');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_ftp_config', 'dwcms_sys_ftp_config', 'ftree_dwcms_sys_config_menu', '2', 'FTP配置', 'FTP配置', 'URL', '/admin/core/config/ftp/v_list.do', null, '2', '5');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_guest_book', 'dwcms_sys_guest_book', 'ftree_dwcms_sys_assistant_level', '2', '留言管理', '留言管理', 'URL', '/admin/assistant/guestbook/v_list.do', null, '2', '3');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_guest_book_type', 'dwcms_sys_guest_book_type', 'ftree_dwcms_sys_assistant_level', '2', '留言类别', '留言类别', 'URL', '/admin/assistant/guestbook_ctg/v_list.do', null, '2', '4');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_index', 'dwcms_sys_index', '-1', '0', '首页', 'DWCM_后台_首页', 'JS', 'window.prent.I.I1.location=\'/admin/welcome.do\'', null, null, '8');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_keywork', 'dwcms_sys_keywork', 'ftree_dwcms_sys_maintain_menu', '2', '关键字管理', '关键字管理', 'URL', '/admin/maintain/keyword/v_list.do', null, '2', '3');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_log', 'dwcms_sys_log', 'ftree_dwcms_sys_user_menu', '2', '日志', '日志', 'URL', 'admin/core/member/log/v_list.do', null, '2', '5');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_maintain', 'dwcms_sys_maintain', '-1', '0', '维护', '维护', 'JS', 'maintain.do', null, '2', '13');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_maintain_menu', 'dwcms_sys_maintain_menu', 'ftree_dwcms_sys_maintain', '2', '维护管理', '维护管理', 'URL', null, null, '1', '1');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_manager', 'dwcms_sys_manager', 'ftree_dwcms_sys_user_menu', '2', '管理员', '管理员', 'URL', 'admin/core/member/manager/v_list.do', null, '2', '3');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_model_config', 'dwcms_sys_model_config', 'ftree_dwcms_sys_config_menu', '2', '模型管理', '模型管理', 'URL', 'admin/core/config/model/v_list.do', null, '2', '3');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_resource', 'dwcms_sys_resource', '-1', '0', '资源', '后台资源管理菜单', 'JSP', 'dwcms_sys/resource/res_tree.jsp', null, null, '12');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_role', 'dwcms_sys_role', 'ftree_dwcms_sys_user_menu', '2', '角色', '角色管理', 'URL', 'admin/core/member/role/v_list.do', null, '2', '4');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_sensitivity', 'dwcms_sys_sensitivity', 'ftree_dwcms_sys_maintain_menu', '2', '敏感词管理', '敏感词管理', 'URL', '/admin/maintain/sensitivity/v_list.do', null, '2', '4');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_tag', 'dwcms_sys_tag', 'ftree_dwcms_sys_maintain_menu', '2', 'TAG管理', 'TAG管理', 'URL', '/admin/core/tag/v_list.do', null, '2', '2');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_template', 'dwcms_sys_template', '-1', '0', '模板', '后台模板管理菜单', 'JSP', 'dwcms_sys/template/template_tree.jsp', null, null, '11');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_topic', 'dwcms_sys_topic', 'ftree_dwcms_sys_maintain_menu', '2', '主题管理', '主题管理', 'URL', '/admin/maintain/topic/v_list.do', null, '2', '1');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_updateInfo', 'dwcms_sys_updateInfo', 'ftree_dwcms_sys_welcome_index', '2', '修改个人资料', '修改个人资料', 'URL', '/admin/profile.do', null, '2', '2');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_user', 'dwcms_sys_user', '-1', '0', '用户', '用户菜单', 'JS', 'loadUserMenu', null, '2', '14');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_user_group', 'dwcms_sys_user_group', 'ftree_dwcms_sys_user_menu', '2', '用户组管理', '用户组管理', 'URL', 'admin/core/member/group/v_list.do', null, '2', '2');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_user_menu', 'dwcms_sys_user_menu', 'ftree_dwcms_sys_user', '2', '用户管理', '用户管理', 'URL', '', null, '1', '1');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_user_user', 'dwcms_sys_user_user', 'ftree_dwcms_sys_user_menu', '2', '用户管理', '用户管理菜单项', 'URL', 'admin/core/member/user/v_list.do', null, '2', '1');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_vote', 'dwcms_sys_vote', 'ftree_dwcms_sys_assistant_level', '2', '投票管理', '投票管理', 'URL', 'admin/assistant/vote/v_list.do', null, '2', '2');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_website_config', 'dwcms_sys_website_config', 'ftree_dwcms_sys_config_menu', '2', '站点设置', '站点设置', 'URL', 'admin/core/config/site/v_edit.do', null, '2', '2');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_website_manager', 'dwcms_sys_website_manager', 'ftree_dwcms_sys_config_menu', '2', '站点管理', '站点管理', 'URL', 'admin/core/config/site/v_list.do', null, '2', '6');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_welcome', 'dwcms_sys_welcome', 'ftree_dwcms_sys_welcome_index', '2', '欢迎页面', '后台欢迎页面', 'URL', 'dwcms_sys/index/welcome.jsp', null, '2', '2');
INSERT INTO `dc_function_tree` VALUES ('ftree_dwcms_sys_welcome_index', 'dwcms_sys_welcome_index', 'ftree_dwcms_sys_index', '2', '欢迎菜单', '欢迎', '', 'welcome.do', null, '1', '1');

-- ----------------------------
-- Table structure for `dc_group`
-- ----------------------------
DROP TABLE IF EXISTS `dc_group`;
CREATE TABLE `dc_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `need_captcha` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要验证码',
  `need_check` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要审核',
  `allow_per_day` int(11) NOT NULL DEFAULT '4096' COMMENT '每日允许上传KB',
  `allow_max_file` int(11) NOT NULL DEFAULT '1024' COMMENT '每个文件最大KB',
  `allow_suffix` varchar(255) DEFAULT 'jpg,jpeg,gif,png,bmp' COMMENT '允许上传的后缀',
  `is_reg_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认会员组',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='CMS会员组表';

-- ----------------------------
-- Records of dc_group
-- ----------------------------
INSERT INTO `dc_group` VALUES ('1', '普通会员', '13', '0', '0', '1024', '1024', 'jpg,jpeg,gif,png,bmp', '0');
INSERT INTO `dc_group` VALUES ('2', '高级组', '12', '1', '1', '0', '0', '', '1');
INSERT INTO `dc_group` VALUES ('3', 'fda', '12', '1', '1', '12', '12', 'jpg,jpeg,gif,png,bmp', '0');
INSERT INTO `dc_group` VALUES ('7', '百度', '13', '0', '0', '1024', '2048', 'jpg,jpeg,gif,png,bmp', '0');

-- ----------------------------
-- Table structure for `dc_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `dc_guestbook`;
CREATE TABLE `dc_guestbook` (
  `guestbook_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `guestbookctg_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '留言会员',
  `admin_id` int(11) DEFAULT NULL COMMENT '回复管理员',
  `ip` varchar(50) NOT NULL COMMENT '留言IP',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `replay_time` datetime DEFAULT NULL COMMENT '回复时间',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`guestbook_id`),
  KEY `fk_jc_ctg_guestbook` (`guestbookctg_id`),
  KEY `fk_jc_guestbook_admin` (`admin_id`),
  KEY `fk_jc_guestbook_member` (`member_id`),
  KEY `fk_jc_guestbook_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_guestbook` FOREIGN KEY (`guestbookctg_id`) REFERENCES `dc_guestbook_ctg` (`guestbookctg_id`),
  CONSTRAINT `fk_jc_guestbook_admin` FOREIGN KEY (`admin_id`) REFERENCES `dc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_member` FOREIGN KEY (`member_id`) REFERENCES `dc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS留言';

-- ----------------------------
-- Records of dc_guestbook
-- ----------------------------
INSERT INTO `dc_guestbook` VALUES ('1', '2', '1', '1', null, '127.0.0.1', '2014-04-25 01:30:50', null, '1', '1');
INSERT INTO `dc_guestbook` VALUES ('2', '1', '1', '1', null, '192.168.0.1', '2011-01-04 14:45:45', null, '0', '0');
INSERT INTO `dc_guestbook` VALUES ('3', '2', '2', '1', null, '127.0.0.1', '2014-04-27 17:46:50', null, '0', '0');
INSERT INTO `dc_guestbook` VALUES ('4', '2', '3', '1', null, '127.0.0.1', '2014-04-27 17:46:05', null, '0', '0');

-- ----------------------------
-- Table structure for `dc_guestbook_ctg`
-- ----------------------------
DROP TABLE IF EXISTS `dc_guestbook_ctg`;
CREATE TABLE `dc_guestbook_ctg` (
  `guestbookctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ctg_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`guestbookctg_id`),
  KEY `fk_jc_guestbookctg_site` (`site_id`),
  CONSTRAINT `fk_jc_guestbookctg_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='CMS留言类别';

-- ----------------------------
-- Records of dc_guestbook_ctg
-- ----------------------------
INSERT INTO `dc_guestbook_ctg` VALUES ('1', '1', '普通', '1', '普通留言');
INSERT INTO `dc_guestbook_ctg` VALUES ('2', '2', '12', '10', 'fdas');
INSERT INTO `dc_guestbook_ctg` VALUES ('3', '2', 'OK', '10', '12fds');

-- ----------------------------
-- Table structure for `dc_guestbook_ext`
-- ----------------------------
DROP TABLE IF EXISTS `dc_guestbook_ext`;
CREATE TABLE `dc_guestbook_ext` (
  `guestbook_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `content` longtext COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  KEY `fk_jc_ext_guestbook` (`guestbook_id`),
  CONSTRAINT `fk_jc_ext_guestbook` FOREIGN KEY (`guestbook_id`) REFERENCES `dc_guestbook` (`guestbook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS留言内容';

-- ----------------------------
-- Records of dc_guestbook_ext
-- ----------------------------
INSERT INTO `dc_guestbook_ext` VALUES ('1', '湖南未来一周仍维持低温雨雪天气', '湖南未来一周仍维持低温雨雪天气', '', '', '', '');
INSERT INTO `dc_guestbook_ext` VALUES ('2', '范冰冰退出娱乐圈', '范冰冰退出娱乐圈', null, '12', '3', '321');
INSERT INTO `dc_guestbook_ext` VALUES ('3', 'DWCMS v1.0.2正式版发布', '终于发布了', '', '321', '3', '321');
INSERT INTO `dc_guestbook_ext` VALUES ('4', '多重压力将影响整体衣柜发展', '据悉，2010年下半年以来，衣柜企业整体销售形势不容乐观。不少企业下滑幅度高达60%，在一些主流卖场里，即使排名前十名的企业也未必能盈利。在这种情况下，企业纷纷打出了涨价牌，实属无奈之举。', '', '321', '321', '321');

-- ----------------------------
-- Table structure for `dc_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `dc_keyword`;
CREATE TABLE `dc_keyword` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '站点ID',
  `keyword_name` varchar(100) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`keyword_id`),
  KEY `fk_jc_keyword_site` (`site_id`),
  CONSTRAINT `fk_jc_keyword_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS内容关键词表';

-- ----------------------------
-- Records of dc_keyword
-- ----------------------------
INSERT INTO `dc_keyword` VALUES ('1', null, '内容管理系统', '<a href=\"http://www.doadway.com/\" target=\"_blank\">内容管理系统</a>', '0');

-- ----------------------------
-- Table structure for `dc_log`
-- ----------------------------
DROP TABLE IF EXISTS `dc_log`;
CREATE TABLE `dc_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL COMMENT '日志类型',
  `log_time` datetime NOT NULL COMMENT '日志时间',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `title` varchar(255) DEFAULT NULL COMMENT '日志标题',
  `content` varchar(255) DEFAULT NULL COMMENT '日志内容',
  PRIMARY KEY (`log_id`),
  KEY `fk_jc_log_site` (`site_id`),
  KEY `fk_jc_log_user` (`user_id`),
  CONSTRAINT `fk_jc_log_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`),
  CONSTRAINT `fk_jc_log_user` FOREIGN KEY (`user_id`) REFERENCES `dc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=522 DEFAULT CHARSET=utf8 COMMENT='CMS日志表';

-- ----------------------------
-- Records of dc_log
-- ----------------------------
INSERT INTO `dc_log` VALUES ('1', '1', null, '1', '2011-06-04 14:45:30', '127.0.0.1', '/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('2', '1', '1', '3', '2011-06-04 14:47:34', '127.0.0.1', '/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=189;title=大连遭遇强降雪和寒潮天气');
INSERT INTO `dc_log` VALUES ('3', '1', '1', '3', '2011-06-04 14:48:44', '127.0.0.1', '/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=189;title=大连遭遇强降雪和寒潮天气');
INSERT INTO `dc_log` VALUES ('4', null, null, '2', '2011-06-04 14:49:09', '127.0.0.1', '/jeeadmin/jeecms/login.do', '登录失败', 'username=admin;password=password');
INSERT INTO `dc_log` VALUES ('5', '1', null, '1', '2011-06-04 14:49:12', '127.0.0.1', '/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('6', '1', '1', '3', '2011-06-04 14:49:50', '127.0.0.1', '/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=10;name=关于我们');
INSERT INTO `dc_log` VALUES ('7', '1', '1', '3', '2011-06-04 14:49:55', '127.0.0.1', '/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=10;name=关于我们');
INSERT INTO `dc_log` VALUES ('8', '1', '1', '3', '2011-06-04 14:50:36', '127.0.0.1', '/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=2;username=korven');
INSERT INTO `dc_log` VALUES ('9', '1', '1', '3', '2011-06-04 14:50:44', '127.0.0.1', '/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=2;username=korven');
INSERT INTO `dc_log` VALUES ('10', '1', '1', '3', '2011-06-04 14:51:00', '127.0.0.1', '/jeeadmin/jeecms/admin_local/o_save.do', '增加用户', 'id=3;username=korven');
INSERT INTO `dc_log` VALUES ('11', '1', '1', '3', '2011-06-04 14:51:10', '127.0.0.14', '/jeeadmin/jeecms/admin_local/o_update.do', '修改用户', 'id=3;username=korven');
INSERT INTO `dc_log` VALUES ('12', '1', '1', '3', '2011-06-04 14:51:15', '127.0.0.15', '/jeeadmin/jeecms/admin_local/o_update.do', '修改用户', 'id=3;username=korven');
INSERT INTO `dc_log` VALUES ('13', '1', '1', '3', '2011-06-04 14:51:18', '127.0.0.13', '/jeeadmin/jeecms/admin_local/o_delete.do', '删除用户', 'id=3;username=korven');
INSERT INTO `dc_log` VALUES ('14', '1', '1', '3', '2011-06-04 14:52:08', '127.0.0.12', '/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=40;title=null');
INSERT INTO `dc_log` VALUES ('15', '1', '1', '3', '2011-06-04 14:52:13', '127.0.0.11', '/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=40;name=11');
INSERT INTO `dc_log` VALUES ('16', '1', '1', '3', '2011-06-04 14:52:15', '127.0.0.11', '/jeeadmin/jeecms/channel/o_delete.do', '删除栏目', 'id=40;title=22');
INSERT INTO `dc_log` VALUES ('17', '1', null, '1', '2011-06-04 15:22:42', '127.0.0.1', '/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('18', '1', null, '1', '2011-06-04 15:22:55', '127.0.0.1', '/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('19', '1', '1', '3', '2011-06-04 15:23:35', '127.0.0.1', '/jeeadmin/jeecms/advertising_space/o_save.do', '增加广告版位', 'id=1;name=页头banner');
INSERT INTO `dc_log` VALUES ('20', '1', '1', '3', '2011-06-04 15:24:53', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_save.do', '增加广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('21', '1', '1', '3', '2011-06-04 15:25:28', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('22', '1', '1', '3', '2011-06-04 15:26:04', '127.0.0.1', '/jeeadmin/jeecms/friendlink_ctg/o_save.do', '增加友情链接类别', 'id=1;name=文字链接');
INSERT INTO `dc_log` VALUES ('23', '1', '1', '3', '2011-06-04 15:26:08', '127.0.0.1', '/jeeadmin/jeecms/friendlink_ctg/o_update.do', '修改友情链接类别', null);
INSERT INTO `dc_log` VALUES ('24', '1', '1', '3', '2011-06-04 15:26:56', '127.0.0.1', '/jeeadmin/jeecms/friendlink/o_save.do', '增加友情链接', 'id=1;name=JEECMS官网');
INSERT INTO `dc_log` VALUES ('25', '1', '1', '3', '2011-06-04 15:28:24', '127.0.0.1', '/jeeadmin/jeecms/friendlink/o_update.do', '修改友情链接', 'id=1;name=JEECMS官网');
INSERT INTO `dc_log` VALUES ('26', '1', '1', '3', '2011-06-04 15:29:21', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/首页.html');
INSERT INTO `dc_log` VALUES ('27', '1', '1', '3', '2011-06-04 15:29:52', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/首页.html');
INSERT INTO `dc_log` VALUES ('28', '1', '1', '3', '2011-06-04 15:31:05', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/首页.html');
INSERT INTO `dc_log` VALUES ('29', '1', '1', '3', '2011-06-04 15:32:05', '127.0.0.1', '/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=186;title=谎言：日本科研捕鲸');
INSERT INTO `dc_log` VALUES ('30', '1', '1', '3', '2011-06-04 15:32:37', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/首页.html');
INSERT INTO `dc_log` VALUES ('31', '1', '1', '3', '2011-06-04 15:40:57', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/首页.html');
INSERT INTO `dc_log` VALUES ('32', '1', '1', '3', '2011-06-04 15:41:16', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/首页.html');
INSERT INTO `dc_log` VALUES ('33', '1', null, '1', '2011-06-04 15:43:05', '127.0.0.1', '/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('34', '1', '1', '3', '2011-06-04 15:59:43', '127.0.0.1', '/jeeadmin/jeecms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `dc_log` VALUES ('35', '1', '1', '3', '2011-06-04 16:05:19', '127.0.0.1', '/jeeadmin/jeecms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `dc_log` VALUES ('36', '1', '1', '3', '2011-06-04 16:10:15', '127.0.0.1', '/jeeadmin/jeecms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `dc_log` VALUES ('37', '1', '1', '3', '2011-06-04 16:13:31', '127.0.0.1', '/jeeadmin/jeecms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `dc_log` VALUES ('38', '1', '1', '3', '2011-06-04 16:16:55', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/member/会员登录页.html');
INSERT INTO `dc_log` VALUES ('39', '1', '1', '3', '2011-06-04 16:29:11', '127.0.0.1', '/jeeadmin/jeecms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `dc_log` VALUES ('40', '1', null, '1', '2011-06-06 15:22:59', '127.0.0.1', '/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('41', '1', '1', '3', '2011-06-06 15:30:02', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/include/页头导航栏.html');
INSERT INTO `dc_log` VALUES ('42', '1', '1', '3', '2011-06-06 15:34:31', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/index/首页.html');
INSERT INTO `dc_log` VALUES ('43', '1', '1', '3', '2011-06-06 15:34:39', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/index/首页.html');
INSERT INTO `dc_log` VALUES ('44', '1', '1', '3', '2011-06-06 15:34:52', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/index/首页.html');
INSERT INTO `dc_log` VALUES ('45', '1', '1', '3', '2011-06-06 15:39:48', '127.0.0.1', '/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=广告');
INSERT INTO `dc_log` VALUES ('46', '1', '1', '3', '2011-06-06 15:40:07', '127.0.0.1', '/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=广告版位');
INSERT INTO `dc_log` VALUES ('47', '1', '1', '3', '2011-06-06 15:40:26', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/index/首页.html');
INSERT INTO `dc_log` VALUES ('48', '1', null, '1', '2011-06-06 16:51:33', '127.0.0.1', '/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('49', '1', '1', '3', '2011-06-06 16:51:49', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/include/页头导航栏.html');
INSERT INTO `dc_log` VALUES ('50', '1', '1', '3', '2011-06-06 16:52:17', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('51', '1', '1', '3', '2011-06-06 16:52:25', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('52', '1', '1', '3', '2011-06-06 16:53:00', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/include/页头导航栏.html');
INSERT INTO `dc_log` VALUES ('53', '1', '1', '3', '2011-06-06 16:53:10', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/include/页头导航栏.html');
INSERT INTO `dc_log` VALUES ('54', '1', '1', '3', '2011-06-06 16:53:23', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('55', '1', '1', '3', '2011-06-06 16:53:33', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('56', '1', '1', '3', '2011-06-06 16:53:45', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('57', '1', '1', '3', '2011-06-06 16:53:55', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('58', '1', '1', '3', '2011-06-06 16:54:06', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('59', '1', '1', '3', '2011-06-06 16:54:20', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('60', '1', '1', '3', '2011-06-06 16:54:29', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('61', '1', '1', '3', '2011-06-06 16:56:14', '127.0.0.1', '/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/red/css/layout.css');
INSERT INTO `dc_log` VALUES ('62', '1', '1', '3', '2011-06-06 16:56:42', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('63', '1', '1', '3', '2011-06-06 16:57:39', '127.0.0.1', '/jeeadmin/jeecms/resource/o_update.do', '修改资源', 'filename=/r/cms/www/red/css/layout.css');
INSERT INTO `dc_log` VALUES ('64', '1', '1', '3', '2011-06-06 16:58:01', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('65', '1', '1', '3', '2011-06-06 17:01:42', '127.0.0.1', '/jeeadmin/jeecms/advertising_space/o_save.do', '增加广告版位', 'id=2;name=横条广告');
INSERT INTO `dc_log` VALUES ('66', '1', '1', '3', '2011-06-06 17:02:53', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_save.do', '增加广告', 'id=2;name=通栏广告1');
INSERT INTO `dc_log` VALUES ('67', '1', '1', '3', '2011-06-06 17:03:12', '127.0.0.1', '/jeeadmin/jeecms/advertising_space/o_update.do', '修改广告版位', 'id=2;name=通栏广告');
INSERT INTO `dc_log` VALUES ('68', '1', '1', '3', '2011-06-06 17:13:02', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/index/首页.html');
INSERT INTO `dc_log` VALUES ('69', '1', '1', '3', '2011-06-06 17:13:51', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=2;name=通栏广告1');
INSERT INTO `dc_log` VALUES ('70', '1', '1', '3', '2011-06-06 17:15:25', '127.0.0.1', '/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=1;name=banner');
INSERT INTO `dc_log` VALUES ('71', '1', '1', '3', '2011-06-06 17:18:34', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/channel/新闻栏目_父级.html');
INSERT INTO `dc_log` VALUES ('72', '1', '1', '3', '2011-06-06 17:18:59', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/channel/新闻栏目.html');
INSERT INTO `dc_log` VALUES ('73', '1', '1', '3', '2011-06-06 17:22:14', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/content/新闻内容.html');
INSERT INTO `dc_log` VALUES ('74', '1', '1', '3', '2011-06-06 17:27:45', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/include/页脚友情链接栏.html');
INSERT INTO `dc_log` VALUES ('75', '1', '1', '3', '2011-06-06 17:28:59', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/include/页脚友情链接栏.html');
INSERT INTO `dc_log` VALUES ('76', '1', '1', '3', '2011-06-06 17:30:37', '127.0.0.1', '/jeeadmin/jeecms/friendlink/o_save.do', '增加友情链接', 'id=2;name=JEEBBS论坛');
INSERT INTO `dc_log` VALUES ('77', '1', null, '1', '2011-06-06 21:43:07', '127.0.0.1', '/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('78', '1', '1', '3', '2011-06-06 21:44:10', '127.0.0.1', '/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=找回密码结果页');
INSERT INTO `dc_log` VALUES ('79', '1', '1', '3', '2011-06-06 21:44:29', '127.0.0.1', '/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=找回密码输入页');
INSERT INTO `dc_log` VALUES ('80', '1', '1', '3', '2011-06-06 21:46:38', '127.0.0.1', '/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=密码重置页');
INSERT INTO `dc_log` VALUES ('81', '1', null, '1', '2011-06-06 21:47:27', '127.0.0.1', '/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('82', '1', '1', '3', '2011-06-06 21:49:09', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/csi/会员登录.html');
INSERT INTO `dc_log` VALUES ('83', '1', '1', '3', '2011-06-06 21:49:50', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/csi/会员登录.html');
INSERT INTO `dc_log` VALUES ('84', '1', '1', '3', '2011-06-06 22:03:36', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/member/找回密码输入页.html');
INSERT INTO `dc_log` VALUES ('85', '1', '1', '3', '2011-06-06 22:11:48', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/member/找回密码输入页.html');
INSERT INTO `dc_log` VALUES ('86', '1', '1', '3', '2011-06-06 22:20:52', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/member/找回密码结果页.html');
INSERT INTO `dc_log` VALUES ('87', '1', null, '1', '2011-06-06 23:01:32', '127.0.0.1', '/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('88', '1', '1', '3', '2011-06-06 23:01:51', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/member/找回密码结果页.html');
INSERT INTO `dc_log` VALUES ('89', '1', '1', '3', '2011-06-06 23:03:10', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/member/找回密码结果页.html');
INSERT INTO `dc_log` VALUES ('90', '1', '1', '3', '2011-06-06 23:08:17', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/member/密码重置页.html');
INSERT INTO `dc_log` VALUES ('91', '1', '1', '3', '2011-06-06 23:09:01', '127.0.0.1', '/jeeadmin/jeecms/template/o_update.do', '修改模板', 'filename=/WEB-INF/t/cms/www/red/member/密码重置页.html');
INSERT INTO `dc_log` VALUES ('92', '1', null, '1', '2011-06-07 00:00:55', '127.0.0.1', '/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('93', '1', '1', '3', '2011-06-07 00:01:49', '127.0.0.1', '/jeeadmin/jeecms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `dc_log` VALUES ('94', '1', null, '1', '2011-06-07 08:22:33', '127.0.0.1', '/jeecms310/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('95', '1', '1', '3', '2011-06-07 08:22:44', '127.0.0.1', '/jeecms310/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', null);
INSERT INTO `dc_log` VALUES ('96', '1', '1', '3', '2011-06-07 08:23:48', '127.0.0.1', '/jeecms310/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', null);
INSERT INTO `dc_log` VALUES ('97', '1', '1', '3', '2011-06-07 08:23:58', '127.0.0.1', '/jeecms310/jeeadmin/jeecms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `dc_log` VALUES ('98', '1', null, '1', '2013-09-18 23:53:01', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('100', null, null, '2', '2013-10-01 20:59:49', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录失败', 'username=admin;password=A45115517');
INSERT INTO `dc_log` VALUES ('101', null, null, '2', '2013-10-01 21:00:02', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录失败', 'username=admin;password=password');
INSERT INTO `dc_log` VALUES ('102', null, null, '2', '2013-10-01 21:00:13', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录失败', 'username=admin;password=A45115517');
INSERT INTO `dc_log` VALUES ('103', null, null, '2', '2013-10-01 21:00:36', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录失败', 'username=admin;password=password');
INSERT INTO `dc_log` VALUES ('104', null, null, '2', '2013-10-01 21:07:02', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录失败', 'username=admin;password=password');
INSERT INTO `dc_log` VALUES ('109', '1', null, '1', '2013-10-01 22:00:50', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('110', '1', null, '1', '2013-10-01 22:45:04', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('111', '1', null, '1', '2013-10-04 15:07:10', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('112', '1', null, '1', '2013-10-04 16:18:16', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('113', '1', null, '1', '2013-10-04 22:13:45', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('114', '1', null, '1', '2013-10-12 22:49:10', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('116', '1', null, '1', '2013-10-12 22:52:18', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('117', '1', null, '1', '2013-10-13 17:55:11', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('118', '1', null, '1', '2013-10-14 21:59:43', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('119', '1', null, '1', '2013-10-14 22:02:45', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('120', '1', '1', '3', '2013-10-14 22:42:00', '127.0.0.1', '/jcms/jeeadmin/jeecms/ftp/o_save.do', '增加FTP', 'id=1;name=tt');
INSERT INTO `dc_log` VALUES ('121', '1', null, '1', '2013-10-15 21:28:25', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('122', '1', null, '1', '2013-10-16 22:16:40', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('123', '1', null, '1', '2013-10-17 23:15:07', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('124', '1', null, '1', '2013-10-23 21:34:41', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('125', '1', null, '1', '2013-10-25 22:51:21', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('132', '1', null, '1', '2013-11-04 22:42:49', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('133', '1', null, '1', '2013-11-05 20:59:58', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('134', '1', null, '1', '2013-11-09 22:31:53', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('135', '1', null, '1', '2013-11-09 23:30:11', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('136', '1', null, '1', '2013-11-10 22:38:06', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('137', '1', null, '1', '2013-11-10 23:08:25', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('138', '1', null, '1', '2013-11-14 21:07:41', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('139', '1', null, '1', '2013-11-14 21:58:42', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('140', '1', null, '1', '2013-11-23 23:57:18', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('141', '1', null, '1', '2013-11-24 00:21:26', '127.0.0.1', '/jcms/jeeadmin/jeecms/login.do', '登录成功', null);
INSERT INTO `dc_log` VALUES ('142', '1', '1', '3', '2013-11-24 00:48:44', '127.0.0.1', '/jcms/jeeadmin/jeecms/ftp/o_delete.do', '删除FTP', 'id=1;name=tt');
INSERT INTO `dc_log` VALUES ('498', '1', null, '1', '2014-05-14 18:22:23', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('499', '1', null, '1', '2014-05-14 18:23:04', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('500', '1', null, '1', '2014-05-14 18:34:00', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('501', '1', null, '1', '2014-05-14 18:34:08', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('502', '1', null, '1', '2014-05-14 18:34:14', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('503', '1', null, '1', '2014-05-14 18:40:07', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('504', '1', null, '1', '2014-05-14 18:53:49', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('505', '1', null, '3', '2014-05-14 18:54:54', '127.0.0.1', '/dwcms//admin/core/template/o_swfupload.do', '上传模板文件', 'filename=/t/cms/www/\\about-us.html');
INSERT INTO `dc_log` VALUES ('506', '1', null, '3', '2014-05-14 18:56:38', '127.0.0.1', '/dwcms//admin/core/template/o_swfupload.do', '上传模板文件', 'filename=/t/cms/www/\\news.html');
INSERT INTO `dc_log` VALUES ('507', '1', null, '3', '2014-05-14 18:59:10', '127.0.0.1', '/dwcms//admin/core/template/o_swfupload.do', '上传模板文件', 'filename=/t/cms/www/\\typography.html');
INSERT INTO `dc_log` VALUES ('508', '1', null, '3', '2014-05-14 18:59:30', '127.0.0.1', '/dwcms//admin/core/template/o_swfupload.do', '上传模板文件', 'filename=/t/cms/www/\\testimonials.html');
INSERT INTO `dc_log` VALUES ('509', '1', null, '3', '2014-05-14 19:03:01', '127.0.0.1', '/dwcms//admin/core/template/o_swfupload.do', '上传模板文件', 'filename=/t/cms/www/\\typography.html');
INSERT INTO `dc_log` VALUES ('510', '1', null, '3', '2014-05-14 19:03:27', '127.0.0.1', '/dwcms//admin/core/template/o_swfupload.do', '上传模板文件', 'filename=/t/cms/www/\\testimonials.html');
INSERT INTO `dc_log` VALUES ('511', '1', null, '3', '2014-05-14 19:04:27', '127.0.0.1', '/dwcms//admin/core/res/o_swfupload.do', '上传资源文件', 'filename=/r/cms/www/red\\typography.html');
INSERT INTO `dc_log` VALUES ('512', '1', null, '3', '2014-05-14 19:14:00', '127.0.0.1', '/dwcms//admin/core/template/o_swfupload.do', '上传模板文件', 'filename=/t/cms/www/\\team.html');
INSERT INTO `dc_log` VALUES ('513', '1', null, '1', '2014-05-14 23:23:37', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('514', '1', null, '1', '2014-05-14 23:39:58', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('515', '1', null, '1', '2014-05-15 00:24:49', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('516', '1', null, '1', '2014-05-16 23:31:43', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('517', '1', null, '1', '2014-05-18 12:43:19', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('518', '1', null, '1', '2014-05-18 23:23:18', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('519', '1', null, '1', '2014-05-20 18:49:10', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('520', '1', null, '1', '2014-05-26 22:45:51', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);
INSERT INTO `dc_log` VALUES ('521', '1', null, '1', '2014-05-29 22:46:12', '127.0.0.1', '/dwcms/login.do', '登陆成功', null);

-- ----------------------------
-- Table structure for `dc_model`
-- ----------------------------
DROP TABLE IF EXISTS `dc_model`;
CREATE TABLE `dc_model` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL COMMENT '名称',
  `model_path` varchar(100) NOT NULL COMMENT '路径',
  `tpl_channel_prefix` varchar(20) DEFAULT NULL COMMENT '栏目模板前缀',
  `tpl_content_prefix` varchar(20) DEFAULT NULL COMMENT '内容模板前缀',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '栏目标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '栏目标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '栏目内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '栏目内容图高度',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认模型',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS模型表';

-- ----------------------------
-- Records of dc_model
-- ----------------------------
INSERT INTO `dc_model` VALUES ('1', '新闻', '1', '新闻栏目', '新闻内容', '139', '139', '310', '310', '2', '1', '0', '0');
INSERT INTO `dc_model` VALUES ('2', '单页', '2', '单页', '', '139', '139', '310', '310', '2', '0', '0', '0');
INSERT INTO `dc_model` VALUES ('3', '作品', '3', '作品栏目', '作品内容', '139', '139', '310', '310', '3', '1', '0', '0');
INSERT INTO `dc_model` VALUES ('4', '下载', '4', '下载栏目', '下载内容', '139', '139', '310', '310', '4', '1', '0', '1');
INSERT INTO `dc_model` VALUES ('11', 'fd', 'sdf', 'fds', 'fdsa', '121', '121', '121', '121', '11', '0', '0', '0');

-- ----------------------------
-- Table structure for `dc_model_item`
-- ----------------------------
DROP TABLE IF EXISTS `dc_model_item`;
CREATE TABLE `dc_model_item` (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `item_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '70' COMMENT '排列顺序',
  `def_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT '1' COMMENT '数据类型',
  `is_single` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否独占一行',
  `is_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否栏目模型项',
  `is_custom` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否自定义',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`modelitem_id`),
  KEY `fk_jc_item_model` (`model_id`),
  CONSTRAINT `fk_jc_item_model` FOREIGN KEY (`model_id`) REFERENCES `dc_model` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='CMS模型项表';

-- ----------------------------
-- Records of dc_model_item
-- ----------------------------
INSERT INTO `dc_model_item` VALUES ('2', '1', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '1', '1', '0', '0');
INSERT INTO `dc_model_item` VALUES ('3', '1', 'title', 'meta标题', '11', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('4', '1', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '0');
INSERT INTO `dc_model_item` VALUES ('5', '1', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('6', '1', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('7', '1', 'tplContent', '内容模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('8', '1', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('9', '1', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('10', '1', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('11', '1', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('12', '1', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('13', '1', 'finalStep', '终审级别', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('14', '1', 'afterCheck', '审核后', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('15', '1', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('16', '1', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('17', '1', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('18', '1', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('19', '1', 'userIds', '管理权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('20', '1', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('21', '1', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('22', '1', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '0');
INSERT INTO `dc_model_item` VALUES ('23', '1', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '0');
INSERT INTO `dc_model_item` VALUES ('24', '1', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('25', '1', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('26', '1', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('27', '1', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('28', '1', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('29', '1', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('30', '1', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('31', '1', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('32', '1', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('33', '1', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('34', '1', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('35', '1', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('36', '1', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('37', '1', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('38', '1', 'attachments', '附件', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('39', '1', 'media', '多媒体', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('40', '1', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('41', '1', 'pictures', '图片集', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('42', '2', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('43', '2', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('44', '2', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('45', '2', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('46', '2', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('47', '2', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('48', '2', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('49', '2', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('50', '2', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('51', '2', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('52', '2', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('53', '2', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('54', '3', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('55', '3', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('56', '3', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('57', '3', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('58', '3', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('59', '3', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('60', '3', 'tplContent', '内容模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('61', '3', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('62', '3', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('63', '3', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('64', '3', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('65', '3', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('66', '3', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('67', '3', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('68', '3', 'userIds', '管理权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('69', '3', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('70', '3', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('73', '3', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('74', '3', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('75', '3', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('76', '3', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('77', '3', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('78', '3', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('79', '3', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('80', '3', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('81', '3', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('82', '3', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('83', '3', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('84', '3', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('85', '3', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('86', '3', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('87', '3', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('88', '3', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('89', '3', 'attachments', '附件', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('90', '3', 'media', '多媒体', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('91', '3', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('92', '3', 'pictures', '图片集', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('93', '4', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('94', '4', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('95', '4', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('96', '4', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('97', '4', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('98', '4', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('99', '4', 'tplContent', '内容模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('100', '4', 'priority', '排列顺序', '10', '', '', '', '', '', '', '', '3', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('101', '4', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('102', '4', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('103', '4', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('104', '4', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('105', '4', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('106', '4', 'userIds', '管理权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `dc_model_item` VALUES ('107', '4', 'channelId', '栏目', '1', null, null, null, null, null, null, null, '6', '1', '0', '0', '0');
INSERT INTO `dc_model_item` VALUES ('108', '4', 'title', '软件名称', '2', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('109', '4', 'shortTitle', '软件简称', '3', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('110', '4', 'titleColor', '标题颜色', '4', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('111', '4', 'description', '摘要', '5', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('112', '4', 'author', '发布人', '6', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('113', '4', 'viewGroupIds', '浏览权限', '7', null, null, null, null, null, null, null, '7', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('114', '4', 'topLevel', '固顶级别', '8', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('115', '4', 'releaseDate', '发布时间', '9', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('116', '4', 'typeId', '内容类型', '21', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('117', '4', 'tplContent', '指定模板', '22', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('118', '4', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('119', '4', 'attachments', '软件上传', '11', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('120', '4', 'txt', '软件介绍', '20', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `dc_model_item` VALUES ('121', '4', 'softType', '软件类型', '12', '国产软件', '国产软件,国外软件', '100', '3', '30', null, null, '6', '0', '0', '1', '1');
INSERT INTO `dc_model_item` VALUES ('122', '4', 'warrant', '软件授权', '13', '免费版', '免费版,共享版', '', '3', '30', '', '', '6', '0', '0', '1', '1');
INSERT INTO `dc_model_item` VALUES ('123', '4', 'relatedLink', '相关链接', '14', 'http://', '', '50', '3', '30', '', '', '1', '0', '0', '1', '1');
INSERT INTO `dc_model_item` VALUES ('124', '4', 'demoUrl', '演示地址', '15', 'http://', null, '60', '3', '30', null, null, '1', '0', '0', '1', '1');
INSERT INTO `dc_model_item` VALUES ('125', '11', 'fda', 'fdas', '11', '11', '12', '', '1', '1', 'fads', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `dc_role`
-- ----------------------------
DROP TABLE IF EXISTS `dc_role`;
CREATE TABLE `dc_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_super` char(1) NOT NULL DEFAULT '0' COMMENT '拥有所有权限',
  PRIMARY KEY (`role_id`),
  KEY `fk_jc_role_site` (`site_id`),
  CONSTRAINT `fk_jc_role_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='CMS角色表';

-- ----------------------------
-- Records of dc_role
-- ----------------------------
INSERT INTO `dc_role` VALUES ('1', null, '管理员', '11', '1');
INSERT INTO `dc_role` VALUES ('2', null, 'SD', '12', '1');
INSERT INTO `dc_role` VALUES ('3', null, 'MM', '13', '0');

-- ----------------------------
-- Table structure for `dc_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `dc_role_permission`;
CREATE TABLE `dc_role_permission` (
  `role_id` int(11) NOT NULL,
  `uri` varchar(100) NOT NULL,
  KEY `fk_jc_permission_role` (`role_id`),
  CONSTRAINT `fk_jc_permission_role` FOREIGN KEY (`role_id`) REFERENCES `dc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS角色授权表';

-- ----------------------------
-- Records of dc_role_permission
-- ----------------------------
INSERT INTO `dc_role_permission` VALUES ('1', '/index.do');
INSERT INTO `dc_role_permission` VALUES ('1', '/top.do');
INSERT INTO `dc_role_permission` VALUES ('1', '/main.do');
INSERT INTO `dc_role_permission` VALUES ('1', '/left.do');
INSERT INTO `dc_role_permission` VALUES ('1', '/right.do');
INSERT INTO `dc_role_permission` VALUES ('2', '/index.do');
INSERT INTO `dc_role_permission` VALUES ('2', '/top.do');
INSERT INTO `dc_role_permission` VALUES ('2', '/main.do');
INSERT INTO `dc_role_permission` VALUES ('2', '/left.do');
INSERT INTO `dc_role_permission` VALUES ('2', '/right.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/index.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/top.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/main.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/left.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/right.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/personal/');
INSERT INTO `dc_role_permission` VALUES ('3', '/frame/channel');
INSERT INTO `dc_role_permission` VALUES ('3', '/channel/v_left.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/channel/v_tree.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/channel/v_list.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/channel/v_add.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/channel/o_save.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/fck/upload.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/common/v_image_area_select.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/common/o_image_cut.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/common/o_upload_image.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/channel/v_edit.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/channel/o_update.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/channel/o_priority.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/fck/upload.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/common/v_image_area_select.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/common/o_image_cut.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/common/o_upload_image.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/channel/o_delete.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/frame/content');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/v_left.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/v_tree.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/v_list.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/v_view.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/v_add.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/o_save.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/v_tree_channels.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/o_upload_attachment.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/o_upload_media.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/fck/upload.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/common/v_image_area_select.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/common/o_image_cut.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/common/o_upload_image.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/v_edit.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/o_update.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/v_tree_channels.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/o_upload_attachment.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/o_upload_media.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/fck/upload.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/common/v_image_area_select.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/common/o_image_cut.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/common/o_upload_image.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/o_delete.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/o_check.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/content/o_reject.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/frame/template');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/v_left.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/v_tree.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/v_list.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/v_add.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/o_save.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/o_swfupload.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/o_create_dir.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/v_edit.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/o_update.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/v_rename.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/o_rename.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/o_delete.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/o_delete_single.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/v_setting.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/o_def_template.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/o_export.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/template/o_import.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/frame/resource');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/v_left.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/v_tree.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/v_list.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/v_add.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/o_save.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/o_create_dir.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/v_upload.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/o_upload.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/o_swfupload.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/v_edit.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/o_update.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/v_rename.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/o_rename.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/o_delete.do');
INSERT INTO `dc_role_permission` VALUES ('3', '/resource/o_delete_single.do');

-- ----------------------------
-- Table structure for `dc_sensitivity`
-- ----------------------------
DROP TABLE IF EXISTS `dc_sensitivity`;
CREATE TABLE `dc_sensitivity` (
  `sensitivity_id` int(11) NOT NULL AUTO_INCREMENT,
  `search` varchar(255) NOT NULL COMMENT '敏感词',
  `replacement` varchar(255) NOT NULL COMMENT '替换词',
  PRIMARY KEY (`sensitivity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS敏感词表';

-- ----------------------------
-- Records of dc_sensitivity
-- ----------------------------
INSERT INTO `dc_sensitivity` VALUES ('1', '法论功', '***');
INSERT INTO `dc_sensitivity` VALUES ('2', 'AA', 'SD');

-- ----------------------------
-- Table structure for `dc_site`
-- ----------------------------
DROP TABLE IF EXISTS `dc_site`;
CREATE TABLE `dc_site` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL COMMENT '配置ID',
  `ftp_upload_id` int(11) DEFAULT NULL COMMENT '上传ftp',
  `domain` varchar(50) NOT NULL COMMENT '域名',
  `site_path` varchar(20) NOT NULL COMMENT '路径',
  `site_name` varchar(100) NOT NULL COMMENT '网站名称',
  `short_name` varchar(100) NOT NULL COMMENT '简短名称',
  `protocol` varchar(20) NOT NULL DEFAULT 'http://' COMMENT '协议',
  `dynamic_suffix` varchar(10) NOT NULL DEFAULT '.jhtml' COMMENT '动态页后缀',
  `static_suffix` varchar(10) NOT NULL DEFAULT '.html' COMMENT '静态页后缀',
  `static_dir` varchar(50) DEFAULT NULL COMMENT '静态页存放目录',
  `is_index_to_root` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用将首页放在根目录下',
  `is_static_index` char(1) NOT NULL DEFAULT '0' COMMENT '是否静态化首页',
  `locale_admin` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '后台本地化',
  `locale_front` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '前台本地化',
  `tpl_solution` varchar(50) NOT NULL DEFAULT 'default' COMMENT '模板方案',
  `final_step` tinyint(4) NOT NULL DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) NOT NULL DEFAULT '2' COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_relative_path` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用相对路径',
  `is_recycle_on` char(1) NOT NULL DEFAULT '1' COMMENT '是否开启回收站',
  `domain_alias` varchar(255) DEFAULT NULL COMMENT '域名别名',
  `domain_redirect` varchar(255) DEFAULT NULL COMMENT '域名重定向',
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `ak_domain` (`domain`),
  KEY `fk_jc_site_config` (`config_id`),
  KEY `fk_jc_site_upload_ftp` (`ftp_upload_id`),
  CONSTRAINT `fk_jc_site_config` FOREIGN KEY (`config_id`) REFERENCES `dc_config` (`config_id`),
  CONSTRAINT `fk_jc_site_upload_ftp` FOREIGN KEY (`ftp_upload_id`) REFERENCES `do_ftp` (`ftp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS站点表';

-- ----------------------------
-- Records of dc_site
-- ----------------------------
INSERT INTO `dc_site` VALUES ('1', '1', null, 'localhost', 'www', 'DwCMS开发站', 'DwCMS开发站1', 'http://', '.jsp', '.html', 'S', '0', '0', 'zh_CN', 'zh_CN', 'red', '2', '2', '1', '1', 'FDS', 'DS');
INSERT INTO `dc_site` VALUES ('2', '1', '2', 'baidu.com', 'www', 'doadway', 'Doadway网站开发', 'http://', '.jhtml', '.html', null, '0', '0', 'zh_CN', 'zh_CN', 'default', '2', '2', '1', '1', null, null);

-- ----------------------------
-- Table structure for `dc_site_attr`
-- ----------------------------
DROP TABLE IF EXISTS `dc_site_attr`;
CREATE TABLE `dc_site_attr` (
  `site_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_site` (`site_id`),
  CONSTRAINT `fk_jc_attr_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点属性表';

-- ----------------------------
-- Records of dc_site_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_site_cfg`
-- ----------------------------
DROP TABLE IF EXISTS `dc_site_cfg`;
CREATE TABLE `dc_site_cfg` (
  `site_id` int(11) NOT NULL,
  `cfg_name` varchar(30) NOT NULL COMMENT '名称',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_cfg_site` (`site_id`),
  CONSTRAINT `fk_jc_cfg_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点配置表';

-- ----------------------------
-- Records of dc_site_cfg
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_site_model`
-- ----------------------------
DROP TABLE IF EXISTS `dc_site_model`;
CREATE TABLE `dc_site_model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `model_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `upload_path` varchar(100) DEFAULT NULL COMMENT '上传路径',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) DEFAULT '1' COMMENT '0:编辑器;1:文本框;2:文本区;3:图片;4:附件',
  `is_single` tinyint(1) DEFAULT '1' COMMENT '是否独占一行',
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `ak_field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点信息模型表';

-- ----------------------------
-- Records of dc_site_model
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_site_txt`
-- ----------------------------
DROP TABLE IF EXISTS `dc_site_txt`;
CREATE TABLE `dc_site_txt` (
  `site_id` int(11) NOT NULL,
  `txt_name` varchar(30) NOT NULL COMMENT '名称',
  `txt_value` longtext COMMENT '值',
  KEY `fk_jc_txt_site` (`site_id`),
  CONSTRAINT `fk_jc_txt_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点文本表';

-- ----------------------------
-- Records of dc_site_txt
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_topic`
-- ----------------------------
DROP TABLE IF EXISTS `dc_topic`;
CREATE TABLE `dc_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `topic_name` varchar(150) NOT NULL COMMENT '名称',
  `short_name` varchar(150) DEFAULT NULL COMMENT '简称',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '专题模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推??',
  PRIMARY KEY (`topic_id`),
  KEY `fk_jc_topic_channel` (`channel_id`),
  CONSTRAINT `fk_jc_topic_channel` FOREIGN KEY (`channel_id`) REFERENCES `dc_channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='CMS专题表';

-- ----------------------------
-- Records of dc_topic
-- ----------------------------
INSERT INTO `dc_topic` VALUES ('1', '1', '2010年南非世界杯', '世界杯', '世界杯', '2010年世界杯将在南非约翰内斯堡拉开帷幕，32路豪强将在一个月的时间里，为大力神杯展开争夺。', 'http://a2.att.hudong.com/08/61/01300000406647124377613651616.jpg', 'http://i0.sinaimg.cn/ty/news/2010/0611/sjbsc.jpg', '', '11', '0');
INSERT INTO `dc_topic` VALUES ('2', '6', '上海世博会专题', '世博', '世博', '人类文明的盛会，我们大家的世博，精彩开篇，“满月”有余。随着上海世博会的有序前行，人们从中收获的感悟也由表及里。', 'http://xwcb.eastday.com/c/20061116/images/00033531.jpg', 'http://news.china.com/zh_cn/focus/expo2010/images/top_pic.jpg', '', '13', '1');
INSERT INTO `dc_topic` VALUES ('3', '37', '低碳经济', '低碳', '低碳', '所谓低碳经济，是指在可持续发展理念指导下，通过技术创新、制度创新、产业转型、新能源开发等多种手段，尽可能地减少煤炭石油等高碳能源消耗，减少温室气体排放，达到经济社会发展与生态环境保护双赢的一种经济发展形态。', 'http://www.6788.cn/bscyw/upfiles/0125/1f0aaff5/fery/w1tg.jpg', '', '', '14', '1');
INSERT INTO `dc_topic` VALUES ('6', '1', 'A', 'A', 'A', 'A', '', '', '', '1', '0');

-- ----------------------------
-- Table structure for `dc_user`
-- ----------------------------
DROP TABLE IF EXISTS `dc_user`;
CREATE TABLE `dc_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '管理员级别',
  `upload_total` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传总大小',
  `upload_size` int(11) NOT NULL DEFAULT '0' COMMENT '上传大小',
  `upload_date` date DEFAULT NULL COMMENT '上传日期',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `is_viewonly_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只读管理员',
  `is_self_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只管理自己的数据',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`),
  KEY `fk_jc_user_group` (`group_id`),
  CONSTRAINT `fk_jc_user_group` FOREIGN KEY (`group_id`) REFERENCES `dc_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户表';

-- ----------------------------
-- Records of dc_user
-- ----------------------------
INSERT INTO `dc_user` VALUES ('1', '2', 'admin', 'admin@yahoo.com', '2011-01-03 00:00:00', '127.0.0.1', '2013-12-10 21:27:45', '127.0.0.1', '0', '2', '0', '0', null, '1', '0', '1', '0');
INSERT INTO `dc_user` VALUES ('4', '2', 'korven1', '811459917@qq.com', '2011-06-04 15:42:10', '127.0.0.1', '2011-06-04 16:33:02', '127.0.0.1', '0', '1', '0', '0', '2011-06-04', '1', '0', '1', '0');
INSERT INTO `dc_user` VALUES ('5', '7', 'AA2', 'SDF@300.cn', '2013-12-31 17:42:39', '127.0.0.1', '2013-12-31 17:42:39', '127.0.0.1', '0', '2', '0', '0', null, '1', '1', '1', '0');
INSERT INTO `dc_user` VALUES ('9', '2', 'SDA', 'SDA@300.cn', '2014-01-10 15:53:31', '127.0.0.1', '2014-01-10 15:53:31', '127.0.0.1', '0', '9', '0', '0', null, '1', '0', '0', '0');
INSERT INTO `dc_user` VALUES ('11', '2', 'AJAX', 'AJAX@300.cn', '2014-01-10 16:05:41', '127.0.0.1', '2014-01-10 16:05:41', '127.0.0.1', '0', '8', '0', '0', null, '1', '0', '0', '0');
INSERT INTO `dc_user` VALUES ('12', '1', 'zhoutanxin', 'xinxin@doadway.com', '2014-01-10 16:28:02', '127.0.0.1', '2014-01-10 16:28:02', '127.0.0.1', '0', '0', '0', '0', null, '0', '0', '0', '0');
INSERT INTO `dc_user` VALUES ('13', '1', 'zhouxinxin', 'admin@xinnet.com', '2014-04-07 14:29:58', '127.0.0.1', '2014-04-07 14:29:58', '127.0.0.1', '0', '0', '0', '0', null, '0', '0', '0', '0');
INSERT INTO `dc_user` VALUES ('14', '1', 'AA', 'zhoutanxin@hotmail.com', '2014-05-08 23:29:47', '127.0.0.1', '2014-05-08 23:29:47', '127.0.0.1', '0', '0', '0', '0', null, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `dc_user_ext`
-- ----------------------------
DROP TABLE IF EXISTS `dc_user_ext`;
CREATE TABLE `dc_user_ext` (
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `intro` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `comefrom` varchar(150) DEFAULT NULL COMMENT '来自',
  `qq` varchar(100) DEFAULT NULL COMMENT 'QQ',
  `msn` varchar(100) DEFAULT NULL COMMENT 'MSN',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_jc_ext_user` FOREIGN KEY (`user_id`) REFERENCES `dc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户扩展信息表';

-- ----------------------------
-- Records of dc_user_ext
-- ----------------------------
INSERT INTO `dc_user_ext` VALUES ('1', 'DWCMS', '1', '2013-12-31 00:00:00', 'fdsa', 'fdsa', '45115517', 'zhoutanxin@hotmail.com', '01052466853', '13683027377');
INSERT INTO `dc_user_ext` VALUES ('4', 'korven123', '1', '1988-06-23 00:00:00', 'SS2', 'HNHY', '2886923012', 'zhoutanxin@hotmail.com', '010524668532', '136830273771');
INSERT INTO `dc_user_ext` VALUES ('5', 'SDF1', '1', '2013-12-25 00:00:00', 'SD', 'HNHY', '45115517', '', '01052466853', '13683027377');
INSERT INTO `dc_user_ext` VALUES ('9', 'zhoutanxin', '0', null, null, null, null, null, null, null);
INSERT INTO `dc_user_ext` VALUES ('11', 'zhoutanxin', '0', null, null, null, null, null, null, null);
INSERT INTO `dc_user_ext` VALUES ('12', 'zhoutanxin', '0', '2014-01-09 00:00:00', 'fdsa1', 'fdsa', 'fdsa', 'fda', 'fdsa', '13683027377');
INSERT INTO `dc_user_ext` VALUES ('13', 'zhoutanxin', '0', '2014-04-16 00:00:00', 'ZZ', '', '', '', '', '');
INSERT INTO `dc_user_ext` VALUES ('14', 'tantan', '1', '2014-05-08 00:00:00', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `dc_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `dc_user_role`;
CREATE TABLE `dc_user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `fk_jc_role_user` (`user_id`),
  CONSTRAINT `fk_jc_role_user` FOREIGN KEY (`user_id`) REFERENCES `dc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_role` FOREIGN KEY (`role_id`) REFERENCES `dc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户角色关联表';

-- ----------------------------
-- Records of dc_user_role
-- ----------------------------
INSERT INTO `dc_user_role` VALUES ('1', '1');
INSERT INTO `dc_user_role` VALUES ('3', '4');
INSERT INTO `dc_user_role` VALUES ('1', '5');
INSERT INTO `dc_user_role` VALUES ('1', '9');
INSERT INTO `dc_user_role` VALUES ('1', '11');

-- ----------------------------
-- Table structure for `dc_user_site`
-- ----------------------------
DROP TABLE IF EXISTS `dc_user_site`;
CREATE TABLE `dc_user_site` (
  `usersite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核级别',
  `is_all_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否拥有所有栏目的权限',
  PRIMARY KEY (`usersite_id`),
  KEY `fk_jc_site_user` (`user_id`),
  KEY `fk_jc_user_site` (`site_id`),
  CONSTRAINT `fk_jc_site_user` FOREIGN KEY (`user_id`) REFERENCES `dc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS管理员站点表';

-- ----------------------------
-- Records of dc_user_site
-- ----------------------------
INSERT INTO `dc_user_site` VALUES ('1', '1', '2', '2', '1');

-- ----------------------------
-- Table structure for `dc_vote_item`
-- ----------------------------
DROP TABLE IF EXISTS `dc_vote_item`;
CREATE TABLE `dc_vote_item` (
  `voteitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `votetopic_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '投票数量',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`voteitem_id`),
  KEY `fk_jc_vote_item_topic` (`votetopic_id`),
  CONSTRAINT `fk_jc_vote_item_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `dc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='CMS投票项';

-- ----------------------------
-- Records of dc_vote_item
-- ----------------------------
INSERT INTO `dc_vote_item` VALUES ('78', '2', '232', '1', '1');
INSERT INTO `dc_vote_item` VALUES ('79', '2', '213', '2', '2');
INSERT INTO `dc_vote_item` VALUES ('80', '2', '312', '3', '3');
INSERT INTO `dc_vote_item` VALUES ('81', '2', '321', '4', '4');
INSERT INTO `dc_vote_item` VALUES ('82', '2', '321', '5', '5');
INSERT INTO `dc_vote_item` VALUES ('83', '1', '基于java技术，安全稳定，易扩展', '21', '1');
INSERT INTO `dc_vote_item` VALUES ('84', '1', 'jsp是未来发展的趋势', '23', '4');
INSERT INTO `dc_vote_item` VALUES ('85', '1', 'java执行速度快，性能优良', '5', '5');
INSERT INTO `dc_vote_item` VALUES ('86', '1', '跨平台，支持windows、linux、unix', '6', '6');
INSERT INTO `dc_vote_item` VALUES ('87', '1', '学习研究', '11', '7');
INSERT INTO `dc_vote_item` VALUES ('88', '1', '其它', '10', '8');

-- ----------------------------
-- Table structure for `dc_vote_record`
-- ----------------------------
DROP TABLE IF EXISTS `dc_vote_record`;
CREATE TABLE `dc_vote_record` (
  `voterecored_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `votetopic_id` int(11) NOT NULL,
  `vote_time` datetime NOT NULL COMMENT '投票时间',
  `vote_ip` varchar(50) NOT NULL COMMENT '投票IP',
  `vote_cookie` varchar(32) NOT NULL COMMENT '投票COOKIE',
  PRIMARY KEY (`voterecored_id`),
  KEY `fk_jc_vote_record_topic` (`votetopic_id`),
  KEY `fk_jc_voterecord_user` (`user_id`),
  CONSTRAINT `fk_jc_voterecord_user` FOREIGN KEY (`user_id`) REFERENCES `dc_user` (`user_id`),
  CONSTRAINT `fk_jc_vote_record_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `dc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS投票记录';

-- ----------------------------
-- Records of dc_vote_record
-- ----------------------------
INSERT INTO `dc_vote_record` VALUES ('1', null, '1', '2011-06-04 15:41:31', '127.0.0.1', '2600e4a345ba4fc289088d7abe59321c');

-- ----------------------------
-- Table structure for `dc_vote_topic`
-- ----------------------------
DROP TABLE IF EXISTS `dc_vote_topic`;
CREATE TABLE `dc_vote_topic` (
  `votetopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `repeate_hour` int(11) DEFAULT NULL COMMENT '重复投票限制时间，单位小时，为空不允许重复投票',
  `total_count` int(11) NOT NULL DEFAULT '0' COMMENT '总投票数',
  `multi_select` int(11) NOT NULL DEFAULT '1' COMMENT '最多可以选择几项',
  `is_restrict_member` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制会员',
  `is_restrict_ip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制IP',
  `is_restrict_cookie` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制COOKIE',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认主题',
  PRIMARY KEY (`votetopic_id`),
  KEY `fk_jc_votetopic_site` (`site_id`),
  CONSTRAINT `fk_jc_votetopic_site` FOREIGN KEY (`site_id`) REFERENCES `dc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS投票主题';

-- ----------------------------
-- Records of dc_vote_topic
-- ----------------------------
INSERT INTO `dc_vote_topic` VALUES ('1', '2', '您为什么选择jsp cms,java cms?', '在php cms为建站主流CMS的年代，您为什么选择jsp cms,java cms？请给出您的意见吧！', '2014-04-24 00:00:00', '2014-04-24 00:53:14', null, '76', '3', '0', '0', '1', '1', '1');
INSERT INTO `dc_vote_topic` VALUES ('2', '2', '22', '33', '2014-04-24 00:00:00', '2014-04-24 00:00:00', '0', '15', '2', '1', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for `dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `ID` int(11) NOT NULL,
  `DKEY` varchar(30) DEFAULT NULL,
  `DVALUE` varchar(30) DEFAULT NULL,
  `TYPE_ID` int(11) DEFAULT NULL,
  `ANNOTATION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_10` (`TYPE_ID`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`TYPE_ID`) REFERENCES `dictionary_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for `dictionary_type`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_type`;
CREATE TABLE `dictionary_type` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `ANNOTATION` char(50) DEFAULT NULL,
  `MODULE` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary_type
-- ----------------------------

-- ----------------------------
-- Table structure for `do_authentication`
-- ----------------------------
DROP TABLE IF EXISTS `do_authentication`;
CREATE TABLE `do_authentication` (
  `authentication_id` char(32) NOT NULL COMMENT '认证ID',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `login_ip` varchar(50) NOT NULL COMMENT '登录ip',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='认证信息表';

-- ----------------------------
-- Records of do_authentication
-- ----------------------------
INSERT INTO `do_authentication` VALUES ('0a2f649b16bc4da2924350a5408f8b06', '1', 'admin', 'admin@yahoo.com', '2013-12-04 21:55:22', '127.0.0.1', '2013-12-04 21:55:40');
INSERT INTO `do_authentication` VALUES ('90b8995d613e43fbbc86f32fc6d4a7cf', '1', 'admin', 'admin@yahoo.com', '2013-12-10 21:27:45', '127.0.0.1', '2013-12-10 21:28:48');

-- ----------------------------
-- Table structure for `do_config`
-- ----------------------------
DROP TABLE IF EXISTS `do_config`;
CREATE TABLE `do_config` (
  `cfg_key` varchar(50) NOT NULL COMMENT '配置KEY',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '配置VALUE',
  PRIMARY KEY (`cfg_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of do_config
-- ----------------------------
INSERT INTO `do_config` VALUES ('email_encoding', 'utf-8');
INSERT INTO `do_config` VALUES ('email_host', 'smtp.126.com');
INSERT INTO `do_config` VALUES ('email_password', '123');
INSERT INTO `do_config` VALUES ('email_personal', 'xin');
INSERT INTO `do_config` VALUES ('email_port', '23');
INSERT INTO `do_config` VALUES ('email_username', 'dwcms@163.com');
INSERT INTO `do_config` VALUES ('login_error_interval', '30');
INSERT INTO `do_config` VALUES ('login_error_times', '12');
INSERT INTO `do_config` VALUES ('message_subject', 'DWCMS会员密码找回信息');
INSERT INTO `do_config` VALUES ('message_text', '感谢您使用DWCMS系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost/member/password_reset.jspx?uid=${uid}&key=${resetKey}');

-- ----------------------------
-- Table structure for `do_ftp`
-- ----------------------------
DROP TABLE IF EXISTS `do_ftp`;
CREATE TABLE `do_ftp` (
  `ftp_id` int(11) NOT NULL AUTO_INCREMENT,
  `ftp_name` varchar(100) NOT NULL COMMENT '名称',
  `ip` varchar(50) NOT NULL COMMENT 'IP',
  `port` int(11) NOT NULL DEFAULT '21' COMMENT '端口号',
  `username` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '登陆密码',
  `encoding` varchar(20) NOT NULL DEFAULT 'UTF-8' COMMENT '编码',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间',
  `ftp_path` varchar(255) DEFAULT NULL COMMENT '路径',
  `url` varchar(255) NOT NULL COMMENT '访问URL',
  PRIMARY KEY (`ftp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='FTP表';

-- ----------------------------
-- Records of do_ftp
-- ----------------------------
INSERT INTO `do_ftp` VALUES ('2', 'AAS', '192.168.1.112', '21', 'admin', 'admin', 'UTF-8', '50', '/', 'SDF');

-- ----------------------------
-- Table structure for `do_template`
-- ----------------------------
DROP TABLE IF EXISTS `do_template`;
CREATE TABLE `do_template` (
  `tpl_name` varchar(150) NOT NULL COMMENT '模板名称',
  `tpl_source` longtext COMMENT '模板内容',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `is_directory` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否目录',
  PRIMARY KEY (`tpl_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of do_template
-- ----------------------------

-- ----------------------------
-- Table structure for `do_upload`
-- ----------------------------
DROP TABLE IF EXISTS `do_upload`;
CREATE TABLE `do_upload` (
  `filename` varchar(150) NOT NULL COMMENT '文件名',
  `length` int(11) NOT NULL COMMENT '文件大小(字节)',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `content` longblob NOT NULL COMMENT '内容',
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传附件表';

-- ----------------------------
-- Records of do_upload
-- ----------------------------

-- ----------------------------
-- Table structure for `do_user`
-- ----------------------------
DROP TABLE IF EXISTS `do_user`;
CREATE TABLE `do_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `password` char(32) NOT NULL COMMENT '密码',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reset_key` char(32) DEFAULT NULL COMMENT '重置密码KEY',
  `reset_pwd` varchar(10) DEFAULT NULL COMMENT '重置密码VALUE',
  `error_time` datetime DEFAULT NULL COMMENT '登录错误时间',
  `error_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录错误次数',
  `error_ip` varchar(50) DEFAULT NULL COMMENT '登录错误IP',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of do_user
-- ----------------------------
INSERT INTO `do_user` VALUES ('1', 'admin', 'admin@yahoo.com', 'admin', '2011-01-03 00:00:00', '127.0.0.1', '2013-12-10 21:27:45', '127.0.0.1', '0', null, null, null, '0', null);
INSERT INTO `do_user` VALUES ('4', 'korven1', '811459917@qq.com', 'dda1cb7e1d1363b0239cb9f6c799bf59', '2011-06-04 15:42:10', '127.0.0.1', '2011-06-04 16:33:02', '127.0.0.1', '0', null, null, null, '0', null);
INSERT INTO `do_user` VALUES ('5', 'AA2', 'SDF@300.cn', '110', '2013-12-31 17:42:39', '127.0.0.1', '2013-12-31 17:42:39', '127.0.0.1', '0', null, null, null, '0', null);
INSERT INTO `do_user` VALUES ('9', 'SDA', 'SDA@300.cn', '110110', '2014-01-10 15:53:31', '127.0.0.1', '2014-01-10 15:53:31', '127.0.0.1', '0', null, null, null, '0', null);
INSERT INTO `do_user` VALUES ('11', 'AJAX', 'AJAX@300.cn', '110110', '2014-01-10 16:05:41', '127.0.0.1', '2014-01-10 16:05:41', '127.0.0.1', '0', null, null, null, '0', null);
INSERT INTO `do_user` VALUES ('12', 'zhoutanxin', 'xinxin@doadway.com', 'admin', '2014-01-10 16:28:02', '127.0.0.1', '2014-01-10 16:28:02', '127.0.0.1', '0', null, null, null, '0', null);
INSERT INTO `do_user` VALUES ('13', 'zhouxinxin', 'admin@xinnet.com', '110110', '2014-04-07 14:29:58', '127.0.0.1', '2014-04-07 14:29:58', '127.0.0.1', '0', null, null, null, '0', null);
INSERT INTO `do_user` VALUES ('14', 'AA', 'zhoutanxin@hotmail.com', '110110', '2014-05-08 23:29:47', '127.0.0.1', '2014-05-08 23:29:47', '127.0.0.1', '0', null, null, null, '0', null);
