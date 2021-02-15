SELECT CIN_Nom as NomCinema, GROUP_CONCAT(FI_Nom SEPARATOR ', ') AS NomFilm
FROM film
INNER JOIN film_has_cinema ON FILM_FI_Code = FI_Code
INNER JOIN cinema ON CINEMA_CIN_Code = CIN_Code
GROUP BY NomCinema