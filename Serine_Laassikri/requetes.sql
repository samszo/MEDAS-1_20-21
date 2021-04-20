INSERT INTO mydb.Employe (Nom, Prenom, idEntreprise, Tel, Adresse) 
VALUES 
('Dupond','Adrien','Par95','0765342512','12 rue des Myrtilles'),
('Barret','Julie','Bor33','0643256789','4 Avenue De Gaulle'),
('Verdet','Nicolas','Par95','0689765432','36 rue des Tulipes'),
('Cariere','Laurie','Mar13','0762314876','20 rue de Thiais'),
('Ferru','Julie','Mar13','0655128075','78 Avenue Pierre') ;

SELECT *
FROM Employe

SELECT Prenom FROM Employe

SELECT DISTINCT Prenom FROM Employe

SELECT *
FROM Employe
ORDER BY Nom

SELECT *
FROM Employe
ORDER  BY Nom desc

SELECT COUNT(*) FROM Employe

SELECT * FROM Employe
WHERE idEntreprise= 'Mar13'

SELECT * FROM Employe
WHERE Prenom LIKE 'J%'

SELECT Prenom, IdEntreprise FROM Employe WHERE Prenom='Julie'

SELECT *
FROM Contrat

INSERT INTO mydb.Contrat (CDI_CDD, Salaire, Employe_idEmploye)
Values
('CDI', '1780','1'),
('CDI', '2804','2'),
('CDD', '1325','3'),
('CDI', '4250','4'),
('CDD', '2180','5') ;

SELECT * FROM Contrat 
WHERE Salaire >= 2000

SELECT CONCAT (Nom, ' ', Prenom) AS nom_complet
FROM Employe
