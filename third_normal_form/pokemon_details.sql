-- Stores detail values in 3NF form
CREATE TABLE IF NOT EXISTS threeNF_details (
    pokedex_number INTEGER,
    generation INTEGER,
    is_legendary INTEGER,
    FOREIGN KEY (pokedex_number)
    REFERENCES threeNF_name(pokedex_number)
);

INSERT INTO threeNF_details (pokedex_number, generation, is_legendary) SELECT * FROM twoNF_details;
