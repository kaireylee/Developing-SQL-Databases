USE Northwind;
GO

/*
 Updating statistics ensures that queries compile with up-to-date statistics,
 providing a current plan; however, updating statistics causes queries to 
 recompile. We recommend not updating statistics too frequently.
*/
--UPDATE STATISTICS Customers CompanyName WITH FULLSCAN; --Last resource to fix issues with query 
--GO

--SET SHOWPLAN_TEXT ON
--SET SHOWPLAN_TEXT OFF

--SET SHOWPLAN_ALL ON
--SET SHOWPLAN_ALL OFF

--SET SHOWPLAN_XML ON
--SET SHOWPLAN_XML OFF

--SET STATISTICS IO ON
--SET STATISTICS IO OFF

--SET STATISTICS XML ON -- The is the recommended option to use
--SET STATISTICS XML OFF
GO

SELECT Customers.CompanyName, Customers.ContactName, Orders.OrderDate, 
       Orders.RequiredDate, Products.ProductName, [Order Details].UnitPrice, 
	   [Order Details].Quantity
FROM   Customers INNER JOIN
            Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
            [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
            Products ON [Order Details].ProductID = Products.ProductID
Go
