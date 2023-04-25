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
