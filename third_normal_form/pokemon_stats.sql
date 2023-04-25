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
