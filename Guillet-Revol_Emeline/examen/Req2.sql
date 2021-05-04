-- Centre les plus visités
SELECT count(D.centre_ID_C) as Nb_Visite, Adr_C, Ville_C, CP_C
FROM Centre C
INNER JOIN Depister D ON  D.centre_ID_C = C.ID_C
GROUP BY Adr_C, Ville_C, CP_C
Order By 1 Desc