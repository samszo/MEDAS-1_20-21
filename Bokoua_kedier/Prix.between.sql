select Numero_Article, prix 
from tarif as t
inner join articles as a on t.id_Tarif=a.id_Articles
where prix between 100 and 200