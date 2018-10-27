-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: smnthsvrm
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `username` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `mail` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `USERS_ROLES`
--

DROP TABLE IF EXISTS `USERS_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS_ROLES` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fka` (`user`),
  CONSTRAINT `USERS_ROLES_ibfk_1` FOREIGN KEY (`user`) REFERENCES `USERS` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `username` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `houseno` varchar(100) DEFAULT NULL,
  `streetname` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  KEY `fka` (`username`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`username`) REFERENCES `USERS` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `username` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `building` varchar(100) DEFAULT NULL,
  `streetname` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`username`) REFERENCES `USERS` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `producttype` varchar(100) NOT NULL,
  `cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`producttype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderid` varchar(100) NOT NULL,
  `clientusername` varchar(100) NOT NULL,
  `typeofgood` varchar(100) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not ready',
  PRIMARY KEY (`orderid`,`clientusername`,`typeofgood`),
  KEY `fka` (`typeofgood`),
  KEY `fkb` (`clientusername`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`clientusername`) REFERENCES `clients` (`username`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`typeofgood`) REFERENCES `Product` (`producttype`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`clientusername`) REFERENCES `clients` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `rawmaterials`
--

DROP TABLE IF EXISTS `rawmaterials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rawmaterials` (
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier` (
  `supname` varchar(100) NOT NULL,
  `buildingno` varchar(100) DEFAULT NULL,
  `streetname` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phoneno` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`supname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplyRawMaterial`
--

DROP TABLE IF EXISTS `supplyRawMaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplyRawMaterial` (
  `suppliername` varchar(100) NOT NULL,
  `goods` varchar(100) NOT NULL,
  PRIMARY KEY (`suppliername`,`goods`),
  KEY `fk4` (`goods`),
  CONSTRAINT `supplyRawMaterial_ibfk_1` FOREIGN KEY (`suppliername`) REFERENCES `Supplier` (`supname`),
  CONSTRAINT `supplyRawMaterial_ibfk_2` FOREIGN KEY (`goods`) REFERENCES `rawmaterials` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Attendance`
--

DROP TABLE IF EXISTS `Attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attendance` (
  `empusername` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`empusername`,`date`),
  CONSTRAINT `Attendance_ibfk_1` FOREIGN KEY (`empusername`) REFERENCES `Employee` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientusername` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `feedbacktext` text,
  PRIMARY KEY (`id`),
  KEY `fk2` (`clientusername`),
  CONSTRAINT `Feedback_ibfk_1` FOREIGN KEY (`clientusername`) REFERENCES `clients` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientusername` varchar(100) DEFAULT NULL,
  `orderid` varchar(100) DEFAULT NULL,
  `gendate` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk4` (`clientusername`),
  KEY `fk5` (`orderid`),
  CONSTRAINT `Invoice_ibfk_1` FOREIGN KEY (`clientusername`) REFERENCES `clients` (`username`),
  CONSTRAINT `Invoice_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `orderid` varchar(100) NOT NULL,
  `clntusername` varchar(100) NOT NULL,
  `modeoftransport` varchar(100) DEFAULT NULL,
  `contactno` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `item` varchar(100) NOT NULL,
  PRIMARY KEY (`orderid`,`clntusername`,`item`),
  KEY `fk2` (`clntusername`),
  KEY `fk3` (`item`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`clntusername`) REFERENCES `clients` (`username`),
  CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`item`) REFERENCES `Product` (`producttype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES ('aaaaa','aaaaa',1,'aa@aa.com','SSS'),('abcd','abcd',1,'aa@cd.com','ABCD'),('admin','$2a$10$z2eDzaYu5qE8epUAxomnROGQhOJ8uYgWvZ8QNYQwSBMIqHzNGSqZG',1,NULL,'admin'),('cl2','$2a$10$f1bZldVCM.QKd6iUmroVJOA6Di/sIZd0O/9UdMXoySlkoKLscy1si',1,'cl2@gmail.com','Client 2'),('emp1','aaaa',1,'s@s.com','Employee1'),('emp2','emp22',1,'emp2@emp.com','Employee2'),('emp3','$2a$10$ks3pZ7KAXgKIpnIDRkq5w.RBuIucptco752o78Y3lnKw7H.EQsIES',1,'emp3@gmail.com','Employee 3'),('nc1','$2a$10$T1sSzl5KwFnpe1.UrP0YAexZpCfcGmfKRtJoa.v3ZPVYqM.u9n1cK',1,'nc1@nc1.com','New Client 1'),('shreyansh','1234',1,'gys@tfgh.com','SHj'),('shreyansh26','abcde@12345',1,NULL,'Shreyansh'),('shs26','abcd123',1,'ss@sssss.com','Shreyansh Singh'),('ss26','$2a$10$plFB.48d8X01rhvyQWctROw.FPSWuPLCWxKhfWX2QcixaE6DyfUfq',1,'ss@sss.com','Shreyansh');
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `USERS_ROLES`
--

LOCK TABLES `USERS_ROLES` WRITE;
/*!40000 ALTER TABLE `USERS_ROLES` DISABLE KEYS */;
INSERT INTO `USERS_ROLES` VALUES (1,'shreyansh26','ROLE_USER'),(2,'admin','ROLE_ADMIN'),(13,'ss26','ROLE_CLIENT'),(15,'emp1','ROLE_EMPLOYEE'),(16,'aaaaa','ROLE_EMPLOYEE'),(17,'emp2','ROLE_EMPLOYEE'),(18,'shs26','ROLE_CLIENT'),(19,'shreyansh','ROLE_CLIENT'),(20,'nc1','ROLE_CLIENT'),(21,'abcd','ROLE_CLIENT'),(22,'cl2','ROLE_CLIENT'),(23,'emp3','ROLE_EMPLOYEE');
/*!40000 ALTER TABLE `USERS_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('emp1','Employee1','s@s.com','2009-12-30','fgfg','bgbn','gbg',12000,'Female'),('aaaaa','SSS','aa@aa.com',NULL,NULL,NULL,NULL,12000,NULL),('emp2','Employee2','emp2@emp.com',NULL,NULL,NULL,NULL,12000,NULL),('emp3','Employee 3','emp3@gmail.com',NULL,NULL,NULL,NULL,10000,NULL);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('abcd','ABCD',NULL,NULL,NULL,'aa@cd.com'),('cl2','Client 2',NULL,NULL,NULL,'cl2@gmail.com'),('nc1','New Client 1',NULL,NULL,NULL,'nc1@nc1.com'),('shreyansh','SHj',NULL,NULL,NULL,'gys@tfgh.com'),('shs26','Shreyansh Singh','1234',';d;kghdklb',';ojd;kgh','ss@sssss.com'),('ss26','Shreyansh','23','Ashoka Street','Jamshedpur','ss@sss.com');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('Industrial Aprons',300),('Industrial Gloves',150);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('06bd146b-a1c3-4b8b-baa3-960107c8ca761538118928','ss26','Industrial Aprons',4,'Done'),('06bd146b-a1c3-4b8b-baa3-960107c8ca761538118928','ss26','Industrial Gloves',NULL,'Not ready'),('0cb5dbbe-b2bb-407c-a7de-2378bfea539f1538108224','ss26','Industrial Aprons',1,'Done'),('0cb5dbbe-b2bb-407c-a7de-2378bfea539f1538108224','ss26','Industrial Gloves',3,'Done'),('179c254c-65cb-4f7b-af96-a8495ebc6cd11538119655','ss26','Industrial Aprons',2,'Not ready'),('179c254c-65cb-4f7b-af96-a8495ebc6cd11538119655','ss26','Industrial Gloves',4,'Not ready'),('1b91fb98-1e13-46be-873d-a888b79eab121538251046','ss26','Industrial Aprons',2,'Not ready'),('1b91fb98-1e13-46be-873d-a888b79eab121538251046','ss26','Industrial Gloves',NULL,'Not ready'),('1bfb3c3c-790b-400d-bee3-a8f5b31dd00b1538311615','ss26','Industrial Aprons',1,'Not ready'),('1bfb3c3c-790b-400d-bee3-a8f5b31dd00b1538311615','ss26','Industrial Gloves',NULL,'Not ready'),('1d9ead14-8f97-4bb6-8600-ba714ffd164c1538111389','ss26','Industrial Aprons',3,'Not ready'),('1d9ead14-8f97-4bb6-8600-ba714ffd164c1538111389','ss26','Industrial Gloves',4,'Not ready'),('2214d46d-1745-45b7-a519-33ba03c1e7721538311401','ss26','Industrial Aprons',NULL,'Not ready'),('2214d46d-1745-45b7-a519-33ba03c1e7721538311401','ss26','Industrial Gloves',4,'Not ready'),('27911f32-9707-45af-a95c-bca7f4c9bd9e1538119650','ss26','Industrial Aprons',2,'Not ready'),('27911f32-9707-45af-a95c-bca7f4c9bd9e1538119650','ss26','Industrial Gloves',NULL,'Not ready'),('29e37785-cd7d-497c-a155-5df946ec7e9a1538111419','ss26','Industrial Aprons',2,'Not ready'),('29e37785-cd7d-497c-a155-5df946ec7e9a1538111419','ss26','Industrial Gloves',4,'Not ready'),('2ac8f115-f361-4bb2-81ed-3897af0379251538250485','ss26','Industrial Aprons',1,'Not ready'),('2ac8f115-f361-4bb2-81ed-3897af0379251538250485','ss26','Industrial Gloves',4,'Not ready'),('2feb8dfc-14ff-4e8a-beb4-65a7f5f686e11538250560','ss26','Industrial Aprons',1,'Not ready'),('2feb8dfc-14ff-4e8a-beb4-65a7f5f686e11538250560','ss26','Industrial Gloves',4,'Not ready'),('306981e0-5166-4630-8e6d-aa78f56c7dd01538118470','ss26','Industrial Aprons',1,'Not ready'),('306981e0-5166-4630-8e6d-aa78f56c7dd01538118470','ss26','Industrial Gloves',6,'Not ready'),('33fa997b-f7b9-48bb-a6c4-bb1954a7f3a41538160005','nc1','Industrial Aprons',1,'Done'),('33fa997b-f7b9-48bb-a6c4-bb1954a7f3a41538160005','nc1','Industrial Gloves',5,'Not ready'),('3f20d9e7-ad7e-42a7-b967-762769f0911c1538250770','ss26','Industrial Aprons',1,'Not ready'),('3f20d9e7-ad7e-42a7-b967-762769f0911c1538250770','ss26','Industrial Gloves',4,'Not ready'),('4391de48-2ff5-4cd0-8be8-5a9cd44e54da1538108406','ss26','Industrial Aprons',3,'Not ready'),('4391de48-2ff5-4cd0-8be8-5a9cd44e54da1538108406','ss26','Industrial Gloves',4,'Not ready'),('4502ef2e-b6b6-4013-a6ed-613cade3a40a1538108216','ss26','Industrial Aprons',2,'Not ready'),('4502ef2e-b6b6-4013-a6ed-613cade3a40a1538108216','ss26','Industrial Gloves',33,'Not ready'),('48821114-622f-4d82-8959-ac92b862bf141538119691','ss26','Industrial Aprons',1,'Not ready'),('48821114-622f-4d82-8959-ac92b862bf141538119691','ss26','Industrial Gloves',2,'Not ready'),('4974563c-2938-4012-b8d8-e8c0192ad9591538250722','ss26','Industrial Aprons',1,'Not ready'),('4974563c-2938-4012-b8d8-e8c0192ad9591538250722','ss26','Industrial Gloves',4,'Not ready'),('4b97126d-9839-41f4-8019-da7d56d611bd1538108286','ss26','Industrial Aprons',1,'Not ready'),('4b97126d-9839-41f4-8019-da7d56d611bd1538108286','ss26','Industrial Gloves',3,'Not ready'),('54676a5e-9c71-4328-b32f-8a15c37a5d8a1538126610','ss26','Industrial Aprons',1,'Not ready'),('54676a5e-9c71-4328-b32f-8a15c37a5d8a1538126610','ss26','Industrial Gloves',3,'Not ready'),('560f7798-3725-46c9-af36-14b16f26b1201538119617','ss26','Industrial Aprons',2,'Not ready'),('560f7798-3725-46c9-af36-14b16f26b1201538119617','ss26','Industrial Gloves',3,'Not ready'),('5a1ed0ba-7535-4118-8d15-1a36b83a58a51538107772','ss26','Industrial Aprons',300,'Not ready'),('5a1ed0ba-7535-4118-8d15-1a36b83a58a51538107772','ss26','Industrial Gloves',111,'Not ready'),('5ee6f352-1f27-4ec3-ad21-78e04742dd771538111254','ss26','Industrial Aprons',2,'Not ready'),('5ee6f352-1f27-4ec3-ad21-78e04742dd771538111254','ss26','Industrial Gloves',45,'Not ready'),('61ef3d56-b8d9-47f7-a319-c606ae143d0b1538108302','ss26','Industrial Aprons',1,'Not ready'),('61ef3d56-b8d9-47f7-a319-c606ae143d0b1538108302','ss26','Industrial Gloves',3,'Not ready'),('6331543e-630c-4b7f-b4d3-93c38b106e191538124949','ss26','Industrial Aprons',50,'Not ready'),('6331543e-630c-4b7f-b4d3-93c38b106e191538124949','ss26','Industrial Gloves',22,'Not ready'),('64f467a3-c225-40d9-a204-d06b464506131538111099','ss26','Industrial Aprons',2,'Not ready'),('64f467a3-c225-40d9-a204-d06b464506131538111099','ss26','Industrial Gloves',4,'Not ready'),('6afa84a3-4e1b-4c08-87bf-6a03d328bd9c1538314241','ss26','Industrial Aprons',NULL,'Not ready'),('6afa84a3-4e1b-4c08-87bf-6a03d328bd9c1538314241','ss26','Industrial Gloves',1,'Not ready'),('6b01f1d5-ebf2-4623-9176-1c1d0ba13d9f1538108217','ss26','Industrial Aprons',1,'Not ready'),('6b01f1d5-ebf2-4623-9176-1c1d0ba13d9f1538108217','ss26','Industrial Gloves',3,'Not ready'),('6d06785b-d40b-428c-8b7e-fb5a6fe988ef1538160189','nc1','Industrial Aprons',4,'Not ready'),('6d06785b-d40b-428c-8b7e-fb5a6fe988ef1538160189','nc1','Industrial Gloves',3,'Not ready'),('72182c38-0ac7-42f4-918f-eafc4352bb8d1538119443','ss26','Industrial Aprons',1,'Not ready'),('72182c38-0ac7-42f4-918f-eafc4352bb8d1538119443','ss26','Industrial Gloves',1,'Not ready'),('762509d0-1d30-43b0-8c6f-b7f646af6eac1538119290','ss26','Industrial Aprons',3,'Not ready'),('762509d0-1d30-43b0-8c6f-b7f646af6eac1538119290','ss26','Industrial Gloves',3,'Not ready'),('79f92dfe-ed11-42ef-8e9b-43a5266feea71538127314','nc1','Industrial Aprons',2,'Done'),('79f92dfe-ed11-42ef-8e9b-43a5266feea71538127314','nc1','Industrial Gloves',5,'Done'),('7c083d49-1805-4fe6-b7de-0322dca347401538107692','ss26','Industrial Aprons',1,'Not ready'),('7c083d49-1805-4fe6-b7de-0322dca347401538107692','ss26','Industrial Gloves',7,'Not ready'),('7c598f87-d5b1-42ff-abda-b3a504b6f4461538314164','ss26','Industrial Aprons',NULL,'Not ready'),('7c598f87-d5b1-42ff-abda-b3a504b6f4461538314164','ss26','Industrial Gloves',1,'Not ready'),('85f0747d-c895-49cf-a904-38d802a680ad1538108355','ss26','Industrial Aprons',1,'Not ready'),('85f0747d-c895-49cf-a904-38d802a680ad1538108355','ss26','Industrial Gloves',2,'Not ready'),('87f7f782-907d-4ccb-8cab-e0276e6e4bfd1538314223','ss26','Industrial Aprons',NULL,'Not ready'),('87f7f782-907d-4ccb-8cab-e0276e6e4bfd1538314223','ss26','Industrial Gloves',1,'Not ready'),('8d191bbf-c826-491b-bf70-76da0de48b871538118956','ss26','Industrial Aprons',1,'Not ready'),('8d191bbf-c826-491b-bf70-76da0de48b871538118956','ss26','Industrial Gloves',5,'Not ready'),('9384a823-0aef-4684-a8b1-ec2bb1145f8e1538108506','ss26','Industrial Aprons',2,'Not ready'),('9384a823-0aef-4684-a8b1-ec2bb1145f8e1538108506','ss26','Industrial Gloves',4,'Not ready'),('95a5a176-2c66-4b7c-9323-0f5718b1eed41538119043','ss26','Industrial Aprons',3,'Not ready'),('95a5a176-2c66-4b7c-9323-0f5718b1eed41538119043','ss26','Industrial Gloves',NULL,'Not ready'),('a3f2754c-cd37-46f1-bd2a-81948f3759f21538111193','ss26','Industrial Aprons',5,'Not ready'),('a3f2754c-cd37-46f1-bd2a-81948f3759f21538111193','ss26','Industrial Gloves',66,'Not ready'),('a4035377-8669-4af6-b883-0b328e2e0c031538250741','ss26','Industrial Aprons',1,'Not ready'),('a4035377-8669-4af6-b883-0b328e2e0c031538250741','ss26','Industrial Gloves',4,'Not ready'),('a46e10f1-3360-4a79-9d4b-82e6196acb8c1538118360','ss26','Industrial Aprons',1,'Not ready'),('a46e10f1-3360-4a79-9d4b-82e6196acb8c1538118360','ss26','Industrial Gloves',7,'Not ready'),('b010b695-05c6-4c00-b216-033bda425a551538311746','ss26','Industrial Aprons',1,'Not ready'),('b010b695-05c6-4c00-b216-033bda425a551538311746','ss26','Industrial Gloves',NULL,'Not ready'),('b0b780e1-143c-4a81-98b5-74bf7b48ac591538311875','ss26','Industrial Aprons',1,'Not ready'),('b0b780e1-143c-4a81-98b5-74bf7b48ac591538311875','ss26','Industrial Gloves',NULL,'Not ready'),('c76c3ca6-17be-4a7c-9b0e-87dd9cbf4d7a1538126524','ss26','Industrial Aprons',4,'Not ready'),('c76c3ca6-17be-4a7c-9b0e-87dd9cbf4d7a1538126524','ss26','Industrial Gloves',5,'Not ready'),('d588de42-cae1-4f63-b55b-3eff5435ba371538312197','ss26','Industrial Aprons',1,'Not ready'),('d588de42-cae1-4f63-b55b-3eff5435ba371538312197','ss26','Industrial Gloves',NULL,'Not ready'),('dd0ac466-229e-41fe-a357-a1fc1130a1931538108266','ss26','Industrial Aprons',1,'Not ready'),('dd0ac466-229e-41fe-a357-a1fc1130a1931538108266','ss26','Industrial Gloves',3,'Not ready'),('df233242-ae08-4260-933e-4442353ad44a1538118684','ss26','Industrial Aprons',5,'Not ready'),('df233242-ae08-4260-933e-4442353ad44a1538118684','ss26','Industrial Gloves',6,'Not ready'),('e1308e07-65c7-4bca-bbff-70bd9f67f7fc1538118842','ss26','Industrial Aprons',4,'Not ready'),('e1308e07-65c7-4bca-bbff-70bd9f67f7fc1538118842','ss26','Industrial Gloves',4,'Not ready'),('e376affa-3333-43b9-95e7-36dd32c479c41538128638','ss26','Industrial Aprons',3,'Not ready'),('e376affa-3333-43b9-95e7-36dd32c479c41538128638','ss26','Industrial Gloves',7,'Not ready'),('e5a45a97-037e-4c6e-aa8c-242ade38cced1538160013','nc1','Industrial Aprons',6,'Not ready'),('e5a45a97-037e-4c6e-aa8c-242ade38cced1538160013','nc1','Industrial Gloves',5,'Not ready'),('e66e5ac4-8666-45eb-82c5-b2f13d19fd191538119549','ss26','Industrial Aprons',2,'Not ready'),('e66e5ac4-8666-45eb-82c5-b2f13d19fd191538119549','ss26','Industrial Gloves',3,'Not ready'),('e87b2884-eb4a-495a-b6a7-afe17d07f9881538108162','ss26','Industrial Aprons',2,'Not ready'),('e87b2884-eb4a-495a-b6a7-afe17d07f9881538108162','ss26','Industrial Gloves',33,'Not ready'),('f090e276-111f-4c33-9aaa-86d4213b22b71538118325','ss26','Industrial Aprons',1,'Not ready'),('f090e276-111f-4c33-9aaa-86d4213b22b71538118325','ss26','Industrial Gloves',7,'Not ready'),('f3f70759-139d-4d12-8258-9c56988a06a41538118735','ss26','Industrial Aprons',3,'Not ready'),('f3f70759-139d-4d12-8258-9c56988a06a41538118735','ss26','Industrial Gloves',3,'Not ready'),('f8a72f07-1273-4475-904d-26353cc29ebb1538119829','ss26','Industrial Aprons',5,'Not ready'),('f8a72f07-1273-4475-904d-26353cc29ebb1538119829','ss26','Industrial Gloves',5,'Not ready'),('fa87e659-cc15-4264-84a6-763da50e91841538314022','ss26','Industrial Aprons',1,'Not ready'),('fa87e659-cc15-4264-84a6-763da50e91841538314022','ss26','Industrial Gloves',2,'Not ready');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rawmaterials`
--

LOCK TABLES `rawmaterials` WRITE;
/*!40000 ALTER TABLE `rawmaterials` DISABLE KEYS */;
INSERT INTO `rawmaterials` VALUES ('Cotton Cloth'),('Leather'),('Plastic'),('Thread');
/*!40000 ALTER TABLE `rawmaterials` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES ('Steel Works','123','Sakchi','Jamshedpur','sw@sw.com','999933132'),('Steel Works2','','','','',''),('Sup2','Ashoka','Gardens','Jamshedpur','sup2@gmail.com','8989898989');
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `supplyRawMaterial`
--

LOCK TABLES `supplyRawMaterial` WRITE;
/*!40000 ALTER TABLE `supplyRawMaterial` DISABLE KEYS */;
INSERT INTO `supplyRawMaterial` VALUES ('Steel Works','Leather'),('Sup2','Leather'),('Steel Works','Plastic'),('Steel Works2','Plastic'),('Sup2','Plastic');
/*!40000 ALTER TABLE `supplyRawMaterial` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Dumping data for table `Attendance`
--

LOCK TABLES `Attendance` WRITE;
/*!40000 ALTER TABLE `Attendance` DISABLE KEYS */;
INSERT INTO `Attendance` VALUES ('emp1','2018-09-27','Present'),('emp1','2018-09-29','Present'),('emp2','2018-09-27','Present');
/*!40000 ALTER TABLE `Attendance` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `Feedback`
--

LOCK TABLES `Feedback` WRITE;
/*!40000 ALTER TABLE `Feedback` DISABLE KEYS */;
INSERT INTO `Feedback` VALUES (1,'ss26','2018-09-27','My feedback is good.'),(2,'nc1','2018-09-30','Good feedback');
/*!40000 ALTER TABLE `Feedback` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
INSERT INTO `Invoice` VALUES (1,'ss26','c76c3ca6-17be-4a7c-9b0e-87dd9cbf4d7a1538126524','2018-09-28','2018-10-05',1500),(2,'ss26','54676a5e-9c71-4328-b32f-8a15c37a5d8a1538126610','2018-09-28','2018-10-05',550),(3,'nc1','79f92dfe-ed11-42ef-8e9b-43a5266feea71538127314','2018-09-28','2018-10-05',1000),(4,'ss26','e376affa-3333-43b9-95e7-36dd32c479c41538128638','2018-09-28','2018-10-05',1450),(5,'nc1','33fa997b-f7b9-48bb-a6c4-bb1954a7f3a41538160005','2018-09-29','2018-10-06',1050),(6,'nc1','e5a45a97-037e-4c6e-aa8c-242ade38cced1538160013','2018-09-29','2018-10-06',2550),(7,'nc1','6d06785b-d40b-428c-8b7e-fb5a6fe988ef1538160189','2018-09-29','2018-10-06',1650),(8,'ss26','2ac8f115-f361-4bb2-81ed-3897af0379251538250485','2018-09-30','2018-10-07',900),(9,'ss26','2feb8dfc-14ff-4e8a-beb4-65a7f5f686e11538250560','2018-09-30','2018-10-07',900),(10,'ss26','4974563c-2938-4012-b8d8-e8c0192ad9591538250722','2018-09-30','2018-10-07',900),(11,'ss26','a4035377-8669-4af6-b883-0b328e2e0c031538250741','2018-09-30','2018-10-07',900),(12,'ss26','3f20d9e7-ad7e-42a7-b967-762769f0911c1538250770','2018-09-30','2018-10-07',900),(13,'ss26','1b91fb98-1e13-46be-873d-a888b79eab121538251046','2018-09-30','2018-10-07',600),(14,'ss26','d588de42-cae1-4f63-b55b-3eff5435ba371538312197','2018-09-30','2018-10-07',300),(15,'ss26','fa87e659-cc15-4264-84a6-763da50e91841538314022','2018-09-30','2018-10-07',600),(16,'ss26','7c598f87-d5b1-42ff-abda-b3a504b6f4461538314164','2018-09-30','2018-10-07',150),(17,'ss26','87f7f782-907d-4ccb-8cab-e0276e6e4bfd1538314223','2018-09-30','2018-10-07',150),(18,'ss26','6afa84a3-4e1b-4c08-87bf-6a03d328bd9c1538314241','2018-09-30','2018-10-07',150);
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES ('06bd146b-a1c3-4b8b-baa3-960107c8ca761538118928','ss26','Car','99898989','2018-10-22','Industrial Aprons'),('0cb5dbbe-b2bb-407c-a7de-2378bfea539f1538108224','ss26','Bus','08080808','2018-10-09','Industrial Gloves'),('33fa997b-f7b9-48bb-a6c4-bb1954a7f3a41538160005','nc1','Bus','88998989','2018-10-21','Industrial Aprons'),('79f92dfe-ed11-42ef-8e9b-43a5266feea71538127314','nc1','Truck','922525922','2018-10-11','Industrial Aprons');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-01 13:57:11
