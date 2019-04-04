USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/cit-HepPh-dates.csv" AS row
CREATE (:Paper {nodeID: toInteger(row.nodeId), dateWritten: date(row.Date)});

CREATE INDEX ON :Paper(nodeID);

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/Cit-HepPh.csv" AS row
MATCH (start:Paper {nodeID: toInteger(row.start)})
MATCH (end:Paper {nodeID: toInteger(row.end)})
MERGE (start)-[:CITES]->(end);
