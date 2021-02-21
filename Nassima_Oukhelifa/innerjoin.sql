select * from clients inner join commandes on clients.N_client = commandes.N_client
inner join produit on produit.N_Produit= commandes.N_Produit


/* SELECT * FROM clients
where Nom= 'OUKHELIFA' */