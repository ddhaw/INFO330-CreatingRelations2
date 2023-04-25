-- Stores type values in 3NF form
CREATE TABLE IF NOT EXISTS threeNF_type (
    pokedex_number INTEGER,
    type VARCHAR(255),
    FOREIGN KEY (pokedex_number)
    REFERENCES threeNF_name(pokedex_number)
);

INSERT INTO threeNF_type (pokedex_number, type) SELECT pokedex_number, type FROM oneNF_table;
