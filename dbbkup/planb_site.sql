-- MySQL dump 10.10
--
-- Host: localhost    Database: planb_site_live
-- ------------------------------------------------------
-- Server version	5.0.22-Debian_0ubuntu6.06.3-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `planb_site_live`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `planb_site_live` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `planb_site_live`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL auto_increment,
  `key` varchar(40) NOT NULL default '',
  `value` varchar(255) default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config`
--


/*!40000 ALTER TABLE `config` DISABLE KEYS */;
LOCK TABLES `config` WRITE;
INSERT INTO `config` VALUES (1,'admin.title','Radiant CMS'),(2,'admin.subtitle','Publishing for Small Teams'),(3,'defaults.page.parts','body, extended'),(4,'defaults.page.status','draft');
UNLOCK TABLES;
/*!40000 ALTER TABLE `config` ENABLE KEYS */;

--
-- Table structure for table `extension_meta`
--

DROP TABLE IF EXISTS `extension_meta`;
CREATE TABLE `extension_meta` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `schema_version` int(11) default '0',
  `enabled` tinyint(1) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `extension_meta`
--


/*!40000 ALTER TABLE `extension_meta` DISABLE KEYS */;
LOCK TABLES `extension_meta` WRITE;
INSERT INTO `extension_meta` VALUES (1,'Markdown Filter',0,1),(2,'Textile Filter',0,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `extension_meta` ENABLE KEYS */;

--
-- Table structure for table `layouts`
--

DROP TABLE IF EXISTS `layouts`;
CREATE TABLE `layouts` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `content` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `created_by` int(11) default NULL,
  `updated_by` int(11) default NULL,
  `content_type` varchar(40) default NULL,
  `lock_version` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `layouts`
--


/*!40000 ALTER TABLE `layouts` DISABLE KEYS */;
LOCK TABLES `layouts` WRITE;
INSERT INTO `layouts` VALUES (4,'Single Column','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"\r\n  \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\r\n<html>\r\n  <head>\r\n    <title><r:title /></title>\r\n    <link href=\"/rss/\" rel=\"alternate\" title=\"RSS\" type=\"application/rss+xml\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"/planb/css/single_column.css\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"/planb/css/site.css\" />\r\n    <r:snippet name=\"favicon\" />\r\n  </head>\r\n  <body>\r\n    <div id=\"navigation-wrapper\">\r\n      <div id=\"navigation\">\r\n        <r:content part=\"navigation\" inherit=\"true\" />\r\n      </div>\r\n    </div>\r\n    <div id=\"banner-wrapper\">\r\n      <div id=\"banner\">\r\n        <r:content part=\"banner\" inherit=\"true\" />\r\n      </div>\r\n    </div>\r\n    <div id=\"page\">\r\n      <r:content />\r\n      <r:snippet name=\"footer\" />\r\n    </div>\r\n  </body>\r\n</html>\r\n','2007-06-03 20:29:00','2007-06-06 01:00:55',1,1,'',10);
UNLOCK TABLES;
/*!40000 ALTER TABLE `layouts` ENABLE KEYS */;

--
-- Table structure for table `page_parts`
--

DROP TABLE IF EXISTS `page_parts`;
CREATE TABLE `page_parts` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `filter_id` varchar(25) default NULL,
  `content` text,
  `page_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page_parts`
--


/*!40000 ALTER TABLE `page_parts` DISABLE KEYS */;
LOCK TABLES `page_parts` WRITE;
INSERT INTO `page_parts` VALUES (1,'body','','<div class=\"section-wrapper\">\r\n  <div class=\"section\">\r\n    <h1>Projects</h1>\r\n      <div class=\"subsection-wrapper\">\r\n        <div class=\"subsection\">\r\n          <h1>has_ancestor</h1>\r\n	  <p>\r\n           has_ancestor is a Ruby on Rails plug-in that adds two class methods to ActiveRecord::Base. The methods allow specification of inheritance relations between ActiveRecord models. With           \r\n           the method has_ancestor an ancestor relation is declared between a descendant model and its ancestor and with the method has_descendants a descendant relation is declared between an          \r\n           ancestor model and its descendants. Once ancestor and descendant relations are declared between models the models interact as would be expected from class inheritance: ancestor \r\n           instance and class methods may be called from the descendant model, this permits access to ancestor attributes from the descendant model and polymorphic methods implemented on both \r\n           ancestor and descendant may be called from the ancestor.\r\n	  </p>\r\n        </div>\r\n      </div>	 \r\n  </div>\r\n</div>	 \r\n',1),(2,'body','Textile','The file you were looking for could not be found.\n\nAttempted URL: @<r:attempted_url />@\n\nIt is possible that you typed the URL incorrectly or that you clicked on a bad link.\n\n\"<< Back to Home Page\":/\n',2),(14,'banner','','<img src=\"/planb/images/plan_b_research_banner.png\">',1),(15,'navigation','','<h1><strong>projects</strong> planning about</h1>',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `page_parts` ENABLE KEYS */;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `slug` varchar(100) default NULL,
  `breadcrumb` varchar(160) default NULL,
  `class_name` varchar(25) default NULL,
  `status_id` int(11) NOT NULL default '1',
  `parent_id` int(11) default NULL,
  `layout_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `published_at` datetime default NULL,
  `created_by` int(11) default NULL,
  `updated_by` int(11) default NULL,
  `virtual` tinyint(1) NOT NULL default '0',
  `lock_version` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--


/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
LOCK TABLES `pages` WRITE;
INSERT INTO `pages` VALUES (1,'Plan-B','/','Home','Page',100,NULL,4,'2007-05-27 16:16:36','2007-06-08 11:43:26','2007-05-27 12:16:36',1,1,0,21),(2,'File Not Found','file-not-found','File Not Found','FileNotFoundPage',100,1,NULL,'2007-05-27 16:16:36','2007-05-27 16:16:36','2007-05-27 12:16:36',1,NULL,1,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

--
-- Table structure for table `schema_info`
--

DROP TABLE IF EXISTS `schema_info`;
CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_info`
--


/*!40000 ALTER TABLE `schema_info` DISABLE KEYS */;
LOCK TABLES `schema_info` WRITE;
INSERT INTO `schema_info` VALUES (15);
UNLOCK TABLES;
/*!40000 ALTER TABLE `schema_info` ENABLE KEYS */;

--
-- Table structure for table `snippets`
--

DROP TABLE IF EXISTS `snippets`;
CREATE TABLE `snippets` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `filter_id` varchar(25) default NULL,
  `content` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `created_by` int(11) default NULL,
  `updated_by` int(11) default NULL,
  `lock_version` int(11) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `snippets`
--


/*!40000 ALTER TABLE `snippets` DISABLE KEYS */;
LOCK TABLES `snippets` WRITE;
INSERT INTO `snippets` VALUES (3,'favicon','','<link rel=\"shortcut icon\" href=\"/planb/imgages/favicon-01.ico\" />	\r\n','2007-06-03 20:30:00','2007-06-03 20:30:00',1,NULL,0),(4,'footer','','<div id=\"footer\">\r\n  <a rel=\"license\" href=\"http://creativecommons.org/licenses/by/3.0/\">\r\n  <img alt=\"Creative Commons License\" style=\"border-width:0\" src=\"http://i.creativecommons.org/l/by/3.0/88x31.png\" /></a>\r\n  <p>Licensed under a <a rel=\"license\" href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons Attribution 3.0 License</a>.</p>\r\n  <p>Powered by <a href=\"http://radiantcms.org/\">Radiant CMS</a>.</p>\r\n</div>\r\n','2007-06-03 20:30:28','2007-06-06 01:00:05',1,1,20);
UNLOCK TABLES;
/*!40000 ALTER TABLE `snippets` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `email` varchar(255) default NULL,
  `login` varchar(40) NOT NULL default '',
  `password` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `created_by` int(11) default NULL,
  `updated_by` int(11) default NULL,
  `admin` tinyint(1) NOT NULL default '0',
  `developer` tinyint(1) NOT NULL default '0',
  `notes` text,
  `lock_version` int(11) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--


/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'Troy Stribling','','troy','a622984e0329b5a1b93b3b70d024a564ec88d11b','2007-05-27 16:16:33','2007-06-03 13:44:25',NULL,1,1,0,'',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

