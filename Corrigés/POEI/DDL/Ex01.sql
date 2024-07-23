CREATE TABLE IF NOT EXISTS personne (
	personne_id INT,
	titre VARCHAR(3),
	prenom VARCHAR(20),
	nom VARCHAR(20),
  telephone VARCHAR(14),
  email VARCHAR(20),
	CONSTRAINT pk_personne_id PRIMARY KEY (personne_id)
);

CREATE TABLE IF NOT EXISTS colis (
  colis_id INT,
  personne_id INT,
  libelle VARCHAR(100),
  poids_g INT,
  CONSTRAINT pk_colis_id PRIMARY KEY (colis_id),
  CONSTRAINT fk_colis_personne_id FOREIGN KEY (personne_id) REFERENCES personne(personne_id)
);
