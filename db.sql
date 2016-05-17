-- MySQL dump 10.13  Distrib 5.6.27, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: ads_extract_database
-- ------------------------------------------------------
-- Server version	5.6.27-0ubuntu1

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
-- Table structure for table `annonce`
--

DROP TABLE IF EXISTS `annonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annonce` (
  `id_annonce` varchar(200) NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `prix` varchar(50) DEFAULT NULL,
  `superficie` varchar(45) DEFAULT NULL,
  `etage` varchar(45) DEFAULT NULL,
  `pieces` varchar(45) DEFAULT NULL,
  `lien` varchar(200) DEFAULT NULL,
  `nom_annonceur` varchar(45) DEFAULT NULL,
  `tel_annonceur` varchar(200) DEFAULT NULL,
  `email_annonceur` varchar(200) DEFAULT NULL,
  `quartier` varchar(70) DEFAULT NULL,
  `commune` varchar(100) DEFAULT NULL,
  `wilaya` varchar(45) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `type_bien` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id_annonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `communes`
--

DROP TABLE IF EXISTS `communes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code_postal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom_arabe` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wilaya_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `communes_wilaya_id_foreign` (`wilaya_id`),
  CONSTRAINT `communes_wilaya_id_foreign` FOREIGN KEY (`wilaya_id`) REFERENCES `wilayas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1542 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_cache`
--

DROP TABLE IF EXISTS `location_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_cache` (
  `addr` varchar(128) NOT NULL,
  `faddr` varchar(256) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id_photo` int(11) NOT NULL AUTO_INCREMENT,
  `photo` text,
  `id_annonce` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_photo`),
  KEY `fk_photo_id` (`id_annonce`)
) ENGINE=InnoDB AUTO_INCREMENT=20884 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id_place` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_commune` int(10) unsigned DEFAULT NULL,
  `design` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lattitude` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_place`),
  KEY `fk_places_1_idx` (`id_commune`),
  CONSTRAINT `fk_places_1` FOREIGN KEY (`id_commune`) REFERENCES `communes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=203899 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prix`
--

DROP TABLE IF EXISTS `prix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commune` int(10) unsigned DEFAULT NULL,
  `moyenne` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prix_1_idx` (`commune`),
  CONSTRAINT `fk_prix_1` FOREIGN KEY (`commune`) REFERENCES `communes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3085 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projet_scrapy`
--

DROP TABLE IF EXISTS `projet_scrapy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projet_scrapy` (
  `id_projet` int(11) NOT NULL AUTO_INCREMENT,
  `design` varchar(45) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `is_deployed` int(1) unsigned zerofill DEFAULT '0',
  PRIMARY KEY (`id_projet`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spiders`
--

DROP TABLE IF EXISTS `spiders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spiders` (
  `id_spider` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `id_projet` int(11) DEFAULT NULL,
  `domaine` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_spider`),
  KEY `fk_spiders_1_idx` (`id_projet`),
  CONSTRAINT `fk_spiders_1` FOREIGN KEY (`id_projet`) REFERENCES `projet_scrapy` (`id_projet`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_name` varchar(45) NOT NULL DEFAULT '',
  `passwd` varchar(200) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`passwd`,`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wilayas`
--

DROP TABLE IF EXISTS `wilayas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wilayas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom_arabe` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-17 16:05:52
