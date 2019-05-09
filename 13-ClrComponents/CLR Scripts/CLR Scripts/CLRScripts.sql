--https://dba.stackexchange.com/questions/74248/migrating-clr-assemblies
--CLR info on stack exchanges

USE Northwind;
GO

SELECT dbo.HelloWorld()

EXEC dbo.CLRGetCustomersByCountry 'USA'
