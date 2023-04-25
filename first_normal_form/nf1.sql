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
