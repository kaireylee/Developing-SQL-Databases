Use Northwind
Go

--Create View
-- When you place views in schema it allows for rights 
CREATE VIEW v_CustomersUSA
AS
	SELECT
		c.CompanyName,
		c.ContactName,
		c.Country,
		CONVERT(VARCHAR, o.OrderDate, 101) AS OrderDate,
		od.UnitPrice,
		od.Quantity,
		(od.UnitPrice * od.Quantity) AS TotalSale
	FROM Customers AS c INNER JOIN 
		Orders AS o ON c.CustomerID = o.CustomerID INNER JOIN
		[Order Details] AS od ON o.OrderID = od.OrderID INNER JOIN
		Products AS p ON od.ProductID = p.ProductID
	WHERE c.Country = 'USA'

GO

CREATE VIEW v_CustomersSouthAmerica
AS
	SELECT
		c.CompanyName,
		c.ContactName,
		c.Country,
		CONVERT(VARCHAR, o.OrderDate, 101) AS OrderDate,
		od.UnitPrice,
		od.Quantity,
		(od.UnitPrice * od.Quantity) AS TotalSale
	FROM Customers AS c INNER JOIN 
		Orders AS o ON c.CustomerID = o.CustomerID INNER JOIN
		[Order Details] AS od ON o.OrderID = od.OrderID INNER JOIN
		Products AS p ON od.ProductID = p.ProductID
	WHERE c.Country LIKE('Br%') OR c.Country LIKE('Ven%')

GO

SELECT * FROM v_CustomersUSA;
SELECT * FROM v_CustomersSouthAmerica;

GO

--Modify View
ALTER VIEW v_CustomersUSA
AS
	SELECT
		c.CompanyName,
		c.ContactName,
		c.Country,
		CONVERT(VARCHAR, o.OrderDate, 101) AS OrderDate,
		od.UnitPrice,
		od.Quantity,
		(od.UnitPrice * od.Quantity) AS TotalSale,
		p.ProductName
	FROM Customers AS c INNER JOIN 
		Orders AS o ON c.CustomerID = o.CustomerID INNER JOIN
		[Order Details] AS od ON o.OrderID = od.OrderID INNER JOIN
		Products AS p ON od.ProductID = p.ProductID
	WHERE c.Country = 'USA'

GO

ALTER VIEW v_CustomersSouthAmerica
AS
	SELECT
		c.CompanyName,
		c.ContactName,
		c.Country,
		CONVERT(VARCHAR, o.OrderDate, 101) AS OrderDate,
		od.UnitPrice,
		od.Quantity,
		(od.UnitPrice * od.Quantity) AS TotalSale,
		p.ProductName
	FROM Customers AS c INNER JOIN 
		Orders AS o ON c.CustomerID = o.CustomerID INNER JOIN
		[Order Details] AS od ON o.OrderID = od.OrderID INNER JOIN
		Products AS p ON od.ProductID = p.ProductID
	WHERE c.Country LIKE('Br%') OR c.Country LIKE('Ven%')

GO
--Use Views
SELECT * FROM v_CustomersUSA;
SELECT * FROM v_CustomersSouthAmerica;

GO

DROP VIEW v_CustomersUSA;
DROP VIEW v_CustomersSouthAmerica;