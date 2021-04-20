SELECT idEntreprise,
    GROUP_CONCAT(CONCAT(Nom, ' ', Prenom)) Salarié
FROM
    Employe
        INNER JOIN
    Contrat ON idContrat = idEmploye
GROUP BY idEntreprise
