-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: hopper.wlu.ca    Database: fran0880
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth` (
  `email` varchar(320) NOT NULL,
  `password` varchar(255) NOT NULL,
  `refresh_token` char(255) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `uidx_refresh_token` (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` VALUES ('a@gmail.com','123','abcdefg'),('b@gmail.com','321','ziodsf'),('c@gmail.com','111','werwqe'),('d@gmail.com','123','IOHOIH');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fran0880`@`%`*/ /*!50003 TRIGGER `tr_uppercase_refresh_token` BEFORE INSERT ON `auth` FOR EACH ROW SET NEW.refresh_token = UPPER(NEW.refresh_token) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electronics'),(2,'Furniture'),(3,'Bikes'),(4,'Test'),(6,'Sportings Goods'),(7,'Audio'),(8,'Books'),(9,'Clothing'),(10,'Video Games And Consoles'),(11,'Free Stuff');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `full_user_info`
--

DROP TABLE IF EXISTS `full_user_info`;
/*!50001 DROP VIEW IF EXISTS `full_user_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `full_user_info` AS SELECT 
 1 AS `user_id`,
 1 AS `member_since`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `password`,
 1 AS `refresh_token`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `listing`
--

DROP TABLE IF EXISTS `listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listing` (
  `listing_id` int NOT NULL AUTO_INCREMENT,
  `listing_name` varchar(255) DEFAULT NULL,
  `listing_price` decimal(19,4) DEFAULT NULL,
  `listing_description` longtext,
  `category_id` int DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `listing_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`listing_id`),
  KEY `province` (`province`,`city`),
  KEY `category_id` (`category_id`),
  KEY `idx_listing_name` (`listing_name`),
  KEY `idx_listing_price` (`listing_price`),
  CONSTRAINT `listing_ibfk_1` FOREIGN KEY (`province`, `city`) REFERENCES `location` (`province`, `city`),
  CONSTRAINT `listing_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing`
--

LOCK TABLES `listing` WRITE;
/*!40000 ALTER TABLE `listing` DISABLE KEYS */;
INSERT INTO `listing` VALUES (1,'Samsung S20 5G Grey',650.0000,'Brand new, unopened',1,'Alberta','Calgary','2020-12-01 16:37:29'),(2,'Ikea Desk',44.0000,'Desk size: length 150cm, width 75cm, height 74cm. White table top, black legs.\nIn good condition.',2,'British Columbia','Vancouver','2020-12-01 16:48:15'),(3,'Men’s mountain bike',150.3000,'Purchased this past spring.',2,'Ontario','Toronto','2020-12-01 17:07:49');
/*!40000 ALTER TABLE `listing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `listing_and_category`
--

DROP TABLE IF EXISTS `listing_and_category`;
/*!50001 DROP VIEW IF EXISTS `listing_and_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listing_and_category` AS SELECT 
 1 AS `listing_id`,
 1 AS `listing_name`,
 1 AS `listing_description`,
 1 AS `listing_price`,
 1 AS `province`,
 1 AS `city`,
 1 AS `listing_date`,
 1 AS `category_id`,
 1 AS `category_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`province`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('Alberta','Calgary','1 Avenue North-east'),('British Columbia','Vancouver','29th Ave Station Loop'),('Ontario','Toronto','10 Canlish Road');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup_listing_user`
--

DROP TABLE IF EXISTS `lookup_listing_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lookup_listing_user` (
  `user_id` int NOT NULL,
  `listing_id` int NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `listing_id` (`listing_id`),
  CONSTRAINT `lookup_listing_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `lookup_listing_user_ibfk_2` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`listing_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_listing_user`
--

LOCK TABLES `lookup_listing_user` WRITE;
/*!40000 ALTER TABLE `lookup_listing_user` DISABLE KEYS */;
INSERT INTO `lookup_listing_user` VALUES (2,1),(3,2),(4,3);
/*!40000 ALTER TABLE `lookup_listing_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `member_since` date DEFAULT NULL,
  `email` varchar(320) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `email` (`email`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`email`) REFERENCES `auth` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Matthew','Francis','2020-12-01','a@gmail.com'),(3,'John','Doe','2020-12-01','b@gmail.com'),(4,'Alex','Yu','2020-12-01','c@gmail.com'),(5,'Max','Francis','2020-12-03','d@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `full_user_info`
--

/*!50001 DROP VIEW IF EXISTS `full_user_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`fran0880`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `full_user_info` AS select `user`.`user_id` AS `user_id`,`user`.`member_since` AS `member_since`,`user`.`first_name` AS `first_name`,`user`.`last_name` AS `last_name`,`auth`.`email` AS `email`,`auth`.`password` AS `password`,`auth`.`refresh_token` AS `refresh_token` from ((`lookup_listing_user` join `user` on((`lookup_listing_user`.`user_id` = `user`.`user_id`))) join `auth` on((`user`.`email` = `auth`.`email`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listing_and_category`
--

/*!50001 DROP VIEW IF EXISTS `listing_and_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`fran0880`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `listing_and_category` AS select `l`.`listing_id` AS `listing_id`,`l`.`listing_name` AS `listing_name`,`l`.`listing_description` AS `listing_description`,`l`.`listing_price` AS `listing_price`,`l`.`province` AS `province`,`l`.`city` AS `city`,`l`.`listing_date` AS `listing_date`,`l`.`category_id` AS `category_id`,`category`.`category_name` AS `category_name` from (`listing` `l` join `category` on((`l`.`category_id` = `category`.`category_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-04 14:36:53
