Use Northwind;
GO
IF EXISTS ( SELECT * FROM   sysobjects 
            WHERE  id = object_id(N'spGetCustomerCountByCountry') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	Drop Procedure spGetCustomerCountByCountry;
Go
