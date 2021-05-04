SELECT NomPatient, PrenomPatient 
from patient as p, rendezvous as r 
where p.idPatient=r.idPatient