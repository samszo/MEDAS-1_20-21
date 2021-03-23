SELECT  
/*
CONCAT('jdc:',TABLE_NAME,' a rdfs:Class ;
rdfs:label "',TABLE_NAME,'";
    rdfs:domain o:Resource ;
    vs:term_status "experimental" .') class
,GROUP_CONCAT(CONCAT('
jdc:',COLUMN_NAME,' a rdfs:Property ;
rdfs:label "',COLUMN_NAME,'";
    rdfs:domain o:Resource ;
    vs:term_status "experimental" .') SEPARATOR ' ' ) prop   
*/
CONCAT('
jdc:',COLUMN_NAME,' a rdfs:Property ;
rdfs:label "',COLUMN_NAME,'";
    rdfs:domain o:Resource ;
    vs:term_status "experimental" .')  prop   

    
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA='theatre' 
-- GROUP BY TABLE_NAME
