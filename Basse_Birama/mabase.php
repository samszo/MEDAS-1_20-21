<?php

$lienMySQL = new PDO("mysql:host=localhost:3306;dbname=mydb",'root','root');

$requete = 'SELECT* FROM eleve';

$resultat = $lienMySQL->query($requete); 

foreach($resultat as $eleve){
	print_r($eleve);
}
?>