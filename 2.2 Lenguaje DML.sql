-- Instrucción INSERT INTO (Inserción de Datos): La instrucción INSERT INTO se utiliza para agregar nuevos registros o filas a una tabla existente en la base de datos. 
-- INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Juan', 'Pérez', 30, 2500.50);
INSERT INTO empleados (nombre, apellido, edad, salario)
VALUES ('Juan', 'Pérez', 30, 2500.50);

-- Instrucción UPDATE (Actualización de Datos):La instrucción UPDATE se utiliza para modificar los valores de uno o más registros en una tabla existente. Las cláusulas clave asociadas con esta instrucción son:
-- UPDATE empleados SET salario = 2700.00 WHERE nombre = 'Juan';
UPDATE empleados SET salario = 2700.00
WHERE nombre = 'Juan';

-- Instrucción DELETE (Eliminación de Datos): La instrucción DELETE se utiliza para eliminar registros de una tabla existente. Las cláusulas clave son:
-- DELETE FROM empleados WHERE nombre = 'Juan';
DELETE
FROM empleados
WHERE nombre = 'Juan';

-- Instrucción SELECT (Consulta de Datos): La instrucción SELECT es esencial para recuperar y poder visualizar datos de una o varias tablas en una base de datos. Las cláusulas clave incluyen:
-- SELECT nombre, salario FROM empleados WHERE edad > 25;
SELECT nombre, salario
FROM empleados
WHERE edad > 25;

-- Inserta un departamento llamado "Ventas" en la tabla "departamentos".
INSERT INTO departamentos (nombre)
VALUES('Ventas');

-- Inserta un departamento llamado "Recursos Humanos" en la tabla "departamentos".
INSERT INTO departamentos (nombre)
VALUES('Recursos Humanos');

-- Inserta un empleado en la tabla "empleados" con los siguientes valores:
-- Nombre: Ana
-- Apellido: Rodríguez.
-- Edad: 28.
-- Salario: 3000.00.
-- Correo electrónico: anarodriguez@mail.com
-- departamento_id: (debe coincidir con el ID del departamento "Ventas" que insertaste anteriormente, puedes saber el id haciendo una consulta a la tabla “SELECT * FROM departamentos”).
INSERT INTO empleados (nombre, apellido, edad, salario, correo_electronico, departamento_id)
VALUES ('Ana', 'Rodríguez', 28, 3000, 'anarodriguez@mail.com', 1);

-- Inserta otro empleado en la tabla "empleados" con los siguientes valores:
-- Nombre: Carlos.
-- Apellido: López.
-- Edad: 32.
-- Salario: 3200.50.
-- Correo electrónico: carloslopez@mail.com
-- departamento_id: (debe coincidir con el ID del departamento "Recursos Humanos" que insertaste anteriormente).
INSERT INTO empleados (nombre, apellido, edad, salario, correo_electronico, departamento_id)
VALUES ('Carlos', 'López', 32, 3200.5, 'carloslopez@mail.com', 2);

-- Inserta un empleado en la tabla "empleados" con los siguientes valores:
-- Nombre: Laura
-- Apellido: Pérez
-- Edad: 26
-- Salario: 2800.75
-- Correo electrónico: lauraperez@mail.com
-- departamento_id:  (debe coincidir con el ID del departamento "Ventas" que insertaste anteriormente).
INSERT INTO empleados (nombre, apellido, edad, salario, correo_electronico, departamento_id)
VALUES ('Laura', 'Perez', 26, 2800.75, 'lauraperez@mail.com', 1);

-- Inserta otro empleado en la tabla "empleados" con los siguientes valores:
-- Nombre: Martín
-- Apellido: González
-- Edad: 30
-- Salario: 3100.25
-- Correo electrónico: martingonzalez@mail.com
-- departamento_id: (debe coincidir con el ID del departamento "Recursos Humanos" que insertaste anteriormente).
INSERT INTO empleados (nombre, apellido, edad, salario, correo_electronico, departamento_id)
VALUES ('Martín', 'González', 30, 3100.25, 'martingonzalez@mail.com', 2);

-- Actualiza el salario del empleado con nombre "Ana" para aumentarlo en un 10%.
UPDATE empleados SET salario = salario * 1.1
WHERE nombre = 'Ana';

-- Crea un departamento llamado “Contabilidad”.
INSERT INTO departamentos (nombre) VALUES('Contabilidad');

-- Cambia el departamento del empleado con nombre "Carlos" de "Recursos Humanos" a "Contabilidad":
UPDATE empleados SET departamento_id = 3
WHERE nombre = 'Carlos';

-- Elimina al empleado con nombre "Laura"
DELETE
FROM empleados
WHERE nombre = 'Laura';

-- Haz una consulta simple de los datos de la tabla empleados y verifica que se presente de la siguiente manera:
SELECT *
FROM departamentos;
SELECT *
FROM empleados;