-- Stores name and pokedex number values in 3NF form
CREATE TABLE IF NOT EXISTS threeNF_name (
 pokedex_number INTEGER PRIMARY KEY,
 name VARCHAR(255),
 FOREIGN KEY (pokedex_number)
 REFERENCES threeNF_info(name)
);

INSERT INTO threeNF_name (pokedex_number, name) SELECT pokedex_number, name FROM twoNF_name_info;

-- Stores classfication and name values in 3NF form
CREATE TABLE threeNF_info (
  name VARCHAR(255) PRIMARY KEY,
  classfication VARCHAR(255)
);

INSERT INTO threeNF_info (name, classfication) SELECT name, classfication FROM twoNF_name_info;

-- Stores battle stats values in 3NF form
CREATE TABLE IF NOT EXISTS threeNF_battle_stats (
    pokedex_number INTEGER,
    base_happiness INTEGER,
    attack INTEGER,
    sp_attack INTEGER,
    defense INTEGER,
    sp_defense INTEGER,
    hp INTEGER,
    speed INTEGER,
    base_total INTEGER,
    experience_growth INTEGER,
    FOREIGN KEY (pokedex_number)
    REFERENCES threeNF_name(pokedex_number)
);

INSERT INTO threeNF_battle_stats (pokedex_number, base_happiness, attack, sp_attack, defense, sp_defense, hp, speed, base_total, experience_growth) SELECT * FROM twoNF_battle_stats;

-- Stores detail values in 3NF form
CREATE TABLE IF NOT EXISTS threeNF_details (
    pokedex_number INTEGER,
    generation INTEGER,
    is_legendary INTEGER,
    FOREIGN KEY (pokedex_number)
    REFERENCES threeNF_name(pokedex_number)
);

INSERT INTO threeNF_details (pokedex_number, generation, is_legendary) SELECT * FROM twoNF_details;

-- Stores stats outside of battle in 3NF form
CREATE TABLE IF NOT EXISTS threeNF_stats (
  pokedex_number INTEGER,
  base_egg_steps INTEGER,
  capture_rate INTEGER,
  height_m REAL,
  weight_kg REAL,
  percentage_male REAL,
  FOREIGN KEY (pokedex_number)
  REFERENCES threeNF_name(pokedex_number)
);

INSERT INTO threeNF_stats (
  pokedex_number,
  base_egg_steps,
  capture_rate,
  height_m,
  weight_kg,
  percentage_male)
SELECT * FROM twoNF_stats;

-- Stores weaknesses and strengths values in 3NF form
CREATE TABLE IF NOT EXISTS threeNF_streweak (
pokedex_number INTEGER,
against_bug REAL,
against_dark REAL,
against_dragon REAL,
against_electric REAL,
against_fairy REAL,
against_fight REAL,
against_fire REAL,
against_flying REAL,
against_ghost REAL,
against_grass REAL,
against_ground REAL,
against_ice REAL,
against_normal REAL,
against_poison REAL,
against_psychic REAL,
against_rock REAL,
against_steel REAL,
against_water REAL,
FOREIGN KEY (pokedex_number)
REFERENCES threeNF_name(pokedex_number)
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
SELECT * FROM twoNF_streweak;

-- Stores type values in 3NF form
CREATE TABLE IF NOT EXISTS threeNF_type (
    pokedex_number INTEGER,
    type VARCHAR(255),
    FOREIGN KEY (pokedex_number)
    REFERENCES threeNF_name(pokedex_number)
);

INSERT INTO threeNF_type (pokedex_number, type) SELECT pokedex_number, type FROM oneNF_table;

-- Stores ability values in 3NF form
CREATE TABLE IF NOT EXISTS threeNF_ability (
    pokedex_number INTEGER,
    ability VARCHAR(255),
    FOREIGN KEY (pokedex_number)
    REFERENCES threeNF_name(pokedex_number)
);

INSERT INTO threeNF_ability (pokedex_number, ability) SELECT pokedex_number, ability FROM oneNF_table;
