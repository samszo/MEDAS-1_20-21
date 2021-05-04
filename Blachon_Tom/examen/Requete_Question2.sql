-- Qui sont les personnes qui ont rendez-vous ajourd'hui ?
SELECT rdv.Nom, rdv.Prenom, rdv.Age, rdv.Ville, rdv.Symptome_principal
FROM patient_for_rendezvous rdv
INNER JOIN Planning
ON Planning_idPlanning = idPlanning
WHERE Date = CURRENT_DATE()