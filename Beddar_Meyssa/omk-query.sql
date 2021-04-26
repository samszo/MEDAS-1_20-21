-- Requête qui affiche la liste des propriétés du resource template "Medecin"
SELECT prop.*
FROM resource_template rt
INNER JOIN resource_template_property rtp
    on rt.id = rtp.resource_template_id
INNER JOIN property prop
    on rtp.property_id = prop.id
WHERE rt.label = "Medecin"

-- Requête qui affiche les valeurs des propriétés de l'item "MARTINS Jérémy"
SELECT prop.label,
	val.value
FROM value val 
INNER JOIN property prop
	on prop.id = val.property_id
INNER JOIN resource res
    on val.resource_id = res.id
WHERE res.title = "MARTINS Jérémy"
