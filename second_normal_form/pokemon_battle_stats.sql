-- Creates table for pokemon battle stats
CREATE TABLE IF NOT EXISTS twoNF_battle_stats AS SELECT pokedex_number, base_happiness, attack, sp_attack, defense, sp_defense, hp, speed, base_total, experience_growth
FROM oneNF_table GROUP BY pokedex_number ORDER BY pokedex_number;
