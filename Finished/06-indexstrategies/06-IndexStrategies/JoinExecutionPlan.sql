Use Northwind;
Go
SELECT Customers.CompanyName, Customers.ContactName, Customers.Country, Orders.OrderDate, Orders.ShipName, [Order Details].UnitPrice, [Order Details].Quantity, Products.ProductName, Suppliers.CompanyName AS Expr1, 
       Shippers.CompanyName AS Expr2
FROM   Customers INNER JOIN
            Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
            [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
            Products ON [Order Details].ProductID = Products.ProductID INNER JOIN
            Shippers ON Orders.ShipVia = Shippers.ShipperID INNER JOIN
            Suppliers ON Products.SupplierID = Suppliers.SupplierID
Where Customers.Country = 'USA'
Order By Customers.CompanyName 


