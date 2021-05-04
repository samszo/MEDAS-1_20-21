-- Quelle est la moyenne d'âge des patients testés avec un test PCR ?
SELECT ROUND(AVG(ts.Age), 1) AS Age_Moyen_PCR
FROM tested_patient ts
INNER JOIN tests
ON Tests_idTests = idTests
WHERE Type = 'RT-PCR'