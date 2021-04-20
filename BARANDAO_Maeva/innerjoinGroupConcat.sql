SELECT GROUP_CONCAT(fk_Ref_commande) AS id_besoin, Ref_article
FROM Commandes
	INNER JOIN concretisation ON  Ref_commande=fk_Ref_commande
WHERE adresse_livraison="ici"