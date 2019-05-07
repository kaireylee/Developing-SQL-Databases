USE Northwind
GO

SELECT * FROM Products;

--Make columns that are used in the where or group by clauses into key columns to keep indexes small / efficient
CREATE NONCLUSTERED INDEX NCIX_ProductCategory  
	ON Products(ProductID, CategoryID)
	INCLUDE (ProductName); --Covering Index improves performance with a cost of overhead when data is entered or modified

SELECT * FROM Products WHERE ProductName = 'Chai';