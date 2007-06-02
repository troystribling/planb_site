-- MySQL dump 10.10
--
-- Host: localhost    Database: planb_site_live
-- ------------------------------------------------------
-- Server version	5.0.27

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

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'admin.title','Radiant CMS'),(2,'admin.subtitle','Publishing for Small Teams'),(3,'defaults.page.parts','body, extended'),(4,'defaults.page.status','draft');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `extension_meta` WRITE;
/*!40000 ALTER TABLE `extension_meta` DISABLE KEYS */;
INSERT INTO `extension_meta` VALUES (1,'Markdown Filter',0,1),(2,'Textile Filter',0,1);
/*!40000 ALTER TABLE `extension_meta` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `layouts` WRITE;
/*!40000 ALTER TABLE `layouts` DISABLE KEYS */;
INSERT INTO `layouts` VALUES (1,'Normal','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"\n  \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\n<html>\n  <head>\n    <title><r:title /></title>\n    <link href=\"/rss/\" rel=\"alternate\" title=\"RSS\" type=\"application/rss+xml\" />\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"/styles.css\" />\n  </head>\n  <body>\n    <div id=\"page\">\n      <r:snippet name=\"header\" />\n      <div id=\"main\">\n        <div id=\"content-wrapper\">\n          <div id=\"content\">\n            <r:unless_url matches=\"^/$\"><h1><r:title /></h1></r:unless_url>\n            <r:content />\n            <r:if_content part=\"extended\">\n            <div id=\"extended\">\n              <r:content part=\"extended\" />\n            </div>\n            </r:if_content>\n            <r:if_url matches=\"^/articles/\\d{4}/\\d{2}/\\d{2}/.+\"><r:unless_url matches=\"-archives/$\"><p class=\"info\">Posted by <r:author /> on <r:date /></p></r:unless_url></r:if_url>\n          </div>\n        </div>\n        <div id=\"sidebar-wrapper\">\n          <div id=\"sidebar\">\n            <r:content part=\"sidebar\" inherit=\"true\" />\n          </div>\n        </div>\n      </div>\n      <r:snippet name=\"footer\" />\n    </div>\n  </body>\n</html>\n','2007-05-27 16:16:37','2007-05-27 16:16:37',1,NULL,NULL,0),(2,'Stylesheet','<r:content />\n','2007-05-27 16:16:37','2007-05-27 16:16:37',1,NULL,'text/css',0),(3,'XML Feed','<r:content />\n','2007-05-27 16:16:37','2007-05-27 16:16:37',1,NULL,'text/xml',0);
/*!40000 ALTER TABLE `layouts` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `page_parts` WRITE;
/*!40000 ALTER TABLE `page_parts` DISABLE KEYS */;
INSERT INTO `page_parts` VALUES (1,'body',NULL,'<r:find url=\"/articles/\">\n\n<r:children:each limit=\"1\" order=\"desc\">\n<div class=\"first entry\">\n  <h3><r:link /></h3>\n  <r:content />\n  <r:if_content part=\"extended\"><r:link anchor=\"extended\">Continue Reading&#8230;</r:link></r:if_content>\n  <p class=\"info\">Posted by <r:author /> on <r:date format=\"%b %d, %Y\" /></p>\n</div>\n</r:children:each>\n\n<r:children:each limit=\"4\" offset=\"1\" order=\"desc\">\n<div class=\"entry\">\n  <h3><r:link /></h3>\n  <r:content />\n  <r:if_content part=\"extended\"><r:link anchor=\"extended\">Continue Reading&#8230;</r:link></r:if_content>\n  <p class=\"info\">Posted by <r:author /> on <r:date format=\"%b %d, %Y\" /></p>\n</div>\n</r:children:each>\n\n</r:find>\n',1),(2,'body','Textile','The file you were looking for could not be found.\n\nAttempted URL: @<r:attempted_url />@\n\nIt is possible that you typed the URL incorrectly or that you clicked on a bad link.\n\n\"<< Back to Home Page\":/\n',2),(3,'body',NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<rss version=\"2.0\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\">\n  <channel>\n    <title>Article RSS Feed</title>\n    <link>http://your-web-site.com<r:url /></link>\n    <language>en-us</language>\n    <ttl>40</ttl>\n    <description>The main blog feed for my Web site.</description>\n    <r:find url=\"/articles/\">\n    <r:children:each limit=\"10\" order=\"desc\">\n        <item>\n          <title><r:title /></title>\n          <description><r:escape_html><r:content /></r:escape_html></description>\n          <pubDate><r:rfc1123_date /></pubDate>\n          <guid>http://your-web-site.com<r:url /></guid>\n          <link>http://your-web-site.com<r:url /></link>\n        </item>\n    </r:children:each>\n    </r:find>\n  </channel>\n</rss>\n',3),(4,'body',NULL,'<r:children:each limit=\"5\" order=\"desc\">\n<div class=\"entry\">\n  <h3><r:link /></h3>\n  <r:content />\n  <r:if_content part=\"extended\"><r:link anchor=\"extended\">Continue Reading&#8230;</r:link></r:if_content>\n  <p class=\"info\">Posted by <r:author /> on <r:date format=\"%b %d, %Y\" /></p>\n</div>\n</r:children:each>',4),(5,'body','Textile','This post uses \"textile\":http://www.textism.com/tools/textile/.\n',5),(6,'body','Markdown','This post uses **Markdown**.\n',6),(7,'body',NULL,'a {\n  color: #3256B6;\n}\na:visited {\n  color: #cc9;\n}\na:hover, a:visited:hover {\n  color: #e00;\n  text-decoration: none;\n}\nbody {\n  background-color: #041a61;\n  font-family: Verdana, Arial, Helvetica, sans-serif;\n  font-size: 80%;\n  padding: 0;\n  margin: 0;\n  text-align: center;\n}\nh1 {\n  font-family: \"Trebuchet MS\", Verdana, Arial, Helvetica, sans-serif;\n  font-size: 250%;\n  font-weight: normal;\n}\nh3 {\n  color: #999;\n  font-family: \"Trebuchet MS\", Verdana, Arial, Helvetica, sans-serif;\n  font-size: 180%;\n  font-weight: normal;\n  margin-top: 1.5em;\n  margin-bottom: .5em;\n}\n.hidden {\n  display: none;\n}\n.clear {\n  clear: both;\n}\n#page {\n  margin-left: auto;\n  margin-right: auto;\n  width: 730px;\n  text-align: left;\n}\n#header {\n  background-color: #4f57c5;\n  border-bottom: 4px solid #fc0;\n  color: white;\n  font-family: \"Trebuchet MS\", Verdana, Arial, Helvetica, sans-serif;\n  padding: 0;\n  padding-top: 30px;\n  padding-bottom: 30px;\n  text-align: center;\n}\n#site-title {\n  color: white;\n  font-size: 325%;\n}\n#site-title a, #site-title a:visited {\n  color: white;\n  text-decoration: none;\n}\n#site-title a:hover, #site-title a:hover {\n  color: white;\n  text-decoration: underline;\n}\n#site-subtitle {\n  font-style: italic;\n  letter-spacing: 2px;\n  text-transform: lowercase;\n}\n#main {\n  background-color: white;\n  border-bottom: 4px solid #fc0;\n  float: left;\n  width: 100%;\n}\n#content-wrapper {\n  float: left;\n  width: 500px;\n}\n#content {\n  padding: 25px;\n  border-right: 1px dotted #a3a39c;\n}\n#content h1 {\n  margin-top: 0;\n}\n#content h3 a {\n  border-bottom: 1px dotted #a3a39c;\n  display: block;\n  padding-bottom: 2px;\n  text-decoration: none;\n}\n#content p {\n  line-height: 160%;\n}\n#content .info {\n  color: #b0af99;\n  font-size: 80%;\n  margin-top: 1.5em;\n}\n#content .entry .info {\n  margin-top: 1em;\n}\n#content .first.entry {\n  background-color: #f7f3e8;\n  margin: -25px;\n  margin-bottom: 0;\n  padding: 25px;\n}\n#content .first.entry h3 {\n  margin-top: 0.25em;\n}\n#sidebar-wrapper {\n  float: right;\n  width: 225px;\n}\n#sidebar {\n  font-size: 90%;\n  padding: 15px;\n  padding-top: 0px;\n}\n#sidebar h3 {\n  font-size: 160%;\n}\n#sidebar p {\n  line-height: 140%;\n}\n#sidebar ul {\n  margin-left: 1.5em;\n  padding: 0;\n}\n#sidebar li {\n  margin-bottom: .25em;\n}\n#footer {\n  color: #818cb0;\n  float: left;\n  font-size: 90%;\n  padding-top: 1px;\n  padding-bottom: 20px;\n  width: 100%;\n}',7),(8,'sidebar','Textile','h3. About Me\n\nI\'m just a demonstration of how easy it is to use Radiant to power a blog. \"More...\":/about/\n\nh3. Favorite Sites\n\n* \"Radiant CMS\":http://radiantcms.org\n* \"Wiseheart Design\":http://wiseheartdesign.com\n* \"Redhanded\":http://redhanded.hobix.com\n* \"Ruby-Lang\":http://ruby-lang.org\n\nh3. Recent Entries\n<r:if_url matches=\"^/$\">\n<r:find url=\"/articles/\"><r:children:each limit=\"10\" offset=\"5\" order=\"desc\">\n* <r:link /></r:children:each></r:find>\n</r:if_url>\n<r:unless_url matches=\"^/$\">\n<r:find url=\"/articles/\"><r:children:each limit=\"10\" order=\"desc\">\n* <r:link /></r:children:each></r:find>\n</r:unless_url>\n\n\"Archives...\":/articles/\n\nh3. Syndicate\n\n\"Articles RSS Feed\":/rss/',1),(9,'body',NULL,'This is the third post.',8),(10,'body','Textile','This is just an example of how Radiant can be used to power a Weblog.',9),(11,'sidebar','Textile','h3. Contact Me\n\nList your contact information here.',9),(12,'sidebar',NULL,'<h3>Archives By Month</h3>\n<ul>\n<r:find url=\"/articles/\">\n<r:children:each order=\"desc\">\n<r:header><li><a href=\"<r:date format=\"/articles/%Y/%m/\" />\"><r:date format=\"%B %Y\" /></a></li></r:header>\n</r:children:each>\n</r:find>\n</ul>',4),(13,'body',NULL,'<r:archive:children:each order=\"desc\">\n<div class=\"entry\">\n  <h3><r:link /></h3>\n  <r:content />\n  <r:if_content part=\"extended\"><r:link anchor=\"extended\">Continue Reading&#8230;</r:link></r:if_content>\n  <p class=\"info\">Posted by <r:author /> on <r:date format=\"%b %d, %Y\" /></p>\n</div>\n</r:archive:children:each>',10);
/*!40000 ALTER TABLE `page_parts` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home Page','/','Home',NULL,100,NULL,1,'2007-05-27 16:16:36','2007-05-27 16:16:36','2007-05-27 12:16:36',1,NULL,0,0),(2,'File Not Found','file-not-found','File Not Found','FileNotFoundPage',100,1,NULL,'2007-05-27 16:16:36','2007-05-27 16:16:36','2007-05-27 12:16:36',1,NULL,1,0),(3,'RSS Feed','rss','RSS Feed',NULL,100,1,3,'2007-05-27 16:16:36','2007-05-27 16:16:36','2007-05-27 12:16:36',1,NULL,0,0),(4,'Articles','articles','Articles','ArchivePage',100,1,NULL,'2007-05-27 16:16:36','2007-05-27 16:16:36','2007-05-27 12:16:36',1,NULL,0,0),(5,'First Post','first-post','First Post',NULL,100,4,NULL,'2007-05-27 16:16:36','2007-05-27 16:16:36','2006-06-09 00:00:00',1,NULL,0,0),(6,'Second Post','second-post','Second Post',NULL,100,4,NULL,'2007-05-27 16:16:36','2007-05-27 16:16:36','2006-06-10 00:00:00',1,NULL,0,0),(7,'Styles','styles.css','Styles',NULL,100,1,2,'2007-05-27 16:16:36','2007-05-27 16:16:36','2007-05-27 12:16:36',1,NULL,0,0),(8,'Third Post','third-post','Third Post',NULL,100,4,NULL,'2007-05-27 16:16:36','2007-05-27 16:16:36','2007-05-27 12:16:36',1,NULL,0,0),(9,'About','about','About',NULL,100,1,NULL,'2007-05-27 16:16:36','2007-05-27 16:16:36','2007-05-27 12:16:36',1,NULL,0,0),(10,'%B %Y Archives','monthly-archives','Monthly Archives','ArchiveMonthIndexPage',100,4,NULL,'2007-05-27 16:16:37','2007-05-27 16:16:37','2007-05-27 12:16:37',1,NULL,1,0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `schema_info` WRITE;
/*!40000 ALTER TABLE `schema_info` DISABLE KEYS */;
INSERT INTO `schema_info` VALUES (15);
/*!40000 ALTER TABLE `schema_info` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `snippets` WRITE;
/*!40000 ALTER TABLE `snippets` DISABLE KEYS */;
INSERT INTO `snippets` VALUES (1,'header',NULL,'<div id=\"header\">\n  <div id=\"site-title\"><r:if_url matches=\"^/$\">Your Blog Name</r:if_url><r:unless_url matches=\"^/$\"><a href=\"/\">Your Blog Name</a></r:unless_url></div>\n  <div id=\"site-subtitle\">a really amusing tag-line here</div>\n</div>\n<hr class=\"hidden\" />\n','2007-05-27 16:16:36','2007-05-27 16:16:36',1,NULL,0),(2,'footer',NULL,'<hr class=\"hidden\" />\n<div id=\"footer\">\n  <p>Copyright &copy; <r:date format=\"%Y\" />, Your Name Here. All rights reserved.<br />\n    This site is powered by <a href=\"http://radiantcms.org/\">Radiant CMS</a>.</p>\n</div>\n','2007-05-27 16:16:36','2007-05-27 16:16:36',1,NULL,0);
/*!40000 ALTER TABLE `snippets` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Troy Stribling',NULL,'admin','b08af1f7d5c8fb8894e904e8ced2b6223ac662c7','2007-05-27 16:16:33','2007-05-27 16:16:33',NULL,NULL,1,0,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2007-06-02 16:14:16
