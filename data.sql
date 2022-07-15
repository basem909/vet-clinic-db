/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  overriding system value values (1, 'Agumon', '03-02-2020',0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  overriding system value values (2, 'Gabumon', '2018-11-15',2, true, 8.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  overriding system value values (3, 'Pikachu', '07-01-2021',1, false, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  overriding system value values (4, 'Devimon', '12-05-2017',5, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  overriding system value values (5, 'Charmander', '08-02-2020',0, false, -11.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  overriding system value values (6, 'Plantmon', '15-11-2021',2, true, -5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  overriding system value values (7, 'Squirtle', '02-04-1993',3, false, -12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  overriding system value values (8, 'Angemon', '12-06-2005',1, true, -45.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  overriding system value values (9, 'Boarmon', '07-06-2005',7, true, 20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  overriding system value values (10, 'Blossom', '13-10-1998',3, true, 17.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)  overriding system value values (10, 'BDitto', '14-05-2022',4, true, 22.00);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');
UPDATE animals
 SET species_id=(SELECT id FROM species WHERE name='Digimon')
  WHERE name LIKE '%mon'
;

UPDATE animals
SET species_id=(SELECT id FROM species WHERE name='Pokemon')
WHERE species_id IS NULL
;

UPDATE animals
SET owner_id=(SELECT id FROM owners WHERE full_name ='Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');

UPDATE animals
SET owner_id=(SELECT id FROM owners WHERE full_name ='Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id=(SELECT id FROM owners WHERE full_name ='Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id=(SELECT id FROM owners WHERE full_name ='Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id=(SELECT id FROM owners WHERE full_name ='Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher',45,'Apr-23-2000'),
  ('Maisy Smith', 26, 'Jan-17-2019'),
  ('Stephanie Mendez', 64, 'May-04-1981'),
  ('Jack Harkness', 38, 'Jun-08-2008');

INSERT INTO specializations (species_id, vet_id)
VALUES ((SELECT id FROM species WHERE species.name = 'Pokemon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'William Tatcher' LIMIT 1)),
  ((SELECT id FROM species WHERE species.name = 'Digimon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez' LIMIT 1)),
  ((SELECT id FROM species WHERE species.name = 'Pokemon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez' LIMIT 1)),
  ((SELECT id FROM species WHERE species.name = 'Digimon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Jack Harkness' LIMIT 1));

INSERT INTO visits ( animal_id, vet_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE animals.name = 'Agumon'), (SELECT id FROM vets WHERE vets.name = 'William Tatcher' LIMIT 1), 'May-24-2020'),
((SELECT id FROM animals WHERE animals.name = 'Agumon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez' LIMIT 1), 'Jul-22-2020'),
((SELECT id FROM animals WHERE animals.name = 'Gabumon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Jack Harkness' LIMIT 1), 'Feb-02-2021'),
((SELECT id FROM animals WHERE animals.name = 'Pikachu' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith' LIMIT 1), 'Jan-05-2020'),
((SELECT id FROM animals WHERE animals.name = 'Pikachu' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith' LIMIT 1), 'Mar-08-2020'),
((SELECT id FROM animals WHERE animals.name = 'Pikachu' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith' LIMIT 1), 'May-14-2020'),
((SELECT id FROM animals WHERE animals.name = 'Devimon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez' LIMIT 1), 'May-04-2021'),
((SELECT id FROM animals WHERE animals.name = 'Charmander' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Jack Harkness' LIMIT 1), 'Feb-24-2021'),
((SELECT id FROM animals WHERE animals.name = 'Plantmon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith' LIMIT 1), 'Dec-21-2019'),
((SELECT id FROM animals WHERE animals.name = 'Plantmon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'William Tatcher' LIMIT 1), 'Aug-10-2020'),
((SELECT id FROM animals WHERE animals.name = 'Plantmon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith' LIMIT 1), 'Apr-07-2021'),
((SELECT id FROM animals WHERE animals.name = 'Squirtle' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez' LIMIT 1), 'Sep-29-2019'),
((SELECT id FROM animals WHERE animals.name = 'Angemon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Jack Harkness' LIMIT 1), 'Oct-03-2020'),
((SELECT id FROM animals WHERE animals.name = 'Angemon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Jack Harkness' LIMIT 1), 'Nov-04-2020'),
((SELECT id FROM animals WHERE animals.name = 'Boarmon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith' LIMIT 1), 'Jan-24-2019'),
((SELECT id FROM animals WHERE animals.name = 'Boarmon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith' LIMIT 1), 'May-15-2019'),
((SELECT id FROM animals WHERE animals.name = 'Boarmon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith' LIMIT 1), 'Feb-27-2020'),
((SELECT id FROM animals WHERE animals.name = 'Boarmon' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Maisy Smith' LIMIT 1), 'Aug-03-2020'),
((SELECT id FROM animals WHERE animals.name = 'Blossom' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez' LIMIT 1), 'May-24-2020'),
((SELECT id FROM animals WHERE animals.name = 'Blossom' LIMIT 1), (SELECT id FROM vets WHERE vets.name = 'William Tatcher' LIMIT 1), 'Jan-11-2021');