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
INSERT INTO `sessions` VALUES (3,'c497f50272524db072b94df6f815367c','BAh7CzoMdXNlcl9pZGkHOgt0b3BpY3N7ADoPZm9ydW1fcGFnZTA6C2ZvcnVt\nc0AGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewAGOgpAdXNlZHsAOhBsYXN0X2FjdGl2ZXU6CVRpbWUNDtkagAAA8NU=\n','2007-07-08 15:16:37',NULL),(4,'01a1d39c69ca126cb4b04f87bcfd0639','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 15:17:51',NULL),(6,'17ce53c828d7e8957ef7d7d3c5485c45','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 15:20:29',NULL),(7,'0715bb197fac7515e8886ccacb30b926','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 15:24:23',NULL),(9,'1b6562bc945dccde502faab3457b6bcf','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 15:28:20',NULL),(10,'3f2e5217a56d3dd7dd51a22082382e27','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 15:32:19',NULL),(11,'87d60026bc555ddab4d58c150eb604b8','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 15:36:13',NULL),(12,'ed627fcc411b977ed7eaf03f4cd86c81','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-08 15:48:54',NULL);
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
INSERT INTO `users` VALUES (1,'troy','planb.research@gmail.com','3ee35708aa91327d2b34fdaf86bee86212f6106f','2007-07-08 14:51:06',NULL,1,0,'2007-07-08 15:48:24','Troy Stribling','2007-07-08 15:48:24',NULL,'c1880cee6b37ae1f02b0f56a1f283b51bd08d6ef','2008-07-07 21:48:24',1,NULL,'',NULL),(2,'test','troy.stribling@gmail.com','3ee35708aa91327d2b34fdaf86bee86212f6106f','2007-07-08 14:53:02',NULL,NULL,0,'2007-07-08 14:53:47','Tester','2007-07-08 14:53:31',NULL,'c1ea1f18b5a747f18efebd02126b82edd9ab812e','2008-07-07 20:53:02',1,NULL,'',NULL);
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

