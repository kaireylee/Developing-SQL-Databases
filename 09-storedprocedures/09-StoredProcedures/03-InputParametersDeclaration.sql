Use Northwind;
GO
IF EXISTS ( SELECT * FROM   sysobjects 
            WHERE  id = object_id(N'Labs.spGetCustomerOrdersByDate') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	Drop Procedure Labs.spGetCustomerOrdersByDate;
Go