Create Database LabData;
Go

Use LabData;
Go

Create Table CustomerTransaction
(
	CustomerID int Identity(1,1) Primary Key,
	CustomerName varChar(10) Not Null
);

Begin Try
	Begin Transaction;
	Insert Into CustomerTransaction (CustomerName) Values ('AnyWare');
	Insert Into CustomerTransaction (CustomerName) Values ('ISInc');
	
	Select * From CustomerTransaction;
	--Create An Transaction Error
	Insert Into CustomerTransaction (CustomerName) Values ('123456789012');

	Commit Transaction;
End Try
Begin Catch
	Select Error_Number() As Number,
		   Error_Message() As [Message];
	RollBack Transaction;
End Catch

Select * From CustomerTransaction;
Drop Table CustomerTransaction;


