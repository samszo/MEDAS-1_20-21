INSERT INTO covidtest.Resultats_tests (Nom,Prenom,Resultat,idDisponibilite_test)
VALUES
('Zase','Fred','Négatif','1'),
('Kui','Lucie','Négatif','2'),
('Xers','Marc','Négatif','3'),
('Alfo','Julie','Positif','4');


SELECT *
FROM Resultats_tests

SELECT  Count(*)
FROM Resultats_tests
WHERE Resultat = 'Négatif'