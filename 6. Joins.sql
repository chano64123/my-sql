use my_bd

-- ✏️ Ejercicios JOIN Parte 1
-- Encuentra el nombre y apellido de los empleados junto con la cantidad total de ventas que han realizado.
SELECT e.nombre, e.apellido, COUNT(v.id) AS cantidad_ventas
FROM empleados AS e
INNER JOIN ventas AS v ON e.id = v.empleado_id
GROUP BY e.id;

-- Calcula el monto total vendido a cada cliente y muestra el nombre del cliente, su dirección y el monto total.
SELECT c.nombre, c.direccion, SUM(v.monto_total) AS total_comprado
FROM clientes AS c
INNER JOIN ventas AS v ON c.id = v.empleado_id
GROUP BY c.id;

-- Encuentra los productos vendidos por cada empleado en el departamento de "Ventas" y muestra el nombre del empleado junto con el nombre de los productos que han vendido.
SELECT e.nombre, p.nombre
FROM empleados AS e
INNER JOIN departamentos AS d ON d.id = e.departamento_id
INNER JOIN ventas AS v ON e.id = v.empleado_id
INNER JOIN productos AS p ON p.id = v.producto_id
WHERE d.nombre = 'Ventas'
GROUP BY e.nombre, p.nombre;

-- Encuentra el nombre del cliente, el nombre del producto y la cantidad comprada de productos con un precio superior a $500.
SELECT c.nombre, p.nombre, SUM(v.cantidad) AS cantidad_compradas
FROM ventas AS v
INNER JOIN clientes AS c ON c.id = v.cliente_id
INNER JOIN productos AS p ON p.id = v.producto_id
WHERE v.precio_unitario > 500
GROUP BY c.nombre, p.nombre;

-- ✏️Ejercicios JOIN Parte 2
-- Calcula la cantidad de ventas por departamento, incluso si el departamento no tiene ventas.
SELECT d.nombre AS departamento, COUNT(v.id) AS cantidad_ventas
FROM ventas AS v
RIGHT JOIN empleados AS e ON e.id = v.empleado_id
INNER JOIN departamentos AS d ON d.id = e.departamento_id
GROUP BY d.id;

-- Encuentra el nombre y la dirección de los clientes que han comprado más de 3 productos y muestra la cantidad de productos comprados.
SELECT c.nombre, p.nombre, SUM(v.cantidad) AS cantidad_compradas
FROM ventas AS v
INNER JOIN clientes AS c ON c.id = v.cliente_id
INNER JOIN productos AS p ON p.id = v.producto_id
GROUP BY c.nombre, p.nombre
HAVING SUM(v.cantidad) > 3;

-- Calcula el monto total de ventas realizadas por cada departamento y muestra el nombre del departamento junto con el monto total de ventas.
SELECT d.nombre AS departamento, SUM(v.monto_total) AS monto_total_ventas
FROM ventas AS v
INNER JOIN empleados AS e ON e.id = v.empleado_id
INNER JOIN departamentos AS d ON d.id = e.departamento_id
GROUP BY d.id;

-- ✏️  Actividad: Ejercicios Complementarios
-- ✨ Estos ejercicios son de tipo complementario. Esto quiere decir que te ayudará a avanzar en profundidad en el tema visto, pero no son obligatorios. Te recomendamos intentar con tu equipo trabajar algunos de ellos. 
-- Muestra el nombre y apellido de los empleados que pertenecen al departamento de "Recursos Humanos" y han realizado más de 5 ventas.
SELECT e.nombre, e.apellido, COUNT(v.id)
FROM empleados AS e
INNER JOIN departamentos AS d ON d.id = e.departamento_id
INNER JOIN ventas AS v ON v.empleado_id = e.id
WHERE d.nombre = 'Recursos Humanos'
GROUP BY e.id;

-- Muestra el nombre y apellido de todos los empleados junto con la cantidad total de ventas que han realizado, incluso si no han realizado ventas.
SELECT e.nombre, e.apellido, COUNT(v.id)
FROM ventas AS v
RIGHT JOIN empleados AS e ON e.id = v.empleado_id
GROUP BY e.id;

-- Encuentra el empleado más joven de cada departamento y muestra el nombre del departamento junto con el nombre y la edad del empleado más joven.
SELECT d.nombre AS departamento, e.nombre, MIN(e.edad)
FROM empleados AS e
INNER JOIN departamentos AS d ON d.id = e.departamento_id
GROUP BY d.id;

-- Calcula el volumen de productos vendidos por cada producto (por ejemplo, menos de 5 como "bajo", entre 5 y 10 como "medio", y más de 10 como "alto") y muestra la categoría de volumen junto con la cantidad y el nombre del producto.
SELECT 
    p.nombre, 
    SUM(v.cantidad) AS cantidad_vendida,
    CASE
        WHEN SUM(v.cantidad) >= 5 THEN 'Alto'
        WHEN SUM(v.cantidad) > 3 THEN 'Medio'
        ELSE 'Bajo'
    END AS volumen
FROM ventas AS v
INNER JOIN productos AS p ON v.producto_id = p.id
GROUP BY p.id;
