select regions_commerciales.id_region, agences.id_agence, contrats.id_contrats from mydb.regions_commerciales 
inner join mydb.agences on regions_commerciales.id_region=agences.iid_region inner join mydb.contrats on agences.id_agence=contrats.agences_id_agence
