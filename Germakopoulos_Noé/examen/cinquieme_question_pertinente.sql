# Une nouvelle vague approche, identifions les laboroatoires avec peu de tests sérologiques

SELECT DB_exam_21.laboratoire.nom, DB_exam_21.laboratoire.adresse, DB_exam_21.laboratoire.ville, DB_exam_21.laboratoire.departement
FROM  DB_exam_21.laboratoire, DB_exam_21.nombreTestDispoJournaliers
WHERE DB_exam_21.laboratoire.idlaboratoire = DB_exam_21.nombreTestDispoJournaliers.laboratoire_idlaboratoire
AND DB_exam_21.nombreTestDispoJournaliers.nbSerologique < 100