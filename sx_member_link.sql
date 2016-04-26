-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 04 月 26 日 15:51
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `zhongning`
--

-- --------------------------------------------------------

--
-- 表的结构 `sx_member_link`
--

CREATE TABLE IF NOT EXISTS `sx_member_link` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `auth` char(32) NOT NULL,
  `authtime` int(11) NOT NULL,
  `truename` varchar(5) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`(5)),
  KEY `auth` (`auth`(5))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员' AUTO_INCREMENT=26 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
