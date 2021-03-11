select group_concat(e.nom) as eleve, d.nom
from eleve as e
inner join danse as d on e.idEleve=d.idDanse
order by e.nom