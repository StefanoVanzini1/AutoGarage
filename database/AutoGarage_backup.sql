-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: AutoGarage
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `Auto`
--

DROP TABLE IF EXISTS `Auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Auto` (
  `id_auto` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  `modello` varchar(50) NOT NULL,
  `anno` int NOT NULL,
  `chilometraggio` int NOT NULL,
  `alimentazione` varchar(30) NOT NULL,
  `cambio` varchar(30) NOT NULL,
  `colore` varchar(30) NOT NULL,
  `prezzo` int NOT NULL,
  `tipo_auto` varchar(10) NOT NULL,
  `stato` varchar(20) NOT NULL,
  PRIMARY KEY (`id_auto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auto`
--

LOCK TABLES `Auto` WRITE;
/*!40000 ALTER TABLE `Auto` DISABLE KEYS */;
INSERT INTO `Auto` VALUES (1,'Fiat','500',2022,12000,'benzina','manuale','bianco',15000,'usata','disponibile'),(2,'Volkswagen','Golf',2023,0,'diesel','automatico','nero',28000,'nuova','disponibile'),(3,'Toyota','Yaris',2021,25000,'ibrida','automatico','rosso',18000,'usata','disponibile'),(4,'BMW','Serie 1',2020,40000,'diesel','automatico','grigio',26000,'usata','venduta'),(5,'Renault','Clio',2019,55000,'benzina','manuale','blu',12000,'usata','in_manutenzione'),(6,'Audi','A3',2022,18000,'diesel','automatico','nero',30000,'usata','in_manutenzione'),(7,'Ford','Puma',2024,0,'benzina','manuale','verde',24000,'nuova','disponibile'),(8,'Peugeot','208',2021,30000,'benzina','manuale','giallo',16000,'usata','disponibile'),(9,'Mercedes','Classe A',2023,8000,'ibrida','automatico','bianco',35000,'usata','venduta'),(10,'Opel','Corsa',2020,45000,'benzina','manuale','rosso',11000,'usata','in_manutenzione');
/*!40000 ALTER TABLE `Auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `id_utente` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `codice_fiscale` varchar(20) NOT NULL,
  PRIMARY KEY (`id_utente`),
  UNIQUE KEY `codice_fiscale` (`codice_fiscale`),
  CONSTRAINT `Cliente_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `Utente` (`id_utente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'Mario','Rossi','3331112222','RSSMRA90A01H501U'),(2,'Lucia','Bianchi','3332223333','BNCLCU92B41F205K'),(3,'Andrea','Verdi','3334445555','VRDNDR88C12L219P'),(4,'Elena','Gallo','3335556666','GLLLNE95D45H501X'),(5,'Francesco','Riva','3337778888','RVAFNC89E21F205Z');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dipendente`
--

DROP TABLE IF EXISTS `Dipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dipendente` (
  `id_utente` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ruolo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_utente`),
  CONSTRAINT `Dipendente_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `Utente` (`id_utente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dipendente`
--

LOCK TABLES `Dipendente` WRITE;
/*!40000 ALTER TABLE `Dipendente` DISABLE KEYS */;
INSERT INTO `Dipendente` VALUES (6,'Giulia','Neri','3336667777','venditore'),(7,'Sara','Conti','3330001111','venditore'),(8,'Marco','Blu','3339990000','venditore'),(9,'Paolo','Ferri','3338889999','meccanico'),(10,'Davide','Moro','3331234567','meccanico');
/*!40000 ALTER TABLE `Dipendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Intervento`
--

DROP TABLE IF EXISTS `Intervento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Intervento` (
  `id_intervento` int NOT NULL AUTO_INCREMENT,
  `data_intervento` date NOT NULL,
  `tipo_intervento` varchar(100) NOT NULL,
  `costo` int NOT NULL,
  `id_auto` int NOT NULL,
  `id_dipendente` int NOT NULL,
  PRIMARY KEY (`id_intervento`),
  KEY `id_auto` (`id_auto`),
  KEY `id_dipendente` (`id_dipendente`),
  CONSTRAINT `Intervento_ibfk_1` FOREIGN KEY (`id_auto`) REFERENCES `Auto` (`id_auto`),
  CONSTRAINT `Intervento_ibfk_2` FOREIGN KEY (`id_dipendente`) REFERENCES `Dipendente` (`id_utente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Intervento`
--

LOCK TABLES `Intervento` WRITE;
/*!40000 ALTER TABLE `Intervento` DISABLE KEYS */;
INSERT INTO `Intervento` VALUES (1,'2025-01-10','Controllo generale',150,5,9),(2,'2025-01-18','Cambio olio',80,1,9),(3,'2025-02-02','Controllo freni',120,10,10),(4,'2025-02-08','Sostituzione pneumatici',300,3,10);
/*!40000 ALTER TABLE `Intervento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recensione`
--

DROP TABLE IF EXISTS `Recensione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recensione` (
  `id_recensione` int NOT NULL AUTO_INCREMENT,
  `voto` int NOT NULL,
  `commento` varchar(100) DEFAULT NULL,
  `id_cliente` int NOT NULL,
  `id_auto` int NOT NULL,
  PRIMARY KEY (`id_recensione`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_auto` (`id_auto`),
  CONSTRAINT `Recensione_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_utente`),
  CONSTRAINT `Recensione_ibfk_2` FOREIGN KEY (`id_auto`) REFERENCES `Auto` (`id_auto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recensione`
--

LOCK TABLES `Recensione` WRITE;
/*!40000 ALTER TABLE `Recensione` DISABLE KEYS */;
INSERT INTO `Recensione` VALUES (1,5,'Auto molto comoda e piacevole da guidare.',1,1),(2,4,'Buona esperienza durante il test drive.',2,3),(3,5,'Venditore genitile e auto in ottime condizioni.',3,4),(4,4,'Auto ben tenuta e personale disponibile.',5,9);
/*!40000 ALTER TABLE `Recensione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestDrive`
--

DROP TABLE IF EXISTS `TestDrive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TestDrive` (
  `id_test_drive` int NOT NULL AUTO_INCREMENT,
  `data_test_drive` date NOT NULL,
  `id_cliente` int NOT NULL,
  `id_auto` int NOT NULL,
  `id_dipendente` int NOT NULL,
  PRIMARY KEY (`id_test_drive`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_auto` (`id_auto`),
  KEY `id_dipendente` (`id_dipendente`),
  CONSTRAINT `TestDrive_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_utente`),
  CONSTRAINT `TestDrive_ibfk_2` FOREIGN KEY (`id_auto`) REFERENCES `Auto` (`id_auto`),
  CONSTRAINT `TestDrive_ibfk_3` FOREIGN KEY (`id_dipendente`) REFERENCES `Dipendente` (`id_utente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestDrive`
--

LOCK TABLES `TestDrive` WRITE;
/*!40000 ALTER TABLE `TestDrive` DISABLE KEYS */;
INSERT INTO `TestDrive` VALUES (1,'2025-02-10',1,1,6),(2,'2025-02-12',2,3,7),(3,'2025-02-15',3,4,6),(4,'2025-02-18',4,8,8),(5,'2025-02-21',5,9,7);
/*!40000 ALTER TABLE `TestDrive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Utente`
--

DROP TABLE IF EXISTS `Utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Utente` (
  `id_utente` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id_utente`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utente`
--

LOCK TABLES `Utente` WRITE;
/*!40000 ALTER TABLE `Utente` DISABLE KEYS */;
INSERT INTO `Utente` VALUES (1,'mario.rossi@email.com','mario123'),(2,'lucia.bianchi@email.com','lucia123'),(3,'andrea.verdi@email.com','andrea123'),(4,'elena.gallo@email.com','elena123'),(5,'francesco.riva@email.com','francesco123'),(6,'giulia.neri@email.com','giulia123'),(7,'sara.conti@email.com','sara123'),(8,'marco.blu@email.com','marco123'),(9,'paolo.ferri@email.com','paolo123'),(10,'davide.moro@email.com','davide123');
/*!40000 ALTER TABLE `Utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendita`
--

DROP TABLE IF EXISTS `Vendita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vendita` (
  `id_vendita` int NOT NULL AUTO_INCREMENT,
  `data_vendita` date NOT NULL,
  `id_cliente` int NOT NULL,
  `id_auto` int NOT NULL,
  `id_dipendente` int NOT NULL,
  PRIMARY KEY (`id_vendita`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_auto` (`id_auto`),
  KEY `id_dipendente` (`id_dipendente`),
  CONSTRAINT `Vendita_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_utente`),
  CONSTRAINT `Vendita_ibfk_2` FOREIGN KEY (`id_auto`) REFERENCES `Auto` (`id_auto`),
  CONSTRAINT `Vendita_ibfk_3` FOREIGN KEY (`id_dipendente`) REFERENCES `Dipendente` (`id_utente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendita`
--

LOCK TABLES `Vendita` WRITE;
/*!40000 ALTER TABLE `Vendita` DISABLE KEYS */;
INSERT INTO `Vendita` VALUES (1,'2025-02-20',3,4,6),(2,'2025-02-25',5,9,7),(3,'2025-03-01',1,6,8);
/*!40000 ALTER TABLE `Vendita` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-11 16:19:08
