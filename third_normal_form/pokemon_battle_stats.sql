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
