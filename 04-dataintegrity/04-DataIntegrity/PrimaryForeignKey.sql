USE LabData;
GO

CREATE TABLE Customer 
(
	CustomerID INT IDENTITY PRIMARY KEY,
	CompanyName VARCHAR(30)
);

GO



CREATE TABLE [Order]
(
	OrderID INT IDENTITY PRIMARY KEY,
	OrderDate DATETIME NOT NULL,
	OrderNumber INT NOT NULL UNIQUE,
	CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID)
);

GO

DROP TABLE [Order];
DROP TABLE Customer; --must drop foreign key first before primary
