--insertion des élèves
insert into Eleve (prenom, nom, date_naissance) VALUES ('Gaston', 'Pourquier', '1943-02-22');
insert into Eleve (prenom, nom, date_naissance) VALUES ('Harry', 'Potter', to_date('15/10/91', 'DD/MM/YY'));

--insertion des matières
insert into Matiere (libelle) VALUES ('Français');
insert into Matiere (libelle) VALUES ('Magie');
insert into Matiere (libelle) VALUES ('Math');
insert into Matiere (libelle) VALUES ('Histoire');

--insertion des inscriptions
insert into Inscription VALUES (2, 2);
insert into Inscription VALUES (2, 4);
insert into Inscription VALUES (1, 1);
insert into Inscription VALUES (1, 4);
insert into Inscription VALUES (1, 3);

--insertion des notes
insert into Note VALUES (DEFAULT, 18, CURRENT_DATE, 'Terminale Sem1', 2, 2);
insert into Note VALUES (DEFAULT, 10, CURRENT_DATE, 'Terminale Sem1', 4, 2);
insert into Note VALUES (DEFAULT, 15, CURRENT_DATE, 'Terminale Sem1', 1, 1);
insert into Note VALUES (DEFAULT, 17, CURRENT_DATE, 'Terminale Sem1', 4, 1);
insert into Note VALUES (DEFAULT, 16, CURRENT_DATE, 'Terminale Sem1', 3, 1);
