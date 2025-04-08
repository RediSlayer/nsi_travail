from xlrd import open_workbook
import random

dict_list = []
book = open_workbook('tedi.xls')
sheet = book.sheet_by_index(0)

# lire les colonnes de la première ligne : nom des champs
keys = sheet.row_values(0)

# lire les autres lignes et les mettre dans un tableau
values = [sheet.row_values(i) for i in range(1, sheet.nrows)]

# transformation la liste en dictionnaire
for value in values:
    dict_list.append(dict(zip(keys, value)))



informations=""
n=1
# parcours de tous les enregistrements
for enregistrement in dict_list:
    ID=enregistrement["id"]
    Code_Postal=enregistrement["Code Postal"]
    Centres_Sportif=enregistrement["Centres Sportifs"]
    Adresse=enregistrement["Adresse"]
    Paroisse=enregistrement["Paroisse"]

    position=enregistrement["position"]
    c=position.split(",")
    latitude=c[0]
    longitude=c[1][1:]
    print(n,latitude,longitude)
    m="""

var marker((n)) = L.marker([Latitude, Longitude], {icon: myIcon});
var popupmarker((n)) = "<h1>Nom</h1>";
marker((n)).addTo(map);
marker((n)).bindPopup(popupmarker((n)));


"""
    m=m.replace("((n))",str(n))
    m=m.replace("Latitude",str(latitude))
    m=m.replace("Longitude",str(longitude))
    m=m.replace("Nom",nom)
    n=n+1
    if (academie == "Montpellier" or academie== "Toulouse") and type_etab== "Lycée":
        informations=informations+m
print(informations)

fichier = open("osm_france.html", "r")
contenu_maquette=fichier.read().replace("///informations",informations)
fichier_index=open("tedi.html","w")
fichier_index.write(contenu_maquette)
fichier_index.close()
fichier.close()