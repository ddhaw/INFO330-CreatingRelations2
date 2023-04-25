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
