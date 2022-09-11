--Задание2 
--а)
SELECT Name, 
CASE WHEN StandardCost= 0 OR StandardCost is NULL THEN 'NOT FOR SALE'
	 WHEN StandardCost > 0 AND Standardcost <100 THEN '<$100'
	 WHEN StandardCost >=100 AND StandardCost < 500 THEN '<500'
	 ELSE '>=500'
	 END PriceRange
FROM Production.Product	

--b)
SELECT vv.Name, v.ProductID, v.BusinessEntityID, v.StandardPrice
FROM Purchasing.ProductVendor AS v
	 LEFT JOIN Purchasing.Vendor AS vv
	 ON v.BusinessEntityID = vv.BusinessEntityID
WHERE StandardPrice > 10 AND (Name LIKE '%X%' OR Name LIKE 'N%')


--c)
SELECT DISTINCT Name
FROM Purchasing.ProductVendor AS v
	 LEFT JOIN Purchasing.Vendor AS vv
	 ON v.BusinessEntityID = vv.BusinessEntityID
	 WHERE [OnOrderQty] IS NULL


--Задание 3
--а)

SELECT a.Name, a.StandardCost 
FROM Production.Product AS a
LEFT JOIN Production.ProductModel AS b
ON a.ProductModelID= b.ProductModelID
WHERE b.Name LIKE 'LL%'


--b)

SELECT Name
FROM Purchasing.Vendor

UNION

SELECT Name
FROM Sales.Store


--c)
SELECT Name 
FROM Production.Product AS aa
LEFT JOIN Sales.SpecialOfferProduct AS ab
ON aa.ProductID = ab.ProductID
LEFT JOIN Sales.SpecialOffer AS ac
ON ab.SpecialOfferID = ac.SpecialOfferID
GROUP BY Name
HAVING COUNT (ab.SpecialOfferID) > 1


