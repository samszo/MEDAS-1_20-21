-- Combien de tests sont disponibles aujourd'hui ?
SELECT Date, Stock_total
FROM planning
WHERE Date = CURRENT_DATE()