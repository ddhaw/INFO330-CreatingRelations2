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
