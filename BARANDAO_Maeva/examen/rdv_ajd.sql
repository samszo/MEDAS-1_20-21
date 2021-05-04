-- donne les personnes ayant rdv aujourd'hui
select concat(upper(Nom_personne),' ', Prenom_personne) as personnes_ayant_rdv_ajd, , Lieu
from personne 
	inner join 
    rdv on idPersonne = Personne_idPersonne 
where date_rdv=date(now());
