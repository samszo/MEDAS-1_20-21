select e.nom, e.prenom, d.nom
from eleve as e
inner join danse as d on e.idEleve=d.idDanse