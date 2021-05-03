-- select property for ressource template "association pap"

SELECT p.local_name, rt.label, rt.id
FROM property p
INNER JOIN resource_template_property rtp ON rtp.property_id = p.id
INNER JOIN resource_template rt ON rt.id = rtp.resource_template_id
WHERE rt.id = 12

-- select property values for item "adhésion 1"
SELECT r.id, r.title, p.label, v.value, v.type,v.value_resource_id, rAD.title
FROM property p
INNER JOIN value v
    on p.id = v.property_id
INNER JOIN resource r
    on v.resource_id = r.id
LEFT JOIN resource rAD on rAD.id = v.value_resource_id
WHERE r.title = "adhésion 1";
