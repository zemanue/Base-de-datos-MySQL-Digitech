/*
2ª parte de Tarea 07_02 - Comenzamos con los pedidos:

1. Subir el precio en 0.2 Euros a todos los artículos cuyo precio sea inferior a 1 Euro.
2. Cambiar la fecha del pedido P0001 a 29/02/2024.
3. Borrar los artículos que tengan un precio superior a 1 Euro.
4. Modificar el tipo de dato de cantart para que tenga dos decimales.
5. Aumentar la cantidad de los productos que forman parte del pedido P0004 en 5 uds cada uno.
6. Impedir que el pvpart sea inferior a 0.
*/

/* Código para crear las tablas e insertar los datos en archivo Tarea 07_02 BD MySQL - Comenzamos con los pedidos.sql
Continuación: */

UPDATE Articulo 
SET PVPArt = PVPArt + 0.2 
WHERE PVPArt < 1;

UPDATE Pedido
SET FecPed = '2024-02-29'
WHERE RefPed = 'P0001';


