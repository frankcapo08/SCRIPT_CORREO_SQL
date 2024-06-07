-- crear la base de datos
CREATE DATABASE CORREO_ANDREANI;

-- usar la base de datos
USE CORREO_ANDREANI;

-- crear la tabla sucursales
CREATE TABLE SUCURSALES (
    SUC_ID INT AUTO_INCREMENT, 
    SUC_NOMBRE VARCHAR(100) NOT NULL,
    SUC_DIRRECION VARCHAR(255) NOT NULL,
    PRIMARY KEY (SUC_ID)
);

-- crear la tabla clientes
CREATE TABLE CLIENTES (
CLI_ID INT AUTO_INCREMENT,
CLI_NOMBRE VARCHAR(100) NOT NULL,
CLI_APELLIDO VARCHAR(100) NOT NULL,
CLI_TELEFONO VARCHAR(20),
PRIMARY KEY (CLI_ID)
);

-- crear la tabla encomiendas
CREATE TABLE ENCOMIENDAS (
 ENC_ID INT AUTO_INCREMENT,
 ENC_DESCRIPCION VARCHAR(255) NOT NULL,
 ENC_FECHA_ENVIO DATE NOT NULL,
 ENC_ESTADO VARCHAR(50) NOT NULL,
 ENC_SUC_ID INT,
 ENC_CLI_ID INT,
 PRIMARY KEY (ENC_ID),
 FOREIGN KEY (ENC_SUC_ID) REFERENCES SUCURSALES(SUC_ID),
 FOREIGN KEY (ENC_CLI_ID) REFERENCES CLIENTES(CLI_ID)
);


-- insertar datos en la tabla sucursales
INSERT INTO SUCURSALES (SUC_NOMBRE, SUC_DIRRECION) VALUES
('Sucursal Bolivar', 'Alvarado 587'),
('Sucursal Olavarria', 'Dorrego 1050'),
('Sucursal Azul', 'Constitucion 245');

--insertar datos en la tabla Clientes
INSERT INTO CLIENTES (CLI_NOMBRE, CLI_APELLIDO, CLI_TELEFONO) VALUES
('Maria', 'Antonieta', '2345-452413'),
('Fernando', 'Code', '4524-546544'),
('Loana', 'Andrada', '5426-754521');

--insertar datos en la tabla encomiendas
INSERT INTO ENCOMIENDAS (ENC_DESCRIPCION, ENC_FECHA_ENVIO, ENC_ESTADO, ENC_SUC_ID, ENC_CLI_ID) VALUES
('Paquete de Celulares', '2024-05.10', 'En transito', 1,1),
('Paquete de Cubiertas', '2024-05-30', 'Entregado', 2,2);

-- estructura de consulta select

SELECT * FROM ENCOMIENDAS;

+--------+----------------------+-----------------+-------------+------------+------------+
| ENC_ID | ENC_DESCRIPCION      | ENC_FECHA_ENVIO | ENC_ESTADO  | ENC_SUC_ID | ENC_CLI_ID |
+--------+----------------------+-----------------+-------------+------------+------------+
|      1 | Paquete de Celulares | 2024-05-10      | En transito |          1 |          1 |
|      2 | Paquete de Cubiertas | 2024-05-30      | Entregado   |          2 |          2 |
+--------+----------------------+-----------------+-------------+------------+------------+

 SELECT ENC_ID, ENC_DESCRIPCION FROM ENCOMIENDAS;

 +--------+----------------------+
| ENC_ID | ENC_DESCRIPCION      |
+--------+----------------------+
|      1 | Paquete de Celulares |
|      2 | Paquete de Cubiertas |
+--------+----------------------+

 SELECT ENC_DESCRIPCION FROM ENCOMIENDAS;

 +----------------------+
| ENC_DESCRIPCION      |
+----------------------+
| Paquete de Celulares |
| Paquete de Cubiertas |
+----------------------+

 SELECT ENC_ID, ENC_DESCRIPCION FROM ENCOMIENDAS WHERE ENC_ID = 1

 +--------+----------------------+
| ENC_ID | ENC_DESCRIPCION      |
+--------+----------------------+
|      1 | Paquete de Celulares |
+--------+----------------------+

--estructura de consulta Update

UPDATE ENCOMIENDAS SET ENC_DESCRIPCION = 'Paquete Prioritario' WHERE ENC_ID = 1;

+--------+---------------------+
| ENC_ID | ENC_DESCRIPCION     |
+--------+---------------------+
|      1 | Paquete Prioritario |
+--------+---------------------+

--estructura de la consulta delete
--'eliminar una encomienda especifica de la tabla basadas en los estados de envio'
DELETE FROM ENCOMIENDAS WHERE ENC_ESTADO = 'EN TRANSITO';

+--------+----------------------+-----------------+------------+------------+------------+
| ENC_ID | ENC_DESCRIPCION      | ENC_FECHA_ENVIO | ENC_ESTADO | ENC_SUC_ID | ENC_CLI_ID |
+--------+----------------------+-----------------+------------+------------+------------+
|      2 | Paquete de Cubiertas | 2024-05-30      | Entregado  |          2 |          2 |
+--------+----------------------+-----------------+------------+------------+------------+

--eliminar todos los registros de la tabla encomiendas

DELETE FROM ENCOMIENDAS;

--consulta insert
--insertamos la tabla eliminada en el delete

 INSERT INTO ENCOMIENDAS (ENC_DESCRIPCION, ENC_FECHA_ENVIO, ENC_ESTADO, ENC_SUC_ID, ENC_CLI_ID, ENC_ID) VALUES

('Paquete de Celulares', '2024-05.10', 'En transito', 1,1,1);

+--------+----------------------+-----------------+-------------+------------+------------+
| ENC_ID | ENC_DESCRIPCION      | ENC_FECHA_ENVIO | ENC_ESTADO  | ENC_SUC_ID | ENC_CLI_ID |
+--------+----------------------+-----------------+-------------+------------+------------+
|      1 | Paquete de Celulares | 2024-05-10      | En transito |          1 |          1 |
|      2 | Paquete de Cubiertas | 2024-05-30      | Entregado   |          2 |          2 |
+--------+----------------------+-----------------+-------------+------------+------------+










