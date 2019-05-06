Use Northwind;
Go

Begin Transaction
	Update Customers 
		Set CompanyName='What??';
	
	WaitFor Delay '00:00:15';
Rollback