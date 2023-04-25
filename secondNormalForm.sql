-- secondNormalForm
.read second_normal_form/pokemon_name.sql
.read second_normal_form/pokemon_details.sql
.read second_normal_form/pokemon_battle_stats.sql
.read second_normal_form/pokemon_stats.sql
.read second_normal_form/pokemon_streweak.sql
.read second_normal_form/pokemon_typing.sql

-- sqlite3 -header -csv pokemon.sqlite "select * from twoNF_details;" > second_normal_form_details.csv
-- sqlite3 -header -csv pokemon.sqlite "select * from twoNF_battle_stats;" > second_normal_form_bs.csv
-- sqlite3 -header -csv pokemon.sqlite "select * from twoNF_type;" > second_normal_form_type.csv
-- sqlite3 -header -csv pokemon.sqlite "select * from twoNF_name_info;" > second_normal_form_info.csv
-- sqlite3 -header -csv pokemon.sqlite "select * from twoNF_stats;" > second_normal_form_stats.csv
-- sqlite3 -header -csv pokemon.sqlite "select * from twoNF_streweak;" > second_normal_form_sw.csv
