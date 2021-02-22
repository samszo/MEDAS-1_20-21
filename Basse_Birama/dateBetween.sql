select c.nom_cours, prix
from cours_spécifiques as c
inner join seance as s on c.nom_cours=s.nom_cours
where horaire between '10:00' and '14:00'