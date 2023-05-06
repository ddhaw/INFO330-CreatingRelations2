-- Makes every ability a seperate row of data
-- Creates and inserts values into table to store individual abilities
CREATE TABLE IF NOT EXISTS abilities (
  pokedex_number INTEGER PRIMARY KEY,
  ability TEXT
);
INSERT INTO abilities(pokedex_number, ability) SELECT pokedex_number, abilities FROM imported_pokemon_data;

-- Creates temporary table that splits values and removes []
CREATE TABLE IF NOT EXISTS temp_table AS
WITH RECURSIVE neat(
    pokedex_number, ability, etc
) AS(
    SELECT
        pokedex_number
        , ''
        , ability || ','
    FROM abilities
    WHERE pokedex_number
    UNION ALL

    SELECT
        pokedex_number
        , TRIM(SUBSTR(etc, 0, INSTR(etc, ',')), '[ ]')
        , TRIM(SUBSTR(etc, INSTR(etc, ',')+1), '[ ]')
    FROM neat
    WHERE etc <> ''
)
SELECT
    pokedex_number, ability
FROM neat
WHERE ability <> ''
ORDER BY
    pokedex_number ASC
    , ability ASC
;
DROP TABLE abilities;

-- Removes the "" values from the abilities table
CREATE TABLE IF NOT EXISTS abilities AS
WITH RECURSIVE neat(
    pokedex_number, ability, etc
) AS(
    SELECT
        pokedex_number
        , ''
        , ability || ','
    FROM temp_table
    WHERE pokedex_number
    UNION ALL

    SELECT
        pokedex_number
        , TRIM(SUBSTR(etc, 0, INSTR(etc, ',')), '''')
        , TRIM(SUBSTR(etc, INSTR(etc, ',')+1), '''')
    FROM neat
    WHERE etc <> ''
)
SELECT
    pokedex_number, ability
FROM neat
WHERE ability <> ''
ORDER BY
    pokedex_number ASC
    , ability ASC
;

-- Drops extra tables
DROP TABLE temp_table;

-- Cobine the type value of pokemon together
-- Creates and inserts into temporary table to combine and store types into one column
CREATE TABLE IF NOT EXISTS temp_table (
  pokedex_number INTEGER PRIMARY KEY,
  type VARCHAR(50)
);
INSERT INTO temp_table (pokedex_number, type)
SELECT pokedex_number, '[' || type1 || ', ' || type2 || ']' AS type FROM imported_pokemon_data;

-- Goes through the rows and removes [] and splits the values into different rows
CREATE TABLE IF NOT EXISTS types AS
WITH RECURSIVE neat(
    pokedex_number, type, etc
) AS(
    SELECT
        pokedex_number
        , ''
        , type || ','
    FROM temp_table
    WHERE pokedex_number
    UNION ALL

    SELECT
        pokedex_number
        , TRIM(SUBSTR(etc, 0, INSTR(etc, ',')), '[ ]')
        , TRIM(SUBSTR(etc, INSTR(etc, ',')+1), '[ ]')
    FROM neat
    WHERE etc <> ''
)

SELECT
    pokedex_number, type
FROM neat
WHERE type <> ''
ORDER BY
    pokedex_number ASC
    , type ASC
;
drop table temp_table;
.read first_normal_form/nf1.sql

-- Cobines all the tables together into 1NF form
-- Creates temporary table joining all infomration together in a 1nf format
CREATE TABLE IF NOT EXISTS temp AS SELECT * FROM abilities INNER JOIN imported_pokemon_data
ON abilities.pokedex_number = imported_pokemon_data.pokedex_number;

-- Drops extra columns
ALTER TABLE temp DROP COLUMN "pokedex_number:1";
ALTER TABLE temp DROP COLUMN "abilities";

-- Renames the the table
CREATE TABLE IF NOT EXISTS oneNF_table AS SELECT * FROM types INNER JOIN temp
ON types.pokedex_number = temp.pokedex_number;

-- Drops more extra columns in table
ALTER TABLE oneNF_table DROP COLUMN "pokedex_number:1";
ALTER TABLE oneNF_table DROP COLUMN "type1";
ALTER TABLE oneNF_table DROP COLUMN "type2";

-- Deletes Extra tables created
drop table temp;
drop table types;
drop table abilities;

-- sqlite3 -header -csv pokemon.sqlite "select * from oneNF_table;" > first_normal_form_pokemon.csv
