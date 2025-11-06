-- Analice los planes de las siguientes consultas

SELECT jc.Resume FROM HumanResources.JobCandidate jc
INNER JOIN HumanResources.Employee e on jc.BusinessEntityID = e.BusinessEntityID
ORDER BY e.BusinessEntityID,jc.JobCandidateID

-- La primera consulta joinea por BusinessEntityID y ordena como (BusinessEntityID,JobCandidateID)

-- La tabla JobCandidate esta ordenada por BusinessEntityID con un índice pero ese índice no da información de Resume (para el select), así que
-- debe hacer un Sort  de un clustered index scan para ordenar como (BusinessEntityID, JobCandidateID)
-- Empoyee si esta ordenada  por BusinessEntityID en su Clustered index .

-- Si bien ambas están ordenadas por BusinessEntityID y podrían hacer merge, como las tablas son chiquitas y además
-- indexadas puede ser más rápido hacer un nested loop


SELECT JobCandidateID FROM HumanResources.JobCandidate jc
INNER JOIN HumanResources.Employee e on jc.BusinessEntityID =e.BusinessEntityID
ORDER BY e.BusinessEntityID,jc.JobCandidateID

-- Aca JobCandidate puede usar directamente el indice que tiene BussinessEntityID porque además tiene la info de JobCandidateID,
-- ese índice está ordenado por (BusinessEntityID,JobCandidateID)

-- Employee ya tiene el índice BussinessEntityID

-- Acá vuelve a hacer Nested Join por lo mismo, las tablas son chicas.
