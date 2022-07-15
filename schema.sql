/* Database schema to keep the structure of entire database. */

create table animals (
id INT Generated always as Identity,
	name VARCHAR(50),
	date_of_birth date,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg Decimal,
	primary KEY (id)
);
ALTER TABLE animals
ADD species VARCHAR(50);
BEGIN TRANSACTION;
UPDATE animals
SET species= 'unspecified';
ROLLBACK;
BEGIN TRANSACTION;
UPDATE animals
SET species= 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species= 'pokemon'
WHERE species ISNULL;
COMMIT TRANSACTION;
BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;
BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg= weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg= weight_kg* -1 WHERE weight_kg < 0;
COMMIT TRANSACTION;