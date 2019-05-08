Use Northwind;
GO
IF EXISTS ( SELECT * FROM   sysobjects 
            WHERE  id = object_id(N'Labs.spGetCustomerCountByCountry') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	Drop Procedure Labs.spGetCustomerCountByCountry;
Go

ALTER PROCEDURE Labs.spCustomerCountByCountry
	@Country varchar(25),
	@CustomerCount int OUTPUT
AS
	SELECT @CustomerCount = Count(*)
	FROM Customers c
	WHERE Country = @Country
	
GO

