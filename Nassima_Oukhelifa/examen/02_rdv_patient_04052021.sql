/*Ma base de données contient des informations pour la date de l'examen 04/05/2021*/
/*qui sont les personnes qui ont rendez-vous aujourd'hui ?*/
select p.nom,p.prenom from patient p inner join rdv r on p.id=r.id_patient where date = current_date()