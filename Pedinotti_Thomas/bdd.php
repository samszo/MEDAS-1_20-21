<?php
	$bdd = new PDO('mysql:host=localhost;dbname=mydb', 'root', 'root');
    $req='SELECT * FROM agences';
    $rep=$bdd->query($req);
    foreach($rep as $agences){
        echo $agences['id_agence'];
        echo '<br>';
?>
