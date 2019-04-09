from flask import request, url_for, jsonify
from flask_api import FlaskAPI, status, exceptions
from py2neo import Graph, Node, Relationship
# from bson.json_util import dumps
import os
import uuid
#username = os.environ.get('NEO4J_USERNAME')
#password = os.environ.get('NEO4J_PASSWORD')

#graph = Graph(url + '/db/data/', username=username, password=password)
graph = Graph("http://neo4j:7474/db/data/")

app = FlaskAPI(__name__)

@app.route("/most_cited", methods=['GET'])
def most_cited():
    match = graph.cypher.execute("MATCH (p:Paper)<-[r]-() RETURN p.nodeID,COUNT(r) as cited_by ORDER BY cited_by DESC LIMIT 1")
    return str(match)


@app.route("/most_citations_made", methods=['GET'])
def most_citations_made():
    match = graph.cypher.execute("MATCH (p:Paper)-[r]->() RETURN p.nodeID,COUNT(r) as cited ORDER BY cited DESC LIMIT 1")
    return str(match)


@app.route("/specific_citations", methods=['GET'])
def specific_citations():
    match = graph.cypher.execute("MATCH (p:Paper{nodeID: 201071})<-[r]-() RETURN p.nodeID,COUNT(r) as cited")
    return str(match)


@app.route("/citations_gotten_year", methods=['GET'])
def citations_gotten_year():
    match = graph.cypher.execute("MATCH (p:Paper)<-[r]-() RETURN p.dateWritten.year, COUNT(r)")
    return str(match)


@app.route("/citations_made_year", methods=['GET'])
def citations_made_year():
    match = graph.cypher.execute("MATCH (p:Paper)-[r]->() RETURN p.dateWritten.year, COUNT(r)")
    return str(match)


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
