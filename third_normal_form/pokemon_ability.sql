-- Stores ability values in 3NF form
CREATE TABLE IF NOT EXISTS threeNF_ability (
    pokedex_number INTEGER,
    ability VARCHAR(255),
    FOREIGN KEY (pokedex_number)
    REFERENCES threeNF_name(pokedex_number)
);

INSERT INTO threeNF_ability (pokedex_number, ability) SELECT pokedex_number, ability FROM oneNF_table;
