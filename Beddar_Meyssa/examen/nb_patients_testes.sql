-- Adresse du fichier sql pour la requête répondant à la question : combien de personnes ont été testées aujourd'hui ?

SELECT COUNT(p.id_PATIENT) as `Nombre de patients testés aujourd'hui` 
FROM patient as p
	INNER JOIN rdv_test as rdv
		ON p.id_PATIENT=rdv.PATIENT_id_PATIENT 
WHERE rdv.Date_rdv between '2020-05-04 00:00:00' AND '2020-05-04 23:59:59'