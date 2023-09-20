CREATE OR REPLACE FUNCTION func_obtenir_solde(nom_client VARCHAR(50))
RETURNS DECIMAL(10,2) AS $$
DECLARE
  montant DECIMAL(10,2);
BEGIN
  --récupérer le montant
  SELECT cpt.montant INTO montant
  FROM client cli
  INNER JOIN compte cpt ON cpt.client_id = cli.client_id
  WHERE cli.nom = nom_client;

  RETURN montant;
END;
$$ LANGUAGE plpgsql;