
Create Function Labs.fnGetCategoryID(@CategoryName VarChar(50))
	Returns Int
As
Begin
	Return (Select CategoryID 
			From Categories 
			Where CategoryName = @CategoryName)
End;
