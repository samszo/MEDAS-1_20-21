Select (Stock - count(D.Tests_ID_T)) as Stock, Type_T, Adr_C
FROM Contenir
left join Centre ON ID_C = centre_ID_C
left Join Tests ON Contenir.tests_ID_T = ID_T
left Join Depister D ON D.Tests_ID_T = ID_T
Group by Adr_C, Type_T