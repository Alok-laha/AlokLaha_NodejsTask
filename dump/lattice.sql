-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: lattice
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patientID` int NOT NULL AUTO_INCREMENT,
  `patientName` varchar(20) NOT NULL,
  `patientPhoneNumber` varchar(10) NOT NULL DEFAULT '0000000000',
  `patientAddress` varchar(100) NOT NULL,
  `patientEmail` varchar(100) NOT NULL,
  `patientPassword` varchar(100) NOT NULL DEFAULT ' ',
  `patientPhoto` varchar(100) NOT NULL DEFAULT ' ',
  `userID` int NOT NULL,
  `patientCreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`patientID`),
  UNIQUE KEY `patientPhoneNumber` (`patientPhoneNumber`),
  UNIQUE KEY `patientEmail` (`patientEmail`),
  UNIQUE KEY `patientPhoneNumber_2` (`patientPhoneNumber`),
  UNIQUE KEY `patientEmail_2` (`patientEmail`),
  UNIQUE KEY `patientPhoneNumber_3` (`patientPhoneNumber`),
  UNIQUE KEY `patientEmail_3` (`patientEmail`),
  UNIQUE KEY `patientPhoneNumber_4` (`patientPhoneNumber`),
  UNIQUE KEY `patientEmail_4` (`patientEmail`),
  UNIQUE KEY `patientEmail_5` (`patientEmail`),
  UNIQUE KEY `patientEmail_6` (`patientEmail`),
  UNIQUE KEY `patientEmail_7` (`patientEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Ayan','9051224756','Nischinda bally','ayan@gmail.com','1234',' ',1,'2021-04-23 14:15:53'),(2,'Alok','7980143133','Nischinda Ghoshpara','alok@gmail.com','$2b$12$/g9skqlkO0eI.IC2qIoFOOxLEHv9a25EbTRxB24dXt9pwu7uLi/DO',' ',1,'2021-04-23 15:35:05'),(3,'Anik','1122445533','sdgfiuwbfgiurejwg','uufg@gmail.com','$2b$12$K7oPYLvUcXyAzZe7iejeSuf4/.FA8cvXdOosBlbCN9PtZf03FsIIa','12th_grade_card.jpg',1,'2021-04-24 03:58:34'),(4,'Avik','7970143133','Nischinda Ghoshpara','avik@gmail.com','$2b$12$cNh/2qDp9PHnP7tySfU8IOS0NksbbS/qDBEfyN97eEmEGSc1HRVE.',' ',1,'2021-04-24 04:16:35'),(5,'Mr. x','4578156987','delhi','x@gmail.com','123456','',1,'2021-04-24 04:33:59'),(6,'Mr. a','4578115417','delhi','a@gmail.com','123456','',1,'2021-04-24 04:33:59'),(7,'Mr. b','457815417','delhi','b@gmail.com','123456','',1,'2021-04-24 04:33:59'),(8,'Mr. c','4578715417','delhi','c@gmail.com','123456','',1,'2021-04-24 04:33:59'),(9,'Mr. d','5578118417','delhi','d@gmail.com','123456','',1,'2021-04-24 04:33:59'),(10,'Mr. e','4578015417','delhi','e@gmail.com','123456','',1,'2021-04-24 04:33:59'),(11,'Mr. f','4557125417','delhi','f@gmail.com','123456','',1,'2021-04-24 04:33:59'),(12,'Mr. g','5501115417','delhi','g@gmail.com','123456','',1,'2021-04-24 04:33:59'),(13,'Mr. h','4570015417','delhi','h@gmail.com','123456','',1,'2021-04-24 04:33:59'),(14,'Mr. i','5578112217','delhi','i@gmail.com','123456','',1,'2021-04-24 04:33:59'),(15,'Mr. j','5578114417','delhi','j@gmail.com','123456','',1,'2021-04-24 04:33:59'),(16,'Mr. k','5557115417','delhi','k@gmail.com','123456','',1,'2021-04-24 04:33:59'),(17,'Mr. l','4578005417','delhi','l@gmail.com','123456','',1,'2021-04-24 04:33:59'),(18,'Mr. m','4588811541','delhi','m@gmail.com','123456','',1,'2021-04-24 04:33:59'),(19,'Mr. n','5555115417','delhi','n@gmail.com','123456','',1,'2021-04-24 04:33:59'),(20,'Mr. o','5571115417','delhi','o@gmail.com','123456','',1,'2021-04-24 04:33:59'),(21,'Mr. p','5556115417','delhi','p@gmail.com','123456','',1,'2021-04-24 04:33:59'),(22,'Mr. q','5577115417','delhi','q@gmail.com','123456','',1,'2021-04-24 04:33:59'),(23,'Mr. r','5578115337','delhi','r@gmail.com','123456','',1,'2021-04-24 04:33:59'),(24,'Mr. s','4578155417','delhi','s@gmail.com','123456','',1,'2021-04-24 04:33:59'),(25,'Mr. t','5578115417','delhi','t@gmail.com','123456','',1,'2021-04-24 04:33:59'),(26,'Mr. u','5578120417','delhi','u@gmail.com','123456','',1,'2021-04-24 04:33:59'),(27,'Mr. v','5578115407','delhi','v@gmail.com','123456','',1,'2021-04-24 04:33:59'),(28,'Mr. ab','1122334455','delhi','ab@gmail.com','123456','',7,'2021-04-24 04:33:59'),(29,'Mr. bc','1122334456','delhi','bc@gmail.com','123456','',7,'2021-04-24 04:33:59'),(30,'Mr. cc','1122334457','delhi','cc@gmail.com','123456','',8,'2021-04-24 04:33:59'),(31,'Mr. dd','1122334458','delhi','dd@gmail.com','123456','',16,'2021-04-24 04:33:59'),(32,'Mr. ee','1122334459','delhi','ee@gmail.com','123456','',17,'2021-04-24 04:33:59'),(33,'Mr. ff','1122334450','delhi','ff@gmail.com','123456','',7,'2021-04-24 04:33:59'),(34,'Mr. gg','1122334400','delhi','gg@gmail.com','123456','',17,'2021-04-24 04:33:59'),(35,'Mr. hh','1122330055','delhi','hh@gmail.com','123456','',17,'2021-04-24 04:33:59'),(36,'Mr. ii','1122330155','delhi','ii@gmail.com','123456','',26,'2021-04-24 04:33:59'),(37,'Mr. jj','1122330255','delhi','jj@gmail.com','123456','',26,'2021-04-24 04:33:59'),(38,'Mr. kk','1122330355','delhi','kk@gmail.com','123456','',26,'2021-04-24 04:33:59'),(39,'Mr. ll','1122330455','delhi','ll@gmail.com','123456','',48,'2021-04-24 04:33:59'),(40,'Mr. mm','1122330555','delhi','mm@gmail.com','123456','',1,'2021-04-24 04:33:59'),(41,'Mr. nn','1122330655','delhi','nn@gmail.com','123456','',10,'2021-04-24 04:33:59'),(42,'Mr. oo','1122330755','delhi','oo@gmail.com','123456','',12,'2021-04-24 04:33:59'),(43,'Mr. pp','1122330855','delhi','pp@gmail.com','123456','',18,'2021-04-24 04:33:59'),(44,'Mr. qq','1122330078','delhi','qq@gmail.com','123456','',20,'2021-04-24 04:33:59'),(45,'Mr. rr','1122330955','delhi','rr@gmail.com','123456','',1,'2021-04-24 04:33:59'),(46,'Mr. ss','1122004455','delhi','ss@gmail.com','123456','',15,'2021-04-24 04:33:59'),(47,'Mr. tt','1122014455','delhi','tt@gmail.com','123456','',15,'2021-04-24 04:33:59'),(48,'Mr. uu','1122024455','delhi','uu@gmail.com','123456','',15,'2021-04-24 04:33:59'),(49,'Mr. vv','1122054455','delhi','vv@gmail.com','123456','',19,'2021-04-24 04:33:59'),(50,'Mr. ww','1122065544','delhi','ww@gmail.com','123456','',19,'2021-04-24 04:33:59');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `userPassword` varchar(100) NOT NULL DEFAULT 'password',
  `hospitalName` varchar(100) NOT NULL DEFAULT ' ',
  `state` varchar(20) DEFAULT NULL,
  `userPincode` varchar(10) DEFAULT NULL,
  `userCreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`),
  UNIQUE KEY `phoneNumber_2` (`phoneNumber`),
  UNIQUE KEY `phoneNumber_3` (`phoneNumber`),
  UNIQUE KEY `phoneNumber_4` (`phoneNumber`),
  UNIQUE KEY `phoneNumber_5` (`phoneNumber`),
  UNIQUE KEY `phoneNumber_6` (`phoneNumber`),
  UNIQUE KEY `phoneNumber_7` (`phoneNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alok','Laha','7980143133','$2b$12$txlXqo/XlQyQzhSDO57ZMOIXesi6yKp8LZ1AMTMGUwW8iXDTJPCzS','Apollo','west bengal','711221','2021-04-23 09:49:23'),(4,'Ayan','Laha','9051224756','$2b$12$37wG4uJbgmD4qb51TCGviuJB679t3guGPyySSI6QSSaFvC4Fu8i42','Apollo','west bengal','711221','2021-04-23 10:05:29'),(5,'Ayan','Laha','9051224757','$2b$12$rD2UvGF0yShJdQVF95U4uuzMzt9a7qD7O4oZ.Gc/jHBwznPw5EDji','AIIMS - All India Institute Of Medical Science','west bengal','711221','2021-04-24 04:31:10'),(6,'Ayan','Laha','9051224758','$2b$12$eqbcJ3gYvvczs0w1GDDclOEBTrM/MJJj6u.qKAZmXjsYEmFtbkS7u','AIIMS - All India Institute Of Medical Science','west bengal','711221','2021-04-24 04:31:22'),(7,'Ayan','Laha','9051224759','$2b$12$alZbGBve0IgAfQBH0ys7t.A/skl1HxVbcGG/aXQlG8eILOe0kGd2i','AIIMS - All India Institute Of Medical Science','west bengal','711221','2021-04-24 04:31:27'),(8,'Ayan','Laha','9051224750','$2b$12$RkFBiTi5yY152EIpAxB7ZufQWf5.IkRJtRvM8b7d9gWrySsgld1Hm','AIIMS - All India Institute Of Medical Science','west bengal','711221','2021-04-24 04:31:33'),(9,'Ayan','Laha','0051224750','$2b$12$6cG.MvpvLiGtr3BP.T1MVuMpurVBgCDZWGhIQpfO2H88VpdtBr0eG','AIIMS - All India Institute Of Medical Science','west bengal','711221','2021-04-24 04:31:42'),(10,'Ayan','Laha','1051224750','$2b$12$hBlqJ7pfaKLG22/ntHKWses5/z0jcC59zLWzieOukVD.8dBui7zLW','AIIMS - All India Institute Of Medical Science','west bengal','711221','2021-04-24 04:31:49'),(11,'Ayan','Laha','2051224750','$2b$12$/CZ9zxBFRBtk1n7cXFVC4Okzhg9SwZONWS/NuOtv0ky/WBithPAqS','AIIMS - All India Institute Of Medical Science','west bengal','711221','2021-04-24 04:31:56'),(12,'Ayan','Laha','3051224750','$2b$12$Myq9Nmtroa0a/rrzk1lT6.RFbeC50Wi1ywZfW0SeHLzuDyLKlPZI.','AIIMS - All India Institute Of Medical Science','west bengal','711221','2021-04-24 04:32:01'),(13,'Agh','Laha','4051224750','$2b$12$BXm3vVf4X20T0GeE153/yOgmz0JBRf3eAJKXUVsgRBNgTP0boRzBy','AIIMS - All India Institute Of Medical Science','west bengal','711221','2021-04-24 04:32:21'),(14,'Elom','mask','5051224750','$2b$12$Bku2TElz8UH0EItbBK0xI.5aUZk37jEF6YNstkXiU109izHHpsDKW','Indira Gandhi Institute of Medical Sciences (IGIMS)','west bengal','711221','2021-04-24 04:33:46'),(15,'Elok','mask','6051224750','$2b$12$BpWAYZEtD38SU7ZWDcbhs.D2.i15OTGSU5tMxoFB7A5QdvyHt7Ux2','Indira Gandhi Institute of Medical Sciences (IGIMS)','west bengal','711221','2021-04-24 04:33:59'),(16,'Eloj','mask','7051224750','$2b$12$1PXQhtzRwmRxKcPXdDRorebTF1Z1BtdvW6lddQoNHtd03QrpnsW5.','Indira Gandhi Institute of Medical Sciences (IGIMS)','west bengal','711221','2021-04-24 04:34:08'),(17,'Eloh','mask','8051224750','$2b$12$tY2yeuQCC.k8Ceh.DaADgueEejrSw/NyXuqieFzVw6CSNr5QeFW3u','Indira Gandhi Institute of Medical Sciences (IGIMS)','west bengal','711221','2021-04-24 04:34:17'),(18,'Elof','mhuj','8151224750','$2b$12$YjLsLP2nABlMnZyEm/OZf.f3IC1ECZwHpnv/G0h7SuhNjUpr07oj6','Indira Gandhi Institute of Medical Sciences (IGIMS)','west bengal','711221','2021-04-24 04:34:53'),(19,'Elof','mhhu','8251224750','$2b$12$mT.54H1lKxOdc5netWj91eH7p5dk4mNb1FIBs04WutdPTE2qfWZVe','Indira Gandhi Institute of Medical Sciences (IGIMS)','west bengal','711221','2021-04-24 04:35:03'),(20,'Elof','drhu','8351224750','$2b$12$g3fXoYPe3kYCILozv/P4veALbeqEYIhfXFosmXMM652BMVHf3rImO','Indira Gandhi Institute of Medical Sciences (IGIMS)','west bengal','711221','2021-04-24 04:35:15'),(21,'Elyu','drhugh','8451224750','$2b$12$GQJURdlJ1pq4GpzyKvrcO.WEWR2Vp1Wc6sKgyD5Ao4I8fv2Bg2Auy','Indira Gandhi Institute of Medical Sciences (IGIMS)','west bengal','711221','2021-04-24 04:35:38'),(22,'frtyu','drhugh','8551224750','$2b$12$Opx4DDl6MrWHLR2TBEnJ6uY9gnWBcjtNhluk3VPGI8C5bWP3eMl/a','Indira Gandhi Institute of Medical Sciences (IGIMS)','west bengal','711221','2021-04-24 04:35:52'),(23,'ddtyu','drhyuh','8651224750','$2b$12$5ub7obZ/F8lsEvkJLOOIb.YE5xrQpwV9Nltl.1XffA5ufl3yeuQcS','Indira Gandhi Institute of Medical Sciences (IGIMS)','west bengal','711221','2021-04-24 04:36:05'),(24,'ddddd','drhfg','8751224750','$2b$12$A1DOMfNii9YMSVo3iG2Y6ep0AfoVAHtx.5jnAEKP3HvIkuG2EcC3u','Apollo Hospitals','west bengal','711221','2021-04-24 04:38:53'),(25,'dddde','drhfg','8851224750','$2b$12$CbXpZ7uLfpJhudrSDCBaceVkGJ8NegMmz5gVQcbqwkst0F5PX2Voa','Apollo Hospitals','west bengal','711221','2021-04-24 04:39:02'),(26,'dddee','drhfg','8951224750','$2b$12$7KeIOlflQzVnUXw7VSR46eTFp/0CwVVBT0GNoPgWFh41Axc2Pxq8a','Apollo Hospitals','west bengal','711221','2021-04-24 04:39:09'),(27,'ddeee','drhfg','8911224750','$2b$12$3ioIYH7YAqXK97siE7zNweytAPCX2XgYgw0EMMpLyBeUetKoyfYHK','Apollo Hospitals','west bengal','711221','2021-04-24 04:39:23'),(28,'ddeee','drhfg','8921224750','$2b$12$L2PaPFqk/eoe5Z3Oei6lH.nB8OkUOeOsdHwdhFq140/5fuEJNbbXy','Apollo Hospitals','west bengal','711221','2021-04-24 04:39:36'),(29,'ddefge','drhfg','8931224750','$2b$12$xaY5q/CZePa9h5QQXH4uruzeHYaKp135io.vk8QIkjEwHBG.fuA9S','Apollo Hospitals','west bengal','711221','2021-04-24 04:39:46'),(30,'abcd','efgh','4578965412','1234','Apollo Hospitals','delhi','711225','2021-04-24 04:33:59'),(31,'abffd','efgh','4578865412','1234','Apollo Hospitals','delhi','711225','2021-04-24 04:33:59'),(32,'abcd','efgh','4578775412','1234','Apollo Hospitals','delhi','711225','2021-04-24 04:33:59'),(33,'abcd','efgh','4575565412','1234','Apollo Hospitals','delhi','711225','2021-04-24 04:33:59'),(34,'abcd','efgh','4576665412','1234','Apollo Hospitals','delhi','711225','2021-04-24 04:33:59'),(35,'abcd','efgh','4578145412','1234','Apollo Hospitals','delhi','711225','2021-04-24 04:33:59'),(36,'abcd','efgh','4578920412','1234','Apollo Hospitals','delhi','711225','2021-04-24 04:33:59'),(37,'abcd','efgh','4578325412','1234','Apollo Hospitals','delhi','711225','2021-04-24 04:33:59'),(38,'abcd','efgh','4578115412','1234','Apollo Hospitals','delhi','711225','2021-04-24 04:33:59'),(39,'abcd','efgh','4575665412','1234','Apollo Hospitals','delhi','711225','2021-04-24 04:33:59'),(40,'abcd','efgh','4589965412','1234','Apollo Hospitals','delhi','711225','2021-04-24 04:33:59'),(41,'abcdeegg','efgfghdh','1234567890','1234','Jawaharlal Nehru Medical College and Hospital','delhi','711225','2021-04-24 04:33:59'),(42,'abffd','efgh','1254789630','1234','Jawaharlal Nehru Medical College and Hospital','delhi','711225','2021-04-24 04:33:59'),(43,'abcd','efgh','4578712345','1234','Jawaharlal Nehru Medical College and Hospital','delhi','711225','2021-04-24 04:33:59'),(44,'abcd','efgh','4575565422','1234','Jawaharlal Nehru Medical College and Hospital','delhi','711225','2021-04-24 04:33:59'),(45,'abcd','efgh','4576665423','1234','Jawaharlal Nehru Medical College and Hospital','delhi','711225','2021-04-24 04:33:59'),(46,'abcd','efgh','4578145424','1234','Jawaharlal Nehru Medical College and Hospital','delhi','711225','2021-04-24 04:33:59'),(47,'abcd','efgh','4578920415','1234','Jawaharlal Nehru Medical College and Hospital','delhi','711225','2021-04-24 04:33:59'),(48,'abcd','efgh','4578325416','1234','Jawaharlal Nehru Medical College and Hospital','delhi','711225','2021-04-24 04:33:59'),(49,'abcd','efgh','4578115417','1234','Jawaharlal Nehru Medical College and Hospital','delhi','711225','2021-04-24 04:33:59'),(50,'abcd','efgh','4575665418','1234','Jawaharlal Nehru Medical College and Hospital','delhi','711225','2021-04-24 04:33:59'),(51,'abcd','efgh','4589965419','1234','Jawaharlal Nehru Medical College and Hospital','delhi','711225','2021-04-24 04:33:59');
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

-- Dump completed on 2021-04-24 11:46:50
