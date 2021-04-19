<?php
	$connexion = new PDO('mysql:host=localhost;dbname=e_commerce','root','');
	$sql = 'SELECT * FROM clients';
	$resultat = $connexion->query($sql);
	foreach ($resultat as $client)
	{
		echo ($client['Nom'].'<br>');
	}
?>