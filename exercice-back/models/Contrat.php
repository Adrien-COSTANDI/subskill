<?php
/**
 * Modèle abstrait d'un contrat, lien avec la base de données
 **/

function newContrat($BDD, $nom) {
	$stmt = mysqli_prepare($BDD, "INSERT INTO Contrat(nom) values(?)");
	mysqli_stmt_bind_param($stmt, 's', $nom);
	mysqli_execute($stmt);
	return mysqli_insert_id($BDD);
}

function getAllContrats($BDD) {
	$res = mysqli_query($BDD, "SELECT id, nom from Contrat");

	$ligne = array();
	$contrats = array();

	while($ligne = mysqli_fetch_array($res)){
		array_push($contrats,
        [
            "id" => $ligne["id"],
            "nom" =>$ligne["nom"],
        ]);
	}

	return(json_encode($contrats));
}

function getNomContrat($BDD, $idContrat) {
	$stmt = mysqli_prepare($BDD, "SELECT nom from Contrat where id=?");
	mysqli_stmt_bind_param($stmt, 's', $idContrat);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $nom);
	while(mysqli_stmt_fetch($stmt));
	return $nom;
}


function getIdContrat($BDD, $nomContrat) {
	$stmt = mysqli_prepare($BDD, "SELECT id from Contrat where nom=?");
	mysqli_stmt_bind_param($stmt, 's', $nomContrat);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $id);
	while(mysqli_stmt_fetch($stmt));
	return $id;
}


?>