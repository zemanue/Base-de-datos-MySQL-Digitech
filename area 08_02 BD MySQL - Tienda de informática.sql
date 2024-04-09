--Código DDL y DML:
CREATE DATABASE IF NOT EXISTS tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE IF NOT EXISTS fabricante (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS producto (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DOUBLE NOT NULL,
    codigo_fabricante INT UNSIGNED NOT NULL,
    FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


--Consultas sobre una tabla:
--1. Lista el nombre de todos los productos que hay en la tabla producto. 
SELECT nombre FROM producto;

--2. Lista los nombres y los precios de todos los productos de la tabla producto. 
SELECT nombre, precio FROM producto;

--3. Lista todas las columnas de la tabla producto. 
SELECT * FROM producto;

--4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
SELECT nombre, precio, ROUND (precio*1.09, 2) FROM producto;

--5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
--Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares. 
SELECT nombre AS nombre_de_producto, precio AS euros, ROUND (precio*1.09, 2) AS dolares FROM producto;

--6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula. 
SELECT UPPER (nombre) AS nombre, precio FROM producto;

--7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula. 
SELECT LOWER (nombre) AS nombre, precio FROM producto;

--8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtener en mayúsculas los dos primeros caracteres del nombre del fabricante. 
SELECT nombre, UPPER (LEFT(nombre, 2)) FROM fabricante;

--9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio. 
SELECT nombre, ROUND (precio, 1) AS precio_redondeado FROM producto;

--10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal. 
SELECT nombre, TRUNCATE (precio, 0) AS precio_redondeado FROM producto;

--11. Lista los códigos de los fabricantes que tienen productos en la tabla producto. 


--12. Lista el código de los fabricantes que tienen productos en la tabla producto, mostrando dichos códigos sin repetir. 
