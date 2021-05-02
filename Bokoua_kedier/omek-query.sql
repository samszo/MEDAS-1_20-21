SELECT *
FROM property  P INNER JOIN resource_template_property rtp 
on  p.id = rtp.property_id
inner join resource_template rt
on rt.id = rtp.resource_template_id
WHERE rt.label = "magasin";

SELECT  r.title,p.*,r.*
FROM property p
INNER JOIN value v
    on p.id = v.property_id
INNER JOIN resource r
    on v.resource_id = r.id
WHERE r.title  = "Client"

