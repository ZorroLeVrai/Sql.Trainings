CREATE TABLE IF NOT EXISTS eleve (
	eleve_id INT,
	nom VARCHAR(20) NOT NULL,
	prenom VARCHAR(20) NOT NULL,
	date_naissance DATE,
	CONSTRAINT pk_eleve_id PRIMARY KEY (eleve_id)
);

CREATE TABLE IF NOT EXISTS matiere (
	matiere_id INT,
	libelle VARCHAR(20) NOT NULL,
	CONSTRAINT pk_matiere_id PRIMARY KEY (matiere_id)
);

CREATE TABLE IF NOT EXISTS inscription (
	eleve_id INT,
	matiere_id INT,
	CONSTRAINT fk_sui_mat_eleve FOREIGN KEY(eleve_id) REFERENCES eleve(eleve_id),
	CONSTRAINT fk_sui_mat_matiere FOREIGN KEY(matiere_id) REFERENCES matiere(matiere_id)
);

CREATE TABLE IF NOT EXISTS note (
	note_id INT GENERATED ALWAYS AS IDENTITY,
	score REAL NOT NULL,
	date DATE,
	libelle_semestre VARCHAR(20) NOT NULL,
	matiere_id INT,
	eleve_id INT,
	CONSTRAINT pk_note_id PRIMARY KEY (note_id),
	CONSTRAINT fk_note_eleve FOREIGN KEY(eleve_id) REFERENCES eleve(eleve_id),
	CONSTRAINT fk_note_matiere FOREIGN KEY(matiere_id) REFERENCES matiere(matiere_id)
);
