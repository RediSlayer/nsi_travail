<?php

$user="root";
$pass="";
$dbh = new PDO('mysql:host=localhost;dbname=aaaaaaa', $user, $pass);

// use the connection here
$sth = $dbh->query('SELECT * FROM cs');

// fetch all rows into array, by default PDO::FETCH_BOTH is used
$enregistrements = $sth->fetchAll();

$informations="";
$n=1;
// iterate over array by index and by name
foreach($enregistrements as $enregistrement) {
    $id=$enregistrement["id"];
    $Code_Postal=$enregistrement["Code Postal"];
    $Centres_Sportif=$enregistrement["Centres sportifs"];
    $Adresse=$enregistrement["Adresse"];
    $Paroisse=$enregistrement["Paroisse"];

    $position=$enregistrement["Position"];
    $c=explode(",",$position);
    $latitude=$c[0];
    $longitude=substr($c[1],1);

    $m="

var marker((n)) = L.marker([Latitude, Longitude], {icon: myIcon});
var popupmarker((n)) = \" <h1>Nom</h1>\";
marker((n)).addTo(map);
marker((n)).bindPopup(popupmarker((n)));


";
    $m=str_replace("((n))",$n,$m);
    $m=str_replace("Latitude",$latitude,$m);
    $m=str_replace("Longitude",$longitude,$m);
    $m=str_replace("Nom",$Centres_Sportif,$m);
    $n=$n+1;
    $informations=$informations.$m;

}
$fichier = file_get_contents("osm_france.html");
$page_web=str_replace("///informations",$informations,$fichier);
print($page_web);

?>