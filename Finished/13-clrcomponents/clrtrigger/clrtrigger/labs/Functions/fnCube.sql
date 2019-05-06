
Create Function Labs.fnCube(@num decimal)
	returns decimal
As
	Begin
		return @num * @num *@num;
	End
