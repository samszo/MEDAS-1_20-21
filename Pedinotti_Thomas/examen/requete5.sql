SELECT sum(nbr_test) FROM `centres de depistage` 
join departements
on departements.code_insee_d=  `centres de depistage`.code_insee_d
where departements.code_insee_d= 75