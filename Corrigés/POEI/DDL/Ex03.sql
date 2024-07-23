-- Question 1 
CREATE TABLE IF NOT EXISTS professeur (
  professeur_id INT,
  prenom VARCHAR(50),
  nom VARCHAR(50),
  numero_classe INT,
  numero_departement INT,
  email VARCHAR(100),
  telephone VARCHAR(10),
  CONSTRAINT pk_professeur_id PRIMARY KEY (professeur_id)
);

-- Question 2
CREATE TABLE IF NOT EXISTS etudiant (
  etudiant_id INT NOT NULL,
  prenom VARCHAR(50),
  nom VARCHAR(50),
  numero_classe INT,
  telephone VARCHAR(10),
  date_diplome DATE
);

-- Question 3
CREATE TABLE IF NOT EXISTS professeur_etudiant (
  prof_etudiant_id INT NOT NULL,
  professeur_id INT NOT NULL,
  etudiant_id INT NOT NULL,
  CONSTRAINT pk_prof_etudiant_id PRIMARY KEY(prof_etudiant_id),
  FOREIGN KEY (professeur_id) REFERENCES professeur(professeur_id),
  FOREIGN KEY (etudiant_id) REFERENCES etudiant(etudiant_id)
);

--Question 4
ALTER TABLE etudiant ALTER COLUMN telephone SET NOT NULL;

--Question 5
ALTER TABLE etudiant
ADD CONSTRAINT pk_etudiant_id
PRIMARY KEY (etudiant_id);
