-- MySQL dump 10.17  Distrib 10.3.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: letterp
-- ------------------------------------------------------
-- Server version	10.3.11-MariaDB-1:10.3.11+maria~cosmic

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
INSERT INTO `companies` VALUES (1,'LETTER-P','LETTER-P','2018-12-29 11:14:53','2018-12-29 11:14:53');
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
INSERT INTO `customers` VALUES (1,'AAAAAAAAAA','M','ຊາຍ','2019-01-03 16:00:02','dongdok','02055588857','sayyalinh@gmail.com','non','2019-01-03 16:00:28',1,'2019-01-03 16:00:33','2019-01-03 16:00:35'),(2,'BBBBBBBBBB','F','ຍິງ','2019-01-06 15:15:46','dongdok','02055599955','sayyalinh@letter-p.com','non','2019-01-06 15:16:17',1,'2019-01-06 15:16:34','2019-01-06 15:16:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (50,'ເຂົ້າ ຜັດ','Fire rice',0,'http://139.59.216.238:5005/images/uploads/foods/1027.jpg',1,0,0,'418',1,'2019-01-01 02:03:05','2019-01-01 02:03:05',18,1,1),(53,'ກະເພົາ','ka-phao',0,'http://139.59.216.238:5005/images/uploads/foods/702669572.jpg',1,0,0,'418',1,'2019-01-04 04:56:32','2019-01-04 04:56:32',18,1,1),(54,'ງົວ','pork',53,'http://139.59.216.238:5005/images/uploads/foods/702669572.jpg',1,13000,18000,'418',1,'2019-01-04 04:57:03','2019-01-04 04:57:03',18,1,0),(55,'ທະເລ','seafood',53,'http://139.59.216.238:5005/images/uploads/foods/702669572.jpg',1,13000,18000,'418',1,'2019-01-04 04:57:18','2019-01-04 04:57:18',18,1,0),(56,'ທະເລ','Sea food',50,'http://139.59.216.238:5005/images/uploads/foods/1027.jpg',1,13000,18000,'418',1,'2019-01-04 16:30:54','2019-01-04 16:30:54',18,1,0),(60,'ໂກໂກ້ ນົມສົດ','ice cocoa',0,'http://139.59.216.238:5005/images/uploads/foods/coco.png',9,10000,13000,'418',1,'2019-01-04 16:53:19','2019-01-04 18:08:13',18,2,0),(61,'ນົມສົດ ຄາຣາເມລ','ice caramel',0,'http://139.59.216.238:5005/images/uploads/foods/caramel.png',9,10000,13000,'418',1,'2019-01-04 16:57:38','2019-01-04 16:57:38',18,2,0),(62,'ເຜືອກຫອມນົມສົດ','taro milk',0,'http://139.59.216.238:5005/images/uploads/foods/taro7.png',9,10000,13000,'418',1,'2019-01-04 16:59:07','2019-01-04 16:59:07',18,2,0),(63,'ຊາຂຽວ','green tea',0,'http://139.59.216.238:5005/images/uploads/foods/greentea2.png',9,10000,13000,'418',1,'2019-01-04 17:00:16','2019-01-04 17:00:16',18,2,0),(64,'ນົມສົດກ້ວຍຫອມ','fresh milk',0,'http://139.59.216.238:5005/images/uploads/foods/bananamilk.png',9,10000,13000,'418',1,'2019-01-04 17:03:28','2019-01-04 17:03:28',18,2,0),(65,'ດັບໂບ້ ຊ໋ອກໂກ້','double choco',0,'http://139.59.216.238:5005/images/uploads/foods/cocoFrap7.png',10,13000,17000,'418',1,'2019-01-04 17:05:47','2019-01-04 17:05:47',18,2,0),(66,'ຊາຂຽວປັ່ນ','green tea Frap',0,'http://139.59.216.238:5005/images/uploads/foods/greenteaFrap6.png',10,13000,17000,'418',1,'2019-01-04 17:06:46','2019-01-04 17:06:46',18,2,0),(67,'ສະຕຣໍເບີຣີ ໂຍເກີສ','strawberry yogurt',0,'http://139.59.216.238:5005/images/uploads/foods/strawfrap7.png',10,13000,17000,'418',1,'2019-01-04 17:07:53','2019-01-04 17:07:53',18,2,0),(68,'ແມັງໂກ້ ໂຍເກີສ','mango yogurt',0,'http://139.59.216.238:5005/images/uploads/foods/mangomilk.png',10,13000,17000,'418',1,'2019-01-04 17:10:31','2019-01-04 17:10:31',18,2,0),(69,'ຊ໋ອກໂກ້ ບລາວນີ້','choco brownie',0,'http://139.59.216.238:5005/images/uploads/foods/cocoFrap6.png',10,13000,17000,'418',1,'2019-01-04 17:12:28','2019-01-04 17:12:28',18,2,0),(70,'ນ້ຳບຣູເບີຣີ','blue berry',0,'http://139.59.216.238:5005/images/uploads/foods/blueberry.png',2,8000,10000,'418',1,'2019-01-04 17:13:41','2019-01-04 17:13:41',18,2,0),(71,'ນ້ຳໝາກນອດ','passion fruit',0,'http://139.59.216.238:5005/images/uploads/foods/passion_resized.gif',2,8000,10000,'418',1,'2019-01-04 17:14:28','2019-01-04 17:14:28',18,2,0),(72,'ນ້ຳອະງຸ່ນ','grape juice',0,'http://139.59.216.238:5005/images/uploads/foods/grape1.png',2,8000,10000,'418',1,'2019-01-04 17:15:21','2019-01-04 17:15:21',18,2,0),(73,'ນ້ຳລີ້ນຈິ່','lychee juice',0,'http://139.59.216.238:5005/images/uploads/foods/lychee1.png',2,8000,10000,'418',1,'2019-01-04 17:16:00','2019-01-04 17:16:00',18,2,0),(74,'ນ້ຳດື່ມ ຫົວເສືອ','water',0,'http://139.59.216.238:5005/images/uploads/foods/la_tigerhead-drinking-water.png',2,2000,3000,'418',1,'2019-01-04 17:17:15','2019-01-04 17:17:15',18,2,0),(75,'ຜັດໄທ','Phat-thai',0,'http://139.59.216.238:5005/images/uploads/foods/phatthai.png',11,0,0,'418',1,'2019-01-05 03:06:03','2019-01-05 03:06:03',18,1,1),(76,'ທະເລ','Sea food',75,'http://139.59.216.238:5005/images/uploads/foods/phatthai.png',11,13000,18000,'418',1,'2019-01-05 03:09:06','2019-01-05 03:09:06',18,1,0),(77,'ສຸກກີ້ນ້ຳ','Suki',0,'http://139.59.216.238:5005/images/uploads/foods/baannoi-sukee35.jpg',11,0,0,'418',1,'2019-01-05 03:10:52','2019-01-05 03:10:52',18,1,1),(78,'ໝູ','pork',77,'http://139.59.216.238:5005/images/uploads/foods/suki.png',11,10000,16000,'418',1,'2019-01-05 03:11:53','2019-01-05 03:11:53',18,1,0),(79,'ສະປາເກັດຕີ້','spaghetti',0,'http://139.59.216.238:5005/images/uploads/foods/spagettytomato.png',12,0,0,'418',1,'2019-01-05 03:13:12','2019-01-05 03:13:12',18,1,1),(80,'ຊ໋ອດໝາກເລັ່ນ','tomato',79,'http://139.59.216.238:5005/images/uploads/foods/spagettytomato.png',12,10000,18000,'418',1,'2019-01-05 03:14:44','2019-01-05 03:14:44',18,1,0),(81,'ກະເພົາ ທະເລ','Ka-phao seafood',79,'http://139.59.216.238:5005/images/uploads/foods/spa2.png',12,13000,20000,'418',1,'2019-01-05 03:16:52','2019-01-05 03:16:52',18,1,0),(82,'ດາໂບນ່າຣ່າ ໝູ','carbo pork',79,'http://139.59.216.238:5005/images/uploads/foods/spagettispicy.png',12,10000,18000,'418',1,'2019-01-05 03:18:57','2019-01-05 03:18:57',18,1,0),(83,'ດາໂບນ່າຣ່າ ທະເລ','carbo seafood',79,'http://139.59.216.238:5005/images/uploads/foods/spagettispicy.png',12,13000,20000,'418',1,'2019-01-05 03:19:41','2019-01-05 03:19:41',18,1,0),(84,'ກະເພົາ','-',79,'http://139.59.216.238:5005/images/uploads/foods/spa.png',12,10000,18000,'418',1,'2019-01-05 03:20:29','2019-01-05 03:20:29',18,1,0),(85,'ກະເພົາ ທະເລ','-',79,'http://139.59.216.238:5005/images/uploads/foods/spa.png',12,13000,20000,'418',1,'2019-01-05 03:21:39','2019-01-05 03:21:39',18,1,0),(86,'ມັກກະໂລນີ','macaroni',0,'http://139.59.216.238:5005/images/uploads/foods/img_6779.jpg',11,0,0,'418',1,'2019-01-05 03:24:20','2019-01-05 03:24:20',18,1,1),(87,'ຊ໋ອດແດງ','tomato',86,'http://139.59.216.238:5005/images/uploads/foods/img_6779.jpg',11,10000,16000,'418',1,'2019-01-05 03:25:19','2019-01-05 03:25:19',18,1,0),(88,'ກະເພົາ ໄກ່','Ka-phao chick',86,'http://139.59.216.238:5005/images/uploads/foods/photo.jpg',11,10000,16000,'418',1,'2019-01-05 03:27:28','2019-01-05 03:27:28',18,1,0),(89,'ກະເພົາ ໝູ','Ka-phao pork',86,'http://139.59.216.238:5005/images/uploads/foods/photo.jpg',11,10000,16000,'418',1,'2019-01-05 03:27:57','2019-01-05 03:27:57',18,1,0),(90,'ຂີ້ເມົາ ໝູ','khee-mao pork',86,'http://139.59.216.238:5005/images/uploads/foods/ny3p2uf7ft4Wup2C4JR-o.jpg',11,10000,16000,'418',1,'2019-01-05 03:30:02','2019-01-05 03:30:02',18,1,0),(91,'ຂີ້ເມົາ ໄກ່','khee-mao chick',86,'http://139.59.216.238:5005/images/uploads/foods/ny3p2uf7ft4Wup2C4JR-o.jpg',11,10000,16000,'418',1,'2019-01-05 03:30:48','2019-01-05 03:30:48',18,1,0),(92,'ຂີ້ເມົາ ທະເລ','khee-mao seafood',86,'http://139.59.216.238:5005/images/uploads/foods/ny3p2uf7ft4Wup2C4JR-o.jpg',11,13000,18000,'418',1,'2019-01-05 03:32:03','2019-01-05 03:32:03',18,1,0),(93,'ໄກ່','chick',75,'http://139.59.216.238:5005/images/uploads/foods/ID_1224_56f8d6cdedc6b.jpg',11,10000,16000,'418',1,'2019-01-05 03:33:17','2019-01-05 03:33:17',18,1,0),(94,'ໝູ','pork',75,'http://139.59.216.238:5005/images/uploads/foods/ID_1224_56f8d6cdedc6b.jpg',11,10000,16000,'418',1,'2019-01-05 03:33:52','2019-01-05 03:33:52',18,1,0),(95,'ເສັ້ນໃຫຍ່','noodle',0,'http://139.59.216.238:5005/images/uploads/foods/hqdefault.jpg',11,0,0,'418',1,'2019-01-05 03:35:53','2019-01-05 03:35:53',18,1,1),(96,'ລາດໜ້າ ໝູ','pork',95,'http://139.59.216.238:5005/images/uploads/foods/hqdefault.jpg',11,10000,16000,'418',1,'2019-01-05 03:36:45','2019-01-05 03:36:45',18,1,0),(97,'ລາດໜ້າ ໄກ່','chick',95,'http://139.59.216.238:5005/images/uploads/foods/hqdefault.jpg',11,10000,16000,'418',1,'2019-01-05 03:37:24','2019-01-05 03:37:24',18,1,0),(98,'ລາດໜ້າ ທະເລ','sea food',95,'http://139.59.216.238:5005/images/uploads/foods/hqdefault.jpg',11,13000,18000,'418',1,'2019-01-05 03:38:14','2019-01-05 03:38:14',18,1,0),(99,'ຜັດຊີອີ້ວ ໝູ','pork',95,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault.jpg',11,10000,16000,'418',1,'2019-01-05 03:39:35','2019-01-05 03:39:35',18,1,0),(100,'ຜັດຊີອີ້ວ ໄກ່','chick',95,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault.jpg',11,10000,16000,'418',1,'2019-01-05 03:40:12','2019-01-05 03:40:12',18,1,0),(101,'ຜັດຊີອີ້ວ ທະເລ','sea food',95,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault.jpg',11,13000,18000,'418',1,'2019-01-05 03:41:07','2019-01-05 03:41:07',18,1,0),(102,'ໝີ່ກອບລາດໜ້າ','Mi-krob',0,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (1).jpg',11,0,0,'418',1,'2019-01-05 03:42:31','2019-01-05 03:42:31',18,1,1),(103,'ໝູ','pork',102,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (1).jpg',11,10000,16000,'418',1,'2019-01-05 03:43:05','2019-01-05 03:43:05',18,1,0),(104,'ໄກ່','chick',102,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (1).jpg',11,10000,16000,'418',1,'2019-01-05 03:43:31','2019-01-05 03:43:31',18,1,0),(105,'ທະເລ','Sea food',102,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (1).jpg',11,13000,18000,'418',1,'2019-01-05 03:43:58','2019-01-05 03:43:58',18,1,0),(106,'ສຸກກິ້ ແຫ້ງ','suki',0,'http://139.59.216.238:5005/images/uploads/foods/suki.jpg',11,0,0,'418',1,'2019-01-05 03:46:43','2019-01-05 03:46:43',18,1,1),(107,'ທະເລ','Sea food',106,'http://139.59.216.238:5005/images/uploads/foods/suki.jpg',11,13000,18000,'418',1,'2019-01-05 03:47:14','2019-01-05 03:47:14',18,1,0),(108,'ໝູ','pork',106,'http://139.59.216.238:5005/images/uploads/foods/suki.jpg',11,10000,16000,'418',1,'2019-01-05 03:47:54','2019-01-05 03:47:54',18,1,0),(109,'ໄກ່','chick',106,'http://139.59.216.238:5005/images/uploads/foods/suki.jpg',11,10000,16000,'418',1,'2019-01-05 03:48:24','2019-01-05 03:48:24',18,1,0),(110,'ທະເລ','Sea food',77,'http://139.59.216.238:5005/images/uploads/foods/suki.png',11,13000,18000,'418',1,'2019-01-05 03:49:50','2019-01-05 03:49:50',18,1,0),(111,'ໄກ່','chick',77,'http://139.59.216.238:5005/images/uploads/foods/suki.png',11,10000,16000,'418',1,'2019-01-05 03:50:29','2019-01-05 03:50:29',18,1,0),(112,'ໄກ່','chick',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:17:24','2019-01-05 04:17:24',18,1,0),(113,'ໝູ','pork',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:17:59','2019-01-05 04:17:59',18,1,0),(114,'ຂີ້ເມົາ ໄກ່','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:19:24','2019-01-05 04:19:24',18,1,0),(115,'ຂີ້ເມົາ ໝູ','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:20:31','2019-01-05 04:20:31',18,1,0),(116,'ຂີ້ເມົາ ທະເລ','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,13000,18000,'418',1,'2019-01-05 04:21:53','2019-01-05 04:21:53',18,1,0),(117,'ກະເພົາ ໝູ','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:23:07','2019-01-05 04:23:07',18,1,0),(118,'ກະເພົາ ໄກ່','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:23:30','2019-01-05 04:23:30',18,1,0),(119,'ກະເພົາ ທະເລ','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,13000,18000,'418',1,'2019-01-05 04:24:16','2019-01-05 04:24:16',18,1,0),(120,'ກະເພົາກອບ ໝູ','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:25:28','2019-01-05 04:25:28',18,1,0),(121,'ກະເພົາກອບ ໄກ່','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,10000,16000,'418',1,'2019-01-05 04:31:06','2019-01-05 04:31:06',18,1,0),(122,'ກະເພົາກອບ ທະເລ','-',50,'http://139.59.216.238:5005/images/uploads/foods/fried-rice.jpg',1,13000,18000,'418',1,'2019-01-05 04:31:50','2019-01-05 04:31:50',18,1,0),(123,'ເຂົ້າ ຜັກກາດນາ','-',0,'http://139.59.216.238:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,0,0,'418',1,'2019-01-05 04:33:23','2019-01-05 04:33:23',18,1,1),(124,'ໝູ','pork',123,'http://139.59.216.238:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,10000,16000,'418',1,'2019-01-05 04:33:52','2019-01-05 04:33:52',18,1,0),(125,'ໄກ່','chick',123,'http://139.59.216.238:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,10000,16000,'418',1,'2019-01-05 04:34:14','2019-01-05 04:34:14',18,1,0),(126,'ທະເລ','Sea food',123,'http://139.59.216.238:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,13000,18000,'418',1,'2019-01-05 04:34:37','2019-01-05 04:34:37',18,1,0),(127,'ເຂົ້າ ຖົ່ວລັນເຕົາຜັດ','-',0,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,0,0,'418',1,'2019-01-05 04:36:35','2019-01-05 04:36:35',18,1,1),(128,'ໝູ','pork',127,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,10000,16000,'418',1,'2019-01-05 04:36:56','2019-01-05 04:36:56',18,1,0),(129,'ໄກ່','chick',127,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,10000,16000,'418',1,'2019-01-05 04:37:18','2019-01-05 04:37:18',18,1,0),(130,'ທະເລ','Sea food',127,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,13000,18000,'418',1,'2019-01-05 04:37:43','2019-01-05 04:37:43',18,1,0),(131,'ເຂົ້າມັນໄກ່','khao-mun-kai',0,'http://139.59.216.238:5005/images/uploads/foods/download.jpeg',1,10000,16000,'418',1,'2019-01-05 04:39:21','2019-01-05 04:39:21',18,1,0),(132,'ເຂົ້າມັນໄກ່ ກອບ','khao-mun-kai-krob',0,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (2).jpg',1,10000,16000,'418',1,'2019-01-05 04:40:06','2019-01-05 04:40:06',18,1,0),(133,'ເຂົ້າໝູ ພິກໄທດຳ','pik-thai-dumm',0,'http://139.59.216.238:5005/images/uploads/foods/tmp1_133058_20161015_21333570.JPG',1,10000,16000,'418',1,'2019-01-05 04:41:38','2019-01-05 04:41:38',18,1,0),(134,'ຂິງໄກ່','khing-kai',50,'http://139.59.216.238:5005/images/uploads/foods/tmp1_133058_20161015_21333570.JPG',1,10000,16000,'418',1,'2019-01-05 04:42:10','2019-01-05 04:42:10',18,1,0),(135,'ເຂົ້າ ໝູທອດກະທຽມ','pork with garlic',0,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (3).jpg',1,10000,16000,'418',1,'2019-01-05 04:43:43','2019-01-05 04:43:43',18,1,0),(136,'ເຂົ້າ ໄຂ່ຈຽວ ໝູສັບ','fire egg pork',0,'http://139.59.216.238:5005/images/uploads/foods/1442885991-imagejpeg-o.jpg',1,10000,16000,'418',1,'2019-01-05 04:44:46','2019-01-05 04:44:46',18,1,0),(137,'ຜັກບົ້ງໄຟແດງ','phuk-bong-faideng',50,'http://139.59.216.238:5005/images/uploads/foods/download (2).jpeg',1,10000,16000,'418',1,'2019-01-05 04:46:27','2019-01-05 04:46:27',18,1,0),(138,'ເຟຣນຟາຍ','French fries',0,'http://139.59.216.238:5005/images/uploads/foods/69b67c8f33cfd77dda368f90da3450a0.png',4,5000,9000,'418',1,'2019-01-05 04:48:16','2019-01-05 04:48:16',18,1,0),(139,'ໄກ່ທອດ','fries chicken',0,'http://139.59.216.238:5005/images/uploads/foods/2cb0f96c970652f59310d581dc21b497.png',4,7000,10000,'418',1,'2019-01-05 04:49:32','2019-01-05 04:49:32',18,1,0),(140,'ທອດລຸກຊີ້ນ ຮັອດດອກ','meatball',0,'http://139.59.216.238:5005/images/uploads/foods/57fa34df8e7c0_1024.jpg',4,7000,12000,'418',1,'2019-01-05 04:50:46','2019-01-05 04:50:46',18,1,0),(141,'ນັກເກັດໄກ່','chick nuggets',0,'http://139.59.216.238:5005/images/uploads/foods/nudgetkai1.png',4,10000,15000,'418',1,'2019-01-05 04:52:31','2019-01-05 04:52:31',18,1,0),(142,'ໄກ່ສະຕິກ','chick stick',0,'http://139.59.216.238:5005/images/uploads/foods/04849d5e5b88f8b1703370d89512bead.png',4,10000,15000,'418',1,'2019-01-05 04:53:56','2019-01-05 04:53:56',18,1,0),(143,'ທອດໄກ່ຈໍ້','kai-jor',0,'http://139.59.216.238:5005/images/uploads/foods/download (3).jpeg',4,10000,15000,'418',1,'2019-01-05 04:55:10','2019-01-05 04:55:10',18,1,0),(144,'ຟິຊສະຕິກ','fish stick',0,'http://139.59.216.238:5005/images/uploads/foods/fish-stick-png-1.png',4,10000,15000,'418',1,'2019-01-05 04:56:08','2019-01-05 04:56:08',18,1,0),(145,'ປີກໄກ່ ທອດນ້ຳປາ','wing-nampa',0,'http://139.59.216.238:5005/images/uploads/foods/maxresdefault (4).jpg',4,13000,20000,'418',1,'2019-01-05 04:57:48','2019-01-05 04:57:48',18,1,0),(146,'ປາດອນລິ໊ ຊຸບແປ້ງທອດ','dolly fires',0,'http://139.59.216.238:5005/images/uploads/foods/635749-img-1349336040-1.jpg',4,13000,20000,'418',1,'2019-01-05 04:59:16','2019-01-05 04:59:16',18,1,0),(147,'ປີກໄກ່ທອດ ທາລິຢາກິ','wing-teriyaki',0,'http://139.59.216.238:5005/images/uploads/foods/hqdefault (1).jpg',4,18000,25000,'418',1,'2019-01-05 05:01:04','2019-01-05 05:01:04',18,1,0),(148,'ປີກໄກ່ທອດ ບາບີຄິວ','wing-BBQ',0,'http://139.59.216.238:5005/images/uploads/foods/download (4).jpeg',4,18000,25000,'418',1,'2019-01-05 05:02:03','2019-01-05 05:02:03',18,1,0),(149,'ຕຳໝາກຮຸ່ງ','papaya salad',0,'http://139.59.216.238:5005/images/uploads/foods/702669572.jpg',5,8000,12000,'418',1,'2019-01-05 09:12:08','2019-01-09 03:00:26',18,1,0),(150,'ຕຳເຂົ້າປຸ້ນ','tum khao pun',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1217.JPG',5,8000,12000,'418',1,'2019-01-08 02:45:45','2019-01-08 02:45:45',18,1,0),(151,'ຕຳຕ່ອນ','tum ton',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1218.JPG',5,10000,15000,'418',1,'2019-01-08 02:49:52','2019-01-08 02:49:52',18,1,0),(152,'ຕຳມົ້ວ','tum moua',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1218.JPG',5,8000,15000,'418',1,'2019-01-08 02:51:00','2019-01-08 02:51:00',18,1,0),(153,'ຕຳໝີ່ໄວໄວ','tum vai vai',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1218.JPG',5,8000,15000,'418',1,'2019-01-08 02:51:45','2019-01-08 02:51:45',18,1,0),(154,'ຕຳທະເລ','tum tha le',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1218.JPG',5,20000,28000,'418',1,'2019-01-08 02:52:34','2019-01-08 02:52:34',18,1,0),(155,'ຕຳຫອຍແຄງ','tum hoy khaeng',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1217.JPG',5,20000,28000,'418',1,'2019-01-08 02:53:17','2019-01-08 02:53:17',18,1,0),(156,'ຕຳປູ','tum poo',0,'http://139.59.216.238:5005//images/uploads/foods/IMG_1218.JPG',5,20000,28000,'418',1,'2019-01-08 02:53:58','2019-01-08 02:53:58',18,1,0),(157,'ຍຳປາມຶກ','yum pa muek',0,'http://139.59.216.238:5005//images/uploads/foods/photo (1).jpg',13,20000,28000,'418',1,'2019-01-08 02:57:07','2019-01-08 02:57:07',18,1,0),(158,'ຍຳລວມມິດທະເລ','yum tha le luam mit',0,'http://139.59.216.238:5005//images/uploads/foods/photo (1).jpg',13,20000,28000,'418',1,'2019-01-08 02:57:44','2019-01-08 02:57:44',18,1,0),(159,'ຍຳເສັ້ນລ້ອນ','yum sen lon',0,'http://139.59.216.238:5005//images/uploads/foods/photo (1).jpg',13,15000,22000,'418',1,'2019-01-08 02:58:50','2019-01-08 02:58:50',18,1,0),(160,'ຍຳໄວໄວ','yum vai vai',0,'http://139.59.216.238:5005//images/uploads/foods/maxresdefault (5).jpg',13,10000,18000,'418',1,'2019-01-08 02:59:55','2019-01-08 02:59:55',18,1,0),(161,'ເສົາກ້ວຍ',NULL,0,'http://139.59.216.238:5005//images/uploads/foods/56240fcc139edb9d54fd5639e2527d6b.png',14,1000,2000,'418',1,'2019-01-08 10:03:17','2019-01-08 10:03:17',18,2,0),(162,'ພຸດດິງ',NULL,0,'http://139.59.216.238:5005//images/uploads/foods/f7e8bdff960e63896f7446c9a458d009.png',14,1000,2000,'418',1,'2019-01-08 10:04:39','2019-01-08 10:04:39',18,2,0),(163,'ໄກ່',NULL,53,'http://139.59.216.238:5005//images/uploads/foods/kaphao.png',1,10000,16000,'418',1,'2019-01-08 13:34:25','2019-01-08 13:34:25',18,1,0),(164,'ບຮາວນີ່','Brownie',0,'http://139.59.216.238:5005//images/uploads/foods/brownie.png',14,2000,4000,'418',1,'2019-01-09 03:07:23','2019-01-09 03:07:23',18,2,0),(165,'ວິປຄຮີມ','wip cream',0,'http://139.59.216.238:5005//images/uploads/foods/wipcream.png',14,2000,4000,'418',1,'2019-01-09 03:08:40','2019-01-09 03:08:40',18,2,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtypes`
--

LOCK TABLES `foodtypes` WRITE;
/*!40000 ALTER TABLE `foodtypes` DISABLE KEYS */;
INSERT INTO `foodtypes` VALUES (1,'FOOD','Food','ອາຫານ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(2,'DRNK','DRINK','ເຄື່ອງດື່ມ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(4,'SNCK','Snack','ອາຫານທອດ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(5,'SLD','Slard','ຕຳ','2019-01-01 01:51:54','2019-01-01 01:51:54'),(9,'fresh-milk','fresh milk','ນົມສົດ','2019-01-04 16:47:55','2019-01-04 16:47:55'),(10,'frappe','frappe','ປັ່ນ','2019-01-04 17:04:21','2019-01-04 17:04:21'),(11,'pasta','pasta','ປະເພດເສັ້ນ','2019-01-05 03:03:50','2019-01-05 03:03:50'),(12,'spaghetti','spaghetti','spaghetti','2019-01-05 03:04:23','2019-01-05 03:04:23'),(13,'yum','yum','ຍຳ','2019-01-08 02:56:43','2019-01-08 02:56:43'),(14,'toping','toping','toping','2019-01-08 10:02:58','2019-01-08 10:02:58');
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
INSERT INTO `kitchens` VALUES (1,'kitchen001','ຫ້ອງຄົວນອກ',0,'2019-01-01 01:52:32','2019-01-01 01:52:32'),(2,'kitchen002','ຫ້ອງຄົວໃນ',0,'2019-01-01 01:52:32','2019-01-01 01:52:32');
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
INSERT INTO `menus` VALUES (1,'Home','Home','/','home',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(2,'Sales','Sales','sale','shopping_cart',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(3,'Terminals','Terminals','terminal','dns',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(4,'POS','POS','pos','credit_card',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(5,'Food','Food','food','fastfood',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(6,'Reports','Reports','report','report',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(7,'Administator','Administator','administrator','settings',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(8,'Order Tracking','Order Tracking','orders','done',1,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(9,'Users management','Users management','users','verified_user',0,'2018-12-30 16:43:20','2018-12-30 16:43:20'),(10,'Kitchen monitor','Kitchen monitor','kitchenmon','kitchen',1,'2018-12-30 16:43:20','2018-12-30 16:43:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (17,161,117,'ເຂົ້າ ຜັດ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-07 18:01:40','2019-01-07 18:01:40'),(18,161,103,'ໝີ່ກອບລາດໜ້າ - ໝູ',1,16000,16000,NULL,'2019-01-07 18:01:40','2019-01-07 18:01:40'),(19,161,72,'ນ້ຳອະງຸ່ນ',1,10000,10000,NULL,'2019-01-07 18:01:40','2019-01-07 18:01:40'),(20,162,78,'ສຸກກີ້ນ້ຳ - ໝູ',1,16000,16000,NULL,'2019-01-07 18:03:01','2019-01-07 18:03:01'),(21,162,81,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-07 18:03:01','2019-01-07 18:03:01'),(22,162,71,'ນ້ຳໝາກນອດ',1,10000,10000,NULL,'2019-01-07 18:03:01','2019-01-07 18:03:01'),(23,162,73,'ນ້ຳລີ້ນຈິ່',1,10000,10000,NULL,'2019-01-07 18:03:01','2019-01-07 18:03:01'),(24,163,110,'ສຸກກີ້ນ້ຳ - ທະເລ',1,18000,18000,NULL,'2019-01-07 18:10:33','2019-01-07 18:10:33'),(25,163,83,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ທະເລ',1,20000,20000,NULL,'2019-01-07 18:10:33','2019-01-07 18:10:33'),(26,163,72,'ນ້ຳອະງຸ່ນ',1,10000,10000,NULL,'2019-01-07 18:10:33','2019-01-07 18:10:33'),(27,163,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-07 18:10:33','2019-01-07 18:10:33'),(28,164,120,'ເຂົ້າ ຜັດ - ກະເພົາກອບ ໝູ',1,16000,16000,NULL,'2019-01-07 18:13:48','2019-01-07 18:13:48'),(29,164,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-07 18:13:48','2019-01-07 18:13:48'),(30,165,118,'ເຂົ້າ ຜັດ - ກະເພົາ ໄກ່',1,16000,16000,NULL,'2019-01-08 00:36:25','2019-01-08 00:36:25'),(31,166,122,'ເຂົ້າ ຜັດ - ກະເພົາກອບ ທະເລ',1,18000,18000,NULL,'2019-01-08 00:40:33','2019-01-08 00:40:33'),(32,167,71,'ນ້ຳໝາກນອດ',2,10000,20000,NULL,'2019-01-08 00:41:26','2019-01-08 00:41:26'),(33,167,70,'ນ້ຳບຣູເບີຣີ',1,10000,10000,NULL,'2019-01-08 00:41:26','2019-01-08 00:41:26'),(34,167,72,'ນ້ຳອະງຸ່ນ',1,10000,10000,NULL,'2019-01-08 00:41:26','2019-01-08 00:41:26'),(35,167,73,'ນ້ຳລີ້ນຈິ່',1,10000,10000,NULL,'2019-01-08 00:41:26','2019-01-08 00:41:26'),(36,168,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,NULL,'2019-01-08 00:46:09','2019-01-08 00:46:09'),(37,169,115,'ເຂົ້າ ຜັດ - ຂີ້ເມົາ ໝູ',1,16000,16000,NULL,'2019-01-08 01:22:28','2019-01-08 01:22:28'),(38,170,112,'ເຂົ້າ ຜັດ - ໄກ່',1,16000,16000,NULL,'2019-01-08 02:23:32','2019-01-08 02:23:32'),(39,171,54,'ກະເພົາ - ງົວ',1,18000,18000,NULL,'2019-01-08 02:27:03','2019-01-08 02:27:03'),(40,172,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,NULL,'2019-01-08 02:38:13','2019-01-08 02:38:13'),(41,173,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,'ບໍ່ເຜັດ','2019-01-08 02:40:13','2019-01-08 02:40:13'),(42,174,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,NULL,'2019-01-08 03:00:19','2019-01-08 03:00:19'),(43,175,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,'ບໍ່ເຜັດ','2019-01-08 03:01:47','2019-01-08 03:01:47'),(44,176,157,'ຍຳປາມຶກ',1,28000,28000,NULL,'2019-01-08 03:06:50','2019-01-08 03:06:50'),(45,177,70,'ນ້ຳບຣູເບີຣີ',1,10000,10000,NULL,'2019-01-08 03:28:44','2019-01-08 03:28:44'),(46,178,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,NULL,'2019-01-08 03:56:35','2019-01-08 03:56:35'),(47,179,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,NULL,'2019-01-08 04:45:15','2019-01-08 04:45:15'),(48,179,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-08 04:45:15','2019-01-08 04:45:15'),(49,179,118,'ເຂົ້າ ຜັດ - ກະເພົາ ໄກ່',1,16000,16000,NULL,'2019-01-08 04:45:15','2019-01-08 04:45:15'),(50,179,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',1,18000,18000,NULL,'2019-01-08 04:45:15','2019-01-08 04:45:15'),(51,180,83,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ທະເລ',2,20000,40000,NULL,'2019-01-08 04:52:27','2019-01-08 04:52:27'),(52,180,98,'ເສັ້ນໃຫຍ່ - ລາດໜ້າ ທະເລ',1,18000,18000,NULL,'2019-01-08 04:52:27','2019-01-08 04:52:27'),(53,180,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-08 04:52:27','2019-01-08 04:52:27'),(54,180,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',1,18000,18000,NULL,'2019-01-08 04:52:27','2019-01-08 04:52:27'),(55,180,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 04:52:27','2019-01-08 04:52:27'),(56,181,60,'ໂກໂກ້ ນົມສົດ',2,13000,26000,NULL,'2019-01-08 05:18:12','2019-01-08 05:18:12'),(57,181,71,'ນ້ຳໝາກນອດ',1,10000,10000,NULL,'2019-01-08 05:18:12','2019-01-08 05:18:12'),(58,181,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-08 05:18:12','2019-01-08 05:18:12'),(59,182,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-08 05:24:50','2019-01-08 05:24:50'),(60,183,98,'ເສັ້ນໃຫຍ່ - ລາດໜ້າ ທະເລ',1,18000,18000,NULL,'2019-01-08 05:28:08','2019-01-08 05:28:08'),(61,183,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 05:28:08','2019-01-08 05:28:08'),(62,183,73,'ນ້ຳລີ້ນຈິ່',1,10000,10000,NULL,'2019-01-08 05:28:08','2019-01-08 05:28:08'),(63,183,99,'ເສັ້ນໃຫຍ່ - ຜັດຊີອີ້ວ ໝູ',1,16000,16000,NULL,'2019-01-08 05:28:08','2019-01-08 05:28:08'),(64,184,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-08 05:34:31','2019-01-08 05:34:31'),(65,185,124,'ເຂົ້າ ຜັກກາດນາ - ໝູ',1,16000,16000,NULL,'2019-01-08 06:40:27','2019-01-08 06:40:27'),(66,185,81,'ສະປາເກັດຕີ້ - ກະເພົາ ທະເລ',1,20000,20000,NULL,'2019-01-08 06:40:27','2019-01-08 06:40:27'),(67,185,82,'ສະປາເກັດຕີ້ - ດາໂບນ່າຣ່າ ໝູ',1,18000,18000,NULL,'2019-01-08 06:40:27','2019-01-08 06:40:27'),(68,185,143,'ທອດໄກ່ຈໍ້',1,15000,15000,NULL,'2019-01-08 06:40:27','2019-01-08 06:40:27'),(69,185,93,'ຜັດໄທ - ໄກ່',1,16000,16000,NULL,'2019-01-08 06:40:27','2019-01-08 06:40:27'),(70,185,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-08 06:40:27','2019-01-08 06:40:27'),(71,186,62,'ເຜືອກຫອມນົມສົດ',1,13000,13000,NULL,'2019-01-08 07:06:35','2019-01-08 07:06:35'),(72,187,63,'ຊາຂຽວ',2,13000,26000,NULL,'2019-01-08 08:33:36','2019-01-08 08:33:36'),(73,188,63,'ຊາຂຽວ',5,13000,65000,NULL,'2019-01-08 08:51:19','2019-01-08 08:51:19'),(74,188,72,'ນ້ຳອະງຸ່ນ',1,10000,10000,NULL,'2019-01-08 08:51:19','2019-01-08 08:51:19'),(75,189,143,'ທອດໄກ່ຈໍ້',1,15000,15000,NULL,'2019-01-08 11:01:16','2019-01-08 11:01:16'),(76,189,117,'ເຂົ້າ ຜັດ - ກະເພົາ ໝູ',1,16000,16000,NULL,'2019-01-08 11:01:16','2019-01-08 11:01:16'),(77,189,134,'ເຂົ້າ ຜັດ - ຂິງໄກ່',1,16000,16000,'ໝູ','2019-01-08 11:01:16','2019-01-08 11:01:16'),(78,189,156,'ຕຳປູ',1,28000,28000,NULL,'2019-01-08 11:01:16','2019-01-08 11:01:16'),(79,189,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 11:01:16','2019-01-08 11:01:16'),(80,190,131,'ເຂົ້າມັນໄກ່',1,16000,16000,NULL,'2019-01-08 11:11:51','2019-01-08 11:11:51'),(81,191,132,'ເຂົ້າມັນໄກ່ ກອບ',2,16000,32000,NULL,'2019-01-08 11:20:43','2019-01-08 11:20:43'),(82,192,80,'ສະປາເກັດຕີ້ - ຊ໋ອດໝາກເລັ່ນ',1,18000,18000,NULL,'2019-01-08 11:37:51','2019-01-08 11:37:51'),(83,193,154,'ຕຳທະເລ',1,28000,28000,NULL,'2019-01-08 12:03:13','2019-01-08 12:03:13'),(84,193,150,'ຕຳເຂົ້າປຸ້ນ',1,12000,12000,NULL,'2019-01-08 12:03:13','2019-01-08 12:03:13'),(85,193,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,NULL,'2019-01-08 12:03:13','2019-01-08 12:03:13'),(86,193,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-08 12:03:13','2019-01-08 12:03:13'),(87,193,60,'ໂກໂກ້ ນົມສົດ',1,13000,13000,NULL,'2019-01-08 12:03:13','2019-01-08 12:03:13'),(88,193,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 12:03:13','2019-01-08 12:03:13'),(89,194,131,'ເຂົ້າມັນໄກ່',2,16000,32000,NULL,'2019-01-08 12:13:35','2019-01-08 12:13:35'),(90,194,150,'ຕຳເຂົ້າປຸ້ນ',1,12000,12000,'ເຜັດ 2 ຫນ່ວຍ ສົ້ມຫວານ','2019-01-08 12:13:35','2019-01-08 12:13:35'),(91,194,74,'ນ້ຳດື່ມ ຫົວເສືອ',2,3000,6000,NULL,'2019-01-08 12:13:35','2019-01-08 12:13:35'),(92,194,64,'ນົມສົດກ້ວຍຫອມ',1,13000,13000,'ນົມສົດເສົາກ້ວຍ','2019-01-08 12:13:35','2019-01-08 12:13:35'),(93,195,76,'ຜັດໄທ - ທະເລ',1,18000,18000,'ກຸ້ງ','2019-01-08 12:32:26','2019-01-08 12:32:26'),(94,195,56,'ເຂົ້າ ຜັດ - ທະເລ',1,18000,18000,'ບໍ່ໃສ່ໄຂ່','2019-01-08 12:32:26','2019-01-08 12:32:26'),(95,195,149,'ຕຳໝາກຮຸ່ງ',1,10000,10000,'ໃສ່ນຳ້ປາ ບໍ່ເຜັດ','2019-01-08 12:32:26','2019-01-08 12:32:26'),(96,195,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-08 12:32:26','2019-01-08 12:32:26'),(97,195,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 12:32:26','2019-01-08 12:32:26'),(98,196,148,'ປີກໄກ່ທອດ ບາບີຄິວ',1,25000,25000,NULL,'2019-01-08 12:34:55','2019-01-08 12:34:55'),(99,197,132,'ເຂົ້າມັນໄກ່ ກອບ',1,16000,16000,NULL,'2019-01-08 12:36:38','2019-01-08 12:36:38'),(100,197,141,'ນັກເກັດໄກ່',1,15000,15000,NULL,'2019-01-08 12:36:38','2019-01-08 12:36:38'),(101,197,110,'ສຸກກີ້ນ້ຳ - ທະເລ',1,18000,18000,NULL,'2019-01-08 12:36:38','2019-01-08 12:36:38'),(102,198,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 12:49:29','2019-01-08 12:49:29'),(103,199,113,'ເຂົ້າ ຜັດ - ໝູ',2,16000,32000,NULL,'2019-01-08 13:10:06','2019-01-08 13:10:06'),(104,199,144,'ຟິຊສະຕິກ',1,15000,15000,NULL,'2019-01-08 13:10:06','2019-01-08 13:10:06'),(105,199,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-08 13:10:06','2019-01-08 13:10:06'),(106,200,112,'ເຂົ້າ ຜັດ - ໄກ່',1,16000,16000,NULL,'2019-01-08 13:12:15','2019-01-08 13:12:15'),(107,200,63,'ຊາຂຽວ',1,13000,13000,NULL,'2019-01-08 13:12:15','2019-01-08 13:12:15'),(108,200,138,'ເຟຣນຟາຍ',1,9000,9000,NULL,'2019-01-08 13:12:15','2019-01-08 13:12:15'),(109,201,61,'ນົມສົດ ຄາຣາເມລ',1,13000,13000,NULL,'2019-01-08 13:50:32','2019-01-08 13:50:32'),(110,201,74,'ນ້ຳດື່ມ ຫົວເສືອ',1,3000,3000,NULL,'2019-01-08 13:50:32','2019-01-08 13:50:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (161,'1d5f0e30-52a9-4ca8-86a2-6e143f8e4c25','2019-01-07 18:01:40','2019-01-07 18:02:27',0,42000,50000,8000,1,4,18,1,'2019-01-07 18:01:40','2019-01-07 18:02:29'),(162,'73a754da-d4ee-4386-9b54-a0f95a614dcf','2019-01-07 18:03:01','2019-01-07 18:09:57',0,56000,60000,4000,1,4,18,2,'2019-01-07 18:03:01','2019-01-07 18:09:58'),(163,'4d7a60cb-e147-45d5-9be6-149633241b44','2019-01-07 18:10:33','2019-01-07 18:11:50',0,61000,70000,9000,11,4,18,1,'2019-01-07 18:10:33','2019-01-07 18:11:51'),(164,'8ebb5956-2450-48e3-ad8c-3d4f25569904','2019-01-07 18:13:48','2019-01-07 18:15:37',0,19000,20000,1000,11,4,18,1,'2019-01-07 18:13:48','2019-01-07 18:15:38'),(165,'6d1da782-0ec7-42bd-bb5a-2fe13ea78a64','2019-01-08 00:36:25','2019-01-08 00:40:13',0,16000,16000,0,14,4,18,2,'2019-01-08 00:36:25','2019-01-08 00:40:14'),(166,'8df224e4-4af5-4f64-9de8-72e34cde99d6','2019-01-08 00:40:33','2019-01-08 00:41:01',0,18000,18000,0,11,4,18,2,'2019-01-08 00:40:33','2019-01-08 00:41:02'),(167,'d1cca6f0-d2b2-495b-bef9-6f2b8dd8a8d9','2019-01-08 00:41:26','2019-01-08 00:46:18',0,50000,50000,0,1,4,18,1,'2019-01-08 00:41:26','2019-01-08 00:46:19'),(168,'97549d00-d900-4c90-8d6d-019a98a6558d','2019-01-08 00:46:09','2019-01-08 00:46:21',0,10000,10000,0,11,4,18,2,'2019-01-08 00:46:09','2019-01-08 00:46:21'),(169,'e089a8d6-c0c9-482f-80f2-88c7bb79a180','2019-01-08 01:22:28','2019-01-08 01:27:46',0,16000,16000,0,1,4,23,2,'2019-01-08 01:22:28','2019-01-08 01:27:47'),(170,'72003381-bd72-4fd2-823f-32b469be5f53','2019-01-08 02:23:32','2019-01-08 02:25:42',0,16000,20000,4000,1,4,25,1,'2019-01-08 02:23:32','2019-01-08 02:25:42'),(171,'b8fbc332-30fc-44a7-9a67-0689640679e4','2019-01-08 02:27:03','2019-01-08 02:27:57',0,18000,20000,2000,11,4,25,1,'2019-01-08 02:27:03','2019-01-08 02:27:58'),(172,'88ba7dcb-955f-42af-bf36-cb700ba6cd8f','2019-01-08 02:38:13','2019-01-08 02:39:26',0,10000,20000,10000,1,4,25,1,'2019-01-08 02:38:13','2019-01-08 02:39:26'),(173,'16d3dc07-7ef2-444e-b141-e3914f8867f3','2019-01-08 02:40:13','2019-01-08 02:40:49',0,10000,10000,0,1,4,25,1,'2019-01-08 02:40:13','2019-01-08 02:40:50'),(174,'c92759e5-e0fe-4acb-b89a-49e8e7b78af1','2019-01-08 03:00:19','2019-01-08 03:00:42',0,10000,20000,10000,1,4,25,1,'2019-01-08 03:00:19','2019-01-08 03:00:43'),(175,'e69f2dc4-6d61-4aeb-879e-144d594fcf35','2019-01-08 03:01:46','2019-01-08 03:02:07',0,10000,20000,10000,1,4,25,2,'2019-01-08 03:01:46','2019-01-08 03:02:08'),(176,'54abd843-b6d8-40fc-bb8a-d00dbb1e97ba','2019-01-08 03:06:50','2019-01-08 03:07:27',0,28000,30000,2000,1,4,18,1,'2019-01-08 03:06:50','2019-01-08 03:07:28'),(177,'2262f9a1-f1fa-455a-83c2-eff8c51bd383','2019-01-08 03:28:44','2019-01-08 03:39:16',0,10000,10000,0,4,4,18,1,'2019-01-08 03:28:44','2019-01-08 03:39:16'),(178,'b1b5b5d3-91ff-426f-ad3e-47a69ed5106d','2019-01-08 03:56:35','2019-01-08 03:58:52',0,10000,10000,0,9,4,18,1,'2019-01-08 03:56:35','2019-01-08 03:58:54'),(179,'6f5966b2-7dbc-44ab-9525-f08d89f48430','2019-01-08 04:45:15','2019-01-08 05:07:59',0,68000,70000,2000,1,2,25,1,'2019-01-08 04:45:15','2019-01-08 05:08:00'),(180,'1069901d-34ef-45ac-8029-c53f3616c3f3','2019-01-08 04:52:27','2019-01-08 05:29:42',0,92000,92000,0,3,2,25,1,'2019-01-08 04:52:27','2019-01-08 05:29:42'),(181,'da052040-a3c4-42c3-a95d-322db4ac70d7','2019-01-08 05:18:12','2019-01-08 05:24:31',0,49000,49000,0,5,2,25,1,'2019-01-08 05:18:12','2019-01-08 05:24:32'),(182,'fd02c889-21fd-4f7d-8960-96ec07ea957f','2019-01-08 05:24:50','2019-01-08 05:25:23',0,13000,13000,0,4,2,25,1,'2019-01-08 05:24:50','2019-01-08 05:25:23'),(183,'9c7bf978-3148-4473-8b9e-3452a39f56be','2019-01-08 05:28:08','2019-01-08 05:39:36',0,47000,50000,3000,6,2,25,1,'2019-01-08 05:28:08','2019-01-08 05:39:37'),(184,'8cd11395-0098-4176-86ac-e57d94bb37bc','2019-01-08 05:34:31','2019-01-08 05:39:48',0,13000,13000,0,7,2,25,1,'2019-01-08 05:34:31','2019-01-08 05:39:48'),(185,'051b432e-6b96-43c6-b749-3bbaf82e172e','2019-01-08 06:40:27','2019-01-08 08:54:47',0,94000,100000,6000,1,2,24,2,'2019-01-08 06:40:27','2019-01-08 08:54:46'),(186,'322f6855-642f-46bf-a8aa-9daa905d3f75','2019-01-08 07:06:35','2019-01-08 07:12:31',0,13000,13000,0,5,2,24,1,'2019-01-08 07:06:35','2019-01-08 07:12:31'),(187,'90af913e-8c47-403f-9554-9ef3ea54bd3f','2019-01-08 08:33:36','2019-01-08 08:54:47',0,26000,100000,74000,1,2,28,1,'2019-01-08 08:33:36','2019-01-08 08:54:47'),(188,'257126ae-48b9-4e9e-b8b2-0fd7d8f70487','2019-01-08 08:51:19','2019-01-08 08:54:48',0,75000,75000,0,3,2,28,2,'2019-01-08 08:51:19','2019-01-08 08:54:48'),(189,'b5aa32e0-1e6e-4189-afc0-3853acc01934','2019-01-08 11:01:16','2019-01-08 11:16:28',0,78000,100000,22000,3,2,28,1,'2019-01-08 11:01:16','2019-01-08 11:16:28'),(190,'bf632800-1f20-47bb-930f-ab0e3d1be214','2019-01-08 11:11:51','2019-01-08 11:21:38',0,16000,16000,0,1,2,28,2,'2019-01-08 11:11:51','2019-01-08 11:21:38'),(191,'d0b1fc0c-a25b-4bec-a5c5-928b49fd74ae','2019-01-08 11:20:43','2019-01-08 11:39:55',0,32000,50000,18000,3,2,28,2,'2019-01-08 11:20:43','2019-01-08 11:39:55'),(192,'69cf74e1-36d9-487e-98c1-f35af37f4247','2019-01-08 11:37:51','2019-01-08 11:43:50',0,18000,100000,82000,1,2,28,2,'2019-01-08 11:37:51','2019-01-08 11:43:49'),(193,'42bd74fd-bb5f-45df-a736-41eb88f70052','2019-01-08 12:03:13','2019-01-08 12:26:50',0,79000,100000,21000,1,2,28,2,'2019-01-08 12:03:13','2019-01-08 12:26:49'),(194,'1ec7c0c8-b2b9-4607-a88e-5a8dc72c016f','2019-01-08 12:13:35','2019-01-08 12:38:30',0,63000,100000,37000,3,2,28,2,'2019-01-08 12:13:35','2019-01-08 12:38:30'),(195,'e92e9e47-bc52-44cf-a23c-a5e82830b826','2019-01-08 12:32:26','2019-01-08 12:56:39',0,65000,100000,35000,1,2,28,2,'2019-01-08 12:32:26','2019-01-08 12:56:39'),(196,'e87b7877-2ab0-4eea-aba4-bee664ddb006','2019-01-08 12:34:55','2019-01-08 12:44:36',0,25000,50000,25000,4,2,28,2,'2019-01-08 12:34:55','2019-01-08 12:44:36'),(197,'ea4cd81a-dabd-446d-8c93-6ce7e9daa222','2019-01-08 12:36:38','2019-01-08 13:05:45',0,49000,49000,0,5,2,28,2,'2019-01-08 12:36:38','2019-01-08 13:05:45'),(198,'a0a03420-a60e-4525-91a6-4955638a406c','2019-01-08 12:49:29','2019-01-08 12:49:52',0,3000,3000,0,3,2,28,2,'2019-01-08 12:49:29','2019-01-08 12:49:53'),(199,'f95a0d56-0ccb-4e40-a102-d68ba51bccdc','2019-01-08 13:10:06','2019-01-08 13:37:54',0,56000,56000,0,1,2,28,1,'2019-01-08 13:10:06','2019-01-08 13:37:55'),(200,'95ac8b4a-6078-4e1b-9a20-e238cd1fe4ef','2019-01-08 13:12:15','2019-01-08 13:37:56',0,38000,100000,62000,3,2,28,2,'2019-01-08 13:12:15','2019-01-08 13:37:56'),(201,'ebdf4ea0-8d07-41ac-b9e8-ac3c7d1a93fa','2019-01-08 13:50:32','2019-01-08 14:59:18',0,16000,100000,84000,1,2,28,1,'2019-01-08 13:50:32','2019-01-08 14:59:18');
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
INSERT INTO `roles` VALUES (1,'admin','administrator',0,'2018-12-28 20:24:08','2018-12-28 20:24:08'),(3,'staff','general staff normal user',0,'2018-12-28 20:25:33','2018-12-28 20:35:12'),(4,'chef-ext','chef-ext',1,'2019-01-01 10:41:43','2019-01-01 10:41:45'),(6,'chef-int','chef-int',2,'2019-01-07 16:42:01','2019-01-07 16:42:03');
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
INSERT INTO `statuses` VALUES (1,'pending at kitchen','kitchen','2019-01-03 22:34:49','2019-01-03 22:34:49'),(2,'finished','completed','2019-01-03 22:35:04','2019-01-03 22:35:04'),(4,'canceled','user','2019-01-05 02:17:37','2019-01-05 02:17:37'),(7,'pending at front','front counter','2019-01-06 22:35:21','2019-01-06 22:35:21');
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
INSERT INTO `tickets` VALUES (1,1,1,1,'2019-01-03 20:25:36','2019-01-08 14:59:18'),(3,2,1,1,'2019-01-03 22:26:27','2019-01-08 13:37:56'),(4,3,1,1,'2019-01-03 22:26:27','2019-01-08 12:44:36'),(5,4,1,1,'2019-01-03 22:26:27','2019-01-08 13:05:45'),(6,5,1,1,'2019-01-03 22:26:27','2019-01-08 05:39:37'),(7,6,1,1,'2019-01-03 22:26:27','2019-01-08 05:39:48'),(8,7,1,1,'2019-01-03 22:26:27','2019-01-07 14:17:56'),(9,8,1,1,'2019-01-03 22:26:27','2019-01-08 03:58:54'),(10,9,1,1,'2019-01-03 22:26:27','2019-01-06 16:55:22'),(11,10,1,1,'2019-01-03 22:26:27','2019-01-08 02:27:58'),(12,11,1,1,'2019-01-03 22:26:27','2019-01-07 14:17:58'),(13,12,1,1,'2019-01-03 22:26:27','2019-01-06 15:29:39'),(14,13,1,1,'2019-01-03 22:26:27','2019-01-08 00:40:14'),(15,14,1,1,'2019-01-03 22:26:27','2019-01-07 17:23:11'),(16,15,1,1,'2019-01-03 22:26:27','2019-01-06 15:29:40'),(17,16,1,1,'2019-01-03 22:26:27','2019-01-06 15:29:40'),(18,17,1,1,'2019-01-03 22:26:27','2019-01-06 13:04:36'),(19,18,1,1,'2019-01-03 22:26:27','2019-01-06 13:12:30'),(20,19,1,1,'2019-01-03 22:26:27','2019-01-06 13:45:49'),(21,20,1,1,'2019-01-03 22:26:27','2019-01-06 13:40:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tranxmenus`
--

LOCK TABLES `tranxmenus` WRITE;
/*!40000 ALTER TABLE `tranxmenus` DISABLE KEYS */;
INSERT INTO `tranxmenus` VALUES (1,1,1,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(2,1,2,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(3,1,3,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(4,1,4,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(5,1,5,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(6,1,6,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(7,1,7,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(8,1,8,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(9,1,9,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(10,1,10,'system','2018-12-30 16:43:20','2018-12-30 16:43:20'),(11,3,4,'system','2019-01-05 05:37:53','2019-01-05 05:37:54'),(12,3,8,'system','2019-01-05 05:38:19','2019-01-05 05:38:20'),(13,4,10,'system','2019-01-05 05:38:45','2019-01-05 05:38:46'),(14,4,1,'system','2019-01-05 05:39:04','2019-01-05 05:39:05'),(15,3,1,'system','2019-01-05 05:39:21','2019-01-05 05:39:22'),(16,6,1,'system','2019-01-07 17:13:26','2019-01-07 17:13:28'),(17,6,10,'system','2019-01-07 17:13:28','2019-01-07 17:13:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (18,'ee3842d8-11e7-439f-b4bc-396da4f76b16','M','admin','sayyalinh@gmail.com','02055588857','Soulisack SAYYALINH','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$A2Py6MFvhx6qsMxV.Zn7/.rxv1BGTjyaRyoBf8WZXWl2MgkbLvtIi',0,1,'2018-12-29 07:38:10','2019-01-07 16:32:32',1),(20,'1dd7182c-3d42-4da7-a2d9-5baee070e25d','F','pathana','pathana@gmail.com','03056789333','Pathana','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$t9YBEPj7piRJp41cFAiGoOI7Q9oekHMsY2nb2K9iyN1px9rVvyq92',0,1,'2018-12-29 08:55:23','2018-12-29 08:57:07',1),(21,'dfdb7af2-6c20-425a-8c56-4f71ae205269','F','chef-01','chef-01@gmail.com','02055588856','Pathana SAYYALINH','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$txQvHa0ZFb7G8fjVSdtErOpYU4DM7PjrxNZ2GaRT5hgN/Qnqrrr/u',0,1,'2019-01-01 10:42:46','2019-01-01 10:42:46',6),(22,'4c3843cb-21a2-4ac5-9afc-fecd2263b671','F','chef-02','chef-02@gmail.com','02055588855','chef-02','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$lz6RrvRSMq6sPVgRGnqjOOaBzTTcZn9ldPab0/dUISnjq3KNO.RSu',0,1,'2019-01-01 10:43:02','2019-01-01 10:43:02',4),(23,'d18d3525-9295-4f5d-a178-51ab08c1a229','F','test01','test01@gmail.com','02055588852','test01','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$vSb7B.nBzzhnzXpu42XCfOEVckb6j7O86C/zpAsdEG7a2TbibGJjK',0,1,'2019-01-05 05:36:28','2019-01-07 16:20:56',3),(24,'8079e521-827b-46cf-a3f4-ec47743ae854','F','chankham','chankham@gmail.com','0205550000','chankham','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$WrAVfSvjRx.IoGnArZAk2erEXL9aj8Aqe71s.6M7DxcJExDW19deu',0,1,'2019-01-08 01:47:29','2019-01-08 02:05:22',3),(25,'2dea877f-7bb8-471e-aa5d-957795922774','M','kita','kita@gmail.com','02055500000','kita','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$igN6y6t6P2y06zMD9D2eE.9QSpw5V1icZxiaZFdu21wNykdTAXm4C',0,1,'2019-01-08 01:47:50','2019-01-08 01:56:09',3),(26,'3dcb3533-3133-4a77-9dea-a7813af12b24','F','kai','nilandone@gmail.com','02055901735','kai','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$OhjsA5s9cXZ0qyloMRxX.OgDsyWAAE3hyGS1ii9bfmE5s9Eb2UGq2',1,1,'2019-01-08 04:31:58','2019-01-08 04:31:58',3),(28,'4924788d-f4d5-44f3-8571-e34ab391ea97','M','bob','bob@gmail.com','02078888575','bob','1985-02-09 17:00:00','2018-12-28 17:00:00','not ready','$2a$10$kVbJK1roAnjj8RqPlvJIHu4eZVRaiCVa/a1A1X9/ZoC0KEa6WjSwW',0,1,'2019-01-08 08:23:07','2019-01-08 08:32:35',3);
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

-- Dump completed on 2019-01-09 10:29:46
