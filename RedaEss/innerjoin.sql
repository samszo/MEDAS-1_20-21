SELECT titre, editeur, nom_auteur
FROM livre
INNER JOIN livre_has_auteur
ON id_livre = livre_id_livre
INNER JOIN auteur
ON id_auteur = auteur_id_auteur
WHERE nom_auteur = 'Averroès' 
