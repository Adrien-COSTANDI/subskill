<?php
/**
 * Modèle abstrait d'un metier, lien avec la base de données
 *
 * certaines fonctions ne sont pas utilisées, mais pourraient l'être par la suite
 **/

/**
* crée un nouveau métier dans la base de données
*
* @param $BDD la connexion courante
* @param $nom le nom souhaité
*
* @return id l'identifiant du nouveau métier dans la base de données
*/
function newMetier($BDD, $nom) {
	$stmt = mysqli_prepare($BDD, "INSERT INTO Metier(nom) values(?)");
	mysqli_stmt_bind_param($stmt, 's', $nom);
	mysqli_execute($stmt);
	return mysqli_insert_id($BDD);
}

/**
 * retourne un objet JSON qui contient la liste de tous les métiers et de leurs identifiants
 *
 * @param $BDD la connexion courante
 *
 * @return metiers un tableau formaté en JSON
 */
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

/**
 * permet de retrouver le nom d'un métier si on connait son identifiant
 *
 * @param $BDD la connexion courante
 * @param $idMetier l'identifiant du métier dont on cherche le nom
 *
 * @return nom le nom du métier
 */
function getNomMetier($BDD, $idMetier) {
	$stmt = mysqli_prepare($BDD, "SELECT nom from Metier where id=?");
	mysqli_stmt_bind_param($stmt, 's', $idMetier);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $nom);
	while(mysqli_stmt_fetch($stmt));
	return $nom;
}

/**
 * opération inverse de getNomMetier
 * permet de retrouver l'identifiant d'un métier si on connait son nom
 *
 * @param $BDD la connexion courante
 * @param $nomMetier le nom du métier dont on cherche l'identifiant
 *
 * @return id l'id du métier
 */
function getIdMetier($BDD, $nomMetier) {
	$stmt = mysqli_prepare($BDD, "SELECT id from Metier where nom=?");
	mysqli_stmt_bind_param($stmt, 's', $nomMetier);
	mysqli_execute($stmt);
	mysqli_stmt_bind_result($stmt, $id);
	while(mysqli_stmt_fetch($stmt));
	return $id;
}


?>