/*Ma base de données contient des informations pour la date de l'examen 04/05/2021*/
/*Nombre de test effectué aujourd'hui par type de test ?*/
select t.id, libelle, count(*) from patient p inner join rdv r on p.id = r.id_patient
inner join test_covid t on r.id_test = t.id 
 where date = current_date() and effectue = 'O'
 group by t.id,libelle
 
