<?php

$user = "root";
$pass = "";
$dbh = new PDO('mysql:host=localhost;dbname=aaaaaaa', $user, $pass);

$sth = $dbh->query('SELECT * FROM cs;');

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
    $imagePath = "imagenes/cs" . $n . ".jpg";

    $m = "
    var marker$n = L.marker([$latitude, $longitude], {icon: myIcon});
    var popupmarker$n = \"<h1>$Nom</h1><img id='pop$n' src='$imagePath' alt='Image' style='width:200px;height:200px;cursor:pointer;' onclick='openModal(\\\"$imagePath\\\")'>\";
    marker$n.addTo(map);
    marker$n.bindPopup(popupmarker$n);
";

    $informations .= $m;
    $n++;
}
echo '<link rel="stylesheet" type="text/css" href="css/popup-style.css">' . "\n";
$fichier = file_get_contents("osm_cs.html");
$page_web = str_replace("///informations", $informations, $fichier);
print($page_web);

?>