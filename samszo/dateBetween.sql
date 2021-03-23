SELECT 
    t.nom nomTheatre, COUNT(DISTINCT p.id_proprietaire) numProprio
    , GROUP_CONCAT(CONCAT(p.prenom,' ',p.nom)) nomProprio
    , t.date_construction
FROM
    proprietaire p
        INNER JOIN
    theatre_has_proprietaire thp ON thp.proprietaire_id_proprietaire = p.id_proprietaire
        INNER JOIN
    theatre t ON thp.theatre_id_theatre = t.id_theatre
    WHERE t.date_construction BETWEEN '1950-01-01' AND now()
GROUP BY t.nom
