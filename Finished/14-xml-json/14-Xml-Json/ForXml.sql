Use Northwind;
Go

Select EmployeeId, FirstName, LastName, Title, HireDate
From Employees
For XML Auto;

Select EmployeeId, 
	   FirstName, 
	   LastName, 
	   Title, 
	   Convert(VarChar,HireDate,101) As Hired
From Employees
For XML Raw('Employee'), Root('Employees'), Elements;

Select EmployeeId, 
	   FirstName, 
	   LastName, 
	   Title, 
	   Convert(VarChar,HireDate,101) As Hired
From Employees
For XML Raw('Employee'), Root('Employees'), Elements, XmlSchema;