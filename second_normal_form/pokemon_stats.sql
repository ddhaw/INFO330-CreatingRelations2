-- Creates table for pokemon stats outside of battle
CREATE TABLE IF NOT EXISTS twoNF_stats AS SELECT pokedex_number, base_egg_steps, capture_rate, height_m, weight_kg, percentage_male FROM oneNF_table
GROUP BY pokedex_number ORDER BY pokedex_number;
