SELECT 
    id_patient, pa_nom as "personnes ayant un rdv aujourd'hui"
FROM
    test_db.patient
        INNER JOIN
    rendez_vous ON patient_id_patient = id_patient
WHERE
    rv_date = CURRENT_DATE()
