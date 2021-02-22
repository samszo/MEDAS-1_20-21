select group_concat(concat(nom_professeur,',' ,prenom_professeur) separator=';') as enseignant
from professeur as p
inner join cours_spécifiques as c on p.id_professeur=c.id_professeur
order by nom_professeur
