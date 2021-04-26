SELECT r.id, r.title
	, p.label
    , v.type,v.value, v.lang, v.uri, v.value_resource_id
    , rE.title
FROM property p
INNER JOIN value v
    on p.id = v.property_id
INNER JOIN resource r
    on v.resource_id = r.id
LEFT JOIN resource rE on rE.id = v.value_resource_id
WHERE r.title = "Titi";

SELECT 
    p.local_name
    -- , COUNT(r.id) nbRessource
    -- , r.title NomRessource
    , GROUP_CONCAT(r.title ) NomRessources
    -- , v.value, v.value_resource_id
    , COUNT(v.id) nbValeur
FROM
    property AS p
        INNER JOIN
    resource_template_property AS rtp ON p.id = rtp.property_id
        INNER JOIN
    resource_template rt ON rt.id = rtp.resource_template_id
        AND rt.label = 'Cartographie'
	LEFT JOIN resource r on r.resource_template_id = rt.id 
    LEFT JOIN value v on v.resource_id = r.id AND v.property_id = p.id
GROUP BY rtp.id;