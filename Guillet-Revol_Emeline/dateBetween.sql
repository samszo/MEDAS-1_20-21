SELECT SE_Date as "Date Seance", SE_Horraire as Horraire, FI_Nom as Nom_Film, CIN_Nom as Cinema
FROM seance
INNER JOIN cinema ON SALLE_has_FILM_SALLE_CINEMA_CIN_Code = CIN_Code
INNER JOIN film ON SALLE_has_FILM_FILM_FI_Code = FI_Code
WHERE SE_Date BETWEEN '2021-02-14' AND '2021-02-15'