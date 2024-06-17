-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: forumdb1
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `category_list`
--

DROP TABLE IF EXISTS `category_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_list`
--

LOCK TABLES `category_list` WRITE;
/*!40000 ALTER TABLE `category_list` DISABLE KEYS */;
INSERT INTO `category_list` VALUES (1,'Career','Time to have a CV!',1,0,'2022-05-16 10:02:41','2024-06-15 15:34:16'),(2,'VB.NET','Visual Basic, originally called Visual Basic .NET, is a multi-paradigm, object-oriented programming language, implemented on .NET, Mono, and the .NET Framework. Microsoft launched VB.NET in 2002 as the successor to its original Visual Basic language.',1,1,'2022-05-16 10:03:27','2024-06-15 15:34:55'),(3,'Others','Anything else?',1,0,'2022-05-16 10:03:48','2024-06-15 15:34:51'),(4,'Education','Any question in study?',1,0,'2022-05-16 10:04:11','2024-06-15 15:34:32'),(5,'test','test',1,1,'2022-05-16 10:04:54','2022-05-16 10:04:59');
/*!40000 ALTER TABLE `category_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_list`
--

DROP TABLE IF EXISTS `comment_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `comment` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_id_fk_cl` FOREIGN KEY (`post_id`) REFERENCES `post_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_fk_cl` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_list`
--

LOCK TABLES `comment_list` WRITE;
/*!40000 ALTER TABLE `comment_list` DISABLE KEYS */;
INSERT INTO `comment_list` VALUES (6,10,7,'<p>comment 1</p>','2024-06-15 17:17:37');
/*!40000 ALTER TABLE `comment_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_list`
--

DROP TABLE IF EXISTS `post_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id_fk_tl` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_fk_tl` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_list`
--

LOCK TABLES `post_list` WRITE;
/*!40000 ALTER TABLE `post_list` DISABLE KEYS */;
INSERT INTO `post_list` VALUES (4,1,1,'test','<p>test</p>',1,1,'2022-05-16 14:11:24','2022-05-16 14:12:10'),(6,1,4,'admin sample','<p>123</p>',1,0,'2024-06-15 17:16:18','2024-06-15 17:18:13'),(7,10,4,'mem sample','<p>456</p>',1,0,'2024-06-15 17:17:21','2024-06-15 17:17:21');
/*!40000 ALTER TABLE `post_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_info`
--

DROP TABLE IF EXISTS `system_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_info`
--

LOCK TABLES `system_info` WRITE;
/*!40000 ALTER TABLE `system_info` DISABLE KEYS */;
INSERT INTO `system_info` VALUES (1,'name','Online Discussion Forum Site'),(6,'short_name','Online Forum'),(11,'logo','uploads/logo.png?v=1652665183'),(13,'user_avatar','uploads/user_avatar.jpg'),(14,'cover','uploads/cover.png?v=1652665183');
/*!40000 ALTER TABLE `system_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) NOT NULL,
  `middlename` text,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Adminstrator','','Admin','admin','0192023a7bbd73250516f069df18b500','uploads/avatars/1.png?v=1649834664',NULL,1,'2021-01-20 14:02:37','2022-05-16 14:17:49'),(5,'John','D','Smith','jsmith','1254737c076cf867dc53d60a0364f38e',NULL,NULL,2,'2022-05-16 14:19:03','2022-05-16 14:19:03'),(10,'Le','Tinh','Nhut','lte','6cbad22cdf655e9d49895421be36e118',NULL,NULL,2,'2024-06-15 16:21:11','2024-06-15 16:21:11'),(11,'Le ','Cong','Thai Khang','lctk','6cbad22cdf655e9d49895421be36e118',NULL,NULL,2,'2024-06-15 21:14:23','2024-06-15 21:14:23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16 22:56:44
