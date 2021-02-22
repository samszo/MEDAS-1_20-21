SELECT Nom, Prénom
FROM Personne
inner join Personne_has_Appartement
on Personne_idPersonne = idPersonne
inner join Appartement
on Appartement_idAppartement = idAppartement