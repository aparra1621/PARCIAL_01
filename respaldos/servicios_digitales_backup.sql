-- MySQL dump 10.13  Distrib 8.4.13, for Linux (x86_64)
--
-- Host: localhost    Database: servicios_digitales
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
-- Table structure for table `auditoria_accesos`
--

DROP TABLE IF EXISTS `auditoria_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_accesos` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `fecha_acceso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `direccion_ip` varchar(45) NOT NULL,
  `dispositivo` varchar(150) NOT NULL,
  `resultado` enum('exitoso','fallido','bloqueado') NOT NULL,
  `tipo_evento` enum('login','logout','intento_fallido','cambio_password') NOT NULL,
  `revisado` tinyint(1) NOT NULL DEFAULT '0',
  `codigo_evento` varchar(50) NOT NULL,
  PRIMARY KEY (`id_auditoria`),
  UNIQUE KEY `codigo_evento` (`codigo_evento`),
  KEY `fk_auditoria_usuario` (`id_usuario`),
  CONSTRAINT `fk_auditoria_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `chk_codigo_evento` CHECK ((char_length(`codigo_evento`) >= 3))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_accesos`
--

LOCK TABLES `auditoria_accesos` WRITE;
/*!40000 ALTER TABLE `auditoria_accesos` DISABLE KEYS */;
INSERT INTO `auditoria_accesos` VALUES (1,1,'2026-10-12 08:00:00','192.0.2.11','Laptop Windows','exitoso','login',1,'AUD-001'),(2,2,'2026-10-12 09:30:00','192.0.2.12','Samsung Galaxy','exitoso','login',1,'AUD-002'),(3,3,'2026-10-13 07:45:00','192.0.2.13','iPhone','exitoso','login',0,'AUD-003'),(4,4,'2026-10-13 10:15:00','192.0.2.14','Laptop HP','exitoso','login',1,'AUD-004'),(5,5,'2026-10-14 08:20:00','192.0.2.15','Tablet Android','exitoso','login',0,'AUD-005'),(6,6,'2026-10-14 11:00:00','192.0.2.16','Computadora Dell','exitoso','login',1,'AUD-006'),(7,7,'2026-10-15 08:55:00','192.0.2.17','Laptop Lenovo','fallido','intento_fallido',1,'AUD-007'),(8,8,'2026-10-15 14:30:00','192.0.2.18','iPad','exitoso','login',0,'AUD-008'),(9,9,'2026-10-16 10:10:00','192.0.2.19','PC Windows','exitoso','logout',1,'AUD-009'),(10,NULL,'2026-10-16 15:05:00','192.0.2.20','Dispositivo desconocido','bloqueado','intento_fallido',0,'AUD-010');
/*!40000 ALTER TABLE `auditoria_accesos` ENABLE KEYS */;
UNLOCK TABLES;

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
  `token_hash` varchar(255) NOT NULL,
  `dispositivo` varchar(150) NOT NULL,
  `estado` enum('activa','expirada','cerrada','revocada') NOT NULL DEFAULT 'activa',
  `activa` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_autenticacion`),
  UNIQUE KEY `token_hash` (`token_hash`),
  KEY `fk_autenticacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_autenticacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `chk_fecha_autenticacion` CHECK ((`fecha_expiracion` > `fecha_inicio`))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autenticaciones`
--

LOCK TABLES `autenticaciones` WRITE;
/*!40000 ALTER TABLE `autenticaciones` DISABLE KEYS */;
INSERT INTO `autenticaciones` VALUES (1,1,'2026-10-12 08:00:00','2026-10-12 10:00:00','hash_demo_sesion_001','Laptop Windows','expirada',0),(2,2,'2026-10-12 09:30:00','2026-10-12 11:30:00','hash_demo_sesion_002','Samsung Galaxy','expirada',0),(3,3,'2026-10-13 07:45:00','2026-10-13 09:45:00','hash_demo_sesion_003','iPhone','cerrada',0),(4,4,'2026-10-13 10:15:00','2026-10-13 12:15:00','hash_demo_sesion_004','Laptop HP','expirada',0),(5,5,'2026-10-14 08:20:00','2026-10-14 10:20:00','hash_demo_sesion_005','Tablet Android','cerrada',0),(6,6,'2026-10-14 11:00:00','2026-10-14 13:00:00','hash_demo_sesion_006','Computadora Dell','expirada',0),(7,7,'2026-10-15 09:00:00','2026-10-15 11:00:00','hash_demo_sesion_007','Laptop Lenovo','revocada',0),(8,8,'2026-10-15 14:30:00','2026-10-15 16:30:00','hash_demo_sesion_008','iPad','expirada',0),(9,9,'2026-10-16 08:10:00','2026-10-16 10:10:00','hash_demo_sesion_009','PC Windows','cerrada',0),(10,10,'2026-10-16 15:00:00','2026-10-16 17:00:00','hash_demo_sesion_010','MacBook','expirada',0);
/*!40000 ALTER TABLE `autenticaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrataciones`
--

DROP TABLE IF EXISTS `contrataciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrataciones` (
  `id_contratacion` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_servicio` int NOT NULL,
  `fecha_contratacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_vencimiento` date NOT NULL,
  `precio_acordado` decimal(10,2) NOT NULL,
  `estado` enum('activa','pendiente','cancelada','vencida') NOT NULL DEFAULT 'pendiente',
  `renovacion_automatica` tinyint(1) NOT NULL DEFAULT '0',
  `codigo_contratacion` varchar(30) NOT NULL,
  PRIMARY KEY (`id_contratacion`),
  UNIQUE KEY `codigo_contratacion` (`codigo_contratacion`),
  KEY `fk_contratacion_usuario` (`id_usuario`),
  KEY `fk_contratacion_servicio` (`id_servicio`),
  CONSTRAINT `fk_contratacion_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  CONSTRAINT `fk_contratacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `chk_precio_acordado` CHECK ((`precio_acordado` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrataciones`
--

LOCK TABLES `contrataciones` WRITE;
/*!40000 ALTER TABLE `contrataciones` DISABLE KEYS */;
INSERT INTO `contrataciones` VALUES (1,1,1,'2026-10-01 09:00:00','2027-10-01',12.00,'activa',1,'CONT-001'),(2,2,2,'2026-10-02 10:30:00','2027-10-02',35.00,'activa',1,'CONT-002'),(3,3,3,'2026-10-03 11:00:00','2027-10-03',45.00,'activa',0,'CONT-003'),(4,4,4,'2026-10-04 08:45:00','2027-10-04',80.00,'activa',0,'CONT-004'),(5,5,5,'2026-10-05 14:00:00','2027-10-05',250.00,'pendiente',0,'CONT-005'),(6,6,6,'2026-10-06 15:20:00','2027-10-06',400.00,'activa',1,'CONT-006'),(7,7,7,'2026-10-07 09:15:00','2027-10-07',25.00,'cancelada',0,'CONT-007'),(8,8,8,'2026-10-08 10:10:00','2027-10-08',30.00,'activa',1,'CONT-008'),(9,9,9,'2026-10-09 13:30:00','2027-10-09',20.00,'activa',1,'CONT-009'),(10,10,10,'2026-10-10 16:00:00','2027-10-10',100.00,'pendiente',0,'CONT-010');
/*!40000 ALTER TABLE `contrataciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_contratacion` int NOT NULL,
  `fecha_pago` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` enum('tarjeta','transferencia','efectivo','yappy','otro') NOT NULL,
  `referencia_pago` varchar(50) NOT NULL,
  `estado` enum('pendiente','aprobado','rechazado','reembolsado') NOT NULL DEFAULT 'pendiente',
  `confirmado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `referencia_pago` (`referencia_pago`),
  KEY `fk_pago_contratacion` (`id_contratacion`),
  CONSTRAINT `fk_pago_contratacion` FOREIGN KEY (`id_contratacion`) REFERENCES `contrataciones` (`id_contratacion`),
  CONSTRAINT `chk_pago_monto` CHECK ((`monto` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,'2026-10-01 09:15:00',12.00,'tarjeta','PAGO-001','aprobado',1),(2,2,'2026-10-02 10:45:00',35.00,'transferencia','PAGO-002','aprobado',1),(3,3,'2026-10-03 11:15:00',45.00,'yappy','PAGO-003','aprobado',1),(4,4,'2026-10-04 09:00:00',80.00,'tarjeta','PAGO-004','aprobado',1),(5,5,'2026-10-05 14:15:00',250.00,'transferencia','PAGO-005','pendiente',0),(6,6,'2026-10-06 15:35:00',400.00,'tarjeta','PAGO-006','aprobado',1),(7,7,'2026-10-07 09:30:00',25.00,'yappy','PAGO-007','reembolsado',0),(8,8,'2026-10-08 10:25:00',30.00,'efectivo','PAGO-008','aprobado',1),(9,9,'2026-10-09 13:45:00',20.00,'transferencia','PAGO-009','aprobado',1),(10,10,'2026-10-10 16:15:00',100.00,'tarjeta','PAGO-010','pendiente',0);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria` enum('hosting','seguridad','desarrollo','soporte','otros') NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `disponible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `nombre_servicio` (`nombre_servicio`),
  CONSTRAINT `chk_servicios_precio` CHECK ((`precio` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Hosting Basico','Alojamiento web para sitios pequenos',12.00,'hosting','activo','2026-10-22 16:06:19',1),(2,'Hosting Empresarial','Alojamiento web para empresas',35.00,'hosting','activo','2026-10-22 16:06:19',1),(3,'Seguridad Web','Proteccion y monitoreo de sitios web',45.00,'seguridad','activo','2026-10-22 16:06:19',1),(4,'Auditoria Digital','Evaluacion de vulnerabilidades del sistema',80.00,'seguridad','activo','2026-10-22 16:06:19',1),(5,'Desarrollo Web','Creacion de paginas web empresariales',250.00,'desarrollo','activo','2026-10-22 16:06:19',1),(6,'Tienda Virtual','Desarrollo de plataformas de comercio electronico',400.00,'desarrollo','activo','2026-10-22 16:06:19',1),(7,'Soporte Tecnico','Asistencia para resolver problemas informaticos',25.00,'soporte','activo','2026-10-22 16:06:19',1),(8,'Mantenimiento Web','Actualizacion y mantenimiento de paginas web',30.00,'soporte','activo','2026-10-22 16:06:19',1),(9,'Respaldo en la Nube','Almacenamiento y respaldo de archivos',20.00,'otros','activo','2026-10-22 16:06:19',1),(10,'Consultoria Tecnologica','Asesoria para mejorar procesos digitales',100.00,'otros','inactivo','2026-10-22 16:06:19',0);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `estado` enum('activo','inactivo','suspendido') NOT NULL DEFAULT 'activo',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `verificado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Carlos','Mendoza','carlos.mendoza@example.com','6123-4501','activo','2026-10-22 15:59:01',1),(2,'Maria','Gonzalez','maria.gonzalez@example.com','6123-4502','activo','2026-10-22 15:59:01',1),(3,'Jose','Rodriguez','jose.rodriguez@example.com','6123-4503','activo','2026-10-22 15:59:01',0),(4,'Ana','Martinez','ana.martinez@example.com','6123-4504','activo','2026-10-22 15:59:01',1),(5,'Luis','Fernandez','luis.fernandez@example.com','6123-4505','inactivo','2026-10-22 15:59:01',0),(6,'Sofia','Ramirez','sofia.ramirez@example.com','6123-4506','activo','2026-10-22 15:59:01',1),(7,'Pedro','Castillo','pedro.castillo@example.com','6123-4507','suspendido','2026-10-22 15:59:01',0),(8,'Laura','Morales','laura.morales@example.com','6123-4508','activo','2026-10-22 15:59:01',1),(9,'Daniel','Herrera','daniel.herrera@example.com','6123-4509','activo','2026-10-22 15:59:01',1),(10,'Valeria','Torres','valeria.torres@example.com','6123-4510','activo','2026-10-22 15:59:01',0),(11,'Andres','Vargas','andres.vargas11@example.com','6987-4562','inactivo','2026-10-22 16:33:18',0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_auditoria`
--

DROP TABLE IF EXISTS `vista_auditoria`;
/*!50001 DROP VIEW IF EXISTS `vista_auditoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_auditoria` AS SELECT 
 1 AS `id_auditoria`,
 1 AS `codigo_evento`,
 1 AS `fecha_acceso`,
 1 AS `usuario`,
 1 AS `direccion_ip`,
 1 AS `dispositivo`,
 1 AS `tipo_evento`,
 1 AS `resultado`,
 1 AS `revisado`,
 1 AS `estado_usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_negocio`
--

DROP TABLE IF EXISTS `vista_negocio`;
/*!50001 DROP VIEW IF EXISTS `vista_negocio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_negocio` AS SELECT 
 1 AS `id_usuario`,
 1 AS `cliente`,
 1 AS `servicio`,
 1 AS `codigo_contratacion`,
 1 AS `precio_acordado`,
 1 AS `monto_pagado`,
 1 AS `metodo_pago`,
 1 AS `estado_pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_seguridad`
--

DROP TABLE IF EXISTS `vista_seguridad`;
/*!50001 DROP VIEW IF EXISTS `vista_seguridad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_seguridad` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `correo`,
 1 AS `estado`,
 1 AS `verificado`,
 1 AS `fecha_registro`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_auditoria`
--

/*!50001 DROP VIEW IF EXISTS `vista_auditoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`estudiante`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_auditoria` AS select `a`.`id_auditoria` AS `id_auditoria`,`a`.`codigo_evento` AS `codigo_evento`,`a`.`fecha_acceso` AS `fecha_acceso`,coalesce(concat(`u`.`nombre`,' ',`u`.`apellido`),'Usuario no identificado') AS `usuario`,`a`.`direccion_ip` AS `direccion_ip`,`a`.`dispositivo` AS `dispositivo`,`a`.`tipo_evento` AS `tipo_evento`,`a`.`resultado` AS `resultado`,`a`.`revisado` AS `revisado`,coalesce(`u`.`estado`,'no identificado') AS `estado_usuario` from (`auditoria_accesos` `a` left join `usuarios` `u` on((`a`.`id_usuario` = `u`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_negocio`
--

/*!50001 DROP VIEW IF EXISTS `vista_negocio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`estudiante`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_negocio` AS select `u`.`id_usuario` AS `id_usuario`,concat(`u`.`nombre`,' ',`u`.`apellido`) AS `cliente`,`s`.`nombre_servicio` AS `servicio`,`c`.`codigo_contratacion` AS `codigo_contratacion`,`c`.`precio_acordado` AS `precio_acordado`,`p`.`monto` AS `monto_pagado`,`p`.`metodo_pago` AS `metodo_pago`,`p`.`estado` AS `estado_pago` from (((`usuarios` `u` join `contrataciones` `c` on((`u`.`id_usuario` = `c`.`id_usuario`))) join `servicios` `s` on((`c`.`id_servicio` = `s`.`id_servicio`))) left join `pagos` `p` on((`c`.`id_contratacion` = `p`.`id_contratacion`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_seguridad`
--

/*!50001 DROP VIEW IF EXISTS `vista_seguridad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`estudiante`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_seguridad` AS select `usuarios`.`id_usuario` AS `id_usuario`,`usuarios`.`nombre` AS `nombre`,`usuarios`.`apellido` AS `apellido`,`usuarios`.`correo` AS `correo`,`usuarios`.`estado` AS `estado`,`usuarios`.`verificado` AS `verificado`,`usuarios`.`fecha_registro` AS `fecha_registro` from `usuarios` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-22 17:35:13
