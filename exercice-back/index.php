<?php
    include "./bdd.php";
    include "./models/Entreprise.php";
    include "./models/Ville.php";
    include "./models/Contrat.php";
    include "./models/Metier.php";
    include "./models/Annonce.php";
    $BDD = generBDD();

    date_default_timezone_set('Europe/Paris');

    setlocale (LC_TIME, 'fra.utf8');

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Subskill</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
</head>
<body>

    <?php
    // ces tableaux sont moins embêtants à écrire, c'est du confort
    if (isset($_GET["metier"])) {
        $tabMetiers = $_GET["metier"];
    }

    if (isset($_GET["contrat"])) {
        $tabContrats = $_GET["contrat"];
    }

    if (isset($_GET["ville"])) {
        $tabVilles = $_GET["ville"];
    }

    ?>

    <nav>
        <!-- la section pour utiliser les filtres, c'est un formulaire -->
        <form action="" method="GET" id="formulaire">

            <!-- les labels sont présent pour l'aide vocale en cas de besoin, mais n'ont pas besoin d'être visibles -->
            <label style="display:none" for="metier">Métier</label>

            <select class="" name="metier[]" id="metier" multiple>
                <option value="" disabled >Métier</option>
                <?php

                // la liste des valeurs du filtre
                foreach (json_decode(getAllMetiers($BDD)) as $metier) {

                    // si le filtre est utilisé, on le selectionne dans la liste
                    if (in_array($metier->id, $tabMetiers)) {
                        echo("<option value=\"".htmlspecialchars($metier->id)."\" selected>".htmlspecialchars($metier->nom)."</option>");
                    }
                    else {
                        echo("<option value=\"".htmlspecialchars($metier->id)."\">".htmlspecialchars($metier->nom)."</option>");
                    }
                }
                ?>
            </select>

            <!-- les labels sont présent pour l'aide vocale en cas de besoin, mais n'ont pas besoin d'être visibles -->
            <label style="display:none" for="contrat">Contrat</label>

            <select class="" name="contrat[]" id="contrat" multiple>
                <option value="" disabled >Contrat</option>
                <?php

                // la liste des valeurs du filtre
                foreach (json_decode(getAllContrats($BDD)) as $contrat) {

                    // si le filtre est utilisé, on le selectionne dans la liste
                    if (in_array($contrat->id, $tabContrats)) {
                        echo("<option value=\"".htmlspecialchars($contrat->id)."\" selected>".htmlspecialchars($contrat->nom)."</option>");
                    }
                    else {
                        echo("<option value=\"".htmlspecialchars($contrat->id)."\">".htmlspecialchars($contrat->nom)."</option>");
                    }
                }
                ?>
            </select>

            <!-- les labels sont présent pour l'aide vocale en cas de besoin, mais n'ont pas besoin d'être visibles -->
            <label style="display:none" for="ville">Ville</label>

            <select class="" name="ville[]" id="ville" multiple>
                <option value="" disabled >Ville</option>
                <?php

                // la liste des valeurs du filtre
                foreach (json_decode(getAllVilles($BDD)) as $ville) {

                    // si le filtre est utilisé, on le selectionne dans la liste
                    if (in_array($ville->id, $tabVilles)) {
                        echo("<option value=\"".htmlspecialchars($ville->id)."\" selected>".htmlspecialchars($ville->nom)."</option>");
                    }
                    else {
                        echo("<option value=\"".htmlspecialchars($ville->id)."\">".htmlspecialchars($ville->nom)."</option>");
                    }
                }
                ?>
            </select>

            <!-- les labels sont présent pour l'aide vocale en cas de besoin, mais n'ont pas besoin d'être visibles -->
            <label style="display:none" for="tri">Tri</label>

            <select onchange="trier()" name="tri" id="tri" class="position-absolute top-0 end-0">

                <option value="dateDesc" <?php if(isset($_GET["tri"]) && $_GET["tri"] == "dateDesc") echo "selected" ?>>date récent - ancien</option>
                <option value="dateAsc" <?php if(isset($_GET["tri"]) && $_GET["tri"] == "dateAsc") echo "selected" ?>>date ancien - récent</option>

                <option value="titreAsc" <?php if(isset($_GET["tri"]) && $_GET["tri"] == "titreAsc") echo "selected" ?>>titre A - Z</option>
                <option value="titreDesc" <?php if(isset($_GET["tri"]) && $_GET["tri"] == "titreDesc") echo "selected" ?>>titre Z - A</option>
            </select>

            <button class="btn btn-outline-primary" type="button" onclick="reinitialiserFiltres()">Réinitialiser les filtres</button>
            <button class="btn btn-outline-primary" type="submit">Filtrer</button>

        </form>
    </nav>


    <table class="container table table-lg table-hover">
        <tbody>


        <?php
        // maintenant on va afficher les annonces disponibles
        // $reponse est un objet qui contient à la fois les annonces, et le nombre de pages nécessaires
        $reponse = json_decode(getAllAnnonces($BDD, $_GET));

        foreach ($reponse->annonces as $annonce) {

        ?>
            <tr class="row">
                <td class="col-2">
                    <img src="<?php echo htmlspecialchars($annonce->image) ?>"  alt="image" width="100" height="100">
                </td>
                <td class="col">
                    <div>
                        <?php echo strftime("%A %d %B %G", strtotime($annonce->date_publication)) ?>
                        <br>
                        <?php echo htmlspecialchars($annonce->nom_entreprise),"/",htmlspecialchars($annonce->intitule) ?>
                        <br>
                        <?php echo htmlspecialchars($annonce->reference) ?>
                        <br>
                        <?php echo htmlspecialchars($annonce->nom_metier),"/",htmlspecialchars($annonce->nom_contrat),"/", htmlspecialchars($annonce->nom_ville) ?>
                        <br>
                        <?php echo htmlspecialchars(substr($annonce->description, 0,30)),"..." ?>
                    </div>
                </td>
            </tr>
        <?php
        } // fin du foreach
        ?>

        </tbody>
    </table>

    <?php

    // enfin, la pagination doit conserver les arguments de la recherche
    $args = "";
    foreach ($_GET as $nomFiltre => $listeValFiltre) { // $listeValFiltre contient toutes les valeurs pour un même filtre
        if ($nomFiltre !== "page" && $nomFiltre !== "tri") { // on ne cherche pas à conserver la page ou le tri
            foreach ($listeValFiltre as $valFiltre) {
                $args.="&".$nomFiltre."%5B%5D=".$valFiltre;
            }
        }
        if($nomFiltre === "tri") {
                $args.="&".$nomFiltre."=".$_GET["tri"];
        }
    }

    // les arguments supplémentaires sont prêts, on passe à la page
    if($reponse->nbPages > 1) {
    ?>
        <nav class="d-flex justify-content-center">
            <ul class="pagination">
                <?php
                for($i = 1; $i <= $reponse->nbPages; $i++) {
                    echo '<li class="page-item">';
                    echo '<a class="page-link" href="?page=' . htmlspecialchars($i) . htmlspecialchars($args).'">' . htmlspecialchars($i) . '</a>';
                    echo '</li>';
                }
                ?>

            </ul>
        </nav>

    <?php
    } // fin du if
    ?>
<script>
    function reinitialiserFiltres() {
        document.location = document.location.origin;
    }

    function trier() {
        var url = new URL(document.location);
        var search_params = url.searchParams;
        var formData = new FormData(document.getElementById("formulaire"));
        search_params.set('tri', formData.get("tri"));
        url.search = search_params.toString();
        var new_url = url.toString();
        document.location = new_url;
    }
</script>

<?php
    fermerBDD($BDD);
?>
</body>
</html>