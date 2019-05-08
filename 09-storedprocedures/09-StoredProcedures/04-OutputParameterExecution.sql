Use Northwind;
Go

DECLARE @Count int;
DECLARE @Country varchar(25) = 'USA'
EXEC Labs.spCustomerCountByCountry @Country, @Count Output
SELECT @Count AS CustomerCount