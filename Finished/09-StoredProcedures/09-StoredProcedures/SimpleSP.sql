Use Northwind;
Go

CREATE PROCEDURE Labs.spGetCustomers 
 --Parameters
AS
    Select * From Customers;
RETURN 
Go

Exec labs.spGetCustomers;

Drop Procedure Labs.spGetCustomers
Go