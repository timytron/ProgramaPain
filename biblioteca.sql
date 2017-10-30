-- MySQL dump 10.16  Distrib 10.1.28-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	10.1.28-MariaDB

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
-- Table structure for table `assunto`
--

DROP TABLE IF EXISTS `assunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assunto` (
  `cod_as` int(11) NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`cod_as`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assunto`
--

LOCK TABLES `assunto` WRITE;
/*!40000 ALTER TABLE `assunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `assunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `cod_au` int(11) NOT NULL,
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` bigint(20) DEFAULT NULL,
  `rg` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telfone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uf` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cod_au`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoria`
--

DROP TABLE IF EXISTS `autoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoria` (
  `cod_liv` int(11) NOT NULL,
  `cod_au` int(11) NOT NULL,
  PRIMARY KEY (`cod_liv`,`cod_au`),
  KEY `autor_FK` (`cod_au`),
  CONSTRAINT `autor_FK` FOREIGN KEY (`cod_au`) REFERENCES `autor` (`cod_au`),
  CONSTRAINT `livro_FK` FOREIGN KEY (`cod_liv`) REFERENCES `livro` (`cod_liv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoria`
--

LOCK TABLES `autoria` WRITE;
/*!40000 ALTER TABLE `autoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editora` (
  `cod_ed` int(11) NOT NULL,
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cnpj` bigint(20) DEFAULT NULL,
  `endereco` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uf` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cod_ed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liv_assunto`
--

DROP TABLE IF EXISTS `liv_assunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liv_assunto` (
  `cod_liv` int(11) NOT NULL,
  `cod_as` int(11) NOT NULL,
  PRIMARY KEY (`cod_liv`,`cod_as`),
  KEY `livroos_FK` (`cod_as`),
  CONSTRAINT `livroo_FK` FOREIGN KEY (`cod_liv`) REFERENCES `livro` (`cod_liv`),
  CONSTRAINT `livroos_FK` FOREIGN KEY (`cod_as`) REFERENCES `assunto` (`cod_as`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liv_assunto`
--

LOCK TABLES `liv_assunto` WRITE;
/*!40000 ALTER TABLE `liv_assunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `liv_assunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livro` (
  `cod_liv` int(11) NOT NULL,
  `titulo` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isbn` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edicao` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `cod_ed` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_liv`),
  KEY `editora_FK` (`cod_ed`),
  CONSTRAINT `editora_FK` FOREIGN KEY (`cod_ed`) REFERENCES `editora` (`cod_ed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-30 20:24:39
