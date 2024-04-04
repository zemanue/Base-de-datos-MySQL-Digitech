--TAREA 06_03 - Retomamos Proveedores/Piezas/Categorías

--MODELO RELACIONAL
-- - PROVEEDORES (CodigoProveedor (PK), Nombre, Direccion, Ciudad, Provincia)

-- - PIEZAS (CodigoPieza (PK), Nombre, Color, Precio, CodigoCategoria (FK))

-- - SUMINISTRAN (CodigoProveedor (PK, FK1), CodigoPieza (PK, FK2), Cantidad, Fecha)

-- - CATEGORIAS (CodigoCategoria (PK), Nombre)


--MODELO FÍSICO
--CÓDIGO EN MYSQL:

CREATE DATABASE Empresa;

USE Empresa;

CREATE TABLE Proveedores (
CodigoProveedor CHAR(6),
Nombre          VARCHAR(50) NOT NULL,
Direccion       VARCHAR(100), 
Ciudad          VARCHAR(20), 
Provincia       VARCHAR (20)
);

CREATE TABLE Piezas (
CodigoPieza     CHAR(8),
Nombre          VARCHAR(50) NOT NULL,
Color           VARCHAR (20),
Precio          DECIMAL(5,2),
CodigoCategoria CHAR(7) 
);

CREATE TABLE Suministran (
CodigoProveedor CHAR(6),
CodigoPieza     CHAR(8),
Cantidad        INT(4), 
Fecha           DATE
);

CREATE TABLE Categorias (
CodigoCategoria CHAR(7), 
Nombre          VARCHAR(50) NOT NULL
);

ALTER TABLE Proveedores ADD PRIMARY KEY (CodigoProveedor);

ALTER TABLE Piezas ADD PRIMARY KEY (CodigoPieza);

ALTER TABLE Suministran ADD PRIMARY KEY (CodigoProveedor, CodigoPieza);

ALTER TABLE Categorias ADD PRIMARY KEY (CodigoCategoria);

ALTER TABLE Piezas 
ADD CONSTRAINT fk_Piezas_Categorias
FOREIGN KEY (CodigoCategoria) REFERENCES Categorias (CodigoCategoria);

ALTER TABLE Suministran 
ADD CONSTRAINT fk_Suministran_Proveedores
FOREIGN KEY (CodigoProveedor) REFERENCES Proveedores (CodigoProveedor);

ALTER TABLE Suministran 
ADD CONSTRAINT fk_Suministran_Piezas
FOREIGN KEY (CodigoPieza) REFERENCES Piezas (CodigoPieza);



