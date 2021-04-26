-- Affiche les noms des propriétés du resource template Article
select p.local_name
from property as p JOIN resource_template_property as rtp ON p.id = rtp.property_id
where rtp.resource_template_id = (select id from resource_template where label = "Article");

-- donne les valeurs des propriétés d'un item
select value from value where resource_id = 6; 