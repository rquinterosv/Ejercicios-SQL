-- BORRAR DATOS ANTERIORES 
DROP TABLE pizzeria;

-- Creamos una base de datos 
CREATE DATABASE pizzeria; 
\c pizzeria;

CREATE TABLE pizzas(
    id INT, 
    stock INT CHECK (stock >= 0.00),
    costo DECIMAL,
    nombre VARCHAR(25),
    PRIMARY KEY(id)
);

CREATE TABLE ventas(
    cliente VARCHAR(20),
    fecha DATE,
    monto DECIMAL,
    pizza INT,
    FOREIGN KEY(pizza) REFERENCES pizzas(id)
);

-- Creamos pizza con stock inicial en 0
INSERT INTO pizzas (id, stock, costo, nombre)
VALUES (1, 0, 12000, 'Uhlalá');

-- transaccion para crear otra pizza con stock positivo 
BEGIN;
INSERT INTO pizzas(id, stock,costo, nombre)
VALUES (2, 2, 15000, 'Jamon a todo dar');
COMMIT;

-- Realizamos transaccion para comprar pizzas sin stock
BEGIN;
INSERT INTO ventas (cliente, fecha, monto, pizza)
VALUES ('Dexter Gonzales', '2020-02-02', 1200, 1);
UPDATE pizzas SET stock = stock -1 WHERE id=1;
COMMIT;

-- Compraremos una pizza de cada una y si llega a faltar volveremos a un punto de guardado
BEGIN;
INSERT INTO ventas (cliente, fecha, monto, pizza)
VALUES ('Juan Bravo', '2020-02-02', 1500, 2);
UPDATE pizza set stock = stock -1 WHERE id = 2;
SAVEPOINT checkpoint;
INSERT INTO ventas (cliente, fecha, monto, pizza)
VALUES ('Utonio Ramirez', '2020-02-02', 12000, 1);
UPDATE pizzas SET stock = stock - 1 WHERE id = 1;
ROLLBACK TO SAVEPOINT checkpoint;
COMMIT;

SELECT * FROM ventas;