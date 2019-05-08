Use Northwind;
Go

SELECT * FROM Labs.fnTopProductsBySupplier(2, 10)

SELECT 
	s.SupplierID, 
	s.CompanyName,
	p.ProductName,
	p.UnitPrice
FROM Suppliers s
	CROSS APPLY Labs.fnTopProductsBySupplier(2, 10) AS p --similar to inner join can invoke a function / CROSS OUTER APPLY = LEFT JOIN 

