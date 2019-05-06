Use Northwind;
Go

If Object_ID('Labs.fnTotalOnOrder','FN') IS Not Null
	Drop Function Labs.fnTotalOnOrder;
Go
If Object_ID('Labs.fnGetCategoryID','FN') IS Not Null
	Drop Function Labs.fnGetCategoryID;
Go

Create Function Labs.fnTotalOnOrder(@Category int)
Returns Int
As
Begin
	Declare @total SmallMoney;
	
	Select @total=Sum(UnitPrice * UnitsOnOrder)
	From Products
	Where CategoryID = @Category

	If (@total Is null)
		Set @total = 0;

	Return @total;
End;
Go

Create Function Labs.fnGetCategoryID(@CategoryName VarChar(50))
	Returns Int
As
Begin
	Return (Select CategoryID 
			From Categories 
			Where CategoryName = @CategoryName)
End;
Go