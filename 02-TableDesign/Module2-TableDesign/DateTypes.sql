Use LabData; 
Go

Begin Try 
	--Production Code
	Declare @goodDate DateTime = '20190506 23:59:59';
	Declare @badDate DateTime = '20190532';

	Select @goodDate As Today,
	       @badDate As NotADate
End Try 

Begin Catch
	--Error Handling 
	Select ERROR_MESSAGE() As ErrorMessage;
End Catch 