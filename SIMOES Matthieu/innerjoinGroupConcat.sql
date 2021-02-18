SELECT 
	s.Annee,group_concat(g.Nom_Gymnase)
FROM 
	seance s
		inner join
	gymnase g on g.idGymnase=s.Gymnase_idGymnase
group by s.annee
