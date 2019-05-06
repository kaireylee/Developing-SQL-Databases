Use Northwind;
Go

Declare @count int;
Exec spGetCustomerCountByCountry 'USA', @count Output
Select @count;

