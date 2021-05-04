/*Ma base de données contient des informations pour la date de l'examen 04/05/2021*/
/*combien de personnes ont été testées aujourd'hui ?*/
select count(id_patient) from rdv where date = current_date() and effectue ='O'