-- Partimos de la base de datos empleados1 en la que deseamos realizar las siguientes consultas:

--NOTA: las preguntas relacionadas con el nombre del empleado, al no existir el atributo nombre, se utilizará el apellido

-- 1. Mostrar para cada empleado, el nombre de departamento y el nombre de dicho empleado y su salario.
SELECT dept.dnombre nombre_del_departamento, emp.apellido, emp.salario
FROM empleados emp INNER JOIN departamentos dept
ON dept.dept_no = emp.dept_no;

-- 2. Mostrar el nombre de cada empleado y la localidad del departamento en el que trabaja.
SELECT emp.apellido, dept.ciudad
FROM empleados emp INNER JOIN departamentos dept
ON dept.dept_no = emp.dept_no;

-- 3. Mostrar el nombre del departamento y la media de las comisiones de sus empleados.
SELECT dept.dnombre nombre_del_departamento, AVG(emp.COMISION) AS media_comision
FROM departamentos dept LEFT JOIN empleados emp
ON dept.dept_no = emp.dept_no
GROUP BY dept.dnombre;

-- 4. Mostrar los nombres de los departamentos y el número de empleados 
-- de los departamentos que tienen más de dos empleados.
SELECT dept.dnombre nombre_del_departamento, COUNT(emp.emp_no) numero_empleados
FROM departamentos dept LEFT JOIN empleados emp
ON dept.dept_no = emp.dept_no
GROUP BY dept.dnombre
HAVING COUNT(emp.emp_no) > 2;

-- 5. Mostrar cuantos empleados hay en cada ciudad de los departamentos
SELECT dept.ciudad, COUNT(emp.emp_no) numero_empleados
FROM departamentos dept LEFT JOIN empleados emp
ON dept.dept_no = emp.dept_no
GROUP BY dept.ciudad;
