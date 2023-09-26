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
  `pw` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dep_name` varchar(30) DEFAULT NULL,
  `major` varchar(30) DEFAULT NULL,
  `labNum` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pro_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1001,'password1001','Professor1','Address1','Phone1','Tel1','professor1@example.com',NULL,NULL,1001,1),(1002,'password1002','Professor2','Address2','Phone2','Tel2','professor2@example.com',NULL,NULL,1002,0),(1003,'password1003','Professor3','Address3','Phone3','Tel3','professor3@example.com',NULL,NULL,1003,1),(1004,'password1004','Professor4','Address4','Phone4','Tel4','professor4@example.com',NULL,NULL,1004,0),(1005,'password1005','Professor5','Address5','Phone5','Tel5','professor5@example.com',NULL,NULL,1005,1),(1006,'password1006','Professor6','Address6','Phone6','Tel6','professor6@example.com',NULL,NULL,1006,0),(1007,'password1007','Professor7','Address7','Phone7','Tel7','professor7@example.com',NULL,NULL,1007,1),(1008,'password1008','Professor8','Address8','Phone8','Tel8','professor8@example.com',NULL,NULL,1008,0),(1009,'password1009','Professor9','Address9','Phone9','Tel9','professor9@example.com',NULL,NULL,1009,1),(1010,'password1010','Professor10','Address10','Phone10','Tel10','professor10@example.com',NULL,NULL,1010,0);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pid`@`%`*/ /*!50003 TRIGGER `ProInsertJehan` BEFORE INSERT ON `professor` FOR EACH ROW BEGIN
    DECLARE current_max INT;
    
    -- 현재 pro_no 열의 최대값 검색
    SELECT MAX(pro_no) INTO current_max FROM Professor;

    -- 만약 최대값이 2000 이상이라면 예외를 던집니다.
    IF current_max >= 2000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'AUTO_INCREMENT value exceeds the limit of 1000';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-12 15:33:15
