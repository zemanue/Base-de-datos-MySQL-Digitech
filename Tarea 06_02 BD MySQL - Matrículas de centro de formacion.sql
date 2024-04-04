--TAREA 06_02. Matrículas de centro de formación.

--MODELO FÍSICO
--CÓDIGO EN MYSQL:

CREATE DATABASE Matriculas;

USE Matriculas;

CREATE TABLE Alumno (
NumMatricula    CHAR(10),
Nombre          VARCHAR(50),
FechaNacimiento DATE, 
Telefono        CHAR(9),
PRIMARY KEY (NumMatricula)
);

CREATE TABLE Profesor (
IdProfesor      CHAR(6),
NIF_P           CHAR(9) UNIQUE,
Nombre          VARCHAR(50),
Especialidad    VARCHAR(100),
Telefono        CHAR(9),
PRIMARY KEY (IdProfesor)
);

CREATE TABLE Asignatura (
CodigoAsignatura CHAR(6),
Nombre           VARCHAR(50), 
IdProfesor       CHAR(6),
PRIMARY KEY (CodigoAsignatura),
FOREIGN KEY (IdProfesor) REFERENCES Profesor (IdProfesor)
);


CREATE TABLE Recibe (
NumMatricula     CHAR(10), 
CodigoAsignatura CHAR(6),
CursoEscolar     VARCHAR(20) CHECK (CursoEscolar IN ('1DAM', '2DAM', '1DAW', '2DAW', '1ASIR', '2ASIR')),
PRIMARY KEY (NumMatricula, CodigoAsignatura, CursoEscolar),
FOREIGN KEY (NumMatricula) REFERENCES Alumno (NumMatricula),
FOREIGN KEY (CodigoAsignatura) REFERENCES Asignatura (CodigoAsignatura)
);

