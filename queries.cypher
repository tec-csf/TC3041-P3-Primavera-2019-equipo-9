# Most cited paper

MATCH (p:Paper)<-[r]-()
RETURN p.nodeID,COUNT(r) as cited_by
ORDER BY cited_by DESC
LIMIT 1

# Paper with most citations

MATCH (p:Paper)-[r]->()
RETURN p.nodeID,COUNT(r) as cited
ORDER BY cited DESC
LIMIT 1

# Number of citations for a specific paper.

MATCH (p:Paper{nodeID: 201071})<-[r]-()
RETURN p.nodeID,COUNT(r) as cited

# Number of citations gotten by year.

MATCH (p:Paper)<-[r]-()
RETURN p.dateWritten.year, COUNT(r)

# Number of citations made by year.

MATCH (p:Paper)-[r]->()
RETURN p.dateWritten.year, COUNT(r)
