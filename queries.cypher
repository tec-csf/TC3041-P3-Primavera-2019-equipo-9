MATCH (p:Paper)<-[r]-()
RETURN p.nodeID,COUNT(r) as cited_by
ORDER BY cited_by DESC
LIMIT 1

MATCH (p:Paper)-[r]->()
RETURN p.nodeID,COUNT(r) as cited
ORDER BY cited DESC
LIMIT 1

MATCH (p:Paper{nodeID: 201071})<-[r]-()
RETURN p.nodeID,COUNT(r) as cited

MATCH (p:Paper)<-[r]-()
RETURN p.dateWritten.year, COUNT(r)

MATCH (p:Paper)-[r]->()
RETURN p.dateWritten.year, COUNT(r)
