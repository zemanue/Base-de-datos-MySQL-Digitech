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
INSERT INTO producto VALUES(8, 'Portatil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portatil Ideapad 320', 444, 2);
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
SELECT codigo_fabricante FROM producto;

--12. Lista el código de los fabricantes que tienen productos en la tabla producto, mostrando dichos códigos sin repetir. 
SELECT DISTINCT codigo_fabricante FROM producto;

--13. Lista los nombres de los fabricantes ordenados de forma ascendente. 
SELECT nombre FROM fabricante ORDER BY nombre;

--14. Lista los nombres de los fabricantes ordenados de forma descendente. 
SELECT nombre FROM fabricante ORDER BY nombre DESC;

--15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente. 
SELECT nombre FROM producto ORDER BY nombre, precio DESC;

--16. Devuelve una lista con las 5 primeras filas de la tabla fabricante. 
SELECT * FROM fabricante LIMIT 5;

--17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta. 
SELECT * FROM fabricante LIMIT 3,2;

--18. Lista el nombre y el precio del producto más barato. (Utilizar las cláusulas ORDER BY y LIMIT) 
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;

--19. Lista el nombre y el precio del producto más caro. (Utilizar las cláusulas ORDER BY y LIMIT) 
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

--20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2. 
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

--21. Lista el nombre de los productos que tienen un precio menor o igual a 120€. 
SELECT nombre FROM producto WHERE precio <= 120;

--22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€. 
SELECT nombre FROM producto WHERE precio >= 400;

--23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€. 
SELECT nombre FROM producto WHERE NOT precio >= 400;

--24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN. 
SELECT nombre FROM producto WHERE precio > 80 AND precio < 300;

--25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN. 
SELECT nombre FROM producto WHERE precio BETWEEN 80 AND 300;

--26. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6. 
SELECT nombre FROM producto WHERE precio > 80 AND precio < 300;

--27. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN. 
SELECT nombre FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

--28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN. 
SELECT nombre FROM producto WHERE codigo_fabricante IN (1, 3, 5);

--29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). 
--Crear un alias para la columna que contiene el precio que se llame céntimos. 
SELECT nombre, precio*100 AS centimos FROM producto;

--30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S. 
SELECT nombre FROM fabricante WHERE nombre LIKE 's%';

--31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e. 
SELECT nombre FROM fabricante WHERE nombre LIKE '%e';

--32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w. 
SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';

--33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres. Dos métodos:
SELECT nombre FROM fabricante WHERE nombre LIKE '____';
SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;

--34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre. 
SELECT nombre FROM producto WHERE nombre LIKE '%portatil%';

--35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €. 
SELECT nombre FROM producto WHERE nombre LIKE '%monitor%' AND precio < 215;

--36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
--Ordena el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente). 
SELECT nombre, precio FROM producto WHERE precio >= 180 ORDER BY precio DESC, nombre;
