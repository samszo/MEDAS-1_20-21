SELECT GROUP_CONCAT(idImmeuble) AS immeuble, nom 
FROM Quartier
INNER JOIN Immeuble
ON idQuartier == dQuartier_idQuartier