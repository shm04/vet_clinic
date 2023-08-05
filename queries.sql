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
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals;
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE animals.date_of_birth > '2021-12-31';
SAVEPOINT save_one;
UPDATE animals SET weight_kg = animals.weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO SAVEPOINT save_one;
SELECT * FROM animals;
UPDATE animals SET weight_kg = animals.weight_kg * -1 WHERE animals.weight_kg < 0;
SELECT * FROM animals;
COMMIT;

SELECT COUNT(id) FROM animals;
SELECT COUNT(id) FROM animals WHERE animals.escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) AS total_escape_attempts FROM animals GROUP BY neutered ORDER BY  total_escape_attempts DESC;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS avg_escape_attempts FROM animals WHERE animals.date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id ORDER BY owners.id;
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jeniffer Orwell' AND species.name = 'Digimon';
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name, COUNT(animals.id) AS num_owned FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.id, owners.full_name ORDER BY num_owned DESC;