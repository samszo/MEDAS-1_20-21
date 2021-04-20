SELECT article_demandé, Ref_article
FROM DA 
	INNER JOIN concretisation ON Ref_DA=fk_Ref_DA
	INNER JOIN Commandes ON Ref_commande=fk_Ref_commande
WHERE adresse_livraison = "ici"