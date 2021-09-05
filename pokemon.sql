CREATE TABLE Pokemones(
    pokedex INT,
    nombre VARCHAR(10),
    tipo1 VARCHAR(10),
    tipo2 VARCHAR(10),
    PRIMARY KEY(pokedex) 
);

CREATE TABLE Mis_Pokemones(
    pokedex INT,
    fecha_captura DATE,
    lugar VARCHAR(20),
    huevo BOOLEAN,
    peso FLOAT,
    estatura FLOAT,
    FORGEIN KEY (pokedex) REFERENCE Pokemones(pokedex)
);

-- PARA IMPORTAR DESDE UN ARCHIVO CSV
\copy Pokemones FROM 'pokemonesrafa.csv' csv header;
\copy Mis_Pokemones FROM 'pokemonesrafa.csv' csv header;

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