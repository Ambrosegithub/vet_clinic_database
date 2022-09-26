/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    PRIMARY KEY(id)
);

/*alter table **/

ALTER TABLE animals
ADD species  varchar(255);

-- drop species column 
ALTER TABLE animals
DROP COLUMN species;

-- create owner table.
CREATE TABLE owners (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY ,
    full_name varchar(250),
    age INT NOT NULL,
    PRIMARY KEY(id)
);

-- species table
CREATE TABLE species (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(250),
    PRIMARY KEY(id)
);


ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_animals_species FOREIGN KEY( species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_animals_owners FOREIGN KEY( owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY ,
    name varchar(250),
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    species_id INT NOT NULL,
    vets_id INT NOT NULL,
    name varchar(250),
    PRIMARY KEY(species_id, vets_id),
    CONSTRAINT fk_specializations_species  FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT fk_specializations_vets  FOREIGN KEY(vets_id) REFERENCES vets(id)
);

CREATE TABLE visits (
        id INT NOT NULL GENERATED ALWAYS AS IDENTITY ,
    animals_id INT NOT NULL,
    vets_id INT NOT NULL,
    date_of_visit DATE NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_visit_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
    CONSTRAINT fk_visit_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- remove the not null from the age column 
ALTER TABLE owners ALTER COLUMN age DROP NOT NULL;
ALTER TABLE visits ADD COLUMN id INT NOT NULL GENERATED ALWAYS AS IDENTITY;
ALTER TABLE visits DROP PRIMARY KEY;
ALTER TABLE visits ADD PRIMARY KEY(id);


ALTER TABLE visits DROP Constraint PRIMARY KEY;
