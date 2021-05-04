-- Adresse du fichier sql pour la requête répondant à la question : qui sont les personnes qui ont rendez-vous aujourd'hui ?

SELECT p.Nom_patient, p.Prenom_patient, p.Sexe, p.Adresse_patient, p.Ville_patient, p.Code_postal, p.NIR,
	rdv.Date_rdv
FROM patient as p
	INNER JOIN rdv_test as rdv
		ON p.id_PATIENT=rdv.PATIENT_id_PATIENT 
WHERE rdv.Date_rdv between '2020-05-04 00:00:00' AND '2020-05-04 23:59:59'