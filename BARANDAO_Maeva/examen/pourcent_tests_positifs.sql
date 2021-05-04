-- répond à "quel est le pourcentage de tests positifs ?"
select count(pos_ou_neg) / (select count(*) from resultat ) * 100 as Pourcentage_tests_positifs
from resultat
where pos_ou_neg = 'positif';