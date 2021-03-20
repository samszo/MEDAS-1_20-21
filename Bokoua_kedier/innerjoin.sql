select nom_client, Nom_magasin
from client as c
inner join magasin as m on c.id_Client=m.id_Magasin