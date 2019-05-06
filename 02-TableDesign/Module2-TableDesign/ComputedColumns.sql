Use LabData;
Go

Begin Try
	Create Table Employee (
		EmployeeId int,
		FirstName varchar(25),
		LastName varchar(25), --Persisted = updates when the data is queried for
		FullName as (FirstName + ' ' + LastName) Persisted --Type is based on the subtypes of the data being computed
	);

	Insert Into Employee (EmployeeId, FirstName, LastName) Values (1 ,'Robert', 'Baratheon');
	Insert Into Employee (EmployeeId, FirstName, LastName) Values (2, 'Tywin', 'Lannister');

	Select * From Employee; 

	Drop Table Employee; 
End Try
Begin Catch
	Print(Error_Message());
End Catch
