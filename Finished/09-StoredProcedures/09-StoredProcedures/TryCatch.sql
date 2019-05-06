Use Northwind;
Go
IF EXISTS ( SELECT * FROM   sysobjects 
            WHERE  id = object_id(N'Labs.spDivideNumbers') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	Drop Procedure Labs.spDivideNumbers;
Go

Create Procedure Labs.spDivideNumbers
	@num1 as Int = 0,
	@num2 As int = 0
As
	Begin Try
		Declare @total int = (@num1/@num2);
		Select @total;
	End Try
	Begin Catch
		Select Error_number() as ErrorNumber,
			   ERROR_MESSAGE() as ErrorMessage,
			   ERROR_SEVERITY() As ErrorSeverity,
			   ERROR_STATE() As ErrorState
	End Catch
Go

Exec Labs.spDivideNumbers 10,2
Exec Labs.spDivideNumbers 10,0