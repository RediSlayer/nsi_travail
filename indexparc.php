<?php

$user = "root";
$pass = "";
$dbh = new PDO('mysql:host=localhost;dbname=aaaaaaa', $user, $pass);

// use the connection here
$sth = $dbh->query('SELECT * FROM parc__2_;');

// fetch all rows into array, by default PDO::FETCH_BOTH is used
$enregistrements = $sth->fetchAll();

$informations = "";
$n = 1;
// iterate over array by index and by name
foreach ($enregistrements as $enregistrement) {
    $id = $enregistrement["id"];
    $Code_Postal = $enregistrement["Code_Postal"];
    $Nom = $enregistrement["Nom"];
    $Adresse = $enregistrement["Adresse"];
    $Paroisse = $enregistrement["Paroisse"];
    $Position = $enregistrement["Position"];

    $c = explode(",", $Position);
    $latitude = $c[0];
    $longitude = substr($c[1], 1);

    // Cherche l'image correspondante
    $imagePath = "imagenes/parc" . $n . ".png";

    // Creation du marqueur
    $m = "
var marker$n = L.marker([$latitude, $longitude], {icon: myIcon});
var popupmarker$n = \"<h1>$Nom</h1><img src='$imagePath' alt='Image' style='width:100px;height:100px;'>\";
marker$n.addTo(map);
marker$n.bindPopup(popupmarker$n);
";

    $informations .= $m;
    $n++;
}

$fichier = file_get_contents("osm_parc.html");
$page_web = str_replace("///informations", $informations, $fichier);
print($page_web);

?>