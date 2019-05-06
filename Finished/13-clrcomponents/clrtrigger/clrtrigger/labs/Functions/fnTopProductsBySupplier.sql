
Create Function Labs.fnTopProductsBySupplier(@SupplierID int)
	Returns Table
As
	Return Select Top(3) ProductID,ProductName,UnitPrice
		   From Products
		   Where SupplierID = @SupplierID
		   Order By UnitPrice Desc
