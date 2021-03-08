<?php

$requete = 'SELECT * FROM patient';

$conn = new PDO("mysql:host=localhost;dbname=mydb", 'root', '');

$resultat = $conn->query($requete);

foreach($resultat as $patient){
    print_r($patient);
}
?>