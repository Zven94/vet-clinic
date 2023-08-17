/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg FLOAT
);

/*   add species columns as string   */

ALTER TABLE animals
ADD species TYPE VARCHAR(255);

/*  Part 3rd: Foreign tables    */

/*  Create owners TABLE */

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    PRIMARY KEY (id),
    full_name VARCHAR(255),
    age INT
);

/*  Create species TABLE */

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    PRIMARY KEY (id),
    full_name VARCHAR(255),
);

/*  Modify animals table    */

ALTER TABLE animals
ADD PRIMARY KEY (id);

/*  REMOVE species  */

ALTER TABLE animals 
DROP COLUMN species;

/*  ADD COLUMN species_id   */

ALTER TABLE animals
ADD COLUMN species_id INT REFERENCES species(id);

/*  ADD COLUMN owner_id     */

ALTER TABLE animals
ADD COLUMN owner_id INT REFERENCES owner(id);
