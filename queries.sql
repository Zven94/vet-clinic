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

