Use Northwind;
Go

If Object_ID('Labs.fnTopProductsBySupplier','FN') IS Not Null
	Drop Function Labs.fnTopProductsBySupplier;
Go

Create Function Labs.fnTopProductsBySupplier(@SupplierID int)
	Returns Table
As
	Return Select Top(3) ProductID,ProductName,UnitPrice
		   From Products
		   Where SupplierID = @SupplierID
		   Order By UnitPrice Desc
Go

