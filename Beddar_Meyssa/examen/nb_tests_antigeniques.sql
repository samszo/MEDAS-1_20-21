-- Adresse du fichier sql pour la requête répondant à la question : combien de tests antigéniques ont été réalisés aujourd'hui?

SELECT COUNT(rdv.id_RDV_TEST) as `Nombre de tests antigéniques aujourd'hui` 
FROM rdv_test as rdv
	INNER JOIN test
		ON test.id_TEST=rdv.TEST_id_TEST
WHERE test.id_TEST=1 AND rdv.Date_rdv between '2020-05-04 00:00:00' AND '2020-05-04 23:59:59'