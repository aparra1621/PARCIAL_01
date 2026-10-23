-- PARCIAL_01 - PARTE III: PIXEL-SECURITY-360
-- Reconstrucción del esquema y de los 125 registros de demostración.
-- Contiene solo datos inventados, ningun dato es real

CREATE DATABASE IF NOT EXISTS pixel_security_360
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE pixel_security_360;

CREATE TABLE IF NOT EXISTS usuarios (
 id_usuario INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 apellido VARCHAR(100) NOT NULL,
 correo VARCHAR(150) NOT NULL UNIQUE,
 telefono VARCHAR(20),
 tipo_usuario ENUM('cliente','administrador','analista','vendedor','ejecutivo','otros') NOT NULL DEFAULT 'cliente',
 estado ENUM('activo','inactivo','suspendido') NOT NULL DEFAULT 'activo',
 fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 verificado BOOLEAN NOT NULL DEFAULT FALSE,
 nombre_usuario VARCHAR(80) UNIQUE,
 contrasena_hash VARCHAR(255),
 token_hash VARCHAR(255),
 ciudad VARCHAR(100),
 sexo ENUM('masculino','femenino','otro','prefiere_no_decir'),
 estado_civil ENUM('soltero','casado','divorciado','viudo','union_libre'),
 tipo_empresa ENUM('publica','privada'),
 direccion VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS tipos_pruebas (
 id_tipo_prueba INT AUTO_INCREMENT PRIMARY KEY,
 nombre_prueba VARCHAR(120) NOT NULL UNIQUE,
 descripcion TEXT NOT NULL,
 categoria ENUM('redes','web','aplicaciones','infraestructura','otros') NOT NULL,
 nivel_riesgo ENUM('bajo','medio','alto','critico') NOT NULL,
 costo_base DECIMAL(10,2) NOT NULL,
 duracion_estimada_horas INT NOT NULL,
 disponible BOOLEAN NOT NULL DEFAULT TRUE,
 fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 referencia VARCHAR(30) NOT NULL UNIQUE,
 estado ENUM('activo','desactivado') NOT NULL DEFAULT 'activo',
 CONSTRAINT chk_costo_prueba CHECK (costo_base >= 0),
 CONSTRAINT chk_duracion_prueba CHECK (duracion_estimada_horas > 0)
);
CREATE TABLE IF NOT EXISTS reportes (
 id_reporte INT AUTO_INCREMENT PRIMARY KEY,
 id_usuario INT NOT NULL,
 id_tipo_prueba INT NOT NULL,
 titulo VARCHAR(150) NOT NULL,
 descripcion TEXT NOT NULL,
 fecha_reporte DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 nivel_riesgo ENUM('bajo','medio','alto','critico') NOT NULL,
 estado ENUM('pendiente','en_proceso','finalizado','entregado') NOT NULL DEFAULT 'pendiente',
 resultado TEXT,
 archivo_reporte VARCHAR(255),
 revisado BOOLEAN NOT NULL DEFAULT FALSE,
 CONSTRAINT fk_reporte_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
 CONSTRAINT fk_reporte_tipo_prueba FOREIGN KEY (id_tipo_prueba) REFERENCES tipos_pruebas(id_tipo_prueba)
);
CREATE TABLE IF NOT EXISTS pagos (
 id_pago INT AUTO_INCREMENT PRIMARY KEY,
 id_usuario INT NOT NULL,
 id_reporte INT NOT NULL,
 fecha_pago DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 monto DECIMAL(10,2) NOT NULL,
 metodo_pago ENUM('tarjeta','transferencia','yappy','efectivo','otro') NOT NULL,
 referencia_pago VARCHAR(60) NOT NULL UNIQUE,
 estado ENUM('pendiente','aprobado','rechazado','reembolsado') NOT NULL DEFAULT 'pendiente',
 confirmado BOOLEAN NOT NULL DEFAULT FALSE,
 CONSTRAINT chk_pago_pixel_monto CHECK (monto > 0),
 CONSTRAINT fk_pixel_pago_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
 CONSTRAINT fk_pixel_pago_reporte FOREIGN KEY (id_reporte) REFERENCES reportes(id_reporte)
);
CREATE TABLE IF NOT EXISTS autenticaciones (
 id_autenticacion INT AUTO_INCREMENT PRIMARY KEY,
 id_usuario INT NOT NULL,
 fecha_inicio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 fecha_expiracion DATETIME NOT NULL,
 token_hash VARCHAR(255) NOT NULL UNIQUE,
 dispositivo VARCHAR(150) NOT NULL,
 direccion_ip VARCHAR(45) NOT NULL,
 estado ENUM('activa','expirada','cerrada','revocada') NOT NULL DEFAULT 'activa',
 activa BOOLEAN NOT NULL DEFAULT TRUE,
 CONSTRAINT chk_pixel_fecha_autenticacion CHECK (fecha_expiracion > fecha_inicio),
 CONSTRAINT fk_pixel_autenticacion_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- 25 usuarios ficticios. Para esta versión se crean nombres sintéticos.
INSERT INTO usuarios (nombre,apellido,correo,telefono,tipo_usuario,estado,verificado) VALUES
 ('Usuario01','Demo01','usuario01@example.com','6123-5001', 'cliente', 'activo', 1),
 ('Usuario02','Demo02','usuario02@example.com','6123-5002', 'cliente', 'activo', 1),
 ('Usuario03','Demo03','usuario03@example.com','6123-5003', 'cliente', 'activo', 1),
 ('Usuario04','Demo04','usuario04@example.com','6123-5004', 'cliente', 'activo', 0),
 ('Usuario05','Demo05','usuario05@example.com','6123-5005', 'cliente', 'activo', 1),
 ('Usuario06','Demo06','usuario06@example.com','6123-5006', 'cliente', 'activo', 1),
 ('Usuario07','Demo07','usuario07@example.com','6123-5007', 'cliente', 'activo', 1),
 ('Usuario08','Demo08','usuario08@example.com','6123-5008', 'cliente', 'activo', 0),
 ('Usuario09','Demo09','usuario09@example.com','6123-5009', 'cliente', 'activo', 1),
 ('Usuario10','Demo10','usuario10@example.com','6123-5010', 'cliente', 'activo', 1),
 ('Usuario11','Demo11','usuario11@example.com','6123-5011', 'cliente', 'activo', 1),
 ('Usuario12','Demo12','usuario12@example.com','6123-5012', 'cliente', 'activo', 0),
 ('Usuario13','Demo13','usuario13@example.com','6123-5013', 'cliente', 'activo', 1),
 ('Usuario14','Demo14','usuario14@example.com','6123-5014', 'cliente', 'activo', 1),
 ('Usuario15','Demo15','usuario15@example.com','6123-5015', 'cliente', 'suspendido', 1),
 ('Usuario16','Demo16','usuario16@example.com','6123-5016', 'cliente', 'activo', 0),
 ('Usuario17','Demo17','usuario17@example.com','6123-5017', 'cliente', 'activo', 1),
 ('Usuario18','Demo18','usuario18@example.com','6123-5018', 'cliente', 'inactivo', 1),
 ('Usuario19','Demo19','usuario19@example.com','6123-5019', 'cliente', 'activo', 1),
 ('Usuario20','Demo20','usuario20@example.com','6123-5020', 'cliente', 'activo', 0),
 ('Usuario21','Demo21','usuario21@example.com','6123-5021', 'administrador', 'activo', 1),
 ('Usuario22','Demo22','usuario22@example.com','6123-5022', 'administrador', 'activo', 1),
 ('Usuario23','Demo23','usuario23@example.com','6123-5023', 'analista', 'activo', 1),
 ('Usuario24','Demo24','usuario24@example.com','6123-5024', 'analista', 'activo', 0),
 ('Usuario25','Demo25','usuario25@example.com','6123-5025', 'analista', 'activo', 1);

-- Completar los ocho campos agregados con ALTER TABLE en el trabajo original.
UPDATE usuarios SET
 nombre_usuario = CONCAT('usuario_', LPAD(id_usuario, 3, '0')),
 contrasena_hash = SHA2(CONCAT('clave_demo_', id_usuario),256),
 token_hash = SHA2(CONCAT('token_demo_', id_usuario),256),
 ciudad = CASE (id_usuario % 5) WHEN 0 THEN 'Ciudad de Panama' WHEN 1 THEN 'La Chorrera' WHEN 2 THEN 'David' WHEN 3 THEN 'Santiago' ELSE 'Chitre' END,
 sexo = CASE (id_usuario % 3) WHEN 0 THEN 'masculino' WHEN 1 THEN 'femenino' ELSE 'prefiere_no_decir' END,
 estado_civil = CASE (id_usuario % 4) WHEN 0 THEN 'casado' WHEN 1 THEN 'soltero' WHEN 2 THEN 'union_libre' ELSE 'divorciado' END,
 tipo_empresa = CASE (id_usuario % 2) WHEN 0 THEN 'publica' ELSE 'privada' END,
 direccion = CONCAT('Direccion ficticia ', id_usuario, ', Panama');

INSERT INTO tipos_pruebas (nombre_prueba,descripcion,categoria,nivel_riesgo,costo_base,duracion_estimada_horas,disponible,referencia,estado) VALUES
 ('Analisis de vulnerabilidades web','Identifica fallas de seguridad en sitios web','web','alto',150.00,6,TRUE,'PT-001','activo'),
 ('Pentesting de red interna','Evalua la seguridad de una red corporativa','redes','critico',450.00,16,TRUE,'PT-002','activo'),
 ('Auditoria de firewall','Revisa reglas y configuraciones del firewall','redes','alto',180.00,8,TRUE,'PT-003','activo'),
 ('Seguridad de aplicaciones moviles','Evalua vulnerabilidades en aplicaciones moviles','aplicaciones','alto',300.00,12,TRUE,'PT-004','activo'),
 ('Analisis de servidores Linux','Revisa configuraciones y servicios de servidores Linux','infraestructura','alto',220.00,10,TRUE,'PT-005','activo'),
 ('Analisis de servidores Windows','Evalua seguridad en servidores Windows','infraestructura','alto',220.00,10,TRUE,'PT-006','activo'),
 ('Revision de certificados SSL','Comprueba certificados y configuraciones TLS','web','medio',65.00,3,TRUE,'PT-007','activo'),
 ('Auditoria de bases de datos','Evalua permisos y configuraciones de bases de datos','infraestructura','critico',280.00,12,TRUE,'PT-008','activo'),
 ('Pruebas de autenticacion','Revisa controles de inicio de sesion','aplicaciones','alto',160.00,7,TRUE,'PT-009','activo'),
 ('Evaluacion de API REST','Identifica vulnerabilidades en interfaces API','aplicaciones','alto',240.00,10,TRUE,'PT-010','activo'),
 ('Escaneo de puertos','Identifica puertos y servicios expuestos','redes','medio',70.00,3,TRUE,'PT-011','activo'),
 ('Analisis de malware','Examina archivos y sistemas sospechosos','otros','critico',200.00,8,TRUE,'PT-012','activo'),
 ('Revision de copias de seguridad','Comprueba configuraciones de respaldo','infraestructura','medio',110.00,5,TRUE,'PT-013','activo'),
 ('Auditoria de correo corporativo','Evalua configuraciones de seguridad del correo','otros','alto',140.00,6,TRUE,'PT-014','activo'),
 ('Evaluacion de red WiFi','Revisa seguridad de redes inalambricas','redes','alto',190.00,8,TRUE,'PT-015','activo'),
 ('Revision de permisos','Analiza privilegios y controles de acceso','infraestructura','medio',125.00,5,TRUE,'PT-016','activo'),
 ('Pruebas de inyeccion SQL','Evalua riesgos de inyeccion en consultas','web','critico',210.00,9,TRUE,'PT-017','activo'),
 ('Analisis de XSS','Busca vulnerabilidades de scripts en sitios web','web','alto',175.00,7,TRUE,'PT-018','activo'),
 ('Evaluacion de seguridad DNS','Revisa configuraciones y riesgos del servicio DNS','redes','medio',115.00,5,TRUE,'PT-019','activo'),
 ('Auditoria de servicios cloud','Evalua configuraciones de recursos en la nube','infraestructura','alto',320.00,14,TRUE,'PT-020','activo'),
 ('Revision de registros de seguridad','Analiza eventos y registros de sistemas','otros','medio',120.00,6,TRUE,'PT-021','activo'),
 ('Evaluacion de controles MFA','Revisa mecanismos de doble autenticacion','aplicaciones','medio',130.00,5,TRUE,'PT-022','activo'),
 ('Analisis de configuracion HTTPS','Comprueba cabeceras y configuraciones HTTPS','web','bajo',80.00,4,TRUE,'PT-023','activo'),
 ('Auditoria de contenedores Docker','Evalua configuraciones de seguridad de contenedores','infraestructura','alto',260.00,11,TRUE,'PT-024','activo'),
 ('Evaluacion de sistemas heredados','Revisa riesgos asociados a sistemas antiguos','otros','critico',350.00,15,FALSE,'PT-025','desactivado');

INSERT INTO reportes (id_usuario,id_tipo_prueba,titulo,descripcion,nivel_riesgo,estado,resultado,archivo_reporte,revisado) VALUES
 (1,1,'Revision de portal web','Evaluacion del portal principal','alto','entregado','Se detectaron configuraciones inseguras','reporte_001.pdf',TRUE),
 (2,2,'Seguridad de red corporativa','Analisis de red interna','critico','finalizado','Se identificaron servicios expuestos','reporte_002.pdf',TRUE),
 (3,3,'Revision de firewall','Evaluacion de reglas de acceso','alto','entregado','Se recomendaron ajustes de seguridad','reporte_003.pdf',TRUE),
 (4,4,'Seguridad de app movil','Revision de aplicacion Android','medio','finalizado','Se detectaron permisos excesivos','reporte_004.pdf',TRUE),
 (5,5,'Auditoria servidor Linux','Revision de configuraciones del servidor','alto','en_proceso',NULL,NULL,FALSE),
 (6,6,'Auditoria servidor Windows','Revision de servicios de Windows','medio','entregado','Se identificaron actualizaciones pendientes','reporte_006.pdf',TRUE),
 (7,7,'Revision de certificados','Verificacion de certificados TLS','bajo','finalizado','Certificados validos','reporte_007.pdf',TRUE),
 (8,8,'Seguridad de base de datos','Evaluacion de permisos SQL','critico','entregado','Se detectaron privilegios excesivos','reporte_008.pdf',TRUE),
 (9,9,'Prueba de autenticacion','Revision del sistema de acceso','alto','finalizado','Se recomendaron controles adicionales','reporte_009.pdf',TRUE),
 (10,10,'Evaluacion de API','Analisis de servicios REST','alto','entregado','Se identificaron validaciones insuficientes','reporte_010.pdf',TRUE),
 (11,11,'Escaneo de red','Identificacion de puertos abiertos','medio','finalizado','Se encontraron puertos innecesarios','reporte_011.pdf',TRUE),
 (12,12,'Analisis de archivos','Revision de archivos sospechosos','alto','en_proceso',NULL,NULL,FALSE),
 (13,13,'Evaluacion de respaldos','Comprobacion de copias de seguridad','medio','entregado','Se recomendaron respaldos adicionales','reporte_013.pdf',TRUE),
 (14,14,'Seguridad de correo','Revision de configuracion del correo','alto','finalizado','Se recomendaron mejoras de autenticacion','reporte_014.pdf',TRUE),
 (15,15,'Evaluacion de WiFi','Analisis de seguridad inalambrica','alto','pendiente',NULL,NULL,FALSE),
 (16,16,'Auditoria de permisos','Revision de privilegios internos','medio','entregado','Se identificaron permisos innecesarios','reporte_016.pdf',TRUE),
 (17,17,'Revision de consultas SQL','Evaluacion de entradas de usuario','critico','finalizado','Se recomendaron consultas parametrizadas','reporte_017.pdf',TRUE),
 (18,18,'Evaluacion de scripts web','Analisis de contenido web','alto','entregado','Se detectaron validaciones deficientes','reporte_018.pdf',TRUE),
 (19,19,'Revision DNS','Evaluacion de registros DNS','medio','finalizado','Se recomendaron ajustes en los registros','reporte_019.pdf',TRUE),
 (20,20,'Auditoria de nube','Analisis de servicios cloud','alto','entregado','Se detectaron permisos excesivos','reporte_020.pdf',TRUE),
 (1,21,'Revision de logs','Analisis de eventos de seguridad','medio','finalizado','Se identificaron eventos para seguimiento','reporte_021.pdf',TRUE),
 (2,22,'Verificacion MFA','Evaluacion de autenticacion multifactor','bajo','entregado','Los controles revisados funcionan','reporte_022.pdf',TRUE),
 (3,23,'Revision HTTPS','Comprobacion de configuracion HTTPS','bajo','finalizado','Se recomendaron cabeceras adicionales','reporte_023.pdf',TRUE),
 (4,24,'Seguridad de Docker','Revision de configuraciones de contenedores','alto','entregado','Se recomendaron mejoras de aislamiento','reporte_024.pdf',TRUE),
 (5,25,'Evaluacion de sistema antiguo','Analisis de sistema heredado','critico','pendiente',NULL,NULL,FALSE);

INSERT INTO pagos (id_usuario,id_reporte,fecha_pago,monto,metodo_pago,referencia_pago,estado,confirmado) VALUES
 (1,1,'2026-10-12 09:00:00',150.00,'tarjeta','PIX-PAG-001','aprobado',TRUE),
 (2,2,'2026-10-12 10:00:00',450.00,'transferencia','PIX-PAG-002','aprobado',TRUE),
 (3,3,'2026-10-12 11:00:00',180.00,'yappy','PIX-PAG-003','aprobado',TRUE),
 (4,4,'2026-10-12 12:00:00',300.00,'tarjeta','PIX-PAG-004','aprobado',TRUE),
 (5,5,'2026-10-12 13:00:00',220.00,'transferencia','PIX-PAG-005','pendiente',FALSE),
 (6,6,'2026-10-12 14:00:00',220.00,'tarjeta','PIX-PAG-006','aprobado',TRUE),
 (7,7,'2026-10-12 15:00:00',65.00,'yappy','PIX-PAG-007','aprobado',TRUE),
 (8,8,'2026-10-12 16:00:00',280.00,'transferencia','PIX-PAG-008','aprobado',TRUE),
 (9,9,'2026-10-12 17:00:00',160.00,'tarjeta','PIX-PAG-009','aprobado',TRUE),
 (10,10,'2026-10-12 18:00:00',240.00,'yappy','PIX-PAG-010','aprobado',TRUE),
 (11,11,'2026-10-12 19:00:00',70.00,'efectivo','PIX-PAG-011','aprobado',TRUE),
 (12,12,'2026-10-12 20:00:00',200.00,'transferencia','PIX-PAG-012','pendiente',FALSE),
 (13,13,'2026-10-12 21:00:00',110.00,'tarjeta','PIX-PAG-013','aprobado',TRUE),
 (14,14,'2026-10-12 22:00:00',140.00,'yappy','PIX-PAG-014','aprobado',TRUE),
 (15,15,'2026-10-12 23:00:00',190.00,'tarjeta','PIX-PAG-015','rechazado',FALSE),
 (16,16,'2026-10-13 00:00:00',125.00,'transferencia','PIX-PAG-016','aprobado',TRUE),
 (17,17,'2026-10-13 01:00:00',210.00,'tarjeta','PIX-PAG-017','aprobado',TRUE),
 (18,18,'2026-10-13 02:00:00',175.00,'yappy','PIX-PAG-018','aprobado',TRUE),
 (19,19,'2026-10-13 03:00:00',115.00,'efectivo','PIX-PAG-019','aprobado',TRUE),
 (20,20,'2026-10-13 04:00:00',320.00,'transferencia','PIX-PAG-020','aprobado',TRUE),
 (1,21,'2026-10-13 05:00:00',120.00,'tarjeta','PIX-PAG-021','aprobado',TRUE),
 (2,22,'2026-10-13 06:00:00',130.00,'yappy','PIX-PAG-022','aprobado',TRUE),
 (3,23,'2026-10-13 07:00:00',80.00,'tarjeta','PIX-PAG-023','aprobado',TRUE),
 (4,24,'2026-10-13 08:00:00',260.00,'transferencia','PIX-PAG-024','aprobado',TRUE),
 (5,25,'2026-10-13 09:00:00',350.00,'tarjeta','PIX-PAG-025','pendiente',FALSE);

INSERT INTO autenticaciones (id_usuario,fecha_inicio,fecha_expiracion,token_hash,dispositivo,direccion_ip,estado,activa) VALUES
 (1,'2026-10-12 08:00:00','2026-10-12 10:00:00','pixel_demo_hash_001','Laptop Windows','192.0.2.1','expirada',FALSE),
 (2,'2026-10-12 09:00:00','2026-10-12 11:00:00','pixel_demo_hash_002','Samsung Galaxy','192.0.2.2','expirada',FALSE),
 (3,'2026-10-12 10:00:00','2026-10-12 12:00:00','pixel_demo_hash_003','iPhone','192.0.2.3','cerrada',FALSE),
 (4,'2026-10-12 11:00:00','2026-10-12 13:00:00','pixel_demo_hash_004','Laptop HP','192.0.2.4','expirada',FALSE),
 (5,'2026-10-12 12:00:00','2026-10-12 14:00:00','pixel_demo_hash_005','Tablet Android','192.0.2.5','cerrada',FALSE),
 (6,'2026-10-12 13:00:00','2026-10-12 15:00:00','pixel_demo_hash_006','Computadora Dell','192.0.2.6','expirada',FALSE),
 (7,'2026-10-12 14:00:00','2026-10-12 16:00:00','pixel_demo_hash_007','Laptop Lenovo','192.0.2.7','revocada',FALSE),
 (8,'2026-10-12 15:00:00','2026-10-12 17:00:00','pixel_demo_hash_008','iPad','192.0.2.8','expirada',FALSE),
 (9,'2026-10-12 16:00:00','2026-10-12 18:00:00','pixel_demo_hash_009','PC Windows','192.0.2.9','cerrada',FALSE),
 (10,'2026-10-12 17:00:00','2026-10-12 19:00:00','pixel_demo_hash_010','MacBook','192.0.2.10','expirada',FALSE),
 (11,'2026-10-12 18:00:00','2026-10-12 20:00:00','pixel_demo_hash_011','Laptop Acer','192.0.2.11','expirada',FALSE),
 (12,'2026-10-12 19:00:00','2026-10-12 21:00:00','pixel_demo_hash_012','Samsung Tablet','192.0.2.12','cerrada',FALSE),
 (13,'2026-10-12 20:00:00','2026-10-12 22:00:00','pixel_demo_hash_013','Laptop Asus','192.0.2.13','expirada',FALSE),
 (14,'2026-10-12 21:00:00','2026-10-12 23:00:00','pixel_demo_hash_014','iPhone 14','192.0.2.14','expirada',FALSE),
 (15,'2026-10-12 22:00:00','2026-10-13 00:00:00','pixel_demo_hash_015','PC Escritorio','192.0.2.15','revocada',FALSE),
 (16,'2026-10-12 23:00:00','2026-10-13 01:00:00','pixel_demo_hash_016','Laptop HP','192.0.2.16','cerrada',FALSE),
 (17,'2026-10-13 00:00:00','2026-10-13 02:00:00','pixel_demo_hash_017','Samsung Galaxy','192.0.2.17','expirada',FALSE),
 (18,'2026-10-13 01:00:00','2026-10-13 03:00:00','pixel_demo_hash_018','Tablet Android','192.0.2.18','cerrada',FALSE),
 (19,'2026-10-13 02:00:00','2026-10-13 04:00:00','pixel_demo_hash_019','MacBook Pro','192.0.2.19','expirada',FALSE),
 (20,'2026-10-13 03:00:00','2026-10-13 05:00:00','pixel_demo_hash_020','Laptop Lenovo','192.0.2.20','cerrada',FALSE),
 (21,'2026-10-13 04:00:00','2026-10-13 06:00:00','pixel_demo_hash_021','PC Administracion','192.0.2.21','expirada',FALSE),
 (22,'2026-10-13 05:00:00','2026-10-13 07:00:00','pixel_demo_hash_022','Laptop Oficina','192.0.2.22','expirada',FALSE),
 (23,'2026-10-13 06:00:00','2026-10-13 08:00:00','pixel_demo_hash_023','PC Analista','192.0.2.23','cerrada',FALSE),
 (24,'2026-10-13 07:00:00','2026-10-13 09:00:00','pixel_demo_hash_024','Laptop Analista','192.0.2.24','expirada',FALSE),
 (25,'2026-10-13 08:00:00','2026-10-13 10:00:00','pixel_demo_hash_025','PC Seguridad','192.0.2.25','cerrada',FALSE);

-- Verificaciones finales de los cinco módulos (125 registros esperados).
SELECT 'usuarios' AS modulo, COUNT(*) AS registros FROM usuarios
UNION ALL SELECT 'tipos_pruebas', COUNT(*) FROM tipos_pruebas
UNION ALL SELECT 'reportes', COUNT(*) FROM reportes
UNION ALL SELECT 'pagos', COUNT(*) FROM pagos
UNION ALL SELECT 'autenticaciones', COUNT(*) FROM autenticaciones;

-- Relaciones de claves foráneas.
SELECT TABLE_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME,
       REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'pixel_security_360'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, COLUMN_NAME;
