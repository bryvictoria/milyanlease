-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mileasing
-- ------------------------------------------------------
-- Server version	11.1.0-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advertisements`
--

DROP TABLE IF EXISTS `advertisements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` bigint(20) unsigned NOT NULL,
  `offer_type` int(11) NOT NULL DEFAULT 1 COMMENT '1 - rent,2 - sale',
  `title` varchar(255) NOT NULL,
  `ad_content` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT 'published,pending,closed',
  `enabled` tinyint(1) DEFAULT NULL,
  `advance_payment` tinyint(1) DEFAULT 1,
  `price` double DEFAULT NULL,
  `min_tenure` int(11) DEFAULT NULL,
  `monthly_rate` double DEFAULT NULL,
  `deposit_security` double DEFAULT NULL COMMENT 'monthly',
  `deposit_utility` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advertisements_unit_id_foreign` (`unit_id`),
  CONSTRAINT `advertisements_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisements`
--

LOCK TABLES `advertisements` WRITE;
/*!40000 ALTER TABLE `advertisements` DISABLE KEYS */;
INSERT INTO `advertisements` VALUES (1,11,1,'1BR with mountain view',NULL,1,1,1,NULL,12,15000,2,5000,'2023-07-26 09:29:40','2023-07-26 09:29:40',NULL),(2,12,1,'Studio',NULL,1,1,1,NULL,4,10000,1,0,'2023-07-26 10:39:46','2023-07-26 10:39:46',NULL),(3,13,1,'Higher Floor 1BR',NULL,1,1,1,NULL,12,15000,2,5000,'2023-07-26 10:40:19','2023-07-26 10:40:19',NULL),(4,14,1,'Suite Space',NULL,1,1,1,NULL,2,8000,1,5000,'2023-07-26 10:40:52','2023-07-26 10:40:52',NULL),(5,15,1,'Fantastic 1BR',NULL,1,1,1,NULL,1,18000,2,5000,'2023-07-26 10:41:20','2023-07-26 10:41:20',NULL);
/*!40000 ALTER TABLE `advertisements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appliances`
--

DROP TABLE IF EXISTS `appliances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appliances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appliances`
--

LOCK TABLES `appliances` WRITE;
/*!40000 ALTER TABLE `appliances` DISABLE KEYS */;
/*!40000 ALTER TABLE `appliances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buildings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `storey` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buildings_property_id_foreign` (`property_id`),
  CONSTRAINT `buildings_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildings`
--

LOCK TABLES `buildings` WRITE;
/*!40000 ALTER TABLE `buildings` DISABLE KEYS */;
INSERT INTO `buildings` VALUES (1,1,'Quezon North','QN','Quezon North',NULL,1,'2023-07-23 09:12:31','2023-07-23 09:12:31',NULL),(2,1,'Quezon South','QS','Quezon South',NULL,1,'2023-07-23 09:12:31','2023-07-23 09:12:31',NULL),(3,1,'Osmena East','OE','Osmena East',NULL,1,'2023-07-23 09:12:31','2023-07-23 09:12:31',NULL),(4,1,'Roxas East','RE','Roxas East',NULL,1,'2023-07-23 09:12:31','2023-07-23 09:12:31',NULL),(5,1,'Quirino East','QE','Quirino East',NULL,1,'2023-07-23 09:12:31','2023-07-23 09:12:31',NULL),(6,1,'Osmena West','OW','Osmena West',NULL,1,'2023-07-23 09:12:31','2023-07-23 09:12:31',NULL),(7,1,'Roxas West','RW','Roxas West',NULL,1,'2023-07-23 09:12:31','2023-07-23 09:12:31',NULL),(8,1,'Quirino West','QW','Quirino West',NULL,1,'2023-07-23 09:12:31','2023-07-23 09:12:31',NULL);
/*!40000 ALTER TABLE `buildings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2020_05_21_100000_create_teams_table',1),(7,'2020_05_21_200000_create_team_user_table',1),(8,'2020_05_21_300000_create_team_invitations_table',1),(9,'2023_07_23_145713_create_sessions_table',1),(10,'2023_07_23_153337_create_properties_table',1),(11,'2023_07_23_153349_create_buildings_table',1),(12,'2023_07_23_153416_create_units_table',1),(13,'2023_07_23_153440_create_amenities_table',1),(14,'2023_07_23_160426_create_unit_photos_table',1),(15,'2023_07_23_160918_create_advertisements_table',1),(16,'2023_07_23_161639_create_appliances_table',1),(17,'2023_07_23_161650_create_unit_appliances_table',1),(19,'2023_07_25_073139_add_path_to_unit_photos_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT 'condominium, townhouse, commercial, land, house',
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,'The Residence @ Commonwealth','TRC','trc',1,1,'2023-07-23 09:12:31','2023-07-23 09:12:31',NULL);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('6YgBJjaWZhhjFZddFm7fZV969xkb8WRnMEvGOZqn',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoieUxPZWRmVVgwTDJORERncGxMcDVONXMxcE5FNFpTaWZsdVAwN0Q0cSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJEtLNm9pRzNQRVJsV2xrLnRIUHhXRS5TcE1MMmZieHM0d0V0YzVGTzlYd1d0TGg5bkVObEllIjt9',1690398885);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_invitations`
--

DROP TABLE IF EXISTS `team_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`),
  CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_invitations`
--

LOCK TABLES `team_invitations` WRITE;
/*!40000 ALTER TABLE `team_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_user`
--

DROP TABLE IF EXISTS `team_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_user`
--

LOCK TABLES `team_user` WRITE;
/*!40000 ALTER TABLE `team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,1,'admin\'s Team',1,'2023-07-23 10:59:43','2023-07-23 10:59:43');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_appliances`
--

DROP TABLE IF EXISTS `unit_appliances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_appliances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` bigint(20) unsigned NOT NULL,
  `appliance_id` bigint(20) unsigned NOT NULL,
  `brand` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_appliances_unit_id_foreign` (`unit_id`),
  KEY `unit_appliances_appliance_id_foreign` (`appliance_id`),
  CONSTRAINT `unit_appliances_appliance_id_foreign` FOREIGN KEY (`appliance_id`) REFERENCES `appliances` (`id`),
  CONSTRAINT `unit_appliances_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_appliances`
--

LOCK TABLES `unit_appliances` WRITE;
/*!40000 ALTER TABLE `unit_appliances` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit_appliances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_photos`
--

DROP TABLE IF EXISTS `unit_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` bigint(20) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `main` tinyint(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_photos_unit_id_foreign` (`unit_id`),
  CONSTRAINT `unit_photos_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_photos`
--

LOCK TABLES `unit_photos` WRITE;
/*!40000 ALTER TABLE `unit_photos` DISABLE KEYS */;
INSERT INTO `unit_photos` VALUES (1,11,'UP1690390952.jpg','/storage/photos/units/UP1690390952.jpg',0,NULL,NULL,1,'2023-07-26 09:02:32','2023-07-26 09:59:03',NULL,'/storage/photos/units/UP1690390952.jpg'),(2,11,'UP1690390962.jpg','/storage/photos/units/UP1690390962.jpg',0,NULL,NULL,1,'2023-07-26 09:02:42','2023-07-26 09:59:03',NULL,'/storage/photos/units/UP1690390962.jpg'),(3,11,'UP1690390970.jpg','/storage/photos/units/UP1690390970.jpg',0,NULL,NULL,1,'2023-07-26 09:02:50','2023-07-26 09:59:03',NULL,'/storage/photos/units/UP1690390970.jpg'),(4,11,'UP1690390977.jpg','/storage/photos/units/UP1690390977.jpg',0,NULL,NULL,1,'2023-07-26 09:02:57','2023-07-26 09:59:03',NULL,'/storage/photos/units/UP1690390977.jpg'),(5,11,'UP1690390985.jpg','/storage/photos/units/UP1690390985.jpg',0,NULL,NULL,1,'2023-07-26 09:03:05','2023-07-26 09:59:03',NULL,'/storage/photos/units/UP1690390985.jpg'),(6,11,'UP1690390994.jpg','/storage/photos/units/UP1690390994.jpg',1,NULL,NULL,1,'2023-07-26 09:03:14','2023-07-26 09:59:03',NULL,'/storage/photos/units/UP1690390994.jpg'),(7,11,'UP1690391001.jpg','/storage/photos/units/UP1690391001.jpg',0,NULL,NULL,1,'2023-07-26 09:03:21','2023-07-26 09:59:03',NULL,'/storage/photos/units/UP1690391001.jpg'),(8,11,'UP1690391013.jpg','/storage/photos/units/UP1690391013.jpg',0,NULL,NULL,1,'2023-07-26 09:03:33','2023-07-26 09:59:03',NULL,'/storage/photos/units/UP1690391013.jpg'),(9,11,'UP1690391019.jpg','/storage/photos/units/UP1690391019.jpg',0,NULL,NULL,1,'2023-07-26 09:03:39','2023-07-26 09:59:03',NULL,'/storage/photos/units/UP1690391019.jpg'),(10,12,'UP1690391129.jpg','/storage/photos/units/UP1690391129.jpg',0,NULL,NULL,1,'2023-07-26 09:05:29','2023-07-26 10:42:18',NULL,'/storage/photos/units/UP1690391129.jpg'),(11,12,'UP1690391136.jpg','/storage/photos/units/UP1690391136.jpg',0,NULL,NULL,1,'2023-07-26 09:05:36','2023-07-26 10:42:18',NULL,'/storage/photos/units/UP1690391136.jpg'),(12,12,'UP1690391141.jpg','/storage/photos/units/UP1690391141.jpg',0,NULL,NULL,1,'2023-07-26 09:05:41','2023-07-26 10:42:18',NULL,'/storage/photos/units/UP1690391141.jpg'),(13,12,'UP1690391152.jpg','/storage/photos/units/UP1690391152.jpg',0,NULL,NULL,1,'2023-07-26 09:05:52','2023-07-26 10:42:18',NULL,'/storage/photos/units/UP1690391152.jpg'),(14,12,'UP1690391164.jpg','/storage/photos/units/UP1690391164.jpg',0,NULL,NULL,1,'2023-07-26 09:06:04','2023-07-26 10:42:18',NULL,'/storage/photos/units/UP1690391164.jpg'),(15,12,'UP1690391171.jpg','/storage/photos/units/UP1690391171.jpg',0,NULL,NULL,1,'2023-07-26 09:06:11','2023-07-26 10:42:18',NULL,'/storage/photos/units/UP1690391171.jpg'),(16,12,'UP1690391193.jpg','/storage/photos/units/UP1690391193.jpg',1,NULL,NULL,1,'2023-07-26 09:06:33','2023-07-26 10:42:18',NULL,'/storage/photos/units/UP1690391193.jpg'),(17,12,'UP1690391200.jpg','/storage/photos/units/UP1690391200.jpg',0,NULL,NULL,1,'2023-07-26 09:06:40','2023-07-26 10:42:18',NULL,'/storage/photos/units/UP1690391200.jpg'),(18,13,'UP1690391266.jpg','/storage/photos/units/UP1690391266.jpg',0,NULL,NULL,1,'2023-07-26 09:07:46','2023-07-26 10:42:31',NULL,'/storage/photos/units/UP1690391266.jpg'),(19,13,'UP1690391269.jpg','/storage/photos/units/UP1690391269.jpg',0,NULL,NULL,1,'2023-07-26 09:07:49','2023-07-26 10:42:31',NULL,'/storage/photos/units/UP1690391269.jpg'),(20,13,'UP1690391272.jpg','/storage/photos/units/UP1690391272.jpg',1,NULL,NULL,1,'2023-07-26 09:07:52','2023-07-26 10:42:32',NULL,'/storage/photos/units/UP1690391272.jpg'),(21,13,'UP1690391276.jpg','/storage/photos/units/UP1690391276.jpg',0,NULL,NULL,1,'2023-07-26 09:07:56','2023-07-26 10:42:31',NULL,'/storage/photos/units/UP1690391276.jpg'),(22,13,'UP1690391280.jpg','/storage/photos/units/UP1690391280.jpg',0,NULL,NULL,1,'2023-07-26 09:08:00','2023-07-26 10:42:31',NULL,'/storage/photos/units/UP1690391280.jpg'),(23,13,'UP1690391289.jpg','/storage/photos/units/UP1690391289.jpg',0,NULL,NULL,1,'2023-07-26 09:08:09','2023-07-26 10:42:31',NULL,'/storage/photos/units/UP1690391289.jpg'),(24,13,'UP1690391292.jpg','/storage/photos/units/UP1690391292.jpg',0,NULL,NULL,1,'2023-07-26 09:08:12','2023-07-26 10:42:31',NULL,'/storage/photos/units/UP1690391292.jpg'),(25,13,'UP1690391296.jpg','/storage/photos/units/UP1690391296.jpg',0,NULL,NULL,1,'2023-07-26 09:08:16','2023-07-26 10:42:31',NULL,'/storage/photos/units/UP1690391296.jpg'),(26,14,'UP1690391308.jpg','/storage/photos/units/UP1690391308.jpg',0,NULL,NULL,1,'2023-07-26 09:08:28','2023-07-26 10:42:43',NULL,'/storage/photos/units/UP1690391308.jpg'),(27,14,'UP1690391311.jpg','/storage/photos/units/UP1690391311.jpg',0,NULL,NULL,1,'2023-07-26 09:08:31','2023-07-26 10:42:43',NULL,'/storage/photos/units/UP1690391311.jpg'),(28,14,'UP1690391315.jpg','/storage/photos/units/UP1690391315.jpg',0,NULL,NULL,1,'2023-07-26 09:08:35','2023-07-26 10:42:43',NULL,'/storage/photos/units/UP1690391315.jpg'),(29,14,'UP1690391321.jpg','/storage/photos/units/UP1690391321.jpg',0,NULL,NULL,1,'2023-07-26 09:08:41','2023-07-26 10:42:43',NULL,'/storage/photos/units/UP1690391321.jpg'),(30,14,'UP1690391325.jpg','/storage/photos/units/UP1690391325.jpg',0,NULL,NULL,1,'2023-07-26 09:08:45','2023-07-26 10:42:43',NULL,'/storage/photos/units/UP1690391325.jpg'),(31,14,'UP1690391329.jpg','/storage/photos/units/UP1690391329.jpg',0,NULL,NULL,1,'2023-07-26 09:08:49','2023-07-26 10:42:43',NULL,'/storage/photos/units/UP1690391329.jpg'),(32,14,'UP1690391334.jpg','/storage/photos/units/UP1690391334.jpg',0,NULL,NULL,1,'2023-07-26 09:08:54','2023-07-26 10:42:43',NULL,'/storage/photos/units/UP1690391334.jpg'),(33,14,'UP1690391338.jpg','/storage/photos/units/UP1690391338.jpg',0,NULL,NULL,1,'2023-07-26 09:08:58','2023-07-26 10:42:43',NULL,'/storage/photos/units/UP1690391338.jpg'),(34,14,'UP1690391342.jpg','/storage/photos/units/UP1690391342.jpg',1,NULL,NULL,1,'2023-07-26 09:09:02','2023-07-26 10:42:43',NULL,'/storage/photos/units/UP1690391342.jpg'),(35,14,'UP1690391346.jpg','/storage/photos/units/UP1690391346.jpg',0,NULL,NULL,1,'2023-07-26 09:09:06','2023-07-26 10:42:43',NULL,'/storage/photos/units/UP1690391346.jpg'),(36,15,'UP1690391366.jpg','/storage/photos/units/UP1690391366.jpg',0,NULL,NULL,1,'2023-07-26 09:09:26','2023-07-26 10:42:56',NULL,'/storage/photos/units/UP1690391366.jpg'),(37,15,'UP1690391369.jpg','/storage/photos/units/UP1690391369.jpg',1,NULL,NULL,1,'2023-07-26 09:09:29','2023-07-26 10:42:56',NULL,'/storage/photos/units/UP1690391369.jpg'),(38,15,'UP1690391374.jpg','/storage/photos/units/UP1690391374.jpg',0,NULL,NULL,1,'2023-07-26 09:09:34','2023-07-26 10:42:56',NULL,'/storage/photos/units/UP1690391374.jpg'),(39,15,'UP1690391377.jpg','/storage/photos/units/UP1690391377.jpg',0,NULL,NULL,1,'2023-07-26 09:09:37','2023-07-26 10:42:56',NULL,'/storage/photos/units/UP1690391377.jpg'),(40,15,'UP1690391382.jpg','/storage/photos/units/UP1690391382.jpg',0,NULL,NULL,1,'2023-07-26 09:09:42','2023-07-26 10:42:56',NULL,'/storage/photos/units/UP1690391382.jpg'),(41,15,'UP1690391385.jpg','/storage/photos/units/UP1690391385.jpg',0,NULL,NULL,1,'2023-07-26 09:09:45','2023-07-26 10:42:56',NULL,'/storage/photos/units/UP1690391385.jpg'),(42,15,'UP1690391389.jpg','/storage/photos/units/UP1690391389.jpg',0,NULL,NULL,1,'2023-07-26 09:09:49','2023-07-26 10:42:56',NULL,'/storage/photos/units/UP1690391389.jpg'),(43,15,'UP1690391393.jpg','/storage/photos/units/UP1690391393.jpg',0,NULL,NULL,1,'2023-07-26 09:09:53','2023-07-26 10:42:56',NULL,'/storage/photos/units/UP1690391393.jpg'),(44,16,'UP1690391414.jpg','/storage/photos/units/UP1690391414.jpg',0,NULL,NULL,1,'2023-07-26 09:10:14','2023-07-26 10:43:10',NULL,'/storage/photos/units/UP1690391414.jpg'),(45,16,'UP1690391417.jpg','/storage/photos/units/UP1690391417.jpg',0,NULL,NULL,1,'2023-07-26 09:10:17','2023-07-26 10:43:10',NULL,'/storage/photos/units/UP1690391417.jpg'),(46,16,'UP1690391423.jpg','/storage/photos/units/UP1690391423.jpg',0,NULL,NULL,1,'2023-07-26 09:10:23','2023-07-26 10:43:10',NULL,'/storage/photos/units/UP1690391423.jpg'),(47,16,'UP1690391427.jpg','/storage/photos/units/UP1690391427.jpg',0,NULL,NULL,1,'2023-07-26 09:10:27','2023-07-26 10:43:10',NULL,'/storage/photos/units/UP1690391427.jpg'),(48,16,'UP1690391431.jpg','/storage/photos/units/UP1690391431.jpg',1,NULL,NULL,1,'2023-07-26 09:10:31','2023-07-26 10:43:10',NULL,'/storage/photos/units/UP1690391431.jpg'),(49,16,'UP1690391436.jpg','/storage/photos/units/UP1690391436.jpg',0,NULL,NULL,1,'2023-07-26 09:10:36','2023-07-26 10:43:10',NULL,'/storage/photos/units/UP1690391436.jpg'),(50,16,'UP1690391438.jpg','/storage/photos/units/UP1690391438.jpg',0,NULL,NULL,1,'2023-07-26 09:10:38','2023-07-26 10:43:10',NULL,'/storage/photos/units/UP1690391438.jpg'),(51,16,'UP1690391513.jpg','/storage/photos/units/UP1690391513.jpg',0,NULL,NULL,1,'2023-07-26 09:11:53','2023-07-26 10:43:10',NULL,'/storage/photos/units/UP1690391513.jpg');
/*!40000 ALTER TABLE `unit_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `building_id` bigint(20) unsigned NOT NULL,
  `owner_user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT 'available, occupied, cancelled, pending, deleted',
  `type` tinyint(4) NOT NULL COMMENT 'studio, 1br, 2br',
  `furnished` tinyint(4) NOT NULL COMMENT 'bare, semi, fully',
  `enabled` tinyint(1) DEFAULT NULL,
  `allow_pets` tinyint(1) DEFAULT NULL,
  `allowed_occupants` tinyint(4) DEFAULT NULL,
  `is_loft` tinyint(1) DEFAULT NULL,
  `is_penthouse` tinyint(1) DEFAULT NULL,
  `sqm` double DEFAULT NULL,
  `floor` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_building_id_foreign` (`building_id`),
  KEY `owners_user_id` (`owner_user_id`),
  CONSTRAINT `owners_user_id` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `units_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (11,5,1,'QE815','QE815',NULL,3,2,2,1,1,4,NULL,NULL,NULL,'8th','2023-07-26 05:27:05','2023-07-26 05:27:05',NULL),(12,5,1,'QE423','QE423',NULL,3,1,1,1,1,2,NULL,NULL,NULL,'4th','2023-07-26 05:57:39','2023-07-26 05:57:39',NULL),(13,7,1,'RW1702','RW1702',NULL,3,2,3,1,1,4,NULL,NULL,NULL,'17th','2023-07-26 06:32:12','2023-07-26 06:32:12',NULL),(14,6,1,'OW101','OW101',NULL,3,2,2,1,NULL,4,NULL,NULL,NULL,'Ground','2023-07-26 06:34:54','2023-07-26 06:34:54',NULL),(15,4,1,'RE1408','RE1408',NULL,3,2,1,1,1,4,NULL,NULL,NULL,'14th','2023-07-26 06:55:23','2023-07-26 06:55:23',NULL),(16,8,1,'QW1021','QW1021',NULL,3,1,2,1,1,2,NULL,NULL,NULL,'10th','2023-07-26 07:02:35','2023-07-26 07:02:35',NULL);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@app.com',NULL,'$2y$10$KK6oiG3PERlWlk.tHPxWE.SpML2fbxs4wEtc5FO9XwWtLh9nENlIe',NULL,NULL,NULL,NULL,1,NULL,'2023-07-23 10:59:43','2023-07-23 10:59:43');
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

-- Dump completed on 2023-07-27  3:29:10
