/* Crear base de datos de gestión de pubs con comandos SQL que tengan en cuenta las siguientes restricciones:
- Todos los valores son de tipo carácter excepto los campos FECHA_APERTURA (fecha), CANTIDAD y PRECIO (numéricos con 
dos decimales), COD_LOCALIDAD (numérico relleno a ceros).
- Los únicos campos que no son obligatorios son los campos DOMICILIO.
- Los valores del campo horario sólo pueden ser HOR1, HOR2 y HOR3.
- No es posible dar de alta EXISTENCIAS a precio 0.
- El campo función de la tabla PUB_EMPLEADO sólo puede tener los valores CAMARERO, SEGURIDAD, LIMPIEZA.
- Las claves primarias vienen marcadas con el símbolo #
- Contempla las opciones necesarias para mantener la integridad referencial, creando las claves foráneas necesarias.

Para desarrollar la actividad de forma organizada, procede como sigue:
1.       Crea la base de datos y la activas
2.       Crea las tablas con sus claves primarias
3.       Crea las claves foráneas.
*/

--CÓDIGO EN MySQL:

CREATE DATABASE Pubs;

USE Pubs;

CREATE TABLE Pub (
Cod_pub             VARCHAR(10) NOT NULL,
Nombre              VARCHAR(50) NOT NULL,
Licencia_fiscal     VARCHAR(20) NOT NULL, 
Domicilio           VARCHAR(50),
Fecha_apertura      DATE NOT NULL,
Horario              NOT NULL, --Los valores del campo horario sólo pueden ser HOR1, HOR2 y HOR3.
Cod_localidad       CHAR(6) NOT NULL,
PRIMARY KEY (Cod_pub)
);

CREATE TABLE Titular (
    DNI_titular     VARCHAR(9) NOT NULL,
    Nombre          VARCHAR(50) NOT NULL,
    Domicilio       VARCHAR(50),
    Cod_pub         VARCHAR(10) NOT NULL,
    PRIMARY KEY (DNI_titular)
)

CREATE TABLE Empleado (
    DNI_empleado    VARCHAR(9) NOT NULL,
    Nombre          VARCHAR(50) NOT NULL,
    Domicilio       VARCHAR(50),
    PRIMARY KEY (DNI_empleado)
)

CREATE TABLE Existencias (
    Cod_articulo    VARCHAR(10) NOT NULL,
    Nombre          VARCHAR(50) NOT NULL, 
    Cantidad        DECIMAL(5,2) NOT NULL,
    Precio          DECIMAL(6,2) NOT NULL, --No es posible dar de alta EXISTENCIAS a precio 0.
    Cod_pub         VARCHAR(10) NOT NULL,
    PRIMARY KEY (Cod_articulo)
)

CREATE TABLE Localidad (
    Cod_localidad   CHAR(6) NOT NULL,
    Nombre          VARCHAR(50) NOT NULL, 
    PRIMARY KEY (Cod_pub)
);

CREATE TABLE Pub_empleado (
    Cod_pub         VARCHAR(10) NOT NULL,
    DNI_empleado    VARCHAR(9) NOT NULL,
    Funcion         VARCHAR(50) NOT NULL, --El campo función de la tabla PUB_EMPLEADO sólo puede tener los valores CAMARERO, SEGURIDAD, LIMPIEZA.
    PRIMARY KEY (Cod_pub, DNI_empleado, Funcion)
)