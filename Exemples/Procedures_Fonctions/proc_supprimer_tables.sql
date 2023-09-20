CREATE OR REPLACE PROCEDURE proc_delete_client_compte() AS $$
BEGIN
  --créer la table compte
  DROP TABLE IF EXISTS compte;

  --créer la table client
  DROP TABLE IF EXISTS client;

  RAISE NOTICE 'Les tables client et compte ont été supprimés';
END;
$$ LANGUAGE plpgsql;