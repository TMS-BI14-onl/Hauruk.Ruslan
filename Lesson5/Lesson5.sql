--Задание 6
CREATE TABLE Patients
(
Id INT Primary key identity(1,1),
FirstName NVARCHAR(30), 
LastName NVARCHAR(30) ,
SSN INT UNIQUE,
EMAIL AS CONCAT(UPPER(LEFT(FirstName,1)), LOWER(LEFT(LastName,3)),'@gmail.coml'),
TEMP DEC(3,1),
CreatedDate DATE 
)


-- Задание 7

INSERT dbo.patients
VALUES ('Peter', 'Ivanov', 1, 36.6, CAST('2021-12-31' As DATE)),
('Richard', 'Pailo', 2, 39.2, CAST('2020-01-23' As DATE)),
('Nikitos', 'Staralsja', 3, 36.2, CAST('2022-02-23' as DATE)),
('Jora', 'Cust', 4, 37.3, CAST('2012-12-21' as DATE)),
('Nicolas', 'Cletka', 5, 38.8, CAST('2011-11-11' as DATE)),
('Viktor', 'Vihodkin', 6, 37.0, CAST('2022-12-22' as DATE)),
('Afrodita', 'Starshebogova', 7, 36.7, CAST('2022-03-02' as DATE))


SELECT *	
FROM dbo.Patients

--Задание 8
ALTER TABLE dbo.Patients
ADD TempType AS
CASE WHEN TEMP > 37 THEN '>37°C'
		WHEN TEMP < 37 THEN '<37°C'
		WHEN TEMP =37 THEN '=37°C'
		END

ALTER TABLE dbo.patients
DROP COLUMN TempType

--Задание 9
CREATE VIEW dbo.vPatients  
AS   
SELECT TEMP*(9/5)+32 as FarengheitTemp
From Dbo.Patients

Select *
From vPatients

--Задание 10
CREATE FUNCTION udfFarTemp(@TEMP DEC(3,1))
RETURNS DEC(3,1)
AS 
BEGIN
    RETURN @TEMP*(9/5)+32
END

SELECT dbo.udfFarTemp(36.6) FarTemp


--Задание 11
DECLARE @DAY1 DATE
DECLARE @Number_of_day INT
 SET @Number_of_day = DATEPART(DW, DATEADD(DAY,1,EOMONTH(GETDATE(),-1)))
 SET @DAY1 =  DATEADD(DAY,1,EOMONTH(GETDATE(),-1))
  SELECT @DAY1 as fist_day_of_mounth, @Number_of_day as Day_Number,
		CASE 
		WHEN @Number_of_day >=5 THEN @DAY1
		ELSE DATEADD(DAY,(7-@Number_of_day+1),@DAY1) 
		END as FirstWorkingDay



