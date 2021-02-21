SELECT  clients.N_client as NumClient,  GROUP_CONCAT(Commandes.N_Commande SEPARATOR ';') AS NumCommande
FROM Commandes
INNER JOIN clients ON  clients.N_client = commandes.N_client


