SELECT *
FROM Employe
INNER JOIN Contrat
ON idContrat=idEmploye


SELECT *
FROM Employe
WHERE idEmploye
IN (

SELECT idContrat
FROM Contrat
WHERE CDI_CDD ='CDI'
)