# Afficher la liste des propriétés d'un ressource template
SELECT pro.*
FROM resource_template rest
INNER JOIN resource_template_property restpro
on rest.id = restpro.resource_template_id
INNER JOIN property pro
on restpro.property_id = pro.id
WHERE rest.label = "classes"

# Afficher les valeurs des propriétés d'un item
SELECT res.id, res.title, pro.label,  val.value
FROM property pro
INNER JOIN value val
on pro.id = val.property_id
INNER JOIN resource res
on val.resource_id = res.id
WHERE res.title = "Mathématiques"