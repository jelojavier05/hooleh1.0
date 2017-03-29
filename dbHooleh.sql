CREATE DATABASE  IF NOT EXISTS `dbHooleh` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbHooleh`;
-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: dbHooleh
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `tblDriver`
--

DROP TABLE IF EXISTS `tblDriver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDriver` (
  `intDriverID` int(11) NOT NULL AUTO_INCREMENT,
  `strDriverLicense` char(13) NOT NULL,
  `strDriverFirstname` varchar(45) NOT NULL,
  `strDriverLastname` varchar(45) NOT NULL,
  `intLicenseType` int(11) NOT NULL,
  `datDriverBirthday` date NOT NULL,
  `TimestampCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimestampUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `TimestampDeleted` datetime DEFAULT NULL,
  `blDriverDelete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intDriverID`),
  UNIQUE KEY `strDriverLicense_UNIQUE` (`strDriverLicense`),
  KEY `fkDriver_idx` (`intLicenseType`),
  CONSTRAINT `fkDriver` FOREIGN KEY (`intLicenseType`) REFERENCES `tblLicenseType` (`intLicenseId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblDriverRestriction`
--

DROP TABLE IF EXISTS `tblDriverRestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDriverRestriction` (
  `intDriverRestrictionID` int(11) NOT NULL AUTO_INCREMENT,
  `intRestrictionID` int(11) NOT NULL,
  `intDriverID` int(11) NOT NULL,
  `TimestampCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`intDriverRestrictionID`),
  KEY `fkDRRest_idx` (`intRestrictionID`),
  KEY `fkDRLicense_idx` (`intDriverID`),
  CONSTRAINT `fkDRLicense` FOREIGN KEY (`intDriverID`) REFERENCES `tblDriver` (`intDriverID`) ON UPDATE CASCADE,
  CONSTRAINT `fkDRRest` FOREIGN KEY (`intRestrictionID`) REFERENCES `tblRestriction` (`intRestrictionID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblEnforcer`
--

DROP TABLE IF EXISTS `tblEnforcer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblEnforcer` (
  `intEnforcerID` int(11) NOT NULL AUTO_INCREMENT,
  `strEnforcerFirstname` varchar(45) NOT NULL,
  `strEnforcerMiddlename` varchar(45) DEFAULT NULL,
  `strEnforcerLastname` varchar(45) NOT NULL,
  `strEnforcerUsername` varchar(45) NOT NULL,
  `strEnforcerPassword` varchar(45) NOT NULL,
  `strEnforcerToken` varchar(255) DEFAULT NULL,
  `strEnforcerPicture` varchar(150) DEFAULT NULL,
  `TimestampCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimestampUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `TimestampDeleted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `blEnforcerDelete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intEnforcerID`),
  UNIQUE KEY `strEnforcerUsername_UNIQUE` (`strEnforcerUsername`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblLicenseType`
--

DROP TABLE IF EXISTS `tblLicenseType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblLicenseType` (
  `intLicenseId` int(11) NOT NULL AUTO_INCREMENT,
  `strLicenseType` varchar(45) NOT NULL,
  `TimestampCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`intLicenseId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblPayment`
--

DROP TABLE IF EXISTS `tblPayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPayment` (
  `intPaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `intDriverID` int(11) NOT NULL,
  `dblPayment` double NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`intPaymentID`,`intDriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblRestriction`
--

DROP TABLE IF EXISTS `tblRestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblRestriction` (
  `intRestrictionID` int(11) NOT NULL AUTO_INCREMENT,
  `strRestrictionDesc` varchar(100) NOT NULL,
  `blRestrictionDelete` tinyint(4) NOT NULL DEFAULT '0',
  `TimetampCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimestampUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `TimestampdDeleted` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`intRestrictionID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `tblRestriction` WRITE;
/*!40000 ALTER TABLE `tblDriver` DISABLE KEYS */;
INSERT INTO `tblRestriction`(intRestrictionID, strRestrictionDesc) VALUES (1, 'Motorcycles/ Motorized Tricycles'),(2, 'Vehicle up to 4500 KGS GVW'),
(3, 'Vehicle above 4500 KGS GVW'),(4,'Automatic clutch up to 4500 KGS GVW'),(5,'Automatic clutch above 4500 KGS GVW'),(6,'Articulated vehicle 1600 KGS GVW and below'),
(7,'Articulated vehicle 1601 up to 4500 KGS GVW'),(8,'Articulated vehicle 4501 kgs and above GVW');
/*!40000 ALTER TABLE `tblDriver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblViolation`
--

DROP TABLE IF EXISTS `tblViolation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblViolation` (
  `tblViolationID` int(11) NOT NULL AUTO_INCREMENT,
  `strViolationShortDesc` varchar(100) NOT NULL,
  `strViolationLongDesc` varchar(255) DEFAULT NULL,
  `intViolationCategoryID` int(11) NOT NULL,
  `TimestampCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimestampUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `TimestampDeleted` datetime DEFAULT '0000-00-00 00:00:00',
  `blViolationDelete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tblViolationID`),
  UNIQUE KEY `strViolationShortDesc_UNIQUE` (`strViolationShortDesc`),
  KEY `fkViolationCategory_idx` (`intViolationCategoryID`),
  CONSTRAINT `fkViolationCategory` FOREIGN KEY (`intViolationCategoryID`) REFERENCES `tblViolationCategory` (`intViolationCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblViolationCategory`
--

DROP TABLE IF EXISTS `tblViolationCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblViolationCategory` (
  `intViolationCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `strViolatinCategoryDesc` varchar(255) NOT NULL,
  `TimestampCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`intViolationCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblViolationFee`
--

DROP TABLE IF EXISTS `tblViolationFee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblViolationFee` (
  `intViolationFeeID` int(11) NOT NULL AUTO_INCREMENT,
  `intViolationID` int(11) NOT NULL,
  `dblPrice` double NOT NULL,
  `datStartDate` date NOT NULL,
  `datEndDate` date NOT NULL DEFAULT '9999-12-31',
  `TimestampCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`intViolationFeeID`),
  KEY `fkViolationID_idx` (`intViolationID`),
  CONSTRAINT `fkViolationID` FOREIGN KEY (`intViolationID`) REFERENCES `tblViolation` (`tblViolationID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblViolationTransactionDetail`
--

DROP TABLE IF EXISTS `tblViolationTransactionDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblViolationTransactionDetail` (
  `intViolationTransactionDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `intViolationTransactionHeaderID` int(11) NOT NULL,
  `intViolationID` int(11) NOT NULL,
  PRIMARY KEY (`intViolationTransactionDetailID`,`intViolationTransactionHeaderID`),
  KEY `fkViolationTransactionHeader_idx` (`intViolationTransactionHeaderID`),
  KEY `fkViolationTransactionViolation_idx` (`intViolationID`),
  CONSTRAINT `fkViolationTransactionHeader` FOREIGN KEY (`intViolationTransactionHeaderID`) REFERENCES `tblViolationTransactionHeader` (`intViolationTransactionHeaderID`) ON UPDATE CASCADE,
  CONSTRAINT `fkViolationTransactionViolation` FOREIGN KEY (`intViolationID`) REFERENCES `tblViolation` (`tblViolationID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblViolationTransactionHeader`
--

DROP TABLE IF EXISTS `tblViolationTransactionHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblViolationTransactionHeader` (
  `intViolationTransactionHeaderID` int(11) NOT NULL AUTO_INCREMENT,
  `intEnforcerID` int(11) NOT NULL,
  `intDriverID` int(11) NOT NULL,
  `strControlNumber` varchar(45) NOT NULL,
  `blStatus` tinyint(1) NOT NULL,
  `TimestampCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimestampUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`intViolationTransactionHeaderID`),
  UNIQUE KEY `strControlNumber_UNIQUE` (`strControlNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Dumping events for database 'dbHooleh'
--

--
-- Dumping routines for database 'dbHooleh'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-26  8:50:19
