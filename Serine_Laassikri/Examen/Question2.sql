INSERT INTO covidtest.Personnes_testees (Nom,Prenom,Age,Sexe,Ville,rv_idDisponibilite_test)
VALUES
('Zase','Fred','26','M','Bordeaux','1'),
('Kui','Lucie','19','F','Merignac','2'),
('Xers','Marc','45','M','Le Bouscat','3'),
('Alfo','Julie','28','F','Eysines','4');


SELECT *
FROM Personnes_testees

SELECT CONCAT (Nom, ' ', Prenom) AS Patient
FROM Personnes_testees