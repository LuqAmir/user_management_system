-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: user_management_system
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Access` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `AddedBy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `BatchId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DateJoined` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000',
  `Department` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Fullname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NoOfTickets` int NOT NULL DEFAULT '0',
  `Position` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ReportingTo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (
1,'Luqman','$2y$10$0cqTKcwX8myw.qpD0sl2X.WMXAH3pLQtg29jnuP5NMFbrCvUjB6KW','isluqamir@gmail.com','2025-02-07 07:49:58','Full','Luqman','0000','2025-01-01 00:00:00.000000','IT','Muhammad Luqman bin Amiruddin',0,'Manager','Head Of Company','Admin'),
(6,'johnlabu','$2a$11$JMhZQV21kxUFJfvGtfOsRO8hp2G3YaEjQajesDHY9HJECgq4Pwpq6','johnlabu@gmail.com','2025-02-07 17:37:58','Restricted','Muhammad Luqman bin Amiruddin','0020','2025-01-03 00:00:00.000000','IT','John Labu',0,'Staff','Luqman','User'),
(7,'elsa','$2a$11$pmNI8CRSRGK5y8s.SzrpqeMzNOruVmIlg8qg.nC.2RH4m9ZE187/a','elsa@gmail.com','2025-02-08 00:20:44','Restricted','Muhammad Luqman bin Amiruddin','0031','2025-01-15 00:00:00.000000','HR','Elsa Arrandele',0,'Supervisor','Luqman','User'),
(8,'anna','$2a$11$G0oeTZDWL4Jj829.hEt3QuqM7WA6CsKX9uzl0vhab1uTLioAiCB6K','anna@gmail.com','2025-02-08 00:21:22','Restricted','Muhammad Luqman bin Amiruddin','0031','2025-02-04 00:00:00.000000','HR','Anna Arandelle',0,'Staff','Elsa Arandelle','User'),
(9,'thor','$2a$11$HdbzAadjqTrmHU/Y.mx/juNoODlzJGdoANMCcxQH1o222XGDrXhL.','thor@gmail.com','2025-02-08 00:30:28','Restricted','Muhammad Luqman bin Amiruddin','0040','2025-02-08 00:00:00.000000','Admin','Thor Odinson',0,'Staff','Tony Stark','User'),
(10,'tony','$2a$11$CUG6YLhYXN79DTwd4o4G1.KPIk.okH4uhEZ4gGYy5ErV2PL3/OqMa','tony@gmail.com','2025-02-08 00:31:24','Full','Muhammad Luqman bin Amiruddin','0041','2025-02-08 00:00:00.000000','Admin','Tony Stark',0,'Supervisor','Luqman','User'),
(11,'bruce','$2a$11$o.dtj.prcE1FMcm/uZhIReLmKB6ypMyHtlAWcSh6TeNaB2fCwlnK.','bruce@gmail.com','2025-02-08 00:32:28','Restricted','Muhammad Luqman bin Amiruddin','0042','2025-02-08 00:00:00.000000','Admin','Bruce Banner',0,'Staff','Tony Stark','User'),
(12,'stephen','$2a$11$hN8ujQ3Br1FZ9yFVkmlfWO2BgzHC7AQGa3K6OJS.czolbVxaJnlny','stephen@gmail.com','2025-02-08 00:34:26','Restricted','Muhammad Luqman bin Amiruddin','0045','2025-02-08 00:00:00.000000','Admin','Stephen Strange',0,'Staff','Tony Stark','User'),
(13,'natasha','$2a$11$8q0gOjFwCI6Y1mz6AY.mdeVaRVI23/HuFPCeUk57dh3xA0fgE2ja.','natasha@gmail.com','2025-02-08 00:36:14','Restricted','Muhammad Luqman bin Amiruddin','0046','2025-02-08 00:00:00.000000','Admin','Natasha Romanoff',0,'Staff','Tony Stark','User'),
(14,'clint','$2a$11$PlGPJYrla2Oia7vINnznNescC9xDC8PXqZY5zX0Og8oM.QWV9eQwW','clint@gmail.com','2025-02-08 00:37:52','Restricted','Muhammad Luqman bin Amiruddin','0048','2025-02-08 00:00:00.000000','Admin','Clint Barton',0,'Technician','Tony Stark','User'),
(15,'steve','$2a$11$2XilTwth3MgLQE/9/VBXwuxovlqpWeW2r5O5P4bR/4BwXd0kObR26','steve@gmail.com','2025-02-08 00:39:18','Restricted','Muhammad Luqman bin Amiruddin','0048','2025-02-08 00:00:00.000000','Admin','Steve Rogers',0,'Supervisor','Tony Stark','User'),
(16,'clark','$2a$11$lLzIeMPGMIfLHuO1ShB15.8S4Lf..R1RUb/R0ZX6IpCS/Ccw9672O','clark@gmail.com','2025-02-08 00:40:57','Full','Muhammad Luqman bin Amiruddin','0050','2024-07-11 00:00:00.000000','Finance','Clark Kent',0,'Supervisor','Luqman','User'),
(17,'bruce','$2a$11$H6VYAINkvt.xiFVlRCuIVue47kfHpK/9JLb0tIouOi9MDGYw3giZG','bruce@gmail.com','2025-02-08 00:41:59','Restricted','Muhammad Luqman bin Amiruddin','0051','2024-08-12 00:00:00.000000','Finance','Bruce Wayne',0,'Staff','Clark Kent','User'),
(18,'diana','$2a$11$vkVM2DE9EeWYOV0bsCRV1euqBaoB.6uaKCaIjxba1XjgK2W3YTxDO','diana@gmail.com','2025-02-08 00:44:41','Restricted','Muhammad Luqman bin Amiruddin','0054','2024-09-16 00:00:00.000000','Finance','Diana Prince',0,'Staff','Clark Kent','User'),
(19,'arthur','$2a$11$/X8VXz5M7r9rhIOki0MNPu0CUmyezfHPr7QkmG8pzS6tZh6i81dQm','arthur@gmail.com','2025-02-08 00:46:26','Restricted','Muhammad Luqman bin Amiruddin','0056','2025-02-08 00:00:00.000000','Finance','Arthur Curry',0,'Technician','Clark Kent','User');
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

-- Dump completed on 2025-02-08 19:23:57
