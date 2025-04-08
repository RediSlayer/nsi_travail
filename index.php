<?php

$user="root";
$pass="";
$dbh = new PDO('mysql:host=localhost;dbname=aaaaaaa', $user, $pass);

// use the connection here
$sth = $dbh->query('SELECT * FROM cm__1_ UNION SELECT * FROM cs UNION SELECT * FROM parc__2_;');

// fetch all rows into array, by default PDO::FETCH_BOTH is used
$enregistrements = $sth->fetchAll();

$informations="";
$n=1;
// iterate over array by index and by name
foreach($enregistrements as $enregistrement) {
    $id=$enregistrement["id"];
    $Code_Postal=$enregistrement["Code_Postal"];
    $Nom=$enregistrement["Nom"];
    $Adresse=$enregistrement["Adresse"];
    $Paroisse=$enregistrement["Paroisse"];
    $Position=$enregistrement["Position"];
    $imagen_id=$enregistrement["imagen_id"];

    $c=explode(",",$Position);
    $latitude=$c[0];
    $longitude=substr($c[1],1);

    // Determine the image URL based on imagen_id
    $image_url = "";
    if ($imagen_id == 1) {
        $image_url = "imagenes/parc1.jpg";
    } elseif ($imagen_id == 2) {
        $image_url = "imagenes/parc2.jpg";
    }

    $m="

var marker((n)) = L.marker([Latitude, Longitude], {icon: myIcon});
var popupmarker((n)) = \"<h1>Nom</h1><img src='ImageURL' alt='Image' style='width:100px;height:100px;'>\";
marker((n)).addTo(map);
marker((n)).bindPopup(popupmarker((n)));


";
    $m=str_replace("((n))",$n,$m);
    $m=str_replace("Latitude",$latitude,$m);
    $m=str_replace("Longitude",$longitude,$m);
    $m=str_replace("Nom",$Nom,$m);
    $m=str_replace("ImageURL",$image_url,$m);
    $n=$n+1;
    $informations=$informations.$m;

}
$fichier = file_get_contents("osm_france.html");
$page_web=str_replace("///informations",$informations,$fichier);
print($page_web);

?>