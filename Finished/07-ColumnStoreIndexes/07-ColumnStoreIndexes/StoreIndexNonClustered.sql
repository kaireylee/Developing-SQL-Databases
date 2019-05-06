Use LabData;
Go

Create Table EmployeeColumnStore
(
	EmployeeId int identity(1,1) Primary Key,
	FirstName varchar(25),
	LastName varchar(25),
	Title varchar(50),
	HireDate dateTime
);
Go

Create Nonclustered ColumnStore Index Employee_column_Index
	On EmployeeColumnStore (FirstName,LastName,Title,HireDate);
Go

Select * From EmployeeColumnStore;
Drop Table EmployeeColumnStore;
Go