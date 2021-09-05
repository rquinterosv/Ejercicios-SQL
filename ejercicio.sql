CREATE TABLE Directorio_telefonico(
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25),
    numero_telefonico VARCHAR(8) UNIQUE,
    direccion VARCHAR(225),
    edad INT
    PRIMARY EY (numero_telefonico)
);

CREATE TABLE Agenda(
    nick VARCHAR(25) NOT NULL,
    numero_telefonico VARCHAR(8) UNIQUE,
    FORGEIN JEY (numero_telefonico) REFERENCE Directorio_telefonico(numero_telefonico)
);

-- ApaRA INTRODUCIR DATOS DEBERMOS PONER 
INSERT INTO Directorio_telefonico (nombre, apellido, numero_telefonico, direccion, edad) VALUES ('Juan', 'Perez', '12345678', 'Villa Pajaritos', 21);

INSERT INTO Agenda (nick, numero_telefonico) VALUES ('Juanito', '12345678';)

-- Para modificar una dato 
UPDATE Directorio_telefonico SET direccion = 'Villa los Leones' WHERE nombre = 'Juan';
SELECT * FROM direccion WHERE nombre = 'Juan';

-- PARA ELIMINAR SOLO LOS DATOS DE LA TABLA
TRUCATE TALE Agenda;

-- Para Eliminar 

DELETE FROM Directorio_telefonico WHERE nombre = 'Juan';

-- AÑADIR COLUMNA
ALTER TABLE Agenda 
Add nota CARCHAR(100);
-- SI LA QUEREMOS BORRAR 
ALTER TABLE Agenda DROP nota;