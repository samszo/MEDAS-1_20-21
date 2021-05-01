<?php
$lienMySQL = new PDO("mysql:host=localhost:3306;dbname=mydb",'root','root');
$requete = 'SELECT* FROM Magasin';
$resultat = $lienMySQL->query($requete); 
foreach($resultat as $Magasin){
    print_r($Magasin);
}
?>