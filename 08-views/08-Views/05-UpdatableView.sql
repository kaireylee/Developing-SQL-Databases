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

SELECT * FROM vwEmployee;

UPDATE vwEmployee 
	SET LastName = 'Baggins', 
		FirstName = 'Frodo',
		Title = 'Ring Bearer' 
	WHERE EmployeeID = 5;

SELECT * FROM vwEmployee;

DROP VIEW vwEmployee;