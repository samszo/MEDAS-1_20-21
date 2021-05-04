-- donne le nombre de personnes testées aujourd'hui
select count(Personne_idPersonne) as Nb_personnes_testes_ajd      
from rdv
where heure_rdv = date(now());

