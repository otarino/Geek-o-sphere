<?php

	$bdd = new PDO('mysql:host=localhost;dbname=geek-o-sphere', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
	session_start();

	$req="";
	$a=false;
	if (isset($_SESSION['articles']) && $_SESSION['articles'] != '') {
		$req = ' categorie="'.$_SESSION['articles'].'"';
		$a=true;
	}
	$req2="";
	$b=false;
	if (isset($_SESSION['categorie']) && $_SESSION['categorie'] != '') {
		$req2 = ' sous_categorie="'.$_SESSION['categorie'].'"';
		$b=true;
	}

	$reqf="";
	if ($a == true && $b == true) {
		$reqf = 'WHERE ('.$req.' AND '.$req2.')';
	} else if ($a == true && $b == false) {
		$reqf = 'WHERE '.$req;
	} else if ($a == false && $b == true) {
		$reqf = 'WHERE '.$req2;
	}

	print ('<tr>
			<td> ID 
			<td> Categorie 
			<td> Nom 
			<td> Image 
			<td> Quantité 
			<td> Nb_Magasin 
			<td> Prix 
			<td> Sous-Categorie 
	');

	$requete = $bdd->query('SELECT * FROM articles '.$reqf);
	while ( $donnees = $requete -> fetch()) {

		print ('<tr>
				<td>'.utf8_encode($donnees['idArticles']).'
				<td>'.utf8_encode($donnees['categorie']).'
				<td>'.utf8_encode($donnees['nom']).'
				<td><img src="./'.utf8_encode($donnees['image']).'">
				<td>'.utf8_encode($donnees['quantite']).'
				<td>'.utf8_encode($donnees['idMagasins']).'
				<td>'.utf8_encode($donnees['prix']).'€
				<td>'.utf8_encode($donnees['sous_categorie'])
		);

	}

?>
