
SELECT p.*
FROM property  P INNER JOIN resource_template_property rtp 
on  p.id = rtp.property_id
inner join resource_template rt
on rt.id = rtp.resource_template_id
WHERE rt.label = "client"







