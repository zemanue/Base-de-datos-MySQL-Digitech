--TAREA 6. ACADEMIA DE IDIOMAS. 
--MODELO RELACIONAL
-- - ALUMNOS (nombre, apellidos, DNI (PK), dirección, fecha de nacimiento, sexo (H/M), curso).
-- - PROFESORES (nombre, apellidos, DNI (PK), dirección, título académico (LDO/DDO/CFGS), precio por hora (dos decimales y > 0)).
-- - CURSOS (nombre, código (PK), num alumnos recomendados, DNI profesor (FK), fecha inicio, fecha finalización (> fecha inicio), num horas del curso (>= 80))

--MODELO FÍSICO
--CÓDIGO EN MYSQL:

CREATE DATABASE AcademiaIdiomas;

USE AcademiaIdiomas;

CREATE TABLE Alumnos (
Nombre VARCHAR(50),
Apellidos VARCHAR(50),
DNI VARCHAR(10),
Direccion VARCHAR(100),
FechaNacimiento DATE,
Sexo CHAR(1) CHECK (Sexo IN ('H', 'M')),
PRIMARY KEY (DNI)
);

CREATE TABLE Profesores (
Nombre VARCHAR(50),
Apellidos VARCHAR(50),
DNI VARCHAR(10),
Direccion VARCHAR(100),
TituloAcademico VARCHAR(4) CHECK (TituloAcademico IN ('LDO', 'DDO', 'CFGS')), 
PrecioHora DECIMAL(4,2) CHECK (PrecioHora > 0),
PRIMARY KEY (DNI)
);

CREATE TABLE Cursos (
Nombre VARCHAR(100),
Codigo VARCHAR(20),
NumAlumnosRecomend INT CHECK (NumAlumnosRecomend >= 10),
DNIProfesor VARCHAR(10),
FechaInicio DATE,
FechaFinalizacion DATE CHECK (FechaFinalizacion > FechaInicio),
NumHoras INT CHECK (NumHoras >= 80),
PRIMARY KEY (Codigo),
FOREIGN KEY (DNIProfesor) REFERENCES Profesores(DNI)
);

ALTER TABLE Alumnos 
ADD Curso VARCHAR(20) AFTER Sexo,
ADD FOREIGN KEY (Curso) REFERENCES Cursos(Codigo);


