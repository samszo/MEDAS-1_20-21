-- on suppose que la base de données est mise à jour tous les jours

-- donne le nombre total de tests disponibles
select sum(Nb_dispo) from test;

-- donne le nombre de tests pcr disponibles
select Nom_test, Nb_dispo
from test
where idTest = 1;