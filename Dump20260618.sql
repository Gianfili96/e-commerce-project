CREATE DATABASE  IF NOT EXISTS `academy2026` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `academy2026`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: academy2026
-- ------------------------------------------------------
-- Server version	8.4.8

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
-- Table structure for table `cart_entity`
--

DROP TABLE IF EXISTS `cart_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_entity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdjpjq4qgt7k0w8xofh30arev9` (`product_id`),
  KEY `FKe5rowl9srrvo1uii368s40ufh` (`order_id`),
  CONSTRAINT `FKdjpjq4qgt7k0w8xofh30arev9` FOREIGN KEY (`product_id`) REFERENCES `product_entity` (`id`),
  CONSTRAINT `FKe5rowl9srrvo1uii368s40ufh` FOREIGN KEY (`order_id`) REFERENCES `order_entity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_entity`
--

LOCK TABLES `cart_entity` WRITE;
/*!40000 ALTER TABLE `cart_entity` DISABLE KEYS */;
INSERT INTO `cart_entity` VALUES (3,'2026-04-22 16:53:58.353056',1,19,32),(4,'2026-04-22 16:53:58.356653',1,19,34),(5,'2026-04-22 16:55:59.000458',1,20,32),(6,'2026-04-22 16:55:59.002472',1,20,36),(7,'2026-04-22 17:38:06.722716',1,21,32),(8,'2026-04-23 11:14:09.948613',1,22,32),(9,'2026-04-23 11:14:09.952129',1,22,34),(10,'2026-04-23 16:10:34.068546',1,23,34),(11,'2026-04-23 16:10:34.071030',1,23,36),(12,'2026-04-23 17:56:16.641689',1,24,32),(13,'2026-04-23 17:56:16.645782',1,24,34),(14,'2026-04-23 22:14:21.892225',1,25,32),(15,'2026-04-23 22:14:21.894220',1,25,34),(16,'2026-04-23 22:14:21.895881',1,25,36),(17,'2026-04-23 22:14:21.897919',1,25,37),(18,'2026-04-23 23:45:48.096481',1,26,32),(19,'2026-04-23 23:45:48.098469',1,26,34),(20,'2026-04-23 23:45:48.099983',1,26,36),(21,'2026-04-23 23:49:26.420850',1,27,40),(22,'2026-04-23 23:49:26.421850',1,27,41),(23,'2026-04-24 09:39:22.772686',1,28,43),(24,'2026-04-24 09:39:22.776214',1,28,42),(25,'2026-04-24 11:09:15.800895',1,29,34),(26,'2026-04-24 11:09:15.802897',1,29,37),(27,'2026-04-24 11:09:15.803896',1,29,42),(28,'2026-04-24 11:18:08.911855',4,30,32),(29,'2026-04-24 11:18:08.913361',1,30,34),(30,'2026-04-24 11:18:08.915372',1,30,36);
/*!40000 ALTER TABLE `cart_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_entity`
--

DROP TABLE IF EXISTS `category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_entity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_entity`
--

LOCK TABLES `category_entity` WRITE;
/*!40000 ALTER TABLE `category_entity` DISABLE KEYS */;
INSERT INTO `category_entity` VALUES (1,'Smartphone'),(2,'Laptop'),(9,'Abbigliamento'),(12,'TV'),(13,'Automobili'),(15,'Elettronica'),(16,'Fai da te'),(17,'Videogiochi'),(18,'Software'),(19,'Sport'),(20,'Cucina');
/*!40000 ALTER TABLE `category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangelog`
--

LOCK TABLES `databasechangelog` WRITE;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` VALUES ('1','my_name','changelog/db.changelog-master.xml','2026-04-07 10:35:23',1,'EXECUTED','9:66aa5dd6a1e0a4f3258c98ca80ce5b19','createTable tableName=test_table','',NULL,'4.29.2',NULL,NULL,'5550923260'),('20260409-02','academy','changelog/changesets/create_user_table.xml','2026-04-09 12:39:17',2,'EXECUTED','9:1234d0e448f1e3d42d58fb83510981b3','createTable tableName=user_entity','',NULL,'4.29.2',NULL,NULL,'5731157917'),('20260409-03','academy','changelog/changesets/create_user_table.xml','2026-04-09 12:39:18',3,'EXECUTED','9:747adf067dd6c3af5add34bbc470c9ef','addColumn tableName=user_entity','',NULL,'4.29.2',NULL,NULL,'5731157917'),('20260410-01','academy','changelog/changesets/create_user_table.xml','2026-04-10 01:38:24',4,'EXECUTED','9:240f91d78373acdd93031b7f746bc8a5','addColumn tableName=user_entity','',NULL,'4.29.2',NULL,NULL,'5777903990'),('20260414-01','academy','changelog/changesets/create_user_table.xml','2026-04-14 16:13:24',5,'EXECUTED','9:6ffa4fc45b1d536257f8facee3b45665','addColumn tableName=user_entity','',NULL,'4.29.2',NULL,NULL,'6176004138'),('20260414-01','academy','changelog/changesets/alter_product_table.xml','2026-04-14 16:43:43',6,'EXECUTED','9:1245988f18026c1f9eef5f558d8fd123','addColumn tableName=product_entity','',NULL,'4.29.2',NULL,NULL,'6177823429'),('20260414-02','academy','changelog/changesets/alter_product_table.xml','2026-04-14 16:51:37',7,'EXECUTED','9:55cecbb486b31d6eb0650cda724fd6e3','dropColumn tableName=product_entity','',NULL,'4.29.2',NULL,NULL,'6178297333'),('20260415-01','academy','changelog/changesets/alter_product_table.xml','2026-04-15 18:26:51',8,'EXECUTED','9:b8ab40adf6ed5caac7b045e97fc47ffd','renameColumn newColumnName=is_new, oldColumnName=isNew, tableName=product_entity; renameColumn newColumnName=old_price, oldColumnName=oldPrice, tableName=product_entity','',NULL,'4.29.2',NULL,NULL,'6270410958'),('20260415-02','academy','changelog/changesets/alter_product_table.xml','2026-04-15 18:26:51',9,'EXECUTED','9:f133f83f0ee59f1a1a980e946caf2b56','addColumn tableName=product_entity','',NULL,'4.29.2',NULL,NULL,'6270410958'),('20260416-01','academy','changelog/changesets/alter_product_table.xml','2026-04-16 18:08:05',10,'EXECUTED','9:da48cbccf9026e1050c3c8049f63eccc','renameColumn newColumnName=image_url, oldColumnName=image, tableName=product_entity','',NULL,'4.29.2',NULL,NULL,'6355685187'),('1776550232831-4','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:16:53',11,'EXECUTED','9:fceb8ca69c490dab809fe981e2e91e72','createTable tableName=cart_entity','',NULL,'4.27.0',NULL,NULL,'6694613650'),('1776550232831-5','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:16:53',12,'EXECUTED','9:6845def250f36bea63afdeaaf5b2395a','createTable tableName=order_entity','',NULL,'4.27.0',NULL,NULL,'6694613650'),('1776550232831-6','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:16:53',13,'EXECUTED','9:2d98411550359cc0de673cfbe6cc8b3a','addColumn tableName=user_entity','',NULL,'4.27.0',NULL,NULL,'6694613650'),('1776550232831-7','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:16:53',14,'EXECUTED','9:2c36d4d3ea875fb55e7d3def6e73dd98','addColumn tableName=user_entity','',NULL,'4.27.0',NULL,NULL,'6694613650'),('1776550232831-8','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:25:30',15,'MARK_RAN','9:4bf9e95cfe4935fffb2293f24aee85cd','addColumn tableName=product_entity','',NULL,'4.27.0',NULL,NULL,'6695130320'),('1776550232831-9','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:27:43',16,'MARK_RAN','9:ed8d37fe44e70437fb80a14eb612ee88','addColumn tableName=product_entity','',NULL,'4.27.0',NULL,NULL,'6695263147'),('1776550232831-10','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:27:43',17,'EXECUTED','9:8e00f7a2a96727ce25fd9f3814c3a0ac','addColumn tableName=user_entity','',NULL,'4.27.0',NULL,NULL,'6695263147'),('1776550232831-11','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:27:43',18,'EXECUTED','9:bce19ff74fa86781586917c2b951ab5e','addForeignKeyConstraint baseTableName=cart_entity, constraintName=FKdjpjq4qgt7k0w8xofh30arev9, referencedTableName=product_entity','',NULL,'4.27.0',NULL,NULL,'6695263147'),('1776550232831-12','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:27:43',19,'EXECUTED','9:7a37300b46ed5da29f4031c6e8a015b7','addForeignKeyConstraint baseTableName=cart_entity, constraintName=FKe5rowl9srrvo1uii368s40ufh, referencedTableName=order_entity','',NULL,'4.27.0',NULL,NULL,'6695263147'),('1776550232831-13','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:27:43',20,'EXECUTED','9:62c98923202f9687ed2c43a64cf49854','dropTable tableName=test_table','',NULL,'4.27.0',NULL,NULL,'6695263147'),('1776550232831-14','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:27:43',21,'MARK_RAN','9:0dfa0b9e8e90416d4632615dcd771757','dropColumn columnName=category, tableName=product_entity','',NULL,'4.27.0',NULL,NULL,'6695263147'),('1776550232831-15','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:27:43',22,'MARK_RAN','9:e4e5f9956e2d04cc8e6e4ea35bab6e64','dropColumn columnName=des, tableName=product_entity','',NULL,'4.27.0',NULL,NULL,'6695263147'),('1776550232831-16','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:27:43',23,'MARK_RAN','9:0aa72937f667498c2b295226e81a1368','dropColumn columnName=image, tableName=product_entity','',NULL,'4.27.0',NULL,NULL,'6695263147'),('1776550232831-1','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:27:43',24,'EXECUTED','9:256ad60fd00a540bbf8b8d04bec1512d','modifyDataType columnName=id, tableName=user_entity','',NULL,'4.27.0',NULL,NULL,'6695263147'),('1776550232831-2','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:27:43',25,'EXECUTED','9:fa5026b54e93e2663e53b5d0e6c1741b','modifyDataType columnName=old_price, tableName=product_entity','',NULL,'4.27.0',NULL,NULL,'6695263147'),('1776550232831-3','academy','changelog/changesets/create_order_and_cart_table.xml','2026-04-20 16:27:43',26,'EXECUTED','9:6f935ce71e45cd868056b8190eec01de','modifyDataType columnName=price, tableName=product_entity','',NULL,'4.27.0',NULL,NULL,'6695263147'),('1776561091290-1','academy','changelog/changesets/alter_order_table.xml','2026-04-20 16:27:43',27,'EXECUTED','9:d946b013ddf9db241dde49cccb286423','addColumn tableName=order_entity','',NULL,'4.27.0',NULL,NULL,'6695263147'),('1776561091290-2','academy','changelog/changesets/alter_order_table.xml','2026-04-20 16:27:43',28,'EXECUTED','9:4b126f9ba4fe77952dcfc997f53bf22f','addColumn tableName=order_entity; addForeignKeyConstraint baseTableName=order_entity, constraintName=FK_order_user, referencedTableName=user_entity','',NULL,'4.27.0',NULL,NULL,'6695263147'),('fix-category-autoincrement','academy','changelog/changesets/alter_category_table.xml','2026-04-21 15:44:34',29,'EXECUTED','9:cf8eb9af7a2b5b9132ac7bd33af49358','modifyDataType columnName=id, tableName=category_entity','',NULL,'4.27.0',NULL,NULL,'6779074809'),('20260421-10','academy','changelog/changesets/alter_product_table.xml','2026-04-22 09:38:48',30,'EXECUTED','9:52280aa9f2ed7c36a6680a1bd2077eb1','addColumn tableName=product_entity','',NULL,'4.27.0',NULL,NULL,'6843528662'),('1776848870989-1','academy','changelog/changesets/next_diff.xml','2026-04-22 12:06:22',31,'MARK_RAN','9:fceb8ca69c490dab809fe981e2e91e72','createTable tableName=cart_entity','',NULL,'4.27.0',NULL,NULL,'6852382753'),('1776848870989-2','academy','changelog/changesets/next_diff.xml','2026-04-22 12:06:22',32,'MARK_RAN','9:8bfdaf013a6a895d57e544d5eb8c08d8','createTable tableName=category_entity','',NULL,'4.27.0',NULL,NULL,'6852382753'),('1776848870989-3','academy','changelog/changesets/next_diff.xml','2026-04-22 12:06:22',33,'MARK_RAN','9:1ee43cb959ab346039d745be25657345','createTable tableName=order_entity','',NULL,'4.27.0',NULL,NULL,'6852382753'),('1776848870989-4','academy','changelog/changesets/next_diff.xml','2026-04-22 12:06:22',34,'MARK_RAN','9:68c244d7f67aee841979b361dbb11ce7','createTable tableName=product_entity','',NULL,'4.27.0',NULL,NULL,'6852382753'),('1776848870989-5','academy','changelog/changesets/next_diff.xml','2026-04-22 12:06:22',35,'EXECUTED','9:7b3ed7031a4a791b5d9fe6251cbf1e3b','createTable tableName=roles','',NULL,'4.27.0',NULL,NULL,'6852382753'),('1776848870989-6','academy','changelog/changesets/next_diff.xml','2026-04-22 12:06:22',36,'EXECUTED','9:935c6e401794bac10b4737bff8c88cc8','createTable tableName=user_roles','',NULL,'4.27.0',NULL,NULL,'6852382753'),('1776848870989-7','academy','changelog/changesets/next_diff.xml','2026-04-22 12:06:22',37,'EXECUTED','9:1870f8188cc3ca873c1ef7a230428a2b','createTable tableName=users','',NULL,'4.27.0',NULL,NULL,'6852382753'),('1776848870989-8','academy','changelog/changesets/next_diff.xml','2026-04-22 12:06:22',38,'EXECUTED','9:d7ab5cd6edd7917156fcd8a6a449b19f','addUniqueConstraint constraintName=UC_ROLESNAME_COL, tableName=roles','',NULL,'4.27.0',NULL,NULL,'6852382753'),('1776848870989-9','academy','changelog/changesets/next_diff.xml','2026-04-22 12:06:23',39,'EXECUTED','9:03c7f556521bca1e8f2b4526b469b4d9','addUniqueConstraint constraintName=UK6dotkott2kjsp8vw4d0m25fb7, tableName=users','',NULL,'4.27.0',NULL,NULL,'6852382753'),('1776848870989-10','academy','changelog/changesets/next_diff.xml','2026-04-22 12:06:23',40,'EXECUTED','9:a7f3f869a0718adfd57555a9fbdf71fd','addUniqueConstraint constraintName=UKr43af9ap4edm43mmtq01oddj6, tableName=users','',NULL,'4.27.0',NULL,NULL,'6852382753'),('1776848870989-11','academy','changelog/changesets/next_diff.xml','2026-04-22 12:16:28',41,'EXECUTED','9:b3cee682b8c1de1a258eec5632938c72','addForeignKeyConstraint baseTableName=order_entity, constraintName=FK1aty8556l6ubkgne265npb41f, referencedTableName=users','',NULL,'4.27.0',NULL,NULL,'6852988657'),('1776848870989-12','academy','changelog/changesets/next_diff.xml','2026-04-22 12:16:28',42,'EXECUTED','9:49aeef37cfd9896ab2d693f85e83afa2','addForeignKeyConstraint baseTableName=product_entity, constraintName=FK8kxxmqdokh3lthvw0t148w0bc, referencedTableName=category_entity','',NULL,'4.27.0',NULL,NULL,'6852988657'),('1776848870989-13','academy','changelog/changesets/next_diff.xml','2026-04-22 12:16:28',43,'MARK_RAN','9:bce19ff74fa86781586917c2b951ab5e','addForeignKeyConstraint baseTableName=cart_entity, constraintName=FKdjpjq4qgt7k0w8xofh30arev9, referencedTableName=product_entity','',NULL,'4.27.0',NULL,NULL,'6852988657'),('1776848870989-14','academy','changelog/changesets/next_diff.xml','2026-04-22 12:16:28',44,'MARK_RAN','9:7a37300b46ed5da29f4031c6e8a015b7','addForeignKeyConstraint baseTableName=cart_entity, constraintName=FKe5rowl9srrvo1uii368s40ufh, referencedTableName=order_entity','',NULL,'4.27.0',NULL,NULL,'6852988657'),('1776848870989-15','academy','changelog/changesets/next_diff.xml','2026-04-22 12:16:29',45,'EXECUTED','9:009a374fafbdac5d14a468379ce06496','addForeignKeyConstraint baseTableName=user_roles, constraintName=FKh8ciramu9cc9q3qcqiv4ue8a6, referencedTableName=roles','',NULL,'4.27.0',NULL,NULL,'6852988657'),('1776848870989-16','academy','changelog/changesets/next_diff.xml','2026-04-22 12:16:29',46,'EXECUTED','9:f2da6cd02f30dc69b0701bdcb105f485','addForeignKeyConstraint baseTableName=user_roles, constraintName=FKhfh9dx7w3ubf1co1vdev94g3f, referencedTableName=users','',NULL,'4.27.0',NULL,NULL,'6852988657');
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` tinyint NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangeloglock`
--

LOCK TABLES `databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` VALUES (1,0,NULL,NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_entity`
--

DROP TABLE IF EXISTS `order_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_entity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creation_date` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `total` decimal(19,2) DEFAULT NULL,
  `deactivated` tinyint(1) DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1aty8556l6ubkgne265npb41f` (`user_id`),
  CONSTRAINT `FK1aty8556l6ubkgne265npb41f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_order_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_entity`
--

LOCK TABLES `order_entity` WRITE;
/*!40000 ALTER TABLE `order_entity` DISABLE KEYS */;
INSERT INTO `order_entity` VALUES (19,'2026-04-22 16:53:58.366191',1,NULL,1,'0'),(20,'2026-04-22 16:55:59.008160',1,612.90,1,'0'),(21,'2026-04-22 17:38:06.725709',1,13.00,1,'0'),(22,'2026-04-23 11:14:09.962669',1,1013.00,1,'0'),(23,'2026-04-23 16:10:34.079525',1,1599.90,1,'0'),(24,'2026-04-23 17:56:16.653891',1,1013.00,0,'Mario.rossi'),(25,'2026-04-23 22:14:21.911253',1,1692.89,0,'Mario.rossi'),(26,'2026-04-23 23:45:48.100994',1,1511.90,0,'Mario.rossi'),(27,'2026-04-23 23:49:26.422874',3,159.98,0,'Giovanni.bianchi'),(28,'2026-04-24 09:39:22.786508',1,31.98,0,'Mario.rossi'),(29,'2026-04-24 11:09:15.805896',1,993.98,1,'Mario.rossi'),(30,'2026-04-24 11:18:08.916372',3,1550.86,0,'Giovanni.bianchi');
/*!40000 ALTER TABLE `order_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_entity`
--

DROP TABLE IF EXISTS `product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_entity` (
  `category_id` bigint DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `old_price` decimal(38,2) DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_new` tinyint DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deactivated` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8kxxmqdokh3lthvw0t148w0bc` (`category_id`),
  CONSTRAINT `FK8kxxmqdokh3lthvw0t148w0bc` FOREIGN KEY (`category_id`) REFERENCES `category_entity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_entity`
--

LOCK TABLES `product_entity` WRITE;
/*!40000 ALTER TABLE `product_entity` DISABLE KEYS */;
INSERT INTO `product_entity` VALUES (9,'T-shirt blu','100% cotone puro, ultra respirante e pieno comfort',15.00,12.99,'Nike','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa8PKAw6rwgI6oarYy1vmu_g-X3iFTS3DmFtvPbMXOYQ&s',1,32,0),(1,'Iphone 17 nero','chip A19, fotocamera frontale Center Stage per selfie di gruppo più facili, più resistenza ai graffi, un giorno intero di batteria; Nero',1299.99,899.00,'apple','https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQbB2KHyZjNzjdi3PfyGA49-V7zep6y-xliXFcXtFmpfUx8wf74tpMQCipRxZ6cINvfdIpn_c_O4t06Veefgd1gBBuKZLFH1um202frUR9iDO8X_jdg_DUIcjact2KaxQ&usqp=CAc',1,34,NULL),(12,'SmartTV 32\'','Tv smart 32\' oled 4k 144hz',899.90,599.90,'Samsung','https://m.media-amazon.com/images/I/81s95ZqxxrL._AC_UF1000,1000_QL80_.jpg',1,36,0),(1,'Nokia 5310','Ottimo telefono indistruttibile contro ogni forma di caduta testato dalla nasa',94.90,79.99,'Nokia','https://i.ebayimg.com/images/g/Tx4AAOSwAglnNgqc/s-l400.png',1,37,0),(1,'Galaxy s26 ultra','Samsung Galaxy S26 Ultra Smartphone AI, 256GB, 3 anni di Garanzia, Privacy Display Integrato, Processore Potente, Assistente Foto, Camera 200 MP, 5000 mAh, Black [Versione italiana]',1399.90,1199.90,'Samsung','https://m.media-amazon.com/images/I/71pZMAGPwkL._AC_SX679_.jpg',1,38,NULL),(15,'Gigabyte Radeon RX 9070','Scheda Grafica - 16 GB GDDR6, 256 bit, PCI-E 5.0, 3060 MHz Frequenza Base, 2 x DisplayPort, 2 x HDMI, GV-R9070XTGAMING OC-16GD',670.99,590.99,'Gigabyte','https://static.ollo.it/img/catalog/360x360/gigabyte-geforce-rtx-5090-gaming-oc-32g-scheda-grafica-32gb-gddr7-512-bit-pci-e-5-0-2550mhz-core-clock-3-x-dp-2-1a-1-x-hdmi-2-1b-nvidia-dlss-4-gv-n5090gaming-oc-32gd_1504302_931092.jpg',1,39,NULL),(17,'Ufo Robot Goldrake','Un grande ritorno Per la prima volta, vesti i panni di Goldrake e Umon Daisuke in questo gioco d\'azione/avventura dedicato al colosso di metallo.',14.99,9.99,'Microids','https://m.media-amazon.com/images/I/81zoNXofzbL._AC_SX569_.jpg',1,40,NULL),(18,'Windows 11 │ Pro Edition','Ottimizza la produttività e lo spazio sullo schermo in un attimo. Organizza le app aperte con layout di snap preconfigurati che si adattano in modo intelligente alle dimensioni del tuo schermo.',259.00,149.99,'Microsoft','https://m.media-amazon.com/images/I/61p-Ylv5vtL._AC_SX679_.jpg',1,41,NULL),(9,'Inter T-Shirt Snake','100% Cotone, lavaggio a mano, girocollo',19.99,14.99,'Inter','https://m.media-amazon.com/images/I/41EO-JooGEL._AC_SX679_.jpg',1,42,NULL),(19,'Pallone da calcio','Pallone da calcio per il tempo libero: pallone cucito a macchina misura 5 per bambini e adulti',20.00,16.99,'uhlsport','https://m.media-amazon.com/images/I/818CT5AZ9bL._AC_SX679_.jpg',1,43,NULL),(20,'Robot da cucina','Classico robot da cucina',100.00,49.99,'Moulinex','https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR9O04c_c3Oy8EHf3BBG2911EBV51o_yKJG1sepGlKkzhlYE5OYliHBUY7tidd2EBSrNcz8cTrqWKLxsMRb6KSzsMXvwsgtFwSLa6mjhX07Kk80pxfRExpIEIFt36eNE6R6hUBBXw&usqp=CAc',1,44,NULL);
/*!40000 ALTER TABLE `product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UC_ROLESNAME_COL` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'ROLE_ADMIN'),(1,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_entity`
--

DROP TABLE IF EXISTS `user_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_entity` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `creation_date` datetime(6) DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_entity`
--

LOCK TABLES `user_entity` WRITE;
/*!40000 ALTER TABLE `user_entity` DISABLE KEYS */;
INSERT INTO `user_entity` VALUES ('1','Michele','Fulco','USER','123',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(3,1),(2,2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `creation_date` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,_binary '','2026-04-22 12:22:01.160390','rossi@email.it',NULL,NULL,'$2a$10$uksgTB5lZ6cd9Vyv2yYyLeF.MVJnc3srpNCdJC20t33OexeGuDyua',NULL,'Mario.rossi'),(2,_binary '','2026-04-22 12:26:05.779655','admin@email.it',NULL,NULL,'$2a$10$8.RAQOHTMm6Ek9T7KHnQQuoBhEUrAvpWZM/PT5EnuLvv9LcpzlwW2',NULL,'Admin'),(3,_binary '','2026-04-23 23:48:28.307860','bianchi@email.it',NULL,NULL,'$2a$10$3zVcqJGaCRmd0wO.l.3UIO2Wtyjnrq.OpGoBFOL4ZXA9yinqC1kLe',NULL,'Giovanni.bianchi');
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

-- Dump completed on 2026-06-18 19:51:50
