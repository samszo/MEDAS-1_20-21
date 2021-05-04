-- Liste des personnes de plus de 50 ans
SELECT p.Nom, p.Prenom
FROM personne p
WHERE p.Age>=50;
