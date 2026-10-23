-- PARCIAL_01 - PARTE II: SERVICIOS DIGITALES
-- Script de documentación y verificación de la base de datos existente.

USE servicios_digitales;

-- 1. Comprobar las seis tablas.
SHOW TABLES;

-- 2. Consultar la estructura de las tablas diseñadas.
DESCRIBE usuarios;
DESCRIBE servicios;
DESCRIBE contrataciones;
DESCRIBE pagos;
DESCRIBE autenticaciones;
DESCRIBE auditoria_accesos;

-- 3. Revision de la estructura guardada en MySQL.
SHOW CREATE TABLE usuarios;
SHOW CREATE TABLE servicios;
SHOW CREATE TABLE contrataciones;
SHOW CREATE TABLE pagos;
SHOW CREATE TABLE autenticaciones;
SHOW CREATE TABLE auditoria_accesos;

-- 4. Verificar los registros guardados
SELECT 'usuarios' AS tabla, COUNT(*) AS total FROM usuarios
UNION ALL SELECT 'servicios', COUNT(*) FROM servicios
UNION ALL SELECT 'contrataciones', COUNT(*) FROM contrataciones
UNION ALL SELECT 'pagos', COUNT(*) FROM pagos
UNION ALL SELECT 'autenticaciones', COUNT(*) FROM autenticaciones
UNION ALL SELECT 'auditoria_accesos', COUNT(*) FROM auditoria_accesos;

-- 5. consultar las vistas implementadas en el parcial.
SELECT * FROM vista_negocio;
SELECT * FROM vista_seguridad;
SELECT * FROM vista_auditoria;

-- 6. SQL real de definición de cada vista.
SHOW CREATE VIEW vista_negocio;
SHOW CREATE VIEW vista_seguridad;
SHOW CREATE VIEW vista_auditoria;

-- 7. Consultar las claves foráneas.
SELECT TABLE_NAME AS tabla, COLUMN_NAME AS campo,
       REFERENCED_TABLE_NAME AS tabla_relacionada,
       REFERENCED_COLUMN_NAME AS campo_relacionado
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'servicios_digitales'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, COLUMN_NAME;

-- 8. CRUD desarrollado en el parcial (evidencia en documento).
-- INSERT: se registró un usuario de prueba en usuarios.
-- SELECT: se consultaron usuarios activos y verificados.
-- UPDATE: se actualizó el teléfono y el campo verificado del usuario de prueba.
-- DELETE lógico: se cambió estado a 'inactivo' (no se eliminó la fila).
-- Evitamos inventar valores o volver a ejecutar los cambios en la base real.