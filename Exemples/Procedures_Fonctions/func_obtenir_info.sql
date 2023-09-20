CREATE OR REPLACE FUNCTION func_obtenir_info(nom_client VARCHAR(50))
RETURNS TABLE (client_id int,
  client_nom varchar(50),
  montant decimal(10,2))
AS $$
DECLARE
  montant DECIMAL(10,2);
BEGIN
  --récupérer les informations
  RETURN QUERY
  SELECT cli.client_id, cli.nom, cpt.montant
  FROM client cli
  INNER JOIN compte cpt ON cpt.client_id = cli.client_id
  WHERE cli.nom = nom_client;
END;
$$ LANGUAGE plpgsql;