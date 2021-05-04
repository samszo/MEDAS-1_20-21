SELECT DB_exam_21.personne.nom, DB_exam_21.personne.prenom
FROM DB_exam_21.personne, DB_exam_21.rendezVous
WHERE DB_exam_21.personne.numSS = DB_exam_21.rendezVous.Personne_numSS
AND DB_exam_21.rendezVous.dateJour = "04/05/2021"
