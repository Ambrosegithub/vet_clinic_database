/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name, date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name, neutered, escape_attempts FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR  name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND  weight_kg <= 17.3;

/*updating animals table*/
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

SELECT * FROM animals;
BEGIN;
UPDATE animals SET species  = 'digimon' WHERE name LIKE '%mon';
 
SELECT * FROM animals;


UPDATE animals SET species  = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;
--  Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK; 

-- After the rollback verify if all records in the animals table still exists.

SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Create a savepoint for the transaction.
BEGIN;
SAVEPOINT savePointA;

-- Update all animals' weight to be their weight multiplied by -1
 UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
 -- Rollback to the savepoint
ROLLBACK To savePointA;

--update all animals weight that are negative to be their weight multiply by -1
BEGIN;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

-- COUNTING ANIMALS PRESENTS
SELECT COUNT(*)FROM animals;

-- number of animals without escape attemps
SELECT COUNT(*)FROM animals WHERE escape_attempts = 0;

--average weight of animals
SELECT AVG(weight_kg) FROM animals;
-- animals with highest escape attemps for neutered or not neutered
SELECT MAX(escape_attempts) FROM animals WHERE neutered = true OR false;

-- min and max weight of animals
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990 01-01' AND '2000-12-31' GROUP BY species;