-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: sqlproject
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `sheet1`
--

DROP TABLE IF EXISTS `sheet1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sheet1` (
  `Column_1` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheet1`
--

LOCK TABLES `sheet1` WRITE;
/*!40000 ALTER TABLE `sheet1` DISABLE KEYS */;
/*!40000 ALTER TABLE `sheet1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `공지사항`
--

DROP TABLE IF EXISTS `공지사항`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `공지사항` (
  `공지ID` int NOT NULL,
  `공지내용` varchar(1000) NOT NULL,
  `작성일` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`공지ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `공지사항`
--

LOCK TABLES `공지사항` WRITE;
/*!40000 ALTER TABLE `공지사항` DISABLE KEYS */;
INSERT INTO `공지사항` VALUES (1,'시스템 점검은 매주 월요일 새벽에 진행됩니다.','2026-05-27 12:12:00'),(2,'신규 상품이 업데이트되었습니다.','2026-05-27 12:12:00'),(3,'이벤트 참여 시 포인트가 지급됩니다.','2026-05-27 12:12:00');
/*!40000 ALTER TABLE `공지사항` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `관리자`
--

DROP TABLE IF EXISTS `관리자`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `관리자` (
  `아이디` varchar(30) NOT NULL,
  `비밀번호` varchar(100) NOT NULL,
  `이름` varchar(50) NOT NULL,
  PRIMARY KEY (`아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `관리자`
--

LOCK TABLES `관리자` WRITE;
/*!40000 ALTER TABLE `관리자` DISABLE KEYS */;
INSERT INTO `관리자` VALUES ('admin01','admin1234','관리자1'),('admin02','admin1234','관리자2');
/*!40000 ALTER TABLE `관리자` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `마이페이지`
--

DROP TABLE IF EXISTS `마이페이지`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `마이페이지` (
  `회원아이디` varchar(30) NOT NULL,
  `프로필이미지` varchar(255) DEFAULT NULL,
  `닉네임` varchar(50) DEFAULT NULL,
  `이름` varchar(50) DEFAULT NULL,
  `소개` varchar(255) DEFAULT NULL,
  `가입일` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`회원아이디`),
  CONSTRAINT `FK_마이페이지_회원` FOREIGN KEY (`회원아이디`) REFERENCES `회원` (`회원아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `마이페이지`
--

LOCK TABLES `마이페이지` WRITE;
/*!40000 ALTER TABLE `마이페이지` DISABLE KEYS */;
INSERT INTO `마이페이지` VALUES ('user01','profile1.jpg','민수짱','김민수','편의점 신상 좋아합니다','2026-05-27 12:12:00'),('user02','profile2.jpg','서연','이서연','야식 러버','2026-05-27 12:12:00'),('user03','profile3.jpg','훈이','박지훈','매일 편의점 갑니다','2026-05-27 12:12:00'),('user04','profile4.jpg','유진','최유진','1일 1커피','2026-05-27 12:12:00'),('user05','profile5.jpg','현우','정현우','삼각김밥 마니아','2026-05-27 12:12:00');
/*!40000 ALTER TABLE `마이페이지` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `상품`
--

DROP TABLE IF EXISTS `상품`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `상품` (
  `상품명` varchar(100) NOT NULL,
  `재고량` int NOT NULL DEFAULT '0',
  `단가` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`상품명`),
  CONSTRAINT `CK_상품_단가` CHECK ((`단가` >= 0)),
  CONSTRAINT `CK_상품_재고량` CHECK ((`재고량` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `상품`
--

LOCK TABLES `상품` WRITE;
/*!40000 ALTER TABLE `상품` DISABLE KEYS */;
INSERT INTO `상품` VALUES ('감자칩',70,2500),('삼각김밥',100,1200),('초코우유',50,1500),('컵라면',60,1800),('콜라',80,2000);
/*!40000 ALTER TABLE `상품` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `재고`
--

DROP TABLE IF EXISTS `재고`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `재고` (
  `재고ID` int NOT NULL,
  `편의점ID` varchar(30) NOT NULL,
  `상품명` varchar(100) NOT NULL,
  `재고수량` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`재고ID`),
  UNIQUE KEY `UQ_재고_편의점_상품` (`편의점ID`,`상품명`),
  KEY `FK_재고_상품` (`상품명`),
  CONSTRAINT `FK_재고_상품` FOREIGN KEY (`상품명`) REFERENCES `상품` (`상품명`),
  CONSTRAINT `FK_재고_편의점` FOREIGN KEY (`편의점ID`) REFERENCES `편의점` (`편의점ID`),
  CONSTRAINT `CK_재고_재고수량` CHECK ((`재고수량` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `재고`
--

LOCK TABLES `재고` WRITE;
/*!40000 ALTER TABLE `재고` DISABLE KEYS */;
INSERT INTO `재고` VALUES (1,'CV001','삼각김밥',30),(2,'CV001','콜라',20),(3,'CV002','컵라면',15),(4,'CV002','초코우유',10),(5,'CV003','감자칩',25);
/*!40000 ALTER TABLE `재고` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `즐겨찾기`
--

DROP TABLE IF EXISTS `즐겨찾기`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `즐겨찾기` (
  `회원아이디` varchar(30) NOT NULL,
  `상품명` varchar(100) NOT NULL,
  `즐겨찾기등록일` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`회원아이디`,`상품명`),
  KEY `FK_즐겨찾기_상품` (`상품명`),
  CONSTRAINT `FK_즐겨찾기_상품` FOREIGN KEY (`상품명`) REFERENCES `상품` (`상품명`),
  CONSTRAINT `FK_즐겨찾기_회원` FOREIGN KEY (`회원아이디`) REFERENCES `회원` (`회원아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `즐겨찾기`
--

LOCK TABLES `즐겨찾기` WRITE;
/*!40000 ALTER TABLE `즐겨찾기` DISABLE KEYS */;
INSERT INTO `즐겨찾기` VALUES ('user01','삼각김밥','2026-05-27 12:12:00'),('user01','콜라','2026-05-27 12:12:00'),('user02','컵라면','2026-05-27 12:12:00'),('user03','초코우유','2026-05-27 12:12:00'),('user04','감자칩','2026-05-27 12:12:00');
/*!40000 ALTER TABLE `즐겨찾기` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `편의점`
--

DROP TABLE IF EXISTS `편의점`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `편의점` (
  `편의점ID` varchar(30) NOT NULL,
  `편의점명` varchar(100) NOT NULL,
  `지점명` varchar(100) DEFAULT NULL,
  `지점위치` varchar(255) DEFAULT NULL,
  `GPS정보(위도)` decimal(9,6) DEFAULT NULL,
  `GPS정보(경도)` decimal(9,6) DEFAULT NULL,
  `전화번호` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`편의점ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `편의점`
--

LOCK TABLES `편의점` WRITE;
/*!40000 ALTER TABLE `편의점` DISABLE KEYS */;
INSERT INTO `편의점` VALUES ('CV001','CU','강남점','서울 강남구',37.497942,127.027621,'02-1111-1111'),('CV002','GS25','홍대점','서울 마포구',37.556350,126.922000,'02-2222-2222'),('CV003','세븐일레븐','잠실점','서울 송파구',37.513261,127.100133,'02-3333-3333');
/*!40000 ALTER TABLE `편의점` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `회원`
--

DROP TABLE IF EXISTS `회원`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `회원` (
  `회원아이디` varchar(30) NOT NULL,
  `비밀번호` varchar(100) NOT NULL,
  `이메일` varchar(100) DEFAULT NULL,
  `이름` varchar(50) NOT NULL,
  `나이` int DEFAULT '0',
  `생성일` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`회원아이디`),
  UNIQUE KEY `UQ_회원_이메일` (`이메일`),
  CONSTRAINT `CK_회원_나이` CHECK ((`나이` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `회원`
--

LOCK TABLES `회원` WRITE;
/*!40000 ALTER TABLE `회원` DISABLE KEYS */;
INSERT INTO `회원` VALUES ('user01','pass1234','kim01@email.com','김민수',24,'2026-05-27 12:12:00'),('user02','pass1234','lee02@email.com','이서연',27,'2026-05-27 12:12:00'),('user03','pass1234','park03@email.com','박지훈',22,'2026-05-27 12:12:00'),('user04','pass1234','choi04@email.com','최유진',30,'2026-05-27 12:12:00'),('user05','pass1234','jung05@email.com','정현우',26,'2026-05-27 12:12:00');
/*!40000 ALTER TABLE `회원` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `회원정보`
--

DROP TABLE IF EXISTS `회원정보`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `회원정보` (
  `회원아이디` varchar(30) NOT NULL,
  `이메일` varchar(100) DEFAULT NULL,
  `전화번호` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`회원아이디`),
  CONSTRAINT `FK_회원정보_회원` FOREIGN KEY (`회원아이디`) REFERENCES `회원` (`회원아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `회원정보`
--

LOCK TABLES `회원정보` WRITE;
/*!40000 ALTER TABLE `회원정보` DISABLE KEYS */;
INSERT INTO `회원정보` VALUES ('user01','kim01@email.com','010-1111-1111'),('user02','lee02@email.com','010-2222-2222'),('user03','park03@email.com','010-3333-3333'),('user04','choi04@email.com','010-4444-4444'),('user05','jung05@email.com','010-5555-5555');
/*!40000 ALTER TABLE `회원정보` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-29 13:56:46
