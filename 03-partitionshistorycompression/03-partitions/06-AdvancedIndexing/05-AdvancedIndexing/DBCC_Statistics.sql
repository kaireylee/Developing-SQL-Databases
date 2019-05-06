
USE Northwind;
GO

SELECT Customers.CompanyName, Customers.ContactName
FROM   Customers 

UPDATE STATISTICS Customers CompanyName WITH FULLSCAN;
GO

EXEC sp_updatestats;
Go

DBCC SHOW_STATISTICS('Customers','CompanyName') --Shows all Header, Density, Histogram

--DBCC SHOW_STATISTICS('Customers','CustomerID') WITH STAT_HEADER;
--GO
--DBCC SHOW_STATISTICS('Customers','CompanyName') WITH DENSITY_VECTOR;
--GO
--DBCC SHOW_STATISTICS('Customers','CompanyName') WITH HISTOGRAM;
--GO



