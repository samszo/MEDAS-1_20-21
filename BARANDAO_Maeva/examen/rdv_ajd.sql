-- donne les personnes ayant rdv aujourd'hui
select concat(upper(Nom_personne),' ', Prenom_personne), Lieu as personnes_ayant_rdv_ajd
from personne 
	inner join 
    rdv on idPersonne = Personne_idPersonne 
where date_rdv=date(now());
