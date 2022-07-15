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