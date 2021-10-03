-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: 192.168.1.111    Database: mydb
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `length_in_cm` float NOT NULL,
  `height_in_cm` float NOT NULL,
  `width_in_cm` float NOT NULL,
  `price_in_chf` float NOT NULL,
  `weight_in_kg` float NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_attributes_manufacturer1_idx` (`manufacturer_id`),
  CONSTRAINT `fk_attributes_manufacturer1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'Gigabyte_Aorus_Geforce_RTX_3090_Master_24G',40.5,13.5,26.7,2049,3.35,1,'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_79378284/mobile_786_587_png/GIGABYTE-AORUS-GeForce-RTX-3090-MASTER-24G---Grafikkarte'),(2,'AMD_Ryzen_9_5950X',3.99,0.61,3.99,819,0.116,3,'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_79165917/mobile_786_587_png/AMD-Ryzen-9-5950X---Prozessor'),(3,'NVIDIA_GeForce_RTX_3080',28.5,5,11.2,1200,0.8,1,'https://asset.msi.com/resize/image/global/product/product_16051683789c6e411042e9ef0f558376d40b4aa85f.png62405b38c58fe0f07fcef2367d8a9ba1/1024.png'),(4,'Corsair_H100i_RGB_Platinum',27.6,5.5,12.5,155,1.98,4,'https://static.digitecgalaxus.ch/Files/1/7/2/9/5/2/4/6/H100i_RGB_PLATINUM_01.jpg?impolicy=ProductTileImage&resizeWidth=436&resizeHeight=335&quality=high&cropWidth=436&cropHeight=335'),(5,'WD Red Pro',14.7,2.6,10.16,136,0.72,5,'https://static.digitecgalaxus.ch/Files/3/6/8/3/0/9/8/5/wd-red-pro-4tb.png.thumb.1280.1280.png?impolicy=ProductTileImage&resizeWidth=436&resizeHeight=335&quality=high&cropWidth=436&cropHeight=335'),(6,'ASUS Rog Strix X570-E Gaming',30.5,4.4,24.4,319,2.06,6,'https://static.digitecgalaxus.ch/Files/2/3/1/6/0/0/4/1/enzcieqe3bxwsm43_setting_fff_1_90_end_1500.png?impolicy=ProductTileImage&resizeWidth=436&resizeHeight=335&quality=high&cropWidth=436&cropHeight=335'),(7,'HP 613764-001',24,10.5,15.6,126,1.34,8,'https://static.digitecgalaxus.ch/Files/1/8/1/3/5/4/2/hp-model-cfh0320ewwa-power-supply-p-n-611483-001-spares-no-613764-001-1.jpeg?impolicy=ProductTileImage&resizeWidth=436&resizeHeight=335&quality=high&cropWidth=436&cropHeight=335'),(8,'Cooler Master PC-Gehäuse Silencio S600',47.8,47.05,20.9,93.8,8.6,9,'https://static.digitecgalaxus.ch/Files/3/2/2/8/8/4/2/9/986552-H-002.xxl3.jpeg?impolicy=ProductTileImage&resizeWidth=436&resizeHeight=335&quality=high&cropWidth=436&cropHeight=335'),(9,'Corsair Vengeance RGB Pro (2x)',17,2,14,193,0.16,4,'https://static.digitecgalaxus.ch/Files/3/2/8/9/2/8/8/8/null-H-002.xxl3.jpeg?impolicy=ProductTileImage&resizeWidth=436&resizeHeight=335&quality=high&cropWidth=436&cropHeight=335'),(10,'Samsung 970 EVO Plus',8.02,0.24,2.22,158,75,10,'https://static.digitecgalaxus.ch/Files/1/8/5/9/7/5/0/5/null-H-002.xxl3.jpgexportGa4PCo68TlLe9g?impolicy=ProductTileImage&resizeWidth=436&resizeHeight=335&quality=high&cropWidth=436&cropHeight=335');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connector`
--

DROP TABLE IF EXISTS `connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connector`
--

LOCK TABLES `connector` WRITE;
/*!40000 ALTER TABLE `connector` DISABLE KEYS */;
INSERT INTO `connector` VALUES (18,'3pin'),(19,'4pin PWM'),(12,'audio IN'),(13,'audio OUT'),(9,'DisplayPort'),(15,'DVI'),(17,'eSATA'),(10,'Ethernet'),(11,'HDMI'),(16,'SATA'),(8,'thunderbold 3'),(1,'USB 2.0'),(2,'USB 3.0'),(3,'USB 3.1 Gen 1'),(4,'USB 3.1 Gen 2'),(5,'USB 4.0'),(7,'USB B'),(6,'USB C'),(14,'VGA');
/*!40000 ALTER TABLE `connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connector_has_power_supply`
--

DROP TABLE IF EXISTS `connector_has_power_supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connector_has_power_supply` (
  `connector_id` int(11) NOT NULL,
  `power_supply_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`connector_id`,`power_supply_id`),
  KEY `fk_connector_has_power_supply_power_supply1_idx` (`power_supply_id`),
  KEY `fk_connector_has_power_supply_connector1_idx` (`connector_id`),
  CONSTRAINT `fk_connector_has_power_supply_connector1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_connector_has_power_supply_power_supply1` FOREIGN KEY (`power_supply_id`) REFERENCES `power_supply` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connector_has_power_supply`
--

LOCK TABLES `connector_has_power_supply` WRITE;
/*!40000 ALTER TABLE `connector_has_power_supply` DISABLE KEYS */;
/*!40000 ALTER TABLE `connector_has_power_supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpu`
--

DROP TABLE IF EXISTS `cpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu_socket_id` int(11) NOT NULL,
  `cores` int(11) NOT NULL,
  `frequency_in_ghz` float DEFAULT NULL,
  `boost_frequency_in_ghz` float DEFAULT NULL,
  `lithography_in_nm` double NOT NULL,
  `pcie_version_id` int(11) NOT NULL,
  `threads` int(11) NOT NULL,
  `tdp_in_watt` int(11) NOT NULL,
  `attributes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cpu_cpu_socket1_idx` (`cpu_socket_id`),
  KEY `fk_cpu_pcie_version1_idx` (`pcie_version_id`),
  KEY `fk_cpu_attributes1_idx` (`attributes_id`),
  CONSTRAINT `fk_cpu_attributes1` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cpu_cpu_socket1` FOREIGN KEY (`cpu_socket_id`) REFERENCES `cpu_socket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cpu_pcie_version1` FOREIGN KEY (`pcie_version_id`) REFERENCES `pcie_version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu`
--

LOCK TABLES `cpu` WRITE;
/*!40000 ALTER TABLE `cpu` DISABLE KEYS */;
INSERT INTO `cpu` VALUES (1,1,16,3.4,4.9,7,4,32,105,2);
/*!40000 ALTER TABLE `cpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpu_cooler`
--

DROP TABLE IF EXISTS `cpu_cooler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpu_cooler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `height_with_cpu` float DEFAULT NULL,
  `fan_quantity` int(11) NOT NULL,
  `noise_level` float DEFAULT NULL,
  `power_draw` int(11) NOT NULL,
  `attributes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cpu_cooler_attributes1_idx` (`attributes_id`),
  CONSTRAINT `fk_cpu_cooler_attributes1` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu_cooler`
--

LOCK TABLES `cpu_cooler` WRITE;
/*!40000 ALTER TABLE `cpu_cooler` DISABLE KEYS */;
INSERT INTO `cpu_cooler` VALUES (1,10,2435,37.7,0,4);
/*!40000 ALTER TABLE `cpu_cooler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpu_cooler_has_connector`
--

DROP TABLE IF EXISTS `cpu_cooler_has_connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpu_cooler_has_connector` (
  `cpu_cooler_id` int(11) NOT NULL,
  `connector_id` int(11) NOT NULL,
  PRIMARY KEY (`cpu_cooler_id`,`connector_id`),
  KEY `fk_cpu_cooler_has_connector_connector1_idx` (`connector_id`),
  KEY `fk_cpu_cooler_has_connector_cpu_cooler1_idx` (`cpu_cooler_id`),
  CONSTRAINT `fk_cpu_cooler_has_connector_connector1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cpu_cooler_has_connector_cpu_cooler1` FOREIGN KEY (`cpu_cooler_id`) REFERENCES `cpu_cooler` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu_cooler_has_connector`
--

LOCK TABLES `cpu_cooler_has_connector` WRITE;
/*!40000 ALTER TABLE `cpu_cooler_has_connector` DISABLE KEYS */;
INSERT INTO `cpu_cooler_has_connector` VALUES (1,18),(1,19);
/*!40000 ALTER TABLE `cpu_cooler_has_connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpu_cooler_has_cpu_socket`
--

DROP TABLE IF EXISTS `cpu_cooler_has_cpu_socket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpu_cooler_has_cpu_socket` (
  `cpu_cooler_id` int(11) NOT NULL,
  `cpu_socket_id` int(11) NOT NULL,
  PRIMARY KEY (`cpu_cooler_id`,`cpu_socket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu_cooler_has_cpu_socket`
--

LOCK TABLES `cpu_cooler_has_cpu_socket` WRITE;
/*!40000 ALTER TABLE `cpu_cooler_has_cpu_socket` DISABLE KEYS */;
INSERT INTO `cpu_cooler_has_cpu_socket` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13);
/*!40000 ALTER TABLE `cpu_cooler_has_cpu_socket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpu_socket`
--

DROP TABLE IF EXISTS `cpu_socket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpu_socket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu_socket`
--

LOCK TABLES `cpu_socket` WRITE;
/*!40000 ALTER TABLE `cpu_socket` DISABLE KEYS */;
INSERT INTO `cpu_socket` VALUES (3,'AM2'),(2,'AM3'),(1,'AM4'),(6,'FM1'),(12,'FM2'),(13,'LGA 1150'),(5,'LGA 1151'),(8,'LGA 1155'),(7,'LGA 1156'),(4,'LGA 1366'),(10,'LGA 2011'),(11,'LGA 2011-v3'),(9,'TR4');
/*!40000 ALTER TABLE `cpu_socket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ddr_standard`
--

DROP TABLE IF EXISTS `ddr_standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ddr_standard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddr_standard`
--

LOCK TABLES `ddr_standard` WRITE;
/*!40000 ALTER TABLE `ddr_standard` DISABLE KEYS */;
INSERT INTO `ddr_standard` VALUES (1,'DDR4-1600'),(2,'DDR4-1866'),(3,'DDR4-2133'),(4,'DDR4-2400'),(5,'DDR4-2666'),(6,'DDR4-2933'),(7,'DDR4-3200'),(8,'DDR4-3600'),(9,'DDR4-3733');
/*!40000 ALTER TABLE `ddr_standard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disk_form_factor`
--

DROP TABLE IF EXISTS `disk_form_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disk_form_factor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disk_form_factor`
--

LOCK TABLES `disk_form_factor` WRITE;
/*!40000 ALTER TABLE `disk_form_factor` DISABLE KEYS */;
INSERT INTO `disk_form_factor` VALUES (1,'3.5\"'),(2,'2.5\"'),(3,'M.2 2280');
/*!40000 ALTER TABLE `disk_form_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disk_storage`
--

DROP TABLE IF EXISTS `disk_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disk_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disk_storage_type_id` int(11) NOT NULL,
  `connector_id` int(11) DEFAULT NULL,
  `read_rate` int(11) NOT NULL,
  `write_rate` int(11) NOT NULL,
  `power_draw` int(11) NOT NULL,
  `rpm` int(11) DEFAULT NULL,
  `disk_form_factor_id` int(11) NOT NULL,
  `pcie_version_id` int(11) DEFAULT NULL,
  `attributes_id` int(11) NOT NULL,
  `storage_in_gb` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_disk_storage_connector1_idx` (`connector_id`),
  KEY `fk_disk_storage_form_factor1_idx` (`disk_form_factor_id`),
  KEY `fk_disk_storage_pcie_version1_idx` (`pcie_version_id`),
  KEY `fk_disk_storage_attributes1_idx` (`attributes_id`),
  KEY `fk_disk_storage_disk_storage_type1` (`disk_storage_type_id`),
  CONSTRAINT `fk_disk_storage_attributes1` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_disk_storage_connector1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_disk_storage_disk_storage_type1` FOREIGN KEY (`disk_storage_type_id`) REFERENCES `disk_storage_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_disk_storage_form_factor1` FOREIGN KEY (`disk_form_factor_id`) REFERENCES `disk_form_factor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_disk_storage_pcie_version1` FOREIGN KEY (`pcie_version_id`) REFERENCES `pcie_version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disk_storage`
--

LOCK TABLES `disk_storage` WRITE;
/*!40000 ALTER TABLE `disk_storage` DISABLE KEYS */;
INSERT INTO `disk_storage` VALUES (1,1,16,462,445,7,7200,1,NULL,5,4000),(2,2,NULL,3500,3500,0,NULL,3,3,10,1000);
/*!40000 ALTER TABLE `disk_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disk_storage_type`
--

DROP TABLE IF EXISTS `disk_storage_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disk_storage_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disk_storage_type`
--

LOCK TABLES `disk_storage_type` WRITE;
/*!40000 ALTER TABLE `disk_storage_type` DISABLE KEYS */;
INSERT INTO `disk_storage_type` VALUES (1,'HDD'),(2,'M.2'),(3,'SSD');
/*!40000 ALTER TABLE `disk_storage_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpu`
--

DROP TABLE IF EXISTS `gpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pcie_version_id` int(11) NOT NULL,
  `vram_in_gb` int(11) NOT NULL,
  `memory_bus` varchar(45) DEFAULT NULL,
  `memory_bandwith_in_gb` double DEFAULT NULL,
  `power_draw` int(11) NOT NULL,
  `frequency` int(11) NOT NULL,
  `attributes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_gpu_pcie_version1_idx` (`pcie_version_id`),
  KEY `fk_gpu_attributes1_idx` (`attributes_id`),
  CONSTRAINT `fk_gpu_attributes1` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gpu_pcie_version1` FOREIGN KEY (`pcie_version_id`) REFERENCES `pcie_version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpu`
--

LOCK TABLES `gpu` WRITE;
/*!40000 ALTER TABLE `gpu` DISABLE KEYS */;
INSERT INTO `gpu` VALUES (1,4,24,'GDDR6X',128,350,1395,1),(2,4,10,'GDDR6X',760,320,1440,3);
/*!40000 ALTER TABLE `gpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpu_has_connector`
--

DROP TABLE IF EXISTS `gpu_has_connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpu_has_connector` (
  `gpu_id` int(11) NOT NULL,
  `connector_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`gpu_id`,`connector_id`),
  KEY `fk_gpu_has_connector_connector1_idx` (`connector_id`),
  KEY `fk_gpu_has_connector_gpu1_idx` (`gpu_id`),
  CONSTRAINT `fk_gpu_has_connector_connector1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gpu_has_connector_gpu1` FOREIGN KEY (`gpu_id`) REFERENCES `gpu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpu_has_connector`
--

LOCK TABLES `gpu_has_connector` WRITE;
/*!40000 ALTER TABLE `gpu_has_connector` DISABLE KEYS */;
/*!40000 ALTER TABLE `gpu_has_connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'de-CH'),(2,'en-US');
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (3,'AMD'),(6,'ASUS'),(9,'Cooler Master'),(4,'Corsair'),(1,'Gigabyte'),(8,'HP'),(2,'Intel'),(10,'Samsung'),(5,'WD');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motherboard`
--

DROP TABLE IF EXISTS `motherboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motherboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu_socket_id` int(11) NOT NULL,
  `motherboard_form_factor_id` int(11) NOT NULL,
  `motherboard_chip_id` int(11) NOT NULL,
  `ddr_standard_id` int(11) NOT NULL,
  `memory_module_count` int(11) NOT NULL,
  `memory_in_gb` double NOT NULL,
  `memory_max_oc_mhz` int(11) DEFAULT NULL,
  `pcie_version_id` int(11) NOT NULL,
  `attributes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_motherboard_cpu_socket1_idx` (`cpu_socket_id`),
  KEY `fk_motherboard_motherboard_form_factor1_idx` (`motherboard_form_factor_id`),
  KEY `fk_motherboard_chipsatz1_idx` (`motherboard_chip_id`),
  KEY `fk_motherboard_ddr4_standard1_idx` (`ddr_standard_id`),
  KEY `fk_motherboard_pcie_version1_idx` (`pcie_version_id`),
  KEY `fk_motherboard_attributes1_idx` (`attributes_id`),
  CONSTRAINT `fk_motherboard_attributes1` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_motherboard_chipsatz1` FOREIGN KEY (`motherboard_chip_id`) REFERENCES `motherboard_chip` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_motherboard_cpu_socket1` FOREIGN KEY (`cpu_socket_id`) REFERENCES `cpu_socket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_motherboard_ddr4_standard1` FOREIGN KEY (`ddr_standard_id`) REFERENCES `ddr_standard` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_motherboard_motherboard_form_factor1` FOREIGN KEY (`motherboard_form_factor_id`) REFERENCES `motherboard_form_factor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_motherboard_pcie_version1` FOREIGN KEY (`pcie_version_id`) REFERENCES `pcie_version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motherboard`
--

LOCK TABLES `motherboard` WRITE;
/*!40000 ALTER TABLE `motherboard` DISABLE KEYS */;
INSERT INTO `motherboard` VALUES (1,1,1,1,5,4,128,4400,4,6);
/*!40000 ALTER TABLE `motherboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motherboard_chip`
--

DROP TABLE IF EXISTS `motherboard_chip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motherboard_chip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motherboard_chip`
--

LOCK TABLES `motherboard_chip` WRITE;
/*!40000 ALTER TABLE `motherboard_chip` DISABLE KEYS */;
INSERT INTO `motherboard_chip` VALUES (1,'AMD X570');
/*!40000 ALTER TABLE `motherboard_chip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motherboard_form_factor`
--

DROP TABLE IF EXISTS `motherboard_form_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motherboard_form_factor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motherboard_form_factor`
--

LOCK TABLES `motherboard_form_factor` WRITE;
/*!40000 ALTER TABLE `motherboard_form_factor` DISABLE KEYS */;
INSERT INTO `motherboard_form_factor` VALUES (1,'ATX');
/*!40000 ALTER TABLE `motherboard_form_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motherboard_has_connector`
--

DROP TABLE IF EXISTS `motherboard_has_connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motherboard_has_connector` (
  `motherboard_id` int(11) NOT NULL,
  `connector_id` int(11) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  PRIMARY KEY (`motherboard_id`,`connector_id`),
  KEY `fk_motherboard_has_connector_connector1_idx` (`connector_id`),
  KEY `fk_motherboard_has_connector_motherboard1_idx` (`motherboard_id`),
  CONSTRAINT `fk_motherboard_has_connector_connector1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_motherboard_has_connector_motherboard1` FOREIGN KEY (`motherboard_id`) REFERENCES `motherboard` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motherboard_has_connector`
--

LOCK TABLES `motherboard_has_connector` WRITE;
/*!40000 ALTER TABLE `motherboard_has_connector` DISABLE KEYS */;
INSERT INTO `motherboard_has_connector` VALUES (1,1,'2'),(1,2,'1'),(1,4,'7'),(1,6,'1'),(1,9,'1'),(1,10,'2'),(1,11,'1');
/*!40000 ALTER TABLE `motherboard_has_connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_build`
--

DROP TABLE IF EXISTS `pc_build`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_build` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_build`
--

LOCK TABLES `pc_build` WRITE;
/*!40000 ALTER TABLE `pc_build` DISABLE KEYS */;
/*!40000 ALTER TABLE `pc_build` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_build_has_user_has_attributes`
--

DROP TABLE IF EXISTS `pc_build_has_user_has_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_build_has_user_has_attributes` (
  `attributes_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pc_build_id` int(11) NOT NULL,
  PRIMARY KEY (`attributes_id`,`user_id`,`pc_build_id`),
  KEY `fk_pc_build_has_user_has_attributes_attributes1_idx` (`attributes_id`),
  KEY `fk_pc_build_has_user_has_attributes_user1_idx` (`user_id`),
  KEY `fk_pc_build_has_user_has_attributes_pc_build1_idx` (`pc_build_id`),
  CONSTRAINT `fk_pc_build_has_user_has_attributes_attributes1` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pc_build_has_user_has_attributes_pc_build1` FOREIGN KEY (`pc_build_id`) REFERENCES `pc_build` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pc_build_has_user_has_attributes_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_build_has_user_has_attributes`
--

LOCK TABLES `pc_build_has_user_has_attributes` WRITE;
/*!40000 ALTER TABLE `pc_build_has_user_has_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pc_build_has_user_has_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_case`
--

DROP TABLE IF EXISTS `pc_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motherboard_form_factor_id` int(11) NOT NULL,
  `attributes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_pc_case_attributes1_idx` (`attributes_id`),
  KEY `fk_pc_case_motherboard_form_factor1` (`motherboard_form_factor_id`),
  CONSTRAINT `fk_pc_case_attributes1` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pc_case_motherboard_form_factor1` FOREIGN KEY (`motherboard_form_factor_id`) REFERENCES `motherboard_form_factor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_case`
--

LOCK TABLES `pc_case` WRITE;
/*!40000 ALTER TABLE `pc_case` DISABLE KEYS */;
INSERT INTO `pc_case` VALUES (1,1,8);
/*!40000 ALTER TABLE `pc_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_case_has_connector`
--

DROP TABLE IF EXISTS `pc_case_has_connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_case_has_connector` (
  `pc_case_id` int(11) NOT NULL,
  `connector_id` int(11) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  PRIMARY KEY (`pc_case_id`,`connector_id`),
  KEY `fk_pc_case_has_connector_connector1_idx` (`connector_id`),
  KEY `fk_pc_case_has_connector_pc_case1_idx` (`pc_case_id`),
  CONSTRAINT `fk_pc_case_has_connector_connector1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pc_case_has_connector_pc_case1` FOREIGN KEY (`pc_case_id`) REFERENCES `pc_case` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_case_has_connector`
--

LOCK TABLES `pc_case_has_connector` WRITE;
/*!40000 ALTER TABLE `pc_case_has_connector` DISABLE KEYS */;
INSERT INTO `pc_case_has_connector` VALUES (1,4,'2');
/*!40000 ALTER TABLE `pc_case_has_connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_case_has_disk_form_factor`
--

DROP TABLE IF EXISTS `pc_case_has_disk_form_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_case_has_disk_form_factor` (
  `pc_case_id` int(11) NOT NULL,
  `disk_form_factor_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`pc_case_id`,`disk_form_factor_id`),
  KEY `fk_pc_case_has_disk_form_factor_disk_form_factor1_idx` (`disk_form_factor_id`),
  KEY `fk_pc_case_has_disk_form_factor_pc_case1_idx` (`pc_case_id`),
  CONSTRAINT `fk_pc_case_has_disk_form_factor_disk_form_factor1` FOREIGN KEY (`disk_form_factor_id`) REFERENCES `disk_form_factor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pc_case_has_disk_form_factor_pc_case1` FOREIGN KEY (`pc_case_id`) REFERENCES `pc_case` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_case_has_disk_form_factor`
--

LOCK TABLES `pc_case_has_disk_form_factor` WRITE;
/*!40000 ALTER TABLE `pc_case_has_disk_form_factor` DISABLE KEYS */;
INSERT INTO `pc_case_has_disk_form_factor` VALUES (1,1,4),(1,2,5);
/*!40000 ALTER TABLE `pc_case_has_disk_form_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcie_version`
--

DROP TABLE IF EXISTS `pcie_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcie_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `version_UNIQUE` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcie_version`
--

LOCK TABLES `pcie_version` WRITE;
/*!40000 ALTER TABLE `pcie_version` DISABLE KEYS */;
INSERT INTO `pcie_version` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `pcie_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power_supply`
--

DROP TABLE IF EXISTS `power_supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power_supply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `psu_certificate_id` int(11) NOT NULL,
  `form_factor` varchar(45) DEFAULT NULL,
  `power_in_w` int(11) NOT NULL,
  `cable_management` tinyint(4) NOT NULL,
  `attributes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_power_supply_psu_certificate1_idx` (`psu_certificate_id`),
  KEY `fk_power_supply_attributes1_idx` (`attributes_id`),
  CONSTRAINT `fk_power_supply_attributes1` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_power_supply_psu_certificate1` FOREIGN KEY (`psu_certificate_id`) REFERENCES `psu_certificate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_supply`
--

LOCK TABLES `power_supply` WRITE;
/*!40000 ALTER TABLE `power_supply` DISABLE KEYS */;
INSERT INTO `power_supply` VALUES (1,1,'NDR',200,0,7);
/*!40000 ALTER TABLE `power_supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psu_certificate`
--

DROP TABLE IF EXISTS `psu_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psu_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psu_certificate`
--

LOCK TABLES `psu_certificate` WRITE;
/*!40000 ALTER TABLE `psu_certificate` DISABLE KEYS */;
INSERT INTO `psu_certificate` VALUES (1,'i\'m_under_the_water');
/*!40000 ALTER TABLE `psu_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ram`
--

DROP TABLE IF EXISTS `ram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ram` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ddr_standard_id` int(11) NOT NULL,
  `storage_in_gb` int(11) NOT NULL,
  `attributes_id` int(11) NOT NULL,
  `memory_module_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idram_UNIQUE` (`id`),
  KEY `fk_ram_ddr4_standard1_idx` (`ddr_standard_id`),
  KEY `fk_ram_attributes1_idx` (`attributes_id`),
  CONSTRAINT `fk_ram_attributes1` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ram_ddr4_standard1` FOREIGN KEY (`ddr_standard_id`) REFERENCES `ddr_standard` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ram`
--

LOCK TABLES `ram` WRITE;
/*!40000 ALTER TABLE `ram` DISABLE KEYS */;
INSERT INTO `ram` VALUES (1,8,16,9,2);
/*!40000 ALTER TABLE `ram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locales_id` int(11) NOT NULL DEFAULT 2,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lore','1594244d52f2d8c12b142bb61f47bc2eaf503d6d9ca8480cae9fcf112f66e4967dc5e8fa98285e36db8af1b8ffa8b84cb15e0fbcf836c3deb803c13f37659a60',2),(2,'lor-el','1594244d52f2d8c12b142bb61f47bc2eaf503d6d9ca8480cae9fcf112f66e4967dc5e8fa98285e36db8af1b8ffa8b84cb15e0fbcf836c3deb803c13f37659a60',2),(3,'elion','64c11805d7eacc5d5d8ac86a6eef4050b1a17a3f50beda46b8789788b3175aea908faa5efafd9f20eecf9f11e22817618bb7ca4693c81ba79f4d27fe3e86b623',2),(4,'mb','d9e6762dd1c8eaf6d61b3c6192fc408d4d6d5f1176d0c29169bc24e71c3f274ad27fcd5811b313d681f7e55ec02d73d499c95455b6b5bb503acf574fba8ffe85',2),(5,'aegwaewg','f22d51d25292ca1d0f68f69aedc7897019308cc9db46efb75a03dd494fc7f126c010e8ade6a00a0c1a5f1b75d81e0ed5a93ce98dc9b833db7839247b1d9c24fe',2),(6,'zlettl','1594244d52f2d8c12b142bb61f47bc2eaf503d6d9ca8480cae9fcf112f66e4967dc5e8fa98285e36db8af1b8ffa8b84cb15e0fbcf836c3deb803c13f37659a60',2),(7,'zbajel','1594244d52f2d8c12b142bb61f47bc2eaf503d6d9ca8480cae9fcf112f66e4967dc5e8fa98285e36db8af1b8ffa8b84cb15e0fbcf836c3deb803c13f37659a60',2),(8,'test1234','1594244d52f2d8c12b142bb61f47bc2eaf503d6d9ca8480cae9fcf112f66e4967dc5e8fa98285e36db8af1b8ffa8b84cb15e0fbcf836c3deb803c13f37659a60',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-31 14:01:06
