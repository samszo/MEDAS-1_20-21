-- 1
SELECT pro.*
FROM resource_template restemp
INNER JOIN resource_template_property restemppro
    on restemp.id = restemppro.resource_template_id
INNER JOIN property pro
    on restemppro.property_id = pro.id
WHERE restemp.label = "agence"

-- 2
SELECT pro.*
	,res.*
FROM property pro
INNER JOIN value val
    on pro.id = val.property_id
INNER JOIN resource res
    on val.resource_id = res.id
WHERE res.title = "assurance habitation"