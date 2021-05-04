-- Nombre de vaccin livré avant le 25 mars 2021
SELECT sum(l.nb) as nb_vaccin
FROM livraison l
WHERE l.date<="2021-05-25"
AND l.type="vaccin";