SELECT NomPatient, PrenomPatient, DateRdv, HeureRdv, LieuRdv
from patient as p, rendezvous as r 
where p.idPatient=r.idPatient