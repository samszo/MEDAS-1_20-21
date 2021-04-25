### Afficher la liste des propriétés d'un ressource template
SELECT p.*
FROM resource_template rt
INNER JOIN resource_template_property rtp
on rt.id = rtp.resource_template_id
INNER JOIN property p
on rtp.property_id = p.id
WHERE rt.label = "classes"

### Afficher les valeurs des propriétés d'un item
SELECT p.*, r.*
FROM property p
INNER JOIN value v
on p.id = v.property_id
INNER JOIN resource r
on v.resource_id = r.id
WHERE r.title = "Mathématiques"