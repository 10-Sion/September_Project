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
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `no` int NOT NULL,
  `sub_name` varchar(20) DEFAULT NULL,
  `pro_name` varchar(20) DEFAULT NULL,
  `pro_no` int DEFAULT NULL,
  `place` varchar(20) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `dep_name` varchar(30) DEFAULT NULL,
  `major` varchar(30) DEFAULT NULL,
  `point` tinyint(1) DEFAULT NULL,
  `semester` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Subject1','Professor1',1,'Place1',13,'Department2','Major2',3,1),(2,'Subject2','Professor2',2,'Place2',37,'Department1','Major1',4,0),(3,'Subject3','Professor3',3,'Place3',55,'Department2','Major2',3,1),(4,'Subject4','Professor4',4,'Place4',22,'Department1','Major1',5,1),(5,'Subject5','Professor5',5,'Place5',33,'Department2','Major2',2,0),(6,'Subject6','Professor6',6,'Place6',21,'Department1','Major1',3,1),(7,'Subject7','Professor7',7,'Place7',92,'Department2','Major2',5,1),(8,'Subject8','Professor8',8,'Place8',56,'Department1','Major1',1,0),(9,'Subject9','Professor9',9,'Place9',75,'Department2','Major2',5,1),(10,'Subject10','Professor10',10,'Place10',80,'Department1','Major1',2,1);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-12 15:33:15
