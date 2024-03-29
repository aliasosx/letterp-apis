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
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` (`id`, `food_name`, `food_name_en`, `parents_food_id`, `photo`, `foodtypeId`, `cost`, `price`, `currcode`, `enabled`, `createdAt`, `updatedAt`, `userId`, `kitchenId`, `enabled_child_food`) VALUES (50,'ເຂົ້າ ຜັດ','Fire rice',0,'http://139.59.216.238:5005/images/uploads/foods/1027.jpg',1,0,0,'418',1,'2019-01-01 02:03:05','2019-01-01 02:03:05',18,1,1),(53,'ກະເພົາ','ka-phao',0,'http://139.59.216.238:5005/images/uploads/foods/702669572.jpg',1,0,0,'418',1,'2019-01-04 04:56:32','2019-01-04 04:56:32',18,1,1),(54,'ງົວ','pork',53,'http://139.59.216.238:5005/images/uploads/foods/702669572.jpg',1,13000,18000,'418',1,'2019-01-04 04:57:03','2019-01-04 04:57:03',18,1,0),(55,'ທະເລ','seafood',53,'http://139.59.216.238:5005/images/uploads/foods/702669572.jpg',1,13000,18000,'418',1,'2019-01-04 04:57:18','2019-01-04 04:57:18',18,1,0),(56,'ທະເລ','Sea food',50,'http://139.59.216.238:5005/images/uploads/foods/1027.jpg',1,13000,18000,'418',1,'2019-01-04 16:30:54','2019-01-04 16:30:54',18,1,0),(60,'ໂກໂກ້ ນົມສົດ','ice cocoa',0,'http://139.59.216.238:5005/images/uploads/foods/coco.png',9,10000,13000,'418',1,'2019-01-04 16:53:19','2019-01-04 18:08:13',18,2,0),(61,'ນົມສົດ ຄາຣາເມລ','ice caramel',0,'http://139.59.216.238:5005/images/uploads/foods/caramel.png',9,10000,13000,'418',1,'2019-01-04 16:57:38','2019-01-04 16:57:38',18,2,0),(62,'ເຜືອກຫອມນົມສົດ','taro milk',0,'http://139.59.216.238:5005/images/uploads/foods/taro7.png',9,10000,13000,'418',1,'2019-01-04 16:59:07','2019-01-04 16:59:07',18,2,0),(63,'ຊາຂຽວ','green tea',0,'http://139.59.216.238:5005/images/uploads/foods/greentea2.png',9,10000,13000,'418',1,'2019-01-04 17:00:16','2019-01-04 17:00:16',18,2,0),(64,'ນົມສົດກ້ວຍຫອມ','fresh milk',0,'http://139.59.216.238:5005/images/uploads/foods/bananamilk.png',9,10000,13000,'418',1,'2019-01-04 17:03:28','2019-01-04 17:03:28',18,2,0),(65,'ດັບໂບ້ ຊ໋ອກໂກ້','double choco',0,'http://139.59.216.238:5005/images/uploads/foods/cocoFrap7.png',10,13000,17000,'418',1,'2019-01-04 17:05:47','2019-01-04 17:05:47',18,2,0),(66,'ຊາຂຽວປັ່ນ','green tea Frap',0,'http://139.59.216.238:5005/images/uploads/foods/greenteaFrap6.png',10,13000,17000,'418',1,'2019-01-04 17:06:46','2019-01-04 17:06:46',18,2,0),(67,'ສະຕຣໍເບີຣີ ໂຍເກີສ','strawberry yogurt',0,'http://139.59.216.238:5005/images/uploads/foods/strawfrap7.png',10,13000,17000,'418',1,'2019-01-04 17:07:53','2019-01-04 17:07:53',18,2,0),(68,'ແມັງໂກ້ ໂຍເກີສ','mango yogurt',0,'http://139.59.216.238:5005/images/uploads/foods/mangomilk.png',10,13000,17000,'418',1,'2019-01-04 17:10:31','2019-01-04 17:10:31',18,2,0),(69,'ຊ໋ອກໂກ້ ບລາວນີ້','choco brownie',0,'http://139.59.216.238:5005/images/uploads/foods/cocoFrap6.png',10,13000,17000,'418',1,'2019-01-04 17:12:28','2019-01-04 17:12:28',18,2,0),(70,'ນ້ຳບຣູເບີຣີ','blue berry',0,'http://139.59.216.238:5005/images/uploads/foods/blueberry.png',2,8000,10000,'418',1,'2019-01-04 17:13:41','2019-01-04 17:13:41',18,2,0),(71,'ນ້ຳໝາກນອດ','passion fruit',0,'http://139.59.216.238:5005/images/uploads/foods/passion_resized.gif',2,8000,10000,'418',1,'2019-01-04 17:14:28','2019-01-04 17:14:28',18,2,0),(72,'ນ້ຳອະງຸ່ນ','grape juice',0,'http://139.59.216.238:5005/images/uploads/foods/grape1.png',2,8000,10000,'418',1,'2019-01-04 17:15:21','2019-01-04 17:15:21',18,2,0),(73,'ນ້ຳລີ້ນຈິ່','lychee juice',0,'http://139.59.216.238:5005/images/uploads/foods/lychee1.png',2,8000,10000,'418',1,'2019-01-04 17:16:00','2019-01-04 17:16:00',18,2,0),(74,'ນ້ຳດື່ມ ຫົວເສືອ','water',0,'http://139.59.216.238:5005/images/uploads/foods/la_tigerhead-drinking-water.png',2,2000,3000,'418',1,'2019-01-04 17:17:15','2019-01-04 17:17:15',18,2,0),(75,'ຜັດໄທ','Phat-thai',0,'http://139.59.216.238:5005/images/uploads/foods/phatthai.png',11,0,0,'418',1,'2019-01-05 03:06:03','2019-01-05 03:06:03',18,1,1),(76,'ທະເລ','Sea food',75,'http://139.59.216.238:5005/images/uploads/foods/phatthai.png',11,13000,18000,'418',1,'2019-01-05 03:09:06','2019-01-05 03:09:06',18,1,0),(77,'ສຸກກີ້ນ້ຳ','Suki',0,'http://139.59.216.238:5005/images/uploads/foods/baannoi-sukee35.jpg',11,0,0,'418',1,'2019-01-05 03:10:52','2019-01-05 03:10:52',18,1,1),(78,'ໝູ','pork',77,'http://139.59.216.238:5005/images/uploads/foods/suki.png',11,10000,16000,'418',1,'2019-01-05 03:11:53','2019-01-05 03:11:53',18,1,0),(79,'ສະປາເກັດຕີ້','spaghetti',0,'http://139.59.216.238:5005/images/uploads/foods/spagettytomato.png',12,0,0,'418',1,'2019-01-05 03:13:12','2019-01-05 03:13:12',18,1,1),(80,'ຊ໋ອດໝາກເລັ່ນ','tomato',79,'http://139.59.216.238:5005/images/uploads/foods/spagettytomato.png',12,13000,18000,'418',1,'2019-01-05 03:14:44','2019-01-05 03:14:44',18,1,0),(81,'ກະເພົາ ທະເລ','Ka-phao seafood',79,'http://139.59.216.238:5005/images/uploads/foods/spa2.png',12,15000,20000,'418',1,'2019-01-05 03:16:52','2019-01-05 03:16:52',18,1,0),(82,'ດາໂບນ່າຣ່າ ໝູ','carbo pork',79,'http://139.59.216.238:5005/images/uploads/foods/spagettispicy.png',12,13000,18000,'418',1,'2019-01-05 03:18:57','2019-01-05 03:18:57',18,1,0),(83,'ດາໂບນ່າຣ່າ ທະເລ','carbo seafood',79,'http://139.59.216.238:5005/images/uploads/foods/spagettispicy.png',12,15000,20000,'418',1,'2019-01-05 03:19:41','2019-01-05 03:19:41',18,1,0),(84,'ກະເພົາ','-',79,'http://139.59.216.238:5005/images/uploads/foods/spa.png',12,13000,18000,'418',1,'2019-01-05 03:20:29','2019-01-05 03:20:29',18,1,0),(85,'ກະເພົາ ທະເລ','-',79,'http://139.59.216.238:5005/images/uploads/foods/spa.png',12,15000,20000,'418',1,'2019-01-05 03:21:39','2019-01-05 03:21:39',18,1,0),(86,'ມັກກະໂລນີ','macaroni',0,'http://139.59.216.238:5005/images/uploads/foods/img_6779.jpg',11,0,0,'418',1,'2019-01-05 03:24:20','2019-01-05 03:24:20',18,1,1),(87,'ຊ໋ອດແດງ','tomato',86,'http://139.59.216.238:5005/images/uploads/foods/img_6779.jpg',11,11000,16000,'418',1,'2019-01-05 03:25:19','2019-01-05 03:25:19',18,1,0),(88,'ກະເພົາ ໄກ່','Ka-phao chick',86,'http://139.59.216.238:5005/images/uploads/foods/photo.jpg',11,11000,16000,'418',1,'2019-01-05 03:27:28','2019-01-05 03:27:28',18,1,0),(89,'ກະເພົາ ໝູ','Ka-phao pork',86,'http://139.59.216.238:5005/images/uploads/foods/photo.jpg',11,11000,16000,'418',1,'2019-01-05 03:27:57','2019-01-05 03:27:57',18,1,0),(90,'ຂີ້ເມົາ ໝູ','khee-mao pork',86,'http://139.59.216.238:5005/images/uploads/foods/ny3p2uf7ft4Wup2C4JR-o.jpg',11,11000,16000,'418',1,'2019-01-05 03:30:02','2019-01-05 03:30:02',18,1,0),(91,'ຂີ້ເມົາ ໄກ່','khee-mao chick',86,'http://139.59.216.238:5005/images/uploads/foods/ny3p2uf7ft4Wup2C4JR-o.jpg',11,11000,16000,'418',1,'2019-01-05 03:30:48','2019-01-05 03:30:48',18,1,0),(92,'ຂີ້ເມົາ ທະເລ','khee-mao seafood',86,'http://139.59.216.238:5005/images/uploads/foods/ny3p2uf7ft4Wup2C4JR-o.jpg',11,13000,18000,'418',1,'2019-01-05 03:32:03','2019-01-05 03:32:03',18,1,0),(93,'ໄກ່','chick',75,'http://139.59.216.238:5005/images/uploads/foods/ID_1224_56f8d6cdedc6b.jpg',11,11000,16000,'418',1,'2019-01-05 03:33:17','2019-01-05 03:33:17',18,1,0),(94,'ໝູ','pork',75,'http://139.59.216.238:5005/images/uploads/foods/ID_1224_56f8d6cdedc6b.jpg',11,11000,16000,'418',1,'2019-01-05 03:33:52','2019-01-05 03:33:52',18,1,0),(95,'ເສັ້ນໃຫຍ່','noodle',0,'http://139.59.216.238:5005/images/uploads/foods/hqdefault.jpg',11,0,0,'418',1,'2019-01-05 03:35:53','2019-01-05 03:35:53',18,1,1),(96,'ລາດໜ້າ ໝູ','pork',95,'http://139.59.216.238:5005/images/uploads/foods/hqdefault.jpg',11,11000,16000,'418',1,'2019-01-05 03:36:45','2019-01-05 03:36:45',18,1,0),(97,'ລາດໜ້າ ໄກ່','chick',95,'http://139.59.216.238:5005/images/uploads/foods/hqdefault.jpg',11,11000,16000,'418',1,'2019-01-05 03:37:24','2019-01-05 03:37:24',18,1,0),(98,'ລາດໜ້າ ທະເລ','sea food',95,'http://139.59.216.238:5005/images/uploads/foods/hqdefault.jpg',11,13000,18000,'418',1,'2019-01-05 03:38:14','2019-01-05 03:38:14',18,1,0),(99,'ຜັດຊີອີ້ວ ໝູ','pork',95,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault.jpg',11,11000,16000,'418',1,'2019-01-05 03:39:35','2019-01-05 03:39:35',18,1,0),(100,'ຜັດຊີອີ້ວ ໄກ່','chick',95,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault.jpg',11,11000,16000,'418',1,'2019-01-05 03:40:12','2019-01-05 03:40:12',18,1,0),(101,'ຜັດຊີອີ້ວ ທະເລ','sea food',95,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault.jpg',11,13000,18000,'418',1,'2019-01-05 03:41:07','2019-01-05 03:41:07',18,1,0),(102,'ໝີ່ກອບລາດໜ້າ','Mi-krob',0,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (1).jpg',11,0,0,'418',1,'2019-01-05 03:42:31','2019-01-05 03:42:31',18,1,1),(103,'ໝູ','pork',102,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (1).jpg',11,11000,16000,'418',1,'2019-01-05 03:43:05','2019-01-05 03:43:05',18,1,0),(104,'ໄກ່','chick',102,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (1).jpg',11,11000,16000,'418',1,'2019-01-05 03:43:31','2019-01-05 03:43:31',18,1,0),(105,'ທະເລ','Sea food',102,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (1).jpg',11,13000,18000,'418',1,'2019-01-05 03:43:58','2019-01-05 03:43:58',18,1,0),(106,'ສຸກກິ້ ແຫ້ງ','suki',0,'http://139.59.216.238:5005/images/uploads/foods/suki.jpg',11,0,0,'418',1,'2019-01-05 03:46:43','2019-01-05 03:46:43',18,1,1),(107,'ທະເລ','Sea food',106,'http://139.59.216.238:5005/images/uploads/foods/suki.jpg',11,13000,18000,'418',1,'2019-01-05 03:47:14','2019-01-05 03:47:14',18,1,0),(108,'ໝູ','pork',106,'http://139.59.216.238:5005/images/uploads/foods/suki.jpg',11,11000,16000,'418',1,'2019-01-05 03:47:54','2019-01-05 03:47:54',18,1,0),(109,'ໄກ່','chick',106,'http://139.59.216.238:5005/images/uploads/foods/suki.jpg',11,11000,16000,'418',1,'2019-01-05 03:48:24','2019-01-05 03:48:24',18,1,0),(110,'ທະເລ','Sea food',77,'http://139.59.216.238:5005/images/uploads/foods/suki.png',11,13000,18000,'418',1,'2019-01-05 03:49:50','2019-01-05 03:49:50',18,1,0),(111,'ໄກ່','chick',77,'http://139.59.216.238:5005/images/uploads/foods/suki.png',11,11000,16000,'418',1,'2019-01-05 03:50:29','2019-01-05 03:50:29',18,1,0),(112,'ໄກ່','chick',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:17:24','2019-01-05 04:17:24',18,1,0),(113,'ໝູ','pork',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:17:59','2019-01-05 04:17:59',18,1,0),(114,'ຂີ້ເມົາ ໄກ່','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:19:24','2019-01-05 04:19:24',18,1,0),(115,'ຂີ້ເມົາ ໝູ','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:20:31','2019-01-05 04:20:31',18,1,0),(116,'ຂີ້ເມົາ ທະເລ','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,13000,18000,'418',1,'2019-01-05 04:21:53','2019-01-05 04:21:53',18,1,0),(117,'ກະເພົາ ໝູ','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:23:07','2019-01-05 04:23:07',18,1,0),(118,'ກະເພົາ ໄກ່','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:23:30','2019-01-05 04:23:30',18,1,0),(119,'ກະເພົາ ທະເລ','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,13000,18000,'418',1,'2019-01-05 04:24:16','2019-01-05 04:24:16',18,1,0),(120,'ກະເພົາກອບ ໝູ','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:25:28','2019-01-05 04:25:28',18,1,0),(121,'ກະເພົາກອບ ໄກ່','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:31:06','2019-01-05 04:31:06',18,1,0),(122,'ກະເພົາກອບ ທະເລ','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,13000,18000,'418',1,'2019-01-05 04:31:50','2019-01-05 04:31:50',18,1,0),(123,'ເຂົ້າ ຜັກກາດນາ','-',0,'http://139.59.216.238:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,0,0,'418',1,'2019-01-05 04:33:23','2019-01-05 04:33:23',18,1,1),(124,'ໝູ','pork',123,'http://139.59.216.238:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,11000,16000,'418',1,'2019-01-05 04:33:52','2019-01-05 04:33:52',18,1,0),(125,'ໄກ່','chick',123,'http://139.59.216.238:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,11000,16000,'418',1,'2019-01-05 04:34:14','2019-01-05 04:34:14',18,1,0),(126,'ທະເລ','Sea food',123,'http://139.59.216.238:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,13000,18000,'418',1,'2019-01-05 04:34:37','2019-01-05 04:34:37',18,1,0),(127,'ເຂົ້າ ຖົ່ວລັນເຕົາຜັດ','-',0,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,0,0,'418',1,'2019-01-05 04:36:35','2019-01-05 04:36:35',18,1,1),(128,'ໝູ','pork',127,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,11000,16000,'418',1,'2019-01-05 04:36:56','2019-01-05 04:36:56',18,1,0),(129,'ໄກ່','chick',127,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,11000,16000,'418',1,'2019-01-05 04:37:18','2019-01-05 04:37:18',18,1,0),(130,'ທະເລ','Sea food',127,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,13000,18000,'418',1,'2019-01-05 04:37:43','2019-01-05 04:37:43',18,1,0),(131,'ເຂົ້າມັນໄກ່','khao-mun-kai',0,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,11000,16000,'418',1,'2019-01-05 04:39:21','2019-01-05 04:39:21',18,1,0),(132,'ເຂົ້າມັນໄກ່ ກອບ','khao-mun-kai-krob',0,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (2).jpg',1,11000,16000,'418',1,'2019-01-05 04:40:06','2019-01-05 04:40:06',18,1,0),(133,'ເຂົ້າໝູ ພິກໄທດຳ','pik-thai-dumm',0,'http://139.59.216.238:5005/images/uploads/foods/tmp1_133058_20161015_21333570.JPG',1,11000,16000,'418',1,'2019-01-05 04:41:38','2019-01-05 04:41:38',18,1,0),(134,'ຂິງໄກ່','khing-kai',50,'http://139.59.216.238:5005/images/uploads/foods/tmp1_133058_20161015_21333570.JPG',1,11000,16000,'418',1,'2019-01-05 04:42:10','2019-01-05 04:42:10',18,1,0),(135,'ເຂົ້າ ໝູທອດກະທຽມ','pork with garlic',0,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (3).jpg',1,11000,16000,'418',1,'2019-01-05 04:43:43','2019-01-05 04:43:43',18,1,0),(136,'ເຂົ້າ ໄຂ່ຈຽວ ໝູສັບ','fire egg pork',0,'http://139.59.216.238:5005/images/uploads/foods/1442885991-imagejpeg-o.jpg',1,11000,16000,'418',1,'2019-01-05 04:44:46','2019-01-05 04:44:46',18,1,0),(137,'ຜັກບົ້ງໄຟແດງ','phuk-bong-faideng',50,'http://139.59.216.238:5005/images/uploads/foods/download (2).jpeg',1,11000,16000,'418',1,'2019-01-05 04:46:27','2019-01-05 04:46:27',18,1,0),(138,'ເຟຣນຟາຍ','French fries',0,'http://139.59.216.238:5005/images/uploads/foods/69b67c8f33cfd77dda368f90da3450a0.png',4,5000,9000,'418',1,'2019-01-05 04:48:16','2019-01-05 04:48:16',18,1,0),(139,'ໄກ່ທອດ','fries chicken',0,'http://139.59.216.238:5005/images/uploads/foods/2cb0f96c970652f59310d581dc21b497.png',4,5000,10000,'418',1,'2019-01-05 04:49:32','2019-01-05 04:49:32',18,1,0),(140,'ທອດລຸກຊີ້ນ ຮັອດດອກ','meatball',0,'http://139.59.216.238:5005/images/uploads/foods/57fa34df8e7c0_1024.jpg',4,7000,12000,'418',1,'2019-01-05 04:50:46','2019-01-05 04:50:46',18,1,0),(141,'ນັກເກັດໄກ່','chick nuggets',0,'http://139.59.216.238:5005/images/uploads/foods/nudgetkai1.png',4,10000,15000,'418',1,'2019-01-05 04:52:31','2019-01-05 04:52:31',18,1,0),(142,'ໄກ່ສະຕິກ','chick stick',0,'http://139.59.216.238:5005/images/uploads/foods/04849d5e5b88f8b1703370d89512bead.png',4,10000,15000,'418',1,'2019-01-05 04:53:56','2019-01-05 04:53:56',18,1,0),(143,'ທອດໄກ່ຈໍ້','kai-jor',0,'http://139.59.216.238:5005/images/uploads/foods/download (3).jpeg',4,10000,15000,'418',1,'2019-01-05 04:55:10','2019-01-05 04:55:10',18,1,0),(144,'ຟິຊສະຕິກ','fish stick',0,'http://139.59.216.238:5005/images/uploads/foods/fish-stick-png-1.png',4,10000,15000,'418',1,'2019-01-05 04:56:08','2019-01-05 04:56:08',18,1,0),(145,'ປີກໄກ່ ທອດນ້ຳປາ','wing-nampa',0,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (4).jpg',4,15000,20000,'418',1,'2019-01-05 04:57:48','2019-01-05 04:57:48',18,1,0),(146,'ປາດອນລິ໊ ຊຸບແປ້ງທອດ','dolly fires',0,'http://139.59.216.238:5005/images/uploads/foods/635749-img-1349336040-1.jpg',4,15000,20000,'418',1,'2019-01-05 04:59:16','2019-01-05 04:59:16',18,1,0),(147,'ປີກໄກ່ທອດ ທາລິຢາກິ','wing-teriyaki',0,'http://139.59.216.238:5005/images/uploads/foods/hqdefault (1).jpg',4,20000,25000,'418',1,'2019-01-05 05:01:04','2019-01-05 05:01:04',18,1,0),(148,'ປີກໄກ່ທອດ ບາບີຄິວ','wing-BBQ',0,'http://139.59.216.238:5005/images/uploads/foods/download (4).jpeg',4,20000,25000,'418',1,'2019-01-05 05:02:03','2019-01-05 05:02:03',18,1,0),(149,'ຕຳໝາກຮຸ່ງ','papaya salad',0,'http://139.59.216.238:5005/images/uploads/foods/702669572.jpg',5,8000,10000,'418',1,'2019-01-05 09:12:08','2019-01-05 09:12:08',18,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtypes`
--

LOCK TABLES `foodtypes` WRITE;
/*!40000 ALTER TABLE `foodtypes` DISABLE KEYS */;
INSERT INTO `foodtypes` (`id`, `food_type`, `food_type_desc`, `food_type_desc_la`, `createdAt`, `updatedAt`) VALUES (1,'FOOD','Food','ອາຫານ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(2,'DRNK','DRINK','ເຄື່ອງດື່ມ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(4,'SNCK','Snack','ອາຫານທອດ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(5,'SLD','Slard','ຕຳ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(9,'fresh-milk','fresh milk','ນົມສົດ','2019-01-04 16:47:55','2019-01-04 16:47:55'),(10,'frappe','frappe','ປັ່ນ','2019-01-04 17:04:21','2019-01-04 17:04:21'),(11,'pasta','pasta','pasta','2019-01-05 03:03:50','2019-01-05 03:03:50'),(12,'spaghetti','spaghetti','spaghetti','2019-01-05 03:04:23','2019-01-05 03:04:23');
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
INSERT INTO `kitchens` (`id`, `kitchen_code`, `kitchen_name`, `userId`, `createdAt`, `updatedAt`) VALUES (1,'kitchen001','Out Side kitchen',0,'2019-01-01 01:52:32','2019-01-01 01:52:32'),(2,'kitchen002','Inside Kitchen',0,'2019-01-01 01:52:32','2019-01-01 01:52:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `menu_code`, `menu_name`, `menu_link`, `icon`, `enabled`, `createdAt`, `updatedAt`) VALUES (1,'Home','Home','/','home',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(2,'Sales','Sales','sale','shopping_cart',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(3,'Terminals','Terminals','terminal','dns',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(4,'POS','POS','pos','credit_card',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(5,'Food','Food','food','fastfood',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(6,'Reports','Reports','report','report',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(7,'Administator','Administator','administrator','settings',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(8,'Order Tracking','Order Tracking','orders','done',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(9,'Users management','Users management','users','verified_user',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(10,'Kitchen monitor','Kitchen monitor','kitchenmon','kitchen',1,'2018-12-30 16:43:20','2018-12-30 16:43:20');
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
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `foodId` (`foodId`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `role_code`, `role_name`, `createdAt`, `updatedAt`) VALUES (1,'admin','administrator','2018-12-28 20:24:08','2018-12-28 20:24:08'),(3,'staff','general staff normal user','2018-12-28 20:25:33','2018-12-28 20:35:12'),(4,'chef','chef','2019-01-01 10:41:43','2019-01-01 10:41:45');
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
INSERT INTO `tickets` (`id`, `tick_number`, `ticket_available`, `enabled`, `createdAt`, `updatedAt`) VALUES (1,1,1,1,'2019-01-03 20:25:36','2019-01-06 14:01:40'),(3,2,1,1,'2019-01-03 22:26:27','2019-01-06 12:45:42'),(4,3,1,1,'2019-01-03 22:26:27','2019-01-06 13:13:22'),(5,4,1,1,'2019-01-03 22:26:27','2019-01-07 14:05:21'),(6,5,1,1,'2019-01-03 22:26:27','2019-01-06 12:49:20'),(7,6,1,1,'2019-01-03 22:26:27','2019-01-06 15:29:16'),(8,7,1,1,'2019-01-03 22:26:27','2019-01-07 14:17:56'),(9,8,1,1,'2019-01-03 22:26:27','2019-01-07 14:18:17'),(10,9,1,1,'2019-01-03 22:26:27','2019-01-06 16:55:22'),(11,10,1,1,'2019-01-03 22:26:27','2019-01-06 15:27:45'),(12,11,1,1,'2019-01-03 22:26:27','2019-01-07 14:17:58'),(13,12,1,1,'2019-01-03 22:26:27','2019-01-06 15:29:39'),(14,13,1,1,'2019-01-03 22:26:27','2019-01-06 15:29:40'),(15,14,1,1,'2019-01-03 22:26:27','2019-01-06 15:29:40'),(16,15,1,1,'2019-01-03 22:26:27','2019-01-06 15:29:40'),(17,16,1,1,'2019-01-03 22:26:27','2019-01-06 15:29:40'),(18,17,1,1,'2019-01-03 22:26:27','2019-01-06 13:04:36'),(19,18,1,1,'2019-01-03 22:26:27','2019-01-06 13:12:30'),(20,19,1,1,'2019-01-03 22:26:27','2019-01-06 13:45:49'),(21,20,1,1,'2019-01-03 22:26:27','2019-01-06 13:40:50');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tranxmenus`
--

LOCK TABLES `tranxmenus` WRITE;
/*!40000 ALTER TABLE `tranxmenus` DISABLE KEYS */;
INSERT INTO `tranxmenus` (`id`, `roleId`, `menuId`, `createdBy`, `createdAt`, `updatedAt`) VALUES (1,1,1,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(2,1,2,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(3,1,3,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(4,1,4,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(5,1,5,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(6,1,6,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(7,1,7,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(8,1,8,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(9,1,9,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(10,1,10,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(11,3,4,'system','2019-01-05 05:37:53','2019-01-05 05:37:54'),(12,3,8,'system','2019-01-05 05:38:19','2019-01-05 05:38:20'),(13,4,10,'system','2019-01-05 05:38:45','2019-01-05 05:38:46'),(14,4,1,'system','2019-01-05 05:39:04','2019-01-05 05:39:05'),(15,3,1,'system','2019-01-05 05:39:21','2019-01-05 05:39:22');
/*!40000 ALTER TABLE `tranxmenus` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `employee_code`, `gender`, `username`, `email`, `mobile`, `fullname`, `dateOfbirth`, `employed_date`, `photo_path`, `password`, `firstlogin`, `enabled`, `createdAt`, `updatedAt`, `roleId`) VALUES (18,'ee3842d8-11e7-439f-b4bc-396da4f76b16','M','admin','sayyalinh@gmail.com','02055588857','Soulisack SAYYALINH','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$GtFwDQuvYT2QoxsLCMosCOURqipZIl6ON1fPRA2mOa/GaDSFsmf2i',0,1,'2018-12-29 07:38:10','2018-12-29 07:38:10',1),(20,'1dd7182c-3d42-4da7-a2d9-5baee070e25d','F','pathana','pathana@gmail.com','03056789333','Pathana SAYYALINH','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$t9YBEPj7piRJp41cFAiGoOI7Q9oekHMsY2nb2K9iyN1px9rVvyq92',0,1,'2018-12-29 08:55:23','2018-12-29 08:57:07',1),(21,'dfdb7af2-6c20-425a-8c56-4f71ae205269','F','chef-01','chef-01@gmail.com','02055588856','chef-01','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$txQvHa0ZFb7G8fjVSdtErOpYU4DM7PjrxNZ2GaRT5hgN/Qnqrrr/u',0,1,'2019-01-01 10:42:46','2019-01-01 10:42:46',4),(22,'4c3843cb-21a2-4ac5-9afc-fecd2263b671','F','chef-02','chef-02@gmail.com','02055588855','chef-02','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$lz6RrvRSMq6sPVgRGnqjOOaBzTTcZn9ldPab0/dUISnjq3KNO.RSu',0,1,'2019-01-01 10:43:02','2019-01-01 10:43:02',4),(23,'d18d3525-9295-4f5d-a178-51ab08c1a229','F','test01','test01@gmail.com','02055588852','test01','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$3998wrUtysUg4heBV0t7Tu1bk8mb8NrjbeRpaw/npnUju1DFkuaQm',1,1,'2019-01-05 05:36:28','2019-01-05 05:36:28',3);
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

-- Dump completed on 2019-01-07 21:25:07
