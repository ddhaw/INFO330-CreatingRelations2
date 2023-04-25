-- Adds pokemon Huskichu to pokemon database
INSERT INTO threeNF_info (pokedex_number)
VALUES ('Huskichu', 'Mascot Pokemon');
INSERT INTO threeNF_name (name, pokedex_number)
VALUES ('Huskichu', 802);
INSERT INTO threeNF_name (pokedex_number, ability)
VALUES (802, 'Common W ability');
INSERT INTO threeNF_battle_stats (pokedex_number, base_happiness, attack, sp_attack, defense, sp_defense, hp, speed, base_total, experience_growth)
VALUES (802, 70, 150, 160, 150, 160, 120, 120, 200, 1059860);
INSERT INTO threeNF_details (pokedex_number, generation, is_legendary)
VALUES (802, 1, 1);
INSERT INTO threeNF_stats (
  pokedex_number,
  base_egg_steps,
  height_m,
  weight_kg,
  percentage_male)
VALUES (
  802,
  12,
  10,
  120,
  .5
);
INSERT INTO threeNF_streweak (
  pokedex_number,
  against_bug ,
  against_dark ,
  against_dragon ,
  against_electric ,
  against_fairy ,
  against_fight ,
  against_fire ,
  against_flying ,
  against_ghost ,
  against_grass ,
  against_ground,
  against_ice ,
  against_normal,
  against_poison,
  against_psychic ,
  against_rock,
  against_steel,
  against_water
)
VALUES  (
  802,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2
);
INSERT INTO threeNF_type (pokedex_number, type)
VALUES (802, 'Mascot');

-- Adds pokemon Cougarite to pokemon database
INSERT INTO threeNF_info (pokedex_number)
VALUES ('Cougarite', 'Mascot Pokemon');
INSERT INTO threeNF_name (name, pokedex_number)
VALUES ('Cougarite', 803);
INSERT INTO threeNF_name (pokedex_number, ability)
VALUES (803, 'State ability');
INSERT INTO threeNF_battle_stats (pokedex_number, base_happiness, attack, sp_attack, defense, sp_defense, hp, speed, base_total, experience_growth)
VALUES (803, 70, 10, 10, 150, 10, 10, 10, 67, 1059860);
INSERT INTO threeNF_details (pokedex_number, generation, is_legendary)
VALUES (803, 1, 1);
INSERT INTO threeNF_stats (
  pokedex_number,
  base_egg_steps,
  height_m,
  weight_kg,
  percentage_male)
VALUES (
  802,
  12,
  10,
  120,
  .5
);
INSERT INTO threeNF_streweak (
  pokedex_number,
  against_bug ,
  against_dark ,
  against_dragon ,
  against_electric ,
  against_fairy ,
  against_fight ,
  against_fire ,
  against_flying ,
  against_ghost ,
  against_grass ,
  against_ground,
  against_ice ,
  against_normal,
  against_poison,
  against_psychic ,
  against_rock,
  against_steel,
  against_water
)
VALUES  (
  802,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5,
  .5
);
INSERT INTO threeNF_type (pokedex_number, type)
VALUES (803, 'Mascot');
