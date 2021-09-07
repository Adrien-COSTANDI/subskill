<?php
/**
 * Modèle abstrait d'une annonce, lien avec la base de données
 **/

function newAnnonce($BDD) {
	$stmt = mysqli_prepare($BDD, "
    INSERT INTO Annonce(reference, description, date_publication, date_edition, image, intitule, id_entreprise, id_ville, id_metier, id_contrat)
    values(?,?,?,?,?,?,?,?,?,?)");

    $reference = sha1(getNbAnnonces($BDD)+1);
    $date_publication = date("Y-m-d");

	mysqli_stmt_bind_param($stmt, 'ssssssiiii', $reference, $_POST["description"], $date_publication, $date_publication, $_POST["image"], $_POST["intitule"], $_POST["entreprise"], $_POST["ville"], $_POST["metier"], $_POST["contrat"]);
	mysqli_execute($stmt);
	return $reference;
}

function getAnnonce($BDD, $referenceAnnonce) {
	$stmt = mysqli_prepare($BDD, "
    SELECT reference, description, date_publication, image, intitule, Entreprise.nom as nom_entreprise, Ville.nom as nom_ville, Metier.nom as nom_metier, Contrat.nom as nom_contrat
    from Annonce
    INNER JOIN Entreprise on Annonce.id_entreprise = Entreprise.id
    INNER JOIN Metier on Annonce.id_metier = Metier.id
    INNER JOIN Ville on Annonce.id_ville = Ville.id
    INNER JOIN Contrat on Annonce.id_contrat = Contrat.id
    where reference=?");
	mysqli_stmt_bind_param($stmt, 's', $referenceAnnonce);
	mysqli_execute($stmt);
    mysqli_stmt_bind_result($stmt, $reference, $description, $date_publication, $image, $intitule, $nom_entreprise, $nom_ville, $nom_metier, $nom_contrat);
	while(mysqli_stmt_fetch($stmt));

    $annonce = array(
        "reference" => $reference,
        "description" => $description,
        "date_publication" => $date_publication,
        "image" => $image,
        "intitule" => $intitule,
        "nom_entreprise" => $nom_entreprise,
        "nom_ville" => $nom_ville,
        "nom_metier" => $nom_metier,
        "nom_contrat" => $nom_contrat
    );

	return json_encode($annonce);
}

/**
 * retourne la liste des annonces à afficher en fonction du tri, et la page et du filtre
 *
 * @param $BDD la connexion courante à la base de données
 * @param $get le tableau associatif des paramètres $_GET
 *
 * @return String une réponse encodée en JSON
 */
function getAllAnnonces($BDD, $get) {

    // la limite d'annonce par page
    $limit = 10;

    // je gère la page à afficher, si le format ou le nombre ne va pas, j'affiche la première page
    if (isset($get["page"])) {
        if(!is_numeric($get["page"])) {
            $page = 0;
        }
        else {
            $page = $get["page"]-1;
            $page = $page < 0 ? 0 : $page; // si la page est inférieure à 0, elle vaut maintenant 0
        }
    }
    else {
        $page = 0;
    }

    // j'organise mes variables avec le strict nécessaire, ici les filtres uniquement
    $tabFiltres = array();
    foreach ($get as $nomFiltre => $valeurFiltre) {
        if ($nomFiltre !== "page" && $nomFiltre !== "tri") {
            array_push($tabFiltres, [$nomFiltre, $valeurFiltre]);
        }
    }

    /*
    dans la clause where, il y a une faille qui permet à un utilisateur de rentrer l'url avec les paramètres suivants :

    ?metier%5B%5D=1%20or%201=1

    ici, il est possible de sélectionner toutes les annonces à cause du "or 1=1" mais je ne sais pas comment faire autrement
    car la requête est trop complexe pour simplement faire une requête préparée avec des arguments à ajouter

    en soit, ce n'est pas grave, mais ce n'est pas le comportement attendu d'un filtre
    */

    $where = "";
    // s'il y a des filtres
    if (count($tabFiltres) > 0) {
        $where .= "where ";

        for ($filtre = 0; $filtre < count($tabFiltres); $filtre++) {
            for ($j=0; $j < count($tabFiltres[$filtre][1]); $j++) {

                $where .= "id_".$tabFiltres[$filtre][0]." = ".$tabFiltres[$filtre][1][$j];

                if ($j < count($tabFiltres[$filtre][1])-1) {
                    $where.=" or ";
                }
            }
            if ($filtre < count($tabFiltres)-1) {
                $where.=" and ";
            }

        }
        $where .= " ";
    }


    // la requête SQL a beaucoup de jointure car elle doit faire des relations avec les tables qui contiennent les identifiants
    $sql = "
        SELECT reference, description, date_publication, image, intitule, Entreprise.nom as nom_entreprise, Ville.nom as nom_ville, Metier.nom as nom_metier, Contrat.nom as nom_contrat
        FROM Annonce
        INNER JOIN Entreprise on Annonce.id_entreprise = Entreprise.id
        INNER JOIN Metier on Annonce.id_metier = Metier.id
        INNER JOIN Ville on Annonce.id_ville = Ville.id
        INNER JOIN Contrat on Annonce.id_contrat = Contrat.id
        ";
    // on ajoute la clause where
    $sql .= $where;

    // puis on se charge du tri...
    if (isset($get["tri"])) {
        if ($get["tri"] == "dateDesc") {
            $sql .= " order by date_publication desc ";
        }
        if ($get["tri"] == "dateAsc") {
            $sql .= " order by date_publication asc ";
        }
        if ($get["tri"] == "titreAsc") {
            $sql .= " order by intitule asc ";
        }
        if ($get["tri"] == "titreDesc") {
            $sql .= " order by intitule desc ";
        }
    }
    else {
        $sql .= " order by date_publication desc ";
    }

    // ... avant de limiter pour la pagination
    $sql .= "LIMIT ".($limit*$page).", ".$limit;



    $res = mysqli_query($BDD, $sql);

    // en cas d'erreur je ne retourne rien
    if($res === false) {
        return (json_encode(["nbPages"=>0, "annonces"=>array()]));
    }


    // on cherche le nombre d'annonces à afficher au total pour en déduire le nombre de pages
    $query = mysqli_query($BDD, "SELECT count(*) as nbAnnonces from Annonce ".$where);
	$nbAnnonces = mysqli_fetch_array($query)["nbAnnonces"];
    $nbPages = ceil($nbAnnonces/$limit);

    $ligne = array();
	$annonces = array();

    // j'ajoute chaque résultat trouvé dans un tableau $annonces
	while($ligne = mysqli_fetch_array($res)){
		array_push($annonces,
        [
            "reference" => $ligne["reference"],
            "description" =>$ligne["description"],
            "date_publication" =>$ligne["date_publication"],
            "image" =>$ligne["image"],
            "intitule" =>$ligne["intitule"],
            "nom_entreprise" =>$ligne["nom_entreprise"],
            "nom_ville" =>$ligne["nom_ville"],
            "nom_metier" =>$ligne["nom_metier"],
            "nom_contrat" =>$ligne["nom_contrat"],
        ]);
	}

    $reponse = ["nbPages"=>$nbPages, "annonces"=>$annonces];

	return(json_encode($reponse));
}

function getNbAnnonces($BDD) {
    $query = mysqli_query($BDD, "SELECT count(*) as nbAnnonces from Annonce");
	return  mysqli_fetch_array($query)["nbAnnonces"];
}


?>