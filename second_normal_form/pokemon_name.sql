-- Creates table for pokemon name and info
CREATE TABLE IF NOT EXISTS twoNF_name_info AS SELECT pokedex_number, name, classfication FROM oneNF_table GROUP BY pokedex_number ORDER BY pokedex_number;
