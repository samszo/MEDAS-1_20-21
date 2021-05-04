SELECT count(ID_P) as Nb_Personne_Testée
FROM Patient
INNER JOIN Depister ON patient_ID_P = ID_P
WHERE Jour_D = CURRENT_DATE