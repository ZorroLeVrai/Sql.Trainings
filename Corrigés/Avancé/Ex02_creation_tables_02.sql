CREATE TABLE Restaurant (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	nom VARCHAR(30) NOT NULL
);

CREATE TABLE Plat (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	nom VARCHAR(50) NOT NULL
);

CREATE TABLE Client (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	nom VARCHAR(30) NOT NULL,
	prenom VARCHAR(30) NOT NULL
);

CREATE TABLE Servir_plat (
	id_restaurant INT,
	id_plat INT,
	CONSTRAINT fk_servir_restaurant FOREIGN KEY(id_restaurant) REFERENCES Restaurant(id),
	CONSTRAINT fk_servir_plat FOREIGN KEY(id_plat) REFERENCES Plat(id)
);

CREATE TABLE Commande (
	id_plat INT,
	id_client INT,
	CONSTRAINT fk_commande_plat FOREIGN KEY(id_plat) REFERENCES Plat(id),
	CONSTRAINT fk_commande_client FOREIGN KEY(id_client) REFERENCES Client(id)
);

CREATE TABLE Frequentation (
	id_restaurant INT,
	id_client INT,
	CONSTRAINT fk_frequentation_restaurant FOREIGN KEY(id_restaurant) REFERENCES Restaurant(id),
	CONSTRAINT fk_frequentation_client FOREIGN KEY(id_client) REFERENCES Client(id)
);
