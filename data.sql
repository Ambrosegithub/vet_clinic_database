/* Populate database with sample data. */

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES ('Agumon', '2020-03-02', 0, true, 10.23);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES ('Pikachu', '2021-07-01', 1, false, 15.04);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES ('Devimon', '2017-12-05', 5, true, 11);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES ('Charmander', '2020-08-02', 0, false, -11);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES ('Squirtle', '1993-02-04', 3, false, -12.3);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES ('Angemon',  '2005-12-06', 1, true, -45);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES ('Boarmon',  '2005-07-06', 7, true, 20.4);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES ('Blossom',  '1998-10-13', 3, true, 17);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES ('Blossom',  '2022-05-14', 4, true, 22);

-- inserting data into owners table
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittake', 38);

-- inserting into species table
INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

-- Modify inserted animals so it includes the species_id value
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;


-- Modify inserted animals to include owner information (owner_id):
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';
 