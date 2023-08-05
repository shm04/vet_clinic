/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

 ALTER TABLE animals ADD COLUMN species VARCHAR(100);

 CREATE TABLE owners (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    full_name VARCHAR(150),
    age INTEGER
 );

 CREATE TABLE species (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(150)
 );

 ALTER TABLE animals DROP COLUMN species;

