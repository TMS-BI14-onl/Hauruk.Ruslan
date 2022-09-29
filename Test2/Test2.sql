--Task 1
SELECT CONCAT(a.LastName,' ',a.FirstName) as Person, b.PhoneNumber 
FROM Person.Person as a 
 LEFT JOIN Person.PersonPhone as b
ON a.BusinessEntityID=b.BusinessEntityID
WHERE b.PhoneNumber LIKE '4_5%'

--Task 2
SELECT CONCAT(FirstName, ' ',LastName) as PersonName, a.birthdate,
CASE
	WHEN YEAR(GETDATE())-YEAR(a.birthdate) >= 17 AND YEAR(GETDATE())-YEAR(a.birthdate) <=20   THEN 'Adolescence'
	WHEN YEAR(GETDATE())-YEAR(a.birthdate) >=60 AND YEAR(GETDATE())-YEAR(a.birthdate)<=75 THEN 'Elderly'
	WHEN YEAR(GETDATE())-YEAR(a.birthdate) >=76 AND YEAR(GETDATE())-YEAR(a.birthdate)<=90 THEN 'Senile'

		END AS LevelStarosti
FROM HumanResources.Employee as a 
LEFT JOIN Person.Person as b
ON a.BusinessEntityID=b.BusinessEntityID


--Task 3

