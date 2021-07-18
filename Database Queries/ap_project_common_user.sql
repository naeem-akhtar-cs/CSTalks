-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: ls-2443773d57df68ead19c2450b12c6e6268f31f3f.c1whsvsm4xkg.ap-southeast-1.rds.amazonaws.com    Database: ap_project
-- ------------------------------------------------------
-- Server version	8.0.25

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `common_user`
--

DROP TABLE IF EXISTS `common_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `common_user` (
  `ID` int NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `fName` varchar(40) DEFAULT NULL,
  `lName` varchar(40) DEFAULT NULL,
  `date_joined` varchar(40) DEFAULT NULL,
  `user_status` int DEFAULT NULL,
  `user_password` varchar(200) DEFAULT NULL,
  `useraddress` varchar(60) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `province` varchar(40) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `university` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_user`
--

LOCK TABLES `common_user` WRITE;
/*!40000 ALTER TABLE `common_user` DISABLE KEYS */;
INSERT INTO `common_user` VALUES (28,'ahmad@cstalks.com','Ahmad','Waheed','2021/07/03',0,'12','Johar Town','Lahore','Punjab',22,'FAST NU Lahore'),(31,'l174262@lhr.nu.edu.pk','Naeem','Akhtar','2021/07/03',0,'123','Johar Town Block E','Lahore','Punjab',NULL,NULL),(32,'sameen@cstalks.com','Sameen','Akram','2021/07/15',1,'789','Johar Town, E Block','Lahore','Punjab',21,'FAST Lahore'),(34,'naeem@cstalks.com','Naeem','Akhtar','2021/07/17',1,'67','Johar Town, E Block','Lahore','Punjab',20,'FAST-NUCES Lahore'),(35,'hira@cstalks.com','Hira','Asif','2021/07/18',1,'hira',NULL,NULL,NULL,NULL,NULL),(36,'ahmad@gmail.com','Ahmad','Waheed','2021/07/18',1,'12','Johar Town','Lahore','Punjab',22,'FAST Lahore'),(37,'naeem@gmail.com','Naeem','Akhtar','2021/07/18',1,'12','Johar','Lahore','Punjab',21,'Fast');
/*!40000 ALTER TABLE `common_user` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-18 14:49:44
