--insertion des élèves
insert into eleve (prenom, nom, date_naissance)
  VALUES ('Gaston', 'Pourquier', '1943-02-22');

insert into eleve (prenom, nom, date_naissance)
  VALUES ('Harry', 'Potter', to_date('15/10/91', 'DD/MM/YY'));

--insertion des matières
insert into matiere (libelle) VALUES ('Français');
insert into matiere (libelle) VALUES ('Magie');
insert into matiere (libelle) VALUES ('Math');
insert into matiere (libelle) VALUES ('Histoire');

--insertion manuelle des inscriptions
insert into inscription VALUES (3, 5);
insert into inscription VALUES (3, 8);
insert into inscription VALUES (3, 7);
insert into inscription VALUES (4, 6);
insert into inscription VALUES (4, 8);

--insertion manuelle des notes
insert into note VALUES (DEFAULT, 18, CURRENT_DATE, 'Terminale Sem1', 6, 4);
insert into note VALUES (DEFAULT, 10, CURRENT_DATE, 'Terminale Sem1', 8, 4);
insert into note VALUES (DEFAULT, 15, CURRENT_DATE, 'Terminale Sem1', 5, 3);
insert into note VALUES (DEFAULT, 17, CURRENT_DATE, 'Terminale Sem1', 8, 3);
insert into note VALUES (DEFAULT, 16, CURRENT_DATE, 'Terminale Sem1', 7, 3);
