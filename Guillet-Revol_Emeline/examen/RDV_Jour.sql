SELECT Nom_P, Prenom_P
FROM Patient
INNER JOIN Avoir_rendez_vous AVR ON patient_ID_P = ID_P
WHERE Rv = CURRENT_DATE