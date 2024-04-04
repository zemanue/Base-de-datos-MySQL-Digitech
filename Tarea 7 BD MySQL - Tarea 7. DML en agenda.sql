--TAREA 7. DML EN AGENDA. 

--MODELO FÍSICO
--CÓDIGO EN MYSQL:


CREATE DATABASE Pruebas;

USE Pruebas;

-- A) Crear la tabla agenda
CREATE TABLE Agenda (
    Apellido  VARCHAR(30),
    Nombre    VARCHAR(20),
    Domicilio VARCHAR(30),
    Telefono  INT(9),
    Prefijo   CHAR(5) DEFAULT '+0034'
);

-- B) Insertar los registros
INSERT INTO Agenda (Apellido, Nombre, Domicilio, Telefono) VALUES 
    ('ALVAREZ', 'ALBERTO', 'COLON 123', 423456798),
    ('JUAREZ', 'JUAN', 'AVELLANEDA 135', 445878778),
    ('LOPEZ', 'MARIA', 'URQUIZA 333', 454545445),
    ('LOPEZ', 'JOSE', 'URQUIZA 333', 423456798),
    ('SALAS', 'SUSANA', 'GRAL. PAZ 1234', 412345612);

UPDATE Agenda SET Prefijo='+0047' WHERE Nombre='MARIA';
UPDATE Agenda SET Prefijo='+0036' WHERE Nombre='SUSANA';

-- C) Diversos procesos DML:
-- Actualizar el registro cuyo nombre sea "JUAN" por "JOSE"
UPDATE Agenda SET Nombre='JOSE' WHERE Nombre='JUAN';

-- Eliminar los registros cuyo número telefónico sea igual a 423456798.
DELETE FROM Agenda WHERE Telefono='423456798';

-- Eliminar todos los registros
DELETE FROM Agenda;

-- Restablecer los registros anteriores
INSERT INTO Agenda (Apellido, Nombre, Domicilio, Telefono) VALUES 
    ('ALVAREZ', 'ALBERTO', 'COLON 123', 423456798),
    ('JUAREZ', 'JUAN', 'AVELLANEDA 135', 445878778),
    ('LOPEZ', 'MARIA', 'URQUIZA 333', 454545445),
    ('LOPEZ', 'JOSE', 'URQUIZA 333', 423456798),
    ('SALAS', 'SUSANA', 'GRAL. PAZ 1234', 412345612);
UPDATE Agenda SET Prefijo='+0047' WHERE Nombre='MARIA';
UPDATE Agenda SET Prefijo='+0036' WHERE Nombre='SUSANA';


-- D) Añadir un nuevo registro con mis datos personales
INSERT INTO Agenda (Apellido, Nombre, Domicilio, Telefono) VALUES 
('REDONDO', 'JOSE MANUEL', 'AV. PLUTARCO 45', 722773976);

-- E) Actualiza el apellido LOPEZ con GARCIA.
UPDATE Agenda SET Apellido='GARCIA' WHERE Apellido='LOPEZ';

-- F) Cambia el nombre de JOSE por ROBERTO.
UPDATE Agenda SET Nombre='ROBERTO' WHERE Nombre='JOSE';

-- G) Actualiza el teléfono 423456798 por 123456789 de Alberto.
UPDATE Agenda SET Telefono=123456789 WHERE Nombre='ALBERTO';



