<?php
	$bdd = new PDO('mysql:host=localhost;dbname=mydb', 'root', 'root');
    $sql='SELECT * FROM clients';
    $resultat=$bdd->query($sql);
    foreach($resultat as $clients){
        echo $clients['id_client'];
        echo '<br>';
?>