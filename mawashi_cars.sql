CREATE DATABASE mawashicars;

\c mawashicars;

CREATE TABLE Autos(
    id INT,
    marca VARCHAR(25),
    moldelo VARCHAR(25),
    año VARCHAR(4),
    color VARCHAR(25),
    PRIMARY KEY(id)
);

CREATE TABLE Ventas(
    fecha VARCHAR(20),
    id_auto INT,
    cliente VARCHAR(25),
    referencia INT,
    cantidad FLOAT,
    FORGEIN KEY (id_auto) REFERENCE Autos(id)
);

\copy AUTOS FROM 'autos.csv' csv header;

-- Bloque 2
SELECT a marca AS mar a.model AS mod, a.color AS c FROM Autos AS a;

INSERT INTO Ventas (FECHA, id_auto,) cliente, referencia, cantidad) VALUES ('2019*02*20', 2, 'Alexander Cell', 54322, 2000000);
INSERT INTO Ventas (FECHA, id_auto,) cliente, referencia, cantidad) VALUES ('2009-03-14', 3, 'Katherine Smith', 12325, 1500000);

--sumar cantidad

SELECT SUM(cantidad) AS total FROM Ventas;
ALTER TABLE Autos ADD precio FLOAT;


INSERT INTO Autos (ud, marca, modelo, año, color, precio) VALUES (5, 'ferrari', 'Sport', '2002', 'Blanco', 5000000);

-- bloque 3 
-- cambiar precios 

UPDATE Autos SET precio= 15000000 WHERE id=1;
UPDATE Autos SET precio= 15000000 WHERE id=2;
UPDATE Autos SET precio= 20000000 WHERE id=3;
UPDATE Autos SET precio= 15000000 WHERE id=4;
UPDATE Autos SET precio= 15000000 WHERE id=5;

-- Agrupar cuantos autos por precios 
SELECT precio, COUNT(*) FROM Autos GROUP BY precio;

-- ordenar por precios 
SELECT * FROM Autos BY precio ASC;

-- ¿Para que crear INDEX?
CREATE INDEX index_id_auto ON Ventas(id_auto);
CREATE INDEX index_id ON Autos(id);
