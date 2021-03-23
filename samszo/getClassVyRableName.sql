SELECT  
CONCAT('jdc:',TABLE_NAME,' a rdfs:Class ;
rdfs:label "',TABLE_NAME,'";
    rdfs:domain o:Resource ;
    vs:term_status "experimental" .')
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA='theatre' 