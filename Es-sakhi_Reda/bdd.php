<?php


$connexion=new PDO('mysql:host=localhost:3307;dbname=donateur_db', 'root','root'); 
$sql='SELECT * FROM donateur'; 
#$sql2='SELECT * FROM donateur_has_recruteur';


$resultat=$connexion->query($sql); 
#$resultat2=$connexion->query($sql2)

foreach($resultat as $donateur){
    echo($donateur['don_nom']." ".$donateur['don_prenom']." has the id ".$donateur['id_donateur'].'<br>'); 
    
#}
	#foreach ($resultat2 as $donateur_has_recruteur) {

    #echo("ID donateur ".$donateur_has_recruteur['donateur_id_donateur']." est lié à id recruteur ".$donateur_has_recruteur['recruteur_id_recruteur'].'<br>');
		# code...
	}
?> 