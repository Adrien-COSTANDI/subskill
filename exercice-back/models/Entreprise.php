<?php
/**
 * Modèle abstrait d'une entreprise, lien avec la base de données
 *
 * certaines fonctions ne sont pas utilisées, mais pourraient l'être par la suite
 **/

/**
 * crée une nouvelle entreprise dans la base de données
 *
 * @param $BDD la connexion courante
 * @param $nom le nom souhaité
 *
 * @return id l'identifiant de la nouvelle entreprise dans la base de données
 */
function newEntreprise($BDD, $nom) {
	$stmt = mysqli_prepare($BDD, "INSERT INTO Entreprise(nom) values(?)");
	mysqli_stmt_bind_param($stmt, 's', $nom);
	mysqli_execute($stmt);
	return mysqli_insert_id($BDD);
}


/**
 * retourne un objet JSON qui contient la liste de toutes les entreprises et de leurs identifiants
 *
 * @param $BDD la connexion courante
 *
 * @return entreprises un tableau formaté en JSON
 */
function getAllEntreprises($BDD) {
	$res = mysqli_query($BDD, "SELECT id, nom from Entreprise");
    $ligne = array();
	$entreprises = array();
    
	while($ligne = mysqli_fetch_array($res)){
		array_push($entreprises, ["id" => $ligne["id"], "nom" =>$ligne["nom"]]);
	}

	return(json_encode($entreprises));
}

/**
 * permet de retrouver le nom d'une entreprise si on connait son identifiant
 *
 * @param $BDD la connexion courante
 * @param $idEntreprise l'identifiant de l'entreprise dont on cherche le nom
 *
 * @return nom le nom de l'entreprise
 */

function getNomEntreprise($BDD, $idEntreprise) {
	$stmt = mysqli_prepare($BDD, "SELECT nom from Entreprise where id=?");
	mysqli_stmt_bind_param($stmt, 's', $idEntreprise);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $nom);
	while(mysqli_stmt_fetch($stmt));
	return $nom;
}

/**
 * opération inverse de getNomEntreprise
 * permet de retrouver l'identifiant d'une entreprise si on connait son nom
 *
 * @param $BDD la connexion courante
 * @param $nomEntreprise le nom de l'entreprise dont on cherche l'identifiant
 *
 * @return id l'id de l'entreprise
 */
function getIdEntreprise($BDD, $nomEntreprise) {
	$stmt = mysqli_prepare($BDD, "SELECT id from Entreprise where nom=?");
	mysqli_stmt_bind_param($stmt, 's', $nomEntreprise);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $id);
	while(mysqli_stmt_fetch($stmt));
	return $id;
}


?>