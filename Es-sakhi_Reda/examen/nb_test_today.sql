SELECT 
    COUNT(id_test) AS 'nombre de test aujourdhui'
FROM
    test_db.test
WHERE
    te_date = CURRENT_DATE