-- ✏️Ejercicios Función MAX() 
-- Encuentra el salario máximo de todos los empleados.
SELECT MAX(salario)
FROM empleados;

-- Encuentra la cantidad máxima de productos vendidos en una sola venta.
SELECT MAX(cantidad)
FROM ventas;

-- Encuentra la edad máxima de los empleados.
SELECT MAX(edad)
FROM empleados;

-- ✏️Ejercicios Función MIN()
-- Encuentra el salario mínimo de todos los empleados.
SELECT MIN(salario)
FROM empleados;

-- Encuentra la cantidad mínima de productos vendidos en una sola venta.
SELECT MIN(cantidad)
FROM ventas;

-- Encuentra la edad mínima de los empleados.
SELECT MIN(edad)
FROM empleados;

-- ✏️Ejercicios de la Función COUNT()
-- Cuenta cuántos empleados hay en total.
SELECT COUNT(*)
FROM empleados;

-- Cuenta cuántas ventas se han realizado.
SELECT COUNT(*)
FROM ventas;

-- Cuenta cuántos productos tienen un precio superior a $500.
SELECT COUNT(*)
FROM productos
WHERE precio > 500;

-- ✏️Ejercicios de la Función SUM()
-- Calcula la suma total de salarios de todos los empleados.
SELECT SUM(salario)
FROM empleados;

-- Calcula la suma total de montos vendidos en todas las ventas.
SELECT SUM(monto_total)
FROM ventas;

-- Calcula la suma de precios de productos con ID par.
SELECT SUM(precio)
FROM productos
WHERE id % 2 = 0;

-- ✏️Ejercicios Función AVG()
-- Calcula el salario promedio de todos los empleados.
SELECT AVG(salario)
FROM empleados;

-- Calcula el precio unitario promedio de todos los productos.
SELECT AVG(precio)
FROM productos;

-- Calcula la edad promedio de los empleados.
SELECT AVG(edad)
FROM empleados;

-- ✏️Ejercicios HAVING 
-- Encuentra los departamentos con un salario promedio de sus empleados superior a $3,000.
SELECT departamento_id, AVG(salario)
FROM empleados
GROUP BY departamento_id
HAVING AVG(salario) > 3000;

-- Encuentra los productos que se han vendido al menos 5 veces.
SELECT producto_id, COUNT(producto_id)
FROM ventas
GROUP BY producto_id
HAVING COUNT(producto_id) >= 5;

-- Selecciona los empleados que tengan una “o” en su nombre o apellido y agrúpalos por departamento y muestra los que tengan el salario máximo.
SELECT departamento_id, MAX(salario)
FROM empleados
WHERE nombre LIKE "%o%" OR apellido LIKE "%o%"
GROUP BY departamento_id
HAVING MAX(salario) = MAX(salario);

-- ✏️  Actividad: Ejercicios Complementarios
-- ✨ Estos ejercicios son de tipo complementario. Esto quiere decir que te ayudará a avanzar en profundidad en el tema visto, pero no son obligatorios. Te recomendamos intentar con tu equipo trabajar algunos de ellos. 

-- EJERCICIOS CON CLÁUSULA IN
-- Busca los empleados que trabajan en los departamentos 2 o 3.
SELECT *
FROM empleados
WHERE departamento_id IN (2, 3);

-- Trae a los clientes que no tengan los IDs 2, 4 o 6.
SELECT *
FROM clientes
WHERE id NOT IN (2, 4, 6);

-- Busca los productos cuyos precios son 350.00, 480.00 o 800.00.
SELECT *
FROM productos
WHERE precio IN (350, 480, 800);


-- EJERCICIOS CON CLÁUSULA LIKE
-- Busca los empleados cuyos correos electrónicos terminan en "mail.com".
SELECT *
FROM empleados
WHERE correo_electronico LIKE '%mail.com';

-- Encuentra los productos cuyos nombres tengan exactamente 6 caracteres.
SELECT *
FROM productos
WHERE LENGTH(nombre) = 6;

-- Busca los clientes cuyos nombres tengan una "a" en la tercera posición 
SELECT *
FROM clientes
WHERE nombre LIKE '__a%';

-- EJERCICIOS CON CLÁUSULA ORDER BY
-- Ordena los clientes por nombre de manera ascendente y luego por dirección de manera descendente.
SELECT *
FROM clientes
ORDER BY nombre ASC, direccion DESC;

-- Ordena los empleados por fecha_contratación de manera descendente.
SELECT *
FROM empleados
ORDER BY fecha_contratacion DESC;

-- Ordena los productos por precio de manera ascendente.
SELECT *
FROM productos
ORDER BY precio ASC;


-- EJERCICIOS CON FUNCIÓN MAX()
-- Encuentra el precio máximo de un producto.
SELECT MAX(precio)
FROM productos;

-- Encuentra el monto total máximo de una venta.
SELECT MAX(monto_total)
FROM ventas;

-- Encuentra el ID de cliente con el valor máximo.
SELECT MAX(id)
FROM clientes;

-- EJERCICIOS CON FUNCIÓN MIN()
-- Encuentra el precio mínimo de un producto.
SELECT MIN(precio)
FROM productos;

-- Encuentra el monto total mínimo de una venta.
SELECT MIN(monto_total)
FROM ventas;

-- Encuentra el ID de cliente con el valor mínimo.
SELECT MIN(id)
FROM clientes;

-- EJERCICIOS CON FUNCIÓN  COUNT()
-- Cuenta cuántos clientes tienen la palabra "López" en su nombre.
SELECT COUNT(*)
FROM clientes
WHERE nombre LIKE '%López%';

-- Cuenta cuántas ventas fueron realizadas por el empleado con el id 9 .
SELECT COUNT(*)
FROM ventas
WHERE empleado_id = 9;

-- Cuenta cuántos productos tienen un nombre que contiene la palabra "Digital".
SELECT COUNT(*)
FROM productos
WHERE nombre LIKE '%Digital%';

-- EJERCICIOS CON FUNCIÓN  SUM()
-- Calcula la suma de cantidades de productos vendidos por empleado.
SELECT empleado_id, SUM(cantidad)
FROM ventas
GROUP BY empleado_id;

-- Calcula la suma de salarios de empleados en el Departamento 1.
SELECT SUM(salario)
FROM empleados
WHERE departamento_id = 1;

-- Calcula la suma de precios de productos vendidos al cliente con id 2.
SELECT SUM(precio_unitario)
FROM ventas
WHERE cliente_id = 2;

-- EJERCICIOS CON FUNCIÓN  AVG()
-- Calcula el precio promedio de productos con un precio superior a $200.
SELECT AVG(precio)
FROM productos
WHERE precio > 200;

-- Calcula el salario promedio de los empleados en el Departamento 1.
SELECT AVG(salario)
FROM empleados
WHERE departamento_id = 1;

-- Calcula la cantidad promedio de productos vendidos por empleado.
SELECT empleado_id, AVG(cantidad)
FROM ventas
GROUP BY empleado_id;

-- EJERCICIOS CON FUNCIÓN  GROUP BY()
-- Agrupa las ventas por cliente y muestra el monto total gastado por cada cliente.
SELECT cliente_id, SUM(monto_total)
FROM ventas
GROUP BY cliente_id;

-- Encuentra el salario máximo por departamento.
SELECT departamento_id, MAX(salario)
FROM empleados
GROUP BY departamento_id;

-- Encuentra el salario mínimo por departamento.
SELECT departamento_id, MIN(salario)
FROM empleados
GROUP BY departamento_id;

-- Obtén la suma total de salarios por departamento.
SELECT departamento_id, SUM(salario)
FROM empleados
GROUP BY departamento_id;

-- Encuentra la cantidad total de productos vendidos por empleado.
SELECT empleado_id, SUM(cantidad)
FROM ventas
GROUP BY empleado_id;

-- EJERCICIOS CON FUNCIÓN  HAVING()
-- Encuentra los departamentos con al menos 2 empleados con una edad menor de 30 años.
SELECT departamento_id
FROM empleados
WHERE edad < 30
GROUP BY departamento_id
HAVING COUNT(*) >= 2;

-- Muestra los clientes que han gastado más de $2,000 en total en compras.
SELECT cliente_id, SUM(monto_total)
FROM ventas
GROUP BY cliente_id
HAVING total_gastado > 2000;

-- EJERCICIOS CON FUNCIÓN  AS()
-- Crea una consulta que muestre la edad de los empleados junto con la edad aumentada en 5 años y que esta nueva columna se llame “Edad en 5 años”.
SELECT edad, (edad + 5) AS "Edad en 5 años"
FROM empleados;

-- Muestra el monto total de ventas junto con el monto total aumentado en un 21%  y que esta nueva columna se llame “Precio + IVA”.
SELECT monto_total, (monto_total * 1.21) AS "Precio + IVA"
FROM ventas;

-- Crea una consulta que muestre el nombre del producto y su precio unitario precedido con el signo “$ ” y que esta nueva columna se llame “precio con formato”.
SELECT nombre, CONCAT('$ ', precio) AS "precio con formato"
FROM productos;

-- EJERCICIOS CON FUNCIÓN  LIMIT()
-- Muestra los 5 clientes con los IDs más bajos.
SELECT *
FROM clientes
ORDER BY id ASC
LIMIT 5;

-- Muestra los 3 productos más vendidos.
SELECT producto_id, SUM(cantidad) AS total_vendido
FROM ventas
GROUP BY producto_id
ORDER BY total_vendido DESC
LIMIT 3;

-- Muestra los 5 empleados más jóvenes.
SELECT *
FROM empleados
ORDER BY edad ASC
LIMIT 5;

-- EJERCICIOS CON FUNCIÓN  CASE()
-- Crea una consulta que muestre el nombre de los productos y los categorice como "Laptop" si el nombre contiene la palabra "Laptop", "Teléfono" si contiene la palabra "Teléfono", y "Otros" en otros casos.
SELECT 
	nombre, 
    CASE 
        WHEN nombre LIKE '%Laptop%' THEN 'Laptop'
        WHEN nombre LIKE '%Teléfono%' THEN 'Teléfono'
        ELSE 'Otros'
    END AS categoria
FROM productos;

-- Crea una consulta que muestre el ID del producto y los clasifique en categorías según la cantidad total de ventas de cada producto en la tabla 'ventas'. Utilizando una instrucción 'CASE', establece las siguientes categorías: 
-- Si la suma de la cantidad de ventas (SUM(cantidad)) es mayor o igual a 9, la categoría es 'Alto Volumen'. 
-- Si la suma de la cantidad de ventas está entre 4 y 8 (inclusive), la categoría es 'Medio Volumen'.
-- En otros casos, la categoría es 'Bajo Volumen'.
-- Recuerda agrupar por producto_id y mostrar el resultado en orden descendente por la suma de la cantidad de ventas.
SELECT 
	producto_id, 
    SUM(cantidad) AS total_ventas,
    CASE 
        WHEN SUM(cantidad) >= 9 THEN 'Alto Volumen'
        WHEN SUM(cantidad) BETWEEN 4 AND 8 THEN 'Medio Volumen'
        ELSE 'Bajo Volumen'
    END AS categoria
FROM ventas
GROUP BY producto_id
ORDER BY total_ventas DESC;

-- Crea una consulta que muestre el ID de la venta y los categorice como "Venta pequeña" si el monto total es menor que $500, "Venta mediana" si es mayor o igual a $500 y menor que $1500, y "Venta grande" en otros casos.
SELECT 
	id, monto_total,
    CASE 
        WHEN monto_total < 500 THEN 'Venta pequeña'
        WHEN monto_total >= 500 AND monto_total < 1500 THEN 'Venta mediana'
        ELSE 'Venta grande'
    END AS categoria
FROM ventas;

-- Crea una consulta que muestre el nombre de los clientes y los categorice como "Dirección larga" si la longitud de su dirección es mayor o igual a 30 caracteres, "Dirección mediana" si es mayor o igual a 20 y menor que 30 caracteres, y "Dirección corta" en otros casos.
SELECT 
	nombre, 
    CASE 
        WHEN LENGTH(direccion) >= 30 THEN 'Dirección larga'
        WHEN LENGTH(direccion) BETWEEN 20 AND 29 THEN 'Dirección mediana'
        ELSE 'Dirección corta'
    END AS categoria
FROM clientes;

-- Crea una consulta que muestre el nombre de los empleados y los categorice como "Ventas" si pertenecen al departamento 1, "Recursos Humanos" si pertenecen al departamento 2, y "Contabilidad"  si pertenecen al departamento 3.
SELECT 
	nombre, 
    CASE 
        WHEN departamento_id = 1 THEN 'Ventas'
        WHEN departamento_id = 2 THEN 'Recursos Humanos'
        WHEN departamento_id = 3 THEN 'Contabilidad'
        ELSE 'Otro'
    END AS categoria
FROM empleados;

-- Crea una consulta que muestre el nombre de los productos y los categorice de la siguiente manera:
-- Si el nombre del producto está en la lista ('Laptop', 'Reloj de Pulsera Inteligente', 'Reproductor de Blu-ray', 'Auriculares Bluetooth', 'Smart TV 55 Pulgadas', 'Cámara Digital', 'Impresora', 'Tablet', 'Teléfono móvil') y el precio es mayor o igual a 1000, la categoría es 'Tecnología cara'.
-- Si el nombre del producto está en la lista anterior y el precio está entre 500 y 999 (inclusive), la categoría es 'Tecnología gama media'.
-- Si el nombre del producto está en la lista anterior y el precio es menor a 500, la categoría es 'Tecnología barata'.
-- Si el precio es mayor o igual a 1000 y el nombre del producto no está en la lista, la categoría es 'Caro'.
-- Si el precio está entre 500 y 999 (inclusive) y el nombre del producto no está en la lista, la categoría es 'Medio'.
-- Si el precio es menor a 500 y el nombre del producto no está en la lista, la categoría es 'Barato'.
SELECT 
	nombre, precio,
    CASE 
		WHEN nombre IN ('Laptop', 'Reloj de Pulsera Inteligente', 'Reproductor de Blu-ray', 
                        'Auriculares Bluetooth', 'Smart TV 55 Pulgadas', 'Cámara Digital', 
                        'Impresora', 'Tablet', 'Teléfono móvil') AND precio >= 1000 
						THEN 'Tecnología cara'
		WHEN nombre IN ('Laptop', 'Reloj de Pulsera Inteligente', 'Reproductor de Blu-ray', 
                        'Auriculares Bluetooth', 'Smart TV 55 Pulgadas', 'Cámara Digital', 
                        'Impresora', 'Tablet', 'Teléfono móvil') AND precio BETWEEN 500 AND 999 
						THEN 'Tecnología gama media'
		WHEN nombre IN ('Laptop', 'Reloj de Pulsera Inteligente', 'Reproductor de Blu-ray', 
                        'Auriculares Bluetooth', 'Smart TV 55 Pulgadas', 'Cámara Digital', 
                        'Impresora', 'Tablet', 'Teléfono móvil') AND precio < 500 
                        THEN 'Tecnología barata'
		WHEN precio >= 1000 THEN 'Caro'
		WHEN precio BETWEEN 500 AND 999 THEN 'Medio'
		ELSE 'Barato'
	END AS categoria
FROM productos;
