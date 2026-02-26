-- MySQL dump 10.13  Distrib 9.4.0, for Win64 (x86_64)
--
-- Host: localhost    Database: shunya_lab_db
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add event',7,'add_event'),(26,'Can change event',7,'change_event'),(27,'Can delete event',7,'delete_event'),(28,'Can view event',7,'view_event'),(29,'Can add news',8,'add_news'),(30,'Can change news',8,'change_news'),(31,'Can delete news',8,'delete_news'),(32,'Can view news',8,'view_news'),(33,'Can add opportunity',9,'add_opportunity'),(34,'Can change opportunity',9,'change_opportunity'),(35,'Can delete opportunity',9,'delete_opportunity'),(36,'Can view opportunity',9,'view_opportunity'),(37,'Can add publication',10,'add_publication'),(38,'Can change publication',10,'change_publication'),(39,'Can delete publication',10,'delete_publication'),(40,'Can view publication',10,'view_publication'),(41,'Can add research area',11,'add_researcharea'),(42,'Can change research area',11,'change_researcharea'),(43,'Can delete research area',11,'delete_researcharea'),(44,'Can view research area',11,'view_researcharea'),(45,'Can add team member',12,'add_teammember'),(46,'Can change team member',12,'change_teammember'),(47,'Can delete team member',12,'delete_teammember'),(48,'Can view team member',12,'view_teammember'),(49,'Can add contact',13,'add_contact'),(50,'Can change contact',13,'change_contact'),(51,'Can delete contact',13,'delete_contact'),(52,'Can view contact',13,'view_contact');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$Yu8alfm5IME1Gu9D5r1mSU$o/B6RRGXeXRHIUR1NpmgwJBtBf6FLRKkfpBwrwf198o=','2025-07-27 16:26:08.118165',1,'shunya_lab','','','ankitsharma18302@gmail.com',1,1,'2025-07-27 14:11:17.980814');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-07-27 16:48:13.198114','1','Indian power sector decarbonization: Net-zero by 2050 or 2070 (2024)',1,'[{\"added\": {}}]',10,1),(2,'2025-07-27 16:51:05.987739','2','Market instrument for the first fuel and its role in decarbonizing Indian industrial production (2024)',1,'[{\"added\": {}}]',10,1),(3,'2025-07-27 17:02:47.530738','1','Tarun Sharma',1,'[{\"added\": {}}]',12,1),(4,'2025-07-27 17:27:05.271787','2','Ashish Saraswat',1,'[{\"added\": {}}]',12,1),(5,'2025-07-28 13:36:18.638941','3','Arvind Singh Bisht',1,'[{\"added\": {}}]',12,1),(6,'2025-08-05 10:02:33.228551','1','Shunya Lab Secures Major Grant for Renewable Energy Research',1,'[{\"added\": {}}]',8,1),(7,'2025-08-05 18:05:06.911701','3','Arvind Singh Bisht',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',12,1),(8,'2025-08-06 08:13:19.935966','2','Ashish Saraswat',2,'[{\"changed\": {\"fields\": [\"Designation\"]}}]',12,1),(9,'2025-08-06 08:24:43.036401','1','IDEEA workshop 2024',1,'[{\"added\": {}}]',7,1),(10,'2025-08-06 13:24:12.914219','4','Anu Agarwal',1,'[{\"added\": {}}]',12,1),(11,'2025-08-06 13:26:41.665894','5','Sandeep Kumar',1,'[{\"added\": {}}]',12,1),(12,'2025-08-06 13:27:18.931910','4','Anu Agarwal',2,'[{\"changed\": {\"fields\": [\"Linkedin link\"]}}]',12,1),(13,'2025-08-06 13:27:55.072977','4','Anu Agarwal',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',12,1),(14,'2025-08-06 13:30:15.511302','6','Prashant Giri',1,'[{\"added\": {}}]',12,1),(15,'2025-08-06 13:32:51.283054','7','Ankit Sharma',1,'[{\"added\": {}}]',12,1),(16,'2025-08-06 13:34:06.612924','2','Ashish Saraswat',2,'[{\"changed\": {\"fields\": [\"Linkedin link\"]}}]',12,1),(17,'2025-08-06 13:34:53.517810','3','Arvind Singh Bisht',2,'[{\"changed\": {\"fields\": [\"Linkedin link\"]}}]',12,1),(18,'2025-08-06 13:36:19.885080','8','Malvika Bajpai',1,'[{\"added\": {}}]',12,1),(19,'2025-08-06 13:36:39.219637','8','Malvika Bajpai',2,'[{\"changed\": {\"fields\": [\"Bio\"]}}]',12,1),(20,'2025-08-06 13:36:58.622165','7','Ankit Sharma',2,'[{\"changed\": {\"fields\": [\"Research interests\"]}}]',12,1),(21,'2025-08-06 13:39:19.353270','9','Janvi',1,'[{\"added\": {}}]',12,1),(22,'2025-08-06 13:40:04.891896','10','Yukti Prasad',1,'[{\"added\": {}}]',12,1),(23,'2025-08-06 13:40:14.994735','9','Janvi',2,'[{\"changed\": {\"fields\": [\"Bio\", \"Research interests\"]}}]',12,1),(24,'2025-08-06 13:41:47.752911','11','Himanshu Badoni',1,'[{\"added\": {}}]',12,1),(25,'2025-08-06 13:42:17.379156','11','Himanshu Badoni',2,'[{\"changed\": {\"fields\": [\"Linkedin link\"]}}]',12,1),(26,'2025-08-06 13:47:02.910590','1','Tarun Sharma',2,'[{\"changed\": {\"fields\": [\"Bio\", \"Linkedin link\", \"Google scholar link\"]}}]',12,1),(27,'2025-08-06 13:51:35.305937','3','Arvind Singh Bisht',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',12,1),(28,'2025-08-06 13:58:34.451498','3','Integrated energy system modeling perspectives for future decarbonization pathways based on sector coupling, life-cycle emissions and vehicle-to-grid integration (2025)',1,'[{\"added\": {}}]',10,1),(29,'2025-08-06 17:11:28.419619','1','IDEEA workshop 2024',3,'',7,1),(30,'2025-08-06 17:13:02.034861','2','IDEEA workshop 2024',1,'[{\"added\": {}}]',7,1),(31,'2025-08-06 17:23:25.931040','2','IDEEA workshop 2024',2,'[]',7,1),(32,'2025-08-06 17:25:03.925708','1','werwefra',1,'[{\"added\": {}}]',9,1),(33,'2025-08-06 17:45:09.837259','1','Tarun Sharma',2,'[{\"changed\": {\"fields\": [\"Bio\"]}}]',12,1),(34,'2025-08-06 17:46:18.568216','8','Malvika Bajpai',2,'[{\"changed\": {\"fields\": [\"Bio\", \"Photo\"]}}]',12,1),(35,'2025-08-06 18:02:27.695974','2','Ashish Saraswat',2,'[{\"changed\": {\"fields\": [\"Bio\", \"Google scholar link\"]}}]',12,1),(36,'2025-08-06 18:02:45.677999','2','Ashish Saraswat',2,'[]',12,1),(37,'2025-08-06 18:03:04.620710','3','Arvind Singh Bisht',2,'[{\"changed\": {\"fields\": [\"Bio\"]}}]',12,1),(38,'2025-08-06 18:03:34.972901','8','Malvika Bajpai',2,'[{\"changed\": {\"fields\": [\"Bio\"]}}]',12,1),(39,'2025-08-07 04:58:11.220228','5','Sandeep Kumar',2,'[{\"changed\": {\"fields\": [\"Research interests\"]}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'lab','contact'),(7,'lab','event'),(8,'lab','news'),(9,'lab','opportunity'),(10,'lab','publication'),(11,'lab','researcharea'),(12,'lab','teammember'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-07-27 14:09:05.664549'),(2,'auth','0001_initial','2025-07-27 14:09:06.042137'),(3,'admin','0001_initial','2025-07-27 14:09:06.145144'),(4,'admin','0002_logentry_remove_auto_add','2025-07-27 14:09:06.150902'),(5,'admin','0003_logentry_add_action_flag_choices','2025-07-27 14:09:06.155803'),(6,'contenttypes','0002_remove_content_type_name','2025-07-27 14:09:06.233397'),(7,'auth','0002_alter_permission_name_max_length','2025-07-27 14:09:06.280642'),(8,'auth','0003_alter_user_email_max_length','2025-07-27 14:09:06.298013'),(9,'auth','0004_alter_user_username_opts','2025-07-27 14:09:06.304711'),(10,'auth','0005_alter_user_last_login_null','2025-07-27 14:09:06.358702'),(11,'auth','0006_require_contenttypes_0002','2025-07-27 14:09:06.360035'),(12,'auth','0007_alter_validators_add_error_messages','2025-07-27 14:09:06.365765'),(13,'auth','0008_alter_user_username_max_length','2025-07-27 14:09:06.424339'),(14,'auth','0009_alter_user_last_name_max_length','2025-07-27 14:09:06.472642'),(15,'auth','0010_alter_group_name_max_length','2025-07-27 14:09:06.488291'),(16,'auth','0011_update_proxy_permissions','2025-07-27 14:09:06.493708'),(17,'auth','0012_alter_user_first_name_max_length','2025-07-27 14:09:06.550760'),(18,'lab','0001_initial','2025-07-27 14:09:06.614229'),(19,'sessions','0001_initial','2025-07-27 14:09:06.636018'),(20,'lab','0002_contact','2025-07-27 14:34:50.804965'),(21,'lab','0003_alter_opportunity_options_and_more','2025-08-05 09:54:53.096358'),(22,'lab','0004_event_slug','2025-08-06 17:10:32.346467');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('kg0quwuzmar3rqwxeritmmw4mtnrehe2','.eJxVjMsOwiAQRf-FtSHlMbS4dO83kGEGpGogKe3K-O_apAvd3nPOfYmA21rC1tMSZhZnocTpd4tIj1R3wHestyap1XWZo9wVedAur43T83K4fwcFe_nWGtiSZW8nMDGzcQbyqDGiU0g5mQSeJ3IKIFqinMn5UWkGP8TBs0Xx_gDzdThq:1ug4CO:iFXfuJmgiHLrm9R8altgUSqcZgqt1kYqWhRgT3SaYjQ','2025-08-10 16:26:08.120776');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_contact`
--

DROP TABLE IF EXISTS `lab_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_contact`
--

LOCK TABLES `lab_contact` WRITE;
/*!40000 ALTER TABLE `lab_contact` DISABLE KEYS */;
INSERT INTO `lab_contact` VALUES (1,'ankit','ankit.ms@sric.iitr.ac.in','test','test msg','2025-07-27 16:22:07.757903'),(2,'ankit','ankit.ms@sric.iitr.ac.in','test','test msg','2025-07-27 16:23:10.471176'),(3,'ankit','ankit.ms@sric.iitr.ac.in','test','test msg','2025-07-27 16:24:06.107651'),(4,'ankit','ankit.ms@sric.iitr.ac.in','test','test msg1','2025-07-27 16:24:22.170719'),(5,'ankit','ankit.ms@sric.iitr.ac.in','test','test msg','2025-07-27 16:29:59.798556'),(6,'ashish','ashish@gmail.com','test msg 2','test 2','2025-07-27 17:29:34.045434'),(7,'test name','testmail@gmail.com','test subject','test msg','2025-08-05 18:23:27.362716'),(8,'test name','testmail@gmail.com','test subject','test msg 1','2025-08-05 18:24:45.119410');
/*!40000 ALTER TABLE `lab_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_event`
--

DROP TABLE IF EXISTS `lab_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime(6) NOT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_link` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_event`
--

LOCK TABLES `lab_event` WRITE;
/*!40000 ALTER TABLE `lab_event` DISABLE KEYS */;
INSERT INTO `lab_event` VALUES (2,'IDEEA workshop 2024','workshop','2024-09-01 10:00:00.000000','IIT ROORKEE','IDEEA workshop 2024 \r\nenergy system modelling','http://FIU90F80.COM','IDEEA-workshop-2024');
/*!40000 ALTER TABLE `lab_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_news`
--

DROP TABLE IF EXISTS `lab_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_news` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `featured_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_story_content` longtext COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_news`
--

LOCK TABLES `lab_news` WRITE;
/*!40000 ALTER TABLE `lab_news` DISABLE KEYS */;
INSERT INTO `lab_news` VALUES (1,'Shunya Lab Secures Major Grant for Renewable Energy Research','2025-08-06','Shunya Lab at IIT Roorkee has secured a major grant to expand its research on solar power integration into smart grids, focusing on creating more resilient and efficient energy systems.',1,'news/iisc1.jpeg','IIT Roorkee, July 20, 2025 — The \"Shunya Lab,\" an innovative research group within the Department of Management Studies, has been awarded a significant research grant to advance its work in renewable energy systems. The funding will support the development of cutting-edge algorithms and optimization models for integrating solar power and battery storage into decentralized grids.\r\n\r\nThis project, led by Prof. Tarun Sharma, aims to address the complexities of energy management in a rapidly changing climate. \"This grant is a testament to our team\'s hard work and dedication,\" said Prof. Sharma. \"It will allow us to accelerate our efforts in developing practical, India-centric solutions for a sustainable energy future.\"\r\n\r\nThe research will focus on several key areas, including:\r\n\r\nMaximizing energy efficiency in microgrids.\r\n\r\nPredictive modeling for solar energy generation.\r\n\r\nOptimizing supply chain logistics for renewable energy infrastructure.\r\n\r\nThe project is expected to run for three years and will involve a team of PhD scholars and research associates. The findings will be published in leading academic journals and shared with policymakers to inform national energy strategy.','shunya-lab-secures-major-grant-for-renewable-energy-research');
/*!40000 ALTER TABLE `lab_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_opportunity`
--

DROP TABLE IF EXISTS `lab_opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_opportunity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirements` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `application_link` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_opportunity`
--

LOCK TABLES `lab_opportunity` WRITE;
/*!40000 ALTER TABLE `lab_opportunity` DISABLE KEYS */;
INSERT INTO `lab_opportunity` VALUES (1,'werwefra','intern','ertrh  gfhty description','asfergt \r\nytjutyhtrh\r\nghfgt',1,'https://drive.google.com/drive/u/0/folders/1DCI6_lfHHiqM2EKGdPHLqpWEKGCJHMJ7','2025-08-23');
/*!40000 ALTER TABLE `lab_opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_publication`
--

DROP TABLE IF EXISTS `lab_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_publication` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authors` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pub_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `journal_conference` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int unsigned NOT NULL,
  `abstract` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `lab_publication_chk_1` CHECK ((`year` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_publication`
--

LOCK TABLES `lab_publication` WRITE;
/*!40000 ALTER TABLE `lab_publication` DISABLE KEYS */;
INSERT INTO `lab_publication` VALUES (1,'Indian power sector decarbonization: Net-zero by 2050 or 2070','Arvind Singh Bisht, Tarun Sharma','journal','Energy for Sustainable Development',2024,'The deep decarbonization of India\'s power sector, responsible for 40 % of national greenhouse gas emissions, is essential for meeting economy-wide net-zero targets. Understanding the current energy landscape requires assessing past achievements, leveraging resources, embracing technological advancements, and implementing effective policies. A thorough analysis is vital to identify gaps in achieving our Nationally Determined Contributions, ultimately facilitating net-zero goals. The urgency to mitigate emissions, heightened by climate-induced events and the need for renewable energy integration, calls for a reconsideration of net-zero timelines. Delayed action poses significant risks to ecosystems and economies globally. This paper explores how different pathways to net-zero emissions for power sector by 2050 & 2070 target years impact the future electricity mix, costs, generation profiles, and emission trajectories. We employ the energyRt optimization model, a bottom-up framework capturing regional, seasonal, and diurnal variations of renewable energy sources for thirty years, from 2020 to 2050. Preliminary analysis suggests current renewable resource estimations might not be sufficient for a 2050 net-zero goal. To meet the projected 6273 TWh demand by 2050, installed capacity would range from 2042 GW to 3100 GW. The base case emission trajectory reaches 2.4 GtCO2/year in 2050 with a grid emission factor of 0.369 tCO2/MWh. Achieving net-zero emissions by 2070 with CCS requires 33.37 % less investment than without CCS. The findings emerging from this analysis provide valuable insights into the power sector decarbonization pathways available to India in its pursuit of net-zero','https://www.sciencedirect.com/science/article/pii/S0973082624002631?via%3Dihub'),(2,'Market instrument for the first fuel and its role in decarbonizing Indian industrial production','Prashant Giri , Tarun Sharma','journal','Energy Policy',2024,'India introduced Perform, Achieve, and Trade (PAT) scheme in 2012; it assigns targets to energy-intensive industries with estimated energy savings of 11–16% to enhance energy efficiency and allows energy-saving certificates trading. We qualitatively review India\'s energy efficiency policy landscape, including the institutional structure, operational trajectory, and outcomes of the PAT scheme\'s completed cycles. We identify four research themes: 1) Industry-wise specific energy consumption correlation with various factors of the industrial sector under PAT should be identified; 2) PAT scheme impact on aluminium, chlor alkali, textile, etc. Lacks exploration; 3) Realistic baseline target setting should be done for designated consumers under PAT scheme, and 4) machine learning based monitoring and verification for PAT scheme is still nascent but appears promising. We find a lack of ambition in the targets, which are easily met and could harm future investments in energy efficiency.','https://www.sciencedirect.com/science/article/pii/S0301421524001599?via%3Dihub'),(3,'Integrated energy system modeling perspectives for future decarbonization pathways based on sector coupling, life-cycle emissions and vehicle-to-grid integration','Anu Agarwal, Tarun Sharma','journal','Renewable and Sustainable Energy Reviews',2025,'The impending environmental crisis has propelled the global energy sector into radical transformation. Variable renewable energy necessitates unprecedented flexibility, transcending energy needs. Decarbonization is critical to achieving sustainable development goals on clean energy and climate action, creating a healthier planet for all. This critical review of current energy system modeling advocates integrated-whole-energy-system models as vital tools for generating diverse energy and policy-related insights. Sector-coupling is investigated, exploring the complex interplay between power, gas, transport, and heating. Nine challenges are delineated: Uncertainty, Renewable integration, Transparency and open-access, High-resolution modeling, Sector-coupling, Flexibility, Technological representation, Life-cycle emissions, and Social and human factors, while offering strategies for their resolution. This review envisions a future powered by renewables, achieving 50 % emissions and 30 % water usage reductions within a decade. The life cycle assessment integration can result in up to 80 % reductions in emissions; however, the cost may increase up to 40–60 %. Emerging technologies like green hydrogen and vehicle-to-grid (V2G) are vital drivers. Green hydrogen offers flexible storage and distribution while V2G transforms electric vehicles into prosumers, enabling grid flexibility and demand management, with studies demonstrating 20–50 % cost reductions and 65 % peak load reduction. A case study for the future decarbonization of the Indian power sector is presented in 19 scenarios based on recent studies, demonstrating the dominant role of solar and wind energy with around 55 % and 22 % share in 2050. This review pinpoints crucial research gaps, identifies successful strategies, and proposes new avenues to guide the energy sector toward a sustainable, low-carbon future.','https://www.sciencedirect.com/science/article/pii/S136403212500293X');
/*!40000 ALTER TABLE `lab_publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_researcharea`
--

DROP TABLE IF EXISTS `lab_researcharea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_researcharea` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_researcharea`
--

LOCK TABLES `lab_researcharea` WRITE;
/*!40000 ALTER TABLE `lab_researcharea` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_researcharea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_teammember`
--

DROP TABLE IF EXISTS `lab_teammember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_teammember` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `research_interests` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_scholar_link` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin_link` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_teammember`
--

LOCK TABLES `lab_teammember` WRITE;
/*!40000 ALTER TABLE `lab_teammember` DISABLE KEYS */;
INSERT INTO `lab_teammember` VALUES (1,'Tarun Sharma','Assistant Professor','director','Dr. Tarun Sharma is an Assistant Professor at the Indian Institute of Technology (IIT) Roorkee, where he serves as a Principal Investigator and Project Leader. He leads a research group focused on developing analytical workflows for energy system analysis, with expertise in data collation, modeling, and comprehensive energy assessments. His team’s work actively engages key stakeholders in government and industry, adapting analytical capabilities to meet specific sectoral needs. Dr. Sharma is proficient in R and Julia for programming, with additional expertise in reviewing and querying scripts and data artifacts in Python and GAMS, enhancing the precision and impact of his research contributions.','team/PROF._TARUN.jpeg','Energy Modelling and Policy, Sustainability transitions, Applied Operations Research','https://scholar.google.com/citations?user=3t96ziQAAAAJ&hl=en','https://www.linkedin.com/in/drtarunsharma/'),(2,'Ashish Saraswat','Research Scholar','phd','Ashish Saraswat is a PhD candidate in Operations Management at IIT Roorkee’s Department of Management Studies','team/ashish.jpeg','Demand Side Management , Electricity Market','https://scholar.google.com/citations?user=zAHxsDQAAAAJ&hl=en&oi=ao','https://www.linkedin.com/in/ashish-saraswat-112296137/'),(3,'Arvind Singh Bisht','Postdoctoral Fellow','postdoc','Dr. Arvind Singh Bisht is an energy professional with a strong academic foundation, holding a Ph.D. in Energy','team/file_00000000f4f061f99173df2699bf7731.png','energy transition ,  decarbonization','https://scholar.google.com/citations?user=uDA5EagAAAAJ&hl=en','https://www.linkedin.com/in/arvind-singh-bisht-7411021bb/'),(4,'Anu Agarwal','Senior Research Scholar','phd','Energy System Modeler','team/anu_agarwal.jpeg','Energy System Modelling','','https://www.linkedin.com/in/anu-agarwal-5ab905287/'),(5,'Sandeep Kumar','Research Scholar','phd','Research Scholar (Operations Management ) | IIT Roorkee |','team/sandeep.jpeg','Decarbonising Hard-to-Abate Sector','','https://www.linkedin.com/in/sandeep-kumar-a5aa39104/'),(6,'Prashant Giri','Research Scholar','phd','Research Scholar at Indian Institute of Technology Roorkee','team/prashant.jpeg','Energy Policy • Energy Efficiency • Energy Modeling • SAP Plant Maintenance(SAP PM) • SAP Materials Management (SAP MM)','https://scholar.google.com/citations?user=Hz_nY-0AAAAJ&hl=en','https://www.linkedin.com/in/prashant-giri-87447a1b/'),(7,'Ankit Sharma','Project Associate','associate','Project Associate(IITR) | Energy System Modeller | Carbon Market & Sustainability Analyst','team/ankit.jpeg','Decarbonization • Energy Modeling , Data Analysis','','https://www.linkedin.com/in/ankitsharma56/'),(8,'Malvika Bajpai','Project Associate','associate','Malvika Bajpai is a Project Associate and Energy Modeler at the Indian Institute of Technology (IIT) Roorkee.','team/malvika.jpeg','Energy Modelling','',''),(9,'Janvi','Research Scholar','phd','.....','team/janvi.jpeg','......','',''),(10,'Yukti Prasad','Research Scholar','phd','....','team/yukti.jpeg','....','',''),(11,'Himanshu Badoni','Research Scholar','phd','Assistant Engineer @UPCL','team/himanshu_badoni.jpeg','....','','https://www.linkedin.com/in/himanshu-badoni-1736268a/');
/*!40000 ALTER TABLE `lab_teammember` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-07 12:06:28
