
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
