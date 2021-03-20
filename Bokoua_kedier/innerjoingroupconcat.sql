select group_concat(Nom_client) as nom, Nom_magasin as magasin
from client as c
inner join magasin as m on c.id_client=m.id_magasin
order by Nom_Client