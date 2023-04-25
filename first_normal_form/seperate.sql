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
