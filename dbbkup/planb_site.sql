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
INSERT INTO `layouts` VALUES (4,'Single Column','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"\r\n  \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\r\n<html>\r\n  <head>\r\n    <title><r:title /></title>\r\n    <link href=\"/rss/\" rel=\"alternate\" title=\"RSS\" type=\"application/rss+xml\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"/planb/css/single_column.css\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"/planb/css/site.css\" />\r\n    <link rel=\"shortcut icon\" href=\"/favicon.ico\" />	  \r\n  </head>\r\n  <body>\r\n    <div id=\"navigation-wrapper\">\r\n      <div id=\"navigation\">\r\n        <r:content part=\"navigation\" inherit=\"true\" />\r\n      </div>\r\n    </div>\r\n    <div id=\"banner-wrapper\">\r\n      <div id=\"banner\">\r\n        <r:content part=\"banner\" inherit=\"true\" />\r\n      </div>\r\n    </div>\r\n    <div id=\"page\">\r\n      <r:content />\r\n      <r:snippet name=\"footer\" />\r\n    </div>\r\n  </body>\r\n</html>\r\n','2007-06-03 20:29:00','2007-06-12 02:24:41',1,1,'',15);
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
INSERT INTO `page_parts` VALUES (1,'body','','<div class=\"section-wrapper\">\r\n  <div class=\"section\">\r\n    <h1><a href=\"has_ancestor\">has_ancestor</a></h1>\r\n    <div class=\"subsection-wrapper\">\r\n      <div class=\"subsection\">\r\n	<p>\r\n          <a href=\"/has_ancestor\">has_ancestor</a> is a Ruby on Rails plug-in that adds two class methods to ActiveRecord::Base that allow specification of inheritance relations \r\n          between ActiveRecord models. With           \r\n          the method has_ancestor an ancestor relation is declared between a descendant model and its ancestor and with the method has_descendants a descendant relation is declared between an          \r\n          ancestor model and its descendants. Once ancestor and descendant relations are declared between models the models interact as would be expected from class inheritance, ancestor \r\n          instance and class methods may be called from the descendant model, this permits access to ancestor attributes from the descendant model, and polymorphic methods implemented on both \r\n          ancestor and descendant may be called from the ancestor.\r\n	</p>\r\n      </div>\r\n    </div>	 \r\n    <h1><a href=\"/acts_as_aln\">acts_as_aln</a></h1>\r\n    <div class=\"subsection-wrapper\">\r\n      <div class=\"subsection\">\r\n	<p>\r\n          <a href=\"/acts_as_aln\">acts_as_aln</a>, or Acts as Abstract Layered Network, is a Ruby on Rails plug-in that provides an infrastructure for construction of enterprise \r\n          information models. The Abstract Layered\r\n          Network model is inspired by the network information models described in \r\n          <a href=\"http://www.itu.int/rec/T-REC-M.3100/en\">ITU M.3100</a>, <a href=\"http://www.tmforum.org/browse.aspx?catID=1718&linkID=32960\">TMF 814</a> and \r\n          <a href=\"http://telecom-info.telcordia.com/ido/AUX/GR_1093_TOC.i02.pdf\">Telecordia GR-1093-CORE</a>, which attempt to develop detailed object models that describe many of the \r\n          attributes and state transitions of communication networks. In this vein <a href=\"http://www.dmtf.org/standards/cim/\">the DMTF Common Information Model</a> \r\n          attempts to develop a model of the enterprise infrastructure. Instead following the path pursued by these models acts_as_aln only models a few objects, \r\n          the relations between the objects and a couple of attribute types. The information that most strongly impacts the structure of an application built on model. \r\n          This greatly simplifies the information model and extends its domain of applicability. While the other models are limited to communications networks, and enterprise \r\n          hardware and software in the case of DMTF-CIM, acts_as_aln can be applied to these domains and possibly to seemingly unrelated domains such as project management, customer \r\n          relationship management, human resource management, business intelligence and financial management.\r\n	</p>\r\n      </div>\r\n    </div>	 \r\n    <h1><a href=\"/linux-agent\">linux agent</a></h1>\r\n    <div class=\"subsection-wrapper\">\r\n      <div class=\"subsection\">\r\n	<p>\r\n          <a href=\"/linux-agent\">linux agent</a> is an implementation of acts_as_aln applied to Red Hat and Debian Linux dialects. Linux Agent provides the ability to discover \r\n          system resources and configuration\r\n          and report system performance using <a href=\"http://perso.orange.fr/sebastien.godard/tutorial.html\">SYSSTAT</a>.\r\n	</p>\r\n      </div>\r\n    </div>	 \r\n  </div>\r\n</div>	 \r\n',1),(2,'body','Textile','The file you were looking for could not be found.\r\n\r\nAttempted URL: @<r:attempted_url />@\r\n\r\nIt is possible that you typed the URL incorrectly or that you clicked on a bad link.\r\n\r\n\"<< Back to Home Page\":/\r\n',2),(14,'banner','','<h1>projects</h1>',1),(15,'navigation','','<ul>\r\n  <li><a href=\"/\"><strong>projects</strong></a></li>\r\n  <li><a href=\"http://plans.inplanb.com\">planning</a></li>\r\n  <li><a href=\"/about\">about</a></li>\r\n</ul>\r\n',1),(16,'body','','<div class=\"section-wrapper\">\r\n  <div class=\"section\">\r\n    <h1>Overview</h1>\r\n      <div class=\"subsection-wrapper\">\r\n        <div class=\"subsection\">\r\n	  <p>\r\n          has_ancestor is a Ruby on Rails plug-in that adds two class methods to ActiveRecord::Base that allow specification of inheritance relations \r\n          between ActiveRecord models. With           \r\n          the method has_ancestor an ancestor relation is declared between a descendant model and its ancestor and with the method has_descendants a descendant relation is declared between an          \r\n          ancestor model and its descendants. Once ancestor and descendant relations are declared between models the models interact as would be expected from class inheritance, ancestor \r\n          instance and class methods may be called from the descendant model, this permits access to ancestor attributes from the descendant model, and polymorphic methods implemented on both \r\n          ancestor and descendant may be called from the ancestor.\r\n	  </p>\r\n        </div>\r\n      </div>	 \r\n    <h1>Install</h1>\r\n      <div class=\"subsection-wrapper\">\r\n        <div class=\"subsection\">\r\n	  <p>\r\n	  </p>\r\n        </div>\r\n      </div>	 \r\n    <h1>Use</h1>\r\n      <div class=\"subsection-wrapper\">\r\n        <div class=\"subsection\">\r\n          <h1>ActiveRecord::Base class methods</h1>\r\n	  <p>the following methods are inserted into ActiveRecord::Base.\r\n          </p>\r\n          <p>\r\n            <table class=\"definitions\">\r\n              <tr>\r\n                <td class=\"term\">has_descendants</td>\r\n                <td class=\"definition\">Declare a model has descendants.</td>\r\n              </tr>\r\n              <tr>\r\n                <td class=\"term\">has_ancestor(:named=>:model)</td>\r\n                <td class=\"definition\">Declare a model ancestor named <strong>:model</strong>.\r\n                </td>\r\n              </tr>\r\n            </table>\r\n	  </p>\r\n        </div>\r\n      </div>	 \r\n      <div class=\"subsection-wrapper\">\r\n        <div class=\"subsection\">\r\n          <h1>ancestor and descendant instance methods</h1>\r\n	  <p>If either has_ancestor or has_descendant is called in a ActiveRecord::Base model the following instance methods will be available to the model.\r\n          </p>\r\n          <p>\r\n            <table class=\"definitions\">\r\n              <tr>\r\n                <td class=\"term\">descendant</td>\r\n                <td class=\"definition\">Return descendant model instance. If model has no descendant return nil.</td>\r\n              </tr>\r\n              <tr>\r\n                <td class=\"term\">to_descendant([:model])</td>\r\n                <td class=\"definition\">Return descendant model if specified and throw Planb::InvalidType if model is not a descendant. If model is not specified return model \r\n                    at root of inheritance hierarchy.\r\n                </td>\r\n              </tr>\r\n            </table>\r\n	  </p>\r\n        </div>\r\n      </div>	 \r\n    <h1>Road Map</h1>\r\n      <div class=\"subsection-wrapper\">\r\n        <div class=\"subsection\">\r\n	  <p>\r\n             <ul>\r\n               <li class=\"feature\">feature</li>\r\n             </ul>\r\n	  </p>\r\n        </div>\r\n      </div>	 \r\n  </div>\r\n</div>	 \r\n',3),(18,'body','','<div class=\"section-wrapper\">\r\n  <div class=\"section\">\r\n    <h1>Project</h1>\r\n    <div class=\"subsection-wrapper\">\r\n      <div class=\"subsection\">\r\n	<p>\r\n	</p>\r\n      </div>\r\n    </div>	 \r\n  </div>\r\n</div>	 \r\n',4),(20,'banner','','<h1>has_ancestor</h1>',3),(21,'navigation','','<ul>\r\n  <li><a href=\"/\">projects</a></li>\r\n  <li><a href=\"http://plans.inplanb.com\">planning</a></li>\r\n  <li><a href=\"/about\"><strong>about</strong></a></li>\r\n</ul>\r\n',4),(22,'body','','<div class=\"section-wrapper\">\r\n  <div class=\"section\">\r\n    <h1>Overview</h1>\r\n      <div class=\"subsection-wrapper\">\r\n        <div class=\"subsection\">\r\n	  <p>\r\n          acts_as_aln, or Acts as Abstract Layered Network, is a Ruby on Rails plug-in that provides an infrastructure for construction of enterprise \r\n          information models. The Abstract Layered\r\n          Network model is inspired by the network information models described in \r\n          <a href=\"http://www.itu.int/rec/T-REC-M.3100/en\">ITU M.3100</a>, <a href=\"http://www.tmforum.org/browse.aspx?catID=1718&linkID=32960\">TMF 814</a> and \r\n          <a href=\"http://telecom-info.telcordia.com/ido/AUX/GR_1093_TOC.i02.pdf\">Telecordia GR-1093-CORE</a>, which attempt to develop detailed object models that describe many of the \r\n          attributes and state transitions of communication networks. In this vein <a href=\"http://www.dmtf.org/standards/cim/\">the DMTF Common Information Model</a> \r\n          attempts to develop a model of the enterprise infrastructure. Instead following the path pursued by these models acts_as_aln only models a few objects, \r\n          the relations between the objects and a couple of attribute types. The information that most strongly impacts the structure of an application built on model. \r\n          This greatly simplifies the information model and extends its domain of applicability. While the other models are limited to communications networks, and enterprise \r\n          hardware and software in the case of DMTF-CIM, acts_as_aln can be applied to these domains and possibly to seemingly unrelated domains such as project management, customer \r\n          relationship management, human resource management, business intelligence and financial management.\r\n	  </p>\r\n        </div>\r\n      </div>	 \r\n  </div>\r\n</div>	 \r\n',5),(23,'banner','','<h1>acts_as_aln</h1>',5),(24,'banner','','<h1>linux agent</h1>',6),(25,'body','','<div class=\"section-wrapper\">\r\n  <div class=\"section\">\r\n    <h1>Overview</h1>\r\n      <div class=\"subsection-wrapper\">\r\n        <div class=\"subsection\">\r\n	  <p>\r\n          Linux Agent is an implementation of acts_as_aln applied to Red Hat and Debian Linux dialects. Linux Agent provides the ability to discover system resources and configuration\r\n          and report system performance using <a href=\"http://perso.orange.fr/sebastien.godard/tutorial.html\">SYSSTAT</a>.\r\n	  </p>\r\n        </div>\r\n      </div>	 \r\n  </div>\r\n</div>	 \r\n',6),(26,'banner','','<h1>about</h1>',4),(27,'banner','','',2);
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
INSERT INTO `pages` VALUES (1,'projects','/','projects','Page',100,NULL,4,'2007-05-27 16:16:36','2007-06-14 00:23:36','2007-05-27 12:16:36',1,1,0,54),(2,'File Not Found','file-not-found','File Not Found','FileNotFoundPage',100,1,NULL,'2007-05-27 16:16:36','2007-06-14 00:12:47','2007-05-27 12:16:36',1,1,1,1),(3,'has_ancestor','has_ancestor','has_ancestor','Page',100,1,4,'2007-06-10 03:44:27','2007-06-14 03:18:20','2007-06-10 03:44:27',1,1,0,34),(4,'about','about','about','Page',100,1,4,'2007-06-10 03:44:40','2007-06-12 00:32:22','2007-06-10 03:52:20',1,1,0,6),(5,'acts_as_aln','acts_as_aln','acts_as_aln','Page',100,1,4,'2007-06-10 17:23:25','2007-06-14 00:24:06','2007-06-10 17:25:13',1,1,0,7),(6,'linux agent','linux-agent','linux agent','Page',100,1,4,'2007-06-11 01:26:50','2007-06-14 00:18:00','2007-06-11 01:43:05',1,1,0,4);
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

