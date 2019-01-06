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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`id`, `customer_code`, `gender`, `fullname`, `dateOfBirth`, `currentAddress`, `tel`, `email`, `photo`, `registeredDate`, `active`, `createdAt`, `updatedAt`) VALUES (1,'AAAAAAAAAA','M','Soulisack','2019-01-03 16:00:02','dongdok','02055588857','sayyalinh@gmail.com','non','2019-01-03 16:00:28',1,'2019-01-03 16:00:33','2019-01-03 16:00:35');
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
INSERT INTO `food` (`id`, `food_name`, `parents_food_id`, `photo`, `foodtypeId`, `cost`, `price`, `currcode`, `enabled`, `createdAt`, `updatedAt`, `userId`, `kitchenId`, `enabled_child_food`) VALUES (50,'ເຂົ້າ ຜັດ',0,'http://192.168.10.199:5005/images/uploads/foods/1027.jpg',1,0,0,'418',1,'2019-01-01 02:03:05','2019-01-01 02:03:05',18,1,1),(53,'ກະເພົາ',0,'http://192.168.10.199:5005/images/uploads/foods/702669572.jpg',1,0,0,'418',1,'2019-01-04 04:56:32','2019-01-04 04:56:32',18,1,1),(54,'ງົວ',53,'http://192.168.10.199:5005/images/uploads/foods/702669572.jpg',1,13000,18000,'418',1,'2019-01-04 04:57:03','2019-01-04 04:57:03',18,1,0),(55,'ທະເລ',53,'http://192.168.10.199:5005/images/uploads/foods/702669572.jpg',1,13000,18000,'418',1,'2019-01-04 04:57:18','2019-01-04 04:57:18',18,1,0),(56,'ທະເລ',50,'http://192.168.10.199:5005/images/uploads/foods/1027.jpg',1,13000,18000,'418',1,'2019-01-04 16:30:54','2019-01-04 16:30:54',18,1,0),(60,'ໂກໂກ້ ນົມສົດ',0,'http://192.168.10.199:5005/images/uploads/foods/coco.png',9,10000,13000,'418',1,'2019-01-04 16:53:19','2019-01-04 18:08:13',18,2,0),(61,'ນົມສົດ ຄາຣາເມລ',0,'http://192.168.10.199:5005/images/uploads/foods/caramel.png',9,10000,13000,'418',1,'2019-01-04 16:57:38','2019-01-04 16:57:38',18,2,0),(62,'ເຜືອກຫອມນົມສົດ',0,'http://192.168.10.199:5005/images/uploads/foods/taro7.png',9,10000,13000,'418',1,'2019-01-04 16:59:07','2019-01-04 16:59:07',18,2,0),(63,'ຊາຂຽວເສົາກ້ວຍ',0,'http://192.168.10.199:5005/images/uploads/foods/greentea2.png',9,10000,13000,'418',1,'2019-01-04 17:00:16','2019-01-04 17:00:16',18,2,0),(64,'ນົມສົດກ້ວຍຫອມ',0,'http://192.168.10.199:5005/images/uploads/foods/bananamilk.png',9,10000,13000,'418',1,'2019-01-04 17:03:28','2019-01-04 17:03:28',18,2,0),(65,'ດັບໂບ້ ຊ໋ອກໂກ້',0,'http://192.168.10.199:5005/images/uploads/foods/cocoFrap7.png',10,13000,17000,'418',1,'2019-01-04 17:05:47','2019-01-04 17:05:47',18,2,0),(66,'ຊາຂຽວປັ່ນ',0,'http://192.168.10.199:5005/images/uploads/foods/greenteaFrap6.png',10,13000,17000,'418',1,'2019-01-04 17:06:46','2019-01-04 17:06:46',18,2,0),(67,'ສະຕຣໍເບີຣີ ໂຍເກີສ',0,'http://192.168.10.199:5005/images/uploads/foods/strawfrap7.png',10,13000,17000,'418',1,'2019-01-04 17:07:53','2019-01-04 17:07:53',18,2,0),(68,'ແມັງໂກ້ ໂຍເກີສ',0,'http://192.168.10.199:5005/images/uploads/foods/mangomilk.png',10,13000,17000,'418',1,'2019-01-04 17:10:31','2019-01-04 17:10:31',18,2,0),(69,'ຊ໋ອກໂກ້ ບລາວນີ້',0,'http://192.168.10.199:5005/images/uploads/foods/cocoFrap6.png',10,13000,17000,'418',1,'2019-01-04 17:12:28','2019-01-04 17:12:28',18,2,0),(70,'ນ້ຳບຣູເບີຣີ',0,'http://192.168.10.199:5005/images/uploads/foods/blueberry.png',2,8000,10000,'418',1,'2019-01-04 17:13:41','2019-01-04 17:13:41',18,2,0),(71,'ນ້ຳໝາກນອດ',0,'http://192.168.10.199:5005/images/uploads/foods/passion_resized.gif',2,8000,10000,'418',1,'2019-01-04 17:14:28','2019-01-04 17:14:28',18,2,0),(72,'ນ້ຳອະງຸ່ນ',0,'http://192.168.10.199:5005/images/uploads/foods/grape1.png',2,8000,10000,'418',1,'2019-01-04 17:15:21','2019-01-04 17:15:21',18,2,0),(73,'ນ້ຳລີ້ນຈິ່',0,'http://192.168.10.199:5005/images/uploads/foods/lychee1.png',2,8000,10000,'418',1,'2019-01-04 17:16:00','2019-01-04 17:16:00',18,2,0),(74,'ນ້ຳດື່ມ ຫົວເສືອ',0,'http://192.168.10.199:5005/images/uploads/foods/la_tigerhead-drinking-water.png',2,2000,3000,'418',1,'2019-01-04 17:17:15','2019-01-04 17:17:15',18,2,0),(75,'ຜັດໄທ',0,'http://192.168.10.199:5005/images/uploads/foods/phatthai.png',11,0,0,'418',1,'2019-01-05 03:06:03','2019-01-05 03:06:03',18,1,1),(76,'ທະເລ',75,'http://192.168.10.199:5005/images/uploads/foods/phatthai.png',11,13000,18000,'418',1,'2019-01-05 03:09:06','2019-01-05 03:09:06',18,1,0),(77,'ສຸກກີ້ນ້ຳ',0,'http://192.168.10.199:5005/images/uploads/foods/baannoi-sukee35.jpg',11,0,0,'418',1,'2019-01-05 03:10:52','2019-01-05 03:10:52',18,1,1),(78,'ໝູ',77,'http://192.168.10.199:5005/images/uploads/foods/suki.png',11,10000,16000,'418',1,'2019-01-05 03:11:53','2019-01-05 03:11:53',18,1,0),(79,'ສະປາເກັດຕີ້',0,'http://192.168.10.199:5005/images/uploads/foods/spagettytomato.png',12,0,0,'418',1,'2019-01-05 03:13:12','2019-01-05 03:13:12',18,1,1),(80,'ຊ໋ອດໝາກເລັ່ນ',79,'http://192.168.10.199:5005/images/uploads/foods/spagettytomato.png',12,13000,18000,'418',1,'2019-01-05 03:14:44','2019-01-05 03:14:44',18,1,0),(81,'ກະເພົາ ທະເລ',79,'http://192.168.10.199:5005/images/uploads/foods/spa2.png',12,15000,20000,'418',1,'2019-01-05 03:16:52','2019-01-05 03:16:52',18,1,0),(82,'ດາໂບນ່າຣ່າ ໝູ',79,'http://192.168.10.199:5005/images/uploads/foods/spagettispicy.png',12,13000,18000,'418',1,'2019-01-05 03:18:57','2019-01-05 03:18:57',18,1,0),(83,'ດາໂບນ່າຣ່າ ທະເລ',79,'http://192.168.10.199:5005/images/uploads/foods/spagettispicy.png',12,15000,20000,'418',1,'2019-01-05 03:19:41','2019-01-05 03:19:41',18,1,0),(84,'ກະເພົາ',79,'http://192.168.10.199:5005/images/uploads/foods/spa.png',12,13000,18000,'418',1,'2019-01-05 03:20:29','2019-01-05 03:20:29',18,1,0),(85,'ກະເພົາ ທະເລ',79,'http://192.168.10.199:5005/images/uploads/foods/spa.png',12,15000,20000,'418',1,'2019-01-05 03:21:39','2019-01-05 03:21:39',18,1,0),(86,'ມັກກະໂລນີ',0,'http://192.168.10.199:5005/images/uploads/foods/img_6779.jpg',11,0,0,'418',1,'2019-01-05 03:24:20','2019-01-05 03:24:20',18,1,1),(87,'ຊ໋ອດແດງ',86,'http://192.168.10.199:5005/images/uploads/foods/img_6779.jpg',11,11000,16000,'418',1,'2019-01-05 03:25:19','2019-01-05 03:25:19',18,1,0),(88,'ກະເພົາ ໄກ່',86,'http://192.168.10.199:5005/images/uploads/foods/photo.jpg',11,11000,16000,'418',1,'2019-01-05 03:27:28','2019-01-05 03:27:28',18,1,0),(89,'ກະເພົາ ໝູ',86,'http://192.168.10.199:5005/images/uploads/foods/photo.jpg',11,11000,16000,'418',1,'2019-01-05 03:27:57','2019-01-05 03:27:57',18,1,0),(90,'ຂີ້ເມົາ ໝູ',86,'http://192.168.10.199:5005/images/uploads/foods/ny3p2uf7ft4Wup2C4JR-o.jpg',11,11000,16000,'418',1,'2019-01-05 03:30:02','2019-01-05 03:30:02',18,1,0),(91,'ຂີ້ເມົາ ໄກ່',86,'http://192.168.10.199:5005/images/uploads/foods/ny3p2uf7ft4Wup2C4JR-o.jpg',11,11000,16000,'418',1,'2019-01-05 03:30:48','2019-01-05 03:30:48',18,1,0),(92,'ຂີ້ເມົາ ທະເລ',86,'http://192.168.10.199:5005/images/uploads/foods/ny3p2uf7ft4Wup2C4JR-o.jpg',11,13000,18000,'418',1,'2019-01-05 03:32:03','2019-01-05 03:32:03',18,1,0),(93,'ໄກ່',75,'http://192.168.10.199:5005/images/uploads/foods/ID_1224_56f8d6cdedc6b.jpg',11,11000,16000,'418',1,'2019-01-05 03:33:17','2019-01-05 03:33:17',18,1,0),(94,'ໝູ',75,'http://192.168.10.199:5005/images/uploads/foods/ID_1224_56f8d6cdedc6b.jpg',11,11000,16000,'418',1,'2019-01-05 03:33:52','2019-01-05 03:33:52',18,1,0),(95,'ເສັ້ນໃຫຍ່',0,'http://192.168.10.199:5005/images/uploads/foods/hqdefault.jpg',11,0,0,'418',1,'2019-01-05 03:35:53','2019-01-05 03:35:53',18,1,1),(96,'ລາດໜ້າ ໝູ',95,'http://192.168.10.199:5005/images/uploads/foods/hqdefault.jpg',11,11000,16000,'418',1,'2019-01-05 03:36:45','2019-01-05 03:36:45',18,1,0),(97,'ລາດໜ້າ ໄກ່',95,'http://192.168.10.199:5005/images/uploads/foods/hqdefault.jpg',11,11000,16000,'418',1,'2019-01-05 03:37:24','2019-01-05 03:37:24',18,1,0),(98,'ລາດໜ້າ ທະເລ',95,'http://192.168.10.199:5005/images/uploads/foods/hqdefault.jpg',11,13000,18000,'418',1,'2019-01-05 03:38:14','2019-01-05 03:38:14',18,1,0),(99,'ຜັດຊີອີ້ວ ໝູ',95,'http://192.168.10.199:5005/images/uploads/foods/maxresdefault.jpg',11,11000,16000,'418',1,'2019-01-05 03:39:35','2019-01-05 03:39:35',18,1,0),(100,'ຜັດຊີອີ້ວ ໄກ່',95,'http://192.168.10.199:5005/images/uploads/foods/maxresdefault.jpg',11,11000,16000,'418',1,'2019-01-05 03:40:12','2019-01-05 03:40:12',18,1,0),(101,'ຜັດຊີອີ້ວ ທະເລ',95,'http://192.168.10.199:5005/images/uploads/foods/maxresdefault.jpg',11,13000,18000,'418',1,'2019-01-05 03:41:07','2019-01-05 03:41:07',18,1,0),(102,'ໝີ່ກອບລາດໜ້າ',0,'http://192.168.10.199:5005/images/uploads/foods/maxresdefault (1).jpg',11,0,0,'418',1,'2019-01-05 03:42:31','2019-01-05 03:42:31',18,1,1),(103,'ໝູ',102,'http://192.168.10.199:5005/images/uploads/foods/maxresdefault (1).jpg',11,11000,16000,'418',1,'2019-01-05 03:43:05','2019-01-05 03:43:05',18,1,0),(104,'ໄກ່',102,'http://192.168.10.199:5005/images/uploads/foods/maxresdefault (1).jpg',11,11000,16000,'418',1,'2019-01-05 03:43:31','2019-01-05 03:43:31',18,1,0),(105,'ທະເລ',102,'http://192.168.10.199:5005/images/uploads/foods/maxresdefault (1).jpg',11,13000,18000,'418',1,'2019-01-05 03:43:58','2019-01-05 03:43:58',18,1,0),(106,'ສຸກກິ້ ແຫ້ງ',0,'http://192.168.10.199:5005/images/uploads/foods/suki.jpg',11,0,0,'418',1,'2019-01-05 03:46:43','2019-01-05 03:46:43',18,1,1),(107,'ທະເລ',106,'http://192.168.10.199:5005/images/uploads/foods/suki.jpg',11,13000,18000,'418',1,'2019-01-05 03:47:14','2019-01-05 03:47:14',18,1,0),(108,'ໝູ',106,'http://192.168.10.199:5005/images/uploads/foods/suki.jpg',11,11000,16000,'418',1,'2019-01-05 03:47:54','2019-01-05 03:47:54',18,1,0),(109,'ໄກ່',106,'http://192.168.10.199:5005/images/uploads/foods/suki.jpg',11,11000,16000,'418',1,'2019-01-05 03:48:24','2019-01-05 03:48:24',18,1,0),(110,'ທະເລ',77,'http://192.168.10.199:5005/images/uploads/foods/suki.png',11,13000,18000,'418',1,'2019-01-05 03:49:50','2019-01-05 03:49:50',18,1,0),(111,'ໄກ່',77,'http://192.168.10.199:5005/images/uploads/foods/suki.png',11,11000,16000,'418',1,'2019-01-05 03:50:29','2019-01-05 03:50:29',18,1,0),(112,'ໄກ່',50,'http://192.168.10.199:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:17:24','2019-01-05 04:17:24',18,1,0),(113,'ໝູ',50,'http://192.168.10.199:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:17:59','2019-01-05 04:17:59',18,1,0),(114,'ຂີ້ເມົາ ໄກ່',50,'http://192.168.10.199:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:19:24','2019-01-05 04:19:24',18,1,0),(115,'ຂີ້ເມົາ ໝູ',50,'http://192.168.10.199:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:20:31','2019-01-05 04:20:31',18,1,0),(116,'ຂີ້ເມົາ ທະເລ',50,'http://192.168.10.199:5005/images/uploads/foods/fried-rice.jpg',1,13000,18000,'418',1,'2019-01-05 04:21:53','2019-01-05 04:21:53',18,1,0),(117,'ກະເພົາ ໝູ',50,'http://192.168.10.199:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:23:07','2019-01-05 04:23:07',18,1,0),(118,'ກະເພົາ ໄກ່',50,'http://192.168.10.199:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:23:30','2019-01-05 04:23:30',18,1,0),(119,'ກະເພົາ ທະເລ',50,'http://192.168.10.199:5005/images/uploads/foods/fried-rice.jpg',1,13000,18000,'418',1,'2019-01-05 04:24:16','2019-01-05 04:24:16',18,1,0),(120,'ກະເພົາກອບ ໝູ',50,'http://192.168.10.199:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:25:28','2019-01-05 04:25:28',18,1,0),(121,'ກະເພົາກອບ ໄກ່',50,'http://192.168.10.199:5005/images/uploads/foods/fried-rice.jpg',1,11000,16000,'418',1,'2019-01-05 04:31:06','2019-01-05 04:31:06',18,1,0),(122,'ກະເພົາກອບ ທະເລ',50,'http://192.168.10.199:5005/images/uploads/foods/fried-rice.jpg',1,13000,18000,'418',1,'2019-01-05 04:31:50','2019-01-05 04:31:50',18,1,0),(123,'ເຂົ້າ ຜັກກາດນາ',0,'http://192.168.10.199:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,0,0,'418',1,'2019-01-05 04:33:23','2019-01-05 04:33:23',18,1,1),(124,'ໝູ',123,'http://192.168.10.199:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,11000,16000,'418',1,'2019-01-05 04:33:52','2019-01-05 04:33:52',18,1,0),(125,'ໄກ່',123,'http://192.168.10.199:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,11000,16000,'418',1,'2019-01-05 04:34:14','2019-01-05 04:34:14',18,1,0),(126,'ທະເລ',123,'http://192.168.10.199:5005/images/uploads/foods/Stir-Fried-Kale-with-Crispy-Pork.jpg',1,13000,18000,'418',1,'2019-01-05 04:34:37','2019-01-05 04:34:37',18,1,0),(127,'ເຂົ້າ ຖົ່ວລັນເຕົາຜັດ',0,'http://192.168.10.199:5005/images/uploads/foods/download.jpeg',1,0,0,'418',1,'2019-01-05 04:36:35','2019-01-05 04:36:35',18,1,1),(128,'ໝູ',127,'http://192.168.10.199:5005/images/uploads/foods/download.jpeg',1,11000,16000,'418',1,'2019-01-05 04:36:56','2019-01-05 04:36:56',18,1,0),(129,'ໄກ່',127,'http://192.168.10.199:5005/images/uploads/foods/download.jpeg',1,11000,16000,'418',1,'2019-01-05 04:37:18','2019-01-05 04:37:18',18,1,0),(130,'ທະເລ',127,'http://192.168.10.199:5005/images/uploads/foods/download.jpeg',1,13000,18000,'418',1,'2019-01-05 04:37:43','2019-01-05 04:37:43',18,1,0),(131,'ເຂົ້າມັນໄກ່',0,'http://192.168.10.199:5005/images/uploads/foods/download.jpeg',1,11000,16000,'418',1,'2019-01-05 04:39:21','2019-01-05 04:39:21',18,1,0),(132,'ເຂົ້າມັນໄກ່ ກອບ',0,'http://192.168.10.199:5005/images/uploads/foods/maxresdefault (2).jpg',1,11000,16000,'418',1,'2019-01-05 04:40:06','2019-01-05 04:40:06',18,1,0),(133,'ເຂົ້າໝູ ພິກໄທດຳ',0,'http://192.168.10.199:5005/images/uploads/foods/tmp1_133058_20161015_21333570.JPG',1,11000,16000,'418',1,'2019-01-05 04:41:38','2019-01-05 04:41:38',18,1,0),(134,'ຂິງໄກ່',50,'http://192.168.10.199:5005/images/uploads/foods/tmp1_133058_20161015_21333570.JPG',1,11000,16000,'418',1,'2019-01-05 04:42:10','2019-01-05 04:42:10',18,1,0),(135,'ເຂົ້າ ໝູທອດກະທຽມ',0,'http://192.168.10.199:5005/images/uploads/foods/maxresdefault (3).jpg',1,11000,16000,'418',1,'2019-01-05 04:43:43','2019-01-05 04:43:43',18,1,0),(136,'ເຂົ້າ ໄຂ່ຈຽວ ໝູສັບ',0,'http://192.168.10.199:5005/images/uploads/foods/1442885991-imagejpeg-o.jpg',1,11000,16000,'418',1,'2019-01-05 04:44:46','2019-01-05 04:44:46',18,1,0),(137,'ຜັກບົ້ງໄຟແດງ',50,'http://192.168.10.199:5005/images/uploads/foods/download (2).jpeg',1,11000,16000,'418',1,'2019-01-05 04:46:27','2019-01-05 04:46:27',18,1,0),(138,'ເຟຣນຟາຍ',0,'http://192.168.10.199:5005/images/uploads/foods/69b67c8f33cfd77dda368f90da3450a0.png',4,5000,9000,'418',1,'2019-01-05 04:48:16','2019-01-05 04:48:16',18,1,0),(139,'ໄກ່ທອດ',0,'http://192.168.10.199:5005/images/uploads/foods/2cb0f96c970652f59310d581dc21b497.png',4,5000,10000,'418',1,'2019-01-05 04:49:32','2019-01-05 04:49:32',18,1,0),(140,'ທອດລຸກຊີ້ນ ຮັອດດອກ',0,'http://192.168.10.199:5005/images/uploads/foods/57fa34df8e7c0_1024.jpg',4,7000,12000,'418',1,'2019-01-05 04:50:46','2019-01-05 04:50:46',18,1,0),(141,'ນັກເກັດໄກ່',0,'http://192.168.10.199:5005/images/uploads/foods/nudgetkai1.png',4,10000,15000,'418',1,'2019-01-05 04:52:31','2019-01-05 04:52:31',18,1,0),(142,'ໄກ່ສະຕິກ',0,'http://192.168.10.199:5005/images/uploads/foods/04849d5e5b88f8b1703370d89512bead.png',4,10000,15000,'418',1,'2019-01-05 04:53:56','2019-01-05 04:53:56',18,1,0),(143,'ທອດໄກ່ຈໍ້',0,'http://192.168.10.199:5005/images/uploads/foods/download (3).jpeg',4,10000,15000,'418',1,'2019-01-05 04:55:10','2019-01-05 04:55:10',18,1,0),(144,'ຟິຊສະຕິກ',0,'http://192.168.10.199:5005/images/uploads/foods/fish-stick-png-1.png',4,10000,15000,'418',1,'2019-01-05 04:56:08','2019-01-05 04:56:08',18,1,0),(145,'ປີກໄກ່ ທອດນ້ຳປາ',0,'http://192.168.10.199:5005/images/uploads/foods/maxresdefault (4).jpg',4,15000,20000,'418',1,'2019-01-05 04:57:48','2019-01-05 04:57:48',18,1,0),(146,'ປາດອນລິ໊ ຊຸບແປ້ງທອດ',0,'http://192.168.10.199:5005/images/uploads/foods/635749-img-1349336040-1.jpg',4,15000,20000,'418',1,'2019-01-05 04:59:16','2019-01-05 04:59:16',18,1,0),(147,'ປີກໄກ່ທອດ ທາລິຢາກິ',0,'http://192.168.10.199:5005/images/uploads/foods/hqdefault (1).jpg',4,20000,25000,'418',1,'2019-01-05 05:01:04','2019-01-05 05:01:04',18,1,0),(148,'ປີກໄກ່ທອດ ບາບີຄິວ',0,'http://192.168.10.199:5005/images/uploads/foods/download (4).jpeg',4,20000,25000,'418',1,'2019-01-05 05:02:03','2019-01-05 05:02:03',18,1,0),(149,'ຕຳໝາກຮຸ່ງ',0,'http://192.168.10.199:5005/images/uploads/foods/702669572.jpg',5,8000,10000,'418',1,'2019-01-05 09:12:08','2019-01-05 09:12:08',18,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` (`id`, `orderId`, `foodId`, `quantity`, `price`, `total`, `note`, `createdAt`, `updatedAt`) VALUES (88,58,56,1,18000,18000,NULL,'2019-01-04 17:27:43','2019-01-04 17:27:43'),(89,59,61,1,13000,13000,NULL,'2019-01-04 17:55:36','2019-01-04 17:55:36'),(90,59,62,1,13000,13000,NULL,'2019-01-04 17:55:36','2019-01-04 17:55:36'),(91,59,60,1,13000,13000,NULL,'2019-01-04 17:55:36','2019-01-04 17:55:36'),(92,59,69,1,17000,17000,NULL,'2019-01-04 17:55:36','2019-01-04 17:55:36'),(93,60,60,1,13000,13000,NULL,'2019-01-04 18:08:42','2019-01-04 18:08:42'),(94,61,63,1,13000,13000,'ບໍ່ຫວານ','2019-01-04 18:12:40','2019-01-04 18:12:40'),(95,62,55,1,18000,18000,NULL,'2019-01-04 18:26:40','2019-01-04 18:26:40'),(96,63,60,1,13000,13000,NULL,'2019-01-04 19:21:43','2019-01-04 19:21:43'),(97,64,63,1,13000,13000,NULL,'2019-01-04 19:22:00','2019-01-04 19:22:00'),(98,65,62,1,13000,13000,NULL,'2019-01-04 19:55:34','2019-01-04 19:55:34'),(99,66,64,1,13000,13000,NULL,'2019-01-05 02:08:27','2019-01-05 02:08:27'),(100,67,61,1,13000,13000,NULL,'2019-01-05 05:42:53','2019-01-05 05:42:53'),(101,68,139,1,10000,10000,NULL,'2019-01-05 06:31:20','2019-01-05 06:31:20'),(102,69,96,1,16000,16000,NULL,'2019-01-05 06:32:19','2019-01-05 06:32:19'),(103,70,107,1,18000,18000,NULL,'2019-01-05 06:33:26','2019-01-05 06:33:26'),(104,70,68,1,17000,17000,NULL,'2019-01-05 06:33:26','2019-01-05 06:33:26'),(105,71,55,1,18000,18000,NULL,'2019-01-05 06:35:19','2019-01-05 06:35:19'),(106,72,83,1,20000,20000,NULL,'2019-01-05 06:37:22','2019-01-05 06:37:22'),(107,72,71,1,10000,10000,NULL,'2019-01-05 06:37:22','2019-01-05 06:37:22'),(108,73,55,1,18000,18000,NULL,'2019-01-05 06:39:45','2019-01-05 06:39:45'),(109,74,56,1,18000,18000,NULL,'2019-01-05 06:43:48','2019-01-05 06:43:48'),(110,74,60,1,13000,13000,NULL,'2019-01-05 06:43:48','2019-01-05 06:43:48'),(111,75,76,1,18000,18000,NULL,'2019-01-05 07:02:29','2019-01-05 07:02:29'),(112,76,81,1,20000,20000,NULL,'2019-01-05 07:06:46','2019-01-05 07:06:46'),(113,76,63,1,13000,13000,NULL,'2019-01-05 07:06:46','2019-01-05 07:06:46'),(114,76,104,1,16000,16000,'ບໍ່ເຜັດ','2019-01-05 07:06:46','2019-01-05 07:06:46'),(115,77,56,1,18000,18000,NULL,'2019-01-05 07:09:42','2019-01-05 07:09:42'),(116,78,56,1,18000,18000,NULL,'2019-01-05 07:19:29','2019-01-05 07:19:29'),(117,78,131,1,16000,16000,NULL,'2019-01-05 07:19:29','2019-01-05 07:19:29'),(118,78,71,2,10000,20000,NULL,'2019-01-05 07:19:29','2019-01-05 07:19:29'),(119,79,81,1,20000,20000,NULL,'2019-01-05 07:34:13','2019-01-05 07:34:13'),(120,79,113,1,16000,16000,NULL,'2019-01-05 07:34:13','2019-01-05 07:34:13'),(121,79,72,1,10000,10000,NULL,'2019-01-05 07:34:13','2019-01-05 07:34:13'),(122,80,112,2,16000,32000,'jjjj','2019-01-05 07:37:42','2019-01-05 07:37:42'),(123,81,72,1,10000,10000,NULL,'2019-01-05 07:43:54','2019-01-05 07:43:54'),(124,81,140,1,12000,12000,NULL,'2019-01-05 07:43:54','2019-01-05 07:43:54'),(125,81,148,1,25000,25000,NULL,'2019-01-05 07:43:54','2019-01-05 07:43:54'),(126,81,143,1,15000,15000,NULL,'2019-01-05 07:43:54','2019-01-05 07:43:54'),(127,82,72,1,10000,10000,NULL,'2019-01-05 07:45:32','2019-01-05 07:45:32'),(128,82,140,1,12000,12000,NULL,'2019-01-05 07:45:32','2019-01-05 07:45:32'),(129,82,148,1,25000,25000,NULL,'2019-01-05 07:45:32','2019-01-05 07:45:32'),(130,82,143,1,15000,15000,NULL,'2019-01-05 07:45:32','2019-01-05 07:45:32'),(131,82,54,1,18000,18000,NULL,'2019-01-05 07:45:32','2019-01-05 07:45:32'),(132,83,90,1,16000,16000,NULL,'2019-01-05 07:57:07','2019-01-05 07:57:07'),(133,84,54,1,18000,18000,NULL,'2019-01-05 07:58:40','2019-01-05 07:58:40'),(134,85,55,1,18000,18000,NULL,'2019-01-05 07:59:33','2019-01-05 07:59:33'),(135,85,99,1,16000,16000,NULL,'2019-01-05 07:59:33','2019-01-05 07:59:33'),(136,86,129,1,16000,16000,NULL,'2019-01-05 08:01:52','2019-01-05 08:01:52'),(137,86,74,2,3000,6000,NULL,'2019-01-05 08:01:52','2019-01-05 08:01:52'),(138,87,110,1,18000,18000,NULL,'2019-01-05 08:01:56','2019-01-05 08:01:56'),(139,88,82,1,18000,18000,NULL,'2019-01-05 08:02:12','2019-01-05 08:02:12'),(140,89,69,1,17000,17000,NULL,'2019-01-05 08:10:47','2019-01-05 08:10:47'),(141,90,93,1,16000,16000,NULL,'2019-01-05 08:11:33','2019-01-05 08:11:33'),(142,90,54,1,18000,18000,NULL,'2019-01-05 08:11:33','2019-01-05 08:11:33'),(143,90,104,1,16000,16000,NULL,'2019-01-05 08:11:33','2019-01-05 08:11:33'),(144,91,131,1,16000,16000,'ບໍ່ໃສ່ແປ້ງນົວ','2019-01-05 08:12:41','2019-01-05 08:12:41'),(145,92,60,1,13000,13000,NULL,'2019-01-05 08:25:31','2019-01-05 08:25:31'),(146,93,55,1,18000,18000,NULL,'2019-01-05 08:32:06','2019-01-05 08:32:06'),(147,94,72,2,10000,20000,NULL,'2019-01-05 08:33:17','2019-01-05 08:33:17'),(148,94,73,1,10000,10000,NULL,'2019-01-05 08:33:17','2019-01-05 08:33:17'),(149,95,112,1,16000,16000,NULL,'2019-01-05 08:52:23','2019-01-05 08:52:23'),(150,96,93,1,16000,16000,'dlfks','2019-01-05 08:53:53','2019-01-05 08:53:53'),(151,97,71,1,10000,10000,NULL,'2019-01-05 08:54:50','2019-01-05 08:54:50'),(152,97,72,3,10000,30000,NULL,'2019-01-05 08:54:50','2019-01-05 08:54:50'),(153,97,73,1,10000,10000,NULL,'2019-01-05 08:54:50','2019-01-05 08:54:50'),(154,97,70,1,10000,10000,NULL,'2019-01-05 08:54:50','2019-01-05 08:54:50'),(155,98,140,1,12000,12000,NULL,'2019-01-05 09:12:09','2019-01-05 09:12:09'),(156,98,65,1,17000,17000,NULL,'2019-01-05 09:12:09','2019-01-05 09:12:09'),(157,99,140,1,12000,12000,NULL,'2019-01-05 09:14:18','2019-01-05 09:14:18'),(158,99,69,1,17000,17000,NULL,'2019-01-05 09:14:18','2019-01-05 09:14:18'),(159,100,63,1,13000,13000,NULL,'2019-01-05 09:18:55','2019-01-05 09:18:55'),(160,100,139,1,10000,10000,NULL,'2019-01-05 09:18:55','2019-01-05 09:18:55'),(161,101,131,1,16000,16000,NULL,'2019-01-05 09:25:05','2019-01-05 09:25:05'),(162,101,71,1,10000,10000,NULL,'2019-01-05 09:25:05','2019-01-05 09:25:05'),(163,102,149,1,10000,10000,NULL,'2019-01-05 09:34:25','2019-01-05 09:34:25'),(164,103,149,1,10000,10000,NULL,'2019-01-05 09:43:43','2019-01-05 09:43:43'),(165,104,131,2,16000,32000,NULL,'2019-01-05 09:45:40','2019-01-05 09:45:40'),(166,105,149,1,10000,10000,NULL,'2019-01-05 10:00:57','2019-01-05 10:00:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `orderRefno`, `order_datetime`, `finish_datetime`, `quantity`, `grandtotal`, `received`, `change`, `ticketId`, `statusId`, `userId`, `customerId`, `createdAt`, `updatedAt`) VALUES (58,'a8a83cf3-8e70-4520-b9d3-21fd85189395','2019-01-04 17:27:43','2019-01-04 19:44:44',0,18000,0,0,5,2,18,1,'2019-01-04 17:27:43','2019-01-04 19:44:44'),(59,'37e0259d-8618-46f5-9bf8-f0b6939fcc16','2019-01-04 17:55:36','2019-01-04 19:50:43',0,56000,60000,4000,15,2,18,1,'2019-01-04 17:55:36','2019-01-04 19:50:43'),(60,'56a5e40c-5129-4531-94cb-2e4c23b0182e','2019-01-04 18:08:42','2019-01-04 19:50:46',0,13000,15000,2000,15,2,18,1,'2019-01-04 18:08:42','2019-01-04 19:50:46'),(61,'6212074d-948c-4afa-b5a4-7b2d2fbd3932','2019-01-04 18:12:40','2019-01-04 19:51:38',0,13000,15000,2000,12,4,18,1,'2019-01-04 18:12:40','2019-01-04 19:51:38'),(62,'1de4334e-3cdd-49cd-aef6-5ec8e989f5b5','2019-01-04 18:26:40','2019-01-04 19:51:45',0,18000,0,0,1,4,18,1,'2019-01-04 18:26:40','2019-01-04 19:51:45'),(63,'5d5fcbaa-fa0a-4ded-9a28-fc27a9df8c80','2019-01-04 19:21:43','2019-01-04 19:51:40',0,13000,0,0,12,4,18,1,'2019-01-04 19:21:43','2019-01-04 19:51:40'),(64,'21ece0c7-a931-47e8-87d2-325856fa29cb','2019-01-04 19:22:00','2019-01-04 19:51:44',0,13000,0,0,14,2,18,1,'2019-01-04 19:22:00','2019-01-04 19:51:44'),(65,'9ca286e2-0d52-4019-8ae5-60562e9af98e','2019-01-04 19:55:34','2019-01-05 02:08:34',0,13000,0,0,1,2,18,1,'2019-01-04 19:55:34','2019-01-05 02:08:34'),(66,'f793cd7e-1050-48f7-a134-568045ffe01f','2019-01-05 02:08:27','2019-01-05 02:08:37',0,13000,0,0,4,2,18,1,'2019-01-05 02:08:27','2019-01-05 02:08:37'),(67,'99e201a7-c927-467b-a755-14fdfff43f22','2019-01-05 05:42:53','2019-01-05 06:00:28',0,13000,0,0,6,2,23,1,'2019-01-05 05:42:53','2019-01-05 06:00:29'),(68,'f6e47ac1-2e22-46ea-a5e6-5eea6c6abaa9','2019-01-05 06:31:20','2019-01-05 06:32:39',0,10000,0,0,12,2,23,1,'2019-01-05 06:31:20','2019-01-05 06:32:39'),(69,'6a65c96f-87ff-4fa1-9afb-1ee205ff1112','2019-01-05 06:32:19','2019-01-05 06:32:43',0,16000,0,0,15,4,23,1,'2019-01-05 06:32:19','2019-01-05 06:32:42'),(70,'8267ace9-3615-43bc-8a25-d6849fdb00a5','2019-01-05 06:33:26','2019-01-05 06:34:11',0,35000,50000,15000,19,4,23,1,'2019-01-05 06:33:26','2019-01-05 06:34:11'),(71,'452a77a6-cf3a-40fc-ad31-b10298c7e843','2019-01-05 06:35:19','2019-01-05 06:35:50',0,18000,0,0,10,4,23,1,'2019-01-05 06:35:19','2019-01-05 06:35:51'),(72,'7eef571f-2a02-48c4-82db-5e309a774ddd','2019-01-05 06:37:22','2019-01-05 06:37:50',0,30000,0,0,4,2,23,1,'2019-01-05 06:37:22','2019-01-05 06:37:49'),(73,'0648c75b-ea85-4475-a3d5-e61cb54f412e','2019-01-05 06:39:45','2019-01-05 06:44:45',0,18000,0,0,17,4,23,1,'2019-01-05 06:39:45','2019-01-05 06:44:44'),(74,'76d0f711-39fa-4a98-b919-0a3aa0f2ce07','2019-01-05 06:43:48','2019-01-05 06:44:39',0,31000,50000,19000,3,2,23,1,'2019-01-05 06:43:48','2019-01-05 06:44:38'),(75,'910caf04-f4b6-4e9e-afa7-428bfe701b9e','2019-01-05 07:02:29','2019-01-05 07:03:19',0,18000,20000,2000,10,4,23,1,'2019-01-05 07:02:29','2019-01-05 07:03:18'),(76,'a6b07895-06ab-4df2-bc2f-9d86e7de4d50','2019-01-05 07:06:46','2019-01-05 07:07:31',0,49000,50000,1000,17,2,23,1,'2019-01-05 07:06:46','2019-01-05 07:07:35'),(77,'6f87dce9-84e6-4390-b4b2-39756f1162f5','2019-01-05 07:09:42','2019-01-05 07:12:29',0,18000,0,0,10,2,23,1,'2019-01-05 07:09:42','2019-01-05 07:12:28'),(78,'c88daca4-cb64-47b1-9b67-8e7e4fb92dbd','2019-01-05 07:19:29','2019-01-05 07:20:21',0,54000,100000,46000,12,2,23,1,'2019-01-05 07:19:29','2019-01-05 07:20:20'),(79,'fc279b02-357a-46f5-9d3a-f669f91b904e','2019-01-05 07:34:13','2019-01-05 07:34:44',0,46000,50000,4000,6,2,23,1,'2019-01-05 07:34:13','2019-01-05 07:34:43'),(80,'cb95fe0d-c4d8-48da-ac87-80de02445ee4','2019-01-05 07:37:42','2019-01-05 07:56:07',0,32000,40000,8000,6,2,23,1,'2019-01-05 07:37:42','2019-01-05 07:56:07'),(81,'b7a1f05c-718d-4607-8a01-47447a6a47e6','2019-01-05 07:43:54','2019-01-05 07:56:08',0,62000,0,0,3,2,23,1,'2019-01-05 07:43:54','2019-01-05 07:56:08'),(82,'dc7ae949-bf20-408c-9ecd-198be02135b2','2019-01-05 07:45:32','2019-01-05 07:56:09',0,80000,0,0,14,2,23,1,'2019-01-05 07:45:32','2019-01-05 07:56:09'),(83,'e7e3019b-3db3-481f-bf1a-42faf5725754','2019-01-05 07:57:07','2019-01-05 07:57:31',0,16000,0,0,11,4,23,1,'2019-01-05 07:57:07','2019-01-05 07:57:31'),(84,'73b98746-c355-4a31-b9ae-67f3afaa007b','2019-01-05 07:58:40','2019-01-05 08:00:04',0,18000,0,0,9,4,23,1,'2019-01-05 07:58:40','2019-01-05 08:00:04'),(85,'0c8b0765-841b-4147-80ce-935ab35cb617','2019-01-05 07:59:33','2019-01-05 07:59:50',0,34000,0,0,9,4,23,1,'2019-01-05 07:59:33','2019-01-05 07:59:50'),(86,'1618e598-b6dd-4044-903b-c13e66e883bd','2019-01-05 08:01:52','2019-01-05 08:02:15',0,22000,30000,8000,1,2,23,1,'2019-01-05 08:01:52','2019-01-05 08:02:15'),(87,'607d9f4c-0e31-4f9d-af9f-ba137a8afa32','2019-01-05 08:01:56','2019-01-05 08:02:55',0,18000,0,0,11,4,23,1,'2019-01-05 08:01:56','2019-01-05 08:02:55'),(88,'c16a8c9f-f07a-4bf0-97a2-418a2f23fcea','2019-01-05 08:02:12','2019-01-05 08:02:56',0,18000,0,0,13,4,23,1,'2019-01-05 08:02:12','2019-01-05 08:02:56'),(89,'2590bba9-5aa0-40df-80cd-26f2f4b2bfa0','2019-01-05 08:10:47','2019-01-05 08:43:27',0,17000,0,0,3,2,23,1,'2019-01-05 08:10:47','2019-01-05 08:43:28'),(90,'95d02a5e-7515-47a8-af24-e45a3a176319','2019-01-05 08:11:33','2019-01-05 08:43:36',0,50000,0,0,16,2,23,1,'2019-01-05 08:11:33','2019-01-05 08:43:36'),(91,'9908dbec-76a7-46d9-862f-3912029134fe','2019-01-05 08:12:41','2019-01-05 08:43:38',0,16000,0,0,9,2,23,1,'2019-01-05 08:12:41','2019-01-05 08:43:38'),(92,'517e3873-f66e-4ced-be4b-ad5faed03c27','2019-01-05 08:25:31','2019-01-05 08:43:51',0,13000,0,0,7,2,23,1,'2019-01-05 08:25:31','2019-01-05 08:43:51'),(93,'b6f08b44-ec0c-4175-a4dd-713ce24244f2','2019-01-05 08:32:06','2019-01-05 08:43:40',0,18000,0,0,20,2,23,1,'2019-01-05 08:32:06','2019-01-05 08:43:41'),(94,'c8daa8aa-fe64-4268-8c42-03f6ae617e62','2019-01-05 08:33:17','2019-01-05 08:53:09',0,30000,50000,20000,8,2,23,1,'2019-01-05 08:33:17','2019-01-05 08:53:10'),(95,'1af11be3-f8a1-4294-bc9c-5107c64beb55','2019-01-05 08:52:23','2019-01-05 08:53:22',0,16000,0,0,17,2,18,1,'2019-01-05 08:52:23','2019-01-05 08:53:23'),(96,'fd1c5d32-0bb9-493a-9912-1ec7664cd0e9','2019-01-05 08:53:53','2019-01-05 09:09:18',0,16000,0,0,12,2,23,1,'2019-01-05 08:53:52','2019-01-05 09:09:19'),(97,'84b79f15-1fe7-4e34-ba50-f05fb579cb1a','2019-01-05 08:54:50','2019-01-05 09:09:19',0,60000,0,0,14,2,18,1,'2019-01-05 08:54:50','2019-01-05 09:09:19'),(98,'8b8dffcc-6294-461d-a707-0745d3d60bed','2019-01-05 09:12:09','2019-01-05 09:28:27',0,29000,30000,1000,4,2,18,1,'2019-01-05 09:12:09','2019-01-05 09:28:28'),(99,'8a24a54f-0b70-4c4a-977f-df2182a97925','2019-01-05 09:14:18','2019-01-05 09:15:22',0,29000,30000,1000,6,2,23,1,'2019-01-05 09:14:18','2019-01-05 09:15:22'),(100,'953466f3-06cb-4e45-8aef-02fed5fcb23c','2019-01-05 09:18:55','2019-01-05 09:29:14',0,23000,50000,27000,5,2,23,1,'2019-01-05 09:18:55','2019-01-05 09:29:14'),(101,'599d5311-12e9-408b-baa2-6fff20c0ea3e','2019-01-05 09:25:05','2019-01-05 09:33:32',0,26000,50000,24000,10,2,23,1,'2019-01-05 09:25:05','2019-01-05 09:33:32'),(102,'27ff489d-b1fd-4283-ad0f-dfd1f4c5415c','2019-01-05 09:34:25','2019-01-05 09:43:17',0,10000,0,0,18,4,18,1,'2019-01-05 09:34:25','2019-01-05 09:43:17'),(103,'6e6a7056-d72a-4c60-a524-1658c90d90b3','2019-01-05 09:43:43','2019-01-05 09:51:42',0,10000,0,0,21,2,18,1,'2019-01-05 09:43:43','2019-01-05 09:51:43'),(104,'6e879305-c069-40c9-8b37-54244455b9db','2019-01-05 09:45:40','2019-01-05 09:51:45',0,32000,50000,18000,1,2,18,1,'2019-01-05 09:45:40','2019-01-05 09:51:46'),(105,'5b55f83d-a520-47a0-995d-3184af1d43b6','2019-01-05 10:00:57','2019-01-05 10:41:21',0,10000,50000,40000,3,2,18,1,'2019-01-05 10:00:57','2019-01-05 10:41:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` (`id`, `status`, `location`, `createdAt`, `updatedAt`) VALUES (1,'pending','kitchen','2019-01-03 22:34:49','2019-01-03 22:34:49'),(2,'finished','front counter','2019-01-03 22:35:04','2019-01-03 22:35:04'),(4,'canceled','user','2019-01-05 02:17:37','2019-01-05 02:17:37');
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
INSERT INTO `tickets` (`id`, `tick_number`, `ticket_available`, `enabled`, `createdAt`, `updatedAt`) VALUES (1,1,0,1,'2019-01-03 20:25:36','2019-01-05 09:45:40'),(3,2,0,1,'2019-01-03 22:26:27','2019-01-05 10:00:57'),(4,3,1,1,'2019-01-03 22:26:27','2019-01-05 09:12:09'),(5,4,1,1,'2019-01-03 22:26:27','2019-01-05 09:18:55'),(6,5,1,1,'2019-01-03 22:26:27','2019-01-05 09:14:18'),(7,6,1,1,'2019-01-03 22:26:27','2019-01-05 08:25:31'),(8,7,1,1,'2019-01-03 22:26:27','2019-01-05 08:33:17'),(9,8,1,1,'2019-01-03 22:26:27','2019-01-05 08:12:41'),(10,9,0,1,'2019-01-03 22:26:27','2019-01-05 09:25:05'),(11,10,1,1,'2019-01-03 22:26:27','2019-01-05 08:01:56'),(12,11,1,1,'2019-01-03 22:26:27','2019-01-05 08:53:53'),(13,12,1,1,'2019-01-03 22:26:27','2019-01-05 08:02:12'),(14,13,1,1,'2019-01-03 22:26:27','2019-01-05 08:54:50'),(15,14,1,1,'2019-01-03 22:26:27','2019-01-05 07:45:32'),(16,15,1,1,'2019-01-03 22:26:27','2019-01-05 08:11:33'),(17,16,1,1,'2019-01-03 22:26:27','2019-01-05 08:52:23'),(18,17,1,1,'2019-01-03 22:26:27','2019-01-05 09:34:25'),(19,18,1,1,'2019-01-03 22:26:27','2019-01-03 22:26:27'),(20,19,1,1,'2019-01-03 22:26:27','2019-01-05 08:32:06'),(21,20,0,1,'2019-01-03 22:26:27','2019-01-05 09:43:43');
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

-- Dump completed on 2019-01-06 16:59:36
