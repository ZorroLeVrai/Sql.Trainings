CREATE OR REPLACE PROCEDURE insert_inscriptions() AS $$
DECLARE
    gaston_id integer;
    harry_id integer;
    francais_id integer;
    histoire_id integer;
    math_id integer;
    magie_id integer;
BEGIN
  insert into eleve (prenom, nom, date_naissance)
    VALUES ('Gaston', 'Pourquier', '1943-02-22') RETURNING id INTO gaston_id;

  insert into eleve (prenom, nom, date_naissance)
    VALUES ('Harry', 'Potter', to_date('15/10/91', 'DD/MM/YY')) RETURNING id INTO harry_id;

  insert into matiere (libelle) VALUES ('Français') RETURNING id INTO francais_id;
  insert into matiere (libelle) VALUES ('Math') RETURNING id INTO math_id;
  insert into matiere (libelle) VALUES ('Histoire') RETURNING id INTO histoire_id;
  insert into matiere (libelle) VALUES ('Magie') RETURNING id INTO magie_id;

  insert into inscription VALUES (gaston_id, francais_id);
  insert into inscription VALUES (gaston_id, math_id);
  insert into inscription VALUES (gaston_id, histoire_id);
  insert into inscription VALUES (harry_id, histoire_id);
  insert into inscription VALUES (harry_id, magie_id);

  insert into note VALUES (DEFAULT, 18, CURRENT_DATE, 'Terminale Sem1', magie_id, harry_id);
  insert into note VALUES (DEFAULT, 10, CURRENT_DATE, 'Terminale Sem1', histoire_id, harry_id);
  insert into note VALUES (DEFAULT, 15, CURRENT_DATE, 'Terminale Sem1', francais_id, gaston_id);
  insert into note VALUES (DEFAULT, 17, CURRENT_DATE, 'Terminale Sem1', math_id, gaston_id);
  insert into note VALUES (DEFAULT, 16, CURRENT_DATE, 'Terminale Sem1', histoire_id, gaston_id);
END;
$$ LANGUAGE plpgsql;
