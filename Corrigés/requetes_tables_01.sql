--récupérer la note de Gaston Pourquier en Histoire
SELECT n.score
FROM note n
INNER JOIN matiere m on m.id = n.id_matiere
INNER JOIN eleve e on e.id = n.id_eleve
WHERE
  m.libelle = 'Histoire'
  AND e.prenom = 'Gaston'
  AND e.nom = 'Pourquier';

