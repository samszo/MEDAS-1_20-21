select d.nom, tarif
from danse as d
inner join seance as s on d.idDanse=s.idSeance
where dateSeance between '2021-04-02' and '2021-04-05'