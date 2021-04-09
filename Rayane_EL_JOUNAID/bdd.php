<?php
    $bdd = new PDO('mysql:host=localhost;dbname=livre', 'root', '');
    $req='SELECT * FROM auteur';
    $rep=$bdd->query($req);
    foreach($rep as $auteur){
        //print_r($auteur);
        echo $auteur['nom'];
        echo '<br>';
    }
?>