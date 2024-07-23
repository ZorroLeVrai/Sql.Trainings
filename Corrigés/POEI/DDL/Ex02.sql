CREATE TABLE IF NOT EXISTS compte (
	compte_id INT,
	pseudo VARCHAR(50),
	mot_de_passe VARCHAR(50),
	email VARCHAR(255),
  date_creation TIMESTAMP,
  derniere_connexion VARCHAR(50),
	CONSTRAINT pk_compte_id PRIMARY KEY (compte_id)
);

CREATE TABLE IF NOT EXISTS role (
	role_id INT,
	libelle VARCHAR(50),
  CONSTRAINT pk_role_id PRIMARY KEY (role_id)
);

CREATE TABLE IF NOT EXISTS compte_role (
	compte_id INT,
	role_id INT,
  date_ajout TIMESTAMP,
  CONSTRAINT fk_compte_role_compte_id FOREIGN KEY (compte_id) REFERENCES compte(compte_id),
  CONSTRAINT fk_compte_role_role_id FOREIGN KEY (role_id) REFERENCES role(role_id)
);
