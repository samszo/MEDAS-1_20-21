# ALERTE INFO, un avion de voyageurs Indiens arrivé en France hier est un possible cluster. 
# Il faut trouver d'urgence un laboratoire laboroatoire en région Parisienne avec une grande capacité d'accueil 
# pour faire tester ces voyageurs avec des PCR spéciaux (les PCR arriveront avec les patients à tester)

SELECT DB_exam_21.laboratoire.nom, DB_exam_21.laboratoire.adresse, DB_exam_21.laboratoire.ville, DB_exam_21.laboratoire.departement
FROM DB_exam_21.laboratoire
WHERE DB_exam_21.laboratoire.capacitéAccueil > 1000
AND   DB_exam_21.laboratoire.departement IN (75, 92, 93, 94, 95, 77)