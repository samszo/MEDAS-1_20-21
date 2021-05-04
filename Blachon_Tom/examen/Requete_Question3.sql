-- Combien de personnes ont été testées aujourd'hui ?
SELECT GROUP_CONCAT(
CONCAT(ts.Prenom, ' ', ts.Nom) SEPARATOR " ; ")
AS Patients_tested_today,
COUNT(*) AS Nombre_de_patients
FROM tested_patient ts
INNER JOIN Planning
ON Planning_idPlanning = idPlanning
WHERE Date = CURRENT_DATE()