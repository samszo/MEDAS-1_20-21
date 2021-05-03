-- pour afficher la liste des propriétés d'un ressource template
SELECT p.*
FROM resource_template rt
INNER JOIN resource_template_property rtp
    on rt.id = rtp.resource_template_id
INNER JOIN property p
    on rtp.property_id = p.id
WHERE rt.label = "livre"

-- pour afficher les valeurs des propriétés d'un item
SELECT p.label, r.id, v.value, v.lang, v.uri, v.value_resource_id, r.title
FROM property p
INNER JOIN value v
    on p.id = v.property_id
INNER JOIN resource r
    on v.resource_id = r.id
WHERE r.title = "Antoine de Saint-Exupéry"
