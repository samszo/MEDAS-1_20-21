SELECT GROUP_CONCAT(
CONCAT(Numero_classe, " (", Nombre_etudiants, " étudiants)") SEPARATOR " ; ")
AS Nb_eleves_par_classes, fil.Nom
AS Filiere, fil.Nom_des_batiments
AS Batiment
FROM classes`bdd_univ`
INNER JOIN filieres fil
ON filieres_id_filieres = id_filieres
WHERE id_filieres = 3