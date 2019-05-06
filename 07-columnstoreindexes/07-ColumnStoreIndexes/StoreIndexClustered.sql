Use LabData;
Go

Create Table EmployeeColumnStoreClustered
(
	EmployeeId int identity(1,1),
	FirstName varchar(25),
	LastName varchar(25),
	Title varchar(50),
	HireDate dateTime
);
Go

Create Clustered ColumnStore Index Employee_column_Index
	On EmployeeColumnStoreClustered 
Go

Select * From EmployeeColumnStoreClustered;
Drop Table EmployeeColumnStoreClustered;
Go