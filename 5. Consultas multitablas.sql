-- ✏️Ejercicios consultas multitabla  - Parte 1
-- Une las tablas de empleados con departamentos y solo muestra las columnas nombre, apellido, edad, salario de empleados 
-- y la columna nombre de departamentos.
SELECT e.nombre, apellido, edad, salario, d.nombre 
FROM empleados AS e, departamentos AS d
WHERE e.departamento_id = d.id;

-- Une las tablas ventas con la tabla empleados donde se muestren todas las columnas de ventas exceptuando 
-- la columna empleado_id y en su lugar muestres el nombre y apellido de la tabla empleados.
SELECT v.id, v.producto_id, v.cliente_id, v.cantidad, v.precio_unitario, v.monto_total, e.nombre, e.apellido 
FROM ventas AS v, empleados AS e
WHERE v.empleado_id = e.id;

-- Une las tablas ventas con la tabla productos donde se muestren todas las columnas de ventas exceptuando 
-- la columna producto_id y en su lugar muestres la columna nombre de la tabla productos.
SELECT v.id, v.cliente_id, v.cantidad, v.precio_unitario, v.empleado_id, p.nombre 
FROM ventas AS v, productos AS p
WHERE p.id = v.producto_id;

-- Une las tablas ventas con la tabla clientes donde se muestren todas las columnas de ventas exceptuando 
-- la columna cliente_id y en su lugar muestres la columna nombre de la tabla clientes.
SELECT v.id, v.producto_id, v.cantidad, v.precio_unitario, v.empleado_id, c.nombre
FROM ventas AS v, clientes AS c
WHERE v.cliente_id = c.id;

-- Une las tablas ventas con la tablas empleados y departamentos donde se muestren todas las columnas de ventas 
-- exceptuando la columna empleado_id y en su lugar muestres el nombre y apellido de la tabla empleados y además 
-- muestres la columna nombre de la tabla departamentos.
SELECT v.id, v.producto_id, v.cliente_id, v.cantidad, v.precio_unitario, v.monto_total, e.nombre, e.apellido, d.nombre
FROM ventas AS v, empleados AS e, departamentos AS d
WHERE v.empleado_id = e.id AND e.departamento_id = d.id;

-- Une las tablas ventas, empleados, productos y clientes donde se muestren las columnas de la tabla ventas 
-- reemplazando sus columnas de FOREIGN KEYs con las respectivas columnas de “nombre” de las otras tablas.
SELECT v.id, p.nombre AS producto, c.nombre AS cliente, v.cantidad, v.precio_unitario, v.monto_total, e.nombre AS empleado
FROM ventas AS v, empleados AS e, productos AS p, clientes AS c
WHERE v.producto_id = p.id AND v.cliente_id = c.id AND v.empleado_id = e.id;

-- Calcular el salario máximo de los empleados en cada departamento y mostrar el nombre del departamento 
-- junto con el salario máximo.
SELECT d.nombre AS departamento, MAX(e.salario) AS salario_maximo
FROM empleados AS e, departamentos AS d
WHERE e.departamento_id = d.id
GROUP BY d.nombre;

-- ✏️Ejercicios consultas multitabla - Parte 2 
-- Calcular el monto total de ventas por departamento y mostrar el 
-- nombre del departamento junto con el monto total de ventas.
SELECT d.nombre AS departamento, SUM(v.monto_total) AS venta_total
FROM ventas AS v, empleados AS e, departamentos AS d
WHERE v.empleado_id = e.id AND e.departamento_id = d.id
GROUP BY d.nombre;

-- Encontrar el empleado más joven de cada departamento y mostrar 
-- el nombre del departamento junto con la edad del empleado más joven.
SELECT d.nombre AS departamento, MIN(e.edad) AS edad_minima
FROM empleados AS e, departamentos AS d
WHERE e.departamento_id = d.id
GROUP BY d.nombre;

-- Calcular el volumen de productos vendidos por cada producto 
-- (por ejemplo, menos de 5 “bajo”, menos 8 “medio” y mayor o igual a 8 “alto”) y 
-- mostrar la categoría de volumen junto con la cantidad y el nombre del producto.
SELECT 
	p.nombre, 
	SUM(v.cantidad) AS cantidad_vendida,
	CASE
		WHEN SUM(v.cantidad) >= 5 THEN 'Alto'
		WHEN SUM(v.cantidad) > 3 THEN 'Medio'
		ELSE 'Bajo'
	END AS volumen
FROM ventas AS v, productos AS p
WHERE v.producto_id = p.id
GROUP BY p.nombre;

-- Encontrar el cliente que ha realizado el mayor monto total de compras y 
-- mostrar su nombre y el monto total.
SELECT c.nombre, SUM(v.monto_total) AS monto_total
FROM clientes AS c, ventas AS v
WHERE c.id = v.cliente_id
GROUP BY c.nombre
ORDER BY monto_total DESC
LIMIT 1;

-- Calcular el precio promedio de los productos vendidos por cada empleado y mostrar 
-- el nombre del empleado junto con el precio promedio de los productos que ha vendido.
SELECT e.nombre, AVG(p.precio) AS promedio_producto
FROM empleados AS e, productos AS p, ventas AS v
WHERE v.producto_id = p.id AND e.id = v.empleado_id
GROUP BY e.nombre;

-- Encontrar el departamento con el salario mínimo más bajo entre los empleados y mostrar 
-- el nombre del departamento junto con el salario mínimo más bajo.
SELECT d.nombre AS departamento, MIN(e.salario) AS salario_minimo
FROM empleados AS e, departamentos AS d
WHERE e.departamento_id = d.id
GROUP BY d.nombre
ORDER BY salario_minimo ASC
LIMIT 1;

-- Encuentra el departamento con el salario promedio más alto entre los empleados mayores 
-- de 30 años y muestra el nombre del departamento junto con el salario promedio. Limita los 
-- resultados a mostrar solo los departamentos con el salario promedio mayor a 3320.
SELECT d.nombre AS departamento, AVG(e.salario) AS salario_promedio
FROM empleados AS e, departamentos AS d
WHERE e.departamento_id = d.id AND e.edad > 30
GROUP BY d.nombre
HAVING AVG(e.salario) > 3320
ORDER BY salario_promedio DESC;

-- ✏️  Actividad: Ejercicios Complementarios
-- ✨ Estos ejercicios son de tipo complementario. Esto quiere decir que te ayudará a avanzar en profundidad en el tema visto, pero no son obligatorios. Te recomendamos intentar con tu equipo trabajar algunos de ellos.
-- Encontrar la cantidad de productos vendidos por cada empleado y mostrar el nombre del empleado junto con la cantidad de productos vendidos.
SELECT e.nombre, COUNT(v.producto_id) AS cantidad_productos_vendidos
FROM empleados AS e, ventas AS v
WHERE e.id = v.empleado_id
GROUP BY e.nombre;

-- Calcular el monto total de ventas por cada cliente y mostrar el nombre del cliente junto con el monto total de sus compras.
SELECT c.nombre, SUM(v.monto_total) AS total_compras
FROM clientes AS c, ventas AS v
WHERE c.id = v.cliente_id
GROUP BY c.nombre;

-- Encontrar el producto más caro vendido y mostrar su nombre y precio.
SELECT p.nombre, MAX(p.precio) AS precio_mas_caro
FROM productos AS p, ventas AS v
WHERE p.id = v.producto_id
GROUP BY p.nombre
ORDER BY precio_mas_caro DESC
LIMIT 1;

-- Calcular el salario promedio de los empleados en cada departamento y mostrar el nombre del departamento junto con el salario promedio.
SELECT d.nombre, AVG(e.salario) AS salario_promedio
FROM departamentos AS d, empleados AS e
WHERE d.id = e.departamento_id
GROUP BY d.nombre;

-- Encontrar la cantidad total de ventas realizadas por cada empleado y mostrar el nombre y apellido del empleado junto con la cantidad total de ventas.
SELECT e.nombre, e.apellido, COUNT(v.id) AS total_ventas
FROM empleados AS e, ventas AS v
WHERE e.id = v.empleado_id
GROUP BY e.nombre, e.apellido;

-- Encuentra la cantidad de ventas realizadas por cada empleado y muestra el nombre y apellido del empleado junto con la cantidad total de ventas. Limita los resultados a mostrar solo a los empleados que hayan realizado más de 5 ventas y ordenarlos de forma descendente con respecto a la cantidad de ventas.
SELECT e.nombre, e.apellido, COUNT(v.id) AS total_ventas
FROM empleados AS e, ventas AS v
WHERE e.id = v.empleado_id
GROUP BY e.nombre, e.apellido
HAVING COUNT(v.id) > 5
ORDER BY total_ventas DESC;

-- Calcula el monto total vendido por cada empleado y muestra el nombre del empleado junto con el monto total. Usa la cláusula HAVING para filtrar a aquellos empleados que hayan vendido más de 10 productos en total. Muestra el resultado en orden descendente según el monto total vendido.
SELECT e.nombre, SUM(v.monto_total) AS total_vendido
FROM empleados AS e, ventas AS v
WHERE e.id = v.empleado_id
GROUP BY e.nombre
HAVING COUNT(v.producto_id) > 10
ORDER BY total_vendido DESC;

-- Encuentra el monto total vendido a cada cliente y muestra el nombre del cliente junto con el monto total. Usa la cláusula HAVING para filtrar a aquellos clientes cuyo monto total promedio en sus compras sea superior a $1500. Muestra el resultado en orden descendente según el monto total vendido.
SELECT c.nombre, SUM(v.monto_total) AS total_vendido
FROM clientes AS c, ventas AS v
WHERE c.id = v.cliente_id
GROUP BY c.nombre
HAVING AVG(v.monto_total) > 1500
ORDER BY total_vendido DESC;

-- Calcula la cantidad total de ventas realizadas a cada cliente y muestra el nombre del cliente junto con la cantidad total de ventas. Limita los resultados a mostrar solo a los clientes que hayan realizado más de 3 ventas ordénalos de forma descendente según la cantidad de ventas.
SELECT c.nombre, COUNT(v.id) AS total_ventas
FROM clientes AS c, ventas AS v
WHERE c.id = v.cliente_id
GROUP BY c.nombre
HAVING COUNT(v.id) > 3
ORDER BY total_ventas DESC;

-- Encuentra los productos más caros vendidos (precio mayor a 1000), muestra su nombre y precio y ordenarlos de forma descendente por precio.
SELECT p.nombre, p.precio
FROM productos AS p, ventas AS v
WHERE p.id = v.producto_id
AND p.precio > 1000
ORDER BY p.precio DESC;
