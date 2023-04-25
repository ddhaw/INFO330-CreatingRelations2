-- table stores type and ability values
CREATE TABLE IF NOT EXISTS twoNF_type AS SELECT pokedex_number, type, ability FROM oneNF_table;
