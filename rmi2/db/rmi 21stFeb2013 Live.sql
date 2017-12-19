-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 21, 2013 at 02:09 AM
-- Server version: 5.5.30
-- PHP Version: 5.3.21

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `registermyinfo`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE IF NOT EXISTS `access` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `callback` varchar(255) NOT NULL DEFAULT '',
  `parameters` longtext NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES
('comment_publish_action', 'comment', 'comment_publish_action', '', 'Publish comment'),
('comment_unpublish_action', 'comment', 'comment_unpublish_action', '', 'Unpublish comment'),
('node_publish_action', 'node', 'node_publish_action', '', 'Publish post'),
('node_unpublish_action', 'node', 'node_unpublish_action', '', 'Unpublish post'),
('node_make_sticky_action', 'node', 'node_make_sticky_action', '', 'Make post sticky'),
('node_make_unsticky_action', 'node', 'node_make_unsticky_action', '', 'Make post unsticky'),
('node_promote_action', 'node', 'node_promote_action', '', 'Promote post to front page'),
('node_unpromote_action', 'node', 'node_unpromote_action', '', 'Remove post from front page'),
('node_save_action', 'node', 'node_save_action', '', 'Save post'),
('user_block_user_action', 'user', 'user_block_user_action', '', 'Block current user'),
('user_block_ip_action', 'user', 'user_block_ip_action', '', 'Ban IP address of current user');

-- --------------------------------------------------------

--
-- Table structure for table `actions_aid`
--

CREATE TABLE IF NOT EXISTS `actions_aid` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `authmap`
--

CREATE TABLE IF NOT EXISTS `authmap` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `authname` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longtext,
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE IF NOT EXISTS `blocks` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` varchar(32) NOT NULL DEFAULT '0',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  `region` varchar(64) NOT NULL DEFAULT '',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `pages` text NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES
(1, 'user', '0', 'garland', 1, 0, 'left', 0, 0, 0, '', '', -1),
(2, 'user', '1', 'garland', 1, 0, 'left', 0, 0, 0, '', '', -1),
(3, 'system', '0', 'garland', 1, 10, 'footer', 0, 0, 0, '', '', -1),
(4, 'comment', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', 1),
(5, 'menu', 'primary-links', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(6, 'menu', 'secondary-links', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(7, 'node', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(8, 'user', '2', 'garland', 0, 0, '', 0, 0, 0, '', '', 1),
(9, 'user', '3', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(10, 'form_builder', 'fields', 'garland', 0, 0, '', 0, 0, 0, '', '', 1),
(11, 'search', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(12, 'logintoboggan', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(13, 'profile', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', 5),
(14, 'comment', '0', 'rmi', 0, -4, '', 0, 0, 0, '', '', 1),
(15, 'form_builder', 'fields', 'rmi', 0, 0, 'left', 0, 0, 0, '', '', 1),
(16, 'logintoboggan', '0', 'rmi', 0, -6, '', 0, 0, 0, '', '', -1),
(17, 'menu', 'primary-links', 'rmi', 0, -5, '', 0, 0, 0, '', '', -1),
(18, 'menu', 'secondary-links', 'rmi', 0, -2, '', 0, 0, 0, '', '', -1),
(19, 'node', '0', 'rmi', 0, -1, '', 0, 0, 0, '', '', -1),
(20, 'profile', '0', 'rmi', 0, -7, '', 0, 0, 0, '', '', 5),
(21, 'search', '0', 'rmi', 0, -3, '', 0, 0, 0, '', '', -1),
(22, 'user', '2', 'rmi', 0, 1, '', 0, 0, 0, '', '', 1),
(23, 'user', '3', 'rmi', 0, 2, '', 0, 0, 0, '', '', -1),
(24, 'system', '0', 'rmi', 1, -7, 'footer', 0, 0, 0, '', '', -1),
(25, 'user', '0', 'rmi', 1, 0, 'left', 0, 0, 0, '', '', -1),
(26, 'user', '1', 'rmi', 1, 0, 'left', 0, 0, 0, '', '', -1),
(27, 'menu', 'menu-my-account-nav', 'rmi', 1, 0, 'accountnav', 0, 0, 1, 'user/account\r\nuser/*/edit/chgpwd\r\nuser/contacts\r\nuser/contacts/*', '<none>', -1),
(28, 'menu', 'menu-my-account-nav', 'garland', 0, 0, '', 0, 0, 1, 'user/account\r\nuser/*/edit/chgpwd\r\nuser/contacts\r\nuser/contacts/*', '<none>', -1),
(29, 'nice_menus', '1', 'rmi', 1, -8, 'dropmenu', 0, 0, 0, '', '<none>', -1),
(30, 'nice_menus', '2', 'rmi', 0, 0, '', 0, 0, 0, '', '', -1),
(31, 'nice_menus', '1', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(32, 'nice_menus', '2', 'garland', 0, 0, '', 0, 0, 0, '', '', -1);

-- --------------------------------------------------------

--
-- Table structure for table `blocks_roles`
--

CREATE TABLE IF NOT EXISTS `blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `boxes`
--

CREATE TABLE IF NOT EXISTS `boxes` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `info` varchar(128) NOT NULL DEFAULT '',
  `format` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE IF NOT EXISTS `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_block`
--

CREATE TABLE IF NOT EXISTS `cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_filter`
--

CREATE TABLE IF NOT EXISTS `cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_form`
--

CREATE TABLE IF NOT EXISTS `cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_menu`
--

CREATE TABLE IF NOT EXISTS `cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_page`
--

CREATE TABLE IF NOT EXISTS `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_update`
--

CREATE TABLE IF NOT EXISTS `cache_update` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(64) NOT NULL DEFAULT '',
  `comment` longtext NOT NULL,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` smallint(6) NOT NULL DEFAULT '0',
  `thread` varchar(255) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `pid` (`pid`),
  KEY `nid` (`nid`),
  KEY `comment_uid` (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL DEFAULT '',
  `recipients` longtext NOT NULL,
  `reply` longtext NOT NULL,
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  `selected` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `category` (`category`),
  KEY `list` (`weight`,`category`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`cid`, `category`, `recipients`, `reply`, `weight`, `selected`) VALUES
(1, 'website feedback', 'admin@rmi.com,edwardtester99@gmail.com', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `content_access`
--

CREATE TABLE IF NOT EXISTS `content_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `settings` mediumtext,
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `datagroup_submissions`
--

CREATE TABLE IF NOT EXISTS `datagroup_submissions` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `is_draft` tinyint(4) NOT NULL DEFAULT '0',
  `submitted` int(11) NOT NULL DEFAULT '0',
  `remote_addr` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sid_nid` (`sid`,`nid`),
  KEY `nid_uid_sid` (`nid`,`uid`,`sid`),
  KEY `nid_sid` (`nid`,`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=326 ;

--
-- Dumping data for table `datagroup_submissions`
--

INSERT INTO `datagroup_submissions` (`sid`, `nid`, `uid`, `is_draft`, `submitted`, `remote_addr`) VALUES
(238, 4, 1, 0, 1349096191, '115.186.146.97'),
(244, 10, 1, 0, 1349157688, '115.186.146.97'),
(247, 13, 1, 0, 1349158003, '115.186.146.97'),
(239, 5, 1, 0, 1349156617, '115.186.146.97'),
(236, 2, 1, 0, 1349094733, '115.186.146.97'),
(242, 8, 1, 0, 1349157333, '115.186.146.97'),
(240, 6, 1, 0, 1349157014, '115.186.146.97'),
(268, 5, 86, 0, 1349433415, '115.186.146.97'),
(267, 5, 102, 0, 1349354428, '115.186.146.97'),
(241, 7, 1, 0, 1349157160, '115.186.146.97'),
(266, 13, 102, 0, 1349346022, '115.186.146.97'),
(265, 11, 102, 0, 1349345924, '115.186.146.97'),
(246, 12, 1, 0, 1349157939, '115.186.146.97'),
(245, 11, 1, 0, 1349157804, '115.186.146.97'),
(263, 5, 102, 0, 1349353900, '115.186.146.97'),
(264, 2, 102, 0, 1349345651, '115.186.146.97'),
(259, 3, 102, 0, 1350650888, '182.180.65.113'),
(262, 7, 102, 0, 1349343709, '115.186.146.97'),
(261, 14, 102, 0, 1349337262, '115.186.146.97'),
(260, 14, 86, 0, 1349271292, '182.180.65.113'),
(255, 14, 86, 0, 1349263993, '182.180.65.113'),
(253, 14, 1, 0, 1351684553, '182.180.65.113'),
(252, 10, 102, 0, 1349258929, '182.180.65.113'),
(251, 6, 102, 0, 1349258785, '182.180.65.113'),
(250, 14, 102, 0, 1351688240, '182.180.65.113'),
(249, 14, 102, 0, 1349258016, '182.180.65.113'),
(248, 4, 102, 0, 1349257411, '182.180.65.113'),
(243, 9, 1, 0, 1349157568, '115.186.146.97'),
(307, 9, 1, 0, 1351687879, '182.180.65.113'),
(237, 3, 1, 0, 1349095606, '115.186.146.97'),
(269, 4, 102, 0, 1349443562, '74.115.0.151'),
(270, 5, 102, 0, 1349679453, '74.115.0.151'),
(271, 5, 1, 0, 1349674634, '182.180.65.113'),
(272, 5, 102, 0, 1349679670, '182.180.65.160'),
(273, 4, 102, 0, 1349680195, '182.180.65.160'),
(274, 14, 103, 0, 1349718803, '76.103.171.32'),
(275, 14, 103, 0, 1350411984, '76.103.171.32'),
(276, 10, 103, 0, 1350412062, '76.103.171.32'),
(277, 4, 103, 0, 1350412215, '76.103.171.32'),
(278, 2, 103, 0, 1350412242, '76.103.171.32'),
(279, 5, 103, 0, 1350433682, '76.103.171.32'),
(280, 5, 103, 0, 1350433761, '76.103.171.32'),
(281, 13, 103, 0, 1350433806, '76.103.171.32'),
(282, 4, 103, 0, 1350433879, '76.103.171.32'),
(283, 3, 103, 0, 1350434014, '76.103.171.32'),
(284, 9, 103, 0, 1350434046, '76.103.171.32'),
(285, 6, 103, 0, 1350434099, '76.103.171.32'),
(286, 6, 103, 0, 1350434139, '76.103.171.32'),
(287, 14, 103, 0, 1350660199, '76.103.171.32'),
(288, 14, 100, 0, 1350861632, '12.105.251.10'),
(289, 2, 100, 0, 1350757583, '12.105.251.10'),
(290, 4, 100, 0, 1350757608, '12.105.251.10'),
(291, 5, 100, 0, 1350757695, '12.105.251.10'),
(292, 13, 100, 0, 1350757740, '12.105.251.10'),
(293, 10, 100, 0, 1350757845, '12.105.251.10'),
(294, 9, 100, 0, 1350757935, '12.105.251.10'),
(295, 6, 100, 0, 1350757982, '12.105.251.10'),
(296, 11, 100, 0, 1350758011, '12.105.251.10'),
(297, 14, 100, 0, 1350758063, '12.105.251.10'),
(298, 14, 100, 0, 1350758122, '12.105.251.10'),
(299, 5, 102, 0, 1350986665, '182.180.65.113'),
(300, 5, 115, 0, 1351597804, '182.180.65.160'),
(301, 4, 102, 0, 1351599811, '182.180.65.160'),
(302, 5, 102, 0, 1351659625, '182.180.65.113'),
(303, 9, 1, 0, 1351665976, '182.180.65.113'),
(304, 9, 86, 0, 1351667133, '182.180.65.113'),
(305, 9, 102, 0, 1351683403, '182.180.65.113'),
(308, 14, 117, 0, 1351974071, '24.251.235.228'),
(309, 14, 110, 0, 1352263117, '24.251.235.228'),
(310, 14, 119, 0, 1355592418, '68.230.45.185'),
(311, 4, 119, 0, 1355592444, '68.230.45.185'),
(312, 14, 119, 0, 1355594661, '68.230.45.185'),
(313, 14, 119, 0, 1355594675, '68.230.45.185'),
(316, 14, 102, 0, 1355925884, '182.180.65.113'),
(315, 14, 102, 0, 1355925766, '182.180.65.113'),
(317, 14, 123, 0, 1359305279, '70.199.193.145'),
(318, 10, 123, 0, 1359305312, '70.199.193.145'),
(319, 5, 123, 0, 1359305364, '70.199.193.145'),
(320, 4, 123, 0, 1359305401, '70.199.193.145'),
(321, 9, 123, 0, 1359305497, '70.199.193.145'),
(322, 11, 123, 0, 1359305525, '70.199.193.145'),
(323, 3, 123, 0, 1359308054, '70.199.193.145'),
(324, 14, 141, 0, 1360873397, '184.185.164.6'),
(325, 14, 102, 0, 1361183662, '115.186.130.30');

-- --------------------------------------------------------

--
-- Table structure for table `datagroup_submitted_data`
--

CREATE TABLE IF NOT EXISTS `datagroup_submitted_data` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `data` mediumtext NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `nid` (`nid`),
  KEY `sid_nid` (`sid`,`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `datagroup_submitted_data`
--

INSERT INTO `datagroup_submitted_data` (`nid`, `sid`, `cid`, `data`, `uid`) VALUES
(4, 238, 12, 'here is infomation', 1),
(4, 238, 3, '2011-11-29', 1),
(4, 238, 2, '2009-11-14', 1),
(4, 238, 1, 'Google', 1),
(4, 238, 15, 'Employment Info Title', 1),
(10, 244, 1, 'Restaurant', 1),
(10, 244, 4, 'Restaurant', 1),
(13, 247, 2, 'http://www.facebook.com/50cent', 1),
(13, 247, 1, 'Facebook', 1),
(5, 239, 2, 'Medication', 1),
(5, 239, 1, 'Allergy', 1),
(5, 239, 15, 'Medical History Title', 1),
(2, 236, 1, '2005-03-03', 1),
(2, 236, 3, 'Barbara A. Willis', 1),
(8, 242, 3, '1997-10-29', 1),
(8, 242, 2, '1962-11-30', 1),
(8, 242, 1, 'Driver license', 1),
(6, 240, 4, 'Rent details', 1),
(5, 239, 5, 'Never', 1),
(5, 239, 4, 'Smoker', 1),
(5, 239, 3, 'four times', 1),
(5, 268, 5, 'Never', 86),
(5, 268, 4, 'Smoker', 86),
(5, 268, 3, '831 Marina Village Pkwy\r\nAlameda, CA', 86),
(5, 268, 2, 'Test Medications', 86),
(5, 268, 1, 'Test Allergies', 86),
(5, 268, 15, 'Medical History Detail', 86),
(5, 267, 5, 'Occasionally', 102),
(5, 267, 4, 'Smoker', 102),
(5, 267, 3, '', 102),
(5, 267, 2, 'qwe', 102),
(5, 267, 1, 'Asthama', 102),
(5, 267, 15, 'hale', 102),
(13, 266, 4, 'Friend', 102),
(13, 266, 3, '21', 102),
(13, 266, 2, 'awdasdsa', 102),
(13, 266, 1, 'Facebook', 102),
(11, 265, 5, 'products', 102),
(11, 265, 4, 'http://www.example.com/', 102),
(11, 265, 3, '157', 102),
(11, 265, 1, '', 102),
(11, 265, 2, '', 102),
(2, 264, 2, '', 102),
(2, 264, 1, '1971-02-02', 102),
(5, 263, 5, '', 102),
(2, 264, 3, 'jjot', 102),
(5, 263, 3, '', 102),
(5, 263, 2, 'demo', 102),
(5, 263, 1, 'demo', 102),
(5, 263, 15, '63', 102),
(7, 262, 2, '1970-01-02', 102),
(3, 259, 20, '665', 102),
(7, 262, 1, 'Recall', 102),
(7, 262, 3, ']', 102),
(14, 261, 3, 'test@gmail.com', 102),
(14, 261, 2, 'This is address field', 102),
(14, 261, 1, 'Test', 102),
(14, 261, 9, 'My Info', 102),
(7, 241, 3, 'Car Maintenance', 1),
(6, 240, 3, '2013-03-30', 1),
(6, 240, 2, '4521', 1),
(6, 240, 1, 'Rent', 1),
(14, 260, 3, 'george.nelson@gmail.com', 86),
(14, 260, 2, 'Jonathan L. Kohlmeier\r\n7154 Edinger Ave\r\nHuntington Beach, CA ', 86),
(14, 260, 1, 'George M. Nelson', 86),
(14, 260, 9, 'Nelson  Contact', 86),
(4, 238, 14, '145', 1),
(4, 238, 13, '$444445', 1),
(8, 242, 5, '1234654', 1),
(8, 242, 4, '153', 1),
(7, 241, 2, '1998-11-30', 1),
(7, 241, 1, 'Auto Service', 1),
(14, 255, 3, 'OlgaDWhitacre@ymail.com', 86),
(14, 255, 2, '2905 Aetna Way\r\nSan Jose, CA ', 86),
(14, 255, 1, 'Olga D. Whitacre', 86),
(14, 255, 9, 'Olga Contact', 86),
(9, 243, 3, 'Disability Insurance from Care taker', 1),
(9, 243, 2, '154', 1),
(9, 243, 1, 'Disability', 1),
(8, 242, 6, 'Driver License', 1),
(10, 244, 3, '(999) 999-9999', 1),
(10, 244, 2, 'The house of bombay', 1),
(14, 253, 3, 'OlgaDWhitacre@ymail.com', 1),
(14, 253, 2, '2905 Aetna Way\r\nSan Jose, CA ', 1),
(14, 253, 1, 'james spin', 1),
(14, 253, 9, 'New Contact', 1),
(10, 252, 3, '(999) 999-9999', 102),
(10, 252, 2, 'parlo', 102),
(10, 252, 1, 'Restaurant', 102),
(10, 252, 4, 'what', 102),
(6, 251, 3, '', 102),
(6, 251, 2, '515', 102),
(6, 251, 1, 'Mortgage', 102),
(6, 251, 4, '@!#$!$@#%$^^&(&(&^*)(*&)%$&@!!@$@#!$#$@!$!@$12''''''@#$%213"1234"1''1243''''2134''1@#$%#^%#$^%$&%&%&%&%&%&%$@$!@@%^$^$|}{}{+_!+~~~!~!~!', 102),
(14, 250, 3, '', 102),
(14, 250, 2, '', 102),
(14, 250, 1, 'ok', 102),
(14, 250, 9, 'Contact me in day time', 102),
(14, 249, 3, 'test@gmail.com', 102),
(14, 249, 2, 'hey \r\nthis is my\r\naddress', 102),
(14, 249, 1, 'parlo', 102),
(14, 249, 9, 'Contact me in day time ', 102),
(4, 248, 14, '', 102),
(4, 248, 13, '50,000/USA\r\nLiving\r\nTravel', 102),
(4, 248, 12, 'test@gmail.com', 102),
(4, 248, 3, '1940-01-01', 102),
(4, 248, 2, '1940-01-01', 102),
(4, 248, 1, 'Amzon', 102),
(4, 248, 15, 'Juli', 102),
(11, 245, 4, 'http://www.google.com', 1),
(11, 245, 3, '', 1),
(11, 245, 2, '1986-03-20', 1),
(11, 245, 1, 'jacket', 1),
(9, 243, 4, 'Disability Insurance', 1),
(9, 307, 2, '166', 1),
(9, 307, 1, 'Business', 1),
(9, 307, 4, 'Jaguar Registration', 1),
(2, 236, 2, '789-65-1124', 1),
(3, 237, 20, 'Financial Details', 1),
(11, 245, 5, 'Leather jacket', 1),
(12, 246, 3, 'Furniture details', 1),
(12, 246, 1, 'Furniture ', 1),
(12, 246, 2, '156', 1),
(13, 247, 3, '789456', 1),
(13, 247, 4, 'FB Acc', 1),
(4, 269, 15, 'Microsoft', 102),
(4, 269, 1, 'microsoft', 102),
(4, 269, 2, '', 102),
(4, 269, 3, '', 102),
(4, 269, 12, '', 102),
(4, 269, 13, '', 102),
(4, 269, 14, '', 102),
(5, 270, 15, 'Illness', 102),
(5, 270, 1, 'Asthama', 102),
(5, 270, 2, 'Aspirin', 102),
(5, 270, 3, 'Not known', 102),
(5, 270, 4, 'Smoker', 102),
(5, 270, 5, '', 102),
(5, 271, 15, 'Medical History Detail 2', 1),
(5, 271, 1, 'Test Allergies', 1),
(5, 271, 2, 'Test Medications', 1),
(5, 271, 3, 'Test data', 1),
(5, 271, 4, 'Smoker', 1),
(5, 271, 5, 'Never', 1),
(5, 272, 15, 'Test', 102),
(5, 272, 1, 'Asthama', 102),
(5, 272, 2, 'demo', 102),
(5, 272, 3, '', 102),
(5, 272, 4, 'Smoker', 102),
(5, 272, 5, 'Occasionally', 102),
(4, 273, 15, 'Apple', 102),
(4, 273, 1, 'Apple', 102),
(4, 273, 2, '1942-02-02', 102),
(4, 273, 3, '1941-02-02', 102),
(4, 273, 12, 'www.google.com', 102),
(4, 273, 13, '', 102),
(4, 273, 14, '161', 102),
(14, 274, 9, 'John Doe', 103),
(14, 274, 1, 'Accounting', 103),
(14, 274, 2, '12334 Newell Ave\r\nWalnut Creek, CA  93334', 103),
(14, 274, 3, 'maria@tekyz.com', 103),
(14, 275, 9, 'Doctor Wolfe', 103),
(14, 275, 1, 'Dr. Wolffe', 103),
(14, 275, 2, '333 Telegraph Ave.\r\nBerkeley, CA  94523', 103),
(14, 275, 3, 'drwolffe@doctor.com', 103),
(10, 276, 4, 'El Dorado School', 103),
(10, 276, 1, 'Other', 103),
(10, 276, 2, 'El Dorado School', 103),
(10, 276, 3, '925-682-8000', 103),
(4, 277, 15, 'Tekyz', 103),
(4, 277, 1, 'Tekyz, Inc.', 103),
(4, 277, 2, '2004-01-01', 103),
(4, 277, 3, '', 103),
(4, 277, 12, 'Bill Lavin - 480-555-1212', 103),
(4, 277, 13, '', 103),
(4, 277, 14, '', 103),
(2, 278, 3, 'Maria', 103),
(2, 278, 1, '', 103),
(2, 278, 2, '', 103),
(5, 279, 15, 'Maria', 103),
(5, 279, 1, 'None', 103),
(5, 279, 2, 'None', 103),
(5, 279, 3, 'MS\r\nStroke', 103),
(5, 279, 4, 'Smoker', 103),
(5, 279, 5, 'Occasionally', 103),
(5, 280, 15, 'Jack', 103),
(5, 280, 1, '', 103),
(5, 280, 2, '', 103),
(5, 280, 3, 'Broken Nose\r\nEaraches', 103),
(5, 280, 4, 'No Smoker', 103),
(5, 280, 5, 'Never', 103),
(13, 281, 1, 'Web', 103),
(13, 281, 2, 'Maria@tekyz', 103),
(13, 281, 3, 'boo', 103),
(13, 281, 4, 'Dropbox', 103),
(4, 282, 15, 'Achievo', 103),
(4, 282, 1, 'Ellis Hung', 103),
(4, 282, 2, '1994-01-02', 103),
(4, 282, 3, '2003-02-02', 103),
(4, 282, 12, '800-222-3456', 103),
(4, 282, 13, '', 103),
(4, 282, 14, '', 103),
(3, 283, 20, 'Wells Fargo', 103),
(9, 284, 4, 'Truck', 103),
(9, 284, 1, 'Automobile', 103),
(9, 284, 2, '', 103),
(9, 284, 3, 'Liability Only', 103),
(6, 285, 4, 'AT&T Phone', 103),
(6, 285, 1, 'Phone', 103),
(6, 285, 2, '135.00', 103),
(6, 285, 3, '2012-11-01', 103),
(6, 286, 4, 'AT&T U-verse', 103),
(6, 286, 1, 'Cable', 103),
(6, 286, 2, '80.00', 103),
(6, 286, 3, '2012-11-01', 103),
(14, 287, 9, 'Rooney & Assoc', 103),
(14, 287, 1, 'Jeff Rooney', 103),
(14, 287, 2, 'San Ramon, CA ', 103),
(14, 287, 3, 'jeffrooney@yahoo.com', 103),
(14, 288, 9, 'Gil Ortega', 100),
(14, 288, 1, 'Gil Ortega', 100),
(14, 288, 2, '11427 East Sweetwater avenue\r\nScottsdale, AZ 85259', 100),
(14, 288, 3, 'gil@infinitudeinc.com', 100),
(2, 289, 3, 'President', 100),
(2, 289, 1, '1972-11-24', 100),
(2, 289, 2, '', 100),
(4, 290, 15, 'President', 100),
(4, 290, 1, 'Infinitude Inc', 100),
(4, 290, 2, '', 100),
(4, 290, 3, '', 100),
(4, 290, 12, '', 100),
(4, 290, 13, '', 100),
(4, 290, 14, '', 100),
(5, 291, 15, 'Gil Ortega', 100),
(5, 291, 1, 'NKDA', 100),
(5, 291, 2, 'MVT', 100),
(5, 291, 3, 'noncontributory', 100),
(5, 291, 4, 'No Smoker', 100),
(5, 291, 5, 'Occasionally', 100),
(13, 292, 1, 'Web', 100),
(13, 292, 2, '', 100),
(13, 292, 3, '', 100),
(13, 292, 4, 'RMI', 100),
(10, 293, 4, 'Stingray Sushi', 100),
(10, 293, 1, 'Restaurant', 100),
(10, 293, 2, 'Stingray Sushi', 100),
(10, 293, 3, '(480) 427-2011', 100),
(9, 294, 4, 'Car Insurance', 100),
(9, 294, 1, 'Automobile', 100),
(9, 294, 2, '', 100),
(9, 294, 3, 'Allstate: 916391804', 100),
(6, 295, 4, 'Verizon Wireless', 100),
(6, 295, 1, 'Phone', 100),
(6, 295, 2, '100', 100),
(6, 295, 3, '', 100),
(11, 296, 1, 'iPhone', 100),
(11, 296, 2, '', 100),
(11, 296, 3, '', 100),
(11, 296, 4, '', 100),
(11, 296, 5, 'iPhone', 100),
(14, 297, 9, 'Wife', 100),
(14, 297, 1, 'Ashleigh', 100),
(14, 297, 2, '', 100),
(14, 297, 3, '', 100),
(14, 298, 9, 'Infinitude Inc Headquarters', 100),
(14, 298, 1, 'Infinitude Office', 100),
(14, 298, 2, '7702 East Doubletree Ranch Road\r\nScottsdale, AZ 85258', 100),
(14, 298, 3, 'info@infinitudeinc.com', 100),
(5, 299, 15, 'Syrgery date', 102),
(5, 299, 1, '', 102),
(5, 299, 2, '', 102),
(5, 299, 3, '', 102),
(5, 299, 5, '', 102),
(5, 300, 15, 'Sergery date', 115),
(5, 300, 1, 'Dust', 115),
(5, 300, 2, 'Dispirin', 115),
(5, 300, 3, 'Not known', 115),
(5, 300, 4, 'Smoker', 115),
(5, 300, 5, 'Occasionally', 115),
(4, 301, 15, 'Microsoft', 102),
(4, 301, 1, 'Microsoft', 102),
(4, 301, 2, '1942-03-02', 102),
(4, 301, 3, '1941-02-02', 102),
(4, 301, 12, '', 102),
(4, 301, 13, '', 102),
(4, 301, 14, '', 102),
(5, 302, 15, 'fever', 102),
(5, 302, 1, '', 102),
(5, 302, 2, 'No', 102),
(5, 302, 3, '', 102),
(5, 302, 4, 'No Smoker', 102),
(5, 302, 5, 'Never', 102),
(9, 303, 4, 'Health Insurance', 1),
(9, 303, 1, 'Disability', 1),
(9, 303, 2, '163', 1),
(9, 303, 5, 'policy 022485271', 1),
(9, 303, 3, 'Here come the notes.', 1),
(9, 304, 4, 'Jaguar Registration', 86),
(9, 304, 1, 'Automobile', 86),
(9, 304, 2, '164', 86),
(9, 304, 5, 'Policy 001', 86),
(9, 304, 3, 'Jaguar 2011', 86),
(9, 305, 4, 'Hello', 102),
(9, 305, 1, 'Home', 102),
(9, 305, 2, '165', 102),
(9, 305, 5, '11121212', 102),
(9, 305, 3, 'sdf', 102),
(14, 308, 1, 'Gil Ortega', 117),
(9, 307, 5, 'Jaguar 2011', 1),
(9, 307, 3, 'Policy 0561512', 1),
(14, 308, 2, '', 117),
(14, 308, 3, '', 117),
(14, 309, 1, 'Gil Ortega', 110),
(14, 309, 2, '', 110),
(14, 309, 3, '', 110),
(14, 310, 1, 'Ryan Williams', 119),
(14, 310, 2, '', 119),
(14, 310, 3, '', 119),
(4, 311, 15, 'Computer software Inc', 119),
(4, 311, 1, '', 119),
(4, 311, 2, '', 119),
(4, 311, 3, '', 119),
(4, 311, 12, '', 119),
(4, 311, 13, '', 119),
(4, 311, 14, '', 119),
(14, 312, 1, 'Javier Hernandez', 119),
(14, 312, 2, '', 119),
(14, 312, 3, '', 119),
(14, 313, 1, 'Edward Johnson', 119),
(14, 313, 2, '', 119),
(14, 313, 3, '', 119),
(14, 316, 3, '', 102),
(14, 316, 2, 'This is test address', 102),
(14, 316, 1, 'Test', 102),
(14, 315, 1, 'Test', 102),
(14, 315, 2, 'This is test address', 102),
(14, 315, 3, '', 102),
(14, 317, 1, 'Gil Ortega', 123),
(14, 317, 2, 'Infinitude Inc\r\n7702 East Doubletree Ranch Road\r\nSuite 300\r\nScottsdale, AZ 85258', 123),
(14, 317, 3, 'info@infinitudeinc.com', 123),
(10, 318, 4, 'RMI', 123),
(10, 318, 1, 'Web', 123),
(10, 318, 2, 'www.registermyinfo.com', 123),
(10, 318, 3, '(480) 348-3974', 123),
(5, 319, 15, 'RMI med history', 123),
(5, 319, 1, 'NKDS', 123),
(5, 319, 2, 'None', 123),
(5, 319, 3, 'negative', 123),
(5, 319, 4, 'No Smoker', 123),
(5, 319, 5, 'Never', 123),
(4, 320, 15, 'President', 123),
(4, 320, 1, 'RMI', 123),
(4, 320, 2, '2012-04-11', 123),
(4, 320, 3, '', 123),
(4, 320, 12, '', 123),
(4, 320, 13, '', 123),
(4, 320, 14, '', 123),
(9, 321, 4, 'Allstate', 123),
(9, 321, 1, 'Automobile', 123),
(9, 321, 2, '', 123),
(9, 321, 3, '1234567', 123),
(9, 321, 5, '', 123),
(11, 322, 1, 'iPhone', 123),
(11, 322, 2, '2011-01-01', 123),
(11, 322, 3, '', 123),
(11, 322, 4, '', 123),
(11, 322, 5, 'iPhone', 123),
(3, 323, 20, 'RMI', 123),
(14, 324, 1, 'Jim Scheller', 141),
(14, 324, 2, '14520 North Quartz Court\r\nFountain Hills, AZ 85268', 141),
(14, 324, 3, 'jscheller@csoftware.com', 141),
(14, 325, 1, 'simplw', 102),
(14, 325, 2, 'sdfsdf', 102),
(14, 325, 3, 'sdfsd@dft.fhg', 102);

-- --------------------------------------------------------

--
-- Table structure for table `data_group_sharing`
--

CREATE TABLE IF NOT EXISTS `data_group_sharing` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `contact_uid` int(11) NOT NULL,
  `nid` int(11) NOT NULL,
  `direction` int(128) DEFAULT '0',
  PRIMARY KEY (`share_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `data_group_sharing`
--

INSERT INTO `data_group_sharing` (`share_id`, `uid`, `contact_uid`, `nid`, `direction`) VALUES
(1, 1, 92, 14, 0),
(2, 1, 92, 4, 0),
(3, 113, 113, 14, 0),
(4, 113, 113, 4, 0),
(5, 113, 113, 6, 0),
(6, 113, 113, 10, 0),
(7, 113, 113, 3, 0),
(8, 113, 113, 8, 0),
(9, 114, 113, 14, 0),
(10, 114, 113, 4, 0),
(11, 114, 113, 6, 0),
(12, 114, 113, 10, 0),
(13, 114, 113, 3, 0),
(14, 114, 113, 8, 0),
(15, 86, 1, 5, 0),
(16, 1, 86, 5, 0),
(17, 102, 94, 14, 0),
(27, 102, 91, 14, 0),
(19, 103, 116, 14, 0),
(20, 103, 116, 4, 0),
(22, 86, 1, 9, 0),
(23, 1, 86, 14, 0),
(24, 102, 94, 6, 0),
(25, 102, 94, 10, 0),
(26, 102, 94, 3, 0),
(28, 102, 91, 4, 0),
(29, 102, 91, 6, 0),
(30, 102, 91, 10, 0),
(31, 102, 91, 3, 0),
(34, 119, 110, 14, 0),
(35, 119, 110, 4, 0),
(36, 119, 110, 6, 0),
(37, 119, 110, 9, 0),
(38, 119, 100, 14, 0),
(39, 119, 100, 4, 0),
(40, 119, 100, 6, 0),
(41, 119, 100, 10, 0),
(42, 119, 100, 3, 0),
(43, 119, 100, 12, 0),
(44, 119, 100, 7, 0),
(45, 119, 100, 5, 0),
(46, 119, 100, 2, 0),
(47, 119, 100, 11, 0),
(48, 119, 100, 13, 0),
(49, 102, 120, 14, 0),
(50, 102, 120, 4, 0),
(51, 102, 120, 8, 0),
(52, 1, 94, 12, 0),
(53, 123, 110, 14, 0),
(54, 123, 110, 10, 0),
(55, 127, 127, 14, 0),
(56, 127, 127, 4, 0),
(57, 127, 127, 6, 0),
(58, 127, 127, 10, 0),
(59, 127, 127, 3, 0),
(60, 127, 127, 8, 0),
(61, 128, 128, 12, 0),
(62, 133, 133, 8, 0),
(63, 132, 132, 6, 0),
(64, 132, 132, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filemime` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=168 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`fid`, `uid`, `filename`, `filepath`, `filemime`, `filesize`, `status`, `timestamp`) VALUES
(1, 1, 'Test.docx', 'sites/default/files/webform/cv/Test_6.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1342611111),
(72, 86, 'insurance_delete.jpg', 'sites/default/files/webform/policy/insurance_delete.jpg', 'image/jpeg', 84740, 1, 1346917369),
(71, 86, 'Financial.jpg', 'sites/default/files/webform/photo-home-registry/Financial.jpg', 'image/jpeg', 74247, 1, 1346917133),
(3, 87, 'Test.docx', 'sites/default/files/webform/recommendation_letter/Test_6.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1342611111),
(5, 1, 'employment_info_letters_of_recommendation_tpl.csv', 'sites/default/files/imports/employment_info_letters_of_recommendation_tpl.csv', 'text/csv', 101, 0, 1342615445),
(6, 1, 'expenses_tpl.csv', 'sites/default/files/imports/expenses_tpl.csv', 'text/csv', 211, 0, 1342615464),
(7, 1, 'favorites_tpl.csv', 'sites/default/files/imports/favorites_tpl.csv', 'text/csv', 221, 0, 1342615489),
(8, 1, 'financial_tpl.csv', 'sites/default/files/imports/financial_tpl.csv', 'text/csv', 81, 0, 1342615547),
(9, 1, 'financial_bank_account_tpl.csv', 'sites/default/files/imports/financial_bank_account_tpl.csv', 'text/csv', 79, 0, 1342615576),
(10, 1, 'financial_credit_debit_cards_tpl.csv', 'sites/default/files/imports/financial_credit_debit_cards_tpl.csv', 'text/csv', 136, 0, 1342615594),
(11, 1, 'financial_credit_scores_tpl.csv', 'sites/default/files/imports/financial_credit_scores_tpl.csv', 'text/csv', 65, 0, 1342615699),
(12, 1, 'financial_loans_tpl.csv', 'sites/default/files/imports/financial_loans_tpl.csv', 'text/csv', 91, 0, 1342615723),
(13, 1, 'government_id_tpl.csv', 'sites/default/files/imports/government_id_tpl.csv', 'text/csv', 282, 0, 1342615757),
(14, 1, 'home_registry_tpl.csv', 'sites/default/files/imports/home_registry_tpl.csv', 'text/csv', 144, 0, 1342615819),
(15, 1, 'insurance_and_car_registration_tpl.csv', 'sites/default/files/imports/insurance_and_car_registration_tpl.csv', 'text/csv', 260, 0, 1342615849),
(16, 1, 'maintenance_and_recalls_tpl.csv', 'sites/default/files/imports/maintenance_and_recalls_tpl.csv', 'text/csv', 178, 0, 1342615870),
(17, 1, 'medical_history_tpl.csv', 'sites/default/files/imports/medical_history_tpl.csv', 'text/csv', 223, 0, 1342615902),
(18, 1, 'medical_history_implants_tpl.csv', 'sites/default/files/imports/medical_history_implants_tpl.csv', 'text/csv', 110, 0, 1342615919),
(19, 1, 'medical_history_surgeries_tpl.csv', 'sites/default/files/imports/medical_history_surgeries_tpl.csv', 'text/csv', 90, 0, 1342615951),
(20, 1, 'personal_data_tpl.csv', 'sites/default/files/imports/personal_data_tpl.csv', 'text/csv', 187, 0, 1342615991),
(21, 1, 'product_&_warranties_tpl.csv', 'sites/default/files/imports/product_&_warranties_tpl.csv', 'text/csv', 288, 0, 1342616013),
(22, 1, 'websites_tpl.csv', 'sites/default/files/imports/websites_tpl.csv', 'text/csv', 218, 0, 1342616036),
(23, 1, 'contact_info_tpl.csv', 'sites/default/files/imports/contact_info_tpl.csv', 'text/csv', 400, 0, 1342616522),
(24, 1, 'contact_info_telephone_tpl.csv', 'sites/default/files/imports/contact_info_telephone_tpl.csv', 'text/csv', 249, 0, 1342616537),
(25, 1, 'employment_info_tpl.csv', 'sites/default/files/imports/employment_info_tpl.csv', 'text/csv', 370, 0, 1342616567),
(146, 1, 'Test file.docx', 'sites/default/files/webform/recommendation_letter/Test file.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 0, 1349096229),
(145, 1, 'Test file.docx', 'sites/default/files/webform/cv/Test file.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 1, 1349096191),
(28, 91, 'dualscreenwall16.jpg', 'sites/default/files/webform/cv/dualscreenwall16.jpg', 'image/jpeg', 107944, 0, 1343822124),
(29, 91, 'Test.docx', 'sites/default/files/webform/recommendation_letter/Test.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1343822721),
(30, 91, 'Test.docx', 'sites/default/files/webform/recommendation_letter/Test_0.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1343823079),
(31, 91, '131ML34562230-3K01.jpg', 'sites/default/files/webform/photo_gov_id/131ML34562230-3K01.jpg', 'image/jpeg', 366223, 0, 1343887581),
(32, 91, 'Daily.xlsx', 'sites/default/files/webform/photo-home-registry/Daily.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 38206, 1, 1343888286),
(33, 91, '537677_10150848200487213_1601604573_n.jpg', 'sites/default/files/webform/policy/537677_10150848200487213_1601604573_n.jpg', 'image/jpeg', 35892, 1, 1343889104),
(34, 91, 'glass-apples-abstract-5808.jpg', 'sites/default/files/webform/glass-apples-abstract-5808.jpg', 'image/jpeg', 84200, 1, 1343894204),
(35, 1, 'contact_info_telephone_tpl.csv', 'sites/default/files/imports/contact_info_telephone_tpl.csv', 'text/csv', 249, 0, 1344255463),
(36, 1, 'contact_info_telephone_tpl.csv', 'sites/default/files/imports/contact_info_telephone_tpl.csv', 'text/csv', 249, 0, 1344256553),
(37, 1, 'contact_info_tpl.csv', 'sites/default/files/imports/contact_info_tpl.csv', 'text/csv', 498, 0, 1344256703),
(38, 1, 'employment_info_tpl.csv', 'sites/default/files/imports/employment_info_tpl.csv', 'text/csv', 453, 0, 1344256905),
(39, 1, 'contact_info_telephone_tpl.csv', 'sites/default/files/imports/contact_info_telephone_tpl.csv', 'text/csv', 249, 0, 1344355400),
(40, 1, 'expenses_tpl.csv', 'sites/default/files/imports/expenses_tpl.csv', 'text/csv', 256, 0, 1344355593),
(41, 1, 'contact_info_tpl.csv', 'sites/default/files/imports/contact_info_tpl.csv', 'text/csv', 594, 0, 1344448875),
(42, 1, 'contact_info_tpl.csv', 'sites/default/files/imports/contact_info_tpl.csv', 'text/csv', 594, 0, 1344448960),
(43, 1, 'employment_info_tpl.csv', 'sites/default/files/imports/employment_info_tpl.csv', 'text/csv', 532, 0, 1344449310),
(44, 1, 'contact_info_tpl.csv', 'sites/default/files/imports/contact_info_tpl.csv', 'text/csv', 594, 0, 1344450872),
(45, 1, 'favorites_tpl.csv', 'sites/default/files/imports/favorites_tpl.csv', 'text/csv', 268, 0, 1344450898),
(46, 1, 'financial_tpl.csv', 'sites/default/files/imports/financial_tpl.csv', 'text/csv', 124, 0, 1344450986),
(47, 1, 'financial_bank_account_tpl.csv', 'sites/default/files/imports/financial_bank_account_tpl.csv', 'text/csv', 79, 0, 1344451023),
(48, 1, 'financial_credit_debit_cards_tpl.csv', 'sites/default/files/imports/financial_credit_debit_cards_tpl.csv', 'text/csv', 136, 0, 1344451037),
(49, 1, 'financial_credit_scores_tpl.csv', 'sites/default/files/imports/financial_credit_scores_tpl.csv', 'text/csv', 65, 0, 1344451057),
(50, 1, 'financial_loans_tpl.csv', 'sites/default/files/imports/financial_loans_tpl.csv', 'text/csv', 91, 0, 1344451071),
(51, 1, 'government_id_tpl.csv', 'sites/default/files/imports/government_id_tpl.csv', 'text/csv', 342, 0, 1344451152),
(52, 1, 'home_registry_tpl.csv', 'sites/default/files/imports/home_registry_tpl.csv', 'text/csv', 173, 0, 1344451291),
(53, 1, 'insurance_and_car_registration_tpl.csv', 'sites/default/files/imports/insurance_and_car_registration_tpl.csv', 'text/csv', 391, 0, 1344451367),
(54, 1, 'maintenance_and_recalls_tpl.csv', 'sites/default/files/imports/maintenance_and_recalls_tpl.csv', 'text/csv', 253, 0, 1344451438),
(55, 1, 'medical_history_tpl.csv', 'sites/default/files/imports/medical_history_tpl.csv', 'text/csv', 318, 0, 1344451531),
(56, 1, 'personal_data_tpl.csv', 'sites/default/files/imports/personal_data_tpl.csv', 'text/csv', 276, 0, 1344451604),
(57, 1, 'product_&_warranties_tpl.csv', 'sites/default/files/imports/product_&_warranties_tpl.csv', 'text/csv', 408, 0, 1344451681),
(58, 1, 'websites_tpl.csv', 'sites/default/files/imports/websites_tpl.csv', 'text/csv', 317, 0, 1344451751),
(59, 1, 'RMI_Data_Groups_SAMPLE_CSV_DATA.zip', 'sites/default/files/imports/RMI_Data_Groups_SAMPLE_CSV_DATA.zip', 'application/zip', 17504, 0, 1345253072),
(60, 1, 'REGISTER MY INFO Data Groups 1 2 (2).xlsx', 'sites/default/files/imports/REGISTER MY INFO Data Groups 1 2 (2).xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 14877, 0, 1345253224),
(61, 1, 'contact_info_telephone_tpl.csv', 'sites/default/files/imports/contact_info_telephone_tpl.csv', 'text/csv', 249, 0, 1345473729),
(62, 1, 'employment_info_letters_of_recommendation_tpl.csv', 'sites/default/files/imports/employment_info_letters_of_recommendation_tpl.csv', 'text/csv', 101, 0, 1345473773),
(63, 1, 'expenses_tpl.csv', 'sites/default/files/imports/expenses_tpl.csv', 'text/csv', 211, 0, 1345473847),
(64, 102, 'Test.docx', 'sites/default/files/webform/cv/Test.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1346419251),
(87, 86, 'Test file.docx', 'sites/default/files/webform/recommendation_letter/Test file_2.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 0, 1348651452),
(66, 102, 'a.bmp', 'sites/default/files/webform/photo_gov_id/a.bmp', 'image/x-ms-bmp', 151374, 0, 1346419456),
(67, 102, 'a.bmp', 'sites/default/files/webform/photo-home-registry/a.bmp', 'image/x-ms-bmp', 151374, 1, 1346419496),
(68, 102, 'dualscreenwall16.jpg', 'sites/default/files/webform/policy/dualscreenwall16.jpg', 'image/jpeg', 107944, 1, 1346419626),
(78, 1, 'contact_info_tpl.csv', 'sites/default/files/imports/contact_info_tpl.csv', 'text/csv', 1198, 0, 1347254234),
(70, 86, 'Financial.jpg', 'sites/default/files/webform/photo_gov_id/Financial.jpg', 'image/jpeg', 74247, 1, 1346917036),
(73, 86, 'RMI Web Deliverable Release Notes_September 03, 2012.doc', 'sites/default/files/webform/RMI Web Deliverable Release Notes_September 03, 2012.doc', 'application/msword', 38400, 1, 1346917750),
(153, 1, 'pinfo.png', 'sites/default/files/webform/photo_gov_id/pinfo.png', 'image/png', 43161, 1, 1349157333),
(152, 1, 'pinfo.png', 'sites/default/files/webform/recommendation_letter/pinfo.png', 'image/png', 43161, 0, 1349156049),
(148, 1, 'Test file.docx', 'sites/default/files/webform/recommendation_letter/Test file_1.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 0, 1349096347),
(150, 1, 'Test file.docx', 'sites/default/files/webform/recommendation_letter/Test file_0.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 0, 1349156007),
(155, 1, 'pinfo.png', 'sites/default/files/webform/pinfo.png', 'image/png', 43161, 0, 1349157797),
(85, 86, 'Test file.docx', 'sites/default/files/webform/cv/Test file_1.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 1, 1348646151),
(86, 102, 'Test.docx', 'sites/default/files/webform/cv/Test_1.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1348649167),
(88, 102, 'Testdoc.doc', 'sites/default/files/webform/cv/Testdoc.doc', 'application/msword', 283648, 1, 1348652019),
(90, 102, 'Testdoc.doc', 'sites/default/files/webform/cv/Testdoc_0.doc', 'application/msword', 283648, 1, 1348652476),
(104, 86, 'Test file.docx', 'sites/default/files/webform/cv/Test file_3.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 1, 1348659384),
(103, 86, 'Test file.docx', 'sites/default/files/webform/recommendation_letter/Test file_5.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 0, 1348657889),
(92, 86, 'Test file.docx', 'sites/default/files/webform/recommendation_letter/Test file_3.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 0, 1348652939),
(93, 86, 'Test file.docx', 'sites/default/files/webform/cv/Test file_2.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 1, 1348652988),
(96, 102, 'Testdoc.doc', 'sites/default/files/webform/cv/Testdoc_1.doc', 'application/msword', 283648, 1, 1348656084),
(98, 102, 'Test.docx', 'sites/default/files/webform/recommendation_letter/Test_2.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 0, 1348656344),
(99, 102, 'Test.docx', 'sites/default/files/webform/recommendation_letter/Test_3.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 0, 1348656375),
(100, 102, 'Testdoc.doc', 'sites/default/files/webform/cv/Testdoc_2.doc', 'application/msword', 283648, 1, 1348656393),
(101, 102, 'Testdoc.doc', 'sites/default/files/webform/recommendation_letter/Testdoc.doc', 'application/msword', 283648, 0, 1348656448),
(129, 86, 'Test file.docx', 'sites/default/files/webform/recommendation_letter/Test file_4.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 0, 1348731686),
(106, 86, 'Test file.docx', 'sites/default/files/webform/cv/Test file_4.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 1, 1348659593),
(123, 86, 'Test file.docx', 'sites/default/files/webform/recommendation_letter/Test file_6.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 0, 1348662664),
(108, 102, 'Test.docx', 'sites/default/files/webform/cv/Test_2.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1348659811),
(109, 102, 'Testdoc.doc', 'sites/default/files/webform/recommendation_letter/Testdoc_0.doc', 'application/msword', 283648, 0, 1348659922),
(110, 102, 'Test.docx', 'sites/default/files/webform/cv/Test_3.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1348660136),
(111, 102, 'Testdoc.doc', 'sites/default/files/webform/recommendation_letter/Testdoc_1.doc', 'application/msword', 283648, 0, 1348660327),
(112, 102, 'Test.docx', 'sites/default/files/webform/cv/Test_4.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1348660364),
(119, 102, 'Testdoc.doc', 'sites/default/files/webform/recommendation_letter/Testdoc_2.doc', 'application/msword', 283648, 0, 1348662172),
(127, 102, 'Test.docx', 'sites/default/files/webform/cv/Test_7.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1348667100),
(120, 102, 'Test.docx', 'sites/default/files/webform/recommendation_letter/Test_1.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 0, 1348662410),
(126, 102, 'Test.docx', 'sites/default/files/webform/cv/Test_5.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1348665911),
(125, 86, 'Test.docx', 'sites/default/files/webform/recommendation_letter/Test_5.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 0, 1348664041),
(133, 102, 'Test.docx', 'sites/default/files/webform/recommendation_letter/Test_4.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 0, 1348732243),
(134, 102, '557468_4082908987492_1492190637_n.jpg', 'sites/default/files/webform/recommendation_letter/557468_4082908987492_1492190637_n.jpg', 'image/jpeg', 23003, 0, 1348732711),
(137, 88, 'test.docx', 'sites/default/files/webform/recommendation_letter/test_6.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0, 0, 1348748462),
(136, 88, 'RMI Web Deliverable Release Notes_September 03, 2012.doc', 'sites/default/files/webform/cv/RMI Web Deliverable Release Notes_September 03, 2012.doc', 'application/msword', 38400, 1, 1348748432),
(138, 88, 'RMI Web Deliverable Release Notes_September 03, 2012.doc', 'sites/default/files/webform/recommendation_letter/RMI Web Deliverable Release Notes_September 03, 2012.doc', 'application/msword', 38400, 0, 1348748495),
(139, 88, 'insurance_delete.jpg', 'sites/default/files/webform/insurance_delete.jpg', 'image/jpeg', 84740, 0, 1348748655),
(158, 102, 'Test.docx', 'sites/default/files/webform/recommendation_letter/Test_5.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 0, 1349349870),
(157, 102, 'Test.docx', 'sites/default/files/webform/Test.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1349345924),
(143, 1, 'Test file.docx', 'sites/default/files/webform/recommendation_letter/Test file_4.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 0, 1349092998),
(156, 1, 'Untitled.png', 'sites/default/files/webform/photo-home-registry/Untitled.png', 'image/png', 92996, 1, 1349157939),
(154, 1, 'Test file.docx', 'sites/default/files/webform/policy/Test file_0.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 1, 1349157568),
(159, 102, 'Test.docx', 'sites/default/files/webform/recommendation_letter/Test_7.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 0, 1349443540),
(160, 1, 'Test file.docx', 'sites/default/files/webform/recommendation_letter/Test file_7.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15413, 0, 1349674978),
(161, 102, 'Test.docx', 'sites/default/files/webform/cv/Test_8.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 259469, 1, 1349680195),
(162, 102, '542935_4129421519166_1297068637_n.jpg', 'sites/default/files/webform/recommendation_letter/542935_4129421519166_1297068637_n.jpg', 'image/jpeg', 57149, 0, 1349680323),
(163, 1, 'License.pdf', 'sites/default/files/webform/policy/License.pdf', 'application/pdf', 383987, 1, 1351665976),
(164, 86, 'audi-a3-front.jpg', 'sites/default/files/webform/policy/audi-a3-front.jpg', 'image/jpeg', 9691, 1, 1351667133),
(165, 102, '542935_4129421519166_1297068637_n.jpg', 'sites/default/files/webform/policy/542935_4129421519166_1297068637_n.jpg', 'image/jpeg', 57149, 1, 1351683389),
(166, 1, 'vch2.jpg', 'sites/default/files/webform/policy/vch2.jpg', 'image/jpeg', 60304, 1, 1351687879),
(167, 1, 'RMI2 App Icon 114 copy.ico', 'tmp/RMI2 App Icon 114 copy.ico', 'image/x-icon', 53870, 0, 1357997341);

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE IF NOT EXISTS `filters` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `format` int(11) NOT NULL DEFAULT '0',
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `fmd` (`format`,`module`,`delta`),
  KEY `list` (`format`,`weight`,`module`,`delta`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`fid`, `format`, `module`, `delta`, `weight`) VALUES
(1, 1, 'filter', 2, 0),
(2, 1, 'filter', 0, 1),
(3, 1, 'filter', 1, 2),
(4, 1, 'filter', 3, 10),
(5, 2, 'filter', 2, 0),
(6, 2, 'filter', 1, 1),
(7, 2, 'filter', 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `filter_formats`
--

CREATE TABLE IF NOT EXISTS `filter_formats` (
  `format` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `roles` varchar(255) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `filter_formats`
--

INSERT INTO `filter_formats` (`format`, `name`, `roles`, `cache`) VALUES
(1, 'Filtered HTML', ',1,2,', 1),
(2, 'Full HTML', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `flood`
--

CREATE TABLE IF NOT EXISTS `flood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `allow` (`event`,`hostname`,`timestamp`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `flood`
--

INSERT INTO `flood` (`fid`, `event`, `hostname`, `timestamp`) VALUES
(1, 'contact', '74.115.0.151', 1349440341),
(2, 'contact', '74.115.0.151', 1349445362),
(3, 'contact', '182.180.65.160', 1349681481),
(4, 'contact', '182.180.65.160', 1349681876),
(5, 'contact', '76.103.171.32', 1349794216);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`uid`, `nid`, `timestamp`) VALUES
(1, 1, 1340106215),
(1, 2, 1361346264),
(1, 3, 1350553968),
(1, 4, 1350973959),
(1, 5, 1351580237),
(1, 6, 1350452723),
(1, 7, 1349157111),
(1, 8, 1350892953),
(1, 9, 1351687847),
(1, 10, 1349157654),
(1, 11, 1349157798),
(1, 12, 1349157904),
(1, 13, 1349157982),
(1, 14, 1361356797),
(7, 10, 1340283597),
(5, 10, 1340283641),
(8, 4, 1340805892),
(8, 13, 1340890960),
(12, 2, 1341207587),
(12, 3, 1341207638),
(12, 4, 1341207836),
(13, 4, 1341930405),
(14, 9, 1341312009),
(14, 14, 1341401273),
(14, 12, 1341316914),
(15, 13, 1341320187),
(15, 14, 1341379832),
(15, 2, 1341320759),
(15, 12, 1341322542),
(15, 5, 1341323045),
(20, 14, 1341466240),
(20, 4, 1341404498),
(20, 12, 1341466988),
(20, 11, 1341465931),
(20, 10, 1341466261),
(20, 7, 1341466290),
(20, 8, 1341466440),
(20, 6, 1341466526),
(20, 9, 1341466629),
(20, 3, 1341466905),
(20, 2, 1341466814),
(20, 5, 1341466865),
(20, 13, 1341466964),
(36, 6, 1341578320),
(37, 6, 1341577582),
(39, 14, 1341920364),
(39, 13, 1341899610),
(39, 12, 1341899418),
(39, 11, 1341899057),
(39, 10, 1341902333),
(39, 9, 1341898269),
(39, 8, 1341897954),
(39, 6, 1341902139),
(39, 5, 1341897419),
(39, 4, 1341819871),
(39, 3, 1341901766),
(39, 2, 1341896962),
(39, 7, 1341901252),
(70, 4, 1341923526),
(70, 3, 1341991285),
(70, 5, 1341923991),
(70, 8, 1341924363),
(70, 10, 1341924478),
(70, 12, 1341924602),
(70, 13, 1341924917),
(70, 14, 1341999055),
(71, 9, 1341991203),
(71, 14, 1341935993),
(71, 2, 1341935921),
(71, 3, 1341936644),
(71, 6, 1341938157),
(71, 7, 1341991209),
(71, 4, 1341990514),
(70, 6, 1341990940),
(70, 7, 1341992879),
(71, 11, 1341991219),
(70, 9, 1341997888),
(70, 11, 1341999478),
(74, 11, 1342016235),
(77, 6, 1342085928),
(74, 3, 1342012065),
(74, 6, 1342015988),
(77, 4, 1342078314),
(79, 14, 1342067783),
(79, 13, 1342068044),
(79, 12, 1342068193),
(79, 11, 1342068339),
(79, 10, 1342068452),
(79, 9, 1342068782),
(79, 8, 1342068692),
(79, 7, 1342068839),
(79, 6, 1342068850),
(79, 5, 1342068910),
(79, 4, 1342075794),
(79, 3, 1342069792),
(79, 2, 1342069899),
(74, 4, 1342073526),
(81, 14, 1342071662),
(81, 13, 1342071663),
(81, 12, 1342071664),
(81, 4, 1342071889),
(81, 3, 1342072159),
(81, 2, 1342072229),
(81, 10, 1342072275),
(81, 9, 1342073755),
(81, 8, 1342072440),
(81, 7, 1342072356),
(1, 15, 1361428226),
(77, 15, 1342077004),
(79, 15, 1342197408),
(77, 14, 1342445071),
(77, 11, 1342076882),
(77, 8, 1342076885),
(77, 7, 1342076897),
(77, 9, 1342076899),
(77, 3, 1342085929),
(77, 5, 1342078382),
(74, 15, 1342160189),
(86, 15, 1350296773),
(1, 17, 1349432574),
(1, 18, 1360906125),
(1, 19, 1343801175),
(1, 20, 1360905983),
(88, 14, 1346934482),
(91, 14, 1343990533),
(91, 4, 1343822772),
(91, 15, 1343892264),
(91, 6, 1343881777),
(91, 10, 1343881911),
(91, 3, 1343884569),
(91, 8, 1343887581),
(91, 12, 1343888245),
(91, 9, 1343889057),
(91, 7, 1343889415),
(91, 5, 1343891620),
(91, 2, 1343892985),
(91, 11, 1343894173),
(91, 13, 1343894637),
(92, 5, 1343986826),
(92, 14, 1343990299),
(86, 14, 1349442362),
(93, 15, 1344230974),
(92, 15, 1344231676),
(94, 15, 1344249178),
(95, 15, 1344236160),
(95, 18, 1344236902),
(86, 20, 1349786911),
(94, 14, 1344248325),
(96, 15, 1344249225),
(1, 21, 1361428158),
(97, 21, 1344251190),
(99, 21, 1344255024),
(103, 21, 1352954022),
(103, 14, 1351617879),
(103, 4, 1350433863),
(105, 21, 1344336992),
(112, 21, 1348117264),
(103, 15, 1352261256),
(113, 21, 1353059260),
(113, 14, 1346244615),
(113, 4, 1346406082),
(113, 6, 1345198624),
(113, 10, 1345198651),
(113, 8, 1345199069),
(113, 12, 1345199542),
(113, 13, 1345202734),
(113, 9, 1346406661),
(113, 7, 1345200005),
(113, 5, 1346389567),
(113, 2, 1345702804),
(113, 11, 1345202593),
(103, 3, 1350433891),
(112, 3, 1344859959),
(112, 4, 1344860784),
(112, 12, 1344861071),
(112, 7, 1344861085),
(112, 6, 1344861105),
(112, 10, 1344861128),
(101, 14, 1345009288),
(101, 4, 1346415722),
(101, 6, 1345010313),
(101, 10, 1345010341),
(101, 3, 1345010519),
(101, 8, 1345010611),
(101, 12, 1345010663),
(101, 9, 1345010864),
(101, 7, 1345010873),
(101, 5, 1345010894),
(101, 2, 1345011203),
(101, 13, 1345011233),
(113, 3, 1346405573),
(113, 15, 1346245218),
(121, 21, 1345194717),
(121, 14, 1345196425),
(121, 4, 1345197038),
(122, 21, 1357846351),
(122, 20, 1345197518),
(122, 18, 1357846360),
(123, 21, 1359305186),
(123, 18, 1361054159),
(123, 17, 1345197937),
(123, 20, 1361054173),
(123, 15, 1361198796),
(1, 22, 1361179585),
(1, 23, 1360906016),
(124, 21, 1345727329),
(125, 21, 1345727523),
(113, 20, 1345803221),
(113, 18, 1353059359),
(116, 4, 1345804235),
(126, 21, 1345804693),
(126, 12, 1345804837),
(126, 9, 1345883142),
(126, 5, 1345811410),
(126, 11, 1345811811),
(126, 4, 1345808210),
(126, 14, 1345884899),
(116, 15, 1345808189),
(116, 14, 1345808721),
(126, 6, 1345809725),
(126, 10, 1345809808),
(126, 3, 1345885075),
(126, 8, 1345810730),
(126, 7, 1345811293),
(126, 2, 1345811769),
(126, 13, 1345812073),
(127, 14, 1346304100),
(127, 4, 1346304268),
(127, 20, 1346304329),
(127, 15, 1346304314),
(127, 18, 1346304332),
(127, 17, 1346304338),
(127, 13, 1346306196),
(113, 17, 1346318760),
(129, 14, 1346327343),
(129, 15, 1346386867),
(129, 20, 1346327102),
(129, 17, 1346327515),
(129, 18, 1346327507),
(129, 4, 1346327537),
(129, 6, 1346386884),
(129, 10, 1346386942),
(129, 3, 1346387000),
(129, 2, 1346387353),
(129, 8, 1346387401),
(113, 23, 1353060943),
(113, 22, 1346415292),
(102, 14, 1361183642),
(102, 4, 1351773908),
(102, 6, 1349342657),
(102, 10, 1349258814),
(102, 3, 1349267349),
(102, 8, 1351602300),
(102, 12, 1346419484),
(102, 9, 1351680013),
(102, 11, 1349345843),
(102, 2, 1351661689),
(102, 5, 1351659776),
(102, 13, 1349345991),
(102, 7, 1349343618),
(102, 15, 1361352279),
(107, 21, 1346676672),
(108, 21, 1346704541),
(109, 21, 1346738060),
(109, 15, 1346739151),
(107, 15, 1346820673),
(109, 11, 1346925342),
(109, 9, 1346934786),
(109, 8, 1346935236),
(109, 6, 1346935511),
(109, 3, 1346935530),
(88, 15, 1347013370),
(88, 3, 1346996532),
(88, 9, 1347889011),
(88, 5, 1346997405),
(88, 11, 1348748655),
(88, 12, 1347889877),
(88, 20, 1347013378),
(103, 10, 1350412071),
(103, 12, 1350433577),
(103, 5, 1351617718),
(103, 8, 1347053055),
(110, 21, 1352262803),
(110, 14, 1352262829),
(110, 15, 1353359633),
(110, 10, 1347135993),
(110, 5, 1352263139),
(110, 17, 1347136027),
(110, 18, 1353359578),
(110, 20, 1353359528),
(109, 14, 1347348801),
(86, 5, 1349442378),
(1, 24, 1347883720),
(86, 24, 1349439117),
(88, 8, 1347889836),
(86, 4, 1349442364),
(88, 4, 1348655866),
(86, 10, 1349442368),
(86, 11, 1349442380),
(1, 25, 1349163286),
(1, 26, 1349163282),
(102, 21, 1361183510),
(86, 21, 1355877461),
(86, 3, 1349442370),
(1, 27, 1360905981),
(1, 28, 1360905726),
(1, 29, 1360906073),
(1, 30, 1360905980),
(86, 17, 1349432510),
(102, 28, 1352893896),
(102, 29, 1352893761),
(102, 18, 1352892878),
(102, 30, 1352894410),
(102, 27, 1352895077),
(102, 20, 1351841207),
(86, 27, 1350297329),
(86, 28, 1349789194),
(86, 18, 1349786906),
(86, 6, 1349442366),
(86, 8, 1349442371),
(86, 12, 1349442373),
(86, 9, 1351667067),
(86, 7, 1349442376),
(86, 2, 1349442379),
(86, 13, 1349442382),
(103, 23, 1350665777),
(103, 22, 1351616517),
(103, 18, 1350665673),
(103, 27, 1351182204),
(103, 28, 1350659719),
(103, 30, 1351182207),
(103, 20, 1350665757),
(86, 29, 1349788970),
(102, 23, 1352194898),
(103, 2, 1350434235),
(103, 29, 1350659726),
(103, 13, 1350433779),
(103, 9, 1351784812),
(103, 6, 1351182636),
(1, 31, 1360905982),
(1, 32, 1360905981),
(103, 31, 1350665773),
(103, 32, 1351181445),
(100, 21, 1350860922),
(100, 14, 1350758071),
(100, 2, 1350757563),
(100, 4, 1350757592),
(100, 5, 1350757619),
(100, 13, 1350757706),
(100, 10, 1350757750),
(100, 3, 1350757857),
(100, 9, 1350757878),
(100, 6, 1350757943),
(100, 11, 1350757994),
(100, 15, 1351973362),
(100, 18, 1351739540),
(100, 27, 1351739545),
(100, 20, 1351807714),
(102, 31, 1351840925),
(102, 32, 1352194930),
(115, 21, 1350994225),
(116, 21, 1351058820),
(115, 15, 1351599489),
(110, 23, 1353161747),
(110, 22, 1353161741),
(110, 28, 1353161707),
(110, 11, 1351196390),
(100, 22, 1351807725),
(100, 31, 1351807717),
(100, 32, 1351807749),
(115, 5, 1351597852),
(115, 22, 1351599171),
(115, 23, 1351598618),
(115, 18, 1351599490),
(102, 24, 1351841311),
(117, 21, 1351973584),
(117, 14, 1351974063),
(117, 20, 1351974753),
(117, 31, 1351977201),
(117, 32, 1351974854),
(117, 18, 1351974857),
(117, 15, 1351975655),
(110, 27, 1353359580),
(110, 31, 1353359552),
(110, 32, 1353161734),
(110, 29, 1353359586),
(110, 30, 1353359590),
(118, 21, 1354640855),
(118, 14, 1354640875),
(118, 15, 1354642702),
(118, 4, 1354640952),
(118, 5, 1354641023),
(118, 9, 1354641103),
(118, 18, 1354642416),
(118, 27, 1354642412),
(118, 20, 1354643133),
(118, 31, 1354642305),
(118, 29, 1354643066),
(118, 28, 1354643075),
(119, 21, 1355592307),
(119, 14, 1355594664),
(119, 4, 1355592429),
(119, 15, 1355877332),
(119, 18, 1355877337),
(119, 27, 1355592485),
(119, 20, 1355592499),
(120, 21, 1356344000),
(122, 15, 1357848244),
(123, 14, 1359305266),
(123, 10, 1359305288),
(123, 5, 1359305322),
(123, 4, 1359305372),
(123, 9, 1359305409),
(123, 11, 1359305509),
(123, 8, 1359305533),
(123, 3, 1359307942),
(123, 31, 1359917408),
(123, 32, 1359917959),
(123, 30, 1359900235),
(123, 27, 1359916499),
(123, 12, 1359917434),
(139, 21, 1360801576),
(139, 15, 1360801578),
(141, 14, 1360873345),
(141, 5, 1360873422),
(144, 21, 1361182259),
(144, 15, 1361182261);

-- --------------------------------------------------------

--
-- Table structure for table `menu_custom`
--

CREATE TABLE IF NOT EXISTS `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`menu_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_custom`
--

INSERT INTO `menu_custom` (`menu_name`, `title`, `description`) VALUES
('navigation', 'Navigation', 'The navigation menu is provided by Drupal and is the main interactive menu for any site. It is usually the only menu that contains personalized links for authenticated users, and is often not even visible to anonymous users.'),
('primary-links', 'Primary links', 'Primary links are often used at the theme layer to show the major sections of a site. A typical representation for primary links would be tabs along the top.'),
('secondary-links', 'Secondary links', 'Secondary links are often used for pages like legal notices, contact details, and other secondary navigation items that play a lesser role than primary links'),
('menu-my-account-nav', 'My Account menu', 'Used for my account navigation');

-- --------------------------------------------------------

--
-- Table structure for table `menu_links`
--

CREATE TABLE IF NOT EXISTS `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `mlid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plid` int(10) unsigned NOT NULL DEFAULT '0',
  `link_path` varchar(255) NOT NULL DEFAULT '',
  `router_path` varchar(255) NOT NULL DEFAULT '',
  `link_title` varchar(255) NOT NULL DEFAULT '',
  `options` text,
  `module` varchar(255) NOT NULL DEFAULT 'system',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `external` smallint(6) NOT NULL DEFAULT '0',
  `has_children` smallint(6) NOT NULL DEFAULT '0',
  `expanded` smallint(6) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `depth` smallint(6) NOT NULL DEFAULT '0',
  `customized` smallint(6) NOT NULL DEFAULT '0',
  `p1` int(10) unsigned NOT NULL DEFAULT '0',
  `p2` int(10) unsigned NOT NULL DEFAULT '0',
  `p3` int(10) unsigned NOT NULL DEFAULT '0',
  `p4` int(10) unsigned NOT NULL DEFAULT '0',
  `p5` int(10) unsigned NOT NULL DEFAULT '0',
  `p6` int(10) unsigned NOT NULL DEFAULT '0',
  `p7` int(10) unsigned NOT NULL DEFAULT '0',
  `p8` int(10) unsigned NOT NULL DEFAULT '0',
  `p9` int(10) unsigned NOT NULL DEFAULT '0',
  `updated` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=289 ;

--
-- Dumping data for table `menu_links`
--

INSERT INTO `menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES
('navigation', 1, 0, 'batch', 'batch', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 2, 0, 'admin', 'admin', 'Administer', 'a:0:{}', 'system', 0, 0, 1, 0, 9, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 3, 0, 'node', 'node', 'Content', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 4, 0, 'logout', 'logout', 'Log out', 'a:0:{}', 'system', 0, 0, 0, 0, 10, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 5, 0, 'rss.xml', 'rss.xml', 'RSS feed', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 6, 0, 'user', 'user', 'User account', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 7, 0, 'node/%', 'node/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 8, 2, 'admin/compact', 'admin/compact', 'Compact mode', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 2, 8, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 9, 0, 'filter/tips', 'filter/tips', 'Compose tips', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 10, 2, 'admin/content', 'admin/content', 'Content management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:27:"Manage your site''s content.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 11, 0, 'node/add', 'node/add', 'Create content', 'a:0:{}', 'system', 0, 0, 1, 0, 1, 1, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 12, 0, 'comment/delete', 'comment/delete', 'Delete comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 13, 0, 'comment/edit', 'comment/edit', 'Edit comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 14, 0, 'system/files', 'system/files', 'File download', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 15, 2, 'admin/help', 'admin/help', 'Help', 'a:0:{}', 'system', 0, 0, 0, 0, 9, 2, 0, 2, 15, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 16, 2, 'admin/reports', 'admin/reports', 'Reports', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:59:"View reports from system logs and other status information.";}}', 'system', 0, 0, 1, 0, 5, 2, 0, 2, 16, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 17, 2, 'admin/build', 'admin/build', 'Site building', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:38:"Control how your site looks and feels.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 2, 17, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 18, 2, 'admin/settings', 'admin/settings', 'Site configuration', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:40:"Adjust basic site configuration options.";}}', 'system', 0, 0, 1, 0, -5, 2, 0, 2, 18, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 19, 0, 'user/autocomplete', 'user/autocomplete', 'User autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 20, 2, 'admin/user', 'admin/user', 'User management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"Manage your site''s users, groups and access to site features.";}}', 'system', 0, 0, 1, 0, 0, 2, 0, 2, 20, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 21, 0, 'user/%', 'user/%', 'My account', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 22, 20, 'admin/user/rules', 'admin/user/rules', 'Access rules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:80:"List and create rules to disallow usernames, e-mail addresses, and IP addresses.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 22, 0, 0, 0, 0, 0, 0, 0),
('navigation', 23, 18, 'admin/settings/actions', 'admin/settings/actions', 'Actions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:41:"Manage the actions defined for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 23, 0, 0, 0, 0, 0, 0, 0),
('navigation', 24, 18, 'admin/settings/admin', 'admin/settings/admin', 'Administration theme', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:55:"Settings for how your administrative pages should look.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 24, 0, 0, 0, 0, 0, 0, 0),
('navigation', 25, 17, 'admin/build/block', 'admin/build/block', 'Blocks', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:79:"Configure what block content appears in your site''s sidebars and other regions.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 25, 0, 0, 0, 0, 0, 0, 0),
('navigation', 26, 18, 'admin/settings/clean-urls', 'admin/settings/clean-urls', 'Clean URLs', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"Enable or disable clean URLs for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 26, 0, 0, 0, 0, 0, 0, 0),
('navigation', 27, 10, 'admin/content/comment', 'admin/content/comment', 'Comments', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"List and edit site comments and the comment moderation queue.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 27, 0, 0, 0, 0, 0, 0, 0),
('navigation', 28, 10, 'admin/content/node', 'admin/content/node', 'Content', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View, edit, and delete your site''s content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 28, 0, 0, 0, 0, 0, 0, 0),
('navigation', 29, 10, 'admin/content/types', 'admin/content/types', 'Content types', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Manage posts by content type, including default status, front page promotion, etc.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 29, 0, 0, 0, 0, 0, 0, 0),
('navigation', 30, 18, 'admin/settings/date-time', 'admin/settings/date-time', 'Date and time', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:89:"Settings for how Drupal displays date and time, as well as the system''s default timezone.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 30, 0, 0, 0, 0, 0, 0, 0),
('navigation', 31, 0, 'node/%/delete', 'node/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 1, 1, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 32, 21, 'user/%/delete', 'user/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 21, 32, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 33, 18, 'admin/settings/error-reporting', 'admin/settings/error-reporting', 'Error reporting', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:93:"Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 33, 0, 0, 0, 0, 0, 0, 0),
('navigation', 34, 18, 'admin/settings/file-system', 'admin/settings/file-system', 'File system', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:68:"Tell Drupal where to store uploaded files and how they are accessed.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 34, 0, 0, 0, 0, 0, 0, 0),
('navigation', 35, 18, 'admin/settings/image-toolkit', 'admin/settings/image-toolkit', 'Image toolkit', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Choose which image toolkit to use if you have installed optional toolkits.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 35, 0, 0, 0, 0, 0, 0, 0),
('navigation', 36, 18, 'admin/settings/filters', 'admin/settings/filters', 'Input formats', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:127:"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 36, 0, 0, 0, 0, 0, 0, 0),
('navigation', 37, 18, 'admin/settings/logging', 'admin/settings/logging', 'Logging and alerts', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:156:"Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destination, such as syslog, database, email, ...etc.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 2, 18, 37, 0, 0, 0, 0, 0, 0, 0),
('navigation', 38, 17, 'admin/build/menu', 'admin/build/menu', 'Menus', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:116:"Control your site''s navigation menu, primary links and secondary links, as well as rename and reorganize menu items.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 2, 17, 38, 0, 0, 0, 0, 0, 0, 0),
('navigation', 39, 17, 'admin/build/modules', 'admin/build/modules', 'Modules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:47:"Enable or disable add-on modules for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 39, 0, 0, 0, 0, 0, 0, 0),
('navigation', 40, 18, 'admin/settings/performance', 'admin/settings/performance', 'Performance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 40, 0, 0, 0, 0, 0, 0, 0),
('navigation', 41, 20, 'admin/user/permissions', 'admin/user/permissions', 'Permissions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:64:"Determine access to features by selecting permissions for roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 41, 0, 0, 0, 0, 0, 0, 0),
('navigation', 42, 10, 'admin/content/node-settings', 'admin/content/node-settings', 'Post settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:126:"Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 42, 0, 0, 0, 0, 0, 0, 0),
('navigation', 43, 10, 'admin/content/rss-publishing', 'admin/content/rss-publishing', 'RSS publishing', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:92:"Configure the number of items per feed and whether feeds should be titles/teasers/full-text.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 43, 0, 0, 0, 0, 0, 0, 0),
('navigation', 44, 0, 'comment/reply/%', 'comment/reply/%', 'Reply to comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 45, 20, 'admin/user/roles', 'admin/user/roles', 'Roles', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"List, edit, or add user roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 45, 0, 0, 0, 0, 0, 0, 0),
('navigation', 46, 18, 'admin/settings/site-information', 'admin/settings/site-information', 'Site information', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:107:"Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 46, 0, 0, 0, 0, 0, 0, 0),
('navigation', 47, 18, 'admin/settings/site-maintenance', 'admin/settings/site-maintenance', 'Site maintenance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:63:"Take the site off-line for maintenance or bring it back online.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 47, 0, 0, 0, 0, 0, 0, 0),
('navigation', 48, 16, 'admin/reports/status', 'admin/reports/status', 'Status report', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Get a status report about your site''s operation and any detected problems.";}}', 'system', 0, 0, 0, 0, 10, 3, 0, 2, 16, 48, 0, 0, 0, 0, 0, 0, 0),
('navigation', 49, 17, 'admin/build/themes', 'admin/build/themes', 'Themes', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:57:"Change which theme your site uses or allows users to set.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 49, 0, 0, 0, 0, 0, 0, 0),
('navigation', 50, 20, 'admin/user/settings', 'admin/user/settings', 'User settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Configure default behavior of users, including registration requirements, e-mails, and user pictures.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 50, 0, 0, 0, 0, 0, 0, 0),
('navigation', 51, 20, 'admin/user/user', 'admin/user/user', 'Users', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"List, add, and edit users.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 51, 0, 0, 0, 0, 0, 0, 0),
('navigation', 52, 15, 'admin/help/block', 'admin/help/block', 'block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 52, 0, 0, 0, 0, 0, 0, 0),
('navigation', 53, 15, 'admin/help/color', 'admin/help/color', 'color', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 53, 0, 0, 0, 0, 0, 0, 0),
('navigation', 54, 15, 'admin/help/comment', 'admin/help/comment', 'comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 54, 0, 0, 0, 0, 0, 0, 0),
('navigation', 55, 15, 'admin/help/filter', 'admin/help/filter', 'filter', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 55, 0, 0, 0, 0, 0, 0, 0),
('navigation', 56, 15, 'admin/help/help', 'admin/help/help', 'help', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 56, 0, 0, 0, 0, 0, 0, 0),
('navigation', 57, 15, 'admin/help/menu', 'admin/help/menu', 'menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 57, 0, 0, 0, 0, 0, 0, 0),
('navigation', 58, 15, 'admin/help/node', 'admin/help/node', 'node', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 58, 0, 0, 0, 0, 0, 0, 0),
('navigation', 59, 15, 'admin/help/system', 'admin/help/system', 'system', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 59, 0, 0, 0, 0, 0, 0, 0),
('navigation', 60, 15, 'admin/help/user', 'admin/help/user', 'user', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 60, 0, 0, 0, 0, 0, 0, 0),
('navigation', 61, 36, 'admin/settings/filters/%', 'admin/settings/filters/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 36, 61, 0, 0, 0, 0, 0, 0),
('navigation', 62, 26, 'admin/settings/clean-urls/check', 'admin/settings/clean-urls/check', 'Clean URL check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 26, 62, 0, 0, 0, 0, 0, 0),
('navigation', 63, 23, 'admin/settings/actions/configure', 'admin/settings/actions/configure', 'Configure an advanced action', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 63, 0, 0, 0, 0, 0, 0),
('navigation', 64, 25, 'admin/build/block/configure', 'admin/build/block/configure', 'Configure block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 64, 0, 0, 0, 0, 0, 0),
('navigation', 65, 17, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Customize menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 17, 65, 0, 0, 0, 0, 0, 0, 0),
('navigation', 66, 30, 'admin/settings/date-time/lookup', 'admin/settings/date-time/lookup', 'Date and time lookup', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 30, 66, 0, 0, 0, 0, 0, 0),
('navigation', 67, 25, 'admin/build/block/delete', 'admin/build/block/delete', 'Delete block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 67, 0, 0, 0, 0, 0, 0),
('navigation', 68, 36, 'admin/settings/filters/delete', 'admin/settings/filters/delete', 'Delete input format', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 36, 68, 0, 0, 0, 0, 0, 0),
('navigation', 69, 22, 'admin/user/rules/delete', 'admin/user/rules/delete', 'Delete rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 22, 69, 0, 0, 0, 0, 0, 0),
('navigation', 70, 45, 'admin/user/roles/edit', 'admin/user/roles/edit', 'Edit role', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 45, 70, 0, 0, 0, 0, 0, 0),
('navigation', 71, 22, 'admin/user/rules/edit', 'admin/user/rules/edit', 'Edit rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 22, 71, 0, 0, 0, 0, 0, 0),
('navigation', 72, 48, 'admin/reports/status/php', 'admin/reports/status/php', 'PHP', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 72, 0, 0, 0, 0, 0, 0),
('navigation', 73, 42, 'admin/content/node-settings/rebuild', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 42, 73, 0, 0, 0, 0, 0, 0),
('navigation', 74, 23, 'admin/settings/actions/orphan', 'admin/settings/actions/orphan', 'Remove orphans', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 74, 0, 0, 0, 0, 0, 0),
('navigation', 75, 48, 'admin/reports/status/run-cron', 'admin/reports/status/run-cron', 'Run cron', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 75, 0, 0, 0, 0, 0, 0),
('navigation', 76, 48, 'admin/reports/status/sql', 'admin/reports/status/sql', 'SQL', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 76, 0, 0, 0, 0, 0, 0),
('navigation', 77, 23, 'admin/settings/actions/delete/%', 'admin/settings/actions/delete/%', 'Delete action', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Delete an action.";}}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 77, 0, 0, 0, 0, 0, 0),
('navigation', 78, 0, 'admin/build/menu-customize/%/delete', 'admin/build/menu-customize/%/delete', 'Delete menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 79, 25, 'admin/build/block/list/js', 'admin/build/block/list/js', 'JavaScript List Form', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 79, 0, 0, 0, 0, 0, 0),
('navigation', 80, 39, 'admin/build/modules/list/confirm', 'admin/build/modules/list/confirm', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 39, 80, 0, 0, 0, 0, 0, 0),
('navigation', 81, 0, 'user/reset/%/%/%', 'user/reset/%/%/%', 'Reset password', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 82, 39, 'admin/build/modules/uninstall/confirm', 'admin/build/modules/uninstall/confirm', 'Uninstall', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 39, 82, 0, 0, 0, 0, 0, 0),
('navigation', 83, 0, 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 84, 0, 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 85, 0, 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 86, 38, 'admin/build/menu/item/%/delete', 'admin/build/menu/item/%/delete', 'Delete menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 38, 86, 0, 0, 0, 0, 0, 0),
('navigation', 87, 38, 'admin/build/menu/item/%/edit', 'admin/build/menu/item/%/edit', 'Edit menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 38, 87, 0, 0, 0, 0, 0, 0),
('navigation', 88, 38, 'admin/build/menu/item/%/reset', 'admin/build/menu/item/%/reset', 'Reset menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 38, 88, 0, 0, 0, 0, 0, 0),
('navigation', 89, 38, 'admin/build/menu-customize/navigation', 'admin/build/menu-customize/%', 'Navigation', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 89, 0, 0, 0, 0, 0, 0),
('navigation', 90, 38, 'admin/build/menu-customize/primary-links', 'admin/build/menu-customize/%', 'Primary links', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 90, 0, 0, 0, 0, 0, 0),
('navigation', 91, 38, 'admin/build/menu-customize/secondary-links', 'admin/build/menu-customize/%', 'Secondary links', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 91, 0, 0, 0, 0, 0, 0),
('navigation', 92, 0, 'taxonomy/autocomplete', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 93, 16, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log entries', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View events that have recently been logged.";}}', 'system', 0, 0, 0, 0, -1, 3, 0, 2, 16, 93, 0, 0, 0, 0, 0, 0, 0),
('navigation', 94, 10, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Taxonomy', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:67:"Manage tagging, categorization, and classification of your content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 94, 0, 0, 0, 0, 0, 0, 0),
('navigation', 95, 0, 'taxonomy/term/%', 'taxonomy/term/%', 'Taxonomy term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 96, 16, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:35:"View ''access denied'' errors (403s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 96, 0, 0, 0, 0, 0, 0, 0),
('navigation', 97, 16, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"View ''page not found'' errors (404s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 97, 0, 0, 0, 0, 0, 0, 0),
('navigation', 98, 15, 'admin/help/dblog', 'admin/help/dblog', 'dblog', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 98, 0, 0, 0, 0, 0, 0, 0),
('navigation', 99, 15, 'admin/help/taxonomy', 'admin/help/taxonomy', 'taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 99, 0, 0, 0, 0, 0, 0, 0),
('navigation', 100, 37, 'admin/settings/logging/dblog', 'admin/settings/logging/dblog', 'Database logging', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:169:"Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.";}}', 'system', 0, 0, 0, 0, 0, 4, 0, 2, 18, 37, 100, 0, 0, 0, 0, 0, 0),
('navigation', 101, 16, 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 16, 101, 0, 0, 0, 0, 0, 0, 0),
('navigation', 102, 94, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List terms', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 94, 102, 0, 0, 0, 0, 0, 0),
('navigation', 103, 94, 'admin/content/taxonomy/edit/term', 'admin/content/taxonomy/edit/term', 'Edit term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 94, 103, 0, 0, 0, 0, 0, 0),
('navigation', 104, 94, 'admin/content/taxonomy/edit/vocabulary/%', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 94, 104, 0, 0, 0, 0, 0, 0),
('navigation', 105, 16, 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Get a status report about available updates for your installed modules and themes.";}}', 'system', 0, 0, 0, 0, 10, 3, 0, 2, 16, 105, 0, 0, 0, 0, 0, 0, 0),
('navigation', 106, 11, 'node/add/page', 'node/add/page', 'Page', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";}}', 'system', 0, 0, 0, 0, -50, 2, 1, 11, 106, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 107, 11, 'node/add/story', 'node/add/story', 'Story', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";}}', 'system', 0, 0, 0, 0, -49, 2, 1, 11, 107, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 108, 15, 'admin/help/update', 'admin/help/update', 'update', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 108, 0, 0, 0, 0, 0, 0, 0),
('navigation', 109, 105, 'admin/reports/updates/check', 'admin/reports/updates/check', 'Manual update check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 105, 109, 0, 0, 0, 0, 0, 0),
('navigation', 110, 10, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Page', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 110, 0, 0, 0, 0, 0, 0, 0),
('navigation', 111, 10, 'admin/content/node-type/story', 'admin/content/node-type/story', 'Story', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 111, 0, 0, 0, 0, 0, 0, 0),
('navigation', 112, 0, 'admin/content/node-type/page/delete', 'admin/content/node-type/page/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 113, 0, 'admin/content/node-type/story/delete', 'admin/content/node-type/story/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 113, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 115, 11, 'node/add/webform', 'node/add/webform', 'Webform', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:138:"Create a new form or questionnaire accessible to users. Submission results and statistics are recorded and accessible to privileged users.";}}', 'system', 0, 0, 0, 0, -48, 2, 1, 11, 115, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 120, 10, 'admin/content/node-type/webform', 'admin/content/node-type/webform', 'Webform', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 120, 0, 0, 0, 0, 0, 0, 0),
('navigation', 181, 18, 'admin/settings/search', 'admin/settings/search', 'Search settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:66:"Configure relevance settings for search and other indexing options";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 181, 0, 0, 0, 0, 0, 0, 0),
('navigation', 123, 0, 'admin/content/node-type/webform/delete', 'admin/content/node-type/webform/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 123, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 179, 0, 'search', 'search', 'Search', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 179, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 158, 0, 'node/%/webform/emails/%/delete', 'node/%/webform/emails/%/delete', 'Delete e-mail settings', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 158, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 150, 18, 'admin/settings/webform', 'admin/settings/webform', 'Webform settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:46:"Global configuration of webform functionality.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 150, 0, 0, 0, 0, 0, 0, 0),
('navigation', 151, 10, 'admin/content/webform', 'admin/content/webform', 'Webforms', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:54:"View and edit all the available webforms on your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 151, 0, 0, 0, 0, 0, 0, 0),
('navigation', 152, 15, 'admin/help/webform', 'admin/help/webform', 'webform', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 152, 0, 0, 0, 0, 0, 0, 0),
('navigation', 153, 0, 'webform/ajax/options/%', 'webform/ajax/options/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 153, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 154, 0, 'node/%/submission/%', 'node/%/submission/%', 'Webform submission', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 154, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 155, 0, 'node/%/webform-results/analysis/%', 'node/%/webform-results/analysis/%', 'Analysis', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 155, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 156, 0, 'node/%/webform/emails/%', 'node/%/webform/emails/%', 'Edit e-mail settings', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 156, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 157, 0, 'node/%/submission/%/resend', 'node/%/submission/%/resend', 'Resend e-mails', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 157, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 149, 0, 'node/%/done', 'node/%/done', 'Webform confirmation', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 149, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 147, 0, 'ahah_helper/%', 'ahah_helper/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 147, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 148, 0, 'node/%/submissions', 'node/%/submissions', 'Submissions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 184, 181, 'admin/settings/search/wipe', 'admin/settings/search/wipe', 'Clear index', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 181, 184, 0, 0, 0, 0, 0, 0),
('navigation', 183, 15, 'admin/help/search', 'admin/help/search', 'search', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 183, 0, 0, 0, 0, 0, 0, 0),
('navigation', 182, 16, 'admin/reports/search', 'admin/reports/search', 'Top search phrases', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:33:"View most popular search phrases.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 182, 0, 0, 0, 0, 0, 0, 0),
('navigation', 203, 0, 'crossdomain.xml', 'crossdomain.xml', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 203, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 204, 0, 'services/%', 'services/%', 'Services', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 204, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 205, 17, 'admin/build/services', 'admin/build/services', 'Services', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:56:"Allows external applications to communicate with Drupal.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 205, 0, 0, 0, 0, 0, 0, 0),
('navigation', 206, 15, 'admin/help/services', 'admin/help/services', 'services', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 206, 0, 0, 0, 0, 0, 0, 0),
('navigation', 207, 2, 'admin/services/ahah/security-options', 'admin/services/ahah/security-options', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 2, 207, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 208, 15, 'admin/help/datagroup_services', 'admin/help/datagroup_services', 'datagroup_services', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 208, 0, 0, 0, 0, 0, 0, 0),
('menu-my-account-nav', 254, 0, 'user/account', 'user/account', 'My Data Groups', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, -50, 1, 1, 254, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 232, 0, 'view/attachments/%', 'view/attachments/%', 'Webforms', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:54:"View and edit all the available webforms on your site.";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 232, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 211, 0, 'ahah_helper_demo', 'ahah_helper_demo', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 211, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 212, 0, 'toboggan/denied', 'toboggan/denied', 'Access denied', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 212, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 213, 20, 'admin/user/logintoboggan', 'admin/user/logintoboggan', 'LoginToboggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:102:"Set up custom login options like instant login, login redirects, pre-authorized validation roles, etc.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 213, 0, 0, 0, 0, 0, 0, 0),
('navigation', 214, 0, 'toboggan/revalidate/%', 'toboggan/revalidate/%', 'Re-send validation e-mail', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 214, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 215, 15, 'admin/help/logintoboggan', 'admin/help/logintoboggan', 'logintoboggan', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 215, 0, 0, 0, 0, 0, 0, 0),
('navigation', 216, 0, 'user/validate/%/%/%', 'user/validate/%/%/%', 'Validate e-mail address', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 217, 0, 'profile', 'profile', 'User list', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 217, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 218, 217, 'profile/autocomplete', 'profile/autocomplete', 'Profile autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 217, 218, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 219, 20, 'admin/user/profile', 'admin/user/profile', 'Profiles', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:42:"Create customizable fields for your users.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 219, 0, 0, 0, 0, 0, 0, 0),
('navigation', 220, 15, 'admin/help/profile', 'admin/help/profile', 'profile', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 220, 0, 0, 0, 0, 0, 0, 0),
('navigation', 221, 219, 'admin/user/profile/add', 'admin/user/profile/add', 'Add field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 219, 221, 0, 0, 0, 0, 0, 0),
('navigation', 222, 219, 'admin/user/profile/delete', 'admin/user/profile/delete', 'Delete field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 219, 222, 0, 0, 0, 0, 0, 0),
('navigation', 223, 219, 'admin/user/profile/edit', 'admin/user/profile/edit', 'Edit field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 219, 223, 0, 0, 0, 0, 0, 0),
('navigation', 224, 219, 'admin/user/profile/autocomplete', 'admin/user/profile/autocomplete', 'Profile category autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 219, 224, 0, 0, 0, 0, 0, 0),
('navigation', 225, 0, 'node/%/webform/validation/add/%', 'node/%/webform/validation/add/%', 'Add validation', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 225, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 226, 0, 'node/%/webform/validation/delete/%', 'node/%/webform/validation/delete/%', 'Delete rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 227, 0, 'node/%/webform/validation/edit/%/%', 'node/%/webform/validation/edit/%/%', 'Edit rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 227, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 228, 11, 'node', 'node', 'Add data groups', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, -47, 2, 1, 11, 228, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 230, 0, 'popdata/import/sample_data', 'popdata/import/sample_data', 'Import Sample Data', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:18:"import sample data";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 230, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 233, 15, 'admin/help/custom', 'admin/help/custom', 'custom', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 233, 0, 0, 0, 0, 0, 0, 0),
('navigation', 234, 15, 'admin/help/view_data', 'admin/help/view_data', 'view_data', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 234, 0, 0, 0, 0, 0, 0, 0),
('navigation', 235, 15, 'admin/help/token', 'admin/help/token', 'token', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 235, 0, 0, 0, 0, 0, 0, 0),
('navigation', 236, 0, 'view/data/%/%', 'view/data/%/%', '', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:53:"View the list of submission of repective data groups.";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 236, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 237, 0, 'node/%/data/submission/%/edit/%', 'node/%/data/submission/%/edit/%', 'Edit', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 237, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 238, 17, 'admin/build/path', 'admin/build/path', 'URL aliases', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:46:"Change your site''s URL paths by aliasing them.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 238, 0, 0, 0, 0, 0, 0, 0),
('navigation', 239, 15, 'admin/help/path', 'admin/help/path', 'path', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 239, 0, 0, 0, 0, 0, 0, 0),
('navigation', 240, 15, 'admin/help/pathauto', 'admin/help/pathauto', 'pathauto', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 240, 0, 0, 0, 0, 0, 0, 0),
('navigation', 241, 238, 'admin/build/path/delete', 'admin/build/path/delete', 'Delete alias', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 238, 241, 0, 0, 0, 0, 0, 0),
('navigation', 242, 238, 'admin/build/path/edit', 'admin/build/path/edit', 'Edit alias', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 238, 242, 0, 0, 0, 0, 0, 0),
('primary-links', 243, 0, 'node/15', 'node/%', 'Home', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 0, 0, 0, 0, -50, 1, 1, 243, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 244, 0, 'node/20', 'node/%', 'About Us', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 0, 0, 0, 0, -46, 1, 1, 244, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 245, 0, 'contact/us', 'contact', 'Contact Us', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 0, 0, 0, 0, -43, 1, 1, 245, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 246, 0, 'node/18', 'node/%', 'How It Works', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 0, 0, 0, 0, -49, 1, 1, 246, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('secondary-links', 247, 0, 'user/account', 'user/account', 'My Account', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}s:5:"alter";b:1;}', 'menu', 0, 0, 0, 0, -50, 1, 1, 247, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('secondary-links', 248, 0, 'user/login', 'user/login', 'Login', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}s:5:"query";s:44:"destination=content/welcome-register-my-info";}', 'menu', 0, 0, 0, 0, -47, 1, 1, 248, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('secondary-links', 249, 0, 'user/register', 'user/register', 'Sign Up', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}s:5:"query";s:44:"destination=content/welcome-register-my-info";}', 'menu', 0, 0, 0, 0, -48, 1, 1, 249, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('secondary-links', 250, 0, 'logout', 'logout', 'Log Out', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 0, 0, 0, 0, -49, 1, 1, 250, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 251, 38, 'admin/build/menu-customize/menu-my-account-nav', 'admin/build/menu-customize/%', 'My Account menu', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 251, 0, 0, 0, 0, 0, 0),
('navigation', 252, 0, 'user/account', 'user/account', 'My Account', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:39:"View the list of available data groups.";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 252, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 253, 0, 'node/%/data/submission/%/delete/%', 'node/%/data/submission/%/delete/%', 'Delete', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 253, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-my-account-nav', 255, 0, 'user/contacts', 'user/contacts', 'Contacts', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, -49, 1, 1, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-my-account-nav', 256, 0, '<front>', '', 'Change Password', 'a:2:{s:5:"alter";b:1;s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 1, 0, 0, -48, 1, 1, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 257, 0, 'user/contacts', 'user/contacts', 'My Contacts', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"View Contacts of the User.";}}', 'system', 0, 0, 1, 0, 0, 1, 0, 257, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 258, 257, 'user/contacts/%', 'user/contacts/%', 'My Contacts', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"View shared data groups of the users contact.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 257, 258, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 259, 15, 'admin/help/contacts', 'admin/help/contacts', 'contacts', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 259, 0, 0, 0, 0, 0, 0, 0),
('navigation', 260, 0, 'user/contact/data/%/%', 'user/contact/data/%/%', 'My Contacts', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"View shared data groups of the users contact.";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 260, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 261, 0, 'user/contact/datagroup/detail/%/%/%', 'user/contact/datagroup/detail/%/%/%', 'My datagroup details', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 261, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 262, 0, 'user/contact/subdatagroup/detail/%/%/%', 'user/contact/subdatagroup/detail/%/%/%', 'My subdatagroups details', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 262, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 263, 0, 'webform_addmore/js/remove/subdatagroup', 'webform_addmore/js/remove/subdatagroup', '', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 263, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 264, 0, 'print/data', 'print/data', '', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:46:"Print the submission of repective data groups.";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 264, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 265, 0, 'remove/recommendation/letter', 'remove/recommendation/letter', '', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:32:"Remove Letter of Recommendation.";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 265, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 266, 18, 'admin/settings/jquery_update', 'admin/settings/jquery_update', 'jQuery Update', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:44:"Configure settings for jQuery Update module.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 266, 0, 0, 0, 0, 0, 0, 0),
('navigation', 267, 0, 'colorbox/form', 'colorbox/form', 'Form', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 267, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 268, 18, 'admin/settings/colorbox', 'admin/settings/colorbox', 'Colorbox', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:25:"Adjust Colorbox settings.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 268, 0, 0, 0, 0, 0, 0, 0),
('navigation', 269, 0, 'user/login/colorbox', 'user/login/colorbox', 'Login', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 269, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 270, 18, 'admin/settings/nice_menus', 'admin/settings/nice_menus', 'Nice menus', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Configure Nice menus.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 270, 0, 0, 0, 0, 0, 0, 0),
('navigation', 271, 15, 'admin/help/nice_menus', 'admin/help/nice_menus', 'nice_menus', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 271, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 272, 0, 'node/32', 'node/%', 'Help', 'a:1:{s:10:"attributes";a:1:{s:5:"class";s:10:"menuparent";}}', 'menu', 0, 0, 0, 0, -44, 1, 1, 272, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 273, 246, 'node/25', 'node/%', 'FAQs', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 1, 0, 0, 0, -49, 2, 1, 246, 273, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 280, 0, 'node/27', 'node/%', 'Solutions', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 0, 0, 1, 0, -48, 1, 1, 280, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 274, 0, 'contact', 'contact', 'Contact', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 274, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 275, 17, 'admin/build/contact', 'admin/build/contact', 'Contact form', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:71:"Create a system contact form and set up categories for the form to use.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 275, 0, 0, 0, 0, 0, 0, 0),
('navigation', 276, 15, 'admin/help/contact', 'admin/help/contact', 'contact', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 276, 0, 0, 0, 0, 0, 0, 0),
('navigation', 277, 275, 'admin/build/contact/delete/%', 'admin/build/contact/delete/%', 'Delete contact', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 275, 277, 0, 0, 0, 0, 0, 0),
('navigation', 278, 275, 'admin/build/contact/edit/%', 'admin/build/contact/edit/%', 'Edit contact category', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 275, 278, 0, 0, 0, 0, 0, 0),
('navigation', 279, 18, 'admin/settings/menu_attributes', 'admin/settings/menu_attributes', 'Menu attributes', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"Configure the Menu Attributes module";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 279, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 281, 280, 'node/28', 'node/%', 'Individual RMI Plan', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 0, 0, 0, 0, -50, 2, 1, 280, 281, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 282, 280, 'node/29', 'node/%', 'Family RMI Plan', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 0, 0, 0, 0, -49, 2, 1, 280, 282, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 283, 280, 'node/30', 'node/%', 'Business RMI Plan', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 0, 0, 0, 0, -48, 2, 1, 280, 283, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 284, 0, 'http://#', '', 'Get RMI', 'a:1:{s:10:"attributes";a:1:{s:2:"id";s:10:"empty_link";}}', 'menu', 0, 1, 1, 0, -47, 1, 1, 284, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 285, 284, 'https://itunes.apple.com/us/app/register-my-info/id592362077?mt=8', '', 'iPhone App', 'a:1:{s:10:"attributes";a:1:{s:6:"target";s:6:"_blank";}}', 'menu', 0, 1, 0, 0, -50, 2, 1, 284, 285, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 286, 284, 'https://play.google.com', '', 'Android App', 'a:1:{s:10:"attributes";a:1:{s:6:"target";s:6:"_blank";}}', 'menu', 0, 1, 0, 0, -49, 2, 1, 284, 286, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 287, 0, 'node/31', 'node/%', 'News', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 0, 0, 0, 0, -45, 1, 1, 287, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 288, 18, 'admin/settings/html_title', 'admin/settings/html_title', 'HTML Title settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:40:"Configure HTML tags used in node titles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 288, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_router`
--

CREATE TABLE IF NOT EXISTS `menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '',
  `load_functions` text NOT NULL,
  `to_arg_functions` text NOT NULL,
  `access_callback` varchar(255) NOT NULL DEFAULT '',
  `access_arguments` text,
  `page_callback` varchar(255) NOT NULL DEFAULT '',
  `page_arguments` text,
  `fit` int(11) NOT NULL DEFAULT '0',
  `number_parts` smallint(6) NOT NULL DEFAULT '0',
  `tab_parent` varchar(255) NOT NULL DEFAULT '',
  `tab_root` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_callback` varchar(255) NOT NULL DEFAULT '',
  `title_arguments` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `block_callback` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `position` varchar(255) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `file` mediumtext,
  PRIMARY KEY (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_router`
--

INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES
('node', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_page_default', 'a:0:{}', 1, 1, '', 'node', 'Content', 't', '', 4, '', '', '', 0, ''),
('crossdomain.xml', '', '', 'services_access_menu', 'a:0:{}', 'services_crossdomain_xml', 'a:0:{}', 1, 1, '', 'crossdomain.xml', '', 't', '', 4, '', '', '', 0, ''),
('rss.xml', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_feed', 'a:0:{}', 1, 1, '', 'rss.xml', 'RSS feed', 't', '', 4, '', '', '', 0, ''),
('ahah_helper_demo', '', '', '1', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:21:"ahah_helper_demo_form";}', 1, 1, '', 'ahah_helper_demo', '', 't', '', 4, '', '', '', 0, ''),
('batch', '', '', '1', 'a:0:{}', 'system_batch_page', 'a:0:{}', 1, 1, '', 'batch', '', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 1, 1, '', 'admin', 'Administer', 't', '', 6, '', '', '', 9, 'modules/system/system.admin.inc'),
('contact', '', '', 'user_access', 'a:1:{i:0;s:29:"access site-wide contact form";}', 'contact_site_page', 'a:0:{}', 1, 1, '', 'contact', 'Contact', 't', '', 20, '', '', '', 0, 'modules/contact/contact.pages.inc'),
('logout', '', '', 'user_is_logged_in', 'a:0:{}', 'user_logout', 'a:0:{}', 1, 1, '', 'logout', 'Log out', 't', '', 6, '', '', '', 10, 'modules/user/user.pages.inc'),
('search', '', '', 'user_access', 'a:1:{i:0;s:14:"search content";}', 'search_view', 'a:0:{}', 1, 1, '', 'search', 'Search', 't', '', 20, '', '', '', 0, 'modules/search/search.pages.inc'),
('user', '', '', '1', 'a:0:{}', 'user_page', 'a:0:{}', 1, 1, '', 'user', 'User account', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('profile', '', '', 'user_access', 'a:1:{i:0;s:20:"access user profiles";}', 'profile_browse', 'a:0:{}', 1, 1, '', 'profile', 'User list', 't', '', 20, '', '', '', 0, 'modules/profile/profile.pages.inc'),
('user/login', '', '', 'user_is_anonymous', 'a:0:{}', 'user_page', 'a:0:{}', 3, 2, 'user', 'user', 'Log in', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc'),
('system/files', '', '', '1', 'a:0:{}', 'file_download', 'a:0:{}', 3, 2, '', 'system/files', 'File download', 't', '', 4, '', '', '', 0, ''),
('toboggan/denied', '', '', '1', 'a:0:{}', 'logintoboggan_denied', 'a:0:{}', 3, 2, '', 'toboggan/denied', 'Access denied', 't', '', 4, '', '', '', 0, ''),
('ahah_helper/%', 'a:1:{i:1;s:26:"ahah_helper_form_item_load";}', '', '1', 'a:0:{}', 'ahah_helper_render', 'a:1:{i:0;i:1;}', 2, 2, '', 'ahah_helper/%', '', 't', '', 4, '', '', '', 0, ''),
('taxonomy/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_autocomplete', 'a:0:{}', 3, 2, '', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('admin/by-module', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_by_module', 'a:0:{}', 3, 2, 'admin', 'admin', 'By module', 't', '', 128, '', '', '', 2, 'modules/system/system.admin.inc'),
('admin/by-task', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 3, 2, 'admin', 'admin', 'By task', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/compact', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_compact_page', 'a:0:{}', 3, 2, '', 'admin/compact', 'Compact mode', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('print/data', '', '', 'user_access', 'a:1:{i:0;s:26:"access all webform results";}', 'print_data_submission', 'a:0:{}', 3, 2, '', 'print/data', '', 't', '', 6, '', 'Print the submission of repective data groups.', '', 0, ''),
('filter/tips', '', '', '1', 'a:0:{}', 'filter_tips_long', 'a:0:{}', 3, 2, '', 'filter/tips', 'Compose tips', 't', '', 20, '', '', '', 0, 'modules/filter/filter.pages.inc'),
('node/add', '', '', '_node_add_access', 'a:0:{}', 'node_add_page', 'a:0:{}', 3, 2, '', 'node/add', 'Create content', 't', '', 6, '', '', '', 1, 'modules/node/node.pages.inc'),
('comment/delete', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_delete', 'a:0:{}', 3, 2, '', 'comment/delete', 'Delete comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.admin.inc'),
('comment/edit', '', '', 'user_access', 'a:1:{i:0;s:13:"post comments";}', 'comment_edit', 'a:0:{}', 3, 2, '', 'comment/edit', 'Edit comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.pages.inc'),
('admin/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_main', 'a:0:{}', 3, 2, '', 'admin/help', 'Help', 't', '', 6, '', '', '', 9, 'modules/help/help.admin.inc'),
('user/account', '', '', 'user_access', 'a:1:{i:0;s:26:"access all webform results";}', 'myaccount_page', 'a:0:{}', 3, 2, '', 'user/account', 'My Account', 't', '', 6, '', 'View the list of available data groups.', '', 0, ''),
('user/contacts', '', '', 'user_access', 'a:1:{i:0;s:20:"access user contacts";}', 'contacts_view', 'a:0:{}', 3, 2, '', 'user/contacts', 'My Contacts', 't', '', 6, '', 'View Contacts of the User.', '', 0, ''),
('profile/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:20:"access user profiles";}', 'profile_autocomplete', 'a:0:{}', 3, 2, '', 'profile/autocomplete', 'Profile autocomplete', 't', '', 4, '', '', '', 0, 'modules/profile/profile.pages.inc'),
('services/%', 'a:1:{i:1;N;}', '', 'services_access_menu', 'a:0:{}', 'services_server', 'a:1:{i:0;i:1;}', 2, 2, '', 'services/%', 'Services', 't', '', 4, '', '', '', 0, ''),
('user/register', '', '', 'user_register_access', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:13:"user_register";}', 3, 2, 'user', 'user', 'Create new account', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('user/password', '', '', 'user_is_anonymous', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:9:"user_pass";}', 3, 2, 'user', 'user', 'Request new password', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('user/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:20:"access user profiles";}', 'user_autocomplete', 'a:0:{}', 3, 2, '', 'user/autocomplete', 'User autocomplete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/content', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/content', 'Content management', 't', '', 6, '', 'Manage your site''s content.', 'left', -10, 'modules/system/system.admin.inc'),
('colorbox/form', '', '', '_colorbox_form_page_access', 'a:1:{i:0;i:2;}', 'colorbox_form_page', 'a:1:{i:0;i:2;}', 3, 2, '', 'colorbox/form', 'Form', 't', '', 4, '', '', '', 0, 'sites/all/modules/colorbox/colorbox.pages.inc'),
('admin/reports', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/reports', 'Reports', 't', '', 6, '', 'View reports from system logs and other status information.', 'left', 5, 'modules/system/system.admin.inc'),
('admin/build', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/build', 'Site building', 't', '', 6, '', 'Control how your site looks and feels.', 'right', -10, 'modules/system/system.admin.inc'),
('admin/settings', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_settings_overview', 'a:0:{}', 3, 2, '', 'admin/settings', 'Site configuration', 't', '', 6, '', 'Adjust basic site configuration options.', 'right', -5, 'modules/system/system.admin.inc'),
('node/%', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'node/%', '', 'node_page_title', 'a:1:{i:0;i:1;}', 4, '', '', '', 0, ''),
('admin/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/user', 'User management', 't', '', 6, '', 'Manage your site''s users, groups and access to site features.', 'left', 0, 'modules/system/system.admin.inc'),
('user/%', 'a:1:{i:1;s:22:"user_uid_optional_load";}', 'a:1:{i:1;s:24:"user_uid_optional_to_arg";}', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'user/%', 'My account', 'user_page_title', 'a:1:{i:0;i:1;}', 6, '', '', '', 0, 'modules/user/user.pages.inc'),
('node/%/view', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'View', 't', '', 136, '', '', '', -10, ''),
('user/%/view', 'a:1:{i:1;s:9:"user_load";}', '', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'View', 't', '', 136, '', '', '', -10, 'modules/user/user.pages.inc'),
('admin/settings/actions', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 7, 3, '', 'admin/settings/actions', 'Actions', 't', '', 6, '', 'Manage the actions defined for your site.', '', 0, ''),
('user/login/colorbox', '', '', 'user_is_anonymous', 'a:0:{}', 'colorbox_login', 'a:0:{}', 7, 3, '', 'user/login/colorbox', 'Login', 't', '', 4, '', '', '', 0, 'sites/all/modules/colorbox/colorbox.pages.inc'),
('user/contacts/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:20:"access user contacts";}', 'contacts_view_data_groups', 'a:0:{}', 6, 3, '', 'user/contacts/%', 'My Contacts', 't', '', 6, '', 'View shared data groups of the users contact.', '', 0, ''),
('admin/user/rules', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 7, 3, '', 'admin/user/rules', 'Access rules', 't', '', 6, '', 'List and create rules to disallow usernames, e-mail addresses, and IP addresses.', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/updates', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', 7, 3, '', 'admin/reports/updates', 'Available updates', 't', '', 6, '', 'Get a status report about available updates for your installed modules and themes.', '', 10, 'modules/update/update.report.inc'),
('admin/build/block', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 7, 3, '', 'admin/build/block', 'Blocks', 't', '', 6, '', 'Configure what block content appears in your site''s sidebars and other regions.', '', 0, 'modules/block/block.admin.inc'),
('admin/content/comment', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 7, 3, '', 'admin/content/comment', 'Comments', 't', '', 6, '', 'List and edit site comments and the comment moderation queue.', '', 0, 'modules/comment/comment.admin.inc'),
('admin/build/contact', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'contact_admin_categories', 'a:0:{}', 7, 3, '', 'admin/build/contact', 'Contact form', 't', '', 6, '', 'Create a system contact form and set up categories for the form to use.', '', 0, 'modules/contact/contact.admin.inc'),
('admin/content/types', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'node_overview_types', 'a:0:{}', 7, 3, '', 'admin/content/types', 'Content types', 't', '', 6, '', 'Manage posts by content type, including default status, front page promotion, etc.', '', 0, 'modules/node/content_types.inc'),
('remove/recommendation/letter', '', '', 'user_access', 'a:1:{i:0;s:26:"access all webform results";}', 'drupal_get_form', 'a:1:{i:0;s:33:"remove_recommendation_letter_form";}', 7, 3, '', 'remove/recommendation/letter', '', 't', '', 6, '', 'Remove Letter of Recommendation.', '', 0, ''),
('admin/settings/logging', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_logging_overview', 'a:0:{}', 7, 3, '', 'admin/settings/logging', 'Logging and alerts', 't', '', 6, '', 'Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destination, such as syslog, database, email, ...etc.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/menu_attributes', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_goto', 'a:1:{i:0;s:25:"admin/build/menu/settings";}', 7, 3, '', 'admin/settings/menu_attributes', 'Menu attributes', 't', '', 6, '', 'Configure the Menu Attributes module', '', 0, ''),
('admin/settings/nice_menus', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"nice_menus_admin_settings";}', 7, 3, '', 'admin/settings/nice_menus', 'Nice menus', 't', '', 6, '', 'Configure Nice menus.', '', 0, ''),
('toboggan/revalidate/%', 'a:1:{i:2;s:9:"user_load";}', '', 'logintoboggan_revalidate_access', 'a:1:{i:0;i:2;}', 'logintoboggan_resend_validation', 'a:1:{i:0;i:2;}', 6, 3, '', 'toboggan/revalidate/%', 'Re-send validation e-mail', 't', '', 4, '', '', '', 0, ''),
('admin/reports/dblog', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_overview', 'a:0:{}', 7, 3, '', 'admin/reports/dblog', 'Recent log entries', 't', '', 6, '', 'View events that have recently been logged.', '', -1, 'modules/dblog/dblog.admin.inc'),
('admin/build/services', '', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', 'services_admin_browse_index', 'a:0:{}', 7, 3, '', 'admin/build/services', 'Services', 't', '', 6, '', 'Allows external applications to communicate with Drupal.', '', 0, 'sites/all/modules/services/services_admin_browse.inc'),
('admin/reports/status', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_status', 'a:0:{}', 7, 3, '', 'admin/reports/status', 'Status report', 't', '', 6, '', 'Get a status report about your site''s operation and any detected problems.', '', 10, 'modules/system/system.admin.inc'),
('taxonomy/term/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_term_page', 'a:1:{i:0;i:2;}', 6, 3, '', 'taxonomy/term/%', 'Taxonomy term', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('admin/build/path', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_overview', 'a:0:{}', 7, 3, '', 'admin/build/path', 'URL aliases', 't', '', 6, '', 'Change your site''s URL paths by aliasing them.', '', 0, 'modules/path/path.admin.inc'),
('node/%/done', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', '_webform_confirmation', 'a:1:{i:0;i:1;}', 5, 3, '', 'node/%/done', 'Webform confirmation', 't', '', 4, '', '', '', 0, ''),
('view/attachments/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:31:"access datagroup uploaded files";}', 'custom_view_attachments', 'a:0:{}', 6, 3, '', 'view/attachments/%', 'Webforms', 't', '', 6, '', 'View and edit all the available webforms on your site.', '', 0, ''),
('admin/help/block', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/block', 'block', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/color', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/color', 'color', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/comment', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/comment', 'comment', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/contact', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/contact', 'contact', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/contacts', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/contacts', 'contacts', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/custom', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/custom', 'custom', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/datagroup_services', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/datagroup_services', 'datagroup_services', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/dblog', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/dblog', 'dblog', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/filter', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/filter', 'filter', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/help', 'help', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/settings/jquery_update', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:22:"jquery_update_settings";}', 7, 3, '', 'admin/settings/jquery_update', 'jQuery Update', 't', '', 6, '', 'Configure settings for jQuery Update module.', '', 0, ''),
('admin/help/logintoboggan', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/logintoboggan', 'logintoboggan', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/menu', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/menu', 'menu', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/nice_menus', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/nice_menus', 'nice_menus', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/node', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/node', 'node', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/path', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/path', 'path', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/pathauto', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/pathauto', 'pathauto', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/profile', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/profile', 'profile', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/search', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/search', 'search', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/services', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/services', 'services', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/system', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/system', 'system', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/taxonomy', 'taxonomy', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/token', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/token', 'token', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/update', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/update', 'update', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/user', 'user', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/view_data', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/view_data', 'view_data', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/webform', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/webform', 'webform', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('node/%/access', 'a:1:{i:1;s:9:"node_load";}', '', 'content_access_node_page_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"content_access_page";i:1;i:1;}', 5, 3, 'node/%', 'node/%', 'Access control', 't', '', 128, '', '', '', 3, 'sites/all/modules/content_access/content_access.admin.inc'),
('admin/settings/clean-urls', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_clean_url_settings";}', 7, 3, '', 'admin/settings/clean-urls', 'Clean URLs', 't', '', 6, '', 'Enable or disable clean URLs for your site.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/colorbox', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:23:"colorbox_admin_settings";}', 7, 3, '', 'admin/settings/colorbox', 'Colorbox', 't', '', 6, '', 'Adjust Colorbox settings.', '', 0, 'sites/all/modules/colorbox/colorbox.admin.inc'),
('user/%/contact', 'a:1:{i:1;s:9:"user_load";}', '', '_contact_user_tab_access', 'a:1:{i:0;i:1;}', 'contact_user_page', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'Contact', 't', '', 128, '', '', '', 2, 'modules/contact/contact.pages.inc'),
('admin/content/node', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 7, 3, '', 'admin/content/node', 'Content', 't', '', 6, '', 'View, edit, and delete your site''s content.', '', 0, 'modules/node/node.admin.inc'),
('admin/settings/date-time', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_date_time_settings";}', 7, 3, '', 'admin/settings/date-time', 'Date and time', 't', '', 6, '', 'Settings for how Drupal displays date and time, as well as the system''s default timezone.', '', 0, 'modules/system/system.admin.inc'),
('node/%/delete', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"delete";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"node_delete_confirm";i:1;i:1;}', 5, 3, '', 'node/%/delete', 'Delete', 't', '', 4, '', '', '', 1, 'modules/node/node.pages.inc'),
('user/%/delete', 'a:1:{i:1;s:9:"user_load";}', '', 'user_delete_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"user_confirm_delete";i:1;i:1;}', 5, 3, '', 'user/%/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('node/%/edit', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'node_page_edit', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Edit', 't', '', 128, '', '', '', 1, 'modules/node/node.pages.inc'),
('admin/settings/error-reporting', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:31:"system_error_reporting_settings";}', 7, 3, '', 'admin/settings/error-reporting', 'Error reporting', 't', '', 6, '', 'Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/file-system', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_file_system_settings";}', 7, 3, '', 'admin/settings/file-system', 'File system', 't', '', 6, '', 'Tell Drupal where to store uploaded files and how they are accessed.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/html_title', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"html_title_admin_settings";}', 7, 3, '', 'admin/settings/html_title', 'HTML Title settings', 't', '', 6, '', 'Configure HTML tags used in node titles.', '', 0, 'sites/all/modules/html_title/html_title.admin.inc'),
('admin/settings/image-toolkit', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:29:"system_image_toolkit_settings";}', 7, 3, '', 'admin/settings/image-toolkit', 'Image toolkit', 't', '', 6, '', 'Choose which image toolkit to use if you have installed optional toolkits.', '', 0, 'modules/system/system.admin.inc'),
('popdata/import/sample_data', '', '', 'user_access', 'a:1:{i:0;s:31:"import datagroup uploaded files";}', 'drupal_get_form', 'a:1:{i:0;s:31:"popdata_import_sample_data_form";}', 7, 3, '', 'popdata/import/sample_data', 'Import Sample Data', 't', '', 6, '', 'import sample data', '', 0, ''),
('admin/settings/filters', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 7, 3, '', 'admin/settings/filters', 'Input formats', 't', '', 6, '', 'Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.', '', 0, 'modules/filter/filter.admin.inc'),
('admin/user/logintoboggan', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"logintoboggan_main_settings";}', 7, 3, '', 'admin/user/logintoboggan', 'LoginToboggan', 't', '', 6, '', 'Set up custom login options like instant login, login redirects, pre-authorized validation roles, etc.', '', 0, ''),
('admin/build/menu', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 7, 3, '', 'admin/build/menu', 'Menus', 't', '', 6, '', 'Control your site''s navigation menu, primary links and secondary links, as well as rename and reorganize menu items.', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/modules', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 7, 3, '', 'admin/build/modules', 'Modules', 't', '', 6, '', 'Enable or disable add-on modules for your site.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/performance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_performance_settings";}', 7, 3, '', 'admin/settings/performance', 'Performance', 't', '', 6, '', 'Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.', '', 0, 'modules/system/system.admin.inc'),
('admin/user/permissions', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_perm";}', 7, 3, '', 'admin/user/permissions', 'Permissions', 't', '', 6, '', 'Determine access to features by selecting permissions for roles.', '', 0, 'modules/user/user.admin.inc'),
('admin/content/node-settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_configure";}', 7, 3, '', 'admin/content/node-settings', 'Post settings', 't', '', 6, '', 'Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.', '', 0, 'modules/node/node.admin.inc'),
('admin/user/profile', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:22:"profile_admin_overview";}', 7, 3, '', 'admin/user/profile', 'Profiles', 't', '', 6, '', 'Create customizable fields for your users.', '', 0, 'modules/profile/profile.admin.inc'),
('admin/content/rss-publishing', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_rss_feeds_settings";}', 7, 3, '', 'admin/content/rss-publishing', 'RSS publishing', 't', '', 6, '', 'Configure the number of items per feed and whether feeds should be titles/teasers/full-text.', '', 0, 'modules/system/system.admin.inc'),
('comment/reply/%', 'a:1:{i:2;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:2;}', 'comment_reply', 'a:1:{i:0;i:2;}', 6, 3, '', 'comment/reply/%', 'Reply to comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.pages.inc'),
('node/%/webform-results', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'webform_results_submissions', 'a:3:{i:0;i:1;i:1;b:0;i:2;s:2:"50";}', 5, 3, 'node/%', 'node/%', 'Results', 't', '', 128, '', '', '', 2, 'sites/all/modules/webform/includes/webform.report.inc'),
('node/%/revisions', 'a:1:{i:1;s:9:"node_load";}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_revision_overview', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Revisions', 't', '', 128, '', '', '', 2, 'modules/node/node.pages.inc'),
('admin/user/roles', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_new_role";}', 7, 3, '', 'admin/user/roles', 'Roles', 't', '', 6, '', 'List, edit, or add user roles.', '', 0, 'modules/user/user.admin.inc'),
('admin/settings/search', '', '', 'user_access', 'a:1:{i:0;s:17:"administer search";}', 'drupal_get_form', 'a:1:{i:0;s:21:"search_admin_settings";}', 7, 3, '', 'admin/settings/search', 'Search settings', 't', '', 6, '', 'Configure relevance settings for search and other indexing options', '', 0, 'modules/search/search.admin.inc'),
('admin/settings/site-information', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_information_settings";}', 7, 3, '', 'admin/settings/site-information', 'Site information', 't', '', 6, '', 'Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/site-maintenance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_maintenance_settings";}', 7, 3, '', 'admin/settings/site-maintenance', 'Site maintenance', 't', '', 6, '', 'Take the site off-line for maintenance or bring it back online.', '', 0, 'modules/system/system.admin.inc'),
('node/%/submissions', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'webform_submission_access', 'a:3:{i:0;i:1;i:1;N;i:2;s:4:"list";}', 'webform_results_submissions', 'a:3:{i:0;i:1;i:1;b:1;i:2;s:2:"50";}', 5, 3, '', 'node/%/submissions', 'Submissions', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform/includes/webform.report.inc'),
('admin/content/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 7, 3, '', 'admin/content/taxonomy', 'Taxonomy', 't', '', 6, '', 'Manage tagging, categorization, and classification of your content.', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/themes', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 7, 3, '', 'admin/build/themes', 'Themes', 't', '', 6, '', 'Change which theme your site uses or allows users to set.', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/access-denied', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:13:"access denied";}', 7, 3, '', 'admin/reports/access-denied', 'Top ''access denied'' errors', 't', '', 6, '', 'View ''access denied'' errors (403s).', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/reports/page-not-found', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:14:"page not found";}', 7, 3, '', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 't', '', 6, '', 'View ''page not found'' errors (404s).', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/user/settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_settings";}', 7, 3, '', 'admin/user/settings', 'User settings', 't', '', 6, '', 'Configure default behavior of users, including registration requirements, e-mails, and user pictures.', '', 0, 'modules/user/user.admin.inc'),
('admin/user/user', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 7, 3, '', 'admin/user/user', 'Users', 't', '', 6, '', 'List, add, and edit users.', '', 0, 'modules/user/user.admin.inc'),
('node/%/webform', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'webform_components_page', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Webform', 't', '', 128, '', '', '', 1, 'sites/all/modules/webform/includes/webform.components.inc'),
('admin/content/webform', '', '', 'user_access', 'a:1:{i:0;s:26:"access all webform results";}', 'webform_admin_content', 'a:0:{}', 7, 3, '', 'admin/content/webform', 'Webforms', 't', '', 6, '', 'View and edit all the available webforms on your site.', '', 0, 'sites/all/modules/webform/includes/webform.admin.inc'),
('user/%/edit', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'Edit', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/reports/search', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:6:"search";}', 7, 3, '', 'admin/reports/search', 'Top search phrases', 't', '', 6, '', 'View most popular search phrases.', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/settings/webform', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:22:"webform_admin_settings";}', 7, 3, '', 'admin/settings/webform', 'Webform settings', 't', '', 6, '', 'Global configuration of webform functionality.', '', 0, 'sites/all/modules/webform/includes/webform.admin.inc'),
('admin/settings/admin', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_admin_theme_settings";}', 7, 3, '', 'admin/settings/admin', 'Administration theme', 't', '', 6, 'system_admin_theme_settings', 'Settings for how your administrative pages should look.', 'left', 0, 'modules/system/system.admin.inc'),
('node/add/page', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:4:"page";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/page', 'Page', 'check_plain', '', 6, '', 'A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.', '', 0, 'modules/node/node.pages.inc'),
('node/add/story', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:5:"story";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/story', 'Story', 'check_plain', '', 6, '', 'A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.', '', 0, 'modules/node/node.pages.inc'),
('node/add/webform', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:7:"webform";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/webform', 'Webform', 'check_plain', '', 6, '', 'Create a new form or questionnaire accessible to users. Submission results and statistics are recorded and accessible to privileged users.', '', 0, 'modules/node/node.pages.inc'),
('search/node/%', 'a:1:{i:2;N;}', 'a:1:{i:2;s:16:"menu_tail_to_arg";}', '_search_menu', 'a:1:{i:0;s:4:"node";}', 'search_view', 'a:1:{i:0;s:4:"node";}', 6, 3, 'search', 'search', '', 'module_invoke', 'a:4:{i:0;s:4:"node";i:1;s:6:"search";i:2;s:4:"name";i:3;b:1;}', 128, '', '', '', 0, 'modules/search/search.pages.inc'),
('search/user/%', 'a:1:{i:2;N;}', 'a:1:{i:2;s:16:"menu_tail_to_arg";}', '_search_menu', 'a:1:{i:0;s:4:"user";}', 'search_view', 'a:1:{i:0;s:4:"user";}', 6, 3, 'search', 'search', '', 'module_invoke', 'a:4:{i:0;s:4:"user";i:1;s:6:"search";i:2;s:4:"name";i:3;b:1;}', 128, '', '', '', 0, 'modules/search/search.pages.inc'),
('admin/build/block/list', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 15, 4, 'admin/build/block', 'admin/build/block', 'List', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc'),
('admin/content/node/overview', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 15, 4, 'admin/content/node', 'admin/content/node', 'List', 't', '', 136, '', '', '', -10, 'modules/node/node.admin.inc'),
('admin/content/types/list', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'node_overview_types', 'a:0:{}', 15, 4, 'admin/content/types', 'admin/content/types', 'List', 't', '', 136, '', '', '', -10, 'modules/node/content_types.inc'),
('admin/build/path/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_overview', 'a:0:{}', 15, 4, 'admin/build/path', 'admin/build/path', 'List', 't', '', 136, '', '', '', -10, 'modules/path/path.admin.inc'),
('admin/user/user/list', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 15, 4, 'admin/user/user', 'admin/user/user', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc'),
('admin/settings/filters/list', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'List', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/build/modules/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'List', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/taxonomy/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 15, 4, 'admin/content/taxonomy', 'admin/content/taxonomy', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/user/rules/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc'),
('admin/content/comment/new', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Published comments', 't', '', 136, '', '', '', -10, 'modules/comment/comment.admin.inc'),
('user/%/edit/account', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 11, 4, 'user/%/edit', 'user/%', 'Account', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/build/services/browse', '', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', 'services_admin_browse_index', 'a:0:{}', 15, 4, 'admin/build/services', 'admin/build/services', 'Browse', 't', '', 136, '', 'Browse and test available remote services.', '', -10, 'sites/all/modules/services/services_admin_browse.inc'),
('admin/build/themes/select', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'List', 't', '', 136, '', 'Select the default theme.', '', -1, 'modules/system/system.admin.inc'),
('admin/build/menu/list', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'List menus', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc'),
('admin/build/themes/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'Configure', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/contact/list', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'contact_admin_categories', 'a:0:{}', 15, 4, 'admin/build/contact', 'admin/build/contact', 'List', 't', '', 136, '', '', '', 0, 'modules/contact/contact.admin.inc'),
('admin/settings/actions/manage', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 15, 4, 'admin/settings/actions', 'admin/settings/actions', 'Manage actions', 't', '', 136, '', 'Manage the actions defined for your site.', '', -2, ''),
('admin/settings/actions/orphan', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_remove_orphans', 'a:0:{}', 15, 4, '', 'admin/settings/actions/orphan', 'Remove orphans', 't', '', 4, '', '', '', 0, ''),
('admin/build/modules/uninstall', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'Uninstall', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('webform_addmore/js/remove/subdatagroup', '', '', '1', 'a:0:{}', 'webform_addmore_js_remove_subdatagroup', 'a:0:{}', 15, 4, '', 'webform_addmore/js/remove/subdatagroup', '', 't', '', 6, '', '', '', 0, ''),
('admin/build/path/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_edit', 'a:0:{}', 15, 4, 'admin/build/path', 'admin/build/path', 'Add alias', 't', '', 128, '', '', '', 0, 'modules/path/path.admin.inc'),
('admin/settings/filters/add', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:0:{}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'Add input format', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc'),
('admin/user/rules/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_add', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Add rule', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/user/create', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:6:"create";}', 15, 4, 'admin/user/user', 'admin/user/user', 'Add user', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/content/comment/approval', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:1:{i:0;s:8:"approval";}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Approval queue', 't', '', 128, '', '', '', 0, 'modules/comment/comment.admin.inc'),
('admin/user/rules/check', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_check', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Check rules', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/settings/clean-urls/check', '', '', '1', 'a:0:{}', 'drupal_json', 'a:1:{i:0;a:1:{s:6:"status";b:1;}}', 15, 4, '', 'admin/settings/clean-urls/check', 'Clean URL check', 't', '', 4, '', '', '', 0, ''),
('admin/settings/actions/configure', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_actions_configure";}', 15, 4, '', 'admin/settings/actions/configure', 'Configure an advanced action', 't', '', 4, '', '', '', 0, ''),
('admin/settings/date-time/lookup', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_date_time_lookup', 'a:0:{}', 15, 4, '', 'admin/settings/date-time/lookup', 'Date and time lookup', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/path/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_edit', 'a:0:{}', 15, 4, '', 'admin/build/path/edit', 'Edit alias', 't', '', 4, '', '', '', 0, 'modules/path/path.admin.inc'),
('admin/user/roles/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_role";}', 15, 4, '', 'admin/user/roles/edit', 'Edit role', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/rules/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_edit', 'a:0:{}', 15, 4, '', 'admin/user/rules/edit', 'Edit rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/updates/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'List', 't', '', 136, '', '', '', 0, 'modules/update/update.report.inc'),
('admin/reports/updates/check', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_manual_status', 'a:0:{}', 15, 4, '', 'admin/reports/updates/check', 'Manual update check', 't', '', 4, '', '', '', 0, 'modules/update/update.fetch.inc'),
('admin/reports/status/php', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_php', 'a:0:{}', 15, 4, '', 'admin/reports/status/php', 'PHP', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/user/profile/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'profile_admin_settings_autocomplete', 'a:0:{}', 15, 4, '', 'admin/user/profile/autocomplete', 'Profile category autocomplete', 't', '', 4, '', '', '', 0, 'modules/profile/profile.admin.inc'),
('admin/services/ahah/security-options', '', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', '_services_ahah_security_options', 'a:0:{}', 15, 4, '', 'admin/services/ahah/security-options', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/services/services_admin_browse.inc'),
('admin/content/node-settings/rebuild', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'drupal_get_form', 'a:1:{i:0;s:30:"node_configure_rebuild_confirm";}', 15, 4, '', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 't', '', 4, '', '', '', 0, 'modules/node/node.admin.inc'),
('admin/reports/status/run-cron', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_run_cron', 'a:0:{}', 15, 4, '', 'admin/reports/status/run-cron', 'Run cron', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/status/sql', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_sql', 'a:0:{}', 15, 4, '', 'admin/reports/status/sql', 'SQL', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('view/data/%/%', 'a:2:{i:2;s:9:"node_load";i:3;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:26:"access all webform results";}', 'view_data_submission', 'a:0:{}', 12, 4, '', 'view/data/%/%', '', 't', '', 6, '', 'View the list of submission of repective data groups.', '', 0, ''),
('admin/build/block/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', 15, 4, 'admin/build/block', 'admin/build/block', 'Add block', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/contact/add', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:2:{i:0;s:18:"contact_admin_edit";i:1;i:3;}', 15, 4, 'admin/build/contact', 'admin/build/contact', 'Add category', 't', '', 128, '', '', '', 1, 'modules/contact/contact.admin.inc'),
('admin/content/types/add', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_type_form";}', 15, 4, 'admin/content/types', 'admin/content/types', 'Add content type', 't', '', 128, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/user/profile/add', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:18:"profile_field_form";}', 15, 4, '', 'admin/user/profile/add', 'Add field', 't', '', 4, '', '', '', 0, 'modules/profile/profile.admin.inc'),
('admin/build/menu/add', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:14:"menu_edit_menu";i:1;s:3:"add";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Add menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/path/pathauto', '', '', 'user_access', 'a:1:{i:0;s:19:"administer pathauto";}', 'drupal_get_form', 'a:1:{i:0;s:23:"pathauto_admin_settings";}', 15, 4, 'admin/build/path', 'admin/build/path', 'Automated alias settings', 't', '', 128, '', '', '', 10, 'sites/all/modules/pathauto/pathauto.admin.inc'),
('admin/settings/search/wipe', '', '', 'user_access', 'a:1:{i:0;s:17:"administer search";}', 'drupal_get_form', 'a:1:{i:0;s:19:"search_wipe_confirm";}', 15, 4, '', 'admin/settings/search/wipe', 'Clear index', 't', '', 4, '', '', '', 0, 'modules/search/search.admin.inc');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES
('admin/build/block/configure', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:21:"block_admin_configure";}', 15, 4, '', 'admin/build/block/configure', 'Configure block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/path/delete', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'drupal_get_form', 'a:1:{i:0;s:25:"path_admin_delete_confirm";}', 15, 4, '', 'admin/build/path/delete', 'Delete alias', 't', '', 4, '', '', '', 0, 'modules/path/path.admin.inc'),
('admin/build/path/delete_bulk', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'drupal_get_form', 'a:1:{i:0;s:21:"pathauto_admin_delete";}', 15, 4, 'admin/build/path', 'admin/build/path', 'Delete aliases', 't', '', 128, '', '', '', 30, 'sites/all/modules/pathauto/pathauto.admin.inc'),
('admin/build/block/delete', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:16:"block_box_delete";}', 15, 4, '', 'admin/build/block/delete', 'Delete block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/user/profile/delete', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:20:"profile_field_delete";}', 15, 4, '', 'admin/user/profile/delete', 'Delete field', 't', '', 4, '', '', '', 0, 'modules/profile/profile.admin.inc'),
('admin/settings/filters/delete', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:19:"filter_admin_delete";}', 15, 4, '', 'admin/settings/filters/delete', 'Delete input format', 't', '', 4, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/user/rules/delete', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:32:"user_admin_access_delete_confirm";}', 15, 4, '', 'admin/user/rules/delete', 'Delete rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/event/%', 'a:1:{i:3;N;}', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_event', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/reports/event/%', 'Details', 't', '', 4, '', '', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/user/profile/edit', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:18:"profile_field_form";}', 15, 4, '', 'admin/user/profile/edit', 'Edit field', 't', '', 4, '', '', '', 0, 'modules/profile/profile.admin.inc'),
('admin/content/taxonomy/%', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 14, 4, '', 'admin/content/taxonomy/%', 'List terms', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/content/node-type/page', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 15, 4, '', 'admin/content/node-type/page', 'Page', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/contact/settings', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:1:{i:0;s:22:"contact_admin_settings";}', 15, 4, 'admin/build/contact', 'admin/build/contact', 'Settings', 't', '', 128, '', '', '', 2, 'modules/contact/contact.admin.inc'),
('admin/build/menu/settings', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:1:{i:0;s:14:"menu_configure";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Settings', 't', '', 128, '', '', '', 5, 'modules/menu/menu.admin.inc'),
('admin/reports/updates/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:15:"update_settings";}', 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'Settings', 't', '', 128, '', '', '', 0, 'modules/update/update.settings.inc'),
('admin/content/node-type/story', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:5:"Story";s:6:"module";s:4:"node";s:11:"description";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}', 15, 4, '', 'admin/content/node-type/story', 'Story', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/webform', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:7:"webform";s:4:"name";s:7:"Webform";s:6:"module";s:4:"node";s:11:"description";s:138:"Create a new form or questionnaire accessible to users. Submission results and statistics are recorded and accessible to privileged users.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:7:"webform";}}', 15, 4, '', 'admin/content/node-type/webform', 'Webform', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('node/%/webform-results/analysis', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'webform_results_analysis', 'a:1:{i:0;i:1;}', 11, 4, 'node/%/webform-results', 'node/%', 'Analysis', 't', '', 128, '', '', '', 5, 'sites/all/modules/webform/includes/webform.report.inc'),
('node/%/webform-results/clear', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'webform_results_clear_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:26:"webform_results_clear_form";i:1;i:1;}', 11, 4, 'node/%/webform-results', 'node/%', 'Clear', 't', '', 128, '', '', '', 8, 'sites/all/modules/webform/includes/webform.report.inc'),
('admin/settings/logging/dblog', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"dblog_admin_settings";}', 15, 4, '', 'admin/settings/logging/dblog', 'Database logging', 't', '', 6, '', 'Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.', '', 0, 'modules/dblog/dblog.admin.inc'),
('node/%/webform-results/download', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:29:"webform_results_download_form";i:1;i:1;}', 11, 4, 'node/%/webform-results', 'node/%', 'Download', 't', '', 128, '', '', '', 7, 'sites/all/modules/webform/includes/webform.report.inc'),
('webform/ajax/options/%', 'a:1:{i:3;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:3;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:3;}', 'webform_select_options_ajax', 'a:0:{}', 14, 4, '', 'webform/ajax/options/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform/components/select.inc'),
('node/%/webform/emails', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"webform_emails_form";i:1;i:1;}', 11, 4, 'node/%/webform', 'node/%', 'E-mails', 't', '', 128, '', '', '', 1, 'sites/all/modules/webform/includes/webform.emails.inc'),
('node/%/webform/components', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'webform_components_page', 'a:1:{i:0;i:1;}', 11, 4, 'node/%/webform', 'node/%', 'Form components', 't', '', 136, '', '', '', 0, 'sites/all/modules/webform/includes/webform.components.inc'),
('node/%/webform/configure', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:22:"webform_configure_form";i:1;i:1;}', 11, 4, 'node/%/webform', 'node/%', 'Form settings', 't', '', 128, '', '', '', 2, 'sites/all/modules/webform/includes/webform.pages.inc'),
('node/%/webform/validation', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'webform_validation_manage', 'a:1:{i:0;i:1;}', 11, 4, 'node/%/webform', 'node/%', 'Form validation', 't', '', 128, '', '', '', 3, 'sites/all/modules/webform_validation/webform_validation.admin.inc'),
('admin/build/services/settings', '', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', 'drupal_get_form', 'a:1:{i:0;s:23:"services_admin_settings";}', 15, 4, 'admin/build/services', 'admin/build/services', 'Settings', 't', '', 128, '', 'Configure service settings.', '', 0, 'sites/all/modules/services/services_admin_browse.inc'),
('node/%/webform-results/submissions', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'webform_results_submissions', 'a:3:{i:0;i:1;i:1;b:0;i:2;s:2:"50";}', 11, 4, 'node/%/webform-results', 'node/%', 'Submissions', 't', '', 136, '', '', '', 4, 'sites/all/modules/webform/includes/webform.report.inc'),
('node/%/webform-results/table', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'webform_results_table', 'a:2:{i:0;i:1;i:1;s:2:"50";}', 11, 4, 'node/%/webform-results', 'node/%', 'Table', 't', '', 128, '', '', '', 6, 'sites/all/modules/webform/includes/webform.report.inc'),
('admin/settings/filters/%', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/settings/filters/%', '', 'filter_admin_format_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/build/menu-customize/%', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 14, 4, '', 'admin/build/menu-customize/%', 'Customize menu', 'menu_overview_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('user/%/edit/chgpwd', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'chgpwd_chgpwd_page', 'a:1:{i:0;i:1;}', 11, 4, 'user/%/edit', 'user/%', 'Change password', 't', '', 128, '', '', '', 0, 'modules/user//user.pages.inc'),
('node/%/submission/%', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:3;a:1:{s:28:"webform_menu_submission_load";a:1:{i:0;i:1;}}}', '', 'webform_submission_access', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:4:"view";}', 'webform_submission_page', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:4:"html";}', 10, 4, '', 'node/%/submission/%', 'Webform submission', 'webform_submission_title', 'a:2:{i:0;i:1;i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/webform/includes/webform.submissions.inc'),
('user/%/edit/Personal information', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'profile_category_access', 'a:2:{i:0;i:1;i:1;s:20:"Personal information";}', 'user_edit', 'a:2:{i:0;i:1;i:1;i:3;}', 11, 4, 'user/%/edit', 'user/%', '', 'check_plain', 'a:1:{i:0;s:20:"Personal information";}', 128, '', '', '', 3, 'modules/user/user.pages.inc'),
('admin/content/node-type/page/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 31, 5, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/story/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:5:"Story";s:6:"module";s:4:"node";s:11:"description";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}', 31, 5, 'admin/content/node-type/story', 'admin/content/node-type/story', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/webform/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:7:"webform";s:4:"name";s:7:"Webform";s:6:"module";s:4:"node";s:11:"description";s:138:"Create a new form or questionnaire accessible to users. Submission results and statistics are recorded and accessible to privileged users.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:7:"webform";}}', 31, 5, 'admin/content/node-type/webform', 'admin/content/node-type/webform', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/themes/settings/global', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Global settings', 't', '', 136, '', '', '', -1, 'modules/system/system.admin.inc'),
('admin/content/taxonomy/%/list', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 29, 5, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/settings/filters/%/edit', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Edit', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/build/modules/list/confirm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 31, 5, '', 'admin/build/modules/list/confirm', 'List', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/menu-customize/%/list', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'List items', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc'),
('admin/build/modules/uninstall/confirm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 31, 5, '', 'admin/build/modules/uninstall/confirm', 'Uninstall', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/bluemarine', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"bluemarine";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Bluemarine', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/chameleon', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:4:"name";s:9:"chameleon";s:4:"type";s:5:"theme";s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:9:"chameleon";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Chameleon', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/node-type/page/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 31, 5, '', 'admin/content/node-type/page/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/story/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:5:"Story";s:6:"module";s:4:"node";s:11:"description";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}', 31, 5, '', 'admin/content/node-type/story/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/webform/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:7:"webform";s:4:"name";s:7:"Webform";s:6:"module";s:4:"node";s:11:"description";s:138:"Create a new form or questionnaire accessible to users. Submission results and statistics are recorded and accessible to privileged users.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:7:"webform";}}', 31, 5, '', 'admin/content/node-type/webform/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/taxonomy/edit/term', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_term_edit', 'a:0:{}', 31, 5, '', 'admin/content/taxonomy/edit/term', 'Edit term', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/themes/settings/garland', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:7:"garland";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Garland', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/block/list/js', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display_js', 'a:0:{}', 31, 5, '', 'admin/build/block/list/js', 'JavaScript List Form', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/themes/settings/marvin', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:4:"name";s:6:"marvin";s:4:"type";s:5:"theme";s:5:"owner";s:0:"";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:6:"marvin";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Marvin', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/minnelli', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:4:"name";s:8:"minnelli";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:8:"minnelli";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Minnelli', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('user/contact/data/%/%', 'a:2:{i:3;N;i:4;N;}', '', 'user_access', 'a:1:{i:0;s:20:"access user contacts";}', 'contacts_view_data_group_listing', 'a:0:{}', 28, 5, '', 'user/contact/data/%/%', 'My Contacts', 't', '', 6, '', 'View shared data groups of the users contact.', '', 0, ''),
('admin/build/themes/settings/pushbutton', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"pushbutton";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Pushbutton', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/rmi', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:29:"sites/all/themes/rmi/rmi.info";s:4:"name";s:3:"rmi";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:16:"Register My Info";s:11:"description";s:69:"Tableless, recolorable, multi-column, fluid width theme for RMI site.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:7:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:8:"dropmenu";s:14:"Drop Down Menu";s:10:"accountnav";s:15:"My account menu";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:30:"sites/all/themes/rmi/style.css";}}s:7:"scripts";a:1:{s:10:"sign-up.js";s:31:"sites/all/themes/rmi/sign-up.js";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1341320410";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:35:"sites/all/themes/rmi/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:30:"sites/all/themes/rmi/style.css";}}s:7:"scripts";a:1:{s:10:"sign-up.js";s:31:"sites/all/themes/rmi/sign-up.js";}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:3:"rmi";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Register My Info', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/menu-customize/%/add', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:3:"add";i:2;N;i:3;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Add item', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/block/list/bluemarine', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"bluemarine";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Bluemarine', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/chameleon', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:4:"name";s:9:"chameleon";s:4:"type";s:5:"theme";s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}}}', 'block_admin_display', 'a:1:{i:0;s:9:"chameleon";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Chameleon', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/%/configure', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_configure_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Configure', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc'),
('admin/settings/actions/delete/%', 'a:1:{i:4;s:12:"actions_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:2:{i:0;s:26:"system_actions_delete_form";i:1;i:4;}', 30, 5, '', 'admin/settings/actions/delete/%', 'Delete action', 't', '', 4, '', 'Delete an action.', '', 0, ''),
('admin/build/contact/delete/%', 'a:1:{i:4;s:12:"contact_load";}', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:2:{i:0;s:20:"contact_admin_delete";i:1;i:4;}', 30, 5, '', 'admin/build/contact/delete/%', 'Delete contact', 't', '', 4, '', '', '', 0, 'modules/contact/contact.admin.inc'),
('admin/build/menu-customize/%/delete', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_delete_menu_page', 'a:1:{i:0;i:3;}', 29, 5, '', 'admin/build/menu-customize/%/delete', 'Delete menu', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/contact/edit/%', 'a:1:{i:4;s:12:"contact_load";}', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:3:{i:0;s:18:"contact_admin_edit";i:1;i:3;i:2;i:4;}', 30, 5, '', 'admin/build/contact/edit/%', 'Edit contact category', 't', '', 4, '', '', '', 0, 'modules/contact/contact.admin.inc'),
('admin/build/menu-customize/%/edit', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:3:{i:0;s:14:"menu_edit_menu";i:1;s:4:"edit";i:2;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Edit menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/block/list/garland', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:7:"garland";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Garland', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/marvin', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:4:"name";s:6:"marvin";s:4:"type";s:5:"theme";s:5:"owner";s:0:"";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";}}', 'block_admin_display', 'a:1:{i:0;s:6:"marvin";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Marvin', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/minnelli', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:4:"name";s:8:"minnelli";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'block_admin_display', 'a:1:{i:0;s:8:"minnelli";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Minnelli', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/pushbutton', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"pushbutton";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Pushbutton', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/%/order', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_order_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Rearrange', 't', '', 128, '', '', '', 2, 'modules/filter/filter.admin.inc'),
('admin/build/block/list/rmi', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:29:"sites/all/themes/rmi/rmi.info";s:4:"name";s:3:"rmi";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:16:"Register My Info";s:11:"description";s:69:"Tableless, recolorable, multi-column, fluid width theme for RMI site.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:7:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:8:"dropmenu";s:14:"Drop Down Menu";s:10:"accountnav";s:15:"My account menu";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:30:"sites/all/themes/rmi/style.css";}}s:7:"scripts";a:1:{s:10:"sign-up.js";s:31:"sites/all/themes/rmi/sign-up.js";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1341320410";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:35:"sites/all/themes/rmi/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:30:"sites/all/themes/rmi/style.css";}}s:7:"scripts";a:1:{s:10:"sign-up.js";s:31:"sites/all/themes/rmi/sign-up.js";}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:3:"rmi";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Register My Info', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc'),
('user/reset/%/%/%', 'a:3:{i:2;N;i:3;N;i:4;N;}', '', '1', 'a:0:{}', 'drupal_get_form', 'a:4:{i:0;s:15:"user_pass_reset";i:1;i:2;i:2;i:3;i:3;i:4;}', 24, 5, '', 'user/reset/%/%/%', 'Reset password', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('user/validate/%/%/%', 'a:3:{i:2;s:9:"user_load";i:3;N;i:4;N;}', '', 'logintoboggan_validate_email_access', 'a:2:{i:0;i:2;i:1;i:3;}', 'logintoboggan_validate_email', 'a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}', 24, 5, '', 'user/validate/%/%/%', 'Validate e-mail address', 't', '', 4, '', '', '', 0, ''),
('admin/content/taxonomy/add/vocabulary', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:24:"taxonomy_form_vocabulary";}', 31, 5, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Add vocabulary', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('node/%/webform/emails/%', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:4;a:1:{s:23:"webform_menu_email_load";a:1:{i:0;i:1;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:3:{i:0;s:23:"webform_email_edit_form";i:1;i:1;i:2;i:4;}', 22, 5, '', 'node/%/webform/emails/%', 'Edit e-mail settings', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform/includes/webform.emails.inc'),
('admin/build/services/settings/general', '', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', 'drupal_get_form', 'a:1:{i:0;s:23:"services_admin_settings";}', 31, 5, 'admin/build/services/settings', 'admin/build/services', 'General', 't', '', 136, '', 'Configure service settings.', '', -10, 'sites/all/modules/services/services_admin_browse.inc'),
('node/%/revisions/%/view', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_show', 'a:3:{i:0;i:1;i:1;N;i:2;b:1;}', 21, 5, '', 'node/%/revisions/%/view', 'Revisions', 't', '', 4, '', '', '', 0, ''),
('admin/build/services/browse/%', 'a:1:{i:4;s:20:"services_method_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', 'services_admin_browse_method', 'a:1:{i:0;i:4;}', 30, 5, 'admin/build/services/browse', 'admin/build/services', 'Services', 't', '', 128, '', 'Calls a Services method.', '', 0, 'sites/all/modules/services/services_admin_browse.inc'),
('admin/content/node-type/page/access', '', '', 'content_access_admin_settings_access', 'a:0:{}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_access_admin_settings";i:1;s:4:"page";}', 31, 5, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Access control', 't', '', 128, '', 'Configure content access control.', '', 1, 'sites/all/modules/content_access/content_access.admin.inc'),
('admin/content/node-type/story/access', '', '', 'content_access_admin_settings_access', 'a:0:{}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_access_admin_settings";i:1;s:5:"story";}', 31, 5, 'admin/content/node-type/story', 'admin/content/node-type/story', 'Access control', 't', '', 128, '', 'Configure content access control.', '', 1, 'sites/all/modules/content_access/content_access.admin.inc'),
('admin/content/node-type/webform/access', '', '', 'content_access_admin_settings_access', 'a:0:{}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_access_admin_settings";i:1;s:7:"webform";}', 31, 5, 'admin/content/node-type/webform', 'admin/content/node-type/webform', 'Access control', 't', '', 128, '', 'Configure content access control.', '', 1, 'sites/all/modules/content_access/content_access.admin.inc');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES
('node/%/webform-results/analysis/%', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:2:{i:0;i:1;i:1;i:4;}}i:4;a:1:{s:27:"webform_menu_component_load";a:2:{i:0;i:1;i:1;i:4;}}}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'webform_results_analysis', 'a:3:{i:0;i:1;i:1;a:0:{}i:2;i:4;}', 22, 5, '', 'node/%/webform-results/analysis/%', 'Analysis', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform/includes/webform.report.inc'),
('node/%/submission/%/delete', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:3;a:1:{s:28:"webform_menu_submission_load";a:1:{i:0;i:1;}}}', '', 'webform_submission_access', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:6:"delete";}', 'drupal_get_form', 'a:3:{i:0;s:30:"webform_submission_delete_form";i:1;i:1;i:2;i:3;}', 21, 5, 'node/%/submission/%', 'node/%/submission/%', 'Delete', 't', '', 128, '', '', '', 2, 'sites/all/modules/webform/includes/webform.submissions.inc'),
('node/%/revisions/%/delete', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"delete";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_delete_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/delete', 'Delete earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc'),
('node/%/submission/%/edit', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:3;a:1:{s:28:"webform_menu_submission_load";a:1:{i:0;i:1;}}}', '', 'webform_submission_access', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:4:"edit";}', 'webform_submission_page', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:4:"form";}', 21, 5, 'node/%/submission/%', 'node/%/submission/%', 'Edit', 't', '', 128, '', '', '', 1, 'sites/all/modules/webform/includes/webform.submissions.inc'),
('node/%/submission/%/resend', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:3;a:1:{s:28:"webform_menu_submission_load";a:1:{i:0;i:1;}}}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:3:{i:0;s:25:"webform_submission_resend";i:1;i:1;i:2;i:3;}', 21, 5, '', 'node/%/submission/%/resend', 'Resend e-mails', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform/includes/webform.submissions.inc'),
('node/%/revisions/%/revert', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"update";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_revert_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/revert', 'Revert to earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc'),
('node/%/submission/%/view', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:3;a:1:{s:28:"webform_menu_submission_load";a:1:{i:0;i:1;}}}', '', 'webform_submission_access', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:4:"view";}', 'webform_submission_page', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:4:"html";}', 21, 5, 'node/%/submission/%', 'node/%/submission/%', 'View', 't', '', 136, '', '', '', 0, 'sites/all/modules/webform/includes/webform.submissions.inc'),
('node/%/webform/components/%', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:2:{i:0;i:1;i:1;i:5;}}i:4;a:1:{s:27:"webform_menu_component_load";a:2:{i:0;i:1;i:1;i:5;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:4:{i:0;s:27:"webform_component_edit_form";i:1;i:1;i:2;i:4;i:3;b:0;}', 22, 5, 'node/%/webform/components', 'node/%', '', 't', '', 128, '', '', '', 0, 'sites/all/modules/webform/includes/webform.components.inc'),
('node/%/webform/emails/%/delete', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:4;a:1:{s:23:"webform_menu_email_load";a:1:{i:0;i:1;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:3:{i:0;s:25:"webform_email_delete_form";i:1;i:1;i:2;i:4;}', 45, 6, '', 'node/%/webform/emails/%/delete', 'Delete e-mail settings', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform/includes/webform.emails.inc'),
('admin/build/menu/item/%/delete', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_item_delete_page', 'a:1:{i:0;i:4;}', 61, 6, '', 'admin/build/menu/item/%/delete', 'Delete menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/menu/item/%/edit', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:4:"edit";i:2;i:4;i:3;N;}', 61, 6, '', 'admin/build/menu/item/%/edit', 'Edit menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/content/taxonomy/edit/vocabulary/%', 'a:1:{i:5;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_vocabulary_edit', 'a:1:{i:0;i:5;}', 62, 6, '', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/menu/item/%/reset', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:23:"menu_reset_item_confirm";i:1;i:4;}', 61, 6, '', 'admin/build/menu/item/%/reset', 'Reset menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/content/taxonomy/%/add/term', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_add_term_page', 'a:1:{i:0;i:3;}', 59, 6, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'Add term', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('node/%/webform/validation/add/%', 'a:2:{i:1;s:17:"webform_menu_load";i:5;N;}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:4:{i:0;s:30:"webform_validation_manage_rule";i:1;i:1;i:2;s:3:"add";i:3;i:5;}', 46, 6, '', 'node/%/webform/validation/add/%', 'Add validation', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform_validation/webform_validation.admin.inc'),
('node/%/webform/validation/delete/%', 'a:2:{i:1;s:17:"webform_menu_load";i:5;s:28:"webform_validation_rule_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:30:"webform_validation_delete_rule";i:1;i:5;}', 46, 6, '', 'node/%/webform/validation/delete/%', 'Delete rule', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform_validation/webform_validation.admin.inc'),
('node/%/webform/components/%/delete', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:2:{i:0;i:1;i:1;i:5;}}i:4;a:1:{s:27:"webform_menu_component_load";a:2:{i:0;i:1;i:1;i:5;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:3:{i:0;s:29:"webform_component_delete_form";i:1;i:1;i:2;i:4;}', 45, 6, 'node/%/webform/components/%', 'node/%', '', 't', '', 128, '', '', '', 0, 'sites/all/modules/webform/includes/webform.components.inc'),
('node/%/webform/components/%/clone', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:2:{i:0;i:1;i:1;i:5;}}i:4;a:1:{s:27:"webform_menu_component_load";a:2:{i:0;i:1;i:1;i:5;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:4:{i:0;s:27:"webform_component_edit_form";i:1;i:1;i:2;i:4;i:3;b:1;}', 45, 6, 'node/%/webform/components/%', 'node/%', '', 't', '', 128, '', '', '', 0, 'sites/all/modules/webform/includes/webform.components.inc'),
('user/contact/datagroup/detail/%/%/%', 'a:3:{i:4;N;i:5;N;i:6;N;}', '', 'user_access', 'a:1:{i:0;s:20:"access user contacts";}', 'contacts_share_datagroup_detail', 'a:0:{}', 120, 7, '', 'user/contact/datagroup/detail/%/%/%', 'My datagroup details', 't', '', 6, '', '', '', 0, ''),
('user/contact/subdatagroup/detail/%/%/%', 'a:3:{i:4;N;i:5;N;i:6;N;}', '', 'user_access', 'a:1:{i:0;s:20:"access user contacts";}', 'contacts_share_subdatagroup_detail', 'a:0:{}', 120, 7, '', 'user/contact/subdatagroup/detail/%/%/%', 'My subdatagroups details', 't', '', 6, '', '', '', 0, ''),
('node/%/data/submission/%/delete/%', 'a:3:{i:1;N;i:4;N;i:6;N;}', '', 'user_access', 'a:1:{i:0;s:26:"access all webform results";}', 'drupal_get_form', 'a:1:{i:0;s:32:"view_data_submission_delete_form";}', 90, 7, '', 'node/%/data/submission/%/delete/%', 'Delete', 't', '', 6, '', '', '', 0, ''),
('node/%/data/submission/%/edit/%', 'a:3:{i:1;N;i:4;N;i:6;N;}', '', 'user_access', 'a:1:{i:0;s:26:"access all webform results";}', 'view_data_submission_edit_page', 'a:2:{i:0;i:1;i:1;i:4;}', 90, 7, '', 'node/%/data/submission/%/edit/%', 'Edit', 't', '', 6, '', '', '', 0, ''),
('node/%/webform/validation/edit/%/%', 'a:3:{i:1;s:17:"webform_menu_load";i:5;N;i:6;s:28:"webform_validation_rule_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:5:{i:0;s:30:"webform_validation_manage_rule";i:1;i:1;i:2;s:4:"edit";i:3;i:5;i:4;i:6;}', 92, 7, '', 'node/%/webform/validation/edit/%/%', 'Edit rule', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform_validation/webform_validation.admin.inc');

-- --------------------------------------------------------

--
-- Table structure for table `menu_token`
--

CREATE TABLE IF NOT EXISTS `menu_token` (
  `mlid` int(10) unsigned NOT NULL,
  `link_path` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`mlid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_token`
--

INSERT INTO `menu_token` (`mlid`, `link_path`) VALUES
(256, 'user/[user-id]/edit/chgpwd');

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

CREATE TABLE IF NOT EXISTS `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `comment` int(11) NOT NULL DEFAULT '0',
  `promote` int(11) NOT NULL DEFAULT '0',
  `moderate` int(11) NOT NULL DEFAULT '0',
  `sticky` int(11) NOT NULL DEFAULT '0',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0',
  `translate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_moderate` (`moderate`),
  KEY `node_promote_status` (`promote`,`status`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `node`
--

INSERT INTO `node` (`nid`, `vid`, `type`, `language`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `moderate`, `sticky`, `tnid`, `translate`) VALUES
(14, 14, 'webform', '', 'Contact Info', 1, 1, 1340106356, 1343803565, 0, 1, 0, 0, 0, 0),
(2, 2, 'webform', '', 'Personal Data', 1, 1, 1339680736, 1343798403, 0, 1, 0, 0, 0, 0),
(3, 3, 'webform', '', 'Financial', 1, 1, 1340016692, 1343798427, 0, 1, 0, 0, 0, 0),
(4, 4, 'webform', '', 'Employment Info', 1, 1, 1340031450, 1343798988, 0, 1, 0, 0, 0, 0),
(5, 5, 'webform', '', 'Medical History', 1, 1, 1340031867, 1343799203, 0, 1, 0, 0, 0, 0),
(6, 6, 'webform', '', 'Expenses', 1, 1, 1340033503, 1343799236, 0, 1, 0, 0, 0, 0),
(7, 7, 'webform', '', 'Maintenance & Recalls', 1, 1, 1340033896, 1343799337, 0, 1, 0, 0, 0, 0),
(8, 8, 'webform', '', 'Government ID', 1, 1, 1340033989, 1343799342, 0, 1, 0, 0, 0, 0),
(9, 9, 'webform', '', 'Insurance and Car Registration', 1, 1, 1340034190, 1343799409, 0, 1, 0, 0, 0, 0),
(10, 10, 'webform', '', 'Favorites', 1, 1, 1340034424, 1343799443, 0, 1, 0, 0, 0, 0),
(11, 11, 'webform', '', 'Products & Warranties', 1, 1, 1340034858, 1343799444, 0, 1, 0, 0, 0, 0),
(12, 12, 'webform', '', 'Home Registry', 1, 1, 1340035044, 1343799481, 0, 1, 0, 0, 0, 0),
(13, 13, 'webform', '', 'Web Sites', 1, 1, 1340035271, 1343799485, 0, 1, 0, 0, 0, 0),
(15, 15, 'page', '', 'One App.  One Website.  One Person.&trade;', 1, 1, 1342074204, 1360838625, 0, 0, 0, 0, 0, 0),
(17, 17, 'page', '', 'Contact Us', 1, 1, 1343800889, 1345204502, 0, 0, 0, 0, 0, 0),
(18, 18, 'page', '', 'How It Works', 1, 1, 1343800944, 1360839136, 0, 0, 0, 0, 0, 0),
(20, 20, 'page', '', 'About Us', 1, 1, 1343801284, 1360846856, 0, 0, 0, 0, 0, 0),
(21, 21, 'page', '', 'Welcome to Register My Info', 1, 1, 1344250663, 1359968878, 0, 0, 0, 0, 0, 0),
(22, 22, 'page', '', 'Terms', 1, 1, 1345203928, 1361179646, 0, 0, 0, 0, 0, 0),
(23, 23, 'page', '', 'Privacy Policy', 1, 1, 1345204189, 1351582949, 0, 0, 0, 0, 0, 0),
(24, 24, 'page', '', 'Access denied', 1, 1, 1347883719, 1347883719, 0, 0, 0, 0, 0, 0),
(25, 25, 'page', '', 'Lorem ipsum', 1, 1, 1349162560, 1349162560, 0, 0, 0, 0, 0, 0),
(26, 26, 'page', '', 'Pellentesque', 1, 1, 1349162613, 1349162613, 0, 0, 0, 0, 0, 0),
(27, 27, 'page', '', 'Solutions', 1, 1, 1349430941, 1352894477, 0, 0, 0, 0, 0, 0),
(28, 28, 'page', '', 'Individual RMI Plan', 1, 1, 1349431028, 1360845399, 0, 0, 0, 0, 0, 0),
(29, 29, 'page', '', 'Family RMI Plan', 1, 1, 1349431059, 1352894463, 0, 0, 0, 0, 0, 0),
(30, 30, 'page', '', 'Business RMI Plan', 1, 1, 1349431099, 1350467729, 0, 0, 0, 0, 0, 0),
(31, 31, 'page', '', 'News', 1, 1, 1350547448, 1350547448, 0, 0, 0, 0, 0, 0),
(32, 32, 'page', '', 'Help', 1, 1, 1350547482, 1352119471, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_access`
--

CREATE TABLE IF NOT EXISTS `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` varchar(255) NOT NULL DEFAULT '',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `node_access`
--

INSERT INTO `node_access` (`nid`, `gid`, `realm`, `grant_view`, `grant_update`, `grant_delete`) VALUES
(2, 2, 'content_access_rid', 1, 0, 0),
(3, 2, 'content_access_rid', 1, 0, 0),
(4, 2, 'content_access_rid', 1, 0, 0),
(5, 2, 'content_access_rid', 1, 0, 0),
(6, 2, 'content_access_rid', 1, 0, 0),
(7, 2, 'content_access_rid', 1, 0, 0),
(8, 2, 'content_access_rid', 1, 0, 0),
(9, 2, 'content_access_rid', 1, 0, 0),
(10, 2, 'content_access_rid', 1, 0, 0),
(11, 2, 'content_access_rid', 1, 0, 0),
(12, 2, 'content_access_rid', 1, 0, 0),
(13, 2, 'content_access_rid', 1, 0, 0),
(14, 2, 'content_access_rid', 1, 0, 0),
(15, 0, 'all', 1, 0, 0),
(17, 0, 'all', 1, 0, 0),
(18, 0, 'all', 1, 0, 0),
(20, 0, 'all', 1, 0, 0),
(21, 0, 'all', 1, 0, 0),
(22, 0, 'all', 1, 0, 0),
(23, 0, 'all', 1, 0, 0),
(24, 0, 'all', 1, 0, 0),
(25, 0, 'all', 1, 0, 0),
(26, 0, 'all', 1, 0, 0),
(27, 0, 'all', 1, 0, 0),
(28, 0, 'all', 1, 0, 0),
(29, 0, 'all', 1, 0, 0),
(30, 0, 'all', 1, 0, 0),
(31, 0, 'all', 1, 0, 0),
(32, 0, 'all', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_comment_statistics`
--

CREATE TABLE IF NOT EXISTS `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0',
  `last_comment_name` varchar(60) DEFAULT NULL,
  `last_comment_uid` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`),
  KEY `comment_count` (`comment_count`),
  KEY `last_comment_uid` (`last_comment_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `node_comment_statistics`
--

INSERT INTO `node_comment_statistics` (`nid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) VALUES
(14, 1340106356, NULL, 1, 0),
(2, 1339680736, NULL, 1, 0),
(3, 1340016692, NULL, 1, 0),
(4, 1340031450, NULL, 1, 0),
(5, 1340031867, NULL, 1, 0),
(6, 1340033503, NULL, 1, 0),
(7, 1340033896, NULL, 1, 0),
(8, 1340033989, NULL, 1, 0),
(9, 1340034190, NULL, 1, 0),
(10, 1340034424, NULL, 1, 0),
(11, 1340034858, NULL, 1, 0),
(12, 1340035044, NULL, 1, 0),
(13, 1340035271, NULL, 1, 0),
(15, 1342074204, NULL, 1, 0),
(17, 1343800889, NULL, 1, 0),
(18, 1343800944, NULL, 1, 0),
(20, 1343801284, NULL, 1, 0),
(21, 1344250663, NULL, 1, 0),
(22, 1345203928, NULL, 1, 0),
(23, 1345204189, NULL, 1, 0),
(24, 1347883719, NULL, 1, 0),
(25, 1349162560, NULL, 1, 0),
(26, 1349162613, NULL, 1, 0),
(27, 1349430941, NULL, 1, 0),
(28, 1349431028, NULL, 1, 0),
(29, 1349431059, NULL, 1, 0),
(30, 1349431099, NULL, 1, 0),
(31, 1350547448, NULL, 1, 0),
(32, 1350547482, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_counter`
--

CREATE TABLE IF NOT EXISTS `node_counter` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `totalcount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `daycount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `node_revisions`
--

CREATE TABLE IF NOT EXISTS `node_revisions` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `teaser` longtext NOT NULL,
  `log` longtext NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `format` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `node_revisions`
--

INSERT INTO `node_revisions` (`nid`, `vid`, `uid`, `title`, `body`, `teaser`, `log`, `timestamp`, `format`) VALUES
(14, 14, 1, 'Contact Info', '', '', '', 1343803565, 1),
(2, 2, 1, 'Personal Data', '', '', '', 1343798403, 1),
(3, 3, 1, 'Financial', '', '', '', 1343798427, 1),
(4, 4, 1, 'Employment Info', '', '', '', 1343798988, 1),
(5, 5, 1, 'Medical History', '', '', '', 1343799203, 1),
(6, 6, 1, 'Expenses', '', '', '', 1343799236, 1),
(7, 7, 1, 'Maintenance & Recalls', '', '', '', 1343799337, 1),
(8, 8, 1, 'Government ID', '', '', '', 1343799342, 1),
(9, 9, 1, 'Insurance and Car Registration', '', '', '', 1343799409, 1),
(10, 10, 1, 'Favorites', '', '', '', 1343799443, 1),
(11, 11, 1, 'Products & Warranties', '', '', '', 1343799444, 1),
(12, 12, 1, 'Home Registry', '', '', '', 1343799481, 1),
(13, 13, 1, 'Web Sites', '', '', '', 1343799485, 1),
(17, 17, 1, 'Contact Us', 'Register My Info\r\n7702 East Doubletree Ranch, Suite 300\r\nScottsdale, Arizona 85258\r\nEmail Address:\r\ninfo@registermyinfo.com\r\nTelephone number:\r\n480-348-3974', 'Register My Info\r\n7702 East Doubletree Ranch, Suite 300\r\nScottsdale, Arizona 85258\r\nEmail Address:\r\ninfo@registermyinfo.com\r\nTelephone number:\r\n480-348-3974', '', 1345204502, 1),
(15, 15, 1, 'One App.  One Website.  One Person.&trade;', '<iframe src="https://player.vimeo.com/video/50395376?title=0&amp;byline=0&amp;portrait=0" width="100%" height="400" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>\r\n<br/>\r\n<strong><span style="font-size:15px;">Our Mission Statement</span></strong>\r\n<p style="font-size:15px;text-align:justify">Register My Info&trade; is built on the idea that individuals require an easier mechanism of communication and distribution of their personal information amongst friends, family, businesses and others than what currently exists. Register My Info revolutionizes mobile device Integrated Sharing&trade;, which we predict is the next best thing.  Register My Info makes sure that our clients have what they need to run their lives as well as possible with maximum efficiency and reliability. Mobile device users want everything at their fingertips and there are an increasing number of users that want or need to share certain aspects of their information. Therefore, Register My Info’s goal is to one day allow users the ability to no longer carry a wallet or purse as they will have all their information such as demographic, personal, financial, health, insurance and government ID (in development) right at their fingertips with all their information stored within their mobile device’s Register My Info app. The web and app services allow users to confidently share and unshare any aspect of their information.</p>\r\n<p  style="font-size:15px;text-align:justify">Register My Info’s reliability is critical to our success and the success of our clients, so we give our users the assurance that their personal information will always be there when they need it.  Our slogan is “<strong>One app. One website. One Person.&trade;</strong>” We truly believe that Register My Info allows every person to have everything they need.</p>', '<iframe src="https://player.vimeo.com/video/50395376?title=0&amp;byline=0&amp;portrait=0" width="100%" height="400" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>\r\n<br/>\r\n<strong><span style="font-size:15px;">Our Mission Statement</span></strong>\r', '', 1360838625, 2),
(18, 18, 1, 'How It Works', '<p style="text-align:justify;">Users will be able to create and curate their own personal content and share and unshare their most relevant, most widely and most popular used information.  RMI is not a personal aggregator as it does not search the Internet for individual information to store like a computer or software program would search for data information.  Rather, RMI represents the most important content curation product, YOU, the individual.    RMI allows the individual user to use a closed system that allows the user to organize, maintain, manually update, and share what is most important in their daily lives.  Basically, RMI represents an updated way for individual content curation.</p>\r\n\r\n<p style="text-align:justify;"><strong>So how does RMI work?</strong> Register My Info&trade; (RMI) is a patent-pending web-based and mobile device application service that helps solve several needs in the fast-emerging market for data storage, content curation, and sharing. The Company has developed a file-sharing platform and mobile app for the storage and dissemination of personal and business information. As our parent company''s name, Infinitude Inc., represents, RMI offers a platform that allows an infinite amount of content to be stored, curated and shared. Users may enter all their personal information concerning demographics, financial, employment, health, insurance, credit cards, personal identification, social networking sites, purchased products/warranty, likes/dislikes, recommendations/nonrecommendations, and whatever else our users can think of sharing. RMI is one of a kind in now allowing complete integrated sharing. We foresee integrated sharing as the best step in the sharing world.</p>\r\n\r\n<p style="text-align:justify;"><strong>How about some examples?</strong> Say you walk into a new doctor or dentist’s office and when you check in they ask for your information and give you a ton of forms to fill out. We have all been there and we know how cumbersome it can be. With RMI, you have prefilled all of your information and with a click of a button and a scan of your mobile device you get to choose what information you want to share with the doctor or dentist. Another great thing is that you can unshare the information at anytime in the future.</p>  \r\n\r\n<p style="text-align:justify;">Or, say you want to share your latest social networking schemes from Facebook, Twitter, Pinterest or others but you don’t want to visit each website to choose what to share and with whom. Too much time wasted doing it this way, right? RMI allows you to curate content from any site and then share with your selected friends, colleagues and/or businesses that you have selected through RMI. You no longer have to visit and share through each site individually.</p>\r\n\r\n<iframe src="https://player.vimeo.com/video/50395376?title=0&amp;byline=0&amp;portrait=0" width="100%" height="400" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>\r\n\r\n<p style="text-align:justify;">Okay, another example for you. Say you are looking for a car insurance company. Sure there are a ton of ways to search the Internet to find this information, but what better way than to tap into your shared RMI network of friends and colleagues to ask for a recommendation You get the best recommendation based on your RMI network’s recommendation.  In addition, your friend or colleague can share their insurance company information directly with you as they have all this information stored already.</p>\r\n\r\n<p style="text-align:justify;">How about purchasing products online or in a store?  RMI can help there as well.  Say you just bought a new laptop.  RMI will help you store information like the date you purchased the computer and warranty information. It also allows you to share this information with another individual or business.  By storing all your product information in one place, RMI allows you to share any or all of your product information at anytime and for any reason. RMI will collaborate with companies to allow you to scan product/warranty information into your RMI mobile app that will store the information to make you aware of the date you purchased item, item specifications and more.  RMI will then also be able to notify you of any product recalls, product warranty expiration, and more.  Say your laptop was stolen. Sure, there are tracking systems nowadays, but what if you could quickly pull up your serial number for law enforcement and share your information with them at time zero? You increase your chances of locating your items.  Also, through RMI’s app, you can share any stolen information stored right in your mobile device with not only law enforcement but with your insurance company, so they can start your claim at time zero.</p>\r\n\r\n<p style="text-align:justify;">RMI is working on developing a fully-digital identification card similar to a driver’s license that we hope to collaborate with state, national and international governments to allow RMI users to have a driver’s license and/or passport in the future right on their smartphone.  RMI believes we can make this possible with the highest level of security required to allow our users the convenience of carrying their personal identification card in their RMI mobile application.</p>\r\n\r\n<p style="text-align:justify;">In summary, RMI hopes to offer our users the ability to have everything in their mobile device for review and sharing.  The curation options are limitless or like we enjoy saying, a sharing platform used to the <em>actual infinitude of today’s sharing world. </em></p>', '<p style="text-align:justify;">Users will be able to create and curate their own personal content and share and unshare their most relevant, most widely and most popular used information.  RMI is not a personal aggregator as it does not search the Internet for individual information to store like a computer or software program would search for data information.  Rather, RMI represents the most important content curation product, YOU, the individual.', '', 1360839136, 2),
(31, 31, 1, 'News', '', '', '', 1350547448, 1),
(21, 21, 1, 'Welcome to Register My Info', 'Welcome to Register My Info. Our company looks forward to serving you.  As our slogan states, we are “<strong>One app. One website. One Person.&trade;</strong>”\r\n<br>\r\n<a href=''/user/account'' class=''get_started''>Get Started</a>', 'Welcome to Register My Info. Our company looks forward to serving you.  As our slogan states, we are “<strong>One app. One website. One Person.&trade;</strong>”\r\n<br>\r\n<a href=''/user/account'' class=''get_started''>Get Started</a>', '', 1359968878, 1),
(20, 20, 1, 'About Us', '<p style="text-align:justify;">After years of frustration in not being able to carry and share data efficiently in both personal and business methods, Register My Info™ (RMI) was created to help facilitate improved methods in communicating and sharing information in healthcare, financial and business markets. Before RMI, users utilized several different websites and mobile apps to store and share personal and business information. RMI is one of a kind in now allowing complete Integrated Sharing&trade;.</p>\r\n<p style="text-align:justify;">Dr. Gil Ortega started RMI after years of frustration in not being able to carry and share data efficiently in both personal and business methods. Dr. Ortega engaged in many discussions with companies trying to help facilitate improved methods in communicating and sharing information in healthcare, financial and business markets. However, after years of trial and tribulations while working with different companies, Dr. Ortega found that his message was always lost in translation by large companies. The message was to provide the user with what they need right at their fingertips on their mobile devices. It seemed too complicated for individual companies to realize that personal and business sharing of information was not being done effectively.</p>\r\n<p style="text-align:justify;">As was the case before RMI, users had to have several different websites and mobile applications to store and share personal and business information. Furthermore, most of these methods of sharing were not compatible. Finally, after years of searching for an answer to solve the problem of inefficiencies with personal and business data sharing, Dr. Ortega decided to build his own company to fulfill the needs of every mobile device user with the bottom line desire to provide each user with everything they need right at their fingertips.</p>\r\n<p style="text-align:justify;"><strong>What is the product RMI delivers?</strong> Users will be able to curate their own personal content and share/unshare their most relevant and popular used information. RMI revolutionizes Integrated Sharing, which we predict is the next best thing. RMI represents the most important content curation product, the individual. RMI allows the individual user to use a closed system that allow the users to organize, maintain, manually update, and share what is most important in their daily lives.</p>\r\n<p style="text-align:justify;"><strong>What is RMI’s strategy?</strong> We plan on acquiring and maintaining users through the demonstration of a new product to individuals and businesses: Integrated Sharing. RMI fills the void in sharing amongst individuals and businesses. It is one thing to be able to share a photo or document. However, RMI allows any file to be integrated into a business solution by our sharing method. We foresee the market embracing Integrated Sharing as the biggest step in the sharing world.</p>\r\n<p style="text-align:justify;"><strong>What is RMI’s Business Model?</strong> Register My Info was created as a best-of-breed information-sharing platform that encompasses a wide variety of services for sharing and unsharing of data. Applications include the sharing of medical information among healthcare providers, sharing of financial data, digital government document sharing, and much more. RMI will provide people and businesses with a cloud-based registry from which they can share files with anyone, anywhere, creating improvements in efficiency, reduction of errors, and less paper waste.</p>\r\n<p style="text-align:justify;"><strong>How can we help your business grow?</strong> For businesses, Register My Info will offer leading-edge online collaboration tools and secure, reliable data storage and file-sharing services that create opportunities by allowing seamless sharing and unsharing of any data or information field.  Register My Info helps individuals and businesses create their sharing platform to allow a fully integrated platform that does not currently exist within current technologies.  If your business has a document that your customers use routinely, then have us Integrate it into RMI so your customers can share with you with a click of a button.</p>\r\n<p style="text-align:justify;">The ubiquity of the internet and the digitization of content and media have forever changed the way we communicate.  While presenting new revenue opportunities for business and providing more ways than ever to access content, it also presents new sets of data conversion, delivery, and storage challenges. There are many ways to currently share files and media across the internet, but they are found through disparate websites and apps.  Register My Info is a centralized platform that isn’t just a photo sharing app or a site to download large files.  It is an all-in-one repository for personal and business information, files, photos, and shared-access documents.</p>\r\n<p style="text-align:justify;">Register My Info will offer users competitively priced data storage accounts and will present businesses with multiple options for storage and sharing.  As compared to current technologies involving “basic sharing” of social information and documents, Register My Info helps its individual and business users create their sharing platform in order to allow them to share any type of information.  Uses for business include, but are not limited to:  general document storage, product warranty registration, medical implant registration, financial applications (i.e. credit card applications, mortgage applications, loan applications), e-commerce site hosting and payments, and restaurant menu and order registration and payment services. Our target demographics are all smartphone users. We estimate the potential worldwide number of RMI users to be between 250 to 500 million persons.  However, we will not be surprised if the actual number of RMI users surpasses this estimate.</p>', '<p style="text-align:justify;">After years of frustration in not being able to carry and share data efficiently in both personal and business methods, Register My Info™ (RMI) was created to help facilitate improved methods in communicating and sharing information in healthcare, financial and business markets. Before RMI, users utilized several different websites and mobile apps to store and share personal and business information. RMI is one of a kind in now allowing complete Integrated Sharing&trade;.</p>', '', 1360846856, 2),
(22, 22, 1, 'Terms', '<p style="padding-bottom:0px;"><strong>Agreement between user and <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a></strong></p>\r\n<p style="text-align:justify;padding-top:0px;">Welcome to <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a>. The <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> website (the "Site") is comprised of various web pages operated by Register My Info&trade; ("RMI"). <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> is offered to you conditioned on your acceptance without modification of the terms, conditions, and notices contained herein (the "Terms"). Your use of <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> constitutes your agreement to all such Terms. Please read these terms carefully, and keep a copy of them for your reference.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong><a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> is a E-commerce Site</strong></p>\r\n<p style="text-align:justify;">Register My Info&trade;’s reliability is critical to our success and the success of our clients, so we give our users the assurance that their personal information will always be there when they need it. Our slogan is “One app. One website. One Person.™” We truly believe that Register My Info™ allows every person to have everything they need.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Privacy</strong></p>\r\n<p style="text-align:justify;">Your use of <a href="http://www.registermyinfo.com/" target="_blank"  />www.registermyinfo.com</a> is subject to RMI''s Privacy Policy. Please review our Privacy Policy, which also governs the Site and informs users of our data collection practices.</p>\r\n\r\n<p style="text-align:justify">RMI’s statement of rights and responsibilities governs the relationship between users and others that use RMI. By engaging the uses of RMI, users agree to the Privacy Policy terms.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Electronic Communications</strong></p>\r\n<p style="text-align:justify">Visiting <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> or sending emails to RMI constitutes electronic communications. You consent to receive electronic communications and you agree that all agreements, notices, disclosures and other communications that we provide to you electronically, via email and on the Site, satisfy any legal requirement that such communications be in writing.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Your account</strong></p>\r\n<p style="text-align:justify">If you use this site, you are responsible for maintaining the confidentiality of your account and password and for restricting access to your computer, and you agree to accept responsibility for all activities that occur under your account or password. You may not assign or otherwise transfer your account to any other person or entity. You acknowledge that RMI is not responsible for third party access to your account that results from theft or misappropriation of your account. RMI and its associates reserve the right to refuse or cancel service, terminate accounts, or remove or edit content in our sole discretion.</p>  \r\n\r\n<p style="text-align:justify">RMI does not knowingly collect, either online or offline, personal information from persons under the age of thirteen. If you are under 18, you may use <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> only with permission of a parent or guardian.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Cancellation/Refund Policy</strong></p>\r\n<p style="text-align:justify">Our main priority is your satisfaction. Therefore, we take pride in delivering to you the best product and service available. Our customer service will address your needs immediately. We want you to be happy when you are using our services. Our purchase policy is simple: we will refund your purchase if you are not satisfied. We are happy you are a customer of ours, and we want you to keep coming back to us so we may address your personal curation, sharing and unsharing needs.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Links to third party sites/Third party services</strong></p>\r\n<p style="text-align:justify"><a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> may contain links to other websites ("Linked Sites"). The Linked Sites are not under the control of RMI and RMI is not responsible for the contents of any Linked Site, including without limitation any link contained in a Linked Site, or any changes or updates to a Linked Site. RMI is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement by RMI of the site or any association with its operators.<p>\r\n\r\n<p style="text-align:justify">Certain services made available via <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> are delivered by third party sites and organizations. By using any product, service or functionality originating from the <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> domain, you hereby acknowledge and consent that RMI may share such information and data with any third party with whom RMI has a contractual relationship to provide the requested product, service or functionality on behalf of <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> users and customers.<p>\r\n\r\n<p style="padding-bottom:0px;"><strong>No unlawful or prohibited use/Intellectual Property</strong></p>\r\n<p style="text-align:justify">You are granted a non-exclusive, non-transferable, revocable license to access and use <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> strictly in accordance with these terms of use. As a condition of your use of the Site, you warrant to RMI that you will not use the Site for any purpose that is unlawful or prohibited by these Terms. You may not use the Site in any manner which could damage, disable, overburden, or impair the Site or interfere with any other party''s use and enjoyment of the Site. You may not obtain or attempt to obtain any materials or information through any means not intentionally made available or provided for through the Site.</p>\r\n\r\n<p style="text-align:justify">All content included as part of the Service, such as text, graphics, logos, images, as well as the compilation thereof, and any software used on the Site, is the property of RMI or its suppliers and protected by copyright and other laws that protect intellectual property and proprietary rights. You agree to observe and abide by all copyright and other proprietary notices, legends or other restrictions contained in any such content and will not make any changes thereto.</p>\r\n\r\n<p style="text-align:justify">You will not modify, publish, transmit, reverse engineer, participate in the transfer or sale, create derivative works, or in any way exploit any of the content, in whole or in part, found on the Site. RMI content is not for resale. Your use of the Site does not entitle you to make any unauthorized use of any protected content, and in particular you will not delete or alter any proprietary rights or attribution notices in any content. You will use protected content solely for your personal use, and will make no other use of the content without the express written permission of RMI and the copyright owner. You agree that you do not acquire any ownership rights in any protected content. We do not grant you any licenses, express or implied, to the intellectual property of RMI or our licensors except as expressly authorized by these Terms.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Use of communication services</strong></p>\r\n<p style="text-align:justify">The Site may contain bulletin board services, chat areas, news groups, forums, communities, personal web pages, calendars, and/or other message or communication facilities designed to enable you to communicate with the public at large or with a group (collectively, "Communication Services"), you agree to use the Communication Services only to post, send and receive messages and material that are proper and related to the particular Communication Service.</p>\r\n\r\n<p style="text-align:justify">By way of example, and not as a limitation, you agree that when using a Communication Service, you will not: defame, abuse, harass, stalk, threaten or otherwise violate the legal rights (such as rights of privacy and publicity) of others; publish, post, upload, distribute or disseminate any inappropriate, profane, defamatory, infringing, obscene, indecent or unlawful topic, name, material or information; upload files that contain software or other material protected by intellectual property laws (or by rights of privacy of publicity) unless you own or control the rights thereto or have received all necessary consents; upload files that contain viruses, corrupted files, or any other similar software or programs that may damage the operation of another''s computer; advertise or offer to sell or buy any goods or services for any business purpose, unless such Communication Service specifically allows such messages; conduct or forward surveys, contests, pyramid schemes or chain letters; download any file posted by another user of a Communication Service that you know, or reasonably should know, cannot be legally distributed in such manner; falsify or delete any author attributions, legal or other proper notices or proprietary designations or labels of the origin or source of software or other material contained in a file that is uploaded, restrict or inhibit any other user from using and enjoying the Communication Services; violate any code of conduct or other guidelines which may be applicable for any particular Communication Service; harvest or otherwise collect information about others, including e-mail addresses, without their consent; violate any applicable laws or regulations.</p>\r\n\r\n<p style="text-align:justify">RMI has no obligation to monitor the Communication Services. However, RMI reserves the right to review materials posted to a Communication Service and to remove any materials in its sole discretion. RMI reserves the right to terminate your access to any or all of the Communication Services at any time without notice for any reason whatsoever.</p>\r\n\r\n<p style="text-align:justify">RMI reserves the right at all times to disclose any information as necessary to satisfy any applicable law, regulation, legal process or governmental request, or to edit, refuse to post or to remove any information or materials, in whole or in part, in RMI''s sole discretion.</p>  \r\n<p style="text-align:justify">Always use caution when giving out any personally identifying information about yourself or your children in any Communication Service. RMI does not control or endorse the content, messages or information found in any Communication Service and, therefore, RMI specifically disclaims any liability with regard to the Communication Services and any actions resulting from your participation in any Communication Service. Managers and hosts are not authorized RMI spokespersons, and their views do not necessarily reflect those of RMI.</p>\r\n\r\n<p style="text-align:justify">Materials uploaded to a Communication Service may be subject to posted limitations on usage, reproduction and/or dissemination. You are responsible for adhering to such limitations if you upload the materials.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Materials provided to <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> or posted on any RMI web page</strong></p>\r\n<p style="text-align:justify">RMI does not claim ownership of the materials you provide to www.registermyinfo.com (including feedback and suggestions) or post, upload, input or submit to any RMI Site or our associated services (collectively "Submissions"). However, by posting, uploading, inputting, providing or submitting your Submission you are granting RMI, our affiliated companies and necessary sublicensees permission to use your Submission in connection with the operation of their Internet businesses including, without limitation, the rights to: copy, distribute, transmit, publicly display, publicly perform, reproduce, edit, translate and reformat your Submission; and to publish your name in connection with your Submission.</p>\r\n\r\n<p style="text-align:justify">No compensation will be paid with respect to the use of your Submission, as provided herein. RMI is under no obligation to post or use any Submission you may provide and may remove any Submission at any time in RMI''s sole discretion.</p>\r\n\r\n<p style="text-align:justify">By posting, uploading, inputting, providing or submitting your Submission you warrant and represent that you own or otherwise control all of the rights to your Submission as described in this section including, without limitation, all the rights necessary for you to provide, post, upload, input or submit the Submissions.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>International Users</strong></p>\r\n<p style="text-align:justify">The Service is controlled, operated and administered by RMI from our offices within the USA. If you access the Service from a location outside the USA, you are responsible for compliance with all local laws. You agree that you will not use the RMI Content accessed through <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> laws, restrictions or regulations.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Indemnification</strong></p>\r\n<p style="text-align:justify">You agree to indemnify, defend and hold harmless RMI, its officers, directors, employees, agents and third parties, for any losses, costs, liabilities and expenses (including reasonable attorneys'' fees) relating to or arising out of your use of or inability to use the Site or services, any user postings made by you, your violation of any terms of this Agreement or your violation of any rights of a third party, or your violation of any applicable laws, rules or regulations. RMI reserves the right, at its own cost, to assume the exclusive defense and control of any matter otherwise subject to indemnification by you, in which event you will fully cooperate with RMI in asserting any available defenses.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Liability disclaimer</strong></p> \r\n<p style="text-align:justify">THE INFORMATION, SOFTWARE, PRODUCTS, AND SERVICES INCLUDED IN OR AVAILABLE THROUGH THE SITE MAY INCLUDE INACCURACIES OR TYPOGRAPHICAL ERRORS. CHANGES ARE PERIODICALLY ADDED TO THE INFORMATION HEREIN. REGISTER MY INFO™ AND/OR ITS SUPPLIERS MAY MAKE IMPROVEMENTS AND/OR CHANGES IN THE SITE AT ANY TIME.</p>\r\n\r\n<p style="text-align:justify">REGISTER MY INFO&trade; AND/OR ITS SUPPLIERS MAKE NO REPRESENTATIONS ABOUT THE SUITABILITY, RELIABILITY, AVAILABILITY, TIMELINESS, AND ACCURACY OF THE INFORMATION, SOFTWARE, PRODUCTS, SERVICES AND RELATED GRAPHICS CONTAINED ON THE SITE FOR ANY PURPOSE. TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, ALL SUCH INFORMATION, SOFTWARE, PRODUCTS, SERVICES AND RELATED GRAPHICS ARE PROVIDED "AS IS" WITHOUT WARRANTY OR CONDITION OF ANY KIND. REGISTER MY INFO™ AND/OR ITS SUPPLIERS HEREBY DISCLAIM ALL WARRANTIES AND CONDITIONS WITH REGARD TO THIS INFORMATION, SOFTWARE, PRODUCTS, SERVICES AND RELATED GRAPHICS, INCLUDING ALL IMPLIED WARRANTIES OR CONDITIONS OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT.</p>\r\n\r\n<p style="text-align:justify">TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT SHALL REGISTER MY INFO™ AND/OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, PUNITIVE, INCIDENTAL, SPECIAL, CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF USE, DATA OR PROFITS, ARISING OUT OF OR IN ANY WAY CONNECTED WITH THE USE OR PERFORMANCE OF THE SITE, WITH THE DELAY OR INABILITY TO USE THE SITE OR RELATED SERVICES, THE PROVISION OF OR FAILURE TO PROVIDE SERVICES, OR FOR ANY INFORMATION, SOFTWARE, PRODUCTS, SERVICES AND RELATED GRAPHICS OBTAINED THROUGH THE SITE, OR OTHERWISE ARISING OUT OF THE USE OF THE SITE, WHETHER BASED ON CONTRACT, TORT, NEGLIGENCE, STRICT LIABILITY OR OTHERWISE, EVEN IF REGISTER MY INFO™ OR ANY OF ITS SUPPLIERS HAS BEEN ADVISED OF THE POSSIBILITY OF DAMAGES. BECAUSE SOME STATES/JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF LIABILITY FOR CONSEQUENTIAL OR INCIDENTAL DAMAGES, THE ABOVE LIMITATION MAY NOT APPLY TO YOU. IF YOU ARE DISSATISFIED WITH ANY PORTION OF THE SITE, OR WITH ANY OF THESE TERMS OF USE, YOUR SOLE AND EXCLUSIVE REMEDY IS TO DISCONTINUE USING THE SITE.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Termination/access restriction</strong></p>\r\n<p style="text-align:justify">RMI reserves the right, in its sole discretion, to terminate your access to the Site and the related services or any portion thereof at any time, without notice. To the maximum extent permitted by law, this agreement is governed by the laws of the State of Arizona and you hereby consent to the exclusive jurisdiction and venue of courts in Arizona in all disputes arising out of or relating to the use of the Site. Use of the Site is unauthorized in any jurisdiction that does not give effect to all provisions of these Terms, including, without limitation, this section.</p>\r\n\r\n<p style="text-align:justify">You agree that no joint venture, partnership, employment, or agency relationship exists between you and RMI as a result of this agreement or use of the Site. RMI''s performance of this agreement is subject to existing laws and legal process, and nothing contained in this agreement is in derogation of RMI''s right to comply with governmental, court and law enforcement requests or requirements relating to your use of the Site or information provided to or gathered by RMI with respect to such use. If any part of this agreement is determined to be invalid or unenforceable pursuant to applicable law including, but not limited to, the warranty disclaimers and liability limitations set forth above, then the invalid or unenforceable provision will be deemed superseded by a valid, enforceable provision that most closely matches the intent of the original provision and the remainder of the agreement shall continue in effect.</p>\r\n\r\n<p style="text-align:justify">Unless otherwise specified herein, this agreement constitutes the entire agreement between the user and RMI with respect to the Site and it supersedes all prior or contemporaneous communications and proposals, whether electronic, oral or written, between the user and RMI with respect to the Site. A printed version of this agreement and of any notice given in electronic form shall be admissible in judicial or administrative proceedings based upon or relating to this agreement to the same extent an d subject to the same conditions as other business documents and records originally generated and maintained in printed form. It is the express wish to the parties that this agreement and all related documents be written in English.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Changes to Terms</strong></p> \r\n<p style="text-align:justify">RMI reserves the right, in its sole discretion, to change the Terms under which <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a> is offered. The most current version of the Terms will supersede all previous versions. RMI encourages you to periodically review the Terms to stay informed of our updates.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Contact Us</strong></p>\r\n<p>RMI welcomes your questions or comments regarding the Terms:</p>\r\n\r\n<p>Register My Info&trade;\r\n  7702 East Doubletree Ranch Road, Suite 300\r\n  Scottsdale, Arizona 85258<p>\r\n<p>Email Address:\r\n  info@registermyinfo.com</p>\r\n<p>Telephone number:\r\n  480-348-3974</p>\r\n<p>Effective as of January 14, 2013</p>', '<p style="padding-bottom:0px;"><strong>Agreement between user and <a href="http://www.registermyinfo.com/" target="_blank" />www.registermyinfo.com</a></strong></p>', '', 1361179646, 2),
(23, 23, 1, 'Privacy Policy', '<p style="text-align:justify;">Protecting your private information is our priority. This Statement of Privacy applies to www.registermyinfo.com and Register My Info&trade; and governs data collection and usage. For the purposes of this Privacy Policy, unless otherwise noted, all references to Register My Info include www.registermyinfo.com and RMI. The RMI website is an information sharing site. By using the RMI website, you consent to the data practices described in this statement.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>TRUSTe Privacy Program</strong></p>\r\n<p style="text-align:justify;">RMI has contracted with the TRUSTe Privacy Program.  TRUSTe is an independent organization whose mission is to build users'' trust and confidence in the Internet by promoting the use of fair information practices. Because we want to demonstrate our commitment to your privacy, we have agreed to disclose our information practices and have our privacy practices reviewed for compliance by TRUSTe.  TRUSTe is currently reviewing our website to ensure their appropriate certification.</p>\r\n\r\nIf you have questions or concerns regarding this policy, you should contact us at info@registermyinfo.com. \r\n\r\n<p style="padding-bottom:0px;"><strong>Collection of Your Personal Information</strong></p>\r\n<p style="text-align:justify;">RMI may collect personal identifiable information, such as your name. If you purchase RMI''s products and services, we collect billing and credit card information. This information is used to complete the purchase transaction. RMI may also collect anonymous demographic information, which is not unique to you, such as your age, gender and household income. We may gather additional personal or non-personal information in the future.</p>\r\n\r\n<p style="text-align:justify;">Information about your computer hardware and software may be automatically collected by RMI. This information can include the following: your IP address, browser type, domain names, access times and referring website addresses. This information is used for the operation of the service, to maintain quality of the service, and to provide general statistics regarding use of the RMI website. Please keep in mind that if you directly disclose personal identifiable information or personal sensitive data through RMI''s public message boards, this information may be collected and used by others.</p>\r\n\r\n<p style="text-align:justify;">RMI encourages you to review the privacy statements of websites you choose to link to from RMI so that you can understand how those websites collect, use and share your information. RMI is not responsible for the privacy statements or other content on websites outside of the RMI website.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Use of Your Personal Information</strong></p>\r\nRMI collects and uses your personal information to operate its website(s) and deliver the services you have requested.\r\n\r\n<p style="text-align:justify;">RMI may also use your personal identifiable information to inform you of other products or services available from RMI and its affiliates. RMI may also contact you via surveys to conduct research about your opinion of current services or of potential new services that may be offered. RMI does not sell, rent or lease its customer lists to third parties. RMI may, from time to time, contact you on behalf of external business partners about a particular offering that may be of interest to you. In those cases, your unique personal identifiable information (e-mail, name, address, telephone number) is not transferred to the third party. RMI may share data with trusted partners to help perform statistical analysis, send you email or postal mail, provide customer support, or arrange for deliveries. All such third parties are prohibited from using your personal information except to provide these services to RMI, and they are required to maintain the confidentiality of your information.</p>\r\n\r\n<p style="text-align:justify;">RMI will disclose your personal information, without notice, only if required to do so by law or in the good faith belief that such action is necessary to: (a) conform to the edicts of the law or comply with legal process served on RMI or the site; (b) protect and defend the rights or property of RMI; and, (c) act under exigent circumstances to protect the personal safety of users of RMI, or the public.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Use of Cookies</strong></p>\r\n<p style="text-align:justify;">The RMI website may use "cookies" to help you personalize your online experience. A cookie is a text file that is placed on your hard disk by a web page server. Cookies cannot be used to run programs or deliver viruses to your computer. Cookies are uniquely assigned to you, and can only be read by a web server in the domain that issued the cookie to you.</p>\r\n\r\n<p style="text-align:justify;">One of the primary purposes of cookies is to provide a convenience feature to save you time. The purpose of a cookie is to tell the web server that you have returned to a specific page. For example, if you personalize RMI pages, or register with the RMI site or services, a cookie helps RMI to recall your specific information on subsequent visits. This simplifies the process of recording your personal information such as billing addresses, shipping addresses, and so on. When you return to the same RMI website, the information you previously provided can be retrieved, so you can easily use the RMI features that you customized. You have the ability to accept or decline cookies. Most web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer. If you choose to decline cookies, you may not be able to fully experience the interactive features of the RMI services or websites you visit.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Security of Your Personal Information</strong></p>\r\n<p style="text-align:justify;">When personal information (such as credit card numbers or other financial information) is transmitted to other websites or users, it is protected through the use of encryption, such as the Secure Sockets Layer (SSL) protocol.</p>\r\n\r\n<p style="text-align:justify;">RMI is contracting with VeriSign.  VeriSign is an independent, third-party company engaged in the development of digital trust.  VeriSign provides authentication of Internet services, digital identity and intellectual property.   Also, our firewall protected, company server ensures HIPPA compliance by protecting vital health information as required for HIPPA compliance.</p> \r\n\r\n<p style="padding-bottom:0px;"><strong>Children Under Thirteen</strong></p>\r\n<p style="text-align:justify;">RMI does not knowingly collect personal identifiable information from children under the age of thirteen. If you are under the age of thirteen, you must ask your parent or guardian for permission to use this website.</p>\r\n\r\n<strong>Opt-Out & Unsubscribe</strong>\r\n<p style="text-align:justify;">We respect your privacy and give you an opportunity to opt-out of receiving announcements of certain information. Users may opt-out of receiving any or all communications from RMI by contacting us at <a href=''mailto:info@registermyinfo.com'' >info@registermyinfo.com</a></p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Changes to this Statement</strong></p>\r\n<p style="text-align:justify;">RMI will occasionally update this Statement of Privacy to reflect company and customer feedback. RMI encourages you to periodically review this Policy to be informed of how RMI is protecting your information.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Termination</strong></p>\r\n<p style="text-align:justify;">If a user violates the voice of the applied Policy or otherwise increases risk of possible legal violations to RMI, RMI can stop allowing access to RMI functions and content.  A user in violation of the voice of the applied Policy will be notified via email and/or at next time of use of RMI by user.  As stated above, a user may also delete his/her account or application at anytime.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>Contact Information</strong></p>\r\n<p>RMI welcomes your questions or comments regarding this Statement of Privacy. If you believe that RMI has not adhered to this Policy, please contact RMI at:</p>\r\n\r\n<p>Register My Info\r\n7702 East Doubletree Ranch, Suite 300\r\nScottsdale, Arizona 85258</p>\r\n<p>Email Address:\r\ninfo@registermyinfo.com</p>\r\n<p>Telephone number:\r\n480-348-3974</p>\r\n<p>Effective as of July 07, 2012</p>', '<p style="text-align:justify;">Protecting your private information is our priority. This Statement of Privacy applies to www.registermyinfo.com and Register My Info&trade; and governs data collection and usage. For the purposes of this Privacy Policy, unless otherwise noted, all references to Register My Info include www.registermyinfo.com and RMI. The RMI website is an information sharing site. By using the RMI website, you consent to the data practices described in this statement.</p>\r\n\r\n<p style="padding-bottom:0px;"><strong>TRUSTe Privacy Program</strong></p>', '', 1351582949, 2),
(24, 24, 1, 'Access denied', 'You are not authorized to access this page.', 'You are not authorized to access this page.', '', 1347883719, 1),
(25, 25, 1, 'Lorem ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus hendrerit consectetur dolor, et porta ante suscipit nec. Donec tempus lorem eget lorem adipiscing auctor. Ut ornare, neque sit amet malesuada tincidunt, tellus arcu iaculis orci, ac eleifend ante odio vel ligula. Fusce diam felis, volutpat et faucibus eu, lobortis eu purus. Sed dolor nibh, cursus id cursus at, lacinia id urna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur accumsan hendrerit turpis, ac fermentum velit gravida nec. Aliquam erat volutpat. Nullam mi dui, commodo vel eleifend in, tempor sed libero. Aliquam feugiat nunc eu nibh sodales a dignissim libero luctus. Ut enim purus, pellentesque eu porta sed, venenatis sit amet arcu. Etiam non consectetur mauris. Sed laoreet massa in arcu ornare ornare. ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus hendrerit consectetur dolor, et porta ante suscipit nec. Donec tempus lorem eget lorem adipiscing auctor. Ut ornare, neque sit amet malesuada tincidunt, tellus arcu iaculis orci, ac eleifend ante odio vel ligula. Fusce diam felis, volutpat et faucibus eu, lobortis eu purus. Sed dolor nibh, cursus id cursus at, lacinia id urna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur accumsan hendrerit turpis, ac fermentum velit gravida nec. Aliquam erat volutpat.', '', 1349162560, 1),
(26, 26, 1, 'Pellentesque', 'Pellentesque feugiat suscipit orci at varius. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus dignissim accumsan nunc, at blandit mi sollicitudin quis. Suspendisse ac sapien dui. Vestibulum varius gravida mi, at adipiscing mauris adipiscing eget. Nulla eu velit neque. Etiam cursus eleifend orci id tempor. Praesent sit amet tellus magna. Fusce ac libero feugiat mauris fermentum tempus. Etiam rutrum, lorem et imperdiet aliquam, dolor metus viverra ipsum, id ultrices ligula massa eu metus. Pellentesque lacinia lectus eu sapien dignissim pharetra ornare lectus volutpat. Pellentesque id eros imperdiet leo porta facilisis sed in nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nec nulla metus, a imperdiet ligula. ', 'Pellentesque feugiat suscipit orci at varius. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus dignissim accumsan nunc, at blandit mi sollicitudin quis. Suspendisse ac sapien dui. Vestibulum varius gravida mi, at adipiscing mauris adipiscing eget. Nulla eu velit neque. Etiam cursus eleifend orci id tempor. Praesent sit amet tellus magna. Fusce ac libero feugiat mauris fermentum tempus. Etiam rutrum, lorem et imperdiet aliquam, dolor metus viverra ipsum, id ultrices ligula massa eu metus.', '', 1349162613, 1);
INSERT INTO `node_revisions` (`nid`, `vid`, `uid`, `title`, `body`, `teaser`, `log`, `timestamp`, `format`) VALUES
(27, 27, 1, 'Solutions', '<div id="main">\r\n<div id="column_left">\r\n <h2>Individual RMI Plan</h2>\r\n <div class="sol_box" >\r\n<ol type="a">\r\n<li><span><span class=''price''>$9.99</span> for Individual app with up to 5 GB of storage</span></li>\r\n<li><span><span class=''price''>$19.99</span> for individual app with 10 GB of storage</span></li>\r\n<li><span><span class=''price''>$45.99</span> for individual app with 50 GB of storage</span></li>\r\n</ol>\r\n<div class="more"><a href="individual-rmi-plan">Read more >></a></div>\r\n</div>\r\n</div>\r\n<div id="column_right">\r\n<h2>Family RMI Plan</h2>\r\n<div class="sol_box" >\r\n<div style=''padding: 20px; margin-top: 30px;''>Family RMI Plan coming in 2013.</div>\r\n</div>\r\n</div>\r\n<div id="column_right_adsense">\r\n<h2>Business RMI Plan</h2>\r\n<div class="sol_box" >\r\n<ol type="a">\r\n<li><span>Business Registration Document utilization for RMI integration (please contact RMI customer service for pricing options)</span></li>\r\n<li><span>Business Product Registration for RMI integration (please contact RMI customer service for pricing options)</span>\r\n<ol type="i">\r\n<li>Allows customers to leave feedback</li>\r\n<li>Allows customers to state if Like or Dislike</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<div class="more"><a href="business-rmi-plan">Read more >></a></div>\r\n</div>\r\n</div>\r\n</div>', '<div id="main">\r\n<div id="column_left">\r\n <h2>Individual RMI Plan</h2>\r\n <div class="sol_box" >\r\n<ol type="a">\r\n<li><span><span class=''price''>$9.99</span> for Individual app with up to 5 GB of storage</span></li>\r\n<li><span><span class=''price''>$19.99</span> for individual app with 10 GB of storage</span></li>\r\n<li><span><span class=''price''>$45.99</span> for individual app with 50 GB of storage</span></li>\r\n</ol>\r\n<div class="more"><a href="individual-rmi-plan">Read more >></a></div>\r\n</div>\r\n</div>\r\n<div id="column_right">\r\n<h2>Family RMI Plan</h2>\r\n<div class="sol_box" >\r', '', 1352894477, 2),
(28, 28, 1, 'Individual RMI Plan', ' <div class="detail_box">\r\n<ol type="a">\r\n<li><span><span class=''price''>$9.99</span> for Individual app with up to 5 GB of storage</span></li>\r\n<li><span><span class=''price''>$19.99</span> for individual app with 10 GB of storage</span></li>\r\n<li><span><span class=''price''>$45.99</span> for individual app with 50 GB of storage</span></li>\r\n<li><span><span class=''price''>$95.99</span> for individual app with 100 GB of storage</span></li>\r\n<li><span><span class=''price''>$239.99</span> for individual app with 250 GB of storage</span></li>\r\n<li><span><span class=''price''>$479.99</span> for individual app with 500 GB of storage</span></li>\r\n</ol>\r\n<a href=''https://itunes.apple.com/us/app/register-my-info/id592362077?mt=8'' target=''_blank'' class=''get_started''>Buy Individual RMI Plan App</a>\r\n</div>', ' <div class="detail_box">\r\n<ol type="a">\r\n<li><span><span class=''price''>$9.99</span> for Individual app with up to 5 GB of storage</span></li>\r\n<li><span><span class=''price''>$19.99</span> for individual app with 10 GB of storage</span></li>\r\n<li><span><span class=''price''>$45.99</span> for individual app with 50 GB of storage</span></li>\r\n<li><span><span class=''price''>$95.99</span> for individual app with 100 GB of storage</span></li>\r\n<li><span><span class=''price''>$239.99</span> for individual app with 250 GB of storage</span></li>\r', '', 1360845399, 2),
(29, 29, 1, 'Family RMI Plan', '<div class="detail_box" >\r\n<span class=''price''>Family RMI Plan coming in 2013.</span>\r\n</div>', '<div class="detail_box" >\r\n<span class=''price''>Family RMI Plan coming in 2013.</span>\r\n</div>', '', 1352894463, 2),
(30, 30, 1, 'Business RMI Plan', '<div class="detail_box">\r\n    <ol type="a">\r\n        <li><span>Business Registration Document utilization for RMI integration (please contact RMI customer service for pricing options)</span></li>\r\n        <li><span>Business Product Registration for RMI integration (please contact RMI customer service for pricing options)</span>\r\n            <ol type="i">\r\n                <li>Allows customers to leave feedback</li>\r\n                <li>Allows customers to state if Like or Dislike</li>\r\n                <li>Tweets</li>\r\n                <li>Allows Pins with Pinterest</li>\r\n            </ol>\r\n        </li>\r\n        <li><span>Business Product Warranty Registration for RMI integration (please contact RMI customer service for pricing options)</span></li>\r\n        <li><span>Restaurant Business and Menu Registry (please contact RMI customer service for pricing options)</span>\r\n            <ol type="i">\r\n                <li>Allows user menu browsing and ordering</li>\r\n                <li>Allows Social sharing\r\n                    <ol type="1">\r\n                        <li>Allows customers to state if Like or Dislike</li>\r\n                        <li>Recommend or Not Recommend</li>\r\n                        <li>Tweets</li>\r\n                        <li>Allows Pins with Pinterest</li>\r\n                    </ol>\r\n                </li>\r\n            </ol>\r\n        </li>\r\n        <li><span>Medical Implant Company Implant Patient Registry (please contact RMI customer service for pricing options)</span>\r\n            <ol type="i">\r\n                <li>Orthopedic Implants</li>\r\n                <li>Dental Implants</li>\r\n                <li>Cosmetic Implants</li>\r\n            </ol>\r\n        </li>\r\n        <li><span>Government Agency (please contact RMI customer service for pricing options)</span>\r\n            <ol type="i">\r\n                <li>Driver’s License Registration</li>\r\n                <li>Passport Registration</li>\r\n            </ol>\r\n        </li>\r\n    </ol>\r\n</div>', '<div class="detail_box">\r\n    <ol type="a">\r\n        <li><span>Business Registration Document utilization for RMI integration (please contact RMI customer service for pricing options)</span></li>\r\n        <li><span>Business Product Registration for RMI integration (please contact RMI customer service for pricing options)</span>\r\n            <ol type="i">\r\n                <li>Allows customers to leave feedback</li>\r\n                <li>Allows customers to state if Like or Dislike</li>\r\n                <li>Tweets</li>\r\n                <li>Allows Pins with Pinterest</li>\r\n            </ol>\r', '', 1350467729, 2),
(32, 32, 1, 'Help', '<div class="detail_box" >\r\n<ol type="1">\r\n<li><span>How do I Sign Up for <strong>Register My Info™?</strong></span>\r\n<ol type="a">\r\n<li><span>Click on <strong>Sign Up.</strong></span></li>\r\n<li><span>Enter your First Name, Last Name, Email address and Password.  Confirm your password.</span></li>\r\n<li><span>Click Blue <strong>Sign Up</strong> and you will be registered with Register My Info.</span></li>\r\n</ol>\r\n</li>\r\n<li><span>Once you have signed up for <strong>Register My Info™</strong> what happens next?</strong></span>\r\n<ol type="a">\r\n<li><span>Once you have signed up for Register My Info, you will be greeted with our Welcome to Register My Info greeting page</span></li>\r\n<li><span>Click on blue <strong>Get Started.</strong></span></li>\r\n<li><span>You will now be entered into your <strong>My Account.</strong></span></li>\r\n</ol>\r\n</li>\r\n<li><span>What can I do in <strong>My Account?</strong></span>\r\n<ol type="a">\r\n<li><span>You will have three sections in <strong>My Account:</strong></span></li>\r\n<ol type="i">\r\n<li><strong>My Data Groups</strong></li>\r\n<li><strong>Contacts</strong></li>\r\n<li><strong>Change Password</strong></li>\r\n</ol>\r\n<li><span>You can stay in <strong>My Account</strong> to curate your data, see your contacts, and change your password.</span></li>\r\n</ol>\r\n</li>\r\n<li><span>How can I curate my Identity in <strong>My Data Groups?</strong></span>\r\n<ol type="i">\r\n<li><span>You can curate an infinite amount of your identity into <strong>My Data Groups</strong> ranging from contact info to health history to favorite social media site information.</span></li>\r\n<li><span>In version 1, you can share any of your data groups with any person or business that is registered with <strong>Register My Info™</strong> through the mobile app.</span></li>\r\n<li><span>In version 2, you will be able to also share any of your data groups with any person or business that is registered with <strong>Register My Info™</strong> through our mobile app and website.</span></li>\r\n</ol>\r\n</li>\r\n<li><span>What can I do in <strong>Contacts?</strong></span>\r\n<ol type="a">\r\n<li><span>You can add your contacts through the mobile app.</span></li>\r\n<li><span>You can see all your shared contact groups.</span></li>\r\n<li><span>In version 1, you can share any of your <strong>Contacts</strong> with any person or business that is registered with <strong>Register My Info™</strong> through the mobile app</span></li>\r\n<li><span>In version 2, you will be able to also share any of your <strong>Contacts</strong> with any person or business that is registered with <strong>Register My Info™</strong> through the mobile app and website.</span></li>\r\n</ol>\r\n</li>\r\n<li><span>How can I change my password?</span>\r\n<ol type="a">\r\n<li><span>You can change your password by clicking <strong>My Account.</strong></span></li>\r\n<li><span>You will then see <strong>Change Password.</strong></span></li>\r\n<li><span>Click <strong>Change Password.</strong></span></li>\r\n<li><span>You will be prompted to enter your old password followed by your new password and confirmation of your new password.</span></li>\r\n</ol>\r\n</li>\r\n<li><span>How do I <strong>Share</strong> any of my curated information?</span>\r\n<ol type="a">\r\n<li><span>Open your <strong>Register My Info™ app.</strong></span></li>\r\n<li><span>Click on the <strong>Search tab.</strong></span></li>\r\n<li><span>Enter the email address of the user that you want to share your data.</span></li>\r\n<li><span>A new screen will open up with all of your data groups.</span></li>\r\n<li><span>Click on the group or groups of data that you want to share.</span></li>\r\n<li><span>Click on the <strong>Share button</strong> at the end of the screen.</span></li>\r\n<li><span>You will see a message that asks you to confirm that you want to share your data group(s).</span></li>\r\n<li><span>Go to the Contacts tab and you will now see the user that you shared your data.</span></li>\r\n<li><span>Click on that user under the <strong>“Shared by Me” tab.</strong></span></li>\r\n<li><span>You will then see your <strong>Shared Data groups</strong> listed.</span></li>\r\n</ol>\r\n</li>\r\n<li><span>How do I <strong>Unshare</strong> my curated information?</span>\r\n<ol type="a">\r\n<li><span>Click on the <strong>“Shared by Me”</strong> tab to open any data group.</span></li>\r\n<li><span>You will see <strong>Unshare.</strong></span></li>\r\n<li><span>If you want to unshare any of your data groups from another user, click <strong>Unshare.</strong></span></li>\r\n<li><span>When you click <strong>Unshare</strong>, you will see a message that asks you to confirm that you want to unshare your data group(s).</span></li>\r\n</ol>\r\n</li>\r\n<li><span>How can I contact <strong>Register My Info™?</strong></span>\r\n<ol type="a">\r\n<li><span>Click on <strong>Contact Us</strong> on our website.</span></li>\r\n<li><span>You can contact us through our website, mail, telephone or fax.</span></li>\r\n</ol>\r\n</li>\r\n<li><span>How can I connect with other <strong>Register My Info™<strong> users?</span>\r\n<ol type="a">\r\n<li><span>You can search through our mobile app for other users via their email address.</span></li>\r\n<li><span>Spread the word by liking us on <a href=''https://www.facebook.com/pages/Register-my-info/412264385461530#!/pages/Register-my-info/412264385461530'' target=''_blank''>Facebook.</a></span></li>\r\n<li><span>Spread the word by tweeting about us on <a href=''https://twitter.com/registermyinfo'' target=''_blank''>Twitter.</a></span></li>\r\n<li><span>Pin us on Pinterest.</span></li>\r\n</ol>\r\n</li>\r\n<li><span>I am a business that wants to use <strong>Register My Info™</strong> for clients, patients, and/or customers to allow sharing of user information.  How can <strong>Register My Info™</strong> help us?</span>\r\n<ol type="a">\r\n<li><span><strong>Register My Info™</strong> has an infinite number of ways to help businesses, medical practices, hospitals, restaurants, coffee shops, and many others by allowing users to click on any amount of data to share as needed.</span></li>\r\nHere are a few examples:\r\n<ol type="i">\r\n<li><strong>Physician/Dental offices</strong>:  Allow your patients to check in without filling out any paperwork.\r\n<ol type="1">\r\n<li>Share demographic information</li>\r\n<li>Share health history</li>\r\n<li>Share Financial information</li>\r\n</ol>\r\n</li>\r\n<li><strong>Financial institutions</strong> (i.e. credit card application, mortgage application, and other loan applications):  Allow clients and customers to apply for anything without filling out paperwork.\r\n<ol type="1">\r\n<li>Share demographic information</li>\r\n<li>Share financial information</li>\r\n<li>Share employment information</li>\r\n</ol>\r\n</li>\r\n<li><strong>Insurance</strong> (i.e., insurance applications and insurance maintenance):  Allow clients and customers to apply for anything without filling out paperwork\r\n<ol type="1">\r\n<li>Share demographic information</li>\r\n<li>Share health history</li>\r\n<li>Share financial information</li>\r\n<li>Share employment information</li>\r\n</ol>\r\n</li>\r\n<li><strong>Restaurants, Coffee shops and other food/drink retailers</strong> Allow customers to use their mobile device to view menus, order, and pay for merchandise\r\n<ol type="1">\r\n<li>Share favorites</li>\r\n<li>Pay for merchandise</li>\r\n</ol>\r\n</li>\r\n<li>Warranties/Recalls\r\n<ol type="1">\r\n<li>Allow users to store warranty information</li>\r\n<li>Allow businesses to notify users of warranty expirations, recalls or other purchase related information</li>\r\n</ol>\r\n</li>\r\n<li>Identification Cards\r\n<ol type="1">\r\n<li><strong>Register My Info™</strong> is working toward allowing all of its users the ability to carry a digital copy of their driver’s license and/or passport that is functional and recognized as a legal identification card by individual states and US governments.</li>\r\n<li><strong>Register My Info™</strong> is interested in allowing its users to not have to carry a wallet anymore.</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<li><span><strong>Bottom line</strong> for businesses is to contact <strong>Register My Info™.</strong>  We will help build a business suite that will allow your business to have users share at any level with an infinite number of ways to interact with your patients, clients, customers as well as other businesses.</span></li>\r\n</ol>\r\n</li>\r\n</ol>\r\n</div>', '<div class="detail_box" >\r\n<ol type="1">\r\n<li><span>How do I Sign Up for <strong>Register My Info™?</strong></span>\r\n<ol type="a">\r\n<li><span>Click on <strong>Sign Up.</strong></span></li>\r\n<li><span>Enter your First Name, Last Name, Email address and Password.  Confirm your password.</span></li>\r\n<li><span>Click Blue <strong>Sign Up</strong> and you will be registered with Register My Info.</span></li>\r\n</ol>\r\n</li>\r\n<li><span>Once you have signed up for <strong>Register My Info™</strong> what happens next?</strong></span>\r\n<ol type="a">\r', '', 1352119471, 2);

-- --------------------------------------------------------

--
-- Table structure for table `node_type`
--

CREATE TABLE IF NOT EXISTS `node_type` (
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `help` mediumtext NOT NULL,
  `has_title` tinyint(3) unsigned NOT NULL,
  `title_label` varchar(255) NOT NULL DEFAULT '',
  `has_body` tinyint(3) unsigned NOT NULL,
  `body_label` varchar(255) NOT NULL DEFAULT '',
  `min_word_count` smallint(5) unsigned NOT NULL,
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `modified` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `orig_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `node_type`
--

INSERT INTO `node_type` (`type`, `name`, `module`, `description`, `help`, `has_title`, `title_label`, `has_body`, `body_label`, `min_word_count`, `custom`, `modified`, `locked`, `orig_type`) VALUES
('page', 'Page', 'node', 'A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, 'page'),
('story', 'Story', 'node', 'A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, 'story'),
('webform', 'Webform', 'node', 'Create a new form or questionnaire accessible to users. Submission results and statistics are recorded and accessible to privileged users.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, 'webform');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`pid`, `rid`, `perm`, `tid`) VALUES
(19, 1, 'access site-wide contact form, access datagroup uploaded files, access content', 0),
(20, 2, 'access comments, post comments, post comments without approval, access site-wide contact form, access user contacts, access datagroup uploaded files, access datagroup services, access content, create webform content, delete own webform content, edit own webform content, access all webform results, access own webform results, access own webform submissions, delete all webform submissions, delete own webform submissions, edit all webform submissions, edit own webform submissions', 0);

-- --------------------------------------------------------

--
-- Table structure for table `popdata`
--

CREATE TABLE IF NOT EXISTS `popdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datagroup_id` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `mail` varchar(255) NOT NULL DEFAULT '',
  `created` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `popdata`
--

INSERT INTO `popdata` (`id`, `datagroup_id`, `sid`, `uid`, `mail`, `created`) VALUES
(1, 1, 87, 86, 'edwardtester99@gmail.com', '1344256905'),
(2, 2, 88, 87, 'emilybronte248@gmail.com', '1344256905'),
(3, 3, 89, 88, 'richardtester29@gmail.com', '1344256905'),
(4, 4, 90, 98, 'dsareen@tekyz.com', '1344256905'),
(5, 1, 198, 86, 'edwardtester99@gmail.com', '1347254234'),
(6, 2, 199, 87, 'emilybronte248@gmail.com', '1347254234'),
(7, 3, 200, 88, 'richardtester29@gmail.com', '1347254234'),
(8, 1, 201, 86, 'edwardtester99@gmail.com', '1347254234'),
(9, 1, 202, 86, 'edwardtester99@gmail.com', '1347254234'),
(10, 1, 203, 86, 'edwardtester99@gmail.com', '1347254234'),
(11, 1, 204, 86, 'edwardtester99@gmail.com', '1347254234'),
(12, 1, 205, 86, 'edwardtester99@gmail.com', '1347254234'),
(13, 1, 206, 86, 'edwardtester99@gmail.com', '1347254234'),
(14, 1, 207, 86, 'edwardtester99@gmail.com', '1347254234');

-- --------------------------------------------------------

--
-- Table structure for table `profile_fields`
--

CREATE TABLE IF NOT EXISTS `profile_fields` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `explanation` text,
  `category` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `register` tinyint(4) NOT NULL DEFAULT '0',
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `autocomplete` tinyint(4) NOT NULL DEFAULT '0',
  `options` text,
  PRIMARY KEY (`fid`),
  UNIQUE KEY `name` (`name`),
  KEY `category` (`category`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `profile_fields`
--

INSERT INTO `profile_fields` (`fid`, `title`, `name`, `explanation`, `category`, `page`, `type`, `weight`, `required`, `register`, `visibility`, `autocomplete`, `options`) VALUES
(1, 'First Name', 'profile_first_name', '', 'Personal information', '', 'textfield', 0, 1, 1, 3, 0, ''),
(2, 'Last Name', 'profile_last_name', '', 'Personal information', '', 'textfield', 0, 1, 1, 3, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `profile_values`
--

CREATE TABLE IF NOT EXISTS `profile_values` (
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`uid`,`fid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile_values`
--

INSERT INTO `profile_values` (`fid`, `uid`, `value`) VALUES
(2, 85, 'naseer'),
(1, 85, 'zuhaib'),
(1, 1, 'admin'),
(2, 1, 'admin'),
(2, 100, '1'),
(1, 100, '2'),
(1, 101, 'a'),
(2, 101, 'b'),
(1, 102, 's'),
(2, 102, 's'),
(1, 103, 'a'),
(2, 103, 'a'),
(1, 104, 'x'),
(2, 104, 'y'),
(1, 105, 'test1'),
(2, 105, 'test2'),
(1, 106, 'y'),
(2, 106, 'h'),
(1, 107, 'muhammad'),
(2, 107, 'usman'),
(1, 108, 'Maria'),
(2, 108, 'Test'),
(1, 109, 'frederick'),
(2, 109, 'orville'),
(1, 110, 'Gil'),
(2, 110, 'Ortega'),
(1, 111, 'a'),
(2, 111, 'v'),
(1, 112, 'dfgd'),
(2, 112, 'dgfd'),
(1, 113, 'muhammad '),
(2, 113, 'adnan'),
(1, 114, 'muhammad'),
(2, 114, 'adnan'),
(1, 115, 'Horo'),
(2, 115, 'scope'),
(1, 116, 'Maria'),
(2, 116, 'Travalini'),
(1, 86, 'edward'),
(2, 86, 'test'),
(1, 118, 'Michelle'),
(2, 118, 'Smith'),
(1, 119, 'g'),
(2, 119, 'ortega'),
(1, 120, 'John'),
(2, 120, 'Micheal'),
(1, 121, 'clark'),
(2, 121, 'taylor'),
(1, 122, 'Adrian'),
(2, 122, 'Lancer'),
(1, 123, 'gil'),
(2, 123, 'ortega'),
(2, 125, 'clay'),
(1, 125, 'richard'),
(1, 126, 'lauren '),
(2, 126, 'bennion'),
(1, 127, 'jennifer'),
(2, 127, 'petkov'),
(1, 128, 'olivia'),
(2, 128, 'petkov'),
(1, 129, 'swandi'),
(2, 129, 'sihombing'),
(1, 117, 'Gil'),
(2, 117, 'Ortega'),
(1, 124, 'kerem'),
(2, 124, 'kerem'),
(1, 130, 'gigel'),
(2, 130, 'bumbaru'),
(1, 131, 'steffen'),
(2, 131, 'plein'),
(1, 132, 'paul'),
(2, 132, 'van der westhuis'),
(1, 133, 'wawa'),
(2, 133, 'wawa'),
(1, 134, 'margot'),
(2, 134, 'blumenthal'),
(1, 135, 'jane'),
(2, 135, 'jansson'),
(1, 136, 'maria'),
(2, 136, 'mccoy'),
(1, 137, 'shirish'),
(2, 137, 'bhakta'),
(1, 138, 'amy'),
(2, 138, 'ross'),
(1, 139, 'vpudazey1970'),
(2, 139, 'vpudazey1970'),
(1, 140, 'jodie'),
(2, 140, 'taylor'),
(1, 141, 'jim'),
(2, 141, 'scheller'),
(1, 142, 'mia'),
(2, 142, 'garcia'),
(1, 143, 'claude'),
(2, 143, 'beaudet'),
(1, 144, 'xwurageia88'),
(2, 144, 'xwurageia88');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`rid`, `name`) VALUES
(1, 'anonymous user'),
(2, 'authenticated user');

-- --------------------------------------------------------

--
-- Table structure for table `search_dataset`
--

CREATE TABLE IF NOT EXISTS `search_dataset` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `data` longtext NOT NULL,
  `reindex` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `sid_type` (`sid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `search_index`
--

CREATE TABLE IF NOT EXISTS `search_index` (
  `word` varchar(50) NOT NULL DEFAULT '',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `score` float DEFAULT NULL,
  UNIQUE KEY `word_sid_type` (`word`,`sid`,`type`),
  KEY `sid_type` (`sid`,`type`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `search_node_links`
--

CREATE TABLE IF NOT EXISTS `search_node_links` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `caption` longtext,
  PRIMARY KEY (`sid`,`type`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `search_total`
--

CREATE TABLE IF NOT EXISTS `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '',
  `count` float DEFAULT NULL,
  PRIMARY KEY (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `semaphore`
--

CREATE TABLE IF NOT EXISTS `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `expire` double NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `uid` int(10) unsigned NOT NULL,
  `sid` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `cache` int(11) NOT NULL DEFAULT '0',
  `session` longtext,
  PRIMARY KEY (`sid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`uid`, `sid`, `hostname`, `timestamp`, `cache`, `session`) VALUES
(123, '8p8n6ias0u713bi58l74adkoo6', '68.99.248.165', 1361198796, 0, 'AsjOQxJj-M-RVnvq2ZV3H0ADAueaPcpVxcUQkFztqLtiR9L6OskeAUiNeLHLGE1rOmCAo4cS2AZh8bsbBvXqVtW8NBMXm9LrZBhD8PIUxxw.'),
(1, 'm7en7qsh4q6he4solo916l4q67', '98.14.232.45', 1361040513, 0, '98gT5mY1-4w-3Ae97ZvctyAcHRIVt0dzttdeT-z-B2u92WdWfZfhvVpl1cSpki8uGbcapykiPz4fdnHOvIXKdnKO_aQMpvkBZephAGtNysov9Pozfr_0jYB0_OsN78SHf7tUXHXJ9uRptPU16_J9SulcWaHvofj1AYOltD6UDzkj4dsz802YkTMmz5IxLXLzIbsjZVbGzY1fxUd0egcVwV7Od3zcMpWSx_emi0b1CJw-p1Vgr7oS2sCGWSqT-UwfRHp1pXeSAKp0tKYINnYVzotvAg0eLsRc5z2XkoViKljZ4Y4dy_2VlMqfS3sb0OBia3Hsmvcea9bY2wZ8UiYnoJrENnTr-1u2HfHZZZCuJhqNsAAmZTrKBaeN_Sy8lyYeiJ5oCMnwQHulaxPmFwm9epBxVm0nHP99cdFwJptAcR_vqwoBLOht42Lbgs3XKgfZf_Sb-dgVCAvdJuPkFDNaZ34XI6TRPkcutGkvL5-_GDuf45bMXL0vJbOwv5U7InvEXs3d4M8wdkRDYmFN_GSkrr_AdY73gJzgQlQywpLiTZ13mYdb8M-4YgmGjpce3GOahRq9q-zVd-nuNBccIUWzpiALCMjuojhQsFla7ME9XjTQuOwxybUTsHiYMkkY5GyNT3YXI-hQjOZzuPHE-feTe53ifb8NdcPiQfKIc0pPAeGjOASGPn4mlEHDAMHdb2zA-8gOW3r6aqes7ooRtlmxPMW46eiEnVAlKEBk-b2cRtUS9SI5lOpprVuTKRqz8EsatC4k4hLZmeRMgu9AnWvqNFUUaI6fJB1Qs7YMvVcwmk2ZV_-C9YV7IQNLp4y5Z5YDpK7GRVbCeCccpMd1_yqpZEAqp-JW-R9_WaDDxfPKfvQQ1YFjNr9A8DUGnbCIFl-eGQhgAT-6CQE6vXG4DRKITtTyX-VXmql4JnQaCC9cAV6BCQlMj3q2TXSsKWqLrM770zbyW4sAxeU26nSa0VZj7un2c4XL1nKup6PdBcvNJWUYHhWukBu8GAHGhALe8_r-0wPE91wqbsGQsSyJ9edLhJ1pmzJW7on2cZq7-2R1SG_d0I65AZLFZgdCLJYE3b4EDc82lbn-8rky9iGV3sX9x57cOHaIX6P9tTabV6_qmBQjtKL2F38vaylt3U3uDkWJuEDzWMCzOUPSelx57HcYi22upfuS-thuzZ9sSJVeOOiSniz_doaD0a3IoAODr7rkHnyHon3cRxlZD9dew0KZaNsjRgWdfGWOtiCJ9MXcbqFqQmsSzMD-2GIxHWhLdJYwpwHmyS33zwk1LNPBjlDwwT6O3mFNGhMIyKUgiBXm5H1q_DofE_y4YDeXhCj50CMd56Of2Aaqej3NA_Ao5KY6q8-8dq_jtlC6sFyXSZ2xkZp_ED0CHzyi5Xmx87vIZ-9VGlOZUuLh2U7lxW7aaYUP-7QtWBl5U42x4ieMM1L5zAP76XEEvcSHSgcCTxO_fOFCmpDd9OCvrD2A5Fx7vl9cL1iZs5_6dqgRIs0hZ0N27lcBOrVZ5OezaPUzmBrgX_Jz6zDCwzLCmL4HaIH52AzsADUtjxuQolcPgPt8Uk0DnxMJi01_CkPaSqRxo6qDHIfAgq_hdd0PkoJLHE53nMaDjTbpJ6jYIjLJSiwzfcREFrOKcaz4-8YHFU1GLy6zV5w7aq8NmCcbnX05KkL1pRlmm7rljHVZNinOrFor7jwnem5ot4gPWD65Vi97uSAj5eOG-0cuz3v3UCM5e0vi5Gt0YAy72RAhL3xb7RcO48EXnyvGI-lJeT4HWy_jJkysODjc-RUSFF2R8OYUBmGNewY0aFp_2QLIdxcEzP4GBLxvBR7FTmDyC0sfTw_X7-zgWFDpuqo6GDaUMeFxSbBu6xstaltlVuY5R_n5tPLodIgjCpVWaUUppvQuYWcLDfOadQ1c5tgqWm8HA3SpHGvZRiPN3V-FLJOQ1ldeGODZzzD0q5OKFOkVLFO_mmxHjjf7bcCXngTya7M_6C0fcj2Cd8ErxRsDcZe7Z-m_RJqqsz5UaWiDOqrzVPxlBdJMTMmBSDxXGjfjlJ3w-ObYLhniPX-k3ZJlkDifOXLYaqypSaaDsEGtmIe4-Ei_YuUyjEW1kHacqxaepyZsP_2gSrnI1CXtGXmDwRBUDCAjSIKIML6XkLs4MfWhFgdmJe_cmLx0VHFF2-DVoxdQQJOA9g5ypRqKA8ESfYz8MyRT3JLKxH2tQUaS-jXm8URL_KZARzdxKF_VW2Bgcuyb7FmJa4C6aYQ48yIZDck99rEC7gCpRMtAn2kLoGpecmtBa2jlFP6MTKCqr8OTsJ9V_rPwaTp1kROZZFF0K-q-8d3mS94bQv4J6TZGAi3QpMP_kGOA9IlIKZkGlnmH-yxyWeRIoPACj0JDj8uCqoAx__b-mSsLW1U0CP5FiHoGF144QxdBQETxc2__6p8NAKzRBVDjlhl0SD8FN525X2j2hP-mxGKu5PTyUWUmP0huyWksFSp2sCWbtUo_RrPMIGixXq5vXjp3GHFnviq7IyI3nzT6Yu-BRV6DbJ3Xv3UL2I_oAa7m-F2LUQyYMq8bQyrmjKCt1hfc1veIGenrxAMoTcFReQMDUY14lS7TegAb8NZ3Jh_JBwnMMeOyYXM6vDBLM9XXMFGdqkalZZUWQLd2kE3rnTU0OgZOn2A.'),
(0, 'b1cnhimkj3cidjnm356e9fgs25', '204.232.241.170', 1361201329, 0, ''),
(0, 'qigarpgjpur7sal9o7isdhbes0', '173.203.158.187', 1361201526, 0, ''),
(1, 'evo4je31c40qi65du2t36erh03', '166.137.151.212', 1361231317, 0, '0IK0scR3AEdVH5t8mRE0VDsJYI-CKgzF7LDi-4o2J2l0y6uXWsRBpvQYj6ggOtLvzN77YmIusdaQhwnn1YkGfrOWB9_DlwFpJsZY-CmAw0QrvmjysRn7kfWAdQLqBa8Az46CxcJM9DY4UYVr7oVcugDzIb3FLvVPQ6AQ7IfywVGED3eEfm8HiAG7oMqwbwKkM_gLc9gpcT9sDBgvjPm7WMwjawADwOCJMwsTzVuzkez31T5BpPHFMAF40wgIhMu9p_Du8Pkcm_wtpQgO4PaRDi0c3SKWedAe8FLhc-gYKbk9nNSr8zRoWw1TAM9wN2MzUTmKwJxJi6ztFnpbEacr2jmVo7tYIHzQUttiQIdRMfK7M29Up7qd-MZmhYClwVZjKRFU1_OxWiZ5Vw4DbZhCSU2nPaV8q7F3A2uYgKglRjDzwwLtMevcyDBUm3V8O3otQ0ZAulCAnfxICNcPhFutBhLtr2rpA4H8VZans6QBGb_7zqa0k0ypFZHEzGb8NfHLI62xN15QIjfmGDaoJ5Q_0LTWhWO4rpUACMNWS0bevPe21CBF9eX8vES116m4RWI4BRUjq3M3eGr9tmHPPAQX0Z4eBkI0GWSj66UM5cjiuFU8YpVFtFlazjaKWzQyvkNevVkSZskb6UhVIztO3unaebDB5ODvQY7zsKHIbF8qvwGZjdnaGAmJ-YY7bo2AJWQyI5IOJy2ozeVcTyuYUDt4B3RVLZu5sm2v4b14WnGdz6mggZebylnvXXahzXyLCd5L3Mtnm12ep-lMsjVbeZhNkjSLVWEPAR1ZEhzLnQBY2xzb6r3iSdJkad2QSG26MdTylqjKn0HELgBM962hfQEh8CNZZ7felOg6luEGD6tSYVXwBVkzvBa7kvsZBUnv37J1lDXeOIQx40ixEG7k5-RYwEFp8bifWbmLDDtOrYKlTJchHghqAgyVVV3kWVmRNVHJs5HYB4SKV3gzLbJfQkE0SpiZ8zLsLimPXcUS1_cg3jzjTVicUVHj_A4IaXD-5JdwAP1BWjYMLUgNGsl00q2NKm0v4dd2uh5vL762SO4RKhvoKvnr3llWupOeKj9pPtAAPSRk6uZPjG5tRmaYUYPyw-I5YCyn6uFvjMEMfrLwp9mKw8OXUANq01SJQ7Xe2pH7BV_nuAnq_UkYPUy0lJTa04sov_SOLqneeJ5_bHRMxHtrOfJ7eZKTI3DFLMYCONN7uDGK3gPYq_pKw8f-Opy3w2BQqlS_-8EMupWwcSWoMwEmWJQuNxRn_mojANhcUrsi_A0QNaeaLJv8p06dfMgyXe4Ih_Z4_D43UluVlWTquaPQXTIYiIi_YkSCOtnuT9alY6y1XPpejqQR1TTAP-waishT7wIletzQsOqKRx2ncReGxYyTIM4o-T-YMPGO_j_IdQkmx2bS8y4W4dYnUoEh0yilX8iGDXPN6TGyOhpPywXFyTnqnnIYt8tOVaJlBziPwrvDTJhRzdXfW4MB_vUluXaS_ciQ8BrboAAxTx_0tBDTyM2rlKUjVhnvDM1bRIECTQ2-eNCRzgzmuJOCosWyNxYS80dd3-UbzljtiToQtrxF6yS2kQksYNDLCFVaOqnRbCumInshM_oeTevDlzbuQz8Do3kEgYjHyVJcpiLQCYJsoWRz3YGkOPSvyf6wsJFA27cEExtNBldM7u2pJf8g6j6Wx66kIFGWgTnA7GLmbzWfcWzxL_6ztegjOB0qHKSDP1y4rbj4nxJ2TOuQYDURIvbsmgPf5gaFWim8pJs0KwsdngRCYep1zqxk3ujf9BtOlEf27JV8Fc3t5u0-NowbbqRPS7SYQjxALmgwIVptk69FfyXfXKzRtql5kjkf8HF7r8sIWC5mCiUnxqKhRzKv8qdoPdRM4aejilo7Z-JoaQq0SeId7qfTfWZMiGU3IYCaoIM5BnjmEsATtIQ4jpZEPgJu7uQMlqR3qPyq7wpLaeUBUnCblp0MaHnIxIIeVzHhofuoCrlUsyRGNs2lZHoKiFntGCigTnzMVqNwi6bzlagDhm0ho_-e-xNsAkV3rZh4Nyunfw2LP6NQiX6lt9-NCmbymL5Vm51BuuXgGdl21DDJXgbigVWT80qd4CsDX78l6YXNJ_Ll6ZeNapTytV2i0FlSCTCnjMXj0nHK2Q9nFmGYEjAJclXE7z00VQd-0B68d9OY1V1OYjD1HfMwgRAdT_FAUgC-xWLbWIlyfIQYSoAeoJAAVJ5zQVcyqoSs9HfPnztXSPANGGudniIpjGBMlehP7dvjL-jnWFCVWX_kXbKVXD7MdMCSALyR9QcFk6LL6Pwe96S0hfZnb90F7Bwn8OMukSDQ_kd4TqgyahDgllPaSh_0xo3u-DR0VUbnYBX6wPyRZ17W_x24ZqLtbK6BqhlyXwMpPYJ2qtL9fvy63Z9NVGrbxtmN-uPH8a6zp2F-4UsB-pihTI_ukVQlLcUuog..'),
(0, 'v3gutgp4629g3iqmpa06g80d70', '166.137.151.212', 1361231317, 0, ''),
(0, 'mdkja1aj9pkg0n6n1gkktmv281', '176.9.112.16', 1361287290, 0, ''),
(0, 'me066efpmeko8j1hvd1i5hpns0', '176.9.112.15', 1361287315, 0, ''),
(0, 'n3m4m9go2v1etgc54kg0p5gq77', '166.137.148.188', 1361301698, 0, ''),
(0, 'cs5ej7r2mm3kp67ovhr3ttqm04', '68.99.248.165', 1361411063, 0, ''),
(1, 'cp0l02qbtdpvjarheuq32pom77', '115.186.146.97', 1361347029, 0, 'ROFmJFk3H47fBwhG8X-LdElEdrNQetaIozYqPgHgp62pS1Gjflg05pB67Pz9DI6V-jvSNCUWAK-m6ie9unagljwvoZNkWKJL7rOj5iILBpk.'),
(1, '2nj92u9fenp0bl2etub4a0cas3', '115.186.146.97', 1361347260, 0, 'ROFmJFk3H47fBwhG8X-LdElEdrNQetaIozYqPgHgp62pS1Gjflg05pB67Pz9DI6V-jvSNCUWAK-m6ie9unagljwvoZNkWKJL7rOj5iILBpk.'),
(0, 'b1vf0jf5fgree5iefn6rdhl916', '176.9.100.70', 1361349941, 0, ''),
(0, '4g7e7f17pavdk71j19jkruqc24', '176.9.100.73', 1361350063, 0, ''),
(1, 'leag5516a3alki6qjrbl20vc24', '115.186.146.97', 1361356920, 0, 'ROFmJFk3H47fBwhG8X-LdElEdrNQetaIozYqPgHgp62pS1Gjflg05pB67Pz9DI6V-jvSNCUWAK-m6ie9unagljwvoZNkWKJL7rOj5iILBpk.'),
(0, '863bfe8toi39r0fdhmlr0iuck7', '115.186.146.97', 1361360102, 0, ''),
(1, 'r2b4u9phhf5qr97de2qpr7tgh2', '76.103.171.32', 1361410330, 0, 'sMKLu9X6Md5H6zgDeSNu3oJKqHwOHAhny1VHXWq8NsDRYBKreuDpBzmv9GjwiiYqW3VkzFHqabzPbJ9P_Rjmp_lHG_jostjG5lClD0PJV6RfRhP3GpT85KYq7XJ9lzsHTpqbvtz0cKo4FGvKWfnPtZmX0bJXlwIlBeLPaqR824yUN5KAlPZe3_v6eUG4u5GwPVogmAy8zBG2bukpuDWWd1P-0uFIoEkGDAIZB_3Hlb-L2d4U4touPwIx81x5gy02f1-ebMDhnL9xlSnqzfOoBz_Y1WNUcd4ghwmHxZDuGOFvnHLmUHY8csGE9n8dG1xMK9wemZZXcKm679bWmb2I5jVNoDyUVj7WuLRJirmd4P2GMQND_vZ10c2yH0Qd7Ckz8PRUrALQVk6Bum0uaaQlXKUGhUeUcPUJRkRUlydu8YiTChOaKB9Hr6kD-OxWJzCm_pbxt86gawKyXlhvxhWAF7UJxIvQxvSVVQ7c8d9R-8ZqqLqxxDzi-Pwv1Wt5gjRKwF1e_xT4u-wT0etQg8eLVN-CI5O5azpPo0tno-AkQnZ2sneJe27tiFYWRvT5XFsmAYIL7VhhLtgcRpOv-YDOUX-Wd1u7M94R8wXXVRZJujVAAsQk5uva3Zy32W26R5sw_TaMwf7c8bx5iucWFWh2yCNq5OhUIcC2vJr6pB9VTUfAAjUY2csMsXrQ6LBxDrQLT8GNHW09ANoVAooVDImlYw6x-g6vx2u4gHoF0157GrQbnlWn64izs5GCXFtg-Tu-9nlwDL8ga_8jF6_HXVUlN0XhW8kWK0n045EdKuykn_-WQAcIF1aVipJwCoOwC_cMjrAKLO3JFyHWs9eNg4hqxEdyG_lJIge-C68wcs7PZnZeTBlOsAAqe14QSw0IuPoKyKGU1215PSF9soK7x2pBCondVB5DdtAweCINjKECQ6y3gLecLMl1J2iX-LyL6flSr4nT8e1sDSrkFhgEQ3rU4jJ60kfcYrVdp4X1al9pMzCXU8FQlY-Ix-LbANaYrI-GTsaWuEjweTGjNg8_G5p4Do3tL0a1MZQxJzVZRw8J3xw65jwJMjgtRL9CckQn3gyJwf2kP836QYGapdRtXJCsNt83zwA2SnAgI7NAuOKTBjACt3MIau08zBSZrXsG5q1cj4ew0YgKYSLbbe551UGenXRdLgjLkt-DqViA7WbAYvNCyyrTZB9yTT_qxetf_uClR8JjSkP_wkBdYEX2diUqZ1P0p6N3TKFXw1s-dZ8jewlTuh83AH15jgDRkLWFJTKEjhH7T5YNiPw5JSmtYqaUydpLfsXd4GAuxWWJy7-2LXx5SRoWbNn5Nbfqp-NfB5HznyjjqIYfdIi__chnxbjSJHRlKDxraxmnWzRnmld_1b7e4uuxMpRZaFUt3BBPrscz-TfBt0rLhQSnSljwkEdHg_8xSs8PQYBAjSNB7NGWp4epw9jdKuSQkhJovtLIkfv5VmiN4uopohARoPAp-m9_I0xSRqwc3Kcm_hE-eqtpam0pmYhkeUeZlBsziGGmxnTfCpzJKe2U9Elew2lalH1fV924iCdaBhT9BG1m2_lNyRpLjKAR4LkbIQvOWY2mI5SPyOjMBxXmC50wWjN05DkyQ8UHzsqcMysLhusNCqlfFBddmNSieTZZ9sf67iMrQ0paMiTFWq_iPyK-Vygi_2HbNen19ExWKAGRM3Q0ZHTW4Ssq64B77foOoJV5KQEHMmkAAEX_efWpOWdUYM7g40tHoIB1CGeC2wjQGLslT-SaW1VPE1tI_CA2rHck_zU3Ekj-Ay2LHPc-loU32UiYpx1OWCIPKokWknm3xaO5PZxuLTLooinKMopW7SucDj5Pvy85zSTxOeeDlSXARRlEqiOHb2Um2yLWSAkCMj_IxbpqH_JfjEebizsK3HL3njcHPsq59jpNcmKEHOP_tb_3IS5KvG1UnQAhrt1SZWsUkUkfwG51k_aW4KRtRng1rHGLycfGOYriUo60YrbVEOnBsnFEo8znNtBffl5Isec4McfIFQQ6qTr4PmNFnttzViztksKGH852Hgi_rqe0dsZ3YFkDziMU5kO42yr-4hdV2bkeK70rLHd5K4cNFW1BHI8jUWFuIfh7z2jmVRYQC5kw-gSpmeRmuc40_SjAhQu3vJyj5p0NYhF9fN_KZJ9iZhccPmjyXIM-STSdEyxprNZJYMpKurepH2XxROYhFzEvT6nmKU86na_VCr00bppo4z0Ulcd_UNGQlK1EF5y2CNCg8YVzhyZmTB-ePkV6fJM5m7w14ydkaohUGAwr6u0HVuMFI5-P3XnQtyjz1UBuF0srHGosJfjfkG6Zn4UkUydlBPisHyXdZa0MyOMktnoXtAHKWbVxnEE_oZ53gH0hNy827Q9Li2nPddLShmSz73qJVjyAOPJplSZFgYRebHuA9Mfk7YlAsKbLqk3m5qs_AB1hz3yOUw..'),
(0, 'ifj039fpgacp2n7ror85thd9h7', '76.103.171.32', 1361410163, 0, ''),
(1, 'bjiao3bu9irl04bjsr9cl2s8g7', '115.186.146.97', 1361428226, 0, ''),
(0, '0bc8kuq1786k23qjeml35lnnk2', '204.232.241.169', 1361028194, 0, ''),
(0, 'e18aef8qu98asbdjhc4i48e4q6', '173.203.158.189', 1361028368, 0, ''),
(102, '19aka1926evrcrk3sep1rnr945', '115.186.130.30', 1361352311, 0, 'obvXTFngP-EkdCUpYKfuYBG_t-RQoJxZWqR48p3roF_2uM2M6LKIvdErEkcYDprVH9aurRFhS-vG-u8G7UhohRmuRpIs35dLTVmE8VestHc.'),
(1, 'omop158ifi7b9hgu1vh9espfv7', '81.98.142.33', 1361192410, 0, 'TzqqfTf0g2Z_DueFVZITTWUVmyq0XqqNZouH9AQUVEzZR_9LGvNn5mag4OHSZPFhzDy7KMDejJFQaTK_w4xFKjrG3O1Q5ISryy-7r6hn4qpWPvE6EpF_daoypJ08rALn9ohPBh37psZ8Pe_q-zJRGsqgMMB1N7oTWgp3KOhPLe40CERvY0GgtcwtCt5sCjXqc9vMADOuIwCwV-4Bt70J4mXFIbTTRlgsN_MyVqVsYHu4sgtRveIkFWAplsOcSn3DGXwUqXOeAp_ocD8Fda7bBIQKDEe6lR1Lay_gCb-xAXtCL7SeFy4HkzePpoIbOE82PerHiRdbGCB2xZLbQ9vt9fdsD4vaIlWVIvQo6XT0QYWavixV1Q8oAOJj22uZnLwjgH31kgvInoK4A89F19Dr6iIFMj_eaJZC3-T6wD2IlMtarkkrJuFkx6C_jvq3gmwktBbjr3DVoCClLSFoF_O2toh077BS_rYQRNncdKyXgPWL4wCQY4IutpOjL9sgjL8vqIAvnX5WzVSZh1NwUdH-HmTGR24_zGWKFXLkY3FOfELXSRCGmauKZOpFT1k_0NK7VfFpDdn0rxUzdukuDUad1FcKsA9_sAGsDF0MT_Jp_eAByZGFLQM07BHMb3auh9GagzErvQTaPBOxDHsbvTo8VuGV0bojmZfzG4xa6e-xWOzUDkCNnM6CdsO7S2z4F-lPj5bMKGfZ7Zbto7IPVfPpwnK9YhHL3CA6DibdcxrENSKOH8DmxND4DjDJthA32eAI1ENLtxDyYxwIc33WiUnH05XGhZUAPcjr-HoEC7_j-VhU5CnaiSSwdNEGpYWVwdeGnkQRIdc1Q-UJNoAwkRdpOt7fPduEv4Qz192jbrwcFEZphQAUgJfdUQyujJ2MLTTwhNVA5FDYXGvgeFZfHdI5rxwESr3GtPl1aPA8878m5k0uM1ul-aW5dArGUkyUV_JrvPFGSnL3_wTap8IYIDnuAHaH3IG5Y5BXIwTDFp8U3M4DfTDN26KABJUF0Cpkc8ku20AqVGKv_pWoVHp0XLGVU8DOdG2cXU9v-NTTMOfsrNucowtOHNB-T3vrHJXidFyyv6akEIyDLa8AMtiZLxrqb00bhyJ7wkv1D0p4DVizkrIjEkOfGotu7S0Jvp7d7QK60kr1OKQ_AKkUWTD56ny12Z9eVp0brC8G_EaAW_S4voQZZOX0ede5nvJUsA8mzXs42jetktrOibxU6M4J4XJJ6GED5qHCi0Oyw6z7WUFTF4tMDEqWXO_myhRBOhL_PIn9VzvGoMhowtBEJq137gCJX8ldZGVE0JihUdSShRMMzy225PxMAY9JtVLquQiBSZx2lJCthRlZGXmrSJFQTnh7WvFftBbBSr7frN2Xu0Q8yceZRgLLeuFnyKejHll2QlHHchRBdOqu0jZOXKG63VI6q4-Ec6NiLfDb2hZTXNbjmXpZBouN1sE0Yp6x0sSrJzxRyMHK76bTFMTlrXP6pROAFuEHccGO_hN9Eq8Bj4p7_5MN7c8h0wYV-xF2Jym0GYa8GDEe8Cnb0a5-JX3c-cTlOApM7jpkk6OmZgi_gdPificWW03mMekO4Y4UrFaDTSNi-uVD_tFFfEwjN38RCOoiV7tdpLote0G29QDEI-m1fzW_ehghxmSuNn55Q13el1SLXbeoFFCQzKvDa2E99c2Sx8QWmd2UgESBDhVqbpKP1BW4deTfswp_ILffl36zt82cco0O4MF12yL7811ngL6oyCOuCWopmn7SjdgVrFgRWRdtCLGpjYBv3jzWbUNcOgl_R0M8PH26wE8bC8-LkMAZ2bSZoLEEkYhLlou9zYcio15uVP4LyU-S8D0_79kCvMMW8qncSymJdXvRfGCJBfGVaHUcrD4ZEyiaoHEWRgD8mgRKwicppyoRwWMgpRv4RakAIrsQYjgeho2HhF1GxW4RRBQvRWdQsjliy29a8CWe9p3Dui1ESJMUNMp9nGS_4W2d9K1oS6dQRRoT1ZNKQkaVcFdqistO7NmeHcA_hHF06j0nbo-Zug4oBQPrUMAlw2yJzO66PG8RZ3cz13e7QNRFtOwUD7T_T_eEu3C3x9JbK00ZHAeNstCbdGtDFNFY6AX6Lmny-_lBaX4L7ew7h7ZOI8rsphQ9bJB4vee2UhdAipmncCRXIzu4neAw9LGHjEUGCau6e46eYqhAg4xzfQ7LB17BnvQTyTPwMihxNLR4Gse5nfZQoeAhNnF4Rigke67UrTiYAjMkuQ_mgcanxAlfsqKBFd16ieSfOPbgkhdVslvrVNOu0qbbCDCwvPnVRTIF5bgEYF_31FQZgC8SejeMLQeta-VKA5Yh38LBT1t-CnAZy4ZfjvA6AQMbif7vn61a9-K-UieIoPR_DysLDy4K6UD-rK8i0LAp3pLpianuFuyOCI3sD7S01cP5-_YCJ8FndYLb2gK0mMaOImwctriavQ..'),
(0, 'jc10aqh2cldri60vk07d9smg37', '176.9.100.69', 1361090094, 0, ''),
(0, 'dvr2nk2o4v790qjkrt12lj9um2', '176.9.100.75', 1361090238, 0, ''),
(1, '99o71h9mbc11p4he7fui1eq6h4', '92.239.138.133', 1361119633, 0, 'y6cP279bxxn83suofRNGI11-R9i4NRTnwoliKEjizCIkNlfYbfXRvr2lC7K4j9yxfMdiXVAC1q7gYG8ZlyjtJUEmwFXesvURWnYbYrfO_V_ZcSKxLppvJ-4uDEUejSPvGWbopbSmnNNj9j1TLCKDOKfYsYgjpfcwUTIqb5e6yRLCvM1-Zw2Lf8AZ_etQG5wK1k7EcqfxmhtvVLKB_4j1P7SXy7ydAS7kWi0GqseXXWgWQsZy6bI3LOZAGkw7ECvhKPhZ8BCLlS1NyLRWfCm21V7WlJnNTfKEw32trT4e18G7IM_u42goFqMKTkWaItrO2coxr3F6XtEJ8YkD8AMiTpATSebH8gUcmkjAOOuxtN-3VFYrzNnyIsG4NwRc6amjyHolF44wOuFUGHx-Ny26shF_UkeXMBxnVxT1DfQzfxczVCeZIOlCwmL0RYx5YI3MbH4XHKUF7EsrFOhNtJLxTWkfIgXs23KR6srPil5LIzwjnDAjRJ5VbXhevYalLNpvIsdnBgW0q2z6IotUperSKD4fhg5huxS-Cmn9rg7jMkkLKNhoRqMnZPpmBOTyqBK3xKJPMcNapHEb96tS4A_kp0Oz3PPERTW4GUMJLCUUSI5O_LfNd7B6emF5qDHmdZfK_L3TfDlA5Vei1CodzlHwI-A3KvEZ_9KokQtPbfjgwFVKvEQquWev9NlAQVj6rOY9_8JAFoSiTSYBQGPPq7L2Ncoks94lziGSktzxBcCyuHG13fzD_lq1uRdAaVLDgB8azWRZdtUQjOCzS5giTXpLpb-0lc21VL1v8PWAAXI1DW_oWNm5IcC5F3IY4UzrBICKOD_vDIotzt2EjVSImhOzxn5MTZg68TNoquNgmpoWsOIm7QaD2QQIdgQQkjsiYkzZYqh0OHfWTn1XhNnMP6y4_pkFzGoZlQ0EBjKkdTlj6_mLJq3jDWMGDjV6A4FmDDUH7Rns4ud8A7tMZSrfIb8g1Gxm-jvHQWPOwahfq9o-gjH9f6NdfPE8NEn-ZERtLaCX-JXYpYWeDpW777XgKkBMUqDgOIABe2fWmTgG03BZXiwgESkxPa0wPFi33ZPPbfoX7JU_SiMs0SdOllZBZOfstTkZ9FE8B_HP7UuEkqnlcBVezGFDRnaQuk3frMn9REKAHI2X-WyUCJYMcJdxjyXDW1wly2_ZIsFe_Asgdo1PBd-bqtHr6WhvM4OJcd3EY9CMPnnihQc0gyu3DWh9l6HQXwgTofZJYS35DbsbCFRtUsX2KwXR4ybtJsXgQeoXm68ZnLNaKbA5EDfYVQouZDBBPMyMjWIacAiSMN21oVZfpiqNQsCdVVeLdvYmiHl8nNyTDICFkHekhu5RfhMgbM847hEyY753oLjIkvHTbIvtk-68EXp1hahziaKyjs81U1NEQBvmpCukTojUQBot5_ZauQTHw1xGkK2NwcuT1CLYOIJPwvHs_EiisQJ1cgGotNDrswl1rTG6xS6HZSDhleHi_jOs2SGSmDWQRA2LLRS8Pv5shTcdD96tpZ9L_ikAh-_G_pCBMRHjQNWPHKiezs9QRndvGbgD-iMheGmDqi1yu8nz8rqJKpubH7vYTaNyG30p3_i3OT_6cyFPsR-dRU5dgTBjRAEPHxiLTq-IcNQFsYiWjJjBky782T2CX4rb4PLeCuaOeCw9MrLTKmNKSsWOglcwNfkUSwD2fGoC2Kn93qAkKeDvClDzytUJpm4uvv3hjwBymDlOS9390BBxCQMQdaxtes-BLTNT5TEyC5X9hQ6FNQeDBTaZsDmwsUIwTGJSy17HJMJuh8-IZqeKQHvgBs1cJ7HlMoNmfI_vbEQdX4A5i8t4O7TGscgp0O7fd7504wcCJlYsEnfNthW-A9CJjdr683121RI4H4CDhivg60x_JOzWfGIbiqF2E3GI0Ww0iYOvbOb8a5tUr3UzFy04BRAo7-7-NDEIX-t8X9JbyGO4juVfDYLVdhR_MxIzkehk6DvM5Jglu5_OLVfLPuNjOxsLSmvNk2sDPacNVkikq7qSk9zHyZ4iSmrhXDOojK_yy2YROXNOBhETUAjJFH_QgmBK1gqO_geoYh4sCNf4kMXhyFpsXY4xJT8uxLwOGVtWpC1HU57hfZBKN5HwlwIgV3cdgCRLeiKblxhWNqXRwvBEJ-FpBFTS2gQZLIL2O0LZi-7_75C3mPCLhQlOgWzsTlBoAIgXRci0ewntJVEt4ycIHrCzYJnYCgTBp7GHP9aLd8lPPy4G2QbeH9RomIoXZVhVQJQg0pmaoM3y-CiWeV2cj_qoIdZCuWYl5A7HE35UpbDAqpgRdk2rh3YqGqqcic_SZZI7UFVb51JQDBqErrb2B3DMVfPYjrXkp6PL5JPahvo75w1aCaC-thh4gvUtTR0JIJiKz0EGWQrq-jfW5EOC2Ki0S5l29UERNdaDzgmH8jpGdSEtHdwGKi3VbSTXYg..'),
(1, 'c6pm4nb6kekv3kc98uh817ltv1', '70.83.58.4', 1361379146, 0, '1q63F8FOrUZUF9NAo_O1neqKnddz1hnRCtfogPOe_TEodUmo6gLqZXqlwMulg9_80v-LZgoIpTy4BZDKWj6BV5VRikdhyPcEClNeB80PN1nhrSr_NqIUFjo_CunyanjSJRFEZWhHf5hSbPZKhpjPbJg9NJkTcMX4y_JcmO11kJ7OOzqhdYl8Y-wAmWg36GHYI7d7mz_LoHkVYpCypje19Blqq8GNQgROPlETlDjYP0pqvKGcMIlZfNypV_V3_TyOg4qHMAXsjkr5HAY5sxidH5D5KXLVBKBHmgo1Qa6u1JQNge7gXmXvwq3sSra6FxJi6ocwokVO4s97Dhu9Ql20c_ZeVzJY1JvnJIVoe24B86OrEsdWHdMSfKVuYW9as-DtH8mIxrO-ifIiqTW5i2U09cbM5vr8tJhfJ1Ph_ypsnQaRJXrfDLs9Z7z66foCJyZzrpPhf42M7FPAYzIEMEaG8CKW5kJScUwI_6t4kMnz2lsnn5CS1PK3BtCkOjo7mcYjtj8tvfK26hrx2NdOVPL0ubCC1JX-6y0mauW_mWFuo_ugwu4kOC_YP7Bt-375Yjtw7kdTLSjqirFgnE0dR4mgU0VkH1gttqIZUX9auI7JxDsRpEVNI2LQnHyoJgRTKtU2L-LAtDaiVHGZ4ArC07IBxQlGMnXdidjo0lBWjfPl657ZzWNG-gQ2QBA6xUEsZrLTpfsyYRtgvdcJCmk5HuuCqofh2fVMyLSxJT_fX9a9dl6oDKwHrHLNfbKiY-DgrvGDxbi0XU_zWgbrdrPjvqpPb11MIFSQjMe2wSZju7-E00jjrX1zexg1aOdPGaZqTFKOojiPLEXC6xnauNVFhvqczulmr8q8u6UllADMSOcxbzq3P_UsQvUx9yQ4mAo79hBy9YEP_qacaMkG57sAoa4ChpcEQyGORjflSGKrKdd119iVJoFCEuRm2mZdUiJkkHkZk5bYTq-vs78vvCNQPUlPu3dZVN8_Z6wqjoAKLlu3-cXVwhisSzQgC938_QmrGpSwYjinWYiL1fzhi56Avec-fyUorUUCTNFuKXQ-AdXgvR2w38LoJgfTdanI1xlwQrvCbaeXCFkVqj1OdbCqMBm-SYh9JTETLMwdljSEh0fDMFl6QSI6MJiZPFH9ZScutouzE9JC7kKbD3hVMvWF3-BJKkc0IjM9W5FjWmTVi41YWgrRQBt4g1gkCvJZabNp7F19GSg9yW3U1T_JSbFMQIdejv843pZePkTJ7LNuoELbg9ADecAHGnlyi2bDof-_--HlcxJeZO5_1Zs7DEhEtVEvgFn8HcW9oWyfkYNNkOeSKgyJ66rI6K9ZqpssVJZxJVKaGjEPzkFYrLtD0dIz9rXL59GVh0AIAKkgi2DYk-wi1nMv3PLhewpcetvcaUVK6omZiREF3P0tG5tn0B7JHwSDOjLhPokgiSq9jUeUao-Wap1IjYLX5Uw1K1PjZMU8vuLpIRGsvW1FDtmwjjB44l-w951DSvZkAHRz-_l-7WriZcU_JK9eba2oX_kRvZ82sS14S_rlJMYvX7gEZtNqkiB1wnqfUMJGkeAbG7RD97aFSeKgyNETJk3AjclQLs9DYvRLPVkdiBqsWCpBn0Rb0tJkHoX76_EcpJ0pfPMe8l_QLEDrTqnJ-VGefDqKMoQ-e1CCkRiQtlMNX_ENm2rnIl1kVunwFrmlzggWTlk870TfJKcDPrZag1ZJImojXiICruT-5d818XgKc-iq7R1vBOGSfdJRBDXGZriK72li7DJLz9A04-gnPcdI5WnAQC-GNpanEPExl0fG0vv_4yxYd9sGQwiG30i65_-6aLcdE74nZxnqk8_Ms9tLtnH8M2ypNOQH-RsOGu7BDDQL3Q81wWsTdNfPxAptcePSWO2guJM8oAb4cEwK_IgWYMBuMhaNy5Hh8XN2eP8W6pOliWwpL38mcCKqwiNA6XyDzZGEnGzHBrP2e18o-1yubBaTlcniER4ZKFF19x3T5yKmYwwTviP_WUNZuYDumqVzZVep1oE3tbmbTQtWzNQ9fYA5r2VCZ1xA-8H0sTAVdPLjfaGToWxbuCNEyqg-c7HeVrQPijmXoHYLL92fEN336JeeBtTycz3dQs-uMj9jGmSK8E6mLllRYUR-p7YlQvdv3OYVwXhkDnOypYF3ms2ZfSLwPWQM9zmUfe3pdYzcWsTTranG-6LkHTBy5fP_ZO4TFctvORuukTowDRsAqnMue0emDR2UWaNUBoEty5aYXcP3JceJjQ7g0c_tCZ9tDuWBAXH857N-XVSNhWT5QTdlbIY5VCIwFmOIBv3UAuprus4LTxhAg_JDTUsa_OxyQIzI9hVooTwFJlnkft6exwjWby9TLd7m2Z3qcbBwXeNh2V0F3GMopF79FkgtcgExzo9SmZ-Dm-oMBE5_en1-L5x6_UU0Ou1oBpHP7I53YwYafsGme7WGeQx4CSzEBP01LOUatuKeNkFZb1gg9MlDCxdD0KZCdUyv8iqjmDyBUhcfUEkAUwIV2223Pl-YExCDGa5YxKgNuf7AdRBmsPYjgNgDF_lBc--IBJasgM0tysZB_MF0xP-JlYzfRO_-wWcUXv8w7SKha2CoVW5NmF_CaJr5HXKVSM1BaUfuy7nEMrQpNfffj91E8NUKPg..'),
(1, 'qmkf70q95d2dqar9r9aahg10r4', '115.186.146.97', 1361346822, 0, 'PirPLDVlkWHjJyJhE_2COqnH6K7TQYzCszD4OVBzWvCuw7q8vWR7IKeiZau89u6ENxjRKC0VgM10HVwOH_mjOZAF4OoMevjTFiUwW_az5MFAZprGJKm7bFO6yl5DhVy7e1ay1lsfQ4uUEs3T3yNYgA..'),
(144, 'laiu2a5fv9mmee0e0kgi965fs1', '95.79.7.108', 1361182261, 0, ''),
(0, 'h3pmkk025jnfis2vvautp824c0', '115.186.146.97', 1361163859, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `sub_datagroup_submissions`
--

CREATE TABLE IF NOT EXISTS `sub_datagroup_submissions` (
  `ssid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `submitted` int(11) NOT NULL DEFAULT '0',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ssid`),
  KEY `nid_uid_sid` (`nid`,`uid`,`sid`),
  KEY `nid_sid` (`nid`,`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=635 ;

--
-- Dumping data for table `sub_datagroup_submissions`
--

INSERT INTO `sub_datagroup_submissions` (`ssid`, `nid`, `sid`, `uid`, `submitted`, `cid`, `title`) VALUES
(569, 4, 238, 1, 1349156007, 7, 'Letters of recommendation'),
(570, 4, 238, 1, 1349156030, 7, 'Letters of recommendation'),
(572, 5, 239, 1, 1349156617, 10, 'Implants'),
(571, 5, 239, 1, 1349156617, 6, 'Surgeries'),
(594, 5, 268, 86, 1349433415, 10, 'Implants'),
(593, 5, 268, 86, 1349433415, 6, 'Surgeries'),
(592, 5, 267, 102, 1349354428, 10, 'Implants'),
(591, 5, 267, 102, 1349354428, 6, 'Surgeries'),
(624, 5, 302, 102, 1351659625, 6, 'Surgeries'),
(589, 5, 263, 102, 1349353900, 10, 'Implants'),
(588, 14, 261, 102, 1349337262, 4, 'Telephone '),
(587, 14, 260, 86, 1349271292, 4, 'Telephone '),
(580, 14, 255, 86, 1349263993, 4, 'Telephone '),
(577, 14, 253, 1, 1351684553, 4, 'Telephone '),
(575, 14, 250, 102, 1351688240, 4, 'Telephone '),
(573, 4, 248, 102, 1349250015, 7, 'Letters of recommendation'),
(581, 14, 255, 86, 1349263993, 4, 'Telephone '),
(626, 14, 309, 110, 1352263117, 4, 'Telephone '),
(563, 3, 237, 1, 1349095606, 1, 'Bank Account'),
(564, 3, 237, 1, 1349095606, 5, 'Credit / Debit Cards'),
(565, 3, 237, 1, 1349095606, 11, 'Credit Score'),
(566, 3, 237, 1, 1349095606, 15, 'Loans'),
(595, 5, 270, 102, 1349679453, 6, 'Surgeries'),
(596, 5, 270, 102, 1349679453, 10, 'Implants'),
(597, 4, 269, 102, 1349443540, 7, 'Letters of recommendation'),
(598, 5, 271, 1, 1349674634, 6, 'Surgeries'),
(599, 5, 271, 1, 1349674634, 10, 'Implants'),
(600, 4, 238, 1, 1349674978, 7, 'Letters of recommendation'),
(601, 4, 238, 1, 1349679093, 7, 'Letters of recommendation'),
(602, 5, 270, 102, 1349679453, 6, 'Surgeries'),
(603, 5, 272, 102, 1349679670, 6, 'Surgeries'),
(604, 5, 272, 102, 1349679670, 6, 'Surgeries'),
(605, 5, 272, 102, 1349679670, 10, 'Implants'),
(606, 4, 273, 102, 1349680323, 7, 'Letters of recommendation'),
(607, 14, 274, 103, 1349718804, 4, 'Telephone '),
(608, 14, 275, 103, 1350411984, 4, 'Telephone '),
(609, 3, 283, 103, 1350434014, 1, 'Bank Account'),
(610, 3, 283, 103, 1350434014, 5, 'Credit / Debit Cards'),
(611, 3, 259, 102, 1350650888, 1, 'Bank Account'),
(612, 3, 259, 102, 1350650888, 5, 'Credit / Debit Cards'),
(613, 3, 259, 102, 1350650888, 11, 'Credit Score'),
(614, 3, 259, 102, 1350650888, 15, 'Loans'),
(615, 14, 287, 103, 1350660199, 4, 'Telephone '),
(616, 14, 288, 100, 1350861632, 4, 'Telephone '),
(617, 5, 291, 100, 1350757695, 6, 'Surgeries'),
(618, 14, 297, 100, 1350758063, 4, 'Telephone '),
(619, 14, 298, 100, 1350758122, 4, 'Telephone '),
(620, 5, 299, 102, 1350986665, 6, 'Surgeries'),
(621, 5, 299, 102, 1350986665, 10, 'Implants'),
(622, 5, 300, 115, 1351597804, 6, 'Surgeries'),
(623, 4, 301, 102, 1351599858, 7, 'Letters of recommendation'),
(628, 14, 317, 123, 1359305279, 4, 'Telephone '),
(629, 5, 319, 123, 1359305364, 10, 'Implants'),
(630, 3, 323, 123, 1359308054, 1, 'Bank Account'),
(631, 3, 323, 123, 1359308054, 5, 'Credit / Debit Cards'),
(632, 3, 323, 123, 1359308054, 11, 'Credit Score'),
(633, 3, 323, 123, 1359308054, 15, 'Loans'),
(634, 14, 324, 141, 1360873397, 4, 'Telephone ');

-- --------------------------------------------------------

--
-- Table structure for table `sub_datagroup_submitted_data`
--

CREATE TABLE IF NOT EXISTS `sub_datagroup_submitted_data` (
  `sd_id` int(11) NOT NULL AUTO_INCREMENT,
  `ssid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`sd_id`),
  KEY `ssid` (`ssid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1357 ;

--
-- Dumping data for table `sub_datagroup_submitted_data`
--

INSERT INTO `sub_datagroup_submitted_data` (`sd_id`, `ssid`, `cid`, `data`) VALUES
(1180, 570, 16, 'Microsoft Letter 2'),
(1177, 569, 10, '150'),
(1178, 570, 8, '2011-11-21'),
(1188, 572, 14, 'EMC'),
(1181, 570, 10, '152'),
(1179, 570, 9, 'Fraklin'),
(1176, 569, 16, 'Google Letter'),
(1182, 571, 16, ' Surgery Title a'),
(1185, 572, 17, 'Implant Title EM'),
(1186, 572, 12, '2003-3-20'),
(1184, 571, 9, 'Accident'),
(1183, 571, 8, '2007-3-2'),
(1250, 594, 14, 'EMC'),
(1249, 594, 13, 'Joint replacement: Elbow'),
(1248, 594, 12, '1972-10-3'),
(1247, 594, 17, ''),
(1246, 593, 9, 'Accident'),
(1245, 593, 8, '2009-10-16'),
(1244, 593, 16, 'Leg Surgery'),
(1174, 569, 8, '1981-11-01'),
(1243, 592, 14, 'XYZ'),
(1175, 569, 9, 'Jacob C. Race'),
(1242, 592, 13, 'Joint replacement: Shoulder'),
(1241, 592, 12, '1970-1-3'),
(1240, 592, 17, 'Knee'),
(1239, 591, 9, 'Ahs'),
(1238, 591, 8, '1970-1-1'),
(1237, 591, 16, ''),
(1236, 589, 14, '+'),
(1235, 589, 13, 'Dental Implants'),
(1234, 589, 12, '1970-01-01'),
(1233, 589, 17, '+6+'),
(1232, 588, 8, '(999) 999-9999'),
(1231, 588, 6, 'Office'),
(1230, 588, 10, 'help'),
(1229, 587, 8, '(213) 211-2952'),
(1228, 587, 6, 'Home'),
(1227, 587, 10, 'Nelson Home'),
(1213, 581, 0, 'Remove'),
(1212, 581, 8, '(213) 211-2952'),
(1211, 581, 6, 'Home'),
(1210, 581, 10, 'Nelson Cell'),
(1208, 580, 6, 'Home'),
(1209, 580, 8, '(510) 522-8058'),
(1207, 580, 10, 'Test Telephone 2'),
(1200, 577, 8, '(213) 211-2952'),
(1199, 577, 6, 'Office'),
(1198, 577, 10, 'james spina office'),
(1195, 575, 8, '(999) 999-9999'),
(1194, 575, 6, ''),
(1193, 575, 10, 'this is my telephone no'),
(1192, 573, 10, '158'),
(1191, 573, 16, 'GIK'),
(1190, 573, 9, 'juli'),
(1189, 573, 8, ''),
(1187, 572, 13, 'Joint replacement: Elbow'),
(1336, 626, 8, '(480) 348-3974'),
(1335, 626, 6, 'Office'),
(1334, 626, 10, ''),
(1151, 563, 21, 'RBS'),
(1152, 563, 3, 'Savings'),
(1153, 563, 4, '146545654'),
(1154, 564, 22, 'UBL Viz'),
(1155, 564, 8, 'VISA'),
(1156, 564, 9, '45FRF4452141'),
(1157, 564, 7, '1995-11-8'),
(1158, 564, 10, '1213'),
(1159, 565, 23, 'NBO Credit '),
(1160, 565, 13, '1981-11-3'),
(1161, 565, 14, '789'),
(1162, 566, 24, 'Loans title'),
(1163, 566, 17, 'Auto'),
(1164, 566, 18, '2010-11-13'),
(1165, 566, 19, '100'),
(1251, 595, 8, '1971-01-01'),
(1252, 595, 9, 'asdf'),
(1253, 597, 8, ''),
(1254, 597, 9, 'asds'),
(1255, 597, 16, ''),
(1256, 597, 10, '159'),
(1257, 598, 16, ''),
(1258, 598, 8, '1971-2-3'),
(1259, 598, 9, 'Accident'),
(1260, 599, 17, ''),
(1261, 599, 12, '1971-2-2'),
(1262, 599, 13, 'Joint replacement: Elbow'),
(1263, 599, 14, 'EMC'),
(1264, 600, 8, '1999-03-01'),
(1265, 600, 9, 'Jacob C. Race'),
(1266, 600, 16, ''),
(1267, 600, 10, '160'),
(1268, 601, 8, ''),
(1269, 601, 9, 'Fraklin'),
(1270, 601, 16, 'Test letter'),
(1271, 601, 10, ''),
(1272, 602, 8, '--'),
(1273, 602, 9, 'second'),
(1274, 602, 0, 'Remove'),
(1275, 603, 16, ''),
(1276, 603, 8, '--'),
(1277, 603, 9, 'first'),
(1278, 604, 16, ''),
(1279, 604, 8, '--'),
(1280, 604, 9, 'second'),
(1281, 605, 17, ''),
(1282, 605, 12, '--'),
(1283, 605, 13, 'Joint replacement: Hip'),
(1284, 605, 14, ''),
(1285, 606, 8, ''),
(1286, 606, 9, 'moon'),
(1287, 606, 16, 'let'),
(1288, 606, 10, '162'),
(1289, 607, 10, '555-111-2222'),
(1290, 607, 6, 'Cell'),
(1291, 607, 8, ''),
(1292, 608, 10, 'Dr.''s 800'),
(1293, 608, 6, 'Office'),
(1294, 608, 8, '888-555-2343'),
(1295, 609, 21, 'Operating'),
(1296, 609, 3, 'Checking'),
(1297, 609, 4, '11130-938774--049389'),
(1298, 610, 22, 'Macys'),
(1299, 610, 8, ''),
(1300, 610, 9, ''),
(1301, 610, 7, '2015-1-2'),
(1302, 610, 10, '2244'),
(1303, 615, 10, 'Mobile - Personal'),
(1304, 615, 6, 'Cell'),
(1305, 615, 8, '925-776-9876'),
(1306, 616, 10, 'Office'),
(1307, 616, 6, 'Office'),
(1308, 616, 8, '(480) 348-3974'),
(1309, 617, 16, 'Right knee scope'),
(1310, 617, 8, '1970-12-14'),
(1311, 617, 9, 'ACL Injury'),
(1312, 618, 10, 'cell'),
(1313, 618, 6, 'Cell'),
(1314, 618, 8, '(480) 276-3867'),
(1315, 619, 10, 'Office'),
(1316, 619, 6, 'Office'),
(1317, 619, 8, '(480) 348-3974'),
(1318, 620, 16, 'Synerg'),
(1319, 620, 8, '1942-01-01'),
(1320, 620, 9, 'This is actual reason'),
(1321, 622, 16, 'Synerg'),
(1322, 622, 8, '1940-1-1'),
(1323, 622, 9, 'This is actual reason'),
(1324, 623, 8, ''),
(1325, 623, 9, 'werw'),
(1326, 623, 16, 'asda'),
(1327, 623, 10, ''),
(1328, 624, 16, ''),
(1329, 624, 8, '2012-2-3'),
(1330, 624, 9, ''),
(1340, 628, 10, ''),
(1341, 628, 6, 'Office'),
(1342, 628, 8, '(480) 348-3974'),
(1343, 629, 17, 'right TKA'),
(1344, 629, 12, '1972-1-1'),
(1345, 629, 13, 'Joint replacement: Knee'),
(1346, 629, 14, 'Depuy'),
(1347, 630, 21, 'BOA'),
(1348, 630, 3, 'Checking'),
(1349, 630, 4, '1234567'),
(1350, 631, 22, 'visa'),
(1351, 631, 8, 'VISA'),
(1352, 631, 9, '12345'),
(1353, 631, 7, '1970-01-01'),
(1354, 634, 10, 'Home'),
(1355, 634, 6, 'Home'),
(1356, 634, 8, '480-821-6957');

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `filename` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `owner` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `bootstrap` int(11) NOT NULL DEFAULT '0',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1',
  `weight` int(11) NOT NULL DEFAULT '0',
  `info` text,
  PRIMARY KEY (`filename`),
  KEY `modules` (`type`(12),`status`,`weight`,`filename`),
  KEY `bootstrap` (`type`(12),`status`,`bootstrap`,`weight`,`filename`),
  KEY `type_name` (`type`(12),`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('themes/pushbutton/pushbutton.info', 'pushbutton', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/garland/minnelli/minnelli.info', 'minnelli', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}'),
('themes/garland/garland.info', 'garland', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0, 'a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/chameleon/marvin/marvin.info', 'marvin', 'theme', '', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/chameleon/chameleon.info', 'chameleon', 'theme', 'themes/chameleon/chameleon.theme', 0, 0, 0, -1, 0, 'a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/bluemarine/bluemarine.info', 'bluemarine', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('modules/system/system.module', 'system', 'module', '', 1, 0, 0, 6055, 0, 'a:10:{s:4:"name";s:6:"System";s:11:"description";s:54:"Handles general site configuration for administrators.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/aggregator/aggregator.module', 'aggregator', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Aggregator";s:11:"description";s:57:"Aggregates syndicated content (RSS, RDF, and Atom feeds).";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/block/block.module', 'block', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:5:"Block";s:11:"description";s:62:"Controls the boxes that are displayed around the main content.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/blog/blog.module', 'blog', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Blog";s:11:"description";s:69:"Enables keeping easily and regularly updated user web pages or blogs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/blogapi/blogapi.module', 'blogapi', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Blog API";s:11:"description";s:79:"Allows users to post content using applications that support XML-RPC blog APIs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/book/book.module', 'book', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Book";s:11:"description";s:63:"Allows users to structure site pages in a hierarchy or outline.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/color/color.module', 'color', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:5:"Color";s:11:"description";s:61:"Allows the user to change the color scheme of certain themes.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/comment/comment.module', 'comment', 'module', '', 1, 0, 0, 6005, 0, 'a:10:{s:4:"name";s:7:"Comment";s:11:"description";s:57:"Allows users to comment on and discuss published content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/contact/contact.module', 'contact', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:7:"Contact";s:11:"description";s:61:"Enables the use of both personal and site-wide contact forms.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/dblog/dblog.module', 'dblog', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:16:"Database logging";s:11:"description";s:47:"Logs and records system events to the database.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/filter/filter.module', 'filter', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Filter";s:11:"description";s:60:"Handles the filtering of content in preparation for display.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/forum/forum.module', 'forum', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:5:"Forum";s:11:"description";s:50:"Enables threaded discussions about general topics.";s:12:"dependencies";a:2:{i:0;s:8:"taxonomy";i:1;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/help/help.module', 'help', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Help";s:11:"description";s:35:"Manages the display of online help.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/locale/locale.module', 'locale', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Locale";s:11:"description";s:119:"Adds language handling functionality and enables the translation of the user interface to languages other than English.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/menu/menu.module', 'menu', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Menu";s:11:"description";s:60:"Allows administrators to customize the site navigation menu.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/node/node.module', 'node', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Node";s:11:"description";s:66:"Allows content to be submitted to the site and displayed on pages.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/openid/openid.module', 'openid', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"OpenID";s:11:"description";s:48:"Allows users to log into your site using OpenID.";s:7:"version";s:4:"6.26";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/path/path.module', 'path', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Path";s:11:"description";s:28:"Allows users to rename URLs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/php/php.module', 'php', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"PHP filter";s:11:"description";s:50:"Allows embedded PHP code/snippets to be evaluated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/ping/ping.module', 'ping', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Ping";s:11:"description";s:51:"Alerts other sites when your site has been updated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/poll/poll.module', 'poll', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Poll";s:11:"description";s:95:"Allows your site to capture votes on different topics in the form of multiple choice questions.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/profile/profile.module', 'profile', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:7:"Profile";s:11:"description";s:36:"Supports configurable user profiles.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/search/search.module', 'search', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Search";s:11:"description";s:36:"Enables site-wide keyword searching.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/statistics/statistics.module', 'statistics', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Statistics";s:11:"description";s:37:"Logs access statistics for your site.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/syslog/syslog.module', 'syslog', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Syslog";s:11:"description";s:41:"Logs and records system events to syslog.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"Taxonomy";s:11:"description";s:38:"Enables the categorization of content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/throttle/throttle.module', 'throttle', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Throttle";s:11:"description";s:66:"Handles the auto-throttling mechanism, to control site congestion.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/tracker/tracker.module', 'tracker', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Tracker";s:11:"description";s:43:"Enables tracking of recent posts for users.";s:12:"dependencies";a:1:{i:0;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/translation/translation.module', 'translation', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Content translation";s:11:"description";s:57:"Allows content to be translated into different languages.";s:12:"dependencies";a:1:{i:0;s:6:"locale";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/trigger/trigger.module', 'trigger', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Trigger";s:11:"description";s:90:"Enables actions to be fired on certain system events, such as when new content is created.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/update/update.module', 'update', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:13:"Update status";s:11:"description";s:88:"Checks the status of available updates for Drupal and your installed modules and themes.";s:7:"version";s:4:"6.26";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/upload/upload.module', 'upload', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Upload";s:11:"description";s:51:"Allows users to upload and attach files to content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/user/user.module', 'user', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"User";s:11:"description";s:47:"Manages the user registration and login system.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/form_builder/form_builder.module', 'form_builder', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:12:"Form builder";s:11:"description";s:24:"Form building framework.";s:12:"dependencies";a:2:{i:0;s:9:"jquery_ui";i:1;s:15:"options_element";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.0";s:7:"project";s:12:"form_builder";s:9:"datestamp";s:10:"1331181347";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/form_builder/examples/form_builder_examples.module', 'form_builder_examples', 'module', '', 0, 0, 0, 0, 0, 'a:9:{s:4:"name";s:21:"Form builder examples";s:11:"description";s:59:"Form builder support for CCK, Webform, and Profile modules.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:12:"form_builder";}s:7:"version";s:7:"6.x-1.0";s:7:"project";s:12:"form_builder";s:9:"datestamp";s:10:"1331181347";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/form_builder/modules/webform/form_builder_webform.module', 'form_builder_webform', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:23:"Form builder Webform UI";s:11:"description";s:48:"Form builder integration for the Webform module.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:12:"form_builder";i:1;s:7:"webform";}s:7:"version";s:7:"6.x-1.0";s:7:"project";s:12:"form_builder";s:9:"datestamp";s:10:"1331181347";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/jquery_ui/jquery_ui.module', 'jquery_ui', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:9:"jQuery UI";s:11:"description";s:55:"Provides the jQuery UI plug-in to other Drupal modules.";s:7:"package";s:14:"User interface";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.5";s:7:"project";s:9:"jquery_ui";s:9:"datestamp";s:10:"1308323216";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/options_element/options_element.module', 'options_element', 'module', '', 0, 0, 0, 0, 0, 'a:9:{s:4:"name";s:15:"Options element";s:11:"description";s:86:"A custom form element for entering the options in select lists, radios, or checkboxes.";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.0";s:7:"version";s:7:"6.x-1.7";s:7:"project";s:15:"options_element";s:9:"datestamp";s:10:"1332018947";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('sites/all/modules/webform/webform.module', 'webform', 'module', '', 1, 0, 0, 6331, -1, 'a:10:{s:4:"name";s:7:"Webform";s:11:"description";s:49:"Enables the creation of forms and questionnaires.";s:4:"core";s:3:"6.x";s:7:"package";s:7:"Webform";s:3:"php";s:3:"5.1";s:7:"version";s:8:"6.x-3.18";s:7:"project";s:7:"webform";s:9:"datestamp";s:10:"1336890407";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('sites/all/modules/uc_cano-1.3/uc_cano.module', 'uc_cano', 'module', '', 0, 0, 0, -1, 0, 'a:7:{s:4:"name";s:4:"CANO";s:7:"version";s:3:"1.3";s:11:"description";s:30:"Chained Attributes and Options";s:12:"dependencies";a:2:{i:0;s:10:"uc_product";i:1;s:12:"uc_attribute";}s:4:"core";s:3:"6.x";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/webform_addmore/webform_addmore.module', 'webform_addmore', 'module', '', 1, 0, 0, 0, 0, 'a:8:{s:4:"name";s:16:"Webform Add More";s:11:"description";s:45:"Provides add more option for webforms module.";s:7:"package";s:7:"Webform";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:11:"ahah_helper";}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/custom_modules/custom/custom.module', 'custom', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Custom";s:11:"description";s:48:"Customization in web-forms and their submission.";s:4:"core";s:3:"6.x";s:7:"package";s:6:"Custom";s:3:"php";s:3:"5.1";s:7:"version";s:8:"6.x-3.18";s:7:"project";s:6:"Custom";s:9:"datestamp";s:10:"1336890407";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('sites/all/modules/ahah_helper/ahah_helper.module', 'ahah_helper', 'module', '', 1, 0, 0, 0, 0, 'a:9:{s:4:"name";s:11:"AHAH helper";s:11:"description";s:84:"The AHAH helper module, making gracefully degradable AHAH-driven forms a no-brainer.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:11:"ahah_helper";s:9:"datestamp";s:10:"1310369523";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/ahah_helper/ahah_helper_demo.module', 'ahah_helper_demo', 'module', '', 1, 0, 0, 0, 0, 'a:9:{s:4:"name";s:16:"AHAH helper demo";s:11:"description";s:35:"A demo form the AHAH helper module.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:11:"ahah_helper";s:9:"datestamp";s:10:"1310369523";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/services/servers/rest_server/rest_server.module', 'rest_server', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:11:"REST Server";s:11:"description";s:24:"Provides an REST server.";s:7:"package";s:18:"Services - servers";s:12:"dependencies";a:2:{i:0;s:8:"services";i:1;s:8:"autoload";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-3.1";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1321482643";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/services/services.module', 'services', 'module', '', 1, 0, 0, 6004, 0, 'a:10:{s:4:"name";s:8:"Services";s:11:"description";s:41:"Provide an API for creating web services.";s:7:"package";s:8:"Services";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('sites/all/modules/services/auth/services_oauth/services_oauth.module', 'services_oauth', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:20:"OAuth Authentication";s:11:"description";s:53:"Provides OAuth authentication for the services module";s:7:"package";s:25:"Services - authentication";s:12:"dependencies";a:2:{i:0;s:8:"services";i:1;s:12:"oauth_common";}s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.2";s:7:"version";s:7:"6.x-3.1";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1321482643";s:10:"dependents";a:0:{}}'),
('sites/all/modules/services/servers/rest_server/formats/xcal_format.module', 'xcal_format', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:21:"xCal and iCal formats";s:11:"description";s:54:"Provides xCal and iCal formatters for the REST server.";s:7:"package";s:8:"Services";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.x";s:7:"version";s:7:"6.x-3.1";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1321482643";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('sites/all/modules/services/servers/xmlrpc_server/xmlrpc_server.module', 'xmlrpc_server', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:13:"XMLRPC Server";s:11:"description";s:26:"Provides an XMLRPC server.";s:7:"package";s:18:"Services - servers";s:12:"dependencies";a:1:{i:0;s:8:"services";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/ctools/bulk_export/bulk_export.module', 'bulk_export', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:11:"Bulk Export";s:11:"description";s:67:"Performs bulk exporting of data objects known about by Chaos tools.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:7:"package";s:16:"Chaos tool suite";s:7:"version";s:7:"6.x-1.8";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1288393844";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/ctools/ctools.module', 'ctools', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:11:"Chaos tools";s:11:"description";s:46:"A library of helpful tools by Merlin of Chaos.";s:4:"core";s:3:"6.x";s:7:"package";s:16:"Chaos tool suite";s:7:"version";s:7:"6.x-1.8";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1288393844";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/ctools/ctools_access_ruleset/ctools_access_ruleset.module', 'ctools_access_ruleset', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:15:"Custom rulesets";s:11:"description";s:81:"Create custom, exportable, reusable access rulesets for applications like Panels.";s:4:"core";s:3:"6.x";s:7:"package";s:16:"Chaos tool suite";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:7:"version";s:7:"6.x-1.8";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1288393844";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/ctools/ctools_ajax_sample/ctools_ajax_sample.module', 'ctools_ajax_sample', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:33:"Chaos Tools (CTools) AJAX Example";s:11:"description";s:41:"Shows how to use the power of Chaos AJAX.";s:7:"package";s:16:"Chaos tool suite";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:7:"version";s:7:"6.x-1.8";s:4:"core";s:3:"6.x";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1288393844";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/ctools/ctools_custom_content/ctools_custom_content.module', 'ctools_custom_content', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:20:"Custom content panes";s:11:"description";s:79:"Create custom, exportable, reusable content panes for applications like Panels.";s:4:"core";s:3:"6.x";s:7:"package";s:16:"Chaos tool suite";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:7:"version";s:7:"6.x-1.8";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1288393844";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/ctools/ctools_plugin_example/ctools_plugin_example.module', 'ctools_plugin_example', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:35:"Chaos Tools (CTools) Plugin Example";s:11:"description";s:75:"Shows how an external module can provide ctools plugins (for Panels, etc.).";s:7:"package";s:16:"Chaos tool suite";s:12:"dependencies";a:4:{i:0;s:6:"ctools";i:1;s:6:"panels";i:2;s:12:"page_manager";i:3;s:13:"advanced_help";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.8";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1288393844";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/ctools/page_manager/page_manager.module', 'page_manager', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:12:"Page manager";s:11:"description";s:54:"Provides a UI and API to manage pages within the site.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:7:"package";s:16:"Chaos tool suite";s:7:"version";s:7:"6.x-1.8";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1288393844";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/ctools/stylizer/stylizer.module', 'stylizer', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Stylizer";s:11:"description";s:53:"Create custom styles for applications such as Panels.";s:4:"core";s:3:"6.x";s:7:"package";s:16:"Chaos tool suite";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:7:"version";s:7:"6.x-1.8";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1288393844";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/ctools/views_content/views_content.module', 'views_content', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Views content panes";s:11:"description";s:104:"Allows Views content to be used in Panels, Dashboard and other modules which use the CTools Content API.";s:7:"package";s:16:"Chaos tool suite";s:12:"dependencies";a:2:{i:0;s:6:"ctools";i:1;s:5:"views";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.8";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1288393844";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/services/services/comment_service/comment_service.module', 'comment_service', 'module', '', 0, 0, 0, 0, 0, 'a:10:{s:4:"name";s:15:"Comment Service";s:11:"description";s:27:"Provides a comment service.";s:7:"package";s:19:"Services - services";s:12:"dependencies";a:2:{i:0;s:8:"services";i:1;s:7:"comment";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/services/services/file_service/file_service.module', 'file_service', 'module', '', 0, 0, 0, 0, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:8:"services";}s:11:"description";s:24:"Provides a file service.";s:4:"name";s:12:"File Service";s:7:"package";s:19:"Services - services";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/services/services/menu_service/menu_service.module', 'menu_service', 'module', '', 0, 0, 0, 0, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:8:"services";}s:11:"description";s:24:"Provides a menu service.";s:4:"name";s:12:"Menu Service";s:7:"package";s:19:"Services - services";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/services/services/node_service/node_resource.module', 'node_resource', 'module', '', 0, 0, 0, 0, 0, 'a:10:{s:4:"name";s:13:"Node Resource";s:11:"description";s:56:"Provides a resource oriented service interface to nodes.";s:7:"package";s:19:"Services - services";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('sites/all/modules/services/services/node_service/node_service.module', 'node_service', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:12:"Node Service";s:11:"description";s:24:"Provides a node service.";s:7:"package";s:19:"Services - services";s:12:"dependencies";a:2:{i:0;s:8:"services";i:1;s:4:"node";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/services/services/search_service/search_service.module', 'search_service', 'module', '', 0, 0, 0, 0, 0, 'a:10:{s:4:"name";s:14:"Search Service";s:11:"description";s:26:"Provides a search service.";s:7:"package";s:19:"Services - services";s:12:"dependencies";a:2:{i:0;s:8:"services";i:1;s:6:"search";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/services/auth/services_keyauth/services_keyauth.module', 'services_keyauth', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:18:"Key Authentication";s:11:"description";s:51:"Provides key authentication for the services module";s:7:"package";s:25:"Services - authentication";s:12:"dependencies";a:1:{i:0;s:8:"services";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/services/services/system_service/system_service.module', 'system_service', 'module', '', 0, 0, 0, 0, 0, 'a:10:{s:4:"name";s:14:"System Service";s:11:"description";s:25:"Provides system services.";s:7:"package";s:19:"Services - services";s:12:"dependencies";a:1:{i:0;s:8:"services";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/services/services/taxonomy_service/taxonomy_service.module', 'taxonomy_service', 'module', '', 0, 0, 0, 0, 0, 'a:10:{s:4:"name";s:16:"Taxonomy Service";s:11:"description";s:28:"Provides a taxonomy service.";s:7:"package";s:19:"Services - services";s:12:"dependencies";a:2:{i:0;s:8:"services";i:1;s:8:"taxonomy";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/services/services/user_service/user_service.module', 'user_service', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:12:"User Service";s:11:"description";s:24:"Provides a user service.";s:7:"package";s:19:"Services - services";s:12:"dependencies";a:2:{i:0;s:8:"services";i:1;s:4:"user";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/services/services/views_service/views_service.module', 'views_service', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:13:"Views Service";s:11:"description";s:25:"Provides a views service.";s:7:"package";s:19:"Services - services";s:12:"dependencies";a:2:{i:0;s:8:"services";i:1;s:5:"views";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"services";s:9:"datestamp";s:10:"1274122506";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/datagroup_services/datagroup_services.module', 'datagroup_services', 'module', '', 1, 0, 0, 0, 0, 'a:8:{s:4:"name";s:19:"Data Group Services";s:11:"description";s:29:"Provides Data Group services.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:8:"services";}s:7:"package";s:8:"Services";s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/webform_ssn/webform_ssn/webform_ssn.module', 'webform_ssn', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:11:"Webform SSN";s:11:"description";s:54:"Provides a component for U.S. Social Security Numbers.";s:4:"core";s:3:"6.x";s:7:"package";s:7:"Webform";s:12:"dependencies";a:1:{i:0;s:7:"webform";}s:7:"version";s:7:"6.x-1.0";s:7:"project";s:11:"webform_ssn";s:9:"datestamp";s:10:"1328893244";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/webform_password/webform_password.module', 'webform_password', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:22:"Webform Password Field";s:11:"description";s:74:"Provides a new field password for Webforms useful in registration process.";s:7:"package";s:7:"Webform";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.0";s:7:"project";s:16:"webform_password";s:9:"datestamp";s:10:"1300744569";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/json_server/json_server.module', 'json_server', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:11:"JSON server";s:11:"description";s:49:"Provides a Services API Server that returns JSON.";s:7:"package";s:18:"Services - servers";s:12:"dependencies";a:1:{i:0;s:8:"services";}s:4:"core";s:3:"6.x";s:7:"version";s:14:"6.x-2.0-alpha3";s:7:"project";s:11:"json_server";s:9:"datestamp";s:10:"1316442403";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/logintoboggan/logintoboggan.module', 'logintoboggan', 'module', '', 1, 0, 0, 6001, 0, 'a:9:{s:4:"name";s:13:"LoginToboggan";s:11:"description";s:31:"Improves Drupal''s login system.";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.10";s:7:"project";s:13:"logintoboggan";s:9:"datestamp";s:10:"1320873035";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/logintoboggan/contrib/logintoboggan_content_access_integration/logintoboggan_content_access_integration.module', 'logintoboggan_content_access_integration', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:40:"LoginToboggan Content Access Integration";s:11:"description";s:102:"Integrates LoginToboggan with Content Access module, so that Non-validated users are handled correctly";s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:13:"logintoboggan";i:1;s:14:"content_access";}s:7:"version";s:8:"6.x-1.10";s:7:"project";s:13:"logintoboggan";s:9:"datestamp";s:10:"1320873035";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/logintoboggan/contrib/logintoboggan_rules/logintoboggan_rules.module', 'logintoboggan_rules', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:31:"LoginToboggan Rules Integration";s:11:"description";s:42:"Integrates LoginToboggan with Rules module";s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:13:"logintoboggan";i:1;s:5:"rules";}s:7:"version";s:8:"6.x-1.10";s:7:"project";s:13:"logintoboggan";s:9:"datestamp";s:10:"1320873035";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/webform_validation/webform_validation.module', 'webform_validation', 'module', '', 1, 0, 0, 1, 0, 'a:10:{s:4:"name";s:18:"Webform Validation";s:11:"description";s:32:"Add validation rules to webforms";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:7:"webform";}s:7:"package";s:7:"Webform";s:7:"version";s:7:"6.x-1.5";s:7:"project";s:18:"webform_validation";s:9:"datestamp";s:10:"1322683251";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/popdata/popdata.module', 'popdata', 'module', '', 1, 0, 0, 0, 0, 'a:8:{s:4:"name";s:26:"RMI Data Population Module";s:11:"description";s:42:"Specifically used to populate data for RMI";s:7:"package";s:6:"Custom";s:4:"core";s:3:"6.x";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/custom_modules/view_data/view_data.module', 'view_data', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:16:"View data groups";s:11:"description";s:33:"View data group their submission.";s:4:"core";s:3:"6.x";s:7:"package";s:6:"Custom";s:3:"php";s:3:"5.1";s:7:"version";s:8:"6.x-3.18";s:7:"project";s:6:"Custom";s:9:"datestamp";s:10:"1336890407";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('sites/all/themes/rmi/rmi.info', 'rmi', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0, 'a:13:{s:4:"name";s:16:"Register My Info";s:11:"description";s:69:"Tableless, recolorable, multi-column, fluid width theme for RMI site.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:7:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:8:"dropmenu";s:14:"Drop Down Menu";s:10:"accountnav";s:15:"My account menu";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:30:"sites/all/themes/rmi/style.css";}}s:7:"scripts";a:1:{s:10:"sign-up.js";s:31:"sites/all/themes/rmi/sign-up.js";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1341320410";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:35:"sites/all/themes/rmi/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/menu_token/menu_token.module', 'menu_token', 'module', '', 1, 0, 0, 6000, 0, 'a:9:{s:4:"name";s:10:"Menu Token";s:11:"description";s:37:"Provides tokens in menu items(links).";s:12:"dependencies";a:1:{i:0;s:5:"token";}s:4:"core";s:3:"6.x";s:7:"version";s:14:"6.x-1.0-alpha2";s:7:"project";s:10:"menu_token";s:9:"datestamp";s:10:"1307952721";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/pathauto/pathauto.module', 'pathauto', 'module', '', 1, 0, 0, 7, 1, 'a:10:{s:4:"name";s:8:"Pathauto";s:11:"description";s:95:"Provides a mechanism for modules to automatically generate aliases for the content they manage.";s:12:"dependencies";a:2:{i:0;s:4:"path";i:1;s:5:"token";}s:4:"core";s:3:"6.x";s:10:"recommends";a:1:{i:0;s:13:"path_redirect";}s:7:"version";s:7:"6.x-1.6";s:7:"project";s:8:"pathauto";s:9:"datestamp";s:10:"1320076535";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/token/token.module', 'token', 'module', '', 1, 0, 0, 1, 10, 'a:9:{s:4:"name";s:5:"Token";s:11:"description";s:79:"Provides a shared API for replacement of textual placeholders with actual data.";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.18";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1320336935";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/token/tokenSTARTER.module', 'tokenSTARTER', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:12:"TokenSTARTER";s:11:"description";s:72:"Provides additional tokens and a base on which to build your own tokens.";s:12:"dependencies";a:1:{i:0;s:5:"token";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.18";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1320336935";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/token/token_actions.module', 'token_actions', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:13:"Token actions";s:11:"description";s:73:"Provides enhanced versions of core Drupal actions using the Token module.";s:12:"dependencies";a:1:{i:0;s:5:"token";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.18";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1320336935";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/token/tests/token_test.module', 'token_test', 'module', '', 0, 0, 0, -1, 0, 'a:12:{s:4:"name";s:10:"Token Test";s:11:"description";s:39:"Testing module for token functionality.";s:7:"package";s:7:"Testing";s:4:"core";s:3:"6.x";s:5:"files";a:1:{i:0;s:17:"token_test.module";}s:6:"hidden";b:1;s:7:"version";s:8:"6.x-1.18";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1320336935";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/chgpwd/chgpwd.module', 'chgpwd', 'module', '', 1, 0, 0, 6200, 100, 'a:9:{s:4:"name";s:15:"Change password";s:11:"description";s:40:"provides separate change password screen";s:4:"core";s:3:"6.x";s:7:"version";s:11:"6.x-2.x-dev";s:7:"project";s:6:"chgpwd";s:9:"datestamp";s:10:"1328141533";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/custom_modules/contacts/contacts.module', 'contacts', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"Contacts";s:11:"description";s:56:"Customization in contacts of the user and their sharing.";s:4:"core";s:3:"6.x";s:7:"package";s:6:"Custom";s:3:"php";s:3:"5.1";s:7:"version";s:8:"6.x-3.18";s:7:"project";s:6:"Custom";s:9:"datestamp";s:10:"1344500002";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('sites/all/modules/content_access/content_access.module', 'content_access', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:14:"Content Access";s:11:"description";s:40:"Provides flexible content access control";s:7:"package";s:14:"Access control";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.2";s:7:"project";s:14:"content_access";s:9:"datestamp";s:10:"1249035332";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/colorbox/colorbox.module', 'colorbox', 'module', '', 1, 0, 0, 6001, 0, 'a:9:{s:4:"name";s:8:"Colorbox";s:11:"description";s:72:"A light-weight, customizable lightbox plugin for jQuery 1.3 through 1.6.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:13:"jquery_update";}s:7:"version";s:7:"6.x-1.2";s:7:"project";s:8:"colorbox";s:9:"datestamp";s:10:"1334081746";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/jquery_update/jquery_update.module', 'jquery_update', 'module', '', 1, 0, 0, 6200, 99, 'a:10:{s:4:"name";s:13:"jQuery Update";s:11:"description";s:51:"Updates Drupal to use the latest version of jQuery.";s:7:"package";s:14:"User interface";s:4:"core";s:3:"6.x";s:7:"version";s:14:"6.x-2.0-alpha1";s:7:"project";s:13:"jquery_update";s:9:"datestamp";s:10:"1272041110";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/nice_menus/nice_menus.module', 'nice_menus', 'module', '', 1, 0, 0, 6001, 0, 'a:9:{s:4:"name";s:10:"Nice Menus";s:11:"description";s:75:"CSS/jQuery drop-down, drop-right and drop-left menus to be placed in blocks";s:12:"dependencies";a:1:{i:0;s:4:"menu";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.1";s:7:"project";s:10:"nice_menus";s:9:"datestamp";s:10:"1287318691";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/menu_attributes/menu_attributes.module', 'menu_attributes', 'module', '', 1, 0, 0, 1, 10, 'a:9:{s:4:"name";s:15:"Menu attributes";s:11:"description";s:66:"Allows administrators to specify custom attributes for menu items.";s:12:"dependencies";a:1:{i:0;s:4:"menu";}s:4:"core";s:3:"6.x";s:7:"version";s:13:"6.x-2.0-beta1";s:7:"project";s:15:"menu_attributes";s:9:"datestamp";s:10:"1283726808";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/html_title/html_title.module', 'html_title', 'module', '', 1, 0, 0, 0, 0, 'a:9:{s:4:"name";s:10:"Html title";s:11:"description";s:39:"Enables html to be used in node titles.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.4";s:7:"project";s:10:"html_title";s:9:"datestamp";s:10:"1344006125";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');

-- --------------------------------------------------------

--
-- Table structure for table `term_data`
--

CREATE TABLE IF NOT EXISTS `term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `term_hierarchy`
--

CREATE TABLE IF NOT EXISTS `term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `term_node`
--

CREATE TABLE IF NOT EXISTS `term_node` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`vid`),
  KEY `vid` (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `term_relation`
--

CREATE TABLE IF NOT EXISTS `term_relation` (
  `trid` int(11) NOT NULL AUTO_INCREMENT,
  `tid1` int(10) unsigned NOT NULL DEFAULT '0',
  `tid2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trid`),
  UNIQUE KEY `tid1_tid2` (`tid1`,`tid2`),
  KEY `tid2` (`tid2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `term_synonym`
--

CREATE TABLE IF NOT EXISTS `term_synonym` (
  `tsid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tsid`),
  KEY `tid` (`tid`),
  KEY `name_tid` (`name`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

CREATE TABLE IF NOT EXISTS `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src` varchar(128) NOT NULL DEFAULT '',
  `dst` varchar(128) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `dst_language_pid` (`dst`,`language`,`pid`),
  KEY `src_language_pid` (`src`,`language`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99 ;

--
-- Dumping data for table `url_alias`
--

INSERT INTO `url_alias` (`pid`, `src`, `dst`, `language`) VALUES
(1, 'node/17', 'content/contact-us', ''),
(2, 'node/18', 'content/how-it-works', ''),
(3, 'node/15', 'content/one-app-one-website-one-person™', ''),
(5, 'node/20', 'content/about-us', ''),
(6, 'node/14', 'content/contact-info', ''),
(19, 'user/100', 'users/gilortegamsncom', ''),
(20, 'user/101', 'users/abcom', ''),
(21, 'user/102', 'users/accom', ''),
(22, 'user/103', 'users/muhammadusmanvizteckcom', ''),
(15, 'node/21', 'content/welcome-register-my-info', ''),
(23, 'user/104', 'users/xycom', ''),
(24, 'user/105', 'users/frederickorvillegmailcom', ''),
(25, 'user/106', 'users/atcom', ''),
(26, 'user/107', 'users/ascom', ''),
(27, 'user/108', 'users/zvcom', ''),
(28, 'user/109', 'users/fvcom', ''),
(29, 'user/110', 'users/hvcom', ''),
(30, 'user/111', 'users/tbcom', ''),
(31, 'user/112', 'users/frederickorvillegmailcom-0', ''),
(32, 'user/113', 'users/hellobcom', ''),
(33, 'user/114', 'users/dfccom', ''),
(34, 'user/1', 'users/admin', ''),
(35, 'user/115', 'users/uucom', ''),
(36, 'user/116', 'users/richardtester29gmailcom', ''),
(37, 'user/117', 'users/edwardtester99gmailcom', ''),
(38, 'user/118', 'users/emilybronte248gmailcom', ''),
(39, 'user/119', 'users/aacom', ''),
(40, 'user/120', 'users/cdcom', ''),
(41, 'user/121', 'users/testergmailcom', ''),
(42, 'user/122', 'users/hwehjhsjfcom', ''),
(43, 'user/123', 'users/asdadzfdcom', ''),
(44, 'node/22', 'content/terms', ''),
(45, 'node/23', 'content/privacy-policy', ''),
(47, 'user/125', 'users/test123rtttcom', ''),
(48, 'user/126', 'users/asddsgciom', ''),
(49, 'user/127', 'users/asimammargmailcom', ''),
(50, 'user/128', 'users/aliakram14kyahoocom', ''),
(51, 'user/129', 'users/adnannustseecsgmailcom', ''),
(52, 'user/107', 'users/kousaraslamvizteckcom', ''),
(53, 'user/108', 'users/tennismtravyahoocom', ''),
(54, 'user/109', 'users/frederickorvillegmailcom-1', ''),
(55, 'user/110', 'users/gilinfinitudeinccom', ''),
(56, 'user/111', 'users/avcom', ''),
(57, 'node/24', 'content/access-denied', ''),
(58, 'user/112', 'users/sdgcom', ''),
(59, 'node/25', 'content/lorem-ipsum', ''),
(60, 'node/26', 'content/pellentesque', ''),
(61, 'user/113', 'users/adnannustseecsgmailcom-0', ''),
(62, 'user/114', 'users/angeleyz16gmailcom', ''),
(63, 'node/27', 'content/solutions', ''),
(64, 'node/28', 'content/individual-rmi-plan', ''),
(65, 'node/29', 'content/family-rmi-plan', ''),
(66, 'node/30', 'content/business-rmi-plan', ''),
(67, 'node/31', 'content/news', ''),
(68, 'node/32', 'content/help', ''),
(69, 'user/115', 'users/horormicom', ''),
(70, 'user/116', 'users/mariatravalini77hotmailcom', ''),
(71, 'user/117', 'users/frxdocgmailcom', ''),
(72, 'user/118', 'users/gricotrustecom', ''),
(73, 'user/119', 'users/frxdocyahoocom', ''),
(74, 'user/120', 'users/johntestmailcom', ''),
(75, 'user/121', 'users/clarktestmailcom', ''),
(76, 'user/122', 'users/adrianlancerdevnullmailcouk', ''),
(77, 'user/123', 'users/infoinfinitudeinccom', ''),
(78, 'user/124', 'users/keremy33hotmailcom', ''),
(79, 'user/125', 'users/richclay90hotmailcom', ''),
(80, 'user/126', 'users/cherryblosmlivecouk', ''),
(81, 'user/127', 'users/jenniferpetkovyahoocouk', ''),
(82, 'user/128', 'users/oliviapetkovyahoocouk', ''),
(83, 'user/129', 'users/manscipticgmailcom', ''),
(84, 'user/130', 'users/gigelbumbaruyahoocom', ''),
(85, 'user/131', 'users/stpleingooglemailcom', ''),
(86, 'user/132', 'users/paulvdwbigpondcom', ''),
(87, 'user/133', 'users/aaa3000300hotmailcom', ''),
(88, 'user/134', 'users/margotblumenthalhotmailcom', ''),
(89, 'user/135', 'users/klocktornetsblommorhotmailcom', ''),
(90, 'user/136', 'users/tekyzincgmailcom', ''),
(91, 'user/137', 'users/tinapari1981yahoocom', ''),
(92, 'user/138', 'users/amyross123hotmailcom', ''),
(93, 'user/139', 'users/vpudazey1970', ''),
(94, 'user/140', 'users/jojo10070yahoocouk', ''),
(95, 'user/141', 'users/jschellercsoftwarecom', ''),
(96, 'user/142', 'users/mgarcia914gmailcom', ''),
(97, 'user/143', 'users/beaudetclaliveca', ''),
(98, 'user/144', 'users/xwurageia88', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `pass` varchar(32) NOT NULL DEFAULT '',
  `mail` varchar(64) DEFAULT '',
  `mode` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) DEFAULT '0',
  `threshold` tinyint(4) DEFAULT '0',
  `theme` varchar(255) NOT NULL DEFAULT '',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `signature_format` smallint(6) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `login` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(8) DEFAULT NULL,
  `language` varchar(12) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `init` varchar(64) DEFAULT '',
  `data` longtext,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=145 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `name`, `pass`, `mail`, `mode`, `sort`, `threshold`, `theme`, `signature`, `signature_format`, `created`, `access`, `login`, `status`, `timezone`, `language`, `picture`, `init`, `data`) VALUES
(0, '', '', '', 0, 0, 0, '', '', 0, 0, 0, 0, 0, NULL, '', '', '', NULL),
(1, 'admin', 'b59c67bf196a4758191e42f76670ceba', 'yasir.farooqui@vizteck.com', 0, 0, 0, '', '', 0, 1338534886, 1361428158, 1361428158, 1, '18000', '', '', 'qamar.munir@vizteck.com', 'a:3:{s:13:"form_build_id";s:37:"form-22f086e1df2dc69ad39a44c0ca5bdea3";s:8:"old_pass";s:4:"1111";s:7:"contact";i:0;}'),
(89, 'New Test', '4b30918a92a0357c73a63de35bc3eec4', 'sdjlkl@fghgh', 0, 0, 0, '', '', 0, 1343819082, 0, 0, 1, '18000', '', '', 'sdjlkl@fghgh', 'a:0:{}'),
(90, 'sat', 'd34ba807e60faca55d734ab9e9e1c5fe', 'asdfdsaf@dfghdhdf', 0, 0, 0, '', '', 0, 1343819172, 0, 0, 1, '18000', '', '', 'asdfdsaf@dfghdhdf', 'a:0:{}'),
(86, 'edward tester', '4124bc0a9335c27f086f24ba207a4912', 'edwardtester99@gmail.com', 0, 0, 0, '', '', 0, 1342610810, 1355877461, 1355877461, 1, '18000', '', '', 'edwardtester99@gmail.com', 'a:1:{s:13:"form_build_id";s:37:"form-c82f4a357e810662f7309a6c71e988bb";}'),
(87, 'emily bronte', '4124bc0a9335c27f086f24ba207a4912', 'emilybronte248@gmail.com', 0, 0, 0, '', '', 0, 1342610869, 1346652179, 1346652179, 1, '18000', '', '', 'emilybronte248@gmail.com', 'a:1:{s:13:"form_build_id";s:37:"form-38edcc9a6f8dafb4a641ab36640a01f2";}'),
(88, 'richard tester', '4124bc0a9335c27f086f24ba207a4912', 'richardtester29@gmail.com', 0, 0, 0, '', '', 0, 1342610914, 1348748884, 1348747817, 1, '18000', '', '', 'richardtester29@gmail.com', 'a:1:{s:13:"form_build_id";s:37:"form-af2be797384422eaeaa1d985de46c816";}'),
(91, 'NewTest', 'f1ebc0fdb059bf147a7e3d8a460bff63', 'muhammad.usman@vizteck.com', 0, 0, 0, '', '', 0, 1343819307, 1343990533, 1343819642, 1, '18000', '', '', 'muhammad.usman@vizteck.com', 'a:0:{}'),
(92, 'zuhaib45', 'c20ad4d76fe97759aa27a0c99bff6710', 'zuhaib.naseer@vizteck.com', 0, 0, 0, '', '', 0, 1343986154, 1344231677, 1343990186, 1, '18000', '', '', 'zuhaib.naseer@vizteck.com', 'a:0:{}'),
(94, 'kamran.khan99', '523af537946b79c4f8369ed39ba78605', 'A@b.com', 0, 0, 0, '', '', 0, 1344234564, 1344249178, 1344247892, 1, '18000', '', '', 'A@b.com', 'a:1:{s:13:"form_build_id";s:37:"form-794f271cf471a7117633b0cab0dcf40f";}'),
(95, 'kami', '0cc175b9c0f1b6a831c399e269772661', 'ab@b.com', 0, 0, 0, '', '', 0, 1344236160, 1344236881, 1344236160, 1, '18000', '', '', 'ab@b.com', 'a:0:{}'),
(96, 'abc', '0cc175b9c0f1b6a831c399e269772661', 'usm_usman@hotmail.com', 0, 0, 0, '', '', 0, 1344249224, 1345031170, 1344249224, 1, '18000', '', '', 'usm_usman@hotmail.com', 'a:0:{}'),
(97, 'tester132', '0e7322608a506703b41275f24b39a7ea', 'tester132@RT.COM', 0, 0, 0, '', '', 0, 1344251189, 1344251189, 1344251189, 1, '18000', '', '', 'tester132@RT.COM', 'a:0:{}'),
(98, 'dsareen@tekyz.com', '81dc9bdb52d04dc20036dbd8313ed055', 'dsareen@tekyz.com', 0, 0, 0, '', '', 0, 1344254120, 1344254120, 0, 1, '18000', '', '', 'dsareen@tekyz.com', 'a:0:{}'),
(101, 'a@a.com', '0cc175b9c0f1b6a831c399e269772661', 'a@a.com', 0, 0, 0, '', '', 0, 1345006444, 1345006444, 0, 1, '18000', '', '', 'a@a.com', 'a:0:{}'),
(100, 'gil_ortega@msn.com', 'dc085613e1d77823f2e2bba114fba718', 'gil_ortega@msn.com', 0, 0, 0, '', '', 0, 1344449071, 1351973363, 1351194030, 1, '18000', '', '', 'gil_ortega@msn.com', 'a:3:{s:8:"old_pass";s:10:"sky7777777";s:7:"contact";b:0;s:13:"form_build_id";s:37:"form-5a8518696441c328947101b735719d9c";}'),
(102, 'test@gmail.com', '0cc175b9c0f1b6a831c399e269772661', 'test@gmail.com', 0, 0, 0, '', '', 0, 1345186421, 1361352279, 1361183510, 1, '18000', '', '', 'test@gmail.com', 'a:0:{}'),
(103, 'maria@tekyz.com', '1dfb6b98aef3416e03d50fd2fb525600', 'maria@tekyz.com', 0, 0, 0, '', '', 0, 1345472777, 1352954022, 1352954022, 1, '18000', '', '', 'maria@tekyz.com', 'a:0:{}'),
(104, 'a@d.com', '0cc175b9c0f1b6a831c399e269772661', 'a@d.com', 0, 0, 0, '', '', 0, 1346393799, 1346393799, 0, 1, '18000', '', '', 'a@d.com', 'a:0:{}'),
(105, 't@test.com', 'c4ca4238a0b923820dcc509a6f75849b', 't@test.com', 0, 0, 0, '', '', 0, 1346399348, 1346399348, 0, 1, '18000', '', '', 't@test.com', 'a:0:{}'),
(106, 'a@test.com', '0cc175b9c0f1b6a831c399e269772661', 'a@test.com', 0, 0, 0, '', '', 0, 1346409781, 1346409781, 0, 1, '18000', '', '', 'a@test.com', 'a:0:{}'),
(107, 'kousar.aslam@vizteck.com', '0cc175b9c0f1b6a831c399e269772661', 'kousar.aslam@vizteck.com', 0, 0, 0, '', '', 0, 1346676671, 1346820668, 1346676671, 1, '18000', '', '', 'kousar.aslam@vizteck.com', 'a:0:{}'),
(108, 'Tennismtrav@yahoo.com', '1dfb6b98aef3416e03d50fd2fb525600', 'Tennismtrav@yahoo.com', 0, 0, 0, '', '', 0, 1346704540, 1346704540, 1346704540, 1, '-25200', '', '', 'Tennismtrav@yahoo.com', 'a:0:{}'),
(109, 'frederickorville@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 'frederickorville@gmail.com', 0, 0, 0, '', '', 0, 1346738059, 1347348779, 1347348779, 1, '18000', '', '', 'frederickorville@gmail.com', 'a:0:{}'),
(110, 'gil@infinitudeinc.com', 'dc085613e1d77823f2e2bba114fba718', 'gil@infinitudeinc.com', 0, 0, 0, '', '', 0, 1347135924, 1353359488, 1352262803, 1, '-25200', '', '', 'gil@infinitudeinc.com', 'a:3:{s:8:"old_pass";s:10:"sky7777777";s:7:"contact";b:0;s:13:"form_build_id";s:37:"form-f32de591ed28e6249830677522ae34ce";}'),
(111, 'a@v.com', '0cc175b9c0f1b6a831c399e269772661', 'a@v.com', 0, 0, 0, '', '', 0, 1347362210, 1347362210, 0, 1, '18000', '', '', 'a@v.com', 'a:0:{}'),
(112, 's@dg.com', '4124bc0a9335c27f086f24ba207a4912', 's@dg.com', 0, 0, 0, '', '', 0, 1348117263, 1348126289, 1348117263, 1, '18000', '', '', 's@dg.com', 'a:2:{s:8:"old_pass";s:1:"a";s:13:"form_build_id";s:37:"form-417799a0fc35d8e64efd55024fe7d2c3";}'),
(113, 'adnan.nustseecs@gmail.com', 'dc61bca8bfb8305a77c0e591191d48fc', 'adnan.nustseecs@gmail.com', 0, 0, 0, '', '', 0, 1349237516, 1353060944, 1353059259, 1, '18000', '', '', 'adnan.nustseecs@gmail.com', 'a:0:{}'),
(114, 'angel.eyz16@gmail.com', 'dc61bca8bfb8305a77c0e591191d48fc', 'angel.eyz16@gmail.com', 0, 0, 0, '', '', 0, 1349239321, 1349239321, 0, 1, '18000', '', '', 'angel.eyz16@gmail.com', 'a:0:{}'),
(115, 'horo@rmi.com', '0cc175b9c0f1b6a831c399e269772661', 'horo@rmi.com', 0, 0, 0, '', '', 0, 1350994224, 1351599468, 1350994224, 1, '18000', '', '', 'horo@rmi.com', 'a:1:{s:7:"contact";i:1;}'),
(116, 'mariatravalini77@hotmail.com', 'ce0b80afc7080f7d292bdee0d64b3385', 'mariatravalini77@hotmail.com', 0, 0, 0, '', '', 0, 1351058818, 1351060537, 1351058819, 1, '-25200', '', '', 'mariatravalini77@hotmail.com', 'a:1:{s:7:"contact";i:1;}'),
(117, 'frxdoc@gmail.com', '66f089bd00bfd5a0e3d5607b507c176b', 'frxdoc@gmail.com', 0, 0, 0, '', '', 0, 1351973583, 1351977201, 1351973583, 1, '-25200', '', '', 'frxdoc@gmail.com', 'a:1:{s:7:"contact";i:1;}'),
(118, 'grico@truste.com', '1a3b07b8b61c2c1e1fb7289691adf488', 'grico@truste.com', 0, 0, 0, '', '', 0, 1354640854, 1354643066, 1354640854, 1, '-28800', '', '', 'grico@truste.com', 'a:1:{s:7:"contact";i:1;}'),
(119, 'frxdoc@yahoo.com', 'f698064cac5ee49376b4f3ea00e5aaf3', 'frxdoc@yahoo.com', 0, 0, 0, '', '', 0, 1355586545, 1355877332, 1355592307, 1, '18000', '', '', 'frxdoc@yahoo.com', 'a:1:{s:7:"contact";i:1;}'),
(120, 'john@testmail.com', '0cc175b9c0f1b6a831c399e269772661', 'john@testmail.com', 0, 0, 0, '', '', 0, 1356343999, 1356343999, 1356343999, 1, '18000', '', '', 'john@testmail.com', 'a:1:{s:7:"contact";i:1;}'),
(121, 'clark@testmail.com', '0cc175b9c0f1b6a831c399e269772661', 'clark@testmail.com', 0, 0, 0, '', '', 0, 1356344458, 1356344458, 0, 1, '18000', '', '', 'clark@testmail.com', 'a:1:{s:7:"contact";i:1;}'),
(122, 'adrian.lancer@devnullmail.co.uk', '8b84f3c44adbfaec270691fdb907750b', 'adrian.lancer@devnullmail.co.uk', 0, 0, 0, '', '', 0, 1357846351, 1357848173, 1357846351, 1, '18000', '', '', 'adrian.lancer@devnullmail.co.uk', 'a:1:{s:7:"contact";i:1;}'),
(123, 'info@infinitudeinc.com', 'f698064cac5ee49376b4f3ea00e5aaf3', 'info@infinitudeinc.com', 0, 0, 0, '', '', 0, 1358601625, 1361198796, 1359305186, 1, '18000', '', '', 'info@infinitudeinc.com', 'a:1:{s:7:"contact";i:1;}'),
(124, 'keremy33@hotmail.com', '04eeade12c8ff55aa7c263d23d513399', 'keremy33@hotmail.com', 0, 0, 0, '', '', 0, 1358624809, 1358624809, 0, 1, '18000', '', '', 'keremy33@hotmail.com', 'a:1:{s:7:"contact";i:1;}'),
(125, 'richclay90@hotmail.com', '2d9f60aab7daeb89d814188a04ff44eb', 'richclay90@hotmail.com', 0, 0, 0, '', '', 0, 1358692245, 1358692245, 0, 1, '18000', '', '', 'richclay90@hotmail.com', 'a:1:{s:7:"contact";i:1;}'),
(126, 'cherryblosm@live.co.uk', '037cd203dd5dcc24c57dd113d29694be', 'cherryblosm@live.co.uk', 0, 0, 0, '', '', 0, 1358761385, 1358761385, 0, 1, '18000', '', '', 'cherryblosm@live.co.uk', 'a:1:{s:7:"contact";i:1;}'),
(127, 'jenniferpetkov@yahoo.co.uk', 'a6bfc7eb99d6429172acb3989babc35d', 'jenniferpetkov@yahoo.co.uk', 0, 0, 0, '', '', 0, 1358871824, 1358871824, 0, 1, '18000', '', '', 'jenniferpetkov@yahoo.co.uk', 'a:1:{s:7:"contact";i:1;}'),
(128, 'oliviapetkov@yahoo.co.uk', '5e37f234c934bee6854d3adb40f9a6d1', 'oliviapetkov@yahoo.co.uk', 0, 0, 0, '', '', 0, 1358872152, 1358872152, 0, 1, '18000', '', '', 'oliviapetkov@yahoo.co.uk', 'a:1:{s:7:"contact";i:1;}'),
(129, 'mansciptic@gmail.com', 'd3713af1d21c9c9312c079ebdf6890a6', 'mansciptic@gmail.com', 0, 0, 0, '', '', 0, 1358917659, 1358917659, 0, 1, '18000', '', '', 'mansciptic@gmail.com', 'a:1:{s:7:"contact";i:1;}'),
(130, 'gigelbumbaru@yahoo.com', 'e8f64b9dface96d54d04a7713a24cc7d', 'gigelbumbaru@yahoo.com', 0, 0, 0, '', '', 0, 1358954386, 1358954386, 0, 1, '18000', '', '', 'gigelbumbaru@yahoo.com', 'a:1:{s:7:"contact";i:1;}'),
(131, 'st.plein@googlemail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'st.plein@googlemail.com', 0, 0, 0, '', '', 0, 1358967233, 1358967233, 0, 1, '18000', '', '', 'st.plein@googlemail.com', 'a:1:{s:7:"contact";i:1;}'),
(132, 'paulvdw@bigpond.com', 'a2bd9828fc252bb63677c0e8899384f0', 'paulvdw@bigpond.com', 0, 0, 0, '', '', 0, 1359066896, 1359066896, 0, 1, '18000', '', '', 'paulvdw@bigpond.com', 'a:1:{s:7:"contact";i:1;}'),
(133, 'aaa3000300@hotmail.com', '68e3ca71e79bf7efd8554620e26462d1', 'aaa3000300@hotmail.com', 0, 0, 0, '', '', 0, 1359070699, 1359070699, 0, 1, '18000', '', '', 'aaa3000300@hotmail.com', 'a:1:{s:7:"contact";i:1;}'),
(134, 'margot_blumenthal@hotmail.com', '42910974387b74650cfd5320e65b8cba', 'margot_blumenthal@hotmail.com', 0, 0, 0, '', '', 0, 1359227990, 1359227990, 0, 1, '18000', '', '', 'margot_blumenthal@hotmail.com', 'a:1:{s:7:"contact";i:1;}'),
(135, 'klocktornetsblommor@hotmail.com', 'a49091139a1dfcf7faccb45bfb85012d', 'klocktornetsblommor@hotmail.com', 0, 0, 0, '', '', 0, 1359755676, 1359755676, 0, 1, '18000', '', '', 'klocktornetsblommor@hotmail.com', 'a:1:{s:7:"contact";i:1;}'),
(136, 'tekyzinc@gmail.com', '23bd6fe85f1de3c16bf6263dff82a2d2', 'tekyzinc@gmail.com', 0, 0, 0, '', '', 0, 1359945163, 1359945163, 0, 1, '18000', '', '', 'tekyzinc@gmail.com', 'a:1:{s:7:"contact";i:1;}'),
(137, 'tina_pari1981@yahoo.com', 'ba1c8851dc41ed544a93b04bc60dc585', 'tina_pari1981@yahoo.com', 0, 0, 0, '', '', 0, 1360532814, 1360532814, 0, 1, '18000', '', '', 'tina_pari1981@yahoo.com', 'a:1:{s:7:"contact";i:1;}'),
(138, 'amyross123@hotmail.com', '5deb91389965b1e8d2ea7e953e5a46e0', 'amyross123@hotmail.com', 0, 0, 0, '', '', 0, 1360791526, 1360791526, 0, 1, '18000', '', '', 'amyross123@hotmail.com', 'a:1:{s:7:"contact";i:1;}'),
(139, 'vpudazey1970', '6b1cb3e0f8e92b2330f4f594926f4acc', 'fruaaled1970@gmail.com', 0, 0, 0, '', '', 0, 1360801575, 1360801575, 1360801575, 1, '18000', '', '', 'fruaaled1970@gmail.com', 'a:1:{s:7:"contact";i:1;}'),
(140, 'jojo10070@yahoo.co.uk', '026f8e52e2cf5fa9bb72255d7600e3ba', 'jojo10070@yahoo.co.uk', 0, 0, 0, '', '', 0, 1360848968, 1360848968, 0, 1, '18000', '', '', 'jojo10070@yahoo.co.uk', 'a:1:{s:7:"contact";i:1;}'),
(141, 'jscheller@csoftware.com', '75b779f89fc678b90a253fc29547bb68', 'jscheller@csoftware.com', 0, 0, 0, '', '', 0, 1360871594, 1360873320, 1360873320, 1, '18000', '', '', 'jscheller@csoftware.com', 'a:3:{s:7:"contact";i:1;s:8:"old_pass";s:9:"register1";s:13:"form_build_id";s:37:"form-1fc65aede89d9b48625e565ea7cbd16d";}'),
(142, 'mgarcia914@gmail.com', 'b743fed629b635d4538b56ea3ad3064b', 'mgarcia914@gmail.com', 0, 0, 0, '', '', 0, 1361040446, 1361040446, 0, 1, '18000', '', '', 'mgarcia914@gmail.com', 'a:1:{s:7:"contact";i:1;}'),
(143, 'beaudetcla@live.ca', '1202f09948b22c47d09d62670446db3c', 'beaudetcla@live.ca', 0, 0, 0, '', '', 0, 1361133884, 1361133884, 0, 1, '18000', '', '', 'beaudetcla@live.ca', 'a:1:{s:7:"contact";i:1;}'),
(144, 'xwurageia88', '6b1cb3e0f8e92b2330f4f594926f4acc', 'annaholms34@gmail.com', 0, 0, 0, '', '', 0, 1361182258, 1361182258, 1361182258, 1, '18000', '', '', 'annaholms34@gmail.com', 'a:1:{s:7:"contact";i:1;}');

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE IF NOT EXISTS `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

CREATE TABLE IF NOT EXISTS `variable` (
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `variable`
--

INSERT INTO `variable` (`name`, `value`) VALUES
('theme_default', 's:3:"rmi";'),
('filter_html_1', 'i:1;'),
('node_options_forum', 'a:1:{i:0;s:6:"status";}'),
('drupal_private_key', 's:64:"5d4c2b2f16f256d866d6186c5985e30cd86d601826ad50bf1a914a3058b688a5";'),
('menu_masks', 'a:26:{i:0;i:120;i:1;i:92;i:2;i:90;i:3;i:62;i:4;i:61;i:5;i:59;i:6;i:46;i:7;i:45;i:8;i:31;i:9;i:30;i:10;i:29;i:11;i:28;i:12;i:24;i:13;i:22;i:14;i:21;i:15;i:15;i:16;i:14;i:17;i:12;i:18;i:11;i:19;i:10;i:20;i:7;i:21;i:6;i:22;i:5;i:23;i:3;i:24;i:2;i:25;i:1;}'),
('install_task', 's:4:"done";'),
('menu_expanded', 'a:0:{}'),
('site_name', 's:16:"Register My Info";'),
('site_mail', 's:12:"info@rmi.com";'),
('date_default_timezone', 's:5:"18000";'),
('user_email_verification', 'i:0;'),
('clean_url', 's:1:"1";'),
('install_time', 'i:1338534937;'),
('node_options_page', 'a:1:{i:0;s:6:"status";}'),
('comment_page', 'i:0;'),
('theme_settings', 'a:1:{s:21:"toggle_node_info_page";b:0;}'),
('drupal_http_request_fails', 'b:0;'),
('css_js_query_string', 's:20:"HuSQd0VDb3gRC2EJ5vae";'),
('install_profile', 's:7:"default";'),
('update_last_check', 'i:1357717842;'),
('file_directory_temp', 's:3:"tmp";'),
('javascript_parsed', 'a:0:{}'),
('cron_last', 'i:1339510898;'),
('webform_addmore_1', 'a:6:{s:5:"label";s:8:"Add More";s:0:"";i:0;i:5;i:1;i:4;N;i:7;i:1;i:16;N;}'),
('services_use_content_permissions', 'i:1;'),
('imagefield_thumb_size', 's:5:"66x47";'),
('site_slogan', 's:0:"";'),
('site_mission', 's:0:"";'),
('site_footer', 's:126:"<ul>\r\n<li class="first"><a href="/content/privacy-policy">Privacy</a></li>\r\n<li><a href="/content/terms">Terms</a></li>\r\n</ul>";'),
('anonymous', 's:9:"Anonymous";'),
('site_frontpage', 's:7:"node/15";'),
('update_check_frequency', 's:1:"7";'),
('update_notification_threshold', 's:3:"all";'),
('logintoboggan_login_with_email', 's:1:"1";'),
('logintoboggan_confirm_email_at_registration', 's:1:"0";'),
('logintoboggan_pre_auth_role', 's:1:"2";'),
('logintoboggan_purge_unvalidated_user_interval', 's:1:"0";'),
('logintoboggan_immediate_login_on_register', 'i:1;'),
('logintoboggan_redirect_on_register', 's:0:"";'),
('logintoboggan_redirect_on_confirm', 's:0:"";'),
('logintoboggan_override_destination_parameter', 'i:1;'),
('site_403', 's:0:"";'),
('logintoboggan_login_successful_message', 's:1:"0";'),
('logintoboggan_minimum_password_length', 's:1:"0";'),
('pathauto_modulelist', 'a:3:{i:0;s:4:"node";i:1;s:4:"user";i:2;s:8:"taxonomy";}'),
('pathauto_taxonomy_supportsfeeds', 's:6:"0/feed";'),
('pathauto_taxonomy_pattern', 's:34:"category/[vocab-raw]/[catpath-raw]";'),
('pathauto_taxonomy_bulkupdate', 'b:0;'),
('pathauto_taxonomy_applytofeeds', 'b:0;'),
('pathauto_taxonomy_2_pattern', 's:0:"";'),
('pathauto_taxonomy_1_pattern', 's:0:"";'),
('pathauto_ignore_words', 's:108:"a,an,as,at,before,but,by,for,from,is,in,into,like,of,off,on,onto,per,since,than,the,this,that,to,up,via,with";'),
('pathauto_indexaliases', 'b:0;'),
('pathauto_indexaliases_bulkupdate', 'b:0;'),
('pathauto_max_component_length', 's:3:"100";'),
('pathauto_max_length', 's:3:"100";'),
('pathauto_node_bulkupdate', 'b:0;'),
('pathauto_node_forum_pattern', 's:0:"";'),
('pathauto_node_image_pattern', 's:0:"";'),
('pathauto_node_page_pattern', 's:0:"";'),
('pathauto_node_pattern', 's:19:"content/[title-raw]";'),
('pathauto_node_story_pattern', 's:0:"";'),
('pathauto_punctuation_quotes', 'i:0;'),
('pathauto_separator', 's:1:"-";'),
('pathauto_update_action', 's:1:"2";'),
('pathauto_user_bulkupdate', 'b:0;'),
('pathauto_user_pattern', 's:16:"users/[user-raw]";'),
('pathauto_user_supportsfeeds', 'N;'),
('pathauto_verbose', 'b:0;'),
('pathauto_node_applytofeeds', 's:0:"";'),
('pathauto_punctuation_hyphen', 'i:1;'),
('admin_theme', 's:7:"garland";'),
('node_admin_theme', 'i:1;'),
('change_password_tab_url', 's:6:"chgpwd";'),
('user_register', 's:1:"1";'),
('user_registration_help', 's:0:"";'),
('user_mail_register_admin_created_subject', 's:52:"An administrator created an account for you at !site";'),
('user_mail_register_admin_created_body', 's:468:"!username,\r\n\r\nA site administrator at !site has created an account for you. You may now log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\n\r\n--  !site team";'),
('user_mail_register_no_approval_required_subject', 's:16:"Welcome to !site";'),
('user_mail_register_no_approval_required_body', 's:102:"Dear !profile_first_name !profile_last_name,\r\n\r\nThank you for registering at !site. \r\n\r\n--  !site team";'),
('configurable_timezones', 's:1:"1";'),
('date_first_day', 's:1:"0";'),
('date_format_short', 's:5:"m-d-Y";'),
('date_format_short_custom', 's:5:"m-d-Y";'),
('user_mail_register_pending_approval_subject', 's:63:"Account details for !username at !site (pending admin approval)";'),
('user_mail_register_pending_approval_body', 's:273:"!username,\r\n\r\nThank you for registering at !site. Your application for an account is currently pending approval. Once it has been approved, you will receive another e-mail containing information about how to log in, set your password, and other details.\r\n\r\n\r\n--  !site team";'),
('user_mail_password_reset_subject', 's:52:"Replacement login information for !username at !site";'),
('user_mail_password_reset_body', 's:419:"!username,\r\n\r\nA request to reset the password for your account has been made at !site.\r\n\r\nYou may now log in to !uri_brief by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once. It expires after one day and nothing will happen if it''s not used.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.";'),
('user_mail_status_activated_notify', 'i:1;'),
('user_mail_status_activated_subject', 's:49:"Account details for !username at !site (approved)";'),
('user_mail_status_activated_body', 's:434:"!username,\r\n\r\nYour account at !site has been activated.\r\n\r\nYou may now log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\nOnce you have set your own password, you will be able to log in to !login_uri in the future using:\r\n\r\nusername: !username\r\n";'),
('user_mail_status_blocked_notify', 'i:0;'),
('user_mail_status_blocked_subject', 's:48:"Account details for !username at !site (blocked)";'),
('user_mail_status_blocked_body', 's:53:"!username,\r\n\r\nYour account on !site has been blocked.";'),
('user_mail_status_deleted_notify', 'i:0;'),
('user_mail_status_deleted_subject', 's:48:"Account details for !username at !site (deleted)";'),
('user_mail_status_deleted_body', 's:53:"!username,\r\n\r\nYour account on !site has been deleted.";'),
('user_signatures', 's:1:"0";'),
('user_pictures', 's:1:"0";'),
('user_picture_path', 's:8:"pictures";'),
('user_picture_default', 's:0:"";'),
('user_picture_dimensions', 's:5:"85x85";'),
('user_picture_file_size', 's:2:"30";'),
('user_picture_guidelines', 's:0:"";'),
('date_format_medium', 's:14:"D, m/d/Y - H:i";'),
('date_format_medium_custom', 's:14:"D, m/d/Y - H:i";'),
('date_format_long', 's:15:"l, F j, Y - H:i";'),
('date_format_long_custom', 's:15:"l, F j, Y - H:i";'),
('content_access_settings', 'a:4:{s:4:"view";a:1:{s:7:"webform";a:1:{i:0;i:2;}}s:8:"view_own";a:1:{s:7:"webform";a:2:{i:0;i:1;i:1;i:2;}}s:8:"per_node";a:1:{s:7:"webform";i:0;}s:8:"priority";a:1:{s:7:"webform";s:1:"0";}}'),
('colorbox_path', 's:28:"sites/all/libraries/colorbox";'),
('colorbox_compression_type', 's:3:"min";'),
('colorbox_login', 'i:0;'),
('colorbox_login_links', 's:1:"0";'),
('colorbox_load', 'i:1;'),
('colorbox_inline', 'i:0;'),
('colorbox_style', 's:7:"default";'),
('colorbox_custom_settings_activate', 's:1:"0";'),
('colorbox_transition_type', 's:7:"elastic";'),
('colorbox_transition_speed', 's:3:"350";'),
('colorbox_opacity', 's:4:"0.90";'),
('colorbox_text_current', 's:20:"{current} of {total}";'),
('colorbox_text_previous', 's:7:"« Prev";'),
('colorbox_text_next', 's:7:"Next »";'),
('colorbox_text_close', 's:5:"Close";'),
('colorbox_overlayclose', 'i:1;'),
('colorbox_maxwidth', 's:4:"100%";'),
('colorbox_maxheight', 's:4:"100%";'),
('colorbox_slideshow', 's:1:"0";'),
('colorbox_slideshowauto', 'i:1;'),
('colorbox_slideshowspeed', 's:4:"2500";'),
('colorbox_text_start', 's:15:"start slideshow";'),
('colorbox_text_stop', 's:14:"stop slideshow";'),
('colorbox_title_trim', 's:1:"0";'),
('colorbox_title_trim_length', 's:2:"75";'),
('colorbox_pages', 's:51:"admin*\r\nimg_assist*\r\nimce*\r\nnode/add/*\r\nnode/*/edit";'),
('jquery_update_replace', 'b:1;'),
('nice_menus_name_1', 's:14:"Drop Down Menu";'),
('nice_menus_menu_1', 's:15:"primary-links:0";'),
('nice_menus_depth_1', 's:2:"-1";'),
('nice_menus_type_1', 's:4:"down";'),
('menu_default_node_menu', 's:13:"primary-links";'),
('menu_primary_links_source', 's:13:"primary-links";'),
('menu_secondary_links_source', 's:15:"secondary-links";'),
('menu_attributes_title_enable', 'i:0;'),
('menu_attributes_title_default', 's:0:"";'),
('menu_attributes_id_enable', 'i:1;'),
('menu_attributes_id_default', 's:0:"";'),
('menu_attributes_name_enable', 'i:0;'),
('menu_attributes_name_default', 's:0:"";'),
('menu_attributes_rel_enable', 'i:0;'),
('menu_attributes_rel_default', 's:0:"";'),
('menu_attributes_class_enable', 'i:0;'),
('menu_attributes_class_default', 's:0:"";'),
('menu_attributes_style_enable', 'i:1;'),
('menu_attributes_style_default', 's:0:"";'),
('menu_attributes_target_enable', 'i:1;'),
('menu_attributes_target_default', 's:0:"";'),
('menu_attributes_accesskey_enable', 'i:0;'),
('menu_attributes_accesskey_default', 's:0:"";'),
('theme_rmi_settings', 'a:16:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:1;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:13:"toggle_search";i:1;s:14:"toggle_favicon";i:1;s:20:"toggle_primary_links";i:1;s:22:"toggle_secondary_links";i:1;s:12:"default_logo";i:0;s:9:"logo_path";s:32:"sites/default/files/rmi_logo.jpg";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:0;s:12:"favicon_path";s:35:"sites/default/files/rmi_favicon.ico";s:14:"favicon_upload";s:0:"";}'),
('file_directory_path', 's:19:"sites/default/files";'),
('file_downloads', 's:1:"1";');

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary`
--

CREATE TABLE IF NOT EXISTS `vocabulary` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `help` varchar(255) NOT NULL DEFAULT '',
  `relations` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `multiple` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL DEFAULT '',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `list` (`weight`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary_node_types`
--

CREATE TABLE IF NOT EXISTS `vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`,`vid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `watchdog`
--

CREATE TABLE IF NOT EXISTS `watchdog` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `variables` longtext NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `location` text NOT NULL,
  `referer` text,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `webform`
--

CREATE TABLE IF NOT EXISTS `webform` (
  `nid` int(10) unsigned NOT NULL,
  `confirmation` text NOT NULL,
  `confirmation_format` tinyint(4) NOT NULL DEFAULT '0',
  `redirect_url` varchar(255) DEFAULT '<confirmation>',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `teaser` tinyint(4) NOT NULL DEFAULT '0',
  `allow_draft` tinyint(4) NOT NULL DEFAULT '0',
  `auto_save` tinyint(4) NOT NULL DEFAULT '0',
  `submit_notice` tinyint(4) NOT NULL DEFAULT '1',
  `submit_text` varchar(255) DEFAULT NULL,
  `submit_limit` tinyint(4) NOT NULL DEFAULT '-1',
  `submit_interval` int(11) NOT NULL DEFAULT '-1',
  `total_submit_limit` int(11) NOT NULL DEFAULT '-1',
  `total_submit_interval` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webform`
--

INSERT INTO `webform` (`nid`, `confirmation`, `confirmation_format`, `redirect_url`, `status`, `block`, `teaser`, `allow_draft`, `auto_save`, `submit_notice`, `submit_text`, `submit_limit`, `submit_interval`, `total_submit_limit`, `total_submit_interval`) VALUES
(14, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(2, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(3, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(4, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(5, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(6, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(7, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(8, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(9, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(10, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(11, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(12, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(13, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1);

-- --------------------------------------------------------

--
-- Table structure for table `webform_addmore`
--

CREATE TABLE IF NOT EXISTS `webform_addmore` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(11) NOT NULL DEFAULT '0',
  `fieldset_cid` int(11) NOT NULL DEFAULT '0',
  `fieldset_form_key` varchar(255) NOT NULL DEFAULT '',
  `fieldset_name` varchar(255) NOT NULL DEFAULT '',
  `sub_fieldset_cid` int(11) NOT NULL DEFAULT '0',
  `sub_fieldset_form_key` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `webform_addmore`
--

INSERT INTO `webform_addmore` (`id`, `nid`, `fieldset_cid`, `fieldset_form_key`, `fieldset_name`, `sub_fieldset_cid`, `sub_fieldset_form_key`) VALUES
(12, 1, 1, 'information', 'Telephone', 2, 'info'),
(3, 1, 13, 'mail_address', 'Mail Address', 14, 'info'),
(28, 3, 1, 'bank_account', 'Bank Account', 2, 'info'),
(14, 3, 5, 'credit___debit_cards', 'Credit / Debit Cards', 6, 'info'),
(15, 3, 11, 'credit_score', 'Credit Score', 12, 'info'),
(16, 3, 15, 'loans', 'Loans', 16, 'info'),
(17, 4, 7, 'letters_of_recommendation', 'Letters of recommendation', 11, 'info'),
(18, 5, 10, 'implants', 'Implants', 11, 'info'),
(19, 5, 6, 'surgeries', 'Surgeries', 7, 'info'),
(20, 14, 4, 'telephone', 'Telephone ', 5, 'info');

-- --------------------------------------------------------

--
-- Table structure for table `webform_component`
--

CREATE TABLE IF NOT EXISTS `webform_component` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `form_key` varchar(128) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `value` text NOT NULL,
  `extra` text NOT NULL,
  `mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `weight` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webform_component`
--

INSERT INTO `webform_component` (`nid`, `cid`, `pid`, `form_key`, `name`, `type`, `value`, `extra`, `mandatory`, `weight`) VALUES
(14, 5, 4, 'info', 'Info', 'fieldset', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 4),
(14, 6, 5, 'type', 'Type', 'select', '', 'a:14:{s:5:"items";s:35:"Cell|Cell\r\nHome|Home\r\nOffice|Office";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 13),
(14, 3, 0, 'email_address', 'Email address', 'email', '', 'a:10:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 10),
(14, 4, 0, 'telephone', 'Telephone ', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 11),
(14, 1, 0, 'name', 'Name', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 1, 8),
(14, 2, 0, 'address', 'Address', 'textarea', '', 'a:11:{s:13:"title_display";i:0;s:7:"private";i:0;s:9:"resizable";i:1;s:8:"disabled";i:0;s:20:"conditional_operator";s:1:"=";s:4:"cols";s:0:"";s:4:"rows";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 9),
(2, 1, 0, 'dob', 'DOB', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1970";s:8:"end_date";s:11:"Dec 31 2011";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 3),
(2, 2, 0, 'ssn', 'SSN', 'ssn', '', 'a:11:{s:4:"mask";i:0;s:13:"title_display";s:4:"none";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:3:"ssn";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 4),
(3, 1, 0, 'bank_account', 'Bank Account', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 21),
(3, 2, 1, 'info', 'Info', 'fieldset', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 1),
(3, 3, 2, 'account_type_bank', 'Account Type', 'select', '', 'a:14:{s:5:"items";s:73:"Checking|Checking \r\nSavings|Savings\r\nRetirement |Retirement \r\nOther|Other";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 27),
(3, 4, 2, 'account_number_bank', 'Account #', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 28),
(3, 5, 0, 'credit___debit_cards', 'Credit / Debit Cards', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 22),
(3, 8, 6, 'account_type', 'Account Type', 'select', '', 'a:7:{s:5:"items";s:99:"MasterCard|MasterCard\r\nVISA|VISA\r\nAmerican Express|American Express\r\nDiscover|Discover\r\nOther|Other";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 30),
(3, 6, 5, 'info', 'Info', 'fieldset', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 5),
(3, 7, 6, 'expiration_code', 'Expiration Code', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1970";s:8:"end_date";s:11:"Dec 31 2030";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 32),
(3, 9, 6, 'account_', 'Account #', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 31),
(3, 10, 6, 'pin_number', 'PIN Number', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 33),
(3, 11, 0, 'credit_score', 'Credit Score', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 23),
(3, 12, 11, 'info', 'Info', 'fieldset', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 12),
(3, 13, 12, 'date_credit', 'Date', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1970";s:8:"end_date";s:11:"Dec 31 2030";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 35),
(3, 14, 12, 'value', 'Value', 'number', '', 'a:19:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:4:"type";s:9:"textfield";s:8:"decimals";s:0:"";s:9:"separator";s:1:",";s:5:"point";s:1:".";s:6:"unique";i:0;s:7:"integer";i:1;s:20:"conditional_operator";s:1:"=";s:11:"excludezero";i:0;s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:3:"min";s:0:"";s:3:"max";s:0:"";s:4:"step";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 36),
(3, 15, 0, 'loans', 'Loans', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 24),
(4, 1, 0, 'employer', 'Employer', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 15),
(3, 16, 15, 'info', 'Info', 'fieldset', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 16),
(3, 17, 16, 'loan_type', 'Loan Type', 'select', '', 'a:14:{s:5:"items";s:44:"Home|Home\r\nAuto|Auto\r\nBoat|Boat\r\nOther|Other";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 38),
(3, 18, 16, 'date_loan', 'Date', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1970";s:8:"end_date";s:11:"Dec 31 2030";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 39),
(3, 19, 16, 'loan_amount', 'Loan Amount', 'number', '', 'a:19:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:4:"type";s:9:"textfield";s:12:"field_prefix";s:3:"($)";s:8:"decimals";s:0:"";s:9:"separator";s:1:",";s:5:"point";s:1:".";s:6:"unique";i:0;s:7:"integer";i:0;s:20:"conditional_operator";s:1:"=";s:11:"excludezero";i:0;s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:3:"min";s:0:"";s:3:"max";s:0:"";s:4:"step";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 40),
(4, 14, 0, 'cv', 'CV', 'file', '', 'a:10:{s:11:"description";s:63:"Allowed file formats are: .doc , .docx, .pdf (Max. size is 2MB)";s:12:"savelocation";s:2:"cv";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:9:"filtering";a:3:{s:4:"size";s:4:"2048";s:5:"types";a:3:{i:0;s:3:"pdf";i:1;s:3:"doc";i:2;s:4:"docx";}s:13:"addextensions";s:0:"";}s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 20),
(4, 2, 0, 'start_date', 'Start Date', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1940";s:8:"end_date";s:11:"Dec 31 2012";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 16),
(4, 3, 0, 'end_date', 'End Date', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1940";s:8:"end_date";s:11:"Dec 31 2012";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 17),
(4, 12, 0, 'employer_contact_information', 'Employer Contact information', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 18),
(4, 13, 0, 'annual_salary_and_wages', 'Annual salary and wages', 'textarea', '', 'a:11:{s:13:"title_display";i:0;s:7:"private";i:0;s:9:"resizable";i:1;s:8:"disabled";i:0;s:20:"conditional_operator";s:1:"=";s:4:"cols";s:0:"";s:4:"rows";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 19),
(4, 7, 0, 'letters_of_recommendation', 'Letters of recommendation', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 21),
(4, 8, 11, 'date', 'Date', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1940";s:8:"end_date";s:11:"Dec 31 2020";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 23),
(4, 9, 11, 'person', 'Person', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 24),
(4, 10, 11, 'letter', 'Letter', 'file', '', 'a:10:{s:12:"savelocation";s:21:"recommendation_letter";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:9:"filtering";a:3:{s:4:"size";s:4:"2048";s:5:"types";a:0:{}s:13:"addextensions";s:0:"";}s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 25),
(4, 11, 7, 'info', 'Info', 'fieldset', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 10),
(5, 1, 0, 'allergies', 'Allergies', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 15),
(5, 2, 0, 'medications', 'Medications', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 16),
(5, 3, 0, 'family_history', 'Family history', 'textarea', '', 'a:11:{s:13:"title_display";i:0;s:7:"private";i:0;s:9:"resizable";i:1;s:8:"disabled";i:0;s:20:"conditional_operator";s:1:"=";s:4:"cols";s:0:"";s:4:"rows";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 17),
(5, 4, 0, 'smoker___no_smoker', 'Smoker / No Smoker', 'select', '', 'a:14:{s:5:"items";s:34:"Smoker|Smoker\r\nNo Smoker|No Smoker";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:0;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 18),
(5, 5, 0, 'alcohol', 'Alcohol', 'select', '', 'a:14:{s:5:"items";s:51:"Never|Never\r\nOccasionally|Occasionally\r\nDaily|Daily";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 19),
(5, 6, 0, 'surgeries', 'Surgeries', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 20),
(5, 7, 6, 'info', 'Info', 'fieldset', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 6),
(5, 8, 7, 'date_surgeries', 'Date', 'date', '', 'a:8:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1940";s:8:"end_date";s:11:"Dec 31 2012";s:20:"conditional_operator";s:1:"=";}', 0, 23),
(5, 9, 7, 'reason', 'Reason', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 24),
(6, 1, 0, 'expense_type', 'Expense Type', 'select', '', 'a:14:{s:5:"items";s:161:"Mortgage|Mortgage\r\nRent|Rent\r\nAuto|Auto\r\nWater|Water\r\nCable|Cable\r\nPhone|Phone\r\nInternet|Internet\r\nGroceries|Groceries\r\nGas|Gas\r\nChildcare|Childcare\r\nOther|Other";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 4),
(5, 10, 0, 'implants', 'Implants', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 21),
(5, 11, 10, 'info', 'Info', 'fieldset', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 10),
(5, 12, 11, 'date_implants', 'Date', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1970";s:8:"end_date";s:11:"Dec 31 2020";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 26),
(5, 13, 11, 'type', 'Type', 'select', '', 'a:7:{s:5:"items";s:340:"Joint replacement: Shoulder|Joint replacement: Shoulder\r\nJoint replacement: Elbow|Joint replacement: Elbow\r\nJoint replacement: Hip|Joint replacement: Hip\r\nJoint replacement: Knee|Joint replacement: Knee\r\nJoint replacement: Ankle|Joint replacement: Ankle\r\nBreast Augmentation|Breast Augmentation\r\nDental Implants|Dental Implants\r\nOther|Other";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 27),
(9, 3, 0, 'policy_number', 'Policy Number', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 6),
(5, 14, 11, 'manufacturer', 'Manufacturer', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 28),
(7, 1, 0, 'type', 'Type', 'select', '', 'a:14:{s:5:"items";s:51:"Auto Service|Auto Service\r\nRecall|Recall\r\nHome|Home";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 3),
(6, 2, 0, 'amount', 'Amount($)', 'number', '', 'a:19:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:4:"type";s:9:"textfield";s:8:"decimals";s:0:"";s:9:"separator";s:1:",";s:5:"point";s:1:".";s:6:"unique";i:0;s:7:"integer";i:0;s:20:"conditional_operator";s:1:"=";s:11:"excludezero";i:0;s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:3:"min";s:0:"";s:3:"max";s:0:"";s:4:"step";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 5),
(6, 3, 0, 'date_due', 'Date Due', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1970";s:8:"end_date";s:11:"Dec 31 2030";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 6),
(7, 2, 0, 'date', 'Date', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1970";s:8:"end_date";s:11:"Dec 31 2030";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 4),
(8, 1, 0, 'type', 'Type', 'select', '', 'a:7:{s:5:"items";s:50:"Driver license|Driver''s License\r\nPassport|Passport";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 0),
(8, 2, 0, 'date_issued', 'Date Issued', 'date', '', 'a:8:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1940";s:8:"end_date";s:11:"Dec 31 2012";s:20:"conditional_operator";s:1:"=";}', 0, 1),
(8, 3, 0, 'expiration_date', 'Expiration Date', 'date', '', 'a:8:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1940";s:8:"end_date";s:11:"Dec 31 2030";s:20:"conditional_operator";s:1:"=";}', 0, 2),
(8, 4, 0, 'photo', 'Photo', 'file', '', 'a:6:{s:11:"description";s:67:"Allowed file formats are(Max. size is 2MB): .gif , .jpg,.png , .bmp";s:12:"savelocation";s:12:"photo_gov_id";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:9:"filtering";a:3:{s:4:"size";s:4:"2048";s:5:"types";a:4:{i:0;s:3:"gif";i:1;s:3:"jpg";i:2;s:3:"png";i:3;s:3:"bmp";}s:13:"addextensions";s:0:"";}s:20:"conditional_operator";s:1:"=";}', 0, 3),
(8, 5, 0, 'digital', 'Digital', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 4),
(9, 1, 0, 'type', 'Type', 'select', '', 'a:14:{s:5:"items";s:74:"Automobile|Automobile\r\nHome|Home\r\nBusiness|Business\r\nDisability|Disability";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 4),
(9, 2, 0, 'policy', 'Policy', 'file', '', 'a:10:{s:11:"description";s:133:"Allowed file formats are: <strong>.doc , .docx, .pdf, .jpg, .gif, .png, .txt, .html, .xls, .xlsx</strong> <em>(Max. size is 2MB)</em>";s:12:"savelocation";s:6:"policy";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:9:"filtering";a:3:{s:4:"size";s:4:"2048";s:5:"types";a:10:{i:0;s:3:"gif";i:1;s:3:"jpg";i:2;s:3:"png";i:3;s:3:"txt";i:4;s:4:"html";i:5;s:3:"pdf";i:6;s:3:"doc";i:7;s:4:"docx";i:8;s:3:"xls";i:9;s:4:"xlsx";}s:13:"addextensions";s:0:"";}s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 5),
(9, 5, 0, 'notes', 'Notes', 'textarea', '', 'a:11:{s:13:"title_display";i:0;s:7:"private";i:0;s:9:"resizable";i:1;s:8:"disabled";i:0;s:20:"conditional_operator";s:1:"=";s:4:"cols";s:0:"";s:4:"rows";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 7),
(10, 1, 0, 'type', 'Type', 'select', '', 'a:14:{s:5:"items";s:43:"Restaurant|Restaurant\r\nWeb|Web\r\nOther|Other";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 5),
(10, 2, 0, 'name', 'Name', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 6),
(10, 3, 0, 'telephone_number', 'Telephone Number', 'textfield', '', 'a:13:{s:11:"description";s:27:"For example: (999) 999-9999";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 7),
(11, 1, 0, 'product_name', 'Product Name', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 0),
(11, 2, 0, 'date_of_purchase', 'Date of Purchase', 'date', '', 'a:8:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1970";s:8:"end_date";s:11:"Dec 31 2012";s:20:"conditional_operator";s:1:"=";}', 0, 1),
(11, 3, 0, 'warranty', 'Warranty', 'file', '', 'a:5:{s:11:"description";s:138:"Allowed file formats are(Max. size is 2MB): .gif , .jpg,.png , .txt, .pdf , .doc , .docx , .ppt , .pptx , .xls, .xlsx , .rar , .tar , .zip";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:9:"filtering";a:3:{s:4:"size";s:4:"2048";s:5:"types";a:20:{i:0;s:3:"gif";i:1;s:3:"jpg";i:2;s:3:"png";i:3;s:3:"bmp";i:4;s:3:"txt";i:5;s:3:"rtf";i:6;s:4:"html";i:7;s:3:"odf";i:8;s:3:"pdf";i:9;s:3:"doc";i:10;s:4:"docx";i:11;s:3:"ppt";i:12;s:4:"pptx";i:13;s:3:"xls";i:14;s:4:"xlsx";i:15;s:3:"xml";i:16;s:2:"gz";i:17;s:3:"rar";i:18;s:3:"tar";i:19;s:3:"zip";}s:13:"addextensions";s:0:"";}s:20:"conditional_operator";s:1:"=";}', 0, 2),
(11, 4, 0, 'manual_link', 'Manual Link', 'textfield', '', 'a:6:{s:11:"description";s:36:"(For example http://www.example.com)";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 3),
(12, 1, 0, 'type', 'Type', 'select', '', 'a:14:{s:5:"items";s:45:"Room|Room\r\nFurniture |Furniture \r\nOther|Other";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 3),
(12, 2, 0, 'photo', 'Photo', 'file', '', 'a:10:{s:11:"description";s:66:"Allowed file formats are(Max. size is 2MB): .gif, .jpg, .png, .bmp";s:12:"savelocation";s:19:"photo-home-registry";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:9:"filtering";a:3:{s:4:"size";s:4:"2048";s:5:"types";a:4:{i:0;s:3:"gif";i:1;s:3:"jpg";i:2;s:3:"png";i:3;s:3:"bmp";}s:13:"addextensions";s:0:"";}s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 4),
(13, 1, 0, 'type', 'Type', 'select', '', 'a:7:{s:5:"items";s:83:"Facebook|Facebook\r\nTwitter|Twitter\r\nLinkedin|Linkedin\r\nPinterest|Pinterest\r\nWeb|Web";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 0),
(13, 2, 0, 'user_id', 'User ID', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 1),
(13, 3, 0, 'password', 'Password', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 2),
(14, 8, 5, 'telephone_number', 'Telephone Number', 'textfield', '', 'a:13:{s:11:"description";s:28:"For Example : (999) 999-9999";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 14),
(14, 10, 5, 'telephone_title', 'Telephone Title', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 12),
(2, 3, 0, 'personal_data_title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 2),
(3, 20, 0, 'financial_title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 20),
(3, 21, 2, 'account_title', 'Bank Account Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 25),
(3, 22, 6, 'ccards_title', 'Credit / Debit Card Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 29),
(3, 23, 12, 'cscore_title', 'Credit Score Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 34),
(3, 24, 16, 'loans_title', 'Loan Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 37),
(5, 15, 0, 'medical_history_title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 14),
(4, 15, 0, 'employment_title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 14),
(4, 16, 11, 'recommendation_letter_title', 'Letter title', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 22),
(5, 16, 7, 'surgery_title', 'Surgery Title', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 22),
(5, 17, 11, 'implant_title', 'Implant Title', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 25),
(6, 4, 0, 'expenses_title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 3),
(7, 3, 0, 'maintenance_title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 2),
(8, 6, 0, 'government_id_title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 5),
(9, 4, 0, 'insurance_registration_title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 3),
(10, 4, 0, 'favorites_title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 4),
(11, 5, 0, 'product_warranty_title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 4),
(12, 3, 0, 'home_registry_title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 2),
(13, 4, 0, 'web_site_title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `webform_emails`
--

CREATE TABLE IF NOT EXISTS `webform_emails` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `eid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` text,
  `subject` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `template` text,
  `excluded_components` text NOT NULL,
  `html` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attachments` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`eid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `webform_last_download`
--

CREATE TABLE IF NOT EXISTS `webform_last_download` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `requested` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `webform_roles`
--

CREATE TABLE IF NOT EXISTS `webform_roles` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webform_roles`
--

INSERT INTO `webform_roles` (`nid`, `rid`) VALUES
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `webform_submissions`
--

CREATE TABLE IF NOT EXISTS `webform_submissions` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `is_draft` tinyint(4) NOT NULL DEFAULT '0',
  `submitted` int(11) NOT NULL DEFAULT '0',
  `remote_addr` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sid_nid` (`sid`,`nid`),
  KEY `nid_uid_sid` (`nid`,`uid`,`sid`),
  KEY `nid_sid` (`nid`,`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `webform_submitted_data`
--

CREATE TABLE IF NOT EXISTS `webform_submitted_data` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `no` varchar(128) NOT NULL DEFAULT '0',
  `data` mediumtext NOT NULL,
  KEY `nid` (`nid`),
  KEY `sid_nid` (`sid`,`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `webform_validation_rule`
--

CREATE TABLE IF NOT EXISTS `webform_validation_rule` (
  `ruleid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rulename` varchar(255) NOT NULL DEFAULT '',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `validator` varchar(255) NOT NULL DEFAULT '',
  `data` varchar(255) DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ruleid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `webform_validation_rule`
--

INSERT INTO `webform_validation_rule` (`ruleid`, `rulename`, `nid`, `validator`, `data`, `error_message`) VALUES
(1, 'Web Link', 11, 'regex', 'https?://([-\\w\\.]+)+(:\\d+)?(/([\\w/_\\.]*(\\?\\S+)?)?)?', 'Invalid web URL'),
(2, 'Phone Number', 14, 'regex', '^(?:\\([2-9]\\d{2}\\)\\ ?|(?:[2-9]\\d{2}\\-))[2-9]\\d{2}\\-\\d{4}$', 'Invalid telephone number');

-- --------------------------------------------------------

--
-- Table structure for table `webform_validation_rule_components`
--

CREATE TABLE IF NOT EXISTS `webform_validation_rule_components` (
  `ruleid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ruleid`,`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webform_validation_rule_components`
--

INSERT INTO `webform_validation_rule_components` (`ruleid`, `cid`) VALUES
(1, 4),
(2, 8);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
