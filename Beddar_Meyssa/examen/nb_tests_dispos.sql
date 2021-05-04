-- requête répondant à la question : combien de test sont disponibles aujourd'hui ?

select sum(distinctrow c.Quantite) as `Nb total de tests commandés`,
	count(rdv.id_RDV_TEST) as `Nb de tests effectués`,
    sum(distinctrow c.Quantite)-count(rdv.id_RDV_TEST) as `Nb de tests disponibles`
from commande as c
	left JOIN test as t
		on t.id_TEST=c.TEST_id_TEST
	left JOIN rdv_test as rdv
		on rdv.test_id_test=t.id_test
