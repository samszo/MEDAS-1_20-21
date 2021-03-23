SELECT 
CONCAT('jdc:',COLUMN_NAME,' a rdfs:Property ;
rdfs:label "',COLUMN_NAME,'";
    rdfs:domain o:Resource ;
    vs:term_status "experimental" .')        
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = N'siege'