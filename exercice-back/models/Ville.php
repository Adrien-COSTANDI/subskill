<?php
/**
 * Modèle abstrait d'une ville, lien avec la base de données
 **/

function newVille($BDD, $nom) {
	$stmt = mysqli_prepare($BDD, "INSERT INTO Ville(nom) values(?)");
	mysqli_stmt_bind_param($stmt, 's', $nom);
	mysqli_execute($stmt);
	return mysqli_insert_id($BDD);
}

function getAllVilles($BDD) {
	$res = mysqli_query($BDD, "SELECT id, nom from Ville");

	$ligne = array();
	$villes = array();

	while($ligne = mysqli_fetch_array($res)){
		array_push($villes,
        [
            "id" => $ligne["id"], 
            "nom" =>$ligne["nom"],
        ]);
	}

	return(json_encode($villes));
}

function getNomVille($BDD, $idVille) {
	$stmt = mysqli_prepare($BDD, "SELECT nom from Ville where id=?");
	mysqli_stmt_bind_param($stmt, 's', $idVille);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $nom);
	while(mysqli_stmt_fetch($stmt));
	return $nom;
}


function getIdVille($BDD, $nomVille) {
	$stmt = mysqli_prepare($BDD, "SELECT id from Ville where nom=?");
	mysqli_stmt_bind_param($stmt, 's', $nomVille);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $id);
	while(mysqli_stmt_fetch($stmt));
	return $id;
}


?>