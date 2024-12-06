-- MySQL dump 10.13  Distrib 5.7.24, for osx11.1 (x86_64)
--
-- Host: localhost    Database: BloodManagementSystem
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `blood`
--

DROP TABLE IF EXISTS `blood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blood` (
  `Blood_ID` int NOT NULL,
  `Blood_Type` varchar(10) DEFAULT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  `Blood_Bank_ID` int DEFAULT NULL,
  PRIMARY KEY (`Blood_ID`),
  KEY `Blood_Bank_ID` (`Blood_Bank_ID`),
  CONSTRAINT `blood_ibfk_1` FOREIGN KEY (`Blood_Bank_ID`) REFERENCES `blood_bank` (`Blood_Bank_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood`
--

LOCK TABLES `blood` WRITE;
/*!40000 ALTER TABLE `blood` DISABLE KEYS */;
/*!40000 ALTER TABLE `blood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_bank`
--

DROP TABLE IF EXISTS `blood_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blood_bank` (
  `Blood_Bank_ID` int NOT NULL,
  `Blood_Type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Blood_Bank_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_bank`
--

LOCK TABLES `blood_bank` WRITE;
/*!40000 ALTER TABLE `blood_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `blood_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_bank_manager`
--

DROP TABLE IF EXISTS `blood_bank_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blood_bank_manager` (
  `Employee_ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Contact_Number` varchar(15) DEFAULT NULL,
  `Blood_Bank_ID` int DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `Blood_Bank_ID` (`Blood_Bank_ID`),
  CONSTRAINT `blood_bank_manager_ibfk_1` FOREIGN KEY (`Blood_Bank_ID`) REFERENCES `blood_bank` (`Blood_Bank_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_bank_manager`
--

LOCK TABLES `blood_bank_manager` WRITE;
/*!40000 ALTER TABLE `blood_bank_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `blood_bank_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivers`
--

DROP TABLE IF EXISTS `delivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivers` (
  `Hospital_Name` varchar(100) NOT NULL,
  `Patient_ID` int NOT NULL,
  PRIMARY KEY (`Hospital_Name`,`Patient_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  CONSTRAINT `delivers_ibfk_1` FOREIGN KEY (`Hospital_Name`) REFERENCES `hospital` (`Hospital_Name`),
  CONSTRAINT `delivers_ibfk_2` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivers`
--

LOCK TABLES `delivers` WRITE;
/*!40000 ALTER TABLE `delivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donates`
--

DROP TABLE IF EXISTS `donates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donates` (
  `Donor_ID` int NOT NULL,
  `Blood_ID` int NOT NULL,
  PRIMARY KEY (`Donor_ID`,`Blood_ID`),
  KEY `Blood_ID` (`Blood_ID`),
  CONSTRAINT `donates_ibfk_1` FOREIGN KEY (`Donor_ID`) REFERENCES `donor` (`Donor_ID`),
  CONSTRAINT `donates_ibfk_2` FOREIGN KEY (`Blood_ID`) REFERENCES `blood` (`Blood_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donates`
--

LOCK TABLES `donates` WRITE;
/*!40000 ALTER TABLE `donates` DISABLE KEYS */;
/*!40000 ALTER TABLE `donates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor` (
  `Donor_ID` int NOT NULL,
  `Donor_name` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Contact_Number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Donor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `Hospital_Name` varchar(100) NOT NULL,
  `Address` varchar(300) DEFAULT NULL,
  `Contact_Number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Hospital_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_technician`
--

DROP TABLE IF EXISTS `lab_technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_technician` (
  `Technician_ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Qualification` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Technician_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_technician`
--

LOCK TABLES `lab_technician` WRITE;
/*!40000 ALTER TABLE `lab_technician` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `Patient_ID` int NOT NULL,
  `Patient_Name` varchar(100) DEFAULT NULL,
  `Contact_Number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receptionist` (
  `Employee_ID` int NOT NULL,
  `Employee_Name` varchar(100) DEFAULT NULL,
  `Conatct_Number` varchar(15) DEFAULT NULL,
  `Blood_Bank_ID` int DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptionist`
--

LOCK TABLES `receptionist` WRITE;
/*!40000 ALTER TABLE `receptionist` DISABLE KEYS */;
/*!40000 ALTER TABLE `receptionist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registers`
--

DROP TABLE IF EXISTS `registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registers` (
  `Donor_ID` int NOT NULL,
  `Employee_ID` int NOT NULL,
  PRIMARY KEY (`Donor_ID`,`Employee_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `registers_ibfk_1` FOREIGN KEY (`Donor_ID`) REFERENCES `donor` (`Donor_ID`),
  CONSTRAINT `registers_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `receptionist` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registers`
--

LOCK TABLES `registers` WRITE;
/*!40000 ALTER TABLE `registers` DISABLE KEYS */;
/*!40000 ALTER TABLE `registers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stored_in`
--

DROP TABLE IF EXISTS `stored_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stored_in` (
  `Blood_ID` int NOT NULL,
  `Blood_Bank_ID` int NOT NULL,
  PRIMARY KEY (`Blood_ID`,`Blood_Bank_ID`),
  KEY `Blood_Bank_ID` (`Blood_Bank_ID`),
  CONSTRAINT `stored_in_ibfk_1` FOREIGN KEY (`Blood_ID`) REFERENCES `blood` (`Blood_ID`),
  CONSTRAINT `stored_in_ibfk_2` FOREIGN KEY (`Blood_Bank_ID`) REFERENCES `blood_bank` (`Blood_Bank_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stored_in`
--

LOCK TABLES `stored_in` WRITE;
/*!40000 ALTER TABLE `stored_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `stored_in` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-06 22:03:02
