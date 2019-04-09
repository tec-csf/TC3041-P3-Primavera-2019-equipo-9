# TC3041-P3-Primavera-2019

Axel Zuchovicki Zaritsky A01022875
Christian Alexis Aguilar Piña A01024157

En esta práctica se importó la base de datos obtenida de [aquí](https://snap.stanford.edu/data/cit-HepPh.html).

Se analizó el tipo de datos y se diseñaron queries para obtener información interesante. Estos queries se encuentran en el archivo `queries.pdf`.

Finalmente se desarrolló una aplicación simple en Flask que integra Neo4j en un contenedor, visualizando los datos de los queries.

Para crear los contenedores con los datos y armar la aplicación, se ejecutaron los siguientes comandos:

1. `sudo docker run --publish=7474:7474 --name=neo4j --publish=7687:7687 --volume=$HOME/neo4j/data:/data --env=NEO4J_AUTH=none --network=neo4j-net neo4j`

2. `sudo docker cp ../Data/Cit-HepPh.csv neo4j:/var/lib/neo4j/import/`

3. `sudo docker cp ../Data/cit-HepPh-dates.csv neo4j:/var/lib/neo4j/import/`

1. Conectarse al `localhost:7474` y correr los comandos del archivo `modelo.cypher` 

19. `cd flask-neo4j`

2. `sudo docker build -t flask-neo4j .`

10000. `sudo docker run --name app -p 5000:5000 -d --net neo4j-net flask-neo4j`

1234. Acceder a `localhost:5000/<most_cited|most_citations_made|specific_citations|citations_gotten_year|citations_made_year>`
