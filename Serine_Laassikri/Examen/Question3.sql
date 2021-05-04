INSERT INTO covidtest.RendezVous (Date, Heure, Nom,Prenom,Present,idDisponibilite_test)
VALUES
('2021-05-04','13:30','Zase','Fred','1','1'),
('2021-05-04','14:30','Kui','Lucie','1','5'),
('2021-05-04','14:30','Xers','Marc','1','6'),
('2021-05-04','14:00','Alfo','Julie','0','3'),
('2021-05-05','14:30','Mulli','Steve','','9'),
('2021-05-05','13:30','Cors','Nathan','','8');

SELECT *
FROM RendezVous

SELECT  Count(*)
FROM RendezVous
WHERE Present = '1'

