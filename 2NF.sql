-- Creates table for pokemon name and info
CREATE TABLE IF NOT EXISTS twoNF_name_info AS SELECT pokedex_number, name, classfication FROM oneNF_table GROUP BY pokedex_number ORDER BY pokedex_number;

-- Creates table for pokemons basic details
CREATE TABLE IF NOT EXISTS twoNF_details AS SELECT pokedex_number, generation, is_legendary
FROM oneNF_table GROUP BY pokedex_number ORDER BY pokedex_number;

-- Creates table for pokemon battle stats
CREATE TABLE IF NOT EXISTS twoNF_battle_stats AS SELECT pokedex_number, base_happiness, attack, sp_attack, defense, sp_defense, hp, speed, base_total, experience_growth
FROM oneNF_table GROUP BY pokedex_number ORDER BY pokedex_number;

-- Creates table for pokemon stats outside of battle
CREATE TABLE IF NOT EXISTS twoNF_stats AS SELECT pokedex_number, base_egg_steps, capture_rate, height_m, weight_kg, percentage_male FROM oneNF_table
GROUP BY pokedex_number ORDER BY pokedex_number;

-- Creates table for pokemon weaknesses and strengths
CREATE TABLE IF NOT EXISTS twoNF_weak AS SELECT
pokedex_number,
against_bug,
against_dark,
against_dragon,
against_electric,
against_fairy,
against_fight,
against_fire,
against_flying,
against_ghost,
against_grass,
against_ground,
against_ice,
against_normal,
against_poison,
against_psychic,
against_rock,
against_steel,
against_water
FROM oneNF_table
GROUP BY pokedex_number ORDER BY pokedex_number;

-- table stores type and ability values
CREATE TABLE IF NOT EXISTS twoNF_type AS SELECT pokedex_number, type, ability FROM oneNF_table;

-- sqlite3 -header -csv pokemon.sqlite "select * from twoNF_details;" > second_normal_form_details.csv
-- sqlite3 -header -csv pokemon.sqlite "select * from twoNF_battle_stats;" > second_normal_form_bs.csv
-- sqlite3 -header -csv pokemon.sqlite "select * from twoNF_type;" > second_normal_form_type.csv
-- sqlite3 -header -csv pokemon.sqlite "select * from twoNF_name_info;" > second_normal_form_info.csv
-- sqlite3 -header -csv pokemon.sqlite "select * from twoNF_stats;" > second_normal_form_stats.csv
-- sqlite3 -header -csv pokemon.sqlite "select * from twoNF_streweak;" > second_normal_form_sw.csv
