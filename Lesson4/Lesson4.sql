--Task 4-a
SELECT UnitMeasureCode
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'


SELECT DISTINCT COUNT (UnitMeasureCode) as cnt
FROM Production.UnitMeasure


INSERT INTO Production.UnitMeasure
VALUES	('TT1','Test 1','2020-09-09 00:00:00.000'),
		('TT2','Test 2',GETDATE())

SELECT UnitMeasureCode
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'


--Task 4-b

SELECT [UnitMeasureCode],[Name],[ModifiedDate]
INTO Production.UnitMeasureTest
FROM [Production].[UnitMeasure]
WHERE UnitMeasureCode LIKE 'T%'
   OR UnitMeasureCode LIKE 'CAN'

SELECT *
FROM Production.UnitMeasureTest
ORDER BY UnitMeasureCode

--Task 4-c

UPDATE Production.UnitMeasureTest
SET UnitMeasureCode = 'TTT'

--Task 4-d

DELETE Production.UnitMeasureTest

--Task 4-e

SELECT *,AVG(OrderQty) OVER (PARTITION BY LineTotal) AS "Avg"  
    ,MIN(OrderQty) OVER (PARTITION BY LineTotal) AS "Min"  
    ,MAX(OrderQty) OVER (PARTITION BY LineTotal) AS "Max"  
FROM Sales.SalesOrderDetail   
WHERE SalesOrderID IN (43659,43664)



--Task 4-f

SELECT *
FROM sales.vSalesPerson

SELECT SalesLastYear, JobTitle, SalesYTD,
		CONCAT (FirstName,' ', MiddleName,' ', LastName) as Seller, 
		RANK() OVER (ORDER BY SalesYTD DESC) AS BestSellerRank, 
		CONCAT(UPPER(LEFT(LastName,3)),'login',ISNULL(TerritoryGroup, '  ')) as Login
	FROM sales.vSalesPerson

SELECT TOP 1 CONCAT (FirstName,' ', MiddleName,' ', LastName) as Seller, 
		DENSE_RANK() OVER (ORDER BY SalesYTD DESC) AS "TopSellerThisYear", 
		CONCAT(UPPER(LEFT(LastName,3)),'login',ISNULL(TerritoryGroup, '  ')) as Login
FROM sales.vSalesPerson

SELECT TOP 1 CONCAT (FirstName,' ', MiddleName,' ', LastName) as Seller, 
		DENSE_RANK() OVER (ORDER BY SalesLastYear DESC) AS "TopSellerLastYear", 
		CONCAT(UPPER(LEFT(LastName,3)),'login',ISNULL(TerritoryGroup, '  ')) as Login
FROM sales.vSalesPerson



--Task 4-g

SELECT DATEADD(DAY,1, EOMONTH(GETDATE(),-1)) as DayOneOfMonth,
	   DATENAME(WEEKDAY, DATEADD(DAY,1, EOMONTH(GETDATE(),-1))) as Day_of_the_week,
 CASE 
	WHEN  DATENAME(WEEKDAY, DATEADD(DAY,1, EOMONTH(GETDATE(),-1))) = 'Saturday' 
	THEN CONCAT(DATEPART(DAY,DATEADD(DAY,3, EOMONTH(GETDATE(),-1))),' ',DATENAME(WEEKDAY, DATEADD(DAY,3, EOMONTH(GETDATE(),-1))),' ',DATEPART(YEAR,EOMONTH(GETDATE(),-1)))
	WHEN  DATENAME(WEEKDAY, DATEADD(DAY,1, EOMONTH(GETDATE()))) = 'Sanday' 
	THEN CONCAT(DATEPART(DAY,DATEADD(DAY,2, EOMONTH(GETDATE(),-1))),' ',DATENAME(WEEKDAY, DATEADD(DAY,2, EOMONTH(GETDATE(),-1))),' ',DATEPART(YEAR,EOMONTH(GETDATE(),-1)))
		ELSE CONCAT(DATEPART(DAY,DATEADD(DAY,1, EOMONTH(GETDATE(),-1))),' ',DATENAME(WEEKDAY, DATEADD(DAY,1, EOMONTH(GETDATE(),-1))),' ',DATEPART(YEAR,EOMONTH(GETDATE(),-1)))
	END AS First_bloody_day