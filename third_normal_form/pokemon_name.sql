-- Stores name and pokedex number values in 3NF form
CREATE TABLE IF NOT EXISTS threeNF_name (
 pokedex_number INTEGER PRIMARY KEY,
 name VARCHAR(255),
 FOREIGN KEY (pokedex_number)
 REFERENCES threeNF_info(name)
);

INSERT INTO threeNF_name (pokedex_number, name) SELECT pokedex_number, name FROM twoNF_name_info;
