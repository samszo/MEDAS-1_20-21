select count(idTest) as nb_test_dispo
from rendezvous 
where DateRdv = current_date() ;