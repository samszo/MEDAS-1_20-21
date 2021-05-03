SELECT a.nom, a.prenom, l.titre
FROM auteur a
INNER JOIN livre_has_auteur lha ON auteur_id_auteur = id_auteur
INNER JOIN livre l ON livre_id_livre = id_livre