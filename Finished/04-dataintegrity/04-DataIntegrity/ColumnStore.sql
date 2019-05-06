Use LabData;
Go

Create Table EmployeeColumnStore
(
	EmployeeID Int Identity(1,1) Primary Key,
	FirstName VarChar(25),
	LastName VarChar(25),
	Title VarChar(50),
	HireDate DateTime
);
Go

Select * From EmployeeColumnStore;

CREATE NONCLUSTERED COLUMNSTORE INDEX Employee_Column_Index
ON dbo.EmployeeColumnStore
(FirstName, LastName, Title, HireDate);
Go

Select * From EmployeeColumnStore;

Drop Table EmployeeColumnStore;