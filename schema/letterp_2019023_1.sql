-- MySQL dump 10.17  Distrib 10.3.11-MariaDB, for osx10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: letterp
-- ------------------------------------------------------
-- Server version	10.3.11-MariaDB

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
-- Table structure for table `cashloads`
--

DROP TABLE IF EXISTS `cashloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startamount` decimal(10,0) NOT NULL DEFAULT 0,
  `saleamount` decimal(10,0) DEFAULT NULL,
  `closeamount` decimal(10,0) DEFAULT 0,
  `balance` decimal(10,0) DEFAULT 0,
  `loaded` tinyint(1) DEFAULT 0,
  `closed` tinyint(1) DEFAULT 0,
  `loaddatetime` datetime DEFAULT current_timestamp(),
  `closedatetime` datetime DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `loadcheckerId` int(11) NOT NULL,
  `cleared` tinyint(1) DEFAULT 0,
  `closecheckerId` int(11) DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp(),
  `cashloaddate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cashloaddetails_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashloads`
--

LOCK TABLES `cashloads` WRITE;
/*!40000 ALTER TABLE `cashloads` DISABLE KEYS */;
INSERT INTO `cashloads` (`id`, `startamount`, `saleamount`, `closeamount`, `balance`, `loaded`, `closed`, `loaddatetime`, `closedatetime`, `userId`, `loadcheckerId`, `cleared`, `closecheckerId`, `note`, `createdAt`, `updatedAt`, `cashloaddate`) VALUES (1,100000,NULL,0,0,1,1,'2019-01-13 20:20:00',NULL,18,23,0,NULL,'test','2019-01-13 20:20:00','2019-01-13 20:20:00',NULL),(2,207000,NULL,0,0,1,1,'2019-01-14 10:11:49','2019-01-14 13:53:35',25,24,0,NULL,NULL,'2019-01-14 10:11:49','2019-01-14 13:53:35',NULL),(3,415000,745000,1160000,0,1,1,'2019-01-14 15:07:39','2019-01-14 20:59:41',28,18,1,18,'ຍັງບໍ່ໄດ້ເອົາເຂົ້າ 20,000 ກີບ','2019-01-14 15:07:39','2019-01-14 21:16:46',NULL),(4,366000,613000,979000,0,1,1,'2019-01-15 08:57:20','2019-01-15 14:23:41',18,18,1,28,NULL,'2019-01-15 08:57:20','2019-01-15 14:25:16',NULL),(5,366000,799000,1165000,0,1,1,'2019-01-15 14:26:01','2019-01-16 13:54:22',25,18,1,28,NULL,'2019-01-15 14:26:01','2019-01-16 14:07:57',NULL),(6,336000,334000,670000,0,1,1,'2019-01-15 21:06:58','2019-01-15 21:17:26',28,18,1,18,'ເງິນເກີນ 30.000 ກິບ','2019-01-15 21:06:58','2019-01-15 21:18:52',NULL),(7,179000,NULL,0,0,1,0,'2019-01-16 14:08:59',NULL,25,18,0,NULL,NULL,'2019-01-16 14:08:59','2019-01-16 14:08:59',NULL),(8,314000,462000,776000,0,1,1,'2019-01-17 14:15:39','2019-01-17 14:15:44',24,25,1,28,NULL,'2019-01-17 14:15:39','2019-01-17 14:26:20','2019-01-17'),(9,314000,NULL,0,0,1,0,'2019-01-17 14:27:19',NULL,28,18,0,NULL,NULL,'2019-01-17 14:27:19','2019-01-17 14:27:19','2019-01-17'),(10,314000,225000,539000,0,1,1,'2019-01-17 20:35:36','2019-01-17 20:35:43',32,28,1,18,'ບໍ່ພໍ 20,000','2019-01-17 20:35:36','2019-01-17 20:51:47','2019-01-17'),(11,294000,364000,658000,0,1,1,'2019-01-18 08:59:29','2019-01-18 14:12:44',24,25,1,32,NULL,'2019-01-18 08:59:29','2019-01-18 14:25:08','2019-01-18'),(12,317000,NULL,0,0,1,0,'2019-01-18 14:28:46',NULL,24,28,0,NULL,NULL,'2019-01-18 14:28:46','2019-01-18 14:28:46','2019-01-18');
/*!40000 ALTER TABLE `cashloads` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `company_code`, `company_name`, `createdAt`, `updatedAt`) VALUES (1,'LETTER-P','LETTER-P','2018-12-29 11:14:53','2018-12-29 11:14:53');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_code` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dateOfBirth` datetime NOT NULL,
  `currentAddress` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `registeredDate` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullname` (`fullname`),
  UNIQUE KEY `tel` (`tel`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `customer_code` (`customer_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`id`, `customer_code`, `gender`, `fullname`, `dateOfBirth`, `currentAddress`, `tel`, `email`, `photo`, `registeredDate`, `active`, `createdAt`, `updatedAt`) VALUES (1,'AAAAAAAAAA','M','ຊາຍ','2019-01-03 16:00:02','dongdok','02055588857','sayyalinh@gmail.com','non','2019-01-03 16:00:28',1,'2019-01-03 16:00:33','2019-01-03 16:00:35'),(2,'BBBBBBBBBB','F','ຍິງ','2019-01-06 15:15:46','dongdok','02055599955','sayyalinh@letter-p.com','non','2019-01-06 15:16:17',1,'2019-01-06 15:16:34','2019-01-06 15:16:34');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
  `food_name_en` varchar(255) DEFAULT NULL,
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
  KEY `food__user_fk` (`userId`),
  CONSTRAINT `food__user_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foods_ft_fk` FOREIGN KEY (`foodtypeId`) REFERENCES `foodtypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` (`id`, `food_name`, `food_name_en`, `parents_food_id`, `photo`, `foodtypeId`, `cost`, `price`, `currcode`, `enabled`, `createdAt`, `updatedAt`, `userId`, `kitchenId`, `enabled_child_food`) VALUES (50,'ເຂົ້າ ຜັດ','Fire rice',0,'http://139.59.216.238:5005/images/uploads/foods/1027.jpg',1,0,0,'418',1,'2019-01-01 02:03:05','2019-01-01 02:03:05',18,1,1),(53,'ກະເພົາ','ka-phao',0,'http://139.59.216.238:5005/images/uploads/foods/702669572.jpg',1,0,0,'418',1,'2019-01-04 04:56:32','2019-01-04 04:56:32',18,1,1),(54,'ງົວ','pork',53,'http://139.59.216.238:5005/images/uploads/foods/702669572.jpg',1,13000,18000,'418',1,'2019-01-04 04:57:03','2019-01-04 04:57:03',18,1,0),(55,'ທະເລ','seafood',53,'http://139.59.216.238:5005/images/uploads/foods/702669572.jpg',1,13000,18000,'418',1,'2019-01-04 04:57:18','2019-01-04 04:57:18',18,1,0),(56,'ທະເລ','Sea food',50,'http://139.59.216.238:5005/images/uploads/foods/1027.jpg',1,13000,18000,'418',1,'2019-01-04 16:30:54','2019-01-04 16:30:54',18,1,0),(60,'ໂກໂກ້ ນົມສົດ','ice cocoa',0,'http://139.59.216.238:5005/images/uploads/foods/coco.png',9,5800,13000,'418',1,'2019-01-04 16:53:19','2019-01-16 22:09:05',18,2,0),(61,'ນົມສົດ ຄາຣາເມລ','ice caramel',0,'http://139.59.216.238:5005/images/uploads/foods/caramel.png',9,7000,13000,'418',1,'2019-01-04 16:57:38','2019-01-16 22:10:23',18,2,0),(62,'ເຜືອກຫອມນົມສົດ','taro milk',0,'http://139.59.216.238:5005/images/uploads/foods/taro7.png',9,10000,13000,'418',1,'2019-01-04 16:59:07','2019-01-04 16:59:07',18,2,0),(63,'ຊາຂຽວ','green tea',0,'http://139.59.216.238:5005/images/uploads/foods/greentea2.png',9,10000,13000,'418',1,'2019-01-04 17:00:16','2019-01-04 17:00:16',18,2,0),(64,'ນົມສົດກ້ວຍຫອມ','fresh milk',0,'http://139.59.216.238:5005/images/uploads/foods/bananamilk.png',9,10000,13000,'418',1,'2019-01-04 17:03:28','2019-01-04 17:03:28',18,2,0),(65,'ດັບໂບ້ ຊ໋ອກໂກ້','double choco',0,'http://139.59.216.238:5005/images/uploads/foods/cocoFrap7.png',10,13000,17000,'418',1,'2019-01-04 17:05:47','2019-01-04 17:05:47',18,2,0),(66,'ຊາຂຽວປັ່ນ','green tea Frap',0,'http://139.59.216.238:5005/images/uploads/foods/greenteaFrap6.png',10,13000,17000,'418',1,'2019-01-04 17:06:46','2019-01-04 17:06:46',18,2,0),(67,'ສະຕຣໍເບີຣີ ໂຍເກີສ','strawberry yogurt',0,'http://139.59.216.238:5005/images/uploads/foods/strawfrap7.png',10,13000,17000,'418',1,'2019-01-04 17:07:53','2019-01-04 17:07:53',18,2,0),(68,'ແມັງໂກ້ ໂຍເກີສ','mango yogurt',0,'http://139.59.216.238:5005/images/uploads/foods/mangomilk.png',10,13000,17000,'418',1,'2019-01-04 17:10:31','2019-01-04 17:10:31',18,2,0),(69,'ຊ໋ອກໂກ້ ບລາວນີ້','choco brownie',0,'http://139.59.216.238:5005/images/uploads/foods/cocoFrap6.png',10,13000,17000,'418',1,'2019-01-04 17:12:28','2019-01-04 17:12:28',18,2,0),(70,'ນ້ຳບຣູເບີຣີ','blue berry',0,'http://139.59.216.238:5005/images/uploads/foods/blueberry.png',2,8000,10000,'418',1,'2019-01-04 17:13:41','2019-01-04 17:13:41',18,2,0),(71,'ນ້ຳໝາກນອດ','passion fruit',0,'http://139.59.216.238:5005/images/uploads/foods/passion_resized.gif',2,8000,10000,'418',1,'2019-01-04 17:14:28','2019-01-04 17:14:28',18,2,0),(72,'ນ້ຳອະງຸ່ນ','grape juice',0,'http://139.59.216.238:5005/images/uploads/foods/grape1.png',2,8000,10000,'418',1,'2019-01-04 17:15:21','2019-01-04 17:15:21',18,2,0),(73,'ນ້ຳລີ້ນຈິ່','lychee juice',0,'http://139.59.216.238:5005/images/uploads/foods/lychee1.png',2,8000,10000,'418',1,'2019-01-04 17:16:00','2019-01-04 17:16:00',18,2,0),(74,'ນ້ຳດື່ມ ຫົວເສືອ','water',0,'http://139.59.216.238:5005/images/uploads/foods/la_tigerhead-drinking-water.png',16,2000,3000,'418',1,'2019-01-04 17:17:15','2019-01-16 22:52:52',18,2,0),(75,'ຜັດໄທ','Phat-thai',0,'http://139.59.216.238:5005/images/uploads/foods/phatthai.png',11,0,0,'418',1,'2019-01-05 03:06:03','2019-01-05 03:06:03',18,1,1),(76,'ທະເລ','Sea food',75,'http://139.59.216.238:5005/images/uploads/foods/phatthai.png',11,13000,18000,'418',1,'2019-01-05 03:09:06','2019-01-05 03:09:06',18,1,0),(77,'ສຸກກີ້ນ້ຳ','Suki',0,'http://139.59.216.238:5005/images/uploads/foods/baannoi-sukee35.jpg',11,0,0,'418',1,'2019-01-05 03:10:52','2019-01-05 03:10:52',18,1,1),(78,'ໝູ','pork',77,'http://139.59.216.238:5005/images/uploads/foods/suki.png',11,10000,16000,'418',1,'2019-01-05 03:11:53','2019-01-05 03:11:53',18,1,0),(79,'ສະປາເກັດຕີ້','spaghetti',0,'http://139.59.216.238:5005/images/uploads/foods/spagettytomato.png',12,0,0,'418',1,'2019-01-05 03:13:12','2019-01-05 03:13:12',18,1,1),(80,'ຊ໋ອດໝາກເລັ່ນ','tomato',79,'http://139.59.216.238:5005/images/uploads/foods/spagettytomato.png',12,10000,18000,'418',1,'2019-01-05 03:14:44','2019-01-05 03:14:44',18,1,0),(81,'ກະເພົາ ທະເລ','Ka-phao seafood',79,'http://139.59.216.238:5005/images/uploads/foods/spa2.png',12,13000,20000,'418',1,'2019-01-05 03:16:52','2019-01-05 03:16:52',18,1,0),(82,'ດາໂບນ່າຣ່າ ໝູ','carbo pork',79,'http://139.59.216.238:5005/images/uploads/foods/spagettispicy.png',12,10000,18000,'418',1,'2019-01-05 03:18:57','2019-01-05 03:18:57',18,1,0),(83,'ດາໂບນ່າຣ່າ ທະເລ','carbo seafood',79,'http://139.59.216.238:5005/images/uploads/foods/spagettispicy.png',12,13000,20000,'418',1,'2019-01-05 03:19:41','2019-01-05 03:19:41',18,1,0),(84,'ກະເພົາ','-',79,'http://139.59.216.238:5005/images/uploads/foods/spa.png',12,10000,18000,'418',1,'2019-01-05 03:20:29','2019-01-05 03:20:29',18,1,0),(85,'ກະເພົາ ທະເລ','-',79,'http://139.59.216.238:5005/images/uploads/foods/spa.png',12,13000,20000,'418',1,'2019-01-05 03:21:39','2019-01-05 03:21:39',18,1,0),(86,'ມັກກະໂລນີ','macaroni',0,'http://139.59.216.238:5005/images/uploads/foods/img_6779.jpg',11,0,0,'418',1,'2019-01-05 03:24:20','2019-01-05 03:24:20',18,1,1),(87,'ຊ໋ອດແດງ','tomato',86,'http://139.59.216.238:5005/images/uploads/foods/img_6779.jpg',11,10000,16000,'418',1,'2019-01-05 03:25:19','2019-01-05 03:25:19',18,1,0),(88,'ກະເພົາ ໄກ່','Ka-phao chick',86,'http://139.59.216.238:5005/images/uploads/foods/photo.jpg',11,10000,16000,'418',1,'2019-01-05 03:27:28','2019-01-05 03:27:28',18,1,0),(89,'ກະເພົາ ໝູ','Ka-phao pork',86,'http://139.59.216.238:5005/images/uploads/foods/photo.jpg',11,10000,16000,'418',1,'2019-01-05 03:27:57','2019-01-05 03:27:57',18,1,0),(90,'ຂີ້ເມົາ ໝູ','khee-mao pork',86,'http://139.59.216.238:5005/images/uploads/foods/ny3p2uf7ft4Wup2C4JR-o.jpg',11,10000,16000,'418',1,'2019-01-05 03:30:02','2019-01-05 03:30:02',18,1,0),(91,'ຂີ້ເມົາ ໄກ່','khee-mao chick',86,'http://139.59.216.238:5005/images/uploads/foods/ny3p2uf7ft4Wup2C4JR-o.jpg',11,10000,16000,'418',1,'2019-01-05 03:30:48','2019-01-05 03:30:48',18,1,0),(92,'ຂີ້ເມົາ ທະເລ','khee-mao seafood',86,'http://139.59.216.238:5005/images/uploads/foods/ny3p2uf7ft4Wup2C4JR-o.jpg',11,13000,18000,'418',1,'2019-01-05 03:32:03','2019-01-05 03:32:03',18,1,0),(93,'ໄກ່','chick',75,'http://139.59.216.238:5005/images/uploads/foods/ID_1224_56f8d6cdedc6b.jpg',11,10000,16000,'418',1,'2019-01-05 03:33:17','2019-01-05 03:33:17',18,1,0),(94,'ໝູ','pork',75,'http://139.59.216.238:5005/images/uploads/foods/ID_1224_56f8d6cdedc6b.jpg',11,10000,16000,'418',1,'2019-01-05 03:33:52','2019-01-05 03:33:52',18,1,0),(95,'ເສັ້ນໃຫຍ່','noodle',0,'http://139.59.216.238:5005/images/uploads/foods/hqdefault.jpg',11,0,0,'418',1,'2019-01-05 03:35:53','2019-01-05 03:35:53',18,1,1),(96,'ລາດໜ້າ ໝູ','pork',95,'http://139.59.216.238:5005/images/uploads/foods/hqdefault.jpg',11,10000,16000,'418',1,'2019-01-05 03:36:45','2019-01-05 03:36:45',18,1,0),(97,'ລາດໜ້າ ໄກ່','chick',95,'http://139.59.216.238:5005/images/uploads/foods/hqdefault.jpg',11,10000,16000,'418',1,'2019-01-05 03:37:24','2019-01-05 03:37:24',18,1,0),(98,'ລາດໜ້າ ທະເລ','sea food',95,'http://139.59.216.238:5005/images/uploads/foods/hqdefault.jpg',11,13000,18000,'418',1,'2019-01-05 03:38:14','2019-01-05 03:38:14',18,1,0),(99,'ຜັດຊີອີ້ວ ໝູ','pork',95,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault.jpg',11,10000,16000,'418',1,'2019-01-05 03:39:35','2019-01-05 03:39:35',18,1,0),(100,'ຜັດຊີອີ້ວ ໄກ່','chick',95,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault.jpg',11,10000,16000,'418',1,'2019-01-05 03:40:12','2019-01-05 03:40:12',18,1,0),(101,'ຜັດຊີອີ້ວ ທະເລ','sea food',95,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault.jpg',11,13000,18000,'418',1,'2019-01-05 03:41:07','2019-01-05 03:41:07',18,1,0),(102,'ໝີ່ກອບລາດໜ້າ','Mi-krob',0,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (1).jpg',11,0,0,'418',1,'2019-01-05 03:42:31','2019-01-05 03:42:31',18,1,1),(103,'ໝູ','pork',102,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (1).jpg',11,10000,16000,'418',1,'2019-01-05 03:43:05','2019-01-05 03:43:05',18,1,0),(104,'ໄກ່','chick',102,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (1).jpg',11,10000,16000,'418',1,'2019-01-05 03:43:31','2019-01-05 03:43:31',18,1,0),(105,'ທະເລ','Sea food',102,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (1).jpg',11,13000,18000,'418',1,'2019-01-05 03:43:58','2019-01-05 03:43:58',18,1,0),(106,'ສຸກກິ້ ແຫ້ງ','suki',0,'http://139.59.216.238:5005/images/uploads/foods/suki.jpg',11,0,0,'418',1,'2019-01-05 03:46:43','2019-01-05 03:46:43',18,1,1),(107,'ທະເລ','Sea food',106,'http://139.59.216.238:5005/images/uploads/foods/suki.jpg',11,13000,18000,'418',1,'2019-01-05 03:47:14','2019-01-05 03:47:14',18,1,0),(108,'ໝູ','pork',106,'http://139.59.216.238:5005/images/uploads/foods/suki.jpg',11,10000,16000,'418',1,'2019-01-05 03:47:54','2019-01-05 03:47:54',18,1,0),(109,'ໄກ່','chick',106,'http://139.59.216.238:5005/images/uploads/foods/suki.jpg',11,10000,16000,'418',1,'2019-01-05 03:48:24','2019-01-05 03:48:24',18,1,0),(110,'ທະເລ','Sea food',77,'http://139.59.216.238:5005/images/uploads/foods/suki.png',11,13000,18000,'418',1,'2019-01-05 03:49:50','2019-01-05 03:49:50',18,1,0),(111,'ໄກ່','chick',77,'http://139.59.216.238:5005/images/uploads/foods/suki.png',11,10000,16000,'418',1,'2019-01-05 03:50:29','2019-01-05 03:50:29',18,1,0),(112,'ໄກ່','chick',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:17:24','2019-01-05 04:17:24',18,1,0),(113,'ໝູ','pork',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:17:59','2019-01-05 04:17:59',18,1,0),(114,'ເຂົ້າ ຂິ້ເມົາ ໄກ່','-',0,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:19:24','2019-01-18 09:35:15',18,1,0),(115,'ເຂົ້າ ຂີ້ເມົາ ໝູ','-',0,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:20:31','2019-01-18 09:37:39',18,1,0),(116,'ເຂົ້າ ຂີ້ເມົາ ທະເລ','-',0,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,13000,18000,'418',1,'2019-01-05 04:21:53','2019-01-18 09:38:35',18,1,0),(117,'ໝູ','-',53,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:23:07','2019-01-18 09:57:33',18,1,0),(118,'ເຂົ້າ ກະເພົາ ໄກ່','-',53,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',0,'2019-01-05 04:23:30','2019-01-18 10:27:39',18,1,0),(119,'ເຂົ້າ ກະເພົາ ທະເລ','-',53,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,13000,18000,'418',0,'2019-01-05 04:24:16','2019-01-18 10:28:15',18,1,0),(120,'ໝູ','-',194,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:25:28','2019-01-18 09:53:23',18,1,0),(121,'ໄກ່','-',194,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:31:06','2019-01-18 09:54:07',18,1,0),(122,'ທະເລ','-',194,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,13000,18000,'418',1,'2019-01-05 04:31:50','2019-01-18 09:54:37',18,1,0),(123,'ເຂົ້າ ຜັກກາດນາ','-',0,'http://139.59.216.238:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,0,0,'418',1,'2019-01-05 04:33:23','2019-01-05 04:33:23',18,1,1),(124,'ໝູ','pork',123,'http://139.59.216.238:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,10000,16000,'418',1,'2019-01-05 04:33:52','2019-01-05 04:33:52',18,1,0),(125,'ໄກ່','chick',123,'http://139.59.216.238:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,10000,16000,'418',1,'2019-01-05 04:34:14','2019-01-05 04:34:14',18,1,0),(126,'ທະເລ','Sea food',123,'http://139.59.216.238:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,13000,18000,'418',1,'2019-01-05 04:34:37','2019-01-05 04:34:37',18,1,0),(127,'ເຂົ້າ ຖົ່ວລັນເຕົາຜັດ','-',0,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,0,0,'418',1,'2019-01-05 04:36:35','2019-01-05 04:36:35',18,1,1),(128,'ໝູ','pork',127,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,10000,16000,'418',1,'2019-01-05 04:36:56','2019-01-05 04:36:56',18,1,0),(129,'ໄກ່','chick',127,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,10000,16000,'418',1,'2019-01-05 04:37:18','2019-01-05 04:37:18',18,1,0),(130,'ທະເລ','Sea food',127,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,13000,18000,'418',1,'2019-01-05 04:37:43','2019-01-05 04:37:43',18,1,0),(131,'ເຂົ້າມັນໄກ່','khao-mun-kai',0,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,10000,16000,'418',1,'2019-01-05 04:39:21','2019-01-05 04:39:21',18,1,0),(132,'ເຂົ້າມັນໄກ່ ກອບ','khao-mun-kai-krob',0,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (2).jpg',1,10000,16000,'418',1,'2019-01-05 04:40:06','2019-01-05 04:40:06',18,1,0),(133,'ເຂົ້າໝູ ພິກໄທດຳ','pik-thai-dumm',0,'http://139.59.216.238:5005/images/uploads/foods/tmp1_133058_20161015_21333570.JPG',1,10000,16000,'418',1,'2019-01-05 04:41:38','2019-01-05 04:41:38',18,1,0),(134,'ເຂົ້າ ຂິງໄກ່','khing-kai',0,'http://139.59.216.238:5005/images/uploads/foods/tmp1_133058_20161015_21333570.JPG',1,10000,16000,'418',1,'2019-01-05 04:42:10','2019-01-18 10:02:19',18,1,0),(135,'ເຂົ້າ ໝູທອດກະທຽມ','pork with garlic',0,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (3).jpg',1,10000,16000,'418',1,'2019-01-05 04:43:43','2019-01-05 04:43:43',18,1,0),(136,'ເຂົ້າ ໄຂ່ຈຽວ ໝູສັບ','fire egg pork',0,'http://139.59.216.238:5005/images/uploads/foods/1442885991-imagejpeg-o.jpg',1,10000,16000,'418',1,'2019-01-05 04:44:46','2019-01-05 04:44:46',18,1,0),(137,'ເຂົ້າ ຜັກບົ້ງໄຟແດງ','phuk-bong-faideng',0,'http://139.59.216.238:5005/images/uploads/foods/download (2).jpeg',1,10000,16000,'418',1,'2019-01-05 04:46:27','2019-01-18 10:03:18',18,1,0),(138,'ເຟຣນຟາຍ','French fries',0,'http://139.59.216.238:5005/images/uploads/foods/69b67c8f33cfd77dda368f90da3450a0.png',4,5000,9000,'418',1,'2019-01-05 04:48:16','2019-01-05 04:48:16',18,1,0),(139,'ໄກ່ທອດ','fries chicken',0,'http://139.59.216.238:5005/images/uploads/foods/2cb0f96c970652f59310d581dc21b497.png',4,7000,10000,'418',1,'2019-01-05 04:49:32','2019-01-05 04:49:32',18,1,0),(140,'ທອດລຸກຊີ້ນ ຮັອດດອກ','meatball',0,'http://139.59.216.238:5005/images/uploads/foods/57fa34df8e7c0_1024.jpg',4,7000,12000,'418',1,'2019-01-05 04:50:46','2019-01-05 04:50:46',18,1,0),(141,'ນັກເກັດໄກ່','chick nuggets',0,'http://139.59.216.238:5005/images/uploads/foods/nudgetkai1.png',4,10000,15000,'418',1,'2019-01-05 04:52:31','2019-01-05 04:52:31',18,1,0),(142,'ໄກ່ສະຕິກ','chick stick',0,'http://139.59.216.238:5005/images/uploads/foods/04849d5e5b88f8b1703370d89512bead.png',4,10000,15000,'418',1,'2019-01-05 04:53:56','2019-01-05 04:53:56',18,1,0),(143,'ທອດໄກ່ຈໍ້','kai-jor',0,'http://139.59.216.238:5005/images/uploads/foods/download (3).jpeg',4,10000,15000,'418',1,'2019-01-05 04:55:10','2019-01-05 04:55:10',18,1,0),(144,'ຟິຊສະຕິກ','fish stick',0,'http://139.59.216.238:5005/images/uploads/foods/fish-stick-png-1.png',4,10000,15000,'418',1,'2019-01-05 04:56:08','2019-01-05 04:56:08',18,1,0),(145,'ປີກໄກ່ ທອດນ້ຳປາ','wing-nampa',0,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (4).jpg',4,13000,20000,'418',1,'2019-01-05 04:57:48','2019-01-05 04:57:48',18,1,0),(146,'ປາດອນລິ໊ ຊຸບແປ້ງທອດ','dolly fires',0,'http://139.59.216.238:5005/images/uploads/foods/635749-img-1349336040-1.jpg',4,13000,20000,'418',1,'2019-01-05 04:59:16','2019-01-05 04:59:16',18,1,0),(147,'ປີກໄກ່ທອດ ທາລິຢາກິ','wing-teriyaki',0,'http://139.59.216.238:5005/images/uploads/foods/hqdefault (1).jpg',4,18000,25000,'418',1,'2019-01-05 05:01:04','2019-01-05 05:01:04',18,1,0),(148,'ປີກໄກ່ທອດ ບາບີຄິວ','wing-BBQ',0,'http://139.59.216.238:5005/images/uploads/foods/download (4).jpeg',4,18000,25000,'418',1,'2019-01-05 05:02:03','2019-01-05 05:02:03',18,1,0),(149,'ຕຳໝາກຮຸ່ງ','papaya salad',0,'http://139.59.216.238:5005/images/uploads/foods/702669572.jpg',5,8000,12000,'418',1,'2019-01-05 09:12:08','2019-01-09 03:00:26',18,1,0),(150,'ຕຳເຂົ້າປຸ້ນ','tum khao pun',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1217.JPG',5,8000,12000,'418',1,'2019-01-08 02:45:45','2019-01-08 02:45:45',18,1,0),(151,'ຕຳຕ່ອນ','tum ton',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1218.JPG',5,10000,15000,'418',1,'2019-01-08 02:49:52','2019-01-08 02:49:52',18,1,0),(152,'ຕຳມົ້ວ','tum moua',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1218.JPG',5,8000,15000,'418',1,'2019-01-08 02:51:00','2019-01-08 02:51:00',18,1,0),(153,'ຕຳໝີ່ໄວໄວ','tum vai vai',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1218.JPG',5,8000,15000,'418',1,'2019-01-08 02:51:45','2019-01-08 02:51:45',18,1,0),(154,'ຕຳທະເລ','tum tha le',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1218.JPG',5,20000,28000,'418',1,'2019-01-08 02:52:34','2019-01-08 02:52:34',18,1,0),(155,'ຕຳຫອຍແຄງ','tum hoy khaeng',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1217.JPG',5,20000,28000,'418',1,'2019-01-08 02:53:17','2019-01-08 02:53:17',18,1,0),(156,'ຕຳປູ','tum poo',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1218.JPG',5,20000,28000,'418',1,'2019-01-08 02:53:58','2019-01-08 02:53:58',18,1,0),(157,'ຍຳປາມຶກ','yum pa muek',0,'http://139.59.216.238:5005//images/uploads/foods/photo (1).jpg',13,20000,28000,'418',1,'2019-01-08 02:57:07','2019-01-08 02:57:07',18,1,0),(158,'ຍຳລວມມິດທະເລ','yum tha le luam mit',0,'http://139.59.216.238:5005//images/uploads/foods/photo (1).jpg',13,20000,28000,'418',1,'2019-01-08 02:57:44','2019-01-08 02:57:44',18,1,0),(159,'ຍຳເສັ້ນລ້ອນ','yum sen lon',0,'http://139.59.216.238:5005//images/uploads/foods/photo (1).jpg',13,15000,22000,'418',1,'2019-01-08 02:58:50','2019-01-08 02:58:50',18,1,0),(160,'ຍຳໄວໄວ','yum vai vai',0,'http://139.59.216.238:5005//images/uploads/foods/maxresdefault (5).jpg',13,10000,18000,'418',1,'2019-01-08 02:59:55','2019-01-08 02:59:55',18,1,0),(161,'ເສົາກ້ວຍ','sao kouay',0,'http://139.59.216.238:5005//images/uploads/foods/56240fcc139edb9d54fd5639e2527d6b.png',14,1000,2000,'418',1,'2019-01-08 10:03:17','2019-01-08 10:03:17',18,2,0),(162,'ພຸດດິງ','pudding',0,'http://139.59.216.238:5005//images/uploads/foods/f7e8bdff960e63896f7446c9a458d009.png',14,1000,2000,'418',1,'2019-01-08 10:04:39','2019-01-08 10:04:39',18,2,0),(163,'ໄກ່','chick',53,'http://139.59.216.238:5005//images/uploads/foods/kaphao.png',1,10000,16000,'418',1,'2019-01-08 13:34:25','2019-01-08 13:34:25',18,1,0),(164,'ບຮາວນີ່','Brownie',0,'http://139.59.216.238:5005//images/uploads/foods/brownie.png',14,2000,4000,'418',1,'2019-01-09 03:07:23','2019-01-09 03:07:23',18,2,0),(165,'ວິປຄຮີມ','wip cream',0,'http://139.59.216.238:5005//images/uploads/foods/wipcream.png',14,2000,4000,'418',1,'2019-01-09 03:08:40','2019-01-09 03:08:40',18,2,0),(167,'ນົມສົດເສົາກ໊ວຍ','Fresh milk',0,'http://139.59.216.238:5005//images/uploads/foods/cup-no-background.jpg',9,10000,13000,'418',1,'2019-01-09 05:37:28','2019-01-09 05:37:28',18,2,0),(168,'ຕຳເສັ້ນແກ້ວ','Tum-Sen-Keo',0,'http://139.59.216.238:5005//images/uploads/foods/1401549832-DSC4907-o.jpg',5,10000,16000,'418',1,'2019-01-09 05:42:22','2019-01-09 05:42:22',18,1,0),(169,'ທອດລູກຊິ້ນ','Meat Ball Fired',0,'http://139.59.216.238:5005//images/uploads/foods/Sweet_Meatballs_of_Fire_desktop_686x458.jpg',4,7000,12000,'418',1,'2019-01-09 05:44:28','2019-01-09 05:44:28',18,1,0),(170,'Beer','Beer',0,'http://139.59.216.238:5005//images/uploads/foods/heineken_bottle_white.jpg.750x750_q85ss0_progressive.jpg',2,10000,15000,'418',1,'2019-01-10 04:33:09','2019-01-10 04:33:09',18,2,0),(171,'Pepsi','Pepsi',0,'http://139.59.216.238:5005//images/uploads/foods/d-peps-500_1_2.jpg',2,4000,6000,'418',1,'2019-01-10 04:48:16','2019-01-10 04:48:16',18,2,0),(172,'ເຂົ້າ','rice',0,'http://139.59.216.238:5005//images/uploads/foods/s4.jpg',1,0,0,'418',0,'2019-01-11 03:26:12','2019-01-18 10:30:08',18,1,1),(174,'ໄຂ່ດາວ','Fried egg',0,'http://139.59.216.238:5005//images/uploads/foods/atlimg_100.jpg',1,2000,4000,'418',1,'2019-01-11 04:06:19','2019-01-11 04:06:19',18,1,0),(175,'ຊອດໝາກເລັ່ນແດງ ທະເລ','sod daeng tha le',79,'http://139.59.216.238:5005//images/uploads/foods/kitchen-20131204175839.jpg',12,13000,20000,'418',1,'2019-01-11 04:56:51','2019-01-11 04:56:51',18,1,0),(176,'ກຸ້ງຊຸບແປ້ງທອດ','fried shrimp',0,'http://139.59.216.238:5005//images/uploads/foods/fish-stick-png-1.png',4,20000,28000,'418',1,'2019-01-13 16:56:03','2019-01-13 16:56:03',18,1,0),(177,'ທອດເອັນໄກ່','chicken tendons',0,'http://139.59.216.238:5005//images/uploads/foods/3222ba12cf6d193d138d638cf1641748.jpg',4,18000,25000,'418',1,'2019-01-13 17:06:23','2019-01-13 17:06:23',18,1,0),(178,'ເຂົ້າຈ້າວ','khao jao',0,'http://139.59.216.238:5005//images/uploads/foods/266728__06092012104554.jpg',1,3000,5000,'418',1,'2019-01-14 12:40:26','2019-01-15 23:02:38',18,1,0),(179,'ກາດນາໝູກອບ','kard na mou kob',172,'http://139.59.216.238:5005//images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,10000,16000,'418',1,'2019-01-14 16:07:02','2019-01-14 16:07:02',18,1,0),(180,'ຕຳລ້ອນ','tum lon',0,'http://139.59.216.238:5005//images/uploads/foods/1645.jpg',5,8000,15000,'418',1,'2019-01-14 16:08:49','2019-01-16 13:29:20',18,1,0),(181,'ຂີ້ເມົາ ທະເລ','khee mao sea',79,'http://139.59.216.238:5005//images/uploads/foods/spaghetti-pollo-e-funghi.jpg',12,13000,20000,'418',1,'2019-01-14 21:50:54','2019-01-14 21:50:54',18,1,0),(182,'ຂີ້ເມົາ ໝູ','khee mao mu',79,'http://139.59.216.238:5005//images/uploads/foods/spa.png',12,10000,18000,'418',1,'2019-01-14 22:23:50','2019-01-14 22:23:50',18,1,0),(183,'ຂີ້ເມົາ ໄກ່','Khee mao kai',79,'http://139.59.216.238:5005//images/uploads/foods/spa2.png',12,10000,18000,'418',1,'2019-01-14 22:24:52','2019-01-14 22:24:52',18,1,0),(184,'ຂີ້ເມົາ ງົວ',' khee mao ngao',79,'http://139.59.216.238:5005//images/uploads/foods/spa2.png',12,13000,20000,'418',1,'2019-01-14 22:27:44','2019-01-14 22:27:44',18,1,0),(185,'ໝູກອບ','ka pao mu kop',53,'http://139.59.216.238:5005//images/uploads/foods/pad-kra-pao-moo-krob-27.jpg',1,10000,16000,'418',1,'2019-01-15 09:17:34','2019-01-18 10:05:11',18,1,0),(186,'ຂະໜົມປັງ ສັງຂະຫຍາ','kha nom pung sug kha yah',0,'http://139.59.216.238:5005//images/uploads/foods/s_76234_8344.jpg',17,5000,10000,'418',1,'2019-01-17 12:15:06','2019-01-18 09:51:55',18,2,0),(187,'ຂະໜົມປັງ ສັງຂະຫຍາ ກັບບ້ານ','Take home pung sang kha yah',0,'http://139.59.216.238:5005//images/uploads/foods/s_76234_8344.jpg',17,5000,12000,'418',1,'2019-01-17 12:16:00','2019-01-18 09:52:05',18,2,0),(188,'ໂກໂກ້ ນົມສົດ','ice cocoa',0,'http://139.59.216.238:5005//images/uploads/foods/coco.png',15,0,0,'418',1,'2019-01-17 15:44:39','2019-01-17 15:44:39',18,2,0),(189,'ເຜືອກຫອມນົມສົດ pro','taro milk pro',0,'http://139.59.216.238:5005//images/uploads/foods/taro7.png',15,0,0,'418',1,'2019-01-17 15:47:42','2019-01-17 15:47:42',18,2,0),(190,'ຊາຂຽວ pro','green tea pro',0,'http://139.59.216.238:5005//images/uploads/foods/greentea2.png',15,0,0,'418',1,'2019-01-17 15:48:37','2019-01-17 15:48:37',18,2,0),(191,'ນົມສົດກ້ວຍຫອມ pro','fresh milk pro',0,'http://139.59.216.238:5005//images/uploads/foods/bananamilk.png',15,0,0,'418',1,'2019-01-17 15:49:32','2019-01-17 15:49:32',18,2,0),(192,'ນົມສົດເສົາກ໊ວຍ pro','Fresh milk pro',0,'http://139.59.216.238:5005//images/uploads/foods/cup-no-background.jpg',15,0,0,'418',1,'2019-01-17 15:50:16','2019-01-17 15:50:16',18,2,0),(193,'ໝູກອບ','mou kop',123,'http://139.59.216.238:5005//images/uploads/foods/crispy-pork-with-kale-15.JPG',1,10000,16000,'418',1,'2019-01-18 09:15:57','2019-01-18 09:15:57',18,1,0),(194,'ເຂົ້າ ກະເພົາກອບ ','ka phao kop ',0,'http://139.59.216.238:5005//images/uploads/foods/pad-kra-pao-moo-krob-27.jpg',1,0,0,'418',1,'2019-01-18 09:51:38','2019-01-18 09:51:38',18,1,1);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtypes`
--

LOCK TABLES `foodtypes` WRITE;
/*!40000 ALTER TABLE `foodtypes` DISABLE KEYS */;
INSERT INTO `foodtypes` (`id`, `food_type`, `food_type_desc`, `food_type_desc_la`, `createdAt`, `updatedAt`) VALUES (1,'FOOD','Food','ອາຫານ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(2,'DRNK','DRINK','ເຄື່ອງດື່ມ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(4,'SNCK','Snack','ອາຫານທອດ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(5,'SLD','Slard','ຕຳ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(9,'fresh-milk','fresh milk','ນົມສົດ','2019-01-04 16:47:55','2019-01-04 16:47:55'),(10,'frappe','frappe','ປັ່ນ','2019-01-04 17:04:21','2019-01-04 17:04:21'),(11,'pasta','pasta','ປະເພດເສັ້ນ','2019-01-05 03:03:50','2019-01-05 03:03:50'),(12,'spaghetti','spaghetti','spaghetti','2019-01-05 03:04:23','2019-01-05 03:04:23'),(13,'yum','yum','ຍຳ','2019-01-08 02:56:43','2019-01-08 02:56:43'),(14,'toping','toping','toping','2019-01-08 10:02:58','2019-01-08 10:02:58'),(15,'PROMO','Promotion','ໂປຣໂມຊັນ','2019-01-16 22:12:05','2019-01-16 22:12:05'),(16,'Drinking water','Drinking water','ນ້ຳດື່ມ','2019-01-16 22:52:21','2019-01-16 22:52:21'),(17,'dessert','dessert','ຂອງຫວານ','2019-01-17 12:14:10','2019-01-17 12:14:10');
/*!40000 ALTER TABLE `foodtypes` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `kitchens` DISABLE KEYS */;
INSERT INTO `kitchens` (`id`, `kitchen_code`, `kitchen_name`, `userId`, `createdAt`, `updatedAt`) VALUES (1,'kitchen001','ຄົວອາຫານ',0,'2019-01-01 01:52:32','2019-01-01 01:52:32'),(2,'kitchen002','ຄົວເຄື່ອງດື່ມ',0,'2019-01-01 01:52:32','2019-01-01 01:52:32');
/*!40000 ALTER TABLE `kitchens` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `menu_code`, `menu_name`, `menu_link`, `icon`, `enabled`, `createdAt`, `updatedAt`) VALUES (1,'Home','Home','/','home',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(2,'Sales','Sales','sale','shopping_cart',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(3,'Terminals','Terminals','terminal','dns',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(4,'POS','POS','pos','credit_card',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(5,'Food','Food','food','fastfood',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(6,'Reports','Reports','report','report',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(7,'Administator','Administator','administrator','settings',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(8,'Order Tracking','Order Tracking','orders','done',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(9,'Users management','Users management','users','verified_user',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(10,'Kitchen monitor','Kitchen monitor','kitchenmon','kitchen',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(12,'adminreports','Admin reports','adminreport','report',1,'2019-01-10 19:16:18','2019-01-10 19:16:18'),(13,'cashmanagement','Cash Management','cashmanager','credit_card',1,'2019-01-10 22:22:21','2019-01-10 22:22:21'),(14,'ordermanagement','Order Recover','ordermanagement','cash',1,'2019-01-17 23:14:53','2019-01-17 23:14:53'),(15,'admindashboard','Dashboard','admindashboard','dashboard',1,'2019-01-18 18:46:56','2019-01-18 18:46:56');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL,
  `full_food_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `done` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `foodId` (`foodId`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=648 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` (`id`, `orderId`, `foodId`, `full_food_name`, `quantity`, `price`, `total`, `note`, `createdAt`, `updatedAt`, `done`) VALUES (17,161,117,'ເຂົ້າ ຜັດ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-07 18:01:40','2019-01-07 18:01:40',0),(18,161,103,'ໝີ່ກອບລາດໜ້າ - ໝູ',1,16000,16000,NULL,'2019-01-07 18:01:40','2019-01-07 18:01:40',0),(19,161,72,'ນ້ຳອະງຸ່ນ',1,10000,10000,NULL,'2019-01-07 18:01:40','2019-01-07 18:01:40',0),(20,162,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-07 18:03:01','2019-01-07 18:03:01',0),(21,162,81,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-07 18:03:01','2019-01-07 18:03:01',0),(22,162,71,'ນ້ຳໝາກນອດ',1,10000,10000,NULL,'2019-01-07 18:03:01','2019-01-07 18:03:01',0),(23,162,73,'ນ້ຳລີ້ນຈິ່',1,10000,10000,NULL,'2019-01-07 18:03:01','2019-01-07 18:03:01',0),(24,163,110,'ສຸກກີ້ນ້ຳ - ທະເລ',1,18000,18000,NULL,'2019-01-07 18:10:33','2019-01-07 18:10:33',0),(25,163,83,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ທະເລ',1,20000,20000,NULL,'2019-01-07 18:10:33','2019-01-07 18:10:33',0),(26,163,72,'ນ້ຳອະງຸ່ນ',1,10000,10000,NULL,'2019-01-07 18:10:33','2019-01-07 18:10:33',0),(27,163,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-07 18:10:33','2019-01-07 18:10:33',0),(28,164,120,'ເຂົ້າ ຜັດ - ກະເພົາກອບ ໝູ',1,16000,16000,NULL,'2019-01-07 18:13:48','2019-01-07 18:13:48',0),(29,164,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-07 18:13:48','2019-01-07 18:13:48',0),(30,165,118,'ເຂົ້າ ຜັດ - ກະເພົາ ໄກ່',1,16000,16000,NULL,'2019-01-08 00:36:25','2019-01-08 00:36:25',0),(31,166,122,'ເຂົ້າ ຜັດ - ກະເພົາກອບ ທະເລ',1,18000,18000,NULL,'2019-01-08 00:40:33','2019-01-08 00:40:33',0),(32,167,71,'ນ້ຳໝາກນອດ',2,10000,20000,NULL,'2019-01-08 00:41:26','2019-01-08 00:41:26',0),(33,167,70,'ນ້ຳບຣູເບີຣີ',1,10000,10000,NULL,'2019-01-08 00:41:26','2019-01-08 00:41:26',0),(34,167,72,'ນ້ຳອະງຸ່ນ',1,10000,10000,NULL,'2019-01-08 00:41:26','2019-01-08 00:41:26',0),(35,167,73,'ນ້ຳລີ້ນຈິ່',1,10000,10000,NULL,'2019-01-08 00:41:26','2019-01-08 00:41:26',0),(36,168,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,NULL,'2019-01-08 00:46:09','2019-01-08 00:46:09',0),(37,169,115,'ເຂົ້າ ຜັດ - ຂີ້ເມົາ ໝູ',1,16000,16000,NULL,'2019-01-08 01:22:28','2019-01-08 01:22:28',0),(38,170,112,'ເຂົ້າ ຜັດ - ໄກ່',1,16000,16000,NULL,'2019-01-08 02:23:32','2019-01-08 02:23:32',0),(39,171,54,'ກະເພົາ - ງົວ',1,18000,18000,NULL,'2019-01-08 02:27:03','2019-01-08 02:27:03',0),(40,172,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,NULL,'2019-01-08 02:38:13','2019-01-08 02:38:13',0),(41,173,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,'ບໍ່ເຜັດ','2019-01-08 02:40:13','2019-01-08 02:40:13',0),(42,174,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,NULL,'2019-01-08 03:00:19','2019-01-08 03:00:19',0),(43,175,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,'ບໍ່ເຜັດ','2019-01-08 03:01:47','2019-01-08 03:01:47',0),(44,176,157,'ຍຳປາມຶກ',1,28000,28000,NULL,'2019-01-08 03:06:50','2019-01-08 03:06:50',0),(45,177,70,'ນ້ຳບຣູເບີຣີ',1,10000,10000,NULL,'2019-01-08 03:28:44','2019-01-08 03:28:44',0),(46,178,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,NULL,'2019-01-08 03:56:35','2019-01-08 03:56:35',0),(47,179,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-08 04:45:15','2019-01-08 04:45:15',0),(48,179,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-08 04:45:15','2019-01-08 04:45:15',0),(49,179,118,'ເຂົ້າ ຜັດ - ກະເພົາ ໄກ່',1,16000,16000,NULL,'2019-01-08 04:45:15','2019-01-08 04:45:15',0),(50,179,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',1,18000,18000,NULL,'2019-01-08 04:45:15','2019-01-08 04:45:15',0),(51,180,83,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ທະເລ',2,20000,40000,NULL,'2019-01-08 04:52:27','2019-01-08 04:52:27',0),(52,180,98,'ເສັ້ນໃຫຍ່ - ລາດໜ້າ ທະເລ',1,18000,18000,NULL,'2019-01-08 04:52:27','2019-01-08 04:52:27',0),(53,180,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-08 04:52:27','2019-01-08 04:52:27',0),(54,180,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',1,18000,18000,NULL,'2019-01-08 04:52:27','2019-01-08 04:52:27',0),(55,180,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 04:52:27','2019-01-08 04:52:27',0),(56,181,60,'ໂກໂກ້ ນົມສົດ',2,13000,26000,NULL,'2019-01-08 05:18:12','2019-01-08 05:18:12',0),(57,181,71,'ນ້ຳໝາກນອດ',1,10000,10000,NULL,'2019-01-08 05:18:12','2019-01-08 05:18:12',0),(58,181,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-08 05:18:12','2019-01-08 05:18:12',0),(59,182,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-08 05:24:50','2019-01-08 05:24:50',0),(60,183,98,'ເສັ້ນໃຫຍ່ - ລາດໜ້າ ທະເລ',1,18000,18000,NULL,'2019-01-08 05:28:08','2019-01-08 05:28:08',0),(61,183,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 05:28:08','2019-01-08 05:28:08',0),(62,183,73,'ນ້ຳລີ້ນຈິ່',1,10000,10000,NULL,'2019-01-08 05:28:08','2019-01-08 05:28:08',0),(63,183,99,'ເສັ້ນໃຫຍ່ - ຜັດຊີອີ້ວ ໝູ',1,16000,16000,NULL,'2019-01-08 05:28:08','2019-01-08 05:28:08',0),(64,184,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-08 05:34:31','2019-01-08 05:34:31',0),(65,185,124,'ເຂົ້າ ຜັກກາດນາ - ໝູ',1,16000,16000,NULL,'2019-01-08 06:40:27','2019-01-08 06:40:27',0),(66,185,81,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-08 06:40:27','2019-01-08 06:40:27',0),(67,185,82,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ໝູ',1,18000,18000,NULL,'2019-01-08 06:40:27','2019-01-08 06:40:27',0),(68,185,143,'ທອດໄກ່ຈໍ້',1,15000,15000,NULL,'2019-01-08 06:40:27','2019-01-08 06:40:27',0),(69,185,93,'ຜັດໄທ - ໄກ່',1,16000,16000,NULL,'2019-01-08 06:40:27','2019-01-08 06:40:27',0),(70,185,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-08 06:40:27','2019-01-08 06:40:27',0),(71,186,62,'ເຜືອກຫອມນົມສົດ',1,13000,13000,NULL,'2019-01-08 07:06:35','2019-01-08 07:06:35',0),(72,187,63,'ຊາຂຽວ',2,13000,26000,NULL,'2019-01-08 08:33:36','2019-01-08 08:33:36',0),(73,188,63,'ຊາຂຽວ',5,13000,65000,NULL,'2019-01-08 08:51:19','2019-01-08 08:51:19',0),(74,188,72,'ນ້ຳອະງຸ່ນ',1,10000,10000,NULL,'2019-01-08 08:51:19','2019-01-08 08:51:19',0),(75,189,143,'ທອດໄກ່ຈໍ້',1,15000,15000,NULL,'2019-01-08 11:01:16','2019-01-08 11:01:16',0),(76,189,117,'ເຂົ້າ ຜັດ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-08 11:01:16','2019-01-08 11:01:16',0),(77,189,134,'ເຂົ້າ ຜັດ - ຂິງໄກ່',1,16000,16000,'ໝູ','2019-01-08 11:01:16','2019-01-08 11:01:16',0),(78,189,156,'ຕຳປູ',1,28000,28000,NULL,'2019-01-08 11:01:16','2019-01-08 11:01:16',0),(79,189,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 11:01:16','2019-01-08 11:01:16',0),(80,190,131,'ເຂົ້າມັນໄກ່',1,16000,16000,NULL,'2019-01-08 11:11:51','2019-01-08 11:11:51',0),(81,191,132,'ເຂົ້າມັນໄກ່ ກອບ',2,16000,32000,NULL,'2019-01-08 11:20:43','2019-01-08 11:20:43',0),(82,192,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',1,18000,18000,NULL,'2019-01-08 11:37:51','2019-01-08 11:37:51',0),(83,193,154,'ຕຳທະເລ',1,28000,28000,NULL,'2019-01-08 12:03:13','2019-01-08 12:03:13',0),(84,193,150,'ຕຳເຂົ້າປຸ້ນ',1,12000,12000,NULL,'2019-01-08 12:03:13','2019-01-08 12:03:13',0),(85,193,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,NULL,'2019-01-08 12:03:13','2019-01-08 12:03:13',0),(86,193,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-08 12:03:13','2019-01-08 12:03:13',0),(87,193,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-08 12:03:13','2019-01-08 12:03:13',0),(88,193,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 12:03:13','2019-01-08 12:03:13',0),(89,194,131,'ເຂົ້າມັນໄກ່',2,16000,32000,NULL,'2019-01-08 12:13:35','2019-01-08 12:13:35',0),(90,194,150,'ຕຳເຂົ້າປຸ້ນ',1,12000,12000,'ເຜັດ 2 ຫນ່ວຍ ສົ້ມຫວານ','2019-01-08 12:13:35','2019-01-08 12:13:35',0),(91,194,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-08 12:13:35','2019-01-08 12:13:35',0),(92,194,64,'ນົມສົດກ້ວຍຫອມ',1,13000,13000,'ນົມສົດເສົາກ້ວຍ','2019-01-08 12:13:35','2019-01-08 12:13:35',0),(93,195,76,'ຜັດໄທ - ທະເລ',1,18000,18000,'ກຸ້ງ','2019-01-08 12:32:26','2019-01-08 12:32:26',0),(94,195,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,'ບໍ່ໃສ່ໄຂ່','2019-01-08 12:32:26','2019-01-08 12:32:26',0),(95,195,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,'ໃສ່ນຳ້ປາ ບໍ່ເຜັດ','2019-01-08 12:32:26','2019-01-08 12:32:26',0),(96,195,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-08 12:32:26','2019-01-08 12:32:26',0),(97,195,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 12:32:26','2019-01-08 12:32:26',0),(98,196,148,'ປີກໄກ່ທອດ ບາບີຄິວ',1,25000,25000,NULL,'2019-01-08 12:34:55','2019-01-08 12:34:55',0),(99,197,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-08 12:36:38','2019-01-08 12:36:38',0),(100,197,141,'ນັກເກັດໄກ່',1,15000,15000,NULL,'2019-01-08 12:36:38','2019-01-08 12:36:38',0),(101,197,110,'ສຸກກີ້ນ້ຳ - ທະເລ',1,18000,18000,NULL,'2019-01-08 12:36:38','2019-01-08 12:36:38',0),(102,198,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 12:49:29','2019-01-08 12:49:29',0),(103,199,113,'ເຂົ້າ ຜັດ - ໝູ',2,16000,32000,NULL,'2019-01-08 13:10:06','2019-01-08 13:10:06',0),(104,199,144,'ຟິຊສະຕິກ',1,15000,15000,NULL,'2019-01-08 13:10:06','2019-01-08 13:10:06',0),(105,199,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-08 13:10:06','2019-01-08 13:10:06',0),(106,200,112,'ເຂົ້າ ຜັດ - ໄກ່',1,16000,16000,NULL,'2019-01-08 13:12:15','2019-01-08 13:12:15',0),(107,200,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-08 13:12:15','2019-01-08 13:12:15',0),(108,200,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-08 13:12:15','2019-01-08 13:12:15',0),(109,201,61,'ນົມສົດ ຄາຣາເມລ',1,13000,13000,NULL,'2019-01-08 13:50:32','2019-01-08 13:50:32',0),(110,201,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 13:50:32','2019-01-08 13:50:32',0),(111,202,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-09 04:27:17','2019-01-09 04:27:17',0),(112,202,117,'ເຂົ້າ ຜັດ - ກະເພົາ ໝູ',1,16000,16000,'ຫມູກອບ','2019-01-09 04:27:17','2019-01-09 04:27:17',0),(113,202,81,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-09 04:27:17','2019-01-09 04:27:17',0),(114,202,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-09 04:27:17','2019-01-09 04:27:17',0),(115,203,61,'ນົມສົດ ຄາຣາເມລ',1,13000,13000,NULL,'2019-01-09 04:28:36','2019-01-09 04:28:36',0),(116,204,61,'ນົມສົດ ຄາຣາເມລ',1,13000,13000,NULL,'2019-01-09 04:30:55','2019-01-09 04:30:55',0),(117,205,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-09 04:33:19','2019-01-09 04:33:19',0),(118,205,150,'ຕຳເຂົ້າປຸ້ນ',1,12000,12000,'ທຳມະດາ ສ້ມນັວ','2019-01-09 04:33:19','2019-01-09 04:33:19',0),(119,206,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-09 04:37:03','2019-01-09 04:37:03',0),(120,206,64,'ນົມສົດກ້ວຍຫອມ',1,13000,13000,NULL,'2019-01-09 04:37:03','2019-01-09 04:37:03',0),(121,207,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-09 05:02:59','2019-01-09 05:02:59',0),(122,208,63,'ຊາຂຽວ',2,13000,26000,NULL,'2019-01-09 05:05:38','2019-01-09 05:05:38',0),(123,209,63,'ຊາຂຽວ',2,13000,26000,NULL,'2019-01-09 05:07:26','2019-01-09 05:07:26',0),(124,210,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-09 05:51:44','2019-01-09 05:51:44',0),(125,211,168,'ຕຳເສັ້ນແກ້ວ',1,16000,16000,NULL,'2019-01-09 05:52:17','2019-01-09 05:52:17',0),(126,212,167,'ນົມສົດເສົາກ໊ວຍ',1,13000,13000,NULL,'2019-01-09 06:24:50','2019-01-09 06:24:50',0),(127,212,67,'ສະຕຣໍເບີຣີ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-09 06:24:50','2019-01-09 06:24:50',0),(128,212,131,'ເຂົ້າມັນໄກ່',1,16000,16000,NULL,'2019-01-09 06:24:50','2019-01-09 06:24:50',0),(129,212,117,'ເຂົ້າ ຜັດ - ກະເພົາ ໝູ',1,16000,16000,'ໄຂ່ດາວ','2019-01-09 06:24:50','2019-01-09 06:24:50',0),(130,212,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-09 06:24:50','2019-01-09 06:24:50',0),(131,213,149,'ຕຳໝາກຮຸ່ງ',1,12000,12000,'ຫມາກເຜັດ1ຫນ່ວຍ','2019-01-09 06:29:59','2019-01-09 06:29:59',0),(132,214,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-09 11:12:20','2019-01-09 11:12:20',0),(133,215,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-09 11:12:45','2019-01-09 11:12:45',0),(134,216,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-09 11:14:15','2019-01-09 11:14:15',0),(135,217,169,'ທອດລູກຊິ້ນ',1,12000,12000,NULL,'2019-01-09 12:01:26','2019-01-09 12:01:26',0),(136,218,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-09 12:06:09','2019-01-09 12:06:09',0),(137,219,71,'ນ້ຳໝາກນອດ',1,10000,10000,NULL,'2019-01-09 12:16:06','2019-01-09 12:16:06',0),(138,220,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-09 12:26:30','2019-01-09 12:26:30',0),(139,221,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-09 13:27:33','2019-01-09 13:27:33',0),(140,222,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-10 03:12:46','2019-01-10 03:12:46',0),(141,223,62,'ເຜືອກຫອມນົມສົດ',1,13000,13000,NULL,'2019-01-10 03:44:09','2019-01-10 03:44:09',0),(142,224,93,'ຜັດໄທ - ໄກ່',1,16000,16000,NULL,'2019-01-10 04:43:05','2019-01-10 04:43:05',0),(143,224,124,'ເຂົ້າ ຜັກກາດນາ - ໝູ',1,16000,16000,NULL,'2019-01-10 04:43:05','2019-01-10 04:43:05',0),(144,224,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-10 04:43:05','2019-01-10 04:43:05',0),(145,225,55,'ກະເພົາ - ທະເລ',1,18000,18000,NULL,'2019-01-10 04:57:07','2019-01-10 04:57:07',0),(146,226,82,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ໝູ',2,18000,36000,NULL,'2019-01-10 05:13:32','2019-01-10 05:13:32',0),(147,226,134,'ເຂົ້າ ຜັດ - ຂິງໄກ່',1,16000,16000,NULL,'2019-01-10 05:13:32','2019-01-10 05:13:32',0),(148,227,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-10 05:15:04','2019-01-10 05:15:04',0),(149,227,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-10 05:15:04','2019-01-10 05:15:04',0),(150,228,120,'ເຂົ້າ ຜັດ - ກະເພົາກອບ ໝູ',1,16000,16000,NULL,'2019-01-10 05:16:15','2019-01-10 05:16:15',0),(151,229,152,'ຕຳມົ້ວ',1,15000,15000,'ทำมะดา','2019-01-10 05:30:38','2019-01-10 05:30:38',0),(152,229,140,'ທອດລຸກຊີ້ນ ຮັອດດອກ',1,12000,12000,NULL,'2019-01-10 05:30:38','2019-01-10 05:30:38',0),(153,230,85,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-10 05:33:31','2019-01-10 05:33:31',0),(154,231,74,'ນ້ຳດື່ມ ຫົວເສືອ',4,3000,12000,NULL,'2019-01-10 05:34:14','2019-01-10 05:34:14',0),(155,232,69,'ຊ໋ອກໂກ້ ບລາວນີ້',2,17000,34000,NULL,'2019-01-10 05:38:12','2019-01-10 05:38:12',0),(156,232,65,'ດັບໂບ້ ຊ໋ອກໂກ້',1,17000,17000,NULL,'2019-01-10 05:38:12','2019-01-10 05:38:12',0),(157,232,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-10 05:38:12','2019-01-10 05:38:12',0),(158,233,68,'ແມັງໂກ້ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-10 05:40:44','2019-01-10 05:40:44',0),(159,234,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-10 06:01:13','2019-01-10 06:01:13',0),(160,235,167,'ນົມສົດເສົາກ໊ວຍ',3,13000,39000,NULL,'2019-01-10 06:13:38','2019-01-10 06:13:38',0),(161,235,85,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',2,20000,40000,NULL,'2019-01-10 06:13:38','2019-01-10 06:13:38',0),(162,235,137,'ເຂົ້າ ຜັດ - ຜັກບົ້ງໄຟແດງ',1,16000,16000,NULL,'2019-01-10 06:13:38','2019-01-10 06:13:38',0),(163,236,63,'ຊາຂຽວ',2,13000,26000,NULL,'2019-01-10 06:26:44','2019-01-10 06:26:44',0),(164,237,110,'ສຸກກີ້ນ້ຳ - ທະເລ',1,18000,18000,NULL,'2019-01-10 06:34:18','2019-01-10 06:34:18',0),(165,238,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-10 06:47:16','2019-01-10 06:47:16',0),(166,239,61,'ນົມສົດ ຄາຣາເມລ',2,13000,26000,NULL,'2019-01-10 07:52:08','2019-01-10 07:52:08',0),(167,239,67,'ສະຕຣໍເບີຣີ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-10 07:52:08','2019-01-10 07:52:08',0),(168,239,167,'ນົມສົດເສົາກ໊ວຍ',2,13000,26000,NULL,'2019-01-10 07:52:08','2019-01-10 07:52:08',0),(169,239,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-10 07:52:08','2019-01-10 07:52:08',0),(170,240,156,'ຕຳປູ',1,28000,28000,NULL,'2019-01-10 08:15:55','2019-01-10 08:15:55',0),(171,240,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-10 08:15:55','2019-01-10 08:15:55',0),(172,241,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-10 08:22:03','2019-01-10 08:22:03',0),(173,242,156,'ຕຳປູ',1,28000,28000,'ບໍ່ເຜັດ','2019-01-10 09:29:54','2019-01-10 09:29:54',0),(174,242,158,'ຍຳລວມມິດທະເລ',1,28000,28000,NULL,'2019-01-10 09:29:54','2019-01-10 09:29:54',0),(175,243,154,'ຕຳທະເລ',1,28000,28000,NULL,'2019-01-10 09:53:58','2019-01-10 09:53:58',0),(176,244,167,'ນົມສົດເສົາກ໊ວຍ',2,13000,26000,NULL,'2019-01-10 09:55:36','2019-01-10 09:55:36',0),(177,245,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,NULL,'2019-01-10 11:29:52','2019-01-10 11:29:52',0),(178,246,70,'ນ້ຳບຣູເບີຣີ',1,10000,10000,NULL,'2019-01-10 11:39:34','2019-01-10 11:39:34',0),(179,246,65,'ດັບໂບ້ ຊ໋ອກໂກ້',1,17000,17000,NULL,'2019-01-10 11:39:34','2019-01-10 11:39:34',0),(180,247,139,'ໄກ່ທອດ',2,10000,20000,NULL,'2019-01-10 12:04:57','2019-01-10 12:04:57',0),(181,248,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-11 03:24:02','2019-01-11 03:24:02',0),(182,249,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-11 03:57:47','2019-01-11 03:57:47',0),(183,250,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-11 04:06:23','2019-01-11 04:06:23',0),(184,251,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-11 04:28:07','2019-01-11 04:28:50',1),(185,252,87,'ມັກກະໂລນີ - ຊ໋ອດແດງ',1,16000,16000,'ທະເລ','2019-01-11 04:50:24','2019-01-11 05:00:53',1),(186,252,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-11 04:50:24','2019-01-11 04:52:41',1),(187,252,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',1,18000,18000,NULL,'2019-01-11 04:50:24','2019-01-11 05:05:55',1),(188,253,85,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-11 04:57:50','2019-01-11 05:08:16',1),(189,254,54,'ກະເພົາ - ງົວ',1,18000,18000,NULL,'2019-01-11 04:59:45','2019-01-11 05:17:19',1),(190,254,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-11 04:59:45','2019-01-11 05:02:16',1),(191,255,55,'ກະເພົາ - ທະເລ',1,18000,18000,NULL,'2019-01-11 05:04:52','2019-01-11 05:13:27',1),(192,255,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-11 05:04:52','2019-01-11 05:05:28',1),(193,256,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-11 05:12:14','2019-01-11 05:12:14',0),(194,257,109,'ສຸກກິ້ ແຫ້ງ - ໄກ່',1,16000,16000,NULL,'2019-01-11 05:24:27','2019-01-11 05:34:28',1),(195,257,150,'ຕຳເຂົ້າປຸ້ນ',1,12000,12000,'ทำมะดา ส้มหวาน','2019-01-11 05:24:27','2019-01-11 05:38:49',1),(196,257,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-11 05:24:27','2019-01-11 05:25:11',1),(197,258,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-11 05:42:11','2019-01-11 05:45:30',1),(198,259,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-11 05:50:18','2019-01-11 05:50:18',0),(199,260,140,'ທອດລຸກຊີ້ນ ຮັອດດອກ',1,12000,12000,NULL,'2019-01-11 06:02:46','2019-01-11 06:10:05',1),(200,260,150,'ຕຳເຂົ້າປຸ້ນ',1,12000,12000,'ສົ້ມຫວານ','2019-01-11 06:02:46','2019-01-11 06:12:31',1),(201,261,94,'ຜັດໄທ - ໝູ',1,16000,16000,NULL,'2019-01-11 06:22:11','2019-01-11 06:22:11',0),(202,262,138,'ເຟຣນຟາຍ',1,9000,9000,'ກອບໆໆໆໆໆໆໆໆໆ','2019-01-11 08:43:07','2019-01-11 09:02:34',0),(203,262,139,'ໄກ່ທອດ',1,10000,10000,NULL,'2019-01-11 08:43:07','2019-01-11 09:02:35',0),(204,262,142,'ໄກ່ສະຕິກ',1,15000,15000,NULL,'2019-01-11 08:43:07','2019-01-11 09:02:36',0),(205,263,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-12 02:08:16','2019-01-12 02:10:40',1),(206,264,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-12 02:09:59','2019-01-12 02:10:54',1),(207,265,63,'ຊາຂຽວ',2,13000,26000,NULL,'2019-01-12 03:03:51','2019-01-12 03:08:48',1),(208,266,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',1,18000,18000,NULL,'2019-01-12 06:09:26','2019-01-12 06:28:35',1),(209,266,149,'ຕຳໝາກຮຸ່ງ',1,12000,12000,'ປົນເຂົ້າປຸ້ນ ໝາກເຜັດ 3 ໜ່ວຍ','2019-01-12 06:09:26','2019-01-12 06:27:52',1),(210,266,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-12 06:09:26','2019-01-12 06:40:47',1),(211,266,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-12 06:09:26','2019-01-12 06:23:45',1),(212,266,148,'ປີກໄກ່ທອດ ບາບີຄິວ',1,25000,25000,NULL,'2019-01-12 06:09:26','2019-01-12 06:25:14',1),(213,266,139,'ໄກ່ທອດ',1,10000,10000,NULL,'2019-01-12 06:09:26','2019-01-12 06:29:38',1),(214,266,131,'ເຂົ້າມັນໄກ່',2,16000,32000,NULL,'2019-01-12 06:09:26','2019-01-12 06:25:49',1),(215,266,74,'ນ້ຳດື່ມ ຫົວເສືອ',3,3000,9000,NULL,'2019-01-12 06:09:26','2019-01-12 06:13:17',1),(216,266,72,'ນ້ຳອະງຸ່ນ',1,10000,10000,NULL,'2019-01-12 06:09:26','2019-01-12 06:13:13',1),(217,266,171,'Pepsi',1,6000,6000,NULL,'2019-01-12 06:09:26','2019-01-12 06:13:28',1),(218,267,139,'ໄກ່ທອດ',1,10000,10000,NULL,'2019-01-12 06:34:27','2019-01-12 06:47:32',1),(219,268,154,'ຕຳທະເລ',1,28000,28000,'ຫມາກເຜັດ3','2019-01-12 06:49:57','2019-01-12 07:11:05',1),(220,269,149,'ຕຳໝາກຮຸ່ງ',1,12000,12000,'ປົນເຂົ້າປຸ້ນສົ້ມຫວານ','2019-01-12 07:31:26','2019-01-12 07:48:11',1),(221,269,143,'ທອດໄກ່ຈໍ້',1,15000,15000,NULL,'2019-01-12 07:31:26','2019-01-12 07:48:12',1),(222,269,135,'ເຂົ້າ ໝູທອດກະທຽມ',1,16000,16000,NULL,'2019-01-12 07:31:26','2019-01-12 07:52:18',1),(223,270,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-12 08:09:19','2019-01-12 08:24:50',1),(224,271,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-12 08:44:38','2019-01-12 08:44:38',0),(225,272,67,'ສະຕຣໍເບີຣີ ໂຍເກີສ',3,17000,51000,NULL,'2019-01-12 09:13:05','2019-01-12 09:13:05',0),(226,273,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,NULL,'2019-01-12 09:18:03','2019-01-12 09:28:49',1),(227,274,156,'ຕຳປູ',1,28000,28000,NULL,'2019-01-13 03:19:55','2019-01-13 03:35:36',1),(228,274,145,'ປີກໄກ່ ທອດນ້ຳປາ',1,20000,20000,NULL,'2019-01-13 03:19:55','2019-01-13 03:44:08',1),(229,275,55,'ກະເພົາ - ທະເລ',1,18000,18000,NULL,'2019-01-13 04:28:12','2019-01-13 04:36:48',1),(230,275,174,'ໄຂ່ດາວ',1,4000,4000,NULL,'2019-01-13 04:28:12','2019-01-13 04:36:49',1),(231,275,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-13 04:28:12','2019-01-13 04:36:50',1),(232,276,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-13 05:03:52','2019-01-13 05:19:39',1),(233,276,163,'ກະເພົາ - ໄກ່',1,16000,16000,'ຫມຼ','2019-01-13 05:03:52','2019-01-13 05:17:11',1),(234,276,146,'ປາດອນລິ໊ ຊຸບແປ້ງທອດ',1,20000,20000,NULL,'2019-01-13 05:03:52','2019-01-13 05:31:54',1),(235,276,76,'ຜັດໄທ - ທະເລ',1,18000,18000,'ບໍ່ໃສ່ຜັກ ບໍ່ຖົ່ວງອກ ຫມາກເຜັດ','2019-01-13 05:03:52','2019-01-13 05:16:53',1),(236,276,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-13 05:03:52','2019-01-13 05:24:44',1),(237,276,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-13 05:03:52','2019-01-13 05:06:08',1),(238,277,167,'ນົມສົດເສົາກ໊ວຍ',1,13000,13000,'ບໍ່ໃສ່ຄີມທຽມ ບໍ່ໃສ່ນ*ເຊື່ອມ','2019-01-13 05:08:22','2019-01-13 05:12:48',1),(239,278,70,'ນ້ຳບຣູເບີຣີ',1,10000,10000,NULL,'2019-01-13 05:43:05','2019-01-13 05:43:05',0),(240,279,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-13 05:46:32','2019-01-13 05:46:32',0),(241,280,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,NULL,'2019-01-13 06:05:53','2019-01-13 06:05:53',0),(242,281,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-13 06:09:47','2019-01-13 06:09:47',0),(243,282,167,'ນົມສົດເສົາກ໊ວຍ',1,13000,13000,NULL,'2019-01-13 06:33:15','2019-01-13 06:34:53',1),(244,282,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-13 06:33:15','2019-01-13 06:35:53',1),(245,282,85,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-13 06:33:15','2019-01-13 06:49:45',1),(246,282,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-13 06:33:15','2019-01-13 06:43:38',1),(247,282,150,'ຕຳເຂົ້າປຸ້ນ',1,12000,12000,NULL,'2019-01-13 06:33:15','2019-01-13 06:45:32',1),(248,283,139,'ໄກ່ທອດ',1,10000,10000,NULL,'2019-01-13 07:09:01','2019-01-13 07:09:01',0),(249,284,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-13 07:22:15','2019-01-13 07:32:47',1),(250,284,69,'ຊ໋ອກໂກ້ ບລາວນີ້',1,17000,17000,NULL,'2019-01-13 07:22:15','2019-01-13 07:33:10',1),(251,285,150,'ຕຳເຂົ້າປຸ້ນ',1,12000,12000,'ໃສ່ນ*ປາ','2019-01-13 07:36:01','2019-01-13 07:45:05',1),(252,285,78,'ສຸກກີ້ນ້ຳ - ໝູ',2,16000,32000,NULL,'2019-01-13 07:36:01','2019-01-13 07:55:24',1),(253,285,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-13 07:36:01','2019-01-13 07:39:26',1),(254,285,69,'ຊ໋ອກໂກ້ ບລາວນີ້',1,17000,17000,NULL,'2019-01-13 07:36:01','2019-01-13 07:53:13',1),(255,285,68,'ແມັງໂກ້ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-13 07:36:01','2019-01-13 07:45:33',1),(256,286,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-13 15:26:53','2019-01-13 15:26:53',0),(257,286,169,'ທອດລູກຊິ້ນ',1,12000,12000,NULL,'2019-01-13 15:26:53','2019-01-13 15:26:53',0),(258,287,153,'ຕຳໝີ່ໄວໄວ',1,15000,15000,'ບໍ່ເຜັດ','2019-01-13 15:46:32','2019-01-13 16:05:18',1),(259,287,151,'ຕຳຕ່ອນ',1,15000,15000,'ບໍ່ເຜັດ','2019-01-13 15:46:32','2019-01-13 16:11:05',1),(260,287,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-13 15:46:32','2019-01-13 16:05:19',1),(261,288,61,'ນົມສົດ ຄາຣາເມລ',1,13000,13000,NULL,'2019-01-13 15:48:03','2019-01-13 15:48:03',0),(262,289,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-13 16:47:54','2019-01-13 17:01:16',1),(263,289,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-13 16:47:54','2019-01-13 17:03:44',1),(264,289,157,'ຍຳປາມຶກ',1,28000,28000,NULL,'2019-01-13 16:47:54','2019-01-13 17:16:03',1),(265,290,54,'ກະເພົາ - ງົວ',1,18000,18000,'ບໍ່ເຜັດ','2019-01-13 22:47:17','2019-01-13 22:47:17',0),(266,291,87,'ມັກກະໂລນີ - ຊ໋ອດແດງ',1,16000,16000,'ຫມູ','2019-01-14 09:40:59','2019-01-14 09:40:59',0),(267,291,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-14 09:40:59','2019-01-14 09:40:59',0),(268,291,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-14 09:40:59','2019-01-14 09:41:26',1),(269,292,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-14 10:27:27','2019-01-14 10:27:27',0),(270,293,139,'ໄກ່ທອດ',2,10000,20000,NULL,'2019-01-14 11:18:37','2019-01-14 11:38:16',1),(271,293,141,'ນັກເກັດໄກ່',1,15000,15000,NULL,'2019-01-14 11:18:37','2019-01-14 11:31:08',1),(272,294,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-14 11:45:06','2019-01-14 11:58:27',1),(273,294,120,'ເຂົ້າ - ກະເພົາກອບ ໝູ',1,16000,16000,NULL,'2019-01-14 11:45:06','2019-01-14 11:57:24',1),(274,294,174,'ໄຂ່ດາວ',1,4000,4000,NULL,'2019-01-14 11:45:06','2019-01-14 12:01:37',1),(275,295,131,'ເຂົ້າມັນໄກ່',1,16000,16000,NULL,'2019-01-14 11:50:33','2019-01-14 12:07:28',1),(276,295,119,'ເຂົ້າ - ກະເພົາ ທະເລ',1,18000,18000,NULL,'2019-01-14 11:50:33','2019-01-14 12:02:02',1),(277,295,124,'ເຂົ້າ ຜັກກາດນາ - ໝູ',1,16000,16000,NULL,'2019-01-14 11:50:33','2019-01-14 12:05:41',1),(278,295,67,'ສະຕຣໍເບີຣີ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-14 11:50:33','2019-01-14 12:00:12',1),(279,295,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-14 11:50:33','2019-01-14 11:53:32',1),(280,296,67,'ສະຕຣໍເບີຣີ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-14 11:52:39','2019-01-14 12:02:40',1),(281,297,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-14 11:55:41','2019-01-14 11:55:41',0),(282,298,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-14 12:09:34','2019-01-14 12:25:11',1),(283,298,131,'ເຂົ້າມັນໄກ່',1,16000,16000,NULL,'2019-01-14 12:09:34','2019-01-14 12:17:32',1),(284,298,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-14 12:09:34','2019-01-14 12:17:57',1),(285,298,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-14 12:09:34','2019-01-14 12:22:26',1),(286,298,74,'ນ້ຳດື່ມ ຫົວເສືອ',3,3000,9000,NULL,'2019-01-14 12:09:34','2019-01-14 12:09:59',1),(287,299,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-14 12:11:08','2019-01-14 12:11:26',1),(288,300,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-14 12:16:14','2019-01-14 12:25:18',1),(289,300,167,'ນົມສົດເສົາກ໊ວຍ',1,13000,13000,NULL,'2019-01-14 12:16:14','2019-01-14 12:20:31',1),(290,301,111,'ສຸກກີ້ນ້ຳ - ໄກ່',1,16000,16000,NULL,'2019-01-14 12:16:54','2019-01-14 12:39:47',1),(291,301,167,'ນົມສົດເສົາກ໊ວຍ',1,13000,13000,NULL,'2019-01-14 12:16:54','2019-01-14 12:20:27',1),(292,302,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-14 12:19:50','2019-01-14 12:36:16',1),(293,302,85,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-14 12:19:50','2019-01-14 12:36:17',1),(294,303,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-14 12:24:46','2019-01-14 12:35:25',1),(295,304,63,'ຊາຂຽວ',2,13000,26000,NULL,'2019-01-14 12:27:06','2019-01-14 12:40:40',1),(296,304,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-14 12:27:06','2019-01-14 12:39:07',1),(297,305,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,'ບໍ່ໃສ່ຫອມປ້ອມ','2019-01-14 12:34:45','2019-01-14 12:43:59',1),(298,305,149,'ຕຳໝາກຮຸ່ງ',1,12000,12000,'ບໍ່ເຜັດ','2019-01-14 12:34:45','2019-01-14 12:54:27',1),(299,305,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-14 12:34:45','2019-01-14 12:47:24',1),(300,305,164,'ບຮາວນີ່',1,4000,4000,NULL,'2019-01-14 12:34:45','2019-01-14 12:37:25',1),(301,306,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,NULL,'2019-01-14 12:46:58','2019-01-14 12:59:33',1),(302,306,120,'ເຂົ້າ - ກະເພົາກອບ ໝູ',1,16000,16000,NULL,'2019-01-14 12:46:58','2019-01-14 12:53:55',1),(303,306,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-14 12:46:58','2019-01-14 12:48:19',1),(304,306,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-14 12:46:58','2019-01-14 12:57:28',1),(305,307,64,'ນົມສົດກ້ວຍຫອມ',1,13000,13000,NULL,'2019-01-14 12:58:04','2019-01-14 13:02:08',1),(306,308,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-14 13:14:11','2019-01-14 13:15:10',1),(307,308,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-14 13:14:11','2019-01-14 13:21:18',1),(308,308,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-14 13:14:11','2019-01-14 13:26:04',1),(309,308,165,'ວິປຄຮີມ',1,4000,4000,NULL,'2019-01-14 13:14:11','2019-01-14 13:15:06',1),(310,309,152,'ຕຳມົ້ວ',1,15000,15000,'ສົ້ມຫວານ ບໍ່ເຜັດ','2019-01-14 13:24:45','2019-01-14 13:24:45',0),(311,309,144,'ຟິຊສະຕິກ',1,15000,15000,NULL,'2019-01-14 13:24:45','2019-01-14 13:33:39',1),(312,310,73,'ນ້ຳລີ້ນຈິ່',1,10000,10000,NULL,'2019-01-14 13:48:27','2019-01-14 13:48:27',0),(313,310,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-14 13:48:27','2019-01-14 13:48:27',0),(314,311,149,'ຕຳໝາກຮຸ່ງ',2,12000,24000,NULL,'2019-01-14 14:24:49','2019-01-14 14:24:49',0),(315,312,153,'ຕຳໝີ່ໄວໄວ',1,15000,15000,'ເຜັດ','2019-01-14 15:47:50','2019-01-14 16:01:15',1),(316,312,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-14 15:47:50','2019-01-14 15:59:16',1),(317,312,171,'Pepsi',2,6000,12000,NULL,'2019-01-14 15:47:50','2019-01-14 15:49:26',1),(318,313,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-14 15:56:44','2019-01-14 16:05:56',1),(319,313,153,'ຕຳໝີ່ໄວໄວ',1,15000,15000,NULL,'2019-01-14 15:56:44','2019-01-14 16:07:31',1),(320,313,171,'Pepsi',1,6000,6000,NULL,'2019-01-14 15:56:44','2019-01-14 16:07:31',1),(321,314,153,'ຕຳໝີ່ໄວໄວ',1,15000,15000,NULL,'2019-01-14 16:22:57','2019-01-14 16:43:18',1),(322,314,82,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ໝູ',1,18000,18000,'ໄກ່','2019-01-14 16:22:57','2019-01-14 16:40:16',1),(323,314,144,'ຟິຊສະຕິກ',1,15000,15000,NULL,'2019-01-14 16:22:57','2019-01-14 16:32:34',1),(324,314,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-14 16:22:57','2019-01-14 16:24:32',1),(325,315,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-14 16:23:27','2019-01-14 16:23:27',0),(326,316,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,NULL,'2019-01-14 18:45:53','2019-01-14 18:45:53',0),(327,317,84,'ສະປາເກັດຕີ້ - ກະເພົາ',1,18000,18000,'ໄກ່','2019-01-14 18:48:07','2019-01-14 18:48:07',0),(328,317,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-14 18:48:07','2019-01-14 18:48:07',0),(329,318,84,'ສະປາເກັດຕີ້ - ກະເພົາ',1,18000,18000,'ບໍ່ເຜັດ','2019-01-14 18:49:17','2019-01-14 18:49:17',0),(330,319,84,'ສະປາເກັດຕີ້ - ກະເພົາ',1,18000,18000,'ໝູ','2019-01-14 18:50:57','2019-01-14 19:13:47',1),(331,320,83,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ທະເລ',3,20000,60000,NULL,'2019-01-14 18:52:54','2019-01-14 19:17:21',1),(332,321,135,'ເຂົ້າ ໝູທອດກະທຽມ',1,16000,16000,NULL,'2019-01-14 18:54:21','2019-01-14 19:14:44',1),(333,321,111,'ສຸກກີ້ນ້ຳ - ໄກ່',1,16000,16000,NULL,'2019-01-14 18:54:21','2019-01-14 19:26:35',1),(334,322,84,'ສະປາເກັດຕີ້ - ກະເພົາ',1,18000,18000,'ໝູ ບໍ່ເຜັດ','2019-01-14 18:55:44','2019-01-14 19:18:06',1),(335,323,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-14 18:56:45','2019-01-14 19:26:21',1),(336,323,141,'ນັກເກັດໄກ່',1,15000,15000,NULL,'2019-01-14 18:56:45','2019-01-14 19:28:02',1),(337,324,94,'ຜັດໄທ - ໝູ',1,16000,16000,'ບໍ່ໃສ່ຜັກ','2019-01-14 18:57:38','2019-01-14 18:57:38',0),(338,325,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-14 19:00:14','2019-01-14 19:35:35',1),(339,325,87,'ມັກກະໂລນີ - ຊ໋ອດແດງ',2,16000,32000,NULL,'2019-01-14 19:00:14','2019-01-14 19:36:39',1),(340,326,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,'ໝູກອບ','2019-01-14 19:01:23','2019-01-14 19:45:16',1),(341,326,142,'ໄກ່ສະຕິກ',1,15000,15000,NULL,'2019-01-14 19:01:23','2019-01-14 19:38:03',1),(342,327,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,NULL,'2019-01-14 19:02:30','2019-01-14 19:02:30',0),(343,328,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-14 19:03:39','2019-01-14 19:50:30',1),(344,328,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-14 19:03:39','2019-01-14 19:12:00',1),(345,329,131,'ເຂົ້າມັນໄກ່',1,16000,16000,NULL,'2019-01-14 19:04:40','2019-01-14 19:52:41',1),(346,329,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-14 19:04:40','2019-01-14 19:12:33',1),(347,330,103,'ໝີ່ກອບລາດໜ້າ - ໝູ',1,16000,16000,NULL,'2019-01-14 19:05:31','2019-01-14 19:56:08',1),(348,331,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',2,18000,36000,'ໝູ','2019-01-14 19:08:04','2019-01-14 19:08:04',0),(349,331,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-14 19:08:04','2019-01-14 19:08:04',0),(350,331,109,'ສຸກກິ້ ແຫ້ງ - ໄກ່',1,16000,16000,NULL,'2019-01-14 19:08:04','2019-01-14 19:08:04',0),(351,332,139,'ໄກ່ທອດ',1,10000,10000,NULL,'2019-01-14 19:12:20','2019-01-14 20:00:36',1),(352,333,144,'ຟິຊສະຕິກ',1,15000,15000,NULL,'2019-01-14 19:14:54','2019-01-14 19:14:54',0),(353,333,69,'ຊ໋ອກໂກ້ ບລາວນີ້',1,17000,17000,NULL,'2019-01-14 19:14:54','2019-01-14 19:25:23',1),(354,334,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-14 19:31:13','2019-01-14 19:31:13',0),(355,335,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-14 19:31:41','2019-01-14 19:31:41',0),(356,336,70,'ນ້ຳບຣູເບີຣີ',1,10000,10000,NULL,'2019-01-14 19:35:45','2019-01-14 19:35:45',0),(357,337,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-14 19:47:39','2019-01-14 19:47:39',0),(358,338,134,'ເຂົ້າ - ຂິງໄກ່',1,16000,16000,NULL,'2019-01-14 20:02:34','2019-01-14 20:16:32',1),(359,338,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-14 20:02:34','2019-01-14 20:16:32',1),(360,339,140,'ທອດລຸກຊີ້ນ ຮັອດດອກ',1,12000,12000,NULL,'2019-01-14 20:27:43','2019-01-14 20:27:43',0),(361,340,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-14 20:44:54','2019-01-14 20:44:54',0),(362,341,81,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-14 21:47:17','2019-01-14 21:47:17',0),(363,342,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-15 10:28:56','2019-01-15 10:39:36',1),(364,343,64,'ນົມສົດກ້ວຍຫອມ',1,13000,13000,NULL,'2019-01-15 10:37:34','2019-01-15 10:42:21',1),(365,344,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,NULL,'2019-01-15 10:58:31','2019-01-15 10:58:31',0),(366,344,141,'ນັກເກັດໄກ່',1,15000,15000,NULL,'2019-01-15 10:58:31','2019-01-15 10:58:31',0),(367,345,113,'ເຂົ້າ ຜັດ - ໝູ',2,16000,32000,NULL,'2019-01-15 10:59:21','2019-01-15 11:12:16',1),(368,345,141,'ນັກເກັດໄກ່',1,15000,15000,NULL,'2019-01-15 10:59:21','2019-01-15 11:18:27',1),(369,346,69,'ຊ໋ອກໂກ້ ບລາວນີ້',1,17000,17000,NULL,'2019-01-15 11:21:11','2019-01-15 11:31:40',1),(370,346,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',1,18000,18000,NULL,'2019-01-15 11:21:11','2019-01-15 11:27:27',1),(371,346,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-15 11:21:11','2019-01-15 11:21:53',1),(372,347,162,'ພຸດດິງ',1,2000,2000,NULL,'2019-01-15 11:33:55','2019-01-15 11:33:55',0),(373,347,164,'ບຮາວນີ່',1,4000,4000,NULL,'2019-01-15 11:33:55','2019-01-15 11:33:55',0),(374,348,68,'ແມັງໂກ້ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-15 11:36:09','2019-01-15 11:51:26',1),(375,349,117,'ເຂົ້າ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-15 11:42:43','2019-01-15 11:49:10',1),(376,349,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-15 11:42:43','2019-01-15 11:43:34',1),(377,350,162,'ພຸດດິງ',1,2000,2000,NULL,'2019-01-15 11:44:38','2019-01-15 11:49:41',1),(378,350,164,'ບຮາວນີ່',1,4000,4000,NULL,'2019-01-15 11:44:38','2019-01-15 11:49:41',1),(379,351,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-15 11:48:24','2019-01-15 12:00:03',1),(380,351,87,'ມັກກະໂລນີ - ຊ໋ອດແດງ',1,16000,16000,'ຫມຼ','2019-01-15 11:48:24','2019-01-15 11:54:39',1),(381,352,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-15 11:59:23','2019-01-15 11:59:23',0),(382,353,82,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ໝູ',1,18000,18000,'ໄກ່','2019-01-15 12:03:07','2019-01-15 12:12:37',1),(383,353,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-15 12:03:07','2019-01-15 12:15:08',1),(384,353,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,NULL,'2019-01-15 12:03:07','2019-01-15 12:11:37',1),(385,353,117,'ເຂົ້າ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-15 12:03:07','2019-01-15 12:16:47',1),(386,353,74,'ນ້ຳດື່ມ ຫົວເສືອ',4,3000,12000,NULL,'2019-01-15 12:03:07','2019-01-15 12:06:17',1),(387,354,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-15 12:04:52','2019-01-15 12:20:08',1),(388,354,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-15 12:04:52','2019-01-15 12:18:27',1),(389,354,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-15 12:04:52','2019-01-15 12:06:21',1),(390,355,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-15 12:05:48','2019-01-15 12:21:32',1),(391,355,81,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-15 12:05:48','2019-01-15 12:25:29',1),(392,355,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-15 12:05:48','2019-01-15 12:24:30',1),(393,355,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-15 12:05:48','2019-01-15 12:06:27',1),(394,356,70,'ນ້ຳບຣູເບີຣີ',1,10000,10000,NULL,'2019-01-15 12:07:33','2019-01-15 12:11:31',1),(395,357,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-15 12:19:09','2019-01-15 12:22:58',1),(396,358,117,'ເຂົ້າ - ກະເພົາ ໝູ',2,16000,32000,NULL,'2019-01-15 12:30:11','2019-01-15 12:38:37',1),(397,358,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-15 12:30:11','2019-01-15 12:30:33',1),(398,359,117,'ເຂົ້າ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-15 12:31:28','2019-01-15 12:42:29',1),(399,359,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-15 12:31:28','2019-01-15 12:37:22',1),(400,359,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-15 12:31:28','2019-01-15 12:31:51',1),(401,360,81,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-15 12:34:08','2019-01-15 12:48:35',1),(402,360,176,'ກຸ້ງຊຸບແປ້ງທອດ',1,28000,28000,NULL,'2019-01-15 12:34:08','2019-01-15 12:56:56',1),(403,360,135,'ເຂົ້າ ໝູທອດກະທຽມ',1,16000,16000,NULL,'2019-01-15 12:34:08','2019-01-15 12:46:15',1),(404,360,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-15 12:34:08','2019-01-15 12:40:13',1),(405,360,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-15 12:34:08','2019-01-15 12:34:44',1),(406,360,62,'ເຜືອກຫອມນົມສົດ',1,13000,13000,NULL,'2019-01-15 12:34:08','2019-01-15 12:39:21',1),(407,360,167,'ນົມສົດເສົາກ໊ວຍ',1,13000,13000,NULL,'2019-01-15 12:34:08','2019-01-15 12:39:16',1),(408,361,178,'ເຂົ້າຈ້າວ',1,5000,5000,NULL,'2019-01-15 12:50:10','2019-01-15 12:52:19',1),(409,361,82,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ໝູ',1,18000,18000,'ໄກ່','2019-01-15 12:50:10','2019-01-15 12:57:14',1),(410,362,149,'ຕຳໝາກຮຸ່ງ',1,12000,12000,'ປົນເຂົ້າປຸ້ນ','2019-01-15 13:35:08','2019-01-15 13:35:08',0),(411,363,97,'ເສັ້ນໃຫຍ່ - ລາດໜ້າ ໄກ່',1,16000,16000,NULL,'2019-01-15 15:14:21','2019-01-15 15:24:47',1),(412,363,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-15 15:14:21','2019-01-15 15:15:42',1),(413,364,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-15 15:26:18','2019-01-15 15:26:18',0),(414,365,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-15 15:28:48','2019-01-15 15:28:48',0),(415,366,167,'ນົມສົດເສົາກ໊ວຍ',1,13000,13000,NULL,'2019-01-15 15:30:00','2019-01-15 15:30:00',0),(416,367,67,'ສະຕຣໍເບີຣີ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-15 15:41:28','2019-01-15 15:51:14',1),(417,367,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-15 15:41:28','2019-01-15 15:53:48',1),(418,368,82,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ໝູ',2,18000,36000,NULL,'2019-01-15 16:53:51','2019-01-15 17:11:57',1),(419,368,111,'ສຸກກີ້ນ້ຳ - ໄກ່',1,16000,16000,NULL,'2019-01-15 16:53:51','2019-01-15 17:03:56',1),(420,368,146,'ປາດອນລິ໊ ຊຸບແປ້ງທອດ',1,20000,20000,NULL,'2019-01-15 16:53:51','2019-01-15 17:10:35',1),(421,368,148,'ປີກໄກ່ທອດ ບາບີຄິວ',1,25000,25000,NULL,'2019-01-15 16:53:51','2019-01-15 17:18:44',1),(422,369,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-15 16:59:27','2019-01-15 17:12:10',1),(423,369,62,'ເຜືອກຫອມນົມສົດ',1,13000,13000,NULL,'2019-01-15 16:59:27','2019-01-15 17:12:13',1),(424,369,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-15 16:59:27','2019-01-15 17:12:12',1),(425,369,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-15 16:59:27','2019-01-15 17:12:11',1),(426,370,162,'ພຸດດິງ',1,2000,2000,NULL,'2019-01-15 17:07:11','2019-01-15 17:12:02',1),(427,371,113,'ເຂົ້າ ຜັດ - ໝູ',2,16000,32000,NULL,'2019-01-15 18:17:32','2019-01-15 18:27:57',1),(428,371,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-15 18:17:32','2019-01-15 18:42:56',1),(429,371,147,'ປີກໄກ່ທອດ ທາລິຢາກິ',1,25000,25000,NULL,'2019-01-15 18:17:32','2019-01-15 18:48:34',1),(430,371,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-15 18:17:32','2019-01-15 18:36:07',1),(431,371,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-15 18:17:32','2019-01-15 18:18:13',1),(432,371,117,'ເຂົ້າ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-15 18:17:32','2019-01-15 18:28:47',1),(433,372,139,'ໄກ່ທອດ',2,10000,20000,NULL,'2019-01-15 19:25:44','2019-01-15 19:25:44',0),(434,373,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-16 08:54:23','2019-01-16 08:54:23',0),(435,374,131,'ເຂົ້າມັນໄກ່',1,16000,16000,NULL,'2019-01-16 09:55:31','2019-01-16 09:55:31',0),(436,374,70,'ນ້ຳບຣູເບີຣີ',1,10000,10000,NULL,'2019-01-16 09:55:31','2019-01-16 10:02:01',1),(437,375,70,'ນ້ຳບຣູເບີຣີ',1,10000,10000,NULL,'2019-01-16 09:57:19','2019-01-16 10:01:59',1),(438,375,131,'ເຂົ້າມັນໄກ່',1,16000,16000,NULL,'2019-01-16 09:57:19','2019-01-16 10:09:27',1),(439,376,131,'ເຂົ້າມັນໄກ່',1,16000,16000,NULL,'2019-01-16 10:28:14','2019-01-16 10:44:56',1),(440,376,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-16 10:28:14','2019-01-16 10:37:46',1),(441,376,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-16 10:28:14','2019-01-16 10:29:10',1),(442,377,68,'ແມັງໂກ້ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-16 10:38:28','2019-01-16 10:38:28',0),(443,378,65,'ດັບໂບ້ ຊ໋ອກໂກ້',2,17000,34000,NULL,'2019-01-16 11:02:27','2019-01-16 11:21:46',1),(444,379,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,'ກອບ','2019-01-16 11:11:30','2019-01-16 11:32:56',1),(445,380,82,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ໝູ',1,18000,18000,NULL,'2019-01-16 11:14:49','2019-01-16 11:43:27',1),(446,380,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-16 11:14:49','2019-01-16 11:36:57',1),(447,380,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-16 11:14:49','2019-01-16 11:39:13',1),(448,380,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-16 11:14:49','2019-01-16 11:15:56',1),(449,381,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-16 11:21:13','2019-01-16 11:21:13',0),(450,382,145,'ປີກໄກ່ ທອດນ້ຳປາ',1,20000,20000,NULL,'2019-01-16 11:51:35','2019-01-16 12:03:24',1),(451,383,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',1,18000,18000,NULL,'2019-01-16 11:54:24','2019-01-16 12:08:05',1),(452,383,85,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-16 11:54:24','2019-01-16 12:17:01',1),(453,383,117,'ເຂົ້າ - ກະເພົາ ໝູ',2,16000,32000,NULL,'2019-01-16 11:54:24','2019-01-16 12:03:47',1),(454,383,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-16 11:54:24','2019-01-16 12:06:47',1),(455,383,149,'ຕຳໝາກຮຸ່ງ',1,12000,12000,'ໃສ່ເຂົ້າປຸ້ນ+ສົ້ມນົວ +ເຜັດ','2019-01-16 11:54:24','2019-01-16 12:17:00',1),(456,384,167,'ນົມສົດເສົາກ໊ວຍ',1,13000,13000,NULL,'2019-01-16 11:55:13','2019-01-16 12:01:05',1),(457,385,147,'ປີກໄກ່ທອດ ທາລິຢາກິ',1,25000,25000,NULL,'2019-01-16 12:08:48','2019-01-16 12:30:07',1),(458,385,139,'ໄກ່ທອດ',1,10000,10000,NULL,'2019-01-16 12:08:48','2019-01-16 12:21:39',1),(459,386,133,'ເຂົ້າໝູ ພິກໄທດຳ',3,16000,48000,NULL,'2019-01-16 12:14:53','2019-01-16 12:33:23',1),(460,386,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,NULL,'2019-01-16 12:14:53','2019-01-16 12:25:16',1),(461,386,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-16 12:14:53','2019-01-16 12:34:12',1),(462,386,78,'ສຸກກີ້ນ້ຳ - ໝູ',2,16000,32000,NULL,'2019-01-16 12:14:53','2019-01-16 12:42:42',1),(463,387,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-16 12:15:31','2019-01-16 12:15:52',1),(464,388,107,'ສຸກກິ້ ແຫ້ງ - ທະເລ',1,18000,18000,NULL,'2019-01-16 12:20:56','2019-01-16 12:49:45',1),(465,388,110,'ສຸກກີ້ນ້ຳ - ທະເລ',1,18000,18000,NULL,'2019-01-16 12:20:56','2019-01-16 12:53:57',1),(466,388,98,'ເສັ້ນໃຫຍ່ - ລາດໜ້າ ທະເລ',1,18000,18000,NULL,'2019-01-16 12:20:56','2019-01-16 12:47:03',1),(467,388,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-16 12:20:56','2019-01-16 12:40:44',1),(468,388,74,'ນ້ຳດື່ມ ຫົວເສືອ',4,3000,12000,NULL,'2019-01-16 12:20:56','2019-01-16 12:21:26',1),(469,389,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-16 12:32:36','2019-01-16 12:58:37',1),(470,390,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-16 12:53:25','2019-01-16 12:59:37',1),(471,390,176,'ກຸ້ງຊຸບແປ້ງທອດ',1,28000,28000,NULL,'2019-01-16 12:53:25','2019-01-16 13:11:17',1),(472,390,134,'ເຂົ້າ - ຂິງໄກ່',1,16000,16000,NULL,'2019-01-16 12:53:25','2019-01-16 13:04:28',1),(473,390,117,'ເຂົ້າ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-16 12:53:25','2019-01-16 13:01:33',1),(474,390,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-16 12:53:25','2019-01-16 12:54:03',1),(475,391,117,'ເຂົ້າ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-16 12:57:49','2019-01-16 13:07:16',1),(476,391,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,'ໄກ່','2019-01-16 12:57:49','2019-01-16 13:10:52',1),(477,391,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-16 12:57:49','2019-01-16 12:58:18',1),(478,391,73,'ນ້ຳລີ້ນຈິ່',1,10000,10000,NULL,'2019-01-16 12:57:49','2019-01-16 13:06:47',1),(479,392,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-16 13:10:04','2019-01-16 13:10:04',0),(480,393,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-16 13:13:04','2019-01-16 13:13:04',0),(481,394,134,'ເຂົ້າ - ຂິງໄກ່',1,16000,16000,'ບໍ່ເອົາເຂົ້າ ເອົາແຕ່ຕ່ອນ','2019-01-16 13:15:19','2019-01-16 13:21:10',1),(482,395,180,'ຕຳລ້ອນ',1,10000,10000,'ສົ້ມຫວານ ທຳມະດາ','2019-01-16 13:26:27','2019-01-16 13:26:27',0),(483,396,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-16 14:12:46','2019-01-16 14:12:46',0),(484,397,139,'ໄກ່ທອດ',1,10000,10000,NULL,'2019-01-16 14:15:26','2019-01-16 14:33:17',1),(485,397,140,'ທອດລຸກຊີ້ນ ຮັອດດອກ',1,12000,12000,NULL,'2019-01-16 14:15:26','2019-01-16 14:33:55',1),(486,397,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-16 14:15:26','2019-01-16 14:21:36',1),(487,398,62,'ເຜືອກຫອມນົມສົດ',1,13000,13000,NULL,'2019-01-16 14:29:22','2019-01-16 14:29:22',0),(488,399,181,'ສະປາເກັດຕີ້ - ຂີ້ເມົາ ທະເລ',1,20000,20000,NULL,'2019-01-16 14:55:16','2019-01-16 15:07:38',1),(489,399,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-16 14:55:16','2019-01-16 14:55:48',1),(490,400,66,'ຊາຂຽວປັ່ນ',2,17000,34000,'ເປັດ','2019-01-16 15:02:35','2019-01-16 15:02:35',0),(491,401,67,'ສະຕຣໍເບີຣີ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-16 15:18:46','2019-01-16 15:18:46',0),(492,402,169,'ທອດລູກຊິ້ນ',1,12000,12000,NULL,'2019-01-16 15:20:08','2019-01-16 15:20:08',0),(493,402,62,'ເຜືອກຫອມນົມສົດ',1,13000,13000,NULL,'2019-01-16 15:20:08','2019-01-16 15:25:02',1),(494,403,156,'ຕຳປູ',1,28000,28000,NULL,'2019-01-16 15:32:32','2019-01-16 15:46:15',1),(495,404,151,'ຕຳຕ່ອນ',1,15000,15000,NULL,'2019-01-16 16:04:22','2019-01-16 16:04:22',0),(496,405,169,'ທອດລູກຊິ້ນ',1,12000,12000,NULL,'2019-01-16 16:26:36','2019-01-16 16:26:36',0),(497,406,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-16 19:09:27','2019-01-16 19:24:49',1),(498,406,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-16 19:09:27','2019-01-16 19:24:54',1),(499,406,69,'ຊ໋ອກໂກ້ ບລາວນີ້',2,17000,34000,NULL,'2019-01-16 19:09:27','2019-01-16 19:24:48',1),(500,407,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-16 19:16:13','2019-01-16 19:16:13',0),(501,407,117,'ເຂົ້າ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-16 19:16:13','2019-01-16 19:25:15',1),(502,408,96,'ເສັ້ນໃຫຍ່ - ລາດໜ້າ ໝູ',1,16000,16000,NULL,'2019-01-16 19:22:53','2019-01-16 19:36:31',1),(503,408,149,'ຕຳໝາກຮຸ່ງ',1,12000,12000,'ເຜັດ4ໜ່ວຍ ສົ້ມ,','2019-01-16 19:22:53','2019-01-16 19:36:32',1),(504,409,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-16 19:23:28','2019-01-16 19:23:28',0),(505,409,94,'ຜັດໄທ - ໝູ',1,16000,16000,NULL,'2019-01-16 19:23:28','2019-01-16 19:23:28',0),(506,410,169,'ທອດລູກຊິ້ນ',1,12000,12000,NULL,'2019-01-17 09:31:10','2019-01-17 09:42:29',1),(507,410,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-17 09:31:10','2019-01-17 09:31:10',0),(508,411,185,'ເຂົ້າ - ກະເພົາ ໝູກອບ',1,16000,16000,NULL,'2019-01-17 10:19:09','2019-01-17 10:19:09',0),(509,412,62,'ເຜືອກຫອມນົມສົດ',1,13000,13000,NULL,'2019-01-17 10:33:53','2019-01-17 10:37:57',1),(510,413,67,'ສະຕຣໍເບີຣີ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-17 11:02:15','2019-01-17 11:09:20',1),(511,414,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',1,18000,18000,NULL,'2019-01-17 11:52:27','2019-01-17 12:18:51',1),(512,414,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-17 11:52:27','2019-01-17 12:18:54',1),(513,414,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,NULL,'2019-01-17 11:52:27','2019-01-17 12:10:13',1),(514,415,96,'ເສັ້ນໃຫຍ່ - ລາດໜ້າ ໝູ',1,16000,16000,NULL,'2019-01-17 11:56:05','2019-01-17 11:56:05',0),(515,415,84,'ສະປາເກັດຕີ້ - ກະເພົາ',1,18000,18000,NULL,'2019-01-17 11:56:05','2019-01-17 11:56:05',0),(516,415,117,'ເຂົ້າ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-17 11:56:05','2019-01-17 11:56:05',0),(517,415,174,'ໄຂ່ດາວ',1,4000,4000,'ບໍ່ສຸກ','2019-01-17 11:56:05','2019-01-17 11:56:05',0),(518,416,104,'ໝີ່ກອບລາດໜ້າ - ໄກ່',1,16000,16000,NULL,'2019-01-17 11:59:46','2019-01-17 12:50:21',1),(519,416,152,'ຕຳມົ້ວ',1,15000,15000,NULL,'2019-01-17 11:59:46','2019-01-17 12:49:21',1),(520,416,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-17 11:59:46','2019-01-17 12:45:17',1),(521,416,117,'ເຂົ້າ - ກະເພົາ ໝູ',1,16000,16000,'ບໍ່ເອົາເຂົ້າ ກັບບ້ານ','2019-01-17 11:59:46','2019-01-17 13:00:23',1),(522,416,145,'ປີກໄກ່ ທອດນ້ຳປາ',1,20000,20000,'ກັບບ້ານ','2019-01-17 11:59:46','2019-01-17 12:59:22',1),(523,416,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-17 11:59:46','2019-01-17 12:28:31',1),(524,417,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-17 12:00:28','2019-01-17 12:10:36',1),(525,418,133,'ເຂົ້າໝູ ພິກໄທດຳ',2,16000,32000,'ນ້ໍາສຸບຈານ 1 ບໍ່ໃສ່ຫອມ','2019-01-17 12:09:53','2019-01-17 12:09:53',0),(526,418,117,'ເຂົ້າ - ກະເພົາ ໝູ',2,16000,32000,NULL,'2019-01-17 12:09:53','2019-01-17 12:09:53',0),(527,418,113,'ເຂົ້າ ຜັດ - ໝູ',2,16000,32000,NULL,'2019-01-17 12:09:53','2019-01-17 12:09:53',0),(528,418,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-17 12:09:53','2019-01-17 12:09:53',0),(529,419,133,'ເຂົ້າໝູ ພິກໄທດຳ',2,16000,32000,NULL,'2019-01-17 12:12:37','2019-01-17 12:34:13',1),(530,419,113,'ເຂົ້າ ຜັດ - ໝູ',2,16000,32000,NULL,'2019-01-17 12:12:37','2019-01-17 12:41:08',1),(531,419,117,'ເຂົ້າ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-17 12:12:37','2019-01-17 12:36:04',1),(532,419,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-17 12:12:37','2019-01-17 12:41:23',1),(533,420,55,'ກະເພົາ - ທະເລ',1,18000,18000,'ບໍ່ເຜັດ','2019-01-17 12:14:31','2019-01-17 12:55:08',1),(534,421,139,'ໄກ່ທອດ',1,10000,10000,NULL,'2019-01-17 12:15:32','2019-01-17 12:15:32',0),(535,421,176,'ກຸ້ງຊຸບແປ້ງທອດ',2,28000,56000,NULL,'2019-01-17 12:15:32','2019-01-17 12:15:32',0),(536,422,139,'ໄກ່ທອດ',2,10000,20000,NULL,'2019-01-17 12:16:39','2019-01-17 12:16:39',0),(537,422,176,'ກຸ້ງຊຸບແປ້ງທອດ',2,28000,56000,NULL,'2019-01-17 12:16:39','2019-01-17 12:16:39',0),(538,423,76,'ຜັດໄທ - ທະເລ',2,18000,36000,NULL,'2019-01-17 12:32:06','2019-01-17 13:02:39',1),(539,424,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-17 12:47:19','2019-01-17 12:47:19',0),(540,425,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-17 12:48:22','2019-01-17 13:03:58',1),(541,426,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,'ກັບບ້ານ','2019-01-17 12:53:20','2019-01-17 13:06:22',1),(542,427,168,'ຕຳເສັ້ນແກ້ວ',1,16000,16000,'ສົ້ມຫວານ','2019-01-17 13:16:53','2019-01-17 13:29:09',1),(543,427,169,'ທອດລູກຊິ້ນ',1,12000,12000,NULL,'2019-01-17 13:16:53','2019-01-17 13:29:20',1),(544,428,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-17 15:14:16','2019-01-17 15:39:31',1),(545,428,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-17 15:14:16','2019-01-17 15:27:41',1),(546,428,187,'ຂະໜົມປັງ ສັງຂະຫຍາ ກັບບ້ານ',1,12000,12000,NULL,'2019-01-17 15:14:16','2019-01-17 15:27:40',1),(547,429,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-17 16:31:06','2019-01-17 16:52:15',1),(548,429,155,'ຕຳຫອຍແຄງ',1,28000,28000,NULL,'2019-01-17 16:31:06','2019-01-17 16:51:59',1),(549,429,110,'ສຸກກີ້ນ້ຳ - ທະເລ',1,18000,18000,NULL,'2019-01-17 16:31:06','2019-01-17 16:52:20',1),(550,429,139,'ໄກ່ທອດ',1,10000,10000,NULL,'2019-01-17 16:31:06','2019-01-17 16:57:50',1),(551,429,107,'ສຸກກິ້ ແຫ້ງ - ທະເລ',1,18000,18000,NULL,'2019-01-17 16:31:06','2019-01-17 16:52:08',1),(552,429,64,'ນົມສົດກ້ວຍຫອມ',1,13000,13000,NULL,'2019-01-17 16:31:06','2019-01-17 16:36:38',1),(553,429,167,'ນົມສົດເສົາກ໊ວຍ',1,13000,13000,NULL,'2019-01-17 16:31:06','2019-01-17 16:36:36',1),(554,429,192,'ນົມສົດເສົາກ໊ວຍ pro',1,0,0,NULL,'2019-01-17 16:31:06','2019-01-17 16:36:39',1),(555,430,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-17 16:42:07','2019-01-17 16:57:57',1),(556,431,149,'ຕຳໝາກຮຸ່ງ',1,12000,12000,NULL,'2019-01-17 18:31:57','2019-01-17 18:31:57',0),(557,432,167,'ນົມສົດເສົາກ໊ວຍ',1,13000,13000,NULL,'2019-01-17 19:35:06','2019-01-17 19:35:06',0),(558,432,67,'ສະຕຣໍເບີຣີ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-17 19:35:06','2019-01-17 19:35:06',0),(559,432,71,'ນ້ຳໝາກນອດ',1,10000,10000,NULL,'2019-01-17 19:35:06','2019-01-17 19:35:06',0),(560,432,62,'ເຜືອກຫອມນົມສົດ',1,13000,13000,NULL,'2019-01-17 19:35:06','2019-01-17 19:35:06',0),(561,432,190,'ຊາຂຽວ pro',1,0,0,NULL,'2019-01-17 19:35:06','2019-01-17 19:35:06',0),(562,433,125,'ເຂົ້າ ຜັກກາດນາ - ໄກ່',1,16000,16000,NULL,'2019-01-18 09:01:01','2019-01-18 09:36:48',1),(563,434,67,'ສະຕຣໍເບີຣີ ໂຍເກີສ',1,17000,17000,NULL,'2019-01-18 09:23:05','2019-01-18 09:35:50',1),(564,434,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-18 09:23:05','2019-01-18 09:30:30',1),(565,435,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',1,18000,18000,NULL,'2019-01-18 09:24:06','2019-01-18 09:36:11',1),(566,435,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-18 09:24:06','2019-01-18 09:30:01',1),(567,436,66,'ຊາຂຽວປັ່ນ',1,17000,17000,NULL,'2019-01-18 10:37:02','2019-01-18 10:37:02',0),(568,437,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,'ໄກ່ເອົາແຕ່ຊີ້ນບໍ່ໜັງ','2019-01-18 10:48:49','2019-01-18 10:56:58',1),(569,438,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-18 11:34:09','2019-01-18 11:44:12',1),(570,438,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-18 11:34:09','2019-01-18 11:41:20',1),(571,438,113,'ເຂົ້າ ຜັດ - ໝູ',1,16000,16000,NULL,'2019-01-18 11:34:09','2019-01-18 11:43:52',1),(572,438,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-18 11:34:09','2019-01-18 11:34:50',1),(573,439,61,'ນົມສົດ ຄາຣາເມລ',1,13000,13000,NULL,'2019-01-18 11:35:50','2019-01-18 11:41:47',1),(574,440,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-18 12:11:08','2019-01-18 12:26:19',1),(575,440,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-18 12:11:08','2019-01-18 12:20:57',1),(576,440,135,'ເຂົ້າ ໝູທອດກະທຽມ',1,16000,16000,NULL,'2019-01-18 12:11:08','2019-01-18 12:24:44',1),(577,441,117,'ກະເພົາ - ໝູ',1,16000,16000,NULL,'2019-01-18 12:37:43','2019-01-18 12:47:52',1),(578,441,108,'ສຸກກິ້ ແຫ້ງ - ໝູ',1,16000,16000,NULL,'2019-01-18 12:37:43','2019-01-18 12:47:25',1),(579,441,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-18 12:37:43','2019-01-18 12:38:39',1),(580,442,70,'ນ້ຳບຣູເບີຣີ',1,10000,10000,NULL,'2019-01-18 12:40:25','2019-01-18 12:44:23',1),(581,443,131,'ເຂົ້າມັນໄກ່',1,16000,16000,NULL,'2019-01-18 12:41:54','2019-01-18 12:54:37',1),(582,443,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-18 12:41:54','2019-01-18 12:53:41',1),(583,444,65,'ດັບໂບ້ ຊ໋ອກໂກ້',1,17000,17000,NULL,'2019-01-18 12:43:51','2019-01-18 12:58:52',1),(584,445,132,'ເຂົ້າມັນໄກ່ ກອບ',2,16000,32000,NULL,'2019-01-18 12:47:04','2019-01-18 13:00:44',1),(585,445,73,'ນ້ຳລີ້ນຈິ່',1,10000,10000,NULL,'2019-01-18 12:47:04','2019-01-18 12:53:00',1),(586,445,65,'ດັບໂບ້ ຊ໋ອກໂກ້',1,17000,17000,NULL,'2019-01-18 12:47:04','2019-01-18 12:59:01',1),(587,445,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-18 12:47:04','2019-01-18 12:57:16',1),(588,446,167,'ນົມສົດເສົາກ໊ວຍ',1,13000,13000,NULL,'2019-01-18 13:14:59','2019-01-18 13:17:43',1),(589,447,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-18 14:36:36','2019-01-18 14:48:50',1),(590,447,140,'ທອດລຸກຊີ້ນ ຮັອດດອກ',1,12000,12000,NULL,'2019-01-18 14:36:36','2019-01-18 14:45:52',1),(591,448,139,'ໄກ່ທອດ',2,10000,20000,NULL,'2019-01-18 15:26:50','2019-01-18 15:50:02',1),(592,448,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-18 15:26:50','2019-01-18 15:40:45',1),(593,448,76,'ຜັດໄທ - ທະເລ',1,18000,18000,NULL,'2019-01-18 15:26:50','2019-01-18 15:42:58',1),(594,448,62,'ເຜືອກຫອມນົມສົດ',2,13000,26000,NULL,'2019-01-18 15:26:50','2019-01-18 15:42:10',1),(595,448,189,'ເຜືອກຫອມນົມສົດ pro',1,0,0,NULL,'2019-01-18 15:26:50','2019-01-18 15:42:11',1),(596,448,142,'ໄກ່ສະຕິກ',1,15000,15000,NULL,'2019-01-18 15:26:50','2019-01-18 15:55:06',1),(597,448,140,'ທອດລຸກຊີ້ນ ຮັອດດອກ',1,12000,12000,NULL,'2019-01-18 15:26:50','2019-01-18 15:41:27',1),(603,451,74,'ນ້ຳດື່ມ ຫົວເສືອ',3,3000,9000,NULL,'2019-01-19 23:45:16','2019-01-19 23:45:16',0),(605,453,171,'Pepsi',2,6000,12000,NULL,'2019-01-19 23:47:15','2019-01-19 23:47:15',0),(606,454,54,'ກະເພົາ - ງົວ',1,18000,18000,NULL,'2019-01-20 00:03:50','2019-01-20 00:03:50',0),(607,455,54,'ກະເພົາ - ງົວ',1,18000,18000,NULL,'2019-01-20 00:04:30','2019-01-20 00:04:30',0),(612,459,116,'ເຂົ້າ ຂີ້ເມົາ ທະເລ',1,18000,18000,NULL,'2019-01-20 00:11:34','2019-01-20 00:11:34',0),(613,460,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-20 00:17:07','2019-01-20 00:17:07',0),(614,460,134,'ເຂົ້າ ຂິງໄກ່',1,16000,16000,NULL,'2019-01-20 00:17:07','2019-01-20 00:17:07',0),(616,461,132,'ເຂົ້າມັນໄກ່ ກອບ',2,16000,32000,NULL,'2019-01-20 00:18:46','2019-01-20 00:18:46',0),(617,461,133,'ເຂົ້າໝູ ພິກໄທດຳ',2,16000,32000,NULL,'2019-01-20 00:18:46','2019-01-20 00:18:46',0),(618,461,116,'ເຂົ້າ ຂີ້ເມົາ ທະເລ',2,18000,36000,NULL,'2019-01-20 00:18:46','2019-01-20 00:18:46',0),(619,462,62,'ເຜືອກຫອມນົມສົດ',3,13000,39000,NULL,'2019-01-20 00:21:13','2019-01-20 00:21:13',0),(620,463,115,'ເຂົ້າ ຂີ້ເມົາ ໝູ',1,16000,16000,NULL,'2019-01-20 00:24:57','2019-01-20 00:24:57',0),(621,464,171,'Pepsi',1,6000,6000,NULL,'2019-01-21 10:32:13','2019-01-21 10:32:13',0),(622,465,171,'Pepsi',1,6000,6000,NULL,'2019-01-21 14:59:20','2019-01-21 14:59:20',0),(623,466,171,'Pepsi',1,6000,6000,NULL,'2019-01-21 15:24:51','2019-01-21 15:24:51',0),(629,471,171,'Pepsi',2,6000,12000,NULL,'2019-01-21 15:51:33','2019-01-21 15:51:33',0),(630,472,171,'Pepsi',1,6000,6000,NULL,'2019-01-21 15:52:22','2019-01-21 15:52:22',0),(631,473,171,'Pepsi',1,6000,6000,NULL,'2019-01-21 15:54:23','2019-01-21 15:54:23',0),(632,474,171,'Pepsi',1,6000,6000,NULL,'2019-01-21 15:55:23','2019-01-21 15:55:23',0),(633,475,171,'Pepsi',2,6000,12000,NULL,'2019-01-21 15:56:15','2019-01-21 15:56:15',0),(634,476,171,'Pepsi',3,6000,18000,NULL,'2019-01-21 15:59:49','2019-01-21 15:59:49',0),(636,478,74,'ນ້ຳດື່ມ ຫົວເສືອ',3,3000,9000,NULL,'2019-01-21 16:03:53','2019-01-21 16:03:53',0),(637,479,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-21 16:17:00','2019-01-21 16:17:00',0),(638,480,114,'ເຂົ້າ ຂິ້ເມົາ ໄກ່',1,16000,16000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(639,480,115,'ເຂົ້າ ຂີ້ເມົາ ໝູ',1,16000,16000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(640,480,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(641,480,116,'ເຂົ້າ ຂີ້ເມົາ ທະເລ',1,18000,18000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(642,480,135,'ເຂົ້າ ໝູທອດກະທຽມ',1,16000,16000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(643,480,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(644,480,136,'ເຂົ້າ ໄຂ່ຈຽວ ໝູສັບ',1,16000,16000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(645,481,171,'Pepsi',5,6000,30000,NULL,'2019-01-21 16:19:31','2019-01-21 16:19:31',0),(646,482,171,'Pepsi',1,6000,6000,NULL,'2019-01-21 16:32:44','2019-01-21 16:32:44',0),(647,483,170,'Beer',1,15000,15000,NULL,'2019-01-21 16:33:51','2019-01-21 16:33:51',0);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger transactionlog_insert_tr after insert on orderdetails for each row
  begin
    insert into transactionlog (select * from orderdetails where id = NEW.id);
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderRefno` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `order_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `finish_datetime` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `grandtotal` decimal(10,0) NOT NULL DEFAULT 0,
  `received` decimal(10,0) DEFAULT NULL,
  `change` decimal(10,0) DEFAULT NULL,
  `ticketId` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `settled` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderRefno` (`orderRefno`),
  KEY `ticketId` (`ticketId`),
  KEY `statusId` (`statusId`),
  KEY `userId` (`userId`),
  KEY `orders_customer_fk` (`customerId`),
  CONSTRAINT `orders_customer_fk` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ticketId`) REFERENCES `tickets` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`statusId`) REFERENCES `statuses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `orderRefno`, `order_datetime`, `finish_datetime`, `quantity`, `grandtotal`, `received`, `change`, `ticketId`, `statusId`, `userId`, `customerId`, `createdAt`, `updatedAt`, `settled`) VALUES (161,'1d5f0e30-52a9-4ca8-86a2-6e143f8e4c25','2019-01-07 18:01:40','2019-01-07 18:02:27',0,42000,50000,8000,1,4,18,1,'2019-01-07 18:01:40','2019-01-07 18:02:29',0),(162,'73a754da-d4ee-4386-9b54-a0f95a614dcf','2019-01-07 18:03:01','2019-01-07 18:09:57',0,56000,60000,4000,1,4,18,2,'2019-01-07 18:03:01','2019-01-07 18:09:58',0),(163,'4d7a60cb-e147-45d5-9be6-149633241b44','2019-01-07 18:10:33','2019-01-07 18:11:50',0,61000,70000,9000,11,4,18,1,'2019-01-07 18:10:33','2019-01-07 18:11:51',0),(164,'8ebb5956-2450-48e3-ad8c-3d4f25569904','2019-01-07 18:13:48','2019-01-07 18:15:37',0,19000,20000,1000,11,4,18,1,'2019-01-07 18:13:48','2019-01-07 18:15:38',0),(165,'6d1da782-0ec7-42bd-bb5a-2fe13ea78a64','2019-01-08 00:36:25','2019-01-08 00:40:13',0,16000,16000,0,14,4,18,2,'2019-01-08 00:36:25','2019-01-08 00:40:14',0),(166,'8df224e4-4af5-4f64-9de8-72e34cde99d6','2019-01-08 00:40:33','2019-01-08 00:41:01',0,18000,18000,0,11,4,18,2,'2019-01-08 00:40:33','2019-01-08 00:41:02',0),(167,'d1cca6f0-d2b2-495b-bef9-6f2b8dd8a8d9','2019-01-08 00:41:26','2019-01-08 00:46:18',0,50000,50000,0,1,4,18,1,'2019-01-08 00:41:26','2019-01-08 00:46:19',0),(168,'97549d00-d900-4c90-8d6d-019a98a6558d','2019-01-08 00:46:09','2019-01-08 00:46:21',0,10000,10000,0,11,4,18,2,'2019-01-08 00:46:09','2019-01-08 00:46:21',0),(169,'e089a8d6-c0c9-482f-80f2-88c7bb79a180','2019-01-08 01:22:28','2019-01-08 01:27:46',0,16000,16000,0,1,4,23,2,'2019-01-08 01:22:28','2019-01-08 01:27:47',0),(170,'72003381-bd72-4fd2-823f-32b469be5f53','2019-01-08 02:23:32','2019-01-08 02:25:42',0,16000,20000,4000,1,4,25,1,'2019-01-08 02:23:32','2019-01-08 02:25:42',0),(171,'b8fbc332-30fc-44a7-9a67-0689640679e4','2019-01-08 02:27:03','2019-01-08 02:27:57',0,18000,20000,2000,11,4,25,1,'2019-01-08 02:27:03','2019-01-08 02:27:58',0),(172,'88ba7dcb-955f-42af-bf36-cb700ba6cd8f','2019-01-08 02:38:13','2019-01-08 02:39:26',0,10000,20000,10000,1,4,25,1,'2019-01-08 02:38:13','2019-01-08 02:39:26',0),(173,'16d3dc07-7ef2-444e-b141-e3914f8867f3','2019-01-08 02:40:13','2019-01-08 02:40:49',0,10000,10000,0,1,4,25,1,'2019-01-08 02:40:13','2019-01-08 02:40:50',0),(174,'c92759e5-e0fe-4acb-b89a-49e8e7b78af1','2019-01-08 03:00:19','2019-01-08 03:00:42',0,10000,20000,10000,1,4,25,1,'2019-01-08 03:00:19','2019-01-08 03:00:43',0),(175,'e69f2dc4-6d61-4aeb-879e-144d594fcf35','2019-01-08 03:01:46','2019-01-08 03:02:07',0,10000,20000,10000,1,4,25,2,'2019-01-08 03:01:46','2019-01-08 03:02:08',0),(176,'54abd843-b6d8-40fc-bb8a-d00dbb1e97ba','2019-01-08 03:06:50','2019-01-08 03:07:27',0,28000,30000,2000,1,4,18,1,'2019-01-08 03:06:50','2019-01-08 03:07:28',0),(177,'2262f9a1-f1fa-455a-83c2-eff8c51bd383','2019-01-08 03:28:44','2019-01-08 03:39:16',0,10000,10000,0,4,4,18,1,'2019-01-08 03:28:44','2019-01-08 03:39:16',0),(178,'b1b5b5d3-91ff-426f-ad3e-47a69ed5106d','2019-01-08 03:56:35','2019-01-08 03:58:52',0,10000,10000,0,9,4,18,1,'2019-01-08 03:56:35','2019-01-08 03:58:54',0),(179,'6f5966b2-7dbc-44ab-9525-f08d89f48430','2019-01-08 04:45:15','2019-01-08 05:07:59',0,68000,70000,2000,1,2,25,1,'2019-01-08 04:45:15','2019-01-08 05:08:00',0),(180,'1069901d-34ef-45ac-8029-c53f3616c3f3','2019-01-08 04:52:27','2019-01-08 05:29:42',0,92000,92000,0,3,2,25,1,'2019-01-08 04:52:27','2019-01-08 05:29:42',0),(181,'da052040-a3c4-42c3-a95d-322db4ac70d7','2019-01-08 05:18:12','2019-01-08 05:24:31',0,49000,49000,0,5,2,25,1,'2019-01-08 05:18:12','2019-01-08 05:24:32',0),(182,'fd02c889-21fd-4f7d-8960-96ec07ea957f','2019-01-08 05:24:50','2019-01-08 05:25:23',0,13000,13000,0,4,2,25,1,'2019-01-08 05:24:50','2019-01-08 05:25:23',0),(183,'9c7bf978-3148-4473-8b9e-3452a39f56be','2019-01-08 05:28:08','2019-01-08 05:39:36',0,47000,50000,3000,6,2,25,1,'2019-01-08 05:28:08','2019-01-08 05:39:37',0),(184,'8cd11395-0098-4176-86ac-e57d94bb37bc','2019-01-08 05:34:31','2019-01-08 05:39:48',0,13000,13000,0,7,2,25,1,'2019-01-08 05:34:31','2019-01-08 05:39:48',0),(185,'051b432e-6b96-43c6-b749-3bbaf82e172e','2019-01-08 06:40:27','2019-01-08 08:54:47',0,94000,100000,6000,1,2,24,2,'2019-01-08 06:40:27','2019-01-08 08:54:46',0),(186,'322f6855-642f-46bf-a8aa-9daa905d3f75','2019-01-08 07:06:35','2019-01-08 07:12:31',0,13000,13000,0,5,2,24,1,'2019-01-08 07:06:35','2019-01-08 07:12:31',0),(187,'90af913e-8c47-403f-9554-9ef3ea54bd3f','2019-01-08 08:33:36','2019-01-08 08:54:47',0,26000,100000,74000,1,2,28,1,'2019-01-08 08:33:36','2019-01-08 08:54:47',0),(188,'257126ae-48b9-4e9e-b8b2-0fd7d8f70487','2019-01-08 08:51:19','2019-01-08 08:54:48',0,75000,75000,0,3,2,28,2,'2019-01-08 08:51:19','2019-01-08 08:54:48',0),(189,'b5aa32e0-1e6e-4189-afc0-3853acc01934','2019-01-08 11:01:16','2019-01-08 11:16:28',0,78000,100000,22000,3,2,28,1,'2019-01-08 11:01:16','2019-01-08 11:16:28',0),(190,'bf632800-1f20-47bb-930f-ab0e3d1be214','2019-01-08 11:11:51','2019-01-08 11:21:38',0,16000,16000,0,1,2,28,2,'2019-01-08 11:11:51','2019-01-08 11:21:38',0),(191,'d0b1fc0c-a25b-4bec-a5c5-928b49fd74ae','2019-01-08 11:20:43','2019-01-08 11:39:55',0,32000,50000,18000,3,2,28,2,'2019-01-08 11:20:43','2019-01-08 11:39:55',0),(192,'69cf74e1-36d9-487e-98c1-f35af37f4247','2019-01-08 11:37:51','2019-01-08 11:43:50',0,18000,100000,82000,1,2,28,2,'2019-01-08 11:37:51','2019-01-08 11:43:49',0),(193,'42bd74fd-bb5f-45df-a736-41eb88f70052','2019-01-08 12:03:13','2019-01-08 12:26:50',0,79000,100000,21000,1,2,28,2,'2019-01-08 12:03:13','2019-01-08 12:26:49',0),(194,'1ec7c0c8-b2b9-4607-a88e-5a8dc72c016f','2019-01-08 12:13:35','2019-01-08 12:38:30',0,63000,100000,37000,3,2,28,2,'2019-01-08 12:13:35','2019-01-08 12:38:30',0),(195,'e92e9e47-bc52-44cf-a23c-a5e82830b826','2019-01-08 12:32:26','2019-01-08 12:56:39',0,65000,100000,35000,1,2,28,2,'2019-01-08 12:32:26','2019-01-08 12:56:39',0),(196,'e87b7877-2ab0-4eea-aba4-bee664ddb006','2019-01-08 12:34:55','2019-01-08 12:44:36',0,25000,50000,25000,4,2,28,2,'2019-01-08 12:34:55','2019-01-08 12:44:36',0),(197,'ea4cd81a-dabd-446d-8c93-6ce7e9daa222','2019-01-08 12:36:38','2019-01-08 13:05:45',0,49000,49000,0,5,2,28,2,'2019-01-08 12:36:38','2019-01-08 13:05:45',0),(198,'a0a03420-a60e-4525-91a6-4955638a406c','2019-01-08 12:49:29','2019-01-08 12:49:52',0,3000,3000,0,3,2,28,2,'2019-01-08 12:49:29','2019-01-08 12:49:53',0),(199,'f95a0d56-0ccb-4e40-a102-d68ba51bccdc','2019-01-08 13:10:06','2019-01-08 13:37:54',0,56000,56000,0,1,2,28,1,'2019-01-08 13:10:06','2019-01-08 13:37:55',0),(200,'95ac8b4a-6078-4e1b-9a20-e238cd1fe4ef','2019-01-08 13:12:15','2019-01-08 13:37:56',0,38000,100000,62000,3,2,28,2,'2019-01-08 13:12:15','2019-01-08 13:37:56',0),(201,'ebdf4ea0-8d07-41ac-b9e8-ac3c7d1a93fa','2019-01-08 13:50:32','2019-01-08 14:59:18',0,16000,100000,84000,1,2,28,1,'2019-01-08 13:50:32','2019-01-08 14:59:18',0),(202,'eea6faa9-c54b-4437-b2d7-421a4624fd78','2019-01-09 04:27:17','2019-01-09 04:43:51',0,60000,100000,40000,1,2,25,2,'2019-01-09 04:27:17','2019-01-09 04:43:51',0),(203,'60989633-2a01-45b3-9bdb-508bea9c8110','2019-01-09 04:28:36','2019-01-09 04:30:31',0,13000,20000,7000,3,4,25,2,'2019-01-09 04:28:36','2019-01-09 04:30:29',0),(204,'082449b7-b926-42ab-8e07-ed503e54a375','2019-01-09 04:30:55','2019-01-09 04:33:55',0,13000,20000,7000,3,4,25,2,'2019-01-09 04:30:55','2019-01-09 04:33:53',0),(205,'73ce6394-b4c1-4adf-8294-1d20c4138032','2019-01-09 04:33:19','2019-01-09 04:43:54',0,15000,20000,5000,5,2,25,2,'2019-01-09 04:33:19','2019-01-09 04:43:54',0),(206,'39f23441-9945-474f-a1e3-d7e6c669747f','2019-01-09 04:37:03','2019-01-09 04:43:53',0,29000,50000,21000,3,2,25,2,'2019-01-09 04:37:03','2019-01-09 04:43:53',0),(207,'22e24677-7b5a-4bd4-aebd-e863ae4021b9','2019-01-09 05:02:59','2019-01-09 05:12:27',0,18000,18000,0,3,2,25,1,'2019-01-09 05:02:59','2019-01-09 05:12:28',0),(208,'1da7523a-5d0c-4d12-ab9d-e9dfc42df4c3','2019-01-09 05:05:38','2019-01-09 05:06:56',0,26000,26000,0,5,4,25,2,'2019-01-09 05:05:38','2019-01-09 05:06:54',0),(209,'719becc4-3595-4305-81dc-fd06742ff277','2019-01-09 05:07:26','2019-01-09 05:09:17',0,26000,100000,74000,4,2,25,2,'2019-01-09 05:07:26','2019-01-09 05:09:14',0),(210,'b86d1105-bff4-424e-8abb-c105e12bc99d','2019-01-09 05:51:44','2019-01-09 06:00:55',0,18000,18000,0,4,2,25,1,'2019-01-09 05:51:44','2019-01-09 06:00:53',0),(211,'cbce166f-d670-4d7a-9179-398c6a89e970','2019-01-09 05:52:17','2019-01-09 06:12:14',0,16000,16000,0,3,2,25,2,'2019-01-09 05:52:17','2019-01-09 06:12:12',0),(212,'02baa9f3-021a-4f17-9463-918eae1c1ef8','2019-01-09 06:24:50','2019-01-09 06:37:57',0,65000,70000,5000,5,2,25,2,'2019-01-09 06:24:50','2019-01-09 06:37:54',0),(213,'d9257686-9984-4060-b811-72bad71f5823','2019-01-09 06:29:59','2019-01-09 06:36:26',0,12000,12000,0,4,2,25,2,'2019-01-09 06:29:59','2019-01-09 06:36:23',0),(214,'b1fb5ebb-384c-4541-8c6b-94c64f42d929','2019-01-09 11:12:20','2019-01-09 11:13:54',0,18000,20000,2000,1,4,28,2,'2019-01-09 11:12:20','2019-01-09 11:13:52',0),(215,'8a230761-4cf6-4d81-aa77-3d9b2a53cabb','2019-01-09 11:12:45','2019-01-09 11:13:16',0,18000,20000,2000,4,4,28,2,'2019-01-09 11:12:45','2019-01-09 11:13:13',0),(216,'5c800ba4-8c08-48ec-9ab0-a6b8c9f4e286','2019-01-09 11:14:15','2019-01-09 11:22:25',0,18000,20000,2000,1,2,28,2,'2019-01-09 11:14:15','2019-01-09 11:22:22',0),(217,'a1d14a7a-9978-4af2-82d7-a44dff25438b','2019-01-09 12:01:26','2019-01-09 12:09:14',0,12000,20000,8000,1,2,28,2,'2019-01-09 12:01:26','2019-01-09 12:09:12',0),(218,'c1027988-1f31-4df4-9ac9-a577ef640aed','2019-01-09 12:06:09','2019-01-09 12:06:45',0,3000,4000,1000,19,2,28,2,'2019-01-09 12:06:09','2019-01-09 12:06:42',0),(219,'b112c82b-9170-4a71-b8b2-f7cdf1efd0f8','2019-01-09 12:16:06','2019-01-09 12:26:40',0,10000,10000,0,1,4,28,2,'2019-01-09 12:16:06','2019-01-09 12:26:37',0),(220,'1c3307bf-e071-40dc-8c0a-363980bce2b3','2019-01-09 12:26:30','2019-01-09 12:26:41',0,3000,3000,0,19,4,28,1,'2019-01-09 12:26:30','2019-01-09 12:26:38',0),(221,'7e6acfc6-83ee-469a-9328-479fa91662f0','2019-01-09 13:27:33','2019-01-09 13:27:56',0,13000,13000,0,1,2,18,1,'2019-01-09 13:27:33','2019-01-09 13:27:53',0),(222,'def93d11-bec8-4a4d-8ebb-dc9b2395a11e','2019-01-10 03:12:46','2019-01-10 03:13:06',0,13000,13000,0,3,4,25,1,'2019-01-10 03:12:46','2019-01-10 03:13:05',0),(223,'e2c5dc3a-5b98-481d-9fd8-fb31921efe89','2019-01-10 03:44:09','2019-01-10 03:49:49',0,13000,15000,2000,1,2,25,1,'2019-01-10 03:44:09','2019-01-10 03:49:48',0),(224,'052df02e-3b3e-415c-8864-0112375f31c6','2019-01-10 04:43:05','2019-01-10 05:01:36',0,38000,38000,0,1,2,25,2,'2019-01-10 04:43:05','2019-01-10 05:01:35',0),(225,'8f394972-57b3-4232-9b52-d36ba56dffb8','2019-01-10 04:57:07','2019-01-10 05:09:31',0,18000,18000,0,3,2,25,2,'2019-01-10 04:57:07','2019-01-10 05:09:30',0),(226,'7dd80cc6-077a-4a3f-9c65-315253d06ea7','2019-01-10 05:13:32','2019-01-10 05:45:44',0,52000,52000,0,3,2,25,2,'2019-01-10 05:13:32','2019-01-10 05:45:43',0),(227,'d3a920f5-3579-4aec-ad7e-dfc918d98dea','2019-01-10 05:15:04','2019-01-10 05:31:31',0,32000,32000,0,4,2,25,2,'2019-01-10 05:15:04','2019-01-10 05:31:30',0),(228,'1e70e5a6-e847-4876-9467-0e47e19505d8','2019-01-10 05:16:15','2019-01-10 05:32:32',0,16000,100000,84000,5,2,25,1,'2019-01-10 05:16:15','2019-01-10 05:32:32',0),(229,'49684e24-8821-4645-8fe0-379d8f945af4','2019-01-10 05:30:38','2019-01-10 05:45:15',0,27000,40000,13000,6,2,25,2,'2019-01-10 05:30:38','2019-01-10 05:45:14',0),(230,'55333a06-4985-450d-95d4-780967679962','2019-01-10 05:33:31','2019-01-10 05:44:13',0,20000,20000,0,7,2,25,2,'2019-01-10 05:33:31','2019-01-10 05:44:12',0),(231,'029681e9-3bad-42ac-9bdd-fd6e92c673e3','2019-01-10 05:34:14','2019-01-10 05:34:40',0,12000,12000,0,5,2,25,2,'2019-01-10 05:34:14','2019-01-10 05:34:38',0),(232,'b1eeb15c-677a-4edc-b3f0-b5ff62f03c97','2019-01-10 05:38:12','2019-01-10 06:21:23',0,68000,100000,32000,9,2,25,1,'2019-01-10 05:38:12','2019-01-10 06:21:22',0),(233,'79bec968-4184-4559-968c-73933a4abb81','2019-01-10 05:40:44','2019-01-10 05:59:42',0,17000,17000,0,8,2,25,1,'2019-01-10 05:40:44','2019-01-10 05:59:41',0),(234,'a54fc4f2-28d1-431d-bbf8-5c66679d29fe','2019-01-10 06:01:13','2019-01-10 06:01:20',0,3000,3000,0,1,4,25,1,'2019-01-10 06:01:13','2019-01-10 06:01:18',0),(235,'1780c525-8c1d-49e3-a4cc-a42c0c02602e','2019-01-10 06:13:38','2019-01-10 06:33:40',0,95000,95000,0,5,2,25,2,'2019-01-10 06:13:38','2019-01-10 06:33:39',0),(236,'354902c7-6866-4996-ab3b-03b31ab0143d','2019-01-10 06:26:44','2019-01-10 06:26:54',0,26000,26000,0,9,2,25,2,'2019-01-10 06:26:44','2019-01-10 06:26:53',0),(237,'a49d3589-f5d4-4afc-ad12-017ca2901a87','2019-01-10 06:34:18','2019-01-10 06:46:31',0,18000,18000,0,9,2,25,2,'2019-01-10 06:34:18','2019-01-10 06:46:29',0),(238,'b751900e-c5ba-4445-a024-7a8b40f1a29d','2019-01-10 06:47:16','2019-01-10 06:47:56',0,3000,3000,0,6,2,25,2,'2019-01-10 06:47:16','2019-01-10 06:47:54',0),(239,'b62e4099-a52c-4c03-b5a8-b19e4344325e','2019-01-10 07:52:08','2019-01-10 08:16:20',0,82000,100000,18000,1,2,28,2,'2019-01-10 07:52:08','2019-01-10 08:16:18',0),(240,'ecdc3a80-48c1-47bd-8c85-726e6f8e03bd','2019-01-10 08:15:55','2019-01-10 08:28:47',0,44000,50000,6000,3,2,28,2,'2019-01-10 08:15:55','2019-01-10 08:28:45',0),(241,'af084671-6857-4d9c-a3cf-a4929f76c04f','2019-01-10 08:22:03','2019-01-10 08:24:48',0,3000,3000,0,1,2,28,2,'2019-01-10 08:22:03','2019-01-10 08:24:47',0),(242,'37729acd-0f9a-487a-9df8-6faf1b5b849f','2019-01-10 09:29:54','2019-01-10 10:01:23',0,56000,100000,44000,1,2,28,2,'2019-01-10 09:29:54','2019-01-10 10:01:21',0),(243,'77a7453f-092d-4af2-819d-a6e26e6a31bd','2019-01-10 09:53:58','2019-01-10 10:06:59',0,28000,50000,22000,3,2,28,2,'2019-01-10 09:53:58','2019-01-10 10:06:57',0),(244,'f66cee1e-6e9f-4cd2-86bb-a6b3810ff3e6','2019-01-10 09:55:36','2019-01-10 10:01:17',0,26000,26000,0,4,2,28,2,'2019-01-10 09:55:36','2019-01-10 10:01:15',0),(245,'fa8330b6-9710-46ef-b19e-f372d4735f1f','2019-01-10 11:29:52','2019-01-10 11:40:58',0,16000,20000,4000,1,2,28,1,'2019-01-10 11:29:52','2019-01-10 11:40:56',0),(246,'480e61ec-1748-4570-8500-52a8f1ea6e51','2019-01-10 11:39:34','2019-01-10 11:51:23',0,27000,50000,23000,3,2,28,1,'2019-01-10 11:39:34','2019-01-10 11:51:21',0),(247,'3b839e29-f4f8-4334-926b-85aa7909971a','2019-01-10 12:04:57','2019-01-10 12:23:10',0,20000,50000,30000,1,2,28,1,'2019-01-10 12:04:57','2019-01-10 12:23:08',0),(248,'ef89d50c-ccef-40d7-a450-87438a98161d','2019-01-11 03:24:02','2019-01-11 03:30:08',0,13000,20000,7000,1,2,25,1,'2019-01-11 03:24:02','2019-01-11 03:30:08',0),(249,'4322b6f0-9596-4841-9acc-e0a7effa1d6c','2019-01-11 03:57:47','2019-01-11 03:58:12',0,3000,3000,0,3,4,24,1,'2019-01-11 03:57:47','2019-01-11 03:58:11',0),(250,'c8078b1c-61dc-4a23-bf03-f410e6205a3d','2019-01-11 04:06:23','2019-01-11 04:17:06',0,9000,20000,11000,3,2,25,1,'2019-01-11 04:06:23','2019-01-11 04:17:05',0),(251,'dc7cf896-db43-46d2-bb89-cf477ad2ff4f','2019-01-11 04:28:07','2019-01-11 04:29:12',0,17000,17000,0,4,2,24,2,'2019-01-11 04:28:07','2019-01-11 04:29:11',0),(252,'71489b90-e8a5-4ba0-bd2a-9ee1b4dcc655','2019-01-11 04:50:24','2019-01-11 05:06:06',0,40000,50000,10000,3,2,24,2,'2019-01-11 04:50:24','2019-01-11 05:06:05',0),(253,'7b8446cc-d487-4b34-83c2-fd34bb746936','2019-01-11 04:57:50','2019-01-11 05:08:24',0,20000,20000,0,1,2,24,1,'2019-01-11 04:57:50','2019-01-11 05:08:23',0),(254,'f48dedf4-0133-4ae1-9307-8553f9d37fd9','2019-01-11 04:59:45','2019-01-11 05:17:38',0,21000,50000,29000,5,2,24,1,'2019-01-11 04:59:45','2019-01-11 05:17:37',0),(255,'dcab9087-9c96-46f9-bbf5-e07bbcc9ff15','2019-01-11 05:04:52','2019-01-11 05:13:49',0,21000,21000,0,7,2,24,1,'2019-01-11 05:04:52','2019-01-11 05:13:48',0),(256,'90b8468a-4625-405d-adfa-b36d5396486d','2019-01-11 05:12:14','2019-01-11 05:12:59',0,3000,3000,0,1,4,24,1,'2019-01-11 05:12:14','2019-01-11 05:12:58',0),(257,'ef3d768c-be31-49c0-9e93-3998821f6565','2019-01-11 05:24:27','2019-01-11 05:38:54',0,31000,50000,19000,5,2,24,2,'2019-01-11 05:24:27','2019-01-11 05:38:53',0),(258,'eafd6e8e-68f6-4905-bef3-df5144963f6b','2019-01-11 05:42:11','2019-01-11 05:45:39',0,13000,13000,0,7,2,24,2,'2019-01-11 05:42:11','2019-01-11 05:45:38',0),(259,'71c0fabc-750b-49a3-be7b-71f82c6eea8a','2019-01-11 05:50:18','2019-01-11 05:50:41',0,3000,3000,0,6,4,24,1,'2019-01-11 05:50:18','2019-01-11 05:50:40',0),(260,'20365c42-0086-482b-a6a1-6a94b5ba60b6','2019-01-11 06:02:46','2019-01-11 06:12:37',0,24000,30000,6000,5,2,24,2,'2019-01-11 06:02:46','2019-01-11 06:12:36',0),(261,'91739b02-4beb-4305-b9f8-3aab10ef5393','2019-01-11 06:22:11','2019-01-11 06:30:02',0,16000,20000,4000,5,2,25,1,'2019-01-11 06:22:11','2019-01-11 06:30:01',0),(262,'14877e65-5521-46cf-a060-a8fb13fd8d2b','2019-01-11 08:43:07','2019-01-11 09:02:39',0,34000,50000,16000,3,2,28,2,'2019-01-11 08:43:07','2019-01-11 09:02:38',0),(263,'a95fff15-909a-4e97-94dc-7f8272cfa27e','2019-01-12 02:08:16','2019-01-12 02:11:03',0,13000,20000,7000,1,2,31,1,'2019-01-12 02:08:16','2019-01-12 02:11:04',0),(264,'139bedce-a2c2-4675-a7a9-4f85d4be60d1','2019-01-12 02:09:59','2019-01-12 02:11:05',0,13000,13000,0,3,2,31,1,'2019-01-12 02:09:59','2019-01-12 02:11:06',0),(265,'67691c76-327e-40b2-9466-4628baee08f4','2019-01-12 03:03:51','2019-01-12 03:08:53',0,26000,26000,0,1,2,31,1,'2019-01-12 03:03:51','2019-01-12 03:08:54',0),(266,'4df710c0-6643-4219-a8d9-38be15831d11','2019-01-12 06:09:26','2019-01-12 06:41:01',0,151000,160000,9000,5,2,24,2,'2019-01-12 06:09:26','2019-01-12 06:41:02',0),(267,'8c4556c2-7055-4778-987c-470ff1bb109e','2019-01-12 06:34:27','2019-01-12 06:47:36',0,10000,10000,0,1,2,24,2,'2019-01-12 06:34:27','2019-01-12 06:47:36',0),(268,'fbe14e94-032b-47a4-bb03-83e0a7ca4baf','2019-01-12 06:49:57','2019-01-12 07:11:11',0,28000,28000,0,1,2,26,2,'2019-01-12 06:49:57','2019-01-12 07:11:11',0),(269,'291d2533-5a81-4e47-8718-dbf6781a02b5','2019-01-12 07:31:26','2019-01-12 07:52:20',0,43000,50000,7000,3,2,24,2,'2019-01-12 07:31:26','2019-01-12 07:52:20',0),(270,'578ad78f-688b-4282-9ef9-8ed918211660','2019-01-12 08:09:19','2019-01-12 08:24:53',0,18000,20000,2000,1,2,24,2,'2019-01-12 08:09:19','2019-01-12 08:24:53',0),(271,'60d654bc-a7e5-4bce-87ae-63e5a76c4637','2019-01-12 08:44:38','2019-01-12 08:45:32',0,3000,3000,0,1,4,18,2,'2019-01-12 08:44:38','2019-01-12 08:45:32',0),(272,'31826f2c-46ec-469c-a9d4-98e2fce2d363','2019-01-12 09:13:05','2019-01-12 09:13:19',0,51000,51000,0,1,2,26,2,'2019-01-12 09:13:05','2019-01-12 09:13:19',0),(273,'b7729cc2-e726-4358-8368-a0c197576859','2019-01-12 09:18:03','2019-01-12 09:28:51',0,16000,16000,0,3,2,26,2,'2019-01-12 09:18:03','2019-01-12 09:28:51',0),(274,'3489e5cc-23b3-46a4-8050-e0cb94cc41a8','2019-01-13 03:19:55','2019-01-13 03:44:10',0,48000,100000,52000,3,2,25,2,'2019-01-13 03:19:55','2019-01-13 03:44:11',0),(275,'f563a14c-5d8a-4fc5-b689-5809fe9bba0d','2019-01-13 04:28:12','2019-01-13 04:37:07',0,25000,100000,75000,3,2,25,1,'2019-01-13 04:28:12','2019-01-13 04:37:08',0),(276,'920088c5-79bc-4437-bc2b-26d4217f184f','2019-01-13 05:03:52','2019-01-13 05:31:56',0,89000,89000,0,3,2,25,1,'2019-01-13 05:03:52','2019-01-13 05:31:56',0),(277,'43a5ced6-d521-41d9-888b-97574a9b4c3a','2019-01-13 05:08:22','2019-01-13 05:14:02',0,13000,50000,37000,1,2,25,2,'2019-01-13 05:08:22','2019-01-13 05:14:03',0),(278,'2b8c3be9-3f38-40e9-ac05-f7e35e8ee452','2019-01-13 05:43:05','2019-01-13 05:45:43',0,10000,20000,10000,3,2,25,1,'2019-01-13 05:43:05','2019-01-13 05:45:43',0),(279,'bf7a10c4-5d39-473a-924b-12cb6ee7e579','2019-01-13 05:46:32','2019-01-13 05:46:58',0,13000,15000,2000,3,2,25,1,'2019-01-13 05:46:32','2019-01-13 05:46:59',0),(280,'d4c0e55e-9224-4473-b186-12f8f44f9fb3','2019-01-13 06:05:53','2019-01-13 06:21:29',0,16000,16000,0,1,2,25,1,'2019-01-13 06:05:53','2019-01-13 06:21:30',0),(281,'a3d29a8e-017b-4066-aafb-75bbcff033d4','2019-01-13 06:09:47','2019-01-13 06:22:40',0,18000,18000,0,3,2,25,1,'2019-01-13 06:09:47','2019-01-13 06:22:40',0),(282,'f1f34c26-8c7f-4719-bb66-120de2b9358c','2019-01-13 06:33:15','2019-01-13 06:49:46',0,76000,100000,24000,3,2,25,2,'2019-01-13 06:33:15','2019-01-13 06:49:47',0),(283,'09b7abdc-acbf-483f-8f3e-e65ae67532bd','2019-01-13 07:09:01','2019-01-13 07:26:23',0,10000,10000,0,3,2,25,1,'2019-01-13 07:09:01','2019-01-13 07:26:24',0),(284,'4de5f29d-3925-4691-bc23-98824a2836cc','2019-01-13 07:22:15','2019-01-13 07:33:11',0,35000,35000,0,1,2,25,2,'2019-01-13 07:22:15','2019-01-13 07:33:11',0),(285,'098cccc2-225a-4efa-aeb6-064f18e9c616','2019-01-13 07:36:01','2019-01-13 07:55:26',0,81000,90000,9000,3,2,25,2,'2019-01-13 07:36:01','2019-01-13 07:55:26',0),(286,'370c4a0c-f6b9-4111-af31-bb0d108d5376','2019-01-13 15:26:53','2019-01-13 15:54:23',0,30000,30000,0,1,2,28,2,'2019-01-13 15:26:53','2019-01-13 15:54:24',0),(287,'1520e2d1-dee0-4b2f-8a44-89e747e6cea4','2019-01-13 15:46:32','2019-01-13 16:11:06',0,48000,50000,2000,3,2,28,2,'2019-01-13 15:46:32','2019-01-13 16:11:07',0),(288,'3c3314d1-e978-45b0-869b-c6d7568d44ab','2019-01-13 15:48:03','2019-01-13 16:05:15',0,13000,20000,7000,4,2,28,2,'2019-01-13 15:48:03','2019-01-13 16:05:15',0),(289,'78628dbd-fc04-4bb3-ab4e-74e164a941e1','2019-01-13 16:47:54','2019-01-13 17:16:06',0,62000,70000,8000,1,2,28,2,'2019-01-13 16:47:54','2019-01-13 17:16:07',0),(290,'3a622a3e-3df1-400a-8079-eedee2d7a494','2019-01-13 22:47:17','2019-01-13 22:47:34',0,18000,18000,0,1,4,18,1,'2019-01-13 22:47:17','2019-01-13 22:47:34',0),(291,'aa5ab6ae-1c8e-4c79-b268-4f23f0b24446','2019-01-14 09:40:59','2019-01-14 10:03:58',0,38000,50000,12000,3,2,25,2,'2019-01-14 09:40:59','2019-01-14 10:04:00',1),(292,'f07603db-a22f-4242-9b68-ad04b49562be','2019-01-14 10:27:27','2019-01-14 10:36:26',0,9000,10000,1000,1,2,25,2,'2019-01-14 10:27:27','2019-01-14 10:36:27',1),(293,'8119c64c-cfcd-4c9f-9e07-972ebf052412','2019-01-14 11:18:37','2019-01-14 11:38:17',0,35000,50000,15000,3,2,25,1,'2019-01-14 11:18:37','2019-01-14 11:38:18',1),(294,'d7a01b67-ac1b-4343-bda8-58f423733548','2019-01-14 11:45:06','2019-01-14 12:01:39',0,36000,50000,14000,1,2,25,1,'2019-01-14 11:45:06','2019-01-14 12:01:40',1),(295,'42247d08-6037-40df-9700-c41935dec26b','2019-01-14 11:50:33','2019-01-14 12:07:28',0,73000,75000,2000,4,2,25,2,'2019-01-14 11:50:33','2019-01-14 12:07:30',1),(296,'c30438a6-f5f1-47f3-b1b0-1fc34996b0f2','2019-01-14 11:52:39','2019-01-14 12:02:40',0,17000,17000,0,5,2,25,2,'2019-01-14 11:52:39','2019-01-14 12:02:41',1),(297,'d5f4d5b9-cf57-404d-b01d-fffaacb72dda','2019-01-14 11:55:41','2019-01-14 11:56:22',0,3000,5000,2000,6,2,25,2,'2019-01-14 11:55:41','2019-01-14 11:56:23',1),(298,'b967735c-d793-4616-a86c-978ec38cd727','2019-01-14 12:09:34','2019-01-14 12:25:11',0,68000,70000,2000,5,2,25,1,'2019-01-14 12:09:34','2019-01-14 12:25:12',1),(299,'6b49ea81-b366-49c9-82fa-c030c44cb0a4','2019-01-14 12:11:08','2019-01-14 12:11:31',0,3000,3000,0,21,2,25,1,'2019-01-14 12:11:08','2019-01-14 12:11:32',1),(300,'9dc03757-d394-4ac2-b083-e6f3782947de','2019-01-14 12:16:14','2019-01-14 12:25:22',0,29000,50000,21000,8,2,25,1,'2019-01-14 12:16:14','2019-01-14 12:25:23',1),(301,'4c671c04-deaa-4550-bbba-bd0a0ca23825','2019-01-14 12:16:54','2019-01-14 12:39:52',0,29000,30000,1000,11,2,25,1,'2019-01-14 12:16:54','2019-01-14 12:39:53',1),(302,'8df672d0-ab7d-4297-b04e-cfc5434492fc','2019-01-14 12:19:50','2019-01-14 12:36:19',0,36000,36000,0,13,2,25,1,'2019-01-14 12:19:50','2019-01-14 12:36:20',1),(303,'9499acc9-42df-4143-a0ea-835d37dceaf3','2019-01-14 12:24:46','2019-01-14 12:35:27',0,17000,26000,9000,3,2,25,2,'2019-01-14 12:24:46','2019-01-14 12:35:28',1),(304,'65395629-0889-4f50-9797-d722daebb60d','2019-01-14 12:27:06','2019-01-14 12:40:40',0,44000,44000,0,15,2,25,2,'2019-01-14 12:27:06','2019-01-14 12:40:41',1),(305,'5976ed38-781e-4328-b002-c71b9ba4a018','2019-01-14 12:34:45','2019-01-14 12:54:38',0,48000,50000,2000,9,2,25,1,'2019-01-14 12:34:45','2019-01-14 12:54:39',1),(306,'017546a5-1a5a-4582-a426-3cfe46450fa0','2019-01-14 12:46:58','2019-01-14 12:59:44',0,55000,55000,0,4,2,25,1,'2019-01-14 12:46:58','2019-01-14 12:59:45',1),(307,'d88a7073-6825-4982-ac8b-d2416abce52f','2019-01-14 12:58:04','2019-01-14 13:02:08',0,13000,13000,0,9,2,25,1,'2019-01-14 12:58:04','2019-01-14 13:02:09',1),(308,'10943496-b259-46ec-9596-9e4675afb753','2019-01-14 13:14:11','2019-01-14 13:26:05',0,34000,34000,0,6,2,25,2,'2019-01-14 13:14:11','2019-01-14 13:26:06',1),(309,'a2e335a4-4d64-4a46-849a-7662a0ad321b','2019-01-14 13:24:45','2019-01-14 13:40:26',0,30000,30000,0,9,2,25,2,'2019-01-14 13:24:45','2019-01-14 13:40:27',1),(310,'15b8fc7c-21fd-4d18-ad18-8883a02d90d0','2019-01-14 13:48:27','2019-01-14 14:54:11',0,23000,23000,0,6,2,25,1,'2019-01-14 13:48:27','2019-01-14 14:54:12',1),(311,'79fc229f-569f-415d-8b14-ff9177a6f365','2019-01-14 14:24:49','2019-01-14 14:54:14',0,24000,25000,1000,1,2,28,2,'2019-01-14 14:24:49','2019-01-14 14:54:15',1),(312,'bd862166-7623-4068-a865-ef64fc69a307','2019-01-14 15:47:50','2019-01-14 16:01:15',0,36000,36000,0,1,2,28,2,'2019-01-14 15:47:50','2019-01-14 16:01:16',1),(313,'c4a38054-9b9a-423c-aacb-d14ac1974c37','2019-01-14 15:56:44','2019-01-14 16:07:33',0,37000,50000,13000,3,2,28,2,'2019-01-14 15:56:44','2019-01-14 16:07:34',1),(314,'d53deff4-ac67-4cc3-b549-2f0cab0217a6','2019-01-14 16:22:57','2019-01-14 16:43:19',0,54000,60000,6000,1,2,28,2,'2019-01-14 16:22:57','2019-01-14 16:43:20',1),(315,'a8cb0457-7325-4c63-bd74-44951ab3954c','2019-01-14 16:23:27','2019-01-14 16:34:32',0,9000,10000,1000,3,2,28,2,'2019-01-14 16:23:27','2019-01-14 16:34:33',1),(316,'c0baa708-42ec-4cb7-878f-72d23bdf035e','2019-01-14 18:45:53','2019-01-14 19:02:56',0,16000,20000,4000,1,2,28,1,'2019-01-14 18:45:53','2019-01-14 19:02:56',1),(317,'7b8ed7a7-eb16-401d-96a9-74729152355e','2019-01-14 18:48:07','2019-01-14 19:02:57',0,21000,50000,29000,3,2,28,1,'2019-01-14 18:48:07','2019-01-14 19:02:57',1),(318,'6982b2c3-c168-46ea-b687-0cefff2e6671','2019-01-14 18:49:17','2019-01-14 19:02:58',0,18000,20000,2000,4,2,28,1,'2019-01-14 18:49:17','2019-01-14 19:02:59',1),(319,'3567b91d-2cc7-4d48-8488-c5121c095374','2019-01-14 18:50:57','2019-01-14 19:13:52',0,18000,20000,2000,5,2,28,2,'2019-01-14 18:50:57','2019-01-14 19:13:52',1),(320,'50606f8a-3258-4edb-ab56-816adf71a141','2019-01-14 18:52:54','2019-01-14 19:17:24',0,60000,60000,0,6,2,28,1,'2019-01-14 18:52:54','2019-01-14 19:17:24',1),(321,'60e70501-ee4e-48d3-9170-6fc5804b5a8d','2019-01-14 18:54:21','2019-01-14 19:26:59',0,32000,32000,0,7,2,28,2,'2019-01-14 18:54:21','2019-01-14 19:26:59',1),(322,'937ca131-0cf0-40c8-b334-f5b4aab362e9','2019-01-14 18:55:44','2019-01-14 19:18:12',0,18000,18000,0,8,2,28,2,'2019-01-14 18:55:44','2019-01-14 19:18:12',1),(323,'27dc5147-5063-458a-8592-c28b81dcca16','2019-01-14 18:56:45','2019-01-14 19:28:08',0,31000,31000,0,9,2,28,2,'2019-01-14 18:56:45','2019-01-14 19:28:08',1),(324,'85163b2f-7de5-4623-848e-78255b1bc6b5','2019-01-14 18:57:38','2019-01-14 19:30:36',0,16000,16000,0,10,2,28,2,'2019-01-14 18:57:38','2019-01-14 19:30:36',1),(325,'aeca7303-5a0e-48f5-8f17-4b6ea4b8af32','2019-01-14 19:00:14','2019-01-14 19:36:46',0,41000,41000,0,11,2,28,2,'2019-01-14 19:00:14','2019-01-14 19:36:46',1),(326,'02ce81c8-5af6-4970-8747-94ad406a8e1d','2019-01-14 19:01:23','2019-01-14 19:46:01',0,31000,31000,0,12,2,28,2,'2019-01-14 19:01:23','2019-01-14 19:46:01',1),(327,'ee71f70d-558f-4d37-9aeb-b3035594b920','2019-01-14 19:02:30','2019-01-14 19:45:59',0,16000,16000,0,13,2,28,2,'2019-01-14 19:02:30','2019-01-14 19:45:59',1),(328,'5cda177a-9850-4dd4-a324-19434621e39b','2019-01-14 19:03:39','2019-01-14 19:50:41',0,29000,29000,0,14,2,28,1,'2019-01-14 19:03:39','2019-01-14 19:50:41',1),(329,'fd5d0f6d-456a-4496-89cb-0e9a706f906b','2019-01-14 19:04:40','2019-01-14 19:52:49',0,29000,29000,0,15,2,28,2,'2019-01-14 19:04:40','2019-01-14 19:52:49',1),(330,'4da9bb8a-25b6-40c1-81e1-06a33835a56d','2019-01-14 19:05:31','2019-01-14 19:56:18',0,16000,16000,0,16,2,28,2,'2019-01-14 19:05:31','2019-01-14 19:56:18',1),(331,'f067aa08-5f87-4eb3-bb39-92809f8fa2b4','2019-01-14 19:08:04','2019-01-14 19:43:49',0,68000,68000,0,17,2,28,2,'2019-01-14 19:08:04','2019-01-14 19:43:49',1),(332,'5844dbe3-c44f-41b1-a968-4975e61c74d0','2019-01-14 19:12:20','2019-01-14 20:00:40',0,10000,10000,0,18,2,28,1,'2019-01-14 19:12:20','2019-01-14 20:00:41',1),(333,'cfb743d5-5234-4a1e-9ab4-376bc7a986d0','2019-01-14 19:14:54','2019-01-14 19:33:17',0,32000,42000,10000,19,2,28,1,'2019-01-14 19:14:54','2019-01-14 19:33:17',1),(334,'d4162216-c63d-4dc2-900d-6e9b1ca18f6f','2019-01-14 19:31:13','2019-01-14 19:33:16',0,3000,3000,0,1,2,28,2,'2019-01-14 19:31:13','2019-01-14 19:33:16',1),(335,'4225ae32-0b16-470e-9f60-50230a421bf7','2019-01-14 19:31:41','2019-01-14 19:33:09',0,3000,4000,1000,3,2,28,1,'2019-01-14 19:31:41','2019-01-14 19:33:10',1),(336,'98570c7c-29c3-4a66-9200-b978a2d0e9e0','2019-01-14 19:35:45','2019-01-14 19:37:35',0,10000,20000,10000,19,2,28,2,'2019-01-14 19:35:45','2019-01-14 19:37:35',1),(337,'ac56207c-c0c8-45cc-bc8f-ed40152f0f3c','2019-01-14 19:47:39','2019-01-14 19:48:49',0,6000,6000,0,1,2,28,2,'2019-01-14 19:47:39','2019-01-14 19:48:49',1),(338,'c59d7697-115f-488c-b2c5-666282607e4e','2019-01-14 20:02:34','2019-01-14 20:16:34',0,32000,35000,3000,1,2,28,2,'2019-01-14 20:02:34','2019-01-14 20:16:35',1),(339,'2ec2f88b-b248-4f16-a362-002cfbc2a5d8','2019-01-14 20:27:43','2019-01-14 20:34:22',0,12000,15000,3000,1,2,28,2,'2019-01-14 20:27:43','2019-01-14 20:34:22',1),(340,'b7736c84-c153-4b66-9dd1-b6ce9647755b','2019-01-14 20:44:54','2019-01-14 20:50:27',0,17000,17000,0,1,2,28,1,'2019-01-14 20:44:54','2019-01-14 20:50:27',1),(341,'3f7a91a5-bbd8-4ca1-a083-fe87d75c4858','2019-01-14 21:47:17','2019-01-14 21:47:32',0,20000,20000,0,1,2,18,1,'2019-01-14 21:47:17','2019-01-14 21:47:32',0),(342,'237f54e3-8bab-401e-b1fa-b1796c45a6da','2019-01-15 10:28:56','2019-01-15 10:39:38',0,17000,17000,0,3,2,25,2,'2019-01-15 10:28:56','2019-01-15 10:39:38',1),(343,'bfd459c2-3465-4198-8340-66a2f6165cb5','2019-01-15 10:37:34','2019-01-15 10:42:22',0,13000,20000,7000,5,2,25,1,'2019-01-15 10:37:34','2019-01-15 10:42:22',1),(344,'c3a10f97-5c41-4cd8-86b1-a5dd7932e134','2019-01-15 10:58:31','2019-01-15 10:58:47',0,31000,50000,19000,5,4,25,2,'2019-01-15 10:58:31','2019-01-15 10:58:47',1),(345,'eb5dbd69-bc71-48f0-9c44-0c2b76398cf4','2019-01-15 10:59:21','2019-01-15 11:18:29',0,47000,50000,3000,5,2,25,2,'2019-01-15 10:59:21','2019-01-15 11:18:29',1),(346,'a1403ac7-a1d4-4e9c-8b19-296a9e8a531c','2019-01-15 11:21:11','2019-01-15 11:31:42',0,38000,50000,12000,5,2,25,1,'2019-01-15 11:21:10','2019-01-15 11:31:42',1),(347,'88858201-01cd-4cbd-90f2-051589a42b49','2019-01-15 11:33:55','2019-01-15 11:44:11',0,6000,7000,1000,5,4,25,1,'2019-01-15 11:33:55','2019-01-15 11:44:11',1),(348,'0cd3860f-08fb-4266-846f-af35fb908205','2019-01-15 11:36:09','2019-01-15 11:54:01',0,17000,50000,33000,3,2,25,2,'2019-01-15 11:36:09','2019-01-15 11:54:01',1),(349,'e99c54b8-b5ca-4dc5-9a71-4af3aecf6dfe','2019-01-15 11:42:43','2019-01-15 11:49:20',0,19000,19000,0,7,2,25,1,'2019-01-15 11:42:43','2019-01-15 11:49:20',1),(350,'ca973b5e-b823-4342-ac62-26a41c58f090','2019-01-15 11:44:38','2019-01-15 11:49:43',0,6000,6000,0,5,2,25,1,'2019-01-15 11:44:38','2019-01-15 11:49:43',1),(351,'84adcb06-7476-400f-8c7e-39e3cc823cf2','2019-01-15 11:48:24','2019-01-15 12:00:05',0,32000,52000,20000,1,2,25,2,'2019-01-15 11:48:24','2019-01-15 12:00:05',1),(352,'29653ce9-c264-4744-ab5c-6a75939128fc','2019-01-15 11:59:23','2019-01-15 11:59:42',0,3000,3000,0,5,2,25,1,'2019-01-15 11:59:23','2019-01-15 11:59:42',1),(353,'724323ec-b791-4518-a64c-59ca9382d108','2019-01-15 12:03:07','2019-01-15 12:16:53',0,78000,100000,22000,1,2,25,2,'2019-01-15 12:03:07','2019-01-15 12:16:53',1),(354,'1aa85b1f-fb84-43e8-9e21-ad710b0539bc','2019-01-15 12:04:52','2019-01-15 12:20:29',0,37000,50000,13000,5,2,25,2,'2019-01-15 12:04:52','2019-01-15 12:20:29',1),(355,'76a935fe-bd0d-4950-968f-62181fc606d4','2019-01-15 12:05:48','2019-01-15 12:25:45',0,60000,100000,40000,7,2,25,2,'2019-01-15 12:05:48','2019-01-15 12:25:45',1),(356,'2aece244-327a-4918-9f68-3cf1768d7a66','2019-01-15 12:07:33','2019-01-15 12:11:33',0,10000,10000,0,3,2,25,2,'2019-01-15 12:07:33','2019-01-15 12:11:33',1),(357,'a7507c2d-478b-4791-a266-f7d9ed10db4b','2019-01-15 12:19:09','2019-01-15 12:23:00',0,13000,15000,2000,1,2,25,1,'2019-01-15 12:19:09','2019-01-15 12:22:59',1),(358,'53472dd9-71d4-421b-a2df-fa9f39b591fc','2019-01-15 12:30:11','2019-01-15 12:38:47',0,38000,50000,12000,7,2,25,1,'2019-01-15 12:30:11','2019-01-15 12:38:47',1),(359,'11b4124f-c20b-489c-bdcc-8e5cb9be69f2','2019-01-15 12:31:28','2019-01-15 12:42:32',0,38000,40000,2000,5,2,25,1,'2019-01-15 12:31:28','2019-01-15 12:42:31',1),(360,'8fcc287b-e549-4a60-ae86-bfbbaec3d376','2019-01-15 12:34:08','2019-01-15 12:57:20',0,112000,115000,3000,1,2,25,2,'2019-01-15 12:34:08','2019-01-15 12:57:20',1),(361,'1d6e3279-5b16-4bb1-84dc-931a394e85a4','2019-01-15 12:50:10','2019-01-15 12:57:21',0,23000,100000,77000,5,2,25,2,'2019-01-15 12:50:10','2019-01-15 12:57:21',1),(362,'28959aad-200c-4550-9fd8-537ff66e857d','2019-01-15 13:35:08','2019-01-15 13:43:57',0,12000,15000,3000,7,2,25,2,'2019-01-15 13:35:08','2019-01-15 13:43:57',1),(363,'d044ea4f-57d1-4a39-83df-0037f74db072','2019-01-15 15:14:21','2019-01-15 15:24:56',0,19000,20000,1000,1,2,28,2,'2019-01-15 15:14:21','2019-01-15 15:24:56',1),(364,'1ebc46ec-95e8-47be-9a7f-3962a217a024','2019-01-15 15:26:18','2019-01-15 15:30:41',0,3000,3000,0,1,2,28,2,'2019-01-15 15:26:18','2019-01-15 15:30:41',1),(365,'d88afb16-24ca-4bbf-85e6-5ebc64c64c27','2019-01-15 15:28:48','2019-01-15 15:33:26',0,13000,13000,0,3,2,28,2,'2019-01-15 15:28:48','2019-01-15 15:33:25',1),(366,'e301748f-2b92-4b5c-b213-2460d2c09523','2019-01-15 15:30:00','2019-01-15 15:30:24',0,13000,13000,0,5,4,28,1,'2019-01-15 15:30:00','2019-01-15 15:30:24',1),(367,'ee7945a2-d7e1-481d-bc93-342625f5f867','2019-01-15 15:41:28','2019-01-15 15:53:54',0,34000,40000,6000,1,2,28,2,'2019-01-15 15:41:28','2019-01-15 15:53:53',1),(368,'b1ee0cd0-656b-4cf0-a323-33c84cb177b9','2019-01-15 16:53:51','2019-01-15 17:18:46',0,97000,100000,3000,1,2,28,2,'2019-01-15 16:53:51','2019-01-15 17:18:45',1),(369,'22102688-cfc0-49fd-859c-8add96203866','2019-01-15 16:59:27','2019-01-15 17:15:46',0,42000,50000,8000,3,2,28,2,'2019-01-15 16:59:27','2019-01-15 17:15:45',1),(370,'70b14180-101f-4020-822b-bb399aed73de','2019-01-15 17:07:11','2019-01-15 17:12:04',0,2000,2000,0,4,2,28,2,'2019-01-15 17:07:11','2019-01-15 17:12:03',1),(371,'6b0d366a-a288-4b14-a33a-9c6b7b8c1b77','2019-01-15 18:17:32','2019-01-15 18:48:35',0,104000,130000,26000,1,2,28,2,'2019-01-15 18:17:32','2019-01-15 18:48:35',1),(372,'f86826de-d7f7-4a89-9a8e-66c675c20fd5','2019-01-15 19:25:44','2019-01-15 19:44:08',0,20000,100000,80000,1,2,28,2,'2019-01-15 19:25:44','2019-01-15 19:44:07',1),(373,'d4f82e48-0c50-4ab0-8433-b0f1c023c9ad','2019-01-16 08:54:23','2019-01-16 08:56:22',0,18000,18000,0,3,2,25,2,'2019-01-16 08:54:23','2019-01-16 08:56:20',1),(374,'7cff3bc1-228f-4dee-acf6-97d9fa9fa279','2019-01-16 09:55:31','2019-01-16 10:08:59',0,26000,26000,0,3,2,25,2,'2019-01-16 09:55:31','2019-01-16 10:08:57',1),(375,'5c69e127-d1fa-4b98-b05f-ed2ebcd35f47','2019-01-16 09:57:19','2019-01-16 10:09:36',0,26000,30000,4000,5,2,25,2,'2019-01-16 09:57:19','2019-01-16 10:09:33',1),(376,'881f6614-c75c-40b4-952e-2695f99be45f','2019-01-16 10:28:14','2019-01-16 10:45:00',0,38000,50000,12000,5,2,25,2,'2019-01-16 10:28:14','2019-01-16 10:44:58',1),(377,'d76c1e98-dc7c-4809-9e10-ad2138093107','2019-01-16 10:38:28','2019-01-16 10:49:01',0,17000,17000,0,3,2,25,1,'2019-01-16 10:38:28','2019-01-16 10:48:59',1),(378,'01bc489e-39ae-45dd-ae7d-cc31f932dd8e','2019-01-16 11:02:27','2019-01-16 11:21:51',0,34000,50000,16000,3,2,25,2,'2019-01-16 11:02:27','2019-01-16 11:21:48',1),(379,'4bf12784-4750-49a3-b53c-49bd1d2f32eb','2019-01-16 11:11:30','2019-01-16 11:33:08',0,16000,16000,0,5,2,25,1,'2019-01-16 11:11:30','2019-01-16 11:33:05',1),(380,'9a53fe42-6edd-4e73-833c-2d5e37e5e3ca','2019-01-16 11:14:49','2019-01-16 11:43:39',0,56000,56000,0,1,2,25,2,'2019-01-16 11:14:49','2019-01-16 11:43:36',1),(381,'d6c45500-4cf3-40a6-b583-920c5a3fa6f7','2019-01-16 11:21:13','2019-01-16 11:21:37',0,3000,5000,2000,7,2,25,2,'2019-01-16 11:21:13','2019-01-16 11:21:34',1),(382,'5db77e0f-ea81-40e0-a8a4-bfc14e83ce43','2019-01-16 11:51:35','2019-01-16 12:03:36',0,20000,50000,30000,7,2,25,1,'2019-01-16 11:51:35','2019-01-16 12:03:34',1),(383,'375d3cc2-8aa9-42ec-9e25-3ba28b5b99d1','2019-01-16 11:54:24','2019-01-16 12:17:07',0,91000,100000,9000,4,2,25,2,'2019-01-16 11:54:24','2019-01-16 12:17:04',1),(384,'120b2b9c-0da2-4489-afed-0e3c194b2d68','2019-01-16 11:55:13','2019-01-16 12:01:13',0,13000,14000,1000,3,2,25,2,'2019-01-16 11:55:13','2019-01-16 12:01:10',1),(385,'951c5f93-691a-4e33-9323-496e9a358afd','2019-01-16 12:08:48','2019-01-16 12:30:20',0,35000,35000,0,7,2,25,1,'2019-01-16 12:08:48','2019-01-16 12:30:18',1),(386,'3e273ac8-d281-4187-8025-cb98976ceba9','2019-01-16 12:14:53','2019-01-16 12:42:47',0,114000,114000,0,1,2,25,1,'2019-01-16 12:14:53','2019-01-16 12:42:44',1),(387,'84472265-3f1f-4bca-8718-66785cdbd53d','2019-01-16 12:15:31','2019-01-16 12:15:58',0,6000,6000,0,5,2,25,2,'2019-01-16 12:15:31','2019-01-16 12:15:55',1),(388,'1d35baed-3d4e-447a-82ce-7d60628a6c06','2019-01-16 12:20:56','2019-01-16 12:54:02',0,84000,85000,1000,5,2,25,2,'2019-01-16 12:20:56','2019-01-16 12:53:59',1),(389,'9d25dde0-058d-4336-afa1-b27176aa7276','2019-01-16 12:32:36','2019-01-16 12:59:09',0,16000,50000,34000,3,2,25,1,'2019-01-16 12:32:36','2019-01-16 12:59:06',1),(390,'7f18659d-77f0-4bca-8be0-7f9f6d6d8688','2019-01-16 12:53:25','2019-01-16 13:11:21',0,82000,100000,18000,1,2,25,2,'2019-01-16 12:53:25','2019-01-16 13:11:19',1),(391,'bb457e23-bf73-4b19-96c6-3ef159fa2546','2019-01-16 12:57:49','2019-01-16 13:11:00',0,45000,50000,5000,7,2,25,2,'2019-01-16 12:57:49','2019-01-16 13:10:57',1),(392,'065d87a4-6a98-4002-b9bc-b692e870ac2e','2019-01-16 13:10:04','2019-01-16 13:16:33',0,17000,100000,83000,3,2,25,2,'2019-01-16 13:10:04','2019-01-16 13:16:30',1),(393,'a5b44f79-ef5a-432b-841f-3ea68d013e8b','2019-01-16 13:13:04','2019-01-16 13:25:01',0,16000,16000,0,1,2,25,1,'2019-01-16 13:13:04','2019-01-16 13:24:59',1),(394,'aaf4c547-529b-4560-9596-1d07a4b3df4a','2019-01-16 13:15:19','2019-01-16 13:21:14',0,16000,16000,0,5,2,25,2,'2019-01-16 13:15:19','2019-01-16 13:21:11',1),(395,'3e6377b7-9baa-4442-b18b-f8b2a156f128','2019-01-16 13:26:27','2019-01-16 13:42:12',0,10000,10000,0,5,2,25,2,'2019-01-16 13:26:27','2019-01-16 13:42:09',1),(396,'0878adac-26a1-42a4-8cce-59a950b2b92a','2019-01-16 14:12:46','2019-01-16 14:19:56',0,13000,50000,37000,1,2,28,2,'2019-01-16 14:12:46','2019-01-16 14:19:53',0),(397,'030883ee-a975-4097-a188-08a4758566de','2019-01-16 14:15:26','2019-01-16 14:34:03',0,35000,50000,15000,3,2,28,1,'2019-01-16 14:15:26','2019-01-16 14:34:01',0),(398,'be17bd31-7aff-447c-9aa8-798844adbbe0','2019-01-16 14:29:22','2019-01-16 14:33:16',0,13000,14000,1000,1,2,28,1,'2019-01-16 14:29:22','2019-01-16 14:33:13',0),(399,'7c169c83-268e-42f2-8350-9be5e5767541','2019-01-16 14:55:16','2019-01-16 15:07:43',0,23000,23000,0,1,2,28,1,'2019-01-16 14:55:16','2019-01-16 15:07:40',0),(400,'275937b2-2ca5-4c96-8227-c74d19b33fed','2019-01-16 15:02:35','2019-01-16 15:14:50',0,34000,34000,0,21,2,18,1,'2019-01-16 15:02:35','2019-01-16 15:14:47',0),(401,'26bb5c86-0f0b-4a25-bb91-1f8546a0b7c1','2019-01-16 15:18:46','2019-01-16 15:28:42',0,17000,50000,33000,6,2,28,2,'2019-01-16 15:18:46','2019-01-16 15:28:39',0),(402,'b5ad6269-c44c-4abf-a6d9-472144cdbab2','2019-01-16 15:20:08','2019-01-16 15:34:19',0,25000,50000,25000,1,2,28,1,'2019-01-16 15:20:08','2019-01-16 15:34:16',0),(403,'b8da79b4-0015-4130-abc5-8e9e580faee3','2019-01-16 15:32:32','2019-01-16 15:46:22',0,28000,28000,0,3,2,28,1,'2019-01-16 15:32:32','2019-01-16 15:46:19',0),(404,'fb97c26e-f2f5-4480-85af-2a985d11fbd0','2019-01-16 16:04:22','2019-01-16 16:29:18',0,15000,15000,0,1,2,28,2,'2019-01-16 16:04:22','2019-01-16 16:29:15',0),(405,'d34d3998-ef5a-4e50-885f-27f20adc4b3b','2019-01-16 16:26:36','2019-01-16 16:36:54',0,12000,12000,0,3,2,28,1,'2019-01-16 16:26:36','2019-01-16 16:36:54',0),(406,'fc27b01a-b74c-4eba-bb57-0e85bb89b5e2','2019-01-16 19:09:27','2019-01-16 19:24:56',0,68000,70000,2000,1,2,28,2,'2019-01-16 19:09:27','2019-01-16 19:24:55',0),(407,'ba7bc205-d0e0-4e5f-aee4-5baac742feea','2019-01-16 19:16:13','2019-01-16 19:30:21',0,33000,50000,17000,3,2,28,2,'2019-01-16 19:16:13','2019-01-16 19:30:21',0),(408,'284feb82-4931-424a-bbfa-ad49d8a1b7c5','2019-01-16 19:22:53','2019-01-16 19:36:34',0,28000,28000,0,4,2,28,1,'2019-01-16 19:22:53','2019-01-16 19:36:34',0),(409,'f257ddaf-6ff3-43c3-9628-e6ef67a65f42','2019-01-16 19:23:28','2019-01-16 19:39:03',0,32000,40000,8000,5,2,28,2,'2019-01-16 19:23:28','2019-01-16 19:39:03',0),(410,'e24cba76-951d-47ee-8a79-bb7298d81a29','2019-01-17 09:31:10','2019-01-17 09:42:32',0,29000,29000,0,5,2,25,2,'2019-01-17 09:31:10','2019-01-17 09:42:31',0),(411,'d256d2bd-6461-4682-9af2-239f5f7f0384','2019-01-17 10:19:09','2019-01-17 10:32:08',0,16000,16000,0,20,2,24,1,'2019-01-17 10:19:09','2019-01-17 10:32:08',1),(412,'50633b4d-d148-4c6c-8041-c560d7863c5e','2019-01-17 10:33:53','2019-01-17 10:38:02',0,13000,13000,0,5,2,24,1,'2019-01-17 10:33:53','2019-01-17 10:38:02',1),(413,'578d9520-9645-4a10-b9a5-00ae5d1a5f6a','2019-01-17 11:02:15','2019-01-17 11:10:09',0,17000,17000,0,9,2,24,2,'2019-01-17 11:02:15','2019-01-17 11:10:08',1),(414,'2f5e3040-8d1a-4b8f-b28c-45a77ec685b3','2019-01-17 11:52:27','2019-01-17 12:18:57',0,43000,43000,0,1,2,24,2,'2019-01-17 11:52:27','2019-01-17 12:18:56',1),(415,'d724ab30-566b-4dca-9d6b-c2db7f77cfe9','2019-01-17 11:56:05','2019-01-17 12:44:49',0,54000,60000,6000,3,2,24,2,'2019-01-17 11:56:05','2019-01-17 12:44:48',1),(416,'69cbf8a1-d5ac-4d01-ab20-001b31804ad6','2019-01-17 11:59:46','2019-01-17 13:00:34',0,89000,100000,11000,4,2,24,1,'2019-01-17 11:59:46','2019-01-17 13:00:34',1),(417,'322da953-d604-4f2f-97a1-3f0c2a3c46ee','2019-01-17 12:00:28','2019-01-17 12:10:43',0,17000,20000,3000,9,2,24,1,'2019-01-17 12:00:28','2019-01-17 12:10:42',1),(418,'5772adf4-3e4a-4dc2-8fe4-ac468ae6d261','2019-01-17 12:09:53','2019-01-17 12:11:42',0,112000,112000,0,20,4,24,1,'2019-01-17 12:09:53','2019-01-17 12:11:41',1),(419,'c97ad438-a17d-453b-a17a-7d46c1c34284','2019-01-17 12:12:37','2019-01-17 12:41:34',0,96000,112000,16000,20,2,24,1,'2019-01-17 12:12:37','2019-01-17 12:41:33',1),(420,'84fa9adc-9609-4790-a06a-763adb0ef82f','2019-01-17 12:14:31','2019-01-17 12:55:12',0,18000,18000,0,7,2,24,1,'2019-01-17 12:14:31','2019-01-17 12:55:11',1),(421,'caa02dbb-fe5a-434c-a37e-1b6d7cc8c932','2019-01-17 12:15:32','2019-01-17 12:16:05',0,66000,70000,4000,6,4,24,1,'2019-01-17 12:15:32','2019-01-17 12:16:05',1),(422,'8d474815-1e6b-4e2e-8b5c-2651bf642928','2019-01-17 12:16:39','2019-01-17 12:52:37',0,76000,76000,0,6,4,24,1,'2019-01-17 12:16:39','2019-01-17 12:52:37',1),(423,'9237b3b6-9233-4cee-ba87-cc875eb94b29','2019-01-17 12:32:06','2019-01-17 13:02:44',0,36000,50000,14000,9,2,24,2,'2019-01-17 12:32:06','2019-01-17 13:02:43',1),(424,'cd32a6dd-64fb-4528-a037-75bd13526a77','2019-01-17 12:47:19','2019-01-17 12:47:37',0,3000,3000,0,3,2,24,1,'2019-01-17 12:47:19','2019-01-17 12:47:37',1),(425,'8f231965-2a47-4a59-885a-b0015bb0a2f3','2019-01-17 12:48:22','2019-01-17 13:04:48',0,16000,50000,34000,11,2,24,1,'2019-01-17 12:48:22','2019-01-17 13:04:48',1),(426,'b3e7091d-0a38-4e61-a101-f26a5316729f','2019-01-17 12:53:20','2019-01-17 13:06:25',0,16000,20000,4000,3,2,24,1,'2019-01-17 12:53:20','2019-01-17 13:06:25',1),(427,'d5388b47-df1e-45a6-9d70-899e8f8d9f5f','2019-01-17 13:16:53','2019-01-17 13:29:28',0,28000,28000,0,1,2,24,2,'2019-01-17 13:16:53','2019-01-17 13:29:27',1),(428,'2622dcd1-0ca1-438c-aeff-80a24204f94c','2019-01-17 15:14:16','2019-01-17 15:39:35',0,33000,50000,17000,1,2,32,1,'2019-01-17 15:14:16','2019-01-17 15:39:34',1),(429,'5c33a965-93fe-42af-afb2-3b4d10224fa4','2019-01-17 16:31:06','2019-01-17 16:57:53',0,118000,118000,0,1,2,32,2,'2019-01-17 16:31:06','2019-01-17 16:57:52',1),(430,'6865dc16-ef3f-4bf5-a8c3-ba8a9569a548','2019-01-17 16:42:07','2019-01-17 16:58:01',0,9000,10000,1000,3,2,32,2,'2019-01-17 16:42:07','2019-01-17 16:58:00',1),(431,'f9c4df1f-2bed-4b36-a82d-a388fd9c63b5','2019-01-17 18:31:57','2019-01-17 19:26:23',0,12000,12000,0,1,2,32,2,'2019-01-17 18:31:57','2019-01-17 19:26:22',1),(432,'4eed696e-2409-45bb-8f93-8dbee9de7dd3','2019-01-17 19:35:06','2019-01-17 19:35:45',0,53000,55000,2000,1,2,32,2,'2019-01-17 19:35:06','2019-01-17 19:35:44',1),(433,'e66fabb8-ee6a-4323-aece-2d5dc92d6647','2019-01-18 09:01:01','2019-01-18 09:36:51',0,16000,17000,1000,4,2,24,2,'2019-01-18 09:01:01','2019-01-18 09:36:50',1),(434,'a4a6d933-af4e-4989-866f-633e687c8801','2019-01-18 09:23:05','2019-01-18 09:35:58',0,34000,50000,16000,1,4,24,2,'2019-01-18 09:23:05','2019-01-18 09:35:57',1),(435,'4d4c882f-f32b-45e3-ac58-9b1849da316d','2019-01-18 09:24:06','2019-01-18 09:36:15',0,21000,21000,0,7,2,24,2,'2019-01-18 09:24:06','2019-01-18 09:36:15',1),(436,'68d8ec80-fb50-4231-b64e-11a7434d6a12','2019-01-18 10:37:02','2019-01-18 10:37:33',0,17000,20000,3000,1,2,24,2,'2019-01-18 10:37:02','2019-01-18 10:37:32',1),(437,'c7ca4ef3-b237-4f66-9637-f010c7895aa3','2019-01-18 10:48:49','2019-01-18 10:57:04',0,16000,50000,34000,3,2,24,1,'2019-01-18 10:48:49','2019-01-18 10:57:03',1),(438,'f53e0d74-fe40-4749-8e96-96970c9cd802','2019-01-18 11:34:09','2019-01-18 11:44:17',0,48000,50000,2000,1,2,24,1,'2019-01-18 11:34:09','2019-01-18 11:44:16',1),(439,'01b3e622-f31e-4fee-bd36-9ad5f42eae32','2019-01-18 11:35:50','2019-01-18 11:41:53',0,13000,13000,0,3,2,24,2,'2019-01-18 11:35:50','2019-01-18 11:41:52',1),(440,'a74d461c-cc72-42c0-8b21-00d81b87b046','2019-01-18 12:11:08','2019-01-18 12:26:27',0,48000,50000,2000,1,2,24,2,'2019-01-18 12:11:08','2019-01-18 12:26:26',1),(441,'559df34d-7a52-4cac-a4ab-ae199cad59c2','2019-01-18 12:37:43','2019-01-18 12:47:56',0,38000,38000,0,3,2,24,2,'2019-01-18 12:37:43','2019-01-18 12:47:55',1),(442,'f92935eb-66ce-45a3-8a21-23eab2c8be1d','2019-01-18 12:40:25','2019-01-18 12:44:27',0,10000,50000,40000,1,2,24,2,'2019-01-18 12:40:25','2019-01-18 12:44:27',1),(443,'b592dbb9-06d3-4ca3-b0fe-d471256b9427','2019-01-18 12:41:54','2019-01-18 12:54:45',0,32000,32000,0,4,2,24,2,'2019-01-18 12:41:54','2019-01-18 12:54:44',1),(444,'645d2f3e-9724-4961-adc7-68df1b042e69','2019-01-18 12:43:51','2019-01-18 12:58:56',0,17000,17000,0,9,2,24,1,'2019-01-18 12:43:51','2019-01-18 12:58:55',1),(445,'6c5d4259-89c1-4692-bafe-7a3ca6817c0f','2019-01-18 12:47:04','2019-01-18 13:00:54',0,75000,75000,0,6,2,24,1,'2019-01-18 12:47:04','2019-01-18 13:00:53',1),(446,'9df9c92e-9eb9-4f10-8d55-5fa742b6e0eb','2019-01-18 13:14:59','2019-01-18 13:17:47',0,13000,20000,7000,4,2,24,2,'2019-01-18 13:14:59','2019-01-18 13:17:46',1),(447,'e507a256-7d66-4208-8673-6817f3f4e296','2019-01-18 14:36:36','2019-01-18 14:48:54',0,30000,50000,20000,1,2,32,2,'2019-01-18 14:36:36','2019-01-18 14:48:54',0),(448,'76c7db2d-25d0-46d7-9ef6-4e13dd79bd12','2019-01-18 15:26:50','2019-01-18 15:55:09',0,100000,100000,0,1,2,32,2,'2019-01-18 15:26:50','2019-01-18 15:55:08',0),(449,'850b85b0-543f-4408-8553-22af70a3db40','2019-01-19 23:43:11','2019-01-19 23:48:22',0,32000,32000,0,16,4,18,1,'2019-01-19 23:43:11','2019-01-19 23:48:22',0),(450,'1bb9ed08-eccb-4cd3-a9dc-8e6d80e19ccc','2019-01-19 23:44:42','2019-01-19 23:48:24',0,48000,48000,0,13,4,18,1,'2019-01-19 23:44:42','2019-01-19 23:48:24',0),(451,'c6eccfd1-25bb-429d-9a58-ab5438ac7c5d','2019-01-19 23:45:16','2019-01-19 23:48:25',0,9000,9000,0,18,4,18,2,'2019-01-19 23:45:16','2019-01-19 23:48:25',0),(452,'f844067a-0ee7-496f-aa65-731df7a40b25','2019-01-19 23:46:30','2019-01-19 23:48:26',0,16000,16000,0,17,4,18,1,'2019-01-19 23:46:30','2019-01-19 23:48:26',0),(453,'e3be2223-e9ad-419c-a29d-4d43865bdf90','2019-01-19 23:47:15','2019-01-19 23:48:28',0,12000,12000,0,14,4,18,1,'2019-01-19 23:47:15','2019-01-19 23:48:28',0),(454,'44ef08f4-6a9c-4681-a011-c917f9205d5e','2019-01-20 00:03:50','2019-01-20 00:11:25',0,18000,18000,0,18,4,18,1,'2019-01-20 00:03:50','2019-01-20 00:11:25',0),(455,'e5a1fdbe-1061-4cd7-b4e6-f78d1d5089bd','2019-01-20 00:04:30','2019-01-20 00:11:23',0,18000,18000,0,15,4,18,1,'2019-01-20 00:04:30','2019-01-20 00:11:23',0),(456,'acacf40a-e7a6-4147-813b-f9cae97dba84','2019-01-20 00:04:47','2019-01-20 00:05:22',0,108000,108000,0,16,4,18,1,'2019-01-20 00:04:47','2019-01-20 00:05:22',0),(457,'6f3eb550-4d51-458a-9a16-144edf4bb98b','2019-01-20 00:05:35','2019-01-20 00:06:08',0,120000,120000,0,19,4,18,1,'2019-01-20 00:05:35','2019-01-20 00:06:08',0),(458,'13311fc1-1623-4fb1-bd0e-4a3f5edbdfe4','2019-01-20 00:06:18','2019-01-20 00:11:22',0,18000,18000,0,17,4,18,1,'2019-01-20 00:06:18','2019-01-20 00:11:22',0),(459,'ee41393c-2d4b-4a8a-97d9-01293433b13c','2019-01-20 00:11:34','2019-01-20 00:17:21',0,18000,18000,0,17,4,18,1,'2019-01-20 00:11:34','2019-01-20 00:17:21',0),(460,'3f5884b4-5d62-4b47-8f70-bcb66976b9c6','2019-01-20 00:17:07','2019-01-20 00:17:23',0,48000,48000,0,13,4,18,1,'2019-01-20 00:17:07','2019-01-20 00:17:23',0),(461,'58080ad6-e141-40ab-8d22-5ea9806c5552','2019-01-20 00:18:46','2019-01-20 00:20:47',0,100000,100000,0,11,4,18,1,'2019-01-20 00:18:46','2019-01-20 00:20:47',0),(462,'0e0d791e-082d-48f8-9a99-bbea2f635601','2019-01-20 00:21:13','2019-01-21 15:31:16',0,39000,39000,0,8,4,18,1,'2019-01-20 00:21:13','2019-01-21 15:31:16',0),(463,'c5587338-6e47-4832-ba2b-5ab4863ac0a5','2019-01-20 00:24:57','2019-01-21 15:31:17',0,16000,16000,0,9,4,18,1,'2019-01-20 00:24:57','2019-01-21 15:31:17',0),(464,'623a3fdc-3e59-484b-823e-b9ed3d2385ec','2019-01-21 10:32:13','2019-01-21 15:31:19',0,6000,6000,0,21,4,18,1,'2019-01-21 10:32:13','2019-01-21 15:31:19',0),(465,'a366538b-1923-4487-91b0-2af38c6f063c','2019-01-21 14:59:20','2019-01-21 15:31:20',0,6000,6000,0,1,4,18,1,'2019-01-21 14:59:20','2019-01-21 15:31:20',0),(466,'b1c0a5ce-58fa-4226-8f84-ca5acc008205','2019-01-21 15:24:51','2019-01-21 15:31:21',0,6000,6000,0,3,4,18,1,'2019-01-21 15:24:51','2019-01-21 15:31:21',0),(467,'7e5e636d-007d-4064-be1e-98bd760c610f','2019-01-21 15:31:32','2019-01-21 15:32:15',0,12000,12000,0,1,4,18,1,'2019-01-21 15:31:32','2019-01-21 15:32:15',0),(468,'098275de-727e-4423-a705-a26e3756618f','2019-01-21 15:32:23','2019-01-21 15:38:41',0,6000,6000,0,1,4,18,1,'2019-01-21 15:32:23','2019-01-21 15:38:41',0),(469,'9dd9ea46-73da-4eb2-ad40-2ef967ba1b51','2019-01-21 15:38:51','2019-01-21 15:41:39',0,6000,6000,0,1,4,18,1,'2019-01-21 15:38:51','2019-01-21 15:41:39',0),(470,'3a1db00b-3cdf-4dcb-8390-a021c7f19924','2019-01-21 15:41:47','2019-01-21 15:51:25',0,6000,6000,0,1,4,18,1,'2019-01-21 15:41:47','2019-01-21 15:51:25',0),(471,'178c5e86-5b84-4c8e-96e9-673b8fcda656','2019-01-21 15:51:33','2019-01-21 15:52:14',0,12000,12000,0,1,4,18,1,'2019-01-21 15:51:33','2019-01-21 15:52:14',0),(472,'8da59a3c-c565-4f95-af01-65615dae9f23','2019-01-21 15:52:22','2019-01-21 15:53:09',0,6000,6000,0,1,4,18,1,'2019-01-21 15:52:22','2019-01-21 15:53:09',0),(473,'c6dca4dc-0498-4a1b-851e-06600a905267','2019-01-21 15:54:23','2019-01-21 15:55:16',0,6000,6000,0,1,4,18,1,'2019-01-21 15:54:23','2019-01-21 15:55:16',0),(474,'f8edbdac-280a-4295-9e4e-0351770eea67','2019-01-21 15:55:23','2019-01-21 16:03:39',0,6000,6000,0,1,4,18,1,'2019-01-21 15:55:23','2019-01-21 16:03:39',0),(475,'3b91cf8d-d1db-48c0-bddb-fe7196097706','2019-01-21 15:56:15','2019-01-21 16:03:40',0,12000,12000,0,3,4,18,1,'2019-01-21 15:56:15','2019-01-21 16:03:40',0),(476,'39a9dd57-df32-43f6-ac91-45cdd53d920e','2019-01-21 15:59:49','2019-01-21 16:03:41',0,18000,18000,0,4,4,18,1,'2019-01-21 15:59:49','2019-01-21 16:03:41',0),(477,'34bd7529-e3cf-4b29-8956-d23cd4b1f502','2019-01-21 16:00:47','2019-01-21 16:03:43',0,6000,6000,0,5,4,18,1,'2019-01-21 16:00:47','2019-01-21 16:03:43',0),(478,'b5f411c7-8be2-43ab-9bc6-f70fbba17d22','2019-01-21 16:03:53',NULL,0,9000,9000,0,1,1,18,1,'2019-01-21 16:03:53','2019-01-21 16:03:53',0),(479,'fb6392b4-b4e2-44d5-8c6a-6cdb631cdbcc','2019-01-21 16:17:00',NULL,0,18000,18000,0,3,1,18,1,'2019-01-21 16:17:00','2019-01-21 16:17:00',0),(480,'b31e9488-0eba-414c-9524-89033f966f97','2019-01-21 16:19:13',NULL,0,114000,150000,36000,4,1,18,1,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(481,'aad766a8-46a2-4eee-8f91-cf23936282c9','2019-01-21 16:19:31',NULL,0,30000,30000,0,5,1,18,1,'2019-01-21 16:19:31','2019-01-21 16:19:31',0),(482,'a5c83001-f252-4761-98c3-52ccad541a77','2019-01-21 16:32:44',NULL,0,6000,6000,0,6,1,18,1,'2019-01-21 16:32:44','2019-01-21 16:32:44',0),(483,'248d569f-4a84-4a31-81c8-8a28e2966caa','2019-01-21 16:33:51',NULL,0,15000,15000,0,7,1,18,1,'2019-01-21 16:33:51','2019-01-21 16:33:51',0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) DEFAULT NULL,
  `productCode` varchar(255) CHARACTER SET utf8 NOT NULL,
  `productName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `foodId` int(11) DEFAULT NULL,
  `vendorId` int(11) NOT NULL,
  `productTypeId` int(11) NOT NULL,
  `minimumStock` int(11) NOT NULL DEFAULT 0,
  `initQuantity` int(11) DEFAULT 0,
  `currentQuantity` int(11) NOT NULL DEFAULT 0,
  `cost` decimal(10,0) DEFAULT 0,
  `unitId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `expiryDate` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT current_timestamp(),
  `enabled` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_id_uindex` (`id`),
  UNIQUE KEY `products_productCode_uindex` (`productCode`),
  UNIQUE KEY `products_productName_uindex` (`productName`),
  KEY `products_producttype_fk` (`productTypeId`),
  KEY `products_vendor_fk` (`vendorId`),
  KEY `products_unit_fk` (`unitId`),
  KEY `products_food_fk` (`foodId`),
  KEY `products_users_fk` (`userId`),
  CONSTRAINT `products_food_fk` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_producttype_fk` FOREIGN KEY (`productTypeId`) REFERENCES `producttypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_unit_fk` FOREIGN KEY (`unitId`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_users_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_vendor_fk` FOREIGN KEY (`vendorId`) REFERENCES `vendors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=617 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `barcode`, `productCode`, `productName`, `foodId`, `vendorId`, `productTypeId`, `minimumStock`, `initQuantity`, `currentQuantity`, `cost`, `unitId`, `userId`, `createdAt`, `expiryDate`, `updatedAt`, `enabled`) VALUES (609,'121213232','Pepsi bottle','pepsi ຕຸກນ້ອຍ',171,1,1,20,24,53,4000,5,18,'2019-01-21 13:11:12','2021-01-21 07:00:00','2019-01-22 21:04:49',1),(611,'34234234','water tiger head','ນ້ຳດື່ມຫົວເສືອກາງ',74,1,1,20,50,47,2000,5,18,'2019-01-21 16:03:12','2019-01-21 07:00:00','2019-01-21 16:03:12',1),(612,'12122323','beer lao small','ເບຍລາວ ກວດນ້ອຍ',170,1,1,24,50,70,8000,5,18,'2019-01-22 13:58:15','2021-01-14 07:00:00','2019-01-22 21:04:29',1),(613,'22131323','sugar','ນຳ້ຕານຊາຍ',NULL,1,2,2,10,10,5000,2,18,'2019-01-22 15:29:01','2019-01-22 07:00:00','2019-01-22 15:29:01',1),(614,'2133215','coffee mate','ຄອບຟີ້ເມດ',NULL,1,2,2,5,15,8000,2,18,'2019-01-22 15:30:05','2019-01-22 07:00:00','2019-01-22 21:05:10',1),(615,'342342','fresh milk','ນົມສົດ',NULL,1,2,10,20,20,28000,4,18,'2019-01-22 15:31:17','2019-01-31 07:00:00','2019-01-22 15:31:17',1),(616,'987987','greentea powder','ຜົງຊາຂຽວ',NULL,1,2,100,500,500,30000,1,18,'2019-01-22 15:33:03','2020-01-31 07:00:00','2019-01-22 16:01:05',1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttypes`
--

DROP TABLE IF EXISTS `producttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productTypeCode` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 0,
  `userId` int(11) NOT NULL,
  `updatedBy` int(11) NOT NULL,
  `updatedAt` datetime DEFAULT current_timestamp(),
  `createdAt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `producttypes_id_uindex` (`id`),
  UNIQUE KEY `producttypes_productTypeCode_uindex` (`productTypeCode`),
  KEY `producttypes_createby_fk` (`userId`),
  KEY `producttypes_updateby_fk` (`updatedBy`),
  CONSTRAINT `producttypes_createby_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producttypes_updateby_fk` FOREIGN KEY (`updatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttypes`
--

LOCK TABLES `producttypes` WRITE;
/*!40000 ALTER TABLE `producttypes` DISABLE KEYS */;
INSERT INTO `producttypes` (`id`, `productTypeCode`, `description`, `enabled`, `userId`, `updatedBy`, `updatedAt`, `createdAt`) VALUES (1,'ສຳເລັດຮູບ','product for sale directly',1,18,18,'2019-01-19 00:47:02','2019-01-19 00:47:02'),(2,'ວັດຖຸດິບ','Material products for combine Produce food',1,18,18,'2019-01-19 00:47:23','2019-01-19 00:47:23');
/*!40000 ALTER TABLE `producttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refno` varchar(36) CHARACTER SET utf8 DEFAULT uuid(),
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) DEFAULT 0,
  `total` decimal(10,0) DEFAULT (`quantity` * `price`),
  `purchaseDate` datetime NOT NULL,
  `invoiceNo` varchar(20) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp(),
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchases_id_uindex` (`id`),
  KEY `purchases_product_fk` (`productId`),
  KEY `purchases_user_fk` (`userId`),
  KEY `purchases_vendor_fk` (`vendorId`),
  CONSTRAINT `purchases_product_fk` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchases_user_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchases_vendor_fk` FOREIGN KEY (`vendorId`) REFERENCES `vendors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` (`id`, `refno`, `productId`, `quantity`, `price`, `total`, `purchaseDate`, `invoiceNo`, `vendorId`, `createdAt`, `updatedAt`, `userId`) VALUES (6,'4e156b34-1e67-11e9-b467-0c4de9ce0b15',609,10,4000,40000,'2019-01-22 07:00:00','1254455',1,'2019-01-23 00:01:18','2019-01-23 00:01:18',18),(7,'adfbad88-1e67-11e9-b467-0c4de9ce0b15',614,10,8000,80000,'2019-01-23 07:00:00','4234342',1,'2019-01-23 00:03:59','2019-01-23 00:03:59',18);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger update_stock_hist_by_purchase after insert on purchases for each row
  begin
    set @stockId := (select id from stocks where stocks.productId = NEW.productId);
    set @currentQuantity := (select currentQuantity from stocks where stocks.productId = NEW.productId);
    insert into stockhistories(stockId, beforeQuantity, topup, currentQuantity, sign, remark, userId,purchaseId)  
    values (@stockId, @currentQuantity, NEW.quantity, (@currentQuantity + NEW.quantity),'CR','Purchase', NEW.userId, NEW.id);
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foodId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 0,
  `userId` int(11) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipes_id_uindex` (`id`),
  KEY `recipes_product_fk` (`productId`),
  KEY `recipes_food_fk` (`foodId`),
  KEY `recipes_user_fk` (`userId`),
  CONSTRAINT `recipes_food_fk` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recipes_product_fk` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recipes_user_fk` FOREIGN KEY (`userId`) REFERENCES `atlas`.`users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
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
  `kitchenId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_code` (`role_code`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `role_code`, `role_name`, `kitchenId`, `createdAt`, `updatedAt`) VALUES (1,'admin','administrator',0,'2018-12-28 20:24:08','2018-12-28 20:24:08'),(3,'staff','general staff normal user',2,'2018-12-28 20:25:33','2018-12-28 20:35:12'),(4,'chef-ext','chef-ext',1,'2019-01-01 10:41:43','2019-01-01 10:41:45'),(6,'chef-int','chef-int',2,'2019-01-07 16:42:01','2019-01-07 16:42:03');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`),
  UNIQUE KEY `location` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` (`id`, `status`, `location`, `createdAt`, `updatedAt`) VALUES (1,'pending at kitchen','kitchen','2019-01-03 22:34:49','2019-01-03 22:34:49'),(2,'finished','completed','2019-01-03 22:35:04','2019-01-03 22:35:04'),(4,'canceled','user','2019-01-05 02:17:37','2019-01-05 02:17:37'),(7,'pending at front','front counter','2019-01-06 22:35:21','2019-01-06 22:35:21');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockhistories`
--

DROP TABLE IF EXISTS `stockhistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockhistories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockId` int(11) NOT NULL,
  `beforeQuantity` decimal(10,0) NOT NULL DEFAULT 0,
  `topup` decimal(10,0) NOT NULL DEFAULT 0,
  `currentQuantity` decimal(10,0) NOT NULL DEFAULT 0,
  `sign` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `purchaseId` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `stockhistories_stock_fk` (`stockId`),
  KEY `stockhistories_purchase_fk` (`purchaseId`),
  CONSTRAINT `stockhistories_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `stockhistories_purchase_fk` FOREIGN KEY (`purchaseId`) REFERENCES `purchases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockhistories_stock_fk` FOREIGN KEY (`stockId`) REFERENCES `stocks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockhistories`
--

LOCK TABLES `stockhistories` WRITE;
/*!40000 ALTER TABLE `stockhistories` DISABLE KEYS */;
INSERT INTO `stockhistories` (`id`, `stockId`, `beforeQuantity`, `topup`, `currentQuantity`, `sign`, `remark`, `purchaseId`, `userId`, `createdAt`, `updatedAt`) VALUES (9,521,47,10,57,'CR','Topup',NULL,18,'2019-01-22 13:53:12','2019-01-22 13:53:12'),(10,519,23,20,43,'CR','Topup',NULL,18,'2019-01-22 13:55:52','2019-01-22 13:55:52'),(11,521,57,10,47,'DR','Decreasing',NULL,18,'2019-01-22 13:57:09','2019-01-22 13:57:09'),(12,522,50,20,70,'CR','Topup',NULL,18,'2019-01-22 13:59:05','2019-01-22 13:59:05'),(13,519,43,10,53,'CR','Purchase',6,18,'2019-01-23 00:01:18','2019-01-23 00:01:18'),(14,524,5,10,15,'CR','Purchase',7,18,'2019-01-23 00:03:59','2019-01-23 00:03:59');
/*!40000 ALTER TABLE `stockhistories` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger stock_topUp_tr after insert on stockhistories for each row
  begin
    update stocks set currentQuantity = NEW.currentQuantity, stockhistId = NEW.id where id=NEW.stockId;
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `stockDate` datetime DEFAULT current_timestamp(),
  `quantity` float NOT NULL,
  `currentQuantity` float NOT NULL,
  `expiryDate` datetime DEFAULT current_timestamp(),
  `descriptions` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `stockhistId` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocks_id_uindex` (`id`),
  UNIQUE KEY `stocks_id_uindex_2` (`id`),
  UNIQUE KEY `stocks_productId_uindex` (`productId`),
  KEY `stocks_users_fk` (`userId`),
  CONSTRAINT `stocks_product_fk` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stocks_users_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=527 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` (`id`, `productId`, `stockDate`, `quantity`, `currentQuantity`, `expiryDate`, `descriptions`, `userId`, `stockhistId`, `createdAt`, `updatedAt`) VALUES (519,609,'2019-01-21 13:11:12',24,53,'2021-01-21 07:00:00','new product added',18,13,'2019-01-21 13:11:12','2019-01-21 13:11:12'),(521,611,'2019-01-21 16:03:12',50,47,'2019-01-21 07:00:00','new product added',18,11,'2019-01-21 16:03:13','2019-01-21 16:03:13'),(522,612,'2019-01-22 13:58:15',50,70,'2021-01-14 07:00:00','new product added',18,12,'2019-01-22 13:58:15','2019-01-22 13:58:15'),(523,613,'2019-01-22 15:29:01',10,10,'2019-01-22 07:00:00','new product added',18,NULL,'2019-01-22 15:29:01','2019-01-22 15:29:01'),(524,614,'2019-01-22 15:30:05',5,15,'2019-01-22 07:00:00','new product added',18,14,'2019-01-22 15:30:05','2019-01-22 15:30:05'),(525,615,'2019-01-22 15:31:17',20,20,'2019-01-31 07:00:00','new product added',18,NULL,'2019-01-22 15:31:17','2019-01-22 15:31:17'),(526,616,'2019-01-22 15:33:03',500,500,'2020-01-31 07:00:00','new product added',18,NULL,'2019-01-22 15:33:03','2019-01-22 15:33:03');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger update_product_quantity after update on stocks for each row
  begin
    update products set currentQuantity = NEW.currentQuantity where id = NEW.productId;
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stocktrackings`
--

DROP TABLE IF EXISTS `stocktrackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stocktrackings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockId` int(11) NOT NULL,
  `beforeQuantity` float DEFAULT NULL,
  `used` float NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `currentQuantity` float DEFAULT (`beforeQuantity` - `used`),
  `userId` int(11) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `stockTrackings_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocktrackings`
--

LOCK TABLES `stocktrackings` WRITE;
/*!40000 ALTER TABLE `stocktrackings` DISABLE KEYS */;
INSERT INTO `stocktrackings` (`id`, `stockId`, `beforeQuantity`, `used`, `orderId`, `currentQuantity`, `userId`, `createdAt`, `updatedAt`) VALUES (20,519,0,0,NULL,24,18,'2019-01-21 15:54:10','2019-01-21 15:54:10'),(23,519,24,2,NULL,22,18,'2019-01-21 15:56:15','2019-01-21 15:56:15'),(24,519,22,3,NULL,19,18,'2019-01-21 15:59:49','2019-01-21 15:59:49'),(26,521,50,0,NULL,50,18,'2019-01-21 16:03:13','2019-01-21 16:03:13'),(27,521,50,3,NULL,47,18,'2019-01-21 16:03:53','2019-01-21 16:03:53'),(28,519,19,5,NULL,14,18,'2019-01-21 16:19:31','2019-01-21 16:19:31'),(29,519,14,1,482,13,18,'2019-01-21 16:32:44','2019-01-21 16:32:44'),(30,522,50,0,NULL,50,18,'2019-01-22 13:58:15','2019-01-22 13:58:15'),(31,523,10,0,NULL,10,18,'2019-01-22 15:29:01','2019-01-22 15:29:01'),(32,524,5,0,NULL,5,18,'2019-01-22 15:30:05','2019-01-22 15:30:05'),(33,525,20,0,NULL,20,18,'2019-01-22 15:31:17','2019-01-22 15:31:17'),(34,526,500,0,NULL,500,18,'2019-01-22 15:33:03','2019-01-22 15:33:03');
/*!40000 ALTER TABLE `stocktrackings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger update_stock_track after insert on stocktrackings for each row
  begin
    update stocks set currentQuantity = NEW.currentQuantity where id = NEW.stockId;
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tick_number` int(11) NOT NULL,
  `ticket_available` tinyint(1) NOT NULL DEFAULT 1,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `tick_number` (`tick_number`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` (`id`, `tick_number`, `ticket_available`, `enabled`, `createdAt`, `updatedAt`) VALUES (1,1,0,1,'2019-01-03 20:25:36','2019-01-21 16:03:53'),(3,2,0,1,'2019-01-03 22:26:27','2019-01-21 16:17:00'),(4,3,0,1,'2019-01-03 22:26:27','2019-01-21 16:19:13'),(5,4,0,1,'2019-01-03 22:26:27','2019-01-21 16:19:31'),(6,5,0,1,'2019-01-03 22:26:27','2019-01-21 16:32:44'),(7,6,0,1,'2019-01-03 22:26:27','2019-01-21 16:33:51'),(8,7,1,1,'2019-01-03 22:26:27','2019-01-21 15:31:16'),(9,8,1,1,'2019-01-03 22:26:27','2019-01-21 15:31:17'),(10,9,1,1,'2019-01-03 22:26:27','2019-01-14 19:30:36'),(11,10,1,1,'2019-01-03 22:26:27','2019-01-20 00:20:47'),(12,11,1,1,'2019-01-03 22:26:27','2019-01-14 19:46:01'),(13,12,1,1,'2019-01-03 22:26:27','2019-01-20 00:17:23'),(14,13,1,1,'2019-01-03 22:26:27','2019-01-19 23:48:28'),(15,14,1,1,'2019-01-03 22:26:27','2019-01-20 00:11:23'),(16,15,1,1,'2019-01-03 22:26:27','2019-01-20 00:05:22'),(17,16,1,1,'2019-01-03 22:26:27','2019-01-20 00:17:21'),(18,17,1,1,'2019-01-03 22:26:27','2019-01-20 00:11:25'),(19,18,1,1,'2019-01-03 22:26:27','2019-01-20 00:06:08'),(20,19,1,1,'2019-01-03 22:26:27','2019-01-17 12:41:33'),(21,20,1,1,'2019-01-03 22:26:27','2019-01-21 15:31:19');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionlog`
--

DROP TABLE IF EXISTS `transactionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactionlog` (
  `id` int(11) NOT NULL DEFAULT 0,
  `orderId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL,
  `full_food_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `done` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionlog`
--

LOCK TABLES `transactionlog` WRITE;
/*!40000 ALTER TABLE `transactionlog` DISABLE KEYS */;
INSERT INTO `transactionlog` (`id`, `orderId`, `foodId`, `full_food_name`, `quantity`, `price`, `total`, `note`, `createdAt`, `updatedAt`, `done`) VALUES (631,473,171,'Pepsi',1,6000,6000,NULL,'2019-01-21 15:54:23','2019-01-21 15:54:23',0),(632,474,171,'Pepsi',1,6000,6000,NULL,'2019-01-21 15:55:23','2019-01-21 15:55:23',0),(633,475,171,'Pepsi',2,6000,12000,NULL,'2019-01-21 15:56:15','2019-01-21 15:56:15',0),(634,476,171,'Pepsi',3,6000,18000,NULL,'2019-01-21 15:59:49','2019-01-21 15:59:49',0),(636,478,74,'ນ້ຳດື່ມ ຫົວເສືອ',3,3000,9000,NULL,'2019-01-21 16:03:53','2019-01-21 16:03:53',0),(637,479,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-21 16:17:00','2019-01-21 16:17:00',0),(638,480,114,'ເຂົ້າ ຂິ້ເມົາ ໄກ່',1,16000,16000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(639,480,115,'ເຂົ້າ ຂີ້ເມົາ ໝູ',1,16000,16000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(640,480,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(641,480,116,'ເຂົ້າ ຂີ້ເມົາ ທະເລ',1,18000,18000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(642,480,135,'ເຂົ້າ ໝູທອດກະທຽມ',1,16000,16000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(643,480,133,'ເຂົ້າໝູ ພິກໄທດຳ',1,16000,16000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(644,480,136,'ເຂົ້າ ໄຂ່ຈຽວ ໝູສັບ',1,16000,16000,NULL,'2019-01-21 16:19:13','2019-01-21 16:19:13',0),(645,481,171,'Pepsi',5,6000,30000,NULL,'2019-01-21 16:19:31','2019-01-21 16:19:31',0),(646,482,171,'Pepsi',1,6000,6000,NULL,'2019-01-21 16:32:44','2019-01-21 16:32:44',0),(647,483,170,'Beer',1,15000,15000,NULL,'2019-01-21 16:33:51','2019-01-21 16:33:51',0);
/*!40000 ALTER TABLE `transactionlog` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger update_stock_track_by_transactions after insert on transactionlog for each row
  begin
    set @stockId := (select id from stocks where productId = (select id from products where foodId = NEW.foodId));
    IF @stockId is not null THEN
    set @currentQuantity := (select currentQuantity from stocktrackings where stockId = @stockId order by id desc limit 1);
    insert into stocktrackings (stockId, beforeQuantity, used, userId, orderId) values (@stockId,@currentQuantity, NEW.quantity, 18, NEW.orderId);
      end IF ;
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tranxmenus`
--

LOCK TABLES `tranxmenus` WRITE;
/*!40000 ALTER TABLE `tranxmenus` DISABLE KEYS */;
INSERT INTO `tranxmenus` (`id`, `roleId`, `menuId`, `createdBy`, `createdAt`, `updatedAt`) VALUES (1,1,1,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(2,1,2,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(3,1,3,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(4,1,4,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(5,1,5,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(6,1,6,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(7,1,7,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(8,1,8,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(9,1,9,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(10,1,10,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(11,3,4,'system','2019-01-05 05:37:53','2019-01-05 05:37:54'),(12,3,8,'system','2019-01-05 05:38:19','2019-01-05 05:38:20'),(13,4,10,'system','2019-01-05 05:38:45','2019-01-05 05:38:46'),(14,4,1,'system','2019-01-05 05:39:04','2019-01-05 05:39:05'),(15,3,1,'system','2019-01-05 05:39:21','2019-01-05 05:39:22'),(16,6,1,'system','2019-01-07 17:13:26','2019-01-07 17:13:28'),(17,6,10,'system','2019-01-07 17:13:28','2019-01-07 17:13:29'),(19,1,12,'system','2019-01-10 12:17:12','2019-01-10 12:17:13'),(20,4,6,'system','2019-01-10 13:40:24','2019-01-10 13:40:26'),(21,3,10,'system','2019-01-13 05:15:15','2019-01-13 05:15:16'),(23,1,13,'system','2019-01-12 03:14:29','2019-01-12 03:14:30'),(24,3,13,'system','2019-01-12 03:14:29','2019-01-12 03:14:30'),(25,1,14,'system','2019-01-17 23:16:29','2019-01-17 23:16:29'),(26,1,15,'system','2019-01-18 11:47:08','2019-01-18 11:47:10');
/*!40000 ALTER TABLE `tranxmenus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitName` varchar(255) NOT NULL,
  `unitSign` varchar(6) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 0,
  `userId` int(11) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `units_id_uindex` (`id`),
  UNIQUE KEY `units_unitName_uindex` (`unitName`),
  KEY `units_user_fk` (`userId`),
  CONSTRAINT `units_user_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` (`id`, `unitName`, `unitSign`, `enabled`, `userId`, `createdAt`, `updatedAt`) VALUES (1,'ກລາມ','g',1,18,'2019-01-19 00:58:12','2019-01-19 00:58:12'),(2,'ກິໂລ','kg',1,18,'2019-01-19 00:58:12','2019-01-19 00:58:12'),(3,'ໜ່ວຍ','unit',1,18,'2019-01-19 00:58:37','2019-01-19 00:58:37'),(4,'ລິດ','lite',1,18,'2019-01-20 20:14:09','2019-01-20 20:14:09'),(5,'ຂວດ','bottle',1,18,'2019-01-21 10:29:34','2019-01-21 10:29:34'),(6,'ml','ml',1,18,'2019-01-22 21:05:44','2019-01-22 21:05:44');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
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
  `firstlogin` tinyint(1) NOT NULL DEFAULT 1,
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `employee_code`, `gender`, `username`, `email`, `mobile`, `fullname`, `dateOfbirth`, `employed_date`, `photo_path`, `password`, `firstlogin`, `enabled`, `createdAt`, `updatedAt`, `roleId`) VALUES (18,'ee3842d8-11e7-439f-b4bc-396da4f76b16','M','admin','sayyalinh@gmail.com','02055588857','Soulisack SAYYALINH','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$A2Py6MFvhx6qsMxV.Zn7/.rxv1BGTjyaRyoBf8WZXWl2MgkbLvtIi',0,1,'2018-12-29 07:38:10','2019-01-07 16:32:32',1),(20,'1dd7182c-3d42-4da7-a2d9-5baee070e25d','F','pathana','pathana@gmail.com','03056789333','Pathana','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$ErGKZztTym3cXypn5toaTu5CJs9Y7iWt3NWD8KWmAr/K04rBTvvTi',0,1,'2018-12-29 08:55:23','2019-01-13 22:48:40',1),(21,'dfdb7af2-6c20-425a-8c56-4f71ae205269','F','chef-01','chef-01@gmail.com','02055588856','Pathana SAYYALINH','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$txQvHa0ZFb7G8fjVSdtErOpYU4DM7PjrxNZ2GaRT5hgN/Qnqrrr/u',0,1,'2019-01-01 10:42:46','2019-01-01 10:42:46',6),(22,'4c3843cb-21a2-4ac5-9afc-fecd2263b671','F','chef-02','chef-02@gmail.com','02055588855','chef-02','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$lz6RrvRSMq6sPVgRGnqjOOaBzTTcZn9ldPab0/dUISnjq3KNO.RSu',0,1,'2019-01-01 10:43:02','2019-01-01 10:43:02',4),(23,'d18d3525-9295-4f5d-a178-51ab08c1a229','F','test01','test01@gmail.com','02055588852','test01','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$vSb7B.nBzzhnzXpu42XCfOEVckb6j7O86C/zpAsdEG7a2TbibGJjK',0,1,'2019-01-05 05:36:28','2019-01-07 16:20:56',3),(24,'8079e521-827b-46cf-a3f4-ec47743ae854','F','chankham','chankham@gmail.com','0205550000','chankham','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$ycWdUxnUgZPgORtNgIneLeYK3rZB9M6CaRB2tyFhS7nUDk6bqzSTm',0,1,'2019-01-08 01:47:29','2019-01-12 06:42:07',3),(25,'2dea877f-7bb8-471e-aa5d-957795922774','M','kita','kita@gmail.com','02055500000','kita','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$igN6y6t6P2y06zMD9D2eE.9QSpw5V1icZxiaZFdu21wNykdTAXm4C',0,1,'2019-01-08 01:47:50','2019-01-08 01:56:09',3),(26,'3dcb3533-3133-4a77-9dea-a7813af12b24','F','kai','nilandone@gmail.com','02055901735','kai','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$t5IBACBTGw3ztaBoAymA.uPU7u9a9LKprlV1/fQU1Bj2rEsazNj3i',0,1,'2019-01-08 04:31:58','2019-01-12 04:07:28',3),(28,'4924788d-f4d5-44f3-8571-e34ab391ea97','M','bob','bob@gmail.com','02078888575','bob','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$kVbJK1roAnjj8RqPlvJIHu4eZVRaiCVa/a1A1X9/ZoC0KEa6WjSwW',0,1,'2019-01-08 08:23:07','2019-01-08 08:32:35',3),(29,'db6ffd4b-cac7-49c3-9749-7281ba5c34bf','F','vanh','vanh@gmail.com','02078888577','pahivanh','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$DEHr8ANc0GqmIaknyDYHvOouL7A/ZE9qZzF3S09dtdtSkuv19pKhi',0,1,'2019-01-11 14:10:17','2019-01-12 10:36:23',3),(31,'8478a2be-b9b0-4d9f-b371-1619045e399c','F','song','song@gmail.com','02078888576','song','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$.ILcNXxAHjAK3yDr1g.9n.6RLuJVzT.NyREt7x/mztGixIfm8rRnW',0,1,'2019-01-11 14:10:33','2019-01-12 02:06:53',3),(32,'b7074de6-ed07-4b72-9c1f-e3471303770d','F','mit','mit@gmail.com','02055588853','mit','1985-02-10 00:00:00','2019-01-17 00:00:00','not ready','$2a$10$gJlnWnxCYaj9wGfB3MWVaezUNBt1QZLGNBJEUDVmdfYCXtT60Y/mG',0,1,'2019-01-17 14:47:31','2019-01-17 14:50:37',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactPerson` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `shopName` varchar(255) NOT NULL,
  `address` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `tel` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `userId` int(11) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_address_uindex` (`address`),
  UNIQUE KEY `vendors_id_uindex` (`id`),
  UNIQUE KEY `vendors_shopName_uindex` (`shopName`),
  KEY `vendors_user_fk` (`userId`),
  CONSTRAINT `vendors_user_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` (`id`, `contactPerson`, `shopName`, `address`, `tel`, `mobile`, `enabled`, `userId`, `createdAt`, `updatedAt`) VALUES (1,'J-Mart','J-mart','Dongdok','021212000','0206674748',1,18,'2019-01-19 01:49:31','2019-01-19 01:49:31');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-23  0:05:05
