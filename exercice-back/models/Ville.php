<?php
/**
 * Modèle abstrait d'une ville, lien avec la base de données
 *
 * certaines fonctions ne sont pas utilisées, mais pourraient l'être par la suite
 **/

/**
 * crée une nouvelle ville dans la base de données
 *
 * @param $BDD la connexion courante
 * @param $nom le nom souhaité
 *
 * @return id l'identifiant de la nouvelle ville dans la base de données
 */
function newVille($BDD, $nom) {
	$stmt = mysqli_prepare($BDD, "INSERT INTO Ville(nom) values(?)");
	mysqli_stmt_bind_param($stmt, 's', $nom);
	mysqli_execute($stmt);
	return mysqli_insert_id($BDD);
}


/**
 * retourne un objet JSON qui contient la liste de toutes les villes et de leurs identifiants
 *
 * @param $BDD la connexion courante
 *
 * @return villes un tableau formaté en JSON
 */
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

/**
 * permet de retrouver le nom d'une ville si on connait son identifiant
 *
 * @param $BDD la connexion courante
 * @param $idVille l'identifiant de la ville dont on cherche le nom
 *
 * @return nom le nom de la ville
 */
function getNomVille($BDD, $idVille) {
	$stmt = mysqli_prepare($BDD, "SELECT nom from Ville where id=?");
	mysqli_stmt_bind_param($stmt, 's', $idVille);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $nom);
	while(mysqli_stmt_fetch($stmt));
	return $nom;
}

/**
 * opération inverse de getNomVille
 * permet de retrouver l'identifiant d'une ville si on connait son nom
 *
 * @param $BDD la connexion courante
 * @param $nomVille le nom de la ville dont on cherche l'identifiant
 *
 * @return id l'id de la ville
 */
function getIdVille($BDD, $nomVille) {
	$stmt = mysqli_prepare($BDD, "SELECT id from Ville where nom=?");
	mysqli_stmt_bind_param($stmt, 's', $nomVille);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $id);
	while(mysqli_stmt_fetch($stmt));
	return $id;
}


?>