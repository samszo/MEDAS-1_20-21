SELECT nom,prenom 
FROM patient 
	INNER JOIN consultation 
		ON id_PATIENT=PATIENT_id_PATIENT 
WHERE date_consultation 
	BETWEEN '2020-02-01' AND '2020-03-01'