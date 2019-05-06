Use Northwind;
Go
--Step One
Create FullText Catalog NorthwindCatalog
Go

Create Unique Index EmployeeNotes On Employees(EmployeeID);
Go

--Step Two
Create FullText Index On Employees
	(Notes Language 1033)
Key Index EmployeeNotes On NorthwindCatalog
Go

--Step Three
Select EmployeeId, notes 
From Employees 
Where Contains(Notes,'degree');

Select EmployeeId, notes 
From Employees 
Where Contains(Notes,'college');

--Drop FullText From Employee Table in Object Explorer
--Delete the Employee Notes from Index Collection

--Drop Catalog
Drop FullText Catalog NorthwindCatalog;
