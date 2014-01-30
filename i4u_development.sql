-- MySQL dump 10.13  Distrib 5.6.13, for osx10.9 (x86_64)
--
-- Host: localhost    Database: i4u_development
-- ------------------------------------------------------
-- Server version	5.6.13

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
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `active_admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_admin_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` varchar(255) NOT NULL,
  `resource_type` varchar(255) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) DEFAULT NULL,
  `body` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_admin_notes_on_resource_type_and_resource_id` (`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_admin_comments`
--

LOCK TABLES `active_admin_comments` WRITE;
/*!40000 ALTER TABLE `active_admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_admin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin@insignia4u.com','$2a$10$cWSm64yz2ZMO0esiQsy56e6qm9itpvFjOQMUOTrpoz2wNBAE34jIy',NULL,NULL,NULL,56,'2013-08-26 00:36:06','2013-07-22 13:06:22','190.137.84.228','190.226.140.181','2012-11-22 15:23:36','2013-08-26 00:38:52');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `description` text,
  `summary` text,
  `content` text,
  `publication_date` date DEFAULT NULL,
  `publication_state` int(11) DEFAULT '0',
  `slug` varchar(255) DEFAULT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_articles_on_slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment_files`
--

DROP TABLE IF EXISTS `attachment_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_i4u_file_name` varchar(255) DEFAULT NULL,
  `file_i4u_content_type` varchar(255) DEFAULT NULL,
  `file_i4u_file_size` int(11) DEFAULT NULL,
  `file_i4u_updated_at` datetime DEFAULT NULL,
  `summary` text,
  `slug` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_attachment_files_on_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment_files`
--

LOCK TABLES `attachment_files` WRITE;
/*!40000 ALTER TABLE `attachment_files` DISABLE KEYS */;
INSERT INTO `attachment_files` VALUES (5,'Insignia_-_Brief_-_EN.pdf','application/pdf',2103114,'2013-01-11 17:45:46','','brief-english','Brief English','2012-12-26 20:24:20','2013-01-11 17:45:46'),(6,'Screen_Shot_2013-01-02_at_12.20.52_PM.png','image/png',28886,'2013-01-02 15:28:01','','prototipo-ticket-151-titi','Prototipo Ticket-151 titi','2013-01-02 15:28:02','2013-01-02 15:28:02');
/*!40000 ALTER TABLE `attachment_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_contents`
--

DROP TABLE IF EXISTS `featured_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `image_file_name` varchar(255) NOT NULL,
  `image_content_type` varchar(255) NOT NULL,
  `image_file_size` int(11) NOT NULL,
  `image_updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_featured_contents_on_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_contents`
--

LOCK TABLES `featured_contents` WRITE;
/*!40000 ALTER TABLE `featured_contents` DISABLE KEYS */;
INSERT INTO `featured_contents` VALUES (2,'Brief','At *Insignia* we build <strong>highly interactive web applications</strong> using <strong>agile methodologies</strong> and <strong>cutting edge technologies</strong>.\r\n\r\nWe specialize in <strong>backend development</strong> with <strong>Ruby on Rails</strong> and other web based technologies and, thanks to partnerships with different studios, we are able to carry out projects <strong>all the way</strong>, including consulting, design, and frontend development services.','macbook-tablehopping.png','image/png',85021,'2013-05-13 18:49:37','2013-05-07 19:38:26','2013-05-13 18:49:40',1,'brief'),(3,'Brief 2','We have a clear division of roles, even as our team is composed mostly by <strong>Ruby on Rails Backend Developers</strong>, we also have specialists in <strong>Front End development</strong>. Each team is lead by a <strong>Project Manager</strong> and also consist of people doing <strong>Quality Assurance</strong> of the application.','ipad.png','image/png',84501,'2013-05-08 17:18:25','2013-05-07 19:51:31','2013-05-08 17:18:29',1,'brief-2'),(4,'Brief 3','We have been working with great companies in great projects. You can get in touch with us if you want to <strong>get recommendations</strong> from our clients.','cel.png','image/png',73713,'2013-05-08 14:23:37','2013-05-08 14:23:39','2013-05-08 14:23:39',1,'brief-3'),(5,'Brief 4','We have an <strong>ISO 9001-2008</strong> certification for Quality Management Systems. That means we care about our customers and continuously improve our processes.','macbook-tablehopping.png','image/png',85021,'2013-05-13 18:49:55','2013-05-08 14:25:08','2013-05-13 18:49:59',1,'brief-4');
/*!40000 ALTER TABLE `featured_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendly_id_slugs`
--

DROP TABLE IF EXISTS `friendly_id_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendly_id_slugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `sluggable_id` int(11) NOT NULL,
  `sluggable_type` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_friendly_id_slugs_on_slug_and_sluggable_type` (`slug`,`sluggable_type`),
  KEY `index_friendly_id_slugs_on_sluggable_id` (`sluggable_id`),
  KEY `index_friendly_id_slugs_on_sluggable_type` (`sluggable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendly_id_slugs`
--

LOCK TABLES `friendly_id_slugs` WRITE;
/*!40000 ALTER TABLE `friendly_id_slugs` DISABLE KEYS */;
INSERT INTO `friendly_id_slugs` VALUES (1,'successful-projects',1,'TextSnippet','2012-11-22 19:02:31'),(2,'latest-news',2,'TextSnippet','2012-11-22 19:03:16'),(3,'contact-module',3,'TextSnippet','2012-11-22 19:03:58'),(4,'technologies',4,'TextSnippet','2012-11-22 19:06:17'),(5,'tools',5,'TextSnippet','2012-11-22 19:06:49'),(6,'contact-module--2',6,'TextSnippet','2012-11-22 19:07:12'),(7,'more-about-us',7,'TextSnippet','2012-11-22 19:08:36'),(8,'subscribe-text',8,'TextSnippet','2012-11-22 19:10:15'),(9,'subscribe-send',9,'TextSnippet','2012-11-22 19:13:11'),(10,'who-we-are',10,'TextSnippet','2012-11-22 19:22:32'),(12,'our-mission',11,'TextSnippet','2012-11-23 20:49:59'),(14,'craftfoex',2,'Project','2012-11-28 21:53:03'),(15,'area-17',3,'Project','2012-11-28 22:04:42'),(18,'main-content-service',12,'TextSnippet','2012-11-29 21:44:57'),(19,'contact-form',13,'TextSnippet','2012-11-30 14:18:08'),(20,'email-form-contact',14,'TextSnippet','2012-11-30 14:18:41'),(21,'subject-form-contact',15,'TextSnippet','2012-11-30 14:18:55'),(22,'message-form-contact',16,'TextSnippet','2012-11-30 14:19:09'),(23,'required-fields',17,'TextSnippet','2012-11-30 14:19:33'),(24,'attach-new-file',18,'TextSnippet','2012-11-30 14:19:50'),(25,'btn-send-contact-form',19,'TextSnippet','2012-11-30 14:20:09'),(26,'name-form-contact',20,'TextSnippet','2012-11-30 14:30:48'),(27,'location',21,'TextSnippet','2012-11-30 14:49:12'),(28,'job-form-content',22,'TextSnippet','2012-11-30 15:03:42'),(29,'name-job-form',23,'TextSnippet','2012-11-30 15:04:06'),(30,'email-job-form',24,'TextSnippet','2012-11-30 15:04:24'),(31,'message-job-form',25,'TextSnippet','2012-11-30 15:04:46'),(32,'attach-cv',26,'TextSnippet','2012-11-30 15:05:20'),(33,'btn-send-job-form',27,'TextSnippet','2012-11-30 15:05:56'),(34,'highlighted-projects',28,'TextSnippet','2012-11-30 15:10:46'),(35,'more-works-pc-version',29,'TextSnippet','2012-11-30 15:11:08'),(36,'recent-jobs-pc-version',30,'TextSnippet','2012-11-30 15:11:29'),(37,'full-list-of-workds',31,'TextSnippet','2012-11-30 15:11:49'),(38,'full-list-of-works',31,'TextSnippet','2012-11-30 15:13:08'),(39,'more-info',32,'TextSnippet','2012-11-30 15:13:51'),(40,'craftfoxes',2,'Project','2012-12-02 20:32:19'),(41,'our-quality-policy',33,'TextSnippet','2012-12-03 23:32:18'),(42,'our-vision',34,'TextSnippet','2012-12-03 23:35:15'),(43,'our-values',35,'TextSnippet','2012-12-03 23:35:39'),(44,'technology-list-header',36,'TextSnippet','2012-12-04 15:56:07'),(45,'tool-list-header',37,'TextSnippet','2012-12-04 15:56:25'),(46,'los-tanfaun',6,'Project','2012-12-04 19:42:05'),(47,'subscribe',38,'TextSnippet','2012-12-04 22:12:40'),(48,'our-services-title',39,'TextSnippet','2012-12-04 22:21:11'),(49,'first-side-bar-content-services-page',40,'TextSnippet','2012-12-04 22:25:23'),(50,'second-side-bar-content-services-page',41,'TextSnippet','2012-12-04 22:26:21'),(51,'first-side-bar-content-services-page--2',42,'TextSnippet','2012-12-04 22:27:16'),(54,'our-process',43,'TextSnippet','2012-12-10 22:03:42'),(63,'us',50,'TextSnippet','2012-12-11 19:52:09'),(64,'duration-project-header',51,'TextSnippet','2012-12-12 19:42:42'),(65,'table-hopping-ny',7,'Project','2012-12-19 19:45:50'),(66,'to-separator-project-duration',52,'TextSnippet','2012-12-19 19:52:48'),(67,'brief-english',5,'AttachmentFile','2012-12-26 20:24:22'),(68,'prototipo-ticket-151-titi',6,'AttachmentFile','2013-01-02 15:28:04'),(69,'contact-details',53,'TextSnippet','2013-01-30 15:54:51'),(70,'clean-tech-open',8,'Project','2013-01-30 16:32:41'),(71,'blanet',9,'Project','2013-01-30 19:05:50'),(72,'introduction-header',54,'TextSnippet','2013-05-07 19:29:40'),(73,'brief',2,'FeaturedContent','2013-05-07 19:38:27'),(74,'brief-2',3,'FeaturedContent','2013-05-07 19:51:33'),(75,'our-quality-policy-list',55,'TextSnippet','2013-05-07 19:56:08'),(76,'our-quality-policy-list--2',56,'TextSnippet','2013-05-07 19:56:29'),(77,'planificacion-process-snippet',44,'TextSnippet','2013-05-07 19:59:12'),(79,'codificacion-process-snippet',45,'TextSnippet','2013-05-07 20:00:30'),(81,'revision-process-snippet',46,'TextSnippet','2013-05-07 20:03:07'),(82,'control-process-snippet',47,'TextSnippet','2013-05-07 20:07:45'),(83,'produccion-process-snippet',48,'TextSnippet','2013-05-07 20:08:20'),(84,'mantenimiento-process-snippet',49,'TextSnippet','2013-05-07 20:08:47'),(85,'how-do-we-do-it',59,'TextSnippet','2013-05-07 20:12:26'),(87,'our-offering',61,'TextSnippet','2013-05-07 20:13:18'),(94,'mantenimiento-text-snippet--3',49,'TextSnippet','2013-05-08 12:39:15'),(95,'produccion-text-snippet--3',48,'TextSnippet','2013-05-08 12:39:50'),(96,'control-text-snippet--3',47,'TextSnippet','2013-05-08 12:41:00'),(97,'revision-text-snippet--3',46,'TextSnippet','2013-05-08 12:41:41'),(98,'planificacion-text-snippet--3',44,'TextSnippet','2013-05-08 12:43:13'),(99,'codificacion-text-snippet--3',45,'TextSnippet','2013-05-08 12:45:07'),(100,'mantenimiento-text-snippet',49,'TextSnippet','2013-05-08 12:57:05'),(101,'produccion-text-snippet',48,'TextSnippet','2013-05-08 12:57:58'),(102,'control-text-snippet',47,'TextSnippet','2013-05-08 12:59:05'),(103,'codificacion-text-snippet',45,'TextSnippet','2013-05-08 13:01:12'),(104,'planificacion-text-snippet',44,'TextSnippet','2013-05-08 13:01:46'),(105,'planificacion-process-snippet--2',66,'TextSnippet','2013-05-08 13:33:47'),(106,'codificacion-process-snippet--2',67,'TextSnippet','2013-05-08 13:35:04'),(107,'revision-process-snippet--2',68,'TextSnippet','2013-05-08 13:35:32'),(108,'control-process-snippet--2',69,'TextSnippet','2013-05-08 13:36:21'),(109,'produccion-process-snippet--2',70,'TextSnippet','2013-05-08 13:37:03'),(110,'mantenimiento-process-snippet--2',71,'TextSnippet','2013-05-08 13:37:42'),(113,'revision-text-snippet',46,'TextSnippet','2013-05-08 13:44:40'),(116,'brief-3',4,'FeaturedContent','2013-05-08 14:23:41'),(117,'brief-4',5,'FeaturedContent','2013-05-08 14:25:08');
/*!40000 ALTER TABLE `friendly_id_slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_subscribers`
--

DROP TABLE IF EXISTS `newsletter_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `on_mail_chimp_list` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_newsletter_subscribers_on_email` (`email`),
  KEY `index_newsletter_subscribers_on_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscribers`
--

LOCK TABLES `newsletter_subscribers` WRITE;
/*!40000 ALTER TABLE `newsletter_subscribers` DISABLE KEYS */;
INSERT INTO `newsletter_subscribers` VALUES (1,'augusto@insignia4u.com','2012-12-03 16:11:07','2013-02-06 18:43:24',1),(2,'ckozus@gmail.com','2012-12-03 20:20:17','2012-12-03 20:20:17',0),(3,'ckozus+nuevo@gmail.com','2012-12-05 01:29:59','2012-12-05 01:29:59',0),(4,'augusto@insignia4u.com.ar','2012-12-06 15:46:44','2013-02-06 18:43:14',1),(5,'carlos@insignia4u.com','2012-12-17 21:40:08','2012-12-17 21:40:08',0),(6,'tom@fxginteractive.com','2012-12-18 08:36:37','2012-12-18 08:36:37',0),(7,'ckozus+pruebanews@gmail.com','2012-12-20 15:25:31','2012-12-20 15:25:31',0),(8,'ckozus+nuevotest@insignia4u.com','2012-12-21 17:23:35','2012-12-21 17:23:35',0),(9,'ckozus+posta@gmail.com','2012-12-21 17:24:23','2012-12-21 17:24:23',0),(10,'a@a.com','2012-12-22 15:22:04','2012-12-22 15:22:04',0),(11,'b@a.com','2012-12-22 15:22:21','2012-12-22 15:22:21',0),(12,'ckozus+test2@gmail.com','2012-12-23 17:06:37','2012-12-23 17:06:37',0),(13,'carlos+ipadtest@insignia4u.com','2012-12-26 15:12:01','2012-12-26 15:12:01',0),(14,'tomshack@gmail.com','2013-01-17 16:26:55','2013-01-17 16:26:55',0),(15,'augusto@insigia4u.com','2013-02-06 18:42:04','2013-02-06 18:42:04',1),(16,'augusto+23@insignia4u.com','2013-02-06 18:42:31','2013-02-06 18:42:31',1),(17,'stbn@crowdint.com','2013-03-11 17:20:43','2013-03-11 17:20:43',1),(18,'ckozus+otraprueba@gmail.com','2013-03-12 18:51:24','2013-03-12 18:51:24',1),(19,'malware89@gmail.com','2013-03-12 18:51:58','2013-03-12 18:51:58',1),(20,'diegoflores1991@gmail.com','2013-05-14 15:14:20','2013-05-14 15:14:20',1),(21,'gshgaston@hotmail.com','2013-05-22 16:38:39','2013-05-22 16:38:39',1),(22,'gastonsobrevilla@gmail.com','2013-05-28 02:03:04','2013-05-28 02:03:04',1),(23,'estebanedcm@gmail.com','2013-06-04 23:29:25','2013-06-04 23:29:25',1),(24,'fmaimale@gmail.com','2013-06-05 01:03:25','2013-06-05 01:03:25',1),(25,'simonaltamiranda@gmail.com','2013-06-05 12:43:47','2013-06-05 12:43:47',1),(58,'mark@uidigital.com','2013-07-02 08:08:04','2013-07-02 08:08:04',1),(59,'scott@westarete.com','2013-07-02 20:25:34','2013-07-02 20:25:34',1),(60,'halcollins@acrobatant.com','2013-07-02 21:26:34','2013-07-02 21:26:34',1),(61,'anton@gunpowderlabs.com','2013-08-12 23:19:58','2013-08-12 23:19:58',1),(62,'pcarlosb@yahoo.com.ar','2013-12-04 12:34:22','2013-12-04 12:34:22',1);
/*!40000 ALTER TABLE `newsletter_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `bio` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_people_on_site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,1,'Carlos','Kozuszko','Managing Partner.','2012-11-27 20:29:44','2013-01-11 15:40:44','09_original.jpg','image/jpeg',1680642,'2013-01-11 15:40:43',1,'Managing Partner'),(2,1,'Juan','Roldan','Ruby on Rails development. Javascript and front-end frameworks for mobile development.','2012-11-30 16:00:23','2013-07-22 13:07:04','02_original.jpg','image/jpeg',5198,'2013-01-11 15:45:29',7,'Back-end Developer'),(4,1,'Rafael','Lizardo Celiz','Ruby on Rails development.','2012-11-30 16:03:58','2013-07-22 13:07:04','04_original.jpg','image/jpeg',4643,'2013-01-11 15:43:32',6,'Back-end Developer'),(5,1,'Fernanda','Rodriguez','Finances and operations.','2012-11-30 16:04:44','2013-01-11 15:42:36','05_original.jpg','image/jpeg',4751,'2013-01-11 15:42:36',5,'Finances'),(7,1,'Diego','Paz','Front-end development.','2012-11-30 16:05:49','2013-07-22 13:07:04','07.jpg','image/jpeg',4570,'2012-11-30 16:05:49',9,'Front-end Developer'),(8,1,'Jose','Marrone','Ruby on Rails development.','2012-11-30 16:06:51','2013-07-22 13:07:04','10.jpg','image/jpeg',4920,'2012-11-30 16:06:51',8,'Back-end Developer'),(10,1,'Juan Maria','Martinez Arce','Managing Partner','2012-11-30 16:08:39','2012-12-03 22:21:54','12.jpg','image/jpeg',4995,'2012-11-30 16:08:38',2,'Managing Partner'),(11,1,'Pablo','Barrios','CTO / Ruby on Rails development','2012-11-30 16:09:09','2013-08-26 00:38:05','13.jpg','image/jpeg',4680,'2012-11-30 16:09:09',3,'CTO Partner'),(12,1,'Magdalena','Sanz','Project Management. ','2012-11-30 16:09:41','2013-07-22 13:07:07','15.jpg','image/jpeg',4898,'2012-11-30 16:09:40',4,'Project Manager'),(14,1,'Emanuel','Alarcón','Ruby on Rails development.','2012-11-30 16:14:06','2013-07-22 13:07:04','empty_profile.jpg','image/jpeg',1941,'2012-11-30 16:14:06',10,'Back-end Developer'),(17,1,'Daniel','Dominguez','.','2013-04-12 17:51:46','2013-07-22 13:07:04','empty-profile.jpg','image/jpeg',1941,'2013-04-12 17:51:46',11,'Ruby on Rails Developement'),(18,1,'Ezequiel','Rivadeneira Lichardi','Front-end development.','2013-05-28 15:43:42','2013-07-22 13:07:04','empty-profile.jpg','image/jpeg',1941,'2013-05-28 15:43:41',12,'Front-end Developer'),(19,1,'Adrián','Turbay','Front-end development and Graphic Design.','2013-05-28 15:44:44','2013-07-22 13:07:04','empty-profile.jpg','image/jpeg',1941,'2013-05-28 15:44:44',13,'Front-end Developer');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_images`
--

DROP TABLE IF EXISTS `project_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `description` text,
  `project_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_images_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_images`
--

LOCK TABLES `project_images` WRITE;
/*!40000 ALTER TABLE `project_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_technologies`
--

DROP TABLE IF EXISTS `project_technologies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_technologies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `technology_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_technologies_on_project_id` (`project_id`),
  KEY `index_project_technologies_on_technology_id` (`technology_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_technologies`
--

LOCK TABLES `project_technologies` WRITE;
/*!40000 ALTER TABLE `project_technologies` DISABLE KEYS */;
INSERT INTO `project_technologies` VALUES (3,2,3,'2012-12-02 20:32:19','2012-12-02 20:32:19'),(4,2,1,'2012-12-02 20:32:19','2012-12-02 20:32:19'),(5,3,2,'2012-12-04 15:58:42','2012-12-04 15:58:42'),(6,3,1,'2012-12-04 15:58:42','2012-12-04 15:58:42'),(7,6,1,'2012-12-04 19:42:03','2012-12-04 19:42:03'),(8,6,5,'2012-12-04 19:42:03','2012-12-04 19:42:03'),(9,7,3,'2012-12-19 19:45:46','2012-12-19 19:45:46'),(10,7,1,'2012-12-19 19:45:46','2012-12-19 19:45:46'),(11,8,3,'2013-01-30 16:32:40','2013-01-30 16:32:40'),(12,8,1,'2013-01-30 16:32:40','2013-01-30 16:32:40'),(13,9,3,'2013-01-30 19:05:49','2013-01-30 19:05:49'),(14,9,1,'2013-01-30 19:05:49','2013-01-30 19:05:49');
/*!40000 ALTER TABLE `project_technologies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_tools`
--

DROP TABLE IF EXISTS `project_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_tools_on_project_id` (`project_id`),
  KEY `index_project_tools_on_tool_id` (`tool_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_tools`
--

LOCK TABLES `project_tools` WRITE;
/*!40000 ALTER TABLE `project_tools` DISABLE KEYS */;
INSERT INTO `project_tools` VALUES (4,2,3,'2012-12-02 20:32:19','2012-12-02 20:32:19'),(5,2,2,'2012-12-02 20:32:19','2012-12-02 20:32:19'),(6,2,1,'2012-12-02 20:32:19','2012-12-02 20:32:19'),(7,3,3,'2012-12-04 15:58:53','2012-12-04 15:58:53'),(8,3,2,'2012-12-04 15:58:53','2012-12-04 15:58:53'),(9,3,1,'2012-12-04 15:58:53','2012-12-04 15:58:53'),(10,6,2,'2012-12-04 19:42:03','2012-12-04 19:42:03'),(11,6,1,'2012-12-04 19:42:03','2012-12-04 19:42:03'),(12,7,3,'2012-12-19 19:45:46','2012-12-19 19:45:46'),(13,7,2,'2012-12-19 19:45:46','2012-12-19 19:45:46'),(14,7,1,'2012-12-19 19:45:46','2012-12-19 19:45:46'),(15,8,3,'2013-01-30 16:32:40','2013-01-30 16:32:40'),(16,8,2,'2013-01-30 16:32:40','2013-01-30 16:32:40'),(17,8,1,'2013-01-30 16:32:40','2013-01-30 16:32:40'),(18,9,3,'2013-01-30 19:05:49','2013-01-30 19:05:49'),(19,9,2,'2013-01-30 19:05:49','2013-01-30 19:05:49'),(20,9,1,'2013-01-30 19:05:49','2013-01-30 19:05:49'),(21,9,4,'2013-01-30 19:05:49','2013-01-30 19:05:49');
/*!40000 ALTER TABLE `project_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` text,
  `description` text,
  `extended_description` text,
  `url` varchar(255) DEFAULT NULL,
  `started_at` date DEFAULT NULL,
  `ended_at` date DEFAULT NULL,
  `highlighted` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `featured_image_file_name` varchar(255) DEFAULT NULL,
  `featured_image_content_type` varchar(255) DEFAULT NULL,
  `featured_image_file_size` int(11) DEFAULT NULL,
  `featured_image_updated_at` datetime DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_projects_on_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (2,1,'CraftFoxes','A awesome social network and marketplace for crafty people who love paper projects, vintage finds, home decor & more!','A social network and marketplace for crafty people who love knitting, scrapbooking, paper projects, baking, jewelry, sewing, vintage finds, home decor & more!”\r\n\r\n* Frontend and Backend development with Ruby on Rails\r\n\r\n* Social Network integrated with Google Maps API\r\n\r\n* Built for American Overloaded Inc.','Craftfoxes.com is a social network aimed to connect those who wish to show and share their handicrafts, helping others to reproduce them through detailed project instructions, tutorials and image galleries.\r\n\r\nIn addition to project management and QA process, Insignia built all the application functionalities and the frontend integration of the site.\r\n\r\nCraftfoxes was developed with Rails 3, and it has been recently upgraded to Rails 3.2.5. The code has been properly tested with Rspec framework. All the data-intensive features were built using Redis and the search engine was implemented on Sphinx.\r\n\r\nCraftfoxes\' frontend work produced valid HTML/CSS code fully compatible with top used browsers, including IE6. The frontend work was delivered by A:BRA, one of our business partners.','http://www.craftfoxes.com/',NULL,NULL,1,'2012-11-28 21:53:03','2013-05-08 17:58:34','craftfoxes.jpg','image/jpeg',90172,'2013-05-08 17:58:26','craftfoxes.jpg','image/jpeg',90172,'2013-05-08 17:58:32','craftfoxes'),(3,1,'Area 17','We currently offer backend development services to AREA17 using Ruby on Rails.','We have a long term relationship with AREA17 providing them with backend development services for most of their Ruby on Rails projects.  For more than 5 year we have worked together developing successfull projects.','What the customer wanted?\r\n-------------------------------------\r\n\r\nAREA 17 needed a team of developers to manage their Ruby on Rails projects.\r\n\r\nHow did we handle the project?\r\n-------------------------------------------\r\n\r\nWe satisfied such requirement with our development team. Almost all of our staff has been part one way or another in AREA 17’s projects, either developing applications from scratch or constantly working on retainer contracts with them.\r\n\r\nWhich tools did we use?\r\n---------------------------------\r\n\r\nAs a backend development team we developed these projects for AREA 17: BurdaStyle.com, VBS.tv, motherboard.tv and The Creators Project.\r\nBurdastyle is a social network for sewing lovers that has more than 500.000 active members.\r\nVBS is an online broadcast network that streams free original content 24 hours a day.\r\nMotherboard.TV is an online video network and community focused on the exploration of the nature and culture of technology, as viewed through the lenses of curated editorial content, community, and dialogue.\r\nWe also are doing backend maintenance work on Design 21 and are currently working on a couple of new projects using Ruby on Rails.\r\n\r\nThe outcome\r\n------------------\r\n\r\nWe have a long term business relationship with AREA 17, being them one of our dearest clients.\r\n','http://www.area17.com/',NULL,NULL,1,'2012-11-28 22:04:41','2013-05-08 17:59:11','area17.jpg','image/jpeg',41263,'2013-05-08 17:59:08','area17.jpg','image/jpeg',41263,'2013-05-08 17:59:10','area-17'),(6,1,'Los Tanfaun','Los Tanfaun is a lost and found application to connect people in Buenos Aires city.\r\n','Los Tanfaun is a lost and found application to connect people in Buenos Aires city. The main objective is to provide a community platform to help people recovering their belongings. It was originally developed for the \"Buenos Aires Apps contest\":http://concursos.buenosaires.gob.ar/buenos-aires-apps/los-tanfaun/, using the Interactive Map API 2.3, which is a geographic information system very similar to Google Maps. Using the map users are able to locate the object they have lost or want to return.','This project was a joint effort between Insignia and the interactive design studio \"Indicius\":http://indicius.com. We contributed with the complete backend development and helped with some javascript implementations, while they privided the whole branding, graphic design and digital video creation.','http://www.lostanfaun.com.ar','2012-10-01',NULL,0,'2012-12-04 19:42:03','2013-05-08 17:59:38','lostanfaun.jpg','image/jpeg',33532,'2013-05-08 17:59:36','lostanfaun.jpg','image/jpeg',33532,'2013-05-08 17:59:37','los-tanfaun'),(7,1,'Table Hopping NY','TableHoppingNY is a community around gourmet events in New York City.','TableHoppingNY is NYC\'s culinary life served to you on a platter! It\'s a community around gourmet events in New York City.','TableHoppingNY is the app that solves the classic New York dining dilemmas:\r\n\r\n* What’s a good Happy Hour in Soho?\r\n* I always walk by that place, but can’t remember the name.\r\n* What’s going on in the city this week?\r\n* What are some cool new places to try?\r\n* What was the name of that great place we went to last month?\r\n\r\nTableHoppingNY is currently a community around gourmet events in New York City.  \r\n\r\nThe app allows the user to interact and to discover all the gourmet happenings in the city,  new places, meet new people, and dine out with friends.\r\n\r\nIn this project we developed the whole backend for the application using Ruby on Rails 3.2, specs were written using RSpec and using Spec Requests.\r\n\r\nWe have also done the front end implementation converting the designs to its equivalent HTML+CSS and the whole Javascript implementation.','http://www.tablehoppingny.com/','2012-01-16','2012-12-17',1,'2012-12-19 19:45:46','2013-05-13 18:50:53','Screenshot_from_2013-05-13_15_44_50.png','image/png',453499,'2013-05-13 18:50:49','tablehoppingny.jpg','image/jpeg',39827,'2013-05-08 18:00:08','table-hopping-ny'),(8,1,'Clean Tech Open','We collaborate with Cleantech Open doing Ruby on Rails development to mantain and improve their web platform.','We collaborate with Cleantech Open doing Ruby on Rails development to mantain and improve their web platform.','The mission of the Cleantech Open is to find, fund and foster entrepreneurs with big ideas that address today’s most urgent energy, environmental and economic challenges. We collaborate with them maintaining their web platform and developing new features as they require it. We\'re currently mantaining an existing application using the Ruby KISS Framework and developing new features with the latest Ruby on Rails 3.2 version.','http://www.cleantechopen.com/','2013-01-29',NULL,0,'2013-01-30 16:32:40','2013-06-07 14:38:49','cleantechopen_medium.jpg','image/jpeg',47151,'2013-06-07 14:38:45','cleantechopen.jpg','image/jpeg',64130,'2013-06-07 14:38:48','clean-tech-open'),(9,1,'Blanet','Blanet is a service for spanish speaking kids to learn english online.','Blanet is a service for spanish speaking kids to learn english online. It\'s a Ruby on Rails platform featuring online classes and interactive html5 games for students.','Our participation in this project included the original design of the application, all the front-end (HTML, CSS and Javascript) and backend development using the Ruby on Rails framework.\r\n\r\nTwo HTML5 interactive games were also developed aiming mobile tablet devices.','http://www.blanet.com',NULL,NULL,0,'2013-01-30 19:05:49','2013-06-07 14:34:44','blanet_medium.jpg','image/jpeg',59301,'2013-06-07 14:34:41','blanet.jpg','image/jpeg',79745,'2013-06-07 14:34:43','blanet');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120612233404'),('20120612233405'),('20120613023400'),('20120613024938'),('20120613040617'),('20120613144827'),('20120613150940'),('20120613153944'),('20120613184659'),('20120613184746'),('20120614133931'),('20120614150255'),('20120614173856'),('20120614181232'),('20120614181647'),('20120619142121'),('20120619142212'),('20120622180817'),('20120625151033'),('20120625152951'),('20121116135452'),('20121116202246'),('20121121125210'),('20121128141711'),('20121128193138'),('20121130183055'),('20121203185225'),('20121205150232'),('20121210132515'),('20121210150919'),('20130205110932'),('20130426135921'),('20130426143659'),('20130429143523'),('20130509165154'),('20130510122249'),('20130510144637');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `summary` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_services_on_site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,1,'Our services','Agile Web Development with Ruby on Rails. No hassle, no bureaucracy, we create high quality code.The maintainability and quality assurance are our primary goals in every software project.\r\nWe use Behavior Driven Development to deliver 100% tested results.\r\nWe firmly believe in the benefits the agile methodologies can have in a software project, that’s why we try to implement these practices in all our projects.\r\nAlso we love integrating third party API’s to create 2.0 web applications, and of course development of facebook apps too.\r\n\r\nh3. Our Services.\r\n\r\nINSIGNIA’s offering is founded upon a solid, professional and interdisciplinary team of really passionate web developers. We’re proud to say our firm has a world class development team which is able to face any challenge your business might need, from handling new projects as well and maintaining existing ones to scaling high-traffic sites into cloud-based hosting system.\r\nOur interdisciplinary team allows us to cover a wide range of projects due to our variety of skills that complement each other. For more information about this you can take a look at our Staff.\r\n\r\nh3.Highly Interactive Sites Development.\r\n\r\nWe’ve got the necessary resources and the experience to take your idea, shape it, and enhance it to produce a professional web site based on the most advanced technologies.\r\nWe’re specialized in the agile development of highly interactive sites built on Ruby on Rails, properly tested with Cucumber and Rspec and supported with cutting-edge technologies.\r\n\r\nh3. Retainer Programs for Ruby on Rails based Applications.\r\n\r\nWe can keep your site live running in a stable and upgraded way. We can give you a quick response to any critical bug that might prevent an application’s proper performance.\r\nIf time allows it, we can also face small projects to add new functionalities and enhancements your site might need.\r\n\r\nh3. Code Reviews.\r\n\r\nSource code can always be improved. We evaluate your application’s source code to ensure that it’s following most used standars and best practices. Our goal is to keep the application running but with a cleaner, more readable and more scalable code.\r\n\r\nh3. Scalling Highly-traffic Sites.\r\n\r\nScalling a highly-traffic site could be a monumental task when you don’t know the road you need to follow for sure. We’re specialized in consulting and managing these transitions in a simple and smooth way. We take care of the process all the way, from needed optimizations to the complete system migration to a cloud-based hosting system.','2012-11-29 21:43:57','2012-11-29 21:43:57','Screen_Shot_2012-11-29_at_6.29.26_PM.png','image/png',254449,'2012-11-29 21:43:56');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_sections`
--

DROP TABLE IF EXISTS `site_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_site_sections_on_slug` (`slug`),
  KEY `index_site_sections_on_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_sections`
--

LOCK TABLES `site_sections` WRITE;
/*!40000 ALTER TABLE `site_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `live` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'English Site','EN',0,'2012-11-22 15:23:36','2012-11-22 15:23:36'),(2,'Spanish Site','ES',0,'2012-11-22 15:23:36','2012-11-22 15:23:36');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technologies`
--

DROP TABLE IF EXISTS `technologies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technologies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technologies`
--

LOCK TABLES `technologies` WRITE;
/*!40000 ALTER TABLE `technologies` DISABLE KEYS */;
INSERT INTO `technologies` VALUES (1,'Ruby on Rails','2012-11-23 20:51:14','2012-11-29 23:31:16',3,NULL),(2,'PHP','2012-11-23 21:03:27','2012-12-04 19:38:21',1,NULL),(3,'Front-end development: HTML. CSS and Javascript','2012-11-23 21:06:16','2012-11-29 23:31:16',2,NULL),(4,'Mobile applications development for iOS and Android platforms','2012-11-23 21:07:05','2012-11-29 23:31:16',4,NULL),(5,'Javascript Front-end Frameworks','2012-12-04 19:38:40','2012-12-04 19:39:53',5,NULL),(6,'Javascript Front-end Backbone.js','2012-12-04 19:39:14','2012-12-04 19:39:14',6,NULL),(7,'Javascript Front-end Ember.js','2012-12-04 19:39:33','2012-12-04 19:39:33',7,NULL);
/*!40000 ALTER TABLE `technologies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_snippets`
--

DROP TABLE IF EXISTS `text_snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_snippets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_text_snippets_on_slug` (`slug`),
  KEY `index_text_snippets_on_site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_snippets`
--

LOCK TABLES `text_snippets` WRITE;
/*!40000 ALTER TABLE `text_snippets` DISABLE KEYS */;
INSERT INTO `text_snippets` VALUES (1,1,'SUCCESSFUL-PROJECTS','SUCCESSFUL PROJECTS','','successful-projects','2012-11-22 19:02:31','2012-11-22 19:02:31',NULL,NULL,NULL,NULL),(2,1,'LATEST-NEWS','FROM THE BLOG','','latest-news','2012-11-22 19:03:16','2012-11-22 19:03:16',NULL,NULL,NULL,NULL),(3,1,'CONTACT-MODULE','Contact Info','Lamadrid 318, Piso 4 Dpto A\r\n\r\nSan Miguel de Tucumán\r\n\r\nTucumán, Argentina\r\n\r\n&nbsp;\r\n\r\nT: +54 (381) 420-7387\r\n\r\nM: \"info@insignia4u.com\":mailto:info@insignia4u.com\r\n','contact-module','2012-11-22 19:03:58','2013-01-30 15:57:22',NULL,NULL,NULL,NULL),(4,1,'TECHNOLOGIES','TECHNOLOGIES','','technologies','2012-11-22 19:06:17','2012-11-22 19:06:17',NULL,NULL,NULL,NULL),(5,1,'TOOLS','TOOLS','','tools','2012-11-22 19:06:49','2012-11-22 19:06:49',NULL,NULL,NULL,NULL),(6,1,'CONTACT-MODULE','CONTACT US','','contact-module--2','2012-11-22 19:07:12','2012-11-22 19:07:46',NULL,NULL,NULL,NULL),(7,1,'MORE-ABOUT-US','MORE ABOUT INSIGNIA','','more-about-us','2012-11-22 19:08:36','2012-11-22 19:09:24',NULL,NULL,NULL,NULL),(8,1,'subscribe-text','Subscribe to our Newsletter and frequent updates about our company in your inbox.','','subscribe-text','2012-11-22 19:10:15','2012-12-04 22:05:52',NULL,NULL,NULL,NULL),(9,1,'subscribe-send','Subscribe me','','subscribe-send','2012-11-22 19:13:11','2012-11-22 19:19:52',NULL,NULL,NULL,NULL),(10,1,'WHO-WE-ARE','WHO WE ARE','During the last 5 years, we have successfully faced the challenge of developing highly-traffic sites, gaining experience in merging 3rd party APIs, such as Google Maps, Facebook, Twitter, as well as dealing with different payment gateways and cloud based hosting services. For further details, please consult our portfolio.\r\n\r\nAiming to satisfy our worldwide foreign clients’ needs, not only do we provide with a world class team of developers, but also with a specialized and very efficient project management  and time tracking, to which our clients have access. \r\n\r\nIt is also worth mentioning that our geographical position, hence our time zone, facilitates coordinated work with our foreign clients, especially those from the US and Europe. Our experience with Area 17, an interactive design agency with headquarters in New York and Paris, stands as a clear example of our offshore competitiveness.\r\n\r\nWe are always open and eager to face new challenges. We\'d love to learn more about your projects and to be part of them. ','who-we-are','2012-11-22 19:22:32','2012-12-11 20:00:50',NULL,NULL,NULL,NULL),(11,1,'OUR-MISSION','Our Mission','Provide our clients with software solutions based on the Internet, to allow them to be at the cutting edge and get a decisive competitive advantage in the market.','our-mission','2012-11-23 20:49:59','2012-12-12 19:43:22',NULL,NULL,NULL,NULL),(12,1,'main-content-service','','h5. Highly Interactive Sites Development.\r\n\r\nWe’ve got the necessary resources and the experience to take your idea, shape it, and enhance it to produce a professional web site based on the most advanced technologies.\r\nWe’re specialized in the agile development of highly interactive sites built on Ruby on Rails, properly tested with Cucumber and Rspec and supported with cutting-edge technologies.\r\n\r\nh5. Scaling High-traffic Sites.\r\n\r\nScalling a highly-traffic site could be a monumental task when you don’t know the road you need to follow for sure. We’re specialized in consulting and managing these transitions in a simple and smooth way. We take care of the process all the way, from needed optimizations to the complete system migration to a cloud-based hosting system.\r\n\r\nh5. Retainer Programs for Ruby on Rails based Applications.\r\n\r\nWe can keep your site live running in a stable and upgraded way. We can give you a quick response to any critical bug that might prevent an application’s proper performance.\r\nIf time allows it, we can also face small projects to add new functionalities and enhancements your site might need.\r\n\r\nh5. Code Reviews.\r\n\r\nSource code can always be improved. We evaluate your application’s source code to ensure that it’s following most used standars and best practices. Our goal is to keep the application running but with a cleaner, more readable and more scalable code.\r\n\r\nh5. Back-end Development:\r\n\r\nWe’ve got the necessary resources and the experience to take your idea, shape it, and enhance it to produce a professional web site based on the most advanced technologies.\r\n\r\nh5. Front-end Development:\r\n\r\nWe take care of implementing a graphic development in clean HTML5+CSS3. We always focus on code quality, offer a validated deliverable and compatible with the major web browsers according to web standards.\r\n\r\nh5. Mobile development\r\n\r\nWe develop mobile web applications using the most advanced mobile technologies: HTML5, CSS3 and Javascript Front-end Frameworks.','main-content-service','2012-11-29 21:44:57','2012-12-20 00:06:04',NULL,NULL,NULL,NULL),(13,1,'contact-form','Contact','','contact-form','2012-11-30 14:18:08','2012-11-30 15:00:48',NULL,NULL,NULL,NULL),(14,1,'email-form-contact','Email<sup>*</sup>','','email-form-contact','2012-11-30 14:18:41','2012-11-30 14:35:46',NULL,NULL,NULL,NULL),(15,1,'subject-form-contact','Subject<sup>*</sup>','','subject-form-contact','2012-11-30 14:18:55','2012-11-30 14:35:56',NULL,NULL,NULL,NULL),(16,1,'message-form-contact','Coments<sup>*</sup>','','message-form-contact','2012-11-30 14:19:09','2012-11-30 14:36:40',NULL,NULL,NULL,NULL),(17,1,'required-fields','Required fields<sup>*</sup>','','required-fields','2012-11-30 14:19:33','2012-11-30 14:35:06',NULL,NULL,NULL,NULL),(18,1,'attach-new-file','Attach new file','','attach-new-file','2012-11-30 14:19:50','2012-11-30 14:19:50',NULL,NULL,NULL,NULL),(19,1,'btn-send-contact-form','Contact Us','','btn-send-contact-form','2012-11-30 14:20:09','2012-11-30 14:25:25',NULL,NULL,NULL,NULL),(20,1,'name-form-contact','Name<sup>*</sup>','','name-form-contact','2012-11-30 14:30:48','2012-11-30 14:33:33',NULL,NULL,NULL,NULL),(21,1,'location','Location','','location','2012-11-30 14:49:12','2012-11-30 14:49:12',NULL,NULL,NULL,NULL),(22,1,'JOB-FORM-CONTENT','Job',',,,','job-form-content','2012-11-30 15:03:42','2012-11-30 15:03:42',NULL,NULL,NULL,NULL),(23,1,'name-job-form','Name<sup>*</sup>','','name-job-form','2012-11-30 15:04:06','2012-11-30 15:04:06',NULL,NULL,NULL,NULL),(24,1,'email-job-form','Email<sup>*</sup>','','email-job-form','2012-11-30 15:04:24','2012-11-30 15:04:24',NULL,NULL,NULL,NULL),(25,1,'message-job-form','Coments<sup>*</sup>','','message-job-form','2012-11-30 15:04:46','2012-11-30 15:04:46',NULL,NULL,NULL,NULL),(26,1,'attach-cv','Attach CV','','attach-cv','2012-11-30 15:05:20','2012-11-30 15:05:20',NULL,NULL,NULL,NULL),(27,1,'btn-send-job-form','Send CV','','btn-send-job-form','2012-11-30 15:05:56','2012-11-30 15:05:56',NULL,NULL,NULL,NULL),(28,1,'HIGHLIGHTED-PROJECTS','Highlighted projects','','highlighted-projects','2012-11-30 15:10:46','2012-11-30 15:10:46',NULL,NULL,NULL,NULL),(29,1,'MORE-WORKS-PC-VERSION','More works','...','more-works-pc-version','2012-11-30 15:11:08','2012-11-30 15:12:17',NULL,NULL,NULL,NULL),(30,1,'RECENT-JOBS-PC-VERSION','Lastest Jobs','','recent-jobs-pc-version','2012-11-30 15:11:29','2012-12-03 23:48:13',NULL,NULL,NULL,NULL),(31,1,'Full-List-of-works','Full list of works','','full-list-of-works','2012-11-30 15:11:49','2012-11-30 15:13:08',NULL,NULL,NULL,NULL),(32,1,'more-info','More info','','more-info','2012-11-30 15:13:51','2012-11-30 15:13:51',NULL,NULL,NULL,NULL),(33,1,'OUR-QUALITY-POLICY','Our Quality Policy','<p>We have a strong commitment to completely fulfill the  requirements and expectations of our clients in the web app  they\'re requesting, using agile metodologies as a guide in our  sofftware development process. Out strategy pursues the  continuous improvement of our Quality Management System,  whose pilars are planning, execution, verification and act  according the results, in every process until finishing the  development of the app. As a work team we base our actions in  the following principles: </p>','our-quality-policy','2012-12-03 23:32:18','2013-05-07 19:55:26',NULL,NULL,NULL,NULL),(34,1,'OUR-VISION','Our Vision','To became a national and international model, with a portfolio of successful projects ratifying our positioning as a reliable and responsible company in web application development.','our-vision','2012-12-03 23:35:15','2012-12-12 19:43:48',NULL,NULL,NULL,NULL),(35,1,'OUR-VALUES','','','our-values','2012-12-03 23:35:39','2012-12-03 23:35:39',NULL,NULL,NULL,NULL),(36,1,'TECHNOLOGY-LIST-HEADER','Technologies','','technology-list-header','2012-12-04 15:56:07','2012-12-04 15:56:07',NULL,NULL,NULL,NULL),(37,1,'TOOL-LIST-HEADER','Tools','','tool-list-header','2012-12-04 15:56:25','2012-12-04 15:56:25',NULL,NULL,NULL,NULL),(38,1,'SUBSCRIBE','Newsletter','','subscribe','2012-12-04 22:12:40','2012-12-04 22:12:40',NULL,NULL,NULL,NULL),(39,1,'OUR-SERVICES-TITLE','Our Services','','our-services-title','2012-12-04 22:21:11','2012-12-04 22:21:11',NULL,NULL,NULL,NULL),(40,1,'FIRST-SIDE-BAR-CONTENT-SERVICES-PAGE','How do we do it?','No hassle, no bureaucracy, we create high quality code.The maintainability and quality assurance are our primary goals in every software project.\r\n\r\nWe use Behavior Driven Development to deliver 100% tested results.\r\n\r\nWe firmly believe in the benefits the agile methodologies can have in a software project, that’s why we try to implement these practices in all our projects.\r\n\r\nAlso we love integrating third party API’s to create 2.0 web applications.','first-side-bar-content-services-page','2012-12-04 22:25:23','2012-12-04 22:25:23',NULL,NULL,NULL,NULL),(41,1,'SECOND-SIDE-BAR-CONTENT-SERVICES-PAGE','Our Offering','INSIGNIA’s offering is founded upon a solid, professional and interdisciplinary team of really passionate web developers. We’re proud to say our firm has a world class development team which is able to face any challenge your business might need, from handling new projects as well and maintaining existing ones to scaling high-traffic sites into cloud-based hosting system.\r\n\r\nOur interdisciplinary team allows us to cover a wide range of projects due to our variety of skills that complement each other. For more information about this you can take a look at our Staff.','second-side-bar-content-services-page','2012-12-04 22:26:21','2012-12-04 22:26:21',NULL,NULL,NULL,NULL),(42,1,'FIRST-SIDE-BAR-CONTENT-SERVICES-PAGE','How do we do it?','Agile Web Development with Ruby on Rails. No hassle, no bureaucracy, we create high quality code.The maintainability and quality assurance are our primary goals in every software project.\r\n\r\nWe use Behavior Driven Development to deliver 100% tested results.\r\n\r\nWe firmly believe in the benefits the agile methodologies can have in a software project, that’s why we try to implement these practices in all our projects.\r\n\r\nAlso we love integrating third party API’s to create 2.0 web applications.','first-side-bar-content-services-page--2','2012-12-04 22:27:16','2012-12-04 22:27:16',NULL,NULL,NULL,NULL),(43,1,'OUR-PROCESS','Our Process','','our-process','2012-12-10 22:03:42','2012-12-10 22:03:42',NULL,NULL,NULL,NULL),(44,1,'planificacion-text-snippet','HIGHLY INTERACTIVE SITES DEVELOPMENT','We\'ve got the necessary resources and the experience to take your idea, shape it, and enhance it to produce a professional web site based on the most advanced technologies. We’re specialized in the agile development of highly interactive sites built on Ruby on Rails, properly tested with Cucumber and Rspec and supported with cutting-edge technologies.','planificacion-text-snippet','2012-12-10 22:04:37','2013-05-08 13:01:46',NULL,NULL,NULL,NULL),(45,1,'codificacion-text-snippet','SCALLING HIGH-TRAFFIC SITES','Scalling a highly-traffic site could be a monumental task when you don’t know the road you need to follow for sure. We’re specialized in consulting and managing these transitions in a simple and smooth way. We take care of the process all the way, from needed optimizations to the complete system migration to a cloud-based hosting system.','codificacion-text-snippet','2012-12-10 22:05:32','2013-05-08 13:01:12',NULL,NULL,NULL,NULL),(46,1,'revision-text-snippet','RETAINER PROGRAMS FOR RUBY ON RAILS BASED APPLICATIONS','We can keep your site live running in a stable and upgraded way. We can give you a quick response to any critical bug that might prevent an application’s proper performance. If time allows it, we can also face small projects to add new functionalities and enhancements your site might need','revision-text-snippet','2012-12-10 22:06:01','2013-05-08 13:44:40',NULL,NULL,NULL,NULL),(47,1,'control-text-snippet','BACK-END DEVELOPMENT','We’ve got the necessary resources and the experience to take your idea, shape it, and enhance it to produce a professional web site based on the most advanced technologies.','control-text-snippet','2012-12-10 22:06:35','2013-05-08 12:59:05',NULL,NULL,NULL,NULL),(48,1,'produccion-text-snippet','FRONT-END DEVELOPMENT','We’ve got the necessary resources and the experience to take your idea, shape it, and enhance it to produce a professional web site based on the most advanced technologies.','produccion-text-snippet','2012-12-10 22:08:58','2013-05-08 12:57:58',NULL,NULL,NULL,NULL),(49,1,'mantenimiento-text-snippet','MOBILE DEVELOPMENT','We develop mobile web applications using the most advanced mobile technologies: HTML5, CSS3 and Javascript Front-end Frameworks.','mantenimiento-text-snippet','2012-12-10 22:09:28','2013-05-08 12:57:05',NULL,NULL,NULL,NULL),(50,1,'us','Staff','','us','2012-12-11 19:52:09','2012-12-11 19:52:09',NULL,NULL,NULL,NULL),(51,1,'DURATION-PROJECT-HEADER','Duration','','duration-project-header','2012-12-12 19:42:42','2012-12-12 19:42:42',NULL,NULL,NULL,NULL),(52,1,'to-separator-project-duration','to','','to-separator-project-duration','2012-12-19 19:52:48','2012-12-19 19:52:48',NULL,NULL,NULL,NULL),(53,1,'CONTACT-DETAILS','Contact Us','Lamadrid 318, Piso 4 Dpto A\r\n\r\nSan Miguel de Tucumán\r\n\r\nTucumán, Argentina\r\n\r\n&nbsp;\r\n\r\nT: +54 (381) 420-7387\r\n\r\nM: \"info@insignia4u.com\":mailto:info@insignia4u.com\r\n','contact-details','2013-01-30 15:54:51','2013-01-30 15:54:51',NULL,NULL,NULL,NULL),(54,1,'introduction-header','At <strong>Insignia</strong> we build highly interactive web applications using  <strong> agile methodologies</strong> and <strong>cutting edge technologies</strong>.','','introduction-header','2013-05-07 19:29:39','2013-05-07 19:29:39',NULL,NULL,NULL,NULL),(55,1,'our-quality-policy-list','','<ul class=\"bullets-blue\">  <li>Creativity and innovation, as a part of our daily  challenge to continuous improvement.</li><li>Awareness and responsibility, practicing an error free job  and security in the applications.</li> <li>Friendliness in out service and agility in the processes.</li> <li>Cooperative work and integral development of our collaborators.</li> <li>Commitment with the client, ensuring efficiency in the management system.</li> <li>Commitment with our collaborators, providing resources for  the effective achievement of the objectives.</li>','our-quality-policy-list','2013-05-07 19:56:08','2013-05-07 19:56:08',NULL,NULL,NULL,NULL),(56,1,'our-quality-policy-list','','<ul class=\"bullets-blue\">  <li>Creativity and innovation, as a part of our daily  challenge to continuous improvement.</li><li>Awareness and responsibility, practicing an error free job  and security in the applications.</li> <li>Friendliness in out service and agility in the processes.</li> <li>Cooperative work and integral development of our collaborators.</li> <li>Commitment with the client, ensuring efficiency in the management system.</li> <li>Commitment with our collaborators, providing resources for  the effective achievement of the objectives.</li>','our-quality-policy-list--2','2013-05-07 19:56:29','2013-05-07 19:56:29',NULL,NULL,NULL,NULL),(59,1,'how-do-we-do-it','How do we do it','<ul class=\"bullets-blue\"><li>No hassle, no bureaucracy, we  create high quality code. The maintainability and quality assurance  are our primary goals in every software project.</li><li>We use Behavior Driven Development to deliver 100% tested  results.</li><li>We firmly believe in the benefits the agile methodologies can  have in a software project, that’s why we try to implement these  practices in all our projects.</li><li>Also we love integrating third party API’s to create 2.0  web applications.</li>','how-do-we-do-it','2013-05-07 20:12:26','2013-05-07 20:12:26',NULL,NULL,NULL,NULL),(61,1,'our-offering','Our Offering','<p>INSIGNIA’s offering is founded upon a solid, professional and  interdisciplinary team of really passionate web developers. We’re  proud to say our firm has a world class development team which is able to face any challenge your business might need, from handling  new projects as well and maintaining existing ones to scaling  high-traffic sites into cloud-based hosting system.</p><p>Our interdisciplinary team allows us to cover a wide range of  projects due to our variety of skills that complement each other.  For more information about this you can take a look at  <a href=\"/staff\">our Staff</a>.','our-offering','2013-05-07 20:13:18','2013-05-07 20:13:58',NULL,NULL,NULL,NULL),(66,1,'planificacion-process-snippet','PLANNING','Using agile methodologies and our team’s experience, we help our clientes creating concrete and feasible projects. In this stage we produce the necessary documentation to work as a base for the budgeting of the projects as well as its implementation.','planificacion-process-snippet--2','2013-05-08 13:33:47','2013-05-08 13:51:48',NULL,NULL,NULL,NULL),(67,1,'codificacion-process-snippet','CODING','Considering all the best practices in software development and using the most advanced technologies available, we implement project features with maintainability, scalability and performance in mind. All the code we write is subject to automated tests to validate its behavior.','codificacion-process-snippet--2','2013-05-08 13:35:04','2013-05-08 13:52:17',NULL,NULL,NULL,NULL),(68,1,'revision-process-snippet','CODE REVIEW','Considering all the best practices in software development and using the most advanced technologies available, we implement project features with maintainability, scalability and performance in mind. All the code we write is subject to automated tests to validate its behavior.','revision-process-snippet--2','2013-05-08 13:35:32','2013-05-08 13:52:39',NULL,NULL,NULL,NULL),(69,1,'control-process-snippet','QUALITY ASSURANCE','On this stage we make sure the product the client gets works as expected and error free. This process is repeated until we deliver a stable solution.','control-process-snippet--2','2013-05-08 13:36:21','2013-05-08 13:53:00',NULL,NULL,NULL,NULL),(70,1,'produccion-process-snippet','DEPLOYMENT','We have the know-how to set up a production environment that best fits the needs of the projects. Our team has a lot of experience deploying high traffic application in dedicated servers as well as cloud servers.','produccion-process-snippet--2','2013-05-08 13:37:03','2013-05-08 13:53:16',NULL,NULL,NULL,NULL),(71,1,'mantenimiento-process-snippet','MAINTENANCE','In order to ensure the progress of projects we take part, we offer the service of maintenance to help with the evolution and improvement of project already in production.','mantenimiento-process-snippet--2','2013-05-08 13:37:42','2013-05-08 13:53:32',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `text_snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tips`
--

DROP TABLE IF EXISTS `tips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `tip_type` int(11) DEFAULT NULL,
  `description` text,
  `content` text,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tips_on_slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tips`
--

LOCK TABLES `tips` WRITE;
/*!40000 ALTER TABLE `tips` DISABLE KEYS */;
/*!40000 ALTER TABLE `tips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tools`
--

DROP TABLE IF EXISTS `tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tools`
--

LOCK TABLES `tools` WRITE;
/*!40000 ALTER TABLE `tools` DISABLE KEYS */;
INSERT INTO `tools` VALUES (1,'Agile methodologies','2012-11-23 21:10:58','2012-11-28 20:25:24',2,NULL),(2,'Version control system: GIT, SVN and others.','2012-11-23 21:14:08','2012-11-28 20:25:11',1,NULL),(3,'Behaviour Driven Development','2012-11-23 21:14:39','2012-11-28 20:25:07',4,NULL),(4,'Pair programming','2012-11-23 21:14:55','2012-11-28 20:25:24',3,NULL);
/*!40000 ALTER TABLE `tools` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-12 18:20:03
