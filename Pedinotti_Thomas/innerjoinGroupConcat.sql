select  group_concat(concat(regions_commerciales.id_region, agences.id_agence, contrats.id_contrats), separator= ' ') from regions_commerciales 
inner join agences on regions_commerciales.id_region=agences.iid_region inner join contrats on agences.id_agence=contrats.agences_id_agence
