-- Stores classfication and name values in 3NF form
CREATE TABLE threeNF_info (
  name VARCHAR(255) PRIMARY KEY,
  classfication VARCHAR(255)
);

INSERT INTO threeNF_info (name, classfication) SELECT name, classfication FROM twoNF_name_info;
