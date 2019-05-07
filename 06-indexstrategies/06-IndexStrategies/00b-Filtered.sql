USE Northwind
GO

--Make columns that are used in the where or group by clauses into key columns to keep indexes small / efficient
CREATE NONCLUSTERED INDEX NCIX_CustomerRegion
	ON Customers(Region)
	WHERE Region = 'CA' --Filter on the index 
GO

SELECT * FROM Customers WHERE Region = 'CA';