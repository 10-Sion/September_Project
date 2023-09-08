-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gwanlee
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `pro_no` int NOT NULL AUTO_INCREMENT,
  `pw` varchar(30) NOT NULL,
  `name` varchar(20) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `major` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `labNum` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pro_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1001,'professor1pw','Professor 1','Address 1','Tel 1','010-0001-0000','Major 1','professor1@example.com','Lab 101'),(1002,'professor2pw','Professor 2','Address 2','Tel 2','010-0002-0000','Major 2','professor2@example.com','Lab 102'),(1003,'professor3pw','Professor 3','Address 3','Tel 3','010-0003-0000','Major 3','professor3@example.com','Lab 103'),(1004,'professor4pw','Professor 4','Address 4','Tel 4','010-0004-0000','Major 4','professor4@example.com','Lab 104'),(1005,'professor5pw','Professor 5','Address 5','Tel 5','010-0005-0000','Major 5','professor5@example.com','Lab 105'),(1006,'professor6pw','Professor 6','Address 6','Tel 6','010-0006-0000','Major 6','professor6@example.com','Lab 106'),(1007,'professor7pw','Professor 7','Address 7','Tel 7','010-0007-0000','Major 7','professor7@example.com','Lab 107'),(1008,'professor8pw','Professor 8','Address 8','Tel 8','010-0008-0000','Major 8','professor8@example.com','Lab 108'),(1009,'professor9pw','Professor 9','Address 9','Tel 9','010-0009-0000','Major 9','professor9@example.com','Lab 109'),(1010,'professor10pw','Professor 10','Address 10','Tel 10','010-0010-0000','Major 10','professor10@example.com','Lab 110');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-08 17:33:26
