CREATE PROC sp_Number_change_proc
@BusinessEntityID INT,
@NationalIDNumber INT
AS
UPDATE HumanResources.Employee
SET NationalIDNumber= @NationalIDNumber
WHERE BusinessEntityID= @BusinessEntityID

DROP PROC sp_Number_change_proc	

EXEC sp_Number_change_proc '15', '879341111'

SELECT NationalIDNumber
FROM HumanResources.Employee
WHERE BusinessEntityID=15
