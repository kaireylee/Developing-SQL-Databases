Use Northwind;
Go

SELECT Customers.CompanyName, Orders.OrderDate, Products.ProductName, [Order Details].UnitPrice, [Order Details].Quantity, Categories.CategoryName, Suppliers.CompanyName AS Expr1
FROM   Orders INNER JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID INNER JOIN
        [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
        Products ON [Order Details].ProductID = Products.ProductID INNER JOIN
        Categories ON Products.CategoryID = Categories.CategoryID INNER JOIN
        Suppliers ON Products.SupplierID = Suppliers.SupplierID
Where Customers.Country = 'USA'
OPTION (Merge Join)
--OPTION (Hash Join)
--OPTION (Loop Join)