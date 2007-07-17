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
INSERT INTO `sessions` VALUES (2,'5d7467cac95451ef93e3b4349f429bb0','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 17:12:44',NULL),(4,'ac600216282ad0536d1ca1b814cf9b6f','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 17:29:41',NULL),(5,'b964c1b6c48dcef45521cce79441b5bb','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 19:10:13',NULL),(6,'5eb283d85bcb2b68a2bf2e0f8397d8c7','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 19:10:14',NULL),(7,'e66b4ff575a6b518f34f298ef0c0a9d1','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 19:10:14',NULL),(8,'03553f185fb9f991e4bc0c28f9d80ce1','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 21:06:20',NULL),(9,'d56cba1d804eef17ec8ee3876b4f6d6b','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 21:06:21',NULL),(10,'24070eca85ac64b684a42c59b7f608aa','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-08 23:02:10',NULL),(11,'3f2de01f6be0d647d52e6baf89f8fa84','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-09 02:52:35',NULL),(12,'7f7201beaac44885a5be52388b42db92','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-09 06:58:28',NULL),(13,'d59227de23b100789351a6cd225a9e77','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-10 00:14:54',NULL),(14,'328f6375d174b16f830f489f2708866f','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-10 11:23:40',NULL),(15,'c53acf994b87928c13008c9d3ca61f2e','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-10 20:59:48',NULL),(16,'8ea0b89ed1b20e1eb33ace60a21d6f6a','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-10 20:57:47',NULL),(17,'81dc1bf79439dea0a4ca0f3013d6a7f0','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-11 00:31:17',NULL),(18,'fd48e2f75a547d5e5c337f2820e2fab1','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-12 14:43:28',NULL),(19,'dcaffa9fb4cde0e952e0a019fb643684','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-12 21:51:38',NULL),(20,'b838634936f761734154ca08374a81ef','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-13 00:36:39',NULL),(21,'96c1472d3583ef087352108b8f734eb6','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-13 00:36:47',NULL),(22,'e25a1df25543609bdff7a22f625bc6b4','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-13 02:14:05',NULL),(23,'22069cfd84262be31546947c2f7f2a07','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-13 05:14:06',NULL),(24,'5e55a9eac52ba8c8b844b5c92b32b1b3','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-13 08:14:06',NULL),(25,'cd0856c49d042ebee72cd826bec36399','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-13 11:08:28',NULL),(26,'44f3194c169309319d8b95a0ccd694f5','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-13 11:14:07',NULL),(27,'8cd05957aede8d7b636be9550db6a2ee','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-13 14:15:22',NULL),(28,'42904c88f5e07847e0b8da0d99c6ea3d','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-13 17:15:22',NULL),(29,'1a9fec282ab93233f085b2f6637a231d','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-13 20:15:23',NULL),(30,'4b8835567d485eb67deb3389fe32320a','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-13 23:15:24',NULL),(31,'17901cc432d2d196a0f27fd1bbfb0151','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-14 02:15:24',NULL),(32,'ad22ccb4db14af1478931fb87e575f98','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-14 05:15:25',NULL),(33,'4ce62c12d567a899ebde1f380296f860','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-14 08:15:25',NULL),(34,'13974a7456d29624f83402f63452648d','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-14 11:15:26',NULL),(35,'f4c510b985935e8eb00855a9bad2be2e','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-14 14:15:27',NULL),(36,'74f56a7f37eb6b90d86ce28c0624b8dc','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-14 20:44:07',NULL),(37,'fe9c216bdcc7201a1b29e7fcf7fd50ad','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-14 17:15:28',NULL),(38,'09d47aca538f7c65acc02a9275d484d9','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-14 20:15:28',NULL),(39,'16e34a1b8e33af5ce0636a640678f5a7','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-14 23:15:29',NULL),(40,'4dac3bc01241fe18239a1bb6cc10bce0','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-15 02:15:30',NULL),(41,'9c37c462a841d64ac8ba4279d020da39','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-15 05:15:31',NULL),(42,'05b42a8fc9cb47b38f668f034e52b573','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-15 08:15:30',NULL),(43,'3f708c87d50e91b3124c233ee3464665','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-15 11:15:31',NULL),(44,'337d0435c5df498d3fe661191c04dad1','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-15 13:58:54',NULL),(45,'e5dcd7c8ee7c37a508ece29de6aa99b5','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-15 14:15:32',NULL),(46,'5296ed8c8cd62ec1a675354fd48162a1','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-15 17:01:19',NULL),(47,'34456fa455c1d47c95af350438aa42a9','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-15 17:15:32',NULL),(48,'76a69dda37100644a7204b38aea7c6f4','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-15 17:51:50',NULL),(49,'d0cac59103b4b76871c24a20b62969b1','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-15 19:53:11',NULL),(50,'e077b4f9284024c9d77279966101bf39','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-15 20:15:33',NULL),(51,'6d45ece503a539d97893432481a82e33','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-15 23:15:34',NULL),(52,'ed40435de4bf33d4631d79636ba8e65a','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 02:15:35',NULL),(53,'c4e0aa9fd2ac833016135cb79e2ed576','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 05:15:36',NULL),(54,'5be17f225ccbbd9980ddb519beec6407','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 06:13:43',NULL),(55,'4627b5cf6e78439f127ab368aae059bd','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 06:15:25',NULL),(56,'17c9c4621c7720395bc21984645b10ec','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 06:15:29',NULL),(57,'1eca04e1f696f0ea3c2690ef3947c105','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 06:22:12',NULL),(58,'a90622526fe237750841c4a8f972a36b','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 06:27:07',NULL),(59,'9036ccba27660b7ec4e0bf89ada67d68','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 06:30:31',NULL),(60,'77d25f6c4a6873a6bb9c0a8fb76afb25','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-16 06:59:53',NULL),(61,'fd93037956585b5a8343daaaaebd0a83','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 07:01:16',NULL),(62,'f810604ba45ab2b06654d0b58587fddc','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 07:01:35',NULL),(63,'5853c8ff78688c7c7c419b3819123a59','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 07:02:59',NULL),(64,'e626535acb22bfb0e73429c3cae23889','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 08:15:36',NULL),(65,'aed3242f81d8c7eb65804e82ca090df6','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 11:12:47',NULL),(66,'78cd704304da37de85cec80dc31ac130','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 11:14:45',NULL),(67,'1fd8a6c9b069fc750fc56168f574b0b2','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 11:15:36',NULL),(68,'79a1df7fda76a5573b9137a3ec7f4748','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-16 11:53:22',NULL),(69,'da8808f9174fb60f0c6b9ea266d4c4e8','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 14:00:09',NULL),(70,'a6c4fdebbe453870762ace2627878583','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 14:15:37',NULL),(71,'b24b1ca1b0d417eea186ead543d3d244','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 17:15:38',NULL),(72,'b1435abd5f8034241e6168bf4f83387b','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 20:15:38',NULL),(73,'a1adb9260b58e4f10cd20f782506916d','BAh7BzoPZm9ydW1fcGFnZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2007-07-16 21:15:39',NULL),(74,'35ace113ab12ff15d65f4ca4a1176102','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2007-07-16 23:15:38',NULL);
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
INSERT INTO `topics` VALUES (1,1,1,'Getting Started with has_ancestor','2007-07-08 16:36:18','2007-07-08 16:36:18',6,1,1,'2007-07-08 16:36:19',0,1,1);
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
INSERT INTO `users` VALUES (1,'troy','planb.research@gmail.com','3ee35708aa91327d2b34fdaf86bee86212f6106f','2007-07-08 16:18:54',NULL,1,1,'2007-07-08 21:51:47','Troy Stribling','2007-07-08 21:54:28','research.inplanb.com','da6ac9d0f392ffe1b6e399ae4c20593d8941de93','2008-07-08 03:51:47',1,'Plan-B Research contributor.','<p>Plan-B Research contributor.</p>',NULL);
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

