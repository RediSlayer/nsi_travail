# CrÃ©Ã© par Ludovic, le 19/11/2023 en Python 3.7
import mysql.connector

# Connect to the database
cnx = mysql.connector.connect(user='root', password='', host='localhost', database='localisation')

# Create a cursor
cursor = cnx.cursor()

# Execute a SQL statement
cursor.execute("SELECT * FROM aaaaaaa")

# Fetch the results
enregistrements = cursor.fetchall()

informations=""
n=1
# Loop through the results and print them
for enregistrement in enregistrements:
    UAI=enregistrement[0]
    nom=enregistrement[3]
    type_etab=enregistrement[4]
    academie=enregistrement[5]
    departement=enregistrement[6]
    ville=enregistrement[7]

    position=enregistrement[8]
    c=position.split(",")
    latitude=c[0]
    longitude=c[1][1:]
    print(UAI,latitude,longitude)
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
    informations=informations+m

print(informations)

fichier = open("osm_france.html", "r")
contenu_maquette=fichier.read().replace("///informations",informations)
fichier_index=open("tedi2.html","w")
fichier_index.write(contenu_maquette)
fichier_index.close()
fichier.close()

# Close the cursor and connection
cursor.close()
cnx.close()
