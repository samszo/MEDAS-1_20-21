select nom, prenom, commandes.N_Commande from clients  inner join commandes on clients.N_client = commandes.N_client
inner join produit on produit.N_Produit= commandes.N_Produit
WHERE DateCommande BETWEEN '2020-10-20' AND '2021-02-10' AND clients.N_client = '1'
