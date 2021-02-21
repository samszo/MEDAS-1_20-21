SELECT 
	CONCAT(medecin.nom,' ',medecin.prenom) 
		AS nom_medecin, 
	GROUP_CONCAT(CONCAT(patient.nom,' ',patient.prenom) SEPARATOR';')
		AS nom_patient
FROM patient 
	INNER JOIN consultation 
		ON id_PATIENT=PATIENT_id_PATIENT 
	INNER JOIN medecin 
		ON id_MEDECIN=MEDECIN_id_MEDECIN 
GROUP BY id_medecin