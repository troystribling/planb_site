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
INSERT INTO `layouts` VALUES (4,'Single Column','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"\r\n  \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\r\n<html>\r\n  <head>\r\n    <title><r:title /></title>\r\n    <link href=\"/rss/\" rel=\"alternate\" title=\"RSS\" type=\"application/rss+xml\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"/planb/css/single_column.css\" />\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"/planb/css/site.css\" />\r\n    <link rel=\"shortcut icon\" href=\"/favicon.ico\" />	  \r\n    <meta name=\"microid\" content=\"f2706b5615cb114363cba965c14ff01cd5d3bb9f\" />\r\n  </head>\r\n  <body>\r\n    <div id=\"navigation-wrapper\">\r\n      <div id=\"navigation\">\r\n        <r:content part=\"navigation\" inherit=\"true\" />\r\n      </div>\r\n    </div>\r\n    <div id=\"banner-wrapper\">\r\n      <div id=\"banner\">\r\n        <r:content part=\"banner\" inherit=\"true\" />\r\n      </div>\r\n    </div>\r\n    <div id=\"page\">\r\n      <div class=\"section-wrapper\">\r\n        <div class=\"section\">\r\n          <r:content />\r\n        </div>\r\n      </div>\r\n      <r:snippet name=\"footer\" />\r\n    </div>\r\n  </body>\r\n</html>\r\n','2007-06-03 20:29:00','2007-07-08 15:22:39',1,1,'',20);
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
INSERT INTO `page_parts` VALUES (1,'body','','<h1><a href=\"has_ancestor\">has_ancestor</a></h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n    <p>\r\n      <a href=\"http://research.inplanb.com/has_ancestor\">has_ancestor</a> is a Ruby on Rails plug-in that provides an implementation of \r\n      <a href=\"http://www.martinfowler.com/eaaCatalog/classTableInheritance.html\" target=\"_blank\">Class Table Inheritance</a> based on \r\n      <a href=\"http://wiki.rubyonrails.org/rails/pages/UnderstandingPolymorphicAssociations\" target=\"_blank\">Rails Polymorphic Associations</a>. The plugin\r\n      adds two methods to <code>ActiveRecord::Base</code>, <code>has_ancestor</code> and <code>has_descendants</code>. \r\n      With <code>has_descendants</code> a model\r\n      declares that its attributes and methods are inheritable. With\r\n      <code>has_ancestor</code> a model declares that it inherits the attributes and methods of the specified model. Once ancestor\r\n      and descendant relations are declared the models interact as expected from class inheritance, this includes defining methods that \r\n      behave in a polymorphic manner. See <a href=\"http://plans.inplanb.com/articles/2007/06/28/construct-model-abstractions-with-has_ancestor\">\r\n       has_ancestor Model Abstractions</a> for a discussion of a simple implementation using the plugin and\r\n      <a href=\"http://plans.inplanb.com/articles/2007/09/24/has_ancestor-finders\" target=\"_blank\">has_ancestor finders</a> for a discussion\r\n      of database query construction. \r\n    </p>\r\n  </div>\r\n</div>	 \r\n<h1>acts_as_aln</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n    <p>\r\n      acts_as_aln, or Acts as Abstract Layered Network, is a Ruby on Rails plug-in that provides an infrastructure for construction of enterprise \r\n      information models. The Abstract Layered\r\n      Network model is inspired by the network information models described in \r\n      <a href=\"http://www.itu.int/rec/T-REC-M.3100/en\">ITU M.3100</a>, <a href=\"http://www.tmforum.org/browse.aspx?catID=1718&linkID=32960\">TMF 814</a> and \r\n      <a href=\"http://telecom-info.telcordia.com/ido/AUX/GR_1093_TOC.i02.pdf\">Telecordia GR-1093-CORE</a> that attempt to develop detailed object models that describe many of the \r\n      attributes and state transitions of communication networks. In this vein <a href=\"http://www.dmtf.org/standards/cim/\">the DMTF Common Information Model</a> \r\n      attempts to develop a model of the enterprise infrastructure. Of the previously stated references only DMTF has documentation\r\n      in the public domain. Instead following the path pursued by these efforts acts_as_aln only considers a few objects, \r\n      the relations between the objects and a couple of attribute types, namely, the information that most strongly impacts the structure of an application built on the model. \r\n      This greatly simplifies the information model and extends its domain of applicability. While the other models are limited to communications networks, and enterprise \r\n      hardware and software in the case of DMTF-CIM because of their detail, acts_as_aln can be applied to these domains and possibly to seemingly unrelated domains such as project management, customer \r\n      relationship management, human resource management, business intelligence and financial management.\r\n    </p>\r\n  </div>\r\n</div>	 \r\n<h1>linux agent</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n    <p>\r\n      linux agent is an implementation of acts_as_aln applied to Red Hat and Debian Linux dialects. Linux Agent provides the ability to discover \r\n      system resources and configuration\r\n      and report system performance using <a href=\"http://perso.orange.fr/sebastien.godard/tutorial.html\">SYSSTAT</a>.\r\n    </p>\r\n  </div>\r\n</div>	 \r\n',1),(2,'body','Textile','The file you were looking for could not be found.\r\n\r\nAttempted URL: @<r:attempted_url />@\r\n\r\nIt is possible that you typed the URL incorrectly or that you clicked on a bad link.\r\n\r\n\"<< Back to Home Page\":/\r\n',2),(14,'banner','','<h1>projects</h1>',1),(15,'navigation','','<ul>\r\n  <li><a href=\"/\"><strong>projects</strong></a></li>\r\n  <li><a href=\"http://plans.inplanb.com\">plans</a></li>\r\n  <li><a href=\"/about\">about</a></li>\r\n  <li><a href=\"http://discussion.inplanb.com\">discussion</a></li>\r\n</ul>\r\n',1),(16,'body','','<h1>Project</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n    <h1>Description</h1>\r\n    <p>\r\n      has_ancestor is a Ruby on Rails plug-in that provides an implementation of \r\n      <a href=\"http://www.martinfowler.com/eaaCatalog/classTableInheritance.html\" target=\"_blank\">Class Table Inheritance</a> based on \r\n      <a href=\"http://wiki.rubyonrails.org/rails/pages/UnderstandingPolymorphicAssociations\" target=\"_blank\">Rails Polymorphic Associations</a>. The plugin\r\n      adds two methods to <code>ActiveRecord::Base</code>, <code>has_ancestor</code> and <code>has_descendants</code>. \r\n      With <code>has_descendants</code> a model\r\n      declares that its attributes and methods are inheritable. With\r\n      <code>has_ancestor</code> a model declares that it inherits the attributes and methods of the specified model. Once ancestor\r\n      and descendant relations are declared the models interact as expected from class inheritance, this includes defining methods that \r\n      behave in a polymorphic manner.\r\n    </p>\r\n   </div>\r\n</div>	 \r\n<div class=\"subsection-float\">\r\n  <div class=\"subsection\">\r\n    <h1>Links</h1>\r\n    <ul>\r\n      <li><a href=\"http://plans.inplanb.com/articles/2007/09/24/has_ancestor-finders\" target=\"_blank\">\r\n          has_ancestor finders</a>\r\n      <li><a href=\"http://plans.inplanb.com/articles/2007/06/28/construct-model-abstractions-with-has_ancestor\" target=\"_blank\">\r\n           has_ancestor Model Abstractions</a>\r\n      </li>\r\n      <li><a href=\"http://discussion.inplanb.com/forums/1\" target=\"_blank\">has_ancestor discussion forum</a></li>\r\n      <li><a href=\"http://rubyforge.org/projects/has-ancestor/\" target=\"_blank\">RubyForge project page</a></li>\r\n      <li><a href=\"http://research.inplanb.com/planb/html/has_ancestor_spec_report.html\" target=\"_blank\">has_ancestor RSpec Report</a></li>\r\n    </ul>\r\n   </div>\r\n</div>	 \r\n\r\n<h1>Install</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n    <p>\r\n      has_ancestor is a Ruby on Rails plugin that is installed in the <code class=\"code-sample\">vendor/plugins</code> \r\n      directory of a Rails project. The source code may be obtained in any the ways listed below.\r\n    </p>\r\n    <div class=\"highlight-wrapper\">\r\n      <div class=\"highlight\">\r\n        <p>Download tar file from <a href=\"http://rubyforge.org/projects/has-ancestor/\"  target=\"_blank\">RubyForge project page</a>.</p>\r\n      </div>\r\n    </div>\r\n    <div class=\"highlight-wrapper\">\r\n      <div class=\"highlight\">\r\n         <p>\r\n            With svn checkout into vendor/plugins directory of your project,<br>\r\n            <p><code>svn co svn://rubyforge.org/var/svn/has-ancestor/tags/rel_0_1_3</code></p>\r\n         </p>\r\n      </div>\r\n    </div>\r\n    <div class=\"highlight-wrapper\">\r\n      <div class=\"highlight\">\r\n        <p>\r\n          Use the Rails plugin installer, <br>\r\n          <p><code>script/plugin install svn://rubyforge.org/var/svn/has-ancestor/tags/rel_0_1_3</code></p>\r\n        </p>\r\n      </div>\r\n    </div>  \r\n     <p>\r\n      After installing the plugin the specs can be run by typing <code>rake spec</code> in the installaintion directory. The database \r\n      connection is configured in <code>test/rails_root/config/database.yml</code>.\r\n     </p>      \r\n  </div>\r\n</div>\r\n	 \r\n<h1>Use</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n    <p>See <a href=\"http://plans.inplanb.com/articles/2007/06/28/construct-model-abstractions-with-has_ancestor\" target=\"_blank\">\r\n       has_ancestor Model Abstractions</a> for a discussion of an implementation using has_ancestor and\r\n       <a href=\"http://plans.inplanb.com/articles/2007/09/24/has_ancestor-0-1-1-finders\" target=\"_blank\">\r\n       has_ancestor finders</a> for a discussion of how to use the finders introduced in release 0.1.3.\r\n    </p>\r\n   </div>\r\n</div>   \r\n<div class=\"subsection-float\">\r\n  <div class=\"subsection\">\r\n    <h1><code>ActiveRecord::Base</code> class methods</h1>\r\n    <p>The following methods are inserted into <code>ActiveRecord::Base</code>.</p>\r\n    <p>\r\n      <table class=\"definitions\">\r\n        <tr>\r\n          <td class=\"term\">has_descendants</td>\r\n          <td class=\"definition\">\r\n            <p>Declare a model has descendants.</p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\">has_ancestor(:named=>:model)</td>\r\n          <td class=\"definition\">\r\n            <p>Declare a model ancestor named <code>:model</code>.</p>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </p>\r\n  </div>\r\n</div>	 \r\n\r\n<div class=\"subsection-float\">\r\n  <div class=\"subsection\">\r\n    <h1>ancestor and descendant instance methods</h1>\r\n    <p>\r\n      If either <code>has_ancestor</code> or <code>has_descendant</code> is called in a <code>ActiveRecord::Base</code> model the following \r\n      instance methods will be available to the model.\r\n    </p>\r\n    <p>\r\n      <table class=\"definitions\">\r\n        <tr>\r\n          <td class=\"term\"><code>ancestor</code></td>\r\n          <td class=\"definition\">\r\n            <p>Return ancestor model instance. If model has no ancestor return <code><strong>nil</strong></code>.</p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>descendant</code></td>\r\n          <td class=\"definition\">\r\n            <p>Return descendant model instance. If model has no descendant return <code><strong>nil</strong></code>.</p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>descendant_of?(:model)</code></td>\r\n          <td class=\"definition\">\r\n            Returns <strong><code>true</code></strong> if specified model is a descendant of model and \r\n            <strong><code>false</code></strong> if not.\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>to_descendant([:model])</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n               Return descendant model if specified and throw <code>Planb::InvalidType</code> if model is not a descendant. \r\n               If model is not specified return model \r\n               at root of inheritance hierarchy.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>has_ancestor?</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Return <code>true</code> if model has an ancestor <code>false</code> otherwise.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>has_descendants?</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Return <code>true</code> if model has descendants <code>false</code> otherwise.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>class_hierarchy</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Returns an array containing the class of the model on which the method was called and the class all of its ancestor models.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>columns_hash_hierarchy</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Returns the result of <code>ActiveRecord#columns_hash</code> called on all models in the inheritance hierarchy.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </p>\r\n  </div>\r\n</div>	 \r\n\r\n<div class=\"subsection-float\">\r\n  <div class=\"subsection\">\r\n    <h1>ancestor and descendant class methods</h1>\r\n    <p>\r\n      If either <code>has_ancestor</code> or <code>has_descendant</code> is called in a <code>ActiveRecord::Base</code> model the following \r\n      class methods will be available to the model.\r\n    </p>\r\n    <p>\r\n      <table class=\"definitions\">\r\n        <tr>\r\n          <td class=\"term\"><code>has_ancestor?</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Return <code>true</code> if model has an ancestor <code>false</code> otherwise.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>has_descendants?</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Return <code>true</code> if model has descendants <code>false</code> otherwise.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>class_hierarchy</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Returns an array containing the class of the model on which the method was called and the class all of its ancestor models.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>columns_hash_hierarchy</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Returns the result of <code>ActiveRecord#columns_hash</code> executed on all models in the inheritance hierarchy.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>find_by_model</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Executes <code>ActiveRecord#find</code> over the database tables defined by the model on which the method was called and the\r\n              database tables of all its ancestor models. All options accepted by \r\n              <a href=\"http://edgedocs.planetargon.org/classes/ActiveRecord/Base.html#M002494\"><code>ActiveRecord#find</code></a> are accepted \r\n              by <code>find_by_model</code>. An instance or instances of the class on which the method was called are returned.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>find_by_attr(v)</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Any calls of the form <code>find_by_attr</code>, where <code>attr</code> is an attribute of the model on which\r\n              the method was called or an attribute of any ancestor model, will return the first instance of the model that \r\n              matches the specified attribute value,<code>v</code>. It is also possible to construct queries in which match conditions for\r\n              attributes are joined by any number of logical <code>ands</code> up to one less than the number attributes in the hierarchy. \r\n              For two attributes the method will have the form <code>find_by_attr1_and_attr2(v1, v2)</code>\r\n              where <code>attr1</code> and <code>attr2</code> are any two distinct attributes belonging to the class or any \r\n              ancestor of the class on which the method was called. \r\n              In a similar manner queries for more than two attributes may be constructed.    \r\n            </p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>find_all_by_attr(v)</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Any calls of the form <code>find_all_by_attr</code>, where <code>attr</code> is an attribute of the model on which\r\n              the method was called or an attribute of any ancestor model, will return all instances of the model that \r\n              match the specified attribute value, <code>v</code>. It is also possible to construct queries in which match conditions for\r\n              attributes are joined by any number of logical <code>ands</code> up to one less than the number attributes in the hierarchy. \r\n              For two attributes the method will have the form <code>find_all_by_attr1_and_attr2(v1, v2)</code>\r\n              where <code>attribute1</code> and <code>attribute2</code> are any two distinct attributes belonging to the class or any \r\n              ancestor of the class on which the method was called. \r\n              In a similar manner queries for more than two attributes may be constructed.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </p>\r\n  </div>\r\n</div>	 \r\n\r\n\r\n<div class=\"subsection-float\">\r\n  <div class=\"subsection\">\r\n    <h1>descendant instance methods</h1>\r\n    <p>\r\n      If <code>has_ancestor</code> is called in a <code>ActiveRecord::Base</code> model the following instance methods will be \r\n      available to the model.\r\n    </p>\r\n    <p>\r\n      <table class=\"definitions\">\r\n        <tr>\r\n          <td class=\"term\"><code>descendant_initialize</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              <code>has_ancestor</code> adds an implementation of <code>initialize</code> to a descendant model. If an \r\n              implementation is provided in a descendant model it will replace this version causing the model to be improperly \r\n              initialized. <code>descendant_initialize</code> is provided as a replacement for <code>initialize</code> for descendant models.\r\n            </p>  \r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>descendant_method_missing</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              <code>has_ancestor</code> adds an implementation of <code>method_missing</code> to a descendant model. If an \r\n              implementation is provided in a descendant model it will replace this version causing the model to not function properly. \r\n              <code>descendant_method_missing</code> is provided as a replacement for <code>method_missing</code> for descendant models. \r\n            </p>  \r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>attributes</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Return attributes of model and of all ancestor models.\r\n            </p>  \r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </p>\r\n  </div>\r\n</div>	 \r\n',3),(18,'body','','<h1>Plan-B</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n     <p>\r\n       The current focus of Plan-B Research is development of the acts_as_aln infrastructure. \r\n       linux agent will provide a test implementation and <a href=\"/has_ancestor\">has_ancestor</a> provides\r\n       required data abstraction functionality. \r\n     </p>\r\n  </div>\r\n</div>	 \r\n<h1>Contact</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n     <p>\r\n      <table class=\"contact\">\r\n        <tr>\r\n          <td class=\"termination\">e-mail</td>\r\n          <td class=\"addr\">\r\n            <a href=\"mailto:planb.research@gmail.com\">planb.research@gmail.com</a>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n     </p>\r\n  </div>\r\n</div>	 \r\n\r\n<h1>Project Status</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n     <p>\r\n      <table class=\"project-status\">\r\n        <tr>\r\n          <td class=\"project\"><a href=\"/has_ancestor\">has_ancestor</a></td>\r\n          <td class=\"status\">\r\n             Released Version 0.1.3\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"project\">acts_as_aln</td>\r\n          <td class=\"status\">\r\n            In Work\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"project\">linux agent</td>\r\n          <td class=\"status\">\r\n            Planning\r\n          </td>\r\n        </tr>\r\n      </table>\r\n     </p>\r\n  </div>\r\n</div>	 \r\n\r\n<h1>Contributors</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n\r\n       <div class=\"clear\">\r\n           &nbsp\r\n       </div>\r\n     \r\n       <div class=\"biographic\">\r\n         <h1>Troy Stribling</h1>\r\n         <img src=\"planb/images/Troy-01.jpg\">\r\n         <div class=\"bio-history\">\r\n           <table>\r\n             <tr>\r\n               <td class=\"bio-item\">Education</td>\r\n               <td class=\"bio-data\">\r\n                 <p>\r\n                   B.S. Physics, University of Tennessee <br>\r\n                   Ph.D. Physics, University of Delaware\r\n                 </p>\r\n               </td>\r\n             </tr>\r\n             <tr>\r\n               <td class=\"bio-item\">Work History</td>\r\n               <td class=\"bio-data\">\r\n                 <p>Research Scientist in Space and Earth Sciences with concentration on Computational Fluid Dynamics and Turbulence Theory.</p>\r\n                 <p>Software Developer, Software Development Manager and Software Architect with several companies involved in Telecommunications \r\n                    Equipment and Services and Information Technology Services.\r\n                 </p> \r\n               </td>\r\n             </tr>\r\n           </table>\r\n           <div class=\"bio-links\">\r\n             <p>\r\n               <a href=\"http://claimid.com/troystribling\" target=\"blank\"><img src=\"http://claimid.com/images/claimid_badge.gif\" border=\"0\" alt=\"Troy Stribling\" title=\"Troy Stribling\"/></a>              \r\n               <a href=\"http://www.linkedin.com/in/troystribling\"  target=\"blank\"><img src=\"http://research.inplanb.com/planb/images/btn_liprofile_blue_80x15.png\" width=\"80\" height=\"15\" border=\"0\" alt=\"LinkedIn\"></a>\r\n             </p>\r\n           </div>\r\n         </div>\r\n       </div>\r\n\r\n       <div class=\"clear\">\r\n           &nbsp\r\n       </div>\r\n\r\n  </div>\r\n</div>	 \r\n',4),(20,'banner','','<h1>has_ancestor</h1>',3),(21,'navigation','','<ul>\r\n  <li><a href=\"/\">projects</a></li>\r\n  <li><a href=\"http://plans.inplanb.com\">plans</a></li>\r\n  <li><a href=\"/about\"><strong>about</strong></a></li>\r\n  <li><a href=\"http://discussion.inplanb.com\">discussion</a></li>\r\n</ul>\r\n',4),(22,'body','','<h1>Project</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n    <h1>Description</h1>\r\n    <p>\r\n      has_ancestor is a Ruby on Rails plug-in that provides an implementation of \r\n      <a href=\"http://www.martinfowler.com/eaaCatalog/classTableInheritance.html\" target=\"_blank\">Class Table Inheritance</a> based on \r\n      <a href=\"http://wiki.rubyonrails.org/rails/pages/UnderstandingPolymorphicAssociations\" target=\"_blank\">Rails Polymorphic Associations</a>. The plugin\r\n      adds two methods to <code>ActiveRecord::Base</code>, <code>has_ancestor</code> and <code>has_descendants</code>. \r\n      With <code>has_descendants</code> a model\r\n      declares that its attributes and methods are inheritable. With\r\n      <code>has_ancestor</code> a model declares that it inherits the attributes and methods of the specified model. Once ancestor\r\n      and descendant relations are declared the models interact as expected from class inheritance, this includes defining methods that \r\n      behave in a polymorphic manner.\r\n    </p>\r\n   </div>\r\n</div>	 \r\n<div class=\"subsection-float\">\r\n  <div class=\"subsection\">\r\n    <h1>Links</h1>\r\n    <ul>\r\n      <li><a href=\"http://plans.inplanb.com/articles/2007/06/28/construct-model-abstractions-with-has_ancestor\">\r\n           Construct Model Abstractions with has_ancestor</a>\r\n      </li>\r\n      <li><a href=\"http://discussion.inplanb.com/forums/1\">has_ancestor discussion forum</a></li>\r\n      <li><a href=\"http://rubyforge.org/projects/has-ancestor/\" target=\"_blank\">RubyForge project page</a></li>\r\n      <li><a href=\"http://research.inplanb.com/planb/html/has_ancestor_spec_report.html\" target=\"_blank\">has_ancestor RSpec Report</a></li>\r\n    </ul>\r\n   </div>\r\n</div>	 \r\n\r\n<h1>Install</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n    <p>\r\n      has_ancestor is a Ruby on Rails plugin that is installed in the <code class=\"code-sample\">vendor/plugins</code> \r\n      directory of a Rails project. The source code may be obtained in any the ways listed below.\r\n    </p>\r\n    <div class=\"highlight-wrapper\">\r\n      <div class=\"highlight\">\r\n        <p>Download tar file from <a href=\"http://rubyforge.org/projects/has-ancestor/\">RubyForge project page</a>.</p>\r\n      </div>\r\n    </div>\r\n    <div class=\"highlight-wrapper\">\r\n      <div class=\"highlight\">\r\n         <p>\r\n            With svn checkout into vendor/plugins directory of your project,<br>\r\n            <p><code>svn co svn://rubyforge.org/var/svn/has-ancestor/tags/rel_0_0_0</code></p>\r\n         </p>\r\n      </div>\r\n    </div>\r\n    <div class=\"highlight-wrapper\">\r\n      <div class=\"highlight\">\r\n        <p>\r\n          Use the Rails plugin installer, <br>\r\n          <p><code>script/plugin install svn://rubyforge.org/var/svn/has-ancestor/tags/rel_0_0_0</code></p>\r\n        </p>\r\n      </div>\r\n    </div>    \r\n  </div>\r\n</div>\r\n	 \r\n<h1>Use</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n    <p>See <a href=\"http://plans.inplanb.com/articles/2007/06/28/construct-model-abstractions-with-has_ancestor\">\r\n       Construct Model Abstractions with has_ancestor</a> for a discussion of an implementation using has_ancestor.</p>\r\n   </div>\r\n</div>   \r\n<div class=\"subsection-float\">\r\n  <div class=\"subsection\">\r\n    <h1><code>ActiveRecord::Base</code> class methods</h1>\r\n    <p>The following methods are inserted into <code>ActiveRecord::Base</code>.</p>\r\n    <p>\r\n      <table class=\"definitions\">\r\n        <tr>\r\n          <td class=\"term\">has_descendants</td>\r\n          <td class=\"definition\">\r\n            <p>Declare a model has descendants.</p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\">has_ancestor(:named=>:model)</td>\r\n          <td class=\"definition\">\r\n            <p>Declare a model ancestor named <code>:model</code>.</p>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </p>\r\n  </div>\r\n</div>	 \r\n\r\n<div class=\"subsection-float\">\r\n  <div class=\"subsection\">\r\n    <h1>ancestor and descendant instance methods</h1>\r\n    <p>\r\n      If either <code>has_ancestor</code> or <code>has_descendant</code> is called in a <code>ActiveRecord::Base</code> model the following \r\n      instance methods will be available to the model.\r\n    </p>\r\n    <p>\r\n      <table class=\"definitions\">\r\n        <tr>\r\n          <td class=\"term\"><code>ancestor</code></td>\r\n          <td class=\"definition\">\r\n            <p>Return ancestor model instance. If model has no ancestor return <code><strong>nil</strong></code>.</p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>descendant</code></td>\r\n          <td class=\"definition\">\r\n            <p>Return descendant model instance. If model has no descendant return <code><strong>nil</strong></code>.</p>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>descendant_of?(:model)</code></td>\r\n          <td class=\"definition\">\r\n            Returns <strong><code>true</code></strong> if specified model is a descendant of model and \r\n            <strong><code>false</code></strong> if not.\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>to_descendant([:model])</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n               Return descendant model if specified and throw <code>Planb::InvalidType</code> if model is not a descendant. \r\n               If model is not specified return model \r\n               at root of inheritance hierarchy.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </p>\r\n  </div>\r\n</div>	 \r\n\r\n<div class=\"subsection-float\">\r\n  <div class=\"subsection\">\r\n    <h1>descendant instance methods</h1>\r\n    <p>\r\n      If <code>has_ancestor</code> is called in a <code>ActiveRecord::Base</code> model the following instance methods will be \r\n      available to the model.\r\n    </p>\r\n    <p>\r\n      <table class=\"definitions\">\r\n        <tr>\r\n          <td class=\"term\"><code>descendant_initialize</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              <code>has_ancestor</code> adds an implementation of initialize to a descendant model. If an \r\n              implementation is provided in a descendant model it will replace this version causing the model to be improperly \r\n              initialized. \r\n              descendant_initialize is provided as a replacement for initialize. Any required model initialization my be performed in \r\n              this method.\r\n            </p>  \r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td class=\"term\"><code>attributes</code></td>\r\n          <td class=\"definition\">\r\n            <p>\r\n              Return attributes of model and of all ancestor models.\r\n            </p>  \r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </p>\r\n  </div>\r\n</div>	 \r\n\r\n<h1>Road Map</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n    <div class=\"highlight-wrapper\">\r\n      <div class=\"highlight\">\r\n        <p>\r\n          A class implementation of <code>descendant_of?</code>.  \r\n        </p>\r\n      </div>\r\n    </div>\r\n    <div class=\"highlight-wrapper\">\r\n      <div class=\"highlight\">\r\n        <p>\r\n          Support in a generated query method specification of match conditions for attributes in different models in the \r\n          inheritance hierarchy. For example in the current release if attribute <code>name</code> is in the ancestor model and the \r\n          attribute <code>location</code> is in the descendant model a query performed from the descendant model that specifies a match \r\n          condition on both <code>name</code> and <code>location</code> (e.g., <code>find_all_by_name_and_location</code>) will raise \r\n          <code>NoMethodError</code>.      \r\n        </p>\r\n      </div>\r\n    </div>\r\n    <div class=\"highlight-wrapper\">\r\n      <div class=\"highlight\">\r\n        <p>\r\n          Support for a generated query method that will only return instances of ancestors that are ancestors of instances of the \r\n          descendant model on which the query was called \r\n          if a match condition on an ancestor model attribute is specified that also matches instances of descendant models of a \r\n          different class that have the same ancestor. \r\n          For example in the current release if attribute <code>name</code> is in the ancestor model and the ancestor \r\n          has two descendant models <code>a_descendant</code> and <code>b_descendant</code> and some instances of the two descendant \r\n          models have the same value of <code>name</code> a call to <code>ADescendat.find_all_by_name(\'Troy\')</code> will return \r\n          instances of the ancestor model that are ancestor of both <code>a_descendant</code> and <code>b_descendant</code>.\r\n        </p>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>	 \r\n',5),(23,'banner','','<h1>acts_as_aln</h1>',5),(24,'banner','','<h1>linux agent</h1>',6),(25,'body','','<h1>Project</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n    <h1>Description</h1>\r\n    <p>\r\n      <a href=\"/linux-agent\">linux agent</a> is an implementation of acts_as_aln applied to Red Hat and Debian Linux dialects. Linux Agent provides the ability to discover \r\n      system resources and configuration\r\n      and report system performance using <a href=\"http://perso.orange.fr/sebastien.godard/tutorial.html\">SYSSTAT</a>.\r\n    </p>\r\n   </div>\r\n</div>	 \r\n<div class=\"subsection-float\">\r\n  <div class=\"subsection\">\r\n    <h1>Links</h1>\r\n    <ul>\r\n    </ul>\r\n   </div>\r\n</div>	 \r\n\r\n<h1>Install</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n  </div>\r\n</div>\r\n	 \r\n<h1>Use</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n   </div>\r\n</div>   \r\n\r\n<h1>Road Map</h1>\r\n<div class=\"subsection-attached\">\r\n  <div class=\"subsection\">\r\n  </div>\r\n</div>	 \r\n',6),(26,'banner','','<h1>about</h1>',4),(27,'banner','','',2);
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
INSERT INTO `pages` VALUES (1,'projects','/','projects','Page',100,NULL,4,'2007-05-27 16:16:36','2007-09-25 23:56:23','2007-05-27 12:16:36',1,1,0,74),(2,'File Not Found','file-not-found','File Not Found','FileNotFoundPage',100,1,NULL,'2007-05-27 16:16:36','2007-06-14 00:12:47','2007-05-27 12:16:36',1,1,1,1),(3,'has_ancestor','has_ancestor','has_ancestor','Page',100,1,4,'2007-06-10 03:44:27','2007-09-25 23:55:26','2007-06-10 03:44:27',1,1,0,101),(4,'about','about','about','Page',100,1,4,'2007-06-10 03:44:40','2007-09-25 23:27:13','2007-06-10 03:52:20',1,1,0,57),(5,'acts_as_aln','acts_as_aln','acts_as_aln','Page',100,1,4,'2007-06-10 17:23:25','2007-07-11 03:11:43','2007-06-10 17:25:13',1,1,0,13),(6,'linux agent','linux-agent','linux agent','Page',100,1,4,'2007-06-11 01:26:50','2007-06-17 17:04:42','2007-06-11 01:43:05',1,1,0,7);
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
INSERT INTO `snippets` VALUES (4,'footer','','<div id=\"footer\">\r\n  <a rel=\"license\" href=\"http://creativecommons.org/licenses/by/3.0/\">\r\n  <img alt=\"Creative Commons License\" style=\"border-width:0\" src=\"http://i.creativecommons.org/l/by/3.0/88x31.png\" /></a>\r\n  <p>Licensed under a <a rel=\"license\" href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons Attribution 3.0 License</a>.</p>\r\n  <p>Powered by <a href=\"http://radiantcms.org/\">Radiant CMS</a>.</p>\r\n</div>\r\n','2007-06-03 20:30:28','2007-06-06 01:00:05',1,1,20);
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

