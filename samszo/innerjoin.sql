SELECT 
    t.nom nomTheatre, CONCAT(p.prenom,' ',p.nom) nomProprio
FROM
    proprietaire p
        INNER JOIN
    theatre_has_proprietaire thp ON thp.proprietaire_id_proprietaire = p.id_proprietaire
        INNER JOIN
    theatre t ON thp.theatre_id_theatre = t.id_theatre
WHERE p.nom = 'moi'
