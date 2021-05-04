--- nombre de tests positifs

SELECT 
    COUNT(id_test) AS 'nombre de test positifs'
FROM
    test_db.test
WHERE
    te_resultat = 'pos'