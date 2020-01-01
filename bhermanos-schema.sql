CREATE DATABASE  IF NOT EXISTS `BHERMANOS` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `BHERMANOS`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: BHERMANOS
-- ------------------------------------------------------
-- Server version	5.6.39

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
-- Table structure for table `CLIENTES`
--

DROP TABLE IF EXISTS `CLIENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENTES` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `ApellidoPaterno` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `ApellidoMaterno` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Calle` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `NumeroExt` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `NumInt` varchar(5) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Colonia` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `CP` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `Estado` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Municipio` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Ciudad` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `INE` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `TelCasa` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Movil1` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Movil2` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Movil3` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Facebook` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `FechaAlta` datetime NOT NULL,
  `Foto` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL,
  `IdExterno` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Activo` varchar(1) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'Y',
  `FechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  UNIQUE KEY `Numero_UNIQUE` (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DISTRIBUIDOR`
--

DROP TABLE IF EXISTS `DISTRIBUIDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DISTRIBUIDOR` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `Nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `FechaAlta` datetime NOT NULL,
  `Activo` varchar(1) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'Y',
  `FechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Numero_UNIQUE` (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VALES`
--

DROP TABLE IF EXISTS `VALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VALES` (
  `Id` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdDistribuidor` int(11) NOT NULL,
  `Folio` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `Tipo` varchar(1) COLLATE latin1_spanish_ci NOT NULL,
  `Monto` decimal(7,2) NOT NULL,
  `Fecha` datetime NOT NULL,
  `MontoDisponible` decimal(7,2) DEFAULT NULL,
  `MontoPagado` decimal(7,2) DEFAULT '0.00',
  `UltimoPago` datetime DEFAULT NULL,
  `Pagado` varchar(1) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'N',
  `FechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Folio_UNIQUE` (`Folio`),
  KEY `IdDistribuidorFk_idx` (`IdDistribuidor`),
  KEY `IdClienteFk_idx` (`IdCliente`),
  CONSTRAINT `IdClienteFk` FOREIGN KEY (`IdCliente`) REFERENCES `CLIENTES` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IdDistribuidorFk` FOREIGN KEY (`IdDistribuidor`) REFERENCES `DISTRIBUIDOR` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-01  9:27:07
