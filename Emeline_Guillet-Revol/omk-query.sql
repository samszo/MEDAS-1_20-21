-- Requête qui affiche la liste des propriétés du resource template "Salle"
-- Le nombre de place, la cinéma rattaché
SELECT p.local_name
FROM property p
INNER JOIN resource_template_property rtp ON rtp.property_id = p.id
INNER JOIN resource_template rt ON rt.id = rtp.resource_template_id
WHERE rt.label = "Salle"

-- Requête qui affiche les valeurs des propriétés de l'item ayant pour titre "Ariel Centre Salle 2"
-- Soit le nombre de place dans la salle, le cinéma rattaché (ressource), 
SELECT v.type, v.value, p.label, v.lang, v.uri
FROM value v
INNER JOIN property p ON p.id = v.property_id
INNER JOIN resource r ON v.resource_id = r.id
WHERE r.title = "Ariel Centre Salle 2"
