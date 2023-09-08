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
-- Dumping routines for database 'gwanlee'
--
/*!50003 DROP PROCEDURE IF EXISTS `SetEmplAutoIncrement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pid`@`%` PROCEDURE `SetEmplAutoIncrement`()
BEGIN
	DECLARE current_max INT;	-- 최대값 변수
    
    SELECT MAX(emp_no) INTO current_max FROM Employee;	-- emp_no 열 최대값 검색함 / 젤 마지막 번호 select
		IF current_max IS NULL THEN 
		SET current_max = -1;	-- emp_no 열 완전 비었을 때 -1로 시작함 / 1씩 추가시켜서 0부터 no 생성할거임
	  END IF;
      
      SET @next_auto_increment = GREATEST(0, current_max + 1);	-- current_max 변수에 숫자값 저장함
  
	  IF @next_auto_increment > 1000 THEN	-- 1000 넘으면 예외처리때림
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'AUTO_INCREMENT value exceeds the limit of 1000';
	  ELSE
		SET @sql = CONCAT('ALTER TABLE Employee AUTO_INCREMENT = ', @next_auto_increment);	-- sql 구문 변수에 저장
		PREPARE stmt FROM @sql;
		EXECUTE stmt;	-- 해당 명령문 실행
		DEALLOCATE PREPARE stmt;	-- 자원 해제
	  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetProAutoIncrement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pid`@`%` PROCEDURE `SetProAutoIncrement`()
BEGIN
	DECLARE current_max INT;	-- 최대값 변수
    
    SELECT MAX(pro_no) INTO current_max FROM Professor;	-- pro_no 열 최대값 검색함 / 젤 마지막 번호 select
		IF current_max IS NULL THEN 
		SET current_max = 1000;	-- emp_no 열 완전 비었을 때 1000로 시작함 / 1씩 추가시켜서 1001부터 no 생성할거임
	  END IF;
      
      SET @next_auto_increment = GREATEST(0, current_max + 1);	-- current_max 변수에 숫자값 저장함
  
	  IF @next_auto_increment > 2000 THEN	-- 2000 넘으면 예외처리때림
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'AUTO_INCREMENT value exceeds the limit of 1000';
	  ELSE
		SET @sql = CONCAT('ALTER TABLE Employee AUTO_INCREMENT = ', @next_auto_increment);	-- sql 구문 변수에 저장
		PREPARE stmt FROM @sql;
		EXECUTE stmt;	-- 해당 명령문 실행
		DEALLOCATE PREPARE stmt;	-- 자원 해제
	  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetStuAutoIncrement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pid`@`%` PROCEDURE `SetStuAutoIncrement`()
BEGIN
	DECLARE current_max INT;	-- 최대값 변수
    
    SELECT MAX(stu_no) INTO current_max FROM Student;	-- stu_no 열 최대값 검색함 / 젤 마지막 번호 select
		IF current_max IS NULL THEN 
		SET current_max = 2000;	-- emp_no 열 완전 비었을 때 2000로 시작함 / 1씩 추가시켜서 2001부터 no 생성할거임
	  END IF;
      
      SET @next_auto_increment = GREATEST(0, current_max + 1);	-- current_max 변수에 숫자값 저장함
  
	  IF @next_auto_increment > 3000 THEN	-- 3000 넘으면 예외처리때림
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'AUTO_INCREMENT value exceeds the limit of 1000';
	  ELSE
		SET @sql = CONCAT('ALTER TABLE Employee AUTO_INCREMENT = ', @next_auto_increment);	-- sql 구문 변수에 저장
		PREPARE stmt FROM @sql;
		EXECUTE stmt;	-- 해당 명령문 실행
		DEALLOCATE PREPARE stmt;	-- 자원 해제
	  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TestAutoIncrement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pid`@`%` PROCEDURE `TestAutoIncrement`()
BEGIN
	DECLARE current_max INT;	-- 최대값 변수
    
    SELECT MAX(emp_no) INTO current_max FROM Employee;	-- stu_no 열 최대값 검색함 / 젤 마지막 번호 select
		IF current_max IS NULL THEN 
		SET current_max = -1;	
	  END IF;
      
      SET @next_auto_increment = GREATEST(0, current_max + 1);	-- current_max 변수에 숫자값 저장함
  
	  IF @next_auto_increment > 10 THEN	-- 3000 넘으면 예외처리때림
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'AUTO_INCREMENT value exceeds the limit of 1000';
	  ELSE
		SET @sql = CONCAT('ALTER TABLE Employee AUTO_INCREMENT = ', @next_auto_increment);	-- sql 구문 변수에 저장
		PREPARE stmt FROM @sql;
		EXECUTE stmt;	-- 해당 명령문 실행
		DEALLOCATE PREPARE stmt;	-- 자원 해제
	  END IF;
END ;;
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

-- Dump completed on 2023-09-08 17:33:26
