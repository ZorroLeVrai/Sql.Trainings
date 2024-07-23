--insertion des élèves
insert into eleve (eleve_id, prenom, nom, date_naissance)
  VALUES (1, 'Gaston', 'Pourquier', '1943-02-22');

insert into eleve (eleve_id, prenom, nom, date_naissance)
  VALUES (2, 'Harry', 'Potter', to_date('15/10/91', 'DD/MM/YY'));

--insertion des matières
insert into matiere (matiere_id, libelle) VALUES (1, 'Français');
insert into matiere (matiere_id, libelle) VALUES (2, 'Magie');
insert into matiere (matiere_id, libelle) VALUES (3, 'Math');
insert into matiere (matiere_id, libelle) VALUES (4, 'Histoire');

--insertion manuelle des inscriptions
insert into inscription VALUES (1, 1);
insert into inscription VALUES (1, 4);
insert into inscription VALUES (1, 3);
insert into inscription VALUES (2, 2);
insert into inscription VALUES (2, 4);

--insertion manuelle des notes
insert into note VALUES (DEFAULT, 18, CURRENT_DATE, 'Terminale Sem1', 2, 2);
insert into note VALUES (DEFAULT, 10, CURRENT_DATE, 'Terminale Sem1', 4, 2);
insert into note VALUES (DEFAULT, 15, CURRENT_DATE, 'Terminale Sem1', 1, 1);
insert into note VALUES (DEFAULT, 17, CURRENT_DATE, 'Terminale Sem1', 4, 1);
insert into note VALUES (DEFAULT, 16, CURRENT_DATE, 'Terminale Sem1', 3, 1);
