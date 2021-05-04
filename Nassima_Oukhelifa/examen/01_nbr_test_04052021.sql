/*Ma base de données contient des informations pour la date de l'examen 04/05/2021*/
/*combien de test sont disponibles aujourd'hui ?*/

select sum(quantite) from stock where date = current_date()
