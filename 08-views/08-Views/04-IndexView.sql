USE Northwind;
GO

CREATE VIEW v_CustomerSales
WITH SCHEMABINDING
AS
	SELECT
		c.CustomerID,
		o.OrderID,
		c.CompanyName,
		c.ContactName,
		c.Country,
		CONVERT(VARCHAR, o.OrderDate, 101) AS OrderDate
	FROM dbo.Customers AS c INNER JOIN 
		dbo.Orders AS o ON c.CustomerID = o.CustomerID 
	--!!ORDER BY c.CompanyName Order By cannot be used in views

GO

CREATE UNIQUE CLUSTERED INDEX IX_CustomerOrder
	ON v_CustomerSales(CustomerID, OrderID);

GO

SELECT * FROM v_CustomerSales;

GO

DROP VIEW v_CustomerSales;