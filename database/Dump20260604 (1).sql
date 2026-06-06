-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: control_escolar
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `matricula` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `semestre` int DEFAULT NULL,
  `id_carrera` int DEFAULT NULL,
  PRIMARY KEY (`id_alumno`),
  UNIQUE KEY `matricula` (`matricula`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'2024001','Carlos','García','López','2004-05-10',4,1),(2,'2024002','María','Sánchez','Ruiz','2003-09-12',5,1),(3,'2024003','Luis','Martínez','Hernández','2004-02-15',3,1),(4,'2024004','Andrea','Flores','Castro','2003-08-21',5,1),(5,'2024005','Jorge','Ruiz','Mendoza','2004-11-12',2,2),(6,'2024006','Fernanda','López','Silva','2003-04-08',6,2),(7,'2024007','Ricardo','Gómez','Pérez','2002-10-20',8,3),(8,'2024008','Valeria','Jiménez','Santos','2004-01-17',4,4),(9,'2024009','Eduardo','Torres','Luna','2003-07-28',5,5),(10,'2024010','Sofía','Vega','Morales','2005-03-10',2,6),(11,'2024011','Alejandro','Castro','Ríos','2002-09-09',8,1),(12,'2024012','Paola','Reyes','Navarro','2004-12-22',3,3);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones` (
  `id_calificacion` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int DEFAULT NULL,
  `id_materia` int DEFAULT NULL,
  `calificacion` decimal(4,2) DEFAULT NULL,
  `periodo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_calificacion`),
  KEY `id_alumno` (`id_alumno`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`),
  CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` VALUES (1,1,1,95.00,'2025-1'),(2,1,2,88.00,'2025-1'),(3,2,1,92.00,'2025-1'),(4,1,1,95.00,'2025-1'),(5,1,2,88.00,'2025-1'),(6,1,3,91.00,'2025-1'),(7,2,1,92.00,'2025-1'),(8,2,2,90.00,'2025-1'),(9,2,4,87.00,'2025-1'),(10,3,1,85.00,'2025-1'),(11,3,3,89.00,'2025-1'),(12,3,8,90.00,'2025-1'),(13,4,2,96.00,'2025-1'),(14,4,7,94.00,'2025-1'),(15,4,8,98.00,'2025-1'),(16,5,4,78.00,'2025-1'),(17,5,5,82.00,'2025-1'),(18,5,6,80.00,'2025-1'),(19,6,1,88.00,'2025-1'),(20,6,3,91.00,'2025-1'),(21,6,7,85.00,'2025-1'),(22,7,4,75.00,'2025-1'),(23,7,9,81.00,'2025-1'),(24,8,5,95.00,'2025-1'),(25,8,6,93.00,'2025-1'),(26,9,6,86.00,'2025-1'),(27,9,9,84.00,'2025-1'),(28,10,3,79.00,'2025-1'),(29,10,8,83.00,'2025-1'),(30,11,1,97.00,'2025-1'),(31,11,7,95.00,'2025-1'),(32,11,8,96.00,'2025-1'),(33,12,2,89.00,'2025-1'),(34,12,4,91.00,'2025-1');
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `id_carrera` int NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(100) NOT NULL,
  `duracion_semestres` int NOT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Ingeniería en Sistemas',9),(2,'Contaduría',8),(3,'Administración',8),(4,'Ingeniería Industrial',9),(5,'Ingeniería Mecatrónica',9),(6,'Ingeniería Civil',10),(7,'Derecho',10),(8,'Mercadotecnia',8);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maestros`
--

DROP TABLE IF EXISTS `maestros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maestros` (
  `id_maestro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_maestro`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maestros`
--

LOCK TABLES `maestros` WRITE;
/*!40000 ALTER TABLE `maestros` DISABLE KEYS */;
INSERT INTO `maestros` VALUES (1,'Juan','Pérez',NULL,'Bases de Datos','juan@escuela.com'),(2,'Ana','López',NULL,'Programación','ana@escuela.com'),(3,'Roberto','Martínez',NULL,'Redes','roberto@escuela.com'),(4,'Laura','Ramírez',NULL,'Matemáticas','laura@escuela.com'),(5,'Miguel','Castillo',NULL,'Programación','miguel@escuela.com'),(6,'Patricia','Morales',NULL,'Contabilidad','patricia@escuela.com'),(7,'Fernando','Soto',NULL,'Derecho Civil','fernando@escuela.com'),(8,'Daniela','Navarro',NULL,'Mercadotecnia','daniela@escuela.com');
/*!40000 ALTER TABLE `maestros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(100) NOT NULL,
  `creditos` int DEFAULT NULL,
  `id_maestro` int DEFAULT NULL,
  PRIMARY KEY (`id_materia`),
  KEY `id_maestro` (`id_maestro`),
  CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`id_maestro`) REFERENCES `maestros` (`id_maestro`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,'Base de Datos',5,1),(2,'Programación Web',5,2),(3,'Redes de Computadoras',5,3),(4,'Cálculo Integral',6,4),(5,'Programación Orientada a Objetos',5,5),(6,'Contabilidad Financiera',5,6),(7,'Derecho Mercantil',5,7),(8,'Marketing Digital',5,8),(9,'Estructura de Datos',5,5),(10,'Probabilidad y Estadística',5,4),(11,'Administración de Proyectos',4,8);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `rol` enum('Administrador','Maestro','Alumno') DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','admin123','Administrador'),(2,'juanp','juan123','Maestro'),(3,'analopez','ana123','Maestro'),(4,'carlosg','carlos123','Alumno'),(5,'marias','maria123','Alumno'),(6,'luism','luis123','Alumno'),(7,'andreaf','andrea123','Alumno'),(8,'fernandal','fer123','Alumno');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_alumnos_carrera`
--

DROP TABLE IF EXISTS `vw_alumnos_carrera`;
/*!50001 DROP VIEW IF EXISTS `vw_alumnos_carrera`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_alumnos_carrera` AS SELECT 
 1 AS `id_alumno`,
 1 AS `matricula`,
 1 AS `nombre`,
 1 AS `apellido_paterno`,
 1 AS `nombre_carrera`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_calificaciones`
--

DROP TABLE IF EXISTS `vw_calificaciones`;
/*!50001 DROP VIEW IF EXISTS `vw_calificaciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_calificaciones` AS SELECT 
 1 AS `matricula`,
 1 AS `nombre`,
 1 AS `nombre_materia`,
 1 AS `calificacion`,
 1 AS `periodo`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'control_escolar'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_agregar_alumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_alumno`(
    IN p_matricula VARCHAR(20),
    IN p_nombre VARCHAR(50),
    IN p_apellido_p VARCHAR(50),
    IN p_apellido_m VARCHAR(50),
    IN p_semestre INT,
    IN p_carrera INT
)
BEGIN

INSERT INTO alumnos(
matricula,
nombre,
apellido_paterno,
apellido_materno,
semestre,
id_carrera
)
VALUES(
p_matricula,
p_nombre,
p_apellido_p,
p_apellido_m,
p_semestre,
p_carrera
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_consultar_calificaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_calificaciones`(
    IN p_alumno INT
)
BEGIN

SELECT
a.nombre,
m.nombre_materia,
c.calificacion
FROM calificaciones c
INNER JOIN alumnos a
ON c.id_alumno=a.id_alumno
INNER JOIN materias m
ON c.id_materia=m.id_materia
WHERE a.id_alumno=p_alumno;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_estatus_alumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_estatus_alumno`(
    IN p_alumno INT
)
BEGIN

DECLARE promedio DECIMAL(5,2);

SELECT AVG(calificacion)
INTO promedio
FROM calificaciones
WHERE id_alumno = p_alumno;

IF promedio >= 70 THEN
    SELECT 'APROBADO' AS estatus;
ELSE
    SELECT 'REPROBADO' AS estatus;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_promedio_alumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_promedio_alumno`(
    IN p_alumno INT
)
BEGIN

SELECT
AVG(calificacion) AS promedio
FROM calificaciones
WHERE id_alumno = p_alumno;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_alumnos_carrera`
--

/*!50001 DROP VIEW IF EXISTS `vw_alumnos_carrera`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_alumnos_carrera` AS select `a`.`id_alumno` AS `id_alumno`,`a`.`matricula` AS `matricula`,`a`.`nombre` AS `nombre`,`a`.`apellido_paterno` AS `apellido_paterno`,`c`.`nombre_carrera` AS `nombre_carrera` from (`alumnos` `a` join `carrera` `c` on((`a`.`id_carrera` = `c`.`id_carrera`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_calificaciones`
--

/*!50001 DROP VIEW IF EXISTS `vw_calificaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_calificaciones` AS select `a`.`matricula` AS `matricula`,`a`.`nombre` AS `nombre`,`m`.`nombre_materia` AS `nombre_materia`,`c`.`calificacion` AS `calificacion`,`c`.`periodo` AS `periodo` from ((`calificaciones` `c` join `alumnos` `a` on((`c`.`id_alumno` = `a`.`id_alumno`))) join `materias` `m` on((`c`.`id_materia` = `m`.`id_materia`))) */;
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

-- Dump completed on 2026-06-04 10:42:37
