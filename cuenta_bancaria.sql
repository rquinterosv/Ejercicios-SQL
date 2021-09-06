-- transacciones COMMIT
CREATE TABLE cuentas (
    numero_cuenta INTO NOT NULL UNIQUE PRIMARY KEY,
    balance DECIMAL CHECK (BALANCE >= 0.00)
);

INSERT INTO cuentas (numero_cuenta, balance)
VALUES (1, 1000);

INSERT INTO cuentas (numero_cuenta, balance)
VALUES (2, 1000);

SELECT * FROM cuentas;

-- Transferencia con BEGIN TRANSACTION
BEGIN TRANSACTION; 
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
COMMIT; 
SELECT * FROM cuentas;

-- ROLLBACK
BEGIN TRANSACTION; 
UPDATE cuentas SET balance = balance + 1000 WHERE  numero_cuenta = 2; 
UPDATE cuentas SET balance = balance - 1000 WHERE  numero_cuenta = 1;
-- Me arroja un error porque es menor a 0 y me arroja un ROLLBACK

--SAVEPOINT
BEGIN TRANSACTION;
INSERT INTO cuentas(
    (numero_cuenta, balance)
    VALUES (3, 5000)
    );
    SAVEPOINT nueva_cuenta;
-- Transaccion en curso, podemos volver a este punto si algo sale mal, por ejemplo
UPDATE cuentas SET balance = balance + 3000 WHERE numero_cuenta = 3;
UPDATE cuentas SET balance = balance - 3000 WHERE numero_cuenta = 2;
-- El ultimo arroja error y se devuelve a SAVEPOINT, si cerramos ahora no guarda
ROLLBACK TO nueva_cuenta;
COMMIT;
SELECT * FROM cuentas

-- AUTOCOMMIT
\echo :AUTOCOMMIT;
-- on
INSERT INTO cuentas (numero_cuenta, balance)
VALUES (4, 1000);
-- Si ingreso Commit me sale que no hay ninguna transaccion en progreso.
\set AUTOCOMMIT off; 

---PARA RESPALDAR TODAS LAS BASES DE DATOS: pg_dumpall > /directorio/dumpall.sql
