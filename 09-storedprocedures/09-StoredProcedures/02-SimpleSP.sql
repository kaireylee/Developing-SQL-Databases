USE Northwind;
GO

ALTER PROCEDURE Labs.spGetCustomers
AS
	SELECT 
		c.CustomerID,		
		c.ContactName,
		c.CompanyName,
		c.City,
		c.Region,
		c.Country
	FROM Customers AS c
	WHERE c.Region IS NOT NULL
	ORDER BY c.Country Desc, c.Region, c.City, c.CompanyName

GO

EXEC Labs.spGetCustomers

DROP PROC Labs.spGetCustomers;