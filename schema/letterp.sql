-- MySQL dump 10.16  Distrib 10.2.14-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: letterp
-- ------------------------------------------------------
-- Server version	10.2.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_code` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_code` (`company_code`),
  UNIQUE KEY `company_name` (`company_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
INSERT INTO `companies` (`id`, `company_code`, `company_name`, `createdAt`, `updatedAt`) VALUES (1,'LETTER-P','LETTER-P','2018-12-29 11:14:53','2018-12-29 11:14:53');
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `parents_food_id` int(11) DEFAULT NULL,
  `photo` varchar(2000) DEFAULT NULL,
  `foodtypeId` int(11) NOT NULL,
  `cost` double NOT NULL,
  `price` double NOT NULL,
  `currcode` varchar(3) NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp(),
  `userId` int(11) NOT NULL,
  `kitchenId` int(11) NOT NULL,
  `enabled_child_food` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `foods_ft_fk` (`foodtypeId`),
  KEY `foods_kc_fk` (`kitchenId`),
  CONSTRAINT `foods_ft_fk` FOREIGN KEY (`foodtypeId`) REFERENCES `atlas`.`food_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
INSERT INTO `food` (`id`, `food_name`, `parents_food_id`, `photo`, `foodtypeId`, `cost`, `price`, `currcode`, `enabled`, `createdAt`, `updatedAt`, `userId`, `kitchenId`, `enabled_child_food`) VALUES (1,'ໄກ່ທອດ',0,'../../../assets/images/No_Image_Available.gif',4,7000,10000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(2,'ປີກໄກ່ທອດ ທາລິຍາກິ',0,'../../../assets/images/No_Image_Available.gif',4,18000,25000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(3,'ປີກໄກ່ທອດ ນ້ຳປາ',0,'../../../assets/images/No_Image_Available.gif',4,13000,20000,'418',1,'2019-01-01 00:56:02','2018-12-31 17:54:56',18,1,0),(4,'ປີກໄກ່ ບາບີຄິວ',0,'../../../assets/images/No_Image_Available.gif',4,18000,25000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(5,'ນັດເກັດໄກ່',0,'../../../assets/images/No_Image_Available.gif',4,10000,15000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(6,'ໄກ່ຈໍ້',0,'../../../assets/images/No_Image_Available.gif',4,10000,15000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(7,'ໄກ່ສະຕິກ',0,'../../../assets/images/No_Image_Available.gif',4,10000,15000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(8,'ຟິສສະຕິກ',0,'../../../assets/images/No_Image_Available.gif',4,10000,15000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(10,'ກຸ້ງຊຸບແປ້ງທອດ',0,'../../../assets/images/No_Image_Available.gif',4,20000,28000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(11,'ປາດອນລີ້ຊຸບແປ້ງທອດ',0,'../../../assets/images/No_Image_Available.gif',4,13000,20000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(12,'ລູກຊີ້ນ ຮັອດດ໋ອກທອດ',0,'../../../assets/images/No_Image_Available.gif',4,7000,12000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(13,'ເຟຮນຟາຍ',0,'../../../assets/images/No_Image_Available.gif',4,5000,9000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(14,'ຕຳໝາກຮຸ່ງ',0,'../../../assets/images/No_Image_Available.gif',5,8000,12000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(15,'ຕຳເຂົ້າປຸ້ນ',0,'../../../assets/images/No_Image_Available.gif',5,8000,12000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(16,'ຕຳຫອຍແຄງ',0,'../../../assets/images/No_Image_Available.gif',5,20000,28000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(17,'ຕຳປູ',0,'../../../assets/images/No_Image_Available.gif',5,20000,28000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(18,'ຕຳທະເລ',0,'../../../assets/images/No_Image_Available.gif',5,20000,28000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(19,'ຕຳຕ່ອນ',0,'../../../assets/images/No_Image_Available.gif',5,10000,15000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(20,'ຕຳມົ້ວ',0,'../../../assets/images/No_Image_Available.gif',5,8000,15000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(21,'ຕຳຫມີ່ໄວໄວ',0,'../../../assets/images/No_Image_Available.gif',5,8000,15000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(22,'ຍຳປາມຶກ',0,'../../../assets/images/No_Image_Available.gif',5,20000,28000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(23,'ຍຳລວມມິດທະເລ',0,'../../../assets/images/No_Image_Available.gif',5,20000,28000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(24,'ຍຳເສັ້ນລ້ອນ',0,'../../../assets/images/No_Image_Available.gif',5,15000,22000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(25,'ຍຳໄວໄວ',0,'../../../assets/images/No_Image_Available.gif',5,10000,18000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(26,'ເຂົ້າອົບຫມໍ້ດິນ 7 ຈັກກະພັດ',0,'../../../assets/images/No_Image_Available.gif',1,80000,100000,'418',1,'2019-01-01 00:56:02','2019-01-02 16:50:42',18,1,0),(27,'ເຂົ້າອົບຫມໍ້ດິນ ຮ່ອງເຕ້',0,'../../../assets/images/No_Image_Available.gif',1,20000,32000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(28,'ເຂົ້າອົບຫມໍ້ດິນ ຊົງເຄື່ອງ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(29,'ເຂົ້າອົບຫມໍ້ດິນ ໃສ້ກອກຫວານ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(30,'ເຂົ້າມັນໄກ່ທອດ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(31,'ເຂົ້າມັນໄກ່ຕົ້ມ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(32,'ເຂົ້າຫມູກະທຽມ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:02','2019-01-01 00:56:02',18,1,0),(33,'ເຂົ້າ ຜັກບົ້ງໄຟແດງ',0,'../../../assets/images/No_Image_Available.gif',1,8000,16000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(34,'ເຂົ້າ ແກງຈືດເຕົ້າຮູ້ຫມູສັບ',0,'../../../assets/images/No_Image_Available.gif',1,13000,18000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(35,'ເຂົ້າໄຂ່ຈຽວ ຫມູສັບ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(36,'ເຂົ້າຫມູພິກໄທດຳ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(37,'ເຂົ້າກະເພົາ - ໄກ່,ຫມູ,ຫມູກອບ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(38,'ເຂົ້າກະເພົາກອບ - ໄກ່,ຫມູ,ຫມູກອບ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:03','2019-01-03 08:40:43',18,1,0),(39,'ເຂົ້າຜັກກາດນາ - ໄກ່,ຫມູ,ຫມູກອບ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(40,'ເຂົ້າຖົ່ວລັນເຕົາຜັດ - ໄກ່,ຫມູ,ຫມູກອບ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(41,'ເຂົ້າ ຜັດຂີ້ເມົາ - ໄກ່,ຫມູ,ຫມູກອບ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(42,'ເຂົ້າ ຜັດຊ່າ - ໄກ່,ຫມູ,ຫມູກອບ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(43,'ເຂົ້າ ຕົ້ມຍຳ - ໄກ່,ຫມູ,ຫມູກອບ',0,'../../../assets/images/No_Image_Available.gif',1,10000,16000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(44,'ເຂົ້າກະເພົາ - ງົວ,ທະເລ',0,'../../../assets/images/No_Image_Available.gif',1,13000,18000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(45,'ເຂົ້າກະເພົາກອບ - ງົວ,ທະເລ',0,'../../../assets/images/No_Image_Available.gif',1,13000,18000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(46,'ເຂົ້າຖົ່ວລັນເຕົາຜັດ - ງົວ,ທະເລ',0,'../../../assets/images/No_Image_Available.gif',1,13000,18000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(47,'ເຂົ້າ ຜັດຂີ້ເມົາ - ງົວ,ທະເລ',0,'../../../assets/images/No_Image_Available.gif',1,13000,18000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(48,'ເຂົ້າ ຜັດຊ່າ - ງົວ,ທະເລ',0,'../../../assets/images/No_Image_Available.gif',1,13000,18000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(49,'ເຂົ້າ ຕົ້ມຍຳ - ງົວ,ທະເລ',0,'../../../assets/images/No_Image_Available.gif',1,13000,18000,'418',1,'2019-01-01 00:56:03','2019-01-01 00:56:03',18,1,0),(50,'ເຂົ້າ ຜັດ',0,'../../../assets/images/No_Image_Available.gif',1,0,0,'418',1,'2019-01-01 02:03:05','2019-01-01 02:03:05',18,1,1),(51,'ທະເລ',50,'../../../assets/images/No_Image_Available.gif',1,13000,18000,'418',1,'2019-01-01 08:38:26','2019-01-01 08:38:26',18,1,0),(52,'ໝູກອບ',50,'../../../assets/images/No_Image_Available.gif',1,10000,15000,'418',1,'2019-01-01 08:41:05','2019-01-01 08:41:05',18,1,0);
UNLOCK TABLES;

--
-- Table structure for table `foodtypes`
--

DROP TABLE IF EXISTS `foodtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_type` varchar(255) NOT NULL,
  `food_type_desc` varchar(255) NOT NULL,
  `food_type_desc_la` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `food_type` (`food_type`),
  UNIQUE KEY `food_type_desc` (`food_type_desc`),
  UNIQUE KEY `food_type_desc_la` (`food_type_desc_la`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtypes`
--

LOCK TABLES `foodtypes` WRITE;
INSERT INTO `foodtypes` (`id`, `food_type`, `food_type_desc`, `food_type_desc_la`, `createdAt`, `updatedAt`) VALUES (1,'FOOD','Food','ອາຫານ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(2,'DRNK','DRINK','ເຄື່ອງດື່ມ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(3,'DSRT','Desert','ຂອງຫວານ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(4,'SNCK','Snack','ອາຫານທອດ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(5,'SLD','Slard','ຕຳ','2019-01-01 01:51:54','2019-01-01 01:51:54');
UNLOCK TABLES;

--
-- Table structure for table `kitchens`
--

DROP TABLE IF EXISTS `kitchens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kitchens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kitchen_code` varchar(255) NOT NULL,
  `kitchen_name` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `kitchen_code` (`kitchen_code`),
  UNIQUE KEY `kitchen_name` (`kitchen_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchens`
--

LOCK TABLES `kitchens` WRITE;
INSERT INTO `kitchens` (`id`, `kitchen_code`, `kitchen_name`, `userId`, `createdAt`, `updatedAt`) VALUES (1,'kitchen001','Out Side kitchen',0,'2019-01-01 01:52:32','2019-01-01 01:52:32'),(2,'kitchen002','Inside Kitchen',0,'2019-01-01 01:52:32','2019-01-01 01:52:32');
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(255) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_link` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `enabled` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_code` (`menu_code`),
  UNIQUE KEY `menu_name` (`menu_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
INSERT INTO `menus` (`id`, `menu_code`, `menu_name`, `menu_link`, `icon`, `enabled`, `createdAt`, `updatedAt`) VALUES (1,'Home','Home','/','home',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(2,'Sales','Sales','sale','shopping_cart',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(3,'Terminals','Terminals','terminal','dns',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(4,'POS','POS','pos','credit_card',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(5,'Food','Food','food','fastfood',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(6,'Reports','Reports','report','report',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(7,'Administator','Administator','administrator','settings',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(8,'Order Tracking','Order Tracking','tracking','done',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(9,'Users management','Users management','users','verified_user',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(10,'Kitchen monitor','Kitchen monitor','kitchenmon','kitchen',0,'2018-12-30 16:43:20','2018-12-30 16:43:20');
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_code` (`role_code`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
INSERT INTO `roles` (`id`, `role_code`, `role_name`, `createdAt`, `updatedAt`) VALUES (1,'admin','administrator','2018-12-28 20:24:08','2018-12-28 20:24:08'),(3,'staff','general staff normal user','2018-12-28 20:25:33','2018-12-28 20:35:12'),(4,'chef','chef','2019-01-01 10:41:43','2019-01-01 10:41:45');
UNLOCK TABLES;

--
-- Table structure for table `tranxmenus`
--

DROP TABLE IF EXISTS `tranxmenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tranxmenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tranxmenus_menu_fk` (`menuId`),
  KEY `tranxmenus_role_fk` (`roleId`),
  CONSTRAINT `tranxmenus_menu_fk` FOREIGN KEY (`menuId`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tranxmenus_role_fk` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tranxmenus`
--

LOCK TABLES `tranxmenus` WRITE;
INSERT INTO `tranxmenus` (`id`, `roleId`, `menuId`, `createdBy`, `createdAt`, `updatedAt`) VALUES (1,1,1,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(2,1,2,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(3,1,3,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(4,1,4,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(5,1,5,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(6,1,6,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(7,1,7,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(8,1,8,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(9,1,9,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(10,1,10,'system','2018-12-30 16:43:20','2018-12-30 16:43:20');
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_code` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `dateOfbirth` datetime DEFAULT NULL,
  `employed_date` datetime DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_code` (`employee_code`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `fullname` (`fullname`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
INSERT INTO `users` (`id`, `employee_code`, `gender`, `username`, `email`, `mobile`, `fullname`, `dateOfbirth`, `employed_date`, `photo_path`, `password`, `enabled`, `createdAt`, `updatedAt`, `roleId`) VALUES (18,'ee3842d8-11e7-439f-b4bc-396da4f76b16','M','admin','sayyalinh@gmail.com','02055588857','Soulisack SAYYALINH','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$GtFwDQuvYT2QoxsLCMosCOURqipZIl6ON1fPRA2mOa/GaDSFsmf2i',1,'2018-12-29 07:38:10','2018-12-29 07:38:10',1),(20,'1dd7182c-3d42-4da7-a2d9-5baee070e25d','F','pathana','pathana@gmail.com','03056789333','Pathana SAYYALINH','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$t9YBEPj7piRJp41cFAiGoOI7Q9oekHMsY2nb2K9iyN1px9rVvyq92',1,'2018-12-29 08:55:23','2018-12-29 08:57:07',1),(21,'dfdb7af2-6c20-425a-8c56-4f71ae205269','F','chef-01','chef-01@gmail.com','02055588856','chef-01','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$txQvHa0ZFb7G8fjVSdtErOpYU4DM7PjrxNZ2GaRT5hgN/Qnqrrr/u',1,'2019-01-01 10:42:46','2019-01-01 10:42:46',4),(22,'4c3843cb-21a2-4ac5-9afc-fecd2263b671','F','chef-02','chef-02@gmail.com','02055588855','chef-02','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$lz6RrvRSMq6sPVgRGnqjOOaBzTTcZn9ldPab0/dUISnjq3KNO.RSu',1,'2019-01-01 10:43:02','2019-01-01 10:43:02',4);
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-03 16:24:25
