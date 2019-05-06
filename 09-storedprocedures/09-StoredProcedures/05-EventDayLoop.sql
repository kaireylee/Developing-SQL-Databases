use Northwind;
Go

IF EXISTS ( SELECT * FROM   sysobjects 
            WHERE  id = object_id(N'Labs.spGetEventDates') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	Drop Procedure Labs.spGetEventDates;
Go
