-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: iot
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerts` (
  `room_id` int DEFAULT NULL,
  `message` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `resuelta` tinyint(1) DEFAULT NULL,
  KEY `room_id` (`room_id`),
  CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cameras`
--

DROP TABLE IF EXISTS `cameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cameras` (
  `camera_id` int NOT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`camera_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cameras`
--

LOCK TABLES `cameras` WRITE;
/*!40000 ALTER TABLE `cameras` DISABLE KEYS */;
/*!40000 ALTER TABLE `cameras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codes`
--

DROP TABLE IF EXISTS `codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codes` (
  `lock_id` int DEFAULT NULL,
  `person_id` int DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  KEY `lock_id` (`lock_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `codes_ibfk_1` FOREIGN KEY (`lock_id`) REFERENCES `locks` (`lock_id`),
  CONSTRAINT `codes_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codes`
--

LOCK TABLES `codes` WRITE;
/*!40000 ALTER TABLE `codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `room_id` int DEFAULT NULL,
  `camera_id` int DEFAULT NULL,
  UNIQUE KEY `room_id` (`room_id`),
  KEY `camera_id` (`camera_id`),
  CONSTRAINT `entries_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  CONSTRAINT `entries_ibfk_2` FOREIGN KEY (`camera_id`) REFERENCES `cameras` (`camera_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `light_control`
--

DROP TABLE IF EXISTS `light_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `light_control` (
  `light_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `turned_on_date` date DEFAULT NULL,
  `turned_off_date` date DEFAULT NULL,
  UNIQUE KEY `light_id` (`light_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `light_control_ibfk_1` FOREIGN KEY (`light_id`) REFERENCES `lights` (`light_id`),
  CONSTRAINT `light_control_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `light_control`
--

LOCK TABLES `light_control` WRITE;
/*!40000 ALTER TABLE `light_control` DISABLE KEYS */;
INSERT INTO `light_control` VALUES (1,1,NULL,NULL),(2,1,NULL,NULL),(3,2,NULL,NULL),(4,3,NULL,NULL),(5,5,NULL,NULL);
/*!40000 ALTER TABLE `light_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lights`
--

DROP TABLE IF EXISTS `lights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lights` (
  `light_id` int NOT NULL,
  `turned_on` tinyint(1) DEFAULT NULL,
  `intensity` int DEFAULT NULL,
  PRIMARY KEY (`light_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lights`
--

LOCK TABLES `lights` WRITE;
/*!40000 ALTER TABLE `lights` DISABLE KEYS */;
INSERT INTO `lights` VALUES (1,0,0),(2,0,0),(3,0,0),(4,0,0),(5,0,0),(6,0,0);
/*!40000 ALTER TABLE `lights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lock_room`
--

DROP TABLE IF EXISTS `lock_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lock_room` (
  `lock_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  UNIQUE KEY `lock_id` (`lock_id`),
  UNIQUE KEY `room_id` (`room_id`),
  CONSTRAINT `lock_room_ibfk_1` FOREIGN KEY (`lock_id`) REFERENCES `locks` (`lock_id`),
  CONSTRAINT `lock_room_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lock_room`
--

LOCK TABLES `lock_room` WRITE;
/*!40000 ALTER TABLE `lock_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `lock_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locks` (
  `lock_id` int NOT NULL,
  `battery` int DEFAULT NULL,
  `open` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`lock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locks`
--

LOCK TABLES `locks` WRITE;
/*!40000 ALTER TABLE `locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `surname` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_rooms`
--

DROP TABLE IF EXISTS `person_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_rooms` (
  `person_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  UNIQUE KEY `person_id` (`person_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `person_rooms_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_rooms_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_rooms`
--

LOCK TABLES `person_rooms` WRITE;
/*!40000 ALTER TABLE `person_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_id` int NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Kitchen'),(2,'Living Room'),(3,'Bedroom 1'),(4,'Bedroom 2'),(5,'Bathroom 1');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temperature_control`
--

DROP TABLE IF EXISTS `temperature_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temperature_control` (
  `room_id` int DEFAULT NULL,
  `thermostat_id` int DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `date` date DEFAULT NULL,
  UNIQUE KEY `room_id` (`room_id`),
  UNIQUE KEY `thermostat_id` (`thermostat_id`),
  CONSTRAINT `temperature_control_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  CONSTRAINT `temperature_control_ibfk_2` FOREIGN KEY (`thermostat_id`) REFERENCES `thermostats` (`thermostat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temperature_control`
--

LOCK TABLES `temperature_control` WRITE;
/*!40000 ALTER TABLE `temperature_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `temperature_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thermostats`
--

DROP TABLE IF EXISTS `thermostats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thermostats` (
  `thermostat_id` int NOT NULL,
  `state` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`thermostat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thermostats`
--

LOCK TABLES `thermostats` WRITE;
/*!40000 ALTER TABLE `thermostats` DISABLE KEYS */;
/*!40000 ALTER TABLE `thermostats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-21 15:58:03
