Use Northwind;
Go

Create View vwAllPeople
As
	Select ContactName As Person,
		   ContactTitle As Title,
		   'Customer' As PersonType
	From Customers
Union
	Select FirstName + ' ' + LastName As Person,
		   Title,
		   'Employee' As PersonType
	From Employees
Go

Select * From vwAllPeople
Order By PersonType Desc;

Drop View vwAllPeople;