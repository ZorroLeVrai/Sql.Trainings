-- 1- Combien y a t-il de passagers dans notre base de données ?
SELECT COUNT(*) AS "Nb passagers"
FROM titanic_passenger;

-- 2- Quelle est la moyenne du prix du trajet ?
SELECT avg(fare)
FROM titanic_passenger;

-- 3- Quel passager a payé le billet le plus cher ?
SELECT *
FROM titanic_passenger
WHERE fare is not null
ORDER BY fare DESC
LIMIT 1;

-- 4- Quelles personnes n’ont pas payé leurs billets de 1ère classe ?
SELECT *
FROM titanic_passenger
WHERE pclass = 1
	AND fare = 0;

-- 5- Quelle personne a obtenu le billet de première classe le moins cher ?
SELECT *
FROM titanic_passenger
WHERE pclass = 1
	AND fare != 0
ORDER BY fare
LIMIT 1;

-- 6.1- Quel est le passager le plus jeune ?
SELECT *
FROM titanic_passenger
WHERE age is not null
ORDER BY age
LIMIT 1;

-- 6.2- Quel est le passager le plus âgé ?
SELECT *
FROM titanic_passenger
WHERE age is not null
ORDER BY age DESC
LIMIT 1;

-- 7- Quel est le prix médian des billets de 1ère, 2ème ou 3ème classe ?
SELECT
	pclass as classe,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY fare) AS "prix median"
FROM titanic_passenger
GROUP BY classe
ORDER BY classe;

-- 8- Quel est le pourcentage de femmes dans la liste des passagers ?
WITH p AS (
	SELECT sex
	FROM titanic_passenger
)
SELECT 100.0*(SELECT count(*) FROM p WHERE p.sex='female') / (SELECT count(*) FROM p) as pourcentage_femme;

--2ème exemple
SELECT
    (COUNT(*) FILTER (WHERE sex = 'female') * 100.0 / COUNT(*)) AS pourcentage_femme
FROM
    titanic_passenger;

-- 9- Quel est le pourcentage de passagers par tranche d'âge.
SELECT
	CASE
		WHEN age BETWEEN 0 AND 10 THEN '0-10 ans'
		WHEN age BETWEEN 10 AND 25 THEN '10-25 ans'
		WHEN age BETWEEN 25 AND 60 THEN '25-60 ans'
		ELSE '> 60 ans'
	end as tranche_age,
	100.0*count(*) / (SELECT count(*) FROM titanic_passenger) AS pourcentage_passengers
FROM titanic_passenger
GROUP BY tranche_age;

--2ème exemple
SELECT
    tranche_age,
    (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()) AS pourcentage_passengers
FROM (
    SELECT
        CASE
            WHEN age BETWEEN 0 AND 10 THEN '0-10 ans'
            WHEN age BETWEEN 11 AND 25 THEN '11-25 ans'
            WHEN age BETWEEN 25 AND 60 THEN '25-60 ans'
            ELSE '> 60 ans'
        END as tranche_age
    FROM
        titanic_passenger
) age_groups
GROUP BY
    tranche_age;
    
-- 10- Quelle est la proportion des survivants ?
SELECT
	COUNT(*) FILTER (WHERE s.survived) * 100.0 / COUNT(*) AS pourcentage_survivants
FROM titanic_passenger p
INNER JOIN titanic_survival s ON s.passengerid = p.passengerid;

--2ème exemple
SELECT
	s.survived,
	(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()) AS pourcentage_survivants
FROM titanic_passenger p
INNER JOIN titanic_survival s ON s.passengerid = p.passengerid
GROUP BY s.survived;

-- 11- Quelle est la proportion des survivants par classe de transport ?
SELECT
    pclass as classe,
    (COUNT(*) FILTER (WHERE s.survived) * 100.0 / COUNT(*)) AS pourcentage_passengers
FROM (
    SELECT
        pclass,
		passengerid
    FROM
        titanic_passenger
) passagers
INNER JOIN titanic_survival s ON s.passengerid = passagers.passengerid
GROUP BY
    pclass;

-- 12- Quelle est la proportion des survivants par tranche d'âge ?
SELECT
    tranche_age,
    (COUNT(*) FILTER (WHERE s.survived) * 100.0 / COUNT(*)) AS pourcentage_passengers
FROM (
    SELECT
        CASE
            WHEN age BETWEEN 0 AND 10 THEN '0-10 ans'
            WHEN age BETWEEN 11 AND 25 THEN '11-25 ans'
            WHEN age BETWEEN 25 AND 60 THEN '25-60 ans'
            ELSE '> 60 ans'
        END as tranche_age,
		passengerid
    FROM
        titanic_passenger
) ag
INNER JOIN titanic_survival s ON s.passengerid = ag.passengerid
GROUP BY
    tranche_age;
    
-- 13- Quelle est la proportion des survivants par genre ?
SELECT
    genre,
    (COUNT(*) FILTER (WHERE s.survived) * 100.0 / COUNT(*)) AS pourcentage_passengers
FROM (
    SELECT
        sex as genre,
		passengerid
    FROM
        titanic_passenger
) passagers
INNER JOIN titanic_survival s ON s.passengerid = passagers.passengerid
GROUP BY
    genre;
