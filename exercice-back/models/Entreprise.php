<?php
/**
 * Modèle abstrait d'une entreprise, lien avec la base de données
 **/

function newEntreprise($BDD, $nom) {
	$stmt = mysqli_prepare($BDD, "INSERT INTO Entreprise(nom) values(?)");
	mysqli_stmt_bind_param($stmt, 's', $nom);
	mysqli_execute($stmt);
	return mysqli_insert_id($BDD);
}

function getAllEntreprises($BDD) {
	$res = mysqli_query($BDD, "SELECT id, nom from Entreprise");
    $ligne = array();
	$entreprises = array();
    
	while($ligne = mysqli_fetch_array($res)){
		array_push($entreprises, ["id" => $ligne["id"], "nom" =>$ligne["nom"]]);
	}

	return(json_encode($entreprises));
}

function getNomEntreprise($BDD, $idEntreprise) {
	$stmt = mysqli_prepare($BDD, "SELECT nom from Entreprise where id=?");
	mysqli_stmt_bind_param($stmt, 's', $idEntreprise);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $nom);
	while(mysqli_stmt_fetch($stmt));
	return $nom;
}


function getIdEntreprise($BDD, $nomEntreprise) {
	$stmt = mysqli_prepare($BDD, "SELECT id from Entreprise where nom=?");
	mysqli_stmt_bind_param($stmt, 's', $nomEntreprise);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $id);
	while(mysqli_stmt_fetch($stmt));
	return $id;
}


?>