<?php
/**
 * Modèle abstrait d'un metier, lien avec la base de données
 **/

function newMetier($BDD, $nom) {
	$stmt = mysqli_prepare($BDD, "INSERT INTO Metier(nom) values(?)");
	mysqli_stmt_bind_param($stmt, 's', $nom);
	mysqli_execute($stmt);
	return mysqli_insert_id($BDD);
}

function getAllMetiers($BDD) {
	$res = mysqli_query($BDD, "SELECT id, nom from Metier");

	$ligne = array();
	$metiers = array();
    
	while($ligne = mysqli_fetch_array($res)){
		array_push($metiers, 
        [
            "id" => $ligne["id"], 
            "nom" =>$ligne["nom"],
        ]);
	}

	return(json_encode($metiers));
}

function getNomMetier($BDD, $idMetier) {
	$stmt = mysqli_prepare($BDD, "SELECT nom from Metier where id=?");
	mysqli_stmt_bind_param($stmt, 's', $idMetier);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $nom);
	while(mysqli_stmt_fetch($stmt));
	return $nom;
}


function getIdMetier($BDD, $nomMetier) {
	$stmt = mysqli_prepare($BDD, "SELECT id from Metier where nom=?");
	mysqli_stmt_bind_param($stmt, 's', $nomMetier);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $id);
	while(mysqli_stmt_fetch($stmt));
	return $id;
}


?>