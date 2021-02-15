SELECT SA_Code as "Salle", SA_NbPlace as "NbPlace", CIN_Nom as "NomCinéma"
FROM salle
INNER JOIN cinema ON CIN_CODE = CINEMA_CIN_Code