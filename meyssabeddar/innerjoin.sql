SELECT * 
FROM patient 
	INNER JOIN consultation 
		ON id_PATIENT=PATIENT_id_PATIENT 
	INNER JOIN medecin 
		ON id_MEDECIN=MEDECIN_id_MEDECIN 
WHERE id_medecin=1