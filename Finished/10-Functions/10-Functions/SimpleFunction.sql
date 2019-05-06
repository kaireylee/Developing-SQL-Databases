Use Northwind;
Go

Create Function Labs.fnCube(@num decimal)
	returns decimal
As
	Begin
		return @num * @num *@num;
	End
Go

Select Labs.fnCube(3);

--Drop Function Labs.fnCube;
Go