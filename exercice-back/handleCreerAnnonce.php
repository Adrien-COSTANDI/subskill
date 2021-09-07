<?php
    include "./bdd.php";
    include "./models/Entreprise.php";
    include "./models/Ville.php";
    include "./models/Contrat.php";
    include "./models/Metier.php";
    include "./models/Annonce.php";
    $BDD = generBDD();


    $referenceAnnonce = newAnnonce($BDD);

    echo "Annonce ".$referenceAnnonce." créée !";

?>
<br>

<a href="/">Voir les annonces</a>
<a href="creerAnnonce.php">Créer une autre annonce</a>

