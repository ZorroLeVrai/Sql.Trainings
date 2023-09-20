/*************** Requêtes du 18/09/2023 ****************/

--Ligne de commande: Pour se connecter à PostgreSQL
psql -U postgres

--Ligne de commande: Pour se connecter à PostgreSQL sur la base `exploration`
psql -U postgres -d exploration

--Commande pour créer une base de données (base de données `exploration`)
CREATE DATABASE exploration;

--Requête création d'un schéma
CREATE SCHEMA test;

--Pour créer une table dans un schéma spécifique
--CREATE TABLE test.<nom_de_la_table> (...);

--commande de création de la table dans le schéma `test`
CREATE TABLE test.premiere (id INT, text VARCHAR(100));

--Exemple modification d'une table
ALTER TABLE test.premiere ADD COLUMN valeur DECIMAL(10,2);

--Requête DQL (Data Query Language)
--Voir le contenu de la table `test.premiere`
SELECT * FROM test.premiere;

--Requête DML (Data Modification Language)
--insérer une ligne dans une table
INSERT INTO test.premiere (text) VALUES ('Bonjour');

--alter table sans conversion
ALTER TABLE test.premiere ALTER COLUMN text TYPE varchar(10);

--alter table avec conversion (conversion des chaines de caractères en entiers)
ALTER TABLE test.premiere ALTER COLUMN text TYPE INT USING text::integer;

--Commande pour vider le contenu de la table
TRUNCATE nom_de_table;

--Ajouter une contrainte NOT NULL
ALTER TABLE test.Client ALTER COLUMN id SET NOT NULL;

--Spécifier les valeurs par défaut d'un champ
ALTER TABLE test.Client ALTER COLUMN id SET DEFAULT 0;

--syntaxe de création d'une séquence
CREATE SEQUENCE seq_test_client_id;

--modification de la valeur par défaut pour prendre la valeur de la séquence
ALTER TABLE test.Client ALTER COLUMN id SET DEFAULT nextval('test.seq_test_client_id');

--modification de la table pour ajouter une clé primaire
ALTER TABLE test.Client ADD PRIMARY KEY (id);

/******************************************************************************/
/******* Exemple simple de création de table avec insertion de données ********/
/******************************************************************************/

CREATE TABLE test.Client(
  id INT,
  prenom VARCHAR(50),
  nom VARCHAR(50),
  date_de_naissance DATE);

INSERT INTO test.Client VALUES (1, 'John', 'Doe', '2001-01-01');

INSERT INTO test.Client VALUES (2, 'Jane', 'Doe', '1998-01-01');
