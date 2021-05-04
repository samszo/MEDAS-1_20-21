SELECT p.prenom, p.nom
FROM patients AS p
JOIN rendez_vous AS r
WHERE r.datetime between '2021-05-04 00:00:01' and '2021-05-04 23:59:59';