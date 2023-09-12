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
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `stu_no` int NOT NULL AUTO_INCREMENT,
  `pw` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dep_name` varchar(30) DEFAULT NULL,
  `major` varchar(30) DEFAULT NULL,
  `grade` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`stu_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2001,'password2001','Student1','Address1','Phone1','Tel1','student1@example.com',NULL,NULL,1,1),(2002,'password2002','Student2','Address2','Phone2','Tel2','student2@example.com',NULL,NULL,2,0),(2003,'password2003','Student3','Address3','Phone3','Tel3','student3@example.com',NULL,NULL,3,1),(2004,'password2004','Student4','Address4','Phone4','Tel4','student4@example.com',NULL,NULL,4,0),(2005,'password2005','Student5','Address5','Phone5','Tel5','student5@example.com',NULL,NULL,1,1),(2006,'password2006','Student6','Address6','Phone6','Tel6','student6@example.com',NULL,NULL,2,0),(2007,'password2007','Student7','Address7','Phone7','Tel7','student7@example.com',NULL,NULL,3,1),(2008,'password2008','Student8','Address8','Phone8','Tel8','student8@example.com',NULL,NULL,4,0),(2009,'password2009','Student9','Address9','Phone9','Tel9','student9@example.com',NULL,NULL,1,1),(2010,'password2010','Student10','Address10','Phone10','Tel10','student10@example.com',NULL,NULL,2,0);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
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
