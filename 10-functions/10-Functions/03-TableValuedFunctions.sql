Use Northwind;
Go

If Object_ID('Labs.fnTopProductsBySupplier','FN') IS Not Null
	Drop Function Labs.fnTopProductsBySupplier;
Go

--find top producing producers, Suppliers / Products

CREATE FUNCTION Labs.fnTopProductsBySupplier(@supplierID int, @Top int)
	RETURNS TABLE	
AS
	RETURN (
		SELECT TOP(@Top)
			p.ProductID,
			p.ProductName,
			p.UnitPrice
		FROM Products p
		WHERE SupplierID = @supplierID
		ORDER BY UnitPrice DESC
	)
		
GO