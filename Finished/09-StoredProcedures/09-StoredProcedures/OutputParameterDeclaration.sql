Use Northwind;
GO
IF EXISTS ( SELECT * FROM   sysobjects 
            WHERE  id = object_id(N'spGetCustomerCountByCountry') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	Drop Procedure spGetCustomerCountByCountry;
Go

Create Procedure spGetCustomerCountByCountry
	@Country VarChar(50),
	@CustomerCount int Output
As
	Select @CustomerCount = Count(*)
	From Customers
	Where Country = @Country;
Go

