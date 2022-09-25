--Task 1
CREATE TABLE Sales_fct
(
	SaleID INT PRIMARY KEY IDENTITY,
	ProductID INT FOREIGN KEY REFERENCES Product_dim(ProductID),
	CustomerID INT FOREIGN KEY REFERENCES Customer_dim(CustomerID),
	ShopID INT FOREIGN KEY REFERENCES Shop_dim(ShopID),
	PaymentTypeID INT FOREIGN KEY REFERENCES PaymentType_dim(PaymentTypeID),
	SellerID INT FOREIGN KEY REFERENCES Seller_dim(SellerID),
	Amount smallint NOT NULL,
	Price money NOT NULL,
	Date DATE DEFAULT GETDATE()
	)



CREATE TABLE Product_dim
(
	ProductID INT PRIMARY KEY,
	Title VARCHAR(20) NOT NULL,
	Data_Realization DATE,
	OS VARCHAR(50),
	Size_display DECIMAL(4,2),
	pWeight TINYINT,
	Memory TINYINT NOT NULL,
	Count_SIM TINYINT DEFAULT 1,
	Material NVARCHAR(30),
	Color NVARCHAR(30)
	)

CREATE TABLE Shop_dim
(
	ShopID INT PRIMARY KEY,
	Name NVARCHAR(20) NOT NULL,
	City NVARCHAR(30),
	Square_m2 DECIMAL(5,2)
	)

CREATE TABLE Customer_dim
(
	CustomerID INT PRIMARY KEY,
	First_name NVARCHAR(20),
	Last_name NVARCHAR(20),
	Pasport NVARCHAR(20) UNIQUE,
	Sex CHAR(1),
	Date_birth DATE,
	City NVARCHAR(30),
	Address NVARCHAR(100)
	)


CREATE TABLE PaymentType_dim
(
	PaymentTypeID INT PRIMARY KEY,
	PaymentType NVARCHAR(30) NOT NULL
	)


CREATE TABLE Seller_dim
(
	SellerID INT PRIMARY KEY,
	First_Name NVARCHAR(20),
	Last_Name NVARCHAR(20),
	Employee_Number NVARCHAR(10) NOT NULL,
	Position NVARCHAR(30),
	Date_of_employment date CHECK(Date_of_employment<=GETDATE())
	)


SELECT t.First_name, b.Last_name
FROM [dbo].[MOCK_DATA] as t
	CROSS JOIN [dbo].[MOCK_DATA] as b
