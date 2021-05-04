-- #### répond à "quelle est la moyenne d'age par résultat de test ?" ####
select pos_ou_neg as resultat_test, round(avg(Age)) as moyenne_age
from resultat
inner join rdv on RDV_idRDV = idRDV
inner join personne on Personne_idPersonne = idPersonne
group by pos_ou_neg;

-- #### ou quels sont les ages des personnes testées selon le résultat du test ? (pour un graphique par exemple) ####
-- select pos_ou_neg as resultat_test, group_concat(' ',Age) as age_s
-- from resultat
-- inner join rdv on RDV_idRDV = idRDV
-- inner join personne on Personne_idPersonne = idPersonne
-- group by pos_ou_neg;