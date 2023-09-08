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
  `pw` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `grade` int DEFAULT NULL,
  `major` varchar(30) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `Pro_name` varchar(20) DEFAULT NULL,
  `Pro_no` int DEFAULT NULL,
  PRIMARY KEY (`stu_no`),
  KEY `Pro_no` (`Pro_no`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Pro_no`) REFERENCES `professor` (`pro_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2001,'password1','Student 1','Address 1','123-456-7890','987-654-3210','student1@example.com',1,'Major 1','Active','Professor 1',1001),(2002,'password2','Student 2','Address 2','234-567-8901','876-543-2109','student2@example.com',2,'Major 2','Active','Professor 2',1002),(2003,'password3','Student 3','Address 3','345-678-9012','765-432-1098','student3@example.com',3,'Major 3','Active','Professor 3',1003),(2004,'password4','Student 4','Address 4','456-789-0123','654-321-0987','student4@example.com',4,'Major 4','Inactive','Professor 4',1004),(2005,'password5','Student 5','Address 5','567-890-1234','543-210-9876','student5@example.com',1,'Major 1','Active','Professor 1',1001),(2006,'password6','Student 6','Address 6','678-901-2345','432-109-8765','student6@example.com',2,'Major 2','Inactive','Professor 2',1002),(2007,'password7','Student 7','Address 7','789-012-3456','321-098-7654','student7@example.com',3,'Major 3','Active','Professor 3',1003),(2008,'password8','Student 8','Address 8','890-123-4567','210-987-6543','student8@example.com',4,'Major 4','Active','Professor 4',1004),(2009,'password9','Student 9','Address 9','901-234-5678','098-765-4321','student9@example.com',1,'Major 1','Inactive','Professor 1',1001),(2010,'password10','Student 10','Address 10','012-345-6789','987-654-3210','student10@example.com',2,'Major 2','Active','Professor 2',1002);
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

-- Dump completed on 2023-09-08 17:33:25
