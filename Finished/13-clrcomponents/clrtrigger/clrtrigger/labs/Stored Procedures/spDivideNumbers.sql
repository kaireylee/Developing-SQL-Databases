
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
