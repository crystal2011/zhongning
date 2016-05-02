/*
MySQL Data Transfer
Source Host: localhost
Source Database: zhongning
Target Host: localhost
Target Database: zhongning
Date: 2016-5-1 19:16:37
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for sx_404
-- ----------------------------
CREATE TABLE `sx_404` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loginip` char(11) NOT NULL COMMENT '登录ip',
  `logintime` int(11) NOT NULL COMMENT '登录时间',
  `logintimes` int(11) NOT NULL COMMENT '登录次数',
  `url` varchar(255) NOT NULL DEFAULT '',
  `refer` varchar(255) NOT NULL,
  `robot` varchar(20) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='404日志';

-- ----------------------------
-- Table structure for sx_ad
-- ----------------------------
CREATE TABLE `sx_ad` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `typeid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` float NOT NULL DEFAULT '0',
  `currency` varchar(20) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromtime` int(10) unsigned NOT NULL DEFAULT '0',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `stat` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  `code` text NOT NULL,
  `text_name` varchar(100) NOT NULL DEFAULT '',
  `text_url` varchar(255) NOT NULL DEFAULT '',
  `text_title` varchar(100) NOT NULL DEFAULT '',
  `text_style` varchar(50) NOT NULL DEFAULT '',
  `image_src` varchar(255) NOT NULL DEFAULT '',
  `image_url` varchar(255) NOT NULL DEFAULT '',
  `image_alt` varchar(100) NOT NULL DEFAULT '',
  `flash_src` varchar(255) NOT NULL DEFAULT '',
  `flash_url` varchar(255) NOT NULL DEFAULT '',
  `flash_loop` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `key_moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `key_catid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `key_word` varchar(100) NOT NULL DEFAULT '',
  `key_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='广告';

-- ----------------------------
-- Table structure for sx_ad_place
-- ----------------------------
CREATE TABLE `sx_ad_place` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `typeid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `open` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `code` text NOT NULL,
  `width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` float unsigned NOT NULL DEFAULT '0',
  `ads` smallint(4) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='广告位';

-- ----------------------------
-- Table structure for sx_admin
-- ----------------------------
CREATE TABLE `sx_admin` (
  `adminid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `moduleid` smallint(6) NOT NULL DEFAULT '0',
  `file` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `catid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`adminid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Table structure for sx_admin_log
-- ----------------------------
CREATE TABLE `sx_admin_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qstring` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `logtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理日志';

-- ----------------------------
-- Table structure for sx_admin_online
-- ----------------------------
CREATE TABLE `sx_admin_online` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `moduleid` int(10) unsigned NOT NULL DEFAULT '0',
  `qstring` varchar(255) NOT NULL DEFAULT '',
  `lasttime` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `sid` (`sid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='在线管理员';

-- ----------------------------
-- Table structure for sx_admin_user
-- ----------------------------
CREATE TABLE `sx_admin_user` (
  `adminuid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(20) NOT NULL,
  `password` char(32) NOT NULL,
  `role` varchar(11) NOT NULL COMMENT '255',
  `admin` tinyint(4) NOT NULL COMMENT '管理员类型  1,2 (网站创起人|超级管理员,普通管理员)',
  `aid` int(11) NOT NULL COMMENT '分站id',
  `addtime` int(11) NOT NULL,
  `logintime` int(11) NOT NULL COMMENT '最新登录时间',
  `loginip` varchar(15) NOT NULL COMMENT '最新登录ip',
  `logintimes` int(11) NOT NULL COMMENT '登录次数',
  `status` tinyint(4) NOT NULL COMMENT '状态 1正常 0失效',
  PRIMARY KEY (`adminuid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Table structure for sx_alert
-- ----------------------------
CREATE TABLE `sx_alert` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `word` varchar(100) NOT NULL DEFAULT '',
  `rate` smallint(4) unsigned NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '0',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `sendtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='贸易提醒';

-- ----------------------------
-- Table structure for sx_announce
-- ----------------------------
CREATE TABLE `sx_announce` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromtime` int(10) unsigned NOT NULL DEFAULT '0',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公告';

-- ----------------------------
-- Table structure for sx_apply
-- ----------------------------
CREATE TABLE `sx_apply` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(10,2) NOT NULL,
  `codeid` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0,1,2 审核中,不通过,结算成功',
  `codeidstr` text NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sx_area
-- ----------------------------
CREATE TABLE `sx_area` (
  `areaid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `areaname` varchar(50) NOT NULL DEFAULT '',
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL DEFAULT '',
  `child` tinyint(1) NOT NULL DEFAULT '0',
  `arrchildid` text NOT NULL,
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `firstletter` int(11) NOT NULL,
  `ishot` tinyint(4) NOT NULL,
  PRIMARY KEY (`areaid`),
  KEY `areaname` (`areaname`(2)) USING BTREE,
  KEY `ishot` (`ishot`)
) ENGINE=MyISAM AUTO_INCREMENT=3646 DEFAULT CHARSET=utf8 COMMENT='地区';

-- ----------------------------
-- Table structure for sx_article_21
-- ----------------------------
CREATE TABLE `sx_article_21` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `fee` float NOT NULL DEFAULT '0',
  `subtitle` mediumtext NOT NULL,
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `tag` varchar(100) NOT NULL DEFAULT '',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `pptword` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(50) NOT NULL DEFAULT '',
  `copyfrom` varchar(30) NOT NULL DEFAULT '',
  `fromurl` varchar(255) NOT NULL DEFAULT '',
  `voteid` varchar(100) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `oldstatus` tinyint(4) NOT NULL,
  `userid` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `addtime` (`addtime`),
  KEY `username` (`username`),
  KEY `catid` (`catid`,`level`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='资讯';

-- ----------------------------
-- Table structure for sx_article_data_21
-- ----------------------------
CREATE TABLE `sx_article_data_21` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资讯内容';

-- ----------------------------
-- Table structure for sx_article_keyword
-- ----------------------------
CREATE TABLE `sx_article_keyword` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(50) NOT NULL,
  `nums` int(11) NOT NULL COMMENT '文章id',
  PRIMARY KEY (`itemid`),
  KEY `article_itemid` (`nums`),
  KEY `keyword` (`keyword`(5)) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='文章关键字';

-- ----------------------------
-- Table structure for sx_banip
-- ----------------------------
CREATE TABLE `sx_banip` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='IP禁止';

-- ----------------------------
-- Table structure for sx_banword
-- ----------------------------
CREATE TABLE `sx_banword` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `replacefrom` varchar(255) NOT NULL DEFAULT '',
  `replaceto` varchar(255) NOT NULL DEFAULT '',
  `deny` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='词语过滤';

-- ----------------------------
-- Table structure for sx_brand_13
-- ----------------------------
CREATE TABLE `sx_brand_13` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `fee` float NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `pptword` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `homepage` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `groupid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `adddate` date NOT NULL DEFAULT '0000-00-00',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `company` varchar(100) NOT NULL DEFAULT '',
  `vip` smallint(2) unsigned NOT NULL DEFAULT '0',
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `truename` varchar(30) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `fax` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `ali` varchar(30) NOT NULL DEFAULT '',
  `skype` varchar(30) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `editdate` date NOT NULL DEFAULT '0000-00-00',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `userid` int(11) NOT NULL,
  `oldstatus` tinyint(4) NOT NULL,
  `comments` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `fromtime` int(11) NOT NULL,
  `istop` int(11) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`),
  KEY `edittime` (`edittime`),
  KEY `editdate` (`editdate`,`vip`,`edittime`),
  KEY `level` (`level`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='品牌';

-- ----------------------------
-- Table structure for sx_brand_data_13
-- ----------------------------
CREATE TABLE `sx_brand_data_13` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='品牌内容';

-- ----------------------------
-- Table structure for sx_buy_6
-- ----------------------------
CREATE TABLE `sx_buy_6` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(5) NOT NULL DEFAULT '',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `price` varchar(10) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `editdate` date NOT NULL DEFAULT '0000-00-00',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `adddate` date NOT NULL DEFAULT '0000-00-00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL,
  `oldstatus` tinyint(4) NOT NULL,
  `month` varchar(10) NOT NULL,
  `sell_itemid` int(11) NOT NULL,
  `bonding` tinyint(1) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `editdate` (`editdate`,`edittime`),
  KEY `edittime` (`edittime`),
  KEY `sell_itemid` (`sell_itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='求购';

-- ----------------------------
-- Table structure for sx_buy_data_6
-- ----------------------------
CREATE TABLE `sx_buy_data_6` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='求购内容';

-- ----------------------------
-- Table structure for sx_buy_log
-- ----------------------------
CREATE TABLE `sx_buy_log` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(250) NOT NULL,
  `addtime` int(11) NOT NULL,
  `food_itemid` int(11) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `addtime` (`addtime`,`food_itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sx_cache
-- ----------------------------
CREATE TABLE `sx_cache` (
  `cacheid` varchar(32) NOT NULL DEFAULT '',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `cacheid` (`cacheid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件缓存';

-- ----------------------------
-- Table structure for sx_category
-- ----------------------------
CREATE TABLE `sx_category` (
  `catid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `catname` varchar(50) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `catdir` varchar(255) NOT NULL DEFAULT '',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `letter` varchar(4) NOT NULL DEFAULT '',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `item` bigint(20) unsigned NOT NULL DEFAULT '0',
  `property` smallint(6) unsigned NOT NULL DEFAULT '0',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL DEFAULT '',
  `child` tinyint(1) NOT NULL DEFAULT '0',
  `arrchildid` text NOT NULL,
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `show_template` varchar(30) NOT NULL DEFAULT '',
  `seo_title` varchar(255) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `group_list` varchar(255) NOT NULL DEFAULT '',
  `group_show` varchar(255) NOT NULL DEFAULT '',
  `group_add` varchar(255) NOT NULL DEFAULT '',
  `promote1` tinyint(4) NOT NULL,
  `promote2` tinyint(4) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `promote1` (`promote1`),
  KEY `promote2` (`promote2`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='栏目分类';

-- ----------------------------
-- Table structure for sx_category_option
-- ----------------------------
CREATE TABLE `sx_category_option` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `search` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `extend` text NOT NULL,
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`oid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类属性';

-- ----------------------------
-- Table structure for sx_category_value
-- ----------------------------
CREATE TABLE `sx_category_value` (
  `oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `moduleid` smallint(6) NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  KEY `moduleid` (`moduleid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类属性值';

-- ----------------------------
-- Table structure for sx_chat
-- ----------------------------
CREATE TABLE `sx_chat` (
  `chatid` varchar(32) NOT NULL,
  `fromuser` varchar(30) NOT NULL,
  `fgettime` int(10) unsigned NOT NULL DEFAULT '0',
  `freadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fnew` int(10) unsigned NOT NULL DEFAULT '0',
  `touser` varchar(30) NOT NULL,
  `tgettime` int(10) unsigned NOT NULL DEFAULT '0',
  `treadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `tnew` int(10) unsigned NOT NULL DEFAULT '0',
  `lastmsg` varchar(255) NOT NULL,
  `lasttime` int(10) unsigned NOT NULL DEFAULT '0',
  `forward` varchar(255) NOT NULL,
  UNIQUE KEY `chatid` (`chatid`),
  KEY `fromuser` (`fromuser`),
  KEY `touser` (`touser`),
  KEY `lasttime` (`lasttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线聊天';

-- ----------------------------
-- Table structure for sx_city
-- ----------------------------
CREATE TABLE `sx_city` (
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `pinyin` varchar(20) NOT NULL,
  `style` varchar(50) NOT NULL DEFAULT '',
  `iparea` mediumtext NOT NULL,
  `domain` varchar(255) NOT NULL DEFAULT '',
  `letter` varchar(4) NOT NULL DEFAULT '',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `template` varchar(50) NOT NULL DEFAULT '',
  `seo_title` varchar(255) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `areaid` (`areaid`),
  KEY `domain` (`domain`),
  KEY `pinyin` (`pinyin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='城市分站';

-- ----------------------------
-- Table structure for sx_comment
-- ----------------------------
CREATE TABLE `sx_comment` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_mid` smallint(6) NOT NULL DEFAULT '0',
  `item_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item_title` varchar(255) NOT NULL DEFAULT '',
  `item_username` varchar(30) NOT NULL DEFAULT '',
  `star` tinyint(1) NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `qid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `quotation` mediumtext NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `passport` varchar(30) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `reply` mediumtext NOT NULL,
  `editor` varchar(30) NOT NULL DEFAULT '',
  `replyer` varchar(30) NOT NULL DEFAULT '',
  `replytime` int(10) unsigned NOT NULL DEFAULT '0',
  `agree` int(10) unsigned NOT NULL DEFAULT '0',
  `against` int(10) unsigned NOT NULL DEFAULT '0',
  `quote` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `item_mid` (`item_mid`),
  KEY `item_id` (`item_id`),
  KEY `userid` (`userid`,`type`,`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Table structure for sx_comment_ban
-- ----------------------------
CREATE TABLE `sx_comment_ban` (
  `bid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` smallint(6) NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论禁止';

-- ----------------------------
-- Table structure for sx_comment_stat
-- ----------------------------
CREATE TABLE `sx_comment_stat` (
  `sid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` smallint(6) NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment` int(10) unsigned NOT NULL DEFAULT '0',
  `star1` int(10) unsigned NOT NULL DEFAULT '0',
  `star2` int(10) unsigned NOT NULL DEFAULT '0',
  `star3` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论统计';

-- ----------------------------
-- Table structure for sx_company
-- ----------------------------
CREATE TABLE `sx_company` (
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `company` varchar(100) NOT NULL DEFAULT '',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  `edittime` int(11) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `areaid` (`areaid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公司';

-- ----------------------------
-- Table structure for sx_company_data
-- ----------------------------
CREATE TABLE `sx_company_data` (
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公司内容';

-- ----------------------------
-- Table structure for sx_company_setting
-- ----------------------------
CREATE TABLE `sx_company_setting` (
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item_key` varchar(100) NOT NULL DEFAULT '',
  `item_value` text NOT NULL,
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公司设置';

-- ----------------------------
-- Table structure for sx_cron
-- ----------------------------
CREATE TABLE `sx_cron` (
  `itemid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL,
  `schedule` varchar(255) NOT NULL,
  `lasttime` int(10) unsigned NOT NULL DEFAULT '0',
  `nexttime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `nexttime` (`nexttime`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='计划任务';

-- ----------------------------
-- Table structure for sx_email
-- ----------------------------
CREATE TABLE `sx_email` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `regtime` int(11) NOT NULL,
  `regip` char(15) NOT NULL,
  `groupid` tinyint(4) NOT NULL,
  `regid` tinyint(4) NOT NULL,
  `password` char(32) NOT NULL,
  `auth` char(32) NOT NULL,
  `totime` int(11) NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sx_exhibit
-- ----------------------------
CREATE TABLE `sx_exhibit` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `fee` float NOT NULL DEFAULT '0',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `pptword` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `orders` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromtime` int(10) unsigned NOT NULL DEFAULT '0',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `city` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `postcode` varchar(20) NOT NULL DEFAULT '',
  `homepage` varchar(255) NOT NULL DEFAULT '',
  `hallname` varchar(100) NOT NULL DEFAULT '',
  `sponsor` varchar(100) NOT NULL DEFAULT '',
  `undertaker` varchar(100) NOT NULL DEFAULT '',
  `truename` varchar(30) NOT NULL DEFAULT '',
  `addr` varchar(255) NOT NULL DEFAULT '',
  `telephone` varchar(100) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `fax` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `remark` mediumtext NOT NULL,
  `sign` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='展会';

-- ----------------------------
-- Table structure for sx_exhibit_data
-- ----------------------------
CREATE TABLE `sx_exhibit_data` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='展会内容';

-- ----------------------------
-- Table structure for sx_exhibit_order
-- ----------------------------
CREATE TABLE `sx_exhibit_order` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user` varchar(30) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `company` varchar(100) NOT NULL,
  `truename` varchar(30) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `username` varchar(30) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='展会报名';

-- ----------------------------
-- Table structure for sx_favorite
-- ----------------------------
CREATE TABLE `sx_favorite` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `typeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商机收藏';

-- ----------------------------
-- Table structure for sx_fetch
-- ----------------------------
CREATE TABLE `sx_fetch` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) NOT NULL DEFAULT '',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `encode` varchar(30) NOT NULL DEFAULT '',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单页采编';

-- ----------------------------
-- Table structure for sx_fields
-- ----------------------------
CREATE TABLE `sx_fields` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tb` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `length` smallint(4) unsigned NOT NULL DEFAULT '0',
  `html` varchar(30) NOT NULL DEFAULT '',
  `default_value` text NOT NULL,
  `option_value` text NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `input_limit` varchar(255) NOT NULL DEFAULT '',
  `addition` varchar(255) NOT NULL DEFAULT '',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `tablename` (`tb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义字段';

-- ----------------------------
-- Table structure for sx_finance_card
-- ----------------------------
CREATE TABLE `sx_finance_card` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(30) NOT NULL DEFAULT '',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `number` (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='充值卡';

-- ----------------------------
-- Table structure for sx_finance_cash
-- ----------------------------
CREATE TABLE `sx_finance_cash` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `bank` varchar(50) NOT NULL DEFAULT '',
  `banktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `branch` varchar(100) NOT NULL,
  `account` varchar(30) NOT NULL DEFAULT '',
  `truename` varchar(30) NOT NULL DEFAULT '',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='申请提现';

-- ----------------------------
-- Table structure for sx_finance_charge
-- ----------------------------
CREATE TABLE `sx_finance_charge` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `bank` varchar(20) NOT NULL DEFAULT '',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `sendtime` int(10) unsigned NOT NULL DEFAULT '0',
  `receivetime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线充值';

-- ----------------------------
-- Table structure for sx_finance_credit
-- ----------------------------
CREATE TABLE `sx_finance_credit` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `amount` int(10) NOT NULL DEFAULT '0',
  `balance` int(10) NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `editor` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='积分流水';

-- ----------------------------
-- Table structure for sx_finance_deposit
-- ----------------------------
CREATE TABLE `sx_finance_deposit` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='保证金';

-- ----------------------------
-- Table structure for sx_finance_pay
-- ----------------------------
CREATE TABLE `sx_finance_pay` (
  `pid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `fee` float unsigned NOT NULL DEFAULT '0',
  `currency` varchar(20) NOT NULL DEFAULT '',
  `paytime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `moduleid` smallint(6) NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付记录';

-- ----------------------------
-- Table structure for sx_finance_promo
-- ----------------------------
CREATE TABLE `sx_finance_promo` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(30) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `amount` float NOT NULL DEFAULT '0',
  `reuse` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `number` (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠码';

-- ----------------------------
-- Table structure for sx_finance_record
-- ----------------------------
CREATE TABLE `sx_finance_record` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `bank` varchar(30) NOT NULL DEFAULT '',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `editor` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='财务流水';

-- ----------------------------
-- Table structure for sx_finance_sms
-- ----------------------------
CREATE TABLE `sx_finance_sms` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `amount` int(10) NOT NULL DEFAULT '0',
  `balance` int(10) NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `editor` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短信增减';

-- ----------------------------
-- Table structure for sx_food_23
-- ----------------------------
CREATE TABLE `sx_food_23` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(50) NOT NULL COMMENT '名称',
  `price` int(10) NOT NULL COMMENT '价格',
  `level` tinyint(4) NOT NULL,
  `hits` int(11) NOT NULL COMMENT '浏览量',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `edittime` int(11) NOT NULL COMMENT '编辑时间',
  `status` tinyint(4) NOT NULL COMMENT '0,1,2,3,4 回收站,拒绝,正常,回收站,用户进入回收站',
  `userid` int(11) NOT NULL COMMENT '用户id',
  `oldstatus` tinyint(4) NOT NULL,
  `introduce` varchar(200) NOT NULL COMMENT '简介',
  `mobile` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `month` varchar(10) NOT NULL,
  `danbao` varchar(50) NOT NULL,
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `catid` (`level`,`itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='餐饮供应';

-- ----------------------------
-- Table structure for sx_food_data_23
-- ----------------------------
CREATE TABLE `sx_food_data_23` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sx_food_log
-- ----------------------------
CREATE TABLE `sx_food_log` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(250) NOT NULL,
  `addtime` int(11) NOT NULL,
  `food_itemid` int(11) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `addtime` (`addtime`,`food_itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sx_form
-- ----------------------------
CREATE TABLE `sx_form` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `verify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `question` int(10) unsigned NOT NULL DEFAULT '0',
  `answer` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromtime` int(10) unsigned NOT NULL DEFAULT '0',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='表单';

-- ----------------------------
-- Table structure for sx_form_answer
-- ----------------------------
CREATE TABLE `sx_form_answer` (
  `aid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `qid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `other` varchar(255) NOT NULL,
  `item` varchar(100) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='表单回复';

-- ----------------------------
-- Table structure for sx_form_question
-- ----------------------------
CREATE TABLE `sx_form_question` (
  `qid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `required` varchar(30) NOT NULL,
  `extend` mediumtext NOT NULL,
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`qid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='表单选项';

-- ----------------------------
-- Table structure for sx_form_record
-- ----------------------------
CREATE TABLE `sx_form_record` (
  `rid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `item` varchar(100) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='表单回复记录';

-- ----------------------------
-- Table structure for sx_friend
-- ----------------------------
CREATE TABLE `sx_friend` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `typeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `truename` varchar(20) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `career` varchar(20) NOT NULL DEFAULT '',
  `telephone` varchar(20) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `homepage` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `ali` varchar(30) NOT NULL DEFAULT '',
  `skype` varchar(30) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的商友';

-- ----------------------------
-- Table structure for sx_gift
-- ----------------------------
CREATE TABLE `sx_gift` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `groupid` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `orders` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromtime` int(10) unsigned NOT NULL DEFAULT '0',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分换礼';

-- ----------------------------
-- Table structure for sx_gift_order
-- ----------------------------
CREATE TABLE `sx_gift_order` (
  `oid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`oid`),
  KEY `itemid` (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分换礼订单';

-- ----------------------------
-- Table structure for sx_group
-- ----------------------------
CREATE TABLE `sx_group` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `fee` float NOT NULL DEFAULT '0',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `marketprice` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `savemoney` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `discount` float unsigned NOT NULL DEFAULT '0',
  `minamount` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `logistic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(100) NOT NULL DEFAULT '',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `pptword` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `orders` int(10) unsigned NOT NULL DEFAULT '0',
  `sales` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `groupid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `company` varchar(100) NOT NULL DEFAULT '',
  `vip` smallint(2) unsigned NOT NULL DEFAULT '0',
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `truename` varchar(30) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `ali` varchar(30) NOT NULL DEFAULT '',
  `skype` varchar(30) NOT NULL DEFAULT '',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `process` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='团购';

-- ----------------------------
-- Table structure for sx_group_data
-- ----------------------------
CREATE TABLE `sx_group_data` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团购内容';

-- ----------------------------
-- Table structure for sx_group_order
-- ----------------------------
CREATE TABLE `sx_group_order` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `buyer` varchar(30) NOT NULL DEFAULT '',
  `seller` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `number` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `logistic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `password` varchar(6) NOT NULL DEFAULT '',
  `buyer_name` varchar(30) NOT NULL DEFAULT '',
  `buyer_address` varchar(255) NOT NULL DEFAULT '',
  `buyer_postcode` varchar(10) NOT NULL DEFAULT '',
  `buyer_phone` varchar(30) NOT NULL DEFAULT '',
  `buyer_mobile` varchar(30) NOT NULL DEFAULT '',
  `send_type` varchar(50) NOT NULL DEFAULT '',
  `send_no` varchar(50) NOT NULL DEFAULT '',
  `send_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `send_time` varchar(20) NOT NULL DEFAULT '',
  `send_days` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` smallint(6) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `buyer_reason` mediumtext NOT NULL,
  `refund_reason` mediumtext NOT NULL,
  `note` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `buyer` (`buyer`),
  KEY `seller` (`seller`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团购订单';

-- ----------------------------
-- Table structure for sx_guestbook
-- ----------------------------
CREATE TABLE `sx_guestbook` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `reply` text NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `truename` varchar(30) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(30) NOT NULL DEFAULT '',
  `ali` varchar(30) NOT NULL DEFAULT '',
  `skype` varchar(30) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言本';

-- ----------------------------
-- Table structure for sx_honor
-- ----------------------------
CREATE TABLE `sx_honor` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `authority` varchar(100) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromtime` int(10) unsigned NOT NULL DEFAULT '0',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='荣誉资质';

-- ----------------------------
-- Table structure for sx_info_22
-- ----------------------------
CREATE TABLE `sx_info_22` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `fee` float NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `pptword` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `thumb1` varchar(255) NOT NULL DEFAULT '',
  `thumb2` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `groupid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `adddate` date NOT NULL DEFAULT '0000-00-00',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `company` varchar(100) NOT NULL DEFAULT '',
  `vip` smallint(2) unsigned NOT NULL DEFAULT '0',
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `truename` varchar(30) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `fax` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `ali` varchar(30) NOT NULL DEFAULT '',
  `skype` varchar(30) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `n1` varchar(100) NOT NULL,
  `n2` varchar(100) NOT NULL,
  `n3` varchar(100) NOT NULL,
  `v1` varchar(100) NOT NULL,
  `v2` varchar(100) NOT NULL,
  `v3` varchar(100) NOT NULL,
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `editdate` date NOT NULL DEFAULT '0000-00-00',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`),
  KEY `edittime` (`edittime`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`),
  KEY `editdate` (`editdate`,`vip`,`edittime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='招商';

-- ----------------------------
-- Table structure for sx_info_24
-- ----------------------------
CREATE TABLE `sx_info_24` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `fee` float NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `pptword` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `thumb1` varchar(255) NOT NULL DEFAULT '',
  `thumb2` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `groupid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `adddate` date NOT NULL DEFAULT '0000-00-00',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `company` varchar(100) NOT NULL DEFAULT '',
  `vip` smallint(2) unsigned NOT NULL DEFAULT '0',
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `truename` varchar(30) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `fax` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `ali` varchar(30) NOT NULL DEFAULT '',
  `skype` varchar(30) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `n1` varchar(100) NOT NULL,
  `n2` varchar(100) NOT NULL,
  `n3` varchar(100) NOT NULL,
  `v1` varchar(100) NOT NULL,
  `v2` varchar(100) NOT NULL,
  `v3` varchar(100) NOT NULL,
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `editdate` date NOT NULL DEFAULT '0000-00-00',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `comments` int(11) NOT NULL,
  `code` char(30) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`),
  KEY `edittime` (`edittime`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`),
  KEY `editdate` (`editdate`,`vip`,`edittime`),
  KEY `code` (`code`(5))
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='羊角会';

-- ----------------------------
-- Table structure for sx_info_data_22
-- ----------------------------
CREATE TABLE `sx_info_data_22` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='招商内容';

-- ----------------------------
-- Table structure for sx_info_data_24
-- ----------------------------
CREATE TABLE `sx_info_data_24` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='羊角会内容';

-- ----------------------------
-- Table structure for sx_job
-- ----------------------------
CREATE TABLE `sx_job` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `fee` float NOT NULL DEFAULT '0',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `pptword` varchar(255) NOT NULL DEFAULT '',
  `department` varchar(100) NOT NULL DEFAULT '',
  `total` smallint(4) unsigned NOT NULL DEFAULT '0',
  `minsalary` int(10) unsigned NOT NULL DEFAULT '0',
  `maxsalary` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `marriage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `education` smallint(2) unsigned NOT NULL DEFAULT '0',
  `experience` smallint(2) unsigned NOT NULL DEFAULT '0',
  `minage` smallint(2) unsigned NOT NULL DEFAULT '0',
  `maxage` smallint(2) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL,
  `apply` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL,
  `groupid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `company` varchar(100) NOT NULL DEFAULT '',
  `vip` smallint(2) unsigned NOT NULL DEFAULT '0',
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `truename` varchar(30) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `ali` varchar(30) NOT NULL DEFAULT '',
  `skype` varchar(30) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `editdate` date NOT NULL DEFAULT '0000-00-00',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `adddate` date NOT NULL DEFAULT '0000-00-00',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0,1,2,3,4 回收站,拒绝,正常,回收站,用户进入回收站',
  `oldstatus` tinyint(4) NOT NULL,
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `likes` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `istop` int(11) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `username` (`userid`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='招聘';

-- ----------------------------
-- Table structure for sx_job_apply
-- ----------------------------
CREATE TABLE `sx_job_apply` (
  `applyid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jobid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resumeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `job_username` varchar(30) NOT NULL DEFAULT '',
  `apply_username` varchar(30) NOT NULL DEFAULT '',
  `applytime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`applyid`),
  KEY `job_username` (`job_username`),
  KEY `apply_username` (`apply_username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应聘工作';

-- ----------------------------
-- Table structure for sx_job_data
-- ----------------------------
CREATE TABLE `sx_job_data` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='招聘内容';

-- ----------------------------
-- Table structure for sx_job_talent
-- ----------------------------
CREATE TABLE `sx_job_talent` (
  `talentid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `resumeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `jointime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`talentid`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='人才库';

-- ----------------------------
-- Table structure for sx_keylink
-- ----------------------------
CREATE TABLE `sx_keylink` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `item` varchar(20) NOT NULL DEFAULT '',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `item` (`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关联链接';

-- ----------------------------
-- Table structure for sx_keyword
-- ----------------------------
CREATE TABLE `sx_keyword` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` smallint(6) NOT NULL DEFAULT '0',
  `word` varchar(255) NOT NULL DEFAULT '',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `letter` varchar(255) NOT NULL DEFAULT '',
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `total_search` int(10) unsigned NOT NULL DEFAULT '0',
  `month_search` int(10) unsigned NOT NULL DEFAULT '0',
  `week_search` int(10) unsigned NOT NULL DEFAULT '0',
  `today_search` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`itemid`),
  KEY `moduleid` (`moduleid`),
  KEY `word` (`word`),
  KEY `letter` (`letter`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关键词';

-- ----------------------------
-- Table structure for sx_like
-- ----------------------------
CREATE TABLE `sx_like` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `id` (`ip`,`type`,`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sx_link
-- ----------------------------
CREATE TABLE `sx_link` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(4) NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Table structure for sx_login
-- ----------------------------
CREATE TABLE `sx_login` (
  `logid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `passsalt` varchar(8) NOT NULL,
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `loginip` varchar(50) NOT NULL DEFAULT '',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL DEFAULT '',
  `agent` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='登录日志';

-- ----------------------------
-- Table structure for sx_mail
-- ----------------------------
CREATE TABLE `sx_mail` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `sendtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件订阅';

-- ----------------------------
-- Table structure for sx_mail_list
-- ----------------------------
CREATE TABLE `sx_mail_list` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `typeids` varchar(255) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订阅列表';

-- ----------------------------
-- Table structure for sx_mail_log
-- ----------------------------
CREATE TABLE `sx_mail_log` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='邮件记录';

-- ----------------------------
-- Table structure for sx_mall
-- ----------------------------
CREATE TABLE `sx_mall` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `mycatid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `fee` float NOT NULL DEFAULT '0',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `brand` varchar(100) NOT NULL DEFAULT '',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `step` mediumtext NOT NULL,
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `unit` varchar(20) NOT NULL,
  `tag` varchar(100) NOT NULL DEFAULT '',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `pptword` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `orders` int(10) unsigned NOT NULL DEFAULT '0',
  `sales` int(10) unsigned NOT NULL DEFAULT '0',
  `comments` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `thumb1` varchar(255) NOT NULL DEFAULT '',
  `thumb2` varchar(255) NOT NULL DEFAULT '',
  `relate_name` varchar(100) NOT NULL,
  `relate_id` varchar(255) NOT NULL,
  `relate_title` varchar(100) NOT NULL,
  `n1` varchar(100) NOT NULL,
  `n2` varchar(100) NOT NULL,
  `n3` varchar(100) NOT NULL,
  `v1` varchar(255) NOT NULL,
  `v2` varchar(255) NOT NULL,
  `v3` varchar(255) NOT NULL,
  `express_1` int(10) unsigned NOT NULL DEFAULT '0',
  `express_name_1` varchar(100) NOT NULL,
  `fee_start_1` decimal(10,2) unsigned NOT NULL,
  `fee_step_1` decimal(10,2) unsigned NOT NULL,
  `express_2` int(10) unsigned NOT NULL DEFAULT '0',
  `express_name_2` varchar(100) NOT NULL,
  `fee_start_2` decimal(10,2) unsigned NOT NULL,
  `fee_step_2` decimal(10,2) unsigned NOT NULL,
  `express_3` int(10) unsigned NOT NULL DEFAULT '0',
  `express_name_3` varchar(100) NOT NULL,
  `fee_start_3` decimal(10,2) unsigned NOT NULL,
  `fee_step_3` decimal(10,2) unsigned NOT NULL,
  `cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `groupid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `company` varchar(100) NOT NULL DEFAULT '',
  `vip` smallint(2) unsigned NOT NULL DEFAULT '0',
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `truename` varchar(30) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `ali` varchar(30) NOT NULL DEFAULT '',
  `skype` varchar(30) NOT NULL DEFAULT '',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `editdate` date NOT NULL DEFAULT '0000-00-00',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `adddate` date NOT NULL DEFAULT '0000-00-00',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`),
  KEY `editdate` (`editdate`,`vip`,`edittime`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商城';

-- ----------------------------
-- Table structure for sx_mall_cart
-- ----------------------------
CREATE TABLE `sx_mall_cart` (
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Table structure for sx_mall_comment
-- ----------------------------
CREATE TABLE `sx_mall_comment` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mallid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `buyer` varchar(30) NOT NULL DEFAULT '',
  `seller` varchar(30) NOT NULL DEFAULT '',
  `buyer_star` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `buyer_comment` text NOT NULL,
  `buyer_ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `buyer_reply` text NOT NULL,
  `buyer_rtime` int(10) unsigned NOT NULL DEFAULT '0',
  `seller_star` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `seller_comment` text NOT NULL,
  `seller_ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `seller_reply` text NOT NULL,
  `seller_rtime` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `itemid` (`itemid`),
  KEY `buyer` (`buyer`),
  KEY `seller` (`seller`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单评论';

-- ----------------------------
-- Table structure for sx_mall_data
-- ----------------------------
CREATE TABLE `sx_mall_data` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商城内容';

-- ----------------------------
-- Table structure for sx_mall_express
-- ----------------------------
CREATE TABLE `sx_mall_express` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `express` varchar(30) NOT NULL,
  `fee_start` decimal(10,2) unsigned NOT NULL,
  `fee_step` decimal(10,2) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='运费模板';

-- ----------------------------
-- Table structure for sx_mall_order
-- ----------------------------
CREATE TABLE `sx_mall_order` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) unsigned NOT NULL DEFAULT '16',
  `mallid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `buyer` varchar(30) NOT NULL DEFAULT '',
  `seller` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `number` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee_name` varchar(30) NOT NULL DEFAULT '',
  `buyer_name` varchar(30) NOT NULL DEFAULT '',
  `buyer_address` varchar(255) NOT NULL DEFAULT '',
  `buyer_postcode` varchar(10) NOT NULL DEFAULT '',
  `buyer_phone` varchar(30) NOT NULL DEFAULT '',
  `buyer_mobile` varchar(30) NOT NULL DEFAULT '',
  `buyer_star` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `seller_star` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `send_type` varchar(50) NOT NULL DEFAULT '',
  `send_no` varchar(50) NOT NULL DEFAULT '',
  `send_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `send_time` varchar(20) NOT NULL DEFAULT '',
  `send_days` int(10) unsigned NOT NULL DEFAULT '0',
  `cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `trade_no` varchar(50) NOT NULL DEFAULT '',
  `add_time` smallint(6) NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `buyer_reason` mediumtext NOT NULL,
  `refund_reason` mediumtext NOT NULL,
  `note` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `buyer` (`buyer`),
  KEY `seller` (`seller`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商城订单';

-- ----------------------------
-- Table structure for sx_mall_stat
-- ----------------------------
CREATE TABLE `sx_mall_stat` (
  `mallid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `seller` varchar(30) NOT NULL DEFAULT '',
  `scomment` int(10) unsigned NOT NULL DEFAULT '0',
  `s1` int(10) unsigned NOT NULL DEFAULT '0',
  `s2` int(10) unsigned NOT NULL DEFAULT '0',
  `s3` int(10) unsigned NOT NULL DEFAULT '0',
  `buyer` varchar(30) NOT NULL DEFAULT '',
  `bcomment` int(10) unsigned NOT NULL DEFAULT '0',
  `b1` int(10) unsigned NOT NULL DEFAULT '0',
  `b2` int(10) unsigned NOT NULL DEFAULT '0',
  `b3` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `mallid` (`mallid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评分统计';

-- ----------------------------
-- Table structure for sx_member
-- ----------------------------
CREATE TABLE `sx_member` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `role` varchar(255) NOT NULL DEFAULT '',
  `groupid` smallint(4) unsigned NOT NULL DEFAULT '4',
  `oldgroupid` tinyint(4) NOT NULL COMMENT '旧用户组',
  `regid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` varchar(50) NOT NULL DEFAULT '',
  `regtime` int(10) unsigned NOT NULL DEFAULT '0',
  `loginip` varchar(50) NOT NULL DEFAULT '',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `logintimes` int(11) NOT NULL COMMENT '登录次数',
  `thumb` varchar(255) NOT NULL,
  `areaid` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `ischu` tinyint(4) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `truename` varchar(5) NOT NULL COMMENT '5',
  `infonums` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `introduce` varchar(200) NOT NULL,
  `infohits` int(11) NOT NULL,
  `infopublishs` int(11) NOT NULL,
  `idcard` char(18) NOT NULL,
  `myapply` int(11) NOT NULL,
  `myorder` int(11) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='会员';

-- ----------------------------
-- Table structure for sx_member_check
-- ----------------------------
CREATE TABLE `sx_member_check` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员资料审核';

-- ----------------------------
-- Table structure for sx_member_group
-- ----------------------------
CREATE TABLE `sx_member_group` (
  `groupid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) NOT NULL DEFAULT '',
  `vip` smallint(2) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='会员组';

-- ----------------------------
-- Table structure for sx_member_link
-- ----------------------------
CREATE TABLE `sx_member_link` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `auth` char(32) NOT NULL,
  `authtime` int(11) NOT NULL,
  `truename` varchar(5) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `auth` (`auth`(5)),
  KEY `email` (`email`(5))
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='ä¼šå‘˜';

-- ----------------------------
-- Table structure for sx_message
-- ----------------------------
CREATE TABLE `sx_message` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `typeid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `fromuser` varchar(30) NOT NULL DEFAULT '',
  `touser` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `isread` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `feedback` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `groupids` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `touser` (`touser`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='站内信件';

-- ----------------------------
-- Table structure for sx_module
-- ----------------------------
CREATE TABLE `sx_module` (
  `moduleid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `moduledir` varchar(20) NOT NULL DEFAULT '',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isblank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='模型';

-- ----------------------------
-- Table structure for sx_news
-- ----------------------------
CREATE TABLE `sx_news` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公司新闻';

-- ----------------------------
-- Table structure for sx_news_data
-- ----------------------------
CREATE TABLE `sx_news_data` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公司新闻内容';

-- ----------------------------
-- Table structure for sx_nums
-- ----------------------------
CREATE TABLE `sx_nums` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `finance_nums` int(11) NOT NULL COMMENT '融资成功数',
  `invest_nums` int(11) NOT NULL COMMENT '投资笔数',
  `invest_money` bigint(20) NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sx_oauth
-- ----------------------------
CREATE TABLE `sx_oauth` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `site` varchar(30) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logintimes` int(10) unsigned NOT NULL DEFAULT '0',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`),
  KEY `site` (`site`,`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='一键登录';

-- ----------------------------
-- Table structure for sx_online
-- ----------------------------
CREATE TABLE `sx_online` (
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `moduleid` int(10) unsigned NOT NULL DEFAULT '0',
  `online` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lasttime` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='在线会员';

-- ----------------------------
-- Table structure for sx_page
-- ----------------------------
CREATE TABLE `sx_page` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公司单页';

-- ----------------------------
-- Table structure for sx_page_data
-- ----------------------------
CREATE TABLE `sx_page_data` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公司单页内容';

-- ----------------------------
-- Table structure for sx_photo_12
-- ----------------------------
CREATE TABLE `sx_photo_12` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `fee` float NOT NULL DEFAULT '0',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `pptword` varchar(255) NOT NULL DEFAULT '',
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `open` tinyint(1) unsigned NOT NULL DEFAULT '3',
  `password` varchar(30) NOT NULL DEFAULT '',
  `question` varchar(30) NOT NULL DEFAULT '',
  `answer` varchar(30) NOT NULL DEFAULT '',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图库';

-- ----------------------------
-- Table structure for sx_photo_data_12
-- ----------------------------
CREATE TABLE `sx_photo_data_12` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图库内容';

-- ----------------------------
-- Table structure for sx_photo_item_12
-- ----------------------------
CREATE TABLE `sx_photo_item_12` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item` bigint(20) unsigned NOT NULL DEFAULT '0',
  `introduce` text NOT NULL,
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `listorder` (`listorder`),
  KEY `item` (`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图库图片';

-- ----------------------------
-- Table structure for sx_poll
-- ----------------------------
CREATE TABLE `sx_poll` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `verify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `thumb_width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thumb_height` smallint(6) unsigned NOT NULL DEFAULT '0',
  `poll_max` smallint(6) unsigned NOT NULL DEFAULT '0',
  `poll_page` smallint(6) unsigned NOT NULL DEFAULT '0',
  `poll_cols` smallint(6) unsigned NOT NULL DEFAULT '0',
  `poll_order` smallint(6) unsigned NOT NULL DEFAULT '0',
  `polls` int(10) unsigned NOT NULL DEFAULT '0',
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromtime` int(10) unsigned NOT NULL DEFAULT '0',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `template_poll` varchar(30) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='票选';

-- ----------------------------
-- Table structure for sx_poll_item
-- ----------------------------
CREATE TABLE `sx_poll_item` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pollid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `polls` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `pollid` (`pollid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='票选选项';

-- ----------------------------
-- Table structure for sx_poll_record
-- ----------------------------
CREATE TABLE `sx_poll_record` (
  `rid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `pollid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `polltime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='票选记录';

-- ----------------------------
-- Table structure for sx_question
-- ----------------------------
CREATE TABLE `sx_question` (
  `qid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`qid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='验证问题';

-- ----------------------------
-- Table structure for sx_quote_price
-- ----------------------------
CREATE TABLE `sx_quote_price` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL,
  `market` smallint(6) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL,
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `company` varchar(100) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `addtime` (`addtime`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行情报价';

-- ----------------------------
-- Table structure for sx_resume
-- ----------------------------
CREATE TABLE `sx_resume` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `fee` float NOT NULL DEFAULT '0',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `truename` varchar(30) NOT NULL DEFAULT '',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `age` smallint(2) unsigned NOT NULL DEFAULT '0',
  `marriage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `height` smallint(2) unsigned NOT NULL DEFAULT '0',
  `weight` smallint(2) unsigned NOT NULL DEFAULT '0',
  `education` smallint(2) unsigned NOT NULL DEFAULT '0',
  `school` varchar(100) NOT NULL DEFAULT '',
  `major` varchar(100) NOT NULL DEFAULT '',
  `skill` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(255) NOT NULL DEFAULT '',
  `minsalary` int(10) unsigned NOT NULL DEFAULT '0',
  `maxsalary` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `experience` smallint(2) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `ali` varchar(30) NOT NULL DEFAULT '',
  `skype` varchar(30) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '0',
  `situation` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `oldstatus` tinyint(4) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`),
  KEY `edittime` (`edittime`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='简历';

-- ----------------------------
-- Table structure for sx_resume_data
-- ----------------------------
CREATE TABLE `sx_resume_data` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='简历内容';

-- ----------------------------
-- Table structure for sx_sell_5
-- ----------------------------
CREATE TABLE `sx_sell_5` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `price` varchar(10) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `company` varchar(50) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `editdate` date NOT NULL DEFAULT '0000-00-00',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `adddate` date NOT NULL DEFAULT '0000-00-00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `oldstatus` int(11) NOT NULL,
  `month` int(10) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `fee` varchar(50) NOT NULL,
  `apr` varchar(10) NOT NULL,
  `bonding` varchar(50) NOT NULL,
  `setbacks` varchar(10) NOT NULL,
  `setstatus` tinyint(4) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `editdate` (`editdate`,`edittime`),
  KEY `edittime` (`edittime`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='供应';

-- ----------------------------
-- Table structure for sx_sell_data_5
-- ----------------------------
CREATE TABLE `sx_sell_data_5` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='供应内容';

-- ----------------------------
-- Table structure for sx_sell_search_5
-- ----------------------------
CREATE TABLE `sx_sell_search_5` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sorttime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='供应搜索';

-- ----------------------------
-- Table structure for sx_send_log
-- ----------------------------
CREATE TABLE `sx_send_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `ip` varchar(20) NOT NULL COMMENT 'IP号',
  `day` int(4) NOT NULL COMMENT '某天',
  `check_time` int(11) NOT NULL COMMENT '验证时间',
  `num` tinyint(4) NOT NULL COMMENT '次数  一天3次',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `mobile_code` varchar(64) NOT NULL COMMENT '验证码与手机的加密验证',
  `check_num` tinyint(1) NOT NULL COMMENT '验证次数  3次失效',
  PRIMARY KEY (`log_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='短信发送日志';

-- ----------------------------
-- Table structure for sx_session
-- ----------------------------
CREATE TABLE `sx_session` (
  `sessionid` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `sessionid` (`sessionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SESSION';

-- ----------------------------
-- Table structure for sx_setting
-- ----------------------------
CREATE TABLE `sx_setting` (
  `item` varchar(30) NOT NULL DEFAULT '',
  `item_key` varchar(100) NOT NULL DEFAULT '',
  `item_value` text NOT NULL,
  KEY `item` (`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='网站设置';

-- ----------------------------
-- Table structure for sx_sms
-- ----------------------------
CREATE TABLE `sx_sms` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(30) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `word` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `sendtime` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短信记录';

-- ----------------------------
-- Table structure for sx_sphinx
-- ----------------------------
CREATE TABLE `sx_sphinx` (
  `moduleid` int(10) unsigned NOT NULL DEFAULT '0',
  `maxid` bigint(20) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `moduleid` (`moduleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Sphinx';

-- ----------------------------
-- Table structure for sx_spread
-- ----------------------------
CREATE TABLE `sx_spread` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `word` varchar(50) NOT NULL DEFAULT '',
  `price` float NOT NULL DEFAULT '0',
  `currency` varchar(30) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromtime` int(10) unsigned NOT NULL DEFAULT '0',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='排名推广';

-- ----------------------------
-- Table structure for sx_spread_price
-- ----------------------------
CREATE TABLE `sx_spread_price` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL DEFAULT '',
  `sell_price` float NOT NULL DEFAULT '0',
  `buy_price` float NOT NULL DEFAULT '0',
  `company_price` float NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='排名起价';

-- ----------------------------
-- Table structure for sx_style
-- ----------------------------
CREATE TABLE `sx_style` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `skin` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(50) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `groupid` varchar(30) NOT NULL DEFAULT '',
  `fee` float NOT NULL DEFAULT '0',
  `currency` varchar(20) NOT NULL DEFAULT '',
  `money` float NOT NULL DEFAULT '0',
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='公司主页模板';

-- ----------------------------
-- Table structure for sx_type
-- ----------------------------
CREATE TABLE `sx_type` (
  `typeid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(4) NOT NULL DEFAULT '0',
  `typename` varchar(255) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `item` varchar(20) NOT NULL DEFAULT '',
  `cache` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`typeid`),
  KEY `listorder` (`listorder`),
  KEY `item` (`item`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='分类';

-- ----------------------------
-- Table structure for sx_upgrade
-- ----------------------------
CREATE TABLE `sx_upgrade` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `groupid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `amount` float NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `company` varchar(100) NOT NULL DEFAULT '',
  `truename` varchar(30) NOT NULL DEFAULT '',
  `telephone` varchar(30) NOT NULL DEFAULT '',
  `mobile` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(30) NOT NULL DEFAULT '',
  `ali` varchar(30) NOT NULL DEFAULT '',
  `skype` varchar(30) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `promo_code` varchar(30) NOT NULL DEFAULT '',
  `promo_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `promo_amount` float NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员升级';

-- ----------------------------
-- Table structure for sx_upload_0
-- ----------------------------
CREATE TABLE `sx_upload_0` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(32) NOT NULL DEFAULT '',
  `moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fileurl` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` varchar(10) NOT NULL DEFAULT '',
  `upfrom` varchar(10) NOT NULL DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `item` (`item`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='上传记录0';

-- ----------------------------
-- Table structure for sx_upload_1
-- ----------------------------
CREATE TABLE `sx_upload_1` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(32) NOT NULL DEFAULT '',
  `moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fileurl` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` varchar(10) NOT NULL DEFAULT '',
  `upfrom` varchar(10) NOT NULL DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `item` (`item`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='上传记录1';

-- ----------------------------
-- Table structure for sx_upload_2
-- ----------------------------
CREATE TABLE `sx_upload_2` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(32) NOT NULL DEFAULT '',
  `moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fileurl` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` varchar(10) NOT NULL DEFAULT '',
  `upfrom` varchar(10) NOT NULL DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `item` (`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上传记录2';

-- ----------------------------
-- Table structure for sx_upload_3
-- ----------------------------
CREATE TABLE `sx_upload_3` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(32) NOT NULL DEFAULT '',
  `moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fileurl` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` varchar(10) NOT NULL DEFAULT '',
  `upfrom` varchar(10) NOT NULL DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `item` (`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上传记录3';

-- ----------------------------
-- Table structure for sx_upload_4
-- ----------------------------
CREATE TABLE `sx_upload_4` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(32) NOT NULL DEFAULT '',
  `moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fileurl` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` varchar(10) NOT NULL DEFAULT '',
  `upfrom` varchar(10) NOT NULL DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `item` (`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上传记录4';

-- ----------------------------
-- Table structure for sx_upload_5
-- ----------------------------
CREATE TABLE `sx_upload_5` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(32) NOT NULL DEFAULT '',
  `moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fileurl` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` varchar(10) NOT NULL DEFAULT '',
  `upfrom` varchar(10) NOT NULL DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `item` (`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上传记录5';

-- ----------------------------
-- Table structure for sx_upload_6
-- ----------------------------
CREATE TABLE `sx_upload_6` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(32) NOT NULL DEFAULT '',
  `moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fileurl` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` varchar(10) NOT NULL DEFAULT '',
  `upfrom` varchar(10) NOT NULL DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `item` (`item`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='上传记录6';

-- ----------------------------
-- Table structure for sx_upload_7
-- ----------------------------
CREATE TABLE `sx_upload_7` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(32) NOT NULL DEFAULT '',
  `moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fileurl` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` varchar(10) NOT NULL DEFAULT '',
  `upfrom` varchar(10) NOT NULL DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `item` (`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上传记录7';

-- ----------------------------
-- Table structure for sx_upload_8
-- ----------------------------
CREATE TABLE `sx_upload_8` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(32) NOT NULL DEFAULT '',
  `moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fileurl` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` varchar(10) NOT NULL DEFAULT '',
  `upfrom` varchar(10) NOT NULL DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `item` (`item`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='上传记录8';

-- ----------------------------
-- Table structure for sx_upload_9
-- ----------------------------
CREATE TABLE `sx_upload_9` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(32) NOT NULL DEFAULT '',
  `moduleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fileurl` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` varchar(10) NOT NULL DEFAULT '',
  `upfrom` varchar(10) NOT NULL DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `item` (`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上传记录9';

-- ----------------------------
-- Table structure for sx_validate
-- ----------------------------
CREATE TABLE `sx_validate` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `thumb1` varchar(255) NOT NULL DEFAULT '',
  `thumb2` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资料认证';

-- ----------------------------
-- Table structure for sx_video_14
-- ----------------------------
CREATE TABLE `sx_video_14` (
  `itemid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `fee` float NOT NULL DEFAULT '0',
  `tag` varchar(255) NOT NULL DEFAULT '',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `pptword` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `video` varchar(255) NOT NULL DEFAULT '',
  `mobile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `player` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `introduce` varchar(255) NOT NULL DEFAULT '',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`),
  KEY `username` (`username`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='视频';

-- ----------------------------
-- Table structure for sx_video_data_14
-- ----------------------------
CREATE TABLE `sx_video_data_14` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='视频内容';

-- ----------------------------
-- Table structure for sx_vote
-- ----------------------------
CREATE TABLE `sx_vote` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(10) unsigned NOT NULL DEFAULT '0',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `verify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `choose` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote_min` smallint(2) unsigned NOT NULL DEFAULT '0',
  `vote_max` smallint(2) unsigned NOT NULL DEFAULT '0',
  `votes` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromtime` int(10) unsigned NOT NULL DEFAULT '0',
  `totime` int(10) unsigned NOT NULL DEFAULT '0',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `linkto` varchar(255) NOT NULL DEFAULT '',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `template_vote` varchar(30) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '',
  `s1` varchar(255) NOT NULL DEFAULT '',
  `s2` varchar(255) NOT NULL DEFAULT '',
  `s3` varchar(255) NOT NULL DEFAULT '',
  `s4` varchar(255) NOT NULL DEFAULT '',
  `s5` varchar(255) NOT NULL DEFAULT '',
  `s6` varchar(255) NOT NULL DEFAULT '',
  `s7` varchar(255) NOT NULL DEFAULT '',
  `s8` varchar(255) NOT NULL DEFAULT '',
  `s9` varchar(255) NOT NULL DEFAULT '',
  `s10` varchar(255) NOT NULL DEFAULT '',
  `v1` int(10) unsigned NOT NULL DEFAULT '0',
  `v2` int(10) unsigned NOT NULL DEFAULT '0',
  `v3` int(10) unsigned NOT NULL DEFAULT '0',
  `v4` int(10) unsigned NOT NULL DEFAULT '0',
  `v5` int(10) unsigned NOT NULL DEFAULT '0',
  `v6` int(10) unsigned NOT NULL DEFAULT '0',
  `v7` int(10) unsigned NOT NULL DEFAULT '0',
  `v8` int(10) unsigned NOT NULL DEFAULT '0',
  `v9` int(10) unsigned NOT NULL DEFAULT '0',
  `v10` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `userid` (`userid`,`type`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='投票';

-- ----------------------------
-- Table structure for sx_vote_record
-- ----------------------------
CREATE TABLE `sx_vote_record` (
  `rid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `votetime` int(10) unsigned NOT NULL DEFAULT '0',
  `votes` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  KEY `itemid` (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票记录';

-- ----------------------------
-- Table structure for sx_webpage
-- ----------------------------
CREATE TABLE `sx_webpage` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(30) NOT NULL DEFAULT '',
  `areaid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `style` varchar(50) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `seo_title` varchar(255) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `editor` varchar(30) NOT NULL DEFAULT '',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(4) NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `linkurl` varchar(255) NOT NULL DEFAULT '',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='单网页';

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `sx_ad` VALUES ('20', '图片1', '37', '4', '0', '0', '', 'http://03.8660.org/about/compintro.html', '', '0', 'shixun03d98', '1456657579', '', '1461640922', '1456588800', '1551283199', '0', '', '', '', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201604/24/1010286118.jpg', 'http://03.8660.org/about/compintro.html', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('21', '图片2', '37', '4', '0', '0', '', 'http://03.8660.org/invest/list.php', '', '0', '8392673132', '1456657602', '', '1461640764', '1456588800', '1551283199', '0', '', '', '', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201604/24/1012284418.jpg', 'http://03.8660.org/invest/list.php', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('50', '图片3', '37', '4', '0', '0', '', 'http://03.8660.org/about/compintro.html', '', '0', '8392673132', '1461390476', '', '1461641117', '1461340800', '1556035199', '0', '', '', '', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201604/26/112456940.jpg', 'http://03.8660.org/about/compintro.html', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('51', '关于我们', '78', '3', '0', '0', '', '', '', '0', '8392673132', '1461391115', '', '1461564751', '1461340800', '1556035199', '0', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201604/25/141229100.jpg', '', '', '', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('52', '融资业务', '79', '3', '0', '0', '', '', '', '0', '8392673132', '1461392400', '', '1461564813', '1461340800', '1556035199', '0', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201604/25/141329790.jpg', '', '', '', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('53', '投资理财', '80', '3', '0', '0', '', '', '', '0', '8392673132', '1461392875', '', '1461564788', '1461340800', '1556035199', '0', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201604/25/141304780.jpg', '', '', '', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('54', '最新资讯', '81', '3', '0', '0', '', '', '', '0', '8392673132', '1461392993', '', '1461564724', '1461340800', '1556035199', '0', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201604/25/141201170.jpg', '', '', '', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('55', ' 常见问题', '82', '3', '0', '0', '', '', '', '0', '8392673132', '1461393135', '8392673132', '1461464023', '1461340800', '1556035199', '0', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201604/24/1013405418.jpg', '', '', '', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('56', ' 公告', '83', '3', '0', '0', '', '', '', '0', '8392673132', '1461395101', '', '1461634226', '1461340800', '1556035199', '0', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201604/26/093024140.jpg', '', '', '', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('57', '焦点图', '80', '3', '0', '0', '', '', '', '0', '', '1461565478', '', '1461565478', '1461513600', '1491062399', '0', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201604/25/142354990.jpg', '', '', '', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('58', '图片1', '84', '4', '0', '0', '', '', '', '0', '', '1462078992', '', '1462078992', '1462032000', '1556726399', '0', '', '', '', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201605/01/130304810.jpg', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('59', '图2', '84', '4', '0', '0', '', '', '', '0', '', '1462079013', '', '1462079013', '1462032000', '1556726399', '0', '', '', '', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201605/01/130326610.jpg', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('60', '图3', '84', '4', '0', '0', '', '', '', '0', '', '1462079031', '', '1462079031', '1462032000', '1556726399', '0', '', '', '', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201605/01/130344630.jpg', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('61', '融资业务', '85', '3', '0', '0', '', '', '', '0', '', '1462079076', '', '1462079076', '1462032000', '1556726399', '0', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201605/01/130432950.jpg', '', '', '', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('62', '投资理财', '86', '3', '0', '0', '', '', '', '0', '', '1462079131', '', '1462079131', '1462032000', '1556726399', '0', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201605/01/130527940.jpg', '', '', '', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('63', '关于我们', '87', '3', '0', '0', '', '', '', '0', '', '1462079186', '', '1462079186', '1462032000', '1556726399', '0', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201605/01/130621360.jpg', '', '', '', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('64', '最新资讯', '88', '3', '0', '0', '', '', '', '0', '', '1462079249', '', '1462079249', '1462032000', '1556726399', '0', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201605/01/130720320.jpg', '', '', '', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad` VALUES ('65', '常见问题', '89', '3', '0', '0', '', '', '', '0', '', '1462079303', '', '1462079303', '1462032000', '1556726399', '0', '', '', '', '', '', '', 'http://03.8660.org/file/upload/201605/01/130817380.jpg', '', '', '', '', '1', '0', '0', '', '0', '0', '3');
INSERT INTO `sx_ad_place` VALUES ('37', '0', '4', '1', '首页滚动图片', '', '', '', '', '1920', '630', '0', '3', '0', '1456657556', '', '1461568027', '');
INSERT INTO `sx_ad_place` VALUES ('78', '0', '3', '1', '关于我们', '', '', '', '', '1920', '400', '0', '1', '0', '1461391085', '8392673132', '1461391085', '');
INSERT INTO `sx_ad_place` VALUES ('79', '0', '3', '1', '融资业务', '', '', '', '', '1920', '492', '0', '1', '0', '1461392385', '8392673132', '1461392385', '');
INSERT INTO `sx_ad_place` VALUES ('80', '0', '3', '1', '投资理财', '', '', '', '', '1920', '401', '0', '2', '0', '1461392853', '8392673132', '1461392853', '');
INSERT INTO `sx_ad_place` VALUES ('81', '0', '3', '1', '最新资讯', '', '', '', '', '1920', '402', '0', '1', '0', '1461392977', '8392673132', '1461392977', '');
INSERT INTO `sx_ad_place` VALUES ('82', '0', '3', '1', '常见问题', '', '', '', '', '1920', '399', '0', '1', '0', '1461393105', '8392673132', '1461393105', '');
INSERT INTO `sx_ad_place` VALUES ('83', '0', '3', '1', '公告', '', '', '', '', '1920', '400', '0', '1', '0', '1461395089', '8392673132', '1461395089', '');
INSERT INTO `sx_ad_place` VALUES ('84', '0', '4', '1', '手机端-首页滚动图', '', '', '', '', '720', '350', '0', '3', '0', '1462078954', '', '1462078954', '');
INSERT INTO `sx_ad_place` VALUES ('85', '0', '3', '1', '手机端-融资业务', '', '', '', '', '720', '350', '0', '1', '0', '1462079055', '', '1462079055', '');
INSERT INTO `sx_ad_place` VALUES ('86', '0', '3', '1', '手机端-投资理财', '', '', '', '', '720', '350', '0', '1', '0', '1462079098', '', '1462079098', '');
INSERT INTO `sx_ad_place` VALUES ('87', '0', '3', '1', '手机端-关于我们', '', '', '', '', '720', '199', '0', '1', '0', '1462079150', '', '1462079166', '');
INSERT INTO `sx_ad_place` VALUES ('88', '0', '3', '1', '手机端-最新资讯', '', '', '', '', '720', '350', '0', '1', '0', '1462079212', '', '1462079212', '');
INSERT INTO `sx_ad_place` VALUES ('89', '0', '3', '1', '手机端-常见问题', '', '', '', '', '720', '350', '0', '1', '0', '1462079274', '', '1462079274', '');
INSERT INTO `sx_admin` VALUES ('1', '1', '0', '生成首页', '?action=html', '', '0', '', '', '');
INSERT INTO `sx_admin` VALUES ('2', '1', '0', '更新缓存', '?action=cache', '', '0', '', '', '');
INSERT INTO `sx_admin` VALUES ('3', '1', '0', '网站设置', '?file=setting', '', '0', '', '', '');
INSERT INTO `sx_admin` VALUES ('4', '1', '0', '模块管理', '?file=module', '', '0', '', '', '');
INSERT INTO `sx_admin` VALUES ('5', '1', '0', '数据维护', '?file=database', '', '0', '', '', '');
INSERT INTO `sx_admin` VALUES ('6', '1', '0', '模板管理', '?file=template', '', '0', '', '', '');
INSERT INTO `sx_admin` VALUES ('7', '1', '0', '会员管理', '?moduleid=2', '', '0', '', '', '');
INSERT INTO `sx_admin` VALUES ('8', '1', '0', '单页管理', '?moduleid=3&file=webpage', '', '0', '', '', '');
INSERT INTO `sx_admin` VALUES ('9', '1', '0', '排名推广', '?moduleid=3&file=spread', '', '0', '', '', '');
INSERT INTO `sx_admin` VALUES ('10', '1', '0', '广告管理', '?moduleid=3&file=ad', '', '0', '', '', '');
INSERT INTO `sx_admin` VALUES ('11', '21', '0', '团购管理', '?moduleid=17', '', '0', '', '', '');
INSERT INTO `sx_admin` VALUES ('12', '23', '0', '', '', '', '7', 'index', '', '');
INSERT INTO `sx_admin` VALUES ('13', '23', '0', '行情管理', '?moduleid=7', '', '0', '', '', '');
INSERT INTO `sx_admin` VALUES ('14', '23', '0', '', '', '', '12', 'index', '', '');
INSERT INTO `sx_admin` VALUES ('15', '23', '0', '图库管理', '?moduleid=12', '', '0', '', '', '');
INSERT INTO `sx_admin_online` VALUES ('0c2e86a1804486a285a664fd703c4faa', '8392673132', '119.130.221.5', '3', 'moduleid=3&file=webpage&item=1', '1461507424');
INSERT INTO `sx_admin_user` VALUES ('1', 'admin', '7cfbf23eb78ba88aa0be604f9a372c2d', '', '1', '0', '0', '1461563294', '183.6.143.173', '41', '1');
INSERT INTO `sx_apply` VALUES ('1', '1.50', '12', '1458890139', '0', '11,12,13,14,15,17,18,20,21,22,23,24,25,26,28,29,31,32,33,34,35,36,37,39', '0');
INSERT INTO `sx_area` VALUES ('1', '浙江省', '0', '0', '1', '1,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145', '1', '0', '0');
INSERT INTO `sx_area` VALUES ('2', '北京市', '0', '0', '1', '2,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164', '2', '0', '1');
INSERT INTO `sx_area` VALUES ('3', '上海市', '0', '0', '1', '3,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201', '3', '0', '1');
INSERT INTO `sx_area` VALUES ('4', '天津市', '0', '0', '1', '4,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182', '4', '0', '1');
INSERT INTO `sx_area` VALUES ('5', '重庆市', '0', '0', '1', '5,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242', '5', '0', '0');
INSERT INTO `sx_area` VALUES ('6', '河北省', '0', '0', '1', '6,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426', '6', '0', '0');
INSERT INTO `sx_area` VALUES ('7', '山西省', '0', '0', '1', '7,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556', '7', '0', '0');
INSERT INTO `sx_area` VALUES ('8', '内蒙古自治区', '0', '0', '1', '8,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,667,668', '8', '0', '0');
INSERT INTO `sx_area` VALUES ('9', '辽宁省', '0', '0', '1', '9,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,728,729,730,731,732,733,734,735,736,737,738,739,740,741,742,743,744,745,746,747,748,749,750,751,752,753,754,755,756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,773,774,775,776,777,778,779,780,781,782,783', '9', '0', '0');
INSERT INTO `sx_area` VALUES ('10', '吉林省', '0', '0', '1', '10,784,785,786,787,788,789,790,791,792,793,794,795,796,797,798,799,800,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817,818,819,820,821,822,823,824,825,826,827,828,829,830,831,832,833,834,835,836,837,838,839,840,841,842,843,844,845,846,847,848,849,850,851', '10', '0', '0');
INSERT INTO `sx_area` VALUES ('11', '黑龙江省', '0', '0', '1', '11,852,853,854,855,856,857,858,859,860,861,862,863,864,865,866,867,868,869,870,871,872,873,874,875,876,877,878,879,880,881,882,883,884,885,886,887,888,889,890,891,892,893,894,895,896,897,898,899,900,901,902,903,904,905,906,907,908,909,910,911,912,913,914,915,916,917,918,919,920,921,922,923,924,925,926,927,928,929,930,931,932,933,934,935,936,937,938,939,940,941,942,943,944,945,946,947,948,949,950,951,952,953,954,955,956,957,958,959,960,961,962,963,964,965,966,967,968,969,970,971,972,973,974,975,976,977,978,979,980,981,982,983,984,985,986,987,988,989,990,991,992,993,994', '11', '0', '0');
INSERT INTO `sx_area` VALUES ('12', '江苏省', '0', '0', '1', '12,995,996,997,998,999,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117', '12', '0', '0');
INSERT INTO `sx_area` VALUES ('13', '安徽省', '0', '0', '1', '13,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1131,1132,1133,1134,1135,1136,1137,1138,1139,1140,1141,1142,1143,1144,1145,1146,1147,1148,1149,1150,1151,1152,1153,1154,1155,1156,1157,1158,1159,1160,1161,1162,1163,1164,1165,1166,1167,1168,1169,1170,1171,1172,1173,1174,1175,1176,1177,1178,1179,1180,1181,1182,1183,1184,1185,1186,1187,1188,1189,1190,1191,1192,1193,1194,1195,1196,1197,1198,1199,1200,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1212,1213,1214,1215,1216,1217,1218,1219,1220,1221,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1234,1235,1236,1237,1238,1239,1240,1241,1242', '13', '0', '0');
INSERT INTO `sx_area` VALUES ('14', '福建省', '0', '0', '1', '14,1243,1244,1245,1246,1247,1248,1249,1250,1251,1252,1253,1254,1255,1256,1257,1258,1259,1260,1261,1262,1263,1264,1265,1266,1267,1268,1269,1270,1271,1272,1273,1274,1275,1276,1277,1278,1279,1280,1281,1282,1283,1284,1285,1286,1287,1288,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1299,1300,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311,1312,1313,1314,1315,1316,1317,1318,1319,1320,1321,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1332,1333,1334,1335,1336,1337', '14', '0', '0');
INSERT INTO `sx_area` VALUES ('15', '江西省', '0', '0', '1', '15,1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,1351,1352,1353,1354,1355,1356,1357,1358,1359,1360,1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373,1374,1375,1376,1377,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392,1393,1394,1395,1396,1397,1398,1399,1400,1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1435,1436,1437,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447,1448,1449,1450,1451,1452,1453,1454,1455,1456,1457', '15', '0', '0');
INSERT INTO `sx_area` VALUES ('16', '山东省', '0', '0', '1', '16,1458,1459,1460,1461,1462,1463,1464,1465,1466,1467,1468,1469,1470,1471,1472,1473,1474,1475,1476,1477,1478,1479,1480,1481,1482,1483,1484,1485,1486,1487,1488,1489,1490,1491,1492,1493,1494,1495,1496,1497,1498,1499,1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1517,1518,1519,1520,1521,1522,1523,1524,1525,1526,1527,1528,1529,1530,1531,1532,1533,1534,1535,1536,1537,1538,1539,1540,1541,1542,1543,1544,1545,1546,1547,1548,1549,1550,1551,1552,1553,1554,1555,1556,1557,1558,1559,1560,1561,1562,1563,1564,1565,1566,1567,1568,1569,1570,1571,1572,1573,1574,1575,1576,1577,1578,1579,1580,1581,1582,1583,1584,1585,1586,1587,1588,1589,1590,1591,1592,1593,1594,1595,1596,1597,1598,1599,1600,1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1611,1612,1613,1614', '16', '0', '0');
INSERT INTO `sx_area` VALUES ('17', '河南省', '0', '0', '1', '17,1615,1616,1617,1618,1619,1620,1621,1622,1623,1624,1625,1626,1627,1628,1629,1630,1631,1632,1633,1634,1635,1636,1637,1638,1639,1640,1641,1642,1643,1644,1645,1646,1647,1648,1649,1650,1651,1652,1653,1654,1655,1656,1657,1658,1659,1660,1661,1662,1663,1664,1665,1666,1667,1668,1669,1670,1671,1672,1673,1674,1675,1676,1677,1678,1679,1680,1681,1682,1683,1684,1685,1686,1687,1688,1689,1690,1691,1692,1693,1694,1695,1696,1697,1698,1699,1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1711,1712,1713,1714,1715,1716,1717,1718,1719,1720,1721,1722,1723,1724,1725,1726,1727,1728,1729,1730,1731,1732,1733,1734,1735,1736,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1770,1771,1772,1773,1774,1775,1776,1777,1778,1779,1780,1781,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809', '17', '0', '0');
INSERT INTO `sx_area` VALUES ('18', '湖北省', '0', '0', '1', '18,1810,1811,1812,1813,1814,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825,1826,1827,1828,1829,1830,1831,1832,1833,1834,1835,1836,1837,1838,1839,1840,1841,1842,1843,1844,1845,1846,1847,1848,1849,1850,1851,1852,1853,1854,1855,1856,1857,1858,1859,1860,1861,1862,1863,1864,1865,1866,1867,1868,1869,1870,1871,1872,1873,1874,1875,1876,1877,1878,1879,1880,1881,1882,1883,1884,1885,1886,1887,1888,1889,1890,1891,1892,1893,1894,1895,1896,1897,1898,1899,1900,1901,1902,1903,1904,1905,1906,1907,1908,1909,1910,1911,1912,1913,1914,1915,1916,1917,1918,1919,1920,1921,1922,1923,1924,1925,1926,1927,1928', '18', '0', '0');
INSERT INTO `sx_area` VALUES ('19', '湖南省', '0', '0', '1', '19,1929,1930,1931,1932,1933,1934,1935,1936,1937,1938,1939,1940,1941,1942,1943,1944,1945,1946,1947,1948,1949,1950,1951,1952,1953,1954,1955,1956,1957,1958,1959,1960,1961,1962,1963,1964,1965,1966,1967,1968,1969,1970,1971,1972,1973,1974,1975,1976,1977,1978,1979,1980,1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064', '19', '0', '0');
INSERT INTO `sx_area` VALUES ('20', '广东省', '0', '0', '1', '20,2065,2066,2067,2068,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124,2125,2126,2127,2128,2129,2130,2131,2132,2133,2134,2135,2136,2137,2138,2139,2140,2141,2142,2143,2144,2145,2146,2147,2148,2149,2150,2151,2152,2153,2154,2155,2156,2157,2158,2159,2160,2161,2162,2163,2164,2165,2166,2167,2168,2169,2170,2171,2172,2173,2174,2175,2176,2177,2178,2179,2180,2181,2182,2183,2184,2185,2186,2187,2188,2189,2190,2191,2192,2193,2194,2195,2196,2197,2198,2199,2200,2201,2202,2203,2204,2205,2206,2207,2208,2209,2210,2211,2212,2213,2214,2215,2216,2217,2218,2219,2220,2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,2231,2232,2233,2234,2235,2236,2237,2238,2239,2240,2241,2242,2243', '20', '0', '0');
INSERT INTO `sx_area` VALUES ('21', '广西壮族自治区', '0', '0', '1', '21,2244,2245,2246,2247,2248,2249,2250,2251,2252,2253,2254,2255,2256,2257,2258,2259,2260,2261,2262,2263,2264,2265,2266,2267,2268,2269,2270,2271,2272,2273,2274,2275,2276,2277,2278,2279,2280,2281,2282,2283,2284,2285,2286,2287,2288,2289,2290,2291,2292,2293,2294,2295,2296,2297,2298,2299,2300,2301,2302,2303,2304,2305,2306,2307,2308,2309,2310,2311,2312,2313,2314,2315,2316,2317,2318,2319,2320,2321,2322,2323,2324,2325,2326,2327,2328,2329,2330,2331,2332,2333,2334,2335,2336,2337,2338,2339,2340,2341,2342,2343,2344,2345,2346,2347,2348,2349,2350,2351,2352,2353,2354,2355,2356,2357,2358,2359,2360,2361,2362,2363,2364,2365,2366', '21', '0', '0');
INSERT INTO `sx_area` VALUES ('22', '海南省', '0', '0', '1', '22,2367,2368,2369,2370,2371,2372,2373,2374,2375,2376,2377,2378,2379,2380,2381,2382,2383,2384,2385,2386,2387,2388,2389,2390,2391', '22', '0', '0');
INSERT INTO `sx_area` VALUES ('23', '四川省', '0', '0', '1', '23,2392,2393,2394,2395,2396,2397,2398,2399,2400,2401,2402,2403,2404,2405,2406,2407,2408,2409,2410,2411,2412,2413,2414,2415,2416,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2429,2430,2431,2432,2433,2434,2435,2436,2437,2438,2439,2440,2441,2442,2443,2444,2445,2446,2447,2448,2449,2450,2451,2452,2453,2454,2455,2456,2457,2458,2459,2460,2461,2462,2463,2464,2465,2466,2467,2468,2469,2470,2471,2472,2473,2474,2475,2476,2477,2478,2479,2480,2481,2482,2483,2484,2485,2486,2487,2488,2489,2490,2491,2492,2493,2494,2495,2496,2497,2498,2499,2500,2501,2502,2503,2504,2505,2506,2507,2508,2509,2510,2511,2512,2513,2514,2515,2516,2517,2518,2519,2520,2521,2522,2523,2524,2525,2526,2527,2528,2529,2530,2531,2532,2533,2534,2535,2536,2537,2538,2539,2540,2541,2542,2543,2544,2545,2546,2547,2548,2549,2550,2551,2552,2553,2554,2555,2556,2557,2558,2559,2560,2561,2562,2563,2564,2565,2566,2567,2568,2569,2570,2571,2572,2573,2574,2575,2576,2577,2578,2579,2580,2581,2582,2583,2584,2585,2586,2587,2588,2589,2590,2591,2592', '23', '0', '0');
INSERT INTO `sx_area` VALUES ('24', '贵州省', '0', '0', '1', '24,2593,2594,2595,2596,2597,2598,2599,2600,2601,2602,2603,2604,2605,2606,2607,2608,2609,2610,2611,2612,2613,2614,2615,2616,2617,2618,2619,2620,2621,2622,2623,2624,2625,2626,2627,2628,2629,2630,2631,2632,2633,2634,2635,2636,2637,2638,2639,2640,2641,2642,2643,2644,2645,2646,2647,2648,2649,2650,2651,2652,2653,2654,2655,2656,2657,2658,2659,2660,2661,2662,2663,2664,2665,2666,2667,2668,2669,2670,2671,2672,2673,2674,2675,2676,2677,2678,2679,2680,2681,2682,2683,2684,2685,2686,2687', '24', '0', '0');
INSERT INTO `sx_area` VALUES ('25', '云南省', '0', '0', '1', '25,2688,2689,2690,2691,2692,2693,2694,2695,2696,2697,2698,2699,2700,2701,2702,2703,2704,2705,2706,2707,2708,2709,2710,2711,2712,2713,2714,2715,2716,2717,2718,2719,2720,2721,2722,2723,2724,2725,2726,2727,2728,2729,2730,2731,2732,2733,2734,2735,2736,2737,2738,2739,2740,2741,2742,2743,2744,2745,2746,2747,2748,2749,2750,2751,2752,2753,2754,2755,2756,2757,2758,2759,2760,2761,2762,2763,2764,2765,2766,2767,2768,2769,2770,2771,2772,2773,2774,2775,2776,2777,2778,2779,2780,2781,2782,2783,2784,2785,2786,2787,2788,2789,2790,2791,2792,2793,2794,2795,2796,2797,2798,2799,2800,2801,2802,2803,2804,2805,2806,2807,2808,2809,2810,2811,2812,2813,2814,2815,2816,2817,2818,2819,2820,2821,2822,2823,2824,2825,2826,2827,2828,2829,2830,2831', '25', '0', '0');
INSERT INTO `sx_area` VALUES ('26', '西藏自治区', '0', '0', '1', '26,2832,2833,2834,2835,2836,2837,2838,2839,2840,2841,2842,2843,2844,2845,2846,2847,2848,2849,2850,2851,2852,2853,2854,2855,2856,2857,2858,2859,2860,2861,2862,2863,2864,2865,2866,2867,2868,2869,2870,2871,2872,2873,2874,2875,2876,2877,2878,2879,2880,2881,2882,2883,2884,2885,2886,2887,2888,2889,2890,2891,2892,2893,2894,2895,2896,2897,2898,2899,2900,2901,2902,2903,2904,2905,2906,2907,2908,2909,2910,2911', '26', '0', '0');
INSERT INTO `sx_area` VALUES ('27', '陕西省', '0', '0', '1', '27,2912,2913,2914,2915,2916,2917,2918,2919,2920,2921,2922,2923,2924,2925,2926,2927,2928,2929,2930,2931,2932,2933,2934,2935,2936,2937,2938,2939,2940,2941,2942,2943,2944,2945,2946,2947,2948,2949,2950,2951,2952,2953,2954,2955,2956,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,2993,2994,2995,2996,2997,2998,2999,3000,3001,3002,3003,3004,3005,3006,3007,3008,3009,3010,3011,3012,3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024,3025,3026,3027,3028', '27', '0', '0');
INSERT INTO `sx_area` VALUES ('28', '甘肃省', '0', '0', '1', '28,3029,3030,3031,3032,3033,3034,3035,3036,3037,3038,3039,3040,3041,3042,3043,3044,3045,3046,3047,3048,3049,3050,3051,3052,3053,3054,3055,3056,3057,3058,3059,3060,3061,3062,3063,3064,3065,3066,3067,3068,3069,3070,3071,3072,3073,3074,3075,3076,3077,3078,3079,3080,3081,3082,3083,3084,3085,3086,3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100,3101,3102,3103,3104,3105,3106,3107,3108,3109,3110,3111,3112,3113,3114,3115,3116,3117,3118,3119,3120,3121,3122,3123,3124,3125,3126,3127,3128,3129,3130', '28', '0', '0');
INSERT INTO `sx_area` VALUES ('29', '青海省', '0', '0', '1', '29,3131,3132,3133,3134,3135,3136,3137,3138,3139,3140,3141,3142,3143,3144,3145,3146,3147,3148,3149,3150,3151,3152,3153,3154,3155,3156,3157,3158,3159,3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176,3177,3178,3179,3180,3181', '29', '0', '0');
INSERT INTO `sx_area` VALUES ('30', '宁夏回族自治区', '0', '0', '1', '30,3182,3183,3184,3185,3186,3187,3188,3189,3190,3191,3192,3193,3194,3195,3196,3197,3198,3199,3200,3201,3202,3203,3204,3205,3206,3207,3208', '30', '0', '0');
INSERT INTO `sx_area` VALUES ('31', '新疆维吾尔自治区', '0', '0', '1', '31,3209,3210,3211,3212,3213,3214,3215,3216,3217,3218,3219,3220,3221,3222,3223,3224,3225,3226,3227,3228,3229,3230,3231,3232,3233,3234,3235,3236,3237,3238,3239,3240,3241,3242,3243,3244,3245,3246,3247,3248,3249,3250,3251,3252,3253,3254,3255,3256,3257,3258,3259,3260,3261,3262,3263,3264,3265,3266,3267,3268,3269,3270,3271,3272,3273,3274,3275,3276,3277,3278,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3293,3294,3295,3296,3297,3298,3299,3300,3301,3302,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3316,3317,3318,3319,3320,3321,3322', '31', '0', '0');
INSERT INTO `sx_area` VALUES ('32', '台湾省', '0', '0', '1', '32,3323,3324,3325,3326,3327,3328,3329,3330,3331,3332,3333,3334,3335,3336,3337,3338,3339,3340,3341,3342,3343,3344,3345,3346,3347,3348,3349', '32', '0', '0');
INSERT INTO `sx_area` VALUES ('33', '香港特别行政区', '0', '0', '1', '33,3350,3351,3352,3353,3354,3355,3356,3357,3358,3359,3360,3361,3362,3363,3364,3365,3366,3367,3368,3369,3370,3371', '33', '0', '0');
INSERT INTO `sx_area` VALUES ('34', '澳门特别行政区', '0', '0', '1', '34,3372,3373,3374,3375,3376,3377,3378,3379,3380,3381', '34', '0', '0');
INSERT INTO `sx_area` VALUES ('35', '国外', '0', '0', '1', '35,3382,3383,3384,3385,3386,3387,3388,3389,3390,3391,3392,3393,3394,3395,3396,3397,3398,3399,3400,3401,3402,3403,3404,3405,3406,3407,3408,3409,3410,3411,3412,3413,3414,3415,3416,3417,3418,3419,3420,3421,3422,3423,3424,3425,3426,3427,3428,3429,3430,3431,3432,3433,3434,3435,3436,3437,3438,3439,3440,3441,3442,3443,3444,3445,3446,3447,3448,3449,3450,3451,3452,3453,3454,3455,3456,3457,3458,3459,3460,3461,3462,3463,3464,3465,3466,3467,3468,3469,3470,3471,3472,3473,3474,3475,3476,3477,3478,3479,3480,3481,3482,3483,3484,3485,3486,3487,3488,3489,3490,3491,3492,3493,3494,3495,3496,3497,3498,3499,3500,3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521,3522,3523,3524,3525,3526,3527,3528,3529,3530,3531,3532,3533,3534,3535,3536,3537,3538,3539,3540,3541,3542,3543,3544,3545,3546,3547,3548,3549,3550,3551,3552,3553,3554,3555,3556,3557,3558,3559,3560,3561,3562,3563,3564,3565,3566,3567,3568,3569,3570,3571,3572,3573,3574,3575,3576,3577,3578,3579,3580,3581,3582,3583,3584,3585,3586,3587,3588,3589,3590,3591,3592,3593,3594,3595,3596,3597,3598,3599,3600,3601,3602,3603,3604,3605,3606,3607,3608,3609,3610,3611,3612,3613,3614,3615,3616,3617,3618,3619,3620,3621,3622,3623,3624,3625,3626,3627,3628,3629,3630,3631,3632,3633,3634,3635,3636,3637,3638,3639,3640,3641,3642,3643,3644,3645', '35', '0', '0');
INSERT INTO `sx_area` VALUES ('36', '湖州市', '1', '0,1', '1', '36,47,48,49,50,51,52', '36', '0', '0');
INSERT INTO `sx_area` VALUES ('37', '杭州市', '1', '0,1', '1', '37,53,54,55,56,57,58,59,60,61,62,63,64,65,66', '37', '0', '0');
INSERT INTO `sx_area` VALUES ('38', '宁波市', '1', '0,1', '1', '38,67,68,69,70,71,72,73,74,75,76,77,78,79', '38', '0', '0');
INSERT INTO `sx_area` VALUES ('39', '温州市', '1', '0,1', '1', '39,80,81,82,83,84,85,86,87,88,89,90', '39', '0', '0');
INSERT INTO `sx_area` VALUES ('40', '嘉兴市', '1', '0,1', '1', '40,91,92,93,94,95,96,97,98', '40', '0', '0');
INSERT INTO `sx_area` VALUES ('41', '绍兴市', '1', '0,1', '1', '41,99,100,101,102,103,104,105,106', '41', '0', '0');
INSERT INTO `sx_area` VALUES ('42', '金华市', '1', '0,1', '1', '42,107,108,109,110,111,112,113,114,115,116', '42', '0', '0');
INSERT INTO `sx_area` VALUES ('43', '衢州市', '1', '0,1', '1', '43,117,118,119,120,121,122,123', '43', '0', '0');
INSERT INTO `sx_area` VALUES ('44', '舟山市', '1', '0,1', '1', '44,124,125,126,127', '44', '0', '0');
INSERT INTO `sx_area` VALUES ('45', '台州市', '1', '0,1', '1', '45,128,129,130,131,132,133,134,135,136', '45', '0', '0');
INSERT INTO `sx_area` VALUES ('46', '丽水市', '1', '0,1', '1', '46,137,138,139,140,141,142,143,144,145', '46', '0', '0');
INSERT INTO `sx_area` VALUES ('47', '吴兴区', '36', '0,1,36', '0', '47', '47', '0', '0');
INSERT INTO `sx_area` VALUES ('48', '南浔区', '36', '0,1,36', '0', '48', '48', '0', '0');
INSERT INTO `sx_area` VALUES ('49', '德清县', '36', '0,1,36', '0', '49', '49', '0', '0');
INSERT INTO `sx_area` VALUES ('50', '长兴县', '36', '0,1,36', '0', '50', '50', '0', '0');
INSERT INTO `sx_area` VALUES ('51', '安吉县', '36', '0,1,36', '0', '51', '51', '0', '0');
INSERT INTO `sx_area` VALUES ('52', '开发区', '36', '0,1,36', '0', '52', '52', '0', '0');
INSERT INTO `sx_area` VALUES ('53', '上城区', '37', '0,1,37', '0', '53', '53', '0', '0');
INSERT INTO `sx_area` VALUES ('54', '下城区', '37', '0,1,37', '0', '54', '54', '0', '0');
INSERT INTO `sx_area` VALUES ('55', '江干区', '37', '0,1,37', '0', '55', '55', '0', '0');
INSERT INTO `sx_area` VALUES ('56', '拱墅区', '37', '0,1,37', '0', '56', '56', '0', '0');
INSERT INTO `sx_area` VALUES ('57', '西湖区', '37', '0,1,37', '0', '57', '57', '0', '0');
INSERT INTO `sx_area` VALUES ('58', '滨江区', '37', '0,1,37', '0', '58', '58', '0', '0');
INSERT INTO `sx_area` VALUES ('59', '萧山区', '37', '0,1,37', '0', '59', '59', '0', '0');
INSERT INTO `sx_area` VALUES ('60', '余杭区', '37', '0,1,37', '0', '60', '60', '0', '0');
INSERT INTO `sx_area` VALUES ('61', '下沙区', '37', '0,1,37', '0', '61', '61', '0', '0');
INSERT INTO `sx_area` VALUES ('62', '桐庐县', '37', '0,1,37', '0', '62', '62', '0', '0');
INSERT INTO `sx_area` VALUES ('63', '淳安县', '37', '0,1,37', '0', '63', '63', '0', '0');
INSERT INTO `sx_area` VALUES ('64', '建德市', '37', '0,1,37', '0', '64', '64', '0', '0');
INSERT INTO `sx_area` VALUES ('65', '富阳市', '37', '0,1,37', '0', '65', '65', '0', '0');
INSERT INTO `sx_area` VALUES ('66', '临安市', '37', '0,1,37', '0', '66', '66', '0', '0');
INSERT INTO `sx_area` VALUES ('67', '海曙区', '38', '0,1,38', '0', '67', '67', '0', '0');
INSERT INTO `sx_area` VALUES ('68', '江东区', '38', '0,1,38', '0', '68', '68', '0', '0');
INSERT INTO `sx_area` VALUES ('69', '江北区', '38', '0,1,38', '0', '69', '69', '0', '0');
INSERT INTO `sx_area` VALUES ('70', '北仑区', '38', '0,1,38', '0', '70', '70', '0', '0');
INSERT INTO `sx_area` VALUES ('71', '镇海区', '38', '0,1,38', '0', '71', '71', '0', '0');
INSERT INTO `sx_area` VALUES ('72', '鄞州区', '38', '0,1,38', '0', '72', '72', '0', '0');
INSERT INTO `sx_area` VALUES ('73', '象山县', '38', '0,1,38', '0', '73', '73', '0', '0');
INSERT INTO `sx_area` VALUES ('74', '宁海县', '38', '0,1,38', '0', '74', '74', '0', '0');
INSERT INTO `sx_area` VALUES ('75', '大榭区', '38', '0,1,38', '0', '75', '75', '0', '0');
INSERT INTO `sx_area` VALUES ('76', '钱湖区', '38', '0,1,38', '0', '76', '76', '0', '0');
INSERT INTO `sx_area` VALUES ('77', '余姚市', '38', '0,1,38', '0', '77', '77', '0', '0');
INSERT INTO `sx_area` VALUES ('78', '慈溪市', '38', '0,1,38', '0', '78', '78', '0', '0');
INSERT INTO `sx_area` VALUES ('79', '奉化市', '38', '0,1,38', '0', '79', '79', '0', '0');
INSERT INTO `sx_area` VALUES ('80', '鹿城区', '39', '0,1,39', '0', '80', '80', '0', '0');
INSERT INTO `sx_area` VALUES ('81', '龙湾区', '39', '0,1,39', '0', '81', '81', '0', '0');
INSERT INTO `sx_area` VALUES ('82', '瓯海区', '39', '0,1,39', '0', '82', '82', '0', '0');
INSERT INTO `sx_area` VALUES ('83', '洞头县', '39', '0,1,39', '0', '83', '83', '0', '0');
INSERT INTO `sx_area` VALUES ('84', '永嘉县', '39', '0,1,39', '0', '84', '84', '0', '0');
INSERT INTO `sx_area` VALUES ('85', '平阳县', '39', '0,1,39', '0', '85', '85', '0', '0');
INSERT INTO `sx_area` VALUES ('86', '苍南县', '39', '0,1,39', '0', '86', '86', '0', '0');
INSERT INTO `sx_area` VALUES ('87', '文成县', '39', '0,1,39', '0', '87', '87', '0', '0');
INSERT INTO `sx_area` VALUES ('88', '泰顺县', '39', '0,1,39', '0', '88', '88', '0', '0');
INSERT INTO `sx_area` VALUES ('89', '瑞安市', '39', '0,1,39', '0', '89', '89', '0', '0');
INSERT INTO `sx_area` VALUES ('90', '乐清市', '39', '0,1,39', '0', '90', '90', '0', '0');
INSERT INTO `sx_area` VALUES ('91', '南湖区', '40', '0,1,40', '0', '91', '91', '0', '0');
INSERT INTO `sx_area` VALUES ('92', '经济开发区', '40', '0,1,40', '0', '92', '92', '0', '0');
INSERT INTO `sx_area` VALUES ('93', '秀洲区', '40', '0,1,40', '0', '93', '93', '0', '0');
INSERT INTO `sx_area` VALUES ('94', '嘉善县', '40', '0,1,40', '0', '94', '94', '0', '0');
INSERT INTO `sx_area` VALUES ('95', '海盐县', '40', '0,1,40', '0', '95', '95', '0', '0');
INSERT INTO `sx_area` VALUES ('96', '海宁市', '40', '0,1,40', '0', '96', '96', '0', '0');
INSERT INTO `sx_area` VALUES ('97', '平湖市', '40', '0,1,40', '0', '97', '97', '0', '0');
INSERT INTO `sx_area` VALUES ('98', '桐乡市', '40', '0,1,40', '0', '98', '98', '0', '0');
INSERT INTO `sx_area` VALUES ('99', '越城区', '41', '0,1,41', '0', '99', '99', '0', '0');
INSERT INTO `sx_area` VALUES ('100', '袍江区', '41', '0,1,41', '0', '100', '100', '0', '0');
INSERT INTO `sx_area` VALUES ('101', '镜湖区', '41', '0,1,41', '0', '101', '101', '0', '0');
INSERT INTO `sx_area` VALUES ('102', '绍兴县', '41', '0,1,41', '0', '102', '102', '0', '0');
INSERT INTO `sx_area` VALUES ('103', '新昌县', '41', '0,1,41', '0', '103', '103', '0', '0');
INSERT INTO `sx_area` VALUES ('104', '诸暨市', '41', '0,1,41', '0', '104', '104', '0', '0');
INSERT INTO `sx_area` VALUES ('105', '上虞市', '41', '0,1,41', '0', '105', '105', '0', '0');
INSERT INTO `sx_area` VALUES ('106', '嵊州市', '41', '0,1,41', '0', '106', '106', '0', '0');
INSERT INTO `sx_area` VALUES ('107', '婺城区', '42', '0,1,42', '0', '107', '107', '0', '0');
INSERT INTO `sx_area` VALUES ('108', '金东区', '42', '0,1,42', '0', '108', '108', '0', '0');
INSERT INTO `sx_area` VALUES ('109', '武义县', '42', '0,1,42', '0', '109', '109', '0', '0');
INSERT INTO `sx_area` VALUES ('110', '浦江县', '42', '0,1,42', '0', '110', '110', '0', '0');
INSERT INTO `sx_area` VALUES ('111', '磐安县', '42', '0,1,42', '0', '111', '111', '0', '0');
INSERT INTO `sx_area` VALUES ('112', '兰溪市', '42', '0,1,42', '0', '112', '112', '0', '0');
INSERT INTO `sx_area` VALUES ('113', '义乌市', '42', '0,1,42', '0', '113', '113', '0', '0');
INSERT INTO `sx_area` VALUES ('114', '东阳市', '42', '0,1,42', '0', '114', '114', '0', '0');
INSERT INTO `sx_area` VALUES ('115', '永康市', '42', '0,1,42', '0', '115', '115', '0', '0');
INSERT INTO `sx_area` VALUES ('116', '江南区', '42', '0,1,42', '0', '116', '116', '0', '0');
INSERT INTO `sx_area` VALUES ('117', '柯城区', '43', '0,1,43', '0', '117', '117', '0', '0');
INSERT INTO `sx_area` VALUES ('118', '衢江区', '43', '0,1,43', '0', '118', '118', '0', '0');
INSERT INTO `sx_area` VALUES ('119', '柯山区', '43', '0,1,43', '0', '119', '119', '0', '0');
INSERT INTO `sx_area` VALUES ('120', '常山县', '43', '0,1,43', '0', '120', '120', '0', '0');
INSERT INTO `sx_area` VALUES ('121', '开化县', '43', '0,1,43', '0', '121', '121', '0', '0');
INSERT INTO `sx_area` VALUES ('122', '龙游县', '43', '0,1,43', '0', '122', '122', '0', '0');
INSERT INTO `sx_area` VALUES ('123', '江山市', '43', '0,1,43', '0', '123', '123', '0', '0');
INSERT INTO `sx_area` VALUES ('124', '定海区', '44', '0,1,44', '0', '124', '124', '0', '0');
INSERT INTO `sx_area` VALUES ('125', '普陀区', '44', '0,1,44', '0', '125', '125', '0', '0');
INSERT INTO `sx_area` VALUES ('126', '岱山县', '44', '0,1,44', '0', '126', '126', '0', '0');
INSERT INTO `sx_area` VALUES ('127', '嵊泗县', '44', '0,1,44', '0', '127', '127', '0', '0');
INSERT INTO `sx_area` VALUES ('128', '椒江区', '45', '0,1,45', '0', '128', '128', '0', '0');
INSERT INTO `sx_area` VALUES ('129', '黄岩区', '45', '0,1,45', '0', '129', '129', '0', '0');
INSERT INTO `sx_area` VALUES ('130', '路桥区', '45', '0,1,45', '0', '130', '130', '0', '0');
INSERT INTO `sx_area` VALUES ('131', '玉环县', '45', '0,1,45', '0', '131', '131', '0', '0');
INSERT INTO `sx_area` VALUES ('132', '三门县', '45', '0,1,45', '0', '132', '132', '0', '0');
INSERT INTO `sx_area` VALUES ('133', '天台县', '45', '0,1,45', '0', '133', '133', '0', '0');
INSERT INTO `sx_area` VALUES ('134', '仙居县', '45', '0,1,45', '0', '134', '134', '0', '0');
INSERT INTO `sx_area` VALUES ('135', '温岭市', '45', '0,1,45', '0', '135', '135', '0', '0');
INSERT INTO `sx_area` VALUES ('136', '临海市', '45', '0,1,45', '0', '136', '136', '0', '0');
INSERT INTO `sx_area` VALUES ('137', '莲都区', '46', '0,1,46', '0', '137', '137', '0', '0');
INSERT INTO `sx_area` VALUES ('138', '青田县', '46', '0,1,46', '0', '138', '138', '0', '0');
INSERT INTO `sx_area` VALUES ('139', '缙云县', '46', '0,1,46', '0', '139', '139', '0', '0');
INSERT INTO `sx_area` VALUES ('140', '遂昌县', '46', '0,1,46', '0', '140', '140', '0', '0');
INSERT INTO `sx_area` VALUES ('141', '松阳县', '46', '0,1,46', '0', '141', '141', '0', '0');
INSERT INTO `sx_area` VALUES ('142', '云和县', '46', '0,1,46', '0', '142', '142', '0', '0');
INSERT INTO `sx_area` VALUES ('143', '庆元县', '46', '0,1,46', '0', '143', '143', '0', '0');
INSERT INTO `sx_area` VALUES ('144', '景宁畲族自治县', '46', '0,1,46', '0', '144', '144', '0', '0');
INSERT INTO `sx_area` VALUES ('145', '龙泉市', '46', '0,1,46', '0', '145', '145', '0', '0');
INSERT INTO `sx_area` VALUES ('146', '东城区', '2', '0,2', '0', '146', '146', '0', '0');
INSERT INTO `sx_area` VALUES ('147', '西城区', '2', '0,2', '0', '147', '147', '0', '0');
INSERT INTO `sx_area` VALUES ('148', '崇文区', '2', '0,2', '0', '148', '148', '0', '0');
INSERT INTO `sx_area` VALUES ('149', '宣武区', '2', '0,2', '0', '149', '149', '0', '0');
INSERT INTO `sx_area` VALUES ('150', '朝阳区', '2', '0,2', '0', '150', '150', '0', '0');
INSERT INTO `sx_area` VALUES ('151', '丰台区', '2', '0,2', '0', '151', '151', '0', '0');
INSERT INTO `sx_area` VALUES ('152', '石景山区', '2', '0,2', '0', '152', '152', '0', '0');
INSERT INTO `sx_area` VALUES ('153', '海淀区', '2', '0,2', '0', '153', '153', '0', '0');
INSERT INTO `sx_area` VALUES ('154', '门头沟区', '2', '0,2', '0', '154', '154', '0', '0');
INSERT INTO `sx_area` VALUES ('155', '房山区', '2', '0,2', '0', '155', '155', '0', '0');
INSERT INTO `sx_area` VALUES ('156', '通州区', '2', '0,2', '0', '156', '156', '0', '0');
INSERT INTO `sx_area` VALUES ('157', '顺义区', '2', '0,2', '0', '157', '157', '0', '0');
INSERT INTO `sx_area` VALUES ('158', '昌平区', '2', '0,2', '0', '158', '158', '0', '0');
INSERT INTO `sx_area` VALUES ('159', '大兴区', '2', '0,2', '0', '159', '159', '0', '0');
INSERT INTO `sx_area` VALUES ('160', '怀柔区', '2', '0,2', '0', '160', '160', '0', '0');
INSERT INTO `sx_area` VALUES ('161', '平谷区', '2', '0,2', '0', '161', '161', '0', '0');
INSERT INTO `sx_area` VALUES ('162', '延庆县', '2', '0,2', '0', '162', '162', '0', '0');
INSERT INTO `sx_area` VALUES ('163', '密云县', '2', '0,2', '0', '163', '163', '0', '0');
INSERT INTO `sx_area` VALUES ('164', '延庆县', '2', '0,2', '0', '164', '164', '0', '0');
INSERT INTO `sx_area` VALUES ('165', '和平区', '4', '0,4', '0', '165', '165', '0', '0');
INSERT INTO `sx_area` VALUES ('166', '河东区', '4', '0,4', '0', '166', '166', '0', '0');
INSERT INTO `sx_area` VALUES ('167', '河西区', '4', '0,4', '0', '167', '167', '0', '0');
INSERT INTO `sx_area` VALUES ('168', '南开区', '4', '0,4', '0', '168', '168', '0', '0');
INSERT INTO `sx_area` VALUES ('169', '河北区', '4', '0,4', '0', '169', '169', '0', '0');
INSERT INTO `sx_area` VALUES ('170', '红桥区', '4', '0,4', '0', '170', '170', '0', '0');
INSERT INTO `sx_area` VALUES ('171', '塘沽区', '4', '0,4', '0', '171', '171', '0', '0');
INSERT INTO `sx_area` VALUES ('172', '汉沽区', '4', '0,4', '0', '172', '172', '0', '0');
INSERT INTO `sx_area` VALUES ('173', '大港区', '4', '0,4', '0', '173', '173', '0', '0');
INSERT INTO `sx_area` VALUES ('174', '东丽区', '4', '0,4', '0', '174', '174', '0', '0');
INSERT INTO `sx_area` VALUES ('175', '西青区', '4', '0,4', '0', '175', '175', '0', '0');
INSERT INTO `sx_area` VALUES ('176', '津南区', '4', '0,4', '0', '176', '176', '0', '0');
INSERT INTO `sx_area` VALUES ('177', '北辰区', '4', '0,4', '0', '177', '177', '0', '0');
INSERT INTO `sx_area` VALUES ('178', '武清区', '4', '0,4', '0', '178', '178', '0', '0');
INSERT INTO `sx_area` VALUES ('179', '宝坻区', '4', '0,4', '0', '179', '179', '0', '0');
INSERT INTO `sx_area` VALUES ('180', '宁河县', '4', '0,4', '0', '180', '180', '0', '0');
INSERT INTO `sx_area` VALUES ('181', '静海县', '4', '0,4', '0', '181', '181', '0', '0');
INSERT INTO `sx_area` VALUES ('182', '蓟县', '4', '0,4', '0', '182', '182', '0', '0');
INSERT INTO `sx_area` VALUES ('183', '黄浦区', '3', '0,3', '0', '183', '183', '0', '0');
INSERT INTO `sx_area` VALUES ('184', '卢湾区', '3', '0,3', '0', '184', '184', '0', '0');
INSERT INTO `sx_area` VALUES ('185', '徐汇区', '3', '0,3', '0', '185', '185', '0', '0');
INSERT INTO `sx_area` VALUES ('186', '长宁区', '3', '0,3', '0', '186', '186', '0', '0');
INSERT INTO `sx_area` VALUES ('187', '静安区', '3', '0,3', '0', '187', '187', '0', '0');
INSERT INTO `sx_area` VALUES ('188', '普陀区', '3', '0,3', '0', '188', '188', '0', '0');
INSERT INTO `sx_area` VALUES ('189', '闸北区', '3', '0,3', '0', '189', '189', '0', '0');
INSERT INTO `sx_area` VALUES ('190', '虹口区', '3', '0,3', '0', '190', '190', '0', '0');
INSERT INTO `sx_area` VALUES ('191', '杨浦区', '3', '0,3', '0', '191', '191', '0', '0');
INSERT INTO `sx_area` VALUES ('192', '闵行区', '3', '0,3', '0', '192', '192', '0', '0');
INSERT INTO `sx_area` VALUES ('193', '宝山区', '3', '0,3', '0', '193', '193', '0', '0');
INSERT INTO `sx_area` VALUES ('194', '嘉定区', '3', '0,3', '0', '194', '194', '0', '0');
INSERT INTO `sx_area` VALUES ('195', '浦东新区', '3', '0,3', '0', '195', '195', '0', '0');
INSERT INTO `sx_area` VALUES ('196', '金山区', '3', '0,3', '0', '196', '196', '0', '0');
INSERT INTO `sx_area` VALUES ('197', '松江区', '3', '0,3', '0', '197', '197', '0', '0');
INSERT INTO `sx_area` VALUES ('198', '青浦区', '3', '0,3', '0', '198', '198', '0', '0');
INSERT INTO `sx_area` VALUES ('199', '南汇区', '3', '0,3', '0', '199', '199', '0', '0');
INSERT INTO `sx_area` VALUES ('200', '奉贤区', '3', '0,3', '0', '200', '200', '0', '0');
INSERT INTO `sx_area` VALUES ('201', '崇明县', '3', '0,3', '0', '201', '201', '0', '0');
INSERT INTO `sx_area` VALUES ('202', '万州区', '5', '0,5', '0', '202', '202', '0', '0');
INSERT INTO `sx_area` VALUES ('203', '涪陵区', '5', '0,5', '0', '203', '203', '0', '0');
INSERT INTO `sx_area` VALUES ('204', '渝中区', '5', '0,5', '0', '204', '204', '0', '0');
INSERT INTO `sx_area` VALUES ('205', '大渡口区', '5', '0,5', '0', '205', '205', '0', '0');
INSERT INTO `sx_area` VALUES ('206', '江北区', '5', '0,5', '0', '206', '206', '0', '0');
INSERT INTO `sx_area` VALUES ('207', '沙坪坝区', '5', '0,5', '0', '207', '207', '0', '0');
INSERT INTO `sx_area` VALUES ('208', '九龙坡区', '5', '0,5', '0', '208', '208', '0', '0');
INSERT INTO `sx_area` VALUES ('209', '南岸区', '5', '0,5', '0', '209', '209', '0', '0');
INSERT INTO `sx_area` VALUES ('210', '北碚区', '5', '0,5', '0', '210', '210', '0', '0');
INSERT INTO `sx_area` VALUES ('211', '万盛区', '5', '0,5', '0', '211', '211', '0', '0');
INSERT INTO `sx_area` VALUES ('212', '双桥区', '5', '0,5', '0', '212', '212', '0', '0');
INSERT INTO `sx_area` VALUES ('213', '渝北区', '5', '0,5', '0', '213', '213', '0', '0');
INSERT INTO `sx_area` VALUES ('214', '巴南区', '5', '0,5', '0', '214', '214', '0', '0');
INSERT INTO `sx_area` VALUES ('215', '黔江区', '5', '0,5', '0', '215', '215', '0', '0');
INSERT INTO `sx_area` VALUES ('216', '长寿区', '5', '0,5', '0', '216', '216', '0', '0');
INSERT INTO `sx_area` VALUES ('217', '綦江县', '5', '0,5', '0', '217', '217', '0', '0');
INSERT INTO `sx_area` VALUES ('218', '潼南县', '5', '0,5', '0', '218', '218', '0', '0');
INSERT INTO `sx_area` VALUES ('219', '铜梁县', '5', '0,5', '0', '219', '219', '0', '0');
INSERT INTO `sx_area` VALUES ('220', '大足县', '5', '0,5', '0', '220', '220', '0', '0');
INSERT INTO `sx_area` VALUES ('221', '荣昌县', '5', '0,5', '0', '221', '221', '0', '0');
INSERT INTO `sx_area` VALUES ('222', '璧山县', '5', '0,5', '0', '222', '222', '0', '0');
INSERT INTO `sx_area` VALUES ('223', '梁平县', '5', '0,5', '0', '223', '223', '0', '0');
INSERT INTO `sx_area` VALUES ('224', '城口县', '5', '0,5', '0', '224', '224', '0', '0');
INSERT INTO `sx_area` VALUES ('225', '丰都县', '5', '0,5', '0', '225', '225', '0', '0');
INSERT INTO `sx_area` VALUES ('226', '垫江县', '5', '0,5', '0', '226', '226', '0', '0');
INSERT INTO `sx_area` VALUES ('227', '武隆县', '5', '0,5', '0', '227', '227', '0', '0');
INSERT INTO `sx_area` VALUES ('228', '忠县', '5', '0,5', '0', '228', '228', '0', '0');
INSERT INTO `sx_area` VALUES ('229', '开县', '5', '0,5', '0', '229', '229', '0', '0');
INSERT INTO `sx_area` VALUES ('230', '云阳县', '5', '0,5', '0', '230', '230', '0', '0');
INSERT INTO `sx_area` VALUES ('231', '奉节县', '5', '0,5', '0', '231', '231', '0', '0');
INSERT INTO `sx_area` VALUES ('232', '巫山县', '5', '0,5', '0', '232', '232', '0', '0');
INSERT INTO `sx_area` VALUES ('233', '巫溪县', '5', '0,5', '0', '233', '233', '0', '0');
INSERT INTO `sx_area` VALUES ('234', '石柱土家族自治县', '5', '0,5', '0', '234', '234', '0', '0');
INSERT INTO `sx_area` VALUES ('235', '秀山土家族苗族自治县', '5', '0,5', '0', '235', '235', '0', '0');
INSERT INTO `sx_area` VALUES ('236', '酉阳土家族苗族自治县', '5', '0,5', '0', '236', '236', '0', '0');
INSERT INTO `sx_area` VALUES ('237', '彭水苗族土家族自治县', '5', '0,5', '0', '237', '237', '0', '0');
INSERT INTO `sx_area` VALUES ('238', '江津市', '5', '0,5', '0', '238', '238', '0', '0');
INSERT INTO `sx_area` VALUES ('239', '合川市', '5', '0,5', '0', '239', '239', '0', '0');
INSERT INTO `sx_area` VALUES ('240', '永川市', '5', '0,5', '0', '240', '240', '0', '0');
INSERT INTO `sx_area` VALUES ('241', '南川市', '5', '0,5', '0', '241', '241', '0', '0');
INSERT INTO `sx_area` VALUES ('242', '高新区', '5', '0,5', '0', '242', '242', '0', '0');
INSERT INTO `sx_area` VALUES ('243', '石家庄市', '6', '0,6', '1', '243,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276', '243', '0', '0');
INSERT INTO `sx_area` VALUES ('244', '唐山市', '6', '0,6', '1', '244,277,278,279,280,281,282,283,284,285,286,287,288,289,290', '244', '0', '0');
INSERT INTO `sx_area` VALUES ('245', '秦皇岛市', '6', '0,6', '1', '245,291,292,293,294,295,296,297', '245', '0', '0');
INSERT INTO `sx_area` VALUES ('246', '邯郸市', '6', '0,6', '1', '246,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316', '246', '0', '0');
INSERT INTO `sx_area` VALUES ('247', '邢台市', '6', '0,6', '1', '247,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335', '247', '0', '0');
INSERT INTO `sx_area` VALUES ('248', '保定市', '6', '0,6', '1', '248,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360', '248', '0', '0');
INSERT INTO `sx_area` VALUES ('249', '张家口市', '6', '0,6', '1', '249,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377', '249', '0', '0');
INSERT INTO `sx_area` VALUES ('250', '承德市', '6', '0,6', '1', '250,378,379,380,381,382,383,384,385,386,387,388', '250', '0', '0');
INSERT INTO `sx_area` VALUES ('251', '沧州市', '6', '0,6', '1', '251,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404', '251', '0', '0');
INSERT INTO `sx_area` VALUES ('252', '廊坊市', '6', '0,6', '1', '252,405,406,407,408,409,410,411,412,413,414,415', '252', '0', '0');
INSERT INTO `sx_area` VALUES ('253', '衡水市', '6', '0,6', '1', '253,416,417,418,419,420,421,422,423,424,425,426', '253', '0', '0');
INSERT INTO `sx_area` VALUES ('254', '长安区', '243', '0,6,243', '0', '254', '254', '0', '0');
INSERT INTO `sx_area` VALUES ('255', '桥东区', '243', '0,6,243', '0', '255', '255', '0', '0');
INSERT INTO `sx_area` VALUES ('256', '桥西区', '243', '0,6,243', '0', '256', '256', '0', '0');
INSERT INTO `sx_area` VALUES ('257', '新华区', '243', '0,6,243', '0', '257', '257', '0', '0');
INSERT INTO `sx_area` VALUES ('258', '井陉矿区', '243', '0,6,243', '0', '258', '258', '0', '0');
INSERT INTO `sx_area` VALUES ('259', '裕华区', '243', '0,6,243', '0', '259', '259', '0', '0');
INSERT INTO `sx_area` VALUES ('260', '井陉县', '243', '0,6,243', '0', '260', '260', '0', '0');
INSERT INTO `sx_area` VALUES ('261', '正定县', '243', '0,6,243', '0', '261', '261', '0', '0');
INSERT INTO `sx_area` VALUES ('262', '栾城县', '243', '0,6,243', '0', '262', '262', '0', '0');
INSERT INTO `sx_area` VALUES ('263', '行唐县', '243', '0,6,243', '0', '263', '263', '0', '0');
INSERT INTO `sx_area` VALUES ('264', '灵寿县', '243', '0,6,243', '0', '264', '264', '0', '0');
INSERT INTO `sx_area` VALUES ('265', '高邑县', '243', '0,6,243', '0', '265', '265', '0', '0');
INSERT INTO `sx_area` VALUES ('266', '深泽县', '243', '0,6,243', '0', '266', '266', '0', '0');
INSERT INTO `sx_area` VALUES ('267', '赞皇县', '243', '0,6,243', '0', '267', '267', '0', '0');
INSERT INTO `sx_area` VALUES ('268', '无极县', '243', '0,6,243', '0', '268', '268', '0', '0');
INSERT INTO `sx_area` VALUES ('269', '平山县', '243', '0,6,243', '0', '269', '269', '0', '0');
INSERT INTO `sx_area` VALUES ('270', '元氏县', '243', '0,6,243', '0', '270', '270', '0', '0');
INSERT INTO `sx_area` VALUES ('271', '赵县', '243', '0,6,243', '0', '271', '271', '0', '0');
INSERT INTO `sx_area` VALUES ('272', '辛集市', '243', '0,6,243', '0', '272', '272', '0', '0');
INSERT INTO `sx_area` VALUES ('273', '藁城市', '243', '0,6,243', '0', '273', '273', '0', '0');
INSERT INTO `sx_area` VALUES ('274', '晋州市', '243', '0,6,243', '0', '274', '274', '0', '0');
INSERT INTO `sx_area` VALUES ('275', '新乐市', '243', '0,6,243', '0', '275', '275', '0', '0');
INSERT INTO `sx_area` VALUES ('276', '鹿泉市', '243', '0,6,243', '0', '276', '276', '0', '0');
INSERT INTO `sx_area` VALUES ('277', '路南区', '244', '0,6,244', '0', '277', '277', '0', '0');
INSERT INTO `sx_area` VALUES ('278', '路北区', '244', '0,6,244', '0', '278', '278', '0', '0');
INSERT INTO `sx_area` VALUES ('279', '古冶区', '244', '0,6,244', '0', '279', '279', '0', '0');
INSERT INTO `sx_area` VALUES ('280', '开平区', '244', '0,6,244', '0', '280', '280', '0', '0');
INSERT INTO `sx_area` VALUES ('281', '丰南区', '244', '0,6,244', '0', '281', '281', '0', '0');
INSERT INTO `sx_area` VALUES ('282', '丰润区', '244', '0,6,244', '0', '282', '282', '0', '0');
INSERT INTO `sx_area` VALUES ('283', '滦县', '244', '0,6,244', '0', '283', '283', '0', '0');
INSERT INTO `sx_area` VALUES ('284', '滦南县', '244', '0,6,244', '0', '284', '284', '0', '0');
INSERT INTO `sx_area` VALUES ('285', '乐亭县', '244', '0,6,244', '0', '285', '285', '0', '0');
INSERT INTO `sx_area` VALUES ('286', '迁西县', '244', '0,6,244', '0', '286', '286', '0', '0');
INSERT INTO `sx_area` VALUES ('287', '玉田县', '244', '0,6,244', '0', '287', '287', '0', '0');
INSERT INTO `sx_area` VALUES ('288', '唐海县', '244', '0,6,244', '0', '288', '288', '0', '0');
INSERT INTO `sx_area` VALUES ('289', '遵化市', '244', '0,6,244', '0', '289', '289', '0', '0');
INSERT INTO `sx_area` VALUES ('290', '迁安市', '244', '0,6,244', '0', '290', '290', '0', '0');
INSERT INTO `sx_area` VALUES ('291', '海港区', '245', '0,6,245', '0', '291', '291', '0', '0');
INSERT INTO `sx_area` VALUES ('292', '山海关区', '245', '0,6,245', '0', '292', '292', '0', '0');
INSERT INTO `sx_area` VALUES ('293', '北戴河区', '245', '0,6,245', '0', '293', '293', '0', '0');
INSERT INTO `sx_area` VALUES ('294', '青龙满族自治县', '245', '0,6,245', '0', '294', '294', '0', '0');
INSERT INTO `sx_area` VALUES ('295', '昌黎县', '245', '0,6,245', '0', '295', '295', '0', '0');
INSERT INTO `sx_area` VALUES ('296', '抚宁县', '245', '0,6,245', '0', '296', '296', '0', '0');
INSERT INTO `sx_area` VALUES ('297', '卢龙县', '245', '0,6,245', '0', '297', '297', '0', '0');
INSERT INTO `sx_area` VALUES ('298', '邯山区', '246', '0,6,246', '0', '298', '298', '0', '0');
INSERT INTO `sx_area` VALUES ('299', '丛台区', '246', '0,6,246', '0', '299', '299', '0', '0');
INSERT INTO `sx_area` VALUES ('300', '复兴区', '246', '0,6,246', '0', '300', '300', '0', '0');
INSERT INTO `sx_area` VALUES ('301', '峰峰矿区', '246', '0,6,246', '0', '301', '301', '0', '0');
INSERT INTO `sx_area` VALUES ('302', '邯郸县', '246', '0,6,246', '0', '302', '302', '0', '0');
INSERT INTO `sx_area` VALUES ('303', '临漳县', '246', '0,6,246', '0', '303', '303', '0', '0');
INSERT INTO `sx_area` VALUES ('304', '成安县', '246', '0,6,246', '0', '304', '304', '0', '0');
INSERT INTO `sx_area` VALUES ('305', '大名县', '246', '0,6,246', '0', '305', '305', '0', '0');
INSERT INTO `sx_area` VALUES ('306', '涉县', '246', '0,6,246', '0', '306', '306', '0', '0');
INSERT INTO `sx_area` VALUES ('307', '磁县', '246', '0,6,246', '0', '307', '307', '0', '0');
INSERT INTO `sx_area` VALUES ('308', '肥乡县', '246', '0,6,246', '0', '308', '308', '0', '0');
INSERT INTO `sx_area` VALUES ('309', '永年县', '246', '0,6,246', '0', '309', '309', '0', '0');
INSERT INTO `sx_area` VALUES ('310', '邱县', '246', '0,6,246', '0', '310', '310', '0', '0');
INSERT INTO `sx_area` VALUES ('311', '鸡泽县', '246', '0,6,246', '0', '311', '311', '0', '0');
INSERT INTO `sx_area` VALUES ('312', '广平县', '246', '0,6,246', '0', '312', '312', '0', '0');
INSERT INTO `sx_area` VALUES ('313', '馆陶县', '246', '0,6,246', '0', '313', '313', '0', '0');
INSERT INTO `sx_area` VALUES ('314', '魏县', '246', '0,6,246', '0', '314', '314', '0', '0');
INSERT INTO `sx_area` VALUES ('315', '曲周县', '246', '0,6,246', '0', '315', '315', '0', '0');
INSERT INTO `sx_area` VALUES ('316', '武安市', '246', '0,6,246', '0', '316', '316', '0', '0');
INSERT INTO `sx_area` VALUES ('317', '桥东区', '247', '0,6,247', '0', '317', '317', '0', '0');
INSERT INTO `sx_area` VALUES ('318', '桥西区', '247', '0,6,247', '0', '318', '318', '0', '0');
INSERT INTO `sx_area` VALUES ('319', '邢台县', '247', '0,6,247', '0', '319', '319', '0', '0');
INSERT INTO `sx_area` VALUES ('320', '临城县', '247', '0,6,247', '0', '320', '320', '0', '0');
INSERT INTO `sx_area` VALUES ('321', '内丘县', '247', '0,6,247', '0', '321', '321', '0', '0');
INSERT INTO `sx_area` VALUES ('322', '柏乡县', '247', '0,6,247', '0', '322', '322', '0', '0');
INSERT INTO `sx_area` VALUES ('323', '隆尧县', '247', '0,6,247', '0', '323', '323', '0', '0');
INSERT INTO `sx_area` VALUES ('324', '任县', '247', '0,6,247', '0', '324', '324', '0', '0');
INSERT INTO `sx_area` VALUES ('325', '南和县', '247', '0,6,247', '0', '325', '325', '0', '0');
INSERT INTO `sx_area` VALUES ('326', '宁晋县', '247', '0,6,247', '0', '326', '326', '0', '0');
INSERT INTO `sx_area` VALUES ('327', '巨鹿县', '247', '0,6,247', '0', '327', '327', '0', '0');
INSERT INTO `sx_area` VALUES ('328', '新河县', '247', '0,6,247', '0', '328', '328', '0', '0');
INSERT INTO `sx_area` VALUES ('329', '广宗县', '247', '0,6,247', '0', '329', '329', '0', '0');
INSERT INTO `sx_area` VALUES ('330', '平乡县', '247', '0,6,247', '0', '330', '330', '0', '0');
INSERT INTO `sx_area` VALUES ('331', '威县', '247', '0,6,247', '0', '331', '331', '0', '0');
INSERT INTO `sx_area` VALUES ('332', '清河县', '247', '0,6,247', '0', '332', '332', '0', '0');
INSERT INTO `sx_area` VALUES ('333', '临西县', '247', '0,6,247', '0', '333', '333', '0', '0');
INSERT INTO `sx_area` VALUES ('334', '南宫市', '247', '0,6,247', '0', '334', '334', '0', '0');
INSERT INTO `sx_area` VALUES ('335', '沙河市', '247', '0,6,247', '0', '335', '335', '0', '0');
INSERT INTO `sx_area` VALUES ('336', '新市区', '248', '0,6,248', '0', '336', '336', '0', '0');
INSERT INTO `sx_area` VALUES ('337', '北市区', '248', '0,6,248', '0', '337', '337', '0', '0');
INSERT INTO `sx_area` VALUES ('338', '南市区', '248', '0,6,248', '0', '338', '338', '0', '0');
INSERT INTO `sx_area` VALUES ('339', '满城县', '248', '0,6,248', '0', '339', '339', '0', '0');
INSERT INTO `sx_area` VALUES ('340', '清苑县', '248', '0,6,248', '0', '340', '340', '0', '0');
INSERT INTO `sx_area` VALUES ('341', '涞水县', '248', '0,6,248', '0', '341', '341', '0', '0');
INSERT INTO `sx_area` VALUES ('342', '阜平县', '248', '0,6,248', '0', '342', '342', '0', '0');
INSERT INTO `sx_area` VALUES ('343', '徐水县', '248', '0,6,248', '0', '343', '343', '0', '0');
INSERT INTO `sx_area` VALUES ('344', '定兴县', '248', '0,6,248', '0', '344', '344', '0', '0');
INSERT INTO `sx_area` VALUES ('345', '唐县', '248', '0,6,248', '0', '345', '345', '0', '0');
INSERT INTO `sx_area` VALUES ('346', '高阳县', '248', '0,6,248', '0', '346', '346', '0', '0');
INSERT INTO `sx_area` VALUES ('347', '容城县', '248', '0,6,248', '0', '347', '347', '0', '0');
INSERT INTO `sx_area` VALUES ('348', '涞源县', '248', '0,6,248', '0', '348', '348', '0', '0');
INSERT INTO `sx_area` VALUES ('349', '望都县', '248', '0,6,248', '0', '349', '349', '0', '0');
INSERT INTO `sx_area` VALUES ('350', '安新县', '248', '0,6,248', '0', '350', '350', '0', '0');
INSERT INTO `sx_area` VALUES ('351', '易县', '248', '0,6,248', '0', '351', '351', '0', '0');
INSERT INTO `sx_area` VALUES ('352', '曲阳县', '248', '0,6,248', '0', '352', '352', '0', '0');
INSERT INTO `sx_area` VALUES ('353', '蠡县', '248', '0,6,248', '0', '353', '353', '0', '0');
INSERT INTO `sx_area` VALUES ('354', '顺平县', '248', '0,6,248', '0', '354', '354', '0', '0');
INSERT INTO `sx_area` VALUES ('355', '博野县', '248', '0,6,248', '0', '355', '355', '0', '0');
INSERT INTO `sx_area` VALUES ('356', '雄县', '248', '0,6,248', '0', '356', '356', '0', '0');
INSERT INTO `sx_area` VALUES ('357', '涿州市', '248', '0,6,248', '0', '357', '357', '0', '0');
INSERT INTO `sx_area` VALUES ('358', '定州市', '248', '0,6,248', '0', '358', '358', '0', '0');
INSERT INTO `sx_area` VALUES ('359', '安国市', '248', '0,6,248', '0', '359', '359', '0', '0');
INSERT INTO `sx_area` VALUES ('360', '高碑店市', '248', '0,6,248', '0', '360', '360', '0', '0');
INSERT INTO `sx_area` VALUES ('361', '桥东区', '249', '0,6,249', '0', '361', '361', '0', '0');
INSERT INTO `sx_area` VALUES ('362', '桥西区', '249', '0,6,249', '0', '362', '362', '0', '0');
INSERT INTO `sx_area` VALUES ('363', '宣化区', '249', '0,6,249', '0', '363', '363', '0', '0');
INSERT INTO `sx_area` VALUES ('364', '下花园区', '249', '0,6,249', '0', '364', '364', '0', '0');
INSERT INTO `sx_area` VALUES ('365', '宣化县', '249', '0,6,249', '0', '365', '365', '0', '0');
INSERT INTO `sx_area` VALUES ('366', '张北县', '249', '0,6,249', '0', '366', '366', '0', '0');
INSERT INTO `sx_area` VALUES ('367', '康保县', '249', '0,6,249', '0', '367', '367', '0', '0');
INSERT INTO `sx_area` VALUES ('368', '沽源县', '249', '0,6,249', '0', '368', '368', '0', '0');
INSERT INTO `sx_area` VALUES ('369', '尚义县', '249', '0,6,249', '0', '369', '369', '0', '0');
INSERT INTO `sx_area` VALUES ('370', '蔚县', '249', '0,6,249', '0', '370', '370', '0', '0');
INSERT INTO `sx_area` VALUES ('371', '阳原县', '249', '0,6,249', '0', '371', '371', '0', '0');
INSERT INTO `sx_area` VALUES ('372', '怀安县', '249', '0,6,249', '0', '372', '372', '0', '0');
INSERT INTO `sx_area` VALUES ('373', '万全县', '249', '0,6,249', '0', '373', '373', '0', '0');
INSERT INTO `sx_area` VALUES ('374', '怀来县', '249', '0,6,249', '0', '374', '374', '0', '0');
INSERT INTO `sx_area` VALUES ('375', '涿鹿县', '249', '0,6,249', '0', '375', '375', '0', '0');
INSERT INTO `sx_area` VALUES ('376', '赤城县', '249', '0,6,249', '0', '376', '376', '0', '0');
INSERT INTO `sx_area` VALUES ('377', '崇礼县', '249', '0,6,249', '0', '377', '377', '0', '0');
INSERT INTO `sx_area` VALUES ('378', '双桥区', '250', '0,6,250', '0', '378', '378', '0', '0');
INSERT INTO `sx_area` VALUES ('379', '双滦区', '250', '0,6,250', '0', '379', '379', '0', '0');
INSERT INTO `sx_area` VALUES ('380', '鹰手营子矿区', '250', '0,6,250', '0', '380', '380', '0', '0');
INSERT INTO `sx_area` VALUES ('381', '承德县', '250', '0,6,250', '0', '381', '381', '0', '0');
INSERT INTO `sx_area` VALUES ('382', '兴隆县', '250', '0,6,250', '0', '382', '382', '0', '0');
INSERT INTO `sx_area` VALUES ('383', '平泉县', '250', '0,6,250', '0', '383', '383', '0', '0');
INSERT INTO `sx_area` VALUES ('384', '滦平县', '250', '0,6,250', '0', '384', '384', '0', '0');
INSERT INTO `sx_area` VALUES ('385', '隆化县', '250', '0,6,250', '0', '385', '385', '0', '0');
INSERT INTO `sx_area` VALUES ('386', '丰宁满族自治县', '250', '0,6,250', '0', '386', '386', '0', '0');
INSERT INTO `sx_area` VALUES ('387', '宽城满族自治县', '250', '0,6,250', '0', '387', '387', '0', '0');
INSERT INTO `sx_area` VALUES ('388', '围场满族蒙古族自治县', '250', '0,6,250', '0', '388', '388', '0', '0');
INSERT INTO `sx_area` VALUES ('389', '新华区', '251', '0,6,251', '0', '389', '389', '0', '0');
INSERT INTO `sx_area` VALUES ('390', '运河区', '251', '0,6,251', '0', '390', '390', '0', '0');
INSERT INTO `sx_area` VALUES ('391', '沧县', '251', '0,6,251', '0', '391', '391', '0', '0');
INSERT INTO `sx_area` VALUES ('392', '青县', '251', '0,6,251', '0', '392', '392', '0', '0');
INSERT INTO `sx_area` VALUES ('393', '东光县', '251', '0,6,251', '0', '393', '393', '0', '0');
INSERT INTO `sx_area` VALUES ('394', '海兴县', '251', '0,6,251', '0', '394', '394', '0', '0');
INSERT INTO `sx_area` VALUES ('395', '盐山县', '251', '0,6,251', '0', '395', '395', '0', '0');
INSERT INTO `sx_area` VALUES ('396', '肃宁县', '251', '0,6,251', '0', '396', '396', '0', '0');
INSERT INTO `sx_area` VALUES ('397', '南皮县', '251', '0,6,251', '0', '397', '397', '0', '0');
INSERT INTO `sx_area` VALUES ('398', '吴桥县', '251', '0,6,251', '0', '398', '398', '0', '0');
INSERT INTO `sx_area` VALUES ('399', '献县', '251', '0,6,251', '0', '399', '399', '0', '0');
INSERT INTO `sx_area` VALUES ('400', '孟村回族自治县', '251', '0,6,251', '0', '400', '400', '0', '0');
INSERT INTO `sx_area` VALUES ('401', '泊头市', '251', '0,6,251', '0', '401', '401', '0', '0');
INSERT INTO `sx_area` VALUES ('402', '任丘市', '251', '0,6,251', '0', '402', '402', '0', '0');
INSERT INTO `sx_area` VALUES ('403', '黄骅市', '251', '0,6,251', '0', '403', '403', '0', '0');
INSERT INTO `sx_area` VALUES ('404', '河间市', '251', '0,6,251', '0', '404', '404', '0', '0');
INSERT INTO `sx_area` VALUES ('405', '安次区', '252', '0,6,252', '0', '405', '405', '0', '0');
INSERT INTO `sx_area` VALUES ('406', '广阳区', '252', '0,6,252', '0', '406', '406', '0', '0');
INSERT INTO `sx_area` VALUES ('407', '固安县', '252', '0,6,252', '0', '407', '407', '0', '0');
INSERT INTO `sx_area` VALUES ('408', '永清县', '252', '0,6,252', '0', '408', '408', '0', '0');
INSERT INTO `sx_area` VALUES ('409', '香河县', '252', '0,6,252', '0', '409', '409', '0', '0');
INSERT INTO `sx_area` VALUES ('410', '大城县', '252', '0,6,252', '0', '410', '410', '0', '0');
INSERT INTO `sx_area` VALUES ('411', '文安县', '252', '0,6,252', '0', '411', '411', '0', '0');
INSERT INTO `sx_area` VALUES ('412', '大厂回族自治县', '252', '0,6,252', '0', '412', '412', '0', '0');
INSERT INTO `sx_area` VALUES ('413', '开发区', '252', '0,6,252', '0', '413', '413', '0', '0');
INSERT INTO `sx_area` VALUES ('414', '霸州市', '252', '0,6,252', '0', '414', '414', '0', '0');
INSERT INTO `sx_area` VALUES ('415', '三河市', '252', '0,6,252', '0', '415', '415', '0', '0');
INSERT INTO `sx_area` VALUES ('416', '桃城区', '253', '0,6,253', '0', '416', '416', '0', '0');
INSERT INTO `sx_area` VALUES ('417', '枣强县', '253', '0,6,253', '0', '417', '417', '0', '0');
INSERT INTO `sx_area` VALUES ('418', '武邑县', '253', '0,6,253', '0', '418', '418', '0', '0');
INSERT INTO `sx_area` VALUES ('419', '武强县', '253', '0,6,253', '0', '419', '419', '0', '0');
INSERT INTO `sx_area` VALUES ('420', '饶阳县', '253', '0,6,253', '0', '420', '420', '0', '0');
INSERT INTO `sx_area` VALUES ('421', '安平县', '253', '0,6,253', '0', '421', '421', '0', '0');
INSERT INTO `sx_area` VALUES ('422', '故城县', '253', '0,6,253', '0', '422', '422', '0', '0');
INSERT INTO `sx_area` VALUES ('423', '景县', '253', '0,6,253', '0', '423', '423', '0', '0');
INSERT INTO `sx_area` VALUES ('424', '阜城县', '253', '0,6,253', '0', '424', '424', '0', '0');
INSERT INTO `sx_area` VALUES ('425', '冀州市', '253', '0,6,253', '0', '425', '425', '0', '0');
INSERT INTO `sx_area` VALUES ('426', '深州市', '253', '0,6,253', '0', '426', '426', '0', '0');
INSERT INTO `sx_area` VALUES ('427', '太原市', '7', '0,7', '1', '427,438,439,440,441,442,443,444,445,446,447', '427', '0', '0');
INSERT INTO `sx_area` VALUES ('428', '大同市', '7', '0,7', '1', '428,448,449,450,451,452,453,454,455,456,457,458', '428', '0', '0');
INSERT INTO `sx_area` VALUES ('429', '阳泉市', '7', '0,7', '1', '429,459,460,461,462,463', '429', '0', '0');
INSERT INTO `sx_area` VALUES ('430', '长治市', '7', '0,7', '1', '430,464,465,466,467,468,469,470,471,472,473,474,475,476', '430', '0', '0');
INSERT INTO `sx_area` VALUES ('431', '晋城市', '7', '0,7', '1', '431,477,478,479,480,481,482', '431', '0', '0');
INSERT INTO `sx_area` VALUES ('432', '朔州市', '7', '0,7', '1', '432,483,484,485,486,487,488', '432', '0', '0');
INSERT INTO `sx_area` VALUES ('433', '晋中市', '7', '0,7', '1', '433,489,490,491,492,493,494,495,496,497,498,499', '433', '0', '0');
INSERT INTO `sx_area` VALUES ('434', '运城市', '7', '0,7', '1', '434,500,501,502,503,504,505,506,507,508,509,510,511,512', '434', '0', '0');
INSERT INTO `sx_area` VALUES ('435', '忻州市', '7', '0,7', '1', '435,513,514,515,516,517,518,519,520,521,522,523,524,525,526', '435', '0', '0');
INSERT INTO `sx_area` VALUES ('436', '临汾市', '7', '0,7', '1', '436,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543', '436', '0', '0');
INSERT INTO `sx_area` VALUES ('437', '吕梁地区', '7', '0,7', '1', '437,544,545,546,547,548,549,550,551,552,553,554,555,556', '437', '0', '0');
INSERT INTO `sx_area` VALUES ('438', '小店区', '427', '0,7,427', '0', '438', '438', '0', '0');
INSERT INTO `sx_area` VALUES ('439', '迎泽区', '427', '0,7,427', '0', '439', '439', '0', '0');
INSERT INTO `sx_area` VALUES ('440', '杏花岭区', '427', '0,7,427', '0', '440', '440', '0', '0');
INSERT INTO `sx_area` VALUES ('441', '尖草坪区', '427', '0,7,427', '0', '441', '441', '0', '0');
INSERT INTO `sx_area` VALUES ('442', '万柏林区', '427', '0,7,427', '0', '442', '442', '0', '0');
INSERT INTO `sx_area` VALUES ('443', '晋源区', '427', '0,7,427', '0', '443', '443', '0', '0');
INSERT INTO `sx_area` VALUES ('444', '清徐县', '427', '0,7,427', '0', '444', '444', '0', '0');
INSERT INTO `sx_area` VALUES ('445', '阳曲县', '427', '0,7,427', '0', '445', '445', '0', '0');
INSERT INTO `sx_area` VALUES ('446', '娄烦县', '427', '0,7,427', '0', '446', '446', '0', '0');
INSERT INTO `sx_area` VALUES ('447', '古交市', '427', '0,7,427', '0', '447', '447', '0', '0');
INSERT INTO `sx_area` VALUES ('448', '城区', '428', '0,7,428', '0', '448', '448', '0', '0');
INSERT INTO `sx_area` VALUES ('449', '矿区', '428', '0,7,428', '0', '449', '449', '0', '0');
INSERT INTO `sx_area` VALUES ('450', '南郊区', '428', '0,7,428', '0', '450', '450', '0', '0');
INSERT INTO `sx_area` VALUES ('451', '新荣区', '428', '0,7,428', '0', '451', '451', '0', '0');
INSERT INTO `sx_area` VALUES ('452', '阳高县', '428', '0,7,428', '0', '452', '452', '0', '0');
INSERT INTO `sx_area` VALUES ('453', '天镇县', '428', '0,7,428', '0', '453', '453', '0', '0');
INSERT INTO `sx_area` VALUES ('454', '广灵县', '428', '0,7,428', '0', '454', '454', '0', '0');
INSERT INTO `sx_area` VALUES ('455', '灵丘县', '428', '0,7,428', '0', '455', '455', '0', '0');
INSERT INTO `sx_area` VALUES ('456', '浑源县', '428', '0,7,428', '0', '456', '456', '0', '0');
INSERT INTO `sx_area` VALUES ('457', '左云县', '428', '0,7,428', '0', '457', '457', '0', '0');
INSERT INTO `sx_area` VALUES ('458', '大同县', '428', '0,7,428', '0', '458', '458', '0', '0');
INSERT INTO `sx_area` VALUES ('459', '城区', '429', '0,7,429', '0', '459', '459', '0', '0');
INSERT INTO `sx_area` VALUES ('460', '矿区', '429', '0,7,429', '0', '460', '460', '0', '0');
INSERT INTO `sx_area` VALUES ('461', '郊区', '429', '0,7,429', '0', '461', '461', '0', '0');
INSERT INTO `sx_area` VALUES ('462', '平定县', '429', '0,7,429', '0', '462', '462', '0', '0');
INSERT INTO `sx_area` VALUES ('463', '盂县', '429', '0,7,429', '0', '463', '463', '0', '0');
INSERT INTO `sx_area` VALUES ('464', '城区', '430', '0,7,430', '0', '464', '464', '0', '0');
INSERT INTO `sx_area` VALUES ('465', '郊区', '430', '0,7,430', '0', '465', '465', '0', '0');
INSERT INTO `sx_area` VALUES ('466', '长治县', '430', '0,7,430', '0', '466', '466', '0', '0');
INSERT INTO `sx_area` VALUES ('467', '襄垣县', '430', '0,7,430', '0', '467', '467', '0', '0');
INSERT INTO `sx_area` VALUES ('468', '屯留县', '430', '0,7,430', '0', '468', '468', '0', '0');
INSERT INTO `sx_area` VALUES ('469', '平顺县', '430', '0,7,430', '0', '469', '469', '0', '0');
INSERT INTO `sx_area` VALUES ('470', '黎城县', '430', '0,7,430', '0', '470', '470', '0', '0');
INSERT INTO `sx_area` VALUES ('471', '壶关县', '430', '0,7,430', '0', '471', '471', '0', '0');
INSERT INTO `sx_area` VALUES ('472', '长子县', '430', '0,7,430', '0', '472', '472', '0', '0');
INSERT INTO `sx_area` VALUES ('473', '武乡县', '430', '0,7,430', '0', '473', '473', '0', '0');
INSERT INTO `sx_area` VALUES ('474', '沁县', '430', '0,7,430', '0', '474', '474', '0', '0');
INSERT INTO `sx_area` VALUES ('475', '沁源县', '430', '0,7,430', '0', '475', '475', '0', '0');
INSERT INTO `sx_area` VALUES ('476', '潞城市', '430', '0,7,430', '0', '476', '476', '0', '0');
INSERT INTO `sx_area` VALUES ('477', '城区', '431', '0,7,431', '0', '477', '477', '0', '0');
INSERT INTO `sx_area` VALUES ('478', '沁水县', '431', '0,7,431', '0', '478', '478', '0', '0');
INSERT INTO `sx_area` VALUES ('479', '阳城县', '431', '0,7,431', '0', '479', '479', '0', '0');
INSERT INTO `sx_area` VALUES ('480', '陵川县', '431', '0,7,431', '0', '480', '480', '0', '0');
INSERT INTO `sx_area` VALUES ('481', '泽州县', '431', '0,7,431', '0', '481', '481', '0', '0');
INSERT INTO `sx_area` VALUES ('482', '高平市', '431', '0,7,431', '0', '482', '482', '0', '0');
INSERT INTO `sx_area` VALUES ('483', '朔城区', '432', '0,7,432', '0', '483', '483', '0', '0');
INSERT INTO `sx_area` VALUES ('484', '平鲁区', '432', '0,7,432', '0', '484', '484', '0', '0');
INSERT INTO `sx_area` VALUES ('485', '山阴县', '432', '0,7,432', '0', '485', '485', '0', '0');
INSERT INTO `sx_area` VALUES ('486', '应县', '432', '0,7,432', '0', '486', '486', '0', '0');
INSERT INTO `sx_area` VALUES ('487', '右玉县', '432', '0,7,432', '0', '487', '487', '0', '0');
INSERT INTO `sx_area` VALUES ('488', '怀仁县', '432', '0,7,432', '0', '488', '488', '0', '0');
INSERT INTO `sx_area` VALUES ('489', '榆次区', '433', '0,7,433', '0', '489', '489', '0', '0');
INSERT INTO `sx_area` VALUES ('490', '榆社县', '433', '0,7,433', '0', '490', '490', '0', '0');
INSERT INTO `sx_area` VALUES ('491', '左权县', '433', '0,7,433', '0', '491', '491', '0', '0');
INSERT INTO `sx_area` VALUES ('492', '和顺县', '433', '0,7,433', '0', '492', '492', '0', '0');
INSERT INTO `sx_area` VALUES ('493', '昔阳县', '433', '0,7,433', '0', '493', '493', '0', '0');
INSERT INTO `sx_area` VALUES ('494', '寿阳县', '433', '0,7,433', '0', '494', '494', '0', '0');
INSERT INTO `sx_area` VALUES ('495', '太谷县', '433', '0,7,433', '0', '495', '495', '0', '0');
INSERT INTO `sx_area` VALUES ('496', '祁县', '433', '0,7,433', '0', '496', '496', '0', '0');
INSERT INTO `sx_area` VALUES ('497', '平遥县', '433', '0,7,433', '0', '497', '497', '0', '0');
INSERT INTO `sx_area` VALUES ('498', '灵石县', '433', '0,7,433', '0', '498', '498', '0', '0');
INSERT INTO `sx_area` VALUES ('499', '介休市', '433', '0,7,433', '0', '499', '499', '0', '0');
INSERT INTO `sx_area` VALUES ('500', '盐湖区', '434', '0,7,434', '0', '500', '500', '0', '0');
INSERT INTO `sx_area` VALUES ('501', '临猗县', '434', '0,7,434', '0', '501', '501', '0', '0');
INSERT INTO `sx_area` VALUES ('502', '万荣县', '434', '0,7,434', '0', '502', '502', '0', '0');
INSERT INTO `sx_area` VALUES ('503', '闻喜县', '434', '0,7,434', '0', '503', '503', '0', '0');
INSERT INTO `sx_area` VALUES ('504', '稷山县', '434', '0,7,434', '0', '504', '504', '0', '0');
INSERT INTO `sx_area` VALUES ('505', '新绛县', '434', '0,7,434', '0', '505', '505', '0', '0');
INSERT INTO `sx_area` VALUES ('506', '绛县', '434', '0,7,434', '0', '506', '506', '0', '0');
INSERT INTO `sx_area` VALUES ('507', '垣曲县', '434', '0,7,434', '0', '507', '507', '0', '0');
INSERT INTO `sx_area` VALUES ('508', '夏县', '434', '0,7,434', '0', '508', '508', '0', '0');
INSERT INTO `sx_area` VALUES ('509', '平陆县', '434', '0,7,434', '0', '509', '509', '0', '0');
INSERT INTO `sx_area` VALUES ('510', '芮城县', '434', '0,7,434', '0', '510', '510', '0', '0');
INSERT INTO `sx_area` VALUES ('511', '永济市', '434', '0,7,434', '0', '511', '511', '0', '0');
INSERT INTO `sx_area` VALUES ('512', '河津市', '434', '0,7,434', '0', '512', '512', '0', '0');
INSERT INTO `sx_area` VALUES ('513', '忻府区', '435', '0,7,435', '0', '513', '513', '0', '0');
INSERT INTO `sx_area` VALUES ('514', '定襄县', '435', '0,7,435', '0', '514', '514', '0', '0');
INSERT INTO `sx_area` VALUES ('515', '五台县', '435', '0,7,435', '0', '515', '515', '0', '0');
INSERT INTO `sx_area` VALUES ('516', '代县', '435', '0,7,435', '0', '516', '516', '0', '0');
INSERT INTO `sx_area` VALUES ('517', '繁峙县', '435', '0,7,435', '0', '517', '517', '0', '0');
INSERT INTO `sx_area` VALUES ('518', '宁武县', '435', '0,7,435', '0', '518', '518', '0', '0');
INSERT INTO `sx_area` VALUES ('519', '静乐县', '435', '0,7,435', '0', '519', '519', '0', '0');
INSERT INTO `sx_area` VALUES ('520', '神池县', '435', '0,7,435', '0', '520', '520', '0', '0');
INSERT INTO `sx_area` VALUES ('521', '五寨县', '435', '0,7,435', '0', '521', '521', '0', '0');
INSERT INTO `sx_area` VALUES ('522', '岢岚县', '435', '0,7,435', '0', '522', '522', '0', '0');
INSERT INTO `sx_area` VALUES ('523', '河曲县', '435', '0,7,435', '0', '523', '523', '0', '0');
INSERT INTO `sx_area` VALUES ('524', '保德县', '435', '0,7,435', '0', '524', '524', '0', '0');
INSERT INTO `sx_area` VALUES ('525', '偏关县', '435', '0,7,435', '0', '525', '525', '0', '0');
INSERT INTO `sx_area` VALUES ('526', '原平市', '435', '0,7,435', '0', '526', '526', '0', '0');
INSERT INTO `sx_area` VALUES ('527', '尧都区', '436', '0,7,436', '0', '527', '527', '0', '0');
INSERT INTO `sx_area` VALUES ('528', '曲沃县', '436', '0,7,436', '0', '528', '528', '0', '0');
INSERT INTO `sx_area` VALUES ('529', '翼城县', '436', '0,7,436', '0', '529', '529', '0', '0');
INSERT INTO `sx_area` VALUES ('530', '襄汾县', '436', '0,7,436', '0', '530', '530', '0', '0');
INSERT INTO `sx_area` VALUES ('531', '洪洞县', '436', '0,7,436', '0', '531', '531', '0', '0');
INSERT INTO `sx_area` VALUES ('532', '古县', '436', '0,7,436', '0', '532', '532', '0', '0');
INSERT INTO `sx_area` VALUES ('533', '安泽县', '436', '0,7,436', '0', '533', '533', '0', '0');
INSERT INTO `sx_area` VALUES ('534', '浮山县', '436', '0,7,436', '0', '534', '534', '0', '0');
INSERT INTO `sx_area` VALUES ('535', '吉县', '436', '0,7,436', '0', '535', '535', '0', '0');
INSERT INTO `sx_area` VALUES ('536', '乡宁县', '436', '0,7,436', '0', '536', '536', '0', '0');
INSERT INTO `sx_area` VALUES ('537', '大宁县', '436', '0,7,436', '0', '537', '537', '0', '0');
INSERT INTO `sx_area` VALUES ('538', '隰县', '436', '0,7,436', '0', '538', '538', '0', '0');
INSERT INTO `sx_area` VALUES ('539', '永和县', '436', '0,7,436', '0', '539', '539', '0', '0');
INSERT INTO `sx_area` VALUES ('540', '蒲县', '436', '0,7,436', '0', '540', '540', '0', '0');
INSERT INTO `sx_area` VALUES ('541', '汾西县', '436', '0,7,436', '0', '541', '541', '0', '0');
INSERT INTO `sx_area` VALUES ('542', '侯马市', '436', '0,7,436', '0', '542', '542', '0', '0');
INSERT INTO `sx_area` VALUES ('543', '霍州市', '436', '0,7,436', '0', '543', '543', '0', '0');
INSERT INTO `sx_area` VALUES ('544', '孝义市', '437', '0,7,437', '0', '544', '544', '0', '0');
INSERT INTO `sx_area` VALUES ('545', '离石市', '437', '0,7,437', '0', '545', '545', '0', '0');
INSERT INTO `sx_area` VALUES ('546', '汾阳市', '437', '0,7,437', '0', '546', '546', '0', '0');
INSERT INTO `sx_area` VALUES ('547', '文水县', '437', '0,7,437', '0', '547', '547', '0', '0');
INSERT INTO `sx_area` VALUES ('548', '交城县', '437', '0,7,437', '0', '548', '548', '0', '0');
INSERT INTO `sx_area` VALUES ('549', '兴县', '437', '0,7,437', '0', '549', '549', '0', '0');
INSERT INTO `sx_area` VALUES ('550', '临县', '437', '0,7,437', '0', '550', '550', '0', '0');
INSERT INTO `sx_area` VALUES ('551', '柳林县', '437', '0,7,437', '0', '551', '551', '0', '0');
INSERT INTO `sx_area` VALUES ('552', '石楼县', '437', '0,7,437', '0', '552', '552', '0', '0');
INSERT INTO `sx_area` VALUES ('553', '岚县', '437', '0,7,437', '0', '553', '553', '0', '0');
INSERT INTO `sx_area` VALUES ('554', '方山县', '437', '0,7,437', '0', '554', '554', '0', '0');
INSERT INTO `sx_area` VALUES ('555', '中阳县', '437', '0,7,437', '0', '555', '555', '0', '0');
INSERT INTO `sx_area` VALUES ('556', '交口县', '437', '0,7,437', '0', '556', '556', '0', '0');
INSERT INTO `sx_area` VALUES ('557', '呼和浩特市', '8', '0,8', '1', '557,569,570,571,572,573,574,575,576,577', '557', '0', '0');
INSERT INTO `sx_area` VALUES ('558', '包头市', '8', '0,8', '1', '558,578,579,580,581,582,583,584,585,586', '558', '0', '0');
INSERT INTO `sx_area` VALUES ('559', '乌海市', '8', '0,8', '1', '559,587,588,589', '559', '0', '0');
INSERT INTO `sx_area` VALUES ('560', '赤峰市', '8', '0,8', '1', '560,590,591,592,593,594,595,596,597,598,599,600,601', '560', '0', '0');
INSERT INTO `sx_area` VALUES ('561', '通辽市', '8', '0,8', '1', '561,602,603,604,605,606,607,608,609', '561', '0', '0');
INSERT INTO `sx_area` VALUES ('562', '鄂尔多斯市', '8', '0,8', '1', '562,610,611,612,613,614,615,616,617', '562', '0', '0');
INSERT INTO `sx_area` VALUES ('563', '呼伦贝尔市', '8', '0,8', '1', '563,618,619,620,621,622,623,624,625,626,627,628,629', '563', '0', '0');
INSERT INTO `sx_area` VALUES ('564', '兴安盟', '8', '0,8', '1', '564,630,631,632,633,634,635', '564', '0', '0');
INSERT INTO `sx_area` VALUES ('565', '锡林郭勒盟', '8', '0,8', '1', '565,636,637,638,639,640,641,642,643,644,645,646,647', '565', '0', '0');
INSERT INTO `sx_area` VALUES ('566', '乌兰察布盟', '8', '0,8', '1', '566,648,649,650,651,652,653,654,655,656,657,658', '566', '0', '0');
INSERT INTO `sx_area` VALUES ('567', '巴彦淖尔盟', '8', '0,8', '1', '567,659,660,661,662,663,664,665', '567', '0', '0');
INSERT INTO `sx_area` VALUES ('568', '阿拉善盟', '8', '0,8', '1', '568,666,667,668', '568', '0', '0');
INSERT INTO `sx_area` VALUES ('569', '新城区', '557', '0,8,557', '0', '569', '569', '0', '0');
INSERT INTO `sx_area` VALUES ('570', '回民区', '557', '0,8,557', '0', '570', '570', '0', '0');
INSERT INTO `sx_area` VALUES ('571', '玉泉区', '557', '0,8,557', '0', '571', '571', '0', '0');
INSERT INTO `sx_area` VALUES ('572', '赛罕区', '557', '0,8,557', '0', '572', '572', '0', '0');
INSERT INTO `sx_area` VALUES ('573', '土默特左旗', '557', '0,8,557', '0', '573', '573', '0', '0');
INSERT INTO `sx_area` VALUES ('574', '托克托县', '557', '0,8,557', '0', '574', '574', '0', '0');
INSERT INTO `sx_area` VALUES ('575', '和林格尔县', '557', '0,8,557', '0', '575', '575', '0', '0');
INSERT INTO `sx_area` VALUES ('576', '清水河县', '557', '0,8,557', '0', '576', '576', '0', '0');
INSERT INTO `sx_area` VALUES ('577', '武川县', '557', '0,8,557', '0', '577', '577', '0', '0');
INSERT INTO `sx_area` VALUES ('578', '东河区', '558', '0,8,558', '0', '578', '578', '0', '0');
INSERT INTO `sx_area` VALUES ('579', '昆都仑区', '558', '0,8,558', '0', '579', '579', '0', '0');
INSERT INTO `sx_area` VALUES ('580', '青山区', '558', '0,8,558', '0', '580', '580', '0', '0');
INSERT INTO `sx_area` VALUES ('581', '石拐区', '558', '0,8,558', '0', '581', '581', '0', '0');
INSERT INTO `sx_area` VALUES ('582', '白云矿区', '558', '0,8,558', '0', '582', '582', '0', '0');
INSERT INTO `sx_area` VALUES ('583', '九原区', '558', '0,8,558', '0', '583', '583', '0', '0');
INSERT INTO `sx_area` VALUES ('584', '土默特右旗', '558', '0,8,558', '0', '584', '584', '0', '0');
INSERT INTO `sx_area` VALUES ('585', '固阳县', '558', '0,8,558', '0', '585', '585', '0', '0');
INSERT INTO `sx_area` VALUES ('586', '达尔罕茂明安联合旗', '558', '0,8,558', '0', '586', '586', '0', '0');
INSERT INTO `sx_area` VALUES ('587', '海勃湾区', '559', '0,8,559', '0', '587', '587', '0', '0');
INSERT INTO `sx_area` VALUES ('588', '海南区', '559', '0,8,559', '0', '588', '588', '0', '0');
INSERT INTO `sx_area` VALUES ('589', '乌达区', '559', '0,8,559', '0', '589', '589', '0', '0');
INSERT INTO `sx_area` VALUES ('590', '红山区', '560', '0,8,560', '0', '590', '590', '0', '0');
INSERT INTO `sx_area` VALUES ('591', '元宝山区', '560', '0,8,560', '0', '591', '591', '0', '0');
INSERT INTO `sx_area` VALUES ('592', '松山区', '560', '0,8,560', '0', '592', '592', '0', '0');
INSERT INTO `sx_area` VALUES ('593', '阿鲁科尔沁旗', '560', '0,8,560', '0', '593', '593', '0', '0');
INSERT INTO `sx_area` VALUES ('594', '巴林左旗', '560', '0,8,560', '0', '594', '594', '0', '0');
INSERT INTO `sx_area` VALUES ('595', '巴林右旗', '560', '0,8,560', '0', '595', '595', '0', '0');
INSERT INTO `sx_area` VALUES ('596', '林西县', '560', '0,8,560', '0', '596', '596', '0', '0');
INSERT INTO `sx_area` VALUES ('597', '克什克腾旗', '560', '0,8,560', '0', '597', '597', '0', '0');
INSERT INTO `sx_area` VALUES ('598', '翁牛特旗', '560', '0,8,560', '0', '598', '598', '0', '0');
INSERT INTO `sx_area` VALUES ('599', '喀喇沁旗', '560', '0,8,560', '0', '599', '599', '0', '0');
INSERT INTO `sx_area` VALUES ('600', '宁城县', '560', '0,8,560', '0', '600', '600', '0', '0');
INSERT INTO `sx_area` VALUES ('601', '敖汉旗', '560', '0,8,560', '0', '601', '601', '0', '0');
INSERT INTO `sx_area` VALUES ('602', '科尔沁区', '561', '0,8,561', '0', '602', '602', '0', '0');
INSERT INTO `sx_area` VALUES ('603', '科尔沁左翼中旗', '561', '0,8,561', '0', '603', '603', '0', '0');
INSERT INTO `sx_area` VALUES ('604', '科尔沁左翼后旗', '561', '0,8,561', '0', '604', '604', '0', '0');
INSERT INTO `sx_area` VALUES ('605', '开鲁县', '561', '0,8,561', '0', '605', '605', '0', '0');
INSERT INTO `sx_area` VALUES ('606', '库伦旗', '561', '0,8,561', '0', '606', '606', '0', '0');
INSERT INTO `sx_area` VALUES ('607', '奈曼旗', '561', '0,8,561', '0', '607', '607', '0', '0');
INSERT INTO `sx_area` VALUES ('608', '扎鲁特旗', '561', '0,8,561', '0', '608', '608', '0', '0');
INSERT INTO `sx_area` VALUES ('609', '霍林郭勒市', '561', '0,8,561', '0', '609', '609', '0', '0');
INSERT INTO `sx_area` VALUES ('610', '东胜区', '562', '0,8,562', '0', '610', '610', '0', '0');
INSERT INTO `sx_area` VALUES ('611', '达拉特旗', '562', '0,8,562', '0', '611', '611', '0', '0');
INSERT INTO `sx_area` VALUES ('612', '准格尔旗', '562', '0,8,562', '0', '612', '612', '0', '0');
INSERT INTO `sx_area` VALUES ('613', '鄂托克前旗', '562', '0,8,562', '0', '613', '613', '0', '0');
INSERT INTO `sx_area` VALUES ('614', '鄂托克旗', '562', '0,8,562', '0', '614', '614', '0', '0');
INSERT INTO `sx_area` VALUES ('615', '杭锦旗', '562', '0,8,562', '0', '615', '615', '0', '0');
INSERT INTO `sx_area` VALUES ('616', '乌审旗', '562', '0,8,562', '0', '616', '616', '0', '0');
INSERT INTO `sx_area` VALUES ('617', '伊金霍洛旗', '562', '0,8,562', '0', '617', '617', '0', '0');
INSERT INTO `sx_area` VALUES ('618', '海拉尔区', '563', '0,8,563', '0', '618', '618', '0', '0');
INSERT INTO `sx_area` VALUES ('619', '阿荣旗', '563', '0,8,563', '0', '619', '619', '0', '0');
INSERT INTO `sx_area` VALUES ('620', '鄂伦春自治旗', '563', '0,8,563', '0', '620', '620', '0', '0');
INSERT INTO `sx_area` VALUES ('621', '鄂温克族自治旗', '563', '0,8,563', '0', '621', '621', '0', '0');
INSERT INTO `sx_area` VALUES ('622', '陈巴尔虎旗', '563', '0,8,563', '0', '622', '622', '0', '0');
INSERT INTO `sx_area` VALUES ('623', '新巴尔虎左旗', '563', '0,8,563', '0', '623', '623', '0', '0');
INSERT INTO `sx_area` VALUES ('624', '新巴尔虎右旗', '563', '0,8,563', '0', '624', '624', '0', '0');
INSERT INTO `sx_area` VALUES ('625', '满洲里市', '563', '0,8,563', '0', '625', '625', '0', '0');
INSERT INTO `sx_area` VALUES ('626', '牙克石市', '563', '0,8,563', '0', '626', '626', '0', '0');
INSERT INTO `sx_area` VALUES ('627', '扎兰屯市', '563', '0,8,563', '0', '627', '627', '0', '0');
INSERT INTO `sx_area` VALUES ('628', '额尔古纳市', '563', '0,8,563', '0', '628', '628', '0', '0');
INSERT INTO `sx_area` VALUES ('629', '根河市', '563', '0,8,563', '0', '629', '629', '0', '0');
INSERT INTO `sx_area` VALUES ('630', '乌兰浩特市', '564', '0,8,564', '0', '630', '630', '0', '0');
INSERT INTO `sx_area` VALUES ('631', '阿尔山市', '564', '0,8,564', '0', '631', '631', '0', '0');
INSERT INTO `sx_area` VALUES ('632', '科尔沁右翼前旗', '564', '0,8,564', '0', '632', '632', '0', '0');
INSERT INTO `sx_area` VALUES ('633', '科尔沁右翼中旗', '564', '0,8,564', '0', '633', '633', '0', '0');
INSERT INTO `sx_area` VALUES ('634', '扎赉特旗', '564', '0,8,564', '0', '634', '634', '0', '0');
INSERT INTO `sx_area` VALUES ('635', '突泉县', '564', '0,8,564', '0', '635', '635', '0', '0');
INSERT INTO `sx_area` VALUES ('636', '二连浩特市', '565', '0,8,565', '0', '636', '636', '0', '0');
INSERT INTO `sx_area` VALUES ('637', '锡林浩特市', '565', '0,8,565', '0', '637', '637', '0', '0');
INSERT INTO `sx_area` VALUES ('638', '阿巴嘎旗', '565', '0,8,565', '0', '638', '638', '0', '0');
INSERT INTO `sx_area` VALUES ('639', '苏尼特左旗', '565', '0,8,565', '0', '639', '639', '0', '0');
INSERT INTO `sx_area` VALUES ('640', '苏尼特右旗', '565', '0,8,565', '0', '640', '640', '0', '0');
INSERT INTO `sx_area` VALUES ('641', '东乌珠穆沁旗', '565', '0,8,565', '0', '641', '641', '0', '0');
INSERT INTO `sx_area` VALUES ('642', '西乌珠穆沁旗', '565', '0,8,565', '0', '642', '642', '0', '0');
INSERT INTO `sx_area` VALUES ('643', '太仆寺旗', '565', '0,8,565', '0', '643', '643', '0', '0');
INSERT INTO `sx_area` VALUES ('644', '镶黄旗', '565', '0,8,565', '0', '644', '644', '0', '0');
INSERT INTO `sx_area` VALUES ('645', '正镶白旗', '565', '0,8,565', '0', '645', '645', '0', '0');
INSERT INTO `sx_area` VALUES ('646', '正蓝旗', '565', '0,8,565', '0', '646', '646', '0', '0');
INSERT INTO `sx_area` VALUES ('647', '多伦县', '565', '0,8,565', '0', '647', '647', '0', '0');
INSERT INTO `sx_area` VALUES ('648', '集宁市', '566', '0,8,566', '0', '648', '648', '0', '0');
INSERT INTO `sx_area` VALUES ('649', '丰镇市', '566', '0,8,566', '0', '649', '649', '0', '0');
INSERT INTO `sx_area` VALUES ('650', '卓资县', '566', '0,8,566', '0', '650', '650', '0', '0');
INSERT INTO `sx_area` VALUES ('651', '化德县', '566', '0,8,566', '0', '651', '651', '0', '0');
INSERT INTO `sx_area` VALUES ('652', '商都县', '566', '0,8,566', '0', '652', '652', '0', '0');
INSERT INTO `sx_area` VALUES ('653', '兴和县', '566', '0,8,566', '0', '653', '653', '0', '0');
INSERT INTO `sx_area` VALUES ('654', '凉城县', '566', '0,8,566', '0', '654', '654', '0', '0');
INSERT INTO `sx_area` VALUES ('655', '察哈尔右翼前旗', '566', '0,8,566', '0', '655', '655', '0', '0');
INSERT INTO `sx_area` VALUES ('656', '察哈尔右翼中旗', '566', '0,8,566', '0', '656', '656', '0', '0');
INSERT INTO `sx_area` VALUES ('657', '察哈尔右翼后旗', '566', '0,8,566', '0', '657', '657', '0', '0');
INSERT INTO `sx_area` VALUES ('658', '四子王旗', '566', '0,8,566', '0', '658', '658', '0', '0');
INSERT INTO `sx_area` VALUES ('659', '临河市', '567', '0,8,567', '0', '659', '659', '0', '0');
INSERT INTO `sx_area` VALUES ('660', '五原县', '567', '0,8,567', '0', '660', '660', '0', '0');
INSERT INTO `sx_area` VALUES ('661', '磴口县', '567', '0,8,567', '0', '661', '661', '0', '0');
INSERT INTO `sx_area` VALUES ('662', '乌拉特前旗', '567', '0,8,567', '0', '662', '662', '0', '0');
INSERT INTO `sx_area` VALUES ('663', '乌拉特中旗', '567', '0,8,567', '0', '663', '663', '0', '0');
INSERT INTO `sx_area` VALUES ('664', '乌拉特后旗', '567', '0,8,567', '0', '664', '664', '0', '0');
INSERT INTO `sx_area` VALUES ('665', '杭锦后旗', '567', '0,8,567', '0', '665', '665', '0', '0');
INSERT INTO `sx_area` VALUES ('666', '阿拉善左旗', '568', '0,8,568', '0', '666', '666', '0', '0');
INSERT INTO `sx_area` VALUES ('667', '阿拉善右旗', '568', '0,8,568', '0', '667', '667', '0', '0');
INSERT INTO `sx_area` VALUES ('668', '额济纳旗', '568', '0,8,568', '0', '668', '668', '0', '0');
INSERT INTO `sx_area` VALUES ('669', '沈阳市', '9', '0,9', '1', '669,683,684,685,686,687,688,689,690,691,692,693,694,695', '669', '0', '0');
INSERT INTO `sx_area` VALUES ('670', '大连市', '9', '0,9', '1', '670,696,697,698,699,700,701,702,703,704,705,706', '670', '0', '0');
INSERT INTO `sx_area` VALUES ('671', '鞍山市', '9', '0,9', '1', '671,707,708,709,710,711,712,713', '671', '0', '0');
INSERT INTO `sx_area` VALUES ('672', '抚顺市', '9', '0,9', '1', '672,714,715,716,717,718,719,720', '672', '0', '0');
INSERT INTO `sx_area` VALUES ('673', '本溪市', '9', '0,9', '1', '673,721,722,723,724,725,726', '673', '0', '0');
INSERT INTO `sx_area` VALUES ('674', '丹东市', '9', '0,9', '1', '674,727,728,729,730,731,732', '674', '0', '0');
INSERT INTO `sx_area` VALUES ('675', '锦州市', '9', '0,9', '1', '675,733,734,735,736,737,738,739', '675', '0', '0');
INSERT INTO `sx_area` VALUES ('676', '营口市', '9', '0,9', '1', '676,740,741,742,743,744,745', '676', '0', '0');
INSERT INTO `sx_area` VALUES ('677', '阜新市', '9', '0,9', '1', '677,746,747,748,749,750,751,752', '677', '0', '0');
INSERT INTO `sx_area` VALUES ('678', '辽阳市', '9', '0,9', '1', '678,753,754,755,756,757,758,759', '678', '0', '0');
INSERT INTO `sx_area` VALUES ('679', '盘锦市', '9', '0,9', '1', '679,760,761,762,763', '679', '0', '0');
INSERT INTO `sx_area` VALUES ('680', '铁岭市', '9', '0,9', '1', '680,764,765,766,767,768,769,770', '680', '0', '0');
INSERT INTO `sx_area` VALUES ('681', '朝阳市', '9', '0,9', '1', '681,771,772,773,774,775,776,777', '681', '0', '0');
INSERT INTO `sx_area` VALUES ('682', '葫芦岛市', '9', '0,9', '1', '682,778,779,780,781,782,783', '682', '0', '0');
INSERT INTO `sx_area` VALUES ('683', '和平区', '669', '0,9,669', '0', '683', '683', '0', '0');
INSERT INTO `sx_area` VALUES ('684', '沈河区', '669', '0,9,669', '0', '684', '684', '0', '0');
INSERT INTO `sx_area` VALUES ('685', '大东区', '669', '0,9,669', '0', '685', '685', '0', '0');
INSERT INTO `sx_area` VALUES ('686', '皇姑区', '669', '0,9,669', '0', '686', '686', '0', '0');
INSERT INTO `sx_area` VALUES ('687', '铁西区', '669', '0,9,669', '0', '687', '687', '0', '0');
INSERT INTO `sx_area` VALUES ('688', '苏家屯区', '669', '0,9,669', '0', '688', '688', '0', '0');
INSERT INTO `sx_area` VALUES ('689', '东陵区', '669', '0,9,669', '0', '689', '689', '0', '0');
INSERT INTO `sx_area` VALUES ('690', '新城子区', '669', '0,9,669', '0', '690', '690', '0', '0');
INSERT INTO `sx_area` VALUES ('691', '于洪区', '669', '0,9,669', '0', '691', '691', '0', '0');
INSERT INTO `sx_area` VALUES ('692', '辽中县', '669', '0,9,669', '0', '692', '692', '0', '0');
INSERT INTO `sx_area` VALUES ('693', '康平县', '669', '0,9,669', '0', '693', '693', '0', '0');
INSERT INTO `sx_area` VALUES ('694', '法库县', '669', '0,9,669', '0', '694', '694', '0', '0');
INSERT INTO `sx_area` VALUES ('695', '新民市', '669', '0,9,669', '0', '695', '695', '0', '0');
INSERT INTO `sx_area` VALUES ('696', '中山区', '670', '0,9,670', '0', '696', '696', '0', '0');
INSERT INTO `sx_area` VALUES ('697', '西岗区', '670', '0,9,670', '0', '697', '697', '0', '0');
INSERT INTO `sx_area` VALUES ('698', '沙河口区', '670', '0,9,670', '0', '698', '698', '0', '0');
INSERT INTO `sx_area` VALUES ('699', '甘井子区', '670', '0,9,670', '0', '699', '699', '0', '0');
INSERT INTO `sx_area` VALUES ('700', '旅顺口区', '670', '0,9,670', '0', '700', '700', '0', '0');
INSERT INTO `sx_area` VALUES ('701', '金州区', '670', '0,9,670', '0', '701', '701', '0', '0');
INSERT INTO `sx_area` VALUES ('702', '开发区', '670', '0,9,670', '0', '702', '702', '0', '0');
INSERT INTO `sx_area` VALUES ('703', '长海县', '670', '0,9,670', '0', '703', '703', '0', '0');
INSERT INTO `sx_area` VALUES ('704', '瓦房店市', '670', '0,9,670', '0', '704', '704', '0', '0');
INSERT INTO `sx_area` VALUES ('705', '普兰店市', '670', '0,9,670', '0', '705', '705', '0', '0');
INSERT INTO `sx_area` VALUES ('706', '庄河市', '670', '0,9,670', '0', '706', '706', '0', '0');
INSERT INTO `sx_area` VALUES ('707', '铁东区', '671', '0,9,671', '0', '707', '707', '0', '0');
INSERT INTO `sx_area` VALUES ('708', '铁西区', '671', '0,9,671', '0', '708', '708', '0', '0');
INSERT INTO `sx_area` VALUES ('709', '立山区', '671', '0,9,671', '0', '709', '709', '0', '0');
INSERT INTO `sx_area` VALUES ('710', '千山区', '671', '0,9,671', '0', '710', '710', '0', '0');
INSERT INTO `sx_area` VALUES ('711', '台安县', '671', '0,9,671', '0', '711', '711', '0', '0');
INSERT INTO `sx_area` VALUES ('712', '岫岩满族自治县', '671', '0,9,671', '0', '712', '712', '0', '0');
INSERT INTO `sx_area` VALUES ('713', '海城市', '671', '0,9,671', '0', '713', '713', '0', '0');
INSERT INTO `sx_area` VALUES ('714', '新抚区', '672', '0,9,672', '0', '714', '714', '0', '0');
INSERT INTO `sx_area` VALUES ('715', '东洲区', '672', '0,9,672', '0', '715', '715', '0', '0');
INSERT INTO `sx_area` VALUES ('716', '望花区', '672', '0,9,672', '0', '716', '716', '0', '0');
INSERT INTO `sx_area` VALUES ('717', '顺城区', '672', '0,9,672', '0', '717', '717', '0', '0');
INSERT INTO `sx_area` VALUES ('718', '抚顺县', '672', '0,9,672', '0', '718', '718', '0', '0');
INSERT INTO `sx_area` VALUES ('719', '新宾满族自治县', '672', '0,9,672', '0', '719', '719', '0', '0');
INSERT INTO `sx_area` VALUES ('720', '清原满族自治县', '672', '0,9,672', '0', '720', '720', '0', '0');
INSERT INTO `sx_area` VALUES ('721', '平山区', '673', '0,9,673', '0', '721', '721', '0', '0');
INSERT INTO `sx_area` VALUES ('722', '溪湖区', '673', '0,9,673', '0', '722', '722', '0', '0');
INSERT INTO `sx_area` VALUES ('723', '明山区', '673', '0,9,673', '0', '723', '723', '0', '0');
INSERT INTO `sx_area` VALUES ('724', '南芬区', '673', '0,9,673', '0', '724', '724', '0', '0');
INSERT INTO `sx_area` VALUES ('725', '本溪满族自治县', '673', '0,9,673', '0', '725', '725', '0', '0');
INSERT INTO `sx_area` VALUES ('726', '桓仁满族自治县', '673', '0,9,673', '0', '726', '726', '0', '0');
INSERT INTO `sx_area` VALUES ('727', '元宝区', '674', '0,9,674', '0', '727', '727', '0', '0');
INSERT INTO `sx_area` VALUES ('728', '振兴区', '674', '0,9,674', '0', '728', '728', '0', '0');
INSERT INTO `sx_area` VALUES ('729', '振安区', '674', '0,9,674', '0', '729', '729', '0', '0');
INSERT INTO `sx_area` VALUES ('730', '宽甸满族自治县', '674', '0,9,674', '0', '730', '730', '0', '0');
INSERT INTO `sx_area` VALUES ('731', '东港市', '674', '0,9,674', '0', '731', '731', '0', '0');
INSERT INTO `sx_area` VALUES ('732', '凤城市', '674', '0,9,674', '0', '732', '732', '0', '0');
INSERT INTO `sx_area` VALUES ('733', '古塔区', '675', '0,9,675', '0', '733', '733', '0', '0');
INSERT INTO `sx_area` VALUES ('734', '凌河区', '675', '0,9,675', '0', '734', '734', '0', '0');
INSERT INTO `sx_area` VALUES ('735', '太和区', '675', '0,9,675', '0', '735', '735', '0', '0');
INSERT INTO `sx_area` VALUES ('736', '黑山县', '675', '0,9,675', '0', '736', '736', '0', '0');
INSERT INTO `sx_area` VALUES ('737', '义县', '675', '0,9,675', '0', '737', '737', '0', '0');
INSERT INTO `sx_area` VALUES ('738', '凌海市', '675', '0,9,675', '0', '738', '738', '0', '0');
INSERT INTO `sx_area` VALUES ('739', '北宁市', '675', '0,9,675', '0', '739', '739', '0', '0');
INSERT INTO `sx_area` VALUES ('740', '站前区', '676', '0,9,676', '0', '740', '740', '0', '0');
INSERT INTO `sx_area` VALUES ('741', '西市区', '676', '0,9,676', '0', '741', '741', '0', '0');
INSERT INTO `sx_area` VALUES ('742', '鲅鱼圈区', '676', '0,9,676', '0', '742', '742', '0', '0');
INSERT INTO `sx_area` VALUES ('743', '老边区', '676', '0,9,676', '0', '743', '743', '0', '0');
INSERT INTO `sx_area` VALUES ('744', '盖州市', '676', '0,9,676', '0', '744', '744', '0', '0');
INSERT INTO `sx_area` VALUES ('745', '大石桥市', '676', '0,9,676', '0', '745', '745', '0', '0');
INSERT INTO `sx_area` VALUES ('746', '海州区', '677', '0,9,677', '0', '746', '746', '0', '0');
INSERT INTO `sx_area` VALUES ('747', '新邱区', '677', '0,9,677', '0', '747', '747', '0', '0');
INSERT INTO `sx_area` VALUES ('748', '太平区', '677', '0,9,677', '0', '748', '748', '0', '0');
INSERT INTO `sx_area` VALUES ('749', '清河门区', '677', '0,9,677', '0', '749', '749', '0', '0');
INSERT INTO `sx_area` VALUES ('750', '细河区', '677', '0,9,677', '0', '750', '750', '0', '0');
INSERT INTO `sx_area` VALUES ('751', '阜新蒙古族自治县', '677', '0,9,677', '0', '751', '751', '0', '0');
INSERT INTO `sx_area` VALUES ('752', '彰武县', '677', '0,9,677', '0', '752', '752', '0', '0');
INSERT INTO `sx_area` VALUES ('753', '白塔区', '678', '0,9,678', '0', '753', '753', '0', '0');
INSERT INTO `sx_area` VALUES ('754', '文圣区', '678', '0,9,678', '0', '754', '754', '0', '0');
INSERT INTO `sx_area` VALUES ('755', '宏伟区', '678', '0,9,678', '0', '755', '755', '0', '0');
INSERT INTO `sx_area` VALUES ('756', '弓长岭区', '678', '0,9,678', '0', '756', '756', '0', '0');
INSERT INTO `sx_area` VALUES ('757', '太子河区', '678', '0,9,678', '0', '757', '757', '0', '0');
INSERT INTO `sx_area` VALUES ('758', '辽阳县', '678', '0,9,678', '0', '758', '758', '0', '0');
INSERT INTO `sx_area` VALUES ('759', '灯塔市', '678', '0,9,678', '0', '759', '759', '0', '0');
INSERT INTO `sx_area` VALUES ('760', '双台子区', '679', '0,9,679', '0', '760', '760', '0', '0');
INSERT INTO `sx_area` VALUES ('761', '兴隆台区', '679', '0,9,679', '0', '761', '761', '0', '0');
INSERT INTO `sx_area` VALUES ('762', '大洼县', '679', '0,9,679', '0', '762', '762', '0', '0');
INSERT INTO `sx_area` VALUES ('763', '盘山县', '679', '0,9,679', '0', '763', '763', '0', '0');
INSERT INTO `sx_area` VALUES ('764', '银州区', '680', '0,9,680', '0', '764', '764', '0', '0');
INSERT INTO `sx_area` VALUES ('765', '清河区', '680', '0,9,680', '0', '765', '765', '0', '0');
INSERT INTO `sx_area` VALUES ('766', '铁岭县', '680', '0,9,680', '0', '766', '766', '0', '0');
INSERT INTO `sx_area` VALUES ('767', '西丰县', '680', '0,9,680', '0', '767', '767', '0', '0');
INSERT INTO `sx_area` VALUES ('768', '昌图县', '680', '0,9,680', '0', '768', '768', '0', '0');
INSERT INTO `sx_area` VALUES ('769', '调兵山市', '680', '0,9,680', '0', '769', '769', '0', '0');
INSERT INTO `sx_area` VALUES ('770', '开原市', '680', '0,9,680', '0', '770', '770', '0', '0');
INSERT INTO `sx_area` VALUES ('771', '双塔区', '681', '0,9,681', '0', '771', '771', '0', '0');
INSERT INTO `sx_area` VALUES ('772', '龙城区', '681', '0,9,681', '0', '772', '772', '0', '0');
INSERT INTO `sx_area` VALUES ('773', '朝阳县', '681', '0,9,681', '0', '773', '773', '0', '0');
INSERT INTO `sx_area` VALUES ('774', '建平县', '681', '0,9,681', '0', '774', '774', '0', '0');
INSERT INTO `sx_area` VALUES ('775', '喀左县', '681', '0,9,681', '0', '775', '775', '0', '0');
INSERT INTO `sx_area` VALUES ('776', '北票市', '681', '0,9,681', '0', '776', '776', '0', '0');
INSERT INTO `sx_area` VALUES ('777', '凌源市', '681', '0,9,681', '0', '777', '777', '0', '0');
INSERT INTO `sx_area` VALUES ('778', '连山区', '682', '0,9,682', '0', '778', '778', '0', '0');
INSERT INTO `sx_area` VALUES ('779', '龙港区', '682', '0,9,682', '0', '779', '779', '0', '0');
INSERT INTO `sx_area` VALUES ('780', '南票区', '682', '0,9,682', '0', '780', '780', '0', '0');
INSERT INTO `sx_area` VALUES ('781', '绥中县', '682', '0,9,682', '0', '781', '781', '0', '0');
INSERT INTO `sx_area` VALUES ('782', '建昌县', '682', '0,9,682', '0', '782', '782', '0', '0');
INSERT INTO `sx_area` VALUES ('783', '兴城市', '682', '0,9,682', '0', '783', '783', '0', '0');
INSERT INTO `sx_area` VALUES ('784', '长春市', '10', '0,10', '1', '784,793,794,795,796,797,798,799,800,801,802', '784', '0', '0');
INSERT INTO `sx_area` VALUES ('785', '吉林市', '10', '0,10', '1', '785,803,804,805,806,807,808,809,810,811', '785', '0', '0');
INSERT INTO `sx_area` VALUES ('786', '四平市', '10', '0,10', '1', '786,812,813,814,815,816,817', '786', '0', '0');
INSERT INTO `sx_area` VALUES ('787', '辽源市', '10', '0,10', '1', '787,818,819,820,821', '787', '0', '0');
INSERT INTO `sx_area` VALUES ('788', '通化市', '10', '0,10', '1', '788,822,823,824,825,826,827,828', '788', '0', '0');
INSERT INTO `sx_area` VALUES ('789', '白山市', '10', '0,10', '1', '789,829,830,831,832,833,834', '789', '0', '0');
INSERT INTO `sx_area` VALUES ('790', '松原市', '10', '0,10', '1', '790,835,836,837,838', '790', '0', '0');
INSERT INTO `sx_area` VALUES ('791', '白城市', '10', '0,10', '1', '791,839,840,841,842,843', '791', '0', '0');
INSERT INTO `sx_area` VALUES ('792', '延边朝鲜族自治州', '10', '0,10', '1', '792,844,845,846,847,848,849,850,851', '792', '0', '0');
INSERT INTO `sx_area` VALUES ('793', '南关区', '784', '0,10,784', '0', '793', '793', '0', '0');
INSERT INTO `sx_area` VALUES ('794', '宽城区', '784', '0,10,784', '0', '794', '794', '0', '0');
INSERT INTO `sx_area` VALUES ('795', '朝阳区', '784', '0,10,784', '0', '795', '795', '0', '0');
INSERT INTO `sx_area` VALUES ('796', '二道区', '784', '0,10,784', '0', '796', '796', '0', '0');
INSERT INTO `sx_area` VALUES ('797', '绿园区', '784', '0,10,784', '0', '797', '797', '0', '0');
INSERT INTO `sx_area` VALUES ('798', '双阳区', '784', '0,10,784', '0', '798', '798', '0', '0');
INSERT INTO `sx_area` VALUES ('799', '农安县', '784', '0,10,784', '0', '799', '799', '0', '0');
INSERT INTO `sx_area` VALUES ('800', '九台市', '784', '0,10,784', '0', '800', '800', '0', '0');
INSERT INTO `sx_area` VALUES ('801', '榆树市', '784', '0,10,784', '0', '801', '801', '0', '0');
INSERT INTO `sx_area` VALUES ('802', '德惠市', '784', '0,10,784', '0', '802', '802', '0', '0');
INSERT INTO `sx_area` VALUES ('803', '昌邑区', '785', '0,10,785', '0', '803', '803', '0', '0');
INSERT INTO `sx_area` VALUES ('804', '龙潭区', '785', '0,10,785', '0', '804', '804', '0', '0');
INSERT INTO `sx_area` VALUES ('805', '船营区', '785', '0,10,785', '0', '805', '805', '0', '0');
INSERT INTO `sx_area` VALUES ('806', '丰满区', '785', '0,10,785', '0', '806', '806', '0', '0');
INSERT INTO `sx_area` VALUES ('807', '永吉县', '785', '0,10,785', '0', '807', '807', '0', '0');
INSERT INTO `sx_area` VALUES ('808', '蛟河市', '785', '0,10,785', '0', '808', '808', '0', '0');
INSERT INTO `sx_area` VALUES ('809', '桦甸市', '785', '0,10,785', '0', '809', '809', '0', '0');
INSERT INTO `sx_area` VALUES ('810', '舒兰市', '785', '0,10,785', '0', '810', '810', '0', '0');
INSERT INTO `sx_area` VALUES ('811', '磐石市', '785', '0,10,785', '0', '811', '811', '0', '0');
INSERT INTO `sx_area` VALUES ('812', '铁西区', '786', '0,10,786', '0', '812', '812', '0', '0');
INSERT INTO `sx_area` VALUES ('813', '铁东区', '786', '0,10,786', '0', '813', '813', '0', '0');
INSERT INTO `sx_area` VALUES ('814', '梨树县', '786', '0,10,786', '0', '814', '814', '0', '0');
INSERT INTO `sx_area` VALUES ('815', '伊通满族自治县', '786', '0,10,786', '0', '815', '815', '0', '0');
INSERT INTO `sx_area` VALUES ('816', '公主岭市', '786', '0,10,786', '0', '816', '816', '0', '0');
INSERT INTO `sx_area` VALUES ('817', '双辽市', '786', '0,10,786', '0', '817', '817', '0', '0');
INSERT INTO `sx_area` VALUES ('818', '龙山区', '787', '0,10,787', '0', '818', '818', '0', '0');
INSERT INTO `sx_area` VALUES ('819', '西安区', '787', '0,10,787', '0', '819', '819', '0', '0');
INSERT INTO `sx_area` VALUES ('820', '东丰县', '787', '0,10,787', '0', '820', '820', '0', '0');
INSERT INTO `sx_area` VALUES ('821', '东辽县', '787', '0,10,787', '0', '821', '821', '0', '0');
INSERT INTO `sx_area` VALUES ('822', '东昌区', '788', '0,10,788', '0', '822', '822', '0', '0');
INSERT INTO `sx_area` VALUES ('823', '二道江区', '788', '0,10,788', '0', '823', '823', '0', '0');
INSERT INTO `sx_area` VALUES ('824', '通化县', '788', '0,10,788', '0', '824', '824', '0', '0');
INSERT INTO `sx_area` VALUES ('825', '辉南县', '788', '0,10,788', '0', '825', '825', '0', '0');
INSERT INTO `sx_area` VALUES ('826', '柳河县', '788', '0,10,788', '0', '826', '826', '0', '0');
INSERT INTO `sx_area` VALUES ('827', '梅河口市', '788', '0,10,788', '0', '827', '827', '0', '0');
INSERT INTO `sx_area` VALUES ('828', '集安市', '788', '0,10,788', '0', '828', '828', '0', '0');
INSERT INTO `sx_area` VALUES ('829', '八道江区', '789', '0,10,789', '0', '829', '829', '0', '0');
INSERT INTO `sx_area` VALUES ('830', '抚松县', '789', '0,10,789', '0', '830', '830', '0', '0');
INSERT INTO `sx_area` VALUES ('831', '靖宇县', '789', '0,10,789', '0', '831', '831', '0', '0');
INSERT INTO `sx_area` VALUES ('832', '长白朝鲜族自治县', '789', '0,10,789', '0', '832', '832', '0', '0');
INSERT INTO `sx_area` VALUES ('833', '江源县', '789', '0,10,789', '0', '833', '833', '0', '0');
INSERT INTO `sx_area` VALUES ('834', '临江市', '789', '0,10,789', '0', '834', '834', '0', '0');
INSERT INTO `sx_area` VALUES ('835', '宁江区', '790', '0,10,790', '0', '835', '835', '0', '0');
INSERT INTO `sx_area` VALUES ('836', '长岭县', '790', '0,10,790', '0', '836', '836', '0', '0');
INSERT INTO `sx_area` VALUES ('837', '乾安县', '790', '0,10,790', '0', '837', '837', '0', '0');
INSERT INTO `sx_area` VALUES ('838', '扶余县', '790', '0,10,790', '0', '838', '838', '0', '0');
INSERT INTO `sx_area` VALUES ('839', '洮北区', '791', '0,10,791', '0', '839', '839', '0', '0');
INSERT INTO `sx_area` VALUES ('840', '镇赉县', '791', '0,10,791', '0', '840', '840', '0', '0');
INSERT INTO `sx_area` VALUES ('841', '通榆县', '791', '0,10,791', '0', '841', '841', '0', '0');
INSERT INTO `sx_area` VALUES ('842', '洮南市', '791', '0,10,791', '0', '842', '842', '0', '0');
INSERT INTO `sx_area` VALUES ('843', '大安市', '791', '0,10,791', '0', '843', '843', '0', '0');
INSERT INTO `sx_area` VALUES ('844', '延吉市', '792', '0,10,792', '0', '844', '844', '0', '0');
INSERT INTO `sx_area` VALUES ('845', '图们市', '792', '0,10,792', '0', '845', '845', '0', '0');
INSERT INTO `sx_area` VALUES ('846', '敦化市', '792', '0,10,792', '0', '846', '846', '0', '0');
INSERT INTO `sx_area` VALUES ('847', '珲春市', '792', '0,10,792', '0', '847', '847', '0', '0');
INSERT INTO `sx_area` VALUES ('848', '龙井市', '792', '0,10,792', '0', '848', '848', '0', '0');
INSERT INTO `sx_area` VALUES ('849', '和龙市', '792', '0,10,792', '0', '849', '849', '0', '0');
INSERT INTO `sx_area` VALUES ('850', '汪清县', '792', '0,10,792', '0', '850', '850', '0', '0');
INSERT INTO `sx_area` VALUES ('851', '安图县', '792', '0,10,792', '0', '851', '851', '0', '0');
INSERT INTO `sx_area` VALUES ('852', '哈尔滨市', '11', '0,11', '1', '852,865,866,867,868,869,870,871,872,873,874,875,876,877,878,879,880,881,882,883', '852', '0', '0');
INSERT INTO `sx_area` VALUES ('853', '齐齐哈尔市', '11', '0,11', '1', '853,884,885,886,887,888,889,890,891,892,893,894,895,896,897,898,899', '853', '0', '0');
INSERT INTO `sx_area` VALUES ('854', '鸡西市', '11', '0,11', '1', '854,900,901,902,903,904,905,906,907,908', '854', '0', '0');
INSERT INTO `sx_area` VALUES ('855', '鹤岗市', '11', '0,11', '1', '855,909,910,911,912,913,914,915,916', '855', '0', '0');
INSERT INTO `sx_area` VALUES ('856', '双鸭山市', '11', '0,11', '1', '856,917,918,919,920,921,922,923,924', '856', '0', '0');
INSERT INTO `sx_area` VALUES ('857', '大庆市', '11', '0,11', '1', '857,925,926,927,928,929,930,931,932,933', '857', '0', '0');
INSERT INTO `sx_area` VALUES ('858', '伊春市', '11', '0,11', '1', '858,934,935,936,937,938,939,940,941,942,943,944,945,946,947,948,949,950', '858', '0', '0');
INSERT INTO `sx_area` VALUES ('859', '佳木斯市', '11', '0,11', '1', '859,951,952,953,954,955,956,957,958,959,960,961', '859', '0', '0');
INSERT INTO `sx_area` VALUES ('860', '七台河市', '11', '0,11', '1', '860,962,963,964,965', '860', '0', '0');
INSERT INTO `sx_area` VALUES ('861', '牡丹江市', '11', '0,11', '1', '861,966,967,968,969,970,971,972,973,974,975', '861', '0', '0');
INSERT INTO `sx_area` VALUES ('862', '黑河市', '11', '0,11', '1', '862,976,977,978,979,980,981', '862', '0', '0');
INSERT INTO `sx_area` VALUES ('863', '绥化市', '11', '0,11', '1', '863,982,983,984,985,986,987,988,989,990,991', '863', '0', '0');
INSERT INTO `sx_area` VALUES ('864', '大兴安岭地区', '11', '0,11', '1', '864,992,993,994', '864', '0', '0');
INSERT INTO `sx_area` VALUES ('865', '道里区', '852', '0,11,852', '0', '865', '865', '0', '0');
INSERT INTO `sx_area` VALUES ('866', '南岗区', '852', '0,11,852', '0', '866', '866', '0', '0');
INSERT INTO `sx_area` VALUES ('867', '道外区', '852', '0,11,852', '0', '867', '867', '0', '0');
INSERT INTO `sx_area` VALUES ('868', '太平区', '852', '0,11,852', '0', '868', '868', '0', '0');
INSERT INTO `sx_area` VALUES ('869', '香坊区', '852', '0,11,852', '0', '869', '869', '0', '0');
INSERT INTO `sx_area` VALUES ('870', '动力区', '852', '0,11,852', '0', '870', '870', '0', '0');
INSERT INTO `sx_area` VALUES ('871', '平房区', '852', '0,11,852', '0', '871', '871', '0', '0');
INSERT INTO `sx_area` VALUES ('872', '呼兰县', '852', '0,11,852', '0', '872', '872', '0', '0');
INSERT INTO `sx_area` VALUES ('873', '依兰县', '852', '0,11,852', '0', '873', '873', '0', '0');
INSERT INTO `sx_area` VALUES ('874', '方正县', '852', '0,11,852', '0', '874', '874', '0', '0');
INSERT INTO `sx_area` VALUES ('875', '宾县', '852', '0,11,852', '0', '875', '875', '0', '0');
INSERT INTO `sx_area` VALUES ('876', '巴彦县', '852', '0,11,852', '0', '876', '876', '0', '0');
INSERT INTO `sx_area` VALUES ('877', '木兰县', '852', '0,11,852', '0', '877', '877', '0', '0');
INSERT INTO `sx_area` VALUES ('878', '通河县', '852', '0,11,852', '0', '878', '878', '0', '0');
INSERT INTO `sx_area` VALUES ('879', '延寿县', '852', '0,11,852', '0', '879', '879', '0', '0');
INSERT INTO `sx_area` VALUES ('880', '阿城市', '852', '0,11,852', '0', '880', '880', '0', '0');
INSERT INTO `sx_area` VALUES ('881', '双城市', '852', '0,11,852', '0', '881', '881', '0', '0');
INSERT INTO `sx_area` VALUES ('882', '尚志市', '852', '0,11,852', '0', '882', '882', '0', '0');
INSERT INTO `sx_area` VALUES ('883', '五常市', '852', '0,11,852', '0', '883', '883', '0', '0');
INSERT INTO `sx_area` VALUES ('884', '龙沙区', '853', '0,11,853', '0', '884', '884', '0', '0');
INSERT INTO `sx_area` VALUES ('885', '建华区', '853', '0,11,853', '0', '885', '885', '0', '0');
INSERT INTO `sx_area` VALUES ('886', '铁锋区', '853', '0,11,853', '0', '886', '886', '0', '0');
INSERT INTO `sx_area` VALUES ('887', '昂昂溪区', '853', '0,11,853', '0', '887', '887', '0', '0');
INSERT INTO `sx_area` VALUES ('888', '富拉尔基区', '853', '0,11,853', '0', '888', '888', '0', '0');
INSERT INTO `sx_area` VALUES ('889', '碾子山区', '853', '0,11,853', '0', '889', '889', '0', '0');
INSERT INTO `sx_area` VALUES ('890', '梅里斯达斡尔族区', '853', '0,11,853', '0', '890', '890', '0', '0');
INSERT INTO `sx_area` VALUES ('891', '龙江县', '853', '0,11,853', '0', '891', '891', '0', '0');
INSERT INTO `sx_area` VALUES ('892', '依安县', '853', '0,11,853', '0', '892', '892', '0', '0');
INSERT INTO `sx_area` VALUES ('893', '泰来县', '853', '0,11,853', '0', '893', '893', '0', '0');
INSERT INTO `sx_area` VALUES ('894', '甘南县', '853', '0,11,853', '0', '894', '894', '0', '0');
INSERT INTO `sx_area` VALUES ('895', '富裕县', '853', '0,11,853', '0', '895', '895', '0', '0');
INSERT INTO `sx_area` VALUES ('896', '克山县', '853', '0,11,853', '0', '896', '896', '0', '0');
INSERT INTO `sx_area` VALUES ('897', '克东县', '853', '0,11,853', '0', '897', '897', '0', '0');
INSERT INTO `sx_area` VALUES ('898', '拜泉县', '853', '0,11,853', '0', '898', '898', '0', '0');
INSERT INTO `sx_area` VALUES ('899', '讷河市', '853', '0,11,853', '0', '899', '899', '0', '0');
INSERT INTO `sx_area` VALUES ('900', '鸡冠区', '854', '0,11,854', '0', '900', '900', '0', '0');
INSERT INTO `sx_area` VALUES ('901', '恒山区', '854', '0,11,854', '0', '901', '901', '0', '0');
INSERT INTO `sx_area` VALUES ('902', '滴道区', '854', '0,11,854', '0', '902', '902', '0', '0');
INSERT INTO `sx_area` VALUES ('903', '梨树区', '854', '0,11,854', '0', '903', '903', '0', '0');
INSERT INTO `sx_area` VALUES ('904', '城子河区', '854', '0,11,854', '0', '904', '904', '0', '0');
INSERT INTO `sx_area` VALUES ('905', '麻山区', '854', '0,11,854', '0', '905', '905', '0', '0');
INSERT INTO `sx_area` VALUES ('906', '鸡东县', '854', '0,11,854', '0', '906', '906', '0', '0');
INSERT INTO `sx_area` VALUES ('907', '虎林市', '854', '0,11,854', '0', '907', '907', '0', '0');
INSERT INTO `sx_area` VALUES ('908', '密山市', '854', '0,11,854', '0', '908', '908', '0', '0');
INSERT INTO `sx_area` VALUES ('909', '向阳区', '855', '0,11,855', '0', '909', '909', '0', '0');
INSERT INTO `sx_area` VALUES ('910', '工农区', '855', '0,11,855', '0', '910', '910', '0', '0');
INSERT INTO `sx_area` VALUES ('911', '南山区', '855', '0,11,855', '0', '911', '911', '0', '0');
INSERT INTO `sx_area` VALUES ('912', '兴安区', '855', '0,11,855', '0', '912', '912', '0', '0');
INSERT INTO `sx_area` VALUES ('913', '东山区', '855', '0,11,855', '0', '913', '913', '0', '0');
INSERT INTO `sx_area` VALUES ('914', '兴山区', '855', '0,11,855', '0', '914', '914', '0', '0');
INSERT INTO `sx_area` VALUES ('915', '萝北县', '855', '0,11,855', '0', '915', '915', '0', '0');
INSERT INTO `sx_area` VALUES ('916', '绥滨县', '855', '0,11,855', '0', '916', '916', '0', '0');
INSERT INTO `sx_area` VALUES ('917', '尖山区', '856', '0,11,856', '0', '917', '917', '0', '0');
INSERT INTO `sx_area` VALUES ('918', '岭东区', '856', '0,11,856', '0', '918', '918', '0', '0');
INSERT INTO `sx_area` VALUES ('919', '四方台区', '856', '0,11,856', '0', '919', '919', '0', '0');
INSERT INTO `sx_area` VALUES ('920', '宝山区', '856', '0,11,856', '0', '920', '920', '0', '0');
INSERT INTO `sx_area` VALUES ('921', '集贤县', '856', '0,11,856', '0', '921', '921', '0', '0');
INSERT INTO `sx_area` VALUES ('922', '友谊县', '856', '0,11,856', '0', '922', '922', '0', '0');
INSERT INTO `sx_area` VALUES ('923', '宝清县', '856', '0,11,856', '0', '923', '923', '0', '0');
INSERT INTO `sx_area` VALUES ('924', '饶河县', '856', '0,11,856', '0', '924', '924', '0', '0');
INSERT INTO `sx_area` VALUES ('925', '萨尔图区', '857', '0,11,857', '0', '925', '925', '0', '0');
INSERT INTO `sx_area` VALUES ('926', '龙凤区', '857', '0,11,857', '0', '926', '926', '0', '0');
INSERT INTO `sx_area` VALUES ('927', '让胡路区', '857', '0,11,857', '0', '927', '927', '0', '0');
INSERT INTO `sx_area` VALUES ('928', '红岗区', '857', '0,11,857', '0', '928', '928', '0', '0');
INSERT INTO `sx_area` VALUES ('929', '大同区', '857', '0,11,857', '0', '929', '929', '0', '0');
INSERT INTO `sx_area` VALUES ('930', '肇州县', '857', '0,11,857', '0', '930', '930', '0', '0');
INSERT INTO `sx_area` VALUES ('931', '肇源县', '857', '0,11,857', '0', '931', '931', '0', '0');
INSERT INTO `sx_area` VALUES ('932', '林甸县', '857', '0,11,857', '0', '932', '932', '0', '0');
INSERT INTO `sx_area` VALUES ('933', '杜尔伯特蒙古族自治县', '857', '0,11,857', '0', '933', '933', '0', '0');
INSERT INTO `sx_area` VALUES ('934', '伊春区', '858', '0,11,858', '0', '934', '934', '0', '0');
INSERT INTO `sx_area` VALUES ('935', '南岔区', '858', '0,11,858', '0', '935', '935', '0', '0');
INSERT INTO `sx_area` VALUES ('936', '友好区', '858', '0,11,858', '0', '936', '936', '0', '0');
INSERT INTO `sx_area` VALUES ('937', '西林区', '858', '0,11,858', '0', '937', '937', '0', '0');
INSERT INTO `sx_area` VALUES ('938', '翠峦区', '858', '0,11,858', '0', '938', '938', '0', '0');
INSERT INTO `sx_area` VALUES ('939', '新青区', '858', '0,11,858', '0', '939', '939', '0', '0');
INSERT INTO `sx_area` VALUES ('940', '美溪区', '858', '0,11,858', '0', '940', '940', '0', '0');
INSERT INTO `sx_area` VALUES ('941', '金山屯区', '858', '0,11,858', '0', '941', '941', '0', '0');
INSERT INTO `sx_area` VALUES ('942', '五营区', '858', '0,11,858', '0', '942', '942', '0', '0');
INSERT INTO `sx_area` VALUES ('943', '乌马河区', '858', '0,11,858', '0', '943', '943', '0', '0');
INSERT INTO `sx_area` VALUES ('944', '汤旺河区', '858', '0,11,858', '0', '944', '944', '0', '0');
INSERT INTO `sx_area` VALUES ('945', '带岭区', '858', '0,11,858', '0', '945', '945', '0', '0');
INSERT INTO `sx_area` VALUES ('946', '乌伊岭区', '858', '0,11,858', '0', '946', '946', '0', '0');
INSERT INTO `sx_area` VALUES ('947', '红星区', '858', '0,11,858', '0', '947', '947', '0', '0');
INSERT INTO `sx_area` VALUES ('948', '上甘岭区', '858', '0,11,858', '0', '948', '948', '0', '0');
INSERT INTO `sx_area` VALUES ('949', '嘉荫县', '858', '0,11,858', '0', '949', '949', '0', '0');
INSERT INTO `sx_area` VALUES ('950', '铁力市', '858', '0,11,858', '0', '950', '950', '0', '0');
INSERT INTO `sx_area` VALUES ('951', '永红区', '859', '0,11,859', '0', '951', '951', '0', '0');
INSERT INTO `sx_area` VALUES ('952', '向阳区', '859', '0,11,859', '0', '952', '952', '0', '0');
INSERT INTO `sx_area` VALUES ('953', '前进区', '859', '0,11,859', '0', '953', '953', '0', '0');
INSERT INTO `sx_area` VALUES ('954', '东风区', '859', '0,11,859', '0', '954', '954', '0', '0');
INSERT INTO `sx_area` VALUES ('955', '郊区', '859', '0,11,859', '0', '955', '955', '0', '0');
INSERT INTO `sx_area` VALUES ('956', '桦南县', '859', '0,11,859', '0', '956', '956', '0', '0');
INSERT INTO `sx_area` VALUES ('957', '桦川县', '859', '0,11,859', '0', '957', '957', '0', '0');
INSERT INTO `sx_area` VALUES ('958', '汤原县', '859', '0,11,859', '0', '958', '958', '0', '0');
INSERT INTO `sx_area` VALUES ('959', '抚远县', '859', '0,11,859', '0', '959', '959', '0', '0');
INSERT INTO `sx_area` VALUES ('960', '同江市', '859', '0,11,859', '0', '960', '960', '0', '0');
INSERT INTO `sx_area` VALUES ('961', '富锦市', '859', '0,11,859', '0', '961', '961', '0', '0');
INSERT INTO `sx_area` VALUES ('962', '新兴区', '860', '0,11,860', '0', '962', '962', '0', '0');
INSERT INTO `sx_area` VALUES ('963', '桃山区', '860', '0,11,860', '0', '963', '963', '0', '0');
INSERT INTO `sx_area` VALUES ('964', '茄子河区', '860', '0,11,860', '0', '964', '964', '0', '0');
INSERT INTO `sx_area` VALUES ('965', '勃利县', '860', '0,11,860', '0', '965', '965', '0', '0');
INSERT INTO `sx_area` VALUES ('966', '东安区', '861', '0,11,861', '0', '966', '966', '0', '0');
INSERT INTO `sx_area` VALUES ('967', '阳明区', '861', '0,11,861', '0', '967', '967', '0', '0');
INSERT INTO `sx_area` VALUES ('968', '爱民区', '861', '0,11,861', '0', '968', '968', '0', '0');
INSERT INTO `sx_area` VALUES ('969', '西安区', '861', '0,11,861', '0', '969', '969', '0', '0');
INSERT INTO `sx_area` VALUES ('970', '东宁县', '861', '0,11,861', '0', '970', '970', '0', '0');
INSERT INTO `sx_area` VALUES ('971', '林口县', '861', '0,11,861', '0', '971', '971', '0', '0');
INSERT INTO `sx_area` VALUES ('972', '绥芬河市', '861', '0,11,861', '0', '972', '972', '0', '0');
INSERT INTO `sx_area` VALUES ('973', '海林市', '861', '0,11,861', '0', '973', '973', '0', '0');
INSERT INTO `sx_area` VALUES ('974', '宁安市', '861', '0,11,861', '0', '974', '974', '0', '0');
INSERT INTO `sx_area` VALUES ('975', '穆棱市', '861', '0,11,861', '0', '975', '975', '0', '0');
INSERT INTO `sx_area` VALUES ('976', '爱辉区', '862', '0,11,862', '0', '976', '976', '0', '0');
INSERT INTO `sx_area` VALUES ('977', '嫩江县', '862', '0,11,862', '0', '977', '977', '0', '0');
INSERT INTO `sx_area` VALUES ('978', '逊克县', '862', '0,11,862', '0', '978', '978', '0', '0');
INSERT INTO `sx_area` VALUES ('979', '孙吴县', '862', '0,11,862', '0', '979', '979', '0', '0');
INSERT INTO `sx_area` VALUES ('980', '北安市', '862', '0,11,862', '0', '980', '980', '0', '0');
INSERT INTO `sx_area` VALUES ('981', '五大连池市', '862', '0,11,862', '0', '981', '981', '0', '0');
INSERT INTO `sx_area` VALUES ('982', '北林区', '863', '0,11,863', '0', '982', '982', '0', '0');
INSERT INTO `sx_area` VALUES ('983', '望奎县', '863', '0,11,863', '0', '983', '983', '0', '0');
INSERT INTO `sx_area` VALUES ('984', '兰西县', '863', '0,11,863', '0', '984', '984', '0', '0');
INSERT INTO `sx_area` VALUES ('985', '青冈县', '863', '0,11,863', '0', '985', '985', '0', '0');
INSERT INTO `sx_area` VALUES ('986', '庆安县', '863', '0,11,863', '0', '986', '986', '0', '0');
INSERT INTO `sx_area` VALUES ('987', '明水县', '863', '0,11,863', '0', '987', '987', '0', '0');
INSERT INTO `sx_area` VALUES ('988', '绥棱县', '863', '0,11,863', '0', '988', '988', '0', '0');
INSERT INTO `sx_area` VALUES ('989', '安达市', '863', '0,11,863', '0', '989', '989', '0', '0');
INSERT INTO `sx_area` VALUES ('990', '肇东市', '863', '0,11,863', '0', '990', '990', '0', '0');
INSERT INTO `sx_area` VALUES ('991', '海伦市', '863', '0,11,863', '0', '991', '991', '0', '0');
INSERT INTO `sx_area` VALUES ('992', '呼玛县', '864', '0,11,864', '0', '992', '992', '0', '0');
INSERT INTO `sx_area` VALUES ('993', '塔河县', '864', '0,11,864', '0', '993', '993', '0', '0');
INSERT INTO `sx_area` VALUES ('994', '漠河县', '864', '0,11,864', '0', '994', '994', '0', '0');
INSERT INTO `sx_area` VALUES ('995', '南京市', '12', '0,12', '1', '995,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020', '995', '0', '0');
INSERT INTO `sx_area` VALUES ('996', '无锡市', '12', '0,12', '1', '996,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030', '996', '0', '0');
INSERT INTO `sx_area` VALUES ('997', '徐州市', '12', '0,12', '1', '997,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041', '997', '0', '0');
INSERT INTO `sx_area` VALUES ('998', '常州市', '12', '0,12', '1', '998,1042,1043,1044,1045,1046,1047,1048', '998', '0', '0');
INSERT INTO `sx_area` VALUES ('999', '苏州市', '12', '0,12', '1', '999,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061', '999', '0', '0');
INSERT INTO `sx_area` VALUES ('1000', '南通市', '12', '0,12', '1', '1000,1062,1063,1064,1065,1066,1067,1068,1069', '1000', '0', '0');
INSERT INTO `sx_area` VALUES ('1001', '连云港市', '12', '0,12', '1', '1001,1070,1071,1072,1073,1074,1075,1076', '1001', '0', '0');
INSERT INTO `sx_area` VALUES ('1002', '淮安市', '12', '0,12', '1', '1002,1077,1078,1079,1080,1081,1082,1083,1084', '1002', '0', '0');
INSERT INTO `sx_area` VALUES ('1003', '盐城市', '12', '0,12', '1', '1003,1085,1086,1087,1088,1089,1090,1091,1092,1093', '1003', '0', '0');
INSERT INTO `sx_area` VALUES ('1004', '扬州市', '12', '0,12', '1', '1004,1094,1095,1096,1097,1098,1099,1100', '1004', '0', '0');
INSERT INTO `sx_area` VALUES ('1005', '镇江市', '12', '0,12', '1', '1005,1101,1102,1103,1104,1105,1106', '1005', '0', '0');
INSERT INTO `sx_area` VALUES ('1006', '泰州市', '12', '0,12', '1', '1006,1107,1108,1109,1110,1111,1112', '1006', '0', '0');
INSERT INTO `sx_area` VALUES ('1007', '宿迁市', '12', '0,12', '1', '1007,1113,1114,1115,1116,1117', '1007', '0', '0');
INSERT INTO `sx_area` VALUES ('1008', '玄武区', '995', '0,12,995', '0', '1008', '1008', '0', '0');
INSERT INTO `sx_area` VALUES ('1009', '白下区', '995', '0,12,995', '0', '1009', '1009', '0', '0');
INSERT INTO `sx_area` VALUES ('1010', '秦淮区', '995', '0,12,995', '0', '1010', '1010', '0', '0');
INSERT INTO `sx_area` VALUES ('1011', '建邺区', '995', '0,12,995', '0', '1011', '1011', '0', '0');
INSERT INTO `sx_area` VALUES ('1012', '鼓楼区', '995', '0,12,995', '0', '1012', '1012', '0', '0');
INSERT INTO `sx_area` VALUES ('1013', '下关区', '995', '0,12,995', '0', '1013', '1013', '0', '0');
INSERT INTO `sx_area` VALUES ('1014', '浦口区', '995', '0,12,995', '0', '1014', '1014', '0', '0');
INSERT INTO `sx_area` VALUES ('1015', '栖霞区', '995', '0,12,995', '0', '1015', '1015', '0', '0');
INSERT INTO `sx_area` VALUES ('1016', '雨花台区', '995', '0,12,995', '0', '1016', '1016', '0', '0');
INSERT INTO `sx_area` VALUES ('1017', '江宁区', '995', '0,12,995', '0', '1017', '1017', '0', '0');
INSERT INTO `sx_area` VALUES ('1018', '六合区', '995', '0,12,995', '0', '1018', '1018', '0', '0');
INSERT INTO `sx_area` VALUES ('1019', '溧水县', '995', '0,12,995', '0', '1019', '1019', '0', '0');
INSERT INTO `sx_area` VALUES ('1020', '高淳县', '995', '0,12,995', '0', '1020', '1020', '0', '0');
INSERT INTO `sx_area` VALUES ('1021', '崇安区', '996', '0,12,996', '0', '1021', '1021', '0', '0');
INSERT INTO `sx_area` VALUES ('1022', '南长区', '996', '0,12,996', '0', '1022', '1022', '0', '0');
INSERT INTO `sx_area` VALUES ('1023', '北塘区', '996', '0,12,996', '0', '1023', '1023', '0', '0');
INSERT INTO `sx_area` VALUES ('1024', '锡山区', '996', '0,12,996', '0', '1024', '1024', '0', '0');
INSERT INTO `sx_area` VALUES ('1025', '惠山区', '996', '0,12,996', '0', '1025', '1025', '0', '0');
INSERT INTO `sx_area` VALUES ('1026', '非经营场所区', '996', '0,12,996', '0', '1026', '1026', '0', '0');
INSERT INTO `sx_area` VALUES ('1027', '滨湖区', '996', '0,12,996', '0', '1027', '1027', '0', '0');
INSERT INTO `sx_area` VALUES ('1028', '新区', '996', '0,12,996', '0', '1028', '1028', '0', '0');
INSERT INTO `sx_area` VALUES ('1029', '江阴市', '996', '0,12,996', '0', '1029', '1029', '0', '0');
INSERT INTO `sx_area` VALUES ('1030', '宜兴市', '996', '0,12,996', '0', '1030', '1030', '0', '0');
INSERT INTO `sx_area` VALUES ('1031', '鼓楼区', '997', '0,12,997', '0', '1031', '1031', '0', '0');
INSERT INTO `sx_area` VALUES ('1032', '云龙区', '997', '0,12,997', '0', '1032', '1032', '0', '0');
INSERT INTO `sx_area` VALUES ('1033', '九里区', '997', '0,12,997', '0', '1033', '1033', '0', '0');
INSERT INTO `sx_area` VALUES ('1034', '贾汪区', '997', '0,12,997', '0', '1034', '1034', '0', '0');
INSERT INTO `sx_area` VALUES ('1035', '泉山区', '997', '0,12,997', '0', '1035', '1035', '0', '0');
INSERT INTO `sx_area` VALUES ('1036', '丰县', '997', '0,12,997', '0', '1036', '1036', '0', '0');
INSERT INTO `sx_area` VALUES ('1037', '沛县', '997', '0,12,997', '0', '1037', '1037', '0', '0');
INSERT INTO `sx_area` VALUES ('1038', '铜山县', '997', '0,12,997', '0', '1038', '1038', '0', '0');
INSERT INTO `sx_area` VALUES ('1039', '睢宁县', '997', '0,12,997', '0', '1039', '1039', '0', '0');
INSERT INTO `sx_area` VALUES ('1040', '新沂市', '997', '0,12,997', '0', '1040', '1040', '0', '0');
INSERT INTO `sx_area` VALUES ('1041', '邳州市', '997', '0,12,997', '0', '1041', '1041', '0', '0');
INSERT INTO `sx_area` VALUES ('1042', '天宁区', '998', '0,12,998', '0', '1042', '1042', '0', '0');
INSERT INTO `sx_area` VALUES ('1043', '钟楼区', '998', '0,12,998', '0', '1043', '1043', '0', '0');
INSERT INTO `sx_area` VALUES ('1044', '戚墅堰区', '998', '0,12,998', '0', '1044', '1044', '0', '0');
INSERT INTO `sx_area` VALUES ('1045', '新北区', '998', '0,12,998', '0', '1045', '1045', '0', '0');
INSERT INTO `sx_area` VALUES ('1046', '武进区', '998', '0,12,998', '0', '1046', '1046', '0', '0');
INSERT INTO `sx_area` VALUES ('1047', '溧阳市', '998', '0,12,998', '0', '1047', '1047', '0', '0');
INSERT INTO `sx_area` VALUES ('1048', '金坛市', '998', '0,12,998', '0', '1048', '1048', '0', '0');
INSERT INTO `sx_area` VALUES ('1049', '沧浪区', '999', '0,12,999', '0', '1049', '1049', '0', '0');
INSERT INTO `sx_area` VALUES ('1050', '平江区', '999', '0,12,999', '0', '1050', '1050', '0', '0');
INSERT INTO `sx_area` VALUES ('1051', '金阊区', '999', '0,12,999', '0', '1051', '1051', '0', '0');
INSERT INTO `sx_area` VALUES ('1052', '虎丘区', '999', '0,12,999', '0', '1052', '1052', '0', '0');
INSERT INTO `sx_area` VALUES ('1053', '吴中区', '999', '0,12,999', '0', '1053', '1053', '0', '0');
INSERT INTO `sx_area` VALUES ('1054', '相城区', '999', '0,12,999', '0', '1054', '1054', '0', '0');
INSERT INTO `sx_area` VALUES ('1055', '常熟市', '999', '0,12,999', '0', '1055', '1055', '0', '0');
INSERT INTO `sx_area` VALUES ('1056', '张家港市', '999', '0,12,999', '0', '1056', '1056', '0', '0');
INSERT INTO `sx_area` VALUES ('1057', '昆山市', '999', '0,12,999', '0', '1057', '1057', '0', '0');
INSERT INTO `sx_area` VALUES ('1058', '吴江市', '999', '0,12,999', '0', '1058', '1058', '0', '0');
INSERT INTO `sx_area` VALUES ('1059', '太仓市', '999', '0,12,999', '0', '1059', '1059', '0', '0');
INSERT INTO `sx_area` VALUES ('1060', '工业园区', '999', '0,12,999', '0', '1060', '1060', '0', '0');
INSERT INTO `sx_area` VALUES ('1061', '度假区', '999', '0,12,999', '0', '1061', '1061', '0', '0');
INSERT INTO `sx_area` VALUES ('1062', '崇川区', '1000', '0,12,1000', '0', '1062', '1062', '0', '0');
INSERT INTO `sx_area` VALUES ('1063', '港闸区', '1000', '0,12,1000', '0', '1063', '1063', '0', '0');
INSERT INTO `sx_area` VALUES ('1064', '海安县', '1000', '0,12,1000', '0', '1064', '1064', '0', '0');
INSERT INTO `sx_area` VALUES ('1065', '如东县', '1000', '0,12,1000', '0', '1065', '1065', '0', '0');
INSERT INTO `sx_area` VALUES ('1066', '启东市', '1000', '0,12,1000', '0', '1066', '1066', '0', '0');
INSERT INTO `sx_area` VALUES ('1067', '如皋市', '1000', '0,12,1000', '0', '1067', '1067', '0', '0');
INSERT INTO `sx_area` VALUES ('1068', '通州市', '1000', '0,12,1000', '0', '1068', '1068', '0', '0');
INSERT INTO `sx_area` VALUES ('1069', '海门市', '1000', '0,12,1000', '0', '1069', '1069', '0', '0');
INSERT INTO `sx_area` VALUES ('1070', '连云区', '1001', '0,12,1001', '0', '1070', '1070', '0', '0');
INSERT INTO `sx_area` VALUES ('1071', '新浦区', '1001', '0,12,1001', '0', '1071', '1071', '0', '0');
INSERT INTO `sx_area` VALUES ('1072', '海州区', '1001', '0,12,1001', '0', '1072', '1072', '0', '0');
INSERT INTO `sx_area` VALUES ('1073', '赣榆县', '1001', '0,12,1001', '0', '1073', '1073', '0', '0');
INSERT INTO `sx_area` VALUES ('1074', '东海县', '1001', '0,12,1001', '0', '1074', '1074', '0', '0');
INSERT INTO `sx_area` VALUES ('1075', '灌云县', '1001', '0,12,1001', '0', '1075', '1075', '0', '0');
INSERT INTO `sx_area` VALUES ('1076', '灌南县', '1001', '0,12,1001', '0', '1076', '1076', '0', '0');
INSERT INTO `sx_area` VALUES ('1077', '清河区', '1002', '0,12,1002', '0', '1077', '1077', '0', '0');
INSERT INTO `sx_area` VALUES ('1078', '楚州区', '1002', '0,12,1002', '0', '1078', '1078', '0', '0');
INSERT INTO `sx_area` VALUES ('1079', '淮阴区', '1002', '0,12,1002', '0', '1079', '1079', '0', '0');
INSERT INTO `sx_area` VALUES ('1080', '清浦区', '1002', '0,12,1002', '0', '1080', '1080', '0', '0');
INSERT INTO `sx_area` VALUES ('1081', '涟水县', '1002', '0,12,1002', '0', '1081', '1081', '0', '0');
INSERT INTO `sx_area` VALUES ('1082', '洪泽县', '1002', '0,12,1002', '0', '1082', '1082', '0', '0');
INSERT INTO `sx_area` VALUES ('1083', '盱眙县', '1002', '0,12,1002', '0', '1083', '1083', '0', '0');
INSERT INTO `sx_area` VALUES ('1084', '金湖县', '1002', '0,12,1002', '0', '1084', '1084', '0', '0');
INSERT INTO `sx_area` VALUES ('1085', '城区', '1003', '0,12,1003', '0', '1085', '1085', '0', '0');
INSERT INTO `sx_area` VALUES ('1086', '响水县', '1003', '0,12,1003', '0', '1086', '1086', '0', '0');
INSERT INTO `sx_area` VALUES ('1087', '滨海县', '1003', '0,12,1003', '0', '1087', '1087', '0', '0');
INSERT INTO `sx_area` VALUES ('1088', '阜宁县', '1003', '0,12,1003', '0', '1088', '1088', '0', '0');
INSERT INTO `sx_area` VALUES ('1089', '射阳县', '1003', '0,12,1003', '0', '1089', '1089', '0', '0');
INSERT INTO `sx_area` VALUES ('1090', '建湖县', '1003', '0,12,1003', '0', '1090', '1090', '0', '0');
INSERT INTO `sx_area` VALUES ('1091', '盐都县', '1003', '0,12,1003', '0', '1091', '1091', '0', '0');
INSERT INTO `sx_area` VALUES ('1092', '东台市', '1003', '0,12,1003', '0', '1092', '1092', '0', '0');
INSERT INTO `sx_area` VALUES ('1093', '大丰市', '1003', '0,12,1003', '0', '1093', '1093', '0', '0');
INSERT INTO `sx_area` VALUES ('1094', '广陵区', '1004', '0,12,1004', '0', '1094', '1094', '0', '0');
INSERT INTO `sx_area` VALUES ('1095', '邗江区', '1004', '0,12,1004', '0', '1095', '1095', '0', '0');
INSERT INTO `sx_area` VALUES ('1096', '郊区', '1004', '0,12,1004', '0', '1096', '1096', '0', '0');
INSERT INTO `sx_area` VALUES ('1097', '宝应县', '1004', '0,12,1004', '0', '1097', '1097', '0', '0');
INSERT INTO `sx_area` VALUES ('1098', '仪征市', '1004', '0,12,1004', '0', '1098', '1098', '0', '0');
INSERT INTO `sx_area` VALUES ('1099', '高邮市', '1004', '0,12,1004', '0', '1099', '1099', '0', '0');
INSERT INTO `sx_area` VALUES ('1100', '江都市', '1004', '0,12,1004', '0', '1100', '1100', '0', '0');
INSERT INTO `sx_area` VALUES ('1101', '京口区', '1005', '0,12,1005', '0', '1101', '1101', '0', '0');
INSERT INTO `sx_area` VALUES ('1102', '润州区', '1005', '0,12,1005', '0', '1102', '1102', '0', '0');
INSERT INTO `sx_area` VALUES ('1103', '丹徒区', '1005', '0,12,1005', '0', '1103', '1103', '0', '0');
INSERT INTO `sx_area` VALUES ('1104', '丹阳市', '1005', '0,12,1005', '0', '1104', '1104', '0', '0');
INSERT INTO `sx_area` VALUES ('1105', '扬中市', '1005', '0,12,1005', '0', '1105', '1105', '0', '0');
INSERT INTO `sx_area` VALUES ('1106', '句容市', '1005', '0,12,1005', '0', '1106', '1106', '0', '0');
INSERT INTO `sx_area` VALUES ('1107', '海陵区', '1006', '0,12,1006', '0', '1107', '1107', '0', '0');
INSERT INTO `sx_area` VALUES ('1108', '高港区', '1006', '0,12,1006', '0', '1108', '1108', '0', '0');
INSERT INTO `sx_area` VALUES ('1109', '兴化市', '1006', '0,12,1006', '0', '1109', '1109', '0', '0');
INSERT INTO `sx_area` VALUES ('1110', '靖江市', '1006', '0,12,1006', '0', '1110', '1110', '0', '0');
INSERT INTO `sx_area` VALUES ('1111', '泰兴市', '1006', '0,12,1006', '0', '1111', '1111', '0', '0');
INSERT INTO `sx_area` VALUES ('1112', '姜堰市', '1006', '0,12,1006', '0', '1112', '1112', '0', '0');
INSERT INTO `sx_area` VALUES ('1113', '宿城区', '1007', '0,12,1007', '0', '1113', '1113', '0', '0');
INSERT INTO `sx_area` VALUES ('1114', '宿豫县', '1007', '0,12,1007', '0', '1114', '1114', '0', '0');
INSERT INTO `sx_area` VALUES ('1115', '沭阳县', '1007', '0,12,1007', '0', '1115', '1115', '0', '0');
INSERT INTO `sx_area` VALUES ('1116', '泗阳县', '1007', '0,12,1007', '0', '1116', '1116', '0', '0');
INSERT INTO `sx_area` VALUES ('1117', '泗洪县', '1007', '0,12,1007', '0', '1117', '1117', '0', '0');
INSERT INTO `sx_area` VALUES ('1118', '合肥市', '13', '0,13', '1', '1118,1135,1136,1137,1138,1139,1140,1141,1142,1143,1144,1145', '1118', '0', '0');
INSERT INTO `sx_area` VALUES ('1119', '芜湖市', '13', '0,13', '1', '1119,1146,1147,1148,1149,1150,1151,1152', '1119', '0', '0');
INSERT INTO `sx_area` VALUES ('1120', '蚌埠市', '13', '0,13', '1', '1120,1153,1154,1155,1156,1157,1158,1159', '1120', '0', '0');
INSERT INTO `sx_area` VALUES ('1121', '淮南市', '13', '0,13', '1', '1121,1160,1161,1162,1163,1164,1165', '1121', '0', '0');
INSERT INTO `sx_area` VALUES ('1122', '马鞍山市', '13', '0,13', '1', '1122,1166,1167,1168,1169', '1122', '0', '0');
INSERT INTO `sx_area` VALUES ('1123', '淮北市', '13', '0,13', '1', '1123,1170,1171,1172,1173', '1123', '0', '0');
INSERT INTO `sx_area` VALUES ('1124', '铜陵市', '13', '0,13', '1', '1124,1174,1175,1176,1177', '1124', '0', '0');
INSERT INTO `sx_area` VALUES ('1125', '安庆市', '13', '0,13', '1', '1125,1178,1179,1180,1181,1182,1183,1184,1185,1186,1187,1188', '1125', '0', '0');
INSERT INTO `sx_area` VALUES ('1126', '黄山市', '13', '0,13', '1', '1126,1189,1190,1191,1192,1193,1194,1195', '1126', '0', '0');
INSERT INTO `sx_area` VALUES ('1127', '滁州市', '13', '0,13', '1', '1127,1196,1197,1198,1199,1200,1201,1202,1203', '1127', '0', '0');
INSERT INTO `sx_area` VALUES ('1128', '阜阳市', '13', '0,13', '1', '1128,1204,1205,1206,1207,1208,1209,1210,1211', '1128', '0', '0');
INSERT INTO `sx_area` VALUES ('1129', '宿州市', '13', '0,13', '1', '1129,1212,1213,1214,1215,1216', '1129', '0', '0');
INSERT INTO `sx_area` VALUES ('1130', '巢湖市', '13', '0,13', '1', '1130,1217,1218,1219,1220,1221', '1130', '0', '0');
INSERT INTO `sx_area` VALUES ('1131', '六安市', '13', '0,13', '1', '1131,1222,1223,1224,1225,1226,1227,1228', '1131', '0', '0');
INSERT INTO `sx_area` VALUES ('1132', '亳州市', '13', '0,13', '1', '1132,1229,1230,1231', '1132', '0', '0');
INSERT INTO `sx_area` VALUES ('1133', '池州市', '13', '0,13', '1', '1133,1232,1233,1234,1235', '1133', '0', '0');
INSERT INTO `sx_area` VALUES ('1134', '宣城市', '13', '0,13', '1', '1134,1236,1237,1238,1239,1240,1241,1242', '1134', '0', '0');
INSERT INTO `sx_area` VALUES ('1135', '瑶海区', '1118', '0,13,1118', '0', '1135', '1135', '0', '0');
INSERT INTO `sx_area` VALUES ('1136', '庐阳区', '1118', '0,13,1118', '0', '1136', '1136', '0', '0');
INSERT INTO `sx_area` VALUES ('1137', '蜀山区', '1118', '0,13,1118', '0', '1137', '1137', '0', '0');
INSERT INTO `sx_area` VALUES ('1138', '高新区', '1118', '0,13,1118', '0', '1138', '1138', '0', '0');
INSERT INTO `sx_area` VALUES ('1139', '合肥经济技术开发区', '1118', '0,13,1118', '0', '1139', '1139', '0', '0');
INSERT INTO `sx_area` VALUES ('1140', '新站区', '1118', '0,13,1118', '0', '1140', '1140', '0', '0');
INSERT INTO `sx_area` VALUES ('1141', '政务区', '1118', '0,13,1118', '0', '1141', '1141', '0', '0');
INSERT INTO `sx_area` VALUES ('1142', '包河区', '1118', '0,13,1118', '0', '1142', '1142', '0', '0');
INSERT INTO `sx_area` VALUES ('1143', '长丰县', '1118', '0,13,1118', '0', '1143', '1143', '0', '0');
INSERT INTO `sx_area` VALUES ('1144', '肥东县', '1118', '0,13,1118', '0', '1144', '1144', '0', '0');
INSERT INTO `sx_area` VALUES ('1145', '肥西县', '1118', '0,13,1118', '0', '1145', '1145', '0', '0');
INSERT INTO `sx_area` VALUES ('1146', '镜湖区', '1119', '0,13,1119', '0', '1146', '1146', '0', '0');
INSERT INTO `sx_area` VALUES ('1147', '马塘区', '1119', '0,13,1119', '0', '1147', '1147', '0', '0');
INSERT INTO `sx_area` VALUES ('1148', '新芜区', '1119', '0,13,1119', '0', '1148', '1148', '0', '0');
INSERT INTO `sx_area` VALUES ('1149', '鸠江区', '1119', '0,13,1119', '0', '1149', '1149', '0', '0');
INSERT INTO `sx_area` VALUES ('1150', '芜湖县', '1119', '0,13,1119', '0', '1150', '1150', '0', '0');
INSERT INTO `sx_area` VALUES ('1151', '繁昌县', '1119', '0,13,1119', '0', '1151', '1151', '0', '0');
INSERT INTO `sx_area` VALUES ('1152', '南陵县', '1119', '0,13,1119', '0', '1152', '1152', '0', '0');
INSERT INTO `sx_area` VALUES ('1153', '东市区', '1120', '0,13,1120', '0', '1153', '1153', '0', '0');
INSERT INTO `sx_area` VALUES ('1154', '中市区', '1120', '0,13,1120', '0', '1154', '1154', '0', '0');
INSERT INTO `sx_area` VALUES ('1155', '西市区', '1120', '0,13,1120', '0', '1155', '1155', '0', '0');
INSERT INTO `sx_area` VALUES ('1156', '郊区', '1120', '0,13,1120', '0', '1156', '1156', '0', '0');
INSERT INTO `sx_area` VALUES ('1157', '怀远县', '1120', '0,13,1120', '0', '1157', '1157', '0', '0');
INSERT INTO `sx_area` VALUES ('1158', '五河县', '1120', '0,13,1120', '0', '1158', '1158', '0', '0');
INSERT INTO `sx_area` VALUES ('1159', '固镇县', '1120', '0,13,1120', '0', '1159', '1159', '0', '0');
INSERT INTO `sx_area` VALUES ('1160', '大通区', '1121', '0,13,1121', '0', '1160', '1160', '0', '0');
INSERT INTO `sx_area` VALUES ('1161', '田家庵区', '1121', '0,13,1121', '0', '1161', '1161', '0', '0');
INSERT INTO `sx_area` VALUES ('1162', '谢家集区', '1121', '0,13,1121', '0', '1162', '1162', '0', '0');
INSERT INTO `sx_area` VALUES ('1163', '八公山区', '1121', '0,13,1121', '0', '1163', '1163', '0', '0');
INSERT INTO `sx_area` VALUES ('1164', '潘集区', '1121', '0,13,1121', '0', '1164', '1164', '0', '0');
INSERT INTO `sx_area` VALUES ('1165', '凤台县', '1121', '0,13,1121', '0', '1165', '1165', '0', '0');
INSERT INTO `sx_area` VALUES ('1166', '金家庄区', '1122', '0,13,1122', '0', '1166', '1166', '0', '0');
INSERT INTO `sx_area` VALUES ('1167', '花山区', '1122', '0,13,1122', '0', '1167', '1167', '0', '0');
INSERT INTO `sx_area` VALUES ('1168', '雨山区', '1122', '0,13,1122', '0', '1168', '1168', '0', '0');
INSERT INTO `sx_area` VALUES ('1169', '当涂县', '1122', '0,13,1122', '0', '1169', '1169', '0', '0');
INSERT INTO `sx_area` VALUES ('1170', '杜集区', '1123', '0,13,1123', '0', '1170', '1170', '0', '0');
INSERT INTO `sx_area` VALUES ('1171', '相山区', '1123', '0,13,1123', '0', '1171', '1171', '0', '0');
INSERT INTO `sx_area` VALUES ('1172', '烈山区', '1123', '0,13,1123', '0', '1172', '1172', '0', '0');
INSERT INTO `sx_area` VALUES ('1173', '濉溪县', '1123', '0,13,1123', '0', '1173', '1173', '0', '0');
INSERT INTO `sx_area` VALUES ('1174', '铜官山区', '1124', '0,13,1124', '0', '1174', '1174', '0', '0');
INSERT INTO `sx_area` VALUES ('1175', '狮子山区', '1124', '0,13,1124', '0', '1175', '1175', '0', '0');
INSERT INTO `sx_area` VALUES ('1176', '郊区', '1124', '0,13,1124', '0', '1176', '1176', '0', '0');
INSERT INTO `sx_area` VALUES ('1177', '铜陵县', '1124', '0,13,1124', '0', '1177', '1177', '0', '0');
INSERT INTO `sx_area` VALUES ('1178', '迎江区', '1125', '0,13,1125', '0', '1178', '1178', '0', '0');
INSERT INTO `sx_area` VALUES ('1179', '大观区', '1125', '0,13,1125', '0', '1179', '1179', '0', '0');
INSERT INTO `sx_area` VALUES ('1180', '郊区', '1125', '0,13,1125', '0', '1180', '1180', '0', '0');
INSERT INTO `sx_area` VALUES ('1181', '怀宁县', '1125', '0,13,1125', '0', '1181', '1181', '0', '0');
INSERT INTO `sx_area` VALUES ('1182', '枞阳县', '1125', '0,13,1125', '0', '1182', '1182', '0', '0');
INSERT INTO `sx_area` VALUES ('1183', '潜山县', '1125', '0,13,1125', '0', '1183', '1183', '0', '0');
INSERT INTO `sx_area` VALUES ('1184', '太湖县', '1125', '0,13,1125', '0', '1184', '1184', '0', '0');
INSERT INTO `sx_area` VALUES ('1185', '宿松县', '1125', '0,13,1125', '0', '1185', '1185', '0', '0');
INSERT INTO `sx_area` VALUES ('1186', '望江县', '1125', '0,13,1125', '0', '1186', '1186', '0', '0');
INSERT INTO `sx_area` VALUES ('1187', '岳西县', '1125', '0,13,1125', '0', '1187', '1187', '0', '0');
INSERT INTO `sx_area` VALUES ('1188', '桐城市', '1125', '0,13,1125', '0', '1188', '1188', '0', '0');
INSERT INTO `sx_area` VALUES ('1189', '屯溪区', '1126', '0,13,1126', '0', '1189', '1189', '0', '0');
INSERT INTO `sx_area` VALUES ('1190', '黄山区', '1126', '0,13,1126', '0', '1190', '1190', '0', '0');
INSERT INTO `sx_area` VALUES ('1191', '徽州区', '1126', '0,13,1126', '0', '1191', '1191', '0', '0');
INSERT INTO `sx_area` VALUES ('1192', '歙县', '1126', '0,13,1126', '0', '1192', '1192', '0', '0');
INSERT INTO `sx_area` VALUES ('1193', '休宁县', '1126', '0,13,1126', '0', '1193', '1193', '0', '0');
INSERT INTO `sx_area` VALUES ('1194', '黟县', '1126', '0,13,1126', '0', '1194', '1194', '0', '0');
INSERT INTO `sx_area` VALUES ('1195', '祁门县', '1126', '0,13,1126', '0', '1195', '1195', '0', '0');
INSERT INTO `sx_area` VALUES ('1196', '琅琊区', '1127', '0,13,1127', '0', '1196', '1196', '0', '0');
INSERT INTO `sx_area` VALUES ('1197', '南谯区', '1127', '0,13,1127', '0', '1197', '1197', '0', '0');
INSERT INTO `sx_area` VALUES ('1198', '来安县', '1127', '0,13,1127', '0', '1198', '1198', '0', '0');
INSERT INTO `sx_area` VALUES ('1199', '全椒县', '1127', '0,13,1127', '0', '1199', '1199', '0', '0');
INSERT INTO `sx_area` VALUES ('1200', '定远县', '1127', '0,13,1127', '0', '1200', '1200', '0', '0');
INSERT INTO `sx_area` VALUES ('1201', '凤阳县', '1127', '0,13,1127', '0', '1201', '1201', '0', '0');
INSERT INTO `sx_area` VALUES ('1202', '天长市', '1127', '0,13,1127', '0', '1202', '1202', '0', '0');
INSERT INTO `sx_area` VALUES ('1203', '明光市', '1127', '0,13,1127', '0', '1203', '1203', '0', '0');
INSERT INTO `sx_area` VALUES ('1204', '颍州区', '1128', '0,13,1128', '0', '1204', '1204', '0', '0');
INSERT INTO `sx_area` VALUES ('1205', '颍东区', '1128', '0,13,1128', '0', '1205', '1205', '0', '0');
INSERT INTO `sx_area` VALUES ('1206', '颍泉区', '1128', '0,13,1128', '0', '1206', '1206', '0', '0');
INSERT INTO `sx_area` VALUES ('1207', '临泉县', '1128', '0,13,1128', '0', '1207', '1207', '0', '0');
INSERT INTO `sx_area` VALUES ('1208', '太和县', '1128', '0,13,1128', '0', '1208', '1208', '0', '0');
INSERT INTO `sx_area` VALUES ('1209', '阜南县', '1128', '0,13,1128', '0', '1209', '1209', '0', '0');
INSERT INTO `sx_area` VALUES ('1210', '颍上县', '1128', '0,13,1128', '0', '1210', '1210', '0', '0');
INSERT INTO `sx_area` VALUES ('1211', '界首市', '1128', '0,13,1128', '0', '1211', '1211', '0', '0');
INSERT INTO `sx_area` VALUES ('1212', '墉桥区', '1129', '0,13,1129', '0', '1212', '1212', '0', '0');
INSERT INTO `sx_area` VALUES ('1213', '砀山县', '1129', '0,13,1129', '0', '1213', '1213', '0', '0');
INSERT INTO `sx_area` VALUES ('1214', '萧县', '1129', '0,13,1129', '0', '1214', '1214', '0', '0');
INSERT INTO `sx_area` VALUES ('1215', '灵璧县', '1129', '0,13,1129', '0', '1215', '1215', '0', '0');
INSERT INTO `sx_area` VALUES ('1216', '泗县', '1129', '0,13,1129', '0', '1216', '1216', '0', '0');
INSERT INTO `sx_area` VALUES ('1217', '居巢区', '1130', '0,13,1130', '0', '1217', '1217', '0', '0');
INSERT INTO `sx_area` VALUES ('1218', '庐江县', '1130', '0,13,1130', '0', '1218', '1218', '0', '0');
INSERT INTO `sx_area` VALUES ('1219', '无为县', '1130', '0,13,1130', '0', '1219', '1219', '0', '0');
INSERT INTO `sx_area` VALUES ('1220', '含山县', '1130', '0,13,1130', '0', '1220', '1220', '0', '0');
INSERT INTO `sx_area` VALUES ('1221', '和县', '1130', '0,13,1130', '0', '1221', '1221', '0', '0');
INSERT INTO `sx_area` VALUES ('1222', '金安区', '1131', '0,13,1131', '0', '1222', '1222', '0', '0');
INSERT INTO `sx_area` VALUES ('1223', '裕安区', '1131', '0,13,1131', '0', '1223', '1223', '0', '0');
INSERT INTO `sx_area` VALUES ('1224', '寿县', '1131', '0,13,1131', '0', '1224', '1224', '0', '0');
INSERT INTO `sx_area` VALUES ('1225', '霍邱县', '1131', '0,13,1131', '0', '1225', '1225', '0', '0');
INSERT INTO `sx_area` VALUES ('1226', '舒城县', '1131', '0,13,1131', '0', '1226', '1226', '0', '0');
INSERT INTO `sx_area` VALUES ('1227', '金寨县', '1131', '0,13,1131', '0', '1227', '1227', '0', '0');
INSERT INTO `sx_area` VALUES ('1228', '霍山县', '1131', '0,13,1131', '0', '1228', '1228', '0', '0');
INSERT INTO `sx_area` VALUES ('1229', '涡阳县', '1132', '0,13,1132', '0', '1229', '1229', '0', '0');
INSERT INTO `sx_area` VALUES ('1230', '蒙城县', '1132', '0,13,1132', '0', '1230', '1230', '0', '0');
INSERT INTO `sx_area` VALUES ('1231', '利辛县', '1132', '0,13,1132', '0', '1231', '1231', '0', '0');
INSERT INTO `sx_area` VALUES ('1232', '贵池区', '1133', '0,13,1133', '0', '1232', '1232', '0', '0');
INSERT INTO `sx_area` VALUES ('1233', '东至县', '1133', '0,13,1133', '0', '1233', '1233', '0', '0');
INSERT INTO `sx_area` VALUES ('1234', '石台县', '1133', '0,13,1133', '0', '1234', '1234', '0', '0');
INSERT INTO `sx_area` VALUES ('1235', '青阳县', '1133', '0,13,1133', '0', '1235', '1235', '0', '0');
INSERT INTO `sx_area` VALUES ('1236', '宣州区', '1134', '0,13,1134', '0', '1236', '1236', '0', '0');
INSERT INTO `sx_area` VALUES ('1237', '郎溪县', '1134', '0,13,1134', '0', '1237', '1237', '0', '0');
INSERT INTO `sx_area` VALUES ('1238', '广德县', '1134', '0,13,1134', '0', '1238', '1238', '0', '0');
INSERT INTO `sx_area` VALUES ('1239', '泾县', '1134', '0,13,1134', '0', '1239', '1239', '0', '0');
INSERT INTO `sx_area` VALUES ('1240', '绩溪县', '1134', '0,13,1134', '0', '1240', '1240', '0', '0');
INSERT INTO `sx_area` VALUES ('1241', '旌德县', '1134', '0,13,1134', '0', '1241', '1241', '0', '0');
INSERT INTO `sx_area` VALUES ('1242', '宁国市', '1134', '0,13,1134', '0', '1242', '1242', '0', '0');
INSERT INTO `sx_area` VALUES ('1243', '福州市', '14', '0,14', '1', '1243,1252,1253,1254,1255,1256,1257,1258,1259,1260,1261,1262,1263,1264', '1243', '0', '0');
INSERT INTO `sx_area` VALUES ('1244', '厦门市', '14', '0,14', '1', '1244,1265,1266,1267,1268,1269,1270,1271', '1244', '0', '0');
INSERT INTO `sx_area` VALUES ('1245', '莆田市', '14', '0,14', '1', '1245,1272,1273,1274,1275,1276', '1245', '0', '0');
INSERT INTO `sx_area` VALUES ('1246', '三明市', '14', '0,14', '1', '1246,1277,1278,1279,1280,1281,1282,1283,1284,1285,1286,1287,1288', '1246', '0', '0');
INSERT INTO `sx_area` VALUES ('1247', '泉州市', '14', '0,14', '1', '1247,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1299,1300', '1247', '0', '0');
INSERT INTO `sx_area` VALUES ('1248', '漳州市', '14', '0,14', '1', '1248,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311', '1248', '0', '0');
INSERT INTO `sx_area` VALUES ('1249', '南平市', '14', '0,14', '1', '1249,1312,1313,1314,1315,1316,1317,1318,1319,1320,1321', '1249', '0', '0');
INSERT INTO `sx_area` VALUES ('1250', '龙岩市', '14', '0,14', '1', '1250,1322,1323,1324,1325,1326,1327,1328', '1250', '0', '0');
INSERT INTO `sx_area` VALUES ('1251', '宁德市', '14', '0,14', '1', '1251,1329,1330,1331,1332,1333,1334,1335,1336,1337', '1251', '0', '0');
INSERT INTO `sx_area` VALUES ('1252', '鼓楼区', '1243', '0,14,1243', '0', '1252', '1252', '0', '0');
INSERT INTO `sx_area` VALUES ('1253', '台江区', '1243', '0,14,1243', '0', '1253', '1253', '0', '0');
INSERT INTO `sx_area` VALUES ('1254', '仓山区', '1243', '0,14,1243', '0', '1254', '1254', '0', '0');
INSERT INTO `sx_area` VALUES ('1255', '马尾区', '1243', '0,14,1243', '0', '1255', '1255', '0', '0');
INSERT INTO `sx_area` VALUES ('1256', '晋安区', '1243', '0,14,1243', '0', '1256', '1256', '0', '0');
INSERT INTO `sx_area` VALUES ('1257', '闽侯县', '1243', '0,14,1243', '0', '1257', '1257', '0', '0');
INSERT INTO `sx_area` VALUES ('1258', '连江县', '1243', '0,14,1243', '0', '1258', '1258', '0', '0');
INSERT INTO `sx_area` VALUES ('1259', '罗源县', '1243', '0,14,1243', '0', '1259', '1259', '0', '0');
INSERT INTO `sx_area` VALUES ('1260', '闽清县', '1243', '0,14,1243', '0', '1260', '1260', '0', '0');
INSERT INTO `sx_area` VALUES ('1261', '永泰县', '1243', '0,14,1243', '0', '1261', '1261', '0', '0');
INSERT INTO `sx_area` VALUES ('1262', '平潭县', '1243', '0,14,1243', '0', '1262', '1262', '0', '0');
INSERT INTO `sx_area` VALUES ('1263', '福清市', '1243', '0,14,1243', '0', '1263', '1263', '0', '0');
INSERT INTO `sx_area` VALUES ('1264', '长乐市', '1243', '0,14,1243', '0', '1264', '1264', '0', '0');
INSERT INTO `sx_area` VALUES ('1265', '鼓浪屿区', '1244', '0,14,1244', '0', '1265', '1265', '0', '0');
INSERT INTO `sx_area` VALUES ('1266', '思明区', '1244', '0,14,1244', '0', '1266', '1266', '0', '0');
INSERT INTO `sx_area` VALUES ('1267', '开元区', '1244', '0,14,1244', '0', '1267', '1267', '0', '0');
INSERT INTO `sx_area` VALUES ('1268', '杏林区', '1244', '0,14,1244', '0', '1268', '1268', '0', '0');
INSERT INTO `sx_area` VALUES ('1269', '湖里区', '1244', '0,14,1244', '0', '1269', '1269', '0', '0');
INSERT INTO `sx_area` VALUES ('1270', '集美区', '1244', '0,14,1244', '0', '1270', '1270', '0', '0');
INSERT INTO `sx_area` VALUES ('1271', '同安区', '1244', '0,14,1244', '0', '1271', '1271', '0', '0');
INSERT INTO `sx_area` VALUES ('1272', '城厢区', '1245', '0,14,1245', '0', '1272', '1272', '0', '0');
INSERT INTO `sx_area` VALUES ('1273', '涵江区', '1245', '0,14,1245', '0', '1273', '1273', '0', '0');
INSERT INTO `sx_area` VALUES ('1274', '荔城区', '1245', '0,14,1245', '0', '1274', '1274', '0', '0');
INSERT INTO `sx_area` VALUES ('1275', '秀屿区', '1245', '0,14,1245', '0', '1275', '1275', '0', '0');
INSERT INTO `sx_area` VALUES ('1276', '仙游县', '1245', '0,14,1245', '0', '1276', '1276', '0', '0');
INSERT INTO `sx_area` VALUES ('1277', '梅列区', '1246', '0,14,1246', '0', '1277', '1277', '0', '0');
INSERT INTO `sx_area` VALUES ('1278', '三元区', '1246', '0,14,1246', '0', '1278', '1278', '0', '0');
INSERT INTO `sx_area` VALUES ('1279', '明溪县', '1246', '0,14,1246', '0', '1279', '1279', '0', '0');
INSERT INTO `sx_area` VALUES ('1280', '清流县', '1246', '0,14,1246', '0', '1280', '1280', '0', '0');
INSERT INTO `sx_area` VALUES ('1281', '宁化县', '1246', '0,14,1246', '0', '1281', '1281', '0', '0');
INSERT INTO `sx_area` VALUES ('1282', '大田县', '1246', '0,14,1246', '0', '1282', '1282', '0', '0');
INSERT INTO `sx_area` VALUES ('1283', '尤溪县', '1246', '0,14,1246', '0', '1283', '1283', '0', '0');
INSERT INTO `sx_area` VALUES ('1284', '沙县', '1246', '0,14,1246', '0', '1284', '1284', '0', '0');
INSERT INTO `sx_area` VALUES ('1285', '将乐县', '1246', '0,14,1246', '0', '1285', '1285', '0', '0');
INSERT INTO `sx_area` VALUES ('1286', '泰宁县', '1246', '0,14,1246', '0', '1286', '1286', '0', '0');
INSERT INTO `sx_area` VALUES ('1287', '建宁县', '1246', '0,14,1246', '0', '1287', '1287', '0', '0');
INSERT INTO `sx_area` VALUES ('1288', '永安市', '1246', '0,14,1246', '0', '1288', '1288', '0', '0');
INSERT INTO `sx_area` VALUES ('1289', '鲤城区', '1247', '0,14,1247', '0', '1289', '1289', '0', '0');
INSERT INTO `sx_area` VALUES ('1290', '丰泽区', '1247', '0,14,1247', '0', '1290', '1290', '0', '0');
INSERT INTO `sx_area` VALUES ('1291', '洛江区', '1247', '0,14,1247', '0', '1291', '1291', '0', '0');
INSERT INTO `sx_area` VALUES ('1292', '泉港区', '1247', '0,14,1247', '0', '1292', '1292', '0', '0');
INSERT INTO `sx_area` VALUES ('1293', '惠安县', '1247', '0,14,1247', '0', '1293', '1293', '0', '0');
INSERT INTO `sx_area` VALUES ('1294', '安溪县', '1247', '0,14,1247', '0', '1294', '1294', '0', '0');
INSERT INTO `sx_area` VALUES ('1295', '永春县', '1247', '0,14,1247', '0', '1295', '1295', '0', '0');
INSERT INTO `sx_area` VALUES ('1296', '德化县', '1247', '0,14,1247', '0', '1296', '1296', '0', '0');
INSERT INTO `sx_area` VALUES ('1297', '金门县', '1247', '0,14,1247', '0', '1297', '1297', '0', '0');
INSERT INTO `sx_area` VALUES ('1298', '石狮市', '1247', '0,14,1247', '0', '1298', '1298', '0', '0');
INSERT INTO `sx_area` VALUES ('1299', '晋江市', '1247', '0,14,1247', '0', '1299', '1299', '0', '0');
INSERT INTO `sx_area` VALUES ('1300', '南安市', '1247', '0,14,1247', '0', '1300', '1300', '0', '0');
INSERT INTO `sx_area` VALUES ('1301', '芗城区', '1248', '0,14,1248', '0', '1301', '1301', '0', '0');
INSERT INTO `sx_area` VALUES ('1302', '龙文区', '1248', '0,14,1248', '0', '1302', '1302', '0', '0');
INSERT INTO `sx_area` VALUES ('1303', '云霄县', '1248', '0,14,1248', '0', '1303', '1303', '0', '0');
INSERT INTO `sx_area` VALUES ('1304', '漳浦县', '1248', '0,14,1248', '0', '1304', '1304', '0', '0');
INSERT INTO `sx_area` VALUES ('1305', '诏安县', '1248', '0,14,1248', '0', '1305', '1305', '0', '0');
INSERT INTO `sx_area` VALUES ('1306', '长泰县', '1248', '0,14,1248', '0', '1306', '1306', '0', '0');
INSERT INTO `sx_area` VALUES ('1307', '东山县', '1248', '0,14,1248', '0', '1307', '1307', '0', '0');
INSERT INTO `sx_area` VALUES ('1308', '南靖县', '1248', '0,14,1248', '0', '1308', '1308', '0', '0');
INSERT INTO `sx_area` VALUES ('1309', '平和县', '1248', '0,14,1248', '0', '1309', '1309', '0', '0');
INSERT INTO `sx_area` VALUES ('1310', '华安县', '1248', '0,14,1248', '0', '1310', '1310', '0', '0');
INSERT INTO `sx_area` VALUES ('1311', '龙海市', '1248', '0,14,1248', '0', '1311', '1311', '0', '0');
INSERT INTO `sx_area` VALUES ('1312', '延平区', '1249', '0,14,1249', '0', '1312', '1312', '0', '0');
INSERT INTO `sx_area` VALUES ('1313', '顺昌县', '1249', '0,14,1249', '0', '1313', '1313', '0', '0');
INSERT INTO `sx_area` VALUES ('1314', '浦城县', '1249', '0,14,1249', '0', '1314', '1314', '0', '0');
INSERT INTO `sx_area` VALUES ('1315', '光泽县', '1249', '0,14,1249', '0', '1315', '1315', '0', '0');
INSERT INTO `sx_area` VALUES ('1316', '松溪县', '1249', '0,14,1249', '0', '1316', '1316', '0', '0');
INSERT INTO `sx_area` VALUES ('1317', '政和县', '1249', '0,14,1249', '0', '1317', '1317', '0', '0');
INSERT INTO `sx_area` VALUES ('1318', '邵武市', '1249', '0,14,1249', '0', '1318', '1318', '0', '0');
INSERT INTO `sx_area` VALUES ('1319', '武夷山市', '1249', '0,14,1249', '0', '1319', '1319', '0', '0');
INSERT INTO `sx_area` VALUES ('1320', '建瓯市', '1249', '0,14,1249', '0', '1320', '1320', '0', '0');
INSERT INTO `sx_area` VALUES ('1321', '建阳市', '1249', '0,14,1249', '0', '1321', '1321', '0', '0');
INSERT INTO `sx_area` VALUES ('1322', '新罗区', '1250', '0,14,1250', '0', '1322', '1322', '0', '0');
INSERT INTO `sx_area` VALUES ('1323', '长汀县', '1250', '0,14,1250', '0', '1323', '1323', '0', '0');
INSERT INTO `sx_area` VALUES ('1324', '永定县', '1250', '0,14,1250', '0', '1324', '1324', '0', '0');
INSERT INTO `sx_area` VALUES ('1325', '上杭县', '1250', '0,14,1250', '0', '1325', '1325', '0', '0');
INSERT INTO `sx_area` VALUES ('1326', '武平县', '1250', '0,14,1250', '0', '1326', '1326', '0', '0');
INSERT INTO `sx_area` VALUES ('1327', '连城县', '1250', '0,14,1250', '0', '1327', '1327', '0', '0');
INSERT INTO `sx_area` VALUES ('1328', '漳平市', '1250', '0,14,1250', '0', '1328', '1328', '0', '0');
INSERT INTO `sx_area` VALUES ('1329', '蕉城区', '1251', '0,14,1251', '0', '1329', '1329', '0', '0');
INSERT INTO `sx_area` VALUES ('1330', '霞浦县', '1251', '0,14,1251', '0', '1330', '1330', '0', '0');
INSERT INTO `sx_area` VALUES ('1331', '古田县', '1251', '0,14,1251', '0', '1331', '1331', '0', '0');
INSERT INTO `sx_area` VALUES ('1332', '屏南县', '1251', '0,14,1251', '0', '1332', '1332', '0', '0');
INSERT INTO `sx_area` VALUES ('1333', '寿宁县', '1251', '0,14,1251', '0', '1333', '1333', '0', '0');
INSERT INTO `sx_area` VALUES ('1334', '周宁县', '1251', '0,14,1251', '0', '1334', '1334', '0', '0');
INSERT INTO `sx_area` VALUES ('1335', '柘荣县', '1251', '0,14,1251', '0', '1335', '1335', '0', '0');
INSERT INTO `sx_area` VALUES ('1336', '福安市', '1251', '0,14,1251', '0', '1336', '1336', '0', '0');
INSERT INTO `sx_area` VALUES ('1337', '福鼎市', '1251', '0,14,1251', '0', '1337', '1337', '0', '0');
INSERT INTO `sx_area` VALUES ('1338', '南昌市', '15', '0,15', '1', '1338,1350,1351,1352,1353,1354,1355,1356,1357,1358,1359,1360,1361,1362', '1338', '0', '0');
INSERT INTO `sx_area` VALUES ('1339', '景德镇市', '15', '0,15', '1', '1339,1363,1364,1365,1366', '1339', '0', '0');
INSERT INTO `sx_area` VALUES ('1340', '萍乡市', '15', '0,15', '1', '1340,1367,1368,1369,1370,1371', '1340', '0', '0');
INSERT INTO `sx_area` VALUES ('1341', '九江市', '15', '0,15', '1', '1341,1372,1373,1374,1375,1376,1377,1378,1379,1380,1381,1382,1383,1384', '1341', '0', '0');
INSERT INTO `sx_area` VALUES ('1342', '新余市', '15', '0,15', '1', '1342,1385,1386', '1342', '0', '0');
INSERT INTO `sx_area` VALUES ('1343', '鹰潭市', '15', '0,15', '1', '1343,1387,1388,1389', '1343', '0', '0');
INSERT INTO `sx_area` VALUES ('1344', '赣州市', '15', '0,15', '1', '1344,1390,1391,1392,1393,1394,1395,1396,1397,1398,1399,1400,1401,1402,1403,1404,1405,1406,1407,1408', '1344', '0', '0');
INSERT INTO `sx_area` VALUES ('1345', '吉安市', '15', '0,15', '1', '1345,1409,1410,1411,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421', '1345', '0', '0');
INSERT INTO `sx_area` VALUES ('1346', '宜春市', '15', '0,15', '1', '1346,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431', '1346', '0', '0');
INSERT INTO `sx_area` VALUES ('1347', '抚州市', '15', '0,15', '1', '1347,1432,1433,1434,1435,1436,1437,1438,1439,1440,1441,1442,1443', '1347', '0', '0');
INSERT INTO `sx_area` VALUES ('1348', '上饶市', '15', '0,15', '1', '1348,1444,1445,1446,1447,1448,1449,1450,1451,1452,1453,1454,1455,1456', '1348', '0', '0');
INSERT INTO `sx_area` VALUES ('1349', '铁路', '15', '0,15', '1', '1349,1457', '1349', '0', '0');
INSERT INTO `sx_area` VALUES ('1350', '东湖区', '1338', '0,15,1338', '0', '1350', '1350', '0', '0');
INSERT INTO `sx_area` VALUES ('1351', '西湖区', '1338', '0,15,1338', '0', '1351', '1351', '0', '0');
INSERT INTO `sx_area` VALUES ('1352', '青云谱区', '1338', '0,15,1338', '0', '1352', '1352', '0', '0');
INSERT INTO `sx_area` VALUES ('1353', '湾里区', '1338', '0,15,1338', '0', '1353', '1353', '0', '0');
INSERT INTO `sx_area` VALUES ('1354', '青山湖区', '1338', '0,15,1338', '0', '1354', '1354', '0', '0');
INSERT INTO `sx_area` VALUES ('1355', '南昌县', '1338', '0,15,1338', '0', '1355', '1355', '0', '0');
INSERT INTO `sx_area` VALUES ('1356', '新建县', '1338', '0,15,1338', '0', '1356', '1356', '0', '0');
INSERT INTO `sx_area` VALUES ('1357', '安义县', '1338', '0,15,1338', '0', '1357', '1357', '0', '0');
INSERT INTO `sx_area` VALUES ('1358', '进贤县', '1338', '0,15,1338', '0', '1358', '1358', '0', '0');
INSERT INTO `sx_area` VALUES ('1359', '经济开发区', '1338', '0,15,1338', '0', '1359', '1359', '0', '0');
INSERT INTO `sx_area` VALUES ('1360', '红谷滩', '1338', '0,15,1338', '0', '1360', '1360', '0', '0');
INSERT INTO `sx_area` VALUES ('1361', '高新技术开发区', '1338', '0,15,1338', '0', '1361', '1361', '0', '0');
INSERT INTO `sx_area` VALUES ('1362', '洪都', '1338', '0,15,1338', '0', '1362', '1362', '0', '0');
INSERT INTO `sx_area` VALUES ('1363', '昌江区', '1339', '0,15,1339', '0', '1363', '1363', '0', '0');
INSERT INTO `sx_area` VALUES ('1364', '珠山区', '1339', '0,15,1339', '0', '1364', '1364', '0', '0');
INSERT INTO `sx_area` VALUES ('1365', '浮梁县', '1339', '0,15,1339', '0', '1365', '1365', '0', '0');
INSERT INTO `sx_area` VALUES ('1366', '乐平市', '1339', '0,15,1339', '0', '1366', '1366', '0', '0');
INSERT INTO `sx_area` VALUES ('1367', '安源区', '1340', '0,15,1340', '0', '1367', '1367', '0', '0');
INSERT INTO `sx_area` VALUES ('1368', '湘东区', '1340', '0,15,1340', '0', '1368', '1368', '0', '0');
INSERT INTO `sx_area` VALUES ('1369', '莲花县', '1340', '0,15,1340', '0', '1369', '1369', '0', '0');
INSERT INTO `sx_area` VALUES ('1370', '上栗县', '1340', '0,15,1340', '0', '1370', '1370', '0', '0');
INSERT INTO `sx_area` VALUES ('1371', '芦溪县', '1340', '0,15,1340', '0', '1371', '1371', '0', '0');
INSERT INTO `sx_area` VALUES ('1372', '庐山区', '1341', '0,15,1341', '0', '1372', '1372', '0', '0');
INSERT INTO `sx_area` VALUES ('1373', '浔阳区', '1341', '0,15,1341', '0', '1373', '1373', '0', '0');
INSERT INTO `sx_area` VALUES ('1374', '九江县', '1341', '0,15,1341', '0', '1374', '1374', '0', '0');
INSERT INTO `sx_area` VALUES ('1375', '武宁县', '1341', '0,15,1341', '0', '1375', '1375', '0', '0');
INSERT INTO `sx_area` VALUES ('1376', '修水县', '1341', '0,15,1341', '0', '1376', '1376', '0', '0');
INSERT INTO `sx_area` VALUES ('1377', '永修县', '1341', '0,15,1341', '0', '1377', '1377', '0', '0');
INSERT INTO `sx_area` VALUES ('1378', '德安县', '1341', '0,15,1341', '0', '1378', '1378', '0', '0');
INSERT INTO `sx_area` VALUES ('1379', '星子县', '1341', '0,15,1341', '0', '1379', '1379', '0', '0');
INSERT INTO `sx_area` VALUES ('1380', '都昌县', '1341', '0,15,1341', '0', '1380', '1380', '0', '0');
INSERT INTO `sx_area` VALUES ('1381', '湖口县', '1341', '0,15,1341', '0', '1381', '1381', '0', '0');
INSERT INTO `sx_area` VALUES ('1382', '彭泽县', '1341', '0,15,1341', '0', '1382', '1382', '0', '0');
INSERT INTO `sx_area` VALUES ('1383', '共青城', '1341', '0,15,1341', '0', '1383', '1383', '0', '0');
INSERT INTO `sx_area` VALUES ('1384', '瑞昌市', '1341', '0,15,1341', '0', '1384', '1384', '0', '0');
INSERT INTO `sx_area` VALUES ('1385', '渝水区', '1342', '0,15,1342', '0', '1385', '1385', '0', '0');
INSERT INTO `sx_area` VALUES ('1386', '分宜县', '1342', '0,15,1342', '0', '1386', '1386', '0', '0');
INSERT INTO `sx_area` VALUES ('1387', '月湖区', '1343', '0,15,1343', '0', '1387', '1387', '0', '0');
INSERT INTO `sx_area` VALUES ('1388', '余江县', '1343', '0,15,1343', '0', '1388', '1388', '0', '0');
INSERT INTO `sx_area` VALUES ('1389', '贵溪市', '1343', '0,15,1343', '0', '1389', '1389', '0', '0');
INSERT INTO `sx_area` VALUES ('1390', '章贡区', '1344', '0,15,1344', '0', '1390', '1390', '0', '0');
INSERT INTO `sx_area` VALUES ('1391', '黄金区', '1344', '0,15,1344', '0', '1391', '1391', '0', '0');
INSERT INTO `sx_area` VALUES ('1392', '赣县', '1344', '0,15,1344', '0', '1392', '1392', '0', '0');
INSERT INTO `sx_area` VALUES ('1393', '信丰县', '1344', '0,15,1344', '0', '1393', '1393', '0', '0');
INSERT INTO `sx_area` VALUES ('1394', '大余县', '1344', '0,15,1344', '0', '1394', '1394', '0', '0');
INSERT INTO `sx_area` VALUES ('1395', '上犹县', '1344', '0,15,1344', '0', '1395', '1395', '0', '0');
INSERT INTO `sx_area` VALUES ('1396', '崇义县', '1344', '0,15,1344', '0', '1396', '1396', '0', '0');
INSERT INTO `sx_area` VALUES ('1397', '安远县', '1344', '0,15,1344', '0', '1397', '1397', '0', '0');
INSERT INTO `sx_area` VALUES ('1398', '龙南县', '1344', '0,15,1344', '0', '1398', '1398', '0', '0');
INSERT INTO `sx_area` VALUES ('1399', '定南县', '1344', '0,15,1344', '0', '1399', '1399', '0', '0');
INSERT INTO `sx_area` VALUES ('1400', '全南县', '1344', '0,15,1344', '0', '1400', '1400', '0', '0');
INSERT INTO `sx_area` VALUES ('1401', '宁都县', '1344', '0,15,1344', '0', '1401', '1401', '0', '0');
INSERT INTO `sx_area` VALUES ('1402', '于都县', '1344', '0,15,1344', '0', '1402', '1402', '0', '0');
INSERT INTO `sx_area` VALUES ('1403', '兴国县', '1344', '0,15,1344', '0', '1403', '1403', '0', '0');
INSERT INTO `sx_area` VALUES ('1404', '会昌县', '1344', '0,15,1344', '0', '1404', '1404', '0', '0');
INSERT INTO `sx_area` VALUES ('1405', '寻乌县', '1344', '0,15,1344', '0', '1405', '1405', '0', '0');
INSERT INTO `sx_area` VALUES ('1406', '石城县', '1344', '0,15,1344', '0', '1406', '1406', '0', '0');
INSERT INTO `sx_area` VALUES ('1407', '瑞金市', '1344', '0,15,1344', '0', '1407', '1407', '0', '0');
INSERT INTO `sx_area` VALUES ('1408', '南康市', '1344', '0,15,1344', '0', '1408', '1408', '0', '0');
INSERT INTO `sx_area` VALUES ('1409', '吉州区', '1345', '0,15,1345', '0', '1409', '1409', '0', '0');
INSERT INTO `sx_area` VALUES ('1410', '青原区', '1345', '0,15,1345', '0', '1410', '1410', '0', '0');
INSERT INTO `sx_area` VALUES ('1411', '吉安县', '1345', '0,15,1345', '0', '1411', '1411', '0', '0');
INSERT INTO `sx_area` VALUES ('1412', '吉水县', '1345', '0,15,1345', '0', '1412', '1412', '0', '0');
INSERT INTO `sx_area` VALUES ('1413', '峡江县', '1345', '0,15,1345', '0', '1413', '1413', '0', '0');
INSERT INTO `sx_area` VALUES ('1414', '新干县', '1345', '0,15,1345', '0', '1414', '1414', '0', '0');
INSERT INTO `sx_area` VALUES ('1415', '永丰县', '1345', '0,15,1345', '0', '1415', '1415', '0', '0');
INSERT INTO `sx_area` VALUES ('1416', '泰和县', '1345', '0,15,1345', '0', '1416', '1416', '0', '0');
INSERT INTO `sx_area` VALUES ('1417', '遂川县', '1345', '0,15,1345', '0', '1417', '1417', '0', '0');
INSERT INTO `sx_area` VALUES ('1418', '万安县', '1345', '0,15,1345', '0', '1418', '1418', '0', '0');
INSERT INTO `sx_area` VALUES ('1419', '安福县', '1345', '0,15,1345', '0', '1419', '1419', '0', '0');
INSERT INTO `sx_area` VALUES ('1420', '永新县', '1345', '0,15,1345', '0', '1420', '1420', '0', '0');
INSERT INTO `sx_area` VALUES ('1421', '井冈山市', '1345', '0,15,1345', '0', '1421', '1421', '0', '0');
INSERT INTO `sx_area` VALUES ('1422', '袁州区', '1346', '0,15,1346', '0', '1422', '1422', '0', '0');
INSERT INTO `sx_area` VALUES ('1423', '奉新县', '1346', '0,15,1346', '0', '1423', '1423', '0', '0');
INSERT INTO `sx_area` VALUES ('1424', '万载县', '1346', '0,15,1346', '0', '1424', '1424', '0', '0');
INSERT INTO `sx_area` VALUES ('1425', '上高县', '1346', '0,15,1346', '0', '1425', '1425', '0', '0');
INSERT INTO `sx_area` VALUES ('1426', '宜丰县', '1346', '0,15,1346', '0', '1426', '1426', '0', '0');
INSERT INTO `sx_area` VALUES ('1427', '靖安县', '1346', '0,15,1346', '0', '1427', '1427', '0', '0');
INSERT INTO `sx_area` VALUES ('1428', '铜鼓县', '1346', '0,15,1346', '0', '1428', '1428', '0', '0');
INSERT INTO `sx_area` VALUES ('1429', '丰城市', '1346', '0,15,1346', '0', '1429', '1429', '0', '0');
INSERT INTO `sx_area` VALUES ('1430', '樟树市', '1346', '0,15,1346', '0', '1430', '1430', '0', '0');
INSERT INTO `sx_area` VALUES ('1431', '高安市', '1346', '0,15,1346', '0', '1431', '1431', '0', '0');
INSERT INTO `sx_area` VALUES ('1432', '临川区', '1347', '0,15,1347', '0', '1432', '1432', '0', '0');
INSERT INTO `sx_area` VALUES ('1433', '南城县', '1347', '0,15,1347', '0', '1433', '1433', '0', '0');
INSERT INTO `sx_area` VALUES ('1434', '黎川县', '1347', '0,15,1347', '0', '1434', '1434', '0', '0');
INSERT INTO `sx_area` VALUES ('1435', '南丰县', '1347', '0,15,1347', '0', '1435', '1435', '0', '0');
INSERT INTO `sx_area` VALUES ('1436', '崇仁县', '1347', '0,15,1347', '0', '1436', '1436', '0', '0');
INSERT INTO `sx_area` VALUES ('1437', '乐安县', '1347', '0,15,1347', '0', '1437', '1437', '0', '0');
INSERT INTO `sx_area` VALUES ('1438', '宜黄县', '1347', '0,15,1347', '0', '1438', '1438', '0', '0');
INSERT INTO `sx_area` VALUES ('1439', '金溪县', '1347', '0,15,1347', '0', '1439', '1439', '0', '0');
INSERT INTO `sx_area` VALUES ('1440', '资溪县', '1347', '0,15,1347', '0', '1440', '1440', '0', '0');
INSERT INTO `sx_area` VALUES ('1441', '东乡县', '1347', '0,15,1347', '0', '1441', '1441', '0', '0');
INSERT INTO `sx_area` VALUES ('1442', '广昌县', '1347', '0,15,1347', '0', '1442', '1442', '0', '0');
INSERT INTO `sx_area` VALUES ('1443', '文昌区', '1347', '0,15,1347', '0', '1443', '1443', '0', '0');
INSERT INTO `sx_area` VALUES ('1444', '信州区', '1348', '0,15,1348', '0', '1444', '1444', '0', '0');
INSERT INTO `sx_area` VALUES ('1445', '上饶县', '1348', '0,15,1348', '0', '1445', '1445', '0', '0');
INSERT INTO `sx_area` VALUES ('1446', '广丰县', '1348', '0,15,1348', '0', '1446', '1446', '0', '0');
INSERT INTO `sx_area` VALUES ('1447', '玉山县', '1348', '0,15,1348', '0', '1447', '1447', '0', '0');
INSERT INTO `sx_area` VALUES ('1448', '铅山县', '1348', '0,15,1348', '0', '1448', '1448', '0', '0');
INSERT INTO `sx_area` VALUES ('1449', '横峰县', '1348', '0,15,1348', '0', '1449', '1449', '0', '0');
INSERT INTO `sx_area` VALUES ('1450', '弋阳县', '1348', '0,15,1348', '0', '1450', '1450', '0', '0');
INSERT INTO `sx_area` VALUES ('1451', '余干县', '1348', '0,15,1348', '0', '1451', '1451', '0', '0');
INSERT INTO `sx_area` VALUES ('1452', '波阳县', '1348', '0,15,1348', '0', '1452', '1452', '0', '0');
INSERT INTO `sx_area` VALUES ('1453', '万年县', '1348', '0,15,1348', '0', '1453', '1453', '0', '0');
INSERT INTO `sx_area` VALUES ('1454', '婺源县', '1348', '0,15,1348', '0', '1454', '1454', '0', '0');
INSERT INTO `sx_area` VALUES ('1455', '鄱阳县', '1348', '0,15,1348', '0', '1455', '1455', '0', '0');
INSERT INTO `sx_area` VALUES ('1456', '德兴市', '1348', '0,15,1348', '0', '1456', '1456', '0', '0');
INSERT INTO `sx_area` VALUES ('1457', '铁道', '1349', '0,15,1349', '0', '1457', '1457', '0', '0');
INSERT INTO `sx_area` VALUES ('1458', '济南市', '16', '0,16', '1', '1458,1475,1476,1477,1478,1479,1480,1481,1482,1483,1484', '1458', '0', '0');
INSERT INTO `sx_area` VALUES ('1459', '青岛市', '16', '0,16', '1', '1459,1485,1486,1487,1488,1489,1490,1491,1492,1493,1494,1495,1496', '1459', '0', '0');
INSERT INTO `sx_area` VALUES ('1460', '淄博市', '16', '0,16', '1', '1460,1497,1498,1499,1500,1501,1502,1503,1504', '1460', '0', '0');
INSERT INTO `sx_area` VALUES ('1461', '枣庄市', '16', '0,16', '1', '1461,1505,1506,1507,1508,1509,1510', '1461', '0', '0');
INSERT INTO `sx_area` VALUES ('1462', '东营市', '16', '0,16', '1', '1462,1511,1512,1513,1514,1515', '1462', '0', '0');
INSERT INTO `sx_area` VALUES ('1463', '烟台市', '16', '0,16', '1', '1463,1516,1517,1518,1519,1520,1521,1522,1523,1524,1525,1526,1527,1528', '1463', '0', '0');
INSERT INTO `sx_area` VALUES ('1464', '潍坊市', '16', '0,16', '1', '1464,1529,1530,1531,1532,1533,1534,1535,1536,1537,1538,1539,1540', '1464', '0', '0');
INSERT INTO `sx_area` VALUES ('1465', '济宁市', '16', '0,16', '1', '1465,1541,1542,1543,1544,1545,1546,1547,1548,1549,1550,1551,1552', '1465', '0', '0');
INSERT INTO `sx_area` VALUES ('1466', '泰安市', '16', '0,16', '1', '1466,1553,1554,1555,1556,1557,1558', '1466', '0', '0');
INSERT INTO `sx_area` VALUES ('1467', '威海市', '16', '0,16', '1', '1467,1559,1560,1561,1562', '1467', '0', '0');
INSERT INTO `sx_area` VALUES ('1468', '日照市', '16', '0,16', '1', '1468,1563,1564,1565', '1468', '0', '0');
INSERT INTO `sx_area` VALUES ('1469', '莱芜市', '16', '0,16', '1', '1469,1566,1567', '1469', '0', '0');
INSERT INTO `sx_area` VALUES ('1470', '临沂市', '16', '0,16', '1', '1470,1568,1569,1570,1571,1572,1573,1574,1575,1576,1577,1578,1579', '1470', '0', '0');
INSERT INTO `sx_area` VALUES ('1471', '德州市', '16', '0,16', '1', '1471,1580,1581,1582,1583,1584,1585,1586,1587,1588,1589,1590', '1471', '0', '0');
INSERT INTO `sx_area` VALUES ('1472', '聊城市', '16', '0,16', '1', '1472,1591,1592,1593,1594,1595,1596,1597,1598', '1472', '0', '0');
INSERT INTO `sx_area` VALUES ('1473', '滨州市', '16', '0,16', '1', '1473,1599,1600,1601,1602,1603,1604,1605', '1473', '0', '0');
INSERT INTO `sx_area` VALUES ('1474', '荷泽市', '16', '0,16', '1', '1474,1606,1607,1608,1609,1610,1611,1612,1613,1614', '1474', '0', '0');
INSERT INTO `sx_area` VALUES ('1475', '历下区', '1458', '0,16,1458', '0', '1475', '1475', '0', '0');
INSERT INTO `sx_area` VALUES ('1476', '市中区', '1458', '0,16,1458', '0', '1476', '1476', '0', '0');
INSERT INTO `sx_area` VALUES ('1477', '槐荫区', '1458', '0,16,1458', '0', '1477', '1477', '0', '0');
INSERT INTO `sx_area` VALUES ('1478', '天桥区', '1458', '0,16,1458', '0', '1478', '1478', '0', '0');
INSERT INTO `sx_area` VALUES ('1479', '历城区', '1458', '0,16,1458', '0', '1479', '1479', '0', '0');
INSERT INTO `sx_area` VALUES ('1480', '长清区', '1458', '0,16,1458', '0', '1480', '1480', '0', '0');
INSERT INTO `sx_area` VALUES ('1481', '平阴县', '1458', '0,16,1458', '0', '1481', '1481', '0', '0');
INSERT INTO `sx_area` VALUES ('1482', '济阳县', '1458', '0,16,1458', '0', '1482', '1482', '0', '0');
INSERT INTO `sx_area` VALUES ('1483', '商河县', '1458', '0,16,1458', '0', '1483', '1483', '0', '0');
INSERT INTO `sx_area` VALUES ('1484', '章丘市', '1458', '0,16,1458', '0', '1484', '1484', '0', '0');
INSERT INTO `sx_area` VALUES ('1485', '市南区', '1459', '0,16,1459', '0', '1485', '1485', '0', '0');
INSERT INTO `sx_area` VALUES ('1486', '市北区', '1459', '0,16,1459', '0', '1486', '1486', '0', '0');
INSERT INTO `sx_area` VALUES ('1487', '四方区', '1459', '0,16,1459', '0', '1487', '1487', '0', '0');
INSERT INTO `sx_area` VALUES ('1488', '黄岛区', '1459', '0,16,1459', '0', '1488', '1488', '0', '0');
INSERT INTO `sx_area` VALUES ('1489', '崂山区', '1459', '0,16,1459', '0', '1489', '1489', '0', '0');
INSERT INTO `sx_area` VALUES ('1490', '李沧区', '1459', '0,16,1459', '0', '1490', '1490', '0', '0');
INSERT INTO `sx_area` VALUES ('1491', '城阳区', '1459', '0,16,1459', '0', '1491', '1491', '0', '0');
INSERT INTO `sx_area` VALUES ('1492', '胶州市', '1459', '0,16,1459', '0', '1492', '1492', '0', '0');
INSERT INTO `sx_area` VALUES ('1493', '即墨市', '1459', '0,16,1459', '0', '1493', '1493', '0', '0');
INSERT INTO `sx_area` VALUES ('1494', '平度市', '1459', '0,16,1459', '0', '1494', '1494', '0', '0');
INSERT INTO `sx_area` VALUES ('1495', '胶南市', '1459', '0,16,1459', '0', '1495', '1495', '0', '0');
INSERT INTO `sx_area` VALUES ('1496', '莱西市', '1459', '0,16,1459', '0', '1496', '1496', '0', '0');
INSERT INTO `sx_area` VALUES ('1497', '淄川区', '1460', '0,16,1460', '0', '1497', '1497', '0', '0');
INSERT INTO `sx_area` VALUES ('1498', '张店区', '1460', '0,16,1460', '0', '1498', '1498', '0', '0');
INSERT INTO `sx_area` VALUES ('1499', '博山区', '1460', '0,16,1460', '0', '1499', '1499', '0', '0');
INSERT INTO `sx_area` VALUES ('1500', '临淄区', '1460', '0,16,1460', '0', '1500', '1500', '0', '0');
INSERT INTO `sx_area` VALUES ('1501', '周村区', '1460', '0,16,1460', '0', '1501', '1501', '0', '0');
INSERT INTO `sx_area` VALUES ('1502', '桓台县', '1460', '0,16,1460', '0', '1502', '1502', '0', '0');
INSERT INTO `sx_area` VALUES ('1503', '高青县', '1460', '0,16,1460', '0', '1503', '1503', '0', '0');
INSERT INTO `sx_area` VALUES ('1504', '沂源县', '1460', '0,16,1460', '0', '1504', '1504', '0', '0');
INSERT INTO `sx_area` VALUES ('1505', '市中区', '1461', '0,16,1461', '0', '1505', '1505', '0', '0');
INSERT INTO `sx_area` VALUES ('1506', '薛城区', '1461', '0,16,1461', '0', '1506', '1506', '0', '0');
INSERT INTO `sx_area` VALUES ('1507', '峄城区', '1461', '0,16,1461', '0', '1507', '1507', '0', '0');
INSERT INTO `sx_area` VALUES ('1508', '台儿庄区', '1461', '0,16,1461', '0', '1508', '1508', '0', '0');
INSERT INTO `sx_area` VALUES ('1509', '山亭区', '1461', '0,16,1461', '0', '1509', '1509', '0', '0');
INSERT INTO `sx_area` VALUES ('1510', '滕州市', '1461', '0,16,1461', '0', '1510', '1510', '0', '0');
INSERT INTO `sx_area` VALUES ('1511', '东营区', '1462', '0,16,1462', '0', '1511', '1511', '0', '0');
INSERT INTO `sx_area` VALUES ('1512', '河口区', '1462', '0,16,1462', '0', '1512', '1512', '0', '0');
INSERT INTO `sx_area` VALUES ('1513', '垦利县', '1462', '0,16,1462', '0', '1513', '1513', '0', '0');
INSERT INTO `sx_area` VALUES ('1514', '利津县', '1462', '0,16,1462', '0', '1514', '1514', '0', '0');
INSERT INTO `sx_area` VALUES ('1515', '广饶县', '1462', '0,16,1462', '0', '1515', '1515', '0', '0');
INSERT INTO `sx_area` VALUES ('1516', '芝罘区', '1463', '0,16,1463', '0', '1516', '1516', '0', '0');
INSERT INTO `sx_area` VALUES ('1517', '福山区', '1463', '0,16,1463', '0', '1517', '1517', '0', '0');
INSERT INTO `sx_area` VALUES ('1518', '牟平区', '1463', '0,16,1463', '0', '1518', '1518', '0', '0');
INSERT INTO `sx_area` VALUES ('1519', '莱山区', '1463', '0,16,1463', '0', '1519', '1519', '0', '0');
INSERT INTO `sx_area` VALUES ('1520', '开发区', '1463', '0,16,1463', '0', '1520', '1520', '0', '0');
INSERT INTO `sx_area` VALUES ('1521', '长岛县', '1463', '0,16,1463', '0', '1521', '1521', '0', '0');
INSERT INTO `sx_area` VALUES ('1522', '龙口市', '1463', '0,16,1463', '0', '1522', '1522', '0', '0');
INSERT INTO `sx_area` VALUES ('1523', '莱阳市', '1463', '0,16,1463', '0', '1523', '1523', '0', '0');
INSERT INTO `sx_area` VALUES ('1524', '莱州市', '1463', '0,16,1463', '0', '1524', '1524', '0', '0');
INSERT INTO `sx_area` VALUES ('1525', '蓬莱市', '1463', '0,16,1463', '0', '1525', '1525', '0', '0');
INSERT INTO `sx_area` VALUES ('1526', '招远市', '1463', '0,16,1463', '0', '1526', '1526', '0', '0');
INSERT INTO `sx_area` VALUES ('1527', '栖霞市', '1463', '0,16,1463', '0', '1527', '1527', '0', '0');
INSERT INTO `sx_area` VALUES ('1528', '海阳市', '1463', '0,16,1463', '0', '1528', '1528', '0', '0');
INSERT INTO `sx_area` VALUES ('1529', '潍城区', '1464', '0,16,1464', '0', '1529', '1529', '0', '0');
INSERT INTO `sx_area` VALUES ('1530', '寒亭区', '1464', '0,16,1464', '0', '1530', '1530', '0', '0');
INSERT INTO `sx_area` VALUES ('1531', '坊子区', '1464', '0,16,1464', '0', '1531', '1531', '0', '0');
INSERT INTO `sx_area` VALUES ('1532', '奎文区', '1464', '0,16,1464', '0', '1532', '1532', '0', '0');
INSERT INTO `sx_area` VALUES ('1533', '临朐县', '1464', '0,16,1464', '0', '1533', '1533', '0', '0');
INSERT INTO `sx_area` VALUES ('1534', '昌乐县', '1464', '0,16,1464', '0', '1534', '1534', '0', '0');
INSERT INTO `sx_area` VALUES ('1535', '青州市', '1464', '0,16,1464', '0', '1535', '1535', '0', '0');
INSERT INTO `sx_area` VALUES ('1536', '诸城市', '1464', '0,16,1464', '0', '1536', '1536', '0', '0');
INSERT INTO `sx_area` VALUES ('1537', '寿光市', '1464', '0,16,1464', '0', '1537', '1537', '0', '0');
INSERT INTO `sx_area` VALUES ('1538', '安丘市', '1464', '0,16,1464', '0', '1538', '1538', '0', '0');
INSERT INTO `sx_area` VALUES ('1539', '高密市', '1464', '0,16,1464', '0', '1539', '1539', '0', '0');
INSERT INTO `sx_area` VALUES ('1540', '昌邑市', '1464', '0,16,1464', '0', '1540', '1540', '0', '0');
INSERT INTO `sx_area` VALUES ('1541', '市中区', '1465', '0,16,1465', '0', '1541', '1541', '0', '0');
INSERT INTO `sx_area` VALUES ('1542', '任城区', '1465', '0,16,1465', '0', '1542', '1542', '0', '0');
INSERT INTO `sx_area` VALUES ('1543', '微山县', '1465', '0,16,1465', '0', '1543', '1543', '0', '0');
INSERT INTO `sx_area` VALUES ('1544', '鱼台县', '1465', '0,16,1465', '0', '1544', '1544', '0', '0');
INSERT INTO `sx_area` VALUES ('1545', '金乡县', '1465', '0,16,1465', '0', '1545', '1545', '0', '0');
INSERT INTO `sx_area` VALUES ('1546', '嘉祥县', '1465', '0,16,1465', '0', '1546', '1546', '0', '0');
INSERT INTO `sx_area` VALUES ('1547', '汶上县', '1465', '0,16,1465', '0', '1547', '1547', '0', '0');
INSERT INTO `sx_area` VALUES ('1548', '泗水县', '1465', '0,16,1465', '0', '1548', '1548', '0', '0');
INSERT INTO `sx_area` VALUES ('1549', '梁山县', '1465', '0,16,1465', '0', '1549', '1549', '0', '0');
INSERT INTO `sx_area` VALUES ('1550', '曲阜市', '1465', '0,16,1465', '0', '1550', '1550', '0', '0');
INSERT INTO `sx_area` VALUES ('1551', '兖州市', '1465', '0,16,1465', '0', '1551', '1551', '0', '0');
INSERT INTO `sx_area` VALUES ('1552', '邹城市', '1465', '0,16,1465', '0', '1552', '1552', '0', '0');
INSERT INTO `sx_area` VALUES ('1553', '泰山区', '1466', '0,16,1466', '0', '1553', '1553', '0', '0');
INSERT INTO `sx_area` VALUES ('1554', '岱岳区', '1466', '0,16,1466', '0', '1554', '1554', '0', '0');
INSERT INTO `sx_area` VALUES ('1555', '宁阳县', '1466', '0,16,1466', '0', '1555', '1555', '0', '0');
INSERT INTO `sx_area` VALUES ('1556', '东平县', '1466', '0,16,1466', '0', '1556', '1556', '0', '0');
INSERT INTO `sx_area` VALUES ('1557', '新泰市', '1466', '0,16,1466', '0', '1557', '1557', '0', '0');
INSERT INTO `sx_area` VALUES ('1558', '肥城市', '1466', '0,16,1466', '0', '1558', '1558', '0', '0');
INSERT INTO `sx_area` VALUES ('1559', '环翠区', '1467', '0,16,1467', '0', '1559', '1559', '0', '0');
INSERT INTO `sx_area` VALUES ('1560', '文登市', '1467', '0,16,1467', '0', '1560', '1560', '0', '0');
INSERT INTO `sx_area` VALUES ('1561', '荣成市', '1467', '0,16,1467', '0', '1561', '1561', '0', '0');
INSERT INTO `sx_area` VALUES ('1562', '乳山市', '1467', '0,16,1467', '0', '1562', '1562', '0', '0');
INSERT INTO `sx_area` VALUES ('1563', '东港区', '1468', '0,16,1468', '0', '1563', '1563', '0', '0');
INSERT INTO `sx_area` VALUES ('1564', '五莲县', '1468', '0,16,1468', '0', '1564', '1564', '0', '0');
INSERT INTO `sx_area` VALUES ('1565', '莒县', '1468', '0,16,1468', '0', '1565', '1565', '0', '0');
INSERT INTO `sx_area` VALUES ('1566', '莱城区', '1469', '0,16,1469', '0', '1566', '1566', '0', '0');
INSERT INTO `sx_area` VALUES ('1567', '钢城区', '1469', '0,16,1469', '0', '1567', '1567', '0', '0');
INSERT INTO `sx_area` VALUES ('1568', '兰山区', '1470', '0,16,1470', '0', '1568', '1568', '0', '0');
INSERT INTO `sx_area` VALUES ('1569', '罗庄区', '1470', '0,16,1470', '0', '1569', '1569', '0', '0');
INSERT INTO `sx_area` VALUES ('1570', '河东区', '1470', '0,16,1470', '0', '1570', '1570', '0', '0');
INSERT INTO `sx_area` VALUES ('1571', '沂南县', '1470', '0,16,1470', '0', '1571', '1571', '0', '0');
INSERT INTO `sx_area` VALUES ('1572', '郯城县', '1470', '0,16,1470', '0', '1572', '1572', '0', '0');
INSERT INTO `sx_area` VALUES ('1573', '沂水县', '1470', '0,16,1470', '0', '1573', '1573', '0', '0');
INSERT INTO `sx_area` VALUES ('1574', '苍山县', '1470', '0,16,1470', '0', '1574', '1574', '0', '0');
INSERT INTO `sx_area` VALUES ('1575', '费县', '1470', '0,16,1470', '0', '1575', '1575', '0', '0');
INSERT INTO `sx_area` VALUES ('1576', '平邑县', '1470', '0,16,1470', '0', '1576', '1576', '0', '0');
INSERT INTO `sx_area` VALUES ('1577', '莒南县', '1470', '0,16,1470', '0', '1577', '1577', '0', '0');
INSERT INTO `sx_area` VALUES ('1578', '蒙阴县', '1470', '0,16,1470', '0', '1578', '1578', '0', '0');
INSERT INTO `sx_area` VALUES ('1579', '临沭县', '1470', '0,16,1470', '0', '1579', '1579', '0', '0');
INSERT INTO `sx_area` VALUES ('1580', '德城区', '1471', '0,16,1471', '0', '1580', '1580', '0', '0');
INSERT INTO `sx_area` VALUES ('1581', '陵县', '1471', '0,16,1471', '0', '1581', '1581', '0', '0');
INSERT INTO `sx_area` VALUES ('1582', '宁津县', '1471', '0,16,1471', '0', '1582', '1582', '0', '0');
INSERT INTO `sx_area` VALUES ('1583', '庆云县', '1471', '0,16,1471', '0', '1583', '1583', '0', '0');
INSERT INTO `sx_area` VALUES ('1584', '临邑县', '1471', '0,16,1471', '0', '1584', '1584', '0', '0');
INSERT INTO `sx_area` VALUES ('1585', '齐河县', '1471', '0,16,1471', '0', '1585', '1585', '0', '0');
INSERT INTO `sx_area` VALUES ('1586', '平原县', '1471', '0,16,1471', '0', '1586', '1586', '0', '0');
INSERT INTO `sx_area` VALUES ('1587', '夏津县', '1471', '0,16,1471', '0', '1587', '1587', '0', '0');
INSERT INTO `sx_area` VALUES ('1588', '武城县', '1471', '0,16,1471', '0', '1588', '1588', '0', '0');
INSERT INTO `sx_area` VALUES ('1589', '乐陵市', '1471', '0,16,1471', '0', '1589', '1589', '0', '0');
INSERT INTO `sx_area` VALUES ('1590', '禹城市', '1471', '0,16,1471', '0', '1590', '1590', '0', '0');
INSERT INTO `sx_area` VALUES ('1591', '东昌府区', '1472', '0,16,1472', '0', '1591', '1591', '0', '0');
INSERT INTO `sx_area` VALUES ('1592', '阳谷县', '1472', '0,16,1472', '0', '1592', '1592', '0', '0');
INSERT INTO `sx_area` VALUES ('1593', '莘县', '1472', '0,16,1472', '0', '1593', '1593', '0', '0');
INSERT INTO `sx_area` VALUES ('1594', '茌平县', '1472', '0,16,1472', '0', '1594', '1594', '0', '0');
INSERT INTO `sx_area` VALUES ('1595', '东阿县', '1472', '0,16,1472', '0', '1595', '1595', '0', '0');
INSERT INTO `sx_area` VALUES ('1596', '冠县', '1472', '0,16,1472', '0', '1596', '1596', '0', '0');
INSERT INTO `sx_area` VALUES ('1597', '高唐县', '1472', '0,16,1472', '0', '1597', '1597', '0', '0');
INSERT INTO `sx_area` VALUES ('1598', '临清市', '1472', '0,16,1472', '0', '1598', '1598', '0', '0');
INSERT INTO `sx_area` VALUES ('1599', '滨城区', '1473', '0,16,1473', '0', '1599', '1599', '0', '0');
INSERT INTO `sx_area` VALUES ('1600', '惠民县', '1473', '0,16,1473', '0', '1600', '1600', '0', '0');
INSERT INTO `sx_area` VALUES ('1601', '阳信县', '1473', '0,16,1473', '0', '1601', '1601', '0', '0');
INSERT INTO `sx_area` VALUES ('1602', '无棣县', '1473', '0,16,1473', '0', '1602', '1602', '0', '0');
INSERT INTO `sx_area` VALUES ('1603', '沾化县', '1473', '0,16,1473', '0', '1603', '1603', '0', '0');
INSERT INTO `sx_area` VALUES ('1604', '博兴县', '1473', '0,16,1473', '0', '1604', '1604', '0', '0');
INSERT INTO `sx_area` VALUES ('1605', '邹平县', '1473', '0,16,1473', '0', '1605', '1605', '0', '0');
INSERT INTO `sx_area` VALUES ('1606', '牡丹区', '1474', '0,16,1474', '0', '1606', '1606', '0', '0');
INSERT INTO `sx_area` VALUES ('1607', '曹县', '1474', '0,16,1474', '0', '1607', '1607', '0', '0');
INSERT INTO `sx_area` VALUES ('1608', '单县', '1474', '0,16,1474', '0', '1608', '1608', '0', '0');
INSERT INTO `sx_area` VALUES ('1609', '成武县', '1474', '0,16,1474', '0', '1609', '1609', '0', '0');
INSERT INTO `sx_area` VALUES ('1610', '巨野县', '1474', '0,16,1474', '0', '1610', '1610', '0', '0');
INSERT INTO `sx_area` VALUES ('1611', '郓城县', '1474', '0,16,1474', '0', '1611', '1611', '0', '0');
INSERT INTO `sx_area` VALUES ('1612', '鄄城县', '1474', '0,16,1474', '0', '1612', '1612', '0', '0');
INSERT INTO `sx_area` VALUES ('1613', '定陶县', '1474', '0,16,1474', '0', '1613', '1613', '0', '0');
INSERT INTO `sx_area` VALUES ('1614', '东明县', '1474', '0,16,1474', '0', '1614', '1614', '0', '0');
INSERT INTO `sx_area` VALUES ('1615', '郑州市', '17', '0,17', '1', '1615,1633,1634,1635,1636,1637,1638,1639,1640,1641,1642,1643,1644', '1615', '0', '0');
INSERT INTO `sx_area` VALUES ('1616', '开封市', '17', '0,17', '1', '1616,1645,1646,1647,1648,1649,1650,1651,1652,1653,1654', '1616', '0', '0');
INSERT INTO `sx_area` VALUES ('1617', '洛阳市', '17', '0,17', '1', '1617,1655,1656,1657,1658,1659,1660,1661,1662,1663,1664,1665,1666,1667,1668,1669', '1617', '0', '0');
INSERT INTO `sx_area` VALUES ('1618', '平顶山市', '17', '0,17', '1', '1618,1670,1671,1672,1673,1674,1675,1676,1677,1678,1679', '1618', '0', '0');
INSERT INTO `sx_area` VALUES ('1619', '安阳市', '17', '0,17', '1', '1619,1680,1681,1682,1683,1684,1685,1686,1687,1688', '1619', '0', '0');
INSERT INTO `sx_area` VALUES ('1620', '鹤壁市', '17', '0,17', '1', '1620,1689,1690,1691,1692,1693', '1620', '0', '0');
INSERT INTO `sx_area` VALUES ('1621', '新乡市', '17', '0,17', '1', '1621,1694,1695,1696,1697,1698,1699,1700,1701,1702,1703,1704,1705', '1621', '0', '0');
INSERT INTO `sx_area` VALUES ('1622', '焦作市', '17', '0,17', '1', '1622,1706,1707,1708,1709,1710,1711,1712,1713,1714,1715', '1622', '0', '0');
INSERT INTO `sx_area` VALUES ('1623', '濮阳市', '17', '0,17', '1', '1623,1716,1717,1718,1719,1720,1721', '1623', '0', '0');
INSERT INTO `sx_area` VALUES ('1624', '许昌市', '17', '0,17', '1', '1624,1722,1723,1724,1725,1726,1727', '1624', '0', '0');
INSERT INTO `sx_area` VALUES ('1625', '漯河市', '17', '0,17', '1', '1625,1728,1729,1730,1731', '1625', '0', '0');
INSERT INTO `sx_area` VALUES ('1626', '三门峡市', '17', '0,17', '1', '1626,1732,1733,1734,1735,1736,1737', '1626', '0', '0');
INSERT INTO `sx_area` VALUES ('1627', '南阳市', '17', '0,17', '1', '1627,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750', '1627', '0', '0');
INSERT INTO `sx_area` VALUES ('1628', '商丘市', '17', '0,17', '1', '1628,1770,1771,1772,1773,1774,1775,1776,1777,1778', '1628', '0', '0');
INSERT INTO `sx_area` VALUES ('1629', '信阳市', '17', '0,17', '1', '1629,1779,1780,1781,1782,1783,1784,1785,1786,1787,1788', '1629', '0', '0');
INSERT INTO `sx_area` VALUES ('1630', '周口市', '17', '0,17', '1', '1630,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798', '1630', '0', '0');
INSERT INTO `sx_area` VALUES ('1631', '驻马店市', '17', '0,17', '1', '1631,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808', '1631', '0', '0');
INSERT INTO `sx_area` VALUES ('1632', '济源市', '17', '0,17', '1', '1632,1809', '1632', '0', '0');
INSERT INTO `sx_area` VALUES ('1633', '中原区', '1615', '0,17,1615', '0', '1633', '1633', '0', '0');
INSERT INTO `sx_area` VALUES ('1634', '二七区', '1615', '0,17,1615', '0', '1634', '1634', '0', '0');
INSERT INTO `sx_area` VALUES ('1635', '管城回族区', '1615', '0,17,1615', '0', '1635', '1635', '0', '0');
INSERT INTO `sx_area` VALUES ('1636', '金水区', '1615', '0,17,1615', '0', '1636', '1636', '0', '0');
INSERT INTO `sx_area` VALUES ('1637', '上街区', '1615', '0,17,1615', '0', '1637', '1637', '0', '0');
INSERT INTO `sx_area` VALUES ('1638', '邙山区', '1615', '0,17,1615', '0', '1638', '1638', '0', '0');
INSERT INTO `sx_area` VALUES ('1639', '中牟县', '1615', '0,17,1615', '0', '1639', '1639', '0', '0');
INSERT INTO `sx_area` VALUES ('1640', '巩义市', '1615', '0,17,1615', '0', '1640', '1640', '0', '0');
INSERT INTO `sx_area` VALUES ('1641', '荥阳市', '1615', '0,17,1615', '0', '1641', '1641', '0', '0');
INSERT INTO `sx_area` VALUES ('1642', '新密市', '1615', '0,17,1615', '0', '1642', '1642', '0', '0');
INSERT INTO `sx_area` VALUES ('1643', '新郑市', '1615', '0,17,1615', '0', '1643', '1643', '0', '0');
INSERT INTO `sx_area` VALUES ('1644', '登封市', '1615', '0,17,1615', '0', '1644', '1644', '0', '0');
INSERT INTO `sx_area` VALUES ('1645', '龙亭区', '1616', '0,17,1616', '0', '1645', '1645', '0', '0');
INSERT INTO `sx_area` VALUES ('1646', '顺河回族区', '1616', '0,17,1616', '0', '1646', '1646', '0', '0');
INSERT INTO `sx_area` VALUES ('1647', '鼓楼区', '1616', '0,17,1616', '0', '1647', '1647', '0', '0');
INSERT INTO `sx_area` VALUES ('1648', '南关区', '1616', '0,17,1616', '0', '1648', '1648', '0', '0');
INSERT INTO `sx_area` VALUES ('1649', '郊区', '1616', '0,17,1616', '0', '1649', '1649', '0', '0');
INSERT INTO `sx_area` VALUES ('1650', '杞县', '1616', '0,17,1616', '0', '1650', '1650', '0', '0');
INSERT INTO `sx_area` VALUES ('1651', '通许县', '1616', '0,17,1616', '0', '1651', '1651', '0', '0');
INSERT INTO `sx_area` VALUES ('1652', '尉氏县', '1616', '0,17,1616', '0', '1652', '1652', '0', '0');
INSERT INTO `sx_area` VALUES ('1653', '开封县', '1616', '0,17,1616', '0', '1653', '1653', '0', '0');
INSERT INTO `sx_area` VALUES ('1654', '兰考县', '1616', '0,17,1616', '0', '1654', '1654', '0', '0');
INSERT INTO `sx_area` VALUES ('1655', '老城区', '1617', '0,17,1617', '0', '1655', '1655', '0', '0');
INSERT INTO `sx_area` VALUES ('1656', '西工区', '1617', '0,17,1617', '0', '1656', '1656', '0', '0');
INSERT INTO `sx_area` VALUES ('1657', '廛河回族区', '1617', '0,17,1617', '0', '1657', '1657', '0', '0');
INSERT INTO `sx_area` VALUES ('1658', '涧西区', '1617', '0,17,1617', '0', '1658', '1658', '0', '0');
INSERT INTO `sx_area` VALUES ('1659', '吉利区', '1617', '0,17,1617', '0', '1659', '1659', '0', '0');
INSERT INTO `sx_area` VALUES ('1660', '洛龙区', '1617', '0,17,1617', '0', '1660', '1660', '0', '0');
INSERT INTO `sx_area` VALUES ('1661', '孟津县', '1617', '0,17,1617', '0', '1661', '1661', '0', '0');
INSERT INTO `sx_area` VALUES ('1662', '新安县', '1617', '0,17,1617', '0', '1662', '1662', '0', '0');
INSERT INTO `sx_area` VALUES ('1663', '栾川县', '1617', '0,17,1617', '0', '1663', '1663', '0', '0');
INSERT INTO `sx_area` VALUES ('1664', '嵩县', '1617', '0,17,1617', '0', '1664', '1664', '0', '0');
INSERT INTO `sx_area` VALUES ('1665', '汝阳县', '1617', '0,17,1617', '0', '1665', '1665', '0', '0');
INSERT INTO `sx_area` VALUES ('1666', '宜阳县', '1617', '0,17,1617', '0', '1666', '1666', '0', '0');
INSERT INTO `sx_area` VALUES ('1667', '洛宁县', '1617', '0,17,1617', '0', '1667', '1667', '0', '0');
INSERT INTO `sx_area` VALUES ('1668', '伊川县', '1617', '0,17,1617', '0', '1668', '1668', '0', '0');
INSERT INTO `sx_area` VALUES ('1669', '偃师市', '1617', '0,17,1617', '0', '1669', '1669', '0', '0');
INSERT INTO `sx_area` VALUES ('1670', '新华区', '1618', '0,17,1618', '0', '1670', '1670', '0', '0');
INSERT INTO `sx_area` VALUES ('1671', '卫东区', '1618', '0,17,1618', '0', '1671', '1671', '0', '0');
INSERT INTO `sx_area` VALUES ('1672', '石龙区', '1618', '0,17,1618', '0', '1672', '1672', '0', '0');
INSERT INTO `sx_area` VALUES ('1673', '湛河区', '1618', '0,17,1618', '0', '1673', '1673', '0', '0');
INSERT INTO `sx_area` VALUES ('1674', '宝丰县', '1618', '0,17,1618', '0', '1674', '1674', '0', '0');
INSERT INTO `sx_area` VALUES ('1675', '叶县', '1618', '0,17,1618', '0', '1675', '1675', '0', '0');
INSERT INTO `sx_area` VALUES ('1676', '鲁山县', '1618', '0,17,1618', '0', '1676', '1676', '0', '0');
INSERT INTO `sx_area` VALUES ('1677', '郏县', '1618', '0,17,1618', '0', '1677', '1677', '0', '0');
INSERT INTO `sx_area` VALUES ('1678', '舞钢市', '1618', '0,17,1618', '0', '1678', '1678', '0', '0');
INSERT INTO `sx_area` VALUES ('1679', '汝州市', '1618', '0,17,1618', '0', '1679', '1679', '0', '0');
INSERT INTO `sx_area` VALUES ('1680', '文峰区', '1619', '0,17,1619', '0', '1680', '1680', '0', '0');
INSERT INTO `sx_area` VALUES ('1681', '北关区', '1619', '0,17,1619', '0', '1681', '1681', '0', '0');
INSERT INTO `sx_area` VALUES ('1682', '殷都区', '1619', '0,17,1619', '0', '1682', '1682', '0', '0');
INSERT INTO `sx_area` VALUES ('1683', '龙安区', '1619', '0,17,1619', '0', '1683', '1683', '0', '0');
INSERT INTO `sx_area` VALUES ('1684', '安阳县', '1619', '0,17,1619', '0', '1684', '1684', '0', '0');
INSERT INTO `sx_area` VALUES ('1685', '汤阴县', '1619', '0,17,1619', '0', '1685', '1685', '0', '0');
INSERT INTO `sx_area` VALUES ('1686', '滑县', '1619', '0,17,1619', '0', '1686', '1686', '0', '0');
INSERT INTO `sx_area` VALUES ('1687', '内黄县', '1619', '0,17,1619', '0', '1687', '1687', '0', '0');
INSERT INTO `sx_area` VALUES ('1688', '林州市', '1619', '0,17,1619', '0', '1688', '1688', '0', '0');
INSERT INTO `sx_area` VALUES ('1689', '鹤山区', '1620', '0,17,1620', '0', '1689', '1689', '0', '0');
INSERT INTO `sx_area` VALUES ('1690', '山城区', '1620', '0,17,1620', '0', '1690', '1690', '0', '0');
INSERT INTO `sx_area` VALUES ('1691', '淇滨区', '1620', '0,17,1620', '0', '1691', '1691', '0', '0');
INSERT INTO `sx_area` VALUES ('1692', '浚县', '1620', '0,17,1620', '0', '1692', '1692', '0', '0');
INSERT INTO `sx_area` VALUES ('1693', '淇县', '1620', '0,17,1620', '0', '1693', '1693', '0', '0');
INSERT INTO `sx_area` VALUES ('1694', '红旗区', '1621', '0,17,1621', '0', '1694', '1694', '0', '0');
INSERT INTO `sx_area` VALUES ('1695', '新华区', '1621', '0,17,1621', '0', '1695', '1695', '0', '0');
INSERT INTO `sx_area` VALUES ('1696', '北站区', '1621', '0,17,1621', '0', '1696', '1696', '0', '0');
INSERT INTO `sx_area` VALUES ('1697', '郊区', '1621', '0,17,1621', '0', '1697', '1697', '0', '0');
INSERT INTO `sx_area` VALUES ('1698', '新乡县', '1621', '0,17,1621', '0', '1698', '1698', '0', '0');
INSERT INTO `sx_area` VALUES ('1699', '获嘉县', '1621', '0,17,1621', '0', '1699', '1699', '0', '0');
INSERT INTO `sx_area` VALUES ('1700', '原阳县', '1621', '0,17,1621', '0', '1700', '1700', '0', '0');
INSERT INTO `sx_area` VALUES ('1701', '延津县', '1621', '0,17,1621', '0', '1701', '1701', '0', '0');
INSERT INTO `sx_area` VALUES ('1702', '封丘县', '1621', '0,17,1621', '0', '1702', '1702', '0', '0');
INSERT INTO `sx_area` VALUES ('1703', '长垣县', '1621', '0,17,1621', '0', '1703', '1703', '0', '0');
INSERT INTO `sx_area` VALUES ('1704', '卫辉市', '1621', '0,17,1621', '0', '1704', '1704', '0', '0');
INSERT INTO `sx_area` VALUES ('1705', '辉县市', '1621', '0,17,1621', '0', '1705', '1705', '0', '0');
INSERT INTO `sx_area` VALUES ('1706', '解放区', '1622', '0,17,1622', '0', '1706', '1706', '0', '0');
INSERT INTO `sx_area` VALUES ('1707', '中站区', '1622', '0,17,1622', '0', '1707', '1707', '0', '0');
INSERT INTO `sx_area` VALUES ('1708', '马村区', '1622', '0,17,1622', '0', '1708', '1708', '0', '0');
INSERT INTO `sx_area` VALUES ('1709', '山阳区', '1622', '0,17,1622', '0', '1709', '1709', '0', '0');
INSERT INTO `sx_area` VALUES ('1710', '修武县', '1622', '0,17,1622', '0', '1710', '1710', '0', '0');
INSERT INTO `sx_area` VALUES ('1711', '博爱县', '1622', '0,17,1622', '0', '1711', '1711', '0', '0');
INSERT INTO `sx_area` VALUES ('1712', '武陟县', '1622', '0,17,1622', '0', '1712', '1712', '0', '0');
INSERT INTO `sx_area` VALUES ('1713', '温县', '1622', '0,17,1622', '0', '1713', '1713', '0', '0');
INSERT INTO `sx_area` VALUES ('1714', '沁阳市', '1622', '0,17,1622', '0', '1714', '1714', '0', '0');
INSERT INTO `sx_area` VALUES ('1715', '孟州市', '1622', '0,17,1622', '0', '1715', '1715', '0', '0');
INSERT INTO `sx_area` VALUES ('1716', '华龙区', '1623', '0,17,1623', '0', '1716', '1716', '0', '0');
INSERT INTO `sx_area` VALUES ('1717', '清丰县', '1623', '0,17,1623', '0', '1717', '1717', '0', '0');
INSERT INTO `sx_area` VALUES ('1718', '南乐县', '1623', '0,17,1623', '0', '1718', '1718', '0', '0');
INSERT INTO `sx_area` VALUES ('1719', '范县', '1623', '0,17,1623', '0', '1719', '1719', '0', '0');
INSERT INTO `sx_area` VALUES ('1720', '台前县', '1623', '0,17,1623', '0', '1720', '1720', '0', '0');
INSERT INTO `sx_area` VALUES ('1721', '濮阳县', '1623', '0,17,1623', '0', '1721', '1721', '0', '0');
INSERT INTO `sx_area` VALUES ('1722', '魏都区', '1624', '0,17,1624', '0', '1722', '1722', '0', '0');
INSERT INTO `sx_area` VALUES ('1723', '许昌县', '1624', '0,17,1624', '0', '1723', '1723', '0', '0');
INSERT INTO `sx_area` VALUES ('1724', '鄢陵县', '1624', '0,17,1624', '0', '1724', '1724', '0', '0');
INSERT INTO `sx_area` VALUES ('1725', '襄城县', '1624', '0,17,1624', '0', '1725', '1725', '0', '0');
INSERT INTO `sx_area` VALUES ('1726', '禹州市', '1624', '0,17,1624', '0', '1726', '1726', '0', '0');
INSERT INTO `sx_area` VALUES ('1727', '长葛市', '1624', '0,17,1624', '0', '1727', '1727', '0', '0');
INSERT INTO `sx_area` VALUES ('1728', '源汇区', '1625', '0,17,1625', '0', '1728', '1728', '0', '0');
INSERT INTO `sx_area` VALUES ('1729', '舞阳县', '1625', '0,17,1625', '0', '1729', '1729', '0', '0');
INSERT INTO `sx_area` VALUES ('1730', '临颍县', '1625', '0,17,1625', '0', '1730', '1730', '0', '0');
INSERT INTO `sx_area` VALUES ('1731', '郾城县', '1625', '0,17,1625', '0', '1731', '1731', '0', '0');
INSERT INTO `sx_area` VALUES ('1732', '湖滨区', '1626', '0,17,1626', '0', '1732', '1732', '0', '0');
INSERT INTO `sx_area` VALUES ('1733', '渑池县', '1626', '0,17,1626', '0', '1733', '1733', '0', '0');
INSERT INTO `sx_area` VALUES ('1734', '陕县', '1626', '0,17,1626', '0', '1734', '1734', '0', '0');
INSERT INTO `sx_area` VALUES ('1735', '卢氏县', '1626', '0,17,1626', '0', '1735', '1735', '0', '0');
INSERT INTO `sx_area` VALUES ('1736', '义马市', '1626', '0,17,1626', '0', '1736', '1736', '0', '0');
INSERT INTO `sx_area` VALUES ('1737', '灵宝市', '1626', '0,17,1626', '0', '1737', '1737', '0', '0');
INSERT INTO `sx_area` VALUES ('1738', '宛城区', '1627', '0,17,1627', '0', '1738', '1738', '0', '0');
INSERT INTO `sx_area` VALUES ('1739', '卧龙区', '1627', '0,17,1627', '0', '1739', '1739', '0', '0');
INSERT INTO `sx_area` VALUES ('1740', '南召县', '1627', '0,17,1627', '0', '1740', '1740', '0', '0');
INSERT INTO `sx_area` VALUES ('1741', '方城县', '1627', '0,17,1627', '0', '1741', '1741', '0', '0');
INSERT INTO `sx_area` VALUES ('1742', '西峡县', '1627', '0,17,1627', '0', '1742', '1742', '0', '0');
INSERT INTO `sx_area` VALUES ('1743', '镇平县', '1627', '0,17,1627', '0', '1743', '1743', '0', '0');
INSERT INTO `sx_area` VALUES ('1744', '内乡县', '1627', '0,17,1627', '0', '1744', '1744', '0', '0');
INSERT INTO `sx_area` VALUES ('1745', '淅川县', '1627', '0,17,1627', '0', '1745', '1745', '0', '0');
INSERT INTO `sx_area` VALUES ('1746', '社旗县', '1627', '0,17,1627', '0', '1746', '1746', '0', '0');
INSERT INTO `sx_area` VALUES ('1747', '唐河县', '1627', '0,17,1627', '0', '1747', '1747', '0', '0');
INSERT INTO `sx_area` VALUES ('1748', '新野县', '1627', '0,17,1627', '0', '1748', '1748', '0', '0');
INSERT INTO `sx_area` VALUES ('1749', '桐柏县', '1627', '0,17,1627', '0', '1749', '1749', '0', '0');
INSERT INTO `sx_area` VALUES ('1750', '邓州市', '1627', '0,17,1627', '0', '1750', '1750', '0', '0');
INSERT INTO `sx_area` VALUES ('1788', '息县', '1629', '0,17,1629', '0', '1788', '1788', '0', '0');
INSERT INTO `sx_area` VALUES ('1787', '淮滨县', '1629', '0,17,1629', '0', '1787', '1787', '0', '0');
INSERT INTO `sx_area` VALUES ('1786', '潢川县', '1629', '0,17,1629', '0', '1786', '1786', '0', '0');
INSERT INTO `sx_area` VALUES ('1785', '固始县', '1629', '0,17,1629', '0', '1785', '1785', '0', '0');
INSERT INTO `sx_area` VALUES ('1784', '商城县', '1629', '0,17,1629', '0', '1784', '1784', '0', '0');
INSERT INTO `sx_area` VALUES ('1783', '新县', '1629', '0,17,1629', '0', '1783', '1783', '0', '0');
INSERT INTO `sx_area` VALUES ('1782', '光山县', '1629', '0,17,1629', '0', '1782', '1782', '0', '0');
INSERT INTO `sx_area` VALUES ('1781', '罗山县', '1629', '0,17,1629', '0', '1781', '1781', '0', '0');
INSERT INTO `sx_area` VALUES ('1780', '平桥区', '1629', '0,17,1629', '0', '1780', '1780', '0', '0');
INSERT INTO `sx_area` VALUES ('1779', '师河区', '1629', '0,17,1629', '0', '1779', '1779', '0', '0');
INSERT INTO `sx_area` VALUES ('1771', '睢阳区', '1628', '0,17,1628', '0', '1771', '1771', '0', '0');
INSERT INTO `sx_area` VALUES ('1772', '民权县', '1628', '0,17,1628', '0', '1772', '1772', '0', '0');
INSERT INTO `sx_area` VALUES ('1773', '睢县', '1628', '0,17,1628', '0', '1773', '1773', '0', '0');
INSERT INTO `sx_area` VALUES ('1774', '宁陵县', '1628', '0,17,1628', '0', '1774', '1774', '0', '0');
INSERT INTO `sx_area` VALUES ('1775', '柘城县', '1628', '0,17,1628', '0', '1775', '1775', '0', '0');
INSERT INTO `sx_area` VALUES ('1776', '虞城县', '1628', '0,17,1628', '0', '1776', '1776', '0', '0');
INSERT INTO `sx_area` VALUES ('1777', '夏邑县', '1628', '0,17,1628', '0', '1777', '1777', '0', '0');
INSERT INTO `sx_area` VALUES ('1778', '永城市', '1628', '0,17,1628', '0', '1778', '1778', '0', '0');
INSERT INTO `sx_area` VALUES ('1770', '梁园区', '1628', '0,17,1628', '0', '1770', '1770', '0', '0');
INSERT INTO `sx_area` VALUES ('1789', '川汇区', '1630', '0,17,1630', '0', '1789', '1789', '0', '0');
INSERT INTO `sx_area` VALUES ('1790', '扶沟县', '1630', '0,17,1630', '0', '1790', '1790', '0', '0');
INSERT INTO `sx_area` VALUES ('1791', '西华县', '1630', '0,17,1630', '0', '1791', '1791', '0', '0');
INSERT INTO `sx_area` VALUES ('1792', '商水县', '1630', '0,17,1630', '0', '1792', '1792', '0', '0');
INSERT INTO `sx_area` VALUES ('1793', '沈丘县', '1630', '0,17,1630', '0', '1793', '1793', '0', '0');
INSERT INTO `sx_area` VALUES ('1794', '郸城县', '1630', '0,17,1630', '0', '1794', '1794', '0', '0');
INSERT INTO `sx_area` VALUES ('1795', '淮阳县', '1630', '0,17,1630', '0', '1795', '1795', '0', '0');
INSERT INTO `sx_area` VALUES ('1796', '太康县', '1630', '0,17,1630', '0', '1796', '1796', '0', '0');
INSERT INTO `sx_area` VALUES ('1797', '鹿邑县', '1630', '0,17,1630', '0', '1797', '1797', '0', '0');
INSERT INTO `sx_area` VALUES ('1798', '项城市', '1630', '0,17,1630', '0', '1798', '1798', '0', '0');
INSERT INTO `sx_area` VALUES ('1799', '驿城区', '1631', '0,17,1631', '0', '1799', '1799', '0', '0');
INSERT INTO `sx_area` VALUES ('1800', '西平县', '1631', '0,17,1631', '0', '1800', '1800', '0', '0');
INSERT INTO `sx_area` VALUES ('1801', '上蔡县', '1631', '0,17,1631', '0', '1801', '1801', '0', '0');
INSERT INTO `sx_area` VALUES ('1802', '平舆县', '1631', '0,17,1631', '0', '1802', '1802', '0', '0');
INSERT INTO `sx_area` VALUES ('1803', '正阳县', '1631', '0,17,1631', '0', '1803', '1803', '0', '0');
INSERT INTO `sx_area` VALUES ('1804', '确山县', '1631', '0,17,1631', '0', '1804', '1804', '0', '0');
INSERT INTO `sx_area` VALUES ('1805', '泌阳县', '1631', '0,17,1631', '0', '1805', '1805', '0', '0');
INSERT INTO `sx_area` VALUES ('1806', '汝南县', '1631', '0,17,1631', '0', '1806', '1806', '0', '0');
INSERT INTO `sx_area` VALUES ('1807', '遂平县', '1631', '0,17,1631', '0', '1807', '1807', '0', '0');
INSERT INTO `sx_area` VALUES ('1808', '新蔡县', '1631', '0,17,1631', '0', '1808', '1808', '0', '0');
INSERT INTO `sx_area` VALUES ('1809', '济源市', '1632', '0,17,1632', '0', '1809', '1809', '0', '0');
INSERT INTO `sx_area` VALUES ('1810', '武汉市', '18', '0,18', '1', '1810,1824,1825,1826,1827,1828,1829,1830,1831,1832,1833,1834,1835,1836,1837,1838,1839', '1810', '0', '0');
INSERT INTO `sx_area` VALUES ('1811', '黄石市', '18', '0,18', '1', '1811,1840,1841,1842,1843,1844,1845', '1811', '0', '0');
INSERT INTO `sx_area` VALUES ('1812', '十堰市', '18', '0,18', '1', '1812,1846,1847,1848,1849,1850,1851,1852,1853', '1812', '0', '0');
INSERT INTO `sx_area` VALUES ('1813', '宜昌市', '18', '0,18', '1', '1813,1854,1855,1856,1857,1858,1859,1860,1861,1862,1863,1864,1865,1866', '1813', '0', '0');
INSERT INTO `sx_area` VALUES ('1814', '襄阳市', '18', '0,18', '1', '1814,1867,1868,1869,1870,1871,1872,1873,1874,1875', '1814', '0', '0');
INSERT INTO `sx_area` VALUES ('1815', '鄂州市', '18', '0,18', '1', '1815,1876,1877,1878', '1815', '0', '0');
INSERT INTO `sx_area` VALUES ('1816', '荆门市', '18', '0,18', '1', '1816,1879,1880,1881,1882,1883', '1816', '0', '0');
INSERT INTO `sx_area` VALUES ('1817', '孝感市', '18', '0,18', '1', '1817,1884,1885,1886,1887,1888,1889,1890', '1817', '0', '0');
INSERT INTO `sx_area` VALUES ('1818', '荆州市', '18', '0,18', '1', '1818,1891,1892,1893,1894,1895,1896,1897,1898', '1818', '0', '0');
INSERT INTO `sx_area` VALUES ('1819', '黄冈市', '18', '0,18', '1', '1819,1899,1900,1901,1902,1903,1904,1905,1906,1907,1908', '1819', '0', '0');
INSERT INTO `sx_area` VALUES ('1820', '咸宁市', '18', '0,18', '1', '1820,1909,1910,1911,1912,1913,1914', '1820', '0', '0');
INSERT INTO `sx_area` VALUES ('1821', '随州市', '18', '0,18', '1', '1821,1915,1916', '1821', '0', '0');
INSERT INTO `sx_area` VALUES ('1822', '恩施土家族苗族自治州', '18', '0,18', '1', '1822,1917,1918,1919,1920,1921,1922,1923,1924', '1822', '0', '0');
INSERT INTO `sx_area` VALUES ('1823', '省直辖行政单位', '18', '0,18', '1', '1823,1925,1926,1927,1928', '1823', '0', '0');
INSERT INTO `sx_area` VALUES ('1824', '江岸区', '1810', '0,18,1810', '0', '1824', '1824', '0', '0');
INSERT INTO `sx_area` VALUES ('1825', '江汉区', '1810', '0,18,1810', '0', '1825', '1825', '0', '0');
INSERT INTO `sx_area` VALUES ('1826', '乔口区', '1810', '0,18,1810', '0', '1826', '1826', '0', '0');
INSERT INTO `sx_area` VALUES ('1827', '汉阳区', '1810', '0,18,1810', '0', '1827', '1827', '0', '0');
INSERT INTO `sx_area` VALUES ('1828', '武昌区', '1810', '0,18,1810', '0', '1828', '1828', '0', '0');
INSERT INTO `sx_area` VALUES ('1829', '青山区', '1810', '0,18,1810', '0', '1829', '1829', '0', '0');
INSERT INTO `sx_area` VALUES ('1830', '洪山区', '1810', '0,18,1810', '0', '1830', '1830', '0', '0');
INSERT INTO `sx_area` VALUES ('1831', '东西湖区', '1810', '0,18,1810', '0', '1831', '1831', '0', '0');
INSERT INTO `sx_area` VALUES ('1832', '汉南区', '1810', '0,18,1810', '0', '1832', '1832', '0', '0');
INSERT INTO `sx_area` VALUES ('1833', '蔡甸区', '1810', '0,18,1810', '0', '1833', '1833', '0', '0');
INSERT INTO `sx_area` VALUES ('1834', '江夏区', '1810', '0,18,1810', '0', '1834', '1834', '0', '0');
INSERT INTO `sx_area` VALUES ('1835', '黄陂区', '1810', '0,18,1810', '0', '1835', '1835', '0', '0');
INSERT INTO `sx_area` VALUES ('1836', '新洲区', '1810', '0,18,1810', '0', '1836', '1836', '0', '0');
INSERT INTO `sx_area` VALUES ('1837', '东湖高新区', '1810', '0,18,1810', '0', '1837', '1837', '0', '0');
INSERT INTO `sx_area` VALUES ('1838', '文保区', '1810', '0,18,1810', '0', '1838', '1838', '0', '0');
INSERT INTO `sx_area` VALUES ('1839', '沌口区', '1810', '0,18,1810', '0', '1839', '1839', '0', '0');
INSERT INTO `sx_area` VALUES ('1840', '黄石港区', '1811', '0,18,1811', '0', '1840', '1840', '0', '0');
INSERT INTO `sx_area` VALUES ('1841', '西塞山区', '1811', '0,18,1811', '0', '1841', '1841', '0', '0');
INSERT INTO `sx_area` VALUES ('1842', '下陆区', '1811', '0,18,1811', '0', '1842', '1842', '0', '0');
INSERT INTO `sx_area` VALUES ('1843', '铁山区', '1811', '0,18,1811', '0', '1843', '1843', '0', '0');
INSERT INTO `sx_area` VALUES ('1844', '阳新县', '1811', '0,18,1811', '0', '1844', '1844', '0', '0');
INSERT INTO `sx_area` VALUES ('1845', '大冶市', '1811', '0,18,1811', '0', '1845', '1845', '0', '0');
INSERT INTO `sx_area` VALUES ('1846', '茅箭区', '1812', '0,18,1812', '0', '1846', '1846', '0', '0');
INSERT INTO `sx_area` VALUES ('1847', '张湾区', '1812', '0,18,1812', '0', '1847', '1847', '0', '0');
INSERT INTO `sx_area` VALUES ('1848', '郧县', '1812', '0,18,1812', '0', '1848', '1848', '0', '0');
INSERT INTO `sx_area` VALUES ('1849', '郧西县', '1812', '0,18,1812', '0', '1849', '1849', '0', '0');
INSERT INTO `sx_area` VALUES ('1850', '竹山县', '1812', '0,18,1812', '0', '1850', '1850', '0', '0');
INSERT INTO `sx_area` VALUES ('1851', '竹溪县', '1812', '0,18,1812', '0', '1851', '1851', '0', '0');
INSERT INTO `sx_area` VALUES ('1852', '房县', '1812', '0,18,1812', '0', '1852', '1852', '0', '0');
INSERT INTO `sx_area` VALUES ('1853', '丹江口市', '1812', '0,18,1812', '0', '1853', '1853', '0', '0');
INSERT INTO `sx_area` VALUES ('1854', '西陵区', '1813', '0,18,1813', '0', '1854', '1854', '0', '0');
INSERT INTO `sx_area` VALUES ('1855', '伍家岗区', '1813', '0,18,1813', '0', '1855', '1855', '0', '0');
INSERT INTO `sx_area` VALUES ('1856', '点军区', '1813', '0,18,1813', '0', '1856', '1856', '0', '0');
INSERT INTO `sx_area` VALUES ('1857', '虎亭区', '1813', '0,18,1813', '0', '1857', '1857', '0', '0');
INSERT INTO `sx_area` VALUES ('1858', '夷陵区', '1813', '0,18,1813', '0', '1858', '1858', '0', '0');
INSERT INTO `sx_area` VALUES ('1859', '远安县', '1813', '0,18,1813', '0', '1859', '1859', '0', '0');
INSERT INTO `sx_area` VALUES ('1860', '兴山县', '1813', '0,18,1813', '0', '1860', '1860', '0', '0');
INSERT INTO `sx_area` VALUES ('1861', '秭归县', '1813', '0,18,1813', '0', '1861', '1861', '0', '0');
INSERT INTO `sx_area` VALUES ('1862', '长阳土家族自治县', '1813', '0,18,1813', '0', '1862', '1862', '0', '0');
INSERT INTO `sx_area` VALUES ('1863', '五峰土家族自治县', '1813', '0,18,1813', '0', '1863', '1863', '0', '0');
INSERT INTO `sx_area` VALUES ('1864', '宜都市', '1813', '0,18,1813', '0', '1864', '1864', '0', '0');
INSERT INTO `sx_area` VALUES ('1865', '当阳市', '1813', '0,18,1813', '0', '1865', '1865', '0', '0');
INSERT INTO `sx_area` VALUES ('1866', '枝江市', '1813', '0,18,1813', '0', '1866', '1866', '0', '0');
INSERT INTO `sx_area` VALUES ('1867', '襄城区', '1814', '0,18,1814', '0', '1867', '1867', '0', '0');
INSERT INTO `sx_area` VALUES ('1868', '樊城区', '1814', '0,18,1814', '0', '1868', '1868', '0', '0');
INSERT INTO `sx_area` VALUES ('1869', '襄阳区', '1814', '0,18,1814', '0', '1869', '1869', '0', '0');
INSERT INTO `sx_area` VALUES ('1870', '南漳县', '1814', '0,18,1814', '0', '1870', '1870', '0', '0');
INSERT INTO `sx_area` VALUES ('1871', '谷城县', '1814', '0,18,1814', '0', '1871', '1871', '0', '0');
INSERT INTO `sx_area` VALUES ('1872', '保康县', '1814', '0,18,1814', '0', '1872', '1872', '0', '0');
INSERT INTO `sx_area` VALUES ('1873', '老河口市', '1814', '0,18,1814', '0', '1873', '1873', '0', '0');
INSERT INTO `sx_area` VALUES ('1874', '枣阳市', '1814', '0,18,1814', '0', '1874', '1874', '0', '0');
INSERT INTO `sx_area` VALUES ('1875', '宜城市', '1814', '0,18,1814', '0', '1875', '1875', '0', '0');
INSERT INTO `sx_area` VALUES ('1876', '梁子湖区', '1815', '0,18,1815', '0', '1876', '1876', '0', '0');
INSERT INTO `sx_area` VALUES ('1877', '华容区', '1815', '0,18,1815', '0', '1877', '1877', '0', '0');
INSERT INTO `sx_area` VALUES ('1878', '鄂城区', '1815', '0,18,1815', '0', '1878', '1878', '0', '0');
INSERT INTO `sx_area` VALUES ('1879', '东宝区', '1816', '0,18,1816', '0', '1879', '1879', '0', '0');
INSERT INTO `sx_area` VALUES ('1880', '掇刀区', '1816', '0,18,1816', '0', '1880', '1880', '0', '0');
INSERT INTO `sx_area` VALUES ('1881', '京山县', '1816', '0,18,1816', '0', '1881', '1881', '0', '0');
INSERT INTO `sx_area` VALUES ('1882', '沙洋县', '1816', '0,18,1816', '0', '1882', '1882', '0', '0');
INSERT INTO `sx_area` VALUES ('1883', '钟祥市', '1816', '0,18,1816', '0', '1883', '1883', '0', '0');
INSERT INTO `sx_area` VALUES ('1884', '孝南区', '1817', '0,18,1817', '0', '1884', '1884', '0', '0');
INSERT INTO `sx_area` VALUES ('1885', '孝昌县', '1817', '0,18,1817', '0', '1885', '1885', '0', '0');
INSERT INTO `sx_area` VALUES ('1886', '大悟县', '1817', '0,18,1817', '0', '1886', '1886', '0', '0');
INSERT INTO `sx_area` VALUES ('1887', '云梦县', '1817', '0,18,1817', '0', '1887', '1887', '0', '0');
INSERT INTO `sx_area` VALUES ('1888', '应城市', '1817', '0,18,1817', '0', '1888', '1888', '0', '0');
INSERT INTO `sx_area` VALUES ('1889', '安陆市', '1817', '0,18,1817', '0', '1889', '1889', '0', '0');
INSERT INTO `sx_area` VALUES ('1890', '汉川市', '1817', '0,18,1817', '0', '1890', '1890', '0', '0');
INSERT INTO `sx_area` VALUES ('1891', '沙市区', '1818', '0,18,1818', '0', '1891', '1891', '0', '0');
INSERT INTO `sx_area` VALUES ('1892', '荆州区', '1818', '0,18,1818', '0', '1892', '1892', '0', '0');
INSERT INTO `sx_area` VALUES ('1893', '公安县', '1818', '0,18,1818', '0', '1893', '1893', '0', '0');
INSERT INTO `sx_area` VALUES ('1894', '监利县', '1818', '0,18,1818', '0', '1894', '1894', '0', '0');
INSERT INTO `sx_area` VALUES ('1895', '江陵县', '1818', '0,18,1818', '0', '1895', '1895', '0', '0');
INSERT INTO `sx_area` VALUES ('1896', '石首市', '1818', '0,18,1818', '0', '1896', '1896', '0', '0');
INSERT INTO `sx_area` VALUES ('1897', '洪湖市', '1818', '0,18,1818', '0', '1897', '1897', '0', '0');
INSERT INTO `sx_area` VALUES ('1898', '松滋市', '1818', '0,18,1818', '0', '1898', '1898', '0', '0');
INSERT INTO `sx_area` VALUES ('1899', '黄州区', '1819', '0,18,1819', '0', '1899', '1899', '0', '0');
INSERT INTO `sx_area` VALUES ('1900', '团风县', '1819', '0,18,1819', '0', '1900', '1900', '0', '0');
INSERT INTO `sx_area` VALUES ('1901', '红安县', '1819', '0,18,1819', '0', '1901', '1901', '0', '0');
INSERT INTO `sx_area` VALUES ('1902', '罗田县', '1819', '0,18,1819', '0', '1902', '1902', '0', '0');
INSERT INTO `sx_area` VALUES ('1903', '英山县', '1819', '0,18,1819', '0', '1903', '1903', '0', '0');
INSERT INTO `sx_area` VALUES ('1904', '浠水县', '1819', '0,18,1819', '0', '1904', '1904', '0', '0');
INSERT INTO `sx_area` VALUES ('1905', '蕲春县', '1819', '0,18,1819', '0', '1905', '1905', '0', '0');
INSERT INTO `sx_area` VALUES ('1906', '黄梅县', '1819', '0,18,1819', '0', '1906', '1906', '0', '0');
INSERT INTO `sx_area` VALUES ('1907', '麻城市', '1819', '0,18,1819', '0', '1907', '1907', '0', '0');
INSERT INTO `sx_area` VALUES ('1908', '武穴市', '1819', '0,18,1819', '0', '1908', '1908', '0', '0');
INSERT INTO `sx_area` VALUES ('1909', '咸安区', '1820', '0,18,1820', '0', '1909', '1909', '0', '0');
INSERT INTO `sx_area` VALUES ('1910', '嘉鱼县', '1820', '0,18,1820', '0', '1910', '1910', '0', '0');
INSERT INTO `sx_area` VALUES ('1911', '通城县', '1820', '0,18,1820', '0', '1911', '1911', '0', '0');
INSERT INTO `sx_area` VALUES ('1912', '崇阳县', '1820', '0,18,1820', '0', '1912', '1912', '0', '0');
INSERT INTO `sx_area` VALUES ('1913', '通山县', '1820', '0,18,1820', '0', '1913', '1913', '0', '0');
INSERT INTO `sx_area` VALUES ('1914', '赤壁市', '1820', '0,18,1820', '0', '1914', '1914', '0', '0');
INSERT INTO `sx_area` VALUES ('1915', '曾都区', '1821', '0,18,1821', '0', '1915', '1915', '0', '0');
INSERT INTO `sx_area` VALUES ('1916', '广水市', '1821', '0,18,1821', '0', '1916', '1916', '0', '0');
INSERT INTO `sx_area` VALUES ('1917', '恩施市', '1822', '0,18,1822', '0', '1917', '1917', '0', '0');
INSERT INTO `sx_area` VALUES ('1918', '利川市', '1822', '0,18,1822', '0', '1918', '1918', '0', '0');
INSERT INTO `sx_area` VALUES ('1919', '建始县', '1822', '0,18,1822', '0', '1919', '1919', '0', '0');
INSERT INTO `sx_area` VALUES ('1920', '巴东县', '1822', '0,18,1822', '0', '1920', '1920', '0', '0');
INSERT INTO `sx_area` VALUES ('1921', '宣恩县', '1822', '0,18,1822', '0', '1921', '1921', '0', '0');
INSERT INTO `sx_area` VALUES ('1922', '咸丰县', '1822', '0,18,1822', '0', '1922', '1922', '0', '0');
INSERT INTO `sx_area` VALUES ('1923', '来凤县', '1822', '0,18,1822', '0', '1923', '1923', '0', '0');
INSERT INTO `sx_area` VALUES ('1924', '鹤峰县', '1822', '0,18,1822', '0', '1924', '1924', '0', '0');
INSERT INTO `sx_area` VALUES ('1925', '仙桃市', '1823', '0,18,1823', '0', '1925', '1925', '0', '0');
INSERT INTO `sx_area` VALUES ('1926', '潜江市', '1823', '0,18,1823', '0', '1926', '1926', '0', '0');
INSERT INTO `sx_area` VALUES ('1927', '天门市', '1823', '0,18,1823', '0', '1927', '1927', '0', '0');
INSERT INTO `sx_area` VALUES ('1928', '神农架林区', '1823', '0,18,1823', '0', '1928', '1928', '0', '0');
INSERT INTO `sx_area` VALUES ('1929', '长沙市', '19', '0,19', '1', '1929,1943,1944,1945,1946,1947,1948,1949,1950,1951', '1929', '0', '0');
INSERT INTO `sx_area` VALUES ('1930', '株洲市', '19', '0,19', '1', '1930,1952,1953,1954,1955,1956,1957,1958,1959,1960', '1930', '0', '0');
INSERT INTO `sx_area` VALUES ('1931', '湘潭市', '19', '0,19', '1', '1931,1961,1962,1963,1964,1965', '1931', '0', '0');
INSERT INTO `sx_area` VALUES ('1932', '衡阳市', '19', '0,19', '1', '1932,1966,1967,1968,1969,1970,1971,1972,1973,1974,1975,1976,1977', '1932', '0', '0');
INSERT INTO `sx_area` VALUES ('1933', '邵阳市', '19', '0,19', '1', '1933,1978,1979,1980,1981,1982,1983,1984,1985,1986,1987,1988,1989', '1933', '0', '0');
INSERT INTO `sx_area` VALUES ('1934', '岳阳市', '19', '0,19', '1', '1934,1990,1991,1992,1993,1994,1995,1996,1997,1998', '1934', '0', '0');
INSERT INTO `sx_area` VALUES ('1935', '常德市', '19', '0,19', '1', '1935,1999,2000,2001,2002,2003,2004,2005,2006,2007', '1935', '0', '0');
INSERT INTO `sx_area` VALUES ('1936', '张家界市', '19', '0,19', '1', '1936,2008,2009,2010,2011', '1936', '0', '0');
INSERT INTO `sx_area` VALUES ('1937', '益阳市', '19', '0,19', '1', '1937,2012,2013,2014,2015,2016,2017', '1937', '0', '0');
INSERT INTO `sx_area` VALUES ('1938', '郴州市', '19', '0,19', '1', '1938,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028', '1938', '0', '0');
INSERT INTO `sx_area` VALUES ('1939', '永州市', '19', '0,19', '1', '1939,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039', '1939', '0', '0');
INSERT INTO `sx_area` VALUES ('1940', '怀化市', '19', '0,19', '1', '1940,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2051', '1940', '0', '0');
INSERT INTO `sx_area` VALUES ('1941', '娄底市', '19', '0,19', '1', '1941,2052,2053,2054,2055,2056', '1941', '0', '0');
INSERT INTO `sx_area` VALUES ('1942', '湘西土家族苗族自治州', '19', '0,19', '1', '1942,2057,2058,2059,2060,2061,2062,2063,2064', '1942', '0', '0');
INSERT INTO `sx_area` VALUES ('1943', '芙蓉区', '1929', '0,19,1929', '0', '1943', '1943', '0', '0');
INSERT INTO `sx_area` VALUES ('1944', '天心区', '1929', '0,19,1929', '0', '1944', '1944', '0', '0');
INSERT INTO `sx_area` VALUES ('1945', '岳麓区', '1929', '0,19,1929', '0', '1945', '1945', '0', '0');
INSERT INTO `sx_area` VALUES ('1946', '开福区', '1929', '0,19,1929', '0', '1946', '1946', '0', '0');
INSERT INTO `sx_area` VALUES ('1947', '雨花区', '1929', '0,19,1929', '0', '1947', '1947', '0', '0');
INSERT INTO `sx_area` VALUES ('1948', '长沙县', '1929', '0,19,1929', '0', '1948', '1948', '0', '0');
INSERT INTO `sx_area` VALUES ('1949', '望城县', '1929', '0,19,1929', '0', '1949', '1949', '0', '0');
INSERT INTO `sx_area` VALUES ('1950', '宁乡县', '1929', '0,19,1929', '0', '1950', '1950', '0', '0');
INSERT INTO `sx_area` VALUES ('1951', '浏阳市', '1929', '0,19,1929', '0', '1951', '1951', '0', '0');
INSERT INTO `sx_area` VALUES ('1952', '荷塘区', '1930', '0,19,1930', '0', '1952', '1952', '0', '0');
INSERT INTO `sx_area` VALUES ('1953', '芦淞区', '1930', '0,19,1930', '0', '1953', '1953', '0', '0');
INSERT INTO `sx_area` VALUES ('1954', '石峰区', '1930', '0,19,1930', '0', '1954', '1954', '0', '0');
INSERT INTO `sx_area` VALUES ('1955', '天元区', '1930', '0,19,1930', '0', '1955', '1955', '0', '0');
INSERT INTO `sx_area` VALUES ('1956', '株洲县', '1930', '0,19,1930', '0', '1956', '1956', '0', '0');
INSERT INTO `sx_area` VALUES ('1957', '攸县', '1930', '0,19,1930', '0', '1957', '1957', '0', '0');
INSERT INTO `sx_area` VALUES ('1958', '茶陵县', '1930', '0,19,1930', '0', '1958', '1958', '0', '0');
INSERT INTO `sx_area` VALUES ('1959', '炎陵县', '1930', '0,19,1930', '0', '1959', '1959', '0', '0');
INSERT INTO `sx_area` VALUES ('1960', '醴陵市', '1930', '0,19,1930', '0', '1960', '1960', '0', '0');
INSERT INTO `sx_area` VALUES ('1961', '雨湖区', '1931', '0,19,1931', '0', '1961', '1961', '0', '0');
INSERT INTO `sx_area` VALUES ('1962', '岳塘区', '1931', '0,19,1931', '0', '1962', '1962', '0', '0');
INSERT INTO `sx_area` VALUES ('1963', '湘潭县', '1931', '0,19,1931', '0', '1963', '1963', '0', '0');
INSERT INTO `sx_area` VALUES ('1964', '湘乡市', '1931', '0,19,1931', '0', '1964', '1964', '0', '0');
INSERT INTO `sx_area` VALUES ('1965', '韶山市', '1931', '0,19,1931', '0', '1965', '1965', '0', '0');
INSERT INTO `sx_area` VALUES ('1966', '珠晖区', '1932', '0,19,1932', '0', '1966', '1966', '0', '0');
INSERT INTO `sx_area` VALUES ('1967', '雁峰区', '1932', '0,19,1932', '0', '1967', '1967', '0', '0');
INSERT INTO `sx_area` VALUES ('1968', '石鼓区', '1932', '0,19,1932', '0', '1968', '1968', '0', '0');
INSERT INTO `sx_area` VALUES ('1969', '蒸湘区', '1932', '0,19,1932', '0', '1969', '1969', '0', '0');
INSERT INTO `sx_area` VALUES ('1970', '南岳区', '1932', '0,19,1932', '0', '1970', '1970', '0', '0');
INSERT INTO `sx_area` VALUES ('1971', '衡阳县', '1932', '0,19,1932', '0', '1971', '1971', '0', '0');
INSERT INTO `sx_area` VALUES ('1972', '衡南县', '1932', '0,19,1932', '0', '1972', '1972', '0', '0');
INSERT INTO `sx_area` VALUES ('1973', '衡山县', '1932', '0,19,1932', '0', '1973', '1973', '0', '0');
INSERT INTO `sx_area` VALUES ('1974', '衡东县', '1932', '0,19,1932', '0', '1974', '1974', '0', '0');
INSERT INTO `sx_area` VALUES ('1975', '祁东县', '1932', '0,19,1932', '0', '1975', '1975', '0', '0');
INSERT INTO `sx_area` VALUES ('1976', '耒阳市', '1932', '0,19,1932', '0', '1976', '1976', '0', '0');
INSERT INTO `sx_area` VALUES ('1977', '常宁市', '1932', '0,19,1932', '0', '1977', '1977', '0', '0');
INSERT INTO `sx_area` VALUES ('1978', '双清区', '1933', '0,19,1933', '0', '1978', '1978', '0', '0');
INSERT INTO `sx_area` VALUES ('1979', '大祥区', '1933', '0,19,1933', '0', '1979', '1979', '0', '0');
INSERT INTO `sx_area` VALUES ('1980', '北塔区', '1933', '0,19,1933', '0', '1980', '1980', '0', '0');
INSERT INTO `sx_area` VALUES ('1981', '邵东县', '1933', '0,19,1933', '0', '1981', '1981', '0', '0');
INSERT INTO `sx_area` VALUES ('1982', '新邵县', '1933', '0,19,1933', '0', '1982', '1982', '0', '0');
INSERT INTO `sx_area` VALUES ('1983', '邵阳县', '1933', '0,19,1933', '0', '1983', '1983', '0', '0');
INSERT INTO `sx_area` VALUES ('1984', '隆回县', '1933', '0,19,1933', '0', '1984', '1984', '0', '0');
INSERT INTO `sx_area` VALUES ('1985', '洞口县', '1933', '0,19,1933', '0', '1985', '1985', '0', '0');
INSERT INTO `sx_area` VALUES ('1986', '绥宁县', '1933', '0,19,1933', '0', '1986', '1986', '0', '0');
INSERT INTO `sx_area` VALUES ('1987', '新宁县', '1933', '0,19,1933', '0', '1987', '1987', '0', '0');
INSERT INTO `sx_area` VALUES ('1988', '城步苗族自治县', '1933', '0,19,1933', '0', '1988', '1988', '0', '0');
INSERT INTO `sx_area` VALUES ('1989', '武冈市', '1933', '0,19,1933', '0', '1989', '1989', '0', '0');
INSERT INTO `sx_area` VALUES ('1990', '岳阳楼区', '1934', '0,19,1934', '0', '1990', '1990', '0', '0');
INSERT INTO `sx_area` VALUES ('1991', '云溪区', '1934', '0,19,1934', '0', '1991', '1991', '0', '0');
INSERT INTO `sx_area` VALUES ('1992', '君山区', '1934', '0,19,1934', '0', '1992', '1992', '0', '0');
INSERT INTO `sx_area` VALUES ('1993', '岳阳县', '1934', '0,19,1934', '0', '1993', '1993', '0', '0');
INSERT INTO `sx_area` VALUES ('1994', '华容县', '1934', '0,19,1934', '0', '1994', '1994', '0', '0');
INSERT INTO `sx_area` VALUES ('1995', '湘阴县', '1934', '0,19,1934', '0', '1995', '1995', '0', '0');
INSERT INTO `sx_area` VALUES ('1996', '平江县', '1934', '0,19,1934', '0', '1996', '1996', '0', '0');
INSERT INTO `sx_area` VALUES ('1997', '汨罗市', '1934', '0,19,1934', '0', '1997', '1997', '0', '0');
INSERT INTO `sx_area` VALUES ('1998', '临湘市', '1934', '0,19,1934', '0', '1998', '1998', '0', '0');
INSERT INTO `sx_area` VALUES ('1999', '武陵区', '1935', '0,19,1935', '0', '1999', '1999', '0', '0');
INSERT INTO `sx_area` VALUES ('2000', '鼎城区', '1935', '0,19,1935', '0', '2000', '2000', '0', '0');
INSERT INTO `sx_area` VALUES ('2001', '安乡县', '1935', '0,19,1935', '0', '2001', '2001', '0', '0');
INSERT INTO `sx_area` VALUES ('2002', '汉寿县', '1935', '0,19,1935', '0', '2002', '2002', '0', '0');
INSERT INTO `sx_area` VALUES ('2003', '澧县', '1935', '0,19,1935', '0', '2003', '2003', '0', '0');
INSERT INTO `sx_area` VALUES ('2004', '临澧县', '1935', '0,19,1935', '0', '2004', '2004', '0', '0');
INSERT INTO `sx_area` VALUES ('2005', '桃源县', '1935', '0,19,1935', '0', '2005', '2005', '0', '0');
INSERT INTO `sx_area` VALUES ('2006', '石门县', '1935', '0,19,1935', '0', '2006', '2006', '0', '0');
INSERT INTO `sx_area` VALUES ('2007', '津市市', '1935', '0,19,1935', '0', '2007', '2007', '0', '0');
INSERT INTO `sx_area` VALUES ('2008', '永定区', '1936', '0,19,1936', '0', '2008', '2008', '0', '0');
INSERT INTO `sx_area` VALUES ('2009', '武陵源区', '1936', '0,19,1936', '0', '2009', '2009', '0', '0');
INSERT INTO `sx_area` VALUES ('2010', '慈利县', '1936', '0,19,1936', '0', '2010', '2010', '0', '0');
INSERT INTO `sx_area` VALUES ('2011', '桑植县', '1936', '0,19,1936', '0', '2011', '2011', '0', '0');
INSERT INTO `sx_area` VALUES ('2012', '资阳区', '1937', '0,19,1937', '0', '2012', '2012', '0', '0');
INSERT INTO `sx_area` VALUES ('2013', '赫山区', '1937', '0,19,1937', '0', '2013', '2013', '0', '0');
INSERT INTO `sx_area` VALUES ('2014', '南县', '1937', '0,19,1937', '0', '2014', '2014', '0', '0');
INSERT INTO `sx_area` VALUES ('2015', '桃江县', '1937', '0,19,1937', '0', '2015', '2015', '0', '0');
INSERT INTO `sx_area` VALUES ('2016', '安化县', '1937', '0,19,1937', '0', '2016', '2016', '0', '0');
INSERT INTO `sx_area` VALUES ('2017', '沅江市', '1937', '0,19,1937', '0', '2017', '2017', '0', '0');
INSERT INTO `sx_area` VALUES ('2018', '北湖区', '1938', '0,19,1938', '0', '2018', '2018', '0', '0');
INSERT INTO `sx_area` VALUES ('2019', '苏仙区', '1938', '0,19,1938', '0', '2019', '2019', '0', '0');
INSERT INTO `sx_area` VALUES ('2020', '桂阳县', '1938', '0,19,1938', '0', '2020', '2020', '0', '0');
INSERT INTO `sx_area` VALUES ('2021', '宜章县', '1938', '0,19,1938', '0', '2021', '2021', '0', '0');
INSERT INTO `sx_area` VALUES ('2022', '永兴县', '1938', '0,19,1938', '0', '2022', '2022', '0', '0');
INSERT INTO `sx_area` VALUES ('2023', '嘉禾县', '1938', '0,19,1938', '0', '2023', '2023', '0', '0');
INSERT INTO `sx_area` VALUES ('2024', '临武县', '1938', '0,19,1938', '0', '2024', '2024', '0', '0');
INSERT INTO `sx_area` VALUES ('2025', '汝城县', '1938', '0,19,1938', '0', '2025', '2025', '0', '0');
INSERT INTO `sx_area` VALUES ('2026', '桂东县', '1938', '0,19,1938', '0', '2026', '2026', '0', '0');
INSERT INTO `sx_area` VALUES ('2027', '安仁县', '1938', '0,19,1938', '0', '2027', '2027', '0', '0');
INSERT INTO `sx_area` VALUES ('2028', '资兴市', '1938', '0,19,1938', '0', '2028', '2028', '0', '0');
INSERT INTO `sx_area` VALUES ('2029', '芝山区', '1939', '0,19,1939', '0', '2029', '2029', '0', '0');
INSERT INTO `sx_area` VALUES ('2030', '冷水滩区', '1939', '0,19,1939', '0', '2030', '2030', '0', '0');
INSERT INTO `sx_area` VALUES ('2031', '祁阳县', '1939', '0,19,1939', '0', '2031', '2031', '0', '0');
INSERT INTO `sx_area` VALUES ('2032', '东安县', '1939', '0,19,1939', '0', '2032', '2032', '0', '0');
INSERT INTO `sx_area` VALUES ('2033', '双牌县', '1939', '0,19,1939', '0', '2033', '2033', '0', '0');
INSERT INTO `sx_area` VALUES ('2034', '道县', '1939', '0,19,1939', '0', '2034', '2034', '0', '0');
INSERT INTO `sx_area` VALUES ('2035', '江永县', '1939', '0,19,1939', '0', '2035', '2035', '0', '0');
INSERT INTO `sx_area` VALUES ('2036', '宁远县', '1939', '0,19,1939', '0', '2036', '2036', '0', '0');
INSERT INTO `sx_area` VALUES ('2037', '蓝山县', '1939', '0,19,1939', '0', '2037', '2037', '0', '0');
INSERT INTO `sx_area` VALUES ('2038', '新田县', '1939', '0,19,1939', '0', '2038', '2038', '0', '0');
INSERT INTO `sx_area` VALUES ('2039', '江华瑶族自治县', '1939', '0,19,1939', '0', '2039', '2039', '0', '0');
INSERT INTO `sx_area` VALUES ('2040', '鹤城区', '1940', '0,19,1940', '0', '2040', '2040', '0', '0');
INSERT INTO `sx_area` VALUES ('2041', '中方县', '1940', '0,19,1940', '0', '2041', '2041', '0', '0');
INSERT INTO `sx_area` VALUES ('2042', '沅陵县', '1940', '0,19,1940', '0', '2042', '2042', '0', '0');
INSERT INTO `sx_area` VALUES ('2043', '辰溪县', '1940', '0,19,1940', '0', '2043', '2043', '0', '0');
INSERT INTO `sx_area` VALUES ('2044', '溆浦县', '1940', '0,19,1940', '0', '2044', '2044', '0', '0');
INSERT INTO `sx_area` VALUES ('2045', '会同县', '1940', '0,19,1940', '0', '2045', '2045', '0', '0');
INSERT INTO `sx_area` VALUES ('2046', '麻阳苗族自治县', '1940', '0,19,1940', '0', '2046', '2046', '0', '0');
INSERT INTO `sx_area` VALUES ('2047', '新晃侗族自治县', '1940', '0,19,1940', '0', '2047', '2047', '0', '0');
INSERT INTO `sx_area` VALUES ('2048', '芷江侗族自治县', '1940', '0,19,1940', '0', '2048', '2048', '0', '0');
INSERT INTO `sx_area` VALUES ('2049', '靖州苗族侗族自治县', '1940', '0,19,1940', '0', '2049', '2049', '0', '0');
INSERT INTO `sx_area` VALUES ('2050', '通道侗族自治县', '1940', '0,19,1940', '0', '2050', '2050', '0', '0');
INSERT INTO `sx_area` VALUES ('2051', '洪江市', '1940', '0,19,1940', '0', '2051', '2051', '0', '0');
INSERT INTO `sx_area` VALUES ('2052', '娄星区', '1941', '0,19,1941', '0', '2052', '2052', '0', '0');
INSERT INTO `sx_area` VALUES ('2053', '双峰县', '1941', '0,19,1941', '0', '2053', '2053', '0', '0');
INSERT INTO `sx_area` VALUES ('2054', '新化县', '1941', '0,19,1941', '0', '2054', '2054', '0', '0');
INSERT INTO `sx_area` VALUES ('2055', '冷水江市', '1941', '0,19,1941', '0', '2055', '2055', '0', '0');
INSERT INTO `sx_area` VALUES ('2056', '涟源市', '1941', '0,19,1941', '0', '2056', '2056', '0', '0');
INSERT INTO `sx_area` VALUES ('2057', '吉首市', '1942', '0,19,1942', '0', '2057', '2057', '0', '0');
INSERT INTO `sx_area` VALUES ('2058', '泸溪县', '1942', '0,19,1942', '0', '2058', '2058', '0', '0');
INSERT INTO `sx_area` VALUES ('2059', '凤凰县', '1942', '0,19,1942', '0', '2059', '2059', '0', '0');
INSERT INTO `sx_area` VALUES ('2060', '花垣县', '1942', '0,19,1942', '0', '2060', '2060', '0', '0');
INSERT INTO `sx_area` VALUES ('2061', '保靖县', '1942', '0,19,1942', '0', '2061', '2061', '0', '0');
INSERT INTO `sx_area` VALUES ('2062', '古丈县', '1942', '0,19,1942', '0', '2062', '2062', '0', '0');
INSERT INTO `sx_area` VALUES ('2063', '永顺县', '1942', '0,19,1942', '0', '2063', '2063', '0', '0');
INSERT INTO `sx_area` VALUES ('2064', '龙山县', '1942', '0,19,1942', '0', '2064', '2064', '0', '0');
INSERT INTO `sx_area` VALUES ('2065', '广州市', '20', '0,20', '1', '2065,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097', '2065', '0', '0');
INSERT INTO `sx_area` VALUES ('2066', '韶关市', '20', '0,20', '1', '2066,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108', '2066', '0', '0');
INSERT INTO `sx_area` VALUES ('2067', '深圳市', '20', '0,20', '1', '2067,2109,2110,2111,2112,2113,2114', '2067', '0', '0');
INSERT INTO `sx_area` VALUES ('2068', '珠海市', '20', '0,20', '1', '2068,2115,2116,2117', '2068', '0', '0');
INSERT INTO `sx_area` VALUES ('2069', '汕头市', '20', '0,20', '1', '2069,2118,2119,2120,2121,2122,2123,2124,2125,2126', '2069', '0', '0');
INSERT INTO `sx_area` VALUES ('2070', '佛山市', '20', '0,20', '1', '2070,2127,2128,2129,2130,2131', '2070', '0', '0');
INSERT INTO `sx_area` VALUES ('2071', '江门市', '20', '0,20', '1', '2071,2132,2133,2134,2135,2136,2137,2138', '2071', '0', '0');
INSERT INTO `sx_area` VALUES ('2072', '湛江市', '20', '0,20', '1', '2072,2139,2140,2141,2142,2143,2144,2145,2146,2147', '2072', '0', '0');
INSERT INTO `sx_area` VALUES ('2073', '茂名市', '20', '0,20', '1', '2073,2148,2149,2150,2151,2152,2153', '2073', '0', '0');
INSERT INTO `sx_area` VALUES ('2074', '肇庆市', '20', '0,20', '1', '2074,2154,2155,2156,2157,2158,2159,2160,2161,2162', '2074', '0', '0');
INSERT INTO `sx_area` VALUES ('2075', '惠州市', '20', '0,20', '1', '2075,2163,2164,2165,2166,2167', '2075', '0', '0');
INSERT INTO `sx_area` VALUES ('2076', '梅州市', '20', '0,20', '1', '2076,2168,2169,2170,2171,2172,2173,2174,2175', '2076', '0', '0');
INSERT INTO `sx_area` VALUES ('2077', '汕尾市', '20', '0,20', '1', '2077,2176,2177,2178,2179', '2077', '0', '0');
INSERT INTO `sx_area` VALUES ('2078', '河源市', '20', '0,20', '1', '2078,2180,2181,2182,2183,2184,2185', '2078', '0', '0');
INSERT INTO `sx_area` VALUES ('2079', '阳江市', '20', '0,20', '1', '2079,2186,2187,2188,2189', '2079', '0', '0');
INSERT INTO `sx_area` VALUES ('2080', '清远市', '20', '0,20', '1', '2080,2190,2191,2192,2193,2194,2195,2196,2197', '2080', '0', '0');
INSERT INTO `sx_area` VALUES ('2081', '东莞市', '20', '0,20', '1', '2081,2198,2199,2200,2201,2202,2203,2204,2205,2206,2207,2208,2209,2210,2211,2212,2213,2214,2215,2216,2217,2218,2219,2220,2221,2222,2223,2224,2225,2226,2227,2228,2229,2230', '2081', '0', '0');
INSERT INTO `sx_area` VALUES ('2082', '中山市', '20', '0,20', '0', '2082', '2082', '0', '0');
INSERT INTO `sx_area` VALUES ('2083', '潮州市', '20', '0,20', '1', '2083,2231,2232,2233', '2083', '0', '0');
INSERT INTO `sx_area` VALUES ('2084', '揭阳市', '20', '0,20', '1', '2084,2234,2235,2236,2237,2238', '2084', '0', '0');
INSERT INTO `sx_area` VALUES ('2085', '云浮市', '20', '0,20', '1', '2085,2239,2240,2241,2242,2243', '2085', '0', '0');
INSERT INTO `sx_area` VALUES ('2086', '东山区', '2065', '0,20,2065', '0', '2086', '2086', '0', '0');
INSERT INTO `sx_area` VALUES ('2087', '荔湾区', '2065', '0,20,2065', '0', '2087', '2087', '0', '0');
INSERT INTO `sx_area` VALUES ('2088', '越秀区', '2065', '0,20,2065', '0', '2088', '2088', '0', '0');
INSERT INTO `sx_area` VALUES ('2089', '海珠区', '2065', '0,20,2065', '0', '2089', '2089', '0', '0');
INSERT INTO `sx_area` VALUES ('2090', '天河区', '2065', '0,20,2065', '0', '2090', '2090', '0', '0');
INSERT INTO `sx_area` VALUES ('2091', '芳村区', '2065', '0,20,2065', '0', '2091', '2091', '0', '0');
INSERT INTO `sx_area` VALUES ('2092', '白云区', '2065', '0,20,2065', '0', '2092', '2092', '0', '0');
INSERT INTO `sx_area` VALUES ('2093', '黄埔区', '2065', '0,20,2065', '0', '2093', '2093', '0', '0');
INSERT INTO `sx_area` VALUES ('2094', '番禺区', '2065', '0,20,2065', '0', '2094', '2094', '0', '0');
INSERT INTO `sx_area` VALUES ('2095', '花都区', '2065', '0,20,2065', '0', '2095', '2095', '0', '0');
INSERT INTO `sx_area` VALUES ('2096', '增城市', '2065', '0,20,2065', '0', '2096', '2096', '0', '0');
INSERT INTO `sx_area` VALUES ('2097', '从化市', '2065', '0,20,2065', '0', '2097', '2097', '0', '0');
INSERT INTO `sx_area` VALUES ('2098', '北江区', '2066', '0,20,2066', '0', '2098', '2098', '0', '0');
INSERT INTO `sx_area` VALUES ('2099', '武江区', '2066', '0,20,2066', '0', '2099', '2099', '0', '0');
INSERT INTO `sx_area` VALUES ('2100', '浈江区', '2066', '0,20,2066', '0', '2100', '2100', '0', '0');
INSERT INTO `sx_area` VALUES ('2101', '曲江县', '2066', '0,20,2066', '0', '2101', '2101', '0', '0');
INSERT INTO `sx_area` VALUES ('2102', '始兴县', '2066', '0,20,2066', '0', '2102', '2102', '0', '0');
INSERT INTO `sx_area` VALUES ('2103', '仁化县', '2066', '0,20,2066', '0', '2103', '2103', '0', '0');
INSERT INTO `sx_area` VALUES ('2104', '翁源县', '2066', '0,20,2066', '0', '2104', '2104', '0', '0');
INSERT INTO `sx_area` VALUES ('2105', '乳源瑶族自治县', '2066', '0,20,2066', '0', '2105', '2105', '0', '0');
INSERT INTO `sx_area` VALUES ('2106', '新丰县', '2066', '0,20,2066', '0', '2106', '2106', '0', '0');
INSERT INTO `sx_area` VALUES ('2107', '乐昌市', '2066', '0,20,2066', '0', '2107', '2107', '0', '0');
INSERT INTO `sx_area` VALUES ('2108', '南雄市', '2066', '0,20,2066', '0', '2108', '2108', '0', '0');
INSERT INTO `sx_area` VALUES ('2109', '罗湖区', '2067', '0,20,2067', '0', '2109', '2109', '0', '0');
INSERT INTO `sx_area` VALUES ('2110', '福田区', '2067', '0,20,2067', '0', '2110', '2110', '0', '0');
INSERT INTO `sx_area` VALUES ('2111', '南山区', '2067', '0,20,2067', '0', '2111', '2111', '0', '0');
INSERT INTO `sx_area` VALUES ('2112', '宝安区', '2067', '0,20,2067', '0', '2112', '2112', '0', '0');
INSERT INTO `sx_area` VALUES ('2113', '龙岗区', '2067', '0,20,2067', '0', '2113', '2113', '0', '0');
INSERT INTO `sx_area` VALUES ('2114', '盐田区', '2067', '0,20,2067', '0', '2114', '2114', '0', '0');
INSERT INTO `sx_area` VALUES ('2115', '香洲区', '2068', '0,20,2068', '0', '2115', '2115', '0', '0');
INSERT INTO `sx_area` VALUES ('2116', '斗门区', '2068', '0,20,2068', '0', '2116', '2116', '0', '0');
INSERT INTO `sx_area` VALUES ('2117', '金湾区', '2068', '0,20,2068', '0', '2117', '2117', '0', '0');
INSERT INTO `sx_area` VALUES ('2118', '龙湖区', '2069', '0,20,2069', '0', '2118', '2118', '0', '0');
INSERT INTO `sx_area` VALUES ('2119', '金平区', '2069', '0,20,2069', '0', '2119', '2119', '0', '0');
INSERT INTO `sx_area` VALUES ('2120', '濠江区', '2069', '0,20,2069', '0', '2120', '2120', '0', '0');
INSERT INTO `sx_area` VALUES ('2121', '潮阳区', '2069', '0,20,2069', '0', '2121', '2121', '0', '0');
INSERT INTO `sx_area` VALUES ('2122', '潮南区', '2069', '0,20,2069', '0', '2122', '2122', '0', '0');
INSERT INTO `sx_area` VALUES ('2123', '澄海区', '2069', '0,20,2069', '0', '2123', '2123', '0', '0');
INSERT INTO `sx_area` VALUES ('2124', '南澳县', '2069', '0,20,2069', '0', '2124', '2124', '0', '0');
INSERT INTO `sx_area` VALUES ('2125', '潮阳市', '2069', '0,20,2069', '0', '2125', '2125', '0', '0');
INSERT INTO `sx_area` VALUES ('2126', '澄海市', '2069', '0,20,2069', '0', '2126', '2126', '0', '0');
INSERT INTO `sx_area` VALUES ('2127', '禅城区', '2070', '0,20,2070', '0', '2127', '2127', '0', '0');
INSERT INTO `sx_area` VALUES ('2128', '南海区', '2070', '0,20,2070', '0', '2128', '2128', '0', '0');
INSERT INTO `sx_area` VALUES ('2129', '顺德区', '2070', '0,20,2070', '0', '2129', '2129', '0', '0');
INSERT INTO `sx_area` VALUES ('2130', '三水区', '2070', '0,20,2070', '0', '2130', '2130', '0', '0');
INSERT INTO `sx_area` VALUES ('2131', '高明区', '2070', '0,20,2070', '0', '2131', '2131', '0', '0');
INSERT INTO `sx_area` VALUES ('2132', '蓬江区', '2071', '0,20,2071', '0', '2132', '2132', '0', '0');
INSERT INTO `sx_area` VALUES ('2133', '江海区', '2071', '0,20,2071', '0', '2133', '2133', '0', '0');
INSERT INTO `sx_area` VALUES ('2134', '新会区', '2071', '0,20,2071', '0', '2134', '2134', '0', '0');
INSERT INTO `sx_area` VALUES ('2135', '台山市', '2071', '0,20,2071', '0', '2135', '2135', '0', '0');
INSERT INTO `sx_area` VALUES ('2136', '开平市', '2071', '0,20,2071', '0', '2136', '2136', '0', '0');
INSERT INTO `sx_area` VALUES ('2137', '鹤山市', '2071', '0,20,2071', '0', '2137', '2137', '0', '0');
INSERT INTO `sx_area` VALUES ('2138', '恩平市', '2071', '0,20,2071', '0', '2138', '2138', '0', '0');
INSERT INTO `sx_area` VALUES ('2139', '赤坎区', '2072', '0,20,2072', '0', '2139', '2139', '0', '0');
INSERT INTO `sx_area` VALUES ('2140', '霞山区', '2072', '0,20,2072', '0', '2140', '2140', '0', '0');
INSERT INTO `sx_area` VALUES ('2141', '坡头区', '2072', '0,20,2072', '0', '2141', '2141', '0', '0');
INSERT INTO `sx_area` VALUES ('2142', '麻章区', '2072', '0,20,2072', '0', '2142', '2142', '0', '0');
INSERT INTO `sx_area` VALUES ('2143', '遂溪县', '2072', '0,20,2072', '0', '2143', '2143', '0', '0');
INSERT INTO `sx_area` VALUES ('2144', '徐闻县', '2072', '0,20,2072', '0', '2144', '2144', '0', '0');
INSERT INTO `sx_area` VALUES ('2145', '廉江市', '2072', '0,20,2072', '0', '2145', '2145', '0', '0');
INSERT INTO `sx_area` VALUES ('2146', '雷州市', '2072', '0,20,2072', '0', '2146', '2146', '0', '0');
INSERT INTO `sx_area` VALUES ('2147', '吴川市', '2072', '0,20,2072', '0', '2147', '2147', '0', '0');
INSERT INTO `sx_area` VALUES ('2148', '茂南区', '2073', '0,20,2073', '0', '2148', '2148', '0', '0');
INSERT INTO `sx_area` VALUES ('2149', '茂港区', '2073', '0,20,2073', '0', '2149', '2149', '0', '0');
INSERT INTO `sx_area` VALUES ('2150', '电白县', '2073', '0,20,2073', '0', '2150', '2150', '0', '0');
INSERT INTO `sx_area` VALUES ('2151', '高州市', '2073', '0,20,2073', '0', '2151', '2151', '0', '0');
INSERT INTO `sx_area` VALUES ('2152', '化州市', '2073', '0,20,2073', '0', '2152', '2152', '0', '0');
INSERT INTO `sx_area` VALUES ('2153', '信宜市', '2073', '0,20,2073', '0', '2153', '2153', '0', '0');
INSERT INTO `sx_area` VALUES ('2154', '端州区', '2074', '0,20,2074', '0', '2154', '2154', '0', '0');
INSERT INTO `sx_area` VALUES ('2155', '鼎湖区', '2074', '0,20,2074', '0', '2155', '2155', '0', '0');
INSERT INTO `sx_area` VALUES ('2156', '大旺区', '2074', '0,20,2074', '0', '2156', '2156', '0', '0');
INSERT INTO `sx_area` VALUES ('2157', '广宁县', '2074', '0,20,2074', '0', '2157', '2157', '0', '0');
INSERT INTO `sx_area` VALUES ('2158', '怀集县', '2074', '0,20,2074', '0', '2158', '2158', '0', '0');
INSERT INTO `sx_area` VALUES ('2159', '封开县', '2074', '0,20,2074', '0', '2159', '2159', '0', '0');
INSERT INTO `sx_area` VALUES ('2160', '德庆县', '2074', '0,20,2074', '0', '2160', '2160', '0', '0');
INSERT INTO `sx_area` VALUES ('2161', '高要市', '2074', '0,20,2074', '0', '2161', '2161', '0', '0');
INSERT INTO `sx_area` VALUES ('2162', '四会市', '2074', '0,20,2074', '0', '2162', '2162', '0', '0');
INSERT INTO `sx_area` VALUES ('2163', '惠城区', '2075', '0,20,2075', '0', '2163', '2163', '0', '0');
INSERT INTO `sx_area` VALUES ('2164', '博罗县', '2075', '0,20,2075', '0', '2164', '2164', '0', '0');
INSERT INTO `sx_area` VALUES ('2165', '惠东县', '2075', '0,20,2075', '0', '2165', '2165', '0', '0');
INSERT INTO `sx_area` VALUES ('2166', '龙门县', '2075', '0,20,2075', '0', '2166', '2166', '0', '0');
INSERT INTO `sx_area` VALUES ('2167', '惠阳市', '2075', '0,20,2075', '0', '2167', '2167', '0', '0');
INSERT INTO `sx_area` VALUES ('2168', '梅江区', '2076', '0,20,2076', '0', '2168', '2168', '0', '0');
INSERT INTO `sx_area` VALUES ('2169', '梅县', '2076', '0,20,2076', '0', '2169', '2169', '0', '0');
INSERT INTO `sx_area` VALUES ('2170', '大埔县', '2076', '0,20,2076', '0', '2170', '2170', '0', '0');
INSERT INTO `sx_area` VALUES ('2171', '丰顺县', '2076', '0,20,2076', '0', '2171', '2171', '0', '0');
INSERT INTO `sx_area` VALUES ('2172', '五华县', '2076', '0,20,2076', '0', '2172', '2172', '0', '0');
INSERT INTO `sx_area` VALUES ('2173', '平远县', '2076', '0,20,2076', '0', '2173', '2173', '0', '0');
INSERT INTO `sx_area` VALUES ('2174', '蕉岭县', '2076', '0,20,2076', '0', '2174', '2174', '0', '0');
INSERT INTO `sx_area` VALUES ('2175', '兴宁市', '2076', '0,20,2076', '0', '2175', '2175', '0', '0');
INSERT INTO `sx_area` VALUES ('2176', '城区', '2077', '0,20,2077', '0', '2176', '2176', '0', '0');
INSERT INTO `sx_area` VALUES ('2177', '海丰县', '2077', '0,20,2077', '0', '2177', '2177', '0', '0');
INSERT INTO `sx_area` VALUES ('2178', '陆河县', '2077', '0,20,2077', '0', '2178', '2178', '0', '0');
INSERT INTO `sx_area` VALUES ('2179', '陆丰市', '2077', '0,20,2077', '0', '2179', '2179', '0', '0');
INSERT INTO `sx_area` VALUES ('2180', '源城区', '2078', '0,20,2078', '0', '2180', '2180', '0', '0');
INSERT INTO `sx_area` VALUES ('2181', '紫金县', '2078', '0,20,2078', '0', '2181', '2181', '0', '0');
INSERT INTO `sx_area` VALUES ('2182', '龙川县', '2078', '0,20,2078', '0', '2182', '2182', '0', '0');
INSERT INTO `sx_area` VALUES ('2183', '连平县', '2078', '0,20,2078', '0', '2183', '2183', '0', '0');
INSERT INTO `sx_area` VALUES ('2184', '和平县', '2078', '0,20,2078', '0', '2184', '2184', '0', '0');
INSERT INTO `sx_area` VALUES ('2185', '东源县', '2078', '0,20,2078', '0', '2185', '2185', '0', '0');
INSERT INTO `sx_area` VALUES ('2186', '江城区', '2079', '0,20,2079', '0', '2186', '2186', '0', '0');
INSERT INTO `sx_area` VALUES ('2187', '阳西县', '2079', '0,20,2079', '0', '2187', '2187', '0', '0');
INSERT INTO `sx_area` VALUES ('2188', '阳东县', '2079', '0,20,2079', '0', '2188', '2188', '0', '0');
INSERT INTO `sx_area` VALUES ('2189', '阳春市', '2079', '0,20,2079', '0', '2189', '2189', '0', '0');
INSERT INTO `sx_area` VALUES ('2190', '清城区', '2080', '0,20,2080', '0', '2190', '2190', '0', '0');
INSERT INTO `sx_area` VALUES ('2191', '佛冈县', '2080', '0,20,2080', '0', '2191', '2191', '0', '0');
INSERT INTO `sx_area` VALUES ('2192', '阳山县', '2080', '0,20,2080', '0', '2192', '2192', '0', '0');
INSERT INTO `sx_area` VALUES ('2193', '连山壮族瑶族自治县', '2080', '0,20,2080', '0', '2193', '2193', '0', '0');
INSERT INTO `sx_area` VALUES ('2194', '连南瑶族自治县', '2080', '0,20,2080', '0', '2194', '2194', '0', '0');
INSERT INTO `sx_area` VALUES ('2195', '清新县', '2080', '0,20,2080', '0', '2195', '2195', '0', '0');
INSERT INTO `sx_area` VALUES ('2196', '英德市', '2080', '0,20,2080', '0', '2196', '2196', '0', '0');
INSERT INTO `sx_area` VALUES ('2197', '连州市', '2080', '0,20,2080', '0', '2197', '2197', '0', '0');
INSERT INTO `sx_area` VALUES ('2198', '市辖区', '2081', '0,20,2081', '0', '2198', '2198', '0', '0');
INSERT INTO `sx_area` VALUES ('2199', '莞城', '2081', '0,20,2081', '0', '2199', '2199', '0', '0');
INSERT INTO `sx_area` VALUES ('2200', '南城', '2081', '0,20,2081', '0', '2200', '2200', '0', '0');
INSERT INTO `sx_area` VALUES ('2201', '万江', '2081', '0,20,2081', '0', '2201', '2201', '0', '0');
INSERT INTO `sx_area` VALUES ('2202', '东城', '2081', '0,20,2081', '0', '2202', '2202', '0', '0');
INSERT INTO `sx_area` VALUES ('2203', '石碣', '2081', '0,20,2081', '0', '2203', '2203', '0', '0');
INSERT INTO `sx_area` VALUES ('2204', '石龙', '2081', '0,20,2081', '0', '2204', '2204', '0', '0');
INSERT INTO `sx_area` VALUES ('2205', '茶山', '2081', '0,20,2081', '0', '2205', '2205', '0', '0');
INSERT INTO `sx_area` VALUES ('2206', '石排', '2081', '0,20,2081', '0', '2206', '2206', '0', '0');
INSERT INTO `sx_area` VALUES ('2207', '企石', '2081', '0,20,2081', '0', '2207', '2207', '0', '0');
INSERT INTO `sx_area` VALUES ('2208', '横沥', '2081', '0,20,2081', '0', '2208', '2208', '0', '0');
INSERT INTO `sx_area` VALUES ('2209', '桥头', '2081', '0,20,2081', '0', '2209', '2209', '0', '0');
INSERT INTO `sx_area` VALUES ('2210', '谢岗', '2081', '0,20,2081', '0', '2210', '2210', '0', '0');
INSERT INTO `sx_area` VALUES ('2211', '东坑', '2081', '0,20,2081', '0', '2211', '2211', '0', '0');
INSERT INTO `sx_area` VALUES ('2212', '常平', '2081', '0,20,2081', '0', '2212', '2212', '0', '0');
INSERT INTO `sx_area` VALUES ('2213', '寮步', '2081', '0,20,2081', '0', '2213', '2213', '0', '0');
INSERT INTO `sx_area` VALUES ('2214', '大朗', '2081', '0,20,2081', '0', '2214', '2214', '0', '0');
INSERT INTO `sx_area` VALUES ('2215', '黄江', '2081', '0,20,2081', '0', '2215', '2215', '0', '0');
INSERT INTO `sx_area` VALUES ('2216', '清溪', '2081', '0,20,2081', '0', '2216', '2216', '0', '0');
INSERT INTO `sx_area` VALUES ('2217', '塘厦', '2081', '0,20,2081', '0', '2217', '2217', '0', '0');
INSERT INTO `sx_area` VALUES ('2218', '凤岗', '2081', '0,20,2081', '0', '2218', '2218', '0', '0');
INSERT INTO `sx_area` VALUES ('2219', '长安', '2081', '0,20,2081', '0', '2219', '2219', '0', '0');
INSERT INTO `sx_area` VALUES ('2220', '虎门', '2081', '0,20,2081', '0', '2220', '2220', '0', '0');
INSERT INTO `sx_area` VALUES ('2221', '厚街', '2081', '0,20,2081', '0', '2221', '2221', '0', '0');
INSERT INTO `sx_area` VALUES ('2222', '沙田', '2081', '0,20,2081', '0', '2222', '2222', '0', '0');
INSERT INTO `sx_area` VALUES ('2223', '道窖', '2081', '0,20,2081', '0', '2223', '2223', '0', '0');
INSERT INTO `sx_area` VALUES ('2224', '洪梅', '2081', '0,20,2081', '0', '2224', '2224', '0', '0');
INSERT INTO `sx_area` VALUES ('2225', '麻涌', '2081', '0,20,2081', '0', '2225', '2225', '0', '0');
INSERT INTO `sx_area` VALUES ('2226', '中堂', '2081', '0,20,2081', '0', '2226', '2226', '0', '0');
INSERT INTO `sx_area` VALUES ('2227', '高埗', '2081', '0,20,2081', '0', '2227', '2227', '0', '0');
INSERT INTO `sx_area` VALUES ('2228', '樟木头', '2081', '0,20,2081', '0', '2228', '2228', '0', '0');
INSERT INTO `sx_area` VALUES ('2229', '大岭山', '2081', '0,20,2081', '0', '2229', '2229', '0', '0');
INSERT INTO `sx_area` VALUES ('2230', '望牛墩', '2081', '0,20,2081', '0', '2230', '2230', '0', '0');
INSERT INTO `sx_area` VALUES ('2231', '湘桥区', '2083', '0,20,2083', '0', '2231', '2231', '0', '0');
INSERT INTO `sx_area` VALUES ('2232', '潮安县', '2083', '0,20,2083', '0', '2232', '2232', '0', '0');
INSERT INTO `sx_area` VALUES ('2233', '饶平县', '2083', '0,20,2083', '0', '2233', '2233', '0', '0');
INSERT INTO `sx_area` VALUES ('2234', '榕城区', '2084', '0,20,2084', '0', '2234', '2234', '0', '0');
INSERT INTO `sx_area` VALUES ('2235', '揭东县', '2084', '0,20,2084', '0', '2235', '2235', '0', '0');
INSERT INTO `sx_area` VALUES ('2236', '揭西县', '2084', '0,20,2084', '0', '2236', '2236', '0', '0');
INSERT INTO `sx_area` VALUES ('2237', '惠来县', '2084', '0,20,2084', '0', '2237', '2237', '0', '0');
INSERT INTO `sx_area` VALUES ('2238', '普宁市', '2084', '0,20,2084', '0', '2238', '2238', '0', '0');
INSERT INTO `sx_area` VALUES ('2239', '云城区', '2085', '0,20,2085', '0', '2239', '2239', '0', '0');
INSERT INTO `sx_area` VALUES ('2240', '新兴县', '2085', '0,20,2085', '0', '2240', '2240', '0', '0');
INSERT INTO `sx_area` VALUES ('2241', '郁南县', '2085', '0,20,2085', '0', '2241', '2241', '0', '0');
INSERT INTO `sx_area` VALUES ('2242', '云安县', '2085', '0,20,2085', '0', '2242', '2242', '0', '0');
INSERT INTO `sx_area` VALUES ('2243', '罗定市', '2085', '0,20,2085', '0', '2243', '2243', '0', '0');
INSERT INTO `sx_area` VALUES ('2244', '南宁市', '21', '0,21', '1', '2244,2258,2259,2260,2261,2262,2263,2264,2265,2266,2267,2268,2269', '2244', '0', '0');
INSERT INTO `sx_area` VALUES ('2245', '柳州市', '21', '0,21', '1', '2245,2270,2271,2272,2273,2274,2275,2276,2277,2278,2279', '2245', '0', '0');
INSERT INTO `sx_area` VALUES ('2246', '桂林市', '21', '0,21', '1', '2246,2280,2281,2282,2283,2284,2285,2286,2287,2288,2289,2290,2291,2292,2293,2294,2295,2296', '2246', '0', '0');
INSERT INTO `sx_area` VALUES ('2247', '梧州市', '21', '0,21', '1', '2247,2297,2298,2299,2300,2301,2302,2303,2304', '2247', '0', '0');
INSERT INTO `sx_area` VALUES ('2248', '北海市', '21', '0,21', '1', '2248,2305,2306,2307,2308', '2248', '0', '0');
INSERT INTO `sx_area` VALUES ('2249', '防城港市', '21', '0,21', '1', '2249,2309,2310,2311,2312', '2249', '0', '0');
INSERT INTO `sx_area` VALUES ('2250', '钦州市', '21', '0,21', '1', '2250,2313,2314,2315,2316', '2250', '0', '0');
INSERT INTO `sx_area` VALUES ('2251', '贵港市', '21', '0,21', '1', '2251,2317,2318,2319,2320', '2251', '0', '0');
INSERT INTO `sx_area` VALUES ('2252', '玉林市', '21', '0,21', '1', '2252,2321,2322,2323,2324,2325,2326', '2252', '0', '0');
INSERT INTO `sx_area` VALUES ('2253', '百色市', '21', '0,21', '1', '2253,2327,2328,2329,2330,2331,2332,2333,2334,2335,2336,2337,2338', '2253', '0', '0');
INSERT INTO `sx_area` VALUES ('2254', '贺州市', '21', '0,21', '1', '2254,2339,2340,2341,2342', '2254', '0', '0');
INSERT INTO `sx_area` VALUES ('2255', '河池市', '21', '0,21', '1', '2255,2343,2344,2345,2346,2347,2348,2349,2350,2351,2352,2353', '2255', '0', '0');
INSERT INTO `sx_area` VALUES ('2256', '来宾市', '21', '0,21', '1', '2256,2354,2355,2356,2357,2358,2359', '2256', '0', '0');
INSERT INTO `sx_area` VALUES ('2257', '崇左市', '21', '0,21', '1', '2257,2360,2361,2362,2363,2364,2365,2366', '2257', '0', '0');
INSERT INTO `sx_area` VALUES ('2258', '兴宁区', '2244', '0,21,2244', '0', '2258', '2258', '0', '0');
INSERT INTO `sx_area` VALUES ('2259', '新城区', '2244', '0,21,2244', '0', '2259', '2259', '0', '0');
INSERT INTO `sx_area` VALUES ('2260', '城北区', '2244', '0,21,2244', '0', '2260', '2260', '0', '0');
INSERT INTO `sx_area` VALUES ('2261', '江南区', '2244', '0,21,2244', '0', '2261', '2261', '0', '0');
INSERT INTO `sx_area` VALUES ('2262', '永新区', '2244', '0,21,2244', '0', '2262', '2262', '0', '0');
INSERT INTO `sx_area` VALUES ('2263', '邕宁县', '2244', '0,21,2244', '0', '2263', '2263', '0', '0');
INSERT INTO `sx_area` VALUES ('2264', '武鸣县', '2244', '0,21,2244', '0', '2264', '2264', '0', '0');
INSERT INTO `sx_area` VALUES ('2265', '隆安县', '2244', '0,21,2244', '0', '2265', '2265', '0', '0');
INSERT INTO `sx_area` VALUES ('2266', '马山县', '2244', '0,21,2244', '0', '2266', '2266', '0', '0');
INSERT INTO `sx_area` VALUES ('2267', '上林县', '2244', '0,21,2244', '0', '2267', '2267', '0', '0');
INSERT INTO `sx_area` VALUES ('2268', '宾阳县', '2244', '0,21,2244', '0', '2268', '2268', '0', '0');
INSERT INTO `sx_area` VALUES ('2269', '横县', '2244', '0,21,2244', '0', '2269', '2269', '0', '0');
INSERT INTO `sx_area` VALUES ('2270', '城中区', '2245', '0,21,2245', '0', '2270', '2270', '0', '0');
INSERT INTO `sx_area` VALUES ('2271', '鱼峰区', '2245', '0,21,2245', '0', '2271', '2271', '0', '0');
INSERT INTO `sx_area` VALUES ('2272', '柳南区', '2245', '0,21,2245', '0', '2272', '2272', '0', '0');
INSERT INTO `sx_area` VALUES ('2273', '柳北区', '2245', '0,21,2245', '0', '2273', '2273', '0', '0');
INSERT INTO `sx_area` VALUES ('2274', '柳江县', '2245', '0,21,2245', '0', '2274', '2274', '0', '0');
INSERT INTO `sx_area` VALUES ('2275', '柳城县', '2245', '0,21,2245', '0', '2275', '2275', '0', '0');
INSERT INTO `sx_area` VALUES ('2276', '鹿寨县', '2245', '0,21,2245', '0', '2276', '2276', '0', '0');
INSERT INTO `sx_area` VALUES ('2277', '融安县', '2245', '0,21,2245', '0', '2277', '2277', '0', '0');
INSERT INTO `sx_area` VALUES ('2278', '融水苗族自治县', '2245', '0,21,2245', '0', '2278', '2278', '0', '0');
INSERT INTO `sx_area` VALUES ('2279', '三江侗族自治县', '2245', '0,21,2245', '0', '2279', '2279', '0', '0');
INSERT INTO `sx_area` VALUES ('2280', '秀峰区', '2246', '0,21,2246', '0', '2280', '2280', '0', '0');
INSERT INTO `sx_area` VALUES ('2281', '叠彩区', '2246', '0,21,2246', '0', '2281', '2281', '0', '0');
INSERT INTO `sx_area` VALUES ('2282', '象山区', '2246', '0,21,2246', '0', '2282', '2282', '0', '0');
INSERT INTO `sx_area` VALUES ('2283', '七星区', '2246', '0,21,2246', '0', '2283', '2283', '0', '0');
INSERT INTO `sx_area` VALUES ('2284', '雁山区', '2246', '0,21,2246', '0', '2284', '2284', '0', '0');
INSERT INTO `sx_area` VALUES ('2285', '阳朔县', '2246', '0,21,2246', '0', '2285', '2285', '0', '0');
INSERT INTO `sx_area` VALUES ('2286', '临桂县', '2246', '0,21,2246', '0', '2286', '2286', '0', '0');
INSERT INTO `sx_area` VALUES ('2287', '灵川县', '2246', '0,21,2246', '0', '2287', '2287', '0', '0');
INSERT INTO `sx_area` VALUES ('2288', '全州县', '2246', '0,21,2246', '0', '2288', '2288', '0', '0');
INSERT INTO `sx_area` VALUES ('2289', '兴安县', '2246', '0,21,2246', '0', '2289', '2289', '0', '0');
INSERT INTO `sx_area` VALUES ('2290', '永福县', '2246', '0,21,2246', '0', '2290', '2290', '0', '0');
INSERT INTO `sx_area` VALUES ('2291', '灌阳县', '2246', '0,21,2246', '0', '2291', '2291', '0', '0');
INSERT INTO `sx_area` VALUES ('2292', '龙胜各族自治县', '2246', '0,21,2246', '0', '2292', '2292', '0', '0');
INSERT INTO `sx_area` VALUES ('2293', '资源县', '2246', '0,21,2246', '0', '2293', '2293', '0', '0');
INSERT INTO `sx_area` VALUES ('2294', '平乐县', '2246', '0,21,2246', '0', '2294', '2294', '0', '0');
INSERT INTO `sx_area` VALUES ('2295', '荔蒲县', '2246', '0,21,2246', '0', '2295', '2295', '0', '0');
INSERT INTO `sx_area` VALUES ('2296', '恭城瑶族自治县', '2246', '0,21,2246', '0', '2296', '2296', '0', '0');
INSERT INTO `sx_area` VALUES ('2297', '万秀区', '2247', '0,21,2247', '0', '2297', '2297', '0', '0');
INSERT INTO `sx_area` VALUES ('2298', '蝶山区', '2247', '0,21,2247', '0', '2298', '2298', '0', '0');
INSERT INTO `sx_area` VALUES ('2299', '长洲区', '2247', '0,21,2247', '0', '2299', '2299', '0', '0');
INSERT INTO `sx_area` VALUES ('2300', '市郊区', '2247', '0,21,2247', '0', '2300', '2300', '0', '0');
INSERT INTO `sx_area` VALUES ('2301', '苍梧县', '2247', '0,21,2247', '0', '2301', '2301', '0', '0');
INSERT INTO `sx_area` VALUES ('2302', '藤县', '2247', '0,21,2247', '0', '2302', '2302', '0', '0');
INSERT INTO `sx_area` VALUES ('2303', '蒙山县', '2247', '0,21,2247', '0', '2303', '2303', '0', '0');
INSERT INTO `sx_area` VALUES ('2304', '岑溪市', '2247', '0,21,2247', '0', '2304', '2304', '0', '0');
INSERT INTO `sx_area` VALUES ('2305', '海城区', '2248', '0,21,2248', '0', '2305', '2305', '0', '0');
INSERT INTO `sx_area` VALUES ('2306', '银海区', '2248', '0,21,2248', '0', '2306', '2306', '0', '0');
INSERT INTO `sx_area` VALUES ('2307', '铁山港区', '2248', '0,21,2248', '0', '2307', '2307', '0', '0');
INSERT INTO `sx_area` VALUES ('2308', '合浦县', '2248', '0,21,2248', '0', '2308', '2308', '0', '0');
INSERT INTO `sx_area` VALUES ('2309', '港口区', '2249', '0,21,2249', '0', '2309', '2309', '0', '0');
INSERT INTO `sx_area` VALUES ('2310', '防城区', '2249', '0,21,2249', '0', '2310', '2310', '0', '0');
INSERT INTO `sx_area` VALUES ('2311', '上思县', '2249', '0,21,2249', '0', '2311', '2311', '0', '0');
INSERT INTO `sx_area` VALUES ('2312', '东兴市', '2249', '0,21,2249', '0', '2312', '2312', '0', '0');
INSERT INTO `sx_area` VALUES ('2313', '钦南区', '2250', '0,21,2250', '0', '2313', '2313', '0', '0');
INSERT INTO `sx_area` VALUES ('2314', '钦北区', '2250', '0,21,2250', '0', '2314', '2314', '0', '0');
INSERT INTO `sx_area` VALUES ('2315', '灵山县', '2250', '0,21,2250', '0', '2315', '2315', '0', '0');
INSERT INTO `sx_area` VALUES ('2316', '浦北县', '2250', '0,21,2250', '0', '2316', '2316', '0', '0');
INSERT INTO `sx_area` VALUES ('2317', '港北区', '2251', '0,21,2251', '0', '2317', '2317', '0', '0');
INSERT INTO `sx_area` VALUES ('2318', '港南区', '2251', '0,21,2251', '0', '2318', '2318', '0', '0');
INSERT INTO `sx_area` VALUES ('2319', '平南县', '2251', '0,21,2251', '0', '2319', '2319', '0', '0');
INSERT INTO `sx_area` VALUES ('2320', '桂平市', '2251', '0,21,2251', '0', '2320', '2320', '0', '0');
INSERT INTO `sx_area` VALUES ('2321', '玉州区', '2252', '0,21,2252', '0', '2321', '2321', '0', '0');
INSERT INTO `sx_area` VALUES ('2322', '容县', '2252', '0,21,2252', '0', '2322', '2322', '0', '0');
INSERT INTO `sx_area` VALUES ('2323', '陆川县', '2252', '0,21,2252', '0', '2323', '2323', '0', '0');
INSERT INTO `sx_area` VALUES ('2324', '博白县', '2252', '0,21,2252', '0', '2324', '2324', '0', '0');
INSERT INTO `sx_area` VALUES ('2325', '兴业县', '2252', '0,21,2252', '0', '2325', '2325', '0', '0');
INSERT INTO `sx_area` VALUES ('2326', '北流市', '2252', '0,21,2252', '0', '2326', '2326', '0', '0');
INSERT INTO `sx_area` VALUES ('2327', '右江区', '2253', '0,21,2253', '0', '2327', '2327', '0', '0');
INSERT INTO `sx_area` VALUES ('2328', '田阳县', '2253', '0,21,2253', '0', '2328', '2328', '0', '0');
INSERT INTO `sx_area` VALUES ('2329', '田东县', '2253', '0,21,2253', '0', '2329', '2329', '0', '0');
INSERT INTO `sx_area` VALUES ('2330', '平果县', '2253', '0,21,2253', '0', '2330', '2330', '0', '0');
INSERT INTO `sx_area` VALUES ('2331', '德保县', '2253', '0,21,2253', '0', '2331', '2331', '0', '0');
INSERT INTO `sx_area` VALUES ('2332', '靖西县', '2253', '0,21,2253', '0', '2332', '2332', '0', '0');
INSERT INTO `sx_area` VALUES ('2333', '那坡县', '2253', '0,21,2253', '0', '2333', '2333', '0', '0');
INSERT INTO `sx_area` VALUES ('2334', '凌云县', '2253', '0,21,2253', '0', '2334', '2334', '0', '0');
INSERT INTO `sx_area` VALUES ('2335', '乐业县', '2253', '0,21,2253', '0', '2335', '2335', '0', '0');
INSERT INTO `sx_area` VALUES ('2336', '田林县', '2253', '0,21,2253', '0', '2336', '2336', '0', '0');
INSERT INTO `sx_area` VALUES ('2337', '西林县', '2253', '0,21,2253', '0', '2337', '2337', '0', '0');
INSERT INTO `sx_area` VALUES ('2338', '隆林各族自治县', '2253', '0,21,2253', '0', '2338', '2338', '0', '0');
INSERT INTO `sx_area` VALUES ('2339', '八步区', '2254', '0,21,2254', '0', '2339', '2339', '0', '0');
INSERT INTO `sx_area` VALUES ('2340', '昭平县', '2254', '0,21,2254', '0', '2340', '2340', '0', '0');
INSERT INTO `sx_area` VALUES ('2341', '钟山县', '2254', '0,21,2254', '0', '2341', '2341', '0', '0');
INSERT INTO `sx_area` VALUES ('2342', '富川瑶族自治县', '2254', '0,21,2254', '0', '2342', '2342', '0', '0');
INSERT INTO `sx_area` VALUES ('2343', '金城江区', '2255', '0,21,2255', '0', '2343', '2343', '0', '0');
INSERT INTO `sx_area` VALUES ('2344', '南丹县', '2255', '0,21,2255', '0', '2344', '2344', '0', '0');
INSERT INTO `sx_area` VALUES ('2345', '天峨县', '2255', '0,21,2255', '0', '2345', '2345', '0', '0');
INSERT INTO `sx_area` VALUES ('2346', '凤山县', '2255', '0,21,2255', '0', '2346', '2346', '0', '0');
INSERT INTO `sx_area` VALUES ('2347', '东兰县', '2255', '0,21,2255', '0', '2347', '2347', '0', '0');
INSERT INTO `sx_area` VALUES ('2348', '罗城仫佬族自治县', '2255', '0,21,2255', '0', '2348', '2348', '0', '0');
INSERT INTO `sx_area` VALUES ('2349', '环江毛南族自治县', '2255', '0,21,2255', '0', '2349', '2349', '0', '0');
INSERT INTO `sx_area` VALUES ('2350', '巴马瑶族自治县', '2255', '0,21,2255', '0', '2350', '2350', '0', '0');
INSERT INTO `sx_area` VALUES ('2351', '都安瑶族自治县', '2255', '0,21,2255', '0', '2351', '2351', '0', '0');
INSERT INTO `sx_area` VALUES ('2352', '大化瑶族自治县', '2255', '0,21,2255', '0', '2352', '2352', '0', '0');
INSERT INTO `sx_area` VALUES ('2353', '宜州市', '2255', '0,21,2255', '0', '2353', '2353', '0', '0');
INSERT INTO `sx_area` VALUES ('2354', '兴宾区', '2256', '0,21,2256', '0', '2354', '2354', '0', '0');
INSERT INTO `sx_area` VALUES ('2355', '忻城县', '2256', '0,21,2256', '0', '2355', '2355', '0', '0');
INSERT INTO `sx_area` VALUES ('2356', '象州县', '2256', '0,21,2256', '0', '2356', '2356', '0', '0');
INSERT INTO `sx_area` VALUES ('2357', '武宣县', '2256', '0,21,2256', '0', '2357', '2357', '0', '0');
INSERT INTO `sx_area` VALUES ('2358', '金秀瑶族自治县', '2256', '0,21,2256', '0', '2358', '2358', '0', '0');
INSERT INTO `sx_area` VALUES ('2359', '合山市', '2256', '0,21,2256', '0', '2359', '2359', '0', '0');
INSERT INTO `sx_area` VALUES ('2360', '江洲区', '2257', '0,21,2257', '0', '2360', '2360', '0', '0');
INSERT INTO `sx_area` VALUES ('2361', '扶绥县', '2257', '0,21,2257', '0', '2361', '2361', '0', '0');
INSERT INTO `sx_area` VALUES ('2362', '宁明县', '2257', '0,21,2257', '0', '2362', '2362', '0', '0');
INSERT INTO `sx_area` VALUES ('2363', '龙州县', '2257', '0,21,2257', '0', '2363', '2363', '0', '0');
INSERT INTO `sx_area` VALUES ('2364', '大新县', '2257', '0,21,2257', '0', '2364', '2364', '0', '0');
INSERT INTO `sx_area` VALUES ('2365', '天等县', '2257', '0,21,2257', '0', '2365', '2365', '0', '0');
INSERT INTO `sx_area` VALUES ('2366', '凭祥市', '2257', '0,21,2257', '0', '2366', '2366', '0', '0');
INSERT INTO `sx_area` VALUES ('2367', '海口市', '22', '0,22', '1', '2367,2370,2371,2372,2373', '2367', '0', '0');
INSERT INTO `sx_area` VALUES ('2368', '三亚市', '22', '0,22', '0', '2368', '2368', '0', '0');
INSERT INTO `sx_area` VALUES ('2369', '省直辖县级行政单位', '22', '0,22', '1', '2369,2374,2375,2376,2377,2378,2379,2380,2381,2382,2383,2384,2385,2386,2387,2388,2389,2390,2391', '2369', '0', '0');
INSERT INTO `sx_area` VALUES ('2370', '秀英区', '2367', '0,22,2367', '0', '2370', '2370', '0', '0');
INSERT INTO `sx_area` VALUES ('2371', '龙华区', '2367', '0,22,2367', '0', '2371', '2371', '0', '0');
INSERT INTO `sx_area` VALUES ('2372', '琼山区', '2367', '0,22,2367', '0', '2372', '2372', '0', '0');
INSERT INTO `sx_area` VALUES ('2373', '美兰区', '2367', '0,22,2367', '0', '2373', '2373', '0', '0');
INSERT INTO `sx_area` VALUES ('2374', '五指山市', '2369', '0,22,2369', '0', '2374', '2374', '0', '0');
INSERT INTO `sx_area` VALUES ('2375', '琼海市', '2369', '0,22,2369', '0', '2375', '2375', '0', '0');
INSERT INTO `sx_area` VALUES ('2376', '儋州市', '2369', '0,22,2369', '0', '2376', '2376', '0', '0');
INSERT INTO `sx_area` VALUES ('2377', '文昌市', '2369', '0,22,2369', '0', '2377', '2377', '0', '0');
INSERT INTO `sx_area` VALUES ('2378', '万宁市', '2369', '0,22,2369', '0', '2378', '2378', '0', '0');
INSERT INTO `sx_area` VALUES ('2379', '东方市', '2369', '0,22,2369', '0', '2379', '2379', '0', '0');
INSERT INTO `sx_area` VALUES ('2380', '定安县', '2369', '0,22,2369', '0', '2380', '2380', '0', '0');
INSERT INTO `sx_area` VALUES ('2381', '屯昌县', '2369', '0,22,2369', '0', '2381', '2381', '0', '0');
INSERT INTO `sx_area` VALUES ('2382', '澄迈县', '2369', '0,22,2369', '0', '2382', '2382', '0', '0');
INSERT INTO `sx_area` VALUES ('2383', '临高县', '2369', '0,22,2369', '0', '2383', '2383', '0', '0');
INSERT INTO `sx_area` VALUES ('2384', '白沙黎族自治县', '2369', '0,22,2369', '0', '2384', '2384', '0', '0');
INSERT INTO `sx_area` VALUES ('2385', '昌江黎族自治县', '2369', '0,22,2369', '0', '2385', '2385', '0', '0');
INSERT INTO `sx_area` VALUES ('2386', '乐东黎族自治县', '2369', '0,22,2369', '0', '2386', '2386', '0', '0');
INSERT INTO `sx_area` VALUES ('2387', '陵水黎族自治县', '2369', '0,22,2369', '0', '2387', '2387', '0', '0');
INSERT INTO `sx_area` VALUES ('2388', '保亭黎族苗族自治县', '2369', '0,22,2369', '0', '2388', '2388', '0', '0');
INSERT INTO `sx_area` VALUES ('2389', '琼中黎族苗族自治县', '2369', '0,22,2369', '0', '2389', '2389', '0', '0');
INSERT INTO `sx_area` VALUES ('2390', '西沙群岛', '2369', '0,22,2369', '0', '2390', '2390', '0', '0');
INSERT INTO `sx_area` VALUES ('2391', '南沙群岛', '2369', '0,22,2369', '0', '2391', '2391', '0', '0');
INSERT INTO `sx_area` VALUES ('2392', '成都市', '23', '0,23', '1', '2392,2413,2414,2415,2416,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2429,2430,2431', '2392', '0', '0');
INSERT INTO `sx_area` VALUES ('2393', '自贡市', '23', '0,23', '1', '2393,2432,2433,2434,2435,2436,2437', '2393', '0', '0');
INSERT INTO `sx_area` VALUES ('2394', '攀枝花市', '23', '0,23', '1', '2394,2438,2439,2440,2441,2442', '2394', '0', '0');
INSERT INTO `sx_area` VALUES ('2395', '泸州市', '23', '0,23', '1', '2395,2443,2444,2445,2446,2447,2448,2449', '2395', '0', '0');
INSERT INTO `sx_area` VALUES ('2396', '德阳市', '23', '0,23', '1', '2396,2450,2451,2452,2453,2454,2455', '2396', '0', '0');
INSERT INTO `sx_area` VALUES ('2397', '绵阳市', '23', '0,23', '1', '2397,2456,2457,2458,2459,2460,2461,2462,2463,2464', '2397', '0', '0');
INSERT INTO `sx_area` VALUES ('2398', '广元市', '23', '0,23', '1', '2398,2465,2466,2467,2468,2469,2470,2471', '2398', '0', '0');
INSERT INTO `sx_area` VALUES ('2399', '遂宁市', '23', '0,23', '1', '2399,2472,2473,2474,2475', '2399', '0', '0');
INSERT INTO `sx_area` VALUES ('2400', '内江市', '23', '0,23', '1', '2400,2476,2477,2478,2479,2480', '2400', '0', '0');
INSERT INTO `sx_area` VALUES ('2401', '乐山市', '23', '0,23', '1', '2401,2481,2482,2483,2484,2485,2486,2487,2488,2489,2490,2491', '2401', '0', '0');
INSERT INTO `sx_area` VALUES ('2402', '南充市', '23', '0,23', '1', '2402,2492,2493,2494,2495,2496,2497,2498,2499,2500', '2402', '0', '0');
INSERT INTO `sx_area` VALUES ('2403', '眉山市', '23', '0,23', '1', '2403,2501,2502,2503,2504,2505,2506', '2403', '0', '0');
INSERT INTO `sx_area` VALUES ('2404', '宜宾市', '23', '0,23', '1', '2404,2507,2508,2509,2510,2511,2512,2513,2514,2515,2516', '2404', '0', '0');
INSERT INTO `sx_area` VALUES ('2405', '广安市', '23', '0,23', '1', '2405,2517,2518,2519,2520,2521', '2405', '0', '0');
INSERT INTO `sx_area` VALUES ('2406', '达州市', '23', '0,23', '1', '2406,2522,2523,2524,2525,2526,2527,2528', '2406', '0', '0');
INSERT INTO `sx_area` VALUES ('2407', '雅安市', '23', '0,23', '1', '2407,2529,2530,2531,2532,2533,2534,2535,2536', '2407', '0', '0');
INSERT INTO `sx_area` VALUES ('2408', '巴中市', '23', '0,23', '1', '2408,2537,2538,2539,2540', '2408', '0', '0');
INSERT INTO `sx_area` VALUES ('2409', '资阳市', '23', '0,23', '1', '2409,2541,2542,2543,2544', '2409', '0', '0');
INSERT INTO `sx_area` VALUES ('2410', '阿坝藏族羌族自治州', '23', '0,23', '1', '2410,2545,2546,2547,2548,2549,2550,2551,2552,2553,2554,2555,2556,2557', '2410', '0', '0');
INSERT INTO `sx_area` VALUES ('2411', '甘孜藏族自治州', '23', '0,23', '1', '2411,2558,2559,2560,2561,2562,2563,2564,2565,2566,2567,2568,2569,2570,2571,2572,2573,2574,2575', '2411', '0', '0');
INSERT INTO `sx_area` VALUES ('2412', '凉山彝族自治州', '23', '0,23', '1', '2412,2576,2577,2578,2579,2580,2581,2582,2583,2584,2585,2586,2587,2588,2589,2590,2591,2592', '2412', '0', '0');
INSERT INTO `sx_area` VALUES ('2413', '锦江区', '2392', '0,23,2392', '0', '2413', '2413', '0', '0');
INSERT INTO `sx_area` VALUES ('2414', '青羊区', '2392', '0,23,2392', '0', '2414', '2414', '0', '0');
INSERT INTO `sx_area` VALUES ('2415', '金牛区', '2392', '0,23,2392', '0', '2415', '2415', '0', '0');
INSERT INTO `sx_area` VALUES ('2416', '武侯区', '2392', '0,23,2392', '0', '2416', '2416', '0', '0');
INSERT INTO `sx_area` VALUES ('2417', '成华区', '2392', '0,23,2392', '0', '2417', '2417', '0', '0');
INSERT INTO `sx_area` VALUES ('2418', '龙泉驿区', '2392', '0,23,2392', '0', '2418', '2418', '0', '0');
INSERT INTO `sx_area` VALUES ('2419', '青白江区', '2392', '0,23,2392', '0', '2419', '2419', '0', '0');
INSERT INTO `sx_area` VALUES ('2420', '新都区', '2392', '0,23,2392', '0', '2420', '2420', '0', '0');
INSERT INTO `sx_area` VALUES ('2421', '金堂县', '2392', '0,23,2392', '0', '2421', '2421', '0', '0');
INSERT INTO `sx_area` VALUES ('2422', '双流县', '2392', '0,23,2392', '0', '2422', '2422', '0', '0');
INSERT INTO `sx_area` VALUES ('2423', '温江县', '2392', '0,23,2392', '0', '2423', '2423', '0', '0');
INSERT INTO `sx_area` VALUES ('2424', '郫县', '2392', '0,23,2392', '0', '2424', '2424', '0', '0');
INSERT INTO `sx_area` VALUES ('2425', '大邑县', '2392', '0,23,2392', '0', '2425', '2425', '0', '0');
INSERT INTO `sx_area` VALUES ('2426', '蒲江县', '2392', '0,23,2392', '0', '2426', '2426', '0', '0');
INSERT INTO `sx_area` VALUES ('2427', '新津县', '2392', '0,23,2392', '0', '2427', '2427', '0', '0');
INSERT INTO `sx_area` VALUES ('2428', '都江堰市', '2392', '0,23,2392', '0', '2428', '2428', '0', '0');
INSERT INTO `sx_area` VALUES ('2429', '彭州市', '2392', '0,23,2392', '0', '2429', '2429', '0', '0');
INSERT INTO `sx_area` VALUES ('2430', '邛崃市', '2392', '0,23,2392', '0', '2430', '2430', '0', '0');
INSERT INTO `sx_area` VALUES ('2431', '崇州市', '2392', '0,23,2392', '0', '2431', '2431', '0', '0');
INSERT INTO `sx_area` VALUES ('2432', '自流井区', '2393', '0,23,2393', '0', '2432', '2432', '0', '0');
INSERT INTO `sx_area` VALUES ('2433', '贡井区', '2393', '0,23,2393', '0', '2433', '2433', '0', '0');
INSERT INTO `sx_area` VALUES ('2434', '大安区', '2393', '0,23,2393', '0', '2434', '2434', '0', '0');
INSERT INTO `sx_area` VALUES ('2435', '沿滩区', '2393', '0,23,2393', '0', '2435', '2435', '0', '0');
INSERT INTO `sx_area` VALUES ('2436', '荣县', '2393', '0,23,2393', '0', '2436', '2436', '0', '0');
INSERT INTO `sx_area` VALUES ('2437', '富顺县', '2393', '0,23,2393', '0', '2437', '2437', '0', '0');
INSERT INTO `sx_area` VALUES ('2438', '东区', '2394', '0,23,2394', '0', '2438', '2438', '0', '0');
INSERT INTO `sx_area` VALUES ('2439', '西区', '2394', '0,23,2394', '0', '2439', '2439', '0', '0');
INSERT INTO `sx_area` VALUES ('2440', '仁和区', '2394', '0,23,2394', '0', '2440', '2440', '0', '0');
INSERT INTO `sx_area` VALUES ('2441', '米易县', '2394', '0,23,2394', '0', '2441', '2441', '0', '0');
INSERT INTO `sx_area` VALUES ('2442', '盐边县', '2394', '0,23,2394', '0', '2442', '2442', '0', '0');
INSERT INTO `sx_area` VALUES ('2443', '江阳区', '2395', '0,23,2395', '0', '2443', '2443', '0', '0');
INSERT INTO `sx_area` VALUES ('2444', '纳溪区', '2395', '0,23,2395', '0', '2444', '2444', '0', '0');
INSERT INTO `sx_area` VALUES ('2445', '龙马潭区', '2395', '0,23,2395', '0', '2445', '2445', '0', '0');
INSERT INTO `sx_area` VALUES ('2446', '泸县', '2395', '0,23,2395', '0', '2446', '2446', '0', '0');
INSERT INTO `sx_area` VALUES ('2447', '合江县', '2395', '0,23,2395', '0', '2447', '2447', '0', '0');
INSERT INTO `sx_area` VALUES ('2448', '叙永县', '2395', '0,23,2395', '0', '2448', '2448', '0', '0');
INSERT INTO `sx_area` VALUES ('2449', '古蔺县', '2395', '0,23,2395', '0', '2449', '2449', '0', '0');
INSERT INTO `sx_area` VALUES ('2450', '旌阳区', '2396', '0,23,2396', '0', '2450', '2450', '0', '0');
INSERT INTO `sx_area` VALUES ('2451', '中江县', '2396', '0,23,2396', '0', '2451', '2451', '0', '0');
INSERT INTO `sx_area` VALUES ('2452', '罗江县', '2396', '0,23,2396', '0', '2452', '2452', '0', '0');
INSERT INTO `sx_area` VALUES ('2453', '广汉市', '2396', '0,23,2396', '0', '2453', '2453', '0', '0');
INSERT INTO `sx_area` VALUES ('2454', '什邡市', '2396', '0,23,2396', '0', '2454', '2454', '0', '0');
INSERT INTO `sx_area` VALUES ('2455', '绵竹市', '2396', '0,23,2396', '0', '2455', '2455', '0', '0');
INSERT INTO `sx_area` VALUES ('2456', '涪城区', '2397', '0,23,2397', '0', '2456', '2456', '0', '0');
INSERT INTO `sx_area` VALUES ('2457', '游仙区', '2397', '0,23,2397', '0', '2457', '2457', '0', '0');
INSERT INTO `sx_area` VALUES ('2458', '三台县', '2397', '0,23,2397', '0', '2458', '2458', '0', '0');
INSERT INTO `sx_area` VALUES ('2459', '盐亭县', '2397', '0,23,2397', '0', '2459', '2459', '0', '0');
INSERT INTO `sx_area` VALUES ('2460', '安县', '2397', '0,23,2397', '0', '2460', '2460', '0', '0');
INSERT INTO `sx_area` VALUES ('2461', '梓潼县', '2397', '0,23,2397', '0', '2461', '2461', '0', '0');
INSERT INTO `sx_area` VALUES ('2462', '北川县', '2397', '0,23,2397', '0', '2462', '2462', '0', '0');
INSERT INTO `sx_area` VALUES ('2463', '平武县', '2397', '0,23,2397', '0', '2463', '2463', '0', '0');
INSERT INTO `sx_area` VALUES ('2464', '江油市', '2397', '0,23,2397', '0', '2464', '2464', '0', '0');
INSERT INTO `sx_area` VALUES ('2465', '市中区', '2398', '0,23,2398', '0', '2465', '2465', '0', '0');
INSERT INTO `sx_area` VALUES ('2466', '元坝区', '2398', '0,23,2398', '0', '2466', '2466', '0', '0');
INSERT INTO `sx_area` VALUES ('2467', '朝天区', '2398', '0,23,2398', '0', '2467', '2467', '0', '0');
INSERT INTO `sx_area` VALUES ('2468', '旺苍县', '2398', '0,23,2398', '0', '2468', '2468', '0', '0');
INSERT INTO `sx_area` VALUES ('2469', '青川县', '2398', '0,23,2398', '0', '2469', '2469', '0', '0');
INSERT INTO `sx_area` VALUES ('2470', '剑阁县', '2398', '0,23,2398', '0', '2470', '2470', '0', '0');
INSERT INTO `sx_area` VALUES ('2471', '苍溪县', '2398', '0,23,2398', '0', '2471', '2471', '0', '0');
INSERT INTO `sx_area` VALUES ('2472', '市中区', '2399', '0,23,2399', '0', '2472', '2472', '0', '0');
INSERT INTO `sx_area` VALUES ('2473', '蓬溪县', '2399', '0,23,2399', '0', '2473', '2473', '0', '0');
INSERT INTO `sx_area` VALUES ('2474', '射洪县', '2399', '0,23,2399', '0', '2474', '2474', '0', '0');
INSERT INTO `sx_area` VALUES ('2475', '大英县', '2399', '0,23,2399', '0', '2475', '2475', '0', '0');
INSERT INTO `sx_area` VALUES ('2476', '市中区', '2400', '0,23,2400', '0', '2476', '2476', '0', '0');
INSERT INTO `sx_area` VALUES ('2477', '东兴区', '2400', '0,23,2400', '0', '2477', '2477', '0', '0');
INSERT INTO `sx_area` VALUES ('2478', '威远县', '2400', '0,23,2400', '0', '2478', '2478', '0', '0');
INSERT INTO `sx_area` VALUES ('2479', '资中县', '2400', '0,23,2400', '0', '2479', '2479', '0', '0');
INSERT INTO `sx_area` VALUES ('2480', '隆昌县', '2400', '0,23,2400', '0', '2480', '2480', '0', '0');
INSERT INTO `sx_area` VALUES ('2481', '市中区', '2401', '0,23,2401', '0', '2481', '2481', '0', '0');
INSERT INTO `sx_area` VALUES ('2482', '沙湾区', '2401', '0,23,2401', '0', '2482', '2482', '0', '0');
INSERT INTO `sx_area` VALUES ('2483', '五通桥区', '2401', '0,23,2401', '0', '2483', '2483', '0', '0');
INSERT INTO `sx_area` VALUES ('2484', '金口河区', '2401', '0,23,2401', '0', '2484', '2484', '0', '0');
INSERT INTO `sx_area` VALUES ('2485', '犍为县', '2401', '0,23,2401', '0', '2485', '2485', '0', '0');
INSERT INTO `sx_area` VALUES ('2486', '井研县', '2401', '0,23,2401', '0', '2486', '2486', '0', '0');
INSERT INTO `sx_area` VALUES ('2487', '夹江县', '2401', '0,23,2401', '0', '2487', '2487', '0', '0');
INSERT INTO `sx_area` VALUES ('2488', '沐川县', '2401', '0,23,2401', '0', '2488', '2488', '0', '0');
INSERT INTO `sx_area` VALUES ('2489', '峨边彝族自治县', '2401', '0,23,2401', '0', '2489', '2489', '0', '0');
INSERT INTO `sx_area` VALUES ('2490', '马边彝族自治县', '2401', '0,23,2401', '0', '2490', '2490', '0', '0');
INSERT INTO `sx_area` VALUES ('2491', '峨眉山市', '2401', '0,23,2401', '0', '2491', '2491', '0', '0');
INSERT INTO `sx_area` VALUES ('2492', '顺庆区', '2402', '0,23,2402', '0', '2492', '2492', '0', '0');
INSERT INTO `sx_area` VALUES ('2493', '高坪区', '2402', '0,23,2402', '0', '2493', '2493', '0', '0');
INSERT INTO `sx_area` VALUES ('2494', '嘉陵区', '2402', '0,23,2402', '0', '2494', '2494', '0', '0');
INSERT INTO `sx_area` VALUES ('2495', '南部县', '2402', '0,23,2402', '0', '2495', '2495', '0', '0');
INSERT INTO `sx_area` VALUES ('2496', '营山县', '2402', '0,23,2402', '0', '2496', '2496', '0', '0');
INSERT INTO `sx_area` VALUES ('2497', '蓬安县', '2402', '0,23,2402', '0', '2497', '2497', '0', '0');
INSERT INTO `sx_area` VALUES ('2498', '仪陇县', '2402', '0,23,2402', '0', '2498', '2498', '0', '0');
INSERT INTO `sx_area` VALUES ('2499', '西充县', '2402', '0,23,2402', '0', '2499', '2499', '0', '0');
INSERT INTO `sx_area` VALUES ('2500', '阆中市', '2402', '0,23,2402', '0', '2500', '2500', '0', '0');
INSERT INTO `sx_area` VALUES ('2501', '东坡区', '2403', '0,23,2403', '0', '2501', '2501', '0', '0');
INSERT INTO `sx_area` VALUES ('2502', '仁寿县', '2403', '0,23,2403', '0', '2502', '2502', '0', '0');
INSERT INTO `sx_area` VALUES ('2503', '彭山县', '2403', '0,23,2403', '0', '2503', '2503', '0', '0');
INSERT INTO `sx_area` VALUES ('2504', '洪雅县', '2403', '0,23,2403', '0', '2504', '2504', '0', '0');
INSERT INTO `sx_area` VALUES ('2505', '丹棱县', '2403', '0,23,2403', '0', '2505', '2505', '0', '0');
INSERT INTO `sx_area` VALUES ('2506', '青神县', '2403', '0,23,2403', '0', '2506', '2506', '0', '0');
INSERT INTO `sx_area` VALUES ('2507', '翠屏区', '2404', '0,23,2404', '0', '2507', '2507', '0', '0');
INSERT INTO `sx_area` VALUES ('2508', '宜宾县', '2404', '0,23,2404', '0', '2508', '2508', '0', '0');
INSERT INTO `sx_area` VALUES ('2509', '南溪县', '2404', '0,23,2404', '0', '2509', '2509', '0', '0');
INSERT INTO `sx_area` VALUES ('2510', '江安县', '2404', '0,23,2404', '0', '2510', '2510', '0', '0');
INSERT INTO `sx_area` VALUES ('2511', '长宁县', '2404', '0,23,2404', '0', '2511', '2511', '0', '0');
INSERT INTO `sx_area` VALUES ('2512', '高县', '2404', '0,23,2404', '0', '2512', '2512', '0', '0');
INSERT INTO `sx_area` VALUES ('2513', '珙县', '2404', '0,23,2404', '0', '2513', '2513', '0', '0');
INSERT INTO `sx_area` VALUES ('2514', '筠连县', '2404', '0,23,2404', '0', '2514', '2514', '0', '0');
INSERT INTO `sx_area` VALUES ('2515', '兴文县', '2404', '0,23,2404', '0', '2515', '2515', '0', '0');
INSERT INTO `sx_area` VALUES ('2516', '屏山县', '2404', '0,23,2404', '0', '2516', '2516', '0', '0');
INSERT INTO `sx_area` VALUES ('2517', '广安区', '2405', '0,23,2405', '0', '2517', '2517', '0', '0');
INSERT INTO `sx_area` VALUES ('2518', '岳池县', '2405', '0,23,2405', '0', '2518', '2518', '0', '0');
INSERT INTO `sx_area` VALUES ('2519', '武胜县', '2405', '0,23,2405', '0', '2519', '2519', '0', '0');
INSERT INTO `sx_area` VALUES ('2520', '邻水县', '2405', '0,23,2405', '0', '2520', '2520', '0', '0');
INSERT INTO `sx_area` VALUES ('2521', '华莹市', '2405', '0,23,2405', '0', '2521', '2521', '0', '0');
INSERT INTO `sx_area` VALUES ('2522', '通川区', '2406', '0,23,2406', '0', '2522', '2522', '0', '0');
INSERT INTO `sx_area` VALUES ('2523', '达县', '2406', '0,23,2406', '0', '2523', '2523', '0', '0');
INSERT INTO `sx_area` VALUES ('2524', '宣汉县', '2406', '0,23,2406', '0', '2524', '2524', '0', '0');
INSERT INTO `sx_area` VALUES ('2525', '开江县', '2406', '0,23,2406', '0', '2525', '2525', '0', '0');
INSERT INTO `sx_area` VALUES ('2526', '大竹县', '2406', '0,23,2406', '0', '2526', '2526', '0', '0');
INSERT INTO `sx_area` VALUES ('2527', '渠县', '2406', '0,23,2406', '0', '2527', '2527', '0', '0');
INSERT INTO `sx_area` VALUES ('2528', '万源市', '2406', '0,23,2406', '0', '2528', '2528', '0', '0');
INSERT INTO `sx_area` VALUES ('2529', '雨城区', '2407', '0,23,2407', '0', '2529', '2529', '0', '0');
INSERT INTO `sx_area` VALUES ('2530', '名山县', '2407', '0,23,2407', '0', '2530', '2530', '0', '0');
INSERT INTO `sx_area` VALUES ('2531', '荥经县', '2407', '0,23,2407', '0', '2531', '2531', '0', '0');
INSERT INTO `sx_area` VALUES ('2532', '汉源县', '2407', '0,23,2407', '0', '2532', '2532', '0', '0');
INSERT INTO `sx_area` VALUES ('2533', '石棉县', '2407', '0,23,2407', '0', '2533', '2533', '0', '0');
INSERT INTO `sx_area` VALUES ('2534', '天全县', '2407', '0,23,2407', '0', '2534', '2534', '0', '0');
INSERT INTO `sx_area` VALUES ('2535', '芦山县', '2407', '0,23,2407', '0', '2535', '2535', '0', '0');
INSERT INTO `sx_area` VALUES ('2536', '宝兴县', '2407', '0,23,2407', '0', '2536', '2536', '0', '0');
INSERT INTO `sx_area` VALUES ('2537', '巴州区', '2408', '0,23,2408', '0', '2537', '2537', '0', '0');
INSERT INTO `sx_area` VALUES ('2538', '通江县', '2408', '0,23,2408', '0', '2538', '2538', '0', '0');
INSERT INTO `sx_area` VALUES ('2539', '南江县', '2408', '0,23,2408', '0', '2539', '2539', '0', '0');
INSERT INTO `sx_area` VALUES ('2540', '平昌县', '2408', '0,23,2408', '0', '2540', '2540', '0', '0');
INSERT INTO `sx_area` VALUES ('2541', '雁江区', '2409', '0,23,2409', '0', '2541', '2541', '0', '0');
INSERT INTO `sx_area` VALUES ('2542', '安岳县', '2409', '0,23,2409', '0', '2542', '2542', '0', '0');
INSERT INTO `sx_area` VALUES ('2543', '乐至县', '2409', '0,23,2409', '0', '2543', '2543', '0', '0');
INSERT INTO `sx_area` VALUES ('2544', '简阳市', '2409', '0,23,2409', '0', '2544', '2544', '0', '0');
INSERT INTO `sx_area` VALUES ('2545', '汶川县', '2410', '0,23,2410', '0', '2545', '2545', '0', '0');
INSERT INTO `sx_area` VALUES ('2546', '理县', '2410', '0,23,2410', '0', '2546', '2546', '0', '0');
INSERT INTO `sx_area` VALUES ('2547', '茂县', '2410', '0,23,2410', '0', '2547', '2547', '0', '0');
INSERT INTO `sx_area` VALUES ('2548', '松潘县', '2410', '0,23,2410', '0', '2548', '2548', '0', '0');
INSERT INTO `sx_area` VALUES ('2549', '九寨沟县', '2410', '0,23,2410', '0', '2549', '2549', '0', '0');
INSERT INTO `sx_area` VALUES ('2550', '金川县', '2410', '0,23,2410', '0', '2550', '2550', '0', '0');
INSERT INTO `sx_area` VALUES ('2551', '小金县', '2410', '0,23,2410', '0', '2551', '2551', '0', '0');
INSERT INTO `sx_area` VALUES ('2552', '黑水县', '2410', '0,23,2410', '0', '2552', '2552', '0', '0');
INSERT INTO `sx_area` VALUES ('2553', '马尔康县', '2410', '0,23,2410', '0', '2553', '2553', '0', '0');
INSERT INTO `sx_area` VALUES ('2554', '壤塘县', '2410', '0,23,2410', '0', '2554', '2554', '0', '0');
INSERT INTO `sx_area` VALUES ('2555', '阿坝县', '2410', '0,23,2410', '0', '2555', '2555', '0', '0');
INSERT INTO `sx_area` VALUES ('2556', '若尔盖县', '2410', '0,23,2410', '0', '2556', '2556', '0', '0');
INSERT INTO `sx_area` VALUES ('2557', '红原县', '2410', '0,23,2410', '0', '2557', '2557', '0', '0');
INSERT INTO `sx_area` VALUES ('2558', '康定县', '2411', '0,23,2411', '0', '2558', '2558', '0', '0');
INSERT INTO `sx_area` VALUES ('2559', '泸定县', '2411', '0,23,2411', '0', '2559', '2559', '0', '0');
INSERT INTO `sx_area` VALUES ('2560', '丹巴县', '2411', '0,23,2411', '0', '2560', '2560', '0', '0');
INSERT INTO `sx_area` VALUES ('2561', '九龙县', '2411', '0,23,2411', '0', '2561', '2561', '0', '0');
INSERT INTO `sx_area` VALUES ('2562', '雅江县', '2411', '0,23,2411', '0', '2562', '2562', '0', '0');
INSERT INTO `sx_area` VALUES ('2563', '道孚县', '2411', '0,23,2411', '0', '2563', '2563', '0', '0');
INSERT INTO `sx_area` VALUES ('2564', '炉霍县', '2411', '0,23,2411', '0', '2564', '2564', '0', '0');
INSERT INTO `sx_area` VALUES ('2565', '甘孜县', '2411', '0,23,2411', '0', '2565', '2565', '0', '0');
INSERT INTO `sx_area` VALUES ('2566', '新龙县', '2411', '0,23,2411', '0', '2566', '2566', '0', '0');
INSERT INTO `sx_area` VALUES ('2567', '德格县', '2411', '0,23,2411', '0', '2567', '2567', '0', '0');
INSERT INTO `sx_area` VALUES ('2568', '白玉县', '2411', '0,23,2411', '0', '2568', '2568', '0', '0');
INSERT INTO `sx_area` VALUES ('2569', '石渠县', '2411', '0,23,2411', '0', '2569', '2569', '0', '0');
INSERT INTO `sx_area` VALUES ('2570', '色达县', '2411', '0,23,2411', '0', '2570', '2570', '0', '0');
INSERT INTO `sx_area` VALUES ('2571', '理塘县', '2411', '0,23,2411', '0', '2571', '2571', '0', '0');
INSERT INTO `sx_area` VALUES ('2572', '巴塘县', '2411', '0,23,2411', '0', '2572', '2572', '0', '0');
INSERT INTO `sx_area` VALUES ('2573', '乡城县', '2411', '0,23,2411', '0', '2573', '2573', '0', '0');
INSERT INTO `sx_area` VALUES ('2574', '稻城县', '2411', '0,23,2411', '0', '2574', '2574', '0', '0');
INSERT INTO `sx_area` VALUES ('2575', '得荣县', '2411', '0,23,2411', '0', '2575', '2575', '0', '0');
INSERT INTO `sx_area` VALUES ('2576', '西昌市', '2412', '0,23,2412', '0', '2576', '2576', '0', '0');
INSERT INTO `sx_area` VALUES ('2577', '木里藏族自治县', '2412', '0,23,2412', '0', '2577', '2577', '0', '0');
INSERT INTO `sx_area` VALUES ('2578', '盐源县', '2412', '0,23,2412', '0', '2578', '2578', '0', '0');
INSERT INTO `sx_area` VALUES ('2579', '德昌县', '2412', '0,23,2412', '0', '2579', '2579', '0', '0');
INSERT INTO `sx_area` VALUES ('2580', '会理县', '2412', '0,23,2412', '0', '2580', '2580', '0', '0');
INSERT INTO `sx_area` VALUES ('2581', '会东县', '2412', '0,23,2412', '0', '2581', '2581', '0', '0');
INSERT INTO `sx_area` VALUES ('2582', '宁南县', '2412', '0,23,2412', '0', '2582', '2582', '0', '0');
INSERT INTO `sx_area` VALUES ('2583', '普格县', '2412', '0,23,2412', '0', '2583', '2583', '0', '0');
INSERT INTO `sx_area` VALUES ('2584', '布拖县', '2412', '0,23,2412', '0', '2584', '2584', '0', '0');
INSERT INTO `sx_area` VALUES ('2585', '金阳县', '2412', '0,23,2412', '0', '2585', '2585', '0', '0');
INSERT INTO `sx_area` VALUES ('2586', '昭觉县', '2412', '0,23,2412', '0', '2586', '2586', '0', '0');
INSERT INTO `sx_area` VALUES ('2587', '喜德县', '2412', '0,23,2412', '0', '2587', '2587', '0', '0');
INSERT INTO `sx_area` VALUES ('2588', '冕宁县', '2412', '0,23,2412', '0', '2588', '2588', '0', '0');
INSERT INTO `sx_area` VALUES ('2589', '越西县', '2412', '0,23,2412', '0', '2589', '2589', '0', '0');
INSERT INTO `sx_area` VALUES ('2590', '甘洛县', '2412', '0,23,2412', '0', '2590', '2590', '0', '0');
INSERT INTO `sx_area` VALUES ('2591', '美姑县', '2412', '0,23,2412', '0', '2591', '2591', '0', '0');
INSERT INTO `sx_area` VALUES ('2592', '雷波县', '2412', '0,23,2412', '0', '2592', '2592', '0', '0');
INSERT INTO `sx_area` VALUES ('2593', '贵阳市', '24', '0,24', '1', '2593,2602,2603,2604,2605,2606,2607,2608,2609,2610,2611', '2593', '0', '0');
INSERT INTO `sx_area` VALUES ('2594', '六盘水市', '24', '0,24', '1', '2594,2612,2613,2614,2615', '2594', '0', '0');
INSERT INTO `sx_area` VALUES ('2595', '遵义市', '24', '0,24', '1', '2595,2616,2617,2618,2619,2620,2621,2622,2623,2624,2625,2626,2627,2628', '2595', '0', '0');
INSERT INTO `sx_area` VALUES ('2596', '安顺市', '24', '0,24', '1', '2596,2629,2630,2631,2632,2633,2634', '2596', '0', '0');
INSERT INTO `sx_area` VALUES ('2597', '铜仁地区', '24', '0,24', '1', '2597,2635,2636,2637,2638,2639,2640,2641,2642,2643,2644', '2597', '0', '0');
INSERT INTO `sx_area` VALUES ('2598', '黔西南州', '24', '0,24', '1', '2598,2645,2646,2647,2648,2649,2650,2651,2652', '2598', '0', '0');
INSERT INTO `sx_area` VALUES ('2599', '毕节地区', '24', '0,24', '1', '2599,2653,2654,2655,2656,2657,2658,2659', '2599', '0', '0');
INSERT INTO `sx_area` VALUES ('2600', '黔东南苗族侗族自治州', '24', '0,24', '1', '2600,2660,2661,2662,2663,2664,2665,2666,2667,2668,2669,2670,2671,2672,2673,2674,2675', '2600', '0', '0');
INSERT INTO `sx_area` VALUES ('2601', '黔南布依族苗族自治州', '24', '0,24', '1', '2601,2676,2677,2678,2679,2680,2681,2682,2683,2684,2685,2686,2687', '2601', '0', '0');
INSERT INTO `sx_area` VALUES ('2602', '南明区', '2593', '0,24,2593', '0', '2602', '2602', '0', '0');
INSERT INTO `sx_area` VALUES ('2603', '云岩区', '2593', '0,24,2593', '0', '2603', '2603', '0', '0');
INSERT INTO `sx_area` VALUES ('2604', '花溪区', '2593', '0,24,2593', '0', '2604', '2604', '0', '0');
INSERT INTO `sx_area` VALUES ('2605', '乌当区', '2593', '0,24,2593', '0', '2605', '2605', '0', '0');
INSERT INTO `sx_area` VALUES ('2606', '白云区', '2593', '0,24,2593', '0', '2606', '2606', '0', '0');
INSERT INTO `sx_area` VALUES ('2607', '小河区', '2593', '0,24,2593', '0', '2607', '2607', '0', '0');
INSERT INTO `sx_area` VALUES ('2608', '开阳县', '2593', '0,24,2593', '0', '2608', '2608', '0', '0');
INSERT INTO `sx_area` VALUES ('2609', '息烽县', '2593', '0,24,2593', '0', '2609', '2609', '0', '0');
INSERT INTO `sx_area` VALUES ('2610', '修文县', '2593', '0,24,2593', '0', '2610', '2610', '0', '0');
INSERT INTO `sx_area` VALUES ('2611', '清镇市', '2593', '0,24,2593', '0', '2611', '2611', '0', '0');
INSERT INTO `sx_area` VALUES ('2612', '钟山区', '2594', '0,24,2594', '0', '2612', '2612', '0', '0');
INSERT INTO `sx_area` VALUES ('2613', '六枝特区', '2594', '0,24,2594', '0', '2613', '2613', '0', '0');
INSERT INTO `sx_area` VALUES ('2614', '水城县', '2594', '0,24,2594', '0', '2614', '2614', '0', '0');
INSERT INTO `sx_area` VALUES ('2615', '盘县', '2594', '0,24,2594', '0', '2615', '2615', '0', '0');
INSERT INTO `sx_area` VALUES ('2616', '红花岗区', '2595', '0,24,2595', '0', '2616', '2616', '0', '0');
INSERT INTO `sx_area` VALUES ('2617', '遵义县', '2595', '0,24,2595', '0', '2617', '2617', '0', '0');
INSERT INTO `sx_area` VALUES ('2618', '桐梓县', '2595', '0,24,2595', '0', '2618', '2618', '0', '0');
INSERT INTO `sx_area` VALUES ('2619', '绥阳县', '2595', '0,24,2595', '0', '2619', '2619', '0', '0');
INSERT INTO `sx_area` VALUES ('2620', '正安县', '2595', '0,24,2595', '0', '2620', '2620', '0', '0');
INSERT INTO `sx_area` VALUES ('2621', '道真仡佬族苗族自治县', '2595', '0,24,2595', '0', '2621', '2621', '0', '0');
INSERT INTO `sx_area` VALUES ('2622', '务川仡佬族苗族自治县', '2595', '0,24,2595', '0', '2622', '2622', '0', '0');
INSERT INTO `sx_area` VALUES ('2623', '凤冈县', '2595', '0,24,2595', '0', '2623', '2623', '0', '0');
INSERT INTO `sx_area` VALUES ('2624', '湄潭县', '2595', '0,24,2595', '0', '2624', '2624', '0', '0');
INSERT INTO `sx_area` VALUES ('2625', '余庆县', '2595', '0,24,2595', '0', '2625', '2625', '0', '0');
INSERT INTO `sx_area` VALUES ('2626', '习水县', '2595', '0,24,2595', '0', '2626', '2626', '0', '0');
INSERT INTO `sx_area` VALUES ('2627', '赤水市', '2595', '0,24,2595', '0', '2627', '2627', '0', '0');
INSERT INTO `sx_area` VALUES ('2628', '仁怀市', '2595', '0,24,2595', '0', '2628', '2628', '0', '0');
INSERT INTO `sx_area` VALUES ('2629', '西秀区', '2596', '0,24,2596', '0', '2629', '2629', '0', '0');
INSERT INTO `sx_area` VALUES ('2630', '平坝县', '2596', '0,24,2596', '0', '2630', '2630', '0', '0');
INSERT INTO `sx_area` VALUES ('2631', '普定县', '2596', '0,24,2596', '0', '2631', '2631', '0', '0');
INSERT INTO `sx_area` VALUES ('2632', '镇宁布依族苗族自治县', '2596', '0,24,2596', '0', '2632', '2632', '0', '0');
INSERT INTO `sx_area` VALUES ('2633', '关岭布依族苗族自治县', '2596', '0,24,2596', '0', '2633', '2633', '0', '0');
INSERT INTO `sx_area` VALUES ('2634', '紫云苗族布依族自治县', '2596', '0,24,2596', '0', '2634', '2634', '0', '0');
INSERT INTO `sx_area` VALUES ('2635', '铜仁市', '2597', '0,24,2597', '0', '2635', '2635', '0', '0');
INSERT INTO `sx_area` VALUES ('2636', '江口县', '2597', '0,24,2597', '0', '2636', '2636', '0', '0');
INSERT INTO `sx_area` VALUES ('2637', '玉屏侗族自治县', '2597', '0,24,2597', '0', '2637', '2637', '0', '0');
INSERT INTO `sx_area` VALUES ('2638', '石阡县', '2597', '0,24,2597', '0', '2638', '2638', '0', '0');
INSERT INTO `sx_area` VALUES ('2639', '思南县', '2597', '0,24,2597', '0', '2639', '2639', '0', '0');
INSERT INTO `sx_area` VALUES ('2640', '印江土家族苗族自治县', '2597', '0,24,2597', '0', '2640', '2640', '0', '0');
INSERT INTO `sx_area` VALUES ('2641', '德江县', '2597', '0,24,2597', '0', '2641', '2641', '0', '0');
INSERT INTO `sx_area` VALUES ('2642', '沿河土家族自治县', '2597', '0,24,2597', '0', '2642', '2642', '0', '0');
INSERT INTO `sx_area` VALUES ('2643', '松桃苗族自治县', '2597', '0,24,2597', '0', '2643', '2643', '0', '0');
INSERT INTO `sx_area` VALUES ('2644', '万山特区', '2597', '0,24,2597', '0', '2644', '2644', '0', '0');
INSERT INTO `sx_area` VALUES ('2645', '兴义市', '2598', '0,24,2598', '0', '2645', '2645', '0', '0');
INSERT INTO `sx_area` VALUES ('2646', '兴仁县', '2598', '0,24,2598', '0', '2646', '2646', '0', '0');
INSERT INTO `sx_area` VALUES ('2647', '普安县', '2598', '0,24,2598', '0', '2647', '2647', '0', '0');
INSERT INTO `sx_area` VALUES ('2648', '晴隆县', '2598', '0,24,2598', '0', '2648', '2648', '0', '0');
INSERT INTO `sx_area` VALUES ('2649', '贞丰县', '2598', '0,24,2598', '0', '2649', '2649', '0', '0');
INSERT INTO `sx_area` VALUES ('2650', '望谟县', '2598', '0,24,2598', '0', '2650', '2650', '0', '0');
INSERT INTO `sx_area` VALUES ('2651', '册亨县', '2598', '0,24,2598', '0', '2651', '2651', '0', '0');
INSERT INTO `sx_area` VALUES ('2652', '安龙县', '2598', '0,24,2598', '0', '2652', '2652', '0', '0');
INSERT INTO `sx_area` VALUES ('2653', '毕节市', '2599', '0,24,2599', '0', '2653', '2653', '0', '0');
INSERT INTO `sx_area` VALUES ('2654', '大方县', '2599', '0,24,2599', '0', '2654', '2654', '0', '0');
INSERT INTO `sx_area` VALUES ('2655', '黔西县', '2599', '0,24,2599', '0', '2655', '2655', '0', '0');
INSERT INTO `sx_area` VALUES ('2656', '金沙县', '2599', '0,24,2599', '0', '2656', '2656', '0', '0');
INSERT INTO `sx_area` VALUES ('2657', '织金县', '2599', '0,24,2599', '0', '2657', '2657', '0', '0');
INSERT INTO `sx_area` VALUES ('2658', '纳雍县', '2599', '0,24,2599', '0', '2658', '2658', '0', '0');
INSERT INTO `sx_area` VALUES ('2659', '赫章县', '2599', '0,24,2599', '0', '2659', '2659', '0', '0');
INSERT INTO `sx_area` VALUES ('2660', '凯里市', '2600', '0,24,2600', '0', '2660', '2660', '0', '0');
INSERT INTO `sx_area` VALUES ('2661', '黄平县', '2600', '0,24,2600', '0', '2661', '2661', '0', '0');
INSERT INTO `sx_area` VALUES ('2662', '施秉县', '2600', '0,24,2600', '0', '2662', '2662', '0', '0');
INSERT INTO `sx_area` VALUES ('2663', '三穗县', '2600', '0,24,2600', '0', '2663', '2663', '0', '0');
INSERT INTO `sx_area` VALUES ('2664', '镇远县', '2600', '0,24,2600', '0', '2664', '2664', '0', '0');
INSERT INTO `sx_area` VALUES ('2665', '岑巩县', '2600', '0,24,2600', '0', '2665', '2665', '0', '0');
INSERT INTO `sx_area` VALUES ('2666', '天柱县', '2600', '0,24,2600', '0', '2666', '2666', '0', '0');
INSERT INTO `sx_area` VALUES ('2667', '锦屏县', '2600', '0,24,2600', '0', '2667', '2667', '0', '0');
INSERT INTO `sx_area` VALUES ('2668', '剑河县', '2600', '0,24,2600', '0', '2668', '2668', '0', '0');
INSERT INTO `sx_area` VALUES ('2669', '台江县', '2600', '0,24,2600', '0', '2669', '2669', '0', '0');
INSERT INTO `sx_area` VALUES ('2670', '黎平县', '2600', '0,24,2600', '0', '2670', '2670', '0', '0');
INSERT INTO `sx_area` VALUES ('2671', '榕江县', '2600', '0,24,2600', '0', '2671', '2671', '0', '0');
INSERT INTO `sx_area` VALUES ('2672', '从江县', '2600', '0,24,2600', '0', '2672', '2672', '0', '0');
INSERT INTO `sx_area` VALUES ('2673', '雷山县', '2600', '0,24,2600', '0', '2673', '2673', '0', '0');
INSERT INTO `sx_area` VALUES ('2674', '麻江县', '2600', '0,24,2600', '0', '2674', '2674', '0', '0');
INSERT INTO `sx_area` VALUES ('2675', '丹寨县', '2600', '0,24,2600', '0', '2675', '2675', '0', '0');
INSERT INTO `sx_area` VALUES ('2676', '都匀市', '2601', '0,24,2601', '0', '2676', '2676', '0', '0');
INSERT INTO `sx_area` VALUES ('2677', '福泉市', '2601', '0,24,2601', '0', '2677', '2677', '0', '0');
INSERT INTO `sx_area` VALUES ('2678', '荔波县', '2601', '0,24,2601', '0', '2678', '2678', '0', '0');
INSERT INTO `sx_area` VALUES ('2679', '贵定县', '2601', '0,24,2601', '0', '2679', '2679', '0', '0');
INSERT INTO `sx_area` VALUES ('2680', '瓮安县', '2601', '0,24,2601', '0', '2680', '2680', '0', '0');
INSERT INTO `sx_area` VALUES ('2681', '独山县', '2601', '0,24,2601', '0', '2681', '2681', '0', '0');
INSERT INTO `sx_area` VALUES ('2682', '平塘县', '2601', '0,24,2601', '0', '2682', '2682', '0', '0');
INSERT INTO `sx_area` VALUES ('2683', '罗甸县', '2601', '0,24,2601', '0', '2683', '2683', '0', '0');
INSERT INTO `sx_area` VALUES ('2684', '长顺县', '2601', '0,24,2601', '0', '2684', '2684', '0', '0');
INSERT INTO `sx_area` VALUES ('2685', '龙里县', '2601', '0,24,2601', '0', '2685', '2685', '0', '0');
INSERT INTO `sx_area` VALUES ('2686', '惠水县', '2601', '0,24,2601', '0', '2686', '2686', '0', '0');
INSERT INTO `sx_area` VALUES ('2687', '三都水族自治县', '2601', '0,24,2601', '0', '2687', '2687', '0', '0');
INSERT INTO `sx_area` VALUES ('2688', '昆明市', '25', '0,25', '1', '2688,2704,2705,2706,2707,2708,2709,2710,2711,2712,2713,2714,2715,2716,2717', '2688', '0', '0');
INSERT INTO `sx_area` VALUES ('2689', '曲靖市', '25', '0,25', '1', '2689,2718,2719,2720,2721,2722,2723,2724,2725,2726', '2689', '0', '0');
INSERT INTO `sx_area` VALUES ('2690', '玉溪市', '25', '0,25', '1', '2690,2727,2728,2729,2730,2731,2732,2733,2734', '2690', '0', '0');
INSERT INTO `sx_area` VALUES ('2691', '保山市', '25', '0,25', '1', '2691,2735,2736,2737,2738,2739', '2691', '0', '0');
INSERT INTO `sx_area` VALUES ('2692', '昭通市', '25', '0,25', '1', '2692,2740,2741,2742,2743,2744,2745,2746,2747,2748,2749,2750', '2692', '0', '0');
INSERT INTO `sx_area` VALUES ('2693', '丽江市', '25', '0,25', '1', '2693,2751,2752,2753,2754,2755', '2693', '0', '0');
INSERT INTO `sx_area` VALUES ('2694', '楚雄彝族自治州', '25', '0,25', '1', '2694,2756,2757,2758,2759,2760,2761,2762,2763,2764,2765', '2694', '0', '0');
INSERT INTO `sx_area` VALUES ('2695', '红河哈尼族彝族自治州', '25', '0,25', '1', '2695,2766,2767,2768,2769,2770,2771,2772,2773,2774,2775,2776,2777,2778', '2695', '0', '0');
INSERT INTO `sx_area` VALUES ('2696', '文山壮族苗族自治州', '25', '0,25', '1', '2696,2779,2780,2781,2782,2783,2784,2785,2786', '2696', '0', '0');
INSERT INTO `sx_area` VALUES ('2697', '思茅地区', '25', '0,25', '1', '2697,2787,2788,2789,2790,2791,2792,2793,2794,2795,2796,2797', '2697', '0', '0');
INSERT INTO `sx_area` VALUES ('2698', '西双版纳傣族自治州', '25', '0,25', '1', '2698,2798,2799,2800', '2698', '0', '0');
INSERT INTO `sx_area` VALUES ('2699', '大理白族自治州', '25', '0,25', '1', '2699,2801,2802,2803,2804,2805,2806,2807,2808,2809,2810,2811,2812', '2699', '0', '0');
INSERT INTO `sx_area` VALUES ('2700', '德宏傣族景颇族自治州', '25', '0,25', '1', '2700,2813,2814,2815,2816,2817', '2700', '0', '0');
INSERT INTO `sx_area` VALUES ('2701', '怒江傈僳族自治州', '25', '0,25', '1', '2701,2818,2819,2820,2821', '2701', '0', '0');
INSERT INTO `sx_area` VALUES ('2702', '迪庆藏族自治州', '25', '0,25', '1', '2702,2822,2823,2824', '2702', '0', '0');
INSERT INTO `sx_area` VALUES ('2703', '临沧地区', '25', '0,25', '1', '2703,2825,2826,2827,2828,2829,2830,2831', '2703', '0', '0');
INSERT INTO `sx_area` VALUES ('2704', '五华区', '2688', '0,25,2688', '0', '2704', '2704', '0', '0');
INSERT INTO `sx_area` VALUES ('2705', '盘龙区', '2688', '0,25,2688', '0', '2705', '2705', '0', '0');
INSERT INTO `sx_area` VALUES ('2706', '官渡区', '2688', '0,25,2688', '0', '2706', '2706', '0', '0');
INSERT INTO `sx_area` VALUES ('2707', '西山区', '2688', '0,25,2688', '0', '2707', '2707', '0', '0');
INSERT INTO `sx_area` VALUES ('2708', '东川区', '2688', '0,25,2688', '0', '2708', '2708', '0', '0');
INSERT INTO `sx_area` VALUES ('2709', '呈贡县', '2688', '0,25,2688', '0', '2709', '2709', '0', '0');
INSERT INTO `sx_area` VALUES ('2710', '晋宁县', '2688', '0,25,2688', '0', '2710', '2710', '0', '0');
INSERT INTO `sx_area` VALUES ('2711', '富民县', '2688', '0,25,2688', '0', '2711', '2711', '0', '0');
INSERT INTO `sx_area` VALUES ('2712', '宜良县', '2688', '0,25,2688', '0', '2712', '2712', '0', '0');
INSERT INTO `sx_area` VALUES ('2713', '石林彝族自治县', '2688', '0,25,2688', '0', '2713', '2713', '0', '0');
INSERT INTO `sx_area` VALUES ('2714', '嵩明县', '2688', '0,25,2688', '0', '2714', '2714', '0', '0');
INSERT INTO `sx_area` VALUES ('2715', '禄劝彝族苗族自治县', '2688', '0,25,2688', '0', '2715', '2715', '0', '0');
INSERT INTO `sx_area` VALUES ('2716', '寻甸回族彝族自治县', '2688', '0,25,2688', '0', '2716', '2716', '0', '0');
INSERT INTO `sx_area` VALUES ('2717', '安宁市', '2688', '0,25,2688', '0', '2717', '2717', '0', '0');
INSERT INTO `sx_area` VALUES ('2718', '麒麟区', '2689', '0,25,2689', '0', '2718', '2718', '0', '0');
INSERT INTO `sx_area` VALUES ('2719', '马龙县', '2689', '0,25,2689', '0', '2719', '2719', '0', '0');
INSERT INTO `sx_area` VALUES ('2720', '陆良县', '2689', '0,25,2689', '0', '2720', '2720', '0', '0');
INSERT INTO `sx_area` VALUES ('2721', '师宗县', '2689', '0,25,2689', '0', '2721', '2721', '0', '0');
INSERT INTO `sx_area` VALUES ('2722', '罗平县', '2689', '0,25,2689', '0', '2722', '2722', '0', '0');
INSERT INTO `sx_area` VALUES ('2723', '富源县', '2689', '0,25,2689', '0', '2723', '2723', '0', '0');
INSERT INTO `sx_area` VALUES ('2724', '会泽县', '2689', '0,25,2689', '0', '2724', '2724', '0', '0');
INSERT INTO `sx_area` VALUES ('2725', '沾益县', '2689', '0,25,2689', '0', '2725', '2725', '0', '0');
INSERT INTO `sx_area` VALUES ('2726', '宣威市', '2689', '0,25,2689', '0', '2726', '2726', '0', '0');
INSERT INTO `sx_area` VALUES ('2727', '红塔区', '2690', '0,25,2690', '0', '2727', '2727', '0', '0');
INSERT INTO `sx_area` VALUES ('2728', '江川县', '2690', '0,25,2690', '0', '2728', '2728', '0', '0');
INSERT INTO `sx_area` VALUES ('2729', '澄江县', '2690', '0,25,2690', '0', '2729', '2729', '0', '0');
INSERT INTO `sx_area` VALUES ('2730', '通海县', '2690', '0,25,2690', '0', '2730', '2730', '0', '0');
INSERT INTO `sx_area` VALUES ('2731', '华宁县', '2690', '0,25,2690', '0', '2731', '2731', '0', '0');
INSERT INTO `sx_area` VALUES ('2732', '易门县', '2690', '0,25,2690', '0', '2732', '2732', '0', '0');
INSERT INTO `sx_area` VALUES ('2733', '峨山彝族自治县', '2690', '0,25,2690', '0', '2733', '2733', '0', '0');
INSERT INTO `sx_area` VALUES ('2734', '新平彝族傣族自治县', '2690', '0,25,2690', '0', '2734', '2734', '0', '0');
INSERT INTO `sx_area` VALUES ('2735', '隆阳区', '2691', '0,25,2691', '0', '2735', '2735', '0', '0');
INSERT INTO `sx_area` VALUES ('2736', '施甸县', '2691', '0,25,2691', '0', '2736', '2736', '0', '0');
INSERT INTO `sx_area` VALUES ('2737', '腾冲县', '2691', '0,25,2691', '0', '2737', '2737', '0', '0');
INSERT INTO `sx_area` VALUES ('2738', '龙陵县', '2691', '0,25,2691', '0', '2738', '2738', '0', '0');
INSERT INTO `sx_area` VALUES ('2739', '昌宁县', '2691', '0,25,2691', '0', '2739', '2739', '0', '0');
INSERT INTO `sx_area` VALUES ('2740', '昭阳区', '2692', '0,25,2692', '0', '2740', '2740', '0', '0');
INSERT INTO `sx_area` VALUES ('2741', '鲁甸县', '2692', '0,25,2692', '0', '2741', '2741', '0', '0');
INSERT INTO `sx_area` VALUES ('2742', '巧家县', '2692', '0,25,2692', '0', '2742', '2742', '0', '0');
INSERT INTO `sx_area` VALUES ('2743', '盐津县', '2692', '0,25,2692', '0', '2743', '2743', '0', '0');
INSERT INTO `sx_area` VALUES ('2744', '大关县', '2692', '0,25,2692', '0', '2744', '2744', '0', '0');
INSERT INTO `sx_area` VALUES ('2745', '永善县', '2692', '0,25,2692', '0', '2745', '2745', '0', '0');
INSERT INTO `sx_area` VALUES ('2746', '绥江县', '2692', '0,25,2692', '0', '2746', '2746', '0', '0');
INSERT INTO `sx_area` VALUES ('2747', '镇雄县', '2692', '0,25,2692', '0', '2747', '2747', '0', '0');
INSERT INTO `sx_area` VALUES ('2748', '彝良县', '2692', '0,25,2692', '0', '2748', '2748', '0', '0');
INSERT INTO `sx_area` VALUES ('2749', '威信县', '2692', '0,25,2692', '0', '2749', '2749', '0', '0');
INSERT INTO `sx_area` VALUES ('2750', '水富县', '2692', '0,25,2692', '0', '2750', '2750', '0', '0');
INSERT INTO `sx_area` VALUES ('2751', '古城区', '2693', '0,25,2693', '0', '2751', '2751', '0', '0');
INSERT INTO `sx_area` VALUES ('2752', '玉龙纳西族自治县', '2693', '0,25,2693', '0', '2752', '2752', '0', '0');
INSERT INTO `sx_area` VALUES ('2753', '永胜县', '2693', '0,25,2693', '0', '2753', '2753', '0', '0');
INSERT INTO `sx_area` VALUES ('2754', '华坪县', '2693', '0,25,2693', '0', '2754', '2754', '0', '0');
INSERT INTO `sx_area` VALUES ('2755', '宁蒗彝族自治县', '2693', '0,25,2693', '0', '2755', '2755', '0', '0');
INSERT INTO `sx_area` VALUES ('2756', '楚雄市', '2694', '0,25,2694', '0', '2756', '2756', '0', '0');
INSERT INTO `sx_area` VALUES ('2757', '双柏县', '2694', '0,25,2694', '0', '2757', '2757', '0', '0');
INSERT INTO `sx_area` VALUES ('2758', '牟定县', '2694', '0,25,2694', '0', '2758', '2758', '0', '0');
INSERT INTO `sx_area` VALUES ('2759', '南华县', '2694', '0,25,2694', '0', '2759', '2759', '0', '0');
INSERT INTO `sx_area` VALUES ('2760', '姚安县', '2694', '0,25,2694', '0', '2760', '2760', '0', '0');
INSERT INTO `sx_area` VALUES ('2761', '大姚县', '2694', '0,25,2694', '0', '2761', '2761', '0', '0');
INSERT INTO `sx_area` VALUES ('2762', '永仁县', '2694', '0,25,2694', '0', '2762', '2762', '0', '0');
INSERT INTO `sx_area` VALUES ('2763', '元谋县', '2694', '0,25,2694', '0', '2763', '2763', '0', '0');
INSERT INTO `sx_area` VALUES ('2764', '武定县', '2694', '0,25,2694', '0', '2764', '2764', '0', '0');
INSERT INTO `sx_area` VALUES ('2765', '禄丰县', '2694', '0,25,2694', '0', '2765', '2765', '0', '0');
INSERT INTO `sx_area` VALUES ('2766', '个旧市', '2695', '0,25,2695', '0', '2766', '2766', '0', '0');
INSERT INTO `sx_area` VALUES ('2767', '开远市', '2695', '0,25,2695', '0', '2767', '2767', '0', '0');
INSERT INTO `sx_area` VALUES ('2768', '蒙自县', '2695', '0,25,2695', '0', '2768', '2768', '0', '0');
INSERT INTO `sx_area` VALUES ('2769', '屏边苗族自治县', '2695', '0,25,2695', '0', '2769', '2769', '0', '0');
INSERT INTO `sx_area` VALUES ('2770', '建水县', '2695', '0,25,2695', '0', '2770', '2770', '0', '0');
INSERT INTO `sx_area` VALUES ('2771', '石屏县', '2695', '0,25,2695', '0', '2771', '2771', '0', '0');
INSERT INTO `sx_area` VALUES ('2772', '弥勒县', '2695', '0,25,2695', '0', '2772', '2772', '0', '0');
INSERT INTO `sx_area` VALUES ('2773', '泸西县', '2695', '0,25,2695', '0', '2773', '2773', '0', '0');
INSERT INTO `sx_area` VALUES ('2774', '元阳县', '2695', '0,25,2695', '0', '2774', '2774', '0', '0');
INSERT INTO `sx_area` VALUES ('2775', '红河县', '2695', '0,25,2695', '0', '2775', '2775', '0', '0');
INSERT INTO `sx_area` VALUES ('2776', '绿春县', '2695', '0,25,2695', '0', '2776', '2776', '0', '0');
INSERT INTO `sx_area` VALUES ('2777', '河口瑶族自治县', '2695', '0,25,2695', '0', '2777', '2777', '0', '0');
INSERT INTO `sx_area` VALUES ('2778', '金平县', '2695', '0,25,2695', '0', '2778', '2778', '0', '0');
INSERT INTO `sx_area` VALUES ('2779', '文山县', '2696', '0,25,2696', '0', '2779', '2779', '0', '0');
INSERT INTO `sx_area` VALUES ('2780', '砚山县', '2696', '0,25,2696', '0', '2780', '2780', '0', '0');
INSERT INTO `sx_area` VALUES ('2781', '西畴县', '2696', '0,25,2696', '0', '2781', '2781', '0', '0');
INSERT INTO `sx_area` VALUES ('2782', '麻栗坡县', '2696', '0,25,2696', '0', '2782', '2782', '0', '0');
INSERT INTO `sx_area` VALUES ('2783', '马关县', '2696', '0,25,2696', '0', '2783', '2783', '0', '0');
INSERT INTO `sx_area` VALUES ('2784', '丘北县', '2696', '0,25,2696', '0', '2784', '2784', '0', '0');
INSERT INTO `sx_area` VALUES ('2785', '广南县', '2696', '0,25,2696', '0', '2785', '2785', '0', '0');
INSERT INTO `sx_area` VALUES ('2786', '富宁县', '2696', '0,25,2696', '0', '2786', '2786', '0', '0');
INSERT INTO `sx_area` VALUES ('2787', '普洱市', '2697', '0,25,2697', '0', '2787', '2787', '0', '0');
INSERT INTO `sx_area` VALUES ('2788', '思茅区', '2697', '0,25,2697', '0', '2788', '2788', '0', '0');
INSERT INTO `sx_area` VALUES ('2789', '孟连县', '2697', '0,25,2697', '0', '2789', '2789', '0', '0');
INSERT INTO `sx_area` VALUES ('2790', '镇沅县', '2697', '0,25,2697', '0', '2790', '2790', '0', '0');
INSERT INTO `sx_area` VALUES ('2791', '宁洱哈尼族彝族自治县', '2697', '0,25,2697', '0', '2791', '2791', '0', '0');
INSERT INTO `sx_area` VALUES ('2792', '墨江哈尼族自治县', '2697', '0,25,2697', '0', '2792', '2792', '0', '0');
INSERT INTO `sx_area` VALUES ('2793', '景东彝族自治县', '2697', '0,25,2697', '0', '2793', '2793', '0', '0');
INSERT INTO `sx_area` VALUES ('2794', '景谷傣族彝族自治县', '2697', '0,25,2697', '0', '2794', '2794', '0', '0');
INSERT INTO `sx_area` VALUES ('2795', '江城哈尼族彝族自治县', '2697', '0,25,2697', '0', '2795', '2795', '0', '0');
INSERT INTO `sx_area` VALUES ('2796', '澜沧拉祜族自治县', '2697', '0,25,2697', '0', '2796', '2796', '0', '0');
INSERT INTO `sx_area` VALUES ('2797', '西盟佤族自治县', '2697', '0,25,2697', '0', '2797', '2797', '0', '0');
INSERT INTO `sx_area` VALUES ('2798', '景洪市', '2698', '0,25,2698', '0', '2798', '2798', '0', '0');
INSERT INTO `sx_area` VALUES ('2799', '勐海县', '2698', '0,25,2698', '0', '2799', '2799', '0', '0');
INSERT INTO `sx_area` VALUES ('2800', '勐腊县', '2698', '0,25,2698', '0', '2800', '2800', '0', '0');
INSERT INTO `sx_area` VALUES ('2801', '大理市', '2699', '0,25,2699', '0', '2801', '2801', '0', '0');
INSERT INTO `sx_area` VALUES ('2802', '漾濞彝族自治县', '2699', '0,25,2699', '0', '2802', '2802', '0', '0');
INSERT INTO `sx_area` VALUES ('2803', '祥云县', '2699', '0,25,2699', '0', '2803', '2803', '0', '0');
INSERT INTO `sx_area` VALUES ('2804', '宾川县', '2699', '0,25,2699', '0', '2804', '2804', '0', '0');
INSERT INTO `sx_area` VALUES ('2805', '弥渡县', '2699', '0,25,2699', '0', '2805', '2805', '0', '0');
INSERT INTO `sx_area` VALUES ('2806', '南涧彝族自治县', '2699', '0,25,2699', '0', '2806', '2806', '0', '0');
INSERT INTO `sx_area` VALUES ('2807', '巍山彝族回族自治县', '2699', '0,25,2699', '0', '2807', '2807', '0', '0');
INSERT INTO `sx_area` VALUES ('2808', '永平县', '2699', '0,25,2699', '0', '2808', '2808', '0', '0');
INSERT INTO `sx_area` VALUES ('2809', '云龙县', '2699', '0,25,2699', '0', '2809', '2809', '0', '0');
INSERT INTO `sx_area` VALUES ('2810', '洱源县', '2699', '0,25,2699', '0', '2810', '2810', '0', '0');
INSERT INTO `sx_area` VALUES ('2811', '剑川县', '2699', '0,25,2699', '0', '2811', '2811', '0', '0');
INSERT INTO `sx_area` VALUES ('2812', '鹤庆县', '2699', '0,25,2699', '0', '2812', '2812', '0', '0');
INSERT INTO `sx_area` VALUES ('2813', '瑞丽市', '2700', '0,25,2700', '0', '2813', '2813', '0', '0');
INSERT INTO `sx_area` VALUES ('2814', '潞西市', '2700', '0,25,2700', '0', '2814', '2814', '0', '0');
INSERT INTO `sx_area` VALUES ('2815', '梁河县', '2700', '0,25,2700', '0', '2815', '2815', '0', '0');
INSERT INTO `sx_area` VALUES ('2816', '盈江县', '2700', '0,25,2700', '0', '2816', '2816', '0', '0');
INSERT INTO `sx_area` VALUES ('2817', '陇川县', '2700', '0,25,2700', '0', '2817', '2817', '0', '0');
INSERT INTO `sx_area` VALUES ('2818', '泸水县', '2701', '0,25,2701', '0', '2818', '2818', '0', '0');
INSERT INTO `sx_area` VALUES ('2819', '福贡县', '2701', '0,25,2701', '0', '2819', '2819', '0', '0');
INSERT INTO `sx_area` VALUES ('2820', '贡山独龙族怒族自治县', '2701', '0,25,2701', '0', '2820', '2820', '0', '0');
INSERT INTO `sx_area` VALUES ('2821', '兰坪白族普米族自治县', '2701', '0,25,2701', '0', '2821', '2821', '0', '0');
INSERT INTO `sx_area` VALUES ('2822', '香格里拉县', '2702', '0,25,2702', '0', '2822', '2822', '0', '0');
INSERT INTO `sx_area` VALUES ('2823', '德钦县', '2702', '0,25,2702', '0', '2823', '2823', '0', '0');
INSERT INTO `sx_area` VALUES ('2824', '维西傈僳族自治县', '2702', '0,25,2702', '0', '2824', '2824', '0', '0');
INSERT INTO `sx_area` VALUES ('2825', '临沧县', '2703', '0,25,2703', '0', '2825', '2825', '0', '0');
INSERT INTO `sx_area` VALUES ('2826', '凤庆县', '2703', '0,25,2703', '0', '2826', '2826', '0', '0');
INSERT INTO `sx_area` VALUES ('2827', '云县', '2703', '0,25,2703', '0', '2827', '2827', '0', '0');
INSERT INTO `sx_area` VALUES ('2828', '永德县', '2703', '0,25,2703', '0', '2828', '2828', '0', '0');
INSERT INTO `sx_area` VALUES ('2829', '镇康县', '2703', '0,25,2703', '0', '2829', '2829', '0', '0');
INSERT INTO `sx_area` VALUES ('2830', '耿马傣族佤族自治县', '2703', '0,25,2703', '0', '2830', '2830', '0', '0');
INSERT INTO `sx_area` VALUES ('2831', '沧源佤族自治县', '2703', '0,25,2703', '0', '2831', '2831', '0', '0');
INSERT INTO `sx_area` VALUES ('2832', '拉萨市', '26', '0,26', '1', '2832,2839,2840,2841,2842,2843,2844,2845,2846', '2832', '0', '0');
INSERT INTO `sx_area` VALUES ('2833', '昌都地区', '26', '0,26', '1', '2833,2847,2848,2849,2850,2851,2852,2853,2854,2855,2856,2857', '2833', '0', '0');
INSERT INTO `sx_area` VALUES ('2834', '山南地区', '26', '0,26', '1', '2834,2858,2859,2860,2861,2862,2863,2864,2865,2866,2867,2868,2869', '2834', '0', '0');
INSERT INTO `sx_area` VALUES ('2835', '日喀则地区', '26', '0,26', '1', '2835,2870,2871,2872,2873,2874,2875,2876,2877,2878,2879,2880,2881,2882,2883,2884,2885,2886,2887', '2835', '0', '0');
INSERT INTO `sx_area` VALUES ('2836', '那曲地区', '26', '0,26', '1', '2836,2888,2889,2890,2891,2892,2893,2894,2895,2896,2897', '2836', '0', '0');
INSERT INTO `sx_area` VALUES ('2837', '阿里地区', '26', '0,26', '1', '2837,2898,2899,2900,2901,2902,2903,2904', '2837', '0', '0');
INSERT INTO `sx_area` VALUES ('2838', '林芝地区', '26', '0,26', '1', '2838,2905,2906,2907,2908,2909,2910,2911', '2838', '0', '0');
INSERT INTO `sx_area` VALUES ('2839', '城关区', '2832', '0,26,2832', '0', '2839', '2839', '0', '0');
INSERT INTO `sx_area` VALUES ('2840', '林周县', '2832', '0,26,2832', '0', '2840', '2840', '0', '0');
INSERT INTO `sx_area` VALUES ('2841', '当雄县', '2832', '0,26,2832', '0', '2841', '2841', '0', '0');
INSERT INTO `sx_area` VALUES ('2842', '尼木县', '2832', '0,26,2832', '0', '2842', '2842', '0', '0');
INSERT INTO `sx_area` VALUES ('2843', '曲水县', '2832', '0,26,2832', '0', '2843', '2843', '0', '0');
INSERT INTO `sx_area` VALUES ('2844', '堆龙德庆县', '2832', '0,26,2832', '0', '2844', '2844', '0', '0');
INSERT INTO `sx_area` VALUES ('2845', '达孜县', '2832', '0,26,2832', '0', '2845', '2845', '0', '0');
INSERT INTO `sx_area` VALUES ('2846', '墨竹工卡县', '2832', '0,26,2832', '0', '2846', '2846', '0', '0');
INSERT INTO `sx_area` VALUES ('2847', '昌都县', '2833', '0,26,2833', '0', '2847', '2847', '0', '0');
INSERT INTO `sx_area` VALUES ('2848', '江达县', '2833', '0,26,2833', '0', '2848', '2848', '0', '0');
INSERT INTO `sx_area` VALUES ('2849', '贡觉县', '2833', '0,26,2833', '0', '2849', '2849', '0', '0');
INSERT INTO `sx_area` VALUES ('2850', '类乌齐县', '2833', '0,26,2833', '0', '2850', '2850', '0', '0');
INSERT INTO `sx_area` VALUES ('2851', '丁青县', '2833', '0,26,2833', '0', '2851', '2851', '0', '0');
INSERT INTO `sx_area` VALUES ('2852', '察雅县', '2833', '0,26,2833', '0', '2852', '2852', '0', '0');
INSERT INTO `sx_area` VALUES ('2853', '八宿县', '2833', '0,26,2833', '0', '2853', '2853', '0', '0');
INSERT INTO `sx_area` VALUES ('2854', '左贡县', '2833', '0,26,2833', '0', '2854', '2854', '0', '0');
INSERT INTO `sx_area` VALUES ('2855', '芒康县', '2833', '0,26,2833', '0', '2855', '2855', '0', '0');
INSERT INTO `sx_area` VALUES ('2856', '洛隆县', '2833', '0,26,2833', '0', '2856', '2856', '0', '0');
INSERT INTO `sx_area` VALUES ('2857', '边坝县', '2833', '0,26,2833', '0', '2857', '2857', '0', '0');
INSERT INTO `sx_area` VALUES ('2858', '乃东县', '2834', '0,26,2834', '0', '2858', '2858', '0', '0');
INSERT INTO `sx_area` VALUES ('2859', '扎囊县', '2834', '0,26,2834', '0', '2859', '2859', '0', '0');
INSERT INTO `sx_area` VALUES ('2860', '贡嘎县', '2834', '0,26,2834', '0', '2860', '2860', '0', '0');
INSERT INTO `sx_area` VALUES ('2861', '桑日县', '2834', '0,26,2834', '0', '2861', '2861', '0', '0');
INSERT INTO `sx_area` VALUES ('2862', '琼结县', '2834', '0,26,2834', '0', '2862', '2862', '0', '0');
INSERT INTO `sx_area` VALUES ('2863', '曲松县', '2834', '0,26,2834', '0', '2863', '2863', '0', '0');
INSERT INTO `sx_area` VALUES ('2864', '措美县', '2834', '0,26,2834', '0', '2864', '2864', '0', '0');
INSERT INTO `sx_area` VALUES ('2865', '洛扎县', '2834', '0,26,2834', '0', '2865', '2865', '0', '0');
INSERT INTO `sx_area` VALUES ('2866', '加查县', '2834', '0,26,2834', '0', '2866', '2866', '0', '0');
INSERT INTO `sx_area` VALUES ('2867', '隆子县', '2834', '0,26,2834', '0', '2867', '2867', '0', '0');
INSERT INTO `sx_area` VALUES ('2868', '错那县', '2834', '0,26,2834', '0', '2868', '2868', '0', '0');
INSERT INTO `sx_area` VALUES ('2869', '浪卡子县', '2834', '0,26,2834', '0', '2869', '2869', '0', '0');
INSERT INTO `sx_area` VALUES ('2870', '日喀则市', '2835', '0,26,2835', '0', '2870', '2870', '0', '0');
INSERT INTO `sx_area` VALUES ('2871', '南木林县', '2835', '0,26,2835', '0', '2871', '2871', '0', '0');
INSERT INTO `sx_area` VALUES ('2872', '江孜县', '2835', '0,26,2835', '0', '2872', '2872', '0', '0');
INSERT INTO `sx_area` VALUES ('2873', '定日县', '2835', '0,26,2835', '0', '2873', '2873', '0', '0');
INSERT INTO `sx_area` VALUES ('2874', '萨迦县', '2835', '0,26,2835', '0', '2874', '2874', '0', '0');
INSERT INTO `sx_area` VALUES ('2875', '拉孜县', '2835', '0,26,2835', '0', '2875', '2875', '0', '0');
INSERT INTO `sx_area` VALUES ('2876', '昂仁县', '2835', '0,26,2835', '0', '2876', '2876', '0', '0');
INSERT INTO `sx_area` VALUES ('2877', '谢通门县', '2835', '0,26,2835', '0', '2877', '2877', '0', '0');
INSERT INTO `sx_area` VALUES ('2878', '白朗县', '2835', '0,26,2835', '0', '2878', '2878', '0', '0');
INSERT INTO `sx_area` VALUES ('2879', '仁布县', '2835', '0,26,2835', '0', '2879', '2879', '0', '0');
INSERT INTO `sx_area` VALUES ('2880', '康马县', '2835', '0,26,2835', '0', '2880', '2880', '0', '0');
INSERT INTO `sx_area` VALUES ('2881', '定结县', '2835', '0,26,2835', '0', '2881', '2881', '0', '0');
INSERT INTO `sx_area` VALUES ('2882', '仲巴县', '2835', '0,26,2835', '0', '2882', '2882', '0', '0');
INSERT INTO `sx_area` VALUES ('2883', '亚东县', '2835', '0,26,2835', '0', '2883', '2883', '0', '0');
INSERT INTO `sx_area` VALUES ('2884', '吉隆县', '2835', '0,26,2835', '0', '2884', '2884', '0', '0');
INSERT INTO `sx_area` VALUES ('2885', '聂拉木县', '2835', '0,26,2835', '0', '2885', '2885', '0', '0');
INSERT INTO `sx_area` VALUES ('2886', '萨嘎县', '2835', '0,26,2835', '0', '2886', '2886', '0', '0');
INSERT INTO `sx_area` VALUES ('2887', '岗巴县', '2835', '0,26,2835', '0', '2887', '2887', '0', '0');
INSERT INTO `sx_area` VALUES ('2888', '那曲县', '2836', '0,26,2836', '0', '2888', '2888', '0', '0');
INSERT INTO `sx_area` VALUES ('2889', '嘉黎县', '2836', '0,26,2836', '0', '2889', '2889', '0', '0');
INSERT INTO `sx_area` VALUES ('2890', '比如县', '2836', '0,26,2836', '0', '2890', '2890', '0', '0');
INSERT INTO `sx_area` VALUES ('2891', '聂荣县', '2836', '0,26,2836', '0', '2891', '2891', '0', '0');
INSERT INTO `sx_area` VALUES ('2892', '安多县', '2836', '0,26,2836', '0', '2892', '2892', '0', '0');
INSERT INTO `sx_area` VALUES ('2893', '申扎县', '2836', '0,26,2836', '0', '2893', '2893', '0', '0');
INSERT INTO `sx_area` VALUES ('2894', '索县', '2836', '0,26,2836', '0', '2894', '2894', '0', '0');
INSERT INTO `sx_area` VALUES ('2895', '班戈县', '2836', '0,26,2836', '0', '2895', '2895', '0', '0');
INSERT INTO `sx_area` VALUES ('2896', '巴青县', '2836', '0,26,2836', '0', '2896', '2896', '0', '0');
INSERT INTO `sx_area` VALUES ('2897', '尼玛县', '2836', '0,26,2836', '0', '2897', '2897', '0', '0');
INSERT INTO `sx_area` VALUES ('2898', '普兰县', '2837', '0,26,2837', '0', '2898', '2898', '0', '0');
INSERT INTO `sx_area` VALUES ('2899', '札达县', '2837', '0,26,2837', '0', '2899', '2899', '0', '0');
INSERT INTO `sx_area` VALUES ('2900', '噶尔县', '2837', '0,26,2837', '0', '2900', '2900', '0', '0');
INSERT INTO `sx_area` VALUES ('2901', '日土县', '2837', '0,26,2837', '0', '2901', '2901', '0', '0');
INSERT INTO `sx_area` VALUES ('2902', '革吉县', '2837', '0,26,2837', '0', '2902', '2902', '0', '0');
INSERT INTO `sx_area` VALUES ('2903', '改则县', '2837', '0,26,2837', '0', '2903', '2903', '0', '0');
INSERT INTO `sx_area` VALUES ('2904', '措勤县', '2837', '0,26,2837', '0', '2904', '2904', '0', '0');
INSERT INTO `sx_area` VALUES ('2905', '林芝县', '2838', '0,26,2838', '0', '2905', '2905', '0', '0');
INSERT INTO `sx_area` VALUES ('2906', '工布江达县', '2838', '0,26,2838', '0', '2906', '2906', '0', '0');
INSERT INTO `sx_area` VALUES ('2907', '米林县', '2838', '0,26,2838', '0', '2907', '2907', '0', '0');
INSERT INTO `sx_area` VALUES ('2908', '墨脱县', '2838', '0,26,2838', '0', '2908', '2908', '0', '0');
INSERT INTO `sx_area` VALUES ('2909', '波密县', '2838', '0,26,2838', '0', '2909', '2909', '0', '0');
INSERT INTO `sx_area` VALUES ('2910', '察隅县', '2838', '0,26,2838', '0', '2910', '2910', '0', '0');
INSERT INTO `sx_area` VALUES ('2911', '朗县', '2838', '0,26,2838', '0', '2911', '2911', '0', '0');
INSERT INTO `sx_area` VALUES ('2912', '西安市', '27', '0,27', '1', '2912,2922,2923,2924,2925,2926,2927,2928,2929,2930,2931,2932,2933,2934', '2912', '0', '0');
INSERT INTO `sx_area` VALUES ('2913', '铜川市', '27', '0,27', '1', '2913,2935,2936,2937,2938', '2913', '0', '0');
INSERT INTO `sx_area` VALUES ('2914', '宝鸡市', '27', '0,27', '1', '2914,2939,2940,2941,2942,2943,2944,2945,2946,2947,2948,2949,2950', '2914', '0', '0');
INSERT INTO `sx_area` VALUES ('2915', '咸阳市', '27', '0,27', '1', '2915,2951,2952,2953,2954,2955,2956,2957,2958,2959,2960,2961,2962,2963,2964', '2915', '0', '0');
INSERT INTO `sx_area` VALUES ('2916', '渭南市', '27', '0,27', '1', '2916,2965,2966,2967,2968,2969,2970,2971,2972,2973,2974,2975', '2916', '0', '0');
INSERT INTO `sx_area` VALUES ('2917', '延安市', '27', '0,27', '1', '2917,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988', '2917', '0', '0');
INSERT INTO `sx_area` VALUES ('2918', '汉中市', '27', '0,27', '1', '2918,2989,2990,2991,2992,2993,2994,2995,2996,2997,2998,2999', '2918', '0', '0');
INSERT INTO `sx_area` VALUES ('2919', '榆林市', '27', '0,27', '1', '2919,3000,3001,3002,3003,3004,3005,3006,3007,3008,3009,3010,3011', '2919', '0', '0');
INSERT INTO `sx_area` VALUES ('2920', '安康市', '27', '0,27', '1', '2920,3012,3013,3014,3015,3016,3017,3018,3019,3020,3021', '2920', '0', '0');
INSERT INTO `sx_area` VALUES ('2921', '商洛市', '27', '0,27', '1', '2921,3022,3023,3024,3025,3026,3027,3028', '2921', '0', '0');
INSERT INTO `sx_area` VALUES ('2922', '新城区', '2912', '0,27,2912', '0', '2922', '2922', '0', '0');
INSERT INTO `sx_area` VALUES ('2923', '碑林区', '2912', '0,27,2912', '0', '2923', '2923', '0', '0');
INSERT INTO `sx_area` VALUES ('2924', '莲湖区', '2912', '0,27,2912', '0', '2924', '2924', '0', '0');
INSERT INTO `sx_area` VALUES ('2925', '灞桥区', '2912', '0,27,2912', '0', '2925', '2925', '0', '0');
INSERT INTO `sx_area` VALUES ('2926', '未央区', '2912', '0,27,2912', '0', '2926', '2926', '0', '0');
INSERT INTO `sx_area` VALUES ('2927', '雁塔区', '2912', '0,27,2912', '0', '2927', '2927', '0', '0');
INSERT INTO `sx_area` VALUES ('2928', '阎良区', '2912', '0,27,2912', '0', '2928', '2928', '0', '0');
INSERT INTO `sx_area` VALUES ('2929', '临潼区', '2912', '0,27,2912', '0', '2929', '2929', '0', '0');
INSERT INTO `sx_area` VALUES ('2930', '长安区', '2912', '0,27,2912', '0', '2930', '2930', '0', '0');
INSERT INTO `sx_area` VALUES ('2931', '蓝田县', '2912', '0,27,2912', '0', '2931', '2931', '0', '0');
INSERT INTO `sx_area` VALUES ('2932', '周至县', '2912', '0,27,2912', '0', '2932', '2932', '0', '0');
INSERT INTO `sx_area` VALUES ('2933', '户县', '2912', '0,27,2912', '0', '2933', '2933', '0', '0');
INSERT INTO `sx_area` VALUES ('2934', '高陵县', '2912', '0,27,2912', '0', '2934', '2934', '0', '0');
INSERT INTO `sx_area` VALUES ('2935', '王益区', '2913', '0,27,2913', '0', '2935', '2935', '0', '0');
INSERT INTO `sx_area` VALUES ('2936', '印台区', '2913', '0,27,2913', '0', '2936', '2936', '0', '0');
INSERT INTO `sx_area` VALUES ('2937', '耀州区', '2913', '0,27,2913', '0', '2937', '2937', '0', '0');
INSERT INTO `sx_area` VALUES ('2938', '宜君县', '2913', '0,27,2913', '0', '2938', '2938', '0', '0');
INSERT INTO `sx_area` VALUES ('2939', '渭滨区', '2914', '0,27,2914', '0', '2939', '2939', '0', '0');
INSERT INTO `sx_area` VALUES ('2940', '金台区', '2914', '0,27,2914', '0', '2940', '2940', '0', '0');
INSERT INTO `sx_area` VALUES ('2941', '宝鸡县', '2914', '0,27,2914', '0', '2941', '2941', '0', '0');
INSERT INTO `sx_area` VALUES ('2942', '凤翔县', '2914', '0,27,2914', '0', '2942', '2942', '0', '0');
INSERT INTO `sx_area` VALUES ('2943', '岐山县', '2914', '0,27,2914', '0', '2943', '2943', '0', '0');
INSERT INTO `sx_area` VALUES ('2944', '扶风县', '2914', '0,27,2914', '0', '2944', '2944', '0', '0');
INSERT INTO `sx_area` VALUES ('2945', '眉县', '2914', '0,27,2914', '0', '2945', '2945', '0', '0');
INSERT INTO `sx_area` VALUES ('2946', '陇县', '2914', '0,27,2914', '0', '2946', '2946', '0', '0');
INSERT INTO `sx_area` VALUES ('2947', '千阳县', '2914', '0,27,2914', '0', '2947', '2947', '0', '0');
INSERT INTO `sx_area` VALUES ('2948', '麟游县', '2914', '0,27,2914', '0', '2948', '2948', '0', '0');
INSERT INTO `sx_area` VALUES ('2949', '凤县', '2914', '0,27,2914', '0', '2949', '2949', '0', '0');
INSERT INTO `sx_area` VALUES ('2950', '太白县', '2914', '0,27,2914', '0', '2950', '2950', '0', '0');
INSERT INTO `sx_area` VALUES ('2951', '秦都区', '2915', '0,27,2915', '0', '2951', '2951', '0', '0');
INSERT INTO `sx_area` VALUES ('2952', '杨凌区', '2915', '0,27,2915', '0', '2952', '2952', '0', '0');
INSERT INTO `sx_area` VALUES ('2953', '渭城区', '2915', '0,27,2915', '0', '2953', '2953', '0', '0');
INSERT INTO `sx_area` VALUES ('2954', '三原县', '2915', '0,27,2915', '0', '2954', '2954', '0', '0');
INSERT INTO `sx_area` VALUES ('2955', '泾阳县', '2915', '0,27,2915', '0', '2955', '2955', '0', '0');
INSERT INTO `sx_area` VALUES ('2956', '乾县', '2915', '0,27,2915', '0', '2956', '2956', '0', '0');
INSERT INTO `sx_area` VALUES ('2957', '礼泉县', '2915', '0,27,2915', '0', '2957', '2957', '0', '0');
INSERT INTO `sx_area` VALUES ('2958', '永寿县', '2915', '0,27,2915', '0', '2958', '2958', '0', '0');
INSERT INTO `sx_area` VALUES ('2959', '彬县', '2915', '0,27,2915', '0', '2959', '2959', '0', '0');
INSERT INTO `sx_area` VALUES ('2960', '长武县', '2915', '0,27,2915', '0', '2960', '2960', '0', '0');
INSERT INTO `sx_area` VALUES ('2961', '旬邑县', '2915', '0,27,2915', '0', '2961', '2961', '0', '0');
INSERT INTO `sx_area` VALUES ('2962', '淳化县', '2915', '0,27,2915', '0', '2962', '2962', '0', '0');
INSERT INTO `sx_area` VALUES ('2963', '武功县', '2915', '0,27,2915', '0', '2963', '2963', '0', '0');
INSERT INTO `sx_area` VALUES ('2964', '兴平市', '2915', '0,27,2915', '0', '2964', '2964', '0', '0');
INSERT INTO `sx_area` VALUES ('2965', '临渭区', '2916', '0,27,2916', '0', '2965', '2965', '0', '0');
INSERT INTO `sx_area` VALUES ('2966', '华县', '2916', '0,27,2916', '0', '2966', '2966', '0', '0');
INSERT INTO `sx_area` VALUES ('2967', '潼关县', '2916', '0,27,2916', '0', '2967', '2967', '0', '0');
INSERT INTO `sx_area` VALUES ('2968', '大荔县', '2916', '0,27,2916', '0', '2968', '2968', '0', '0');
INSERT INTO `sx_area` VALUES ('2969', '合阳县', '2916', '0,27,2916', '0', '2969', '2969', '0', '0');
INSERT INTO `sx_area` VALUES ('2970', '澄城县', '2916', '0,27,2916', '0', '2970', '2970', '0', '0');
INSERT INTO `sx_area` VALUES ('2971', '蒲城县', '2916', '0,27,2916', '0', '2971', '2971', '0', '0');
INSERT INTO `sx_area` VALUES ('2972', '白水县', '2916', '0,27,2916', '0', '2972', '2972', '0', '0');
INSERT INTO `sx_area` VALUES ('2973', '富平县', '2916', '0,27,2916', '0', '2973', '2973', '0', '0');
INSERT INTO `sx_area` VALUES ('2974', '韩城市', '2916', '0,27,2916', '0', '2974', '2974', '0', '0');
INSERT INTO `sx_area` VALUES ('2975', '华阴市', '2916', '0,27,2916', '0', '2975', '2975', '0', '0');
INSERT INTO `sx_area` VALUES ('2976', '宝塔区', '2917', '0,27,2917', '0', '2976', '2976', '0', '0');
INSERT INTO `sx_area` VALUES ('2977', '延长县', '2917', '0,27,2917', '0', '2977', '2977', '0', '0');
INSERT INTO `sx_area` VALUES ('2978', '延川县', '2917', '0,27,2917', '0', '2978', '2978', '0', '0');
INSERT INTO `sx_area` VALUES ('2979', '子长县', '2917', '0,27,2917', '0', '2979', '2979', '0', '0');
INSERT INTO `sx_area` VALUES ('2980', '安塞县', '2917', '0,27,2917', '0', '2980', '2980', '0', '0');
INSERT INTO `sx_area` VALUES ('2981', '志丹县', '2917', '0,27,2917', '0', '2981', '2981', '0', '0');
INSERT INTO `sx_area` VALUES ('2982', '吴旗县', '2917', '0,27,2917', '0', '2982', '2982', '0', '0');
INSERT INTO `sx_area` VALUES ('2983', '甘泉县', '2917', '0,27,2917', '0', '2983', '2983', '0', '0');
INSERT INTO `sx_area` VALUES ('2984', '富县', '2917', '0,27,2917', '0', '2984', '2984', '0', '0');
INSERT INTO `sx_area` VALUES ('2985', '洛川县', '2917', '0,27,2917', '0', '2985', '2985', '0', '0');
INSERT INTO `sx_area` VALUES ('2986', '宜川县', '2917', '0,27,2917', '0', '2986', '2986', '0', '0');
INSERT INTO `sx_area` VALUES ('2987', '黄龙县', '2917', '0,27,2917', '0', '2987', '2987', '0', '0');
INSERT INTO `sx_area` VALUES ('2988', '黄陵县', '2917', '0,27,2917', '0', '2988', '2988', '0', '0');
INSERT INTO `sx_area` VALUES ('2989', '汉台区', '2918', '0,27,2918', '0', '2989', '2989', '0', '0');
INSERT INTO `sx_area` VALUES ('2990', '南郑县', '2918', '0,27,2918', '0', '2990', '2990', '0', '0');
INSERT INTO `sx_area` VALUES ('2991', '城固县', '2918', '0,27,2918', '0', '2991', '2991', '0', '0');
INSERT INTO `sx_area` VALUES ('2992', '洋县', '2918', '0,27,2918', '0', '2992', '2992', '0', '0');
INSERT INTO `sx_area` VALUES ('2993', '西乡县', '2918', '0,27,2918', '0', '2993', '2993', '0', '0');
INSERT INTO `sx_area` VALUES ('2994', '勉县', '2918', '0,27,2918', '0', '2994', '2994', '0', '0');
INSERT INTO `sx_area` VALUES ('2995', '宁强县', '2918', '0,27,2918', '0', '2995', '2995', '0', '0');
INSERT INTO `sx_area` VALUES ('2996', '略阳县', '2918', '0,27,2918', '0', '2996', '2996', '0', '0');
INSERT INTO `sx_area` VALUES ('2997', '镇巴县', '2918', '0,27,2918', '0', '2997', '2997', '0', '0');
INSERT INTO `sx_area` VALUES ('2998', '留坝县', '2918', '0,27,2918', '0', '2998', '2998', '0', '0');
INSERT INTO `sx_area` VALUES ('2999', '佛坪县', '2918', '0,27,2918', '0', '2999', '2999', '0', '0');
INSERT INTO `sx_area` VALUES ('3000', '榆阳区', '2919', '0,27,2919', '0', '3000', '3000', '0', '0');
INSERT INTO `sx_area` VALUES ('3001', '神木县', '2919', '0,27,2919', '0', '3001', '3001', '0', '0');
INSERT INTO `sx_area` VALUES ('3002', '府谷县', '2919', '0,27,2919', '0', '3002', '3002', '0', '0');
INSERT INTO `sx_area` VALUES ('3003', '横山县', '2919', '0,27,2919', '0', '3003', '3003', '0', '0');
INSERT INTO `sx_area` VALUES ('3004', '靖边县', '2919', '0,27,2919', '0', '3004', '3004', '0', '0');
INSERT INTO `sx_area` VALUES ('3005', '定边县', '2919', '0,27,2919', '0', '3005', '3005', '0', '0');
INSERT INTO `sx_area` VALUES ('3006', '绥德县', '2919', '0,27,2919', '0', '3006', '3006', '0', '0');
INSERT INTO `sx_area` VALUES ('3007', '米脂县', '2919', '0,27,2919', '0', '3007', '3007', '0', '0');
INSERT INTO `sx_area` VALUES ('3008', '佳县', '2919', '0,27,2919', '0', '3008', '3008', '0', '0');
INSERT INTO `sx_area` VALUES ('3009', '吴堡县', '2919', '0,27,2919', '0', '3009', '3009', '0', '0');
INSERT INTO `sx_area` VALUES ('3010', '清涧县', '2919', '0,27,2919', '0', '3010', '3010', '0', '0');
INSERT INTO `sx_area` VALUES ('3011', '子洲县', '2919', '0,27,2919', '0', '3011', '3011', '0', '0');
INSERT INTO `sx_area` VALUES ('3012', '汉滨区', '2920', '0,27,2920', '0', '3012', '3012', '0', '0');
INSERT INTO `sx_area` VALUES ('3013', '汉阴县', '2920', '0,27,2920', '0', '3013', '3013', '0', '0');
INSERT INTO `sx_area` VALUES ('3014', '石泉县', '2920', '0,27,2920', '0', '3014', '3014', '0', '0');
INSERT INTO `sx_area` VALUES ('3015', '宁陕县', '2920', '0,27,2920', '0', '3015', '3015', '0', '0');
INSERT INTO `sx_area` VALUES ('3016', '紫阳县', '2920', '0,27,2920', '0', '3016', '3016', '0', '0');
INSERT INTO `sx_area` VALUES ('3017', '岚皋县', '2920', '0,27,2920', '0', '3017', '3017', '0', '0');
INSERT INTO `sx_area` VALUES ('3018', '平利县', '2920', '0,27,2920', '0', '3018', '3018', '0', '0');
INSERT INTO `sx_area` VALUES ('3019', '镇坪县', '2920', '0,27,2920', '0', '3019', '3019', '0', '0');
INSERT INTO `sx_area` VALUES ('3020', '旬阳县', '2920', '0,27,2920', '0', '3020', '3020', '0', '0');
INSERT INTO `sx_area` VALUES ('3021', '白河县', '2920', '0,27,2920', '0', '3021', '3021', '0', '0');
INSERT INTO `sx_area` VALUES ('3022', '商州区', '2921', '0,27,2921', '0', '3022', '3022', '0', '0');
INSERT INTO `sx_area` VALUES ('3023', '洛南县', '2921', '0,27,2921', '0', '3023', '3023', '0', '0');
INSERT INTO `sx_area` VALUES ('3024', '丹凤县', '2921', '0,27,2921', '0', '3024', '3024', '0', '0');
INSERT INTO `sx_area` VALUES ('3025', '商南县', '2921', '0,27,2921', '0', '3025', '3025', '0', '0');
INSERT INTO `sx_area` VALUES ('3026', '山阳县', '2921', '0,27,2921', '0', '3026', '3026', '0', '0');
INSERT INTO `sx_area` VALUES ('3027', '镇安县', '2921', '0,27,2921', '0', '3027', '3027', '0', '0');
INSERT INTO `sx_area` VALUES ('3028', '柞水县', '2921', '0,27,2921', '0', '3028', '3028', '0', '0');
INSERT INTO `sx_area` VALUES ('3029', '兰州市', '28', '0,28', '1', '3029,3043,3044,3045,3046,3047,3048,3049,3050', '3029', '0', '0');
INSERT INTO `sx_area` VALUES ('3030', '嘉峪关市', '28', '0,28', '1', '3030,3051,3052,3053', '3030', '0', '0');
INSERT INTO `sx_area` VALUES ('3031', '金昌市', '28', '0,28', '1', '3031,3054,3055', '3031', '0', '0');
INSERT INTO `sx_area` VALUES ('3032', '白银市', '28', '0,28', '1', '3032,3056,3057,3058,3059,3060', '3032', '0', '0');
INSERT INTO `sx_area` VALUES ('3033', '天水市', '28', '0,28', '1', '3033,3061,3062,3063,3064,3065,3066,3067', '3033', '0', '0');
INSERT INTO `sx_area` VALUES ('3034', '武威市', '28', '0,28', '1', '3034,3068,3069,3070,3071', '3034', '0', '0');
INSERT INTO `sx_area` VALUES ('3035', '张掖市', '28', '0,28', '1', '3035,3072,3073,3074,3075,3076,3077', '3035', '0', '0');
INSERT INTO `sx_area` VALUES ('3036', '平凉市', '28', '0,28', '1', '3036,3078,3079,3080,3081,3082,3083,3084', '3036', '0', '0');
INSERT INTO `sx_area` VALUES ('3037', '酒泉市', '28', '0,28', '1', '3037,3085,3086,3087,3088,3089,3090,3091', '3037', '0', '0');
INSERT INTO `sx_area` VALUES ('3038', '庆阳市', '28', '0,28', '1', '3038,3092,3093,3094,3095,3096,3097,3098,3099', '3038', '0', '0');
INSERT INTO `sx_area` VALUES ('3039', '定西地区', '28', '0,28', '1', '3039,3100,3101,3102,3103,3104,3105,3106', '3039', '0', '0');
INSERT INTO `sx_area` VALUES ('3040', '陇南地区', '28', '0,28', '1', '3040,3107,3108,3109,3110,3111,3112,3113,3114,3115', '3040', '0', '0');
INSERT INTO `sx_area` VALUES ('3041', '临夏回族自治州', '28', '0,28', '1', '3041,3116,3117,3118,3119,3120,3121,3122', '3041', '0', '0');
INSERT INTO `sx_area` VALUES ('3042', '甘南藏族自治州', '28', '0,28', '1', '3042,3123,3124,3125,3126,3127,3128,3129,3130', '3042', '0', '0');
INSERT INTO `sx_area` VALUES ('3043', '城关区', '3029', '0,28,3029', '0', '3043', '3043', '0', '0');
INSERT INTO `sx_area` VALUES ('3044', '七里河区', '3029', '0,28,3029', '0', '3044', '3044', '0', '0');
INSERT INTO `sx_area` VALUES ('3045', '西固区', '3029', '0,28,3029', '0', '3045', '3045', '0', '0');
INSERT INTO `sx_area` VALUES ('3046', '安宁区', '3029', '0,28,3029', '0', '3046', '3046', '0', '0');
INSERT INTO `sx_area` VALUES ('3047', '红古区', '3029', '0,28,3029', '0', '3047', '3047', '0', '0');
INSERT INTO `sx_area` VALUES ('3048', '永登县', '3029', '0,28,3029', '0', '3048', '3048', '0', '0');
INSERT INTO `sx_area` VALUES ('3049', '皋兰县', '3029', '0,28,3029', '0', '3049', '3049', '0', '0');
INSERT INTO `sx_area` VALUES ('3050', '榆中县', '3029', '0,28,3029', '0', '3050', '3050', '0', '0');
INSERT INTO `sx_area` VALUES ('3051', '峪泉镇', '3030', '0,28,3030', '0', '3051', '3051', '0', '0');
INSERT INTO `sx_area` VALUES ('3052', '文殊镇', '3030', '0,28,3030', '0', '3052', '3052', '0', '0');
INSERT INTO `sx_area` VALUES ('3053', '新城镇', '3030', '0,28,3030', '0', '3053', '3053', '0', '0');
INSERT INTO `sx_area` VALUES ('3054', '金川区', '3031', '0,28,3031', '0', '3054', '3054', '0', '0');
INSERT INTO `sx_area` VALUES ('3055', '永昌县', '3031', '0,28,3031', '0', '3055', '3055', '0', '0');
INSERT INTO `sx_area` VALUES ('3056', '白银区', '3032', '0,28,3032', '0', '3056', '3056', '0', '0');
INSERT INTO `sx_area` VALUES ('3057', '平川区', '3032', '0,28,3032', '0', '3057', '3057', '0', '0');
INSERT INTO `sx_area` VALUES ('3058', '靖远县', '3032', '0,28,3032', '0', '3058', '3058', '0', '0');
INSERT INTO `sx_area` VALUES ('3059', '会宁县', '3032', '0,28,3032', '0', '3059', '3059', '0', '0');
INSERT INTO `sx_area` VALUES ('3060', '景泰县', '3032', '0,28,3032', '0', '3060', '3060', '0', '0');
INSERT INTO `sx_area` VALUES ('3061', '秦城区', '3033', '0,28,3033', '0', '3061', '3061', '0', '0');
INSERT INTO `sx_area` VALUES ('3062', '北道区', '3033', '0,28,3033', '0', '3062', '3062', '0', '0');
INSERT INTO `sx_area` VALUES ('3063', '清水县', '3033', '0,28,3033', '0', '3063', '3063', '0', '0');
INSERT INTO `sx_area` VALUES ('3064', '秦安县', '3033', '0,28,3033', '0', '3064', '3064', '0', '0');
INSERT INTO `sx_area` VALUES ('3065', '甘谷县', '3033', '0,28,3033', '0', '3065', '3065', '0', '0');
INSERT INTO `sx_area` VALUES ('3066', '武山县', '3033', '0,28,3033', '0', '3066', '3066', '0', '0');
INSERT INTO `sx_area` VALUES ('3067', '张家川回族自治县', '3033', '0,28,3033', '0', '3067', '3067', '0', '0');
INSERT INTO `sx_area` VALUES ('3068', '凉州区', '3034', '0,28,3034', '0', '3068', '3068', '0', '0');
INSERT INTO `sx_area` VALUES ('3069', '民勤县', '3034', '0,28,3034', '0', '3069', '3069', '0', '0');
INSERT INTO `sx_area` VALUES ('3070', '古浪县', '3034', '0,28,3034', '0', '3070', '3070', '0', '0');
INSERT INTO `sx_area` VALUES ('3071', '天祝藏族自治县', '3034', '0,28,3034', '0', '3071', '3071', '0', '0');
INSERT INTO `sx_area` VALUES ('3072', '甘州区', '3035', '0,28,3035', '0', '3072', '3072', '0', '0');
INSERT INTO `sx_area` VALUES ('3073', '肃南裕固族自治县', '3035', '0,28,3035', '0', '3073', '3073', '0', '0');
INSERT INTO `sx_area` VALUES ('3074', '民乐县', '3035', '0,28,3035', '0', '3074', '3074', '0', '0');
INSERT INTO `sx_area` VALUES ('3075', '临泽县', '3035', '0,28,3035', '0', '3075', '3075', '0', '0');
INSERT INTO `sx_area` VALUES ('3076', '高台县', '3035', '0,28,3035', '0', '3076', '3076', '0', '0');
INSERT INTO `sx_area` VALUES ('3077', '山丹县', '3035', '0,28,3035', '0', '3077', '3077', '0', '0');
INSERT INTO `sx_area` VALUES ('3078', '崆峒区', '3036', '0,28,3036', '0', '3078', '3078', '0', '0');
INSERT INTO `sx_area` VALUES ('3079', '泾川县', '3036', '0,28,3036', '0', '3079', '3079', '0', '0');
INSERT INTO `sx_area` VALUES ('3080', '灵台县', '3036', '0,28,3036', '0', '3080', '3080', '0', '0');
INSERT INTO `sx_area` VALUES ('3081', '崇信县', '3036', '0,28,3036', '0', '3081', '3081', '0', '0');
INSERT INTO `sx_area` VALUES ('3082', '华亭县', '3036', '0,28,3036', '0', '3082', '3082', '0', '0');
INSERT INTO `sx_area` VALUES ('3083', '庄浪县', '3036', '0,28,3036', '0', '3083', '3083', '0', '0');
INSERT INTO `sx_area` VALUES ('3084', '静宁县', '3036', '0,28,3036', '0', '3084', '3084', '0', '0');
INSERT INTO `sx_area` VALUES ('3085', '肃州区', '3037', '0,28,3037', '0', '3085', '3085', '0', '0');
INSERT INTO `sx_area` VALUES ('3086', '金塔县', '3037', '0,28,3037', '0', '3086', '3086', '0', '0');
INSERT INTO `sx_area` VALUES ('3087', '安西县', '3037', '0,28,3037', '0', '3087', '3087', '0', '0');
INSERT INTO `sx_area` VALUES ('3088', '肃北蒙古族自治县', '3037', '0,28,3037', '0', '3088', '3088', '0', '0');
INSERT INTO `sx_area` VALUES ('3089', '阿克塞哈萨克族自治县', '3037', '0,28,3037', '0', '3089', '3089', '0', '0');
INSERT INTO `sx_area` VALUES ('3090', '玉门市', '3037', '0,28,3037', '0', '3090', '3090', '0', '0');
INSERT INTO `sx_area` VALUES ('3091', '敦煌市', '3037', '0,28,3037', '0', '3091', '3091', '0', '0');
INSERT INTO `sx_area` VALUES ('3092', '西峰区', '3038', '0,28,3038', '0', '3092', '3092', '0', '0');
INSERT INTO `sx_area` VALUES ('3093', '庆城县', '3038', '0,28,3038', '0', '3093', '3093', '0', '0');
INSERT INTO `sx_area` VALUES ('3094', '环县', '3038', '0,28,3038', '0', '3094', '3094', '0', '0');
INSERT INTO `sx_area` VALUES ('3095', '华池县', '3038', '0,28,3038', '0', '3095', '3095', '0', '0');
INSERT INTO `sx_area` VALUES ('3096', '合水县', '3038', '0,28,3038', '0', '3096', '3096', '0', '0');
INSERT INTO `sx_area` VALUES ('3097', '正宁县', '3038', '0,28,3038', '0', '3097', '3097', '0', '0');
INSERT INTO `sx_area` VALUES ('3098', '宁县', '3038', '0,28,3038', '0', '3098', '3098', '0', '0');
INSERT INTO `sx_area` VALUES ('3099', '镇原县', '3038', '0,28,3038', '0', '3099', '3099', '0', '0');
INSERT INTO `sx_area` VALUES ('3100', '定西县', '3039', '0,28,3039', '0', '3100', '3100', '0', '0');
INSERT INTO `sx_area` VALUES ('3101', '通渭县', '3039', '0,28,3039', '0', '3101', '3101', '0', '0');
INSERT INTO `sx_area` VALUES ('3102', '陇西县', '3039', '0,28,3039', '0', '3102', '3102', '0', '0');
INSERT INTO `sx_area` VALUES ('3103', '渭源县', '3039', '0,28,3039', '0', '3103', '3103', '0', '0');
INSERT INTO `sx_area` VALUES ('3104', '临洮县', '3039', '0,28,3039', '0', '3104', '3104', '0', '0');
INSERT INTO `sx_area` VALUES ('3105', '漳县', '3039', '0,28,3039', '0', '3105', '3105', '0', '0');
INSERT INTO `sx_area` VALUES ('3106', '岷县', '3039', '0,28,3039', '0', '3106', '3106', '0', '0');
INSERT INTO `sx_area` VALUES ('3107', '武都县', '3040', '0,28,3040', '0', '3107', '3107', '0', '0');
INSERT INTO `sx_area` VALUES ('3108', '宕昌县', '3040', '0,28,3040', '0', '3108', '3108', '0', '0');
INSERT INTO `sx_area` VALUES ('3109', '成县', '3040', '0,28,3040', '0', '3109', '3109', '0', '0');
INSERT INTO `sx_area` VALUES ('3110', '康县', '3040', '0,28,3040', '0', '3110', '3110', '0', '0');
INSERT INTO `sx_area` VALUES ('3111', '文县', '3040', '0,28,3040', '0', '3111', '3111', '0', '0');
INSERT INTO `sx_area` VALUES ('3112', '西和县', '3040', '0,28,3040', '0', '3112', '3112', '0', '0');
INSERT INTO `sx_area` VALUES ('3113', '礼县', '3040', '0,28,3040', '0', '3113', '3113', '0', '0');
INSERT INTO `sx_area` VALUES ('3114', '两当县', '3040', '0,28,3040', '0', '3114', '3114', '0', '0');
INSERT INTO `sx_area` VALUES ('3115', '徽县', '3040', '0,28,3040', '0', '3115', '3115', '0', '0');
INSERT INTO `sx_area` VALUES ('3116', '临夏市', '3041', '0,28,3041', '0', '3116', '3116', '0', '0');
INSERT INTO `sx_area` VALUES ('3117', '临夏县', '3041', '0,28,3041', '0', '3117', '3117', '0', '0');
INSERT INTO `sx_area` VALUES ('3118', '康乐县', '3041', '0,28,3041', '0', '3118', '3118', '0', '0');
INSERT INTO `sx_area` VALUES ('3119', '永靖县', '3041', '0,28,3041', '0', '3119', '3119', '0', '0');
INSERT INTO `sx_area` VALUES ('3120', '广河县', '3041', '0,28,3041', '0', '3120', '3120', '0', '0');
INSERT INTO `sx_area` VALUES ('3121', '和政县', '3041', '0,28,3041', '0', '3121', '3121', '0', '0');
INSERT INTO `sx_area` VALUES ('3122', '东乡族自治县', '3041', '0,28,3041', '0', '3122', '3122', '0', '0');
INSERT INTO `sx_area` VALUES ('3123', '合作市', '3042', '0,28,3042', '0', '3123', '3123', '0', '0');
INSERT INTO `sx_area` VALUES ('3124', '临潭县', '3042', '0,28,3042', '0', '3124', '3124', '0', '0');
INSERT INTO `sx_area` VALUES ('3125', '卓尼县', '3042', '0,28,3042', '0', '3125', '3125', '0', '0');
INSERT INTO `sx_area` VALUES ('3126', '舟曲县', '3042', '0,28,3042', '0', '3126', '3126', '0', '0');
INSERT INTO `sx_area` VALUES ('3127', '迭部县', '3042', '0,28,3042', '0', '3127', '3127', '0', '0');
INSERT INTO `sx_area` VALUES ('3128', '玛曲县', '3042', '0,28,3042', '0', '3128', '3128', '0', '0');
INSERT INTO `sx_area` VALUES ('3129', '碌曲县', '3042', '0,28,3042', '0', '3129', '3129', '0', '0');
INSERT INTO `sx_area` VALUES ('3130', '夏河县', '3042', '0,28,3042', '0', '3130', '3130', '0', '0');
INSERT INTO `sx_area` VALUES ('3131', '西宁市', '29', '0,29', '1', '3131,3139,3140,3141,3142,3143,3144,3145', '3131', '0', '0');
INSERT INTO `sx_area` VALUES ('3132', '海东地区', '29', '0,29', '1', '3132,3146,3147,3148,3149,3150,3151', '3132', '0', '0');
INSERT INTO `sx_area` VALUES ('3133', '海北藏族自治州', '29', '0,29', '1', '3133,3152,3153,3154,3155', '3133', '0', '0');
INSERT INTO `sx_area` VALUES ('3134', '黄南藏族自治州', '29', '0,29', '1', '3134,3156,3157,3158,3159', '3134', '0', '0');
INSERT INTO `sx_area` VALUES ('3135', '海南藏族自治州', '29', '0,29', '1', '3135,3160,3161,3162,3163,3164', '3135', '0', '0');
INSERT INTO `sx_area` VALUES ('3136', '果洛藏族自治州', '29', '0,29', '1', '3136,3165,3166,3167,3168,3169,3170', '3136', '0', '0');
INSERT INTO `sx_area` VALUES ('3137', '玉树藏族自治州', '29', '0,29', '1', '3137,3171,3172,3173,3174,3175,3176', '3137', '0', '0');
INSERT INTO `sx_area` VALUES ('3138', '海西蒙古族藏族自治州', '29', '0,29', '1', '3138,3177,3178,3179,3180,3181', '3138', '0', '0');
INSERT INTO `sx_area` VALUES ('3139', '城东区', '3131', '0,29,3131', '0', '3139', '3139', '0', '0');
INSERT INTO `sx_area` VALUES ('3140', '城中区', '3131', '0,29,3131', '0', '3140', '3140', '0', '0');
INSERT INTO `sx_area` VALUES ('3141', '城西区', '3131', '0,29,3131', '0', '3141', '3141', '0', '0');
INSERT INTO `sx_area` VALUES ('3142', '城北区', '3131', '0,29,3131', '0', '3142', '3142', '0', '0');
INSERT INTO `sx_area` VALUES ('3143', '大通回族土族自治县', '3131', '0,29,3131', '0', '3143', '3143', '0', '0');
INSERT INTO `sx_area` VALUES ('3144', '湟中县', '3131', '0,29,3131', '0', '3144', '3144', '0', '0');
INSERT INTO `sx_area` VALUES ('3145', '湟源县', '3131', '0,29,3131', '0', '3145', '3145', '0', '0');
INSERT INTO `sx_area` VALUES ('3146', '平安县', '3132', '0,29,3132', '0', '3146', '3146', '0', '0');
INSERT INTO `sx_area` VALUES ('3147', '民和回族土族自治县', '3132', '0,29,3132', '0', '3147', '3147', '0', '0');
INSERT INTO `sx_area` VALUES ('3148', '乐都县', '3132', '0,29,3132', '0', '3148', '3148', '0', '0');
INSERT INTO `sx_area` VALUES ('3149', '互助土族自治县', '3132', '0,29,3132', '0', '3149', '3149', '0', '0');
INSERT INTO `sx_area` VALUES ('3150', '化隆回族自治县', '3132', '0,29,3132', '0', '3150', '3150', '0', '0');
INSERT INTO `sx_area` VALUES ('3151', '循化撒拉族自治县', '3132', '0,29,3132', '0', '3151', '3151', '0', '0');
INSERT INTO `sx_area` VALUES ('3152', '门源回族自治县', '3133', '0,29,3133', '0', '3152', '3152', '0', '0');
INSERT INTO `sx_area` VALUES ('3153', '祁连县', '3133', '0,29,3133', '0', '3153', '3153', '0', '0');
INSERT INTO `sx_area` VALUES ('3154', '海晏县', '3133', '0,29,3133', '0', '3154', '3154', '0', '0');
INSERT INTO `sx_area` VALUES ('3155', '刚察县', '3133', '0,29,3133', '0', '3155', '3155', '0', '0');
INSERT INTO `sx_area` VALUES ('3156', '同仁县', '3134', '0,29,3134', '0', '3156', '3156', '0', '0');
INSERT INTO `sx_area` VALUES ('3157', '尖扎县', '3134', '0,29,3134', '0', '3157', '3157', '0', '0');
INSERT INTO `sx_area` VALUES ('3158', '泽库县', '3134', '0,29,3134', '0', '3158', '3158', '0', '0');
INSERT INTO `sx_area` VALUES ('3159', '河南蒙古族自治县', '3134', '0,29,3134', '0', '3159', '3159', '0', '0');
INSERT INTO `sx_area` VALUES ('3160', '共和县', '3135', '0,29,3135', '0', '3160', '3160', '0', '0');
INSERT INTO `sx_area` VALUES ('3161', '同德县', '3135', '0,29,3135', '0', '3161', '3161', '0', '0');
INSERT INTO `sx_area` VALUES ('3162', '贵德县', '3135', '0,29,3135', '0', '3162', '3162', '0', '0');
INSERT INTO `sx_area` VALUES ('3163', '兴海县', '3135', '0,29,3135', '0', '3163', '3163', '0', '0');
INSERT INTO `sx_area` VALUES ('3164', '贵南县', '3135', '0,29,3135', '0', '3164', '3164', '0', '0');
INSERT INTO `sx_area` VALUES ('3165', '玛沁县', '3136', '0,29,3136', '0', '3165', '3165', '0', '0');
INSERT INTO `sx_area` VALUES ('3166', '班玛县', '3136', '0,29,3136', '0', '3166', '3166', '0', '0');
INSERT INTO `sx_area` VALUES ('3167', '甘德县', '3136', '0,29,3136', '0', '3167', '3167', '0', '0');
INSERT INTO `sx_area` VALUES ('3168', '达日县', '3136', '0,29,3136', '0', '3168', '3168', '0', '0');
INSERT INTO `sx_area` VALUES ('3169', '久治县', '3136', '0,29,3136', '0', '3169', '3169', '0', '0');
INSERT INTO `sx_area` VALUES ('3170', '玛多县', '3136', '0,29,3136', '0', '3170', '3170', '0', '0');
INSERT INTO `sx_area` VALUES ('3171', '玉树县', '3137', '0,29,3137', '0', '3171', '3171', '0', '0');
INSERT INTO `sx_area` VALUES ('3172', '杂多县', '3137', '0,29,3137', '0', '3172', '3172', '0', '0');
INSERT INTO `sx_area` VALUES ('3173', '称多县', '3137', '0,29,3137', '0', '3173', '3173', '0', '0');
INSERT INTO `sx_area` VALUES ('3174', '治多县', '3137', '0,29,3137', '0', '3174', '3174', '0', '0');
INSERT INTO `sx_area` VALUES ('3175', '囊谦县', '3137', '0,29,3137', '0', '3175', '3175', '0', '0');
INSERT INTO `sx_area` VALUES ('3176', '曲麻莱县', '3137', '0,29,3137', '0', '3176', '3176', '0', '0');
INSERT INTO `sx_area` VALUES ('3177', '格尔木市', '3138', '0,29,3138', '0', '3177', '3177', '0', '0');
INSERT INTO `sx_area` VALUES ('3178', '德令哈市', '3138', '0,29,3138', '0', '3178', '3178', '0', '0');
INSERT INTO `sx_area` VALUES ('3179', '乌兰县', '3138', '0,29,3138', '0', '3179', '3179', '0', '0');
INSERT INTO `sx_area` VALUES ('3180', '都兰县', '3138', '0,29,3138', '0', '3180', '3180', '0', '0');
INSERT INTO `sx_area` VALUES ('3181', '天峻县', '3138', '0,29,3138', '0', '3181', '3181', '0', '0');
INSERT INTO `sx_area` VALUES ('3182', '银川市', '30', '0,30', '1', '3182,3186,3187,3188,3189,3190,3191', '3182', '0', '0');
INSERT INTO `sx_area` VALUES ('3183', '石嘴山市', '30', '0,30', '1', '3183,3192,3193,3194,3195,3196', '3183', '0', '0');
INSERT INTO `sx_area` VALUES ('3184', '吴忠市', '30', '0,30', '1', '3184,3197,3198,3199,3200,3201,3202', '3184', '0', '0');
INSERT INTO `sx_area` VALUES ('3185', '固原市', '30', '0,30', '1', '3185,3203,3204,3205,3206,3207,3208', '3185', '0', '0');
INSERT INTO `sx_area` VALUES ('3186', '兴庆区', '3182', '0,30,3182', '0', '3186', '3186', '0', '0');
INSERT INTO `sx_area` VALUES ('3187', '西夏区', '3182', '0,30,3182', '0', '3187', '3187', '0', '0');
INSERT INTO `sx_area` VALUES ('3188', '金凤区', '3182', '0,30,3182', '0', '3188', '3188', '0', '0');
INSERT INTO `sx_area` VALUES ('3189', '永宁县', '3182', '0,30,3182', '0', '3189', '3189', '0', '0');
INSERT INTO `sx_area` VALUES ('3190', '贺兰县', '3182', '0,30,3182', '0', '3190', '3190', '0', '0');
INSERT INTO `sx_area` VALUES ('3191', '灵武市', '3182', '0,30,3182', '0', '3191', '3191', '0', '0');
INSERT INTO `sx_area` VALUES ('3192', '大武口区', '3183', '0,30,3183', '0', '3192', '3192', '0', '0');
INSERT INTO `sx_area` VALUES ('3193', '石嘴山区', '3183', '0,30,3183', '0', '3193', '3193', '0', '0');
INSERT INTO `sx_area` VALUES ('3194', '平罗县', '3183', '0,30,3183', '0', '3194', '3194', '0', '0');
INSERT INTO `sx_area` VALUES ('3195', '陶乐县', '3183', '0,30,3183', '0', '3195', '3195', '0', '0');
INSERT INTO `sx_area` VALUES ('3196', '惠农县', '3183', '0,30,3183', '0', '3196', '3196', '0', '0');
INSERT INTO `sx_area` VALUES ('3197', '利通区', '3184', '0,30,3184', '0', '3197', '3197', '0', '0');
INSERT INTO `sx_area` VALUES ('3198', '中卫县', '3184', '0,30,3184', '0', '3198', '3198', '0', '0');
INSERT INTO `sx_area` VALUES ('3199', '中宁县', '3184', '0,30,3184', '0', '3199', '3199', '0', '0');
INSERT INTO `sx_area` VALUES ('3200', '盐池县', '3184', '0,30,3184', '0', '3200', '3200', '0', '0');
INSERT INTO `sx_area` VALUES ('3201', '同心县', '3184', '0,30,3184', '0', '3201', '3201', '0', '0');
INSERT INTO `sx_area` VALUES ('3202', '青铜峡市', '3184', '0,30,3184', '0', '3202', '3202', '0', '0');
INSERT INTO `sx_area` VALUES ('3203', '原州区', '3185', '0,30,3185', '0', '3203', '3203', '0', '0');
INSERT INTO `sx_area` VALUES ('3204', '海原县', '3185', '0,30,3185', '0', '3204', '3204', '0', '0');
INSERT INTO `sx_area` VALUES ('3205', '西吉县', '3185', '0,30,3185', '0', '3205', '3205', '0', '0');
INSERT INTO `sx_area` VALUES ('3206', '隆德县', '3185', '0,30,3185', '0', '3206', '3206', '0', '0');
INSERT INTO `sx_area` VALUES ('3207', '泾源县', '3185', '0,30,3185', '0', '3207', '3207', '0', '0');
INSERT INTO `sx_area` VALUES ('3208', '彭阳县', '3185', '0,30,3185', '0', '3208', '3208', '0', '0');
INSERT INTO `sx_area` VALUES ('3209', '乌鲁木齐市', '31', '0,31', '1', '3209,3224,3225,3226,3227,3228,3229,3230,3231,3232', '3209', '0', '0');
INSERT INTO `sx_area` VALUES ('3210', '克拉玛依市', '31', '0,31', '1', '3210,3233,3234,3235,3236', '3210', '0', '0');
INSERT INTO `sx_area` VALUES ('3211', '吐鲁番地区', '31', '0,31', '1', '3211,3237,3238,3239', '3211', '0', '0');
INSERT INTO `sx_area` VALUES ('3212', '哈密地区', '31', '0,31', '1', '3212,3240,3241,3242', '3212', '0', '0');
INSERT INTO `sx_area` VALUES ('3213', '昌吉回族自治州', '31', '0,31', '1', '3213,3243,3244,3245,3246,3247,3248,3249,3250', '3213', '0', '0');
INSERT INTO `sx_area` VALUES ('3214', '博尔塔拉蒙古自治州', '31', '0,31', '1', '3214,3251,3252,3253', '3214', '0', '0');
INSERT INTO `sx_area` VALUES ('3215', '巴音郭楞蒙古自治州', '31', '0,31', '1', '3215,3254,3255,3256,3257,3258,3259,3260,3261,3262', '3215', '0', '0');
INSERT INTO `sx_area` VALUES ('3216', '阿克苏地区', '31', '0,31', '1', '3216,3263,3264,3265,3266,3267,3268,3269,3270,3271', '3216', '0', '0');
INSERT INTO `sx_area` VALUES ('3217', '克孜勒苏柯尔克孜', '31', '0,31', '1', '3217,3272,3273,3274,3275', '3217', '0', '0');
INSERT INTO `sx_area` VALUES ('3218', '喀什地区', '31', '0,31', '1', '3218,3276,3277,3278,3279,3280,3281,3282,3283,3284,3285,3286', '3218', '0', '0');
INSERT INTO `sx_area` VALUES ('3219', '和田地区', '31', '0,31', '1', '3219,3287,3288,3289,3290,3291,3292,3293,3294', '3219', '0', '0');
INSERT INTO `sx_area` VALUES ('3220', '伊犁哈萨克自治州', '31', '0,31', '1', '3220,3295,3296,3297,3298,3299,3300,3301,3302,3303,3304', '3220', '0', '0');
INSERT INTO `sx_area` VALUES ('3221', '塔城地区', '31', '0,31', '1', '3221,3305,3306,3307,3308,3309,3310,3311', '3221', '0', '0');
INSERT INTO `sx_area` VALUES ('3222', '阿勒泰地区', '31', '0,31', '1', '3222,3312,3313,3314,3315,3316,3317,3318', '3222', '0', '0');
INSERT INTO `sx_area` VALUES ('3223', '省直辖行政单位', '31', '0,31', '1', '3223,3319,3320,3321,3322', '3223', '0', '0');
INSERT INTO `sx_area` VALUES ('3224', '天山区', '3209', '0,31,3209', '0', '3224', '3224', '0', '0');
INSERT INTO `sx_area` VALUES ('3225', '沙依巴克区', '3209', '0,31,3209', '0', '3225', '3225', '0', '0');
INSERT INTO `sx_area` VALUES ('3226', '新市区', '3209', '0,31,3209', '0', '3226', '3226', '0', '0');
INSERT INTO `sx_area` VALUES ('3227', '水磨沟区', '3209', '0,31,3209', '0', '3227', '3227', '0', '0');
INSERT INTO `sx_area` VALUES ('3228', '头屯河区', '3209', '0,31,3209', '0', '3228', '3228', '0', '0');
INSERT INTO `sx_area` VALUES ('3229', '达坂城区', '3209', '0,31,3209', '0', '3229', '3229', '0', '0');
INSERT INTO `sx_area` VALUES ('3230', '东山区', '3209', '0,31,3209', '0', '3230', '3230', '0', '0');
INSERT INTO `sx_area` VALUES ('3231', '开发区', '3209', '0,31,3209', '0', '3231', '3231', '0', '0');
INSERT INTO `sx_area` VALUES ('3232', '乌鲁木齐县', '3209', '0,31,3209', '0', '3232', '3232', '0', '0');
INSERT INTO `sx_area` VALUES ('3233', '独山子区', '3210', '0,31,3210', '0', '3233', '3233', '0', '0');
INSERT INTO `sx_area` VALUES ('3234', '克拉玛依区', '3210', '0,31,3210', '0', '3234', '3234', '0', '0');
INSERT INTO `sx_area` VALUES ('3235', '白碱滩区', '3210', '0,31,3210', '0', '3235', '3235', '0', '0');
INSERT INTO `sx_area` VALUES ('3236', '乌尔禾区', '3210', '0,31,3210', '0', '3236', '3236', '0', '0');
INSERT INTO `sx_area` VALUES ('3237', '吐鲁番市', '3211', '0,31,3211', '0', '3237', '3237', '0', '0');
INSERT INTO `sx_area` VALUES ('3238', '鄯善县', '3211', '0,31,3211', '0', '3238', '3238', '0', '0');
INSERT INTO `sx_area` VALUES ('3239', '托克逊县', '3211', '0,31,3211', '0', '3239', '3239', '0', '0');
INSERT INTO `sx_area` VALUES ('3240', '哈密市', '3212', '0,31,3212', '0', '3240', '3240', '0', '0');
INSERT INTO `sx_area` VALUES ('3241', '巴里坤哈萨克自治县', '3212', '0,31,3212', '0', '3241', '3241', '0', '0');
INSERT INTO `sx_area` VALUES ('3242', '伊吾县', '3212', '0,31,3212', '0', '3242', '3242', '0', '0');
INSERT INTO `sx_area` VALUES ('3243', '昌吉市', '3213', '0,31,3213', '0', '3243', '3243', '0', '0');
INSERT INTO `sx_area` VALUES ('3244', '阜康市', '3213', '0,31,3213', '0', '3244', '3244', '0', '0');
INSERT INTO `sx_area` VALUES ('3245', '米泉市', '3213', '0,31,3213', '0', '3245', '3245', '0', '0');
INSERT INTO `sx_area` VALUES ('3246', '呼图壁县', '3213', '0,31,3213', '0', '3246', '3246', '0', '0');
INSERT INTO `sx_area` VALUES ('3247', '玛纳斯县', '3213', '0,31,3213', '0', '3247', '3247', '0', '0');
INSERT INTO `sx_area` VALUES ('3248', '奇台县', '3213', '0,31,3213', '0', '3248', '3248', '0', '0');
INSERT INTO `sx_area` VALUES ('3249', '吉木萨尔县', '3213', '0,31,3213', '0', '3249', '3249', '0', '0');
INSERT INTO `sx_area` VALUES ('3250', '木垒哈萨克自治县', '3213', '0,31,3213', '0', '3250', '3250', '0', '0');
INSERT INTO `sx_area` VALUES ('3251', '博乐市', '3214', '0,31,3214', '0', '3251', '3251', '0', '0');
INSERT INTO `sx_area` VALUES ('3252', '精河县', '3214', '0,31,3214', '0', '3252', '3252', '0', '0');
INSERT INTO `sx_area` VALUES ('3253', '温泉县', '3214', '0,31,3214', '0', '3253', '3253', '0', '0');
INSERT INTO `sx_area` VALUES ('3254', '库尔勒市', '3215', '0,31,3215', '0', '3254', '3254', '0', '0');
INSERT INTO `sx_area` VALUES ('3255', '轮台县', '3215', '0,31,3215', '0', '3255', '3255', '0', '0');
INSERT INTO `sx_area` VALUES ('3256', '尉犁县', '3215', '0,31,3215', '0', '3256', '3256', '0', '0');
INSERT INTO `sx_area` VALUES ('3257', '若羌县', '3215', '0,31,3215', '0', '3257', '3257', '0', '0');
INSERT INTO `sx_area` VALUES ('3258', '且末县', '3215', '0,31,3215', '0', '3258', '3258', '0', '0');
INSERT INTO `sx_area` VALUES ('3259', '焉耆回族自治县', '3215', '0,31,3215', '0', '3259', '3259', '0', '0');
INSERT INTO `sx_area` VALUES ('3260', '和静县', '3215', '0,31,3215', '0', '3260', '3260', '0', '0');
INSERT INTO `sx_area` VALUES ('3261', '和硕县', '3215', '0,31,3215', '0', '3261', '3261', '0', '0');
INSERT INTO `sx_area` VALUES ('3262', '博湖县', '3215', '0,31,3215', '0', '3262', '3262', '0', '0');
INSERT INTO `sx_area` VALUES ('3263', '阿克苏市', '3216', '0,31,3216', '0', '3263', '3263', '0', '0');
INSERT INTO `sx_area` VALUES ('3264', '温宿县', '3216', '0,31,3216', '0', '3264', '3264', '0', '0');
INSERT INTO `sx_area` VALUES ('3265', '库车县', '3216', '0,31,3216', '0', '3265', '3265', '0', '0');
INSERT INTO `sx_area` VALUES ('3266', '沙雅县', '3216', '0,31,3216', '0', '3266', '3266', '0', '0');
INSERT INTO `sx_area` VALUES ('3267', '新和县', '3216', '0,31,3216', '0', '3267', '3267', '0', '0');
INSERT INTO `sx_area` VALUES ('3268', '拜城县', '3216', '0,31,3216', '0', '3268', '3268', '0', '0');
INSERT INTO `sx_area` VALUES ('3269', '乌什县', '3216', '0,31,3216', '0', '3269', '3269', '0', '0');
INSERT INTO `sx_area` VALUES ('3270', '阿瓦提县', '3216', '0,31,3216', '0', '3270', '3270', '0', '0');
INSERT INTO `sx_area` VALUES ('3271', '柯坪县', '3216', '0,31,3216', '0', '3271', '3271', '0', '0');
INSERT INTO `sx_area` VALUES ('3272', '阿图什市', '3217', '0,31,3217', '0', '3272', '3272', '0', '0');
INSERT INTO `sx_area` VALUES ('3273', '阿克陶县', '3217', '0,31,3217', '0', '3273', '3273', '0', '0');
INSERT INTO `sx_area` VALUES ('3274', '阿合奇县', '3217', '0,31,3217', '0', '3274', '3274', '0', '0');
INSERT INTO `sx_area` VALUES ('3275', '乌恰县', '3217', '0,31,3217', '0', '3275', '3275', '0', '0');
INSERT INTO `sx_area` VALUES ('3276', '喀什市', '3218', '0,31,3218', '0', '3276', '3276', '0', '0');
INSERT INTO `sx_area` VALUES ('3277', '疏附县', '3218', '0,31,3218', '0', '3277', '3277', '0', '0');
INSERT INTO `sx_area` VALUES ('3278', '疏勒县', '3218', '0,31,3218', '0', '3278', '3278', '0', '0');
INSERT INTO `sx_area` VALUES ('3279', '英吉沙县', '3218', '0,31,3218', '0', '3279', '3279', '0', '0');
INSERT INTO `sx_area` VALUES ('3280', '泽普县', '3218', '0,31,3218', '0', '3280', '3280', '0', '0');
INSERT INTO `sx_area` VALUES ('3281', '莎车县', '3218', '0,31,3218', '0', '3281', '3281', '0', '0');
INSERT INTO `sx_area` VALUES ('3282', '叶城县', '3218', '0,31,3218', '0', '3282', '3282', '0', '0');
INSERT INTO `sx_area` VALUES ('3283', '麦盖提县', '3218', '0,31,3218', '0', '3283', '3283', '0', '0');
INSERT INTO `sx_area` VALUES ('3284', '岳普湖县', '3218', '0,31,3218', '0', '3284', '3284', '0', '0');
INSERT INTO `sx_area` VALUES ('3285', '伽师县', '3218', '0,31,3218', '0', '3285', '3285', '0', '0');
INSERT INTO `sx_area` VALUES ('3286', '巴楚县', '3218', '0,31,3218', '0', '3286', '3286', '0', '0');
INSERT INTO `sx_area` VALUES ('3287', '和田市', '3219', '0,31,3219', '0', '3287', '3287', '0', '0');
INSERT INTO `sx_area` VALUES ('3288', '和田县', '3219', '0,31,3219', '0', '3288', '3288', '0', '0');
INSERT INTO `sx_area` VALUES ('3289', '墨玉县', '3219', '0,31,3219', '0', '3289', '3289', '0', '0');
INSERT INTO `sx_area` VALUES ('3290', '皮山县', '3219', '0,31,3219', '0', '3290', '3290', '0', '0');
INSERT INTO `sx_area` VALUES ('3291', '洛浦县', '3219', '0,31,3219', '0', '3291', '3291', '0', '0');
INSERT INTO `sx_area` VALUES ('3292', '策勒县', '3219', '0,31,3219', '0', '3292', '3292', '0', '0');
INSERT INTO `sx_area` VALUES ('3293', '于田县', '3219', '0,31,3219', '0', '3293', '3293', '0', '0');
INSERT INTO `sx_area` VALUES ('3294', '民丰县', '3219', '0,31,3219', '0', '3294', '3294', '0', '0');
INSERT INTO `sx_area` VALUES ('3295', '伊宁市', '3220', '0,31,3220', '0', '3295', '3295', '0', '0');
INSERT INTO `sx_area` VALUES ('3296', '奎屯市', '3220', '0,31,3220', '0', '3296', '3296', '0', '0');
INSERT INTO `sx_area` VALUES ('3297', '伊宁县', '3220', '0,31,3220', '0', '3297', '3297', '0', '0');
INSERT INTO `sx_area` VALUES ('3298', '察布查尔锡伯自治县', '3220', '0,31,3220', '0', '3298', '3298', '0', '0');
INSERT INTO `sx_area` VALUES ('3299', '霍城县', '3220', '0,31,3220', '0', '3299', '3299', '0', '0');
INSERT INTO `sx_area` VALUES ('3300', '巩留县', '3220', '0,31,3220', '0', '3300', '3300', '0', '0');
INSERT INTO `sx_area` VALUES ('3301', '新源县', '3220', '0,31,3220', '0', '3301', '3301', '0', '0');
INSERT INTO `sx_area` VALUES ('3302', '昭苏县', '3220', '0,31,3220', '0', '3302', '3302', '0', '0');
INSERT INTO `sx_area` VALUES ('3303', '特克斯县', '3220', '0,31,3220', '0', '3303', '3303', '0', '0');
INSERT INTO `sx_area` VALUES ('3304', '尼勒克县', '3220', '0,31,3220', '0', '3304', '3304', '0', '0');
INSERT INTO `sx_area` VALUES ('3305', '塔城市', '3221', '0,31,3221', '0', '3305', '3305', '0', '0');
INSERT INTO `sx_area` VALUES ('3306', '乌苏市', '3221', '0,31,3221', '0', '3306', '3306', '0', '0');
INSERT INTO `sx_area` VALUES ('3307', '额敏县', '3221', '0,31,3221', '0', '3307', '3307', '0', '0');
INSERT INTO `sx_area` VALUES ('3308', '沙湾县', '3221', '0,31,3221', '0', '3308', '3308', '0', '0');
INSERT INTO `sx_area` VALUES ('3309', '托里县', '3221', '0,31,3221', '0', '3309', '3309', '0', '0');
INSERT INTO `sx_area` VALUES ('3310', '裕民县', '3221', '0,31,3221', '0', '3310', '3310', '0', '0');
INSERT INTO `sx_area` VALUES ('3311', '和布克赛尔蒙古自治县', '3221', '0,31,3221', '0', '3311', '3311', '0', '0');
INSERT INTO `sx_area` VALUES ('3312', '阿勒泰市', '3222', '0,31,3222', '0', '3312', '3312', '0', '0');
INSERT INTO `sx_area` VALUES ('3313', '布尔津县', '3222', '0,31,3222', '0', '3313', '3313', '0', '0');
INSERT INTO `sx_area` VALUES ('3314', '富蕴县', '3222', '0,31,3222', '0', '3314', '3314', '0', '0');
INSERT INTO `sx_area` VALUES ('3315', '福海县', '3222', '0,31,3222', '0', '3315', '3315', '0', '0');
INSERT INTO `sx_area` VALUES ('3316', '哈巴河县', '3222', '0,31,3222', '0', '3316', '3316', '0', '0');
INSERT INTO `sx_area` VALUES ('3317', '青河县', '3222', '0,31,3222', '0', '3317', '3317', '0', '0');
INSERT INTO `sx_area` VALUES ('3318', '吉木乃县', '3222', '0,31,3222', '0', '3318', '3318', '0', '0');
INSERT INTO `sx_area` VALUES ('3319', '石河子市', '3223', '0,31,3223', '0', '3319', '3319', '0', '0');
INSERT INTO `sx_area` VALUES ('3320', '阿拉尔市', '3223', '0,31,3223', '0', '3320', '3320', '0', '0');
INSERT INTO `sx_area` VALUES ('3321', '图木舒克市', '3223', '0,31,3223', '0', '3321', '3321', '0', '0');
INSERT INTO `sx_area` VALUES ('3322', '五家渠市', '3223', '0,31,3223', '0', '3322', '3322', '0', '0');
INSERT INTO `sx_area` VALUES ('3323', '北部地区', '32', '0,32', '1', '3323,3327,3328,3329,3330,3331,3332,3333', '3323', '0', '0');
INSERT INTO `sx_area` VALUES ('3324', '中部地区', '32', '0,32', '1', '3324,3334,3335,3336,3337,3338,3339', '3324', '0', '0');
INSERT INTO `sx_area` VALUES ('3325', '南部地区', '32', '0,32', '1', '3325,3340,3341,3342,3343,3344,3345,3346,3347', '3325', '0', '0');
INSERT INTO `sx_area` VALUES ('3326', '东部地区', '32', '0,32', '1', '3326,3348,3349', '3326', '0', '0');
INSERT INTO `sx_area` VALUES ('3327', '台北市', '3323', '0,32,3323', '0', '3327', '3327', '0', '0');
INSERT INTO `sx_area` VALUES ('3328', '基隆市', '3323', '0,32,3323', '0', '3328', '3328', '0', '0');
INSERT INTO `sx_area` VALUES ('3329', '新竹市', '3323', '0,32,3323', '0', '3329', '3329', '0', '0');
INSERT INTO `sx_area` VALUES ('3330', '台北县', '3323', '0,32,3323', '0', '3330', '3330', '0', '0');
INSERT INTO `sx_area` VALUES ('3331', '桃园县', '3323', '0,32,3323', '0', '3331', '3331', '0', '0');
INSERT INTO `sx_area` VALUES ('3332', '宜兰县', '3323', '0,32,3323', '0', '3332', '3332', '0', '0');
INSERT INTO `sx_area` VALUES ('3333', '新竹县', '3323', '0,32,3323', '0', '3333', '3333', '0', '0');
INSERT INTO `sx_area` VALUES ('3334', '台中市', '3324', '0,32,3324', '0', '3334', '3334', '0', '0');
INSERT INTO `sx_area` VALUES ('3335', '台中县', '3324', '0,32,3324', '0', '3335', '3335', '0', '0');
INSERT INTO `sx_area` VALUES ('3336', '苗栗县', '3324', '0,32,3324', '0', '3336', '3336', '0', '0');
INSERT INTO `sx_area` VALUES ('3337', '彰化县', '3324', '0,32,3324', '0', '3337', '3337', '0', '0');
INSERT INTO `sx_area` VALUES ('3338', '南投县', '3324', '0,32,3324', '0', '3338', '3338', '0', '0');
INSERT INTO `sx_area` VALUES ('3339', '云林县', '3324', '0,32,3324', '0', '3339', '3339', '0', '0');
INSERT INTO `sx_area` VALUES ('3340', '高雄市', '3325', '0,32,3325', '0', '3340', '3340', '0', '0');
INSERT INTO `sx_area` VALUES ('3341', '台南市', '3325', '0,32,3325', '0', '3341', '3341', '0', '0');
INSERT INTO `sx_area` VALUES ('3342', '嘉义市', '3325', '0,32,3325', '0', '3342', '3342', '0', '0');
INSERT INTO `sx_area` VALUES ('3343', '台南县', '3325', '0,32,3325', '0', '3343', '3343', '0', '0');
INSERT INTO `sx_area` VALUES ('3344', '高雄县', '3325', '0,32,3325', '0', '3344', '3344', '0', '0');
INSERT INTO `sx_area` VALUES ('3345', '屏东县', '3325', '0,32,3325', '0', '3345', '3345', '0', '0');
INSERT INTO `sx_area` VALUES ('3346', '嘉义县', '3325', '0,32,3325', '0', '3346', '3346', '0', '0');
INSERT INTO `sx_area` VALUES ('3347', '澎湖县', '3325', '0,32,3325', '0', '3347', '3347', '0', '0');
INSERT INTO `sx_area` VALUES ('3348', '花莲县', '3326', '0,32,3326', '0', '3348', '3348', '0', '0');
INSERT INTO `sx_area` VALUES ('3349', '台东县', '3326', '0,32,3326', '0', '3349', '3349', '0', '0');
INSERT INTO `sx_area` VALUES ('3350', '香港岛(岛港区)', '33', '0,33', '1', '3350,3354,3355,3356,3357', '3350', '0', '0');
INSERT INTO `sx_area` VALUES ('3351', '九龙半岛', '33', '0,33', '1', '3351,3358,3359,3360,3361,3362,3363', '3351', '0', '0');
INSERT INTO `sx_area` VALUES ('3352', '新界', '33', '0,33', '1', '3352,3364,3365,3366,3367,3368,3369,3370,3371', '3352', '0', '0');
INSERT INTO `sx_area` VALUES ('3353', '离岛区', '33', '0,33', '0', '3353', '3353', '0', '0');
INSERT INTO `sx_area` VALUES ('3354', '中西区', '3350', '0,33,3350', '0', '3354', '3354', '0', '0');
INSERT INTO `sx_area` VALUES ('3355', '湾仔区', '3350', '0,33,3350', '0', '3355', '3355', '0', '0');
INSERT INTO `sx_area` VALUES ('3356', '东区', '3350', '0,33,3350', '0', '3356', '3356', '0', '0');
INSERT INTO `sx_area` VALUES ('3357', '南区', '3350', '0,33,3350', '0', '3357', '3357', '0', '0');
INSERT INTO `sx_area` VALUES ('3358', '九龙城区', '3351', '0,33,3351', '0', '3358', '3358', '0', '0');
INSERT INTO `sx_area` VALUES ('3359', '观塘区', '3351', '0,33,3351', '0', '3359', '3359', '0', '0');
INSERT INTO `sx_area` VALUES ('3360', '深水埗区', '3351', '0,33,3351', '0', '3360', '3360', '0', '0');
INSERT INTO `sx_area` VALUES ('3361', '黄大仙区', '3351', '0,33,3351', '0', '3361', '3361', '0', '0');
INSERT INTO `sx_area` VALUES ('3362', '油尖区', '3351', '0,33,3351', '0', '3362', '3362', '0', '0');
INSERT INTO `sx_area` VALUES ('3363', '旺角区', '3351', '0,33,3351', '0', '3363', '3363', '0', '0');
INSERT INTO `sx_area` VALUES ('3364', '沙田区', '3352', '0,33,3352', '0', '3364', '3364', '0', '0');
INSERT INTO `sx_area` VALUES ('3365', '大埔区', '3352', '0,33,3352', '0', '3365', '3365', '0', '0');
INSERT INTO `sx_area` VALUES ('3366', '北区', '3352', '0,33,3352', '0', '3366', '3366', '0', '0');
INSERT INTO `sx_area` VALUES ('3367', '荃湾区', '3352', '0,33,3352', '0', '3367', '3367', '0', '0');
INSERT INTO `sx_area` VALUES ('3368', '葵青区', '3352', '0,33,3352', '0', '3368', '3368', '0', '0');
INSERT INTO `sx_area` VALUES ('3369', '屯门区', '3352', '0,33,3352', '0', '3369', '3369', '0', '0');
INSERT INTO `sx_area` VALUES ('3370', '元朗区', '3352', '0,33,3352', '0', '3370', '3370', '0', '0');
INSERT INTO `sx_area` VALUES ('3371', '西贡区', '3352', '0,33,3352', '0', '3371', '3371', '0', '0');
INSERT INTO `sx_area` VALUES ('3372', '澳门半岛', '34', '0,34', '1', '3372,3374,3375,3376,3377,3378', '3372', '0', '0');
INSERT INTO `sx_area` VALUES ('3373', '澳门离岛', '34', '0,34', '1', '3373,3379,3380,3381', '3373', '0', '0');
INSERT INTO `sx_area` VALUES ('3374', '花地玛堂区(北区)', '3372', '0,34,3372', '0', '3374', '3374', '0', '0');
INSERT INTO `sx_area` VALUES ('3375', '圣安多尼堂区(花王堂区)', '3372', '0,34,3372', '0', '3375', '3375', '0', '0');
INSERT INTO `sx_area` VALUES ('3376', '大堂区(中区)', '3372', '0,34,3372', '0', '3376', '3376', '0', '0');
INSERT INTO `sx_area` VALUES ('3377', '望德堂区', '3372', '0,34,3372', '0', '3377', '3377', '0', '0');
INSERT INTO `sx_area` VALUES ('3378', '风顺堂区', '3372', '0,34,3372', '0', '3378', '3378', '0', '0');
INSERT INTO `sx_area` VALUES ('3379', '嘉模堂区', '3373', '0,34,3373', '0', '3379', '3379', '0', '0');
INSERT INTO `sx_area` VALUES ('3380', '圣方济堂区', '3373', '0,34,3373', '0', '3380', '3380', '0', '0');
INSERT INTO `sx_area` VALUES ('3381', '路氹城', '3373', '0,34,3373', '0', '3381', '3381', '0', '0');
INSERT INTO `sx_area` VALUES ('3382', 'Malaysia', '35', '0,35', '1', '3382,3386,3387,3388,3389,3390,3391,3392,3393,3394,3395,3396,3397,3398,3399', '3382', '0', '0');
INSERT INTO `sx_area` VALUES ('3383', 'Thailand', '35', '0,35', '1', '3383,3400,3401,3402,3403,3404,3405,3406,3407,3408,3409,3410,3411,3412,3413,3414,3415,3416,3417,3418,3419,3420,3421,3422,3423,3424,3425,3426,3427,3428,3429,3430,3431,3432,3433,3434,3435,3436,3437,3438,3439,3440,3441,3442,3443,3444,3445,3446,3447,3448,3449,3450,3451,3452,3453,3454,3455,3456,3457,3458,3459,3460,3461,3462,3463,3464,3465,3466,3467,3468,3469,3470,3471,3472,3473,3474,3475,3476,3477,3478,3479,3480', '3383', '0', '0');
INSERT INTO `sx_area` VALUES ('3384', 'Singapore', '35', '0,35', '1', '3384,3481,3482,3483,3484,3485,3486,3487,3488,3489,3490,3491,3492,3493,3494,3495,3496,3497,3498,3499,3500,3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521,3522,3523,3524,3525,3526,3527,3528,3529,3530,3531,3532,3533,3534,3535,3536,3537,3538,3539,3540,3541,3542,3543,3544,3545,3546,3547,3548,3549,3550,3551,3552,3553,3554,3555,3556,3557,3558,3559,3560,3561,3562,3563,3564,3565,3566,3567,3568,3569,3570,3571,3572,3573,3574,3575,3576,3577,3578,3579,3580,3581,3582,3583', '3384', '0', '0');
INSERT INTO `sx_area` VALUES ('3385', 'USA', '35', '0,35', '1', '3385,3584,3585,3586,3587,3588,3589,3590,3591,3592,3593,3594,3595,3596,3597,3598,3599,3600,3601,3602,3603,3604,3605,3606,3607,3608,3609,3610,3611,3612,3613,3614,3615,3616,3617,3618,3619,3620,3621,3622,3623,3624,3625,3626,3627,3628,3629,3630,3631,3632,3633,3634,3635,3636,3637,3638,3639,3640,3641,3642,3643,3644,3645', '3385', '0', '0');
INSERT INTO `sx_area` VALUES ('3386', 'Pulau Pinang', '3382', '0,35,3382', '0', '3386', '3386', '0', '0');
INSERT INTO `sx_area` VALUES ('3387', 'Perlis', '3382', '0,35,3382', '0', '3387', '3387', '0', '0');
INSERT INTO `sx_area` VALUES ('3388', 'Kedah', '3382', '0,35,3382', '0', '3388', '3388', '0', '0');
INSERT INTO `sx_area` VALUES ('3389', 'Perak', '3382', '0,35,3382', '0', '3389', '3389', '0', '0');
INSERT INTO `sx_area` VALUES ('3390', 'Kuala Lumpur', '3382', '0,35,3382', '0', '3390', '3390', '0', '0');
INSERT INTO `sx_area` VALUES ('3391', 'Negeri Sembilan', '3382', '0,35,3382', '0', '3391', '3391', '0', '0');
INSERT INTO `sx_area` VALUES ('3392', 'Pahang', '3382', '0,35,3382', '0', '3392', '3392', '0', '0');
INSERT INTO `sx_area` VALUES ('3393', 'Selangor', '3382', '0,35,3382', '0', '3393', '3393', '0', '0');
INSERT INTO `sx_area` VALUES ('3394', 'Johor', '3382', '0,35,3382', '0', '3394', '3394', '0', '0');
INSERT INTO `sx_area` VALUES ('3395', 'Melaka', '3382', '0,35,3382', '0', '3395', '3395', '0', '0');
INSERT INTO `sx_area` VALUES ('3396', 'Kelantan', '3382', '0,35,3382', '0', '3396', '3396', '0', '0');
INSERT INTO `sx_area` VALUES ('3397', 'Terengganu', '3382', '0,35,3382', '0', '3397', '3397', '0', '0');
INSERT INTO `sx_area` VALUES ('3398', 'Sarawak', '3382', '0,35,3382', '0', '3398', '3398', '0', '0');
INSERT INTO `sx_area` VALUES ('3399', 'Sabah', '3382', '0,35,3382', '0', '3399', '3399', '0', '0');
INSERT INTO `sx_area` VALUES ('3400', 'Central Thailand', '3383', '0,35,3383', '1', '3400,3404,3405,3406,3407,3408,3409,3410,3411,3412,3413,3414,3415,3416,3417,3418,3419,3420,3421,3422,3423,3424,3425,3426,3427,3428,3429,3430,3431,3432', '3400', '0', '0');
INSERT INTO `sx_area` VALUES ('3401', 'Northeastern Thailand', '3383', '0,35,3383', '1', '3401,3433,3434,3435,3436,3437,3438,3439,3440,3441,3442,3443,3444,3445,3446,3447,3448,3449,3450,3451', '3401', '0', '0');
INSERT INTO `sx_area` VALUES ('3402', 'Northern Thailand', '3383', '0,35,3383', '1', '3402,3452,3453,3454,3455,3456,3457,3458,3459,3460,3461,3462,3463,3464,3465', '3402', '0', '0');
INSERT INTO `sx_area` VALUES ('3403', 'Southern Thailand', '3383', '0,35,3383', '1', '3403,3466,3467,3468,3469,3470,3471,3472,3473,3474,3475,3476,3477,3478,3479,3480', '3403', '0', '0');
INSERT INTO `sx_area` VALUES ('3404', 'Pattaya', '3400', '0,35,3383,3400', '0', '3404', '3404', '0', '0');
INSERT INTO `sx_area` VALUES ('3405', 'Bangkok', '3400', '0,35,3383,3400', '0', '3405', '3405', '0', '0');
INSERT INTO `sx_area` VALUES ('3406', 'Samut Prakan', '3400', '0,35,3383,3400', '0', '3406', '3406', '0', '0');
INSERT INTO `sx_area` VALUES ('3407', 'Nonthaburi', '3400', '0,35,3383,3400', '0', '3407', '3407', '0', '0');
INSERT INTO `sx_area` VALUES ('3408', 'Pathum Thani', '3400', '0,35,3383,3400', '0', '3408', '3408', '0', '0');
INSERT INTO `sx_area` VALUES ('3409', 'PhraNakhon Si Ayutthaya', '3400', '0,35,3383,3400', '0', '3409', '3409', '0', '0');
INSERT INTO `sx_area` VALUES ('3410', 'Ang Thong', '3400', '0,35,3383,3400', '0', '3410', '3410', '0', '0');
INSERT INTO `sx_area` VALUES ('3411', 'Lop Buri', '3400', '0,35,3383,3400', '0', '3411', '3411', '0', '0');
INSERT INTO `sx_area` VALUES ('3412', 'Chai Nat', '3400', '0,35,3383,3400', '0', '3412', '3412', '0', '0');
INSERT INTO `sx_area` VALUES ('3413', 'Saraburi', '3400', '0,35,3383,3400', '0', '3413', '3413', '0', '0');
INSERT INTO `sx_area` VALUES ('3414', 'Chon Buri', '3400', '0,35,3383,3400', '0', '3414', '3414', '0', '0');
INSERT INTO `sx_area` VALUES ('3415', 'Rayong', '3400', '0,35,3383,3400', '0', '3415', '3415', '0', '0');
INSERT INTO `sx_area` VALUES ('3416', 'Chanthaburi', '3400', '0,35,3383,3400', '0', '3416', '3416', '0', '0');
INSERT INTO `sx_area` VALUES ('3417', 'Trat', '3400', '0,35,3383,3400', '0', '3417', '3417', '0', '0');
INSERT INTO `sx_area` VALUES ('3418', 'Chachoengsao', '3400', '0,35,3383,3400', '0', '3418', '3418', '0', '0');
INSERT INTO `sx_area` VALUES ('3419', 'Prachin Buri', '3400', '0,35,3383,3400', '0', '3419', '3419', '0', '0');
INSERT INTO `sx_area` VALUES ('3420', 'Nakhon Nayok', '3400', '0,35,3383,3400', '0', '3420', '3420', '0', '0');
INSERT INTO `sx_area` VALUES ('3421', 'Sa Kaeo', '3400', '0,35,3383,3400', '0', '3421', '3421', '0', '0');
INSERT INTO `sx_area` VALUES ('3422', 'Singhburi', '3400', '0,35,3383,3400', '0', '3422', '3422', '0', '0');
INSERT INTO `sx_area` VALUES ('3423', 'Nakhon Sawan', '3400', '0,35,3383,3400', '0', '3423', '3423', '0', '0');
INSERT INTO `sx_area` VALUES ('3424', 'Uthai Thani', '3400', '0,35,3383,3400', '0', '3424', '3424', '0', '0');
INSERT INTO `sx_area` VALUES ('3425', 'Suphan Buri', '3400', '0,35,3383,3400', '0', '3425', '3425', '0', '0');
INSERT INTO `sx_area` VALUES ('3426', 'Phetchabun', '3400', '0,35,3383,3400', '0', '3426', '3426', '0', '0');
INSERT INTO `sx_area` VALUES ('3427', 'Ratchaburi', '3400', '0,35,3383,3400', '0', '3427', '3427', '0', '0');
INSERT INTO `sx_area` VALUES ('3428', 'Kanchanaburi', '3400', '0,35,3383,3400', '0', '3428', '3428', '0', '0');
INSERT INTO `sx_area` VALUES ('3429', 'Nakhon Pathom', '3400', '0,35,3383,3400', '0', '3429', '3429', '0', '0');
INSERT INTO `sx_area` VALUES ('3430', 'Samut Sakhon', '3400', '0,35,3383,3400', '0', '3430', '3430', '0', '0');
INSERT INTO `sx_area` VALUES ('3431', 'Samut Songkhram', '3400', '0,35,3383,3400', '0', '3431', '3431', '0', '0');
INSERT INTO `sx_area` VALUES ('3432', 'Phetchaburi', '3400', '0,35,3383,3400', '0', '3432', '3432', '0', '0');
INSERT INTO `sx_area` VALUES ('3433', 'Si Sa Ket', '3401', '0,35,3383,3401', '0', '3433', '3433', '0', '0');
INSERT INTO `sx_area` VALUES ('3434', 'Nakhon Ratchasima', '3401', '0,35,3383,3401', '0', '3434', '3434', '0', '0');
INSERT INTO `sx_area` VALUES ('3435', 'Buri Ram', '3401', '0,35,3383,3401', '0', '3435', '3435', '0', '0');
INSERT INTO `sx_area` VALUES ('3436', 'Surin', '3401', '0,35,3383,3401', '0', '3436', '3436', '0', '0');
INSERT INTO `sx_area` VALUES ('3437', 'Ubon Ratchathani', '3401', '0,35,3383,3401', '0', '3437', '3437', '0', '0');
INSERT INTO `sx_area` VALUES ('3438', 'Yasothon', '3401', '0,35,3383,3401', '0', '3438', '3438', '0', '0');
INSERT INTO `sx_area` VALUES ('3439', 'Chaiyaphum', '3401', '0,35,3383,3401', '0', '3439', '3439', '0', '0');
INSERT INTO `sx_area` VALUES ('3440', 'Amnat Charoen', '3401', '0,35,3383,3401', '0', '3440', '3440', '0', '0');
INSERT INTO `sx_area` VALUES ('3441', 'Nong Bua Lam Phu', '3401', '0,35,3383,3401', '0', '3441', '3441', '0', '0');
INSERT INTO `sx_area` VALUES ('3442', 'Khon Kaen', '3401', '0,35,3383,3401', '0', '3442', '3442', '0', '0');
INSERT INTO `sx_area` VALUES ('3443', 'Udon Thani', '3401', '0,35,3383,3401', '0', '3443', '3443', '0', '0');
INSERT INTO `sx_area` VALUES ('3444', 'Loei', '3401', '0,35,3383,3401', '0', '3444', '3444', '0', '0');
INSERT INTO `sx_area` VALUES ('3445', 'Nong Khai', '3401', '0,35,3383,3401', '0', '3445', '3445', '0', '0');
INSERT INTO `sx_area` VALUES ('3446', 'Maha Sarakham', '3401', '0,35,3383,3401', '0', '3446', '3446', '0', '0');
INSERT INTO `sx_area` VALUES ('3447', 'Roi Et', '3401', '0,35,3383,3401', '0', '3447', '3447', '0', '0');
INSERT INTO `sx_area` VALUES ('3448', 'Kalasin', '3401', '0,35,3383,3401', '0', '3448', '3448', '0', '0');
INSERT INTO `sx_area` VALUES ('3449', 'Sakon Nakhon', '3401', '0,35,3383,3401', '0', '3449', '3449', '0', '0');
INSERT INTO `sx_area` VALUES ('3450', 'Nakhon Phanom', '3401', '0,35,3383,3401', '0', '3450', '3450', '0', '0');
INSERT INTO `sx_area` VALUES ('3451', 'Mukdahan', '3401', '0,35,3383,3401', '0', '3451', '3451', '0', '0');
INSERT INTO `sx_area` VALUES ('3452', 'Chiang Mai', '3402', '0,35,3383,3402', '0', '3452', '3452', '0', '0');
INSERT INTO `sx_area` VALUES ('3453', 'Lamphun', '3402', '0,35,3383,3402', '0', '3453', '3453', '0', '0');
INSERT INTO `sx_area` VALUES ('3454', 'Lampang', '3402', '0,35,3383,3402', '0', '3454', '3454', '0', '0');
INSERT INTO `sx_area` VALUES ('3455', 'Uttaradit', '3402', '0,35,3383,3402', '0', '3455', '3455', '0', '0');
INSERT INTO `sx_area` VALUES ('3456', 'Phrae', '3402', '0,35,3383,3402', '0', '3456', '3456', '0', '0');
INSERT INTO `sx_area` VALUES ('3457', 'Nan', '3402', '0,35,3383,3402', '0', '3457', '3457', '0', '0');
INSERT INTO `sx_area` VALUES ('3458', 'Phayao', '3402', '0,35,3383,3402', '0', '3458', '3458', '0', '0');
INSERT INTO `sx_area` VALUES ('3459', 'Chiang Rai', '3402', '0,35,3383,3402', '0', '3459', '3459', '0', '0');
INSERT INTO `sx_area` VALUES ('3460', 'Mae Hong Son', '3402', '0,35,3383,3402', '0', '3460', '3460', '0', '0');
INSERT INTO `sx_area` VALUES ('3461', 'Kamphaeng Phet', '3402', '0,35,3383,3402', '0', '3461', '3461', '0', '0');
INSERT INTO `sx_area` VALUES ('3462', 'Tak', '3402', '0,35,3383,3402', '0', '3462', '3462', '0', '0');
INSERT INTO `sx_area` VALUES ('3463', 'Phitsanulok', '3402', '0,35,3383,3402', '0', '3463', '3463', '0', '0');
INSERT INTO `sx_area` VALUES ('3464', 'Phichit', '3402', '0,35,3383,3402', '0', '3464', '3464', '0', '0');
INSERT INTO `sx_area` VALUES ('3465', 'Sukhothai', '3402', '0,35,3383,3402', '0', '3465', '3465', '0', '0');
INSERT INTO `sx_area` VALUES ('3466', 'Prachuap Khiri Khan', '3403', '0,35,3383,3403', '0', '3466', '3466', '0', '0');
INSERT INTO `sx_area` VALUES ('3467', 'Nakhon Si Thammarat', '3403', '0,35,3383,3403', '0', '3467', '3467', '0', '0');
INSERT INTO `sx_area` VALUES ('3468', 'Krabi', '3403', '0,35,3383,3403', '0', '3468', '3468', '0', '0');
INSERT INTO `sx_area` VALUES ('3469', 'Phangnga', '3403', '0,35,3383,3403', '0', '3469', '3469', '0', '0');
INSERT INTO `sx_area` VALUES ('3470', 'Phuket', '3403', '0,35,3383,3403', '0', '3470', '3470', '0', '0');
INSERT INTO `sx_area` VALUES ('3471', 'Surat Thani', '3403', '0,35,3383,3403', '0', '3471', '3471', '0', '0');
INSERT INTO `sx_area` VALUES ('3472', 'Ranong', '3403', '0,35,3383,3403', '0', '3472', '3472', '0', '0');
INSERT INTO `sx_area` VALUES ('3473', 'Chumphon', '3403', '0,35,3383,3403', '0', '3473', '3473', '0', '0');
INSERT INTO `sx_area` VALUES ('3474', 'Satun', '3403', '0,35,3383,3403', '0', '3474', '3474', '0', '0');
INSERT INTO `sx_area` VALUES ('3475', 'Trang', '3403', '0,35,3383,3403', '0', '3475', '3475', '0', '0');
INSERT INTO `sx_area` VALUES ('3476', 'Phatthalung', '3403', '0,35,3383,3403', '0', '3476', '3476', '0', '0');
INSERT INTO `sx_area` VALUES ('3477', 'Pattani', '3403', '0,35,3383,3403', '0', '3477', '3477', '0', '0');
INSERT INTO `sx_area` VALUES ('3478', 'Yala', '3403', '0,35,3383,3403', '0', '3478', '3478', '0', '0');
INSERT INTO `sx_area` VALUES ('3479', 'Narathiwat', '3403', '0,35,3383,3403', '0', '3479', '3479', '0', '0');
INSERT INTO `sx_area` VALUES ('3480', 'Songkhla', '3403', '0,35,3383,3403', '0', '3480', '3480', '0', '0');
INSERT INTO `sx_area` VALUES ('3481', 'City', '3384', '0,35,3384', '1', '3481,3489,3490,3491,3492,3493,3494,3495,3496,3497,3498,3499,3500,3501,3502,3503,3504,3505', '3481', '0', '0');
INSERT INTO `sx_area` VALUES ('3482', 'Central', '3384', '0,35,3384', '1', '3482,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521,3522,3523,3524,3525,3526,3527,3528,3529,3530,3531,3532,3533,3534,3535,3536,3537,3538,3539,3540,3541,3542,3543,3544', '3482', '0', '0');
INSERT INTO `sx_area` VALUES ('3483', 'South', '3384', '0,35,3384', '1', '3483,3545,3546,3547,3548,3549,3550,3551,3552', '3483', '0', '0');
INSERT INTO `sx_area` VALUES ('3484', 'East Coast', '3384', '0,35,3384', '1', '3484,3553,3554,3555,3556,3557,3558,3559', '3484', '0', '0');
INSERT INTO `sx_area` VALUES ('3485', 'North East', '3384', '0,35,3384', '1', '3485,3560,3561,3562,3563,3564', '3485', '0', '0');
INSERT INTO `sx_area` VALUES ('3486', 'North West', '3384', '0,35,3384', '1', '3486,3565,3566,3567,3568,3569,3570,3571,3572', '3486', '0', '0');
INSERT INTO `sx_area` VALUES ('3487', 'North', '3384', '0,35,3384', '1', '3487,3573,3574,3575,3576,3577,3578', '3487', '0', '0');
INSERT INTO `sx_area` VALUES ('3488', 'Far East', '3384', '0,35,3384', '1', '3488,3579,3580,3581,3582,3583', '3488', '0', '0');
INSERT INTO `sx_area` VALUES ('3489', 'Boat Quay', '3481', '0,35,3384,3481', '0', '3489', '3489', '0', '0');
INSERT INTO `sx_area` VALUES ('3490', 'Shenton Way', '3481', '0,35,3384,3481', '0', '3490', '3490', '0', '0');
INSERT INTO `sx_area` VALUES ('3491', 'Tanjong Pagar', '3481', '0,35,3384,3481', '0', '3491', '3491', '0', '0');
INSERT INTO `sx_area` VALUES ('3492', 'City Hall', '3481', '0,35,3384,3481', '0', '3492', '3492', '0', '0');
INSERT INTO `sx_area` VALUES ('3493', 'High Street', '3481', '0,35,3384,3481', '0', '3493', '3493', '0', '0');
INSERT INTO `sx_area` VALUES ('3494', 'North Bridge Road', '3481', '0,35,3384,3481', '0', '3494', '3494', '0', '0');
INSERT INTO `sx_area` VALUES ('3495', 'Beach Road', '3481', '0,35,3384,3481', '0', '3495', '3495', '0', '0');
INSERT INTO `sx_area` VALUES ('3496', 'Bencoolen Road', '3481', '0,35,3384,3481', '0', '3496', '3496', '0', '0');
INSERT INTO `sx_area` VALUES ('3497', 'Bugis', '3481', '0,35,3384,3481', '0', '3497', '3497', '0', '0');
INSERT INTO `sx_area` VALUES ('3498', 'Rochor', '3481', '0,35,3384,3481', '0', '3498', '3498', '0', '0');
INSERT INTO `sx_area` VALUES ('3499', 'Chinatown', '3481', '0,35,3384,3481', '0', '3499', '3499', '0', '0');
INSERT INTO `sx_area` VALUES ('3500', 'Havelock Road', '3481', '0,35,3384,3481', '0', '3500', '3500', '0', '0');
INSERT INTO `sx_area` VALUES ('3501', 'Marina Square', '3481', '0,35,3384,3481', '0', '3501', '3501', '0', '0');
INSERT INTO `sx_area` VALUES ('3502', 'Raffles Place', '3481', '0,35,3384,3481', '0', '3502', '3502', '0', '0');
INSERT INTO `sx_area` VALUES ('3503', 'Suntec City', '3481', '0,35,3384,3481', '0', '3503', '3503', '0', '0');
INSERT INTO `sx_area` VALUES ('3504', 'Anson Road', '3481', '0,35,3384,3481', '0', '3504', '3504', '0', '0');
INSERT INTO `sx_area` VALUES ('3505', 'Neil Road', '3481', '0,35,3384,3481', '0', '3505', '3505', '0', '0');
INSERT INTO `sx_area` VALUES ('3506', 'Alexandra Road', '3482', '0,35,3384,3482', '0', '3506', '3506', '0', '0');
INSERT INTO `sx_area` VALUES ('3507', 'Orchard', '3482', '0,35,3384,3482', '0', '3507', '3507', '0', '0');
INSERT INTO `sx_area` VALUES ('3508', 'Oxley', '3482', '0,35,3384,3482', '0', '3508', '3508', '0', '0');
INSERT INTO `sx_area` VALUES ('3509', 'Balmoral', '3482', '0,35,3384,3482', '0', '3509', '3509', '0', '0');
INSERT INTO `sx_area` VALUES ('3510', 'Bukit Timah', '3482', '0,35,3384,3482', '0', '3510', '3510', '0', '0');
INSERT INTO `sx_area` VALUES ('3511', 'Grange Road', '3482', '0,35,3384,3482', '0', '3511', '3511', '0', '0');
INSERT INTO `sx_area` VALUES ('3512', 'Holland', '3482', '0,35,3384,3482', '0', '3512', '3512', '0', '0');
INSERT INTO `sx_area` VALUES ('3513', 'Orchard Boulevard', '3482', '0,35,3384,3482', '0', '3513', '3513', '0', '0');
INSERT INTO `sx_area` VALUES ('3514', 'River Valley', '3482', '0,35,3384,3482', '0', '3514', '3514', '0', '0');
INSERT INTO `sx_area` VALUES ('3515', 'Tanglin Road', '3482', '0,35,3384,3482', '0', '3515', '3515', '0', '0');
INSERT INTO `sx_area` VALUES ('3516', 'Tiong Bahru', '3482', '0,35,3384,3482', '0', '3516', '3516', '0', '0');
INSERT INTO `sx_area` VALUES ('3517', 'Chancery', '3482', '0,35,3384,3482', '0', '3517', '3517', '0', '0');
INSERT INTO `sx_area` VALUES ('3518', 'Bukit Timah', '3482', '0,35,3384,3482', '0', '3518', '3518', '0', '0');
INSERT INTO `sx_area` VALUES ('3519', 'Dunearn Road', '3482', '0,35,3384,3482', '0', '3519', '3519', '0', '0');
INSERT INTO `sx_area` VALUES ('3520', 'Newton', '3482', '0,35,3384,3482', '0', '3520', '3520', '0', '0');
INSERT INTO `sx_area` VALUES ('3521', 'Balestier', '3482', '0,35,3384,3482', '0', '3521', '3521', '0', '0');
INSERT INTO `sx_area` VALUES ('3522', 'Moulmein', '3482', '0,35,3384,3482', '0', '3522', '3522', '0', '0');
INSERT INTO `sx_area` VALUES ('3523', 'Novena', '3482', '0,35,3384,3482', '0', '3523', '3523', '0', '0');
INSERT INTO `sx_area` VALUES ('3524', 'Toa Payoh', '3482', '0,35,3384,3482', '0', '3524', '3524', '0', '0');
INSERT INTO `sx_area` VALUES ('3525', 'Potong Pasir', '3482', '0,35,3384,3482', '0', '3525', '3525', '0', '0');
INSERT INTO `sx_area` VALUES ('3526', 'Queenstown', '3482', '0,35,3384,3482', '0', '3526', '3526', '0', '0');
INSERT INTO `sx_area` VALUES ('3527', 'Macpherson', '3482', '0,35,3384,3482', '0', '3527', '3527', '0', '0');
INSERT INTO `sx_area` VALUES ('3528', 'Eunos', '3482', '0,35,3384,3482', '0', '3528', '3528', '0', '0');
INSERT INTO `sx_area` VALUES ('3529', 'Geylang', '3482', '0,35,3384,3482', '0', '3529', '3529', '0', '0');
INSERT INTO `sx_area` VALUES ('3530', 'Kembangan', '3482', '0,35,3384,3482', '0', '3530', '3530', '0', '0');
INSERT INTO `sx_area` VALUES ('3531', 'Paya Lebar', '3482', '0,35,3384,3482', '0', '3531', '3531', '0', '0');
INSERT INTO `sx_area` VALUES ('3532', 'Ang Mo Kio', '3482', '0,35,3384,3482', '0', '3532', '3532', '0', '0');
INSERT INTO `sx_area` VALUES ('3533', 'Bishan', '3482', '0,35,3384,3482', '0', '3533', '3533', '0', '0');
INSERT INTO `sx_area` VALUES ('3534', 'Braddell Road', '3482', '0,35,3384,3482', '0', '3534', '3534', '0', '0');
INSERT INTO `sx_area` VALUES ('3535', 'Thomson', '3482', '0,35,3384,3482', '0', '3535', '3535', '0', '0');
INSERT INTO `sx_area` VALUES ('3536', 'Little India', '3482', '0,35,3384,3482', '0', '3536', '3536', '0', '0');
INSERT INTO `sx_area` VALUES ('3537', 'Clementi', '3482', '0,35,3384,3482', '0', '3537', '3537', '0', '0');
INSERT INTO `sx_area` VALUES ('3538', 'Upper Bukit Timah', '3482', '0,35,3384,3482', '0', '3538', '3538', '0', '0');
INSERT INTO `sx_area` VALUES ('3539', 'Hume Avenue', '3482', '0,35,3384,3482', '0', '3539', '3539', '0', '0');
INSERT INTO `sx_area` VALUES ('3540', 'Farrer Park', '3482', '0,35,3384,3482', '0', '3540', '3540', '0', '0');
INSERT INTO `sx_area` VALUES ('3541', 'Serangoon Road', '3482', '0,35,3384,3482', '0', '3541', '3541', '0', '0');
INSERT INTO `sx_area` VALUES ('3542', 'Cairnhill', '3482', '0,35,3384,3482', '0', '3542', '3542', '0', '0');
INSERT INTO `sx_area` VALUES ('3543', 'Killiney', '3482', '0,35,3384,3482', '0', '3543', '3543', '0', '0');
INSERT INTO `sx_area` VALUES ('3544', 'Leonie Hill', '3482', '0,35,3384,3482', '0', '3544', '3544', '0', '0');
INSERT INTO `sx_area` VALUES ('3545', 'Keppel', '3483', '0,35,3384,3483', '0', '3545', '3545', '0', '0');
INSERT INTO `sx_area` VALUES ('3546', 'Mount Faber', '3483', '0,35,3384,3483', '0', '3546', '3546', '0', '0');
INSERT INTO `sx_area` VALUES ('3547', 'Sentosa', '3483', '0,35,3384,3483', '0', '3547', '3547', '0', '0');
INSERT INTO `sx_area` VALUES ('3548', 'Telok Blangah', '3483', '0,35,3384,3483', '0', '3548', '3548', '0', '0');
INSERT INTO `sx_area` VALUES ('3549', 'Buona Vista', '3483', '0,35,3384,3483', '0', '3549', '3549', '0', '0');
INSERT INTO `sx_area` VALUES ('3550', 'Dover', '3483', '0,35,3384,3483', '0', '3550', '3550', '0', '0');
INSERT INTO `sx_area` VALUES ('3551', 'Pasir Panjang', '3483', '0,35,3384,3483', '0', '3551', '3551', '0', '0');
INSERT INTO `sx_area` VALUES ('3552', 'West Coast', '3483', '0,35,3384,3483', '0', '3552', '3552', '0', '0');
INSERT INTO `sx_area` VALUES ('3553', 'Katong', '3484', '0,35,3384,3484', '0', '3553', '3553', '0', '0');
INSERT INTO `sx_area` VALUES ('3554', 'Marine Parade', '3484', '0,35,3384,3484', '0', '3554', '3554', '0', '0');
INSERT INTO `sx_area` VALUES ('3555', 'Siglap', '3484', '0,35,3384,3484', '0', '3555', '3555', '0', '0');
INSERT INTO `sx_area` VALUES ('3556', 'Tanjong Rhu', '3484', '0,35,3384,3484', '0', '3556', '3556', '0', '0');
INSERT INTO `sx_area` VALUES ('3557', 'Bayshore', '3484', '0,35,3384,3484', '0', '3557', '3557', '0', '0');
INSERT INTO `sx_area` VALUES ('3558', 'Bedok', '3484', '0,35,3384,3484', '0', '3558', '3558', '0', '0');
INSERT INTO `sx_area` VALUES ('3559', 'Chai Chee', '3484', '0,35,3384,3484', '0', '3559', '3559', '0', '0');
INSERT INTO `sx_area` VALUES ('3560', 'Hougang', '3485', '0,35,3384,3485', '0', '3560', '3560', '0', '0');
INSERT INTO `sx_area` VALUES ('3561', 'Punggol', '3485', '0,35,3384,3485', '0', '3561', '3561', '0', '0');
INSERT INTO `sx_area` VALUES ('3562', 'Sengkang', '3485', '0,35,3384,3485', '0', '3562', '3562', '0', '0');
INSERT INTO `sx_area` VALUES ('3563', 'Seletar', '3485', '0,35,3384,3485', '0', '3563', '3563', '0', '0');
INSERT INTO `sx_area` VALUES ('3564', 'Yio Chu Kang', '3485', '0,35,3384,3485', '0', '3564', '3564', '0', '0');
INSERT INTO `sx_area` VALUES ('3565', 'Bukit Batok', '3486', '0,35,3384,3486', '0', '3565', '3565', '0', '0');
INSERT INTO `sx_area` VALUES ('3566', 'Choa Chu Kang', '3486', '0,35,3384,3486', '0', '3566', '3566', '0', '0');
INSERT INTO `sx_area` VALUES ('3567', 'Hillview Avenue', '3486', '0,35,3384,3486', '0', '3567', '3567', '0', '0');
INSERT INTO `sx_area` VALUES ('3568', 'Upper Bukit Timah', '3486', '0,35,3384,3486', '0', '3568', '3568', '0', '0');
INSERT INTO `sx_area` VALUES ('3569', 'Kranji', '3486', '0,35,3384,3486', '0', '3569', '3569', '0', '0');
INSERT INTO `sx_area` VALUES ('3570', 'Lim Chu Kang', '3486', '0,35,3384,3486', '0', '3570', '3570', '0', '0');
INSERT INTO `sx_area` VALUES ('3571', 'Sungei Gedong', '3486', '0,35,3384,3486', '0', '3571', '3571', '0', '0');
INSERT INTO `sx_area` VALUES ('3572', 'Tengah', '3486', '0,35,3384,3486', '0', '3572', '3572', '0', '0');
INSERT INTO `sx_area` VALUES ('3573', 'Tagore', '3487', '0,35,3384,3487', '0', '3573', '3573', '0', '0');
INSERT INTO `sx_area` VALUES ('3574', 'Yio Chu Kang', '3487', '0,35,3384,3487', '0', '3574', '3574', '0', '0');
INSERT INTO `sx_area` VALUES ('3575', 'Admiralty', '3487', '0,35,3384,3487', '0', '3575', '3575', '0', '0');
INSERT INTO `sx_area` VALUES ('3576', 'Woodlands', '3487', '0,35,3384,3487', '0', '3576', '3576', '0', '0');
INSERT INTO `sx_area` VALUES ('3577', 'Sembawang', '3487', '0,35,3384,3487', '0', '3577', '3577', '0', '0');
INSERT INTO `sx_area` VALUES ('3578', 'Yishun', '3487', '0,35,3384,3487', '0', '3578', '3578', '0', '0');
INSERT INTO `sx_area` VALUES ('3579', 'Changi', '3488', '0,35,3384,3488', '0', '3579', '3579', '0', '0');
INSERT INTO `sx_area` VALUES ('3580', 'Loyang', '3488', '0,35,3384,3488', '0', '3580', '3580', '0', '0');
INSERT INTO `sx_area` VALUES ('3581', 'Pasir Ris', '3488', '0,35,3384,3488', '0', '3581', '3581', '0', '0');
INSERT INTO `sx_area` VALUES ('3582', 'Simei', '3488', '0,35,3384,3488', '0', '3582', '3582', '0', '0');
INSERT INTO `sx_area` VALUES ('3583', 'Tampines', '3488', '0,35,3384,3488', '0', '3583', '3583', '0', '0');
INSERT INTO `sx_area` VALUES ('3584', 'New England', '3385', '0,35,3385', '1', '3584,3594,3595,3596,3597,3598,3599', '3584', '0', '0');
INSERT INTO `sx_area` VALUES ('3585', 'Middle Atlantic', '3385', '0,35,3385', '1', '3585,3600,3601,3602', '3585', '0', '0');
INSERT INTO `sx_area` VALUES ('3586', 'South Atlantic', '3385', '0,35,3385', '1', '3586,3603,3604,3605,3606,3607,3608,3609,3610,3611', '3586', '0', '0');
INSERT INTO `sx_area` VALUES ('3587', 'EastSouthCentral', '3385', '0,35,3385', '1', '3587,3612,3613,3614,3615', '3587', '0', '0');
INSERT INTO `sx_area` VALUES ('3588', 'WestSouthCentral', '3385', '0,35,3385', '1', '3588,3616,3617,3618,3619', '3588', '0', '0');
INSERT INTO `sx_area` VALUES ('3589', 'EastNorthCentral', '3385', '0,35,3385', '1', '3589,3620,3621,3622,3623,3624', '3589', '0', '0');
INSERT INTO `sx_area` VALUES ('3590', 'WestNorthCentral', '3385', '0,35,3385', '1', '3590,3625,3626,3627,3628,3629,3630,3631', '3590', '0', '0');
INSERT INTO `sx_area` VALUES ('3591', 'Mountain', '3385', '0,35,3385', '1', '3591,3632,3633,3634,3635,3636,3637,3638,3639', '3591', '0', '0');
INSERT INTO `sx_area` VALUES ('3592', 'Pacific', '3385', '0,35,3385', '1', '3592,3640,3641,3642', '3592', '0', '0');
INSERT INTO `sx_area` VALUES ('3593', 'Other', '3385', '0,35,3385', '1', '3593,3643,3644,3645', '3593', '0', '0');
INSERT INTO `sx_area` VALUES ('3594', 'Maine/缅因', '3584', '0,35,3385,3584', '0', '3594', '3594', '0', '0');
INSERT INTO `sx_area` VALUES ('3595', 'Vermont/佛蒙特', '3584', '0,35,3385,3584', '0', '3595', '3595', '0', '0');
INSERT INTO `sx_area` VALUES ('3596', 'New Hampshire/新罕布什尔', '3584', '0,35,3385,3584', '0', '3596', '3596', '0', '0');
INSERT INTO `sx_area` VALUES ('3597', 'Massachusetts/马萨诸塞', '3584', '0,35,3385,3584', '0', '3597', '3597', '0', '0');
INSERT INTO `sx_area` VALUES ('3598', 'Connecticut/康涅狄格', '3584', '0,35,3385,3584', '0', '3598', '3598', '0', '0');
INSERT INTO `sx_area` VALUES ('3599', 'Rhode Island/罗得岛', '3584', '0,35,3385,3584', '0', '3599', '3599', '0', '0');
INSERT INTO `sx_area` VALUES ('3600', 'New York/纽约', '3585', '0,35,3385,3585', '0', '3600', '3600', '0', '0');
INSERT INTO `sx_area` VALUES ('3601', 'Pennsylvania/宾夕法尼亚州', '3585', '0,35,3385,3585', '0', '3601', '3601', '0', '0');
INSERT INTO `sx_area` VALUES ('3602', 'New Jersey/新泽西', '3585', '0,35,3385,3585', '0', '3602', '3602', '0', '0');
INSERT INTO `sx_area` VALUES ('3603', 'Washington D.C./华盛顿特区', '3586', '0,35,3385,3586', '0', '3603', '3603', '0', '0');
INSERT INTO `sx_area` VALUES ('3604', 'Maryland/马里兰', '3586', '0,35,3385,3586', '0', '3604', '3604', '0', '0');
INSERT INTO `sx_area` VALUES ('3605', 'Delaware/特拉华', '3586', '0,35,3385,3586', '0', '3605', '3605', '0', '0');
INSERT INTO `sx_area` VALUES ('3606', 'West Virginia/西弗吉尼亚', '3586', '0,35,3385,3586', '0', '3606', '3606', '0', '0');
INSERT INTO `sx_area` VALUES ('3607', 'Virginia/弗吉尼亚', '3586', '0,35,3385,3586', '0', '3607', '3607', '0', '0');
INSERT INTO `sx_area` VALUES ('3608', 'North Carolina/北卡罗来纳', '3586', '0,35,3385,3586', '0', '3608', '3608', '0', '0');
INSERT INTO `sx_area` VALUES ('3609', 'South Carolina/南卡罗来纳', '3586', '0,35,3385,3586', '0', '3609', '3609', '0', '0');
INSERT INTO `sx_area` VALUES ('3610', 'Georgia/佐治亚', '3586', '0,35,3385,3586', '0', '3610', '3610', '0', '0');
INSERT INTO `sx_area` VALUES ('3611', 'Florida/佛罗里达', '3586', '0,35,3385,3586', '0', '3611', '3611', '0', '0');
INSERT INTO `sx_area` VALUES ('3612', 'Kentucky/肯塔基', '3587', '0,35,3385,3587', '0', '3612', '3612', '0', '0');
INSERT INTO `sx_area` VALUES ('3613', 'Tennessee/田纳西', '3587', '0,35,3385,3587', '0', '3613', '3613', '0', '0');
INSERT INTO `sx_area` VALUES ('3614', 'Alabama/亚拉巴马', '3587', '0,35,3385,3587', '0', '3614', '3614', '0', '0');
INSERT INTO `sx_area` VALUES ('3615', 'Mississippi/密西西比', '3587', '0,35,3385,3587', '0', '3615', '3615', '0', '0');
INSERT INTO `sx_area` VALUES ('3616', 'Arkansas/阿肯色', '3588', '0,35,3385,3588', '0', '3616', '3616', '0', '0');
INSERT INTO `sx_area` VALUES ('3617', 'Oklahoma/俄克拉何马', '3588', '0,35,3385,3588', '0', '3617', '3617', '0', '0');
INSERT INTO `sx_area` VALUES ('3618', 'Louisiana/路易斯安那', '3588', '0,35,3385,3588', '0', '3618', '3618', '0', '0');
INSERT INTO `sx_area` VALUES ('3619', 'Texas/得克萨斯', '3588', '0,35,3385,3588', '0', '3619', '3619', '0', '0');
INSERT INTO `sx_area` VALUES ('3620', 'Michigan/密歇根', '3589', '0,35,3385,3589', '0', '3620', '3620', '0', '0');
INSERT INTO `sx_area` VALUES ('3621', 'Wisconsin/威斯康星', '3589', '0,35,3385,3589', '0', '3621', '3621', '0', '0');
INSERT INTO `sx_area` VALUES ('3622', 'Ohio/俄亥俄', '3589', '0,35,3385,3589', '0', '3622', '3622', '0', '0');
INSERT INTO `sx_area` VALUES ('3623', 'Indiana/印第安纳', '3589', '0,35,3385,3589', '0', '3623', '3623', '0', '0');
INSERT INTO `sx_area` VALUES ('3624', 'Illinois/伊利诺斯', '3589', '0,35,3385,3589', '0', '3624', '3624', '0', '0');
INSERT INTO `sx_area` VALUES ('3625', 'Minnesota/明尼苏达', '3590', '0,35,3385,3590', '0', '3625', '3625', '0', '0');
INSERT INTO `sx_area` VALUES ('3626', 'North Dakota/北达科他', '3590', '0,35,3385,3590', '0', '3626', '3626', '0', '0');
INSERT INTO `sx_area` VALUES ('3627', 'South Dakota/南达科他', '3590', '0,35,3385,3590', '0', '3627', '3627', '0', '0');
INSERT INTO `sx_area` VALUES ('3628', 'Iowa/爱荷华', '3590', '0,35,3385,3590', '0', '3628', '3628', '0', '0');
INSERT INTO `sx_area` VALUES ('3629', 'Nebraska/内布拉斯加', '3590', '0,35,3385,3590', '0', '3629', '3629', '0', '0');
INSERT INTO `sx_area` VALUES ('3630', 'Missouri/密苏里', '3590', '0,35,3385,3590', '0', '3630', '3630', '0', '0');
INSERT INTO `sx_area` VALUES ('3631', 'Kansas/堪萨斯', '3590', '0,35,3385,3590', '0', '3631', '3631', '0', '0');
INSERT INTO `sx_area` VALUES ('3632', 'Montana/蒙大拿', '3591', '0,35,3385,3591', '0', '3632', '3632', '0', '0');
INSERT INTO `sx_area` VALUES ('3633', 'Idaho/爱达荷', '3591', '0,35,3385,3591', '0', '3633', '3633', '0', '0');
INSERT INTO `sx_area` VALUES ('3634', 'Wyoming/怀俄明', '3591', '0,35,3385,3591', '0', '3634', '3634', '0', '0');
INSERT INTO `sx_area` VALUES ('3635', 'Nevada/内华达', '3591', '0,35,3385,3591', '0', '3635', '3635', '0', '0');
INSERT INTO `sx_area` VALUES ('3636', 'Colorado/科罗拉多', '3591', '0,35,3385,3591', '0', '3636', '3636', '0', '0');
INSERT INTO `sx_area` VALUES ('3637', 'Utah/犹他', '3591', '0,35,3385,3591', '0', '3637', '3637', '0', '0');
INSERT INTO `sx_area` VALUES ('3638', 'New Mexico/新墨西哥', '3591', '0,35,3385,3591', '0', '3638', '3638', '0', '0');
INSERT INTO `sx_area` VALUES ('3639', 'Arizona/亚利桑那', '3591', '0,35,3385,3591', '0', '3639', '3639', '0', '0');
INSERT INTO `sx_area` VALUES ('3640', 'Washington/华盛顿', '3592', '0,35,3385,3592', '0', '3640', '3640', '0', '0');
INSERT INTO `sx_area` VALUES ('3641', 'Oregon/俄勒冈', '3592', '0,35,3385,3592', '0', '3641', '3641', '0', '0');
INSERT INTO `sx_area` VALUES ('3642', 'California/加利福尼亚', '3592', '0,35,3385,3592', '0', '3642', '3642', '0', '0');
INSERT INTO `sx_area` VALUES ('3643', 'Alaska/阿拉斯加', '3593', '0,35,3385,3593', '0', '3643', '3643', '0', '0');
INSERT INTO `sx_area` VALUES ('3644', 'Hawaii/夏威夷', '3593', '0,35,3385,3593', '0', '3644', '3644', '0', '0');
INSERT INTO `sx_area` VALUES ('3645', 'Others', '3593', '0,35,3385,3593', '0', '3645', '3645', '0', '0');
INSERT INTO `sx_article_21` VALUES ('1', '22', '0', '1', 'fsdfafaf', '', '0', '', '范德萨发撒旦法师打发发的方法打算范德萨发发大发大水发的说法多少法师打发的飞洒发第三方的', '', 'fsdfafaf,整站新闻', '', '', '', '', '', '24', 'http://shixun.com/file/upload/201602/29/150402450.jpg', '', '1456795791', '', '1456795820', '127.0.0.1', '', '3', '0', 'show.php?itemid=1', '', '', '0', '0', '0');
INSERT INTO `sx_article_21` VALUES ('2', '22', '0', '2', '防辐射大范德萨范德萨发放大方大师', '', '0', '', '防辐射大范德萨范德萨发放大方大师防辐射大范德萨范德萨发放大方大师防辐射大范德萨范德萨发放大方大师防辐射大范德萨范德萨发放', '', '防辐射大范德萨范德萨发放大方大师,整站新闻', '', '', '', '', '', '29', '', '', '1456795820', '', '1456795833', '127.0.0.1', '', '3', '0', 'show.php?itemid=2', '', '', '0', '0', '0');
INSERT INTO `sx_article_21` VALUES ('3', '22', '0', '3', '个说法刚到法国', '', '0', '', '范德萨范德萨发的萨芬打发发大水发撒旦发的是范德萨发第三方', '', '个说法刚到法国,整站新闻', '', '', '', '', '', '16', '', '', '1456795833', '', '1456795847', '127.0.0.1', '', '3', '0', 'show.php?itemid=3', '', '', '0', '0', '0');
INSERT INTO `sx_article_21` VALUES ('4', '22', '0', '3', '法撒旦法师打发大师法第三方', '', '0', '', '的飞洒地方', '', '法撒旦法师打发大师法第三方,整站新闻', '', '', '', '', '', '13', 'http://shixun.com/file/upload/201602/29/150402450.jpg', '', '1456795847', '', '1456795881', '127.0.0.1', '', '3', '0', 'show.php?itemid=4', '', '', '0', '0', '0');
INSERT INTO `sx_article_21` VALUES ('5', '22', '0', '4', '发生的发生过会很反感萨发放大方大师', '', '0', '', '放荡少妇撒的发生的法师打发斯蒂芬', '', '发生的发生过会很反感萨发放大方大师,整站新闻', '', '', '', '', '', '11', '', '', '1456795881', '', '1456795892', '127.0.0.1', '', '3', '0', 'show.php?itemid=5', '', '', '0', '0', '0');
INSERT INTO `sx_article_21` VALUES ('6', '22', '0', '5', '大房间号怀集怀集股份及附件', '', '0', '', '合格后方第三个的故事个梵蒂冈', '', '大房间号怀集怀集股份及附件,整站新闻', '', '', '', '', '', '11', '', '', '1456795892', '', '1456795905', '127.0.0.1', '', '3', '0', 'show.php?itemid=6', '', '', '0', '0', '0');
INSERT INTO `sx_article_21` VALUES ('7', '22', '0', '5', 'dsafdsfdsaf', '', '0', '', 'fadsfdsafdsfdsfaf', '', 'dsafdsfdsaf,整站新闻', '', '', '', '', '', '30', '', '', '1456926472', '', '1456926480', '127.0.0.1', '', '3', '0', 'show.php?itemid=7', '', '', '0', '0', '0');
INSERT INTO `sx_article_21` VALUES ('8', '22', '0', '0', 'fsfa', '', '0', '', 'fdsafdsfsdfasf', '', 'fsfa,整站新闻', '', '', '', '', '', '10', 'http://shixun.com/file/upload/201602/26/223712240.jpg', 'shixun', '1457960311', 'shixun', '1457960311', '127.0.0.1', '0', '3', '0', 'show.php?itemid=8', '', '', '0', '0', '0');
INSERT INTO `sx_article_21` VALUES ('9', '22', '0', '0', 'fdaff', '', '0', '', 'fasfdasfsafas', '', '', '', '', '', '', '', '11', 'http://shixun.com/file/upload/201602/24/223047680.jpg', '', '1457960434', '', '1457960434', '', '0', '3', '0', '', '', '', '0', '0', '0');
INSERT INTO `sx_article_21` VALUES ('10', '0', '0', '0', '', '', '0', '', '', '', '', '', '', '', '', '', '0', '', '', '0', '', '0', '', '0', '0', '0', '', '', '', '0', '0', '0');
INSERT INTO `sx_article_21` VALUES ('14', '22', '0', '0', '1234561', '', '0', '', ' fdsfadsfa', '', '', '', '', '', '', '', '13', 'http://shixun.com/file/upload/201603/07/2129346710.jpg', '', '1457963327', '', '1457963327', '', '0', '3', '0', '', '', '', '0', '0', '0');
INSERT INTO `sx_article_21` VALUES ('15', '22', '0', '0', '1246512', '', '0', '', 'fdfdsfdsaf', '', '', '', '', '', '', '', '15', 'http://shixun.com/file/upload/201603/07/2118558910.jpg', '', '1457964999', '', '1458192129', '', '0', '3', '0', '', '', '', '0', '0', '0');
INSERT INTO `sx_article_21` VALUES ('16', '22', '0', '0', '123456', '', '0', '', 'fdasf', '', '', '', '', '', '', '', '14', 'http://shixun.com/file/upload/201603/08/1443462010.jpg', '', '1458179174', '', '1458192129', '', '0', '3', '0', '', '', '', '0', '1', '0');
INSERT INTO `sx_article_21` VALUES ('17', '22', '0', '0', '1564', '', '0', '', ' fdfadsfdsaf', '', '', '', '', '', '', '', '12', 'http://shixun.com/file/upload/201603/08/1447199410.jpg', '', '1458183862', 'shixun', '1458192135', '', '0', '3', '0', '', '', '', '0', '1', '0');
INSERT INTO `sx_article_21` VALUES ('18', '22', '0', '0', '1234556454', '', '0', '', ' fdsfasfa', '', '', '', '', '', '', '', '13', 'http://shixun.com/file/upload/201603/08/1447199410.jpg', '', '1458191718', 'shixun', '1458191871', '', '0', '3', '0', '', '', '', '0', '1', '0');
INSERT INTO `sx_article_21` VALUES ('19', '22', '0', '0', '456456', '', '0', '', ' fadsfadsf', '', '', '', '', '', '', '', '54', 'http://shixun.com/file/upload/201603/08/1443462010.jpg', '', '1458191906', 'shixun', '1458191917', '', '0', '3', '0', '', '', '', '0', '1', '0');
INSERT INTO `sx_article_21` VALUES ('20', '22', '0', '0', 'adfasdf', '', '0', '', ' fsadfasdf', '', '', '', '', '', '', '', '29', 'http://shixun.com/file/upload/201603/08/1443462010.jpg', '', '1458191965', 'shixun', '1458191965', '', '0', '3', '0', '', '', '', '0', '1', '0');
INSERT INTO `sx_article_21` VALUES ('25', '22', '0', '0', '1564516', '', '0', '', ' 发的是法师法', '', '', '', '', '', '', '', '0', 'http://shixun.com/file/upload/201604/05/151024961.png', '', '1459840225', '', '1459840225', '', '0', '1', '0', '', '', '', '0', '1', '0');
INSERT INTO `sx_article_21` VALUES ('27', '22', '0', '0', 'fdfa', '', '0', '', 'fadsfdsafasdf', '', 'faf', '', '', '', '', '', '9', 'http://zhongning.com/file/upload/201604/18/110724730.jpg', '', '1460948848', '', '1461304941', '', '0', '3', '0', '', '', '', '0', '0', '0');
INSERT INTO `sx_article_data_21` VALUES ('1', '范德萨发撒旦法师打发发的方法打算范德萨发发大发大水发的说法多少法师打发的飞洒发第三方的');
INSERT INTO `sx_article_data_21` VALUES ('2', '&nbsp;防辐射大范德萨范德萨发放大方大师防辐射大范德萨范德萨发放大方大师防辐射大范德萨范德萨发放大方大师防辐射大范德萨范德萨发放大方大师');
INSERT INTO `sx_article_data_21` VALUES ('3', '&nbsp;范德萨范德萨发的萨芬打发发大水发撒旦发的是范德萨发第三方');
INSERT INTO `sx_article_data_21` VALUES ('4', '的飞洒地方');
INSERT INTO `sx_article_data_21` VALUES ('5', '&nbsp;放荡少妇撒的发生的法师打发斯蒂芬');
INSERT INTO `sx_article_data_21` VALUES ('6', '&nbsp;合格后方第三个的故事个梵蒂冈');
INSERT INTO `sx_article_data_21` VALUES ('7', '&nbsp;fadsfdsafdsfdsfaf');
INSERT INTO `sx_article_data_21` VALUES ('8', '&nbsp;fdsafdsfsdfasf');
INSERT INTO `sx_article_data_21` VALUES ('9', '&nbsp;fasfdasfsafas');
INSERT INTO `sx_article_data_21` VALUES ('10', '');
INSERT INTO `sx_article_data_21` VALUES ('14', ' fdsfadsfa');
INSERT INTO `sx_article_data_21` VALUES ('15', '&nbsp;fdfdsfdsaf');
INSERT INTO `sx_article_data_21` VALUES ('16', '&nbsp;fdasf');
INSERT INTO `sx_article_data_21` VALUES ('17', ' fdfadsfdsaf');
INSERT INTO `sx_article_data_21` VALUES ('18', '&nbsp;fdsfasfa');
INSERT INTO `sx_article_data_21` VALUES ('19', '&nbsp;fadsfadsf');
INSERT INTO `sx_article_data_21` VALUES ('20', ' fsadfasdf');
INSERT INTO `sx_article_data_21` VALUES ('25', ' 发的是法师法');
INSERT INTO `sx_article_data_21` VALUES ('27', '&nbsp;fadsfdsafasdf');
INSERT INTO `sx_article_keyword` VALUES ('2', '1', '27');
INSERT INTO `sx_article_keyword` VALUES ('3', '2', '27');
INSERT INTO `sx_article_keyword` VALUES ('4', '3', '27');
INSERT INTO `sx_article_keyword` VALUES ('5', '4', '27');
INSERT INTO `sx_article_keyword` VALUES ('6', '整站新闻', '16');
INSERT INTO `sx_article_keyword` VALUES ('7', 'faf', '1');
INSERT INTO `sx_article_keyword` VALUES ('8', 'dsafdsfdsaf,整站新闻', '1');
INSERT INTO `sx_article_keyword` VALUES ('9', '个说法刚到法国,整站新闻', '1');
INSERT INTO `sx_article_keyword` VALUES ('10', 'fsfa,整站新闻', '1');
INSERT INTO `sx_article_keyword` VALUES ('11', 'fsdfafaf,整站新闻', '1');
INSERT INTO `sx_article_keyword` VALUES ('12', '大房间号怀集怀集股份及附件,整站新闻', '1');
INSERT INTO `sx_article_keyword` VALUES ('13', '法撒旦法师打发大师法第三方,整站新闻', '1');
INSERT INTO `sx_article_keyword` VALUES ('14', '防辐射大范德萨范德萨发放大方大师,整站新闻', '1');
INSERT INTO `sx_article_keyword` VALUES ('15', '发生的发生过会很反感萨发放大方大师,整站新闻', '1');
INSERT INTO `sx_brand_13` VALUES ('2', '0', '0', '最新投资100万元', '', '0', '', '', '17', '', '', '', '0', '1461227067', '0000-00-00', '0', '0', '', '0', '0', '', '', '', '', '', '', '', '', '', '', '大师傅十大范德萨发大水发撒旦撒旦a', '', '1461227145', '0000-00-00', '', '0', '3', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `sx_brand_13` VALUES ('3', '0', '0', 'fasdfasdgffdsaf sadf范德萨发的撒打发打发阿萨德发', '', '0', '', '', '4', '', '', '', '0', '1461394646', '0000-00-00', '0', '0', '', '0', '0', '', '', '', '', '', '', '', '', '', '', '范德萨发撒的发的撒飞洒地方发发发阿萨德发as', '', '1461394646', '0000-00-00', '', '0', '3', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `sx_brand_13` VALUES ('4', '0', '0', '发生的ff 啥地方萨芬撒打发十大发是打发的打发暗示法第三发生的放大啥第三方发', '', '0', '', '', '11', '', '', '', '0', '1461394658', '0000-00-00', '0', '0', '', '0', '0', '', '', '', '', '', '', '', '', '', '', '发是打发萨芬啥地方爱上的方法送达方式发萨芬是发达撒飞洒发发的萨芬asf 发是打发萨芬啥地方爱上的方法送达方式发萨芬是发达撒飞洒发发的萨芬asf 发是打发萨芬啥地方爱上的方法送达方式发萨芬是发达撒飞洒发发的萨芬asf 发是打发萨芬啥地方爱上的方法送达方式发萨芬是发达撒飞洒发发的萨芬asf 发是打发萨芬啥地方爱上的方法送达方式发萨芬是发达撒飞洒发发的萨芬asf 发是打发萨芬啥地方爱上的方法送达方式发萨芬是发达撒飞洒发发的萨芬asf', '', '1461394958', '0000-00-00', '', '0', '3', '', '', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `sx_brand_data_13` VALUES ('2', '最新投资100万元最新投资100万元最新投资100万元最新投资100万元最新投资100万元');
INSERT INTO `sx_brand_data_13` VALUES ('3', '&nbsp;范德萨发撒的发的撒飞洒地方发发发阿萨德发as');
INSERT INTO `sx_brand_data_13` VALUES ('4', '&nbsp;发是打发萨芬啥地方爱上的方法送达方式发萨芬是发达撒飞洒发发的萨芬asf');
INSERT INTO `sx_brand_data_13` VALUES ('5', '&nbsp;<a href=\"\" target=\"_blank\" title=\"\" style=\"margin: 0px; padding: 0px; border: 0px; font-family: 微软雅黑, Tahoma, Lucida, Verdana, Arial, 宋体, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 27px; text-decoration: none; color: rgb(51, 51, 51);\">蘑菇街美丽说合并却</a>');
INSERT INTO `sx_brand_data_13` VALUES ('6', '&nbsp;<a href=\"\" target=\"_blank\" title=\"\" style=\"margin: 0px; padding: 0px; border: 0px; font-family: 微软雅黑, Tahoma, Lucida, Verdana, Arial, 宋体, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 27px; text-decoration: none; color: rgb(51, 51, 51);\">蘑菇街美丽说合并却</a>');
INSERT INTO `sx_brand_data_13` VALUES ('7', '&nbsp;发的发撒旦飞洒地方');
INSERT INTO `sx_brand_data_13` VALUES ('8', '&nbsp;fdsfasdffasfdsafs');
INSERT INTO `sx_brand_data_13` VALUES ('10', '&nbsp;fdsfsffasf发的发生发生发的');
INSERT INTO `sx_brand_data_13` VALUES ('11', ' 范德萨发生大法师的发售方式');
INSERT INTO `sx_brand_data_13` VALUES ('12', '&nbsp;fdsfadsf');
INSERT INTO `sx_brand_data_13` VALUES ('13', ' jkl;l;kl;mmjjlkkljlkj');
INSERT INTO `sx_brand_data_13` VALUES ('14', '&nbsp;jkl;l;kl;mmjjlkkljlkj');
INSERT INTO `sx_brand_data_13` VALUES ('15', '&nbsp;jkl;l;kl;mmjjlkkljlkj');
INSERT INTO `sx_brand_data_13` VALUES ('16', ' ');
INSERT INTO `sx_brand_data_13` VALUES ('17', ' fdfadf');
INSERT INTO `sx_brand_data_13` VALUES ('18', ' fadsfas');
INSERT INTO `sx_brand_data_13` VALUES ('19', '&nbsp;fsdafsdf法师打发大法撒旦法师打发十大范德萨法师打发放到法师打发');
INSERT INTO `sx_buy_6` VALUES ('31', '0', '宋薇', '', '50000', '0', '18709566668', '1461568895', '0000-00-00', '1461568895', '0000-00-00', '2', '25', '0', '1年', '20', '0');
INSERT INTO `sx_buy_6` VALUES ('32', '0', '宋薇', '', '50000', '0', '18709566668', '1461570312', '0000-00-00', '1461570312', '0000-00-00', '2', '25', '0', '1年', '20', '1');
INSERT INTO `sx_buy_6` VALUES ('33', '0', '海云台', '', '302000', '0', '15915752744', '1461895931', '0000-00-00', '1461895931', '0000-00-00', '2', '33', '0', '5年', '20', '0');
INSERT INTO `sx_buy_6` VALUES ('34', '0', '海云台', '', '30000', '0', '15360401151', '1461895977', '0000-00-00', '1461895977', '0000-00-00', '2', '33', '0', '5年', '20', '0');
INSERT INTO `sx_buy_6` VALUES ('35', '0', '竽在', '', '30000', '0', '15915752744', '1461919422', '0000-00-00', '1461919422', '0000-00-00', '2', '33', '0', '5年', '20', '0');
INSERT INTO `sx_buy_log` VALUES ('1', '发生地方萨芬法师打发沙发aaaa斯蒂爱的是飞洒的范范芬范德萨发', '1461458648', '30');
INSERT INTO `sx_buy_log` VALUES ('3', 'fsadfasfsfsd', '1461458710', '30');
INSERT INTO `sx_buy_log` VALUES ('4', 'fdasdsgdsgadsg ', '1461458712', '30');
INSERT INTO `sx_buy_log` VALUES ('5', 'gagsddasgs', '1461458714', '30');
INSERT INTO `sx_cache` VALUES ('d68dc58da105adb8137f8f4b047eb9c6', '1462087154');
INSERT INTO `sx_category` VALUES ('2', '6', '求购默认分类', '', '1', 'list.php?catid=2', '', '1', '0', '0', '0', '0', '0', '', '1', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('3', '4', '公司默认分类', '', '1', 'list.php?catid=3', '', '1', '0', '0', '0', '0', '0', '', '1', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('4', '23', '禽类', '', '4', 'list.php?catid=4', '', '1', '0', '0', '0', '0', '1', '4,23', '4', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('5', '23', '冻品', '', '5', 'list.php?catid=5', '', '1', '0', '0', '0', '0', '0', '5', '5', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('6', '23', '蔬菜水产', '', 'shucaishuichan', 'list.php?catid=6', 's', '1', '0', '0', '0', '0', '0', '6', '6', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('7', '23', '干货', '', 'ganhuo', 'list.php?catid=7', 'g', '1', '0', '0', '0', '0', '0', '7', '7', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('8', '23', '杂粮调料', '', 'zaliangdiaoliao', 'list.php?catid=8', 'z', '1', '0', '0', '0', '0', '0', '8', '8', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('9', '23', '饮品', '', 'yinpin', 'list.php?catid=9', 'y', '1', '0', '0', '0', '0', '0', '9', '9', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('10', '23', '野味茶叶', '', 'yeweichaye', 'list.php?catid=10', 'y', '1', '0', '0', '0', '0', '0', '10', '10', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('11', '23', '菌类', '', 'junlei', 'list.php?catid=11', 'j', '1', '0', '0', '0', '0', '0', '11', '11', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('12', '23', '厨具', '', 'chuju', 'list.php?catid=12', 'c', '1', '0', '0', '0', '0', '0', '12', '12', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('13', '23', '餐具', '', 'canju', 'list.php?catid=13', 'c', '1', '0', '0', '0', '0', '0', '13', '13', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('14', '23', '广告', '', 'guanggao', 'list.php?catid=14', 'g', '1', '0', '0', '0', '0', '0', '14', '14', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('15', '23', '印刷装修', '', 'yinshuazhuangxiu', 'list.php?catid=15', 'y', '1', '0', '0', '0', '0', '0', '15', '15', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('16', '23', '菜谱', '', 'caipu', 'list.php?catid=16', 'c', '1', '0', '0', '0', '0', '0', '16', '16', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('17', '23', '设备合作', '', 'shebeihezuo', 'list.php?catid=17', 's', '1', '0', '0', '0', '0', '0', '17', '17', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('18', '23', '其他', '', 'qita', 'list.php?catid=18', 'q', '1', '0', '0', '0', '0', '0', '18', '18', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('22', '21', '整站新闻', '', 'zhengzhanxinwen', 'list.php?catid=22', 'z', '1', '0', '0', '0', '0', '0', '22', '22', '', '', '', '', '', '', '', '', '1', '1');
INSERT INTO `sx_category` VALUES ('23', '23', '鸡肉', '', 'jirou', 'list.php?catid=23', 'j', '1', '0', '0', '4', '0,4', '0', '23', '23', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('24', '13', '粤菜', '', '24', 'list.php?catid=24', '', '1', '0', '0', '0', '0', '0', '24', '24', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('25', '13', '湘菜', '', '25', 'list.php?catid=25', '', '1', '0', '0', '0', '0', '0', '25', '25', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('26', '13', '韩国菜', '', '26', 'list.php?catid=26', '', '1', '0', '0', '0', '0', '0', '26', '26', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('27', '13', '云南菜', '', '27', 'list.php?catid=27', '', '1', '0', '0', '0', '0', '0', '27', '27', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('28', '9', '厨师', '', '28', 'list.php?catid=28', '', '1', '0', '0', '0', '0', '0', '28', '28', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('29', '9', '砧板', '', '29', 'list.php?catid=29', '', '1', '0', '0', '0', '0', '0', '29', '29', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_category` VALUES ('30', '9', '洗完工', '', '30', 'list.php?catid=30', '', '1', '0', '0', '0', '0', '0', '30', '30', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `sx_city` VALUES ('254', '桂林', 'guilin', '', '', '', 'g', '0', '', '', '', '');
INSERT INTO `sx_city` VALUES ('233', '深圳', 'shenzhen', '', '', '', 's', '0', '', '', '', '');
INSERT INTO `sx_city` VALUES ('231', '广州', 'guangzhou', '', '', '', 'g', '0', '', '', '', '');
INSERT INTO `sx_city` VALUES ('2244', '南宁', 'nanning', '', '', '', 'n', '0', '', '', '', '');
INSERT INTO `sx_comment` VALUES ('1', '0', '0', '', '', '0', '范德萨的飞洒范德萨发', '0', '', '', '', '0', '1456988378', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '1', '1', '2');
INSERT INTO `sx_comment` VALUES ('2', '0', '0', '', '', '0', 'fdasfasfdasf范德萨发发是打发', '0', '', '', '', '0', '1456988401', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '1', '1', '2');
INSERT INTO `sx_comment` VALUES ('3', '0', '0', '', '', '0', '我来评论一下', '0', '', '', '', '0', '1456989182', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '1', '1', '2');
INSERT INTO `sx_comment` VALUES ('4', '0', '0', '', '', '0', '发的范德萨发打发', '0', '', '', '', '0', '1456989292', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '1', '1', '2');
INSERT INTO `sx_comment` VALUES ('5', '0', '0', '', '', '0', '的司法撒旦发发', '0', '', '', '', '0', '1456989346', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '1', '1', '2');
INSERT INTO `sx_comment` VALUES ('6', '0', '0', '', '', '0', '方法的范德萨发三分', '0', '', '', '', '0', '1456994686', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '1', '2', '1');
INSERT INTO `sx_comment` VALUES ('7', '0', '0', '', '', '0', 'fafafafaf', '0', '', '', '', '0', '1456994768', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '1', '2', '1');
INSERT INTO `sx_comment` VALUES ('8', '0', '0', '', '', '0', 'fdsfdsafasdf', '0', '', '', '', '0', '1456994936', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '1', '3', '5');
INSERT INTO `sx_comment` VALUES ('9', '0', '0', '', '', '0', 'fdfadsfdasfaf放大法', '0', '', '', '', '0', '1456995136', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '1', '4', '3');
INSERT INTO `sx_comment` VALUES ('10', '0', '0', '', '', '0', '发的是法师打发', '0', '', '', '', '0', '1456995348', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '1', '5', '3');
INSERT INTO `sx_comment` VALUES ('11', '0', '0', '', '', '0', '发生的发范德萨发三分', '0', '', '', '', '0', '1456995759', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '1', '6', '1');
INSERT INTO `sx_comment` VALUES ('12', '0', '0', '', '', '0', '地方的萨芬撒发撒的发多少', '0', '', '', '', '0', '1456996231', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '1', '7', '2');
INSERT INTO `sx_comment` VALUES ('13', '0', '0', '', '', '0', 'DSFASF', '0', '', '', '', '0', '1458266030', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '16', '2', '5');
INSERT INTO `sx_comment` VALUES ('14', '0', '0', '', '', '0', 'FDSAFASF', '0', '', '', '', '0', '1458266057', '', '', '', '0', '0', '0', '0', '127.0.0.1', '2', '16', '3', '7');
INSERT INTO `sx_comment` VALUES ('15', '0', '0', '', '', '0', 'fdasf', '0', '', '', '', '0', '1458268006', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '16', '5', '23');
INSERT INTO `sx_comment` VALUES ('16', '0', '0', '', '', '0', 'fdsafasfa', '0', '', '', '', '0', '1458268172', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '16', '5', '16');
INSERT INTO `sx_comment` VALUES ('17', '0', '0', '', '', '0', '发生大发发', '0', '', '', '', '0', '1458268670', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '16', '5', '25');
INSERT INTO `sx_comment` VALUES ('18', '0', '0', '', '', '0', '花洒粉红色的复合函数', '0', '', '', '', '0', '1458280156', '', '', '', '0', '0', '0', '0', '127.0.0.1', '3', '16', '5', '23');
INSERT INTO `sx_company` VALUES ('1', 'DESTOON B2B网站管理系统', '110', '0', '0', '0', '', '0');
INSERT INTO `sx_company_data` VALUES ('1', '');
INSERT INTO `sx_company_data` VALUES ('2', '&nbsp;');
INSERT INTO `sx_company_data` VALUES ('8', '');
INSERT INTO `sx_cron` VALUES ('1', '更新在线状态', '1', 'online', '10', '1462084934', '1462085534', '0', '');
INSERT INTO `sx_cron` VALUES ('2', '内容分表创建', '1', 'split', '0,0', '1462078383', '1462118400', '0', '');
INSERT INTO `sx_cron` VALUES ('3', '清理过期文件缓存', '0', 'cache', '30', '1462084934', '1462086734', '0', '');
INSERT INTO `sx_cron` VALUES ('20', '清理过期禁止IP', '0', 'banip', '0,10', '1462078383', '1462119000', '0', '');
INSERT INTO `sx_cron` VALUES ('21', '清理系统临时文件', '0', 'temp', '0,20', '1462078383', '1462119600', '0', '');
INSERT INTO `sx_cron` VALUES ('40', '清理3天前未付款充值记录', '0', 'charge', '1,0', '1462078383', '1462122000', '0', '');
INSERT INTO `sx_cron` VALUES ('41', '清理30天前404日志', '0', '404', '1,10', '1462078383', '1462122600', '0', '');
INSERT INTO `sx_cron` VALUES ('42', '清理30天前登录日志', '0', 'loginlog', '1,20', '1462078383', '1462123200', '0', '');
INSERT INTO `sx_cron` VALUES ('43', '清理30天前管理日志', '0', 'adminlog', '1,30', '1462078383', '1462123800', '0', '');
INSERT INTO `sx_cron` VALUES ('44', '清理30天前站内交谈', '0', 'chat', '1,40', '1462078383', '1462124400', '0', '');
INSERT INTO `sx_cron` VALUES ('60', '清理90天前已读信件', '0', 'message', '2,0', '0', '0', '1', '');
INSERT INTO `sx_cron` VALUES ('61', '清理90天前资金流水', '0', 'money', '2,10', '0', '0', '1', '');
INSERT INTO `sx_cron` VALUES ('62', '清理90天前积分流水', '0', 'credit', '2,20', '0', '0', '1', '');
INSERT INTO `sx_cron` VALUES ('63', '清理90天前短信流水', '0', 'sms', '2,30', '0', '0', '1', '');
INSERT INTO `sx_cron` VALUES ('64', '清理90天前短信记录', '0', 'smssend', '2,40', '0', '0', '1', '');
INSERT INTO `sx_cron` VALUES ('65', '清理90天前邮件记录', '0', 'maillog', '2,50', '0', '0', '1', '');
INSERT INTO `sx_email` VALUES ('1', 'fdsfadas', '694538309@qq.com', '1457663421', '127.0.0.1', '5', '5', '14e1b600b1fd579f47433b88e8d85291', '', '1457922621');
INSERT INTO `sx_email` VALUES ('2', 'fdsfa', '694538309@qq.com', '1457663816', '127.0.0.1', '5', '5', '14e1b600b1fd579f47433b88e8d85291', '', '1457923016');
INSERT INTO `sx_email` VALUES ('3', '6f45', '694538309@qq.com', '1457664307', '127.0.0.1', '5', '5', '14e1b600b1fd579f47433b88e8d85291', '', '1457923507');
INSERT INTO `sx_email` VALUES ('4', 'fdaf', '694538309@qq.com', '1457664383', '127.0.0.1', '5', '5', '14e1b600b1fd579f47433b88e8d85291', '', '1457923583');
INSERT INTO `sx_email` VALUES ('5', 'fasdf', '694538309@qq.com', '1457664631', '127.0.0.1', '5', '5', '14e1b600b1fd579f47433b88e8d85291', '', '1457923831');
INSERT INTO `sx_email` VALUES ('6', 'dfsf', '694538309@qq.com', '1457664660', '127.0.0.1', '5', '5', '14e1b600b1fd579f47433b88e8d85291', '', '1457923860');
INSERT INTO `sx_email` VALUES ('7', 'fdsaf', '694538309@qq.com', '1457664708', '127.0.0.1', '5', '5', '14e1b600b1fd579f47433b88e8d85291', '', '1457923908');
INSERT INTO `sx_email` VALUES ('8', 'fdsfa', '694538309@qq.com', '1457664776', '127.0.0.1', '5', '5', '14e1b600b1fd579f47433b88e8d85291', '', '1457923976');
INSERT INTO `sx_email` VALUES ('9', 'fdasf', '694538309@qq.com', '1457664864', '127.0.0.1', '5', '5', '14e1b600b1fd579f47433b88e8d85291', '', '1457924064');
INSERT INTO `sx_email` VALUES ('10', 'fsdafa', '694538309@qq.com', '1457664994', '127.0.0.1', '5', '5', '14e1b600b1fd579f47433b88e8d85291', '', '1457924194');
INSERT INTO `sx_email` VALUES ('11', 'fadfa', '694538309@qq.com', '1457666453', '127.0.0.1', '5', '5', '14e1b600b1fd579f47433b88e8d85291', '0037E72D2F8A14038E4ED2C5A44AA3DE', '1457925653');
INSERT INTO `sx_email` VALUES ('12', 'fadfafd', '694538309@qq.com', '1457666566', '127.0.0.1', '5', '5', '14e1b600b1fd579f47433b88e8d85291', '6D057C75E4CC40F41BACC56A6739AFE0', '1457925766');
INSERT INTO `sx_exhibit` VALUES ('1', '0', '0', '0', '发的是法师法', '', '0', '法撒旦法第三方a', '发的是法师法,,,', '', '2', '0', '', '', '1461653499', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '发大水发a', '0', '', '1461653499', '', '0', '3', 'show.php?itemid=1', '', '');
INSERT INTO `sx_exhibit` VALUES ('2', '0', '0', '0', 'fsddfasdfadsf', '', '0', 'gsdgaggsagas', 'fsddfasdfadsf,,,', '', '0', '0', '', '', '1461900564', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'fdsfsadfsafsadfd', '0', '', '1461900564', '', '0', '3', 'show.php?itemid=2', '', '');
INSERT INTO `sx_exhibit_data` VALUES ('1', '&nbsp;法撒旦法第三方a');
INSERT INTO `sx_exhibit_data` VALUES ('2', '&nbsp;gsdgaggsagas');
INSERT INTO `sx_finance_credit` VALUES ('1', 'admin', '1', '1', '1453554127', '登录奖励', '127.0.0.1', 'system');
INSERT INTO `sx_finance_credit` VALUES ('2', 'admin', '1', '2', '1453625037', '登录奖励', '127.0.0.1', 'system');
INSERT INTO `sx_finance_credit` VALUES ('3', 'admin', '1', '3', '1453700261', '登录奖励', '127.0.0.1', 'system');
INSERT INTO `sx_finance_credit` VALUES ('4', '123658', '20', '20', '1453700818', '注册奖励', '127.0.0.1', 'system');
INSERT INTO `sx_finance_credit` VALUES ('5', 'admin', '1', '4', '1453788132', '登录奖励', '127.0.0.1', 'system');
INSERT INTO `sx_finance_credit` VALUES ('6', 'admin', '1', '5', '1453876881', '登录奖励', '127.0.0.1', 'system');
INSERT INTO `sx_finance_credit` VALUES ('7', 'admin', '1', '6', '1453948325', '登录奖励', '127.0.0.1', 'system');
INSERT INTO `sx_food_23` VALUES ('57', '六月红枸杞制品有限公司', '1000000', '0', '0', '1461569257', '1461569257', '2', '25', '0', '用于扩大经营规模', '18709566668', '中宁县', '1年', '有');
INSERT INTO `sx_food_23` VALUES ('58', '宁夏六月红有限公司', '1000000', '0', '0', '1461570744', '1461570744', '2', '25', '0', '用于扩大经营', '18709566668', '中宁县', '1年', '有');
INSERT INTO `sx_food_23` VALUES ('59', 'dsadsafdsa', '5000000', '0', '0', '1461924019', '1461924019', '2', '33', '0', '魂牵梦萦反攻倒算', '15915752744', 'dsagdsa', '5年', '无');
INSERT INTO `sx_food_23` VALUES ('60', '继续', '4466443', '0', '0', '1462083707', '1462083707', '2', '31', '0', '坚持坚持你', '18707587890', '455', '786', '5655');
INSERT INTO `sx_food_23` VALUES ('61', '94494', '4451816', '0', '0', '1462084825', '1462084825', '2', '31', '0', '55589', '18707587890', '好像：', '485', '555');
INSERT INTO `sx_food_23` VALUES ('62', '_百草哪方面', '645458', '0', '0', '1462085100', '1462085100', '2', '31', '0', '48899464', '18707587890', '54646', '6546', '46645');
INSERT INTO `sx_food_23` VALUES ('63', '经济', '645856', '0', '0', '1462085193', '1462085193', '2', '31', '0', '565565', '18707587890', '45', '5554', '865');
INSERT INTO `sx_food_23` VALUES ('64', '成不成交', '558496', '0', '0', '1462085333', '1462085333', '2', '31', '0', '85558', '18707587890', '几点到家', '555', '855');
INSERT INTO `sx_food_23` VALUES ('65', '你想不想', '4894949', '0', '0', '1462085371', '1462085371', '2', '31', '0', '45555', '18707587890', '结婚的', '464', '6464');
INSERT INTO `sx_food_23` VALUES ('66', '7！', '584555', '0', '0', '1462085463', '1462085463', '2', '31', '0', '64864', '18707587890', '555', '555', '55');
INSERT INTO `sx_food_23` VALUES ('67', '好的&好', '545466', '0', '0', '1462085786', '1462085786', '2', '31', '0', '56566646', '18707587890', '454646', '8855', '53535');
INSERT INTO `sx_food_23` VALUES ('68', '继续金凤凰', '4555514', '0', '0', '1462085852', '1462085852', '2', '31', '0', '接单%姐夫', '18707587890', '5466', '6766', '6464');
INSERT INTO `sx_food_23` VALUES ('69', '就像你虚拟机', '4946671', '0', '0', '1462087282', '1462087282', '2', '31', '0', '46865', '18707587890', '好想好想检查呢', '6764', '764');
INSERT INTO `sx_food_23` VALUES ('70', '皇朝酒店', '648963', '0', '0', '1462087552', '1462087552', '2', '31', '0', '都护府改v', '18707587890', '54554', '5555', '姐夫爵迹风津道看');
INSERT INTO `sx_food_data_23` VALUES ('57', '');
INSERT INTO `sx_food_data_23` VALUES ('58', '');
INSERT INTO `sx_food_data_23` VALUES ('59', '');
INSERT INTO `sx_food_data_23` VALUES ('60', '');
INSERT INTO `sx_food_data_23` VALUES ('61', '');
INSERT INTO `sx_food_data_23` VALUES ('62', '');
INSERT INTO `sx_food_data_23` VALUES ('63', '');
INSERT INTO `sx_food_data_23` VALUES ('64', '');
INSERT INTO `sx_food_data_23` VALUES ('65', '');
INSERT INTO `sx_food_data_23` VALUES ('66', '');
INSERT INTO `sx_food_data_23` VALUES ('67', '');
INSERT INTO `sx_food_data_23` VALUES ('68', '');
INSERT INTO `sx_food_data_23` VALUES ('69', '');
INSERT INTO `sx_food_data_23` VALUES ('70', '');
INSERT INTO `sx_food_log` VALUES ('2', 'fasdfsdfsfsf发生的发顺丰阿斯蒂芬vv电视v多撒女', '1461419871', '55');
INSERT INTO `sx_food_log` VALUES ('3', 'fasdfsdfsfsf发生的发顺丰阿斯蒂芬vv电视v多撒女', '1461419873', '55');
INSERT INTO `sx_food_log` VALUES ('4', 'fasdfsdfsfsf发生的发顺丰阿斯蒂芬vv电视v多撒女', '1461419878', '55');
INSERT INTO `sx_food_log` VALUES ('5', '富士达发生大发发', '1461420758', '55');
INSERT INTO `sx_group` VALUES ('3', '0', '0', '0', '是法国法国发生的ggdfs', '', '0', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '', '是法国法国发生的ggdfs,,', '', '0', '0', '0', '', '', '0', '', '0', '0', '', '', '', '', '', '', '', '', '', '0', '0', '', '1462078784', '1462078784', '', '0', '3', '0', 'show.php?itemid=3', '', '', '个撒旦法估算法的是g');
INSERT INTO `sx_group_data` VALUES ('3', '个撒旦法估算法的是g');
INSERT INTO `sx_info_24` VALUES ('1', '0', '0', 'sadfasfsdf', '', '0', '', '', '11', 'http://shixun.com/file/upload/201602/28/184014170.jpg', '', '', '', '0', '0', '0000-00-00', '0', '163', '', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1456656019', '0000-00-00', '', '0', '3', '0', '0', '', '', '', '0', '');
INSERT INTO `sx_info_24` VALUES ('2', '0', '0', 'fdsfdsafdsafasdfsf', '', '0', '', '', '50', 'http://shixun.com/file/upload/201602/28/184748380.jpg', '', '', '', '0', '1456656473', '0000-00-00', '0', '0', '', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1456656473', '0000-00-00', '', '0', '3', '0', '0', '', '', '', '1', '');
INSERT INTO `sx_info_24` VALUES ('3', '0', '0', 'FDSFdfsdafasd', '', '0', '', '', '20', '', '', '', '', '0', '1457446470', '0000-00-00', '0', '0', '', '0', '0', '', '', '', '', '', '', '', '', '', '', 'sdafsdafsadfasfdf发生的范德萨范德萨fasdfdsafdsaf范德萨发士大夫撒的范德萨发生大发法案第三方士大夫撒旦法第三方发送的发生发', '', '', '', '', '', '', '', '1457446470', '0000-00-00', '', '0', '3', '0', '0', '', '', '', '0', '');
INSERT INTO `sx_info_24` VALUES ('4', '0', '1', '的方法的是否', '', '0', '', '', '10', 'http://shixun.com/file/upload/201602/26/223712240.jpg', '', '', '', '0', '0', '0000-00-00', '0', '184', '', '0', '0', '', '', '', '', '', '', '', '', '', '', '发生大发发打发', '', '', '', '', '', '', '', '1457451302', '0000-00-00', '', '0', '3', '0', '0', '', '', '', '0', '2e2192338b9ac335139b76dfe960fb');
INSERT INTO `sx_info_24` VALUES ('5', '0', '2', 'dsfasdfasf', '', '0', '', '', '74', 'http://shixun.com/file/upload/201602/26/224550700.jpg', '', '', '', '0', '1457532599', '0000-00-00', '0', '205', '', '0', '0', '', '', '', '', '', '', '', '', '', '', 'fdsfdsfsdfsdafadsf', '', '', '', '', '', '', '', '1457532599', '0000-00-00', '', '0', '3', '0', '0', '', '', '', '0', '');
INSERT INTO `sx_info_24` VALUES ('6', '0', '0', 'fdsafdasf', '', '0', '', '', '33', 'http://shixun.com/file/upload/201602/26/223712240.jpg', '', '', '', '0', '1457532780', '0000-00-00', '0', '147', '', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1457532780', '0000-00-00', '', '0', '3', '0', '0', '', '', '', '0', '');
INSERT INTO `sx_info_24` VALUES ('7', '0', '0', '发的萨芬撒打发', '', '0', '', '', '25', 'http://zhongning.com/file/upload/201604/18/110724730.jpg', '', '', '', '0', '1461395627', '0000-00-00', '0', '0', '', '0', '0', '', '', '', '', '', '', '', '', '', '', '发的啥范德萨飞洒地方', '', '', '', '', '', '', '', '1461395627', '0000-00-00', '', '0', '3', '0', '0', '', '', '', '0', '');
INSERT INTO `sx_info_data_24` VALUES ('1', '&nbsp;fadsfasdfasfsdf');
INSERT INTO `sx_info_data_24` VALUES ('2', '&nbsp;fsdafdsafdsaf');
INSERT INTO `sx_info_data_24` VALUES ('3', '&nbsp;sdafsdafsadfasfdf发生的范德萨范德萨fasdfdsafdsaf范德萨发士大夫撒的范德萨发生大发法案第三方士大夫撒旦法第三方发送的发生发的是');
INSERT INTO `sx_info_data_24` VALUES ('4', '&nbsp;发大水发大水发f');
INSERT INTO `sx_info_data_24` VALUES ('5', '&nbsp;fdsfdsfsdfsdafadsf');
INSERT INTO `sx_info_data_24` VALUES ('6', '');
INSERT INTO `sx_info_data_24` VALUES ('7', '&nbsp;发的啥范德萨飞洒地方');
INSERT INTO `sx_job` VALUES ('5', '5', '86', '0', 'FDasfdf', '', '0', 'fsdafdsafafsdfsdfsd', '', '', '', '65535', '23', '10', '1', '0', '0', '4', '0', '0', '0', '55', '', '0', '1', '0', '', '0', '0', '', '', '', 'fdsfsfsaffdf', '', '', '', '', '', '1', '0', '', '1456634740', '0000-00-00', '1456634740', '0000-00-00', '', '0', '3', '0', '', '', '', '10', '1', '0');
INSERT INTO `sx_job` VALUES ('6', '6', '2', '0', 'fsdfdsfsda', '', '0', 'fsdfsdfdsfsdfsa', '', '', '', '34', '1', '234', '0', '0', '0', '2', '10', '0', '0', '10', '', '0', '1', '0', '', '0', '0', '', '', '', 'fsfsdf', '', '', '', '', '', '1', '0', '', '1456634757', '0000-00-00', '1456634757', '0000-00-00', '', '0', '3', '0', '', '', '', '9', '0', '0');
INSERT INTO `sx_job` VALUES ('7', '29', '54', '1', '发大水发打发', '', '0', '放大撒飞洒发多少发', '', '', '', '32', '2', '5', '0', '0', '0', '0', '0', '0', '0', '19', '', '0', '1', '0', '范德萨飞洒发放', '0', '0', '', '', '', '范德萨发放', '', '', '', '', '', '1', '0', '', '1456908699', '0000-00-00', '1456908699', '0000-00-00', '', '0', '3', '0', '', '', '', '9', '0', '0');
INSERT INTO `sx_job` VALUES ('8', '28', '185', '0', '放大法第三方第三方', '', '0', '范德萨发士大夫发达', '', '', '', '234', '2', '35', '1', '0', '0', '2', '18', '0', '0', '0', '', '0', '10', '0', '范德萨发发', '0', '0', '', '18707587890', '', '范德萨发发', '', '', '', '', '', '1', '0', '', '1457233999', '0000-00-00', '1457233999', '0000-00-00', '', '0', '0', '0', '', '', '', '0', '0', '0');
INSERT INTO `sx_job` VALUES ('9', '28', '48', '0', '范德萨发打发', '', '0', ' vsdfdsfsadfsdfsdf', '', '', '', '234', '342', '2353252', '2', '0', '0', '2', '2', '0', '0', '0', 'http://shixun.com/file/upload/201603/06/2058313310.jpg', '0', '10', '0', '范德萨发', '0', '0', '', '18707587896', '', '范德萨发', '', '', '', '', '', '1', '0', '', '1457269865', '0000-00-00', '1457234155', '0000-00-00', '', '0', '0', '0', '', '', '', '0', '0', '0');
INSERT INTO `sx_job` VALUES ('10', '28', '1790', '2', 'fdsf', '', '0', 'fdfsf', '', '', '', '2', '1', '34', '0', '0', '0', '0', '0', '0', '0', '9', '', '0', '1', '0', 'fsdfaf', '0', '0', '', '18707587890', '', 'fsdfdsf', '', '', '', '', '', '1', '0', '', '1457235389', '0000-00-00', '1457235389', '0000-00-00', '', '0', '3', '0', '', '', '', '9', '0', '0');
INSERT INTO `sx_job` VALUES ('11', '28', '1801', '0', 'fadsff', '', '0', '', '', '', '', '234', '2', '43424', '2', '0', '0', '2', '2', '0', '0', '0', 'http://shixun.com/file/upload/201603/06/2102546510.jpg', '0', '10', '0', 'fsdaf', '0', '0', '', '18707587890', '', 'fdfdsafa', '', '', '', '', '', '1', '0', '', '1457269397', '0000-00-00', '1457269397', '0000-00-00', '', '0', '0', '0', '', '', '', '0', '0', '0');
INSERT INTO `sx_job` VALUES ('12', '29', '147', '0', 'fdaf', '', '0', '', '', '', '', '23', '10', '20', '0', '0', '0', '0', '0', '0', '0', '12', 'http://shixun.com/file/upload/201602/26/223958690.jpg', '0', '1', '0', 'fdsfdasf', '0', '0', '', '18707587890', '', 'sdafdsfsadf', '', '', '', '', '', '1', '0', '', '1457534976', '0000-00-00', '1457534976', '0000-00-00', '', '0', '3', '0', '', '', '', '9', '0', '0');
INSERT INTO `sx_job` VALUES ('13', '28', '167', '0', '123456', '', '0', ' fasdfasd', '', '', '', '0', '1', '2', '2', '0', '0', '1', '1', '0', '0', '0', '', '0', '1', '0', 'fadsf', '0', '0', '', '18707587890', '', 'fadsfsf', '', '', '', '', '', '1', '0', '', '1457936075', '0000-00-00', '1457936075', '0000-00-00', '', '0', '2', '0', '', '', '', '0', '0', '0');
INSERT INTO `sx_job` VALUES ('14', '28', '1780', '0', 'fadsfra', '', '0', ' ', '', '', '', '151', '10', '1200', '2', '0', '0', '3', '16', '0', '0', '2', '', '0', '1', '0', '123456', '0', '0', '', '18707587890', '', 'fdsfdaf', '', '', '', '', '', '1', '0', '', '1458179077', '0000-00-00', '1458179077', '0000-00-00', '', '0', '1', '0', '', '', '', '0', '0', '0');
INSERT INTO `sx_job` VALUES ('15', '28', '49', '0', '1245', '', '0', ' 放大法', '', '', '', '12', '120', '400', '3', '0', '0', '1', '1', '0', '0', '36', '', '0', '1', '0', '1554', '0', '0', '', '', '', '发大水发', '', '', '', '', '', '1', '0', '', '1458874250', '0000-00-00', '1458874250', '0000-00-00', '', '0', '3', '0', '', '', '', '9', '0', '0');
INSERT INTO `sx_job` VALUES ('16', '29', '146', '0', 'fadfa', '', '0', 'fasdfasf', '', '', '', '12', '1', '20', '1', '0', '0', '1', '3', '0', '0', '0', 'http://shixun.com/file/upload/201604/11/150808581.jpg', '0', '1', '0', '1564561', '0', '0', '', '101010', '', '1010', '', '', '', '', '', '1', '0', '', '1460358524', '0000-00-00', '1460358524', '0000-00-00', '', '0', '2', '0', '', '', '', '0', '0', '0');
INSERT INTO `sx_job` VALUES ('17', '30', '147', '0', 'fadsfa', '', '0', 'fdfadsfds', '', '', '', '10', '10', '10', '3', '0', '0', '1', '2', '0', '0', '0', '', '0', '1', '0', 'fdsaf', '0', '0', '', '', '', '10101010', '', '', '', '', '', '1', '0', '', '1460360579', '0000-00-00', '1460360555', '0000-00-00', '', '0', '1', '0', '', '', '', '0', '0', '0');
INSERT INTO `sx_job_data` VALUES ('1', '');
INSERT INTO `sx_job_data` VALUES ('2', '&nbsp;fsdfdsfsa');
INSERT INTO `sx_job_data` VALUES ('3', '&nbsp;fsdfdsafsdaf');
INSERT INTO `sx_job_data` VALUES ('4', '&nbsp;kjklnlkknlkn');
INSERT INTO `sx_job_data` VALUES ('5', '&nbsp;fsdafdsafafsdfsdfsd');
INSERT INTO `sx_job_data` VALUES ('6', '&nbsp;fsdfsdfdsfsdfsa');
INSERT INTO `sx_job_data` VALUES ('7', '&nbsp;放大撒飞洒发多少发');
INSERT INTO `sx_job_data` VALUES ('8', '&nbsp;范德萨发士大夫发达');
INSERT INTO `sx_job_data` VALUES ('9', ' vsdfdsfsadfsdfsdf');
INSERT INTO `sx_job_data` VALUES ('10', '&nbsp;fdfsf');
INSERT INTO `sx_job_data` VALUES ('11', '');
INSERT INTO `sx_job_data` VALUES ('12', '');
INSERT INTO `sx_job_data` VALUES ('13', ' fasdfasd');
INSERT INTO `sx_job_data` VALUES ('14', ' ');
INSERT INTO `sx_job_data` VALUES ('15', ' 放大法');
INSERT INTO `sx_job_data` VALUES ('16', '&nbsp;fasdfasf');
INSERT INTO `sx_job_data` VALUES ('17', '<div class=\"womdnlsandh\"><img src=\"http://shixun.com/file/upload/201604/11/154145111.jpg\" style=\"display:block;margin:0 auto;\" alt=\"\" /><img src=\"http://shixun.com/file/upload/201604/11/154147341.jpg\" style=\"display:block;margin:0 auto;\" alt=\"\" /><img src=\"http://shixun.com/file/upload/201604/11/154152661.jpg\" style=\"display:block;margin:0 auto;\" alt=\"\" /><img src=\"http://shixun.com/file/upload/201604/11/154155781.jpg\" style=\"display:block;margin:0 auto;\" alt=\"\" /><img src=\"http://shixun.com/file/upload/201604/11/154158591.jpg\" style=\"display:block;margin:0 auto;\" alt=\"\" /><img src=\"http://shixun.com/file/upload/201604/11/154201971.jpg\" style=\"display:block;margin:0 auto;\" alt=\"\" /><img src=\"http://shixun.com/file/upload/201604/11/154204361.jpg\" style=\"display:block;margin:0 auto;\" alt=\"\" /><img src=\"http://shixun.com/file/upload/201604/11/154207681.jpg\" style=\"display:block;margin:0 auto;\" alt=\"\" /></div>\r\n&nbsp;fdfadsfds');
INSERT INTO `sx_like` VALUES ('9', '2', '1', '2130706433', '1456976826');
INSERT INTO `sx_like` VALUES ('10', '1', '2', '2130706433', '1456981514');
INSERT INTO `sx_like` VALUES ('11', '5', '3', '2130706433', '1456981775');
INSERT INTO `sx_like` VALUES ('12', '3', '4', '2130706433', '1456982077');
INSERT INTO `sx_like` VALUES ('13', '4', '5', '2130706433', '1456982256');
INSERT INTO `sx_like` VALUES ('14', '2', '1', '2130706433', '1456983386');
INSERT INTO `sx_like` VALUES ('15', '2', '1', '2130706433', '1456983415');
INSERT INTO `sx_like` VALUES ('16', '2', '1', '2130706433', '1456983418');
INSERT INTO `sx_like` VALUES ('17', '2', '1', '2130706433', '1456983461');
INSERT INTO `sx_like` VALUES ('18', '2', '1', '2130706433', '1456983491');
INSERT INTO `sx_like` VALUES ('19', '2', '1', '2130706433', '1456983547');
INSERT INTO `sx_like` VALUES ('20', '23', '5', '2130706433', '1458267591');
INSERT INTO `sx_link` VALUES ('1', '1', '0', 'Destoon B2B', '', 'http://static.destoon.com/logo.gif', 'DESTOON B2B网站管理系统', '', '1453453275', 'shixun03d98', '1457403003', '0', '1', '3', 'http://www.destoon.com/');
INSERT INTO `sx_mail_log` VALUES ('1', '694538309@qq.com', '中国食讯网用户注册激活信', '', '1457663421', '', '0', '2', 'close');
INSERT INTO `sx_mail_log` VALUES ('2', '694538309@qq.com', '中国食讯网邮件发送测试', '<b>恭喜！您的站点[中国食讯网]邮件发送设置成功！</b><br/>------------------------------------<br><a href=\"http://www.destoon.com/\" target=\"_blank\">Send By DESTOON B2B Mail Tester</a>', '1457663766', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('3', '694538309@qq.com', '中国食讯网用户注册激活信', '<br />\n<b>Warning</b>:  filemtime(): stat failed for D:/wnmp/html/shixun/template/default/mail/check.htm in <b>D:wnmphtmlshixunincludeglobal.func.php</b> on line <b>175</b><br />\n', '1457663816', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('4', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;<br />\n<b>Notice</b>:  Undefined variable: title in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>3</b><br />\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的6f45</strong>：<br/>\r\n您好！欢迎您注册中国食讯网，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"<br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n\" target=\"_blank\"><br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n</a><br/>\r\n帐号激活后，您即可享受中国食讯网的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457664307', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('5', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;<br />\n<b>Notice</b>:  Undefined variable: title in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>3</b><br />\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的fdaf</strong>：<br/>\r\n您好！欢迎您注册中国食讯网，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"<br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n\" target=\"_blank\"><br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n</a><br/>\r\n帐号激活后，您即可享受中国食讯网的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457664383', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('6', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的fasdf</strong>：<br/>\r\n您好！欢迎您注册中国食讯网，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"<br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n\" target=\"_blank\"><br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n</a><br/>\r\n帐号激活后，您即可享受中国食讯网的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457664631', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('7', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的dfsf</strong>：<br/>\r\n您好！欢迎您注册中国食讯网，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"<br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n\" target=\"_blank\"><br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n</a><br/>\r\n帐号激活后，您即可享受中国食讯网的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457664660', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('8', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的fdsaf</strong>：<br/>\r\n您好！欢迎您注册中国食讯网，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"<br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n\" target=\"_blank\"><br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n</a><br/>\r\n帐号激活后，您即可享受中国食讯网的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457664708', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('9', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的fdsfa</strong>：<br/>\r\n您好！欢迎您注册中国食讯网，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"<br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n\" target=\"_blank\"><br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n</a><br/>\r\n帐号激活后，您即可享受中国食讯网的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457664776', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('10', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的fdasf</strong>：<br/>\r\n您好！欢迎您注册中国食讯网，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"<br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n\" target=\"_blank\"><br />\n<b>Notice</b>:  Undefined variable: authurl in <b>D:wnmphtmlshixunfilecachetpldefaultmailcheck.php</b> on line <b>9</b><br />\n</a><br/>\r\n帐号激活后，您即可享受中国食讯网的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457664864', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('11', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的fsdafa</strong>：<br/>\r\n您好！欢迎您注册中国食讯网，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com/member/register.php?action=email_register&auth=E6E4F5E8A960DDA2E0D6EC99F5742C8C\" target=\"_blank\">http://shixun.com/member/register.php?action=email_register&auth=E6E4F5E8A960DDA2E0D6EC99F5742C8C</a><br/>\r\n帐号激活后，您即可享受中国食讯网的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457664994', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('12', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的fadfa</strong>：<br/>\r\n您好！欢迎您注册中国食讯网，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com/member/register.php?action=email_register&auth=0037E72D2F8A14038E4ED2C5A44AA3DE\" target=\"_blank\">http://shixun.com/member/register.php?action=email_register&auth=0037E72D2F8A14038E4ED2C5A44AA3DE</a><br/>\r\n帐号激活后，您即可享受中国食讯网的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457666453', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('13', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的fadfafd</strong>：<br/>\r\n您好！欢迎您注册中国食讯网，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com/member/register.php?action=email_register&auth=6D057C75E4CC40F41BACC56A6739AFE0\" target=\"_blank\">http://shixun.com/member/register.php?action=email_register&auth=6D057C75E4CC40F41BACC56A6739AFE0</a><br/>\r\n帐号激活后，您即可享受中国食讯网的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457666566', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('14', '6945383029@qq.com', '中国食讯网用户注册激活信', '', '1457673370', '', '0', '2', 'smtp.qq.com:25 RCPT TO - 550 Mailbox not found or access denied\r\n');
INSERT INTO `sx_mail_log` VALUES ('15', '6945383029@qq.com', '中国食讯网用户注册激活信', '', '1457673414', '', '0', '2', 'smtp.qq.com:25 RCPT TO - 550 Mailbox not found or access denied\r\n');
INSERT INTO `sx_mail_log` VALUES ('16', '6945383029@qq.com', '中国食讯网用户注册激活信', '', '1457673492', '', '0', '2', 'smtp.qq.com:25 RCPT TO - 550 Mailbox not found or access denied\r\n');
INSERT INTO `sx_mail_log` VALUES ('17', '694538309@qq.com', '中国食讯网邮件发送测试', '<b>恭喜！您的站点[中国食讯网]邮件发送设置成功！</b><br/>------------------------------------<br><a href=\"http://www.destoon.com/\" target=\"_blank\">Send By DESTOON B2B Mail Tester</a>', '1457673509', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('18', '694538309@qq.com', '中国食讯网用户注册激活信', '', '1457673555', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('19', '694538309@qq.com', '中国食讯网用户注册激活信', '', '1457673620', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('20', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;修改邮箱</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的</strong>：<br/>\r\n您好！您使用了中国食讯网的<span style=\"color:#FF1100;\">修改Email</span>功能，请点击下面的链接完成您的Email修改（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com/member/register.php?action=email_register&auth=&dnn=13&ndls=145767363764538\" target=\"_blank\">http://shixun.com/member/register.php?action=email_register&auth=&dnn=13&ndls=145767363764538</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457673637', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('21', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;修改邮箱</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的</strong>：<br/>\r\n您好！您使用了中国食讯网的<span style=\"color:#FF1100;\">修改Email</span>功能，请点击下面的链接完成您的Email修改（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com/ajax.php?action=member&job=editemail&auth=FCB2890718F8BB3A50583A119286163D&dnn=13&ndls=827651457673918\" target=\"_blank\">http://shixun.com/ajax.php?action=member&job=editemail&auth=FCB2890718F8BB3A50583A119286163D&dnn=13&ndls=827651457673918</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457673918', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('22', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;修改邮箱</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的</strong>：<br/>\r\n您好！您使用了中国食讯网的<span style=\"color:#FF1100;\">修改Email</span>功能，请点击下面的链接完成您的Email修改（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com/ajax.php?moduleid=2action=member&job=editemail&auth=FCB2890718F8BB3A50583A119286163D&dnn=13&ndls=821221457673971\" target=\"_blank\">http://shixun.com/ajax.php?moduleid=2action=member&job=editemail&auth=FCB2890718F8BB3A50583A119286163D&dnn=13&ndls=821221457673971</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457673971', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('23', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;修改邮箱</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的</strong>：<br/>\r\n您好！您使用了中国食讯网的<span style=\"color:#FF1100;\">修改Email</span>功能，请点击下面的链接完成您的Email修改（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com/ajax.php?moduleid=2&action=member&job=editemail&auth=FCB2890718F8BB3A50583A119286163D&dnn=13&ndls=906421457674617&email=694538309@qq.com\" target=\"_blank\">http://shixun.com/ajax.php?moduleid=2&action=member&job=editemail&auth=FCB2890718F8BB3A50583A119286163D&dnn=13&ndls=906421457674617&email=694538309@qq.com</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457674617', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('24', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;找回密码</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的<br />\n<b>Notice</b>:  Undefined variable: username in <b>D:wnmphtmlshixunfilecachetpldefaultmailpassword.php</b> on line <b>7</b><br />\n</strong>：<br/>\r\n您好！您使用了中国食讯网的<span style=\"color:#FF1100;\">找回会员密码</span>功能，请点击下面的链接完成您的登录密码找回（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com//member/findpw.php?action=findpw&auth=6DD89506CE9B1F5AE6324A7885C1990E&ndls=123456&email=694538309@qq.com&ndls=145201457675884\" target=\"_blank\">http://shixun.com//member/findpw.php?action=findpw&auth=6DD89506CE9B1F5AE6324A7885C1990E&ndls=123456&email=694538309@qq.com&ndls=145201457675884</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457675884', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('25', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;找回密码</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的用户</strong>：<br/>\r\n您好！您使用了中国食讯网的<span style=\"color:#FF1100;\">找回会员密码</span>功能，请点击下面的链接完成您的登录密码找回（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com//member/findpw.php?action=findpw&auth=6DD89506CE9B1F5AE6324A7885C1990E&dnn=123456&email=694538309@qq.com&ndls=905161457676316\" target=\"_blank\">http://shixun.com//member/findpw.php?action=findpw&auth=6DD89506CE9B1F5AE6324A7885C1990E&dnn=123456&email=694538309@qq.com&ndls=905161457676316</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457676316', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('26', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;找回密码</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的用户</strong>：<br/>\r\n您好！您使用了中国食讯网的<span style=\"color:#FF1100;\">找回会员密码</span>功能，请点击下面的链接完成您的登录密码找回（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com//member/findpw.php?action=findpw&auth=81FCD985145AD37DE93F1469AA5138B8&dnn=123456a&email=694538309@qq.com&ndls=668511457676407\" target=\"_blank\">http://shixun.com//member/findpw.php?action=findpw&auth=81FCD985145AD37DE93F1469AA5138B8&dnn=123456a&email=694538309@qq.com&ndls=668511457676407</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457676407', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('27', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;找回密码</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的用户</strong>：<br/>\r\n您好！您使用了中国食讯网的<span style=\"color:#FF1100;\">找回会员密码</span>功能，请点击下面的链接完成您的登录密码找回（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com//member/findpw.php?action=findpw&auth=6DD89506CE9B1F5AE6324A7885C1990E&dnn=123456&email=694538309@qq.com&ndls=643191457676520\" target=\"_blank\">http://shixun.com//member/findpw.php?action=findpw&auth=6DD89506CE9B1F5AE6324A7885C1990E&dnn=123456&email=694538309@qq.com&ndls=643191457676520</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457676520', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('28', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;找回密码</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的用户</strong>：<br/>\r\n您好！您使用了中国食讯网的<span style=\"color:#FF1100;\">找回会员密码</span>功能，请点击下面的链接完成您的登录密码找回（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com/member/findpw.php?action=findpw&auth=6DD89506CE9B1F5AE6324A7885C1990E&dnn=123456&email=694538309@qq.com&ndls=692081457676614\" target=\"_blank\">http://shixun.com/member/findpw.php?action=findpw&auth=6DD89506CE9B1F5AE6324A7885C1990E&dnn=123456&email=694538309@qq.com&ndls=692081457676614</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457676614', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('29', '694538309@qq.com', '中国食讯网用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;找回密码</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的用户</strong>：<br/>\r\n您好！您使用了中国食讯网的<span style=\"color:#FF1100;\">找回会员密码</span>功能，请点击下面的链接完成您的登录密码找回（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://shixun.com/member/findpw.php?action=findpw&auth=6DD89506CE9B1F5AE6324A7885C1990E&dnn=123456&email=694538309@qq.com&ndls=575181457677101\" target=\"_blank\">http://shixun.com/member/findpw.php?action=findpw&auth=6DD89506CE9B1F5AE6324A7885C1990E&dnn=123456&email=694538309@qq.com&ndls=575181457677101</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#FFFFFF;\">中国食讯网</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1457677101', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('30', '694538309@qq.com', '中宁县民间借贷登记服务中心用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的<br />\n<b>Notice</b>:  Undefined variable: username in <b>D:web', '1461722378', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('31', '694538309@qq.com', '中宁县民间借贷登记服务中心用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的<br />\n<b>Notice</b>:  Undefined variable: username in <b>D:web', '1461722436', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('32', '694538309@qq.com', '中宁县民间借贷登记服务中心用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的用户</strong>：<br/>\r\n您好！欢迎您注册中宁县民间借贷登记服务中心，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://03.8660.org/member/register.php?action=email_register&auth=4CFF40282D431A818CC2A2D73DF3E532\" target=\"_blank\">http://03.8660.org/member/register.php?action=email_register&auth=4CFF40282D431A818CC2A2D73DF3E532</a><br/>\r\n帐号激活后，您即可享受中宁县民间借贷登记服务中心的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461722483', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('33', '694538309@qq.com', '中宁县民间借贷登记服务中心用户找回密码', '', '1461722551', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('34', '694538309@qq.com', '中宁县民间借贷登记服务中心用户找回密码', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;找回密码</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的用户</strong>：<br/>\r\n您好！您使用了中宁县民间借贷登记服务中心的<span style=\"color:#FF1100;\">找回会员密码</span>功能，请点击下面的链接完成您的登录密码找回（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://03.8660.org/member/findpw.php?action=findpw&auth=0845496011AA414934EC4679EAA08EC8\" target=\"_blank\">http://03.8660.org/member/findpw.php?action=findpw&auth=0845496011AA414934EC4679EAA08EC8</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461722657', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('35', '694538309@qq.com', '中宁县民间借贷登记服务中心用户找回密码', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;找回密码</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的用户</strong>：<br/>\r\n您好！您使用了中宁县民间借贷登记服务中心的<span style=\"color:#FF1100;\">找回会员密码</span>功能，请点击下面的链接完成您的登录密码找回（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://03.8660.org/member/findpw.php?action=findpw&auth=A832B406FF717FCB1EC644CA6E1F94FD\" target=\"_blank\">http://03.8660.org/member/findpw.php?action=findpw&auth=A832B406FF717FCB1EC644CA6E1F94FD</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461722694', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('36', '694538309@qq.com', '中宁县民间借贷登记服务中心用户修改邮箱', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;修改邮箱</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的</strong>：<br/>\r\n您好！您使用了中宁县民间借贷登记服务中心的<span style=\"color:#FF1100;\">修改Email</span>功能，请点击下面的链接完成您的Email修改（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"\" target=\"_blank\"></a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461722796', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('37', '694538309@qq.com', '中宁县民间借贷登记服务中心用户修改邮箱', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;修改邮箱</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的</strong>：<br/>\r\n您好！您使用了中宁县民间借贷登记服务中心的<span style=\"color:#FF1100;\">修改Email</span>功能，请点击下面的链接完成您的Email修改（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"\" target=\"_blank\"></a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461722869', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('38', '694538309@qq.com', '中宁县民间借贷登记服务中心用户修改邮箱', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;修改邮箱</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的</strong>：<br/>\r\n您好！您使用了中宁县民间借贷登记服务中心的<span style=\"color:#FF1100;\">修改Email</span>功能，请点击下面的链接完成您的Email修改（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"\" target=\"_blank\"></a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461722905', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('39', '694538309@qq.com', '中宁县民间借贷登记服务中心用户修改邮箱', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;修改邮箱</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的</strong>：<br/>\r\n您好！您使用了中宁县民间借贷登记服务中心的<span style=\"color:#FF1100;\">修改Email</span>功能，请点击下面的链接完成您的Email修改（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"\" target=\"_blank\"></a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461722963', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('40', '694538309@qq.com', '中宁县民间借贷登记服务中心用户修改邮箱', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;修改邮箱</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的</strong>：<br/>\r\n您好！您使用了中宁县民间借贷登记服务中心的<span style=\"color:#FF1100;\">修改Email</span>功能，请点击下面的链接完成您的Email修改（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://03.8660.org/ajax.php?action=member&moduleid=2&job=editemail&auth=33DE86F4B11642472D328C5827B796A0\" target=\"_blank\">http://03.8660.org/ajax.php?action=member&moduleid=2&job=editemail&auth=33DE86F4B11642472D328C5827B796A0</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461723001', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('41', '694538309@qq.com', '中宁县民间借贷登记服务中心用户修改邮箱', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;修改邮箱</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的</strong>：<br/>\r\n您好！您使用了中宁县民间借贷登记服务中心的<span style=\"color:#FF1100;\">修改Email</span>功能，请点击下面的链接完成您的Email修改（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://03.8660.org/ajax.php?action=member&moduleid=2&job=editemail&auth=76E2268EFD475BE70E9B87C7D0E557A4\" target=\"_blank\">http://03.8660.org/ajax.php?action=member&moduleid=2&job=editemail&auth=76E2268EFD475BE70E9B87C7D0E557A4</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461723052', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('42', '694538309@qq.com', '中宁县民间借贷登记服务中心用户修改邮箱', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;修改邮箱</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的</strong>：<br/>\r\n您好！您使用了中宁县民间借贷登记服务中心的<span style=\"color:#FF1100;\">修改Email</span>功能，请点击下面的链接完成您的Email修改（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://03.8660.org/ajax.php?action=member&moduleid=2&job=editemail&auth=34083FB5A2FA245588074735F4906EAF\" target=\"_blank\">http://03.8660.org/ajax.php?action=member&moduleid=2&job=editemail&auth=34083FB5A2FA245588074735F4906EAF</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461723243', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('43', '6945383091@qq.com', '中宁县民间借贷登记服务中心用户找回密码', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;找回密码</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的用户</strong>：<br/>\r\n您好！您使用了中宁县民间借贷登记服务中心的<span style=\"color:#FF1100;\">找回会员密码</span>功能，请点击下面的链接完成您的登录密码找回（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://03.8660.org/member/findpw.php?action=findpw&auth=6472FD5EC428D2D359716D61E2412B7E\" target=\"_blank\">http://03.8660.org/member/findpw.php?action=findpw&auth=6472FD5EC428D2D359716D61E2412B7E</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461723271', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('44', '694538309@qq.com', '中宁县民间借贷登记服务中心邮件发送测试', '<b>恭喜！您的站点[中宁县民间借贷登记服务中心]邮件发送设置成功！</b><br/>------------------------------------<br><a href=\"http://www.destoon.com/\" target=\"_blank\">Send By DESTOON B2B Mail Tester</a>', '1461723330', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('45', '694538309@qq.com', '中宁县民间借贷登记服务中心用户修改邮箱', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#FF6600;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;修改邮箱</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的</strong>：<br/>\r\n您好！您使用了中宁县民间借贷登记服务中心的<span style=\"color:#FF1100;\">修改Email</span>功能，请点击下面的链接完成您的Email修改（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://03.8660.org/ajax.php?action=member&moduleid=2&job=editemail&auth=753E387205F7B56FF59F9EDB5EE2D14D\" target=\"_blank\">http://03.8660.org/ajax.php?action=member&moduleid=2&job=editemail&auth=753E387205F7B56FF59F9EDB5EE2D14D</a><br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461723369', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('46', 'zqxz1987429@163.com', '中宁县民间借贷登记服务中心用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的用户</strong>：<br/>\r\n您好！欢迎您注册中宁县民间借贷登记服务中心，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://03.8660.org/member/register.php?action=email_register&auth=2AE03985EB4C42FB1D248ACBAB440FED\" target=\"_blank\">http://03.8660.org/member/register.php?action=email_register&auth=2AE03985EB4C42FB1D248ACBAB440FED</a><br/>\r\n帐号激活后，您即可享受中宁县民间借贷登记服务中心的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461742505', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('47', '1828363317@qq.com', '中宁县民间借贷登记服务中心用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的用户</strong>：<br/>\r\n您好！欢迎您注册中宁县民间借贷登记服务中心，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://03.8660.org/member/register.php?action=email_register&auth=7CA40CFE58EFE24373D989D6147762E9\" target=\"_blank\">http://03.8660.org/member/register.php?action=email_register&auth=7CA40CFE58EFE24373D989D6147762E9</a><br/>\r\n帐号激活后，您即可享受中宁县民间借贷登记服务中心的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461895660', '', '0', '2', 'smtp.qq.com:25 can not connect to the SMTP server');
INSERT INTO `sx_mail_log` VALUES ('48', '1828363317@qq.com', '中宁县民间借贷登记服务中心用户注册激活信', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\" style=\"font-family:Verdana,Arial;\">\r\n<tr>\r\n<td style=\"background:#003366;line-height:30px;font-size:14px;font-weight:bold;color:#FFFFFF;\">&nbsp;&nbsp;注册激活</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border:#CCCCCC 1px solid;padding:20px 20px 20px 20px;line-height:180%;font-size:13px;\">\r\n<strong>尊敬的用户</strong>：<br/>\r\n您好！欢迎您注册中宁县民间借贷登记服务中心，请点击下面的链接激活您的帐号（如果显示的不是链接，请将下面的地址复制到浏览器的地址栏里按下回车键）<br/>\r\n<a href=\"http://03.8660.org/member/register.php?action=email_register&auth=4C107DDD352F3990BBB982666392971C\" target=\"_blank\">http://03.8660.org/member/register.php?action=email_register&auth=4C107DDD352F3990BBB982666392971C</a><br/>\r\n帐号激活后，您即可享受中宁县民间借贷登记服务中心的各项会员服务。<br/>\r\n链接有效期为 <strong style=\"color:red\">3</strong> 天\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"background:#333333;padding:10px;line-height:180%;font-size:12px;color:#FFFFFF;\">请注意：此邮件系 <a href=\"http://03.8660.org/\" target=\"_blank\" style=\"color:#FFFFFF;\">中宁县民间借贷登记服务中心</a> 自动发送，请勿直接回复。<br/>如果此邮件不是您请求的，请忽略并删除！</td>\r\n</tr>\r\n</table>', '1461895709', '', '0', '3', '');
INSERT INTO `sx_mail_log` VALUES ('49', '694538309@qq.com', '中宁县民间借贷登记服务中心邮件发送测试', '<b>恭喜！您的站点[中宁县民间借贷登记服务中心]邮件发送设置成功！</b><br/>------------------------------------<br><a href=\"http://www.destoon.com/\" target=\"_blank\">Send By DESTOON B2B Mail Tester</a>', '1461895989', '', '0', '3', '');
INSERT INTO `sx_member` VALUES ('18', '8392673132', '14e1b600b1fd579f47433b88e8d85291', '1@qq.com', '0', '', '5', '0', '5', '1461310317', '127.0.0.1', '1461309253', '119.130.221.5', '1461503675', '8', 'http://03.8660.org/file/upload/201604/24/2124387018.png', '48', 'fdsdf', '1', '0', '18707587890', 'abcd', '0', '0', '', '0', '0', '44122419910429373x', '2', '1');
INSERT INTO `sx_member` VALUES ('17', '283f8e2a9e', '14e1b600b1fd579f47433b88e8d85291', '2@qq.com', '0', '', '5', '0', '5', '0', '127.0.0.1', '1460947398', '', '0', '0', '', '0', '', '0', '0', '18707587891', '12', '0', '0', '', '0', '5', '', '0', '0');
INSERT INTO `sx_member` VALUES ('19', '36620', '5047a17a46e6d579fe96c7da25310a85', 'bbmmwan12886088@qq.com', '0', '', '5', '0', '5', '0', '14.135.171.243', '1461566579', '14.135.171.243', '1461566763', '2', '', '3199', '', '0', '0', '15909559866', '李翊煊', '0', '0', '', '0', '0', '', '0', '0');
INSERT INTO `sx_member` VALUES ('20', '95c40f', 'b585c38fb51179502ad650118675e232', '3@qq.com', '0', '', '5', '0', '5', '0', '14.135.171.243', '1461566799', '14.135.171.243', '1461566816', '1', '', '0', '', '0', '0', '13639588261', '史韵', '0', '0', '', '0', '0', '', '0', '0');
INSERT INTO `sx_member` VALUES ('21', '589af252a', '54f23881d5eb5862b896b90c2f8af88b', '4@qq.com', '0', '', '5', '0', '5', '0', '14.135.171.243', '1461566804', '14.135.171.243', '1461566866', '1', '', '0', '', '0', '0', '18209677551', '张凯', '0', '0', '', '0', '0', '', '0', '0');
INSERT INTO `sx_member` VALUES ('22', '2c489ff', 'dd697e986686fbb919c5e588aefad839', '5@qq.com', '0', '', '5', '0', '5', '0', '14.135.171.243', '1461567019', '14.135.171.243', '1461568130', '1', '', '0', '', '0', '0', '13519253521', '贺建辉', '0', '0', '', '0', '0', '', '0', '0');
INSERT INTO `sx_member` VALUES ('23', 'b33f', '5ea8ee457e6d2ba7d426438107a5618f', '6@qq.com', '0', '', '5', '0', '5', '0', '14.135.171.243', '1461567052', '14.135.171.243', '1461567097', '1', '', '0', '', '0', '0', '15595158995', '庞鹏', '0', '0', '', '0', '0', '', '0', '0');
INSERT INTO `sx_member` VALUES ('24', 'c861363b5f', '04d6f1f20e9e469875f606c40942a0d6', '7@qq.com', '0', '', '5', '0', '5', '0', '14.135.171.243', '1461567055', '14.135.171.243', '1461567081', '1', '', '0', '', '0', '0', '18995478107', '刁文文', '0', '0', '', '0', '0', '', '0', '0');
INSERT INTO `sx_member` VALUES ('25', '5ac22', '95c2ac1985544cadc4e5068cbecce5c5', '8@qq.com', '0', '', '5', '0', '5', '0', '14.135.171.243', '1461567139', '14.135.171.243', '1461567157', '1', '', '0', '', '2', '0', '18709566668', '宋薇', '0', '0', '', '0', '0', '', '2', '2');
INSERT INTO `sx_member` VALUES ('26', 'ea3d51fa26', 'e420237d4afddb152a1a21d73366d3e2', '9@qq.com', '0', '', '5', '0', '5', '0', '14.135.171.243', '1461567249', '14.135.171.243', '1461567279', '1', '', '0', '', '0', '0', '18465153520', '王志芮', '0', '0', '', '0', '0', '', '0', '0');
INSERT INTO `sx_member` VALUES ('27', 'ecf12d', '39141f5bce198a964f58cd4a6848b5c7', '10@qq.com', '0', '', '5', '0', '5', '0', '14.135.171.243', '1461567693', '14.135.171.243', '1461567741', '1', '', '0', '', '0', '0', '13409557767', '秦霞', '0', '0', '', '0', '0', '', '0', '0');
INSERT INTO `sx_member` VALUES ('28', '2e42bef045', 'e87592609768af10015ef6fb1b7a60d6', '11@qq.com', '0', '', '5', '0', '5', '0', '182.140.177.165', '1461568544', '182.140.177.165', '1461568574', '1', '', '0', '', '0', '0', '15909510505', '王平', '0', '0', '', '0', '0', '', '0', '0');
INSERT INTO `sx_member` VALUES ('29', 'c710133', '093cfeba51c3b0c3b2695edbc4053a99', '12@qq.com', '0', '', '5', '0', '5', '0', '14.135.171.243', '1461570562', '14.135.171.243', '1461570573', '1', '', '0', '', '0', '0', '13259598199', '33203', '0', '0', '', '0', '0', '', '0', '0');
INSERT INTO `sx_member` VALUES ('30', '4cc94733', 'a282efcaff37e77359a9a4615ab11aef', '13@qq.com', '0', '', '5', '0', '5', '0', '14.135.171.243', '1461572726', '14.135.171.243', '1461572748', '1', '', '0', '', '0', '0', '13649554551', '王彦声', '0', '0', '', '0', '0', '', '0', '0');
INSERT INTO `sx_member` VALUES ('31', '67ff', '70873e8580c9900986939611618d7b1e', '694538309@qq.com', '0', '', '5', '0', '5', '1461722711', '183.6.143.173', '1461722499', '113.67.139.155', '1462083299', '3', '', '0', '', '0', '0', '', '12345', '0', '0', '', '0', '0', '', '0', '11');
INSERT INTO `sx_member` VALUES ('32', 'f1fbc9834c', '22410cbc48372cfa7ec8292c308b4b6f', 'zqxz1987429@163.com', '0', '', '5', '0', '5', '0', '113.99.7.212', '1461742552', '113.99.7.212', '1461742572', '1', '', '0', '', '0', '0', '', '赖锦超', '0', '0', '', '0', '0', '', '0', '0');
INSERT INTO `sx_member` VALUES ('33', '4bba55', '86f78f9b08ade9d757f6cc17e4e905b5', '1828363317@qq.com', '0', '', '5', '0', '5', '0', '183.6.143.173', '1461895849', '183.6.143.173', '1461923990', '2', '', '0', '', '0', '0', '', 'cha', '0', '0', '', '0', '0', '', '3', '1');
INSERT INTO `sx_member_group` VALUES ('1', '管理员', '0', '1');
INSERT INTO `sx_member_group` VALUES ('2', '禁止访问', '0', '2');
INSERT INTO `sx_member_group` VALUES ('3', '回收站', '0', '3');
INSERT INTO `sx_member_group` VALUES ('4', '待审核会员', '0', '4');
INSERT INTO `sx_member_group` VALUES ('5', '个人会员', '0', '5');
INSERT INTO `sx_member_group` VALUES ('6', '企业会员', '0', '6');
INSERT INTO `sx_member_group` VALUES ('7', '待审核企业会员', '0', '7');
INSERT INTO `sx_member_link` VALUES ('14', '123456', '6945383091@qq.com', '6472FD5EC428D2D359716D61E2412B7E', '1461723271', '', '2', '0');
INSERT INTO `sx_message` VALUES ('1', '欢迎加入中国食讯网', '', '4', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\">\r\n<tr>\r\n<td><a href=\"http://shixun.com/\" target=\"_blank\"><img src=\"http://shixun.com/skin/default/image/logo.gif\" style=\"margin:10px 0;border:none;\" alt=\"中国食讯网 LOGO\" title=\"中国食讯网\"/></a></td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid 1px #DDDDDD;border-bottom:solid 1px #DDDDDD;padding:10px 0;line-height:200%;font-family:\'Microsoft YaHei\',Verdana,Arial;font-size:14px;color:#333333;\">\r\n尊敬的会员：<br/>\r\n恭喜您成功注册成为中国食讯网会员！<br/>\r\n以下为您的会员帐号信息：<br/>\r\n<strong>户名：</strong>123658<br/>\r\n<strong>密码：</strong>123456<br/>\r\n请您妥善保存，切勿告诉他人。<br/>\r\n如果您在使用过程中遇到任何问题，欢迎随时与我们取得联系。<br/>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"line-height:22px;padding:10px 0;font-family:\'Microsoft YaHei\',Verdana,Arial;font-size:12px;color:#666666;\">\r\n请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#005590;\">中国食讯网</a> 自动发送，请勿直接回复。如果此邮件不是您请求的，请忽略并删除\r\n</td>\r\n</tr>\r\n</table>', '', '123658', '1453700818', '127.0.0.1', '0', '0', '0', '3', '');
INSERT INTO `sx_message` VALUES ('2', '欢迎加入中国食讯网', '', '4', '<table cellpadding=\"0\" cellspacing=\"0\" width=\"700\" align=\"center\">\r\n<tr>\r\n<td><a href=\"http://shixun.com/\" target=\"_blank\"><img src=\"http://shixun.com/skin/default/image/logo.gif\" style=\"margin:10px 0;border:none;\" alt=\"中国食讯网 LOGO\" title=\"中国食讯网\"/></a></td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-top:solid 1px #DDDDDD;border-bottom:solid 1px #DDDDDD;padding:10px 0;line-height:200%;font-family:\'Microsoft YaHei\',Verdana,Arial;font-size:14px;color:#333333;\">\r\n尊敬的会员：<br/>\r\n恭喜您成功注册成为中国食讯网会员！<br/>\r\n以下为您的会员帐号信息：<br/>\r\n<strong>户名：</strong>123658<br/>\r\n<strong>密码：</strong><i>已加密</i> (如果您忘记了密码，<a href=\"http://shanghai.shixun.commember/send.php\" target=\"_blank\" style=\"color:#005590;\">请点这里找回</a>)<br/>\r\n请您妥善保存，切勿告诉他人。<br/>\r\n如果您在使用过程中遇到任何问题，欢迎随时与我们取得联系。<br/>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"line-height:22px;padding:10px 0;font-family:\'Microsoft YaHei\',Verdana,Arial;font-size:12px;color:#666666;\">\r\n请注意：此邮件系 <a href=\"http://shixun.com/\" target=\"_blank\" style=\"color:#005590;\">中国食讯网</a> 自动发送，请勿直接回复。如果此邮件不是您请求的，请忽略并删除\r\n</td>\r\n</tr>\r\n</table>', '', '123658', '1453700953', '127.0.0.1', '0', '0', '0', '3', '');
INSERT INTO `sx_module` VALUES ('1', 'destoon', '核心', '', 'http://demo.destoon.com/v6.0/', 'http://03.8660.org/', '', '1', '0', '0', '0', '0', '0', '1453453275');
INSERT INTO `sx_module` VALUES ('2', 'member', '会员', 'member', '', 'http://03.8660.org/member/', '', '2', '0', '0', '0', '0', '0', '1453453275');
INSERT INTO `sx_module` VALUES ('3', 'extend', '扩展', 'extend', '', 'http://03.8660.org/extend/', '', '0', '0', '0', '0', '0', '0', '1453453275');
INSERT INTO `sx_module` VALUES ('4', 'company', '公司', 'company', '', 'http://zhongning.com/company/', '', '7', '0', '1', '0', '0', '1', '1453453275');
INSERT INTO `sx_module` VALUES ('22', 'info', '招商', 'invest', '', 'http://shixun.com/invest/', '', '12', '0', '1', '0', '0', '1', '1453453275');
INSERT INTO `sx_module` VALUES ('5', 'sell', '投资项目', 'cession', '', 'http://03.8660.org/cession/', '', '14', '0', '1', '0', '0', '0', '1453453275');
INSERT INTO `sx_module` VALUES ('6', 'buy', '投资申请', 'share', '', 'http://03.8660.org/share/', '', '13', '0', '1', '0', '0', '0', '1453453275');
INSERT INTO `sx_module` VALUES ('8', 'exhibit', '业绩公示', 'track', '', 'http://03.8660.org/track/', '', '10', '0', '1', '0', '0', '0', '1453453275');
INSERT INTO `sx_module` VALUES ('21', 'article', '资讯', 'news', '', 'http://03.8660.org/news/', '', '3', '0', '1', '0', '0', '0', '1453453275');
INSERT INTO `sx_module` VALUES ('9', 'job', '加入我们', 'job', '', 'http://zhongning.com/job/', '', '14', '0', '1', '0', '0', '1', '1453453275');
INSERT INTO `sx_module` VALUES ('13', 'brand', '公告', 'bbs', '', 'http://03.8660.org/bbs/', '', '4', '0', '1', '0', '0', '0', '1453453275');
INSERT INTO `sx_module` VALUES ('12', 'photo', '图库', 'photo', '', 'http://shixun.com/photo/', '', '15', '0', '1', '0', '0', '1', '1453453275');
INSERT INTO `sx_module` VALUES ('14', 'video', '视频', 'video', '', 'http://shixun.com/video/', '', '18', '0', '1', '0', '0', '1', '1453453275');
INSERT INTO `sx_module` VALUES ('15', 'down', '下载', 'down', '', 'http://shixun.com/down/', '', '16', '0', '1', '0', '0', '1', '1453453275');
INSERT INTO `sx_module` VALUES ('16', 'mall', '商城', 'mall', '', 'http://shixun.com/mall/', '', '4', '0', '1', '0', '0', '1', '1453453275');
INSERT INTO `sx_module` VALUES ('17', 'group', '常见问题', 'question', '', 'http://03.8660.org/question/', '', '8', '0', '1', '0', '0', '0', '1453453275');
INSERT INTO `sx_module` VALUES ('23', 'food', '融资申请', 'food', '', 'http://03.8660.org/food/', '', '12', '0', '1', '0', '0', '0', '1453628557');
INSERT INTO `sx_module` VALUES ('24', 'info', '公司动态', 'info', '', 'http://03.8660.org/info/', '', '5', '0', '1', '0', '0', '0', '1456654920');
INSERT INTO `sx_nums` VALUES ('1', '0', '0', '0');
INSERT INTO `sx_online` VALUES ('31', '67ff', '113.67.139.155', '1', '0', '1462088616');
INSERT INTO `sx_question` VALUES ('1', '5+6=?', '11');
INSERT INTO `sx_question` VALUES ('2', '7+8=?', '15');
INSERT INTO `sx_question` VALUES ('3', '11*11=?', '121');
INSERT INTO `sx_question` VALUES ('4', '12-5=?', '7');
INSERT INTO `sx_question` VALUES ('5', '21-9=?', '12');
INSERT INTO `sx_resume` VALUES ('1', '28', '184', '0', '', '', '0', '', ',562,,厨师上海市,卢湾区,,,322,男士,未婚,大专', '562', '1', '1995-01-01', '21', '1', '0', '0', '3', '322', '', '', '', '0', '1000', '1', '1', '', '18707587890', 'fdsfasdfffa', '694538309@qq.com', '', '', '', '', '0', 'http://shixun.com/file/upload/201602/26/223712240.jpg', 'shixun', '1458052807', '', '1458052807', '127.0.0.1', '0', '2', '0', '0', 'resume.php?itemid=1', '', '0', '0');
INSERT INTO `sx_resume` VALUES ('2', '28', '54', '0', '', '', '0', 'fdsfasfas', '', '发大水发顺丰', '1', '1991-01-01', '25', '1', '23', '22', '2', 'fdfasfas', '', '', '', '0', '0', '1', '10', '', '18707587890', 'fdasfasfdasfdas', '694538309@qq.com', '', '', '', '', '41', '', '', '1460013704', '', '1460013704', '127.0.0.1', '0', '1', '3', '0', '', '', '0', '1');
INSERT INTO `sx_resume_data` VALUES ('1', '');
INSERT INTO `sx_resume_data` VALUES ('2', 'fdsfasfas');
INSERT INTO `sx_sell_5` VALUES ('20', '3', '2016年第九期', '网络科技术', '1000', '0', '网络科技有限公司', '1461562941', '0000-00-00', '1461562941', '0000-00-00', '3', '0', '5', '项目资金', '10', '10', '中宁', '0%', '0');
INSERT INTO `sx_sell_data_5` VALUES ('20', '&nbsp;网络科技术');
INSERT INTO `sx_send_log` VALUES ('1', '127.0.0.1', '1457020800', '1457101806', '8', '18707587890', '17deb2462b5fb73ebe01eed12a66303a', '0');
INSERT INTO `sx_send_log` VALUES ('10', '127.0.0.1', '1457107200', '1457148716', '1', '18707587111', 'f55af3d5be955aeddacd15d9bb82f523', '0');
INSERT INTO `sx_send_log` VALUES ('9', '127.0.0.1', '1457107200', '1457148621', '1', '18707586565', '7617aa237b59524abe30aa4420be0458', '0');
INSERT INTO `sx_send_log` VALUES ('8', '127.0.0.1', '1457107200', '1457151322', '1', '18707586876', '09837802fa964b0660d8bdd251a4079d', '0');
INSERT INTO `sx_send_log` VALUES ('11', '127.0.0.1', '1458144000', '1458195024', '1', '18707587890', '31880e1abf8775f719bb8240e6306cfa', '0');
INSERT INTO `sx_send_log` VALUES ('12', '127.0.0.1', '1458230400', '1458264167', '1', '18707587890', '32db57d3477e9c7ac2eade96f325c417', '0');
INSERT INTO `sx_send_log` VALUES ('13', '127.0.0.1', '1461254400', '1461310299', '2', '18707587890', '88f147a5504f1598e8648a2c30b43238', '0');
INSERT INTO `sx_send_log` VALUES ('14', '14.135.171.243', '1461513600', '1461566518', '1', '15909559866', 'a93110e701e4715adc90f8bebefc654a', '0');
INSERT INTO `sx_send_log` VALUES ('15', '14.135.171.243', '1461513600', '1461566759', '1', '13639588261', 'a901e978174c259c49afede5cbc6d4ea', '0');
INSERT INTO `sx_send_log` VALUES ('16', '14.135.171.243', '1461513600', '1461566762', '1', '18209677551', '0b2173aa17960687125661333ae1a9bd', '0');
INSERT INTO `sx_send_log` VALUES ('17', '14.135.171.243', '1461513600', '1461566969', '1', '13519253521', 'ed07622ff2fedb17ee2f531dea305e65', '0');
INSERT INTO `sx_send_log` VALUES ('18', '14.135.171.243', '1461513600', '1461567005', '1', '18995478107', '58cabfce5ab6352d2f80081f770d1dfb', '0');
INSERT INTO `sx_send_log` VALUES ('19', '14.135.171.243', '1461513600', '1461567015', '1', '15595158995', '667d2d64ec2dce3f7c5791c35f9e154f', '0');
INSERT INTO `sx_send_log` VALUES ('20', '14.135.171.243', '1461513600', '1461567073', '1', '18709566668', '9d8555695cb25dc99b9e3bb63ae7a617', '0');
INSERT INTO `sx_send_log` VALUES ('21', '14.135.171.243', '1461513600', '1461567173', '1', '18465153520', 'd39587492e3d1474cebc636a3653b57e', '0');
INSERT INTO `sx_send_log` VALUES ('22', '14.135.171.243', '1461513600', '1461567613', '1', '13409557767', '341e994218b79a9e6544c0b902addb8d', '0');
INSERT INTO `sx_send_log` VALUES ('23', '182.140.177.165', '1461513600', '1461568478', '1', '15909510505', '601dc8dfd334a8179b734f56947f4877', '0');
INSERT INTO `sx_send_log` VALUES ('24', '14.135.171.243', '1461513600', '1461570544', '1', '13259598199', '23d696ed9631c23c5f9aad84be22437d', '0');
INSERT INTO `sx_send_log` VALUES ('25', '14.135.171.243', '1461513600', '1461572681', '1', '13649554551', '141f7a3467eeac409188fa570cb30602', '0');
INSERT INTO `sx_setting` VALUES ('2', 'pay_banks', '现金|网银在线|贝宝|支付宝|财付通|招商银行|中国工商银行|中国农业银行|中国建设银行|中国交通银行|中国银行|邮政储蓄|邮政汇款');
INSERT INTO `sx_setting` VALUES ('2', 'cash_fee_min', '1');
INSERT INTO `sx_setting` VALUES ('2', 'cash_fee_max', '50');
INSERT INTO `sx_setting` VALUES ('2', 'deposit', '1000');
INSERT INTO `sx_setting` VALUES ('2', 'trade_day', '10');
INSERT INTO `sx_setting` VALUES ('2', 'cash_fee', '1');
INSERT INTO `sx_setting` VALUES ('2', 'cash_max', '10000');
INSERT INTO `sx_setting` VALUES ('2', 'cash_min', '50');
INSERT INTO `sx_setting` VALUES ('2', 'cash_times', '3');
INSERT INTO `sx_setting` VALUES ('2', 'cash_banks', '招商银行|中国工商银行|中国农业银行|中国建设银行|中国交通银行|中国银行|邮政储蓄|贝宝|支付宝|财付通');
INSERT INTO `sx_setting` VALUES ('2', 'cash_enable', '1');
INSERT INTO `sx_setting` VALUES ('2', 'pay_url', '');
INSERT INTO `sx_setting` VALUES ('2', 'mincharge', '0');
INSERT INTO `sx_setting` VALUES ('2', 'pay_online', '1');
INSERT INTO `sx_setting` VALUES ('2', 'link_check', '2');
INSERT INTO `sx_setting` VALUES ('2', 'credit_check', '2');
INSERT INTO `sx_setting` VALUES ('2', 'credit_save', '0');
INSERT INTO `sx_setting` VALUES ('2', 'credit_clear', '0');
INSERT INTO `sx_setting` VALUES ('2', 'page_save', '0');
INSERT INTO `sx_setting` VALUES ('2', 'page_clear', '0');
INSERT INTO `sx_setting` VALUES ('2', 'page_check', '2');
INSERT INTO `sx_setting` VALUES ('2', 'news_clear', '0');
INSERT INTO `sx_setting` VALUES ('2', 'news_save', '0');
INSERT INTO `sx_setting` VALUES ('2', 'news_check', '2');
INSERT INTO `sx_setting` VALUES ('2', 'introduce_clear', '0');
INSERT INTO `sx_setting` VALUES ('2', 'introduce_save', '0');
INSERT INTO `sx_setting` VALUES ('2', 'introduce_length', '0');
INSERT INTO `sx_setting` VALUES ('2', 'thumb_height', '180');
INSERT INTO `sx_setting` VALUES ('2', 'thumb_width', '180');
INSERT INTO `sx_setting` VALUES ('2', 'mode_max', '2');
INSERT INTO `sx_setting` VALUES ('2', 'cate_max', '6');
INSERT INTO `sx_setting` VALUES ('2', 'money_unit', '人民币|港元|台币|美元|欧元|英镑');
INSERT INTO `sx_setting` VALUES ('2', 'com_mode', '制造商|贸易商|服务商|其他机构');
INSERT INTO `sx_setting` VALUES ('2', 'com_size', '1-49人|50-99人|100-499人|500-999人|1000-3000人|3000-5000人|5000-10000人|10000人以上');
INSERT INTO `sx_setting` VALUES ('2', 'com_type', '企业单位|事业单位或社会团体|个体经营|其他');
INSERT INTO `sx_setting` VALUES ('2', 'login_goto', '0');
INSERT INTO `sx_setting` VALUES ('2', 'login_remember', '0');
INSERT INTO `sx_setting` VALUES ('2', 'captcha_login', '0');
INSERT INTO `sx_setting` VALUES ('2', 'show_menu', '0');
INSERT INTO `sx_setting` VALUES ('2', 'editor', 'Basic');
INSERT INTO `sx_setting` VALUES ('2', 'vfax', '');
INSERT INTO `sx_setting` VALUES ('2', 'vcompany', '1');
INSERT INTO `sx_setting` VALUES ('2', 'vbank', '1');
INSERT INTO `sx_setting` VALUES ('2', 'vtruename', '1');
INSERT INTO `sx_setting` VALUES ('2', 'vmobile', '1');
INSERT INTO `sx_setting` VALUES ('2', 'vemail', '1');
INSERT INTO `sx_setting` VALUES ('2', 'vmember', '0');
INSERT INTO `sx_setting` VALUES ('2', 'chat_img', '0');
INSERT INTO `sx_setting` VALUES ('2', 'chat_url', '0');
INSERT INTO `sx_setting` VALUES ('2', 'chat_file', '0');
INSERT INTO `sx_setting` VALUES ('2', 'chat_ext', 'jpg|gif|png|rar|zip|pdf|doc|xls|ppt|docx|xlsx|pptx');
INSERT INTO `sx_setting` VALUES ('2', 'chat_mintime', '3');
INSERT INTO `sx_setting` VALUES ('2', 'chat_poll', '3');
INSERT INTO `sx_setting` VALUES ('2', 'chat_timeout', '600');
INSERT INTO `sx_setting` VALUES ('2', 'chat_maxlen', '300');
INSERT INTO `sx_setting` VALUES ('3', 'sitemaps_priority', '0.8');
INSERT INTO `sx_setting` VALUES ('3', 'sitemaps_changefreq', 'monthly');
INSERT INTO `sx_setting` VALUES ('3', 'sitemaps', '1');
INSERT INTO `sx_setting` VALUES ('3', 'feed_pagesize', '50');
INSERT INTO `sx_setting` VALUES ('3', 'feed_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'feed_enable', '2');
INSERT INTO `sx_setting` VALUES ('3', 'archiver_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'archiver_enable', '1');
INSERT INTO `sx_setting` VALUES ('3', 'form_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'form_enable', '1');
INSERT INTO `sx_setting` VALUES ('3', 'poll_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'poll_enable', '1');
INSERT INTO `sx_setting` VALUES ('3', 'vote_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'gift_enable', '1');
INSERT INTO `sx_setting` VALUES ('3', 'gift_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'vote_enable', '1');
INSERT INTO `sx_setting` VALUES ('3', 'guestbook_captcha', '1');
INSERT INTO `sx_setting` VALUES ('3', 'guestbook_type', '业务合作|意见建议|使用问题|页面错误|不良信息|其他');
INSERT INTO `sx_setting` VALUES ('3', 'guestbook_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'guestbook_enable', '1');
INSERT INTO `sx_setting` VALUES ('3', 'comment_am', '网友');
INSERT INTO `sx_setting` VALUES ('3', 'credit_del_comment', '5');
INSERT INTO `sx_setting` VALUES ('3', 'credit_add_comment', '2');
INSERT INTO `sx_setting` VALUES ('3', 'comment_limit', '30');
INSERT INTO `sx_setting` VALUES ('3', 'comment_pagesize', '10');
INSERT INTO `sx_setting` VALUES ('3', 'comment_time', '30');
INSERT INTO `sx_setting` VALUES ('3', 'comment_max', '500');
INSERT INTO `sx_setting` VALUES ('3', 'comment_min', '5');
INSERT INTO `sx_setting` VALUES ('3', 'comment_vote', '1');
INSERT INTO `sx_setting` VALUES ('3', 'comment_admin_del', '1');
INSERT INTO `sx_setting` VALUES ('3', 'comment_user_del', '4');
INSERT INTO `sx_setting` VALUES ('3', 'comment_captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('3', 'comment_check', '2');
INSERT INTO `sx_setting` VALUES ('3', 'comment_vote_group', '5,6,7');
INSERT INTO `sx_setting` VALUES ('3', 'comment_group', '5,6,7');
INSERT INTO `sx_setting` VALUES ('3', 'comment_show', '1');
INSERT INTO `sx_setting` VALUES ('3', 'comment_api_key', '');
INSERT INTO `sx_setting` VALUES ('3', 'comment_api_id', '');
INSERT INTO `sx_setting` VALUES ('3', 'comment_api', '');
INSERT INTO `sx_setting` VALUES ('3', 'comment_module', '5,6,4,7,8,21,22,13,9,11,12,14,15');
INSERT INTO `sx_setting` VALUES ('3', 'comment_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'link_request', '');
INSERT INTO `sx_setting` VALUES ('3', 'link_reg', '1');
INSERT INTO `sx_setting` VALUES ('3', 'link_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'link_enable', '1');
INSERT INTO `sx_setting` VALUES ('3', 'announce_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'announce_enable', '1');
INSERT INTO `sx_setting` VALUES ('3', 'ad_currency', 'money');
INSERT INTO `sx_setting` VALUES ('3', 'ad_buy', '1');
INSERT INTO `sx_setting` VALUES ('3', 'ad_view', '1');
INSERT INTO `sx_setting` VALUES ('3', 'ad_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'ad_enable', '1');
INSERT INTO `sx_setting` VALUES ('3', 'spread_currency', 'money');
INSERT INTO `sx_setting` VALUES ('3', 'spread_list', '1');
INSERT INTO `sx_setting` VALUES ('3', 'spread_check', '1');
INSERT INTO `sx_setting` VALUES ('3', 'spread_max', '10');
INSERT INTO `sx_setting` VALUES ('3', 'spread_month', '6');
INSERT INTO `sx_setting` VALUES ('3', 'spread_step', '100');
INSERT INTO `sx_setting` VALUES ('3', 'spread_company_price', '500');
INSERT INTO `sx_setting` VALUES ('3', 'spread_buy_price', '500');
INSERT INTO `sx_setting` VALUES ('3', 'spread_sell_price', '500');
INSERT INTO `sx_setting` VALUES ('3', 'spread_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'mobile_goto', '1');
INSERT INTO `sx_setting` VALUES ('3', 'mobile_pagesize', '30');
INSERT INTO `sx_setting` VALUES ('3', 'mobile_sitename', '');
INSERT INTO `sx_setting` VALUES ('3', 'mobile_pid', '14');
INSERT INTO `sx_setting` VALUES ('3', 'mobile_domain', '');
INSERT INTO `sx_setting` VALUES ('3', 'mobile_enable', '1');
INSERT INTO `sx_setting` VALUES ('3', 'mobile_ajax', '1');
INSERT INTO `sx_setting` VALUES ('3', 'mobile_ios', '');
INSERT INTO `sx_setting` VALUES ('3', 'mobile_adr', '');
INSERT INTO `sx_setting` VALUES ('3', 'show_url', '0');
INSERT INTO `sx_setting` VALUES ('3', 'list_url', '0');
INSERT INTO `sx_setting` VALUES ('3', 'weixin', '');
INSERT INTO `sx_setting` VALUES ('3', 'oauth', '0');
INSERT INTO `sx_setting` VALUES ('3', 'sitemaps_module', '16,5,6,4,17,7,8,21,22,13,9,10,11,12,14,15,18');
INSERT INTO `sx_setting` VALUES ('3', 'sitemaps_update', '60');
INSERT INTO `sx_setting` VALUES ('3', 'sitemaps_items', '10000');
INSERT INTO `sx_setting` VALUES ('3', 'baidunews', '1');
INSERT INTO `sx_setting` VALUES ('3', 'baidunews_email', 'mail@yourdomain.com');
INSERT INTO `sx_setting` VALUES ('3', 'baidunews_update', '60');
INSERT INTO `sx_setting` VALUES ('3', 'baidunews_items', '90');
INSERT INTO `sx_setting` VALUES ('3', 'module', 'extend');
INSERT INTO `sx_setting` VALUES ('3', 'feed_url', 'http://shixun.com/feed/');
INSERT INTO `sx_setting` VALUES ('3', 'archiver_url', 'http://shixun.com/archiver/');
INSERT INTO `sx_setting` VALUES ('3', 'form_url', 'http://shixun.com/form/');
INSERT INTO `sx_setting` VALUES ('3', 'poll_url', 'http://shixun.com/poll/');
INSERT INTO `sx_setting` VALUES ('3', 'vote_url', 'http://shixun.com/vote/');
INSERT INTO `sx_setting` VALUES ('3', 'gift_url', 'http://shixun.com/gift/');
INSERT INTO `sx_setting` VALUES ('3', 'guestbook_url', 'http://shixun.com/guestbook/');
INSERT INTO `sx_setting` VALUES ('3', 'comment_url', 'http://shixun.com/comment/');
INSERT INTO `sx_setting` VALUES ('3', 'link_url', 'http://shixun.com/link/');
INSERT INTO `sx_setting` VALUES ('3', 'announce_url', 'http://shixun.com/announce/');
INSERT INTO `sx_setting` VALUES ('3', 'ad_url', 'http://shixun.com/ad/');
INSERT INTO `sx_setting` VALUES ('3', 'spread_url', 'http://shixun.com/spread/');
INSERT INTO `sx_setting` VALUES ('3', 'mobile_url', 'http://shixun.com/mobile/');
INSERT INTO `sx_setting` VALUES ('4', 'group_inquiry', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('4', 'group_price', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('4', 'group_message', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('4', 'group_buy', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('4', 'group_contact', '5,6,7');
INSERT INTO `sx_setting` VALUES ('4', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('4', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('4', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('4', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('4', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('4', 'seo_title_show', '{内容标题}{分类名称}{分类SEO标题}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('4', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('4', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('4', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('4', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('4', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('4', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('4', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('4', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('4', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('4', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('4', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('4', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('4', 'page_subcat', '6');
INSERT INTO `sx_setting` VALUES ('4', 'page_inews', '10');
INSERT INTO `sx_setting` VALUES ('4', 'page_inew', '10');
INSERT INTO `sx_setting` VALUES ('4', 'level', '推荐公司');
INSERT INTO `sx_setting` VALUES ('4', 'page_irec', '10');
INSERT INTO `sx_setting` VALUES ('4', 'page_ivip', '10');
INSERT INTO `sx_setting` VALUES ('4', 'stats', '');
INSERT INTO `sx_setting` VALUES ('4', 'kf', '');
INSERT INTO `sx_setting` VALUES ('4', 'vip_maxyear', '5');
INSERT INTO `sx_setting` VALUES ('4', 'vip_honor', '1');
INSERT INTO `sx_setting` VALUES ('4', 'map', 'baidu');
INSERT INTO `sx_setting` VALUES ('4', 'vip_maxgroupvip', '3');
INSERT INTO `sx_setting` VALUES ('4', 'vip_cominfo', '1');
INSERT INTO `sx_setting` VALUES ('4', 'vip_year', '1');
INSERT INTO `sx_setting` VALUES ('4', 'openall', '0');
INSERT INTO `sx_setting` VALUES ('4', 'delvip', '1');
INSERT INTO `sx_setting` VALUES ('4', 'split', '0');
INSERT INTO `sx_setting` VALUES ('4', 'comment', '1');
INSERT INTO `sx_setting` VALUES ('4', 'homeurl', '0');
INSERT INTO `sx_setting` VALUES ('4', 'fields', 'userid,username,company,linkurl,thumb,catid,areaid,vip,groupid,validated,business,mode');
INSERT INTO `sx_setting` VALUES ('4', 'order', 'vip desc,userid desc');
INSERT INTO `sx_setting` VALUES ('4', 'title_index', '{$seo_modulename}{$seo_delimiter}{$seo_page}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('4', 'title_list', '{$seo_cattitle}{$seo_page}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('4', 'title_show', '{$seo_showtitle}{$seo_catname}{$seo_cattitle}{$seo_modulename}{$seo_sitename}{$seo_sitetitle}{$seo_delimiter}');
INSERT INTO `sx_setting` VALUES ('4', 'keywords_index', '{$seo_modulename}{$seo_sitename}{$seo_sitetitle}');
INSERT INTO `sx_setting` VALUES ('4', 'keywords_list', '{$seo_catname}{$seo_catkeywords}{$seo_modulename}{$seo_sitename}{$seo_sitekeywords}');
INSERT INTO `sx_setting` VALUES ('4', 'keywords_show', '{$seo_showtitle}{$seo_catname}{$seo_catkeywords}{$seo_modulename}{$seo_sitekeywords}');
INSERT INTO `sx_setting` VALUES ('4', 'description_index', '{$seo_modulename}{$seo_sitename}{$seo_sitetitle}');
INSERT INTO `sx_setting` VALUES ('4', 'description_list', '{$seo_sitedescription}{$seo_sitename}{$seo_modulename}{$seo_catdescription}{$seo_catname}');
INSERT INTO `sx_setting` VALUES ('4', 'description_show', '{$seo_showtitle}{$seo_showintroduce}{$seo_catname}{$seo_catdescription}{$seo_modulename}{$seo_sitename}{$seo_sitedescription}');
INSERT INTO `sx_setting` VALUES ('4', 'module', 'company');
INSERT INTO `sx_setting` VALUES ('5', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('5', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('5', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('5', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('5', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('5', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('5', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('5', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('5', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('5', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('5', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('5', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('5', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('5', 'page_subcat', '5');
INSERT INTO `sx_setting` VALUES ('5', 'max_width', '900');
INSERT INTO `sx_setting` VALUES ('5', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('5', 'upload_thumb', '0');
INSERT INTO `sx_setting` VALUES ('5', 'checkorder', '1');
INSERT INTO `sx_setting` VALUES ('5', 'swfu', '2');
INSERT INTO `sx_setting` VALUES ('5', 'stickfee', '0');
INSERT INTO `sx_setting` VALUES ('5', 'publishfee', '0');
INSERT INTO `sx_setting` VALUES ('5', 'level', '栏目页热门|栏目页推荐');
INSERT INTO `sx_setting` VALUES ('5', 'fulltext', '0');
INSERT INTO `sx_setting` VALUES ('5', 'sphinx_name', 'destoon,delta');
INSERT INTO `sx_setting` VALUES ('5', 'sphinx_port', '');
INSERT INTO `sx_setting` VALUES ('5', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('5', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('5', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('5', 'keylink', '0');
INSERT INTO `sx_setting` VALUES ('5', 'split', '0');
INSERT INTO `sx_setting` VALUES ('5', 'sphinx', '0');
INSERT INTO `sx_setting` VALUES ('5', 'sphinx_host', '');
INSERT INTO `sx_setting` VALUES ('6', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('6', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('6', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('6', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('6', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('6', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('6', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('6', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('6', 'question_price', '2');
INSERT INTO `sx_setting` VALUES ('6', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('6', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('6', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('6', 'captcha_price', '2');
INSERT INTO `sx_setting` VALUES ('6', 'group_refresh', '7');
INSERT INTO `sx_setting` VALUES ('6', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('6', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('6', 'group_contact', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('6', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('6', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('6', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('8', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('8', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('8', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('8', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('8', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('8', 'captcha_sign', '2');
INSERT INTO `sx_setting` VALUES ('8', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('8', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('8', 'group_contact', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('8', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('8', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('8', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('8', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('8', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('8', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('8', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('8', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('8', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('8', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('8', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('8', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('8', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('8', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('8', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('8', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('8', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('8', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('8', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('8', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('8', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('8', 'max_width', '550');
INSERT INTO `sx_setting` VALUES ('8', 'pagesize', '10');
INSERT INTO `sx_setting` VALUES ('8', 'cat_hall_num', '2');
INSERT INTO `sx_setting` VALUES ('8', 'cat_hall', '0');
INSERT INTO `sx_setting` VALUES ('8', 'cat_service_num', '8');
INSERT INTO `sx_setting` VALUES ('8', 'cat_service', '0');
INSERT INTO `sx_setting` VALUES ('8', 'cat_news_num', '10');
INSERT INTO `sx_setting` VALUES ('8', 'page_icat', '10');
INSERT INTO `sx_setting` VALUES ('8', 'news_id', '21');
INSERT INTO `sx_setting` VALUES ('8', 'cat_news', '0');
INSERT INTO `sx_setting` VALUES ('8', 'page_islide', '3');
INSERT INTO `sx_setting` VALUES ('8', 'level', '推荐展会|展会幻灯');
INSERT INTO `sx_setting` VALUES ('8', 'fulltext', '0');
INSERT INTO `sx_setting` VALUES ('8', 'split', '0');
INSERT INTO `sx_setting` VALUES ('8', 'keylink', '0');
INSERT INTO `sx_setting` VALUES ('8', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('8', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('8', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('8', 'fields', 'itemid,title,thumb,linkurl,style,catid,addtime,edittime,username,fromtime,totime,city,address,sponsor');
INSERT INTO `sx_setting` VALUES ('8', 'order', 'addtime desc');
INSERT INTO `sx_setting` VALUES ('8', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('8', 'introduce_length', '0');
INSERT INTO `sx_setting` VALUES ('8', 'thumb_height', '100');
INSERT INTO `sx_setting` VALUES ('8', 'thumb_width', '100');
INSERT INTO `sx_setting` VALUES ('8', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('8', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('8', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('8', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('8', 'pre_view', '500');
INSERT INTO `sx_setting` VALUES ('8', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('8', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('8', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('8', 'title_index', '{$seo_modulename}{$seo_delimiter}{$seo_page}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('8', 'title_list', '{$seo_cattitle}{$seo_page}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('8', 'title_show', '{$seo_showtitle}{$seo_delimiter}{$seo_catname}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('8', 'keywords_index', '');
INSERT INTO `sx_setting` VALUES ('8', 'keywords_list', '');
INSERT INTO `sx_setting` VALUES ('8', 'keywords_show', '');
INSERT INTO `sx_setting` VALUES ('8', 'description_index', '');
INSERT INTO `sx_setting` VALUES ('8', 'description_list', '');
INSERT INTO `sx_setting` VALUES ('8', 'description_show', '');
INSERT INTO `sx_setting` VALUES ('8', 'module', 'exhibit');
INSERT INTO `sx_setting` VALUES ('9', 'group_search_resume', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('9', 'group_contact_resume', '7');
INSERT INTO `sx_setting` VALUES ('9', 'group_show_resume', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('9', 'group_refresh', '7');
INSERT INTO `sx_setting` VALUES ('9', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('9', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('9', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('9', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('9', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('9', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('9', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('9', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('9', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('9', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('9', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('9', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('9', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('9', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('9', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('9', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('9', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('9', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('9', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('9', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('9', 'max_width', '550');
INSERT INTO `sx_setting` VALUES ('9', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('9', 'page_iresume', '10');
INSERT INTO `sx_setting` VALUES ('9', 'page_ijob', '10');
INSERT INTO `sx_setting` VALUES ('9', 'publishfee', '0');
INSERT INTO `sx_setting` VALUES ('9', 'stickfee', '0');
INSERT INTO `sx_setting` VALUES ('9', 'level', '栏目页热门|栏目页推荐');
INSERT INTO `sx_setting` VALUES ('9', 'split', '0');
INSERT INTO `sx_setting` VALUES ('23', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('23', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('23', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('23', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('23', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('23', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('23', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('23', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('23', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('23', 'question_message', '2');
INSERT INTO `sx_setting` VALUES ('23', 'captcha_message', '2');
INSERT INTO `sx_setting` VALUES ('23', 'group_refresh', '7');
INSERT INTO `sx_setting` VALUES ('23', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('23', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('23', 'group_contact', '6,7');
INSERT INTO `sx_setting` VALUES ('23', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('23', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('23', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('6', 'credit_refresh', '1');
INSERT INTO `sx_setting` VALUES ('6', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('6', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('6', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('6', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('6', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('6', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('6', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('6', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('6', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('6', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('12', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('12', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('12', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('12', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('12', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('12', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('12', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('12', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('12', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('12', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('12', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('12', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('12', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('12', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('12', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('12', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('12', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('12', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('12', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('12', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('12', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('12', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('12', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('12', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('12', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('12', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('12', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('12', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('12', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('12', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('12', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('12', 'swfu_max', '20');
INSERT INTO `sx_setting` VALUES ('12', 'max_width', '800');
INSERT INTO `sx_setting` VALUES ('12', 'pagesize', '18');
INSERT INTO `sx_setting` VALUES ('12', 'page_irec', '4');
INSERT INTO `sx_setting` VALUES ('12', 'page_icat', '2');
INSERT INTO `sx_setting` VALUES ('12', 'page_islide', '3');
INSERT INTO `sx_setting` VALUES ('12', 'level', '推荐图库|幻灯图片|推荐图文|头条相关|头条推荐');
INSERT INTO `sx_setting` VALUES ('12', 'fulltext', '0');
INSERT INTO `sx_setting` VALUES ('12', 'split', '0');
INSERT INTO `sx_setting` VALUES ('12', 'keylink', '0');
INSERT INTO `sx_setting` VALUES ('12', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('12', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('12', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('12', 'fields', 'itemid,title,thumb,linkurl,style,catid,introduce,addtime,edittime,username,items,open');
INSERT INTO `sx_setting` VALUES ('12', 'introduce_length', '120');
INSERT INTO `sx_setting` VALUES ('12', 'editor', 'Simple');
INSERT INTO `sx_setting` VALUES ('12', 'order', 'addtime desc');
INSERT INTO `sx_setting` VALUES ('12', 'maxitem', '30');
INSERT INTO `sx_setting` VALUES ('12', 'thumb_height', '90');
INSERT INTO `sx_setting` VALUES ('12', 'thumb_width', '120');
INSERT INTO `sx_setting` VALUES ('12', 'template_my', '');
INSERT INTO `sx_setting` VALUES ('12', 'template_search', '');
INSERT INTO `sx_setting` VALUES ('12', 'template_show', '');
INSERT INTO `sx_setting` VALUES ('12', 'template_list', '');
INSERT INTO `sx_setting` VALUES ('12', 'template_index', '');
INSERT INTO `sx_setting` VALUES ('12', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('12', 'pre_view', '500');
INSERT INTO `sx_setting` VALUES ('12', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('12', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('12', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('12', 'title_index', '{$seo_modulename}{$seo_delimiter}{$seo_page}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('12', 'title_list', '{$seo_cattitle}{$seo_page}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('12', 'title_show', '{$seo_showtitle}{$seo_delimiter}{$seo_catname}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('12', 'keywords_index', '');
INSERT INTO `sx_setting` VALUES ('12', 'keywords_list', '');
INSERT INTO `sx_setting` VALUES ('12', 'keywords_show', '');
INSERT INTO `sx_setting` VALUES ('12', 'description_index', '');
INSERT INTO `sx_setting` VALUES ('12', 'description_list', '');
INSERT INTO `sx_setting` VALUES ('12', 'description_show', '');
INSERT INTO `sx_setting` VALUES ('12', 'module', 'photo');
INSERT INTO `sx_setting` VALUES ('13', 'group_refresh', '7');
INSERT INTO `sx_setting` VALUES ('13', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('13', 'group_contact', '6,7');
INSERT INTO `sx_setting` VALUES ('13', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('13', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('13', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('13', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('13', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('13', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('13', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('13', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('13', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('13', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('13', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('13', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('13', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('13', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('13', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('13', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('13', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('13', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('13', 'split', '0');
INSERT INTO `sx_setting` VALUES ('13', 'fulltext', '0');
INSERT INTO `sx_setting` VALUES ('13', 'level', '首页头条|首页头条相关');
INSERT INTO `sx_setting` VALUES ('13', 'publishfee', '0');
INSERT INTO `sx_setting` VALUES ('13', 'stickfee', '0');
INSERT INTO `sx_setting` VALUES ('13', 'page_irec', '20');
INSERT INTO `sx_setting` VALUES ('13', 'page_icat', '6');
INSERT INTO `sx_setting` VALUES ('13', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('13', 'max_width', '550');
INSERT INTO `sx_setting` VALUES ('13', 'page_subcat', '6');
INSERT INTO `sx_setting` VALUES ('13', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('13', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('13', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('13', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('13', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('13', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('13', 'keylink', '0');
INSERT INTO `sx_setting` VALUES ('14', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('14', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('14', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('14', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('14', 'question_message', '2');
INSERT INTO `sx_setting` VALUES ('14', 'captcha_message', '2');
INSERT INTO `sx_setting` VALUES ('14', 'group_upload', '6,7');
INSERT INTO `sx_setting` VALUES ('14', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('14', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('14', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('14', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('14', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('14', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('14', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('14', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('14', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('14', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('14', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('14', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('14', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('14', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('14', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('14', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('14', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('14', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('14', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('14', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('14', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('14', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('14', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('14', 'max_width', '550');
INSERT INTO `sx_setting` VALUES ('14', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('14', 'page_icat', '4');
INSERT INTO `sx_setting` VALUES ('14', 'page_irec', '8');
INSERT INTO `sx_setting` VALUES ('14', 'swfu', '1');
INSERT INTO `sx_setting` VALUES ('14', 'flvstart', '');
INSERT INTO `sx_setting` VALUES ('14', 'flvend', '');
INSERT INTO `sx_setting` VALUES ('14', 'upload', 'mp4|flv|wmv');
INSERT INTO `sx_setting` VALUES ('14', 'flvlink', '');
INSERT INTO `sx_setting` VALUES ('14', 'flvmargin', '10 auto auto 10');
INSERT INTO `sx_setting` VALUES ('14', 'flvlogo', 'video.png');
INSERT INTO `sx_setting` VALUES ('14', 'autostart', '1');
INSERT INTO `sx_setting` VALUES ('14', 'player', 'FlashPlayer|MediaPlayer|RealPlayer');
INSERT INTO `sx_setting` VALUES ('14', 'level', '推荐视频');
INSERT INTO `sx_setting` VALUES ('14', 'fulltext', '0');
INSERT INTO `sx_setting` VALUES ('14', 'split', '0');
INSERT INTO `sx_setting` VALUES ('14', 'keylink', '0');
INSERT INTO `sx_setting` VALUES ('14', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('14', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('14', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('14', 'fields', 'itemid,title,thumb,linkurl,style,catid,introduce,addtime,edittime,username,hits');
INSERT INTO `sx_setting` VALUES ('14', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('14', 'order', 'addtime desc');
INSERT INTO `sx_setting` VALUES ('14', 'video_width', '480');
INSERT INTO `sx_setting` VALUES ('14', 'video_height', '400');
INSERT INTO `sx_setting` VALUES ('14', 'introduce_length', '120');
INSERT INTO `sx_setting` VALUES ('14', 'thumb_height', '90');
INSERT INTO `sx_setting` VALUES ('14', 'thumb_width', '120');
INSERT INTO `sx_setting` VALUES ('14', 'template_my', '');
INSERT INTO `sx_setting` VALUES ('14', 'template_search', '');
INSERT INTO `sx_setting` VALUES ('14', 'template_show', '');
INSERT INTO `sx_setting` VALUES ('14', 'template_list', '');
INSERT INTO `sx_setting` VALUES ('14', 'template_index', '');
INSERT INTO `sx_setting` VALUES ('14', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('14', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('14', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('14', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('14', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('14', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('14', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('14', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('14', 'title_index', '{$seo_modulename}{$seo_delimiter}{$seo_page}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('14', 'title_list', '{$seo_cattitle}{$seo_page}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('14', 'title_show', '{$seo_showtitle}{$seo_delimiter}{$seo_catname}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('14', 'keywords_index', '');
INSERT INTO `sx_setting` VALUES ('14', 'keywords_list', '');
INSERT INTO `sx_setting` VALUES ('14', 'keywords_show', '');
INSERT INTO `sx_setting` VALUES ('14', 'description_index', '');
INSERT INTO `sx_setting` VALUES ('14', 'description_list', '');
INSERT INTO `sx_setting` VALUES ('14', 'description_show', '');
INSERT INTO `sx_setting` VALUES ('14', 'module', 'video');
INSERT INTO `sx_setting` VALUES ('15', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('15', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('15', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('15', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('15', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('15', 'question_message', '2');
INSERT INTO `sx_setting` VALUES ('15', 'captcha_message', '2');
INSERT INTO `sx_setting` VALUES ('15', 'group_upload', '6,7');
INSERT INTO `sx_setting` VALUES ('15', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('15', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('15', 'group_contact', '5,6,7');
INSERT INTO `sx_setting` VALUES ('15', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('15', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('15', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('15', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('15', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('15', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('15', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('15', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('15', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('15', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('15', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('15', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('15', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('15', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('15', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('15', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('15', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('15', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('15', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('15', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('15', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('15', 'max_width', '550');
INSERT INTO `sx_setting` VALUES ('15', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('15', 'page_icat', '10');
INSERT INTO `sx_setting` VALUES ('15', 'page_irec', '8');
INSERT INTO `sx_setting` VALUES ('15', 'swfu', '0');
INSERT INTO `sx_setting` VALUES ('15', 'upload', 'rar|zip|pdf|jpg|gif|png|doc|ppt|xls|docx|pptx|xlsx');
INSERT INTO `sx_setting` VALUES ('15', 'readsize', '10');
INSERT INTO `sx_setting` VALUES ('15', 'level', '推荐下载');
INSERT INTO `sx_setting` VALUES ('15', 'fulltext', '0');
INSERT INTO `sx_setting` VALUES ('15', 'split', '0');
INSERT INTO `sx_setting` VALUES ('15', 'keylink', '0');
INSERT INTO `sx_setting` VALUES ('15', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('15', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('15', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('15', 'fields', 'itemid,title,thumb,linkurl,style,catid,introduce,addtime,edittime,username,fileext,filesize,unit');
INSERT INTO `sx_setting` VALUES ('15', 'order', 'addtime desc');
INSERT INTO `sx_setting` VALUES ('15', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('15', 'introduce_length', '120');
INSERT INTO `sx_setting` VALUES ('15', 'thumb_height', '90');
INSERT INTO `sx_setting` VALUES ('15', 'thumb_width', '120');
INSERT INTO `sx_setting` VALUES ('15', 'template_my', '');
INSERT INTO `sx_setting` VALUES ('15', 'template_search', '');
INSERT INTO `sx_setting` VALUES ('15', 'template_show', '');
INSERT INTO `sx_setting` VALUES ('15', 'template_list', '');
INSERT INTO `sx_setting` VALUES ('15', 'template_index', '');
INSERT INTO `sx_setting` VALUES ('15', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('15', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('15', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('15', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('15', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('15', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('15', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('15', 'title_index', '{$seo_modulename}{$seo_delimiter}{$seo_page}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('15', 'title_list', '{$seo_cattitle}{$seo_page}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('15', 'title_show', '{$seo_showtitle}{$seo_delimiter}{$seo_catname}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('15', 'keywords_index', '');
INSERT INTO `sx_setting` VALUES ('15', 'keywords_list', '');
INSERT INTO `sx_setting` VALUES ('15', 'keywords_show', '');
INSERT INTO `sx_setting` VALUES ('15', 'description_index', '');
INSERT INTO `sx_setting` VALUES ('15', 'description_list', '');
INSERT INTO `sx_setting` VALUES ('15', 'description_show', '');
INSERT INTO `sx_setting` VALUES ('15', 'module', 'down');
INSERT INTO `sx_setting` VALUES ('16', 'credit_refresh', '1');
INSERT INTO `sx_setting` VALUES ('16', 'credit_elite', '100');
INSERT INTO `sx_setting` VALUES ('16', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('16', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('16', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('16', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('16', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('16', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('16', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('16', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('16', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('16', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('16', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('16', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('16', 'question_inquiry', '2');
INSERT INTO `sx_setting` VALUES ('16', 'captcha_inquiry', '2');
INSERT INTO `sx_setting` VALUES ('16', 'group_elite', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('16', 'group_compare', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('16', 'group_refresh', '7');
INSERT INTO `sx_setting` VALUES ('16', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('16', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('16', 'group_contact', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('16', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('16', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('16', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('16', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('16', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('16', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('16', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('16', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('16', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('16', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('16', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('16', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('16', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('16', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('16', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('16', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('16', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('16', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('16', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('16', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('16', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('16', 'page_subcat', '5');
INSERT INTO `sx_setting` VALUES ('16', 'max_width', '900');
INSERT INTO `sx_setting` VALUES ('16', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('16', 'page_inew', '12');
INSERT INTO `sx_setting` VALUES ('16', 'page_irec', '5');
INSERT INTO `sx_setting` VALUES ('16', 'max_cart', '30');
INSERT INTO `sx_setting` VALUES ('16', 'checkorder', '1');
INSERT INTO `sx_setting` VALUES ('16', 'swfu', '2');
INSERT INTO `sx_setting` VALUES ('16', 'level', '推荐商品');
INSERT INTO `sx_setting` VALUES ('16', 'fulltext', '0');
INSERT INTO `sx_setting` VALUES ('16', 'split', '0');
INSERT INTO `sx_setting` VALUES ('16', 'keylink', '0');
INSERT INTO `sx_setting` VALUES ('16', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('16', 'thumb_width', '100');
INSERT INTO `sx_setting` VALUES ('16', 'thumb_height', '100');
INSERT INTO `sx_setting` VALUES ('16', 'introduce_length', '0');
INSERT INTO `sx_setting` VALUES ('16', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('16', 'order', 'editdate desc,vip desc,edittime desc');
INSERT INTO `sx_setting` VALUES ('16', 'fields', 'itemid,title,thumb,linkurl,style,catid,areaid,brand,addtime,edittime,username,company,groupid,vip,qq,msn,ali,skype,validated,price,amount,orders,comments');
INSERT INTO `sx_setting` VALUES ('16', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('16', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('16', 'title_index', '{$seo_modulename}{$seo_delimiter}{$seo_page}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('16', 'title_list', '{$seo_catname}{$seo_cattitle}{$seo_page}{$seo_modulename}{$seo_delimiter}{$seo_sitename}{$seo_cattitle}{$seo_modulename}{$seo_sitename}{$seo_page}');
INSERT INTO `sx_setting` VALUES ('16', 'title_show', '{$seo_showtitle}{$seo_delimiter}{$seo_catname}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('16', 'keywords_index', '{$seo_modulename}{$seo_sitename}{$seo_sitetitle}');
INSERT INTO `sx_setting` VALUES ('16', 'keywords_list', '');
INSERT INTO `sx_setting` VALUES ('16', 'keywords_show', '');
INSERT INTO `sx_setting` VALUES ('16', 'description_index', '{$seo_modulename}{$seo_sitename}{$seo_sitetitle}');
INSERT INTO `sx_setting` VALUES ('16', 'description_list', '');
INSERT INTO `sx_setting` VALUES ('16', 'description_show', '{$seo_showtitle}{$seo_showintroduce}{$seo_catname}{$seo_catdescription}{$seo_modulename}{$seo_sitename}{$seo_sitedescription}');
INSERT INTO `sx_setting` VALUES ('16', 'module', 'mall');
INSERT INTO `sx_setting` VALUES ('17', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('17', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('17', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('17', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('17', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('17', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('17', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('17', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('17', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('17', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('17', 'question_inquiry', '2');
INSERT INTO `sx_setting` VALUES ('17', 'captcha_inquiry', '2');
INSERT INTO `sx_setting` VALUES ('17', 'group_refresh', '7');
INSERT INTO `sx_setting` VALUES ('17', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('17', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('17', 'group_contact', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('17', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('17', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('17', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('17', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('17', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('17', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('17', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('17', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('17', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('17', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('17', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('17', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('17', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('17', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('17', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('17', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('17', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('17', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('17', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('17', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('17', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('17', 'page_subcat', '9');
INSERT INTO `sx_setting` VALUES ('17', 'max_width', '550');
INSERT INTO `sx_setting` VALUES ('17', 'pagesize', '9');
INSERT INTO `sx_setting` VALUES ('17', 'swfu', '2');
INSERT INTO `sx_setting` VALUES ('17', 'level', '推荐团购');
INSERT INTO `sx_setting` VALUES ('17', 'fulltext', '0');
INSERT INTO `sx_setting` VALUES ('17', 'split', '0');
INSERT INTO `sx_setting` VALUES ('17', 'keylink', '0');
INSERT INTO `sx_setting` VALUES ('17', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('17', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('17', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('17', 'fields', 'itemid,title,thumb,linkurl,style,catid,areaid,introduce,addtime,edittime,username,company,groupid,vip,qq,msn,ali,skype,validated,price,marketprice,savemoney,discount,sales,orders,minamount,amount');
INSERT INTO `sx_setting` VALUES ('17', 'order', 'addtime desc');
INSERT INTO `sx_setting` VALUES ('17', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('17', 'introduce_length', '120');
INSERT INTO `sx_setting` VALUES ('17', 'thumb_height', '300');
INSERT INTO `sx_setting` VALUES ('17', 'thumb_width', '400');
INSERT INTO `sx_setting` VALUES ('17', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('17', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('17', 'credit_refresh', '1');
INSERT INTO `sx_setting` VALUES ('17', 'title_index', '{$seo_modulename}{$seo_delimiter}{$seo_page}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('17', 'title_list', '{$seo_cattitle}{$seo_page}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('17', 'title_show', '{$seo_showtitle}{$seo_delimiter}{$seo_catname}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('17', 'keywords_index', '');
INSERT INTO `sx_setting` VALUES ('17', 'keywords_list', '');
INSERT INTO `sx_setting` VALUES ('17', 'keywords_show', '');
INSERT INTO `sx_setting` VALUES ('17', 'description_index', '');
INSERT INTO `sx_setting` VALUES ('17', 'description_list', '');
INSERT INTO `sx_setting` VALUES ('17', 'description_show', '');
INSERT INTO `sx_setting` VALUES ('17', 'module', 'group');
INSERT INTO `sx_setting` VALUES ('21', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('21', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('21', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('21', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('21', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('21', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('21', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('21', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('21', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('21', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('21', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('21', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('22', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('22', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('22', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('22', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('22', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('22', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('22', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('22', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('22', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('22', 'question_message', '2');
INSERT INTO `sx_setting` VALUES ('22', 'captcha_message', '2');
INSERT INTO `sx_setting` VALUES ('22', 'group_refresh', '7');
INSERT INTO `sx_setting` VALUES ('22', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('22', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('22', 'group_contact', '6,7');
INSERT INTO `sx_setting` VALUES ('22', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('22', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('22', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('22', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('22', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('22', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('22', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('22', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('22', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('22', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('22', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('22', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('22', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('22', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('22', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('22', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('22', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('22', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('22', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('22', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('22', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('22', 'page_subcat', '5');
INSERT INTO `sx_setting` VALUES ('22', 'max_width', '550');
INSERT INTO `sx_setting` VALUES ('22', 'page_srelate', '10');
INSERT INTO `sx_setting` VALUES ('22', 'show_message', '1');
INSERT INTO `sx_setting` VALUES ('22', 'page_lkw', '10');
INSERT INTO `sx_setting` VALUES ('22', 'show_larea', '1');
INSERT INTO `sx_setting` VALUES ('22', 'show_lcat', '1');
INSERT INTO `sx_setting` VALUES ('22', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('22', 'page_ihits', '10');
INSERT INTO `sx_setting` VALUES ('22', 'show_iarea', '1');
INSERT INTO `sx_setting` VALUES ('22', 'show_icat', '1');
INSERT INTO `sx_setting` VALUES ('22', 'page_icat', '8');
INSERT INTO `sx_setting` VALUES ('22', 'page_irec', '8');
INSERT INTO `sx_setting` VALUES ('22', 'swfu', '2');
INSERT INTO `sx_setting` VALUES ('22', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('22', 'keylink', '0');
INSERT INTO `sx_setting` VALUES ('22', 'split', '0');
INSERT INTO `sx_setting` VALUES ('22', 'fulltext', '0');
INSERT INTO `sx_setting` VALUES ('22', 'level', '推荐信息');
INSERT INTO `sx_setting` VALUES ('22', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('22', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('22', 'message_ask', '请问我这个地方有加盟商了吗？|我想加盟，请来电话告诉我具体细节。|初步打算加盟贵公司，请寄资料。|请问贵公司哪里有样板店或直营店？|想了解加盟细节，请尽快寄一份资料。 ');
INSERT INTO `sx_setting` VALUES ('22', 'order', 'edittime desc');
INSERT INTO `sx_setting` VALUES ('22', 'fields', 'itemid,title,thumb,linkurl,style,catid,areaid,introduce,addtime,edittime,username,company,groupid,vip,qq,msn,ali,skype,validated,islink');
INSERT INTO `sx_setting` VALUES ('22', 'thumb_height', '100');
INSERT INTO `sx_setting` VALUES ('22', 'introduce_length', '120');
INSERT INTO `sx_setting` VALUES ('22', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('22', 'thumb_width', '100');
INSERT INTO `sx_setting` VALUES ('22', 'template_message', '');
INSERT INTO `sx_setting` VALUES ('22', 'template_my', '');
INSERT INTO `sx_setting` VALUES ('22', 'template_search', '');
INSERT INTO `sx_setting` VALUES ('22', 'template_show', '');
INSERT INTO `sx_setting` VALUES ('22', 'template_list', '');
INSERT INTO `sx_setting` VALUES ('22', 'template_index', '');
INSERT INTO `sx_setting` VALUES ('22', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('22', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('22', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('22', 'credit_refresh', '1');
INSERT INTO `sx_setting` VALUES ('22', 'title_index', '{$seo_modulename}{$seo_delimiter}{$seo_page}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('22', 'title_list', '{$seo_cattitle}{$seo_page}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('22', 'title_show', '{$seo_showtitle}{$seo_delimiter}{$seo_catname}{$seo_modulename}{$seo_delimiter}{$seo_sitename}');
INSERT INTO `sx_setting` VALUES ('22', 'keywords_index', '');
INSERT INTO `sx_setting` VALUES ('22', 'keywords_list', '');
INSERT INTO `sx_setting` VALUES ('22', 'keywords_show', '');
INSERT INTO `sx_setting` VALUES ('22', 'description_index', '');
INSERT INTO `sx_setting` VALUES ('22', 'description_list', '');
INSERT INTO `sx_setting` VALUES ('22', 'description_show', '');
INSERT INTO `sx_setting` VALUES ('22', 'module', 'info');
INSERT INTO `sx_setting` VALUES ('pay-tenpay', 'percent', '1');
INSERT INTO `sx_setting` VALUES ('pay-tenpay', 'notify', '');
INSERT INTO `sx_setting` VALUES ('pay-tenpay', 'keycode', '');
INSERT INTO `sx_setting` VALUES ('pay-tenpay', 'partnerid', '');
INSERT INTO `sx_setting` VALUES ('pay-tenpay', 'order', '1');
INSERT INTO `sx_setting` VALUES ('pay-tenpay', 'name', '财付通');
INSERT INTO `sx_setting` VALUES ('pay-tenpay', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('pay-weixin', 'keycode', '');
INSERT INTO `sx_setting` VALUES ('pay-weixin', 'appid', '');
INSERT INTO `sx_setting` VALUES ('pay-weixin', 'partnerid', '');
INSERT INTO `sx_setting` VALUES ('pay-weixin', 'order', '2');
INSERT INTO `sx_setting` VALUES ('pay-alipay', 'percent', '1');
INSERT INTO `sx_setting` VALUES ('pay-alipay', 'notify', '');
INSERT INTO `sx_setting` VALUES ('pay-alipay', 'keycode', '');
INSERT INTO `sx_setting` VALUES ('pay-alipay', 'partnerid', '');
INSERT INTO `sx_setting` VALUES ('pay-alipay', 'email', '');
INSERT INTO `sx_setting` VALUES ('pay-alipay', 'order', '3');
INSERT INTO `sx_setting` VALUES ('pay-alipay', 'name', '支付宝');
INSERT INTO `sx_setting` VALUES ('pay-alipay', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('pay-chinabank', 'notify', '');
INSERT INTO `sx_setting` VALUES ('pay-chinabank', 'keycode', '');
INSERT INTO `sx_setting` VALUES ('pay-chinabank', 'partnerid', '');
INSERT INTO `sx_setting` VALUES ('pay-chinabank', 'order', '4');
INSERT INTO `sx_setting` VALUES ('pay-chinabank', 'name', '网银在线');
INSERT INTO `sx_setting` VALUES ('pay-yeepay', 'percent', '1');
INSERT INTO `sx_setting` VALUES ('pay-yeepay', 'keycode', '');
INSERT INTO `sx_setting` VALUES ('pay-yeepay', 'partnerid', '');
INSERT INTO `sx_setting` VALUES ('pay-yeepay', 'order', '5');
INSERT INTO `sx_setting` VALUES ('pay-yeepay', 'name', '易宝支付');
INSERT INTO `sx_setting` VALUES ('pay-yeepay', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('pay-kq99bill', 'percent', '1');
INSERT INTO `sx_setting` VALUES ('pay-kq99bill', 'notify', '');
INSERT INTO `sx_setting` VALUES ('pay-kq99bill', 'cert', '');
INSERT INTO `sx_setting` VALUES ('pay-kq99bill', 'partnerid', '');
INSERT INTO `sx_setting` VALUES ('pay-kq99bill', 'order', '6');
INSERT INTO `sx_setting` VALUES ('pay-kq99bill', 'name', '快钱支付');
INSERT INTO `sx_setting` VALUES ('pay-kq99bill', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('pay-chinapay', 'percent', '1');
INSERT INTO `sx_setting` VALUES ('pay-chinapay', 'partnerid', '');
INSERT INTO `sx_setting` VALUES ('pay-chinapay', 'order', '7');
INSERT INTO `sx_setting` VALUES ('pay-chinapay', 'name', '中国银联');
INSERT INTO `sx_setting` VALUES ('pay-chinapay', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('pay-paypal', 'percent', '0');
INSERT INTO `sx_setting` VALUES ('pay-paypal', 'currency', 'USD');
INSERT INTO `sx_setting` VALUES ('pay-paypal', 'keycode', '');
INSERT INTO `sx_setting` VALUES ('pay-paypal', 'notify', '');
INSERT INTO `sx_setting` VALUES ('pay-paypal', 'partnerid', '');
INSERT INTO `sx_setting` VALUES ('pay-paypal', 'order', '8');
INSERT INTO `sx_setting` VALUES ('pay-paypal', 'name', '贝宝');
INSERT INTO `sx_setting` VALUES ('pay-paypal', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('oauth-qq', 'sync', '0');
INSERT INTO `sx_setting` VALUES ('oauth-qq', 'key', '');
INSERT INTO `sx_setting` VALUES ('oauth-qq', 'id', '');
INSERT INTO `sx_setting` VALUES ('oauth-qq', 'order', '1');
INSERT INTO `sx_setting` VALUES ('oauth-qq', 'name', 'QQ登录');
INSERT INTO `sx_setting` VALUES ('oauth-qq', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('oauth-sina', 'sync', '0');
INSERT INTO `sx_setting` VALUES ('oauth-sina', 'key', '');
INSERT INTO `sx_setting` VALUES ('oauth-sina', 'id', '');
INSERT INTO `sx_setting` VALUES ('oauth-sina', 'order', '2');
INSERT INTO `sx_setting` VALUES ('oauth-sina', 'name', '新浪微博');
INSERT INTO `sx_setting` VALUES ('oauth-sina', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('oauth-baidu', 'key', '');
INSERT INTO `sx_setting` VALUES ('oauth-baidu', 'id', '');
INSERT INTO `sx_setting` VALUES ('oauth-baidu', 'order', '3');
INSERT INTO `sx_setting` VALUES ('oauth-baidu', 'name', '百度');
INSERT INTO `sx_setting` VALUES ('oauth-baidu', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('oauth-netease', 'order', '4');
INSERT INTO `sx_setting` VALUES ('oauth-netease', 'name', '网易通行证');
INSERT INTO `sx_setting` VALUES ('oauth-wechat', 'key', '');
INSERT INTO `sx_setting` VALUES ('oauth-wechat', 'id', '');
INSERT INTO `sx_setting` VALUES ('oauth-wechat', 'order', '5');
INSERT INTO `sx_setting` VALUES ('oauth-wechat', 'name', '微信');
INSERT INTO `sx_setting` VALUES ('oauth-wechat', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('oauth-taobao', 'id', '');
INSERT INTO `sx_setting` VALUES ('oauth-taobao', 'order', '6');
INSERT INTO `sx_setting` VALUES ('oauth-taobao', 'name', '淘宝');
INSERT INTO `sx_setting` VALUES ('oauth-msn', 'key', '');
INSERT INTO `sx_setting` VALUES ('oauth-msn', 'id', '');
INSERT INTO `sx_setting` VALUES ('oauth-msn', 'order', '7');
INSERT INTO `sx_setting` VALUES ('oauth-msn', 'name', 'MSN');
INSERT INTO `sx_setting` VALUES ('oauth-msn', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('weixin', 'credit', '10');
INSERT INTO `sx_setting` VALUES ('weixin', 'bind', '点击可绑定会员帐号、查看会员信息、收发站内信件、管理我的订单等服务内容');
INSERT INTO `sx_setting` VALUES ('weixin', 'weixin', '');
INSERT INTO `sx_setting` VALUES ('weixin', 'welcome', '感谢您的关注，请点击菜单查看相应的服务');
INSERT INTO `sx_setting` VALUES ('weixin', 'aeskey', '');
INSERT INTO `sx_setting` VALUES ('weixin', 'appsecret', '');
INSERT INTO `sx_setting` VALUES ('weixin', 'apptoken', '');
INSERT INTO `sx_setting` VALUES ('weixin', 'appid', '');
INSERT INTO `sx_setting` VALUES ('weixin-menu', 'menu', 'a:3:{i:0;a:6:{i:0;a:2:{s:4:\"name\";s:6:\"最新\";s:3:\"key\";s:0:\"\";}i:1;a:2:{s:4:\"name\";s:6:\"资讯\";s:3:\"key\";s:7:\"V_mid21\";}i:2;a:2:{s:4:\"name\";s:6:\"供应\";s:3:\"key\";s:6:\"V_mid5\";}i:3;a:2:{s:4:\"name\";s:6:\"求购\";s:3:\"key\";s:6:\"V_mid6\";}i:4;a:2:{s:4:\"name\";s:6:\"商城\";s:3:\"key\";s:7:\"V_mid16\";}i:5;a:2:{s:4:\"name\";s:6:\"招商\";s:3:\"key\";s:7:\"V_mid22\";}}i:1;a:6:{i:0;a:2:{s:4:\"name\";s:6:\"会员\";s:3:\"key\";s:8:\"V_member\";}i:1;a:2:{s:4:\"name\";s:0:\"\";s:3:\"key\";s:0:\"\";}i:2;a:2:{s:4:\"name\";s:0:\"\";s:3:\"key\";s:0:\"\";}i:3;a:2:{s:4:\"name\";s:0:\"\";s:3:\"key\";s:0:\"\";}i:4;a:2:{s:4:\"name\";s:0:\"\";s:3:\"key\";s:0:\"\";}i:5;a:2:{s:4:\"name\";s:0:\"\";s:3:\"key\";s:0:\"\";}}i:2;a:6:{i:0;a:2:{s:4:\"name\";s:6:\"更多\";s:3:\"key\";s:25:\"http://shixun.com/mobile/\";}i:1;a:2:{s:4:\"name\";s:0:\"\";s:3:\"key\";s:0:\"\";}i:2;a:2:{s:4:\"name\";s:0:\"\";s:3:\"key\";s:0:\"\";}i:3;a:2:{s:4:\"name\";s:0:\"\";s:3:\"key\";s:0:\"\";}i:4;a:2:{s:4:\"name\";s:0:\"\";s:3:\"key\";s:0:\"\";}i:5;a:2:{s:4:\"name\";s:0:\"\";s:3:\"key\";s:0:\"\";}}}');
INSERT INTO `sx_setting` VALUES ('group-1', 'job_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'quote_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'quote_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'exhibit_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'exhibit_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'group_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'group_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'mall_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'mall_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'buy_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'buy_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'sell_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'sell_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'edit_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'refresh_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'day_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'add_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'copy', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'delete', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'vdeposit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'vcompany', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'vtruename', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'vmobile', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'vemail', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'moduleids', '5,6,17,7,8,21,22,13,9,10,12,14,15,18');
INSERT INTO `sx_setting` VALUES ('group-1', 'link_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'honor_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'page_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'news_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'kf', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'stats', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'map', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'style', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'main_d', '1,5');
INSERT INTO `sx_setting` VALUES ('group-1', 'main_c', '1,5');
INSERT INTO `sx_setting` VALUES ('group-1', 'home_main', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'side_d', '0,3,6');
INSERT INTO `sx_setting` VALUES ('group-1', 'side_c', '0,3,6');
INSERT INTO `sx_setting` VALUES ('group-1', 'home_side', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'menu_d', '0,6,7,11');
INSERT INTO `sx_setting` VALUES ('group-1', 'menu_c', '0,6,7,11');
INSERT INTO `sx_setting` VALUES ('group-1', 'home_menu', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'home', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'styleid', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'homepage', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'type_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'price_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'inquiry_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'message_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'express_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'address_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'alert_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'favorite_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'friend_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'inbox_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'chat', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'ad', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'spread', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'trade_sell', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'sendmail', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'sms', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'mail', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'ask', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'cash', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'question', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'captcha', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'check', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'uploadpt', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'uploadcredit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'uploadday', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'uploadlimit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'uploadsize', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'uploadtype', '');
INSERT INTO `sx_setting` VALUES ('group-1', 'upload', '1');
INSERT INTO `sx_setting` VALUES ('group-1', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('group-1', 'reg', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'grade', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'commission', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'discount', '100');
INSERT INTO `sx_setting` VALUES ('group-1', 'fee', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'fee_mode', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'listorder', '2');
INSERT INTO `sx_setting` VALUES ('group-2', 'reg', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'quote_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'exhibit_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'exhibit_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'group_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'group_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'mall_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'mall_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'buy_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'buy_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'sell_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'sell_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'edit_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'refresh_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'day_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'add_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'copy', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'delete', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'vdeposit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'vcompany', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'vtruename', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'vmobile', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'vemail', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'moduleids', '6');
INSERT INTO `sx_setting` VALUES ('group-2', 'link_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'honor_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'page_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'news_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'kf', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'stats', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'map', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'style', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'main_d', '5');
INSERT INTO `sx_setting` VALUES ('group-2', 'main_c', '5');
INSERT INTO `sx_setting` VALUES ('group-2', 'home_main', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'side_d', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'side_c', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'home_side', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'menu_d', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'menu_c', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'home_menu', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'home', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'styleid', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'homepage', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'type_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'price_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'inquiry_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'message_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'express_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'address_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'alert_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'favorite_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'friend_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'inbox_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'chat', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'ad', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'spread', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'trade_sell', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'sendmail', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'sms', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'mail', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'ask', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'cash', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'question', '1');
INSERT INTO `sx_setting` VALUES ('group-2', 'captcha', '1');
INSERT INTO `sx_setting` VALUES ('group-2', 'check', '1');
INSERT INTO `sx_setting` VALUES ('group-2', 'uploadpt', '1');
INSERT INTO `sx_setting` VALUES ('group-2', 'uploadcredit', '1');
INSERT INTO `sx_setting` VALUES ('group-2', 'uploadday', '10');
INSERT INTO `sx_setting` VALUES ('group-2', 'uploadlimit', '2');
INSERT INTO `sx_setting` VALUES ('group-2', 'uploadsize', '200');
INSERT INTO `sx_setting` VALUES ('group-2', 'uploadtype', '');
INSERT INTO `sx_setting` VALUES ('group-2', 'upload', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'editor', 'Basic');
INSERT INTO `sx_setting` VALUES ('group-2', 'grade', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'commission', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'discount', '100');
INSERT INTO `sx_setting` VALUES ('group-2', 'fee', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'fee_mode', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'quote_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'job_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'job_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'resume_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'resume_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'article_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'article_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'info_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'info_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'know_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'know_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'brand_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'brand_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'photo_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'photo_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'video_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'video_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'down_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'down_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-2', 'club_group_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'club_reply_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'club_join_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'club_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-2', 'club_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'info_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'info_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'article_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'article_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'resume_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'resume_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'job_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'job_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'quote_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'quote_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'exhibit_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'exhibit_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'group_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'group_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'mall_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'mall_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'buy_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'buy_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'sell_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'sell_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'edit_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'refresh_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'day_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'add_limit', '30');
INSERT INTO `sx_setting` VALUES ('group-3', 'copy', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'delete', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'vdeposit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'vcompany', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'vtruename', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'vmobile', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'vemail', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'moduleids', '5,6,8,22,9,-9');
INSERT INTO `sx_setting` VALUES ('group-3', 'link_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'honor_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'page_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'news_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'kf', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'stats', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'map', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'style', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'main_d', '5');
INSERT INTO `sx_setting` VALUES ('group-3', 'main_c', '5');
INSERT INTO `sx_setting` VALUES ('group-3', 'home_main', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'side_d', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'side_c', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'home_side', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'menu_d', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'menu_c', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'home_menu', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'home', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'styleid', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'homepage', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'type_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'price_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-3', 'inquiry_limit', '30');
INSERT INTO `sx_setting` VALUES ('group-3', 'message_limit', '30');
INSERT INTO `sx_setting` VALUES ('group-3', 'express_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'address_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'alert_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'favorite_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'friend_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'inbox_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'chat', '1');
INSERT INTO `sx_setting` VALUES ('group-3', 'ad', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'listorder', '4');
INSERT INTO `sx_setting` VALUES ('group-4', 'reg', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'job_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'quote_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'quote_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'exhibit_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'exhibit_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'group_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'group_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'mall_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'mall_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'buy_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'buy_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'sell_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'sell_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'edit_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'refresh_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'day_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'add_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'copy', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'delete', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'vdeposit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'vcompany', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'vtruename', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'vmobile', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'vemail', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'moduleids', '6');
INSERT INTO `sx_setting` VALUES ('group-4', 'link_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'honor_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'page_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'news_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'kf', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'stats', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'map', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'style', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'main_d', '5');
INSERT INTO `sx_setting` VALUES ('group-4', 'main_c', '5');
INSERT INTO `sx_setting` VALUES ('group-4', 'home_main', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'side_d', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'side_c', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'home_side', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'menu_d', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'menu_c', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'home_menu', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'home', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'styleid', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'homepage', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'type_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'price_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'inquiry_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'message_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'express_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'address_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'alert_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'favorite_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'friend_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'inbox_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'chat', '1');
INSERT INTO `sx_setting` VALUES ('group-4', 'ad', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'spread', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'trade_sell', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'sendmail', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'sms', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'mail', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'ask', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'cash', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'question', '1');
INSERT INTO `sx_setting` VALUES ('group-4', 'captcha', '1');
INSERT INTO `sx_setting` VALUES ('group-4', 'check', '1');
INSERT INTO `sx_setting` VALUES ('group-4', 'uploadpt', '1');
INSERT INTO `sx_setting` VALUES ('group-4', 'uploadcredit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'uploadday', '10');
INSERT INTO `sx_setting` VALUES ('group-4', 'uploadlimit', '5');
INSERT INTO `sx_setting` VALUES ('group-4', 'uploadsize', '500');
INSERT INTO `sx_setting` VALUES ('group-4', 'uploadtype', '');
INSERT INTO `sx_setting` VALUES ('group-4', 'upload', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'editor', 'Basic');
INSERT INTO `sx_setting` VALUES ('group-4', 'grade', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'commission', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'discount', '100');
INSERT INTO `sx_setting` VALUES ('group-4', 'fee', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'fee_mode', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'job_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'resume_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'resume_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'article_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'article_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'info_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'info_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'know_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'know_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'brand_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'brand_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'photo_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'photo_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'video_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'video_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'down_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'down_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-4', 'club_group_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'club_reply_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'club_join_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'club_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-4', 'club_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'listorder', '5');
INSERT INTO `sx_setting` VALUES ('group-5', 'reg', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'info_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'article_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'article_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'resume_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'resume_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'job_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'job_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'quote_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'quote_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'exhibit_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'exhibit_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'group_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'group_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-5', 'mall_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'mall_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-5', 'buy_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'buy_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'sell_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'sell_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'edit_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'refresh_limit', '600');
INSERT INTO `sx_setting` VALUES ('group-5', 'day_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'add_limit', '30');
INSERT INTO `sx_setting` VALUES ('group-5', 'copy', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'delete', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'vdeposit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'vcompany', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'vtruename', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'vmobile', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'vemail', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'moduleids', '5,6,-9,10,12,18');
INSERT INTO `sx_setting` VALUES ('group-5', 'link_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-5', 'honor_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-5', 'page_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-5', 'news_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-5', 'kf', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'stats', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'map', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'style', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'main_d', '5');
INSERT INTO `sx_setting` VALUES ('group-5', 'main_c', '5');
INSERT INTO `sx_setting` VALUES ('group-5', 'home_main', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'side_d', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'side_c', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'home_side', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'menu_d', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'menu_c', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'home_menu', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'home', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'styleid', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'homepage', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'type_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-5', 'price_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-5', 'inquiry_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'message_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-5', 'express_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-5', 'address_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-5', 'alert_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'favorite_limit', '20');
INSERT INTO `sx_setting` VALUES ('group-5', 'friend_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-5', 'inbox_limit', '20');
INSERT INTO `sx_setting` VALUES ('group-5', 'chat', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'ad', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'spread', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'trade_sell', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'sendmail', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'sms', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'mail', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'ask', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'cash', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'question', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'captcha', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'check', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'uploadpt', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'uploadcredit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'uploadday', '20');
INSERT INTO `sx_setting` VALUES ('group-5', 'uploadlimit', '5');
INSERT INTO `sx_setting` VALUES ('group-5', 'uploadsize', '');
INSERT INTO `sx_setting` VALUES ('group-5', 'uploadtype', '');
INSERT INTO `sx_setting` VALUES ('group-5', 'upload', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'editor', 'Simple');
INSERT INTO `sx_setting` VALUES ('group-5', 'grade', '1');
INSERT INTO `sx_setting` VALUES ('group-5', 'commission', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'discount', '100');
INSERT INTO `sx_setting` VALUES ('group-5', 'fee', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'fee_mode', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'info_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'know_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'know_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'brand_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'brand_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'photo_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'photo_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'video_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'video_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'down_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-5', 'down_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'club_group_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-5', 'club_reply_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-5', 'club_join_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-5', 'club_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-5', 'club_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'listorder', '6');
INSERT INTO `sx_setting` VALUES ('group-6', 'reg', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'quote_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'exhibit_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'exhibit_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'group_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'group_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'mall_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'mall_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'buy_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'buy_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'sell_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'sell_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'edit_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'refresh_limit', '600');
INSERT INTO `sx_setting` VALUES ('group-6', 'day_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'add_limit', '60');
INSERT INTO `sx_setting` VALUES ('group-6', 'copy', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'delete', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'vdeposit', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'vcompany', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'vtruename', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'vmobile', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'vemail', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'moduleids', '16,5,6,17,7,8,22,13,9,10,12,18');
INSERT INTO `sx_setting` VALUES ('group-6', 'link_limit', '20');
INSERT INTO `sx_setting` VALUES ('group-6', 'honor_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-6', 'page_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'news_limit', '20');
INSERT INTO `sx_setting` VALUES ('group-6', 'kf', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'stats', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'map', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'style', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'main_d', '0,1,2');
INSERT INTO `sx_setting` VALUES ('group-6', 'main_c', '0,1,2,3,4,5,6');
INSERT INTO `sx_setting` VALUES ('group-6', 'home_main', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'side_d', '0,2,4,6');
INSERT INTO `sx_setting` VALUES ('group-6', 'side_c', '0,1,2,3,4,5,6');
INSERT INTO `sx_setting` VALUES ('group-6', 'home_side', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'menu_d', '0,1,2,3,4,6,7');
INSERT INTO `sx_setting` VALUES ('group-6', 'menu_c', '0,1,2,3,4,5,6,7,8,9,10,11');
INSERT INTO `sx_setting` VALUES ('group-6', 'home_menu', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'home', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'styleid', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'homepage', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'type_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-6', 'price_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-6', 'inquiry_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-6', 'message_limit', '20');
INSERT INTO `sx_setting` VALUES ('group-6', 'express_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'address_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-6', 'alert_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'favorite_limit', '50');
INSERT INTO `sx_setting` VALUES ('group-6', 'friend_limit', '50');
INSERT INTO `sx_setting` VALUES ('group-6', 'inbox_limit', '50');
INSERT INTO `sx_setting` VALUES ('group-6', 'chat', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'ad', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'spread', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'trade_sell', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'sendmail', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'sms', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'mail', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'ask', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'cash', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'question', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'captcha', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'check', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'uploadpt', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'uploadcredit', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'uploadday', '50');
INSERT INTO `sx_setting` VALUES ('group-6', 'uploadlimit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'uploadsize', '');
INSERT INTO `sx_setting` VALUES ('group-6', 'uploadtype', '');
INSERT INTO `sx_setting` VALUES ('group-6', 'upload', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('group-6', 'grade', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'commission', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'discount', '100');
INSERT INTO `sx_setting` VALUES ('group-6', 'fee', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'fee_mode', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'quote_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'job_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'job_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'resume_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'resume_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'article_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'article_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'info_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'info_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'know_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'know_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'brand_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'brand_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'photo_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'photo_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'video_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'video_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'down_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-6', 'down_free_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'club_group_limit', '1');
INSERT INTO `sx_setting` VALUES ('group-6', 'club_reply_limit', '50');
INSERT INTO `sx_setting` VALUES ('group-6', 'club_join_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-6', 'club_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-6', 'club_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'brand_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'know_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'know_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'info_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'info_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'article_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'article_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'resume_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'resume_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'job_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'job_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'quote_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'quote_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'exhibit_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'exhibit_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'group_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'group_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'mall_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'mall_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'buy_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'buy_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'sell_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'sell_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'edit_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'refresh_limit', '60');
INSERT INTO `sx_setting` VALUES ('group-7', 'day_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-7', 'add_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'copy', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'delete', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'vdeposit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'vcompany', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'vtruename', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'vmobile', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'vemail', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'moduleids', '5,6,17,7,8,21,22,13,9,-9,10,12,14,15,18');
INSERT INTO `sx_setting` VALUES ('group-7', 'honor_limit', '20');
INSERT INTO `sx_setting` VALUES ('group-7', 'link_limit', '50');
INSERT INTO `sx_setting` VALUES ('group-7', 'page_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-7', 'news_limit', '100');
INSERT INTO `sx_setting` VALUES ('group-7', 'kf', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'stats', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'map', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'style', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'main_d', '0,1,2,7');
INSERT INTO `sx_setting` VALUES ('group-7', 'main_c', '0,1,2,4,5,6,7');
INSERT INTO `sx_setting` VALUES ('group-7', 'home_main', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'side_d', '0,1,2,4,6');
INSERT INTO `sx_setting` VALUES ('group-7', 'side_c', '0,1,2,3,4,5,6');
INSERT INTO `sx_setting` VALUES ('group-7', 'home_side', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'menu_d', '0,1,2,3,4,5,6,7,8,9,10,11,12,13');
INSERT INTO `sx_setting` VALUES ('group-7', 'menu_c', '0,1,2,3,4,5,6,7,8,9,10,11,12,13');
INSERT INTO `sx_setting` VALUES ('group-7', 'home_menu', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'home', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'styleid', '2');
INSERT INTO `sx_setting` VALUES ('group-7', 'homepage', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'type_limit', '20');
INSERT INTO `sx_setting` VALUES ('group-7', 'price_limit', '20');
INSERT INTO `sx_setting` VALUES ('group-7', 'inquiry_limit', '50');
INSERT INTO `sx_setting` VALUES ('group-7', 'message_limit', '100');
INSERT INTO `sx_setting` VALUES ('group-7', 'express_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-7', 'address_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-7', 'alert_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-7', 'favorite_limit', '100');
INSERT INTO `sx_setting` VALUES ('group-7', 'friend_limit', '200');
INSERT INTO `sx_setting` VALUES ('group-7', 'inbox_limit', '500');
INSERT INTO `sx_setting` VALUES ('group-7', 'chat', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'ad', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'spread', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'trade_sell', '1');
INSERT INTO `sx_setting` VALUES ('destoon', 'backtime', '1453453275');
INSERT INTO `sx_setting` VALUES ('pay-weixin', 'name', '微信');
INSERT INTO `sx_setting` VALUES ('pay-weixin', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('pay-chinabank', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('oauth-netease', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('oauth-taobao', 'enable', '0');
INSERT INTO `sx_setting` VALUES ('2', 'alert_check', '0');
INSERT INTO `sx_setting` VALUES ('2', 'captcha_sendmessage', '2');
INSERT INTO `sx_setting` VALUES ('2', 'login_times', '50');
INSERT INTO `sx_setting` VALUES ('2', 'lock_hour', '1');
INSERT INTO `sx_setting` VALUES ('2', 'auth_days', '3');
INSERT INTO `sx_setting` VALUES ('2', 'alertid', '5|6|22');
INSERT INTO `sx_setting` VALUES ('2', 'edit_check', 'thumb,areaid,business,regyear,capital,address,telephone,content');
INSERT INTO `sx_setting` VALUES ('2', 'maxtouser', '5');
INSERT INTO `sx_setting` VALUES ('2', 'usernote', '欢迎使用DESTOON B2B网站管理系统www.destoon.com');
INSERT INTO `sx_setting` VALUES ('2', 'iptimeout', '24');
INSERT INTO `sx_setting` VALUES ('2', 'banagent', '');
INSERT INTO `sx_setting` VALUES ('2', 'defend_proxy', '0');
INSERT INTO `sx_setting` VALUES ('2', 'sms_register', '0');
INSERT INTO `sx_setting` VALUES ('2', 'credit_register', '20');
INSERT INTO `sx_setting` VALUES ('2', 'money_register', '0');
INSERT INTO `sx_setting` VALUES ('2', 'question_register', '0');
INSERT INTO `sx_setting` VALUES ('2', 'captcha_register', '1');
INSERT INTO `sx_setting` VALUES ('2', 'mobilecode_register', '0');
INSERT INTO `sx_setting` VALUES ('2', 'emailcode_register', '0');
INSERT INTO `sx_setting` VALUES ('2', 'welcome_sms', '1');
INSERT INTO `sx_setting` VALUES ('2', 'welcome_email', '1');
INSERT INTO `sx_setting` VALUES ('2', 'welcome_message', '1');
INSERT INTO `sx_setting` VALUES ('2', 'checkuser', '0');
INSERT INTO `sx_setting` VALUES ('2', 'banemail', '');
INSERT INTO `sx_setting` VALUES ('2', 'banmodec', '0');
INSERT INTO `sx_setting` VALUES ('2', 'bancompany', '');
INSERT INTO `sx_setting` VALUES ('2', 'banmodeu', '0');
INSERT INTO `sx_setting` VALUES ('2', 'banusername', 'admin|system|master|web|sell|buy|company|quote|job|article|info|page|bbs|club');
INSERT INTO `sx_setting` VALUES ('2', 'maxpassword', '20');
INSERT INTO `sx_setting` VALUES ('2', 'minpassword', '6');
INSERT INTO `sx_setting` VALUES ('2', 'maxusername', '20');
INSERT INTO `sx_setting` VALUES ('2', 'minusername', '4');
INSERT INTO `sx_setting` VALUES ('2', 'enable_register', '1');
INSERT INTO `sx_setting` VALUES ('23', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('23', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('23', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('23', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('23', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('23', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('23', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('23', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('23', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('23', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('23', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('23', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('23', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('23', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('23', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('23', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('23', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('23', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('23', 'page_subcat', '6');
INSERT INTO `sx_setting` VALUES ('23', 'max_width', '550');
INSERT INTO `sx_setting` VALUES ('group-8', 'group_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'mall_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'mall_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'buy_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'buy_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'sell_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'sell_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'edit_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'refresh_limit', '60');
INSERT INTO `sx_setting` VALUES ('group-8', 'day_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-8', 'add_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'copy', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'delete', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'vdeposit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'vcompany', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'vtruename', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'vmobile', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'vemail', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'moduleids', '5,6,17,7,8,21,22,13,9,-9,10,12,14,15,18');
INSERT INTO `sx_setting` VALUES ('group-8', 'link_limit', '50');
INSERT INTO `sx_setting` VALUES ('group-8', 'honor_limit', '20');
INSERT INTO `sx_setting` VALUES ('group-8', 'page_limit', '5');
INSERT INTO `sx_setting` VALUES ('group-8', 'news_limit', '100');
INSERT INTO `sx_setting` VALUES ('group-8', 'kf', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'stats', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'map', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'style', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'main_d', '0,1,2,7');
INSERT INTO `sx_setting` VALUES ('group-8', 'main_c', '0,1,2,4,5,6,7');
INSERT INTO `sx_setting` VALUES ('group-8', 'home_main', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'side_d', '0,1,2,4,6');
INSERT INTO `sx_setting` VALUES ('group-8', 'side_c', '0,1,2,3,4,5,6');
INSERT INTO `sx_setting` VALUES ('group-8', 'home_side', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'menu_d', '0,1,2,3,4,5,6,7,8,9,10,11,12,13');
INSERT INTO `sx_setting` VALUES ('group-8', 'menu_c', '0,1,2,3,4,5,6,7,8,9,10,11,12,13');
INSERT INTO `sx_setting` VALUES ('group-8', 'home_menu', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'home', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'styleid', '2');
INSERT INTO `sx_setting` VALUES ('group-8', 'homepage', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'type_limit', '20');
INSERT INTO `sx_setting` VALUES ('group-8', 'price_limit', '20');
INSERT INTO `sx_setting` VALUES ('group-8', 'inquiry_limit', '50');
INSERT INTO `sx_setting` VALUES ('group-8', 'message_limit', '100');
INSERT INTO `sx_setting` VALUES ('group-8', 'express_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-8', 'address_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-8', 'alert_limit', '10');
INSERT INTO `sx_setting` VALUES ('group-8', 'favorite_limit', '100');
INSERT INTO `sx_setting` VALUES ('group-8', 'friend_limit', '200');
INSERT INTO `sx_setting` VALUES ('group-8', 'inbox_limit', '500');
INSERT INTO `sx_setting` VALUES ('group-8', 'chat', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'ad', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'spread', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'trade_sell', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'sendmail', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'sms', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'mail', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'ask', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'cash', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'question', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'captcha', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'check', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'uploadpt', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'uploadcredit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'uploadday', '100');
INSERT INTO `sx_setting` VALUES ('group-8', 'uploadlimit', '10');
INSERT INTO `sx_setting` VALUES ('group-8', 'uploadsize', '');
INSERT INTO `sx_setting` VALUES ('group-8', 'uploadtype', '');
INSERT INTO `sx_setting` VALUES ('group-8', 'upload', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('group-8', 'reg', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'grade', '1');
INSERT INTO `sx_setting` VALUES ('group-8', 'commission', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'discount', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'fee', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'fee_mode', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'sendmail', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'sms', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'mail', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'ask', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'cash', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'question', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'captcha', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'check', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'uploadpt', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'uploadcredit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'uploadday', '100');
INSERT INTO `sx_setting` VALUES ('group-7', 'uploadlimit', '10');
INSERT INTO `sx_setting` VALUES ('group-7', 'uploadsize', '');
INSERT INTO `sx_setting` VALUES ('group-7', 'uploadtype', '');
INSERT INTO `sx_setting` VALUES ('group-7', 'upload', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('group-7', 'reg', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'grade', '1');
INSERT INTO `sx_setting` VALUES ('group-7', 'commission', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'discount', '');
INSERT INTO `sx_setting` VALUES ('group-7', 'fee', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'fee_mode', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'group_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'exhibit_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'exhibit_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'quote_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'quote_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'job_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'job_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'resume_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'resume_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'article_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'article_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'info_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'info_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'know_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'know_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'brand_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'brand_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'photo_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'photo_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'video_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'video_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'down_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'down_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'club_group_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-8', 'club_reply_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'club_join_limit', '50');
INSERT INTO `sx_setting` VALUES ('group-8', 'club_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-8', 'club_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'spread', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'trade_sell', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'sendmail', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'sms', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'mail', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'ask', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'cash', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'question', '1');
INSERT INTO `sx_setting` VALUES ('group-3', 'captcha', '1');
INSERT INTO `sx_setting` VALUES ('group-3', 'check', '1');
INSERT INTO `sx_setting` VALUES ('group-3', 'uploadpt', '1');
INSERT INTO `sx_setting` VALUES ('group-3', 'uploadcredit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'uploadday', '10');
INSERT INTO `sx_setting` VALUES ('group-3', 'uploadlimit', '5');
INSERT INTO `sx_setting` VALUES ('group-3', 'uploadsize', '500');
INSERT INTO `sx_setting` VALUES ('group-3', 'uploadtype', '');
INSERT INTO `sx_setting` VALUES ('group-3', 'upload', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'editor', 'Basic');
INSERT INTO `sx_setting` VALUES ('group-3', 'reg', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'grade', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'commission', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'discount', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'fee', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'fee_mode', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'brand_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'photo_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'photo_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'video_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'video_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'down_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'down_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'club_group_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-7', 'club_reply_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'club_join_limit', '50');
INSERT INTO `sx_setting` VALUES ('group-7', 'club_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-7', 'club_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'job_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'resume_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'resume_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'article_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'article_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'info_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'info_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'know_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'know_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'brand_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'brand_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'photo_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'photo_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'video_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'video_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'down_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'down_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-1', 'club_group_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'club_reply_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'club_join_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'club_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-1', 'club_free_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'know_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'know_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'brand_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'brand_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'photo_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'photo_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'video_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'video_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'down_limit', '3');
INSERT INTO `sx_setting` VALUES ('group-3', 'down_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('group-3', 'club_group_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'club_reply_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'club_join_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'club_limit', '-1');
INSERT INTO `sx_setting` VALUES ('group-3', 'club_free_limit', '0');
INSERT INTO `sx_setting` VALUES ('23', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('23', 'page_icat', '6');
INSERT INTO `sx_setting` VALUES ('23', 'page_irec', '20');
INSERT INTO `sx_setting` VALUES ('24', 'group_refresh', '7');
INSERT INTO `sx_setting` VALUES ('24', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('24', 'group_contact', '6,7');
INSERT INTO `sx_setting` VALUES ('24', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('24', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('24', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('24', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('24', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('24', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('24', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('24', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('24', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('24', 'seo_title_list', '{分类SEO标题}{页码}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('24', 'seo_description_index', '');
INSERT INTO `sx_setting` VALUES ('24', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('24', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('24', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('24', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('24', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('24', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('24', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('24', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('24', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('24', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('24', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('24', 'page_subcat', '5');
INSERT INTO `sx_setting` VALUES ('24', 'max_width', '550');
INSERT INTO `sx_setting` VALUES ('24', 'page_srelate', '10');
INSERT INTO `sx_setting` VALUES ('24', 'page_lkw', '10');
INSERT INTO `sx_setting` VALUES ('24', 'show_message', '1');
INSERT INTO `sx_setting` VALUES ('24', 'show_larea', '1');
INSERT INTO `sx_setting` VALUES ('24', 'show_lcat', '1');
INSERT INTO `sx_setting` VALUES ('24', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('24', 'page_ihits', '10');
INSERT INTO `sx_setting` VALUES ('24', 'show_iarea', '1');
INSERT INTO `sx_setting` VALUES ('24', 'keylink', '0');
INSERT INTO `sx_setting` VALUES ('24', 'split', '0');
INSERT INTO `sx_setting` VALUES ('24', 'fulltext', '0');
INSERT INTO `sx_setting` VALUES ('24', 'level', '');
INSERT INTO `sx_setting` VALUES ('24', 'swfu', '2');
INSERT INTO `sx_setting` VALUES ('24', 'page_irec', '8');
INSERT INTO `sx_setting` VALUES ('24', 'page_icat', '8');
INSERT INTO `sx_setting` VALUES ('24', 'show_icat', '1');
INSERT INTO `sx_setting` VALUES ('24', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('24', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('24', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('21', 'seo_keywords_index', '');
INSERT INTO `sx_setting` VALUES ('6', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('23', 'stickfee', '2');
INSERT INTO `sx_setting` VALUES ('9', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('9', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('13', 'message_ask', '请问我这个地方有加盟商了吗？|我想加盟，请来电话告诉我具体细节。|初步打算加盟贵公司，请寄资料。|请问贵公司哪里有样板店或直营店？|想了解加盟细节，请尽快寄一份资料。 ');
INSERT INTO `sx_setting` VALUES ('9', 'situation', '请选择|目前正在找工作|观望有好机会再考虑|半年内无换工作计划');
INSERT INTO `sx_setting` VALUES ('9', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('9', 'education', '不限|初中|高中|大专|本科|硕士|博士');
INSERT INTO `sx_setting` VALUES ('5', 'inquiry_ask', '我对贵公司的产品非常感兴趣，能否发一些详细资料给我参考？|请您发一份比较详细的产品规格说明，谢谢！|请问贵公司产品是否可以代理？代理条件是什么？|我公司有意购买此产品，可否提供此产品的报价单和最小起订量？');
INSERT INTO `sx_setting` VALUES ('5', 'inquiry_type', '单价|产品规格|型号|价格条款|原产地|能否提供样品|最小订货量|交货期|供货能力|销售条款及附加条件|包装方式|质量/安全认证 ');
INSERT INTO `sx_setting` VALUES ('5', 'type', '供应|提供服务|供应二手|提供加工|提供合作|库存');
INSERT INTO `sx_setting` VALUES ('6', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('6', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('24', 'message_ask', '请问我这个地方有加盟商了吗？|我想加盟，请来电话告诉我具体细节。|初步打算加盟贵公司，请寄资料。|请问贵公司哪里有样板店或直营店？|想了解加盟细节，请尽快寄一份资料。 ');
INSERT INTO `sx_setting` VALUES ('6', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('6', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('6', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('6', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('6', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('6', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('6', 'page_subcat', '6');
INSERT INTO `sx_setting` VALUES ('5', 'credit_refresh', '1');
INSERT INTO `sx_setting` VALUES ('5', 'credit_elite', '100');
INSERT INTO `sx_setting` VALUES ('5', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('5', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('5', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('5', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('5', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('5', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('5', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('21', 'seo_title_index', '{模块名称}{分隔符}{页码}{网站名称}');
INSERT INTO `sx_setting` VALUES ('21', 'php_item_urlid', '0');
INSERT INTO `sx_setting` VALUES ('21', 'htm_item_urlid', '1');
INSERT INTO `sx_setting` VALUES ('21', 'htm_item_prefix', '');
INSERT INTO `sx_setting` VALUES ('21', 'show_html', '0');
INSERT INTO `sx_setting` VALUES ('21', 'php_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('1', 'check_week', '');
INSERT INTO `sx_setting` VALUES ('1', 'admin_week', '');
INSERT INTO `sx_setting` VALUES ('1', 'cloud_express', '0');
INSERT INTO `sx_setting` VALUES ('1', 'sms_sign', '【签名】');
INSERT INTO `sx_setting` VALUES ('1', 'sms_ok', '成功');
INSERT INTO `sx_setting` VALUES ('1', 'sms_len', '70');
INSERT INTO `sx_setting` VALUES ('1', 'sms_max', '');
INSERT INTO `sx_setting` VALUES ('1', 'sms_fee', '0.1');
INSERT INTO `sx_setting` VALUES ('1', 'sms', '0');
INSERT INTO `sx_setting` VALUES ('1', 'page_text', '18');
INSERT INTO `sx_setting` VALUES ('1', 'page_logo', '18');
INSERT INTO `sx_setting` VALUES ('1', 'page_down', '5');
INSERT INTO `sx_setting` VALUES ('1', 'page_job', '5');
INSERT INTO `sx_setting` VALUES ('1', 'page_brand', '4');
INSERT INTO `sx_setting` VALUES ('1', 'page_exhibit', '6');
INSERT INTO `sx_setting` VALUES ('1', 'page_know', '6');
INSERT INTO `sx_setting` VALUES ('1', 'page_club', '8');
INSERT INTO `sx_setting` VALUES ('1', 'page_post', '8');
INSERT INTO `sx_setting` VALUES ('23', 'publishfee', '10.5');
INSERT INTO `sx_setting` VALUES ('23', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('23', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('23', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('23', 'keylink', '0');
INSERT INTO `sx_setting` VALUES ('23', 'split', '0');
INSERT INTO `sx_setting` VALUES ('23', 'fulltext', '0');
INSERT INTO `sx_setting` VALUES ('23', 'level', '');
INSERT INTO `sx_setting` VALUES ('13', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('13', 'fields', 'itemid,title,thumb,linkurl,style,catid,areaid,introduce,addtime,edittime,username,company,groupid,vip,qq,msn,ali,skype,validated');
INSERT INTO `sx_setting` VALUES ('13', 'order', 'editdate desc,vip desc,edittime desc');
INSERT INTO `sx_setting` VALUES ('13', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('13', 'introduce_length', '120');
INSERT INTO `sx_setting` VALUES ('13', 'thumb_height', '60');
INSERT INTO `sx_setting` VALUES ('13', 'thumb_width', '180');
INSERT INTO `sx_setting` VALUES ('13', 'template_message', '');
INSERT INTO `sx_setting` VALUES ('13', 'template_product', '');
INSERT INTO `sx_setting` VALUES ('13', 'template_my', '');
INSERT INTO `sx_setting` VALUES ('13', 'template_search', '');
INSERT INTO `sx_setting` VALUES ('13', 'template_show', '');
INSERT INTO `sx_setting` VALUES ('13', 'template_list', '');
INSERT INTO `sx_setting` VALUES ('13', 'template_index', '');
INSERT INTO `sx_setting` VALUES ('9', 'marriage', '不限|未婚|已婚');
INSERT INTO `sx_setting` VALUES ('9', 'gender', '不限|男士|女士');
INSERT INTO `sx_setting` VALUES ('9', 'type', '不限|全职|兼职|实习');
INSERT INTO `sx_setting` VALUES ('9', 'fields', 'itemid,title,linkurl,style,catid,areaid,introduce,addtime,edittime,username,company,groupid,vip,qq,msn,ali,skype,validated,minsalary,maxsalary');
INSERT INTO `sx_setting` VALUES ('9', 'order', 'editdate desc,vip desc,edittime desc');
INSERT INTO `sx_setting` VALUES ('9', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('9', 'introduce_length', '120');
INSERT INTO `sx_setting` VALUES ('9', 'thumb_height', '140');
INSERT INTO `sx_setting` VALUES ('9', 'thumb_width', '100');
INSERT INTO `sx_setting` VALUES ('5', 'fields', 'itemid,title,thumb,linkurl,style,catid,areaid,introduce,addtime,edittime,username,company,groupid,vip,qq,msn,ali,skype,validated,price,unit,minamount,amount');
INSERT INTO `sx_setting` VALUES ('5', 'order', 'addtime desc');
INSERT INTO `sx_setting` VALUES ('5', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('5', 'introduce_length', '120');
INSERT INTO `sx_setting` VALUES ('5', 'thumb_height', '100');
INSERT INTO `sx_setting` VALUES ('5', 'thumb_width', '100');
INSERT INTO `sx_setting` VALUES ('5', 'template_inquiry', '');
INSERT INTO `sx_setting` VALUES ('5', 'template_compare', '');
INSERT INTO `sx_setting` VALUES ('5', 'template_my', '');
INSERT INTO `sx_setting` VALUES ('5', 'template_search', '');
INSERT INTO `sx_setting` VALUES ('5', 'template_show', '');
INSERT INTO `sx_setting` VALUES ('5', 'template_list', '');
INSERT INTO `sx_setting` VALUES ('5', 'template_index', '');
INSERT INTO `sx_setting` VALUES ('5', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('5', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('5', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('5', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('5', 'captcha_inquiry', '2');
INSERT INTO `sx_setting` VALUES ('5', 'question_inquiry', '2');
INSERT INTO `sx_setting` VALUES ('5', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('5', 'group_elite', '6,7');
INSERT INTO `sx_setting` VALUES ('5', 'group_compare', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('5', 'group_refresh', '7');
INSERT INTO `sx_setting` VALUES ('5', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('24', 'fields', 'itemid,title,thumb,linkurl,style,catid,areaid,introduce,addtime,edittime,username,company,groupid,vip,qq,msn,ali,skype,validated,islink');
INSERT INTO `sx_setting` VALUES ('24', 'order', 'edittime desc');
INSERT INTO `sx_setting` VALUES ('24', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('24', 'introduce_length', '120');
INSERT INTO `sx_setting` VALUES ('24', 'thumb_height', '100');
INSERT INTO `sx_setting` VALUES ('24', 'thumb_width', '100');
INSERT INTO `sx_setting` VALUES ('24', 'template_message', '');
INSERT INTO `sx_setting` VALUES ('24', 'template_my', '');
INSERT INTO `sx_setting` VALUES ('24', 'template_search', '');
INSERT INTO `sx_setting` VALUES ('24', 'template_show', '');
INSERT INTO `sx_setting` VALUES ('24', 'template_list', '');
INSERT INTO `sx_setting` VALUES ('24', 'template_index', '');
INSERT INTO `sx_setting` VALUES ('1', 'page_video', '3');
INSERT INTO `sx_setting` VALUES ('1', 'page_photo', '6');
INSERT INTO `sx_setting` VALUES ('23', 'credit_refresh', '1');
INSERT INTO `sx_setting` VALUES ('23', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('23', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('23', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('6', 'max_width', '900');
INSERT INTO `sx_setting` VALUES ('6', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('6', 'stickfee', '0');
INSERT INTO `sx_setting` VALUES ('6', 'level', '');
INSERT INTO `sx_setting` VALUES ('6', 'publishfee', '10');
INSERT INTO `sx_setting` VALUES ('6', 'fulltext', '0');
INSERT INTO `sx_setting` VALUES ('6', 'split', '0');
INSERT INTO `sx_setting` VALUES ('6', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('6', 'save_remotepic', '0');
INSERT INTO `sx_setting` VALUES ('6', 'clear_link', '0');
INSERT INTO `sx_setting` VALUES ('23', 'message_ask', '请问我这个地方有加盟商了吗？|我想加盟，请来电话告诉我具体细节。|初步打算加盟贵公司，请寄资料。|请问贵公司哪里有样板店或直营店？|想了解加盟细节，请尽快寄一份资料。 ');
INSERT INTO `sx_setting` VALUES ('13', 'captcha_message', '2');
INSERT INTO `sx_setting` VALUES ('13', 'question_message', '2');
INSERT INTO `sx_setting` VALUES ('13', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('13', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('13', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('13', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('13', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('13', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('13', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('13', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('13', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('13', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('13', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('13', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('13', 'credit_refresh', '1');
INSERT INTO `sx_setting` VALUES ('5', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('5', 'group_contact', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('5', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('5', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('5', 'group_index', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('5', 'seo_description_show', '');
INSERT INTO `sx_setting` VALUES ('5', 'seo_keywords_show', '');
INSERT INTO `sx_setting` VALUES ('5', 'seo_title_show', '{内容标题}{分隔符}{分类名称}{模块名称}{分隔符}{网站名称}');
INSERT INTO `sx_setting` VALUES ('5', 'seo_description_list', '');
INSERT INTO `sx_setting` VALUES ('5', 'seo_keywords_list', '');
INSERT INTO `sx_setting` VALUES ('24', 'captcha_message', '2');
INSERT INTO `sx_setting` VALUES ('24', 'question_message', '2');
INSERT INTO `sx_setting` VALUES ('24', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('24', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('24', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('24', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('24', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('24', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('24', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('24', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('24', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('24', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('24', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('24', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('24', 'credit_refresh', '1');
INSERT INTO `sx_setting` VALUES ('6', 'keylink', '0');
INSERT INTO `sx_setting` VALUES ('6', 'price_ask', '请您发一份比较详细的产品规格说明，谢谢！|请问您对此产品是长期有需求吗？|请问您对此产品有多大的需求量？');
INSERT INTO `sx_setting` VALUES ('6', 'fields', 'itemid,title,thumb,linkurl,style,catid,areaid,introduce,addtime,edittime,username,company,groupid,vip,qq,msn,ali,skype,validated,price');
INSERT INTO `sx_setting` VALUES ('21', 'htm_list_urlid', '0');
INSERT INTO `sx_setting` VALUES ('21', 'htm_list_prefix', '');
INSERT INTO `sx_setting` VALUES ('21', 'list_html', '0');
INSERT INTO `sx_setting` VALUES ('21', 'index_html', '0');
INSERT INTO `sx_setting` VALUES ('21', 'show_np', '1');
INSERT INTO `sx_setting` VALUES ('21', 'max_width', '550');
INSERT INTO `sx_setting` VALUES ('21', 'page_shits', '10');
INSERT INTO `sx_setting` VALUES ('21', 'page_srec', '10');
INSERT INTO `sx_setting` VALUES ('21', 'page_srecimg', '4');
INSERT INTO `sx_setting` VALUES ('21', 'page_srelate', '10');
INSERT INTO `sx_setting` VALUES ('21', 'page_lhits', '10');
INSERT INTO `sx_setting` VALUES ('21', 'page_lrec', '10');
INSERT INTO `sx_setting` VALUES ('21', 'page_lrecimg', '4');
INSERT INTO `sx_setting` VALUES ('pay-weixin', 'notify', '');
INSERT INTO `sx_setting` VALUES ('pay-weixin', 'percent', '1');
INSERT INTO `sx_setting` VALUES ('pay-chinabank', 'percent', '1');
INSERT INTO `sx_setting` VALUES ('oauth-netease', 'id', '');
INSERT INTO `sx_setting` VALUES ('oauth-netease', 'key', '');
INSERT INTO `sx_setting` VALUES ('oauth-taobao', 'key', '');
INSERT INTO `sx_setting` VALUES ('2', 'send_types', '不需要物流|平邮|EMS|顺丰快递|申通E物流|圆通速递|中通速递|宅急送|韵达快运|天天快递|联邦快递|汇通快运|华强物流|其它');
INSERT INTO `sx_setting` VALUES ('2', 'credit_less', '0');
INSERT INTO `sx_setting` VALUES ('2', 'credit_edit', '10');
INSERT INTO `sx_setting` VALUES ('2', 'credit_login', '1');
INSERT INTO `sx_setting` VALUES ('2', 'credit_user', '20');
INSERT INTO `sx_setting` VALUES ('2', 'credit_ip', '2');
INSERT INTO `sx_setting` VALUES ('2', 'credit_maxip', '50');
INSERT INTO `sx_setting` VALUES ('2', 'credit_charge', '1');
INSERT INTO `sx_setting` VALUES ('2', 'credit_add_credit', '2');
INSERT INTO `sx_setting` VALUES ('2', 'credit_del_credit', '5');
INSERT INTO `sx_setting` VALUES ('2', 'credit_add_news', '2');
INSERT INTO `sx_setting` VALUES ('2', 'credit_del_news', '5');
INSERT INTO `sx_setting` VALUES ('2', 'credit_add_page', '2');
INSERT INTO `sx_setting` VALUES ('2', 'credit_del_page', '5');
INSERT INTO `sx_setting` VALUES ('2', 'credit_buy', '30|100|500|1000');
INSERT INTO `sx_setting` VALUES ('2', 'credit_price', '5|10|45|85');
INSERT INTO `sx_setting` VALUES ('2', 'credit_exchange', '0');
INSERT INTO `sx_setting` VALUES ('2', 'ex_type', 'PW');
INSERT INTO `sx_setting` VALUES ('2', 'ex_host', 'localhost');
INSERT INTO `sx_setting` VALUES ('2', 'ex_user', 'root');
INSERT INTO `sx_setting` VALUES ('2', 'ex_pass', '');
INSERT INTO `sx_setting` VALUES ('2', 'ex_data', '');
INSERT INTO `sx_setting` VALUES ('2', 'ex_prex', '');
INSERT INTO `sx_setting` VALUES ('2', 'ex_fdnm', '');
INSERT INTO `sx_setting` VALUES ('2', 'ex_rate', '');
INSERT INTO `sx_setting` VALUES ('2', 'ex_name', '');
INSERT INTO `sx_setting` VALUES ('2', 'passport', '0');
INSERT INTO `sx_setting` VALUES ('2', 'passport_charset', 'gbk');
INSERT INTO `sx_setting` VALUES ('2', 'passport_url', '');
INSERT INTO `sx_setting` VALUES ('2', 'passport_key', '');
INSERT INTO `sx_setting` VALUES ('2', 'uc_api', '');
INSERT INTO `sx_setting` VALUES ('2', 'uc_ip', '');
INSERT INTO `sx_setting` VALUES ('2', 'uc_mysql', '1');
INSERT INTO `sx_setting` VALUES ('2', 'uc_dbhost', 'localhost');
INSERT INTO `sx_setting` VALUES ('2', 'uc_dbuser', '');
INSERT INTO `sx_setting` VALUES ('2', 'uc_dbpwd', '');
INSERT INTO `sx_setting` VALUES ('2', 'uc_dbname', '');
INSERT INTO `sx_setting` VALUES ('2', 'uc_dbpre', '');
INSERT INTO `sx_setting` VALUES ('2', 'uc_charset', 'utf8');
INSERT INTO `sx_setting` VALUES ('2', 'uc_appid', '');
INSERT INTO `sx_setting` VALUES ('2', 'uc_key', '');
INSERT INTO `sx_setting` VALUES ('2', 'uc_bbs', '1');
INSERT INTO `sx_setting` VALUES ('2', 'uc_bbspre', '');
INSERT INTO `sx_setting` VALUES ('2', 'oauth', '0');
INSERT INTO `sx_setting` VALUES ('9', 'group_talent', '7');
INSERT INTO `sx_setting` VALUES ('9', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('9', 'captcha_add', '2');
INSERT INTO `sx_setting` VALUES ('9', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('9', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('9', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('9', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('9', 'fee_view_resume', '0');
INSERT INTO `sx_setting` VALUES ('9', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('9', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('9', 'group_list', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('9', 'group_show', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('9', 'group_contact', '5,6,7');
INSERT INTO `sx_setting` VALUES ('9', 'group_search', '3,5,6,7');
INSERT INTO `sx_setting` VALUES ('9', 'group_apply', '5');
INSERT INTO `sx_setting` VALUES ('9', 'check_add_resume', '2');
INSERT INTO `sx_setting` VALUES ('9', 'captcha_add_resume', '2');
INSERT INTO `sx_setting` VALUES ('9', 'question_add_resume', '2');
INSERT INTO `sx_setting` VALUES ('9', 'fee_add_resume', '0');
INSERT INTO `sx_setting` VALUES ('9', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('9', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('9', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('9', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('9', 'credit_refresh', '1');
INSERT INTO `sx_setting` VALUES ('9', 'credit_add_resume', '2');
INSERT INTO `sx_setting` VALUES ('9', 'credit_del_resume', '5');
INSERT INTO `sx_setting` VALUES ('23', 'fields', 'itemid,title,thumb,linkurl,style,catid,areaid,introduce,addtime,edittime,username,company,groupid,vip,qq,msn,ali,skype,validated');
INSERT INTO `sx_setting` VALUES ('23', 'order', 'addtime desc');
INSERT INTO `sx_setting` VALUES ('23', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('23', 'introduce_length', '120');
INSERT INTO `sx_setting` VALUES ('23', 'thumb_height', '60');
INSERT INTO `sx_setting` VALUES ('23', 'thumb_width', '180');
INSERT INTO `sx_setting` VALUES ('23', 'template_message', '');
INSERT INTO `sx_setting` VALUES ('23', 'template_product', '');
INSERT INTO `sx_setting` VALUES ('23', 'template_my', '');
INSERT INTO `sx_setting` VALUES ('23', 'template_search', '');
INSERT INTO `sx_setting` VALUES ('23', 'template_show', '');
INSERT INTO `sx_setting` VALUES ('23', 'template_list', '');
INSERT INTO `sx_setting` VALUES ('23', 'template_index', '');
INSERT INTO `sx_setting` VALUES ('21', 'show_lcat', '1');
INSERT INTO `sx_setting` VALUES ('21', 'page_child', '6');
INSERT INTO `sx_setting` VALUES ('21', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('21', 'page_icat', '6');
INSERT INTO `sx_setting` VALUES ('21', 'show_icat', '1');
INSERT INTO `sx_setting` VALUES ('21', 'page_irecimg', '6');
INSERT INTO `sx_setting` VALUES ('21', 'page_ihits', '10');
INSERT INTO `sx_setting` VALUES ('21', 'page_islide', '3');
INSERT INTO `sx_setting` VALUES ('21', 'swfu', '2');
INSERT INTO `sx_setting` VALUES ('21', 'stickfee', '0');
INSERT INTO `sx_setting` VALUES ('21', 'publishfee', '25');
INSERT INTO `sx_setting` VALUES ('21', 'level', '');
INSERT INTO `sx_setting` VALUES ('21', 'fulltext', '1');
INSERT INTO `sx_setting` VALUES ('21', 'split', '0');
INSERT INTO `sx_setting` VALUES ('21', 'keylink', '1');
INSERT INTO `sx_setting` VALUES ('21', 'clear_link', '1');
INSERT INTO `sx_setting` VALUES ('21', 'save_remotepic', '1');
INSERT INTO `sx_setting` VALUES ('1', 'page_news', '5');
INSERT INTO `sx_setting` VALUES ('1', 'page_newsh', '1');
INSERT INTO `sx_setting` VALUES ('1', 'page_comnews', '5');
INSERT INTO `sx_setting` VALUES ('1', 'page_special', '1');
INSERT INTO `sx_setting` VALUES ('1', 'page_rank', '5');
INSERT INTO `sx_setting` VALUES ('1', 'page_group', '3');
INSERT INTO `sx_setting` VALUES ('1', 'page_price', '12');
INSERT INTO `sx_setting` VALUES ('1', 'page_quote', '5');
INSERT INTO `sx_setting` VALUES ('1', 'page_mall', '10');
INSERT INTO `sx_setting` VALUES ('1', 'page_sell', '10');
INSERT INTO `sx_setting` VALUES ('1', 'page_com', '20');
INSERT INTO `sx_setting` VALUES ('6', 'type', '求购|紧急求购|求购二手|寻求加工|寻求合作|招标');
INSERT INTO `sx_setting` VALUES ('6', 'order', 'addtime desc');
INSERT INTO `sx_setting` VALUES ('6', 'editor', 'Destoon');
INSERT INTO `sx_setting` VALUES ('6', 'introduce_length', '120');
INSERT INTO `sx_setting` VALUES ('6', 'thumb_height', '100');
INSERT INTO `sx_setting` VALUES ('6', 'thumb_width', '100');
INSERT INTO `sx_setting` VALUES ('6', 'template_price', '');
INSERT INTO `sx_setting` VALUES ('6', 'template_my', '');
INSERT INTO `sx_setting` VALUES ('6', 'template_search', '');
INSERT INTO `sx_setting` VALUES ('6', 'template_show', '');
INSERT INTO `sx_setting` VALUES ('6', 'template_list', '');
INSERT INTO `sx_setting` VALUES ('6', 'template_index', '');
INSERT INTO `sx_setting` VALUES ('1', 'page_trade', '10');
INSERT INTO `sx_setting` VALUES ('1', 'page_catalog', '1');
INSERT INTO `sx_setting` VALUES ('1', 'page_bigcat', '');
INSERT INTO `sx_setting` VALUES ('1', 'message_weixin', '0');
INSERT INTO `sx_setting` VALUES ('1', 'message_type', '1,2,3');
INSERT INTO `sx_setting` VALUES ('21', 'group_color', '6,7');
INSERT INTO `sx_setting` VALUES ('21', 'check_add', '2');
INSERT INTO `sx_setting` VALUES ('21', 'cat_property', '0');
INSERT INTO `sx_setting` VALUES ('21', 'fields', 'itemid,title,thumb,linkurl,style,catid,introduce,addtime,edittime,username,islink');
INSERT INTO `sx_setting` VALUES ('21', 'order', 'addtime desc');
INSERT INTO `sx_setting` VALUES ('21', 'editor', 'Default');
INSERT INTO `sx_setting` VALUES ('21', 'introduce_length', '120');
INSERT INTO `sx_setting` VALUES ('21', 'thumb_height', '90');
INSERT INTO `sx_setting` VALUES ('21', 'thumb_width', '120');
INSERT INTO `sx_setting` VALUES ('21', 'template_my', '');
INSERT INTO `sx_setting` VALUES ('21', 'template_search', '');
INSERT INTO `sx_setting` VALUES ('21', 'template_show', '');
INSERT INTO `sx_setting` VALUES ('21', 'template_list', '');
INSERT INTO `sx_setting` VALUES ('21', 'template_index', '');
INSERT INTO `sx_setting` VALUES ('21', 'question_add', '2');
INSERT INTO `sx_setting` VALUES ('21', 'fee_mode', '1');
INSERT INTO `sx_setting` VALUES ('21', 'fee_currency', 'money');
INSERT INTO `sx_setting` VALUES ('21', 'fee_add', '0');
INSERT INTO `sx_setting` VALUES ('21', 'fee_view', '0');
INSERT INTO `sx_setting` VALUES ('21', 'fee_period', '0');
INSERT INTO `sx_setting` VALUES ('21', 'fee_back', '0');
INSERT INTO `sx_setting` VALUES ('21', 'pre_view', '500');
INSERT INTO `sx_setting` VALUES ('21', 'credit_add', '2');
INSERT INTO `sx_setting` VALUES ('21', 'credit_del', '5');
INSERT INTO `sx_setting` VALUES ('21', 'credit_color', '100');
INSERT INTO `sx_setting` VALUES ('1', 'message_time', '60');
INSERT INTO `sx_setting` VALUES ('1', 'message_email', '0');
INSERT INTO `sx_setting` VALUES ('1', 'message_group', '6,7');
INSERT INTO `sx_setting` VALUES ('1', 'mail_log', '1');
INSERT INTO `sx_setting` VALUES ('1', 'mail_name', '中宁县民间借贷登记服务中心');
INSERT INTO `sx_setting` VALUES ('1', 'mail_sender', 'znmjjd@sina.com');
INSERT INTO `sx_setting` VALUES ('1', 'mail_sign', '中宁县民间借贷登记服务中心');
INSERT INTO `sx_setting` VALUES ('1', 'smtp_pass', 'znmjjd666888');
INSERT INTO `sx_setting` VALUES ('1', 'smtp_user', 'znmjjd@sina.com');
INSERT INTO `sx_setting` VALUES ('1', 'smtp_auth', '1');
INSERT INTO `sx_setting` VALUES ('1', 'smtp_port', '25');
INSERT INTO `sx_setting` VALUES ('1', 'smtp_host', 'smtp.sina.com');
INSERT INTO `sx_setting` VALUES ('1', 'mail_delimiter', '1');
INSERT INTO `sx_setting` VALUES ('1', 'mail_type', 'smtp');
INSERT INTO `sx_setting` VALUES ('1', 'max_image', '800');
INSERT INTO `sx_setting` VALUES ('1', 'thumb_title', '0');
INSERT INTO `sx_setting` VALUES ('1', 'thumb_album', '1');
INSERT INTO `sx_setting` VALUES ('1', 'middle_h', '180');
INSERT INTO `sx_setting` VALUES ('1', 'middle_w', '240');
INSERT INTO `sx_setting` VALUES ('1', 'water_middle', '0');
INSERT INTO `sx_setting` VALUES ('1', 'water_com', '1');
INSERT INTO `sx_setting` VALUES ('1', 'gif_ani', '1');
INSERT INTO `sx_setting` VALUES ('1', 'bmp_jpg', '1');
INSERT INTO `sx_setting` VALUES ('1', 'water_pos', '9');
INSERT INTO `sx_setting` VALUES ('1', 'water_min_wh', '180');
INSERT INTO `sx_setting` VALUES ('1', 'water_margin', '10');
INSERT INTO `sx_setting` VALUES ('1', 'water_type', '0');
INSERT INTO `sx_setting` VALUES ('1', 'water_fontcolor', '#000000');
INSERT INTO `sx_setting` VALUES ('1', 'water_fontsize', '20');
INSERT INTO `sx_setting` VALUES ('1', 'water_font', 'simhei.ttf');
INSERT INTO `sx_setting` VALUES ('1', 'water_text', 'www.destoon.com');
INSERT INTO `sx_setting` VALUES ('1', 'water_jpeg_quality', '90');
INSERT INTO `sx_setting` VALUES ('1', 'water_transition', '60');
INSERT INTO `sx_setting` VALUES ('1', 'water_mark', 'watermark.png');
INSERT INTO `sx_setting` VALUES ('1', 'file_my', 'my.php');
INSERT INTO `sx_setting` VALUES ('1', 'file_login', 'login.php');
INSERT INTO `sx_setting` VALUES ('1', 'file_register', 'register.php');
INSERT INTO `sx_setting` VALUES ('1', 'defend_proxy', '0');
INSERT INTO `sx_setting` VALUES ('1', 'check_referer', '1');
INSERT INTO `sx_setting` VALUES ('1', 'safe_domain', '');
INSERT INTO `sx_setting` VALUES ('1', 'defend_cc', '0');
INSERT INTO `sx_setting` VALUES ('1', 'defend_reload', '0');
INSERT INTO `sx_setting` VALUES ('1', 'uploaddir', 'Ym/d');
INSERT INTO `sx_setting` VALUES ('1', 'uploadsize', '2048000');
INSERT INTO `sx_setting` VALUES ('1', 'uploadtype', 'jpg|gif|png|rar|zip|pdf|doc|xls|ppt|flv|mp4|docx|ppts|xlsx|jpeg');
INSERT INTO `sx_setting` VALUES ('1', 'uploadlog', '1');
INSERT INTO `sx_setting` VALUES ('1', 'anticopy', '0');
INSERT INTO `sx_setting` VALUES ('1', 'ip_login', '0');
INSERT INTO `sx_setting` VALUES ('1', 'login_log', '0');
INSERT INTO `sx_setting` VALUES ('1', 'admin_log', '0');
INSERT INTO `sx_setting` VALUES ('1', 'admin_online', '1');
INSERT INTO `sx_setting` VALUES ('1', 'md5_pass', '1');
INSERT INTO `sx_setting` VALUES ('1', 'captcha_admin', '0');
INSERT INTO `sx_setting` VALUES ('1', 'captcha_cn', '0');
INSERT INTO `sx_setting` VALUES ('1', 'captcha_chars', '');
INSERT INTO `sx_setting` VALUES ('1', 'check_hour', '');
INSERT INTO `sx_setting` VALUES ('1', 'admin_hour', '');
INSERT INTO `sx_setting` VALUES ('1', 'admin_ip', '');
INSERT INTO `sx_setting` VALUES ('1', 'admin_area', '');
INSERT INTO `sx_setting` VALUES ('1', 'remote_url', '');
INSERT INTO `sx_setting` VALUES ('1', 'ftp_path', '');
INSERT INTO `sx_setting` VALUES ('1', 'ftp_save', '0');
INSERT INTO `sx_setting` VALUES ('1', 'ftp_pasv', '0');
INSERT INTO `sx_setting` VALUES ('1', 'ftp_ssl', '0');
INSERT INTO `sx_setting` VALUES ('1', 'ftp_pass', '');
INSERT INTO `sx_setting` VALUES ('1', 'ftp_user', '');
INSERT INTO `sx_setting` VALUES ('1', 'ftp_port', '21');
INSERT INTO `sx_setting` VALUES ('1', 'ftp_host', '');
INSERT INTO `sx_setting` VALUES ('1', 'ftp_remote', '0');
INSERT INTO `sx_setting` VALUES ('1', 'max_len', '20000');
INSERT INTO `sx_setting` VALUES ('1', 'schcate_limit', '10');
INSERT INTO `sx_setting` VALUES ('1', 'pagesize', '20');
INSERT INTO `sx_setting` VALUES ('1', 'pushtime', '0');
INSERT INTO `sx_setting` VALUES ('1', 'online', '1200');
INSERT INTO `sx_setting` VALUES ('1', 'search_limit', '1');
INSERT INTO `sx_setting` VALUES ('1', 'max_kw', '30');
INSERT INTO `sx_setting` VALUES ('1', 'min_kw', '3');
INSERT INTO `sx_setting` VALUES ('1', 'search_check_kw', '0');
INSERT INTO `sx_setting` VALUES ('1', 'search_kw', '1');
INSERT INTO `sx_setting` VALUES ('1', 'save_draft', '0');
INSERT INTO `sx_setting` VALUES ('1', 'search_tips', '1');
INSERT INTO `sx_setting` VALUES ('1', 'anti_spam', '1');
INSERT INTO `sx_setting` VALUES ('1', 'log_credit', '1');
INSERT INTO `sx_setting` VALUES ('1', 'lazy', '1');
INSERT INTO `sx_setting` VALUES ('1', 'pages_mode', '0');
INSERT INTO `sx_setting` VALUES ('1', 'gzip_enable', '0');
INSERT INTO `sx_setting` VALUES ('1', 'cache_hits', '0');
INSERT INTO `sx_setting` VALUES ('1', 'cache_search', '0');
INSERT INTO `sx_setting` VALUES ('1', 'task_item', '7200');
INSERT INTO `sx_setting` VALUES ('1', 'task_list', '1800');
INSERT INTO `sx_setting` VALUES ('1', 'task_index', '600');
INSERT INTO `sx_setting` VALUES ('1', 'log_404', '0');
INSERT INTO `sx_setting` VALUES ('1', 'pcharset', '0');
INSERT INTO `sx_setting` VALUES ('1', 'rewrite', '0');
INSERT INTO `sx_setting` VALUES ('1', 'com_www', '0');
INSERT INTO `sx_setting` VALUES ('1', 'index', 'index');
INSERT INTO `sx_setting` VALUES ('1', 'file_ext', 'html');
INSERT INTO `sx_setting` VALUES ('1', 'index_html', '1');
INSERT INTO `sx_setting` VALUES ('1', 'seo_description', '中宁县民间借贷登记服务中心');
INSERT INTO `sx_setting` VALUES ('1', 'seo_keywords', '中宁县民间借贷登记服务中心');
INSERT INTO `sx_setting` VALUES ('1', 'seo_title', '中宁县民间借贷登记服务中心');
INSERT INTO `sx_setting` VALUES ('1', 'seo_delimiter', '-');
INSERT INTO `sx_setting` VALUES ('1', 'trade_nu', 'notify.php');
INSERT INTO `sx_setting` VALUES ('1', 'trade_tp', '0');
INSERT INTO `sx_setting` VALUES ('1', 'trade_ac', '');
INSERT INTO `sx_setting` VALUES ('1', 'trade_pw', '');
INSERT INTO `sx_setting` VALUES ('1', 'trade_hm', 'http://www.alipay.com/');
INSERT INTO `sx_setting` VALUES ('1', 'trade_id', '');
INSERT INTO `sx_setting` VALUES ('1', 'trade_nm', '支付宝');
INSERT INTO `sx_setting` VALUES ('1', 'trade', '');
INSERT INTO `sx_setting` VALUES ('1', 'im_skype', '0');
INSERT INTO `sx_setting` VALUES ('1', 'im_msn', '0');
INSERT INTO `sx_setting` VALUES ('1', 'im_ali', '1');
INSERT INTO `sx_setting` VALUES ('1', 'im_qq', '1');
INSERT INTO `sx_setting` VALUES ('1', 'im_web', '1');
INSERT INTO `sx_setting` VALUES ('1', 'admin_left', '188');
INSERT INTO `sx_setting` VALUES ('1', 'credit_unit', '点');
INSERT INTO `sx_setting` VALUES ('1', 'credit_name', '积分');
INSERT INTO `sx_setting` VALUES ('1', 'money_sign', '￥');
INSERT INTO `sx_setting` VALUES ('1', 'money_unit', '元');
INSERT INTO `sx_setting` VALUES ('1', 'money_name', '资金');
INSERT INTO `sx_setting` VALUES ('1', 'city_ip', '1');
INSERT INTO `sx_setting` VALUES ('1', 'address', '中宁县宁安东街雅泰城市华园31、32#营业房');
INSERT INTO `sx_setting` VALUES ('1', 'city', '1');
INSERT INTO `sx_setting` VALUES ('1', 'companyintro', '中宁县民间借贷登记服务中心');
INSERT INTO `sx_setting` VALUES ('1', 'companyy', '37.499126');
INSERT INTO `sx_setting` VALUES ('1', 'invest_users', '0');
INSERT INTO `sx_setting` VALUES ('1', 'invest_name', '李翊煊,贺建辉,史韵,王志芮');
INSERT INTO `sx_setting` VALUES ('1', 'companyx', '105.692818');
INSERT INTO `sx_setting` VALUES ('1', 'company', '中宁县民间借贷登记服务中心');
INSERT INTO `sx_setting` VALUES ('1', 'invest_phone', '15909559866,13519253521,13639588261,18465153520');
INSERT INTO `sx_setting` VALUES ('1', 'invest_all_money', '0');
INSERT INTO `sx_setting` VALUES ('1', 'invest_rate', '34570');
INSERT INTO `sx_setting` VALUES ('1', 'time_nums', '10');
INSERT INTO `sx_setting` VALUES ('1', 'fuwu_fee', '3');
INSERT INTO `sx_setting` VALUES ('1', 'success_money', '10100');
INSERT INTO `sx_setting` VALUES ('1', 'success_nums', '30');
INSERT INTO `sx_setting` VALUES ('1', 'invest_money', '345701');
INSERT INTO `sx_setting` VALUES ('1', 'close_reason', '网站维护中，请稍候访问...');
INSERT INTO `sx_setting` VALUES ('1', 'memberlogo', 'http://03.8660.org/file/upload/201605/01/141910710.png');
INSERT INTO `sx_setting` VALUES ('1', 'close', '0');
INSERT INTO `sx_setting` VALUES ('1', 'icpno', '粤ICP备10231287号-8');
INSERT INTO `sx_setting` VALUES ('1', 'telephone', '0955-5716799');
INSERT INTO `sx_setting` VALUES ('1', 'sitename', '中宁县民间借贷登记服务中心');
INSERT INTO `sx_setting` VALUES ('1', 'logo', 'http://03.8660.org/file/upload/201604/22/2041033017.png');
INSERT INTO `sx_setting` VALUES ('1', 'copyright', 'Copyright © 2015 中宁普惠金融 All rights reserved.');
INSERT INTO `sx_style` VALUES ('2', '0', '深蓝模板', 'blue', 'homepage', 'Destoon.COM', ',6,7,', '0', 'money', '0', '0', '1', '1453453275', 'admin', '1453453275', '0');
INSERT INTO `sx_style` VALUES ('3', '0', '绿色模板', 'green', 'homepage', 'Destoon.COM', ',6,7,', '0', 'money', '0', '0', '0', '1453453275', 'admin', '1453453275', '0');
INSERT INTO `sx_style` VALUES ('4', '0', '紫色模板', 'purple', 'homepage', 'Destoon.COM', ',6,7,', '0', 'credit', '0', '5', '2', '1453453275', 'admin', '1453453275', '0');
INSERT INTO `sx_style` VALUES ('5', '0', '橙色模板', 'orange', 'homepage', 'Destoon.COM', ',6,7,', '0', 'credit', '120', '0', '1', '1453453275', 'admin', '1453453275', '0');
INSERT INTO `sx_style` VALUES ('6', '99', '默认模板', 'default', 'homepage', 'Destoon.COM', ',6,7,', '0', 'money', '0', '0', '0', '1453453275', 'admin', '1453453275', '0');
INSERT INTO `sx_type` VALUES ('1', '0', '0', 'fa', '', 'link', '1');
INSERT INTO `sx_upload_0` VALUES ('1', '69c8e6ebe418ac81be9a8def05d739eb', '23', '0', 'http://shixun.com/file/upload/201602/24/223047680.jpg', '4426', 'jpg', 'thumb', '180', '60', '1456324247', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('3', '0a2fd1aa34c490cfd487bbfeaeca95f0', '23', '0', 'http://shixun.com/file/upload/201602/26/223712240.jpg', '4426', 'jpg', 'thumb', '180', '60', '1456497432', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('4', '9c38e31bbe6509ad4726f9a836d3fcac', '23', '0', 'http://shixun.com/file/upload/201602/26/223917910.jpg', '6113', 'jpg', 'thumb', '180', '60', '1456497557', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('5', 'b10f91399197dfe837aedb4dea3e3063', '23', '0', 'http://shixun.com/file/upload/201602/26/223958690.jpg', '6113', 'jpg', 'thumb', '180', '60', '1456497598', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('6', '07df1e9f0262d0f9b6ca7563e4ec8147', '23', '0', 'http://shixun.com/file/upload/201602/26/224358190.jpg', '6113', 'jpg', 'thumb', '180', '60', '1456497838', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('7', 'edfc50d2bf22d5b5926169d7e022a23a', '23', '3', 'http://shixun.com/file/upload/201602/26/224550700.jpg', '6113', 'jpg', 'thumb', '180', '60', '1456497950', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('14', 'ca310f43039da7f040d44d5bad6f9955', '24', '1', 'http://shixun.com/file/upload/201602/28/184014170.jpg', '5229', 'jpg', 'thumb', '100', '100', '1456656014', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('15', '01b02e989bbfc4819e910167bc2f87f5', '24', '2', 'http://shixun.com/file/upload/201602/28/184748380.jpg', '3217', 'jpg', 'thumb', '100', '100', '1456656468', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('16', '3e81620d1c935402da7b7ad3e8984a3d', '3', '0', 'http://shixun.com/file/upload/201602/28/190613330.jpg', '229771', 'jpg', 'thumb', '728', '333', '1456657573', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('17', '225bd753ea0b7e4c87d7c84a40c619f7', '3', '0', 'http://shixun.com/file/upload/201602/28/190637900.jpg', '229771', 'jpg', 'thumb', '728', '333', '1456657597', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('31', '5348a666f0d8175af39f43ef4c064e08', '13', '4', 'http://shixun.com/file/upload/201603/01/145028220.jpg', '5570', 'jpg', 'thumb', '180', '60', '1456815028', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('32', 'e5430c2f68c4dd0f29757ff0477d65e6', '3', '0', 'http://shixun.com/file/upload/201603/01/162129920.jpg', '21818', 'jpg', 'thumb', '1100', '50', '1456820489', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('33', 'e3336f7b5c96cf26f38ba2c20f432c14', '23', '4', 'http://shixun.com/file/upload/201603/02/145745550.jpg', '3900', 'jpg', 'thumb', '180', '60', '1456901865', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('34', 'ba69027909a684ba839a7b83101f01a1', '13', '7', 'http://shixun.com/file/upload/201603/02/151146460.jpg', '5936', 'jpg', 'thumb', '180', '60', '1456902706', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('35', '4c318871aa6af8ae1e64b20dc203e6bf', '13', '8', 'http://shixun.com/file/upload/201603/02/152832330.jpg', '5936', 'jpg', 'thumb', '180', '60', '1456903712', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('56', '5b151b58f844b184a762ec21a103f696', '2', '11', 'http://shixun.com/file/upload/201603/06/1018524610.jpg', '229771', 'jpg', 'thumb', '728', '333', '1457230732', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('59', '30b1e5ce1c59f68c28039a61cc2c3be8', '2', '6', 'http://shixun.com/file/upload/201603/06/1205101410.jpg', '229771', 'jpg', 'thumb', '728', '333', '1457237110', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('60', '91fc74fcf223bc3d0db7469b4efd494b', '2', '9', 'http://shixun.com/file/upload/201603/06/1234172610.jpg', '229771', 'jpg', 'thumb', '728', '333', '1457238857', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('47', '422cb77ac9fdcc1a8317f8eb4ac2ce1a', '2', '5', 'http://shixun.com/file/upload/201603/05/2334486610.jpg', '229771', 'jpg', 'thumb', '728', '333', '1457192088', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('48', '149e3ff828348b8aef8aa2f8310e4cb1', '2', '6', 'http://shixun.com/file/upload/201603/05/2336469710.jpg', '229771', 'jpg', 'thumb', '728', '333', '1457192206', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('73', '23d47443183249ad538d8051d8898577', '2', '7', 'http://shixun.com/file/upload/201603/06/2244149510.jpg', '229771', 'jpg', 'thumb', '728', '333', '1457275454', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('43', '731553c8b371a64f931bb01957b8a698', '2', '0', 'http://shixun.com/file/upload/201603/04/2339534310.jpg', '9508', 'jpg', 'thumb', '150', '150', '1457105993', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('55', '66fba8b4bb54837b01f35e3660c76ba0', '2', '10', 'http://shixun.com/file/upload/201603/06/1001256910.jpg', '229771', 'jpg', 'thumb', '728', '333', '1457229685', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('61', '0815921cb91985d17a20a1f3a982d9ee', '2', '6', 'http://shixun.com/file/upload/201603/06/1334005610.jpg', '229771', 'jpg', 'thumb', '728', '333', '1457242440', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('69', 'fce206bae34c2685fbcf8ad71b42d750', '2', '9', 'http://shixun.com/file/upload/201603/06/2124101310.jpg', '229771', 'jpg', 'thumb', '728', '333', '1457270650', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('70', 'e43db20503229eb4edb5184b44adc9f3', '2', '10', 'http://shixun.com/file/upload/201603/06/2125416810.jpg', '5511', 'jpg', 'thumb', '220', '110', '1457270741', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('71', '87925b894edcb57c62b2be861e3130b3', '2', '11', 'http://shixun.com/file/upload/201603/06/2126559110.jpg', '22299', 'jpg', 'thumb', '285', '285', '1457270815', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('65', 'b8f6d6777a77d6320f02c99971966492', '2', '9', 'http://shixun.com/file/upload/201603/06/1630265210.jpg', '5511', 'jpg', 'thumb', '220', '110', '1457253026', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('72', 'a162e23618b22a62d09b5f521598c5dc', '2', '11', 'http://shixun.com/file/upload/201603/06/2134178910.jpg', '229771', 'jpg', 'thumb', '728', '333', '1457271257', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('74', '01e8a195cdfbba5507fb67c8122ede13', '2', '12', 'http://shixun.com/file/upload/201603/06/2319372110.jpg', '5511', 'jpg', 'thumb', '220', '110', '1457277577', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('75', 'b77db337885b187fddc68daf8eac9334', '2', '9', 'http://shixun.com/file/upload/201603/08/0943481510.jpg', '51839', 'jpg', 'thumb', '285', '285', '1457401428', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('76', '949e34c5673f8d50d686c96e1288afa0', '2', '10', 'http://shixun.com/file/upload/201603/08/0945024710.jpg', '93432', 'jpg', 'thumb', '285', '285', '1457401502', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('77', '1546de39ec351bf5ea30d040a1c18d17', '2', '11', 'http://shixun.com/file/upload/201603/08/0945472110.jpg', '70939', 'jpg', 'thumb', '285', '285', '1457401547', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('78', 'd29fa6d8f06954af49ac415402fab045', '2', '12', 'http://shixun.com/file/upload/201603/08/0946136210.jpg', '73634', 'jpg', 'thumb', '285', '285', '1457401573', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('86', 'a524ba0d3082e519c75acdbe519644c2', '6', '13', 'http://shixun.com/file/upload/201603/08/1155462210.jpg', '52983', 'jpg', 'thumb', '285', '285', '1457409346', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('84', 'c549cb227fab0d42309dc2add92e0f56', '3', '0', 'http://shixun.com/file/upload/201603/08/1118453410.jpg', '56202', 'jpg', 'file', '285', '285', '1457407125', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('109', '241dd1cc41032ed030ff035ad94e7f7e', '2', '11', 'http://shixun.com/file/upload/201603/08/1439112710.jpg', '106115', 'jpg', 'thumb', '285', '285', '1457419151', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('105', '2dd6b368812dfea475694bf9b9680a0f', '23', '10', 'http://shixun.com/file/upload/201603/08/1402552310.jpg', '176649', 'jpg', 'thumb', '1920', '400', '1457416975', 'shixun03d98', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('114', 'a47b5861b83ba7f76da093bca44074d4', '1', '0', 'http://zhongning.com/file/upload/201604/23/105258590.png', '13482', 'png', 'thumb', '180', '60', '1461379978', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('112', '745d47e9bf503e7251caef92e4197d79', '1', '0', 'http://shixun.com/file/upload/201603/13/103504960.jpg', '2848', 'jpg', 'thumb', '180', '60', '1457836504', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('113', 'b1c7aa885876e8b5aa39a82ad7c93675', '21', '27', 'http://zhongning.com/file/upload/201604/18/110724730.jpg', '46771', 'jpg', 'thumb', '260', '220', '1460948844', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('115', 'd59f275004cf4281243a56ff557f1f59', '1', '0', 'http://zhongning.com/file/upload/201604/23/105318280.png', '26734', 'png', 'thumb', '419', '71', '1461379998', '', '127.0.0.1');
INSERT INTO `sx_upload_0` VALUES ('116', '9e79c08274b5775a4af757d84dfdc619', '3', '0', 'http://03.8660.org/file/upload/201604/25/141201170.jpg', '642285', 'jpg', 'thumb', '1920', '402', '1461564721', '', '183.6.143.173');
INSERT INTO `sx_upload_0` VALUES ('117', '3dd3a71ba4f2e15a9ea9239dd2d19e03', '3', '0', 'http://03.8660.org/file/upload/201604/25/141229100.jpg', '535649', 'jpg', 'thumb', '1920', '400', '1461564749', '', '183.6.143.173');
INSERT INTO `sx_upload_0` VALUES ('118', 'baadb01a5dac0049b0feb395b1e857c4', '3', '0', 'http://03.8660.org/file/upload/201604/25/141304780.jpg', '833580', 'jpg', 'thumb', '1920', '401', '1461564784', '', '183.6.143.173');
INSERT INTO `sx_upload_0` VALUES ('119', 'e093ecb651ac4cc190a2fb631e9ed788', '3', '0', 'http://03.8660.org/file/upload/201604/25/141329790.jpg', '376489', 'jpg', 'thumb', '1920', '492', '1461564809', '', '183.6.143.173');
INSERT INTO `sx_upload_0` VALUES ('120', '9a5d8d51a5250cb11d9e0d51da2cbc3a', '3', '0', 'http://03.8660.org/file/upload/201604/25/142354990.jpg', '833580', 'jpg', 'thumb', '1920', '401', '1461565434', '', '183.6.143.173');
INSERT INTO `sx_upload_0` VALUES ('121', 'ea1a8fe22bd0ead1e54497ab9d0ed00c', '3', '0', 'http://03.8660.org/file/upload/201604/25/145933760.jpg', '347692', 'jpg', 'file', '1920', '550', '1461567573', '', '183.6.143.173');
INSERT INTO `sx_upload_0` VALUES ('122', 'b673d7c6e45d753aeb5553f3de337d08', '3', '0', 'http://03.8660.org/file/upload/201604/26/093024140.jpg', '200896', 'jpg', 'thumb', '1920', '400', '1461634224', '', '183.6.143.173');
INSERT INTO `sx_upload_0` VALUES ('123', '63743cdbc91062b93a14aa7b2706876c', '3', '0', 'http://03.8660.org/file/upload/201604/26/112456940.jpg', '88404', 'jpg', 'file', '1920', '550', '1461641096', '', '183.6.143.173');
INSERT INTO `sx_upload_0` VALUES ('124', '6c6a9560472e514a53b967f2cafdddde', '3', '0', 'http://03.8660.org/file/upload/201605/01/130304810.jpg', '198168', 'jpg', 'file', '720', '350', '1462078984', '', '113.67.139.155');
INSERT INTO `sx_upload_0` VALUES ('125', 'd4294aec1ca3010f7024c6bec6a03efd', '3', '0', 'http://03.8660.org/file/upload/201605/01/130326610.jpg', '140286', 'jpg', 'file', '720', '350', '1462079006', '', '113.67.139.155');
INSERT INTO `sx_upload_0` VALUES ('126', '25a25e5e4921d58ec5d213cc8f2b0fc3', '3', '0', 'http://03.8660.org/file/upload/201605/01/130344630.jpg', '133959', 'jpg', 'file', '720', '350', '1462079024', '', '113.67.139.155');
INSERT INTO `sx_upload_0` VALUES ('127', 'fd45fcf4066b4635a5828f356d31cbba', '3', '0', 'http://03.8660.org/file/upload/201605/01/130432950.jpg', '192755', 'jpg', 'thumb', '720', '350', '1462079072', '', '113.67.139.155');
INSERT INTO `sx_upload_0` VALUES ('128', '1baa0912bcac289bf7e5f6f894b16195', '3', '0', 'http://03.8660.org/file/upload/201605/01/130527940.jpg', '286032', 'jpg', 'thumb', '720', '350', '1462079127', '', '113.67.139.155');
INSERT INTO `sx_upload_0` VALUES ('129', '59df487d6c069848c568893b51e315d8', '3', '0', 'http://03.8660.org/file/upload/201605/01/130621360.jpg', '22475', 'jpg', 'thumb', '720', '199', '1462079181', '', '113.67.139.155');
INSERT INTO `sx_upload_0` VALUES ('130', '9023bbb588c5cff5ff125bb547f4f851', '3', '0', 'http://03.8660.org/file/upload/201605/01/130720320.jpg', '268139', 'jpg', 'thumb', '720', '350', '1462079240', '', '113.67.139.155');
INSERT INTO `sx_upload_0` VALUES ('131', 'df762c54b4f72551ab97ebde56c81fd4', '3', '0', 'http://03.8660.org/file/upload/201605/01/130817380.jpg', '160022', 'jpg', 'thumb', '720', '350', '1462079297', '', '113.67.139.155');
INSERT INTO `sx_upload_0` VALUES ('132', '5baf4387f7d8a0121383753323dfccc1', '1', '0', 'http://03.8660.org/file/upload/201605/01/141822650.png', '1910', 'png', 'thumb', '143', '143', '1462083502', '', '113.67.139.155');
INSERT INTO `sx_upload_0` VALUES ('133', '364dd0dd6b7c1cfc0d28a9e2f13b018c', '1', '0', 'http://03.8660.org/file/upload/201605/01/141910710.png', '1567', 'png', 'thumb', '68', '68', '1462083550', '', '113.67.139.155');
INSERT INTO `sx_upload_1` VALUES ('1', '2b2bd654d6fe499e30fe20c2d1e62446', '2', '16', 'http://shixun.com/file/upload/201603/13/222755991.jpg', '22299', 'jpg', 'thumb', '285', '285', '1457879275', 'shixun', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('2', '184fc5e9cfc4844964465159183e56ef', '2', '0', 'http://shixun.com/file/upload/201603/17/232758441.jpg', '9508', 'jpg', 'thumb', '150', '150', '1458228478', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('3', 'f67de306b641da313050f08e5e0408cf', '2', '18', 'http://shixun.com/file/upload/201603/25/133831491.png', '703', 'png', 'thumb', '50', '50', '1458884311', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('4', '121bf1786878637c456aa19cd6a3efdc', '2', '19', 'http://shixun.com/file/upload/201603/25/134151931.png', '703', 'png', 'thumb', '50', '50', '1458884511', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('5', '70dfb39e3bab6a7da778a67a915e0e67', '2', '20', 'http://shixun.com/file/upload/201603/25/134349721.png', '703', 'png', 'thumb', '50', '50', '1458884629', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('6', 'c96ed139fadb9dab56a8d1e693a140af', '2', '21', 'http://shixun.com/file/upload/201603/25/145249801.png', '703', 'png', 'thumb', '50', '50', '1458888769', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('7', '21853f7678d2005fdb94fdc148c4490c', '2', '22', 'http://shixun.com/file/upload/201604/05/145730141.png', '37347', 'png', 'thumb', '145', '168', '1459839450', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('8', '7ad414493053c0224b28a28f3c154465', '2', '23', 'http://shixun.com/file/upload/201604/05/150952671.png', '37347', 'png', 'thumb', '145', '168', '1459840192', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('9', 'fac88bffcc67788ce3d725f4e3e66971', '2', '24', 'http://shixun.com/file/upload/201604/05/151007971.png', '37347', 'png', 'thumb', '145', '168', '1459840207', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('10', '30b2abebc3b4d8034bb552813b092e73', '2', '25', 'http://shixun.com/file/upload/201604/05/151024961.png', '37347', 'png', 'thumb', '145', '168', '1459840224', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('24', '0f68d6f5e3cc3a6caa65b342a5cd4dd7', '2', '47', 'http://shixun.com/file/upload/201604/11/131915101.jpg', '51017', 'jpg', 'thumb', '295', '328', '1460351955', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('25', 'c8d9d5ce4802f98919946aab00d60593', '2', '48', 'http://shixun.com/file/upload/201604/11/132055751.jpg', '51017', 'jpg', 'thumb', '295', '328', '1460352055', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('29', 'fce3abbd77d3ca3ac39d03b99a045235', '2', '51', 'http://shixun.com/file/upload/201604/11/145146371.png', '627875', 'png', 'thumb', '573', '678', '1460357506', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('28', '1e4d3516f21dd57e6cf40da288d5b9ce', '2', '49', 'http://shixun.com/file/upload/201604/11/132322201.jpg', '51017', 'jpg', 'thumb', '295', '328', '1460352202', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('15', 'e89fad9a96b931869f0ae39cb6485160', '2', '45', 'http://shixun.com/file/upload/201604/11/131538741.jpg', '51017', 'jpg', 'thumb', '295', '328', '1460351738', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('31', 'cdfacbbc9abd2e38982d57ed91dbf37c', '2', '51', 'http://shixun.com/file/upload/201604/11/145158311.jpg', '87385', 'jpg', 'thumb', '285', '285', '1460357518', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('30', '03fb73edf3f4caca1f905d23ce062072', '2', '51', 'http://shixun.com/file/upload/201604/11/145154111.jpg', '35368', 'jpg', 'thumb', '307', '172', '1460357514', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('23', '2dfdb2529871a6a948a585b4bf570e1d', '2', '46', 'http://shixun.com/file/upload/201604/11/131828731.jpg', '51017', 'jpg', 'thumb', '295', '328', '1460351908', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('32', 'fd501457dd29b9f34905abd513d5fbce', '2', '51', 'http://shixun.com/file/upload/201604/11/145207461.jpg', '52983', 'jpg', 'thumb', '285', '285', '1460357527', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('33', 'a2e969766c3d2521c3681b98c6fc5481', '2', '51', 'http://shixun.com/file/upload/201604/11/145211591.jpg', '70939', 'jpg', 'thumb', '285', '285', '1460357531', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('34', '7a27e456c55f7a01e2c03607bf947857', '2', '51', 'http://shixun.com/file/upload/201604/11/145216981.jpg', '66397', 'jpg', 'thumb', '285', '285', '1460357536', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('35', '91e7c4195160b3c1f50dfdd7111217ee', '2', '51', 'http://shixun.com/file/upload/201604/11/145219601.jpg', '56202', 'jpg', 'thumb', '285', '285', '1460357539', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('36', '19c9ecf7bd53724cba4218dd15de8ebe', '2', '51', 'http://shixun.com/file/upload/201604/11/145225441.jpg', '73634', 'jpg', 'thumb', '285', '285', '1460357545', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('37', '4fad979102803dfd2a8d515edf2c0fb2', '2', '18', 'http://shixun.com/file/upload/201604/11/145900931.jpg', '52983', 'jpg', 'thumb', '285', '285', '1460357940', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('38', '57a023e1935d1fbea17ac509ffa70213', '2', '16', 'http://shixun.com/file/upload/201604/11/150808581.jpg', '56202', 'jpg', 'thumb', '285', '285', '1460358488', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('39', 'b63a2b084acb8c0b453dea0d976dab16', '2', '16', 'http://shixun.com/file/upload/201604/11/151321981.jpg', '56202', 'jpg', 'thumb', '285', '285', '1460358801', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('40', '7aa0c70482db287e06057eb7616f87dd', '2', '26', 'http://shixun.com/file/upload/201604/11/151556461.jpg', '56202', 'jpg', 'thumb', '285', '285', '1460358956', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('41', 'b284ae23966cc4a826c1faa4277d253a', '2', '22', 'http://shixun.com/file/upload/201604/11/151845461.jpg', '52983', 'jpg', 'thumb', '285', '285', '1460359125', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('42', 'b178708972981acab8e2b68d9b448bb1', '2', '26', 'http://shixun.com/file/upload/201604/11/152458191.jpg', '106115', 'jpg', 'thumb', '285', '285', '1460359498', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('43', '09cd28786eef956a5e0f92708024a84f', '2', '17', 'http://shixun.com/file/upload/201604/11/154145111.jpg', '56202', 'jpg', 'thumb', '285', '285', '1460360505', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('44', 'ba60de447529e99cca5381d95ca47f3c', '2', '17', 'http://shixun.com/file/upload/201604/11/154147341.jpg', '87385', 'jpg', 'thumb', '285', '285', '1460360507', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('45', 'c7d08ad9ffcf65dab082cc4bd5d6e74f', '2', '17', 'http://shixun.com/file/upload/201604/11/154152661.jpg', '73634', 'jpg', 'thumb', '285', '285', '1460360512', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('46', '7fe4a273207eaea0bf54bd88ab124aae', '2', '17', 'http://shixun.com/file/upload/201604/11/154155781.jpg', '70939', 'jpg', 'thumb', '285', '285', '1460360515', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('47', '4698a80e68a3882324516141a097f0cf', '2', '17', 'http://shixun.com/file/upload/201604/11/154158591.jpg', '76013', 'jpg', 'thumb', '285', '285', '1460360518', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('48', 'bb4e768b279b34dd108af2fab5c9151e', '2', '17', 'http://shixun.com/file/upload/201604/11/154201971.jpg', '93432', 'jpg', 'thumb', '285', '285', '1460360521', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('49', 'edbfb1e4bd7995faea7d5d3da4411f69', '2', '17', 'http://shixun.com/file/upload/201604/11/154204361.jpg', '70939', 'jpg', 'thumb', '285', '285', '1460360524', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('50', '0d111a1c803e774566049bee39cac760', '2', '17', 'http://shixun.com/file/upload/201604/11/154207681.jpg', '72884', 'jpg', 'thumb', '285', '285', '1460360527', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('51', '29dbcc5c76b413b370a4ba007d144497', '2', '52', 'http://shixun.com/file/upload/201604/12/091556231.jpg', '86437', 'jpg', 'thumb', '285', '285', '1460423756', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('69', '02f2aa859ce6d717f91990a8fbe3a0aa', '1', '0', 'http://shixun.com/file/upload/201604/12/170401121.jpg', '72434', 'jpg', 'thumb', '285', '285', '1460451841', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('68', '61aed4a3afe001e8794d83838f27a5fe', '1', '0', 'http://shixun.com/file/upload/201604/12/170327491.jpg', '70939', 'jpg', 'thumb', '285', '285', '1460451807', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('67', '7e393bd908edf374a793271b4bbb23e8', '1', '0', 'http://shixun.com/file/upload/201604/12/170325811.jpg', '66397', 'jpg', 'thumb', '285', '285', '1460451805', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('66', '048688f066be0baadb7677e4f02ed173', '1', '0', 'http://shixun.com/file/upload/201604/12/170319291.jpg', '72434', 'jpg', 'thumb', '285', '285', '1460451799', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('63', '9d830d141beb12ce74a904bb4a10b4f0', '1', '0', 'http://shixun.com/file/upload/201604/12/164415791.jpg', '51839', 'jpg', 'thumb', '285', '285', '1460450655', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('64', '55fc3cddf3e335aed5f1c22ec4ef52b3', '1', '0', 'http://shixun.com/file/upload/201604/12/170233361.jpg', '106115', 'jpg', 'thumb', '285', '285', '1460451753', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('65', '67a02ca09b3bf6719531b7830605cc50', '1', '0', 'http://shixun.com/file/upload/201604/12/170316741.jpg', '106115', 'jpg', 'thumb', '285', '285', '1460451796', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('60', '635013415990c3d3eed1b31e3eefa336', '2', '27', 'http://shixun.com/file/upload/201604/12/100619831.jpg', '56202', 'jpg', 'thumb', '285', '285', '1460426779', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('70', '1d69f1912feac58a8fc80f6675df132c', '1', '0', 'http://shixun.com/file/upload/201604/12/170408841.jpg', '72884', 'jpg', 'thumb', '285', '285', '1460451848', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('71', 'df40672de88c0aa50c76c97c64929ccc', '1', '0', 'http://shixun.com/file/upload/201604/12/170411371.jpg', '91006', 'jpg', 'thumb', '285', '285', '1460451851', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('72', '6179878906a76899125d94e17714c04a', '1', '0', 'http://shixun.com/file/upload/201604/12/170451191.jpg', '51839', 'jpg', 'thumb', '285', '285', '1460451891', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('73', 'b66d45a9092660995712e82e39287f2e', '1', '0', 'http://shixun.com/file/upload/201604/12/170454771.jpg', '91006', 'jpg', 'thumb', '285', '285', '1460451894', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('74', 'f545d2eb335210e0c6e1380606ac080d', '1', '0', 'http://shixun.com/file/upload/201604/12/170526371.jpg', '51839', 'jpg', 'thumb', '285', '285', '1460451926', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('75', '9f56472ee18302271dd20efe251910f3', '1', '0', 'http://shixun.com/file/upload/201604/12/170528961.jpg', '112513', 'jpg', 'thumb', '285', '285', '1460451928', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('76', 'd62cf23c8ca62e2932ee13c1dfac83dc', '1', '0', 'http://shixun.com/file/upload/201604/12/170531351.jpg', '52983', 'jpg', 'thumb', '285', '285', '1460451931', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('77', '266a00e08bd70001a7668cbdf9ff6af4', '1', '0', 'http://shixun.com/file/upload/201604/12/170534681.jpg', '112513', 'jpg', 'thumb', '285', '285', '1460451934', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('80', 'e1029f5571ffecaf7b2076b6504d3c3a', '1', '53', 'http://shixun.com/file/upload/201604/13/094017421.jpg', '72434', 'jpg', 'thumb', '285', '285', '1460511617', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_1` VALUES ('101', 'cced46e54d67c5a41f787db9e6d745c9', '1', '0', 'http://shixun.com/file/upload/201604/15/100605801.jpg', '1373168', 'jpg', 'thumb', '720', '3500', '1460685965', 'shixun2', '127.0.0.1');
INSERT INTO `sx_upload_6` VALUES ('1', '696903625929638cd4d2f41e2a5d7c93', '1', '0', 'http://shixun.com/file/upload/201603/18/1044546416.png', '1294', 'png', 'thumb', '143', '143', '1458269094', '123456', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('5', 'a6dacb74e1473be0f61ce3635a3d6fc6', '3', '0', 'http://zhongning.com/file/upload/201604/23/1347415918.jpg', '244298', 'jpg', 'file', '1920', '550', '1461390461', '8392673132', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('4', '1c02b5187a911202f506e77287b59745', '3', '0', 'http://zhongning.com/file/upload/201604/23/1347115718.jpg', '476208', 'jpg', 'file', '1920', '550', '1461390431', '8392673132', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('3', 'e5e5364ab73668d42281c1d208ad93c6', '2', '0', 'http://zhongning.com/file/upload/201604/22/1541598618.jpg', '6701', 'jpg', 'thumb', '150', '150', '1461310919', '8392673', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('6', '6cb84b2269ac0a57e05ebbf67f44b022', '3', '0', 'http://zhongning.com/file/upload/201604/23/1347533418.jpg', '347692', 'jpg', 'file', '1920', '550', '1461390473', '8392673132', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('21', 'b7147b4aa541a3cfd31af1b347729e9e', '3', '0', 'http://zhongning.com/file/upload/201604/24/1016412218.jpg', '153459', 'jpg', 'thumb', '1920', '400', '1461464201', '8392673132', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('19', 'f70bbb5261572eb802a8d72052200ec0', '3', '0', 'http://zhongning.com/file/upload/201604/24/1014586418.jpg', '289322', 'jpg', 'thumb', '1920', '492', '1461464098', '8392673132', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('20', 'cbd0021fa455adacd980a125778cebac', '3', '0', 'http://zhongning.com/file/upload/201604/24/1015574318.jpg', '158930', 'jpg', 'thumb', '1920', '401', '1461464157', '8392673132', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('16', '64db3661a94464ba7d15481181957d91', '3', '0', 'http://zhongning.com/file/upload/201604/24/1013143518.jpg', '150358', 'jpg', 'thumb', '1920', '402', '1461463994', '8392673132', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('17', 'a704f968cdb4ae1809c97b2b1ca5a7b4', '3', '0', 'http://zhongning.com/file/upload/201604/24/1013405418.jpg', '61638', 'jpg', 'thumb', '1920', '399', '1461464020', '8392673132', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('18', 'e96be2482e2c9e4c4a8ad29d8f9d360d', '3', '0', 'http://zhongning.com/file/upload/201604/24/1014081118.jpg', '178604', 'jpg', 'thumb', '1920', '400', '1461464048', '8392673132', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('13', 'c7e7e08313487ce532f50d1687725393', '3', '0', 'http://zhongning.com/file/upload/201604/24/1010286118.jpg', '476208', 'jpg', 'file', '1920', '550', '1461463828', '8392673132', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('14', 'c1351222baae8a714ad2849816e57cc4', '3', '0', 'http://zhongning.com/file/upload/201604/24/1012284418.jpg', '244298', 'jpg', 'file', '1920', '550', '1461463948', '8392673132', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('15', '17dad76251934ae0ffd86abd74d64641', '3', '0', 'http://zhongning.com/file/upload/201604/24/1012407418.jpg', '347692', 'jpg', 'file', '1920', '550', '1461463960', '8392673132', '127.0.0.1');
INSERT INTO `sx_upload_8` VALUES ('22', '98a5aa581c573d9b247465fa0894618d', '2', '0', 'http://03.8660.org/file/upload/201604/24/2124161218.png', '9266', 'png', 'thumb', '150', '150', '1461504256', '8392673132', '119.130.221.5');
INSERT INTO `sx_upload_8` VALUES ('23', '551931026a1324ebb50f63c6fff20618', '2', '0', 'http://03.8660.org/file/upload/201604/24/2124387018.png', '9266', 'png', 'thumb', '150', '150', '1461504278', '8392673132', '119.130.221.5');
INSERT INTO `sx_vote` VALUES ('1', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457016012', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '2');
INSERT INTO `sx_vote` VALUES ('2', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457016016', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '2');
INSERT INTO `sx_vote` VALUES ('3', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457016227', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '3');
INSERT INTO `sx_vote` VALUES ('4', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457016232', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '4');
INSERT INTO `sx_vote` VALUES ('5', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457016247', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '7');
INSERT INTO `sx_vote` VALUES ('6', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457016338', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '2');
INSERT INTO `sx_vote` VALUES ('7', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457016404', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '8');
INSERT INTO `sx_vote` VALUES ('8', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457016408', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '5');
INSERT INTO `sx_vote` VALUES ('9', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457883384', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '2', '14');
INSERT INTO `sx_vote` VALUES ('10', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457883394', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '2', '13');
INSERT INTO `sx_vote` VALUES ('11', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457883420', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '2', '12');
INSERT INTO `sx_vote` VALUES ('12', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457920583', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '2', '15');
INSERT INTO `sx_vote` VALUES ('13', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1457920699', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '2', '1');
INSERT INTO `sx_vote` VALUES ('14', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1460527056', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '2', '23');
INSERT INTO `sx_vote` VALUES ('15', '0', '0', '0', '', '', '', '', '0', '0', '0', '0', '0', '0', '1460527111', '0', '0', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '2', '25');
INSERT INTO `sx_webpage` VALUES ('1', '1', '0', '0', 'PC端-联系我们', '', '<div>\r\n<div class=\"contact-left-box\">&nbsp;</div>\r\n</div>', '', '', '', '', '1461301304', '5', '0', '0', 'about/contact.html', '', 'webpage-4');
INSERT INTO `sx_webpage` VALUES ('4', '1', '0', '0', 'PC端-加入我们', '', '<h3>薪酬福利主管(2015)</h3>\r\n<p>1、人力资源管理等相关专业本科以上学历，两年以上薪酬福利实务操作经验;</p>\r\n<p>2、必须有独立搭建薪酬体系经验(非符合条件者勿投);</p>\r\n<p>3、熟悉人事基础知识、国家劳动政策与薪酬相关的法律法规;</p>\r\n<p>4、具备良好的职业道德素养和沟通理解能力,仔细认真,踏实稳重;</p>\r\n<p>5、数字敏感度好，善于进行数据分析;</p>\r\n<p>6、熟练操作office相关办公软件;</p>\r\n<p>7、具有较强的团队合作精神。</p>\r\n<br />\r\n<p>联系人：020-32317947丘小姐，020-32317946朱小姐</p>\r\n<p>企业邮箱：hr@wayoulegal.com</p>\r\n<hr />\r\n<h3>产品规划师(2015)</h3>\r\n<p>岗位要求：</p>\r\n<p>1、本科及以上学历，具备8年以上互联网产品经验，有成功的产品规划案例;</p>\r\n<p>2、具有出色的产品规划能力，能够制定产品方向的中长期规划，并拆分为切实可行的项目进行实施;</p>\r\n<p>3、具有市场洞察力，能够触类旁通，积极发现问题、分析问题，勇于创新 ;</p>\r\n<p>4、有好的向上、横向、向下的沟通能力,有较强的组织协调能力和抗压能力;</p>\r\n<p>5、有成功的互联网平台产品规划经验，服务于阿里巴巴、腾讯等知名互联网公司者优先考虑。</p>\r\n<br />\r\n<p>联系人：020-32317947丘小姐，020-32317946朱小姐</p>\r\n<p>企业邮箱：hr@wayoulegal.com</p>\r\n<hr />\r\n<h3>IOS开发工程师(2015)</h3>\r\n<p>岗位要求：</p>\r\n<p>1、大专及以上学历,一年以上Objective C和Cocoa编程经验;</p>\r\n<p>2、熟悉iPhone SDK 开发环境及底层API调用;有iOS objective-C应用软件开发经验、熟悉Xcode;</p>\r\n<p>3、有成功发布过iPhone/iPad应用软件经历者优先;</p>\r\n<p>4、出色的调试技能及问题分析解决能力;</p>\r\n<p>5、具有良好的沟通能力、学习能力、团队合作精神、能承担工作压力。</p>\r\n<br />\r\n<p>联系人：020-32317947丘小姐，020-32317946朱小姐</p>\r\n<p>企业邮箱：hr@wayoulegal.com</p>\r\n<hr />\r\n<h3>高级PHP工程师(2015)</h3>\r\n<p>岗位要求</p>\r\n<p>1、大专及以上学历，3年以上PHP开发经验，有大型网站工作经验者优先;</p>\r\n<p>2、熟悉 mysql，对数据库设计，性能优化有深刻体会;</p>\r\n<p>3、熟悉常见nosql的应用，有nosql在大型网站应用经验;</p>\r\n<p>4、能独立应付大访问量下网站的架构和开发工作;</p>\r\n<p>5、具有php、memcached等缓存技术的经验;</p>\r\n<p>6、熟悉linux系统，shell脚本，python脚本等优先。</p>\r\n<br />\r\n<p>联系人：020-32317947丘小姐，020-32317946朱小姐</p>\r\n<p>企业邮箱：hr@wayoulegal.com</p>', '', '', '', '', '1461301461', '3', '0', '0', 'about/joinus.html', '', 'webpage-5');
INSERT INTO `sx_webpage` VALUES ('6', '1', '0', '0', 'PC-公司动态', '', '<img src=\"http://03.8660.org/skins/images/wycms/new1.jpg\" alt=\"\" /> <img src=\"http://03.8660.org/skins/images/wycms/new2.jpg\" alt=\"\" />', '', '', '', '8392673132', '1461507360', '6', '0', '0', 'about/news.html', '', 'webpage-3');
INSERT INTO `sx_webpage` VALUES ('7', '1', '0', '0', 'PC端-行业优势', '', '<img src=\"http://03.8660.org/skins/images/wycms/abvan1.jpg\" alt=\"\" />         <img src=\"http://03.8660.org/skins/images/wycms/abvan2.jpg\" alt=\"\" />         <img src=\"http://03.8660.org/skins/images/wycms/abvan3.jpg\" alt=\"\" />         <img src=\"http://03.8660.org/skins/images/wycms/abvan4.jpg\" alt=\"\" />', '', '', '', '8392673132', '1461507341', '7', '0', '0', 'about/advantage.html', '', 'webpage-2');
INSERT INTO `sx_webpage` VALUES ('8', '1', '0', '0', 'PC端-公司介绍', '', '<h3>公司简介</h3>\r\n<p>中宁县民间借贷登记服务中心是一家集&ldquo;金融服务、信息咨询、投融资理财、项目融资、业务代理、理财顾问、业务培训、民间借贷登记服务等业务&rdquo;的             公司，是自治区金融工作局支持下的宁夏第一家民间借贷登记服务机构，采用&ldquo;政府引导，企业经营，市场运作&rdquo;的模式开展工作。</p>\r\n<img src=\"http://03.8660.org/skins/images/wycms/intro1.jpg\" alt=\"\" />\r\n<h3>核心价值</h3>\r\n<p>公司以&ldquo;奉献+服务+发展&rdquo;为己任，以追求永续经营为目标，把推动宁夏中小微企业的健康发展、促进地区经济建设、加强社会和谐与文明进步作为公司             发展的根本任务，以追求股东、企业、员工与社会的共赢发展、实现公司经济效益和社会效益的最大化为行为准则，致力于服务宁夏经济发展和社会繁荣，为             人民群众生活的改善提高，提供金融服务。有效集合民间资金，挖掘融资企业资金需求，通过信息发布与对接服务，引导民间资金以债权方式投资于中小企业，             促进实体经济发展。为投资人提供资金的保值和增值，为融资企业提供可持续发展的保障。</p>\r\n<img src=\"http://03.8660.org/skins/images/wycms/intro2.jpg\" alt=\"\" />\r\n<h3>诚信服务</h3>\r\n<p>中宁县民间借贷登记服务中心通过阳光化服务，树立诚信典范，助推宁夏民间借贷诚信体系的完善，为民间金融投资拓展了一个新的渠道，丰富了金融市             场的层次和产品，为西部金融改革试验做出了积极探索。我们坚信在&ldquo;法律&rdquo;与&ldquo;诚信&rdquo;的旗帜下，在主管部门的引导和监管下，中宁民间借贷登记服务中心             将竭诚建立一个合法、安全、阳光的民间资金交易平台，引导民间资金进入实体经济，做人民的金融、普惠金融。</p>\r\n<img src=\" http://03.8660.org/skins/images/wycms/intro3.jpg\" alt=\"\" />         <img src=\" http://03.8660.org/skins/images/wycms/intro4.jpg\" alt=\"\" />', '', '', '', '8392673132', '1461507315', '8', '0', '0', 'about/compintro.html', '', 'webpage-1');
INSERT INTO `sx_webpage` VALUES ('10', '1', '0', '0', '手机端-中宁用户协议', '', '', '', '', '', '', '1462082838', '10', '0', '0', 'about/agreement.html', '', 'webpage-7');
