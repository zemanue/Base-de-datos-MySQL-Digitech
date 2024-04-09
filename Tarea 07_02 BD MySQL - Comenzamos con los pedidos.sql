/*
Generar los comandos para la creación de la BBDD “pedidos”, mostrada a continuación.
1) Comandos para crear las tablas
2) Comandos para añadir las claves primarias
3) Comandos para diseñar las claves foráneas
4) Comandos para añadir los contenidos de las tablas
*/

-- Código en MySQL:

CREATE DATABASE Pedidos;

USE Pedidos;

CREATE TABLE Pedido (
    RefPed      CHAR(5) NOT NULL,
    FecPed      DATE NOT NULL,
    PRIMARY KEY (RefPed)
);

CREATE TABLE LineaPedido (
    RefPed      CHAR(5) NOT NULL,
    CodArt      CHAR(5) NOT NULL,
    CantArt     INT(3)  NOT NULL,
    PRIMARY KEY (RefPed, CodArt)
);

CREATE TABLE Articulo (
    CodArt      CHAR(5) NOT NULL,
    DesArt      VARCHAR(100) NOT NULL,
    PVPArt      DECIMAL (5,2) NOT NULL,
    PRIMARY KEY (CodArt)
);




