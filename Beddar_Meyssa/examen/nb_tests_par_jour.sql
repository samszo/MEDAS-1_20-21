-- Adresse du fichier sql pour la requête répondant à la question : combien de tests ont été réalisés par jour?

SELECT DATE(rdv.Date_rdv) as Jour,
	COUNT(rdv.id_RDV_TEST) as `Nombre de tests par jour` 
FROM rdv_test as rdv
GROUP BY DATE(rdv.Date_rdv)