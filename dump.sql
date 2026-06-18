-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: autogarage
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.2

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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Auto',1,'add_auto'),(2,'Can change Auto',1,'change_auto'),(3,'Can delete Auto',1,'delete_auto'),(4,'Can view Auto',1,'view_auto'),(5,'Can add Fornitore',2,'add_fornitore'),(6,'Can change Fornitore',2,'change_fornitore'),(7,'Can delete Fornitore',2,'delete_fornitore'),(8,'Can view Fornitore',2,'view_fornitore'),(9,'Can add Sede',8,'add_sede'),(10,'Can change Sede',8,'change_sede'),(11,'Can delete Sede',8,'delete_sede'),(12,'Can view Sede',8,'view_sede'),(13,'Can add Utente',10,'add_utente'),(14,'Can change Utente',10,'change_utente'),(15,'Can delete Utente',10,'delete_utente'),(16,'Can view Utente',10,'view_utente'),(17,'Can add Fornitura',3,'add_fornitura'),(18,'Can change Fornitura',3,'change_fornitura'),(19,'Can delete Fornitura',3,'delete_fornitura'),(20,'Can view Fornitura',3,'view_fornitura'),(21,'Can add Test drive',9,'add_testdrive'),(22,'Can change Test drive',9,'change_testdrive'),(23,'Can delete Test drive',9,'delete_testdrive'),(24,'Can view Test drive',9,'view_testdrive'),(25,'Can add Noleggio',6,'add_noleggio'),(26,'Can change Noleggio',6,'change_noleggio'),(27,'Can delete Noleggio',6,'delete_noleggio'),(28,'Can view Noleggio',6,'view_noleggio'),(29,'Can add Intervento',5,'add_intervento'),(30,'Can change Intervento',5,'change_intervento'),(31,'Can delete Intervento',5,'delete_intervento'),(32,'Can view Intervento',5,'view_intervento'),(33,'Can add Vendita',11,'add_vendita'),(34,'Can change Vendita',11,'change_vendita'),(35,'Can delete Vendita',11,'delete_vendita'),(36,'Can view Vendita',11,'view_vendita'),(37,'Can add Recensione',7,'add_recensione'),(38,'Can change Recensione',7,'change_recensione'),(39,'Can delete Recensione',7,'delete_recensione'),(40,'Can view Recensione',7,'view_recensione'),(41,'Can add Impiego',4,'add_impiego'),(42,'Can change Impiego',4,'change_impiego'),(43,'Can delete Impiego',4,'delete_impiego'),(44,'Can view Impiego',4,'view_impiego'),(45,'Can add log entry',12,'add_logentry'),(46,'Can change log entry',12,'change_logentry'),(47,'Can delete log entry',12,'delete_logentry'),(48,'Can view log entry',12,'view_logentry'),(49,'Can add permission',14,'add_permission'),(50,'Can change permission',14,'change_permission'),(51,'Can delete permission',14,'delete_permission'),(52,'Can view permission',14,'view_permission'),(53,'Can add group',13,'add_group'),(54,'Can change group',13,'change_group'),(55,'Can delete group',13,'delete_group'),(56,'Can view group',13,'view_group'),(57,'Can add user',15,'add_user'),(58,'Can change user',15,'change_user'),(59,'Can delete user',15,'delete_user'),(60,'Can view user',15,'view_user'),(61,'Can add content type',16,'add_contenttype'),(62,'Can change content type',16,'change_contenttype'),(63,'Can delete content type',16,'delete_contenttype'),(64,'Can view content type',16,'view_contenttype'),(65,'Can add session',17,'add_session'),(66,'Can change session',17,'change_session'),(67,'Can delete session',17,'delete_session'),(68,'Can view session',17,'view_session');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (12,'admin','logentry'),(13,'auth','group'),(14,'auth','permission'),(15,'auth','user'),(16,'contenttypes','contenttype'),(1,'garage','auto'),(2,'garage','fornitore'),(3,'garage','fornitura'),(4,'garage','impiego'),(5,'garage','intervento'),(6,'garage','noleggio'),(7,'garage','recensione'),(8,'garage','sede'),(9,'garage','testdrive'),(10,'garage','utente'),(11,'garage','vendita'),(17,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-06-18 10:22:43.552658'),(2,'auth','0001_initial','2026-06-18 10:22:48.079787'),(3,'admin','0001_initial','2026-06-18 10:22:48.961823'),(4,'admin','0002_logentry_remove_auto_add','2026-06-18 10:22:48.990933'),(5,'admin','0003_logentry_add_action_flag_choices','2026-06-18 10:22:49.021180'),(6,'contenttypes','0002_remove_content_type_name','2026-06-18 10:22:49.695593'),(7,'auth','0002_alter_permission_name_max_length','2026-06-18 10:22:50.062097'),(8,'auth','0003_alter_user_email_max_length','2026-06-18 10:22:50.140422'),(9,'auth','0004_alter_user_username_opts','2026-06-18 10:22:50.163216'),(10,'auth','0005_alter_user_last_login_null','2026-06-18 10:22:50.439460'),(11,'auth','0006_require_contenttypes_0002','2026-06-18 10:22:50.458706'),(12,'auth','0007_alter_validators_add_error_messages','2026-06-18 10:22:50.488686'),(13,'auth','0008_alter_user_username_max_length','2026-06-18 10:22:49.256702'),(14,'auth','0009_alter_user_last_name_max_length','2026-06-18 10:22:49.721793'),(15,'auth','0010_alter_group_name_max_length','2026-06-18 10:22:49.780045'),(16,'auth','0011_update_proxy_permissions','2026-06-18 10:22:49.808028'),(17,'auth','0012_alter_user_first_name_max_length','2026-06-18 10:22:50.171789'),(18,'garage','0001_initial','2026-06-18 10:22:59.073486'),(19,'sessions','0001_initial','2026-06-18 10:22:59.375348');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_auto`
--

DROP TABLE IF EXISTS `garage_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_auto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(100) NOT NULL,
  `modello` varchar(100) NOT NULL,
  `anno` int NOT NULL,
  `chilometraggio` int NOT NULL,
  `alimentazione` varchar(50) NOT NULL,
  `cambio` varchar(50) NOT NULL,
  `colore` varchar(50) NOT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `tipo_auto` varchar(20) NOT NULL,
  `stato` varchar(20) NOT NULL,
  `sede_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `garage_auto_sede_id_5b6c4ed9_fk_garage_sede_id` (`sede_id`),
  CONSTRAINT `garage_auto_sede_id_5b6c4ed9_fk_garage_sede_id` FOREIGN KEY (`sede_id`) REFERENCES `garage_sede` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_auto`
--

LOCK TABLES `garage_auto` WRITE;
/*!40000 ALTER TABLE `garage_auto` DISABLE KEYS */;
INSERT INTO `garage_auto` VALUES (1,'Fiat','Panda',2024,0,'benzina','manuale','bianco',15500.00,'nuova','venduta',1),(2,'Fiat','500',2023,0,'ibrida','manuale','rosso',18900.00,'nuova','disponibile',1),(3,'Jeep','Renegade',2022,28000,'diesel','automatico','nero',24500.00,'usata','venduta',1),(4,'Alfa Romeo','Tonale',2024,0,'ibrida','automatico','grigio',38900.00,'nuova','disponibile',1),(5,'Volkswagen','Golf',2021,42000,'diesel','manuale','blu',21900.00,'usata','disponibile',1),(6,'Volkswagen','T-Roc',2024,0,'benzina','automatico','bianco',31500.00,'nuova','venduta',1),(7,'Audi','A3',2020,55000,'diesel','automatico','nero',24900.00,'usata','disponibile',1),(8,'Audi','Q2',2024,0,'benzina','automatico','grigio',33500.00,'nuova','noleggiata',1),(9,'BMW','Serie 1',2021,39000,'diesel','automatico','blu',26900.00,'usata','disponibile',1),(10,'BMW','X1',2024,0,'ibrida','automatico','nero',42900.00,'nuova','noleggiata',1),(11,'Mercedes','Classe A',2020,61000,'diesel','automatico','argento',25900.00,'usata','disponibile',1),(12,'Mercedes','GLA',2024,0,'benzina','automatico','bianco',45900.00,'nuova','disponibile',1),(13,'Jeep','Compass',2021,47000,'diesel','automatico','verde',27900.00,'usata','disponibile',1),(14,'Fiat','Tipo',2020,68000,'diesel','manuale','grigio',13900.00,'usata','disponibile',2),(15,'Fiat','600',2024,0,'ibrida','automatico','arancione',24900.00,'nuova','venduta',2),(16,'Volkswagen','Polo',2021,51000,'benzina','manuale','blu',14900.00,'usata','disponibile',2),(17,'Audi','A1',2024,0,'benzina','automatico','nero',27900.00,'nuova','noleggiata',2),(18,'BMW','Serie 3',2020,72000,'diesel','automatico','bianco',29900.00,'usata','disponibile',2),(19,'Mercedes','CLA',2024,0,'ibrida','automatico','grigio',41900.00,'nuova','noleggiata',2),(20,'Alfa Romeo','Giulia',2021,59000,'diesel','automatico','rosso',31900.00,'usata','disponibile',2),(21,'Fiat','Panda',2022,35000,'benzina','manuale','bianco',12900.00,'usata','disponibile',3),(22,'Jeep','Avenger',2024,0,'elettrica','automatico','giallo',37900.00,'nuova','disponibile',3),(23,'Volkswagen','Tiguan',2020,80000,'diesel','automatico','nero',26900.00,'usata','venduta',3),(24,'Audi','Q3',2024,0,'benzina','automatico','grigio',44900.00,'nuova','noleggiata',3),(25,'BMW','X3',2021,62000,'diesel','automatico','blu',38900.00,'usata','disponibile',3),(26,'Mercedes','Classe C',2024,0,'ibrida','automatico','argento',52900.00,'nuova','venduta',3),(27,'Alfa Romeo','Stelvio',2020,76000,'diesel','automatico','nero',34900.00,'usata','disponibile',3),(28,'Fiat','500X',2024,0,'benzina','manuale','verde',25900.00,'nuova','disponibile',3),(29,'Volkswagen','Passat',2021,70000,'diesel','automatico','grigio',23900.00,'usata','noleggiata',3),(30,'BMW','Serie 5',2024,0,'ibrida','automatico','nero',61900.00,'nuova','disponibile',3);
/*!40000 ALTER TABLE `garage_auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_fornitore`
--

DROP TABLE IF EXISTS `garage_fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_fornitore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `partita_iva` varchar(20) NOT NULL,
  `indirizzo` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partita_iva` (`partita_iva`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_fornitore`
--

LOCK TABLES `garage_fornitore` WRITE;
/*!40000 ALTER TABLE `garage_fornitore` DISABLE KEYS */;
INSERT INTO `garage_fornitore` VALUES (1,'Stellantis','11111111111','Corso Agnelli 200, Torino','0111111111','stellantis@fornitori.it'),(2,'Volkswagen Group Italia','22222222222','Viale G. R. Gumpert 1, Verona','0451111111','volkswagen@fornitori.it'),(3,'BMW Italia','33333333333','Via dell\'Unione Europea 1, San Donato Milanese','0211111111','bmw@fornitori.it'),(4,'Mercedes-Benz Italia','44444444444','Via Giulio Vincenzo Bona 110, Roma','0611111111','mercedes@fornitori.it');
/*!40000 ALTER TABLE `garage_fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_fornitura`
--

DROP TABLE IF EXISTS `garage_fornitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_fornitura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_fornitura` date NOT NULL,
  `prezzo_acquisto` decimal(10,2) NOT NULL,
  `auto_id` int NOT NULL,
  `fornitore_id` int NOT NULL,
  `sede_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auto_id` (`auto_id`),
  KEY `garage_fornitura_fornitore_id_669230fc_fk_garage_fornitore_id` (`fornitore_id`),
  KEY `garage_fornitura_sede_id_a9c90a22_fk_garage_sede_id` (`sede_id`),
  CONSTRAINT `garage_fornitura_auto_id_21d73d25_fk_garage_auto_id` FOREIGN KEY (`auto_id`) REFERENCES `garage_auto` (`id`),
  CONSTRAINT `garage_fornitura_fornitore_id_669230fc_fk_garage_fornitore_id` FOREIGN KEY (`fornitore_id`) REFERENCES `garage_fornitore` (`id`),
  CONSTRAINT `garage_fornitura_sede_id_a9c90a22_fk_garage_sede_id` FOREIGN KEY (`sede_id`) REFERENCES `garage_sede` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_fornitura`
--

LOCK TABLES `garage_fornitura` WRITE;
/*!40000 ALTER TABLE `garage_fornitura` DISABLE KEYS */;
INSERT INTO `garage_fornitura` VALUES (1,'2025-01-10',12090.00,1,1,1),(2,'2025-01-15',14742.00,2,1,1),(3,'2025-01-20',19110.00,3,1,1),(4,'2025-01-25',30342.00,4,1,1),(5,'2025-01-30',17082.00,5,2,1),(6,'2025-02-04',24570.00,6,2,1),(7,'2025-02-09',19422.00,7,2,1),(8,'2025-02-14',26130.00,8,2,1),(9,'2025-02-19',20982.00,9,3,1),(10,'2025-02-24',33462.00,10,3,1),(11,'2025-03-01',20202.00,11,4,1),(12,'2025-03-06',35802.00,12,4,1),(13,'2025-03-11',21762.00,13,1,1),(14,'2025-03-16',10842.00,14,1,2),(15,'2025-03-21',19422.00,15,1,2),(16,'2025-03-26',11622.00,16,2,2),(17,'2025-03-31',21762.00,17,2,2),(18,'2025-04-05',23322.00,18,3,2),(19,'2025-04-10',32682.00,19,4,2),(20,'2025-04-15',24882.00,20,1,2),(21,'2025-04-20',10062.00,21,1,3),(22,'2025-04-25',29562.00,22,1,3),(23,'2025-04-30',20982.00,23,2,3),(24,'2025-05-05',35022.00,24,2,3),(25,'2025-05-10',30342.00,25,3,3),(26,'2025-05-15',41262.00,26,4,3),(27,'2025-05-20',27222.00,27,1,3),(28,'2025-05-25',20202.00,28,1,3),(29,'2025-05-30',18642.00,29,2,3),(30,'2025-06-04',48282.00,30,3,3);
/*!40000 ALTER TABLE `garage_fornitura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_impiego`
--

DROP TABLE IF EXISTS `garage_impiego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_impiego` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sede_id` int NOT NULL,
  `dipendente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `garage_impiego_dipendente_id_sede_id_e6831e24_uniq` (`dipendente_id`,`sede_id`),
  KEY `garage_impiego_sede_id_eae06e2a_fk_garage_sede_id` (`sede_id`),
  CONSTRAINT `garage_impiego_dipendente_id_db49af74_fk_garage_utente_id` FOREIGN KEY (`dipendente_id`) REFERENCES `garage_utente` (`id`),
  CONSTRAINT `garage_impiego_sede_id_eae06e2a_fk_garage_sede_id` FOREIGN KEY (`sede_id`) REFERENCES `garage_sede` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_impiego`
--

LOCK TABLES `garage_impiego` WRITE;
/*!40000 ALTER TABLE `garage_impiego` DISABLE KEYS */;
INSERT INTO `garage_impiego` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,7),(6,2,8),(7,2,9),(8,2,10),(9,3,13),(10,3,14),(11,3,15),(12,3,16);
/*!40000 ALTER TABLE `garage_impiego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_intervento`
--

DROP TABLE IF EXISTS `garage_intervento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_intervento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_intervento` date NOT NULL,
  `tipo_intervento` varchar(100) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `auto_id` int NOT NULL,
  `meccanico_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `garage_intervento_auto_id_aecb3ac8_fk_garage_auto_id` (`auto_id`),
  KEY `garage_intervento_meccanico_id_b9973276_fk_garage_utente_id` (`meccanico_id`),
  CONSTRAINT `garage_intervento_auto_id_aecb3ac8_fk_garage_auto_id` FOREIGN KEY (`auto_id`) REFERENCES `garage_auto` (`id`),
  CONSTRAINT `garage_intervento_meccanico_id_b9973276_fk_garage_utente_id` FOREIGN KEY (`meccanico_id`) REFERENCES `garage_utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_intervento`
--

LOCK TABLES `garage_intervento` WRITE;
/*!40000 ALTER TABLE `garage_intervento` DISABLE KEYS */;
INSERT INTO `garage_intervento` VALUES (1,'2025-10-20','Tagliando',180.00,2,3),(2,'2025-10-24','Cambio gomme',320.00,7,4),(3,'2025-10-28','Diagnostica motore',120.00,14,9),(4,'2025-11-02','Sostituzione freni',410.00,20,10),(5,'2025-11-06','Controllo batteria',90.00,21,15),(6,'2025-11-10','Revisione generale',250.00,27,16);
/*!40000 ALTER TABLE `garage_intervento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_noleggio`
--

DROP TABLE IF EXISTS `garage_noleggio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_noleggio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  `costo_giornaliero` decimal(10,2) NOT NULL,
  `costo_totale` decimal(10,2) NOT NULL,
  `auto_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `venditore_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `garage_noleggio_auto_id_16dd2a98_fk_garage_auto_id` (`auto_id`),
  KEY `garage_noleggio_cliente_id_cf5d042a_fk_garage_utente_id` (`cliente_id`),
  KEY `garage_noleggio_venditore_id_40201dd7_fk_garage_utente_id` (`venditore_id`),
  CONSTRAINT `garage_noleggio_auto_id_16dd2a98_fk_garage_auto_id` FOREIGN KEY (`auto_id`) REFERENCES `garage_auto` (`id`),
  CONSTRAINT `garage_noleggio_cliente_id_cf5d042a_fk_garage_utente_id` FOREIGN KEY (`cliente_id`) REFERENCES `garage_utente` (`id`),
  CONSTRAINT `garage_noleggio_venditore_id_40201dd7_fk_garage_utente_id` FOREIGN KEY (`venditore_id`) REFERENCES `garage_utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_noleggio`
--

LOCK TABLES `garage_noleggio` WRITE;
/*!40000 ALTER TABLE `garage_noleggio` DISABLE KEYS */;
INSERT INTO `garage_noleggio` VALUES (1,'2025-11-01','2025-11-05',65.00,325.00,8,5,2),(2,'2025-11-07','2025-11-10',80.00,320.00,10,6,1),(3,'2025-11-12','2025-11-16',55.00,275.00,17,11,8),(4,'2025-11-18','2025-11-21',75.00,300.00,19,12,7),(5,'2025-12-01','2025-12-04',85.00,340.00,24,17,14),(6,'2025-12-06','2025-12-09',70.00,280.00,29,18,13);
/*!40000 ALTER TABLE `garage_noleggio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_recensione`
--

DROP TABLE IF EXISTS `garage_recensione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_recensione` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voto` int NOT NULL,
  `commento` longtext NOT NULL,
  `auto_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `garage_recensione_cliente_id_auto_id_0d6ceb6a_uniq` (`cliente_id`,`auto_id`),
  KEY `garage_recensione_auto_id_5c274b13_fk_garage_auto_id` (`auto_id`),
  CONSTRAINT `garage_recensione_auto_id_5c274b13_fk_garage_auto_id` FOREIGN KEY (`auto_id`) REFERENCES `garage_auto` (`id`),
  CONSTRAINT `garage_recensione_cliente_id_3e8c20b6_fk_garage_utente_id` FOREIGN KEY (`cliente_id`) REFERENCES `garage_utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_recensione`
--

LOCK TABLES `garage_recensione` WRITE;
/*!40000 ALTER TABLE `garage_recensione` DISABLE KEYS */;
INSERT INTO `garage_recensione` VALUES (1,5,'Auto perfetta per la città, personale molto disponibile.',1,5),(2,5,'Ottima esperienza di acquisto e venditore molto chiaro.',3,6),(3,4,'Auto consegnata rapidamente e in ottime condizioni.',15,11),(4,4,'Test drive organizzato bene, personale gentile.',18,12),(5,5,'Sono molto soddisfatto dell\'acquisto.',23,17),(6,3,'Buona auto, tempi di consegna un po\' lunghi.',26,18);
/*!40000 ALTER TABLE `garage_recensione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_sede`
--

DROP TABLE IF EXISTS `garage_sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_sede` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `indirizzo` varchar(200) NOT NULL,
  `citta` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_sede`
--

LOCK TABLES `garage_sede` WRITE;
/*!40000 ALTER TABLE `garage_sede` DISABLE KEYS */;
INSERT INTO `garage_sede` VALUES (1,'AutoGarage Napoli','Via Toledo 120','Napoli','0811111111','napoli@autogarage.it'),(2,'AutoGarage Caserta','Viale Carlo III 45','Caserta','0823111111','caserta@autogarage.it'),(3,'AutoGarage Salerno','Corso Garibaldi 88','Salerno','0891111111','salerno@autogarage.it');
/*!40000 ALTER TABLE `garage_sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_testdrive`
--

DROP TABLE IF EXISTS `garage_testdrive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_testdrive` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_test_drive` date NOT NULL,
  `auto_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `venditore_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `garage_testdrive_auto_id_dbff1a40_fk_garage_auto_id` (`auto_id`),
  KEY `garage_testdrive_cliente_id_3570d8f9_fk_garage_utente_id` (`cliente_id`),
  KEY `garage_testdrive_venditore_id_80dfe3d4_fk_garage_utente_id` (`venditore_id`),
  CONSTRAINT `garage_testdrive_auto_id_dbff1a40_fk_garage_auto_id` FOREIGN KEY (`auto_id`) REFERENCES `garage_auto` (`id`),
  CONSTRAINT `garage_testdrive_cliente_id_3570d8f9_fk_garage_utente_id` FOREIGN KEY (`cliente_id`) REFERENCES `garage_utente` (`id`),
  CONSTRAINT `garage_testdrive_venditore_id_80dfe3d4_fk_garage_utente_id` FOREIGN KEY (`venditore_id`) REFERENCES `garage_utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_testdrive`
--

LOCK TABLES `garage_testdrive` WRITE;
/*!40000 ALTER TABLE `garage_testdrive` DISABLE KEYS */;
INSERT INTO `garage_testdrive` VALUES (1,'2025-12-10',4,5,1),(2,'2025-12-11',5,6,2),(3,'2025-12-12',16,11,7),(4,'2025-12-13',18,12,8),(5,'2025-12-14',22,17,13),(6,'2025-12-15',25,18,14);
/*!40000 ALTER TABLE `garage_testdrive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_utente`
--

DROP TABLE IF EXISTS `garage_utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_utente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `ruolo` varchar(20) NOT NULL,
  `codice_fiscale` varchar(16) DEFAULT NULL,
  `stipendio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `codice_fiscale` (`codice_fiscale`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_utente`
--

LOCK TABLES `garage_utente` WRITE;
/*!40000 ALTER TABLE `garage_utente` DISABLE KEYS */;
INSERT INTO `garage_utente` VALUES (1,'Marco','Esposito','marco.esposito@autogarage.it','Venditore2026!','3330000000','venditore',NULL,1800.00),(2,'Giulia','Romano','giulia.romano@autogarage.it','Venditore2026!','3330000000','venditore',NULL,1850.00),(3,'Antonio','Russo','antonio.russo@autogarage.it','Meccanico2026!','3330000000','meccanico',NULL,1700.00),(4,'Giuseppe','De Luca','giuseppe.deluca@autogarage.it','Meccanico2026!','3330000000','meccanico',NULL,1750.00),(5,'Francesco','Greco','francesco.greco@email.it','Cliente2026!','3330000000','cliente','GRCFNC90A01F839A',NULL),(6,'Sara','Lombardi','sara.lombardi@email.it','Cliente2026!','3330000000','cliente','LMBSRA92B41F839B',NULL),(7,'Davide','Coppola','davide.coppola@autogarage.it','Venditore2026!','3330000000','venditore',NULL,1900.00),(8,'Martina','Ricci','martina.ricci@autogarage.it','Venditore2026!','3330000000','venditore',NULL,1880.00),(9,'Vincenzo','Marino','vincenzo.marino@autogarage.it','Meccanico2026!','3330000000','meccanico',NULL,1800.00),(10,'Raffaele','Vitale','raffaele.vitale@autogarage.it','Meccanico2026!','3330000000','meccanico',NULL,1780.00),(11,'Andrea','Gallo','andrea.gallo@email.it','Cliente2026!','3330000000','cliente','GLLNDR91C12B963C',NULL),(12,'Alessia','Bruno','alessia.bruno@email.it','Cliente2026!','3330000000','cliente','BRNLSS93D52B963D',NULL),(13,'Alessio','Caruso','alessio.caruso@autogarage.it','Venditore2026!','3330000000','venditore',NULL,2000.00),(14,'Chiara','Ferrara','chiara.ferrara@autogarage.it','Venditore2026!','3330000000','venditore',NULL,1950.00),(15,'Fabio','Conte','fabio.conte@autogarage.it','Meccanico2026!','3330000000','meccanico',NULL,1900.00),(16,'Carmine','Santoro','carmine.santoro@autogarage.it','Meccanico2026!','3330000000','meccanico',NULL,1850.00),(17,'Roberto','Leone','roberto.leone@email.it','Cliente2026!','3330000000','cliente','LNERRT89E15H703E',NULL),(18,'Matteo','Serra','matteo.serra@email.it','Cliente2026!','3330000000','cliente','SRRMTT88F20H703F',NULL);
/*!40000 ALTER TABLE `garage_utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage_vendita`
--

DROP TABLE IF EXISTS `garage_vendita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage_vendita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_vendita` date NOT NULL,
  `auto_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `venditore_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auto_id` (`auto_id`),
  KEY `garage_vendita_cliente_id_6fa05bc9_fk_garage_utente_id` (`cliente_id`),
  KEY `garage_vendita_venditore_id_335dddc4_fk_garage_utente_id` (`venditore_id`),
  CONSTRAINT `garage_vendita_auto_id_c4b1ae88_fk_garage_auto_id` FOREIGN KEY (`auto_id`) REFERENCES `garage_auto` (`id`),
  CONSTRAINT `garage_vendita_cliente_id_6fa05bc9_fk_garage_utente_id` FOREIGN KEY (`cliente_id`) REFERENCES `garage_utente` (`id`),
  CONSTRAINT `garage_vendita_venditore_id_335dddc4_fk_garage_utente_id` FOREIGN KEY (`venditore_id`) REFERENCES `garage_utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage_vendita`
--

LOCK TABLES `garage_vendita` WRITE;
/*!40000 ALTER TABLE `garage_vendita` DISABLE KEYS */;
INSERT INTO `garage_vendita` VALUES (1,'2025-09-10',1,5,1),(2,'2025-09-18',3,6,2),(3,'2025-10-02',6,5,1),(4,'2025-10-08',15,11,7),(5,'2025-10-15',23,17,13),(6,'2025-11-03',26,18,14);
/*!40000 ALTER TABLE `garage_vendita` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-18 12:35:58
