-- MySQL dump 10.10
--
-- Host: localhost    Database: planb_forum_live
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
-- Current Database: `planb_forum_live`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `planb_forum_live` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `planb_forum_live`;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
CREATE TABLE `forums` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `topics_count` int(11) default '0',
  `posts_count` int(11) default '0',
  `position` int(11) default NULL,
  `description_html` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forums`
--


/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
LOCK TABLES `forums` WRITE;
INSERT INTO `forums` VALUES (1,'has_ancestor','Installation, use and new features.',1,1,1,'<p>Installation, use and new features.</p>');
UNLOCK TABLES;
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;

--
-- Table structure for table `logged_exceptions`
--

DROP TABLE IF EXISTS `logged_exceptions`;
CREATE TABLE `logged_exceptions` (
  `id` int(11) NOT NULL auto_increment,
  `exception_class` varchar(255) default NULL,
  `controller_name` varchar(255) default NULL,
  `action_name` varchar(255) default NULL,
  `message` varchar(255) default NULL,
  `backtrace` text,
  `environment` text,
  `request` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logged_exceptions`
--


/*!40000 ALTER TABLE `logged_exceptions` DISABLE KEYS */;
LOCK TABLES `logged_exceptions` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `logged_exceptions` ENABLE KEYS */;

--
-- Table structure for table `moderatorships`
--

DROP TABLE IF EXISTS `moderatorships`;
CREATE TABLE `moderatorships` (
  `id` int(11) NOT NULL auto_increment,
  `forum_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_moderatorships_on_forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `moderatorships`
--


/*!40000 ALTER TABLE `moderatorships` DISABLE KEYS */;
LOCK TABLES `moderatorships` WRITE;
INSERT INTO `moderatorships` VALUES (1,1,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `moderatorships` ENABLE KEYS */;

--
-- Table structure for table `monitorships`
--

DROP TABLE IF EXISTS `monitorships`;
CREATE TABLE `monitorships` (
  `id` int(11) NOT NULL auto_increment,
  `topic_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `active` tinyint(1) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `monitorships`
--


/*!40000 ALTER TABLE `monitorships` DISABLE KEYS */;
LOCK TABLES `monitorships` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `monitorships` ENABLE KEYS */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `topic_id` int(11) default NULL,
  `body` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `forum_id` int(11) default NULL,
  `body_html` text,
  PRIMARY KEY  (`id`),
  KEY `index_posts_on_forum_id` (`forum_id`,`created_at`),
  KEY `index_posts_on_user_id` (`user_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--


/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
LOCK TABLES `posts` WRITE;
INSERT INTO `posts` VALUES (1,1,1,'<p>\r\nSee has <a href=\"http://research.inplanb.com\">has_ancestor project page</a> for instructions on installation, documentation and road map.\r\n</p>\r\n<p>\r\nSee <a href=\"http://plans.inplanb.com/articles/2007/06/28/construct-model-abstractions-with-has_ancestor\">Construct Model Abstractions with has_ancestor</a> for a tutorial that implements a simple model and illustrates use cases.\r\n</p>','2007-07-08 16:36:19','2007-07-08 16:36:19',1,'<p><br />See has <a href=\"http://research.inplanb.com\">has_ancestor project page</a> for instructions on installation, documentation and road map.<br /></p><br /><p><br />See <a href=\"http://plans.inplanb.com/articles/2007/06/28/construct-model-abstractions-with-has_ancestor\">Construct Model Abstractions with has_ancestor</a> for a tutorial that implements a simple model and illustrates use cases.<br /></p>');
UNLOCK TABLES;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

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
INSERT INTO `schema_info` VALUES (49);
UNLOCK TABLES;
/*!40000 ALTER TABLE `schema_info` ENABLE KEYS */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) default NULL,
  `data` text,
  `updated_at` datetime default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `sessions_session_id_index` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--


/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
LOCK TABLES `sessions` WRITE;
INSERT INTO `sessions` VALUES (2,'5d7467cac95451ef93e3b4349f429bb0','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 17:12:44',NULL),(3,'60c4fe23050e8e081a1c8cbc7c1896f9','BAh7CzoMdXNlcl9pZGkGOgt0b3BpY3N7ADoLZm9ydW1zQAY6D2ZvcnVtX3Bh\nZ2UwIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewAGOgpAdXNlZHsAOhBsYXN0X2FjdGl2ZXU6CVRpbWUNEdkagAAAIEU=\n','2007-07-08 21:52:55',NULL),(4,'ac600216282ad0536d1ca1b814cf9b6f','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 17:29:41',NULL),(5,'b964c1b6c48dcef45521cce79441b5bb','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 19:10:13',NULL),(6,'5eb283d85bcb2b68a2bf2e0f8397d8c7','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 19:10:14',NULL),(7,'e66b4ff575a6b518f34f298ef0c0a9d1','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 19:10:14',NULL),(8,'03553f185fb9f991e4bc0c28f9d80ce1','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 21:06:20',NULL),(9,'d56cba1d804eef17ec8ee3876b4f6d6b','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 21:06:21',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL auto_increment,
  `forum_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `hits` int(11) default '0',
  `sticky` int(11) default '0',
  `posts_count` int(11) default '0',
  `replied_at` datetime default NULL,
  `locked` tinyint(1) default '0',
  `replied_by` int(11) default NULL,
  `last_post_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_topics_on_forum_id` (`forum_id`),
  KEY `index_topics_on_sticky_and_replied_at` (`forum_id`,`sticky`,`replied_at`),
  KEY `index_topics_on_forum_id_and_replied_at` (`forum_id`,`replied_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topics`
--


/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
LOCK TABLES `topics` WRITE;
INSERT INTO `topics` VALUES (1,1,1,'Getting Started with has_ancestor','2007-07-08 16:36:18','2007-07-08 16:36:18',1,1,1,'2007-07-08 16:36:19',0,1,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `password_hash` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `last_login_at` datetime default NULL,
  `admin` tinyint(1) default NULL,
  `posts_count` int(11) default '0',
  `last_seen_at` datetime default NULL,
  `display_name` varchar(255) default NULL,
  `updated_at` datetime default NULL,
  `website` varchar(255) default NULL,
  `login_key` varchar(255) default NULL,
  `login_key_expires_at` datetime default NULL,
  `activated` tinyint(1) default '0',
  `bio` varchar(255) default NULL,
  `bio_html` text,
  `identity_url` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_users_on_last_seen_at` (`last_seen_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--


/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'troy','planb.research@gmail.com','3ee35708aa91327d2b34fdaf86bee86212f6106f','2007-07-08 16:18:54',NULL,1,1,'2007-07-08 21:51:47','Troy Stribling','2007-07-08 21:52:55','research.inplanb.com','da6ac9d0f392ffe1b6e399ae4c20593d8941de93','2008-07-08 03:51:47',1,'','',NULL);
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

