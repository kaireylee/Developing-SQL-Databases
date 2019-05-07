USE Northwind;
GO

CREATE VIEW v_CustomerOrdersUSA 
WITH ENCRYPTION
AS  
	SELECT c.CustomerID, 
		   c.CompanyName,
		   c.Country, 
		   CONVERT(VARCHAR(10),o.OrderDate,101) AS OrderDate, 
		   od.UnitPrice, 
		   od.Quantity,
		   od.UnitPrice + od.Quantity AS TotalSale,
		   p.ProductName
	FROM Customers AS c 
		INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
		INNER JOIN [Order Details] AS od ON o.OrderID = od.OrderID
		INNER JOIN Products As p ON od.ProductID = p.ProductID
	WHERE c.Country = 'USA';
GO

SELECT * FROM v_CustomerOrdersUSA;

--Drop View vwCustomerOrdersUSA;
DROP VIEW v_CustomerOrdersUSA;