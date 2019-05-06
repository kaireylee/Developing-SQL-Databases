Use Northwind;
Go

SELECT Address, City, Region, PostalCode
FROM  Customers
WHERE Region = 'CA';

CREATE INDEX CustomerRegion
ON Customers (Region)
Where Region='CA';