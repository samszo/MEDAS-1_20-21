select p.nom, p.prenom 
from Professeur as p 
inner join cours_spécifiques as c on p.id_professeur=c.id_professeur