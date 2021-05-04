-- qui sont les personnes qui ont rendez-vous aujourd'hui ?
SELECT p.Nom, p.Prenom
FROM personne p
INNER JOIN rdv
ON p.idPersonne = rdv.idPersonne
WHERE rdv.date=CURRENT_DATE;
