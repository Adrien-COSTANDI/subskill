<?php
    include "./bdd.php";
    include "./models/Entreprise.php";
    include "./models/Ville.php";
    include "./models/Contrat.php";
    include "./models/Metier.php";
    include "./models/Annonce.php";
    $BDD = generBDD();
// https://i.some-random-api.ml/MC8tQwvS3b.jpg


?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>creer une annonce</title>
</head>
<body>
    <form action="handleCreerAnnonce.php" method="POST">
        <label for="intitule">Intitulé : </label>
        <input required id="intitule" type="text" name="intitule">
        <br>
        <label for="image">Image URL : </label>
        <input required id="image" type="text" name="image">
        <img src="" alt="miniature" id="imageMiniature" width="100" height="100">
        <br>
        <label for="description">Description : </label>
        <textarea required name="description" id="description" cols="30" rows="10"></textarea>
        <br>


        <label for="entreprise">Entreprise : </label>
        <select required class="" name="entreprise" id="entreprise">
            <option value="" disabled selected>Entreprise</option>
            <?php
            foreach (json_decode(getAllEntreprises($BDD)) as $entreprise) {
                echo("<option value=\"".htmlspecialchars($entreprise->id)."\">".htmlspecialchars($entreprise->nom)."</option>");
            }
            ?>
        </select>
        <br>
        <label for="ville">Ville : </label>
        <select required class="" name="ville" id="ville">
            <option value="" disabled selected>Ville</option>
            <?php
            foreach (json_decode(getAllVilles($BDD)) as $ville) {
                echo("<option value=\"".htmlspecialchars($ville->id)."\">".htmlspecialchars($ville->nom)."</option>");
            }
            ?>
        </select>
        <br>
        <label for="metier">Métier : </label>
        <select required class="" name="metier" id="metier">
            <option value="" disabled selected>Métier</option>
            <?php
            foreach (json_decode(getAllMetiers($BDD)) as $metier) {
                echo("<option value=\"".htmlspecialchars($metier->id)."\">".htmlspecialchars($metier->nom)."</option>");
            }
            ?>
        </select>
        <br>
        <label for="contrat">Contrat : </label>
        <select required class="" name="contrat" id="contrat">
            <option value="" disabled selected>Contrat</option>
            <?php
            foreach (json_decode(getAllContrats($BDD)) as $contrat) {
                echo("<option value=\"".htmlspecialchars($contrat->id)."\">".htmlspecialchars($contrat->nom)."</option>");
            }
            ?>
        </select>
        <br>
        <br>

        <button type="submit">Créer une annonce</button>
    </form>
    <script>
        var inputImg = document.getElementById("image");
        var imageMiniature = document.getElementById("imageMiniature");
        fetch("https://some-random-api.ml/meme").then(function(response) {
            return response.json();
        })
        .then(function(json) {
            inputImg.value = json.image;
            imageMiniature.src = json.image;
        });
    </script>
<?php
fermerBDD($BDD);
?>
</body>
</html>