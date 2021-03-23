<?php

$requete='SELECT * FROM propriostheatre'; 

$lienMySQL=new PDO('mysql:host=localhost;dbname=theatre', 'toto','toto'); 

$resultat=$lienMySQL->query($requete); 

foreach($resultat as $theatre){
    echo($theatre['nomTheatre'].'<br>'); 
    $proprios = explode(',',$theatre['nomProprio']);
    foreach($proprios as $p){
        echo('--- '.$p.'<br>'); 
    }
    echo('<br>');
}

?>