CREATE OR REPLACE PROCEDURE proc_transfert_argent(
  client_de VARCHAR(50),
  client_vers VARCHAR(50),
  amount DECIMAL(10,2)) AS $$
DECLARE
  compte_debit_id INT;
  compte_credit_id INT;
BEGIN
  --rechercher compte débiteur
  SELECT cpt.compte_id INTO compte_debit_id
  FROM client cli
  INNER JOIN compte cpt ON cpt.client_id = cli.client_id
  WHERE cli.nom = client_de;

  IF compte_debit_id IS NULL THEN
    RAISE EXCEPTION 'Client(e) inconnu %', client_de;
    RETURN;
  END IF;

  --rechercher compte créditeur
  SELECT cpt.compte_id INTO compte_credit_id
  FROM client cli
  INNER JOIN compte cpt ON cpt.client_id = cli.client_id
  WHERE cli.nom = client_vers;

  IF compte_credit_id IS NULL THEN
    RAISE EXCEPTION 'Client(e) inconnu %', client_vers;
    RETURN;
  END IF;

  --déduire le montant du compte débiteur
  UPDATE compte
  SET montant = montant - amount
  WHERE compte_id = compte_debit_id;

  --ajouter le montant au compte créditeur
  UPDATE compte
  SET montant = montant + amount
  WHERE compte_id = compte_credit_id;
END;
$$ LANGUAGE plpgsql;