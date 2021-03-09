<?
$requete="SELECT * FROM classes
WHERE Annee_etude BETWEEN '2012' AND '2021'";
$lienMySQL=new PDO('mysql:host=localhost;dbname=bdd_univ', 'root', 'root');
$resultat=$lienMySQL->query($requete);
foreach($resultat as $classe){
	print_r($classe);
	echo "<br>";
	}
?>