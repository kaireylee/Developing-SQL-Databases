Use Northwind;
Go

SELECT Customers.CompanyName, Orders.OrderDate, Products.ProductName, [Order Details].UnitPrice, 
		[Order Details].Quantity, Categories.CategoryName, Suppliers.CompanyName AS SupplierName,
		Customers.Region
FROM   Orders INNER JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID INNER JOIN
        [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
        Products ON [Order Details].ProductID = Products.ProductID INNER JOIN
        Categories ON Products.CategoryID = Categories.CategoryID INNER JOIN
        Suppliers ON Products.SupplierID = Suppliers.SupplierID
Where Customers.Country = 'USA'

SELECT Customers.CompanyName, Orders.OrderDate, Products.ProductName, [Order Details].UnitPrice, 
		[Order Details].Quantity, Categories.CategoryName, Suppliers.CompanyName AS SupplierName,
		Customers.Region
FROM   Orders INNER JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID INNER JOIN
        [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
        Products ON [Order Details].ProductID = Products.ProductID INNER JOIN
        Categories ON Products.CategoryID = Categories.CategoryID INNER JOIN
        Suppliers ON Products.SupplierID = Suppliers.SupplierID
Where Customers.Country = 'USA'
Order By Customers.Region