USE Northwind;
GO

SELECT Customers.CustomerID, Customers.CompanyName, Customers.City, Customers.Country, 
       Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate
FROM   Customers INNER JOIN
          Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.City = 'Anchorage'
ORDER BY Customers.City
OPTION (MERGE JOIN);


SELECT Customers.CustomerID, Customers.CompanyName, Customers.City, Customers.Country, 
       Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate
FROM   Customers INNER JOIN
          Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.City = 'Anchorage'
ORDER BY Customers.City
OPTION (Loop JOIN);


SELECT Customers.CustomerID, Customers.CompanyName, Customers.City, Customers.Country, 
       Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate
FROM   Customers INNER JOIN
          Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.City = 'Anchorage'
ORDER BY Customers.City
OPTION (HASH JOIN);