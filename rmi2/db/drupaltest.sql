-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 18, 2012 at 12:48 PM
-- Server version: 5.1.36
-- PHP Version: 5.2.5

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

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
(11, 'search', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', -1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `datagroup_submissions`
--

INSERT INTO `datagroup_submissions` (`sid`, `nid`, `uid`, `is_draft`, `submitted`, `remote_addr`) VALUES
(1, 1, 1, 0, 1339770268, '127.0.0.1');

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
(1, 1, 4, 'test name', 1),
(1, 1, 5, 'Test Address', 1),
(1, 1, 6, 'test@test.com', 1);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `files`
--


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flood`
--


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
(1, 1, 1340004653),
(1, 2, 1339680831);

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
('secondary-links', 'Secondary links', 'Secondary links are often used for pages like legal notices, contact details, and other secondary navigation items that play a lesser role than primary links');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=209 ;

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
('navigation', 106, 11, 'node/add/page', 'node/add/page', 'Page', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 106, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 107, 11, 'node/add/story', 'node/add/story', 'Story', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 107, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 108, 15, 'admin/help/update', 'admin/help/update', 'update', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 108, 0, 0, 0, 0, 0, 0, 0),
('navigation', 109, 105, 'admin/reports/updates/check', 'admin/reports/updates/check', 'Manual update check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 105, 109, 0, 0, 0, 0, 0, 0),
('navigation', 110, 10, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Page', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 110, 0, 0, 0, 0, 0, 0, 0),
('navigation', 111, 10, 'admin/content/node-type/story', 'admin/content/node-type/story', 'Story', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 111, 0, 0, 0, 0, 0, 0, 0),
('navigation', 112, 0, 'admin/content/node-type/page/delete', 'admin/content/node-type/page/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 113, 0, 'admin/content/node-type/story/delete', 'admin/content/node-type/story/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 113, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 115, 11, 'node/add/webform', 'node/add/webform', 'Webform', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:138:"Create a new form or questionnaire accessible to users. Submission results and statistics are recorded and accessible to privileged users.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 115, 0, 0, 0, 0, 0, 0, 0, 0),
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
('navigation', 208, 15, 'admin/help/datagroup_services', 'admin/help/datagroup_services', 'datagroup_services', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 208, 0, 0, 0, 0, 0, 0, 0);

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
('batch', '', '', '1', 'a:0:{}', 'system_batch_page', 'a:0:{}', 1, 1, '', 'batch', '', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 1, 1, '', 'admin', 'Administer', 't', '', 6, '', '', '', 9, 'modules/system/system.admin.inc'),
('logout', '', '', 'user_is_logged_in', 'a:0:{}', 'user_logout', 'a:0:{}', 1, 1, '', 'logout', 'Log out', 't', '', 6, '', '', '', 10, 'modules/user/user.pages.inc'),
('search', '', '', 'user_access', 'a:1:{i:0;s:14:"search content";}', 'search_view', 'a:0:{}', 1, 1, '', 'search', 'Search', 't', '', 20, '', '', '', 0, 'modules/search/search.pages.inc'),
('user', '', '', '1', 'a:0:{}', 'user_page', 'a:0:{}', 1, 1, '', 'user', 'User account', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('user/login', '', '', 'user_is_anonymous', 'a:0:{}', 'user_page', 'a:0:{}', 3, 2, 'user', 'user', 'Log in', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc'),
('system/files', '', '', '1', 'a:0:{}', 'file_download', 'a:0:{}', 3, 2, '', 'system/files', 'File download', 't', '', 4, '', '', '', 0, ''),
('ahah_helper/%', 'a:1:{i:1;s:26:"ahah_helper_form_item_load";}', '', '1', 'a:0:{}', 'ahah_helper_render', 'a:1:{i:0;i:1;}', 2, 2, '', 'ahah_helper/%', '', 't', '', 4, '', '', '', 0, ''),
('taxonomy/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_autocomplete', 'a:0:{}', 3, 2, '', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('admin/by-module', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_by_module', 'a:0:{}', 3, 2, 'admin', 'admin', 'By module', 't', '', 128, '', '', '', 2, 'modules/system/system.admin.inc'),
('admin/by-task', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 3, 2, 'admin', 'admin', 'By task', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/compact', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_compact_page', 'a:0:{}', 3, 2, '', 'admin/compact', 'Compact mode', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('filter/tips', '', '', '1', 'a:0:{}', 'filter_tips_long', 'a:0:{}', 3, 2, '', 'filter/tips', 'Compose tips', 't', '', 20, '', '', '', 0, 'modules/filter/filter.pages.inc'),
('node/add', '', '', '_node_add_access', 'a:0:{}', 'node_add_page', 'a:0:{}', 3, 2, '', 'node/add', 'Create content', 't', '', 6, '', '', '', 1, 'modules/node/node.pages.inc'),
('comment/delete', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_delete', 'a:0:{}', 3, 2, '', 'comment/delete', 'Delete comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.admin.inc'),
('comment/edit', '', '', 'user_access', 'a:1:{i:0;s:13:"post comments";}', 'comment_edit', 'a:0:{}', 3, 2, '', 'comment/edit', 'Edit comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.pages.inc'),
('admin/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_main', 'a:0:{}', 3, 2, '', 'admin/help', 'Help', 't', '', 6, '', '', '', 9, 'modules/help/help.admin.inc'),
('services/%', 'a:1:{i:1;N;}', '', 'services_access_menu', 'a:0:{}', 'services_server', 'a:1:{i:0;i:1;}', 2, 2, '', 'services/%', 'Services', 't', '', 4, '', '', '', 0, ''),
('user/register', '', '', 'user_register_access', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:13:"user_register";}', 3, 2, 'user', 'user', 'Create new account', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('user/password', '', '', 'user_is_anonymous', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:9:"user_pass";}', 3, 2, 'user', 'user', 'Request new password', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('user/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:20:"access user profiles";}', 'user_autocomplete', 'a:0:{}', 3, 2, '', 'user/autocomplete', 'User autocomplete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/content', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/content', 'Content management', 't', '', 6, '', 'Manage your site''s content.', 'left', -10, 'modules/system/system.admin.inc'),
('admin/reports', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/reports', 'Reports', 't', '', 6, '', 'View reports from system logs and other status information.', 'left', 5, 'modules/system/system.admin.inc'),
('admin/build', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/build', 'Site building', 't', '', 6, '', 'Control how your site looks and feels.', 'right', -10, 'modules/system/system.admin.inc'),
('admin/settings', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_settings_overview', 'a:0:{}', 3, 2, '', 'admin/settings', 'Site configuration', 't', '', 6, '', 'Adjust basic site configuration options.', 'right', -5, 'modules/system/system.admin.inc'),
('node/%', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'node/%', '', 'node_page_title', 'a:1:{i:0;i:1;}', 4, '', '', '', 0, ''),
('admin/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/user', 'User management', 't', '', 6, '', 'Manage your site''s users, groups and access to site features.', 'left', 0, 'modules/system/system.admin.inc'),
('user/%', 'a:1:{i:1;s:22:"user_uid_optional_load";}', 'a:1:{i:1;s:24:"user_uid_optional_to_arg";}', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'user/%', 'My account', 'user_page_title', 'a:1:{i:0;i:1;}', 6, '', '', '', 0, 'modules/user/user.pages.inc'),
('node/%/view', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'View', 't', '', 136, '', '', '', -10, ''),
('user/%/view', 'a:1:{i:1;s:9:"user_load";}', '', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'View', 't', '', 136, '', '', '', -10, 'modules/user/user.pages.inc'),
('admin/settings/actions', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 7, 3, '', 'admin/settings/actions', 'Actions', 't', '', 6, '', 'Manage the actions defined for your site.', '', 0, ''),
('admin/user/rules', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 7, 3, '', 'admin/user/rules', 'Access rules', 't', '', 6, '', 'List and create rules to disallow usernames, e-mail addresses, and IP addresses.', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/updates', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', 7, 3, '', 'admin/reports/updates', 'Available updates', 't', '', 6, '', 'Get a status report about available updates for your installed modules and themes.', '', 10, 'modules/update/update.report.inc'),
('admin/build/block', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 7, 3, '', 'admin/build/block', 'Blocks', 't', '', 6, '', 'Configure what block content appears in your site''s sidebars and other regions.', '', 0, 'modules/block/block.admin.inc'),
('admin/content/comment', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 7, 3, '', 'admin/content/comment', 'Comments', 't', '', 6, '', 'List and edit site comments and the comment moderation queue.', '', 0, 'modules/comment/comment.admin.inc'),
('admin/content/types', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'node_overview_types', 'a:0:{}', 7, 3, '', 'admin/content/types', 'Content types', 't', '', 6, '', 'Manage posts by content type, including default status, front page promotion, etc.', '', 0, 'modules/node/content_types.inc'),
('admin/settings/logging', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_logging_overview', 'a:0:{}', 7, 3, '', 'admin/settings/logging', 'Logging and alerts', 't', '', 6, '', 'Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destination, such as syslog, database, email, ...etc.', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/dblog', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_overview', 'a:0:{}', 7, 3, '', 'admin/reports/dblog', 'Recent log entries', 't', '', 6, '', 'View events that have recently been logged.', '', -1, 'modules/dblog/dblog.admin.inc'),
('admin/build/services', '', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', 'services_admin_browse_index', 'a:0:{}', 7, 3, '', 'admin/build/services', 'Services', 't', '', 6, '', 'Allows external applications to communicate with Drupal.', '', 0, 'sites/all/modules/services/services_admin_browse.inc'),
('admin/reports/status', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_status', 'a:0:{}', 7, 3, '', 'admin/reports/status', 'Status report', 't', '', 6, '', 'Get a status report about your site''s operation and any detected problems.', '', 10, 'modules/system/system.admin.inc'),
('taxonomy/term/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_term_page', 'a:1:{i:0;i:2;}', 6, 3, '', 'taxonomy/term/%', 'Taxonomy term', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('node/%/done', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', '_webform_confirmation', 'a:1:{i:0;i:1;}', 5, 3, '', 'node/%/done', 'Webform confirmation', 't', '', 4, '', '', '', 0, ''),
('admin/help/block', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/block', 'block', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/color', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/color', 'color', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/comment', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/comment', 'comment', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/datagroup_services', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/datagroup_services', 'datagroup_services', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/dblog', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/dblog', 'dblog', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/filter', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/filter', 'filter', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/help', 'help', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/menu', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/menu', 'menu', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/node', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/node', 'node', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/search', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/search', 'search', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/services', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/services', 'services', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/system', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/system', 'system', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/taxonomy', 'taxonomy', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/update', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/update', 'update', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/user', 'user', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/webform', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/webform', 'webform', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/settings/clean-urls', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_clean_url_settings";}', 7, 3, '', 'admin/settings/clean-urls', 'Clean URLs', 't', '', 6, '', 'Enable or disable clean URLs for your site.', '', 0, 'modules/system/system.admin.inc'),
('admin/content/node', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 7, 3, '', 'admin/content/node', 'Content', 't', '', 6, '', 'View, edit, and delete your site''s content.', '', 0, 'modules/node/node.admin.inc'),
('admin/settings/date-time', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_date_time_settings";}', 7, 3, '', 'admin/settings/date-time', 'Date and time', 't', '', 6, '', 'Settings for how Drupal displays date and time, as well as the system''s default timezone.', '', 0, 'modules/system/system.admin.inc'),
('node/%/delete', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"delete";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"node_delete_confirm";i:1;i:1;}', 5, 3, '', 'node/%/delete', 'Delete', 't', '', 4, '', '', '', 1, 'modules/node/node.pages.inc'),
('user/%/delete', 'a:1:{i:1;s:9:"user_load";}', '', 'user_delete_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"user_confirm_delete";i:1;i:1;}', 5, 3, '', 'user/%/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('node/%/edit', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'node_page_edit', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Edit', 't', '', 128, '', '', '', 1, 'modules/node/node.pages.inc'),
('admin/settings/error-reporting', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:31:"system_error_reporting_settings";}', 7, 3, '', 'admin/settings/error-reporting', 'Error reporting', 't', '', 6, '', 'Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/file-system', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_file_system_settings";}', 7, 3, '', 'admin/settings/file-system', 'File system', 't', '', 6, '', 'Tell Drupal where to store uploaded files and how they are accessed.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/image-toolkit', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:29:"system_image_toolkit_settings";}', 7, 3, '', 'admin/settings/image-toolkit', 'Image toolkit', 't', '', 6, '', 'Choose which image toolkit to use if you have installed optional toolkits.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/filters', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 7, 3, '', 'admin/settings/filters', 'Input formats', 't', '', 6, '', 'Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.', '', 0, 'modules/filter/filter.admin.inc'),
('admin/build/menu', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 7, 3, '', 'admin/build/menu', 'Menus', 't', '', 6, '', 'Control your site''s navigation menu, primary links and secondary links, as well as rename and reorganize menu items.', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/modules', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 7, 3, '', 'admin/build/modules', 'Modules', 't', '', 6, '', 'Enable or disable add-on modules for your site.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/performance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_performance_settings";}', 7, 3, '', 'admin/settings/performance', 'Performance', 't', '', 6, '', 'Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.', '', 0, 'modules/system/system.admin.inc'),
('admin/user/permissions', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_perm";}', 7, 3, '', 'admin/user/permissions', 'Permissions', 't', '', 6, '', 'Determine access to features by selecting permissions for roles.', '', 0, 'modules/user/user.admin.inc'),
('admin/content/node-settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_configure";}', 7, 3, '', 'admin/content/node-settings', 'Post settings', 't', '', 6, '', 'Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.', '', 0, 'modules/node/node.admin.inc'),
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
('admin/build/modules/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'List', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/taxonomy/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 15, 4, 'admin/content/taxonomy', 'admin/content/taxonomy', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/settings/filters/list', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'List', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/user/rules/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc'),
('admin/user/user/list', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 15, 4, 'admin/user/user', 'admin/user/user', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc'),
('admin/content/comment/new', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Published comments', 't', '', 136, '', '', '', -10, 'modules/comment/comment.admin.inc'),
('user/%/edit/account', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 11, 4, 'user/%/edit', 'user/%', 'Account', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/build/services/browse', '', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', 'services_admin_browse_index', 'a:0:{}', 15, 4, 'admin/build/services', 'admin/build/services', 'Browse', 't', '', 136, '', 'Browse and test available remote services.', '', -10, 'sites/all/modules/services/services_admin_browse.inc'),
('admin/build/themes/select', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'List', 't', '', 136, '', 'Select the default theme.', '', -1, 'modules/system/system.admin.inc'),
('admin/build/menu/list', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'List menus', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc'),
('admin/build/themes/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'Configure', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/actions/manage', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 15, 4, 'admin/settings/actions', 'admin/settings/actions', 'Manage actions', 't', '', 136, '', 'Manage the actions defined for your site.', '', -2, ''),
('admin/settings/actions/orphan', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_remove_orphans', 'a:0:{}', 15, 4, '', 'admin/settings/actions/orphan', 'Remove orphans', 't', '', 4, '', '', '', 0, ''),
('admin/build/modules/uninstall', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'Uninstall', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/services/ahah/security-options', '', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', '_services_ahah_security_options', 'a:0:{}', 15, 4, '', 'admin/services/ahah/security-options', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/services/services_admin_browse.inc'),
('admin/settings/filters/add', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:0:{}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'Add input format', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc'),
('admin/user/rules/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_add', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Add rule', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/user/create', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:6:"create";}', 15, 4, 'admin/user/user', 'admin/user/user', 'Add user', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/content/comment/approval', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:1:{i:0;s:8:"approval";}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Approval queue', 't', '', 128, '', '', '', 0, 'modules/comment/comment.admin.inc'),
('admin/user/rules/check', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_check', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Check rules', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/settings/clean-urls/check', '', '', '1', 'a:0:{}', 'drupal_json', 'a:1:{i:0;a:1:{s:6:"status";b:1;}}', 15, 4, '', 'admin/settings/clean-urls/check', 'Clean URL check', 't', '', 4, '', '', '', 0, ''),
('admin/settings/actions/configure', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_actions_configure";}', 15, 4, '', 'admin/settings/actions/configure', 'Configure an advanced action', 't', '', 4, '', '', '', 0, ''),
('admin/settings/date-time/lookup', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_date_time_lookup', 'a:0:{}', 15, 4, '', 'admin/settings/date-time/lookup', 'Date and time lookup', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/user/roles/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_role";}', 15, 4, '', 'admin/user/roles/edit', 'Edit role', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/rules/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_edit', 'a:0:{}', 15, 4, '', 'admin/user/rules/edit', 'Edit rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/updates/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'List', 't', '', 136, '', '', '', 0, 'modules/update/update.report.inc'),
('admin/reports/updates/check', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_manual_status', 'a:0:{}', 15, 4, '', 'admin/reports/updates/check', 'Manual update check', 't', '', 4, '', '', '', 0, 'modules/update/update.fetch.inc'),
('admin/reports/status/php', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_php', 'a:0:{}', 15, 4, '', 'admin/reports/status/php', 'PHP', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/node-settings/rebuild', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'drupal_get_form', 'a:1:{i:0;s:30:"node_configure_rebuild_confirm";}', 15, 4, '', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 't', '', 4, '', '', '', 0, 'modules/node/node.admin.inc'),
('admin/reports/status/run-cron', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_run_cron', 'a:0:{}', 15, 4, '', 'admin/reports/status/run-cron', 'Run cron', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/status/sql', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_sql', 'a:0:{}', 15, 4, '', 'admin/reports/status/sql', 'SQL', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/block/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', 15, 4, 'admin/build/block', 'admin/build/block', 'Add block', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/content/types/add', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_type_form";}', 15, 4, 'admin/content/types', 'admin/content/types', 'Add content type', 't', '', 128, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/menu/add', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:14:"menu_edit_menu";i:1;s:3:"add";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Add menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/settings/search/wipe', '', '', 'user_access', 'a:1:{i:0;s:17:"administer search";}', 'drupal_get_form', 'a:1:{i:0;s:19:"search_wipe_confirm";}', 15, 4, '', 'admin/settings/search/wipe', 'Clear index', 't', '', 4, '', '', '', 0, 'modules/search/search.admin.inc'),
('admin/build/block/configure', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:21:"block_admin_configure";}', 15, 4, '', 'admin/build/block/configure', 'Configure block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/delete', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:16:"block_box_delete";}', 15, 4, '', 'admin/build/block/delete', 'Delete block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/delete', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:19:"filter_admin_delete";}', 15, 4, '', 'admin/settings/filters/delete', 'Delete input format', 't', '', 4, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/user/rules/delete', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:32:"user_admin_access_delete_confirm";}', 15, 4, '', 'admin/user/rules/delete', 'Delete rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/event/%', 'a:1:{i:3;N;}', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_event', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/reports/event/%', 'Details', 't', '', 4, '', '', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/content/taxonomy/%', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 14, 4, '', 'admin/content/taxonomy/%', 'List terms', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/content/node-type/page', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 15, 4, '', 'admin/content/node-type/page', 'Page', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/menu/settings', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:1:{i:0;s:14:"menu_configure";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Settings', 't', '', 128, '', '', '', 5, 'modules/menu/menu.admin.inc'),
('admin/reports/updates/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:15:"update_settings";}', 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'Settings', 't', '', 128, '', '', '', 0, 'modules/update/update.settings.inc'),
('admin/content/node-type/story', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:5:"Story";s:6:"module";s:4:"node";s:11:"description";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}', 15, 4, '', 'admin/content/node-type/story', 'Story', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/webform', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:7:"webform";s:4:"name";s:7:"Webform";s:6:"module";s:4:"node";s:11:"description";s:138:"Create a new form or questionnaire accessible to users. Submission results and statistics are recorded and accessible to privileged users.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:7:"webform";}}', 15, 4, '', 'admin/content/node-type/webform', 'Webform', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('node/%/webform-results/analysis', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'webform_results_analysis', 'a:1:{i:0;i:1;}', 11, 4, 'node/%/webform-results', 'node/%', 'Analysis', 't', '', 128, '', '', '', 5, 'sites/all/modules/webform/includes/webform.report.inc'),
('node/%/webform-results/clear', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'webform_results_clear_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:26:"webform_results_clear_form";i:1;i:1;}', 11, 4, 'node/%/webform-results', 'node/%', 'Clear', 't', '', 128, '', '', '', 8, 'sites/all/modules/webform/includes/webform.report.inc'),
('admin/settings/logging/dblog', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"dblog_admin_settings";}', 15, 4, '', 'admin/settings/logging/dblog', 'Database logging', 't', '', 6, '', 'Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.', '', 0, 'modules/dblog/dblog.admin.inc'),
('node/%/webform-results/download', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:29:"webform_results_download_form";i:1;i:1;}', 11, 4, 'node/%/webform-results', 'node/%', 'Download', 't', '', 128, '', '', '', 7, 'sites/all/modules/webform/includes/webform.report.inc'),
('node/%/webform/emails', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"webform_emails_form";i:1;i:1;}', 11, 4, 'node/%/webform', 'node/%', 'E-mails', 't', '', 128, '', '', '', 1, 'sites/all/modules/webform/includes/webform.emails.inc'),
('node/%/webform/components', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'webform_components_page', 'a:1:{i:0;i:1;}', 11, 4, 'node/%/webform', 'node/%', 'Form components', 't', '', 136, '', '', '', 0, 'sites/all/modules/webform/includes/webform.components.inc'),
('node/%/webform/configure', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:22:"webform_configure_form";i:1;i:1;}', 11, 4, 'node/%/webform', 'node/%', 'Form settings', 't', '', 128, '', '', '', 2, 'sites/all/modules/webform/includes/webform.pages.inc'),
('admin/build/services/settings', '', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', 'drupal_get_form', 'a:1:{i:0;s:23:"services_admin_settings";}', 15, 4, 'admin/build/services', 'admin/build/services', 'Settings', 't', '', 128, '', 'Configure service settings.', '', 0, 'sites/all/modules/services/services_admin_browse.inc'),
('node/%/webform-results/submissions', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'webform_results_submissions', 'a:3:{i:0;i:1;i:1;b:0;i:2;s:2:"50";}', 11, 4, 'node/%/webform-results', 'node/%', 'Submissions', 't', '', 136, '', '', '', 4, 'sites/all/modules/webform/includes/webform.report.inc'),
('node/%/webform-results/table', 'a:1:{i:1;s:17:"webform_menu_load";}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'webform_results_table', 'a:2:{i:0;i:1;i:1;s:2:"50";}', 11, 4, 'node/%/webform-results', 'node/%', 'Table', 't', '', 128, '', '', '', 6, 'sites/all/modules/webform/includes/webform.report.inc'),
('webform/ajax/options/%', 'a:1:{i:3;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:3;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:3;}', 'webform_select_options_ajax', 'a:0:{}', 14, 4, '', 'webform/ajax/options/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform/components/select.inc'),
('admin/settings/filters/%', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/settings/filters/%', '', 'filter_admin_format_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/build/menu-customize/%', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 14, 4, '', 'admin/build/menu-customize/%', 'Customize menu', 'menu_overview_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('node/%/submission/%', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:3;a:1:{s:28:"webform_menu_submission_load";a:1:{i:0;i:1;}}}', '', 'webform_submission_access', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:4:"view";}', 'webform_submission_page', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:4:"html";}', 10, 4, '', 'node/%/submission/%', 'Webform submission', 'webform_submission_title', 'a:2:{i:0;i:1;i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/webform/includes/webform.submissions.inc'),
('admin/content/node-type/page/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 31, 5, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES
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
('admin/build/themes/settings/pushbutton', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"pushbutton";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Pushbutton', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/menu-customize/%/add', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:3:"add";i:2;N;i:3;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Add item', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/block/list/bluemarine', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"bluemarine";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Bluemarine', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/chameleon', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:4:"name";s:9:"chameleon";s:4:"type";s:5:"theme";s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}}}', 'block_admin_display', 'a:1:{i:0;s:9:"chameleon";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Chameleon', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/%/configure', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_configure_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Configure', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc'),
('admin/settings/actions/delete/%', 'a:1:{i:4;s:12:"actions_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:2:{i:0;s:26:"system_actions_delete_form";i:1;i:4;}', 30, 5, '', 'admin/settings/actions/delete/%', 'Delete action', 't', '', 4, '', 'Delete an action.', '', 0, ''),
('admin/build/menu-customize/%/delete', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_delete_menu_page', 'a:1:{i:0;i:3;}', 29, 5, '', 'admin/build/menu-customize/%/delete', 'Delete menu', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/menu-customize/%/edit', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:3:{i:0;s:14:"menu_edit_menu";i:1;s:4:"edit";i:2;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Edit menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/block/list/garland', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:7:"garland";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Garland', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc'),
('admin/build/block/list/marvin', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:4:"name";s:6:"marvin";s:4:"type";s:5:"theme";s:5:"owner";s:0:"";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";}}', 'block_admin_display', 'a:1:{i:0;s:6:"marvin";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Marvin', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/minnelli', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:4:"name";s:8:"minnelli";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'block_admin_display', 'a:1:{i:0;s:8:"minnelli";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Minnelli', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/pushbutton', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"pushbutton";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Pushbutton', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/%/order', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_order_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Rearrange', 't', '', 128, '', '', '', 2, 'modules/filter/filter.admin.inc'),
('user/reset/%/%/%', 'a:3:{i:2;N;i:3;N;i:4;N;}', '', '1', 'a:0:{}', 'drupal_get_form', 'a:4:{i:0;s:15:"user_pass_reset";i:1;i:2;i:2;i:3;i:3;i:4;}', 24, 5, '', 'user/reset/%/%/%', 'Reset password', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/content/taxonomy/add/vocabulary', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:24:"taxonomy_form_vocabulary";}', 31, 5, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Add vocabulary', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('node/%/webform/emails/%', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:4;a:1:{s:23:"webform_menu_email_load";a:1:{i:0;i:1;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:3:{i:0;s:23:"webform_email_edit_form";i:1;i:1;i:2;i:4;}', 22, 5, '', 'node/%/webform/emails/%', 'Edit e-mail settings', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform/includes/webform.emails.inc'),
('admin/build/services/settings/general', '', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', 'drupal_get_form', 'a:1:{i:0;s:23:"services_admin_settings";}', 31, 5, 'admin/build/services/settings', 'admin/build/services', 'General', 't', '', 136, '', 'Configure service settings.', '', -10, 'sites/all/modules/services/services_admin_browse.inc'),
('node/%/revisions/%/view', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_show', 'a:3:{i:0;i:1;i:1;N;i:2;b:1;}', 21, 5, '', 'node/%/revisions/%/view', 'Revisions', 't', '', 4, '', '', '', 0, ''),
('admin/build/services/browse/%', 'a:1:{i:4;s:20:"services_method_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer services";}', 'services_admin_browse_method', 'a:1:{i:0;i:4;}', 30, 5, 'admin/build/services/browse', 'admin/build/services', 'Services', 't', '', 128, '', 'Calls a Services method.', '', 0, 'sites/all/modules/services/services_admin_browse.inc'),
('node/%/webform-results/analysis/%', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:2:{i:0;i:1;i:1;i:4;}}i:4;a:1:{s:27:"webform_menu_component_load";a:2:{i:0;i:1;i:1;i:4;}}}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'webform_results_analysis', 'a:3:{i:0;i:1;i:1;a:0:{}i:2;i:4;}', 22, 5, '', 'node/%/webform-results/analysis/%', 'Analysis', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform/includes/webform.report.inc'),
('node/%/submission/%/delete', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:3;a:1:{s:28:"webform_menu_submission_load";a:1:{i:0;i:1;}}}', '', 'webform_submission_access', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:6:"delete";}', 'drupal_get_form', 'a:3:{i:0;s:30:"webform_submission_delete_form";i:1;i:1;i:2;i:3;}', 21, 5, 'node/%/submission/%', 'node/%/submission/%', 'Delete', 't', '', 128, '', '', '', 2, 'sites/all/modules/webform/includes/webform.submissions.inc'),
('node/%/revisions/%/delete', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"delete";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_delete_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/delete', 'Delete earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc'),
('node/%/submission/%/edit', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:3;a:1:{s:28:"webform_menu_submission_load";a:1:{i:0;i:1;}}}', '', 'webform_submission_access', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:4:"edit";}', 'webform_submission_page', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:4:"form";}', 21, 5, 'node/%/submission/%', 'node/%/submission/%', 'Edit', 't', '', 128, '', '', '', 1, 'sites/all/modules/webform/includes/webform.submissions.inc'),
('node/%/webform/components/%', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:2:{i:0;i:1;i:1;i:5;}}i:4;a:1:{s:27:"webform_menu_component_load";a:2:{i:0;i:1;i:1;i:5;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:4:{i:0;s:27:"webform_component_edit_form";i:1;i:1;i:2;i:4;i:3;b:0;}', 22, 5, 'node/%/webform/components', 'node/%', '', 't', '', 128, '', '', '', 0, 'sites/all/modules/webform/includes/webform.components.inc'),
('node/%/submission/%/resend', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:3;a:1:{s:28:"webform_menu_submission_load";a:1:{i:0;i:1;}}}', '', 'webform_results_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:3:{i:0;s:25:"webform_submission_resend";i:1;i:1;i:2;i:3;}', 21, 5, '', 'node/%/submission/%/resend', 'Resend e-mails', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform/includes/webform.submissions.inc'),
('node/%/revisions/%/revert', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"update";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_revert_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/revert', 'Revert to earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc'),
('node/%/submission/%/view', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:3;a:1:{s:28:"webform_menu_submission_load";a:1:{i:0;i:1;}}}', '', 'webform_submission_access', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:4:"view";}', 'webform_submission_page', 'a:3:{i:0;i:1;i:1;i:3;i:2;s:4:"html";}', 21, 5, 'node/%/submission/%', 'node/%/submission/%', 'View', 't', '', 136, '', '', '', 0, 'sites/all/modules/webform/includes/webform.submissions.inc'),
('node/%/webform/emails/%/delete', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:1:{i:0;i:1;}}i:4;a:1:{s:23:"webform_menu_email_load";a:1:{i:0;i:1;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:3:{i:0;s:25:"webform_email_delete_form";i:1;i:1;i:2;i:4;}', 45, 6, '', 'node/%/webform/emails/%/delete', 'Delete e-mail settings', 't', '', 4, '', '', '', 0, 'sites/all/modules/webform/includes/webform.emails.inc'),
('admin/build/menu/item/%/delete', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_item_delete_page', 'a:1:{i:0;i:4;}', 61, 6, '', 'admin/build/menu/item/%/delete', 'Delete menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/menu/item/%/edit', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:4:"edit";i:2;i:4;i:3;N;}', 61, 6, '', 'admin/build/menu/item/%/edit', 'Edit menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/content/taxonomy/edit/vocabulary/%', 'a:1:{i:5;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_vocabulary_edit', 'a:1:{i:0;i:5;}', 62, 6, '', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/menu/item/%/reset', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:23:"menu_reset_item_confirm";i:1;i:4;}', 61, 6, '', 'admin/build/menu/item/%/reset', 'Reset menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/content/taxonomy/%/add/term', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_add_term_page', 'a:1:{i:0;i:3;}', 59, 6, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'Add term', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('node/%/webform/components/%/delete', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:2:{i:0;i:1;i:1;i:5;}}i:4;a:1:{s:27:"webform_menu_component_load";a:2:{i:0;i:1;i:1;i:5;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:3:{i:0;s:29:"webform_component_delete_form";i:1;i:1;i:2;i:4;}', 45, 6, 'node/%/webform/components/%', 'node/%', '', 't', '', 128, '', '', '', 0, 'sites/all/modules/webform/includes/webform.components.inc'),
('node/%/webform/components/%/clone', 'a:2:{i:1;a:1:{s:17:"webform_menu_load";a:2:{i:0;i:1;i:1;i:5;}}i:4;a:1:{s:27:"webform_menu_component_load";a:2:{i:0;i:1;i:1;i:5;}}}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'drupal_get_form', 'a:4:{i:0;s:27:"webform_component_edit_form";i:1;i:1;i:2;i:4;i:3;b:1;}', 45, 6, 'node/%/webform/components/%', 'node/%', '', 't', '', 128, '', '', '', 0, 'sites/all/modules/webform/includes/webform.components.inc');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `node`
--

INSERT INTO `node` (`nid`, `vid`, `type`, `language`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `moderate`, `sticky`, `tnid`, `translate`) VALUES
(1, 1, 'webform', '', 'contact info', 1, 1, 1338538797, 1339504491, 2, 1, 0, 0, 0, 0),
(2, 2, 'webform', '', 'Personal Data', 1, 1, 1339680736, 1339680736, 2, 1, 0, 0, 0, 0);

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
(0, 0, 'all', 1, 0, 0);

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
(1, 1338538797, NULL, 1, 0),
(2, 1339680736, NULL, 1, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `node_revisions`
--

INSERT INTO `node_revisions` (`nid`, `vid`, `uid`, `title`, `body`, `teaser`, `log`, `timestamp`, `format`) VALUES
(1, 1, 1, 'contact info', 'Here is contact info', 'Here is contact info', '', 1339504491, 1),
(2, 2, 1, 'Personal Data', 'Personal Data Body', 'Personal Data Body', '', 1339680736, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`pid`, `rid`, `perm`, `tid`) VALUES
(1, 1, 'access content', 0),
(2, 2, 'access comments, access content, post comments, post comments without approval', 0);

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
(1, 'qp727t9vqbg5l3nfh87qcq6e76', '127.0.0.1', 1340004924, 0, 'ctools_export_ui|a:1:{s:25:"services_ctools_export_ui";a:10:{s:7:"storage";s:6:"Normal";s:8:"disabled";s:1:"0";s:6:"search";s:3:"aaa";s:5:"order";s:4:"name";s:4:"sort";s:3:"asc";s:2:"op";s:5:"Apply";s:13:"form_build_id";s:37:"form-d0e35f4ef81959376b5499720192ad90";s:7:"form_id";s:26:"ctools_export_ui_list_form";s:2:"js";s:1:"1";s:11:"ctools_ajax";s:1:"1";}}');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sub_datagroup_submissions`
--

INSERT INTO `sub_datagroup_submissions` (`ssid`, `nid`, `sid`, `uid`, `submitted`, `cid`, `title`) VALUES
(1, 1, 1, 1, 1339770268, 1, 'Telephone'),
(2, 1, 1, 1, 1339770268, 1, 'Telephone'),
(3, 1, 1, 1, 1339770268, 13, 'Mail Address'),
(4, 1, 1, 1, 1339770268, 13, 'Mail Address');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sub_datagroup_submitted_data`
--

INSERT INTO `sub_datagroup_submitted_data` (`sd_id`, `ssid`, `cid`, `data`) VALUES
(1, 1, 11, 'cell'),
(2, 1, 8, '9999'),
(3, 2, 11, 'home'),
(4, 2, 8, '7777'),
(5, 3, 11, 'Temporary'),
(6, 3, 12, 'temporary mail '),
(7, 4, 11, 'Permanent'),
(8, 4, 12, 'permanent mail');

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
('modules/contact/contact.module', 'contact', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Contact";s:11:"description";s:61:"Enables the use of both personal and site-wide contact forms.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/dblog/dblog.module', 'dblog', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:16:"Database logging";s:11:"description";s:47:"Logs and records system events to the database.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/filter/filter.module', 'filter', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Filter";s:11:"description";s:60:"Handles the filtering of content in preparation for display.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/forum/forum.module', 'forum', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:5:"Forum";s:11:"description";s:50:"Enables threaded discussions about general topics.";s:12:"dependencies";a:2:{i:0;s:8:"taxonomy";i:1;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/help/help.module', 'help', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Help";s:11:"description";s:35:"Manages the display of online help.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/locale/locale.module', 'locale', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Locale";s:11:"description";s:119:"Adds language handling functionality and enables the translation of the user interface to languages other than English.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/menu/menu.module', 'menu', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Menu";s:11:"description";s:60:"Allows administrators to customize the site navigation menu.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/node/node.module', 'node', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Node";s:11:"description";s:66:"Allows content to be submitted to the site and displayed on pages.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/openid/openid.module', 'openid', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"OpenID";s:11:"description";s:48:"Allows users to log into your site using OpenID.";s:7:"version";s:4:"6.26";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/path/path.module', 'path', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Path";s:11:"description";s:28:"Allows users to rename URLs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/php/php.module', 'php', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"PHP filter";s:11:"description";s:50:"Allows embedded PHP code/snippets to be evaluated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/ping/ping.module', 'ping', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Ping";s:11:"description";s:51:"Alerts other sites when your site has been updated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/poll/poll.module', 'poll', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Poll";s:11:"description";s:95:"Allows your site to capture votes on different topics in the form of multiple choice questions.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/profile/profile.module', 'profile', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Profile";s:11:"description";s:36:"Supports configurable user profiles.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.26";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335977158";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
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
('sites/all/modules/custom/custom.module', 'custom', 'module', '', 0, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Custom";s:11:"description";s:19:"Playing with forms.";s:4:"core";s:3:"6.x";s:7:"package";s:6:"Custom";s:3:"php";s:3:"5.1";s:7:"version";s:8:"6.x-3.18";s:7:"project";s:6:"Custom";s:9:"datestamp";s:10:"1336890407";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('sites/all/modules/ahah_helper/ahah_helper.module', 'ahah_helper', 'module', '', 1, 0, 0, 0, 0, 'a:9:{s:4:"name";s:11:"AHAH helper";s:11:"description";s:84:"The AHAH helper module, making gracefully degradable AHAH-driven forms a no-brainer.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:11:"ahah_helper";s:9:"datestamp";s:10:"1310369523";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/ahah_helper/ahah_helper_demo.module', 'ahah_helper_demo', 'module', '', 0, 0, 0, 0, 0, 'a:9:{s:4:"name";s:16:"AHAH helper demo";s:11:"description";s:35:"A demo form the AHAH helper module.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:11:"ahah_helper";s:9:"datestamp";s:10:"1310369523";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
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
('sites/all/modules/datagroup_services/datagroup_services.module', 'datagroup_services', 'module', '', 1, 0, 0, 0, 0, 'a:8:{s:4:"name";s:19:"Data Group Services";s:11:"description";s:29:"Provides Data Group services.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:8:"services";}s:7:"package";s:8:"Services";s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `url_alias`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `name`, `pass`, `mail`, `mode`, `sort`, `threshold`, `theme`, `signature`, `signature_format`, `created`, `access`, `login`, `status`, `timezone`, `language`, `picture`, `init`, `data`) VALUES
(0, '', '', '', 0, 0, 0, '', '', 0, 0, 0, 0, 0, NULL, '', '', '', NULL),
(1, 'admin', 'b59c67bf196a4758191e42f76670ceba', 'qamar.munir@vizteck.com', 0, 0, 0, '', '', 0, 1338534886, 1340004834, 1339422814, 1, NULL, '', '', 'qamar.munir@vizteck.com', 'a:0:{}');

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
('theme_default', 's:7:"garland";'),
('filter_html_1', 'i:1;'),
('node_options_forum', 'a:1:{i:0;s:6:"status";}'),
('drupal_private_key', 's:64:"5d4c2b2f16f256d866d6186c5985e30cd86d601826ad50bf1a914a3058b688a5";'),
('menu_masks', 'a:20:{i:0;i:62;i:1;i:61;i:2;i:59;i:3;i:45;i:4;i:31;i:5;i:30;i:6;i:29;i:7;i:24;i:8;i:22;i:9;i:21;i:10;i:15;i:11;i:14;i:12;i:11;i:13;i:10;i:14;i:7;i:15;i:6;i:16;i:5;i:17;i:3;i:18;i:2;i:19;i:1;}'),
('install_task', 's:4:"done";'),
('menu_expanded', 'a:0:{}'),
('site_name', 's:9:"localhost";'),
('site_mail', 's:23:"qamar.munir@vizteck.com";'),
('date_default_timezone', 's:5:"18000";'),
('user_email_verification', 'b:1;'),
('clean_url', 's:1:"1";'),
('install_time', 'i:1338534937;'),
('node_options_page', 'a:1:{i:0;s:6:"status";}'),
('comment_page', 'i:0;'),
('theme_settings', 'a:1:{s:21:"toggle_node_info_page";b:0;}'),
('drupal_http_request_fails', 'b:1;'),
('css_js_query_string', 's:20:"hk2HK4t8Ed9000000000";'),
('install_profile', 's:7:"default";'),
('update_last_check', 'i:1339675969;'),
('file_directory_temp', 's:11:"E:/wamp/tmp";'),
('javascript_parsed', 'a:0:{}'),
('cron_last', 'i:1339510898;'),
('webform_addmore_1', 'a:6:{s:5:"label";s:8:"Add More";s:0:"";i:0;i:5;i:1;i:4;N;i:7;i:1;i:16;N;}'),
('services_use_content_permissions', 'i:1;'),
('imagefield_thumb_size', 's:5:"66x47";');

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
(1, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1),
(2, '', 1, '<confirmation>', 1, 0, 0, 0, 0, 1, '', -1, -1, -1, -1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `webform_addmore`
--

INSERT INTO `webform_addmore` (`id`, `nid`, `fieldset_cid`, `fieldset_form_key`, `fieldset_name`, `sub_fieldset_cid`, `sub_fieldset_form_key`) VALUES
(2, 1, 1, 'information', 'Information', 2, 'info'),
(3, 1, 13, 'mail_address', 'Mail Address', 14, 'info');

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
(1, 1, 0, 'information', 'Telephone', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 6),
(1, 2, 1, 'info', 'Info', 'fieldset', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 1),
(1, 4, 0, 'name', 'Name', 'textfield', '', 'a:13:{s:11:"description";s:9:"User name";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:9:"maxlength";s:0:"";s:12:"field_prefix";s:0:"";s:12:"field_suffix";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 3),
(1, 5, 0, 'address', 'Address', 'textarea', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:9:"resizable";i:1;s:8:"disabled";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 4),
(1, 6, 0, 'email_address', 'Email address', 'email', '', 'a:10:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:8:"disabled";i:0;s:6:"unique";i:0;s:20:"conditional_operator";s:1:"=";s:5:"width";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 5),
(1, 7, 2, 'type', 'Type', 'select', '', 'a:14:{s:5:"items";s:35:"cell|Cell\r\nhome|Home\r\noffice|Office";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:0;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 3),
(1, 8, 2, 'telephone_number', 'Telephone Number', 'number', '', 'a:10:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:4:"type";s:9:"textfield";s:8:"decimals";s:0:"";s:9:"separator";s:1:",";s:5:"point";s:1:".";s:6:"unique";i:0;s:7:"integer";i:0;s:20:"conditional_operator";s:1:"=";s:11:"excludezero";i:1;}', 0, 4),
(1, 14, 13, 'info', 'Info', 'fieldset', '', 'a:5:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";}', 0, 10),
(1, 13, 0, 'mail_address', 'Mail Address', 'fieldset', '', 'a:8:{s:13:"title_display";i:0;s:7:"private";i:0;s:11:"collapsible";i:0;s:9:"collapsed";i:0;s:20:"conditional_operator";s:1:"=";s:11:"description";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 7),
(1, 11, 14, 'type', 'Type', 'select', '', 'a:14:{s:5:"items";s:40:"Temporary|temporary\r\nPermanent|permanent";s:8:"multiple";i:0;s:13:"title_display";s:6:"before";s:7:"private";i:0;s:6:"aslist";i:0;s:7:"optrand";i:0;s:20:"conditional_operator";s:1:"=";s:12:"other_option";N;s:10:"other_text";s:8:"Other...";s:11:"description";s:0:"";s:11:"custom_keys";b:0;s:14:"options_source";s:0:"";s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 8),
(1, 12, 14, 'add', 'mail address', 'textarea', '', 'a:11:{s:13:"title_display";i:0;s:7:"private";i:0;s:9:"resizable";i:1;s:8:"disabled";i:0;s:20:"conditional_operator";s:1:"=";s:4:"cols";s:0:"";s:4:"rows";s:0:"";s:11:"description";s:0:"";s:10:"attributes";a:0:{}s:21:"conditional_component";s:0:"";s:18:"conditional_values";s:0:"";}', 0, 9),
(2, 1, 0, 'dob', 'DOB', 'date', '', 'a:8:{s:8:"timezone";s:4:"user";s:13:"title_display";s:6:"before";s:7:"private";i:0;s:10:"datepicker";i:1;s:14:"year_textfield";i:0;s:10:"start_date";s:8:"-2 years";s:8:"end_date";s:8:"+2 years";s:20:"conditional_operator";s:1:"=";}', 0, 0),
(2, 2, 0, 'ssn', 'SSN', 'number', '', 'a:10:{s:13:"title_display";s:6:"before";s:7:"private";i:0;s:4:"type";s:9:"textfield";s:8:"decimals";s:0:"";s:9:"separator";s:1:",";s:5:"point";s:1:".";s:6:"unique";i:0;s:7:"integer";i:0;s:20:"conditional_operator";s:1:"=";s:11:"excludezero";i:0;}', 0, 1);

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
(1, 1),
(1, 2),
(2, 1),
(2, 2);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `webform_submissions`
--

INSERT INTO `webform_submissions` (`sid`, `nid`, `uid`, `is_draft`, `submitted`, `remote_addr`) VALUES
(1, 1, 1, 0, 1339770238, '127.0.0.1'),
(2, 1, 1, 0, 1340004645, '127.0.0.1'),
(3, 1, 1, 0, 1340004834, '127.0.0.1');

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
  PRIMARY KEY (`nid`,`sid`,`cid`,`no`),
  KEY `nid` (`nid`),
  KEY `sid_nid` (`sid`,`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webform_submitted_data`
--

INSERT INTO `webform_submitted_data` (`nid`, `sid`, `cid`, `no`, `data`) VALUES
(1, 1, 11, '0', 'Temporary'),
(1, 1, 0, '0', 'Add Information'),
(1, 1, 7, '0', 'cell'),
(1, 1, 8, '0', '9999'),
(1, 1, 6, '0', 'test@test.com'),
(1, 1, 5, '0', 'Test Address'),
(1, 1, 4, '0', 'test name'),
(1, 1, 12, '0', 'temporary mail '),
(1, 2, 0, '0', 'Add Information'),
(1, 2, 8, '0', ''),
(1, 2, 7, '0', ''),
(1, 2, 6, '0', ''),
(1, 2, 5, '0', ''),
(1, 2, 4, '0', ''),
(1, 2, 11, '0', ''),
(1, 2, 12, '0', ''),
(1, 3, 0, '0', 'Add Information'),
(1, 3, 8, '0', ''),
(1, 3, 7, '0', ''),
(1, 3, 6, '0', ''),
(1, 3, 5, '0', ''),
(1, 3, 4, '0', ''),
(1, 3, 11, '0', ''),
(1, 3, 12, '0', '');
