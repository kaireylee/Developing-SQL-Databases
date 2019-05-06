Use Northwind;
Go

Begin Transaction
	Update Customers 
		Set CompanyName='What??';
	Select * From Customers;	
	
	WaitFor Delay '00:00:15';
Rollback;

Select * From Customers;