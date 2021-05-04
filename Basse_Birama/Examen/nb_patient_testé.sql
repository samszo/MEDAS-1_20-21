SELECT COUNT(idPatient) as nb_patient_testé
from patient as p, test as t
where p.idPatient = t.idTest ;