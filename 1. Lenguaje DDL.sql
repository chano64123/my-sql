-- Crea una base de datos con el nombre mi_bd
CREATE DATABASE mi_bd;

USE mi_bd;

-- Crea una tabla “empleados” en la base de datos creada con antelación (llamada  mi_bd) con las siguientes columnas y definiciones de tipo:
-- id: Un número entero (INT) que sirve como clave primaria y se incrementa automáticamente (AUTO_INCREMENT).
-- nombre: Una cadena de texto (VARCHAR) que almacena el nombre del empleado con una longitud máxima de 50 caracteres.
-- apellido: Una cadena de texto (VARCHAR) que almacena el apellido del empleado con una longitud máxima de 50 caracteres.
-- edad: Un número entero (INT) que almacena la edad del empleado.
-- salario: Un número decimal (DECIMAL) que almacena el salario del empleado con un máximo de 10 dígitos en total y 2 decimales.
-- fecha_contratacion: Una fecha (DATE) que almacena la fecha en que el empleado fue contratado.

CREATE TABLE Empleados(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  edad INT,
  salario DECIMAL(10, 2),
  fecha_contratacion DATE
);
