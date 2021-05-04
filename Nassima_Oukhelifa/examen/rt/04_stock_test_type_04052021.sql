/*Ma base de données contient des informations pour la date de l'examen 04/05/2021*/
/*Quantité de test disponible à ce jour par type de test ?*/
select libelle,quantite from stock s inner join test_covid t on s.id_test = t.id
where s.date = current_date()