-- Question 1
SELECT * FROM livre;

-- Question 2
SELECT *
FROM livre
ORDER BY date_publication
LIMIT 10;

-- Question 3
SELECT date_publication, auteur, titre FROM livre ORDER BY date_publication LIMIT 10;

-- Question 4
SELECT * FROM livre WHERE auteur = 'Agatha Christie';

-- Question 5
SELECT COUNT(*) AS "nombres de livres" FROM livre WHERE auteur = 'Agatha Christie';

-- Question 6
UPDATE livre 
SET 
    auteur = 'Agatha Christie'
WHERE
    auteur = 'Agatha Christies';

-- Question 7
INSERT INTO livre (titre, auteur, editeur, date_publication, isbn_10, isbn_13)
VALUES 
('Les histoires de toto','toto','Livre de Chevet','2023-08-25','2293160831','478-2253150434');

-- Question 8
DELETE FROM livre 
WHERE
    auteur = 'toto'
    AND titre = 'Les histoires de toto';
