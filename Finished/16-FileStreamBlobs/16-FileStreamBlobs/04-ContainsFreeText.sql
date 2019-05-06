USE Northwind;
GO

CREATE FULLTEXT CATALOG NorthwindCatalog;
GO

Create Unique Index EmployeeNotes On Employees(EmployeeID);
Go

CREATE FULLTEXT INDEX ON Employees (Notes LANGUAGE 1033)
	KEY INDEX EmployeeNotes ON NorthwindCatalog;
GO

Select EmployeeId, Notes 
From Employees
Where Contains(Notes,'German');

Declare @search VarChar(50);
Set @search = 'food' --sales
Select EmployeeId, Notes
From Employees
Where FreeText(Notes,@search);

