CREATE DATABASE ecommerce_db;
USE ecommerce_db;
SHOW tables;

-- Tabla Cliente (id_cliente, nombre, correo, telefono)

CREATE TABLE Clientes (
	id_cliente INT PRIMARY KEY auto_increment,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    telefono VARCHAR(50)
);

-- Tabla Productos (id_productos, nombre, precio, stock)

CREATE TABLE Productos (
	id_producto INT PRIMARY KEY auto_increment,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    stock INT
);

-- Tabla Compras (id_compra, id_cliente, id_producto, cantidad, fecha)
CREATE TABLE Compras (
   id_compra INT PRIMARY KEY auto_increment,
   id_cliente INT,
   id_producto INT,
   cantidad INT,
   fecha DATE,
   foreign key(id_cliente) REFERENCES Clientes(id_cliente),
   foreign key(id_producto) REFERENCES Productos(id_producto)
);


-- INSERTAR CLIENTES

INSERT INTO Clientes (nombre, correo, telefono) VALUES 
('Elon Musk', 'elonmusk@mail.com', '1002003001'),
('Bill Gates', 'billgates@mail.com', '1002003002'),
('Steve Jobs', 'stevejobs@mail.com', '1002003003'),
('Mark Zuckerberg', 'markzuckerberg@mail.com', '1002003004'),
('Jeff Bezos', 'jeffbezos@mail.com', '1002003005'),
('Larry Page', 'larrypage@mail.com', '1002003006'),
('Sergey Brin', 'sergeybrin@mail.com', '1002003007'),
('Tim Cook', 'timcook@mail.com', '1002003008'),
('Sundar Pichai', 'sundarpichai@mail.com', '1002003009'),
('Sheryl Sandberg', 'sherylsandberg@mail.com', '1002003010'),
('Marissa Mayer', 'marissamayer@mail.com', '1002003011'),
('Susan Wojcicki', 'susanwojcicki@mail.com', '1002003012'),
('Satya Nadella', 'satyanadella@mail.com', '1002003013'),
('Jack Dorsey', 'jackdorsey@mail.com', '1002003014'),
('Reed Hastings', 'reedhastings@mail.com', '1002003015');


-- INSERTAR PRODUCTOS

INSERT INTO Productos (nombre, precio, stock) VALUES 
('Notebook Modelo A', 1200.00, 15),
('Notebook Modelo B', 1500.00, 10),
('Tablet Modelo X', 300.00, 20),
('Tablet Modelo Y', 350.00, 18),
('Celular Modelo S', 800.00, 25),
('Celular Modelo T', 750.00, 30),
('Smartwatch Modelo Q', 200.00, 40),
('Smartwatch Modelo R', 250.00, 35),
('Cámara Digital Modelo G', 500.00, 20),
('Cámara Digital Modelo H', 450.00, 22),
('Auriculares Inalámbricos', 100.00, 50),
('Teclado Inalámbrico', 40.00, 40),
('Mouse Inalámbrico', 30.00, 45),
('Monitor 27 Pulgadas', 300.00, 20),
('Monitor 32 Pulgadas', 400.00, 15),
('Impresora 3D Modelo D', 700.00, 10),
('Impresora Láser Modelo F', 250.00, 15),
('Router Inalámbrico', 120.00, 30),
('Disco Duro Externo 1TB', 80.00, 40),
('Memoria USB 128GB', 25.00, 60);

-- COMPRAS

INSERT INTO Compras (id_cliente, id_producto, cantidad, fecha) VALUES
(1, 1, 2, '2024-01-01'),
(2, 3, 1, '2024-01-03'),
(3, 2, 1, '2024-01-05'),
(4, 5, 3, '2024-01-07'),
(5, 4, 1, '2024-01-09'),
(1, 3, 2, '2024-01-11'),
(2, 2, 1, '2024-01-13'),
(3, 1, 1, '2024-01-15'),
(4, 4, 2, '2024-01-17'),
(5, 5, 1, '2024-01-19'),
(1, 2, 3, '2024-01-21'),
(2, 3, 2, '2024-01-23'),
(3, 4, 1, '2024-01-25'),
(4, 1, 2, '2024-01-27'),
(5, 2, 1, '2024-01-29'),
(1, 5, 3, '2024-01-31'),
(2, 4, 2, '2024-02-02'),
(3, 3, 1, '2024-02-04'),
(4, 2, 1, '2024-02-06'),
(5, 1, 2, '2024-02-08');

-- SELECT TABLA COMPRA

SELECT * FROM Compras;
-- GROUP BY, AVG, HAVING, INNER JOIN
-- UPDATE (ACTUALIZAR)
UPDATE Clientes SET correo = 'elonmusk@tesla.com' WHERE id_cliente = 1;

-- DELETE
DELETE FROM Clientes WHERE id_cliente = 8;

-- Ejemplo de consultas
-- GROUP BY (Agrupar compras por cliente)

SELECT id_cliente, COUNT(*) AS numero_compras FROM Compras group by id_cliente;

-- INNER JOIN "NUMERO DE COMPRAS CON NOMBRE DE CLIENTE"
SELECT 
Clientes.id_cliente, 
Clientes.nombre, 
COUNT(*) AS numero_compras 
FROM Compras 
INNER JOIN Clientes ON Compras.id_cliente = Clientes.id_cliente 
group by Clientes.id_cliente;

-- AVG (PROMEDIO "PRECIOS DE PRODUCTOS")

SELECT AVG(precio) as promedio_precios FROM Productos;


-- HAVING (FILTRO VA ACOMPAÑADO DEL GROUP BY)
SELECT id_cliente FROM Compras group by id_cliente HAVING COUNT(*) > 5;