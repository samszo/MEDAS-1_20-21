-- combien de personnes ont été testées aujourd'hui ?
SELECT p.Nom, p.Prenom
FROM personne p
INNER JOIN rdv
ON	p.idPersonne = rdv.idPersonne
WHERE rdv.date=CURRENT_DATE
AND rdv.type_rdv="test";
