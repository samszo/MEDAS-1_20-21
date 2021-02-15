SELECT 
    t.nom nomTheatre, p.nom nomProprio
FROM
    theatre t
        INNER JOIN
    theatre_has_proprietaire thp ON theatre_id_theatre = id_theatre
        INNER JOIN
    proprietaire p ON proprietaire_id_proprietaire = id_proprietaire