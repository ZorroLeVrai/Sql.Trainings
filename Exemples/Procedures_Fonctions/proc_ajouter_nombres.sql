CREATE OR REPLACE PROCEDURE proc_add(a integer, b integer) AS $$
DECLARE
  result integer;
BEGIN
  -- Ajouter 2 nombres
  result := a + b;

  -- Afficher le résultat de l'addition
  RAISE NOTICE 'The result of % + % is %', a, b, result;
END;
$$ LANGUAGE plpgsql;