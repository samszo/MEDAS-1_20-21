SELECT em.Nom, em.Profession, ca.Nom AS "Lieu de travail"
FROM employes em
INNER JOIN employes_has_campus
ON id_employes = employes_id_employes
INNER JOIN campus ca
ON campus_id_campus = id_campus
WHERE id_campus = 2
ORDER BY em.Profession