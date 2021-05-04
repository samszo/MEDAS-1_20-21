-- Test les plus utilisé
SELECT count(D.Tests_ID_T), Type_T
FROM Tests T
INNER JOIN Depister D ON  D.Tests_ID_T = T.ID_T
GROUP BY Type_T