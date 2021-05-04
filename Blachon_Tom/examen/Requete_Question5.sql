-- Quels types de tests sont disponibles aujourdhui ?
SELECT Type, Cout_unit AS Cout_unitaire
FROM Tests
INNER JOIN tests_has_planning
ON idTests = Tests_idTests
INNER JOIN Planning
ON Planning_idPlanning = idPlanning
WHERE Date = CURRENT_DATE()