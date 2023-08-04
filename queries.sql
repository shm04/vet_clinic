/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = 't' AND escape_attempts < '3';
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > '10.5';
SELECT * FROM animals WHERE neutered = 't';
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN '10.4' AND '17.3';
BEGIN;
UPDATE animals SET species = 'unespecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals WHERE animals.date_of_birth > '2021-12-31';
SAVEPOINT save_one;
UPDATE animals SET weight_kg = animals.weight_kg * -1;
ROLLBACK TO SAVEPOINT save_one;
UPDATE animals SET weight_kg = animals.weight_kg * -1 WHERE animals.weight_kg < 0;
COMMIT

SELECT COUNT(id) FROM animals;
SELECT COUNT(id) FROM animals WHERE animals.escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) AS total_escape_attempts FROM animals GROUP BY neutered ORDER BY  total_escape_attempts DESC;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS avg_escape_attempts FROM animals WHERE animals.date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;