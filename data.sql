/* Populate database with sample data. */


 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ('Agumon', '2020/02/03', 0, true, 10.23),
 ('Gabumon', '2018/11/15', 2, true, 8.00),
 ('Pikachu', '2021/01/07', 1, false, 15.04),
 ('Devimom', '2017/05/12', 5, true, 11.00);
INSERT 0 4


/*  add more pets  */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Charmander','2020/02/08',0,'false',-11,'Animal'),
       ('Plantmon', '2021/11/15', 2, 'true', -5.7, 'Animal'),
       ('Squirtle', '1993/04/02', 3, 'false', -12.13, 'Animal'),
       ('Angemon', '2005/06/12', 1, 'true', -45, 'Animal'),
       ('Boarmon', '2005/06/07', 7, 'true', 20.4, 'Animal'),
       ('Blossom', '1998/10/13', 3, 'true', 17, 'Animal'),
       ('Ditto', '2022/05/14', 4, 'true', 22, 'Animal');

/*  INSERT DATA INTO owners  */

/*  Insert the following data into the owners table   */

 INSERT INTO owners (full_name,age)
 VALUES ('Sam Smith',19),
 ('Jennifer Orwell', 19),
 ('Bob',45),
 ('Melody Pond', 77),
 ('Dean Winchester', 14),
 ('Jodie Whittaker',38);

/*  Fix SAM SMITH age   */

 UPDATE owners SET age = 34 WHERE full_name = 'Sam Smith';

/*  Insert the following data into the species table  */

 INSERT INTO species (name)
 VALUES ('Pokemon'),
 ('Digimon');

/*  Modify your inserted animals so it includes the species_id value  */

 UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name NOT LIKE '%mon';
 UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name NOT LIKE '%mon';

/*  Modify your inserted animals to include owner information (owner_id)  */

 UPDATE animals AS a SET owner_id = o.id FROM owners AS o WHERE a.name = 'Agumon' AND o.full_name = 'Sam Smith';

 UPDATE animals AS a SET owner_id = o.id FROM owners AS o WHERE a.name = 'Gabumon' AND o.full_name = 'Jennifer Orwell';
UPDATE 1
 UPDATE animals AS a SET owner_id = o.id FROM owners AS o WHERE a.name = 'Pikachu' AND o.full_name = 'Jennifer Orwell';

 UPDATE animals AS a SET owner_id = o.id FROM owners AS o WHERE a.name = 'Devimon' AND o.full_name = 'Bob';
UPDATE 1
 UPDATE animals AS a SET owner_id = o.id FROM owners AS o WHERE a.name = 'Plantmon' AND o.full_name = 'Bob';

 UPDATE animals AS a SET owner_id = o.id FROM owners AS o WHERE a.name IN ('Charmander','Squirtle','Blossom') AND o.full_name = 'Melody Pond';

 UPDATE animals AS a SET owner_id = o.id FROM owners AS o WHERE a.name IN ('Angemon','Boarmon') AND o.full_name = 'Dean Winchester';

/*  FOURTH PART   */

/*  INSERT DATA TO VETS TABLE   */ 

 INSERT INTO vets (name,age,date_of_graduation)
 VALUES ('William Tatcher',45,'2000/04/23'),
 ('Maisy Smith',26,'2019/01/17'),
 ('Stephanie Mendez',45,'1981/05/04'),
 ('Jack Harkness',38,'2008/06/08');

/*  INSERT DATA TO SPECIALIZATIONS TABLE   */ 

 INSERT INTO specializations (id,idvets,idspecies) 
 VALUES (1,1),
 (3,1),
 (3,2),
 (4,2);

/*  INSERT DATA TO visits TABLE   */

INSERT INTO visits(idanimals,idvets,date_of_visit)
VALUES (1,1,'2020/05/24'),
(1,3,'2020/06/22'),
(2,4,'2021/01/02'),
(3,2,'2020/01/05'),
(3,2,'2020/03/08'),
(3,2,'2020/04/14'),
(4,3,'2021/05/04'),
(9,4,'2021/02/24'),
(10,2,'2019/12/21'),
(10,1,'2020/08/10'),
(10,2,'2021/04/07'),
(11,3,'2019/09/29'),
(12,4,'2020/10/03'),
(12,4,'2020/11/04'),
(13,2,'2019/01/24'),
(13,2,'2019/05/15'),
(13,2,'2020/02/27'),
(13,2,'2020/08/03'),
(14,3,'2020/05/24'),
(14,1,'2021/01/11');

