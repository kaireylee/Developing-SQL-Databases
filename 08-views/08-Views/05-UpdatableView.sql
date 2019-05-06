Use Northwind;
Go

Create View vwEmployee
As
	Select EmployeeId, 
		   FirstName,
		   LastName,
		   Title,
		   Region
	From Employees
Go
