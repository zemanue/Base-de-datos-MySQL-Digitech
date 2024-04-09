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

ALTER TABLE LineaPedido 
ADD CONSTRAINT fk_LineaPedido_Pedido
FOREIGN KEY (RefPed) REFERENCES Pedido (RefPed),
ADD CONSTRAINT fk_LineaPedido_Articulo
FOREIGN KEY (CodArt) REFERENCES Articulo (CodArt);

INSERT INTO Pedido VALUES
('P0001', '2014-02-16'),
('P0002', '2014-02-18'),
('P0003', '2014-02-23'),
('P0004', '2014-02-25');

INSERT INTO Articulo VALUES
('A0043', 'Boligrafo azul fino', 0.78),
('A0078', 'Boligrafo rojo normal', 1.05),
('A0075', 'Lapiz 2B', 0.55),
('A0012', 'Goma de borrar', 0.15),
('A0089', 'Sacapuntas', 0.25);

INSERT INTO LineaPedido VALUES
('P0001', 'A0043', 10),
('P0001', 'A0078', 12),
('P0002', 'A0043', 5),
('P0003', 'A0075', 20),
('P0004', 'A0012', 15),
('P0004', 'A0043', 5),
('P0004', 'A0089', 50);