---Les patients de genre Masculin et dont les noms commencent par A.

SELECT NomPatient, PrenomPatient, DateNaiss, Genre
from patient 
where Genre = 'M' and NomPatient like 'A%' ;