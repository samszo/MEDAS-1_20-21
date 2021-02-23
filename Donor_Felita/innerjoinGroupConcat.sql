SELECT a.country, GROUP_CONCAT(a.name) AS concat_name
FROM artist AS a 
GROUP BY a.country;