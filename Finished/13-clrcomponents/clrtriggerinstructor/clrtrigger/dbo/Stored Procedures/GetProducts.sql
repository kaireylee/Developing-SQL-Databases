
Create Procedure dbo.GetProducts
	@CatID int
AS
	Select ProductID,ProductName,SupplierID,
		   UnitPrice,UnitsInStock,UnitsOnOrder,
		   ReorderLevel,Discontinued
	From Products
	Where CategoryID = @CatID
	Order By ProductName
