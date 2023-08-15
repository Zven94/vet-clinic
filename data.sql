/* Populate database with sample data. */


vet_clinic=# INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
vet_clinic-# VALUES ('Agumon', '2020/02/03', 0, true, 10.23),
vet_clinic-# ('Gabumon', '2018/11/15', 2, true, 8.00),
vet_clinic-# ('Pikachu', '2021/01/07', 1, false, 15.04),
vet_clinic-# ('Devimom', '2017/05/12', 5, true, 11.00);
INSERT 0 4
