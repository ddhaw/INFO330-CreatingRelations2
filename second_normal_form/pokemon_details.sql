-- Creates table for pokemons basic details
CREATE TABLE IF NOT EXISTS twoNF_details AS SELECT pokedex_number, generation, is_legendary
FROM oneNF_table GROUP BY pokedex_number ORDER BY pokedex_number;
