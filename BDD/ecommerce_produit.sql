CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `produit_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(25) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `id_M` int DEFAULT NULL,
  `sible` varchar(25) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`produit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (23,'a',130,'Gentleman Clothes BEIGE',10000,'Kids','Images/boys-dress-1.jpeg'),(24,'A',140,'Gentleman Clothes BLUE',10000,'Kids','Images/boys-dress-2.jpeg'),(25,'A',200,'Gentleman Clothes CLASSE',10000,'Kids','Images/boys-kids-1.jpg'),(30,'A',320,'Pour Les Jumeaux',10000,'Kids','Images/five-hundred-boys-2.jpg'),(31,'A',160,'vetements d\'ete',10000,'Kids','Images/boys-kids.jpg'),(32,'A',320,'classe et plein couleur',10000,'Kids','Images/five-hundred-boys.jpg'),(33,'A',120,'vetement d\'ete plein couleur',10000,'Kids','Images/five-hundred-boys-1.jpg'),(34,'A',350,'Robe noire avec Bande rouge ',10000,'Womans','Images/five-hundred-girls.jpg'),(35,'A',320,'Robe prune avec Bande blanc',10000,'Womans','Images/five-hundred-girls-1.jpg'),(36,'A',390,'Robe violet avec Bande rose',10000,'Womans','Images/five-hundred-girls-2.jpg'),(37,'A',295,'Robe blue avec gravure',10000,'Womans','Images/five-hundred-girls-3.jpg'),(38,'A',210,'Robe blue avec Bande noir',10000,'Womans','Images/five-hundred-girls-4.jpg'),(39,'A',170,'Robe rose d\'ete',10000,'Womans','Images/five-hundred-ladies.jpg'),(41,'A',180,'Chemise Noir ',10000,'Mens','Images/five-hundred-men-1.jpg'),(42,'A',160,'Chemise Noir avec lines blanc',10000,'Mens','Images/five-hundred-men-2.jpg'),(43,'A',140,'Chemise Noir - Rouge',10000,'Mens','Images/five-hundred-men-3.jpg'),(44,'A',110,'Chemise Noir Simple',10000,'Mens','Images/five-hundred-men-4.jpg'),(45,'A',119,'Chemise Noir - Bleu clair',10000,'Mens','Images/five-hundred-men-5.jpg'),(46,'A',99,'Chemise Bleu - Rouge',10000,'Mens','Images/five-hundred-men-6.jpg'),(47,'A',149,'Chemise Beige simple',10000,'Mens','Images/for-each-image.jpg'),(48,'A',129,'Chemise Gris simple',10000,'Mens','Images/for-each-image-1.jpg'),(49,'A',299,'Chemise Classe Noir simple',10000,'Mens','Images/for-each-image-6.jpg'),(50,'A',309,'VESTE TRENCHCOAT - BLEU',10000,'Womans','Images/1.jpg'),(51,'A',329,'VESTE BLAZER - NOIR',10000,'Womans','Images/1(1).jpg'),(52,'A',39,' t-shirt fleur',10000,'Womans','Images/1(3).jpg'),(53,'A',99,'TUNIQUE A MANCHES LONGUES - BEIGE',10000,'Womans','Images/1(4).jpg'),(54,'A',104,'TUNIQUE A MANCHES LONGUES - ORANGE',10000,'Womans','Images/1(5).jpg'),(55,'A',269,'VESTE TRENCHCOAT - BLEU',10000,'Womans','Images/1(6).jpg'),(56,'A',399,'VESTE FEMME - MARRON',10000,'Womans','Images/1(7).jpg'),(57,'A',119,'Koton JUPE - MARRON',10000,'Womans','Images/aa.jpg'),(58,'A',139,'BIRDIES Pull Mayssen - Bordeau',10000,'Womans','Images/aaa.jpg'),(59,'A',99,'Femme Sweat a capuche Rose',10000,'Womans','Images/aaaaa.jpg'),(60,'A',250,'pyjama velour et son peignoir polaire gris',10000,'Womans','Images/13.jpg'),(61,'A',69,'HAUT DE PYJAMA FEMME - BORDEAUX',10000,'Womans','Images/12.jpg'),(62,'A',280,'pyjama coton et son peignoir polaire mauve',10000,'Womans','Images/14.jpg'),(63,'A',199,'Koton PULLOVER FEMME - BLANC',10000,'Womans','Images/15.jpg'),(64,'A',99,'Koton ROBE FILLE - NOIR',10000,'Kids','Images/16.jpg'),(65,'A',99,'Defacto ROBE - JAUNE',10000,'Kids','Images/17.jpg'),(66,'A',69,'Defacto PANTALON - BLEU',10000,'Kids','Images/18.jpg'),(67,'A',69,'Koton ROBE FILLE - BLEU',10000,'Kids','Images/19.jpg'),(68,'A',99,'Koton SWEATSHIRT FILLES - BLANC ECRU',10000,'Kids','Images/20.jpg'),(69,'A',49,'Koton SWEATSHIRT FILLE - FUSCHIA',10000,'Kids','Images/21.jpg'),(70,'A',39,'Defacto T-SHIRT POLO - JAUNE',10000,'Kids','Images/22.jpg'),(71,'A',79,'Defacto SWEATSHIRT - VERT',10000,'Kids','Images/23.jpg'),(72,'A',59,'Koton SWEATSHIRT GARCON - GRIS',10000,'Kids','Images/24.jpg'),(73,'A',39,'Defacto T-SHIRT A MANCHES COURTES - GRIS',10000,'Kids','Images/25.jpg'),(74,'A',89,'Koton PANTALON GARCONS - TERRACOTA',10000,'Kids','Images/26.jpg'),(75,'A',499,'Koton VESTE HOMME - MARRON',10000,'Mens','Images/27.jpg'),(76,'A',245,'Koton VESTE BLAZER HOMME - BLEU',10000,'Mens','Images/28.jpg'),(77,'A',329,'Koton VESTE HOMME - NOIR',10000,'Mens','Images/29.jpg'),(78,'A',299,'Defacto VESTE / MANTEAU HOMME - NOIR',10000,'Mens','Images/30.jpg'),(79,'A',219,'Koton VESTE BLAZER HOMME - BLEU',10000,'Mens','Images/31.jpg'),(80,'A',165,'Origins Jacket cuir original Homme NEW 2021',10000,'Mens','Images/32.jpg'),(81,'A',297,'Koton VESTE BLAZER HOMME - BORDEAUX',10000,'Mens','Images/33.jpg'),(82,'A',499,'Koton VESTE - GRIS',10000,'Mens','Images/34.jpg'),(83,'A',124,'Defacto PULLOVER - GRIS',10000,'Mens','Images/35.jpg'),(84,'A',70,'SUPER Sweat a capuche NOIR ',10000,'Mens','Images/36.jpg'),(85,'A',79,'Koton SWEATSHIRT HOMME - NOIR',10000,'Mens','Images/37.jpg'),(86,'A',89,'Koton SWEATSHIRT - BLEU',10000,'Mens','Images/38.jpg'),(87,'A',95,'Hoodie Capuchon simple Coton Rose',10000,'Mens','Images/39.jpg'),(88,'A',139,'Koton SWEATSHIRT HOMME - BLEU',10000,'Mens','Images/40.jpg'),(89,'A',59,'Koton T-SHIRT - GRIS',10000,'Mens','Images/41.jpg'),(90,'A',99,'Defacto T-SHIRT - NOIR',10000,'Mens','Images/42.jpg'),(91,'A',64,'Koton T-SHIRT HOMME - NOIR',10000,'Mens','Images/42.jpg'),(92,'A',54,'Koton T-SHIRT - KAKI',10000,'Mens','Images/44.jpg');
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-24  9:12:02
