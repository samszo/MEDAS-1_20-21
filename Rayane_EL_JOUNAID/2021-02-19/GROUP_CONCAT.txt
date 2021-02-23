SELECT l.titre,GROUP_CONCAT(l.nb_pages)
FROM livre l
GROUP BY l.titre;
