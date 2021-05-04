<?php
	$connexion = new PDO('mysql:host=localhost;dbname=cinemas','root','');
	$sql = 'SELECT * FROM film';
	$resultat = $connexion->query($sql);
	foreach ($resultat as $film)
	{
		echo ($film['FI_Nom'].'<br>');
	}
?>