-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: grungle
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('00000000000001','jhipster','classpath:config/liquibase/changelog/00000000000000_initial_schema.xml','2015-10-12 13:45:37',1,'EXECUTED','7:ebf30945ed2b43c977353044ee595de2','createTable, createIndex (x2), createTable (x2), addPrimaryKey, addForeignKeyConstraint (x2), loadData, dropDefaultValue, loadData (x2), createTable (x2), addPrimaryKey, createIndex (x2), addForeignKeyConstraint','',NULL,'3.3.2');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_AUTHORITY`
--

DROP TABLE IF EXISTS `T_AUTHORITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_AUTHORITY` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_AUTHORITY`
--

LOCK TABLES `T_AUTHORITY` WRITE;
/*!40000 ALTER TABLE `T_AUTHORITY` DISABLE KEYS */;
INSERT INTO `T_AUTHORITY` VALUES ('ROLE_ADMIN'),('ROLE_USER');
/*!40000 ALTER TABLE `T_AUTHORITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_PERSISTENT_AUDIT_EVENT`
--

DROP TABLE IF EXISTS `T_PERSISTENT_AUDIT_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PERSISTENT_AUDIT_EVENT` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(255) NOT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_persistent_audit_event` (`principal`,`event_date`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_PERSISTENT_AUDIT_EVENT`
--

LOCK TABLES `T_PERSISTENT_AUDIT_EVENT` WRITE;
/*!40000 ALTER TABLE `T_PERSISTENT_AUDIT_EVENT` DISABLE KEYS */;
INSERT INTO `T_PERSISTENT_AUDIT_EVENT` VALUES (1,'anonymousUser','2015-10-12 17:50:37','AUTHORIZATION_FAILURE'),(2,'anonymousUser','2015-10-12 17:51:28','AUTHORIZATION_FAILURE'),(3,'admin','2015-10-12 17:53:11','AUTHENTICATION_SUCCESS'),(4,'anonymousUser','2015-10-12 17:53:11','AUTHORIZATION_FAILURE'),(5,'admin','2015-10-12 17:53:18','AUTHENTICATION_SUCCESS'),(6,'anonymousUser','2015-10-12 17:53:18','AUTHORIZATION_FAILURE'),(7,'admin','2015-10-12 17:53:57','AUTHENTICATION_SUCCESS'),(8,'anonymousUser','2015-10-12 17:53:57','AUTHORIZATION_FAILURE'),(9,'admin','2015-10-12 17:54:12','AUTHENTICATION_SUCCESS'),(10,'anonymousUser','2015-10-12 17:54:12','AUTHORIZATION_FAILURE'),(11,'user','2015-10-12 17:55:27','AUTHENTICATION_SUCCESS'),(12,'anonymousUser','2015-10-12 17:55:27','AUTHORIZATION_FAILURE'),(13,'admin','2015-10-12 17:56:24','AUTHENTICATION_SUCCESS'),(14,'anonymousUser','2015-10-12 17:56:24','AUTHORIZATION_FAILURE'),(15,'user','2015-10-12 17:56:38','AUTHENTICATION_SUCCESS'),(16,'anonymousUser','2015-10-12 17:56:38','AUTHORIZATION_FAILURE'),(17,'anonymousUser','2015-10-12 18:00:43','AUTHORIZATION_FAILURE'),(18,'admin','2015-10-12 18:00:46','AUTHENTICATION_SUCCESS'),(19,'anonymousUser','2015-10-12 18:00:47','AUTHORIZATION_FAILURE'),(20,'admin','2015-10-12 18:01:57','AUTHENTICATION_SUCCESS'),(21,'admin','2015-10-12 18:03:01','AUTHENTICATION_SUCCESS'),(22,'anonymousUser','2015-10-12 18:03:01','AUTHORIZATION_FAILURE'),(23,'admin','2015-10-12 18:03:17','AUTHENTICATION_SUCCESS'),(24,'anonymousUser','2015-10-12 18:03:17','AUTHORIZATION_FAILURE'),(25,'anonymousUser','2015-10-12 18:03:29','AUTHORIZATION_FAILURE'),(26,'anonymousUser','2015-10-12 18:06:29','AUTHORIZATION_FAILURE'),(27,'admin','2015-10-12 18:06:32','AUTHENTICATION_SUCCESS'),(28,'anonymous','2015-10-12 18:06:33','AUTHORIZATION_FAILURE'),(29,'anonymousUser','2015-10-12 18:06:35','AUTHORIZATION_FAILURE'),(30,'anonymous','2015-10-12 18:06:53','AUTHORIZATION_FAILURE'),(31,'anonymous','2015-10-12 18:06:55','AUTHORIZATION_FAILURE'),(32,'anonymousUser','2015-10-12 18:07:09','AUTHORIZATION_FAILURE'),(33,'user','2015-10-12 18:07:13','AUTHENTICATION_SUCCESS'),(34,'anonymous','2015-10-12 18:07:13','AUTHORIZATION_FAILURE'),(35,'anonymousUser','2015-10-12 18:07:16','AUTHORIZATION_FAILURE'),(36,'anonymousUser','2015-10-12 18:08:42','AUTHORIZATION_FAILURE'),(37,'anonymousUser','2015-10-12 18:08:59','AUTHORIZATION_FAILURE'),(38,'anonymousUser','2015-10-12 18:09:11','AUTHORIZATION_FAILURE'),(39,'anonymousUser','2015-10-12 18:31:30','AUTHORIZATION_FAILURE'),(40,'anonymousUser','2015-10-12 18:33:25','AUTHORIZATION_FAILURE'),(41,'anonymousUser','2015-10-12 18:33:28','AUTHORIZATION_FAILURE'),(42,'anonymousUser','2015-10-12 18:33:31','AUTHORIZATION_FAILURE'),(43,'anonymousUser','2015-10-12 18:34:41','AUTHORIZATION_FAILURE'),(44,'anonymousUser','2015-10-12 21:03:54','AUTHORIZATION_FAILURE'),(45,'anonymousUser','2015-10-12 21:03:54','AUTHORIZATION_FAILURE'),(46,'anonymousUser','2015-10-12 21:03:54','AUTHORIZATION_FAILURE'),(47,'anonymousUser','2015-10-14 00:16:54','AUTHORIZATION_FAILURE'),(48,'anonymousUser','2015-10-14 00:16:54','AUTHORIZATION_FAILURE'),(49,'anonymousUser','2015-10-14 00:17:10','AUTHORIZATION_FAILURE'),(50,'anonymousUser','2015-10-14 00:26:25','AUTHORIZATION_FAILURE'),(51,'anonymousUser','2015-10-14 00:28:37','AUTHORIZATION_FAILURE'),(52,'alyahmed220@gmail.com','2015-10-14 00:57:26','AUTHENTICATION_FAILURE'),(53,'alyahmed220@gmail.com','2015-10-14 00:57:42','AUTHENTICATION_FAILURE'),(54,'alyahmed220@gmail.com','2015-10-14 00:57:43','AUTHENTICATION_FAILURE'),(55,'alyahmed220@gmail.com','2015-10-14 00:57:45','AUTHENTICATION_FAILURE'),(56,'alyahmed220@gmail.com','2015-10-14 00:59:13','AUTHENTICATION_FAILURE'),(57,'alyahmed220@gmail.com','2015-10-14 00:59:21','AUTHENTICATION_SUCCESS'),(58,'anonymousUser','2015-10-14 00:59:26','AUTHORIZATION_FAILURE'),(59,'anonymousUser','2015-10-14 00:59:44','AUTHORIZATION_FAILURE'),(60,'anonymousUser','2015-10-14 01:00:37','AUTHORIZATION_FAILURE'),(61,'anonymousUser','2015-10-14 01:02:02','AUTHORIZATION_FAILURE'),(62,'anonymousUser','2015-10-14 01:02:42','AUTHORIZATION_FAILURE'),(63,'anonymousUser','2015-10-14 01:02:59','AUTHORIZATION_FAILURE'),(64,'anonymousUser','2015-10-14 01:20:12','AUTHORIZATION_FAILURE'),(65,'anonymousUser','2015-10-14 01:20:22','AUTHORIZATION_FAILURE'),(66,'anonymousUser','2015-10-14 01:20:31','AUTHORIZATION_FAILURE'),(67,'anonymousUser','2015-10-14 01:20:50','AUTHORIZATION_FAILURE'),(68,'anonymousUser','2015-10-14 01:21:04','AUTHORIZATION_FAILURE'),(69,'anonymousUser','2015-10-14 01:21:08','AUTHORIZATION_FAILURE'),(70,'anonymousUser','2015-10-14 01:21:19','AUTHORIZATION_FAILURE'),(71,'anonymousUser','2015-10-14 01:21:27','AUTHORIZATION_FAILURE'),(72,'anonymousUser','2015-10-14 01:21:31','AUTHORIZATION_FAILURE'),(73,'anonymousUser','2015-10-14 01:22:53','AUTHORIZATION_FAILURE'),(74,'anonymousUser','2015-10-14 01:24:41','AUTHORIZATION_FAILURE'),(75,'anonymousUser','2015-10-14 01:24:46','AUTHORIZATION_FAILURE'),(76,'anonymousUser','2015-10-14 01:25:02','AUTHORIZATION_FAILURE'),(77,'anonymousUser','2015-10-14 01:25:10','AUTHORIZATION_FAILURE'),(78,'anonymousUser','2015-10-14 01:25:47','AUTHORIZATION_FAILURE'),(79,'anonymousUser','2015-10-14 01:26:33','AUTHORIZATION_FAILURE'),(80,'anonymousUser','2015-10-14 01:26:36','AUTHORIZATION_FAILURE'),(81,'anonymousUser','2015-10-14 01:28:01','AUTHORIZATION_FAILURE'),(82,'anonymousUser','2015-10-14 01:28:24','AUTHORIZATION_FAILURE'),(83,'anonymousUser','2015-10-14 01:28:27','AUTHORIZATION_FAILURE'),(84,'anonymousUser','2015-10-14 01:28:41','AUTHORIZATION_FAILURE'),(85,'anonymousUser','2015-10-14 01:28:44','AUTHORIZATION_FAILURE'),(86,'anonymousUser','2015-10-14 01:29:01','AUTHORIZATION_FAILURE'),(87,'anonymousUser','2015-10-14 01:29:04','AUTHORIZATION_FAILURE'),(88,'anonymousUser','2015-10-14 01:29:20','AUTHORIZATION_FAILURE'),(89,'anonymousUser','2015-10-14 01:29:20','AUTHORIZATION_FAILURE'),(90,'anonymousUser','2015-10-14 01:29:21','AUTHORIZATION_FAILURE'),(91,'anonymousUser','2015-10-14 01:29:29','AUTHORIZATION_FAILURE'),(92,'anonymousUser','2015-10-14 01:29:32','AUTHORIZATION_FAILURE'),(93,'anonymousUser','2015-10-14 01:30:29','AUTHORIZATION_FAILURE'),(94,'anonymousUser','2015-10-14 01:30:32','AUTHORIZATION_FAILURE'),(95,'anonymousUser','2015-10-14 01:31:16','AUTHORIZATION_FAILURE'),(96,'anonymousUser','2015-10-14 01:31:18','AUTHORIZATION_FAILURE'),(97,'anonymousUser','2015-10-14 01:31:19','AUTHORIZATION_FAILURE'),(98,'anonymousUser','2015-10-14 01:31:20','AUTHORIZATION_FAILURE'),(99,'anonymousUser','2015-10-14 01:31:20','AUTHORIZATION_FAILURE'),(100,'anonymousUser','2015-10-14 01:31:24','AUTHORIZATION_FAILURE'),(101,'anonymousUser','2015-10-14 01:31:35','AUTHORIZATION_FAILURE'),(102,'anonymousUser','2015-10-14 01:32:06','AUTHORIZATION_FAILURE'),(103,'anonymousUser','2015-10-14 01:32:17','AUTHORIZATION_FAILURE'),(104,'anonymousUser','2015-10-14 01:32:23','AUTHORIZATION_FAILURE'),(105,'anonymousUser','2015-10-14 01:33:49','AUTHORIZATION_FAILURE'),(106,'anonymousUser','2015-10-14 01:33:55','AUTHORIZATION_FAILURE'),(107,'anonymousUser','2015-10-14 01:34:12','AUTHORIZATION_FAILURE'),(108,'anonymousUser','2015-10-14 01:34:40','AUTHORIZATION_FAILURE'),(109,'anonymousUser','2015-10-14 01:34:54','AUTHORIZATION_FAILURE'),(110,'anonymousUser','2015-10-14 01:35:07','AUTHORIZATION_FAILURE'),(111,'anonymousUser','2015-10-14 01:35:15','AUTHORIZATION_FAILURE'),(112,'admin','2015-10-14 01:35:26','AUTHENTICATION_FAILURE'),(113,'anonymousUser','2015-10-14 01:35:39','AUTHORIZATION_FAILURE'),(114,'anonymousUser','2015-10-14 01:35:44','AUTHORIZATION_FAILURE'),(115,'anonymousUser','2015-10-14 01:35:47','AUTHORIZATION_FAILURE'),(116,'anonymousUser','2015-10-14 01:35:52','AUTHORIZATION_FAILURE'),(117,'anonymousUser','2015-10-14 01:42:49','AUTHORIZATION_FAILURE'),(118,'anonymousUser','2015-10-14 02:15:56','AUTHORIZATION_FAILURE'),(119,'anonymousUser','2015-10-14 02:15:56','AUTHORIZATION_FAILURE'),(120,'anonymousUser','2015-10-14 02:15:57','AUTHORIZATION_FAILURE');
/*!40000 ALTER TABLE `T_PERSISTENT_AUDIT_EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_PERSISTENT_AUDIT_EVT_DATA`
--

DROP TABLE IF EXISTS `T_PERSISTENT_AUDIT_EVT_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PERSISTENT_AUDIT_EVT_DATA` (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`,`name`),
  KEY `idx_persistent_audit_evt_data` (`event_id`),
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `JHI_PERSISTENT_AUDIT_EVENT` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_PERSISTENT_AUDIT_EVT_DATA`
--

LOCK TABLES `T_PERSISTENT_AUDIT_EVT_DATA` WRITE;
/*!40000 ALTER TABLE `T_PERSISTENT_AUDIT_EVT_DATA` DISABLE KEYS */;
INSERT INTO `T_PERSISTENT_AUDIT_EVT_DATA` VALUES (1,'message','Access is denied'),(1,'type','org.springframework.security.access.AccessDeniedException'),(2,'message','Access is denied'),(2,'type','org.springframework.security.access.AccessDeniedException'),(4,'message','Access is denied'),(4,'type','org.springframework.security.access.AccessDeniedException'),(6,'message','Access is denied'),(6,'type','org.springframework.security.access.AccessDeniedException'),(8,'message','Access is denied'),(8,'type','org.springframework.security.access.AccessDeniedException'),(10,'message','Access is denied'),(10,'type','org.springframework.security.access.AccessDeniedException'),(12,'message','Access is denied'),(12,'type','org.springframework.security.access.AccessDeniedException'),(14,'message','Access is denied'),(14,'type','org.springframework.security.access.AccessDeniedException'),(16,'message','Access is denied'),(16,'type','org.springframework.security.access.AccessDeniedException'),(17,'message','Access is denied'),(17,'type','org.springframework.security.access.AccessDeniedException'),(19,'message','Access is denied'),(19,'type','org.springframework.security.access.AccessDeniedException'),(22,'message','Access is denied'),(22,'type','org.springframework.security.access.AccessDeniedException'),(24,'message','Access is denied'),(24,'type','org.springframework.security.access.AccessDeniedException'),(25,'message','Access is denied'),(25,'type','org.springframework.security.access.AccessDeniedException'),(26,'message','Access is denied'),(26,'type','org.springframework.security.access.AccessDeniedException'),(28,'message','Access is denied'),(28,'type','org.springframework.security.access.AccessDeniedException'),(29,'message','Access is denied'),(29,'type','org.springframework.security.access.AccessDeniedException'),(30,'message','Access is denied'),(30,'type','org.springframework.security.access.AccessDeniedException'),(31,'message','Access is denied'),(31,'type','org.springframework.security.access.AccessDeniedException'),(32,'message','Access is denied'),(32,'type','org.springframework.security.access.AccessDeniedException'),(34,'message','Access is denied'),(34,'type','org.springframework.security.access.AccessDeniedException'),(35,'message','Access is denied'),(35,'type','org.springframework.security.access.AccessDeniedException'),(36,'message','Access is denied'),(36,'type','org.springframework.security.access.AccessDeniedException'),(37,'message','Access is denied'),(37,'type','org.springframework.security.access.AccessDeniedException'),(38,'message','Access is denied'),(38,'type','org.springframework.security.access.AccessDeniedException'),(39,'message','Access is denied'),(39,'type','org.springframework.security.access.AccessDeniedException'),(40,'message','Access is denied'),(40,'type','org.springframework.security.access.AccessDeniedException'),(41,'message','Access is denied'),(41,'type','org.springframework.security.access.AccessDeniedException'),(42,'message','Access is denied'),(42,'type','org.springframework.security.access.AccessDeniedException'),(43,'message','Access is denied'),(43,'type','org.springframework.security.access.AccessDeniedException'),(44,'message','Access is denied'),(44,'type','org.springframework.security.access.AccessDeniedException'),(45,'message','Access is denied'),(45,'type','org.springframework.security.access.AccessDeniedException'),(46,'message','Access is denied'),(46,'type','org.springframework.security.access.AccessDeniedException'),(47,'message','Access is denied'),(47,'type','org.springframework.security.access.AccessDeniedException'),(48,'message','Access is denied'),(48,'type','org.springframework.security.access.AccessDeniedException'),(49,'message','Access is denied'),(49,'type','org.springframework.security.access.AccessDeniedException'),(50,'message','Access is denied'),(50,'type','org.springframework.security.access.AccessDeniedException'),(51,'message','Access is denied'),(51,'type','org.springframework.security.access.AccessDeniedException'),(52,'message','Bad credentials'),(52,'type','org.springframework.security.authentication.BadCredentialsException'),(53,'message','Bad credentials'),(53,'type','org.springframework.security.authentication.BadCredentialsException'),(54,'message','Bad credentials'),(54,'type','org.springframework.security.authentication.BadCredentialsException'),(55,'message','Bad credentials'),(55,'type','org.springframework.security.authentication.BadCredentialsException'),(56,'message','Bad credentials'),(56,'type','org.springframework.security.authentication.BadCredentialsException'),(58,'message','Access is denied'),(58,'type','org.springframework.security.access.AccessDeniedException'),(59,'message','Access is denied'),(59,'type','org.springframework.security.access.AccessDeniedException'),(60,'message','Access is denied'),(60,'type','org.springframework.security.access.AccessDeniedException'),(61,'message','Access is denied'),(61,'type','org.springframework.security.access.AccessDeniedException'),(62,'message','Access is denied'),(62,'type','org.springframework.security.access.AccessDeniedException'),(63,'message','Access is denied'),(63,'type','org.springframework.security.access.AccessDeniedException'),(64,'message','Access is denied'),(64,'type','org.springframework.security.access.AccessDeniedException'),(65,'message','Access is denied'),(65,'type','org.springframework.security.access.AccessDeniedException'),(66,'message','Access is denied'),(66,'type','org.springframework.security.access.AccessDeniedException'),(67,'message','Access is denied'),(67,'type','org.springframework.security.access.AccessDeniedException'),(68,'message','Access is denied'),(68,'type','org.springframework.security.access.AccessDeniedException'),(69,'message','Access is denied'),(69,'type','org.springframework.security.access.AccessDeniedException'),(70,'message','Access is denied'),(70,'type','org.springframework.security.access.AccessDeniedException'),(71,'message','Access is denied'),(71,'type','org.springframework.security.access.AccessDeniedException'),(72,'message','Access is denied'),(72,'type','org.springframework.security.access.AccessDeniedException'),(73,'message','Access is denied'),(73,'type','org.springframework.security.access.AccessDeniedException'),(74,'message','Access is denied'),(74,'type','org.springframework.security.access.AccessDeniedException'),(75,'message','Access is denied'),(75,'type','org.springframework.security.access.AccessDeniedException'),(76,'message','Access is denied'),(76,'type','org.springframework.security.access.AccessDeniedException'),(77,'message','Access is denied'),(77,'type','org.springframework.security.access.AccessDeniedException'),(78,'message','Access is denied'),(78,'type','org.springframework.security.access.AccessDeniedException'),(79,'message','Access is denied'),(79,'type','org.springframework.security.access.AccessDeniedException'),(80,'message','Access is denied'),(80,'type','org.springframework.security.access.AccessDeniedException'),(81,'message','Access is denied'),(81,'type','org.springframework.security.access.AccessDeniedException'),(82,'message','Access is denied'),(82,'type','org.springframework.security.access.AccessDeniedException'),(83,'message','Access is denied'),(83,'type','org.springframework.security.access.AccessDeniedException'),(84,'message','Access is denied'),(84,'type','org.springframework.security.access.AccessDeniedException'),(85,'message','Access is denied'),(85,'type','org.springframework.security.access.AccessDeniedException'),(86,'message','Access is denied'),(86,'type','org.springframework.security.access.AccessDeniedException'),(87,'message','Access is denied'),(87,'type','org.springframework.security.access.AccessDeniedException'),(88,'message','Access is denied'),(88,'type','org.springframework.security.access.AccessDeniedException'),(89,'message','Access is denied'),(89,'type','org.springframework.security.access.AccessDeniedException'),(90,'message','Access is denied'),(90,'type','org.springframework.security.access.AccessDeniedException'),(91,'message','Access is denied'),(91,'type','org.springframework.security.access.AccessDeniedException'),(92,'message','Access is denied'),(92,'type','org.springframework.security.access.AccessDeniedException'),(93,'message','Access is denied'),(93,'type','org.springframework.security.access.AccessDeniedException'),(94,'message','Access is denied'),(94,'type','org.springframework.security.access.AccessDeniedException'),(95,'message','Access is denied'),(95,'type','org.springframework.security.access.AccessDeniedException'),(96,'message','Access is denied'),(96,'type','org.springframework.security.access.AccessDeniedException'),(97,'message','Access is denied'),(97,'type','org.springframework.security.access.AccessDeniedException'),(98,'message','Access is denied'),(98,'type','org.springframework.security.access.AccessDeniedException'),(99,'message','Access is denied'),(99,'type','org.springframework.security.access.AccessDeniedException'),(100,'message','Access is denied'),(100,'type','org.springframework.security.access.AccessDeniedException'),(101,'message','Access is denied'),(101,'type','org.springframework.security.access.AccessDeniedException'),(102,'message','Access is denied'),(102,'type','org.springframework.security.access.AccessDeniedException'),(103,'message','Access is denied'),(103,'type','org.springframework.security.access.AccessDeniedException'),(104,'message','Access is denied'),(104,'type','org.springframework.security.access.AccessDeniedException'),(105,'message','Access is denied'),(105,'type','org.springframework.security.access.AccessDeniedException'),(106,'message','Access is denied'),(106,'type','org.springframework.security.access.AccessDeniedException'),(107,'message','Access is denied'),(107,'type','org.springframework.security.access.AccessDeniedException'),(108,'message','Access is denied'),(108,'type','org.springframework.security.access.AccessDeniedException'),(109,'message','Access is denied'),(109,'type','org.springframework.security.access.AccessDeniedException'),(110,'message','Access is denied'),(110,'type','org.springframework.security.access.AccessDeniedException'),(111,'message','Access is denied'),(111,'type','org.springframework.security.access.AccessDeniedException'),(112,'message','Bad credentials'),(112,'type','org.springframework.security.authentication.BadCredentialsException'),(113,'message','Access is denied'),(113,'type','org.springframework.security.access.AccessDeniedException'),(114,'message','Access is denied'),(114,'type','org.springframework.security.access.AccessDeniedException'),(115,'message','Access is denied'),(115,'type','org.springframework.security.access.AccessDeniedException'),(116,'message','Access is denied'),(116,'type','org.springframework.security.access.AccessDeniedException'),(117,'message','Access is denied'),(117,'type','org.springframework.security.access.AccessDeniedException'),(118,'message','Access is denied'),(118,'type','org.springframework.security.access.AccessDeniedException'),(119,'message','Access is denied'),(119,'type','org.springframework.security.access.AccessDeniedException'),(120,'message','Access is denied'),(120,'type','org.springframework.security.access.AccessDeniedException');
/*!40000 ALTER TABLE `T_PERSISTENT_AUDIT_EVT_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_SOCIAL_PROFILE`
--

DROP TABLE IF EXISTS `T_SOCIAL_PROFILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_SOCIAL_PROFILE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `platform_login` varchar(100) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) NOT NULL,
  `registered_user` bigint(20) NOT NULL,
  `platform` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`email`,`platform`),
  KEY `fk_social_profile_reg_user_idx` (`registered_user`),
  KEY `email_idx` (`email`),
  KEY `platform_idx` (`platform`),
  CONSTRAINT `fk_social_profile_reg_user` FOREIGN KEY (`registered_user`) REFERENCES `T_USER` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_SOCIAL_PROFILE`
--

LOCK TABLES `T_SOCIAL_PROFILE` WRITE;
/*!40000 ALTER TABLE `T_SOCIAL_PROFILE` DISABLE KEYS */;
INSERT INTO `T_SOCIAL_PROFILE` VALUES (1,'alyahmed220@gmail.com','alyahmed',NULL,NULL,'https://avatars.githubusercontent.com/u/6116146?v=3','18721fb1e294ae105d066944ea74aa20866579c8',3,'GITHUB');
/*!40000 ALTER TABLE `T_SOCIAL_PROFILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_USER`
--

DROP TABLE IF EXISTS `T_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_USER` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `PASSWORD` varchar(60) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(5) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  `social_account` bit(1) NOT NULL DEFAULT b'0',
  `social_provider` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `idx_user_login` (`login`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `idx_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_USER`
--

LOCK TABLES `T_USER` WRITE;
/*!40000 ALTER TABLE `T_USER` DISABLE KEYS */;
INSERT INTO `T_USER` VALUES (1,'system@system.com','$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG','System','System','system@localhost','','en',NULL,NULL,'system','2015-10-12 17:45:37',NULL,NULL,NULL,'\0',NULL),(2,'anonymousUser@system.com','$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO','Anonymous','User','anonymous@localhost','','en',NULL,NULL,'system','2015-10-12 17:45:37',NULL,NULL,NULL,'\0',NULL),(3,'alyahmed220@gmail.com','$2a$10$Zb/3vESmkq6Sx9pBdwkT0upkrYSgmu6p7ed19dfSY1CsSPPpwrHbe','Administrator','Administrator','admin@localhost','','en',NULL,NULL,'system','2015-10-12 17:45:37',NULL,'anonymousUser','2015-10-12 18:00:37','\0',NULL),(4,'ahmed.aly2756@gmail.com','$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K','User','User','user@localhost','','en',NULL,NULL,'system','2015-10-12 17:45:37',NULL,NULL,NULL,'\0',NULL);
/*!40000 ALTER TABLE `T_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_USER_AUTHORITY`
--

DROP TABLE IF EXISTS `T_USER_AUTHORITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_USER_AUTHORITY` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name_idx` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `T_AUTHORITY` (`name`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `T_USER` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_USER_AUTHORITY`
--

LOCK TABLES `T_USER_AUTHORITY` WRITE;
/*!40000 ALTER TABLE `T_USER_AUTHORITY` DISABLE KEYS */;
INSERT INTO `T_USER_AUTHORITY` VALUES (3,'ROLE_ADMIN'),(3,'ROLE_USER'),(4,'ROLE_USER');
/*!40000 ALTER TABLE `T_USER_AUTHORITY` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-02  8:12:21
