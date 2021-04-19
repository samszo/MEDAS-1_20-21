<?php

$lienMySQL=new PDO(
	'mysql:host=localhost:3308;dbname=mydb','root','root');

$requete='SELECT * FROM Opérateurs';

$resultat=$lienMySQL->query($requete);

foreach($resultat as $operateur){
	echo($operateur['poste'].'<br>'.$operateur['région'].'<br>'.$operateur['mail'].'<br>'.'<br>'); //print_r($operateur); // ou  // cf. 109mn, 23 février
}

?>