-- MySQL dump 10.13  Distrib 8.4.13, for Linux (x86_64)
--
-- Host: localhost    Database: pixel_security_360
-- ------------------------------------------------------
-- Server version	8.4.13

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
-- Table structure for table `autenticaciones`
--

DROP TABLE IF EXISTS `autenticaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autenticaciones` (
  `id_autenticacion` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `fecha_inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_expiracion` datetime NOT NULL,
  `token_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispositivo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('activa','expirada','cerrada','revocada') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activa',
  `activa` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_autenticacion`),
  UNIQUE KEY `token_hash` (`token_hash`),
  KEY `fk_pixel_autenticacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_pixel_autenticacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `chk_pixel_fecha_autenticacion` CHECK ((`fecha_expiracion` > `fecha_inicio`))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autenticaciones`
--

LOCK TABLES `autenticaciones` WRITE;
/*!40000 ALTER TABLE `autenticaciones` DISABLE KEYS */;
INSERT INTO `autenticaciones` VALUES (1,1,'2026-10-12 08:00:00','2026-10-12 10:00:00','pixel_demo_hash_001','Laptop Windows','192.0.2.1','expirada',0),(2,2,'2026-10-12 09:00:00','2026-10-12 11:00:00','pixel_demo_hash_002','Samsung Galaxy','192.0.2.2','expirada',0),(3,3,'2026-10-12 10:00:00','2026-10-12 12:00:00','pixel_demo_hash_003','iPhone','192.0.2.3','cerrada',0),(4,4,'2026-10-13 08:00:00','2026-10-13 10:00:00','pixel_demo_hash_004','Laptop HP','192.0.2.4','expirada',0),(5,5,'2026-10-13 09:00:00','2026-10-13 11:00:00','pixel_demo_hash_005','Tablet Android','192.0.2.5','cerrada',0),(6,6,'2026-10-13 10:00:00','2026-10-13 12:00:00','pixel_demo_hash_006','Computadora Dell','192.0.2.6','expirada',0),(7,7,'2026-10-14 08:00:00','2026-10-14 10:00:00','pixel_demo_hash_007','Laptop Lenovo','192.0.2.7','revocada',0),(8,8,'2026-10-14 09:00:00','2026-10-14 11:00:00','pixel_demo_hash_008','iPad','192.0.2.8','expirada',0),(9,9,'2026-10-14 10:00:00','2026-10-14 12:00:00','pixel_demo_hash_009','PC Windows','192.0.2.9','cerrada',0),(10,10,'2026-10-15 08:00:00','2026-10-15 10:00:00','pixel_demo_hash_010','MacBook','192.0.2.10','expirada',0),(11,11,'2026-10-15 09:00:00','2026-10-15 11:00:00','pixel_demo_hash_011','Laptop Acer','192.0.2.11','expirada',0),(12,12,'2026-10-15 10:00:00','2026-10-15 12:00:00','pixel_demo_hash_012','Samsung Tablet','192.0.2.12','cerrada',0),(13,13,'2026-10-16 08:00:00','2026-10-16 10:00:00','pixel_demo_hash_013','Laptop Asus','192.0.2.13','expirada',0),(14,14,'2026-10-16 09:00:00','2026-10-16 11:00:00','pixel_demo_hash_014','iPhone 14','192.0.2.14','expirada',0),(15,15,'2026-10-16 10:00:00','2026-10-16 12:00:00','pixel_demo_hash_015','PC Escritorio','192.0.2.15','revocada',0),(16,16,'2026-10-17 08:00:00','2026-10-17 10:00:00','pixel_demo_hash_016','Laptop HP','192.0.2.16','cerrada',0),(17,17,'2026-10-17 09:00:00','2026-10-17 11:00:00','pixel_demo_hash_017','Samsung Galaxy','192.0.2.17','expirada',0),(18,18,'2026-10-17 10:00:00','2026-10-17 12:00:00','pixel_demo_hash_018','Tablet Android','192.0.2.18','cerrada',0),(19,19,'2026-10-18 08:00:00','2026-10-18 10:00:00','pixel_demo_hash_019','MacBook Pro','192.0.2.19','expirada',0),(20,20,'2026-10-18 09:00:00','2026-10-18 11:00:00','pixel_demo_hash_020','Laptop Lenovo','192.0.2.20','cerrada',0),(21,21,'2026-10-19 08:00:00','2026-10-19 10:00:00','pixel_demo_hash_021','PC Administracion','192.0.2.21','expirada',0),(22,22,'2026-10-19 09:00:00','2026-10-19 11:00:00','pixel_demo_hash_022','Laptop Oficina','192.0.2.22','expirada',0),(23,23,'2026-10-20 08:00:00','2026-10-20 10:00:00','pixel_demo_hash_023','PC Analista','192.0.2.23','cerrada',0),(24,24,'2026-10-20 09:00:00','2026-10-20 11:00:00','pixel_demo_hash_024','Laptop Analista','192.0.2.24','expirada',0),(25,25,'2026-10-20 10:00:00','2026-10-20 12:00:00','pixel_demo_hash_025','PC Seguridad','192.0.2.25','cerrada',0);
/*!40000 ALTER TABLE `autenticaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_reporte` int NOT NULL,
  `fecha_pago` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` enum('tarjeta','transferencia','yappy','efectivo','otro') COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia_pago` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('pendiente','aprobado','rechazado','reembolsado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pendiente',
  `confirmado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `referencia_pago` (`referencia_pago`),
  KEY `fk_pixel_pago_usuario` (`id_usuario`),
  KEY `fk_pixel_pago_reporte` (`id_reporte`),
  CONSTRAINT `fk_pixel_pago_reporte` FOREIGN KEY (`id_reporte`) REFERENCES `reportes` (`id_reporte`),
  CONSTRAINT `fk_pixel_pago_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `chk_pago_pixel_monto` CHECK ((`monto` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,1,'2026-10-12 09:00:00',150.00,'tarjeta','PIX-PAG-001','aprobado',1),(2,2,2,'2026-10-12 10:00:00',450.00,'transferencia','PIX-PAG-002','aprobado',1),(3,3,3,'2026-10-12 11:00:00',180.00,'yappy','PIX-PAG-003','aprobado',1),(4,4,4,'2026-10-13 08:30:00',300.00,'tarjeta','PIX-PAG-004','aprobado',1),(5,5,5,'2026-10-13 09:30:00',220.00,'transferencia','PIX-PAG-005','pendiente',0),(6,6,6,'2026-10-13 10:30:00',220.00,'tarjeta','PIX-PAG-006','aprobado',1),(7,7,7,'2026-10-14 08:00:00',65.00,'yappy','PIX-PAG-007','aprobado',1),(8,8,8,'2026-10-14 09:00:00',280.00,'transferencia','PIX-PAG-008','aprobado',1),(9,9,9,'2026-10-14 10:00:00',160.00,'tarjeta','PIX-PAG-009','aprobado',1),(10,10,10,'2026-10-14 11:00:00',240.00,'yappy','PIX-PAG-010','aprobado',1),(11,11,11,'2026-10-15 08:00:00',70.00,'efectivo','PIX-PAG-011','aprobado',1),(12,12,12,'2026-10-15 09:00:00',200.00,'transferencia','PIX-PAG-012','pendiente',0),(13,13,13,'2026-10-15 10:00:00',110.00,'tarjeta','PIX-PAG-013','aprobado',1),(14,14,14,'2026-10-15 11:00:00',140.00,'yappy','PIX-PAG-014','aprobado',1),(15,15,15,'2026-10-16 08:00:00',190.00,'tarjeta','PIX-PAG-015','rechazado',0),(16,16,16,'2026-10-16 09:00:00',125.00,'transferencia','PIX-PAG-016','aprobado',1),(17,17,17,'2026-10-16 10:00:00',210.00,'tarjeta','PIX-PAG-017','aprobado',1),(18,18,18,'2026-10-16 11:00:00',175.00,'yappy','PIX-PAG-018','aprobado',1),(19,19,19,'2026-10-17 08:00:00',115.00,'efectivo','PIX-PAG-019','aprobado',1),(20,20,20,'2026-10-17 09:00:00',320.00,'transferencia','PIX-PAG-020','aprobado',1),(21,1,21,'2026-10-17 10:00:00',120.00,'tarjeta','PIX-PAG-021','aprobado',1),(22,2,22,'2026-10-18 08:00:00',130.00,'yappy','PIX-PAG-022','aprobado',1),(23,3,23,'2026-10-18 09:00:00',80.00,'tarjeta','PIX-PAG-023','aprobado',1),(24,4,24,'2026-10-18 10:00:00',260.00,'transferencia','PIX-PAG-024','aprobado',1),(25,5,25,'2026-10-18 11:00:00',350.00,'tarjeta','PIX-PAG-025','pendiente',0);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `id_reporte` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_tipo_prueba` int NOT NULL,
  `titulo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_reporte` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nivel_riesgo` enum('bajo','medio','alto','critico') COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('pendiente','en_proceso','finalizado','entregado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pendiente',
  `resultado` text COLLATE utf8mb4_unicode_ci,
  `archivo_reporte` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revisado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_reporte`),
  KEY `fk_reporte_usuario` (`id_usuario`),
  KEY `fk_reporte_tipo_prueba` (`id_tipo_prueba`),
  CONSTRAINT `fk_reporte_tipo_prueba` FOREIGN KEY (`id_tipo_prueba`) REFERENCES `tipos_pruebas` (`id_tipo_prueba`),
  CONSTRAINT `fk_reporte_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,1,1,'Revision de portal web','Evaluacion del portal principal','2026-10-23 17:05:15','alto','entregado','Se detectaron configuraciones inseguras','reporte_001.pdf',1),(2,2,2,'Seguridad de red corporativa','Analisis de red interna','2026-10-23 17:05:15','critico','finalizado','Se identificaron servicios expuestos','reporte_002.pdf',1),(3,3,3,'Revision de firewall','Evaluacion de reglas de acceso','2026-10-23 17:05:15','alto','entregado','Se recomendaron ajustes de seguridad','reporte_003.pdf',1),(4,4,4,'Seguridad de app movil','Revision de aplicacion Android','2026-10-23 17:05:15','medio','finalizado','Se detectaron permisos excesivos','reporte_004.pdf',1),(5,5,5,'Auditoria servidor Linux','Revision de configuraciones del servidor','2026-10-23 17:05:15','alto','en_proceso',NULL,NULL,0),(6,6,6,'Auditoria servidor Windows','Revision de servicios de Windows','2026-10-23 17:05:15','medio','entregado','Se identificaron actualizaciones pendientes','reporte_006.pdf',1),(7,7,7,'Revision de certificados','Verificacion de certificados TLS','2026-10-23 17:05:15','bajo','finalizado','Certificados validos','reporte_007.pdf',1),(8,8,8,'Seguridad de base de datos','Evaluacion de permisos SQL','2026-10-23 17:05:15','critico','entregado','Se detectaron privilegios excesivos','reporte_008.pdf',1),(9,9,9,'Prueba de autenticacion','Revision del sistema de acceso','2026-10-23 17:05:15','alto','finalizado','Se recomendaron controles adicionales','reporte_009.pdf',1),(10,10,10,'Evaluacion de API','Analisis de servicios REST','2026-10-23 17:05:15','alto','entregado','Se identificaron validaciones insuficientes','reporte_010.pdf',1),(11,11,11,'Escaneo de red','Identificacion de puertos abiertos','2026-10-23 17:05:15','medio','finalizado','Se encontraron puertos innecesarios','reporte_011.pdf',1),(12,12,12,'Analisis de archivos','Revision de archivos sospechosos','2026-10-23 17:05:15','alto','en_proceso',NULL,NULL,0),(13,13,13,'Evaluacion de respaldos','Comprobacion de copias de seguridad','2026-10-23 17:05:15','medio','entregado','Se recomendaron respaldos adicionales','reporte_013.pdf',1),(14,14,14,'Seguridad de correo','Revision de configuracion del correo','2026-10-23 17:05:15','alto','finalizado','Se recomendaron mejoras de autenticacion','reporte_014.pdf',1),(15,15,15,'Evaluacion de WiFi','Analisis de seguridad inalambrica','2026-10-23 17:05:15','alto','pendiente',NULL,NULL,0),(16,16,16,'Auditoria de permisos','Revision de privilegios internos','2026-10-23 17:05:15','medio','entregado','Se identificaron permisos innecesarios','reporte_016.pdf',1),(17,17,17,'Revision de consultas SQL','Evaluacion de entradas de usuario','2026-10-23 17:05:15','critico','finalizado','Se recomendaron consultas parametrizadas','reporte_017.pdf',1),(18,18,18,'Evaluacion de scripts web','Analisis de contenido web','2026-10-23 17:05:15','alto','entregado','Se detectaron validaciones deficientes','reporte_018.pdf',1),(19,19,19,'Revision DNS','Evaluacion de registros DNS','2026-10-23 17:05:15','medio','finalizado','Se recomendaron ajustes en los registros','reporte_019.pdf',1),(20,20,20,'Auditoria de nube','Analisis de servicios cloud','2026-10-23 17:05:15','alto','entregado','Se detectaron permisos excesivos','reporte_020.pdf',1),(21,1,21,'Revision de logs','Analisis de eventos de seguridad','2026-10-23 17:05:15','medio','finalizado','Se identificaron eventos para seguimiento','reporte_021.pdf',1),(22,2,22,'Verificacion MFA','Evaluacion de autenticacion multifactor','2026-10-23 17:05:15','bajo','entregado','Los controles revisados funcionan','reporte_022.pdf',1),(23,3,23,'Revision HTTPS','Comprobacion de configuracion HTTPS','2026-10-23 17:05:15','bajo','finalizado','Se recomendaron cabeceras adicionales','reporte_023.pdf',1),(24,4,24,'Seguridad de Docker','Revision de configuraciones de contenedores','2026-10-23 17:05:15','alto','entregado','Se recomendaron mejoras de aislamiento','reporte_024.pdf',1),(25,5,25,'Evaluacion de sistema antiguo','Analisis de sistema heredado','2026-10-23 17:05:15','critico','pendiente',NULL,NULL,0);
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_pruebas`
--

DROP TABLE IF EXISTS `tipos_pruebas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_pruebas` (
  `id_tipo_prueba` int NOT NULL AUTO_INCREMENT,
  `nombre_prueba` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` enum('redes','web','aplicaciones','infraestructura','otros') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel_riesgo` enum('bajo','medio','alto','critico') COLLATE utf8mb4_unicode_ci NOT NULL,
  `costo_base` decimal(10,2) NOT NULL,
  `duracion_estimada_horas` int NOT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `referencia` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('activo','desactivado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id_tipo_prueba`),
  UNIQUE KEY `nombre_prueba` (`nombre_prueba`),
  UNIQUE KEY `referencia` (`referencia`),
  CONSTRAINT `chk_costo_prueba` CHECK ((`costo_base` >= 0)),
  CONSTRAINT `chk_duracion_prueba` CHECK ((`duracion_estimada_horas` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_pruebas`
--

LOCK TABLES `tipos_pruebas` WRITE;
/*!40000 ALTER TABLE `tipos_pruebas` DISABLE KEYS */;
INSERT INTO `tipos_pruebas` VALUES (1,'Analisis de vulnerabilidades web','Identifica fallas de seguridad en sitios web','web','alto',150.00,6,1,'2026-10-22 18:42:22','PT-001','activo'),(2,'Pentesting de red interna','Evalua la seguridad de una red corporativa','redes','critico',450.00,16,1,'2026-10-22 18:42:22','PT-002','activo'),(3,'Auditoria de firewall','Revisa reglas y configuraciones del firewall','redes','alto',180.00,8,1,'2026-10-22 18:42:22','PT-003','activo'),(4,'Seguridad de aplicaciones moviles','Evalua vulnerabilidades en aplicaciones moviles','aplicaciones','alto',300.00,12,1,'2026-10-22 18:42:22','PT-004','activo'),(5,'Analisis de servidores Linux','Revisa configuraciones y servicios de servidores Linux','infraestructura','alto',220.00,10,1,'2026-10-22 18:42:22','PT-005','activo'),(6,'Analisis de servidores Windows','Evalua seguridad en servidores Windows','infraestructura','alto',220.00,10,1,'2026-10-22 18:42:22','PT-006','activo'),(7,'Revision de certificados SSL','Comprueba certificados y configuraciones TLS','web','medio',65.00,3,1,'2026-10-22 18:42:22','PT-007','activo'),(8,'Auditoria de bases de datos','Evalua permisos y configuraciones de bases de datos','infraestructura','critico',280.00,12,1,'2026-10-22 18:42:22','PT-008','activo'),(9,'Pruebas de autenticacion','Revisa controles de inicio de sesion','aplicaciones','alto',160.00,7,1,'2026-10-22 18:42:22','PT-009','activo'),(10,'Evaluacion de API REST','Identifica vulnerabilidades en interfaces API','aplicaciones','alto',240.00,10,1,'2026-10-22 18:42:22','PT-010','activo'),(11,'Escaneo de puertos','Identifica puertos y servicios expuestos','redes','medio',70.00,3,1,'2026-10-22 18:42:22','PT-011','activo'),(12,'Analisis de malware','Examina archivos y sistemas sospechosos','otros','critico',200.00,8,1,'2026-10-22 18:42:22','PT-012','activo'),(13,'Revision de copias de seguridad','Comprueba configuraciones de respaldo','infraestructura','medio',110.00,5,1,'2026-10-22 18:42:22','PT-013','activo'),(14,'Auditoria de correo corporativo','Evalua configuraciones de seguridad del correo','otros','alto',140.00,6,1,'2026-10-22 18:42:22','PT-014','activo'),(15,'Evaluacion de red WiFi','Revisa seguridad de redes inalambricas','redes','alto',190.00,8,1,'2026-10-22 18:42:22','PT-015','activo'),(16,'Revision de permisos','Analiza privilegios y controles de acceso','infraestructura','medio',125.00,5,1,'2026-10-22 18:42:22','PT-016','activo'),(17,'Pruebas de inyeccion SQL','Evalua riesgos de inyeccion en consultas','web','critico',210.00,9,1,'2026-10-22 18:42:22','PT-017','activo'),(18,'Analisis de XSS','Busca vulnerabilidades de scripts en sitios web','web','alto',175.00,7,1,'2026-10-22 18:42:22','PT-018','activo'),(19,'Evaluacion de seguridad DNS','Revisa configuraciones y riesgos del servicio DNS','redes','medio',115.00,5,1,'2026-10-22 18:42:22','PT-019','activo'),(20,'Auditoria de servicios cloud','Evalua configuraciones de recursos en la nube','infraestructura','alto',320.00,14,1,'2026-10-22 18:42:22','PT-020','activo'),(21,'Revision de registros de seguridad','Analiza eventos y registros de sistemas','otros','medio',120.00,6,1,'2026-10-22 18:42:22','PT-021','activo'),(22,'Evaluacion de controles MFA','Revisa mecanismos de doble autenticacion','aplicaciones','medio',130.00,5,1,'2026-10-22 18:42:22','PT-022','activo'),(23,'Analisis de configuracion HTTPS','Comprueba cabeceras y configuraciones HTTPS','web','bajo',80.00,4,1,'2026-10-22 18:42:22','PT-023','activo'),(24,'Auditoria de contenedores Docker','Evalua configuraciones de seguridad de contenedores','infraestructura','alto',260.00,11,1,'2026-10-22 18:42:22','PT-024','activo'),(25,'Evaluacion de sistemas heredados','Revisa riesgos asociados a sistemas antiguos','otros','critico',350.00,15,0,'2026-10-22 18:42:22','PT-025','desactivado');
/*!40000 ALTER TABLE `tipos_pruebas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_usuario` enum('cliente','administrador','analista','vendedor','ejecutivo','otros') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cliente',
  `estado` enum('activo','inactivo','suspendido') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `verificado` tinyint(1) NOT NULL DEFAULT '0',
  `nombre_usuario` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contrasena_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexo` enum('masculino','femenino','otro','prefiere_no_decir') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_civil` enum('soltero','casado','divorciado','viudo','union_libre') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_empresa` enum('publica','privada') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Carlos','Mendoza','cmendoza01@example.com','6123-5001','cliente','activo','2026-10-22 18:17:39',1,'usuario_001','fc6f8ad4548744c6909d7f1c2f2be8952104f88e51fa81f5732e01305977e7a9','2fc85ea5c459a44ac48b7fc3401258ebbe1003135c63b07fb55ba5994fe84981','La Chorrera','femenino','soltero','privada','Direccion ficticia 1, Panama'),(2,'Maria','Gonzalez','mgonzalez02@example.com','6123-5002','cliente','activo','2026-10-22 18:17:39',1,'usuario_002','172ee780d514264f77560add759e25bbee9b94bdbe6acff474e11d71c31800b3','43f5fe1aee533a2d7877c771620d0d1bcd0a66e21c2700811c7d0e9e87897e5c','David','prefiere_no_decir','union_libre','publica','Direccion ficticia 2, Panama'),(3,'Jose','Rodriguez','jrodriguez03@example.com','6123-5003','cliente','activo','2026-10-22 18:17:39',1,'usuario_003','347e42484834888c53f1658d3ec9a41ecdf22c81bad58d819a32b180968c14b4','7084da330b684a72dd300e1039f504deef5f62b2919bf2b98e65d91a76abc2f9','Santiago','masculino','divorciado','privada','Direccion ficticia 3, Panama'),(4,'Ana','Martinez','amartinez04@example.com','6123-5004','cliente','activo','2026-10-22 18:17:39',1,'usuario_004','f36904778c128ee1daa8213192abfbc43f81a4157be79c9ca161732ea6376ac3','eacd3060fddccf6a2f4843eca476b8093cad54352eef300d74d0c8857596f4eb','Chitre','femenino','casado','publica','Direccion ficticia 4, Panama'),(5,'Luis','Fernandez','lfernandez05@example.com','6123-5005','cliente','activo','2026-10-22 18:17:39',0,'usuario_005','cb6020889900a16f4ac9259266c14d928a57ababc12c2c142e063b3024e084bb','0b31b9ad546b5572bbc03dec0c5e47deb30eec701d289f1e73df830fc2bda4f2','Ciudad de Panama','prefiere_no_decir','soltero','privada','Direccion ficticia 5, Panama'),(6,'Sofia','Ramirez','sramirez06@example.com','6123-5006','cliente','activo','2026-10-22 18:17:39',1,'usuario_006','2ed4c384ace9a0b65a4fa75a2c8d4874e19bcf9430620d2997496cac1d1d2a77','da6efeda3b4c6a38b56063839ed7ce1634191bf45fd00cf65bbc43a43ff608d4','La Chorrera','masculino','union_libre','publica','Direccion ficticia 6, Panama'),(7,'Pedro','Castillo','pcastillo07@example.com','6123-5007','cliente','inactivo','2026-10-22 18:17:39',0,'usuario_007','e38dce60e521b99b223f08a749190a6d91362e94889e9af5a5e17bd8c7b83f05','6b3493ad8d42d89cfdb27eaeebc5e775442c5b20a2cbe8954ab405802b32942b','David','femenino','divorciado','privada','Direccion ficticia 7, Panama'),(8,'Laura','Morales','lmorales08@example.com','6123-5008','cliente','activo','2026-10-22 18:17:39',1,'usuario_008','4521b3c3184eb5e15463ef2a6e6f5517604d1a4ff170506a73b6c252303ce42d','fdd51459ae26bba5035d72d7e62ccc8f3492da2b490f48e85b2d445a9ecb5e97','Santiago','prefiere_no_decir','casado','publica','Direccion ficticia 8, Panama'),(9,'Daniel','Herrera','dherrera09@example.com','6123-5009','cliente','activo','2026-10-22 18:17:39',1,'usuario_009','cd5fa73e365a44757f79e54086f12fce6b15eefd383f2754ebcc5ea124d2a271','89cfc754c134597204109085222327557dbdc0e2b2d3675ad31a125d743f5537','Chitre','masculino','soltero','privada','Direccion ficticia 9, Panama'),(10,'Valeria','Torres','vtorres10@example.com','6123-5010','cliente','activo','2026-10-22 18:17:39',0,'usuario_010','908b4a208e060dfd4078e6d9d07302b261664fc2bdb75d0b6a64fcfd8dcca4ad','505fd84abf925d7af4d84e67651bb1f12b6f43530fe9180481f266c3ec464836','Ciudad de Panama','femenino','union_libre','publica','Direccion ficticia 10, Panama'),(11,'Andres','Vargas','avargas11@example.com','6123-5011','cliente','activo','2026-10-22 18:17:39',1,'usuario_011','78bc5304142bb448e2a4abf98f620c2ada4d221917a21dce9dc1530ca302adfe','76312e9ed34e8f294f8a020095a8e2366c5a7de5662aec20aed23f440976a06a','La Chorrera','prefiere_no_decir','divorciado','privada','Direccion ficticia 11, Panama'),(12,'Camila','Rios','crios12@example.com','6123-5012','cliente','activo','2026-10-22 18:17:39',1,'usuario_012','6bbb21f9a6b27ad81f9c01db3a54b246f4e11cc814913d8792cd33db0f3b348e','b686560658d4646090cd77f44b31384aaa0360eaa092db449956a943e88e5333','David','masculino','casado','publica','Direccion ficticia 12, Panama'),(13,'Ricardo','Pineda','rpineda13@example.com','6123-5013','cliente','activo','2026-10-22 18:17:39',1,'usuario_013','8bef336c33e9a6836711cb04c3136758cc16159f7b781c82c8d02d495d000a17','b66be5dd131dff918baac17b357ca45700dc9cc822d56822c3896ed94943322f','Santiago','femenino','soltero','privada','Direccion ficticia 13, Panama'),(14,'Gabriela','Soto','gsoto14@example.com','6123-5014','cliente','activo','2026-10-22 18:17:39',1,'usuario_014','99d619c0b5c1aec326bc4c1668d6dceb843ec2b6f9ede108db4a51919c6c774b','7104109c574cc69e72249b93353e7d290b0c7620d93663ea96c6ca5e7af07fbb','Chitre','prefiere_no_decir','union_libre','publica','Direccion ficticia 14, Panama'),(15,'Fernando','Lopez','flopez15@example.com','6123-5015','cliente','suspendido','2026-10-22 18:17:39',0,'usuario_015','5183be0771120176178e48b485a774cc893bc74ebe4685907ec8f3f341caf9ac','0015d69a0c6c32a70f6ba4a284ce6737f79205292781482ae73dd32f5e981249','Ciudad de Panama','masculino','divorciado','privada','Direccion ficticia 15, Panama'),(16,'Natalia','Acosta','nacosta16@example.com','6123-5016','cliente','activo','2026-10-22 18:17:39',1,'usuario_016','92d2d391bf88b221aba31f2138d058b31bffc4fe8a0eec7e8faf439a64263927','206c53588cff54018a9f5cd25ea7db931cfcb0e9561c0785e4dfa78e6d85a75f','La Chorrera','femenino','casado','publica','Direccion ficticia 16, Panama'),(17,'Javier','Ortega','jortega17@example.com','6123-5017','cliente','activo','2026-10-22 18:17:39',1,'usuario_017','9c9b5f720295e6a3454bf05f35a6c1ce6ea86a2732772882dcceaff10c7e3e7c','4563c41625f0e775d5e65bdfa5dd0122cf7ad61cbb6fd8c8c1453724bcfa808b','David','prefiere_no_decir','soltero','privada','Direccion ficticia 17, Panama'),(18,'Paola','Navarro','pnavarro18@example.com','6123-5018','cliente','activo','2026-10-22 18:17:39',1,'usuario_018','9f7c72ea5ba24f79e26c8efd72db87778ff8f29f8d0fcebb049c3d0b4134be29','5a5540a6a5a6a93942115e1e023ddf514265d131035a6bdaa5abfb724df7c7ad','Santiago','masculino','union_libre','publica','Direccion ficticia 18, Panama'),(19,'Miguel','Salazar','msalazar19@example.com','6123-5019','cliente','activo','2026-10-22 18:17:39',1,'usuario_019','c1c3120d8e081220f96f9096ffa6431fa069ad084f4eb42b24259cc575129998','72edeeff73d539979c9473b948514b0950ec96064e74a1077b6c962bb7145399','Chitre','femenino','divorciado','privada','Direccion ficticia 19, Panama'),(20,'Elena','Fuentes','efuentes20@example.com','6123-5020','cliente','activo','2026-10-22 18:17:39',0,'usuario_020','08a5cb75cd116b41ed8156f4b9353b1f15e9dbc43c636daa22294ed19c997a0a','340f2ca0e95da5d72edb48097d72e53d993519dc2ea31c115b3cc20bef1a5a1d','Ciudad de Panama','prefiere_no_decir','casado','publica','Direccion ficticia 20, Panama'),(21,'Roberto','Aguilar','raguilar21@example.com','6123-5021','administrador','activo','2026-10-22 18:17:39',1,'usuario_021','58a5bd7ecf1e06cb3a2935c975914a9c346e7bf82b0f5e5640412a5c93d8acb8','26a72754bd10bd14f311d2d7dcdb46087e812e1491c08a3d41d1edc8dc2f541d','La Chorrera','masculino','soltero','privada','Direccion ficticia 21, Panama'),(22,'Patricia','Vega','pvega22@example.com','6123-5022','administrador','activo','2026-10-22 18:17:39',1,'usuario_022','2a6ee64a25288e89acc166dcb7ad6ef66ff972559115d76f336d20c309abe02a','165b24bb9be96f98a7aee15806535bf858515a06f1d0ad3677000ba89d3d903f','David','femenino','union_libre','publica','Direccion ficticia 22, Panama'),(23,'Diego','Suarez','dsuarez23@example.com','6123-5023','analista','activo','2026-10-22 18:17:39',1,'usuario_023','adf99efcd1a536ff9431231304b47dbafebdff5f52d0154672b4bc836cd0eaaf','c2e5965371740a827bf96f464994ba0ac5bd32439d19bec6c007661fcdde6192','Santiago','prefiere_no_decir','divorciado','privada','Direccion ficticia 23, Panama'),(24,'Isabel','Cordero','icordero24@example.com','6123-5024','analista','activo','2026-10-22 18:17:39',1,'usuario_024','57828340bbf5550ef82e9406ff2770e63124cefa860a10de95e9a853ad1cb0bf','0a481e921f385a1b23215b67bf08f5feefc6473b00f3206dd23976f48787b4e4','Chitre','masculino','casado','publica','Direccion ficticia 24, Panama'),(25,'Oscar','Medina','omedina25@example.com','6123-5025','analista','activo','2026-10-22 18:17:39',1,'usuario_025','4175144a3ca1e4b96f7589d675f91ac50e85b339f061352d8f46e1243854f181','a21cf9d8c54a41625450a4b414a133eb2ae5f1bd86cca03870915d2522ca7e2a','Ciudad de Panama','femenino','soltero','privada','Direccion ficticia 25, Panama');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-23 18:08:32
