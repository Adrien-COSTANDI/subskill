<?php
/**
 * Modèle abstrait d'un contrat, lien avec la base de données
 *
 * certaines fonctions ne sont pas utilisées, mais pourraient l'être par la suite
 **/


/**
 * crée un nouveau contrat dans la base de données
 *
 * @param $BDD la connexion courante
 * @param $nom le nom souhaité
 *
 * @return id l'identifiant du nouveau contrat dans la base de données
 */
function newContrat($BDD, $nom) {
	$stmt = mysqli_prepare($BDD, "INSERT INTO Contrat(nom) values(?)");
	mysqli_stmt_bind_param($stmt, 's', $nom);
	mysqli_execute($stmt);
	return mysqli_insert_id($BDD);
}

/**
 * retourne un objet JSON qui contient la liste de tous les contrats et de leurs identifiants
 *
 * @param $BDD la connexion courante
 *
 * @return contrats un tableau formaté en JSON
 */
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

/**
 * permet de retrouver le nom d'un contrat si on connait son identifiant
 *
 * @param $BDD la connexion courante
 * @param $idContrat l'identifiant du contrat dont on cherche le nom
 *
 * @return nom le nom du contrat
 */
function getNomContrat($BDD, $idContrat) {
	$stmt = mysqli_prepare($BDD, "SELECT nom from Contrat where id=?");
	mysqli_stmt_bind_param($stmt, 's', $idContrat);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $nom);
	while(mysqli_stmt_fetch($stmt));
	return $nom;
}

/**
 * opération inverse de getNomContrat
 * permet de retrouver l'identifiant d'un contrat si on connait son nom
 *
 * @param $BDD la connexion courante
 * @param $nomContrat le nom du contrat dont on cherche l'identifiant
 *
 * @return id l'id du contrat
 */
function getIdContrat($BDD, $nomContrat) {
	$stmt = mysqli_prepare($BDD, "SELECT id from Contrat where nom=?");
	mysqli_stmt_bind_param($stmt, 's', $nomContrat);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $id);
	while(mysqli_stmt_fetch($stmt));
	return $id;
}


?>