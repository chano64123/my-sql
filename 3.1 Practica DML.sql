-- ✏️Ejercicios DML
-- Inserta un nuevo producto en la tabla "productos" con el nombre "Teléfono móvil" y un precio de 450.00.
INSERT INTO productos (nombre, precio)
VALUES ('Teléfono móvil', 450.00);

-- Inserta un nuevo cliente en la tabla "clientes" con el nombre "María García" y la dirección "Constitución 456, Luján".
INSERT INTO clientes (nombre, direccion)
VALUES ('María García', 'Constitución 456, Luján');

-- Modifica la columna correo_electronico de la tabla empleados para que se genere automáticamente concatenado el nombre, apellido y el string “@mail.com”.
ALTER TABLE empleados
MODIFY correo_electronico VARCHAR(100) GENERATED ALWAYS AS (CONCAT(nombre, apellido, '@mail.com')) STORED;

-- Inserta un nuevo empleado en la tabla "empleados" con el nombre "Luis” y apellido “Fernández", edad 28, salario 2800.00 y que pertenezca al departamento “ventas”.
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES ('Luis', 'Fernández', 28, 2800.00, 1);

-- Actualiza el precio del producto "Laptop" a 1350.00 en la tabla "productos".
UPDATE productos
SET precio = 1350.00
WHERE nombre = 'Laptop';

-- Modifica la dirección del cliente "Juan Pérez" a "Alberti 1789, Mar del Plata" en la tabla "clientes".
UPDATE clientes
SET direccion = 'Alberti 1789, Mar del Plata'
WHERE nombre = 'Juan Pérez';

-- Incrementa el salario de todos los empleados en un 5% en la tabla "empleados".
UPDATE empleados
SET salario = salario * 1.05;

-- Inserta un nuevo producto en la tabla "productos" con el nombre "Tablet" y un precio de 350.00.
INSERT INTO productos (nombre, precio)
VALUES ('Tablet', 350.00);

-- Inserta un nuevo cliente en la tabla "clientes" con el nombre "Ana López" y la dirección "Beltrán 1452, Godoy Cruz".
INSERT INTO clientes (nombre, direccion)
VALUES ('Ana López', 'Beltrán 1452, Godoy Cruz');

-- Inserta un nuevo empleado en la tabla "empleados" con el nombre "Marta", apellido "Ramírez", edad 32, salario 3100.00 y que pertenezca al departamento “ventas”.
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES ('Marta', 'Ramírez', 32, 3100.00, 1);

-- Actualiza el precio del producto "Teléfono móvil" a 480.00 en la tabla "productos".
UPDATE productos
SET precio = 480.00
WHERE nombre = 'Teléfono móvil';

-- Modifica la dirección del cliente "María García" a "Avenida 789, Ciudad del Este" en la tabla "clientes".
UPDATE clientes
SET direccion = 'Avenida 789, Ciudad del Este'
WHERE nombre = 'María García';

-- Incrementa el salario de todos los empleados en el departamento de "Ventas" en un 7% en la tabla "empleados".
UPDATE Empleados
SET salario = salario * 1.07
WHERE departamento_id = 1;

-- Inserta un nuevo producto en la tabla "productos" con el nombre "Impresora" y un precio de 280.00.
INSERT INTO productos (nombre, precio)
VALUES ('Impresora', 280.00);

-- Inserta un nuevo cliente en la tabla "clientes" con el nombre "Carlos Sánchez" y la dirección "Saavedra 206, Las Heras".
INSERT INTO clientes (nombre, direccion)
VALUES ('Carlos Sánchez', 'Saavedra 206, Las Heras');

-- Inserta un nuevo empleado en la tabla "empleados" con el nombre "Lorena", apellido "Guzmán", edad 26, salario 2600.00 y que pertenezca al departamento “ventas”.
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES ('Lorena', 'Guzmán', 26, 2600.00, 1);

-- Haz una consulta simple de los datos de la tabla empleados y verifica que se presente de la siguiente manera:
SELECT * FROM empleados;

-- Haz una consulta simple de los datos de la tabla clientes y verifica que se presente de la siguiente manera:
SELECT * FROM clientes;

-- Haz una consulta simple de los datos de la tabla productos y verifica que se presente de la siguiente manera:
SELECT * FROM productos;

-- ✏️  Actividad: Ejercicios Complementarios
-- ✨ Estos ejercicios son de tipo complementario. Esto quiere decir que te ayudará a avanzar en profundidad en el tema visto, pero no son obligatorios. Te recomendamos intentar con tu equipo trabajar algunos de ellos. 
-- Inserta una venta en la tabla "ventas" donde el cliente "Juan Pérez" compra una "Laptop" con una cantidad de 2 y el vendedor tiene el nombre "Ana" y apellido "Rodríguez".
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, monto_total, empleado_id)
VALUES (
    (SELECT id FROM productos WHERE nombre = 'Laptop'),
    (SELECT id FROM clientes WHERE nombre = 'Juan Pérez'),
    2,
    (SELECT precio FROM productos WHERE nombre = 'Laptop'),
    2 * (SELECT precio FROM productos WHERE nombre = 'Laptop'),
    (SELECT id FROM empleados WHERE nombre = 'Ana' AND apellido = 'Rodríguez')
);

-- Inserta una venta en la tabla "ventas" donde el cliente "María García" compra un "Teléfono móvil" con una cantidad de 3 y el vendedor tiene el nombre "Carlos" y apellido "López".
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, monto_total, empleado_id)
VALUES (
    (SELECT id FROM productos WHERE nombre = 'Teléfono móvil'),
    (SELECT id FROM clientes WHERE nombre = 'María García'),
    3,
    (SELECT precio FROM productos WHERE nombre = 'Teléfono móvil'),
    3 * (SELECT precio FROM productos WHERE nombre = 'Teléfono móvil'),
    (SELECT id FROM empleados WHERE nombre = 'Carlos' AND apellido = 'López')
);

-- Crea una venta en la tabla "ventas" donde el cliente "Carlos Sánchez" compra una "Impresora" con una cantidad de 1 y el vendedor tiene el nombre "Marta" y apellido "Ramírez".
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, monto_total, empleado_id)
VALUES (
    (SELECT id FROM productos WHERE nombre = 'Impresora'),
    (SELECT id FROM clientes WHERE nombre = 'Carlos Sánchez'),
    1,
    (SELECT precio FROM productos WHERE nombre = 'Impresora'),
    1 * (SELECT precio FROM productos WHERE nombre = 'Impresora'),
    (SELECT id FROM empleados WHERE nombre = 'Marta' AND apellido = 'Ramírez')
);

-- Inserta una venta en la tabla "ventas" donde el cliente "Ana López" compra una "Laptop" con una cantidad de 1 y el vendedor tiene el nombre "Carlos" y apellido "López".
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, monto_total, empleado_id)
VALUES (
    (SELECT id FROM productos WHERE nombre = 'Laptop'),
    (SELECT id FROM clientes WHERE nombre = 'Ana López'),
    1,
    (SELECT precio FROM productos WHERE nombre = 'Laptop'),
    1 * (SELECT precio FROM productos WHERE nombre = 'Laptop'),
    (SELECT id FROM empleados WHERE nombre = 'Carlos' AND apellido = 'López')
);

-- Crea una venta en la tabla "ventas" donde el cliente "Juan Pérez" compra una "Tablet" con una cantidad de 2 y el vendedor tiene el nombre "Luis" y apellido "Fernández".
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, monto_total, empleado_id)
VALUES (
    (SELECT id FROM productos WHERE nombre = 'Tablet'),
    (SELECT id FROM clientes WHERE nombre = 'Juan Pérez'),
    2,
    (SELECT precio FROM productos WHERE nombre = 'Tablet'),
    2 * (SELECT precio FROM productos WHERE nombre = 'Tablet'),
    (SELECT id FROM empleados WHERE nombre = 'Luis' AND apellido = 'Fernández')
);

-- Inserta una venta en la tabla "ventas" donde el cliente "María García" compra un "Teléfono móvil" con una cantidad de 1 y el vendedor tiene el nombre "Marta" y apellido "Ramírez".
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, monto_total, empleado_id)
VALUES (
    (SELECT id FROM productos WHERE nombre = 'Teléfono móvil'),
    (SELECT id FROM clientes WHERE nombre = 'María García'),
    1,
    (SELECT precio FROM productos WHERE nombre = 'Teléfono móvil'),
    1 * (SELECT precio FROM productos WHERE nombre = 'Teléfono móvil'),
    (SELECT id FROM empleados WHERE nombre = 'Marta' AND apellido = 'Ramírez')
);

-- Crea una venta en la tabla "ventas" donde el cliente "Carlos Sánchez" compra una "Impresora" con una cantidad de 2 y el vendedor tiene el nombre "Lorena" y apellido "Guzmán".
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, monto_total, empleado_id)
VALUES (
    (SELECT id FROM productos WHERE nombre = 'Impresora'),
    (SELECT id FROM clientes WHERE nombre = 'Carlos Sánchez'),
    2,
    (SELECT precio FROM productos WHERE nombre = 'Impresora'),
    2 * (SELECT precio FROM productos WHERE nombre = 'Impresora'),
    (SELECT id FROM empleados WHERE nombre = 'Lorena' AND apellido = 'Guzmán')
);

-- Haz una consulta simple de los datos de la tabla ventas y verifica que se presente de la siguiente manera:
SELECT * FROM ventas;
