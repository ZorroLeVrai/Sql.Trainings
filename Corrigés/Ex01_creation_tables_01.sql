CREATE TABLE IF NOT EXISTS Eleve (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	nom VARCHAR(20) NOT NULL,
	prenom VARCHAR(20) NOT NULL,
	date_naissance DATE
);

CREATE TABLE IF NOT EXISTS Matiere (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	libelle VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Inscription (
	id_eleve INT,
	id_matiere INT,
	CONSTRAINT fk_sui_mat_eleve FOREIGN KEY(id_eleve) REFERENCES Eleve(id),
	CONSTRAINT fk_sui_mat_matiere FOREIGN KEY(id_matiere) REFERENCES Matiere(id)
);

CREATE TABLE IF NOT EXISTS Note (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	score REAL NOT NULL,
	date DATE,
	libelle_semestre VARCHAR(20) NOT NULL,
	id_matiere INT,
	id_eleve INT,
	CONSTRAINT fk_note_eleve FOREIGN KEY(id_eleve) REFERENCES Eleve(id),
	CONSTRAINT fk_note_matiere FOREIGN KEY(id_matiere) REFERENCES Matiere(id)
);
