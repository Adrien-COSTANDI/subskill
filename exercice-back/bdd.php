<?php
/**
 * utilitaire pour la base de donnees
 **/

/**
 * crée et renvoie une connexion vers la base de données
 *
 * @return $BDD la connexion courante
 */
function generBDD(){
	$BDD = mysqli_connect("localhost","userSubskill","Subskill1234","subskill");
	if(!$BDD){
        die("<p>connexion impossible</p>");
	}

    mysqli_set_charset($BDD, "utf8mb4"); // pour récupérer correctement les accents
	return $BDD;
}

/**
 * ferme une connexion vers la base de données
 *
 * @param $BDD la connexion courante
 */
function fermerBDD($BDD){
	mysqli_close($BDD);
}

?>