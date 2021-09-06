-- para partir una bd
-- psql -d template1


CREATE TABLE pokemones(
    pokedex INT,
    nombre VARCHAR(10),
    tipo1 VARCHAR(10),
    tipo2 VARCHAR(10)
    PRIMARY KEY(pokedex) 
);

CREATE TABLE mis_pokemones(
    pokedex INT,
    fecha_captura DATE,
    lugar VARCHAR(20),
    huevo BOOLEAN,
    peso FLOAT,
    estatura FLOAT,,
    FOREIGN KEY (pokedex) REFERENCES Pokemones(pokedex)
);

-- PARA IMPORTAR DESDE UN ARCHIVO CSV
\copy Pokemones FROM 'pokemonesRafa.csv' csv header;
\copy Mis_Pokemones FROM 'mis_pokemones.csv' csv header;

-- PARA CONSULTAR EN LA TABLE SE PUEDE OCUPAR:
SELECT * FROM Pokemones WHERE tipo1 = 'fuego';
SELECT pkm.nombre AS n pkm.pokedex AS pkd FROM pokemones AS.pkm;
-- LENGTH SUM COUNT
SELECT nombre, LENGTH(nombre) AS largo_del_nombre FROM pokemons LIMIT(10);
SELECT SUM(LENGTH(nombre)) AS suma_de_nombre FROM pokemones
SELECT COUNT(pokedex) AS total WHERE tipo1= 'agua' tipo2 = 'agua';

--PARA ORDENAR LA TABLA 
SELECT * FROM pokemones     ORDER BY nombre DESC;

-- PARA CREAR UN INDICE 
CREATE INDEX index_pokemon_nombre ON pokemones(nombre);
SELECT * FROM pg_indexes WHERE tablename = 'pokemones';
DROP INDEX index_pokemon_nombre;

---------- Relaciones y operaciones en videojuego
SELECT * FROM pokemones INNER JOIN mis_pokemones ON pokemones.pokedex = mis_pokemones.pokedex ORDER BY nombre;
--LEFTJOIN 

SELECT * FROM pokemones LEFT JOIN mis_pokemones ON pokemones.pokedex=mis_pokemones.pokedex ORDER BY nombre;
--LEFTJOIN a partir de condiciones 

SELECT * FROM pokemones LEFT JOIN mis_pokemones ON pokemones.pokedex = mis_pokemones.pokedex WHERE mis_pokemones IS NULL ORDER BY nombre;
-- FULL (OUTER) JOIN

SELECT * FROM pokemones
FULL OUTER JOIN mis_pokemones
ON pokemones.pokedex = mis_pokemones.pokedex
ORDER BY nombre;

-- FULL OUTER JOIN Donde una columna en A o B es null
SELECT * FROM pokemones
FULL OUTER JOIN mis_pokemones ON
pokemones.pokedex = mis_pokemones.pokedex
WHERE pokemones.pokedex IS NULL OR
mis_pokemones.pokedex IS NULL
ORDER BY nombre;

--SUBQUERY (encuestas) solo una columna. ORDER BY = GROUP BY, IN 
SELECT pokedex 
FROM mis_pokemones
WHERE huevo=true;

SELECT y.nombre, x.pokedex, x.peso FROM (
SELECT peso, pokedex
FROM mis_pokemones
WHERE peso>200)
AS X 
INNER JOIN pokemones AS y
ON x.pokedex = y.pokedex;

--------ASI SE VERIA SIN LA y
SELECT peso, pokedex 
FROM mis_pokemones
WHERE peso>200;