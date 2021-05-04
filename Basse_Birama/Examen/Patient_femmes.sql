---La liste des patients de genre Féminin et leurs heures de rdv 

SELECT NomPatient, PrenomPatient, DateNaiss, Genre, HeureRdv
from patient as p
inner join rendezvous as r on p.idPatient = r.idPatient
where Genre = 'F';