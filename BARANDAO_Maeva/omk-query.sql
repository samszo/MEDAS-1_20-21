-- Affiche les noms des propriétés du resource template Article
select p.local_name
from property as p 
  INNER JOIN 
  resource_template_property as rtp ON p.id = rtp.property_id
  INNER JOIN 
  resource_template as rt ON rt.id = rtp.resource_template_id
where rt.id = 4;

-- donne les valeurs des propriétés d'un item
select label, value 
from value as v
  INNER JOIN 
  property as p ON v.property_id = p.id
  INNER JOIN 
  resource as r ON v.resource_id = r.id
where v.resource_id = 6;
