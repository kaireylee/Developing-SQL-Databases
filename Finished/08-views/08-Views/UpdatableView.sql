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

Update vwEmployee
	Set LastName='New Name'
	Where EmployeeID = 2
Go

Insert Into vwEmployee
		(FirstName,LastName,Title)
Values	('Dell','Payne','Instructor')
Go

Select * From Employees;

Delete From vwEmployee Where EmployeeID = 12;
Go
Select * From Employees;

Drop View vwEmployee;