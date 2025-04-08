<?php

$user = "root";
$pass = "";
$dbh = new PDO('mysql:host=localhost;dbname=aaaaaaa', $user, $pass);

$sth = $dbh->query('SELECT * FROM cm__1_;');

$enregistrements = $sth->fetchAll();

$informations = "";
$n = 1;
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

    $imagePath = "imagenes/cm" . $n . ".jpg";

    $m = "
var marker$n = L.marker([$latitude, $longitude], {icon: myIcon});
var popupmarker$n = \"<h1>$Nom</h1><img src='$imagePath' alt='Image' style='width:100px;height:100px;'>\";
marker$n.addTo(map);
marker$n.bindPopup(popupmarker$n);
";

    $informations .= $m;
    $n++;
}

$fichier = file_get_contents("osm_cm.html");
$page_web = str_replace("///informations", $informations, $fichier);
print($page_web);

?>