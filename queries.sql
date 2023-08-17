/*Queries that provide answers to the questions from all projects.*/

/*  Find all animals whose name ends in "mon".  */

SELECT * FROM animals WHERE name LIKE '%mon';

/*  List the name of all animals born between 2016 and 2019.   */

SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;

/*  List the name of all animals that are neutered and have less than 3 escape attempts   */

SELECT name FROM animals WHERE escape_attempts < 3;

/*  List the date of birth of all animals named either "Agumon" or "Pikachu".  */

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

/*  List name and escape attempts of animals that weigh more than 10.5kg    */

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

/*  Find all animals that are neutered  */

SELECT * FROM animals WHERE neutered = 't';

/*  Find all animals not named Gabumon  */

SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';

/*  Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)  */

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/*  Update weight_kg  */

SELECT * FROM animals;

BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022/01/01';

SAVEPOINT delete_jan_2022_birth;

UPDATE animals SET weight_kg = weight_kg * (-1);

ROLLBACK TO delete_jan_2022_birth;

UPDATE animals SET weight_kg = weight_kg * (-1) WHERE weight_kg < 0;

COMMIT;

/*  queries: part two  */

/*  How many animals are there?  */

SELECT COUNT(*) AS total_animals FROM animals;

/* How many animals have never tried to escape? */

SELECT COUNT(*) AS total_animals_never_escape FROM animals WHERE escape_attempts = 0;

/*  What is the average weight of animals?  */

SELECT AVG(weight_kg) FROM animals;

/*  Who escapes the most, neutered or not neutered animals? */

SELECT MAX(escape_attempts) FROM animals;

/*  What is the minimum and maximum weight of each type of animal?  */

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;

/*  What is the average number of escape attempts per animal type of those born between 1990 and 2000?  */

SELECT species, AVG(escape_attempts) AS escape_attempts FROM animals WHERE date_of_birth > '1990/01/01' AND date_of_birth < '2000/12/31' GROUP BY species;

/*  queries: part three  */

/*  What animals belong to Melody Pond?   */

vet_clinic=# SELECT name FROM animals WHERE owner_id = 4;

/*  List of all animals that are pokemon (their type is Pokemon).   */

vet_clinic=# SELECT name FROM animals WHERE species_id = 1;

/*  List all owners and their animals, remember to include those that don't own any animal  */

vet_clinic=# SELECT o.full_name, a.name AS animal_name FROM owners o LEFT JOIN animals a ON o.id = a.owner_id ORDER BY o.full_name, a.name;

/*  How many animals are there per species?   */

vet_clinic=# SELECT s.name AS species_name, COUNT(*) AS animal_count FROM animals a JOIN species s ON a.species_id = s.id GROUP BY s.name ORDER BY s.name;

/*  List all Digimon owned by Jennifer Orwell   */

SELECT a.name AS digimon_name  FROM animals a JOIN species s ON a.species_id = s.id JOIN owners o ON a.owner_id = o.id WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';

/*  List all animals owned by Dean Winchester that haven't tried to escape  */

vet_clinic=# SELECT a.name AS animal_name FROM animals a JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

/*  Who owns the most animals?  */

vet_clinic=# SELECT o.full_name AS owner_name, COUNT(a.id) AS animal_count FROM owners o LEFT JOIN animals a ON o.id = a.owner_id GROUP BY o.full_name ORDER BY animal_count DESC LIMIT 1;

