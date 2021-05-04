--- liste des personnes testées positives


SELECT 
    pa_tel, pa_mail, pa_nom AS 'test positif - à contacter'
FROM
    test_db.patient
        INNER JOIN
    rendez_vous ON patient_id_patient = id_patient
        INNER JOIN
    test ON rendez_vous_id_rendez_vous = id_rendez_vous
WHERE
    te_resultat = 'pos'