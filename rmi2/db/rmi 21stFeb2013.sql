-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 21, 2013 at 06:00 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rmi`
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

--
-- Dumping data for table `access`
--


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

--
-- Dumping data for table `actions_aid`
--


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

--
-- Dumping data for table `authmap`
--


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

--
-- Dumping data for table `batch`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

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
(30, 'nice_menus', '2', 'rmi', 0, 0, '', 0, 0, 0, '', '', -1);

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

--
-- Dumping data for table `blocks_roles`
--


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

--
-- Dumping data for table `boxes`
--


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

--
-- Dumping data for table `cache`
--


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

--
-- Dumping data for table `cache_block`
--


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

--
-- Dumping data for table `cache_filter`
--


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

--
-- Dumping data for table `cache_form`
--


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

--
-- Dumping data for table `cache_menu`
--


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

--
-- Dumping data for table `cache_page`
--


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

--
-- Dumping data for table `cache_update`
--


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

--
-- Dumping data for table `comments`
--


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

--
-- Dumping data for table `content_access`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=282 ;

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
(281, 13, 113, 0, 1352967250, '182.180.65.113'),
(280, 11, 113, 0, 1352966527, '182.180.65.113'),
(279, 2, 113, 0, 1352966458, '182.180.65.113'),
(278, 5, 113, 0, 1352966402, '182.180.65.113'),
(277, 7, 113, 0, 1352966296, '182.180.65.113'),
(276, 9, 113, 0, 1352966238, '182.180.65.113'),
(275, 12, 113, 0, 1352966177, '182.180.65.113'),
(274, 8, 113, 0, 1352965820, '182.180.65.113'),
(273, 3, 113, 0, 1352965576, '182.180.65.113'),
(272, 6, 113, 0, 1352965395, '182.180.65.113'),
(271, 4, 113, 0, 1352965323, '182.180.65.113'),
(270, 10, 113, 0, 1351833449, '182.180.65.113'),
(269, 14, 113, 0, 1352965210, '182.180.65.113'),
(268, 5, 86, 0, 1349433415, '115.186.146.97'),
(267, 5, 102, 0, 1349678406, '115.186.146.97'),
(241, 7, 1, 0, 1349157160, '115.186.146.97'),
(266, 13, 102, 0, 1349346022, '115.186.146.97'),
(265, 11, 102, 0, 1349345924, '115.186.146.97'),
(246, 12, 1, 0, 1349157939, '115.186.146.97'),
(245, 11, 1, 0, 1349157804, '115.186.146.97'),
(263, 5, 102, 0, 1349353900, '115.186.146.97'),
(264, 2, 102, 0, 1349345651, '115.186.146.97'),
(259, 3, 102, 0, 1349267372, '182.180.65.113'),
(262, 7, 102, 0, 1349343709, '115.186.146.97'),
(261, 14, 102, 0, 1349337262, '115.186.146.97'),
(260, 14, 86, 0, 1349271292, '182.180.65.113'),
(255, 14, 86, 0, 1349263993, '182.180.65.113'),
(253, 14, 1, 0, 1349260618, '182.180.65.113'),
(252, 10, 102, 0, 1349258929, '182.180.65.113'),
(251, 6, 102, 0, 1349258785, '182.180.65.113'),
(250, 14, 102, 0, 1349258073, '182.180.65.113'),
(249, 14, 102, 0, 1349258016, '182.180.65.113'),
(248, 4, 102, 0, 1349257411, '182.180.65.113'),
(243, 9, 1, 0, 1349157568, '115.186.146.97'),
(235, 14, 1, 0, 1349094384, '115.186.146.97'),
(237, 3, 1, 0, 1349095606, '115.186.146.97');

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
(13, 281, 4, 'Facebook', 113),
(13, 281, 3, '******', 113),
(13, 281, 2, 'angel.eyz16@gmail.com', 113),
(13, 281, 1, 'Facebook', 113),
(11, 280, 5, 'mobie', 113),
(11, 280, 4, 'http://www.example.com', 113),
(11, 280, 3, '163', 113),
(11, 280, 2, '1972-02-03', 113),
(11, 280, 1, 'qmobile', 113),
(2, 279, 2, '000-00-0000', 113),
(2, 279, 1, '1990-10-16', 113),
(2, 279, 3, 'Muhammad Adnan', 113),
(5, 278, 5, 'Never', 113),
(5, 278, 4, 'No Smoker', 113),
(5, 278, 3, 'none', 113),
(5, 278, 2, 'Dr aafia', 113),
(5, 278, 1, 'nothing', 113),
(5, 278, 15, 'Medical report', 113),
(7, 277, 2, '2012-02-07', 113),
(7, 277, 1, 'Home', 113),
(7, 277, 3, 'Repair and paint', 113),
(9, 276, 3, 'hy note it', 113),
(9, 276, 2, '162', 113),
(9, 276, 1, 'Automobile', 113),
(9, 276, 4, 'Car Insurance', 113),
(12, 275, 2, '161', 113),
(12, 275, 1, 'Room', 113),
(12, 275, 3, 'Jatoi Hometown', 113),
(8, 274, 6, 'CNIC', 113),
(8, 274, 5, 'adnan', 113),
(2, 236, 1, '2005-03-03', 1),
(2, 236, 3, 'Barbara A. Willis', 1),
(8, 242, 3, '1997-10-29', 1),
(8, 242, 2, '1962-11-30', 1),
(8, 242, 1, 'Driver license', 1),
(6, 240, 4, 'Rent details', 1),
(5, 239, 5, 'Never', 1),
(5, 239, 4, 'Smoker', 1),
(5, 239, 3, 'four times', 1),
(8, 274, 4, '160', 113),
(8, 274, 3, '1952-02-06', 113),
(8, 274, 2, '1942-02-02', 113),
(8, 274, 1, 'Passport', 113),
(3, 273, 20, 'Salary', 113),
(6, 272, 3, '2012-12-04', 113),
(6, 272, 2, '8000', 113),
(6, 272, 1, 'Rent', 113),
(6, 272, 4, 'Hostel', 113),
(4, 271, 14, '159', 113),
(4, 271, 13, '35k*12', 113),
(4, 271, 12, 'Muzaffar Garh Jaoti ', 113),
(4, 271, 3, '2012-12-08', 113),
(4, 271, 2, '2012-01-03', 113),
(4, 271, 1, 'vizteck', 113),
(4, 271, 15, 'Adnan ', 113),
(10, 270, 3, '(786) 786-7869', 113),
(10, 270, 2, 'KFC', 113),
(10, 270, 1, 'Restaurant', 113),
(10, 270, 4, 'food', 113),
(14, 269, 3, 'adnan.ahmad@vizteck.com', 113),
(14, 269, 2, 'islamabad', 113),
(14, 269, 1, 'name', 113),
(14, 269, 9, 'Account', 113),
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
(3, 259, 20, 'zxc', 102),
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
(14, 253, 1, 'james spina ', 1),
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
(14, 250, 1, 'parlo', 102),
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
(14, 235, 9, 'Nelson  Contact', 1),
(14, 235, 1, 'George M. Nelson', 1),
(14, 235, 2, '$4541', 1),
(14, 235, 3, 'george.nelson@gmail.com', 1),
(2, 236, 2, '789-65-1124', 1),
(3, 237, 20, 'Financial Details', 1),
(11, 245, 5, 'Leather jacket', 1),
(12, 246, 3, 'Furniture details', 1),
(12, 246, 1, 'Furniture ', 1),
(12, 246, 2, '156', 1),
(13, 247, 3, '789456', 1),
(13, 247, 4, 'FB Acc', 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `data_group_sharing`
--

INSERT INTO `data_group_sharing` (`share_id`, `uid`, `contact_uid`, `nid`, `direction`) VALUES
(1, 1, 92, 14, 0),
(2, 1, 92, 4, 0),
(3, 113, 113, 14, 0),
(5, 113, 113, 6, 0),
(6, 113, 113, 10, 0),
(7, 113, 113, 3, 0),
(9, 114, 113, 14, 0),
(10, 114, 113, 4, 0),
(11, 114, 113, 6, 0),
(12, 114, 113, 10, 0),
(13, 114, 113, 3, 0),
(14, 114, 113, 8, 0),
(15, 86, 1, 5, 0),
(16, 1, 86, 5, 0),
(17, 113, 94, 14, 0),
(19, 113, 94, 6, 0),
(20, 113, 94, 10, 0),
(21, 113, 94, 3, 0),
(22, 113, 94, 8, 0),
(23, 113, 94, 12, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=164 ;

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
(159, 113, 'Adnan.docx', 'sites/default/files/webform/cv/Adnan.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 19741, 1, 1352965323),
(160, 113, 'logo.png', 'sites/default/files/webform/photo_gov_id/logo.png', 'image/png', 15077, 1, 1352965820),
(161, 113, 'logo.png', 'sites/default/files/webform/photo-home-registry/logo.png', 'image/png', 15077, 1, 1352966177),
(162, 113, 'Adnan.docx', 'sites/default/files/webform/policy/Adnan.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 19741, 1, 1352966238),
(163, 113, 'logo.png', 'sites/default/files/webform/logo.png', 'image/png', 15077, 1, 1352966527);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flood`
--

INSERT INTO `flood` (`fid`, `event`, `hostname`, `timestamp`) VALUES
(1, 'contact', '74.115.0.151', 1349440341);

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
(1, 2, 1349094696),
(1, 3, 1349096011),
(1, 4, 1349096604),
(1, 5, 1349433231),
(1, 6, 1349156984),
(1, 7, 1349157111),
(1, 8, 1349157316),
(1, 9, 1349157505),
(1, 10, 1349157654),
(1, 11, 1349157798),
(1, 12, 1349157904),
(1, 13, 1349157982),
(1, 14, 1349260635),
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
(1, 15, 1361426337),
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
(86, 15, 1349438587),
(1, 17, 1349432574),
(1, 18, 1349785848),
(1, 19, 1343801175),
(1, 20, 1351746206),
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
(86, 14, 1349271258),
(93, 15, 1344230974),
(92, 15, 1344231676),
(94, 15, 1344249178),
(95, 15, 1344236160),
(95, 18, 1344236902),
(86, 20, 1349438583),
(94, 14, 1344248325),
(96, 15, 1344249225),
(1, 21, 1361169618),
(97, 21, 1344251190),
(99, 21, 1344255024),
(103, 21, 1344327138),
(103, 14, 1347052690),
(103, 4, 1347245527),
(105, 21, 1344336992),
(112, 21, 1348117264),
(103, 15, 1347248296),
(113, 21, 1352965174),
(113, 14, 1349681286),
(113, 4, 1352965228),
(113, 6, 1352965351),
(113, 10, 1351833375),
(113, 8, 1352965644),
(113, 12, 1352965837),
(113, 13, 1352966544),
(113, 9, 1352966193),
(113, 7, 1352966264),
(113, 5, 1352966312),
(113, 2, 1352966418),
(113, 11, 1352966474),
(103, 3, 1344859608),
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
(113, 3, 1352965426),
(113, 15, 1352969847),
(121, 21, 1345194717),
(121, 14, 1345196425),
(121, 4, 1345197038),
(122, 21, 1345197500),
(122, 20, 1345197518),
(122, 18, 1345197519),
(123, 21, 1345197605),
(123, 18, 1345197934),
(123, 17, 1345197937),
(123, 20, 1345197940),
(123, 15, 1345197956),
(1, 22, 1347003083),
(1, 23, 1345204531),
(124, 21, 1345727329),
(125, 21, 1345727523),
(113, 20, 1345803221),
(113, 18, 1345803226),
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
(113, 23, 1346415287),
(113, 22, 1346415292),
(102, 14, 1349337204),
(102, 4, 1349349824),
(102, 6, 1349342657),
(102, 10, 1349258814),
(102, 3, 1349267349),
(102, 8, 1346419456),
(102, 12, 1346419484),
(102, 9, 1349343409),
(102, 11, 1349345843),
(102, 2, 1349345633),
(102, 5, 1349354412),
(102, 13, 1349345991),
(102, 7, 1349343618),
(102, 15, 1349440342),
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
(103, 10, 1347052769),
(103, 12, 1347052799),
(103, 5, 1347052919),
(103, 8, 1347053055),
(110, 21, 1347135925),
(110, 14, 1347135951),
(110, 15, 1347136877),
(110, 10, 1347135993),
(110, 5, 1347136012),
(110, 17, 1347136027),
(110, 18, 1347136867),
(110, 20, 1347136872),
(109, 14, 1347348801),
(86, 5, 1349433457),
(1, 24, 1347883720),
(86, 24, 1349439117),
(88, 8, 1347889836),
(86, 4, 1348748828),
(88, 4, 1348655866),
(86, 10, 1348748235),
(86, 11, 1348748479),
(1, 25, 1349163286),
(1, 26, 1349163282),
(102, 21, 1349343338),
(86, 21, 1349435784),
(86, 3, 1349267624),
(1, 27, 1351746135),
(1, 28, 1349432324),
(1, 29, 1351079586),
(1, 30, 1351746163),
(86, 17, 1349432510),
(102, 28, 1349434474),
(102, 29, 1349434494),
(102, 18, 1349438566),
(102, 30, 1349438602),
(102, 27, 1349440799),
(102, 20, 1349438553),
(86, 27, 1349438855),
(86, 28, 1349438608),
(86, 18, 1349438848);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=287 ;

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
('primary-links', 245, 0, 'contact/us', 'contact', 'Contact Us', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 0, 0, 0, 0, -45, 1, 1, 245, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 246, 0, 'node/18', 'node/%', 'How It Works', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 0, 0, 0, 0, -49, 1, 1, 246, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('secondary-links', 247, 0, 'user/account', 'user/account', 'My Account', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}s:5:"alter";b:1;}', 'menu', 0, 0, 0, 0, -50, 1, 1, 247, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('secondary-links', 248, 0, 'user/login', 'user/login', 'Login', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}s:5:"query";s:44:"destination=content/welcome-register-my-info";}', 'menu', 0, 0, 0, 0, -47, 1, 1, 248, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('secondary-links', 249, 0, 'user/register', 'user/register', 'Sign Up', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}s:5:"query";s:44:"destination=content/welcome-register-my-info";}', 'menu', 0, 0, 0, 0, -48, 1, 1, 249, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('secondary-links', 250, 0, 'logout', 'logout', 'Log out', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, -49, 1, 1, 250, 0, 0, 0, 0, 0, 0, 0, 0, 0),
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
('primary-links', 272, 246, 'node/26', 'node/%', 'Help', 'a:1:{s:10:"attributes";a:0:{}}', 'menu', 1, 0, 0, 0, -50, 2, 1, 246, 272, 0, 0, 0, 0, 0, 0, 0, 0),
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
('primary-links', 285, 284, 'http://itunes.apple.com/us/genre/ios/id36?mt=8', '', 'iPhone App', 'a:1:{s:10:"attributes";a:1:{s:6:"target";s:6:"_blank";}}', 'menu', 0, 1, 0, 0, -50, 2, 1, 284, 285, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 286, 284, 'https://play.google.com', '', 'Android App', 'a:1:{s:10:"attributes";a:1:{s:6:"target";s:6:"_blank";}}', 'menu', 0, 1, 0, 0, -49, 2, 1, 284, 286, 0, 0, 0, 0, 0, 0, 0, 0);

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
('rss.xml', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_feed', 'a:0:{}', 1, 1, '', 'rss.xml', 'RSS feed', 't', '', 4, '', '', '', 0, ''),
('crossdomain.xml', '', '', 'services_access_menu', 'a:0:{}', 'services_crossdomain_xml', 'a:0:{}', 1, 1, '', 'crossdomain.xml', '', 't', '', 4, '', '', '', 0, ''),
('admin', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 1, 1, '', 'admin', 'Administer', 't', '', 6, '', '', '', 9, 'modules/system/system.admin.inc'),
('contact', '', '', 'user_access', 'a:1:{i:0;s:29:"access site-wide contact form";}', 'contact_site_page', 'a:0:{}', 1, 1, '', 'contact', 'Contact', 't', '', 20, '', '', '', 0, 'modules/contact/contact.pages.inc'),
('ahah_helper_demo', '', '', '1', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:21:"ahah_helper_demo_form";}', 1, 1, '', 'ahah_helper_demo', '', 't', '', 4, '', '', '', 0, ''),
('logout', '', '', 'user_is_logged_in', 'a:0:{}', 'user_logout', 'a:0:{}', 1, 1, '', 'logout', 'Log out', 't', '', 6, '', '', '', 10, 'modules/user/user.pages.inc'),
('search', '', '', 'user_access', 'a:1:{i:0;s:14:"search content";}', 'search_view', 'a:0:{}', 1, 1, '', 'search', 'Search', 't', '', 20, '', '', '', 0, 'modules/search/search.pages.inc'),
('batch', '', '', '1', 'a:0:{}', 'system_batch_page', 'a:0:{}', 1, 1, '', 'batch', '', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
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
('node/add', '', '', '_node_add_access', 'a:0:{}', 'node_add_page', 'a:0:{}', 3, 2, '', 'node/add', 'Create content', 't', '', 6, '', '', '', 1, 'modules/node/node.pages.inc'),
('print/data', '', '', 'user_access', 'a:1:{i:0;s:26:"access all webform results";}', 'print_data_submission', 'a:0:{}', 3, 2, '', 'print/data', '', 't', '', 6, '', 'Print the submission of repective data groups.', '', 0, ''),
('filter/tips', '', '', '1', 'a:0:{}', 'filter_tips_long', 'a:0:{}', 3, 2, '', 'filter/tips', 'Compose tips', 't', '', 20, '', '', '', 0, 'modules/filter/filter.pages.inc'),
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
('admin/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/user', 'User management', 't', '', 6, '', 'Manage your site''s users, groups and access to site features.', 'left', 0, 'modules/system/system.admin.inc'),
('node/%', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'node/%', '', 'node_page_title', 'a:1:{i:0;i:1;}', 4, '', '', '', 0, ''),
('user/%', 'a:1:{i:1;s:22:"user_uid_optional_load";}', 'a:1:{i:1;s:24:"user_uid_optional_to_arg";}', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'user/%', 'My account', 'user_page_title', 'a:1:{i:0;i:1;}', 6, '', '', '', 0, 'modules/user/user.pages.inc'),
('node/%/view', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'View', 't', '', 136, '', '', '', -10, ''),
('user/%/view', 'a:1:{i:1;s:9:"user_load";}', '', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'View', 't', '', 136, '', '', '', -10, 'modules/user/user.pages.inc'),
('admin/settings/actions', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 7, 3, '', 'admin/settings/actions', 'Actions', 't', '', 6, '', 'Manage the actions defined for your site.', '', 0, ''),
('user/login/colorbox', '', '', 'user_is_anonymous', 'a:0:{}', 'colorbox_login', 'a:0:{}', 7, 3, '', 'user/login/colorbox', 'Login', 't', '', 4, '', '', '', 0, 'sites/all/modules/colorbox/colorbox.pages.inc'),
('user/contacts/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:20:"access user contacts";}', 'contacts_view_data_groups', 'a:0:{}', 6, 3, '', 'user/contacts/%', 'My Contacts', 't', '', 6, '', 'View shared data groups of the users contact.', '', 0, ''),
('remove/recommendation/letter', '', '', 'user_access', 'a:1:{i:0;s:26:"access all webform results";}', 'drupal_get_form', 'a:1:{i:0;s:33:"remove_recommendation_letter_form";}', 7, 3, '', 'remove/recommendation/letter', '', 't', '', 6, '', 'Remove Letter of Recommendation.', '', 0, ''),
('admin/user/rules', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 7, 3, '', 'admin/user/rules', 'Access rules', 't', '', 6, '', 'List and create rules to disallow usernames, e-mail addresses, and IP addresses.', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/updates', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', 7, 3, '', 'admin/reports/updates', 'Available updates', 't', '', 6, '', 'Get a status report about available updates for your installed modules and themes.', '', 10, 'modules/update/update.report.inc'),
('admin/build/block', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 7, 3, '', 'admin/build/block', 'Blocks', 't', '', 6, '', 'Configure what block content appears in your site''s sidebars and other regions.', '', 0, 'modules/block/block.admin.inc'),
('admin/content/comment', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 7, 3, '', 'admin/content/comment', 'Comments', 't', '', 6, '', 'List and edit site comments and the comment moderation queue.', '', 0, 'modules/comment/comment.admin.inc'),
('admin/build/contact', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'contact_admin_categories', 'a:0:{}', 7, 3, '', 'admin/build/contact', 'Contact form', 't', '', 6, '', 'Create a system contact form and set up categories for the form to use.', '', 0, 'modules/contact/contact.admin.inc'),
('admin/content/types', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'node_overview_types', 'a:0:{}', 7, 3, '', 'admin/content/types', 'Content types', 't', '', 6, '', 'Manage posts by content type, including default status, front page promotion, etc.', '', 0, 'modules/node/content_types.inc'),
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
('admin/content/taxonomy/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 15, 4, 'admin/content/taxonomy', 'admin/content/taxonomy', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/settings/filters/list', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'List', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/build/path/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_overview', 'a:0:{}', 15, 4, 'admin/build/path', 'admin/build/path', 'List', 't', '', 136, '', '', '', -10, 'modules/path/path.admin.inc'),
('admin/user/rules/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc'),
('admin/build/modules/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'List', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/user/user/list', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 15, 4, 'admin/user/user', 'admin/user/user', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc'),
('admin/content/comment/new', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Published comments', 't', '', 136, '', '', '', -10, 'modules/comment/comment.admin.inc'),
('user/%/edit/account', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 11, 4, 'user/%/edit', 'user/%', 'Account', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/build/services/browse', '', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', 'services_admin_browse_index', 'a:0:{}', 15, 4, 'admin/build/services', 'admin/build/services', 'Browse', 't', '', 136, '', 'Browse and test available remote services.', '', -10, 'sites/all/modules/services/services_admin_browse.inc'),
('admin/build/themes/select', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'List', 't', '', 136, '', 'Select the default theme.', '', -1, 'modules/system/system.admin.inc'),
('admin/build/menu/list', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'List menus', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc'),
('webform_addmore/js/remove/subdatagroup', '', '', '1', 'a:0:{}', 'webform_addmore_js_remove_subdatagroup', 'a:0:{}', 15, 4, '', 'webform_addmore/js/remove/subdatagroup', '', 't', '', 6, '', '', '', 0, ''),
('admin/build/themes/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'Configure', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/contact/list', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'contact_admin_categories', 'a:0:{}', 15, 4, 'admin/build/contact', 'admin/build/contact', 'List', 't', '', 136, '', '', '', 0, 'modules/contact/contact.admin.inc'),
('admin/settings/actions/manage', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 15, 4, 'admin/settings/actions', 'admin/settings/actions', 'Manage actions', 't', '', 136, '', 'Manage the actions defined for your site.', '', -2, ''),
('admin/settings/actions/orphan', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_remove_orphans', 'a:0:{}', 15, 4, '', 'admin/settings/actions/orphan', 'Remove orphans', 't', '', 4, '', '', '', 0, ''),
('admin/build/modules/uninstall', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'Uninstall', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/comment/approval', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:1:{i:0;s:8:"approval";}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Approval queue', 't', '', 128, '', '', '', 0, 'modules/comment/comment.admin.inc'),
('admin/settings/clean-urls/check', '', '', '1', 'a:0:{}', 'drupal_json', 'a:1:{i:0;a:1:{s:6:"status";b:1;}}', 15, 4, '', 'admin/settings/clean-urls/check', 'Clean URL check', 't', '', 4, '', '', '', 0, ''),
('admin/settings/actions/configure', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_actions_configure";}', 15, 4, '', 'admin/settings/actions/configure', 'Configure an advanced action', 't', '', 4, '', '', '', 0, ''),
('admin/build/path/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_edit', 'a:0:{}', 15, 4, '', 'admin/build/path/edit', 'Edit alias', 't', '', 4, '', '', '', 0, 'modules/path/path.admin.inc'),
('admin/services/ahah/security-options', '', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', '_services_ahah_security_options', 'a:0:{}', 15, 4, '', 'admin/services/ahah/security-options', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/services/services_admin_browse.inc'),
('admin/build/path/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_edit', 'a:0:{}', 15, 4, 'admin/build/path', 'admin/build/path', 'Add alias', 't', '', 128, '', '', '', 0, 'modules/path/path.admin.inc'),
('admin/settings/filters/add', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:0:{}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'Add input format', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc'),
('admin/user/rules/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_add', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Add rule', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/user/create', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:6:"create";}', 15, 4, 'admin/user/user', 'admin/user/user', 'Add user', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/rules/check', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_check', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Check rules', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/settings/date-time/lookup', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_date_time_lookup', 'a:0:{}', 15, 4, '', 'admin/settings/date-time/lookup', 'Date and time lookup', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/user/roles/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_role";}', 15, 4, '', 'admin/user/roles/edit', 'Edit role', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/rules/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_edit', 'a:0:{}', 15, 4, '', 'admin/user/rules/edit', 'Edit rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/updates/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'List', 't', '', 136, '', '', '', 0, 'modules/update/update.report.inc'),
('admin/reports/updates/check', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_manual_status', 'a:0:{}', 15, 4, '', 'admin/reports/updates/check', 'Manual update check', 't', '', 4, '', '', '', 0, 'modules/update/update.fetch.inc'),
('view/data/%/%', 'a:2:{i:2;s:9:"node_load";i:3;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:26:"access all webform results";}', 'view_data_submission', 'a:0:{}', 12, 4, '', 'view/data/%/%', '', 't', '', 6, '', 'View the list of submission of repective data groups.', '', 0, ''),
('admin/reports/status/php', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_php', 'a:0:{}', 15, 4, '', 'admin/reports/status/php', 'PHP', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/user/profile/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'profile_admin_settings_autocomplete', 'a:0:{}', 15, 4, '', 'admin/user/profile/autocomplete', 'Profile category autocomplete', 't', '', 4, '', '', '', 0, 'modules/profile/profile.admin.inc'),
('admin/content/node-settings/rebuild', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'drupal_get_form', 'a:1:{i:0;s:30:"node_configure_rebuild_confirm";}', 15, 4, '', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 't', '', 4, '', '', '', 0, 'modules/node/node.admin.inc'),
('admin/reports/status/run-cron', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_run_cron', 'a:0:{}', 15, 4, '', 'admin/reports/status/run-cron', 'Run cron', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/status/sql', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_sql', 'a:0:{}', 15, 4, '', 'admin/reports/status/sql', 'SQL', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/block/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', 15, 4, 'admin/build/block', 'admin/build/block', 'Add block', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/contact/add', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:2:{i:0;s:18:"contact_admin_edit";i:1;i:3;}', 15, 4, 'admin/build/contact', 'admin/build/contact', 'Add category', 't', '', 128, '', '', '', 1, 'modules/contact/contact.admin.inc'),
('admin/content/types/add', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_type_form";}', 15, 4, 'admin/content/types', 'admin/content/types', 'Add content type', 't', '', 128, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/user/profile/add', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:18:"profile_field_form";}', 15, 4, '', 'admin/user/profile/add', 'Add field', 't', '', 4, '', '', '', 0, 'modules/profile/profile.admin.inc'),
('admin/build/menu/add', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:14:"menu_edit_menu";i:1;s:3:"add";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Add menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/path/pathauto', '', '', 'user_access', 'a:1:{i:0;s:19:"administer pathauto";}', 'drupal_get_form', 'a:1:{i:0;s:23:"pathauto_admin_settings";}', 15, 4, 'admin/build/path', 'admin/build/path', 'Automated alias settings', 't', '', 128, '', '', '', 10, 'sites/all/modules/pathauto/pathauto.admin.inc'),
('admin/settings/search/wipe', '', '', 'user_access', 'a:1:{i:0;s:17:"administer search";}', 'drupal_get_form', 'a:1:{i:0;s:19:"search_wipe_confirm";}', 15, 4, '', 'admin/settings/search/wipe', 'Clear index', 't', '', 4, '', '', '', 0, 'modules/search/search.admin.inc'),
('admin/build/block/configure', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:21:"block_admin_configure";}', 15, 4, '', 'admin/build/block/configure', 'Configure block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES
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
('node/%/webform/emails', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"webform_emails_form";i:1;i:1;}', 11, 4, 'node/%/webform', 'node/%', 'E-mails', 't', '', 128, '', '', '', 1, 'sites/all/modules/webform/includes/webform.emails.inc'),
('node/%/webform/configure', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:22:"webform_configure_form";i:1;i:1;}', 11, 4, 'node/%/webform', 'node/%', 'Form settings', 't', '', 128, '', '', '', 2, 'sites/all/modules/webform/includes/webform.pages.inc'),
('webform/ajax/options/%', 'a:1:{i:3;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:3;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:3;}', 'webform_select_options_ajax', 'a:0:{}', 14, 4, '', 'webform/ajax/options/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform/components/select.inc'),
('node/%/webform/components', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'webform_components_page', 'a:1:{i:0;i:1;}', 11, 4, 'node/%/webform', 'node/%', 'Form components', 't', '', 136, '', '', '', 0, 'sites/all/modules/webform/includes/webform.components.inc'),
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

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
(15, 15, 'page', '', 'Home', 1, 1, 1342074204, 1349441398, 0, 0, 0, 0, 0, 0),
(17, 17, 'page', '', 'Contact Us', 1, 1, 1343800889, 1345204502, 0, 0, 0, 0, 0, 0),
(18, 18, 'page', '', 'How It Works', 1, 1, 1343800944, 1349441455, 0, 0, 0, 0, 0, 0),
(20, 20, 'page', '', 'About Us', 1, 1, 1343801284, 1345203634, 0, 0, 0, 0, 0, 0),
(21, 21, 'page', '', 'Welcome to Register My Info', 1, 1, 1344250663, 1349179832, 0, 0, 0, 0, 0, 0),
(22, 22, 'page', '', 'Terms', 1, 1, 1345203928, 1345203928, 0, 0, 0, 0, 0, 0),
(23, 23, 'page', '', 'Privacy Policy', 1, 1, 1345204189, 1345204418, 0, 0, 0, 0, 0, 0),
(24, 24, 'page', '', 'Access denied', 1, 1, 1347883719, 1347883719, 0, 0, 0, 0, 0, 0),
(25, 25, 'page', '', 'Lorem ipsum', 1, 1, 1349162560, 1349162560, 0, 0, 0, 0, 0, 0),
(26, 26, 'page', '', 'Pellentesque', 1, 1, 1349162613, 1349162613, 0, 0, 0, 0, 0, 0),
(27, 27, 'page', '', 'Solutions', 1, 1, 1349430941, 1349432871, 0, 0, 0, 0, 0, 0),
(28, 28, 'page', '', 'Individual RMI Plan', 1, 1, 1349431028, 1349431028, 0, 0, 0, 0, 0, 0),
(29, 29, 'page', '', 'Family RMI Plan', 1, 1, 1349431059, 1349431059, 0, 0, 0, 0, 0, 0),
(30, 30, 'page', '', 'Business RMI Plan', 1, 1, 1349431099, 1349431099, 0, 0, 0, 0, 0, 0);

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
(30, 0, 'all', 1, 0, 0);

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
(30, 1349431099, NULL, 1, 0);

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

--
-- Dumping data for table `node_counter`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

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
(15, 15, 1, 'Home', '<iframe src="http://player.vimeo.com/video/50395376?title=0&amp;byline=0&amp;portrait=0" width="720" height="400" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>\r\n<br/>\r\n<strong>Our Mission Statement:</strong>\r\n<br/>\r\nRegister My Info is built on the idea that individuals require an easier mechanism of communication and distribution of their personal information amongst friends, family, businesses and others than what currently exists.  Register My Info makes sure that our clients have what they need to run their lives as well as possible with maximum efficiency and reliability.  Mobile device users want everything at their fingertips and there are an increasing number of users that want or need to share certain aspects of their information.  Therefore, Register My Info will allow users the ability to no longer carry a wallet or purse as they will have all their information such as demographic, personal, financial, health, insurance and government ID information right at their fingertips with all information stored within their mobile device through the Register My Info App.  The web and app services allow users to confidently share and unshare any aspect of their information. Register My Info’s reliability is critical to our success and the success of our clients, so we give our users the assurance that their personal information and we will always be there when they need it.  Our slogan is “One app. One website. One Person,” as we truly believe that Register My Info allows every person to have everything they need.', '<iframe src="http://player.vimeo.com/video/50395376?title=0&amp;byline=0&amp;portrait=0" width="720" height="400" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>\r\n<br/>\r\n<strong>Our Mission Statement:</strong>\r\n<br/>\r', '', 1349441398, 2),
(18, 18, 1, 'How It Works', 'Users will be able to create and curate their own personal content and share and unshare their most relevant, most widely and most popular used information.  RMI is not a personal aggregator as it does not search the Internet for individual information to store like a computer or software program would search for data information.  Rather, RMI represents the most important content curation product, YOU, the individual.    RMI allows the individual user to use a closed system that allows the user to organize, maintain, manually update, and share what is most important in their daily lives.  Basically, RMI represents an updated way for individual content curation.\r\n\r\nSo how does RMI work?  Register my info (RMI) is a new web-based and mobile device application service that will help solve several needs in the fast-emerging market for data storage, content curation, and sharing.  The Company is developing a file-sharing platform and mobile app for the storage and dissemination of personal and business information.    As our parent company’s name, Infinitude Inc., represents, RMI offers a platform that allows an infinite amount of content to be stored, curated and shared.  Users may enter all personal information concerning demographics, financial, employment, health, insurance, credit card information, personal identification information, social networking sites, purchased products/warranty information, likes/dislikes, recommendations/nonrecommendations, and whatever else our users can think of sharing.  Whew, like we said an infinite amount of information.\r\n\r\nHow about some examples?  Say you walk into a new doctor or dentist’s office and you check in and they ask for your information as well as a ton of forms to fill out. Well, we have all been there and we know how cumbersome that can be.  Here is how RMI works for this situation. With RMI, you have prefilled in all of your information and now with a click of a button of scan of your mobile device you get to choose what information you want to share with the doctor or dentist.  Great thing also is that you can unshare the information at anytime in the future.  \r\n\r\nOr say you want to share your latest social networking schemes from Facebook, Twitter, Pinterest or others but you don’t want to visit each website to choose what to share and with whom to share?   Too much time wasted doing it this way, right? RMI allows you to curate content from any site and then share with your selected friends, colleagues and/or businesses that you have selected through RMI instead of having to visit each single site and sharing through each site individually.  \r\n\r\n<iframe src="http://player.vimeo.com/video/50395376?title=0&amp;byline=0&amp;portrait=0" width="720" height="400" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>\r\n\r\nOk another example for you.   Say you are looking for a car insurance company.  Sure there are a ton of ways you can search the Internet to find this information, but what better way than to tap into your shared RMI network of friends and colleagues to ask for a recommendation for a car insurance company.  You get the best recommendation based on your RMI network’s recommendation.  In addition, your friend or colleague can share their insurance company information directly with you as they have all this information stored already.\r\n\r\nHow about purchasing products online or in a store?  RMI can help there as well.  Say you just bought a new laptop.  RMI will help you store the information on item bought purchase date, warranty information and also allow you to share this information with another individual or business.  By storing all your product information in one place, RMI will allow you to share any or all of your product information at anytime and for any reason.  Say that laptop was stolen?  Sure you can have tracking systems nowadays, but what if you could quickly pull up your serial number for law enforcement and share your information with them at time zero…you bet you increase your chances of obtaining your items.  Also through RMI’s app, you can share any stolen information stored right in your mobile device with not only law enforcement but with your insurance company, so they can start your claim at time zero.\r\n\r\nJust one of the other things RMI hopes to develop is a fully, digital, government approved identification card such as a driver’s license.  Our goal at RMI is to create a personal curation that allows all users to have all their information directly in their hands via their mobile device.   Ultimately, we believe we will create the full capacity to allow users to no longer have the need to carry a wallet.   We believe safe and secure sharing is important and that is why RMI has invested in the best of the best in levels of security including adhering to all HIPPA and PCI DSS requirements.  We want our users to register and share safely, efficiently and appropriately.\r\n\r\nIn summary, RMI hopes to offer our users the ability to have everything in their mobile device for review and sharing.  The curation options are limitless or like we enjoy saying, a sharing platform used to the <em>actual infinitude of today’s sharing world. </em>', 'Users will be able to create and curate their own personal content and share and unshare their most relevant, most widely and most popular used information.  RMI is not a personal aggregator as it does not search the Internet for individual information to store like a computer or software program would search for data information.  Rather, RMI represents the most important content curation product, YOU, the individual.    RMI allows the individual user to use a closed system that allows the user to organize, maintain, manually update, and share what is most important in their daily lives.', '', 1349441455, 2),
(21, 21, 1, 'Welcome to Register My Info', 'Welcome to Register My Info. Our company looks forward to serving you.  As our slogan states, we are “One app.  One website. One Person.”\r\n<br>\r\n<a href=''/rmi_test/user/account'' class=''get_started''>Get Started</a>', 'Welcome to Register My Info. Our company looks forward to serving you.  As our slogan states, we are “One app.  One website. One Person.”\r\n<br>\r\n<a href=''/rmi_test/user/account'' class=''get_started''>Get Started</a>', '', 1349179832, 1),
(20, 20, 1, 'About Us', 'Dr. Gil Ortega started register My Info (RMI) after years of frustration in not being able to carry and share data efficiently in both personal and business methods.  \r\nDr. Ortega engaged in many discussions with companies trying to help facilitate improved methods in communicating and sharing information in healthcare, financial and business markets.  However, after years of trial and tribulations while working with different companies, Dr. Ortega found that his message was always lost in translation by large companies.  The message was to provide the user with what they need right in their fingertips on their mobile devices.  It seemed too complicated for individual companies to realize that personal and business sharing of information was not being done effectively.   As was the case before RMI, users had to have several different websites and mobile applications to store and share personal and business information.  Furthermore, most of these methods of sharing were not compatible.   Finally, after years of searching for an answer to solve the problem with inefficiencies with personal and business data sharing, Dr. Ortega decided to build his own company to help fulfill the needs of every mobile device user with the bottom line desire to provide each user with everything they need right at their fingertips. ', 'Dr. Gil Ortega started register My Info (RMI) after years of frustration in not being able to carry and share data efficiently in both personal and business methods.  \r', '', 1345203634, 1),
(22, 22, 1, 'Terms', 'RMI’s statement of rights and responsibilities governs the relationship between users and others that use RMI.  By engaging the uses of RMI, users agree to the following statements.', 'RMI’s statement of rights and responsibilities governs the relationship between users and others that use RMI.  By engaging the uses of RMI, users agree to the following statements.', '', 1345203928, 1),
(23, 23, 1, 'Privacy Policy', 'Protecting your private information is our priority. This Statement of Privacy applies to the www.registermyinfo.com and Register My Info and governs data collection and usage. For the purposes of this Privacy Policy, unless otherwise noted, all references to Register My Info include www.registermyinfo.com and RMI. The RMI website is an information sharing site. By using the\r\nRMI website, you consent to the data practices described in this statement.\r\n\r\n<strong>TRUSTe Privacy Program</strong>\r\n\r\nRMI is a licensee of the TRUSTe Privacy Program. TRUSTe is an independent organization whose mission is to build users'' trust and confidence in the Internet by promoting the use of fair information practices. Because we want to demonstrate our commitment to your privacy, we have\r\nagreed to disclose our information practices and have our privacy practices reviewed for compliance by TRUSTe.\r\n\r\nIf you have questions or concerns regarding this policy, you should first contact us at info@registermyinfo.com. \r\n\r\n<strong>Collection of your Personal Information</strong>\r\n\r\nRMI may collect personally identifiable information, such as your name. If you purchase RMI''s products and services, we collect billing and credit card information. This information is used to complete the purchase transaction. RMI may also collect anonymous demographic information, which is not unique to you, such as your age, gender and household income. We may gather\r\nadditional personal or non-personal information in the future.\r\nInformation about your computer hardware and software may be automatically collected by RMI. This information can include: your IP address, browser type, domain names, access times and referring website addresses. This information is used for the operation of the service, to maintain quality of the service, and to provide general statistics regarding use of the RMI website.\r\nPlease keep in mind that if you directly disclose personally identifiable information or personally sensitive data through RMI''s public message boards, this information may be collected and used by others.\r\n\r\nRMI encourages you to review the privacy statements of websites you choose to link to from RMI so that you can understand how those websites collect, use and share your information. RMI is not responsible for the privacy statements or other content on websites outside of the RMI website.\r\n\r\n<strong>Use of your Personal Information</strong>\r\n\r\nRMI collects and uses your personal information to operate its website(s) and deliver the services you have requested.\r\n\r\nRMI may also use your personally identifiable information to inform you of other products or services available from RMI and its affiliates. RMI may also contact you via surveys to conduct research about your opinion of current services or of potential new services that may be offered. RMI does not sell, rent or lease its customer lists to third parties. RMI may, from time to time, contact you on behalf of external business partners about a particular offering that may be of interest to you. In those cases, your unique personally identifiable information (e-mail, name, address, telephone number) is not transferred to the third party. RMI may share data with trusted partners to help perform statistical analysis, send you email or postal mail, provide customer support, or arrange for deliveries. All such third parties are prohibited from using your personal information except to provide these services to RMI, and they are required to maintain the confidentiality of your information.\r\n\r\nRMI will disclose your personal information, without notice, only if required to do so by law or in the good faith belief that such action is necessary to: (a) conform to the edicts of the law or comply with legal process served on RMI or the site; (b) protect and defend the rights or property of RMI; and, (c) act under exigent circumstances to protect the personal safety of users of RMI, or\r\nthe public.\r\n\r\n<strong>Use of Cookies</strong>\r\n\r\nThe RMI website may use "cookies" to help you personalize your online experience. A cookie is a text file that is placed on your hard disk by a web page server. Cookies cannot be used to run programs or deliver viruses to your computer. Cookies are uniquely assigned to you, and can only\r\nbe read by a web server in the domain that issued the cookie to you.\r\nOne of the primary purposes of cookies is to provide a convenience feature to save you time. The purpose of a cookie is to tell the Web server that you have returned to a specific page. For example, if you personalize RMI pages, or register with RMI site or services, a cookie helps RMI to recall your specific information on subsequent visits. This simplifies the process of recording\r\nyour personal information, such as billing addresses, shipping addresses, and so on. When you return to the same RMI website, the information you previously provided can be retrieved, so you can easily use the RMI features that you customized. You have the ability to accept or decline cookies. Most Web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer. If you choose to decline cookies, you may not be able to fully experience the interactive features of the\r\nRMI services or websites you visit.\r\n\r\n<strong>Security of your Personal Information</strong>\r\n\r\nVerisign When personal information (such as a credit card number) is transmitted to other websites, it is protected through the use of encryption, such as the Secure Sockets Layer (SSL) protocol. Verisign is an independent, third-party company engaged in the development of digital trust.\r\nVerisign provides authentication of Internet services, digital identity and intellectual property. By clicking on the Verisign logo, the Verisign website will serve up a web page that confirms that RMI is "Verisign Authenticated."\r\n\r\n<strong>Children Under Thirteen</strong>\r\n\r\nRMI does not knowingly collect personally identifiable information from children under the age of thirteen. If you are under the age of thirteen, you must ask your parent or guardian for permission to use this website.\r\n\r\n<strong>Opt-Out & Unsubscribe</strong>\r\n\r\nWe respect your privacy and give you an opportunity to opt-out of receiving announcements of certain information. Users may opt-out of receiving any or all communications from RMI by contacting us here:\r\n\r\nEmail: <a href=''mailto:info@registermyinfo.com'' >info@registermyinfo.com</a>\r\n\r\n<strong>Changes to this Statement</strong>\r\n\r\nRMI will occasionally update this Statement of Privacy to reflect company and customer feedback. RMI encourages you to periodically review this Statement to be informed of how RMI is protecting your information.\r\n\r\n<strong>Termination</strong>\r\n\r\nIf a user violates the voice of the applied Statement or otherwise increases risk of possible legal violations to RMI, RMI can stop allowing access to RMI functions and content.  A user in violation of the voice of the applied Statement will be notified via email and/or at next time of use of RMI by user.  As stated above, a user may also delete his/her account or application at anytime.\r\n\r\n<strong>Contact Information</strong>\r\n\r\nRMI welcomes your questions or comments regarding this Statement of Privacy. \r\n\r\nIf you believe that RMI has not adhered to this Statement, please contact RMI at:\r\n\r\nRegister My Info\r\n7702 East Doubletree Ranch, Suite 300\r\nScottsdale, Arizona 85258\r\nEmail Address:\r\ninfo@registermyinfo.com\r\nTelephone number:\r\n480-348-3974\r\nEffective as of July 07, 2012\r\n', 'Protecting your private information is our priority. This Statement of Privacy applies to the www.registermyinfo.com and Register My Info and governs data collection and usage. For the purposes of this Privacy Policy, unless otherwise noted, all references to Register My Info include www.registermyinfo.com and RMI. The RMI website is an information sharing site. By using the\r\nRMI website, you consent to the data practices described in this statement.\r\n\r\n<strong>TRUSTe Privacy Program</strong>\r\n\r', '', 1345204418, 1),
(24, 24, 1, 'Access denied', 'You are not authorized to access this page.', 'You are not authorized to access this page.', '', 1347883719, 1),
(25, 25, 1, 'Lorem ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus hendrerit consectetur dolor, et porta ante suscipit nec. Donec tempus lorem eget lorem adipiscing auctor. Ut ornare, neque sit amet malesuada tincidunt, tellus arcu iaculis orci, ac eleifend ante odio vel ligula. Fusce diam felis, volutpat et faucibus eu, lobortis eu purus. Sed dolor nibh, cursus id cursus at, lacinia id urna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur accumsan hendrerit turpis, ac fermentum velit gravida nec. Aliquam erat volutpat. Nullam mi dui, commodo vel eleifend in, tempor sed libero. Aliquam feugiat nunc eu nibh sodales a dignissim libero luctus. Ut enim purus, pellentesque eu porta sed, venenatis sit amet arcu. Etiam non consectetur mauris. Sed laoreet massa in arcu ornare ornare. ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus hendrerit consectetur dolor, et porta ante suscipit nec. Donec tempus lorem eget lorem adipiscing auctor. Ut ornare, neque sit amet malesuada tincidunt, tellus arcu iaculis orci, ac eleifend ante odio vel ligula. Fusce diam felis, volutpat et faucibus eu, lobortis eu purus. Sed dolor nibh, cursus id cursus at, lacinia id urna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur accumsan hendrerit turpis, ac fermentum velit gravida nec. Aliquam erat volutpat.', '', 1349162560, 1),
(26, 26, 1, 'Pellentesque', 'Pellentesque feugiat suscipit orci at varius. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus dignissim accumsan nunc, at blandit mi sollicitudin quis. Suspendisse ac sapien dui. Vestibulum varius gravida mi, at adipiscing mauris adipiscing eget. Nulla eu velit neque. Etiam cursus eleifend orci id tempor. Praesent sit amet tellus magna. Fusce ac libero feugiat mauris fermentum tempus. Etiam rutrum, lorem et imperdiet aliquam, dolor metus viverra ipsum, id ultrices ligula massa eu metus. Pellentesque lacinia lectus eu sapien dignissim pharetra ornare lectus volutpat. Pellentesque id eros imperdiet leo porta facilisis sed in nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nec nulla metus, a imperdiet ligula. ', 'Pellentesque feugiat suscipit orci at varius. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus dignissim accumsan nunc, at blandit mi sollicitudin quis. Suspendisse ac sapien dui. Vestibulum varius gravida mi, at adipiscing mauris adipiscing eget. Nulla eu velit neque. Etiam cursus eleifend orci id tempor. Praesent sit amet tellus magna. Fusce ac libero feugiat mauris fermentum tempus. Etiam rutrum, lorem et imperdiet aliquam, dolor metus viverra ipsum, id ultrices ligula massa eu metus.', '', 1349162613, 1),
(27, 27, 1, 'Solutions', '<div id="main">\r\n<div id="column_left">\r\n <h2>Individual RMI Plan</h2>\r\n <div class="sol_box" >\r\n<ol type="a">\r\n<li><span><span class=''price''>$9.99</span> for individual app with up to 5 GB of storage.</span></li>\r\n<li><span>Storage options available up to <span class=''price''>500 GB</span> with additional fee for additional storage use.</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n<div id="column_right">\r\n<h2>Family RMI Plan</h2>\r\n<div class="sol_box" >\r\n<ol type="a">\r\n<li><span><span class=''price''>$16.99</span> for app for two persons in same family with up to 5 GB of shared storage,</span></li>\r\n<li><span><span class=''price''>$29.99</span> for app for up to four persons in same family with up to 5 GB of shared storage.</span></li>\r\n<li><span>Storage options available up to <span class=''price''>500 GB</span> with additional fee for additional shared storage use</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n<div id="column_right_adsense">\r\n<h2>Business RMI Plan</h2>\r\n<div class="sol_box" >\r\n<ol type="a">\r\n<li><span>Business Registration Document utilization for RMI integration. (please contact RMI customer service for pricing options)</span></li>\r\n<li><span>Business Product Registration for RMI integration. (please contact RMI customer service for pricing options)</span>\r\n<ol type="i">\r\n<li>Allows customers to leave feedback</li>\r\n<li>Allows customers to state if Like or Dislike</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<div class="more"><a href="business-rmi-plan">Read more >></a></div>\r\n</div>\r\n</div>\r\n</div>', '<div id="main">\r\n<div id="column_left">\r\n <h2>Individual RMI Plan</h2>\r\n <div class="sol_box" >\r\n<ol type="a">\r\n<li><span><span class=''price''>$9.99</span> for individual app with up to 5 GB of storage.</span></li>\r\n<li><span>Storage options available up to <span class=''price''>500 GB</span> with additional fee for additional storage use.</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n<div id="column_right">\r\n<h2>Family RMI Plan</h2>\r\n<div class="sol_box" >\r\n<ol type="a">\r\n<li><span><span class=''price''>$16.99</span> for app for two persons in same family with up to 5 GB of shared storage,</span></li>\r', '', 1349432871, 2),
(28, 28, 1, 'Individual RMI Plan', ' <div class="detail_box">\r\n<ol type="a">\r\n<li><span><span class=''price''>$9.99</span> for individual app with up to 5 GB of storage.</span></li>\r\n<li><span>Storage options available up to <span class=''price''>500 GB</span> with additional fee for additional storage use.</span></li>\r\n</ol>\r\n</div>', ' <div class="detail_box">\r\n<ol type="a">\r\n<li><span><span class=''price''>$9.99</span> for individual app with up to 5 GB of storage.</span></li>\r\n<li><span>Storage options available up to <span class=''price''>500 GB</span> with additional fee for additional storage use.</span></li>\r\n</ol>\r\n</div>', '', 1349431028, 2),
(29, 29, 1, 'Family RMI Plan', '<div class="detail_box" >\r\n<ol type="a">\r\n<li><span><span class=''price''>$16.99</span> for app for two persons in same family with up to 5 GB of shared storage,</span></li>\r\n<li><span><span class=''price''>$29.99</span> for app for up to four persons in same family with up to 5 GB of shared storage.</span></li>\r\n<li><span>Storage options available up to <span class=''price''>500 GB</span> with additional fee for additional shared storage use.</span></li>\r\n</ol>\r\n</div>', '<div class="detail_box" >\r\n<ol type="a">\r\n<li><span><span class=''price''>$16.99</span> for app for two persons in same family with up to 5 GB of shared storage,</span></li>\r\n<li><span><span class=''price''>$29.99</span> for app for up to four persons in same family with up to 5 GB of shared storage.</span></li>\r\n<li><span>Storage options available up to <span class=''price''>500 GB</span> with additional fee for additional shared storage use.</span></li>\r\n</ol>\r\n</div>', '', 1349431059, 2),
(30, 30, 1, 'Business RMI Plan', '<div class="detail_box">\r\n    <ol type="a">\r\n        <li><span>Business Registration Document utilization for RMI integration. (please contact RMI customer service for pricing options)</span></li>\r\n        <li><span>Business Product Registration for RMI integration. (please contact RMI customer service for pricing options)</span>\r\n            <ol type="i">\r\n                <li>Allows customers to leave feedback</li>\r\n                <li>Allows customers to state if Like or Dislike</li>\r\n                <li>Tweets</li>\r\n                <li>Allows Pins with Pinterest</li>\r\n            </ol>\r\n        </li>\r\n        <li><span>Business Product Warranty Registration for RMI integration. (please contact RMI customer service for pricing options)</span></li>\r\n        <li><span>Restaurant Business and Menu Registry. (please contact RMI customer service for pricing options)</span>\r\n            <ol type="i">\r\n                <li>Allows user menu browsing and ordering.</li>\r\n                <li>Allows Social sharing\r\n                    <ol type="1">\r\n                        <li>Allows customers to state if Like or Dislike</li>\r\n                        <li>Recommend or Not Recommend</li>\r\n                        <li>Tweets</li>\r\n                        <li>Allows Pins with Pinterest</li>\r\n                    </ol>\r\n                </li>\r\n            </ol>\r\n        </li>\r\n        <li><span>Medical Implant Company Implant Patient Registry (please contact RMI customer service for pricing options)</span>\r\n            <ol type="i">\r\n                <li>Orthopaedic Implants</li>\r\n                <li>Dental Implants</li>\r\n                <li>Cosmetic Implants</li>\r\n            </ol>\r\n        </li>\r\n        <li><span>Government Agency. (please contact RMI customer service for pricing options)</span>\r\n            <ol type="i">\r\n                <li>Driver’s license Registration</li>\r\n                <li>Passport Registration</li>\r\n            </ol>\r\n        </li>\r\n    </ol>\r\n</div>', '<div class="detail_box">\r\n    <ol type="a">\r\n        <li><span>Business Registration Document utilization for RMI integration. (please contact RMI customer service for pricing options)</span></li>\r\n        <li><span>Business Product Registration for RMI integration. (please contact RMI customer service for pricing options)</span>\r\n            <ol type="i">\r\n                <li>Allows customers to leave feedback</li>\r\n                <li>Allows customers to state if Like or Dislike</li>\r\n                <li>Tweets</li>\r\n                <li>Allows Pins with Pinterest</li>\r\n            </ol>\r', '', 1349431099, 2);

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
(1, 115, 'a'),
(2, 115, 'a'),
(1, 116, 'richard'),
(2, 116, 'test'),
(1, 86, 'edward'),
(2, 86, 'test'),
(1, 118, 'emily'),
(2, 118, 'test'),
(1, 119, 'new'),
(2, 119, 'text'),
(1, 120, 'c'),
(2, 120, 'new'),
(1, 121, 'asndjajdjai239847123987498274(*&(*&#($*&@(*$&)(@#8098904:":":L"L:"L:";'''';;ll;;l''l''l6uu65&^%$^#%$@$#!@$#@!#!@#!@#%^&%*&^&(*^*(&(#!#~#!#@!$#@#%&^(*'),
(2, 121, ''''),
(1, 122, 'ad'),
(2, 122, 'asda'),
(1, 123, 'sf'),
(2, 123, 'sdf'),
(2, 125, 'test123'),
(1, 125, 'test123'),
(1, 126, 'ASD'),
(2, 126, 'ASD'),
(1, 127, 'ammarammar'),
(2, 127, 'asim'),
(1, 128, 'ali'),
(2, 128, 'akram'),
(1, 129, 'muhammad'),
(2, 129, 'adnan');

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

--
-- Dumping data for table `search_dataset`
--


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

--
-- Dumping data for table `search_index`
--


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

--
-- Dumping data for table `search_node_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `search_total`
--

CREATE TABLE IF NOT EXISTS `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '',
  `count` float DEFAULT NULL,
  PRIMARY KEY (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `search_total`
--


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

--
-- Dumping data for table `semaphore`
--


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
(1, 'gsv6icpgahkm7rq3qnk3gj8dj7', '115.186.146.97', 1349180956, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'u2rq3vejt34fl9iarhmsp09p41', '115.186.146.97', 1349180953, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'g8epg95e8apvp64lm1h4dce9p7', '115.186.146.97', 1349180923, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'j6db3elrir902g4pf9ij2o7fs2', '115.186.146.97', 1349180876, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'urk2joriam2d3fkimqlek0co06', '115.186.146.97', 1349180649, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(0, 'oqaor8rpna56vrh0cim4d49fv3', '24.251.235.228', 1349014742, 0, ''),
(1, 'hq6jjhpc1mojebcqfm6319ce66', '115.186.146.97', 1349180545, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'iud9qpn1lcjdk9u5hrek3s6f90', '182.180.65.160', 1349680002, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'm4lbs3b65u1kc78mslj03sn9f5', '115.186.146.97', 1349180171, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'dubcrbgrmqug57pmt01valqtj4', '115.186.146.97', 1349180171, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '8lbr15d4guuudjjb5491nu5t32', '115.186.146.97', 1349177191, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(0, 'soui6bl7uaaf3aoknqvu8cfs24', '115.186.146.97', 1349674325, 0, ''),
(1, '1pehf1pk3b3ulliiikphkqv5j1', '115.186.146.97', 1349179717, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'jvrtg5qavavhb2legcbfu7re60', '182.180.65.113', 1349419810, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'ejshpnlr9a7774elt5k7biag30', '115.186.146.97', 1349173206, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '57tru4fg9op65o7kef0i3od081', '115.186.146.97', 1349177221, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'hsmp5he5ejrfpt72kgl6rqrnk7', '115.186.146.97', 1349177225, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '0i8g9gn99bs5g5fkaoa9n5rs71', '115.186.146.97', 1349177343, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'lmjk3nl5vg6o9ko3akmvb5s1o3', '115.186.146.97', 1349177473, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'p7mmtlrj8tokikpu3q9k3ce4v1', '115.186.146.97', 1349177582, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '8t36lhvqqtubrp1q78irocrkh7', '115.186.146.97', 1349177612, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'ktd961liaj89v0vauf5o161mh7', '115.186.146.97', 1349177637, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'liu6k4kluu7geh3rmn50f13u50', '115.186.146.97', 1349177835, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'rd0ndhl0c2jdd2rlhlq0kq2sp0', '115.186.146.97', 1349177839, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'qr8mqf5aik38s9el9qtl3cv945', '115.186.146.97', 1349177849, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '69v1up6drpnt6kcukg3niv76a6', '115.186.146.97', 1349178011, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'a0ttigggg4n8d8qb66u2crd4t1', '115.186.146.97', 1349178221, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 't5s7bmg3pcrj90ndbo17jl3db5', '115.186.146.97', 1349178515, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '8rt72q4qmjla4ne11c8caa3dc3', '115.186.146.97', 1349178628, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'seaig1o1d16rh2764o3epr7ka1', '115.186.146.97', 1349178678, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'bs7v11deqkrbl7gmag48907l84', '115.186.146.97', 1349178999, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '8l7o0rl3ph3ohniughm7fa9o00', '115.186.146.97', 1349179143, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(102, '4o00f2u379us0uguqm0usng8k0', '115.186.146.97', 1349435351, 0, '');
INSERT INTO `sessions` (`uid`, `sid`, `hostname`, `timestamp`, `cache`, `session`) VALUES
(1, 'emt9cjchfc6cg9l3hdvg57dgg6', '115.186.146.97', 1349179180, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'rpqos5m2p3bvmckrss0gmpmf33', '115.186.146.97', 1349179172, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'lnd8raecv8f1u932ds42lui4q0', '115.186.146.97', 1349179177, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'd6uqhgf7p9p0l6n2pr3h5rv756', '115.186.146.97', 1349179235, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '43c093cjjngfecfas3m3dnb8q3', '115.186.146.97', 1349179239, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '5ve7vlkrdk3d3d0qjjggru6jj1', '115.186.146.97', 1349179440, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'qt0pisunusrmnm27fgi2kpi5d0', '115.186.146.97', 1349179479, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'bo2rajj11bklr8c34tmhrr5ph5', '115.186.146.97', 1349180970, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'b4eeoi8pbpk0sfm947kmo4qpi0', '115.186.146.97', 1349180996, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'nik9nevdp601oop9u0grmi72n6', '115.186.146.97', 1349181047, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '03mfci32j8il4g31avp70ioiu2', '115.186.146.97', 1349181098, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '258bvfcn05henu83lsbpnf4ll3', '115.186.146.97', 1349181169, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'o6u3kpisdoo4ah0k1f4k7l8772', '115.186.146.97', 1349181244, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'rmmis20k5ej5rrf1v9bm0qp8c2', '115.186.146.97', 1349181172, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 't8t55u1fqr86vgkfprl0umlmt7', '115.186.146.97', 1349181272, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'pao8l1f9s9i2bmejl6qpcng8c0', '115.186.146.97', 1349181297, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'ef6hsurtk2rnn6boqe8kjieoj1', '115.186.146.97', 1349181304, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'htn3f8ak626m0mtpufpgmejld7', '115.186.146.97', 1349181422, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'v0ubq47onq977a2v0iv48ct2l0', '115.186.146.97', 1349181448, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '5aa4p8voko6ijh73hequdkjhv2', '115.186.146.97', 1349181449, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'j5jle0m5db8qj7rfedl7rlhjb1', '182.180.65.113', 1351167399, 0, 'messages|a:2:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}s:6:"status";a:1:{i:0;s:146:"Created a new user account for <a href="/rmi_test/users/adnannustseecsgmailcom-0"><em>adnan.nustseecs@gmail.com</em></a>. No e-mail has been sent.";}}'),
(1, 'fd7mkjul29oqc2lfofkuhf9jt7', '115.186.146.97', 1349237056, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'luq6nfj6p50kllgtnc138v5mc1', '182.180.65.113', 1349238526, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'rksu84gd2c45boqoo51favh8v7', '182.180.65.113', 1349241557, 0, ''),
(1, 'i89jsfmjd5rdlklvg9bq6n3sr5', '115.186.146.97', 1349241883, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 't9e1ks0kq5tsa4qb3bc92aato6', '115.186.146.97', 1349242449, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'o258ifbnu7ib3m2lld32eva9c6', '115.186.146.97', 1349242449, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'gu8dj6039t90ba0aq1fdgbud70', '115.186.146.97', 1349247240, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(102, '79be8qkih4kmpl7t2dap01ull1', '182.180.65.113', 1349326020, 0, 'edit_subdatagroup_nid|s:1:"3";edit_subdatagroup_sid|s:3:"259";'),
(1, 'rbb4dg11g5jeteil0v4ruqku30', '115.186.146.97', 1349249905, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'r01pbf57v67f46tdim8fp2mce1', '115.186.146.97', 1349247374, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(102, 'gttdg4ghhf17lmp0mj3qomqcr1', '182.180.65.113', 1349870394, 0, 'edit_subdatagroup_nid|s:1:"5";edit_subdatagroup_sid|s:3:"267";messages|a:0:{}'),
(86, 'u0t2e8f0pkl0c6r5631d2t6lt4', '115.186.146.97', 1349439992, 0, ''),
(1, 'jiikr81v25hpdp2uagmmtulgt1', '182.180.65.113', 1349354450, 0, 'messages|a:1:{s:5:"error";a:10:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(102, 'q82v5i09hqjfogfts0qjo614k6', '182.180.65.113', 1349350293, 0, '');
INSERT INTO `sessions` (`uid`, `sid`, `hostname`, `timestamp`, `cache`, `session`) VALUES
(1, 'r9me355ecdpl7ao7695o9240q4', '182.180.65.113', 1349431196, 0, ''),
(1, '2mhem4q0cbu2v7qvkvbhprikd1', '115.186.146.97', 1349669699, 0, ''),
(1, '448r9tedl9ou7p0esidnjkf523', '182.180.65.113', 1349681008, 0, 'messages|a:1:{s:5:"error";a:12:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:11;s:148:"The e-mail address <em>adnan.nustseecs@gmail.com</em> is already registered. <a href="/rmi_test/user/password">Have you forgotten your password?</a>";}}'),
(1, '2u043l62s2jjbodpuq595qd671', '182.180.65.113', 1349785858, 0, 'node_overview_filter|a:0:{}'),
(0, 'i1kf1gf01i1jq6nm7it1evf9a5', '182.180.65.113', 1349682846, 0, ''),
(1, 'icop8lp5rjhle2f176elpthp31', '182.180.65.113', 1349683328, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'la0ivuabgdvsmsaqocutgsfl45', '182.180.65.113', 1349688770, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'ofcbq0v4q7n6g3osvj6os1bb36', '182.180.65.113', 1349688792, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'hqdk5mrcedt0nf2n7agh1qdoi0', '182.180.65.113', 1349689711, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '21tkvgaesogork8p1qfr1tu9c6', '182.180.65.113', 1349949331, 0, ''),
(1, '2e9tj3l84nhjnv17qjp9dgn652', '182.180.65.160', 1350628864, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'c6p2n3ngtmcsfe8k24v0t4m480', '182.180.65.160', 1350628864, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'kfn5gp9cn6ac4i3hsvkq67osl2', '182.180.65.160', 1350628866, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '7i6jkc6sp954bo3qjp0s7t4rp7', '182.180.65.113', 1351074980, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'c25qougjshtdjdihvd8hug9321', '182.180.65.113', 1351075247, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'nmd8lqv9cruq3om52ud2un2j92', '182.180.65.113', 1351075253, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'o36q2h6ssridpbuq7c5r4v4eb7', '182.180.65.113', 1351075387, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'ap8lmjhgkkaiqi78j80bgu0n03', '182.180.65.113', 1351076064, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'leee4101khiphiqk6lv8tsj2o0', '182.180.65.113', 1351079586, 0, ''),
(1, '3mruhhcqkjs917n1l7g4vvlt00', '182.180.65.113', 1351077059, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'e6i74231t5j5j26f2l6n96qpg5', '182.180.65.113', 1351077060, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'prf7p2n18aneadekg30mn2mpe0', '182.180.65.113', 1351077063, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'fju7gnlfsp5qbo4gurlfcbc270', '182.180.65.113', 1351659606, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '4mlqos1gdcp5qe0g0tsscf57p0', '182.180.65.113', 1351669087, 0, ''),
(1, 's83gs521ir812b78e9k722cb17', '182.180.65.113', 1351765191, 0, ''),
(1, '7tg9j59tj9irv4iu1k8o91uua6', '182.180.65.113', 1353475722, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(113, '71ij01ikfffq9hd10t3191mjk3', '182.180.65.113', 1351833450, 0, ''),
(1, 'c9jjf67dvsmq822toleidb0j00', '182.180.65.160', 1352114910, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(0, 'js5mlkavbhfuetmmbbgljdg5t5', '182.180.65.113', 1352871822, 0, ''),
(113, 'o5tcr6ebt2465ckpdkcit3gsb2', '182.180.65.113', 1352970303, 0, 'edit_subdatagroup_nid|s:1:"5";edit_subdatagroup_sid|N;messages|a:0:{}'),
(1, '3kj5pn82mmkq4o22gg12fc8727', '182.180.65.113', 1352978534, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(0, 'bkfaku29v3utl9lh0a1h3ep644', '182.180.65.113', 1353045810, 0, ''),
(1, 'arv32h596siq5e2ve0ab30up73', '182.180.65.113', 1353058606, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'vkatehhrvp2q8191apv4qstma3', '115.186.146.97', 1354248701, 0, ''),
(0, 'bsark9q7jq4pnpqh1p1iakf8u3', '182.180.65.113', 1353303477, 0, ''),
(0, 'n88hkeil4d2k8rivbo8c27l8e3', '182.180.65.113', 1353311769, 0, ''),
(1, '87jr2vqeck2rb3oo1pfbabur04', '182.180.65.113', 1353398669, 0, ''),
(0, 'tqa38r0r515p1uugu1qm4o5di2', '182.180.65.113', 1353393282, 0, ''),
(1, 'v2ie85m8gbadaa62sifu7l4sn0', '182.180.65.113', 1355201168, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'ridrk64u44abjujffgqnqf0ag1', '182.180.65.113', 1353903764, 0, ''),
(1, '5gc7lll9dakq1stdt3duc8lkb5', '115.186.146.97', 1354510769, 0, ''),
(1, 'peo7c22hufng3id5h07sss6r84', '182.180.65.160', 1354861482, 0, ''),
(1, 'q96prtdn7v4meu06urbskb06j4', '182.180.65.160', 1355114040, 0, ''),
(1, 'uq07rdp6hv5m7bck667br8rff2', '182.180.65.113', 1355142786, 0, ''),
(1, 'co1t36t2m8ol9mbqm4rvqr9aq4', '182.180.65.113', 1356688403, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'hage4icc07634p635r7b9jf4f5', '182.180.65.113', 1355807620, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'q4fmjtd78hn86i4gjlf57t3t42', '182.180.65.113', 1357014262, 0, ''),
(1, 'e6gb579ubjul90p2iaepi4bhb5', '182.180.65.113', 1357019596, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'nrjg02nbp32jotf8qdj2sfss44', '182.180.65.113', 1357037312, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}');
INSERT INTO `sessions` (`uid`, `sid`, `hostname`, `timestamp`, `cache`, `session`) VALUES
(1, 'cl3mmhele546o0rc92chcrumk3', '182.180.65.113', 1357037312, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'aco6brgst593go273n5lq9f900', '182.180.65.113', 1357037433, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(0, 'nngdsd78jp20g389kb899orbt2', '182.180.65.113', 1357037315, 0, ''),
(1, 'lmiolt1no55l1fubr1pb1kll46', '182.180.65.113', 1357192500, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '745nj192he82cbjk7812018qo7', '182.180.65.113', 1357192684, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'dfujp5psjj46gu5fl6ob825pr7', '182.180.65.113', 1357192686, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '260tsmgrvkdksga92mtqt2rcf4', '182.180.65.113', 1357192781, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(0, '1jasvle35ot7efp5k31orvcd70', '182.180.65.113', 1357563771, 0, ''),
(0, 't692olbfadeir82l4oibifffj3', '115.186.146.97', 1358224692, 0, ''),
(1, 'ee3u92uvks6hhlkdf8tjshsh00', '115.186.146.97', 1358409708, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'gfugakbtokigd9jrnlgm6418o2', '182.180.65.113', 1357799377, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'c0eps9rfo5141hl33dv9v5q192', '182.180.65.113', 1357879420, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'ccnl8r5advre93a55ihkt9tan0', '115.186.146.97', 1358486663, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '9hcbn48ioddalb6abd2v5g8no5', '115.186.146.97', 1358834201, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'pc7691iq4hsu56uujgm13vc6c5', '115.186.146.97', 1359008943, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, '0liqupsr8iq8tihtssk6k58ei0', '182.180.65.113', 1359714063, 0, 'messages|a:1:{s:5:"error";a:11:{i:0;s:134:"warning: Parameter 3 to block_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:1;s:136:"warning: Parameter 3 to comment_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:2;s:136:"warning: Parameter 2 to contact_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:3;s:134:"warning: Parameter 2 to dblog_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:4;s:133:"warning: Parameter 2 to node_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:5;s:136:"warning: Parameter 2 to profile_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:6;s:135:"warning: Parameter 3 to system_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:7;s:133:"warning: Parameter 2 to user_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:8;s:142:"warning: Parameter 2 to logintoboggan_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:9;s:137:"warning: Parameter 2 to pathauto_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";i:10;s:135:"warning: Parameter 2 to chgpwd_user() expected to be a reference, value given in D:\\www\\sites\\rmi_test\\includes\\module.inc on line 497.";}}'),
(1, 'mk75dep0tem8e7iqtg21aukor1', '115.186.146.97', 1360834295, 0, 'node_overview_filter|a:0:{}'),
(1, 'i94mapphnc9aijesof54f62a84', '127.0.0.1', 1361426338, 0, '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=606 ;

--
-- Dumping data for table `sub_datagroup_submissions`
--

INSERT INTO `sub_datagroup_submissions` (`ssid`, `nid`, `sid`, `uid`, `submitted`, `cid`, `title`) VALUES
(569, 4, 238, 1, 1349156007, 7, 'Letters of recommendation'),
(570, 4, 238, 1, 1349156030, 7, 'Letters of recommendation'),
(572, 5, 239, 1, 1349156617, 10, 'Implants'),
(571, 5, 239, 1, 1349156617, 6, 'Surgeries'),
(605, 5, 278, 113, 1352966402, 10, 'Implants'),
(604, 5, 278, 113, 1352966402, 6, 'Surgeries'),
(603, 3, 273, 113, 1352965576, 15, 'Loans'),
(602, 3, 273, 113, 1352965576, 11, 'Credit Score'),
(601, 3, 273, 113, 1352965576, 5, 'Credit / Debit Cards'),
(600, 3, 273, 113, 1352965576, 1, 'Bank Account'),
(599, 3, 273, 113, 1352965576, 1, 'Bank Account'),
(598, 14, 269, 113, 1352965210, 4, 'Telephone '),
(597, 5, 267, 102, 1349678406, 10, 'Implants'),
(596, 4, 248, 102, 1349678266, 7, 'Letters of recommendation'),
(595, 4, 248, 102, 1349678239, 7, 'Letters of recommendation'),
(594, 5, 268, 86, 1349433415, 10, 'Implants'),
(593, 5, 268, 86, 1349433415, 6, 'Surgeries'),
(592, 5, 267, 102, 1349678406, 10, 'Implants'),
(591, 5, 267, 102, 1349678406, 6, 'Surgeries'),
(590, 5, 263, 102, 1349353900, 6, 'Surgeries'),
(589, 5, 263, 102, 1349353900, 10, 'Implants'),
(588, 14, 261, 102, 1349337262, 4, 'Telephone '),
(587, 14, 260, 86, 1349271292, 4, 'Telephone '),
(580, 14, 255, 86, 1349263993, 4, 'Telephone '),
(577, 14, 253, 1, 1349260618, 4, 'Telephone '),
(575, 14, 250, 102, 1349258073, 4, 'Telephone '),
(573, 4, 248, 102, 1349250015, 7, 'Letters of recommendation'),
(581, 14, 255, 86, 1349263993, 4, 'Telephone '),
(561, 14, 235, 1, 1349094384, 4, 'Telephone '),
(560, 14, 235, 1, 1349094384, 4, 'Telephone '),
(562, 14, 235, 1, 1349094384, 4, 'Telephone '),
(563, 3, 237, 1, 1349095606, 1, 'Bank Account'),
(564, 3, 237, 1, 1349095606, 5, 'Credit / Debit Cards'),
(565, 3, 237, 1, 1349095606, 11, 'Credit Score'),
(566, 3, 237, 1, 1349095606, 15, 'Loans');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1291 ;

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
(1290, 605, 14, 'fooka'),
(1289, 605, 13, 'Dental Implants'),
(1288, 605, 12, '2015-3-3'),
(1287, 605, 17, 'asad'),
(1286, 604, 9, 'no'),
(1285, 604, 8, '1972-1-3'),
(1284, 604, 16, 'face'),
(1283, 603, 19, '000'),
(1282, 603, 18, '1971-2-3'),
(1281, 603, 17, 'Home'),
(1280, 603, 24, 'Loan'),
(1279, 602, 14, '5000000'),
(1278, 602, 13, '1973-2-1'),
(1277, 602, 23, 'adnan rao'),
(1276, 601, 10, '****'),
(1275, 601, 7, '2012-2-2'),
(1274, 601, 9, '01312316546546546'),
(1273, 601, 8, 'VISA'),
(1272, 601, 22, 'Muhammad Adnan'),
(1271, 600, 4, ''),
(1270, 600, 3, ''),
(1269, 600, 21, 'Muhammad ADNAN'),
(1268, 599, 4, '01312316546546546'),
(1267, 599, 3, 'Checking'),
(1266, 599, 21, 'stan chart'),
(1265, 598, 8, '(302) 786-7895'),
(1264, 598, 6, 'Cell'),
(1263, 598, 10, 'Vizteck'),
(1262, 597, 0, 'Remove'),
(1261, 597, 14, 'hello'),
(1260, 597, 13, 'Joint replacement: Elbow'),
(1259, 597, 12, '--'),
(1258, 596, 10, ''),
(1257, 596, 16, ''),
(1256, 596, 9, 'came'),
(1255, 596, 8, ''),
(1254, 595, 10, ''),
(1182, 571, 16, ' Surgery Title a'),
(1185, 572, 17, 'Implant Title EM'),
(1186, 572, 12, '2003-3-20'),
(1184, 571, 9, 'Accident'),
(1183, 571, 8, '2007-3-2'),
(1253, 595, 16, ''),
(1252, 595, 9, 'moon'),
(1251, 595, 8, ''),
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
(1241, 592, 12, '1970-01-03'),
(1240, 592, 17, 'Knee'),
(1239, 591, 9, 'Ahs'),
(1238, 591, 8, '1970-01-01'),
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
(1141, 560, 6, 'Home'),
(1140, 560, 10, 'Nelson Home'),
(1142, 560, 8, '(213) 211-2952'),
(1143, 561, 10, 'Nelson Cell'),
(1144, 561, 6, 'Cell'),
(1145, 561, 8, '(856) 966-5787'),
(1146, 561, 0, 'Remove'),
(1147, 562, 10, 'Nelson other'),
(1148, 562, 6, 'Office'),
(1149, 562, 8, '(855) 975-5123'),
(1150, 562, 0, 'Remove'),
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
(1165, 566, 19, '100');

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
('sites/all/modules/html_title/html_title.module', 'html_title', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:10:"Html title";s:11:"description";s:39:"Enables html to be used in node titles.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.4";s:7:"project";s:10:"html_title";s:9:"datestamp";s:10:"1344006125";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');

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

--
-- Dumping data for table `term_data`
--


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

--
-- Dumping data for table `term_hierarchy`
--


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

--
-- Dumping data for table `term_node`
--


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

--
-- Dumping data for table `term_relation`
--


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

--
-- Dumping data for table `term_synonym`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `url_alias`
--

INSERT INTO `url_alias` (`pid`, `src`, `dst`, `language`) VALUES
(1, 'node/17', 'content/contact-us', ''),
(2, 'node/18', 'content/how-it-works', ''),
(3, 'node/15', 'content/home', ''),
(5, 'node/20', 'content/about-us', ''),
(6, 'node/14', 'content/contact-info', ''),
(19, 'user/100', 'users/muhammadusmabvizteckcom', ''),
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
(66, 'node/30', 'content/business-rmi-plan', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=115 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `name`, `pass`, `mail`, `mode`, `sort`, `threshold`, `theme`, `signature`, `signature_format`, `created`, `access`, `login`, `status`, `timezone`, `language`, `picture`, `init`, `data`) VALUES
(0, '', '', '', 0, 0, 0, '', '', 0, 0, 0, 0, 0, NULL, '', '', '', NULL),
(1, 'admin', 'b59c67bf196a4758191e42f76670ceba', 'admin@rmi.com', 0, 0, 0, '', '', 0, 1338534886, 1361426338, 1361169618, 1, '18000', '', '', 'qamar.munir@vizteck.com', 'a:1:{s:13:"form_build_id";s:37:"form-71594644b3e14de0517007910b744a62";}'),
(89, 'New Test', '4b30918a92a0357c73a63de35bc3eec4', 'sdjlkl@fghgh', 0, 0, 0, '', '', 0, 1343819082, 0, 0, 1, '18000', '', '', 'sdjlkl@fghgh', 'a:0:{}'),
(90, 'sat', 'd34ba807e60faca55d734ab9e9e1c5fe', 'asdfdsaf@dfghdhdf', 0, 0, 0, '', '', 0, 1343819172, 0, 0, 1, '18000', '', '', 'asdfdsaf@dfghdhdf', 'a:0:{}'),
(86, 'edward tester', '4124bc0a9335c27f086f24ba207a4912', 'edwardtester99@gmail.com', 0, 0, 0, '', '', 0, 1342610810, 1349439992, 1349435783, 1, '18000', '', '', 'edwardtester99@gmail.com', 'a:1:{s:13:"form_build_id";s:37:"form-c82f4a357e810662f7309a6c71e988bb";}'),
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
(100, 'gil_ortega@msn.com', '5466858c9e4010c3e8add21d56ef50a9', 'gil_ortega@msn.com', 0, 0, 0, '', '', 0, 1344449071, 1347137188, 1347137188, 1, '18000', '', '', 'gil_ortega@msn.com', 'a:0:{}'),
(102, 'test@gmail.com', '0cc175b9c0f1b6a831c399e269772661', 'test@gmail.com', 0, 0, 0, '', '', 0, 1345186421, 1349870394, 1349350248, 1, '18000', '', '', 'test@gmail.com', 'a:0:{}'),
(103, 'maria@tekyz.com', '1dfb6b98aef3416e03d50fd2fb525600', 'maria@tekyz.com', 0, 0, 0, '', '', 0, 1345472777, 1347248296, 1347052603, 1, '18000', '', '', 'maria@tekyz.com', 'a:0:{}'),
(104, 'a@d.com', '0cc175b9c0f1b6a831c399e269772661', 'a@d.com', 0, 0, 0, '', '', 0, 1346393799, 1346393799, 0, 1, '18000', '', '', 'a@d.com', 'a:0:{}'),
(105, 't@test.com', 'c4ca4238a0b923820dcc509a6f75849b', 't@test.com', 0, 0, 0, '', '', 0, 1346399348, 1346399348, 0, 1, '18000', '', '', 't@test.com', 'a:0:{}'),
(106, 'a@test.com', '0cc175b9c0f1b6a831c399e269772661', 'a@test.com', 0, 0, 0, '', '', 0, 1346409781, 1346409781, 0, 1, '18000', '', '', 'a@test.com', 'a:0:{}'),
(107, 'kousar.aslam@vizteck.com', '0cc175b9c0f1b6a831c399e269772661', 'kousar.aslam@vizteck.com', 0, 0, 0, '', '', 0, 1346676671, 1346820668, 1346676671, 1, '18000', '', '', 'kousar.aslam@vizteck.com', 'a:0:{}'),
(108, 'Tennismtrav@yahoo.com', '1dfb6b98aef3416e03d50fd2fb525600', 'Tennismtrav@yahoo.com', 0, 0, 0, '', '', 0, 1346704540, 1346704540, 1346704540, 1, '-25200', '', '', 'Tennismtrav@yahoo.com', 'a:0:{}'),
(109, 'frederickorville@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 'frederickorville@gmail.com', 0, 0, 0, '', '', 0, 1346738059, 1347348779, 1347348779, 1, '18000', '', '', 'frederickorville@gmail.com', 'a:0:{}'),
(110, 'gil@infinitudeinc.com', '5466858c9e4010c3e8add21d56ef50a9', 'gil@infinitudeinc.com', 0, 0, 0, '', '', 0, 1347135924, 1347136867, 1347135924, 1, '-25200', '', '', 'gil@infinitudeinc.com', 'a:0:{}'),
(111, 'a@v.com', '0cc175b9c0f1b6a831c399e269772661', 'a@v.com', 0, 0, 0, '', '', 0, 1347362210, 1347362210, 0, 1, '18000', '', '', 'a@v.com', 'a:0:{}'),
(112, 's@dg.com', '4124bc0a9335c27f086f24ba207a4912', 's@dg.com', 0, 0, 0, '', '', 0, 1348117263, 1348126289, 1348117263, 1, '18000', '', '', 's@dg.com', 'a:2:{s:8:"old_pass";s:1:"a";s:13:"form_build_id";s:37:"form-417799a0fc35d8e64efd55024fe7d2c3";}'),
(113, 'adnan.nustseecs@gmail.com', 'dc61bca8bfb8305a77c0e591191d48fc', 'adnan.nustseecs@gmail.com', 0, 0, 0, '', '', 0, 1349237516, 1352970268, 1352965173, 1, '18000', '', '', 'adnan.nustseecs@gmail.com', 'a:0:{}'),
(114, 'angel.eyz16@gmail.com', 'dc61bca8bfb8305a77c0e591191d48fc', 'angel.eyz16@gmail.com', 0, 0, 0, '', '', 0, 1349239321, 1349239321, 0, 1, '18000', '', '', 'angel.eyz16@gmail.com', 'a:0:{}');

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

--
-- Dumping data for table `users_roles`
--


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
('css_js_query_string', 's:20:"2EJ5vaeIUfiMOFxLADTz";'),
('install_profile', 's:7:"default";'),
('update_last_check', 'i:1361179888;'),
('file_directory_temp', 's:11:"E:/wamp/tmp";'),
('javascript_parsed', 'a:0:{}'),
('cron_last', 'i:1339510898;'),
('webform_addmore_1', 'a:6:{s:5:"label";s:8:"Add More";s:0:"";i:0;i:5;i:1;i:4;N;i:7;i:1;i:16;N;}'),
('services_use_content_permissions', 'i:1;'),
('imagefield_thumb_size', 's:5:"66x47";'),
('site_slogan', 's:0:"";'),
('site_mission', 's:0:"";'),
('site_footer', 's:134:"<ul>\r\n<li class="first"><a href="/rmi/content/privacy-policy">Privacy</a></li>\r\n<li><a href="/rmi/content/terms">Terms</a></li>\r\n</ul>";'),
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
('menu_attributes_accesskey_default', 's:0:"";');

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

--
-- Dumping data for table `vocabulary`
--


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

--
-- Dumping data for table `vocabulary_node_types`
--


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

--
-- Dumping data for table `watchdog`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

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
(14, 1, 0, 'name', 'Name', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 8),
(14, 2, 0, 'address', 'Address', 'textarea', '', 'a:11:{s:13:"title_display";i:0;s:7:"private";i:0;s:9:"resizable";i:1;s:8:"disabled";i:0;s:20:"conditional_operator";s:1:"=";s:4:"cols";s:0:"";s:4:"rows";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 9),
(2, 1, 0, 'dob', 'DOB', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1970";s:8:"end_date";s:11:"Dec 31 2011";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 3),
(2, 2, 0, 'ssn', 'SSN', 'ssn', '', 'a:11:{s:4:"mask";i:0;s:13:"title_display";s:4:"none";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:3:"ssn";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 4),
(3, 1, 0, 'bank_account', 'Bank Account', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 21),
(3, 2, 1, 'info', 'Info', 'fieldset', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 1),
(3, 3, 2, 'account_type_bank', 'Account Type', 'select', '', 'a:14:{s:5:"items";s:73:"Checking|Checking \r\nSavings|Savings\r\nRetirement |Retirement \r\nOther|Other";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 27),
(3, 4, 2, 'account_number_bank', 'Account #', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 28),
(3, 5, 0, 'credit___debit_cards', 'Credit / Debit Cards', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 22),
(3, 8, 6, 'account_type', 'Account Type', 'select', '', 'a:14:{s:5:"items";s:86:"MasterCard|MasterCard\r\nVISA|VISA\r\nAmerican Express|American Express\r\nDiscover|Discover";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 30),
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
(5, 8, 7, 'date_surgeries', 'Date', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1970";s:8:"end_date";s:11:"Dec 31 2012";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 23),
(5, 9, 7, 'reason', 'Reason', 'textfield', '', 'a:13:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 24),
(6, 1, 0, 'expense_type', 'Expense Type', 'select', '', 'a:14:{s:5:"items";s:161:"Mortgage|Mortgage\r\nRent|Rent\r\nAuto|Auto\r\nWater|Water\r\nCable|Cable\r\nPhone|Phone\r\nInternet|Internet\r\nGroceries|Groceries\r\nGas|Gas\r\nChildcare|Childcare\r\nOther|Other";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 4),
(5, 10, 0, 'implants', 'Implants', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 21),
(5, 11, 10, 'info', 'Info', 'fieldset', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 10),
(5, 12, 11, 'date_implants', 'Date', 'date', '', 'a:11:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:10:"Jan 1 1970";s:8:"end_date";s:11:"Dec 31 2020";s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 26),
(5, 13, 11, 'type', 'Type', 'select', '', 'a:14:{s:5:"items";s:354:"Joint replacement: Shoulder|Joint replacement: Shoulder\r\nJoint replacement: Elbow|Joint replacement: Elbow\r\nJoint replacement: Hip|Joint replacement: Hip\r\nJoint replacement: Knee|Joint replacement: Knee\r\nJoint replacement: Ankle|Joint replacement: Ankle\r\nDental Breast Augmentation|Dental Breast Augmentation\r\nDental Implants|Dental Implants\r\nOther|Other";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:1;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 27),
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
(9, 3, 0, 'notes', 'Notes', 'textarea', '', 'a:11:{s:13:"title_display";i:0;s:7:"private";i:0;s:9:"resizable";i:1;s:8:"disabled";i:0;s:20:"conditional_operator";s:1:"=";s:4:"cols";s:0:"";s:4:"rows";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 6),
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
(14, 9, 0, 'title', 'Title', 'textfield', '', 'a:5:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";}', 1, 7),
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

--
-- Dumping data for table `webform_emails`
--


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

--
-- Dumping data for table `webform_last_download`
--


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

--
-- Dumping data for table `webform_submissions`
--


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

--
-- Dumping data for table `webform_submitted_data`
--


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
