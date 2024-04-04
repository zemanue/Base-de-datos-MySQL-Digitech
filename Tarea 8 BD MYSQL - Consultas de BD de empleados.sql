-- Partimos de la BD de empleados que se presenta a continuación:

CREATE DATABASE empleados1;

USE empleados1;

/* TABLA DEPART */
CREATE TABLE DEPARTAMENTOS (
    DEPT_NO  INT(2) NOT NULL,
    DNOMBRE  VARCHAR(14), 
    CIUDAD   VARCHAR(14),
    PRIMARY KEY(DEPT_NO)
);

INSERT INTO DEPARTAMENTOS VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO DEPARTAMENTOS VALUES (20,'INVESTIGACIÓN','MADRID');
INSERT INTO DEPARTAMENTOS VALUES (30,'VENTAS','BARCELONA');
INSERT INTO DEPARTAMENTOS VALUES (40,'PRODUCCIÓN','BILBAO');

/* TABLA EMPLE */

CREATE TABLE EMPLEADOS (
    EMP_NO    INT(4) NOT NULL,
    APELLIDO  VARCHAR(10),
    OFICIO    VARCHAR(10),
    DIRECTOR  INT(4),
    FEC_ALTA  DATE,
    SALARIO   DECIMAL(10,2),
    COMISION  DECIMAL(10,2),
    DEPT_NO   INTEGER(2) NOT NULL,
    PRIMARY KEY(EMP_NO)
);

/* ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY'; */

INSERT INTO EMPLEADOS VALUES (7369,'SANCHEZ','EMPLEADO',7902,'1980/12/17',104000,NULL,20);
INSERT INTO EMPLEADOS VALUES (7499,'ARROYO','VENDEDOR',7698,'1980/02/20',208000,39000,30);
INSERT INTO EMPLEADOS VALUES (7521,'SALA','VENDEDOR',7698,'1981/02/22',162500,65000,30);
INSERT INTO EMPLEADOS VALUES (7566,'JIMENEZ','DIRECTOR',7839,'1981/04/02',386750,NULL,20);
INSERT INTO EMPLEADOS VALUES (7654,'MARTIN','VENDEDOR',7698,'1981/09/29',162500,182000,30);
INSERT INTO EMPLEADOS VALUES (7698,'NEGRO','DIRECTOR',7839,'1981/05/01',370500,NULL,30);
INSERT INTO EMPLEADOS VALUES (7782,'CEREZO','DIRECTOR',7839,'1981/06/09',318500,NULL,10);
INSERT INTO EMPLEADOS VALUES (7788,'GIL','ANALISTA',7566,'1981/11/01',390000,NULL,20);
INSERT INTO EMPLEADOS VALUES (7839,'REY','PRESIDENTE',NULL,'1981/11/17',650000,NULL,10);
INSERT INTO EMPLEADOS VALUES (7844,'TOVAR','VENDEDOR',7698,'1981/09/08',195000,0,30);
INSERT INTO EMPLEADOS VALUES (7876,'ALONSO','EMPLEADO',7788,'1981/09/23',143000,NULL,20);
INSERT INTO EMPLEADOS VALUES (7900,'JIMENO','EMPLEADO',7698,'1981/12/03',123500,NULL,30);
INSERT INTO EMPLEADOS VALUES (7902,'FERNANDEZ','ANALISTA',7566,'1981/02/03',390000,NULL,20);
INSERT INTO EMPLEADOS VALUES (7934,'MUROS','EMPLEADO',7782,'1982/01/23',169000,NULL,10);


--Deseamos realizar las siguientes consultas:

--1. Calcula el salario medio de los empleados del departamento 20 de la tabla EMPLEADOS.
SELECT AVG(salario) AS SALARIO_MEDIO_DEPT20 FROM empleados WHERE dept_no=20; 

--2. Cuenta cuántos registros la tabla EMPLEADOS.
SELECT COUNT(*) FROM empleados;

--3. Cuenta cuántos registros de la tabla EMPLEADOS cobran comisión.
SELECT COUNT(comision) FROM empleados WHERE comision>0;

--4. Calcula el salario máximo de la tabla EMPLEADOS.
SELECT MAX(salario) FROM empleados;

--5. Obtén el máximo nombre (alfabéticamente) de la tabla EMPLEADOS.
SELECT MAX(apellido) FROM empleados;

--6. Obtén el nombre del empleado que tiene mayor salario.
SELECT apellido FROM empleados WHERE salario = (SELECT MAX(salario) FROM empleados);

--7. Obtén el mínimo salario de la tabla EMPLEADOS.
SELECT MIN(salario) FROM empleados;

--8. Obtén el nombre del empleado que tiene el mínimo salario.
SELECT apellido FROM empleados WHERE salario = (SELECT MIN(salario) FROM empleados);

--9. Calcula la suma de todos los salarios de la tabla EMPLEADOS.
SELECT SUM(salario) FROM empleados;

--10. Obtén la desviación típica de todos los salarios de la tabla EMPLEADOS. Averigua antes que es la desviación típica.
-- La desviación típica es una medida que sirve para cuantificar la variación de los datos numéricos con respecto a la media.
SELECT STDDEV_POP(salario) FROM empleados;

--11. Calcula el número de departamentos que hay en la tabla EMPLEADOS. Después,  calcula el número de personas que hay en cada departamento que hay en la tabla EMPLEADOS.
SELECT COUNT(dept_no) FROM empleados GROUP BY dept_no;
SELECT dept_no, COUNT(*) FROM empleados GROUP BY dept_no;

--12. A partir de la tabla EMPLEADOS, visualiza cuántos apellidos empiezan por la letra ‘A’.
SELECT COUNT(apellido) AS APELLIDOS_POR_A FROM empleados WHERE apellido LIKE 'a%';

--13. Obtén el nombre de los empleados que empiecen por la letra ‘A’ y que tengan máximo salario (de los que empiezan por la letra ‘A’).
SELECT MAX(salario) FROM empleados WHERE apellido LIKE 'a%';

